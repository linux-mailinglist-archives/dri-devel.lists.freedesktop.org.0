Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 321D6A39B8C
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 12:59:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A28B10E3A8;
	Tue, 18 Feb 2025 11:59:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DQSl4MBG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05A8210E3A8
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 11:59:34 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-438a3216fc2so55910215e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 03:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739879972; x=1740484772; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=O813gytfaIQgKCLFaWJ2ufXSdD7F7BWIQSR0PxjKtPk=;
 b=DQSl4MBGYzBPJeKt51ItG3KOfR6f1kE47siaD978QOoHVVN7cIHwTtzTGXyILomMbO
 f4O5UDmyBptzNZ9OjzeXnFibAGHo9ody45RfzZoXYa+wz468s06fneRQHZDIwhqD0zBa
 JAg9QADI9sN8UtIoET9Ki+lrwQRpTD1k9OyAS1ewQKR0QFX42b/tSIu7xtMq0txzw3BB
 XCCJcnMoWs/gBuyqb/MMM1FEip1jMGI9kzIzZRHeN6iJja+jMrDA/UWyNGP9XQCwoocz
 2xGLj09CQ6jvcWeJ7hEJa0BkSv7aJKqa2rNJ1qzEkgowZ3QduX0qd6O+ZjCv6t5WzOJr
 Wdyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739879972; x=1740484772;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=O813gytfaIQgKCLFaWJ2ufXSdD7F7BWIQSR0PxjKtPk=;
 b=wASgtgqrBSmRlp17/87isJSouXlGmIJw5lYZM2HVypYERnVHQXJWpOIgCYx8gQr5I1
 txiHJX5ViHUWTEIEuS0tQwwbikqq7BnvT/yHI9kqOynrbJFhQ8KQk5aamLbZQc9of3Bu
 6KRRHaSzry7HqVNUUPI1cU2DaB49nqGG2AnrgT2fTmLQscJIUg8d5BkwNp4WiS9wCrel
 NI8LeqSGEBKpueknl3FFhlAbyBYWDUz6cBucQ0jmkimgWH8J5imPpsiYnFpqw7Q+vsQc
 j/A9QNYUCxv3Mt96H4uEg2r2Q9TbElP0AkLtk9Dc0G60vjVj6E88DW/ckgo9gV2yEGq/
 x2mA==
X-Gm-Message-State: AOJu0YwX21Ndm8GC6fc7hsjzlcs7HFOsALat2DjhxC78t9XooEmuZi2q
 R/fXu9kwir3zsGnfC3cxw5TgL4g9tqqHXB82qFWXMbo9xGi/h36k
X-Gm-Gg: ASbGncu6X+DMmQuO4jckLIX1UURG4QWayfa3v+NdjMnE2XvMBP8x9w1gb989JeQNAdQ
 1oBqKjYqYTvk4RIm/nCKaLjz9Ap9c2X5r9JZFNsENCMdOlrNEQnkkwt3ocwPPrpLTRwAXvOa5s1
 I84ZFLq5p9SQXnNlOO4uckzR0acHifXc4x441UnxhZ+XNPc6WiGgWJMBZjm8TVjGINdRy1R7C/A
 YCuNzIF59dblTYN++L6Q7LqyfFyc/PXhri0WW15T2+1QPwXpca4hwqsV+YoAIOSPr37FTzdbX62
 mgmxwxYFOZryoy0aPIDfjcHWiM/BKRER/WlqfNCBkBZs
X-Google-Smtp-Source: AGHT+IG89ZnXBXFf5f1VSsSomJrwv7mMVHfOqUcCIv9ZtqZW9JNdN8IPm7JEBYPGywYE8kKOC0HxLg==
X-Received: by 2002:a05:600c:1e23:b0:439:8346:506b with SMTP id
 5b1f17b1804b1-4398346535emr60676785e9.19.1739879972344; 
 Tue, 18 Feb 2025 03:59:32 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:6940:cc67:5b00:b151])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395cf084d5sm123873255e9.1.2025.02.18.03.59.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 03:59:31 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Prabhakar <prabhakar.csengg@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/3] Add support for Mali-G31 GPU on RZ/V2H(P) SoC
Date: Tue, 18 Feb 2025 11:59:19 +0000
Message-ID: <20250218115922.407816-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series adds support for the Mali-G31 GPU on the RZ/V2H(P) SoC.
The changes include updating the device tree bindings, adding the GPU node
to the SoC device tree, and enabling the GPU on the RZ/V2H evaluation kit.

Lad Prabhakar (3):
  dt-bindings: gpu: mali-bifrost: Add compatible for RZ/V2H(P) SoC
  arm64: dts: renesas: r9a09g057: Add Mali-G31 GPU node
  arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable Mali-G31

 .../bindings/gpu/arm,mali-bifrost.yaml        |  2 +
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi    | 51 +++++++++++++++++++
 .../dts/renesas/r9a09g057h44-rzv2h-evk.dts    | 15 ++++++
 3 files changed, 68 insertions(+)

-- 
2.43.0

