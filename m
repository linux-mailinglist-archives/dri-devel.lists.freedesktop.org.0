Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F0766CFC6
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 20:49:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3710510E4A8;
	Mon, 16 Jan 2023 19:49:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FE6510E4A8;
 Mon, 16 Jan 2023 19:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673898574; x=1705434574;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=UjjYcIIEs2sCU+6v6CismVdmMA3nx+5If64m+vcvtU4=;
 b=Sd5HcPqfU/Ffm+tTL+hUvlk1ZlO/kYxcBRFrQA8/78BOaqsY7k/jjwQm
 dN9KrgVYXvzCrr664J1LCPjaXOTbYQk+RPBO36yq/E9hxozhlbF2jmwBE
 2I1sdAGnfhg7PQzIMFYzC0WhJxo+euM98T+FEEoubXB6GXnzqTUnQaYeM
 lM3m/TrkX15liIFUyVTHEfEV9gb/Dy4I1C5ODJF3YdjbGpP/jzkuLxhpj
 OeSErJHI4zZBPKlq/8CP/+5jM7fe23/+rk/s38SXAsToR3lmDIR9LUDP+
 lFR2SuiLNk8V+jwV8AMmkEkirg3vwueCtZeuJcQeiHcnQO1angnkG3/wG w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="326606562"
X-IronPort-AV: E=Sophos;i="5.97,221,1669104000"; d="scan'208";a="326606562"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2023 11:49:33 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="767019045"
X-IronPort-AV: E=Sophos;i="5.97,221,1669104000"; d="scan'208";a="767019045"
Received: from rhormila-mobl2.ger.corp.intel.com (HELO intel.com)
 ([10.251.222.100])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2023 11:49:30 -0800
Date: Mon, 16 Jan 2023 20:49:27 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/mtl: Connect root sysfs entries to
 GT0
Message-ID: <Y8WqRz7H+Z4hQfDN@ashyti-mobl2.lan>
References: <20230113022752.3151066-1-vinay.belgaumkar@intel.com>
 <874jsvazvi.wl-ashutosh.dixit@intel.com>
 <db1160e1-cfc1-08d0-08b7-84909608b465@intel.com>
 <87358faw34.wl-ashutosh.dixit@intel.com>
 <82e45200-8a95-ec9a-6dba-766f6c23c7fd@intel.com>
 <Y8Wea4b+mot7oVrB@ashyti-mobl2.lan>
 <3c193ee6-b1cf-52dc-531c-804f8cbe1e4d@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3c193ee6-b1cf-52dc-531c-804f8cbe1e4d@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, "Dixit,
 Ashutosh" <ashutosh.dixit@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Vinay,

On Mon, Jan 16, 2023 at 11:35:41AM -0800, Belgaumkar, Vinay wrote:
> 
> On 1/16/2023 10:58 AM, Andi Shyti wrote:
> > Hi,
> > 
> > On Thu, Jan 12, 2023 at 08:48:11PM -0800, Belgaumkar, Vinay wrote:
> > > On 1/12/2023 8:37 PM, Dixit, Ashutosh wrote:
> > > > On Thu, 12 Jan 2023 20:26:34 -0800, Belgaumkar, Vinay wrote:
> > > > > I think the ABI was changed by the patch mentioned in the commit
> > > > > (a8a4f0467d70).
> > > > The ABI was originally changed in 80cf8af17af04 and 56a709cf77468.
> > In theory the ABI has never changed, we just needed to agree once
> > and for all what to do when reading the upper level interface.
> > There has never been a previous multitile specification before
> > this change.
> > 
> > There have been long and exhaustive discussions on what to do and
> > the decision is that in some cases we show the average, in others
> > the maximum. Never the GT0, though.
> > 
> > > Yes, you are right. @Andi, did we have a plan to update the IGT tests that
> > > use these interfaces to properly refer to the per GT entries as well? They
> > > now receive average values instead of absolute, hence will fail on a
> > > multi-GT device.
> > I don't know what's the plan for igt's.
> > 
> > Which tests are failing? I think we shouldn't be using the upper
> > level interfaces at all in IGT's. Previously there has been an
> > error printed on dmesg when this was happening. The error has
> > been removed in order to set the ABI as agreed above.
> 
> Tests like perf_mu and gem_ctx_freq will fail as they read upper level sysfs
> entries and expect them to change as per the test. I think this includes all
> of the tests that read RC6 or Trubo related sysfs entries for that matter.

First of all I hope we are talking about multitile machines. In
a single tile we shouldn't see any difference. If there is, then
there is a bug.

I think the tests need to be updated. In a multitile card we have
decided that reading from the upper interfaces would provide a
somehow meaningful value for all the GTs. It's like asking "what
is the RC6 for all the GTs in one number?" or "what is the
frequency for all the GTs in one single frequency?". Providing
the value of GT0 is misleading and with Joonas we agreed that RC6
would provide the average, while the frequencies would provide
the maximum. This when reading.

When writing, instead, the command sent to the upper layers
applies to all the GTs.

The original approach was to mark the upper interfaces as
deprecated, for this reason I added initially an error message in
order to avoid confusion and force IGTs to update. But the error
message was removed and meanwhile we agreed to give some meaning
to the upper interfaces.

Do you need help with updating the IGTs?

Andi

> Thanks,
> 
> Vinay.
> 
> > 
> > Andi
