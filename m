Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE371AD2625
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 20:54:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C7AE10E225;
	Mon,  9 Jun 2025 18:54:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xrs7N1q4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F9E810E1D3
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jun 2025 18:54:32 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 559GebaQ000933
 for <dri-devel@lists.freedesktop.org>; Mon, 9 Jun 2025 18:54:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=ol8PDG/DdkJ6brMjCQQkiTgY
 8p3wDi/HNTyGiH3uujY=; b=Xrs7N1q4BL8pGdFZFko+/h5MmbRBA5Cg2qicx7fn
 sNZcVPieF02AA5TGbJlY1kttzTNEM+fqjv/AWrBoqtEaJovLbUixIPEgZUe7azuX
 yYH8engzC3xfiA2iu3gKnRbljmbKXHA2+l2ysESyrMhotjWnjB6Ze7QND/3RrseK
 z0ALHpQCxajEKIPWEuBCivTs+IMK+6YSjcIwFyYUEX/P33u6jW7n6WpH8HMWHTJI
 z7USDKL8uejVZ2S/L6b0V6/baDQxy4plucprQzhtlEZGNmgVV60FvXKd1oaBh2hj
 4TDjfVQk8v0apE42uBRpsIGj4p0BctBSly4drSfg6DFqgQ==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475v2t9qhw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 18:54:31 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id
 46e09a7af769-72bc3351885so4582625a34.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 11:54:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749495270; x=1750100070;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ol8PDG/DdkJ6brMjCQQkiTgY8p3wDi/HNTyGiH3uujY=;
 b=m208n8GpOewUtN2awx3ao6MtsrQt2GIYLuxY1NgoGPaGu82shSK4vXkl3gts79PxDT
 5EOMw93LToMmYJo2u8AMF/EjJKTs9xP1tCqifrOv9auJe4V659I/hs9Tq3+gG6hHaYn9
 fxuHlAWsg/EsH03yHfjX2yg21XzC7+miN0OVtFeop/6np3OHAQdepocW5wUwxFKxu2mn
 YqaRioW5apXrsmbvjWIwcxLd+8RluU7FsYYFVnyjEwSmXBfYQOav6WibWBDy2IJJYGXb
 bc6O46jilIwdCxPtNm31hxVtWd/qNoe3V0blVdSemfVRn9iNnSzv2LB07Z6FO0WiruCb
 n50A==
X-Gm-Message-State: AOJu0YxEDojTOhWjdED08v9DTmIPaF03pXtPS6ZIGnkkEXw84pRa86kS
 AnA7c5BhCrc7sPz7QKvzBajrJlfuefSuoQBZTST8oatz4zEhZJXc4sBbq4M6SjVEGQK0qIZprdz
 HdFre7kzwrnXL0HqNCglhBnmY3PRo6b2qzUTzV8qtWtB3MehsoZCCQeSlM8xEmsSah/iqzFY450
 ba59I=
X-Gm-Gg: ASbGncv7og9Ab8UlBvctUnmrmV7je53SzlUU4xz+Vg83xT9CKM6aus+OukVU5408+IT
 NtKF98Y7kAGed/b6eYAU11XJjlTf4klcy3iFaY4oairmJL1RQon4yIuAmLI5Nsj3Pn02fDRZjUm
 kq3k7AaCCe0ke2HLfX+kWON/uAxNKfVf52WuXzpVnoNNJ2RL7jRxWcuwCk0ILZOSBgGCMpQJ9cs
 9U6GxtABLhWfvvMkE8UX4GasLCW+1LARTovurMCGygatqD0cv9pL0m4USkbIqRgoFjPchN+jDn4
 qltpuXnbWp1C1XorEryh9tPBePF2HacfjXUcsrzsyRruM+S4DUpFBLbyUxci5ylEOW9i9/uMQAc
 =
X-Received: by 2002:a05:6830:610f:b0:72b:9180:cc6c with SMTP id
 46e09a7af769-73888dca7a9mr9715421a34.7.1749495269989; 
 Mon, 09 Jun 2025 11:54:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHO2dqN7vYHPlmZV87m41nP8/ZqssxU5L+Yh0s+1ZIu2+sJsllrp9Mz+wf1imIYHMK4S61yLQ==
X-Received: by 2002:a05:620a:2b83:b0:7d3:90ab:814a with SMTP id
 af79cd13be357-7d390ab8376mr930036185a.24.1749495258901; 
 Mon, 09 Jun 2025 11:54:18 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553676d0476sm1266162e87.35.2025.06.09.11.54.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jun 2025 11:54:17 -0700 (PDT)
Date: Mon, 9 Jun 2025 21:54:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/3] drm/msm/adreno: Check for recognized GPU before
 bind
Message-ID: <jowyn4tkqy3f7tiqzkp7nw627ddqgzgqms3q4rp5kveiqh3xc7@wzbhbaxxuftc>
References: <20250609182439.28432-1-robin.clark@oss.qualcomm.com>
 <20250609182439.28432-4-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609182439.28432-4-robin.clark@oss.qualcomm.com>
X-Proofpoint-GUID: SKU-UhbsBoP2l-0Tmusl8YySfgOUoHkv
X-Authority-Analysis: v=2.4 cv=GoxC+l1C c=1 sm=1 tr=0 ts=68472de7 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=X8FaSnKV0AetLU2DVmwA:9 a=CjuIK1q_8ugA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-ORIG-GUID: SKU-UhbsBoP2l-0Tmusl8YySfgOUoHkv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDE0MyBTYWx0ZWRfX1npOkA/BNG8G
 Zg8L2vzfUDsPRHfwGRbuOOYrLe7OGbotCvCp+EVgvdTHvQdiiHPzYPweiWJ/F5hqcovCcwWW6sw
 EwwC0QpIhkzdcqVvnaEUaDxanIkqGxtJcxDc560PpgOM1Ee/IgJzQ7GTYRaeNu2S81KToi4WtWj
 MxH3yWbtV+i2J+X/KyhpoEjAVT4xSguatnsH/bAb+bdxYtDsYzXIIqVxi/7OPuoZ1E33QKpAPAM
 u+mpsVGS2jGi1gqEwvHcrT/aT8d0PZl9fzS2Stv94/GajGt3i89ZJ8boMtXGcemwPZlYuoTmu22
 LbbaN+ItusrLifqpPTqepZ8O6CsoaJsH6dGBxtTpGQ7sN+RTVe/03xou1SlohsdkHu3mgAo68QQ
 c6hVaXMkVBGozAxpXh/ai4epwPh+pzygTeep/1juBH26+nC7svkMXBYikg4FQBGnnUWcqXR3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_07,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=776 adultscore=0 impostorscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090143
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

On Mon, Jun 09, 2025 at 11:24:37AM -0700, Rob Clark wrote:
> If we have a newer dtb than kernel, we could end up in a situation where
> the GPU device is present in the dtb, but not in the drivers device
> table.  We don't want this to prevent the display from probing.  So
> check that we recognize the GPU before adding the GPU component.
> 
> v2: use %pOF
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 29 ++++++++++++++++++----
>  drivers/gpu/drm/msm/msm_drv.c              |  2 +-
>  drivers/gpu/drm/msm/msm_gpu.h              |  1 +
>  3 files changed, 26 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
