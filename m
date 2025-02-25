Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41871A437BC
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 09:35:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA14910E5B3;
	Tue, 25 Feb 2025 08:35:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="1OM5i+fQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="c3kQ/xhV";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1OM5i+fQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="c3kQ/xhV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2A3710E5B3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 08:35:35 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 752861F44F;
 Tue, 25 Feb 2025 08:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1740472534; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=uMM5bLzA9j3o8sps9jmcrBs0joj/12hdiYZwkw2d5Ic=;
 b=1OM5i+fQhp5KLs1nYvViBJZ8kVPoyXj4y3l7fa6l//EcEX8dKWl4rj44A6F7VfQZf+coDw
 ZG46+roFJXxvsMStEc9ClVQ5Xj530S60T/5lGQFXJKCEPR0I9H7qwyNZKQA5b8na3qRh4s
 Jo2yOkWK9C6jrHVkvJYzIexMnBLC/F4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1740472534;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=uMM5bLzA9j3o8sps9jmcrBs0joj/12hdiYZwkw2d5Ic=;
 b=c3kQ/xhVLYX7YyKktt3AuPVpQAKgoWwmIpGUZHF0FZdNhVovlgb8VXo3UdsVGJjXa0hZAS
 2iR3L5kLqgZTApDQ==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=1OM5i+fQ;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="c3kQ/xhV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1740472534; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=uMM5bLzA9j3o8sps9jmcrBs0joj/12hdiYZwkw2d5Ic=;
 b=1OM5i+fQhp5KLs1nYvViBJZ8kVPoyXj4y3l7fa6l//EcEX8dKWl4rj44A6F7VfQZf+coDw
 ZG46+roFJXxvsMStEc9ClVQ5Xj530S60T/5lGQFXJKCEPR0I9H7qwyNZKQA5b8na3qRh4s
 Jo2yOkWK9C6jrHVkvJYzIexMnBLC/F4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1740472534;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=uMM5bLzA9j3o8sps9jmcrBs0joj/12hdiYZwkw2d5Ic=;
 b=c3kQ/xhVLYX7YyKktt3AuPVpQAKgoWwmIpGUZHF0FZdNhVovlgb8VXo3UdsVGJjXa0hZAS
 2iR3L5kLqgZTApDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D0F4C13A61;
 Tue, 25 Feb 2025 08:35:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 6F3SMdWAvWcsAwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 25 Feb 2025 08:35:33 +0000
Message-ID: <f64d3e4c-86d3-4c7f-969a-0e8123a5c9b8@suse.de>
Date: Tue, 25 Feb 2025 09:35:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] accel/rocket: Add IOCTL for BO creation
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20250225-6-10-rocket-v2-0-d4dbcfafc141@tomeuvizoso.net>
 <20250225-6-10-rocket-v2-5-d4dbcfafc141@tomeuvizoso.net>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <20250225-6-10-rocket-v2-5-d4dbcfafc141@tomeuvizoso.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 752861F44F
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_TO(0.00)[tomeuvizoso.net,kernel.org,sntech.de,lwn.net,linux.intel.com,gmail.com,ffwll.ch,linaro.org,amd.com,collabora.com,quicinc.com];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 RCPT_COUNT_TWELVE(0.00)[23]; FUZZY_BLOCKED(0.00)[rspamd.com];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; RCVD_TLS_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 TAGGED_RCPT(0.00)[dt];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 
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

Hi

Am 25.02.25 um 08:55 schrieb Tomeu Vizoso:
> This uses the SHMEM DRM helpers and we map right away to the CPU and NPU
> sides, as all buffers are expected to be accessed from both.
>
> v2:
> - Sync the IOMMUs for the other cores when mapping and unmapping.
>
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> ---
>   drivers/accel/rocket/Makefile        |   3 +-
>   drivers/accel/rocket/rocket_device.c |   4 +
>   drivers/accel/rocket/rocket_device.h |   2 +
>   drivers/accel/rocket/rocket_drv.c    |   7 +-
>   drivers/accel/rocket/rocket_gem.c    | 141 +++++++++++++++++++++++++++++++++++
>   drivers/accel/rocket/rocket_gem.h    |  27 +++++++
>   include/uapi/drm/rocket_accel.h      |  43 +++++++++++
>   7 files changed, 225 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/accel/rocket/Makefile b/drivers/accel/rocket/Makefile
> index 73a7280d260c068d37ad3048824f710482333540..875cac2243d902694e0d5d05e60b4ae551a633c4 100644
> --- a/drivers/accel/rocket/Makefile
> +++ b/drivers/accel/rocket/Makefile
> @@ -5,4 +5,5 @@ obj-$(CONFIG_DRM_ACCEL_ROCKET) := rocket.o
>   rocket-y := \
>   	rocket_core.o \
>   	rocket_device.o \
> -	rocket_drv.o
> +	rocket_drv.o \
> +	rocket_gem.o
> diff --git a/drivers/accel/rocket/rocket_device.c b/drivers/accel/rocket/rocket_device.c
> index ce3b533f15c1011d8a7a23dd8132e907cc334c58..9af36357caba7148dcac764c8222699f3b572d60 100644
> --- a/drivers/accel/rocket/rocket_device.c
> +++ b/drivers/accel/rocket/rocket_device.c
> @@ -1,6 +1,7 @@
>   // SPDX-License-Identifier: GPL-2.0
>   /* Copyright 2024 Tomeu Vizoso <tomeu@tomeuvizoso.net> */
>   
> +#include "linux/mutex.h"

