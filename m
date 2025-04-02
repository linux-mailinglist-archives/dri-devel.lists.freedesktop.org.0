Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D1AA788CC
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 09:23:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A369D10E087;
	Wed,  2 Apr 2025 07:23:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Q64eF9gb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0B2310E082
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Apr 2025 06:12:46 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-30db1bc464dso55765641fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Apr 2025 23:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743574364; x=1744179164; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=N5IKCpj0oMEBpJadgyoV7jDPfWfy4VMRLV22ZDS4/uw=;
 b=Q64eF9gbwliYieRSNOZ8RYHbpF4+7DmjOfJhotujJKv+agBwRWWFRfO1qMIJ0OAbOS
 D0vTUZU1FySmsP/s/HZBPImvGdTaxE+gbXL+MDuuF4cm337HpqSqeZ5qgheWFZYsMn0V
 57WYTrjvenrvPV+yo1QgWjyYJQDBabG6yUlyiXjhSiZRycH/YWeqsKRzaEKY0X4AM4LA
 B2zDaKZcjXHld1Cgghws7Nt/F/GqQFzqlEezYt3VNRDJza4pBwJKj2JmtdR6hSotaf3h
 8O6PO2q4aXB5chkcsdIkcPJbX+jDrv8UFfoEUFBOI31N2Jz0LHnThBTOh7VKJUMv+Apt
 6AZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743574364; x=1744179164;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N5IKCpj0oMEBpJadgyoV7jDPfWfy4VMRLV22ZDS4/uw=;
 b=cEV7ZNavTa55vQe2CN1X8cQj72i0mNOF4PBfSDouOiCQuv1Xk+dAL+L80s9YgButsx
 cjg5YjlICayvCJCrf5bhjRiPFjiqr3fh7GA6ffpnLifKSvVmAyY53+yOWw97dyfbkjyh
 8lnaNipuorVPwr49OHNxtjn1cKDDsH7g0XL0JbhVWTL0ysB2NZwFo2EVEZOHHO2T5led
 tfx6g+hqSNrba5OaKPprB+RYeaFAVmNxKQW2BJUb3or2bhUK+f5eL+IkmJqGLIltqsXg
 W63lgG/fdAUtbDii6o+CHTOUO+w45zOhvZXadOjGNoGXxHYCmm/SAsoeFBkCbFM3U6R1
 Z/xA==
X-Gm-Message-State: AOJu0YxhfkcUbHLt1Em72nhsmC4wZE07ajypsAQLIJQJwE5Zm7+bR0ks
 bsVdt9UQAgR5G7s5M3+oORFxVBb/biUHkyNIZ2yIrpOHMJKolfkM
X-Gm-Gg: ASbGncuYP52uVf10VDWxdEs7hNeoEfkf0T5R1drG+Qg7WdziaFocuKctPCFda6rKlZX
 WAaOrCv+7N5RAl6j9n/HDv43SoiKEvRcxKPAGNtPOBXanaVLVqGSmuN67SYvHGYGWya4Sf1uAuh
 /KMXFBnje4uGBMJw4l6SvxWlOux7ZC8B2IUtGbxK4GSJWN0ooluQlhJb4SxSTX466LdgUnt8P4w
 i5AOop9OrkKwf57O93Ohm89qX7iHHuqTUlaU1oA2Q7NK8KZHm2PbZXhRoTiJbNwT0Y9HBf/7gMH
 wk7VER56oElSskZQjZoSFiHS6oKXagBFEpO/b3j7WTDDzKTV7rtt5j2MrRJx+51+3VPv30tUkLp
 D1tNZqUQBZR2c
X-Google-Smtp-Source: AGHT+IE3Xek1eWBz2rPg/t6DOGrGPCI4yOiCOyocMpZtm9LdLXUZyNdRj/gglChvFsmeZjOHr95wtw==
X-Received: by 2002:a2e:bd81:0:b0:30b:c3ce:ea1f with SMTP id
 38308e7fff4ca-30ef90f9907mr3124251fa.15.1743574364342; 
 Tue, 01 Apr 2025 23:12:44 -0700 (PDT)
