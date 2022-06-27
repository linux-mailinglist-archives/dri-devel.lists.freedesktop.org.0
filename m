Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC96455BA51
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 16:12:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 860F210FD71;
	Mon, 27 Jun 2022 14:12:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4EAA10FD71
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 14:12:02 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25RBZsqA020295;
 Mon, 27 Jun 2022 16:12:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=xTWgsntQB7Zv0E3+cnrZlzVMbwkfSZpuUeZ8UUOqGFo=;
 b=MVAPgV1vbSJPzWYdZiVFJ1tGvt4Xv3WL0QpX21CLOR2JoG4/Tqt2TIRzD0k9cZ9ecEFW
 VRDHDc+LXTJQCtu0wQiokH2ZC4sEYX44T12GQFnwGA3aJqpdlqmyp80q9zWmnZXnvFsg
 1iZoCpTLBx87MxB4OdoBaGIVIxOtbpO8rQqi2jOc2Rq8uk50eTw6lHbG2DKNbtOfKg4c
 rH7KoZMbflrg4B3Zk5LkX8UlH2EZ04iUq4kArBw9vlkCROmM81L0wHy833Kyujtb4Vi9
 A6xIjinDHX/YK7o6nLuDrRWYqskN0lsM9AGQv7bWLqFfYJ/ryOfYcxY5ZdSftATMY0uB nQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gwsq120h4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jun 2022 16:12:00 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 020C710002A;
 Mon, 27 Jun 2022 16:11:59 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F1DDD221777;
 Mon, 27 Jun 2022 16:11:58 +0200 (CEST)
Received: from [10.48.1.86] (10.75.127.49) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Mon, 27 Jun
 2022 16:11:58 +0200
Message-ID: <60bb3c99-ee07-7bab-3f9b-9f12a2b812e2@foss.st.com>
Date: Mon, 27 Jun 2022 16:11:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] drm/stm: ltdc: fix various coding-style warnings
Content-Language: en-US
To: Yannick Fertre <yannick.fertre@foss.st.com>, Raphael Gallais-Pou
 <raphael.gallais-pou@foss.st.com>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <dri-devel@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20220603134334.592805-1-yannick.fertre@foss.st.com>
From: Philippe CORNU <philippe.cornu@foss.st.com>
In-Reply-To: <20220603134334.592805-1-yannick.fertre@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.49]
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



On 6/3/22 15:43, Yannick Fertre wrote:
> Fix issues reported by checkpatch.pl:
> - Braces {} should be used on all arms
> - Blank lines
> 
> Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>
> ---
>   drivers/gpu/drm/stm/ltdc.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
> index a4098aaff243..6a9f613839b5 100644
> --- a/drivers/gpu/drm/stm/ltdc.c
> +++ b/drivers/gpu/drm/stm/ltdc.c
> @@ -908,9 +908,9 @@ static void ltdc_crtc_mode_set_nofb(struct drm_crtc *crtc)
>   		drm_connector_list_iter_end(&iter);
>   	}
>   
> -	if (bridge && bridge->timings)
> +	if (bridge && bridge->timings) {
>   		bus_flags = bridge->timings->input_bus_flags;
> -	else if (connector) {
> +	} else if (connector) {
>   		bus_flags = connector->display_info.bus_flags;
>   		if (connector->display_info.num_bus_formats)
>   			bus_formats = connector->display_info.bus_formats[0];
> @@ -1917,7 +1917,6 @@ int ltdc_load(struct drm_device *ddev)
>   			DRM_ERROR("Failed to register LTDC interrupt\n");
>   			goto err;
>   		}
> -
>   	}
>   
>   	crtc = devm_kzalloc(dev, sizeof(*crtc), GFP_KERNEL);
Dear Yannick,
Many thanks for your patch,
Applied on drm-misc-next.
Have a good day
Philippe :-)
