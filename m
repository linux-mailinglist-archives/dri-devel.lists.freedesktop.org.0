Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BCDB54A0D
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 12:39:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E602910EC01;
	Fri, 12 Sep 2025 10:39:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CWrtb5M8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2EEE10EBFD
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 10:39:43 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fJQw014005
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 10:39:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=JZO37LOsBsf5QkQB3SdvehHO
 fE6O/aUfSqad1UHXEXY=; b=CWrtb5M8zWyJSZV0/SCddrssbyxp3WZ1WDxot9Vg
 96inzXhFYQOhvwakMdUZGf4q+RGMpVo7jrokQVN28Bd6Pj4++FlJOsPI/v6TIjYt
 y3VcRTNY/d+4FI8e/A0duerWbuBDAluaxBSNPVUTmSnoTFbcYkR0gX77Hig1Busq
 uEbHxm6i+l6yaBF38szdLXWwaBMKXxZDVslxqxwHRzVNzSFCpC/EluaZdWFETvcy
 R2yW+EYjq1d3sphNTXfe8e7Dyz8KGVc/W61OCSHI6h22VdHTifat51MXBQ8bJfJ+
 hNtxjJj5WrImWUPVWIrPcnogCkToZa/z9hLDmuLUy36HHw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 493qphvx9m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 10:39:42 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b3415ddb6aso69279361cf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 03:39:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757673581; x=1758278381;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JZO37LOsBsf5QkQB3SdvehHOfE6O/aUfSqad1UHXEXY=;
 b=on57H9HXiA/S9RcGS1CajGPqFKkh9Mtx6cS/rfLJVb6secDKgXF0KjPkykPEBS4NJn
 MD01BMPOcP3+9opMLRJQ4tvoOwfzBbjys8Jd4exAV3iNTsKj5N/fjO+H3ue56/1GN1cN
 m8NLwt8NxwkbQNIrN+r1gbsvaIjX1sWW3xx/A/GtH2WxtxkDpLohZhALB7RdSrNjGx+K
 H2cV/B/cApu0y1tFCytmn5xrzjHOWHj3qbdfBNyOFPBb0lTLfJJNt0DxNTSjUYCWgPSS
 2QZsBGs5Jn94d8fSlrdCGoC1Zd7RoRWgA/ggrH6Mi8K3T/dDqqHqq3Uauk+f5FH5Emlk
 pL3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSIDx52YLFsEUtdTadBMbRPsMRDFDgOoEWXKHU8W4PkQ1wh3VRvSchLX6PLdwB6K4K5Ub5OPAfdNg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxNWSNdjswXZclA24mA4iaVFUo3OSVybeHpqJgBoBjiU40LIzjx
 ZYSP+f/8rlF3yUuVjldPnE7lKxEyCjU5Z8MAZiKheOH7nxa388fiHV+JSmsrfCrgbhdJhp/DAeV
 qKJmD/SmMGZuWb9aDaaj3OjiNHum/qV7wT3MtI3MNiGRdQqRO7DyjYDmXrn3t5Izp3GM34ss=
X-Gm-Gg: ASbGnctIN1LvtO6ppwBl8C9yKu0Jup8XFFLmVXrYPxwSPUxw8Gaqht9pRNi0l4MEvRU
 PmWJzypP/cd1kq7+3IuDrCwBe+xbLEe+sh6PYC7QNG4btSEA69voHHDeIN0t4Sao64csuMuDMU+
 c0FXtD6ApHF3rGaq+dItnoDiga6ORpJUrptl7EL6bVS4cBUdY2iy4yl5UqRR1DrdkEEcQBCEqTR
 Omqk+3/MMGtu65irRBwVDvzMkVRn+X7ngbTqacF3ZyQRRC0l2Pdl51zgScQkWXg56Hkwpk+elEM
 CiGGjmWo1eWuwCamhWm574TAc1k1zq6kqPxsNunzDwHL6cpbC1euLSC8qwi6HlUoYo3XZXXPnhE
 hnmorAhIyiRGPIGXoGRgczXV5k+6/ZHRo+vQt5RLjmbKyq8hhSpjA
