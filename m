Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 726B98A9C7D
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 16:17:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2124E113CD7;
	Thu, 18 Apr 2024 14:17:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="JXHBtsc3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1097B10E994
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 14:17:26 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-418dc00a31dso7535085e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 07:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713449844; x=1714054644;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=GDKYuiqKi2lKHFjV6hEj5ZeFkUw2j/++ERAAAvYfJ+0=;
 b=JXHBtsc3Nx7QauaI7gp8SV0887sNadfv0wZYLJchKD9bbG/lOfdjphdwdBYu43GiH7
 RHQvtJLjZAVZNAKzlVUr/A9rjj8utDelhvCwVjNqYY5qDIe89j60qMJRxJvYQfYB3seH
 Sz/vVWHxkAU012sRrEgRMxIOVgBqk2YvLiV6IL1jcxcxoYcrtiCKx7o1uTC996DacbPp
 LcmpZMBVyp3womRInp2B4pntGwXnXOjtTjBBkAe/Tdr3vdB21m8tt1gwnDML5Sh4Y7Uz
 uk4wEgwQbPxcwhuD29y1MJPjaZwBHEQhwSu+w2zzevs/B0ifRl2ToZWTI0jlyqKgKZu6
 ZZEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713449844; x=1714054644;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GDKYuiqKi2lKHFjV6hEj5ZeFkUw2j/++ERAAAvYfJ+0=;
 b=Z8nYIkB8Macl8mtsYDWth1KvVHan+rcfUD6BR8h/v7vMPDwn8onUcr9jFYPWVh4kNP
 fSuP95jiT/IjrVngkNWILjTRYIFSspsci0bmeW+avYBSMI703f8v0TLuqlrnbem6FKWX
 Xp2OUcrHg9nHeXotbnwshhJOH8oiXbPVfdTu74/wTZBFMU43Hs0t5qur3SWkk2FXgNzM
 fdbSR/6QctqtY7c/wZJcAXDJ6VPtP9A0RfRDfPJe2MkPGh69tDfLigLo7bBsd7XS7dfw
 2njIrBDHmFvNNqAxZBz7wCfZJkIs4kd1GN9r5Bgpy8ybVt/zO2ga6ER5dDzQJpTLvcKU
 CzNg==
X-Gm-Message-State: AOJu0Ywpfi022i8mUe8oxjuCtbF/M4OXhjYChGg7ZK3b5Hhm/e+N3pQl
 coYihzNnHUs3mEpv/ht57/3sMu86HPK0vuLAmdDOPWb2Ao+XTRKryycg/rGcjQw=
X-Google-Smtp-Source: AGHT+IFZpHUd3KKJqTG8Fspa5WV+CGK6XUr6/zHywZgyWssPB2EZ3Ze0JTvaDZBJmIElV5Y3Uwlkxw==
X-Received: by 2002:a05:600c:3555:b0:418:f400:4af1 with SMTP id
 i21-20020a05600c355500b00418f4004af1mr763350wmq.38.1713449844499; 
 Thu, 18 Apr 2024 07:17:24 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 i9-20020a05600c354900b004180c6a26b4sm6267510wmq.1.2024.04.18.07.17.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Apr 2024 07:17:24 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 18 Apr 2024 16:16:57 +0200
Subject: [PATCH v3 09/17] dt-bindings: display: mediatek: ovl: add
 compatible for MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v3-9-53388f3ed34b@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=968; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=muTuIXTt3JZ+adeVzSiBV0lvPUUpPPEXnWM8MyjFIfI=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmIStje16i3Wmletd3SAhUG1Wug6cEanDayKjSNnvt
 7/PVI9SJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZiErYwAKCRArRkmdfjHURfoOD/
 9gj3zgWQpv4BHx8KjNy8JDlZ0g1G2rz8wn3r/LiH75+rS9z1En5UetLdAjaERRHZRZFnApgNefHFvm
 MDqQyGfUNJk8+/K61L1TliZKKv4e7NyIbin/nzyCU2ZvScW9eQxofpZTZO0SUHHLr6cJB9HmxfXjvq
 7EZukXjZ9rKSr7fyJEqe3yx+illLUJF/RSIQoYIU5LhqZYFAPY4JfzmCJIgePfDpRJseUCthCgPsvX
 7mFUINNRHx/ngBxT+lcn1n6DlCXSPEeDu+9iRU1p6tvedD1g4zkXuUIIX93hAyG3bNF+OkBZRXdcLa
 W8FtyrgbSrU3nJ8MwP9OvtHimV9XIJxNY98EmkrY/TvIBasg8Hn/8qDhYKBkjvlZl8PtcgbIIhSoL1
 oby07eKpk1xgzf8eYmyXTdOEZumXcxUvmo8Jnq0Zl44wARwmuXFwGwq0sB3BRaCFkAckSiMAlG2lfL
 cjqdMhKJyn8pTYNVlo+Cvls51wlCIvir1CdnwzQxlv+19DIxt49XPXFUqzto64HtBCleLlVYJElILG
 pXA/MBvVLLFjgWV2X1yGSMU5yKcfqCOxKSgyn5RsRHQkTYFAZTuvQ4AEocDh7tppX/ZrjKKjWCqaeA
 IIzKhwiqMfM6d9/X+qZpbWPzvVA5mUeGTrZihTQmAFz1xemNVViMYtiXHzlA==
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

Document the display Overlay on MT8365, which is compatible
with that of the MT8192.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
index c471a181d125..d55611c7ce5e 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
@@ -44,6 +44,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt8186-disp-ovl
+              - mediatek,mt8365-disp-ovl
           - const: mediatek,mt8192-disp-ovl
 
   reg:

-- 
2.25.1

