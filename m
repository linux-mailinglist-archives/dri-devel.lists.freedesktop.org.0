Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F24C9696F9B
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 22:27:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B22E10E9A8;
	Tue, 14 Feb 2023 21:27:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD50D10E9A8;
 Tue, 14 Feb 2023 21:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676410063; x=1707946063;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Es17lZKi4F5npKc8SHTYecRXwGUn2kBOD1vdiMI5RY0=;
 b=Gf13hVZHMg7xJkIZeAiV3h6ho46U08tQPPrAv8YH3oKq8PFvmGdvgsDS
 jf/6oGXazsHAFqWi3VVpgUl7r9I94zCGO7WzNhLjqe5q2UlgiaQIuhcku
 2d8E4LUyrYWzZMk+de0A9t7ogG7sSvq3bFRqre6eGxcx0rXBrKKvdHuZ8
 ad2FIAaCSGhVieLl0qlHWOY1iDN1lw0HNYBWrYOM1qX3AV8DVx+ceMLQ6
 v5vQYRj+QizyIZn2tZrGNivfNzvFY8HqBv4TOH+OX0PkUzaVj11wGJEEw
 /siW4a/Q2NkaQiT83hX/9jWp5wkoPCW+I/7H/C7doNFL5Mib5D7bowPog g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="331273643"
X-IronPort-AV: E=Sophos;i="5.97,297,1669104000"; d="scan'208";a="331273643"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 13:27:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="701776779"
X-IronPort-AV: E=Sophos;i="5.97,297,1669104000"; d="scan'208";a="701776779"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.55])
 by orsmga001.jf.intel.com with SMTP; 14 Feb 2023 13:27:39 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 14 Feb 2023 23:27:38 +0200
Date: Tue, 14 Feb 2023 23:27:38 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Sebastian Wick <sebastian.wick@redhat.com>
Subject: Re: [PATCH 3/3] drm/connector: Deprecate split for BT.2020 in
 drm_colorspace enum
Message-ID: <Y+v8yv9OqC2JlX8s@intel.com>
References: <CA+hFU4ymiOg06MQeKLcn5MSrR=BZnOLODdZCFvGUdWqt_ha61A@mail.gmail.com>
 <0fc18aec-0703-55f4-f635-d09d345e8dc0@amd.com>
 <Y90l+DY0rSaMvN1U@intel.com>
 <758e5cf6-53e0-567c-c760-5b773bc7a11c@amd.com>
 <Y90vrEa3/1RbaGOV@intel.com>
 <CA+hFU4wuM_xHniFyRT+jouQ3k_S3UJsRpAtd1Lgx9UVLtrqZrQ@mail.gmail.com>
 <98d1d22a-1c29-5271-1eaf-89c962eb9678@amd.com>
 <CA+hFU4y=N3bR-vXXeLP0xTe0-HJPgF_GTbKrb3A9St-z2LignQ@mail.gmail.com>
 <Y+vqu3qGUQayTjd+@intel.com>
 <CA+hFU4wpXfvCsiHrz=f8VCg3x9Ve--4OujwLq5jmGyAGwZy+jQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+hFU4wpXfvCsiHrz=f8VCg3x9Ve--4OujwLq5jmGyAGwZy+jQ@mail.gmail.com>
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
Cc: dri-devel@lists.freedesktop.org, Pekka Paalanen <ppaalanen@gmail.com>,
 Uma Shankar <uma.shankar@intel.com>, amd-gfx@lists.freedesktop.org,
 Joshua Ashton <joshua@froggi.es>, Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 14, 2023 at 10:18:49PM +0100, Sebastian Wick wrote:
