Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 405A597A940
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2024 00:33:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CC3410E0D1;
	Mon, 16 Sep 2024 22:33:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="WAXGtdTe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13EDE10E0D1;
 Mon, 16 Sep 2024 22:33:49 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48GEjbli010095;
 Mon, 16 Sep 2024 22:33:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 jRQmS8uxgnbiobE0eClg3TQPkamskuwaAUNyzBVoJZI=; b=WAXGtdTeH+cZzt0s
 iO1bpKx1LlJZXdcPCZd3FzkPGfkjtM6grfIvFGE/KG4dX8F+x8YRLpdi5vTduUUA
 TPXw5pOwZ1B/r7q5pZqqYqAtBQ2jeCmLgQ+2iEg0oXTJCxiKF1HI+wvW7uYGIYv7
 pNvR/SIf91nSpIRUxDYsEIpf/BmCz6FIRyreyxFUEzA6/Q+tYDQ2E2VK0Yzn4B+W
 zbl8O8sHOmkLJ78z8/VS28oD0G+aZIsj1C5dgniznddNr5IQamoeqZcUoMqWJcMh
 whCiuIWgVdnOYn0oUes823kEZVP3MMoKf1eVu6S9A87IN4AiH++KsAyc4aWN49V1
 46/AaA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4hh5ayr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Sep 2024 22:33:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48GMXgsg014450
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Sep 2024 22:33:42 GMT
Received: from [10.110.75.131] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 16 Sep
 2024 15:33:42 -0700
Message-ID: <13f79bfe-a67a-475c-9c1f-dbff802242eb@quicinc.com>
Date: Mon, 16 Sep 2024 15:33:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next] drm/msm: Remove unneeded semicolon
To: Yang Li <yang.lee@linux.alibaba.com>, <robdclark@gmail.com>,
 <dmitry.baryshkov@linaro.org>, <airlied@gmail.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, Abaci
 Robot <abaci@linux.alibaba.com>
References: <20240903005655.4183-1-yang.lee@linux.alibaba.com>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240903005655.4183-1-yang.lee@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: ldKj-MgSZdv3ahSQ8ulZKztzpJzJ3Jr9
X-Proofpoint-ORIG-GUID: ldKj-MgSZdv3ahSQ8ulZKztzpJzJ3Jr9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501 clxscore=1011
 mlxlogscore=993 mlxscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409160153
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



On 9/2/2024 5:56 PM, Yang Li wrote:
> ./drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c:282:2-3: Unneeded semicolon
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=9852
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>   drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 

Change looks fine but can you pls have a short one line in the commit 
text instead of just pasting the error from the errorchecker?

> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
> index 0e3a2b16a2ce..65cf237c6b4e 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
> @@ -279,7 +279,7 @@ static int pll_get_post_div(struct hdmi_8998_post_divider *pd, u64 bclk)
>   	case 25:
>   		found_hsclk_divsel = 14;
>   		break;
> -	};
> +	}
>   
>   	pd->vco_freq = found_vco_freq;
>   	pd->tx_band_sel = found_tx_band_sel;
