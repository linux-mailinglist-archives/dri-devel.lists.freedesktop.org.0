Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFCBC55F34
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 07:41:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67F6D10E2FD;
	Thu, 13 Nov 2025 06:41:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DMWtt1TA";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y9PynkCD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4967A10E2FD
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 06:41:27 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AD1SVlP3120617
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 06:41:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=fCH6YNeGp5f
 wf5ePRtG9yuPXtin/dsoqE9OI2lFu4Cc=; b=DMWtt1TANstRrL6/p2z0A3d0LeJ
 Ahn3GWuQ6EHqJFjUIFZGZAi8sXHIKnZUhId8Oja7TOthV49n2iwaHCPYzpqpAIhO
 7ZU6PR0TImvTuAQiV6w4jHqOha+Qzh6QbNjro2VvhT3KxEs132y3OHjQrx1JGxXU
 j6IFD4/cYbgw39LfxUiiPbkhb9CzKbmuSmt4iftZFcsxlryjJeSQ/DajkCgemPS/
 EFbivzbI8dPgr2KsG9/+6Ctdioj4Avx8wFiHnZbZS6RwtMmlbZaQnZn//aFk7uZh
 x8LtufjPiix9rnBjfW+UjA2U19SU1dANepGa2zs9FvlDEJIQuggBk86nawg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ad5purt3g-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 06:41:26 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-bc316e9d60eso430716a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 22:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763016086; x=1763620886;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fCH6YNeGp5fwf5ePRtG9yuPXtin/dsoqE9OI2lFu4Cc=;
 b=Y9PynkCD/9jV3hCEbFchMeO8ppmu6cdTTL22FmUPQq3hGNNjDmBbecTICP36qJGaCm
 vWme6t8kEKyNZrXEbbB/Kp0XbJQyZgBpBoElcZ7AAG2dqjfnOa3hHmiq8/YHI+wmq5vk
 9eBsNpmdwUnqadbBlA9I4SfuTnWHQCMafWZzK8ZuZ4FdLzJiDgAsCzBr6ly9C7Y5pllV
 ALrpst6lXdgQrjzN5owbWNDocvTcRaaWj2+ULwf0fSTk/crfqUL/pZslwT1weSpYkxCX
 7GKBPHFPhH/CYSJeZ+q1FFwDGfUywqBbRPMmSZycDr33SdvnCZ/vMd1SEgW0ojubiRVd
 JEsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763016086; x=1763620886;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=fCH6YNeGp5fwf5ePRtG9yuPXtin/dsoqE9OI2lFu4Cc=;
 b=c9NnG+r/Ljlu6V3bNydliEWuZ8Tfk1nAAlh1wg8QC+7kS7w9ju+9Gr6G/6IiFS5Nsx
 plsY3c5M8QiSVY74iXTf2AZHisQbXWWBSpouD63bT9KO2flt7KaWjO9ywo7p6HqfORRS
 lp4KNBSIJHHH6DA6ijjDCDa5c94VPV5Yu12sP9jdk7JOLCpi9nknXU37GBa8A9ZYkvGC
 P6xLXdd3SjOZmwXVMv9TkbIUlRDVTfSIs8p+eIRvy8z3DFCyj8QW3AKA2KRE+suY401/
 xx8tuBJTDbS2ddcsSPaBINnhrkH8k4D4aQnHe2OchA9XiBGKWa7NfzaB6peIJbTMjMI1
 OV3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwSR8oGWIR3sRIF4l3+ygyN5WlAfuxblFMgls67qBxFqYS/jR4J5wikfi78cUiiAlaZzZUjtsFR28=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzbyeYvLENM2cH8djCDwkjvi+VoGYZQgHiLLiFNi11BdUncnJVj
 UD2dG3kSnWTJe1jndVRALM4J0/ft3nuSRKMhfT+Djwlbg5BXJv3d2HCQ45nl1+NsdwLhAgXuT5s
 018m0uNBnbsTOiVjc7xageRs6fpNy6lDxoQZf+l/0v1oPMaY/MHmJq8uYKDkyv5QcmlZprHc=
X-Gm-Gg: ASbGncuW4ZGG/LSfiffnwYasSIcM20tBzdzT8UZb3hGdf5JoWJ0LxCDQzwwNrvsdiOF
 35G/tsbW6KDS4kNj9I/kU/VGoMTn/DnCR6zzfIqtKXOvTBsf16mRhn7N8y3uM/t0m6UJeC02uKl
 UT2n959yuuLAA8nnM43KXOzczQBkHBOlrIKA6swWX7SmqMIhajYhKhyHAA5gPEC+bCZ6Pvx2d5i
 JshzYhQNdF8ugwm7P3lX8Rs0itFuex+ffgWxHlJ4+jGt4bSl3s5eVbcAq6TZf29Mgf6rTT3QhCb
 k3Jdo1A3Kh8T4K6au53h/EpuY8RdnxMLxwYPvEICO2/K4S5oCjwD4pBrzpSPFcOxx7sf6G3ymku
 QBeeUta3J2UW7TvkPatS00hVKTNO6eWo=
