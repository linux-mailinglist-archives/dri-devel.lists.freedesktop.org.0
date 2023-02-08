Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E491E68ECEC
	for <lists+dri-devel@lfdr.de>; Wed,  8 Feb 2023 11:32:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A23510E71E;
	Wed,  8 Feb 2023 10:32:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3EB010E60E;
 Wed,  8 Feb 2023 10:32:10 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id x9so11753749eds.12;
 Wed, 08 Feb 2023 02:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=PwgZorPXWlmssBIjooaJZgaMkkmpLdgZosjWkrrG9R0=;
 b=P2c3iH4eTNfaO5Uho5yveJgD9fh805gzysCWR1TT8wOZSViEmjSEGHxL/pnaGlnUl9
 Y+BwcIrNZTUTrdc3RC2u1WWuzJI3sXBeDbjyJolUcTJobwzBP1g/d4hnLEd52P0HI9lW
 CpGdPMbxyzEGnMYJtkLjNphP70pRKs7qT4QaMIXDh4D0RjIgTSNv182XNa1fM0cmAu+V
 nX4WYIQWHMDUqTnXlCSRHSifjKG9j6D/yZhiTn6WIfLLzmN0Gig/ROZQY2CpXMg7Ehmi
 2q9U2s+U8ryEQHZNR68syF4FloX55ALV+b++RXIFLIKCp+jQi7iV4VEtIFMOwVeFA3wz
 jC1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PwgZorPXWlmssBIjooaJZgaMkkmpLdgZosjWkrrG9R0=;
 b=VoK9TgFUznHOdnmrC02zgpEVmoBgQgRH8YnMK0CbdXEcbuMCJVPveoVSKD9KK/+/z6
 VLna7OqjExQFAcyQctMsBZgVkF+I6PI+OHKNN/CDBNXHwvSnJ5yv+uB91NXMVQjOlDn0
 5EZARoAQCN4QAeZm5mdz9ADbyUAARlPZeKfeP9NTY3DrQuW1NbFeTAEpNjFG24yTgFhN
 j9gjuh5WA/kGuTCDaeaBcahPmlWIpr1LWkS9rSZVkptbnlnL03GkNcIcg27ia4K7tPRA
 rblIfXhNuShytz0KRNKcq3YkCD33Df5S0co47b3b0zjKbUB5gEzKb3DuOfeUgZI0mZhj
 ovHQ==
X-Gm-Message-State: AO0yUKWywF16ZNudMq768667gvMAtcJxX6DXhk5DxQfz9xWJnFGJhCOD
 +XtlKPlsTpBioua1sxRe5TI=
X-Google-Smtp-Source: AK7set/SzuSn4PcRgAOprwPPUZZ1MNfjfnbp6w6g4Le/J1MRnL3Z1V4DfHVGiVjySP1AQrO/4q7g4A==
X-Received: by 2002:a50:8755:0:b0:4aa:a52d:f99b with SMTP id
 21-20020a508755000000b004aaa52df99bmr7821804edv.31.1675852329164; 
 Wed, 08 Feb 2023 02:32:09 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 en14-20020a056402528e00b0049622a61f8fsm7637157edb.30.2023.02.08.02.32.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 02:32:08 -0800 (PST)
Date: Wed, 8 Feb 2023 12:32:04 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [PATCH 3/3] drm/connector: Deprecate split for BT.2020 in
 drm_colorspace enum
