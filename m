Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1987383A512
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 10:18:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E726610F697;
	Wed, 24 Jan 2024 09:18:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFC4C10F697;
 Wed, 24 Jan 2024 09:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706087884; x=1737623884;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=0uEt3QHC9f3bYP1Js3HWf0U2lMrJMdiCAo8M3PruTPo=;
 b=DXhWtlncl32ipOcIFO7MM8K7Y9FYhunzyIsWXblOR4nOQvjVNXB5y55N
 Igy7tlApF19pq14gc0gMLbooXKaf3LJrjR9DxA5HJOYci5TKEtunfcz2w
 n38xmx7IRHj5ulhW+ndFHc7Yv+fhkQw+zbZ4z5Q98siiGHRZmVByks1AJ
 X5t7H1/WelHCVhWoldMly+/kmQzP2JGKyw6Cyh39GFaICzHVd7BNGkkUP
 VjxnV6eC4HdzRZz7vEmFKLXF9anR7rHRuED8VmNytZxmRqS7ZbsM2wgBA
 zCmgQnshHzxg8PeOXJacZUvFRzG3Y+ab5mjBYfajd1VvqKZcmpKkzetBH A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="15313327"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="15313327"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 01:17:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="820392409"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="820392409"
Received: from komalav-mobl2.gar.corp.intel.com (HELO localhost)
 ([10.252.41.195])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 01:17:47 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell
 <sfr@canb.auug.org.au>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: Tree for Jan 23 (drm/xe/)
In-Reply-To: <152521f9-119f-4c61-b467-3e91f4aecb1a@infradead.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240123132929.7cb6ea4c@canb.auug.org.au>
 <152521f9-119f-4c61-b467-3e91f4aecb1a@infradead.org>
Date: Wed, 24 Jan 2024 11:17:44 +0200
Message-ID: <87le8fks3r.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 23 Jan 2024, Randy Dunlap <rdunlap@infradead.org> wrote:
> On 1/22/24 18:29, Stephen Rothwell wrote:
>> Hi all,
>> 
>> News: there will be no linux-next release on Friday
>> 
>> Changes since 20240122:
>> 
>
> on ARM64, when
> DRM_I915 is not set
> DRM_XE=m
> DEBUG_FS is not set
>
> ../drivers/gpu/drm/i915/display/intel_display_debugfs.c:1091:6: error: redefinition of 'intel_display_debugfs_register'
>  1091 | void intel_display_debugfs_register(struct drm_i915_private *i915)
>       |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> In file included from ../drivers/gpu/drm/i915/display/intel_display_debugfs.c:19:

Does [1] fix the issue?

BR,
Jani.


[1] https://lore.kernel.org/r/20240124090515.3363901-1-jani.nikula@intel.com


-- 
Jani Nikula, Intel
