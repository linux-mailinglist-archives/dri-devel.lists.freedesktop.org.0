Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2CEA7806C
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 18:30:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D499510E61E;
	Tue,  1 Apr 2025 16:30:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C11I1NJS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 717DA10E61E;
 Tue,  1 Apr 2025 16:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743525044; x=1775061044;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=lXgHWKBGcdAv80MR9lRHBNUK3Fk7fpBowOaOLS7r+9o=;
 b=C11I1NJSA9C30503v+KLjNlYAhUHKnhu/bGxY6G85BXeG3n5obvhANyP
 rpgbUrGRackheFD5d/ukNQ3h5/6BPr9ZUwinuJWd7Vqp6nUkXyvZQ8n4M
 Q7AI9V/ur3rpftoVfAAQDZmQoLPdzqe8zo/17TkzGpJEceho8nE0pqVif
 9fMGyfGj8cYtomxnDO3wj0VaFW90CL3grgEm7uwbfypFDa63l1cZlUyqT
 bMUUiPk2rP6ZYcWdZv7JwB38UK0WquaC8JuPyEWPNodi2g7vKuNeHRlTi
 Dc0MEclnHdpJ74Ryio+ReR/qyIwQ/5W9MS0klxDv+a979vZ1s0jOJvZgQ Q==;
X-CSE-ConnectionGUID: XKkSgadVQDaLQw1SJTFzFA==
X-CSE-MsgGUID: ks9p3nMKS3uKQJFDRThMdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="55518649"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="55518649"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 09:30:31 -0700
X-CSE-ConnectionGUID: Jj7RHyF8RSOM8O5d6OWj4g==
X-CSE-MsgGUID: WtcLpzfdTDKSewZdyCkZTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="131635609"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orviesa005.jf.intel.com with SMTP; 01 Apr 2025 09:30:27 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 01 Apr 2025 19:30:25 +0300
Date: Tue, 1 Apr 2025 19:30:25 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Kumar, Naveen1" <naveen1.kumar@intel.com>
Cc: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "Syrjala, Ville" <ville.syrjala@intel.com>
Subject: Re: [PATCH v11 0/5] Expose modifiers/formats supported by async flips
Message-ID: <Z-wUoVN1ekJJUFaI@intel.com>
References: <20250328-asyn-v11-0-a50d13bfea0d@intel.com>
 <Z-q7eIdMkkoXXM0u@intel.com>
 <DM6PR11MB3258F2C70CF2D3F985563997A7AC2@DM6PR11MB3258.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DM6PR11MB3258F2C70CF2D3F985563997A7AC2@DM6PR11MB3258.namprd11.prod.outlook.com>
X-Patchwork-Hint: comment
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

On Tue, Apr 01, 2025 at 01:27:14PM +0000, Kumar, Naveen1 wrote:
> Hi Ville,
> 
> >-----Original Message-----
> >From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >Sent: Monday, March 31, 2025 9:28 PM
> >To: Murthy, Arun R <arun.r.murthy@intel.com>
> >Cc: dri-devel@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; intel-
> >xe@lists.freedesktop.org; Jani Nikula <jani.nikula@linux.intel.com>; Borah,
> >Chaitanya Kumar <chaitanya.kumar.borah@intel.com>; Syrjala, Ville
> ><ville.syrjala@intel.com>; Kumar, Naveen1 <naveen1.kumar@intel.com>
> >Subject: Re: [PATCH v11 0/5] Expose modifiers/formats supported by async
> >flips
> >
> >On Fri, Mar 28, 2025 at 09:26:19PM +0530, Arun R Murthy wrote:
> >> All of the formats/modifiers supported by the plane during synchronous
> >> flips are nor supported by asynchronous flips. The formats/modifiers
> >> exposed to user by IN_FORMATS exposes all formats/modifiers supported
> >> by plane and this list varies for async flips. If the async flip
> >> supported formats/modifiers are exposed to the user, user based on
> >> this list can take decision to proceed or not and avoid flip failures
> >> during async flips.
> >
> >The kernel stuff seems pretty much ready. But the userspace story seems more
> >unclear...
> >
> >> Discussion around this can be located @
> >> https://gitlab.freedesktop.org/mesa/mesa/-
> >/merge_requests/29618#note_2
> >> 487123 Mutter implementation for IN_FORMARTS_ASYNC under review @
> >> https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/4063
> >
> >https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/3797
> >seems to be the actual async flip MR for mutter. And from a quick glance it
> >doesn't look actually ready yet?
> 
> We need to refer to Mutter MR-4063 [1] for the new UAPI IN_FORMATS_ASYNC implementation, where it has been ACKed [2].

