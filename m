Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E7B64F650
	for <lists+dri-devel@lfdr.de>; Sat, 17 Dec 2022 01:32:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CEEB10E0FF;
	Sat, 17 Dec 2022 00:32:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D24F10E0FF;
 Sat, 17 Dec 2022 00:32:12 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BGNvgfc025586; Sat, 17 Dec 2022 00:31:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=FafqiLihfvYH5H7Y7SIlIE8yTDE/hyI2tDCM/GdByH8=;
 b=hTic8mXYodZ8Xrhu5RrCiezRSrJeg6os5cFO1ymuYJApKOxRW2adj0FaqubJoKa76ffh
 JM1aPZGtc3QdMpnmMrGZY97aYr++qwYmfsf18W4iGqopYzYyhdBRuXHi+j3cf9Dtl+jv
 iDVgcI5QYCZZhjl2TmioZP/ht9tMwTVHjKVqqXd+Rmqwj4MhK78nOi3LDa3nY9L2CyGn
 G+hC4FD68Ni4jrU07CsEkPiWcva+/iLwqPaN1XU5wQDI3JRiO9tiQmKYJQIk9m3jUrJ5
 LuDd6J1j12DB4pcnnlqVFwrs+vTEeTsQLhM6kefqxMl1oqZJ98+NwRBZzP7aPYDgbz0y +g== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mg2vwdp4s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 17 Dec 2022 00:31:59 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BH0VvwA007108
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 17 Dec 2022 00:31:57 GMT
Received: from [10.110.127.101] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 16 Dec
 2022 16:31:55 -0800
Message-ID: <642b0063-b3b1-fb01-b761-dfd30cea1c8c@quicinc.com>
Date: Fri, 16 Dec 2022 16:31:55 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [RFC PATCH 5/6] drm/msm/dsi: Flip greater-than check for
 slice_count and slice_per_intf
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>,
 <phone-devel@vger.kernel.org>, Rob Clark <robdclark@gmail.com>, "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>, Vinod Koul <vkoul@kernel.org>
References: <20221213232207.113607-1-marijn.suijten@somainline.org>
 <20221213232207.113607-6-marijn.suijten@somainline.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20221213232207.113607-6-marijn.suijten@somainline.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: FK0lp_-c3vUi5LUMC6uEjQ8ZD6Xz6TkT
X-Proofpoint-ORIG-GUID: FK0lp_-c3vUi5LUMC6uEjQ8ZD6Xz6TkT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-16_15,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 clxscore=1015 phishscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212170002
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
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, Vinod
 Polimera <quic_vpolimer@quicinc.com>, Sam
 Ravnborg <sam@ravnborg.org>, Haowen Bai <baihaowen@meizu.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Jessica
 Zhang <quic_jesszhan@quicinc.com>, Jani Nikula <jani.nikula@intel.com>,
 linux-arm-msm@vger.kernel.org, Stephen
 Boyd <swboyd@chromium.org>, Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 Loic Poulain <loic.poulain@linaro.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, sunliming <sunliming@kylinos.cn>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/13/2022 3:22 PM, Marijn Suijten wrote:
> According to downstream /and the comment copied from it/ this comparison
> should be the other way around.  In other words, when the panel driver
> requests to use more slices per packet than what could be sent over this
> interface, it is bumped down to only use a single slice per packet (and
> strangely not the number of slices that could fit on the interface).
> 
> Fixes: 08802f515c3c ("drm/msm/dsi: Add support for DSC configuration")

Like others have said, with SOB,
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 0686c35a6fd4..9bdfa0864cdf 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -855,11 +855,11 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
>   	 */
>   	slice_per_intf = DIV_ROUND_UP(hdisplay, dsc->slice_width);
>   
> -	/* If slice_per_pkt is greater than slice_per_intf
> +	/* If slice_count is greater than slice_per_intf
>   	 * then default to 1. This can happen during partial
>   	 * update.
>   	 */
> -	if (slice_per_intf > dsc->slice_count)
> +	if (dsc->slice_count > slice_per_intf)
>   		dsc->slice_count = 1;
>   
>   	total_bytes_per_intf = dsc->slice_chunk_size * slice_per_intf;
