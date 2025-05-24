Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE04AC2E7C
	for <lists+dri-devel@lfdr.de>; Sat, 24 May 2025 11:19:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98C9B10E1DC;
	Sat, 24 May 2025 09:19:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="iynCZPQb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2253510E19B
 for <dri-devel@lists.freedesktop.org>; Sat, 24 May 2025 09:19:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id AA27D4ABAA;
 Sat, 24 May 2025 09:19:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 43033C4CEEE;
 Sat, 24 May 2025 09:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748078354;
 bh=ByKRfmUS7oGlsvSeZn4NcYMz3p4i4dHR18AvjwkAKbk=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=iynCZPQbT3Sz4Zy9uMq98gV5UhpEYDqrH+RTj+/b7rlw8dMkEUz8M0nn9ne2bxWGp
 xcC6deuVA7q0rIqRcy6IRjYRvE2qHkORmte41zZ0V1nfxnRMojLLsw7kuWdFh1Akhh
 eMmqCxW0Y2LGPYCsIFmlADpysJx4zEP+BHPcPG0i7HMt3fI4fG+dK0sAOhMm424SDl
 eEx1IxRPonIZ51op64P5I2iSWWXMwgJ9isgXn4B+0TlaFUqiQRvEGaZqx85vBvvPn1
 kIF6VtyxkD9IZkaQOtAYheNcZBHJZHU4J6t5itp3I71PgpzlEaObVr637nXf5QtoBB
 Y5jw1W2m5muWw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 328D2C54FB3;
 Sat, 24 May 2025 09:19:14 +0000 (UTC)
From: Jens Glathe via B4 Relay
 <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Sat, 24 May 2025 11:19:09 +0200
Subject: [PATCH v3 2/6] drm/panel-edp: add N160JCE-ELL CMN panel for Lenovo
 Thinkbook 16
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250524-tb16-dt-v3-2-17e26d935e73@oldschoolsolutions.biz>
References: <20250524-tb16-dt-v3-0-17e26d935e73@oldschoolsolutions.biz>
In-Reply-To: <20250524-tb16-dt-v3-0-17e26d935e73@oldschoolsolutions.biz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Matthias Kaehlcke <mka@chromium.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>, 
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>, linux-usb@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748078352; l=1516;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=tHgac9hVQDbAaXNwsVj/n84C1GFybdnTbmVUs8xBXGE=;
 b=/8UFrqByg0mrieUk3yMAUUIrl0E/UZ1a0wAIb4reDpuqJnN3GPadDXgqdfZn7cBjOM7oR+Ms+
 7R08QqyfqOoAnNLxiN0VLx/KrrgbYA+pScVORVggiOMbNxP8zUH6FRA
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
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
Reply-To: jens.glathe@oldschoolsolutions.biz
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

Panel is widely used in 16" laptops, and also in my Thinkbook 16 G7 QOY.

CMN N160JCE-ELL EDID
edid-decode (hex):

00 ff ff ff ff ff ff 00 0d ae 2b 16 00 00 00 00
20 20 01 04 a5 22 16 78 03 28 65 97 59 54 8e 27
1e 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 42 3c 80 a0 70 b0 24 40 30 20
a6 00 58 d7 10 00 00 18 35 30 80 a0 70 b0 24 40
30 20 a6 00 58 d7 10 00 00 18 00 00 00 fd 00 28
3c 4b 4b 10 01 0a 20 20 20 20 20 20 00 00 00 fe
00 4e 31 36 30 4a 43 45 2d 45 4c 4c 0a 20 00 95

Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 90e8c154a9788ad40e2101fdf39cbd92f2e0773a..ec9622e0a313f4a228618f119e2aaa812f63d5a4 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1973,6 +1973,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x14d4, &delay_200_500_e80_d50, "N140HCA-EAC"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x14d6, &delay_200_500_e80_d50, "N140BGA-EA4"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x14e5, &delay_200_500_e80_d50, "N140HGA-EA1"),
+	EDP_PANEL_ENTRY('C', 'M', 'N', 0x162b, &delay_200_500_e80_d50, "N160JCE-ELL"),
 
 	EDP_PANEL_ENTRY('C', 'S', 'O', 0x1200, &delay_200_500_e50_p2e200, "MNC207QS1-1"),
 	EDP_PANEL_ENTRY('C', 'S', 'O', 0x1413, &delay_200_500_e50_p2e200, "MNE007JA1-2"),

-- 
2.48.1


