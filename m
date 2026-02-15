Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8ERRLnQ8kmn2sAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 15 Feb 2026 22:36:52 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCFE13FCA8
	for <lists+dri-devel@lfdr.de>; Sun, 15 Feb 2026 22:36:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BBCC10E070;
	Sun, 15 Feb 2026 21:36:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CBCF2W9Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7BDD10E1D7
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Feb 2026 05:34:39 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-79639c2d2b5so23673007b3.2
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Feb 2026 21:34:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771133679; cv=none;
 d=google.com; s=arc-20240605;
 b=LZRx6wFLV8jUqFO/9s9DIrAiiZHOOo/NdbepIjWzUgEbMJec3fp+h7lQKr4M3JxygI
 QQr+H04LWi0hnSH3fZsOChvFM5UnOuUW2i26sNHUrBGHBMPXsfk7usEzPzpogMpMTbqd
 DkLyTSA0vtU2tssfRpPzAPlkCxLWH36+yqpvEf8Z+oRGpJxmM3oJRbcd04Nxx5+sluuM
 NsCtqOHhNTRr3VUUNIEMbHTuzFbQHhi9tfPsX4wZhKBaaZ6hMPXkcEpeZQRP0NM2SqFU
 Xz4l2MLO08alLvUEOQ/UAejZq1X/ej4YKN8U+mczxjzi+4VExSMSVIn76Mc4snx9+rDx
 jPDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=qQzjI17HaTqBNcaAfSdO/K7xxYopjF3U1Ks0jvqILwM=;
 fh=nzJQNWY/tgHcctUfIfN/1QsssEE1hYkR14F91ctMrmE=;
 b=YusqTeHOgrk83nnqBEKVxjVOniVGE4Xdwvg4XDsRFoPycgwCW8zD0G352ns4xne18t
 FtPzl5Igebwtom6u/iONv2Mdm9Wwx4rK1ETcdJYBpk5I3kW4e5ICJwcB9Hekxqr6hirr
 HH/hfqabAWC6srNRfS7mp78fJVRgHk0xOF3qw6F7d/6LVG9xFMQ7CD0fBsvbZqqzgkea
 CBSnl//jYpu5GCSd4d1Xz4/Lggu3EMxhziKMiEOHGVa78fF8E09lJjPgvmjHGZNjH78a
 whc+ObXW3Qi14DWOGnf190XpRiFl2EAD6KFd8rQJNkX6OaRPFWezIfcRGzAM4QRuwLL7
 ldNw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771133679; x=1771738479; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qQzjI17HaTqBNcaAfSdO/K7xxYopjF3U1Ks0jvqILwM=;
 b=CBCF2W9ZHqu7tbyJv4zFUsSj1N/aIKkXjCdZNvYduzlOnIY/LEhHGYRXbag+yL+Eb4
 g7pOH4neUmSOPWBisNo1/7T3UujbIW/s1ODuedLJJagS6MaG3bSmPtvNpk8E8sa53tN9
 rbXj4DBWgXPKGCjA9u8uEXsdrIUU17hJIIBqcC4qeMJpAWqZNXvjB8h6DryQ0b9HGk7Z
 LoWR84joqYnwYAHwZXO5EU8ezviXr6iUr1dXkx1PfYfvdS05zXhF+nCUWUAz+rgGcKyz
 fWnQelWX0NQUPTCDYt3UEwJ2w5CFtU+JN3OvUNTC6v1TAw7WiIUffu4uk+xKpeKAzRuq
 Qacw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771133679; x=1771738479;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=qQzjI17HaTqBNcaAfSdO/K7xxYopjF3U1Ks0jvqILwM=;
 b=KepGvl1RuGfD+HQTKYDtUMsrC5cgKWuf68VgOye65R4uVED0MUybBA0XGm5kajOz9h
 VE/rx2XWVDlzKClSJEUYvx2EP84+WgmT2XSVfTSN+txYS0XBesIFjyfdMF/XJEmUf5V/
 n78XuaQHOk4aAVuZZLqK1YZ4yLMcBY2+AQj7hALANsElQWcz4xU81es3zXkhoR7VZpy7
 OG9Q7dtx1cyj1CG5Nb6ESsjlWnd3iWQqAJtlBAX4vQtmqpMgW592B9DvNTVsxClJOqLG
 9h13W3vOwfIbm53H0CwhSJbmR4OTOAucSVLb/zGI8GUbbKN8m9b1AbVGoyzUGlBsAD/5
 tbaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkqX3Q90QQmFUlvDTxetAOM1SSY2b4wmO1NZdTjKgCxm2PoV4+DPsapgGhJAsdBXXy5SLLZRGtG38=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyPIfy3j06BsBeHEAfJ9twXd2UxL2aGEWCUDEqzLZKsASB90ubv
 vww1cZTG8NGnRirP4h/czU30xpIqsMpI7yf9S8OB9jW2aMzkxnh/gS6aYUu9EW60IIA1qDUpNtB
 fhKK37fEq+xGY6Eb34niFDrzRilO3NQk=
