Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA2EB49A21
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 21:40:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 889A610E0FD;
	Mon,  8 Sep 2025 19:40:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cKbcjy73";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED49D10E0FD
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 19:40:14 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 588GXi6D006325
 for <dri-devel@lists.freedesktop.org>; Mon, 8 Sep 2025 19:40:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 gt3lMrqxrsh5HFvqVveVdKW5qqiAGEIrNSWV3HoZYpQ=; b=cKbcjy73p7A/LPdP
 +dQiSLTysCusJfzF0jeou7kvxcNAVuTSbWsNmPUmz7KGTjPQawqk7l+5KQTY1+F0
 Sf6AWAhz0vJT5ld5jE9FsCg7+zMK7Yth19A0WBtsTpQvAX3iZIDCHMklvcP5Tqv6
 0nsWnpoF6ES7VeT4o2Oa72ytl6s9I0TvT8+6IpkIr0cvaXiXkW/Rbjm58YHyizYh
 BhyQG5Na11XYYW8tCMdfuU+ux0v3WOu41oaO85mLZN0qjvtNR+73xdgj0ke+8/B4
 cwO1cHJMfC4FWAZxJmQnq259HYMG1FqBqRo1SIQ3C24IhIKII0Dwr0opHHwPeZQG
 CVbdBA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490bws5w9m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 19:40:14 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2445805d386so59688615ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 12:40:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757360413; x=1757965213;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gt3lMrqxrsh5HFvqVveVdKW5qqiAGEIrNSWV3HoZYpQ=;
 b=UlJzdYBCW198M8C8uz24m4zQkvD79ty+e/+66Sz2UPRzJnHMi3Z3ePh5y72K5qZprf
 ApY2PajGR34y/WXvMb90VuOl5uFkNi7XESA2cJ02YVsJL1fzwLyPZJNV9N/+UrumJrtt
 sk8bWUlgmKmIJB1jY90l0O1nUrxfBYokvFqeUGqU97bsbVhpJeFJMKpOW+z/6DmF+WOg
 G27z0njQO1+dK6ie9A2kuhvhm1rXHSHd9gpkebcAxPCopo9oMXC7J68FLquWdMVgm3+l
 c6UGJsnDRPBCS4b/TTOQFQpszcTuk1EGDfeQkE5oQE+R4hyh61Frxa29EyW6iKYmNcqH
 WM2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfvYfBUq6ydWFuTaXY3AC57whP9dup6znmvQqK/ArAWOQPKcXX5lsYt0pAhbIYGEyp7ZlvYOdOM6M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxPm9W0zeNWsTPkFGuzBUPWPTU8C7fatYGcveYW9JFhtU+kJ8FP
 W9WrETM9CkI1ZaARO8r85YSkMlxeurWWlJMWXGcs7EOYd1rBsAC/d9/2Yzg31onc1MoeqU3IVQb
 1F85fDphYZryvzBxJuUmk7KZ/iJLXGR+eaNbuAFatypUhFm/ger5NApoRzGCmYEvyJGpncTE=
X-Gm-Gg: ASbGncuWjtOr72tSF8tET/MQQjM47CaY2a6Ubtg0TLyql6O7PxGp2olszxMk1gCHSlW
 +4P0RSxeAcc7Bigew7Zx1SoOtgJB6PKwXW8IcPqvL9h4UtssI4hWLd7x47n0ZrdZXZhyncf6AiV
 lm6TJj9IlKEy05jHUm51bek41JdnbG0aX6I8PN4+Gam+qwo092IufepWZDCikQ2ayJRHbWisSMX
 y/YNFp6Joar32djU5DY5Yqb3j6iw1ReNjjoP/M1aeqMTxUFB1I7C83zhOjRU4DtLU+FtzT6MjT5
 TbdeFPCxtJxfv+F9jKhgEuN+dtL+rJN4nwMr+Fs+VNf7PjxR5dWzvFy40x1IGpLv
X-Received: by 2002:a17:903:1a0c:b0:249:3eec:15bf with SMTP id
 d9443c01a7336-25173118fc0mr96729865ad.33.1757360413547; 
 Mon, 08 Sep 2025 12:40:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjqeusIpL04rY8ls8FwSDva5Pe9CV1TXx4tgUoWYbubTFCMLO7Q0B6W23F5L1gZoCDbDDvPA==
X-Received: by 2002:a17:903:1a0c:b0:249:3eec:15bf with SMTP id
 d9443c01a7336-25173118fc0mr96729515ad.33.1757360413073; 
 Mon, 08 Sep 2025 12:40:13 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24ced7ea5e8sm104008475ad.104.2025.09.08.12.40.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 12:40:12 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 09 Sep 2025 01:09:36 +0530
Subject: [PATCH v5 1/6] drm/msm/adreno: Add speedbins for A663 GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-a663-gpu-support-v5-1-761fa0a876bf@oss.qualcomm.com>
References: <20250909-a663-gpu-support-v5-0-761fa0a876bf@oss.qualcomm.com>
In-Reply-To: <20250909-a663-gpu-support-v5-0-761fa0a876bf@oss.qualcomm.com>
To: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Connor Abbott <cwabbott0@gmail.com>,
 Srinivas Kandagatla <srini@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757360399; l=898;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=uzPVmN95UYA3m4eO5APKZbdkhOvUBX1OERZwHXJ9QPs=;
 b=2DYkGp/UEYjw1rxjpzCBGWBOfgtQjv0WWe52H42SW/jHnoiESuLk5OX/bOjRguHDDaOhH99Ck
 zF+SzknO2X0DkRR7baMmQbI8lbEfJ2BsQEJwiQPu9s0NvgMYJLYWhL3
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: FR8A_C6YC3hKm9AsuUK5xNDVA66kkVnJ
X-Proofpoint-GUID: FR8A_C6YC3hKm9AsuUK5xNDVA66kkVnJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX67PKlWXjBvB5
 /Q0DNOJtvWW0/5XMs32ZpN6uHEifyScAg6R5XqGPpv4osP/E/MjYmeqxhizhoemy6DDgFO5aEPC
 kzioqbF6/9Q3U5kf4cld1TqnNq7ZeZcW2987spV+8NghJVkNSBK3ipW5z0U57Pu4WM/G+oBNASr
 YqX9i/D+JVHCIyUib6tPJG5uTkS//9l7+Dz5XzwP96sArd0ofde01rfsfMYvzl/eXKWe2OzLQj0
 i+gtjMBBSScpMz39xskQcTc6OAsiE76OfbAG/zWevozr9w7lvZCnbY/nH43B+ImyxmFJwz83Txn
 CqRvfm1TJI3jnr1HLl0LGj3ZvqX/gPwM0pyWuP+opXSEUZTevpXflTJqB3R+f7upgB8St+p3Acn
 8qt3YtaC
X-Authority-Analysis: v=2.4 cv=G4kcE8k5 c=1 sm=1 tr=0 ts=68bf311e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=92do0itG5Mw8xxZS-WcA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018
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

Add speedbin mappings for A663 GPU.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 00e1afd46b81546eec03e22cda9e9a604f6f3b60..2b1c41f6cfeee912ba59f00c1beb4a43f0914796 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1024,6 +1024,11 @@ static const struct adreno_info a6xx_gpus[] = {
 			.gmu_cgc_mode = 0x00020200,
 			.prim_fifo_threshold = 0x00300200,
 		},
+		.speedbins = ADRENO_SPEEDBINS(
+			{ 0,   0 },
+			{ 169, 0 },
+			{ 113, 1 },
+		),
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x06030500),
 		.family = ADRENO_6XX_GEN4,

-- 
2.50.1

