Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBFF49CCD4
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 15:55:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 875CD10E5B8;
	Wed, 26 Jan 2022 14:55:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0419410E5B8;
 Wed, 26 Jan 2022 14:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643208905; x=1674744905;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=jDvucM57raXXyltv9f1DseZIWOhw7nhoMtqYmn0jkVg=;
 b=eI+vquZdwNHwu/qrZ93HeHdR0/btJnNvjg8D7ZNnm7hgNX/OKGQkcGhR
 ibSJZGgVW2WQqjsd1+rLMLYlaoHkGyAlH298/eAO5llrQ2hf1wD06LC5u
 PCd5/5eKeRHsNHlXAI+WEOFxTpAgg8s7lZwOQMTqOuuTtRvIpa3lkk2To
 WP5qZWUQwk6KhMj2ITvSIACq670hMyc0Y4lv+XetTJKkVh8rvsya1Vw8G
 HogEm6lP+i7IcnfOAHy25BcmEAcUS6opCZ9Ie+XK3uWYTmZChrW2K+/a/
 fswb/efmVL2JqjR47HGykLImOiOGfgMD3a9qVvqSfQpeLso+6zaRxB1kI g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="246509793"
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; d="scan'208";a="246509793"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 06:55:03 -0800
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; d="scan'208";a="520821791"
Received: from nbasu-mobl.ger.corp.intel.com (HELO localhost) ([10.252.16.197])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 06:54:49 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-security-module@vger.kernel.org, nouveau@lists.freedesktop.org,
 netdev@vger.kernel.org
Subject: Re: [PATCH v2 08/11] drm/gem: Sort includes alphabetically
In-Reply-To: <20220126093951.1470898-9-lucas.demarchi@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220126093951.1470898-1-lucas.demarchi@intel.com>
 <20220126093951.1470898-9-lucas.demarchi@intel.com>
Date: Wed, 26 Jan 2022 16:54:46 +0200
Message-ID: <871r0uzgw9.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Chris Wilson <chris@chris-wilson.co.uk>, Vishal Kulkarni <vishal@chelsio.com>,
 Francis Laniel <laniel_francis@privacyrequired.com>,
 Kentaro Takeda <takedakn@nttdata.co.jp>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Ben Skeggs <bskeggs@redhat.com>,
 Jakub Kicinski <kuba@kernel.org>, Petr Mladek <pmladek@suse.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Leo Li <sunpeng.li@amd.com>,
 Steven Rostedt <rostedt@goodmis.org>, Julia Lawall <julia.lawall@lip6.fr>,
 Rahul Lakkireddy <rahul.lakkireddy@chelsio.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Raju Rangoju <rajur@chelsio.com>, Alex Deucher <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, "David
 S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 26 Jan 2022, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> Sort includes alphabetically so it's easier to add/remove includes and
> know when that is needed.
>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/drm_gem.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 4dcdec6487bb..21631c22b374 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -25,20 +25,20 @@
>   *
>   */
>  
> -#include <linux/types.h>
> -#include <linux/slab.h>
> -#include <linux/mm.h>
> -#include <linux/uaccess.h>
> -#include <linux/fs.h>
> +#include <linux/dma-buf-map.h>
> +#include <linux/dma-buf.h>
>  #include <linux/file.h>
> -#include <linux/module.h>
> +#include <linux/fs.h>
> +#include <linux/mem_encrypt.h>
> +#include <linux/mm.h>
>  #include <linux/mman.h>
> +#include <linux/module.h>
>  #include <linux/pagemap.h>
> -#include <linux/shmem_fs.h>
> -#include <linux/dma-buf.h>
> -#include <linux/dma-buf-map.h>
> -#include <linux/mem_encrypt.h>
>  #include <linux/pagevec.h>
> +#include <linux/shmem_fs.h>
> +#include <linux/slab.h>
> +#include <linux/types.h>
> +#include <linux/uaccess.h>
>  
>  #include <drm/drm.h>
>  #include <drm/drm_device.h>

-- 
Jani Nikula, Intel Open Source Graphics Center
