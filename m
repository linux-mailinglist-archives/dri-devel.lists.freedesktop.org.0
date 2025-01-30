Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C86CAA22E1B
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 14:48:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EC2710E977;
	Thu, 30 Jan 2025 13:48:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="KJUtfe52";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 336C310E977
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 13:48:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8ECD6433FE;
 Thu, 30 Jan 2025 13:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1738244892;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ql8BzmmoO031N5nsrIyTvjhgTOuhcvF4r82LgY5pXDE=;
 b=KJUtfe524WIpGifHuYnfRyqTp5ZBsB/zHfXSuHiIkiEhVUkA5F3WPBHIVtlrQYoBnt8jtV
 zQqOS4dn6s6W4S+Loyg/WU6vS7WW3IFZOGRy3RpuWDmXMn0tJPjFqPI43L+cLQJnwv6we2
 tYcOOLjXXmBvszp72qoKA+68GnCQjaDehF4HCMvPjOc51ih2fEkoJkPoG1OHVSYD/cxxlK
 6+tloWceKontdgXhaja7CpxZ4TTh21pF0CvTBI10Kse9Q9CCgTHXDkxSE4YhZfnGLKe3/T
 BgG5YXu5PkiTyOt3FoMDd8AD2FbqNChnmEif3YWq0Q5oTAZuw2adO9Be7nY4XA==
Date: Thu, 30 Jan 2025 14:48:10 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/13] drm/vkms: Allow to configure device
Message-ID: <Z5uDGr445jEfdt5L@louis-chauvet-laptop>
Mail-Followup-To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?=
 <jose.exposito89@gmail.com>, 
 hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250129110059.12199-1-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250129110059.12199-1-jose.exposito89@gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehleekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtudenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeljeevteeggeevjeeijeeuledvhfduudehhfeijedtieekvdffhfffieekvddvhfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhgihhthhhusgdrtghomhdpfhhrvggvuggvshhkthhophdrohhrghenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhouhhishdqtghhrghuvhgvthdqlhgrphhtohhppdhmrghilhhfrhhomheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepjhhoshgvrdgvgihpohhsihhtohekleesghhmrghilhdrtghomhdprhgtphhtthhopehhrghmohhhrghmmhgvugdrshgrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhop
 ehmvghlihhsshgrrdhsrhifsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomh
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

On 29/01/25 - 12:00, José Expósito wrote:
> Hi everyone,
> 
> In preparation for ConfigFS support, a flexible way to configure VKMS device(s)
> is required.
> This series adds the required APIs to create a configuration, the code changes
> required to apply it and KUnit test validating the changes.

Hi José,

Thanks a lot!

This series is amazing and better than mine on many points. I have few 
comments:
- a "strange" naming pair: add/destroy (I expect add/remove or 
  create/destroy like other function in DRM)
- usage of "complex" list accessors, can't we just create iterators?
- should we use pr_err in vkms_config_valid?

> Louis Chauvet and I are working on ConfigFS support. In this series I tried to
> merge his changes [1] with mine [2].
> I kept his Signed-off-by to reflect that, even if I show up as the author of
> some/most of the patches, this was a joint effort.

To avoid confusion, you should add the Co-developped-by tag, so it will be 
clear that we worked together on this.
 
> I'm still polishing the ConfigFS code [3] and its IGT tests [4] (connector
> hot-add/remove bugs) but the IGT tests also exercise this series and can be used
> for additional test coverage.

I will take a look at those series. For the connector hot-add/remove, do 
you have any example of usage in the kernel? I did not found anything in 
the documentation explaining they are hot-addable.

Thanks again for this series,
Louis Chauvet

> Best wishes,
> José Expósito
> 
> [1] https://patchwork.kernel.org/project/dri-devel/cover/20250121-google-remove-crtc-index-from-parameter-v3-0-cac00a3c3544@bootlin.com/
> [2] https://patchwork.kernel.org/project/dri-devel/cover/20240813105134.17439-1-jose.exposito89@gmail.com/
> [3] https://github.com/JoseExposito/linux/commits/patch-vkms-configfs/
> [4] https://gitlab.freedesktop.org/jexposit/igt-gpu-tools/-/commits/vkms-configfs
> 
> José Expósito (12):
>   drm/vkms: Extract vkms_connector header
>   drm/vkms: Add KUnit test scaffolding
>   drm/vkms: Extract vkms_config header
>   drm/vkms: Move default_config creation to its own function
>   drm/vkms: Set device name from vkms_config
>   drm/vkms: Allow to configure multiple planes
>   drm/vkms: Allow to configure multiple CRTCs
>   drm/vkms: Allow to attach planes and CRTCs
>   drm/vkms: Allow to configure multiple encoders
>   drm/vkms: Allow to attach encoders and CRTCs
>   drm/vkms: Allow to configure multiple connectors
>   drm/vkms: Allow to attach connectors and encoders
> 
> Louis Chauvet (1):
>   drm/vkms: Add a validation function for VKMS configuration
> 
>  drivers/gpu/drm/vkms/Kconfig                  |  15 +
>  drivers/gpu/drm/vkms/Makefile                 |   5 +-
>  drivers/gpu/drm/vkms/tests/.kunitconfig       |   4 +
>  drivers/gpu/drm/vkms/tests/Makefile           |   3 +
>  drivers/gpu/drm/vkms/tests/vkms_config_test.c | 782 +++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_config.c            | 784 ++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_config.h            | 479 +++++++++++
>  drivers/gpu/drm/vkms/vkms_connector.c         |  61 ++
>  drivers/gpu/drm/vkms/vkms_connector.h         |  26 +
>  drivers/gpu/drm/vkms/vkms_drv.c               |  45 +-
>  drivers/gpu/drm/vkms/vkms_drv.h               |  17 +-
>  drivers/gpu/drm/vkms/vkms_output.c            | 255 ++++--
>  12 files changed, 2337 insertions(+), 139 deletions(-)
>  create mode 100644 drivers/gpu/drm/vkms/tests/.kunitconfig
>  create mode 100644 drivers/gpu/drm/vkms/tests/Makefile
>  create mode 100644 drivers/gpu/drm/vkms/tests/vkms_config_test.c
>  create mode 100644 drivers/gpu/drm/vkms/vkms_config.c
>  create mode 100644 drivers/gpu/drm/vkms/vkms_config.h
>  create mode 100644 drivers/gpu/drm/vkms/vkms_connector.c
>  create mode 100644 drivers/gpu/drm/vkms/vkms_connector.h
> 
> -- 
> 2.48.1
> 
