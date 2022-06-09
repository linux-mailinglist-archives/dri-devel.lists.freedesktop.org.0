Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4E85450EC
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 17:36:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0332012ADE5;
	Thu,  9 Jun 2022 15:36:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F5C512ADE5
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 15:36:17 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 259CqInK014220;
 Thu, 9 Jun 2022 17:36:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=fBBK0lRj7eRfQiKEbQnTSqGbA1p8lUqyMPbkLL/n2hM=;
 b=IZEyTsmCQsBm3CFjoZJzXyY6TStR7QMuWnhr6iKGYgESbiU3gOMRrGEOWBAVh/wlTiMO
 Y3VFPey3Iy9SjY1JsagqevT/BsZ5bXY8wMI9uW0CueyYvrHlPWy+s8TJTuvvRa0/zp06
 Ssxg4Sa7BlFp8VfvZ1Em0vVzmnSlfPOr/Omfzgp6L2bquQcZdHbS9s/2Uk8zDM7YqhiN
 8Q415dk5ac8aHwR8CZzKD2sWiFicN74Ls+w0hyUSJcU2NriiLQn4q1FdWKmUrguqILkj
 Sq7wNFxyI23CN5s12zJWv6cx+fuXs1U4rn9RnfmJhGRAG4eBI9+bkPKnrV/uSJ5TATuY lg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gj3cu1smg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jun 2022 17:36:14 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F0FB110002A;
 Thu,  9 Jun 2022 17:36:13 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E9B59221793;
 Thu,  9 Jun 2022 17:36:13 +0200 (CEST)
Received: from [10.201.21.53] (10.75.127.51) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Thu, 9 Jun
 2022 17:36:12 +0200
Message-ID: <be63f46a-d6b0-8109-4c8a-a421aa791e3b@foss.st.com>
Date: Thu, 9 Jun 2022 17:36:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] drm/stm: ltdc: fix various coding-style warnings
Content-Language: en-US
To: Yannick Fertre <yannick.fertre@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, <dri-devel@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20220603134334.592805-1-yannick.fertre@foss.st.com>
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20220603134334.592805-1-yannick.fertre@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-09_12,2022-06-09_01,2022-02-23_01
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

On 6/3/22 15:43, Yannick Fertre wrote:
> Fix issues reported by checkpatch.pl:
> - Braces {} should be used on all arms
> - Blank lines
>
> Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>
> ---
>  drivers/gpu/drm/stm/ltdc.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
> index a4098aaff243..6a9f613839b5 100644
> --- a/drivers/gpu/drm/stm/ltdc.c
> +++ b/drivers/gpu/drm/stm/ltdc.c
> @@ -908,9 +908,9 @@ static void ltdc_crtc_mode_set_nofb(struct drm_crtc *crtc)
>  		drm_connector_list_iter_end(&iter);
>  	}
>  
> -	if (bridge && bridge->timings)
> +	if (bridge && bridge->timings) {
>  		bus_flags = bridge->timings->input_bus_flags;
> -	else if (connector) {
> +	} else if (connector) {
>  		bus_flags = connector->display_info.bus_flags;
>  		if (connector->display_info.num_bus_formats)
>  			bus_formats = connector->display_info.bus_formats[0];
> @@ -1917,7 +1917,6 @@ int ltdc_load(struct drm_device *ddev)
>  			DRM_ERROR("Failed to register LTDC interrupt\n");
>  			goto err;
>  		}
> -
>  	}
>  
>  	crtc = devm_kzalloc(dev, sizeof(*crtc), GFP_KERNEL);
