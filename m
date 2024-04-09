Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB03F89DAC2
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 15:43:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A1A6112DBB;
	Tue,  9 Apr 2024 13:43:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="EKOzkNJe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEA1E112519
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 13:42:20 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-343d6b55c42so3867458f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Apr 2024 06:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712670139; x=1713274939;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Y0Ft7gJMIMDuyFaMl73MCWCL0VnoY8SMUukXDjxNKP4=;
 b=EKOzkNJevbFlLy5QNVFvTaw9JMRRAOZHt3ib2QvuKPuuV5v1tsd04JaR+4Nnl6AQfv
 sTt1dwQhVDSgLw0uOBbZuJ+yTrvOQQrbWzE5OcdIE4JRefhbw7BGYaP92fQ1V/OljqJ3
 0Ia+7oPALR7yYY7kPgrxzOy+sqEw0lr6HEq8nc6Tk8BN26jnSNC0HGCkFq44Whur3iea
 FVy3x7cvAjzJpG6Xqylwrs1hKrmmS+x0XA7/VpoPhf7HZgkF01li6s2jl6ejstkkqt+u
 83VWnrb4m05GXuNjVJV44V4eTGA3SRXS0lR/FIV9jtnnvZ198G+ODogvdUKLQdzZr37l
 coQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712670139; x=1713274939;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y0Ft7gJMIMDuyFaMl73MCWCL0VnoY8SMUukXDjxNKP4=;
 b=e/4efnkes7Tuv24V2DEpItgKyOHxRXPXfGTGwMOeav26xZ8uh+MJMNDa5jo0wpZLzv
 9hpGq3oFA5Fn1bN/hryB7QcqywZkjEjDJnN7+XWXZtDpVkzst4Nv8nyJfJUKGWaD3Bge
 aQnII1n6JLnZ9RJ9ugX4SlumPtPhBARoFdTFjp8pkm+9Bk4y0NzO3K66PbF1KKQBm6ca
 egB4FAionQlSOZSOrf68r8CTKPEU91/xlybiJXHrqoP7BigkZpOw8qoe2julR0ZGR9+j
 R51JfQ7huQdxI5pBeQdN3yKXka7keKZaumGByzCrKwN8FDNLqLZCFljISfA8DIt7AViP
 dy0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6iQiVbFTbedITiYlFolyENrV1kP1WUKS3qeJ4RLBbqcpZc5YZI4tYSaR/ojh9gXrB/sbWywRb/8ElMhFJpWuJT2ZwldsWE6aisLj8AKFh
X-Gm-Message-State: AOJu0Yzg5/CuwqKKo4Y96V1V4MFdXsX6eRRa5LNg0ZYzd7aC+uzGa4GB
 2Db4LWKar0RXsCPcNTaOOzG28FZ3AxTrnJIDz4h8vbY2oU4L52toJbz/RHXl2Lc=
X-Google-Smtp-Source: AGHT+IEO0wu4NhRlj59yyEV3/AmudxVPjh9KDi9m6m9X4AWTWkIq0osDU5hnpCv1QD3F0qnVyktM/g==
X-Received: by 2002:adf:f9cc:0:b0:343:7653:ad14 with SMTP id
 w12-20020adff9cc000000b003437653ad14mr10377159wrr.30.1712670138963; 
 Tue, 09 Apr 2024 06:42:18 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 j11-20020adff54b000000b003433bf6651dsm10753579wrp.75.2024.04.09.06.42.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Apr 2024 06:42:11 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 09 Apr 2024 15:42:02 +0200
Subject: [PATCH v3 04/18] dt-bindings: mfd: mediatek: Add codec property
 for MT6357 PMIC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v3-4-16bb2c974c55@baylibre.com>
References: <20240226-audio-i350-v3-0-16bb2c974c55@baylibre.com>
In-Reply-To: <20240226-audio-i350-v3-0-16bb2c974c55@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lee Jones <lee@kernel.org>, Flora Fu <flora.fu@mediatek.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Rob Herring <robh@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=911; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=m2WMimLT+3s6slBofqVAvaqLkWzrgGp85vJbqpzM2J8=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmFUWsRoFsr/DA4OKUp6SCQXm0l4J9aRtbh8NLZQ8P
 JwTHbUuJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZhVFrAAKCRArRkmdfjHURUZvD/
 9L7gHOb1wNabYP63KJqzi8jizhVvuiuiQPEK7NZvxd0C+wEsOeuTHX+nF/MU9Qk5SOGCdoDILbVkyV
 4sblV6X1GDcBf2s2btcFIy8kOPJjSimOkcZn+ZYQsMPb6BpIup9mqH/F+gpjYZrvO10y2JVZcUb+iY
 iY5X7ialXOkPq1Psb76YIbdWNdDmyPgMLX60Jmi92DsdYPPordwZc5ml8/9c8rU37ewaz5GZSqv/ip
 4TTbrVMtWICYnQwgWRoyHlvLPFRYsxVA0dvkGbxwe11XtbVDYTml02QQ8yQOIzMmoEULYbAZTi7ELH
 UQfSW3e0kY+bZ/CoEYdKyWK6xHRP4Dic4Hjsj7EPcqh+LlydBoS+ukyjMpjB7qIn6O9Z57aYe37Lki
 R470tUPlZ6vtTMXaoAruJ0maHXUYk1K+QBMoV7sQkjst/VBoIAKaVZo4QAXurGxilT5VgUQBI/xeSp
 KUKC8GPJnaFwhR1c33hM2N14+7kWxQK0ZF9/23TrbmamSFzS8SUK1tYDMc23f2uy78M2OIbxyq6VIM
 AmbD8c7JeDXYfnj8+LP5d32wzMc5Ve9D+n4DDglS773s3Cnw/7a3h3aiRcUxc3V/qGjiGwimgfn5r1
 iMGWksRTViZID1Tl4JLT7t+kohfXrKPal994r21FwQbGJh28dkUA/Lnp4S3Q==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
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

Add the audio codec sub-device. This sub-device is used to set required
and optional voltage properties between the codec and the board.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
index 37423c2e0fdf..7c6a4a587b5f 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
@@ -37,6 +37,11 @@ properties:
   "#interrupt-cells":
     const: 2
 
+  codec:
+    type: object
+    $ref: /schemas/sound/mt6357.yaml
+    unevaluatedProperties: false
+
   regulators:
     type: object
     $ref: /schemas/regulator/mediatek,mt6357-regulator.yaml

-- 
2.25.1

