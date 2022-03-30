Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDCC94EBCDC
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 10:42:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03CFA10EBF4;
	Wed, 30 Mar 2022 08:42:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEE1E10EBF4
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 08:42:01 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id s13so9652236ljd.5
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 01:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=+9NAIZ4he+5wbFjieDpyyOMlrLR7EIBsC/xZAKhyDLs=;
 b=qX2yHyMU56tvgVkUq3+GsLehw23QhR0HI9wkwgFh4z62kcokNSjEkbK9N62tWdAWS5
 O3qcgn9qNcyqFT9RFhmkYav5rjXgVBNBbjYTSefLheaZMYFZv04PqjLi2WZ77FfLJlP0
 5I/OmpMX163Lv1Yr8jNnDneqJHY2DfOq1Kl7he7FjFHWFvBR0aFuh5AAvS2T8tIG5MES
 3eUoGcE3ncWby1ly6qlO6wLNp5Iza02SvmFArlA9SwAD2IT4a7ZcDHgolawD+4Xy2mru
 v8GCquG3Z3gBKBmtWX7MGmXPLx/QCqtvvXH4xEiV7ka11jGl1HGLbsAv0i4PeF8wb2fk
 HJXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=+9NAIZ4he+5wbFjieDpyyOMlrLR7EIBsC/xZAKhyDLs=;
 b=EJtVZvtodDXZ9Qlo2IMedcjRmqKRKs1mjaktfch0yGHHFW33SoTEV1RJ+2WSTgxRoP
 vQKRlM9O2RcH4j5EjVqRGY8dxeW3wmU0KxK8KES8EhFOPiNhrELujlhBZSQf6xEEG3+J
 jzsgAaOUd7JUaFw0TlmDJoajZf1m1hHN+tm35ObKcIQ79AhJiOyv8BO/0K/qQ93keFHK
 ibvRdftAX9wW1cr+5EYPax2ouDsGapuVbWsEir6Swrv+Cvk4yqVzKpy9o1wn755wqjvd
 hbnZuoW43rlOJCqavObMLV7Qo7y8xUjxcuYg2bO5nmRCBu8G7YqGyeOFWPhJJPasVcUV
 knFw==
X-Gm-Message-State: AOAM530znD1OQAF+6Ayc7bjyvYSHQGgfuh/vdHQnwhcmahe/qfU/omG8
 +c/gOgccyK5z5W1FPjXnSW4=
X-Google-Smtp-Source: ABdhPJw0FyGyKqpPQR7uYXRNk9Lah5ZsPZaG3s6fl/io2YKb1BrITcnvQS16RQ1v8yIIEfzSOecF8g==
X-Received: by 2002:a05:651c:204:b0:249:832a:12b with SMTP id
 y4-20020a05651c020400b00249832a012bmr5909138ljn.473.1648629719974; 
 Wed, 30 Mar 2022 01:41:59 -0700 (PDT)
Received: from smtpclient.apple (public-gprs541832.centertel.pl.
 [31.61.235.201]) by smtp.gmail.com with ESMTPSA id
 br38-20020a056512402600b0044a70a9494bsm1810451lfb.67.2022.03.30.01.41.58
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 30 Mar 2022 01:41:59 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH v9 00/23] drm/rockchip: RK356x VOP2 support
From: "piotro.oniszczuk@google.com" <piotr.oniszczuk@gmail.com>
In-Reply-To: <20220330072822.GX12181@pengutronix.de>
Date: Wed, 30 Mar 2022 10:41:56 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <0D8F5951-5375-46B5-BFF0-7ED410371EB7@gmail.com>
References: <20220328151116.2034635-1-s.hauer@pengutronix.de>
 <FB201567-AE5A-4242-82F1-7C55D8F111EA@gmail.com>
 <20220330072822.GX12181@pengutronix.de>
