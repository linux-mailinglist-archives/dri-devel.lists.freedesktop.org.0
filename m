Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 890648D7429
	for <lists+dri-devel@lfdr.de>; Sun,  2 Jun 2024 09:46:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C80B10E034;
	Sun,  2 Jun 2024 07:46:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PQDwFeow";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEB7810E034
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Jun 2024 07:46:39 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-a68f1017170so27159466b.0
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Jun 2024 00:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717314398; x=1717919198; darn=lists.freedesktop.org;
 h=references:to:cc:in-reply-to:date:subject:mime-version:message-id
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=peQgzgOFwEBxOuMw39h0j1m4Aqhit21VmdrantfX6rM=;
 b=PQDwFeow24khXXdJN4YqQE3C00zZhSZ1zXtjhYdRo8R4SQbqsGrMR97de70d7xB/Yn
 XMjjyW56M17100Y/GEO7+m2/D9AoSIkXRyUFw4aprTHXLRQNoNiPsnrt3Hg0oNSKHJnG
 k3qQjxn5nZBR6i63BMq/1QJandmUAGEWloXuxxWObejN0toheLWvK2+qpNbfhsiBeskX
 iWX012w9POb39ZuKphOBBK0qG3RhjSAEeQMNat09uRm3MPEurV0XlWn+0tZ05++4bgQu
 IEN6yE6yxbAUwJzJ70k8JIyPQLZ0DL+iHPhoSGQPT6FtQz7+Fn+9tT/1kUNBbD/gdoo4
 OSMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717314398; x=1717919198;
 h=references:to:cc:in-reply-to:date:subject:mime-version:message-id
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=peQgzgOFwEBxOuMw39h0j1m4Aqhit21VmdrantfX6rM=;
 b=F2/aWsTUz9YoW0/TvgqaNMD8SUFkYxMuFg0BXVS3zkW3NNkDOb149zHn5ugjPnYs9F
 MGNOFKyRnvhB9dt9/jy7FKk0gGYLQRvKx5Hiuq1z4es/OiX26FGwMpzR4b1mHN14dVIL
 7XvmPspagAxz7JvkIu7snEgOVy+uJHInWSUpPBPUfsLO44yCtzoORXnokpWTBsFBqF97
 PSm2U2YYr9Vkt7YyUOoxn8YCGrytr7zkkeC+pi1oC0G6wMXXeb6y4IkBKrEUCTITHaMy
 RYkfq54GFdoDaWb9WUxExa8+Y311Kge+pTwHgdNyYqgmxsF2eeakRY0mD+ZxyYJltMzQ
 oUrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRv3ZCswH+7wIN0T6L6zEwFYGmHkDkRxVYAAIPdJLquq5V412tWsuaqR5qZxTDEGuwrjztNsBF7kevi9cmb+McTgBcR5xe5qCJswQS+HDP
X-Gm-Message-State: AOJu0YwpOS9q1VwsHcDVmcyJ2qO7Br68NfUe8Zrf9O5Y4h8y8iasfLOu
 xn6vApLrl+QlPuE+fv+fjumKOV7qIyndxJmq8MMLZriZgtBEX0x9
X-Google-Smtp-Source: AGHT+IE+hhZTVJ4Db/R3LSG5nZ6DuPZ9j8g360rBOT7zWuQY43KOpSxn7kZmflQPF2wF/USMiQBCTg==
X-Received: by 2002:a17:907:ca2:b0:a66:e009:eb53 with SMTP id
 a640c23a62f3a-a681fe4d987mr334771366b.13.1717314397504; 
 Sun, 02 Jun 2024 00:46:37 -0700 (PDT)
Received: from smtpclient.apple (84-10-100-139.static.chello.pl.
 [84.10.100.139]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a68ba90e185sm154187966b.157.2024.06.02.00.46.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 02 Jun 2024 00:46:37 -0700 (PDT)
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Message-Id: <684C2054-389F-40AE-B37B-1F30A85DA167@gmail.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_43DD96C5-0AE0-4ED6-9540-79B04D75C412"
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.15\))
Subject: Re: [PATCH 00/14] Add initial support for the Rockchip RK3588 HDMI TX
 Controller
Date: Sun, 2 Jun 2024 09:46:29 +0200
In-Reply-To: <20240601-b4-rk3588-bridge-upstream-v1-0-f6203753232b@collabora.com>
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
 linux-arm-kernel@lists.infradead.org,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 devicetree@vger.kernel.org, kernel@collabora.com,
 Alexandre ARNOUD <aarnoud@me.com>, Luis de Arquer <ldearquer@gmail.com>,
 Algea Cao <algea.cao@rock-chips.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
References: <20240601-b4-rk3588-bridge-upstream-v1-0-f6203753232b@collabora.com>
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


--Apple-Mail=_43DD96C5-0AE0-4ED6-9540-79B04D75C412
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

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
e/rk3588-hdmi-audio?ref_type=3Dheads =
<https://gitlab.collabora.com/hardware-enablement/rockchip-3588/linux/-/tr=
ee/rk3588-hdmi-audio?ref_type=3Dheads> ) audio code to get basic support =
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


