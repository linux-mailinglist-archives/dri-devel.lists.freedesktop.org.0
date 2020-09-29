Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE7E27DCC8
	for <lists+dri-devel@lfdr.de>; Wed, 30 Sep 2020 01:38:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40DE36E48B;
	Tue, 29 Sep 2020 23:38:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69C416E48B;
 Tue, 29 Sep 2020 23:38:29 +0000 (UTC)
IronPort-SDR: i9EzXvhidltBiw8Aa96QO/vUk9iQ+N7wkorx6PZaanBzMdbVTNcHtpwPvq4Pps6v68EqehysEC
 /zWqpCYnykgg==
X-IronPort-AV: E=McAfee;i="6000,8403,9759"; a="159700656"
X-IronPort-AV: E=Sophos;i="5.77,320,1596524400"; d="scan'208";a="159700656"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2020 16:38:28 -0700
IronPort-SDR: Fwc8YZONOZWSw0u0Z0raFNN6k4HmRpjSBXf55DABf6zef0l03FyWUrtSFcVwnPzyuHRGwVh9hF
 StAC4rsDd1Hg==
X-IronPort-AV: E=Sophos;i="5.77,320,1596524400"; d="scan'208";a="514865575"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.168])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2020 16:38:28 -0700
Date: Tue, 29 Sep 2020 16:38:22 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2] drm/i915/edp/jsl: Update vswing table for HBR and HBR2
Message-ID: <20200929233822.GC2214475@mdroper-desk1.amr.corp.intel.com>
References: <20200929121127.254086-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
 <d235e6f34182e327d8bb46383f6c3ef518b5fc23.camel@intel.com>
 <20200929200201.GH6112@intel.com>
 <a4a075597c7d3e65b25598ab696a59eccbd2a069.camel@intel.com>
 <20200929203022.GI6112@intel.com>
 <20200929210144.GA2214475@mdroper-desk1.amr.corp.intel.com>
 <20200929211148.GJ6112@intel.com> <20200929215958.GK6112@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200929215958.GK6112@intel.com>
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
Cc: "Pandey, Hariom" <hariom.pandey@intel.com>, "Ausmus,
 James" <james.ausmus@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Souza,
 Jose" <jose.souza@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Surendrakumar Upadhyay,
 TejaskumarX" <tejaskumarx.surendrakumar.upadhyay@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 30, 2020 at 12:59:58AM +0300, Ville Syrj=E4l=E4 wrote:
> On Wed, Sep 30, 2020 at 12:11:48AM +0300, Ville Syrj=E4l=E4 wrote:
> > On Tue, Sep 29, 2020 at 02:01:44PM -0700, Matt Roper wrote:
> > > On Tue, Sep 29, 2020 at 11:30:22PM +0300, Ville Syrj=E4l=E4 wrote:
> > > > On Tue, Sep 29, 2020 at 08:20:22PM +0000, Souza, Jose wrote:
> > > > > On Tue, 2020-09-29 at 23:02 +0300, Ville Syrj=E4l=E4 wrote:
> > > > > > On Tue, Sep 29, 2020 at 07:33:45PM +0000, Souza, Jose wrote:
> > > > > > > On Tue, 2020-09-29 at 17:41 +0530, Tejas Upadhyay wrote:
> > > > > > > > JSL has update in vswing table for eDP
> > > > > > > =

> > > > > > > Would be nice to mention in the commit description why PCH is=
 being used, that would avoid Ville's question.
> > > > > > =

> > > > > > If the thing has nothing to do PCH then it should not use the P=
CH type
> > > > > > for the the check. Instead we should just do the EHL/JSL split.
> > > > > =

> > > > > In the first version Matt Roper suggested to use PCH to different=
iate between EHL and JSL, Jani also agreed with this solution.This 2 PCHs c=
an only be
> > > > > associate with EHL and JSL respectively, so no downsides here.
> > > > =

> > > > The downside is that the code makes no sense on the first glance.
> > > > It's going to generate a "wtf?" exception in the brain and require
> > > > me to take a second look to figure what is going on. Exception
> > > > handling is expensive and shouldn't be needed in cases where it's
> > > > trivial to make the code 100% obvious.
> > > =

> > > The bspec documents EHL and JSL as being the same platform and identi=
cal
> > > in all programming since they are literally the same display IP; this
> > > vswing table is the one and only place where the two are treated in a
> > > distinct manner for reasons that lie outside the display controller. =
 If
> > > you had to stop and take a closer look at the code here, that's a
> > > probably a good thing since in general there should generally never b=
e a
> > > difference in the behavior between the two.  Adding an additional
> > > clarifying comment is probably in order too since this is a very
> > > exceptional special case.
> > > =

