Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 722A46519BB
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 04:42:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3311310E067;
	Tue, 20 Dec 2022 03:41:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B442610E055;
 Tue, 20 Dec 2022 03:41:24 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 w4-20020a17090ac98400b002186f5d7a4cso15238321pjt.0; 
 Mon, 19 Dec 2022 19:41:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xVh7BhiLAFK1y5fgqjdCBQvyDDgKeEj33/rk76TBR5s=;
 b=eIyMUGuhIXBj94VjBrAUhYLj+94tayhIXD10HOZKzIQ6CrgTN/phMZCweKAwIaCB8k
 oamV0qlLPDCgbgw7XnOEvPb4i4TP9cIkGd0h5jj5uofBKK52E7+6LLxTAhvXfkmkIBip
 VSX/P9iBKBhYtqZnVypFSj6sPW0lssLLdT4W0nQg2vMyQGXiWd6B4I7Fkx++aZ6uiZoA
 BgE3YZdcwBbhaAOm9F0Z/X++ekd/r+gI3p14y42+3M4stYmaJu2zuHihydMPYqQgxlf0
 a1c64nfggXO5y7B/yo7l9SuIvOrI0XMmDhcsfXkxUUYYMdTrJFeMwIoeTzYLQlXDqANx
 oUCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xVh7BhiLAFK1y5fgqjdCBQvyDDgKeEj33/rk76TBR5s=;
 b=l5wsMSOqDSOK89ShuY6N0arp7H6RZ8wYzo70XeZyEt4koHIbEiunF7aZs2NVgRvpwz
 XVOjDD6snQKbWc8f9W8r5oX+tP/nTJLpfI6rwr4UC1UMjJMSLaPYkJO74huG6KbV86ql
 Jql/M+/rwN9rhuJkHVtPHd4SBUZPdu0u1qkIs4ddxyASXlOAzNwlcIFj28vIsJWPlg9R
 tAbEqS6exg7xzHUW8WGv+c0FXjWC/pleIv/kGJ9ss9/Fyhh2adPQM+1Yqtz0/jerxgeY
 NvjAswWv4zmjvGn0NWb9lWhHpQ7JYT1MraG3pbGpZt4692xzqgEqjFAI5QnyrEtdGm2j
 lDWQ==
X-Gm-Message-State: ANoB5pl9kPdpp83nD8enBsSjd8HBUK6+PtWmIVXVoyBD4N+3mMPZnugo
 VylmvZKU4XcSK1+KP0zADOJp0jnzOdioO5IO
X-Google-Smtp-Source: AA0mqf6scQ9/TUdhQyckyTVN2l+rTWw5xP6+kf2svgdOWFmDqEGeGWPdfv/YMte1IhWDSljq4EL8Fg==
X-Received: by 2002:a17:902:6b08:b0:186:639f:6338 with SMTP id
 o8-20020a1709026b0800b00186639f6338mr11003150plk.6.1671507684172; 
 Mon, 19 Dec 2022 19:41:24 -0800 (PST)
Received: from mail.google.com (125-237-37-88-fibre.sparkbb.co.nz.
 [125.237.37.88]) by smtp.gmail.com with ESMTPSA id
 y16-20020a17090322d000b001896af10ca7sm7974566plg.134.2022.12.19.19.41.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Dec 2022 19:41:23 -0800 (PST)
Date: Tue, 20 Dec 2022 16:41:15 +1300
From: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] [next] i915/gvt: Replace one-element array with
 flexible-array member
Message-ID: <Y6Eu2604cqtryP4g@mail.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: paulo.miguel.almeida.rodenas@gmail.com, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

One-element arrays are deprecated, and we are replacing them with
flexible array members instead. So, replace one-element array with
flexible-array member in struct gvt_firmware_header and refactor the
rest of the code accordingly.

Additionally, previous implementation was allocating 8 bytes more than
required to represent firmware_header + cfg_space data + mmio data.

This helps with the ongoing efforts to tighten the FORTIFY_SOURCE
routines on memcpy() and help us make progress towards globally
enabling -fstrict-flex-arrays=3 [1].

Link: https://github.com/KSPP/linux/issues/79
Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101836 [1]
Signed-off-by: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
---
To make reviewing this patch easier, I'm pasting before/after struct
sizes.

pahole -C gvt_firmware_header before/drivers/gpu/drm/i915/gvt/firmware.o 
struct gvt_firmware_header {
	u64                        magic;                /*     0     8 */
	u32                        crc32;                /*     8     4 */
	u32                        version;              /*    12     4 */
	u64                        cfg_space_size;       /*    16     8 */
	u64                        cfg_space_offset;     /*    24     8 */
	u64                        mmio_size;            /*    32     8 */
	u64                        mmio_offset;          /*    40     8 */
	unsigned char              data[1];              /*    48     1 */

	/* size: 56, cachelines: 1, members: 8 */
	/* padding: 7 */
	/* last cacheline: 56 bytes */
};

pahole -C gvt_firmware_header after/drivers/gpu/drm/i915/gvt/firmware.o 
struct gvt_firmware_header {
	u64                        magic;                /*     0     8 */
	u32                        crc32;                /*     8     4 */
	u32                        version;              /*    12     4 */
	u64                        cfg_space_size;       /*    16     8 */
	u64                        cfg_space_offset;     /*    24     8 */
	u64                        mmio_size;            /*    32     8 */
	u64                        mmio_offset;          /*    40     8 */
	unsigned char              data[];               /*    48     0 */

	/* size: 48, cachelines: 1, members: 8 */
	/* last cacheline: 48 bytes */
};

As you can see the additional byte of the fake-flexible array (data[1])
forced the compiler to pad the struct but those bytes aren't actually used
as first & last bytes (of both cfg_space and mmio) are controlled by the
<>_size and <>_offset members present in the gvt_firmware_header struct.
---
 drivers/gpu/drm/i915/gvt/firmware.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/firmware.c b/drivers/gpu/drm/i915/gvt/firmware.c
index a683c22d5b64..dce93738e98a 100644
--- a/drivers/gpu/drm/i915/gvt/firmware.c
+++ b/drivers/gpu/drm/i915/gvt/firmware.c
@@ -45,7 +45,7 @@ struct gvt_firmware_header {
 	u64 cfg_space_offset;	/* offset in the file */
 	u64 mmio_size;
 	u64 mmio_offset;	/* offset in the file */
-	unsigned char data[1];
+	unsigned char data[];
 };
 
 #define dev_to_drm_minor(d) dev_get_drvdata((d))
@@ -77,7 +77,7 @@ static int expose_firmware_sysfs(struct intel_gvt *gvt)
 	unsigned long size, crc32_start;
 	int ret;
 
-	size = sizeof(*h) + info->mmio_size + info->cfg_space_size;
+	size = offsetof(struct gvt_firmware_header, data) + info->mmio_size + info->cfg_space_size;
 	firmware = vzalloc(size);
 	if (!firmware)
 		return -ENOMEM;
-- 
2.38.1

