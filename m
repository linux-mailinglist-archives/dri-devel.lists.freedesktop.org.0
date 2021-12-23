Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD8447ED2E
	for <lists+dri-devel@lfdr.de>; Fri, 24 Dec 2021 09:29:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BF4910E41E;
	Fri, 24 Dec 2021 08:29:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 455 seconds by postgrey-1.36 at gabe;
 Thu, 23 Dec 2021 12:32:28 UTC
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org
 [IPv6:2001:67c:2050::465:202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D03C510E147
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Dec 2021 12:32:28 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:4:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4JKTsd40GjzQkrd;
 Thu, 23 Dec 2021 13:24:53 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1640262291;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HjwPJdMHf6u0MIrRtPJF8DBrqHmz6TRzLG2dXdc93sM=;
 b=VIRqxw5NCm/6nLSgAIfG//81M4itzChAV8Sv1WpiS+KS374a+kyNMDA0CxNU9IvDGYGB3W
 YdAKSvZubvbXAZnEPbq5txMBlM+jXdTv24wVI464K9zbQ6+u1udEckpameyQBT8cNVqcvm
 154CnVv34pJU94Osy0uGHP2+qxDZKOzd8Y5XGfyDgV70VfPQxBYBPlwzuu8pN0YsPbqTuI
 KxFp0EdVKD78yIDiYqVKcPAYp6aLciTJQfVtuSha2ALVE3gZLqjgUvVX35EF4zAwqAHwWh
 edkKXT5aknAHxVO+b8GnvH6tjrx0DS4WBQfy4u0Rcx6zZJR2Jbt/sCEGrAQf/w==
From: Alexander Stein <alexander.stein@mailbox.org>
To: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 2/3] ASoC: dt-bindings: spdif-dit: add missing
 sound-name-prefix property
Date: Thu, 23 Dec 2021 13:24:33 +0100
Message-Id: <20211223122434.39378-3-alexander.stein@mailbox.org>
In-Reply-To: <20211223122434.39378-1-alexander.stein@mailbox.org>
References: <20211223122434.39378-1-alexander.stein@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 24 Dec 2021 08:28:15 +0000
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
Cc: Alexander Stein <alexander.stein@mailbox.org>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is used in meson-axg, meson-g12 and meson-gx. Add the property to
the binding.
This fixes the dtschema warning:
audio-codec-0: 'sound-name-prefix' does not match any of the
regexes: 'pinctrl-[0-9]+'

Signed-off-by: Alexander Stein <alexander.stein@mailbox.org>
---
 Documentation/devicetree/bindings/sound/linux,spdif-dit.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/linux,spdif-dit.yaml b/Documentation/devicetree/bindings/sound/linux,spdif-dit.yaml
index c6b070e1d014..a4f9257e313d 100644
--- a/Documentation/devicetree/bindings/sound/linux,spdif-dit.yaml
+++ b/Documentation/devicetree/bindings/sound/linux,spdif-dit.yaml
@@ -9,6 +9,9 @@ title: Dummy SPDIF Transmitter Device Tree Bindings
 maintainers:
   - Mark Brown <broonie@kernel.org>
 
+allOf:
+  - $ref: name-prefix.yaml#
+
 properties:
   compatible:
     const: linux,spdif-dit
@@ -16,6 +19,8 @@ properties:
   "#sound-dai-cells":
     const: 0
 
+  sound-name-prefix: true
+
 required:
   - "#sound-dai-cells"
   - compatible
-- 
2.34.1

