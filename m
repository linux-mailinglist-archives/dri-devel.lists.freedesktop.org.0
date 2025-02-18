Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8299A39B91
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 12:59:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3184F10E6A6;
	Tue, 18 Feb 2025 11:59:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GP7ZBlgZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5974C10E69A
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 11:59:37 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-43998deed24so264835e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 03:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739879976; x=1740484776; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FZiOt1lRlot1BHFChoYwPIhNyiHDH8feLoQiFWYbmsI=;
 b=GP7ZBlgZANvsP9Wt70qy/0CxGXBygM3F3itJZs4GJClklPtWV8G5Om/AydeyNtW5vN
 NAjC7zuLKiR7LYrCR8+s+tOzzGaOnDVDK7St/9FB6JaeagiCu98ATa3C0WxuowdnXJFv
 0u+mi2Khy3p6SSOsXpyZZFuRnK1urf7R7m7l51LtlFX/cblS9EfkvraMExYs6KTZ+NKk
 TsmPz2KJvJfnfASi1Dqvl7fqHJILjMPsjCFrA2Naws2l6aD6nSuvBnbnRgvitE58lJZY
 NLsOKYIZ6PL66JZkX/Jn7ztHXrUUtEoDeLyNZ+GeTNh8UIzlycxRPblCx3RstqVBmO/j
 3vmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739879976; x=1740484776;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FZiOt1lRlot1BHFChoYwPIhNyiHDH8feLoQiFWYbmsI=;
 b=KkJTk2717QkqcFYIGDLVpP42UsRBvg+XDNylBVVRo13K2t5ZLWto+fscfxzvbuq+Ln
 SD8wjF5VU9sKmUmkmYO5QkzEq8MjOMLwy0OmwhvSl4CyArQSTTPPXL0/ITlEEkt3PC8j
 e0JdSk5NV7yHxt8mpPqbBrBIu0gi8J1DrsqS/vbUAE9AJ20GHfuADo5g3040V+H+cwsN
 rR3cUlH4DhSOxWKfkvuUkjnj03YZhrOfLqNR7JuLrhUMYraQ8wDHjsYI1/3pzV8Ovspd
 Z+0CZX0p/dGvuBtLvCEE1vkRN4tYJ2KRc6gDmcZT90l5OC2WeMOZzjWuHro8oZ6sIrVw
 yZKA==
X-Gm-Message-State: AOJu0Yw/hzPWazXVH4R6SLAfefUqjcsNilS/vzEhOA9OLYsPFQKERbCt
 mNqc78/xfgTW977uoe1PRB7VtLSEnYGiRZ4IyVtKsas+RQRcYn20
X-Gm-Gg: ASbGncvpaNaRlJ9tRnRxZV9xrumOFD7jvP54NoCWj9bmVAX+D+VHypKArGCv+6mMJAH
 UzxvwK9fiday+UY1mJnb1b79hockEdt3YXSnxgu0GE1pPxw6f5l4b03nrSRDi8donL6z5QPSCAq
 tvWCdL8UoAjNxRpX6BXE/ON9TQvF6XJS6h+6hb+HZ7tUP3sn9Ae56kxv4I2SpPLuvkQfQFp7Rl4
 x6KPMJuNu8eG9O4Ksj+JQ3yxdnD+TfojaH4q0A/h7BK+bG/8D7xX69hh10LyAODqZIMm0rRH9EU
 VqNMsKRaJJWvqOB26mPLfYvD7hF94xqiupuBz4wA0UI1
X-Google-Smtp-Source: AGHT+IECB+4Nj3x0srmh79Ho2gtvdQ8hh//8sYwUbQaKdPmJsDnfYeBX7wxvKbP1TDMZ73eMzpnTtA==
X-Received: by 2002:a5d:5887:0:b0:38f:3b57:681e with SMTP id
 ffacd0b85a97d-38f3b576996mr8762134f8f.49.1739879975723; 
 Tue, 18 Feb 2025 03:59:35 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:6940:cc67:5b00:b151])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395cf084d5sm123873255e9.1.2025.02.18.03.59.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 03:59:35 -0800 (PST)
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
Subject: [PATCH 3/3] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable
 Mali-G31
Date: Tue, 18 Feb 2025 11:59:22 +0000
Message-ID: <20250218115922.407816-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250218115922.407816-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250218115922.407816-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Enable Mali-G31 (GPU) node on EVK board.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts   | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
index 0b705c987b6c..780823908bf4 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
@@ -43,6 +43,16 @@ memory@240000000 {
 		reg = <0x2 0x40000000 0x2 0x00000000>;
 	};
 
+	reg_0p8v: regulator0 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "fixed-0.8V";
+		regulator-min-microvolt = <800000>;
+		regulator-max-microvolt = <800000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
 	reg_3p3v: regulator1 {
 		compatible = "regulator-fixed";
 
@@ -124,6 +134,11 @@ &i2c8 {
 	status = "okay";
 };
 
+&gpu {
+	status = "okay";
+	mali-supply = <&reg_0p8v>;
+};
+
 &ostm0 {
 	status = "okay";
 };
-- 
2.43.0

