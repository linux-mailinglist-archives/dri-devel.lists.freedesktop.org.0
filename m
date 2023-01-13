Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBCE669CC8
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 16:47:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B818710E1CF;
	Fri, 13 Jan 2023 15:47:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E7BF10E1CF;
 Fri, 13 Jan 2023 15:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673624867; x=1705160867;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=drD33sAx5gjjcRkozsAJSrAFVmd5zo3pbQJ6aOlk0jQ=;
 b=Akq2tn/JlKj7cSQA/drioYRYNEDLspO1li9QI2gSEH9wnURIygoNG114
 lWj6H/rb/XfjxTP6CyeDVe9eio5DogNo2QBgiezt9DcMrE7KuLto5eI3g
 L4I0y+Xp8EkSCLcCrp/DKiqMpID8bRpoD4f2w0mtbB8Myu9rhEGpz+TzY
 EapoXPI5OcnFNLo8z53sJRkZYi4IH+D3KoLPeTxbnb6v8gXEv7MqNGRhG
 +TWyCxiHvyhb66IECUwNJ4uoxQiAYU1YEiUrxExE8UWo8n1+2O1Vrerta
 yysCjAhDQdqWT/Ok8Jw0Pg1p9oJkOAfOXREYJbIsyq4wDJgWQdV939jZQ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10589"; a="307565081"
X-IronPort-AV: E=Sophos;i="5.97,214,1669104000"; d="scan'208";a="307565081"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2023 07:47:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10589"; a="688784173"
X-IronPort-AV: E=Sophos;i="5.97,214,1669104000"; d="scan'208";a="688784173"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.55])
 by orsmga008.jf.intel.com with SMTP; 13 Jan 2023 07:47:40 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 13 Jan 2023 17:47:39 +0200
Date: Fri, 13 Jan 2023 17:47:39 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 02/10] drm: Include <linux/of.h> where needed
Message-ID: <Y8F9G7cJfMRZjuMK@intel.com>
References: <20230111130206.29974-1-tzimmermann@suse.de>
 <20230111130206.29974-3-tzimmermann@suse.de>
 <Y77fCmivLygHyuZ+@intel.com> <Y8F0tM/mt0EQyfwo@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y8F0tM/mt0EQyfwo@ravnborg.org>
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
Cc: f.fainelli@gmail.com, Thomas Zimmermann <tzimmermann@suse.de>,
 amd-gfx@lists.freedesktop.org, liviu.dudau@arm.com,
 dri-devel@lists.freedesktop.org, thierry.reding@gmail.com,
 james.qian.wang@arm.com, alexander.deucher@amd.com,
 bcm-kernel-feedback-list@broadcom.com, christian.koenig@amd.com,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 13, 2023 at 04:11:48PM +0100, Sam Ravnborg wrote:
> Hi Ville,
> On Wed, Jan 11, 2023 at 06:08:42PM +0200, Ville Syrjälä wrote:
> > On Wed, Jan 11, 2023 at 02:01:58PM +0100, Thomas Zimmermann wrote:
> > > Include <linux/of.h> in source files that need it. Some of DRM's
> > > source code gets OF header via drm_crtc_helper.h and <linux/fb.h>,
> > > which can leed to unnecessary recompilation.
> > > 
> > > In drm_modes.c, add a comment on the reason for still including
> > > <linux/fb.h>. The header file is required to get KHZ2PICOS(). The
> > > macro is part of the UAPI headers, so it cannot be moved to a less
> > > prominent location.
> > 
> > I never liked that KHZ2PICOS() thing in there. Maybe we should
> > just nuke it and see if anyone notices?
> https://github.com/search?q=KHZ2PICOS&type=code

No idea what relevance any of those have.

> 
> tells me that it will be noticed.
> So it is part of the UAPI

The only thing it does it potentially mistake some modes for being
equal when they are not. So basically just second guessing what the
driver/hardware is actually capable of doing.

-- 
Ville Syrjälä
Intel
