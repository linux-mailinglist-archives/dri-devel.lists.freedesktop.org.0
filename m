Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A492BD18B7
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 07:56:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1506210E37C;
	Mon, 13 Oct 2025 05:56:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JWcAGEOm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C113710E37A
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 05:56:18 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-afcb7ae31caso797799366b.3
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Oct 2025 22:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760334977; x=1760939777; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0NlbLfnaH1AYI1Kzf2XAYKDUFV4VkFnG/ReSb+d8FKY=;
 b=JWcAGEOm1U1lDc8HCFjybOX0n49RJCCj7NdeV+EFAZUUfQsLWqJjtqvLmi0cdgPEfl
 ZqAYi8KJFe8ux2rsCjahMl7e8QfzCxo/WbiKuXzGgfGGSe1jCfRTKZMQmpIAg6CUOpKy
 YDb+mpguzX4nDP3JxRBK2ydYLG4dKxGVfFStLrIOKyyZ4bG01dMlspMgbJkI7vhHUAhx
 JK1A9+Q/laAi8GG0IQpxhHARYbYCwydm3RTzHS0HkIUy4XYBLNxvG93ZE3DW47olzFcU
 bRDgAhysTSsIt7GUu8G6TIAjgFOBRYAHcJfBD5UBsPJgCADxKeJ8aemZX0xrO7fVyHRX
 GJSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760334977; x=1760939777;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0NlbLfnaH1AYI1Kzf2XAYKDUFV4VkFnG/ReSb+d8FKY=;
 b=F2XKgesGBjM/vrWRIgE4EDrmJkZ7NO/18pq0qTHu7D61ibEZPWfEjkxc5Qpix/9KGB
 fc8ra0t+OWKLNJ2QHctv5EKFK7HFsVIgqr5JK8nWcZq7RkCAr5Pf6U2iWM4eln9LMq0X
 787cq8y9XWTRtTQceU9z56B3str+1myJyRIGkrJfcMiik77dn84sITyclb858VQ1p6bI
 EOzhY40hAPKwMm1QZ3KTzCW9QE9stu3jzQEjt4N/vXZsqT6rbQToPy6uTNgMdJ7ANU6G
 Yj70lVeVx0ZsgGWz50Ey/cq+t0a6IKp962d8scpVXAYG1ywAN1kqzyySmsaWSMFcm8eC
 cLGQ==
X-Gm-Message-State: AOJu0YyZsHjSysQ9tmiotbPnh4hDBJbII6kU0Op4ykh4BbOwtDsShfsS
 FhH9CybM2He0sTjEjRHJefcDRA9L7s6Knvxtdq4w1azpGh3rp32n8WMz
X-Gm-Gg: ASbGncv4+2znR7Bxyt9HqmU7ji+pqsSaIrbgrvW8FwtJfywnHDb9v+KdF0DdZFB30AB
 J3nPwCyW3/YFgUebrj3W5g16mRW3e+AbipHdwm8vFeLIj7t/Yj69f5AC5xtBRV8jf6nKvroFFta
 0dLZW8g2voCrxOWN/7s81uqRdJWPgIGF2SXHTx4kcNLiVNd5xWYw3frDPka6X9PlmQoYVBB2/3U
 UThMz0h+e5/ZXURspjCxb+Ufs3JNKzex5J934i9jamnwrfvOWdmap3bUWazKyFqmHWvt5y8CFyF
 7cdRoTy8sgIBL2FEo9BKIVGWJTQe8i540zDtMD+fclbgdpgJXJTkB8D+H931rRxaiqbfV2bG94r
 afVEMkeZPxgbRtPnsPuvHuHxY3q7iT0q9eBu4BQdgneQbOMTwR2qz5A==
X-Google-Smtp-Source: AGHT+IEgUNiVYk1c/l0uwnmFrssSP9QtQ4ZPHREFA23q3yikEOY1+LgSDt2qIqexeuWomC/l9La4Fg==
X-Received: by 2002:a17:907:94c3:b0:b40:664c:3317 with SMTP id
 a640c23a62f3a-b50ac4d69f9mr2061549266b.43.1760334977303; 
 Sun, 12 Oct 2025 22:56:17 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b55d63c9a3csm860912566b.23.2025.10.12.22.56.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Oct 2025 22:56:17 -0700 (PDT)
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
Subject: [PATCH v3 4/7] dt-bindings: display: panel: document Samsung
 LTL106AL01 simple panel
Date: Mon, 13 Oct 2025 08:55:39 +0300
Message-ID: <20251013055543.43185-5-clamor95@gmail.com>
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

Document Samsung LTL106AL01 simple LVDS panel.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 4a5ca013d0db..adb244460a09 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -274,6 +274,8 @@ properties:
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

