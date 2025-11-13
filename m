Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FDAC5A8DC
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 00:29:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7607B10E965;
	Thu, 13 Nov 2025 23:29:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KvOv8OPQ";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EvkaeHpO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EF2910E964
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 23:29:52 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ADMaWq61611839
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 23:29:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 DbqxdCr13kMbVMqadmJF4CnX3GwPJlihXZxUWaf1cSs=; b=KvOv8OPQjRl0Yk6N
 GG6XOAzcr2BgYjbcy3Hs5UNvU9iudmZVNrf3cQqHxVsQKx2A7PqUJRSKWEgRRLTF
 XLIOfAXzjHxgWMwdeuhLCThWdMaEJ+tLP0qgmN7G+qWSVjwQtpkL8ZAhLjhz73lN
 h7cgTQz8EDgf/V1K+WSOaWCz6z+hLrSL+RZuaNpSUvQ8IsJTLbtBQJijIMNiB9qw
 xjqSh9DVrZu+8NeGAq8aD9usSriFtPAOCOwQaiOrOfHxUuEqrrrbDhZF+4YJL5qb
 9xS+KMZ38VU++4KwUPUNNkpSvydDd06oWAUx55m1StxImY7kVw1mZ3b9LHpKPgJ7
 U8qA0A==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9bg3xr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 23:29:51 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-b99f6516262so3534438a12.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 15:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763076591; x=1763681391;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=DbqxdCr13kMbVMqadmJF4CnX3GwPJlihXZxUWaf1cSs=;
 b=EvkaeHpOPHmMO7T9wmc6huyeHnvRUmA0uIipu2EaxB73RfFbqDQjxEpiohOl8Xzxpd
 lkNfkjTJ1Zo2r9cLUDIQPAlezlO8Ih4F9VBOG1Vt4tF08rbmIWQJj6LL6oeeJvetNwIV
 yV7f1hZ4jUuwGelslWka/jkK80BVxQZM7pS8j5BCOflaYvp7b4xZJjyfLHogukNN0Yxc
 KNyqZpctosfZxBvafTL+H71Q77jCHcZSrdFaUFGzN3tTyof3b3lO9hkEqyIcNGBU1gij
 FRr4GPhxVDK0UoQJIbl5EY7MmY8OTOiR5bChSVJZLamM2p4MAohyF+7xCARp9izrRqAB
 3VxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763076591; x=1763681391;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=DbqxdCr13kMbVMqadmJF4CnX3GwPJlihXZxUWaf1cSs=;
 b=PxZKMwkYVHWhIMHK3pvEACIHz3taSTfrhd9Ck7EoVPSrmFvHZvvQxmQ0bylgJqV/kX
 CsLBzmcf2IUW1ZWbCZfvdku3h4M9ZgPbwJGCd5Zsmah0tGuPFKu9t8/SllY5xxVjvJNW
 AfIRXNrKfn+Ws9KYjtM57icQakTybFLwppr9pYru9HEQXTiVWYim9x88OnAw2+7QnmMY
 eQUZ4efNHuPMQKHjGKyBkdXuoKBZg4Tr3w1RqvzWfs0JRk2tK18qCB/eDQ+CjoKeVrsi
 pO0TzEHNa2ewVqIli5NKOgj4J8c2SSWyR1l8NeQKMndivutz4OsYXXK4YvqftiniWCus
 RBuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSEW4797/uGUOxw2ZARd4kH2YGKHg+wZh1jO848aTNvwclaWk/d0kml9zzWia0V6QdCr/fZMAPMGE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwLb0LXo/VWO8hwlFup7bK6krNk4z7brmdBU0y2YM4BIdikapkO
 dVQQbJjRr0Me2MYejXLr1X0Z4MfEamoWKIsiL+N85TAByzqQlhqoISwLCcbjNIqfEjxBT8JhHdU
 4kHz9niFcQ3yTtiwsDLDCjCObCnsqDvLL1VHOoyED8LhRmRWZ5fp0cEOOxjds6Shc7qfzJ4A=
