Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD5B4F5A49
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 11:47:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A461B10F269;
	Wed,  6 Apr 2022 09:47:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 471B710F243
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 09:47:33 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id d5so3093118lfj.9
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Apr 2022 02:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=E42yxEwN9hE1F4mWuGhw6zVEQZFBfw5J79gP+8Gl7J0=;
 b=iIjUtMWiW9sFTZs6ixgTkqoKUp9KooOrSiS9xGSuEy6/zJouQvGjaePtj3kWP5pzMD
 yTfKsp1ezsj9aZv6DkThlDhU+1QlwGrdUokDb493Jnpju0dK8/uGZQx4wEK6F9fft2nt
 AARzVJuVqUYQrdbf7wgRZJ4AKMuGQxj3qG3ReyNmigbaCWBjH2FLVLWZfrUq8Iub9RVu
 99npCDtAWWcjaLY9mHUhvWh08uqmN0OQ2Q8at89tr49Kog5UE8NGCROwS3flh7go1/NK
 MgKdW5OsYySzV9uK+gWIleRdTjgIjGBgSYyUzyIhwq+tNmr10Tw5hTtYr6EI4WwzqgOT
 iM6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=E42yxEwN9hE1F4mWuGhw6zVEQZFBfw5J79gP+8Gl7J0=;
 b=nibeJutIWZoNPmDStwCsh5ujFEn5koUzGc3Tnus+4l8abaTHCIHFHLwmKM0P7NjJlx
 We7oRN0HAe5eTc80vBTzhEP4lMoXEn8zZXFBarNnyj0I0UAOCdqm4hrwweWNkhAzlLmY
 K4PmxpLG4c5/nYHKtMweYpINUZENTC337AQHTZaTbZ2Pige8kM/bQsVXdf482sqYkqGg
 GBHGFerPFz2eoWZ0cVghVaRCA58oN/NlJWVbLmMBhIyxXAVTHEsIBVdL1w5ha5rCZQu5
 cYqYBWHeuMzhwjvuGjJy/OKC+ivDheP9caEjnsYHKG/zypfKimxP7+uEnIJFpIIfBE1V
 0y8Q==
X-Gm-Message-State: AOAM530W2grhc+XuwwWhAtDSpY7VDrkpxONH1MgXle0KCZ2oPjudv7Hy
 u1Pl7Nf/gIkpdEcZWI43luo=
X-Google-Smtp-Source: ABdhPJwC+eyrRKTQfRnsJir5jLb4gCz3POVqq+LV1mkriib2J7vxsIWGH9wtcC3p7KlK7L+G3REqyA==
X-Received: by 2002:a05:6512:3341:b0:44a:eb29:c59c with SMTP id
 y1-20020a056512334100b0044aeb29c59cmr5331160lfd.596.1649238451239; 
 Wed, 06 Apr 2022 02:47:31 -0700 (PDT)
Received: from smtpclient.apple (31-178-191-245.dynamic.chello.pl.
 [31.178.191.245]) by smtp.gmail.com with ESMTPSA id
 m22-20020a0565120a9600b0044a93d21093sm1776972lfu.279.2022.04.06.02.47.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 06 Apr 2022 02:47:30 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH v9 00/23] drm/rockchip: RK356x VOP2 support
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <5420D26D-34FD-4637-B602-F6271E38BB8D@gmail.com>
Date: Wed, 6 Apr 2022 11:47:22 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <BA4C591F-D115-43D2-BF59-A75B29889E50@gmail.com>
References: <20220328151116.2034635-1-s.hauer@pengutronix.de>
 <FB201567-AE5A-4242-82F1-7C55D8F111EA@gmail.com>
 <20220401125205.GL4012@pengutronix.de>
 <5420D26D-34FD-4637-B602-F6271E38BB8D@gmail.com>
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



> Wiadomo=C5=9B=C4=87 napisana przez Piotr Oniszczuk =
<piotr.oniszczuk@gmail.com> w dniu 01.04.2022, o godz. 15:05:
>=20
>=20
>=20
>> Wiadomo=C5=9B=C4=87 napisana przez Sascha Hauer =
<s.hauer@pengutronix.de> w dniu 01.04.2022, o godz. 14:52:
>>=20
>> Based on the discussion with Andy please try the following patch, it
>> should fix your green screen issue. Note that with this patch the
>> CRTC and plane ids will change, so the modetest commands need to be
>> adjusted accordingly.
>>=20
>> Sascha
>>=20
>> -------------------------8<---------------------------
>>=20
>> --=20
>> =46rom cbc03073623a7180243331ac24c3afaf9dec7522 Mon Sep 17 00:00:00 =
2001
>> From: Sascha Hauer <s.hauer@pengutronix.de>
>> Date: Fri, 1 Apr 2022 14:48:49 +0200
>> Subject: [PATCH] fixup! drm: rockchip: Add VOP2 driver
>>=20
>> ---
>> drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 14 ++++++++++++++
>> 1 file changed, 14 insertions(+)
>>=20
>> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c =
b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
>> index 7dba7b9b63dc6..1421bf2f133f1 100644
>> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
>> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
>> @@ -2287,6 +2287,20 @@ static int vop2_create_crtc(struct vop2 *vop2)
>> 			}
>> 		}
>>=20
>> +		if (vop2->data->soc_id =3D=3D 3566) {
>> +			/*
>> +			 * On RK3566 these windows don't have an =
independent
>> +			 * framebuffer. They share the framebuffer with =
smart0,
>> +			 * esmart0 and cluster0 respectively.
>> +			 */
>> +			switch (win->data->phys_id) {
>> +			case ROCKCHIP_VOP2_SMART1:
>> +			case ROCKCHIP_VOP2_ESMART1:
>> +			case ROCKCHIP_VOP2_CLUSTER1:
>> +				continue;
>> +			}
>> +		}
>> +
>> 		if (win->type =3D=3D DRM_PLANE_TYPE_OVERLAY)
>> 			possible_crtcs =3D (1 << nvps) - 1;
>>=20
>> --=20
>> 2.30.2
>>=20
>> Pengutronix e.K.                           |                          =
   |
>> Steuerwalder Str. 21                       | =
http://www.pengutronix.de/  |
>> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0 =
   |
>> Amtsgericht Hildesheim, HRA 2686           | Fax:   =
+49-5121-206917-5555 |
>=20
> Sascha
>=20
> Now works perfectly!
> (hd playback with 3.5...5.5% cpu while rendering to drm plane)
>=20
> Fantastic work of You!

Sascha,

Having vop2 finally working with drm planes rendering i discovered =
another issue: overlay osd is invisible at playback.=20

context: player draws video on plane #X and osd on overlay plane #Y
When user do i.e. seek at playback - app uses overlay OSD plane to =
display OSD to user. This approach is used by majority of players (KODI, =
etc.)

This works well on all platforms i have  - except rk3566=20

For me it looks like z-order vop2 issue or alpha blending issue.
As this is only on rk3566 and only on drm-planes mode - issue is vop2 =
related imho.

what you think?


