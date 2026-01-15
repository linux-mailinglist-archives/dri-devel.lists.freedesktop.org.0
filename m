Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BAE1D23208
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 09:30:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD7D410E700;
	Thu, 15 Jan 2026 08:30:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hVI2nRWj";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FFZLZrQM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFF8410E700
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 08:30:10 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60F6g1h41055246
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 08:30:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=yRAomd5/Wnd
 mqPt4/KPViCWMZ2kB08fk6+zB+UfeCDE=; b=hVI2nRWjdZSESpYczFwIsLzy9Qx
 9zLckqHcW7nRODwuOh/IXba5OqmhGd8vK/Il79OqwH5h4SBnIIsqIfXkQhMFsklf
 2r7jlfcfE28LtJ6/BqmMNgewkFN/X5vfpnNgFv9ieIUTLhZXD7Z24uBsbGFqUw6+
 sPEqt3PYLxMrIX7c+PMvsD0nuvvbgk4dDKlhZUH9eLRIzi3ElqOobEwANmFLO0CV
 m1aMNf4UZ313uVOSOxvCxK+WFCTAjSXJBPpg1SyjD+gEYAMLpMQ0SIUIQQAT8vDH
 HkwoZ59SuYO7u2Wm42SUTNZ74rm+DSi3gQTUZ2D0+CMYYnFdWzw8ZJpe1MA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bp8d33xb5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 08:30:09 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-81f4c1412b8so1327689b3a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 00:30:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768465809; x=1769070609;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yRAomd5/WndmqPt4/KPViCWMZ2kB08fk6+zB+UfeCDE=;
 b=FFZLZrQMCd4ItQVp7wSubt/agieSZK3wGJF/9VnzDFUHVV1yB968CD/XfxxBZ73QOJ
 jbdKqI4vKd7lRVacpBvju5UlJfKkq/WKZ5MEFof3lvoRuIxQRUmO41o0mxk04Zha9tuS
 GMikqeD/3SaG+vmrM15f/VFyk115tBR5EjidRq7NYg7X5P3lqEJoQA1ycDqpodoPqADp
 kbKw7XPZnVsgn3wlgQ9HHYhfuGVQR5ogHfjtWFY/k3/xcUgu7bNMdylLS7KSSEUyNxN9
 EkMSBlepRVy0yzpaA78EAuzMp/wk0n96EmnNjrApqldOQVqZ9oU2Rdnzk9YuCRGy6ryW
 Hdrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768465809; x=1769070609;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=yRAomd5/WndmqPt4/KPViCWMZ2kB08fk6+zB+UfeCDE=;
 b=b1DhNxP61XM+BomTV9R51zicuGYK/79oNq1GCm6G0ESSKnoh9XrTW/iEzC9Sw14SPH
 DqQyggNOfk50UToV88nZe91w4buumeNt9Hd+ZaIGkRaSv1Do6Ra04zcAlo3PkT1ceCaZ
 dzpnnTwDE7nAbvwa7BMvvAge1xrv2Hn0hL/q1Qo9EGs6tRa6ggzlXJUbSrhV71AYR4c2
 +OzzzWSbghEwAmyOWz0i+mSMixYeHubre2dhzK7onrh3XjUrkDvNBtseHoxWumxf/Cq2
 VQIRdKGFeCjZH+fL74kJ0v7r2WFcUwcWYUtK8MsznOAaY577Ccnwk3GjsAuCfEnVhaD6
 f5wg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2OvpR9FabZAUyZUnz4ugzpe0WWuhxxwK7EbQSOjuDjobHGkzWxJ5LXsLWzKGRQoBD3N3rGZjbGWw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw0zNSQRyjemYjDuZDrUDOxZuvlgOiW/ITZnd6nUHTcnhEbA7dN
 JNRgxJLbeoFsama30w4pzdbyrIj5FN7ug/cqy5bNRTXq33v40WcqozDEX4lnJ20M9m4opwD7l1d
 xK6djA6OIBgc0P//B7VzNajDjQpY1DU8DSWJ2LtsfYpyJbIw8TMpJd+YSQGtjugNPCbMErStYhM
 zf6ex2iA==
X-Gm-Gg: AY/fxX5+Sbj4RG7/kpZFehlCKJHWOREZ/tKDCFC41AL7tkQ7X9mk2i5kGJWfXyJRWuf
 Sgzt9I3aOUcv5yfGPO3GwOh0sYPhmJrQj5P/AJD9Nzfc7tnkbYKO7ne1cWavs8XrA8pXZ8LH1ek
 r5YsBrN72bb7C8hp8lJMrMw1awYY/u71YvZ5HXBYT+z7SOKpvfvWYWDApQNOKrAEGm+oELUakGt
 CzrSaZ5Vk8cRYfJZt1hf4hnL142pXd4SjI1y1ASK40Svs/i2iybx4hWtg0AM+BCHJo62AFpyN61
 COejW7Xc13pkGOdBLggwldwdu4M1HTZu5TJzoN7O0x6lBBQDtuHcaP4/HZC8RklGvrgrROC57m4
 4KuQ8I8kYhr1WFqe8ezcliDWhyLqUxHBYzDPJpqOk
