Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80DCD62F7FD
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 15:45:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD1B28984C;
	Fri, 18 Nov 2022 14:45:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED9758984C;
 Fri, 18 Nov 2022 14:45:25 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AIDnVpO003487; Fri, 18 Nov 2022 14:45:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=45szKB9HMCIjJIaxReIAixbIr8tB0OeHjY0Ybc5AIGA=;
 b=lij3t1SQHo50m8fvVqbT1bWDD1n9cUD7mzGjaibWkq24SQdxwsc5q+ZUmIescptPHjk1
 k5LU0bu3BP6OhTodN4aJ20+piv/T+H3lemwz5koJMT+dpAw1VXOXxT9rxEUOjDbmT1/v
 ZYM8dx1yO+uJIJMxisu1AIJVZwckinwEgTmeSVWisTTI5/1cpkp+eUaJwhBvb085HSdZ
 wqqDaGhAmkWZbER3U70tKeZDmXQhKLwIvkvVTz6S47eslG249UqzFh4YLphH+tZsV0T2
 SyWy9ejV762Jn4v3MfHxSs+5FIUX5Wjk0C1jXlkWZHXhUf7EXr0/Z8uh1oSwxcNlZPgb pQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kx0s5hxxr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Nov 2022 14:45:18 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2AIEjHh8028370
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Nov 2022 14:45:17 GMT
Received: from [10.216.25.63] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 18 Nov
 2022 06:45:13 -0800
Message-ID: <78794d47-8e58-6586-6798-e8ac169a55fa@quicinc.com>
Date: Fri, 18 Nov 2022 06:45:09 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2] drm/msm/hdmi: remove unnecessary NULL check
Content-Language: en-US
To: Dan Carpenter <error27@gmail.com>, Rob Clark <robdclark@gmail.com>,
 "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
References: <Y3eCqQ2pm1uQnktV@kadam>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <Y3eCqQ2pm1uQnktV@kadam>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: oiMrFxQ69HnT3JqLXuoYKAu4mfcfFEq1
X-Proofpoint-ORIG-GUID: oiMrFxQ69HnT3JqLXuoYKAu4mfcfFEq1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-18_02,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 malwarescore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 impostorscore=0
 adultscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211180086
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>, Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/18/2022 5:03 AM, Dan Carpenter wrote:
> This code was recently refactored in commit and now the "hdmi" pointer
> can't be NULL.  Checking for NULL leads to a Smatch warning:
> 
>      drivers/gpu/drm/msm/hdmi/hdmi.c:141 msm_hdmi_init()
>      warn: variable dereferenced before check 'hdmi' (see line 119)
> 
> Fixes: 69a88d8633ec ("drm/msm/hdmi: move resource allocation to probe function")
> Signed-off-by: Dan Carpenter <error27@gmail.com>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
> v2: Add a Fixes tag.  Re-work the commit message.
> 
>   drivers/gpu/drm/msm/hdmi/hdmi.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
> index 7001fabd0977..4d3fdc806bef 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
> @@ -138,8 +138,7 @@ static int msm_hdmi_init(struct hdmi *hdmi)
>   	return 0;
>   
>   fail:
> -	if (hdmi)
> -		msm_hdmi_destroy(hdmi);
> +	msm_hdmi_destroy(hdmi);
>   
>   	return ret;
>   }
