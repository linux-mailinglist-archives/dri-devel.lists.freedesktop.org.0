Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0CABD18B5
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 07:56:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 407C210E37E;
	Mon, 13 Oct 2025 05:56:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="b3HoC8KM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E75610E379
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 05:56:21 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-b457d93c155so615541866b.1
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Oct 2025 22:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760334980; x=1760939780; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0+a5/f/Fx6IMBMc0auLZUB4h0ES81R10KOuZfrxfUU8=;
 b=b3HoC8KMP7EeQw8OmKOUnGQ+1uzl44kFYcfuPGFx3hozwD9daeIUj5x1RFNbrhGhI5
 f6RZiOs/Trf5Z6HR8SdT2UJ1io5zS140MaHcKd2K8rHn8ZHa3CGavBhlKmnTsy/4RJJu
 EXUuvsIKU8X+K6c16dIMxR5nha6y4tV7rW2aj8LSWk33PYVTxPL/dkp4A7mQKwY6MBDf
 05fYwGQR1NhcAyM0cGxU75tEv3aDig4/WFOgKF+WL6/D6KH1HwZ6/yhnmeUkeBnhfog1
 TcAmjamOA5wwCOU/C+puV72K6DVzO8w/uMXzezED1en9U4cpVVcy+h2DE5qw5kgUVtn7
 iLmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760334980; x=1760939780;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0+a5/f/Fx6IMBMc0auLZUB4h0ES81R10KOuZfrxfUU8=;
 b=VbJ+VBvtReKMgYbwm5P3iTm+Pun197FlOuqADWB2jtLpW1Pw+jmaGSxsr6D1U+WJ7T
 xGT//MtfQRWQEO7NVH5ogiWi5jlK4NG9aSQTpNo+jFxfBcXXqj8c9U/vuQd5otQgBxn9
 3QyBaLGREFn9VIwXgMD9Pm1ZIDYP6IGhQZ/EB+jLx2P+vgFTRA8QAxMzrYAp+f5wi9op
 FSikmIpps0JDlbRI68vJve1MxoyjWH42tWwnv1p4c5C4mRk4r+BMeZxDGmoynUEA3s6r
 8sKnlCDf3Bk22mt4X1thVbf9B2t2cDlaOZnC+nOYGIqBLjXCYNTe6ELnZP+BoNlL2Ijb
 LSbA==
X-Gm-Message-State: AOJu0Yxn5DCIshnX/2pUZ7MA7OfTPY5lK2JMdz5QI2SS17QWhS/ytr2D
 e2a++Kb8SkhLon3HqnWQoKrCLOc1lJRxVizdGMfxUniFOB2KbtG+Cqop
X-Gm-Gg: ASbGnctv6uBDYlyQEaPZKUIWz5o8PdKTGDDjXViZZApwrg3DsWb8oYvRIVe3VEHYSdM
 D6wNBy/8S/spNNEiANvf0ydu+blw0t4q/jAs3g6pxhp9fHYUzLDM4EA6PP7vghg5Ec/KjKPbpNi
 M4rueY3PuVD0j2JdVGGSSM2wXCQALTZr3rQQjYuTvjmC0mZ3PTO8r/vMkCjzbdLG8QP5oeNmB5U
 8EALMuvty1bwMw59NbLaAG7w9gkKPZta30aNBbLWIZOUD9cNbszoDeW+E/U2ZAmKu4etY6X4koZ
 JKCQc4s1Xw4VBUMDXLIUXeBjCb1VZ4vHFHVHuGpBQNhDwLB4Nkl/HzVMmMELIue0rtaMNdqBiTG
 WboydOisUhMD77v50SE9YD1sd5KDmSEinAfvR2Uav97w=
X-Google-Smtp-Source: AGHT+IHn6OVFq3+AsRTRv8Xh/omMJt1RsmRRGjDow+0vFNYsqUIkRvU051xfXIY6tzcAIT30syi1jA==
X-Received: by 2002:a17:906:c113:b0:b29:e717:f0b0 with SMTP id
 a640c23a62f3a-b50ac4d3497mr2144906166b.59.1760334979537; 
 Sun, 12 Oct 2025 22:56:19 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b55d63c9a3csm860912566b.23.2025.10.12.22.56.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Oct 2025 22:56:19 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Douglas Anderson <dianders@chromium.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v3 6/7] dt-bindings: display: panel: document Samsung
 LTL106HL02 MIPI DSI panel
Date: Mon, 13 Oct 2025 08:55:41 +0300
Message-ID: <20251013055543.43185-7-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251013055543.43185-1-clamor95@gmail.com>
References: <20251013055543.43185-1-clamor95@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Samsung LTL106HL02 is a simple DSI which requires only a power supply and
an optional reset gpio.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/display/panel/panel-simple-dsi.yaml     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
index f9f1e76a810c..01ac0af0e299 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
@@ -52,6 +52,8 @@ properties:
       - panasonic,vvx10f004b00
         # Panasonic 10" WUXGA TFT LCD panel
       - panasonic,vvx10f034n00
+        # Samsung ltl106hl02 10.6" Full HD TFT LCD panel
+      - samsung,ltl106hl02-001
         # Samsung s6e3fa7 1080x2220 based AMS559NK06 AMOLED panel
       - samsung,s6e3fa7-ams559nk06
         # Samsung s6e3fc2x01 1080x2340 AMOLED panel
-- 
2.48.1

