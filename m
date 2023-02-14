Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27AA2696285
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 12:35:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F11AD10E08C;
	Tue, 14 Feb 2023 11:35:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD28610E08C;
 Tue, 14 Feb 2023 11:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676374536; x=1707910536;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=jtZ5PCi8GSmEnz2460D5rlnWgt7rQHRU2Rt5k9+j6u4=;
 b=ZL/3P3IBl1n5noh6W1Lz4e2n2XUkrkDwbQZYUi1A9oVIdNaXKX9VjeLi
 lKntBl1/36mMEds9QtpNlI9CGdW/E6xdVElyiu8i2/kSxqI4W9aivJw+N
 kOwZc/opi7PG+iDlKtQrCbBmqcupUAA0O5qth5Kls3Ihj0IPbs32PD4tg
 frgNKt6qXG9r0W1GVrWkXFkYu6A7uxN/vB0xOnZe8tCpJ4cWMPVEFMqzu
 3fvh6qtl73aZ/fXS86Y0IHUccCnEcFvu32w6/JV9h1A5sBwsnvz6cj0Tg
 7PRtT1aPzO986Mpimc3ajWST0ecX4gHx2UxUS+71dXodYLxOw2rTW9AQV A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="332451649"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; d="scan'208";a="332451649"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 03:35:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="732866612"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; d="scan'208";a="732866612"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.55])
 by fmsmga008.fm.intel.com with SMTP; 14 Feb 2023 03:35:32 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 14 Feb 2023 13:35:32 +0200
Date: Tue, 14 Feb 2023 13:35:32 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [Intel-gfx] [PATCH 1/2] drm: Introduce plane SIZE_HINTS property
Message-ID: <Y+tyBGmlQi6IGqF0@intel.com>
References: <20230208040911.12590-1-ville.syrjala@linux.intel.com>
 <20230208040911.12590-2-ville.syrjala@linux.intel.com>
 <20230208141312.76df0cb0.pekka.paalanen@collabora.com>
 <Y+OdtR78JnQOTj38@intel.com> <Y+QRSH3kLD4Xrktc@intel.com>
 <20230209135105.4137872c.pekka.paalanen@collabora.com>
 <20230214114227.7fa94b78@eldfell> <Y+tiIYMVnQ6gyJ/e@intel.com>
 <20230214131745.294d5363@eldfell>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230214131745.294d5363@eldfell>
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
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Jonas =?iso-8859-1?Q?=C5dahl?= <jadahl@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 14, 2023 at 01:17:45PM +0200, Pekka Paalanen wrote:
> On Tue, 14 Feb 2023 12:27:45 +0200
> Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> 
> > On Tue, Feb 14, 2023 at 11:42:27AM +0200, Pekka Paalanen wrote:
> > > On Thu, 9 Feb 2023 13:51:05 +0200
> > > Pekka Paalanen <pekka.paalanen@collabora.com> wrote:
> > >   
> > > > Maybe we could refine this so that userspace uses the stride and height
> > > > implied by the caps for allocation, and then use the exact cursor image
> > > > size for AddFB2? And have drivers pick any size between those two they
> > > > can use. The kernel would need the userspace to promise that the
> > > > padding is always zero-initialized, so the driver can simply scan out
> > > > any area of the buffer it needs.
> > > > 
> > > > Then we don't need SIZE_HINTS.  
> > > 
> > > Would there be any problem with this?
> > > 
> > > If this works, it would seem the superior solution to me, because
> > > userspace does not need to guess or test for the exact right size.
> > > Simply allocate at the CAP size, pad the cursor image with transparent
> > > pixels, and let the kernel scan out the optimal area.  
> > 
> > No, the hardware cannot scan out a smaller area because the
> > stride will be wrong.
> 
> In another email of yours you said that hardware requires stride to be
> equivalent to the width. So it's not that hardware supports only
> specific strides, it must equal to width. That's really unfortunate and
> surprising.

Yeah, probably some Windows legacy hangover that refuses to die.

Ye olde Intel gen2 desktop chipsets (i845/i865) had a somewhat
programmable stride for cursors (still POT, but could exceed 
the width), but the mobile chipsets (i830/i85x) did not.
Unfortunately the mobile lineage won out and we've been stuck
with this limitation ever since.

-- 
Ville Syrjälä
Intel