Message-ID: <20230208123204.1039b15f@eldfell>
In-Reply-To: <37a98a8f-3c06-8a83-013a-aec5390146a3@amd.com>
References: <CA+hFU4ymiOg06MQeKLcn5MSrR=BZnOLODdZCFvGUdWqt_ha61A@mail.gmail.com>
 <0fc18aec-0703-55f4-f635-d09d345e8dc0@amd.com>
 <Y90l+DY0rSaMvN1U@intel.com>
 <758e5cf6-53e0-567c-c760-5b773bc7a11c@amd.com>
 <Y90vrEa3/1RbaGOV@intel.com>
 <f9633729-2db0-3bf1-311d-f03bd04d47a6@amd.com>
 <Y91Y98jyOimabC3O@intel.com> <Y91fsmgAx65koWI5@intel.com>
 <Y91hyNAplv4nuW5Y@intel.com>
 <a3d46b3a-ebd5-e02c-3db4-783f2a34b36c@froggi.es>
 <Y+DMwPu6IMVHsmpD@intel.com>
 <37a98a8f-3c06-8a83-013a-aec5390146a3@amd.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/G/55qWGBzpWOO0QKghU1LDO";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, dri-devel@lists.freedesktop.org,
 Uma Shankar <uma.shankar@intel.com>, amd-gfx@lists.freedesktop.org,
 Joshua Ashton <joshua@froggi.es>, Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/G/55qWGBzpWOO0QKghU1LDO
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 6 Feb 2023 12:16:28 -0500
Harry Wentland <harry.wentland@amd.com> wrote:

> On 2/6/23 04:47, Ville Syrj=C3=A4l=C3=A4 wrote:
> > On Sat, Feb 04, 2023 at 06:09:45AM +0000, Joshua Ashton wrote: =20
> >>
> >>
> >> On 2/3/23 19:34, Ville Syrj=C3=A4l=C3=A4 wrote: =20
> >>> On Fri, Feb 03, 2023 at 09:25:38PM +0200, Ville Syrj=C3=A4l=C3=A4 wro=
te: =20
> >>>> On Fri, Feb 03, 2023 at 08:56:55PM +0200, Ville Syrj=C3=A4l=C3=A4 wr=
ote: =20
> >>>>> On Fri, Feb 03, 2023 at 01:28:20PM -0500, Harry Wentland wrote: =20
> >>>>>>
> >>>>>>
> >>>>>> On 2/3/23 11:00, Ville Syrj=C3=A4l=C3=A4 wrote: =20
> >>>>>>> On Fri, Feb 03, 2023 at 10:24:52AM -0500, Harry Wentland wrote: =
=20
> >>>>>>>>
> >>>>>>>>
> >>>>>>>> On 2/3/23 10:19, Ville Syrj=C3=A4l=C3=A4 wrote: =20
> >>>>>>>>> On Fri, Feb 03, 2023 at 09:39:42AM -0500, Harry Wentland wrote:=
 =20
> >>>>>>>>>>
> >>>>>>>>>>
> >>>>>>>>>> On 2/3/23 07:59, Sebastian Wick wrote: =20
> >>>>>>>>>>> On Fri, Feb 3, 2023 at 11:40 AM Ville Syrj=C3=A4l=C3=A4
> >>>>>>>>>>> <ville.syrjala@linux.intel.com> wrote: =20
> >>>>>>>>>>>>
> >>>>>>>>>>>> On Fri, Feb 03, 2023 at 02:07:44AM +0000, Joshua Ashton wrot=
e: =20
> >>>>>>>>>>>>> Userspace has no way of controlling or knowing the pixel en=
coding
> >>>>>>>>>>>>> currently, so there is no way for it to ever get the right =
values here. =20
> >>>>>>>>>>>>
> >>>>>>>>>>>> That applies to a lot of the other values as well (they are
> >>>>>>>>>>>> explicitly RGB or YCC). The idea was that this property sets=
 the
> >>>>>>>>>>>> infoframe/MSA/SDP value exactly, and other properties should=
 be
> >>>>>>>>>>>> added to for use userspace to control the pixel encoding/col=
orspace
> >>>>>>>>>>>> conversion(if desired, or userspace just makes sure to
> >>>>>>>>>>>> directly feed in correct kind of data). =20
> >>>>>>>>>>>
> >>>>>>>>>>> I'm all for getting userspace control over pixel encoding but=
 even
> >>>>>>>>>>> then the kernel always knows which pixel encoding is selected=
 and
> >>>>>>>>>>> which InfoFrame has to be sent. Is there a reason why userspa=
ce would
> >>>>>>>>>>> want to control the variant explicitly to the wrong value?
> >>>>>>>>>>> =20
> >>>>>>>>>>
> >>>>>>>>>> I've asked this before but haven't seen an answer: Is there an=
 existing
