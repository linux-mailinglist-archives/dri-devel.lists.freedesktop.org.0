Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB7F9D6914
	for <lists+dri-devel@lfdr.de>; Sat, 23 Nov 2024 13:59:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3D1310E070;
	Sat, 23 Nov 2024 12:59:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IU91tfGj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF20E10E070
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Nov 2024 12:59:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id F317B5C10EE;
 Sat, 23 Nov 2024 12:58:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EC4C2C4CED1;
 Sat, 23 Nov 2024 12:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732366739;
 bh=E4I3y7xqOaJT9A85WU9bzFuhEDIjkVR1pOZnZP8SlLA=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=IU91tfGjujXXaaxeYFd3zJekCTMT1lgvFFgPnimAOoJOhOCQJmAyqnB8/MZDQc24Y
 AnQuXPqiwA7iQ/H+EZUuHgE7Kfvt90JROxvN9e22kGrkR0MaJY4bRT2BkcOztcW57n
 LOEwZxSNAdFCAN8Vd7OvrDAsLb/mtmGPZvj9HWmlpwnT7qadX9yFLNCdYy2bTHAdZy
 GwxYI0Am76K6UOGrXuANPYkJUU87Y9nEsC+kVUvlx+qQ/BdQiq5p5B1ZLZ2aMYGHyS
 OV5cEuYG7y2qKLlA1bUWXAyGmN5ECc5WeI8KCcCQYLIGadB6pI6R4/mooCbPEAgmM2
 XzXcnejfZOmLQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id D9FC1E6ADF8;
 Sat, 23 Nov 2024 12:58:58 +0000 (UTC)
From: Maud Spierings via B4 Relay
 <devnull+maud_spierings.hotmail.com@kernel.org>
Date: Sat, 23 Nov 2024 13:58:53 +0100
Subject: [PATCH v2 1/4] dt-bindings: display: panel: samsung,atna56ac03:
 Document ATNA56AC03
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241123-asus_qcom_display-v2-1-a0bff8576024@hotmail.com>
References: <20241123-asus_qcom_display-v2-0-a0bff8576024@hotmail.com>
In-Reply-To: <20241123-asus_qcom_display-v2-0-a0bff8576024@hotmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Douglas Anderson <dianders@chromium.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Maud Spierings <maud_spierings@hotmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732366736; l=1104;
 i=maud_spierings@hotmail.com; s=20241110; h=from:subject:message-id;
 bh=IsotGGeS1hNHslMt3hu9mke2nzQXlgG9kOU5FgNZHkA=;
 b=7HyBJc9C5ACP1cDu8GhGgm91hamcZCsDBMMQXxeaRdJcZz4C/BeenyWQ3lTMAHtdKpjWp1YnG
 7TeOpBcZb3TAPonv2fPXlooRkw8uQ/7gpZ8tC9S5lJY+l15zdD9Ko/G
X-Developer-Key: i=maud_spierings@hotmail.com; a=ed25519;
 pk=CeFKVnZvRfX2QjB1DpdiAe2N+MEjwLEB9Yhx/OAcxRc=
X-Endpoint-Received: by B4 Relay for maud_spierings@hotmail.com/20241110
 with auth_id=273
X-Original-From: Maud Spierings <maud_spierings@hotmail.com>
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
Reply-To: maud_spierings@hotmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Maud Spierings <maud_spierings@hotmail.com>

The Samsung ATNA56AC03 panel is an AMOLED eDP panel.
It is similar to the ATNA33xc20 except it is larger
and has a different resolution.

Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
---
 Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml b/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
index 032f783eefc4508df35da10e53ca20ff8b1b9bdf..684c2896d2387077cf2d91cc5a025e0838c0f536 100644
--- a/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
+++ b/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
@@ -23,6 +23,8 @@ properties:
               - samsung,atna45af01
               # Samsung 14.5" 3K (2944x1840 pixels) eDP AMOLED panel
               - samsung,atna45dc02
+              # Samsung 15.6" 3K (2880x1620 pixels) eDP AMOLED panel
+              - samsung,atna56ac03
           - const: samsung,atna33xc20
 
   enable-gpios: true

-- 
2.47.0


