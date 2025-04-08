Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DCCA7F589
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 09:05:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2560E10E5DB;
	Tue,  8 Apr 2025 07:05:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lL3CDRdh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B729F10E5DB
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 07:05:03 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-30bf8632052so45586141fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Apr 2025 00:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744095902; x=1744700702; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=i11n14/4d12JDY2DmtQ7aKWTPCB2K2tXSiZI90yPfyM=;
 b=lL3CDRdh8edYFwWSeHade8K+55Id8+7a3YdOcJjpwMVHzbyG/rYlWTfwtbAynFIwEf
 rD0N8yN3owAI+mPUadXDH95ws0oRwq8hT2stMTMiErMZA4CwIRNeYM1UQoefpgZaaNMw
 LNkglvnLd1xy8MJb7pYq5O0Als78is6oqidb5NLoSGcgN8xfeATPPvN+wHz2v3qPXYN5
 JMj0C7FbApH349LuZAjjP1A9ojRaen0WUbOz7mxKilh8oguHVLfV+B3k0ng//Q68Ot4v
 BcoA9x7OcQhaIyaTrrmXcXET/MjZFpcTKX3wE+k1HPz6kMLgNXcqyjunGW2NoCcHeiY1
 GWqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744095902; x=1744700702;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i11n14/4d12JDY2DmtQ7aKWTPCB2K2tXSiZI90yPfyM=;
 b=ilr/GcDTC+Kqlu5xgB37e7Xa7TzSt6FhKk3PlpZ9WlqQRE8qLHHP5kiA4NCmaqiG0e
 3akwpML7ccJOAxZMII7tmeQdudj/H1qX2VqXjWK/La16VCDeD+mHswTAhu6BdgzO4cmM
 O9tLiapbhv/54nBpIrWysiFeE+ZaL5p/S2ossXZRxbINwXf+CZ2Vf+f3+y2hGD/tmN5E
 36VSZ3LK18/CJDtZOi0rnsRJ/mQR6VIET4M+GI1j/GPYqia4GBw7XEJ9bjcoygnxDQLT
 LJmupdJ0dAhXp+DsDPwGllhyCss5XaE8gXenUzSnTcZNdTns0O+xhPRM4Xm+m819g/vU
 m6iw==
X-Gm-Message-State: AOJu0YzzS+Wl+ag7dJl3HAKuQSxlWBlW1z3dRoBk2cE6Qimnzg601rq9
 CBoLIfGpXwzO4f3LZSzQcjSGLNRMJA0xmdx44NqsM4M/A2fIaKrr
X-Gm-Gg: ASbGncu+9w3YGVsL1Aco5tGG38zeuKHHhDy7PKrxfDZDP17AlEVHLpBoH1JOB6VKtVK
 2f0IVzDTdKxGOdwFVboMuvTwxPXoF2vLkhUDCHn2JYxVY1mxE1L/v1WJljMSLyTzpkXR5nxXaOr
 IeLaK4EcUKksyPEPy4W/NsULavFEx+4E0Xn1+EvFnQMxe6KmgmA/SZ2TdIa5T++cbDIjXPZ4y6V
 WrT8eOAjlBgduXy1YDwb7nyajWU2p8Rrhg0Ri4v2pxKU+FJlTdLlTgXX9RdQYAeeEHUh5eN0Syq
 cAWafm5hxjkgeZvHOgluZ27Ukq+sFc6FoB4HrSTUCTbWPQhbkxiJHtg+3O98JyK8LfQY3yKmoFh
 UiN23L2YCkJWA
X-Google-Smtp-Source: AGHT+IFweT18OMKEwMuPZL1sAyNuy95xRHNHIIz/+725Kq7sjzQyRwU4H6VFXOnMdyuzO5rCuDw9xg==
X-Received: by 2002:a05:651c:989:b0:309:2ed:72df with SMTP id
 38308e7fff4ca-30f0bf50394mr40218871fa.24.1744095901929; 
 Tue, 08 Apr 2025 00:05:01 -0700 (PDT)
Received: from [192.168.1.11] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30f031bcd37sm19252841fa.76.2025.04.08.00.05.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 00:05:00 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Tue, 08 Apr 2025 09:04:30 +0200
Subject: [PATCH v3 3/3] MAINTAINERS: add entry for Sitronix ST7571 LCD
 Controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-st7571-v3-3-200693efec57@gmail.com>
References: <20250408-st7571-v3-0-200693efec57@gmail.com>
In-Reply-To: <20250408-st7571-v3-0-200693efec57@gmail.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=954;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=YCGDQojD8nya6OBnR7iagaQHAlVaXzUTMmVsiIk5blE=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBn9MqSKP5h8IxUt3tj8KSjZst0/DK3ePN4fRnIZ
 RaulY19LpuJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZ/TKkgAKCRCIgE5vWV1S
 MusgD/0Rm5O0xsoOa0hrInGGh3xTpRan1/qYSMbzqbntwNtFVuAJS2qFMQHUzjRRo876g2wBhrl
 tVHdOa5Mws9M9WDVXV9gl3Y3YUUhb3A73bPu4fcYFezB+l8EKIM/tWCkccAAEdurADlnhlUJT1g
 9KZ433Vf7QjooRYWXmrfs0V2RVyLwKpwtYsncODbhn/psZLl+OCjuEUafXaVUOAnN1HIQgb1vtv
 PyTZKZ6ksGEdozDboo9Y6HU2R++4LO+3ud6mfg+g98HXE02moXFB0N8d8UK8HBfh7OrqNTBcP5a
 kCYoRxhFCvXIy98IT/aE3tlC4O1kvV8DD2JoXLnb6mWFqfeBxOm5elx3apa1NNaE/xJgXVeDA1x
 ZsDYD5aJ5ph61JeRqUkxpO10nrVKxVnSWvfQKkbOA+/ImL7Fy4jcQ1s+YyinLyqWPRJf3dZU5W8
 rfQUFJ/fZla7z/ZqWEmFCm8Rj+zua78TXUKn7ZR8lNmngNo05TuBSkfwmp0NAJrLPz5mNZJ2Z8M
 Ogpc71FndO5Ay+Kx8xbmF+69baWDWfoA/WKnsmZKWKbsn4EhNRQPm4mpFcXdVvlu2poBaudsBCy
 53CRD1jqvNzr/IIC/B5mzSoY9ts5CJpzUFIRrUEYauwXGnHa/AQY4UsfKlFyNH8uRNsOhZcUEc2
 QrrWkW8xBQ2fjnA==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
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

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 889bd4a59551c9bc125f94944a6e1c7e3ef2de83..eeae24fda846b9f63400ebb08c3fa7f02f3f4b19 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7572,6 +7572,12 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/sitronix,st7586.txt
 F:	drivers/gpu/drm/tiny/st7586.c
 
+DRM DRIVER FOR SITRONIX ST7571 PANELS
+M:	Marcus Folkesson <marcus.folkesson@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/sitronix,st7571.yaml
+F:	drivers/gpu/drm/tiny/st7571-i2c.c
+
 DRM DRIVER FOR SITRONIX ST7701 PANELS
 M:	Jagan Teki <jagan@amarulasolutions.com>
 S:	Maintained

-- 
2.49.0