> >>>>>>>>>> upstream userspace project that makes use of this property (ot=
her than
> >>>>>>>>>> what Joshua is working on in gamescope right now)? That would =
help us
> >>>>>>>>>> understand the intent better. =20
> >>>>>>>>>
> >>>>>>>>> The intent was to control the infoframe colorimetry bits,
> >>>>>>>>> nothing more. No idea what real userspace there was, if any. =20
> >>
> >> Controlling the infoframe alone isn't useful at all unless you can=20
> >> guarantee the wire encoding, which we cannot do.
> >> =20
> >>>>>>>>> =20
> >>>>>>>>>>
> >>>>>>>>>> I don't think giving userspace explicit control over the exact=
 infoframe
> >>>>>>>>>> values is the right thing to do. =20
> >>
> >> +1
> >> =20
> >>>>>>>>>
> >>>>>>>>> Only userspace knows what kind of data it's stuffing into
> >>>>>>>>> the pixels (and/or how it configures the csc units/etc.) to
> >>>>>>>>> generate them.
> >>>>>>>>> =20
> >>>>>>>>
> >>>>>>>> Yes, but userspace doesn't control or know whether we drive
> >>>>>>>> RGB or YCbCr on the wire. In fact, in some cases our driver
> >>>>>>>> needs to fallback to YCbCr420 for bandwidth reasons. There
> >>>>>>>> is currently no way for userspace to know that and I don't
> >>>>>>>> think it makes sense. =20
> >>>>>>>
> >>>>>>> People want that control as well for whatever reason. We've
> >>>>>>> been asked to allow YCbCr 4:4:4 output many times.
> >>>>>>>
> >>>>>>> The automagic 4:2:0 fallback I think is rather fundementally
> >>>>>>> incompatible with fancy color management. How would we even
> >>>>>>> know whether to use eg. BT.2020 vs. BT.709 matrix? In i915
> >>>>>>> that stuff is just always BT.709 limited range, no questions
> >>>>>>> asked. =20
> >>
> >> That's what the Colorspace property *should* be determining here.
> >> That's what we have it set up to do in SteamOS/my tree right now.
> >> =20
> >>>>>>> =20
> >>>>>>
> >>>>>> We use what we're telling the display, i.e., the value in the
> >>>>>> colorspace property. That way we know whether to use a BT.2020
> >>>>>> or BT.709 matrix. =20
> >>>>>
> >>>>> And given how these things have gone in the past I think
> >>>>> that is likey to bite someone at in the future. Also not
> >>>>> what this property was meant to do nor does on any other
> >>>>> driver AFAIK.
> >>>>> =20
> >>>>>> I don't see how it's fundamentally incompatible with fancy
> >>>>>> color management stuff.
> >>>>>>
> >>>>>> If we start forbidding drivers from falling back to YCbCr
> >>>>>> (whether 4:4:4 or 4:2:0) we will break existing behavior on
> >>>>>> amdgpu and will see bug reports. =20
> >>>>>
> >>>>> The compositors could deal with that if/when they start doing
> >>>>> the full color management stuff. The current stuff only really
> >>>>> works when the kernel is allowed to do whatever it wants.
> >>>>> =20
> >>>>>> =20
> >>>>>>> So I think if userspace wants real color management it's
> >>>>>>> going to have to set up the whole pipeline. And for that
> >>>>>>> we need at least one new property to control the RGB->YCbCr
> >>>>>>> conversion (or to explicitly avoid it). =20
> >>
> >> I mentioned this in my commit description, we absolutely should offer=
=20
> >> fine control here eventually.
> >>
> >> I don't think we need to solve that problem here though.
> >> =20
> >>>>>>>
> >>>>>>> And given that the proposed patch just swept all the
> >>>>>>> non-BT.2020 issues under the rug makes me think no
> >>>>>>> one has actually come up with any kind of consistent
> >>>>>>> plan for anything else really.
> >>>>>>> =20
> >>>>>>
> >>>>>> Does anyone actually use the non-BT.2020 colorspace stuff? =20
> >>>>>
> >>>>> No idea if anyone is using any of it. It's a bit hard to do
> >>>>> right now outside the full passthrough case since we have no
> >>>>> properties to control how the hardware will convert stuff. =20
> >>
> >> No, every userspace knows that encoding of the output buffer before=20
> >> going to the wire format is RGB.
> >>
> >> It's the only way you can have planes alpha-blend, or mix and match RG=
B=20
> >> and NV12, etc.
> >> =20
> >>>>>
> >>>>> Anyways, sounds like what you're basically proposing is
> >>>>> getting rid of this property and starting from scratch. =20
> >>>>
> >>>> Hmm. I guess one option would be to add that property to
> >>>> control the output encoding, but include a few extra
> >>>> "automagic" values to it which would retain the kernel's
> >>>> freedom to select whether to do the RGB->YCbCr conversion
> >>>> or not.
> >>>>
> >>>> enum output_encoding {
> >>>> 	auto rgb=3Ddefault/nodata,ycbcr=3Dbt601
> >>>> 	auto rgb=3Ddefault/nodata,ycbcr=3Dbt709
> >>>> 	auto rgb=3Dbt2020,ycbcr=3Dbt2020
> >>>> 	passthrough,
> >>>> 	rgb->ycbcr bt601,
> >>>> 	rgb->ycbcr bt709,
> >>>> 	rgb->ycbcr bt2020,
> >>>> } =20
> >>>
> >>> In fact there should perhaps be a lot more of the explicit
> >>> options to get all subsamlings and quantizations ranges
> >>> coverted. That might actually be really nice for an igt
> >>> to get more full test coverage.
> >>> =20
> >> The choice of encoding of the pixel on the wire should be unrelated to=
=20
> >> the overall output colorspace from the userspace side -- but how the=20
> >> display engine converts the output to that wire format *is* dependent =
on=20
> >> the colorspace.
> >> eg. picking a rec.709 ctc vs a rec.2020 ctc matrix.
> >>
> >> I see you are proposing a "passthrough" but that wouldn't work at all =
as=20
> >> you still need to at know if you are RGB or YCbCr for the infoframe an=
d=20
> >> to perform chroma subsampling in the display engine. =20
> >=20
> > The passthrough (and other knobs after it) were meant for=20
> > explicit control, which means they wouldn't affect infoframes.
> >=20
> > But probably we should have seprate properties for explicit
> > control of each knob vs. some kind of easier to use property.
> > And I suppose we can still leave the explicit control stuff
> > for later (apart from the one property we already have).
> >  =20
> >>
> >> I perused the initial patches that added this property, and it seems=20
> >> there were no IGT tests or userspace implementation, so I am not=20
> >> entirely sure why it was committed in the first place. =20
> >=20
> > I presume at least the kodi HDR stuff uses ths. There may
> > have also been some chromeos stuff going on. Can't recall
> > anymore. =20
>=20
> I can't find mention of "colorspace" in kodi. Its SetHDR() [1]
> function only sets HDR_OUTPUT_METADATA.
>=20
> [1] https://github.com/xbmc/xbmc/blob/122916890a2b82ad8defaf2fd1934076387=
df84d/xbmc/windowing/gbm/WinSystemGbm.cpp#L316
>=20
> >=20
> > As for IGT, there's nothing we can really test since we=20
> > have no way to get the inforframes/etc. back from the sink.
> > Hence nothing beyond the normal kms_property sanity checks
> > really makes sense.
> >  =20
>=20
> True, though a generic infoframe readback through debugfs might
> be a nice-to-have for testing things that are expected to modify
> the infoframe.
>=20
> >>
> >> Nobody can safely use Colorspace because of this problem right now.
> >>
> >> If nobody is using this property, perhaps we could just get a fresh=20
> >> start, and either re-purpose it with new enum values, or obsolete it a=
nd=20
> >> make a new property.
> >> If we do this, let's start with the absolute bare minimum, such as:
> >> "Default/Rec.709 (sRGB), BT.2020"
> >> and then grow as we need, making sure we have the full circle from=20
> >> userspace->output complete and working for each new value we add. =20
> >  =20
>=20
> I agree. This leaves room for API that can be extensible but let's
> not define things unless they're actually used in a full-stack
> implementation.
>=20
> > Yeah, I think a fresh property is what we want.
> >  =20
>=20
> Agreed. And if this new property is also updating the infoframe it needs
> to be clear it's mutually exclusive with the existing property.
>=20
> Harry
>=20
> >>
> >> Please don't take this as me saying we shouldn't add all these other=20
> >> options like opRGB, etc, I just want us to progress to a solid base fo=
r=20
> >> expanding further here, which we really don't have right now.
> >>
> >> - Joshie =F0=9F=90=B8=E2=9C=A8 =20

