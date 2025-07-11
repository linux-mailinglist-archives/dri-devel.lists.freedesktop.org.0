Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9641AB01DA6
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 15:35:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CD4910EA4E;
	Fri, 11 Jul 2025 13:35:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DgzbHbQn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 298B310E252
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 03:58:24 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-32b595891d2so12937641fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 20:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752206302; x=1752811102; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=z7CteOKcSR5wpkrtCw/0yNUE4pwZlcXOtUiqDdXOWRc=;
 b=DgzbHbQnu+jHQZ0ApU3A74uWC3u31M3NaI/vKGXC7GtRfktx4NthiuQYJBeGq5R/9a
 PkfbOYpfg/rDNu7IrnEUCDJKJ3N7eb0+QIUJ8H2kDWT9Mm7yB7Z1sQP7839GvDSBkJhD
 +HtMnBUuiheag4YFkkqZN3s9nmf9wn7xbj5GhMdX6VL5wS4GWusKSLn1AhLhTUuiBa05
 ydjwOVlBXNVUPiAn4PxrAAucEFVJhzeAz5ddxumvayh84OAuQ2RzV2rYkJlKIoIsWR7X
 SSmIRqMKBhQeSDtT1Xo/EWIkQ45by9y0CwpIU0CjSBMJ2NN6R8Qf8VZIAEEWM6kAG5Bl
 yjZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752206302; x=1752811102;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z7CteOKcSR5wpkrtCw/0yNUE4pwZlcXOtUiqDdXOWRc=;
 b=oyBLmJT+YJDabxYVQENU2xL6JZ6GrUam3lAt2m9PzAcjxWFn8HUJ0qK3X62vNsJLWn
 Gl82f10/kJHp+U12tFRlHQt+NxIDPKeF7Ob475QVQn31NdZMRGEtvdPGa9oC/7RXBe3k
 rdmteMDupamnVG3fUT1DbFVp3eOeCX8HfE8K+wEwtqDrwr/dPXjPkT0tK7ewF35yhRi1
 ub1PajW+MDBQsiM/opymeVv8ByODo/TVnCOLOpZOPhq3K8fnRbRBOaChwa5bashtHYQY
 AcIN4mV50CVN0YhxEnApmAKuR1TYIeE059ZFIUQ5KYgKlIYPtcYAWRIQAsJpWw+D7f1f
 Estw==
X-Gm-Message-State: AOJu0YwdkEfmYumxfZkufaTki9EF4D3AAU4WpWuL1JJKOOpVp5u+dWaf
 t1+i8sN2WRns3vBPEQy+z6qZh9W0MEdb1G+A3unU70rZTr1H3UEs2rp/
X-Gm-Gg: ASbGncsVWdi5I27xMR3FQXHj8TmJdRwnB1k/UM5lp1K0gc4QMj16D7P5Khiec43jVuj
 P43mpt6aZiwbREaR3qbM9gbvWxOU2xU6dZ6F2lZ7U6U/a8xXeaK2jgLjTjxGPvUFxQPuPOPqy9C
 ABDr++jLbi/sw/ZVJ7Ga8kQ9UwVugnvvNDtWTyXRxkR/gTz90FgEtxrMEOgmtPRvv89vVOwwLWh
 ctH72WEzlvY5F7IcHwUyxqTkd4oM262G8RkmmTeEOsWZzoodsS7D2b6VaTLmqpg4p17KpRBRbtZ
 n2paVtZIXGTDd6/gOAjGKT6J1Wx0mIXwGsPTSTMKtUMnzcXURNvJFl17dGSIk36I7mdWt0q2TG2
 umz5U+ZD8lHE=
X-Google-Smtp-Source: AGHT+IGqjUC6+LzbpSLGosnqY439fvJxlZO9uR+Y1dc/WDIuRFhbiDBiR8QodGnlwa6oUPkK4Xs4TQ==
X-Received: by 2002:a2e:be11:0:b0:32c:ef7a:ccf9 with SMTP id
 38308e7fff4ca-3305348a960mr3406601fa.32.1752206301782; 
 Thu, 10 Jul 2025 20:58:21 -0700 (PDT)
Received: from junAIR ([212.192.12.80]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32fa2943d46sm4971191fa.40.2025.07.10.20.58.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 20:58:21 -0700 (PDT)
From: iuncuim <iuncuim@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.or>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: [PATCH v2 0/3] arm64: sunxi: a523: Enable Mali GPU
Date: Fri, 11 Jul 2025 11:57:26 +0800
Message-ID: <20250711035730.17507-1-iuncuim@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 11 Jul 2025 13:35:21 +0000
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

From: Mikhail Kalashnikov <iuncuim@gmail.com>

This patch adds gpu support on devices with a523 processor.

$ dmesg | grep panfrost
[    3.826968] panfrost 1800000.gpu: clock rate = 432000000
[    3.832305] panfrost 1800000.gpu: bus_clock rate = 200000000
[    3.838353] panfrost 1800000.gpu: mali-g57 id 0x9091 major 0x0 minor 0x1
               status 0x0
[    3.846050] panfrost 1800000.gpu: features: 00000000,000019f7, issues:
               00000001,80000400
[    3.854134] panfrost 1800000.gpu: Features: L2:0x07110206 Shader:0x00000000
               Tiler:0x00000809 Mem:0x1 MMU:0x00002830 AS:0xff JS:0x7
[    3.866011] panfrost 1800000.gpu: shader_present=0x1 l2_present=0x1
[    3.874108] [drm] Initialized panfrost 1.3.0 for 1800000.gpu on minor 0

Since there is no support for image output yet, it may be difficult to confirm
functionality. This can be done by running weston with vnc access using
the command:
$ weston --renderer=gl --backend=vnc --disable-transport-layer-security
--xwayland --width=640 --height=480

After that I was able to run glmark2 with a terrain result of 30 fps,
while I can see that there is a load on the GPU in nvtop and the CPU remains
unloaded.

Tested on x96qproplus and walnutpi 2b devices.

Based on v6.16-rc5 with patches:
https://lore.kernel.org/all/20250628054438.2864220-1-wens@kernel.org
https://lore.kernel.org/linux-sunxi/20250628161608.3072968-1-wens@kernel.org
https://lore.kernel.org/linux-sunxi/20250627152918.2606728-1-wens@kernel.org/

Changes from v1:
- added compatible to the documentation
v1: https://lore.kernel.org/linux-sunxi/CAGb2v67Pu7CTJx3K=3CVSbQ9mNB-4Vrq+iaA+hUWtxdwS2aD0Q@mail.gmail.com

Mikhail Kalashnikov (3):
  dt-bindings: gpu: mali-bifrost: Add Allwinner A523 compatible
  arm64: dts: allwinner: a523: add Mali GPU node
  arm64: dts: allwinner: a523: enable Mali GPU for all boards

 .../devicetree/bindings/gpu/arm,mali-bifrost.yaml |  1 +
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi    | 15 +++++++++++++++
 .../boot/dts/allwinner/sun55i-a527-cubie-a5e.dts  |  5 +++++
 .../boot/dts/allwinner/sun55i-h728-x96qpro+.dts   |  5 +++++
 .../boot/dts/allwinner/sun55i-t527-avaota-a1.dts  |  5 +++++
 .../dts/allwinner/sun55i-t527-orangepi-4a.dts     |  5 +++++
 6 files changed, 36 insertions(+)

-- 
2.50.0

