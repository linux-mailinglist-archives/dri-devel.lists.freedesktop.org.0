Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EP8zMND5rWmE+QEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 23:36:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B1C2327C4
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 23:35:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3328710E028;
	Sun,  8 Mar 2026 22:35:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VTrCFoUg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
 [209.85.210.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4302A10E087
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Mar 2026 22:35:55 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id
 46e09a7af769-7d4c12ff3d5so10732970a34.2
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Mar 2026 15:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773009354; x=1773614154; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kMKCTB0JgA7UPGciIJUTWbaxDO5eSFF+/kzpE0aUa0Y=;
 b=VTrCFoUgZ0v+jw+qmCDEryq4DsLGcVyONNAEG7whcfHimQvD0DnR2NNMXjVxSUS2EM
 0MDjiLOxxHeEmHmBy1zx3Nsv8+k+w0poKX0/wmJwM7Y2st5gf7fz2l4MMxcqw9tRKZEp
 YeuYs2+hcBv9QuIai57ppmCsYtIqCwnKQStBmQEJ1ZAzeiNRZFfk56YX0kYJpGlJjjqU
 Hlnumn3vwqlIY0/p3SzylUZtKq89AK15dacY/LbvVx20Q/pnZsu6Ov4IsAMcN+xdfGat
 sqlwclaGXtNbM7pqOQsPu2pnxQUv8B42uh7jY/Pg/a6kZUOh6QRAzcTf/KTr7wWcEpiJ
 004w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773009354; x=1773614154;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=kMKCTB0JgA7UPGciIJUTWbaxDO5eSFF+/kzpE0aUa0Y=;
 b=K/R/U9aFVQqxLUi1zWciAb/PbuxM8vc6rwkvws1cTkMLK8AXiYZxztBDFkVE0PLu/w
 cfLePciHEvramWPj1aJ6lcRPj8A1wZx60uJwg3Y/CBVoMcP8fqUFPWnBtauKW+fJCIoE
 SBFRCTaIvNGGNeiNfkvutDOcV4oipU/Ccgw1YNMnytkvUCAdvy3ovI8wm7DHuT6yQ96I
 +3dRQPYIHjk9VunNsdAkQhtK0JeSRdVhKDB6XBk5M2bVSjU8HvF8CgvVby3zD7G5OlYl
 UxeBWUmbS8pBtaUnmaZtJgudxTwfuvABfK/zC56Zwkrl9R0h2/yMfgJ57cjxB55XjLLW
 +/4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnb38pj3+rme4N4NZSs6PGQbVg5YhEdWvyX1WbLI7Diu4Kj1vYLicCo1rwg1YZnllRvd04nN1W0Hc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzfvejEeRjoHhYuLaKwsXSJrMysdIirAFI5shahsLYeR2hbU77S
 zYS8i5RAExu1wOq6cIMyPo8Uu4sHRz3xyntrXlDT3+gj0suglpWMRCs7
X-Gm-Gg: ATEYQzy7hkggxOY2lb+HcXeTdr31Tu5gCp3orzyTodDGnhmaTfPs68xRWMYYADve8vC
 uWQEFmaEVCrJxVEHeCmvcSKYVppwnwrND6bnA/9MtBcSIP51Lt3LQ4QbLg3Zig0w47iXtEd4oGl
 JfJy4m1mV3OBloMfLzLkmvS8nwt7EWdZEy8pQkx7bDdgcelO/ZL9d9xlZ0Wg/b3oQOgobuDkDDS
 pTphH/lfgsNpMNMiLDBibFTRimNZDILK0b9wu7OpDNVAQRh8cBEnS2dDLy2hqs0Yia5tQ8bWFJB
 +xo3A0jlz8HPPr8M4k+V3RXHiHh+iEmDqsccWmtVPUDLKJviEd1lzRmmR0Mp4DSa+pljfnoHDfz
 bI7TmuBW9o3tDICQ0C+I4A9wBoo4wAcwFDjPxg/R5NIqiZO4bqJA2NTfeYHI0Io2s/x5iZEXR+R
 mrZC+AtFQQ5Vtq+eWNHASEeg/suXvitSXD3l3F4dCMr/1Zgjp0qhMDk0apKoI=
X-Received: by 2002:a05:6808:6b8a:b0:45e:e173:f9ac with SMTP id
 5614622812f47-466dcb9baffmr5337559b6e.55.1773009354099; 
 Sun, 08 Mar 2026 15:35:54 -0700 (PDT)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 5614622812f47-466df93ce67sm4529016b6e.1.2026.03.08.15.35.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Mar 2026 15:35:53 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Jim Cromie <jim.cromie@gmail.com>, Matthew Auld <matthew.auld@intel.com>,
 Arun Pravin <arunpravin.paneerselvam@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Luca Coelho <luciano.coelho@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drivers/gpu/drm/drm_print: fix drm_printer dynamic debug
 bypass
Date: Sun,  8 Mar 2026 16:35:37 -0600
Message-ID: <20260308223538.96729-3-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260308223538.96729-1-jim.cromie@gmail.com>
References: <20260308223538.96729-1-jim.cromie@gmail.com>
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
X-Rspamd-Queue-Id: 76B1C2327C4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jimcromie@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:jim.cromie@gmail.com,m:matthew.auld@intel.com,m:arunpravin.paneerselvam@amd.com,m:christian.koenig@amd.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:luciano.coelho@intel.com,m:jani.nikula@intel.com,m:jimcromie@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,intel.com,amd.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jimcromie@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

drm_debug_enabled() is the canonical bit-test for drm.debug.

Commit 6ce6fae84536 ("drm_print: optimize drm_debug_enabled for
jump-label") renamed the original bit-test to drm_debug_enabled_raw()
and introduced an internal bypass for dyndbg. When [1]=y, it defined
__drm_debug_enabled() to evaluate to 'true', allowing dyndbg's
static-key to handle the filtering at the callsite. It also provided
drm_debug_enabled() for cases where an explicit bit-mask check is
still required.

Later, commit 9fd6f61a297e ("drm/print: add drm_dbg_printer() for drm
device specific printer") added __drm_printfn_dbg(), but mistakenly
used the internal bypass __drm_debug_enabled() instead of the
canonical drm_debug_enabled(). This went unnoticed because at the
time, [1]=y was marked BROKEN.

Because __drm_printfn_dbg() is a shared helper where the callsite is
not directly guarded by dyndbg's static-key, this caused it to hit
the 'true' bypass and always print, ignoring the drm.debug bit-mask.

This results in a flood of messages in environments with slow serial
consoles, as seen in DRM-CI on i915 CML devices. When IGT causes a
mismatch in intel_pipe_config_compare(), the resulting UART storm
causes a hard timeout after 20 minutes.

To fix this, change __drm_printfn_dbg() to use
drm_debug_enabled_instrumented() instead. This ensures the bit-test
is performed at runtime even when dyndbg is enabled. It also adds a
pr_debug() to help track the frequency of this bit-test.

Additionally, update __drm_dev_dbg() to use the canonical
drm_debug_enabled() instead of the internal __drm_debug_enabled().
While __drm_dev_dbg() is wrapped by a dyndbg factory and thus safe,
this change ensures consistency and clarifies the intended usage.

[1] CONFIG_DRM_USE_DYNAMIC_DEBUG

Fixes: 9fd6f61a297e ("drm/print: add drm_dbg_printer() for drm device specific printer")
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/drm_print.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index ded9461df5f2..9b622345e2eb 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -218,7 +218,7 @@ void __drm_printfn_dbg(struct drm_printer *p, struct va_format *vaf)
 	const struct device *dev = drm ? drm->dev : NULL;
 	enum drm_debug_category category = p->category;
 
-	if (!__drm_debug_enabled(category))
+	if (!drm_debug_enabled_instrumented(category))
 		return;
 
 	__drm_dev_vprintk(dev, KERN_DEBUG, p->origin, p->prefix, vaf);
@@ -335,7 +335,7 @@ void __drm_dev_dbg(struct _ddebug *desc, const struct device *dev,
 	struct va_format vaf;
 	va_list args;
 
-	if (!__drm_debug_enabled(category))
+	if (!drm_debug_enabled(category))
 		return;
 
 	/* we know we are printing for either syslog, tracefs, or both */
-- 
2.53.0

