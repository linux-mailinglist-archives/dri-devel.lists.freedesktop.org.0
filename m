Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE95DAE18E4
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 12:31:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCAA110E217;
	Fri, 20 Jun 2025 10:31:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fairphone.com header.i=@fairphone.com header.b="TpmRdWi3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A787210EB34
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 10:31:35 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-ade5ca8bc69so292254566b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 03:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fairphone.com; s=fair; t=1750415494; x=1751020294; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=X8TW+dnA/RLSUCo5w0FhkO5CxTqAKcs/iJjNLMWWbto=;
 b=TpmRdWi3OMHl9b64jp/ZHFML+MDIl3dofyJlKuPlw+QJ6Vh1RN209IqVEbPX/Hnj7t
 U1fUhibAngfbFVw11KVnz56ZRMWnOwjtdABOwz+HMN999EPcpUCi1f91YlTlyW2gV8Yf
 FKwgjXzmFepz7AV5F5XEV0AfG4T8piO+LUtvzQj4XzuTGJIHporgKNglXbGa19/Sb7vZ
 GXgjlaqbeqkv+1aZT58hGtpNE5QHpCbPmeaO8YGNZxm3XGf4tqfvzYuW3VDtyRfgHaas
 iL0VbHjUbenqlpz2rCYza4myMOX4W46ny5iNRiHZNty7xwep7fxcs9LwTG8Ot5aqXmRd
 OTRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750415494; x=1751020294;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X8TW+dnA/RLSUCo5w0FhkO5CxTqAKcs/iJjNLMWWbto=;
 b=rZyb9ze1VSRUDCjruFPEZJ/inuVwIIZ4BbrDf2SVF7GceQ1DMs4fL7JkgRqjN8bwHK
 dSYQQu0ZLNRrcUIMI+b8HRGjL43+eNTDIS76VcI3+aKyQSxVmMxoi26k0pdRi4w7Tglg
 IUoz2yvH6l8fzPUn5fyh7oj11LDbafngjL9XBzkUjWx3gKNCQ+X8qa6BDQchAtr+QdT1
 C2S0plRJL843xRWg+qjmsZIzJJzniJ4gq/ppdx7BmO3H3X4D4MgsIE4Vyb/Dwcy7hYVZ
 whEG28rAo37ZL0s94Efm0B6uqhXBIirCj2K27Gt6iF3ucrpEA7XDYeeVQvb+aqBeDghY
 1ybQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEsjJ39dWqhNiQqgWa1wqnYv/CxwX3CWUmfAiKF3VYKc48SrX/eyQaleXKVTwtPim6g4HhA1+OAco=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyN4fVHqqBW5qLCn8NlqG18fegDXUQGpC++BvxINDU/fgBNuDv9
 KYH4K5rrBgCGxhEJIQxC+vQmBjXdrGAySOxIVab4jOi3FFjAC4pWi9KDcJssnFMXL6A=
X-Gm-Gg: ASbGncvcJV+8KOZ91himPm+2zC7/2nV232T3wTmf5JGxv/eeQJyAfZKHOTSD7VUxlG/
 b/PVYKRYs4PWqFocVoFM9OiVJnhbdmuTh7houYUN8edCbyksg/RxuxysQ4Q6RTI2FB5RFQa3d5o
 PZwr9n+9TgX2bRxElOJzpIv5qtQDhX88gmG6/ZUanuYIgV9Mda620uUDmPWRQ0URGNeu8rFwmUd
 dMs/tQCbcQGejacVkgvbue+la4PslgWxYOju0CgwU0ZWngmigcJ/8KOIhiXFvggidWV2bcH53lG
 EwmKMWoWY+63U/7hFtXjzFMp5Ni0fkotL1c4t7LelzuyxbHGfvdu+O2X7HQ1dPz/eqea7293/J1
 A7qJ85+VIPboH+h2vLf+Zphi13M9UsKKC
X-Google-Smtp-Source: AGHT+IE9P6hDfRXmnpE+5S+EKxKkHp70DsQJ2ovXtC7hTz0ZIMVcZscGLt+vhpJFn076myB8MB2log==
X-Received: by 2002:a17:906:dc8d:b0:ad8:9257:5735 with SMTP id
 a640c23a62f3a-ae0578f527emr214907766b.3.1750415494301; 
 Fri, 20 Jun 2025 03:31:34 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl.
 [144.178.202.138]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae0541b6f5csm138047366b.122.2025.06.20.03.31.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jun 2025 03:31:34 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 20 Jun 2025 12:31:25 +0200
Subject: [PATCH 1/3] dt-bindings: display: simple-framebuffer: Add
 interconnects property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250620-simple-drm-fb-icc-v1-1-d92142e8f74f@fairphone.com>
References: <20250620-simple-drm-fb-icc-v1-0-d92142e8f74f@fairphone.com>
In-Reply-To: <20250620-simple-drm-fb-icc-v1-0-d92142e8f74f@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750415493; l=1090;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=WbYAkf28JuDB96zhXvwINlUm7Z+jr4BgOqrEfl46LOQ=;
 b=Y2GDVlFS+pU31aOX4ttTn8hlbLrxRlFtAH65SYN7sC9Zi1EhHz2D8Jo4kgsda6sDYGZfr6MTp
 AOzkGxhs9TXBET7U25bdMMFdcIgeFo2aN4c/Q85bn4pS2/9RgeCHpZw
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