X-Gm-Gg: AZuq6aJgLLZnjzE8mibHW4YQ4jUtbeBFTQcHQ564bhfOHet7E4mmITY8n9Y2r+too58
 aOsHm0MKnIBFp0llq5N9gqUebE8hgFRK0tH52ra1fVG6n0V/ZJ4o7lqvHIMDNBvKrNvnwI24i6w
 le6xl3YUnCp2q0yZE7nrEt1HESbIPCxu7Ee1NdBp3hlcXlrUn/FlHkBWETuwDvtV9ttpcIALLtP
 oXkOuXmaO6hciMWcmnbaPgsd/1AeeZwadegCwlCXYxP3dO5Ypm6nUh7QIutt+jGANOxFZu22Cgd
 cUDBXsExl6CkDnMjKDKO45G3yKXUydpOUn5Ql5R58Q==
X-Received: by 2002:a05:690c:110:b0:796:4969:e789 with SMTP id
 00721157ae682-7979e90d82amr61896687b3.69.1771133678785; Sat, 14 Feb 2026
 21:34:38 -0800 (PST)
MIME-Version: 1.0
References: <20260214070123.41374-1-architanant5@gmail.com>
 <CAGb2v679248jj4CwQhYAbTUiPJ1=-JqX15CaNY94Cj_dFXwZXw@mail.gmail.com>
