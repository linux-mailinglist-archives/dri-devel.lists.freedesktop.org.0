Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5895AF8BF3
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 10:37:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CA7610E987;
	Fri,  4 Jul 2025 08:37:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RwmFv/Vr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CCDE10E987
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jul 2025 08:37:34 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56472PuS032116
 for <dri-devel@lists.freedesktop.org>; Fri, 4 Jul 2025 08:37:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=9mrH41Ue8HyV4g5LafeSKPRlgP+xtMSl2/W
 8spQJ1nw=; b=RwmFv/VrOxDWn/9MRZIwYu2i7s7JbsPFrYfxgkX483a2R4uF6m5
 dfpHEwoCR4SR68gRSkioB/IKfp4DebLK9N6/mZACFJ+VkTrxxXSrOocH1n2s32ya
 87/Fy6x4UJQl1P3XCXODeCtRYzwAYeqiRqqZOhSPMSSx9Zk1FqeT7rnIk6d7Qu2T
 Tx3leLTalQ4tZCA0ueqyZD8bjV7U/wN7Wbi1Al4ibzvIeuqssUIfW/ShusNnmATv
 JybGjLkhOMXBx4dpRx3zwCXP2UPtI1voJtpT0pngxMwQdI6ibfcXTV0S4cse8jbX
 3AiuZJLv/eIg+T9x718xyfRdnlxHwx9u0dA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j63kkfvp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Jul 2025 08:37:33 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-740774348f6so712103b3a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Jul 2025 01:37:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751618252; x=1752223052;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9mrH41Ue8HyV4g5LafeSKPRlgP+xtMSl2/W8spQJ1nw=;
 b=btcZJDMFyBmmpe13OgCpK9cRmSeT6OrkCWPii2Sek4b3cJg8zRkdrb9uCM0SkVYrZH
 JuJTT3LVbXvV9vNReR7nmukZt+rTIqUuHcilGm5uOYswfFN1uZMgX3K9rhBfj5/RuRxH
 V9lPg1/LlV5nKhqM93jtZBsqYcrqam+/EDZzRh4TWu7tlD9yhM5ojxUoptFSDghsJubB
 sjBzCpJ8TwTifJPMV31CVuPfDwLU7xgbWvaU0sOfh7wHyTMg79OxtxsDvhXSYE2azGQk
 sE1LTTPp9OWZG6eUzWAW6fDjY1qtTapa9EWlX3uG1mZk8F0tZyT1l9XqQt7p7KaoqKGi
 2d5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkkMR/5WPQTR3bEzRPdsZES0HAcDaxT1TMH8J6HHyCF0HN/+wqsZs9d5GR6sW7UVrEMqrS6i9r104=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyzxWp0bobbdFMOdkyRywJbFa3rSdhRpozs1bTasgyqAZkzz3ur
 RPKs1actEQRMiWGUGW4rXjLZxZp4pSl47WEEEe4gTy4G+00D0HNp1MdY5yZ7so3SLr/0v1/3X1k
 +WkLXFb2yzBUpTQYsqLVxKaYbKDWuRHFKnQomjzIlLSG8nluLQRDWVRR505PYX9ujMwZS5fY=
X-Gm-Gg: ASbGncvWTn4elh+eQ8OkyXb9CWfpfvAQQB1YmpxBSvr3BqQYqKOeoET8NkGGfG0NSaG
 leAXkb2uph5pmR4s6D60M3pVg60K+1QiYDvDPj2MIS2CdJsylhwKrI1rlsA4wO5FeLQMDMnx5E/
 fZ7ldjCbTzg2I8R/5e27yA5JMJUVjtQit0yQ6PmpCLFlIi32h8NT7AW4uaV2Zhoyx4xuXlEseMf
 EB36K87UzXs4jYJObBBsI6zBe7dkDKSuQ4pTPd6/6KCm29scdgJi9oZ4EtbHJHYb739FPCoo5kT
 T/WZBJNK5frg8r3xhWMNE5cOmvqJDa6RnikrQWbQFK175QFTbkddpfU=
X-Received: by 2002:a05:6a20:729a:b0:201:2834:6c62 with SMTP id
 adf61e73a8af0-225c07dfa94mr3176305637.25.1751618252189; 
 Fri, 04 Jul 2025 01:37:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0wtR64pukP0DCbAn0UqUe6kuH+yno3K+Yfn3NeYIHerc5XDeRwKrBM9aqYfHqvE/NWPkUHQ==
X-Received: by 2002:a05:6a20:729a:b0:201:2834:6c62 with SMTP id
 adf61e73a8af0-225c07dfa94mr3176276637.25.1751618251747; 
 Fri, 04 Jul 2025 01:37:31 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b38f060165csm1281630a12.10.2025.07.04.01.37.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 01:37:31 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de,
 dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v1] misc: fastrpc: Add support for userspace allocated buffers
