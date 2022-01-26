Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2933649C96A
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 13:16:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5AB410E8FF;
	Wed, 26 Jan 2022 12:16:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA84E10E8F7;
 Wed, 26 Jan 2022 12:16:26 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="246755646"
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; d="scan'208";a="246755646"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 04:16:26 -0800
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; d="scan'208";a="674341619"
Received: from smile.fi.intel.com ([10.237.72.61])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 04:16:19 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andy.shevchenko@gmail.com>) id 1nChCh-00Eaiw-DB;
 Wed, 26 Jan 2022 14:15:11 +0200
Date: Wed, 26 Jan 2022 14:15:11 +0200
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [Intel-gfx] [PATCH v2 09/11] drm: Convert open-coded yes/no
 strings to yesno()
Message-ID: <YfE7T7gl+0GrlFt/@smile.fi.intel.com>
References: <20220126093951.1470898-1-lucas.demarchi@intel.com>
 <20220126093951.1470898-10-lucas.demarchi@intel.com>
 <CAHp75Vd+TmShx==d_JHZUu0Q-9X7CmZEOFdKnSrcRKs81Gxn3g@mail.gmail.com>
 <20220126104345.r6libof7z7tqjqxi@ldmartin-desk2>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220126104345.r6libof7z7tqjqxi@ldmartin-desk2>
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
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Vishal Kulkarni <vishal@chelsio.com>, netdev@vger.kernel.org,
 Francis Laniel <laniel_francis@privacyrequired.com>,
 Kentaro Takeda <takedakn@nttdata.co.jp>, amd-gfx@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Petr Mladek <pmladek@suse.com>, Leo Li <sunpeng.li@amd.com>,
 intel-gfx@lists.freedesktop.org, Steven Rostedt <rostedt@goodmis.org>,
 Julia Lawall <julia.lawall@lip6.fr>,
 Rahul Lakkireddy <rahul.lakkireddy@chelsio.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 linux-security-module@vger.kernel.org,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Raju Rangoju <rajur@chelsio.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 26, 2022 at 02:43:45AM -0800, Lucas De Marchi wrote:
> On Wed, Jan 26, 2022 at 12:12:50PM +0200, Andy Shevchenko wrote:
> > On Wed, Jan 26, 2022 at 11:39 AM Lucas De Marchi
> > <lucas.demarchi@intel.com> wrote:

...

> > >  411986   10490    6176  428652   68a6c drm.ko.old
> > >  411986   10490    6176  428652   68a6c drm.ko
> > >   98129    1636     264  100029   186bd dp/drm_dp_helper.ko.old
> > >   98129    1636     264  100029   186bd dp/drm_dp_helper.ko
> > > 1973432  109640    2352 2085424  1fd230 nouveau/nouveau.ko.old
> > > 1973432  109640    2352 2085424  1fd230 nouveau/nouveau.ko
> > 
> > This probably won't change for modules, but if you compile in the
> > linker may try to optimize it. Would be nice to see the old-new for
> > `make allyesconfig` or equivalent.
> 
> just like it would already do, no? I can try and see what happens, but
> my feeling is that we won't have any change.

Maybe not or maybe a small win. Depends how compiler puts / linker sees
that in two cases. (Yeah, likely it should be no differences if all
instances are already caught by linker)

-- 
With Best Regards,
Andy Shevchenko


