Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB93A99843
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 21:04:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD10510E24A;
	Wed, 23 Apr 2025 19:03:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RlXghq8x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A011810E23F
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 19:03:50 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-30db1bc464dso2867711fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 12:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745435029; x=1746039829; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=7LuhtW5tfnv74ISfwTqYLQ3czllGmI8LVC1e0ZexWu8=;
 b=RlXghq8x5NOtELzCxsLo5tS6/ir3WGQdy2ZI9Jx2eauSzHItLNWetRFfg8x8ZS4doO
 1dWqcMVrxN2dEJv3kAqn8B1ROUe957/RZTmLaZPIFzIL8CY6/hGxuVUkVMKKXFadMyn9
 QhjrP4Go4lBJcAMxLKMr5Owvg46bkBGfTj669sXfht1Te5EoSV+16FsdJcQc8S+EcQkw
 TtZGoaEu8k7LrufgJItH5kNdSggQtGXVQqOwrB1T+119JCl1InLB3DZj2wp6jmeH+VN8
 cbSxsvVcLZGCWdOvZ50aF+Fnw/U0YCA6GKZXrJhz7FwwjaPv/Fdzbprk1/2XoVYn7dEc
 iQYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745435029; x=1746039829;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7LuhtW5tfnv74ISfwTqYLQ3czllGmI8LVC1e0ZexWu8=;
 b=qmjAms8LHnmPW5deQ0DBQlgmKKObVXSL6VPvZOkV58t2LJ/VhZy9G/SMTJY83/4P77
 COUHBBPCA7xyPQOxVS6DvokFWsnyMbXWx+pH4FsQF7ZeYl783QZSet/MBvHxBlUc/Hlr
 SVqpYO0KAJ5XoHL99eGuhT6nDdKfsUXva7LZK5Qjr0GxXg+qiaxPlqf7YiE18LtUBkPS
 y0jLpyvAbPGy8oEUC8H5dvV8VO6MuwA1eC0LbPV1a8zqSI7piO3k9mdCZVyuGM+icjOR
 B8zbRzHQYFlzBfZXV8ny+Q/p3b6wcpOa5CYGhIOVWYrQ6PjGTIX1FOTkXdF6uKyZpeld
 J0Cw==
X-Gm-Message-State: AOJu0YwGFGx/TYotM2zfE2p9j3hmW6T9/+w3cMOA0eCts+NPiRRe5xYH
 /xS4Nqdhpq3ajy+46IQCzT7RgIqSEyac4CvayYxkMaRpvyWVPSj8jCjqDC9icXg=
X-Gm-Gg: ASbGncubHMevXcLohqrfHxhI+0SaHo3AltArn2yAzR8eUompbwqCTRV9Jufz4eVlIXT
 CIk8s3IE1G4SJLAi8kEZnjmEQ8tseGFI4p8UFhAV8A4mJdySoQtgJFjEmbWiEJeOOgXIEOF94ib
 WPi00tZIy8nLc7BEn0CcX9yq+Zbq1FRwyLb+R0WTFlgLzM7qME5CYF5oBogxG8XcHVCd147Y3K6
 ejOeg4/WEBiTulsRsjcRgZkVL8owzUJOjnDcrx3Ok5kpNxyZVVA+DT/PCnJGuUrisGqMJN73oo9
 vAixoO/jFrAUMb3rfEnV1XPYchkYJxQMJJOKFFbmiMA3nmGKXIntSLdLwUVQRe1XuKg1dpCLVou
 m9is9lXLU
X-Google-Smtp-Source: AGHT+IGMbEsjVQru0dx5wwlUTch0T9ZdZNISzut3C5NNKy3xvn8oL2J1bLuI35icszl9MyIYEtlSkg==
X-Received: by 2002:a05:651c:242:b0:310:8258:c09f with SMTP id
 38308e7fff4ca-3179facac43mr325291fa.26.1745435028622; 
 Wed, 23 Apr 2025 12:03:48 -0700 (PDT)
Received: from [192.168.1.11] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3109084d9d0sm19475141fa.97.2025.04.23.12.03.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Apr 2025 12:03:47 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Wed, 23 Apr 2025 21:03:22 +0200
Subject: [PATCH v6 3/3] MAINTAINERS: add entry for Sitronix ST7571 LCD
 Controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-st7571-v6-3-e9519e3c4ec4@gmail.com>
References: <20250423-st7571-v6-0-e9519e3c4ec4@gmail.com>
In-Reply-To: <20250423-st7571-v6-0-e9519e3c4ec4@gmail.com>
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
 bh=xiAk+ddYinxUgC9Hz4BM5RvVJX8mskoni8HwaHWzwjg=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBoCTmJzO7f1FM50qHzchOePigynZ6h4tldEcHZT
 pucZGMIZ9KJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaAk5iQAKCRCIgE5vWV1S
 MnO/D/0QIfSBBND3WCKgBt9NAphpk4C8PUpI/FuAsIH+cSRoeLmswfuINaDDP62Dh/zgSs5N0yy
 4gfcs5eKnF2VFLHzTo4O9JUmbTj/AYD4BW+oYTg5SVAIn2KStcNFP5BsqXkU5GKLX25TKaBYbbJ
 g/+D0q6Sy6dhlHVXyNEGRhMBJur6635+4Eo86Oz9kF1tO/Sl0giRCtY5/tH2f40TMnhp48Kjo9A
 IQfUKPp+qoKOU4OSI3ei6IDEiWhg7eULVEj2sjbNUUE7HYmZDQA/p43dGLM3XsK9x+achvTp9nR
 2pdDw2F2lcrzYpT+JJi5WBhZNZf0t44xi5rugRFabIQh6ycIMHRHm5q99JdYI4tgVY7Dm+sgjxd
 JlCPBPD4o+Hn810j6Zkh0y2m2pVOoe0EG3BiIfvD5waTnU4MIVDg1TUGHVFMOXH/7nMN8SiG84s
 n46YAIUxTQGINeAc0z3kV8Cn1ivAphHfGB0HqaCVSPOSsYD3ssr6SeP84+R0gJbb/acyukYveIm
 s1AhjZv+sCnYwRvvvCbbLhVXmCRfeUZYz3plzbmIKUT064ecJGP0R+uczOfwc27HIGhg1GqnP5K
 pvap3cJIWh7QuJKtT2WzCbX+6MnX1Q6DjCWsf09NprvxkdwtBQoK7zDvWCY8Ce/WWoPV6+nZNn4
 27MLGZ9RisY3llg==
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
index 251b1f3d0e9225f79fb500f563f35a21510090c6..81b81cc68ca2482f2965b801693ff8a43bbf2053 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7682,6 +7682,12 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
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