Hi,

I agree with everything Joshua said here.

Something for reading back the infoframe that the driver is supposedly
sending to the sink seems absolutely crucial for any kind of testing.

New properties are a good idea, it saves us from trying to figure out
what "Colorspace" means, and you can forget all my questions there. :-)
Let's try to throw "Colorspace" away.

I'm a bit concerned of Ville musing about a property where some values
affect infoframes and others don't. It doesn't feel right.

Allowing the driver to pick the "best" values does seem useful, but it
should always come with a way to see what it has actually picked. If
nothing else, it allows userspace to warn the end user if things are
sub-optimal, or simply saying what they get. Some end users are happy to
fiddle with display settings to get exactly what they want, and we
cannot know what trade-offs they prefer.

It would be even better if userspace could see what the driver *would*
pick without actually committing it, but that's not possible under the
current KMS uAPI design AFAIK.

If there was a way to see what settings the driver picked for cable
encoding (in stable uAPI, not debugfs!), I believe it would be less
important to have strict explicit userspace control of every detail.
OTOH, it should be possible to reach every allowed cable encoding
combination somehow.

FWIW, I'm not worried about HDR_OUTPUT_METADATA. It strictly affects
infoframes only, it does not seem to have any interaction with the
cable encoding as far as I can tell. Well, there is the transfer
function which matters with the constant luminance color model
conversion. Otherwise HDR_OUTPUT_METADATA is describing the content
colorimetry limits, while cable encoding is concerned with container
specification.


