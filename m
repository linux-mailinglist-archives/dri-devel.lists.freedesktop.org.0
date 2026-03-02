Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yOW0HyHtpWlLHwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 21:03:45 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D53A21DF178
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 21:03:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFC3910E11B;
	Mon,  2 Mar 2026 20:03:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="YPbCHPZL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f100.google.com (mail-yx1-f100.google.com
 [74.125.224.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E86DF10E11B
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 20:03:40 +0000 (UTC)
Received: by mail-yx1-f100.google.com with SMTP id
 956f58d0204a3-64ae2ce2fe1so4062056d50.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2026 12:03:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772481820; x=1773086620;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bizM8l7ko4QNWpZ7+V6GyW83rr9UHFb+Oc8FZsZmb9A=;
 b=ZfH34Lws1Li1ZzVxnZWZ/R2IrizBTx8FcPPgHtDSEeRMO7LuJDmDYyVe0WSTishqP0
 nWJ6PYq2OiVTa9lyj407jqFpr2WOgE4rIqswGnO6mzfzQNu95LB8gK3UyBMtRXYFr6kh
 IQFbuIRSUoVWcdONIDGxXMg7nP4Ns8R1i4Mq+tJGjp+irAvrsf2Rl45aDUfc/l5zE+Oz
 BpRW1MEBjfLmF9HB8Ya4m8TwBDplerjvjmtx+2AHgotXDbLX9iTfW0KJhxHd3H0aTgLj
 RcFbQ1qBHdv043fNlBfZtuFbGq491LjEqZmfTJMRc9oK9KpVFAKXZ/XSKL+lodcewSPC
 HH9Q==
X-Gm-Message-State: AOJu0Yw394Nso3RCrekFlQ8I7CgHGtRpvbw+AXLKA5+sSx8Z9cicrELx
 WFVOQDSJMQC2hn2k55KArbjhRc+2HPgjv98Xqy1ECPQhslPIoFFVOUCcrKamUX30CQHWWYE1mVj
 NXDDd1I2G0mM4hwm+aspSehatqtpEeorGlNMg72dyLXKSzdaF2s5t+RM6bOrtzbIimFwD0OiGcv
 hOH2U8w8YasZNNh4xYY5sm2/Dhk52Cj4FCnlCls99v3L2QQNv5nOZAwBcNh4zNO0ik3faetjile
 SB+swnpUiTacwRmUK2C
X-Gm-Gg: ATEYQzxqyI1NrKnqkJlG84dU63i2VjfyRcWH9TKhqG5dXiMm1sYafeZy1TJ7BtJyH1C
 QexDp5offQ0SSH+F0uehVShbBd33iZXPYeFpFNSVVfuLnQcag/B1BjZXFmpTaqchv/GYgJlprra
 93s+OjJ4E3qErgigOy6KZIvyTFnQGPJj0hrpwfia2TkDdtxQAU74TVB3O8dLcpXwfVXljyUlGmA
 BlvxxwOOexPUxOyljOoEbmLVCsHD/UElEu56gJoI5Ucx6oWtZRKP+xvp+Qs/jXiM/vcH8zGvTPj
 m/sK6c6xjLp0W7OHhrrSK+CxCVZDmfMGR62+nhaUBVK+mS12O0DepevDDX62jrQQgnErfl/K0kF
 UjbQNvlcZ1F9p+uACAq/A76li+vB4keY8PLKTSjqDjU5Y0u7aM/JQ9dDZ/W3U2zy0H1LR/PvMoi
 j11ZT/yjROjZA3IWIMkeoXsNZKQsXvbj5ZwhBLnTLy6SQodfbMFolGNho3
X-Received: by 2002:a53:cb0e:0:b0:64c:b44e:dfd6 with SMTP id
 956f58d0204a3-64cc202cd90mr9686582d50.6.1772481819757; 
 Mon, 02 Mar 2026 12:03:39 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-117.dlp.protect.broadcom.com. [144.49.247.117])
 by smtp-relay.gmail.com with ESMTPS id
 956f58d0204a3-64cb75fb6bfsm1403344d50.8.2026.03.02.12.03.39
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 02 Mar 2026 12:03:39 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f71.google.com with SMTP id
 a92af1059eb24-1279caef718so2698422c88.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2026 12:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1772481818; x=1773086618;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bizM8l7ko4QNWpZ7+V6GyW83rr9UHFb+Oc8FZsZmb9A=;
 b=YPbCHPZL8CPKesqmWVx6vVC3DnS/cWP+A6ecQaOX4ESACGxSkOSUtJ6qUeVPm4pPeD
 pqd+zcKylz2OV2boab6C5MMzcUkIAxk0zWBhEe3L3fddGOsmR7dVzQplUN8JFRYh/ega
 fYtzQ1xZXWLxkzRa1jsuV0VNwVsSle299w1bQ=
X-Received: by 2002:a05:7022:68a4:b0:127:5c70:930 with SMTP id
 a92af1059eb24-1278fc8d466mr3875289c88.43.1772481818264; 
 Mon, 02 Mar 2026 12:03:38 -0800 (PST)
X-Received: by 2002:a05:7022:68a4:b0:127:5c70:930 with SMTP id
 a92af1059eb24-1278fc8d466mr3875269c88.43.1772481817426; 
 Mon, 02 Mar 2026 12:03:37 -0800 (PST)
Received: from plasma.dhcp.broadcom.net ([192.19.144.250])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-127899eab46sm14754600c88.8.2026.03.02.12.03.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2026 12:03:36 -0800 (PST)
From: Ian Forbes <ian.forbes@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: bcm-kernel-feedback-list@broadcom.com, zack.rusin@broadcom.com,
 maaz.mombasawala@broadcom.com, Ian Forbes <ian.forbes@broadcom.com>,
 =?UTF-8?q?Mika=20Penttil=C3=A4?= <mpenttil@redhat.com>
Subject: [PATCH] drm/vmwgfx: Don't overwrite KMS surface dirty tracker
Date: Mon,  2 Mar 2026 14:03:30 -0600
Message-ID: <20260302200330.66763-1-ian.forbes@broadcom.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
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
X-Rspamd-Queue-Id: D53A21DF178
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[broadcom.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[broadcom.com:s=google];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[ian.forbes@broadcom.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[broadcom.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[broadcom.com:dkim,broadcom.com:email,broadcom.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

We were overwriting the surface's dirty tracker here causing a memory leak.

Reported-by: Mika Penttilä <mpenttil@redhat.com>
Closes: https://lore.kernel.org/dri-devel/8c53f3c6-c6de-46fe-a8ca-d98dd52b3abe@redhat.com/
Fixes: 965544150d1c ("drm/vmwgfx: Refactor cursor handling")
Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index 55730e29d3ae..e7bddf840a79 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -771,7 +771,8 @@ static struct drm_framebuffer *vmw_kms_fb_create(struct drm_device *dev,
 		ret = vmw_bo_dirty_add(bo);
 		if (!ret && surface && surface->res.func->dirty_alloc) {
 			surface->res.coherent = true;
-			ret = surface->res.func->dirty_alloc(&surface->res);
+			if (surface->res.dirty == NULL)
+				ret = surface->res.func->dirty_alloc(&surface->res);
 		}
 		ttm_bo_unreserve(&bo->tbo);
 	}
-- 
2.53.0

