Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EECB53CD2F
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jun 2022 18:27:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E287810FACE;
	Fri,  3 Jun 2022 16:27:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B1F210FACE
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jun 2022 16:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654273630; x=1685809630;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=YqAvZR6kf6eF3R/eKqeFmVo7jOdayhy5jDEPyTjpU94=;
 b=aTx2tWve6pgUWbXsVLwiPAd67lbYiyaJR9m2ar0fciIu2w+UtybnjTlV
 J8O0QgAZZR2RInDOYpc8H1dFoLVUSwxh/uCQLuZae/hNXiKk/PpbBhyCP
 74+OwJ3inkzs86Lz4VPbd/MbBSBn60Xu8mkjz21/RpCyHz2opMJK7Wo2M
 fX9WX6mXUX+NGpn0zwVjvFO4bTO/lxjVPOXtq2zwzLtGnwlrXv/Mu5+gG
 GiuVLEOuMJmm7dDkw0tUN4V9lvkHi6YkkiW8Of1dg6E1okp+wBjkytvd1
 HNlpwb2KPVtQKExpLm8I99qzTrJWVu25SjBY0MYU/l3qeX7rqz7tZKBSY w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10367"; a="256766600"
X-IronPort-AV: E=Sophos;i="5.91,275,1647327600"; d="scan'208";a="256766600"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2022 09:27:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,275,1647327600"; d="scan'208";a="634583535"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.163])
 by fmsmga008.fm.intel.com with SMTP; 03 Jun 2022 09:27:06 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 03 Jun 2022 19:27:05 +0300
Date: Fri, 3 Jun 2022 19:27:05 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: How should "max bpc" and "Colorspace" KMS property work?
Message-ID: <Ypo2WSniPl7WhNdg@intel.com>
References: <20220525102850.5a70e58f@eldfell>
 <80798931-dbe7-54d7-8e1a-aaebfc39780c@mailbox.org>
 <U2A3FifHdFH9yDVrigaioxCTNx60MgkND7jcyIeKP2S4Ghu-BmmRaODqBDp6K0Q-aPBjPcqa2zUGuJNkGmRWZyQx2FjRJe9dVtJhQG9ZNCk=@emersion.fr>
 <20220525133647.052d09da@eldfell> <YpZSWwVkhJOalM4M@intel.com>
 <20220601102126.4f3602fd@eldfell> <YpdyYbRZP2fdG9Fz@intel.com>
 <20220602104759.60f5a68f@eldfell> <Ypjn4YZWUY5Vi0Xj@intel.com>
 <20220603101909.76254ddb@eldfell>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220603101909.76254ddb@eldfell>
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
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel.daenzer@mailbox.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>,
 Jonas =?iso-8859-1?Q?=C5dahl?= <jadahl@redhat.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 03, 2022 at 10:19:09AM +0300, Pekka Paalanen wrote:
> On Thu, 2 Jun 2022 19:40:01 +0300
> Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> 
> > On Thu, Jun 02, 2022 at 10:47:59AM +0300, Pekka Paalanen wrote:
> > > On Wed, 1 Jun 2022 17:06:25 +0300
> > > Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> > >   
> 
> ...
> 
> > > > The "Colorspace" property just changes what we report to the display
> > > > via infoframes/MSA/SDP. It does not cause the display hardware to do
> > > > any colorspace conversion/etc.  
> > > 
> > > Good.
> > >   
> > > > To actually force the display hardware to do the desired conversion
> > > > we need some new properties. ATM the only automagic conversion that
> > > > can happen (at least with i915) is the RGB 4:4:4->YCbCr 4:2:0 fallback,
> > > > which is needed on some displays to get 4k+ modes to work at all.  
> > > 
> > > When "Colorspace" says RGB, and the automatic fallback would kick in to
> > > create a conflict, what happens?  
> > 
> > I would put that in the "Doctor, it hurts when I..." category.
> 
> Hi Ville,
> 
> I meant specifically the case where the driver chooses to use YCbCr
> 4:2:0 even though userspace is setting absolutely everything to RGB.
> 
> So yeah, that is a problem, like you and Sebastian agreed later.
> 
> Am I safe from that automatic driver fallback if I don't use 4k or
> bigger video modes? What about e.g. 1080p@120 or something? Can I
> calculate when the fallback will happen and choose my "Colorspace"
> accordingly? Which also requires me to set up the RGB->YCbCR color
> model conversion myself?

Porbably not something you can trivially compute unless you
replicate the exact logic from the driver.

> 
> What about failing the modeset instead if userspace sets "Colorspace"
> explicitly to RGB, and the driver would need to fall back to YCbCR
> 4:2:0?
> 
> That would make the most sense to me, as then the driver would not
> silently do a buggy thing.

I'm not sure there's much point in polishing that turd too much.
Should just add the explicit props and make userspace that actually
cares about color management set them exactly as it likes.

> > > I thought we agreed that "max bpc" means limiting link bpc to at most
> > > that value, but the driver will automatically pick a lower value if
> > > that makes the requested video mode work (and in lack of new KMS
> > > properties).
> > > 
> > > I have no desire that change that. I also think the Plymouth issue is
> > > not fully fixable without some new KMS property, and until then the
> > > only thing Plymouth could do is to smash "max bpc" always to 8 - which
> > > mostly stops being a problem once display servers learn to handle "max
> > > bpc".  
> > 
> > There's no real differene between the kernel automagically clamping
> > "max bpc" to the current BIOS programmed value vs. plymouth doing it.
> > Either approach will break deep color support for current userspace
> > which doesn't reset "max bpc" back to the max.
> 
> There is one big difference: if Plymouth does it, then people cannot
> scream "kernel regression".

But they'll just report the bugs against i915 anyway. I'd rather
not have to deal with those without at least being able to point
them at an existing fix, at least for the more common wayland
compositors+Xorg.

> People can point fingers at Plymouth, but I
> would imagine the actual fixes will come as patches to other KMS clients
> and not Plymouth.

I'm worried that we'll be stuck herding these bug reports
for quite some time.

-- 
Ville Syrjälä
Intel
