Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oFGnDPgppmnwLQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 01:23:20 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2AFF1E717D
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 01:23:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3429410E05B;
	Tue,  3 Mar 2026 00:23:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="NPe6Qjyv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com
 [209.85.216.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 678CB10E05B
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 00:23:14 +0000 (UTC)
Received: by mail-pj1-f74.google.com with SMTP id
 98e67ed59e1d1-354c0234c1fso3945849a91.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2026 16:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1772497394; x=1773102194;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=h+S2hEoh3AkWLV1vPBRg6tolIoONYGr6f+l9MUzh2LM=;
 b=NPe6QjyvE5Yl8sS479rkay6iGfp6Vpvjgmb+AQuSZkT5kjwpR9x8JoMdixcfza24Hn
 AvA2r71rq2OgNhWKypW16D576acBKrcC7NkGIPFPNXNupieCA0ZD7Jmjrh6jGyNxk18W
 zVWDxSPnMyQDiQwILaXVSTx2xdHhDfukbCNRXj6wYf5mVm7KY0juWrkYZKdpgNNGLVWx
 79jplPqnUpO7dQ1bBM10S/bSQYDUPKEL+Y5uifVxd4GiZE9PBRrrT2VNLzZVHd74U4YY
 YH8oVhaMBZiRz1ENTpRKJw1xiq6jaaOZl06d01Ywj+isfgHh3tbIJDoy35o8b+iqrRCo
 6XOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772497394; x=1773102194;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=h+S2hEoh3AkWLV1vPBRg6tolIoONYGr6f+l9MUzh2LM=;
 b=Ihv3OlEeYp0Hz57sfEtEiFds7Ti/x3V+trMzKwjsRTjSNvVyiBvh40or05nqiM1xOw
 tcZ/B9Ng2oIUzo3XlPE84c2QcUYprOUEpsNTzAHzJVz8IbIpf0M5cHPE07mg9nOHxaKn
 1GBfCsgmLvQXFaCIC2APdJ83QGDS7T+wMXv+TocEZzp/+pPrNWl36w8oKzU49tmP9362
 tOReJDJSX2Q2P8gZrg3kIWIoocM/HtLCoY1ndxAxuCtl6tl/g4v657PiU7YW7m3RCS1m
 Ptznqya8bQ0tZT11ZnGt+sPWFIpJAobOYkmPa1p/cFN8ayKobLA2X60W+v/Ut/CTaoK3
 8acA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCCH+DA5HjzpchDVVn2li8lvgEbrQUMKevbEiGEVE4Yccw6bD3Nw78tKSnHmAiJzIBYX0ELtOX9c0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwvSJIS9FyLZopUr6bA2soW5f6tSoku3SAQLVk4Rpc+y3b81cKY
 vcJO7V6hbDnyC7bhnKUqmg52TX8+DoH/pVLSbcFQ0MCKUnbpUB9Qy3luBAOY5gyD9TW1fV3DTw0
 pBhqyJ74aSPZsp7fcO5mLZE7y4wOaDeh/6Ls5Tg==
X-Received: from pjbcm8.prod.google.com ([2002:a17:90a:fa08:b0:359:8d0c:c0d7])
 (user=isaacmanjarres job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:164d:b0:359:8c01:66f with SMTP id
 98e67ed59e1d1-3598c0109f7mr3959561a91.28.1772497393649; 
 Mon, 02 Mar 2026 16:23:13 -0800 (PST)
Date: Mon,  2 Mar 2026 16:23:09 -0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260303002309.1401849-1-isaacmanjarres@google.com>
Subject: [PATCH v1] dma-buf: Include ioctl.h in UAPI header
From: "Isaac J. Manjarres" <isaacmanjarres@google.com>
To: christian.koenig@amd.com, sumit.semwal@linaro.org
Cc: linux-kernel@vger.kernel.org, tjmercier@google.com, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 "Isaac J. Manjarres" <isaacmanjarres@google.com>, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
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
X-Rspamd-Queue-Id: B2AFF1E717D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:sumit.semwal@linaro.org,m:linux-kernel@vger.kernel.org,m:tjmercier@google.com,m:linux-media@vger.kernel.org,m:isaacmanjarres@google.com,m:kernel-team@android.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[isaacmanjarres@google.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[isaacmanjarres@google.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[google.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

include/uapi/linux/dma-buf.h uses several macros from ioctl.h to define
its ioctl commands. However, it does not include ioctl.h itself. So,
if userspace source code tries to include the dma-buf.h file without
including ioctl.h, it can result in build failures.

Therefore, include ioctl.h in the dma-buf UAPI header.

Signed-off-by: Isaac J. Manjarres <isaacmanjarres@google.com>
---
 include/uapi/linux/dma-buf.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.h
index 5a6fda66d9ad..e827c9d20c5d 100644
--- a/include/uapi/linux/dma-buf.h
+++ b/include/uapi/linux/dma-buf.h
@@ -20,6 +20,7 @@
 #ifndef _DMA_BUF_UAPI_H_
 #define _DMA_BUF_UAPI_H_
 
+#include <linux/ioctl.h>
 #include <linux/types.h>
 
 /**
-- 
2.53.0.473.g4a7958ca14-goog

