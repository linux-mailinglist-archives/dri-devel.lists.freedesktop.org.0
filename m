Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6C7C68495
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 09:51:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFAEE10E445;
	Tue, 18 Nov 2025 08:51:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BGCKO1TT";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C0xzEWKT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23FCD10E445
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 08:51:34 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AI8DqPF2193872
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 08:51:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 n8PgB48It9l4+bkgeIQSRAK2mU0wwCQ3DP0FmhMvQ2U=; b=BGCKO1TTAyU069p/
 i4rb15w2jCE/nVofuquIXNRUsAqggCHFPmaCEjpn6NtGJYbXj4aJf7ezqTXvf0H0
 2aYhQ13cJNQxscyaDZn+zuEuAGFxzVKJi8LoWki9L2Ex1Xr9gQPTrCYDcyUS5Vvo
 UfIzKwpQMphc/UrF7lKMV2kwV+qvZS5c91nU3tDte9O73C3LPKyd1nO8Nf2bL3F4
 CqBYJgzeHVjdhFR2sUfwZXRrRhB5szA/oYEjgcbBst4y0crwdxl1OkKynAXXmqvf
 7Gp81+i7JsItbb2Mp8ryR2T/j8UnFWnI1dG/HZ7GakP6HxYbjF1+sWtJcvEANy58
 rJefgQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agn3y83dd-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 08:51:33 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-299ddb0269eso27165555ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 00:51:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763455893; x=1764060693;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=n8PgB48It9l4+bkgeIQSRAK2mU0wwCQ3DP0FmhMvQ2U=;
 b=C0xzEWKTW0b5CkBJTqQJTY6MuUvPc+SbxSE4YJ3cCSyDAf5R6ej6m3IRjXpkjPP2zC
 3anzl8RM/biozC6EquZK7hco7CQFh+oHWHPgbhIbUdrYfPNZ4jCADhB4EMHiYNf8qESk
 Ho/XprBx6fZfOpz9r28ATzQV6NYGMPl/yp2minhsruDcztUrslXi0yl3JO+wPmVPnsC7
 jq3eMXDC2uwtwmnFhjgK6PhnAl/8/WdVijaiZrn0EL8UhgaKU+3YtWzfIftjrOxreS97
 aij0fxCAXfVEe1b2Jf0pBFchU4skSzW5Lkiv0/K58ZWbVOCfJb1H7dPdqFx99sPYSdlf
 jzdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763455893; x=1764060693;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=n8PgB48It9l4+bkgeIQSRAK2mU0wwCQ3DP0FmhMvQ2U=;
 b=hJjM7QsA7hmgtbB7YO3n9SagjcCGkv80n5Lg0XF1llEOlY7e2Gb2LivFDh5DMX0mRf
 /Aep3OH52UXrptZ437T2BIjQYMNme71Kb20Sg8YcZaqubOqNxwgo3TQMN1G65WXtVDsq
 BX7yyXwNf1NGC5FwxVbiT04kcyF7PA3UvyKXiOBOC4/LLFEZuVAMPaLSGleiOq501ZiW
 RSiFk+I6QePtmbW95IvsIkg9nEUcJml1S8yIixOjhMKuO0omNN7vH40ItbLrC2tGhti1
 ZALW9qXHyiEN20AYLI0Yo60rlDpLHt7Nlc0LxuOu/bpfsxi68mmik2391vZRwl5yJzI3
 qZ0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoXlLqaGzthgrarKvhjbVGMgWgk5NhuGiCV3VRLBS/kct1IHY1PO8KXhXmi9fzAP6yMJR4HwsPys4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxIS8RzyPTMSZ93JRTmlkOt1NJ9dyuPhis9KQW/IaGAMQmTvPO0
 WEc9fj6lSh7MO4HgcMbyFcENtAE0l8UNVr3sq56zFUz42qHQYCR+PHxFA0sYQc3DkVR4wRzWZQ9
 Tm1qudUruAEraawNACXD2PIu0kcXpE3mSIFD+yE6XTFvwrCHxsZ+CD/iswXYNo1Typux27r4=
X-Gm-Gg: ASbGnctiPhZ5+Ci6ady6NfPc6HlSiBTWU0JxvSkVBBjc210z9Qh+TwPeJ3ByNO/PWdZ
 itFTN6I0CIp7o/3I3Eldqcr7RQtQpz5HkUmL9yE7i2j3p6OsAXOB3N0kSJ6Csf39k2oCcuogHPb
 sLoq0qpK4NWWvhHWzkWnwAYYMA6izSCPACTR6cM6L9JiI0IHbfyPASKzxZMqQyEdAfM0rIHHM/Y
 Gt83oWSbeWD3ibnc7xbvQoKdOHIIFwG13ZEHkMJgbSlsY2M0U1zi54nh+ZKDtOXF1xoh6ZjSSgB
 TBbbFvzLJFkACIBPllcPcKQAua70h02ISQilww0n6VAeGD2qEMdo8K/L7hBme1K8tsMEpM9EwGP
 hoNvtVll5Q3WxNkspT1NRWhc=
