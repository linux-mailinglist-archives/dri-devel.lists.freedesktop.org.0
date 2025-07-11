Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC36B01DA7
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 15:35:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5AFA10EA59;
	Fri, 11 Jul 2025 13:35:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SoPIOW9x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D01B510E252
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 03:59:09 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-32b5226e6beso16316501fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 20:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752206348; x=1752811148; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=85nfx4ldL54wSVT5XtoQ/mvHVV77q6rK3dhp/Wa5E+U=;
 b=SoPIOW9x8ROZfi++IaQptBCScc+3ZtZWL2ZbS7iIp8AoJ8ZogbeqNt+PJJMLh/LVFI
 HJbxRV8cxyZyyhE7wkPnkzafOWlMHl/JE8T+vTQ3pCNrY2nipx+Un57MF4I4zD9XjUui
 yLnDDhZ+xNYMB8pgD8XKikD/aFrGRaDFgC6Vh0aNi2WK8iRahDQIqYCpj6apQslfZMZZ
 EhoW1mRY/7gY10IdI8C96uKKTsitM5OfSq2dqemXPSyyADQ0xmRYuULNVzoQpD6sBUBj
 CmGq1sxzOTJ8tgbVndU449KKFAh2CqjiIQgt7Y/5j595GeR4klMeNNQGSMTyOg5Ycefl
 C0Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752206348; x=1752811148;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=85nfx4ldL54wSVT5XtoQ/mvHVV77q6rK3dhp/Wa5E+U=;
 b=AFGggGLp/J9QqqnygD+qW/kN73Pj90ENENqBlm350vDLeuON9JFZO7DuxIs8Vd1DcQ
 bSQEX63ibWTPl+Oez8f8LkrVH49q4MF5Z2hLsMrkXMfqj9s9wyShKRRmpz3E24UYqu9a
 nO8QoltH+OfmHNsBV2V/mcYqQSLqqlWnhYOuevVoG42wEtGElCoMYFQhUqJ/nkxjhY4L
 rHr6fspTndQFQ/sX4lgTJJymlNVNbbwnh3hMJIL5AGnHcKYijrghwG8QCXROBCiNg1QL
 q8p9bsGh3FrNEN7sekm7CHRtXJZOGhna4JY/Yizt72iHKj9sZgbUAE0hrKmJ62Rgkk3P
 BTkw==
X-Gm-Message-State: AOJu0YwkKlRLcFAocnU5B7+wDu6SzIMTs9XRW8bGpJuVpYWx39z9Vw0E
 mXIKFoC372+4VKEwX46lHH1FFAYwU9i4fXfYcNrdS881TSptc9kxdBp+
X-Gm-Gg: ASbGncvx4oNzMANCoPG3FRhbQ1BRrDmyBmQBbKwgyrs1GDIxws5I1jpV8BVSIsyq2+t
 eJ68drAkhAz5njqWBMXP96lpMg3aWoc6omk6wPXauCZaw9FcEkp12FSw3Zvtb9UDCZuCqizoWP9
 QY0zxuMNk+X9NpVTBFxQ9JCH4YeYGYMNZ8JLBj872XrHt4oxg48XZtGGpAieD5HKPn5A7E1oPG7
 EQ5ui3lfZVqG8O36m1RBYnU5VEHXFygl6EEukqeGdgZM6Suk1s7Ooas3iou+l/fxf+fc9Jc+uKL
 i+jK8ZgYQoAwCB3FtohcuYB36lvmVAdldX6zMyN+DfW1rnBFugLOjuHc2QpP8bbEfaKW8vplPE3
 oYqoi9tKAn6g=
X-Google-Smtp-Source: AGHT+IF2Vs2taWbckoiIUXDCtLJBtsJW8Ugy8fMUOW8WzA36Et0dLFCN8dorIxDAVjB7GGJ88bp0Fg==
X-Received: by 2002:a05:651c:555:b0:32b:7ddd:279e with SMTP id
 38308e7fff4ca-330532dfb0emr4152281fa.14.1752206347958; 
 Thu, 10 Jul 2025 20:59:07 -0700 (PDT)
Received: from junAIR ([212.192.12.80]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32fa2943d46sm4971191fa.40.2025.07.10.20.58.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 20:59:07 -0700 (PDT)
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
Subject: [PATCH v2 3/3] arm64: dts: allwinner: a523: enable Mali GPU for all
 boards
Date: Fri, 11 Jul 2025 11:57:29 +0800
Message-ID: <20250711035730.17507-4-iuncuim@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250711035730.17507-1-iuncuim@gmail.com>
References: <20250711035730.17507-1-iuncuim@gmail.com>
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

All devices based on the A523/A527/H728/T527 processors contain a G57 MC1 GPU.

Enable the DT nodes for this GPU and specify a regulator that supplies power
to the SoC's VDD_GPU pins. The other parameters are set in the SoC dtsi,
so are board independent.

Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts   | 5 +++++
 arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts    | 5 +++++
 arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts   | 5 +++++
 arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts | 5 +++++
 4 files changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts b/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
index 8bc0f2c72..553ad774e 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
@@ -66,6 +66,11 @@ &gmac0 {
 	status = "okay";
 };
 
+&gpu {
+	mali-supply = <&reg_dcdc2>;
+	status = "okay";
+};
+
 &mdio0 {
 	ext_rgmii_phy: ethernet-phy@1 {
 		compatible = "ethernet-phy-ieee802.3-c22";
diff --git a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
index 59db10354..a96927fbd 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
@@ -54,6 +54,11 @@ &ehci1 {
 	status = "okay";
 };
 
+&gpu {
+	mali-supply = <&reg_dcdc2>;
+	status = "okay";
+};
+
 &mmc0 {
 	vmmc-supply = <&reg_vcc3v3>;
 	cd-gpios = <&pio 5 6 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PF6 */
diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
index 142177c1f..b9eeb6753 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
@@ -76,6 +76,11 @@ &gmac0 {
 	status = "okay";
 };
 
+&gpu {
+	mali-supply = <&reg_dcdc2>;
+	status = "okay";
+};
+
 &mdio0 {
 	ext_rgmii_phy: ethernet-phy@1 {
 		compatible = "ethernet-phy-ieee802.3-c22";
diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts b/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
index 5f97505ec..d07bb9193 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
@@ -95,6 +95,11 @@ &ehci1 {
 	status = "okay";
 };
 
+&gpu {
+	mali-supply = <&reg_dcdc2>;
+	status = "okay";
+};
+
 &mmc0 {
 	vmmc-supply = <&reg_cldo3>;
 	cd-gpios = <&pio 5 6 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PF6 */
-- 
2.50.0

