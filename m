Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 678CBAB4A85
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 06:28:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C75EB10E4E5;
	Tue, 13 May 2025 04:28:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LycLwXlt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19D4D10E4DD
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 04:28:45 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54D3KVFe023403
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 04:28:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=W6GAILZe1jq
 2FdYPLrjjokTUXGgsX3z5BCNlHC9cgZU=; b=LycLwXlt7RoCmNdFiYWyOvk/9/U
 hkFK/hXQ+w36NMnBW3d1QMc26PrmtSz01Eey4sN5jZck4qRvLu8ECoUcUPqRJRMI
 itULNwyPdkLVrwgLJFGSVnl/gBq8LqGFzNbb8MfBA0jIKwEDFYF3IcOc9ucy0T9f
 AOw8Oo/uD+/5oELDmC1uXN4dPv5J2YSt6pgiO/4HCssP6u4mnbFzEws1XveLyws3
 gwDICGWS9pFhp/fzoXF2+/kTyVbp+1P3qnJ4ug58T+5gPnQbF0c4Oit9EtgJSvlr
 T4KPg/kklSbM2wBgJ3ktk9Ku2twY+EoQZpktb5V8Dld+NXx0l5henjbXuow==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46kcfejwfe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 04:28:44 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b2431e45064so4404509a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 21:28:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747110523; x=1747715323;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W6GAILZe1jq2FdYPLrjjokTUXGgsX3z5BCNlHC9cgZU=;
 b=K4CImUjLCKQzqQRa30zfMKJZW2HaneCZKcyCaip0iUreLaMZfcEuaQuFBDbzi3WVqq
 VX0bnYSjtXT1JXDtdkraUkHu628EU4Z9E2J4rYB4qzVqb7iRoRX9Yk5bgdfDeU+zdvRt
 ADY4/YxDYKSWs6IX0QzrU+G2IW5NW5eizdw4wiwV9EnPQPLtIRiG2AmIiNmjy6tJ9EHQ
 Fx4gnaoVhZCx6kHSN+moQm94Deo7VBZytOqBZXsvX3Gqo0IU1wguSi94Nr9TqhN3qI7A
 m+F5TwJiGZVnCz1vqUvP2bKASxuFio93kqErfpg96JGOqn/cEc/mhAXfhie6P7H6IZpO
 rZEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUi5j+svyFuw8fsXySG4q7ZjO41X1d0SzrodwZWbV62/IBEGjZQyHFZbDScKXfrXx7tea/2LJFcCpI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxfhOlvU24CDTtX7icNNNMY1sHO6xKiQsdImTSG5rSjHtKfzAh5
 FiRuapjUzJYCYCUw4w4MUmKrg4kFxzUDnOnlP6o82c1xWGp1OwReqnA/xZMStuAPeC3IkBzPIhV
 flk5yCpl6As1Da4wfTKX7NdM4wFLORBp4e96GEcwCMIp70Q7U2g7F7r0IubbcfY8xCVI=
X-Gm-Gg: ASbGncsEJIjiKnIqtHpvJoWOqHWE7tecRG0ftcbnhx8eQJqk71PzO2PcCNpVaQIfdEd
 Yb6sYKzrq62eNkQ6azUB8eUKLsdzDjhWVVr3M6/cdvrIcHs/MxTa3+fILqMLQ01e4ta4lsxlbY/
 424a6ZK4pKgTwrGjdLYGPERaBuWHxqILLtFVyp9F8+mYO6rzrLCCthZyXIW44Gy5Gi1r0pJWd1G
 p0CXj6flAhY88SL8lpJ8rqNKa/WXfTKx/8n4lc5WcJukRmzBakOhlOqhxHmtjoJooL4fHXsBSWI
 GkFZukQG+Suj0b3wEiMbVwU73pIlTD7WMCmdPQOrgMDw
X-Received: by 2002:a05:6a20:1124:b0:215:d565:3026 with SMTP id
 adf61e73a8af0-215d5653229mr6842189637.20.1747110522840; 
 Mon, 12 May 2025 21:28:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4+gbSS6s7qSuU5YmGTKTsPTB3m3lJGYEwqEPy9irPtLLKsH0Ru/ril7XSm2s95m5IamjdpQ==
X-Received: by 2002:a05:6a20:1124:b0:215:d565:3026 with SMTP id
 adf61e73a8af0-215d5653229mr6842165637.20.1747110522505; 
 Mon, 12 May 2025 21:28:42 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b234ad3e9f1sm5486101a12.35.2025.05.12.21.28.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 May 2025 21:28:42 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
Subject: [PATCH v1 4/5] misc: fastrpc: Remove buffer from list prior to unmap
 operation
