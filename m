Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E331AD93C4
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 19:29:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAA3D10E20F;
	Fri, 13 Jun 2025 17:29:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="hlXDQyyG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F47310E1E8
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 17:29:05 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9133D44451;
 Fri, 13 Jun 2025 17:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1749835741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=NIvF1qv3q2mPekX9cThcZh3+0e4WEHsvxF4etRx9qGk=;
 b=hlXDQyyG5LP6QYGgduy7owkuKHXxcEVTPwaTUY1n3MeuZNihXL6kLGJZ5RPKcRoaUM8gGX
 BG+2uasGb7G/2O+0hyMk2tgCvWpTSO4P4pUcbCo3FM4Xof2euXhrSRW9ugVWAKP8wTPh5H
 6gbFMdeWSGcDk/Vr/mdFnFm6ZTuwUiYuuCDLYFQJWh7pmVA/7iHdS9rvwn3ndilLVDEqlP
 IlprL4j9Xg7F3PkwPpg4LgJlSwsf1f/p57BM9f34iVQtxp9fgvVV1zWuPo1AYvIL2LAuW7
 jhxQJd9kojAd0IRKzhy8/EZjTkmg5ql6a4RKbgos2thArrRav5fsDQjp3xtqhw==
Message-ID: <115564ae-4b61-47be-9a9d-9c27acd4192c@bootlin.com>
Date: Fri, 13 Jun 2025 19:28:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/8] drm/vkms: Add support for ARGB8888 formats
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Melissa Wen <melissa.srw@gmail.com>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mairacanal@riseup.net>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net,
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 seanpaul@google.com, nicolejadeyee@google.com
References: <20250530-b4-new-color-formats-v4-0-ef5f9f48376c@bootlin.com>
 <20250530-b4-new-color-formats-v4-2-ef5f9f48376c@bootlin.com>
 <eba688fe-d270-420b-9619-121fb4b8ba1d@igalia.com>
Content-Language: en-US
From: Louis Chauvet <louis.chauvet@bootlin.com>
Autocrypt: addr=louis.chauvet@bootlin.com; keydata=
 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
In-Reply-To: <eba688fe-d270-420b-9619-121fb4b8ba1d@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddukeehhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpefnohhuihhsucevhhgruhhvvghtuceolhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepkeeivedtfeegtdekheethedttddtfefhhfegjeeljeejleduvdfhudegvdekheevnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedukeehrddutdegrddufeekrdelgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedukeehrddutdegrddufeekrdelgedphhgvlhhopegluddtrddutddurddtrdeiiegnpdhmrghilhhfrhhomheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudelpdhrtghpthhtohepmhgtrghnrghlsehighgrlhhirgdrtghomhdprhgtphhtthhopehmvghlihhsshgrrdhsrhifsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrihhrrggtrghnrghlsehrihhsvghuphdrnhgvthdprhgtphhtthhopehhrghmohhhrghmmhgvugdrshgrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrr
 ghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomh
X-GND-Sasl: louis.chauvet@bootlin.com
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



Le 11/06/2025 à 21:55, Maíra Canal a écrit :
> Hi Louis,
> 
> On 5/30/25 11:05, Louis Chauvet wrote:
>> The formats XRGB8888 and ARGB8888 were already supported.
>> Add the support for:
>> - XBGR8888
>> - RGBX8888
>> - BGRX8888
>> - ABGR8888
>> - RGBA8888
>> - BGRA8888
>>
>> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
>> ---
> 
> [...]
> 
>> +READ_LINE_ARGB8888(RGBX8888_read_line, px, 0xFF, px[3], px[2], px[1])
>> +READ_LINE_ARGB8888(BGRX8888_read_line, px, 0xFF, px[1], px[2], px[3])
> 
> How did you test those two formats? I noticed that IGT (kms_plane tests)
> doesn't test them.

Hi Maíra,

Thanks for your review!

I wrote this a long time ago, so I don't remember. I was probably greedy 
and added all the "trivial" formats I was able to do and missed that 
this format was not tested.

For this revision, I just started kms_plane to check if it was happy 
after the rebase, I did not check the formats one by one.

Do you want me to remove those formats? I think it costs nothing to keep 
them, especially with the new READ_LINE_ARGB8888 macro, but I will 
comply if you think we should only merge tested formats.

Thanks,
Louis Chauvet

> Best Regards,
> - Maíra
> 
>>    
>>    READ_LINE_ARGB8888(ARGB8888_read_line, px, px[3], px[2], px[1], px[0])
>>    READ_LINE_ARGB8888(ABGR8888_read_line, px, px[3], px[0], px[1], px[2])
>> +READ_LINE_ARGB8888(RGBA8888_read_line, px, px[0], px[3], px[2], px[1])
>> +READ_LINE_ARGB8888(BGRA8888_read_line, px, px[0], px[1], px[2], px[3])
>>    
>>    READ_LINE_le16161616(ARGB16161616_read_line, px, px[3], px[2], px[1], px[0])
>>    READ_LINE_le16161616(XRGB16161616_read_line, px, cpu_to_le16(0xFFFF), px[2], px[1], px[0])
>> @@ -644,10 +649,20 @@ pixel_read_line_t get_pixel_read_line_function(u32 format)
>>    	switch (format) {
>>    	case DRM_FORMAT_ARGB8888:
>>    		return &ARGB8888_read_line;
>> -	case DRM_FORMAT_XRGB8888:
>> -		return &XRGB8888_read_line;
>>    	case DRM_FORMAT_ABGR8888:
>>    		return &ABGR8888_read_line;
>> +	case DRM_FORMAT_BGRA8888:
>> +		return &BGRA8888_read_line;
>> +	case DRM_FORMAT_RGBA8888:
>> +		return &RGBA8888_read_line;
>> +	case DRM_FORMAT_XRGB8888:
>> +		return &XRGB8888_read_line;
>> +	case DRM_FORMAT_XBGR8888:
>> +		return &XBGR8888_read_line;
>> +	case DRM_FORMAT_RGBX8888:
>> +		return &RGBX8888_read_line;
>> +	case DRM_FORMAT_BGRX8888:
>> +		return &BGRX8888_read_line;
>>    	case DRM_FORMAT_ARGB16161616:
>>    		return &ARGB16161616_read_line;
>>    	case DRM_FORMAT_XRGB16161616:
>> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
>> index e3fdd161d0f0..b7f498944c50 100644
>> --- a/drivers/gpu/drm/vkms/vkms_plane.c
>> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
>> @@ -14,8 +14,13 @@
>>    
>>    static const u32 vkms_formats[] = {
>>    	DRM_FORMAT_ARGB8888,
>> -	DRM_FORMAT_XRGB8888,
>>    	DRM_FORMAT_ABGR8888,
>> +	DRM_FORMAT_BGRA8888,
>> +	DRM_FORMAT_RGBA8888,
>> +	DRM_FORMAT_XRGB8888,
>> +	DRM_FORMAT_XBGR8888,
>> +	DRM_FORMAT_RGBX8888,
>> +	DRM_FORMAT_BGRX8888,
>>    	DRM_FORMAT_XRGB16161616,
>>    	DRM_FORMAT_ARGB16161616,
>>    	DRM_FORMAT_RGB565,
>>
> 

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

