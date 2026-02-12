Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +FaHC58bjWm/zAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 01:15:27 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D8E1288F4
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 01:15:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCE5C10E6C9;
	Thu, 12 Feb 2026 00:15:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="O4OXxiWe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B264410E69D
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 00:15:12 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id
 46e09a7af769-7cfd9b898cdso1634051a34.2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 16:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770855312; x=1771460112; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9lHOKO5Z1S0YHUeyqIjWpAzTDnGKmr84ayIY/cC+kSI=;
 b=O4OXxiWeWoR+tWf2erI/heJ/mMVgVOF4Tfs/M8gz5oUXsp8QbCLV0WuGsuC57u5ij5
 qW6BRT3y/iZwnXpySGyiV5Ong3R6978D9wP7NZ+JSrKG99zpbvBO2IFpKhLd31uGCrM6
 Yg2uj90OPPPfHTJCLI4f190i3FB9iwOcXvGY28r3bPjyTarm7XL+tRQj9RoQ4oZd5iM7
 KRUuCaWLI5CkVzCggGrBCNIBfQ0gXVVKsG+yjFuczzACYUyM0et60g7DiWLAf/38EF37
 YAU5xTql5L6eZfCJJE2/NMfhkT1rq/BCiWw4QmsjHS26i+QmEogCcFHpxwBxALGv98r1
 iMAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770855312; x=1771460112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9lHOKO5Z1S0YHUeyqIjWpAzTDnGKmr84ayIY/cC+kSI=;
 b=TQ2w/a5+LM/oo9DjrSP2vwvzTT7uSQQpbkU98w7P5qafy3/thOSOAG7GapNN+RQNwD
 BpdeW6BCX/t/Ncamdz0827ujoYSvlQQjy1o2RdxaUFY6MNxe9B9JJgGMb4tS+0nE5rIN
 Haqs4cw+wxGrfBvnVhqtTY7MEaVOIZCtmAdcLwC4MRY3t2/kvD+wZ9q3tTPj8Cj9JTc9
 Kbk0kUQvVPrm+Xp0C7ILSJZOZqijw/gMbGvtPFxhWlYKABhJQ2X57VdSkCMPMym6FeZ4
 YwJJAbbYSS+SBbiu9bYhQY39YdSbHuOvKhcaaavhKIWcHopwzOT5z4X0xOJRQpx0HCf6
 KiCA==
X-Gm-Message-State: AOJu0YxLqQPcfHQ9ATtWL790XU5NFBEcyTmpia93QNm1qGA/l22JvMrs
 Yj3NLQQ54XNC1yuqAXo7J/s2rwb83eOVsyZm3LfYuLC5kmIItim3Xw57uriOqA==
X-Gm-Gg: AZuq6aItNYO03TsEwZQ/zX5LazdjW1aKttGlz55vFugUgyKX6EfT8sUAoFw61KwMYbu
 fTQC3bc6QGDc4V8+f3MbMyzLOebB6r3AWCsgmw0WQmSqETXNq4ain51C1H2fmT8nx9j/yx57rui
 D5kI4jKaqO1QfrdoEGL3Wh+wbN7ED2Bt8B62tYxofHqYtC/a1os4XP4wHOcUa2xPJcTN6tNP3Rt
 YXbqC4kO816qp9Zh0iyfs5qq7ePEGLuBjiwGqPnjI31GfaPZ+ZCBthlK3YC+0mlkH/5QL56LcUe
 u7Wq68Lcj0a3jU+L6G71Fgqmxfq8+4A9gZj/ZLEVSsnv11YRXtWOzrPBnfZvizyo3N1cB19o/Ga
 dqjjz/5qlP+6KeJp+cF4sauhifcumIW8P9vEhK0i531HpaY3nI0e781B+bpBRiHdK8q1JemRIg7
 Vdj5NejlmV26QpcBe16Bk3AbyuzMRNXgsFZHp0hCEy3nrh6NDzjdz5
X-Received: by 2002:a05:6820:2905:b0:663:23a:cafc with SMTP id
 006d021491bc7-675ddc0cf68mr148223eaf.67.1770855311806; 
 Wed, 11 Feb 2026 16:15:11 -0800 (PST)
