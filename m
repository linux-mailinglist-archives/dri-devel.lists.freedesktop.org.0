Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCC1800E5C
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 16:16:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E7B910E8BC;
	Fri,  1 Dec 2023 15:16:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC39410E0B0
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Dec 2023 15:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701443752; x=1732979752;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=tWb4VPgidAHQe+HcKW5PIOVqtBQKyGJANuwYhvqD8Tg=;
 b=FBJ+jYgMJ1+WDw1uRM/6T+wPJTvMh93beqa8wXk4RUB4YH8tg3PDKsOJ
 5b0Ke8bq/u1WhsZAskLacT9XaUdQ2KiObpkfD7RWcLI3GFBdO3d3Us+st
 w8n+yJ3iaReOy3SP6nsy9BqWiwJ1270J+/sSf45pxJ09exkh4LVLkHVXb
 0pTxZ38ac+yNj+57E+kxh4kNlBEhLGLLF6tlYZexS0Uyxzegcjm8nFLpZ
 fK6WuID+t8HJm/YXMGv08QI8/jecIuxhJ4nw4LeZ2M32475sLaVEpe3TU
 7/6xOLifigdReah6Jy30Qp3sPZVFZXsz9azhjFisunBoGP+0mwShXTd3j g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="362391"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="scan'208";a="362391"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2023 07:15:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="763176400"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; d="scan'208";a="763176400"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga007.jf.intel.com with SMTP; 01 Dec 2023 07:15:26 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 01 Dec 2023 17:15:25 +0200
Date: Fri, 1 Dec 2023 17:15:25 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v4 05/45] drm/connector: Check drm_connector_init
 pointers arguments
Message-ID: <ZWn4jUsVgjubVPvB@intel.com>
References: <20231128-kms-hdmi-connector-state-v4-0-c7602158306e@kernel.org>
 <20231128-kms-hdmi-connector-state-v4-5-c7602158306e@kernel.org>
 <87h6l66nth.fsf@intel.com>
 <v3hplco5fdedv6bnc6mwx2zhhw4xxdiekha26ykhc5cmy7ol77@2irk3w4hmabw>
 <ZWXv1Oi_sH0BRWao@intel.com>
 <2mnodqvu2oo674vspiy4gxhglu3it5cq47acx5itnbwevgc4cf@c7h2bvnx3m2n>
 <ZWcB4Ak8QnwkhObR@intel.com>
 <2lbs5dkpusow72koxknoautcfb6e2ygq5wledim4i572ya5xlc@stc4koneykhm>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2lbs5dkpusow72koxknoautcfb6e2ygq5wledim4i572ya5xlc@stc4koneykhm>
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
Cc: Emma Anholt <emma@anholt.net>, Samuel Holland <samuel@sholland.org>,
 dri-devel@lists.freedesktop.org, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Sandy Huang <hjc@rock-chips.com>, Hans Verkuil <hverkuil@xs4all.nl>,
 linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 01, 2023 at 10:01:49AM +0100, Maxime Ripard wrote:
