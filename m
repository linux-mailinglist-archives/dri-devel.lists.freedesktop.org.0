Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB658A2727F
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 14:12:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD42310E61C;
	Tue,  4 Feb 2025 13:12:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="X67EUT3y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FC2E10E61C
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 13:12:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CE3FD442EF;
 Tue,  4 Feb 2025 13:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1738674729;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KaFv2tN02EO//W/KYhr5syZIZ2CdJNLTZ/Qhdjy6z+k=;
 b=X67EUT3yj7Zn/TpSMV04LSsWxrD1EdzGyRGsNWIr2sjph/K5nAOmQMXTvjVP7Ze7D+9TjL
 9zlD9AWkEdTGb/O3aiyaqovCbWN2/3VOnYvMyoVC+ZS1D7mIS+QGapbfzPyGBbB8Tjmjaf
 UvTjS+ADTGbMNjdVYrl/zbUIcEPJXgEOz9CwzqK/2GsYejVWNfAUWntVVRWVwAQXNO5KEY
 +2fajdlQ5agr0yi8dqiFYfXu6sP0/klnK8zi08gRBCL7NU3IiOmxCwGJHk7CJ6+k4VcpUx
 JNQDsFXe0XPVz2p6k4EKe1PfvDKLd0ZO7Fz5fgcedzrUuEZjhD7WJLukyx9cXQ==
Date: Tue, 4 Feb 2025 14:12:07 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] DRM: small improvements
Message-ID: <Z6ISJ_zWeFK9LoQJ@louis-chauvet-laptop>
Mail-Followup-To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250204-drm-small-improvements-v4-0-d6bbc92f12f1@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204-drm-small-improvements-v4-0-d6bbc92f12f1@bootlin.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdeiudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefggeegieduuddvvddtueeiffeiffdtiefhvdfggfetheduveejudfgtdffkefhvdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohhuihhsqdgthhgruhhvvghtqdhlrghpthhophdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduuddprhgtphhtthhopehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsu
 hhsvgdruggvpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtohepughmihhtrhihrdgsrghrhihshhhkohhvsehlihhnrghrohdrohhrghdprhgtphhtthhopehjrghnihdrnhhikhhulhgrsehlihhnuhigrdhinhhtvghlrdgtohhm
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

On 04/02/25 - 09:51, Luca Ceresoli wrote:
> This series brings small improvements to the DRM documentation and logging.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Applied on drm-misc-next, thanks.

Louis Chauvet

> ---
> Changes in v4:
> - Removed pathches 3 and 4 because the added warning has false positives
>   when cleaning up a connector in the init error path
> - Updated acked-by tags
> - Link to v3: https://lore.kernel.org/r/20241111-drm-small-improvements-v3-0-a9f576111b41@bootlin.com
> 
> Changes in v3:
> - patch 3: various fixes suggested by Jani Nikula and kernel test robot
> - Updated reviewed-by tags
> - Link to v2: https://lore.kernel.org/r/20241106-drm-small-improvements-v2-0-f6e2aef86719@bootlin.com
> 
> Changes in v2:
> - Added patches 3 and 4
> - Updated reviewed-by tags
> - Link to v1: https://lore.kernel.org/r/20241018-drm-small-improvements-v1-0-cc316e1a98c9@bootlin.com
> 
> ---
> Luca Ceresoli (2):
>       drm/drm_mode_object: fix typo in kerneldoc
>       drm/atomic-helper: improve CRTC enabled/connectors mismatch logging message
> 
>  drivers/gpu/drm/drm_atomic_helper.c | 5 +++--
>  include/drm/drm_mode_object.h       | 2 +-
>  2 files changed, 4 insertions(+), 3 deletions(-)
> ---
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> change-id: 20241018-drm-small-improvements-1d104cc10280
> 
> Best regards,
> -- 
> Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
