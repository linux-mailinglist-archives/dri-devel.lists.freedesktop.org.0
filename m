Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DA6D231FF
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 09:29:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3440D10E712;
	Thu, 15 Jan 2026 08:29:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JpRj1lqI";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A6mtcmyy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CFF910E704
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 08:29:53 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60F6fsqG1851017
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 08:29:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=12vcQeB7vtt
 +410hwakfDxk9ykcl1qmLQ2Bo+92glU4=; b=JpRj1lqImLTb4jPLxwNJf6PGwh+
 R4DUfocyLZEugvuOkB9EttRFJvUCYqsqhfw84CC+fe/wvO17O5fSntJhciOAXXpD
 5I4K2vtUhakIWW3QdOucZ3xa2/t+4iw7vMwVY2sBAfjreskxNR0cnK/k3pHIIqWl
 BU5P0F76cbLedbqdUOhcvfcPI5Rh3+k5eLWTl0XmDPcEcvvENxkqXOyv3anq0G2r
 PBBlfYE0ecdYzyA3E5lWk8uyer3FQHzQYXmKsTdg/xStnbrfmlj8MnO99HGDWaXj
 4WhHVjSyfOFbiMvjfoZw5Oz+/glZgAA4gYDrFie3Jbbta6hWxxgbbNAVqwQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bprej0q1s-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 08:29:52 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-81f3fb8c8caso1365925b3a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 00:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768465792; x=1769070592;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=12vcQeB7vtt+410hwakfDxk9ykcl1qmLQ2Bo+92glU4=;
 b=A6mtcmyy21xFSygeJSegw+tiljNJZggqsQ1dAoUTSNKSelhPXO2KmVq/QUkyTrMsOS
 TtRE1VvrZ/kogbI7XTpVvxmVoAWVtm48KZbjtIlRxHe5mDoQy/DBLwX/HSpYxvAp7IMd
 E3tBukE0QiamXsgPKATLwIKrdecmS54ofmOYxbuHAUzNNui2Q7hHnqrN0aTUhSiXSBeN
 6DHVItU9BTZpfEuZPQNlfdegu9edPAPiBEbzVPHHnUIfWoOG9zVQYyUwUbf1URUZVghO
 M1xZ8G+Z1WX7AH+wTybwTETq2mWEpNPjFmfUD07WyuhEWJEe/6Zq2cFDsrbKa9Y/0mUQ
 sj/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768465792; x=1769070592;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=12vcQeB7vtt+410hwakfDxk9ykcl1qmLQ2Bo+92glU4=;
 b=YhbYqTPa7ePWEjdUk+e4qTen1/wpldOWwDWH+2laoZh+GIojjKbHt55zPy9MnMroIL
 XqtyMgdFiMUGvH3MrxmQLJqy/wLPCn70sk7BYAPBJPJvJeX+kA+fuJKmksPsfu1Yj4TG
 UmmIvlf+bDhd9l5zKOTzqSjKvQZ/qH3oPjHwk4ogRWKCWWVwAD0iJh+3WBZGOZeZ8KUM
 n+e/SKbK7D1koO9v8UKnHZO0UwAIFUT/eoJVhpVUUZlcKywVUWyRa7+9n0CecZv/fxRG
 RiEujYbbauX5U5hMOZ5r2xhjwRKKbl+l2SLjfZkYVVLMvUER+r6gRo/GXxTdsTn/bYJJ
 ZpWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5nc/zL+db4GgODgtbx4h+iC8ZIEU9tMZCdcCb98G5Sfjtfcuk7KAWaltZY2Qkk0vEF9KNfdQCbm0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyWu9OsDRvbkpfcn3y+Il75mZ3q+NixIbUAKxdzJSLZN2ac1hHY
 EVJUM4skhcEhJ+tMOEDzwNGReJVOVGxyhmdY48saKDJQ7kY/EnR4SXDjvzsUh/1wFZFvYtcBgzB
 soTwkTlhtax+QsTObpIj9lqMyoXpJnwFAW7TLQ6uwS1TFJw8Qof5fSqgT+xoWQwNNvxZp+e4=
X-Gm-Gg: AY/fxX76yU9V1qE6xuHsp9mWl/VGZppVajpBN21fZ5vp6W75mKruLg9aR5kL7faiMBo
 g2UGoZConR1TXjxXgOTy9oX8yOqFFKrZjlZCPpliH+m2KSAD98Bayj7viuNGxekEV8KorINzu0P
 h9fA6fFlwf5/rlPQqxMawPHk9xb6ThDxvZolgTlj6yUxrL3A0bfuThS/vBtB6aLImQCmiDiLoWP
 cZbj6hR9V5kEOIIXgSFUQq8WGlqGmtR9jsDKZgcqqjj9iemciPk8IeYMDXq2s3klfnpjW3gbeGQ
 7F5bi4lh0K0YEVSewKTlN5LteRfOpsVYR40SHWZnRg+pg92Z4uq236RMAc6khF51eEu4epoS7yD
 QAHkA6gAXzyMOC/IuhmG7kWt4A7P5yMVT4xnZ3W1/
X-Received: by 2002:a05:6a00:ac03:b0:81f:5acb:55e7 with SMTP id
 d2e1a72fcca58-81f81fe0a08mr5626394b3a.54.1768465791735; 
 Thu, 15 Jan 2026 00:29:51 -0800 (PST)
X-Received: by 2002:a05:6a00:ac03:b0:81f:5acb:55e7 with SMTP id
 d2e1a72fcca58-81f81fe0a08mr5626370b3a.54.1768465791237; 
 Thu, 15 Jan 2026 00:29:51 -0800 (PST)
