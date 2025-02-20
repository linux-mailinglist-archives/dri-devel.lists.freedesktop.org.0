Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DEFA3D50D
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 10:45:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6585210E4B1;
	Thu, 20 Feb 2025 09:45:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Udjetd+B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 075A810E4B1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 09:45:22 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-30a440effcfso18642601fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 01:45:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740044720; x=1740649520; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yNAQqcnp/w2mCH0GloiTmsWauZH3DbpHe2YtXW/kSl0=;
 b=Udjetd+BCWXzCbQ7A2KIybyHAcLVcRCNXJ2S1y8SZlWK7KliiZGyJLaTCtKP/baVLH
 Wj+uQqRM9S7WjPjdISG7RG70k4Bk82Lohg+YWs6mQVTbCRM3TGpc5Xm2egK3hEDQgLN2
 suUbNXHLGlfwkus2wGBudQJ+M0vU90Mzqovob/dY7SlEK8JiXvwYep/5Faa5gwwvruyb
 wFslzibinscHRyquyLuqixBUZfoh6o1ZqzcCiP1sTH/rHJQtMWiM7s+lKMLyZrxoic0J
 73zU+CBUNLossHY3Kjof+RkovpujbGqDna2SFLSPlLcMmbJvDbRL6pe/TxQflmRlbHPl
 taFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740044720; x=1740649520;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yNAQqcnp/w2mCH0GloiTmsWauZH3DbpHe2YtXW/kSl0=;
 b=Cstwx9gzcU/MrM54lJUM5My56bsi6P38TXYhTB3iySu6/bt/T9SJ6WiO5p5i0nz0az
 +ubwoIq5gfB5neYQErd44Cy4BzJ7iQlQVijAAHuFkAf9NqK7+ZDh7Kp2LRgOoQ8t6vZe
 3NIWP2WGWvWeKl2JDE2K5QO1DezjlwqxFo+zzvHmAPPoorEhn69B/dyADnTRAU9ks84n
 Rd9KQEtMMp4MMtQr9gh7+JcJjQbixs8lj0o1/NWcuNv8rRFWMogseXrYAJSYAuvP85mH
 ruW8vW5yzadqgsVAM2vD6Rhd4FHXIwb398+nukICZtOVIbzqSKIR7dTzWoR/EkCIc763
 F8cg==
X-Gm-Message-State: AOJu0YyFwwT7VFmt21ROraPX4vGhCsimlZMgqQ2K5wBm05OCjhcYpIea
 D4kdIny+DfKolsMzgi80dNFmNVA0J8u2qFW5Xh94lRIlzfyRlYmw4d2Aaw==
X-Gm-Gg: ASbGncs6yp29CnsDFBehtpb0vM7lzS9dP8F/6kTULMrW5+yoiFgTU+rCZIigxFNHxD2
 +gb9CQuXWNTAx5ry8fSLJKA4vX9EFd4g6B16BvT6tGNLtbGbFyrt9nSQYdUx4RXM6cqViO1B+72
 rVrVU48fpBu/irr3H7+gk/ah5ii21Pk5E1rn3D2NSHBmuJoRrQzqR1I/dTPWkPYTD3kVyD3j0eD
 OnxTawRiu0/o/9FJOoZz7DNE4sN5XXLwikAgs6a88xUA9BWnBr0xlDTJPlg1gc5zn++9Y+jxMGQ
 zVOvvoE=
X-Google-Smtp-Source: AGHT+IHECrLIXVnP3hpGfpiTiYkWp6mBX4nHSegnCwkEK5eQPvF8vUGu37lWYyY6yKC5NSUCa1OmzA==
X-Received: by 2002:a05:651c:cc:b0:309:28c9:54c3 with SMTP id
 38308e7fff4ca-30a5063fcacmr8363341fa.12.1740044719959; 
 Thu, 20 Feb 2025 01:45:19 -0800 (PST)
Received: from xeon.. ([188.163.112.51]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30a3a0d1c2bsm9574311fa.11.2025.02.20.01.45.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2025 01:45:19 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Svyatoslav Ryhel <clamor95@gmail.com>,
 Maxim Schwalm <maxim.schwalm@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/3] dt-bindigs: display: extend the LVDS codec with Triple
 10-BIT LVDS Transmitter
Date: Thu, 20 Feb 2025 11:44:54 +0200
Message-ID: <20250220094456.32818-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250220094456.32818-1-clamor95@gmail.com>
References: <20250220094456.32818-1-clamor95@gmail.com>
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

From: David Heidelberg <david@ixit.cz>

LVDS transmitter used in the Microsoft Surface RT.

Signed-off-by: David Heidelberg <david@ixit.cz>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
index 6ceeed76e88e..24e89c1d0c76 100644
--- a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
@@ -33,6 +33,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - idt,v103      # For the Triple 10-BIT LVDS Transmitter
               - ti,ds90c185   # For the TI DS90C185 FPD-Link Serializer
               - ti,ds90c187   # For the TI DS90C187 FPD-Link Serializer
               - ti,sn75lvds83 # For the TI SN75LVDS83 FlatLink transmitter
-- 
2.43.0

