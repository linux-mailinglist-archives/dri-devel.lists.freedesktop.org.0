Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C54751374D
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 16:50:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 351A510E0EB;
	Thu, 28 Apr 2022 14:50:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FDAD10E469
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 14:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651157408; x=1682693408;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=HsRVKin80lU0w5MLnigmTmeBngi9P8iWKJn6RekzHE0=;
 b=ie5eUKUs1aRGWuAxcxL1rMBmvRhch1FdlzQV46SIZJnsshvtP2UsV3Di
 YZk1xQ5oynLg4387L8NYNYywZdhokC3qTa2RYpTU95u4VlFxG7BlP8PD8
 0h5HXCgFpDEa0q223hqQhefoKuwvCE9F9Li6E1AUAGWFA+9OyCJz5KVyv
 8qFVtPo+xG5gaxGaceDaa/CvO3hONmQ7oICylhm8+Pt0QMgff7bVBrcXp
 iXMDoYzGqQ7g0LAZIrK+l2OCJl4cWOROvy5lUI2CT18lST8YC8IoEvG4J
 l9oi3RphcFqw/PhjAzfS8W7r7OASmDy1pxARue8vZHTc2Of+hirJvBbvR w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10330"; a="246228195"
X-IronPort-AV: E=Sophos;i="5.91,295,1647327600"; d="scan'208";a="246228195"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2022 07:50:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,295,1647327600"; d="scan'208";a="651250034"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.51])
 by FMSMGA003.fm.intel.com with SMTP; 28 Apr 2022 07:50:04 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 28 Apr 2022 17:50:03 +0300
Date: Thu, 28 Apr 2022 17:50:03 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: How should "max bpc" KMS property work?
Message-ID: <YmqpmzBrJLX6Xowq@intel.com>
References: <20220426113502.224d0a90@eldfell> <YmgyArRaJCh6JkQh@intel.com>
 <20220427135259.5e615945@eldfell>
 <4ceca4d9-c58c-9e33-36a6-dbf0c4bb82a7@amd.com>
 <CA+hFU4ykm-8difozGJ5QtAYc=5RGQTUDiagBNmNccf06sGYGZQ@mail.gmail.com>
 <20220428105017.75d9aefe@eldfell>
 <LN_QB3Nb1GNVmbIVpDUJ4ZVnK3WVHlLKwEYxIqEMYJYc2BohK-7VrtEXJF7iDytYws4tiq2RnimS1QsqwERDdReixBshVTVzNyAMOcWsE3M=@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <LN_QB3Nb1GNVmbIVpDUJ4ZVnK3WVHlLKwEYxIqEMYJYc2BohK-7VrtEXJF7iDytYws4tiq2RnimS1QsqwERDdReixBshVTVzNyAMOcWsE3M=@emersion.fr>
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
 Jonas =?iso-8859-1?Q?=C5dahl?= <jadahl@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Pekka Paalanen <ppaalanen@gmail.com>, Vitaly Prosyak <vitaly.prosyak@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 28, 2022 at 07:52:58AM +0000, Simon Ser wrote:
> On Thursday, April 28th, 2022 at 09:50, Pekka Paalanen <ppaalanen@gmail.com> wrote:
> 
> > > > > Also like Alex said, the kernel does not know if the user prefers high
> > > > > color depth or high refresh rate either. One way to solve that is to
> > > > > light up the requested video mode any way the kernel can, and then
> > > > > report what the resulting color depth is. Another way is to have
> > > > > explicit "use this bpc or fail" KMS property, maybe in the form of 'min
> > > > > bpc' as I recall being discussed in the past, and let userspace guess
> > > > > what might work. The former is easier to light up, but probing requires
> > > > > actually setting the modes. The latter may require a lot of
> > > > > trial-and-error from userspace to find anything that works, but it
> > > > > takes only time and not blinking - as far as things can be detected
> > > > > with TEST_ONLY commits. Then one still has to ask the user if it
> > > > > actually worked.
> > > >
> > > > min_bpc sounds like something we might want for HDR use-cases, unless
> > > > the compositor has a way to confirm the output box (and format). min_bpc
> > > > would allow the KMS driver to pick the lowest required bpc so the
> > > > compositor always has a guarantee of quality.
> > >
> > > IMO that would be ideal. The driver should try to reduce bandwidth by lowering
> > > the bpc down to the min_bpc if the hardware can't drive the selected mode at a
> > > higher bpc. User space usually knows which bpc is sufficient for the use case
> > > but will never complain about too much bpc. Drivers which don't support
> > > lowering the bpc dynamically can then still go with the min_bpc and user space
> > > still gets all the modes which work with the minimum required bpc.
> >
> >
> > This would be nice, yes.
> >
> > I'm fairly sure 'min bpc' was discussed here on the dri-devel mailing
> > list in the past, but I don't remember when or by whom.
> 
> Yup. I explained there that I'd prefer "current bpc" + "user bpc" props
> and let user-space deal with the fallback logic just like it does for
> modes, modifiers, etc.

The main problem is that the bpc is not really al that well defined.
We have stuff like 4:2:0 subsampling, DSC (compression), etc. muddying
the waters. Of course max_bpc already suffers a bit from those issues,
but at least it can still claim to do what it says on the tin.
Guaranteeing any kind of minimum bpc is not possible without first
defining what that actually means.

Oh and the various processing blocks in the pipeline might also have
varying input/output precision. So those can also degrade the quality
regardless of how many bits are coming out the end of the pipe.

I suspect trying to exose all that explicitly would result in an API
that just has too many knobs and interactions between the knobs. So
likely no one would be able to succesfully use it.

-- 
Ville Syrjälä
Intel
