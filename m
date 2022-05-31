Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A3C539586
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 19:37:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60FAD10FB5A;
	Tue, 31 May 2022 17:37:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA68910FA85
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 17:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654018657; x=1685554657;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=qR5jXFJ1K14MpdkCjMI5DbyS/M/d1QKEf4wtHzBNAtg=;
 b=bE/G4TzsYV0PjJUuuGNNYFpgP1pccfoMfObb4aQ+qw5Ysiqx2hWdL6S5
 /ZlL+VMSveCOhGlsLQrXv5P8mvTML9pe54hdpZPBuMfoKFgz3TsAKLjJi
 71Gbb4G7QRBYdfO2xTQEVfGIGtNvYa7tWDnVNbr9lTvQrKRNdoUrceAfC
 op2jCppDm/zEdEGpqq61Fmgsts/TLfg3L8kJBmKTeYwBaMyzPB+N5LP2E
 HiqhR/6rwDsTJB4vVxEFtmBKlD0oqlIKwAddLMu9/kA6NuUifBZQbjZgC
 5zlQO7pxFyAb0TwE+fvGL7JwGVz0jnjl0VeyHE8lAuOYpF3uYYBXyGDAt Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10364"; a="274137708"
X-IronPort-AV: E=Sophos;i="5.91,266,1647327600"; d="scan'208";a="274137708"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2022 10:37:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,266,1647327600"; d="scan'208";a="611939310"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.163])
 by orsmga001.jf.intel.com with SMTP; 31 May 2022 10:37:32 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 31 May 2022 20:37:32 +0300
Date: Tue, 31 May 2022 20:37:31 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: How should "max bpc" KMS property work?
Message-ID: <YpZSWwVkhJOalM4M@intel.com>
References: <20220426113502.224d0a90@eldfell> <YmgyArRaJCh6JkQh@intel.com>
 <57d16ed5-8bfc-ce29-9250-14e2de18710a@redhat.com>
 <20220523112246.056ddc99@eldfell>
 <CA+hFU4wTHR9kLrFY3XkbeROZgxWamiZ6yGYL4jH+wpe8MzLvMw@mail.gmail.com>
 <20220525102850.5a70e58f@eldfell>
 <80798931-dbe7-54d7-8e1a-aaebfc39780c@mailbox.org>
 <U2A3FifHdFH9yDVrigaioxCTNx60MgkND7jcyIeKP2S4Ghu-BmmRaODqBDp6K0Q-aPBjPcqa2zUGuJNkGmRWZyQx2FjRJe9dVtJhQG9ZNCk=@emersion.fr>
 <20220525133647.052d09da@eldfell>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220525133647.052d09da@eldfell>
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

On Wed, May 25, 2022 at 01:36:47PM +0300, Pekka Paalanen wrote:
> On Wed, 25 May 2022 09:23:51 +0000
> Simon Ser <contact@emersion.fr> wrote:
> 
> > On Wednesday, May 25th, 2022 at 10:35, Michel Dänzer <michel.daenzer@mailbox.org> wrote:
> > 
> > > > Mind that "max bpc" is always in auto. It's only an upper limit, with
> > > > the assumption that the driver can choose less.  
> > >
> > > It seems to me like the "max bpc" property is just kind of bad API,
> > > and trying to tweak it to cater to more use cases as we discover them
> > > will take us down a rabbit hole. It seems better to replace it with
> > > new properties which allow user space to determine the current
> > > effective bpc and to explicitly control it.  
> > 
> > +1, this sounds much more robust, and allows better control by user-space.
> > User-space needs to have fallback logic for other state as well anyways.
> > If the combinatorial explosion is too much, we should think about optimizing
> > the KMS implementation, or improve the uAPI.
> 
> +1 as well, with some recommendations added and the running off to the
> sunset:
> 
> Use two separate KMS properties for reporting current vs.
> programming desired. The KMS property reporting the current value
> must be read-only (immutable). This preserves the difference between
> what userspace wanted and what it got, making it possible to read
> back both without confusing them. It also allows preserving driver behaviour

I don't see much real point in a property to report the current bpc.
That can't be used to do anything atomically. So I suppose plymouth
would be the only user.

So IMO if someone really need explicit control over this then we 
should just expose properties to set things explicitly. So we'd
need at least props for the actual bpc and some kind of color 
encoding property (RGB/YCbCr 4:4:4/4:2:2:/4:2:0, etc.). And someone
would really need to figure out how DSC would interact with those.

For just the plymouth case I guess the easiest thing would be to
just clamp "max bpc" to the current value. The problem with that
is that we'd potentially break existing userspace. Eg. I don't think
the modesetting ddx or perhaps even most of the wayland compositors
set "max bpc" at all. So we'd need to roll out a bunch of userspace
updates first. And the "current bpc" prop idea would also have this
same problem since plymouth would just clamp "max bpc" based on the
current bpc before the real userspace starts.

-- 
Ville Syrjälä
Intel
