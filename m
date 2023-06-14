Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E26BC731133
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 09:47:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B13110E17D;
	Thu, 15 Jun 2023 07:46:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68BD410E165
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jun 2023 19:09:04 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3f8d0e814dfso9354045e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jun 2023 12:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686769742; x=1689361742;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=JT6Z31XAHARj6r8X3TIPRAVf58b/OWvZZzUE5BznjHg=;
 b=gTzZep0N8oZ10jqQuBazaO0RxgQ4fGM9RR2h9Phld70KcT2mFR2cnLbdgMqScg8sBL
 3jMYkb8566phWczTsYRfnzfNxUT2R6VjXkjin4M4pLmU0AVNRQRM/vtTmvQa8cR3B1vY
 3qegnkVWljI7Ltunbik/Ch/48zAdVkDn8AWiYWbMH836isLN44BOgxbHVdiZAQ6SkqAu
 bCIRyIKEn/K/n8l89Myt5fgbn5I9b8NkNczJZ1D2q5ZZzAf82ZbKmfnApqSQpFv0o/Nk
 eDrdy/kUVixCC20dwLJeKRqsp35Hch2aeSMOHro9Kou/5UtdS7TSkhf4zqfNVOolH/Ha
 3ZoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686769742; x=1689361742;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JT6Z31XAHARj6r8X3TIPRAVf58b/OWvZZzUE5BznjHg=;
 b=VU2XA4BEVEY7rt3trbGsWhShUQHqvlVQ+eeOXUzw0UKM1HFDz2PmQWUVxTpsHUh23o
 zlSCo0b2qpPX7Ha95d523IuXENJGnvyLJ0PiEfMSp6+cN7GV5iyzL9JeOurzY/fSn+00
 Aed6y5OPF5i7J8ruJVNLMioWICWhyyF6ZKaxXnVNEBIUpGiel3Ac4+/ZFtddNqyr4ixA
 9W8Ce4SfKhk2DNXqdpChEGwO5ZG74kzqZkWu7tNsDhAyDkFY44eFKTHlpRIcq9ejGBQp
 vKK812YNHmwQ+ym7oUGAtbDbcvYBobE6aXr96axHEGhrndi71gIZxQD03CxrasfR6vuP
 /2Jg==
X-Gm-Message-State: AC+VfDxoiaI/brZyLBlrTcN9KOS/UAHWNPbj0+7+/MeAAv4gxTwsOTv+
 fKKvs36VnRqhYcNd3Yzb5po=
X-Google-Smtp-Source: ACHHUZ4FHa3Ekp7twbhYSZ1B+qSHxIRwzxrV2Oa4FpAIjwYwusJWuhQOVC7BOmRWCf2/QwABBhnpCw==
X-Received: by 2002:a05:600c:218:b0:3f7:f584:5793 with SMTP id
 24-20020a05600c021800b003f7f5845793mr10767493wmi.1.1686769742314; 
 Wed, 14 Jun 2023 12:09:02 -0700 (PDT)
Received: from [127.0.1.1]
 (2001-4dd6-393b-ff-f59e-4402-63f8-7ff5.ipv6dyn.netcologne.de.
 [2001:4dd6:393b:ff:f59e:4402:63f8:7ff5])
 by smtp.gmail.com with ESMTPSA id
 e6-20020a5d5306000000b003110ab70a4fsm2341094wrv.83.2023.06.14.12.09.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jun 2023 12:09:01 -0700 (PDT)
From: Maximilian Weigand <mweigand2017@gmail.com>
Date: Wed, 14 Jun 2023 21:08:53 +0200
Subject: [PATCH 2/3] dt-bindings: backlight: lm3630a: add entries to
 control boost frequency
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230602-lm3630a_boost_frequency-v1-2-076472036d1a@mweigand.net>
References: <20230602-lm3630a_boost_frequency-v1-0-076472036d1a@mweigand.net>
In-Reply-To: <20230602-lm3630a_boost_frequency-v1-0-076472036d1a@mweigand.net>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>, 
 Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1686769738; l=1362;
 i=mweigand@mweigand.net; s=20230601; h=from:subject:message-id;
 bh=vFi9JmX30p4FXzLB94ZKuKFYw2IqIvaq5iK+mmgK7cc=;
 b=tZelMqP5s9rTtVj5AIX03Sswiymmj2/HSNVLOJ2ccIO1XsQuYVsGFigH8Y/GaLBYubBTsAXMq
 9sYwPTIhVH6DSu/5SpeGl25ralV0tuvaapXJhddWIR3appAYaVkjXHW
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

Add 'ti,boost_use_1mhz' to switch between 500 kHz and 1 MHz boost
converter switching frequency, and add 'ti,boost_frequency_shift' to
activate a frequency shift to 560 kHz or 1.12 MHz, respectively.

Signed-off-by: Maximilian Weigand <mweigand@mweigand.net>
---
 .../bindings/leds/backlight/lm3630a-backlight.yaml           | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml
index 3c9b4054ed9a..ef7ea0ad2d25 100644
--- a/Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml
+++ b/Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml
@@ -33,6 +33,18 @@ properties:
     description: GPIO to use to enable/disable the backlight (HWEN pin).
     maxItems: 1
 
+  ti,boost_use_1mhz:
+    description: |
+      If present, change the boost converter switching frequency from the
+      default 500 kHz to 1 MHz. Refer to data sheet for hardware requirements.
+    type: boolean
+
+  ti,boost_frequency_shift:
+    description: |
+      If present, change boost converter switching frequency from 500 kHz to
+      560 kHz or from 1 Mhz to 1.12 Mhz, respectively.
+    type: boolean
+
 required:
   - compatible
   - reg

-- 
2.39.2

