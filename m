Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC793BABE0A
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 09:45:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA3A610E290;
	Tue, 30 Sep 2025 07:45:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="npeydifp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8518D10E290
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 07:45:00 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58U4ICDd013504
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 07:44:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=L0rL1K4stDTkbsmTd2WNaHVP
 qbXC20UcSps85wcP1FI=; b=npeydifp7VIkU6lLbvZb32s9chsDMJjdPZtsL3o7
 QrAhnfKnIFg3jjq45Hd3XCQ5EUARez5j/D3KDj50hbrX3lRMsRyQe520e3QJcd9c
 HDaESntqdBx6o7Tk60okP41spp6Eo+/VwKmuvyoUwJtn1r+xE3Y93LnAYHlqx3KC
 RYJbdHyDmLc6H24+PuRI5KeDj/lVicdmqaIhXJ/+h77PsxejQdfLRkQODBZiylyI
 6UYKy44Ucy3nmh4InwuEXe46qERdclUqxMv+Hx5Btjm6NfUOpd8VoHkrTguBxKlp
 69Vkxw06Lht5losu4EU/rhekJgAm/dsfrqdhS5zorsUNBQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e8a603ct-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 07:44:59 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4dd6887656cso101439741cf.3
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 00:44:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759218299; x=1759823099;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L0rL1K4stDTkbsmTd2WNaHVPqbXC20UcSps85wcP1FI=;
 b=draYfuW81fJs6jFNTdVzikiUbS0+R0x1n2Ry0/1pr9FjBu03HcC2n2um5+Qxya2Yuo
 F8ljrETPG0tlFiQaQ4+35c4WbCZGGdKKcUQ6fFoc+9sO/wWtV11lf8YgXHZLjjbmTtg4
 MIMGJQv9uwzA89F1yY0KPULn5NFdnl5vX63fKIpahKGmZH0eY6BrlmlX4fdaBmZJDVpP
 hSg9WCDy+3rbMeLcmwYniMQ59o/ci2mwIEEK+fIR1qo1i93ww9fzIqE1nIANxdLu8VtG
 EtdDkiBLRVGKFlDx1BizztykP3FPpsNcx9xV7u/sgooDwyweERMBQV32XvidsvLQU8pP
 WMqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEdM5y43dhK025c16oPLk1I5OxaeoCgRwiXa6oRWqmOa+jKhANipTVDXlXyPpCJtj2dTYnSZqPwzc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzNW6IXuu2QiitTHWMRWPz4gBCJERzP0zYjgpmk6WWx0LZ93NF+
 PRPamalYkR/DNibij65SKCL1NHaXGSB7jbvaId4/t9jz0LFTNV1jSNR6/1vO+oLAc2Uxudn5G+C
 revLZPSGr+ZMVGckmEQg5VQ4KAz/mgEPV34MID3SS4t3LLwxwUlxRxsZjsoVqZv0Xxns7CYw=
X-Gm-Gg: ASbGncuAM3uChmZ/bRJrjt6HGBvvKKVIfghttSe8sbd8fiB4rYeE5ivW6pRbevTKuZ8
 t3U9VztW3R5CMdMrVXdbiVVc9qp3VsbKtb8ogtRAA0wap4S7bjk090rrd1t+XJHRhLNxU8cdgmk
 E0x66PqvdTRYoIHg3OOg1lmFm458x1rMlXO4icEtp9uPU9j9zAGqaIo6ReSa/ryhl6/LSV0tM5R
 bYlgiviolfYEJWk3QspJ+pzppdf/NH41vzhbywMTbqNnwcPXktFIw6jZO6GlWICVvCxPhhy3yTJ
 zIw6HMguov594WC2C839s0mODReM7AmX8T3N+mRo10PkheQzcxlxqZ4F7l4pUL72SkC+nee0iyv
 B10PLBRNL2DI9JGo3HBoTz3Kvhzj5MQ2XeRK8gfhjwnHz4cjz6lsCQoUT7w==
X-Received: by 2002:ac8:5fd3:0:b0:4b5:dd8c:1d3 with SMTP id
 d75a77b69052e-4da4deafcbamr259011931cf.77.1759218298683; 
 Tue, 30 Sep 2025 00:44:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMvWrBLJTnixQlCCVfJ6fxPCuqLo/1PDdaopR4B7IthrKclRoZlt9yFC/kXr5oTsXhYJdxcA==
