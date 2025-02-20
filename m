Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41AC0A3E3E8
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 19:31:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76E7B10E172;
	Thu, 20 Feb 2025 18:31:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TESkqoAG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9A9E10E172
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 18:31:55 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-5e050b1491eso4177406a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 10:31:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740076314; x=1740681114; darn=lists.freedesktop.org;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sMr3lvJ7EopRpQyFUlg/MoDrJDe+8pm+RaJvLNxz/5k=;
 b=TESkqoAGO/gfEFikbdALje7nVhW+QGI0vleQEHBJrwmav56unRPM5Ff7tODHtN0iUw
 oQr5+DaHIHATZd3ZqsoLUiPlMaFkCAV7yrNchAjqW4+ryPlWxdNQA5ZXWW7Mf2xZoQiT
 evfjw0sMpAZ/605f0wotKkPW2gNj4E9TV6ZrRi46HNI61XJRDFxJQAy8PsJutM3rc/Nu
 M8yR6LIVxD52Jt9cwp4NjIvMo1G8yuqR4QLTpRzFA4IsusW5nzcidrS1+4bld+KRgOt4
 89jHcHIhbv5XMTKEMeetIRCR236LdAmhbNQ5dPtOjZWMiwMteW+hKp0aaZ+m6YOtw2OE
 /Jxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740076314; x=1740681114;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sMr3lvJ7EopRpQyFUlg/MoDrJDe+8pm+RaJvLNxz/5k=;
 b=tWIXX4stWbsdWMgq2sAi1Lh3AU3gwCl/NDIFlPWbAiUQo6xXn+mQOpF6J8epGdKg2Z
 Ix3nbh6iUJ8+nqUBrMLbD4qHpEN0OGRbohSyZxYDFz6fF5mY6BigGqx3Y39FM99TfI/F
 hGoBFPjQJzyAktTMIlp76OrMov2az/cizuy1ku65ZZjkltayduLuDBGYXEHn2gXH2cWe
 4XDhKp8qoLOjgeujPONu7hOTkIJlhE8bXJcVZu2q0ldpL0IzXeZOXAT1s5CVyNh2DvNU
 RQ61aukAIiW63uvzQ6U5E/JEriXVzJ9S06hhcoZ4aN1uZI3QmqfhK6OsAh0LAwUv4Hoo
 eu5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCURN7nhSktS61UhiEKcJkerPVRDZmMKV+t/zNM7s7YW5b0KSEfDHUrU8KDGBWXGLnFxndf/Vcv2vi8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwgBRsXprGUeOLv+MRue+a0GLCzg6Mc5KJhPCykiXDw5I/qtEmo
 y8b5MQDY3Xu13cFgRVshD76t/ZjOq2XfqR5NBtTR5IK1xv0kZrRg
X-Gm-Gg: ASbGncunq8tNaMdfCLqeBRImbbzu7I2MtUvWREak5zJzghI1Qb5KythTZBa95fYzTFD
 O69qRkUQr2NFd6HN6zwcv0d2rAoWr12tjInkUlXYTATjIypMXo9boRlPXtoZ2B/4EEBwWeYuHsz
 Gk5Hcr0zAco0v46qZX6T8oTirNvcCS0PcG74MWgIzfBn0vtScCtQzKB775HDt3dl22dkDk0xsZL
 Xkz/cykWIVMZjqJtPplWC4qKMHuNJsOhNQ0p3UQ2V9+84SDRXPalfQ36Z25b9FkTkTzFLgexc4P
 +u404uHbpthicL4DNgywwYLiecvNu3CukIAQYBjtMMk9dVXBe3efgsTCi98zxYvXG0/c4aqX
X-Google-Smtp-Source: AGHT+IFbxBiIiVyThGFUApBE/J2v7Yf4y9GSheJDY9cjGQbwdKH79wDotPht1emZ1XR1jrwSaRJKuA==
X-Received: by 2002:a05:6402:3491:b0:5de:5e08:babd with SMTP id
 4fb4d7f45d1cf-5e0a12b9c7amr4570026a12.11.1740076314077; 
 Thu, 20 Feb 2025 10:31:54 -0800 (PST)
