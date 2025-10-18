Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBACBECFF4
	for <lists+dri-devel@lfdr.de>; Sat, 18 Oct 2025 15:02:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A39F10E1E6;
	Sat, 18 Oct 2025 13:02:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="azNoBMwz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="YuwkxWBi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A127510E1E6
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Oct 2025 13:02:15 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cphft12WMz9sd7;
 Sat, 18 Oct 2025 15:02:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760792534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h3qGVfK2SD/LkkPK6FoWnj+YJVjMv068rDYD19OUT+E=;
 b=azNoBMwzDYu7YN3k2fzHDQECdIcyHRn1mcQ1dycC/bGPFw5P05ux39ntTX5TQHMikSkFah
 /vJKgnkiGYB7JNODQvYInPlSZYSLt87QOUYxCsStZDyyBc864rS/ZIBvoOh5jlqUn8s2ir
 XSn2VLSq8aighuR84NTb+5eLSNDoYMSC98CW/LcXT1rbqaozXij6jTpS/4ozMFfpwO2jAo
 3gIM3+cnsyAMfYxdN9Ddz1iQcaB83twqcBu8ggTxT4ijdQ4hpUJF8XSk0ICTTJZWKX78Ut
 f1iQrI0xEuQQXDaxCF8NZ0yI/bjfqAvDSnqj8wT8qFm5n8AvFHxQcNcwCEQ/Ig==
Authentication-Results: outgoing_mbo_mout;
 dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=YuwkxWBi;
 spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org
 designates 2001:67c:2050:b231:465::102 as permitted sender)
 smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760792532;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h3qGVfK2SD/LkkPK6FoWnj+YJVjMv068rDYD19OUT+E=;
 b=YuwkxWBiRhkh8yRcvWWEHupD2fZ2TeXeldsxk9WeMX+VcsQhw2EVjvMsZEUyPlnVTRFCsn
 yiYDbEJUaPIHNboCJSiGEzZ2UHbQVFNh3psjYCsROa26oPCdnCneeEDtyXykU9EjxL65BE
 2mIrCojKIJcSzIP2VJwihxJBV3tRNakRZPrf8Okgyx4r5zUWw8KFB+Fj/XtPoZqHEn1HAI
 f1kgooxj1LESFXoOmbjpUbBU0jFEaaLW4XYuECDa1KLhcxusxZpe5g180I1Bg+UwHFwkRn
 hM+zbCd7GxmSxKJNQYjj47jefN1JGhTdUSxlX7fZBW34FXNWmjlO4fVBwTRuXw==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Adam Ford <aford173@gmail.com>, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>, Frank Binns <frank.binns@imgtec.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Matt Coster <matt.coster@imgtec.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/2] dt-bindings: gpu: img,
 powervr-rogue: Rework the allOf section
Date: Sat, 18 Oct 2025 15:00:59 +0200
Message-ID: <20251018130147.12831-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251018130147.12831-1-marek.vasut+renesas@mailbox.org>
References: <20251018130147.12831-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 8auxodwaynckaux3p717ss91np4c8kp5
X-MBO-RS-ID: 6f19813b49d4405774b
X-Rspamd-Queue-Id: 4cphft12WMz9sd7
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

Rework the current allOf: section such that all handling of
clocks/clock-names properties happens first, and all handling
of power-domains/power-domain-names happens second.

This allows the allOf section to limit various GPU models to
matching clocks count in the first half, and apply the same
for power-domains count in the second half, without conflating
the two limits together.

This makes addition of GPU models with different clocks and
power-domains count easier. No functional change intended.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Adam Ford <aford173@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Frank Binns <frank.binns@imgtec.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Matt Coster <matt.coster@imgtec.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
---
 .../bindings/gpu/img,powervr-rogue.yaml       | 40 +++++++++++--------
 1 file changed, 24 insertions(+), 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
index bee4ab1a1f805..829febd8e0f40 100644
--- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
+++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
@@ -86,16 +86,13 @@ allOf:
       properties:
         compatible:
           contains:
-            const: img,img-axe-1-16m
+            enum:
+              - ti,am62-gpu
+              - ti,j721s2-gpu
     then:
       properties:
-        power-domains:
-          maxItems: 1
-        power-domain-names:
+        clocks:
           maxItems: 1
-      required:
-        - power-domains
-        - power-domain-names
 
   - if:
       properties:
@@ -108,13 +105,21 @@ allOf:
           minItems: 3
         clock-names:
           minItems: 3
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: img,img-axe-1-16m
+    then:
+      properties:
         power-domains:
-          items:
-            - description: The single, unified power domain for the GPU on the
-                TH1520 SoC, integrating all internal IP power domains.
-        power-domain-names: false
+          maxItems: 1
+        power-domain-names:
+          maxItems: 1
       required:
         - power-domains
+        - power-domain-names
 
   - if:
       properties:
@@ -135,13 +140,16 @@ allOf:
       properties:
         compatible:
           contains:
-            enum:
-              - ti,am62-gpu
-              - ti,j721s2-gpu
+            const: thead,th1520-gpu
     then:
       properties:
-        clocks:
-          maxItems: 1
+        power-domains:
+          items:
+            - description: The single, unified power domain for the GPU on the
+                TH1520 SoC, integrating all internal IP power domains.
+        power-domain-names: false
+      required:
+        - power-domains
 
 examples:
   - |
-- 
2.51.0

