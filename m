Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA47923B9B
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 12:41:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67F0410E172;
	Tue,  2 Jul 2024 10:41:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="meLx/pde";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2354 seconds by postgrey-1.36 at gabe;
 Tue, 02 Jul 2024 10:41:08 UTC
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96BC010E1B1
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2024 10:41:08 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46284MAV002305;
 Tue, 2 Jul 2024 12:01:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 MIg3DBI11sSmG6wbpd1DN3SW8f/bMTTym/JO7g3ovAY=; b=meLx/pdejVh1bTGy
 uiOCkKrNavNX2j6fEcHeoDBVA9rQI/vqeh/OSOWTTRsttxc8sHmjPcZIS0i6dlcF
 r+2Ekv1DYq9MKu9Bruma9yWFHdmR9uvctzaJnTFSVuZDm8JO/c57GsEqoC4ifMI9
 kXj+u56SubQnamAqrK9K6qSex+Ehy3cegUGyr0LfhS39ypwUB4pmajtm8SCuwWd3
 XWmUfNPcJ8z+WzEWJrmrwF8JgfzQKOezzYepK7oL7lWlxRAXGiCiUDAlB0QU3gpB
 Wn5O+H0ZWUHuZa/LOv5itGw0pYjiPz3vFkGgN7oH6f23+83dPscbIS4xiiklspxG
 YxxZdw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4027pgjyqa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Jul 2024 12:01:35 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 725024004B;
 Tue,  2 Jul 2024 12:01:28 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2BE492207C0;
 Tue,  2 Jul 2024 12:00:37 +0200 (CEST)
Received: from [10.252.8.242] (10.252.8.242) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 2 Jul
 2024 12:00:36 +0200
Message-ID: <b33d9470-b845-478f-97d3-636e158693d2@foss.st.com>
Date: Tue, 2 Jul 2024 12:00:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/stm: Remove unnecessary .owner for
 lvds_platform_driver
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 <yannick.fertre@foss.st.com>
CC: <philippe.cornu@foss.st.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@foss.st.com>, <dri-devel@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 Abaci Robot <abaci@linux.alibaba.com>
References: <20240701062304.42844-1-jiapeng.chong@linux.alibaba.com>
Content-Language: en-US
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20240701062304.42844-1-jiapeng.chong@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.252.8.242]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-02_06,2024-07-02_02,2024-05-17_01
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

On 7/1/24 08:23, Jiapeng Chong wrote:
> Remove .owner field if calls are used which set it automatically.
>
> ./drivers/gpu/drm/stm/lvds.c:1213:3-8: No need to set .owner here. The core will do it.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=9457
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/gpu/drm/stm/lvds.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/stm/lvds.c b/drivers/gpu/drm/stm/lvds.c
> index 2fa2c81784e9..06f2d7a56cc9 100644
> --- a/drivers/gpu/drm/stm/lvds.c
> +++ b/drivers/gpu/drm/stm/lvds.c
> @@ -1210,7 +1210,6 @@ static struct platform_driver lvds_platform_driver = {
>  	.remove = lvds_remove,
>  	.driver = {
>  		.name = "stm32-display-lvds",
> -		.owner = THIS_MODULE,
>  		.of_match_table = lvds_dt_ids,
>  	},
>  };


Indeed, platform_driver_register() overrides the value of the owner.

Acked-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>

Thanks,
Raphaël

