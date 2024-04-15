Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 951498A5091
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 15:12:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B25B112569;
	Mon, 15 Apr 2024 13:12:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YgManY5k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64215112568;
 Mon, 15 Apr 2024 13:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713186738; x=1744722738;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=mNAj3Ryy9jivqTI9PPpQtWLl4nojXJetPRW08D+N/5k=;
 b=YgManY5k/+lI2x29h32jTwPuLMLrN/Q+7DxlPoBb2anURhRkP0fqleAG
 DEnrffk0dIIL0n5SzavWGRiPeUGB6a12OqticPVaOii7kI7QmnCMtacZN
 4aWlXpHdNblxaEcBdMUn5ew7OYRaNvFFjbcKtu/NYZoFAuotq49BSRw9A
 L7ov0g/Ju8LhQzlDH3+W7cLEmXmQ3dnfcAdasvOD8+n5fXlrDWxJSAEm4
 UVjUaTQ0ykWdcrwYMEGTDtUJ62UyyTmrFWokO2srC+81UyKtr7ywuTIeh
 ft+B6UdSPCZO5gUKXhnRqS0z3kaS8fCd0plKlRPJNyK0YaVr8i/CiKgq0 w==;
X-CSE-ConnectionGUID: kf1qIhdESFObKCbF41Ym5Q==
X-CSE-MsgGUID: dMRgs4MuRrey94dow5XzOA==
X-IronPort-AV: E=McAfee;i="6600,9927,11044"; a="8432642"
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; 
   d="scan'208";a="8432642"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 06:09:00 -0700
X-CSE-ConnectionGUID: wP/4heWQRo2Y8WtAMU42Aw==
X-CSE-MsgGUID: wTNMkuADR/a7+meNGBpdBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; d="scan'208";a="26462502"
Received: from lcariou-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.61.121])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 06:08:56 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Bjorn Helgaas <bhelgaas@google.com>, Daniel
 Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@gmail.com>, Hans de Goede
 <hdegoede@redhat.com>, Ilpo =?utf-8?Q?J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, Jaroslav Kysela <perex@perex.cz>, Lucas De
 Marchi <lucas.demarchi@intel.com>, Takashi Iwai <tiwai@suse.com>, Tomas
 Winkler <tomas.winkler@intel.com>
Subject: Re: [PATCH 00/10] drm: move Intel drm headers to a subdirectory
In-Reply-To: <cover.1712743191.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1712743191.git.jani.nikula@intel.com>
Date: Mon, 15 Apr 2024 16:08:45 +0300
Message-ID: <87bk6a3h9e.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Wed, 10 Apr 2024, Jani Nikula <jani.nikula@intel.com> wrote:
> We've accumulated enough Intel specific header files under include/drm
> that they warrant a subdirectory of their own. Clean up the top drm
> header directory by moving the Intel files under include/drm/intel.
>
> Since i915 is most impacted, I suggest merging the lot via
> drm-intel-next. Please ack if this is fine for you.

While all of this is trivial, merely changing some includes, please
consider acking the changes to your corner of the kernel.

Thanks,
Jani.


