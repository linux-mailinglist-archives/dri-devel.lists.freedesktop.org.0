Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58176C93E60
	for <lists+dri-devel@lfdr.de>; Sat, 29 Nov 2025 14:45:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5873810E1E2;
	Sat, 29 Nov 2025 13:44:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OX4+jChN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC58710E1B3
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Nov 2025 03:29:53 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id
 41be03b00d2f7-bd1b0e2c1eeso1922932a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 19:29:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764386993; x=1764991793; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=W3VMXcUmTO3xpxKoPCgPeXG3UWYRk+wblTdtJybNqmg=;
 b=OX4+jChNwai9eQgpQUM9Tks7e69cIKivtxXGPRzY4X/2KGfBot2nXcHORJtAZiWZMB
 O+XSH9G4g+LSAnQ6awBW1++VyLiuC+h5SApt55qYQ20IohRh7WP7HVirOr4Zrj5gplh6
 S951kcclIwsL/UT+x8d6y/p/UxhDHbOvZWACFuyvxBrWpsqw/2HaJnc1+dsaPirizLER
 7RLyLLCo/A0lHv6nkP+D02UyKeV4NyJrsiCAtYomKwqtbrPJX6snz+TJODSa1j9xXAlx
 Amwi41g25wJpBoV36eGy7dxZuapHFto0MaRWsznGyPC1nnrNQOR7Rf6mO9gJgZjpdQ2Q
 uzJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764386993; x=1764991793;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W3VMXcUmTO3xpxKoPCgPeXG3UWYRk+wblTdtJybNqmg=;
 b=hGWP6EFQc+ZL2VktoDfqsk4VvzXeuKd6NuOImx1WWzDGs+sZqG54215KtR2zLqYLbD
 pyOQcS86m4iY0uGGGuBJd0/haqSqCOBxHI0urE37QvKWlatutS0+WOK8BqFmUOusk+/z
 NjglcxjqxZCGhHekUp5h7c+yNlrLEQ1Dnw+PUbWhoO/iBVCb2aLd2/SGFuGc4xHDmWyq
 stHCk8cRB2dDHDFwk/DiPUvNRfmQELPILyOgLHIF4ZXdmzy0FwvSPYVTZhZs0A8RcClf
 yWBfK6MJpfzshDpZaqMBQB16yzqaxsMiSg0I4wViY4efbedvKf6G21mgPwb6FVzkLUNv
 AVSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHudzo6geWGXXk08sJ1Oy7RIwrARhi7jdYRY+gd6b9LPjeESc3h5sYtV8r7Hznq3aJ/JAXjmL0+g0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzKdR9YlaD/VNoJwqG5105pp5lbEygnZ+AyE2VSEXgg1SXIqy1D
 I07X20kIFK0ubNdzDIXNn6nNdjWCYGTlSl/hq3DhIT89YcixAdT5mOlj
X-Gm-Gg: ASbGncvTHsivxNPWM48Rhkyg1pLvtzjlqDmr+JDu0xmMiH/HxXQRApvLgDhQtEfQd/R
 5cROOjYnU1dlXEInFLAL3PJu45rfIRRcbOdLH1kxQBleI56RWqkswSXWh7qTlZh978/ajbKMsNI
 tWI8HcRY34johE8ZLr7TlSp+usY+V56wtrWE0yVldKyMRxNpwT3QR745S/6nOGrNaAsYQzix6iT
 VoGxlSQFcxbNANb14cJiO5OmtiJBZ2Ok5szzHbyUflh1MOCIIYUNFsWS+U4BCJGIiZgH6hg5nV8
 Nu6nZs/tRDJqkKsxgvz+CQFtdc18n6fppHvPkAIzjV88foO4Lpn2cZLQWAMdgbpuFcXT0YproxS
 s8WKRtlHK259hIYIgZUq0yqnRts+Eyf5o4T54EqvtfClZB9OWRRfRAWt4HMh4dZ9HUDwXABauHl
 4bjAMmovyUk1c=
X-Google-Smtp-Source: AGHT+IFWeBUfkLimXpH6/rkpJhmGPswp2kuBGTWuMwz5cnMjbd68P1jHOBqNKoSbkkI6Vy6iYnVFGQ==
X-Received: by 2002:a05:7022:6b97:b0:119:e569:f610 with SMTP id
 a92af1059eb24-11c9d60e3e0mr20589635c88.9.1764386993316; 
 Fri, 28 Nov 2025 19:29:53 -0800 (PST)
