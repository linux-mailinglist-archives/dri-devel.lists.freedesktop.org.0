Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB2DB094BA
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 21:16:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89CB110E88D;
	Thu, 17 Jul 2025 19:16:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iJfHRZbI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D18A10E88D
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 19:16:48 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-455fdfb5d04so7796095e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 12:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752779807; x=1753384607; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=IniKC5WKFomByrKxv+MfxE4r4cLS1U5X+1446OuWw/4=;
 b=iJfHRZbIDDcPVmTCtE4xLct1QCqCE//rC/JzVOVn0HII5vmsVUaqV+hvL1jU1/sC1C
 qE5ot17NDcKAnPACe1tUOr4pjt9g8kxKgN7/jrfkcqB3H0bloPt6VLMjD4thRWS5Smrw
 6utcw3Rjkqc92jZ3zlwP+MWZqjrrg+aXMZO+WxF4RSVXLb+9klMReFF6DDWJt8VApnTo
 nQjeasIbc54xzZXIqd21WR3+lUZ+JVLU6JkMT+2QWAeUJBS5Hz/6gX77/KHMRIMOgzV8
 K69mkvcetfmTCYdzT0CxyU3OQmlBwVV6Fhtrh3HUGidTD/uvf04G8TsanQP/HChLQKaA
 TsHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752779807; x=1753384607;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IniKC5WKFomByrKxv+MfxE4r4cLS1U5X+1446OuWw/4=;
 b=H+8lFecEEC9iFRHN9CbISgWxiU4VXtJXSr4Q4ajD8CxnSPgEa4cp4XXUheAodRA3+d
 zfy5MkqJPU/9Fb4SRMxCIK0RvwyL8DinXbDPM/Z38M4Ea514YZol+MwUGUFfjidUc4lN
 vqFQL9kIgKM8mTdV8N1ynbUbCL81BsyoGTckFWFsGOBcg6TscdylSvUW2v0oL6JbcBio
 iRTHJfFCV4+zYLtTXDg9r0o9rSvINnBrE/xnFwNSqjYW8hoDFKIT+piOnBq1LLtEJ2O3
 PwVVv+SrkDsGiEFWbB7+SDPAoh2Fcaom27gNBWScVYregzVG91+48u3oG0sJtL6TZu3s
 iNhA==
X-Gm-Message-State: AOJu0YymmVmdS8NbUOLoGE8niKnW4tmW+nwbgbvldBxwzMdtwfBLvg/C
 2MaCzfI7ZrivrylyXJv+/SFYCNapvuqNGImmt9FYv9uJd3wj8heugVE9
X-Gm-Gg: ASbGnct+MhoUhtY7aKeOMo2INJa8+ho8lW/5MoYGETlTyuDfWi2jpO70cFOwigG16bb
 o34BYbINrQeE+2PYf2QRWSPl3lPoqsebcVhoZCScVQ6hp2wedL0xNovF/qNDNpJFV8TS+M757sL
 T+s4kgdTajJwdPiNIlX9TPcjeezT74TPwRIWhFYaVu8u9XoNMpVVPyl+y1Ybaf7n7zwke+5lgqK
 G7uu2nogLToTVg1GkE+sd/ju0/eJDt0cSiTB8/sN8dg1ojtFhde2twGxGB1VSiJPIA4TUT5OpG4
 y/2Wdr9ALLqoTNtUKcoUm58R9gBuOEr19jVMv3JdfU63AhSREQl/oNkOzKiM2aczuLI0xZIoejq
 kQ8TF+e9A3/BLDPiOZPi5YtiXzeJ5LbcT
X-Google-Smtp-Source: AGHT+IGHzyOYCw/m0HyP4umB1YuYT0FPkPuXBFk/lapuzoe2X+waZSCxE0xX5hMXQCuEqnY0X0GUaA==
X-Received: by 2002:a05:600c:3d97:b0:456:29da:bb25 with SMTP id
 5b1f17b1804b1-4563532c32fmr38379325e9.19.1752779806421; 
 Thu, 17 Jul 2025 12:16:46 -0700 (PDT)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4562e80246asm58861725e9.10.2025.07.17.12.16.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jul 2025 12:16:46 -0700 (PDT)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Thu, 17 Jul 2025 21:15:35 +0200