> On Tue, Feb 14, 2023 at 9:10 PM Ville Syrjälä
> <ville.syrjala@linux.intel.com> wrote:
> >
> > On Tue, Feb 14, 2023 at 08:45:00PM +0100, Sebastian Wick wrote:
> > > On Tue, Feb 14, 2023 at 5:57 PM Harry Wentland <harry.wentland@amd.com> wrote:
> > > >
> > > >
> > > >
> > > > On 2/14/23 10:49, Sebastian Wick wrote:
> > > > > On Fri, Feb 3, 2023 at 5:00 PM Ville Syrjälä
> > > > > <ville.syrjala@linux.intel.com> wrote:
> > > > >>
> > > > >> On Fri, Feb 03, 2023 at 10:24:52AM -0500, Harry Wentland wrote:
> > > > >>>
> > > > >>>
> > > > >>> On 2/3/23 10:19, Ville Syrjälä wrote:
> > > > >>>> On Fri, Feb 03, 2023 at 09:39:42AM -0500, Harry Wentland wrote:
> > > > >>>>>
> > > > >>>>>
> > > > >>>>> On 2/3/23 07:59, Sebastian Wick wrote:
> > > > >>>>>> On Fri, Feb 3, 2023 at 11:40 AM Ville Syrjälä
> > > > >>>>>> <ville.syrjala@linux.intel.com> wrote:
> > > > >>>>>>>
> > > > >>>>>>> On Fri, Feb 03, 2023 at 02:07:44AM +0000, Joshua Ashton wrote:
> > > > >>>>>>>> Userspace has no way of controlling or knowing the pixel encoding
> > > > >>>>>>>> currently, so there is no way for it to ever get the right values here.
> > > > >>>>>>>
> > > > >>>>>>> That applies to a lot of the other values as well (they are
> > > > >>>>>>> explicitly RGB or YCC). The idea was that this property sets the
> > > > >>>>>>> infoframe/MSA/SDP value exactly, and other properties should be
> > > > >>>>>>> added to for use userspace to control the pixel encoding/colorspace
> > > > >>>>>>> conversion(if desired, or userspace just makes sure to
> > > > >>>>>>> directly feed in correct kind of data).
> > > > >>>>>>
> > > > >>>>>> I'm all for getting userspace control over pixel encoding but even
> > > > >>>>>> then the kernel always knows which pixel encoding is selected and
> > > > >>>>>> which InfoFrame has to be sent. Is there a reason why userspace would
> > > > >>>>>> want to control the variant explicitly to the wrong value?
> > > > >>>>>>
> > > > >>>>>
> > > > >>>>> I've asked this before but haven't seen an answer: Is there an existing
> > > > >>>>> upstream userspace project that makes use of this property (other than
> > > > >>>>> what Joshua is working on in gamescope right now)? That would help us
> > > > >>>>> understand the intent better.
> > > > >>>>
> > > > >>>> The intent was to control the infoframe colorimetry bits,
> > > > >>>> nothing more. No idea what real userspace there was, if any.
> > > > >>>>
> > > > >>>>>
> > > > >>>>> I don't think giving userspace explicit control over the exact infoframe
> > > > >>>>> values is the right thing to do.
> > > > >>>>
> > > > >>>> Only userspace knows what kind of data it's stuffing into
> > > > >>>> the pixels (and/or how it configures the csc units/etc.) to
> > > > >>>> generate them.
> > > > >>>>
> > > > >>>
> > > > >>> Yes, but userspace doesn't control or know whether we drive
> > > > >>> RGB or YCbCr on the wire. In fact, in some cases our driver
> > > > >>> needs to fallback to YCbCr420 for bandwidth reasons. There
> > > > >>> is currently no way for userspace to know that and I don't
> > > > >>> think it makes sense.
> > > > >>
> > > > >> People want that control as well for whatever reason. We've
> > > > >> been asked to allow YCbCr 4:4:4 output many times.
> > > > >
> > > > > I don't really think it's a question of if we want it but rather how
> > > > > we get there. Harry is completely right that if we would make the
> > > > > subsampling controllable by user space instead of the kernel handling
> > > > > it magically, user space which does not adapt to the new control won't
> > > > > be able to light up some modes which worked before.
> > > > >
> > > >
> > > > Thanks for continuing this discussion and touching on the model of how
> > > > we get to where we want to go.
> > > >
> > > > > This is obviously a problem and not one we can easily fix. We would
> > > > > need a new cap for user space to signal "I know that I can control
> > > > > bpc, subsampling and compression to lower the bandwidth and light up
> > > > > modes which otherwise fail". That cap would also remove all the
> > > > > properties which require kernel magic to work (that's also what I
> > > > > proposed for my KMS color pipeline API).
> > > > >
> > > > > We all want to expose more of the scanout capability and give user
> > > > > space more control but I don't think an incremental approach works
> > > > > here and we would all do better if we accept that the current API
> > > > > requires kernel magic to work and has a few implicit assumptions baked
> > > > > in.
> > > > >
> > > > > With all that being said, I think the right decision here is to
> > > > >
> > > > > 1. Ignore subsampling for now
> > > > > 2. Let the kernel select YCC or RGB on the cable
> > > > > 3. Let the kernel figure out the conversion between RGB and YCC based
> > > > > on the color space selected
> > > > > 4. Let the kernel send the correct infoframe based on the selected
> > > > > color space and cable encoding
> > > > > 5. Only expose color spaces for which the kernel can do the conversion
> > > > > and send the infoframe
> > > >
> > > > I agree. We don't want to break or change existing behavior (that is
> > > > used by userspace) and this will get us far without breaking things.
> > > >
> > > > > 6. Work on the new API which is hidden behind a cap
> > > > >
> > > >
> > > > I assume you mean something like
> > > > https://gitlab.freedesktop.org/pq/color-and-hdr/-/issues/11
> > >
> > > Something like that, yes. The main point being a cap which removes a
> > > lot of properties and sets new expectations between user space and
> > > kernel. The actual API is not that important.
> > >
> > > > Above you say that you don't think an incremental approach works
> > > > here. Can you elaborate?
> > >
> > > Backwards compatibility is really hard. If we add another property to
> > > control e.g. the color range infoframe which doesn't magically convert
> > > colors, we now have to define how it interacts with the existing
> > > property.
> >
> > I think that's easy. The old prop simply override the
> > infoframe/etc. stuff. Pretty sure that's how we have it
> > implemented in i915 since the start.
> >
> > And if you set it wrong it's you own fault.
> 
> We need the "old" property to control both the conversion and the
> infoframe and we need the "new" property to control only the
> infoframe.

