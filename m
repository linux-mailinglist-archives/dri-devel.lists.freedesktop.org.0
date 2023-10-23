Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6EDA7D39A7
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 16:41:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E151810E090;
	Mon, 23 Oct 2023 14:41:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11D1B10E1ED
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 14:40:54 +0000 (UTC)
Received: by mail-qk1-x731.google.com with SMTP id
 af79cd13be357-778711ee748so267587085a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 07:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698072053; x=1698676853;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=CS7+tyIUs9rfVOlSsQt+PukwNB/K7NB7wUW73q4tlEs=;
 b=LBgiQnIUZBxGtD0F5qLeawnCjNDdQ5I0ad5Aarn5vQnpNrCeBimGsAUpCH19Q8H6xe
 O+8m3gLAlhN9QMS2ICK3eNMpyrCJXyRZUEan5QeFpXyYhib5XPnaPjtqQ7mR7tCmgMVQ
 OIRdp4/fHPPsTnIhhw8RwbEaq5gTZoPrpwVbx3+hIComk9rYi9uOixRFnznk0wbAYicZ
 4Fbvvqj796S5SQPb2xRbDut7XqhcyFnTk5sivwOnvLnLknDCW9vU16NZvqw8zLJrGNeQ
 HSDcI76bjgw4b5vLU4eQL1p5sxbKPpLm30nvwbmoFtz0fTrj0IxaqSEAUYnqBS05oOj2
 bPYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698072053; x=1698676853;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CS7+tyIUs9rfVOlSsQt+PukwNB/K7NB7wUW73q4tlEs=;
 b=ZeWEvgS/dQ78+4iv88olPbjM+z7tST5Tric/2MOd/07LU/I/hPF2whVMxPWvK/NtFe
 C5AjeiXNt37V+vIk7Z417cxwbV5WMcCUDrUV3PnlLWuh0f72ZYkznmK+dZW2NelqLDTX
 Yw9+w57JjunBgkYKfrf335PndUMihM92CDztcvI8Ww0Iu6y2HSd9SPb2Lh6+7GDP9PkP
 blQNnxlYm9xkJ0GViQ8mYwEFQ2KfLAahcbes5bIKIkRWdnF4r4P02s8fC0QoN49dtb2V
 Ewshr2at0X+foN/hegUwupnbkWd4KG1tmB9ysG/8g6UCNvU6T1oFbdWzlPjwcUDzphY0
 DbYA==
X-Gm-Message-State: AOJu0Yw74j7eWLwZvQi1TbjTGLCgiH0xAwwsxVtp7bxkKVRWDntMKpUQ
 f3LpkLe1jSk0RwKgvGQS+4IM9rzxIRz1JU/iM7V0DA==
X-Google-Smtp-Source: AGHT+IEvoOYM4IjzQAb2DwZjFpHa6AfgFG/jeaxPD3Y8glmdNz/IF1lkLRc91XrRLdKpqXSeUPXi+w==
X-Received: by 2002:a05:620a:c4f:b0:775:687f:4c2b with SMTP id
 u15-20020a05620a0c4f00b00775687f4c2bmr10463449qki.44.1698072053532; 
 Mon, 23 Oct 2023 07:40:53 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 f1-20020a05620a408100b007789a3499casm2725020qko.115.2023.10.23.07.40.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 07:40:53 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 23 Oct 2023 16:40:10 +0200
Subject: [PATCH 10/18] dt-bindings: display: mediatek: rdma: add binding
 for MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v1-10-5c860ed5c33b@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=906; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=JdRv1/SmSo/E5fP2RWWWzxwGKldluGDuZKeVPiQK0pQ=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBlNoXPSxJ3NhBHAKqvJAyKpooI3Iy3NY5MCOPzNpgw
 m7QS6s+JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZTaFzwAKCRArRkmdfjHURSPAEA
 CBHQlY624f0VJRltvATnFGmjv22cWRywnPXucDp/TEpmb0jC0gsoFqnxgzsOLXejQsq4OSA91OHScS
 29zmAuA00ddrwvCJYH9yBOfo4yiCAaBzucnvMXmOx/etDsUZ9OCAmtzQBsMokpK9LJtKb2UpIqbx2K
 nhlPBCa20wL06o1wbNRiK0EKbiAn7bougYHXdXXoiq8lzADg02mQKneQU+FyZ+vXCSedF3N6ciaA2L
 mlCiGR34sx0+LYduMKroR0FzoFe20wiZiphLziI7qjIyP6mFssUXfcouZnEyUO7pivdOAZRjA4ns+C
 W0L2ZERj7YswDoENOrxebw3heXOVEZWoCU27S+PyIrO/v87mRjLF/QlKQX6EKkbOHAZeL619gS7CST
 VTccb+HoMWt+EU2hQfWm1NmZxzCU27HJVGlDmk0Vp8z8wX2maCXxNmRQ1wdFidRbsgxGiweTVOE5D3
 eyKBxQ2ZKykMWFafl8th3J0U2IaVT0aNNa2xp2/avLOvC+0aVVlgCmFHpZierzyrO2j5KIfo6PM8AW
 johWF/+kOjLPdM6SXScvILReKIrun7Y3xka+Msd4ckpalB/sJUTOym3TeXoVDT+8OGnh37ys8R/oVC
 KcJyWNeiJqeotDGEL0WE0eFDygyQCZYg6+6DFW0ZouePIP3e5d7Z1QK9+KqA==
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

Display Data Path Read DMA for MT8365 is compatible with another SoC.
Then, add MT8365 binding along with MT8183 SoC.

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

