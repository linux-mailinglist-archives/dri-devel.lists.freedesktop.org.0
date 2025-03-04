Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B85BFA4D8EF
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 10:43:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E02FB10E55D;
	Tue,  4 Mar 2025 09:43:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="GaO7AbEY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8147210E551
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 09:43:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9D44F43284;
 Tue,  4 Mar 2025 09:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1741081394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=crDLL2GXtfOejp4EJCkj3Z+BGJtGWzuSVXp69qOLGpQ=;
 b=GaO7AbEYOeiUDuSiSsVS7uVhRNfDBhQaULG7tETydzqI9b3y8pW6mc1tRjycRKQlM63aLN
 QtCtho6hWsLr9Z0p8Ze05LooMxEr+kgM5oFbVEoBu5dohWWUapGxXvk1D9aE0Utz9jdmF1
 ay1WQgnyrG9AJJk8sP3R+WN3jGusUo6r8OevFlfnysvk5FbsM1evf3kSy6iEu/DiWKNwqT
 p93z0NKdOYRbAsj4cBcoigac/cmdVugx4TDgGmM8BUQDL+DVGy3cfVkdF6pfCu4RA36/HT
 tB1KAu/KMHLpIydYEvSa2kluWapfySVfp+Jp3SxwZG1e9iKN6ts/FxHItv4MZQ==
Message-ID: <36c37aae-244f-48f8-8f88-c46b58a9e8b1@bootlin.com>
Date: Tue, 4 Mar 2025 10:43:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/14] drm/vkms: Allow to configure device
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250218101214.5790-1-jose.exposito89@gmail.com>
Content-Language: en-US
From: Louis Chauvet <louis.chauvet@bootlin.com>
Autocrypt: addr=louis.chauvet@bootlin.com; keydata=
 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
In-Reply-To: <20250218101214.5790-1-jose.exposito89@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutddujedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeefleejleelhfeiuddvveeikeevudekgffhkeeggfdukeetgfetleetuefgudeuueenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhgihhthhhusgdrtghomhdpfhhrvggvuggvshhkthhophdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrddtrddvtdgnpdhmrghilhhfrhhomheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepjhhoshgvrdgvgihpohhsihhtohekleesghhmrghilhdrtghomhdprhgtphhtthhopehhrghmohhhrghmmhgvugdrshgrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgth
 hdprhgtphhtthhopehmvghlihhsshgrrdhsrhifsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomh
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



Le 18/02/2025 à 11:12, José Expósito a écrit :
> Hi everyone,
> 
> In preparation for ConfigFS support, a flexible way to configure VKMS device(s)
> is required.
> This series adds the required APIs to create a configuration, the code changes
> required to apply it and KUnit test validating the changes.
> 
> Louis Chauvet and I are working on ConfigFS support. In this series I tried to
> merge his changes [1] with mine [2].
> I kept his Signed-off-by to reflect that, even if I show up as the author of
> some/most of the patches, this was a joint effort.
> 
> I'll send the ConfigFS code [3] and its IGT tests [4] code this week.
> Meanwhile, the IGT tests also exercise this series and can be used for
> additional test coverage.
> 
> Best wishes,
> José Expósito

Hi all,

I am trying to apply this series but I am encountering some issues. Most 
of the patches have the following trailers:

Co-developed-by: Louis Chauvet
Signed-off-by: Louis Chauvet
Signed-off-by: José Exposito

When I use dim b4-shazam, the result is:

Co-developed-by: Louis Chauvet
Signed-off-by: José Exposito
Signed-off-by: Louis Chauvet

However, checkpatch is not happy with this because it removes my 
Signed-off-by line immediately after Co-developed-by.

I then tried to add it myself:

Co-developed-by: Louis Chauvet
Signed-off-by: Louis Chauvet
Signed-off-by: José Exposito
Signed-off-by: Louis Chauvet

But this time, checkpatch complains that I have my Signed-off-by line twice.

And if I don't add the last Signed-off-by, checkpatch is indeed not 
happy too:

Co-developed-by: Louis Chauvet
Signed-off-by: Louis Chauvet
Signed-off-by: José Exposito

How should I proceed in this situation? Should I ignore some warnings? 
If so, what are the expected trailers?

Thanks!

