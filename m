Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eMZeDRWWpWmPEQYAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 14:52:21 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9F31DA25C
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 14:52:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E56C210E4F9;
	Mon,  2 Mar 2026 13:52:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DhfNBLHK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com
 [74.125.82.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60C6C10E162
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Mar 2026 18:24:32 +0000 (UTC)
Received: by mail-dy1-f170.google.com with SMTP id
 5a478bee46e88-2bd9a485bd6so8054232eec.1
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Mar 2026 10:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772389472; x=1772994272; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Cb8Ep+sgnmgpcpmGrmcrOcoKL6ENP8c22b27rhENS5Q=;
 b=DhfNBLHKl0wbViPVh8rntv8uxSoze/zDUMcBQIMmanngCiP+S0WkOLXcZ0b8or6Mvu
 iFNPGbXj0jBjv1L17MwyJAwyFH5eT4m8ELNhZz/7lb1GS45ScWFcm/R8sKdVoNGN3ena
 6wBc2aMkbYiTKorSNMwrSRk0cgdSnG7ymutzF+FNAsh9zKVDSG4/vKWIFBRQY27lbGk+
 kaeyg2E89gndneOPObskfAzxxoFTYMkIXHB1jAy+Xu2ycPxXSw20bcjXiYs5Am9O2fQH
 FlAZv1+uENehvF4EVUY54CjUHL5j0edVqo4yVOFSSFwZDfnKSiN6qQu7nFPJh6oBc0nM
 kiWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772389472; x=1772994272;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Cb8Ep+sgnmgpcpmGrmcrOcoKL6ENP8c22b27rhENS5Q=;
 b=LtICVNC2JTI8E13sBdnYSw6AWxUKGIHVQuz0ifeJtt3dVD1opYzX6Wli6N/TVqlUot
 NzR7wnsA8ZOkY9i/y7ZAGzn1UEzhCw80Thx3QD4ZSCj03GUQzMIA0MYd2YZ/4JEkfkEJ
 NnZZRJZ5cnrtFRY5cNF4sX9wLZIMsDTCn+0TKCk+9eZ4yud6JAuCzjyVuWIkNG/CwllH
 9gWZ8YSG45LphIaVDN5MQK+rbkNJ0P5egXLPL5Wg0Ja13xCC3fu84DnBfhS8NSS/4r3I
 xAIJGe8uiq7bEIIqPN/XJoMSLPhuF54oLj/alKcRBFr85NK87m30dvf64WQp9EIEFBQV
 P+iw==
X-Gm-Message-State: AOJu0YyVfyo2iPNCDrQkY1KI97fpvZU9wsZUscyoVBSfFmnZEqDfArMq
 2qWzG2tsSKe3cpeQRtI4aflo8lHmIswXrdB4fonTLAs3StgY08LUp3mQ
X-Gm-Gg: ATEYQzx7T/rx3JqmbMkxnNXV+J9yc27uwKbyO6DXbiJtlLPHEEwIrWR0av0grZZCVTq
 ipznTMDBDyAtgUtJN0XH/CGN5df/mfeZMdBo9kcTFRf5UzZ8JQPZ5gaQ2DEKc6BTWFRFxk++4E1
 dzBf6LrdPiFskMzaJ+YxX/+lrFsCGK4+PjMXwqowz0UdGyalg3JSSOrKmse70Kbxq7VYk1k0OB2
 rBiPfH2RogwMVBEBt8gm3uNFqD1kBStu6eYHcjqe/CL2cbr/bbkN8tx7YRsYETDCI+TRnnHB708
 2lGew8+jD0CJHuR9e/ulAh3JpZ0cx7+9mQwNM7wK7Rf+VQJXdYV5mGS2NZaIx8A2zNV0kPyly5a
 WUH1GBzbe5ooURXeraMJGhtkvS1Ta5xB55PA8zgoGPCz2Noj3GRZUiomEiA7CQKm7MNxKceRdjU
 BpTib5PklAn5j2Ox1rgTn6Rgr4rJsikLbaLQ==
X-Received: by 2002:a05:693c:290d:b0:2b0:53e5:89df with SMTP id
 5a478bee46e88-2bde1b255bcmr4535460eec.5.1772389471405; 
 Sun, 01 Mar 2026 10:24:31 -0800 (PST)
Received: from ada ([216.38.156.86]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1279cbd1993sm2504048c88.2.2026.03.01.10.24.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 01 Mar 2026 10:24:31 -0800 (PST)
From: Ali Khaledi <ali.khaledi1989@gmail.com>
To: tomeu@tomeuvizoso.net,
	ogabbay@kernel.org
Cc: dri-devel@lists.freedesktop.org,
	Ali Khaledi <ali.khaledi1989@gmail.com>
Subject: [PATCH 3/3] accel/rocket: fix NULL derefs and missing error check
Date: Sun,  1 Mar 2026 10:24:28 -0800
Message-ID: <20260301182428.82981-1-ali.khaledi1989@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 02 Mar 2026 13:52:12 +0000
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:tomeu@tomeuvizoso.net,m:ogabbay@kernel.org,m:ali.khaledi1989@gmail.com,m:alikhaledi1989@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[alikhaledi1989@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alikhaledi1989@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 7D9F31DA25C
X-Rspamd-Action: no action

Fix several issues in the rocket accelerator driver:

rocket_gem.c: Add missing error check after
drm_mm_insert_node_generic(). The return value was silently
overwritten by iommu_map_sgtable(), causing DMA mapping to use
an uninitialized IOVA on MM insertion failure.

rocket_job.c: Add missing NULL check after kvmalloc_array() in
rocket_job_push(). A large job can trigger allocation failure,
leading to NULL pointer dereference in the following memcpy.

rocket_job.c: Add missing NULL check after kmalloc_objs() in
rocket_job_open(). Also fix memory leak of the scheds array
when drm_sched_entity_init() fails.

Found by AI-assisted code review (Claude Opus 4.6, Anthropic)
in collaboration with Ali Khaledi.

Signed-off-by: Ali Khaledi <ali.khaledi1989@gmail.com>
---
 drivers/accel/rocket/rocket_gem.c | 2 ++
 drivers/accel/rocket/rocket_job.c | 9 ++++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/rocket/rocket_gem.c b/drivers/accel/rocket/rocket_gem.c
index b6a385d2e..7212edc3f 100644
--- a/drivers/accel/rocket/rocket_gem.c
+++ b/drivers/accel/rocket/rocket_gem.c
@@ -95,6 +95,8 @@ int rocket_ioctl_create_bo(struct drm_device *dev, void *data, struct drm_file *
 					 rkt_obj->size, PAGE_SIZE,
 					 0, 0);
 	mutex_unlock(&rocket_priv->mm_lock);
+	if (ret)
+		goto err;
 
 	ret = iommu_map_sgtable(rocket_priv->domain->domain,
 				rkt_obj->mm.start,
diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/rocket_job.c
index ac51bff39..6502b7148 100644
--- a/drivers/accel/rocket/rocket_job.c
+++ b/drivers/accel/rocket/rocket_job.c
@@ -192,6 +192,8 @@ static int rocket_job_push(struct rocket_job *job)
 
 	bos = kvmalloc_array(job->in_bo_count + job->out_bo_count, sizeof(void *),
 			     GFP_KERNEL);
+	if (!bos)
+		return -ENOMEM;
 	memcpy(bos, job->in_bos, job->in_bo_count * sizeof(void *));
 	memcpy(&bos[job->in_bo_count], job->out_bos, job->out_bo_count * sizeof(void *));
 
@@ -501,6 +503,9 @@ int rocket_job_open(struct rocket_file_priv *rocket_priv)
 	unsigned int core;
 	int ret;
 
+	if (!scheds)
+		return -ENOMEM;
+
 	for (core = 0; core < rdev->num_cores; core++)
 		scheds[core] = &rdev->cores[core].sched;
 
@@ -508,8 +513,10 @@ int rocket_job_open(struct rocket_file_priv *rocket_priv)
 				    DRM_SCHED_PRIORITY_NORMAL,
 				    scheds,
 				    rdev->num_cores, NULL);
-	if (WARN_ON(ret))
+	if (WARN_ON(ret)) {
+		kfree(scheds);
 		return ret;
+	}
 
 	return 0;
 }
-- 
2.53.0

