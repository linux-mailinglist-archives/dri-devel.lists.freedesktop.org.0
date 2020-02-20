Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0E9165F9A
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 15:19:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E79146ED9F;
	Thu, 20 Feb 2020 14:19:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63F2C6ED9F;
 Thu, 20 Feb 2020 14:19:12 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01KECeAT007106; Thu, 20 Feb 2020 15:19:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=QlUGZTuoMUc1dwxoiAQCd8zB3lydhgaADIc3eS00b2c=;
 b=P7zQBCq3dQOJ00O+HCLfz3PkPBCWwNSUBlVlmmXq8yRe1tiDAxqX6+JMul47IWrpwNy/
 z6bFwUw/hdl4DqdDjFWShaV9ZBo330+QoWpSTWXll3zPPsQwUIln1jJiPCb9/sGQ/7GZ
 EUFOhilZrORiWSHmahVpjW97+bE2crtb36sobXrDmA25ucnkHz5+j2wHEvGW/kkyNx5e
 aNXRuA0oiACwZl8rGhfCZwL7AXMWIsDz/YldS8RBXsMOxjWOQVjjI3/uAwrBY+ndjNCa
 lmIm2XVF1u+9ZybQy/+/hCO3gyAQ+8hajeM+kIHDLXsPiBIUKCPHdyVHlvIDa+aFkcFx 6g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y8ub5shpu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Feb 2020 15:19:04 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A2E7D100034;
 Thu, 20 Feb 2020 15:18:58 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6DC342B973E;
 Thu, 20 Feb 2020 15:18:58 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 20 Feb
 2020 15:18:58 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 20 Feb 2020 15:18:57 +0100
From: Philippe CORNU <philippe.cornu@st.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, DRI Development
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 39/52] drm/stm: Drop explicit drm_mode_config_cleanup call
Thread-Topic: [PATCH 39/52] drm/stm: Drop explicit drm_mode_config_cleanup call
Thread-Index: AQHV5w53JBGcuh+ck0uFR4jzroqrEKgkEnuA
Date: Thu, 20 Feb 2020 14:18:57 +0000
Message-ID: <30ed80c9-8b18-8e23-a26b-2c406d43c90d@st.com>
References: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
 <20200219102122.1607365-40-daniel.vetter@ffwll.ch>
In-Reply-To: <20200219102122.1607365-40-daniel.vetter@ffwll.ch>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
Content-ID: <8C828A7F0F981D489FD421A3FF938F65@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-20_04:2020-02-19,
 2020-02-20 signatures=0
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Yannick FERTRE <yannick.fertre@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Daniel
 Vetter <daniel.vetter@intel.com>, Vincent ABRIOU <vincent.abriou@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Alexandre TORGUE <alexandre.torgue@st.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

On 2/19/20 11:21 AM, Daniel Vetter wrote:
> It's right above the drm_dev_put().
> 
> Aside: Another driver with a bit much devm_kzalloc, which should
> probably use drmm_kzalloc instead ...
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Yannick Fertre <yannick.fertre@st.com>
> Cc: Philippe Cornu <philippe.cornu@st.com>
> Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
> Cc: Vincent Abriou <vincent.abriou@st.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>   drivers/gpu/drm/stm/drv.c | 10 ++++------
>   1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/stm/drv.c b/drivers/gpu/drm/stm/drv.c
> index ea9fcbdc68b3..5b374531dd8c 100644
> --- a/drivers/gpu/drm/stm/drv.c
> +++ b/drivers/gpu/drm/stm/drv.c
> @@ -88,7 +88,9 @@ static int drv_load(struct drm_device *ddev)
>   
>   	ddev->dev_private = (void *)ldev;
>   
> -	drm_mode_config_init(ddev);
> +	ret = drm_mode_config_init(ddev);
> +	if (ret)
> +		return ret;
>   
>   	/*
>   	 * set max width and height as default value.
> @@ -103,7 +105,7 @@ static int drv_load(struct drm_device *ddev)
>   
>   	ret = ltdc_load(ddev);
>   	if (ret)
> -		goto err;
> +		return ret;
>   
>   	drm_mode_config_reset(ddev);
>   	drm_kms_helper_poll_init(ddev);
> @@ -111,9 +113,6 @@ static int drv_load(struct drm_device *ddev)
>   	platform_set_drvdata(pdev, ddev);
>   
>   	return 0;
> -err:
> -	drm_mode_config_cleanup(ddev);
> -	return ret;
>   }
>   
>   static void drv_unload(struct drm_device *ddev)
> @@ -122,7 +121,6 @@ static void drv_unload(struct drm_device *ddev)
>   
>   	drm_kms_helper_poll_fini(ddev);
>   	ltdc_unload(ddev);
> -	drm_mode_config_cleanup(ddev);
>   }
>   
>   static __maybe_unused int drv_suspend(struct device *dev)
> 

Thank you for your patch,
For this stm part,
Acked-by: Philippe Cornu <philippe.cornu@st.com>

note: we will handle devm_kzalloc() asap, thanks.

Philippe :-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
