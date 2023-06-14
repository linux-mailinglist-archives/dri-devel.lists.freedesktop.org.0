Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6499E731135
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 09:47:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA91D10E48F;
	Thu, 15 Jun 2023 07:46:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 374CD10E0C0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jun 2023 19:09:05 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-30af159b433so6897985f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jun 2023 12:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686769743; x=1689361743;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=5u9vHxVGrzBlNg97U37WfCH1VZYMHPccfRdk0EIgi0Q=;
 b=CpgQ+Kp063bXwmLKcP1EEsFKM93bGnY15ULSzxfxUlpJLR6gAyb4oeXYPjqoQUm1Qh
 kHc+Ueb4SiOE+/bHeahP/YzEp4jLn6ikXcfMAlgRRiQV+sBkHYwFpjdNXjkOsMvCRpUi
 2Jb1+Go+ysqeLQxKvH0let+oPsNKRlCFj1nQL9S5ZsjhYwW+J7uflIfyuyXjNdTLvfzG
 0Q3jbptnO63W0s2Kp2zPcEmszKHZ4i4SAg6G7taC8/t7agm9MGmGOJWKsg0iNceDD1Yi
 xnjkmJNOjCwEz+99cd4NwBByCBeI0xLzscMFpyO9RUZzCr2+s4nj7LRAa3JSvCc/Aohl
 0Bfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686769743; x=1689361743;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5u9vHxVGrzBlNg97U37WfCH1VZYMHPccfRdk0EIgi0Q=;
 b=MBcXSnbByPscoV9z8gACbOAvRxr8yxLpK9xFBkXkofr02b4OhXs+XNdMh7X4TcN9rq
 T+nZDh4hBG/ze7BOSU9yvzp+nwCxio/Hzly6F/wt0y4ovKE/ffiJOzxj26vuUUTpPvLg
 C+lh8bkifIa/ViB8esKKgoCTfZXdnlToB/Ez5djjsJSDwx5vSpRohvtwadaQQ8xlq6ni
 8hIz7GcT5nPpQFKnUbF1zIKRe2ZWYDvvWm5PdEy/+GhBRK0Kx6Ju7MqR5StDp73lqq1G
 KEPE7L9do4V/qkX48xsIA22jDw1jMqJQXef9Umj7PvMrisp1Wfc8jPkVFv0CN1hB+xVn
 LO1A==
X-Gm-Message-State: AC+VfDxhBs9UrUKo7vEINaJcAGzn1h3altBXTy9XgCbihcM14XnBtuyK
 Eq/JbjWSNyaya3JxJh4iufA=
X-Google-Smtp-Source: ACHHUZ4WcZukf0p1Xe7srG7EpSfRIc8i1xLVw2rVsv9fLH+mSROtW2rbeQ6y/IwrGmrmgOtHgQBd0Q==
X-Received: by 2002:a5d:4009:0:b0:30d:673e:1547 with SMTP id
 n9-20020a5d4009000000b0030d673e1547mr12367726wrp.41.1686769743534; 
 Wed, 14 Jun 2023 12:09:03 -0700 (PDT)
Received: from [127.0.1.1]
 (2001-4dd6-393b-ff-f59e-4402-63f8-7ff5.ipv6dyn.netcologne.de.
 [2001:4dd6:393b:ff:f59e:4402:63f8:7ff5])
 by smtp.gmail.com with ESMTPSA id
 e6-20020a5d5306000000b003110ab70a4fsm2341094wrv.83.2023.06.14.12.09.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jun 2023 12:09:03 -0700 (PDT)
From: Maximilian Weigand <mweigand2017@gmail.com>
Date: Wed, 14 Jun 2023 21:08:54 +0200
Subject: [PATCH 3/3] arm64: dts: rockchip: shift boost frequency for
 rk3566-pinenote backlight
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230602-lm3630a_boost_frequency-v1-3-076472036d1a@mweigand.net>
References: <20230602-lm3630a_boost_frequency-v1-0-076472036d1a@mweigand.net>
In-Reply-To: <20230602-lm3630a_boost_frequency-v1-0-076472036d1a@mweigand.net>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>, 
 Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1686769738; l=833;
 i=mweigand@mweigand.net; s=20230601; h=from:subject:message-id;
 bh=68FCYhe2/70pszTO5OdRKpvXw9/fY4xli3NXD6/hP14=;
 b=S4CP5nzsXth0E8aD8pqpP1sl8cO7kQrQEa7HRD5BrzLuryOjSI3/PCNUZyOKG9OtVCheLd/e+
 i6pmW/zckRjBf6ve1+/wKCo4UP/YGxbpdycIp3O6ibe+0ai9w0SVaYb
X-Developer-Key: i=mweigand@mweigand.net; a=ed25519;
 pk=Tjuj6PXmCCxzGTRw+9suZuZ41q/etgDHrIbPdkAaTpM=
X-Mailman-Approved-At: Thu, 15 Jun 2023 07:46:51 +0000
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Maximilian Weigand <mweigand@mweigand.net>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Maximilian Weigand <mweigand@mweigand.net>

The PineNote exhibits visible flickering of its backlight for certain
brightness settings. Alleviate this by enabling a frequency shift from
500 kHz to 560 kHz for the boost converter of the led driver.

Signed-off-by: Maximilian Weigand <mweigand@mweigand.net>
---
 arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi b/arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi
index 8d61f824c12d..4e4b3bbaa157 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi
@@ -453,6 +453,7 @@ led-controller@36 {
 		pinctrl-names = "default";
 		#address-cells = <1>;
 		#size-cells = <0>;
+		ti,boost_frequency_shift;
 
 		led@0 {
 			reg = <0>;

-- 
2.39.2