X-Received: by 2002:a17:902:ec84:b0:295:269d:87cf with SMTP id
 d9443c01a7336-2986a6b56a9mr192322545ad.5.1763455893009; 
 Tue, 18 Nov 2025 00:51:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG/1w2jno1zLyed+Q2GzLtuvbQPSdeph5rJVVJKuzROZehmddk/3K1qPE4B4EcyW57S867iOQ==
X-Received: by 2002:a17:902:ec84:b0:295:269d:87cf with SMTP id
 d9443c01a7336-2986a6b56a9mr192322055ad.5.1763455892479; 
 Tue, 18 Nov 2025 00:51:32 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2985c2568c1sm162910695ad.47.2025.11.18.00.51.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 00:51:32 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 14:20:29 +0530
Subject: [PATCH v4 02/22] drm/msm/a6xx: Flush LRZ cache before PT switch
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-kaana-gpu-support-v4-2-86eeb8e93fb6@oss.qualcomm.com>
References: <20251118-kaana-gpu-support-v4-0-86eeb8e93fb6@oss.qualcomm.com>
In-Reply-To: <20251118-kaana-gpu-support-v4-0-86eeb8e93fb6@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763455868; l=1701;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=U6hCxZZPt/0oNlBV0Loqbw+1ONR49vXzGV9kkJKQhe0=;
 b=C/pQ042VX0YsNIUePu8RhYDT4KrYwopA1aJuj7t79NKSGb6UQ5wtIm4sVjq3irgGDqFwMiXFh
 6bDOXlnFvndDYd0I6mseZ7fkw9MQk6CD38MF/bxLZlvdHiqWoo3qp2V
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA2OSBTYWx0ZWRfX89Oen2/+BivC
 or6D+ChL5Gsuv3oe7Qgc2sVfS+nOGiglvCRla6uorRs5OfsSk/REyfTFhxQFwzDDadHdNuNk+Xt
 1tYmsmt+uzcp0y33bLg3AZfpAPOlTabuiotI5rturvEIsfRpbK9xQYUbfzt+5C7j9PrpRR0lGNF
 PADQM4A+xf60YrBzOj8az5gt3BFizezOxUMS7y4IdWmGbVAeVhOlu6RYXj3LaDUkAZA0D2xskcE
 +CWGHu78gE3HotKkdDClUKA1mjNb8S2I1137ffP+IurP8cO2sdB7Mnd+NwKusasCkeR6H+0LmTv
 HPLTbsUlu5Oq2roWXTag+n8gsjB9fGQEgU3S/aPF1QZgxcQffNPxH9DSp2HbV93mqTMo7ua7g5i
 ZUCnQl5irfOHVXnbGA9rvkDQ685J/Q==
X-Proofpoint-GUID: TSARpPUHnRXrLWjA_U7Yzx9lqay73V1j
X-Proofpoint-ORIG-GUID: TSARpPUHnRXrLWjA_U7Yzx9lqay73V1j
X-Authority-Analysis: v=2.4 cv=FtIIPmrq c=1 sm=1 tr=0 ts=691c3395 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=bBR9okFf-Jgdumx6fEkA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180069
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

As per the recommendation, A7x and newer GPUs should flush the LRZ cache
before switching the pagetable. Update a6xx_set_pagetable() to do this.
While we are at it, sync both BV and BR before issuing  a
CP_RESET_CONTEXT_STATE command, to match the downstream sequence.

Fixes: af66706accdf ("drm/msm/a6xx: Add skeleton A7xx support")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 779c1da7c46d..e6393ef0fd78 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -224,7 +224,7 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
 		OUT_RING(ring, submit->seqno - 1);
 
 		OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
-		OUT_RING(ring, CP_SET_THREAD_BOTH);
+		OUT_RING(ring, CP_THREAD_CONTROL_0_SYNC_THREADS | CP_SET_THREAD_BOTH);
 
 		/* Reset state used to synchronize BR and BV */
 		OUT_PKT7(ring, CP_RESET_CONTEXT_STATE, 1);
@@ -235,7 +235,13 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
 			 CP_RESET_CONTEXT_STATE_0_RESET_GLOBAL_LOCAL_TS);
 
 		OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
-		OUT_RING(ring, CP_SET_THREAD_BR);
+		OUT_RING(ring, CP_THREAD_CONTROL_0_SYNC_THREADS | CP_SET_THREAD_BOTH);
+
+		OUT_PKT7(ring, CP_EVENT_WRITE, 1);
+		OUT_RING(ring, LRZ_FLUSH);
+
+		OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
+		OUT_RING(ring, CP_THREAD_CONTROL_0_SYNC_THREADS | CP_SET_THREAD_BR);
 	}
 
 	if (!sysprof) {

-- 
2.51.0