X-Gm-Gg: ASbGncurOTU6t/6FNkj+MMtszHSAbrEMbWAqiszvsaVJTWmivUimO5LvuZ6szBpPapY
 Dj2WLSzjImCARs/vycMRyTtyfGtsNf4ajeImooVY0ra5Mh6/YdKJ9j+3THr/zjCYwnvs7hOK0Ei
 ShQKxGl+fkJ7xZkY5Wpv19RgBfg0WmD5cWO1zouYQCMaASJE7zn1pcYF2y7AhUISEq3eTW0MeyO
 h4aiuiB3LPSWMDLdNYT0oPwktTqOCvm1tqnjgl2JLflFgEo0bs9cfqL4Yx18alCpUxmKnRmrKsB
 eSL3i/oWC213HCAMPSXyn+VBy/pmDYVHO9PcfiYEYtEjtTLikwnZFJnp2TmtriL8RszL9hrnSRr
 lShHfWBPNhurPAipC4uGhd64=
X-Received: by 2002:a05:6a21:999a:b0:34f:ce39:1f47 with SMTP id
 adf61e73a8af0-35ba1d8b9femr1418069637.38.1763076591284; 
 Thu, 13 Nov 2025 15:29:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEeBbGRvCFU+UB+lpyJ3viuKd80lm9qg/SW6FqrTQPCqEVq2jmUv7RyRXNmK9UZPN5Ft+Hy5Q==
X-Received: by 2002:a05:6a21:999a:b0:34f:ce39:1f47 with SMTP id
 adf61e73a8af0-35ba1d8b9femr1418047637.38.1763076590803; 
 Thu, 13 Nov 2025 15:29:50 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-bc36ed72cd1sm3049486a12.11.2025.11.13.15.29.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 15:29:50 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 04:58:58 +0530
Subject: [PATCH v3 01/20] drm/msm/a6xx: Flush LRZ cache before PT switch
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-kaana-gpu-support-v3-1-92300c7ec8ff@oss.qualcomm.com>
References: <20251114-kaana-gpu-support-v3-0-92300c7ec8ff@oss.qualcomm.com>
In-Reply-To: <20251114-kaana-gpu-support-v3-0-92300c7ec8ff@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763076573; l=1701;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=P0TGR9JNBdFdJf9lbTMB3me/b527sl6CR0hvyTZlFRU=;
 b=I95TcxJrZo5IfCg2YLag6wnr+kCPKB/xqUAfc8bUf+PfKRdx17k8+cUdMO4lgWu4+f96+05+p
 nU3+6ArVQ+8AtFUkQwj2m6kgMzzvLE2RHpuoKjwRJqkhXIvMDr5t/LF
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=aJz9aL9m c=1 sm=1 tr=0 ts=691669ef cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=bBR9okFf-Jgdumx6fEkA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: A2mDbqbct4Q4Pf1oGPVh2exigy6w307Y
X-Proofpoint-ORIG-GUID: A2mDbqbct4Q4Pf1oGPVh2exigy6w307Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDE4NSBTYWx0ZWRfX7WPa+D6L2kob
 ZYgAlnykOydyE37lcnyfGOIZQqgAmhcEeNE4v8wDUA/K8DuK/1CixKHtPSTi71+brkLcK6wOMoa
 7frgGm/T8tE7vbR/bKUoTvR3/SUbMKpiM8Qula+nPSyXp0uvxR95r7WjTmbdjmb5scbeDLVpkJH
 LhDgTGm+193k4QFaF6HtEgzl+HK1/1BWTPLxlLt1ttz60MKAp/Kiw7DTCHA2BGNIldKBAtLAV6N
 R2rfty29Xzp9/N36TlsUMA6ZGBiCTakCFoxRlpxbqg33PdXFX6at5U1OqM50aOvPKkrBIPGnM4X
 ha1AvnwPy5yoVZNAUGxX4Vqn+dqfKOWO8O2joJRchf22K4+mjdy4jePRG2S+DmW9icjJO4+z1SQ
 vi3TVlBq66OJBxgEkkrKxCuYTtCN7w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_06,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511130185
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
index b8f8ae940b55..6f7ed07670b1 100644
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

