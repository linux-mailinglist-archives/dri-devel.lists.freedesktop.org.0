Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F08B6C39230
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 06:08:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 446DF10E806;
	Thu,  6 Nov 2025 05:08:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="AI1ZSuwy";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HwGSOL5y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D88510E806
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 05:08:51 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A61O4an2798828
 for <dri-devel@lists.freedesktop.org>; Thu, 6 Nov 2025 05:08:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=ujaoRN0R9JC
 yofw9Ts/yVME10jsyMAe6gDSjtEx7EKQ=; b=AI1ZSuwyCsB/CYf8Z9MoEWTkTlh
 J6zFBGk1mODC6ILBPsc7Rr5w/h9IWEABoIEv3a/XcDA71ou8b4Ovph6h6ieWY7S0
 lXqePUkeTUzuvR6TKHT2L2qTdSnweKMesqnk+aY7qyowsnJzQ1yCL8O7IpXYDMs/
 AJf27D9wQArXIHrnZl8Hpa0RwWTXyuJjukzRGIGPjBJlbW9YsXCmzGcw07/WRX2i
 19EtDc1MuupA/nzo+KN6amf1R3eA4jQaivK33cwfxBuhjL8noHsMa4GI4R803UW4
 um8B54x8WCrANTqhvmt6ZmKkstvPjaWRB/ZUXDtV9UoaCm/iI5fjpVx32pA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8hytrgsu-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Nov 2025 05:08:50 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-77f610f7325so557987b3a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Nov 2025 21:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762405730; x=1763010530;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ujaoRN0R9JCyofw9Ts/yVME10jsyMAe6gDSjtEx7EKQ=;
 b=HwGSOL5y57K/ohQwQO4Q3AkG1SFwAHBlhT7p/hvl2SXXnFAGvYx4l1UY/Z3Fwn6JSR
 L5Cqb0Ns4P/ZtOw+zytaqIwW+vFg4pK8WTNrAiz1HzWYAZaFmwRPWrcOjZnLFwf5e7r/
 u+PzhBbHXoUYzby+eZvGXjmPIgu/O/dCILzIP9X7Plo9cHjK0IfbyToWJb8QNRmjFzLJ
 Istg9RLYAzYW3RhMiDda5Jy3bV+CA/RV5XrYK8RWvcWCNNrCjefVvodNZQl/eknZX2cz
 LU92N8kuVfjKSosiotbndj3TlwduPNDxxpkfiYvLNtnNrcOxwZRtPqXt3uSMUd82sbsQ
 998w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762405730; x=1763010530;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ujaoRN0R9JCyofw9Ts/yVME10jsyMAe6gDSjtEx7EKQ=;
 b=naIvOEio+fjmYhI5lGTmiuilvGrUmf8tRJhQECjONNvkdpHiOQMSOGXPIFg8iMRLkV
 calg0jUa0rTm7pt+hXEdK9Yp/udCyHtlyIRC7vXSwHyZTlCJ/iWNGqvqfF3VjmWYVuwM
 mLgqa/dWE9OGGJtiXVascWL2M9bnQCdtwwZPyNA5cMOLNqD+IfM02NuhWetFENm+1Kk6
 LOcHF1Czl1G9BsEUgmH/SHwB3AFlAfDT/xkdb59mSnJo+BNWuRPBV4s1wORNloiiR373
 7PImSzVE6VoP7JPZ0YsORsIU+Ma30o9OB6IH1H+6tOneK36DDeXuGeE7hlGTv83Ougf5
 G1pA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlw4CG4hnP4oCYeaSofOAvQsQsj63puWNx6Wf123T6W+FYOEav0jk6ux/Yv+3Vknbc5tMxoW9FOEw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YySvLxQAk3qVovdcmIz/jcyes3gwI9B9kiuk91shbl85a5Hs1q3
 M+mnf6M+4kmJoCPLcuXHtgI55HNN8flIgbYeCwlCieJH2Ur5m6BnWoDDTQz698f/AHLUXrt7JhN
 uRRJENRtbc/FdGU9GUKM0iPTPilONY8AuGrlJVN/c9QRlGB/rGpFhn/HZTmMa2cL0ISzlaxo=
X-Gm-Gg: ASbGncsU5fEokXVxwDha419szyaaH8/56RleR/vReu6r4El8OB0pguByIVaQJSMBJDD
 E1iBk4mYox0aZxUxFGlY3Iml3bdKKorgyRRYG3AugofFezjySghiUeaYQlCwFtEEnKlffCfzLll
 LL1bBBq+XfrrqHvOJmoyM5gFQrda/jJ+kdDIe6DJb3Sdp+ESsY0vYRuc0SBd7mAWhOr5kpu2AD1
 rVvz5vOWEoncTvhubWLt0dX0tk1ySZPY9M4b9S9/UnjIJoLCGtIRscZi3cuD03tkYc9ZVadjlv9
 Goa59mSeChUbgSoO4Xz9kQxr23B28WwI+zVFos67iWBAKgCiXFiprTzG4shrWusGSLG2yZPOc+v
 unRuo54wOntOkYVAvRcAPARXqWG3W8+A=
