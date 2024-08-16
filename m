Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC1D9543FA
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2024 10:23:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64F2610E5D5;
	Fri, 16 Aug 2024 08:22:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VQf5FBp6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3869410E5D4;
 Fri, 16 Aug 2024 08:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723796577; x=1755332577;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=iA501M7x+eWGO79y2wUFKc/3KW9ojoAR3YIL1ztKzAg=;
 b=VQf5FBp6djenJ1q253fuiiU9K8wz37XV4V0+EdVV64uT9oMhDBaExvIZ
 uN/daf/44fmPBAczrH5/5sJE4oa+23vW4hn35ZLwl4D1rXfZ+jX7wRcJG
 ZEb8B+z5dbjlkeHsrb4HGkEWeCyOhgViLapJsHA1MDR/XrToYFouca5tZ
 e+rRbFxreV019ACPtSKTsON9e87rWUiKCINd6ysRP0u8NpgauPBqxlkzW
 VeUjnYTN0xE23Zl+VgOryiuaKNWTj/nUwrNj4OxJBkOIfUBKG1n1KTbTd
 asqo1nRhQVTgzy3j436MqqxAKFGH9tAOQ6p2THpaHpNnhn3wVr1s3br4y g==;
X-CSE-ConnectionGUID: gh77nbhRQye9Le2LsFFjhw==
X-CSE-MsgGUID: YnTtKqdfTqutHXLS0JSPww==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="44604625"
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; d="scan'208";a="44604625"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 01:20:55 -0700
X-CSE-ConnectionGUID: sLafJmHSRjeeMCmdU6MbFA==
X-CSE-MsgGUID: UimII1aUQFqEa6SZkW0ZhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; d="scan'208";a="59770547"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.213])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 01:20:52 -0700
Date: Fri, 16 Aug 2024 10:20:48 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>
Subject: Re: [PATCH] drm/i915/gem: Remove unnecessary cast
Message-ID: <Zr8L4BqjFn67UoLl@ashyti-mobl2.lan>
References: <20240814175947.169590-1-andi.shyti@linux.intel.com>
 <Zr5P0XW6sPGwKCrG@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zr5P0XW6sPGwKCrG@intel.com>
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

Hi Rodrigo,

On Thu, Aug 15, 2024 at 02:58:25PM -0400, Rodrigo Vivi wrote:
> On Wed, Aug 14, 2024 at 07:59:47PM +0200, Andi Shyti wrote:
> > The cast from "long" to "unsigned long" is unnecessary. Remove
> > it.
> 
> I don't believe we can be that bold in this statement.
> Some static analyzer tools might not agree and tell that
> if the start or end are negative values we could have
> undefined behavior.

Right, but we do check for negative values before. If we reach
this point I'm sure this is positive and I'm also sure that a
positive long fits into an unsigned long.

Maybe I should have been clearer in the commit log.

> > In this case, the variables "start" and "end" are of type long
> > because they need to account for the possibility of negative
> > values. However, they are subsequently moved to "unsigned long"
> > since addresses are typically handled as unsigned values.
> 
> right, but the static analyzer tools won't agree and complain
> and people will start try to add this back.
> 
> Do we really need this patch?

It's a cleanup, like removing trailing spaces, none of them is
really needed :-)

Trivial removals of unnecessary casts are normally done around
the kernel, but, of course we can drop this patch.

Thanks,
Andi
