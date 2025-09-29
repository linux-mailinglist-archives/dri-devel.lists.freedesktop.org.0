Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E1BBA989D
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 16:25:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13CE210E42E;
	Mon, 29 Sep 2025 14:25:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Es/auV4D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6330D10E432
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 14:25:25 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-36a6a397477so45474381fa.3
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 07:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759155924; x=1759760724; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Sh9DAofb5pc+fYQ7Puuw943vV9lmOx/AYaxuS09pAW8=;
 b=Es/auV4Db6lpnthItD4XWRGppfxXzTBL/ZV+WlEFTclifkCzMGsFKXtk2yz4M4Agn3
 PhlrF3cDkCyhRucnAtpMOY/GjX5T3HdHdWoIwE//+r8HqDPv8lA7UiWg9xVNCWhwjxme
 KV5m0nCuiw+V3GdLVIfXGweMHH5TYZg2x9h2ihDYA3uKNt21LsAOW0Ri/9mY031R2Efu
 753giOx5tmQnuhtzyNTJ8U+h6Auz9F03Zjs0L5Mw7SZlAI9AcljkDiMcYQUQA6h8qcOY
 9u3AUTYYnnOZWdclYM2EDUxv1a6zfGnfsDyMkWmANtQikjqYYRV6xa8uigGY0RNhRkyI
 kPvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759155924; x=1759760724;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Sh9DAofb5pc+fYQ7Puuw943vV9lmOx/AYaxuS09pAW8=;
 b=aWg7Ma8R4vwGLdg+JYHmHLeO+1eDt1nyI+xueZFs+LTtWHVeEQZXGICkbFdi6Tp+H9
 wauw0CGEUSBcWhCqTXqtLid6lJj1s9scFhj4fcLEOkUlsiA3W7n48VcAhr6dYamiNQ+s
 D0XcDpnp7R8joeQOAlvZe7hqBnVsunDT2IgpNMLXYJicKHq9X+aGHhC8iJY+L9HMGk5k
 sMlT7Bt0iCTTklLMAjxghowNpXXuaGvpiZHkvaIelsVQ9SXM7nhYtzURfDc7WhN8N1Xr
 zkHofx1dJuImGzTUsLX3VxhXz104faRiFY7HJZxksuJ7FqRI7fIAgiBimlUK5YEVD4FL
 //2w==
X-Gm-Message-State: AOJu0Yz9XHnc60/3Qq7tU+4IBeMlh0xqtj33ZxEudtNEasbGS+i+gfa5
 4DmkWERNtNDSZVA6z6naI+x39VwUQ0NALsqyLSKSOWr/WZZfmHBwKpV6
X-Gm-Gg: ASbGncv9wlPYWsXvVzWLL18cysIbbjBrx+764lQO+Tj15PgekBEq+DRDpC9bMpHtb0R
 iCIWlBLkSt5IDXDNz7spomrBO1q+8pGc36nKY/AjJRVK2RwrdhQ1yGDkVBfZsmwa2Nt+azCVDdv
 OtDLPsY7w24jKuqTw3mrR+ghrQ8LlsPUo7Ozftaw9JMVQWjPCEEXu5jK1Sbbr8Doajnx29l8c7/
 XaKzZ9zgFbHra4/z43fViMOe0XJNc14PEEtK1ERLRdhIhX4SwM4jrhFFEvnwbqVqA9r+ZztNbSl
 rQxnb3eDvGpb53DNe4rVjsCgBGJoxt/9RLTRRt3/VnbmrfAsE0LFw2gmrYBnkyv/dMr+SJ+QxVy
 OiSHRMmQOBAt6tQ==
X-Google-Smtp-Source: AGHT+IHN0V6Vi0aPAu1d9d5AS3VfCD+ATABqrtHWzbt7i5cNrr6oVnwEDNT3Dh/t9jYOyViBE3w5uQ==
X-Received: by 2002:a2e:be15:0:b0:36a:6540:3ba3 with SMTP id
 38308e7fff4ca-36f7f932d9amr49253481fa.39.1759155923254; 
 Mon, 29 Sep 2025 07:25:23 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3728c23e6c1sm13201001fa.52.2025.09.29.07.25.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Sep 2025 07:25:22 -0700 (PDT)
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
Subject: [PATCH v1 4/8] dt-bindings: display: panel: document Samsung
 LTL106AL01 simple panel
Date: Mon, 29 Sep 2025 17:24:50 +0300
Message-ID: <20250929142455.24883-5-clamor95@gmail.com>
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

Document Samsung LTL106AL01 simple LVDS panel.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 5542c9229d54..93ddb3823d3d 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -268,6 +268,8 @@ properties:
       - rocktech,rk043fn48h
         # Samsung Electronics 10.1" WXGA (1280x800) TFT LCD panel
       - samsung,ltl101al01
+        # Samsung Electronics 10.6" FWXGA (1366x768) TFT LCD panel
+      - samsung,ltl106al01
         # Samsung Electronics 10.1" WSVGA TFT LCD panel
       - samsung,ltn101nt05
         # Satoz SAT050AT40H12R2 5.0" WVGA TFT LCD panel
-- 
2.48.1

