Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D90C4053C0
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 15:08:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE63B6E861;
	Thu,  9 Sep 2021 13:08:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37C506E861
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Sep 2021 13:08:29 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 1899nKOw011941;
 Thu, 9 Sep 2021 15:08:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=0h6LGpjEEk31pGIeJNfLae2R0C+9agXmaUSCwB2Bnks=;
 b=VKroyFG258TOB2ODpltjzUUgcbYlQd1yUtX6n8elNAVQAn/xpLxu2t8GODbvPtCr1iB5
 wlHalxMGuGFLbpInvhOzcwenqJQRM7GzMxa3y1rkn8DaqutE+DMbeKSqqLM/kuKr1UdK
 3Vy3wU8y9/XxOt7K21l5D5yPD4e22eaPv/ZDOrYdJ2fGJzOaW82enSpDBEmzrlj1GZSa
 8vExjV+7OVb8Bzff+k6PEFiaiNVOpueLNSz8QkNVxvZwxJRIVv5dmXbG2HMXhi9stacl
 YitqLBsIGVqFCQI8UPHdTV7euYxrLxsLyPHeNp+7uzf0FtNxJ2YgUwhM91pZWWcLVAnq rg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3ay86m3hfh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Sep 2021 15:08:23 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C813610003D;
 Thu,  9 Sep 2021 15:08:21 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag1node3.st.com [10.75.127.3])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8A0D821B302;
 Thu,  9 Sep 2021 15:08:15 +0200 (CEST)
Received: from lmecxl0993.lme.st.com (10.75.127.51) by SFHDAG1NODE3.st.com
 (10.75.127.3) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 9 Sep
 2021 15:08:14 +0200
Subject: Re: [PATCH v2] drm/stm: ltdc: attach immutable zpos property to planes
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, Yannick Fertre
 <yannick.fertre@foss.st.com>, Benjamin Gaignard
 <benjamin.gaignard@linaro.org>
CC: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, <dri-devel@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 Raphael Gallais-Pou <raphael.gallais-pou@st.com>
References: <20210907151323.5850-1-raphael.gallais-pou@foss.st.com>
From: Philippe CORNU <philippe.cornu@foss.st.com>
Message-ID: <b3f0b75f-10c5-72f2-be85-8d8ee7c80f6b@foss.st.com>
Date: Thu, 9 Sep 2021 15:08:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210907151323.5850-1-raphael.gallais-pou@foss.st.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG1NODE3.st.com
 (10.75.127.3)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-09_04,2021-09-09_01,2020-04-07_01
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



On 9/7/21 5:13 PM, Raphael Gallais-Pou wrote:
> Defines plane ordering by hard-coding an immutable Z position from the
> first plane, used as primary layer, to the next ones as overlay in order
> of instantiation.
> 
> This zpos is only an information as it is not possible to modify it,
> blending operations are still applied from the top to the bottom layer.
> 
> This patch helps to remove a warning message from the Android
> Hardware Composer.
> 
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> Acked-by: Yannick Fertre <yannick.fertre@foss.st.com>
> Reviewed-by: Yannick Fertre <yannick.fertre@foss.st.com>
> ---
>   drivers/gpu/drm/stm/ltdc.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
> index 195de30eb90c..bd603ef5e935 100644
> --- a/drivers/gpu/drm/stm/ltdc.c
> +++ b/drivers/gpu/drm/stm/ltdc.c
> @@ -1024,6 +1024,8 @@ static int ltdc_crtc_init(struct drm_device *ddev, struct drm_crtc *crtc)
>   		return -EINVAL;
>   	}
>   
> +	drm_plane_create_zpos_immutable_property(primary, 0);
> +
>   	ret = drm_crtc_init_with_planes(ddev, crtc, primary, NULL,
>   					&ltdc_crtc_funcs, NULL);
>   	if (ret) {
> @@ -1046,6 +1048,7 @@ static int ltdc_crtc_init(struct drm_device *ddev, struct drm_crtc *crtc)
>   			DRM_ERROR("Can not create overlay plane %d\n", i);
>   			goto cleanup;
>   		}
> +		drm_plane_create_zpos_immutable_property(overlay, i);
>   	}
>   
>   	return 0;
> 

Applied on drm-misc-next.
Many thanks for your patch,
Philippe :-)
