Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 970F66FB697
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 21:02:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 523DA10E238;
	Mon,  8 May 2023 19:02:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 560BE10E238;
 Mon,  8 May 2023 19:02:32 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 348HRhn2017970; Mon, 8 May 2023 19:02:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=gQYRttf6q+r+8RYiioec/7vo1MmIap20DbAmNLNaTBo=;
 b=fRiJ7MnJu9DgTDXPJUnIAa2xWPesjRX/pV0V6K+RUeFrIpdSCqD4jeivK3A81mkVU5tv
 lKW/BAp+jvwx9Hsvr8DnDGUOQMc3OTTZmAdgMtQzUgk645BWWC9ZvbFr2Tc/iE4Pt+cJ
 Epf5d0o4ILU3d62ez01hUEFHTYRJX8z+ikGio+3XJ3WDvhP7mHzdPuGS6yvX1luEmOK5
 qsqk6pGqG9lzjVS6BjlVnKUBC16Q7fOqNszcXxf3pn1ITigzoNUaugsj2dNarCqQ/6JN
 7Eimbxtqhkz0ohD5v/Mn3rOeFVMmbY9XGJnnJe5+EP8BkEnQdP38orL0LuEZmZt8JIsY iA== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qexpqh8xw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 May 2023 19:02:25 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 348J2OSG010685
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 8 May 2023 19:02:24 GMT
Received: from [10.71.110.193] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Mon, 8 May 2023
 12:02:24 -0700
Message-ID: <aeb3bd48-34c1-c42a-405b-be6b162bc7f7@quicinc.com>
Date: Mon, 8 May 2023 12:02:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v5 7/8] drm/display/dsc: include the rest of pre-SCR
 parameters
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Suraj Kandpal <suraj.kandpal@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <20230504153511.4007320-1-dmitry.baryshkov@linaro.org>
 <20230504153511.4007320-8-dmitry.baryshkov@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20230504153511.4007320-8-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: twPUqeNqojyiN1X_vLWXD9cb34pN3PX1
X-Proofpoint-ORIG-GUID: twPUqeNqojyiN1X_vLWXD9cb34pN3PX1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-08_13,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 spamscore=0 mlxlogscore=999 priorityscore=1501 suspectscore=0 phishscore=0
 impostorscore=0 clxscore=1011 bulkscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305080125
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
Cc: linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/4/2023 8:35 AM, Dmitry Baryshkov wrote:
> DSC model contains pre-SCR RC parameters for other bpp/bpc combinations,
> include them here for completeness. The values were generated from the
> 'pre_scr_cfg_files_for_reference' files found in DSC models 20210623.
> The same fileset is a part of DSC model 20161212.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

I checked these pre-SCR values against DSC model 20161212 and they look 
good to me.

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

