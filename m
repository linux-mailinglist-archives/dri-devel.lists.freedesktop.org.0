Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D1A5A1D1F
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 01:26:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D146210E574;
	Thu, 25 Aug 2022 23:25:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0106710E574
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 23:25:49 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 04BEE61D3B
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 23:25:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 694ECC433D7
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 23:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661469948;
 bh=gANNeo5xFLWx50TpQgTmSD/ajuMSXdn3OaPyPmhxXLU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=tIjYGOQqVzSB18XFBZDqzuEERpxgkNSETElSZ7o1WjHeCgh94xGTf3IfOLKBp7nQy
 m6mlX1GR5rsIDMZtmYmMNZ3SUcqynZIIk4y8hRuncuizi3nkLoSxICTv2zdsfJBgsS
 HzPnhpI6YM26VGx9LJqNDIS7KyY/fRR6Mf/bOZ9Y3HA2NF6h1/DzzsS29Xq/gURX8W
 +cdfD0P9BFXfz3y61EBOwJ1IrOWto5e+S7QI4LZcowMDFqh2qnZ4mY8e/9ANexfiRP
 hxXdNl/KdlbWLAucLx4NQOk3+rFZXPDZYVFNssN1sfmq2HeT5i6p2VA1xHDGz1o13s
 7sDqb94lT2SEA==
Received: by mail-oi1-f172.google.com with SMTP id v125so114301oie.0
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 16:25:48 -0700 (PDT)
X-Gm-Message-State: ACgBeo3AgaloF+hcxgZ6CJdUlO/iZMbXbpteAJ3jWcxcB24JTxeEYt/e
 MwgJ2Jqxa46soeTxWZsCZUWFB8XhLNMKd1wJbw==
X-Google-Smtp-Source: AA6agR6/OpIOZrEsWat8SQRwRTVdbJeXbdtydW5Eboufpp739coHjJXCokAIiHdL3oK9fM+r9I0g37gU99hljRaQqhQ=
X-Received: by 2002:a54:4405:0:b0:343:23df:4ac5 with SMTP id
 k5-20020a544405000000b0034323df4ac5mr519363oiw.69.1661469947573; Thu, 25 Aug
 2022 16:25:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220812205746.609107-1-mairacanal@riseup.net>
 <20220812205746.609107-3-mairacanal@riseup.net>
In-Reply-To: <20220812205746.609107-3-mairacanal@riseup.net>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 26 Aug 2022 07:25:35 +0800
X-Gmail-Original-Message-ID: <CAAOTY__aE+dZ=GDOQN+Yeh9MzDrFnK71E36NGe0gb17hNXgE8w@mail.gmail.com>
Message-ID: <CAAOTY__aE+dZ=GDOQN+Yeh9MzDrFnK71E36NGe0gb17hNXgE8w@mail.gmail.com>
Subject: Re: [PATCH 2/5] drm/mediatek: Drop of_gpio header
To: =?UTF-8?B?TWHDrXJhIENhbmFs?= <mairacanal@riseup.net>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Maxime Ripard <maxime@cerno.tech>, Matthias Brugger <matthias.bgg@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Maira:

Ma=C3=ADra Canal <mairacanal@riseup.net> =E6=96=BC 2022=E5=B9=B48=E6=9C=881=
3=E6=97=A5 =E9=80=B1=E5=85=AD =E5=87=8C=E6=99=A84:58=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> These drivers include the deprecated OF GPIO header <linux/of_gpio.h>
> yet fail to use symbols from it, so drop the include.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: linux-mediatek@lists.infradead.org
> Signed-off-by: Ma=C3=ADra Canal <mairacanal@riseup.net>
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c  | 1 -
>  drivers/gpu/drm/mediatek/mtk_hdmi.c | 1 -
>  2 files changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediate=
k/mtk_dpi.c
> index 630a4e301ef6..508a6d994e83 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -11,7 +11,6 @@
>  #include <linux/media-bus-format.h>
>  #include <linux/of.h>
>  #include <linux/of_device.h>
> -#include <linux/of_gpio.h>
>  #include <linux/of_graph.h>
>  #include <linux/pinctrl/consumer.h>
>  #include <linux/platform_device.h>
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediat=
ek/mtk_hdmi.c
> index 3196189429bc..4c80b6896dc3 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> @@ -16,7 +16,6 @@
>  #include <linux/mutex.h>
>  #include <linux/of_platform.h>
>  #include <linux/of.h>
> -#include <linux/of_gpio.h>
>  #include <linux/of_graph.h>
>  #include <linux/phy/phy.h>
>  #include <linux/platform_device.h>
> --
> 2.37.1
>
