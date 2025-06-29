Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C161AECD40
	for <lists+dri-devel@lfdr.de>; Sun, 29 Jun 2025 16:08:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5152B10E2C0;
	Sun, 29 Jun 2025 14:08:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PqH0dLnO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6187C10E342
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 14:07:57 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TCIgZP000721
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 14:07:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=/iFe2vNrJqp
 a0S0dcdbvotV9UbXoILAtHKmoL3TqRPw=; b=PqH0dLnObI0wyLWZYTsxKoc/+lU
 dhy15XQHsq1x6UU4b1RFHsjSdRAyJJBYd1jFQizvr/NjykuTPoSWZW7/5cRL6oxw
 tt3l70cJVV5bMH+C/9kWz0mNDequHZVq4xFdgZLdUuQd5mHGKouNhaHZJUfIA+6V
 bEn5xqC6LKqf9X0rWX4SrxOKPoIp2/TObItb49OB9yZyFQRxkjlDY0FOaYI8xWiw
 AYnBDqtmTTY5vpbPXi+VK+750vBJHU3EqMRj3Skw0i1Yi3EcyTIQaoB+CIPrnNcA
 K26RAd2HtcQqiEcfj6RwMAew8JGaMYGxaLBOsDuP9UTRpaKuKb2SFLXj7AA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7qm283y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 14:07:56 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-313d346dc8dso3741250a91.1
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 07:07:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751206075; x=1751810875;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/iFe2vNrJqpa0S0dcdbvotV9UbXoILAtHKmoL3TqRPw=;
 b=lVjpEwTOSGD24/o0Pg54ek1zhue6nronZhAyV7muRc+iSpV24ssKIub1+r0D7Dp1RT
 91n34kdQyd3PKhaiTFAQIECBV8BMIxfV8iECC0pyN9+JAv89sg7rFCM7fdRYxoxdadFF
 0su6VMQ9zBo5RKmr+58OtUc0cDcCe4cRR/o39OZS8yze4g4bRyi5s7dWJ9Afgdx0i6z1
 DGlU/HmgzY+oce7F4w9SzbwKkywAsJ+NJ9UX1GQWMXKsBa19UMO7Xj4+XIb41MHBj2va
 jHs4HHGY8kXN1VsdImFLbIVcWXD0NzDKOD/3wB1NFn8Isly/4f3MfJ+AoQgMsbUXxT2u
 EmLw==
X-Gm-Message-State: AOJu0Yzz6nhwhunN+WelqS+TgozMWULolTFoFGvkOFXlFTG38iGC7GMP
 K6mrf6u4x8r8sYMhczD/70e9RLrGqOpztoU9QvvDffhGF4ng9F8Vr8J+zH0HDpQINee96Z9llLR
 v/kDPORP7aX7MEiYTq6PuNwpOv9MJiNNwYCiRzwaFI32norq9msuEY5Ubg2E+viGxzmL+lhafmF
 QmVqk=
X-Gm-Gg: ASbGncuEEKCB1egOfW9jwHq4Sw7fdNEuIqtNORsIRLRTsPT9THkupglgiSzMxIaAj3Q
 8j2Gwk96EDzePB57T5ZYAzy5vb+QW5mhSeIByf8ZEyZBIRkxli+0hdMvIcsJhRsvI2njhhP8YN4
 t5WtMp/HvZry6ADoQNXnNjLKNn5JL0x66Un9fnKF3hbQG/ZaFRG0/2OzazD89y31qPlsj9+Zx7Q
 31+bT2/b9tc8LoFsKk6t9nrmbGC2IpejJfnJZNJDdRtL+PiE+7bzq6f5G7NJhLgA9vvqI3EpFfL
 yU4GIFRXl/+dmouoSoFqqXMyKjrAfxwl
X-Received: by 2002:a17:90b:5347:b0:311:ba2e:bdc9 with SMTP id
 98e67ed59e1d1-318c930f9c3mr14565158a91.27.1751206074983; 
 Sun, 29 Jun 2025 07:07:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPDMdsJ611F8y8JvrQrlcinGlj6zhivPonGdvEr/gwskrbg5lpJzq8J57v2DwyMT0wLTqjCw==
X-Received: by 2002:a17:90b:5347:b0:311:ba2e:bdc9 with SMTP id
 98e67ed59e1d1-318c930f9c3mr14565116a91.27.1751206074478; 
 Sun, 29 Jun 2025 07:07:54 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-318c14e224csm6959025a91.32.2025.06.29.07.07.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 07:07:54 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Danilo Krummrich <dakr@redhat.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v8 23/42] drm/msm: Mark VM as unusable on GPU hangs