> ---
>   drivers/gpu/drm/display/drm_dsc_helper.c | 72 ++++++++++++++++++++++++
>   1 file changed, 72 insertions(+)
> 
> diff --git a/drivers/gpu/drm/display/drm_dsc_helper.c b/drivers/gpu/drm/display/drm_dsc_helper.c
> index 35b39f3109c4..aec6f8c201af 100644
> --- a/drivers/gpu/drm/display/drm_dsc_helper.c
> +++ b/drivers/gpu/drm/display/drm_dsc_helper.c
> @@ -325,6 +325,16 @@ struct rc_parameters_data {
>   #define DSC_BPP(bpp)	((bpp) << 4)
>   
>   static const struct rc_parameters_data rc_parameters_pre_scr[] = {
> +	{
> +		.bpp = DSC_BPP(6), .bpc = 8,
> +		{ 683, 15, 6144, 3, 13, 11, 11, {
> +			{ 0, 2, 0 }, { 1, 4, -2 }, { 3, 6, -2 }, { 4, 6, -4 },
> +			{ 5, 7, -6 }, { 5, 7, -6 }, { 6, 7, -6 }, { 6, 8, -8 },
> +			{ 7, 9, -8 }, { 8, 10, -10 }, { 9, 11, -10 }, { 10, 12, -12 },
> +			{ 10, 13, -12 }, { 12, 14, -12 }, { 15, 15, -12 }
> +			}
> +		}
> +	},
>   	{
>   		.bpp = DSC_BPP(8), .bpc = 8,
>   		{ 512, 12, 6144, 3, 12, 11, 11, {
> @@ -360,6 +370,37 @@ static const struct rc_parameters_data rc_parameters_pre_scr[] = {
>   			}
>   		}
>   	},
> +	{
> +		.bpp = DSC_BPP(10), .bpc = 8,
> +		{ 410, 12, 5632, 3, 12, 11, 11, {
> +			{ 0, 3, 2 }, { 0, 4, 0 }, { 1, 5, 0 }, { 2, 6, -2 },
> +			{ 3, 7, -4 }, { 3, 7, -6 }, { 3, 7, -8 }, { 3, 8, -8 },
> +			{ 3, 9, -8 }, { 3, 9, -10 }, { 5, 10, -10 }, { 5, 11, -10 },
> +			{ 5, 12, -12 }, { 7, 13, -12 }, { 13, 15, -12 }
> +			}
> +		}
> +	},
> +	{
> +		.bpp = DSC_BPP(10), .bpc = 10,
> +		{ 410, 12, 5632, 7, 16, 15, 15, {
> +			{ 0, 7, 2 }, { 4, 8, 0 }, { 5, 9, 0 }, { 6, 10, -2 },
> +			{ 7, 11, -4 }, { 7, 11, -6 }, { 7, 11, -8 }, { 7, 12, -8 },
> +			{ 7, 13, -8 }, { 7, 13, -10 }, { 9, 14, -10 }, { 9, 15, -10 },
> +			{ 9, 16, -12 }, { 11, 17, -12 }, { 17, 19, -12 }
> +			}
> +		}
> +	},
> +	{
> +		.bpp = DSC_BPP(10), .bpc = 12,
> +		{ 410, 12, 5632, 11, 20, 19, 19, {
> +			{ 0, 11, 2 }, { 4, 12, 0 }, { 9, 13, 0 }, { 10, 14, -2 },
> +			{ 11, 15, -4 }, { 11, 15, -6 }, { 11, 15, -8 }, { 11, 16, -8 },
> +			{ 11, 17, -8 }, { 11, 17, -10 }, { 13, 18, -10 },
> +			{ 13, 19, -10 }, { 13, 20, -12 }, { 15, 21, -12 },
> +			{ 21, 23, -12 }
> +			}
> +		}
> +	},
>   	{
>   		.bpp = DSC_BPP(12), .bpc = 8,
>   		{ 341, 15, 2048, 3, 12, 11, 11, {
> @@ -391,6 +432,37 @@ static const struct rc_parameters_data rc_parameters_pre_scr[] = {
>   			}
>   		}
>   	},
> +	{
> +		.bpp = DSC_BPP(15), .bpc = 8,
> +		{ 273, 15, 2048, 3, 12, 11, 11, {
> +			{ 0, 0, 10 }, { 0, 1, 8 }, { 0, 1, 6 }, { 0, 2, 4 },
> +			{ 1, 2, 2 }, { 1, 3, 0 }, { 1, 4, -2 }, { 2, 4, -4 },
> +			{ 3, 4, -6 }, { 3, 5, -8 }, { 4, 6, -10 }, { 5, 7, -10 },
> +			{ 5, 8, -12 }, { 7, 13, -12 }, { 13, 15, -12 }
> +			}
> +		}
> +	},
> +	{
> +		.bpp = DSC_BPP(15), .bpc = 10,
> +		{ 273, 15, 2048, 7, 16, 15, 15, {
> +			{ 0, 2, 10 }, { 2, 5, 8 }, { 3, 5, 6 }, { 4, 6, 4 },
> +			{ 5, 6, 2 }, { 5, 7, 0 }, { 5, 8, -2 }, { 6, 8, -4 },
> +			{ 7, 8, -6 }, { 7, 9, -8 }, { 8, 10, -10 }, { 9, 11, -10 },
> +			{ 9, 12, -12 }, { 11, 17, -12 }, { 17, 19, -12 }
> +			}
> +		}
> +	},
> +	{
> +		.bpp = DSC_BPP(15), .bpc = 12,
> +		{ 273, 15, 2048, 11, 20, 19, 19, {
> +			{ 0, 4, 10 }, { 2, 7, 8 }, { 4, 9, 6 }, { 6, 11, 4 },
> +			{ 9, 11, 2 }, { 9, 11, 0 }, { 9, 12, -2 }, { 10, 12, -4 },
> +			{ 11, 12, -6 }, { 11, 13, -8 }, { 12, 14, -10 },
> +			{ 13, 15, -10 }, { 13, 16, -12 }, { 15, 21, -12 },
> +			{ 21, 23, -12 }
> +			}
> +		}
> +	},
>   	{ /* sentinel */ }
>   };
>   
> -- 
> 2.39.2
> 