> > > If we deviate from the bspec's guidance and try to split IS_ELKHARTLA=
KE
> > > and IS_JASPERLAKE across the whole driver, that's going to be a lot m=
ore
> > > pain to maintain down the road since we'll almost certainly have cases
> > > where someone silently leaves one or the other off a condition and ge=
ts
> > > unexepcted behavior.  I could see arguments for using a SUBPLATFORM h=
ere
> > > like we do for TGL_U vs TGL_Y, but even that seems like overkill if we
> > > already have a clear way to distinguish the two cases (PCH pairing) a=
nd
> > > can just leave a clarifying comment.
> > =

> > That fixed PCH pairing is totally undocumented AFAICS. And vswing has
> > nothing to do with the south display, so the wtf will still happen.
> > Comment or no comment.
> =

> Oh and JSP does not show up in bspec even once. MCC appears exactly once
> where it talks about the differences between MCC and ICL-N PCH (which I
> guess is the same as JSP?).

No, ICL-N PCH is something different.  :-(  There were some early test
chips created that paired the EHL/JSL graphics/media/display IP with an
ICL PCH just for early debug/test purposes, but that pairing isn't
something that actually exists as a real platform.

I think the confusion here arises because most driver developers only
look at (or have access to) the bspec, which does not aim to document
end-user platforms, but rather IP families that the
graphics/media/display hardware IP teams design.  The bspec is not an
authoritative document for anything that lies outside the GMD IP itself.
The GMD architects do sometimes try to pull in additional information
from external teams/sources (such as PCH pairing or the electrical
details like the vswing programming here) to make life easier for the
software teams like us that only really deal with the bspec, but that
information comes from external sources, so it's a bit inconsistent in
terms of how much detail there is (or even whether it's described at
all).  We could probably file bspec defects to get them to include the
PCH pairing details for EHL/JSL in the bspec, but ultimately EHL=3D"EHL
G/M/D + MCC PCH" and JSL=3D"EHL G/M/D + JSP PCH;" this has already been
confirmed in an offline email thread with the hardware teams.

Elkhart Lake and Jasper Lake are two separate end-user platforms, that
both incorporated the same G/M/D IP design.  The name "Jasper Lake"
existed as a codename first, so that's the name that shows up in the
bspec; this wound up being a bit confusing when Elkhart Lake was
actually the first of the two to be released and thus wound up being the
name we have in our code.  But the situation seems similar to CHT vs BSW
which are both referred to as "CHV" in the bspec and in our code
(although obviously there was no PCH pairing for those SoCs).
Steppings, workarounds, etc. are unified for EHL/JSL because they're
literally the same IP, rather than one being a derivative of the other. =


If you want full details about the PCHs of a platform (most of which is
unimportant to graphics drivers) or the electrical characteristics that
feed into the vswing programming then there are other authoritative
documents that cover that (like the Electrical Design Specification and
such).  I'm not sure if those documents are posted anywhere publicly;
fortunately we only need a small amount of information in those areas
and the GMD architects are often nice enough to try to copy the relevant
info into the bspec as a courtesy.

> =

> Furthermore the spec never really talks about EHL except in very select
> places. So the IS_ELKHARTLAKE is already totally confusing and IMO more
 * > likely to cause maintenance problems than the split. Making it
> IS_JSL||IS_EHL at least gives the reader some hint as to where they
> should look in the spec.
> =

> Another argument why the split is fine is CFL/CML. Those are more
> or less exactly in the same boat as EHL. Ie. only really mentioned
> in the "configurations" section. Beyond that only KBL is ever really
> mentioned. And yet we have separate IS_FOOs for all of them, and
> apparently no one had any objections to that situation.
> =

> tldr;we have an established way to handle these things, so IMO lets
> just follow it and stop adding special cases.

Isn't CML graphics a derivative of CFL (rather than being exactly the
same IP)?  The fact that we have differences in the GMD IP itself that
need different workarounds implies that it's not quite the same
situation we're talking about here (otherwise we'd have been able to
just check the stepping revision ID).  IS_CML only got split out from
IS_CFL a couple months ago, so it's probably too soon to see how many
bugs eventually creep in when developers accidentally leave it off a CFL
condition or vice versa.

And we do still unify WHL, AML, etc., in i915 as far as I can see even
though the IP teams track those platforms separately, so the precedent
appears to be keeping them combined as far as I can see?


Matt

> =

> -- =

> Ville Syrj=E4l=E4
> Intel

-- =

Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
