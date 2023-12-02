Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC13801CC4
	for <lists+dri-devel@lfdr.de>; Sat,  2 Dec 2023 13:52:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7640810E1C4;
	Sat,  2 Dec 2023 12:52:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A817F10E1C4
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Dec 2023 12:52:03 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a06e59384b6so433940166b.1
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Dec 2023 04:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701521522; x=1702126322; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5TpM4rIE4qqT65pAaY9eqEHRHauyEUGalgmDwr8uKk4=;
 b=XDkcnPIBELBmYW5m2k4Bzh2nxsV1mb/IgnZQYPg7sWuCCPAONj71EMQGwzLO5cbCv1
 ti/cvygSJQR0fXaRA0fubyQafvYTVpm5ZtdCj/fbuoaQwxrZWNT35rJ1eoXacBxFLVRB
 Ds6wmkWk/3lXCFdDPSHx1DrB/K5jnnOVV3NDrdnb9N1lrZkhBGEo0INoB6YtAA0mcqOQ
 7+k6BxiL4QZJjSXzRy28w0d212QYiqlpd6d5c0LXrUPushpw6LbNERdnoRTVwG0BDhBH
 SuvQnyHcltGV7s8zImRitzyjjh4EGIlPSzoYz84k/WqtaVXh1txEd5CFz4RpyrMYxqh1
 2Dcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701521522; x=1702126322;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5TpM4rIE4qqT65pAaY9eqEHRHauyEUGalgmDwr8uKk4=;
 b=gs5P/jngyO7zok+gOFYjgpuq7zZth0jHVwQ5yktZCGBD0ZD0UuVzn+YH1D09fUbjEt
 tbrVHFCjvY/slEAXItcTyoEMbFdRtN+hcJ3ysPhJuUieR3lkBYS2MyfL6oQH4KdlOKmT
 H8YC8GJ4FpsSTdc8mNhyjQB4LU2CG/AzSLg5bjMFWjlpcaaEkLJNV4ZE4xdPF1qIdW87
 Gg0+GRYkqPmPXg+0r8zC/bvDjumk05oFB/7r+fRC+5RRiGZHndl1/DWYWNzzP2jEeeqO
 41E1GU8CwAjNHn7V7oeioQQ+zI69QmiN6yq4W8y54l76O0riQM2zEEHvnMHkSeVutitY
 GuSw==
X-Gm-Message-State: AOJu0YyF+WfYRMyby6zBWWcBtJPMH+pOYgZQVSDEakOJm/GsY1pazl5h
 YYF9n8AbCQLO3IGn7Dqdjg==
X-Google-Smtp-Source: AGHT+IEyleq1fwiEbFjEWs4F50ggLLxGB/KOmVoOHqA2365tzKaQw281kj2swtpYsUJqACRktkUtTA==
X-Received: by 2002:a17:906:3b43:b0:a16:92f1:2f47 with SMTP id
 h3-20020a1709063b4300b00a1692f12f47mr1536630ejf.57.1701521522024; 
 Sat, 02 Dec 2023 04:52:02 -0800 (PST)
Received: from U4.lan ([2a02:810b:f40:4300:908e:b829:354b:f8ee])
 by smtp.gmail.com with ESMTPSA id
 g5-20020a170906198500b009c5c5c2c5a4sm3018161ejd.219.2023.12.02.04.52.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Dec 2023 04:52:01 -0800 (PST)
From: Alex Bee <knaerzche@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 3/5] dt-bindings: gpu: mali-utgard: Add Rockchip RK3128
 compatible
Date: Sat,  2 Dec 2023 13:51:42 +0100
Message-ID: <20231202125144.66052-4-knaerzche@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231202125144.66052-1-knaerzche@gmail.com>
References: <20231202125144.66052-1-knaerzche@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Alex Bee <knaerzche@gmail.com>, linux-rockchip@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rockchip RK312x SoC family has a Mali400 MP2.
Add a compatible for it.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml
index 0fae1ef013be..abd4aa335fbc 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml
@@ -29,6 +29,7 @@ properties:
               - allwinner,sun50i-a64-mali
               - rockchip,rk3036-mali
               - rockchip,rk3066-mali
+              - rockchip,rk3128-mali
               - rockchip,rk3188-mali
               - rockchip,rk3228-mali
               - samsung,exynos4210-mali
-- 
2.43.0

