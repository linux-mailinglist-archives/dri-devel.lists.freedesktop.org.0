Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E52E962BB24
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 12:14:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A76B610E036;
	Wed, 16 Nov 2022 11:14:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 398F010E036
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Nov 2022 11:14:22 +0000 (UTC)
Received: from fews2.riseup.net (fews2-pn.riseup.net [10.0.1.84])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx1.riseup.net (Postfix) with ESMTPS id 4NC0ms3cSpzDqRT;
 Wed, 16 Nov 2022 11:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1668597261; bh=vk0axxqQTrF1tO5YofE3/xI12g02Z4XeJVTVx+YcOFc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Eszv166DhtLaR48Jj8LpiBndNZpvg7lg6AsdMGvBVm0qAR5/VhPWqZeCUeCNJ+XuR
 aci2+YRurROgpzA8d/mL5PYzx7SQAwjiDOmxvPpsA9AFa/woAkOpdur2ipXVW9/OjO
 tGtoL/t4CbuOxq3kH9uhb4IuzJ7Tv6BAI+/mNAsw=
X-Riseup-User-ID: 307C5BA79AC119B3F3F6B2E379C688F8CA03986E73185162A4F76236E267ADA1
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews2.riseup.net (Postfix) with ESMTPSA id 4NC0mp0r9Xz1yQc;
 Wed, 16 Nov 2022 11:14:17 +0000 (UTC)
Message-ID: <54002e06-0917-a3d1-d242-7a1f32305687@riseup.net>
Date: Wed, 16 Nov 2022 08:14:14 -0300
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] drm/tests: Include helpers header
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter
 <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Florian Fainelli <f.fainelli@gmail.com>
References: <20221116091712.1309651-1-maxime@cerno.tech>
Content-Language: en-US
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>
In-Reply-To: <20221116091712.1309651-1-maxime@cerno.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

On 11/16/22 06:17, Maxime Ripard wrote:
> The kunit helpers code weren't including its header, leading to a
> warning that no previous prototype had been defined for public
> functions.
> 
> Include the matching header to fix the warning.
> 
> Fixes: 44a3928324e9 ("drm/tests: Add Kunit Helpers")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Maíra Canal <mairacanal@riseup.net>

Best Regards,
- Maíra Canal

> ---
>  drivers/gpu/drm/tests/drm_kunit_helpers.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.c b/drivers/gpu/drm/tests/drm_kunit_helpers.c
> index d3f0d681b685..dbd8ec24d4be 100644
> --- a/drivers/gpu/drm/tests/drm_kunit_helpers.c
> +++ b/drivers/gpu/drm/tests/drm_kunit_helpers.c
> @@ -5,6 +5,8 @@
>  
>  #include <linux/device.h>
>  
> +#include "drm_kunit_helpers.h"
> +
>  struct kunit_dev {
>  	struct drm_device base;
>  };
