Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C998A9C7E
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 16:17:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41497113CD8;
	Thu, 18 Apr 2024 14:17:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="PoxE8Ljl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91BC010E994
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 14:17:24 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-418c0d83e61so9981055e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 07:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713449843; x=1714054643;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ILqnL0OktQ/LIYsgUIgYWy5kPsb7wTxeiRyz6t2wdXc=;
 b=PoxE8LjlpTUxm2dyM9fsJTvvkE44b0LC6P0yQnuabasiaUGerTMOJ4vN8ZeDEVhzxu
 BuiWy8m/WeoDBJTMx0Ojs+oDePYSOwDWKvXzFUOz5rHxKZ+oVuZcwcTZjwtQkcfHhoIW
 vMB2WIWKMOjDwOJynLuUErXwQMXHp4A67tqEjeKA7HWjfyuiRk+pA0+MRjdV2yRMXDvl
 o7X3QydNqKZCrJ4yWWaecwhSbz4Pcto+vncgloy0ioP0UPutJ0f7t4scmuMABSSScQ9S
 H/AVIkKPNkEhwo9ZO3yx/hrXOUf79JWEdHzC8pYdhM4hKRNPZMf+J80yC2U9ut+NiH8R
 c20Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713449843; x=1714054643;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ILqnL0OktQ/LIYsgUIgYWy5kPsb7wTxeiRyz6t2wdXc=;
 b=NjXSxmOnhYlLdnvL1JE/St3prw/lxdExB+v/yph58V1GnU7jV/ZWAbDwhRbLZ3iZUk
 ni0J9a1NcLkVFzf0ga5nCk9AmRiQSAJ+/bX9QIjGJFHABCG+HZBZkjpY1n84NprWRqCp
 FU91h2M0hj7EV76+8hCg9Fk6knREwc4lvh0oPyWF0LJRnE4KQLSrkSR4bs7b9Z4sBSFO
 Y0DjwOSldElvevPbJNKdcMdxeFJHVeLOTQpIRi4XsOZcnD0wEl+8RUiZxB42Oe6TUYE9
 m44xtsrSC8CqeZ9xjCOU6++/wDK62hrkC9VssJ8BDCohLLOZE/LYbQa+2R8ftLg02Zp7
 NPKg==
X-Gm-Message-State: AOJu0YyyVNqfxvMXixhuFkds5c9eUhfGi/5I1ZfVIlX0HHLN7s2BIHVg
 uP9nRwqkYQGRdO4UPb9unK8g+7Ti7tE29K/l+zLVXM4KG1GxDkqm9thYGW1E8Wc=
X-Google-Smtp-Source: AGHT+IHyKsYwGwO7ULrRiYYwF8ZW2m1ZUJ2Z3L1zSIq/n7fTc7G0u2ITdvLEMVBKLfBuIWSClRaN8w==
X-Received: by 2002:a05:600c:3587:b0:418:f8d3:ba12 with SMTP id
 p7-20020a05600c358700b00418f8d3ba12mr520839wmq.15.1713449842833; 
 Thu, 18 Apr 2024 07:17:22 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 i9-20020a05600c354900b004180c6a26b4sm6267510wmq.1.2024.04.18.07.17.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Apr 2024 07:17:22 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 18 Apr 2024 16:16:56 +0200
Subject: [PATCH v3 08/17] dt-bindings: display: mediatek: gamma: add
 compatible for MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v3-8-53388f3ed34b@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1035; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=BKhifuqO0sy71Nu4A1KSbxN+I1Z+YvJLs6VRSUaEjAA=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmIStiATNoA7GzsswL1g6KqC0AIwEpZuwbB80csMVY
 gEaBTUWJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZiErYgAKCRArRkmdfjHURRBkEA
 CzoHzDB7d/jXZ68yDDI7WwNkPP1vmd/ZGPXUEBmqiWP8vu6+XmRUK4YlwIjiYpcA3XxgUMLfaT8ZJp
 ag3s8rhIZU/DVNJJMMwGjqdwUyrNrVI+Gv6mZCS71CIaFfDd4qeL+jxOURPhZzEeK+z9ltzMSJbSHJ
 YeKfqPR5ezXo3g0UeVztuVZryzFfIAgc8d6zEKDaCraxvokkqOAmtAFGqDDmmHNGxEkZ4b7OkiICVg
 UpAkyoMi+8uWBDe28vgRid4Aq78DGXXTN1zQfMSrzNbmN++duumQ8WjAU1SvO7YLtWT7h18YP+h6gT
 pdQoYT8KVT9q5sxc8cS6SBTl74cYwbaDc108PlBb5ijKyQMLraCp9Q9vKOY49C4/oYdSATieUfzwMj
 ocgWt1F2nM9d5S+SdOd5PPomDk1NLP2eEHvbnbvpl0zzE1P4oHHgUcOigHc8+Ur38jrON38ebeVALo
 h3HC44zC0tzmrMCGlAvT0ue5k22adRXynT5aaBbO2+Dv1FodPuoKaNyhA1m7b0GEZGlJMGPOtp+nvz
 zhxoctdBZmiH9+jkulsDpepNJRiH6PpixE1y9uGxi1ZmcMKD3k6uQY7HIIfKCsWxFG4KGmeJKiSAuG
 uDuDZgG73dCYhnwzYhSyatIpQ/BZzkXGVm2oC4EV86ZgXoZIz661a7QOCrmw==
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

Document the display Gamma on MT8365, which is compatible
with that of the MT8183.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
index c6641acd75d6..f447f4320e8b 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
@@ -34,6 +34,7 @@ properties:
               - mediatek,mt8188-disp-gamma
               - mediatek,mt8192-disp-gamma
               - mediatek,mt8195-disp-gamma
+              - mediatek,mt8365-disp-gamma
           - const: mediatek,mt8183-disp-gamma
 
   reg:

-- 
2.25.1

