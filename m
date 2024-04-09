Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B90E89D2FF
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 09:27:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 807AF112B22;
	Tue,  9 Apr 2024 07:27:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AKatHfYU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B98A3112B22
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 07:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712647617; x=1744183617;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=daUzE7PdhRD4SgLG9zKOOsfMuWRE0I6EtRMVENqc/98=;
 b=AKatHfYU/obN7UwyWBS5rrPZKzKxFxQqUJZzIuCDScDgn6IZUZ/ZK6Pi
 PLnubkzcTUMLxqylJKEBRRkQU5cwYstO30drVBfxfNCFYAGfS9SpJPCqN
 8SZRiBbSJLHdLSGTvjB0HEkoX4WMidaV9PFZrlwnfzLlECnaBdBRa5uhf
 p/Z/Mrn5180om0TTru7XpE7G096TSm30QQBCZ3Y7mD3fxTDFvMjwRfc+s
 qV9dr3qVZwQhTDfa9JK30baTUcbzGSbFbvUcqCtrz7AYehdesHzd01i+F
 arjuXoJonughtgClA0wt6omzcTaBGz2mRRylZrx7qWteubWSUZA2J9WbG Q==;
X-CSE-ConnectionGUID: ijGulUkiTtaQDNypIxNoaw==
X-CSE-MsgGUID: nOA54EodReytW9Z9qOAKDQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="8110432"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="8110432"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 00:26:56 -0700
X-CSE-ConnectionGUID: Vh6Zj9t+TO+fDY1xnrUssw==
X-CSE-MsgGUID: 63XeEpTzQf2JrlksYXceig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; d="scan'208";a="24925457"
Received: from mserban-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.59.228])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 00:26:51 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Namhyung Kim <namhyung@kernel.org>, Arnaldo Carvalho de Melo
 <acme@kernel.org>, Ian Rogers <irogers@google.com>, Kan Liang
 <kan.liang@linux.intel.com>
Cc: Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, linux-perf-users@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/9] tools/include: Sync uapi/drm/i915_drm.h with the
 kernel sources
In-Reply-To: <20240408185520.1550865-2-namhyung@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240408185520.1550865-1-namhyung@kernel.org>
 <20240408185520.1550865-2-namhyung@kernel.org>
Date: Tue, 09 Apr 2024 10:26:47 +0300
Message-ID: <874jcb9etk.fsf@intel.com>
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

On Mon, 08 Apr 2024, Namhyung Kim <namhyung@kernel.org> wrote:
> To pick up changes from:
>
>    b112364867499 ("drm/i915: Add GuC submission interface version query")
>    5cf0fbf763741 ("drm/i915: Add some boring kerneldoc")
>
> This should be used to beautify DRM syscall arguments and it addresses
> these tools/perf build warnings:
>
>   Warning: Kernel ABI header differences:
>     diff -u tools/include/uapi/drm/i915_drm.h include/uapi/drm/i915_drm.h

All these years and I never realized there are header copies
there. But... why copies?

BR,
Jani.


-- 
Jani Nikula, Intel
