Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A699B67E8B6
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 15:55:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D966910E966;
	Fri, 27 Jan 2023 14:55:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B24A010E971
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 14:55:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 69053B8212C
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 14:55:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A1E2C433EF
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 14:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674831340;
 bh=HvNrME+MM8yn4e0AkTN+4TlH0dGTPBFUw82z5J9q42o=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=BdOJeA81z8ETj4H1loxExyGMkjmJU71jtbn48u+zJKPN3npJkLLrD1DTEzUDyITfh
 HDqTrjXvFpiXuIEuPBw7xP+bQB9UR3OKcBZE0Wj/jO/o2DOm/GpsZdFzd+ezW+6aVY
 f7vkv2VfyHsdtcELdVnqBZgKL0QiRw8bCP2POSD0+CpoJrqlBwp8PfKmahn0PF+jjF
 HYYg55akVUd+tMg51h5/kAo8OV5jd8bVZJki/YUmBOxUtU7/k6Lgfiay4apwLTfT9S
 0QvmA/4vc5njTRfs5fd7yf1UrbXlYNPr4ZVd1HvysynF6AuxpKgStRD4NXfSxBX4CW
 6qEPoZsjkkPcg==
Received: by mail-lf1-f45.google.com with SMTP id w11so8496224lfu.11
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 06:55:40 -0800 (PST)
X-Gm-Message-State: AFqh2krBi2FS2Wldscl4v8aG4/FXYWjOT9z0W1fS2ykEIbOXK0Q1zaKV
 B4jWWr1sOTzYO0k3YS0R7BtQSYIEK8ssuU3Hyg==
X-Google-Smtp-Source: AMrXdXt+OmlRKcer++n7fCu4l2zdWFvwQbkW53r+2SZjCqH0XMEpiXMeFESigK5NF723T8csDUcyNE8hgDt/kcl9nxk=
X-Received: by 2002:a05:6512:1105:b0:4cb:f29:e2b0 with SMTP id
 l5-20020a056512110500b004cb0f29e2b0mr3003381lfg.404.1674831338572; Fri, 27
 Jan 2023 06:55:38 -0800 (PST)
MIME-Version: 1.0
References: <20221205095115.2905090-1-ruanjinjie@huawei.com>
 <378232f4-5c2e-ad56-c4ec-4d9f72f08755@collabora.com>
In-Reply-To: <378232f4-5c2e-ad56-c4ec-4d9f72f08755@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 27 Jan 2023 22:55:26 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9aQnkWvLjaoxRsHStpfeK5v72XkNd7aCw-MbCLVQewUA@mail.gmail.com>
Message-ID: <CAAOTY_9aQnkWvLjaoxRsHStpfeK5v72XkNd7aCw-MbCLVQewUA@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: mtk_drm_crtc: Add checks for devm_kcalloc
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: chunkuang.hu@kernel.org, ruanjinjie <ruanjinjie@huawei.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 seanpaul@chromium.org, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Ruanjinjie:

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> =E6=96=
=BC
2022=E5=B9=B412=E6=9C=885=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=887:5=
3=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Il 05/12/22 10:51, ruanjinjie ha scritto:
> > As the devm_kcalloc may return NULL, the return value needs to be check=
ed
> > to avoid NULL poineter dereference.
> >
> > Fixes: 31c5558dae05 ("drm/mediatek: Refactor plane init")
> > Signed-off-by: ruanjinjie <ruanjinjie@huawei.com>
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
>
