Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A2014654C
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2020 11:03:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5E8A6FBA0;
	Thu, 23 Jan 2020 10:03:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FA8D6FBA0
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2020 10:03:16 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00N9mC54013055; Thu, 23 Jan 2020 10:48:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=5SeB8s9x5wreO4d7oXmbLoQrU983LvSqPs1ieUjIzyc=;
 b=kwE+guB4L+TVQrsvECuZKE3pAe4MDcMpp91Cq7pFu6eBCAOy503dDk9w9cH0KIK6vL5X
 61EQIPLI0+LTzvLPlbCnp+TO5qjB1ojfB+eRhw4SQCU/ZuGLdCB7X1YfcGLTg/EsiNz5
 nlOjb3aB8I9Kz6P6xxv+3WTz85bcdneeP9LZqAX994RT+OoDxEuU2Ay9c2IUMTuG7Dgk
 SqtnoRHt72jALZaUqv9lX8ubtifxrwc8iHAJpZw4iy51Ln5sdvedYIVA+FzDFXY01zvZ
 7Xxqx5eKRM81VMnrLGYD9SMaaoyLWQSSWkRjTxQhVeZMIwBXJCh8PKn73dMR1BDgf4i+ 7g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xkr1e9h4q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jan 2020 10:48:31 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CA5F110002A;
 Thu, 23 Jan 2020 10:48:30 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BCFF421FEBE;
 Thu, 23 Jan 2020 10:48:30 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 23 Jan
 2020 10:48:30 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 23 Jan 2020 10:48:30 +0100
From: Philippe CORNU <philippe.cornu@st.com>
To: Yannick FERTRE <yannick.fertre@st.com>, Benjamin GAIGNARD
 <benjamin.gaignard@st.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, "Alexandre
 TORGUE" <alexandre.torgue@st.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/stm: ltdc: add number of interrupts
Thread-Topic: [PATCH] drm/stm: ltdc: add number of interrupts
Thread-Index: AQHV0EN8f8iUffIhZ0Oxt7cntisoXKf38z2A
Date: Thu, 23 Jan 2020 09:48:30 +0000
Message-ID: <2b967bed-c2fa-1575-3e06-ae5b19069e56@st.com>
References: <1579601632-7001-1-git-send-email-yannick.fertre@st.com>
In-Reply-To: <1579601632-7001-1-git-send-email-yannick.fertre@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
Content-ID: <D570B8DBE1872C4E9FC6288AD5D884E0@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-23_01:2020-01-23,
 2020-01-22 signatures=0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dear Yannick,
Thank you for your patch,

Acked-by: Philippe Cornu <philippe.cornu@st.com>

Philippe :-)

On 1/21/20 11:13 AM, Yannick Fertre wrote:
> The number of interrupts depends on the ltdc version.
> Don't try to get interrupt which not exist, avoiding
> kernel warning messages.
> 
> Signed-off-by: Yannick Fertre <yannick.fertre@st.com>
> ---
>   drivers/gpu/drm/stm/ltdc.c | 30 +++++++++++++++---------------
>   drivers/gpu/drm/stm/ltdc.h |  1 +
>   2 files changed, 16 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
> index c2815e8..58092b0 100644
> --- a/drivers/gpu/drm/stm/ltdc.c
> +++ b/drivers/gpu/drm/stm/ltdc.c
> @@ -1146,12 +1146,14 @@ static int ltdc_get_caps(struct drm_device *ddev)
>   		ldev->caps.pad_max_freq_hz = 90000000;
>   		if (ldev->caps.hw_version == HWVER_10200)
>   			ldev->caps.pad_max_freq_hz = 65000000;
> +		ldev->caps.nb_irq = 2;
>   		break;
>   	case HWVER_20101:
>   		ldev->caps.reg_ofs = REG_OFS_4;
>   		ldev->caps.pix_fmt_hw = ltdc_pix_fmt_a1;
>   		ldev->caps.non_alpha_only_l1 = false;
>   		ldev->caps.pad_max_freq_hz = 150000000;
> +		ldev->caps.nb_irq = 4;
>   		break;
>   	default:
>   		return -ENODEV;
> @@ -1251,13 +1253,21 @@ int ltdc_load(struct drm_device *ddev)
>   	reg_clear(ldev->regs, LTDC_IER,
>   		  IER_LIE | IER_RRIE | IER_FUIE | IER_TERRIE);
>   
> -	for (i = 0; i < MAX_IRQ; i++) {
> +	ret = ltdc_get_caps(ddev);
> +	if (ret) {
> +		DRM_ERROR("hardware identifier (0x%08x) not supported!\n",
> +			  ldev->caps.hw_version);
> +		goto err;
> +	}
> +
> +	DRM_DEBUG_DRIVER("ltdc hw version 0x%08x\n", ldev->caps.hw_version);
> +
> +	for (i = 0; i < ldev->caps.nb_irq; i++) {
>   		irq = platform_get_irq(pdev, i);
> -		if (irq == -EPROBE_DEFER)
> +		if (irq < 0) {
> +			ret = irq;
>   			goto err;
> -
> -		if (irq < 0)
> -			continue;
> +		}
>   
>   		ret = devm_request_threaded_irq(dev, irq, ltdc_irq,
>   						ltdc_irq_thread, IRQF_ONESHOT,
> @@ -1268,16 +1278,6 @@ int ltdc_load(struct drm_device *ddev)
>   		}
>   	}
>   
> -
> -	ret = ltdc_get_caps(ddev);
> -	if (ret) {
> -		DRM_ERROR("hardware identifier (0x%08x) not supported!\n",
> -			  ldev->caps.hw_version);
> -		goto err;
> -	}
> -
> -	DRM_DEBUG_DRIVER("ltdc hw version 0x%08x\n", ldev->caps.hw_version);
> -
>   	/* Add endpoints panels or bridges if any */
>   	for (i = 0; i < MAX_ENDPOINTS; i++) {
>   		if (panel[i]) {
> diff --git a/drivers/gpu/drm/stm/ltdc.h b/drivers/gpu/drm/stm/ltdc.h
> index a1ad0ae..310e87f 100644
> --- a/drivers/gpu/drm/stm/ltdc.h
> +++ b/drivers/gpu/drm/stm/ltdc.h
> @@ -19,6 +19,7 @@ struct ltdc_caps {
>   	const u32 *pix_fmt_hw;	/* supported pixel formats */
>   	bool non_alpha_only_l1; /* non-native no-alpha formats on layer 1 */
>   	int pad_max_freq_hz;	/* max frequency supported by pad */
> +	int nb_irq;		/* number of hardware interrupts */
>   };
>   
>   #define LTDC_MAX_LAYER	4
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
