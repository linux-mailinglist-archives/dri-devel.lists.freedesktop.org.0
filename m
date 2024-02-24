Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8483A8629CA
	for <lists+dri-devel@lfdr.de>; Sun, 25 Feb 2024 09:50:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6625D10E0C7;
	Sun, 25 Feb 2024 08:49:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WnEY0xCN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B531310E079
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Feb 2024 10:15:26 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-a3e8c1e4aa7so155965966b.2
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Feb 2024 02:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708769724; x=1709374524; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=D2ZXF0iZo/6iAjeOarlGvbT9yJV0/dj7cjkGOEKn2Lw=;
 b=WnEY0xCNwmacyu3I09cWxz8Dxne6FCflhL+xFXpzs2mWdG2kaN4iJqIUddfytAGYhL
 LJCMxy2pDnaRXSBtA8fl1HLRhD9PQky0faX5sRImVuSmsgEkksCx8snDshFBre7WjFsR
 wrZZNT0/hNyzab4FnjPDiTlzM2/UEAr/P+6jbYLUxLeX2i60GPL4ON28PvI7rGBYTFck
 avtemiFeMfXF8oCTHF3e/ZSj0ll1nDH8vLo15nvO1PK8O2X7yLWeKYI/9U8tlBnq0AE4
 V9DROwREorezDMLHwxEibIll7AlpcHLdtWFNdUme2kXUanRXDMZx8XWSX1f6k1Yofs4N
 2FzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708769724; x=1709374524;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D2ZXF0iZo/6iAjeOarlGvbT9yJV0/dj7cjkGOEKn2Lw=;
 b=DbaujpzlblzIGzKMIKctPpKgR9sSI1HyL0DvQDth+dT4r/MgcnnEzgPRVUE7aD46xR
 oLR7PWEhq3MjAjmWBpy88jcWR9kI+RmmkIY8QAY+BD/hdimJTEMHlaZ4l7SUHTek3wEV
 k8xJAlE5jh/b3LT03s8T+0TaFNzEPR2k26UR18vlnjrNIFSl2+6LocIDx/+uX18kusH3
 SBg/CCgntIxMtcz7iw6nrc3wgCovJaRQcAa1UM6dlPjMb6DTOKetMzA/J9QqpsI0mOPj
 RU7+WEWiXlGxuW7dvrAHPy4+Fiw33ZDuyKmk+X/dzUckXX5+EnAe2wKUQg+HL1CZg0ml
 QBCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWg/9Ba0LAtf9Ro7YaqbeWErvn5bvyCrzgPu6Cdq281pXbrg0Z/flKU0svOyToPoV/k/Y7EYpFB5SOLOaXvAZyBoi3y1n0l4iYvV+BOE0tm
X-Gm-Message-State: AOJu0Ywiq/XkKvAIEbyBsTe8i4F/pNs9ftqDqS484efLfDRWOPSUzANR
 1OgY6JTc5CaMw4JqqM1ry9ImtmMHvDMVGQVA8FBXpjy1xFOD87hB
X-Google-Smtp-Source: AGHT+IE2QVjQtd00qRPl37+Uigu3zm7B9dKnDCH1vosAVNiPcNTfRePbtu0xj8Dchv/cJ4J9TyQPxA==
X-Received: by 2002:a17:906:2508:b0:a3e:4f8b:bcc5 with SMTP id
 i8-20020a170906250800b00a3e4f8bbcc5mr1366807ejb.34.1708769724211; 
 Sat, 24 Feb 2024 02:15:24 -0800 (PST)
Received: from mehdi-archlinux ([45.156.240.98])
 by smtp.gmail.com with ESMTPSA id
 lv21-20020a170906bc9500b00a3fd98237aasm447906ejb.156.2024.02.24.02.15.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Feb 2024 02:15:23 -0800 (PST)
