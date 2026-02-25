Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cLSnBhCNoGkokwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 19:12:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 706191AD5E6
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 19:12:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59B3C10E9F8;
	Thu, 26 Feb 2026 18:12:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FMB2W8x1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com
 [74.125.82.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A8C410E013
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 21:13:30 +0000 (UTC)
Received: by mail-dy1-f180.google.com with SMTP id
 5a478bee46e88-2bdb17511aaso165320eec.0
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 13:13:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772054009; cv=none;
 d=google.com; s=arc-20240605;
 b=XVjtoz5tOcjitbeiC1LxAhBZTLO8+5DG6R8T0xdr1kjcsDc8HeLPxCo4f1m4JL2+GJ
 YJQ9/CvnQSmO59tKDj1GJzc6zZnI4GpgxPAW22JOv8huWG14eXBtr513sU/dX5pJAMgj
 4PJKc77M9QqMhOgdeZO6J/b/Rz6WaCKq7ibY8LKOApRpHpf4RumTYSCcS6uSLexFMwcm
 l4aStaUf29biMrP/MzMcOjTGEi7GH5Bvj7pawgk4okO9abGVqD0OhvlMmkZSoD415OTd
 0mPADiShEoGic+BoXgLxPVPtHU3qz5q7+o/61RkpKau3C2aUw8wxxbbwEzFORfFj+hbI
 ezug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=kI/lMs29KmFTEwrEKzW23Xiq7sNZ0CV1sKAB78o6EvU=;
 fh=rZtLRHjWsg73YPTerjTVKkdV2xgUQctVS46e4Ut96Pk=;
 b=Oa5EA3WfAbVyTVve7XREGClybpWSlUAY5Fpln8u0vDu+ERhWO9qEUOEzPkyYr0QnSI
 UBBeGYePtHqwxNOvTF6G9PgYJBeGgYLytEg81zDx8LUg8R8Bt6+ZXDQFyE867FdUfmcL
 amoTlLxLSVArbv3H5PcTdqy4FJGgICOSDkV9RfNYiIGX+/ZkW6kGkWFeQtiDcJIDYcem
 /J2yHLm2h8N5vEOf0Me/l5ZxiJahJp1eFg7xOWdiPb5v0sMNaxq/68bTyo6QqNz7Lrrh
 1IhOT542P5kUkJ4FxX5pU3U08ywcrlm1b0M9FzNoFg0oUdmL37d4aHGEyVZXO5kqljJk
 M6Tg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772054009; x=1772658809; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kI/lMs29KmFTEwrEKzW23Xiq7sNZ0CV1sKAB78o6EvU=;
 b=FMB2W8x1wocpHolF3smP4aPYwZNksRFBvg7NA+s7XPe7UlUWTnEbExEhShapT3gUSA
 ngNsIk/lKktU/EwopV3ca0/iiQnEGwuDs1bkq8Ia56yWVWeBHasmvmqa8bas9v0HRTTP
 ZbZLpQmbOBo/Lrvwwp4LjvXPGrWaGihewdtJGhtHYUnXqVgTz5RN5WAkJMnkth3P9Y15
 8nEBD8DEXNCxkOgVw/iZAWitPhgAIW58DHc7HjIfUY6AqM4l0AQ4Fdf81exbHJbJkblm
 86g7xNB0EOEETLpVWNcJ1NtxBib4PXj/SMmKZvDevGLQrK0xXaAl4GEVG1TxnTqyhT+w
 LlGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772054009; x=1772658809;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=kI/lMs29KmFTEwrEKzW23Xiq7sNZ0CV1sKAB78o6EvU=;
 b=PtzD49b+x4pKXSH2y6jAwbjYvk2Chju9fxF5OSVSIcF1vb3mkM9q1tRSFoM+Wu31+t
 0pr0fSwGknWCQ9/+eDNdABrXx2uynSNtEbci6MkLjENgzFWxqpslf9y3IZngonTn+zy5
 AdhrQJSFy97bGoTOzcXhSKAWjKB9e6r7tI5+ecyyznH+IkcSt58qC6vAl8//9po5Nf2C
 3JOcLuL7cboTP2/oUcAHEekIIGol9HcU0y0/YSZMzqXVYW0uOnlci80IE/TtcLnZguq3
 5rkKl1oPpV9YVw/eY1RFvzTham9KRu79pdqdprfkMEaAlkl7lYzEKc4sKjzzt22gLFBN
 QiVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWl6NJPBrXrDVK7OxFSEv3+A0xa+r05cdPoBjWt8DjWW7Xzvjfi5wtzf+NlS+mH1qZ2DiKleDbBkHk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywspx+iG7m+R882vmNdNoxG478M3j/OXh3x0i74R/oYifxZ3O7e
 qGXwVav46wmwLoMHgB0G/3DhPYFun0IlnB9xClCJYz0FZbXFeyDZEf4wN1gIBdyym7KqJWA9hi5
 +U8YvZV02V5VqQPcdFrrSZwNNauMpeE0=
X-Gm-Gg: ATEYQzznGP/UYE83zMgkG7R240EnwLnp3SZ7eb7yLESkXc+FTPR40PuXvTSRChzbuy9
 +lbMA42ocsX4WepWwnzovwWYLaCWirdfVvdp9TzlqCH/VEAXfzX66vhVkWtPdAHKcdQNXgN1iNH
 VICLnTf+WoLdfaCbxbgj6vCrSLZ2n1y6wfvuwWTSIrbRQlcQHebZddQFif2Nrq/n9JqVeR5woHU
 wUa27MMjfDvfgrS15Kekz+DPKq+7YrbgLwlANqLS5jgu3TX7dkPah9hk2e4psnwC1UB65fRV8o6
 J55bDnU=
X-Received: by 2002:a05:693c:6087:b0:2bd:c82e:41c6 with SMTP id
 5a478bee46e88-2bdc82e44bamr1164722eec.22.1772054009358; Wed, 25 Feb 2026
 13:13:29 -0800 (PST)
MIME-Version: 1.0
References: <20260223-panel-patches-v2-0-1b6ad471d540@gmail.com>
 <20260223-panel-patches-v2-2-1b6ad471d540@gmail.com>
 <44283903-f11d-4b13-a6c7-6f0d40a3d00b@ixit.cz>
In-Reply-To: <44283903-f11d-4b13-a6c7-6f0d40a3d00b@ixit.cz>
From: Yedaya Katsman <yedaya.ka@gmail.com>
Date: Wed, 25 Feb 2026 23:13:18 +0200
X-Gm-Features: AaiRm53ns1g6zdXFVqsW7H7CbKjhua17z8nCzLmCQ8NUsxFn6UkK1_Wtl-Egxlw
Message-ID: <CAHuF_ZoZDJ9bGKv9FqAoJsBMjVeyHAJWqoc5NA3sshep3cdDwQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] drm: panel: Add Samsung S6E8FCO
To: David Heidelberg <david@ixit.cz>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 =?UTF-8?B?S2FtaWwgR2/FgmRh?= <kamil.golda@protonmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 26 Feb 2026 18:11:59 +0000
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
	FORGED_RECIPIENTS(0.00)[m:david@ixit.cz,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:kamil.golda@protonmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.996];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yedayaka@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,protonmail.com,lists.freedesktop.org,vger.kernel.org,oss.qualcomm.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 706191AD5E6
