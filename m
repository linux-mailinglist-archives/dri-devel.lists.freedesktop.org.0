Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06218494109
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 20:39:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 995B110F0EB;
	Wed, 19 Jan 2022 19:39:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DC8010F0E7;
 Wed, 19 Jan 2022 19:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642621166; x=1674157166;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=wjoA2KAzAua/sWhboAdUBsDnQlEM3jScHHUyibF2GDY=;
 b=E6LgJ4O5rqnQTIUVs6sXJ8UPWaAY7I6DLgOlTrTB0Mj93am0sW72WfCD
 dr1qiOMKl7LR4vnA9Q56T3EQ/I2FXBp9bZkxzQdbrUDEIjd9x7XLXr0tC
 jCoiz+iTo5hz8cayfAPBuMcCV1t3Iv77RydBWxi+6SbuAefZ4nxVKelsH
 JgFBiLFcK610wWyqnKKtRj008SVG5blYmkevK/XNwhX3OfFjFr5tvhz77
 yFUnIhvLvpqeOcINRuD/8QS0FzgERfO9uWCFyCCQz6BGHMBSUG1+tEeur
 GWQMB0eI04/yDv5Z56IPAskouU9t/a9SaPipWNlDwMzBxyE3ZG064HOua w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10231"; a="225846458"
X-IronPort-AV: E=Sophos;i="5.88,300,1635231600"; d="scan'208";a="225846458"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2022 11:32:06 -0800
X-IronPort-AV: E=Sophos;i="5.88,300,1635231600"; d="scan'208";a="672288940"
Received: from smile.fi.intel.com ([10.237.72.61])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2022 11:31:58 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nAGfP-00CEep-7a; Wed, 19 Jan 2022 21:30:47 +0200
Date: Wed, 19 Jan 2022 21:30:47 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH 3/3] drm: Convert open yes/no strings to yesno()
Message-ID: <Yehm5/DJ5Ljo1EWs@smile.fi.intel.com>
References: <20220119072450.2890107-1-lucas.demarchi@intel.com>
 <20220119072450.2890107-4-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220119072450.2890107-4-lucas.demarchi@intel.com>
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
 Vishal Kulkarni <vishal@chelsio.com>,
 Francis Laniel <laniel_francis@privacyrequired.com>,
 Kentaro Takeda <takedakn@nttdata.co.jp>, amd-gfx@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Petr Mladek <pmladek@suse.com>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Leo Li <sunpeng.li@amd.com>, intel-gfx@lists.freedesktop.org,
 Raju Rangoju <rajur@chelsio.com>, Julia Lawall <julia.lawall@lip6.fr>,
 Rahul Lakkireddy <rahul.lakkireddy@chelsio.com>,
 Steven Rostedt <rostedt@goodmis.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mikita Lipski <mikita.lipski@amd.com>, Eryk Brol <eryk.brol@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 linux-security-module@vger.kernel.org, netdev@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S . Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 18, 2022 at 11:24:50PM -0800, Lucas De Marchi wrote:
> linux/string_helpers.h provides a helper to return "yes"/"no"
> strings. Replace the open coded versions with yesno(). The places were
> identified with the following semantic patch:
> 
> 	@@
> 	expression b;
> 	@@
> 
> 	- b ? "yes" : "no"
> 	+ yesno(b)
> 
> Then the includes were added, so we include-what-we-use, and parenthesis
> adjusted in drivers/gpu/drm/v3d/v3d_debugfs.c. After the conversion we
> still see the same binary sizes:
> 
>    text    data     bss     dec     hex filename
> 1442171   60344     800 1503315  16f053 ./drivers/gpu/drm/radeon/radeon.ko
> 1442171   60344     800 1503315  16f053 ./drivers/gpu/drm/radeon/radeon.ko.old
> 5985991  324439   33808 6344238  60ce2e ./drivers/gpu/drm/amd/amdgpu/amdgpu.ko
> 5985991  324439   33808 6344238  60ce2e ./drivers/gpu/drm/amd/amdgpu/amdgpu.ko.old
>  411986   10490    6176  428652   68a6c ./drivers/gpu/drm/drm.ko
>  411986   10490    6176  428652   68a6c ./drivers/gpu/drm/drm.ko.old
> 1970292  109515    2352 2082159  1fc56f ./drivers/gpu/drm/nouveau/nouveau.ko
> 1970292  109515    2352 2082159  1fc56f ./drivers/gpu/drm/nouveau/nouveau.ko.old

...

>  #include <linux/module.h>
>  #include <linux/sched.h>
>  #include <linux/slab.h>
> +#include <linux/string_helpers.h>

+ blank line?

> +#include <linux/string_helpers.h>

...

>  	seq_printf(m, "\tDP branch device present: %s\n",
> -		   branch_device ? "yes" : "no");
> +		   yesno(branch_device));

Now it's possible to keep this on one line.

...

>  	drm_printf_indent(p, indent, "imported=%s\n",
> -			  obj->import_attach ? "yes" : "no");
> +			  yesno(obj->import_attach));

81 here, but anyway, ditto!

...

>   */

+blank line here?

> +#include <linux/string_helpers.h>
> +
>  #include "aux.h"
>  #include "pad.h"

...

>  	seq_printf(m, "MMU:        %s\n",
> -		   (ident2 & V3D_HUB_IDENT2_WITH_MMU) ? "yes" : "no");
> +		   yesno(ident2 & V3D_HUB_IDENT2_WITH_MMU));
>  	seq_printf(m, "TFU:        %s\n",
> -		   (ident1 & V3D_HUB_IDENT1_WITH_TFU) ? "yes" : "no");
> +		   yesno(ident1 & V3D_HUB_IDENT1_WITH_TFU));
>  	seq_printf(m, "TSY:        %s\n",
> -		   (ident1 & V3D_HUB_IDENT1_WITH_TSY) ? "yes" : "no");
> +		   yesno(ident1 & V3D_HUB_IDENT1_WITH_TSY));
>  	seq_printf(m, "MSO:        %s\n",
> -		   (ident1 & V3D_HUB_IDENT1_WITH_MSO) ? "yes" : "no");
> +		   yesno(ident1 & V3D_HUB_IDENT1_WITH_MSO));
>  	seq_printf(m, "L3C:        %s (%dkb)\n",
> -		   (ident1 & V3D_HUB_IDENT1_WITH_L3C) ? "yes" : "no",
> +		   yesno(ident1 & V3D_HUB_IDENT1_WITH_L3C),
>  		   V3D_GET_FIELD(ident2, V3D_HUB_IDENT2_L3C_NKB));

I believe it's fine to join back to have less LOCs (yes, it will be 83 or so,
but I believe in these cases it's very much okay).

-- 
With Best Regards,
Andy Shevchenko


