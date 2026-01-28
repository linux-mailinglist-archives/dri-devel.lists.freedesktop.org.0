Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CH36JVQkemmv2wEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 15:59:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2EDA3664
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 15:59:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A018F10E711;
	Wed, 28 Jan 2026 14:59:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="g8L04+IK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8108810E712
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 14:59:29 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-2a7786d7895so47392375ad.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 06:59:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769612369; x=1770217169; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aXyZBm2HT5a2syRm7I8O8JEOj9+5Hm8S0vVHV9UIr+Q=;
 b=g8L04+IK5edafrFewkF4egpq/1U4F9l3c5eUEiLuZ8xy479s1ZoS68Qup0umF8kqqr
 42/k7Ve20KT4sZUbc4Fi3rtjUSh7uWjAojcbybVgcV9GD5cxrb6XOw6yeskXwWYp1xy1
 FW7FKIZQvStzzk8R+d3Wr/s04H1OBpN6FqbxJQoQ2ZTxlFvo8h7Sa1KDsvZHLdB1skYG
 hLeBwm8WGB4L8hjYyI+OcOoTgM+NdtjY4B8YJ2tUcqRkqXTavkQBRB3VuuyRNAgMxvAL
 BR14NnC2zC3xsKGpCsh9R0VxOU0sS1SZFbZdQpUdzgkqNtYHdCjvPVtQ8MfzU8RzRyso
 KnuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769612369; x=1770217169;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=aXyZBm2HT5a2syRm7I8O8JEOj9+5Hm8S0vVHV9UIr+Q=;
 b=obQaK9GYB0279/CNIuQE8yKI5tfeFgpX//PE4j75obXUbuBaEEzmAbhzTYumvcXCLt
 ibdp5UegNzD/93SrtbFLZ80Je6b1igpe2kE1uvxQ6i/tj/NF32KLr08S5WR1UmnOaZur
 2GJLof8V1IlZQqgyznwnqQOXLhc0t6h9oJ69KkEMnp+KsWqUz+LWDp5+kMEl+ce1vHxO
 COSkKOW1G7AUO1pI2t+9SdysEwX9lBoIVa2jRqEFUj1lvuGQB+MO/RcWE2rw5L9++Ub1
 dpVuaEn7il1u1bPrqey51jYmYBWdppS3WAedjthSdeJMfxeBPvaO0sbkWmVO2SENMYHX
 6PNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVG1BGESTN1ycjCFsxMC4tkwFy530lVst+HzUmo6HhDrh/2lXt5e0gLHg5vIabH3/1MLd2TVwM2vI0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzOXuQ9zDNvysbLbuFaO+qjZkvKaNg+sIMd6Fj4EJ4C/SyVkGX9
 XaBT/hRuv2MI5hasGWD6/OUnUnFUbzhS+Aeta/SjCaZAY9inMH2IXN4=
X-Gm-Gg: AZuq6aLNzSj3lTdkS5V+6Yix5i6QNT7juh4TgL2oOFCzL+VaGh+6mpnfClwHkvde89e
 KHpOpuX1m3c4bv/9UhpmQWkBaz6bzj06+FEXfaxVN8Baq+9W2NeCad3qtjIucaAaFq6jhxpD6xv
 1va1K4CVt04ucCV5OkJ2f0KJxjGTWgAL+1Z4rSMATjSrthpC5NVGArdC31+aNvLUE0hpamw/rFI
 qRmvcNwlZyPqdnNk5Eo+ylMuplvZxSD0p1VF+G3NmAPd+OkaDVeDfopPOBH60hHUUJwRXVE2M9k
 BUm4csbziPfImWkRpkHMFcRe7bWYlwzGwa4HOQhAZZALyW3Nx/fvbIZPQUrIhnnkGdbZJ5ptj/C
 DdC6MBR1hURkw1pUgiPN3bauc91nwXxrVcmeN2wjBAUcpQUdjCA5sedqem6gJm/CBinNLZwXfTp
 mCl5uTvmr3lpOj
X-Received: by 2002:a17:902:ce0d:b0:2a7:d7b8:7661 with SMTP id
 d9443c01a7336-2a870d536c7mr48989305ad.4.1769612368925; 
 Wed, 28 Jan 2026 06:59:28 -0800 (PST)
Received: from at.. ([171.61.161.8]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a88b5d9a7bsm25820235ad.79.2026.01.28.06.59.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jan 2026 06:59:28 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
 Ard Biesheuvel <ardb@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "Borislav Petkov (AMD)" <bp@alien8.de>,
 Lenny Szubowicz <lszubowi@redhat.com>,
 Francesco Pompo <francescopompo2@gmail.com>, linux-efi@vger.kernel.org,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/i915/display: Disable display for iMac's
Date: Wed, 28 Jan 2026 14:58:38 +0000
Message-ID: <20260128145855.1071-3-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260128145855.1071-1-atharvatiwarilinuxdev@gmail.com>
References: <20260128145855.1071-1-atharvatiwarilinuxdev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:atharvatiwarilinuxdev@gmail.com,m:ardb@kernel.org,m:jani.nikula@linux.intel.com,m:rodrigo.vivi@intel.com,m:joonas.lahtinen@linux.intel.com,m:tursulin@ursulin.net,m:airlied@gmail.com,m:simona@ffwll.ch,m:tzimmermann@suse.de,m:javierm@redhat.com,m:bp@alien8.de,m:lszubowi@redhat.com,m:francescopompo2@gmail.com,m:linux-efi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:intel-xe@lists.freedesktop.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[atharvatiwarilinuxdev@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linux.intel.com,intel.com,ursulin.net,ffwll.ch,suse.de,redhat.com,alien8.de,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[atharvatiwarilinuxdev@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 4A2EDA3664
X-Rspamd-Action: no action

Disable display on iMacs, as they can't do link training
on the internal display.

(tested on iMac20,1)

Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
---
 .../gpu/drm/i915/display/intel_display_device.c    | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_device.c b/drivers/gpu/drm/i915/display/intel_display_device.c
index 1170afaa8680..b1fec1018d7e 100644
--- a/drivers/gpu/drm/i915/display/intel_display_device.c
+++ b/drivers/gpu/drm/i915/display/intel_display_device.c
@@ -3,6 +3,7 @@
  * Copyright © 2023 Intel Corporation
  */
 
+#include <linux/dmi.h>
 #include <linux/pci.h>
 
 #include <drm/drm_color_mgmt.h>
@@ -1435,7 +1436,18 @@ static bool has_no_display(struct pci_dev *pdev)
 		{}
 	};
 
-	return pci_match_id(ids, pdev);
+	static const struct dmi_system_id dmi_ids[] = {
+		{
+			.ident = "Apple Inc. iMac",
+			.matches = {
+				DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "Apple Inc."),
+				DMI_MATCH(DMI_PRODUCT_NAME, "iMac"),
+			}
+		},
+		{}
+	};
+
+	return pci_match_id(ids, pdev) || dmi_check_system(dmi_ids);
 }
 
 #define INTEL_DISPLAY_DEVICE(_id, _desc) { .devid = (_id), .desc = (_desc) }
-- 
2.43.0

