Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B37ACE97DD
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 12:02:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6C8F10E63D;
	Tue, 30 Dec 2025 11:02:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kgfVR2nk";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cf8jt5ZW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8898B10E72F
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 11:02:39 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BU3jbfc3555789
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 11:02:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=uZ7b55cvQjq
 GpVCER9aO23V8m+uhwWqcKo+IPNZIPA8=; b=kgfVR2nkirmq64dlE3pnaxzpPnq
 RpZdbyS+US0wzqfuYlw2iS/bSAIuwhLQyn3QIoZFSmhOJzjWvyvosfUIDZY/E6UQ
 jM3mH0Vtzh26u6lgThbM3oewzj1oZ6YDd9plpej129x1JwuMJzj758a+AB93bREN
 cOG+h26/ip8kHSgwFDThXPPdJtTPKp7kPESajMptS4ILuis1/NSyztS6jmuvcULS
 BZtA8EIq2zVjYf0KyIrtIUVnX0z1sbMdxkruJA4/NRff4RlYKxkKxcUrSYWeSZvh
 ZWrGZ5eLTIbQMoEHFqSBVttHoboNZs3JuK7dnJDqQZ4PUXCVCB51Q+9BXlA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc7460x1p-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 11:02:38 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-34ab459c051so24484446a91.0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 03:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767092557; x=1767697357;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uZ7b55cvQjqGpVCER9aO23V8m+uhwWqcKo+IPNZIPA8=;
 b=cf8jt5ZWDP3pA3Zuof12KN+OGlhPJSrO5yn14W95JacL0jHS6yoABGr0rcPFXWCoVz
 uSFmA//b7ANwJ5fQsb/pNG6VkxHOuMcXZJ3Iws+HdbxE8G8c4CLfEaSzoqYuqLZpw4lb
 ElAzfzRXSjgsX+acBbCDDmi5uhKtAqAnVNCfE90KpcuuzlBpFjpF4ddTNYl5FWdbA30Q
 vU/BvYjarB5xHvy59CRptE2Yxd/pj4FrnxuqFxANGCgh+AMKoGxhrDWblnZMNHxAzC04
 L0kFNFGqAT57sxh5weKacBorthsKePIGo+plR4+xDG7SA2MV/sJQlBJGzxuvZvQ1MotC
 8ADg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767092557; x=1767697357;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=uZ7b55cvQjqGpVCER9aO23V8m+uhwWqcKo+IPNZIPA8=;
 b=okkMmEiSH1a+aueGN/R9AYgAKfwNxoLc9qltlo7Bc27nQN8Xmr1A4Xju5mvw1pdqzj
 DvafV2pFsHl0bgX7weAMgEV5y6alCrJ7e9awESl/U/zV6OVw2TwB5PznFUymJT8vRj67
 rRXhAeU8JYWuzhpl4jxtrDWpIIgdci7VJlNry6pA5A/rjISljYl6TfEDBnPTbZ80dqZM
 TS/IufaS97zwBUukl4dJSFuQKjukWxUNP5qKX/1Wyz21AxUaMF7sw33ofFkmXx5TCbdf
 1F/beIOHDtQsqmL2nIJzrFDLaxW6G6rT8P1X40JiQnoZVfGYVJm3HQO0zIot3KnZzo9c
 z5vA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnNPvlua7F+HbZsKVnikNs8L8umkTDBys80rJi/bl+I4OZrSZHMi/CWd0Q2xDbRdofVEcLFejwDpw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzToBfDCcHTPLuNRLuD7n81yBDRjI43BcghMc+nEGL3qVnpWPoK
 XQbODrurcacvUuYtpfe01zIhwt1/Qrp4lvB3oNP5MPd3EfDYnyZEP5bOzehiNRK8PLFcEPvkN5B
 CuQjYyRLq4SCarZXeXDES8qY3D/Hso8pgvo6xJQmP449R0JbSrrPyILjuhEKMlL2RmwB82T4=
