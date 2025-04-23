Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC8EA98031
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 09:14:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C461110E413;
	Wed, 23 Apr 2025 07:14:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="chqtFyjr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5062110E401
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 07:14:05 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-54998f865b8so5705765e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 00:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745392444; x=1745997244; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=CS043yq9xeT5N+j80W3Qj8VmUZKpkG0gSF5km+PLc+4=;
 b=chqtFyjrjfTrA3mtBfhPx0CDZLaMEOLph75+Cr/ofLauHwzDX77PsKFl2W7glVR1Zc
 Axa8viAKoxYqowB///QpXafrLjiF20f//3LaT84bubed1WjQ4lULJLLpeFuhIjJYrpM8
 1uvf9CoYvwlFPKHmwTRu482uv3AYd8J9HqPOpk5cVzyBten5q+j+Dd9bMTIwhNDLf3uY
 oLjKOw16SO5SE8yY47Lep8EVzeBW+Bi68K+6t8o4sjBgbch1OzgVcLbqXSk8sRZKeeG5
 2mmdpGL+bWSiRJFmZwys8PdkTa3GxnyADMTsP09OfA2OedGhH6IhV9P7OUvzpotDug0G
 MCQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745392444; x=1745997244;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CS043yq9xeT5N+j80W3Qj8VmUZKpkG0gSF5km+PLc+4=;
 b=QnaLDy1OF6hERbssQjn3ZpOdbclDEeYSWmxWVTGPXgk2DRBFnm/MRIR0uJHLAMPacc
 ORMTpH9RwkU3Jy4AZP/cQBaTVMeIWX+J5hhp3biMBU6kDOu7EwFnUCMBjjk018bnRHKF
 b5gkpOtkjP6qixH1/FgWP7vXv/+laIEeJDUndKZLitsHLyapzpRqfWtaeiWH6uft4HH+
 yJ+ny5liMXzcFuDm1V/vDH0KZwiBbZqFFK5piYdfRT+CYhEmQ3cL/GxGyutkQelbbxWD
 Pxysz23n76d5H19egfzyOLydlG+Lvi/l23aPn2vhsISu+3WToSe49LuBJlc9fot+eTLu
 GWig==
X-Gm-Message-State: AOJu0YxnF0POpqEi9ByHFqWulS7JeS7JtaTudwY00gxboduY30DrGPPW
 RLECH+zJkLA8awEINCT5ry5dBxU6JHZhTnEsROJGDKaP8utVUdTo
X-Gm-Gg: ASbGnctcs3yykYYvk7Bm6m46GlbKRig2qaw8OxP9hibQBLkYa3Fd9NQ6XJX/iyPaqXI
 BzSXRZpJvWYLMVSEQbkrxDPD6Bk3pa7QVDhtKNBTjrlHj6iXA19ot6MgTT6NNDVsClGjuI/FSQ/
 txIUb5IOR1yo6JFi0oM0DZT8z9fqx8LGiDZBBH5AQqU6W4IWBhBBKi7CFyCcoFQAnvl1xYy5Bhf
 2wDUea/hDV3qE7zGIEV2JY/EGVQulMJ2mh6MlJaWaYPQZTA48tjm+TBEgsLM27P2KMLFRdHHEyl
 YiRdNVGa6qU3lI2fBiqq+9YyLwvDRx+j7/ZSBBegnrrDc8uESvuhtyB+kTydgm0HhyAuPZg0GO8
 ZNFtyw5LA
X-Google-Smtp-Source: AGHT+IEyI98Phb3rniHmM73Uu8VSgKzYaXjLamalkkwdXyf9bvMIpXbD1Szpz2ns61Lu7p1u7+g7Cw==
X-Received: by 2002:a05:6512:23a7:b0:549:9143:4e8d with SMTP id
 2adb3069b0e04-54d6e619328mr5210551e87.8.1745392443559; 
 Wed, 23 Apr 2025 00:14:03 -0700 (PDT)
Received: from [192.168.2.11] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54d6e524645sm1428793e87.41.2025.04.23.00.14.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Apr 2025 00:14:03 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Wed, 23 Apr 2025 09:13:35 +0200
Subject: [PATCH v5 3/3] MAINTAINERS: add entry for Sitronix ST7571 LCD
 Controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-st7571-v5-3-a283b752ad39@gmail.com>
References: <20250423-st7571-v5-0-a283b752ad39@gmail.com>
In-Reply-To: <20250423-st7571-v5-0-a283b752ad39@gmail.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>, 
 Javier Martinez Canillas <javierm@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1014;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=6LBQY25NY7FQEpotneIjhp4OHGl8ZaUBv37RRbI29rQ=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBoCJMxn/GFLKWU3PHRZuX3OOlRRF+mwRi8cUo3W
 2Hu8aVL6z+JAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaAiTMQAKCRCIgE5vWV1S
 MjnJD/9wGbZAs9KGO3yi2XO3ZfLlSYOMUwe8JpL7l2n5GBLEn7sScw3WOP4XJaKvhgPD/tCW+4c
 uJrrWvGdqr+vZIUn6vXnkzkFtQKVoW4YQhilyeV7+xZI97E8/ukIDpSvxSoyw8PEnh2v7GelBkj
 4SLEAJ9YJgXOGx9LImYvUGoyxmu0v4BuPCHwUmLQik8QuUXAMoAOMXr+wWFcakU1301GeLBoQ+x
 XNB8OkJENVmDrsm4ESK8flQntGzgwgeP5PAnr2AaLX7rd+YYM5if10QMilIt/MPVJWHJJdAO5oA
 o+YbAsE0H/ZjAsxhHx07vmXta4fr1RNv81vJUjIhbdmG3q1E3059b5FntJqUYeJU7VQ0Ab8uojD
 aH+zPxF/1kV2m3oSzdFtWk59SMBvkNLjhKmrDJ1zyIM/WetyaNzL5o40SoUQwugo2iAVc/XlV7M
 W/SM99As6M0AGrQmiySM/7q284hd/UclBvA0kKRFH0qslcWued2atzNHPmoyAbgJM9p0Y/3Fp/h
 kxLneJnUKgO3aFF6EvSxTmnY7t9w17xZ27tP0JxhEXDIyxLxVPKT3g2YBEoYEjttwIZEJIA9h0P
 mR6NSgqDwT+qUIkuBjKAxFLdFCf8fNFt+lF22jVKmpTnEY+XwHpTMyByZudFdnsY3flI8uZjwv0
 SVZr1Dr+Mj6eAzg==
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
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
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

