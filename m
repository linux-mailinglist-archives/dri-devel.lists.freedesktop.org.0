Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97EFF303815
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jan 2021 09:38:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E4FA6E44A;
	Tue, 26 Jan 2021 08:38:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 702 seconds by postgrey-1.36 at gabe;
 Mon, 25 Jan 2021 14:48:11 UTC
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CC106E112
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jan 2021 14:48:11 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10PERDlX031593; Mon, 25 Jan 2021 15:36:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=wWIxKXclgLdylfMZwg4le6uLRNhXM5uQkriSpG1L/VE=;
 b=xDacxuGMlftE4qlGtMteqLhPLAIvOkN3Z1TeDzs4R++YvsQHgM4XkOxD4jBHRR2dgT8h
 GMu9NLW9gvQzYS26/JetULJEJZETzjFnJqALYpp5bgbn4i4W6m0tTL1ofi/erdhF+5wt
 mimEReF7fo5Yac3mCVYLzTAg65qw7z5HbhLx0m2ujduoWLG654WGjFODZrph2EshXwqo
 nCMsX/+kQ5ywqpF9oOrDNl4/Npp3dy0UqHzdBOS8/ELMxS0aMPREwBZz8ApPhLGIyNdJ
 ZwykXOZpV2FxlvoX/HO9Zuuhjr2DCzWwHbCjG8C/bSDyUfwFMC4Xmo3PDi0HRJV7hJ+M oA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 368a56bh4r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Jan 2021 15:36:22 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8427E10002A;
 Mon, 25 Jan 2021 15:36:19 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6892222743F;
 Mon, 25 Jan 2021 15:36:19 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.50) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 25 Jan
 2021 15:36:18 +0100
Subject: Re: [PATCH] ARM: multi_v7_defconfig: add STM32 CEC support
To: Yannick Fertre <yannick.fertre@foss.st.com>, Alexandre Torgue
 <alexandre.torgue@st.com>, Philippe Cornu <philippe.cornu@foss.st.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20210115143236.27675-1-yannick.fertre@foss.st.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <687e3445-ffc3-7133-db2a-14e6c7c8efea@foss.st.com>
Date: Mon, 25 Jan 2021 15:36:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210115143236.27675-1-yannick.fertre@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-25_04:2021-01-25,
 2021-01-25 signatures=0
X-Mailman-Approved-At: Tue, 26 Jan 2021 08:37:37 +0000
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

Hi Yannick

On 1/15/21 3:32 PM, Yannick Fertre wrote:
> Enable CEC support for STMicroelectronics as loadable module.
> 
> Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>
> ---
>   arch/arm/configs/multi_v7_defconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
> index c5f25710fedc..05cc0607a9ad 100644
> --- a/arch/arm/configs/multi_v7_defconfig
> +++ b/arch/arm/configs/multi_v7_defconfig
> @@ -656,6 +656,7 @@ CONFIG_V4L_TEST_DRIVERS=y
>   CONFIG_VIDEO_VIVID=m
>   CONFIG_CEC_PLATFORM_DRIVERS=y
>   CONFIG_CEC_SAMSUNG_S5P=m
> +CONFIG_CEC_STM32=m
>   CONFIG_VIDEO_ADV7180=m
>   CONFIG_VIDEO_ADV7604=m
>   CONFIG_VIDEO_ADV7604_CEC=y
> 

Applied on stm32-next.

Thanks.
Alex
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
