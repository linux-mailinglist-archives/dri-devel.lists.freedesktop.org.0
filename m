Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eMKTJ2WLgGnO9wIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 12:32:53 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7F8CBB03
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 12:32:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9181A10E46E;
	Mon,  2 Feb 2026 11:32:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KzfAAskm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1570C10E427
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 11:32:51 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-8230d228372so2259520b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Feb 2026 03:32:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770031970; x=1770636770; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NiX6sc+bte0/E+dFVuNXwgpx22zYYyWdASCMsSYGK9c=;
 b=KzfAAskmHubhR8p7+18tnGbcYCg5HkCAxf5oanXZXgZ8tHN70SmyoKduZlpho1wmj1
 Ru1gB0py/GnX49+iSiR5uNBs2zGmgF7Wq43p0MZ7mRkY2vjVGv/yQ2l0tSjJdIIbXji2
 081bM+dwRG/kF4FmWGcl+9V3zJ6dELWp+DJdiUCRQyri/wUG7as4MsXKDfYxc9sx9qEV
 UHLeRy88AxkDVFPJTrz891pQ97+Dr/9TsP1g5XdDjGzdJPkoJQjhpngDmYNdI1hiO74I
 yNDMUZybU3t9qup77zkbQluIAKm+e789vNRGryAtpr3juW2kfaIG2NKLA5UeBqewRdMo
 8MRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770031970; x=1770636770;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NiX6sc+bte0/E+dFVuNXwgpx22zYYyWdASCMsSYGK9c=;
 b=fYN74w2kAOgN8NxKGgYXziVmuPMeEMZT5AsEzJdX12cnE/7RpJCI1k96+iMnCX6cdY
 MBwUCEVxeZXvmkBHDVUPX5RixpvqC0jsrVs538lcpiP+n/wb4oiPGmfZkaFpHof9EKQW
 9GbEJrC2TZSWOS64fQO0CzI8iMbCXqRlMiy+/LEHVymL0lay/I78QqfuR87fLJeqUIZK
 XobzzSwaFSGXA+1zhV5p4GKoqiN3S+OH7AjHBKoxKbuTtz40zTvJoP86R86SkKLl41/v
 Vs54CLogBClze/SFcqV6QKjmd9WVmlyRGOyg50NPdkhQQJvpo4Z3Bl++FTaZpyWttVKH
 8VBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9djCNeND/u5tMHxDaeUOLgmgflT52JdFizkvYCX57LF+2RNYq0gcqGg/msBweKL2HDOVq3r7tUAo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+p5soMiIUs18c2bSajxzvefwyBGGux/CiNQw4ir/kP1o4EFaV
 K4zvXEtOWeNBFiHY4pTorO8XuhHUN5SSAezDyVKYxU/WBN0e5Sv44eegVHaKYA==
X-Gm-Gg: AZuq6aJtUuduwGK7c4cTq2dYEeoGp76hrlR6Vki9mKEHEDZ8XAuetFRufd6IJ9Xhvwh
 EEIygYJNMgBgtNr5uBglJaUWpvqngng+svy2sBnMpaP4zFCtXQ3OTJw2Pv6SDXAO1dwR+18HHDf
 87oxxwvEpLoI8PHb/oKydFpbLJDg7y79OYTNc6z5oK5K5HWez8Y9LpmloR3kl7bLf15JJ4ET4OE
 qevHMyqOAwdH/AqGQRwjvmGN4UB9dRgfOVcw6wu5nUQTqoXVZs5JHniwJemf83f5a0toYfccRuW
 Z/b08eseK7zQnppeUFRxfUyBCE2tmNL3EWLofwepmQ1esZtiEZw2ElKGftDKeSs3rAkvJ6Xr2zH
 mMU2kjdIc242B685muNrLjtIL4YLe031eZ1qWM8wWn/ekIfYHvXuximb8bLigbWjeFKq4I9YjMt
 +5BEFW1NtTjPMIeiXJo2qZYgz/y4OP1rHrOmuWJQ==
X-Received: by 2002:a05:6a21:483:b0:366:19c9:b6b6 with SMTP id
 adf61e73a8af0-392e0000539mr10085643637.11.1770031970541; 
 Mon, 02 Feb 2026 03:32:50 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([121.185.186.233])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c642a9f539dsm13743190a12.26.2026.02.02.03.32.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Feb 2026 03:32:50 -0800 (PST)
From: Jeongjun Park <aha310510@gmail.com>
To: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Jeongjun Park <aha310510@gmail.com>
Subject: [PATCH 3/3 v2] drm/exynos: vidi: use ctx->lock to protect struct
 vidi_context member variables related to memory alloc/free
Date: Mon,  2 Feb 2026 20:32:34 +0900
Message-Id: <20260202113234.183393-4-aha310510@gmail.com>
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
X-Rspamd-Queue-Id: 4E7F8CBB03
X-Rspamd-Action: no action

Exynos Virtual Display driver performs memory alloc/free operations
without lock protection, which easily causes concurrency problem.

