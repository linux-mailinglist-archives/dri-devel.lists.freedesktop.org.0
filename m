Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A76D8D7435
	for <lists+dri-devel@lfdr.de>; Sun,  2 Jun 2024 09:59:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A20F410E049;
	Sun,  2 Jun 2024 07:59:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZJjw1mNx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F49F10E049
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Jun 2024 07:59:12 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-a68f10171bdso24610866b.0
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Jun 2024 00:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717315150; x=1717919950; darn=lists.freedesktop.org;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GNH+q9S8FeOpIJMVISEmaZGU+MHC6ijhQj3KIdeVPco=;
 b=ZJjw1mNxeM7i98m6dtjGBTId9dohIXkFb0I2mlR4bo+Da9JtumD4+AQhQPOpSMQHy/
 NgQYBvwA8JG5haEfD45/BLc16Ine4BH3tYwdkFMEzya1QWFaE1A0KkQZjOCqsnPLa3V2
 wESp7OeTkcuZ2xgWrYf136ae2mhsqTIhQPcFX+nv92MOVthauqQQts+tNLFP1ITtyM1c
 yIjZTMy3Pmhh6/Ctz9L1hTg5SIFUV6ClRKrVnvcwJvHF/XHplDdvoKD0gXLbEojZdbWV
 jR/akumoi2sz3lIpKChHJMMzixKaxVMf1DW7FYTCb33eeA0mm0SSBNEb5KqWarkg0rpi
 spIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717315150; x=1717919950;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GNH+q9S8FeOpIJMVISEmaZGU+MHC6ijhQj3KIdeVPco=;
 b=Mr774l9e/PxKmoB6ph7tZsnsyTMrfFTm9BmGOlfsadeg3iEGKNFQobX9n/K0gmNhs5
 x0rjPuWttS0z/X31ns8bMJSyjq+dvMaR62LDe9lZE9iU6HxWJhqGI+MK/s/hLUuAuyWH
 jd89fHf94UWVOCopHfz7/kNIqohUWkGzx+2FLefD/Got2C/gT+bFwTgYwMqak7m0JiIi
 1pp0Fpr3zY+03AUsGPdDp1hBI0o8kxAZ9+2g4X1shcpBl+CUiBzusVEhn5sd06SkASqP
 Fa7UDNWo6dFd+SqrS5t6DQd7BEs2WJm3QWQWDdAnLlkxADRzxhPiTLyI9y1tBYg3yxxT
 Ujfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtzyrEcGHRY+nre5ts9cjICCVpRzcKBSGIvq2a4GkKPVi1ZtpqdODAJfBAOzyCkIoq9f6tZJES5BojF11CTUCFCbWaEqA7isoyL1frTHxt
X-Gm-Message-State: AOJu0Yy1mMGARfgZZaYrfH4C30uZbnEK9NqhPVqiWltrgd+GWZsGnPGI
 PCmJ+1h6RiMc9y6GIa6NgWCFak7mCAwwyn4qxQGVY8iTt8GH0Hd0
X-Google-Smtp-Source: AGHT+IEzoVR/QekSFlxwlG1y8gK8vH3Bdx5XnDmjrRTB2zenBkCf2dUGrpltlAYKRVdfu3RIHU7Dww==
X-Received: by 2002:a17:906:f59c:b0:a68:e335:3e67 with SMTP id
 a640c23a62f3a-a68e3354039mr160861566b.17.1717315149813; 
 Sun, 02 Jun 2024 00:59:09 -0700 (PDT)
Received: from smtpclient.apple (84-10-100-139.static.chello.pl.
 [84.10.100.139]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a68f6a557f9sm42073966b.83.2024.06.02.00.59.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 02 Jun 2024 00:59:09 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.15\))
Subject: Re: [PATCH 00/14] Add initial support for the Rockchip RK3588 HDMI TX
 Controller
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <20240601-b4-rk3588-bridge-upstream-v1-0-f6203753232b@collabora.com>
Date: Sun, 2 Jun 2024 09:59:03 +0200
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sandy Huang <hjc@rock-chips.com>,
 Heiko Stuebner <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Mark Yao <markyao0591@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, kernel@collabora.com,
 Alexandre ARNOUD <aarnoud@me.com>, Luis de Arquer <ldearquer@gmail.com>,
 Algea Cao <algea.cao@rock-chips.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <E1316DC2-0822-4B82-BCD0-99904D4741EF@gmail.com>
References: <20240601-b4-rk3588-bridge-upstream-v1-0-f6203753232b@collabora.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
X-Mailer: Apple Mail (2.3654.120.0.1.15)
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

(resent as plain text instead of html)
=20
Cristian,

I was awaiting over year for this work!

I=E2=80=99m devel. 2 distros where single mainline kernel serves =
2835/2711/2712/h6/h313/h616/h618/rk3328/rk3399/rk3566/rk3568/rk3588/s905/s=
912/sm1/g12.

Before this work rk3588 was excluded because rk3588 hdmi was regressing =
hdmi on other socs.
With this code all other socs seems work ok now. Perfect.

As one of my project is multimedia appliance - good news is that now i =
can nicely play hdtv on rk3588 using mainline common 6.9.3 kernel =
and=E2=80=A6.started to hear from my users a lot of Qs like: =E2=80=9Eah =
so nice! rk3588 now works nicely=E2=80=A6.but where is hdmi audio and =
cec?=E2=80=9D

