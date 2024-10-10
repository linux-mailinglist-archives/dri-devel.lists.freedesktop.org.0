Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE7299924E
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 21:28:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 683BD10E9B9;
	Thu, 10 Oct 2024 19:28:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UdZ0L3HE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B6A610E9B9;
 Thu, 10 Oct 2024 19:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728588496; x=1760124496;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=zjCPX19HZWLXM6UD/xOw+yEVVVpZMpfRjy8JE3dxHq4=;
 b=UdZ0L3HE4h0YJpKPAKB+bnt1ZOIiuPuJe4cdMyiyPtJ9oR5Gunq6C7i8
 1hW8/Ie02HtnTgp7pDVQ9n8ZJiKaC1CExBysO2DVHgBBloMXVuPX9JYN1
 roUEajvQA7Ud9P+CglPmP5gBmqnvTUGhJBvSSk1w0K+599AA5sncp4P8T
 UZxwhB/7dWh66BB4nXIJml20xchDRS7y60kMehsYpw3t3/opuvwOXCnyN
 hYdtpMUDOi1sozRNNkwzLQXxJ+UILOd8IlOQWzd7W+mYUjAuudjpyxNRz
 a2Mr7ZGW6BzCG7z4WtiAyrRdn79+odDc/vmWq6UsptAVN2jwywyuv+g5R w==;
X-CSE-ConnectionGUID: rp1dhMx0TyiXxV6/6kjrxA==
X-CSE-MsgGUID: SzO5cvzdTq2GcvpQCM9Y1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="39364990"
X-IronPort-AV: E=Sophos;i="6.11,193,1725346800"; d="scan'208";a="39364990"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 12:28:15 -0700
X-CSE-ConnectionGUID: aWS2LaMDRIK7UaKBeM/J3A==
X-CSE-MsgGUID: UROcXiHfTG+GDYjHWSdlXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,193,1725346800"; d="scan'208";a="76782588"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 10 Oct 2024 12:28:12 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 10 Oct 2024 22:28:11 +0300
Date: Thu, 10 Oct 2024 22:28:11 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 4/8] drm/client: Make copies of modes
Message-ID: <Zwgqy6jxFzCf7loL@intel.com>
References: <20241003113304.11700-1-ville.syrjala@linux.intel.com>
 <20241003113304.11700-5-ville.syrjala@linux.intel.com>
 <d6678cad-7017-4d46-914f-27126d894b91@suse.de>
 <ZwWJGGh-ys9CtrsE@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZwWJGGh-ys9CtrsE@intel.com>
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

On Tue, Oct 08, 2024 at 10:33:44PM +0300, Ville Syrjälä wrote:
> On Mon, Oct 07, 2024 at 09:36:13AM +0200, Thomas Zimmermann wrote:
> > Hi
> > 
> > Am 03.10.24 um 13:33 schrieb Ville Syrjala:
> > > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > >
> > > drm_client_firmware_config() is currently picking up the current
> > > mode of the crtc via the legacy crtc->mode, which is not supposed
> > > to be used by atomic drivers at all. We can't simply switch over
> > > to the proper crtc->state->mode because we drop the crtc->mutex
> > > (which protects crtc->state) before the mode gets used.
> > >
> > > The most straightforward solution to extend the lifetime of
> > > modes[] seem to be to make full copies of the modes instead
> > > of just storing pointers. We do have to replace the NULL checks
> > > with something else though. Checking that mode->clock!=0
> > > should be sufficient.
> > >
> > > And with this we can undo also commit 3eadd887dbac
> > > ("drm/client:Fully protect modes[] with dev->mode_config.mutex")
> > > as the lifetime of modes[] no longer has anything to do with
> > > that lock.
> > 
> > I think it would be a lot better to first build that mode list while 
> > holding the mutex, and afterwards copy the resulting modes before 
> > releasing the lock. The code below is convoluted with drm_mode_copy().
> 
> My first thought was to make copies but still keep track
> of pointers. That idea was a complete disaster because you
> now had to carefully free the modes on the list.
> 
> I then considred some kind of double list approach, but that
> too seemed more complicated/confusing than the (IMO fairly
> straightforward) apporach I ended up with. I'd prefer to reduce
> the nummber of arrays this thing uses rather than increase them.

Had another look at the double array approach, and still
tought the result would be quite disgusting.

So I think the only other viable option is to keep the single
array of pointers, and stick copies onto it. But that introduces
more ways to leak memory and/or access already freed memory.
I don't really like the extra complexity that this requires.
It'd perhaps be more palatable if the whole thing would be
redesigned to be more AoS instead of SoA...

-- 
Ville Syrjälä
Intel
