Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8BD426BB9
	for <lists+dri-devel@lfdr.de>; Fri,  8 Oct 2021 15:33:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEFAE6F4FD;
	Fri,  8 Oct 2021 13:33:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AA976F4FD
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Oct 2021 13:33:26 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id n64so13829230oih.2
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Oct 2021 06:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WoGewCiLqk1L6y+Pgt2DJrjP+8ghH7hEUaGntIWrC6s=;
 b=pBBPhlBaaQ/+9BTkC8YQaIzxZUjhoP5gpNMQgN77vY9v2h7jlzVCbinDSYFVpy6ndp
 Ws/ti+bseFbbE03/vlU7RLpGr+ZmLeFD+9aZUzyKl5KiA1kwk0kGXLgzHtr8zBWYn8xi
 q4ybMOkh/x97fGCnjftfaUtNefTClMrA9CrF8PLx03L/5AatozRBMZJfDQaaGckjkYph
 j0hLuo22LwIe+w52ooreptbTrMgPdlu/1FLlleiZxaowcIgR9Y3QK1tVQF4VFXn2kiwC
 /CEI1mjKgHU0X1rWDCt2RP121DdUPklm+JYOoNFXNvxwK1LKfV6mI6GyhI2lERLEg2ND
 DhNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WoGewCiLqk1L6y+Pgt2DJrjP+8ghH7hEUaGntIWrC6s=;
 b=LnBK9r7ts+pgGkJkvmI3t6MJysRtp+nzGKSsTYpMFCXtstnSzu0+LPGc0uVph6QBG4
 KhSy/M5qoUMdbOaC030GfdABBFcZavi4lOMYDUDCVt30yBWL5/YmQHymuj7rkf5f5DZd
 oSdsmA/9BDskW++yTHi1G9a8aDHiPfAIvVfo9Atz/GGSeWsasSq5j1D8x0K1kvkecQHY
 aVQCWpr7VhXMjbnsXZLHTkTVUoIR1pXM9RHEaEYgY4gOp1+At141kQq3ldctQSJIpvtx
 cej4QfbIr/vYdaEwub6VezYQtayKh20vaxXvWUHzfKf2Ct4E8OqTJJ9RxaIHR5Hp15Q9
 8PYg==
X-Gm-Message-State: AOAM533slFQd6vrzLz4nX6BhOldXyvnb7j9kk3NJjDeybhwg4GBdvcPM
 K9GVLIYfMEnTJj/Iam2/Kim0iv0b64a4jumTI0hdGzoL
X-Google-Smtp-Source: ABdhPJzqOPRwfbVyLwZGp7MkC4sShrKrhfIK/YsbRKO8AG2yd7R+50aZOrvJPgTLoJY6/jZl+GNohd1/SRi0OGXehm4=
X-Received: by 2002:a05:6808:15:: with SMTP id
 u21mr16376940oic.129.1633700005586; 
 Fri, 08 Oct 2021 06:33:25 -0700 (PDT)
MIME-Version: 1.0
References: <20211007235310.14626-1-chunkuang.hu@kernel.org>
In-Reply-To: <20211007235310.14626-1-chunkuang.hu@kernel.org>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Fri, 8 Oct 2021 15:33:14 +0200
Message-ID: <CAFqH_51hO2efxbQkkbzNHSk92zOZGeFJBu4Ocijk_cpxFDJ2fw@mail.gmail.com>
Subject: Re: [PATCH 0/5] Revert series "CMDQ refinement of Mediatek DRM driver"
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Chun-Kuang,

Thank you to take time to send this, for full series

Tested-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

Display is now working again.

Thanks,
  Enric


Missatge de Chun-Kuang Hu <chunkuang.hu@kernel.org> del dia dv., 8
d=E2=80=99oct. 2021 a les 1:53:
>
> Commit c1ec54b7b5af
> ("drm/mediatek: Use mailbox rx_callback instead of cmdq_task_cb")
> would cause numerous mtk cmdq mailbox driver warning:
>
> WARNING: CPU: 0 PID: 0 at drivers/mailbox/mtk-cmdq-mailbox.c:198
> cmdq_task_exec_done+0xb8/0xe0
>
> So revert that patch and all the patches depend on that patch.
>
> Chun-Kuang Hu (5):
>   Revert "drm/mediatek: Clear pending flag when cmdq packet is done"
>   Revert "drm/mediatek: Add cmdq_handle in mtk_crtc"
>   Revert "drm/mediatek: Detect CMDQ execution timeout"
>   Revert "drm/mediatek: Remove struct cmdq_client"
>   Revert "drm/mediatek: Use mailbox rx_callback instead of cmdq_task_cb"
>
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 157 ++++--------------------
>  1 file changed, 24 insertions(+), 133 deletions(-)
>
> --
> 2.25.1
>
