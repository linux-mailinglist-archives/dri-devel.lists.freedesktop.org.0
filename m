Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5301C7A53CA
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 22:19:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB0B110E110;
	Mon, 18 Sep 2023 20:19:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F53E10E110
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 20:19:19 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38IJVARB008267; Mon, 18 Sep 2023 20:19:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=qoL1peJgI4Z3/seMES33sPfDRXNv7Ya2/T8Tlk0Bs00=;
 b=Tm40X+naZD9DpiigjEk8e29h8Nr3A3yT3OfQ2KQzKDc8MDPk7CU20uh3r8IYWESGU1LO
 Yq8l287eFkzRwhHTyTfdc66ktaO7nH/Zw4PoHkgPpKTBJdorf3SSzIz0lPjlULJaJ182
 W4MSqHwumoBCGR/APBswTKfRNXjLbuN9wjZ2d9E+NXAHsvnD30+vgGVnuX4mgSM5zpBB
 CsWmGPFN3rGCdWPBXMo2yemFTVzL7jKhiH2WT4cMl8JJb4kl7LbZootZOHtB51vQPj9L
 5wK715T1p74gLizTargvvvrsqg7ZYlLRgZcoEwUDHT69Y+p/R0/8WRyACGCM8vqgLRWw Uw== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t6trqgbj6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Sep 2023 20:19:05 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38IKJ47X027242
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Sep 2023 20:19:04 GMT
Received: from [10.110.125.66] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Mon, 18 Sep
 2023 13:19:03 -0700
Message-ID: <7fc1ca68-ca7c-59b2-0b70-27bc34d83cee@quicinc.com>
Date: Mon, 18 Sep 2023 13:19:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 3/9] drm/panel: nv3052c: Sleep for 150ms after reset
Content-Language: en-US
To: John Watts <contact@jookia.org>, <dri-devel@lists.freedesktop.org>
References: <20230918125853.2249187-1-contact@jookia.org>
 <20230918125853.2249187-4-contact@jookia.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20230918125853.2249187-4-contact@jookia.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: ayYnVZ53QKPnSQW0EEoa2IqOF-3MnFQ4
X-Proofpoint-ORIG-GUID: ayYnVZ53QKPnSQW0EEoa2IqOF-3MnFQ4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-18_09,2023-09-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 impostorscore=0 clxscore=1011 lowpriorityscore=0 malwarescore=0
 mlxlogscore=999 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309180177
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, Chris Morgan <macromorgan@hotmail.com>,
 linux-kernel@vger.kernel.org, Jagan Teki <jagan@edgeble.ai>,
 Paul Cercueil <paul@crapouillou.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>,
 Christophe Branchereau <cbranchereau@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 9/18/2023 5:58 AM, John Watts wrote:
> The current code waits after resets for 5 to 20 milliseconds.
> This is appropriate when resetting a sleeping panel, but an awake panel
> requires at least 120ms of waiting.
> 
> Sleep for 150ms so the panel always completes it reset properly.
> 
> Signed-off-by: John Watts <contact@jookia.org>

Hi John,

Just wondering, is there some context to this change? I.e., was this 
made to fix a specific issue?

This seems like a pretty significant increase in wait time so, if it's 
not a fix, I'm not sure if this would be an improvement on the current 
behavior.

Thanks,

Jessica Zhang

> ---
>   drivers/gpu/drm/panel/panel-newvision-nv3052c.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-newvision-nv3052c.c b/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
> index 90dea21f9856..2526b123b1f5 100644
> --- a/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
> +++ b/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
> @@ -258,7 +258,7 @@ static int nv3052c_prepare(struct drm_panel *panel)
>   	gpiod_set_value_cansleep(priv->reset_gpio, 1);
>   	usleep_range(10, 1000);
>   	gpiod_set_value_cansleep(priv->reset_gpio, 0);
> -	usleep_range(5000, 20000);
> +	msleep(150);
>   
>   	for (i = 0; i < ARRAY_SIZE(nv3052c_panel_regs); i++) {
>   		err = mipi_dbi_command(dbi, nv3052c_panel_regs[i].cmd,
> -- 
> 2.42.0
> 
