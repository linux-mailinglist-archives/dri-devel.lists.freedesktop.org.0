Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E988AB4A87
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 06:28:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B258210E4DD;
	Tue, 13 May 2025 04:28:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="clTGICtS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB52810E4E1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 04:28:48 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54CJY29a013136
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 04:28:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=qholBjkmu03
 FdHRvMAFEHiCnlryUcq+WCE0WsE9Lw7w=; b=clTGICtSj2YYasarQEdnigsEtQN
 1UT8M62U46N245c09+C/51ctES6Tg3128eZijR98FSW6063mS6gmg3vWCExn5jA1
 HxHOEDjuuM+RpI73EOuZ5Jbkessxk/V197ZAxaaimVcSSnHcgRyVPrQjuPzEbc6d
 FkihbXrK7v4FwHkFrFBrJwSlDbJZMCA7v2qih512O8V318lh3vOp5OGriOtC3/vE
 OA4OJsaUAktMv4vKFFcfk2bGiNSAbWqRC/KU2vKKDWyWq25hA8DuWsA0L8PMsilp
 36TYkTHCsHglJrnm037fNcxKru69Pz2enzw936vvkW3gl/WVLeYMHtsubyA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46hx4k6e4f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 04:28:47 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-30a96aca21eso5279239a91.2
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 21:28:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747110526; x=1747715326;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qholBjkmu03FdHRvMAFEHiCnlryUcq+WCE0WsE9Lw7w=;
 b=QOaYhkvs59s9nowpcVzh6zpCUF71wAwH6It9jIWzZz9urYeBbTj+WBD7kZ+2tmGPfr
 m99IrYpbrfbjlgAVPt2jV2H1XlVrgit+cr1a3XHUEdcKFb1MCwovyxo6BjlVduhvh6bd
 La379JZylfmgtw/DJKol0hybsxIM3ZiFOk1Q5Msn4yiMcKhnr9FEXMqZUfykZawwtGdO
 GXgMzzpgOBb+88JGsWPPwuCARYs3xBk1GTZBOy37hcBfhffGdMU5ivT4bQX7fvDVsl5v
 Md6mgOc+cGuRhOXcV1t0/YxvkoVwHpHLPIzK3jN0l1aY5l7fISZPNk5Ud1Z1dzKa0MvJ
 Svaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFTIv8iWa5pPIw7THRPpbOdOsNOgD06+rht7NCrVeADGR33Kdx41oQ1aDehv7H8DWzjW0ijOzQOz4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxDRGBWH/jhs/sVw5RGobeB+vIlEOmUlGOt5LWMZ3orJjVCb1Lf
 MTMbpcBk8WByF6T7jLKHK6CpYbEkv46iKy+zV++NVnQW+/u5tzR6erCwswLiXbvtXYAm7bY+H7L
 lDS07zADIXMnA0o7RtBE4GNrJopq5h3wRuZIK3c2STjnLTH1JuWjWJoZxgT/Cq/HWPlQ=
X-Gm-Gg: ASbGncsyYXHXNraKpfL/0lHicqDfMtqnsXqNfu49AibJoH5gCXXXmjxjACvEasMdyTC
 jWrFrJ+ruwijqdWtjtrEjoKaEomCWFtLZCbsjAhcDvAPTCDRzsIgq8fpCS7NwH2xxdkmdaPGtFd
 hXVxhF7A2WQZI2DsesuBIHQqy5a/fZAh3VRwrGCR89X1AkmchrtkqyS9j8SfWJD0aZvuRVimciv
 yy5iHowyEiWNUekT8/CxY6AWAktAr9NO4El4ofGcax0iPF1GfqzUTa9iszOdud2ZDtPCYhaliPa
 2I7PZOzUC2WE8/zHaOHQkWhMUMqhEyuvPJonV3RoM/vo
X-Received: by 2002:a17:90b:4b4b:b0:308:6d7a:5d30 with SMTP id
 98e67ed59e1d1-30c3d3e0a86mr27034339a91.18.1747110526298; 
 Mon, 12 May 2025 21:28:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6dBAWDLUjqJ4kvsD4zVoy0B09Mb6RcQq2ArhYi6gGrcPHxd8tFxTtMMDWjf6AjNgGa2lz2Q==
X-Received: by 2002:a17:90b:4b4b:b0:308:6d7a:5d30 with SMTP id
 98e67ed59e1d1-30c3d3e0a86mr27034300a91.18.1747110525743; 
 Mon, 12 May 2025 21:28:45 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b234ad3e9f1sm5486101a12.35.2025.05.12.21.28.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 May 2025 21:28:45 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
Subject: [PATCH v1 5/5] misc: fastrpc: Add missing unmapping user-requested
 remote heap
