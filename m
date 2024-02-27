Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 648F3868AC3
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 09:29:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C67D10E8BC;
	Tue, 27 Feb 2024 08:29:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PY33bpMF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2DCF10E840;
 Tue, 27 Feb 2024 08:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709022549; x=1740558549;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=+EEelfmm5zkugW1qtqYPffAZ7/q9ePzittpAYzJIZBU=;
 b=PY33bpMFVoxiF2Q57USwQJvdh+7zFXof93L0czBs/xF3RD8dgvU3qU8P
 yfNATMOsWfb+HWYRrnN4sJZGii1C9FYPuRuXVNiG4bkqGchjw25iJd8IC
 K+kBQAMd61EbkcnyMG5UbHcE5ny6mRcXKqw2SH4qmgZw+YIeNod2cW7wv
 3L8iohOgPaL7dnco6OxC7rVS3RfjE/B3qUIy8FQBaQxFGD0iWIZh2jtlY
 BTs010vma2b1Kd+9MuM2yYYWLqlys4D5S8eLx/XjuUSuFvfp8ziy47drV
 QdFm7HkPaJLulUyfvKrDb8dFLqz5BGAMokTwX4mSxQBlztNsVC7XfX4Ys Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="3272977"
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="3272977"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 00:29:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="6926173"
Received: from bdallmer-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.49.187])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 00:29:05 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maxime Ripard <mripard@redhat.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>
Cc: Daniel Stone <daniels@collabora.com>, dim-tools@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: Re: DRM Migration to Gitlab
In-Reply-To: <k555c7lj3mcj2skzrmc2ywxzz5ndtdgfpitw7fftdlyjjpmfou@7maudk3vdxuf>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <k555c7lj3mcj2skzrmc2ywxzz5ndtdgfpitw7fftdlyjjpmfou@7maudk3vdxuf>
Date: Tue, 27 Feb 2024 10:29:01 +0200
Message-ID: <87edcyl38y.fsf@intel.com>
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

On Tue, 27 Feb 2024, Maxime Ripard <mripard@redhat.com> wrote:
> Hi,
>
> Sima, after becoming aware of the drm-misc transition to Gitlab in the
> next couple of weeks, to do the same for DRM today.
>
> This is now done and all the various bits (nightly.conf, MAINTAINERS,
> doc, etc.) should be there.
>
> If all goes well, the only thing you'll notice is that dim will complain
> about the drm remote not having the right URLs.
>
> Any dim user should update the URL with either one of the two following
> commands:
>
> git remote set-url drm ssh://git@gitlab.freedesktop.org/drm/kernel.git
> git remote set-url drm https://gitlab.freedesktop.org/drm/kernel.git
>
> And the rest should be transparent.

Except it isn't. If you do that before updating to new nightly.conf,
it'll complain that the URL it sees in the old config isn't available,
and prompts.

If you first do 'dim ub', and then do 'dim ub' again, before changing
the URL, it'll also prompt, but it's unable to override the existing drm
remote.

I think dim should be updated to handle all of this without user
manually doing anything other than answering a yes/no prompt.


BR,
Jani.


-- 
Jani Nikula, Intel
