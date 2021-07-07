Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2282B3BEBE1
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jul 2021 18:18:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F17F6E1A3;
	Wed,  7 Jul 2021 16:18:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 377CD6E112
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jul 2021 16:18:23 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 167GGpEh001466; Wed, 7 Jul 2021 18:18:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=q6ZRt8wYu3JAWTlz2Hw+S+Lmg2EkQ6azSVM1iOGAut4=;
 b=G2pys3L8qIlSZbSHUln/mo0CymN7cmTmhWS3R4UPv4iWtr+RJ2TYQpFfp43J1VzMNAQG
 fh5p/YVq21akB8jOSDJHSBVDndabSytaALJrP0ZOiLdPq3NSqkPcdssKxMiQNFw2n1hS
 VPZ4YXrspBq8d+pWiFJXQ+7GfSfWaB5wXWWbR8CtC1S6Zj71e2yUDbetL/LdYSLTpTHP
 RbvwoFDF4e0LIx4E7rXwpsCzv21nmD+K5uGYe+35gGMy0dMExbfYNHytJDL3xrvHdNyd
 9MA/70UtuGKR9/zXjSCEXJUJZhBWjvTPysQ6dMXqjlg5PRGLjXkdrhl3qlg1bOZ076fl sw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39n8evtu12-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Jul 2021 18:18:20 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CD78210002A;
 Wed,  7 Jul 2021 18:18:18 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 71215231515;
 Wed,  7 Jul 2021 18:18:18 +0200 (CEST)
Received: from lmecxl0951.lme.st.com (10.75.127.50) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 7 Jul
 2021 18:18:17 +0200
Subject: Re: [PATCH] drm/stm: ltdc: Silence -EPROBE_DEFER till bridge attached
To: Jagan Teki <jagan@amarulasolutions.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Benjamin Gaignard
 <benjamin.gaignard@linaro.org>
References: <20210704135914.268308-1-jagan@amarulasolutions.com>
From: yannick Fertre <yannick.fertre@foss.st.com>
Message-ID: <b9264009-81be-e722-1127-c69baf72f4ce@foss.st.com>
Date: Wed, 7 Jul 2021 18:18:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210704135914.268308-1-jagan@amarulasolutions.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-07_08:2021-07-06,
 2021-07-07 signatures=0
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
Cc: linux-arm-kernel@lists.infradead.org, linux-amarula@amarulasolutions.com,
 linux-stm32@st-md-mailman.stormreply.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jagan,

thanks for the patch.

Tested-by: Yannick Fertre <yannick.fertre@foss.st.com>


On 7/4/21 3:59 PM, Jagan Teki wrote:
> As dw-mipi-dsi supported all possible ways to find the DSI
> devices. It can take multiple iterations for ltdc to find
> all components attached to the DSI bridge.
> 
> The current ltdc driver failed to find the endpoint as
> it returned -EINVAL for the first iteration itself. This leads
> to following error:
> 
> [    3.099289] [drm:ltdc_load] *ERROR* init encoder endpoint 0
> 
> So, check the return value and cleanup the encoder only if it's
> not -EPROBE_DEFER. This make all components in the attached DSI
> bridge found properly.
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>   drivers/gpu/drm/stm/ltdc.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
> index 08b71248044d..95e983d3ffb5 100644
> --- a/drivers/gpu/drm/stm/ltdc.c
> +++ b/drivers/gpu/drm/stm/ltdc.c
> @@ -1122,8 +1122,9 @@ static int ltdc_encoder_init(struct drm_device *ddev, struct drm_bridge *bridge)
>   
>   	ret = drm_bridge_attach(encoder, bridge, NULL, 0);
>   	if (ret) {
> -		drm_encoder_cleanup(encoder);
> -		return -EINVAL;
> +		if (ret != -EPROBE_DEFER)
> +			drm_encoder_cleanup(encoder);
> +		return ret;
>   	}
>   
>   	DRM_DEBUG_DRIVER("Bridge encoder:%d created\n", encoder->base.id);
> @@ -1266,7 +1267,8 @@ int ltdc_load(struct drm_device *ddev)
>   		if (bridge) {
>   			ret = ltdc_encoder_init(ddev, bridge);
>   			if (ret) {
> -				DRM_ERROR("init encoder endpoint %d\n", i);
> +				if (ret != -EPROBE_DEFER)
> +					DRM_ERROR("init encoder endpoint %d\n", i);
>   				goto err;
>   			}
>   		}
> 
