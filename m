Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7AFF27DB49
	for <lists+dri-devel@lfdr.de>; Wed, 30 Sep 2020 00:00:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81F206E1F4;
	Tue, 29 Sep 2020 22:00:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEDBE89DD2;
 Tue, 29 Sep 2020 22:00:08 +0000 (UTC)
IronPort-SDR: PMPXAAlXCNHSvif0zxVWkGF4WPMUT3gGt6w4YnmU0kpNFDp7WJzqrMxCDDas+NmWIjBzfGGvbn
 LSRZWs49M5AQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9759"; a="142321948"
X-IronPort-AV: E=Sophos;i="5.77,320,1596524400"; d="scan'208";a="142321948"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2020 15:00:02 -0700
IronPort-SDR: BeM+jTnt5CDA7C9DmLMYwq+TeoAFvjXutzw9ZjutrPuigcIBUKKgzUU+sjmG4wZn9sOLgwrEz3
 8Z9oSfwOCbIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,320,1596524400"; d="scan'208";a="384927783"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga001.jf.intel.com with SMTP; 29 Sep 2020 14:59:59 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 30 Sep 2020 00:59:58 +0300
Date: Wed, 30 Sep 2020 00:59:58 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH v2] drm/i915/edp/jsl: Update vswing table for HBR and HBR2
Message-ID: <20200929215958.GK6112@intel.com>
References: <20200929121127.254086-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
 <d235e6f34182e327d8bb46383f6c3ef518b5fc23.camel@intel.com>
 <20200929200201.GH6112@intel.com>
 <a4a075597c7d3e65b25598ab696a59eccbd2a069.camel@intel.com>
 <20200929203022.GI6112@intel.com>
 <20200929210144.GA2214475@mdroper-desk1.amr.corp.intel.com>
 <20200929211148.GJ6112@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200929211148.GJ6112@intel.com>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
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

On Wed, Sep 30, 2020 at 12:11:48AM +0300, Ville Syrj=E4l=E4 wrote:
> On Tue, Sep 29, 2020 at 02:01:44PM -0700, Matt Roper wrote:
> > On Tue, Sep 29, 2020 at 11:30:22PM +0300, Ville Syrj=E4l=E4 wrote:
> > > On Tue, Sep 29, 2020 at 08:20:22PM +0000, Souza, Jose wrote:
> > > > On Tue, 2020-09-29 at 23:02 +0300, Ville Syrj=E4l=E4 wrote:
> > > > > On Tue, Sep 29, 2020 at 07:33:45PM +0000, Souza, Jose wrote:
> > > > > > On Tue, 2020-09-29 at 17:41 +0530, Tejas Upadhyay wrote:
> > > > > > > JSL has update in vswing table for eDP
> > > > > > =

> > > > > > Would be nice to mention in the commit description why PCH is b=
eing used, that would avoid Ville's question.
> > > > > =

> > > > > If the thing has nothing to do PCH then it should not use the PCH=
 type
> > > > > for the the check. Instead we should just do the EHL/JSL split.
> > > > =

> > > > In the first version Matt Roper suggested to use PCH to differentia=
te between EHL and JSL, Jani also agreed with this solution.This 2 PCHs can=
 only be
> > > > associate with EHL and JSL respectively, so no downsides here.
> > > =

> > > The downside is that the code makes no sense on the first glance.
> > > It's going to generate a "wtf?" exception in the brain and require
> > > me to take a second look to figure what is going on. Exception
> > > handling is expensive and shouldn't be needed in cases where it's
> > > trivial to make the code 100% obvious.
> > =

> > The bspec documents EHL and JSL as being the same platform and identical
> > in all programming since they are literally the same display IP; this
> > vswing table is the one and only place where the two are treated in a
> > distinct manner for reasons that lie outside the display controller.  If
> > you had to stop and take a closer look at the code here, that's a
> > probably a good thing since in general there should generally never be a
> > difference in the behavior between the two.  Adding an additional
> > clarifying comment is probably in order too since this is a very
> > exceptional special case.
> > =

> > If we deviate from the bspec's guidance and try to split IS_ELKHARTLAKE
> > and IS_JASPERLAKE across the whole driver, that's going to be a lot more
> > pain to maintain down the road since we'll almost certainly have cases
> > where someone silently leaves one or the other off a condition and gets
> > unexepcted behavior.  I could see arguments for using a SUBPLATFORM here
> > like we do for TGL_U vs TGL_Y, but even that seems like overkill if we
> > already have a clear way to distinguish the two cases (PCH pairing) and
> > can just leave a clarifying comment.
> =

> That fixed PCH pairing is totally undocumented AFAICS. And vswing has
> nothing to do with the south display, so the wtf will still happen.
> Comment or no comment.

Oh and JSP does not show up in bspec even once. MCC appears exactly once
where it talks about the differences between MCC and ICL-N PCH (which I
guess is the same as JSP?).

Furthermore the spec never really talks about EHL except in very select
places. So the IS_ELKHARTLAKE is already totally confusing and IMO more
likely to cause maintenance problems than the split. Making it
IS_JSL||IS_EHL at least gives the reader some hint as to where they
should look in the spec.

Another argument why the split is fine is CFL/CML. Those are more
or less exactly in the same boat as EHL. Ie. only really mentioned
in the "configurations" section. Beyond that only KBL is ever really
mentioned. And yet we have separate IS_FOOs for all of them, and
apparently no one had any objections to that situation.

tldr;we have an established way to handle these things, so IMO lets
just follow it and stop adding special cases.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