Received: from smtpclient.apple (89-66-237-154.dynamic.chello.pl.
 [89.66.237.154]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dece270b17sm12453533a12.62.2025.02.20.10.31.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 20 Feb 2025 10:31:53 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: [PATCH v7 0/3] Add HDMI audio on the rk3588 SoC
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <2357838.ElGaqSPkdT@earth>
Date: Thu, 20 Feb 2025 19:31:36 +0100
Cc: linux-kernel@vger.kernel.org, Algea Cao <algea.cao@rock-chips.com>,
 Heiko Stuebner <heiko@sntech.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 dri-devel@lists.freedesktop.org, Niklas Cassel <cassel@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, kernel@collabora.com,
 David Airlie <airlied@gmail.com>, Dragan Simic <dsimic@manjaro.org>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Robert Foss <rfoss@kernel.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Sugar Zhang <sugar.zhang@rock-chips.com>,
 linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
 FUKAUMI Naoki <naoki@radxa.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Johan Jonker <jbx6244@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Alexey Charkov <alchark@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <BA73C4A1-C680-4748-9CE1-4B3B19A14261@gmail.com>
References: <20250217215641.372723-1-detlev.casanova@collabora.com>
 <B8EF5196-55FB-44EC-B93C-E327C791225B@gmail.com> <2357838.ElGaqSPkdT@earth>
To: Detlev Casanova <detlev.casanova@collabora.com>
X-Mailer: Apple Mail (2.3826.400.131.1.6)
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



> Wiadomo=C5=9B=C4=87 napisana przez Detlev Casanova =
<detlev.casanova@collabora.com> w dniu 20 lut 2025, o godz. 18:03:
>=20
> Hi Piotr,
>=20
> On Thursday, 20 February 2025 06:16:20 EST Piotr Oniszczuk wrote:
>>=20
>>=20
>> Detelv,
>>=20
>> Just curious of your opinion:
>>=20
>> I=E2=80=99m on 6.14-rc3 and using
>> =
https://gitlab.collabora.com/cristicc/linux-next/-/commits/rk3588-hdmi-bri=
d
>> ge + this v7 series.
>=20
> Do you have the branch available somewhere ?

My tests are on my MiniMyth2 distro.=20
My build system is vanilla upstream+patches style. =20
Kernel is mainline 6.14-rc3 kernel with applied series of patches:

PATCHFILES +=3D 1001-math.h-add-DIV_ROUND_UP_NO_OVERFLOW.patch
PATCHFILES +=3D =
1002-clk-divider-Fix-divisor-masking-on-64-bit-platforms.patch
PATCHFILES +=3D 1003-clk-composite-replace-open-coded-abs_diff.patch
# hdmi video support
PATCHFILES +=3D =
1010-FROM-ML-phy-phy-rockchip-samsung-hdptx-Don-t-use-dt-.patch
PATCHFILES +=3D =
1011-FROM-UPSTREAM-drm-rockchip-Don-t-change-hdmi-referen.patch
PATCHFILES +=3D =
1012-FROM-UPSTREAM-drm-rockchip-vop2-Drop-unnecessary-if_.patch
PATCHFILES +=3D =
1013-FROM-UPSTREAM-drm-rockchip-vop2-Improve-display-mode.patch
PATCHFILES +=3D =
1014-WIP-drm-rockchip-vop2-Improve-display-modes-handling.patch
PATCHFILES +=3D =
1015-drm-bridge-dw-hdmi-Sync-comments-with-actual-bus-for.patch
PATCHFILES +=3D =
1016-drm-bridge-connector-Sync-supported_formats-with-com.patch
PATCHFILES +=3D =
1017-drm-connector-hdmi-Evaluate-limited-range-after-comp.patch
PATCHFILES +=3D =
1018-drm-connector-hdmi-Add-support-for-YUV420-format-ver.patch
PATCHFILES +=3D =
1019-drm-connector-hdmi-Improve-debug-message-for-support.patch
PATCHFILES +=3D =
1020-drm-connector-hdmi-Use-YUV420-output-format-as-an-RG.patch
PATCHFILES +=3D 1021-phy-Add-HDMI-configuration-options.patch
PATCHFILES +=3D 1022-phy-hdmi-Add-color-depth-configuration.patch
PATCHFILES +=3D =
1023-phy-rockchip-samsung-hdptx-Fix-clock-ratio-setup.patch
PATCHFILES +=3D =
1024-phy-rockchip-samsung-hdptx-Drop-unused-lcpll_config.patch
PATCHFILES +=3D =
1025-phy-rockchip-samsung-hdptx-Setup-TMDS-char-rate-via-.patch
PATCHFILES +=3D =
1026-phy-rockchip-samsung-hdptx-Add-high-color-depth-mana.patch
PATCHFILES +=3D =
1027-phy-rockchip-samsung-hdptx-Cleanup-internal-rate-han.patch
PATCHFILES +=3D =
1028-phy-rockchip-samsung-hdptx-Avoid-Hz-hHz-unit-convers.patch
PATCHFILES +=3D =
1029-TEST-phy-rockchip-samsung-hdptx-Add-verbose-logging.patch
PATCHFILES +=3D 1030-WIP-drm-bridge-Add-detect_ctx-hook.patch
PATCHFILES +=3D =
1031-WIP-drm-bridge-connector-Switch-from-detect-to-detec.patch
PATCHFILES +=3D =
1032-WIP-drm-bridge-dw-hdmi-qp-Add-high-TMDS-clock-ratio-.patch
PATCHFILES +=3D =
1033-WIP-drm-rockchip-vop2-Add-high-color-depth-support.patch
PATCHFILES +=3D 1034-WIP-drm-rockchip-vop2-Add-YUV420-support.patch
PATCHFILES +=3D =
1035-WIP-drm-rockchip-dw_hdmi_qp-Make-use-of-phy_configur.patch
PATCHFILES +=3D =
1036-WIP-drm-rockchip-dw_hdmi_qp-Add-10bpc-and-YUV420-out.patch
PATCHFILES +=3D =
1037-WIP-drm-bridge-dw-hdmi-qp-Enable-10bpc-and-YUV420.patch
# hdmi audio support
PATCHFILES +=3D =
1040-drm-bridge-synopsys-add-audio-support-for-dw-hdmi-qp-v7.patch
# cec support
PATCHFILES +=3D 1045-drm-bridge-synopsys-add-cec-support.patch
# var additions
PATCHFILES +=3D 1060-net-ethernet-add-yt6801-gige-pcie-controller.patch
PATCHFILES +=3D =
1061-net-ethernet-yt6801-gige-pcie-silence-debug-msgs.patch
PATCHFILES +=3D 1062-WIP-iommu-rockchip-add-flush_iotlb_all-ops.patch
PATCHFILES +=3D 1063-media-rockchip-add-rkvdec2-driver.patch
PATCHFILES +=3D 1064-media-rkvdec2-add-iommu-support-v3.patch
PATCHFILES +=3D 1065-wip-add-hevc-support.patch
PATCHFILES +=3D 1066-wip-hevc-add-ref-frames-support.patch
# dtsi additions
PATCHFILES +=3D 1070-arm64-dtsi-rk3588s-add-vop2-clock-resets.patch
PATCHFILES +=3D 1071-arm64-dtsi-rockchip-3588s-add-hdmi-bridge.patch
PATCHFILES +=3D =
1072-arm64-dtsi-rockchip-3588-hdmi-add-audio-support.patch
PATCHFILES +=3D =
1074-arm64-dtsi-rockchip-add-rkvdec2-video-vecoder-on-rk3588.patch
PATCHFILES +=3D 1077-arm64-dtsi-rkvdec2-add-iommu-support-v3.patch
PATCHFILES +=3D =
1078-arm64-dtsi-rockchip-rk356x-add-rkvdec2-video-decoder-nodes.patch
# dts patches
PATCHFILES +=3D =
1080-arm64-dts-rockchip-rk3588s-rock5a-dts-improvements.patch
PATCHFILES +=3D =
1081-arm64-dts-rockchip-rk3588-rock5b-dts-improvements.patch
PATCHFILES +=3D =
1082-arm64-dts-rockchip-rk3588s-rock5c-dts-improvements.patch
PATCHFILES +=3D =
1083-arm64-dts-rockchip-rk3588-rock5itx-dts-improvements.patch
PATCHFILES +=3D =
1084-arm64-dts-rockchip-rk3588s-opi5-dts-improvements.patch
PATCHFILES +=3D =
1085-arm64-dts-rockchip-rk3588-opi5plus-dts-improvements.patch
PATCHFILES +=3D 1086-arm64-dts-rockchip-rk3588s-add-opi5pro-dts.patch
PATCHFILES +=3D 1087-arm64-dts-rockchip-rk3588s-add-nanopi-m6-dts.patch
PATCHFILES +=3D =
1088-arm64-dts-rockchip-rk3588s-nanopc-r6s-dts-improvements.patch
PATCHFILES +=3D =
1089-arm64-dts-rockchip-rk3588-nanopc-t6-dtsi-improvements.patch
PATCHFILES +=3D 1090-arm64-dts-rockchip-rk3588-add-rock5t-dt.patch

 patches are from: =
https://github.com/warpme/minimyth2/tree/master/script/kernel/linux-6.14/f=
iles

Kernel config is: =
https://github.com/warpme/minimyth2/blob/master/script/kernel/linux-6.14/f=
iles/linux-6.14-arm64-armv8.config

Above patching is effectively:=20

- =
https://gitlab.collabora.com/cristicc/linux-next/-/commits/rk3588-hdmi-bri=
dge
- Yours hdmi audio v7
. added cec support
- added rkvdec2 (including hevc)
- some dts enablements for above


>=20
>> On mine rock5b all works nicely but - at boot time - i=E2=80=99m =
getting some oops
>> in kernel like this:
>> https://gist.github.com/warpme/e1668acbef7817e5d2a88a6840328722
>=20
> I did notice that at one point but it disappeard after a rebase on the =
the=20
> latest master so I didn't look further into that.

Indeed - i.e. i don=E2=80=99t have these oops on rk3588 based =
orange5plus.
Also 6.12 kernel is clean.
But i have them reproducible on rock5b (and also e.g. on rock5t)
 =20
> Could it be related to 2518a0e1b878042f9afa45ae063e544a16efc1a3 "ASoC: =
simple-
> card: use __free(device_node) for device node" ?
>=20

I tried with 2518a0e1b878042f9afa45ae063e544a16efc1a3 revered and this =
NOT helps.
With reverted above commit, dmesg is: =
https://gist.github.com/warpme/dbfe813583e4660a02b74315f193e768

 =20