Date: Fri,  4 Jul 2025 14:07:26 +0530
Message-Id: <20250704083726.1901705-1-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ZKfXmW7b c=1 sm=1 tr=0 ts=686792cd cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=cATS2htxDwLtVxRmqX8A:9
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA2NiBTYWx0ZWRfX+f+vkg7+1vFG
 1/iTPWyMvZN3ZJU8By//o8+QNIyoI15SOCiGE1/zmc70lB6d/PsrU6tVvAdOw8ire51hUduBEM4
 3+9r6emhiTqZQY8Fg6mZvduFDCHWxtMXsjz/CnMHoC7M6Czf7ziozPM488V3D5TK6nhlFGH/9yp
 8f5ADW/PNIw505XFPOcLtI+JLmy4kvqYAsQiW5dLKxjnPJHt1qbEO5sWgHOx4hQ4OOprr804AzG
 csFMTyekdPWiD7Z1rTYaa6Hvbd0zOhG0J2Yc9CQxrjsBouJXVEkMFXhJDiuJzBbUESW7NDVYtSs
 ZIwYsMcIaG7U3gi42lez0Qd/NYmV2LdVFgxFDrByYODWfi2+4HU9AobFMBaEnhdFBFRlQg/qCT/
 3HbUzCLXgx1aOZqMAej0nYNYnuL/ckZJtiRaNIytkNAnNMSdBYk7c8yiKe87cewNCwOUU00I
X-Proofpoint-ORIG-GUID: 6a5geRyOH-0LJVkxhlY6S5FnGynyb8xh
X-Proofpoint-GUID: 6a5geRyOH-0LJVkxhlY6S5FnGynyb8xh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507040066
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

Support mapping userspace allocated buffers. If userspace allocates a
buffer using rpcmem or DMABUF and sends it via a map request, fastrpc
will map it to SMMU and DSP. Add support for both map and unmap
requests.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 188 ++++++++++++++++++++++++++++++++---------
 1 file changed, 150 insertions(+), 38 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 378923594f02..3c88c8e9ba51 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -1797,17 +1797,16 @@ static int fastrpc_get_dsp_info(struct fastrpc_user *fl, char __user *argp)
 	return 0;
 }
 
-static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *buf)
+static int fastrpc_req_munmap_dsp(struct fastrpc_user *fl, uintptr_t raddr, u64 size)
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
 
 	args[0].ptr = (u64) (uintptr_t) &req_msg;
 	args[0].length = sizeof(req_msg);
@@ -1815,6 +1814,16 @@ static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *
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
@@ -1831,8 +1840,10 @@ static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *
 static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
 {
 	struct fastrpc_buf *buf = NULL, *iter, *b;
+	struct fastrpc_map *map = NULL, *iterm, *m;
 	struct fastrpc_req_munmap req;
 	struct device *dev = fl->sctx->dev;
+	int err;
 
 	if (copy_from_user(&req, argp, sizeof(req)))
 		return -EFAULT;
@@ -1846,35 +1857,91 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
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
 
-static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
+static int fastrpc_req_map_dsp(struct fastrpc_user *fl, u64 phys,
+			       u64 size, u32 flag, uintptr_t vaddrin,
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
+	args[0].ptr = (u64)(uintptr_t)&req_msg;
+	args[0].length = sizeof(req_msg);
 
-		return -EINVAL;
+	pages.addr = phys;
+	pages.size = size;
+
+	args[1].ptr = (u64)(uintptr_t)&pages;
+	args[1].length = sizeof(pages);
+
+	args[2].ptr = (u64)(uintptr_t)&rsp_msg;
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
@@ -1891,26 +1958,8 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
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
@@ -1918,10 +1967,10 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
 	}
 
 	/* update the buffer to be able to deallocate the memory on the DSP */
-	buf->raddr = (uintptr_t) rsp_msg.vaddr;
+	buf->raddr = (uintptr_t)raddr;
 
 	/* let the client know the address to use */
-	req.vaddrout = rsp_msg.vaddr;
+	req.vaddrout = raddr;
 
 	/* Add memory to static PD pool, protection thru hypervisor */
 	if (req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR && fl->cctx->vmcount) {
@@ -1956,6 +2005,69 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
 	return err;
 }
 
+static int fastrpc_req_map_create(struct fastrpc_user *fl,
+				  struct fastrpc_req_mmap req,
+				  char __user *argp)
+{
+	struct fastrpc_map *map = NULL;
+	struct device *dev = fl->sctx->dev;
+	u64 raddr = 0;
+	int err;
+
+	err = fastrpc_map_create(fl, req.fd, req.size, 0, &map);
+	if (err) {
+		dev_err(dev, "failed to map buffer, fd = %d\n", req.fd);
+		return err;
+	}
+
+	err = fastrpc_req_map_dsp(fl, map->phys, map->size, req.flags,
+				  req.vaddrin, &raddr);
+	if (err)
+		goto err_invoke;
+
+	/* update the buffer to be able to deallocate the memory on the DSP */
+	map->raddr = (uintptr_t)raddr;
+
+	/* let the client know the address to use */
+	req.vaddrout = raddr;
+	dev_dbg(dev, "mmap\t\tpt 0x%09llx OK [len 0x%08llx]\n",
+		map->raddr, map->size);
+
+	if (copy_to_user((void __user *)argp, &req, sizeof(req))) {
+		err = -EFAULT;
+		goto err_copy;
+	}
+
+	return 0;
+err_copy:
+	fastrpc_req_munmap_dsp(fl, map->raddr, map->size);
+err_invoke:
+	fastrpc_map_put(map);
+
+	return err;
+}
+
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

