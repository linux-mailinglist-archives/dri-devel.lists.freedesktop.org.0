Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D217C91A94
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 11:34:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8497B10E8D7;
	Fri, 28 Nov 2025 10:34:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BDpDz5xh";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Taptl+G5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88D7F10E8D7
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 10:34:41 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AS8ONef3967482
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 10:34:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=tksOsG49Dg9
 nA4MxpHKa0diwA7zCt+Mdk9sP8H6UiFQ=; b=BDpDz5xhdBTByVRlPHItsGkAxya
 X5Up2sJiSn77996IJYwNJOFnTSAv624Z6EnKTnPhrEeC7dy1Bg73qBAiXE0IsNTW
 sKJ06ZwNEAjN8/J7ibOtWLZ27poS7DdBWLNTONO3WOb8/6hSUNJM2dpPNFk0RqPa
 F17FGpgd98IecvYO67KXyjJ+mPjYZe0zXRjBhXe8pe29XRosnlotmLPRDFTErWAa
 LQMD2gI+jvlIePISdQJXYKJ26A6Wgq5ZUS1MThIt4oy7D8klodB1fhoQQdFN1UMl
 PkNCLvOxkG80Jor60OF+zmbZSwOjTLD1Nh6VzKnwO0hmtCbx0I1WyXAapjQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apkv5k7y4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 10:34:40 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-297dde580c8so54838725ad.1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 02:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764326080; x=1764930880;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tksOsG49Dg9nA4MxpHKa0diwA7zCt+Mdk9sP8H6UiFQ=;
 b=Taptl+G5tEK8a/1Bg1H6xjC7IeQrflp9/i3onw+uZUNLD3NhXzUXGCl2GooaSWcBzd
 7V1IOq2outxbOcedvtxMIVtij16eafw2+28mOTSdjqMAQ+m+UPsARUusWkJNZWEgKjrz
 n+HDO0kOVyxBp/z8XMwNvq4C1LD6zYuY67COB0ryF3JqwPjvwWr/4sLy3+WrXO+8FzHH
 EavoaQk3iwkp81hVB91oM3nKpPZ1dz/9w4R+6yzGdv30jNm999GhjnQyLfrNdIFxyInu
 Ry0UrdMVz4Q751wbU1Wp9D8NzL1VE6cEpLkqB0WTrp0sk2DFRF/zyR/qOVplXMnYnDid
 rtdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764326080; x=1764930880;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=tksOsG49Dg9nA4MxpHKa0diwA7zCt+Mdk9sP8H6UiFQ=;
 b=pljFfDqOb0UZRVhwkV1mF5CLL1EGXVYFQ7yzsoVce8+NjRAAe1LcNS64QJ4VisUPMI
 Tm7xTGFlF88lIJ6nYl5uoiva58z74IEPHLWvAcJiKt9Y4yT7XoHmm2ixU0sgaFxWySG6
 9mgSWoLkbJnL2rA6t0rAR/pAoT9qqz4cS7H4KqDfbrEHi1LoESaODeA3A71LeHwCEMv2
 euu2Wf6VGFfrUHlz3sWTiDEFHKUfRMDtxRcT9hU+ceuwSoLDKjra3iU7zuFb4b/cVmpJ
 f0qubq67PdIjJjBwPbZONEW+KtS2C99Zh42r+fBi9cFNMYm+apl8HOMB69jObflBjGBK
 T9YA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/lSO0RjCl+4QyeE4Cd70kPOGetbdXz2ppWyLlywUhapm3L7Ng/Fdd+HuhxHkCRfKyddiHw60Q9M0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwzjDFhBeBiskeJYkKj9G+PD7hYSuKJY2WyJphE6Fn5zk+KWg/Q
 E7IbiJ/kp3XQ50bYGNqXxmsImUEQlSgsoTtHPp34kDJmgwNsGt/+9z/hlQZlO3Pk1CTfsKzbPrB
 gN7snM/M0I2Jj89sh5N5wCkkkquy8i0OwQvD46SvZ944jYgSIjkSl01ex49HR9o81kkGushw=
