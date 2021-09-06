Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1377E40210F
	for <lists+dri-devel@lfdr.de>; Mon,  6 Sep 2021 23:20:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49C3189807;
	Mon,  6 Sep 2021 21:20:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C402C89807;
 Mon,  6 Sep 2021 21:20:43 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10099"; a="281054839"
X-IronPort-AV: E=Sophos;i="5.85,273,1624345200"; d="scan'208";a="281054839"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2021 14:20:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,273,1624345200"; d="scan'208";a="647832129"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga005.jf.intel.com with ESMTP; 06 Sep 2021 14:20:42 -0700
Received: from bgsmsx602.gar.corp.intel.com (10.109.78.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 6 Sep 2021 14:20:41 -0700
Received: from bgsmsx604.gar.corp.intel.com (10.67.234.6) by
 BGSMSX602.gar.corp.intel.com (10.109.78.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 7 Sep 2021 02:50:39 +0530
Received: from bgsmsx604.gar.corp.intel.com ([10.67.234.6]) by
 BGSMSX604.gar.corp.intel.com ([10.67.234.6]) with mapi id 15.01.2242.010;
 Tue, 7 Sep 2021 02:50:39 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "sebastian@sebastianwick.net" <sebastian@sebastianwick.net>, "Harry
 Wentland" <harry.wentland@amd.com>
CC: Brian Starkey <brian.starkey@arm.com>, "Sharma, Shashank"
 <shashank.sharma@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "ppaalanen@gmail.com"
 <ppaalanen@gmail.com>, "mcasas@google.com" <mcasas@google.com>,
 "jshargo@google.com" <jshargo@google.com>, "Deepak.Sharma@amd.com"
 <Deepak.Sharma@amd.com>, "Shirish.S@amd.com" <Shirish.S@amd.com>,
 "Vitaly.Prosyak@amd.com" <Vitaly.Prosyak@amd.com>, "aric.cyr@amd.com"
 <aric.cyr@amd.com>, "Bhawanpreet.Lakha@amd.com" <Bhawanpreet.Lakha@amd.com>,
 "Krunoslav.Kovac@amd.com" <Krunoslav.Kovac@amd.com>, "hersenxs.wu@amd.com"
 <hersenxs.wu@amd.com>, "Nicholas.Kazlauskas@amd.com"
 <Nicholas.Kazlauskas@amd.com>, "laurentiu.palcu@oss.nxp.com"
 <laurentiu.palcu@oss.nxp.com>, "ville.syrjala@linux.intel.com"
 <ville.syrjala@linux.intel.com>, "nd@arm.com" <nd@arm.com>
Subject: RE: [RFC PATCH v3 1/6] drm/doc: Color Management and HDR10 RFC
Thread-Topic: [RFC PATCH v3 1/6] drm/doc: Color Management and HDR10 RFC
Thread-Index: AQHXhYNZCXW3xFqNFEOJOFQfEVYYUqtgED4AgBCMEwCABRsZgIAAGRMAgAAP+ICAIdoXoA==
Date: Mon, 6 Sep 2021 21:20:38 +0000
Message-ID: <caa90157957445828ecfe2f609f3bfcf@intel.com>
References: <20210730204134.21769-1-harry.wentland@amd.com>
 <20210730204134.21769-2-harry.wentland@amd.com>
 <20210802163042.2phdkytybie236x4@000377403353>
 <4e13504d-20ec-ae9c-7cb0-f79376d0f98b@amd.com>
 <20210816111029.74cisnhblllindcv@000377403353>
 <ace8dcf8-fe01-ad1e-8cfb-92e559f01d2f@amd.com>
 <a2fc2bd00af431a4f6e3842c6db072a2@sebastianwick.net>
In-Reply-To: <a2fc2bd00af431a4f6e3842c6db072a2@sebastianwick.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
x-originating-ip: [10.223.10.1]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: sebastian@sebastianwick.net <sebastian@sebastianwick.net>
> Sent: Monday, August 16, 2021 7:07 PM
> To: Harry Wentland <harry.wentland@amd.com>
> Cc: Brian Starkey <brian.starkey@arm.com>; Sharma, Shashank
> <shashank.sharma@amd.com>; amd-gfx@lists.freedesktop.org; dri-
> devel@lists.freedesktop.org; ppaalanen@gmail.com; mcasas@google.com;
> jshargo@google.com; Deepak.Sharma@amd.com; Shirish.S@amd.com;
> Vitaly.Prosyak@amd.com; aric.cyr@amd.com; Bhawanpreet.Lakha@amd.com;
> Krunoslav.Kovac@amd.com; hersenxs.wu@amd.com;
> Nicholas.Kazlauskas@amd.com; laurentiu.palcu@oss.nxp.com;
> ville.syrjala@linux.intel.com; nd@arm.com; Shankar, Uma
> <uma.shankar@intel.com>
> Subject: Re: [RFC PATCH v3 1/6] drm/doc: Color Management and HDR10 RFC
>=20
> On 2021-08-16 14:40, Harry Wentland wrote:
> > On 2021-08-16 7:10 a.m., Brian Starkey wrote:
> >> On Fri, Aug 13, 2021 at 10:42:12AM +0530, Sharma, Shashank wrote:
> >>> Hello Brian,
> >>> (+Uma in cc)
> >>>

Thanks Shashank for cc'ing me. Apologies for being late here. Now seems
all stakeholders are back so we can resume the UAPI discussion on color.

> >>> Thanks for your comments, Let me try to fill-in for Harry to keep
> >>> the design discussion going. Please find my comments inline.
> >>>
> >
> > Thanks, Shashank. I'm back at work now. Had to cut my trip short due
> > to rising Covid cases and concern for my kids.
> >
> >>> On 8/2/2021 10:00 PM, Brian Starkey wrote:
> >>>>
> >>
> >> -- snip --
> >>
> >>>>
> >>>> Android doesn't blend in linear space, so any API shouldn't be
> >>>> built around an assumption of linear blending.
> >>>>
> >
> > This seems incorrect but I guess ultimately the OS is in control of
> > this. If we want to allow blending in non-linear space with the new
> > API we would either need to describe the blending space or the
> > pre/post-blending gamma/de-gamma.
> >
> > Any idea if this blending behavior in Android might get changed in the
> > future?
>=20
> There is lots of software which blends in sRGB space and designers adjust=
ed to the
> incorrect blending in a way that the result looks right.
> Blending in linear space would result in incorrectly looking images.
>=20

I feel we should just leave it to userspace to decide rather than forcing l=
inear or non
Linear blending in driver.

> >>>
> >>> If I am not wrong, we still need linear buffers for accurate Gamut
> >>> transformation (SRGB -> BT2020 or other way around) isn't it ?
> >>
> >> Yeah, you need to transform the buffer to linear for color gamut
> >> conversions, but then back to non-linear (probably sRGB or gamma 2.2)
> >> for actual blending.
> >>
> >> This is why I'd like to have the per-plane "OETF/GAMMA" separate from
> >> tone-mapping, so that the composition transfer function is
> >> independent.
> >>
> >>>
> >>
> >> ...
> >>
> >>>>> +
> >>>>> +Tonemapping in this case could be a simple nits value or `EDR`_
> >>>>> +to
> >>>>> describe
> >>>>> +how to scale the :ref:`SDR luminance`.
> >>>>> +
> >>>>> +Tonemapping could also include the ability to use a 3D LUT which
> >>>>> might be
> >>>>> +accompanied by a 1D shaper LUT. The shaper LUT is required in
> >>>>> order to
> >>>>> +ensure a 3D LUT with limited entries (e.g. 9x9x9, or 17x17x17)
> >>>>> operates
> >>>>> +in perceptual (non-linear) space, so as to evenly spread the
> >>>>> limited
> >>>>> +entries evenly across the perceived space.
> >>>>
> >>>> Some terminology care may be needed here - up until this point, I
> >>>> think you've been talking about "tonemapping" being luminance
> >>>> adjustment, whereas I'd expect 3D LUTs to be used for gamut
> >>>> adjustment.
> >>>>
> >>>
> >>> IMO, what harry wants to say here is that, which HW block gets
> >>> picked and how tone mapping is achieved can be a very driver/HW
> >>> specific thing, where one driver can use a 1D/Fixed function block,
> >>> whereas another one can choose more complex HW like a 3D LUT for the
> >>> same.
> >>>
> >>> DRM layer needs to define only the property to hook the API with
> >>> core driver, and the driver can decide which HW to pick and
> >>> configure for the activity. So when we have a tonemapping property,
> >>> we might not have a separate 3D-LUT property, or the driver may fail
> >>> the atomic_check() if both of them are programmed for different
> >>> usages.
> >>
> >> I still think that directly exposing the HW blocks and their
> >> capabilities is the right approach, rather than a "magic" tonemapping
> >> property.
> >>
> >> Yes, userspace would need to have a good understanding of how to use
> >> that hardware, but if the pipeline model is standardised that's the
> >> kind of thing a cross-vendor library could handle.
> >>
> >
> > One problem with cross-vendor libraries is that they might struggle to
> > really be cross-vendor when it comes to unique HW behavior. Or they
> > might pick sub-optimal configurations as they're not aware of the
> > power impact of a configuration. What's an optimal configuration might
> > differ greatly between different HW.
> >
> > We're seeing this problem with "universal" planes as well.
>=20
> I'm repeating what has been said before but apparently it has to be said
> again: if a property can't be replicated exactly in a shader the property=
 is useless. If
> your hardware is so unique that it can't give us the exact formula we exp=
ect you
> cannot expose the property.
>=20
> Maybe my view on power consumption is simplistic but I would expect enum =
< 1d lut
> < 3d lut < shader. Is there more to it?
>=20
> Either way if the fixed KMS pixel pipeline is not sufficient to expose th=
e intricacies of
> real hardware the right move would be to make the KMS pixel pipeline more
> dynamic, expose more hardware specifics and create a hardware specific us=
er space
> like mesa. Moving the whole compositing with all its policies and decisio=
n making
> into the kernel is exactly the wrong way to go.
>=20

I agree here, we can give flexibility to userspace to decide how it wants t=
o use the hardware
blocks. So exposing the hardware capability to userspace and then servicing=
 on its behalf would be
the right way to go for driver I believe. Any compositor or userspace can d=
efine its own policy and
drive the hardware.

We already have done that with crtc level color properties. We can do the s=
ame for plane color. HDR
will be just be an extension that way.

> Laurent Pinchart put this very well:
> https://lists.freedesktop.org/archives/dri-devel/2021-June/311689.html
>=20
> >> It would definitely be good to get some compositor opinions here.
> >>
> >
> > For this we'll probably have to wait for Pekka's input when he's back
> > from his vacation.
> >
Yeah, Pekka's input would be really useful here.

We can work together Harry to come up with unified UAPI's which caters to g=
eneral purpose color hardware
pipeline. Just floated a RFC series with a UAPI proposal, link below:
https://patchwork.freedesktop.org/series/90826/

Please check and share your feedback.

Regards,
Uma Shankar
> >> Cheers,
> >> -Brian
> >>
