Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C9680B989
	for <lists+dri-devel@lfdr.de>; Sun, 10 Dec 2023 08:05:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9734210E1CF;
	Sun, 10 Dec 2023 07:05:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 518 seconds by postgrey-1.36 at gabe;
 Sun, 10 Dec 2023 07:05:08 UTC
Received: from out-176.mta0.migadu.com (out-176.mta0.migadu.com
 [91.218.175.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA4FF10E1CF
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Dec 2023 07:05:08 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
 t=1702191462;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zOhqdYWDEkXw+cnirf/0QTPE/RR3olrML2FGwqCl6DI=;
 b=xR/Lm4MBKNDvGsDp+1yFXKb+hSPP29pn1FF54w0ZRda85et7srEeS2J1Q7pPJUKsNAsagj
 +BXJBo9Q+CkebiwCiO3LKSlYE0hXqXsRNSgVSytR2KFNYJoG76GoiieAwm5M0/3mSZEK2I
 L+7L63mx6mIzGAovZ9WX2EydTW1SrHtwLtqXdQmUfkoMe0noCbd0g6T3VEml9rs8o11Mbc
 TtvULDSEblLzmHW1sh/iUs13KG5aQ3mZXf6pMyUgqJAMa6JaUraehmZJ2edksG9yN0eibJ
 6umXGArmqfXT4Ue4E6/WITgqndTjyRswaqnjazefDg/PSM4gu0ixuz/SZ+XIEg==
From: John Watts <contact@jookia.org>
Date: Sun, 10 Dec 2023 17:55:53 +1100
Subject: [PATCH RFC v5 5/7] dt-bindings: display: panel: Clean up
 leadtek,ltk035c5444t properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231210-fs035vg158-v5-5-d75adc75571f@jookia.org>
References: <20231210-fs035vg158-v5-0-d75adc75571f@jookia.org>
In-Reply-To: <20231210-fs035vg158-v5-0-d75adc75571f@jookia.org>
To: dri-devel@lists.freedesktop.org
X-Migadu-Flow: FLOW_OUT
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, John Watts <contact@jookia.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 Christophe Branchereau <cbranchereau@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>, Rob Herring <robh+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove common properties listed in common yaml files.
Add required properties needed to describe the panel.

Signed-off-by: John Watts <contact@jookia.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/display/panel/leadtek,ltk035c5444t.yaml   | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/leadtek,ltk035c5444t.yaml b/Documentation/devicetree/bindings/display/panel/leadtek,ltk035c5444t.yaml
index ebdca5f5a001..7a55961e1a3d 100644
--- a/Documentation/devicetree/bindings/display/panel/leadtek,ltk035c5444t.yaml
+++ b/Documentation/devicetree/bindings/display/panel/leadtek,ltk035c5444t.yaml
@@ -18,16 +18,12 @@ properties:
   compatible:
     const: leadtek,ltk035c5444t
 
-  backlight: true
-  port: true
-  power-supply: true
-  reg: true
-  reset-gpios: true
-
   spi-3wire: true
 
 required:
   - compatible
+  - reg
+  - port
   - power-supply
   - reset-gpios
 

-- 
2.43.0

