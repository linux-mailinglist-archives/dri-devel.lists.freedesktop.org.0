Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4A9C91A91
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 11:34:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A87710E8D5;
	Fri, 28 Nov 2025 10:34:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Prb0uims";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GI78SW7T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D912210E8D5
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 10:34:37 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AS8OaHs3531028
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 10:34:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=IPnOVWqwyE7
 dmRiwVJlZo4xKYGYq4wHZIwKE6VXPwFs=; b=Prb0uimsG+A1BXpszr8vssiKGrk
 YEwYJVORVs50v4Px51eC5HCZAomwIvvZOqX3rBkHgy33f/WzY99lL0rgJ8XG8nWf
 A6a5BJ8IDcsBfyf1Xvzbu+4k1wGbCmP9g7GHbLtJRp/Q6rJrB5eEDsPFq28qg78V
 5BptPcWI6Pw/0/Zq7+wQyMsB4hcS7jkwQWRZyW77ufJhisWeRH2G/nn0LCF3DoDt
 XRAJZmXClN31cTjpPI2qgpz9eFsxecoUZ2P4NzYqWUSJDgRlmqL5uLU+hX/VjXis
 6Rpko5gWYGt1TxNr4Qe0fpavGnaVDniRBAHLSc/aprWslzZf8E6LBQ/wMFw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apm2ru6wm-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 10:34:37 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-29845b18d1aso31896705ad.1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 02:34:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764326077; x=1764930877;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IPnOVWqwyE7dmRiwVJlZo4xKYGYq4wHZIwKE6VXPwFs=;
 b=GI78SW7Tr3M8DzRE2X7EIBlZpAT8Boe4rDTRylmwsXRK7RJstdZmRGYRRmeLAyEtX5
 UTa3unPSQ9lI/E3rHH3hNFJoAuV3N5MDav6k0I2IilUsP+jhWREK9yFE9wRx9ZQiiECu
 c6qmbTGE+BCxwE5zozwuiCEvLv08Vsgbiw/PTfZm2x2mhHCRycQIu7yD979Mq6kuFYNt
 bH7E5wlzpXsVNfbi8JBc3575158OCYWAOKI5i6+b/dpTXcl01fmL2Z+BbtpA+l6wncnG
 vI0ZhgBOAAvEi2xQW/bK5ZSoYFF9qdurnxq+6saEuOCiXiDCq/Wa2QsScqh570Qcctg0
 fxvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764326077; x=1764930877;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=IPnOVWqwyE7dmRiwVJlZo4xKYGYq4wHZIwKE6VXPwFs=;
 b=gPqwEXER0iBedOMAuU6AGvZNbT7GeoLQ0/rt7SNUeOjXFIRCid01L9Sv5I56TdJEVG
 1WLT4faImSNqvfwHHiWrCkLZEqo24/sbkYRZHasn1CMhBBegY48iuHoWfJxqVFXwph2/
 3GnHD2NkWAl//N3F0RyaVRZLZ5wKVSD1tP/+dTDrZHcbQzt2HhTPJiN2jEp4rqHZbYrU
 pz98LKkqyoJOEMuTLwrJ262aNw/k85obIvIr7/7DwZZ4hfMvdlpbnebG4mc0kj5ha4Mz
 8Vgo1vw3xmMZ4QzSwrwbZarpRdcdjGSb3/cJesMEbhW1nZcvP2O6u8OIN30B9ck2/XQY
 v4TQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDN5Y4bREkOvspZVvm5su/RFb/Cgh0ORlR92tjhrky5zCf/FP5xD+F1qACyUOkllm8YZyHwCFdXfM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyCqriTj2du0grOrymsLyLj0aEPvzAHfaYkA8O1Hmp0WyX47J/I
 d1gaKkbKCPcd0tn5MykLNI/VZaPJZsc5ukreCYVOAgIFBzpSt7ZJ4g/r48+rqpIFS9VACljb0bd
 ozZBSiXhqL2EsHsCNIytUT81M09as/aRuLpdTsm93yOYsceaPXNY+hKF6TGCrXlE8W+F9XJc=
X-Gm-Gg: ASbGncvm+PztK86YChUjyAQhzdWJTmFDYTzzB5UcaIGZ9tXniXCgR4gxLDUfm+X/nFy
 xTFUqTKLbAbYdA4mDjevi+DOiCD4Y2zdtjogTctQ/Q9SexsZ24ee0fk58olas9B9sxazahhBWqa
 q7gwmJs77T4oA1WrLBn9XrlWBlYh379d4nbIRrgngQyGvAbonzVO0nNca1KBxGaHIf+/QyzKbSC
 tw9YNYxkd3w4TQt27D/ZBC9LB3TGjy7jnFPhTuza8/CBzfDbVwBs+6gyCJyen4i3v612uj+GKd1
 Ut306/ZibzQYbBThuY1L/GYlujKrxQs86rnIEAD/4dF3fYQigqpYMY4xasOqlzqZI4BjQZjnNtG
 GQpQC9JsfE4OMSX/bQw/cxcuX6oqm3OvqFf8r5hh6/A==
