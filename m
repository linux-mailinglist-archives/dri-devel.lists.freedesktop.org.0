Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 937FBC166C6
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 19:17:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B33F510E643;
	Tue, 28 Oct 2025 18:17:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JQhdfWHY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 566EB10E643
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 18:17:16 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id
 d75a77b69052e-4e8856210b3so5513151cf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 11:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761675435; x=1762280235; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bu7Zm+c4AQjYkV0J+aBfl0vChbgcxRDezVwbj3H8d7A=;
 b=JQhdfWHY4zSV+uzTlgFPoy+2xorLQM6788p1iQIR5jpbKHeE2WQIsjHhZX2R/FaD9b
 86Sdl5ejPvfV3FD0fEqIdFnTTgCI+dBCYCcX3LcJpCxaEYHwm5CitwN2Dw0VGAolynqp
 WZoXrr2luU6kCs2rbl2aiyYw00lUS20Y7mc09ekgIgOMmb+HIbscHdMtnCzSEfk54+6b
 CESUkeV30q4aovzORER1c/ui0opyjkDXEm30uSsy2PXXeJIXN3BjLAUxffvE7Rbvh8wM
 99Gh+XSeCLxYGv9kF7oKb0SAFoGwiTXZ21Go7NoFwG6Ddik7CtycpakIh2sWrjF6vqF5
 TEsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761675435; x=1762280235;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bu7Zm+c4AQjYkV0J+aBfl0vChbgcxRDezVwbj3H8d7A=;
 b=X0KAXBSRLiRHZqxOUnIAcW/OUo471REL/zOcMnhqS/U99MrZnfT9zsJMkZeequ/5dM
 v7uKYExBbmuDZkSAGTDSAuqpbtCz4MY4khEvlA/ayPT92i3fUsm0iILqr667N+6TH8ob
 aZ2g7T4IFCmywzrBJFwA9lNBaiXGKKKqO8VYBV8ChuXqrXzPqddL9VAxBFPklEpcIRV0
 dOURIg8InumU2UOIM/eApxPyzW8r+aX5GlqXyHpUO3CbDXBkhRupYb0KJGjnRBGNkUek
 moQ3PPcI4BIqDgtmBjW+KpgZAioE+oaZ6/4CqQhzwQpSZhXFPxqg4nxc7OY+3//gN/tM
 vrjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVp85hZWB3KYSQbDb935A5gQUJKaR35ihH4kE6QbIAYXgtepOg6bIdOoWYxnPC9C1CVNKHJM4q8D10=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywgs50xbVyenbzgHVB3LgDLMroqzo288AGfwZc0e2RKUhF00jIw
 fUP70wRelrjW9l7zd2RzEdq1pGY4uuOn8UxyHdOQCf0qStfFMPPgeV0+
X-Gm-Gg: ASbGnctZGh1jL99jyySBZPhe1JXA+pBl/9waYiGTIfFRbUJp3ay4lBelj5q/rX7v5ek
 58+O+1riAyN0OInNaOQlj7chBNW2Qgz8gu2rPuuFdp7KRdsyIR8x+qwFJVck33Ku8GWxiehHIUc
 rmfzGwijbhCH8Ln699VSNOXzCJTKnRuklzKiIXVT/NQq/3uC2weT33S+KSxCP/Uu/rcBCv7YsNQ
 hgoSrL4DCWSfaEKhrMSjTHX+0FkkGO1up82+AgBZn2IJWng7a2FxrMFcUJ+1HitkL3EAqw/zkxX
 inQuUObwnrdgj2iaoUYfyGF7D5uiKsMhebgQa1sTRoOr5H488GToi6YA3Gdb8O+OYRcPYxf1Wfw
 ten24alDP3J6GeeZt5rSvU+cuBx3k9BtiqYl08fE0ZiiqB9LNLEgrcpNARaxXR/k0P2c=
X-Google-Smtp-Source: AGHT+IENPmmuO9ahxXmBAZ5ej8Oe74VKpSyCg2CwVQ2KspJkv4cb3AP6ibXmqXntU3seZKRkTjBdBw==
X-Received: by 2002:ad4:5d67:0:b0:77a:fa17:551d with SMTP id
 6a1803df08f44-88009bcea29mr151616d6.4.1761675435141; 
 Tue, 28 Oct 2025 11:17:15 -0700 (PDT)
Received: from lucy.. ([67.243.142.39]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-87fc4997e56sm81140356d6.49.2025.10.28.11.17.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Oct 2025 11:17:14 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: Connor Abbott <cwabbott0@gmail.com>, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH RESEND] drm/msm: Don't sync BR and BV before every submit
Date: Tue, 28 Oct 2025 14:16:21 -0400
Message-ID: <20251028-msm-less-bv-sync-v1-1-6527fd02c52f@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761675189; l=3477;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=5B/tyXXNbztReQJ/afPZcg+Os2/bScCFHYAx7g9KsyM=;
 b=gDev45SDt2WD6lFN2WxncUZVzICSsgh7zVUNFwfbSqkfv+Xq8GQd9/WxiThtzubpvUfQiOvRb
 6PH9hK80ZbcChFHSfiB/iugYyqo3NL+uw/1qLezaKxzCuxkiLQkwC1j
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=
Content-Transfer-Encoding: quoted-printable
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

