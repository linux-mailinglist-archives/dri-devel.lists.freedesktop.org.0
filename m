Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F109697922
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 10:40:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0036E10EA7D;
	Wed, 15 Feb 2023 09:40:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E68C10E118;
 Wed, 15 Feb 2023 09:40:07 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id ml19so46826388ejb.0;
 Wed, 15 Feb 2023 01:40:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=WW5etZFr5gb9SjIRKumGq4b+IgoinikPRFf6ztXrNCI=;
 b=V3tQSIfzhFyE0BCMgM6M3YOzAgRFrN9Fdfp0f8H6pvpsYDwZ88j8RLsVqfG9k4aAhI
 Cib7cjoSmKmZ0k+Lv9oepQG9rdYzUVZTEgI+ISww4j4C497dDfh+vIz1s0xbCqO2EL41
 BJHpMea7Vagg36Y3Vzr5AblknOqG0BZeORBZuLZpFM8fbFIxhDf40FN1Z5JT1mwPtzdv
 2E+I9ne/j3HIE7XsH5iwbEmmxZe0+yaQAbVBMzTKphi3JJrHMetcRNoTFR36LSGBkuIZ
 iXFh5GIjxLR29eIiitBIzjTFG4Wn1Y712dKQV6Q4Tsy4UdATArwislLgeSYZSGzTQg+x
 JQpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WW5etZFr5gb9SjIRKumGq4b+IgoinikPRFf6ztXrNCI=;
 b=LecYGNE2IAIykWm23h2UlARz4X9DBLs6LaakeiNF2Yfm8SFf5wxWh+NCs9epMKM/B7
 L7goWVccDa2eXMJalPuFbTcFSB9lTrOBaeX0qiNlv7YEzZWkgLsslI2Pd2XiQLTg5O3m
 JqPL0iV3o8JUmaKSnUGD8RYVaN2LYyQyjr+0lc46R9k1N9bp1zmabRUILh5T2N+aLgiL
 x0KSqMEkme17yhdC0qt0t4+oevPMHp8qKvx4whViro+vP16hhzMsxD+L9DF7y55sr45s
 L2IEpz6PoBJfqXd3uhVx9hJE2mrPdG92oQSQv/YC01cnpKKAuycj1Cqidsx03ATuI1XU
 6NMg==
X-Gm-Message-State: AO0yUKWnRck806XG+/8GP1M4BIaMhffJwaFaluFXFiqgzwpTAZi/DB+r
 a4F8m/rsaJIV9pjjnGhK/Ic=
X-Google-Smtp-Source: AK7set9pssdkTT8EItQYvruO1TSRXqBo0ATP4Hzgqz0NCYMO/7K7uWnhcByMHRIxxJtLu0LybYETaw==
X-Received: by 2002:a17:906:81d5:b0:8af:5751:badc with SMTP id
 e21-20020a17090681d500b008af5751badcmr1756205ejx.28.1676454005358; 
 Wed, 15 Feb 2023 01:40:05 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 z12-20020a17090674cc00b008aac25d8f7fsm9618104ejl.97.2023.02.15.01.40.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 01:40:04 -0800 (PST)
Date: Wed, 15 Feb 2023 11:40:00 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [PATCH 3/3] drm/connector: Deprecate split for BT.2020 in
 drm_colorspace enum
Message-ID: <20230215114000.41df70d5@eldfell>
In-Reply-To: <549abc92-e862-8a6b-d4ad-8cd6cc854591@amd.com>
References: <20230203020744.30745-1-joshua@froggi.es>
 <20230203020744.30745-3-joshua@froggi.es>
 <Y9zkef5FjtZ7guVS@intel.com>
 <CA+hFU4ymiOg06MQeKLcn5MSrR=BZnOLODdZCFvGUdWqt_ha61A@mail.gmail.com>
 <0fc18aec-0703-55f4-f635-d09d345e8dc0@amd.com>
 <Y90l+DY0rSaMvN1U@intel.com>
 <758e5cf6-53e0-567c-c760-5b773bc7a11c@amd.com>
 <Y90vrEa3/1RbaGOV@intel.com>
 <CA+hFU4wuM_xHniFyRT+jouQ3k_S3UJsRpAtd1Lgx9UVLtrqZrQ@mail.gmail.com>
 <98d1d22a-1c29-5271-1eaf-89c962eb9678@amd.com>
 <CA+hFU4y=N3bR-vXXeLP0xTe0-HJPgF_GTbKrb3A9St-z2LignQ@mail.gmail.com>
 <549abc92-e862-8a6b-d4ad-8cd6cc854591@amd.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/07vxxmy176geY0MRGiU3n3n";
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