It will be fantastic to add (e.g. by backport Detlev =
https://gitlab.collabora.com/hardware-enablement/rockchip-3588/linux/-/tre=
e/rk3588-hdmi-audio?ref_type=3Dheads ) audio code to get basic support =
hdmi audio?
  =20
thx again for fantastic work!

> Wiadomo=C5=9B=C4=87 napisana przez Cristian Ciocaltea =
<cristian.ciocaltea@collabora.com> w dniu 01.06.2024, o godz. 15:12:
>=20
> The RK3588 SoC family integrates a Quad-Pixel (QP) variant of the
> Synopsys DesignWare HDMI TX controller used in the previous SoCs.
>=20
> It is HDMI 2.1 compliant and supports the following features, among
> others:
>=20
> * Fixed Rate Link (FRL)
> * 4K@120Hz and 8K@60Hz video modes
> * Variable Refresh Rate (VRR) including Quick Media Switching (QMS)
> * Fast Vactive (FVA)
> * SCDC I2C DDC access
> * TMDS Scrambler enabling 2160p@60Hz with RGB/YCbCr4:4:4
> * YCbCr4:2:0 enabling 2160p@60Hz at lower HDMI link speeds
> * Multi-stream audio
> * Enhanced Audio Return Channel (EARC)
>=20
> This is the last required component that needs to be supported in =
order
> to enable the HDMI output functionality on the RK3588 based SBCs, such
> as the RADXA Rock 5B. The other components are the Video Output
> Processor (VOP2) and the Samsung IP based HDMI/eDP TX Combo PHY, for
> which basic support has been already made available via [1] and [2],
> respectively.
>=20
> The patches are grouped as follows:
> * PATCH 1..7: DW HDMI TX driver refactor to minimize code duplication =
in
>  the new QP driver (no functional changes intended)
>=20
> * PATCH 8..11: Rockchip DW HDMI glue driver cleanup/improvements (no
>  functional changes intended)
>=20
> * PATCH 12..13: The new DW HDMI QP TX driver reusing the previously
>  exported functions and structs from existing DW HDMI TX driver
>=20
> * PATCH 14: Rockchip DW HDMI glue driver update to support RK3588 and
>  make use of DW HDMI QP TX
>=20
> They provide just the basic HDMI support for now, i.e. RGB output up =
to
> 4K@60Hz, without audio, CEC or any of the HDMI 2.1 specific features.
> Also note the vop2 driver is currently not able to properly handle all
> display modes supported by the connected screens, e.g. it doesn't cope
> with non-integer refresh rates.
>=20
> A possible workaround consists of enabling the display controller to
> make use of the clock provided by the HDMI PHY PLL. This is still work
> in progress and will be submitted later, as well as the required DTS
> updates.
>=20
> To facilitate testing and experimentation, all HDMI output related
> patches, including those part of this series, are available at [3].
> So far I could only verify this on the RADXA Rock 3A and 5B boards.
>=20
> Thanks,
> Cristian
>=20
> [1]: 5a028e8f062f ("drm/rockchip: vop2: Add support for rk3588")
> [2]: 553be2830c5f ("phy: rockchip: Add Samsung HDMI/eDP Combo PHY =
driver")
> [3]: =
https://gitlab.collabora.com/hardware-enablement/rockchip-3588/linux/-/com=
mits/rk3588-hdmi-bridge-v6.10-rc1
>=20
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
> Cristian Ciocaltea (14):
>      drm/bridge: dw-hdmi: Simplify clock handling
>      drm/bridge: dw-hdmi: Add dw-hdmi-common.h header
>      drm/bridge: dw-hdmi: Commonize dw_hdmi_i2c_adapter()
>      drm/bridge: dw-hdmi: Factor out AVI infoframe setup
>      drm/bridge: dw-hdmi: Factor out vmode setup
>      drm/bridge: dw-hdmi: Factor out hdmi_data_info setup
>      drm/bridge: dw-hdmi: Commonize dw_hdmi_connector_create()
>      drm/rockchip: dw_hdmi: Use modern drm_device based logging
>      drm/rockchip: dw_hdmi: Simplify clock handling
>      drm/rockchip: dw_hdmi: Use devm_regulator_get_enable()
>      drm/rockchip: dw_hdmi: Drop superfluous assignments of mpll_cfg, =
cur_ctr and phy_config
>      dt-bindings: display: rockchip,dw-hdmi: Add compatible for RK3588
>      drm/bridge: synopsys: Add DW HDMI QP TX controller driver
>      drm/rockchip: dw_hdmi: Add basic RK3588 support
>=20
> .../display/rockchip/rockchip,dw-hdmi.yaml         | 127 +++-
> drivers/gpu/drm/bridge/synopsys/Makefile           |   2 +-
> drivers/gpu/drm/bridge/synopsys/dw-hdmi-common.h   | 179 +++++
> drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c       | 787 =
+++++++++++++++++++
> drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.h       | 831 =
+++++++++++++++++++++
> drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          | 353 +++------
> drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c        | 351 +++++++--
> include/drm/bridge/dw_hdmi.h                       |   8 +
> 8 files changed, 2290 insertions(+), 348 deletions(-)
> ---
> base-commit: 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
> change-id: 20240601-b4-rk3588-bridge-upstream-a27baff1b8fc
>=20
>=20
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip

