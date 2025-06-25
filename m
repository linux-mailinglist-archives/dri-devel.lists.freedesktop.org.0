Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF66AE8D6B
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 20:59:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0C3510E7E1;
	Wed, 25 Jun 2025 18:59:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kePs+Dk/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BCD610E7DB
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 18:58:59 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PE8AYB015264
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 18:58:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=Fs6B1Ljf/Yl
 zr1lvB9QzWqwNCHwqvCdUFJZrpJiQ7wk=; b=kePs+Dk/AI0NmqYr7qQyVxJlqto
 7g3sZ27ngvGptMS60mrrga5DuIhr+DHd6TR6JazMLu2JRONd9WLtV9pEiUoHBoum
 dHHXb/Yk7CoZPsPAEKcnGkhrQQ2S/Ot7Q2elimyjLbOzqEg8TvLzBSVsQ4//cEUG
 r9Ovv65hLnZdgjn9Bv4s3vbGAQOyD1ijJQyzrUOGXcpCL5YYdPM/fmCNED7RNX8M
 agf15PdG5jmzVfS374OQoB9wstLv7Sb+NylQ8FWzmO/mkLYc6VymjAo8q29eliiH
 jD0LQwXCuHevZYhV533ia9mOlLW1OZE+2zN+dk0ZB5PTrReuZkSviGEv6CA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbhqqdgt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 18:58:59 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b2fcbd76b61so206874a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 11:58:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750877938; x=1751482738;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Fs6B1Ljf/Ylzr1lvB9QzWqwNCHwqvCdUFJZrpJiQ7wk=;
 b=JkOcLEJq122vol9bYzhcM10cg87QRNgxmfzpjZcfwgMf8bj1QFmb5Di5h85GrkZD9h
 Wa1irAbSqv/rxbYvNApQFOhWi95C5Fhgd2VuhJUXBjvmWj3fbfXSKNiT02iUkpy0os0x
 aXDCTBQ9F20VenzkTCfd1IiCoNkmzpbsgd+Rk5yTqWA02mzaKX7fDDROo13mOvWVToq4
 GncF2RKtwZvKX+2HuZFaGwy09TAw4R9xPfLJygDhjkW9CWBXvsBV7ZmoLwywcrAFsxQ1
 abDjnCEkHaDuTTi6QiPQ3B01WgcGZ0xEMGUHA6muDzTzyXEn5d/A4k4lk4cFdv9kwVJd
 Y+Ig==
X-Gm-Message-State: AOJu0Yxd6NuMUfYiIHVd88iL4rTl6HXRPD6MfZAXo8TYY9ZxgXRqtzRM
 IeXO6pyW4hGjWW8DCgdoKohKj7Qy4UzRPCTufRNy8c5rQ6VW+f58IECii3aNt9GLUL1UdO8SRN/
 l3bhd3KCfSUTWmsmduwRBRpmxlJaq7/+FfTarErMKjVtMp8XdIteuyX3oAOTWaX8i6eDg5A/S1Y
 7R/T8=
X-Gm-Gg: ASbGncuMLhtbQKE29hj9bQYYAXUrsVyzC9zUq0SGIP6rVd5DZI7Gm6Qf/2r2UMQXVBi
 pORgWtqpyblMO49SDXibRnNwsMiQpR3IBAeq30A80y6cCw5+FidECv29ZX/HE6K46Ol4JwOh0H1
 9AQovDwUFGA1BU5r3FSAIqeF8QBMv6ti+r4qSgZp0W8K1Zgwl1Y/BcP8r+tU8ebWEucXH170/bh
 aQtajtdEUPJedo403SLTw0ThgZlxHuSLmCyKg8KDrdzBPpYZJJvpCezLFAV1kWfQEbfqo3xOfFV
 EX/oAUWbsIEhBPZ3QmEZfi0lIkZR1SLM
X-Received: by 2002:a17:903:2bcc:b0:235:f3e6:467f with SMTP id
 d9443c01a7336-23823f97264mr79546525ad.2.1750877937684; 
 Wed, 25 Jun 2025 11:58:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4LBvG/d/JiDQ3oTmnTEUEQGkYF7zUCx1h2gczvffJ7ySJIZMuymwWPjvyB2PmsV21XU20/A==
X-Received: by 2002:a17:903:2bcc:b0:235:f3e6:467f with SMTP id
 d9443c01a7336-23823f97264mr79546105ad.2.1750877937283; 
 Wed, 25 Jun 2025 11:58:57 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-237d839da52sm144521145ad.42.2025.06.25.11.58.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jun 2025 11:58:56 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Rob Clark <robdclark@chromium.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 23/42] drm/msm: Mark VM as unusable on GPU hangs
Date: Wed, 25 Jun 2025 11:47:16 -0700
Message-ID: <20250625184918.124608-24-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
References: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: SOVuhgJFRt75H4EGHt2vzsvIPGT3H1AP
X-Authority-Analysis: v=2.4 cv=Id+HWXqa c=1 sm=1 tr=0 ts=685c46f3 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=DhdyfM8_h7Qj4WYt2N4A:9
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: SOVuhgJFRt75H4EGHt2vzsvIPGT3H1AP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MyBTYWx0ZWRfX0SjBSzZsMVPO
 PGNM3He82ec6rHVGM9z6EzeAmH9t/1Q05GMj5YiRtbL4R4/NogmWQUuCvIXhtW+sImR2KS0ulYJ
 aKBsvZGsReBtCUJn32yJ53o1Jp6aL4GuLyFrvbLw6NWwK1EdEK++pRVwXq+YlD4VlkQeZ2vYPi+
 aNYXqeOJU8taiU+2yc1Eaj1DOV6vvlqqwjw2yy9i/WIfH9Bb54bdh0h+wEmoHKBdzKSLGk+34gP
 x4qPm6yvOKuhVk5rvnX2q018BPL8Ojy33J5ZXlodaICb5XFucguoxxQoo6lX127IwirGm+58tmw
 GnN+TqnjMh0wP0wVWlCiPwJL1RMKVjLPj5NXx0tzBDBy+CwoeFQtzHrgRyJCBN8wvnq0fzkCTRL
 zlFI7i89cYMXWQH5tsepxaXTRRRnw4s2ZaU/mU+wZXJR15Ig2xG4UI8wtuG0/t77e1fX4hrd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 mlxlogscore=999 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250143
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
---
 drivers/gpu/drm/msm/msm_gem.h        | 17 +++++++++++++++++
 drivers/gpu/drm/msm/msm_gem_submit.c |  3 +++
 drivers/gpu/drm/msm/msm_gpu.c        | 16 ++++++++++++++--
 3 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index ec1a7a837e52..5e8c419ed834 100644
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
index 0314e15d04c2..6503ce655b10 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -386,8 +386,20 @@ static void recover_worker(struct kthread_work *work)
 
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
2.49.0

