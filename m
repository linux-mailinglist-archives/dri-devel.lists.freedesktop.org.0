Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E81DA503D9
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 16:53:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDA2210E7D4;
	Wed,  5 Mar 2025 15:53:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M6jMO2aZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0155B10E7D4;
 Wed,  5 Mar 2025 15:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741189986; x=1772725986;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Tn7c/4KBBSgdrZj70XjtojmoeN5yFcyHGbn2LUyfXrs=;
 b=M6jMO2aZdRpLd3keb7+Pf/IFDxVOU/Mg35oE1tRKVci9eNVwKA4/ObIS
 b24HDNaehbxwC12+2ENzNQrk9SojW4zYBiEl+ZVuRFSQ8wPy6imaufdtD
 F6wy0FCPY61lYqPboXUF5shTzQQ9jXMGwwM+CdkO6hGqLtc4nVm4fQe9B
 Z3nr7mDxpLBLT5rfy0BZICBtq+5p4jkF4FBAtAvjCzZ190qNoZeeM1MZ/
 BHmeqPvxvNQ6p3ezGWpehaWT29ZhMKTQKa5FGBeHjky36DnPs9Nt2Ybo3
 S+4E6eO7F7VvN8pkPbrOeC9N+WKecYwAinB83WrmMU/v78W4bJgd+SlEe Q==;
X-CSE-ConnectionGUID: j99dhjayQKO2yHRMYodDmg==
X-CSE-MsgGUID: ugymOez5QNWLo3stQMJcvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="67527577"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="67527577"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 07:53:05 -0800
X-CSE-ConnectionGUID: twW6RAXcQQa2tZs6ZhOGjQ==
X-CSE-MsgGUID: 88yD85AESISGO7rdvHmilQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="119234936"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.49])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 07:52:59 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Yury Norov <yury.norov@gmail.com>, mailhol.vincent@wanadoo.fr
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrew Morton
 <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Andi
 Shyti <andi.shyti@linux.intel.com>, David Laight
 <David.Laight@aculab.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v4 3/8] bits: introduce fixed-type genmasks
In-Reply-To: <Z8hx9AaUX_GvYq_A@thinkpad>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250305-fixed-type-genmasks-v4-0-1873dcdf6723@wanadoo.fr>
 <20250305-fixed-type-genmasks-v4-3-1873dcdf6723@wanadoo.fr>
 <Z8hx9AaUX_GvYq_A@thinkpad>
Date: Wed, 05 Mar 2025 17:52:56 +0200
Message-ID: <87a59zxynb.fsf@intel.com>
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

On Wed, 05 Mar 2025, Yury Norov <yury.norov@gmail.com> wrote:
> On Wed, Mar 05, 2025 at 10:00:15PM +0900, Vincent Mailhol via B4 Relay wrote:
>> +#define GENMASK_U8(h, l) ((unsigned int)GENMASK_t(u8,  h, l))
>> +#define GENMASK_U16(h, l) ((unsigned int)GENMASK_t(u16, h, l))
>
> Typecast to the type that user provides explicitly?  And maybe do
> in GENMASK_TYPE()

The cast to unsigned int seemed odd to me too.

BR,
Jani.


-- 
Jani Nikula, Intel