X-Received: by 2002:a05:6a21:71c6:b0:35a:6e94:a56 with SMTP id
 adf61e73a8af0-35a6e940d64mr2153412637.17.1763016085847; 
 Wed, 12 Nov 2025 22:41:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEl/1PQ5yuuhOru4P+95jAHAj+dMuPMBq28IfLV5qxM6svlE6drzYH71KBuLA2K3Wu4wtfX1Q==
X-Received: by 2002:a05:6a21:71c6:b0:35a:6e94:a56 with SMTP id
 adf61e73a8af0-35a6e940d64mr2153386637.17.1763016085333; 
 Wed, 12 Nov 2025 22:41:25 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-bc36db25bfbsm1138419a12.1.2025.11.12.22.41.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Nov 2025 22:41:25 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de,
 dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v3 3/3] misc: fastrpc: Add polling mode support for fastRPC
 driver
Date: Thu, 13 Nov 2025 12:11:11 +0530
Message-Id: <20251113064111.2426325-4-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251113064111.2426325-1-ekansh.gupta@oss.qualcomm.com>
References: <20251113064111.2426325-1-ekansh.gupta@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=E6/AZKdl c=1 sm=1 tr=0 ts=69157d96 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=TEHdEMHTk_fMHrPBF0kA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDA0NSBTYWx0ZWRfX/KORCO5YwiF0
 Nm8lyn2XXmcnGgIJWQBmduGvrFeF+T+bsKBTMxrSr9OOPPJSBI+uD84GGxzSYHsLKvZ8wFlaNaz
 jGTPnoJvVdRH27O14xfZ6wElGxdLeQZKGqr0v7yTYS+6Was9GoMjoQ3HvIRk6iRDhEAufhL5Ss9
 tcPoxM8p5dVc0HwY5JxMjJNfYO5ntXwiiM3cJwoXBHUFZqDlcowFpvU/yVk2Hy5fXkKbClHi9Lg
 IRj2gbubA7fzmtG0Hs4x7rzrhEocUuLPK/wL1DnPYH72nVn8rWd1HKaZ+gsl12OMHfZ94vHOvpw
 W71+3noW0pWOxS4thj0z/iJ+EeCpnrSa/uNNgF35uOoOsjQlMgxnN3dZR0Z/A1OHoGTFSMsX0Ri
 PcvHqIvC4RAEN477IcJhY7O0SH8vQA==
X-Proofpoint-GUID: 1QFlh4yPUNBn0PxaPnLeCaHn5Tbe-Zqt
X-Proofpoint-ORIG-GUID: 1QFlh4yPUNBn0PxaPnLeCaHn5Tbe-Zqt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_06,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0
 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130045
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

For any remote call to DSP, after sending an invocation message,
fastRPC driver waits for glink response and during this time the
CPU can go into low power modes. This adds latency to overall fastrpc
call as CPU wakeup and scheduling latencies are included. Add polling
mode support with which fastRPC driver will poll continuously on a
memory after sending a message to remote subsystem which will eliminate
CPU wakeup and scheduling latencies and reduce fastRPC overhead. Poll
mode can be enabled by user by making a remote_handle64_control request.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c      | 138 ++++++++++++++++++++++++++++++++++--
 include/uapi/misc/fastrpc.h |   9 +++
 2 files changed, 140 insertions(+), 7 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index ccba3b6dfdfa..60de9dcb9815 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -22,6 +22,8 @@
 #include <linux/firmware/qcom/qcom_scm.h>
 #include <uapi/misc/fastrpc.h>
 #include <linux/of_reserved_mem.h>
+#include <linux/compiler.h>
+#include <linux/iopoll.h>
 
 #define ADSP_DOMAIN_ID (0)
 #define MDSP_DOMAIN_ID (1)
@@ -37,6 +39,7 @@
 #define FASTRPC_CTX_MAX (256)
 #define FASTRPC_INIT_HANDLE	1
 #define FASTRPC_DSP_UTILITIES_HANDLE	2
+#define FASTRPC_MAX_STATIC_HANDLE (20)
 #define FASTRPC_CTXID_MASK (0xFF00)
 #define FASTRPC_CTXID_POS (8)
 #define INIT_FILELEN_MAX (2 * 1024 * 1024)
@@ -106,6 +109,12 @@
 
 #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
 
