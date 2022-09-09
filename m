Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F085B36E4
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 14:05:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 555FA10ECDD;
	Fri,  9 Sep 2022 12:05:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C4A110ECD8;
 Fri,  9 Sep 2022 12:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662725119; x=1694261119;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=gb8g6gV51+OCvjBV8kSN7bQCoomHa79HPQes+PnOt8M=;
 b=RvCPAIN/1QSRmsGBh99QiTrfvog1sb/Xys0iqaXHzMqkFJBt1ExLGWr1
 Z5Z0OD5olHCvBUkDDkZ4a20VjQxWLBDruJm/amI7i4+4VmWrT6kECGozd
 Hg4gB7yk3fNJbrAkklOmHHxpMws59DmApaGTfNEtD8aDaazuQadAgfe0r
 HTyLBPtR58IqHJxCFQZddRewVO4BE3OII0Tj3EaXB/yCrkLjF4WAuSyM3
 rMESGsXIca+kXyeC14x4ymoWsOLCpwvA0kkBhyT/gxF3FZsEeX2x8A+n1
 E7uOQJvF5y6/srAtQHoMg3P1qE9dpb1kJmTpX1VnHfDRvSRPaVb6Aoo2f Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="280483181"
X-IronPort-AV: E=Sophos;i="5.93,303,1654585200"; d="scan'208";a="280483181"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2022 05:05:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,303,1654585200"; d="scan'208";a="615251370"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by orsmga002.jf.intel.com with SMTP; 09 Sep 2022 05:05:15 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 09 Sep 2022 15:05:15 +0300
Date: Fri, 9 Sep 2022 15:05:15 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: Meeting (BOF) at Plumbers Dublin to discuss backlight brightness
 as connector object property RFC?
Message-ID: <Yxsr+11xH7n92p4e@intel.com>
References: <c796e05d-6c74-3011-89d3-226e54455f06@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c796e05d-6c74-3011-89d3-226e54455f06@redhat.com>
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 wayland <wayland-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 09, 2022 at 12:23:53PM +0200, Hans de Goede wrote:
> Hi All,
> 
> I will be at Plumbers Dublin next week and I was wondering if
> anyone interested in this wants to get together for a quick
> discussion / birds of a feather session about this?
> 
> I have just posted version 2 of the RFC:
> https://lore.kernel.org/dri-devel/b61d3eeb-6213-afac-2e70-7b9791c86d2e@redhat.com/T/#u
> 
> If you are interested in meeting up please send me
> an email off-list (no need to spam the list further with this)
> also please let me know if there are any times which do not
> work for you, and/or times which have your preference.
> 
> I don't have a specific room/time for this yet, but if people
> are interested I will try to get a room from the organization
> and if that does not work out I'm sure we will figure something
> out.
> 
> One of the things which I would like to discuss is using
> the backlight brightness as connector object property vs
> external (not part of the compositor) tools to control the
> brightness like e.g. xbacklight, quoting from the RFC:
> 
> "people using
> non fully integrated desktop environments like e.g. sway often use custom
> scripts binded to hotkeys to get functionality like the brightness
> up/down keyboard hotkeys changing the brightness. This typically involves
> e.g. the xbacklight utility.
> 
> Even if the xbacklight utility is ported to use kms with the new connector
> object brightness properties then this still will not work because
> changing the properties will require drm-master rights and e.g. sway will
> already hold those."
> 
> Note one obvious solution here would be for these use-cases to keep
> using the old /sys/class/backlight interface for this, with the downside
> that we will then be stuck to that interface for ever...

Isn't xbacklight the thing that only works when you *have* the
backlight property? Ie. currently only works on intel ddx which
adds a custom property but doesn't work on modesetting ddx for
example.

-- 
Ville Syrjälä
Intel
