Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A024EEDCB
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 15:05:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7952510E31B;
	Fri,  1 Apr 2022 13:05:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AA7510E31B
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 13:05:22 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id p10so4756645lfa.12
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Apr 2022 06:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=0ucnjFKd28Tf+W0k0cKJLPb/VcjJsSWQNUvFfYSvuec=;
 b=lwjqcDZowyUU8SuD8z2KZvDAD1mucsBt5qUOqYI/eoVYbRsRNjll6kgXkuvojbg5MI
 UYk0eutBGy0i3pSAcp0GidT4aybG37Fqt86TTJVUeFDo7dr4eTrqnj7wZwSGCiMcMP7w
 caFA/JAaHsx/PKVdUIx2D214DPjOaf0vmTYieL/8CJnG/GjRImDjedGWKlfL+XVtBgHi
 R4zRaKmy04yuGg4XzDiM0Q5GBGqS7VUrrK6ysSTd9QcYnaHuLct+9KUkwQUswkYwJ+4h
 rqOZD5pRnVJ3z2cUnsUVmJaFRUM1zShFtulA0SJXcb68tA72iU7cOqd2W+3iP1GbhqhR
 gw3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=0ucnjFKd28Tf+W0k0cKJLPb/VcjJsSWQNUvFfYSvuec=;
 b=p5WZxCOiW8V5DNU8wJeUI6xR/lUMCUuTm6lbezjKiThyJjEfO3diZ3Xq4qEWSUS7mb
 ELAlngjtuorqBc86UEK9K3LzRqGCj/H73xUu0ahwnp+JGO4XV9nVhzBFyzecYtgvH6Ip
 fJbQYV+LQ6xzVVeZdySWs2E9WsFk1yrduAewC4pCvHXv9UT3PKQB0YXbUVLIko2H8/cr
 A0TQ2mLdGpnvYPTxRafJVBsT79ba3pZOFlWmvxzw7Aade5TK/vVv+LHwZU2fLMldXMYF
 VZgCMZk38XUO0WlFTdgzEpHq/RWng8u4H+R9PZZTZAqXPTKNPgzrPJjVsEHHxby/x3I2
 UhIg==
X-Gm-Message-State: AOAM533BNP6eON8F6EUOM17snZgbFgm0NJwOCFeTHp71XCkAcaPjWwvq
 Lx1wCMHjT955czM2mm3VMoc=
X-Google-Smtp-Source: ABdhPJyZ5PdSzE8MpJHh+wukQwEggZ85lWeSn46EcyF/aB7nRi7vu866Il+NdtIoeNpkflbb91DjMg==
X-Received: by 2002:a19:5f16:0:b0:44a:2507:5e90 with SMTP id
 t22-20020a195f16000000b0044a25075e90mr14520906lfb.24.1648818320442; 
 Fri, 01 Apr 2022 06:05:20 -0700 (PDT)
Received: from smtpclient.apple (31-178-191-245.dynamic.chello.pl.
 [31.178.191.245]) by smtp.gmail.com with ESMTPSA id
 i8-20020a0565123e0800b0044a74e0954dsm238724lfv.66.2022.04.01.06.05.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 01 Apr 2022 06:05:19 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH v9 00/23] drm/rockchip: RK356x VOP2 support
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <20220401125205.GL4012@pengutronix.de>
Date: Fri, 1 Apr 2022 15:05:16 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <5420D26D-34FD-4637-B602-F6271E38BB8D@gmail.com>
References: <20220328151116.2034635-1-s.hauer@pengutronix.de>
 <FB201567-AE5A-4242-82F1-7C55D8F111EA@gmail.com>
 <20220401125205.GL4012@pengutronix.de>
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
<s.hauer@pengutronix.de> w dniu 01.04.2022, o godz. 14:52:
>=20
> Based on the discussion with Andy please try the following patch, it
> should fix your green screen issue. Note that with this patch the
> CRTC and plane ids will change, so the modetest commands need to be
> adjusted accordingly.
>=20
> Sascha
>=20
> -------------------------8<---------------------------
>=20
> --=20
> =46rom cbc03073623a7180243331ac24c3afaf9dec7522 Mon Sep 17 00:00:00 =
2001
> From: Sascha Hauer <s.hauer@pengutronix.de>
> Date: Fri, 1 Apr 2022 14:48:49 +0200
> Subject: [PATCH] fixup! drm: rockchip: Add VOP2 driver
>=20
> ---
> drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 14 ++++++++++++++
> 1 file changed, 14 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c =
b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> index 7dba7b9b63dc6..1421bf2f133f1 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> @@ -2287,6 +2287,20 @@ static int vop2_create_crtc(struct vop2 *vop2)
> 			}
> 		}
>=20
> +		if (vop2->data->soc_id =3D=3D 3566) {
> +			/*
> +			 * On RK3566 these windows don't have an =
independent
> +			 * framebuffer. They share the framebuffer with =
smart0,
> +			 * esmart0 and cluster0 respectively.
> +			 */
> +			switch (win->data->phys_id) {
> +			case ROCKCHIP_VOP2_SMART1:
> +			case ROCKCHIP_VOP2_ESMART1:
> +			case ROCKCHIP_VOP2_CLUSTER1:
> +				continue;
> +			}
> +		}
> +
> 		if (win->type =3D=3D DRM_PLANE_TYPE_OVERLAY)
> 			possible_crtcs =3D (1 << nvps) - 1;
>=20
> --=20
> 2.30.2
>=20
> Pengutronix e.K.                           |                           =
  |
> Steuerwalder Str. 21                       | =
http://www.pengutronix.de/  |
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0  =
  |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   =
+49-5121-206917-5555 |

Sascha

Now works perfectly!
(hd playback with 3.5...5.5% cpu while rendering to drm plane)

Fantastic work of You!