Date: Tue, 13 May 2025 09:58:24 +0530
Message-Id: <20250513042825.2147985-5-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDAzOSBTYWx0ZWRfX7F6+xUjOgjc2
 wsgs1R9w7SoB1lD1dcJqZtkQCUsCrjtijbwH9ulYUk0RlTjpnnG56yQSVGkpJ6lkZ3GWcRHVDfk
 ejI5HDM4uaTUo3n6bU0Tgda2JltsX3A864GrGU5RDP+NDDkS3gOJMuB5uGyyMCcIasFM5Tfxl+2
 6/2jDABVOIhmQ1PWwRj7daodVjbtImF/XD6TIQW3e4R/FQTwNBe4CruBqzuqIuG8nYcHaW3d2lI
 xPAeUQVYDQrxvz3aT0MNvzpL7+nADy1nCE+itqnMqFmpGo9Kdky/jG/ORRIfpTg4lOg41otTmgB
 qeHVlP6GrvTCYQlFKoZcfh5rVv7Br9le1liVxfvLM8xPkurDaaWvkHWFc8e1zeRXcCAyc6E5gSz
 ndE0z0a14JPbHxSYHH4LbvY8CvILjU91dEjg1YYP6owIxj/tPEBrEO76L5i7P6EwbhpXDlQ3
X-Proofpoint-ORIG-GUID: sw_VlLXdxma5F1Rs_AgSxOlSOdKcL_9n
X-Authority-Analysis: v=2.4 cv=asuyCTZV c=1 sm=1 tr=0 ts=6822ca7c cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=BnVeGx0dmUjw97O46OEA:9
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: sw_VlLXdxma5F1Rs_AgSxOlSOdKcL_9n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_07,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 impostorscore=0 malwarescore=0 mlxlogscore=999
 adultscore=0 phishscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505130039
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

fastrpc_req_munmap_impl() is called to unmap any buffer. The buffer is
getting removed from the list after it is unmapped from DSP. This can
create potential race conditions if any other thread removes the entry
from list while unmap operation is ongoing. Remove the entry before
calling unmap operation.

Fixes: 2419e55e532de ("misc: fastrpc: add mmap/unmap support")
Cc: stable@kernel.org
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index b629e24f00bc..d54368bf8c5c 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -1868,9 +1868,6 @@ static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *
 				      &args[0]);
 	if (!err) {
 		dev_dbg(dev, "unmmap\tpt 0x%09lx OK\n", buf->raddr);
-		spin_lock(&fl->lock);
-		list_del(&buf->node);
-		spin_unlock(&fl->lock);
 		fastrpc_buf_free(buf);
 	} else {
 		dev_err(dev, "unmmap\tpt 0x%09lx ERROR\n", buf->raddr);
@@ -1884,13 +1881,15 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
 	struct fastrpc_buf *buf = NULL, *iter, *b;
 	struct fastrpc_req_munmap req;
 	struct device *dev = fl->sctx->dev;
+	int err;
 
 	if (copy_from_user(&req, argp, sizeof(req)))
 		return -EFAULT;
 
 	spin_lock(&fl->lock);
 	list_for_each_entry_safe(iter, b, &fl->mmaps, node) {
-		if ((iter->raddr == req.vaddrout) && (iter->size == req.size)) {
+		if (iter->raddr == req.vaddrout && iter->size == req.size) {
+			list_del(&iter->node);
 			buf = iter;
 			break;
 		}
@@ -1903,7 +1902,14 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
 		return -EINVAL;
 	}
 
-	return fastrpc_req_munmap_impl(fl, buf);
+	err = fastrpc_req_munmap_impl(fl, buf);
+	if (err) {
+		spin_lock(&fl->lock);
+		list_add_tail(&buf->node, &fl->mmaps);
+		spin_unlock(&fl->lock);
+	}
+
+	return err;
 }
 
 static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
@@ -1997,14 +2003,23 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
 
 	if (copy_to_user((void __user *)argp, &req, sizeof(req))) {
 		err = -EFAULT;
-		goto err_assign;
+		goto err_copy;
 	}
 
 	dev_dbg(dev, "mmap\t\tpt 0x%09lx OK [len 0x%08llx]\n",
 		buf->raddr, buf->size);
 
 	return 0;
-
+err_copy:
+	if (req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR) {
+		spin_lock_irqsave(&fl->cctx->lock, flags);
+		list_del(&buf->node);
+		spin_unlock_irqrestore(&fl->cctx->lock, flags);
+	} else {
+		spin_lock(&fl->lock);
+		list_del(&buf->node);
+		spin_unlock(&fl->lock);
+	}
 err_assign:
 	fastrpc_req_munmap_impl(fl, buf);
 
-- 
2.34.1

