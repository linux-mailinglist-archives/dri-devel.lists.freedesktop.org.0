Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84BC99F7E1C
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 16:32:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C860F10E4A2;
	Thu, 19 Dec 2024 15:32:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="we4uq8T/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2380 seconds by postgrey-1.36 at gabe;
 Thu, 19 Dec 2024 15:32:23 UTC
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF3EC10E4A2
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 15:32:23 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJD57aK023639;
 Thu, 19 Dec 2024 15:55:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 NV9xcAKQZsk3TlDz27C/N0vQenizwe4MV6e5I71nJv0=; b=we4uq8T/YpijEgNs
 ikL1IyhL+dD4eb4Tb8kbT5W2C70EzcqjavdM/6VqW6GkFgTbvd5eVce4T+ws24vo
 C1bZNU1hidoYaGTiaW5XCSlEQrG8B/yWQV2N3DCJdb7JVYkiQym9ttS5tQqT0iwx
 T3fuEuqNYtMCISsBaMZjx8QpDgwuIgVyLnPU3jykxYRv4Dewf+HdZxAggFPkIEwj
 CuVXNOk3qu1b+hq6xANYH8QOQi468qNwL1CW4JtOLwxwFX61Tov+pTzr4X2stE3O
 2fFBZkD8CaLV1mmSe2+GGUSmQH7OhYiZL+56u+oCmGJO8aR/SyHuuHshdQGP0akS
 8Sav1g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43mm2g8emr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Dec 2024 15:55:30 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 23FBA4004F;
 Thu, 19 Dec 2024 15:54:02 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7291F26DC6D;
 Thu, 19 Dec 2024 15:51:25 +0100 (CET)
Received: from [10.48.86.132] (10.48.86.132) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 19 Dec
 2024 15:51:24 +0100
Message-ID: <749034d8-4b8f-43f8-b009-175a915b8967@foss.st.com>
Date: Thu, 19 Dec 2024 15:51:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm: bridge: adv7511: remove s32 format from i2s
 capabilities
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20241210134254.2967524-1-olivier.moysan@foss.st.com>
 <20241210134254.2967524-3-olivier.moysan@foss.st.com>
 <ctecu2iqn4nsm2wy45ca7vt6bdj5334wafnyq32quaydjs7yf6@x4avipho6xcf>
Content-Language: en-US
From: Olivier MOYSAN <olivier.moysan@foss.st.com>
In-Reply-To: <ctecu2iqn4nsm2wy45ca7vt6bdj5334wafnyq32quaydjs7yf6@x4avipho6xcf>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.132]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
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

Hi Dmitry,

On 12/11/24 23:54, Dmitry Baryshkov wrote:
> On Tue, Dec 10, 2024 at 02:42:53PM +0100, Olivier Moysan wrote:
>> The ADV7511 chip allows 24 bits samples max in I2S mode, excepted for
>> direct AES3 mode (SNDRV_PCM_FORMAT_IEC958_SUBFRAME_LE format).
>> However the HDMI codec exposes S32_LE format as supported.
>> Adapt ADV7511 HDMI I2S format list to expose formats actually supported.
>>
>> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
>> ---
>>   drivers/gpu/drm/bridge/adv7511/adv7511_audio.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c b/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
>> index 28ae81ca3651..ce6eda87bfe0 100644
>> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
>> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
>> @@ -232,6 +232,9 @@ static const struct hdmi_codec_ops adv7511_codec_ops = {
>>   
>>   static const struct hdmi_codec_pdata codec_data = {
>>   	.ops = &adv7511_codec_ops,
>> +	.i2s_formats = (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |
>> +			SNDRV_PCM_FMTBIT_S24_3LE | SNDRV_PCM_FMTBIT_S24_LE |
>> +			SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE),
> 
> This will break w/o patch 3. Please change the order of the patches so
> that after each commit the kernel can still be built and work correctly.
> 

Right. I will re-order in v2.

>>   	.max_i2s_channels = 2,
>>   	.i2s = 1,
>>   	.no_i2s_capture = 1,
>> -- 
>> 2.25.1
>>
> 
