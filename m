Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54627A43CA1
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 12:02:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A9C910E4B6;
	Tue, 25 Feb 2025 11:02:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="ViXF4NWm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 767DB10E15F
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 11:02:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 21440204DB;
 Tue, 25 Feb 2025 11:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1740481321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2lis+lHVZ3LLTV+1D6rmDMk5TRuBmXQzInksWAQwV+4=;
 b=ViXF4NWmC07u1p3ZztSnmxYMOttRItA0DLIzLkSnNMnG18rWO6ZlaEVOjZ138jwSXQEHUF
 9BLboaKKVuJTkP8tYiiwTkDkUBD/Qzy25LMQW7dEUiWQE+bX+4sEqiJQqNKqssVVxRSaOg
 JG0n2oQcOmGlXiKdjZWGxNBQA5za2tsz8SdrJuGIMZqUezq/h69cZRyWG9d+lGNNTg76G3
 tn9NZrEMQ/weEvTk1CzCc2h+/fw9SWIpvcMWEOEjOqeImQuRDtr2dYhp3DpX3FHjlLgxMr
 nDUzLkesyvza2p1wufDMoMcz6ZJW5yyPeR/pZzakEQSjXkBL6tsXIKMf/qM2xw==
Date: Tue, 25 Feb 2025 12:01:58 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/16] drm/vkms: Add configfs support
Message-ID: <Z72jJtFCMypHpW_K@louis-chauvet-laptop>
Mail-Followup-To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?=
 <jose.exposito89@gmail.com>, 
 hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250218170808.9507-1-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250218170808.9507-1-jose.exposito89@gmail.com>
X-GND-State: spam:low
X-GND-Score: 200
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekudehfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnegoufhprghmsghothdqtfegvdefqdegieculdeftddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtudenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeiffeijeehfeeiffetffffgfelgfelheffiefgvefhfefhgfffgfelieeufffgtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhfrhgvvgguvghskhhtohhprdhorhhgnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohhuihhsqdgthhgruhhvvghtqdhlrghpthhophdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedutddprhgtphhtthhopehjohhsvgdrvgigphhoshhithhokeelsehgmhgrihhlrdgtohhmpdhrtghpthhtohephhgrmhhohhgrmhhmvggurdhsrgesghhmrghilhdrtghomhdprhgtphhtthhopehsihhmohhnrgesfhhff
 ihllhdrtghhpdhrtghpthhtohepmhgvlhhishhsrgdrshhrfiesghhmrghilhdrtghomhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhm
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

On 18/02/25 - 18:07, José Expósito wrote:
> Hi everyone,
> 
> This series, to be applied on top of [1], allow to configure one or more VKMS
> instances without having to reload the driver using configfs.
> 
> The series is structured in 3 blocks:
> 
>   - Patches 1..11: Basic device configuration. For simplicity, I kept the
>     available options as minimal as possible.

Thanks for this series, it is really nice!

I did some review, that can be sumarized in two point:
- Do we want to use scoped_guard?
- -EPERM, -EINVAL or -EBUSY when attempting to do something while the
  device is enabled
 
>   - Patches 12, 13 and 14: Allow to hot-plug and unplug connectors. This is not
>     part of the minimal set of options, but I included in this series so it can
>     be used as a template/example of how new configurations can be added.
> 
>   - Patches 15 and 16: New option to skip the default device creation and to-do
>     cleanup.

For the next iteration, can you move those patch before 12, 13, 14, so
1..11 could be merged before 12..14 (I need to think about the connector 
API to check if it will works with dynamic connector)?
 
> The process of configuring a VKMS device is documented in "vkms.rst".

This is a really good documentation!

> Finally, the code is thoroughly tested by a collection of IGT tests [2].

I quickly looked on them, it seems nice! Thank you for this huge
improvment!

Louis Chauvet