X-Received: by 2002:ac8:5fd3:0:b0:4b5:dd8c:1d3 with SMTP id
 d75a77b69052e-4da4deafcbamr259011581cf.77.1759218298039; 
 Tue, 30 Sep 2025 00:44:58 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-583139f9915sm4641758e87.39.2025.09.30.00.44.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Sep 2025 00:44:57 -0700 (PDT)
Date: Tue, 30 Sep 2025 10:44:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
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
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH 13/17] drm/msm/adreno: Support AQE engine
Message-ID: <nn64mvneylqqpf4a6imkp5mzsw26ju7iuym26hgyrjoqc7v2cz@dtjmmj5w776k>
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
 <20250930-kaana-gpu-support-v1-13-73530b0700ed@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930-kaana-gpu-support-v1-13-73530b0700ed@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=RZKdyltv c=1 sm=1 tr=0 ts=68db8a7b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Vi7wF31NLlcTFLqBoF4A:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: wAXQr4H6xy0uGtKuAFpsy-eeEeSNoMtm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMyBTYWx0ZWRfXx4T0sFcvOYQX
 NwWFUA0qZjLIznOZ46QcqOK4Ce7iYkP8VzN8d1O6mBA5GGJaEjKGvwGNzFGKPrpM/iIlg5glg26
 d0whsFU1rFrQV15aUFSXLfkcd2PcEeZJIPWjVnWHMamkSErSV+4T4cmeBDqyEGVLA7xdK0fVhSO
 WEjlo5uS1bKh7A3zcAVmPSssio8C+zTSlzIIN+oGraLDU5naJHnJvSPwwz1rFjAsEWGO1aErXPk
 lH/uuIyHyALOrs9bsDlpEigXs1lzAXcwUYdzVPsgM3e7WMsyNTO2cYU8TF0d8to2HdBm7mksuY6
 N4h1gHntfRyr3b60IF+sOyxB2v9f+Mldyb2V/zv250uJ5q4ZDVdtj3y2I4P8s2VyEmydBl+30/D
 4FKmKoUb1XfY/cQBY47nR+RS7kCblQ==
X-Proofpoint-ORIG-GUID: wAXQr4H6xy0uGtKuAFpsy-eeEeSNoMtm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270033
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

On Tue, Sep 30, 2025 at 11:18:18AM +0530, Akhil P Oommen wrote:
> AQE (Applicaton Qrisc Engine) is a dedicated core inside CP which aides
> in Raytracing related workloads. Add support for loading the AQE firmware
> and initialize the necessary registers.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 24 ++++++++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h   |  2 ++
>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c   |  3 +++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  1 +
>  4 files changed, 30 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 4aeeaceb1fb30a9d68ac636c14249e3853ef73ac..07ac5be9d0bccf4d2345eb76b08851a94187e861 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1093,6 +1093,30 @@ static int a6xx_ucode_load(struct msm_gpu *gpu)
>  		}
>  	}
>  
> +	if (!a6xx_gpu->aqe_bo && adreno_gpu->fw[ADRENO_FW_AQE]) {
> +		a6xx_gpu->aqe_bo = adreno_fw_create_bo(gpu,
> +			adreno_gpu->fw[ADRENO_FW_AQE], &a6xx_gpu->aqe_iova);
> +
> +		if (IS_ERR(a6xx_gpu->aqe_bo)) {
> +			int ret = PTR_ERR(a6xx_gpu->aqe_bo);
> +
> +			a6xx_gpu->aqe_bo = NULL;
> +			DRM_DEV_ERROR(&gpu->pdev->dev,
> +				"Could not allocate AQE ucode: %d\n", ret);
> +
> +			return ret;
> +		}
> +
> +		msm_gem_object_set_name(a6xx_gpu->aqe_bo, "aqefw");
> +		if (!a6xx_ucode_check_version(a6xx_gpu, a6xx_gpu->aqe_bo)) {

Should this firmware be handled by a separate function?

> +			msm_gem_unpin_iova(a6xx_gpu->aqe_bo, gpu->vm);
> +			drm_gem_object_put(a6xx_gpu->aqe_bo);
> +
> +			a6xx_gpu->aqe_bo = NULL;
> +			return -EPERM;
> +		}
> +	}
> +
>  	/*
>  	 * Expanded APRIV and targets that support WHERE_AM_I both need a
>  	 * privileged buffer to store the RPTR shadow

-- 
With best wishes
Dmitry