To: Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Peter Geis <pgwipeout@gmail.com>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Andy Yan <andy.yan@rock-chips.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> Wiadomo=C5=9B=C4=87 napisana przez Sascha Hauer =
<s.hauer@pengutronix.de> w dniu 30.03.2022, o godz. 09:28:
>=20
>>=20
>> You can easily reproduce with modetest utility:
>>=20
>> modetest -P 43@67:1920x1080@NV12
>=20
> This only sets the overlay, but how did you get something on the =
screen
> initially?
>=20

I'm not sure that above command only sets plane.
On other SoCs i=E2=80=99m testing it gives expected results: diagonal =
colored stripes.
There is single exception: rk356x with vop2 - where screen is green =
unless i =E2=80=9Efix/enable=E2=80=9D by playing with plane #69  =20

> I did with "modetest -s 69@67:1920x1080 -d" and with this it works as
> expected, I can't reproduce any green screen issue here.

I see you are using plane #69.
Why not #43?
Is plane #43 working ok for you?

I=E2=80=99m using plane #43 because: application (player) - at start -  =
queries all planes and selects first plane offering format being within =
offered formats by provider (video decoder; NV12 from rk356x hantro =
video decoder).

pls look on app log regarding planes discovery and election: =
https://pastebin.com/edAhbcvU

Now - looking what VOP2 reports: https://pastebin.com/8ujkaV9n
is see first plane accepting NV12 is #43 - so my app is electing this =
plane to use for displaying video.

This strategy works well for all 13 platforms i=E2=80=99m supporting =
(only 13 i have in my testbed).

If this approach is - by Yours VOP2 patches goal - is not supported - =
then OK.
I understand this :-)

But - if You want to support DRM features in the same way like other SOC =
are doing (and working well with KODI/MythTV/mpv/etc) - then i think:

1\ DRM plane #43 not supports NV12 - but code wrongly reports NV12 =
format is supported, or
2\ DRM plane #43 is supported - but code has bug resulting with green =
screen.

Pls let me know what you think!


>=20
> I found another problem though which might or might not be related =
with
> your issue. I saw that the overlay is not exactly centered as it ought
> to be. This goes down to wrong delay settings for the overlay, the
> following patch fixes this.
>=20
> Sascha
>=20
> ---------------------------------8<-------------------------------
>=20
> =46rom f9a92401344e8aa3203fca2236dd4a40cc8690f6 Mon Sep 17 00:00:00 =
2001
> From: Sascha Hauer <s.hauer@pengutronix.de>
> Date: Wed, 30 Mar 2022 09:22:26 +0200
> Subject: [PATCH] fixup! drm: rockchip: Add VOP2 driver
>=20
> ---
> drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c =
b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> index 69e9870d5f2dc..7dba7b9b63dc6 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> @@ -1979,10 +1979,10 @@ static void vop2_setup_dly_for_windows(struct =
vop2 *vop2)
> 			sdly |=3D =
FIELD_PREP(RK3568_SMART_DLY_NUM__ESMART1, dly);
> 			break;
> 		case ROCKCHIP_VOP2_SMART0:
> -			sdly |=3D =
FIELD_PREP(RK3568_SMART_DLY_NUM__SMART1, dly);
> +			sdly |=3D =
FIELD_PREP(RK3568_SMART_DLY_NUM__SMART0, dly);
> 			break;
> 		case ROCKCHIP_VOP2_SMART1:
> -			sdly |=3D =
FIELD_PREP(RK3568_SMART_DLY_NUM__SMART0, dly);
> +			sdly |=3D =
FIELD_PREP(RK3568_SMART_DLY_NUM__SMART1, dly);
> 			break;
> 		}
> 	}
> --=20
> 2.30.2
>=20
> --=20
> Pengutronix e.K.                           |                           =
  |
> Steuerwalder Str. 21                       | =
http://www.pengutronix.de/  |
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0  =
  |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   =
+49-5121-206917-5555 |

