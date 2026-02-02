Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UDD7OGKLgGnO9wIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 12:32:50 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 933AECBAFC
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 12:32:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC27A10E473;
	Mon,  2 Feb 2026 11:32:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dP7I7VP8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A191910E43C
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 11:32:47 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id
 41be03b00d2f7-c227206e6dcso2678279a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Feb 2026 03:32:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770031967; x=1770636767; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iIhY4QZTPPdLq2TRpxo21LNBMq6aPIcLWQcnhCbf1Bo=;
 b=dP7I7VP8TaXAowxLJA3CKzsYzRzf9cTmPHn9l7MCULyAxl1felVL7+BUQ8s6YwkyRX
 lo/ovCN6WszcDg1JHgXDL09X8Egzc1CxeP8wKeH/gwFP0DuWL0LCgbrZ8mgxa29WkOXD
 Mq7+NQHQRGqBKV5X0RuSvfNh1u+8oNJNDm8aCVez63pxaU3VmgDWrfHovw5psys6ktEt
 NLaklvtJcXHiqyTjOEdPaYiCx53256z/t5ajyEaj7Mttilzn0A9hUNVx7lyytS72S10V
 P4gPEj17rabqEt6hPGjTGI6goPUK95at4ykWwSp/zFa/igUpvRz9UEiuHpjJjo78PmxS
 moNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770031967; x=1770636767;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=iIhY4QZTPPdLq2TRpxo21LNBMq6aPIcLWQcnhCbf1Bo=;
 b=f1CGKySsz1MMxp4H14l1s4gGa5b1ulUPbZRV3Km6687MendVIICC2+qL5H9eFcxqjc
 +6/6c0obar+Rkv37wwClgJ9hH2joQVpYs2ZvVzL/Yrb5sLpd3RyjMP/02cZsS7DUSA90
 q8B0KR6YWMl3kvUU9YIxU6qsyXasgvFkpFqN/1VwNpgbh76gU0WfNHRzltqmUfUiMfs6
 NJ6lwFTl2RgV5NO0nWeMNfx1tz4p9cbuC9eQ6KuVhBz6g/VfXXjjKPoCEQdZqcrFJN9U
 jdEwcMsoMZxThKP3ORGsTQRj9wa4z1kWFgU5tMghtUu2BrwWow8ye/CDql885TiDnbeG
 f+ZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWn4kXDmielvuWmKyeaLuOj/Z+hkaepL8AOThFcWai66e4o+9z8SZK5AyEjP6pycj78G2SjHOHKrug=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzTOArfiJC+AA7Q3QAgMSiCnEol6KwZbUOhLX0EbkeaApuJ/gsI
 v1JuOlQrgUZkZFoBbTmg7cVXeq7ibjNjJcByq9eheALFo+zFCYoR99KX
X-Gm-Gg: AZuq6aJmkdm9rJg3UIPfICBjwVS9HFGaLz8enrs29hR8bZr6KnyAx7kWsu181Ti8ehO
 mCT4odMzgOPuV8S/TEQniDaUIFejWFQ/GHqib+Ta97Pd0+l+0PR1/jL/CpfdHLAI8xoHh8l4fsh
 y75yBRu+8p0xzGWfncXSB0HBpxm9mr5+nt5/vn35oUTgqE2XB4IUaToZ51kdXeA3MsIPqjTMFWd
 R2wydIPc0We6KFNbBWkQqNRnkaywZ01D/YaSvy3AWTPJW1bfWWTQc78b5T6Eq53GqD4E0z6s1K0
 1HbyAGSvvyzP0kI/aiB1PNQm+PXYDvpOAHwpEZlzfM0TZN8Is5jliBgBno7SnwgKCYX9klm/Pa6
 +iFO0h4WsKE7iUGnyCv/V2km1KLY8XXm+nmnjmvRzIbHtfe8DKTS0lzl4YgqXDxjLd966tfQvfE
 n2ZW++bclNutGRRwtmR3nUdNQ399zvESQ1Q6Oqy2XsAb1flO0z
X-Received: by 2002:a17:90b:2e10:b0:32d:a0f7:fa19 with SMTP id
 98e67ed59e1d1-3543b39c961mr12734825a91.17.1770031967103; 
 Mon, 02 Feb 2026 03:32:47 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([121.185.186.233])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c642a9f539dsm13743190a12.26.2026.02.02.03.32.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Feb 2026 03:32:46 -0800 (PST)
From: Jeongjun Park <aha310510@gmail.com>
To: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Jeongjun Park <aha310510@gmail.com>
Subject: [PATCH 2/3 v2] drm/exynos: vidi: fix to avoid directly dereferencing
 user pointer
Date: Mon,  2 Feb 2026 20:32:33 +0900
Message-Id: <20260202113234.183393-3-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260202113234.183393-1-aha310510@gmail.com>
References: <20260202113234.183393-1-aha310510@gmail.com>
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
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:inki.dae@samsung.com,m:sw0312.kim@samsung.com,m:kyungmin.park@samsung.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:krzk@kernel.org,m:alim.akhtar@samsung.com,m:linux-arm-kernel@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:aha310510@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[aha310510@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,kernel.org,samsung.com,lists.freedesktop.org,lists.infradead.org,vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[aha310510@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 933AECBAFC
X-Rspamd-Action: no action

In vidi_connection_ioctl(), vidi->edid(user pointer) is directly
dereferenced in the kernel.

This allows arbitrary kernel memory access from the user space, so instead
of directly accessing the user pointer in the kernel, we should modify it
to copy edid to kernel memory using copy_from_user() and use it.

Cc: <stable@vger.kernel.org>
Fixes: 221009347844 ("drm/exynos/vidi: convert to struct drm_edid")
Signed-off-by: Jeongjun Park <aha310510@gmail.com>
---
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index 1fe297d512e7..601406b640c7 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -251,13 +251,27 @@ int vidi_connection_ioctl(struct drm_device *drm_dev, void *data,
 
 	if (vidi->connection) {
 		const struct drm_edid *drm_edid;
-		const struct edid *raw_edid;
+		const void __user *edid_userptr = u64_to_user_ptr(vidi->edid);
+		void *edid_buf;
+		struct edid hdr;
 		size_t size;
 
-		raw_edid = (const struct edid *)(unsigned long)vidi->edid;
-		size = (raw_edid->extensions + 1) * EDID_LENGTH;
+		if (copy_from_user(&hdr, edid_userptr, sizeof(hdr)))
+			return -EFAULT;
 
-		drm_edid = drm_edid_alloc(raw_edid, size);
+		size = (hdr.extensions + 1) * EDID_LENGTH;
+
+		edid_buf = kmalloc(size, GFP_KERNEL);
+		if (!edid_buf)
+			return -ENOMEM;
+
+		if (copy_from_user(edid_buf, edid_userptr, size)) {
+			kfree(edid_buf);
+			return -EFAULT;
+		}
+
+		drm_edid = drm_edid_alloc(edid_buf, size);
+		kfree(edid_buf);
 		if (!drm_edid)
 			return -ENOMEM;
 
--