X-Gm-Gg: AY/fxX5whReLxbsDtHh1/f+r1lMWaSKmu3uDIRn9ujNUkqtVeyIaghc8vtno00H6o18
 YPtiVGNe5IkqaPcf44/YBPpuYrdDiv4tf7IR2NkfUpjlm3DewggXVNAjtXEjW1CnvmI4LCsruif
 rTih43SfBo6kBlG10/NhybFuY3AjvDiyXuHGw1AJc01ZdYLZEsmv0+cOIAwSmf+e+DfxnHy0Ae9
 +JDWqvqtyVB8EJ5vO71/bb+pJu2sizcAztr55gvdW5cD0uY7N9TckPzZlQljV5i/11DU9oXWUVa
 xCTn1T2PYkSoNAIudW3fUcG2wHz19lZyJPeLJZUTtoz71rr8GHx0qLmshA5MMIrUmytrVQl8HKs
 t7/ZTQvWdLzfnIV54o5XtyHkb8WGV963hNYvDPu8LhA==
X-Received: by 2002:a05:6a20:6a09:b0:371:d67d:e56a with SMTP id
 adf61e73a8af0-376a9ae2989mr33085231637.57.1767092557414; 
 Tue, 30 Dec 2025 03:02:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG1CkBNPOEDBq7uLze8A3MeLEdvhLojl1SQfevGINRj4fuvJbn/fzelF4LuaAuwutBx4iWerw==
X-Received: by 2002:a05:6a20:6a09:b0:371:d67d:e56a with SMTP id
 adf61e73a8af0-376a9ae2989mr33085211637.57.1767092556872; 
 Tue, 30 Dec 2025 03:02:36 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c3a4deb6f17sm2556908a12.22.2025.12.30.03.02.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Dec 2025 03:02:36 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de,
 dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v3 2/3] misc: fastrpc: Refactor mmap and munmap logic into
 helper functions
Date: Tue, 30 Dec 2025 16:32:24 +0530
Message-Id: <20251230110225.3655707-3-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251230110225.3655707-1-ekansh.gupta@oss.qualcomm.com>
References: <20251230110225.3655707-1-ekansh.gupta@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Do9bOW/+ c=1 sm=1 tr=0 ts=6953b14e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=04dbU8GgqVRi9gjLVHMA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: IcOZv7qQVovPxF2USPc81Pl8evU29osQ
X-Proofpoint-ORIG-GUID: IcOZv7qQVovPxF2USPc81Pl8evU29osQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDA5OSBTYWx0ZWRfX1mvFe4Yik8hm
 RvxZVK4OHMt75ybajbI23jpsFL1LttgEinY3HsYP0NKc+Lku7VXX9arDKOK0zOjgB75+TedAUwS
 Qrp+NIPDgJIxbO8+IqB9AAnmZXVeyVuAZlthHp8v720TuUTn/rtwMhlZmMvEz6WO44JeIbH3RbZ
 thZv2/mVi4URe8pcK2rdpXoWGnRHQrtou+joNh33u3N/emFGDLlLjq7+d6ukemFDb8Mdsi9Nsnt
 5FcaEJ6AHfE1zVwGys+/DJ9pjfFmjUbkaE/xLIH97JIan3hzJHIfp9IPmz4yKSt3znamyc/Euis
 okwDlHIZgKtSWkOCUH83prZ1DwUUmIiwIhx28E8HONggBnylwktY7iGOmwIqkiwLfdvKY5rE6/X
 pO7kzmB8J0DBbPMVv+R9df1GrYmOJCR2zOEBEs0WAb2wEFGAaXwOwCYIiYculX0ZcbIs5KKh6LE
 k0cDxnSrkQHjlvB+jjQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_07,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 bulkscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300099
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
index 408fe47e9db7..24064efe5dd8 100644
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
+	args[0].ptr = (u64)(unsigned long)&req_msg;
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
 		dev_dbg(dev, "unmap OK: raddr=%p\n", (void *)(unsigned long)buf->raddr);
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
+	args[0].ptr = (u64)(unsigned long)&req_msg;
+	args[0].length = sizeof(req_msg);
 
-		return -EINVAL;
+	pages.addr = phys;
+	pages.size = size;
+
+	args[1].ptr = (u64)(unsigned long)&pages;
+	args[1].length = sizeof(pages);
+
+	args[2].ptr = (u64)(unsigned long)&rsp_msg;
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