X-Received: by 2002:a05:6a00:b90a:b0:81f:2b84:6efb with SMTP id
 d2e1a72fcca58-81f82011df7mr6059485b3a.69.1768465808572; 
 Thu, 15 Jan 2026 00:30:08 -0800 (PST)
X-Received: by 2002:a05:6a00:b90a:b0:81f:2b84:6efb with SMTP id
 d2e1a72fcca58-81f82011df7mr6059441b3a.69.1768465808070; 
 Thu, 15 Jan 2026 00:30:08 -0800 (PST)
Received: from QCOM-SocCW5bzXR.qualcomm.com ([202.46.23.19])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-81f8e69d1e7sm1773296b3a.58.2026.01.15.00.29.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 00:30:07 -0800 (PST)
From: Jianping Li <jianping.li@oss.qualcomm.com>
To: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org
Cc: Jianping Li <jianping.li@oss.qualcomm.com>, thierry.escande@linaro.org,
 abelvesa@kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 ekansh.gupta@oss.qualcomm.com
Subject: [PATCH v2 4/4] misc: fastrpc: Allocate entire reserved memory for
 Audio PD in probe
Date: Thu, 15 Jan 2026 16:28:51 +0800
Message-Id: <20260115082851.570-5-jianping.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260115082851.570-1-jianping.li@oss.qualcomm.com>
References: <20260115082851.570-1-jianping.li@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 5QiOgwmOj7Q6DCXomN54v1N50cn0IbBV
X-Authority-Analysis: v=2.4 cv=fbWgCkQF c=1 sm=1 tr=0 ts=6968a591 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=6yTI7Z6G2gYhkubfSC0A:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: 5QiOgwmOj7Q6DCXomN54v1N50cn0IbBV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA1NyBTYWx0ZWRfX8iVzh4xC0k8j
 nek3a5urYQAGf/LAN62+ZqdcDWUdNpuC/uCQpmUi8HJNlZrNP2PwhVv7hkkcegO48Ydi81MItuB
 yVSrNBIDeUvz52VWfG890yKO/t73eh6XkU1ivDMB94Rh7sqAZLdosbyDcddolKbjn0lyjBHsG9D
 yBIAbJ7/n8Ur0WKggmQjXIIb6rlBiPO7R1TpQ1RTsCsUTVH6kAnvIXreDhMQQm64O5eFBQOIgZ3
 U2hiSi2BOZ2xyPPHtIyCzmtcgKyJskq0iJQX9fGQflsO5PcnPQ1K7mcOJjAkfvVYrNfxMyB0iw2
 BqTWJjbCYCbuF5hzUcJf1HWRdcuAuXJEqmEqT59L95OISVvn0uSocv/cnP18CJwHI52IGe5t8ab
 lhB9XsRuIjQ2V3l5N98oFuIfIlY8FydU+4kdDuXd5pFXCkikd2pdhFWQd+bmy2y/iTYB3wSKzUE
 fcHKDQnO1WCdx2Qj2yA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0 lowpriorityscore=0
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

