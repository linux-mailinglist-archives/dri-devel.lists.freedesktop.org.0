Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D532AE3602
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 08:45:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 489B510E194;
	Mon, 23 Jun 2025 06:45:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fairphone.com header.i=@fairphone.com header.b="y9vNCSjb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 424A810E182
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 06:44:59 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-6077d0b9bbeso6361259a12.3
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Jun 2025 23:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fairphone.com; s=fair; t=1750661098; x=1751265898; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=vbu48gx7NEhId69+qzMyPOiXCZJK31FbL3aO14F5yf4=;
 b=y9vNCSjb4ACm8UNvXGmrh6N0rmPjLRx14lY+Hh+Wy4c4jvF1HTFRKUc/qctswvm/3+
 zmBOZTg09wWa8Ute3Rb84rydTLnMw7ofsWeLycZqHDBrY4MQg2YEUjGGTtbj/WgTf93B
 zepQIPRPX9uA8ncsPClFw16oah0w+SERnqxPI704FZr8LQbsCNHavijksIJdry6HBBgK
 kApbvR+yB5wzWe6I8YQhqA8gGkEH6g0gOJvvlyOiqJM8h2v/+pxNLIPK+9vP2Pz39G1e
 aHQqVhxK2d95U1nELG1lSFaQIhYadsUZeaICWKEzrHPe3ig9hDRKHVYn1abir7KYly7o
 n3gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750661098; x=1751265898;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vbu48gx7NEhId69+qzMyPOiXCZJK31FbL3aO14F5yf4=;
 b=SESYvHp6/ujh9Q+GLSWj9c4Qre78u4ZOPLfNgrMBWchJ+yVpdv+LXAHYR/Hx6Hbfsh
 3BeAiMit15vg75G3quw+jkq37k9T7biuTomToB+2evYXIlURWvlxofNuOo10c0lBD0Pr
 KTGusG2XaHkGoxcl5fVF+nQP36ccZdQ3hXUU7HlmzVVyM2EU7B3BDyMOJNqy2S45UY8F
 4MtXO8WdNFO4C68YAvmN8xD/CnqmKwypV3570APXw8bsd05XkO2YviMOioIhietJsrW3
 YzIJKA7Ta9lIITU6UNHR8wzYVn7F1JHXPkcu+GDIJLzf++9eZlAwtW/aEQiJUCw5J/KV
 4dvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0UYBZNOHClRhi4PPE2YxW6uu11DGQf6sgrmmsAE7C1hw8QbviioWxiiYqZ0v7Ej/vq1IYyMACSRo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzzWUWalPQ2cOGjUU5yuY7/cBSUTZbebHDAQdBFdvNjmLhXRAYc
 S4rMu4OpjbU/hvY460Xeqs3zByxcAGb0emaqt3SCG3+GVhyOC3SiAO6MDxMkgW16728=
X-Gm-Gg: ASbGncsbe5HULp5iID8HUIVLDCOpau9F4DiOomi1OyvF8IIowR5inGL/SBozxKY02ek
 mUqAsqDJd535h+m8+dL7f7guQ/7IBXBdQwYt/whsY2cP3jZPFWnjUlsllRthucRB2t3oPA4RG+L
 viimgNe5fsrQ6k/hEnF7Uf5GSQrAYsdPC3WRzyiuRJweqP9JlMCbAWTwpG/izEIctOw6Z8caSAe
 LzMdprEkOPe54maoEa39dwcmu7GQbMhActA8UK42evdMRpmJA9e+fXGs9ZSuBdQcCPviXE3aO47
 Q/Q8ykLiOS19nQXrw9I2uq3jHOjV3iMZbGzMwFEcY7bgp5JHsEOvutFgUM1ceky4clI4ylS7SUq
 oFCioPLzXAPZxsbtoz4f8dShyc7HXm8wy
X-Google-Smtp-Source: AGHT+IEOzTOG7c7R00rqnL+INk5sjS4mj52ZR4xU1BeF+DiFIb5jKd4us01mqAW9xyhdkYM3Dd47pg==
X-Received: by 2002:a17:907:fd87:b0:ae0:6283:5d58 with SMTP id
 a640c23a62f3a-ae062835e1emr846280766b.1.1750661097735; 
 Sun, 22 Jun 2025 23:44:57 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl.
 [144.178.202.138]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae053ee4ce9sm659258266b.69.2025.06.22.23.44.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Jun 2025 23:44:57 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Mon, 23 Jun 2025 08:44:46 +0200
Subject: [PATCH v2 2/5] drm/sysfb: simpledrm: Sort headers correctly
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250623-simple-drm-fb-icc-v2-2-f69b86cd3d7d@fairphone.com>
References: <20250623-simple-drm-fb-icc-v2-0-f69b86cd3d7d@fairphone.com>
In-Reply-To: <20250623-simple-drm-fb-icc-v2-0-f69b86cd3d7d@fairphone.com>
To: Hans de Goede <hdegoede@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>, Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750661095; l=812;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=D5wB8GTFVDuCJiFhGrONiRmhnC4J1aRZ8kfkMi+2S7c=;
 b=NmoLdHl/zy8/Ccu5xTGjwDXOdaQQcr3O/5YtL18RtixZv928CEKzL1gkps+b4W6pfu7E3uThf
 DcKk9lC2NhrC1nEiqi8avoRWgJ/zlM71+o1oVF8JKPfU6UAHI/If7RX
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
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

Make sure the headers are sorted alphabetically to ensure consistent
code.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/gpu/drm/sysfb/simpledrm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sysfb/simpledrm.c b/drivers/gpu/drm/sysfb/simpledrm.c
index a1c3119330deffc9e122b83941f3697e5b87f277..349219330314e3421a6bb26ad5cf39a679a5cb7a 100644
--- a/drivers/gpu/drm/sysfb/simpledrm.c
+++ b/drivers/gpu/drm/sysfb/simpledrm.c
@@ -2,9 +2,9 @@
 
 #include <linux/aperture.h>
 #include <linux/clk.h>
-#include <linux/of_clk.h>
 #include <linux/minmax.h>
 #include <linux/of_address.h>
+#include <linux/of_clk.h>
 #include <linux/platform_data/simplefb.h>
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>

-- 
2.50.0

