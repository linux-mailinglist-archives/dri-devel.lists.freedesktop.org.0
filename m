Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uAgmGaN0fGkmNAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 10:06:43 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E56C2B8BB0
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 10:06:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36A0810E95B;
	Fri, 30 Jan 2026 09:06:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="O2lWlKCR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF93488130
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 17:10:20 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-81e93c5961cso1013328b3a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 09:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769706620; x=1770311420; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=67evvbj+2qIRK0KIahn0IlunJhUk/WhkeokzHp6+kbo=;
 b=O2lWlKCRfJmmcfDmRXU04qwYBKOtnC59vtr+ZercFeO5IiSfkY+HplHSvTiGyCyaIB
 BHXr80kdmNoQfC8D2UOnzfmjM8OSS89SK0U0jCECQqc+AlVxcv1+06KTHeRCJBJLSyl/
 yQlSAc4BskSQ6TKLF/mHHDcfqK8GjX7YjwHtVwmjQJHKclWuHRX1Vq58GdGfBBhpUwXt
 jwIQHpoi5Gr64c+HzC+4EWXTiFQJNk2sLBYyboLdahf22fS6xoza8InP8/w1oblC9lQB
 5Stqksht9RVp8fNbLtrnH/ugHROU6qr1wmXGjbPfSVY3Ru7Tc9qNyAgS+ul5y/pbq/YB
 x+7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769706620; x=1770311420;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=67evvbj+2qIRK0KIahn0IlunJhUk/WhkeokzHp6+kbo=;
 b=p7SSrIrwMeDm+Y+/V3v5iXk7yTnv+vq2mxKAj7Dlx9VjfJKhj2oQbRjIK0Dj/Eg12f
 rXgCp3/N0s9/jukKZScU32/OX2svtg3LEWjaej2RX14HZp7SyX1mxeuDd8TnUyk8keKm
 Z1IJGhn5ng6fxjJy2TVYT6iXJu0AxNSqzYLVka4etnPokFyeyVWYC7BmssHAPFsxPGc4
 CDnFCbOTfq23wphf5e2dz38VJTuWzg5x/dX+e+ePXaAKs34H+clifC7It3z3oiARhcwE
 zpfb9FEtyQuU6EezxaGwR/M9swIi+hoC0s2YpN7X9D0OOK9OmrMOgzvRmOtlwUxuUpi3
 oMcA==
X-Gm-Message-State: AOJu0YwLxitgO2AmDA2ETFdXCWEqlvN2m1nRj1Kn18wMlv3KiiY3ubRH
 zTLf5+C4biwbLHkBII1DRDpE2yRQp3J8Q9EnGqlk0Rwt5gEczfL1FsWi
X-Gm-Gg: AZuq6aId4mVnpkdoYxkYfNPieHh94PaBxgpOOhq7qZXEP79WBjK54sHivzmerNzVlmA
 atOKRxF1Ir+Aw/CAI6zhmfGnZe+/YCIMiD/4R0znpErrSvkjNkAZi/mtzYorMZAFH8E15bKcW47
 cPTY9i951wOpg62//FM3zCqVPWpBo64E+dygIniatP6WJGuXWlhFDkycQHvyQtJFZScvIlbTt77
 zwgOldN033gyZ1+9CZiSY/x7wxqD9JDo/emgpr2LP2EdrTZ0XJgfWPsHM9p/1/ZA+NlJUpferAa
 4uJ+F7NN7hNSvlAPSZh31bXk2lwuLGjs/hllMdyGi5Cdsc2YV/xvSlihGLg0GYJBXJTfbnoGwt+
 kuZKzUURFtR4njatYmbNinH0AsrPKiOyetuMNAofJRDY41IfOrdj1hplE4oQrCZOU3bpvHFMUFW
 VZNggHy3E0LiK6+qpdoA==
X-Received: by 2002:a05:6a21:3994:b0:38e:676a:f31 with SMTP id
 adf61e73a8af0-38ec62dde5fmr9223382637.25.1769706620221; 
 Thu, 29 Jan 2026 09:10:20 -0800 (PST)
Received: from localhost ([2404:7ac0:6a85:f78d:610f:9387:1245:5704])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c642add55adsm5153767a12.32.2026.01.29.09.10.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jan 2026 09:10:19 -0800 (PST)
From: zishun yi <zishun.yi.dev@gmail.com>
To: Min Ma <mamin506@gmail.com>, Lizhi Hou <lizhi.hou@amd.com>,
 Oded Gabbay <ogabbay@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Zishun Yi <zishun.yi.dev@gmail.com>
Subject: [PATCH v2] accel/amdxdna: Fix memory leak in amdxdna_ubuf_map
Date: Fri, 30 Jan 2026 01:10:22 +0800
Message-ID: <20260129171022.68578-1-zishun.yi.dev@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 30 Jan 2026 09:06:10 +0000
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mamin506@gmail.com,m:lizhi.hou@amd.com,m:ogabbay@kernel.org,m:linux-kernel@vger.kernel.org,m:zishun.yi.dev@gmail.com,m:zishunyidev@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[zishunyidev@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,amd.com,kernel.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,gmail.com];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zishunyidev@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_FROM(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: E56C2B8BB0
X-Rspamd-Action: no action

From: Zishun Yi <zishun.yi.dev@gmail.com>

The amdxdna_ubuf_map() function allocates memory for sg and
internal sg table structures, but it fails to free them if subsequent
operations (sg_alloc_table_from_pages or dma_map_sgtable) fail.

Fixes: bd72d4acda10 ("accel/amdxdna: Support user space allocated buffer")
Signed-off-by: Zishun Yi <zishun.yi.dev@gmail.com>
---
v2: Add 'Fixes' tag

 drivers/accel/amdxdna/amdxdna_ubuf.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/amdxdna/amdxdna_ubuf.c b/drivers/accel/amdxdna/amdxdna_ubuf.c
index 077b2261cf2a..9e3b3b055caa 100644
--- a/drivers/accel/amdxdna/amdxdna_ubuf.c
+++ b/drivers/accel/amdxdna/amdxdna_ubuf.c
@@ -34,15 +34,21 @@ static struct sg_table *amdxdna_ubuf_map(struct dma_buf_attachment *attach,
 	ret = sg_alloc_table_from_pages(sg, ubuf->pages, ubuf->nr_pages, 0,
 					ubuf->nr_pages << PAGE_SHIFT, GFP_KERNEL);
 	if (ret)
-		return ERR_PTR(ret);
+		goto err_free_sg;
 
 	if (ubuf->flags & AMDXDNA_UBUF_FLAG_MAP_DMA) {
 		ret = dma_map_sgtable(attach->dev, sg, direction, 0);
 		if (ret)
-			return ERR_PTR(ret);
+			goto err_free_table;
 	}
 
 	return sg;
+
+err_free_table:
+	sg_free_table(sg);
+err_free_sg:
+	kfree(sg);
+	return ERR_PTR(ret);
 }
 
 static void amdxdna_ubuf_unmap(struct dma_buf_attachment *attach,
-- 
2.51.2

