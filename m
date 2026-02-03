Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLL0B3mkgWnuIAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 08:32:09 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDDFD5B97
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 08:32:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F039310E554;
	Tue,  3 Feb 2026 07:32:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bkt0f/bF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72E1F10E556
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 07:32:06 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id
 41be03b00d2f7-c227206e6dcso3255282a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Feb 2026 23:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770103926; x=1770708726; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JVbsoeLJUH+6Qu+riey08jBhyxYlZrCyG0lFJ2fnhgw=;
 b=bkt0f/bF2klTba0+ERrIWH2piZYb1PVsByJDHTpEvSGNvKPtyfLxUx0WmsoNbxxL1i
 OrlVlpJDC/nH0SiE6iPNu35PTwzDUXTzr53U9Na9s+qh7X3Wam8jQ9B8YHzHM5rXePNL
 AvtY2BvvIJsMlHtSBJ1PeKqZfpGqKVhy9iavULw9d+9/fWoGMYSEvrr8I/XA/hQ0kmc9
 RrKRJcKha+lywKgFekC9WCLWtcrJ+KNpauKmYAJCtwNhROqckuX+pF3qNWkPOIfG9e6S
 ReCN8YNvOFhmPT7Xs617bj+NtssCKzssz7ZbS62zicU6VlGn5MyhDkYAmvdF1mFq/HkM
 V4xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770103926; x=1770708726;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JVbsoeLJUH+6Qu+riey08jBhyxYlZrCyG0lFJ2fnhgw=;
 b=FY+1sjVFHhapv0jPlnZJJalDx36Xf+fjQi8WN8kWY7jCDaumRVf3Rxv9m4OqvjsjLd
 Gt3VYmk2ecANEGtHjabT3jD8Mobjq5oxLIVmrExHQcX6NRwj29LM/ybrEg2i50Momgvm
 jLyWSJWtkA77sUsxCuFzMHvZ9+hd3iqxOHRwrScllHtzC6x+62bStuBqGCwTV6qUHWIK
 mIHnFXcCzDJMPGTD6gIOywxykkVfxB5meWl0168bhQ5P8/BYKQjEcQYypRyKE8SX10cW
 eeWeL3BkfpY3yocGiC2zPd9Vd6yMhesFVNjuAiLLX6gr8ne1y9ObUa0bwls2Lq4V3ByR
 hZYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgFYHqwXm61lVMnugJAmeLwZYhlEOnIQEy4gIIJ880OKIHwJlIRogL7wB2lj6g/JuvDztagCnskps=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwLTsamDOiDQglf4uwb6dLOrHejwqNB66hPAuHbPp/ThsW+085c
 ApFX+F2MCpz2LLefqJHin14QOzLmkhNikfuEo5wHFd3qCbtsHThXWKU=
X-Gm-Gg: AZuq6aLpFXVGJgqthV7KCzfyavlIHDtF1vLgHe+3FIKVMyTxkIIGyh4LA8zJI5+IGG4
 Xl+1ktfg47+aSEwQZW2c4YQFKUPAFopfDunQYKM7W+rSn36P7Gco2iL+zCvq/jGfuu+zCIXoPaf
 zvNG1rU2exX62OZUR2G8UOndE0PUqHdI8adXLT3yfVrTs9YJsfC6Og/aYmeklXs7CTBBBgVbiwg
 UC1j+YiWI3I35iaCCOfaqCWqnrNtTkVB6IMuNjo+phke7Qh7+zIaLu9I/oruuCuof5sPeAbh/ir
 47zRVICoH55ZPwRpxRKD8E40PSWNaNXXmVfIeFLrAfSx6DSTXEZjy0p8AZCy27UuNxKpVmI17H+
 LCGwrWQ92anj+902fIa4oLEgBZFhOSWFBR/umWCNFQ1S/gVLSq8JmzrCyLqLzDwzpX7y+KG3gPA
 vkk1UfBjvPDRKD09w=
X-Received: by 2002:a17:902:e996:b0:295:9b73:b15c with SMTP id
 d9443c01a7336-2a8d9a57c7emr96695715ad.42.1770103925941; 
 Mon, 02 Feb 2026 23:32:05 -0800 (PST)
Received: from at.. ([171.61.163.171]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a8dc225534sm108280865ad.68.2026.02.02.23.31.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Feb 2026 23:32:05 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
 Jani Nikula <jani.nikula@intel.com>, Ard Biesheuvel <ardb@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "Borislav Petkov (AMD)" <bp@alien8.de>, Ingo Molnar <mingo@kernel.org>,
 Francesco Pompo <francescopompo2@gmail.com>,
 Lenny Szubowicz <lszubowi@redhat.com>, linux-efi@vger.kernel.org,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v3 2/2] drm/i915/display: Disable display for iMac's
Date: Tue,  3 Feb 2026 07:31:18 +0000
Message-ID: <20260203073130.1111-3-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203073130.1111-1-atharvatiwarilinuxdev@gmail.com>
References: <20260203073130.1111-1-atharvatiwarilinuxdev@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:atharvatiwarilinuxdev@gmail.com,m:jani.nikula@intel.com,m:ardb@kernel.org,m:jani.nikula@linux.intel.com,m:rodrigo.vivi@intel.com,m:joonas.lahtinen@linux.intel.com,m:tursulin@ursulin.net,m:airlied@gmail.com,m:simona@ffwll.ch,m:tzimmermann@suse.de,m:javierm@redhat.com,m:bp@alien8.de,m:mingo@kernel.org,m:francescopompo2@gmail.com,m:lszubowi@redhat.com,m:linux-efi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:intel-xe@lists.freedesktop.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[atharvatiwarilinuxdev@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,intel.com,kernel.org,linux.intel.com,ursulin.net,ffwll.ch,suse.de,redhat.com,alien8.de,vger.kernel.org,lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[atharvatiwarilinuxdev@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: ABDDFD5B97
X-Rspamd-Action: no action

Disable display on iMacs, as they can't do link training
on the internal display.

(tested on iMac20,1)

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
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

