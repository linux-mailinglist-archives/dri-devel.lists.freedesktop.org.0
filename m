Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B61263DB621
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jul 2021 11:39:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B191F6E09A;
	Fri, 30 Jul 2021 09:39:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1209A6E09A
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jul 2021 09:39:14 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16U9crDp006604; Fri, 30 Jul 2021 11:39:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=3yPI3qKkLf2WFGr5+kwXi0QSB77oMCgoIOfcH0590JI=;
 b=H187a768T9CXsjHPQm4kngNnjfKzI5uPPXKRpaE7BtD8DyiePMjNtkFkvoMQfea4uV90
 axqy+HBFcBATNgFbxCwURHR4VGaOKoEeCi12IH/jAFxf0MMq+3rf6OrlL88XZeqojETA
 +ZsAf/QITrzzNUODikcDQPs8wBzbtA7PMljiBZjmMhMUyxVvaYYb1THhGlzFn1AQsWYA
 xqO9lAa7sq1JxblqM/auAZ3NVVvOCIwblpjvbj0CJdTs55mPN/dfsfVTPso+BrmWJzMW
 cLgP5n1TAUTvPrNu66Fp7Yvdb7KBM3508QKmGQ5ZDjTHFdFz4eupNivtkFK7bwZucJza 1w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3a488c1y15-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Jul 2021 11:39:07 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E8093100034;
 Fri, 30 Jul 2021 11:39:06 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CDD3A21E676;
 Fri, 30 Jul 2021 11:39:06 +0200 (CEST)
Received: from lmecxl0993.lme.st.com (10.75.127.49) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 30 Jul
 2021 11:39:05 +0200
Subject: Re: [PATCH 5/7] drm/sti: Enable COMPILE_TEST on all ARM and ARM64
 platforms
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 <dri-devel@lists.freedesktop.org>, Alain VOLMAT-SCND-01
 <alain.volmat@foss.st.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>
References: <20210728153736.15240-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210728153736.15240-6-laurent.pinchart+renesas@ideasonboard.com>
From: Philippe CORNU <philippe.cornu@foss.st.com>
Message-ID: <dbd42c3e-d2d9-d779-17d5-e8b264173c51@foss.st.com>
Date: Fri, 30 Jul 2021 11:39:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210728153736.15240-6-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-30_05:2021-07-29,
 2021-07-30 signatures=0
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
Cc: Tomi Valkeinen <tomba@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-renesas-soc@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-imx@nxp.com, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 linux-tegra@vger.kernel.org, Jyri Sarha <jyri.sarha@iki.fi>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/28/21 5:37 PM, Laurent Pinchart wrote:
> To extend test coverage, relax the dependency on ARCH_STI or
> ARCH_MULTIPLATFORM to also enable compilation on ARM or ARM4 when

Hi Laurent,

Looping Benjamin (new email address) and Alain (future maintainer of 
drm/sti).

minor typo (ARM4 -> ARM64)

Reviewed-by: Philippe Cornu <philippe.cornu@foss.st.com>
Many thanks for your patch,
Philippe :-)


> COMPILE_TEST is selected.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>   drivers/gpu/drm/sti/Kconfig | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/sti/Kconfig b/drivers/gpu/drm/sti/Kconfig
> index d0cfdd36b38f..e7d18893bc11 100644
> --- a/drivers/gpu/drm/sti/Kconfig
> +++ b/drivers/gpu/drm/sti/Kconfig
> @@ -1,7 +1,8 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   config DRM_STI
>   	tristate "DRM Support for STMicroelectronics SoC stiH4xx Series"
> -	depends on OF && DRM && (ARCH_STI || ARCH_MULTIPLATFORM)
> +	depends on OF && DRM
> +	depends on ARCH_STI || ARCH_MULTIPLATFORM || ((ARM || ARM64) && COMPILE_TEST)
>   	select RESET_CONTROLLER
>   	select DRM_KMS_HELPER
>   	select DRM_GEM_CMA_HELPER
> 
