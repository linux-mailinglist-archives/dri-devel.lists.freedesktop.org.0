Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 531D59F7E79
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 16:53:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E272710E07F;
	Thu, 19 Dec 2024 15:53:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="KQgpnyex";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 197D510E07F
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 15:53:16 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJDOfc3020411;
 Thu, 19 Dec 2024 15:52:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 LLbv9bsnov+EzKUHzrKrfHD81gMLIpmx5GwMcZNUYwQ=; b=KQgpnyex2X/afmci
 55zc5TeYjXHZYuvpOIiaDjfkC48YvYOOaheZ5JQOio+ppHIxdka5LXYqL1SflAbG
 u5alsYp8fzNBTk0IDhfvsvBZuZYTi5GVCjuKrIxj/dNv+3XYBOUchLGgIr62ahdy
 pT7YGU8vPA2Z/SWGQ6YPW9NEmGdQUTNs/P7XyvCVsSPFgrzs/6HrsnZK4MllMAft
 UkOXc8ao53WA2uvkFfWlldEUg32nJfkvh9qTToGlBT4ClTyNAFpZcH8pAyCgeYxO
 EcQ8JdNUMCXYhzjDFgTN1a3ktbpiRRTah9LGC5J4+24umWAqLXUbp8P5rR3GI3c2
 FkPYkA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43mmbmrbn8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Dec 2024 15:52:22 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5E5DE4004A;
 Thu, 19 Dec 2024 15:50:45 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EFFC2277253;
 Thu, 19 Dec 2024 15:49:46 +0100 (CET)
Received: from [10.48.86.132] (10.48.86.132) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 19 Dec
 2024 15:49:46 +0100
Message-ID: <1a92bf78-1e29-4b84-8513-12ecb12c61bd@foss.st.com>
Date: Thu, 19 Dec 2024 15:49:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm: bridge: adv7511: fill i2s stream capabilities
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
 <20241210134254.2967524-2-olivier.moysan@foss.st.com>
 <rilzmak24odk34q3rglnkmi23e7warmd6dytx2opkhjl3kjujm@fqxqydwhcluy>
Content-Language: en-US
From: Olivier MOYSAN <olivier.moysan@foss.st.com>
In-Reply-To: <rilzmak24odk34q3rglnkmi23e7warmd6dytx2opkhjl3kjujm@fqxqydwhcluy>
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

On 12/11/24 23:52, Dmitry Baryshkov wrote:
> On Tue, Dec 10, 2024 at 02:42:52PM +0100, Olivier Moysan wrote:
>> Set no_i2s_capture flag in hdmi_codec_pdata structure to report
>> that the ADV7511 HDMI bridge does not support i2s audio capture.
>>
>> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
>> ---
>>   drivers/gpu/drm/bridge/adv7511/adv7511_audio.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c b/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
>> index 61f4a38e7d2b..28ae81ca3651 100644
>> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
>> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
>> @@ -234,6 +234,7 @@ static const struct hdmi_codec_pdata codec_data = {
>>   	.ops = &adv7511_codec_ops,
>>   	.max_i2s_channels = 2,
>>   	.i2s = 1,
>> +	.no_i2s_capture = 1,
> 
> Does it support spdif capture?
> 

"no_i2s_spdif = 1" is relevant also for adv7511 bridge.
I can add it in this serie.

>>   	.spdif = 1,
>>   };
>>   
>> -- 
>> 2.25.1
>>
> 

BRs
Olivier
