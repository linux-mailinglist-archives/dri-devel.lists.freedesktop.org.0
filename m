Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6CD32D3ED5
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 10:34:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B76989B83;
	Wed,  9 Dec 2020 09:34:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91E3089B27;
 Wed,  9 Dec 2020 09:34:51 +0000 (UTC)
IronPort-SDR: cuifdcYw8CWs53sCNG45E7fIbC6E6mgdycIoc3+xXxCAfPalKlQIIrMUJcQmCi291b0X52sVW+
 40MQvNj2qXJA==
X-IronPort-AV: E=McAfee;i="6000,8403,9829"; a="235646498"
X-IronPort-AV: E=Sophos;i="5.78,405,1599548400"; d="scan'208";a="235646498"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2020 01:34:50 -0800
IronPort-SDR: SlfBbmyl/JrvJg1nZtRgV8ahojN7+ZJRIEi5Ziwcyq+8lsSgHukOpHMJlLRn43+P8gATDTowPc
 Rx04X08oOUOQ==
X-IronPort-AV: E=Sophos;i="5.78,405,1599548400"; d="scan'208";a="332870199"
Received: from mmarkowi-mobl.ger.corp.intel.com (HELO localhost)
 ([10.213.20.177])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2020 01:34:47 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 0/6] drm/dsc, drm/dp, and /drm/i915: rc model size updates
In-Reply-To: <cover.1607429866.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1607429866.git.jani.nikula@intel.com>
Date: Wed, 09 Dec 2020 11:34:44 +0200
Message-ID: <87im9b9vbf.fsf@intel.com>
MIME-Version: 1.0
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
Cc: manasi.d.navare@intel.com, Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 08 Dec 2020, Jani Nikula <jani.nikula@intel.com> wrote:
> For whatever reason this old series was never merged. Please let's get
> this done.

Daniel, Maarten, may I have an ack to merge patches 1 and 4 via
drm-intel?

BR,
Jani.


>
> For i915 DP this still needs a patch to start using the model size from
> DPCD.
>
> BR,
> Jani.
>
> Jani Nikula (6):
>   drm/dsc: use rc_model_size from DSC config for PPS
>   drm/i915/dsc: configure hardware using specified rc_model_size
>   drm/i915/dsc: make rc_model_size an encoder defined value
>   drm/dsc: add helper for calculating rc buffer size from DPCD
>   drm/i915/bios: fill in DSC rc_model_size from VBT
>   drm/i915/dsi: use VBT data for rc_model_size
>
>  drivers/gpu/drm/drm_dsc.c                 | 30 +++++++++++++++++++++--
>  drivers/gpu/drm/i915/display/intel_bios.c | 11 +++------
>  drivers/gpu/drm/i915/display/intel_dp.c   |  8 ++++++
>  drivers/gpu/drm/i915/display/intel_vdsc.c |  4 +--
>  include/drm/drm_dsc.h                     |  1 +
>  5 files changed, 41 insertions(+), 13 deletions(-)

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
