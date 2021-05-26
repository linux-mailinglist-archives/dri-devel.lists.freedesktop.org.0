Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79EC639212E
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 21:54:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11D5D89B20;
	Wed, 26 May 2021 19:54:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0A1189B20;
 Wed, 26 May 2021 19:54:52 +0000 (UTC)
IronPort-SDR: iVuukozEX+I9wMzfpWeOcU0ZOAQw1u+B8kdp+26S72keO93ndkypWf1Y+FqiYX/myt9ySlabWA
 Spmi/WvbDHSg==
X-IronPort-AV: E=McAfee;i="6200,9189,9996"; a="182892574"
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; d="scan'208";a="182892574"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 12:54:52 -0700
IronPort-SDR: iM/bC4LnItm44IRqlhpeBy/l2dsikZq6O1ym25emQdqlOq3wszO9dgE5iZhiwLY9fNcqVtGOHn
 BPcUpxvu3bIA==
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; d="scan'208";a="547339932"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 12:54:49 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
 by paasikivi.fi.intel.com (Postfix) with SMTP id CB43E20337;
 Wed, 26 May 2021 22:54:17 +0300 (EEST)
Date: Wed, 26 May 2021 22:54:17 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 0/4] drm: Finally retire struct drm_format_name_buf
Message-ID: <20210526195417.GI3@paasikivi.fi.intel.com>
References: <20210516121315.30321-1-tzimmermann@suse.de>
 <057a9a16-3ed7-b159-22d7-33f1dc523d14@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <057a9a16-3ed7-b159-22d7-33f1dc523d14@suse.de>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 26, 2021 at 09:21:10PM +0200, Thomas Zimmermann wrote:
> ping for further a-bs / r-bs

Thanks for the ping.

For the series:

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

> 
> Am 16.05.21 um 14:13 schrieb Thomas Zimmermann:
> > This is a cleanup patchset to remove drm_format_name_buf et al. There
> > are two instances in drivers that need to be replaced with the %4cc
> > printk format modifier. Patch 3 was left over back from an earlier
> > patchset. [1] Patch 4 removes struct drm_format_name_buf.
> > 
> > I built-tested with drm-tip. The patchsetcan be mered through drm-misc.
> > 
> > [1] https://lore.kernel.org/dri-devel/20210216155723.17109-1-sakari.ailus@linux.intel.com/
> > 
> > Sakari Ailus (1):
> >    drm: Remove drm_get_format_name()
> > 
> > Thomas Zimmermann (3):
> >    drm/amdgpu: Use %p4cc to print 4CC format
> >    drm/simpledrm: Use %p4cc to print 4CC format
> >    drm/fourcc: Remove struct drm_format_buf_name
> > 
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_display.c |  7 ++----
> >   drivers/gpu/drm/drm_fourcc.c                | 25 ---------------------
> >   drivers/gpu/drm/tiny/simpledrm.c            |  6 ++---
> >   include/drm/drm_fourcc.h                    |  9 --------
> >   4 files changed, 4 insertions(+), 43 deletions(-)
> > 
> > --
> > 2.31.1
> > 
> 

-- 
Sakari Ailus
