Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B2E7D39C0
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 16:41:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E18D510E1FC;
	Mon, 23 Oct 2023 14:41:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9160E10E1F6
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 14:40:30 +0000 (UTC)
Received: by mail-qk1-x72f.google.com with SMTP id
 af79cd13be357-778a108ae49so332334885a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 07:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698072029; x=1698676829;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=oxTXywbu9otyoHiH2LyJKtB0YMAbr6Ld4vLKRXgmSv0=;
 b=egqcMuORLMYHmI9H7fLfEa+MwPPm4Y/uoHr+ykt9jHTk2LQwCZbz8m8vBKeaffAJTm
 LUn1LCsYaFUEjWwEOb1jgW/TxMQ+DvAY3IyOQx+Jqu5oxISbgCh60gLmXJW2gddKbtTh
 LQQkYwydNo27qSpNEnxYSCEK+7AGQbd8XVkBjJ2e9S8wZBshaHMGVfDJ22RhKzvxb/rC
 T/PYsH8isHuflJLcHy/pA7JywbGUK6yhy7oLRZDERNneA2d0gSwFKXNStDFOPxtmblpt
 Sbmjb4ZQfz0/Vp8eQ7OQIuEKe6Jw1f1aJ9v/Rlo9EkdsXEV+wLSSS6XtVOmuVUqZoUJB
 zEBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698072029; x=1698676829;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oxTXywbu9otyoHiH2LyJKtB0YMAbr6Ld4vLKRXgmSv0=;
 b=Xr5eenNLPLHJZc/zw7wJUwebp5Q/xOMnrzLf0l49qTM1Rz2+cNrkIRGYmsVg11fjj5
 piXhUbNvf4Mgy96QCMNrMseCzIfLpBD0I78MyhFQ2LycFY8OFZQK6efmnwkJgXRWs9s7
 7OHUKfv1VAnT09Cl90/mx7itn5NPM10IFvYloR98Tw6UxLsdJfEnRLzvQU1a08dquj4Y
 WFFN4xCk2TDPjrenTZWpC4IudD7Io76MolBbsN21a8TR+QCB0iZcztqLCl9h8aPRpoN1
 VOqG06YlMhXLuM42Yu62LlYCqIkzDyHl+ValiiuFZvrHaFBtNYe+0CowZeMSc9VSEAL7
 PMGw==
X-Gm-Message-State: AOJu0YzExBSE8ymklWQz3/y29FocnSyXvyGwCxmAfDfOLCO7nqnyEYIH
 Vqfm4V4NI1iPwI8qaMsp/riRxw==
X-Google-Smtp-Source: AGHT+IEgDRtfc3NNADXRb/ZlUHXnY2jqVnmdnhhEIJ55dIpMP6Yd7xxuXciomAvhvv7MbNCOmoiiqg==
X-Received: by 2002:a05:620a:25d2:b0:774:2470:6797 with SMTP id
 y18-20020a05620a25d200b0077424706797mr12666017qko.21.1698072029091; 
 Mon, 23 Oct 2023 07:40:29 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 f1-20020a05620a408100b007789a3499casm2725020qko.115.2023.10.23.07.40.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 07:40:28 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 23 Oct 2023 16:40:03 +0200
Subject: [PATCH 03/18] dt-bindings: display: mediatek: color: add binding
 for MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v1-3-5c860ed5c33b@baylibre.com>
References: <20231023-display-support-v1-0-5c860ed5c33b@baylibre.com>
In-Reply-To: <20231023-display-support-v1-0-5c860ed5c33b@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, Xinlei Lee <xinlei.lee@mediatek.com>, 
 CK Hu <ck.hu@mediatek.com>, Thierry Reding <thierry.reding@gmail.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=942; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=YU1e5sIok1+NbWY+6HobM33V2no6aYQT7i5d9DqejUU=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBlNoXOX/azDl+ertxlsp4unLNJxzKKT9zEjAR6PtwW
 hAs1qQmJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZTaFzgAKCRArRkmdfjHURRc1EA
 CyDaIaIfkyDDyAVVQwiAwHwJfYWVP8v6IFzEHshzqijzeYNEzhU5kywjLlaKyoNWzwS5QwYGw4ydP0
 rGGtLrS0sTHSrcZk5hPSOItdc3deukZxSxsBNw2L6QidCWnsCRMwK3R6wWpajt2AKap0WgUZXz8H2V
 XQ7YFHDkgZAEbK/ydrb0ywq4K/agzoHG190lbBvBUm4LHMTLWbA3zf0lermqAUExlOrVuT4c7k1ive
 SuJelX66K7WkPjqZj/WsxOUSrxhid8P6q2DoHoZC9cU4oaN8JqwnZzUtI0kVhggWylulFlyCiIyQ4S
 Uq13CkltChuXB7zrdWTYNZ3oKXWfUtf09TYzn+aD4KEszGS4CCBkx/Kx1PEurAZEWDOcECD8+ru40w
 rQG+Vh1XazpuQ/v4ItapdZssXcsXx9gGuFfps/Ag8tZhLHBtlKQS2YkmckrhVefSbXhkRwgbvMAJS1
 6DNHYYjAKvEqeTTsV3ECPQCeYrO6w2b8WxCc3gVkkLNdavoY+d3Fq90pgpV+XxIyul6+1/aNJDhn9o
 nEpRrs9plK+W/0nyUwkrWlbVBppj2gon9XQm+rRZ9iiz47Srd4Io3ZVSnBOh1ebM3iqcBG8Xd+Lb3z
 GCialIyQYoWGFpw0U96qCACTy26PC2yItVewLkUg/dDXskEGrmlymiViqVng==
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
Cc: devicetree@vger.kernel.org, linux-pwm@vger.kernel.org,
 Alexandre Mergnat <amergnat@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Display Color for MT8365 is compatible with another SoC.
Then, add MT8365 binding along with MT8183 SoC.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
index f21e44092043..fbf15242af52 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
@@ -39,6 +39,7 @@ properties:
               - mediatek,mt8188-disp-color
               - mediatek,mt8192-disp-color
               - mediatek,mt8195-disp-color
+              - mediatek,mt8365-disp-color
           - const: mediatek,mt8173-disp-color
   reg:
     maxItems: 1

-- 
2.25.1

