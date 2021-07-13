Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED873C7525
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 18:43:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A3D489127;
	Tue, 13 Jul 2021 16:43:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B594C88A36
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jul 2021 16:43:37 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16DGgCqI002362; Tue, 13 Jul 2021 18:43:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=NrBQl9PQESREt4QlXIBNF8Tt2SNqFzKjdzUeXCZXIRY=;
 b=g7e3iRqhdFQEddPfNK0dM1UQChXrP5M37p1BMCh2j9rGdpkH7ChYwy1rRP+PvoVDM3Dl
 tNXCU3hNLoqoD0XIMxjGbPkc0mGKLNpsAcoQFL8JHUZHQlLlV3n9scAOGJjZLmbV5kmk
 Me1m6bLcHupFxfalQX9/1dfZKh2LGTR36cIx+UyPM2SkSxzfywaT3djBimJjTpdRxZTB
 m69F8bK8eiqfPaVwg+QguAhgdaLhDKFvPBMvDpfaxCIynTa19S2tBuCBOriodn04O61W
 ERVwPNTYo4GXEYrY+mfTh/QcsPofk3ejA1Kjw5Ae3Ewj/GnF6ALVDb3wkSuNR13+brXg SA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39sdk40ar1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jul 2021 18:43:30 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 18EAD10002A;
 Tue, 13 Jul 2021 18:43:28 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D34CF248EC3;
 Tue, 13 Jul 2021 18:43:28 +0200 (CEST)
Received: from lmecxl0993.lme.st.com (10.75.127.47) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 13 Jul
 2021 18:43:28 +0200
Subject: Re: [PATCH] drm/stm: ltdc: Silence -EPROBE_DEFER till bridge attached
To: Jagan Teki <jagan@amarulasolutions.com>, Yannick Fertre
 <yannick.fertre@foss.st.com>, Benjamin Gaignard
 <benjamin.gaignard@linaro.org>
References: <20210704135914.268308-1-jagan@amarulasolutions.com>
From: Philippe CORNU <philippe.cornu@foss.st.com>
Message-ID: <9008c9b8-ae48-588c-cfb4-cda7323e15dd@foss.st.com>
Date: Tue, 13 Jul 2021 18:43:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210704135914.268308-1-jagan@amarulasolutions.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-13_10:2021-07-13,
 2021-07-13 signatures=0
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

Many thanks for your patch.

This means that we are counting on the future success of the deferred 
probe because we do not clean the encoder...
However, Yannick gave his "Tested-by" and this patch seems useful so

Acked-by: Philippe Cornu <philippe.cornu@foss.st.com>

I will merge it friday or early next week,

Thank you
Philippe :-)


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