Date: Tue, 13 May 2025 09:58:25 +0530
Message-Id: <20250513042825.2147985-6-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ReqQC0tv c=1 sm=1 tr=0 ts=6822ca7f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8BRqyYDQAlS27bmPn4kA:9
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: frlDwUFeU2gSFkhsBVrHBtmWYP6UhMMB
X-Proofpoint-ORIG-GUID: frlDwUFeU2gSFkhsBVrHBtmWYP6UhMMB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDAzOSBTYWx0ZWRfX60OW4Z31bunl
 OdnQmaI222DVfgUk4f6JOMJh4SvU5Q57iaEzGCry3hvo3rMjJCAD9C37+iE0fwyaltQ2hYisAXi
 aAhnBTDaqOlkTpEpxvoUBzoemZFdPymL55p/faZRKPz3wirnMh5JAkvxfTiYQj0kXTfxVkoS0MT
 SDblgyrJRtO0GR0jw+dasIilB1THJ4+ip74yEndmI39kRFxfVsot3EutJPy3xCG3zrltxr0RNEw
 i9AeOrMwLLSoRw+D8eB0n4AIgwzUNwuppt7+lDF2hcSvSHG9OrdEv/hJ3iY56m10eF8kGKL7kW2
 dw1jYJMgPbThprzN/NyfOfbJAD28EDRqo0z0zzt5/dalPCUD6r5J8pjUsaPfFa3USiyNw88YXwK
 iOVUIcydY0bK7JFlUv8dHp0VQAtavUBg1Or7QLxG+zV9cF5DLotOpX6AZMG9lP1QYnNjzEQj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_07,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 phishscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
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

User request for remote heap allocation is supported using ioctl
interface but support for unmap is missing. This could result in
memory leak issues. Add unmap user request support for remote heap.

Fixes: 532ad70c6d449 ("misc: fastrpc: Add mmap request assigning for static PD pool")
Cc: stable@kernel.org
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 62 ++++++++++++++++++++++++++++++++++--------
 1 file changed, 51 insertions(+), 11 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index d54368bf8c5c..b64c5b9e07b5 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -197,6 +197,8 @@ struct fastrpc_buf {
 	struct dma_buf *dmabuf;
 	struct device *dev;
 	void *virt;
+	/* Type of buffer */
+	u32 flag;
 	u64 phys;
 	u64 size;
 	/* Lock for dma buf attachments */
@@ -1867,8 +1869,26 @@ static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *
 	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE, sc,
 				      &args[0]);
 	if (!err) {
-		dev_dbg(dev, "unmmap\tpt 0x%09lx OK\n", buf->raddr);
+		if (buf->flag == ADSP_MMAP_REMOTE_HEAP_ADDR && fl->cctx->vmcount) {
+			u64 src_perms = 0;
+			struct qcom_scm_vmperm dst_perms;
+			u32 i;
+
+			for (i = 0; i < fl->cctx->vmcount; i++)
+				src_perms |= BIT(fl->cctx->vmperms[i].vmid);
+
+			dst_perms.vmid = QCOM_SCM_VMID_HLOS;
+			dst_perms.perm = QCOM_SCM_PERM_RWX;
+			err = qcom_scm_assign_mem(buf->phys, (u64)buf->size,
+						  &src_perms, &dst_perms, 1);
+			if (err) {
+				dev_err(fl->sctx->dev, "Failed to assign memory phys 0x%llx size 0x%llx err %d\n",
+					buf->phys, buf->size, err);
+				return err;
+			}
+		}
 		fastrpc_buf_free(buf);
+		dev_dbg(dev, "unmmap\tpt 0x%09lx OK\n", buf->raddr);
 	} else {
 		dev_err(dev, "unmmap\tpt 0x%09lx ERROR\n", buf->raddr);
 	}
@@ -1882,6 +1902,7 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
 	struct fastrpc_req_munmap req;
 	struct device *dev = fl->sctx->dev;
 	int err;
+	unsigned long flags;
 
 	if (copy_from_user(&req, argp, sizeof(req)))
 		return -EFAULT;
@@ -1896,20 +1917,38 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
 	}
 	spin_unlock(&fl->lock);
 
-	if (!buf) {
-		dev_err(dev, "mmap\t\tpt 0x%09llx [len 0x%08llx] not in list\n",
-			req.vaddrout, req.size);
-		return -EINVAL;
+	if (buf) {
+		err = fastrpc_req_munmap_impl(fl, buf);
+		if (err) {
+			spin_lock(&fl->lock);
+			list_add_tail(&buf->node, &fl->mmaps);
+			spin_unlock(&fl->lock);
+		}
+		return err;
 	}
 
-	err = fastrpc_req_munmap_impl(fl, buf);
-	if (err) {
-		spin_lock(&fl->lock);
-		list_add_tail(&buf->node, &fl->mmaps);
-		spin_unlock(&fl->lock);
+	spin_lock_irqsave(&fl->cctx->lock, flags);
+	list_for_each_entry_safe(iter, b, &fl->cctx->rhmaps, node) {
+		if (iter->raddr == req.vaddrout && iter->size == req.size) {
+			list_del(&iter->node);
+			buf = iter;
+			break;
+		}
 	}
+	spin_unlock_irqrestore(&fl->cctx->lock, flags);
+	if (buf) {
+		err = fastrpc_req_munmap_impl(fl, buf);
+		if (err) {
+			spin_lock_irqsave(&fl->cctx->lock, flags);
+			list_add_tail(&buf->node, &fl->cctx->rhmaps);
+			spin_unlock_irqrestore(&fl->cctx->lock, flags);
+		}
+		return err;
+	}
+	dev_err(dev, "mmap\t\tpt 0x%09llx [len 0x%08llx] not in list\n",
+		req.vaddrout, req.size);
 
-	return err;
+	return -EINVAL;
 }
 
 static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
@@ -1977,6 +2016,7 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
 
 	/* update the buffer to be able to deallocate the memory on the DSP */
 	buf->raddr = (uintptr_t) rsp_msg.vaddr;
+	buf->flag = req.flags;
 
 	/* let the client know the address to use */
 	req.vaddrout = rsp_msg.vaddr;
-- 
2.34.1

