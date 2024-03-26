Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA77F88D03A
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 22:39:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B71A10F37B;
	Tue, 26 Mar 2024 21:39:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="HpuxyV+C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1621D10F37A;
 Tue, 26 Mar 2024 21:39:41 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42QLUmUe014476; Tue, 26 Mar 2024 21:39:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=KiNdyiOWLYPG+1iqZ4gqeGt+jatVH1jFRCzWgqLYEtA=; b=Hp
 uxyV+C3WlGIEPlH57akc8HQgIrp3eBqtJtSnTVYl3KWPSwDOS2+zfXfUAtGipz6G
 1BcusUCvlN5MYQKqAnX9S85/ekNDFaMDduNPQQKVsZ6T2PR7z50fGJQkL+odnwBC
 ajcWOkQg/KrTKdc7+WZ9HD3+MevuyaJRWp9sKAJedPgDZ6AJb3L4BczDkpwOk52o
 inI8H15vtFV2XDc8nCywtnEsBeFsJ+Bw4//bjF+fojBZ7SQxTH5SpeJ1qfV34aHu
 o0udTTEGbuCMaWsKXUZaeBnL23USABPMCS7CaStMpQH5ZFHWElVGmhx9ERfDHMr7
 8Y6k/EYvzXMit/sBY2BQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x3w0x9pgt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Mar 2024 21:39:28 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42QLdRgG025666
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Mar 2024 21:39:27 GMT
Received: from [10.71.109.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 26 Mar
 2024 14:39:23 -0700
Message-ID: <d2670f94-213c-bc82-7ae6-a3668f9721df@quicinc.com>
Date: Tue, 26 Mar 2024 14:39:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 01/16] drm/msm/mdp5: add writeback block bases
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Masahiro Yamada
 <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas@fjasle.eu>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
CC: <linux-kbuild@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>
References: <20240323-fd-xml-shipped-v4-0-cca5e8457b9e@linaro.org>
 <20240323-fd-xml-shipped-v4-1-cca5e8457b9e@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240323-fd-xml-shipped-v4-1-cca5e8457b9e@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: cHwM02RdzFRAdYB9ara6IlNlXykK0pgf
X-Proofpoint-ORIG-GUID: cHwM02RdzFRAdYB9ara6IlNlXykK0pgf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-26_08,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0
 adultscore=0 spamscore=0 mlxlogscore=999 bulkscore=0 impostorscore=0
 clxscore=1011 priorityscore=1501 lowpriorityscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403260156
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



On 3/22/2024 3:56 PM, Dmitry Baryshkov wrote:
> In order to stop patching the mdp5 headers, import definitions for the
> writeback blocks. This part is extracted from the old Rob's patch.
> 
> Co-developed-by: Rob Clark <robdclark@gmail.com>
> Signed-off-by: Rob Clark <robdclark@gmail.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 

This is unused today right?

Is it just being migrated now in advance as all the mesa mdp5 headers 
are moving to kernel?

> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h
> index 26c5d8b4ab46..4b988e69fbfc 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h
> @@ -69,6 +69,16 @@ struct mdp5_mdp_block {
>   	uint32_t caps;			/* MDP capabilities: MDP_CAP_xxx bits */
>   };
>   
> +struct mdp5_wb_instance {
> +	int id;
> +	int lm;
> +};
> +
> +struct mdp5_wb_block {
> +	MDP5_SUB_BLOCK_DEFINITION;
> +	struct mdp5_wb_instance instances[MAX_BASES];
> +};
> +
>   #define MDP5_INTF_NUM_MAX	5
>   
>   struct mdp5_intf_block {
> @@ -98,6 +108,7 @@ struct mdp5_cfg_hw {
>   	struct mdp5_sub_block pp;
>   	struct mdp5_sub_block dsc;
>   	struct mdp5_sub_block cdm;
> +	struct mdp5_wb_block wb;
>   	struct mdp5_intf_block intf;
>   	struct mdp5_perf_block perf;
>   
> 
