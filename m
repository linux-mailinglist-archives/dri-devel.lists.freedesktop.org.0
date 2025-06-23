Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C79AE3605
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 08:45:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52BC810E195;
	Mon, 23 Jun 2025 06:45:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fairphone.com header.i=@fairphone.com header.b="4dDZxYP2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67CE710E182
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 06:44:58 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-ade5ca8bc69so657723066b.0
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Jun 2025 23:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fairphone.com; s=fair; t=1750661097; x=1751265897; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=JCS5FhWMALYSCiWPAUtyrj6QhDfP/0lmNW3Nr7cvou0=;
 b=4dDZxYP2/10EmkRIDMTBG6JxREy2qj0raKy3lN7StECl0eAp06YOtn8iIwx3VuExRB
 h9YmGNixmu2jHd072GVDhZcTCxiA1qA5XBfc13wIiSoVU7S32m7Mmy+kM+foYxmKiHV5
 urxrbdri1S0HgOsJo81Dvuw+taRMjXeBFuomQ8beAcLMoUhLoCPMVf/TmGxF7BYx0pw2
 xYdjM/6g9kQMsbsV5FvzViRFIMmVMUVmjFrPvM/39xZKraVj4hZsoE3CW1I3DD1WMv1L
 dt4f4apJR4GctcfQcIYp/5fSpM5NFIN/jCiRsUaNrIfIN4ruQcs9Kt/glC9/JHNDUXHl
 Pt3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750661097; x=1751265897;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JCS5FhWMALYSCiWPAUtyrj6QhDfP/0lmNW3Nr7cvou0=;
 b=aczZonCCKaAAeJYZj3EBX/aUlwTZeFpJDGuQoJVunpfICFeZDc5sHq3/kz/LOxvSsq
 83qnw0OeoVe8VRTg30hUzLdIsZXWGN6V/F+YAzYJ6SMJ/jR03zEJ9jTiRWKdyYGEp6pP
 ek3KdNdbjiCzSeYMQTFXSr76Hnl6NprelUpvVOiUHcV0rO8Y2c0shNfQ5D4KgV9b1edF
 AYNO40wO6M8C4hUWgTyjtbZIONby9RlcPADUO8qrAdlILFrxq/4MIRbbTDWesC2aHHEm
 DrHIHYJI2J8C/COk89H5YxGIebynF2QlvLZa42+snmqcBhs9AcQ1hkS2wQBKX57ew41Z
 ILcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDELZMUlYnj6PVjSxxlICxKllOKvGoPyhU63mpGRLyjLNVdiwETe5Gd/HlEB00KFJ33jPXh3z+AMA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzFIe3dGaxPSrDqoXZtlBcXTt0/IjKAdGcL8C7+XqhW6CRTCS5W
 b2pHz3GqenVvwFIofAPSVvDQH5sDQUi2lsbGKESobuogRsW+7uACcxexlQ9lDYTTrS4=
X-Gm-Gg: ASbGncuXVZI4ECSgtRq2ng1rXuK4Q8wLiIJy1HOTaihnTFNJnKd0Seul+ietziQFOAP
 AU6Y3myD3uyRwkhLAHuC5Fi5So+Vcf6OZf3HGBeSd+OBBIrJ+Nf3DK05Cube0n8Up6uzkEMjnN6
 0Y3lZjtOnRcgp6fWAs6tb9fLqPTaWvOCKVD3a7LM9olTSD/2SExdal8FMa1O0TXomFKCJEGABDj
 hDJWRDEIqxzVVl2DCN5CchaPw5Zt9KD+vSNfBc5+08xyOOVlRdCxZLiK3vc6FPlTl20ccIYDNJZ
 0h3OMkHf9Cl64I6MKRdmmjbFk56owx+0N6oUiOjXVAy3SXapZqbXa7s61z8AJDJzXPznkxwaVFX
 omezom+NLqLs7szb/KyH9umpaxRbf5nSy
X-Google-Smtp-Source: AGHT+IGsh9xvJEArfar+Dr0uRl16EBYyKnUhy6OWWKR/qb5aCazP3FzJZEQo/dxm9nUzIFyPy5Bewg==
X-Received: by 2002:a17:907:d8f:b0:ad8:8c09:a51a with SMTP id
 a640c23a62f3a-ae0578f5642mr1122704566b.4.1750661096907; 
 Sun, 22 Jun 2025 23:44:56 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl.
 [144.178.202.138]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae053ee4ce9sm659258266b.69.2025.06.22.23.44.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Jun 2025 23:44:56 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Mon, 23 Jun 2025 08:44:45 +0200
Subject: [PATCH v2 1/5] dt-bindings: display: simple-framebuffer: Add
 interconnects property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250623-simple-drm-fb-icc-v2-1-f69b86cd3d7d@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750661095; l=1141;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=P/y3z3w1bngNRTUAIAgXINyaHlzNiSUuhAN9U3zpOWw=;
 b=6pjVbQkuIUa2qv2HWVS78fdybrtLmM+hDbK9+CQFefqu+4O7IH7z+Lx0F9v1sVHODRyMqXBxS
 7Wh2+Zt4EiKC+fvVHgIMp5BhnDBPnUj+x9vrujCz05xSnU29wMieOM9
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

Document the interconnects property which is a list of interconnect
paths that is used by the framebuffer and therefore needs to be kept
alive when the framebuffer is being used.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/display/simple-framebuffer.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/simple-framebuffer.yaml b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
index 296500f9da05e296dbbeec50ba5186b6b30aaffc..f0fa0ef23d91043dfb2b220c654b80e2e80850cd 100644
--- a/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
+++ b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
@@ -79,6 +79,9 @@ properties:
   power-domains:
     description: List of power domains used by the framebuffer.
 
+  interconnects:
+    description: List of interconnect paths used by the framebuffer.
+
   width:
     $ref: /schemas/types.yaml#/definitions/uint32
     description: Width of the framebuffer in pixels

-- 
2.50.0