X-Gm-Gg: ASbGncvSUkBzS9FLKPPFZFXaMjIWr5IQ6nXNZzzXfcGkin7T0CQfRmKtlexN8Ikbnux
 UtBINCwH1yVE+0XDTaLjTYyxK2n2A+O8UXdNIzH/H+mRe3oS4QsYem1x0fwZ4VWM98QmAXFSW2m
 5zLp/a3NssmQwMTL1hnBjHtBn4HeBNAeoiuzRdeCqk2GkF9FTnxmYFJLdSY7DTxkE/6hF9AMSCw
 nDHpCSAgwX8aIQXIMg8rS5DXlqGLiI+eTOWH6j4rKu2a5ldJrGL85r0iaTTYgRYTMP7q/yohtm2
 VuYSlyKqjAcQmjPax+eM1DfO4wghqB9Wz/xmHIdXG6SffJ+SatijoUo5IReJuocs8uGyUSqD1PS
 jy/dYu0UTjJ/KdFcSkSQovv7GODpD4CPRc3acpcDVNg==
X-Received: by 2002:a17:903:3b87:b0:295:565b:c691 with SMTP id
 d9443c01a7336-29baaf75d56mr164236985ad.17.1764326079665; 
 Fri, 28 Nov 2025 02:34:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFQsu550Gf8bRhwbobshsjKneIYUQA5FyjtpAtmmp+z1D8G7bxKdB2r9mHvhM84fy3g652XSw==
X-Received: by 2002:a17:903:3b87:b0:295:565b:c691 with SMTP id
 d9443c01a7336-29baaf75d56mr164236655ad.17.1764326079120; 
 Fri, 28 Nov 2025 02:34:39 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29bce40b993sm43098195ad.14.2025.11.28.02.34.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Nov 2025 02:34:38 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de,
 dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v2 2/2] misc: fastrpc: Support mapping userspace-allocated
 buffers
Date: Fri, 28 Nov 2025 16:04:28 +0530
Message-Id: <20251128103428.1119696-3-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251128103428.1119696-1-ekansh.gupta@oss.qualcomm.com>
References: <20251128103428.1119696-1-ekansh.gupta@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: wHzv6mbV-O5SsEjtsKUq_ZHWVXVBjuzP
X-Authority-Analysis: v=2.4 cv=O8k0fR9W c=1 sm=1 tr=0 ts=69297ac0 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=9b90K331daA_tkPLntcA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDA3NiBTYWx0ZWRfX825r7fqU8n4Z
 /k/BrqRlYpGqHLrxItOeNLpQQhI4C/I+IytMr/3g87u1VdUOEeLRikRPDqQkB0xfeQn71NHk3P1
 WFvBQo1Hf81/MjJTkb/A7yysvfXFS63n3xLM317rA/LxfvTxHFd4jJqGvCmWrYOjvtn9jklxnoG
 CBNR2zjzlJsxTk8EtjVBN4ooKdM90IdgP9nAsd2oPndSDk5yDLhyYcsi3i52ujXL0l39qQ8S9hV
 sJ+jCzAHCnBaBW7EDv3rpXdOEP/r1y824ci9lPdnIhKIJopjRsFHwCA5VDMghaYHn5rSPJ7CkW2
 3zdT0ilNN9uOlMnVJWWjolCVeNCKzqBEF+hmVT8sSVmxBWcmLIAGq0ndMGpY1tBuvWFuLsHBGBv
 rEV7bAMMQ2SHAJ6bHkDrerhPEoDVCA==
X-Proofpoint-GUID: wHzv6mbV-O5SsEjtsKUq_ZHWVXVBjuzP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_03,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280076
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

Currently, FastRPC only supports mapping buffers allocated by the
kernel. This limits flexibility for applications that allocate memory
in userspace using rpcmem or DMABUF and need to share it with the DSP.
Add support for mapping and unmapping userspace-allocated buffers to
the DSP through SMMU. This includes handling map requests for rpcmem
and DMABUF-backed memory and providing corresponding unmap
functionality.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 96 +++++++++++++++++++++++++++++++++++++-----
 1 file changed, 85 insertions(+), 11 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 9bf76e224852..feba79913763 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -1854,8 +1854,10 @@ static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *
 static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
 {
 	struct fastrpc_buf *buf = NULL, *iter, *b;
+	struct fastrpc_map *map = NULL, *iterm, *m;
 	struct fastrpc_req_munmap req;
 	struct device *dev = fl->sctx->dev;
+	int err;
 
 	if (copy_from_user(&req, argp, sizeof(req)))
 		return -EFAULT;
@@ -1869,13 +1871,41 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
 	}
 	spin_unlock(&fl->lock);
 
