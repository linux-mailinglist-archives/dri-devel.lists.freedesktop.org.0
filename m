Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A16AB8A704A
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 17:53:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0236610F6AC;
	Tue, 16 Apr 2024 15:53:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ynnIKoO2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86AF210F197
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 15:53:32 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-56e1baf0380so5325215a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 08:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713282811; x=1713887611;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=xlsoknBYQWG63sDwAb9jwt3WWTGlyxEUyggNRmjx7kM=;
 b=ynnIKoO2V3vFdkiux3PoIEfKzOBOYqn0Jy9GibidVBAU5DoC7gzRmiSttE1PuGWGeT
 Qh6KncUSa6llDpez8JzFApD8Lz8/uQeKRHtvqpGbzCvtVCC0eI319w6MWLE+lIgG9p5F
 o/G3eMD4aDGA5JAEcbVS0xDGvJQbtbYzc8FGcjcT1JhcivxZVS2hm4h0HMnrad0Xg+j2
 zIfydEzLvM5Xd41vQUuFCHLEVgGPNN7poiLx6xfm52WdrUWW0lmk0CPSOxq18ZIejrh2
 lC55p6gHROx79ddKGanKXeM93mt5WswORc2LF707FhWFz1xqQa1wBW1t3B4Nz0/sdnq6
 nMLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713282811; x=1713887611;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xlsoknBYQWG63sDwAb9jwt3WWTGlyxEUyggNRmjx7kM=;
 b=ZQhD07C3DmFBG1qjdsBrWQ+XKg/rzc9M/7F1EOxV13w9fMjsdQgsln17CLdSYfMekt
 7ovUXYS530xyKyp2BJrnSpd39Y25QqvcP6SfT3o1aGL7L3gcnO4mnReCXNSVozzQs7z8
 2w1QK4wdRCSA4IDu4MR8SwYaxwIhQW5HPzv5oDTJh2yCGpfo0NvVpIxdbJ8bES74akwb
 WI8g7TD5PpZvnY3+FPfK9BUKu+h+lBbcjcyBv8peCoRmIRnJtOy+qIuuipoqPAZPCFzS
 REfO7GuRhkhBZBPwamp01SWTqTXC2bJTBNZldCk5gr55G/XMV6dvIHkpnXDJJj3yr60K
 yFEA==
X-Gm-Message-State: AOJu0YxenKdNhPOlHi8yg2Xz3E8ETCMTspA5P5HnqDFaZDGiePEl+OGu
 Mz50EpnwpvkleSFoZXunLtLJIq2GW0KgJTWrvh+sQKaYIVdSwjygLqCGv1WncCU=
X-Google-Smtp-Source: AGHT+IGA5RRSl4A2IXLKdqCC8v2L1AFQuGr2B9Nnr9Br1rPnc/6ECo2w8uyg7/0Z75xZ472LbU6zfw==
X-Received: by 2002:a17:906:2a4e:b0:a51:dbf7:688d with SMTP id
 k14-20020a1709062a4e00b00a51dbf7688dmr7549912eje.74.1713282810826; 
 Tue, 16 Apr 2024 08:53:30 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 d12-20020a170906174c00b00a52567ca1b6sm4156691eje.94.2024.04.16.08.53.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Apr 2024 08:53:30 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 16 Apr 2024 17:53:09 +0200
Subject: [PATCH v2 08/18] dt-bindings: display: mediatek: gamma: add
 compatible for MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v2-8-33ce8864b227@baylibre.com>
References: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
In-Reply-To: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, 
 linux-clk@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=905; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=epD3N8w0jJEyk09IJE2WmrV9SFTYkbtEoVXZX4ZLDLc=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmHp7qh6M0l8VmBY7ocshqa+6uo7JC8yIk9Ue62Bd+
 y9gsJDOJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZh6e6gAKCRArRkmdfjHURSvSD/
 9PZbD63pq4febDhJFNmCj5B5acPQcLv/gCpAp99s2w9KioIW5GWsqXyPuedu/n4e9uCLdiI/IdAGOH
 ovoqBfzKu9Z2lsHBui/NWLvGxBECzLrVenhmmcvOnZw8FXpsqSMCtx1SXCMph6PZZybI8i/wyfsz1C
 L1Zt7Esgqaj2as95mbOj4VdcEk4wxFtGCsWDSgp8+4XXfwg0TnQrg2iMMFPFFlqNNaV60lhSLtirF0
 XaEXhJ9ssDgoo9eHyiErFwDQnIvP/xn1I+tf4sREFMd+UFyDy//PwPdJLC9zVIqm55z8l4hRahw7D4
 HrQe0QfgkFOfxloqambBH/8I4C3mw04e4bti5mA8rr8LGqJLxPbvJwvnRseF6RSuKyu/dIMCPsdgPO
 0CV7eN7iylz5KWgxt8mCOpA9BC/19D5H4e/FKJK912tjOAuO5WEYrf4ByzIemd2v7jsufUiE5+hWOi
 62db6yvM/RL7Vzb89SkhZLAUJSdID2Q6c2qxIr70Kam/JJ8XScBVTW1kuNP/tokRnRFmv1vcg9GANe
 oC6Q5z7XR5YLhVIZpeltJ3/hPoxhIImza+apacZf2LXGd0OrCIEF+f2YjY6VI6vULEULXkAT1UBW39
 mxRsafZLI2HQjJvJvKtAczF7AWLoTEeSYF0JlQfyRYqHpuftGEOUMmFLP/Mg==
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