> [1] https://patchwork.kernel.org/project/dri-devel/cover/20250121-google-remove-crtc-index-from-parameter-v3-0-cac00a3c3544@bootlin.com/
> [2] https://patchwork.kernel.org/project/dri-devel/cover/20240813105134.17439-1-jose.exposito89@gmail.com/
> [3] https://github.com/JoseExposito/linux/commits/patch-vkms-configfs/
> [4] https://gitlab.freedesktop.org/jexposit/igt-gpu-tools/-/commits/vkms-configfs
> 
> Changes in v4:
> 
>    - Applied review comments by Louis Chauvet: (thanks!!)
>      - Do not access "private" struct fields in tests
>      - Reviewed-by in all patches
>    - Rebased on top of drm-misc-next
>    - Link to v3: https://lore.kernel.org/dri-devel/20250217100120.7620-1-jose.exposito89@gmail.com/T/
> 
> Changes in v3:
> 
>    - Applied review comments by Louis Chauvet:
>      - Moved drm_vblank_init(..., vkms_config_get_num_crtcs()) to a different patch
>      - Improved error handling in vkms_config_*_attach_*() functions
>      - Fixed compilation errors when CONFIG_DRM_VKMS_KUNIT_TEST=m
>      - Used for_each iterators in vkms_config_test_default_config(). A leftover
>        from the removed connector hot-add code
>      - Validated that vkms_config.dev wasn't NULL before calling drm_info()
>      - Kept vkms_device.config as a const pointer (at the cost of casting in
>        list_count_nodes())
>    - Renamed "CONFIG_DRM_VKMS_KUNIT_TESTS" to "CONFIG_DRM_VKMS_KUNIT_TEST" for
>      consistency with other options
>    - Rebased on top of drm-misc-next
>    - Link to v2: https://lore.kernel.org/all/20250211110912.15409-1-jose.exposito89@gmail.com/
> 
> Changes in v2:
> 
>    - Applied review comments by Louis Chauvet:
>      - Added Co-developped-by tags where required
>      - Split the first patch in 2: vkms_connector.h/c creation and struct
>        vkms_connector creation
>      - Fixes a user after free/double free bug. The bug is already present
>        in drm-misc-next and the fix could be merged independently
>      - Implemented for_each macros for the config
>      - Other naming fixes
>    - Link to v1: https://lore.kernel.org/all/20250129110059.12199-1-jose.exposito89@gmail.com/
> 
> José Expósito (13):
>    drm/vkms: Extract vkms_connector header
>    drm/vkms: Create vkms_connector struct
>    drm/vkms: Add KUnit test scaffolding
>    drm/vkms: Extract vkms_config header
>    drm/vkms: Move default_config creation to its own function
>    drm/vkms: Set device name from vkms_config
>    drm/vkms: Allow to configure multiple planes
>    drm/vkms: Allow to configure multiple CRTCs
>    drm/vkms: Allow to attach planes and CRTCs
>    drm/vkms: Allow to configure multiple encoders
>    drm/vkms: Allow to attach encoders and CRTCs
>    drm/vkms: Allow to configure multiple connectors
>    drm/vkms: Allow to attach connectors and encoders
> 
> Louis Chauvet (1):
>    drm/vkms: Add a validation function for VKMS configuration
> 
>   .clang-format                                 |   7 +
>   drivers/gpu/drm/vkms/Kconfig                  |  15 +
>   drivers/gpu/drm/vkms/Makefile                 |   5 +-
>   drivers/gpu/drm/vkms/tests/.kunitconfig       |   4 +
>   drivers/gpu/drm/vkms/tests/Makefile           |   3 +
>   drivers/gpu/drm/vkms/tests/vkms_config_test.c | 951 ++++++++++++++++++
>   drivers/gpu/drm/vkms/vkms_config.c            | 640 ++++++++++++
>   drivers/gpu/drm/vkms/vkms_config.h            | 437 ++++++++
>   drivers/gpu/drm/vkms/vkms_connector.c         |  61 ++
>   drivers/gpu/drm/vkms/vkms_connector.h         |  26 +
>   drivers/gpu/drm/vkms/vkms_drv.c               |  45 +-
>   drivers/gpu/drm/vkms/vkms_drv.h               |  17 +-
>   drivers/gpu/drm/vkms/vkms_output.c            | 176 ++--
>   13 files changed, 2246 insertions(+), 141 deletions(-)
>   create mode 100644 drivers/gpu/drm/vkms/tests/.kunitconfig
>   create mode 100644 drivers/gpu/drm/vkms/tests/Makefile
>   create mode 100644 drivers/gpu/drm/vkms/tests/vkms_config_test.c
>   create mode 100644 drivers/gpu/drm/vkms/vkms_config.c
>   create mode 100644 drivers/gpu/drm/vkms/vkms_config.h
>   create mode 100644 drivers/gpu/drm/vkms/vkms_connector.c
>   create mode 100644 drivers/gpu/drm/vkms/vkms_connector.h
> 

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

