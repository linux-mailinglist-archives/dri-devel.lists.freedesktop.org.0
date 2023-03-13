Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC056B7058
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 08:51:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E06810E487;
	Mon, 13 Mar 2023 07:51:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-3.mta1.migadu.com (out-3.mta1.migadu.com
 [IPv6:2001:41d0:203:375::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B68010E486
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 07:51:26 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1678693883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4bM/miEHmfh1REV7eAHhfkIxbroazqqDxZ8/EmkFI7I=;
 b=XfvqJsF5NveKr8F37DSYZEJokzSo6yGxFVO9ABOTJa3alnb0lPz9GejfU7oo8PglgWg6XL
 nLyFnUWk7sFmEf37e49ZPa9bjgVT0Hoy9getvi4YbvCP/r+5i46moRB4INZuJtPN5dfSYK
 yQT0Gg57/W2gnrtB2SXtOqMkudq57lY=
From: richard.leitner@linux.dev
Date: Mon, 13 Mar 2023 08:50:16 +0100
Subject: [PATCH RESEND v2 1/2] dt-bindings: display: simple: add support
 for InnoLux G070ACE-L01
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230201-innolux-g070ace-v2-1-2371e251dd40@skidata.com>
References: <20230201-innolux-g070ace-v2-0-2371e251dd40@skidata.com>
In-Reply-To: <20230201-innolux-g070ace-v2-0-2371e251dd40@skidata.com>
To: Thierry Reding <thierry.reding@gmail.com>, 
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1068;
 i=richard.leitner@skidata.com; h=from:subject:message-id;
 bh=CF2Os/PqFVko/kPoZIdexl6NDlxf1JFkoXB+pjYQTD4=;
 b=owGbwMvMwCX2R2KahkXN7wuMp9WSGFL4rv7Uq57fZOxUcZHB/1cOU8Tqqm3Razans015565pvXfi
 vFu3O0pZGMS4GGTFFFnsjbna3XPL3lcq6uTCzGFlAhnCwMUpABPJsmT4zXbdlskiRmdpyLkVtZw3jj
 s0OxYk3J6hP+XAhFJWIV7xHoa/YjbaD2dEuFkrXDWJWd19sGWV24RLb7/MCX3mbrL0sXgmBwA=
X-Developer-Key: i=richard.leitner@skidata.com; a=openpgp;
 fpr=3F330A87476D76EF79212C6DFC189628387CFBD0
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Richard Leitner <richard.leitner@skidata.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Richard Leitner <richard.leitner@skidata.com>

Add Innolux G070ACE-L01 7" WVGA (800x480) TFT LCD panel compatible
string.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 Documentation/devicetree/bindings/display/panel/panel-simple.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 18241f4051d2..fd3e5ad769dc 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -174,6 +174,8 @@ properties:
       - innolux,at043tn24
         # Innolux AT070TN92 7.0" WQVGA TFT LCD panel
       - innolux,at070tn92
+        # Innolux G070ACE-L01 7" WVGA (800x480) TFT LCD panel
+      - innolux,g070ace-l01
         # Innolux G070Y2-L01 7" WVGA (800x480) TFT LCD panel
       - innolux,g070y2-l01
         # Innolux G070Y2-T02 7" WVGA (800x480) TFT LCD TTL panel

-- 
2.39.2