> Best wishes,
> José Expósito
> 
> [1] https://lore.kernel.org/all/20250218101214.5790-1-jose.exposito89@gmail.com/
> [2] It is not in patchwork yet, but it'll appear here eventually:
>     https://patchwork.freedesktop.org/project/igt/patches/?submitter=19782&state=*&q=&archive=both&delegate=
> 
> José Expósito (16):
>   drm/vkms: Expose device creation and destruction
>   drm/vkms: Add and remove VKMS instances via configfs
>   drm/vkms: Allow to configure multiple planes via configfs
>   drm/vkms: Allow to configure the plane type via configfs
>   drm/vkms: Allow to configure multiple CRTCs via configfs
>   drm/vkms: Allow to configure CRTC writeback support via configfs
>   drm/vkms: Allow to attach planes and CRTCs via configfs
>   drm/vkms: Allow to configure multiple encoders via configfs
>   drm/vkms: Allow to attach encoders and CRTCs via configfs
>   drm/vkms: Allow to configure multiple connectors via configfs
>   drm/vkms: Allow to attach connectors and encoders via configfs
>   drm/vkms: Allow to configure connector status
>   drm/vkms: Allow to update the connector status
>   drm/vkms: Allow to configure connector status via configfs
>   drm/vkms: Allow to configure the default device creation
>   drm/vkms: Remove completed task from the TODO list
> 
>  Documentation/gpu/vkms.rst                    |  98 +-
>  drivers/gpu/drm/vkms/Kconfig                  |   1 +
>  drivers/gpu/drm/vkms/Makefile                 |   3 +-
>  drivers/gpu/drm/vkms/tests/vkms_config_test.c |  24 +
>  drivers/gpu/drm/vkms/vkms_config.c            |   8 +-
>  drivers/gpu/drm/vkms/vkms_config.h            |  26 +
>  drivers/gpu/drm/vkms/vkms_configfs.c          | 918 ++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_configfs.h          |   8 +
>  drivers/gpu/drm/vkms/vkms_connector.c         |  26 +-
>  drivers/gpu/drm/vkms/vkms_connector.h         |  18 +-
>  drivers/gpu/drm/vkms/vkms_drv.c               |  18 +-
>  drivers/gpu/drm/vkms/vkms_drv.h               |   4 +
>  drivers/gpu/drm/vkms/vkms_output.c            |   2 +-
>  13 files changed, 1138 insertions(+), 16 deletions(-)
>  create mode 100644 drivers/gpu/drm/vkms/vkms_configfs.c
>  create mode 100644 drivers/gpu/drm/vkms/vkms_configfs.h
> 
> 
> base-commit: 9b6c03cb96b9e19bce2c2764d2c6dd4ccbd06c5d
> prerequisite-patch-id: 1bff7bbc4ef0e29266265ac3dc009011c046f745
> prerequisite-patch-id: 74a284d40a426a0038a7054068192238f7658187
> prerequisite-patch-id: c3e34e88ad6a0acf7d9ded0cdb4745a87cf6fd82
> prerequisite-patch-id: 9cd0dfaf8e21a811edbe5a2da7185b6f9055d42d
> prerequisite-patch-id: f50c41578b639370a5d610af6f25c2077321a886
> prerequisite-patch-id: 5a7219a51e42de002b8dbf94ec8af96320043489
> prerequisite-patch-id: 67ea5d4e21b4ce4acbd6fc3ce83017f55811c49b
> prerequisite-patch-id: 37a7fab113a32581f053c09f45efb137afd75a1b
> prerequisite-patch-id: 475bcdc6267f4b02fb1bb2379145529c33684e4f
> prerequisite-patch-id: d3114f0b3da3d8b5ad64692df761f1cf42fbdf12
> prerequisite-patch-id: d1d9280fb056130df2050a09b7ea7e7ddde007c5
> prerequisite-patch-id: 2c370f3de6d227fa8881212207978cce7bbb18ba
> prerequisite-patch-id: 938b8fe5437e5f7bc22bffc55ae249a27d399d66
> prerequisite-patch-id: ab0a510994fbe9985dc46a3d35e6d0574ddbb633
> -- 
> 2.48.1
> 
