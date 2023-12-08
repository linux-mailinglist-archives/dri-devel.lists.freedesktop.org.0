Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF5980A01D
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 10:59:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EC5910EA44;
	Fri,  8 Dec 2023 09:59:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B6D110EA44;
 Fri,  8 Dec 2023 09:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702029590; x=1733565590;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=9zfaRLSGxVe8HCog+7PkeW1tTPz6g2OQj7xOLXUigwc=;
 b=iPY8BK9lZjX4zrrVGK5cTyfs254/hmRY2CzIuTa90VILWMyk9Uu+PpLR
 8AH096JiyFcZHMhM4EMf/6hOAsfPjeyVxxYEeX2hJ/lsyuaxnsVc0GrDs
 kgJDUXbxbjBn7jOp0LicA5jPb6hvfAjgeM191E4UY/xq09QIDzffBms4J
 86nPUdaoJ1LLEWUPKRz29XZsdQDx3/A6JGAJEjreIrLeuFwgzhgv62b8G
 RAgExYCcOTEfMixhamWi2LOzDAh1KEBA8YYtxONvABCJ0Bpx8+nKnMd4G
 cZ/q5Ogeyn9AMoCeVtkI3FQfoVZWrTfANRTrVRtXTBloXVSjPYAhPY0DD Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="480581417"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="480581417"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2023 01:59:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="772078541"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="772078541"
Received: from mvafin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.63.236])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2023 01:59:46 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: kernel test robot <oliver.sang@intel.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>
Subject: Re: [Intel-gfx] [drm-intel:drm-intel-gt-next] [drm/i915]
 [confidence: ] 9bb66c179f: assertion_failure
In-Reply-To: <202312071643.321205c6-oliver.sang@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <202312071643.321205c6-oliver.sang@intel.com>
Date: Fri, 08 Dec 2023 11:59:43 +0200
Message-ID: <87o7f1ypyo.fsf@intel.com>
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
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 intel-gfx@lists.freedesktop.org, Jonathan Cavitt <jonathan.cavitt@intel.com>,
 dri-devel@lists.freedesktop.org, oliver.sang@intel.com, "Musial,
 Ewelina" <ewelina.musial@intel.com>, oe-lkp@lists.linux.dev,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 07 Dec 2023, kernel test robot <oliver.sang@intel.com> wrote:
> Hello,
>
> kernel test robot noticed "assertion_failure" on:
>
> commit: 9bb66c179f50e61df20ba13c9b34ca17d00b05fb ("drm/i915: Reserve some kernel space per vm")
> git://anongit.freedesktop.org/drm-intel drm-intel-gt-next
>
> in testcase: igt

So the kernel test robot runs igt. I've seen a handful of reports over
the years, but not a whole lot. If you run it even semi-regularly, I
would have expected more. What's the deal here?

There's clearly overlap with what our CI is doing. Maybe better
coordination would be useful? Especially wrt reporting. I'm not sure if
anyone's going to track these mails.

Cc: Ewelina

> version: igt-x86_64-0f075441-1_20230520

That's six months old and more than 1k commits behind. The results are
going to be useless, I'm afraid.


BR,
Jani.


> with following parameters:
>
> 	group: group-04
>
>
>
> compiler: gcc-12
> test machine: 20 threads 1 sockets (Commet Lake) with 16G memory
>
> (please refer to attached dmesg/kmsg for entire log/backtrace)
>
>
> we also observed below tests failed upon this commit while pass on parent.
>
> 8aa519f17512da50 9bb66c179f50e61df20ba13c9b3
> ---------------- ---------------------------
>        fail:runs  %reproduction    fail:runs
>            |             |             |
>            :6          100%           6:6     igt.api_intel_bb.bb-with-allocator.fail
>            :6          100%           6:6     igt.api_intel_bb.blit-noreloc-keep-cache.fail
>            :6          100%           6:6     igt.api_intel_bb.blit-noreloc-purge-cache.fail
>            :6          100%           6:6     igt.api_intel_bb.blit-reloc-purge-cache.fail
>            :6          100%           6:6     igt.api_intel_bb.delta-check.fail
>            :6          100%           6:6     igt.api_intel_bb.object-noreloc-keep-cache-simple.fail
>            :6          100%           6:6     igt.api_intel_bb.object-noreloc-purge-cache-simple.fail
>            :6           83%           5:6     igt.api_intel_bb.object-reloc-purge-cache.fail
>            :6          100%           6:6     igt.api_intel_bb.simple-bb-ctx.fail
>            :6          100%           6:6     igt.api_intel_bb.simple-bb.fail
>
>
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202312071643.321205c6-oliver.sang@intel.com
>
>
> [   43.922756][  T447]
> [   43.935008][  T447] IGT-Version: 1.27.1-g0f075441 (x86_64) (Linux: 6.6.0-rc7-01579-g9bb66c179f50 x86_64)
> [   43.935018][  T447]
> [   43.947248][  T447] Starting subtest: bb-with-allocator
> [   43.947258][  T447]
> [   43.956752][  T447] (api_intel_bb:857) intel_batchbuffer-CRITICAL: Test assertion failure function __intel_bb_add_object, file ../lib/intel_batchbuffer.c:1673:
> [   43.956762][  T447]
> [   43.974467][  T447] (api_intel_bb:857) intel_batchbuffer-CRITICAL: Failed assertion: allocated || reserved
> [   43.974477][  T447]
> [   43.987691][  T447] (api_intel_bb:857) intel_batchbuffer-CRITICAL: Can't get offset, allocated: 0, reserved: 0
> [   43.987706][  T447]
>
>
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20231207/202312071643.321205c6-oliver.sang@intel.com

-- 
Jani Nikula, Intel
