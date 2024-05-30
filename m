Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D91F98D5233
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 21:19:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0823310E11E;
	Thu, 30 May 2024 19:19:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i+c7aIZ7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDA8910E11E
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 19:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717096789; x=1748632789;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=sp3+UKyu7QZRBKVkZbrdlt6UzICleSS/gZ25TAZe1eY=;
 b=i+c7aIZ7v+II/KyZgf9dnaQlfWhydFbjP27ArpVHUiWiS1t+wnlY2YcQ
 tF6mojyzOMGSa8A3ZW4VGtgKTSDbD0UiEkttmqehu+bf2nKKhFrEhJBG4
 gzdau0uczVextRjbhF/2l61WzqBc4nd6yBYc9dFIieEubdlmGWhChp7BN
 PxMW/Gkr6VkkL63crn0Du4M010Zk6i23/c6fndFoAjO8seosj7skgOrTW
 Xx6x8hJvRlZ6HndEra/Sp6xMa34rFMsa0OWKO+ugEMdl5vgWpuzmhAuSs
 slDe6/UXgkBksivMo0kMBejqp9csoBySvL4NWNZdCN7Spz8d+cBJ+hHv/ Q==;
X-CSE-ConnectionGUID: Ndm7vSjfQ9Oon6sGrmJIUg==
X-CSE-MsgGUID: QUkgo3fWQ+efLW1JjIbJ+A==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="31140611"
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; d="scan'208";a="31140611"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 12:19:48 -0700
X-CSE-ConnectionGUID: dlisauIEQ164ZcDr/2yrog==
X-CSE-MsgGUID: 03UwKfwDRxyNWOAbeKQYZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; d="scan'208";a="40826362"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 12:19:42 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1sClJJ-0000000CHRR-2XT4; Thu, 30 May 2024 22:19:37 +0300
Date: Thu, 30 May 2024 22:19:37 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Devarsh Thakkar <devarsht@ti.com>
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.gaignard@collabora.com, sebastian.fricke@collabora.com,
 akpm@linux-foundation.org, gregkh@linuxfoundation.org,
 adobriyan@gmail.com, jani.nikula@intel.com, p.zabel@pengutronix.de,
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 laurent.pinchart@ideasonboard.com, praneeth@ti.com, nm@ti.com,
 vigneshr@ti.com, a-bhatia1@ti.com, j-luthra@ti.com, b-brnich@ti.com,
 detheridge@ti.com, p-mantena@ti.com, vijayp@ti.com,
 andrzej.p@collabora.com, nicolas@ndufresne.ca, davidgow@google.com,
 dlatypov@google.com
Subject: Re: [PATCH v10 06/11] math.h: Add macros for rounding to closest value
Message-ID: <ZljRSXtXWdOyCJaB@smile.fi.intel.com>
References: <20240530165925.2715837-1-devarsht@ti.com>
 <20240530171225.2749312-1-devarsht@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240530171225.2749312-1-devarsht@ti.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 30, 2024 at 10:42:25PM +0530, Devarsh Thakkar wrote:
> Add below rounding related macros:
> 
> round_closest_up(x, y) : Rounds x to closest multiple of y where y is a
> power of 2, with a preference to round up in case two nearest values are
> possible.
> 
> round_closest_down(x, y) : Rounds x to closest multiple of y where y is a
> power of 2, with a preference to round down in case two nearest values are
> possible.
> 
> roundclosest(x, y) : Rounds x to closest multiple of y, this macro should
> generally be used only when y is not multiple of 2 as otherwise
> round_closest* macros should be used which are much faster.
> 
> Examples:
>  * round_closest_up(17, 4) = 16
>  * round_closest_up(15, 4) = 16
>  * round_closest_up(14, 4) = 16
>  * round_closest_down(17, 4) = 16
>  * round_closest_down(15, 4) = 16
>  * round_closest_down(14, 4) = 12
>  * roundclosest(21, 5) = 20
>  * roundclosest(19, 5) = 20
>  * roundclosest(17, 5) = 15

...

> + * Examples :

It's inconsistent with the other one below.

> + * 	round_closest_up(17, 4) = 16
> + *
> + * 	round_closest_up(15, 4) = 16
> + *
> + * 	round_closest_up(14, 4) = 16

The three have TABs/spaces mixture.

I believe you wanted:

 * Examples::
 * * round_closest_up(17, 4) = 16
 * * round_closest_up(15, 4) = 16
 * * round_closest_up(14, 4) = 16

...

> + * Examples:
> + *
> + * 	round_closest_down(17, 4) = 16
> + *
> + * 	round_closest_down(15, 4) = 16
> + *
> + * 	round_closest_down(14, 4) = 12

As per above

...

> + * Examples :
> + *
> + * 	roundclosest(21, 5) = 20
> + *
> + * 	roundclosest(19, 5) = 20
> + *
> + * 	roundclosest(17, 5) = 15

As per above.

-- 
With Best Regards,
Andy Shevchenko