For example, use-after-free can occur in race scenario like this:
```
	CPU0				CPU1				CPU2
	----				----				----
  vidi_connection_ioctl()
    if (vidi->connection) // true
      drm_edid = drm_edid_alloc(); // alloc drm_edid
      ...
      ctx->raw_edid = drm_edid;
      ...
								drm_mode_getconnector()
								  drm_helper_probe_single_connector_modes()
								    vidi_get_modes()
								      if (ctx->raw_edid) // true
								        drm_edid_dup(ctx->raw_edid);
								          if (!drm_edid) // false
								          ...
				vidi_connection_ioctl()
				  if (vidi->connection) // false
				    drm_edid_free(ctx->raw_edid); // free drm_edid
				    ...
								          drm_edid_alloc(drm_edid->edid)
								            kmemdup(edid); // UAF!!
								            ...
```

To prevent these vulns, at least in vidi_context, member variables related
to memory alloc/free should be protected with ctx->lock.

Cc: <stable@vger.kernel.org>
Fixes: b73d12303ecf ("drm/exynos: added virtual display driver.")
Signed-off-by: Jeongjun Park <aha310510@gmail.com>
---
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 38 ++++++++++++++++++++----
 1 file changed, 32 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index 601406b640c7..37733f2ac0e7 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -186,29 +186,37 @@ static ssize_t vidi_store_connection(struct device *dev,
 				const char *buf, size_t len)
 {
 	struct vidi_context *ctx = dev_get_drvdata(dev);
-	int ret;
+	int ret, new_connected;
 
-	ret = kstrtoint(buf, 0, &ctx->connected);
+	ret = kstrtoint(buf, 0, &new_connected);
 	if (ret)
 		return ret;
-
-	if (ctx->connected > 1)
+	if (new_connected > 1)
 		return -EINVAL;
 
+	mutex_lock(&ctx->lock);
+
 	/*
 	 * Use fake edid data for test. If raw_edid is set then it can't be
 	 * tested.
 	 */
 	if (ctx->raw_edid) {
 		DRM_DEV_DEBUG_KMS(dev, "edid data is not fake data.\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto fail;
 	}
 
+	ctx->connected = new_connected;
+	mutex_unlock(&ctx->lock);
+
 	DRM_DEV_DEBUG_KMS(dev, "requested connection.\n");
 
 	drm_helper_hpd_irq_event(ctx->drm_dev);
 
 	return len;
+fail:
+	mutex_unlock(&ctx->lock);
+	return ret;
 }
 
 static DEVICE_ATTR(connection, 0644, vidi_show_connection,
@@ -243,11 +251,14 @@ int vidi_connection_ioctl(struct drm_device *drm_dev, void *data,
 		return -EINVAL;
 	}
 
+	mutex_lock(&ctx->lock);
 	if (ctx->connected == vidi->connection) {
+		mutex_unlock(&ctx->lock);
 		DRM_DEV_DEBUG_KMS(ctx->dev,
 				  "same connection request.\n");
 		return -EINVAL;
 	}
+	mutex_unlock(&ctx->lock);
 
 	if (vidi->connection) {
 		const struct drm_edid *drm_edid;
@@ -281,14 +292,21 @@ int vidi_connection_ioctl(struct drm_device *drm_dev, void *data,
 					  "edid data is invalid.\n");
 			return -EINVAL;
 		}
+		mutex_lock(&ctx->lock);
 		ctx->raw_edid = drm_edid;
+		mutex_unlock(&ctx->lock);
 	} else {
 		/* with connection = 0, free raw_edid */
+		mutex_lock(&ctx->lock);
 		drm_edid_free(ctx->raw_edid);
 		ctx->raw_edid = NULL;
+		mutex_unlock(&ctx->lock);
 	}
 
+	mutex_lock(&ctx->lock);
 	ctx->connected = vidi->connection;
+	mutex_unlock(&ctx->lock);
+
 	drm_helper_hpd_irq_event(ctx->drm_dev);
 
 	return 0;
@@ -303,7 +321,7 @@ static enum drm_connector_status vidi_detect(struct drm_connector *connector,
 	 * connection request would come from user side
 	 * to do hotplug through specific ioctl.
 	 */
-	return ctx->connected ? connector_status_connected :
+	return READ_ONCE(ctx->connected) ? connector_status_connected :
 			connector_status_disconnected;
 }
 
@@ -326,11 +344,15 @@ static int vidi_get_modes(struct drm_connector *connector)
 	const struct drm_edid *drm_edid;
 	int count;
 
+	mutex_lock(&ctx->lock);
+
 	if (ctx->raw_edid)
 		drm_edid = drm_edid_dup(ctx->raw_edid);
 	else
 		drm_edid = drm_edid_alloc(fake_edid_info, sizeof(fake_edid_info));
 
+	mutex_unlock(&ctx->lock);
+
 	drm_edid_connector_update(connector, drm_edid);
 
 	count = drm_edid_connector_add_modes(connector);
@@ -482,9 +504,13 @@ static void vidi_remove(struct platform_device *pdev)
 {
 	struct vidi_context *ctx = platform_get_drvdata(pdev);
 
+	mutex_lock(&ctx->lock);
+
 	drm_edid_free(ctx->raw_edid);
 	ctx->raw_edid = NULL;
 
+	mutex_unlock(&ctx->lock);
+
 	component_del(&pdev->dev, &vidi_component_ops);
 }
 
--
