Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6D16994D5
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 13:53:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 206CA10E16F;
	Thu, 16 Feb 2023 12:53:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E185710E178
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 12:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676551981; x=1708087981;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=STp968vNJjTs7QU1ZnUXo9mg8t5kgUObqdNlZ4ETOKM=;
 b=cBxcW7IqsFzNVmFfrMou/XbLwGh6h9S2xsUr4X/uH6zx9b8jS5hrtazt
 Krr7/xsIA3U9BctdyqN8mKOTW4sNko2TELS8m2BGLjoS5D0i7iKbhDsNn
 xRa7hh6sb46OSM8mRm5TNr+rZ8pHfAKacd+hGUVg2dyxVX9+vLoCghVwW
 pwtGJw8R704d+bImWKvkujcP+typ5hNh5aZ5gvRZZ4NmrSJoP5O91HC4Y
 wtznHDrX6VquT0o7hhFIc9bZ5510EVsaN8/hQI83Y63lzjXchcq1Ko90R
 hP1aHCUc3rLssdDWjHDynU058Tn4GUg2dAKUG8oX+5oZLHoVNSV8TVFWl w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="417929909"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="417929909"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 04:53:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="794013670"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="794013670"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.168])
 by orsmga004.jf.intel.com with SMTP; 16 Feb 2023 04:52:57 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 16 Feb 2023 14:52:51 +0200
Date: Thu, 16 Feb 2023 14:52:51 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 17/17] drm/cirrus: Use VGA macro constants to unblank
Message-ID: <Y+4nIxRhF7KF2Qo0@intel.com>
References: <20230215161517.5113-1-tzimmermann@suse.de>
 <20230215161517.5113-18-tzimmermann@suse.de>
 <20230216113330.rmzmkdvpxdqk2nrd@sirius.home.kraxel.org>
 <306e110d-4d1f-cb9c-6f9b-c8a5ddd48a61@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <306e110d-4d1f-cb9c-6f9b-c8a5ddd48a61@suse.de>
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
Cc: javierm@redhat.com, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, Gerd Hoffmann <kraxel@redhat.com>,
 airlied@redhat.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 16, 2023 at 01:03:02PM +0100, Thomas Zimmermann wrote:
> Hi,
> 
> thanks for taking a look at the patches.
> 
> Am 16.02.23 um 12:33 schrieb Gerd Hoffmann:
> > On Wed, Feb 15, 2023 at 05:15:17PM +0100, Thomas Zimmermann wrote:
> >> Set the VGA bit for unblanking with macro constants instead of magic
> >> values. No functional changes.
> > 
> > blank/unblank should work simliar to bochs (see commit 250e743915d4),
> > that is maybe a nice thing to add of you modernize the driver anyway.
> Yeah, it's the VGA PAS field. [1] But is it really called blanking? PAS 
> controls palette access, but blanking is sounds more like DPMS.

Why aren't people just using the normal way of flipping the
screen off bit in sequencer register 01?


> 
> The PAS setting is actually part of the primary plane, so it's current 
> location in the CRTC code is misleading. I didn't want to change the 
> driver logic too much, but I guess I'll fix that in the next iteration.
> 
> Best regards
> Thomas
> 
> [1] 
> https://web.stanford.edu/class/cs140/projects/pintos/specs/freevga/vga/attrreg.htm#3C0
> 
> > 
> > take care,
> >    Gerd
> > 
> 
> -- 
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 Nürnberg, Germany
> (HRB 36809, AG Nürnberg)
> Geschäftsführer: Ivo Totev




-- 
Ville Syrjälä
Intel