X-Received: by 2002:a17:902:ebd2:b0:295:57f6:768 with SMTP id
 d9443c01a7336-29b6c575687mr281002145ad.33.1764326076499; 
 Fri, 28 Nov 2025 02:34:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEJ95n2o/SW33n4j5YjSWDtSMjNHUljAZYogDtIPZGtzVCHAvGey5m8vbtw1/igS5b/hrMCtA==
X-Received: by 2002:a17:902:ebd2:b0:295:57f6:768 with SMTP id
 d9443c01a7336-29b6c575687mr281001705ad.33.1764326075878; 
 Fri, 28 Nov 2025 02:34:35 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29bce40b993sm43098195ad.14.2025.11.28.02.34.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Nov 2025 02:34:35 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de,
 dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v2 1/2] misc: fastrpc: Refactor mmap and munmap logic into
 helper functions
Date: Fri, 28 Nov 2025 16:04:27 +0530
Message-Id: <20251128103428.1119696-2-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251128103428.1119696-1-ekansh.gupta@oss.qualcomm.com>
References: <20251128103428.1119696-1-ekansh.gupta@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDA3NiBTYWx0ZWRfX+XMypw2onEyS
 K2fe378uqIM/Z27SI7NZESRB5J/X9nEkfXaaDzlhxXQBbhjPro48+SbjVa/h8k3secX+bei/ZRZ
 ZYIcz8pz4aSH34C2lzBf3NTYu4eQc1/Sc6pDIXd7dN21SyX4Bvgjv0z+NkdlZ+lmK8yXxTxoQZd
 NKLi+Ig9DF6UAwQdOINnO+HCYI2a5l5VcPck072D5LDCdxEPxiyyuDFusQX4yU7KPLgWg1JHK9u
 D3dEf1IkCVbwrzvlfNWAQ1c0HxpW128R1jHdFRv2ndACAChf8busjrIj3SDnDBQhRu1BgXPVwK2
 WwfAPPZ5nOUErp/xJFewIuGc2bD65Zx8EDbY0W+VT3euiddgbLIpw/tNKIUWGLXmdOZ5J/ZSRb3
 2E1w1KJc24O7SWxi8zcssPFL4wtrEg==
X-Proofpoint-ORIG-GUID: stH8aW8ZNU5fCopon2lVIEnX-O2sXy95
X-Authority-Analysis: v=2.4 cv=W941lBWk c=1 sm=1 tr=0 ts=69297abd cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=04dbU8GgqVRi9gjLVHMA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: stH8aW8ZNU5fCopon2lVIEnX-O2sXy95
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_03,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511280076
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

Refactor FastRPC mmap and munmap handling by introducing dedicated
helper functions for DSP-side operations. This change improves code
readability and separates DSP invocation logic from buffer allocation
and cleanup.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 110 +++++++++++++++++++++++++++--------------
 1 file changed, 74 insertions(+), 36 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index ee652ef01534..9bf76e224852 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -1811,24 +1811,33 @@ static int fastrpc_get_dsp_info(struct fastrpc_user *fl, char __user *argp)
 	return 0;
 }
 
-static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *buf)
+static int fastrpc_req_munmap_dsp(struct fastrpc_user *fl, u64 raddr, u64 size)
 {
 	struct fastrpc_invoke_args args[1] = { [0] = { 0 } };
 	struct fastrpc_munmap_req_msg req_msg;
-	struct device *dev = fl->sctx->dev;
 	int err;
 	u32 sc;
 
 	req_msg.client_id = fl->client_id;
-	req_msg.size = buf->size;
-	req_msg.vaddr = buf->raddr;
+	req_msg.size = size;
+	req_msg.vaddr = raddr;
 
-	args[0].ptr = (u64) (uintptr_t) &req_msg;
+	args[0].ptr = (u64) &req_msg;
 	args[0].length = sizeof(req_msg);
 
 	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_MUNMAP, 1, 0);
 	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE, sc,
 				      &args[0]);
