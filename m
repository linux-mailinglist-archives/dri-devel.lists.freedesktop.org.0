Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A34D8C7266
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 10:04:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E67AB10E0C8;
	Thu, 16 May 2024 08:04:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M9KiKs33";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A1B910E0C8
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 08:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715846687; x=1747382687;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=2tXHTi0dLNSZyf6qV6/xdIj/MMJqYMPKAqzz1CzpkkQ=;
 b=M9KiKs33A6DMJ4IijbFOH/okBYWZVW6X2LXoxMyd+fwZGJWC1SgPC/n+
 lT/YFJD6ArgAphjTk6OdyGP+KR2lhn9UelVfVifyS4AM3DqBhfPDY50kR
 rhGWFQf0GzBES7ZQbyZohUjS2JBZUa2bOHRGLyf8MLAiUXpR7KC1Tk2Zk
 wijgjqF6kzBF2OdMADBjwBExJdxLH16ns/ZdHpMSMjcCjprmxeC+ZCQqF
 KiXjcXcdn3I2J7P9I0hJ4C9XfaMDhDzmIR+cCEvQy/77xGxf4IaZYpFAM
 gaQxoF6126GeWNIaoax/PekaaxpsUxGCiqwQ8qj7Q5CBUC/rBH+l6yz3B w==;
X-CSE-ConnectionGUID: a+ZYMij3Qiag2+Vz+Cmp2A==
X-CSE-MsgGUID: pJxAVfYbQ+K3qVTFPk0Nlg==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="22613471"
X-IronPort-AV: E=Sophos;i="6.08,163,1712646000"; d="scan'208";a="22613471"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 01:04:47 -0700
X-CSE-ConnectionGUID: 9QUzi2JtTcG3QGDSVfTjzQ==
X-CSE-MsgGUID: MHU8v8iiTRmi9b+L7Xo8ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,163,1712646000"; d="scan'208";a="31277273"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.208])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 01:04:44 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Linus Torvalds <torvalds@linux-foundation.org>, Dave Airlie
 <airlied@gmail.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel
 <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [git pull] drm for 6.10-rc1
In-Reply-To: <CAHk-=whuCX-NAGOLzwn5sObPDJX-pdqamZ7YTpHFHODAMv4P+A@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <CAPM=9tw-53PCvveRcdLUUQ+mjq2X2er5zp6n1KeE8Nu8x=VP2g@mail.gmail.com>
 <CAHk-=whxT8D_0j=bjtrvj-O=VEOjn6GW8GK4j2V+BiDUntZKAQ@mail.gmail.com>
 <CAPM=9tyOtH24Mw_2X+bgV9iChOQV3LtmRCoR5x6KXhSUD6FjUg@mail.gmail.com>
 <CAHk-=wh8DWSMrtuhZOzanfBCFcuJCihO9x7fkzx-dBhLddXF-Q@mail.gmail.com>
 <CAPM=9twCVkx9OqndCcvjjgx+P7ixBRwttiz25-R=bkycEo5vrQ@mail.gmail.com>
 <CAHk-=whuCX-NAGOLzwn5sObPDJX-pdqamZ7YTpHFHODAMv4P+A@mail.gmail.com>
Date: Thu, 16 May 2024 11:04:40 +0300
Message-ID: <87v83eb2sn.fsf@intel.com>
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

On Wed, 15 May 2024, Linus Torvalds <torvalds@linux-foundation.org> wrote:
> On Wed, 15 May 2024 at 16:17, Dave Airlie <airlied@gmail.com> wrote:
>> AMDGPU, I915 and XE all have !COMPILE_TEST on their variants
>
> Hmm.  It turns out that I didn't notice the AMDGPU one because my
> Threadripper - that has AMDGPU enabled - I have actually turned off
> EXPERT on, so it's hidden by that for me.
>
> But yes, both of those should be "depends on !WERROR" too.

Fair enough. Honestly it just didn't occur to me.

The main goal here was to ensure the drm subsystem does not have any
build warnings, but without halting CI on any non-drm warnings that
might occasionally creep in and that we can't fix as quickly.

If there was a way to somehow limit WERROR by subdirectories, without
config options, I'd love to ditch the config.

> Or maybe they should just go away entirely, and be subsumed by the
> DRM_WERROR thing.

For i915, this was the idea anyway, we just haven't gotten around to it
yet.


BR,
Jani.


-- 
Jani Nikula, Intel
