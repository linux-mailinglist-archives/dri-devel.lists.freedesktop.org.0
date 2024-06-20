Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F4E90FF60
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 10:50:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C68B810E86D;
	Thu, 20 Jun 2024 08:50:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="nUKl65O5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 135B210E86C
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 08:50:11 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2ebe3bac6c6so7102281fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 01:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1718873409; x=1719478209;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0oRTqaQV+LstrjwZixpKFYUALXmKtaF0Ow0RUXHlll0=;
 b=nUKl65O59grxGrx+iWzBMDC6V3xy1vvAVQ0SQm33CRWd099iPh7/v1E9pEcHh1g1Lm
 j0omQX069C7n37GCLFbfPEkC9zvM9SPMaWYUUd6afR0rMa0DwSs40s8PPc5SBPC0Fw6a
 6QJzNdMl5hVSMl9dJEeOGdlb4p1lCLkFRnUTA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718873409; x=1719478209;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0oRTqaQV+LstrjwZixpKFYUALXmKtaF0Ow0RUXHlll0=;
 b=kSgQ9H87bU6JBjTZmC+0ao7Sr9CQeoopaxuaRZZzGmQw1BJLBeR51ZM3DDpEXCWbG3
 8ZbBuyuMF2aZmDj5jr/RX5dN8yCR/k+/2TpcNN22cAY+epZi4EdUemObZ+hWtApX/KnI
 /4Uqk9LB+BGM387ykk6dR+yyNtitFxaQbCZOmb/wd8EXBumXMYoXYY6H4aJukzfzMcGt
 G040NT5YwP7e/STuMEKhOQvBnGZH+g6sW16cDtHExbHffPOIpPRDiF0SqecI0neLszRk
 JmpHQGo4fLukbzyYNczqJJC8FgTrDKY6mMWDxdVk0MVJ+1jOvzhlgBDkxiGsEi11xwiz
 Lh0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXX3H/F6MmkLvda+h+xyVckuVZQUDKlcvxRIu/yyR5J7JYbE2IPJJ+E3I8STew6CTjkvVzPIavWhdvovJCNEnQqu9d0i/Xugc8J3ojeN8F2
X-Gm-Message-State: AOJu0YwK/zwS0xRPQ3Q6RDQedPyFfEJ3zhSGhY+uPsZ1vsXYU6mJ9TBd
 zrypliK9+a/ybrGkol98ra9hefl6R/dqpQ+taGBm0EMe7fjB5DdSR2lZnUigaYV0htBitdErYfR
 Y6gacb7lGtLocy+953rIi1ysajSU0xWCaokr0
X-Google-Smtp-Source: AGHT+IHcXpqJLWmBKdXeI91LoMKrVXewns1BNu07e4js70I9FeW6r0+Qp26QuOLQHYvE8hHnxAzWJBo7v4Fc1y9Nr0o=
X-Received: by 2002:a2e:2416:0:b0:2eb:e137:6584 with SMTP id
 38308e7fff4ca-2ec3ce940bamr36303391fa.20.1718873408841; Thu, 20 Jun 2024
 01:50:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240620054708.2230665-1-wenst@chromium.org>
 <743577a0-ef60-4731-8901-daf1ae4f7f7f@suse.de>
In-Reply-To: <743577a0-ef60-4731-8901-daf1ae4f7f7f@suse.de>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 20 Jun 2024 16:49:57 +0800
Message-ID: <CAGXv+5G8sC0JAWg_1k-x6+XeqMSMHQDuHfhOJkJYe1OzHkdH-g@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: select DRM_GEM_DMA_HELPER if
 DRM_FBDEV_EMULATION=y
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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

On Thu, Jun 20, 2024 at 2:37=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Hi
>
> Am 20.06.24 um 07:47 schrieb Chen-Yu Tsai:
> > With the recent switch from fbdev-generic to fbdev-dma, the driver now
> > requires the DRM GEM DMA helpers. This dependency is missing, and will
> > cause a link failure if fbdev emulation is enabled.
> >
> > Add the missing dependency.
> >
> > Fixes: 0992284b4fe4 ("drm/mediatek: Use fbdev-dma")
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>
> Apart from this problem, would it make sense to convert the driver's
> management to GEM's DMA helpers? It appears there's some code
> duplication in mtk_gem.c and these helpers.

It seems at least import_sg_table could be converted. I don't have
the bandwidth to do a more in-depth review though.

Thanks
ChenYu


> Best regards
> Thomas
>
> > ---
> > The commit this patch fixes is in drm-misc-next. Ideally this patch
> > should be applied on top of it directly.
> >
> > CK, could you give your ack for it?
> >
> >   drivers/gpu/drm/mediatek/Kconfig | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/mediatek/Kconfig b/drivers/gpu/drm/mediate=
k/Kconfig
> > index 96cbe020f493..d6449ebae838 100644
> > --- a/drivers/gpu/drm/mediatek/Kconfig
> > +++ b/drivers/gpu/drm/mediatek/Kconfig
> > @@ -7,6 +7,7 @@ config DRM_MEDIATEK
> >       depends on HAVE_ARM_SMCCC
> >       depends on OF
> >       depends on MTK_MMSYS
> > +     select DRM_GEM_DMA_HELPER if DRM_FBDEV_EMULATION
> >       select DRM_KMS_HELPER
> >       select DRM_MIPI_DSI
> >       select DRM_PANEL
>
> --
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)
>