X-Received: by 2002:a05:622a:590c:b0:4b3:4fa9:4cd2 with SMTP id
 d75a77b69052e-4b77cca8d4emr39186131cf.33.1757673581482; 
 Fri, 12 Sep 2025 03:39:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IElx+sIo2TyNNDSZKhdIXfRdT6OrkK5agLSxJeNhZFAzJExqCsm6/N6pZpW9c9ZnhxyWSL7dw==
X-Received: by 2002:a05:622a:590c:b0:4b3:4fa9:4cd2 with SMTP id
 d75a77b69052e-4b77cca8d4emr39185691cf.33.1757673581028; 
 Fri, 12 Sep 2025 03:39:41 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56e646135b0sm1042248e87.110.2025.09.12.03.39.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Sep 2025 03:39:40 -0700 (PDT)
Date: Fri, 12 Sep 2025 13:39:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v4 12/13] drm/msm/dp: move link-specific parsing from
 dp_panel to dp_link
Message-ID: <4kajb4imv4mvpf4bdzoqfw7f4qoqxsu3ca4pbgsunhxnortfig@kmsqgsj547hi>
References: <20250911-add-displayport-support-for-qcs615-platform-v4-0-2702bdda14ed@oss.qualcomm.com>
 <20250911-add-displayport-support-for-qcs615-platform-v4-12-2702bdda14ed@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911-add-displayport-support-for-qcs615-platform-v4-12-2702bdda14ed@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=aPDwqa9m c=1 sm=1 tr=0 ts=68c3f86f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=qgWfkWmIk_iXozLJbygA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: pPW_SrRhhBapDiT-ijByBF0W1A6kR9oo
X-Proofpoint-ORIG-GUID: pPW_SrRhhBapDiT-ijByBF0W1A6kR9oo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTExMDA0MCBTYWx0ZWRfXyybtOOoSZgeG
 Kdax4RFdqNqGyAiay1sRvue/H9W0CnvNLigjlWd8j/F+nCLysK0f9VcwWde+/9kge/tYfsBZYCo
 AhOq6vk3+0K1r3aaWrEsMxHFnEFA8uGYA/pTPORGrpuRmEqoQeffeIk9Yg4m/BLqpCohxqwiGlX
 4bJjnUR3byb1LqMaD3lKb87xgj2XQiAWVJSPFpeGtjK7PyBR+Uh3vtakD/voX3xRmZKGYPSsLBX
 g0PDdq1nEhhLentI6q93Mxgs0RKso+QtBRYBiXsEsjR6h8ygAjeuGfW0HzOxmptYFRK864OEqje
 x/jAvreiuuSzUWrxQxm+hnB8Tcs2h8Lrax0+JuEUnfd/zs04EvJaICr6CAXq9/8bxX1ZQl0HOgT
 oOhY6oHn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_03,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509110040
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

On Thu, Sep 11, 2025 at 10:55:09PM +0800, Xiangxu Yin wrote:
> Since max_dp_lanes and max_dp_link_rate are link-specific parameters, move
> their parsing from dp_panel to dp_link for better separation of concerns.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>

I thought that you've split all DP patches...

> ---
>  drivers/gpu/drm/msm/dp/dp_link.c  | 63 +++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_link.h  |  4 ++
>  drivers/gpu/drm/msm/dp/dp_panel.c | 78 +++++----------------------------------
>  drivers/gpu/drm/msm/dp/dp_panel.h |  3 --
>  4 files changed, 76 insertions(+), 72 deletions(-)
> 
> @@ -1225,9 +1283,14 @@ struct msm_dp_link *msm_dp_link_get(struct device *dev, struct drm_dp_aux *aux)
>  		return ERR_PTR(-ENOMEM);
>  
>  	link->aux   = aux;
> +	link->dev   = dev;

It is only used during parsing of DT data. There is no need to store it
inside the struct.

With that fixed:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


>  
>  	mutex_init(&link->psm_mutex);
>  	msm_dp_link = &link->msm_dp_link;
>  
> +	ret = msm_dp_link_parse_dt(msm_dp_link);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
>  	return msm_dp_link;
>  }

-- 
With best wishes
Dmitry
