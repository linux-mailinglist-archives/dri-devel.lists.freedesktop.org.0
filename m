Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4953CCB0110
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 14:33:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2CAB10E59A;
	Tue,  9 Dec 2025 13:33:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="imJbbpqk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE96910E599;
 Tue,  9 Dec 2025 13:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765287220; x=1796823220;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=7X4nFWXutsaNJF+/VYoIx12NbqDzMEhvx97L/+O1U/w=;
 b=imJbbpqkO+oWDO/HYDU8SM+UJmslk8I0lY40pLiUJfORyJ61UJ4WwzkK
 ux8RVXe4zc6v4QaTcXUS9bD13dJUm4IzbuoDq060bxtK41NHx4HVt+IGG
 RgBRpkawrEOfXSI3ELIxbGWGMp2VO2ev0F5G3+YA9HHy0QdY+qT9bY23Y
 /b63nFkPjlxcxTcGI1MB9INhg62s/Mh6JLah+vPKRXSBVpyuyT9y4DcGn
 LMV6DBsn4IEoGG8RXhuQ2oBy7XTZXTl1U+OjGrX8taZRkOgn7Hq96/mpH
 Za9Y8elTBIL0tn36z+GSxRQ6GAYZ+KXrKpLDtxcHBYArVaejh7lzy5zmZ g==;
X-CSE-ConnectionGUID: fIe+lG/URIqIHXoXTN3b/Q==
X-CSE-MsgGUID: fEBjwn+TS8KnuILhJ9rG1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="67409799"
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; d="scan'208";a="67409799"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 05:33:40 -0800
X-CSE-ConnectionGUID: b5Bwr++CRTW+HAnoKFbmEg==
X-CSE-MsgGUID: U3UGsacKTyG4xPF2KCvrUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; d="scan'208";a="201335834"
Received: from mwiniars-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.154])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 05:33:37 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Norbert Lange <nolange79@gmail.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: PROBLEM: i915 leaks DP connector with static kernel
In-Reply-To: <CADYdroPQyiBfZ=wP6Cn6ivh72JGyFzV=RebkZ-XWMPU-O0D3-Q@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <CADYdroPQyiBfZ=wP6Cn6ivh72JGyFzV=RebkZ-XWMPU-O0D3-Q@mail.gmail.com>
Date: Tue, 09 Dec 2025 15:33:33 +0200
Message-ID: <f1ee2aa65d010a891c00691889df4797ecccb872@intel.com>
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

On Tue, 09 Dec 2025, Norbert Lange <nolange79@gmail.com> wrote:
> Hello, I am building upstream 6.18 as static kernel, and booting a
> initramfs with the needed firmware.
>
> The relevant files are attached, BUG occurs as soon as the i915 module
> is initialized,
> the attached Monitor just stays blank.
> Errors start with:
>
> [    0.320330] i915 0000:00:02.0: [drm] Found broxton (device ID 5a85)
> integrated display version 9.00 stepping E0
> [    0.326984] i915 0000:00:02.0: [drm] CI tainted: 0x9 by
> intel_gt_init (drivers/gpu/drm/i915/gt/intel_gt.c:766)
> [    0.799141] Freeing initrd memory: 28320K
> [    0.799636] i915 0000:00:02.0: [drm] Finished loading DMC firmware
> i915/bxt_dmc_ver1_07.bin (v1.7)
> [    0.799782] ------------[ cut here ]------------
> [    0.799788] WARNING: CPU: 2 PID: 1 at
> drivers/gpu/drm/drm_mode_config.c:537 drm_mode_config_cleanup
> (drivers/gpu/drm/drm_mode_config.c:537 (discriminator 1))
> [    0.799806] CPU: 2 UID: 0 PID: 1 Comm: swapper/0 Tainted: G
> W           6.18.0-static #1 PREEMPT(none)
> [    0.799815] Tainted: [W]=WARN
> [    0.799819] Hardware name: TQ-Group TQMxE39M/cgb-800--.00, BIOS
> 5.12.30.28.22 09/30/2019
> [    0.799823] RIP: 0010:drm_mode_config_cleanup
> (drivers/gpu/drm/drm_mode_config.c:537 (discriminator 1))
> [    0.799832] Code: 00 eb e8 48 89 ef e8 16 c4 fe ff 48 8d bb 70 02
> 00 00 e8 ca 14 b5 ff 48 8b 93 58 02 00 00 48 8d 83 58 02 00 00 48 39
> c2 74 34 <0f> 0b 48 89 ee 48 89 df e8 7a ac fe ff 48 89 ef e8 42 c4 fe
> ff 48

The problem occurs earlier but there are no logs for that. Please file a
bug as described at [1].

BR,
Jani.


[1] https://drm.pages.freedesktop.org/intel-docs/how-to-file-i915-bugs.html


-- 
Jani Nikula, Intel
