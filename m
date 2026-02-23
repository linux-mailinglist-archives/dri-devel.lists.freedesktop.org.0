Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gLUiORmxnGmYJwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 20:57:13 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 973B317C97E
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 20:57:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2DDA10E302;
	Mon, 23 Feb 2026 19:57:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ObjHHjeD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6655A10E302
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 19:57:08 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-4362507f0bcso3365412f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 11:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771876627; x=1772481427; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tw/RWWMMz/LUZJDIOpoJvir9hIIBp+8IjqKcLBJIVLA=;
 b=ObjHHjeD0XJH/nXP9klgttv5LE7lDB5PeebJuRmt/mFP8LvO3YPwmDgZQOCn2ckPOk
 skbsHNl1oHj3kzASAMaUyzkL/eLBuRC63Whndu4lCHqSZuovxIm/YIRryCHxoWRBf7Zu
 td6EK+cPbKK7vFZ7zOnAK8dqoauGH9LCJyS7O9ptubk/xqLubYgpVxY7f8lgc0U7BJTS
 YvfMBY5PpHYSDIPFxSELanmxrLPz8YriUbIsIs8nxEmwepg7zxIeVMC8mfv8aUS69TYr
 l6W5eskCVXKnU0IatlGqyFYBuu7PudjeflnK2HeYFT6tWb5P91DgOE9qeUneHZf386lY
 j0Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771876627; x=1772481427;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tw/RWWMMz/LUZJDIOpoJvir9hIIBp+8IjqKcLBJIVLA=;
 b=Ji9nbx/tfEgnzOcVZ4A8FLJjcTUsiUHFiISIs9sQsQIbU+JQoV8+JjrjHzysdfnJOY
 SG8/wspQ6mEJFG3SZa7DuBLITNZiowf3vmcqrVa6HSD4jDBCjkOb0TiydXssRDXUhTFR
 0JM2feSq8qQzQTc0p/BOvNGNcTZz2OwtgKSazpBsCv+CVNM5dvhELLgzN3lVsLy+b8rB
 CDS4e5QQys9MWLoGMZFbZuztaBEerlJvk5x/7f6H2qxs8sxCP0I594IZnHsE4v9lTOHO
 yuRiHFrq3csEeFqwiuF8R+mkMkmsViewzfFbVKO+RxwowHf4FWLSDiR6sf8TcmQejyOO
 W1cg==
X-Gm-Message-State: AOJu0YxStRB7RZsOIWjuPGikEg7oZudiD0+sC2N5zE3gzBDSvVcLlMu/
 IQG8h6u21FaHFBYuCyyk8fwOSIM8e0416XiNMiXchFXjBVQBX/9lQRxY
X-Gm-Gg: ATEYQzyECN20Q03M2EuTvM23oi0VHyi/E72b9oLiLggy99HTgn2x97gXXLbPXN1ExHu
 NcJgPLkwHl0WhhukPE8gi7KpSBjMyACz7HuYI5PxtmOo/CJqwnULDz0CKdTzYL6rUqc/kn3pcMo
 mi5H2UykFg7SikDu0GEh5+U+vsIwX5xiq9AkMmbBVT/umY2tog1eYR+aKhAL+N3yAta/toFbfw1
 iqIXq0TacnqaBi022mx+vysQr08U1hgYSgAfiZm2djUnlVz2WWUs6q42qqZt7t4NwoyvQmCkF0p
 HM1dV8vCFHOATuuuVDNaV8fim3K81MwEIS8qQh5gO7uE3yM75MWtMC1gLDUGr6i7llcbHU0tfCE
 V3i3XjTn07bmShpkvU2QSfO3wam7GE1UKxnis2LIBC3evnt+Od2B/qc9Sc4dBWygO4HnFPBrOIe
 VqjMGa1dweCqEuhXCiowchMSGXGHSiAq7mj7u0ZjLTaaZjZXE=
X-Received: by 2002:a5d:5f82:0:b0:436:36cb:70b7 with SMTP id
 ffacd0b85a97d-439626c745emr28266383f8f.7.1771876626593; 
 Mon, 23 Feb 2026 11:57:06 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:1560:9500:6003:d1d5:d313:52eb])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43970bf9f6csm23555492f8f.7.2026.02.23.11.57.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 11:57:06 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: matthew.brost@intel.com
Cc: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH] dma-buf: revert "use inline lock for the dma-fence-chain"
Date: Mon, 23 Feb 2026 20:57:05 +0100
Message-ID: <20260223195705.206226-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[ckoenigleichtzumerken@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:matthew.brost@intel.com,m:intel-gfx@lists.freedesktop.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_THREE(0.00)[3];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ckoenigleichtzumerken@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 973B317C97E
X-Rspamd-Action: no action

This reverts commit a408c0ca0c411ca1ead995bdae3112a806c87556.

This causes a lockdep splat. Not really the right fix, but changing this
is more work than expected.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-fence-chain.c | 3 ++-
 include/linux/dma-fence-chain.h   | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
index a707792b6025..a8a90acf4f34 100644
--- a/drivers/dma-buf/dma-fence-chain.c
+++ b/drivers/dma-buf/dma-fence-chain.c
@@ -245,6 +245,7 @@ void dma_fence_chain_init(struct dma_fence_chain *chain,
 	struct dma_fence_chain *prev_chain = to_dma_fence_chain(prev);
 	uint64_t context;
 
+	spin_lock_init(&chain->lock);
 	rcu_assign_pointer(chain->prev, prev);
 	chain->fence = fence;
 	chain->prev_seqno = 0;
@@ -260,7 +261,7 @@ void dma_fence_chain_init(struct dma_fence_chain *chain,
 			seqno = max(prev->seqno, seqno);
 	}
 
-	dma_fence_init64(&chain->base, &dma_fence_chain_ops, NULL,
+	dma_fence_init64(&chain->base, &dma_fence_chain_ops, &chain->lock,
 			 context, seqno);
 
 	/*
diff --git a/include/linux/dma-fence-chain.h b/include/linux/dma-fence-chain.h
index df3beadf1515..5cd3ba53b4a1 100644
--- a/include/linux/dma-fence-chain.h
+++ b/include/linux/dma-fence-chain.h
@@ -46,6 +46,7 @@ struct dma_fence_chain {
 		 */
 		struct irq_work work;
 	};
+	spinlock_t lock;
 };
 
 
-- 
2.43.0

