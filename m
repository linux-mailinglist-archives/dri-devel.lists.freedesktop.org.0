Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC27ABAB8E5
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 07:51:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09C0010E4F2;
	Tue, 30 Sep 2025 05:51:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="F8t1+gf7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B614E10E501
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 05:51:50 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58U4IDj1017910
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 05:51:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 JGAhTN0/MK7tzTuxs8B6KT3k8TvrrLVML7xGTqGXHy4=; b=F8t1+gf7Zqt6bPeW
 PUh6Z+R8qhw+F3Q6PJBiM1Qzqep492fR6RUsliAjvRSTe2p+DT8EWB4o8IoUfzbX
 ELfcAiG/BIPjRER4lCiiKrn/rvZ5PYhRIhGQZNuLn8R91AcP/cXyGNIgeWNE8dxs
 25tjE7KxvLzfYqxDxtzqOSXShqJx7BFYjQInpIVuDGGdhZoqAf162rHR6fwmzV2N
 tRj7yN6UnO2QXjePepPK4jqNlDisGllvcohoCyJlxYc2YOgHZBmJt6ZQtmItK/vi
 3/CghC8gwf4n209TuaIhRLcy5fBu6e0jYVSxDHpwXQGnoZwZoPnPNhLyTAC6FRht
 WInjUg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e93hfj38-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 05:51:50 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-3352a336ee1so8480850a91.0
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 22:51:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759211509; x=1759816309;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JGAhTN0/MK7tzTuxs8B6KT3k8TvrrLVML7xGTqGXHy4=;
 b=AHD7lucSsU10fS5/bSJRLNFC04Wn8tsm4ABpv74jCfg81JdTtQSzTf78DcLrNSAjsS
 ufCC9CpxvYT294Zd/TqVvTh1ysLzm0h+YL8+DBYHgSN1IsVu7Xv3su1cwnACqZCh9/GY
 gSQONYY+EIuxZTOMhLNC3FYzoA6dNCKtkl0MzAK1TE+fhCcD9XNgopkPb7e+KfG3tho7
 cxQDfJceSGYcJwPvxpfabXN6nrkuJFXZPUZ7dtkcNY1yuI+v1+zNvi3w2hdwH25A6Kzf
 XDkWnFyX5lxzGDK2dx7qvohRbT91ktxOldl/8NtR71L6PyuVU2luebvA25oyBmDKVr+o
 Pn9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCULaoAnAPn2zINS2TxCUyfVS3hO2pSioEgh65pbvG3Yi/RbS2Cr6+HJHmBB1EvhNIKlli7MDK1ZdqI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy1jGSFVNDZjT0XKTFSUlxTft09xEbEia3CcE6B3JEIp+FJHF5U
 I0cKQh/3T590UoqDazGU7Ni1P95ph8MO7re55hljYL6ZKTTXY6FXX0F6Tk/5oy3Un6gYldLFrav
 lihe5CAU5oP+gYFB2aP/OHFFN62yKMHE4oo+812Ndmp+PQE+oSrOiFpoB1bxEz5+bs+VNcF4=
X-Gm-Gg: ASbGnct/UH72CEuCPEdorlkrLJr8p12AMBNr/a7+qgs6Mz3oX5BiFJLanoMbK7dIYi1
 x91OhsZ25OKgYJ2K5wivO+uzwejAWOGYWI7K99SR6ZfPswZQDfuEnrPTsqn0pkE0KEAt2U11drn
 B04yR/tyn9bbY14lbfiw44v5SzIxCk8gSirWLhA5TDZRIOJRmy5P0Rf4pTLyYJuPHVDROetWEd6
 8R3UMY5LumN/cgueqBqMDCFCPEUcSH9M+jfA98rhrTielj9xBTua3Bol1PAx5gSMEdtpu2YSCWp
 rvsCzaD5OkDP5vluCex7UAJgmXfoENn5ffNWpo2jLyA9NjIMOtwcUlOV7wBJaRb+IAhKfQ==
X-Received: by 2002:a17:90b:3147:b0:32e:7bbc:bf13 with SMTP id
 98e67ed59e1d1-3342a2e3881mr19323743a91.34.1759211509382; 
 Mon, 29 Sep 2025 22:51:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNHqe3cLZLc7xLZaXETZkTNHqotOqlcLKXPv0OIyQKyD1TA/j/7y3gfQe0rZdWjF2vIUaLsA==
X-Received: by 2002:a17:90b:3147:b0:32e:7bbc:bf13 with SMTP id
 98e67ed59e1d1-3342a2e3881mr19323711a91.34.1759211508854; 
 Mon, 29 Sep 2025 22:51:48 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3341be23412sm19029779a91.20.2025.09.29.22.51.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Sep 2025 22:51:48 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 30 Sep 2025 11:18:21 +0530
Subject: [PATCH 16/17] dt-bindings: arm-smmu: Add Kaanapali GPU SMMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250930-kaana-gpu-support-v1-16-73530b0700ed@oss.qualcomm.com>
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
In-Reply-To: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759211380; l=927;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=opy6bEwniR0m7S+4M/eY23ORBb6vxUsSguJ3ntFDLtY=;
 b=xkyLJDhvdjtv5zH0t4R2/Ltq7yscuVczpTRjglKxHmFMzhfzxDbXmuA1k/vXF8VuGXusE56aM
 ze5RwHw81B/DIw0VoSyDnGDCDBLO1lvaar1+Yi9NLQ4Wmw4MLZC2JXb
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDA0MSBTYWx0ZWRfX/ofL2l6zj1bS
 bIsfXPzygerh9gOXvxeVEJsRt2fMlCuu1DYWWOrZb8w8m2w4MXIbyQtAZnulvILl7L/xxeZoqtZ
 wiW1OdAB+0sPQZGRGb5daAyEoe8gxkbCdSF0l/1cKrF7R60/RfsAltrkipkctkXrw4H3nmTCawf
 sQr4hHlioU53J9nx3CgYEIxBqeI5ASQCXy/enDBhzSx3LW4VAA9UzjQuMiJGLC+Spm0DFQUch4x
 WWJCtWu74qjSsHyhhR/rbEc20CopIo99vN/SJvbyad8HPE7q49q1OsWPSsGH8CkyetKvd7wPJCh
 HyW9uDQEdjospUQ1JHIjE+vSDtIAWBdXFVCtKlPRVxjJDWRXelgZV2aQDRsibzKiz0dhO+xBvR+
 GbBb6atZte4QZoGo9LvBGQDiNZ+7cA==
X-Proofpoint-GUID: UtpkxZOyW_bpC-Nz7z-eFL9ZW7EhKAbD
X-Proofpoint-ORIG-GUID: UtpkxZOyW_bpC-Nz7z-eFL9ZW7EhKAbD
X-Authority-Analysis: v=2.4 cv=Rfydyltv c=1 sm=1 tr=0 ts=68db6ff6 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=-Mh53b5kj-Vf1dIxLVYA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270041
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

Update the devicetree bindings to support the gpu smmu present in
the Kaanapali chipset.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 7b9d5507d6ccd6b845a57eeae59fe80ba75cc652..4c68e2f2c6d776d18a2a306ad67718ef7396426a 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -88,6 +88,7 @@ properties:
       - description: Qcom Adreno GPUs implementing "qcom,smmu-500" and "arm,mmu-500"
         items:
           - enum:
+              - qcom,kaanapali-smmu-500
               - qcom,qcm2290-smmu-500
               - qcom,qcs615-smmu-500
               - qcom,qcs8300-smmu-500

-- 
2.51.0