--Sig_/07vxxmy176geY0MRGiU3n3n
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 14 Feb 2023 15:04:52 -0500
Harry Wentland <harry.wentland@amd.com> wrote:

> On 2/14/23 14:45, Sebastian Wick wrote:
> > On Tue, Feb 14, 2023 at 5:57 PM Harry Wentland <harry.wentland@amd.com>=
 wrote: =20
> >>
> >>
> >>
> >> On 2/14/23 10:49, Sebastian Wick wrote: =20
> >>> On Fri, Feb 3, 2023 at 5:00 PM Ville Syrj=C3=A4l=C3=A4
> >>> <ville.syrjala@linux.intel.com> wrote: =20
> >>>>
> >>>> On Fri, Feb 03, 2023 at 10:24:52AM -0500, Harry Wentland wrote: =20
> >>>>>
> >>>>>
> >>>>> On 2/3/23 10:19, Ville Syrj=C3=A4l=C3=A4 wrote: =20
> >>>>>> On Fri, Feb 03, 2023 at 09:39:42AM -0500, Harry Wentland wrote: =20
> >>>>>>>
> >>>>>>>
> >>>>>>> On 2/3/23 07:59, Sebastian Wick wrote: =20
> >>>>>>>> On Fri, Feb 3, 2023 at 11:40 AM Ville Syrj=C3=A4l=C3=A4
> >>>>>>>> <ville.syrjala@linux.intel.com> wrote: =20
> >>>>>>>>>
> >>>>>>>>> On Fri, Feb 03, 2023 at 02:07:44AM +0000, Joshua Ashton wrote: =
=20
> >>>>>>>>>> Userspace has no way of controlling or knowing the pixel encod=
ing
> >>>>>>>>>> currently, so there is no way for it to ever get the right val=
ues here. =20
> >>>>>>>>>
> >>>>>>>>> That applies to a lot of the other values as well (they are
> >>>>>>>>> explicitly RGB or YCC). The idea was that this property sets the
> >>>>>>>>> infoframe/MSA/SDP value exactly, and other properties should be
> >>>>>>>>> added to for use userspace to control the pixel encoding/colors=
pace
> >>>>>>>>> conversion(if desired, or userspace just makes sure to
> >>>>>>>>> directly feed in correct kind of data). =20
> >>>>>>>>
> >>>>>>>> I'm all for getting userspace control over pixel encoding but ev=
en
> >>>>>>>> then the kernel always knows which pixel encoding is selected and
> >>>>>>>> which InfoFrame has to be sent. Is there a reason why userspace =
would
> >>>>>>>> want to control the variant explicitly to the wrong value?
> >>>>>>>> =20
> >>>>>>>
> >>>>>>> I've asked this before but haven't seen an answer: Is there an ex=
isting
> >>>>>>> upstream userspace project that makes use of this property (other=
 than
> >>>>>>> what Joshua is working on in gamescope right now)? That would hel=
p us
> >>>>>>> understand the intent better. =20
> >>>>>>
> >>>>>> The intent was to control the infoframe colorimetry bits,
> >>>>>> nothing more. No idea what real userspace there was, if any.
> >>>>>> =20
> >>>>>>>
> >>>>>>> I don't think giving userspace explicit control over the exact in=
foframe
> >>>>>>> values is the right thing to do. =20
> >>>>>>
> >>>>>> Only userspace knows what kind of data it's stuffing into
> >>>>>> the pixels (and/or how it configures the csc units/etc.) to
> >>>>>> generate them.
> >>>>>> =20
> >>>>>
> >>>>> Yes, but userspace doesn't control or know whether we drive
> >>>>> RGB or YCbCr on the wire. In fact, in some cases our driver
> >>>>> needs to fallback to YCbCr420 for bandwidth reasons. There
> >>>>> is currently no way for userspace to know that and I don't
> >>>>> think it makes sense. =20
> >>>>
> >>>> People want that control as well for whatever reason. We've
> >>>> been asked to allow YCbCr 4:4:4 output many times. =20
> >>>
> >>> I don't really think it's a question of if we want it but rather how
> >>> we get there. Harry is completely right that if we would make the
> >>> subsampling controllable by user space instead of the kernel handling
> >>> it magically, user space which does not adapt to the new control won't
> >>> be able to light up some modes which worked before.
> >>> =20
> >>
> >> Thanks for continuing this discussion and touching on the model of how
> >> we get to where we want to go.
> >> =20
> >>> This is obviously a problem and not one we can easily fix. We would
> >>> need a new cap for user space to signal "I know that I can control
> >>> bpc, subsampling and compression to lower the bandwidth and light up
> >>> modes which otherwise fail". That cap would also remove all the
> >>> properties which require kernel magic to work (that's also what I
> >>> proposed for my KMS color pipeline API).
> >>>
> >>> We all want to expose more of the scanout capability and give user
> >>> space more control but I don't think an incremental approach works
> >>> here and we would all do better if we accept that the current API
> >>> requires kernel magic to work and has a few implicit assumptions baked
> >>> in.
> >>>
> >>> With all that being said, I think the right decision here is to
> >>>
> >>> 1. Ignore subsampling for now
> >>> 2. Let the kernel select YCC or RGB on the cable
> >>> 3. Let the kernel figure out the conversion between RGB and YCC based
> >>> on the color space selected
> >>> 4. Let the kernel send the correct infoframe based on the selected
> >>> color space and cable encoding
> >>> 5. Only expose color spaces for which the kernel can do the conversion
> >>> and send the infoframe =20
> >>
> >> I agree. We don't want to break or change existing behavior (that is
> >> used by userspace) and this will get us far without breaking things.
> >> =20
> >>> 6. Work on the new API which is hidden behind a cap

