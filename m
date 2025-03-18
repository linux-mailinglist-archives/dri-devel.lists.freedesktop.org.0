Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72ACFA66D7D
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 09:10:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6F8410E44C;
	Tue, 18 Mar 2025 08:10:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="kmvMKdA/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BE1B10E449
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 08:10:18 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id 13FF5582554
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 07:58:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3148F44539;
 Tue, 18 Mar 2025 07:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1742284731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AiSuKsR+xQ+tI63uSyVHlaQ0SQ3FNe4GMa6crmOM510=;
 b=kmvMKdA/cLpCaxBbEN4mLe6QIe0wTZjj3zr01h40QMIiNH1es5fATFBEb7HT5NvhSinMTq
 9KTnfwIISeGHU+BSnATp9U/wJif7v+VJbe6u105h5fb0q62I8nnIfqB4ppIvA/5uWlErNL
 vzoph4t+VOqz3LwSLFePT0Y/A9ydM9aHZJI2W5xXf6Wb5HcBDv6AKupGQeSRFOdCMBVF+M
 8DyhQtLCtJ77JnaO1N5wMnoDgNsC/vU+I4adJgxuMzQwB70WhakT+AtvcB0s9qml9Jwum1
 nmpNwOaju+Qk9Ugqmr4i/qFPwtPh2vgiJyy4BpmMsx693QvBB6m168chTfsyCQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 18 Mar 2025 08:58:28 +0100
Subject: [PATCH 1/2] dt-bindings: display: simple: Add NLT NL13676BC25-03F
 panel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250318-b4-add-nlt-nl13676bc25-03f-v1-1-67e0f8cf2e6f@bootlin.com>
References: <20250318-b4-add-nlt-nl13676bc25-03f-v1-0-67e0f8cf2e6f@bootlin.com>
In-Reply-To: <20250318-b4-add-nlt-nl13676bc25-03f-v1-0-67e0f8cf2e6f@bootlin.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1029;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=Vz8+P48bcNn9gWrsjf1ZjKPYHDM2ym6S6tQO3SUDfzE=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn2Se5F1Yf5WNw0q7ymsodPkYlQoQt3PE0ZHXIo
 ird2AKJNxeJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ9knuQAKCRDRgEFAKaOo
 NqoOD/9yqpD31nORryFmXIllq9dqzJNhW0Ztq46TD4OIKGM7jZ3emqBVKh/+Cd55h+b1kiQV4hH
 B5Xa7BAgXvy3c9l0+GOf6guZBF6GUxF79+CuCHsm1r+4/MlzBu9oRwIw8TZBLd3BfmYNV0MyH9/
 rKHEV3iJ6z6G0qmaH+FdJ6cEi70JybI14Pt3Ke6n1RWlu0U3E/eR/197f9+KCvBFhh4dncVYgUZ
 PLThdU9NCQ5nnI667pBNlB0JjemgpTQrZJ8mupd26U3R2etEPF3pHgHDLDWw6H7Xj89QDTgbZ3X
 BI8DJF24wNH1ECsejnLFz3SmF9LMsxgmPvHKQD2WIaGo4Tjhbft1XZtsFoSVt79YVNpSrKrb127
 b/MVhMO/OyGyggSCKaiYpE4SdZIWfuOoic+w+ewpY/s/Ptj1Lhnuz5ynC9oNu7wTCNBJoFq3OdJ
 316ySHLD84Gv0VTswXm4HH8RjN+VurVOX5kdjdGKK5JFpjhNmyIlHiVxCFOY+0jr5UKHidwStL1
 EX/6x7ie1a87XXB0v/JKhJVSIln7esZldAzROmzR5bhzRENl76TR/QpYpqno85xaADZLUoJOCsI
 5M2hhR5GZm3S6DaUKsLxz/crvnAMtNwYdQEMKAW31i8mMid2Lm3ttbbocTxiiUQytiB2vRM1fJ6
 gsJ5ziMYFWvecnQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugedukeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefhveeileeitdeufeefvdegueeijeeigfeujeffgfevgeefleduveffieeggeeifeenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudejpdhrtghpthhtohepqhhuihgtpghjvghsshiihhgrnhesqhhuihgtihhntgdrtghomhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheprghnthhonhhinhdrghhouggrr
 hgusegsohhothhlihhnrdgtohhmpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
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

Add NLT NL13676BC25-03F 15.6" LCD-TFT LVDS panel compatible string.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index e3ee3a332bb7..60d93f18f63d 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -224,6 +224,8 @@ properties:
       - netron-dy,e231732
         # Newhaven Display International 480 x 272 TFT LCD panel
       - newhaven,nhd-4.3-480272ef-atxl
+        # NLT Technologies, Ltd. 15.6" WXGA (1366×768) LVDS TFT LCD panel
+      - nlt,nl13676bc25-03f
         # New Vision Display 7.0" 800 RGB x 480 TFT LCD panel
       - nvd,9128
         # OKAYA Electric America, Inc. RS800480T-7X0GP 7" WVGA LCD panel

-- 
2.47.0

