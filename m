Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E71B89D67B
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 12:14:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27ED4112C6C;
	Tue,  9 Apr 2024 10:14:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RyScJPCS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2225112C6A
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 10:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712657657; x=1744193657;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=/HdsMnAppID2c/T4mP9olHUzTPjv3yVarzfCvUZ29fg=;
 b=RyScJPCSzDL/hvHHBZlT/v0v3CSrYPeW5adaXleq84pNxXJ/okwik6zl
 ObT9Av1uR+hhS+g7jrO6kgsiJVDTtbmFHo0d251iTgaXj8zyKkPxjg9qt
 zefWqdOWpEBwlWxd8JkPCwCjZpcD8XCZ7JSqLhzkSUBaR31kS2a32RVwP
 eOgqAStrIAIAHxLhRQV2hptFZBfIcWm3Tptk4eBVevNyq0RRfmSovJzAE
 73jg8SDEVOmmKRWLopJ8u+ee/oOq85grdBDcnbuh7UuTnzUWZ8EhAw7+d
 ptTY4gvMKTBfwXlpyr6nkmfZQa0hkvkHTsa6aFd8b/DXtBlU9Rierg0MM Q==;
X-CSE-ConnectionGUID: ayfbzEDTQPCBipWlp0lWdw==
X-CSE-MsgGUID: 7HhBGb/JTFelamnd/ZU/xg==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="8193958"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="8193958"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 03:14:17 -0700
X-CSE-ConnectionGUID: h6vK66UbSkiXc+RIBnnazw==
X-CSE-MsgGUID: NfhpuIMUS02Pkod9R4umgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; d="scan'208";a="51180842"
Received: from mserban-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.59.228])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 03:14:11 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: Namhyung Kim <namhyung@kernel.org>, Arnaldo Carvalho de Melo
 <acme@kernel.org>, Ian Rogers <irogers@google.com>, Kan Liang
 <kan.liang@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, Adrian Hunter
 <adrian.hunter@intel.com>, Peter Zijlstra <peterz@infradead.org>, LKML
 <linux-kernel@vger.kernel.org>, linux-perf-users@vger.kernel.org, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/9] tools/include: Sync uapi/drm/i915_drm.h with the
 kernel sources
In-Reply-To: <ZhTwPLliHXKPAJUQ@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240408185520.1550865-1-namhyung@kernel.org>
 <20240408185520.1550865-2-namhyung@kernel.org> <874jcb9etk.fsf@intel.com>
 <ZhTwPLliHXKPAJUQ@gmail.com>
Date: Tue, 09 Apr 2024 13:14:09 +0300
Message-ID: <87pluy972m.fsf@intel.com>
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

On Tue, 09 Apr 2024, Ingo Molnar <mingo@kernel.org> wrote:
> * Jani Nikula <jani.nikula@linux.intel.com> wrote:
>
>> On Mon, 08 Apr 2024, Namhyung Kim <namhyung@kernel.org> wrote:
>> > To pick up changes from:
>> >
>> >    b112364867499 ("drm/i915: Add GuC submission interface version query")
>> >    5cf0fbf763741 ("drm/i915: Add some boring kerneldoc")
>> >
>> > This should be used to beautify DRM syscall arguments and it addresses
>> > these tools/perf build warnings:
>> >
>> >   Warning: Kernel ABI header differences:
>> >     diff -u tools/include/uapi/drm/i915_drm.h include/uapi/drm/i915_drm.h
>> 
>> All these years and I never realized there are header copies
>> there. But... why copies?
>
> It's better than all the alternatives we tried so far:
>
>  - Symbolic links and direct #includes: this was the original approach but 
>    was pushed back on from the kernel side, when tooling modified the 
>    headers and broke them accidentally for kernel builds.
>
>  - Duplicate self-defined ABI headers like glibc: double the maintenance 
>    burden, double the chance for mistakes, plus there's no tech-driven 
>    notification mechanism to look at new kernel side changes.
>
> What we are doing now is a third option:
>
>  - A software-enforced copy-on-write mechanism of kernel headers to 
>    tooling, driven by non-fatal warnings on the tooling side build when 
>    kernel headers get modified:
>
>     Warning: Kernel ABI header differences:
>       diff -u tools/include/uapi/drm/i915_drm.h include/uapi/drm/i915_drm.h
>       diff -u tools/include/uapi/linux/fs.h include/uapi/linux/fs.h
>       diff -u tools/include/uapi/linux/kvm.h include/uapi/linux/kvm.h
>       ...
>
>    The tooling policy is to always pick up the kernel side headers as-is, 
>    and integate them into the tooling build. The warnings above serve as a 
>    notification to tooling maintainers that there's changes on the kernel 
>    side.
>
> We've been using this for many years now, and it might seem hacky, but 
> works surprisingly well.
>
> Does this make sense to you?

Yes, although there are probably pieces of the puzzle I'm missing.
Thanks for the explanation! (That might work almost as-is copied to
tools/include/uapi/README. ;)

It's also kind of funny to find this kind of back alleys of the kernel
repo I've never wandered to before.

BR,
Jani.

-- 
Jani Nikula, Intel
