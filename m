Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74052B038A0
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 10:04:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 369C910E416;
	Mon, 14 Jul 2025 08:04:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="O6ItvwQF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9018010E416
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 08:04:38 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-553be4d2fbfso4538030e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 01:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752480277; x=1753085077; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=B9GGTSztthPX9RjXgUnWoKPJH6hGe57hUvqPeJEkExw=;
 b=O6ItvwQFXfYOF4VQ2zVByvhj2/u7eKBam1a6ADMHXdvWEZ3kN4YKet4GBN5z+Ydg6t
 F1+/1nI6TJsLUB3u6F9w/e4NXq+o6Cju52WWfDBxoYPi0iuHsGQLmj2JlkMzOjG+fKXU
 RvJJKEi1ABUMtJzqMnNVhn13EN1rcI+l3k9jcV8maPEKGdYHoNl6oYLydAAy4/d5Iais
 5VFGWocUnVyZgigonclbVYj3cJjSMZTFUJ0+J60t2f8yhzExGbHAML3oYxGLZFFhfybx
 gtDZnMelxCbtH7v6cTinsHSx1I/PK3KU9wLAKRx1x7ubDavhlmhdG5OBLwn0WHnIeLxL
 UG7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752480277; x=1753085077;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B9GGTSztthPX9RjXgUnWoKPJH6hGe57hUvqPeJEkExw=;
 b=Cb6BoyYPE0zBSITeRGN3+u+qj9T8UMcmYrewKkkPNgpTuJry1IjUKSEB2+OrrSqxac
 Uxs1TyixMvCUXw5Ao0X0X8MsLxHm0lc1ofVPsdrJhuLIyWKqE3Rdxi+cIXprKNn34RxS
 4i//kIXLauboP1CX0wfiZFes55P6Ha9aa13YbKtuDIdeMPx5Ouk1iDCbv8rdm+Y7OqsD
 O5svN6Ia2+FXFYEDbxXBYiU+LG6W48SrlB4/V0X0ZtBBFYQsl8hr3HAiQnxQDXEWBKEc
 d36RAHjn2vPtZcxdjtXt//IP0qIQdZUL5mGuattR1E11YKeuJWyR1tdGV9nzrZTgtVDm
 TT7A==
X-Gm-Message-State: AOJu0Yz/O0eBSQXqV5GTOXlkr9eChLulqgVi5R5d1wxnd1O111kQn8z9
 49UtaCGFaFhEPTZ9O4ue/C5N/bZ4TYWNHvBI5FZ1ccU34CQCWotyt5Fs
X-Gm-Gg: ASbGnct1ZU1yvXWHXTUJuzlfBPMWujvRAshnruwnNRxdkVRr5eCuZvUXbND5dFIzRbb
 yy8wHEAz+t4M6XASACBQ8uxmYZG18PnkoVEdJXQ0pU6gDgVUtMkiINu8BGr+lSPD5nFzfJmmpp4
 Mx7U78ZRDx15kXGFNaPNWmWT28mkfWvbvkkssDc1eoZsiKrx+L4MhMt9UeuDyouPjwC3Ry/x5Ge
 +GRPr9QJWtMJVo2wWseHkiznCsCguEii6ND2flgCYadFGukPD3F+rv+gefQv4PNRh81eBWtTIgl
 10Lz+8qg6sOQsPKp4m2SvpU/SCSh0Yj4nVbXw0pNWEyC9Rk5jbVkbuviOuvN9iuFrm2MchRbCM6
 JvJQGAvqjA1yh6doi2SoR7W2DPWMrQZQ4CNWwCL4BxJyv2hw8Cj97sGtR2GGe4tvVWFw=
X-Google-Smtp-Source: AGHT+IG3FjnhooHqlt3ucCpOZF7GxfsZEIc9G4pFe0tKlk9LOep+bdnRRtjfBZr1RODnwJKZWhsU2g==
X-Received: by 2002:a05:6512:32c6:b0:553:2def:1ae8 with SMTP id
 2adb3069b0e04-55a04609b20mr3587657e87.30.1752480276593; 
 Mon, 14 Jul 2025 01:04:36 -0700 (PDT)