We should allow BV to run ahead of BR when there are multiple submits=0D
from the same context. Per the Vulkan memory model this should be safe=0D
because there are no implied execution dependencies between submits. In=0D
particular this should allow BV to run at least a frame ahead of BR when=0D
applications render direct to display (i.e. unredirected rendering).=0D
=0D
We also shuffle around some of the synchronization in=0D
a6xx_set_pagetable() to better match what the downstream driver does.=0D
Previously this was only different because of the extra synchronization=0D
before a6xx_set_pagetable().=0D
=0D
Signed-off-by: Connor Abbott <cwabbott0@gmail.com>=0D
---=0D
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 34 ++++++++++++++++++++-----------=
---=0D
 1 file changed, 20 insertions(+), 14 deletions(-)=0D
=0D
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/ad=
reno/a6xx_gpu.c=0D
index b8f8ae940b55f5578abdbdec6bf1e90a53e721a5..794b79a6a4a1940c84709c32e89=
5b62b97f1ac5a 100644=0D
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c=0D
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c=0D
@@ -216,15 +216,9 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_g=
pu,=0D
 		return;=0D
 =0D
 	if (adreno_gpu->info->family >=3D ADRENO_7XX_GEN1) {=0D
-		/* Wait for previous submit to complete before continuing: */=0D
-		OUT_PKT7(ring, CP_WAIT_TIMESTAMP, 4);=0D
-		OUT_RING(ring, 0);=0D
-		OUT_RING(ring, lower_32_bits(rbmemptr(ring, fence)));=0D
-		OUT_RING(ring, upper_32_bits(rbmemptr(ring, fence)));=0D
-		OUT_RING(ring, submit->seqno - 1);=0D
-=0D
+		/* Sync both threads. */=0D
 		OUT_PKT7(ring, CP_THREAD_CONTROL, 1);=0D
-		OUT_RING(ring, CP_SET_THREAD_BOTH);=0D
+		OUT_RING(ring, CP_THREAD_CONTROL_0_SYNC_THREADS | CP_SET_THREAD_BOTH);=0D
 =0D
 		/* Reset state used to synchronize BR and BV */=0D
 		OUT_PKT7(ring, CP_RESET_CONTEXT_STATE, 1);=0D
@@ -234,8 +228,21 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_g=
pu,=0D
 			 CP_RESET_CONTEXT_STATE_0_CLEAR_BV_BR_COUNTER |=0D
 			 CP_RESET_CONTEXT_STATE_0_RESET_GLOBAL_LOCAL_TS);=0D
 =0D
+		/*=0D
+		 * Toggle concurrent binning for pagetable switch and set the=0D
+		 * thread to BR since only it can execute the pagetable switch=0D
+		 * packets.=0D
+		 */=0D
 		OUT_PKT7(ring, CP_THREAD_CONTROL, 1);=0D
-		OUT_RING(ring, CP_SET_THREAD_BR);=0D
+		OUT_RING(ring, CP_THREAD_CONTROL_0_SYNC_THREADS | CP_SET_THREAD_BR);=0D
+=0D
+		/* Wait for previous submit to complete before continuing: */=0D
+		OUT_PKT7(ring, CP_WAIT_TIMESTAMP, 4);=0D
+		OUT_RING(ring, 0);=0D
+		OUT_RING(ring, lower_32_bits(rbmemptr(ring, fence)));=0D
+		OUT_RING(ring, upper_32_bits(rbmemptr(ring, fence)));=0D
+		OUT_RING(ring, submit->seqno - 1);=0D
+=0D
 	}=0D
 =0D
 	if (!sysprof) {=0D
@@ -444,14 +451,13 @@ static void a7xx_submit(struct msm_gpu *gpu, struct m=
sm_gem_submit *submit)=0D
 =0D
 	adreno_check_and_reenable_stall(adreno_gpu);=0D
 =0D
+	a6xx_set_pagetable(a6xx_gpu, ring, submit);=0D
+=0D
 	/*=0D
-	 * Toggle concurrent binning for pagetable switch and set the thread to=0D
-	 * BR since only it can execute the pagetable switch packets.=0D
+	 * Set pseudo register and get counters on BR.=0D
 	 */=0D
 	OUT_PKT7(ring, CP_THREAD_CONTROL, 1);=0D
-	OUT_RING(ring, CP_THREAD_CONTROL_0_SYNC_THREADS | CP_SET_THREAD_BR);=0D
-=0D
-	a6xx_set_pagetable(a6xx_gpu, ring, submit);=0D
+	OUT_RING(ring, CP_SET_THREAD_BR);=0D
 =0D
 	/*=0D
 	 * If preemption is enabled, then set the pseudo register for the save=0D
=0D
---=0D
base-commit: b5bad77e1e3c7249e4c0c88f98477e1ee7669b63=0D
change-id: 20251027-msm-less-bv-sync-ab03721d0a3b=0D
=0D
Best regards,=0D
-- =0D
Connor Abbott <cwabbott0@gmail.com>=0D
=0D
