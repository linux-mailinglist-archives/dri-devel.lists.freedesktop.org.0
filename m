Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 016EFBC55B8
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 16:05:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B212710E822;
	Wed,  8 Oct 2025 14:05:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bTA2XkcT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7091D10E81D
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 14:05:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 02C7248987;
 Wed,  8 Oct 2025 14:05:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C47F2C116C6;
 Wed,  8 Oct 2025 14:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759932330;
 bh=9bVearmQFwT4337hd9NqP8CJl3TV9B6RJZRF3V2Pm+A=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=bTA2XkcT1nZfJlwrn2e68zMSGKdY1ISFJ8xLyqbI2DJoHCtKo2B9CVYdTpIPylrtE
 KL/WGx7mZSSy16T1Ii0ytgef/NnGYB8HDhDqUx5Pu42dtjs3H/n6opZgvStlsDhrjo
 6RQN2zZodCIatBFONXPIrbA23Oy3yw7IJznRxSFW1Tbz+U3m/XPt5I24jVU+z+wBza
 DRX9JdiC5fVHyyiBZmDX+S7SJyFGo8AlvPreEBgkVwcnk7SGWR0RbO1Qx18NnpueAs
 nNcpNjY9ZX6LmGoNhb8pKhXU5bR1Si2iDAkJkCQLi73uCeaIH8VhlsGEBxv6rYXihh
 cAOjeqNc1p/nA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id BB101CCA470;
 Wed,  8 Oct 2025 14:05:30 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Wed, 08 Oct 2025 16:05:30 +0200
Subject: [PATCH v2 3/7] arm64: dts: qcom: sdm845-oneplus-fajita: Use the
 freshly introduced driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251008-s6e3fc2x01-v2-3-21eca1d5c289@ixit.cz>
References: <20251008-s6e3fc2x01-v2-0-21eca1d5c289@ixit.cz>
In-Reply-To: <20251008-s6e3fc2x01-v2-0-21eca1d5c289@ixit.cz>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Casey Connolly <casey.connolly@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=785; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=q/p/oUY/pg0psfDX27C/axQezovaGYNjTnnvhN5F6iw=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBo5m+o8WwYZzJmpGUawi0df9TqyDrWc1ltH2aT1
 c4H6sYwSvmJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaOZvqAAKCRBgAj/E00kg
 cvyoEACS08aETUxyptP3uxV/seFzPvBW9ta1Gvhde2LowExWDfg5Oi7yiCc2xrzlmP22ycMyBDJ
 pvZrPP6QXzEe4ONdIedzl0tyZFDa+91qo/f0vdgymQR+fcTse55mY4L3qZI0QpWae2G7XjwRPAb
 kxIQOlpywvU+zZ4mwdf7JNh5y2+AcQUXFd0tac6uSoYB6gtdwK05m4GpQP0SNV6QgerdWP/3KGn
 z3hwmKCRXKPLosKWcd+Gdv/qwYIDEGl65mbf95Hg1FwTN2i3eOyXJN2oPdwZDFzb2UllkG7ck1T
 NwexZYDvhNLd2IncXUO9E4d2H2wAOxU0J14kpWKlNpGO6fCJVhOUv9K9p3Ho6rdKEXLwnVdjFv5
 fbpiSNiEddAi0dToxSNzFH9ewZnLDTLmDffVUHUT9w/IgwTwONI/a15FJeyHYADoR9g4LwTB5OX
 p0n8GNMBAJnvopl7cuIV/UQbi2XYjWkyun+z4bASaA+1GamhP7O/4pu3HeHOiNYXE3dhpxVMzh8
 w3GdGTluwzTAW9qkM9R0j+hHy4blUYmJAHkGy+ToTmVk8814FEzGdlx7GXbpYxHI/8ESOFZDcMe
 x0uh8K48GZgxuXH36OO+wOKqkrnz8MFy+QGMrei38bWpYq+aAy2IKRlunv981DwfNtdzlfdlzr8
 K/J2Tvp1X/K631w==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
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
Reply-To: david@ixit.cz
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: David Heidelberg <david@ixit.cz>

Switch from older effort to support different panels within one driver
(which already dropped support for the HW) to the freshly written one.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts b/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
index 7e75decfda052..55b3e94dd9726 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
@@ -32,7 +32,7 @@ battery: battery {
 &display_panel {
 	status = "okay";
 
-	compatible = "samsung,s6e3fc2x01";
+	compatible = "samsung,s6e3fc2x01-ams641rw";
 };
 
 &i2c4 {

-- 
2.51.0


