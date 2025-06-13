Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92020AD89EC
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 13:02:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D725310E9B0;
	Fri, 13 Jun 2025 11:02:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BOgaSPLI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6975410E9B1
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 11:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749812519; x=1781348519;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=8yzQ+IPPA7Lrx2RCuDtyNnd8xRKztZ+QJOFjp0XrRYQ=;
 b=BOgaSPLIkdf896sxJnjuxfp8ReOBLHgaFnlu9UXpQtTamhd1gog29ryU
 kCiBLDRu20kNgXsCK+QyiRx7t6m0WPwAmnlq+EFlXirGFF9VkRF2fb5Ud
 xE5vR7QTdnN7uMXNWZu0JxLnuEgbo85BAjda2jnxPlGI1s8MKJRE2kO4u
 9XYWk0AncCH59QXTbkD0l33G+5/20+1p8UznGNL0A5NvOMZYqMNrXkgwd
 JiBOWnrDacXFqaQ5ODD1/MoxMYOTb93A44tdn/GCjHcRsutm1KF6aruTI
 OqSpg8ff3vMdSME94sQT1IoAhoLajfYOW2KXeO1TMMKf7cx7fLvhOu/vd g==;
X-CSE-ConnectionGUID: UQ0CW5bKRwKgAyeHYdLpmg==
X-CSE-MsgGUID: U7YdnHnyQgaiyG1pKuXTmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="74559348"
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; d="scan'208";a="74559348"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 04:01:58 -0700
X-CSE-ConnectionGUID: WoTGv81jQxqvDuWovwRmtA==
X-CSE-MsgGUID: yVvuwI+ERLiv6cqB9r4Y7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; d="scan'208";a="152958079"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.26])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 04:01:55 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Tvrtko Ursulin <tursulin@ursulin.net>, Simona Vetter
 <simona.vetter@ffwll.ch>, Christian =?utf-8?Q?K=C3=B6nig?=
 <ckoenig.leichtzumerken@gmail.com>
Cc: tzimmermann@suse.de, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/prime: remove drm_prime_lookup_buf_by_handle
In-Reply-To: <dca65c78-9af4-4266-b60e-ce13b5a61f06@ursulin.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250604113234.2520-1-christian.koenig@amd.com>
 <aEBn9o-bARNut3ek@phenom.ffwll.local>
 <aEByd4gidRpxJkfp@phenom.ffwll.local>
 <7497bb60649f9459b9734514bd320033f45651e2@intel.com>
 <dca65c78-9af4-4266-b60e-ce13b5a61f06@ursulin.net>
Date: Fri, 13 Jun 2025 14:01:51 +0300
Message-ID: <39cf23f66c3f872dddbaf8948e42decc810263c6@intel.com>
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

On Fri, 13 Jun 2025, Tvrtko Ursulin <tursulin@ursulin.net> wrote:
> On 13/06/2025 11:09, Jani Nikula wrote:
>> On Wed, 04 Jun 2025, Simona Vetter <simona.vetter@ffwll.ch> wrote:
>>> On Wed, Jun 04, 2025 at 05:36:22PM +0200, Simona Vetter wrote:
>> This regressed one of our CI IGT tests [1].
>> 
>> BR,
>> Jani.
>> 
>> 
>> [1] https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14463
>
> It also explodes even more trivially when logging into a KDE Wayland 
> session:

Smells like a revert, and back to the drawing board, perhaps?


BR,
Jani.


-- 
Jani Nikula, Intel
