Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6171AD14C8
	for <lists+dri-devel@lfdr.de>; Sun,  8 Jun 2025 23:44:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA03A10ED5C;
	Sun,  8 Jun 2025 21:44:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WSRSgou1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46B2310E306
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jun 2025 11:46:51 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-3a365a6804eso1353854f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Jun 2025 04:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749210409; x=1749815209; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Iq7te4M6ksKrUogTjln81xegJnlcm6VPFCDyWm1hQ3Q=;
 b=WSRSgou1/YHv0kpM+FM548oPSc142PENKAFDu9zHAxrbYHtQTlOX89zhgwqDkrGuBg
 du/udbGxQ7DepEh5y8jDerZeUekwqY75MYUn1eQuQo34njb69owxyCgVm1s3bqxOfrIo
 U95+l35mzJDlcMosVz2Ve3weiHOQ9PGu0xFaVS/f2qKjeey8rWMPY3KDlkU67/wHrHuf
 nl+1JeUmOFTVS+kyfqYRsZ+zH6rrDH+2V2Z+GeohbNpNUPJu5IuosmYkmk/u+z+rKxAX
 9yRFBQvFb3uAxF6LZFbM+2kf9mJ6xFlMZggjWZ0ZUvIiqBPDxgdEGi9W5AdfcOkyosh7
 whuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749210409; x=1749815209;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Iq7te4M6ksKrUogTjln81xegJnlcm6VPFCDyWm1hQ3Q=;
 b=MCvXcohNurAkY3BwESO3h6bN7sX/ctw4AowTgWF/WorHmcaW9Y/ObKpoSk1zCWMwcX
 /oDDVHfyGLIqpn76y6W84uFadgy4IVX4pqY+NZr3wRZCB0RLzCwVMxYNBlAYRnfZa3Q7
 PoBR3IR4NJRX3O24KIUFw8/INa0T+XjuZ4/iUhUvY23IxapUs/ALKD1taKVYyU5CbUIg
 xiW9Fdwhhu2ZJqo46raWbKCuDBm4MDY6azNZTSKs/WqOLK1iQvCEmT0yuE9/2h0bB0XD
 Bay24bt25R6XTiQGtmfFxr299YGdh1M6ZXBRrIul3v3KZlWyE2rsbNM2RbWXsVnY0+Nh
 5RIg==
X-Gm-Message-State: AOJu0Ywec51xRcIpXWm0/btU11nX2okGyFkq2VxBw88Ury6wzXdrP8Kp
 e3H1BBQ8h7zv/TBFMMqIh9xGfacEnOCPR0cpmS4nhPyLUFxIhRbWwEcf
X-Gm-Gg: ASbGncsw+8PgIU0qz0z65qHIRgveR7pc6pNhS06JMrRhhwsBfWyQM16CBPRJH72C33k
 qudbaDz4p1tBbV/XH0m7yF74kuQ5v1d1vznLlVbYUuw3gxDaidRx9kUiRAdcWVxsIj06a4aiMlz
 HuXFYFMzEya/I9ViZugsq7XmHu+cdsKO63lJ1hA3GymMUVIU9IezWLUw7YM2/EgdcQav+tbJ6jZ
 Oz7K5LLdlexly1fQCha8RsBQ72ZC9C9TeVrb2yn/kuFQXmn6vQhNAW5KlKOoxAovCZkut+AJ3k2
 OHYn0u/2LCfKk1Om/aFw//kPFMwm2jtxkQ3ewWlc5zn1fPk3DG/4l7zV
X-Google-Smtp-Source: AGHT+IHIwxY+2Gv+A3gO0jvWkNwzl5joDzwEBMVaga7g/Sim5ajXaO+xhytKcBVI7iEzcoAbo/MoDA==
X-Received: by 2002:a05:6000:2088:b0:3a5:2cb5:63fa with SMTP id
 ffacd0b85a97d-3a5319b4c74mr2219624f8f.2.1749210408898; 
 Fri, 06 Jun 2025 04:46:48 -0700 (PDT)
Received: from eichest-laptop.lan ([2a02:168:af72:0:4223:e58c:4c9a:459b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a532464e7fsm1630480f8f.96.2025.06.06.04.46.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jun 2025 04:46:48 -0700 (PDT)
From: Stefan Eichenberger <eichest@gmail.com>
To: jagan@amarulasolutions.com, neil.armstrong@linaro.org,
 quic_jesszhan@quicinc.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] dt-bindings: display: st7701: Add Winstar
 wf40eswaa6mnn0 panel
Date: Fri,  6 Jun 2025 13:45:51 +0200
Message-ID: <20250606114644.105371-3-eichest@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250606114644.105371-1-eichest@gmail.com>
References: <20250606114644.105371-1-eichest@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 08 Jun 2025 21:44:43 +0000
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

The Winstar wf40eswaa6mnn0 panel is a square 4.0" TFT LCD with a
resolution of 480x480 pixels.

Signed-off-by: Stefan Eichenberger <eichest@gmail.com>
---
 .../devicetree/bindings/display/panel/sitronix,st7701.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml b/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml
index b07f3eca669bf..1e434240ea3f6 100644
--- a/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml
+++ b/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml
@@ -29,6 +29,7 @@ properties:
           - densitron,dmt028vghmcmi-1a
           - elida,kd50t048a
           - techstar,ts8550b
+          - winstar,wf40eswaa6mnn0
       - const: sitronix,st7701
 
   reg:
-- 
2.48.1