> On Wed, Nov 29, 2023 at 11:18:24AM +0200, Ville Syrjälä wrote:
> > On Wed, Nov 29, 2023 at 10:11:26AM +0100, Maxime Ripard wrote:
> > > Hi Ville,
> > > 
> > > On Tue, Nov 28, 2023 at 03:49:08PM +0200, Ville Syrjälä wrote:
> > > > On Tue, Nov 28, 2023 at 02:29:40PM +0100, Maxime Ripard wrote:
> > > > > On Tue, Nov 28, 2023 at 02:54:02PM +0200, Jani Nikula wrote:
> > > > > > On Tue, 28 Nov 2023, Maxime Ripard <mripard@kernel.org> wrote:
> > > > > > > All the drm_connector_init variants take at least a pointer to the
> > > > > > > device, connector and hooks implementation.
> > > > > > >
> > > > > > > However, none of them check their value before dereferencing those
> > > > > > > pointers which can lead to a NULL-pointer dereference if the author
> > > > > > > isn't careful.
> > > > > > 
> > > > > > Arguably oopsing on the spot is preferrable when this can't be caused by
> > > > > > user input. It's always a mistake that should be caught early during
> > > > > > development.
> > > > > > 
> > > > > > Not everyone checks the return value of drm_connector_init and friends,
> > > > > > so those cases will lead to more mysterious bugs later. And probably
> > > > > > oopses as well.
> > > > > 
> > > > > So maybe we can do both then, with something like
> > > > > 
> > > > > if (WARN_ON(!dev))
> > > > >    return -EINVAL
> > > > > 
> > > > > if (drm_WARN_ON(dev, !connector || !funcs))
> > > > >    return -EINVAL;
> > > > > 
> > > > > I'd still like to check for this, so we can have proper testing, and we
> > > > > already check for those pointers in some places (like funcs in
> > > > > drm_connector_init), so if we don't cover everything we're inconsistent.
> > > > 
> > > > People will invariably cargo-cult this kind of stuff absolutely
> > > > everywhere and then all your functions will have tons of dead
> > > > code to check their arguments.
> > > 
> > > And that's a bad thing because... ?
> > > 
> > > Also, are you really saying that checking that your arguments make sense
> > > is cargo-cult?
> > > 
> > > We're already doing it in some parts of KMS, so we have to be
> > > consistent, and the answer to "most drivers don't check the error"
> > > cannot be "let's just give on error checking then".
> > > 
> > > > I'd prefer not to go there usually.
> > > > 
> > > > Should we perhaps start to use the (arguably hideous)
> > > >  - void f(struct foo *bar)
> > > >  + void f(struct foo bar[static 1])
> > > > syntax to tell the compiler we don't accept NULL pointers?
> > > > 
> > > > Hmm. Apparently that has the same problem as using any
> > > > other kind of array syntax in the prototype. That is,
> > > > the compiler demands to know the definition of 'struct foo'
> > > > even though we're passing in effectively a pointer. Sigh.
> > > 
> > > Honestly, I don't care as long as it's something we can unit-test to
> > > make sure we make it consistent. We can't unit test a complete kernel
> > > crash.
> > 
> > Why do you want to put utterly broken code into a unit test?
> 
> Utterly broken code happens. It probably shouldn't, but here we are.
> 
> Anyway, you mostly missed the consistent part.
> 
> The current state with it is:
> 
>   - planes:
>     - drm_universal_plane_init warns if funcs->destroy NULL
>     - drm_universal_plane_alloc errors out if funcs is NULL
>     - drmm_universal_plane_alloc warns and errors out if funcs or funcs->destroy are NULL
> 
>   - CRTC:
>     - drm_crtc_init_with_planes warns if funcs->destroy NULL
>     - drmm_crtc_init_with_planes warns if funcs or funcs->destroy are NULL
>     - drmm_crtc_alloc_with_planes warns and errors out if funcs or funcs->destroy are NULL
> 
>   - encoder:
>     - drm_encoder_init warns if funcs->destroy NULL
>     - drmm_encoder_init warns and errors out if funcs or funcs->destroy are NULL
>     - drmm_encoder_alloc warns and errors out if funcs or funcs->destroy are NULL
> 
>   - connectors:
>     - drm_connector_init warns and errors out if funcs or funcs->destroy are NULL
>     - drm_connector_init_with_ddc warns and errors out if funcs or funcs->destroy are NULL
>     - drmm_connector_init warns and errors out if funcs or funcs->destroy are NULL

Those are perhaps fine, as things may not oops immediately if you get
that wrong. But NULL checking things that will anyway oops immediately,
(and there's not chance the thing will do anything useful if you prevent
the oops with a NULL check) doesn't make any sense to me. It just makes
you doubt the entire universe when you see code like that.

> 
> I think that just proves that your opinion is just not as clear cut as
> you'd like it to be, and it's far from being the policy you claim it is.
> 
> Plus, we're not even remotely consistent there, and we're not
> documenting that anywhere.
> 
> And we have plenty of other examples of static stuff being checked
> because it just makes sense. All variants of drm_crtc_init_with_planes
> will for example check that the correct plane type is associated to the
> primary and cursor planes.
> 
> We should fix that.

Ideally the compiler should catch all of this. But given we are
implementing this in C (and even C23 constexpr was neutered beyond
uselessness) that's not really possible in any nice way :(

-- 
Ville Syrjälä
Intel