Hi,

I agree on all that, too.

> >>> =20
> >>
> >> I assume you mean something like
> >> https://gitlab.freedesktop.org/pq/color-and-hdr/-/issues/11 =20
> >=20
> > Something like that, yes. The main point being a cap which removes a
> > lot of properties and sets new expectations between user space and
> > kernel. The actual API is not that important.
> >  =20
> >> Above you say that you don't think an incremental approach works
> >> here. Can you elaborate? =20
> >=20
> > Backwards compatibility is really hard. If we add another property to
> > control e.g. the color range infoframe which doesn't magically convert
> > colors, we now have to define how it interacts with the existing
> > property. We also have to figure out how a user space which doesn't
> > know about the new property behaves when another client has set that
> > property. If any property which currently might change the pixel
> > values is used, we can't expose the entire color pipeline because the
> > kernel might have to use some element in it to achieve its magic
> > conversion. So essentially you already have this hard device between
> > "old" and "new" and you can't use the new stuff incrementally.
> >  =20
>=20
> True. If we go toward a new color API that gives userspace explicit
> control of the entire pipeline it is by definition incompatible with
> a "legacy" API that touches the same HW.
>=20
> >>  From what I've seen recently I am inclined to favor an incremental
> >> approach more. The reason is that any API, or portion thereof, is
> >> useless unless it's enabled full stack. When it isn't it becomes
> >> dead code quickly, or never really works because we overlooked
> >> one thing. The colorspace debacle shows how even something as
> >> simple as extra enum values in KMS APIs shouldn't be added unless
> >> someone in a canonical upstream project actually uses them. I
> >> would argue that such a canonical upstream project actually has
> >> to be a production environment and not something like Weston. =20

That's an interesting opinion about Weston.

Harry, are you perhaps assuming that Weston refuses to use experimental
UAPIs from downstream kernels, or where does that come from?

I think there is a lot of gray area that has not really been discussed
for Weston's policy. One thing is certain that Weston does not want to
go against upstream kernel policy, but that's a problem you need to
solve anyway if you want to use downstream kernel experimental UAPI.