Thanks,
pq

--Sig_/G/55qWGBzpWOO0QKghU1LDO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmPjeiQACgkQI1/ltBGq
qqeUQQ/+NiCm5rM9REZY0/f68WFu4irMTYr7gdS8l+p1PiZz+ZMg6S5eqHgfiDi0
cptOfO60l7S+trLJRm7rDL0OCaPYKJOGO6zgR6eoMKlxzapmiKfQGDXgfBJmATL3
Zzln/KgmoQbCx+MUNp0j/Wmp90qlPsfiIX9oebymEZ871VPEuweszAI/XUa4WFy5
pgvy7eMNprfMQNjiVBSRj124J6RcjkC77QdZcde9AbYigZEhK4kooe38TDwed3AF
fVnlgDhZqfum95C9jeFHgU+nbwxcEOTy85w6cCXo7/RxbSAweL0CQK9DNPyO4EQR
guYrS6/PVSRCl/xZwBhUHqQa39C8vsrKQzzV/5Sym/SqYKr7+5vQN8F+sJCHr43r
1oVVkZVm1dx+5q4yhpIz4pyEsre79/mBzdqfdaV1kfUYtqZzWW3965VT3z+Ai3qx
ZhG/bq5TcdB7FbwGAk2Hp/yn1eimXGy8oF5/zTNwSMIVvCuMn4w9fJORUuCF/nsi
jacaVr8BMgp7XZrw1Cqnsk5szmaZ4mjgFljm01FzHTNYwMbnPGVworfHU1dQ+5E6
IBQSctCFoxHjE7F1r6v6Ymj7vY3gYiu4adNN74us2zeHaT/Ow5fy4cj7ZwbCe/bS
PEg0Dv1tHY1dK83o+ZgYiNGAukfOWneJDE0YwBZI544s39j5XTY=
=5p38
-----END PGP SIGNATURE-----

--Sig_/G/55qWGBzpWOO0QKghU1LDO--
