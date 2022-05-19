Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E37952DE18
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 22:09:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41AC910E545;
	Thu, 19 May 2022 20:09:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D40A10E545
 for <dri-devel@lists.freedesktop.org>; Thu, 19 May 2022 20:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652990974; x=1684526974;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=IDoXax/th/czTvvvNqgEoZ9RHXqUd3i3Aslf+3U5d4g=;
 b=VIaqdnqkdjPXqsMpZ4mcufY0Gd5gvWnzC5gYqmxpoaDwkv7eVYwARkFM
 DOIeCIFqpU7Ly8BEANNeP/tm/34VJaijdQct+NvnXmZoBXRkOYJQh6s6P
 nX9dSCv1gfy5VU2M91knXm0OW9lOBRprP9UvKD6XrahyfaUGwbVlVOnBL
 99imdASXtiGtsWoYAyjC53rNk0ccUqOqXy4Nox4dbd2x6/YmbmrbmHStn
 5VRapJMkTb3ooPcK9xkQt5jYIfNMA99ZoO9KoQty6gjXC3KlNbITwRgtV
 vjrJGT5fEiP4nZU/5ZOBnvYZNyv/an9COgjEqdrbLb4Tygz073/jdk6jk w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10352"; a="332982454"
X-IronPort-AV: E=Sophos;i="5.91,238,1647327600"; d="scan'208";a="332982454"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2022 13:09:32 -0700
X-IronPort-AV: E=Sophos;i="5.91,238,1647327600"; d="scan'208";a="524265158"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2022 13:09:29 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nrmSb-000GDJ-Sk; Thu, 19 May 2022 23:09:25 +0300
Date: Thu, 19 May 2022 23:09:25 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Uri Arev <me@wantyapps.xyz>
Subject: Re: [PATCH] staging: fbtft: fix checkpatch.pl struct should normally
 be const
Message-ID: <Yoaj9baQHs9gZpz5@smile.fi.intel.com>
References: <20220519172503.10821-1-me@wantyapps.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220519172503.10821-1-me@wantyapps.xyz>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: Srivathsa Dara <srivathsa729.8@gmail.com>, linux-fbdev@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 Len Baker <len.baker@gmx.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 19, 2022 at 08:25:01PM +0300, Uri Arev wrote:
> This simple patch fixes a checkpatch.pl warning in `fbtft/fbtft-core.c`.
> 
> Reported by Checkpatch:
> WARNING: struct fb_ops should normally be const

...

> -	fbops = devm_kzalloc(dev, sizeof(struct fb_ops), GFP_KERNEL);
> +	const fbops = devm_kzalloc(dev, sizeof(struct fb_ops), GFP_KERNEL);

Why?

-- 
With Best Regards,
Andy Shevchenko