> >=20
> > I agree that it's very easy to design something that doesn't work in
> > the real world but weston is a real production environment. Even a new
> > project can be a real production environment imo. The goals here are
> > not entirely undefined: we have color transformations and we want to
> > offload them.
> >  =20
> >> I could see us getting to a fully new color pipeline API but
> >> the only way to do that is with a development model that supports
> >> it. While upstream needs to be our ultimate goal, a good way
> >> to bring in new APIs and ensure a full-stack implementation is
> >> to develop them in a downstream production kernel, alongside
> >> userspace that makes use of it. Once the implementation is
> >> proven in the downstream repos it can then go upstream. This
> >> brings new challenges, though, as things don't get wide
> >> testing and get out of sync with upstream quickly. The
> >> alternative is the incremental approach. =20
> >=20
> > I also agree pretty much with everything here. My current idea is that
> > we would add support for the new API in a downstream kernel for at
> > least VKMS (one real driver probably makes sense as well) while in
> > parallel developing a user space library for color conversions. That
> > library might be a rewrite of libplacebo, which in its current form
> > does all the color conversions we want to do but wasn't designed to
> > allow for offloading. One of the developers expressed interest in
> > rewriting the library in rust which would be a good opportunity to
> > also take offloading into account.
> >  =20
>=20
> Doesn't libplacebo hook into video players, i.e., above the Wayland
> protocol layer? Is the idea to bring it into a Wayland compositor
> and teach it how to talk to DRM/KMS?
>=20
> I wonder if it makes sense to somehow combine it with libliftoff for HW
> offloading, since that library is already tackling the problem of
> deciding whether to offload to KMS.
>=20
> > No doubt all of that will take a significant amount of effort and time
> > but we can still get HDR working in the old model without offloading
> > and just sRGB and PQ/Rec2020 code paths.
> >  =20
>=20
> I would like to get to some form of HDR including offloading by adding
> new per-plane LUTs or enumerated transfer functions as "legacy"=20
> properties. This would likely be much more tailored to specific=20
> use-cases than what Weston needs but would allow us to enable multi-plane
> HDR in a more reasonable timeframe on applicable HW. These new
> properties can educate an all-encompassing new DRM color API.

I think Weston should be fine with those legacy style KMS properties.
The problem might be that the required per-plane operations are
different than what KMS can express.

I have designed the Weston internals to carry the highest level
information about an operational element like a curve set to allow
everything from enumerated fixed curves and down to an arbitrary LUT,
including falling back to lower level description when necessary. E.g.
if there is no enumerated curve for something and it doesn't match
parameterised curve either, Weston can always fall back to a LUT if
precision is acceptable.

There will not be inference to go from LUT to a higher level
description, so all that depends on applications using the highest
level description they can, which is what we are designing into
color-representation and color-management.

That does pose a challenge for Weston's color pipeline optimiser, but I
do very much want it to get there. Converting everything into a LUT is
losing precision and performance.

However.

I am not in any hurry to make use of KMS color pipeline off-loading
features in Weston. I am approaching the API problem from the
application direction: what do applications and compositors need from
the color pipeline, and not how to expose everything of all existing
hardware. This does mean that it will take a long time before Weston is
ready to provide guidance on what an off-loading library API should
look like.

That's my opinion: I need to know what I want before I start asking for
it. Maybe someone who has a strong background in color science and
experience with video systems knows what the answer will be, but I
don't.

Still, I do need to be able to drive a monitor in known configuration
and correctly, which is why the "Colorspace" property discussion is
relevant to me right now.


Thanks,
pq

