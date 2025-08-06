Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CBE3B1D313
	for <lists+dri-devel@lfdr.de>; Thu,  7 Aug 2025 09:13:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EE8910E7EC;
	Thu,  7 Aug 2025 07:13:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CwNbhXqg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50BF410E28D
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Aug 2025 12:48:26 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-3b7961cf660so5481796f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Aug 2025 05:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754484505; x=1755089305; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=h6ZoVWUi0mbYvISDXeGEuG7qHw/hvGQuxorTcLyCsEQ=;
 b=CwNbhXqg8+QjNEAMDWKkVr3Uf9JeCqlGSel5at1y94it/7zyW+E8dVqmCmh2cgddxz
 AG/icafEXuuyYb5XssOcuo1fmUnBE+s3oNkqPUwcfflx5ZonaDJzx6j6Wua00khQ37OC
 9dgZSh0DM9dNHdHIt0mGq+AZ/Gt6YPs7AuX09I/PEC5GtBUObK1CZai2rNAnrA+RX/Zh
 Sxrl5Wc2HBaU94WeXiY9mIVitLSmhhJQ0Tr+6xjpOfOyznPnS7epftjA9FCE9mRY6KRC
 dMV5aHoVAG4s1IEldrkYpBlQOubV4ITtu/PkOwSjG6VLfZhq4/TiT9Zc8itXYg7qin3M
 bYcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754484505; x=1755089305;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h6ZoVWUi0mbYvISDXeGEuG7qHw/hvGQuxorTcLyCsEQ=;
 b=jhFYLg2uSpecgAG/P1Zu4O9iG/8T6WkbrQzgYoy6ltpppsHv1I1P8cM3kPxNVRX6Ag
 fxUMV6qfk17kIDGm/zxzRY7eRfU3Aj28sqkRd6l87oTvacaMw6Gim32r+SQCGWOXbI9L
 9b0+gjj26twpyD27C7t5xbo3QyHgmzSnLCvIOQd8GURQ3cz00m76NM8Z1jN4rhi2+G7u
 7WBK5dUotMM45fqIIlLdos7DKOki+QxGcs+nzrPPJb5DKjEloJGK1TwqRyl0nX1gmvcr
 40esavaTMinxvkhUc2daJ3acMT/R+6fQ8pttsfNxEmB+BhDd6AlQr/RIvNBqijZMWCkR
 /+Ww==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqhwxuuEfOtFWsR4FiOarfSESn3qsmVyGfk+LRGLN6e8zckxDTot5kDjVFB0882CCutYFux+Jd1E0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyhU+rh4ZWJJj7MAslgVJTfDaoFNJkqvuKGISpgFkr/3XesimB2
 QTd4UPJo1QpF57U+dbnBGcX0nBzgb2pTR7J13FSbwhVJ+T705BcK5dPS
X-Gm-Gg: ASbGncsnMtdeI/ZHGbnnKcw4dd+5RYmgDylDmWr7zZj4Xknhjomk4+giM2ak8hPkhUB
 XVbL5TDPgImHMaXm4V0SQrgHQYahsZP1nHFnDqTXQ2FBiN0v8QJwPDASx0qayROk4w4rPRcXHib
 NNhiIMdvukj0ah01ybm5idiCf6xwzXoiNKGKzGUN7V7OKR2RxSMep6gCBL7hSmvfAlnk2mAspBx
 cvrZVO83orduRhr4BltHktv4uUJ683jpYYutdnZnPcY0QTPe47idCb33Fz46IPCkHSM11I4I2ic
 CGxDyKwMBnQghmb5p2nUdFC2kBki5duiCyApuzSQfSH4VzyzkBkZOG7nzw+u+Jt5A9/RgLQzfa6
 Oiojqu8T4SQM4MWWsm05lMl7qvL+ypr2AsU7/ODV5Zke3VH8aWhcdyOCuC6yi4iq/
X-Google-Smtp-Source: AGHT+IFF8zdXOoNmcjXgHZMPyq4WgiA452mu+C2vn8zmOBgjSQgzIx5YlyDMYhd821Zkj/obFIPOpg==
X-Received: by 2002:a05:6000:4029:b0:3b7:dd87:d741 with SMTP id
 ffacd0b85a97d-3b8f4927443mr2082165f8f.42.1754484504562; 
 Wed, 06 Aug 2025 05:48:24 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([91.116.162.236])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458be70c5f7sm170110045e9.26.2025.08.06.05.48.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Aug 2025 05:48:24 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Wed, 06 Aug 2025 14:48:11 +0200
Subject: [PATCH 3/3] MAINTAINERS: Add entry for Sitronix ST7920 driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250806-st7920-v1-3-64ab5a34f9a0@gmail.com>
References: <20250806-st7920-v1-0-64ab5a34f9a0@gmail.com>
In-Reply-To: <20250806-st7920-v1-0-64ab5a34f9a0@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Iker Pedrosa <ikerpedrosam@gmail.com>
X-Mailer: b4 0.14.2
X-Mailman-Approved-At: Thu, 07 Aug 2025 07:13:37 +0000
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

Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5ddf37f0acc960039422ef988cadfa7176972fc5..79b8a277e38b55ebcff05450d6c565c0d87c6b51 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7861,6 +7861,13 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/sitronix,st7735r.yaml
 F:	drivers/gpu/drm/sitronix/st7735r.c
 
+DRM DRIVER FOR SITRONIX ST7920 LCD DISPLAYS
+M:	Iker Pedrosa <ikerpedrosam@gmail.com>
+S:	Maintained
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	Documentation/devicetree/bindings/display/sitronix,st7920.yaml
+F:	drivers/gpu/drm/sitronix/st7920.c
+
 DRM DRIVER FOR SOLOMON SSD130X OLED DISPLAYS
 M:	Javier Martinez Canillas <javierm@redhat.com>
 S:	Maintained

-- 
2.50.1

