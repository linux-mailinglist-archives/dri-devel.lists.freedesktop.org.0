Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DEF9A19E88
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 07:48:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B15E510E402;
	Thu, 23 Jan 2025 06:48:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="lHVjuvR6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A1A810E3E4
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 06:48:14 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-2166f1e589cso12496335ad.3
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2025 22:48:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1737614894; x=1738219694; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SwfobZv33V/+FGTeVO+tPqefOOlFn7XlfW7hi3srQwo=;
 b=lHVjuvR6a5LpR6BOTZfo9q0YJ6t3+tUlFo6X0L6GX7TnacWpowE6LD6SYpxnXQEv4B
 bGrqae/6YDHZtTLvuEFhLw+FcWfcOe2OpyHmFqSTS0AKLsOgeV3aGs3k3s9UCGu6a4ed
 zBaRiHvSB5fiNK3MPvGlSm3CemnBL426r65+d+lPm/etrN/R7+35m6+H52eA9EW0S3wy
 GwW2qt8DvyCkUYDbtjqRDLxWBAJjCErZAe0kGjlx7mVEAQVkdzOjEU2u82LM4WlQDVXy
 gfAS/qD+RcSvRFf//J18DVAJ0oJnlD5eMpcjraxUvGQpsKYxwSCE8UVX/aINuEVzyGo5
 xkDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737614894; x=1738219694;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SwfobZv33V/+FGTeVO+tPqefOOlFn7XlfW7hi3srQwo=;
 b=iw2sLoSGEyzzYYE3QUPr1mvHSXQyLcIRWBnTrQW7bSgJbS6Ixme6/n+uC/4GgD5JB6
 +SM4jM8cUJ8/hYEKW/J02x+TixOU/eADw9pbs2CjdQK3MwDgasCiKIN0S+h6c1Dh7ZRF
 i8x6x7NUzh9ueCUzgHIULLGFN5+zkDLeLu7kul2/omTtyy4gm5uRqxxTliWLXQpc2pPT
 GRK7LIv7jot9wTtTHyPNV0SyHYWMHSH5uKaAUNDQoPS0XZ2faVz3ZQQvlupB9vWX49UL
 28SO0SZwTTd2nHAJ/qsL8GqOe2JGaridNOtDVnPvoLaczyJbazWgr0DaTENW8U/INm/T
 tiEw==
X-Gm-Message-State: AOJu0YyvR04PiE0Whd9zffLrV8oQJH0Eg7qxRXVeKzWJvw4UEZwMheri
 h17zUBZ5SrRTzHfbx30YVaDtcDbaLIymPX8G+3jCQqZwQoG+EPpxM20Fn7MmBPw=
X-Gm-Gg: ASbGncvtMUwTBDiq70XDmAtUWJ1V2dME3blKfpYmwQz8UvBa9ZXQIqAxP93xFs3HynD
 BUmnXpXe8Y/1G0pjgmDG1smjcotTKVG6gbXu/8yw3woTXCGq1TE4ahJiWToCRhQFhme+wTuJRx0
 EJKPPxF0YFZWOa6lEs+JDyTdmWnb5oQpt2vD4CfzfOmYFvWwfAKdbePJK4QOxl/Sp4rI2PaFijP
 IIXpggv1X3u4I/pN4sLRX9/5Gne56coksqnFRYvsS5xgNeVJzDdpJLled0q3Ry9IgF7qCLCQebj
 urFzDVaC76PlHsWAb6tbCihOOilY+bOcVUBc0WlwTs3O0hxb1dvy
X-Google-Smtp-Source: AGHT+IFPp2dMwLLh/TYt3tGZ1O1dzVlAuA9tHPAAVKT+k+MdfX9nDHobaViIokflFeDSPNaTq3oJyg==
X-Received: by 2002:a17:902:ec90:b0:216:3dc0:c8ab with SMTP id
 d9443c01a7336-21c3553b527mr340210705ad.9.1737614893777; 
 Wed, 22 Jan 2025 22:48:13 -0800 (PST)
Received: from dgp100339560-01.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-a9bcc323777sm11923454a12.20.2025.01.22.22.48.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2025 22:48:13 -0800 (PST)
From: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, thierry.reding@gmail.com, sam@ravnborg.org,
 dianders@chromium.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Subject: [PATCH v4 1/3] dt-bindings: display: panel: Add compatible for
 KD110N11-51IE and 2082109QFH040022-50E
Date: Thu, 23 Jan 2025 14:47:56 +0800
Message-Id: <20250123064758.743798-2-yelangyan@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250123064758.743798-1-yelangyan@huaqin.corp-partner.google.com>
References: <20250123064758.743798-1-yelangyan@huaqin.corp-partner.google.com>
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

KINGDISPLAY KD110N11-51IE and STARRY 2082109QFH040022-50E are
10.95-inch WUXGA TFT LCD panels, which fits in nicely with the
existing panel-boe-tv101wum-nl6 driver. Hence, we add a new
compatible with panel specific config.

Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
---
 .../devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml   | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml b/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
index 7a9f49e40e75..b740681605f8 100644
--- a/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
+++ b/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
@@ -30,8 +30,12 @@ properties:
       - boe,tv110c9m-ll3
         # INX HJ110IZ-01A 10.95" WUXGA TFT LCD panel
       - innolux,hj110iz-01a
+        # KINGDISPLAY KD110N11-51IE 10.95" WUXGA TFT LCD panel
+      - kingdisplay,kd110n11-51ie
         # STARRY 2081101QFH032011-53G 10.1" WUXGA TFT LCD panel
       - starry,2081101qfh032011-53g
+        # STARRY 2082109QFH040022-50E 10.95" WUXGA TFT LCD panel
+      - starry,2082109qfh040022-50e
         # STARRY ili9882t 10.51" WUXGA TFT LCD panel
       - starry,ili9882t
 
-- 
2.34.1

