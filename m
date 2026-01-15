Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 955F1D231EA
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 09:29:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEBC510E6F7;
	Thu, 15 Jan 2026 08:29:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="afbY9jeP";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JdsS+9ft";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 643C610E6F7
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 08:29:32 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60F6g8GA1692941
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 08:29:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=gXRRzI8PFSG
 Xkse4fblghbMDCYBL2rAyR0rE6A7MHy0=; b=afbY9jePQLJ4T8Riy9B6Fz6uBKl
 9aJtbGD5R+Gx9wsLEotDYHrdQMhqjlLFvk4XxvKxmQfEk+3NMteHJ6ko3XKi33dU
 lCeHLZxtfJW174Eg/bmF6gmbYTqfDmPd2TyQdFSEmTnrQDLcEBbDvtDzDAPbU9Td
 geTNliMi5lgOILPcKXmLRY+hr+XwvjrgNQ3+btaVxCuhoobC1GHYw33JaSX0QRjL
 A//cpllfpTxDz+x8qe5RqiJdWLPw6iNNNerk946RMqEt0axc7oobAcdZ+6z/aQSD
 gVFy6qjEjT5WYR0sIy8U3MU8JxV3e0v7Rxyu1+6EEsZh76tcHT0Kh2Z5WyA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bp931kwjh-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 08:29:31 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-81e7fd70908so1379219b3a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 00:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768465771; x=1769070571;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gXRRzI8PFSGXkse4fblghbMDCYBL2rAyR0rE6A7MHy0=;
 b=JdsS+9ftNAQ6W6/tTGP0f1uLN88SXkyo5+hlE5bZe+NeuBsFvF8/+G2lAGvko7D5nT
 /0fpHm7MnEQ9DnyDuFVwM8nTUCV1J0qZiduXna0IukYHzx/4KftaPRGjkqTz7zA9kVMz
 T6HYREJr7uVl8+dYCik9ae/1pLQ4X9F3Qs40xQ03wMbPqZWsh/zUH6oCxWQ9WouAMLcj
 lp2DqL/mNzflmOPD4qVTOoAMIk0rYbkeG0fTnvMGe4M/fPP1ehVHTUuRrC0u4VFIDF4O
 PDKKOiBgQqm9/JfGxBH76ZUHvc/5yj3phPn/k7f7HcCZJ4U6o62kBl/7YyiIoGAtHRhX
 t8Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768465771; x=1769070571;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=gXRRzI8PFSGXkse4fblghbMDCYBL2rAyR0rE6A7MHy0=;
 b=pm5GyIVxJWXKS+A092rrs8RkTvMExg8eNSHO3oOMbAUahWJ5J/vslvWN5bxsnI9xUV
 MMJCTI5/c8mhagA2imAuou65JgIqSJMZjc2Kutc+MMDsFmsTS2Rwn3BpRrIYdB46K3rB
 y78eluzbq5AphOm+eIcrihsvVb0uBL8+UUyqfVsZEMnQFrQENT2RrLOSH9T6UvXPmmY3
 tiYRInBr/iM+p5mACLZ5F+VRd0XyhxZWZYcX5bE1g09ow3f/lrjQnL42OuHBpnYWPHjA
 T2mPFrawHVHagTb8zBaaRZG6aiWnaT19xGZTt6Uk9kRXViCp7BQ4FZNAVUHtQ+Ip1Jfu
 0BUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNEWYt3Nct3WlkwCHxkxK9QSu8dwcT1GK+BkeI6v7G8/nVFcsCQl6Qo6KZB0+LdXYYupK+NdQspbg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YykKTb11MrnhOi8hh79bX/ELyYv7MyMs8LWAceytNRJLCDi30Cp
 WdaDBScTDk+S8fLainT4voeb8Fb2aIXnQ5PY3w6Croo2vDYrDb8eIa6cl2WFbsMoW2drBnjAzQS
 kbsYTBlyTvjPoWVO2TSUrMt65Adwc0DefeJX97cCdVw3Q/SeYgJxA0IYD1boRJSmA8kmfDsc=
X-Gm-Gg: AY/fxX5y2xdmmukWoAO8MHse1zY7g1Oj3xOXCjjvkVQLN2NoYRbylGW+ABO+B7EeiXr
 qc2o21NFyz9EjAc1Fx9nippEA0knrGr7ytEkVORfhLtibFwgCrEq1AmV9SjXFhZq9j1UchEl1Kb
 MLGRVs6bt6Xf+nmcaYh2SKa36wnKjAQMjcnJ30sPCSz/sRk2LLXh2zHLmVGUGNB+Bxms+0YIhps
 6/IejTGZ7dKKRGa5l5Cvkzfz+b4AFnWEbgfwsJsGd1Fmg02HKcXZR+sq4QyKhrRz0sVzVYiirY8
 sgrpljKmFNEOkHN9qliyFX2Cw6RVnmoJNDkm7xt4MhrG/AGhHMLQu/hVUR/oYfDGlROXq5n3a7H
 RMKUIYMf2P0i0ZCi2UhC8Mqg0PYw95JtR44yRs0CN
