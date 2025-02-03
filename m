Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F232A25891
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 12:52:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E57210E494;
	Mon,  3 Feb 2025 11:52:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LRQ81uuh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E618010E494
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 11:52:37 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-2164b662090so82637415ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Feb 2025 03:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738583557; x=1739188357; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Uc4uCqsleGcCsKVC2kCtafnEyIcpxj+3QblkARK4r2c=;
 b=LRQ81uuh5O4I5hnw4naFBzN0EQvmot9fjs1pm8HA0P2bHjAANC9FnLZ7f+S6bek6Yj
 42T+1XEjp9vK5YGj8bOVMsvJ5se1dMZeQw/c4q3xoNlWKRr/IQdv6NvfrP6Ux7a4Lclo
 En1ezT0aZGIqpB7SssOyiwtZ/r83NGGoDmBZxaYNv/S8Ppd8i/KjSnSGmaN6dXIsLztl
 wfPG95TCN0nEb/HfdUjFCA/4ynuOiOFSz2F2kfT8ME5qgu4LSqz6Vyttc6NJ7SsIFn2j
 KwvPF8xq335yiM8kqFw4wZPAwNRVuG7KxfceKYsf39Wv/QG+k445ycPbEwG8bfd+IawJ
 Iykw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738583557; x=1739188357;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Uc4uCqsleGcCsKVC2kCtafnEyIcpxj+3QblkARK4r2c=;
 b=Dz3ENKgWHFbMxd1uhgHzopVHodybK92aBeGPK2nsuRtR8511OFB8GtfKY1V4XJUBYP
 koiNx0QFCz/2jnxtAV6VeHj8wPFK5prmrLdC6/E4p3UbkqelTLOtzH6nBc1TnNlZoNq3
 SH0GBScEtxo+XHPlchCbR2w+TGh4kFcGfTFPwut2SjozLRfJjZAmdxMowswivHMi0U46
 VdVlSnN0/Hgi49hZtZ9+Ndiban9qVeA43z587RDqIpu9FuGHxqaMVT0NMCVo6grUgWfI
 zhASi0Csr9+1VQnSOIRK5Q74MdQSPGXdJELWxZXYv3hlTztJMjO6GU9rSwTr9lo4C9dX
 9y1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMNmlHLqXiz56qMdKKXtjwSZjxUz2LmXvEcHwJkuzT/Bw3wwSMpp8T5qnRRIsAqpaC11Dbc0KSIE4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwfUKzAKSujzdjtBVcUUqk9PQFj+4na+osM4rAh9s9Wysq0oNQS
 osfrGeeffhdWyma6zaefdQDZqjRzaW4CC/MF5YPEN5lJSb7IVA9+AsbSpm6Q
X-Gm-Gg: ASbGncvERxXzXNhlzsFEY0rOi7wYxaGOmiLNOBMxUjBuzsnXcs1wVrcVDj6uWquCR7W
 jEjDeIs7FgnNTAcn23SUEPGZUb2fqYv22wM0JGlTyliHtelgwd0LF7ojoYH7mOgUTjS/ozGLqCH
 68V1dESEWb5t8d6cdagw6VDulMrLujnsqfAQ7woFeIT9ttveFKMsTLFj9/ZA82Dad9UkWrOM6ux
 3GY+MjMHE0QbvIhNiAtJaPxR1jnhb0R5PBeDrhQvuNw0+VlNCA4Z0WXSb4qXMYVWbgMxflOcTL0
 oRhQvxgQMBTIN2c4
X-Google-Smtp-Source: AGHT+IG9OzjbgkvCS8tq7nwliRQ7D0GE7eIK1YFb7OgjbU/H0UhSsEr4jVXSBegVQdOpNlym0wtPBw==
X-Received: by 2002:a05:6a00:4642:b0:725:f1b1:cbc5 with SMTP id
 d2e1a72fcca58-72fd0bc26c1mr38178820b3a.3.1738583557299; 
 Mon, 03 Feb 2025 03:52:37 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-72fe631c039sm8262408b3a.25.2025.02.03.03.52.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2025 03:52:36 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Lee Jones <lee@kernel.org>,
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
 Nick Chan <towinchenmi@gmail.com>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org
Subject: [PATCH v5 RESEND 3/3] MAINTAINERS: Add entries for Apple DWI
 backlight controller
Date: Mon,  3 Feb 2025 19:50:34 +0800
Message-ID: <20250203115156.28174-4-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250203115156.28174-1-towinchenmi@gmail.com>
References: <20250203115156.28174-1-towinchenmi@gmail.com>
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

Add MAINTAINERS entries for the driver.

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 896a307fa065..a576324807f5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2228,6 +2228,7 @@ F:	Documentation/devicetree/bindings/i2c/apple,i2c.yaml
 F:	Documentation/devicetree/bindings/interrupt-controller/apple,*
 F:	Documentation/devicetree/bindings/iommu/apple,dart.yaml
 F:	Documentation/devicetree/bindings/iommu/apple,sart.yaml
+F:	Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
 F:	Documentation/devicetree/bindings/mailbox/apple,mailbox.yaml
 F:	Documentation/devicetree/bindings/net/bluetooth/brcm,bcm4377-bluetooth.yaml
 F:	Documentation/devicetree/bindings/nvme/apple,nvme-ans.yaml
@@ -2253,6 +2254,7 @@ F:	drivers/nvmem/apple-efuses.c
 F:	drivers/pinctrl/pinctrl-apple-gpio.c
 F:	drivers/pwm/pwm-apple.c
 F:	drivers/soc/apple/*
+F:	drivers/video/backlight/apple_dwi_bl.c
 F:	drivers/watchdog/apple_wdt.c
 F:	include/dt-bindings/interrupt-controller/apple-aic.h
 F:	include/dt-bindings/pinctrl/apple.h
-- 
2.48.1