>=20
> >> We should look at this from a use-case angle, similar to what
> >> the gamescope guys are doing. Small steps, like:
> >> 1) Add HDR10 output (PQ, BT.2020) to the display
> >> 2) Add ability to do sRGB linear blending
> >> 3) Add ability to do sRGB and PQ linear blending
> >> 4) Post-blending 3D LUT
> >> 5) Pre-blending 3D LUT =20
> >=20
> > Sure, having a target in sight is a good idea.
> >  =20
> >> At each stage the whole stack needs to work together in production.
> >>
> >> If we go to a new color pipeline programming model it might
> >> make sense to enable this as an "experimental" API that is
> >> under development. I don't know if we've ever done that in
> >> DRM/KMS. One way to do this might be with a new CONFIG option
> >> that only exposes the new color pipeline API when enabled and
> >> defaults to off, alongside a client cap for clients that
> >> are advertising a desire to use the (experimental) API. =20
> >=20
> > Yeah, that's a bit tricky. I also don't know how upstream would like
> > this approach. Not even sure who to talk to.
> >  =20
>=20
> Agreed, I'm also not sure whether this would fly. airlied or danvet
> might have an opinion.
>=20
> This thought was inspired by "Blink Intents", which is a mechanism
> how new full-stack features land in the Chromium browsers:
> https://www.youtube.com/watch?v=3D9cvzZ5J_DTg
>=20
> Harry
>=20
> >> If we have that we could then look at porting all existing
> >> use-cases over and verifying them (including IGT tests) before
> >> moving on to HDR and wide-gamut use-cases. It's a large
> >> undertaking and while I'm not opposed to it I don't know
> >> if there are enough people willing to invest a large amount
> >> of effort to make this happen.
> >>
> >> Harry
> >> =20
> >>>> The automagic 4:2:0 fallback I think is rather fundementally
> >>>> incompatible with fancy color management. How would we even
> >>>> know whether to use eg. BT.2020 vs. BT.709 matrix? In i915
> >>>> that stuff is just always BT.709 limited range, no questions
> >>>> asked.
> >>>>
> >>>> So I think if userspace wants real color management it's
> >>>> going to have to set up the whole pipeline. And for that
> >>>> we need at least one new property to control the RGB->YCbCr
> >>>> conversion (or to explicitly avoid it).
> >>>>
> >>>> And given that the proposed patch just swept all the
> >>>> non-BT.2020 issues under the rug makes me think no
> >>>> one has actually come up with any kind of consistent
> >>>> plan for anything else really.
> >>>> =20
> >>>>>
> >>>>> Userspace needs full control of framebuffer pixel formats,
> >>>>> as well as control over DEGAMMA, GAMMA, CTM color operations.
> >>>>> It also needs to be able to select whether to drive the panel
> >>>>> as sRGB or BT.2020/PQ but it doesn't make sense for it to
> >>>>> control the pixel encoding on the wire (RGB vs YCbCr).
> >>>>> =20
> >>>>>> I really don't want a repeat of the disaster of the
> >>>>>> 'Broadcast RGB' which has coupled together the infoframe
> >>>>>> and automagic conversion stuff. And I think this one would
> >>>>>> be about 100x worse given this property has something
> >>>>>> to do with actual colorspaces as well.
> >>>>>> =20
> >>>>>
> >>>>> I'm unaware of this disaster. Could you elaborate? =20
> >>>>
> >>>> The property now controls both the infoframe stuff (and
> >>>> whatever super vague stuff DP has for it in MSA) and
> >>>> full->limited range compression in the display pipeline.
> >>>> And as a result  there is no way to eg. allow already
> >>>> limited range input, which is what some people wanted.
> >>>>
> >>>> And naturally it's all made a lot more terrible by all
> >>>> the displays that fail to implement the spec correctly,
> >>>> but that's another topic.
> >>>>
> >>>> --
> >>>> Ville Syrj=C3=A4l=C3=A4
> >>>> Intel
> >>>> =20
> >>> =20
> >> =20
> >  =20


--Sig_/07vxxmy176geY0MRGiU3n3n
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmPsqHAACgkQI1/ltBGq
qqen4hAAs7IjrXIruF6q+/3j0dlma9jycPJBTjfbe8WIYnzmjfpvuzP0VjJSfIXn
NFfN9xVuK618Bd1W4tLcwY5Sab49phUcSvDRzcHk9yV6tqELMDnpLyVSNN5u8ZJM
y1oawcwhWEAkVVppMaWV0N9bJiZTfVXHQkb2kIWWhoF69isP8/sB6Hty+x25xHZa
R3ZK2HL0E/NoZcjQP/TJW+om4F9Zh3zFC8VWzUsbt+RejuNyhInXueq0RKfSYlAl
59muKIEBOUtxE9LsbV/lFwbDxcMkaOdy5GZifUNWWC50LDxM7/P7tS4a3QWCF3Ks
GoyZYpe0ZJMwRsvMLThGW1gxiYShFlpr44tqWhAO1GZ9O88S1ukAEGrNw/5k/Tfw
plYcppH0RSjZyKS2CHt0th8usd6+Z8xzG4N1ztN2jHPM+qH/wiHtrHLN01xHm3iM
EiVbvehhBUfkK15TG+cJ3ZSueT6FSQf0cD2zjwbuQ0TU5GvZK4RP28m11vKgOMC4
Ovy0LBWOjRG13Ch/E8OVSq9X9tIDoV0Wur6kcpAQiPuHTJ8T9n+gAETOa+KXEQus
yjSxhAEq2xeruwLsSHoN/eB6GTw9/0B2pxUfdNJqHZqjNlnRLMF+9SfnWr4xay1f
orpgPQCLFZDPWa/rNQxxafyO2yigeT9OSgN5yLR03a48iK6HFfc=
=aqK0
-----END PGP SIGNATURE-----

--Sig_/07vxxmy176geY0MRGiU3n3n--