>
> BR,
> Jani.
>
>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Dave Airlie <airlied@gmail.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Takashi Iwai <tiwai@suse.com>
> Cc: Tomas Winkler <tomas.winkler@intel.com>
>
> Jani Nikula (10):
>   drm/i915: use system include for drm headers
>   drm: move intel-gtt.h under include/drm/intel
>   drm: move i915_gsc_proxy_mei_interface.h under include/drm/intel
>   drm: move i915_component.h under include/drm/intel
>   drm: move intel_lpe_audio.h under include/drm/intel
>   drm: move i915_drm.h under include/drm/intel
>   drm: move i915_pxp_tee_interface.h under include/drm/intel
>   drm: move i915_pciids.h under include/drm/intel
>   drm: move xe_pciids.h under include/drm/intel
>   drm: move i915_hdcp_interface.h under include/drm/intel
>
>  arch/x86/kernel/early-quirks.c                         | 4 ++--
>  drivers/char/agp/intel-agp.c                           | 2 +-
>  drivers/char/agp/intel-gtt.c                           | 2 +-
>  drivers/gpu/drm/i915/display/intel_audio.c             | 2 +-
>  drivers/gpu/drm/i915/display/intel_display_device.c    | 2 +-
>  drivers/gpu/drm/i915/display/intel_display_types.h     | 2 +-
>  drivers/gpu/drm/i915/display/intel_hdcp.c              | 2 +-
>  drivers/gpu/drm/i915/display/intel_hdcp_gsc.c          | 2 +-
>  drivers/gpu/drm/i915/display/intel_hdcp_gsc_message.c  | 2 +-
>  drivers/gpu/drm/i915/display/intel_hdmi.c              | 2 +-
>  drivers/gpu/drm/i915/display/intel_lpe_audio.c         | 2 +-
>  drivers/gpu/drm/i915/gem/i915_gem_stolen.c             | 2 +-
>  drivers/gpu/drm/i915/gt/intel_ggtt.c                   | 4 ++--
>  drivers/gpu/drm/i915/gt/intel_ggtt_gmch.c              | 2 +-
>  drivers/gpu/drm/i915/gt/intel_gt.c                     | 2 +-
>  drivers/gpu/drm/i915/gt/intel_rps.c                    | 2 +-
>  drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c           | 4 ++--
>  drivers/gpu/drm/i915/i915_pci.c                        | 2 +-
>  drivers/gpu/drm/i915/intel_device_info.c               | 2 +-
>  drivers/gpu/drm/i915/pxp/intel_pxp_tee.c               | 4 ++--
>  drivers/gpu/drm/i915/soc/intel_gmch.c                  | 2 +-
>  drivers/gpu/drm/xe/display/xe_hdcp_gsc.c               | 2 +-
>  drivers/gpu/drm/xe/xe_ggtt.c                           | 2 +-
>  drivers/gpu/drm/xe/xe_gsc_proxy.c                      | 4 ++--
>  drivers/gpu/drm/xe/xe_pci.c                            | 2 +-
>  drivers/misc/mei/gsc_proxy/mei_gsc_proxy.c             | 4 ++--
>  drivers/misc/mei/hdcp/mei_hdcp.c                       | 4 ++--
>  drivers/misc/mei/pxp/mei_pxp.c                         | 4 ++--
>  drivers/platform/x86/intel_ips.c                       | 2 +-
>  include/drm/{ =3D> intel}/i915_component.h               | 2 +-
>  include/drm/{ =3D> intel}/i915_drm.h                     | 0
>  include/drm/{ =3D> intel}/i915_gsc_proxy_mei_interface.h | 0
>  include/drm/{ =3D> intel}/i915_hdcp_interface.h          | 0
>  include/drm/{ =3D> intel}/i915_pciids.h                  | 0
>  include/drm/{ =3D> intel}/i915_pxp_tee_interface.h       | 0
>  include/drm/{ =3D> intel}/intel-gtt.h                    | 0
>  include/drm/{ =3D> intel}/intel_lpe_audio.h              | 0
>  include/drm/{ =3D> intel}/xe_pciids.h                    | 0
>  include/sound/hdaudio.h                                | 2 +-
>  sound/x86/intel_hdmi_audio.c                           | 2 +-
>  40 files changed, 40 insertions(+), 40 deletions(-)
>  rename include/drm/{ =3D> intel}/i915_component.h (98%)
>  rename include/drm/{ =3D> intel}/i915_drm.h (100%)
>  rename include/drm/{ =3D> intel}/i915_gsc_proxy_mei_interface.h (100%)
>  rename include/drm/{ =3D> intel}/i915_hdcp_interface.h (100%)
>  rename include/drm/{ =3D> intel}/i915_pciids.h (100%)
>  rename include/drm/{ =3D> intel}/i915_pxp_tee_interface.h (100%)
>  rename include/drm/{ =3D> intel}/intel-gtt.h (100%)
>  rename include/drm/{ =3D> intel}/intel_lpe_audio.h (100%)
>  rename include/drm/{ =3D> intel}/xe_pciids.h (100%)

--=20
Jani Nikula, Intel
