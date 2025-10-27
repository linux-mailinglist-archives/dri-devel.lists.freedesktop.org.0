Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3269CC0F0FF
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 16:53:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 608ED10E4DE;
	Mon, 27 Oct 2025 15:53:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="fxtYLifd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E28DF10E4DE
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 15:53:16 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 9616DC0BE82;
 Mon, 27 Oct 2025 15:52:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id BA2F36062C;
 Mon, 27 Oct 2025 15:53:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 50D1D102F2428; Mon, 27 Oct 2025 16:53:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1761580394; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references:autocrypt;
 bh=GlTdPc7pj5urAwGu8OzGWrkdJwvba9a2IKrizTjf7Z8=;
 b=fxtYLifdMq7FnKTctd0vCyJbBvk1UIIKaV9xFiPnWp4yyLWNdP1x0PkyKbMa2lMwfdYhU0
 jcXBlYEiXH1zJXMZ4/yMPhPS0kW3AiuASbetTmOZZsl39JfrOdGXAWQslEzc52c0GcYb7l
 vdWNBBLYVFq12yqranYSyGJCoR4A8uoSjJaHEXy/nm1bg/fvpwFESGHNjK0upxh+rL9IlX
 FTopSU7VaXlIxjR8MbPJiQWzptbUvC9Hdf00QiAS8AsToxSUdvFDw7NY6HcHcQMxViKW69
 thd/ZDL7KK6wPr3hNsWgFO6Sd9CnUVL/m+wqkTPZzh7oVfM6mOwBqVNpVRDOhw==
Message-ID: <0dac7c85-0b44-4a6c-b1e1-5833649e6413@bootlin.com>
Date: Mon, 27 Oct 2025 16:53:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/22] VKMS: Introduce multiple configFS attributes
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Melissa Wen <melissa.srw@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 victoria@system76.com, sebastian.wick@redhat.com,
 thomas.petazzoni@bootlin.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20251018-vkms-all-config-v1-0-a7760755d92d@bootlin.com>
 <aP-OLNFQA0M16xuy@fedora>
Content-Language: en-US, fr
From: Louis Chauvet <louis.chauvet@bootlin.com>
Autocrypt: addr=louis.chauvet@bootlin.com; keydata=
 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
In-Reply-To: <aP-OLNFQA0M16xuy@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
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



Le 27/10/2025 à 16:22, José Expósito a écrit :
> Hey Louis,
> 
> On Sat, Oct 18, 2025 at 04:01:00AM +0200, Louis Chauvet wrote:
>> VKMS have a wide range of options. The aim of this series is to introduce
>> many configfs attribute so VKMS can be used to test a wide range of
>> configurations.
>>
>> This series depends on [1] that should be applied soon.
>>
>> PATCH 1-13 are for configuring planes
>> - name
>> - rotation
>> - color encoding
>> - color range
>> - plane formats
>> - zpos
>> PATCH 14-19 are for configuring the connector
>> - type
>> - supported colorspace
>> - edid
>> PATCH 20-22 are to enable dynamic connectors
>>
>> [1]:https://lore.kernel.org/all/20251016175618.10051-1-jose.exposito89@gmail.com
>>
>> PS: Each pair of config/configfs patch are independant. I could
>> technically create ≈10 different series, but there will be a lot of
>> (trivial) conflicts between them. I will be happy to reordoer, split and
>> partially apply this series to help the review process.
> 
> I just finished reviewing the series.

Thanks a lot, I started to apply your suggestions (I agree to most of them).

> Amazing work, thanks a lot for adding all of these new properties!!
> 
> I'd like to see KUnit and IGT coverage to test coner cases and, since this
> is uAPI, to have a mechanishm to catch regressions without lots of manual
> testing.

I started to add some Kunits for vkms_config.c, for the format parsing too.

> Let's talk so we can start working on them on v2, I'll be able to help in
> that front if needed.

I finish to apply your suggestions and I will send the v2 soon, so we 
can discuss on the same ground. I think we can add a little bit of 
vkms_config.c testing, but for vkms_configfs I need to see if we can 
mock configfs interations from kunit tests.

Have a nice week,
Louis Chauvet