--Apple-Mail=_43DD96C5-0AE0-4ED6-9540-79B04D75C412
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" =
class=3D"">Cristian,<div class=3D""><br class=3D""></div><div class=3D"">I=
 was awaiting over year for this work!</div><div class=3D""><br =
class=3D""></div><div class=3D"">I=E2=80=99m devel. 2 distros where =
single mainline kernel serves =
2835/2711/2712/h6/h313/h616/h618/rk3328/rk3399/rk3566/rk3568/rk3588/s905/s=
912/sm1/g12.</div><div class=3D""><br class=3D""></div><div =
class=3D"">Before this work rk3588 was excluded because rk3588 hdmi was =
regressing hdmi on other socs.</div><div class=3D"">With this code all =
other socs seems work ok now. Perfect.</div><div class=3D""><br =
class=3D""></div><div class=3D"">As one of my project is multimedia =
appliance - good news is that now i can nicely play hdtv on rk3588 using =
mainline common 6.9.3 kernel and=E2=80=A6.started to hear from my users =
a lot of Qs like: =E2=80=9Eah so nice! rk3588 now works nicely=E2=80=A6.bu=
t where is hdmi audio and cec?=E2=80=9D</div><div class=3D""><br =
class=3D""></div><div class=3D"">It will be fantastic to add (e.g. by =
backport Detlev <a =
href=3D"https://gitlab.collabora.com/hardware-enablement/rockchip-3588/lin=
ux/-/tree/rk3588-hdmi-audio?ref_type=3Dheads" =
class=3D"">https://gitlab.collabora.com/hardware-enablement/rockchip-3588/=
linux/-/tree/rk3588-hdmi-audio?ref_type=3Dheads</a>&nbsp;) audio code to =
get basic support hdmi audio?</div><div =
class=3D"">&nbsp;&nbsp;&nbsp;</div><div class=3D"">thx again for =
fantastic work!</div><div class=3D""><br class=3D""><div><br =
class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">Wiadomo=C5=9B=C4=87 napisana przez Cristian Ciocaltea &lt;<a =
href=3D"mailto:cristian.ciocaltea@collabora.com" =
class=3D"">cristian.ciocaltea@collabora.com</a>&gt; w dniu 01.06.2024, o =
godz. 15:12:</div><br class=3D"Apple-interchange-newline"><div =
class=3D""><div class=3D"">The RK3588 SoC family integrates a Quad-Pixel =
(QP) variant of the<br class=3D"">Synopsys DesignWare HDMI TX controller =
used in the previous SoCs.<br class=3D""><br class=3D"">It is HDMI 2.1 =
compliant and supports the following features, among<br =
class=3D"">others:<br class=3D""><br class=3D"">* Fixed Rate Link =
(FRL)<br class=3D"">* 4K@120Hz and 8K@60Hz video modes<br class=3D"">* =
Variable Refresh Rate (VRR) including Quick Media Switching (QMS)<br =
class=3D"">* Fast Vactive (FVA)<br class=3D"">* SCDC I2C DDC access<br =
class=3D"">* TMDS Scrambler enabling 2160p@60Hz with RGB/YCbCr4:4:4<br =
class=3D"">* YCbCr4:2:0 enabling 2160p@60Hz at lower HDMI link speeds<br =
class=3D"">* Multi-stream audio<br class=3D"">* Enhanced Audio Return =
Channel (EARC)<br class=3D""><br class=3D"">This is the last required =
component that needs to be supported in order<br class=3D"">to enable =
the HDMI output functionality on the RK3588 based SBCs, such<br =
class=3D"">as the RADXA Rock 5B. The other components are the Video =
Output<br class=3D"">Processor (VOP2) and the Samsung IP based HDMI/eDP =
TX Combo PHY, for<br class=3D"">which basic support has been already =
made available via [1] and [2],<br class=3D"">respectively.<br =
class=3D""><br class=3D"">The patches are grouped as follows:<br =
class=3D"">* PATCH 1..7: DW HDMI TX driver refactor to minimize code =
duplication in<br class=3D""> &nbsp;the new QP driver (no functional =
changes intended)<br class=3D""><br class=3D"">* PATCH 8..11: Rockchip =
DW HDMI glue driver cleanup/improvements (no<br class=3D""> =
&nbsp;functional changes intended)<br class=3D""><br class=3D"">* PATCH =
12..13: The new DW HDMI QP TX driver reusing the previously<br class=3D"">=
 &nbsp;exported functions and structs from existing DW HDMI TX driver<br =
