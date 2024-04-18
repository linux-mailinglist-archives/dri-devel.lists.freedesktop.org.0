Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E67E88A9C7F
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 16:17:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10DB0113CD9;
	Thu, 18 Apr 2024 14:17:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="pRBf2Qmz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4ED010E994
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 14:17:27 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-418ee2fcd6dso3682065e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 07:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713449846; x=1714054646;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Xyh9I+7RDjmoXx6ibmqfU5YmUk8cuDqOZ30bQAqDPzU=;
 b=pRBf2QmzqGagqPRwL37HQMVPJlzCUOtcOAalBIHg4yPE1/nK68IHdIL9QH6WVJPqFM
 r3OlgHRrrw7oE1YduiT3VZQznnhuXhnr5XNrecZuhP3UPHClVIwV1HqmDXEo2nTLKX5M
 fVoxt4jeIwKjKzWnzH4fT59qbUj0ulLx724f5MMGgTGSsZhhSgndGuLJf3S153XhGXgH
 wf/6KAyOn6+m4Vu+3a/bAmBtKhqUYAj0TaG3YtNce7jWmqDmu9g3xf8odpSOm+UJianh
 kiOv2lCoXRr61qPLSJp3IBvKNi5G8cJC/b19eLVRjlpTztfBIL4aNuXefFMBFLCJN2nu
 d7ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713449846; x=1714054646;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Xyh9I+7RDjmoXx6ibmqfU5YmUk8cuDqOZ30bQAqDPzU=;
 b=YyUStF7T+qjfVTyYVKAhJwYNF24slIdO+YRsuKJ8D0SrUoC4gCAK/Ug0URIsqTeo6e
 bmcHPQm+DXH3RWjoB+LjNCr8X76bGkxUZWW4bWlQWhnaHfiu9RDfdPJtFCR5LZJ4m647
 rdvT2b0rq/AL+YZYZPlUwi1hGQhHMYNjVhL34x6srs4zn1IKnIoo+7MHrs0SPG062/9F
 nQEA0CV1X6XI723Gki1E6j8c0PwR/eKtvgHnSfNJj6PzCsmSVGWExjm6OiP1lB6qMBQD
 r/wu1zbicAXU4czhMarrTv+Zb8uezlubGYPHXM9XHAvm3M4uTDwePRN9uWvOMDi3/dDr
 5unw==
X-Gm-Message-State: AOJu0Yzpd9xe+Oh/j0iIJy4ZMBWEI5cRVrI5Ai1iMyl7UMIr8HgTDg4T
 TJOCafEWY2sYbZe9qbtFDRmJ/QLC0X1EI+93iLQeS6ikD75X3vuP5sv0gg93arQ=
X-Google-Smtp-Source: AGHT+IEToY2RaHfp8/SGhr+SzxRU5xE6X46yItp1fzn/NmRrntSYP3f0mFM/gMKeI8XS0GnztZrbrg==
X-Received: by 2002:a05:600c:3d92:b0:418:bdee:d58 with SMTP id
 bi18-20020a05600c3d9200b00418bdee0d58mr2125448wmb.12.1713449846274; 
 Thu, 18 Apr 2024 07:17:26 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 i9-20020a05600c354900b004180c6a26b4sm6267510wmq.1.2024.04.18.07.17.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Apr 2024 07:17:25 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 18 Apr 2024 16:16:58 +0200
Subject: [PATCH v3 10/17] dt-bindings: display: mediatek: rdma: add
 compatible for MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v3-10-53388f3ed34b@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1014; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=FZE4p38am23Wbba4sdDEsuVyWoBZbiLCeYBCcNU5TdA=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmIStjb/g6WWWPTVLJUfpwBGujfY5yXZ146n2j/DZr
 MvPY23uJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZiErYwAKCRArRkmdfjHUReRND/
 9YQd5KWvjqnnV42cCyJN+vg12K+UwcFK9Rqo+3q0ESv9jvSgt8Dsv4UtzVW1uX+WisefO/wnHatJF7
 zmq/rIHOBgG0QUE3W48x/w7n7grwQbevcTrp3Ob+WdR6huTGfLIZNJtaYPzRfQrwJ29iPZS4+vFjyS
 EehxV87xYf4zKrcZzqIv/MiJL4YE4DgHyb50p9iRHfHqk3ckmNP5DYih9BCPMg0M9F0aEFmnHvIHV/
 J0VHAwMNctlR15SuKaxx603N5YhNwSGake9NtRGU9yR+EhVwZd3ekYKWH3hpQKcNoWCOw3zDz9xLd3
 uxggMjXj3E98lG6sfnVMGyQBqd+FWL6oGD1+Q5A47BQmaDQ+UCmZzKhTr8PPAyIUoyizJgXlreYXfU
 BAzAHe8Oiri/BtY4WAiGk6E++oY5VRR9Q1itentGNWiFJcrRqwjE52EVRbQ50WglmkFQ6If24plmxX
 5ndkqBsorM0ZOh6Qwado9dAe8FPWQtCux2D23eajIOzbqWp9EqP1k9/JNVUKkwOAtNX9jf8HMyBWBj
 VqAhCrYJfqblrISh0Q+iWgRKeKXGTFpBpneWVrfGqwMO4k1M0vWqi+Zu7aRoiAr60qf5cLKBPDH09+
 SBTNBjmjJBIRW8CV4F9gOKqoPW0hgoaz8D/jPji/HoRoudHa1889JQqqCOmw==
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

Document the display Data Path Read DMA on MT8365, which is compatible
with that of the MT8183.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
index 39dbb5c8bcf8..4cadb245d028 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
@@ -45,6 +45,7 @@ properties:
           - enum:
               - mediatek,mt8186-disp-rdma
               - mediatek,mt8192-disp-rdma
+              - mediatek,mt8365-disp-rdma
           - const: mediatek,mt8183-disp-rdma
 
   reg:

-- 
2.25.1

