Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qA6lDVxinWksPQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 09:33:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD145183C0F
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 09:33:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BC8210E4F5;
	Tue, 24 Feb 2026 08:33:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VKzKz9II";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com
 [74.125.82.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42E1310E12A
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 20:17:17 +0000 (UTC)
Received: by mail-dy1-f174.google.com with SMTP id
 5a478bee46e88-2b82c605dbdso4488509eec.0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 12:17:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771877836; cv=none;
 d=google.com; s=arc-20240605;
 b=KjsVU0OnVA/pk6ckTxdrfNnfn3G2ToyOSkzN+RgdKh0Nbc0oIQXrS9pxQpOQ4DQ6vI
 /nIk6zOLtFQyFpNJrZ9B6QPJPNBvXW3mstl7ev7e82QNUn8HpC06p2bsTOqCdDdIPmTR
 Da9D7WUumogg+Y9RC0xm0aLkSmBJXNdW8H2W46yQT0TCHSdOLl/eortykFPYRtRS0NRb
 AphWP/Vc9HpufuOYaotbm638ONKxxdpjmK12Pmhxw0V+3O309zJaIJ3JwEKkvuW/Ca0Z
 TPN6YfTVLX9FporamTPFRAeoqsXYxjaNHWV6FRFJLC5wbHu7OvyFAfJ6VOrxKPCMXZha
 1GWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=ku3Mg3/oKQLa8vntyumKsTib+5PskclBL/D3UhM5Vrc=;
 fh=BFpjNDyjYNoApPHVQ6sri+AkMuM3985MVq6OzrPxji8=;
 b=IHw/lFuiI+pSf+pTWoqlAjHMmOWeypxudcYBcg7drcyg/jCbZ1P5HhOqLjQJ8+yuQL
 VcqI1ZZgBd7rAyWU5PnoBVATnZ3LFIE78ASnolH7MKYZZEOTVdzcRCWEDGyVgYqU7z95
 /O1xi4XXcIWZ/inlXQsqPmbSKVtayuPiYNUVHUD8H8OVvxSiBnhWwKfdMF1GGeAA1aE2
 Slsb7ybQz9MU+gze0zT75N+wsnMd5sM8gYcZE96dtt8VzxHCsU+gd5DKmVKOPBx29rK7
 TwqN+lpmoqONvMDLR4dmp+9kirsuJGaVyjaHDdaVRN6avhg7edGzIQlmIrr3HMlqT8tQ
 cSpQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771877836; x=1772482636; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ku3Mg3/oKQLa8vntyumKsTib+5PskclBL/D3UhM5Vrc=;
 b=VKzKz9IIS7aIAgLqTi6jO3Brbujf9BBNKEu0/XbmhD8nrDLjOO6H/Re59RLRwQoUNK
 ykjeSmMOeJ4Z4hGD1Lz3/54aJ+uqkoZoMXP9SBlhIC8rBGIFTwWwXr5gPn+8AQCXtvpi
 BCw8jsFPFEPbgi0MNsFqYDfERGQdjRD1SzC8xNbNDv8ij8KzSJjQ0iyeS0crUb3VN2r8
 bDq4sDg/keBQN6Adm4NSPyHo4r6x1LEE/L86nXAFEXscOJ/bMnBxoR2dQ/wnIZsqhISw
 awoK+VMAVmOAIFRbDvT9LZwvD/O9KJM2AqouRiVne6RtsBZKfD2H7P9Fx53vApZjBfdD
 h86g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771877836; x=1772482636;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ku3Mg3/oKQLa8vntyumKsTib+5PskclBL/D3UhM5Vrc=;
 b=fhsaQ/I16tyCb+jRW3N39yFPuFz8yo45gImtqXMV/Lar5uGRvi9n9M2eQdeCoXkqNi
 xna/JKfs1qVPfGbloNm2WczsCHgwp14cp993QHSA1cR4VS+13Uq70CfB857TijqHli1M
 0rr949JxcAq2dZ3gSp9naWLifp/+MRSnxybIlkMoc3Iu5CLfSllKKJQFXTjiP0guVY7O
 slVp1EWrCJRoTvDUynLL4/B8qRXjF6zBPgPs38/2/R/Am8upTK9HmsfTNQNL+t73br2o
 00nJQC8xEiyfzcivK8M2qhOncl5s56gs0OJ5KnwU8uXliXi6yq8HZ75ass/rhGziufgc
 8J9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWx9nSsKKC9FUeT7Zdjuu5LcMHtCQA7sHEaV1iJvDqEli/Zgv0Hpm7A162zlWG+CCLMKLE7eSfCgo0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx7HeuGMaIWBDQKAqgz7MawPg4+bn45jjNYNSVzrksxbQgs9Qnb
 W9o5L90ZnNqSw0r+qbG19bQOyvRMB9Pxa4Hz6ACd9nhY1oFqLkq6mJPil3iayXAF+pKZONO/Y93
 ciX94HpsqMgn7fSIlojSTFOxJof2W2z0=
X-Gm-Gg: ATEYQzzYXOh4uw/OdCjDtMf5rsoeFFuv7SLmHm7jBlDsUKBU5kXOUwZ6lSRtWZbmaxM
 zv6+v+h2Pwrkem1psLoQ2R+dgtXEorRKDbJm697lC6LE/0tgQldwNia0tfdjt1Eqa/r0kEnxHJP
 kVSgsF+IncVyGShv40c4P73vrje534PplCHTMdgxr8Jbp1/vAi6FMiUxQgMVkiGdFKxApDPgJhL
 fGsPGNeyAqkwsblCpRiXeRUiQWdAqLACdRiNUxR5cJ5Kq1C4iAu67Yja0PEkXkWAyGv70u9SqIp
 c3tC/jI=
X-Received: by 2002:a05:7300:2308:b0:2ba:8e16:260e with SMTP id
 5a478bee46e88-2bd7bae98aemr4722722eec.11.1771877835876; Mon, 23 Feb 2026
 12:17:15 -0800 (PST)
MIME-Version: 1.0
References: <20260223-panel-patches-v1-0-7756209477f9@gmail.com>
 <20260223-panel-patches-v1-2-7756209477f9@gmail.com>
 <5ibwkfovm2vvpin475c47lueomscnetwv6myglxqtaw7x26l2m@q6p5vye7itnh>
In-Reply-To: <5ibwkfovm2vvpin475c47lueomscnetwv6myglxqtaw7x26l2m@q6p5vye7itnh>
From: Yedaya Katsman <yedaya.ka@gmail.com>
Date: Mon, 23 Feb 2026 22:17:02 +0200
X-Gm-Features: AaiRm50W1tsviNG90UeMm0nn7lr90F7cH3ejpUjkJcKTj0bb54NI64GJklPJBu8
Message-ID: <CAHuF_ZqVUvQSvQNnC55kDGE5KiDPPOphZCxOSmW_uqp5DGeCAA@mail.gmail.com>
Subject: Re: [PATCH 2/3] drivers: gpu: drm: panel: Add Samsung S6E8FCO
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 =?UTF-8?B?S2FtaWwgR2/FgmRh?= <kamil.golda@protonmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 24 Feb 2026 08:33:17 +0000
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:kamil.golda@protonmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:~postmarketos/upstreaming@lists.sr.ht,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[yedayaka@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yedayaka@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,protonmail.com,lists.sr.ht,lists.freedesktop.org,vger.kernel.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid,protonmail.com:email,ixit.cz:email,qualcomm.com:email]
X-Rspamd-Queue-Id: DD145183C0F
X-Rspamd-Action: no action

On Mon, 23 Feb 2026 at 21:37, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Mon, Feb 23, 2026 at 04:24:03PM +0200, Yedaya Katsman wrote:
> > Add driver for Samsung S6E8FCO DSI video mode panel, used in
> > Xiaomi Mi A3 mobile phone.
> >
> > Co-developed-by: Kamil Go=C5=82da <kamil.golda@protonmail.com>
> > Signed-off-by: Kamil Go=C5=82da <kamil.golda@protonmail.com>
> > Signed-off-by: Yedaya Katsman <yedaya.ka@gmail.com>
> > ---
> >  MAINTAINERS                                   |   1 +
> >  drivers/gpu/drm/panel/Kconfig                 |  12 ++
> >  drivers/gpu/drm/panel/Makefile                |   1 +
> >  drivers/gpu/drm/panel/panel-samsung-s6e8fco.c | 293 ++++++++++++++++++=
++++++++
> >  4 files changed, 307 insertions(+)
>
> Please change the subject to follow "drm: panel: foo bar baz".
Ok
> With that in place:
>
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Thanks
>
>
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 545d4cf68b9ac27765c7981e668e32cfecf3366b..238b5332eaf0e0cfb983408=
4e24671ccaee79939 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -8187,6 +8187,7 @@ DRM DRIVER FOR SAMSUNG S6E8FCO PANELS
> >  M:   Yedaya Katsman <yedaya.ka@gmail.com>
> >  S:   Maintained
> >  F:   Documentation/devicetree/bindings/display/panel/samsung,s6e8fco.y=
aml
> > +F:   drivers/gpu/drm/panel/panel-samsung-s6e8fco.c
> >
> >  DRM DRIVER FOR SAMSUNG SOFEF00 DDIC
> >  M:   David Heidelberg <david@ixit.cz>
> > diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kcon=
fig
> > index 7a83804fedca1b688ce6fbe4295ec9009007e693..734640bb3f73c83e9273573=
aeb720ea1ba20862f 100644
> > --- a/drivers/gpu/drm/panel/Kconfig
> > +++ b/drivers/gpu/drm/panel/Kconfig
> > @@ -893,6 +893,18 @@ config DRM_PANEL_SAMSUNG_S6E8AA5X01_AMS561RA01
> >         ~5.6 inch AMOLED display, and the controller is driven by the M=
IPI
> >         DSI protocol with 4 lanes.
> >
> > +config DRM_PANEL_SAMSUNG_S6E8FCO
> > +     tristate "Samsung S6E8FCO DSI video mode panel"
> > +     depends on OF
> > +     depends on BACKLIGHT_CLASS_DEVICE
> > +     select DRM_MIPI_DSI
> > +     select VIDEOMODE_HELPERS
> > +     help
> > +       Say Y or M here if you want to enable support for the Samsung v=
ideo
> > +       mode panel S6E8FCO. The panel has a 6.09 inch AMOLED display, w=
ith
> > +       a resolution of 720x1560.
> > +       Found in the Xiaomi Mi A3 smartphone (xiaomi-laurel).
> > +
> >  config DRM_PANEL_SAMSUNG_SOFEF00
> >       tristate "Samsung SOFEF00 DSI panel controller"
> >       depends on OF
> > diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Mak=
efile
> > index b9562a6fdcb38bfd0dfee9e8c11e16149ada4386..54eca60e5b57328ea94ed78=
80f4dead981f87fc1 100644
> > --- a/drivers/gpu/drm/panel/Makefile
> > +++ b/drivers/gpu/drm/panel/Makefile
> > @@ -91,6 +91,7 @@ obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E88A0_AMS427AP24) +=
=3D panel-samsung-s6e88a0-ams4
> >  obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E88A0_AMS452EF01) +=3D panel-samsung-=
s6e88a0-ams452ef01.o
> >  obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E8AA0) +=3D panel-samsung-s6e8aa0.o
> >  obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E8AA5X01_AMS561RA01) +=3D panel-samsu=
ng-s6e8aa5x01-ams561ra01.o
> > +obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E8FCO) +=3D panel-samsung-s6e8fco.o
> >  obj-$(CONFIG_DRM_PANEL_SAMSUNG_SOFEF00) +=3D panel-samsung-sofef00.o
> >  obj-$(CONFIG_DRM_PANEL_SEIKO_43WVF1G) +=3D panel-seiko-43wvf1g.o
> >  obj-$(CONFIG_DRM_PANEL_SHARP_LQ079L1SX01) +=3D panel-sharp-lq079l1sx01=
.o
> > diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e8fco.c b/drivers/gp=
u/drm/panel/panel-samsung-s6e8fco.c
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..0a1a1c680ee143d2429a6e1=
ea59a4fdd16b156b4
> > --- /dev/null
> > +++ b/drivers/gpu/drm/panel/panel-samsung-s6e8fco.c
> > @@ -0,0 +1,293 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +// Copyright (c) 2025 Kamil Go=C5=82da <kamil.golda@protonmail.com>
> > +// Generated with linux-mdss-dsi-panel-driver-generator from vendor de=
vice tree:
> > +// Copyright (c) 2026, The Linux Foundation. All rights reserved.
>
> Hmm, so Kamil worked on it before it was written by LF? Are you sure
> that the year here is correct?

What happened is kamil worked on it, and then I regenerated it again
with the script. Re-considering it, the LF copyright should be from
the start, I shouldn't have modified it, will fix, thanks for pointing
it out!

> > +
>
> > +
> > +static const struct backlight_ops s6e8fco_samsungp_bl_ops =3D {
> > +     .update_status =3D s6e8fco_samsungp_bl_update_status,
> > +     .get_brightness =3D s6e8fco_samsungp_bl_get_brightness,
>
> Does it actually return the written value?
Yes, writing to /sys/class/backlight/5e94000.dsi.0/brightness and
reading from /sys/class/backlight/5e94000.dsi.0/actual_brightness
works correctly.

> > +};
> > +
>
> --
> With best wishes
> Dmitry

Regards, Yedaya
