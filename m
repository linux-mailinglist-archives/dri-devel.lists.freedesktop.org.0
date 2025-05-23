Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64166AC22AE
	for <lists+dri-devel@lfdr.de>; Fri, 23 May 2025 14:32:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3A5B10E1FF;
	Fri, 23 May 2025 12:32:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="DuZqWGM0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECF5D10E1FF
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 12:32:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E18981FCF3;
 Fri, 23 May 2025 12:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1748003539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=6kugU5Iia4O+W8PyLX74zsv8PIdraa8XJ33TN3UzBeg=;
 b=DuZqWGM0a/oKCPxg+kUNTBFXX5YKIqPuFpnh2TZVAZhyBjPNT7I2X+f2qazYyRAKV39y1C
 ll/lITfPSN3A8I4Utlc+Ce3GeaalFaCdbXwbBAObz4DQtS1Q0yg4hW4WHDZj32fO7nmTlV
 Kju4Ww8ESNO/6yL7kdcYnGmNhRtgTgLqxCWnq3YkOKrv3IBYXiRjQTj87vEIYH0tXHtWXc
 hp0E5R2knwj84trocYUXio5E0+L4ighsN3fY1WRXIVXJfEK9RPws5eViL4UVyqei3QzI52
 l+MS9nGl3wCeIUhU14yWAxTB+dH4fG32jRfMuesQLHZYgIsVpKulw4l9mFAXWg==
Message-ID: <44394ede-e7e5-49d2-a34c-ff41a124b733@bootlin.com>
Date: Fri, 23 May 2025 14:32:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/16] drm/vkms: Add configfs support
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250507135431.53907-1-jose.exposito89@gmail.com>
Content-Language: en-US
From: Louis Chauvet <louis.chauvet@bootlin.com>
Autocrypt: addr=louis.chauvet@bootlin.com; keydata=
 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
In-Reply-To: <20250507135431.53907-1-jose.exposito89@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdekkeeiucdltddurdegfedvrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedugfeggeeuffejffetteetheejhfeitdekvdfftedttdehtdehhfdvvdelgfelveenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghdpkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludelvddrudeikedrtddrvddtngdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedutddprhgtphhtthhopehjohhsvgdrvgigphhoshhithhokeelsehgmhgrihhlrdgtohhmpdhrtghpthhtohephhgrmhhohhgrmhhmvggurdhsrgesghhmrghilhdrtghomhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhp
 dhrtghpthhtohepmhgvlhhishhsrgdrshhrfiesghhmrghilhdrtghomhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhm
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

Hi everyone,

I have reviewed all the series, but I would appreciate an additional 
review for two important reasons:
- This series introduces a new uAPI, and I believe it is crucial to have 
at least a third perspective before merging.
- I was heavily involved in the creation of these patches, so an 
external review would be very valuable.

Could someone please look at it so we can move forward? We have many new 
parameters to introduce, such as plane configuration and dynamic 
connectors, but everything depends on this series.

Thank you very much for your help!

Best regards,
Louis Chauvet