X-Received: by 2002:a05:6a00:2d22:b0:77f:2f7c:b709 with SMTP id
 d2e1a72fcca58-7ae1cc5f5e8mr7330937b3a.5.1762405730150; 
 Wed, 05 Nov 2025 21:08:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEcvDhrmBVPROt+wlrWa8IJlto8+biiFvtqHVaANPX8XnmNXEXYFFqELu1OvtY/577w190x3g==
X-Received: by 2002:a05:6a00:2d22:b0:77f:2f7c:b709 with SMTP id
 d2e1a72fcca58-7ae1cc5f5e8mr7330892b3a.5.1762405729612; 
 Wed, 05 Nov 2025 21:08:49 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7af7fd5238csm1185862b3a.17.2025.11.05.21.08.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Nov 2025 21:08:49 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de,
 dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v2 2/3] misc: fastrpc: Update context ID mask for polling mode
 support
Date: Thu,  6 Nov 2025 10:38:38 +0530
Message-Id: <20251106050839.3091707-3-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251106050839.3091707-1-ekansh.gupta@oss.qualcomm.com>
References: <20251106050839.3091707-1-ekansh.gupta@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: C5V5ve-DXqiBuNn8GSdHc9mfeYFXIIV5
X-Proofpoint-ORIG-GUID: C5V5ve-DXqiBuNn8GSdHc9mfeYFXIIV5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDAzOSBTYWx0ZWRfX1j7JtMATz+Xq
 08wgHpd7w/PjXf4BiZ0ekvGRAeFps2HBK4HfpoBiX0VKyLr50e2yhDmvs2lT4SE33ttLk1Z5X+j
 5YC96OkRajipUKPOBA/INKEidp/8n8kYpUS1mu9KB/dcWOgLwTKZQ45yAGtHR21bdTn96eqp21Y
 PR+VJIZNVSFjRp5AopgPmOikCHJOJeD9RFMSSOnF2pVL7Scp3qpV/ia+k6fmGeYfSaeP+K8HQkK
 luot9lw+4l2Rl4dgWorS3Be7UU5HsEillI7nEBm72Dg4FoK4UqZRWnwRFSb+vBGQ4fW1L7kzW3m
 WrgMrYCCiQP8moQBRfqyZ0f2GdlQgpL8Eera1Jn77MqKdeSg+xMQDnU3YC0n1yELZHmBYjc6F/1
 o1yF3dUvUt9xPht7ZwaGg2fyJvRiOQ==
X-Authority-Analysis: v=2.4 cv=X+Rf6WTe c=1 sm=1 tr=0 ts=690c2d62 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=eMrONWwZx6N8dQ6zNQwA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_09,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 clxscore=1011 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511060039
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

Current FastRPC message context uses a 12-bit mask where the upper
8 bits are context ID from idr_alloc_cyclic and the lower 4 bits
represent PD type. This design works for normal FastRPC calls but
doesn't work as expected for polling mode. To enable polling mode
support from DSP(DSP writes to poll memory), DSP expects a 16-bit
context where the upper 8 bits are context ID, the lower 4 bits are
PD type and the 5th bit from the end denotes async mode(not yet
upstreamed). If this bit is set, DSP disables polling. With the
current design, odd context IDs set this bit, causing DSP to skip
poll memory updates. Update the context mask to ensure a hole
which won't get populated, ensuring polling mode works as expected.
This is not a bug and the change is added to support polling mode.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 679cd8997a00..ccba3b6dfdfa 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -37,7 +37,8 @@
 #define FASTRPC_CTX_MAX (256)
 #define FASTRPC_INIT_HANDLE	1
 #define FASTRPC_DSP_UTILITIES_HANDLE	2
-#define FASTRPC_CTXID_MASK (0xFF0)
+#define FASTRPC_CTXID_MASK (0xFF00)
+#define FASTRPC_CTXID_POS (8)
 #define INIT_FILELEN_MAX (2 * 1024 * 1024)
 #define INIT_FILE_NAMELEN_MAX (128)
 #define FASTRPC_DEVICE_NAME	"fastrpc"
@@ -489,7 +490,7 @@ static void fastrpc_context_free(struct kref *ref)
 		fastrpc_buf_free(ctx->buf);
 
 	spin_lock_irqsave(&cctx->lock, flags);
-	idr_remove(&cctx->ctx_idr, ctx->ctxid >> 4);
+	idr_remove(&cctx->ctx_idr, ctx->ctxid >> FASTRPC_CTXID_POS);
 	spin_unlock_irqrestore(&cctx->lock, flags);
 
 	kfree(ctx->maps);
@@ -625,7 +626,7 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
 		spin_unlock_irqrestore(&cctx->lock, flags);
 		goto err_idr;
 	}
-	ctx->ctxid = ret << 4;
+	ctx->ctxid = ret << FASTRPC_CTXID_POS;
 	spin_unlock_irqrestore(&cctx->lock, flags);
 
 	kref_init(&ctx->refcount);
@@ -2451,7 +2452,7 @@ static int fastrpc_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
 	if (len < sizeof(*rsp))
 		return -EINVAL;
 
-	ctxid = ((rsp->ctx & FASTRPC_CTXID_MASK) >> 4);
+	ctxid = ((rsp->ctx & FASTRPC_CTXID_MASK) >> FASTRPC_CTXID_POS);
 
 	spin_lock_irqsave(&cctx->lock, flags);
 	ctx = idr_find(&cctx->ctx_idr, ctxid);
-- 
2.34.1

