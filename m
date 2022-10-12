Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 038005FCEC0
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 01:08:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 217B810E231;
	Wed, 12 Oct 2022 23:08:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D40910E22E;
 Wed, 12 Oct 2022 23:08:20 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29CGmEtj018142;
 Wed, 12 Oct 2022 23:08:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=LvplJzo5Whv7S/wgHZo75WQPA/gbMCcpBW3FT+HJ26w=;
 b=oqPKYQvPDOc2f7YqFjKPRQJUJYG1fpVSPgpLeg1xcAwNWUHYXBmZpXlY0rMKHJ1VJUhV
 uWfmZSuoZCap/Tv/9DkMwC8J5I7W6ksdA417oVJ9T/uwpWYG6Ni2GXA6NEJk8sM7BEBS
 S9xC5pa2PCVRE/MmbzCdYoDiPXHiy2QvCfbPmT+tTqlfSX6pBUJUc5c658/YsuG15QII
 9i/kD5cvRmr61Wse9nSlk+TeexZAvL+NeSdB72tybRBE7nWMkcQXLLy2r7QI3w9N9SXB
 1u0xh6OTVH7H9Kzokv6Qs3lJ0c/ia+7k0Ir0dnySZQ/3KKKFKC0xDCwKsIFadsGlMDTr ig== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3k5x7g1p1d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Oct 2022 23:08:13 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 29CN8CXi022439
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Oct 2022 23:08:12 GMT
Received: from [10.38.241.12] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Wed, 12 Oct
 2022 16:08:09 -0700
Message-ID: <eda0e4c0-2b5a-f2e9-0c53-a417fe85f12f@quicinc.com>
Date: Wed, 12 Oct 2022 16:08:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v3 07/10] drm/msm/dsi: Disallow 8 BPC DSC configuration
 for alternative BPC values
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>,
 <phone-devel@vger.kernel.org>
References: <20221009184824.457416-1-marijn.suijten@somainline.org>
 <20221009185150.461323-1-marijn.suijten@somainline.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20221009185150.461323-1-marijn.suijten@somainline.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: mMsz96t8DOp4hd-kZaytjLua80Ay2bQg
X-Proofpoint-ORIG-GUID: mMsz96t8DOp4hd-kZaytjLua80Ay2bQg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-12_11,2022-10-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 clxscore=1015 mlxlogscore=999
 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210120144
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
Cc: freedreno@lists.freedesktop.org,
 Jami Kettunen <jami.kettunen@somainline.org>, linux-arm-msm@vger.kernel.org,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Vinod Koul <vkoul@kernel.org>,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10/9/2022 11:51 AM, Marijn Suijten wrote:
> According to the `/* bpc 8 */` comment below only values for a
> bits_per_component of 8 are currently hardcoded in place.  This is
> further confirmed by downstream sources [1] containing different
> constants for other BPC values (and different initial_offset too,
> with an extra dependency on bits_per_pixel).  Prevent future mishaps by
> explicitly disallowing any other bits_per_component value until the
> right parameters are put in place and tested.
> 
> [1]: https://git.codelinaro.org/clo/la/platform/vendor/opensource/display-drivers/-/blob/DISPLAY.LA.2.0.r1-08000-WAIPIO.0/msm/sde_dsc_helper.c#L110-139
> 

Seems like a valid kbot error.

https://patchwork.freedesktop.org/patch/506359/#comment_912830

> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 68c39debc22f..7e6b7e506ae8 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -1774,6 +1774,11 @@ static int dsi_populate_dsc_params(struct drm_dsc_config *dsc)
>   {
>   	int i;
>   
> +	if (dsc->bits_per_component != 8) {
> +		DRM_DEV_ERROR(&msm_host->pdev->dev, "DSI does not support bits_per_component != 8 yet\n");
> +		return -EOPNOTSUPP;
> +	}
> +
>   	dsc->rc_model_size = 8192;
>   	dsc->first_line_bpg_offset = 12;
>   	dsc->rc_edge_factor = 6;
