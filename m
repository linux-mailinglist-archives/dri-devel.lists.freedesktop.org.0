Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E345B091FA
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 18:37:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D35710E318;
	Thu, 17 Jul 2025 16:37:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="ko81sSJW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5142610E318
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 16:37:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9DACD44343;
 Thu, 17 Jul 2025 16:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1752770238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=CcLp3A2P4/xvEEpYBjQjKtopmhmP8XtLLtWugnPUkP8=;
 b=ko81sSJWc1pToXF/vqbkc4COvy4d0RAi41T3l+fkNBgEfzcSyJHVK9EW01a2tjl2tRuO9h
 W7dluo9Nmq48ZVmKMvcs6WxkKwUxRplGW9QboAoQcXtgQJ4XhOZBIbB4LaQbIKgxRwLXQs
 7/vzz7WQ+75BPoZ8OCk0y9yeOWb1epbMDOYpRyt9o2PPAYlvzvsrxsnaYSSXeOLMJXjh35
 w7oaTAxhBNOggC+DjvnVKkznYuy4S7ZhHF/zAr1dPp5qzK4eUeIg8tFGndS6H/U9p5uAQN
 6SOJw637PpyRJg/0CSrTX/2tFP8AjkksNZEc/u+IuDyfKi94lMf03pS110xCSQ==
Message-ID: <57e425ff-2731-47d7-b5ce-c34f5baf71b4@bootlin.com>
Date: Thu, 17 Jul 2025 18:37:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/16] drm/vkms: Add configfs support
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 tzimmermann@suse.de, mripard@kernel.org, simona@ffwll.ch,
 sebastian.wick@redhat.com, victoria@system76.com,
 Mark Yacoub <markyacoub@google.com>, xaver.hugl@kde.org
Cc: hamohammed.sa@gmail.com, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeiuddtjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpefnohhuihhsucevhhgruhhvvghtuceolhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveettdevgeegvdeigedtieffvdetheeffeehvdeggfejffeiuddtgeffieeljeefnecuffhomhgrihhnpehgnhhomhgvrdhorhhgpdhgihhthhhusgdrtghomhdpfhhrvggvuggvshhkthhophdrohhrghdpkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludelvddrudeikedrtddrvddtngdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedugedprhgtphhtthhopehjohhsvgdrvgigphhoshhithhokeelsehgmhgrihhlrdgtohhmpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopehmrhhiphgrrhgusehkv
 ghrnhgvlhdrohhrghdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtohepshgvsggrshhtihgrnhdrfihitghksehrvgguhhgrthdrtghomhdprhgtphhtthhopehvihgtthhorhhirgesshihshhtvghmjeeirdgtohhmpdhrtghpthhtohepmhgrrhhkhigrtghouhgssehgohhoghhlvgdrtghomhdprhgtphhtthhopeigrghvvghrrdhhuhhglheskhguvgdrohhrgh
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

+CC: Mark (Google), Sebastian (Mutter), Xaver (KWin), Victoria (Cosmic)

Hi everyone,

Last week, I presented this work at the Display Next Hackfest, and the 
feedback from compositors was very positive. At least KWin, Mutter, and 
Cosmic are interested in integrating it into their tests, so it would be 
great if someone could review it.

Sebastian quickly tested this work (using [2] for full features) with 
their existing VKMS tests [1], and it worked. From what I understand, 
the tests are quite basic —just sanity checks— but we were able to 
reproduce the default vkms device using ConfigFS.

If another compositor wants to test the ConfigFS interface (I will try 
to keep [2] updated), that would be amazing. Feel free to send feedback!

A small note: This series has a minor conflict since the conversion to 
the faux device, but it can be applied using `b4 am -3 ... && git am -3 
...`.
@josé, if you send a new iteration, can you add markyacoub@google.com in 
copy, and maybe Sebastian, Xaver, Victoria if they want to follow the 
upstreaming?

Thank you,
Louis Chauvet

[1]:https://gitlab.gnome.org/swick/mutter/-/commit/88a7354942d9728dae06fb83cc4f2d2c7b08b694
[2]:https://github.com/Fomys/linux/tree/configfs-everything



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

