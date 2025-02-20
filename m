Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 340D4A3D50C
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 10:45:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FFC010E18A;
	Thu, 20 Feb 2025 09:45:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DRFL9U29";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53E5B10E18A
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 09:45:20 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-30613802a59so7379101fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 01:45:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740044718; x=1740649518; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=blYcjFq51G/DEAKYPys0HB89RJktg5VIFc2I1DNAbtQ=;
 b=DRFL9U299zchuhkHKvtcI2pB4/Twf7lHgtNdN+CAyKj8dthzViQ4CPcNcfj0TN1e7m
 s8ThSZ7tkem9PfmUkfe8SzqP9GekJ+89SH9ap+lKuOGAzxDx4K3oQ1R2oY39FSvz6hbj
 PEIGb/1CzqsR2AsssoTxhfHrgeQ7HZ3YKmdnuYgw83JTg6Rb5gvUHcPi19YLWU4GvgfF
 w3AIi9CUV3wfprVyTA3XTmRAUTOjGxVnN1sknhQ5P8vdp76azcpaJuR2zsNhe1DD0hE1
 DMtNrX/UCN2oRRNe0FEDfynVkcdguGq1XAyz+nyzFEb2DZ9LZ9p19CsVqhmJAWQh429N
 NQGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740044718; x=1740649518;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=blYcjFq51G/DEAKYPys0HB89RJktg5VIFc2I1DNAbtQ=;
 b=b7iOjbd6vwtgxBbac0/jpxzWMcInI5rgWBlZvr8z/4zUfDBmFvq5jzSl8o4x9BpTH4
 bms+NeDv3WjCQ63/WLCPLQumdBSdcrtGpFeNBpkXZRZFHIFUnhuID4Nz0zFN8LzV8HDW
 IhLQsXg1EYhhm/h+9unvULk1O1DRW+/2+xXlVdjsnsayyWgMszpA73HcBa5zxrITV0f2
 TuFJNw3WEpJBZiuHyja6SYV5cUiLnPPMHIaITJZ/2iw4CwZWrAN1u7YNWDe6oasCYjY8
 AgUgN2iCZkdyAUKZy/U/6OOaDnGK+8K2L9+5UklRgzWeOPFslxBckwIvIF1u5Qt9opac
 r8mQ==
X-Gm-Message-State: AOJu0YyEIs858vGPeZHh/R/A/lUxa6+kDjgAbKlnWHWVWFeYQFrD8+kY
 ItaDOMCr5Rd5BqWsD0s5UIhhjR0solgMTH2JaZqiebKyjatkt9l+
X-Gm-Gg: ASbGncvDlsTT92vtJZlJhfU0EQpCyFUIEt7KsjSfNRZUPXtSzzGqwadOsBoj4vYOnnV
 +zsjKrrZY673X2iD6AAGl2J4NY4Qgriswdi391OmT8CalWqGUzNaHLvG1F0aZYQUJ6Of5cRMIH3
 AiGcUJC4AULvlM85QxOqK9kg12ErPiDrWozaZDXQCP8LWoPgxtHm+sBGEI7idQr8rPOdOh1fuFe
 90Nx6CbC2r1a0aOAitYo1fuv5amzceAZDBtuky9iRj7JlGA9pMDnT4xl0a6ueQi3i/7E2KVEDPJ
 CQQuAAk=
X-Google-Smtp-Source: AGHT+IGOCrIcTZo/Z0lOIkDRiiD2nCB5lUrezU00sbuHHzxGiGFKWgEHDlp9N95obv3h9+sUy6i88A==
X-Received: by 2002:a05:651c:8a:b0:301:12:1ef3 with SMTP id
 38308e7fff4ca-30a44db994amr20609101fa.4.1740044718218; 
 Thu, 20 Feb 2025 01:45:18 -0800 (PST)
Received: from xeon.. ([188.163.112.51]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30a3a0d1c2bsm9574311fa.11.2025.02.20.01.45.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2025 01:45:17 -0800 (PST)
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
Subject: [PATCH v1 0/3] drm: bridge: add support for Triple 10-BIT
Date: Thu, 20 Feb 2025 11:44:53 +0200
Message-ID: <20250220094456.32818-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Triple 10-BIT LVDS Transmitter is used in Microsoft Surface RT and
MStar TSUMU88ADT3-LF-1 HDMI bridge is used in ASUS Transformer AiO
P1801-T.

David Heidelberg (1):
  dt-bindigs: display: extend the LVDS codec with Triple 10-BIT LVDS
    Transmitter

Maxim Schwalm (1):
  drm/bridge: simple-bridge: Add support for MStar TSUMU88ADT3-LF-1

Svyatoslav Ryhel (1):
  dt-bindigs: display: extend the simple bridge with MStar
    TSUMU88ADT3-LF-1

 .../devicetree/bindings/display/bridge/lvds-codec.yaml       | 1 +
 .../devicetree/bindings/display/bridge/simple-bridge.yaml    | 1 +
 drivers/gpu/drm/bridge/simple-bridge.c                       | 5 +++++
 3 files changed, 7 insertions(+)

-- 
2.43.0

