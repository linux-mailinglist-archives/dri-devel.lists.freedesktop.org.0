Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2462F9126F9
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 15:48:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 051BE10F196;
	Fri, 21 Jun 2024 13:48:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="GIMz+r+0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22B1810F196
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 13:48:12 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45LAxF6i023086;
 Fri, 21 Jun 2024 14:51:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 F9PP+GAMB8H3TC0+mWhS7Ioi9VtML4Ue6Qm1isIiHOg=; b=GIMz+r+01qM4OmTQ
 Rw+Wbi6zox3ftv07m3IquRWIoQ9UCkoFhYFyWMcBxIcrHsnP0g+FpwPr7ahH/1bk
 pWBXE6vchfTG9C5ymy1CuvMBoLaDs2t9Hp6jJmYa6W+xqFSzLpwTHd2TyOtpfAgE
 PkAAwAN0KIa1L/FDJMWR3uvr8PtlyFnDa26X/WsKuIBDdL8soSCQnnj1ifC6hNpC
 cA42Q7grH6/qFTje3Qe8qP/kY2uwtRUO3jwC4YeqGdNWK3lB0Ho75d4ZvURjXNSs
 uxz/QeQSxWNXx4tO+JPobX0uRZWMS81fk+7VPWSqOmFiES254oirLx1YrDuJJ5TP
 nE4Gwg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3yvrkkkp4g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Jun 2024 14:51:17 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 68C084002D;
 Fri, 21 Jun 2024 14:51:10 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CFCA92207AE;
 Fri, 21 Jun 2024 14:50:28 +0200 (CEST)
Received: from [10.48.87.177] (10.48.87.177) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 21 Jun
 2024 14:50:28 +0200
Message-ID: <2fd903ba-3daf-4aeb-896b-702183252f19@foss.st.com>
Date: Fri, 21 Jun 2024 14:50:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v3 1/3] drm/stm: dsi: use new SYSTEM_SLEEP_PM_OPS()
 macro
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <dri-devel@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20240129104106.43141-1-raphael.gallais-pou@foss.st.com>
 <20240129104106.43141-2-raphael.gallais-pou@foss.st.com>
Content-Language: en-US
From: Yannick FERTRE <yannick.fertre@foss.st.com>
In-Reply-To: <20240129104106.43141-2-raphael.gallais-pou@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.87.177]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-21_04,2024-06-21_01,2024-05-17_01
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

Hi Raphael,

thanks for the patch.

Acked-by: Yannick Fertre <yannick.fertre@foss.st.com>

Tested-by: Yannick Fertre <yannick.fertre@foss.st.com>

BR


Le 29/01/2024 à 11:41, Raphael Gallais-Pou a écrit :
> Use RUNTIME_PM_OPS() instead of the old SET_SYSTEM_SLEEP_PM_OPS().
> This means we don't need  __maybe_unused on the functions.
>
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> ---
>   drivers/gpu/drm/stm/dw_mipi_dsi-stm.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
> index d5f8c923d7bc..b1aee43d51e9 100644
> --- a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
> +++ b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
> @@ -544,7 +544,7 @@ static void dw_mipi_dsi_stm_remove(struct platform_device *pdev)
>   	regulator_disable(dsi->vdd_supply);
>   }
>   
> -static int __maybe_unused dw_mipi_dsi_stm_suspend(struct device *dev)
> +static int dw_mipi_dsi_stm_suspend(struct device *dev)
>   {
>   	struct dw_mipi_dsi_stm *dsi = dw_mipi_dsi_stm_plat_data.priv_data;
>   
> @@ -556,7 +556,7 @@ static int __maybe_unused dw_mipi_dsi_stm_suspend(struct device *dev)
>   	return 0;
>   }
>   
> -static int __maybe_unused dw_mipi_dsi_stm_resume(struct device *dev)
> +static int dw_mipi_dsi_stm_resume(struct device *dev)
>   {
>   	struct dw_mipi_dsi_stm *dsi = dw_mipi_dsi_stm_plat_data.priv_data;
>   	int ret;
> @@ -580,8 +580,8 @@ static int __maybe_unused dw_mipi_dsi_stm_resume(struct device *dev)
>   }
>   
>   static const struct dev_pm_ops dw_mipi_dsi_stm_pm_ops = {
> -	SET_SYSTEM_SLEEP_PM_OPS(dw_mipi_dsi_stm_suspend,
> -				dw_mipi_dsi_stm_resume)
> +	SYSTEM_SLEEP_PM_OPS(dw_mipi_dsi_stm_suspend,
> +			    dw_mipi_dsi_stm_resume)
>   };
>   
>   static struct platform_driver dw_mipi_dsi_stm_driver = {
