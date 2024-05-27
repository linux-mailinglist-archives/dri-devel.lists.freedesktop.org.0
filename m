Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B91B8D0618
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 17:29:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ADFE10FB63;
	Mon, 27 May 2024 15:29:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="DgYiunME";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82CFB10FB63
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 15:29:38 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44R9wg1b011099;
 Mon, 27 May 2024 17:29:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 c+cW08zMk1WTQyPBKYREPSgTa4riSRY8sK3eubC//LM=; b=DgYiunMEpU8UDxI0
 /zE7XhMaouxKV+FDLhxejZ0Cu5TLee6Y4daTGN/4gKDq0hVsPOtjVSkm6lr8u1YN
 09Sgv6sQ+f1WdIY9MDJ2Y3zUyK9JJQEe4LX7Z94s9VewbL7P/VIrUzPv4x8QBpdP
 I6DSuZgW37ZG3d5kjwOaZOBCANaHvePWKAhZ9O9fYE5rI8z2j6ROznCaMLvf7X+4
 HhBJ1BxdUAqsXrtfvpCAsk5fSTGoYDYb4mihoF0tA4bvkZnS2V234kQD5GMTI+Hv
 orebOc/5S4De87ghnu66aa0dciCbWlKIi3vw0EA1lKSI5oMLO02y0GyzJMBCMEaY
 PF8YQg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3yb9yxyuut-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 May 2024 17:29:30 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C75EB40044;
 Mon, 27 May 2024 17:29:20 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 13573221EBA;
 Mon, 27 May 2024 17:29:11 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 27 May
 2024 17:29:10 +0200
Date: Mon, 27 May 2024 17:29:09 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
CC: <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 07/21] drm/sti: Allow build with COMPILE_TEST=y
Message-ID: <20240527152909.GB714350@gnbcxd0016.gnb.st.com>
References: <20240408170426.9285-1-ville.syrjala@linux.intel.com>
 <20240408170426.9285-8-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240408170426.9285-8-ville.syrjala@linux.intel.com>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.129.178.213]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-27_04,2024-05-27_01,2024-05-17_01
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

Hi Ville,

thank you for your patch.

On Mon, Apr 08, 2024 at 08:04:12PM +0300, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Allow sti to be built with COMPILE_TEST=y for greater
> coverage. Builds fine on x86/x86_64 at least.
> 
> Cc: Alain Volmat <alain.volmat@foss.st.com>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/sti/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/sti/Kconfig b/drivers/gpu/drm/sti/Kconfig
> index 3c7a5feff8de..75c301aadcbc 100644
> --- a/drivers/gpu/drm/sti/Kconfig
> +++ b/drivers/gpu/drm/sti/Kconfig
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  config DRM_STI
>  	tristate "DRM Support for STMicroelectronics SoC stiH4xx Series"
> -	depends on OF && DRM && ARCH_STI
> +	depends on OF && DRM && (ARCH_STI || COMPILE_TEST)
>  	select RESET_CONTROLLER
>  	select DRM_KMS_HELPER
>  	select DRM_GEM_DMA_HELPER
> -- 
> 2.43.2
> 

Acked-by: Alain Volmat <alain.volmat@foss.st.com>

Alain
