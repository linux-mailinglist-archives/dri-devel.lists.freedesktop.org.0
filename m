Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFAB92864F
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2024 12:04:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CF9210E80F;
	Fri,  5 Jul 2024 10:04:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="X2rk72pi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 595F110E80F
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2024 10:04:02 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2ebe6495aedso15174941fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jul 2024 03:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720173840; x=1720778640; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OAAC9qEu7VDBRfhEoRtlZEYyIrj1boXAy6yDu78l+Vg=;
 b=X2rk72piZ3kKFE1RH2qsx5L0R1tQHO/yT8DNIrx2zg7SptRmorTk9vK5K2XTtsxXHs
 QZ/Ri+XE6TyfDSjhF2QtlQOCN4lh4GXsa3kE2bAcfbEN36DkXdclnhYuLkoLWuu5tvbE
 yULHo6zefLVgc6nhpfAck3UWxNHl3VeSk5rjxUkyyMCq1C5Phlw47PlqedbezJgx1fgZ
 tZj6gKHsk/fXW7FxeYn4D9CSLL4UoACH7lVq9g1NppLVNNTB8byQHBhIhTfSjPtEtG9k
 Rpkjaa8TQXK+OkyFKoAHPHHNBSS2SKRMAdSOgKf4zAyTVFXqCsIl0IRuZxz4G06q7f4q
 +CIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720173840; x=1720778640;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OAAC9qEu7VDBRfhEoRtlZEYyIrj1boXAy6yDu78l+Vg=;
 b=cLc+6H8Sg4cu0H8T73ljcvO3emEf2GkAf1Ap1FGP7fYMSbe/QwfvyZWFXyJoT21Bc+
 vT6MoYu86hx4WJKZfl2IydKt6guPN8yS1cqP8I0ZeSpFBd2AN3NKWrXys2H2BIRvgNM+
 urCx4/K5nJGlV7QebCXnyY3GlEjMVw841WLsGKBtuC7wQ+ZfODllWdYO13XgE+0p94GU
 qlOoAU5UbHMoIvvyUDpue9C3Tf5raqyW9YOeqB4OTGwfTci/ktfTK7ksl8DuNIlWMxJ+
 yo4O4CtIRINgR/dM9r4r5xDrok74DkhSiBG2yrWPRRvQ6P5y1/p92Spte+T79D4jpgYb
 AHgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLX/MvT/z7MThXsd4F3kR8JEJ0rTav1eEYNUnd3DykqJvDEs/AuK7A3dzE2aGCX+05uCks8Qw83uXRj3mkS6mpTz8SWUKrY62VN9ZCQfKg
X-Gm-Message-State: AOJu0Yw4g/HmxXY8pqjWYNklEI48yJ3BoZRjIvZxg3Z6M17LcIoDQMdj
 SsszbsKvPGKyP2+BiuDMqt4cp/C5QQxzY6oaMUbKB8BDKj7lQ6G+DqrS5mJvxhw=
X-Google-Smtp-Source: AGHT+IHPOjbR5uUNSh3csI87eapOhWclY7lK6S3loPta2smbTrcoLjDX3VlsKvC8xM9csmg2iVBKeg==
X-Received: by 2002:a19:6a1a:0:b0:52c:f521:9423 with SMTP id
 2adb3069b0e04-52ea064ee3dmr2510107e87.26.1720173840519; 
 Fri, 05 Jul 2024 03:04:00 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4264d5101ffsm41467835e9.16.2024.07.05.03.03.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jul 2024 03:03:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Alain Volmat <alain.volmat@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH] MAINTAINERS: drm/sti: mark it as Odd Fixes
Date: Fri,  5 Jul 2024 12:03:56 +0200
Message-ID: <20240705100356.16760-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
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

Patches to STI DRM are not being picked up, so even though there is
maintainer activity, it seems that these drivers are not being actively
looked at.  Reflect this in maintainer status.

Link: https://lore.kernel.org/all/77b4e4ad-2b1e-4b6d-bc3b-0c7b339bc295@linaro.org/
Link: https://lore.kernel.org/all/f207b481-f530-4f54-a482-218908869050@linaro.org/
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index c8e16a649a0e..f284cb8db544 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7595,7 +7595,7 @@ F:	drivers/gpu/drm/rockchip/
 DRM DRIVERS FOR STI
 M:	Alain Volmat <alain.volmat@foss.st.com>
 L:	dri-devel@lists.freedesktop.org
-S:	Maintained
+S:	Odd Fixes
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/st,stih4xx.txt
 F:	drivers/gpu/drm/sti
-- 
2.43.0