+
+	return err;
+}
+
+static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *buf)
+{
+	struct device *dev = fl->sctx->dev;
+	int err;
+
+	err = fastrpc_req_munmap_dsp(fl, buf->raddr, buf->size);
 	if (!err) {
 		dev_dbg(dev, "unmmap\tpt 0x%09lx OK\n", buf->raddr);
 		spin_lock(&fl->lock);
@@ -1869,26 +1878,54 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
 	return fastrpc_req_munmap_impl(fl, buf);
 }
 
-static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
+static int fastrpc_req_map_dsp(struct fastrpc_user *fl, u64 phys,
+			       u64 size, u32 flag, u64 vaddrin,
+			       u64 *raddr)
 {
 	struct fastrpc_invoke_args args[3] = { [0 ... 2] = { 0 } };
-	struct fastrpc_buf *buf = NULL;
 	struct fastrpc_mmap_req_msg req_msg;
 	struct fastrpc_mmap_rsp_msg rsp_msg;
 	struct fastrpc_phy_page pages;
-	struct fastrpc_req_mmap req;
-	struct device *dev = fl->sctx->dev;
 	int err;
 	u32 sc;
 
-	if (copy_from_user(&req, argp, sizeof(req)))
-		return -EFAULT;
+	req_msg.client_id = fl->client_id;
+	req_msg.flags = flag;
+	req_msg.vaddr = vaddrin;
+	req_msg.num = sizeof(pages);
 
-	if (req.flags != ADSP_MMAP_ADD_PAGES && req.flags != ADSP_MMAP_REMOTE_HEAP_ADDR) {
-		dev_err(dev, "flag not supported 0x%x\n", req.flags);
+	args[0].ptr = (u64)&req_msg;
+	args[0].length = sizeof(req_msg);
 
-		return -EINVAL;
+	pages.addr = phys;
+	pages.size = size;
+
+	args[1].ptr = (u64)&pages;
+	args[1].length = sizeof(pages);
+
+	args[2].ptr = (u64)&rsp_msg;
+	args[2].length = sizeof(rsp_msg);
+	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_MMAP, 2, 1);
+	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE, sc,
+				      &args[0]);
+
+	if (err) {
+		dev_err(fl->sctx->dev, "mmap error (len 0x%08llx)\n", size);
+		return err;
 	}
+	*raddr = rsp_msg.vaddr;
+
+	return 0;
+}
+
+static int fastrpc_req_buf_alloc(struct fastrpc_user *fl,
+				 struct fastrpc_req_mmap req,
+				 char __user *argp)
+{
+	struct device *dev = fl->sctx->dev;
+	struct fastrpc_buf *buf = NULL;
+	u64 raddr = 0;
+	int err;
 
 	if (req.vaddrin) {
 		dev_err(dev, "adding user allocated pages is not supported\n");
@@ -1905,26 +1942,8 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
 		return err;
 	}
 
-	req_msg.client_id = fl->client_id;
-	req_msg.flags = req.flags;
-	req_msg.vaddr = req.vaddrin;
-	req_msg.num = sizeof(pages);
-
-	args[0].ptr = (u64) (uintptr_t) &req_msg;
-	args[0].length = sizeof(req_msg);
-
-	pages.addr = buf->phys;
-	pages.size = buf->size;
-
-	args[1].ptr = (u64) (uintptr_t) &pages;
-	args[1].length = sizeof(pages);
-
-	args[2].ptr = (u64) (uintptr_t) &rsp_msg;
-	args[2].length = sizeof(rsp_msg);
-
-	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_MMAP, 2, 1);
-	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE, sc,
-				      &args[0]);
+	err = fastrpc_req_map_dsp(fl, buf->phys, buf->size, req.flags,
+				  req.vaddrin, &raddr);
 	if (err) {
 		dev_err(dev, "mmap error (len 0x%08llx)\n", buf->size);
 		fastrpc_buf_free(buf);
@@ -1932,10 +1951,10 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
 	}
 
 	/* update the buffer to be able to deallocate the memory on the DSP */
-	buf->raddr = (uintptr_t) rsp_msg.vaddr;
+	buf->raddr = (uintptr_t)raddr;
 
 	/* let the client know the address to use */
-	req.vaddrout = rsp_msg.vaddr;
+	req.vaddrout = raddr;
 
 	/* Add memory to static PD pool, protection thru hypervisor */
 	if (req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR && fl->cctx->vmcount) {
@@ -1970,6 +1989,25 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
 	return err;
 }
 
+static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
+{
+	struct fastrpc_req_mmap req;
+	int err;
+
+	if (copy_from_user(&req, argp, sizeof(req)))
+		return -EFAULT;
+
+	if (req.flags != ADSP_MMAP_ADD_PAGES && req.flags != ADSP_MMAP_REMOTE_HEAP_ADDR) {
+		dev_err(fl->sctx->dev, "flag not supported 0x%x\n", req.flags);
+
+		return -EINVAL;
+	}
+
+	err = fastrpc_req_buf_alloc(fl, req, argp);
+
+	return err;
+}
+
 static int fastrpc_req_mem_unmap_impl(struct fastrpc_user *fl, struct fastrpc_mem_unmap *req)
 {
 	struct fastrpc_invoke_args args[1] = { [0] = { 0 } };
-- 
2.34.1