AFAIK it doesn't actually do anything, so completely pointless
until the actual async flip implementation lands.

> MR-3797 [3] is the parent MR, which focuses on adding full async flip support in Mutter. However, it is currently blocked due to its implementation approach, where the cursor and primary plane are always part of CRTC direct scanout updates-this is unrelated to the new KMD UAPI implementation. You can also refer to this discussion [4].
> 
> [1] https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/4063
> [2] https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/4063#note_2256961
> [3] https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/3797
> [4] https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/3797#note_2385530
> 
> Regards,
> Naveen Kumar
> >
> >> Xorg/modesetting patch
> >> https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/1816
> >
> >I think this one should be in a decent state now (been running it for a month or
> >so). Would need some actual eyes on it now.
> >
> >So I guess now we get to wait until at least one of those makes some real
> >progress. But in the meantime we should merge the
> >i915 intel_plane_can_async_flip() changes so that they don't bitrot.
> >
> >>
> >> TODO: Upon merge of the patch related to async flip
> >> https://patchwork.freedesktop.org/patch/626849/?series=139807&rev=6
> >> the patch 5 in this series will have to make use of the new function
> >> pointer can_async_flip().
> >>
> >> v3: Add new plane->funcs format_mod_supported_async (Ville)
> >>
> >> Arun R Murthy (3):
> >>   drm/plane: Add new plane property IN_FORMATS_ASYNC
> >>   drm/plane: Expose function to create format/modifier blob
> >>   drm/i915/display: Populate list of async supported formats/modifiers
> >>
> >>  drivers/gpu/drm/drm_mode_config.c             |  7 +++
> >>  drivers/gpu/drm/drm_plane.c                   | 50 ++++++++++++------
> >>  .../drm/i915/display/skl_universal_plane.c    | 51 +++++++++++++++++++
> >>  include/drm/drm_mode_config.h                 |  6 +++
> >>  include/drm/drm_plane.h                       |  4 ++
> >>  5 files changed, 103 insertions(+), 15 deletions(-)
> >>
> >> --
> >> 2.25.1
> >>
> >> ---
> >> Arun R Murthy (5):
> >>       drm/plane: Add new plane property IN_FORMATS_ASYNC
> >>       drm/plane: Expose function to create format/modifier blob
> >>       drm/plane: Function to check async supported modifier/format
> >>       drm/i915/display: Populate list of async supported formats/modifiers
> >>       drm/i915/display: Add function for format_mod_supported_async
> >>
> >>  drivers/gpu/drm/drm_mode_config.c                  |   7 ++
> >>  drivers/gpu/drm/drm_plane.c                        |  72 +++++++++----
> >>  drivers/gpu/drm/i915/display/skl_universal_plane.c | 113
> >++++++++++++++++++---
> >>  include/drm/drm_mode_config.h                      |   6 ++
> >>  include/drm/drm_plane.h                            |  24 +++++
> >>  5 files changed, 188 insertions(+), 34 deletions(-)
> >> ---
> >> base-commit: 08bd590935a5258ffd79355c59adffd72fb2c642
> >> change-id: 20250102-asyn-bf76730501cc
> >>
> >> Best regards,
> >> --
> >> Arun R Murthy <arun.r.murthy@intel.com>
> >>
> >> ---
> >> Changes in v11:
> >> - EDITME: describe what is new in this series revision.
> >> - EDITME: use bulletpoints and terse descriptions.
> >> - Link to v10:
> >> https://lore.kernel.org/r/20250328-asyn-v10-0-8b8ad12cfc97@intel.com
> >>
> >> Changes in v9:
> >> - EDITME: describe what is new in this series revision.
> >> - EDITME: use bulletpoints and terse descriptions.
> >> - Link to v8:
> >> https://lore.kernel.org/r/20250312-asyn-v8-0-0c4cbe5a066d@intel.com
> >>
> >> Changes in v6:
> >> - EDITME: describe what is new in this series revision.
> >> - EDITME: use bulletpoints and terse descriptions.
> >> - Link to v5:
> >> https://lore.kernel.org/r/20250218-asyn-v5-0-7ac5ac4abd4a@intel.com
> >>
> >> ---
> >> Arun R Murthy (3):
> >>       drm/plane: Add new plane property IN_FORMATS_ASYNC
> >>       drm/plane: modify create_in_formats to accommodate async
> >>       drm/i915/display: Add i915 hook for format_mod_supported_async
> >>
> >>  drivers/gpu/drm/drm_mode_config.c                  |  7 +++
> >>  drivers/gpu/drm/drm_plane.c                        | 53 +++++++++++++++-----
> >>  drivers/gpu/drm/i915/display/skl_universal_plane.c | 56
> >++++++++++++++++------
> >>  include/drm/drm_mode_config.h                      |  6 +++
> >>  include/drm/drm_plane.h                            | 17 +++++++
> >>  5 files changed, 112 insertions(+), 27 deletions(-)
> >> ---
> >> base-commit: bc7a84cbc968ce97e581e9e3c2d26fb0ac106482
> >> change-id: 20250102-asyn-bf76730501cc
> >>
> >> Best regards,
> >> --
> >> Arun R Murthy <arun.r.murthy@intel.com>
> >>
> >> ---
> >> Arun R Murthy (3):
> >>       drm/plane: Add new plane property IN_FORMATS_ASYNC
> >>       drm/plane: modify create_in_formats to accommodate async
> >>       drm/i915/display: Add i915 hook for format_mod_supported_async
> >>
> >>  drivers/gpu/drm/drm_mode_config.c                  |  7 ++++
> >>  drivers/gpu/drm/drm_plane.c                        | 49 ++++++++++++++++------
> >>  drivers/gpu/drm/i915/display/i9xx_plane.c          |  6 ++-
> >>  drivers/gpu/drm/i915/display/intel_atomic_plane.c  | 30 ++++++++++++-
> >> drivers/gpu/drm/i915/display/intel_atomic_plane.h  |  6 ++-
> >>  drivers/gpu/drm/i915/display/intel_display.c       | 11 +----
> >>  drivers/gpu/drm/i915/display/skl_universal_plane.c |  5 ++-
> >>  include/drm/drm_mode_config.h                      |  6 +++
> >>  include/drm/drm_plane.h                            | 17 ++++++++
> >>  9 files changed, 111 insertions(+), 26 deletions(-)
> >> ---
> >> base-commit: be5a404c3344b7d794766f045b8f94aa93c42069
> >> change-id: 20250102-asyn-bf76730501cc
> >>
> >> Best regards,
> >> --
> >> Arun R Murthy <arun.r.murthy@intel.com>
> >>
> >> ---
> >> Arun R Murthy (3):
> >>       drm/plane: Add new plane property IN_FORMATS_ASYNC
> >>       drm/plane: modify create_in_formats to accommodate async
> >>       drm/i915/display: Add i915 hook for format_mod_supported_async
> >>
> >>  drivers/gpu/drm/drm_mode_config.c                  |  7 +++
> >>  drivers/gpu/drm/drm_plane.c                        | 52 ++++++++++++++++------
> >>  drivers/gpu/drm/i915/display/i9xx_plane.c          |  6 ++-
> >>  drivers/gpu/drm/i915/display/intel_atomic_plane.c  | 32 ++++++++++++-
> >> drivers/gpu/drm/i915/display/intel_atomic_plane.h  |  6 ++-
> >>  drivers/gpu/drm/i915/display/intel_display.c       | 14 ++----
> >>  drivers/gpu/drm/i915/display/skl_universal_plane.c |  5 ++-
> >>  include/drm/drm_mode_config.h                      |  6 +++
> >>  include/drm/drm_plane.h                            | 17 +++++++
> >>  9 files changed, 117 insertions(+), 28 deletions(-)
> >> ---
> >> base-commit: aba848f9b752cf51474c0c3b1abcf0f572f774dc
> >> change-id: 20250102-asyn-bf76730501cc
> >>
> >> Best regards,
> >> --
> >> Arun R Murthy <arun.r.murthy@intel.com>
> >>
> >> ---
> >> Arun R Murthy (5):
> >>       drm/plane: Add new plane property IN_FORMATS_ASYNC
> >>       drm/plane: modify create_in_formats to acommodate async
> >>       drm/i915/display: Acomodate format check in can_async_flip()
> >>       drm/i915/display: Add i915 hook for format_mod_supported_async
> >>       drm/i915/display: Indexed 8bit format does not support async
> >> flip
> >>
> >>  drivers/gpu/drm/drm_mode_config.c                  |  7 +++
> >>  drivers/gpu/drm/drm_plane.c                        | 52 ++++++++++++++++------
> >>  drivers/gpu/drm/i915/display/i9xx_plane.c          |  6 ++-
> >>  drivers/gpu/drm/i915/display/intel_atomic_plane.c  | 22 ++++++++-
> >> drivers/gpu/drm/i915/display/intel_atomic_plane.h  |  6 ++-
> >>  drivers/gpu/drm/i915/display/intel_display.c       | 14 ++----
> >>  drivers/gpu/drm/i915/display/skl_universal_plane.c |  5 ++-
> >>  include/drm/drm_mode_config.h                      |  6 +++
> >>  include/drm/drm_plane.h                            | 17 +++++++
> >>  9 files changed, 107 insertions(+), 28 deletions(-)
> >> ---
> >> base-commit: c1893793c7d3868fe083bdab33999178337b5561
> >> change-id: 20250102-asyn-bf76730501cc
> >>
> >> Best regards,
> >> --
> >> Arun R Murthy <arun.r.murthy@intel.com>
> >>
> >> ---
> >> Arun R Murthy (5):
> >>       drm/plane: Add new plane property IN_FORMATS_ASYNC
> >>       drm/plane: modify create_in_formats to acommodate async
> >>       drm/i915/display: Acomodate format check in
> >intel_plane_can_async_flip()
> >>       drm/i915/display: Add i915 hook for format_mod_supported_async
> >>       drm/i915/display: Indexed 8bit format does not support async
> >> flip
> >>
> >>  drivers/gpu/drm/drm_mode_config.c                  |  7 +++
> >>  drivers/gpu/drm/drm_plane.c                        | 52 ++++++++++++++++------
> >>  drivers/gpu/drm/i915/display/i9xx_plane.c          |  6 ++-
> >>  drivers/gpu/drm/i915/display/intel_atomic_plane.c  | 18 +++++++-
> >> drivers/gpu/drm/i915/display/intel_atomic_plane.h  |  6 ++-
> >>  drivers/gpu/drm/i915/display/intel_display.c       | 14 ++----
> >>  drivers/gpu/drm/i915/display/skl_universal_plane.c |  5 ++-
> >>  include/drm/drm_mode_config.h                      |  6 +++
> >>  include/drm/drm_plane.h                            | 17 +++++++
> >>  9 files changed, 103 insertions(+), 28 deletions(-)
> >> ---
> >> base-commit: 8a0f86f7106709c73acb1477af9ad5f267d7a340
> >> change-id: 20250102-asyn-bf76730501cc
> >>
> >> Best regards,
> >> --
> >> Arun R Murthy <arun.r.murthy@intel.com>
> >
> >--
> >Ville Syrjälä
> >Intel

-- 
Ville Syrjälä
Intel
