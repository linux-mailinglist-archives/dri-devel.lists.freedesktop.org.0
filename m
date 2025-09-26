Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9B4BA3F39
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 15:51:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07D4610EA63;
	Fri, 26 Sep 2025 13:51:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="neWq3WgV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ADBD10EA63
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 13:51:55 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q8vfe6014653
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 13:51:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=oWhAI0VAdx5gJX6gdXCdFadp
 6xIz1oz4Ky85VfVuHlQ=; b=neWq3WgV5JI4jS54Rti1aBWRVmSsHiLpjdENlaOy
 aiev+6faw8XbnAb+BNkJ+ER+6bqiD9s7T1ZBkdHvP4xpP8xL3xv3AN3RU2GFU2hu
 NW9PtWZ/XK7Dc3Sq8PyMcubuolAHywNeg08RWb7yCjA8y/NmXxp7cSabAnuqU7Xc
 iSAjSRaF24g0R5qpedkpEfRI7VNKHGCnToKMTCcwQjK2hpCrdo2mWjA9wnHTqYud
 u+/LWL2kQPkggfppnPMnFgwlfaTCrS+jGjhHCir08k6A6NaN4F54+4pRoQJg0gOo
 etaN2og3s6jxRj2amO6wS91ATyezWhsrzEXmBDmp6DM9Hw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db34k0xe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 13:51:54 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4ddc5a484c9so16744911cf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 06:51:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758894714; x=1759499514;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oWhAI0VAdx5gJX6gdXCdFadp6xIz1oz4Ky85VfVuHlQ=;
 b=o+f8xf98nAPB6QaF31c3wLO6Yg1A4LwdTP3mAO6HjYsEGMw1WXDd7ab9x5ART7wLIQ
 uWMcVHxosSCcmOz+KujMHS9TQfGcmajZpl3pO7BXI7uP+ziq9ptLfrYCnfm9yqmAiCcr
 pcR2SxT4gSwL3iDN6jGM388dmlduDUhJORNIJ/cyFKolpDP2Rmn6o0OwJDQRb13txc6Z
 I5emdYn9nx3oSS9gQiy4fQBgg3iyniEuUe0MAJ5rSQ9gF41VUzKlnbq3FB1+2idhUTx9
 mCErHAGs2tL4nYDRDtW4sUiTJrzAoHW7WmsPyG+CLgo5MmlcHCilcgjtsJmy5/hO/aPC
 v3+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUq9iBTZhWTs3ZNxCbgUGGQEJV87qkHbaIZVxnvsJqSYKgax1DE2n9O+3dFTkr+/rr+1FwCQJxaeP0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxgfSrVZOnjN3DltSpyjD/2pZMgh7aZKG2+CldAExHQAvzl7qvP
 IhqmkrQPXE6Wcz7mFd7DKQqOF6HxDzgwXHjxfTomkv2kyOtsYpW/+uVB8ygJU/L4UyVJhHfj8rD
 q3WqwV5lElYQdxhvO7FKxStoJBl8Z7BEClR5LOIabzxXd77ijIjpfWX8okWRn69vPHKWII34=
X-Gm-Gg: ASbGncv5Hyq9yCsaQSi4tnU+HyAt/WYZlj5az3x5c8O+6VMKsRO/REr6ACZP/7HYEDZ
 ATn81dQkJSo48TEllEBDyQJbJUUNngTC0RsLHiRr+T6ncbX4xoIIyevvND4WBNAdMXo3oDnaBmT
 D+Fid1Ge9d3iugMXTq8c0k8V6sSs0oTbdICSuYHm+2r2U33CKpJh/t0nV5Rpu1IAup2LbwiHlGw
 jHZzIXA3wjEm7A3HcSkxM7sVRb3JIZI2QiXFHyAATCwMPO1OGeTuILYQym/Gfc879XuR5fhFRaT
 f5UMUsCvSPbvs3Iwdk/J3HN89gvIjWb538umYJj2VbApk4u/0LHvgf9YfcrvbJnCsU7HuzHLkoO
 cZqkatIYtNtqnnXBxjBpCb0YLU/DFPjYuW9t0o6qK75SxbiVBHmAi
