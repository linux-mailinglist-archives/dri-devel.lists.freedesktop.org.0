Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92375AB7504
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 21:03:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1987910E6D0;
	Wed, 14 May 2025 19:03:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Eb4GjAG5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37B8A10E647
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 19:03:38 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EAuvjs015930
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 19:03:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=xYRDcZvrRlAs4itLVeZfoidr
 MFA19B14tFBdS3+9LaI=; b=Eb4GjAG5gViCu4d5xl8g7M0Fiwgy45K5d9VqgR5K
 amS3oPhv0p1NEzHEQEGjSgBZR+E99/PZECxF56R3Q43j4ddfzHpoS53/8do4P+E4
 VRb5cI4hETkAH6YppRjh6GsGPSRrlh3gtIzj57B8bPCjKcDotRAryznRyBVdHujK
 m7xL07QzRemA8qw3/yUxRmu8gDeOvqHdxVc+3vejZoTjkIF87JD2wTdU8gR+1vY8
 PE7nsztC4p7cFDDO3xRjOgWaW1aVV0dvkwoEhfSu9zpj5zqhsjg/fMT/X9XJTObh
 89KuTKa3m5M8PVYWfxtQUf+3jHvVVsYnDcHLLDT/RQXMRg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcmuv61-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 19:03:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c95556f824so9378885a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 12:03:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747249416; x=1747854216;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xYRDcZvrRlAs4itLVeZfoidrMFA19B14tFBdS3+9LaI=;
 b=T6Jf8KwGHOBh36SGnTwZW2RxKlsSChxQnysrZS2Brg4QIp3Yxu9Ts04LL3Ju8d9Rfe
 F8dDl/kdk9Pls06EfMqqQV6h0CJgHA6KK2igK+7k32vPPtH8ZdjXly78VsVHVA/GD7EO
 FP0mPr4ufRaXRGhYv1gB9Vlxl7rUzSKbkVaD5N1Yu80MV3paJ69IDpB0CK2rdlvr3QQn
 q/pHqeknn0flzj00KjIZwNSEo5eLIxumDyVkssEtDHYJk6HjDi0bL33qErO9Ir+MzhkA
 0fdGY5/DPLNDDpIuniYcDOuZ6/+2IqYhmd0/fFTpfdI9fs0XXeoi5o0En3SqD1Pe0wHv
 3cHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1EA4MGfLxDvypSExxUrXw0wbmzjMClnqDdGMiULBBYAg5N+mwrGXYKlHN/p3cvAkdgR2KI0kgGZE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzi9qI+DjxulqKI9vTCgXBItye+6cqz1hIe2F0BDdwTS5Ez5/cN
 0ju1IiO+caHsenwHJjgxBe+2R+7FFVC7QAtlpaZUTRKLhcK1/dOx3OySevh6HR6vSQOkZ+V6Vrx
 3ajxk0KdQIVTrvMJlfuPLVOt8UAtNEm+cKAmiWwqG67o48XYI8fn5XLCsOwn45dlYfbw=
X-Gm-Gg: ASbGncszQotbhEDS7dhkBLu5tUK4jsBqGlZidm+oXb5b3MQuL769zNROiXYFpyKzDRH
 8mQ6d6yMmEHrysC745UyljJHg2OzPLYWt/BY9H15VMj3vfnn33DQHS7GDQmUZYd88hCr8bXJaZh
 iGu/v5e7niXvrOLhw1M7sOH+rNa3zcPX3G9zB58ohSpZrK1k/ODYVR+yiBIR+bTVFGScnIfstcN
 0PNDVXVBr56orhAz1N3MaZHbsOVDhqGWMBXpIvQ4s5wmpQLQMLZGeB3J6jY1mZxd0RUGDIg3iBi
 GWioJIq2ltGPZeifrbVSneveX+fHVJM3DMnh0Ulz+w0nv3HGpBANBtcN/T2k86+F8dQOCu0OMcY
 =
