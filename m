Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E47734F09
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 11:05:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4083E10E1C5;
	Mon, 19 Jun 2023 09:04:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E52510E1D1;
 Mon, 19 Jun 2023 09:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687165496; x=1718701496;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Uv2EpNdqJwxaFNuIj4uRVkuHXE/wlrHTHfQ2/9uDTjk=;
 b=m6O6CtaeZbAAw544Cf88OUt+jUfhbLgpNg+nUY0wF1inqDYlZcC6pHD+
 GXBcUcON4eC3D/lv7C6QXFhx9mT4JP9tBMdljd2xXpEYjO6hUsBcNarjP
 TTsQlI7aZfeoURzRC/9+QllXisgCAMGHjE4AHihK2EMQ4c09esnWZwV44
 Q5e45fytGMJlpVhU4CXZ3DL4Y7Zw1ZXEXPboEqb0rBjJv4xGuVhaaGFRn
 Fi6KN8OUXyzyuhwQk1/zv/6EFXbVZB/FM3vVzerdmxhUS5f8KFf6VqMFR
 zQW5PO3E4u5zMcrgtOAPnopjB9WP/SCSgyqZe6MzLObZC70bKvX6hOhW+ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="357069851"
X-IronPort-AV: E=Sophos;i="6.00,254,1681196400"; d="scan'208";a="357069851"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2023 02:04:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="803551712"
X-IronPort-AV: E=Sophos;i="6.00,254,1681196400"; d="scan'208";a="803551712"
Received: from baparham-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.249.45.169])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2023 02:04:50 -0700
Date: Mon, 19 Jun 2023 11:04:47 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH] drm/i915: make i915_drm_client_fdinfo() reference
 conditional again
Message-ID: <ZJAaL/MJp6gBbgdt@ashyti-mobl2.lan>
References: <20230616093158.3568480-1-arnd@kernel.org>
 <ZIw2kdx9+DCmUZUV@ashyti-mobl2.lan>
 <ef849277-10ef-90db-fd6c-3646599e32ba@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef849277-10ef-90db-fd6c-3646599e32ba@linux.intel.com>
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
Cc: Arnd Bergmann <arnd@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, linux-kernel@vger.kernel.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tvrtko,

On Fri, Jun 16, 2023 at 12:17:50PM +0100, Tvrtko Ursulin wrote:
> 
> On 16/06/2023 11:16, Andi Shyti wrote:
> > Hi Arnd,
> > 
> > On Fri, Jun 16, 2023 at 11:31:47AM +0200, Arnd Bergmann wrote:
> > > From: Arnd Bergmann <arnd@arndb.de>
> > > 
> > > The function is only defined if CONFIG_PROC_FS is enabled:
> > > 
> > > ld.lld: error: undefined symbol: i915_drm_client_fdinfo
> > > > > > referenced by i915_driver.c
> > > > > >                drivers/gpu/drm/i915/i915_driver.o:(i915_drm_driver) in archive vmlinux.a
> > > 
> > > Use the PTR_IF() helper to make the reference NULL otherwise.
> > > 
> > > Fixes: e894b724c316d ("drm/i915: Use the fdinfo helper")
> > > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > > ---
> > >   drivers/gpu/drm/i915/i915_driver.c     | 2 +-
> > >   drivers/gpu/drm/i915/i915_drm_client.h | 2 --
> > >   2 files changed, 1 insertion(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
> > > index 75cbc43b326dd..0ad0c5885ec27 100644
> > > --- a/drivers/gpu/drm/i915/i915_driver.c
> > > +++ b/drivers/gpu/drm/i915/i915_driver.c
> > > @@ -1816,7 +1816,7 @@ static const struct drm_driver i915_drm_driver = {
> > >   	.open = i915_driver_open,
> > >   	.lastclose = i915_driver_lastclose,
> > >   	.postclose = i915_driver_postclose,
> > > -	.show_fdinfo = i915_drm_client_fdinfo,
> > > +	.show_fdinfo = PTR_IF(IS_ENABLED(CONFIG_PROC_FS), i915_drm_client_fdinfo),
> > >   	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
> > >   	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
> > > diff --git a/drivers/gpu/drm/i915/i915_drm_client.h b/drivers/gpu/drm/i915/i915_drm_client.h
> > > index 4c18b99e10a4e..67816c912bca1 100644
> > > --- a/drivers/gpu/drm/i915/i915_drm_client.h
> > > +++ b/drivers/gpu/drm/i915/i915_drm_client.h
> > > @@ -47,8 +47,6 @@ static inline void i915_drm_client_put(struct i915_drm_client *client)
> > >   struct i915_drm_client *i915_drm_client_alloc(void);
> > > -#ifdef CONFIG_PROC_FS
> > >   void i915_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file);
> > > -#endif
> > 
> > nice! This is becoming the new trend now.
> > 
> > Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> 
> Thanks for the fix and review! (And I got to learn about existence of PTR_IF
> too.)
> 
> Andi will you merge once green or should I?

will do! Thanks!

Andi

> Regards,
> 
> Tvrtko
