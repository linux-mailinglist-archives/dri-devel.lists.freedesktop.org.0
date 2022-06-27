Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F91B55BA4D
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 16:11:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C73610F6C3;
	Mon, 27 Jun 2022 14:11:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE95210FCBB
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 14:11:04 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25RDaXfB019798;
 Mon, 27 Jun 2022 16:11:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=KA93Yrp+xPz518APBCgPzL+batU4MawOKzjpozAPkos=;
 b=RpX71VXo/1vChdwxOyzJRNqLy51suo4m9XStA9Ppxo1Z4Qnq/nFoUU7iaJLZuHV/AUKw
 IRtVnEJGpcQVuQCPtpgNonVEYJgYtX/QRryTWafcAHunszudRyOiiBeN65QujjPj0X3Z
 x2CiB3A5kR1dX4ADz7U7FsL0baUeZ2PQ5zRWTyXmSPzJmiuPRx4v6tplZilDPOlxpga0
 1xK0DkPuFKsb6xW6Vu2hir3edDQQE9+hV3HTr7Nb4iNkiVxfqGzECaq2WsMvybWPp2hu
 RDTM48yjZEqfrWKD/iyFy8SKNOivjHXDC9QpOsY6OyGUe6P7y1RPDsywSxBEKtk/HVcV oQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gy9mr1qqf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jun 2022 16:11:01 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9A89A10002A;
 Mon, 27 Jun 2022 16:10:59 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 50BD022176B;
 Mon, 27 Jun 2022 16:10:59 +0200 (CEST)
Received: from [10.48.1.86] (10.75.127.51) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Mon, 27 Jun
 2022 16:10:58 +0200
Message-ID: <51843c58-82ac-6b81-99b6-75c267ff1a59@foss.st.com>
Date: Mon, 27 Jun 2022 16:10:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] drm/stm: ltdc: disable all layers before crtc shutdown
Content-Language: en-US
To: Yannick Fertre <yannick.fertre@foss.st.com>, Raphael Gallais-Pou
 <raphael.gallais-pou@foss.st.com>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <dri-devel@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20220603134151.591997-1-yannick.fertre@foss.st.com>
From: Philippe CORNU <philippe.cornu@foss.st.com>
In-Reply-To: <20220603134151.591997-1-yannick.fertre@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-27_06,2022-06-24_01,2022-06-22_01
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



On 6/3/22 15:41, Yannick Fertre wrote:
> All plans must be disabled before the CRTC shutdown helping
> the crtc to restart from a clean situation (without unwanted
> planes already enable).
> 
> Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>
> ---
>   drivers/gpu/drm/stm/ltdc.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
> index 6bd45df8f5a7..eeefc3260c07 100644
> --- a/drivers/gpu/drm/stm/ltdc.c
> +++ b/drivers/gpu/drm/stm/ltdc.c
> @@ -787,11 +787,17 @@ static void ltdc_crtc_atomic_disable(struct drm_crtc *crtc,
>   {
>   	struct ltdc_device *ldev = crtc_to_ltdc(crtc);
>   	struct drm_device *ddev = crtc->dev;
> +	int layer_index = 0;
>   
>   	DRM_DEBUG_DRIVER("\n");
>   
>   	drm_crtc_vblank_off(crtc);
>   
> +	/* Disable all layers */
> +	for (layer_index = 0; layer_index < ldev->caps.nb_layers; layer_index++)
> +		regmap_write_bits(ldev->regmap, LTDC_L1CR + layer_index * LAY_OFS,
> +				  LXCR_CLUTEN | LXCR_LEN, 0);
> +
>   	/* disable IRQ */
>   	regmap_clear_bits(ldev->regmap, LTDC_IER, IER_RRIE | IER_FUIE | IER_TERRIE);
>   

Dear Yannick,
Many thanks for your patch,
Applied on drm-misc-next.
Have a good day
Philippe :-)