Date: Sun, 29 Jun 2025 07:03:26 -0700
Message-ID: <20250629140537.30850-24-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
References: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=C4TpyRP+ c=1 sm=1 tr=0 ts=686148bc cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=DhdyfM8_h7Qj4WYt2N4A:9
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: CJZsF9CZ8ez-QO-MHYKbZIHRrD-u7uCj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDExOSBTYWx0ZWRfX9HPZH5tlMQh+
 ThdSiWBQxV68fpiSJWh/F9bP0tSwZPNOP+g24xuK1Y8ol/jJZAXC6dksocOFPKyP2jYNBXsujo4
 lscPNI9Gv9b+zxYZN+n1cM5/LcWteBPWD46bRytWDzaIZfc2OHyT6pio4u+D6C9Ba5u6JNVWsA/
 3os4QEohRtlZXI7mIV/RR2zdH6QVao6CN14fEfoBV/QqLMCk1SNvuJihpaTke2ERzJrLIgmFJ5G
 uvSmsfiBwXMojtE8DCcVCGcw+av36YB1hmkUmSUfGow1Z1MWMBdbVVL77YB5gTxwgFcEHJtmCMr
 2hQsOcJtFMDkB3dfCau9LvOS0Z8SsVl0VWpKjxKv7Y3eGxg8GF6AUyiHbX/Mx3Scb7oNK2oqEst
 xoAKEKS7Z1ni60h5TJpv3NZwfbTyEfDSwLn9kOcUvu1beapSdfKo2zLCGIF7wz5RuHwIsYcD
X-Proofpoint-GUID: CJZsF9CZ8ez-QO-MHYKbZIHRrD-u7uCj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506290119
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

From: Rob Clark <robdclark@chromium.org>

If userspace has opted-in to VM_BIND, then GPU hangs and VM_BIND errors
will mark the VM as unusable.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_gem.h        | 17 +++++++++++++++++
 drivers/gpu/drm/msm/msm_gem_submit.c |  3 +++
 drivers/gpu/drm/msm/msm_gpu.c        | 16 ++++++++++++++--
 3 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index b5bf21f62f9d..f2631a8c62b9 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -76,6 +76,23 @@ struct msm_gem_vm {
 
 	/** @managed: is this a kernel managed VM? */
 	bool managed;
+
+	/**
+	 * @unusable: True if the VM has turned unusable because something
+	 * bad happened during an asynchronous request.
+	 *
+	 * We don't try to recover from such failures, because this implies
+	 * informing userspace about the specific operation that failed, and
+	 * hoping the userspace driver can replay things from there. This all
+	 * sounds very complicated for little gain.
+	 *
+	 * Instead, we should just flag the VM as unusable, and fail any
+	 * further request targeting this VM.
+	 *
+	 * As an analogy, this would be mapped to a VK_ERROR_DEVICE_LOST
+	 * situation, where the logical device needs to be re-created.
+	 */
+	bool unusable;
 };
 #define to_msm_vm(x) container_of(x, struct msm_gem_vm, base)
 
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 068ca618376c..9562b6343e13 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -681,6 +681,9 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	if (args->pad)
 		return -EINVAL;
 
+	if (to_msm_vm(ctx->vm)->unusable)
+		return UERR(EPIPE, dev, "context is unusable");
+
 	/* for now, we just have 3d pipe.. eventually this would need to
 	 * be more clever to dispatch to appropriate gpu module:
 	 */
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index c08c942d85a0..0846f6c5169f 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -389,8 +389,20 @@ static void recover_worker(struct kthread_work *work)
 
 	/* Increment the fault counts */
 	submit->queue->faults++;
-	if (submit->vm)
-		to_msm_vm(submit->vm)->faults++;
+	if (submit->vm) {
+		struct msm_gem_vm *vm = to_msm_vm(submit->vm);
+
+		vm->faults++;
+
+		/*
+		 * If userspace has opted-in to VM_BIND (and therefore userspace
+		 * management of the VM), faults mark the VM as unusuable.  This
+		 * matches vulkan expectations (vulkan is the main target for
+		 * VM_BIND)
+		 */
+		if (!vm->managed)
+			vm->unusable = true;
+	}
 
 	get_comm_cmdline(submit, &comm, &cmd);
 
-- 
2.50.0

