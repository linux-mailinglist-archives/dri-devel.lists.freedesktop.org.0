Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F29A5026B
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 15:43:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85DA1882AF;
	Wed,  5 Mar 2025 14:43:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DjSvBK2B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A12B882AF;
 Wed,  5 Mar 2025 14:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741185792; x=1772721792;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=J1i7qe67RESKlvYl+Yda1vlNo50Sk/TQVjKtxyrQbOY=;
 b=DjSvBK2BL3zW1c5432cWXjL7cWDXZ3gbFLbYFHqrpQHdcM0BI9PlUNxw
 cHU3aBnY1hxlS725pAXdkuJovj6Qpwb5o8ktREXW5sm8fOxVeJ/d7l14c
 MzT18aAAPZ6LvmvVH06205NDwnsUvvF0fS3dY6donOpDiC4Zug0yyqHC+
 1mlYPIpApV+L+3hwNXgzd9DoyAWMenLSa9Ho9SPwxO3zLdbir3ouj2y6+
 qm1drPRjmeUcTM+CptCoEM8xROCG0/g+e3ZDJWy9lSIob2CzTrMbAzQ4Z
 cNFnFmHyOTmH5x9D762LdZMG1vjt81P82Vx/ahmWXCTqgoA5EC9puvwiZ Q==;
X-CSE-ConnectionGUID: WHECq8sfQmGUDtiQC992tw==
X-CSE-MsgGUID: WC4FvHulSUiTiaAIkZe+LA==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="52788176"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="52788176"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 06:43:12 -0800
X-CSE-ConnectionGUID: Kzd5AkpjSgWt6Wn/gUhwIw==
X-CSE-MsgGUID: TCsapfVFSsyIUv6V6peZ7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="118420148"
Received: from smile.fi.intel.com ([10.237.72.58])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 06:41:51 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tppwR-0000000HRGP-2JQv; Wed, 05 Mar 2025 16:41:47 +0200
Date: Wed, 5 Mar 2025 16:41:47 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Cc: Yury Norov <yury.norov@gmail.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 David Laight <David.Laight@aculab.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v4 3/8] bits: introduce fixed-type genmasks
Message-ID: <Z8hiqzCMoyxHj9rL@smile.fi.intel.com>
References: <20250305-fixed-type-genmasks-v4-0-1873dcdf6723@wanadoo.fr>
 <20250305-fixed-type-genmasks-v4-3-1873dcdf6723@wanadoo.fr>
 <Z8hf7pN84-64LWPv@smile.fi.intel.com>
 <9f0215c4-62e5-4dfa-8dac-732682600c8c@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9f0215c4-62e5-4dfa-8dac-732682600c8c@wanadoo.fr>
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

On Wed, Mar 05, 2025 at 11:38:19PM +0900, Vincent Mailhol wrote:
> On 05/03/2025 at 23:30, Andy Shevchenko wrote:
> > On Wed, Mar 05, 2025 at 10:00:15PM +0900, Vincent Mailhol via B4 Relay wrote:

...

> > Perhaps T or TYPE will suffice. Or perhaps we want
> > __GENMASK_Uxx() here?
> 
> If no objection, I have a preference for GENMASK_TYPE().

No objection from me :-)

-- 
With Best Regards,
Andy Shevchenko


