Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A53DDA5DED7
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 15:23:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09ED210E785;
	Wed, 12 Mar 2025 14:23:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="S+wnKImf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90E9610E785
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 14:23:30 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-ac2bdea5a38so315005266b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 07:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741789409; x=1742394209; darn=lists.freedesktop.org;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mEek4i2ZCkx6tmbDOfSqfNqakadAzuvY5GsHOU0PtgM=;
 b=S+wnKImfqB/X1TV1DvhNGLh4ZS4HNV2WL1znjVzykPztReDSItJ0oiz1y5E7d2yduA
 af2L/ECorJR0dWfuI9DvT5yvVlxXnPFFj/byvEKR9iWppAbcUkLgSRy/ppzfkjVTr1tg
 7rxTvneTvswRpiOZtVe0SOw2oX/wQZQT1x3hA1UFYiVU2mJ3wXMfhmD+WoJlcq5TmefG
 TrtILGHBTt7nsdjIv6L4c6cbMru3X3ctURCtyBeG9ZBbtsDLrXTcu22QCNym2mGjXcnu
 SYJNSKq3D8aBqad9rgwyE+CPZbRXhEwdMa3SaybDxyHdTOZ0rrldD3HHngkY2W5c1Vo4
 TkwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741789409; x=1742394209;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mEek4i2ZCkx6tmbDOfSqfNqakadAzuvY5GsHOU0PtgM=;
 b=vWFa7/xDFh0GtwZk7EWCr+cBQ2X5u2bjeV2nfq6Y6btDcsaC02kUf63bti+oiwGkGN
 OFd0wBVR75EIHHtnME2RkX0ulrBK1ixyls3sAbQuXLIKWeip7BQkUbZvdeIbPoWNo0Vd
 r/e18UXVNA0gGdfigZ9RamN7/N/I6XevLMSggoPaAd6wSgCvXof85GwFF8zeyQzg7pYp
 Q4Y7KfZhl+cMD4i9ww1Y1n/Cu0zvhqbWv942Q9PPBPwJsJIPPXSfz105cSIKQVeye52o
 2j3VlCMW2pvqtvMpcQzeEnibxVWalS+2baOhHqExUhX0wGxQM3npIxZe4gOHEcLqT4ET
 ovTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUr1i0xH02QKLvigkDCOQbbDpk1D3o/Mpaw2wFnpBViuVAnqx08JZEQuwZKEiIHy7v8v38YB8b1k9c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzXlsHQ6myYI1Jz4F7IE7If/gKlebU8SL2ObqdJqTrLeMEHv7Ii
 CjjaXLMNRjzFy+Os74vee/fwlDQmF3DldZp4XHhlHGU3QC1I5dDG
X-Gm-Gg: ASbGncsbfv6yCnmX6jCTOvpCY64mIJraGhx59/ZpwgCMjH9RLu8zwkM0lpYk9Y8/z+d
 9uaAvU9G7tBGfuMir05Jvradm50Bsjo/CJDbmOxTsamlX5YR6TYedNEv4t8RiltYCpuTAhpkVD+
 eXNXtIkvdXOsuEo9rhBp9Wf/vGx2DRjvQYbB4OCpY2QVfX+qxc5izMLDThWkoONs5LotK3JYI2K
 gH2QGbsuGjs9q4ACAksRrJVyXCg3uGt82gEL6KCNqU+xLio76unCTk780bfZT/f11cvWiFW+TL/
 dKphmRykOV81EvrZAeBbbl38SxhNzpJpTu16r4cHyTCDhvgEdUJ3oQnNmLEFC8yFLeTkVTTThGz
 FenAzU4fm1Vk+81HZj8V7eeDQnw==
X-Google-Smtp-Source: AGHT+IFdFvbIc6D4mXkiIL9CFWFvWjoXqM1m/Hjn3uEOvZC5n66LBMKABPlNlB63rI+HegTYSS5ruQ==
X-Received: by 2002:a17:907:d9e:b0:abf:6cc9:7ef5 with SMTP id
 a640c23a62f3a-ac25300a440mr2449963266b.47.1741789408746; 
 Wed, 12 Mar 2025 07:23:28 -0700 (PDT)
