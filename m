Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A57BC3D37
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 10:28:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68CA310E77B;
	Wed,  8 Oct 2025 08:28:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DC+z/7sL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6094110E77B
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 08:28:46 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-57bd04f2e84so8014887e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Oct 2025 01:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759912125; x=1760516925; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0+a5/f/Fx6IMBMc0auLZUB4h0ES81R10KOuZfrxfUU8=;
 b=DC+z/7sLrcmguvndGWjR/CEgbcZ1k2U5M9XrZvM3wqQIrxQ9nqUm4TsG8BXCi7x+Qe
 CLBReJ8VsCHVJIHgKAleyxtXia8C15t7kW8t2jcdE0L+rc1/tXiClpUHeicUVboqtwkz
 YemK6lE0KebCMrTCj6Ozng6GlzX7MvNjlwjuitH+WLjmqAg+daJDsv0PTwbaZhWG3OhZ
 w0dKqmVoVnVJzZ977fGPDbxIep2j6IKplVXIkmUi92Ew9Jo1JYFd2qaSPVc73JN7+pqA
 H8Y8AKveV6dYVntmz5D0HJczzXw4xY8/ge/zp3iveXubT4wq5i/xLbX2fUmVixD5K4Bp
 zBlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759912125; x=1760516925;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0+a5/f/Fx6IMBMc0auLZUB4h0ES81R10KOuZfrxfUU8=;
 b=UbuPHBkV4FDNhu9XFiU6XJm4pCEI2JMyD1/Cy5dioIo7GnSw6fkRj3vhSnzq4CA8WD
 AXsVwzWqJlweu+xQI8Fncx3bma50fBoeVRKT5ZjOeV+/4YzdMQgtVHObGzpz4Yqpyy/F
 rY9/a4mPXbsRBed42xFunSGO+M237JRcwyj34d3OySaepRTlb7iIWM/m17dBY6Hy2aM/
 p7ea8s+WPkNgPMk1r+EtlIi+vpirxdrjrxXgSgqdtzqd9L8bPTRlWHDBbpTpiOgypYD+
 vlZ/qQw39w4SKgqi5JyKjJH9yIiHLQA8LGq5DGywRwL+Suw0y6IQXqoggK4O/0L9aHlC
 fMWw==
X-Gm-Message-State: AOJu0YzLbuhgoTdjFcYbu+CcA4ZdOocRHHe3zaAFr5rbS39Vo3iC7MRZ
 jDNfO6j06Wg1eFJ83uXVWw+r4lWFLU/wcW7reU5FZPROkuZY6eVcSKLN
X-Gm-Gg: ASbGncuHtCNl+v7Q9/43WrjrgTh6A71e4iiGcMtFZxbXVH1ycMg6SXQiZvkkP1Y8UEN
 7T/cdHWz4/cnJCjN2KtZAa5saJhlLdscsFR1FYlf+4QbypU3YAdSX7Zz1yIYxn1JquODe+z4YKB
 l3Nygu+yW5nb4Nnhynz3GDg8+L9pNoXhmrr/EV4TJzWaM9NF5Iez/f0qZDh/d7qRdw3tla1qhJ0
 eMIyJkQntG8SQm7DnvUjiXSHOa6LVD7VQ8iPimsybypr76Zp21oxgq9aePiRPkaC+4N5TNqSqd8
 uqj6fE4INZmMirDLBbzQx2WEVr+WY/OpeWaDK6JV6l5JvRaonu39Ek4P1VDdWy8AYozhOYp/wl8
 HcP2nNuA2flwDH33xt3UHz9OaNTEbdjY4ysn3voThinrA9OS7
X-Google-Smtp-Source: AGHT+IFa+YtfJMOLVgx9lbRcqni2sMY7RFAYwacszca3hFSUXsWvoDDOW8OhRY3egEaihLqXRjLDDg==
X-Received: by 2002:a05:6512:12d1:b0:58b:2b8:f8d0 with SMTP id
 2adb3069b0e04-5906de90442mr620072e87.55.1759912124568; 
 Wed, 08 Oct 2025 01:28:44 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58b01124649sm6968733e87.15.2025.10.08.01.28.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Oct 2025 01:28:44 -0700 (PDT)
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
Subject: [PATCH v2 6/7] dt-bindings: display: panel: document Samsung
 LTL106HL02 MIPI DSI panel
Date: Wed,  8 Oct 2025 11:27:58 +0300
Message-ID: <20251008082800.67718-7-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251008082800.67718-1-clamor95@gmail.com>
References: <20251008082800.67718-1-clamor95@gmail.com>
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

