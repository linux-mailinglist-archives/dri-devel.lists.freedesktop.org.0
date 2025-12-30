Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7F2CE92FE
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 10:16:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F391B10E162;
	Tue, 30 Dec 2025 09:16:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ICppRZMH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAD5D10E87F
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 09:10:39 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-432777da980so1932853f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 01:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767085838; x=1767690638; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=J5NFsipfMK9XBVYfroy27ggD+k/SBP7vWAnNBtEfHSU=;
 b=ICppRZMHgwmWdQE4f669mu1xIAoyyzDISSMh5KGxhU0pct9E8x/S/czRFXilyDLuRW
 eMF3z8EzkbHp0D3mCd1UH8Euio5h72MdJosGKfHaKQKhvlTSWln13dv5SIShjuFBq0ot
 fEBKCi7o7GzZMyqg57R3aNCgnmxm0N4N/npv0oVdE0shJ3Y+jTXYzaue5wsBRKS7Nfkt
 jVJv4GyC0rmlsyg9PU1+EZ6NHz5U84oMjoP8Qb/MZxc1kxDAQwCQK7AvSnQzSBX1QDWG
 mkBdqjBVpMIISIW+3m/v+f7eIw6tJOgaiifEAIWRMXo62RRZj7TaGw6/QAlgPMv85vJV
 iLbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767085838; x=1767690638;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J5NFsipfMK9XBVYfroy27ggD+k/SBP7vWAnNBtEfHSU=;
 b=IFGmxwYaN1Gui3FGMJgUhQqGpdvJGyQ09iTTdqibA7lscfxMFV4lPCyreIDzejZ2uA
 DNpBUDjSakFPsUYESN2z4APjt2VzmyArW0YOPxq4Tyt09ELVcnJ4WRqs4yNsxRLNvp3m
 XhsRWzp61i5z2ZlxhFnRgtDAFC7dN6rCCcEP4ykvYVjxzGlRuThD8xYHgQE5BDawVMh7
 i6BCQ5u1vYrt22TUQIbvwQ1q1CysZa6jSkc/eJvNw7Yq1tkKozUI0oiuL+j7F26rWgg9
 AEKwzHWVX3ePZT5AZEBqRXdpWeur8ApeHgXYJplYiHkz7IPiL9Qppk+s+kmvsumno+9u
 dNMg==
X-Gm-Message-State: AOJu0YxEmdWG1mNswiw5h5b38Bf8sqf4ekwpZv1ySJD0KLF7wN8Ec3iH
 1gT+fQCTj4NPnDwROpqbP1ZJSR473rcQL4E5oe1LTe0yjuinyisFdT1K+QKOuw==
X-Gm-Gg: AY/fxX6KTBfjDc5gqlis/EE58EkslP+SZCXzig0CmepLPO5ozzUc6XmaFIpvhyTjjGQ
 foVmKbSTAKSXk6pgFPujYQtdkIXmpCpjSHuDJpVnL5DfsWdO5/FnQVleoB6SB5L9Ok3QD8thzGP
 9i3SfOTNP1eRKcbG+2swba1e4RPJtb5viY5bePxxg03ovxosmIPv6HGTMt8j/Zjry5CxJfsqTXJ
 b9iFEODW3eEY/KWgkfIG/9ChzrlD1JmUy2fLuNR+6AduVKvEdQYQzAXb4UpXvUHtibDyWA2MI0P
 cU3bbKGF/pQrmDzC4xPnWgAeA7epgF+PuMWJYmpv9Cutj0OYOpues8tp+JSkWlHolosE6TvS8uU
 SjMewHYQuMmCERQq0im76hKN0DgWmYXXJ2zCl+yCY9+hlqAx4Ck66blW/VZS4A0m93eFWNiqfzS
 MTXTq6oKfcPkAhH+wdZfLRmc+IJKI=
X-Google-Smtp-Source: AGHT+IGQ+SnzoC1jTjOiDUQ3LhBdC1Uts8CjtNNVnC1uIZF/cVYe4TlTZ/sojdIeUqEHAKkaBJ8zgw==
X-Received: by 2002:a05:6000:25c6:b0:430:f9c2:84ec with SMTP id
 ffacd0b85a97d-4324e4d0f5dmr43870414f8f.26.1767085838188; 
 Tue, 30 Dec 2025 01:10:38 -0800 (PST)
Received: from oscar.. (83.67.3.89.rev.sfr.net. [89.3.67.83])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324ea22674sm68645194f8f.10.2025.12.30.01.10.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Dec 2025 01:10:37 -0800 (PST)
From: Jerome Tollet <jerome.tollet@gmail.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, jani.nikula@linux.intel.com,
 rodrigo.vivi@intel.com, Jerome Tollet <jerome.tollet@gmail.com>
Subject: [PATCH] drm/i915/hdmi: Fix 4K@60Hz HDMI display with SCDC timing
 delays
Date: Tue, 30 Dec 2025 10:10:37 +0100
Message-ID: <20251230091037.5603-1-jerome.tollet@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 30 Dec 2025 09:16:07 +0000
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

Some HDMI 2.0 monitors fail to decode the signal at 4K@60Hz (594 MHz)
when SCDC scrambling is configured too quickly. The monitor displays
"format detection" error and never recovers, despite SCDC I2C
transactions succeeding.

Root cause: The SCDC disable/enable sequence happens too fast (~16ms),
causing the monitor to lose sync during the transition. HDMI 2.0 spec
section 10.4.1.7 states that the sink can disable scrambling if it
doesn't detect a scrambled clock within 100ms.

Solution: Add timing delays to allow the monitor to properly handle
the SCDC configuration:
- 100ms before SCDC configuration (let monitor stabilize)
- 150ms after DDI enable (let monitor lock onto scrambled signal)

Testing performed on:
- Hardware: Intel Alder Lake-N N100 (Gen12.0, PCI ID 8086:46d1)
- Monitor: Cisco Desk Pro (HDMI 2.0 capable)
- Resolution: 3840x2160@60Hz via HDMI 2.0
- Kernel: Linux 6.18.1
- Test scenarios:
  * Multiple reboots (stable across all tests)
  * DPMS ON/OFF cycles (suspend/resume works correctly)

Impact: Adds 250ms delay during boot, only when hdmi_scrambling is
active (resolutions > 340 MHz). No impact on lower resolutions or
runtime performance.

Fixes display initialization on monitors sensitive to SCDC timing.

Signed-off-by: Jerome Tollet <jerome.tollet@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index abcdef123456..fedcba654321 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -3414,6 +3414,10 @@ static void intel_ddi_enable_hdmi(struct intel_atomic_state *state,
 	enum port port = encoder->port;
 	u32 buf_ctl = 0;
 
+	/* Give monitor time to be ready before SCDC configuration */
+	if (crtc_state->hdmi_scrambling)
+		msleep(100);
+
 	if (!intel_hdmi_handle_sink_scrambling(encoder, connector,
 					       crtc_state->hdmi_high_tmds_clock_ratio,
 					       crtc_state->hdmi_scrambling))
@@ -3502,6 +3506,10 @@ static void intel_ddi_enable_hdmi(struct intel_atomic_state *state,
 	}
 
 	intel_ddi_buf_enable(encoder, buf_ctl);
+
+	/* Give monitor time to lock onto scrambled signal after DDI enable */
+	if (crtc_state->hdmi_scrambling)
+		msleep(150);
 }
 
 static void intel_ddi_enable(struct intel_atomic_state *state,
--
2.43.0
