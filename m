Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 580747EF9FD
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 22:19:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0A7410E794;
	Fri, 17 Nov 2023 21:19:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED0C710E794
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 21:19:22 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AHK0CYm004671; Fri, 17 Nov 2023 21:19:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=e055X8OGpTabMVBBVto2Cmdcd4e+3yfEMPoal/4+PjI=;
 b=b99+UaePfaE94/Ye0B0IVgjcnOeHtgb/09zYHbUJ0pk13O1vPMrigNXKd0xT5vJSGiTz
 q+EZQS5iqXuScbKtJmDnM7TYesiEicbtdeHuNbSqBkEsiVFNJJiPibbSca+H/v31bs47
 bNu4qVC8tulRXaVNddLEXK3pQDyemcJTrMJNksF7+ECzQHyQVFXYtGlQ5+5Z3xhv89g8
 rP9Sl1O0UtmPQIoSJgvfx7gLFkrHSWIAYCON09sSPUSd0gkW2umioVgBIX3HLesobrAC
 pDuGwcp47faLkaxbMq4LsWPiKxXjel+qrOzbQ0GwecEbC3yZSfun1yp9kXhXiAN/9ScT 7A== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ue5exse3c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Nov 2023 21:19:19 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AHLJIQP016616
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Nov 2023 21:19:18 GMT
Received: from [10.71.109.160] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 17 Nov
 2023 13:19:18 -0800
Message-ID: <99d677f1-2bf3-4a78-bc7f-caca612a7c1b@quicinc.com>
Date: Fri, 17 Nov 2023 13:19:17 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/5] drm/panel-elida-kd35t133: hold panel in reset for
 unprepare
Content-Language: en-US
To: Chris Morgan <macroalpha82@gmail.com>, <dri-devel@lists.freedesktop.org>
References: <20231117194405.1386265-1-macroalpha82@gmail.com>
 <20231117194405.1386265-3-macroalpha82@gmail.com>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20231117194405.1386265-3-macroalpha82@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 0LHDKkrRhEw0qx49aqKXXyMUW2rxgz6R
X-Proofpoint-ORIG-GUID: 0LHDKkrRhEw0qx49aqKXXyMUW2rxgz6R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-17_21,2023-11-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 impostorscore=0 bulkscore=0 phishscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311170159
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
Cc: neil.armstrong@linaro.org, sam@ravnborg.org,
 Chris Morgan <macromorgan@hotmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/17/2023 11:44 AM, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> For devices like the Anbernic RG351M and RG351P the panel is wired to
> an always on regulator. When the device suspends and wakes up, there
> are some slight artifacts on the screen that go away over time. If
> instead we hold the panel in reset status after it is unprepared,
> this does not happen.
> 
> Fixes: 5b6603360c12 ("drm/panel: add panel driver for Elida KD35T133 panels")
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

> ---
>   drivers/gpu/drm/panel/panel-elida-kd35t133.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-elida-kd35t133.c b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
> index 6cd8536c09ff..f1fc4a26f447 100644
> --- a/drivers/gpu/drm/panel/panel-elida-kd35t133.c
> +++ b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
> @@ -104,6 +104,8 @@ static int kd35t133_unprepare(struct drm_panel *panel)
>   		return ret;
>   	}
>   
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +
>   	regulator_disable(ctx->iovcc);
>   	regulator_disable(ctx->vdd);
>   
> -- 
> 2.34.1
> 
