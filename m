Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DDD358747
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 16:39:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F0846EB30;
	Thu,  8 Apr 2021 14:39:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFBBC6EB2A
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Apr 2021 14:39:36 +0000 (UTC)
IronPort-SDR: BpgI3K5fNF+qlQFeRA5wOHG0+RyKzxPeBG6z5aDQjV668zEG6VuGU/bILznMX0Onkx4s3D/E1b
 +ECjkIqufB3Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9948"; a="181091279"
X-IronPort-AV: E=Sophos;i="5.82,206,1613462400"; d="scan'208";a="181091279"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2021 07:39:26 -0700
IronPort-SDR: W2j0xk9yovHnViEr3C9BZpBxdF1KBqLDvHLQpdsPInPTl+nzeQas5hqFxaMf1Im+McjJ4DAfsH
 k9PYRow4mwGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,206,1613462400"; d="scan'208";a="458849463"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga001.jf.intel.com with SMTP; 08 Apr 2021 07:39:23 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 08 Apr 2021 17:39:22 +0300
Date: Thu, 8 Apr 2021 17:39:22 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [PATCH 2/2] drm/doc: emphasize difference between plane formats
 and IN_FORMATS blob
Message-ID: <YG8Vmsj6mtGZuf3H@intel.com>
References: <20210406192118.12313-1-leandro.ribeiro@collabora.com>
 <20210406192118.12313-3-leandro.ribeiro@collabora.com>
 <YG24z2oeHVtzvkXy@intel.com>
 <RW8-e8gSvP1pTckh_2alh-dqd3OR_bdl8e5PYdZVWBL4VnBMh0_ZWEfdlRmoQvzI0lGVH62Fp83MCaPqLZxlCE5pjntUhq-zW0v4-S_4Vos=@emersion.fr>
 <20210408125919.4a83119c@eldfell>
 <YG7pSJHe6gKDJ6Hh@phenom.ffwll.local>
 <20210408165751.7488e793@eldfell>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210408165751.7488e793@eldfell>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
 Leandro Ribeiro <leandro.ribeiro@collabora.com>, kernel@collabora.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 08, 2021 at 04:57:51PM +0300, Pekka Paalanen wrote:
> On Thu, 8 Apr 2021 13:30:16 +0200
> Daniel Vetter <daniel@ffwll.ch> wrote:
> =

> > On Thu, Apr 08, 2021 at 12:59:19PM +0300, Pekka Paalanen wrote:
> =

> > > The point of these documentation patches is to establish the conventi=
on
> > > that:
> > > =

> > > - drm_mode_get_plane::format_type_ptr is the list of pixel formats th=
at
> > >   can work via the no-modifiers uAPI, but says nothing about the
> > >   explicit modifiers uAPI.
> > > =

> > > - IN_FORMATS is a list of format-modifier pairs that can work via the
> > >   explicit modifiers API, but says nothing about the no-modifiers uAP=
I.
> > > =

> > > Is that a reasonable expectation?  =

> > =

> > I'm not sure. I thought they're the same list underneath in the kernel,=
 at
> > least for drivers that do support modifiers. The current wording I think
> > suggests more meaning than is actually there.
> =

> They may be the same list in the kernel today, but do you want to force
> all future drivers and future formats-modifiers to have that too?
> Or did the boat sail already?
> =

> The existing uAPI considers these two to be independent lists, no
> documentation saying otherwise, is there?
> =

> Should a kernel driver not have a way to say "this format won't work
> via the no-modifiers uAPI"?
> =

> The practical consequence in userspace is how should userspace collect
> the lists of supported format-modifier pairs, when the kernel has two
> independent format lists, one carries modifiers explicitly and the
> other does not. The one that carries explicit modifiers cannot denote
> "no modifier" AFAIU.
> =

> So the "obvious" interpretation in userspace is that:
> - the format list that does not carry any modifier information should
>   be used with the no-modifiers uAPI, and
> - the format list that does carry explicit modifiers should be used
>   with the explicit modifiers uAPI.
> =

> If you were to say, that if IN_FORMATS exists, use it and ignore the
> old no-modifiers format list, then the conclusion in userspace when
> IN_FORMATS exists is that you cannot use the no-modifiers uAPI, because
> all formats that are listed as supported carry an explicit modifier.
> =

> I understand that the format or format-modifier lists are not
> authoritative. Formats outside of the lists *could* work. But why would
> anyone bother trying something that is not suggested to work?

IMO formats not listed by any plane should just be rejected by addfb2.
I tried to put that check in the drm core actually but there was some
weird pushback, so for the moment it's handled by each driver. Some
drivers (like i915) will reject anything not supported by any plane,
other drivers might not (and probably no one knows how badly they
might blow up if you pass in some exotic format...).

I also had some igt patches to test that addfb2 behaviour but
they didn't go in either.

> =

> Or, is the intention such, that all formats in IN_FORMATS list imply
> some support through the no-modifiers uAPI too, iff buffer
> allocation does not give you an explicit modifier?
> =

> Or, should there be an i-g-t test to ensure that both the old and
> IN_FORMATS lists have the exact same pixel formats always, carving that
> fact into stone and resolving all this ambiguity?
> =

> > > Is it also so that passing MOD_INVALID to the explicit modifier uAPI
> > > (ADDFB2) is invalid argument? Do we have that documented?  =

> > =

> > We'd need to check that, currently it's an out-of-band flag in the stru=
ct.
> > Atm DRM_FORMAT_MOD_INVALID is entirely an internal sentinel value to
> > denote end-of-array entries.
> > =

> > In practice it wont pass because we validate the modifiers against the
> > advertised list.

We don't actually. If the driver provides the .format_mod_supported()
hook then it's up to the driver to validate the modifier in said hook.
This was done so that people can embed metadata inside the modifier
while only having the base modifier on the modifier list. How userspace
is supposed to figure out which values for this extra metadata are valid
I have no idea.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