Date: Sat, 24 Feb 2024 11:15:19 +0100
From: Mehdi Djait <mehdi.djait.k@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Mehdi Djait <mehdi.djait@bootlin.com>, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, airlied@gmail.com,
 daniel@ffwll.ch, krzysztof.kozlowski+dt@linaro.org,
 robh+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
 alexandre.belloni@bootlin.com, luca.ceresoli@bootlin.com,
 paul.kocialkowski@bootlin.com, dri-devel@lists.freedesktop.org,
 geert@linux-m68k.org
Subject: Re: [PATCH 2/2] drm/tiny: Add driver for the sharp LS027B7DH01
 Memory LCD
Message-ID: <ZdnBt1MvqBqu3j9z@mehdi-archlinux>
References: <cover.1701267411.git.mehdi.djait@bootlin.com>
 <71a9dbf4609dbba46026a31f60261830163a0b99.1701267411.git.mehdi.djait@bootlin.com>
 <078cdd6f-7b38-497d-8480-00569c63f843@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <078cdd6f-7b38-497d-8480-00569c63f843@suse.de>
X-Mailman-Approved-At: Sun, 25 Feb 2024 08:49:54 +0000
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

Hi Thomas, 

Thank you for the review.

On Wed, Nov 29, 2023 at 05:21:19PM +0100, Thomas Zimmermann wrote:
> Hi,
> 
> thanks for the patches.
> 
> Am 29.11.23 um 15:29 schrieb Mehdi Djait:
> > Introduce a DRM driver for the sharp LS027B7DH01 Memory LCD.
> > 
> > LS027B7DH01 is a 2.7" 400x240 monochrome display connected to a SPI bus.
> > The drivers implements the Multiple Lines Data Update Mode.
> > External COM inversion is enabled using a PWM signal as input.
> > 
> > Signed-off-by: Mehdi Djait <mehdi.djait@bootlin.com>
> > ---
> >   MAINTAINERS                              |   7 +
> >   drivers/gpu/drm/tiny/Kconfig             |   8 +
> >   drivers/gpu/drm/tiny/Makefile            |   1 +
> >   drivers/gpu/drm/tiny/sharp-ls027b7dh01.c | 411 +++++++++++++++++++++++
> >   4 files changed, 427 insertions(+)
> >   create mode 100644 drivers/gpu/drm/tiny/sharp-ls027b7dh01.c
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 012df8ccf34e..fb859698bd3d 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -6832,6 +6832,13 @@ S:	Maintained
> >   F:	Documentation/devicetree/bindings/display/panel/samsung,s6d7aa0.yaml
> >   F:	drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
> > +DRM DRIVER FOR SHARP LS027B7DH01 Memory LCD
> > +M:	Mehdi Djait <mehdi.djait@bootlin.com>
> > +S:	Maintained
> > +T:	git git://anongit.freedesktop.org/drm/drm-misc
> > +F:	Documentation/devicetree/bindings/display/sharp,ls027b7dh01.yaml
> > +F:	drivers/gpu/drm/tiny/sharp-ls027b7dh01.c
> > +
> >   DRM DRIVER FOR SITRONIX ST7586 PANELS
> >   M:	David Lechner <david@lechnology.com>
> >   S:	Maintained
> > diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
> > index f6889f649bc1..a2ade06403ca 100644
> > --- a/drivers/gpu/drm/tiny/Kconfig
> > +++ b/drivers/gpu/drm/tiny/Kconfig
> > @@ -186,6 +186,14 @@ config TINYDRM_REPAPER
> >   	  If M is selected the module will be called repaper.
> > +config TINYDRM_SHARP_LS027B7DH01
> > +	tristate "DRM support for SHARP LS027B7DH01 display"
> > +	depends on DRM && SPI
> > +	select DRM_KMS_HELPER
> > +	select DRM_GEM_DMA_HELPER
> > +	help
> > +	  DRM driver for the SHARP LS027B7DD01 LCD display.
> > +
> >   config TINYDRM_ST7586
> >   	tristate "DRM support for Sitronix ST7586 display panels"
> >   	depends on DRM && SPI
> > diff --git a/drivers/gpu/drm/tiny/Makefile b/drivers/gpu/drm/tiny/Makefile
> > index 76dde89a044b..b05df3afb231 100644
> > --- a/drivers/gpu/drm/tiny/Makefile
> > +++ b/drivers/gpu/drm/tiny/Makefile
> > @@ -14,5 +14,6 @@ obj-$(CONFIG_TINYDRM_ILI9341)		+= ili9341.o
> >   obj-$(CONFIG_TINYDRM_ILI9486)		+= ili9486.o
> >   obj-$(CONFIG_TINYDRM_MI0283QT)		+= mi0283qt.o
> >   obj-$(CONFIG_TINYDRM_REPAPER)		+= repaper.o
> > +obj-$(CONFIG_TINYDRM_SHARP_LS027B7DH01)	+= sharp-ls027b7dh01.o
> >   obj-$(CONFIG_TINYDRM_ST7586)		+= st7586.o
> >   obj-$(CONFIG_TINYDRM_ST7735R)		+= st7735r.o
> > diff --git a/drivers/gpu/drm/tiny/sharp-ls027b7dh01.c b/drivers/gpu/drm/tiny/sharp-ls027b7dh01.c
> > new file mode 100644
> > index 000000000000..2f58865a5c78
> > --- /dev/null
> > +++ b/drivers/gpu/drm/tiny/sharp-ls027b7dh01.c
> > @@ -0,0 +1,411 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Sharp LS027B7DH01 Memory Display Driver
> > + *
> > + * Copyright (C) 2023 Andrew D'Angelo
> > + * Copyright (C) 2023 Mehdi Djait <mehdi.djait@bootlin.com>
> > + *
> > + * The Sharp Memory LCD requires an alternating signal to prevent the buildup of
> > + * a DC bias that would result in a Display that no longer can be updated. Two
> > + * modes for the generation of this signal are supported:
> > + *
> > + * Software, EXTMODE = Low: toggling the BIT(1) of the Command and writing it at
> > + * least once a second to the display.
> > + *
> > + * Hardware, EXTMODE = High: the alternating signal should be supplied on the
> > + * EXTCOMIN pin.
> > + *
> > + * In this driver the Hardware mode is implemented with a PWM signal.
> > + */
> > +
> > +#include <linux/delay.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/pwm.h>
> > +#include <linux/spi/spi.h>
> > +
> > +#include <drm/drm_atomic_helper.h>
> > +#include <drm/drm_damage_helper.h>
> > +#include <drm/drm_drv.h>
> > +#include <drm/drm_fbdev_generic.h>
> > +#include <drm/drm_fb_dma_helper.h>
> > +#include <drm/drm_format_helper.h>
> > +#include <drm/drm_framebuffer.h>
> > +#include <drm/drm_gem_atomic_helper.h>
> > +#include <drm/drm_gem_dma_helper.h>
> > +#include <drm/drm_gem_framebuffer_helper.h>
> > +#include <drm/drm_modes.h>
> > +#include <drm/drm_probe_helper.h>
> > +#include <drm/drm_simple_kms_helper.h>
> > +
> > +#define CMD_WRITE BIT(0)
> > +#define CMD_CLEAR BIT(2)
> > +
> > +struct sharp_ls027b7dh01 {
> > +	struct spi_device *spi;
> > +
> > +	struct drm_device drm;
> > +	struct drm_connector connector;
> > +	struct drm_simple_display_pipe pipe;
> 
> Could you please replace the simple pipe and its helpers with regular
> DRMhelpers. It should no tbe used in new drivers. It's an unnecessary
> indirection. Replacing is simple: copy the content of the data structure and
> its helpers into the driver. Maybe clean up the result, if necessary.


Could you please further explain where to copy the helper functions or give me
an example driver ? This is my first DRM driver and grepping did not help me much.

(Sorry for the delayed response)

--
Kind Regards
Mehdi Djait