Received: from [192.168.1.11] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30dd2aa9118sm19336801fa.14.2025.04.01.23.12.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Apr 2025 23:12:43 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Wed, 02 Apr 2025 08:12:12 +0200
Subject: [PATCH 3/3] MAINTAINERS: add antry for Sitronix ST7571 LCD controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-st7571-v1-3-351d6b9eeb4a@gmail.com>
References: <20250402-st7571-v1-0-351d6b9eeb4a@gmail.com>
In-Reply-To: <20250402-st7571-v1-0-351d6b9eeb4a@gmail.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=957;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=dtSEtwC8H+CpvFv+jyq4hRv6iC0m6GDU67J6rIoLIGY=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBn7NVRO6OWWtMvHUt6pKtvaDRkAxJB+E4FWveSD
 H7kL6SpjMmJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZ+zVUQAKCRCIgE5vWV1S
 Mp5eD/9A+/xujBrr5sGpXr7f1PH4ivOZCIFLSfbwEkx/HY65z2asgyJAnubDQMywXXS0C9Ka+L4
 OTnlNtwpzkj6QTK4v8Tc1RrTTxB7LwlhAY503AQAYOM08b0uaLIXLtrczqD4eFkXhThnbkNSGYE
 X7Jnm+5P3dVDjMETJB0ZCREBzz3142pnA63FEBOKYLWbE9rUeVnQ/zpZHuG1hM3cdNO8wBLdaHM
 fMaBX0e17nWAZFRCTCVcMnDY0hdenx3Q14oolOWJdvByY/DMB/UYME15AVwWuTxh2ybwyT8qzqg
 wpGLpQ3z2jZEw4QMkBvPf65ya/3BSuElidSCb7d4v3WEtmb7sGOjsydlAnZsUjSARc2omG0Kuce
 vIWkbqMwQbI0S0oKDdAvFF8rrS+6CjKbK2p5cHagEoRSF4YGmPj00eCA1H1HOvdaN6UrKkT/nmO
 RW58J4mBTFkgndNRg3wGZnoz8jduoDu6ZDY3oil/3H5CAKJp0OWmVCjIsncgZclxwb0YMPqUeRH
 sjHZrZC2Okl2JxREG77x142l8nWjx+4osKxPX6z6/6Azcjg+qc8PUvQ1P7XLlJHzI3DPc5ucyF3
 qzx53gR2RQeyqfZSByiQlSBXWExZaf/6/bkWrOgH3uQwIVRwD2dlhf+Ar8qXtxtpzepIyDB6r64
 xYfPdEN4d5g1H4w==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-Mailman-Approved-At: Wed, 02 Apr 2025 07:23:36 +0000
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

Add MAINTAINERS entry for the Sitronix ST7571 dot matrix LCD
controller.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 889bd4a59551c9bc125f94944a6e1c7e3ef2de83..00d19d45679f6d18a7e9c9e619b7642176b7ef95 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7572,6 +7572,13 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/sitronix,st7586.txt
 F:	drivers/gpu/drm/tiny/st7586.c
 
+DRM DRIVER FOR SITRONIX ST7571 PANELS
+M:	Marcus Folkesson <marcus.folkesson@gmail.com>
+S:	Maintained
+T:	git git://anongit.freedesktop.org/drm/drm-misc
+F:	Documentation/devicetree/bindings/display/sitronix,st7571-i2c.yaml
+F:	drivers/gpu/drm/tiny/st7571-i2c.c
+
 DRM DRIVER FOR SITRONIX ST7701 PANELS
 M:	Jagan Teki <jagan@amarulasolutions.com>
 S:	Maintained

-- 
2.48.1

