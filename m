Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9BBC9DA848
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2024 14:13:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 162E010E269;
	Wed, 27 Nov 2024 13:13:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kJqxrUQj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16A8F10E178;
 Wed, 27 Nov 2024 13:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732713203; x=1764249203;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=8GWzr3fI2HSf08W+WGK1x+KKN3Ch3Q2YXbioJAev1fQ=;
 b=kJqxrUQjftpsdmdgDszirGFibZvF/C+Uiz5N3nuYrJdNDzxY9pNLRNHm
 cUqA6JGGLavzGyuy1rFLBygd/2m+sR8akYthxdxtfk9zDxUHN+hNL4yKS
 QmsfNDTcKqjmWeI26DGFq5HROvyouXAAziW3rr1Ngb+XYqMKsRPAOxywS
 P1Sq+3kKctUrh4f75WU/S0RHowue0uc7vRVoYvl9PNgtfIC1pOY02JcKt
 EFTsyLlIMR+H9p8XWhINw/yyo5WSMVtHcRy0jd8TahYltCo+76hXCpgUN
 M/GkIFXil3ki74RgZ8WlNq71I2aquK5s7fwk0Vg/d2baGb6u+gHT9F/pf w==;
X-CSE-ConnectionGUID: 2X88kL2rQtCADbJrOPPIHw==
X-CSE-MsgGUID: 7l2tNGEaRbqH5cAMm97oog==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="32867198"
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; d="scan'208";a="32867198"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2024 05:13:23 -0800
X-CSE-ConnectionGUID: E9ojOoSDTMqPAB+cpy4uWg==
X-CSE-MsgGUID: /XWndkHaSyyEw12mWXJgbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; d="scan'208";a="96375078"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.110])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2024 05:13:20 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 imre.deak@intel.com, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH 0/3] drm/dp: extract payload helpers
In-Reply-To: <cover.1731942780.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1731942780.git.jani.nikula@intel.com>
Date: Wed, 27 Nov 2024 15:13:17 +0200
Message-ID: <87sercx1jm.fsf@intel.com>
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

On Mon, 18 Nov 2024, Jani Nikula <jani.nikula@intel.com> wrote:
> Add some mst topology manager independent payload helpers.

Cc: maintainers, Lyude, are we good to go with this?

BR,
Jani.


>
> Jani Nikula (3):
>   drm/dp: extract drm_dp_dpcd_poll_act_handled()
>   drm/dp: extract drm_dp_dpcd_write_payload()
>   drm/dp: extract drm_dp_dpcd_clear_payload()
>
>  drivers/gpu/drm/display/drm_dp_helper.c       | 124 +++++++++++++++++-
>  drivers/gpu/drm/display/drm_dp_mst_topology.c |  88 +------------
>  include/drm/display/drm_dp_helper.h           |   5 +
>  3 files changed, 133 insertions(+), 84 deletions(-)

-- 
Jani Nikula, Intel
