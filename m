Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3BE6A58D9
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 13:08:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2174610E68A;
	Tue, 28 Feb 2023 12:08:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8035C10E68A
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 12:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677586095; x=1709122095;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Z2v75PY2t4g40WG2qhkzNkt2Z7kcHgwrhEjD7P/rtwg=;
 b=gDE/MDetgHC0f6Tg2nqxA1ZYKtZrjyYQbTgcMa9JO8AIyekgDsinCsWE
 RnGX6OoY2GvG2gP2reCaec/4xm6NHJAUfi8PR7DvuzptjaV01gfjSzD1T
 wTUJR9+DelCk/w6eEMC04sq6HRknhth55C6jPMojS+JKZTngImEHwhOdJ
 dt0GSriJcrq/wW4ys4daF1ZTNy0lMJgwLIXBzyj8nk3z6WJcRZcoPcD7Q
 AGn+hLQOjTDHrpz18r12/skdylFOxBzshV9uyn2wvXkS5naBPffQMTnkT
 QZTboghcVCC1hiwKyu/8HCZDmRReJfmuEMGMFrJpTquDErFF1BE4ybnF/ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="317918333"
X-IronPort-AV: E=Sophos;i="5.98,221,1673942400"; d="scan'208";a="317918333"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2023 04:08:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="848224644"
X-IronPort-AV: E=Sophos;i="5.98,221,1673942400"; d="scan'208";a="848224644"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by orsmga005.jf.intel.com with SMTP; 28 Feb 2023 04:08:11 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 28 Feb 2023 14:08:10 +0200
Date: Tue, 28 Feb 2023 14:08:10 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH] drm: document TV margin properties
Message-ID: <Y/3uqqeW73tiutgR@intel.com>
References: <20230227122108.117279-1-contact@emersion.fr>
 <20230228104642.21dae84c@eldfell>
 <UA_4dHbPqQvjG0TrP7OhP73PFlhdTNg9Mx9GW3MRGX_JskeQHTNaZyKTBj4AmJoSgutHZeQTa08RkRBuFS6xfTPpEm7MrVtJZEaq88ZYg1s=@emersion.fr>
 <20230228121222.4abf13cb@eldfell>
 <CAPY8ntD1ScfbT5C-L1i0D6ZikKn2VtLX8dCdhvKGzSjHvyn=ug@mail.gmail.com>
 <Y/3pX6fAhM6Kb3OR@intel.com>
 <CAPY8ntD8xj9fEJqdOwDZPmfTGwurzwqSS+2=75=eDjTeYQE8uQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPY8ntD8xj9fEJqdOwDZPmfTGwurzwqSS+2=75=eDjTeYQE8uQ@mail.gmail.com>
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
Cc: Pekka Paalanen <ppaalanen@gmail.com>,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 Maxime Ripard <maxime@cerno.tech>, dri-devel@lists.freedesktop.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 28, 2023 at 11:52:54AM +0000, Dave Stevenson wrote:
> On Tue, 28 Feb 2023 at 11:45, Ville Syrjälä
> <ville.syrjala@linux.intel.com> wrote:
> >
> > On Tue, Feb 28, 2023 at 11:37:38AM +0000, Dave Stevenson wrote:
> > > Hi Pekka
> > >
> > > On Tue, 28 Feb 2023 at 10:12, Pekka Paalanen <ppaalanen@gmail.com> wrote:
> > > >
> > > > On Tue, 28 Feb 2023 09:53:47 +0000
> > > > Simon Ser <contact@emersion.fr> wrote:
> > > >
> > > > > On Tuesday, February 28th, 2023 at 09:46, Pekka Paalanen <ppaalanen@gmail.com> wrote:
> > > > >
> > > > > > can these be negative as well, to achieve overscan and not just
> > > > > > underscan? Did I get overscan and underscan right... these are related
> > > > > > to under/overscan, aren't they?
> > > > > >
> > > > > > Hmm, no, I guess that doesn't make sense, there is no room in the
> > > > > > signal to have negative margins, it would result in clipping the
> > > > > > framebuffer while scaling up. So this can only be used to scale
> > > > > > framebuffer down, add borders, and the TV then scales it back up
> > > > > > again?
> > > > >
> > > > > Correct.
> > > > >
> > > > > > Looks like neither my Intel nor AMD cards support these, I don't see
> > > > > > the properties. More things to the list of KMS properties Weston needs
> > > > > > to explicitly control. Oh, it seems vc4 exclusive for now.
> > >
> > > I've started a discussion with Simon with regard overscan handling [1].
> > > There would be nothing stopping Weston ignoring the DRM properties if
> > > Weston/userspace provides a way to reduce the destintation rectangle
> > > on the display device. Using that would also be renderer agnostic.
> > >
> > > [1] https://gitlab.freedesktop.org/wlroots/wlroots/-/issues/3597
> > >
> > > > > i915 does support it but for TV connectors only (i915/display/intel_tv.c).
> > > > > gud also supports it.
> > > > >
> > > > > > Where does this text appear in the HTML kernel docs? I tried to look at
> > > > > > drm_connector.c but I cannot find the spot where this patch applies.
> > > > >
> > > > > Here:
> > > > > https://dri.freedesktop.org/docs/drm/gpu/drm-kms.html#analog-tv-specific-connector-properties
> > > >
> > > > Analog TV properties? So this does not apply to e.g. HDMI?
> > > >
> > > > I believe HDMI TVs do have the problems that margins could mitigate.
> > >
> > > Correct. Particularly on TVs instead of monitors, it's not uncommon to
> > > find the HDMI output gets overscanned.
> > >
> > > > > > Is this actually a connector property? How does that work, should this
> > > > > > not be a CRTC property?
> > > > >
> > > > > Yeah, it's a connector property for some reason.
> > > > >
> > > > > > Is this instead not scaling anything but simply sending metadata
> > > > > > through the connector?
> > > > >
> > > > > No metadata is sent. This is purely equivalent to setting up CRTC_*
> > > > > properties to scale the planes.
> > > >
> > > > Oh! That would be really good to mention in the doc. Maybe even prefer
> > > > plane props over this? Or is this for analog TV, and plane props for
> > > > digital TV?
> > > >
> > > >
> > > > The above are the important comments. All below is just musings you can
> > > > ignore if you wish.
> > > >
> > > > > > Or are there underlying requirements that this connector property is
> > > > > > actually affecting the CRTC, which means that it is fundamentally
> > > > > > impossible to use multiple connectors with different values on the same
> > > > > > CRTC? And drivers will reject any attempt, so there is no need to
> > > > > > define what conflicting settings will do?
> > > > >
> > > > > I don't think any driver above supports cloning CRTCs for these
> > > > > connector types. i915 sets clonable = false for these connectors.
> > > > > vc4 picks the first connector's TV margins, always.
> > > >
> > > > Sounds like i915 does it right, and vc4 does not, assuming vc4 does not
> > > > prevent cloning.
> > >
> > > The cloneable flag is in struct intel_encoder, not core.
> >
> > It gets converted into the core thing by intel_encoder_possible_clones().
> 
> Thanks Ville.
> vc4 never adds additional possible_clones, therefore I believe it is
> still doing the right thing.

Yeah, should be fine.

These days drivers can just leave/set possible_clones=0 if they
don't support cloning, and fixup_encoder_possible_clones() will
fix it up later to follow the rule that the encoder itself must
be included in the bitmask.

-- 
Ville Syrjälä
Intel
