Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2058A9C78
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 16:17:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FEE4113CD4;
	Thu, 18 Apr 2024 14:17:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="UuI5GkmW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EFA7113CCF
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 14:17:19 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2db17e8767cso15175211fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 07:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713449837; x=1714054637;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=rlVm2DUZvHbif6Pq4uHc3DKM1FD6wia0Q9c386ZrYoc=;
 b=UuI5GkmWPLdvvcSCDkxE35quZoA12amYBjGKMOVMQioqP3TLaLccXYGK6Je9xBP3qQ
 Yh2jdqjQ+DK56HbLVC4rgHGyqZG2dfmUiEiQAA7wk1HhhXfGZP+0sjSTUboVpx56ar8i
 922M6VOXWKPY9LK+sOrLrdeATMIjPJpFDj+H2MdTlp0tQd9c8lKH2F0I5nA6/+nOy1k1
 QexfplX+2yBjn0TEzQZ5jvKPpdWhEVfvtfayqSOo3cC4J0pPwjR7nQCZHlycvL+to3cu
 +yDN3d52oQuVUi76FcMP9PC9nji3ZloJVd6p5M3ws+59l52nmsyXsA+XD7OG3bjVFcxD
 LkqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713449837; x=1714054637;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rlVm2DUZvHbif6Pq4uHc3DKM1FD6wia0Q9c386ZrYoc=;
 b=E82GJb3qAR97LjRQnwCJHClwEmF04MKmABW6jVhIl2NEMV1eQ7L7TzUpr2xdGmPxpL
 QtvSf3RJ6D5/8L99ASQDY0Vqhq7b0ipu86k30opcvEbh4sR621tUxfTjExJqj82loYRZ
 ild9lXevlkI+iNx+hkFaEUXrrJ62rn8NCgwDQyPEV8RJpUOUwFOXihsRpg0l5kLn3FLI
 cMTM1gaoTPNNhMGhXADHRApaB5lCvEORrTGmf8IqMYyVM4fkrV02bnGLw69qNXs/YoQJ
 5wHrUONnrr5Ja2ihqjhhqXhOEh50ll83+Y902G9t1EYevdmb7KEjg5vvQRB1wqWsqHsi
 QjBQ==
X-Gm-Message-State: AOJu0Yxq782N2ipVney6OoTP3UCtwZdcFZJTSPp9ZmnUwgCDAuldv7xN
 LpTs1/U5T++MInmuLwCY0dXzR6522iP/Zf6WSE+4L/vDkvH98ei0vddriZUCu7g=
X-Google-Smtp-Source: AGHT+IG29OVR9aeDUGbdzj3TNRPQowmj8/BArbOQQhnLP5iP4zpyAQRi7xFLgRXdY6/+8+QulNMbAg==
X-Received: by 2002:a2e:9113:0:b0:2d8:6104:f95a with SMTP id
 m19-20020a2e9113000000b002d86104f95amr1707719ljg.23.1713449837718; 
 Thu, 18 Apr 2024 07:17:17 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 i9-20020a05600c354900b004180c6a26b4sm6267510wmq.1.2024.04.18.07.17.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Apr 2024 07:17:17 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 18 Apr 2024 16:16:53 +0200
Subject: [PATCH v3 05/17] dt-bindings: display: mediatek: dsi: add
 compatible for MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v3-5-53388f3ed34b@baylibre.com>
References: <20231023-display-support-v3-0-53388f3ed34b@baylibre.com>
In-Reply-To: <20231023-display-support-v3-0-53388f3ed34b@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Fabien Parent <fparent@baylibre.com>, 
 Markus Schneider-Pargmann <msp@baylibre.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, 
 linux-clk@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=962; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=VLBa/QW0VMhizu6I6UwEaoKrZbEmjO1DzaRZBpi+k9Q=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmIStiG3vDJ5hjSI1S9skJevxMqAzoslZvCwRiUMz/
 ha/l3HWJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZiErYgAKCRArRkmdfjHURbkQEA
 CrkzpBaKFv+sfRSX59WBpP/1SWDq7+EFOlk0CU1eVD0GSGXscbwRNrFZRQAmDsmEVPUVagzfH+pZnP
 ct3eaGmNSH2L+rCfXHCXfun2BJLq6DgTzwIVnhSA14kkSYc7pSA7x9pUqR7BRcRNTz9UZzaNEYdJ4k
 WbsDMt6LUdGx32iQCqFRPCjkOaJoMUa6jbDy5vXIFnAkti0QnVqaZAmHjydLRprruQ5NstgXTvWo+3
 ctdOcjOG/lwznUGT0OBjckvGKmi3XWTGh4Hc9cU95o5r1uSG1prY6QOAGN6pkjUfFm9GuDfdUkLv4h
 aerO9tB6wmEVRrCdJIBXRZqDDQKe/KlD9sBSjk2zKdblfkWHGef4ApvCCTKiaQoP+xmPjBx4VVz5vG
 YdnZ6zhxYg5E77TslY4/T0cDmmwqZxJ4RBFdzJKdJX1qi6Z/mDGbRrzXt1ROOjizpwdZ3QnhH5M+D8
 cSRVBkMcy2hmxjqs5xl31iFUOB4nVYZBTMtEO3CCsMTOxbGmxkYQfV1OcjPKF2icCpoiOWs3daI00m
 avkKjpD9lXLsMN/TAR1lKIaQtUhKUQycCSgZQohawoKjnV1A7TN1pscogLIT+IO5jV/p6dJyT5dUiS
 Cx+kAgmwbMv6CiXzug0cZiI8hMCrTYdkZbThFbKrZlq2JpkGwNU47/bQpP4Q==
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

Document the Display Serial Interface on MT8365, which is compatible
with that of the MT8183.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
index 8611319bed2e..a7aa8fcb0dd1 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
@@ -37,6 +37,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt8195-dsi
+              - mediatek,mt8365-dsi
           - const: mediatek,mt8183-dsi
 
   reg:

-- 
2.25.1