Received: from [192.168.1.198] (83-233-6-197.cust.bredband2.com.
 [83.233.6.197]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55943b6c08esm1864385e87.187.2025.07.14.01.04.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 01:04:36 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon, 14 Jul 2025 10:04:01 +0200
Subject: [PATCH 3/5] drm/st7571-i2c: add support inverted pixel format
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250714-st7571-format-v1-3-a27e5112baff@gmail.com>
References: <20250714-st7571-format-v1-0-a27e5112baff@gmail.com>
In-Reply-To: <20250714-st7571-format-v1-0-a27e5112baff@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1681;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=nKfuyWks/Dpzizjd9fHnZs7Z2hrno+oTXUBiw5zduxE=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBodLoAG2jgkwWTSyu2OAKveT8gTVJB/txNKVHU+
 0nUy0hNL9qJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaHS6AAAKCRCIgE5vWV1S
 MricD/4nwH7czcMqAZ8egg5+wPkfzZojgNpJ0vpw9f2C1QUKSbImn7pakYeNLXzirNnzD4ESh+c
 gRs7gnOvNfQZrlngleXgqdPPskryz8IGNuWrA0Hb0wTeB1BrJ75aEbxpnzr6zF3zKrrrOQ/vnbK
 uOW6IaE+TiJ+pPjQ/R5EMoMzvrAmtSEjHA57psyKBfOI2j92zLtYL3n/eaQEVa2oC+2ldRyieoP
 VTj6VIHcB/sv60o/3sNxTbiCT+qLkv1qrok/StbL8AHX/nCg/jwEJjXKe860UYkkm/NQAoDw+A9
 zIHQOUIPqA4yvUCy0PncpUM0X39YreAv2jtgonYakTZ+FhdMOtUUMpJjaoSC4qQsczV8TLq/NEb
 bnwBkc7igs2iizEo1RGns5OMzpE/E78YZADddn2F6qRO/WCeAEjFaqMUPtlxPy06P54GYWaDkgY
 gF9I+Jt8d6tQgVEnQ98d1vP3wVPxVzN5ZUnK4IN2nX+rcELocu1KLu0yAqXwn+7/K874SX0+GyX
 6Cvt23K316jduhtNv5piDyZxP4/XeDKPy6iKlRawHst8e1wFM7svM9JvkTqRXOJbDQxggPn9iVB
 C/cTeTDESc0LlQqtAU7mU7Dk174TGRM+z44xfrFVqItqkN6mK/D7y4ygO6eEAh4rt9YxNtdEEL/
 hQ0v8fVckWk+h0w==
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

Depending on which display that is connected to the controller, an
"1" means either a black or a white pixel.

The supported formats (R1/R2/XRGB8888) expects the pixels
to map against (4bit):
    00 => Black
    01 => Dark Gray
    10 => Light Gray
    11 => White

If this is not what the display map against, make it possible to invert
the pixels.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 drivers/gpu/drm/sitronix/st7571-i2c.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sitronix/st7571-i2c.c b/drivers/gpu/drm/sitronix/st7571-i2c.c
index 3024c94c890497d1ddbbf0f7f81ec4664f48d580..6a5d719f8b0044ec700ff119972b580c904ffb27 100644
--- a/drivers/gpu/drm/sitronix/st7571-i2c.c
+++ b/drivers/gpu/drm/sitronix/st7571-i2c.c
@@ -147,6 +147,7 @@ struct st7571_device {
 	bool ignore_nak;
 
 	bool grayscale;
+	bool inverted;
 	u32 height_mm;
 	u32 width_mm;
 	u32 startline;
@@ -789,6 +790,7 @@ static int st7571_parse_dt(struct st7571_device *st7571)
 	of_property_read_u32(np, "width-mm", &st7571->width_mm);
 	of_property_read_u32(np, "height-mm", &st7571->height_mm);
 	st7571->grayscale = of_property_read_bool(np, "sitronix,grayscale");
+	st7571->inverted = of_property_read_bool(np, "sitronix,inverted");
 
 	if (st7571->grayscale) {
 		st7571->pformat = &st7571_grayscale;
@@ -853,7 +855,7 @@ static int st7571_lcd_init(struct st7571_device *st7571)
 		ST7571_SET_COLOR_MODE(st7571->pformat->mode),
 		ST7571_COMMAND_SET_NORMAL,
 
-		ST7571_SET_REVERSE(0),
+		ST7571_SET_REVERSE(st7571->inverted ? 1 : 0),
 		ST7571_SET_ENTIRE_DISPLAY_ON(0),
 	};
 

-- 
2.49.0