Include with angle brackets please.

>   #include <linux/clk.h>
>   
>   #include "rocket_device.h"
> @@ -10,6 +11,8 @@ int rocket_device_init(struct rocket_device *rdev)
>   	struct device *dev = rdev->cores[0].dev;
>   	int err;
>   
> +	mutex_init(&rdev->iommu_lock);

In DRM, we have drmm_mutex_init() in drm/drm_managed.h. Managed cleanup 
is generally preferred.

> +
>   	rdev->clk_npu = devm_clk_get(dev, "npu");
>   	rdev->pclk = devm_clk_get(dev, "pclk");
>   
> @@ -26,4 +29,5 @@ int rocket_device_init(struct rocket_device *rdev)
>   void rocket_device_fini(struct rocket_device *rdev)
>   {
>   	rocket_core_fini(&rdev->cores[0]);
> +	mutex_destroy(&rdev->iommu_lock);
>   }
> diff --git a/drivers/accel/rocket/rocket_device.h b/drivers/accel/rocket/rocket_device.h
> index 466edba9102c5dc5dfac5d3fcc1c904f206eaebb..c6152569fdd9e5587c8e8d7b0d7c2e2a77af6000 100644
> --- a/drivers/accel/rocket/rocket_device.h
> +++ b/drivers/accel/rocket/rocket_device.h
> @@ -14,6 +14,8 @@ struct rocket_device {
>   	struct clk *clk_npu;
>   	struct clk *pclk;
>   
> +	struct mutex iommu_lock;
> +
>   	struct rocket_core *cores;
>   	unsigned int num_cores;
>   };
> diff --git a/drivers/accel/rocket/rocket_drv.c b/drivers/accel/rocket/rocket_drv.c
> index c22d965f20f1239a36b1d823d5fe5f372713555d..e5612b52952fa7a0cd0af02aef314984bc483b05 100644
> --- a/drivers/accel/rocket/rocket_drv.c
> +++ b/drivers/accel/rocket/rocket_drv.c
> @@ -6,6 +6,7 @@
>   #include <drm/drm_gem.h>
>   #include <drm/drm_ioctl.h>
>   #include <drm/drm_of.h>
> +#include <drm/rocket_accel.h>
>   #include <linux/clk.h>
>   #include <linux/component.h>
>   #include <linux/dma-mapping.h>
> @@ -14,6 +15,7 @@
>   #include <linux/pm_runtime.h>
>   
>   #include "rocket_drv.h"
> +#include "rocket_gem.h"
>   
>   static int
>   rocket_open(struct drm_device *dev, struct drm_file *file)
> @@ -42,6 +44,8 @@ rocket_postclose(struct drm_device *dev, struct drm_file *file)
>   static const struct drm_ioctl_desc rocket_drm_driver_ioctls[] = {
>   #define ROCKET_IOCTL(n, func) \
>   	DRM_IOCTL_DEF_DRV(ROCKET_##n, rocket_ioctl_##func, 0)
> +
> +	ROCKET_IOCTL(CREATE_BO, create_bo),
>   };
>   
>   DEFINE_DRM_ACCEL_FOPS(rocket_accel_driver_fops);
> @@ -51,9 +55,10 @@ DEFINE_DRM_ACCEL_FOPS(rocket_accel_driver_fops);
>    * - 1.0 - initial interface
>    */
>   static const struct drm_driver rocket_drm_driver = {
> -	.driver_features	= DRIVER_COMPUTE_ACCEL,
> +	.driver_features	= DRIVER_COMPUTE_ACCEL | DRIVER_GEM,
>   	.open			= rocket_open,
>   	.postclose		= rocket_postclose,
> +	.gem_create_object	= rocket_gem_create_object,
>   	.ioctls			= rocket_drm_driver_ioctls,
>   	.num_ioctls		= ARRAY_SIZE(rocket_drm_driver_ioctls),
>   	.fops			= &rocket_accel_driver_fops,
> diff --git a/drivers/accel/rocket/rocket_gem.c b/drivers/accel/rocket/rocket_gem.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..d5337cf1e275c249a1491d0dd28e6b8ccd2ff2cb
> --- /dev/null
> +++ b/drivers/accel/rocket/rocket_gem.c
> @@ -0,0 +1,141 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Copyright 2024 Tomeu Vizoso <tomeu@tomeuvizoso.net> */
> +
> +#include <drm/drm_device.h>
> +#include <drm/drm_utils.h>
> +#include <drm/rocket_accel.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/iommu.h>
> +
> +#include "rocket_device.h"
> +#include "rocket_gem.h"
> +
> +static void rocket_gem_bo_free(struct drm_gem_object *obj)
> +{
> +	struct rocket_device *rdev = to_rocket_device(obj->dev);
> +	struct rocket_gem_object *bo = to_rocket_bo(obj);
> +	struct sg_table *sgt;
> +
> +	drm_WARN_ON(obj->dev, bo->base.pages_use_count > 1);
> +
> +	mutex_lock(&rdev->iommu_lock);
> +
> +	sgt = drm_gem_shmem_get_pages_sgt(&bo->base);
> +
> +	/* Unmap this object from the IOMMUs for cores > 0 */
> +	for (unsigned int core = 1; core < rdev->num_cores; core++) {
> +		struct iommu_domain *domain = iommu_get_domain_for_dev(rdev->cores[core].dev);
> +		size_t unmapped = iommu_unmap(domain, sgt->sgl->dma_address, bo->size);
> +
> +		drm_WARN_ON(obj->dev, unmapped != bo->size);
> +	}
> +
> +	/* This will unmap the pages from the IOMMU linked to core 0 */
> +	drm_gem_shmem_free(&bo->base);
> +
> +	mutex_unlock(&rdev->iommu_lock);
> +}
> +
> +static const struct drm_gem_object_funcs rocket_gem_funcs = {
> +	.free = rocket_gem_bo_free,
> +	.print_info = drm_gem_shmem_object_print_info,
> +	.pin = drm_gem_shmem_object_pin,
> +	.unpin = drm_gem_shmem_object_unpin,
> +	.get_sg_table = drm_gem_shmem_object_get_sg_table,
> +	.vmap = drm_gem_shmem_object_vmap,
> +	.vunmap = drm_gem_shmem_object_vunmap,
> +	.mmap = drm_gem_shmem_object_mmap,
> +	.vm_ops = &drm_gem_shmem_vm_ops,
> +};
> +
> +/**
> + * rocket_gem_create_object - Implementation of driver->gem_create_object.
> + * @dev: DRM device
> + * @size: Size in bytes of the memory the object will reference
> + *
> + * This lets the GEM helpers allocate object structs for us, and keep
> + * our BO stats correct.
> + */
> +struct drm_gem_object *rocket_gem_create_object(struct drm_device *dev, size_t size)
> +{
> +	struct rocket_gem_object *obj;
> +
> +	obj = kzalloc(sizeof(*obj), GFP_KERNEL);
> +	if (!obj)
> +		return ERR_PTR(-ENOMEM);
> +
> +	obj->base.base.funcs = &rocket_gem_funcs;
> +
> +	return &obj->base.base;
> +}
> +
> +int rocket_ioctl_create_bo(struct drm_device *dev, void *data, struct drm_file *file)
> +{
> +	struct drm_rocket_create_bo *args = data;
> +	struct rocket_device *rdev = to_rocket_device(dev);
> +	struct drm_gem_shmem_object *shmem_obj;
> +	struct rocket_gem_object *rkt_obj;
> +	struct drm_gem_object *gem_obj;
> +	struct sg_table *sgt;
> +	int ret;
> +
> +	shmem_obj = drm_gem_shmem_create(dev, args->size);
> +	if (IS_ERR(shmem_obj))
> +		return PTR_ERR(shmem_obj);
> +
> +	gem_obj = &shmem_obj->base;
> +	rkt_obj = to_rocket_bo(gem_obj);
> +
> +	rkt_obj->size = args->size;
> +	rkt_obj->offset = 0;
> +	mutex_init(&rkt_obj->mutex);
> +
> +	ret = drm_gem_handle_create(file, gem_obj, &args->handle);
> +	drm_gem_object_put(gem_obj);
> +	if (ret)
> +		goto err;
> +
> +	mutex_lock(&rdev->iommu_lock);
> +
> +	/* This will map the pages to the IOMMU linked to core 0 */
> +	sgt = drm_gem_shmem_get_pages_sgt(shmem_obj);
> +	if (IS_ERR(sgt)) {
> +		ret = PTR_ERR(sgt);
> +		goto err_unlock;
> +	}
> +
> +	/* Map the pages to the IOMMUs linked to the other cores, so all cores can access this BO */
> +	for (unsigned int core = 1; core < rdev->num_cores; core++) {
> +
> +		ret = iommu_map_sgtable(iommu_get_domain_for_dev(rdev->cores[core].dev),
> +					sgt->sgl->dma_address,
> +					sgt,
> +					IOMMU_READ | IOMMU_WRITE);
> +		if (ret < 0 || ret < args->size) {
> +			DRM_ERROR("failed to map buffer: size=%d request_size=%u\n",
> +				ret, args->size);
> +			ret = -ENOMEM;
> +			goto err_unlock;
> +		}
> +
> +		/* iommu_map_sgtable might have aligned the size */
> +		rkt_obj->size = ret;
> +
> +		dma_sync_sgtable_for_device(rdev->cores[core].dev, shmem_obj->sgt,
> +					    DMA_BIDIRECTIONAL);
> +	}
> +
> +	mutex_unlock(&rdev->iommu_lock);
> +
> +	args->offset = drm_vma_node_offset_addr(&gem_obj->vma_node);
> +	args->dma_address = sg_dma_address(shmem_obj->sgt->sgl);
> +
> +	return 0;
> +
> +err_unlock:
> +	mutex_unlock(&rdev->iommu_lock);
> +err:
> +	drm_gem_shmem_object_free(gem_obj);
> +
> +	return ret;
> +}
> diff --git a/drivers/accel/rocket/rocket_gem.h b/drivers/accel/rocket/rocket_gem.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..19b0cf91ddd99bd126c1af30beb169d6101f6dee
> --- /dev/null
> +++ b/drivers/accel/rocket/rocket_gem.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/* Copyright 2024 Tomeu Vizoso <tomeu@tomeuvizoso.net> */
> +
> +#ifndef __ROCKET_GEM_H__
> +#define __ROCKET_GEM_H__
> +
> +#include <drm/drm_gem_shmem_helper.h>
> +
> +struct rocket_gem_object {
> +	struct drm_gem_shmem_object base;
> +
> +	struct mutex mutex;

You init this mutex, but never destroy it.

I strongly recommend to scratch all per-object locks and use the 
object's reservation lock instead (found in base.resv), if possible. 
With multiple locks and dma-buf buffer sharing, there's otherwise 
endless fun from getting the locking order right.

> +	size_t size;
> +	u32 offset;
> +};
> +
> +struct drm_gem_object *rocket_gem_create_object(struct drm_device *dev, size_t size);
> +
> +int rocket_ioctl_create_bo(struct drm_device *dev, void *data, struct drm_file *file);
> +
> +static inline
> +struct  rocket_gem_object *to_rocket_bo(struct drm_gem_object *obj)
> +{
> +	return container_of(to_drm_gem_shmem_obj(obj), struct rocket_gem_object, base);
> +}
> +
> +#endif
> diff --git a/include/uapi/drm/rocket_accel.h b/include/uapi/drm/rocket_accel.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..8338726a83c31b954608ca505cf78bcd70d3494b
> --- /dev/null
> +++ b/include/uapi/drm/rocket_accel.h
> @@ -0,0 +1,43 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Tomeu Vizoso
> + */
> +#ifndef _ROCKET_DRM_H_
> +#define _ROCKET_DRM_H_

For UAPI headers, it makes sense to use a more verbose include guard; 
say __DRM_UAPI_ROCKET_ACCEL_H__. Avoids possible conflicts.

Best regards
Thomas

> +
> +#include "drm.h"
> +
> +#if defined(__cplusplus)
> +extern "C" {
> +#endif
> +
> +#define DRM_ROCKET_CREATE_BO			0x00
> +
> +#define DRM_IOCTL_ROCKET_CREATE_BO		DRM_IOWR(DRM_COMMAND_BASE + DRM_ROCKET_CREATE_BO, struct drm_rocket_create_bo)
> +
> +/**
> + * struct drm_rocket_create_bo - ioctl argument for creating Rocket BOs.
> + *
> + */
> +struct drm_rocket_create_bo {
> +	__u32 size;
> +
> +	/** Returned GEM handle for the BO. */
> +	__u32 handle;
> +
> +	/**
> +	 * Returned DMA address for the BO in the NPU address space.  This address
> +	 * is private to the DRM fd and is valid for the lifetime of the GEM
> +	 * handle.
> +	 */
> +	__u64 dma_address;
> +
> +	/** Offset into the drm node to use for subsequent mmap call. */
> +	__u64 offset;
> +};
> +
> +#if defined(__cplusplus)
> +}
> +#endif
> +
> +#endif /* _ROCKET_DRM_H_ */
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

