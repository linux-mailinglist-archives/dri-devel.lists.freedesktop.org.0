Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 538C862C54D
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 17:48:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 597D410E4DF;
	Wed, 16 Nov 2022 16:48:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA6F010E4DF
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Nov 2022 16:48:18 +0000 (UTC)
Received: from fews2.riseup.net (fews2-pn.riseup.net [10.0.1.84])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx1.riseup.net (Postfix) with ESMTPS id 4NC8BB2LLszDqVJ;
 Wed, 16 Nov 2022 16:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1668617298; bh=B2gj/mtLbAEs+wMTUEoPsk1SOGhrXqiKrFf2tY9G1Nk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=quDFA7wZaZxU0Dj8HZrd0AxPHx4Camj2DTFB6gk6xNFubLLmsojrh2UOaYt3qRHVU
 TU9y2wQ9zTvrDCHqplyGNxjaOQNGiOjp9QKZXvPdrwtlSkzOQeC/4gTFATFSu0GM9k
 XBn8A7cF4Z7T5snnV12MOQLvQQUXNnVOr5WnaZN0=
X-Riseup-User-ID: 273C614766DCE3B6F3DC51B6FFF5FCEDFC197179E029476DC96221D2C6CFA9B2
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews2.riseup.net (Postfix) with ESMTPSA id 4NC8B74W6vz1yQ0;
 Wed, 16 Nov 2022 16:48:15 +0000 (UTC)
Message-ID: <60f8860b-8a95-9c91-fcea-1b98b1b6c941@riseup.net>
Date: Wed, 16 Nov 2022 13:48:13 -0300
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] drm/tests: helpers: Add SPDX header
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter
 <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20221116151833.1679379-1-maxime@cerno.tech>
 <20221116151833.1679379-2-maxime@cerno.tech>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>
In-Reply-To: <20221116151833.1679379-2-maxime@cerno.tech>
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
Cc: =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

On 11/16/22 12:18, Maxime Ripard wrote:
> The SPDX header is missing, let's add it and fix the corresponding
> checkpatch warning.
> 
> Suggested-by: Maíra Canal <mairacanal@riseup.net>
> Fixes: 44a3928324e9 ("drm/tests: Add Kunit Helpers")
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Could you add the SPDX-License-Identifier tag on the header file as
well? With the SPDX header on both files, this is:

Reviewed-by: Maíra Canal <mairacanal@riseup.net>

Best Regards,
- Maíra Canal

> ---
>  drivers/gpu/drm/tests/drm_kunit_helpers.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.c b/drivers/gpu/drm/tests/drm_kunit_helpers.c
> index eea450de7de8..f1662091f250 100644
> --- a/drivers/gpu/drm/tests/drm_kunit_helpers.c
> +++ b/drivers/gpu/drm/tests/drm_kunit_helpers.c
> @@ -1,3 +1,5 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
>  #include <drm/drm_drv.h>
>  #include <drm/drm_managed.h>
>  