> Best wishes,
> Jose
>   
>> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
>> ---
>> Louis Chauvet (22):
>>        drm/vkms: Introduce config for plane name
>>        drm/vkms: Introduce configfs for plane name
>>        drm/vkms: Introduce config for plane rotation
>>        drm/vkms: Introduce configfs for plane rotation
>>        drm/vkms: Introduce config for plane color encoding
>>        drm/vkms: Introduce configfs for plane color encoding
>>        drm/vkms: Introduce config for plane color range
>>        drm/vkms: Introduce configfs for plane color range
>>        drm/vkms: Introduce config for plane format
>>        drm/vkms: Introduce configfs for plane format
>>        drm/vkms: Properly render plane using their zpos
>>        drm/vkms: Introduce config for plane zpos property
>>        drm/vkms: Introduce configfs for plane zpos property
>>        drm/vkms: Introduce config for connector type
>>        drm/vkms: Introduce configfs for connector type
>>        drm/vkms: Introduce config for connector supported colorspace
>>        drm/vkms: Introduce configfs for connector supported colorspace
>>        drm/vkms: Introduce config for connector EDID
>>        drm/vkms: Introduce configfs for connector EDID
>>        drm/vkms: Store the enabled/disabled status for connector
>>        drm/vkms: Allow to hot-add connectors
>>        drm/vkms: Allows the creation of connector at runtime
>>
>>   Documentation/gpu/vkms.rst                    |  42 +-
>>   drivers/gpu/drm/vkms/tests/vkms_config_test.c |  18 +
>>   drivers/gpu/drm/vkms/vkms_config.c            | 183 ++++++
>>   drivers/gpu/drm/vkms/vkms_config.h            | 524 +++++++++++++++
>>   drivers/gpu/drm/vkms/vkms_configfs.c          | 893 +++++++++++++++++++++++++-
>>   drivers/gpu/drm/vkms/vkms_connector.c         | 137 +++-
>>   drivers/gpu/drm/vkms/vkms_connector.h         |  36 +-
>>   drivers/gpu/drm/vkms/vkms_crtc.c              |  11 +-
>>   drivers/gpu/drm/vkms/vkms_drv.h               |   6 +-
>>   drivers/gpu/drm/vkms/vkms_output.c            |  19 +-
>>   drivers/gpu/drm/vkms/vkms_plane.c             |  73 +--
>>   11 files changed, 1865 insertions(+), 77 deletions(-)
>> ---
>> base-commit: b291e4f1a4951204ce858cd01801291d34962a33
>> change-id: 20251017-vkms-all-config-bd0c2a01846f
>> prerequisite-message-id: 20251016175618.10051-1-jose.exposito89@gmail.com
>> prerequisite-patch-id: 74083a8806b1f26d9b4cd2a5107c756b971c4d11
>> prerequisite-patch-id: f982390487699921b625b413e8460d67ca7a74c9
>> prerequisite-patch-id: 0afca639e43c8fbfea2af1bc395e489efc8e1f10
>> prerequisite-patch-id: 6285108b2fd90d30d15d4cb4fdddfef953fad51b
>> prerequisite-patch-id: 2eacf5ad4f25f54a60958aa7a2df633d5642ce2f
>> prerequisite-patch-id: 81e98ac3aeb3b6128098ab7bab56d3446a3a2705
>> prerequisite-patch-id: 973f94c4edb4a5822c84a57d4479ca40e9cf25de
>> prerequisite-patch-id: 0efbaf1b0e962a1c40bf5a744b5089d8be696f62
>> prerequisite-patch-id: afa0cff94085e6ab216ffd9b99cd3dc882a0a687
>> prerequisite-patch-id: 3561347f2b586392985a8e3af9ed1c5c7d3eefd5
>> prerequisite-patch-id: 94030044ae8d404f7cdaed9137bddd59cfb22e79
>> prerequisite-patch-id: a54b483797d5ffb7ce13b56a8943025181cd0d7a
>> prerequisite-patch-id: f148fe7f445cb42437e7e2ba8b59e7e0fd40da8b
>> prerequisite-patch-id: 1ef2045872843670c452816c5d6187b713c9258c
>> prerequisite-patch-id: 3b9963ea3ae3455ae15ee36b67042c06a2ef6006
>> prerequisite-patch-id: 519ee42dfabb4de734e41e59bd07d7a723d810bb
>>
>> Best regards,
>> -- 
>> Louis Chauvet <louis.chauvet@bootlin.com>
>>

-- 
--
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