Received: from smtpclient.apple (89-66-237-154.dynamic.chello.pl.
 [89.66.237.154]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac2394825efsm1073903966b.45.2025.03.12.07.23.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 Mar 2025 07:23:28 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: [PATCH v2 2/7] drm/bridge: synopsys: Add DW DPTX Controller
 support library
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <20250312104214.525242-3-andyshrk@163.com>
Date: Wed, 12 Mar 2025 15:23:15 +0100
Cc: heiko@sntech.de, neil.armstrong@linaro.org,
 sebastian.reichel@collabora.com, lumag@kernel.org,
 devicetree@vger.kernel.org, hjc@rock-chips.com, mripard@kernel.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 yubing.zhang@rock-chips.com, dri-devel@lists.freedesktop.org,
 Andy Yan <andy.yan@rock-chips.com>, krzk+dt@kernel.org, robh@kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <61E9B36C-8568-4C0E-A9A7-07FF612912AA@gmail.com>
References: <20250312104214.525242-1-andyshrk@163.com>
 <20250312104214.525242-3-andyshrk@163.com>
To: Andy Yan <andyshrk@163.com>
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



> Wiadomo=C5=9B=C4=87 napisana przez Andy Yan <andyshrk@163.com> w dniu =
12 mar 2025, o godz. 11:42:
>=20
> From: Andy Yan <andy.yan@rock-chips.com>
>=20
> The DW DP TX Controller is compliant with the DisplayPort =
Specification
> Version 1.4 with the following features:
>=20
> * DisplayPort 1.4a
> * Main Link: 1/2/4 lanes
> * Main Link Support 1.62Gbps, 2.7Gbps, 5.4Gbps and 8.1Gbps
> * AUX channel 1Mbps
> * Single Stream Transport(SST)
> * Multistream Transport (MST)
> * Type-C support (alternate mode)
> * HDCP 2.2, HDCP 1.3
> * Supports up to 8/10 bits per color component
> * Supports RBG, YCbCr4:4:4, YCbCr4:2:2, YCbCr4:2:0
> * Pixel clock up to 594MHz
> * I2S, SPDIF audio interface
>=20
> Add library with common helpers to make it can be shared with
> other SoC.
>=20
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
>=20
> ---
>=20
> Changes in v2:
> - Fix compile error when build as module
> - Add phy init
> - Only use one dw_dp_link_train_set
> - inline dw_dp_phy_update_vs_emph
> - Use dp_sdp
> - Check return value of drm_modeset_lock
> - Merge code in atomic_pre_enable/mode_fixup to atomic_check
> - Return NULL if can't find a supported output format
> - Fix max_link_rate from plat_data
>=20

Andy,

Just small Q: do v2 needs something extra to get it working (particular =
kernel ver or extra dependency patches)?
I just replaced v1 to v2 and dp stopped to work for me.

e.g. on rock5a i=E2=80=99m getting:

root@myth-frontend-fafc53b591a6:~ # dmesg | grep drm
[    9.245284] panthor fb000000.gpu: [drm] clock rate =3D 198000000
[    9.249464] panthor fb000000.gpu: [drm] mali-g610 id 0xa867 major 0x0 =
minor 0x0 status 0x5
[    9.249472] panthor fb000000.gpu: [drm] Features: L2:0x7120306 =
Tiler:0x809 Mem:0x301 MMU:0x2830 AS:0xff
[    9.249474] panthor fb000000.gpu: [drm] shader_present=3D0x50005 =
l2_present=3D0x1 tiler_present=3D0x1
[    9.257979] panthor fb000000.gpu: [drm] Firmware protected mode entry =
not be supported, ignoring
[    9.258030] panthor fb000000.gpu: [drm] Firmware git sha: =
814b47b551159067b67a37c4e9adda458ad9d852
[    9.258604] panthor fb000000.gpu: [drm] CSF FW using interface =
v1.1.0, Features 0x0 Instrumentation features 0x71
[    9.259671] [drm] Initialized panthor 1.3.0 for fb000000.gpu on minor =
0
[    9.324353] rockchip-drm display-subsystem: bound fdd90000.vop (ops =
vop2_component_ops)
[    9.324617] rockchip-drm display-subsystem: bound fde50000.dp (ops =
dw_dp_rockchip_component_ops)
[    9.325202] rockchip-drm display-subsystem: bound fde80000.hdmi (ops =
dw_hdmi_qp_rockchip_ops)
[    9.325506] [drm] Initialized rockchip 1.0.0 for display-subsystem on =
minor 1
[    9.325531] rockchip-drm display-subsystem: [drm] Cannot find any =
crtc or sizes
[    9.325594] rockchip-drm display-subsystem: [drm] Cannot find any =
crtc or sizes =20

dp status is "not connected"

replacing only this patch back to v1 brings dp back to work.


