Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMRyA6bWl2lJ9QIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 04:36:06 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B49C316468B
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 04:36:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15B6510E778;
	Fri, 20 Feb 2026 03:36:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lwjnmFP5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3526510E777
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Feb 2026 03:36:02 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id
 41be03b00d2f7-c6e1f417918so470184a12.3
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 19:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771558561; x=1772163361; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3SNYtFmJqSV95moRlaJ0QYmUhL+TICukmgmBhi3zA4c=;
 b=lwjnmFP5LH4otq9DYJFdu7fIov91VYgZagy2CDZPS8pRao6m/nsQKZvhB56MDuvo6w
 URsyGHrQXlDKoX5VOGQtodjsCoP9q7Uluisp65gWO9Xvkc5hQfXb3sfD+5WcDeqXAg0O
 zEnypRvhBMmwq8SaA5gsQBATFK7eFHLMwFS2L+0IKphHt3xZKjXEk1dZ92mEyPAib2Wd
 S5E3LhQgJuPSJhZZif2nfaejpMi0eYSH+cGD/V+fkIzVhPZhMzcdMwJH8X1SgPN5w7H/
 JoQgPgxmrz6fjcUSBK4u5u+AWpYoMTSvhQvPwDn4J14iLI85mek+zZCGQjX4VlnVEPqS
 KChA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771558561; x=1772163361;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=3SNYtFmJqSV95moRlaJ0QYmUhL+TICukmgmBhi3zA4c=;
 b=qJOtkyWWjmQ9oMsxWTrPBE6c0QyiMxLdI0TDOJ0gy2Lybi9yLy0H9H/qROTHhfryoE
 zJRKDbbLnqFRsaq8pUnpjY9Hr5uL9brhrxCNbKJtGyvoop/Cgl6Yelg9FvRgNxA8nx2s
 YJWSvV/0h8b878LOgxIhHr0RzN7c4pu1JxjXv2Hzeovx+UmqVedrtZjoJjJbu4zMmFr3
 T4pcd9aGmVjwIiTq1DF0jl4hijD9tgG1YXTKyDs/bcKSGTqHPKPeEcioNRH0orZ3EX2k
 VIC52pzYoGSOKnel5ARfESh4KvTsoLZc1j6f3kceIknk1m67mEQHzNmGmxCfEu9D4DTF
 WpVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhZo8zd9fGWulkn2vsxaF2mwu6/4/60ca7BN7GB4xfgZsxpfdkK7w4nL1PhD5CskhyZu9bpeSwQXc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxN+LOcwTJpUcpa/oOwXUunloDCDpS/G9im6Tl3vecvYk3Uut/7
 Y11fAj04VS6aD+YJSoTXFEfMJj7uuidspbCsP+umoWhe6revNc5JfNVd
X-Gm-Gg: AZuq6aLFVbiOUcpJ6oP66zh8T4yPG+nP62wsRtYSCWO0krPumzXSGtPdIocPegKiuX7
 MUozW3gpcXIho8NFChcmjseNrgKQhm8hgGeXTDriS+3l4Akg2DDAer1N5NG+9cQHIoR6Ng0Biud
 oSetlaUnbA0SXc6oZtoZpytJ6yafiDLwrDwjPhmiEeJ3i2jWOmZF+H3UlhFBsiUy2dtpnGp+RwL
 /nZ+TWuLn3WHXX9MqTTbfSXSIP1SxhsziegpZ61he14Hx4jfGCdpvIMgr7bAlyjTSsHWvtcvj20
 GaDRTE8La4EBdcsjCRoP7gsrXzXL2Ckg9cXn3wPHlBUMApTgjpx9/6TfxWluVncNeDU9uvhTNXt
 cYst8sphUcYRdbg/KCadmrGOy8DvbxsgYJ+a4pRhBo9yJYSS8Iso1X9VAATjyX4rwfk1w96rqHX
 nXTwRxYptPAvhcDaspVwAXR+rufRcpL36xf0bI3yMhW58l9RbPosOHqpszK9vL
X-Received: by 2002:a17:902:da8d:b0:2a7:80ac:85b0 with SMTP id
 d9443c01a7336-2ad17431c2bmr182977825ad.2.1771558561498; 
 Thu, 19 Feb 2026 19:36:01 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([121.185.236.165])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ad1a9d5cf8sm177143675ad.52.2026.02.19.19.35.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 19:36:01 -0800 (PST)
From: Jeongjun Park <aha310510@gmail.com>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jeongjun Park <aha310510@gmail.com>
Subject: [PATCH 6.19.y 6.18.y 2/2] drm/exynos: vidi: fix to avoid directly
 dereferencing user pointer
Date: Fri, 20 Feb 2026 12:35:50 +0900
Message-Id: <20260220033550.124346-3-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260220033550.124346-1-aha310510@gmail.com>
References: <20260220033550.124346-1-aha310510@gmail.com>
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,samsung.com,gmail.com,ffwll.ch,kernel.org,lists.freedesktop.org,lists.infradead.org,vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:stable@vger.kernel.org,m:gregkh@linuxfoundation.org,m:inki.dae@samsung.com,m:sw0312.kim@samsung.com,m:kyungmin.park@samsung.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:krzk@kernel.org,m:alim.akhtar@samsung.com,m:linux-arm-kernel@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:aha310510@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[aha310510@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aha310510@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[samsung.com:email]
X-Rspamd-Queue-Id: B49C316468B
X-Rspamd-Action: no action

[ Upstream commit d4c98c077c7fb2dfdece7d605e694b5ea2665085 ]

In vidi_connection_ioctl(), vidi->edid(user pointer) is directly
dereferenced in the kernel.

This allows arbitrary kernel memory access from the user space, so instead
of directly accessing the user pointer in the kernel, we should modify it
to copy edid to kernel memory using copy_from_user() and use it.

Cc: <stable@vger.kernel.org>
Signed-off-by: Jeongjun Park <aha310510@gmail.com>
Signed-off-by: Inki Dae <inki.dae@samsung.com>
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