In-Reply-To: <CAGb2v679248jj4CwQhYAbTUiPJ1=-JqX15CaNY94Cj_dFXwZXw@mail.gmail.com>
From: Archit Anant <architanant5@gmail.com>
Date: Sun, 15 Feb 2026 11:04:27 +0530
X-Gm-Features: AZwV_QjVlcNybe6kVjhwN6Iia_Ic0Ar4CEuJik1LKVeEUCSBEspIboQigmzjbUI
Message-ID: <CADJHxWCzbzD3MK+NLS3UVqXeH4cKop-ErNSnn_RUmAzRLmk7Mw@mail.gmail.com>
Subject: Re: [RFC PATCH] drm/sitronix: add ST7789V panel driver
To: wens@kernel.org
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, javierm@redhat.com, nathan@kernel.org, 
 geert+renesas@glider.be, marcus.folkesson@gmail.com, david@lechnology.com, 
 noralf@tronnes.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sun, 15 Feb 2026 21:36:42 +0000
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[architanant5@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:wens@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:javierm@redhat.com,m:nathan@kernel.org,m:geert+renesas@glider.be,m:marcus.folkesson@gmail.com,m:david@lechnology.com,m:noralf@tronnes.org,m:linux-kernel@vger.kernel.org,m:geert@glider.be,m:marcusfolkesson@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,redhat.com,glider.be,lechnology.com,tronnes.org,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[architanant5@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 1CCFE13FCA8
X-Rspamd-Action: no action

Hi ChenYu,

Thank you for the detailed review and the pointers toward the documentation=
.
I will ensure the headers are sorted alphabetically and the driver name
conflict is resolved in the next iteration.

> The reset logic in mipi_dbi is inverted when compared to panel-st7789v.
> mipi_dbi needs to be taught the "proper" reset polarity.

Noted. I will look into the mipi_dbi core to see how to handle the reset
polarity correctly.

> Instead this functionality could be merged into the existing panel-st7789=
v
> driver. You mentioned above that that driver only supports the 9-bit SPI
> transfer mode. However porting that driver over to mipi_dbi would fix thi=
s,
> and remove some redundant code. And tinydrm support could be added on top
> of that.
>
> I actually mentioned I was going to work on this on IRC. But I only porte=
d
> the driver over to use mipi_dbi, and haven't gotten around to adding
> tinydrm support. I can send out the conversion patches if that helps
> you.

That would be fantastic and would save a lot of redundant effort. If you
send out the patches to convert the existing panel-st7789v driver to
mipi_dbi, I would be happy to build the 'tiny' (simple display pipe)
support on top of your series.

Please CC me when you post them, and I will rebase my work accordingly.

Best regards,
Archit

On Sat, Feb 14, 2026 at 6:35=E2=80=AFPM Chen-Yu Tsai <wens@kernel.org> wrot=
e:
>
> On Sat, Feb 14, 2026 at 5:21=E2=80=AFPM Archit Anant <architanant5@gmail.=
com> wrote:
> >
> > Add a DRM driver for Sitronix ST7789V display controllers using the
> > mipi_dbi interface.
> >
> > Currently, support for this controller is split between a legacy fbdev
> > driver in staging (fb_st7789v.c) and a DRM panel driver that requires
> > 9-bit SPI words (panel-sitronix-st7789v.c). This new driver uses the
> > mipi_dbi helper to support standard 8-bit SPI with a D/C GPIO, which
> > is the configuration used by the vast majority of hobbyist and
> > embedded hardware.
>
> Notes about this below.
>
> >
> > The initialization sequence is ported from the staging driver and
> > supports several panels:
> > - Generic 240x320 profile
> > - HannStar HSD20 IPS
> > - Inanbo T28CP45TN89-V17
> > - EDT ET028013DMA
> > - Jasonic JT240MHQS-HWT-EK-E3
>
> First of all, please run scripts/checkpatch.pl on patches before you send
> them. The indentation is all wrong. The script would have caught it.
>
> And check out Documentation/process/submitting-patches.rst for any other
> steps you should do before submitting patches.
>
> > Signed-off-by: Archit Anant <architanant5@gmail.com>
> > ---
> >  drivers/gpu/drm/sitronix/Kconfig   |  17 ++
> >  drivers/gpu/drm/sitronix/Makefile  |   2 +
> >  drivers/gpu/drm/sitronix/st7789v.c | 307 +++++++++++++++++++++++++++++
> >  3 files changed, 326 insertions(+)
> >  create mode 100644 drivers/gpu/drm/sitronix/st7789v.c
> >
> > diff --git a/drivers/gpu/drm/sitronix/Kconfig b/drivers/gpu/drm/sitroni=
x/Kconfig
> > index 6de7d92d9b74..7a2c66677003 100644
> > --- a/drivers/gpu/drm/sitronix/Kconfig
> > +++ b/drivers/gpu/drm/sitronix/Kconfig
> > @@ -40,3 +40,20 @@ config DRM_ST7735R
> >
> >           If M is selected the module will be called st7735r.
> >
> > +config DRM_ST7789V
> > +       tristate "DRM support for Sitronix ST7789V display panels"
> > +       depends on DRM && SPI
> > +       select DRM_CLIENT_SELECTION
> > +       select DRM_GEM_DMA_HELPER
> > +       select DRM_KMS_HELPER
> > +       select DRM_MIPI_DBI
> > +       select BACKLIGHT_CLASS_DEVICE
> > +       help
> > +         DRM driver for Sitronix ST7789V panels connected via SPI.
> > +         This driver supports several panels including:
> > +         * HannStar HSD20 IPS
> > +         * Inanbo T28CP45TN89-V17
> > +         * EDT ET028013DMA
> > +         * Jasonic JT240MHQS-HWT-EK-E3
> > +
> > +         If M is selected the module will be called st7789v.
> > diff --git a/drivers/gpu/drm/sitronix/Makefile b/drivers/gpu/drm/sitron=
ix/Makefile
> > index bd139e5a6995..96b2a4d85368 100644
> > --- a/drivers/gpu/drm/sitronix/Makefile
> > +++ b/drivers/gpu/drm/sitronix/Makefile
> > @@ -1,3 +1,5 @@
> >  obj-$(CONFIG_DRM_ST7571_I2C)           +=3D st7571-i2c.o
> >  obj-$(CONFIG_DRM_ST7586)               +=3D st7586.o
> >  obj-$(CONFIG_DRM_ST7735R)              +=3D st7735r.o
> > +obj-$(CONFIG_DRM_ST7789V)              +=3D st7789v.o
> > +
>
> Empty line not needed.
>
> > diff --git a/drivers/gpu/drm/sitronix/st7789v.c b/drivers/gpu/drm/sitro=
nix/st7789v.c
> > new file mode 100644
> > index 000000000000..4ce4b46d8df2
> > --- /dev/null
> > +++ b/drivers/gpu/drm/sitronix/st7789v.c
> > @@ -0,0 +1,307 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * DRM driver for Sitronix ST7789V LCD panels
> > + *
> > + * Copyright (C) 2026 Archit Anant <architanant5@gmail.com>
> > + */
> > +
> > +#include <linux/bits.h>
> > +#include <linux/module.h>
> > +#include <linux/kernel.h>
> > +#include <linux/spi/spi.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/delay.h>
> > +#include <linux/backlight.h>
>
> Sort this group alphabetically.
>
> > +
> > +#include <drm/drm_device.h>
> > +#include <drm/drm_drv.h>
> > +#include <drm/drm_managed.h>
> > +#include <drm/drm_mipi_dbi.h>
> > +#include <drm/drm_modes.h>
> > +#include <drm/drm_gem_dma_helper.h>
> > +#include <drm/drm_atomic_helper.h>
> > +#include <drm/clients/drm_client_setup.h>
> > +#include <drm/drm_fbdev_dma.h>
>
> Sort this group alphabetically.
>
> And add an empty line here for group separation.
>
> > +#include <video/mipi_display.h>
> > +
> > +#define ST7789V_PORCTRL      0xb2
> > +#define ST7789V_GCTRL        0xb7
> > +#define ST7789V_VCOMS        0xbb
> > +#define ST7789V_LCMCTRL      0xc0
> > +#define ST7789V_VDVVRHEN     0xc2
> > +#define ST7789V_VRHS         0xc3
> > +#define ST7789V_VDVS         0xc4
> > +#define ST7789V_VCMOFSET     0xc5
> > +#define ST7789V_FRCTRL2      0xc6
> > +#define ST7789V_PWCTRL1      0xd0
> > +#define ST7789V_PVGAMCTRL    0xe0
> > +#define ST7789V_NVGAMCTRL    0xe1
> > +
> > +#define ST7789V_MADCTL_MY  BIT(7)
> > +#define ST7789V_MADCTL_MX  BIT(6)
> > +#define ST7789V_MADCTL_MV  BIT(5)
> > +#define ST7789V_MADCTL_BGR BIT(3)
> > +
> > +
> > +struct st7789v_cfg {
> > +       const struct drm_display_mode mode;
> > +       unsigned int left_offset;
> > +       unsigned int top_offset;
> > +       bool is_ips;   /* Controls PORCTRL and GCTRL timings */
> > +       bool invert;   /* Controls Color Inversion (positive/negative) =
*/
> > +};
> > +struct st7789v_priv {
> > +       struct mipi_dbi_dev dbidev; /* Must be first for .release() */
> > +       const struct st7789v_cfg *cfg;
> > +};
> > +
> > +
> > +/* 1. Generic Fallback (Matches default behavior of fb_st7789v.c) */
> > +static const struct st7789v_cfg generic_cfg =3D {
> > +       .mode =3D { DRM_SIMPLE_MODE(240, 320, 0, 0) },
> > +       .is_ips =3D false,
> > +       .invert =3D true,
> > +};
> > +
> > +/* 2. HannStar 2.0" IPS (The specific panel handled in staging) */
> > +static const struct st7789v_cfg hsd20_ips_cfg =3D {
> > +       .mode =3D { DRM_SIMPLE_MODE(240, 320, 31, 41) },
> > +       .is_ips =3D true,
> > +       .invert =3D true,
> > +};
> > +
> > +/* 3. Inanbo 2.8" (From the 9-bit driver: No Inversion) */
> > +static const struct st7789v_cfg inanbo_panel_cfg =3D {
> > +       .mode =3D { DRM_SIMPLE_MODE(240, 320, 43, 57) },
> > +       .is_ips =3D false,
> > +       .invert =3D false,
> > +};
> > +
> > +/* 4. EDT 2.8" (From the 9-bit driver: Normal Inversion) */
> > +static const struct st7789v_cfg edt_panel_cfg =3D {
> > +       .mode =3D { DRM_SIMPLE_MODE(240, 320, 43, 58) },
> > +       .is_ips =3D false,
> > +       .invert =3D true,
> > +};
> > +
> > +/* 5. Jasonic 2.4" (From the 9-bit driver: Custom Height + Offset) */
> > +static const struct st7789v_cfg jasonic_panel_cfg =3D {
> > +       .mode =3D { DRM_SIMPLE_MODE(240, 280, 37, 43) },
> > +       .is_ips =3D true,
> > +       .invert =3D true,
> > +       .top_offset =3D 38,
> > +};
> > +
> > +DEFINE_DRM_GEM_DMA_FOPS(st7789v_fops);
> > +
> > +static const struct drm_driver st7789v_driver =3D {
> > +    .driver_features    =3D DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMI=
C,
> > +    .fops               =3D &st7789v_fops,
> > +    DRM_GEM_DMA_DRIVER_OPS_VMAP,
> > +    DRM_FBDEV_DMA_DRIVER_OPS,
> > +    .debugfs_init       =3D mipi_dbi_debugfs_init,
> > +    .name               =3D "st7789v",
> > +    .desc               =3D "Sitronix ST7789V",
> > +    .major              =3D 1,
> > +    .minor              =3D 0,
> > +};
> > +
> > +static void st7789v_pipe_enable(struct drm_simple_display_pipe *pipe,
> > +                                struct drm_crtc_state *crtc_state,
> > +                                struct drm_plane_state *plane_state)
> > +{
> > +    struct mipi_dbi_dev *dbidev =3D drm_to_mipi_dbi_dev(pipe->crtc.dev=
);
> > +    struct st7789v_priv *priv =3D container_of(dbidev, struct st7789v_=
priv, dbidev);
> > +    struct mipi_dbi *dbi =3D &dbidev->dbi;
> > +    int ret,idx;
> > +
> > +    if (!drm_dev_enter(pipe->crtc.dev, &idx))
> > +        return;
> > +
> > +    ret =3D mipi_dbi_poweron_reset(dbidev);
> > +    if (ret)
> > +               goto out_exit;
> > +
> > +    mipi_dbi_command(dbi, MIPI_DCS_SOFT_RESET);
> > +    msleep(150);
> > +
> > +    mipi_dbi_command(dbi, MIPI_DCS_EXIT_SLEEP_MODE);
> > +    msleep(500);
> > +
> > +    mipi_dbi_command(dbi, MIPI_DCS_SET_PIXEL_FORMAT, MIPI_DCS_PIXEL_FM=
T_16BIT);
> > +
> > +    if (priv->cfg->is_ips) {
> > +        mipi_dbi_command(dbi, ST7789V_PORCTRL, 0x05, 0x05, 0x00, 0x33,=
 0x33);
> > +        mipi_dbi_command(dbi, ST7789V_GCTRL, 0x75);
> > +    } else {
> > +        mipi_dbi_command(dbi, ST7789V_PORCTRL, 0x0c, 0x0c, 0x00, 0x33,=
 0x33);
> > +        mipi_dbi_command(dbi, ST7789V_GCTRL, 0x35);
> > +    }
> > +
> > +    mipi_dbi_command(dbi, ST7789V_VCOMS, 0x20);
> > +    mipi_dbi_command(dbi, ST7789V_LCMCTRL, 0x2c);
> > +    mipi_dbi_command(dbi, ST7789V_VDVVRHEN, 0x01);
> > +    mipi_dbi_command(dbi, ST7789V_VRHS, 0x12);
> > +    mipi_dbi_command(dbi, ST7789V_VDVS, 0x20);
> > +    mipi_dbi_command(dbi, ST7789V_FRCTRL2, 0x0f);
> > +    mipi_dbi_command(dbi, ST7789V_PWCTRL1, 0xa4, 0xa1);
> > +
> > +    mipi_dbi_command(dbi, ST7789V_PVGAMCTRL,
> > +                     0xd0, 0x04, 0x0d, 0x11, 0x13, 0x2b, 0x3f, 0x54,
> > +                     0x4c, 0x18, 0x0d, 0x0b, 0x1f, 0x23);
> > +    mipi_dbi_command(dbi, ST7789V_NVGAMCTRL,
> > +                     0xd0, 0x04, 0x0c, 0x11, 0x13, 0x2c, 0x3f, 0x44,
> > +                     0x51, 0x2f, 0x1f, 0x1f, 0x20, 0x23);
> > +
> > +    if (priv->cfg->invert)
> > +        mipi_dbi_command(dbi, MIPI_DCS_ENTER_INVERT_MODE);
> > +    else
> > +        mipi_dbi_command(dbi, MIPI_DCS_EXIT_INVERT_MODE);
> > +    mipi_dbi_command(dbi, MIPI_DCS_SET_DISPLAY_ON);
> > +    msleep(100);
> > +
> > +    u8 addr_mode =3D 0;
> > +
> > +    switch (dbidev->rotation) {
> > +    case 90:
> > +
> > +        addr_mode =3D ST7789V_MADCTL_MV | ST7789V_MADCTL_MY;
> > +        break;
> > +    case 180:
> > +        addr_mode =3D ST7789V_MADCTL_MX | ST7789V_MADCTL_MY;
> > +        break;
> > +    case 270:
> > +        addr_mode =3D ST7789V_MADCTL_MV | ST7789V_MADCTL_MX;
> > +        break;
> > +    default:
> > +        addr_mode =3D 0;
> > +        break;
> > +    }
> > +
> > +    addr_mode |=3D ST7789V_MADCTL_BGR;
> > +
> > +    mipi_dbi_command(dbi, MIPI_DCS_SET_ADDRESS_MODE, addr_mode);
> > +
> > +    mipi_dbi_enable_flush(dbidev, crtc_state, plane_state);
> > +
> > +out_exit:
> > +    drm_dev_exit(idx);
> > +}
> > +
> > +static const struct drm_simple_display_pipe_funcs st7789v_pipe_funcs =
=3D
> > +{
> > +    DRM_MIPI_DBI_SIMPLE_DISPLAY_PIPE_FUNCS(st7789v_pipe_enable),
> > +};
> > +
> > +static int st7789v_probe(struct spi_device *spi)
> > +{
> > +    struct device *dev =3D &spi->dev;
> > +    const struct st7789v_cfg *cfg;
> > +    struct mipi_dbi_dev *dbidev;
> > +    struct st7789v_priv *priv;
> > +    struct drm_device *drm;
> > +    struct mipi_dbi *dbi;
> > +    struct gpio_desc *dc;
> > +    u32 rotation =3D 0;
> > +    int ret;
> > +
> > +    cfg =3D device_get_match_data(&spi->dev);
> > +
> > +       if (!cfg)
> > +               cfg =3D (void *)spi_get_device_id(spi)->driver_data;
> > +
> > +       priv =3D devm_drm_dev_alloc(dev, &st7789v_driver,
> > +                                 struct st7789v_priv, dbidev.drm);
> > +
> > +       if (IS_ERR(priv))
> > +               return PTR_ERR(priv);
> > +
> > +    dbidev =3D &priv->dbidev;
> > +    priv->cfg =3D cfg;
> > +
> > +    dbi =3D &dbidev->dbi;
> > +    drm =3D &dbidev->drm;
> > +
> > +    spi_set_drvdata(spi, drm);
>
> Maybe also add power supply regulator support to make it complete?
>
> > +    dbi->reset =3D devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIG=
H);
> > +    if (IS_ERR(dbi->reset))
> > +        return dev_err_probe(dev, PTR_ERR(dbi->reset), "Failed to get =
GPIO 'reset'\n");
>
> The reset logic in mipi_dbi is inverted when compared to panel-st7789v.
> mipi_dbi needs to be taught the "proper" reset polarity.
>
> > +
> > +    dc =3D devm_gpiod_get(dev, "dc", GPIOD_OUT_LOW);
> > +    if (IS_ERR(dc))
> > +        return dev_err_probe(dev, PTR_ERR(dc), "Failed to get GPIO 'dc=
'\n");
>
> This should be optional, since mipi_dbi can handle the "no dc" case.
>
> > +
> > +    dbidev->backlight =3D devm_of_find_backlight(dev);
> > +    if (IS_ERR(dbidev->backlight))
> > +        return PTR_ERR(dbidev->backlight);
> > +
> > +    dbidev->left_offset =3D priv->cfg->left_offset;
> > +    dbidev->top_offset =3D priv->cfg->top_offset;
> > +
> > +    device_property_read_u32(dev, "rotation", &rotation);
> > +
> > +    ret =3D mipi_dbi_spi_init(spi, dbi, dc);
> > +    if (ret)
> > +        return ret;
> > +
> > +    ret =3D mipi_dbi_dev_init(dbidev, &st7789v_pipe_funcs, &cfg->mode,=
 rotation);
> > +    if (ret)
> > +        return ret;
> > +
> > +    drm_mode_config_reset(drm);
> > +
> > +    ret =3D drm_dev_register(drm, 0);
> > +    if (ret)
> > +        return ret;
> > +
> > +    drm_client_setup(drm, NULL);
> > +
> > +    return 0;
> > +}
> > +
> > +static void st7789v_remove(struct spi_device *spi)
> > +{
> > +    struct drm_device *drm =3D spi_get_drvdata(spi);
> > +    drm_dev_unplug(drm);
> > +    drm_atomic_helper_shutdown(drm);
> > +}
> > +
> > +static void st7789v_shutdown(struct spi_device *spi)
> > +{
> > +    drm_atomic_helper_shutdown(spi_get_drvdata(spi));
> > +}
> > +
> > +
> > +static const struct of_device_id st7789v_of_match[] =3D {
> > +       { .compatible =3D "sitronix,st7789v", .data =3D &generic_cfg },
> > +       { .compatible =3D "hannstar,hsd20-ips", .data =3D &hsd20_ips_cf=
g },
> > +       { .compatible =3D "inanbo,t28cp45tn89-v17", .data =3D &inanbo_p=
anel_cfg },
> > +       { .compatible =3D "edt,et028013dma", .data =3D &edt_panel_cfg }=
,
> > +       { .compatible =3D "jasonic,jt240mhqs-hwt-ek-e3", .data =3D &jas=
onic_panel_cfg },
> > +       {  }
> > +};
> > +MODULE_DEVICE_TABLE(of, st7789v_of_match);
>
> We typically don't want two drivers matching on the same devices. The
> driver match and probe order becomes hard to predict.
>
> Instead this functionality could be merged into the existing panel-st7789=
v
> driver. You mentioned above that that driver only supports the 9-bit SPI
> transfer mode. However porting that driver over to mipi_dbi would fix thi=
s,
> and remove some redundant code. And tinydrm support could be added on top
> of that.
>
> I actually mentioned I was going to work on this on IRC. But I only porte=
d
> the driver over to use mipi_dbi, and haven't gotten around to adding
> tinydrm support. I can send out the conversion patches if that helps
> you.
>
> > +
> > +static const struct spi_device_id st7789v_id[] =3D {
> > +    { "st7789v", 0 },
>
> You should add all the other ones as well. OF-based SPI driver module
> loading doesn't seem to work. I think that's a known issue?
>
> > +    { },
> > +};
> > +MODULE_DEVICE_TABLE(spi, st7789v_id);
> > +
> > +static struct spi_driver st7789v_spi_driver =3D {
> > +    .driver =3D {
> > +        .name =3D "st7789v",
>
> And you definitely can't have two drivers with the same name.
>
> > +        .of_match_table =3D st7789v_of_match,
> > +    },
> > +    .probe =3D st7789v_probe,
> > +    .remove =3D st7789v_remove,
> > +    .shutdown =3D st7789v_shutdown,
> > +    .id_table =3D st7789v_id,
> > +};
> > +
>
> Empty line not needed here.
>
> > +module_spi_driver(st7789v_spi_driver);
> > +
> > +MODULE_DESCRIPTION("Sitronix ST7789V DRM driver");
> > +MODULE_AUTHOR("Archit Anant <architanant5@gmail.com>");
> > +MODULE_LICENSE("GPL");
> > \ No newline at end of file
>
>     ^
>
>
> ChenYu



--=20
Sincerely,
Archit Anant
