Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B23189F1D2
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 14:15:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAA311132EC;
	Wed, 10 Apr 2024 12:15:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="op2N46jT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C719F113307
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 12:15:31 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 43A7YeaB030243; Wed, 10 Apr 2024 14:15:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=MP03DxtV3A269tTmEUnJA4JKNFDmtFSn6T36kmgxjrU=; b=op
 2N46jTg4xSbw/zkQSgAiVYnPL9mI7SDW2csYYk2lAOHFDDH8bRXYZSfE3fkv1bK+
 XIJ2vfFVN/gydOJ2BIPrN1WZ2wT4Mxf1Ixv2cUTBwrRO7mxqjfexoq7A1xVsslWN
 h+fpTGiVNnCLnABLXTma8Vi/KpirmZEUjh/NSwHzBLvf6J2ZbL13cBfLkxcV+g6f
 MK/9O+SMo0jAP560Zj5eLRMYo8Eln4gm29ouY22rdxgGUHrwJQRnFamBiDh3aC8B
 XkDFkhVAvCdfSpPNy+dZA8319BQLAIn3ItwlZhurgpZatO9zlGe1awNBy9fX1Os2
 e1qqyUv6MYfJeU8OD1Vg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xauh581ua-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Apr 2024 14:15:26 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 64BEB40044;
 Wed, 10 Apr 2024 14:15:22 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EC7D2223F1C;
 Wed, 10 Apr 2024 14:15:12 +0200 (CEST)
Received: from [10.129.178.196] (10.129.178.196) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 10 Apr
 2024 14:15:12 +0200
Message-ID: <89c1e82f-92dc-4612-b9f6-30217bd8fec7@foss.st.com>
Date: Wed, 10 Apr 2024 14:15:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 21/21] drm/stm: Allow build with COMPILE_TEST=y
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: Yannick Fertre <yannick.fertre@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>
References: <20240408170426.9285-1-ville.syrjala@linux.intel.com>
 <20240408170426.9285-22-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20240408170426.9285-22-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.129.178.196]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-10_04,2024-04-09_01,2023-05-22_02
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

Hi Ville

On 4/8/24 19:04, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
> Allow stm to be built with COMPILE_TEST=y for greater
> coverage. Builds fine on x86/x86_64 at least.
>
> Cc: Yannick Fertre <yannick.fertre@foss.st.com>
> Cc: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> Cc: Philippe Cornu <philippe.cornu@foss.st.com>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Thank you for this ! :)

Acked-by: Raphaël Gallais-Pou <raphael.gallais-pou@foss.st.com>


> ---
>  drivers/gpu/drm/stm/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/stm/Kconfig b/drivers/gpu/drm/stm/Kconfig
> index fa49cde43bb2..4c906d602825 100644
> --- a/drivers/gpu/drm/stm/Kconfig
> +++ b/drivers/gpu/drm/stm/Kconfig
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  config DRM_STM
>  	tristate "DRM Support for STMicroelectronics SoC Series"
> -	depends on DRM && ARCH_STM32
> +	depends on DRM && (ARCH_STM32 || COMPILE_TEST)
>  	select DRM_KMS_HELPER
>  	select DRM_GEM_DMA_HELPER
>  	select DRM_PANEL_BRIDGE

