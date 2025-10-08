Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31662BC3D34
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 10:28:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ED7F10E76F;
	Wed,  8 Oct 2025 08:28:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QCi1p+fS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A56D10E76F
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 08:28:44 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-57a960fe78fso8087413e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Oct 2025 01:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759912122; x=1760516922; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gXVMCYVqhYxHmVEcLB21GvSyFEdTGyVsbdPWOR94MMw=;
 b=QCi1p+fSKftcAJbkyYTIfwqBZMm2CZynX9zaby5EZDDNulZiDB/0Zb7bgqZEV3Pwuq
 EQ6AA/rUPDdVQctevwXbBbnvmAIfZ/9cnKjckfX9IdYHgQQsD+oDIWz2UmBHYUxd+P8t
 nWPgwVujzZtuYEn7GuVqzTVhPq5FUmPeYWPJvP8993b9IRhryk2tooNwf+6fhn2t9CaI
 QStj5iQTucyPL5IQKsqdO1ZV57BGsH69nSpEv4ev2r6QXs8vc/rkGAOUR7LN+yxUW+z1
 XHOSiqi2l0p1LdlGZpXYcW9QgzJppEEmJmI5vxXCLgcl2Myx/ViHCNFYhTRqXTbibx1W
 n6mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759912122; x=1760516922;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gXVMCYVqhYxHmVEcLB21GvSyFEdTGyVsbdPWOR94MMw=;
 b=p2SJhWV0SBLE6KbcFfGjECbvd/T/gEF5RWYQL5nVDsnDzNe5I4Wt/Kunx+xW3z8nu7
 YI2E8mB+UCDb/kPaKTRUU1Q2BbGgaOBtVGSb9DHvA4cc7C7G2Fh6O2ck1VXMUQOfMBIR
 Mb7vWTRQGVv1dkJ9T/M24bjWHwLrpqnJxUJnPBcnS7SHvtaA7W6XmlxMp/c9V6E90r1s
 M8l3qBxV2nrgIpCRjfHQh3+5GbdwkpDwigpWMI6ZyC1wTuJg8IZwckvW9LndZB2V/v3c
 Pshk6DqHwh+MD4391Vtzq6Azma+68ueHKJZU995UnoyltW0AozW02DEJc98RgnLrPOMa
 JtKQ==
X-Gm-Message-State: AOJu0YzX+9+suPDZoO59tJiNeRst0YW/ugItJsHeyxZ9yBAUzTeoFGzu
 fGLhy0VFDoTYZKa9RlELnCE3fljlQsjhasBH5DI9iOcbq4La7BT4T0WT
X-Gm-Gg: ASbGncs6ivPHr4dKUSOtHyIsMo43ttcz8qjFb/FoRNxenWCqS75zmmm2kwajiRrZjUC
 6oSVrc1CUabyI/A42nACjh6JO7tx3nL+2soSd59Ya4vGuVRP6vMqfZ/jdT4Uficy65Y2H0HuyYV
 ReBfKZdeLQSEXJ6FyPwiDVt0ZLnn6bsopQRLQrYbhTRn6vq3r4+FS3k9+joXJik/D/4JSLPpNk1
 IaGxbhnvFz7Kb2S1q7MCt4v18yqnFsz1qyE8gd5i+pW5ykq+38JzeKW1kZdREvKuYgW4+OtH0Eo
 nfrYZ5eESwvhUPRJltSMfmwpGLejxn5FZASs53pbMevpbssw38jCeTd0MJtaDZ33t9FT7ke0+x2
 xhvHsiG+dsIFmQVUX6LBTxFq36aHcTeiJwlpv0A==
X-Google-Smtp-Source: AGHT+IF+1vf4Blkz3Lq4Rw8Uqfb7Lg9ffe/Kp4eC+9aI5yktFAQzgyPPiVzBw3ZloFpXuWtIim4mOw==
X-Received: by 2002:a2e:a9ac:0:b0:372:80ac:a33a with SMTP id
 38308e7fff4ca-37609e604b8mr6494121fa.28.1759912122024; 
 Wed, 08 Oct 2025 01:28:42 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58b01124649sm6968733e87.15.2025.10.08.01.28.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Oct 2025 01:28:41 -0700 (PDT)
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
Subject: [PATCH v2 4/7] dt-bindings: display: panel: document Samsung
 LTL106AL01 simple panel
Date: Wed,  8 Oct 2025 11:27:56 +0300
Message-ID: <20251008082800.67718-5-clamor95@gmail.com>
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

Document Samsung LTL106AL01 simple LVDS panel.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 5e8dc9afa1fd..c2963434c895 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -272,6 +272,8 @@ properties:
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

