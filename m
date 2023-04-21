Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2296EAD71
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 16:51:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DF6910E0F9;
	Fri, 21 Apr 2023 14:51:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FA8C10E0F9;
 Fri, 21 Apr 2023 14:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682088687; x=1713624687;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=n2wZLR1wie0ieDr0G/BlX3Zu/5MW4wugHGr/DRcWOOA=;
 b=Lt1Wk9XiXBBzKvd6Ih46h8lfEm923+eO/8LqhbgE8eH4NBYP9YDUlbRD
 a10HrWdqB4wliKpeW47m1R4ie8nNjKeBzGHo3sUfHRETprkDVFxJHT/r3
 rXM8Xa4jTA2IvapGiXGzUKKk/lughJqKSjl+2+PNeiu0er0mXLuwU+t56
 a74WRcrDq1uCzODXUBRYUhu6AUdXfRMHQAcKdSQyVUPYK2f7rczGf2IrA
 cadKGOT9GqeID9cQ/dgmW11ckT+f72po3OdDvSwSU3vbTgllkaQAd08Rz
 qxBu1vW0QTvSoha7vWXdPEsHiN0ifIOEUNqbk5gb8zliG/AqubKb1KrXD w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="346025096"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="346025096"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 07:51:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="1021954791"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="1021954791"
Received: from abaldovi-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.57.154])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 07:51:23 -0700
Date: Fri, 21 Apr 2023 16:51:20 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@kernel.org>
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/i915/i915_drv: Use i915 instead of
 dev_priv insied the file_priv structure
Message-ID: <ZEKi6HrrVaOSVUv1@ashyti-mobl2.lan>
References: <20230421134654.273182-1-andi.shyti@linux.intel.com>
 <20230421134654.273182-3-andi.shyti@linux.intel.com>
 <ZEKYoMMtYRkngiIz@rdvivi-mobl4>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZEKYoMMtYRkngiIz@rdvivi-mobl4>
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
Cc: Intel GFX <intel-gfx@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 DRI Devel <dri-devel@lists.freedesktop.org>,
 Andi Shyti <andi.shyti@linux.intel.com>, Andi Shyti <andi.shyti@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 21, 2023 at 10:07:28AM -0400, Rodrigo Vivi wrote:
> On Fri, Apr 21, 2023 at 03:46:54PM +0200, Andi Shyti wrote:
> > In the process of renaming all instances of 'dev_priv' to 'i915',
> > start using 'i915' within the 'drm_i915_file_private' structure.
> 
> The patch looks good but the commit message seems off to me...

Will rephrase.

> One thing we need to take care with mass conversions of dev_priv
> to i915 is to ensure we are not converting the implicit declarations,
> since we want to kill that. But on a quick glance it looks fine.
> 
> Did you generated this with full s/dev_priv/i915 in i915_drv.h?

Yes, I did such swap in i915_drv.h but I checked each line not to
break anything.  In this file it's OK to do a /dev_priv/i915/
change.

It will be different with i915_irq.h where dev_priv is embedded
in the define.

I there is anything off it wouldn't have compiled and anyway,
CI will warn.

Thanks, Rodrigo!
Andi
