Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kBJiLQyNoGkNkwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 19:12:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 471731AD5C3
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 19:12:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FF4910E9B3;
	Thu, 26 Feb 2026 18:12:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Mqe9jEMN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A244010E869
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 05:13:53 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-824484dba4dso534062b3a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 21:13:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772082833; x=1772687633; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/mKOurc9EHBKfVMuwdiuhgyEKIrS/i0ROAg7NG335J8=;
 b=Mqe9jEMN6ofOVQkAqQHgMNqYL34giHnrAPnwm8qjmI79aMkul5wmbOSU33nShpKsOY
 wRFSxeGiVk283L/InIAXD8Fgtsyy1tUWLBlr1dT+eCMH6hBELZTZY8E92Ia1hOtvHvE3
 XYR6Eq6L0u3FBLDm2jis0Ae/bd5uUxFPTCphFjLgW8O/6nDa/SV38YYEWycd6f/oi9Xf
 NCketN6MVFFxfmcHAod2Lw2YKE5dgyYk6Z/7L4GH+g8x+PhgyQENMU9gMbGGjk5KwNIf
 UtVEa4HVIQnYh2poIbd2o2XM85CjsyT0SpSvcvUiix0gPHG5retGQ5VgGPk1RdYr4Jl/
 4IwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772082833; x=1772687633;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/mKOurc9EHBKfVMuwdiuhgyEKIrS/i0ROAg7NG335J8=;
 b=b7zuIkpseJkv4KEjgmFhFX/ueVeP44ejMHQgO/ssxYJ1fnKFhANTFbECOGNnj8NXk5
 dfMY2rovRllAYc8FuOi1RyOaB8/A7c3YN6yVTDTbLnejRE4TwYH1OplUbcwKBuPzQVt0
 SpZ1/60qxkqqvqBAoQot1CzfkIYwVA0Ko+pnzgEzYMARNVQU6Y2meId9GdCxDpG65s07
 Fx/DdRSvPBpdJEHfb29KV72zhePACZ07WvEuuFrAZDDyjVLbpzaWWaipjkg0KpAKKOOm
 40n9v8y5gOy66j2KH5O2ZxdlfKeOAraSt7K5mm3++HopqEyarWN3iALcOrjdzVKskACC
 IWXA==
X-Gm-Message-State: AOJu0YzW0P04b92DeyNKp/g4y4FBwEvkp2ms4aHahui00ikcm3aMCZC2
 EAt/AJxLwcTZaHDutELqhaUo1AQXs58mz5BDn+yiN4jp4Xa9ckBZPudNaKVydQ==
X-Gm-Gg: ATEYQzyst7LhOVLk+m3EI4zV4ir17ZsBNX4umSEjjhO8RuM7Qi5mokb93SxbJGvGS0y
 WShIKHHvnWNlDEbooI1+5RH6LQwxRqqhBxkubRt4Ho1n1SUhNMkM+WG03HT9VN6+oOPMQseBwsi
 2fW8WtvkKLKNRfaSHOD3xtqdIu8viQXMULy7SF5LH+maCEYFU8S2gY2XV+Ary13LfHMkg6cMmmT
 ovrvbWMy6fwbTd+K5OhKge6mXR5BaLPw8tQQvRgQ9a/g9wvM8yP2btxyR9LbrIr11sB+4E0mj7T
 vOKh06LeB0H+I1iqPpOTCIY6XX6yTV8LNNWGummHzuGOH7OxSCBimOpd2J/briEecNFSFbkVB93
 OJU58ZwBYzOeALnNariMo9TvHk8v9bebxOIsHJpXMBfSkUC4TIE5ExbndXUf9d7yztVueif7P+X
 /X9aYe1k5Y+tReU+Yg/UbM6aW5/7eC2mZkxdnOlmq+OJm/lFIfoJHCpNY/hg==
X-Received: by 2002:a05:6a00:852:b0:824:374a:140d with SMTP id
 d2e1a72fcca58-8273bc57a30mr1152848b3a.4.1772082832756; 
 Wed, 25 Feb 2026 21:13:52 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82739ff3667sm912196b3a.41.2026.02.25.21.13.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Feb 2026 21:13:52 -0800 (PST)