X-Received: by 2002:a05:622a:5a85:b0:4d7:c9d3:cbb6 with SMTP id
 d75a77b69052e-4da4c96e753mr94986081cf.72.1758894713490; 
 Fri, 26 Sep 2025 06:51:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8YkJGYw1+CDemqZBbYI88MpytkUH1UcPY/ucGdfsLVPLTx/bR3Xx/PZiHi0DE/0nYLVZtkA==
X-Received: by 2002:a05:622a:5a85:b0:4d7:c9d3:cbb6 with SMTP id
 d75a77b69052e-4da4c96e753mr94985671cf.72.1758894712878; 
 Fri, 26 Sep 2025 06:51:52 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-36fb771029csm11547581fa.38.2025.09.26.06.51.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Sep 2025 06:51:52 -0700 (PDT)
Date: Fri, 26 Sep 2025 16:51:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
Cc: marijn.suijten@somainline.org, swboyd@chromium.org, mripard@kernel.org,
 abel.vesa@linaro.org, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 robin.clark@oss.qualcomm.com, jessica.zhang@oss.qualcomm.com,
 abhinav.kumar@linux.dev, sean@poorly.run, airlied@gmail.com,
 simona@ffwll.ch, alex.vinarskis@gmail.com,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_riteshk@quicnic.com, quic_amitsi@quicnic.com
Subject: Re: [PATCH 1/4] drm/msm/dp: Update msm_dp_controller IDs for sa8775p
Message-ID: <c4o6bcvl7cgmvklvnwj7togokawvaiqmiye3sgdlugwftz45bh@g7vfktowo5hj>
References: <20250926085956.2346179-1-quic_mkuntuma@quicinc.com>
 <20250926085956.2346179-2-quic_mkuntuma@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250926085956.2346179-2-quic_mkuntuma@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MiBTYWx0ZWRfXwnfa9FdbuGV9
 L1AVMwtwMDMx5Gez0FP3OKVQbrc75hHmyoAjOngecaC1BTdmruUX9zzdS0NFXChQ27sLmLHACTB
 9ADOb3rITqTBQ3xVeSj1TA/KZSIb/chGx8IPnQm/PBoHQ/deD/mQLHgjjVxJSVg3oHlyeWMpVrf
 cu8nwAfF5RV3fJECFTtEm4rOfiOqzY2Vi/vPrcRPuCXU2788+LDSbvN9MeQxFadOSfuf6jCObmq
 0loSFhB0KnaP44rYtqkLI543qeq0UkbYvLuIH3mkV6YcF+A/9nRwGx8Xhcdi4mirLnEr9+GN71W
 WFAoAjDXPKifAY51cY6PdAA+lRY1tvwhcZVgaWJRzGyGxnCOlNV/uv0skDhMIzlJAQWNAf35wQB
 gFLPNwoLpiYMsmzCWxyQSXuSMUXAoQ==
X-Authority-Analysis: v=2.4 cv=Hb0ZjyE8 c=1 sm=1 tr=0 ts=68d69a7a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=tFSzMcqD3SoeBU5fSnoA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 9xGrxe6oz1Oj4ygYletw3Q5H3I_rkk94
X-Proofpoint-GUID: 9xGrxe6oz1Oj4ygYletw3Q5H3I_rkk94
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_04,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 bulkscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250172
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

On Fri, Sep 26, 2025 at 02:29:53PM +0530, Mani Chandana Ballary Kuntumalla wrote:
> The Qualcomm SA8775P platform comes with 2 DisplayPort controllers
> for each mdss. Update controller id for DPTX0 and DPTX1 of mdss1.
> 
> Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Missing Fixes tag.

> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index d87d47cc7ec3..f247aad55397 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -133,8 +133,8 @@ struct msm_dp_desc {
>  static const struct msm_dp_desc msm_dp_desc_sa8775p[] = {
>  	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
>  	{ .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
> -	{ .io_start = 0x22154000, .id = MSM_DP_CONTROLLER_2, .wide_bus_supported = true },
> -	{ .io_start = 0x2215c000, .id = MSM_DP_CONTROLLER_3, .wide_bus_supported = true },
> +	{ .io_start = 0x22154000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
> +	{ .io_start = 0x2215c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
>  	{}
>  };
>  
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
