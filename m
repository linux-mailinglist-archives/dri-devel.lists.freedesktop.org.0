Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2224D91503F
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 16:43:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED39A10E467;
	Mon, 24 Jun 2024 14:43:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="qslt2FLe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C43410E467
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 14:43:33 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45ODT690017080;
 Mon, 24 Jun 2024 16:43:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 FDQqDeGBhOzd+z+gYx2dRkj2fnt78H+rCdF+VFiaJcc=; b=qslt2FLeTkNuSTgG
 FWEK3BzU3lE/f9wYZiDR+qbKV48FdFR6ubicgIUDwYKjV9LxAsP51JAPdGKXHkcU
 W2hi8YgILi5iJTAhqrOuoU7hZ+Wps2HdRXJYQt3CwvPMXBCNE8VcF3mhGSGZolOL
 mGi49Rbw1gNwC5KvDUCndpp93daBoJWZnM0e0M1BsqI/HZjDvjS6MmanVivr3w7k
 tUwO1cL3iz9nc4zvixbC9hKng7AYlQEmxuEN2ArP089/3TwA1ZAq7ej0qoExVmV8
 pmdi8uCSPTra5gbpjAwXli3yOYrd3PF+2oWCFU0J8ps9hXk02+RqmQM/Tnz9K8hB
 dCdAFg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ywnxx7jux-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Jun 2024 16:43:03 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1FF3C40047;
 Mon, 24 Jun 2024 16:42:58 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 280FB221E8B;
 Mon, 24 Jun 2024 16:42:07 +0200 (CEST)
Received: from [10.48.87.177] (10.48.87.177) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 24 Jun
 2024 16:42:06 +0200
Message-ID: <c8b7d693-5008-49c4-883a-66e2f9a3c7b2@foss.st.com>
Date: Mon, 24 Jun 2024 16:42:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/stm: ltdc: Remove unused function plane_to_ltdc
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
CC: <raphael.gallais-pou@foss.st.com>, <philippe.cornu@foss.st.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
 <dri-devel@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 Abaci Robot <abaci@linux.alibaba.com>
References: <20240624024113.54850-1-jiapeng.chong@linux.alibaba.com>
Content-Language: en-US
From: Yannick FERTRE <yannick.fertre@foss.st.com>
In-Reply-To: <20240624024113.54850-1-jiapeng.chong@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.87.177]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-24_11,2024-06-24_01,2024-05-17_01
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

Hi Jiapeng,

Thanks for the patch.

Acked-by: Yannick Fertre <yannick.fertre@foss.st.com>

Best regards


Le 24/06/2024 à 04:41, Jiapeng Chong a écrit :
> The function are defined in the ltdc.c file, but not called
> anywhere, so delete the unused function.
>
> drivers/gpu/drm/stm/ltdc.c:494:35: warning: unused function 'encoder_to_ltdc'.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=9403
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>   drivers/gpu/drm/stm/ltdc.c | 5 -----
>   1 file changed, 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
> index 5576fdae4962..3f280155e25c 100644
> --- a/drivers/gpu/drm/stm/ltdc.c
> +++ b/drivers/gpu/drm/stm/ltdc.c
> @@ -491,11 +491,6 @@ static inline struct ltdc_device *plane_to_ltdc(struct drm_plane *plane)
>   	return (struct ltdc_device *)plane->dev->dev_private;
>   }
>   
> -static inline struct ltdc_device *encoder_to_ltdc(struct drm_encoder *enc)
> -{
> -	return (struct ltdc_device *)enc->dev->dev_private;
> -}
> -
>   static inline enum ltdc_pix_fmt to_ltdc_pixelformat(u32 drm_fmt)
>   {
>   	enum ltdc_pix_fmt pf;
