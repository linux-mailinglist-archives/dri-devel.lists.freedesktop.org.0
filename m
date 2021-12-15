Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A455B475A07
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 14:56:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70D3010E22E;
	Wed, 15 Dec 2021 13:56:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0743C10E240
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 13:56:48 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 w6-20020a9d77c6000000b0055e804fa524so25007633otl.3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 05:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=M6j9hwTZmADnSfWaurTAQggHTqHGDGAa0M5rDiFAOho=;
 b=vU8K7qkTSSZ06CE/fefEWyKnsRXiJLlkp7YM5DiBN3h885TMUwRU64eceuisXus8DC
 IvN+bZn6DKihhsf8twYGvrDXkoqlcKrYqtCi7YiWEMbKZ8omTlfuI2rmhXjbCJ67tKol
 5W4KjvFqtQvbFXyizzshpEnvg3A+9shfiBFO9JMtqbNeh7JqvHk0V4l/nJ1blHTe04H6
 pnlOoSlqClNTyiVRu/FB2ENduxZSRY5IiUCeAdETG1JH9WvsXzHOO2snbahquGr2dGD/
 1wdu+osd202SSm9a1zPYo3zBhtCntFybwBv6qqGZpUjlpvbXWpVLQ0dM1EjVn4thKxR8
 Zp8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=M6j9hwTZmADnSfWaurTAQggHTqHGDGAa0M5rDiFAOho=;
 b=KvzIlhKE3a8nv+eyH4STkx6+xTBsSY28OM5iy+8UXm9nBwhebi1A37TRMpj5PNl2pS
 UPrB+IeNZFQaNNfQ5DAvx4Tr4RjQQ6kqAb7VBThlYtNbaX2ZLo4WvwP09bT8ZMjispEg
 ffAy5BO/nl/dIvaz//4RI4Tsekt+Z0iKfRb7NmUxQe9vMYMyPtcSk7qxmaJAHiFlQCId
 XpEjCpp6EsGAGa6tJ1i2qqzqs2/AYImIE5knTak1i3EuJoG+ILToK2QmumhJMHaSXZ4F
 wQvzzalNEFTF1QOTWKh1rN3JQLN/a5zZCW1JEut5fw8UGrCoDWm+RO9kLACOTIgQSToe
 P+mA==
X-Gm-Message-State: AOAM531tw+V6JIKvWqbM4ya+awdE0lFcN1yEUgoNuF2/GVNIf6vj+C/x
 4DWP8m1CEkO0NdVyi2X6cMjhLNOFv072tS+BpvVwdw==
X-Google-Smtp-Source: ABdhPJz6k/y1XdmARoYBhmoL4faqs4b6EkaRNTG2VXEP5cLBplgJmHpeQGBuN65kQTb4Ae2ykOvi1JN8NvW5Yd0+nyo=
X-Received: by 2002:a05:6830:200d:: with SMTP id
 e13mr9174519otp.109.1639576607244; 
 Wed, 15 Dec 2021 05:56:47 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 Dec 2021 07:56:43 -0600
MIME-Version: 1.0
In-Reply-To: <b307d567-774b-ca9e-d7d7-09846782c988@collabora.com>
References: <20211110130623.20553-1-granquet@baylibre.com>
 <20211110130623.20553-8-granquet@baylibre.com>
 <b307d567-774b-ca9e-d7d7-09846782c988@collabora.com>
From: Guillaume Ranquet <granquet@baylibre.com>
User-Agent: alot/0.10
Date: Wed, 15 Dec 2021 07:56:43 -0600
Message-ID: <CABnWg9sNOWJ_RgnvSdEtAVQrfELzJr8aj-FTB=oj6hQJScFCVA@mail.gmail.com>
Subject: Re: [PATCH v6 7/7] drm/mediatek: Add mt8195 DisplayPort driver
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Markus Schneider-Pargmann <msp@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Angelo,

Quoting AngeloGioacchino Del Regno (2021-12-10 11:17:44)
> Il 10/11/21 14:06, Guillaume Ranquet ha scritto:
> > From: Markus Schneider-Pargmann <msp@baylibre.com>
> >
> > This patch adds a DisplayPort driver for the Mediatek mt8195 SoC and a
> > according phy driver mediatek-dp-phy.
> >
> > It supports both functional units on the mt8195, the embedded
> > DisplayPort as well as the external DisplayPort units. It offers
> > hot-plug-detection, audio up to 8 channels, and DisplayPort 1.4 with up
> > to 4 lanes.
> >
> > The driver creates a child device for the phy. The child device will
> > never exist without the parent being active. As they are sharing a
> > register range, the parent passes a regmap pointer to the child so that
> > both can work with the same register range. The phy driver sets device
> > data that is read by the parent to get the phy device that can be used
> > to control the phy properties.
> >
> > This driver is based on an initial version by
> > Jason-JH.Lin <jason-jh.lin@mediatek.com>.
> >
> > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> > Reported-by: kernel test robot <lkp@intel.com>
>
> Hello Markus, Guillaume,
>
> there is a critical issue with this patch. Please check below.
>
> > ---
> >   drivers/gpu/drm/drm_edid.c              |    2 +-
> >   drivers/gpu/drm/mediatek/Kconfig        |    7 +
> >   drivers/gpu/drm/mediatek/Makefile       |    2 +
> >   drivers/gpu/drm/mediatek/mtk_dp.c       | 3094 +++++++++++++++++++++++
> >   drivers/gpu/drm/mediatek/mtk_dp_reg.h   |  568 +++++
> >   drivers/gpu/drm/mediatek/mtk_dpi.c      |  111 +-
> >   drivers/gpu/drm/mediatek/mtk_dpi_regs.h |   26 +
> >   drivers/gpu/drm/mediatek/mtk_drm_drv.c  |    1 +
> >   drivers/gpu/drm/mediatek/mtk_drm_drv.h  |    1 +
> >   9 files changed, 3799 insertions(+), 13 deletions(-)
> >   create mode 100644 drivers/gpu/drm/mediatek/mtk_dp.c
> >   create mode 100644 drivers/gpu/drm/mediatek/mtk_dp_reg.h
> >
>
> <snip>
>
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > index 384074f69111b..e6e88e3cd811d 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
>
> <snip>
>
> > @@ -979,6 +1051,16 @@ static int mtk_dpi_probe(struct platform_device *pdev)
> >               return ret;
> >       }
> >
> > +     dpi->dpi_ck_cg = devm_clk_get(dev, "ck_cg");
>
> mtk_dpi is used on MT2701, MT7183, MT8183, MT8192, but these platforms haven't
> got any "ck_cg" clock defined in their device-trees (regardless of whether these
> can support adding this clock or not, any code change shall be retro-compatible
> hence not breaking compatibility/functionality with older device-trees).
>
> Reminding that:
> - mediatek-drm uses the component framework
> - mtk_drm_drv is the component master
> - mtk_drm_drv bind() won't be called unless all of the components added with
>    match aren't calling component_add()
>
> ... this change not only breaks DisplayPort support for *all* of the
> aforementioned SoCs, but also makes the entire mediatek-drm to not finish
> probing, producing a global breakage that also includes DSI and the entire
> stack of components of that master (so, no display on all of them).
>
> To avoid breaking any SoC that's not MT8195, please use devm_clk_get_optional()
> here in the next version.
>
> Thanks,
> - Angelo
>

This is a good catch, I will update for v7.

Thank you very much for your review.

Thx,
Guillaume.
