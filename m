Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD6784F12C
	for <lists+dri-devel@lfdr.de>; Fri,  9 Feb 2024 09:02:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7636310EC65;
	Fri,  9 Feb 2024 08:02:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HrrvUAvL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06C9B10EC65;
 Fri,  9 Feb 2024 08:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707465729; x=1739001729;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=8hv1yW6IbM58UJxt3tLusyVgrFws3JiyjYCrzaAsMUI=;
 b=HrrvUAvLhl8rHSwSlPlRAiGYOo2Qn0j/PJ3tFBsLXuGeLJp1Y6UJVO4p
 U6WPOjPJPwi/InHhlWAolriqp3W0o1kSAKatDJvAyzSImKwluhNxl+6Jv
 4fLEStQW+qOei/aDIzT7Clyv5JnOpb9lacaAh7Z/nyCBe6Nc9HKtY1ETJ
 9OSDs4f3mwyGzouqDMX2dq1Fh8uBHUNTBYcbGndiKooSgHWi4Z/+wxJQz
 v84kcRu2h1gWHFnk3JD9n5mUqQKAO1rOP2RRu0X4///TCwJIRvkrc/tTG
 TNH9+GQtkZ80m0uzeY5pkdJNx6SSLwyChe6YOIeSPZY2x7Z4yLi3IWUR1 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="18802459"
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; d="scan'208";a="18802459"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2024 00:02:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; 
   d="scan'208";a="6500951"
Received: from mziotti-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.252.43.29])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2024 00:02:05 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, Andi Shyti
 <andi.shyti@linux.intel.com>
Cc: Yury Norov <yury.norov@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: Re: Re: [PATCH v3 2/3] bits: Introduce fixed-type BIT
In-Reply-To: <ilppncjskpt52bijaoxlwcklawjpw5cqrndtx2g5xnwpj6bhbm@kn5yjscaha5e>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240208074521.577076-1-lucas.demarchi@intel.com>
 <20240208074521.577076-3-lucas.demarchi@intel.com>
 <ZcUz3V56qNeTVq66@ashyti-mobl2.lan>
 <ilppncjskpt52bijaoxlwcklawjpw5cqrndtx2g5xnwpj6bhbm@kn5yjscaha5e>
Date: Fri, 09 Feb 2024 10:01:58 +0200
Message-ID: <87il2yaww9.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 08 Feb 2024, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> On Thu, Feb 08, 2024 at 09:04:45PM +0100, Andi Shyti wrote:
>>Hi Lucas,
>>
>>looks good, just one idea...
>>
>>...
>>
>>> +#define BIT_U8(b)		((u8)(BIT_INPUT_CHECK(u8, b) + BIT(b)))
>>> +#define BIT_U16(b)		((u16)(BIT_INPUT_CHECK(u16, b) + BIT(b)))
>>> +#define BIT_U32(b)		((u32)(BIT_INPUT_CHECK(u32, b) + BIT(b)))
>>> +#define BIT_U64(b)		((u64)(BIT_INPUT_CHECK(u64, b) + BIT(b)))
>>
>>considering that BIT defines are always referred to unsigned
>>types, I would just call them
>>
>>#define BIT8
>>#define BIT16
>>#define BIT32
>>#define BIT64
>>
>>what do you think?
>
> it will clash with defines from other headers and not match the ones for
> GENMASK  so I prefer it the other way.

Agreed.


-- 
Jani Nikula, Intel