Wait what? The old property only controls the infoframe.
The new property (last I looked) was supposed to do more.
Or did that plan change already when I wasn't paying attention.

> So if we don't want to old property to to any conversion we
> now also need a new value for the old property which disables the
> property. So why not just go for a cap and remove the property
> altogether?
> 
> And again, as long as user space doesn't have complete control over
> the entire pipeline we can't use the property which only sets the
> infoframe anyway so you can't even have an incremental approach here.
> 
> Let's turn the question around: what do we gain by keeping all the
> properties and implicit assumptions in the current API around? They
> make everything more complex so what's the benefit?
> 
> I also want to be able to clearly document all the requirements of
> user space and the guarantees from the kernel in the new API which we
> can't do when we just incrementally change some properties here and
> there. The documentation right now is basically a joke and almost
> nothing has been defined properly and when things work, they work by
> accident. Purely from a documentation and usability POV the
> incremental approach is already going to be horrible IMO.
> 
> >
> > > We also have to figure out how a user space which doesn't
> > > know about the new property behaves when another client has set that
> > > property. If any property which currently might change the pixel
> > > values is used, we can't expose the entire color pipeline because the
> > > kernel might have to use some element in it to achieve its magic
> > > conversion. So essentially you already have this hard device between
> > > "old" and "new" and you can't use the new stuff incrementally.
> >
> > That problem exists with any new property. Old userspace and new
> > userspace may interact badly enought that nothing works right.
> > In that sense I think these props might even be pretty mundane
> > as the worst you might get from setting the infoframe wrong is
> > perhaps wrong colors on your display.
> >
> > To solve that particular problem there has been talk (for years)
> > about some kind of "reset all" knob to make sure everything is
> > at a safe default value. I have a feeling there was even some
> > kind of semi-real proposal in recent times, but maybe I imgained
> > it?
> 
> I'm one of the people who argued for this but met only resistance. It
> sure would be nice to have but also doesn't help with a lot of the
> issues.
> 
> > Right now I guess what you do is either just reboot, or muck
> > around with modetest to manually reset properties.
> >
> > I have occasionally abused this btw, to set some prop with
> > modetest and then run some real userspace that doesn't even
> > know about said property. Easy way to test stuff :P
> >
> > --
> > Ville Syrjälä
> > Intel
> >

-- 
Ville Syrjälä
Intel
