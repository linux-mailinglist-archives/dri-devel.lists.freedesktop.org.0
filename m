Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BED3931C7B4
	for <lists+dri-devel@lfdr.de>; Tue, 16 Feb 2021 10:01:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AB256E3A0;
	Tue, 16 Feb 2021 09:01:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6EE16E3A0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Feb 2021 09:01:51 +0000 (UTC)
IronPort-SDR: IVCUWJjnDCIlFZyzdWbO++YnVUiEYtzFS6qYurJY+RatthiHomBC7aw4e4ME06K5MpUKmiXYf3
 ySuF2T97JUnA==
X-IronPort-AV: E=McAfee;i="6000,8403,9896"; a="162605166"
X-IronPort-AV: E=Sophos;i="5.81,183,1610438400"; d="scan'208";a="162605166"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2021 01:01:50 -0800
IronPort-SDR: LkMRYtlXv9UloOOwpLM/5vpLjc+2eXhd+eMmOQeM6UaqSY1CGt2C9ElZRxJFIsu0vUJCXru7UD
 6UvfwBdEBrkw==
X-IronPort-AV: E=Sophos;i="5.81,183,1610438400"; d="scan'208";a="384317333"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2021 01:01:47 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
 by paasikivi.fi.intel.com (Postfix) with SMTP id 4A1D0203BB;
 Tue, 16 Feb 2021 11:01:45 +0200 (EET)
Date: Tue, 16 Feb 2021 11:01:45 +0200
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v7 3/3] drm: Switch to %p4cc format modifier
Message-ID: <20210216090145.GC3@paasikivi.fi.intel.com>
References: <20210215114030.11862-1-sakari.ailus@linux.intel.com>
 <20210215114030.11862-4-sakari.ailus@linux.intel.com>
 <54e8c1d5-bb28-eddd-41ad-a89323650be0@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <54e8c1d5-bb28-eddd-41ad-a89323650be0@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Petr Mladek <pmladek@suse.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-media@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hverkuil@xs4all.nl,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>, Joe Perches <joe@perches.com>,
 mchehab@kernel.org, laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

Thanks for the review.

On Tue, Feb 16, 2021 at 09:37:45AM +0100, Thomas Zimmermann wrote:
> Hi
> 
> Am 15.02.21 um 12:40 schrieb Sakari Ailus:
> > Switch DRM drivers from drm_get_format_name() to %p4cc. This gets rid of a
> > large number of temporary variables at the same time.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/dce_v10_0.c        |  5 ++--
> >   drivers/gpu/drm/amd/amdgpu/dce_v11_0.c        |  5 ++--
> >   drivers/gpu/drm/amd/amdgpu/dce_v6_0.c         |  5 ++--
> >   drivers/gpu/drm/amd/amdgpu/dce_v8_0.c         |  5 ++--
> >   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  5 ++--
> >   .../arm/display/komeda/komeda_format_caps.h   | 11 --------
> >   .../arm/display/komeda/komeda_framebuffer.c   |  4 +--
> >   .../gpu/drm/arm/display/komeda/komeda_plane.c |  6 ++---
> >   drivers/gpu/drm/arm/malidp_mw.c               |  7 ++----
> >   drivers/gpu/drm/drm_atomic.c                  |  8 ++----
> >   drivers/gpu/drm/drm_crtc.c                    |  7 ++----
> >   drivers/gpu/drm/drm_fourcc.c                  | 25 -------------------
> >   drivers/gpu/drm/drm_framebuffer.c             | 11 +++-----
> >   drivers/gpu/drm/drm_mipi_dbi.c                |  5 ++--
> >   drivers/gpu/drm/drm_plane.c                   |  8 ++----
> >   .../gpu/drm/hisilicon/kirin/kirin_drm_ade.c   |  5 ++--
> >   drivers/gpu/drm/i915/display/intel_display.c  | 14 +++--------
> >   .../drm/i915/display/intel_display_debugfs.c  | 19 ++++++--------
> >   drivers/gpu/drm/i915/display/intel_sprite.c   |  6 ++---
> >   drivers/gpu/drm/mcde/mcde_display.c           |  6 ++---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      |  6 ++---
> >   drivers/gpu/drm/nouveau/nouveau_display.c     |  9 +++----
> >   drivers/gpu/drm/radeon/atombios_crtc.c        | 10 +++-----
> >   drivers/gpu/drm/sun4i/sun4i_backend.c         |  6 ++---
> >   drivers/gpu/drm/vkms/vkms_writeback.c         |  7 ++----
> >   drivers/gpu/drm/vmwgfx/vmwgfx_kms.c           | 15 +++++------
> >   include/drm/drm_fourcc.h                      |  1 -
> >   27 files changed, 64 insertions(+), 157 deletions(-)
> 
> This is a nice patchset. For the driver-related changes:
> 
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> 
> But landing this patch will certainly give us build errors. There are at
> least 3 git trees involved: drm-misc-next, amd and i915. I'd expect at least
> one of them to have additional changes that still require
> drm_get_format_name().
> 
> IMHO we should remove drm_get_format_name() in a later patch. Please remove
> the changes in drm_fourcc.{c,h} from this patch and maybe add a TODO comment
> to the declaration that the function is supposed to be removed.
> 
> I would merge the patchset through drm-misc-next. And the final removal
> patch during the next cycle. Ok?

Sounds good. I'll split the third patch into two then. 

-- 
Kind regards,

Sakari Ailus
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