-	if (!buf) {
-		dev_err(dev, "mmap\t\tpt 0x%09llx [len 0x%08llx] not in list\n",
+	if (buf) {
+		err = fastrpc_req_munmap_impl(fl, buf);
+		if (err) {
+			spin_lock(&fl->lock);
+			list_add_tail(&buf->node, &fl->mmaps);
+			spin_unlock(&fl->lock);
+		}
+		return err;
+	}
+
+	spin_lock(&fl->lock);
+	list_for_each_entry_safe(iterm, m, &fl->maps, node) {
+		if (iterm->raddr == req.vaddrout) {
+			map = iterm;
+			list_del(&iterm->node);
+			break;
+		}
+	}
+	spin_unlock(&fl->lock);
+	if (!map) {
+		dev_dbg(dev, "buffer/map not found addr 0x%09llx, len 0x%08llx\n",
 			req.vaddrout, req.size);
 		return -EINVAL;
 	}
 
-	return fastrpc_req_munmap_impl(fl, buf);
+	err = fastrpc_req_munmap_dsp(fl, map->raddr, map->size);
+	if (err) {
+		dev_dbg(dev, "unmmap\tpt fd = %d, 0x%09llx error\n",  map->fd, map->raddr);
+		spin_lock(&fl->lock);
+		list_add_tail(&map->node, &fl->maps);
+		spin_unlock(&fl->lock);
+	} else {
+		fastrpc_map_put(map);
+	}
+	return err;
 }
 
 static int fastrpc_req_map_dsp(struct fastrpc_user *fl, u64 phys,
@@ -1989,25 +2019,69 @@ static int fastrpc_req_buf_alloc(struct fastrpc_user *fl,
 	return err;
 }
 
-static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
+static int fastrpc_req_map_create(struct fastrpc_user *fl,
+				  struct fastrpc_req_mmap req,
+				  char __user *argp)
 {
-	struct fastrpc_req_mmap req;
+	struct fastrpc_map *map = NULL;
+	struct device *dev = fl->sctx->dev;
+	u64 raddr = 0;
 	int err;
 
-	if (copy_from_user(&req, argp, sizeof(req)))
-		return -EFAULT;
+	err = fastrpc_map_create(fl, req.fd, req.size, 0, &map);
+	if (err) {
+		dev_err(dev, "failed to map buffer, fd = %d\n", req.fd);
+		return err;
+	}
 
-	if (req.flags != ADSP_MMAP_ADD_PAGES && req.flags != ADSP_MMAP_REMOTE_HEAP_ADDR) {
-		dev_err(fl->sctx->dev, "flag not supported 0x%x\n", req.flags);
+	err = fastrpc_req_map_dsp(fl, map->phys, map->size, req.flags,
+				  req.vaddrin, &raddr);
+	if (err)
+		goto err_invoke;
 
-		return -EINVAL;
+	/* update the buffer to be able to deallocate the memory on the DSP */
+	map->raddr = (u64)raddr;
+
+	/* let the client know the address to use */
+	req.vaddrout = raddr;
+	dev_dbg(dev, "mmap\t\tpt 0x%09llx OK [len 0x%08llx]\n",
+		map->raddr, map->size);
+
+	if (copy_to_user((void __user *)argp, &req, sizeof(req))) {
+		err = -EFAULT;
+		goto err_copy;
 	}
 
-	err = fastrpc_req_buf_alloc(fl, req, argp);
+	return 0;
+err_copy:
+	fastrpc_req_munmap_dsp(fl, map->raddr, map->size);
+err_invoke:
+	fastrpc_map_put(map);
 
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
+	if ((req.flags == ADSP_MMAP_ADD_PAGES ||
+	     req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR)) {
+		err = fastrpc_req_buf_alloc(fl, req, argp);
+		if (err)
+			return err;
+	} else {
+		err = fastrpc_req_map_create(fl, req, argp);
+		if (err)
+			return err;
+	}
+	return 0;
+}
+
 static int fastrpc_req_mem_unmap_impl(struct fastrpc_user *fl, struct fastrpc_mem_unmap *req)
 {
 	struct fastrpc_invoke_args args[1] = { [0] = { 0 } };
-- 
2.34.1

