Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0E9A342CA
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 15:42:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC13E10EACD;
	Thu, 13 Feb 2025 14:42:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M3sivphM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A19B310EACD
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 14:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739457745; x=1770993745;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=er1o0eyyYo2P9RGTb3I/Gv5RkqmtO3GI17fKDgB+d10=;
 b=M3sivphM7rdT/qPgbNsXlFnrcA04xS2dOJ0gMK19TW2/UWJuUhMUtxy1
 ajt1/j02LNQcAXqlvxCV7cexEbfnwaFGoQzodTIOh0Y1dtsMyEXnlExmF
 3VuE2EILeEuFTgHsH1a7gTuE6xJc2ii13K3Lfk6haA+DqjkM14g+D5xl4
 D6NzQfCWjH7HwJllE4AvAFbI1V9456XxvX8u8yW/NQWoCMCIIW6GPj3LI
 joukvUPZwx7guyLWSr9nxGWB8G7VRG+aw3M8Hg21Lb+yA/UWFZy+EcGxv
 /BK4weKZXSLMbDHopEOroYx3gkoW0NAFSfJK5wHSzwC+IK9p0Lxgs/uFK Q==;
X-CSE-ConnectionGUID: C///lEF8Q0+K5IGyTXRy5g==
X-CSE-MsgGUID: YC0F/4HVRhed23bvvdWlgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40423241"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="40423241"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 06:42:25 -0800
X-CSE-ConnectionGUID: BujpYyyvTcC3zLfRCGS0kw==
X-CSE-MsgGUID: 3AO13tUqT5WfVIzwdNn1vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="113346818"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 13 Feb 2025 06:42:23 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 13 Feb 2025 16:42:22 +0200
Date: Thu, 13 Feb 2025 16:42:22 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/6] fbcon: Make cursor_blink=0 work when configured
 before fb devices appear
Message-ID: <Z64EzooZqdfLg0pM@intel.com>
References: <20240923155749.30846-1-ville.syrjala@linux.intel.com>
 <20240923155749.30846-2-ville.syrjala@linux.intel.com>
 <92ed9455-b175-46ef-b0c6-7c79e2b78371@gmx.de>
 <ZvUwCVNPzp1UGY6h@intel.com>
 <34a7d276-ee26-4a8d-b996-87faa5b224c4@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <34a7d276-ee26-4a8d-b996-87faa5b224c4@gmx.de>
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

On Thu, Sep 26, 2024 at 12:13:04PM +0200, Helge Deller wrote:
> On 9/26/24 11:57, Ville Syrjälä wrote:
> > On Thu, Sep 26, 2024 at 08:08:07AM +0200, Helge Deller wrote:
> >> Hi Ville,
> >>
> >> On 9/23/24 17:57, Ville Syrjala wrote:
> >>> Currently setting cursor_blink attribute to 0 before any fb
> >>> devices are around does absolutely nothing. When fb devices appear
> >>> and fbcon becomes active the cursor starts blinking. Fix the problem
> >>> by recoding the desired state of the attribute even if no fb devices
> >>> are present at the time.
> >>>
> >>> Also adjust the show() method such that it shows the current
> >>> state of the attribute even when no fb devices are in use.
> >>>
> >>> Note that store_cursor_blink() is still a bit dodgy:
> >>> - seems to be missing some of the other checks that we do
> >>>     elsewhere when deciding whether the cursor should be
> >>>     blinking or not
> >>> - when set to 0 when the cursor is currently invisible due
> >>>     to blinking, the cursor will remains invisible. We should
> >>>     either explicitly make it visible here, or wait until the
> >>>     full blink cycle has finished.
> >>
> >> are you planning to send follow-up patches to address those shortcomings?
> >
> > Nope. I don't really care about those as I never plan to
> > turn the cursor blinking back on after turning it off via
> > udev.
> 
> Sad, but OK. I will look into this when I find time.
> I'd hoped to push those patches upstream during this merge window,
> but then I think I have to delay them at least until kernel 6.13.

What happened to these? Not seeing them anywhere...

-- 
Ville Syrjälä
Intel
