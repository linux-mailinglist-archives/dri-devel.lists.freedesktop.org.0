Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBCBBA98A2
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 16:25:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D8F010E435;
	Mon, 29 Sep 2025 14:25:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jm6vFvPA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB52C10E433
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 14:25:27 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-362acd22c78so46370731fa.2
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 07:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759155926; x=1759760726; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/sJS/3auvarpuuSF9ICFMHK8CoOId00igm+ctuXL+w4=;
 b=jm6vFvPA2Gff0hV88pgC85913khTSvqxSFM/QXDhTNxl0kCs0cDP682qNkf1GxrbxV
 imWB82pOC6oMTV4yWLlN3RRFSSSMAuDD+D1/qdcrkMCi9Eh7R588qO0ssjy4LxX8FxHb
 SzfqRiZf6JMlooa7/VIccQYUpH762iMFpSuILaJgZrz/wWoGFzprNkS9pVkWBHjvMQlR
 Dw2Q9bfxrzmKf2+CjXKsuxxrS0KrT3RkQ8K2eAJHb8W6kXeObI9pYktG5xy6TT8qYN+n
 97YtUCWDB+nuGJBNAFLypmV2Y0GsCRiau15H64/EPxVQzq3Sp/HOQJoo9MHYilTcJYTB
 oFlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759155926; x=1759760726;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/sJS/3auvarpuuSF9ICFMHK8CoOId00igm+ctuXL+w4=;
 b=bnL0H8DykQQaAtPWeNMMB8ZiQVoNLtNWU79ROXG4joQpGbUEHkiYcq+cIbdmeO8NOY
 K1tyc8zAebGkAVL+/P1aoWJc8xb36sp+uzW1wVEawbhiBjKzkgHpTWybL7d/LA7uOK9e
 OcZdBL2VaWx8cUpH16ZdXRqPJ7bkZem6lqbdNOKRoFboRoePUZ0OOrLX8aNMh3WwgvQg
 FZk0hVbdKlKPHhJRxr2E3bCIFVj+1ss73gw3a2m+ORFLhhBsM4HrrUHYAZMsdjoe5Bm7
 q51Q8i4Cjg0VkKZXaL057OLc3v6ymLqHT8nB2fgSJiUZxuLCYz40+usGRAEubIyZ+Jg6
 JN8Q==
X-Gm-Message-State: AOJu0Yz9cXcjOcJe/lZSogEOpP0RBEA+n/f991KvmkzXdnf/V1uNkOeD
 VLDPmnp0uVvAJoCAPSpyCCci5MPloQCa+2bkURD8z+us2mEa+pvkYfKF
X-Gm-Gg: ASbGncvroXhukvvK4CgFtXh4rH335SGosst1UH5Nr38/fQyBFJNzNCFi9MH2DeIlCJX
 +7wJ4LGPe4xbr2vSHMpf/ZSV3/8rorbF1W09t0ilGb3R1lt4VfzbDDCXou3jPQ3sitVBsnI8dmJ
 X/AZCwGbk+c/z0fuEXDrt4O+9Y0IA+xceH2qrSQ+wMBS90q9srfSNdXVesjttPv6+sOVVpk41hc
 A5jeAt8kc+5LLrPqTHoZ0ZtNyTIAr3lgGH/zj+0uHkbuYVumqO0QohmJw11AQQ+qmIBbmAuBjlR
 vTEOFFP573TeRu2WLhnjIESvt5bgrYCQbzxrDnWNTAodCyi98XjdlsvbZ7w5ULwrwmg2t/GEDSn
 8ftcvy2W4F9jBZn9lcSizYjQH
X-Google-Smtp-Source: AGHT+IFs82V2KEASR9Gz909OBVFnhk5qy5a5uIoHbA3f3Al4eEo2M3QlGsWCwe13fMV/nwp2V7oEIQ==
X-Received: by 2002:a05:651c:4419:10b0:372:8ada:bf8a with SMTP id
 38308e7fff4ca-3728adac271mr18360531fa.35.1759155925644; 
 Mon, 29 Sep 2025 07:25:25 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3728c23e6c1sm13201001fa.52.2025.09.29.07.25.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Sep 2025 07:25:25 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
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
Subject: [PATCH v1 6/8] dt-bindings: display: panel: document Samsung
 LTL106HL02 MIPI DSI panel
Date: Mon, 29 Sep 2025 17:24:52 +0300
Message-ID: <20250929142455.24883-7-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250929142455.24883-1-clamor95@gmail.com>
References: <20250929142455.24883-1-clamor95@gmail.com>
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

