Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE5C41DB3C
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 15:37:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 204D26EB90;
	Thu, 30 Sep 2021 13:37:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C2CD6EB90
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 13:37:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 53B4C611C7
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 13:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633009033;
 bh=QYlLL3GDBPrVtkL8isJVyF2sdgxesbQ3gmGxtfmFI40=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=f6RXt16nHgtRnn5V9OGkZ/EXJnCTBs2ZoX85ae+fNGKqfNJZmIV9Ywha/cM/AXuv9
 Cgc1b6Ew1pPhkeQHfMnqq6IxTgtZIsCMpNhMOEf7x2Z5foiCoMLycqU31NZ89EGKrS
 Td/LtCYlfqF7zEaJlBn9vJIxl9WTrBiICaW+spAI9dt6e6/2qstnrTAi+yP9FH3lT1
 AqwYYGxqaKIcIcyMh5yp6kvkOGFO1/TSoZBoiww9Vu9fDsiPga8B3ERLRvBKUSqW6H
 oOXK49FTTt2N8WRhVYAhTthSb4hSK2Otemu4zNN1PAlnIFqWs6YF79VSZzHcZ76sCP
 DPpQXqOUzrqFw==
Received: by mail-ed1-f47.google.com with SMTP id r18so22116296edv.12
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 06:37:13 -0700 (PDT)
X-Gm-Message-State: AOAM530tULeQ35XnUvXpDWUx5/CIb0aKtKcWcbai01RddRDjB0h/PkEm
 uPOPxU21+k8GHDb5aD8VJhSP87r2yvwIfIbqGg==
X-Google-Smtp-Source: ABdhPJypDb2VkWrdf3paMX9Tqzf51KNdYw6dumy+pE04VPMjkYX0wM15CC9zyo395rIQ9HHurwSkXhmuwWRQT+vaaEg=
X-Received: by 2002:a17:906:3181:: with SMTP id
 1mr7127794ejy.388.1633009013939; 
 Thu, 30 Sep 2021 06:36:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210929094425.745-1-granquet@baylibre.com>
 <20210929094425.745-5-granquet@baylibre.com>
In-Reply-To: <20210929094425.745-5-granquet@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 30 Sep 2021 21:36:42 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9tWULx768c9pgnarVj6V1x6d5ZA9U2-hJ3+k2BW+vrAg@mail.gmail.com>
Message-ID: <CAAOTY_9tWULx768c9pgnarVj6V1x6d5ZA9U2-hJ3+k2BW+vrAg@mail.gmail.com>
Subject: Re: [PATCH v1 4/4] drm/mediatek: add mt8195 hdmi TX support
To: Guillaume Ranquet <granquet@baylibre.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
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

Hi, Guillaume:

This is a big patch, and I'm not familiar with this driver, so the
review process would be long. So I tell you about how I review this
patch, and if you could process according to my way, the process would
be more short.

1. Find the common part of all hdmi driver.
Even though mt8195 hdmi has many difference with other mediatek soc
hdmi driver, I would like to find the common part and have just one
copy of the common part. I expect there would three file finally:

mtk_hdmi.c               (the common part)
mtk_hdmi_mt8173.c (each soc special part)
mtk_hdmi_mt8195.c (each soc special part)

But this would be difficult in this stage, so you could temporarily
have these three file:

mtk_hdmi_common.c (the common part)
mtk_hdmi.c                 (each soc special part)
mtk_hdmi_mt8195.c   (each soc special part)

When review is almost done, then change the file name as I wish.

2. The first patch has only basic function, separate advance function
to another patch.
When comparing mt8195 hdmi driver with other hdmi driver, if mt8195
hdmi driver has some function that other hdmi does not have, I would
think that function is advance function and should be separate to
another patch.

If you follow this way, I think the review process would be short.
Because this patch is big, I would just review partial part each time.

Regards,
Chun-Kuang.


Guillaume Ranquet <granquet@baylibre.com> =E6=96=BC 2021=E5=B9=B49=E6=9C=88=
29=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=885:47=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> Add basic hdmi TX support for the mediatek mt8195 SoCs
>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> ---
>  drivers/gpu/drm/mediatek/Kconfig              |   10 +
>  drivers/gpu/drm/mediatek/Makefile             |    4 +-
>  drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.c    | 2293 +++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.h    |  128 +
>  .../gpu/drm/mediatek/mtk_mt8195_hdmi_ddc.c    |  530 ++++
>  .../gpu/drm/mediatek/mtk_mt8195_hdmi_ddc.h    |   20 +
>  .../gpu/drm/mediatek/mtk_mt8195_hdmi_regs.h   |  329 +++
>  7 files changed, 3313 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.c
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.h
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_mt8195_hdmi_ddc.c
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_mt8195_hdmi_ddc.h
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_mt8195_hdmi_regs.h
>
> diff --git a/drivers/gpu/drm/mediatek/Kconfig b/drivers/gpu/drm/mediatek/=
Kconfig
> index 2976d21e9a34a..517d065f0511b 100644
> --- a/drivers/gpu/drm/mediatek/Kconfig
> +++ b/drivers/gpu/drm/mediatek/Kconfig
> @@ -28,3 +28,13 @@ config DRM_MEDIATEK_HDMI
>         select PHY_MTK_HDMI
>         help
>           DRM/KMS HDMI driver for Mediatek SoCs
> +
> +config DRM_MEDIATEK_HDMI_MT8195_SUSPEND_LOW_POWER
> +       tristate "DRM HDMI SUSPEND LOW POWER Support for Mediatek mt8195 =
SoCs"
> +       depends on DRM_MEDIATEK_HDMI
> +       help
> +         DRM/KMS HDMI SUSPEND_LOW_POWER for Mediatek SoCs.
> +         Choose this option if you want to disable/enable
> +         clock and power domain when platform enter suspend,
> +         and this config depends on DRM_MEDIATEK_HDMI.
> +
> diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek=
/Makefile
> index 29098d7c8307c..736f0816083d0 100644
> --- a/drivers/gpu/drm/mediatek/Makefile
> +++ b/drivers/gpu/drm/mediatek/Makefile
> @@ -18,6 +18,8 @@ obj-$(CONFIG_DRM_MEDIATEK) +=3D mediatek-drm.o
>
>  mediatek-drm-hdmi-objs :=3D mtk_cec.o \
>                           mtk_hdmi.o \
> -                         mtk_hdmi_ddc.o
> +                         mtk_hdmi_ddc.o \
> +                         mtk_mt8195_hdmi.o \
> +                         mtk_mt8195_hdmi_ddc.o \
>
>  obj-$(CONFIG_DRM_MEDIATEK_HDMI) +=3D mediatek-drm-hdmi.o
> diff --git a/drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.c b/drivers/gpu/drm=
/mediatek/mtk_mt8195_hdmi.c
> new file mode 100644
> index 0000000000000..46c7c8af524ac
> --- /dev/null
>