Received: from godzilla (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 586e51a60fabf-40eaf1062ffsm2331939fac.13.2026.02.11.16.15.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Feb 2026 16:15:11 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx-trybot@lists.freedesktop.org
Cc: Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 57/61] accel: add -DDYNAMIC_DEBUG_MODULE to subdir-ccflags
Date: Wed, 11 Feb 2026 17:13:52 -0700
Message-ID: <20260212001359.97296-58-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260212001359.97296-57-jim.cromie@gmail.com>
References: <20260212001359.97296-1-jim.cromie@gmail.com>
 <20260212001359.97296-2-jim.cromie@gmail.com>
 <20260212001359.97296-3-jim.cromie@gmail.com>
 <20260212001359.97296-4-jim.cromie@gmail.com>
 <20260212001359.97296-5-jim.cromie@gmail.com>
 <20260212001359.97296-6-jim.cromie@gmail.com>
 <20260212001359.97296-7-jim.cromie@gmail.com>
 <20260212001359.97296-8-jim.cromie@gmail.com>
 <20260212001359.97296-9-jim.cromie@gmail.com>
 <20260212001359.97296-10-jim.cromie@gmail.com>
 <20260212001359.97296-11-jim.cromie@gmail.com>
 <20260212001359.97296-12-jim.cromie@gmail.com>
 <20260212001359.97296-13-jim.cromie@gmail.com>
 <20260212001359.97296-14-jim.cromie@gmail.com>
 <20260212001359.97296-15-jim.cromie@gmail.com>
 <20260212001359.97296-16-jim.cromie@gmail.com>
 <20260212001359.97296-17-jim.cromie@gmail.com>
 <20260212001359.97296-18-jim.cromie@gmail.com>
 <20260212001359.97296-19-jim.cromie@gmail.com>
 <20260212001359.97296-20-jim.cromie@gmail.com>
 <20260212001359.97296-21-jim.cromie@gmail.com>
 <20260212001359.97296-22-jim.cromie@gmail.com>
 <20260212001359.97296-23-jim.cromie@gmail.com>
 <20260212001359.97296-24-jim.cromie@gmail.com>
 <20260212001359.97296-25-jim.cromie@gmail.com>
 <20260212001359.97296-26-jim.cromie@gmail.com>
 <20260212001359.97296-27-jim.cromie@gmail.com>
 <20260212001359.97296-28-jim.cromie@gmail.com>
 <20260212001359.97296-29-jim.cromie@gmail.com>
 <20260212001359.97296-30-jim.cromie@gmail.com>
 <20260212001359.97296-31-jim.cromie@gmail.com>
 <20260212001359.97296-32-jim.cromie@gmail.com>
 <20260212001359.97296-33-jim.cromie@gmail.com>
 <20260212001359.97296-34-jim.cromie@gmail.com>
 <20260212001359.97296-35-jim.cromie@gmail.com>
 <20260212001359.97296-36-jim.cromie@gmail.com>
 <20260212001359.97296-37-jim.cromie@gmail.com>
 <20260212001359.97296-38-jim.cromie@gmail.com>
 <20260212001359.97296-39-jim.cromie@gmail.com>
 <20260212001359.97296-40-jim.cromie@gmail.com>
 <20260212001359.97296-41-jim.cromie@gmail.com>
 <20260212001359.97296-42-jim.cromie@gmail.com>
 <20260212001359.97296-43-jim.cromie@gmail.com>
 <20260212001359.97296-44-jim.cromie@gmail.com>
 <20260212001359.97296-45-jim.cromie@gmail.com>
 <20260212001359.97296-46-jim.cromie@gmail.com>
 <20260212001359.97296-47-jim.cromie@gmail.com>
 <20260212001359.97296-48-jim.cromie@gmail.com>
 <20260212001359.97296-49-jim.cromie@gmail.com>
 <20260212001359.97296-50-jim.cromie@gmail.com>
 <20260212001359.97296-51-jim.cromie@gmail.com>
 <20260212001359.97296-52-jim.cromie@gmail.com>
 <20260212001359.97296-53-jim.cromie@gmail.com>
 <20260212001359.97296-54-jim.cromie@gmail.com>
 <20260212001359.97296-55-jim.cromie@gmail.com>
 <20260212001359.97296-56-jim.cromie@gmail.com>
 <20260212001359.97296-57-jim.cromie@gmail.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[jimcromie@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: D3D8E1288F4
X-Rspamd-Action: no action

With DRM_USE_DYNAMIC_DEBUG=y and CONFIG_DYNAMIC_DEBUG=n, accelerator
modules are missing the _dynamic_func_call_cls macro, due to its
conditional definition in dynamic_debug.h, which depends upon
-DDYNAMIC_DEBUG_MODULE.  Add that to subir-ccflags for all accels, in
accel/Makefile.

NB: Given the CONFIG_DRM_ACCEL items, accels *are* DRM modules.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/accel/Makefile | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/Makefile b/drivers/accel/Makefile
index 1d3a7251b950..18d917e868f6 100644
--- a/drivers/accel/Makefile
+++ b/drivers/accel/Makefile
@@ -1,8 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
+subdir-ccflags-$(CONFIG_DRM_USE_DYNAMIC_DEBUG) += -DDYNAMIC_DEBUG_MODULE
+
 obj-$(CONFIG_DRM_ACCEL_AMDXDNA)		+= amdxdna/
 obj-$(CONFIG_DRM_ACCEL_ARM_ETHOSU)	+= ethosu/
 obj-$(CONFIG_DRM_ACCEL_HABANALABS)	+= habanalabs/
 obj-$(CONFIG_DRM_ACCEL_IVPU)		+= ivpu/
 obj-$(CONFIG_DRM_ACCEL_QAIC)		+= qaic/
-obj-$(CONFIG_DRM_ACCEL_ROCKET)		+= rocket/
\ No newline at end of file
+obj-$(CONFIG_DRM_ACCEL_ROCKET)		+= rocket/
-- 
2.53.0

