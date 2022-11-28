Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3BB63A690
	for <lists+dri-devel@lfdr.de>; Mon, 28 Nov 2022 12:04:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D48E510E1FB;
	Mon, 28 Nov 2022 11:04:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFEC710E1FB
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Nov 2022 11:04:38 +0000 (UTC)
Received: from fews2.riseup.net (fews2-pn.riseup.net [10.0.1.84])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx1.riseup.net (Postfix) with ESMTPS id 4NLN062s2qzDqyV;
 Mon, 28 Nov 2022 11:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1669633478; bh=6xiqaUlrv1tSJll8qg/RJX6Boig9Beo0/9kNabU4OSM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=c3cppmN+3X5nNrPyE+LCpsMWQQSaoSfdsZ1Pz3hKUANV9czK4ytFuPryGieHfIOVN
 u6vX+4ZTt7F1UQH2LjfBys1/JGuR8K+xWRDdPxM+/w8hbgEo4VuKNFQHT5lZQg24pB
 tAAhGIR6mEKu4CUOt6yl0VFI5+ejSvk8cUIsNLUQ=
X-Riseup-User-ID: 566FD997C52B76760B96E4AF4D864D5517B9B26331072C5A3076A25F48510275
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews2.riseup.net (Postfix) with ESMTPSA id 4NLN036TrMz1yBb;
 Mon, 28 Nov 2022 11:04:35 +0000 (UTC)
Message-ID: <47b35fa1-f7ac-1020-f689-4ee40a2331bf@riseup.net>
Date: Mon, 28 Nov 2022 08:04:32 -0300
MIME-Version: 1.0
Subject: Re: [PATCH 3/3] drm/tests: helpers: Add missing export
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter
 <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20221128081938.742410-1-maxime@cerno.tech>
 <20221128081938.742410-3-maxime@cerno.tech>
Content-Language: en-US
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>
In-Reply-To: <20221128081938.742410-3-maxime@cerno.tech>
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
Cc: kernel test robot <lkp@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/28/22 05:19, Maxime Ripard wrote:
> drm_kunit_device_init() is a public function meant to be used by other
> tests, but isn't exported. This leads to modpost errors when the other
> tests are compiled as module.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Maíra Canal <mairacanal@riseup.net>

Best Regards,
- Maíra Canal

> ---
>  drivers/gpu/drm/tests/drm_kunit_helpers.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.c b/drivers/gpu/drm/tests/drm_kunit_helpers.c
> index f1662091f250..8c738384a992 100644
> --- a/drivers/gpu/drm/tests/drm_kunit_helpers.c
> +++ b/drivers/gpu/drm/tests/drm_kunit_helpers.c
> @@ -66,6 +66,7 @@ struct drm_device *drm_kunit_device_init(struct kunit *test, u32 features, char
>  
>  	return drm;
>  }
> +EXPORT_SYMBOL(drm_kunit_device_init);
>  
>  MODULE_AUTHOR("Maxime Ripard <maxime@cerno.tech>");
>  MODULE_LICENSE("GPL");