From: phucduc.bui@gmail.com
To: dri-devel@lists.freedesktop.org
Cc: laurent.pinchart@ideasonboard.com, geert+renesas@glider.be,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, phucduc.bui@gmail.com
Subject: [PATCH] drm: shmobile: Fix blank screen after resume when LCDC is
 stopped
Date: Thu, 26 Feb 2026 12:13:38 +0700
Message-ID: <20260226051338.27460-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 26 Feb 2026 18:11:59 +0000
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,glider.be,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_NO_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.996];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,renesas];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 471731AD5C3
X-Rspamd-Action: no action

From: bui duc phuc <phucduc.bui@gmail.com>

The LCDC controller on R8A7740 loses its register state during
deep sleep. Upon resume, the driver's Mirror Register mechanism
(MRS) fails to update active registers because the controller is
stopped (DO=0).

According to the datasheet (Section 38.7.1, Figure 38.13), the
Two-Set Register Switching logic only triggers a change between
Set A and Set B when a Frame End Interrupt occurs at the
completion of a display frame. During resume, as the LCDC is
stopped, no frame is processed and no Frame End pulse is
generated. This leaves the Display Data Start Address (SA)
pending in the standby set, while the active register (Side A)
remains at 0x00000000, preventing the display engine from
starting.Debug logs collected during resume confirm this
behavior, showing the start address written to the standby set
while the active register remains unchanged.

Prime both register sets when the LCDC is stopped:

    If DO=0: Use lcdc_write() to force the Start Address (SA)
    into both Set A and Set B registers. This bypasses the
    switching logic and ensures the engine has a valid base
    address immediately upon being enabled.

    If DO=1: Maintain the standard Mirror mechanism and MRS
    toggle for normal, tear-free operation.

Verified on R8A7740.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 .../gpu/drm/renesas/shmobile/shmob_drm_plane.c  | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
index 9d166ab2af8b..21fd1e19beda 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
@@ -70,6 +70,7 @@ static void shmob_drm_primary_plane_setup(struct shmob_drm_plane *splane,
 	struct shmob_drm_plane_state *sstate = to_shmob_plane_state(state);
 	struct shmob_drm_device *sdev = to_shmob_device(splane->base.dev);
 	struct drm_framebuffer *fb = state->fb;
+	u32 ldcnt2r;
 
 	/* TODO: Handle YUV colorspaces. Hardcode REC709 for now. */
 	lcdc_write(sdev, LDDFR, sstate->format->lddfr | LDDFR_CF1);
@@ -78,11 +79,19 @@ static void shmob_drm_primary_plane_setup(struct shmob_drm_plane *splane,
 	/* Word and long word swap. */
 	lcdc_write(sdev, LDDDSR, sstate->format->ldddsr);
 
-	lcdc_write_mirror(sdev, LDSA1R, sstate->dma[0]);
-	if (shmob_drm_format_is_yuv(sstate->format))
-		lcdc_write_mirror(sdev, LDSA2R, sstate->dma[1]);
+	ldcnt2r = lcdc_read(sdev, LDCNT2R);
+
+	if (ldcnt2r & LDCNT2R_DO) {
+		lcdc_write_mirror(sdev, LDSA1R, sstate->dma[0]);
+		if (shmob_drm_format_is_yuv(sstate->format))
+			lcdc_write_mirror(sdev, LDSA2R, sstate->dma[1]);
 
-	lcdc_write(sdev, LDRCNTR, lcdc_read(sdev, LDRCNTR) ^ LDRCNTR_MRS);
+		lcdc_write(sdev, LDRCNTR, lcdc_read(sdev, LDRCNTR) ^ LDRCNTR_MRS);
+	} else {
+		lcdc_write(sdev, LDSA1R, sstate->dma[0]);
+		if (shmob_drm_format_is_yuv(sstate->format))
+			lcdc_write_mirror(sdev, LDSA2R, sstate->dma[1]);
+	}
 }
 
 static void shmob_drm_overlay_plane_setup(struct shmob_drm_plane *splane,
-- 
2.43.0