+/* Poll response number from remote processor for call completion */
+#define FASTRPC_POLL_RESPONSE (0xdecaf)
+
+/* Polling mode timeout limit */
+#define FASTRPC_POLL_MAX_TIMEOUT_US (10000)
+
 struct fastrpc_phy_page {
 	u64 addr;		/* physical address */
 	u64 size;		/* size of contiguous region */
@@ -236,8 +245,14 @@ struct fastrpc_invoke_ctx {
 	u32 sc;
 	u64 *fdlist;
 	u32 *crc;
+	/* Poll memory that DSP updates */
+	u32 *poll;
 	u64 ctxid;
 	u64 msg_sz;
+	/* work done status flag */
+	bool is_work_done;
+	/* process updates poll memory instead of glink response */
+	bool is_polled;
 	struct kref refcount;
 	struct list_head node; /* list of ctxs */
 	struct completion work;
@@ -301,6 +316,8 @@ struct fastrpc_user {
 	int client_id;
 	int pd;
 	bool is_secure_dev;
+	/* Flags poll mode state */
+	bool poll_mode;
 	/* Lock for lists */
 	spinlock_t lock;
 	/* lock for allocations */
@@ -894,7 +911,8 @@ static int fastrpc_get_meta_size(struct fastrpc_invoke_ctx *ctx)
 		sizeof(struct fastrpc_invoke_buf) +
 		sizeof(struct fastrpc_phy_page)) * ctx->nscalars +
 		sizeof(u64) * FASTRPC_MAX_FDLIST +
-		sizeof(u32) * FASTRPC_MAX_CRCLIST;
+		sizeof(u32) * FASTRPC_MAX_CRCLIST +
+		sizeof(u32);
 
 	return size;
 }
@@ -990,6 +1008,7 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
 	list = fastrpc_invoke_buf_start(rpra, ctx->nscalars);
 	pages = fastrpc_phy_page_start(list, ctx->nscalars);
 	ctx->fdlist = (u64 *)(pages + ctx->nscalars);
+	ctx->poll = (u32 *)(ctx->fdlist + FASTRPC_MAX_FDLIST + FASTRPC_MAX_CRCLIST);
 	args = (uintptr_t)ctx->buf->virt + metalen;
 	rlen = pkt_size - metalen;
 	ctx->rpra = rpra;
@@ -1158,6 +1177,75 @@ static int fastrpc_invoke_send(struct fastrpc_session_ctx *sctx,
 
 }
 
+static inline u32 fastrpc_poll_op(void *p)
+{
+	struct fastrpc_invoke_ctx *ctx = p;
+
+	dma_rmb();
+	return READ_ONCE(*ctx->poll);
+}
+
+static int poll_for_remote_response(struct fastrpc_invoke_ctx *ctx)
+{
+	u32 val;
+	int ret;
+
+	/*
+	 * Poll until DSP writes FASTRPC_POLL_RESPONSE into *ctx->poll
+	 * or until another path marks the work done.
+	 */
+	ret = read_poll_timeout_atomic(fastrpc_poll_op, val,
+				       (val == FASTRPC_POLL_RESPONSE) ||
+				       ctx->is_work_done, 1,
+				       FASTRPC_POLL_MAX_TIMEOUT_US, false, ctx);
+
+	if (!ret && val == FASTRPC_POLL_RESPONSE) {
+		ctx->is_work_done = true;
+		ctx->retval = 0;
+	}
+
+	if (ret == -ETIMEDOUT)
+		ret = -EIO;
+
+	return ret;
+}
+
+static inline int fastrpc_wait_for_response(struct fastrpc_invoke_ctx *ctx,
+					    u32 kernel)
+{
+	int err = 0;
+
+	if (kernel) {
+		if (!wait_for_completion_timeout(&ctx->work, 10 * HZ))
+			err = -ETIMEDOUT;
+	} else {
+		err = wait_for_completion_interruptible(&ctx->work);
+	}
+
+	return err;
+}
+
+static int fastrpc_wait_for_completion(struct fastrpc_invoke_ctx *ctx,
+				       u32 kernel)
+{
+	int err;
+
+	do {
+		if (ctx->is_polled) {
+			err = poll_for_remote_response(ctx);
+			/* If polling timed out, move to normal response mode */
+			if (err)
+				ctx->is_polled = false;
+		} else {
+			err = fastrpc_wait_for_response(ctx, kernel);
+			if (err)
+				return err;
+		}
+	} while (!ctx->is_work_done);
+
+	return err;
+}
+
 static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
 				   u32 handle, u32 sc,
 				   struct fastrpc_invoke_args *args)
@@ -1193,16 +1281,25 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
 	if (err)
 		goto bail;
 
