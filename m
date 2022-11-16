Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC3062BB4E
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 12:18:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F2D610E467;
	Wed, 16 Nov 2022 11:18:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4728B10E467
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Nov 2022 11:18:33 +0000 (UTC)
Received: from fews2.riseup.net (fews2-pn.riseup.net [10.0.1.84])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx0.riseup.net (Postfix) with ESMTPS id 4NC0sh4p4Nz9sdn;
 Wed, 16 Nov 2022 11:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1668597512; bh=MwqhmvWUIZbMaIFu7EebMTh7nBb5lkP0mJF8H4xgiCs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=fJTrqfBvJkak7spjRSThmAqAm0smw2P8A7RUXRZ9hOE4ZlrNRg0f97GYHjORurHeW
 xhxqRFLLgtUHEKCXLNv6lyWnYWrYsUSiV8FsVR+I0cgzoz2TxIEUa5dSMiEhxNS9qd
 qJzkhVERl6ibwglgIkJOczArZByBvkZ18PiP91Ls=
X-Riseup-User-ID: 945EF7B1DB2E78756298C4BD0CE86F5EFD519CE07EC1B0F819DE43D46366C153
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews2.riseup.net (Postfix) with ESMTPSA id 4NC0sd0ZR8z1yQc;
 Wed, 16 Nov 2022 11:18:28 +0000 (UTC)
Message-ID: <6dba9207-5ba2-5c73-e575-a7a86a2b9520@riseup.net>
Date: Wed, 16 Nov 2022 08:18:27 -0300
MIME-Version: 1.0
Subject: Re: [PATCH 2/3] drm/tests: helpers: Add module infos
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter
 <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Florian Fainelli <f.fainelli@gmail.com>
References: <20221116091712.1309651-1-maxime@cerno.tech>
 <20221116091712.1309651-2-maxime@cerno.tech>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>
In-Reply-To: <20221116091712.1309651-2-maxime@cerno.tech>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

On 11/16/22 06:17, Maxime Ripard wrote:
> The MODULE_LICENSE macro is missing from the kunit helpers file, thus
> leading to a build error.
> 
> Let's introduce it along with MODULE_AUTHOR.
> 
> Fixes: 44a3928324e9 ("drm/tests: Add Kunit Helpers")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

It would be nice to add the SPDX-License-Identifier tag in the source
file as well. Besides that,

Reviewed-by: Maíra Canal <mairacanal@riseup.net>

Best Regards,
- Maíra Canal

> ---
>  drivers/gpu/drm/tests/drm_kunit_helpers.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.c b/drivers/gpu/drm/tests/drm_kunit_helpers.c
> index dbd8ec24d4be..eea450de7de8 100644
> --- a/drivers/gpu/drm/tests/drm_kunit_helpers.c
> +++ b/drivers/gpu/drm/tests/drm_kunit_helpers.c
> @@ -64,3 +64,6 @@ struct drm_device *drm_kunit_device_init(struct kunit *test, u32 features, char
>  
>  	return drm;
>  }
> +
> +MODULE_AUTHOR("Maxime Ripard <maxime@cerno.tech>");
> +MODULE_LICENSE("GPL");