Subject: [PATCH 4/4] ARM: dts: sti: remove useless cells fields
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-sti-rework-v1-4-46d516fb1ebb@gmail.com>
References: <20250717-sti-rework-v1-0-46d516fb1ebb@gmail.com>
In-Reply-To: <20250717-sti-rework-v1-0-46d516fb1ebb@gmail.com>
To: Alain Volmat <alain.volmat@foss.st.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=834; i=rgallaispou@gmail.com; 
 h=from:subject:message-id;
 bh=l0o8fS1wvKD2cvbhZZBTKbtQIm4NdpPP35SyjFhlGvg=; 
 b=owEBbQKS/ZANAwAKAechimjUEsK1AcsmYgBoeUwYbZ7h03ffdcgJqJpcrr4dawhJoUjOSplKv
 rVN0WaP95eJAjMEAAEKAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCaHlMGAAKCRDnIYpo1BLC
 tUtkEACW2KbCulMwEimw5aLEGZ5XRbUYEK7XeBo+HKLYJJZUDJuQC1lR6m2p044x5FaJ90wxFic
 DwY64YN6E1Y5WlBqrd9DRQPsD64eKHKllh8x1vnZI4LpzBcFj9Npq6E7ozfkWRn6yMvqJLcOszf
 SN3aZcsYMAZE71FPuYLnl9SikG4VidpUxwdQcdZ8s6nAFiLhujxNraibTFDnYhD669+iLSx4RP+
 qIq62BqIZXxgUn571k4tMjWD/63S7F0utZeWyyrlraP6NJkJaEVSsYyrtvgfVN1+I27Km8O7nWH
 Y/yH3h97XhTfnK+ipaY4hvjbo0G71vRJ+yKtlU0UjLTYYDk87RsuxPl8DKe4r3flNbC7mqqW2/w
 UbDCozcdswbFuNBu8+d5kpg5CoYwGjuVejsf1UeECrDkwrIsXnoQWOMZSC40NSGwdzzvOirWVQa
 iu7JUWIOiNYhbgvgtcbwrZmRRD1KUHKCOroSkxymsxUWyfDP5q8ILa8tDUXT4cWuKzdYNFP0oUx
 cSqDGKJ8nhMkWrjkZvuPfisb6oUGkOU15WrBM/ChJB3FF062Jws69igkXENPjXQ4kwXgmHS7JWT
 qMiKi2iGZrtWxXIiwzgB/NEk209ajh85JzSlZHgcCK3GOS4IlC4IDTIyDukjbYO/3Q6UXaE43+t
 oIYTG2joSLVDe2g==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5
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

tvout node do not need the cells fields. Remove them.

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
 arch/arm/boot/dts/st/stih410.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/st/stih410.dtsi b/arch/arm/boot/dts/st/stih410.dtsi
index 47d66d7eb07a3d73d98b3e21d62b2253aa1171e4..07da9b48ccac16c25da546ace8e6ac5773c68569 100644
--- a/arch/arm/boot/dts/st/stih410.dtsi
+++ b/arch/arm/boot/dts/st/stih410.dtsi
@@ -191,8 +191,6 @@ tvout: encoder@8d08000 {
 			reg-names = "tvout-reg";
 			reset-names = "tvout";
 			resets = <&softreset STIH407_HDTVOUT_SOFTRESET>;
-			#address-cells = <1>;
-			#size-cells = <1>;
 			assigned-clocks = <&clk_s_d2_flexgen CLK_PIX_HDMI>,
 					  <&clk_s_d2_flexgen CLK_TMDS_HDMI>,
 					  <&clk_s_d2_flexgen CLK_REF_HDMIPHY>,

-- 
2.50.1