Le 07/05/2025 à 15:54, José Expósito a écrit :
> Hi everyone,
> 
> This series allow to configure one or more VKMS instances without having
> to reload the driver using configfs.
> 
> The series is structured in 3 blocks:
> 
>    - Patches 1..11: Basic device configuration. For simplicity, I kept the
>      available options as minimal as possible.
> 
>    - Patches 12 and 13: New option to skip the default device creation and to-do
>      cleanup.
> 
>    - Patches 14, 15 and 16: Allow to hot-plug and unplug connectors. This is not
>      part of the minimal set of options, but I included in this series so it can
>      be used as a template/example of how new configurations can be added.
> 
> The process of configuring a VKMS device is documented in "vkms.rst".
> 
> Finally, the code is thoroughly tested by a collection of IGT tests [1].
> 
> Best wishes,
> José Expósito
> 
> [1] https://lists.freedesktop.org/archives/igt-dev/2025-February/086071.html
> 
> Changes in v5:
> 
>    - Added Reviewed-by tags, thanks Louis!
>    - Rebased on top of drm-misc-next
>    - Link to v4: https://lore.kernel.org/dri-devel/20250407081425.6420-1-jose.exposito89@gmail.com/
> 
> Changes in v4:
> 
>    - Since Louis and I worked on this together, set him as the author of some of
>      the patches and me as co-developed-by to reflect this joint effort.
>    - Rebased on top of drm-misc-next
>    - Link to v3: https://lore.kernel.org/all/20250307163353.5896-1-jose.exposito89@gmail.com/
> 
> Changes in v3:
> 
>    - Applied review comments by Louis Chauvet: (thanks!!)
>      - Use scoped_guard() instead of guard(mutex)(...)
>      - Fix a use-after-free error in the connector hot-plug code
>    - Rebased on top of drm-misc-next
>    - Link to v2: https://lore.kernel.org/all/20250225175936.7223-1-jose.exposito89@gmail.com/
> 
> Changes in v2:
> 
>    - Applied review comments by Louis Chauvet:
>      - Use guard(mutex)(...) instead of lock/unlock
>      - Return -EBUSY when trying to modify a enabled device
>      - Move the connector hot-plug related patches to the end
>    - Rebased on top of drm-misc-next
>    - Link to v1: https://lore.kernel.org/dri-devel/20250218170808.9507-1-jose.exposito89@gmail.com/T/
> 
> José Expósito (6):
>    drm/vkms: Expose device creation and destruction
>    drm/vkms: Allow to configure the default device creation
>    drm/vkms: Remove completed task from the TODO list
>    drm/vkms: Allow to configure connector status
>    drm/vkms: Allow to update the connector status
>    drm/vkms: Allow to configure connector status via configfs
> 
> Louis Chauvet (10):
>    drm/vkms: Add and remove VKMS instances via configfs
>    drm/vkms: Allow to configure multiple planes via configfs
>    drm/vkms: Allow to configure the plane type via configfs
>    drm/vkms: Allow to configure multiple CRTCs via configfs
>    drm/vkms: Allow to configure CRTC writeback support via configfs
>    drm/vkms: Allow to attach planes and CRTCs via configfs
>    drm/vkms: Allow to configure multiple encoders via configfs
>    drm/vkms: Allow to attach encoders and CRTCs via configfs
>    drm/vkms: Allow to configure multiple connectors via configfs
>    drm/vkms: Allow to attach connectors and encoders via configfs
> 
>   Documentation/gpu/vkms.rst                    | 100 ++-
>   drivers/gpu/drm/vkms/Kconfig                  |   1 +
>   drivers/gpu/drm/vkms/Makefile                 |   3 +-
>   drivers/gpu/drm/vkms/tests/vkms_config_test.c |  24 +
>   drivers/gpu/drm/vkms/vkms_config.c            |   8 +-
>   drivers/gpu/drm/vkms/vkms_config.h            |  26 +
>   drivers/gpu/drm/vkms/vkms_configfs.c          | 833 ++++++++++++++++++
>   drivers/gpu/drm/vkms/vkms_configfs.h          |   8 +
>   drivers/gpu/drm/vkms/vkms_connector.c         |  35 +
>   drivers/gpu/drm/vkms/vkms_connector.h         |   9 +
>   drivers/gpu/drm/vkms/vkms_drv.c               |  18 +-
>   drivers/gpu/drm/vkms/vkms_drv.h               |  20 +
>   12 files changed, 1072 insertions(+), 13 deletions(-)
>   create mode 100644 drivers/gpu/drm/vkms/vkms_configfs.c
>   create mode 100644 drivers/gpu/drm/vkms/vkms_configfs.h
> 
> 
> base-commit: a6c0a91ccb257eaec2aee080df06863ce7601315

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