The entire reserved-memory region is now assigned to DSP VMIDs during
channel setup and stored in cctx->remote_heap. Memory is reclaimed in
rpmsg_remove by revoking DSP permissions and freeing the buffer, tying
heap lifecycle to the rpmsg channel.

Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 95 ++++++++++++++++++++----------------------
 1 file changed, 45 insertions(+), 50 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 833c265add5e..f9edca7a8de1 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -278,6 +278,8 @@ struct fastrpc_channel_ctx {
 	struct kref refcount;
 	/* Flag if dsp attributes are cached */
 	bool valid_attributes;
+	/* Flag if audio PD init mem was allocated */
+	bool audio_init_mem;
 	u32 dsp_attributes[FASTRPC_MAX_DSP_ATTRIBUTES];
 	struct fastrpc_device *secure_fdevice;
 	struct fastrpc_device *fdevice;
@@ -1304,7 +1306,6 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 	struct fastrpc_phy_page pages[1];
 	char *name;
 	int err;
-	bool scm_done = false;
 	struct {
 		int client_id;
 		u32 namelen;
@@ -1334,31 +1335,6 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 	inbuf.client_id = fl->client_id;
 	inbuf.namelen = init.namelen;
 	inbuf.pageslen = 0;
-	if (!fl->cctx->remote_heap) {
-		err = fastrpc_remote_heap_alloc(fl, fl->sctx->dev, init.memlen,
-						&fl->cctx->remote_heap);
-		if (err)
-			goto err_name;
-
-		/* Map if we have any heap VMIDs associated with this ADSP Static Process. */
-		if (fl->cctx->vmcount) {
-			u64 src_perms = BIT(QCOM_SCM_VMID_HLOS);
-
-			err = qcom_scm_assign_mem(fl->cctx->remote_heap->dma_addr,
-							(u64)fl->cctx->remote_heap->size,
-							&src_perms,
-							fl->cctx->vmperms, fl->cctx->vmcount);
-			if (err) {
-				dev_err(fl->sctx->dev,
-					"Failed to assign memory with dma_addr %pad size 0x%llx err %d\n",
-					&fl->cctx->remote_heap->dma_addr,
-					fl->cctx->remote_heap->size, err);
-				goto err_map;
-			}
-			scm_done = true;
-			inbuf.pageslen = 1;
-		}
-	}
 
 	fl->pd = USER_PD;
 
@@ -1370,8 +1346,15 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 	args[1].length = inbuf.namelen;
 	args[1].fd = -1;
 
-	pages[0].addr = fl->cctx->remote_heap->dma_addr;
-	pages[0].size = fl->cctx->remote_heap->size;
+	if (!fl->cctx->audio_init_mem) {
+		pages[0].addr = fl->cctx->remote_heap->dma_addr;
+		pages[0].size = fl->cctx->remote_heap->size;
+		fl->cctx->audio_init_mem = true;
+		inbuf.pageslen = 1;
+	} else {
+		pages[0].addr = 0;
+		pages[0].size = 0;
+	}
 
 	args[2].ptr = (u64)(uintptr_t) pages;
 	args[2].length = sizeof(*pages);
@@ -1389,26 +1372,7 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 
 	return 0;
 err_invoke:
-	if (fl->cctx->vmcount && scm_done) {
-		u64 src_perms = 0;
-		struct qcom_scm_vmperm dst_perms;
-		u32 i;
-
-		for (i = 0; i < fl->cctx->vmcount; i++)
-			src_perms |= BIT(fl->cctx->vmperms[i].vmid);
-
-		dst_perms.vmid = QCOM_SCM_VMID_HLOS;
-		dst_perms.perm = QCOM_SCM_PERM_RWX;
-		err = qcom_scm_assign_mem(fl->cctx->remote_heap->dma_addr,
-						(u64)fl->cctx->remote_heap->size,
-						&src_perms, &dst_perms, 1);
-		if (err)
-			dev_err(fl->sctx->dev, "Failed to assign memory dma_addr %pad size 0x%llx err %d\n",
-				&fl->cctx->remote_heap->dma_addr, fl->cctx->remote_heap->size, err);
-	}
-err_map:
-	fastrpc_buf_free(fl->cctx->remote_heap);
-err_name:
+	fl->cctx->audio_init_mem = false;
 	kfree(name);
 err:
 	kfree(args);
@@ -2396,7 +2360,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 		}
 	}
 
-	if (domain_id == SDSP_DOMAIN_ID) {
+	if (domain_id == SDSP_DOMAIN_ID || domain_id == ADSP_DOMAIN_ID) {
 		struct resource res;
 		u64 src_perms;
 
@@ -2408,6 +2372,15 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 				    data->vmperms, data->vmcount);
 		}
 
+		if (domain_id == ADSP_DOMAIN_ID) {
+			data->remote_heap =
+				kzalloc(sizeof(*data->remote_heap), GFP_KERNEL);
+			if (!data->remote_heap)
+				return -ENOMEM;
+
+			data->remote_heap->dma_addr = res.start;
+			data->remote_heap->size = resource_size(&res);
+		}
 	}
 
 	secure_dsp = !(of_property_read_bool(rdev->of_node, "qcom,non-secure-domain"));
@@ -2488,10 +2461,13 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
 	struct fastrpc_buf *buf, *b;
 	struct fastrpc_user *user;
 	unsigned long flags;
+	bool skip_free = false;
+	int err;
 
 	/* No invocations past this point */
 	spin_lock_irqsave(&cctx->lock, flags);
 	cctx->rpdev = NULL;
+	cctx->audio_init_mem = false;
 	list_for_each_entry(user, &cctx->users, user)
 		fastrpc_notify_users(user);
 	spin_unlock_irqrestore(&cctx->lock, flags);
@@ -2505,7 +2481,26 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
 	list_for_each_entry_safe(buf, b, &cctx->invoke_interrupted_mmaps, node)
 		list_del(&buf->node);
 
-	fastrpc_buf_free(cctx->remote_heap);
+	if (cctx->remote_heap) {
+		if (cctx->vmcount) {
+			u64 src_perms = 0;
+			struct qcom_scm_vmperm dst_perms;
+
+			for (u32 i = 0; i < cctx->vmcount; i++)
+				src_perms |= BIT(cctx->vmperms[i].vmid);
+
+			dst_perms.vmid = QCOM_SCM_VMID_HLOS;
+			dst_perms.perm = QCOM_SCM_PERM_RWX;
+
+			err = qcom_scm_assign_mem(cctx->remote_heap->dma_addr,
+						  cctx->remote_heap->size,
+						  &src_perms, &dst_perms, 1);
+			if (err)
+				skip_free = true;
+		}
+		if (!skip_free)
+			fastrpc_buf_free(cctx->remote_heap);
+	}
 
 	of_platform_depopulate(&rpdev->dev);
 
-- 
2.43.0