X-Received: by 2002:a05:6a00:349a:b0:81e:c91c:70c5 with SMTP id
 d2e1a72fcca58-81f83cc6427mr4776806b3a.29.1768465771060; 
 Thu, 15 Jan 2026 00:29:31 -0800 (PST)
X-Received: by 2002:a05:6a00:349a:b0:81e:c91c:70c5 with SMTP id
 d2e1a72fcca58-81f83cc6427mr4776785b3a.29.1768465770602; 
 Thu, 15 Jan 2026 00:29:30 -0800 (PST)
Received: from QCOM-SocCW5bzXR.qualcomm.com ([202.46.23.19])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-81f8e69d1e7sm1773296b3a.58.2026.01.15.00.29.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 00:29:30 -0800 (PST)
From: Jianping Li <jianping.li@oss.qualcomm.com>
To: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, thierry.escande@linaro.org, 
 abelvesa@kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 stable@kernel.org, Jianping Li <jianping.li@oss.qualcomm.com>
Subject: [PATCH v2 1/4] misc: fastrpc: Add NULL check to fastrpc_buf_free to
 prevent crash
Date: Thu, 15 Jan 2026 16:28:48 +0800
Message-Id: <20260115082851.570-2-jianping.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260115082851.570-1-jianping.li@oss.qualcomm.com>
References: <20260115082851.570-1-jianping.li@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=BOW+bVQG c=1 sm=1 tr=0 ts=6968a56b cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=ZnmZ8TzD_GdZzTgawW0A:9
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: j8o7U8IXBfizVdaLWjUeTfFJ2ALj23Vo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA1NyBTYWx0ZWRfX5p6HEIbsbK9F
 HFVpVW7nvXOfCznNWxLuZM1044aaHm2JklncKboiuA5BuuEZXi0jEqOdiwax7eu+kd3sDg0C7DL
 4qij9IPj4bpYGYglrgCKeEv/0wEZk9Pe9zV1mRdWyYh43G2eNa72SfNr2zQoua5zHspPgwV1DaS
 tSOnusFR7nyoH+XGD803Isvy57CvdX8iDneDljDDOYZfck/xhQ4onoOXVvpPNe3IDkB01r+66AD
 iRqmVgKPlEWGVGpNNhjrQS46vOcO1iir8yunfokV03qbejjmbMg/QA6wR9A4BHjlV0d2EbnUB5m
 0DMixzXvYjcYgPfk2CCj7OqFTfu5NrX7olkrqmA8jlGe91mRgLY2skxO/D2Q8Y8gNQMQRP43FR+
 983dqEgBTOz9wAct5ZriygKsEWyQEbdQdjRKGyGMxLQE/jU07xf/gbvtVTG931SPB/O/hfLelk1
 aINBdbq9l7zbwX0J43w==
X-Proofpoint-GUID: j8o7U8IXBfizVdaLWjUeTfFJ2ALj23Vo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1011
 adultscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150057
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

From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

The fastrpc_buf_free function currently does not handle the case where
the input buffer pointer (buf) is NULL. This can lead to a null pointer
dereference, causing a crash or undefined behavior when the function
attempts to access members of the buf structure. Add a NULL check to
ensure safe handling of NULL pointers and prevent potential crashes.

Fixes: c68cfb718c8f9 ("misc: fastrpc: Add support for context Invoke method")
Cc: stable@kernel.org
Co-developed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 4f5a79c50f58..515a43c9d95d 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -414,6 +414,9 @@ static int fastrpc_map_lookup(struct fastrpc_user *fl, int fd,
 
 static void fastrpc_buf_free(struct fastrpc_buf *buf)
 {
+	if (!buf)
+		return;
+
 	dma_free_coherent(buf->dev, buf->size, buf->virt,
 			  fastrpc_ipa_to_dma_addr(buf->fl->cctx, buf->dma_addr));
 	kfree(buf);
@@ -510,8 +513,7 @@ static void fastrpc_context_free(struct kref *ref)
 	for (i = 0; i < ctx->nbufs; i++)
 		fastrpc_map_put(ctx->maps[i]);
 
-	if (ctx->buf)
-		fastrpc_buf_free(ctx->buf);
+	fastrpc_buf_free(ctx->buf);
 
 	spin_lock_irqsave(&cctx->lock, flags);
 	idr_remove(&cctx->ctx_idr, ctx->ctxid >> 4);
@@ -1591,8 +1593,7 @@ static int fastrpc_device_release(struct inode *inode, struct file *file)
 	list_del(&fl->user);
 	spin_unlock_irqrestore(&cctx->lock, flags);
 
-	if (fl->init_mem)
-		fastrpc_buf_free(fl->init_mem);
+	fastrpc_buf_free(fl->init_mem);
 
 	list_for_each_entry_safe(ctx, n, &fl->pending, node) {
 		list_del(&ctx->node);
@@ -2492,8 +2493,7 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
 	list_for_each_entry_safe(buf, b, &cctx->invoke_interrupted_mmaps, node)
 		list_del(&buf->node);
 
-	if (cctx->remote_heap)
-		fastrpc_buf_free(cctx->remote_heap);
+	fastrpc_buf_free(cctx->remote_heap);
 
 	of_platform_depopulate(&rpdev->dev);
 
-- 
2.43.0