Received: from fedora ([172.59.162.202]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-11dcb03cc7dsm26206743c88.5.2025.11.28.19.29.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Nov 2025 19:29:52 -0800 (PST)
From: Alex Tran <alex.t.tran@gmail.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tursulin@ursulin.net
Cc: airlied@gmail.com, simona@ffwll.ch, ville.syrjala@linux.intel.com,
 vinay.belgaumkar@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Alex Tran <alex.t.tran@gmail.com>
Subject: [PATCH v1] drm: i915: gt: intel_rps: handle counter overflow by
 calculating delta for each register
Date: Fri, 28 Nov 2025 19:29:21 -0800
Message-ID: <20251129032921.811332-1-alex.t.tran@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 29 Nov 2025 13:44:58 +0000
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

The previous implementation calculated the power deltas by adding together
the u32 energy counters DMIEC, DDREC, CSIEC into a u64 total and then
subtracting from the previous total to obtain the delta. When any of the
u32 counters overflowed and wrapped, the total would be less then previous
total, causing incorrect delta calculations since u64 subtraction doesn't
handle u32 counter wrapping correctly.

This implementation tracks each counter individually, allowing their deltas
to be calculated separately and then summed. This correctly handles u32
counter wraparound, fixing incorrect power calculations when counters
overflow.

Signed-off-by: Alex Tran <alex.t.tran@gmail.com>
---
 drivers/gpu/drm/i915/gt/intel_rps.c       | 40 +++++++++++++----------
 drivers/gpu/drm/i915/gt/intel_rps_types.h |  6 ++--
 2 files changed, 27 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
index 4da94098bd3e..8247a8b16f18 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.c
+++ b/drivers/gpu/drm/i915/gt/intel_rps.c
@@ -324,8 +324,10 @@ __ips_chipset_val(struct intel_ips *ips)
 	struct intel_uncore *uncore =
 		rps_to_uncore(container_of(ips, struct intel_rps, ips));
 	unsigned long now = jiffies_to_msecs(jiffies), dt;
+	u32 dmiec_delta, ddrec_delta, csiec_delta;
+	u32 dmiec, ddrec, csiec;
 	unsigned long result;
-	u64 total, delta;
+	u64 delta;
 
 	lockdep_assert_held(&mchdev_lock);
 
@@ -339,17 +341,21 @@ __ips_chipset_val(struct intel_ips *ips)
 	if (dt <= 10)
 		return ips->chipset_power;
 
-	/* FIXME: handle per-counter overflow */
-	total = intel_uncore_read(uncore, DMIEC);
-	total += intel_uncore_read(uncore, DDREC);
-	total += intel_uncore_read(uncore, CSIEC);
+	dmiec = intel_uncore_read(uncore, DMIEC);
+	ddrec = intel_uncore_read(uncore, DDREC);
+	csiec = intel_uncore_read(uncore, CSIEC);
 
-	delta = total - ips->last_count1;
+	dmiec_delta = dmiec - ips->last_dmiec;
+	ddrec_delta = ddrec - ips->last_ddrec;
+	csiec_delta = csiec - ips->last_csiec;
 
+	delta = dmiec_delta + ddrec_delta + csiec_delta;
 	result = div_u64(div_u64(ips->m * delta, dt) + ips->c, 10);
-
-	ips->last_count1 = total;
+
 	ips->last_time1 = now;
+	ips->last_dmiec = dmiec;
+	ips->last_ddrec = ddrec;
+	ips->last_csiec = csiec;
 
 	ips->chipset_power = result;
 
@@ -396,7 +402,7 @@ static void __gen5_ips_update(struct intel_ips *ips)
 	struct intel_uncore *uncore =
 		rps_to_uncore(container_of(ips, struct intel_rps, ips));
 	u64 now, delta, dt;
-	u32 count;
+	u32 gfxec;
 
 	lockdep_assert_held(&mchdev_lock);
 
@@ -408,10 +414,10 @@ static void __gen5_ips_update(struct intel_ips *ips)
 	if (dt <= 10)
 		return;
 
-	count = intel_uncore_read(uncore, GFXEC);
-	delta = count - ips->last_count2;
-
-	ips->last_count2 = count;
+	gfxec = intel_uncore_read(uncore, GFXEC);
+	delta = gfxec - ips->last_gfxec;
+
+	ips->last_gfxec = gfxec;
 	ips->last_time2 = now;
 
 	/* More magic constants... */
@@ -607,12 +613,12 @@ static bool gen5_rps_enable(struct intel_rps *rps)
 
 	__gen5_rps_set(rps, rps->cur_freq);
 
-	rps->ips.last_count1 = intel_uncore_read(uncore, DMIEC);
-	rps->ips.last_count1 += intel_uncore_read(uncore, DDREC);
-	rps->ips.last_count1 += intel_uncore_read(uncore, CSIEC);
+	rps->ips.last_dmiec = intel_uncore_read(uncore, DMIEC);
+	rps->ips.last_ddrec = intel_uncore_read(uncore, DDREC);
+	rps->ips.last_csiec = intel_uncore_read(uncore, CSIEC);
 	rps->ips.last_time1 = jiffies_to_msecs(jiffies);
 
-	rps->ips.last_count2 = intel_uncore_read(uncore, GFXEC);
+	rps->ips.last_gfxec = intel_uncore_read(uncore, GFXEC);
 	rps->ips.last_time2 = ktime_get_raw_ns();
 
 	ilk_display_rps_enable(display);
diff --git a/drivers/gpu/drm/i915/gt/intel_rps_types.h b/drivers/gpu/drm/i915/gt/intel_rps_types.h
index ece445109305..e275291787cf 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_rps_types.h
@@ -13,10 +13,12 @@
 #include <linux/workqueue.h>
 
 struct intel_ips {
-	u64 last_count1;
+	u32 last_dmiec;
+	u32 last_ddrec;
+	u32 last_csiec;
 	unsigned long last_time1;
 	unsigned long chipset_power;
-	u64 last_count2;
+	u32 last_gfxec;
 	u64 last_time2;
 	unsigned long gfx_power;
 	u8 corr;
-- 
2.51.0