-	if (kernel) {
-		if (!wait_for_completion_timeout(&ctx->work, 10 * HZ))
-			err = -ETIMEDOUT;
-	} else {
-		err = wait_for_completion_interruptible(&ctx->work);
-	}
+	/*
+	 * Set message context as polled if the call is for a user PD
+	 * dynamic module and user has enabled poll mode.
+	 */
+	if (handle > FASTRPC_MAX_STATIC_HANDLE && fl->pd == USER_PD &&
+	    fl->poll_mode)
+		ctx->is_polled = true;
+
+	err = fastrpc_wait_for_completion(ctx, kernel);
 
 	if (err)
 		goto bail;
 
+	if (!ctx->is_work_done) {
+		err = -ETIMEDOUT;
+		dev_dbg(fl->sctx->dev, "Invalid workdone state for handle 0x%x, sc 0x%x\n",
+			handle, sc);
+		goto bail;
+	}
 	/* make sure that all memory writes by DSP are seen by CPU */
 	dma_rmb();
 	/* populate all the output buffers with results */
@@ -1780,6 +1877,29 @@ static int fastrpc_get_info_from_kernel(struct fastrpc_ioctl_capability *cap,
 	return 0;
 }
 
+static int fastrpc_set_option(struct fastrpc_user *fl, char __user *argp)
+{
+	struct fastrpc_ioctl_set_option opt = {0};
+	int i;
+
+	if (copy_from_user(&opt, argp, sizeof(opt)))
+		return -EFAULT;
+
+	for (i = 0; i < ARRAY_SIZE(opt.reserved); i++) {
+		if (opt.reserved[i] != 0)
+			return -EINVAL;
+	}
+	if (opt.req != FASTRPC_POLL_MODE)
+		return -EINVAL;
+
+	if (opt.enable)
+		fl->poll_mode = true;
+	else
+		fl->poll_mode = false;
+
+	return 0;
+}
+
 static int fastrpc_get_dsp_info(struct fastrpc_user *fl, char __user *argp)
 {
 	struct fastrpc_ioctl_capability cap = {0};
@@ -2134,6 +2254,9 @@ static long fastrpc_device_ioctl(struct file *file, unsigned int cmd,
 	case FASTRPC_IOCTL_MEM_UNMAP:
 		err = fastrpc_req_mem_unmap(fl, argp);
 		break;
+	case FASTRPC_IOCTL_SET_OPTION:
+		err = fastrpc_set_option(fl, argp);
+		break;
 	case FASTRPC_IOCTL_GET_DSP_INFO:
 		err = fastrpc_get_dsp_info(fl, argp);
 		break;
@@ -2465,6 +2588,7 @@ static int fastrpc_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
 
 	ctx->retval = rsp->retval;
 	complete(&ctx->work);
+	ctx->is_work_done = true;
 
 	/*
 	 * The DMA buffer associated with the context cannot be freed in
diff --git a/include/uapi/misc/fastrpc.h b/include/uapi/misc/fastrpc.h
index c6e2925f47e6..6c1375ba0042 100644
--- a/include/uapi/misc/fastrpc.h
+++ b/include/uapi/misc/fastrpc.h
@@ -16,6 +16,7 @@
 #define FASTRPC_IOCTL_INIT_CREATE_STATIC _IOWR('R', 9, struct fastrpc_init_create_static)
 #define FASTRPC_IOCTL_MEM_MAP		_IOWR('R', 10, struct fastrpc_mem_map)
 #define FASTRPC_IOCTL_MEM_UNMAP		_IOWR('R', 11, struct fastrpc_mem_unmap)
+#define FASTRPC_IOCTL_SET_OPTION	_IOWR('R', 12, struct fastrpc_ioctl_set_option)
 #define FASTRPC_IOCTL_GET_DSP_INFO	_IOWR('R', 13, struct fastrpc_ioctl_capability)
 
 /**
@@ -66,6 +67,8 @@ enum fastrpc_proc_attr {
 
 /* Fastrpc attribute for memory protection of buffers */
 #define FASTRPC_ATTR_SECUREMAP	(1)
+/* Set option request ID to enable poll mode */
+#define FASTRPC_POLL_MODE	(1)
 
 struct fastrpc_invoke_args {
 	__u64 ptr;
@@ -133,6 +136,12 @@ struct fastrpc_mem_unmap {
 	__s32 reserved[5];
 };
 
+struct fastrpc_ioctl_set_option {
+	__u32 req;		/* request id */
+	__u32 enable;	/* enable flag */
+	__s32 reserved[6];
+};
+
 struct fastrpc_ioctl_capability {
 	__u32 unused; /* deprecated, ignored by the kernel */
 	__u32 attribute_id;
-- 
2.34.1

