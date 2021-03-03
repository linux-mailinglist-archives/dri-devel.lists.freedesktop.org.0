Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA0C32B900
	for <lists+dri-devel@lfdr.de>; Wed,  3 Mar 2021 16:42:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 520E76E199;
	Wed,  3 Mar 2021 15:42:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 801836E199
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Mar 2021 15:42:04 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 123FV1Iw013435
 for <dri-devel@lists.freedesktop.org>; Wed, 3 Mar 2021 16:42:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=G7hBdVhTStDGePQzzwf0GcGqdxZLtsn5Dcgq+1CvVT4=;
 b=jnNGONnZRfzde9tfql+cL8ZbaFT/513qtlBUZDLJHOnL5Ma3yQdDqz9tWF2FmJFYoWPh
 27ZFSkIDp0CfFJ0tjyx1iXJGVGJDyFq62GDkbcZY65TGllKsiOyZv3ih7GGfYmM+KI1M
 AqwbhavfVGToNZc68jkuI84rNeResyf87Dkr+MfwT3DDKrRfeHB/uQ2QbKiPZQV8TNz2
 5nzERXFvT0SXakjFY2+aY0JfCe0z2JX4E3BJY4X1vy8vqkueQ4bZvQQ5q0OrX6LiBBVW
 0Qd6vWLi1bCMVc5ynEUfjajMlhwWdCKCIwhJsHhw87++EIpWT0Gzp0JShc/ksbbr7n4H sw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 370xehxgym-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Mar 2021 16:42:02 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 285BD10002A
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Mar 2021 16:42:01 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 97F44246CE0
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Mar 2021 16:42:01 +0100 (CET)
Received: from lmecxl0951.lme.st.com (10.75.127.51) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 3 Mar
 2021 16:42:01 +0100
Subject: Re: [PATCH] drm/stm: ltdc: Use simple encoder
To: <dri-devel@lists.freedesktop.org>
References: <20210302175700.28640-1-jagan@amarulasolutions.com>
From: yannick Fertre <yannick.fertre@foss.st.com>
Message-ID: <ff263bca-23fd-2459-dc57-f217fe7f4ee5@foss.st.com>
Date: Wed, 3 Mar 2021 16:42:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210302175700.28640-1-jagan@amarulasolutions.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-03_05:2021-03-03,
 2021-03-03 signatures=0
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks Jagan for the patch.

Tested-by: Yannick Fertre <yannick.fertre@foss.st.com>


On 3/2/21 6:57 PM, Jagan Teki wrote:
> STM ltdc driver uses an empty implementation for its encoder.
> Replace the code with the generic simple encoder.
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>   drivers/gpu/drm/stm/ltdc.c | 12 ++----------
>   1 file changed, 2 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
> index 7812094f93d6..aeeb43524ca0 100644
> --- a/drivers/gpu/drm/stm/ltdc.c
> +++ b/drivers/gpu/drm/stm/ltdc.c
> @@ -31,6 +31,7 @@
>   #include <drm/drm_of.h>
>   #include <drm/drm_plane_helper.h>
>   #include <drm/drm_probe_helper.h>
> +#include <drm/drm_simple_kms_helper.h>
>   #include <drm/drm_vblank.h>
>   
>   #include <video/videomode.h>
> @@ -1020,14 +1021,6 @@ static int ltdc_crtc_init(struct drm_device *ddev, struct drm_crtc *crtc)
>   	return ret;
>   }
>   
> -/*
> - * DRM_ENCODER
> - */
> -
> -static const struct drm_encoder_funcs ltdc_encoder_funcs = {
> -	.destroy = drm_encoder_cleanup,
> -};
> -
>   static void ltdc_encoder_disable(struct drm_encoder *encoder)
>   {
>   	struct drm_device *ddev = encoder->dev;
> @@ -1088,8 +1081,7 @@ static int ltdc_encoder_init(struct drm_device *ddev, struct drm_bridge *bridge)
>   	encoder->possible_crtcs = CRTC_MASK;
>   	encoder->possible_clones = 0;	/* No cloning support */
>   
> -	drm_encoder_init(ddev, encoder, &ltdc_encoder_funcs,
> -			 DRM_MODE_ENCODER_DPI, NULL);
> +	drm_simple_encoder_init(ddev, encoder, DRM_MODE_ENCODER_DPI);
>   
>   	drm_encoder_helper_add(encoder, &ltdc_encoder_helper_funcs);
>   
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
