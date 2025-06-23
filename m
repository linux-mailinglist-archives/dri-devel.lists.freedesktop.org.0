Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E76AE35FD
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 08:45:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 437B210E192;
	Mon, 23 Jun 2025 06:44:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fairphone.com header.i=@fairphone.com header.b="WNXV29VV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABD3E10E182
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 06:44:57 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-ad891bb0957so696370266b.3
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Jun 2025 23:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fairphone.com; s=fair; t=1750661096; x=1751265896; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Rfv2PMTDIceIpvbq9xZVeanT080dZzydc/UXVnCEv1g=;
 b=WNXV29VV54xdG0JmQCtv9CKchSwhddC53xroeGqoVnXdNfc4MoMDUNdGltRbCg2Pz1
 Th3O+JMFpHtVtbj1eXbebRIcXpacnubbFffnfQvjI5wRQ5sIscVe2eGN759MN8mGLy+r
 KnHNoOG+uPI2PE2R7Mfgsf0z0Fg2hWUCea4xyxoUap9oTZiMR8L/1rBXUdHmzFVW/I75
 8sjfHkE1/JOAMCNbFPxUga3hM0PGpmD3vHyRpVlsYoTnQPPQkbLKBLyNTAeImEqTaGWi
 gciOgZPBdvoSs1vFcErWnuKl6nTMFusdDAL3zuZtownluElhhY6MhUpex9gCrLj/doHb
 r4vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750661096; x=1751265896;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Rfv2PMTDIceIpvbq9xZVeanT080dZzydc/UXVnCEv1g=;
 b=Vjg4caCHV0RYcRTRhBpB5XzW/kjClp5VS016DwhA6FdPGUNFkmziQKRgvsZN+idcuu
 jHiigpBawOLzQ6fANsXrViFyPmiI2TmQre/0z1413zdTj68dNXaY8QuBnBFy/TF+gQ31
 M8ROOT+ovuYdJ0jM8F62KjcIAqMcdiWS2xzC4hy7q5ayU28UwVZOl2W3KQWjM2O7q1Ju
 KMAIYlUx7SMaOE+eWEWZls3dfcNDbYOqSDs1yJE+eScqapfqkv7ebqS9wY96DBmPbI0T
 +gQcWYh38cLmEHVAqU+yTt5vhaa7VM0lqEFQ3P2eNWg2eZ+474Zo1M+UZDQEKqGrBASf
 hQXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4YnT/1EvE6jjIR7QDHR6hoAlkrVdmbKr8DodAOKgteXbg1vLW0Uzx7oh3eM69fOGCrxaGNWRBbl0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx64haZkrZjGMWyvPWH7hX/y8nTWMcOXmZ5dRR8DSmmnrju/Mdc
 xp/vZTbzZ1fXYYh5r/2r6HweoZ90yPV6jgbJdZaE30svhCHyl5rHtr5Q6IQN8jdGJH8=
X-Gm-Gg: ASbGncurEcQSZ7RlOZ2YRtaUSlLYODDX9jBCW1if2//MOPaXJaQ+p+c5s2IjPfKrPJO
 h8qrA2ds7Q0IgdM/emjD+V9tIe7FV9Q6Rsf1ySRv4OT9yyuRddjchalH4p9eUVhpliG4YvvuElN
 roN/+tFYRrd89gZrZgeULoQ9mb6mDYhBSPLYYtMMbkAHL2CtgMeVsEu6Dr6leECvmH+7i9Gz7B5
 B59eywugmfAQnbxk0mOzG9SFREJ964hRtk3k+iF3Qzc5ltbGkbUjQKOUQtLt6tMEWKr6n8fDzR7
 nA3KT3dS5PqTa2NJrmdr9OrKPdHhTWZb/5Lj+Ag6s115XwLXXwrqkq1+fNQSETbonpXvnlJ2clX
 0dbl2VUgJTQXX0EPHnTyzdWD3iiiH7HSA
X-Google-Smtp-Source: AGHT+IEIK4HYmI0KuUkjMGJQo8hgJeoSxD4CTOsQVO12rPi+l3/A1YCQcq/euCV+EvS2bfnw4by8Eg==
X-Received: by 2002:a17:906:d260:b0:add:deb0:8b64 with SMTP id
 a640c23a62f3a-ae0579df1e2mr988741966b.24.1750661096075; 
 Sun, 22 Jun 2025 23:44:56 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl.
 [144.178.202.138]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae053ee4ce9sm659258266b.69.2025.06.22.23.44.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Jun 2025 23:44:55 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v2 0/5] Add interconnent support for simpledrm/simplefb
Date: Mon, 23 Jun 2025 08:44:44 +0200
Message-Id: <20250623-simple-drm-fb-icc-v2-0-f69b86cd3d7d@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANz3WGgC/22NywrCMBBFf6XM2pEk9hVX/od0UZOJHbBNSSQoJ
 f9uLC5dngP33A0iBaYI52qDQIkj+6WAOlRgpnG5E7ItDEqoRrSyw8jz+iC0YUZ3QzYGe1230jS
 N1vIEZbcGcvzam9eh8MTx6cN7v0jya381Jf7UkkSBVitZK+pdV7uLGzmsk1/oaPwMQ875A5p80
 rS2AAAA
X-Change-ID: 20250617-simple-drm-fb-icc-89461c559913
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750661095; l=1324;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=mG0ZFKhM/nBtFju2w5kydTvhmmvJKrUqQYrMK9O0+gQ=;
 b=I+KJQKTokZRRzCjESYV5r3Vrrf+Epv1ziNUE8LuNep5eK0MjSPosyfeoDYv8RZeU6jY5CZxTZ
 xhHsZM5KA+7B8Jq8+WQNHdc3VT7AJpG+u0BOirf4OMNaxUxiruPXKC5
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

Some devices might require keeping an interconnect path alive so that
the framebuffer continues working. Add support for that by setting the
bandwidth requirements appropriately for all provided interconnect
paths.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
- Sort the headers before adding the new interconnect header, in
  separate commits.
- Use the correct #if guards for new interconnect code
- Pick up tags
- Link to v1: https://lore.kernel.org/r/20250620-simple-drm-fb-icc-v1-0-d92142e8f74f@fairphone.com

---
Luca Weiss (5):
      dt-bindings: display: simple-framebuffer: Add interconnects property
      drm/sysfb: simpledrm: Sort headers correctly
      drm/sysfb: simpledrm: Add support for interconnect paths
      fbdev/simplefb: Sort headers correctly
      fbdev/simplefb: Add support for interconnect paths

 .../bindings/display/simple-framebuffer.yaml       |  3 +
 drivers/gpu/drm/sysfb/simpledrm.c                  | 85 ++++++++++++++++++++-
 drivers/video/fbdev/simplefb.c                     | 89 +++++++++++++++++++++-
 3 files changed, 173 insertions(+), 4 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250617-simple-drm-fb-icc-89461c559913

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