class=3D""><br class=3D"">* PATCH 14: Rockchip DW HDMI glue driver =
update to support RK3588 and<br class=3D""> &nbsp;make use of DW HDMI QP =
TX<br class=3D""><br class=3D"">They provide just the basic HDMI support =
for now, i.e. RGB output up to<br class=3D"">4K@60Hz, without audio, CEC =
or any of the HDMI 2.1 specific features.<br class=3D"">Also note the =
vop2 driver is currently not able to properly handle all<br =
class=3D"">display modes supported by the connected screens, e.g. it =
doesn't cope<br class=3D"">with non-integer refresh rates.<br =
class=3D""><br class=3D"">A possible workaround consists of enabling the =
display controller to<br class=3D"">make use of the clock provided by =
the HDMI PHY PLL. This is still work<br class=3D"">in progress and will =
be submitted later, as well as the required DTS<br class=3D"">updates.<br =
class=3D""><br class=3D"">To facilitate testing and experimentation, all =
HDMI output related<br class=3D"">patches, including those part of this =
series, are available at [3].<br class=3D"">So far I could only verify =
this on the RADXA Rock 3A and 5B boards.<br class=3D""><br =
class=3D"">Thanks,<br class=3D"">Cristian<br class=3D""><br =
class=3D"">[1]: 5a028e8f062f ("drm/rockchip: vop2: Add support for =
rk3588")<br class=3D"">[2]: 553be2830c5f ("phy: rockchip: Add Samsung =
HDMI/eDP Combo PHY driver")<br class=3D"">[3]: <a =
href=3D"https://gitlab.collabora.com/hardware-enablement/rockchip-3588/lin=
ux/-/commits/rk3588-hdmi-bridge-v6.10-rc1" =
class=3D"">https://gitlab.collabora.com/hardware-enablement/rockchip-3588/=
linux/-/commits/rk3588-hdmi-bridge-v6.10-rc1</a><br class=3D""><br =
class=3D"">Signed-off-by: Cristian Ciocaltea &lt;<a =
href=3D"mailto:cristian.ciocaltea@collabora.com" =
class=3D"">cristian.ciocaltea@collabora.com</a>&gt;<br class=3D"">---<br =
class=3D"">Cristian Ciocaltea (14):<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;drm/bridge: dw-hdmi: Simplify clock =
handling<br class=3D""> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;drm/bridge: =
dw-hdmi: Add dw-hdmi-common.h header<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;drm/bridge: dw-hdmi: Commonize =
dw_hdmi_i2c_adapter()<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;drm/bridge: dw-hdmi: Factor out AVI =
infoframe setup<br class=3D""> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;drm/bridge: =
dw-hdmi: Factor out vmode setup<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;drm/bridge: dw-hdmi: Factor out =
hdmi_data_info setup<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;drm/bridge: dw-hdmi: Commonize =
dw_hdmi_connector_create()<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;drm/rockchip: dw_hdmi: Use modern =
drm_device based logging<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;drm/rockchip: dw_hdmi: Simplify clock =
handling<br class=3D""> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;drm/rockchip: =
dw_hdmi: Use devm_regulator_get_enable()<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;drm/rockchip: dw_hdmi: Drop superfluous =
assignments of mpll_cfg, cur_ctr and phy_config<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;dt-bindings: display: rockchip,dw-hdmi: =
Add compatible for RK3588<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;drm/bridge: synopsys: Add DW HDMI QP TX =
controller driver<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;drm/rockchip: dw_hdmi: Add basic RK3588 =
support<br class=3D""><br class=3D""> =
.../display/rockchip/rockchip,dw-hdmi.yaml =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 127 +++-<br class=3D""> =
drivers/gpu/drm/bridge/synopsys/Makefile =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| =
&nbsp;&nbsp;2 +-<br class=3D""> =
drivers/gpu/drm/bridge/synopsys/dw-hdmi-common.h &nbsp;&nbsp;| 179 =
+++++<br class=3D""> drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 787 +++++++++++++++++++<br =
class=3D""> drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.h =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 831 +++++++++++++++++++++<br =
class=3D""> drivers/gpu/drm/bridge/synopsys/dw-hdmi.c =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 353 +++------<br =
class=3D""> drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 351 +++++++--<br class=3D""> =
include/drm/bridge/dw_hdmi.h =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| =
&nbsp;&nbsp;8 +<br class=3D""> 8 files changed, 2290 insertions(+), 348 =
deletions(-)<br class=3D"">---<br class=3D"">base-commit: =
1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0<br class=3D"">change-id: =
20240601-b4-rk3588-bridge-upstream-a27baff1b8fc<br class=3D""><br =
class=3D""><br =
class=3D"">_______________________________________________<br =
class=3D"">Linux-rockchip mailing list<br class=3D""><a =
href=3D"mailto:Linux-rockchip@lists.infradead.org" =
class=3D"">Linux-rockchip@lists.infradead.org</a><br =
class=3D"">http://lists.infradead.org/mailman/listinfo/linux-rockchip<br =
class=3D""></div></div></blockquote></div><br =
class=3D""></div></body></html>=

--Apple-Mail=_43DD96C5-0AE0-4ED6-9540-79B04D75C412--
