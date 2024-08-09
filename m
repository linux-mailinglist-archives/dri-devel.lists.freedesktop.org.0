Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30ECA94D312
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 17:14:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EF1710E94E;
	Fri,  9 Aug 2024 15:14:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="0GhVRpzY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9075610E94E
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2024 15:14:00 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 479A0pHv008310;
 Fri, 9 Aug 2024 17:13:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 FlSaZnNd7y0QCcx39z10PqhY0Rx1yv+xs/5BlCrpbHQ=; b=0GhVRpzYDv+xy6ck
 hX9bTaggS95gaBY7VXM+NY4RmiYBoycMJeyIwosZSpchFK1sLxlTLeQCrJ5njOfm
 yBulZBIYBKI4j9vut/gICz7osbfrPApIOBZszePQSBsm9tIHCwADY4q8KN2c5zj4
 jLCwdjMjunaJg+sVjocNrd5f1d4zSzWpSz7dkkdG1A9G9b6dTbgdhd4I+LAvTJNy
 DxbLXdUjej6OIEB3cXrGfWVBh+FLmmighkwnPcW2XgvK2Pzou8gcEZBchbloCU1c
 QZb7RUqXuN74AWCxqzcvbg+9npPXfifETEXSvohsOEZ6bmiEHdHysOTEa688cwKo
 EkJCmA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 40tu6n51kp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Aug 2024 17:13:38 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 7449040044;
 Fri,  9 Aug 2024 17:13:34 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 680AD2606D0;
 Fri,  9 Aug 2024 17:12:44 +0200 (CEST)
Received: from [10.252.26.60] (10.252.26.60) by EQNDAG1NODE6.st.com
 (10.75.129.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 9 Aug
 2024 17:12:42 +0200
Message-ID: <e3cf0c78-133a-400a-9669-93ff529d708b@foss.st.com>
Date: Fri, 9 Aug 2024 17:12:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Linux-stm32] [PATCH RESEND v3 0/3] Update STM DSI PHY driver
To: =?UTF-8?Q?Rapha=C3=ABl_Gallais-Pou?= <rgallaispou@gmail.com>, Yanjun Yang
 <yangyj.ee@gmail.com>, Philippe CORNU <philippe.cornu@foss.st.com>
CC: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20240129104106.43141-1-raphael.gallais-pou@foss.st.com>
 <21f4d43d-4abd-4aca-7abb-7321bcfa0f1d@foss.st.com>
 <CAE8JAfy9NtBa--DnUt2AEZPFnvjU6idj8DqUbaeLaH0DMFvuhw@mail.gmail.com>
 <e059f157-ff9c-32cb-57a6-48f2331f2555@foss.st.com>
 <ZqeZEB9peRSQkOLZ@void.tail05c47.ts.net>
 <94ecd3a6-3a62-4be6-b384-c8237c818e98@gmail.com>
Content-Language: en-US
From: Yannick FERTRE <yannick.fertre@foss.st.com>
In-Reply-To: <94ecd3a6-3a62-4be6-b384-c8237c818e98@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.252.26.60]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To EQNDAG1NODE6.st.com
 (10.75.129.135)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-09_12,2024-08-07_01,2024-05-17_01
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

we don't give enough attention to older SOCs like stm32f469. This is an 
error on our part.

I think that to fix this point it would be necessary to define the clock 
hse as clock fix.

I hope to be able to release a patch before the end of August

Best regards

Yannick Fertré


Le 01/08/2024 à 11:07, Raphaël Gallais-Pou a écrit :
>
>
> Le 29/07/2024 à 15:28, Yanjun Yang a écrit :
>> On Fri, Jul 26, 2024 at 09:55:35AM +0200, Philippe CORNU wrote:
>>>
>>>
>>> On 7/22/24 10:38, Yanjun Yang wrote:
>>>>
>>>> This patch (commit id:185f99b614427360) seems to break the dsi of
>>>> stm32f469 chip.
>>>> I'm not familiar with the drm and the clock framework, maybe it's
>>>> because there is no
>>>>    "ck_dsi_phy" defined for stm32f469.
>>>> PS:  Sorry for receiving multiple copies of this email, I forgot to
>>>> use plain text mode last time.
>>>>
>>>
>>> Hi,
>>> Thank you for letting us know that there was this error. We should have
>>> detected this before merging, really sorry for the problems caused 
>>> by this
>>> patch. We will investigate the issue and get back to you as soon as
>>> possible. In the meantime, I think you can revert this patch in your 
>>> git
>>> tree.
>>>
>>> Philippe :-)
>>>
>>
>> Hi,
> Hi,
>
> FYI
> DSI clock tree for stm32f469 can be found here:
> https://www.st.com/resource/en/reference_manual/rm0386-stm32f469xx-and-stm32f479xx-advanced-armbased-32bit-mcus-stmicroelectronics.pdf 
>
>
> Refer to Figure 17: DSI clock tree.
>
> After some research I think "ck_dsi_phy" was introduced in stm32h7 
> platforms. There is a mux which interfaces between various clocks 
> (among ck_hse) and the byte lane clock. stm32f469 has a much simpler 
> clock tree in which we did not bother to implement this "go-between" 
> clock, even though they is an equivalent of the mux.
>
>> After some testing, the reason behind my problem is the parent's name of
>> 'clk_dsi_phy' for stm32f4 is 'clk-hse' other than 'ck_hse'.  I don't
>> know which is the better why to fix it:
>> 1. Change "ck_hse" to "clk-hse" in where "clk_dsi_phy" is defined.
> Doing so will definitely break other platforms.
>
>> 2. Use "pll_in_khz = clk_get_rate(dsi->pllref_clk) / 1000" instead of
>>     "pll_in_khz = (unsigned int)(parent_rate / 1000)" when get the clock
>>     rate.
> dsi->pllref_clk refers to the HSE clock if you take a look in the 
> device-tree. This is the reason why this work on your setup. I doubt 
> nevertheless that it wouldn't work on other platforms. But this would 
> be a semantic nonsense, since the DSI byte lane clock is not always 
> derived from HSE clock on other platforms.
>
> Looking again at the clk-stm32f4 driver and the DSI clock tree linked, 
> we can maybe implement the desired clock even if it is not represented 
> on the diagram.
>
> Eventually if this solution does not work we will go to the second 
> solution you suggested and we will test it on all platforms.
>
> @Philippe, @Yannick
> Do you agree with this workflow ?
>
> Regards,
> Raphaël
>
>
>>
>> Both method can fix my problem. The first one might break other
>> platforms. Maybe I should change the clock name of 'clk-hse'. However,
>> I can't find the defination of this clock name for stm32f4.