X-Received: by 2002:a05:620a:1a0e:b0:7c7:a5c9:d109 with SMTP id
 af79cd13be357-7cd2888f7d3mr704287785a.50.1747249416343; 
 Wed, 14 May 2025 12:03:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnbU/N6XFKdVURfBzODUtwnKgfcbS0R68TW1dNTpTgKpwi4qIQ1yAtQ1dg+wqpVirb5QQAHg==
X-Received: by 2002:a05:620a:1a0e:b0:7c7:a5c9:d109 with SMTP id
 af79cd13be357-7cd2888f7d3mr704280185a.50.1747249415726; 
 Wed, 14 May 2025 12:03:35 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54fc64bf86fsm2347052e87.178.2025.05.14.12.03.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 12:03:34 -0700 (PDT)
Date: Wed, 14 May 2025 22:03:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFT v2 01/15] soc: qcom: Add UBWC config provider
Message-ID: <cd4zuhalspnepn3xebwkwt4is66o27db7e3s3n7h7x4r26sg3b@ai2psdpjdv56>
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-1-09ecbc0a05ce@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514-topic-ubwc_central-v2-1-09ecbc0a05ce@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 8gVDVgHa1fowSxyyIT1mLPykHwX-vGJt
X-Authority-Analysis: v=2.4 cv=HZ4UTjE8 c=1 sm=1 tr=0 ts=6824e909 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=CA9_ZTp6D95CLmzeQEgA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 8gVDVgHa1fowSxyyIT1mLPykHwX-vGJt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE3MyBTYWx0ZWRfX0P7JRVm9RMHb
 8PXkZ4kdv5f0YDgJOzSr8CFrPaZguBTYTllAdrDVMY2bDP+S1fqUB/be+oxtOT1FhrH4J66J5q2
 zm834/oL2yQnKFZA7W3BGbJn9HUa9eUBy75yqL7Ezvq5zq52ohgCp8DWhwbX5tGiaQd4FO9GFVM
 vaaloJUeAsXfgyZpgyeyzfnBmHI8dh+JjBhSLzKRYUOABxQytO1ohQ8NMOiGp0TkMN/9WcCZXdD
 rZETaGq/g5WiLcKHOeGqLOMlgWguEedD7oyQVt7OJ7tPDEpZDiW9q8wca1QgN2MAaljyi8O721s
 XTtufsetcTUAmKYFFxE7ecjFmcSpa+nVIeym4zqEIHRusDIDtCca/wnzBYo8WqDzZpwTpKfWxiC
 oiEdN/shspu0kgrHhqUX+jvunAt88c/0xfMvInrTbXBVqTQDornSGhZxP5NoYIfvenVl3DQE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140173
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

On Wed, May 14, 2025 at 05:10:21PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Add a file that will serve as a single source of truth for UBWC
> configuration data for various multimedia blocks.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/Kconfig       |   8 ++
>  drivers/soc/qcom/Makefile      |   1 +
>  drivers/soc/qcom/ubwc_config.c | 235 +++++++++++++++++++++++++++++++++++++++++
>  include/linux/soc/qcom/ubwc.h  |  67 ++++++++++++
>  4 files changed, 311 insertions(+)
> 

With the SAR2130P fixed

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> +
> +	/**
> +	 * @highest_bank_bit: Highest Bank Bit
> +	 *
> +	 * The Highest Bank Bit value represents the bit of the highest
> +	 * DDR bank.  This should ideally use DRAM type detection.
> +	 */
> +	int highest_bank_bit;
> +	bool ubwc_bank_spread;

Nit: any documentation for this one?

> +
> +	/**
> +	 * @macrotile_mode: Macrotile Mode
> +	 *
> +	 * Whether to use 4-channel macrotiling mode or the newer
> +	 * 8-channel macrotiling mode introduced in UBWC 3.1. 0 is
> +	 * 4-channel and 1 is 8-channel.
> +	 */
> +	bool macrotile_mode;
> +};
> +

-- 
With best wishes
Dmitry
