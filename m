Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB57C5450E9
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 17:36:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E2A211BBEF;
	Thu,  9 Jun 2022 15:36:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F62011BBEF
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 15:36:08 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 259DPo1v005217;
 Thu, 9 Jun 2022 17:36:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=dtuaJa+m/UILQWaO/yxL+xFFP13Uq2Gpdv1svpwFr3g=;
 b=0hbXc5wbc3TBXmJRjVdxvHtTgD+hdgR/QQ3X6RkSFwTvwuCMq0fzlJJuAmYiPWbyDpIi
 WnAFnxsH8NcS3zUQEfYNJQ4RDX0Xzs4V+MU3yYMriUU57miRd9/GQo/y3S09IYN1d2n3
 FpZEXS5F/ePqqgoOvd+2/Q/0CoBW0DZ3w28Qj4PYiY26Gr2GRf0CAFcIOOTFnXmsORxU
 pRyswoGqlunVLEh4KHs+MbZNJmEmMim0A7gfT+DjZnco18D83w9esEeuqhx4BFqBHiAb
 5Jicb5syWMfTHbUW6lQAGuIybfhU2qmZfL5kXAB0hr2XYNKuEGvBilwp4nGFmF/7f6h8 fQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gj3d41rjh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jun 2022 17:36:04 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 18BA010002A;
 Thu,  9 Jun 2022 17:36:01 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 09C83221793;
 Thu,  9 Jun 2022 17:36:01 +0200 (CEST)
Received: from [10.201.21.53] (10.75.127.51) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Thu, 9 Jun
 2022 17:35:57 +0200
Message-ID: <a41e67b1-49e1-df0a-f349-605c2b9a133e@foss.st.com>
Date: Thu, 9 Jun 2022 17:35:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] drm/stm: ltdc: remove error message about scaling
Content-Language: en-US
To: Yannick Fertre <yannick.fertre@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, <dri-devel@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20220603134250.592408-1-yannick.fertre@foss.st.com>
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20220603134250.592408-1-yannick.fertre@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-09_12,2022-06-09_02,2022-02-23_01
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

Hi,

Thanks

Acked-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>


Cheers,

Raphaël

On 6/3/22 15:42, Yannick Fertre wrote:
> Remove error message about scaling & replace it by a debug
> message to avoid too much error.
>
> Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>
> ---
>  drivers/gpu/drm/stm/ltdc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
> index eeefc3260c07..a4098aaff243 100644
> --- a/drivers/gpu/drm/stm/ltdc.c
> +++ b/drivers/gpu/drm/stm/ltdc.c
> @@ -1215,7 +1215,8 @@ static int ltdc_plane_atomic_check(struct drm_plane *plane,
>  
>  	/* Reject scaling */
>  	if (src_w != new_plane_state->crtc_w || src_h != new_plane_state->crtc_h) {
> -		DRM_ERROR("Scaling is not supported");
> +		DRM_DEBUG_DRIVER("Scaling is not supported");
> +
>  		return -EINVAL;
>  	}
>  