X-Rspamd-Action: no action

On Tue, 24 Feb 2026 at 00:00, David Heidelberg <david@ixit.cz> wrote:
>
> On 23/02/2026 21:26, Yedaya Katsman wrote:
> > Add driver for Samsung S6E8FCO DSI video mode panel, used in
> > Xiaomi Mi A3 mobile phone.
> >
> > Co-developed-by: Kamil Go=C5=82da <kamil.golda@protonmail.com>
> > Signed-off-by: Kamil Go=C5=82da <kamil.golda@protonmail.com>
> > Signed-off-by: Yedaya Katsman <yedaya.ka@gmail.com>
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >   MAINTAINERS                                   |   1 +
> >   drivers/gpu/drm/panel/Kconfig                 |  12 ++
> >   drivers/gpu/drm/panel/Makefile                |   1 +
> >   drivers/gpu/drm/panel/panel-samsung-s6e8fco.c | 293 +++++++++++++++++=
+++++++++
> >   4 files changed, 307 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 545d4cf68b9ac27765c7981e668e32cfecf3366b..238b5332eaf0e0cfb983408=
4e24671ccaee79939 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -8187,6 +8187,7 @@ DRM DRIVER FOR SAMSUNG S6E8FCO PANELS
> >   M:  Yedaya Katsman <yedaya.ka@gmail.com>
> >   S:  Maintained
> >   F:  Documentation/devicetree/bindings/display/panel/samsung,s6e8fco.y=
aml
> > +F:   drivers/gpu/drm/panel/panel-samsung-s6e8fco.c
> >
> >   DRM DRIVER FOR SAMSUNG SOFEF00 DDIC
> >   M:  David Heidelberg <david@ixit.cz>
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
>
> The S6E8.. is not panel, but Display Driver IC, the panel from the
> replacement parts is likely one of M1906F9SH M1906F9SI, thus I would say
> M1906F9.
>
> > +       a resolution of 720x1560.
> > +       Found in the Xiaomi Mi A3 smartphone (xiaomi-laurel).
> > +
> >   config DRM_PANEL_SAMSUNG_SOFEF00
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
> >   obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E88A0_AMS452EF01) +=3D panel-samsung=
-s6e88a0-ams452ef01.o
> >   obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E8AA0) +=3D panel-samsung-s6e8aa0.o
> >   obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E8AA5X01_AMS561RA01) +=3D panel-sams=
ung-s6e8aa5x01-ams561ra01.o
> > +obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E8FCO) +=3D panel-samsung-s6e8fco.o
> >   obj-$(CONFIG_DRM_PANEL_SAMSUNG_SOFEF00) +=3D panel-samsung-sofef00.o
> >   obj-$(CONFIG_DRM_PANEL_SEIKO_43WVF1G) +=3D panel-seiko-43wvf1g.o
> >   obj-$(CONFIG_DRM_PANEL_SHARP_LQ079L1SX01) +=3D panel-sharp-lq079l1sx0=
1.o
> > diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e8fco.c b/drivers/gp=
u/drm/panel/panel-samsung-s6e8fco.c
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..7bbbe8af3e2eb9021ed7f55=
5cb4ad2b0d7ea55ee
> > --- /dev/null
> > +++ b/drivers/gpu/drm/panel/panel-samsung-s6e8fco.c
> > @@ -0,0 +1,293 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +// Copyright (c) 2025 Kamil Go=C5=82da <kamil.golda@protonmail.com>
>
> nitpick: you can also drop copyright year from your copyright or update,
> up to you.
>
> > +// Generated with linux-mdss-dsi-panel-driver-generator from vendor de=
vice tree:
> > +// Copyright (c) 2025, The Linux Foundation. All rights reserved.
> > +
> > +#include <linux/backlight.h>
> > +#include <linux/delay.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/mod_devicetable.h>
> > +#include <linux/module.h>
> > +#include <linux/regulator/consumer.h>
> > +
> > +#include <video/mipi_display.h>
> > +
> > +#include <drm/drm_mipi_dsi.h>
> > +#include <drm/drm_modes.h>
> > +#include <drm/drm_panel.h>
> > +#include <drm/drm_probe_helper.h>
> > +
> > +struct s6e8fco_samsungp {
> > +     struct drm_panel panel;
> > +     struct mipi_dsi_device *dsi;
> > +     struct regulator_bulk_data *supplies;
> > +     struct gpio_desc *reset_gpio;
> > +};
> > +
> > +static const struct regulator_bulk_data s6e8fco_samsungp_supplies[] =
=3D {
> > +     { .supply =3D "vddio" },
> > +     { .supply =3D "ldo" },
> > +     { .supply =3D "iovcc" },
> > +};
> > +
> > +static inline
> > +struct s6e8fco_samsungp *to_s6e8fco_samsungp(struct drm_panel *panel)
> > +{
> > +     return container_of_const(panel, struct s6e8fco_samsungp, panel);
> > +}
> > +
> > +static void s6e8fco_samsungp_reset(struct s6e8fco_samsungp *ctx)
> > +{
> > +     gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> > +     usleep_range(12000, 13000);
> > +     gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> > +     usleep_range(2000, 3000);
> > +     gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> > +     usleep_range(10000, 11000);
> > +}
> > +
> > +static int s6e8fco_samsungp_on(struct s6e8fco_samsungp *ctx)
> > +{
> > +     struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D ctx->dsi };
> > +
> > +     mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfc, 0x5a, 0x5a);
>
>    #define s6e3fc2x01_test_key_on_lvl3(ctx) \
>            mipi_dsi_dcs_write_seq_multi(ctx, 0xfc, 0x5a, 0x5a> +
> > +     mipi_dsi_dcs_set_display_brightness_multi(&dsi_ctx, 0x0000);
> > +     mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_CONTROL_DIS=
PLAY,
> > +                                  0x20);
> > +     mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> > +     mipi_dsi_msleep(&dsi_ctx, 50);
> > +     mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
> > +
> > +     mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x04, 0xed);
> > +     mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xed,
> > +                                  0xe4, 0x08, 0x96, 0xa4, 0x2a, 0x72, =
0xe2,
> > +                                  0xca, 0x00);
> > +     mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfc, 0xa5, 0xa5);
>
>    #define s6e3fc2x01_test_key_off_lvl3(ctx) \
>            mipi_dsi_dcs_write_seq_multi(ctx, 0xfc, 0xa5, 0xa5)
>
> etc. etc., check panel-samsung-s6e3fc2x01.c for example (and eventually
> other surrounding drivers) and try to de-mystify the writes as much as
> you can (ofc "reasonably" - as we don't have the datasheet).
> > +     mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0x5a, 0x5a);
> > +     mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfc, 0x5a, 0x5a);
> > +     mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe1, 0x93);
> > +     mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x05, 0xf4);
> > +     mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf4, 0x03);
> > +     mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xed, 0x01, 0x81, 0x04);
> > +     mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0xa5, 0xa5);
> > +     mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfc, 0xa5, 0xa5);
> > +
> > +     return dsi_ctx.accum_err;
> > +}
> > +
> > +static int s6e8fco_samsungp_off(struct s6e8fco_samsungp *ctx)
> > +{
> > +     struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D ctx->dsi };
> > +
> > +
> > +     mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
> > +     mipi_dsi_msleep(&dsi_ctx, 20);
> > +     mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
> > +     mipi_dsi_msleep(&dsi_ctx, 120);
> > +
> > +     return dsi_ctx.accum_err;
> > +}
> > +
> > +static int s6e8fco_samsungp_prepare(struct drm_panel *panel)
> > +{
> > +     struct s6e8fco_samsungp *ctx =3D to_s6e8fco_samsungp(panel);
> > +     struct device *dev =3D &ctx->dsi->dev;
> > +     int ret;
> > +
> > +     ret =3D regulator_bulk_enable(ARRAY_SIZE(s6e8fco_samsungp_supplie=
s), ctx->supplies);
> > +     if (ret < 0) {
> > +             dev_err(dev, "Failed to enable regulators: %d\n", ret);
> > +             return ret;
> > +     }
> > +
> > +     s6e8fco_samsungp_reset(ctx);
> > +
> > +     ret =3D s6e8fco_samsungp_on(ctx);
> > +     if (ret < 0) {
> > +             dev_err(dev, "Failed to initialize panel: %d\n", ret);
> > +             gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> > +             regulator_bulk_disable(ARRAY_SIZE(s6e8fco_samsungp_suppli=
es), ctx->supplies);
> > +             return ret;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int s6e8fco_samsungp_unprepare(struct drm_panel *panel)
> > +{
> > +     struct s6e8fco_samsungp *ctx =3D to_s6e8fco_samsungp(panel);
> > +     struct device *dev =3D &ctx->dsi->dev;
> > +     int ret;
> > +
> > +     ret =3D s6e8fco_samsungp_off(ctx);
> > +     if (ret < 0)
> > +             dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
> > +
> > +     gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> > +     regulator_bulk_disable(ARRAY_SIZE(s6e8fco_samsungp_supplies), ctx=
->supplies);
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct drm_display_mode s6e8fco_samsungp_mode =3D {
>
> name the struct according to the panel, not (only) the DDIC.

Did that (in the next version I will send), changed the rest of
driver to be very S6E8FCO-M1906F9 specific as well.
>
> > +     .clock =3D (720 + 350 + 40 + 294) * (1560 + 17 + 2 + 5) * 60 / 10=
00,
> > +     .hdisplay =3D 720,
> > +     .hsync_start =3D 720 + 350,
> > +     .hsync_end =3D 720 + 350 + 40,
> > +     .htotal =3D 720 + 350 + 40 + 294,
> > +     .vdisplay =3D 1560,
> > +     .vsync_start =3D 1560 + 17,
> > +     .vsync_end =3D 1560 + 17 + 2,
> > +     .vtotal =3D 1560 + 17 + 2 + 5,
> > +     .width_mm =3D 65,
> > +     .height_mm =3D 140,
> > +     .type =3D DRM_MODE_TYPE_DRIVER,
> > +};
> > +
> > +static int s6e8fco_samsungp_get_modes(struct drm_panel *panel,
> > +                                   struct drm_connector *connector)
> > +{
> > +     return drm_connector_helper_get_modes_fixed(connector, &s6e8fco_s=
amsungp_mode);
> > +}
> > +
> > +static const struct drm_panel_funcs s6e8fco_samsungp_panel_funcs =3D {
> > +     .prepare =3D s6e8fco_samsungp_prepare,
> > +     .unprepare =3D s6e8fco_samsungp_unprepare,
> > +     .get_modes =3D s6e8fco_samsungp_get_modes,
> > +};
> > +
> > +static int s6e8fco_samsungp_bl_update_status(struct backlight_device *=
bl)
> > +{
> > +     struct mipi_dsi_device *dsi =3D bl_get_data(bl);
> > +     u16 brightness =3D backlight_get_brightness(bl);
> > +     int ret;
> > +
> > +     dsi->mode_flags &=3D ~MIPI_DSI_MODE_LPM;
> > +
> > +     ret =3D mipi_dsi_dcs_set_display_brightness_large(dsi, brightness=
);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     dsi->mode_flags |=3D MIPI_DSI_MODE_LPM;
> > +
> > +     return 0;
> > +}
> > +
> > +static int s6e8fco_samsungp_bl_get_brightness(struct backlight_device =
*bl)
> > +{
> > +     struct mipi_dsi_device *dsi =3D bl_get_data(bl);
> > +     u16 brightness;
> > +     int ret;
> > +
> > +     dsi->mode_flags &=3D ~MIPI_DSI_MODE_LPM;
> > +
> > +     ret =3D mipi_dsi_dcs_get_display_brightness_large(dsi, &brightnes=
s);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     dsi->mode_flags |=3D MIPI_DSI_MODE_LPM;
> > +
> > +     return brightness;
> > +}
> > +
> > +static const struct backlight_ops s6e8fco_samsungp_bl_ops =3D {
> > +     .update_status =3D s6e8fco_samsungp_bl_update_status,
> > +     .get_brightness =3D s6e8fco_samsungp_bl_get_brightness,
> > +};
> > +
> > +static struct backlight_device *
> > +s6e8fco_samsungp_create_backlight(struct mipi_dsi_device *dsi)
> > +{
> > +     struct device *dev =3D &dsi->dev;
> > +     const struct backlight_properties props =3D {
> > +             .type =3D BACKLIGHT_RAW,
> > +             .brightness =3D 268,
>
> ~ 10% of brightness at boot? What is the scale? Shouldn't make sense to
> set it around 50%? (just asking)
This is just what was configured downstream, it looks bright enough for me
fwiw, I can change it if you want.

> > +             .max_brightness =3D 2047,
> > +     };
> > +
> > +     return devm_backlight_device_register(dev, dev_name(dev), dev, ds=
i,
> > +                                           &s6e8fco_samsungp_bl_ops, &=
props);
> > +}
> > +
> > +static int s6e8fco_samsungp_probe(struct mipi_dsi_device *dsi)
> > +{
> > +     struct device *dev =3D &dsi->dev;
> > +     struct s6e8fco_samsungp *ctx;
> > +     int ret;
> > +
> > +     ctx =3D devm_drm_panel_alloc(dev, struct s6e8fco_samsungp, panel,
> > +                                &s6e8fco_samsungp_panel_funcs,
> > +                                DRM_MODE_CONNECTOR_DSI);
> > +     if (IS_ERR(ctx))
> > +             return PTR_ERR(ctx);
> > +
> > +     ret =3D devm_regulator_bulk_get_const(dev,
> > +                                         ARRAY_SIZE(s6e8fco_samsungp_s=
upplies),
> > +                                         s6e8fco_samsungp_supplies,
> > +                                         &ctx->supplies);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     ctx->reset_gpio =3D devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> > +     if (IS_ERR(ctx->reset_gpio))
> > +             return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
> > +                                  "Failed to get reset-gpios\n");
> > +
> > +     ctx->dsi =3D dsi;
> > +     mipi_dsi_set_drvdata(dsi, ctx);
> > +
> > +     dsi->lanes =3D 4;
> > +     dsi->format =3D MIPI_DSI_FMT_RGB888;
> > +     dsi->mode_flags =3D MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BUR=
ST |
> > +                       MIPI_DSI_CLOCK_NON_CONTINUOUS;
> > +
> > +     ctx->panel.prepare_prev_first =3D true;
> > +
> > +     ctx->panel.backlight =3D s6e8fco_samsungp_create_backlight(dsi);
> > +     if (IS_ERR(ctx->panel.backlight))
> > +             return dev_err_probe(dev, PTR_ERR(ctx->panel.backlight),
> > +                                  "Failed to create backlight\n");
> > +
> > +     drm_panel_add(&ctx->panel);
> > +
> > +     ret =3D mipi_dsi_attach(dsi);
> > +     if (ret < 0) {
> > +             drm_panel_remove(&ctx->panel);
> > +             return dev_err_probe(dev, ret, "Failed to attach to DSI h=
ost\n");
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static void s6e8fco_samsungp_remove(struct mipi_dsi_device *dsi)
> > +{
> > +     struct s6e8fco_samsungp *ctx =3D mipi_dsi_get_drvdata(dsi);
> > +     int ret;
> > +
> > +     ret =3D mipi_dsi_detach(dsi);
> > +     if (ret < 0)
> > +             dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n"=
, ret);
> > +
> > +     drm_panel_remove(&ctx->panel);
> > +}
> > +
> > +static const struct of_device_id s6e8fco_samsungp_of_match[] =3D {
> > +     { .compatible =3D "samsung,s6e8fco" },
>
> Optimally the compatible should reflect the panel used, eg something
> like samsung,s6e8fco-m1906f9 . It's possible there will be more panels
> using this DDIC, then this would make it much clearer.

Will do
> Happy to see another phone panel heading to mainline, thanks for your wor=
k!

Thanks for your review!
> David
>
> > +     { /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(of, s6e8fco_samsungp_of_match);
> > +
> > +static struct mipi_dsi_driver s6e8fco_samsungp_driver =3D {
> > +     .probe =3D s6e8fco_samsungp_probe,
> > +     .remove =3D s6e8fco_samsungp_remove,
> > +     .driver =3D {
> > +             .name =3D "panel-samsung-s6e8fco",
> > +             .of_match_table =3D s6e8fco_samsungp_of_match,
> > +     },
> > +};
> > +module_mipi_dsi_driver(s6e8fco_samsungp_driver);
> > +
> > +MODULE_AUTHOR("Kamil Go=C5=82da <kamil.golda@protonmail.com>");
> > +MODULE_DESCRIPTION("DRM driver for s6e8fco samsung amoled video mode d=
si panel");
> > +MODULE_LICENSE("GPL");
> >
>
> --
> David Heidelberg
>

Thanks, Yedaya