Received: from QCOM-SocCW5bzXR.qualcomm.com ([202.46.23.19])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-81f8e69d1e7sm1773296b3a.58.2026.01.15.00.29.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 00:29:50 -0800 (PST)
From: Jianping Li <jianping.li@oss.qualcomm.com>
To: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, thierry.escande@linaro.org, 
 abelvesa@kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 stable@kernel.org, Jianping Li <jianping.li@oss.qualcomm.com>
Subject: [PATCH v2 3/4] misc: fastrpc: Remove buffer from list prior to unmap
 operation
Date: Thu, 15 Jan 2026 16:28:50 +0800
Message-Id: <20260115082851.570-4-jianping.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260115082851.570-1-jianping.li@oss.qualcomm.com>
References: <20260115082851.570-1-jianping.li@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA1NyBTYWx0ZWRfX8L1SQ2Sy3DqY
 0EvUnjuhz0uQ0pwwi4UnoEL0wJ24e65/HIMZTRBBnhCSr8VvNWs381QQJfzqn+12kuzdTeFaaOz
 zA89IIMr3E4oNSsXO4N8uSu0hY0n7bwbS9QreDbS0eol1ZCxDmwWCgC3TuKtgz1pQYzWuc7/GRl
 mErHpZ6N20inAeVodJjp3Ke1oHMffMmVML8PT1fxALPGy/SQLmMo8LWz0SGZiYOVCtXESjbjWds
 prWu+GzDyZiaHTCZou7mI/93KC2aVbukmg2nuPCCuDV2g5+cLNoVg260gofQr5wXqcSBx7LV8R0
 +SYCcCuMjbMCxBpgr6sYNrBLwVO1aVO+U7tq4pkaw0hPPpAnCUV8xY4foUdNiI8OBtWheRmQ+SY
 Q3s5VA2FkEI3gSkKNaTK4aZd1MNkOsFjeBuUFCvNMxViYAKiB9BLb5rWwoGVPcmkwAeIBCRNyg7
 2mBGFuZbJmt1k8TJGuQ==
X-Proofpoint-ORIG-GUID: y9haI6a3NSEc95NnhWhLu3Y58CdWcvWV
X-Authority-Analysis: v=2.4 cv=Rc+dyltv c=1 sm=1 tr=0 ts=6968a580 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=65MDuzgJ9_6jycvYPFoA:9
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: y9haI6a3NSEc95NnhWhLu3Y58CdWcvWV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 clxscore=1011 bulkscore=0 malwarescore=0 phishscore=0 impostorscore=0
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

fastrpc_req_munmap_impl() is called to unmap any buffer. The buffer is
getting removed from the list after it is unmapped from DSP. This can
create potential race conditions if any other thread removes the entry
from list while unmap operation is ongoing. Remove the entry before
calling unmap operation.

Fixes: 2419e55e532de ("misc: fastrpc: add mmap/unmap support")
Cc: stable@kernel.org
Co-developed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 28 ++++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 4f12fa5a05aa..833c265add5e 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -202,6 +202,8 @@ struct fastrpc_buf {
 	/* mmap support */
 	struct list_head node; /* list of user requested mmaps */
 	uintptr_t raddr;
+	/* Lock for buf->node */
+	spinlock_t *list_lock;
 };
 
 struct fastrpc_dma_buf_attachment {
@@ -441,6 +443,7 @@ static int __fastrpc_buf_alloc(struct fastrpc_user *fl, struct device *dev,
 	buf->size = size;
 	buf->dev = dev;
 	buf->raddr = 0;
+	buf->list_lock = &fl->lock;
 
 	buf->virt = dma_alloc_coherent(dev, buf->size, &buf->dma_addr,
 				       GFP_KERNEL);
@@ -1865,9 +1868,6 @@ static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *
 				      &args[0]);
 	if (!err) {
 		dev_dbg(dev, "unmmap\tpt 0x%09lx OK\n", buf->raddr);
-		spin_lock(&fl->lock);
-		list_del(&buf->node);
-		spin_unlock(&fl->lock);
 		fastrpc_buf_free(buf);
 	} else {
 		dev_err(dev, "unmmap\tpt 0x%09lx ERROR\n", buf->raddr);
@@ -1881,6 +1881,7 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
 	struct fastrpc_buf *buf = NULL, *iter, *b;
 	struct fastrpc_req_munmap req;
 	struct device *dev = fl->sctx->dev;
+	int err;
 
 	if (copy_from_user(&req, argp, sizeof(req)))
 		return -EFAULT;
@@ -1888,6 +1889,7 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
 	spin_lock(&fl->lock);
 	list_for_each_entry_safe(iter, b, &fl->mmaps, node) {
 		if ((iter->raddr == req.vaddrout) && (iter->size == req.size)) {
+			list_del(&iter->node);
 			buf = iter;
 			break;
 		}
@@ -1900,7 +1902,14 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
 		return -EINVAL;
 	}
 
-	return fastrpc_req_munmap_impl(fl, buf);
+	err = fastrpc_req_munmap_impl(fl, buf);
+	if (err) {
+		spin_lock(buf->list_lock);
+		list_add_tail(&buf->node, &fl->mmaps);
+		spin_unlock(buf->list_lock);
+	}
+
+	return err;
 }
 
 static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
@@ -1985,20 +1994,23 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
 		}
 	}
 
-	spin_lock(&fl->lock);
+	spin_lock(buf->list_lock);
 	list_add_tail(&buf->node, &fl->mmaps);
-	spin_unlock(&fl->lock);
+	spin_unlock(buf->list_lock);
 
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
+	spin_lock(buf->list_lock);
+	list_del(&buf->node);
+	spin_unlock(buf->list_lock);
 err_assign:
 	fastrpc_req_munmap_impl(fl, buf);
 
-- 
2.43.0

