Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F33C46B6795
	for <lists+dri-devel@lfdr.de>; Sun, 12 Mar 2023 16:41:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B30A210E352;
	Sun, 12 Mar 2023 15:41:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29D8010E352
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Mar 2023 15:41:47 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9714660F5A
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Mar 2023 15:41:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C75AC433A7
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Mar 2023 15:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678635705;
 bh=o9txECpxOStZ4lEk7MbenubZLU/t1F2jRrj8TI3/DK4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=nICM0YirOa0QJ1qDKCG0Tn9jcP5bqDn7WJWLOMSN9+FhpIqOrA5Jwqj+V2Pe7h+dE
 Z6KyiJjlJdoQIQE1TAyVSa/BHs/4n/sWkEAj7kElaFFWC4m4IiNkxeN3nUl2hO7jim
 IcfHPmWB/iFUwf/IalB4FFL8qBZlcqt4r5e45R3oK5IIyk+gsxrW0MG0WO0TkJpPS4
 65/8aLmA2gJdk6uw5fo5+Buz0J5D23sQ5ca2gCoBi9T7S7ZBMWeRxIKTGaxRzcCkiQ
 gpu2SYRnq3MsY3vsdiMTpsW/0b3UMtN7cYKetDlTeTZiPesHsimy8bFv+gXZNq8Qz9
 yJT7UPPowMygA==
Received: by mail-lj1-f175.google.com with SMTP id h3so10178495lja.12
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Mar 2023 08:41:45 -0700 (PDT)
X-Gm-Message-State: AO0yUKUH+cmeglts5Sz1LEHGbjYlTKg1HR+QqQQTjnAQd4TNZVOvKxri
 dykZOulh0KC/z96t8UwLipGRShgAJ73YLQhKEw==
X-Google-Smtp-Source: AK7set/JnYxeve0nDAXri0t02WExqjWC+ImSGEpC8YZHj1h3xzkeP8L25/oKwG9AWC1n3SNm1DT/3bGQ08Fc1lFbtAQ=
X-Received: by 2002:a05:651c:336:b0:293:2f6e:91bf with SMTP id
 b22-20020a05651c033600b002932f6e91bfmr9669363ljp.7.1678635703439; Sun, 12 Mar
 2023 08:41:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230202045734.2773503-1-wenst@chromium.org>
In-Reply-To: <20230202045734.2773503-1-wenst@chromium.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 12 Mar 2023 23:41:31 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8yhi2Vd01ph-W0HOmULs=tC5yARi_89Wddei=BTo5VKg@mail.gmail.com>
Message-ID: <CAAOTY_8yhi2Vd01ph-W0HOmULs=tC5yARi_89Wddei=BTo5VKg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/mediatek: dp: Only trigger DRM HPD events if
 bridge is attached
To: Chen-Yu Tsai <wenst@chromium.org>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Guillaume Ranquet <granquet@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Chen-Yu:

Chen-Yu Tsai <wenst@chromium.org> =E6=96=BC 2023=E5=B9=B42=E6=9C=882=E6=97=
=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=8812:57=E5=AF=AB=E9=81=93=EF=BC=9A
>
> The MediaTek DisplayPort interface bridge driver starts its interrupts
> as soon as its probed. However when the interrupts trigger the bridge
> might not have been attached to a DRM device. As drm_helper_hpd_irq_event=
()
> does not check whether the passed in drm_device is valid or not, a NULL
> pointer passed in results in a kernel NULL pointer dereference in it.
>
> Check whether the bridge is attached and only trigger an HPD event if
> it is.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Fixes: f70ac097a2cf ("drm/mediatek: Add MT8195 Embedded DisplayPort drive=
r")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Guillaume Ranquet <granquet@baylibre.com>
> ---
> Changes since v1
> - Dropped prerequisite-patch-ids
> - Added Guillaume's Reviewed-by
>
> This applies on top of mediatek-drm-next.
>
>  drivers/gpu/drm/mediatek/mtk_dp.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek=
/mtk_dp.c
> index 1f94fcc144d3..a82f53e1a146 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> @@ -1823,7 +1823,8 @@ static irqreturn_t mtk_dp_hpd_event_thread(int hpd,=
 void *dev)
>         spin_unlock_irqrestore(&mtk_dp->irq_thread_lock, flags);
>
>         if (status & MTK_DP_THREAD_CABLE_STATE_CHG) {
> -               drm_helper_hpd_irq_event(mtk_dp->bridge.dev);
> +               if (mtk_dp->bridge.dev)
> +                       drm_helper_hpd_irq_event(mtk_dp->bridge.dev);
>
>                 if (!mtk_dp->train_info.cable_plugged_in) {
>                         mtk_dp_disable_sdp_aui(mtk_dp);
> --
> 2.39.1.456.gfc5497dd1b-goog
>
