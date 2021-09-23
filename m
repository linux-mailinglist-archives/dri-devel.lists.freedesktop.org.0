Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B21844159FB
	for <lists+dri-devel@lfdr.de>; Thu, 23 Sep 2021 10:23:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AA936E0DB;
	Thu, 23 Sep 2021 08:23:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FA3E6E0DB
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Sep 2021 08:23:05 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id p29so23066102lfa.11
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Sep 2021 01:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=zI6+r22N8vd1pgBFB9DVII9yW5WdFOIiCGDV+nckIwQ=;
 b=H/Cu/+0r+22Ce4iLoAZgN8VhQGWCIxCACych2SM2mjtpGT9dzqglBIPvScUnJ7PiFG
 emnYB8/lyBxjF+wMH6VmI5KH7FBY9KBbJu7qY2fGdVuYEqTwJmdfN3mnVKKHO3J1kZKk
 m92aIyeMVCBMCx7hoXwMg7TnY+gElIgDJ3DE1stWWSbRegX4uJoT/7KEiWaUofpvKwNS
 Qv5RTEFFa17G4+1L9T5zonj623FywbMq4J2/6Vtjvk7ce1h4jJQv4Ib/5K+uQcH2CaOJ
 pCJaK3udL+1UtASodA8PMXJ70W1bhSsMACsk3w/JkmAqC89FWHg1Xuf3Y2gPNULBVoSh
 B8UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=zI6+r22N8vd1pgBFB9DVII9yW5WdFOIiCGDV+nckIwQ=;
 b=zmBPAl46BqyvSLHcCU4hFcW5i/nioquBJJp7GAbsTf+Sgb0UKhO1fHzTKcvchMe7cq
 bLoGUNVRYagswEUrEpEAI0jCG4Mi6x+CwzECiXeFXGwb2uNh165Fz95+SunMdnyEIInb
 Q68gqVk14yr7B40xGn7hL3/NUrxXPHQn4puBb9UTyGxdPcD/UDoaFJkO13jL+gmAVXq+
 FVK1O+PtPsjIva3NIIi3pCC82Wky5X51QaaDqVWkeoiIQdZ5n2GuogduzGyzAi0rAiuB
 awerj+zvyLfBX+J0fshdiwRLAuzhiw8LDaoaIOLu43AGCpQfohRWT4QkdjPop2RNWlA5
 nPYQ==
X-Gm-Message-State: AOAM5339YmpowmwFvyNCbD1GQa/SPSR8IDMAEwxkFzRRvLEWG05fD5mt
 GVAqddqRKxK7HEv76gEduhw=
X-Google-Smtp-Source: ABdhPJxCCjouwN22Bri0G9yXSf+qXYMFEAl0UvmRGiV6lou7qCR8labXaCN4WEvQ++MnqSfez60DUQ==
X-Received: by 2002:a2e:a782:: with SMTP id c2mr3881850ljf.388.1632385383590; 
 Thu, 23 Sep 2021 01:23:03 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id o4sm393605lfi.16.2021.09.23.01.23.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Sep 2021 01:23:03 -0700 (PDT)
Date: Thu, 23 Sep 2021 11:23:00 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, Dennis Filder <d.filder@web.de>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: Handling DRM master transitions cooperatively
Message-ID: <20210923112300.0a40480d@eldfell>
In-Reply-To: <3195aecb-833f-9f8f-efad-51d80da6f4dc@redhat.com>
References: <YTJypepF1Hpc2YYT@reader> <20210907130746.7b667dac@eldfell>
 <ccdba09b-011d-093e-17d0-578ca8a3ec44@redhat.com>
 <20210908103603.44a533bb@eldfell>
 <CAKMK7uGeuaZDYkr=mFiA4Okhod6KqKRnv_RfF-NJG=2KzG-=WQ@mail.gmail.com>
 <20210909103703.09a573e4@eldfell>
 <YUCncex3woPlAhI6@phenom.ffwll.local>
 <20210922115657.17006ed1@eldfell>
 <3195aecb-833f-9f8f-efad-51d80da6f4dc@redhat.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/OqYFlt1VWZ7a7o17_z=0afT";
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/OqYFlt1VWZ7a7o17_z=0afT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 22 Sep 2021 11:21:16 +0200
Hans de Goede <hdegoede@redhat.com> wrote:

> Hi,
>=20
> On 9/22/21 10:56 AM, Pekka Paalanen wrote:
> > On Tue, 14 Sep 2021 15:45:21 +0200
> > Daniel Vetter <daniel@ffwll.ch> wrote:
> >  =20
> >> On Thu, Sep 09, 2021 at 10:37:03AM +0300, Pekka Paalanen wrote: =20
> >>> On Wed, 8 Sep 2021 18:27:09 +0200
> >>> Daniel Vetter <daniel@ffwll.ch> wrote:
> >>>    =20
> >>>> On Wed, Sep 8, 2021 at 9:36 AM Pekka Paalanen <ppaalanen@gmail.com> =
wrote:   =20
> >>>>>
> >>>>> On Tue, 7 Sep 2021 14:42:56 +0200
> >>>>> Hans de Goede <hdegoede@redhat.com> wrote:
> >>>>>     =20
> >>>>>> Hi,
> >>>>>>
> >>>>>> On 9/7/21 12:07 PM, Pekka Paalanen wrote:     =20
> >>>>>>> On Fri, 3 Sep 2021 21:08:21 +0200
> >>>>>>> Dennis Filder <d.filder@web.de> wrote:
> >>>>>>>     =20
> >>>>>>>> Hans de Goede asked me to take a topic from a private discussion=
 here.
> >>>>>>>> I must also preface that I'm not a graphics person and my knowle=
dge of
> >>>>>>>> DRI/DRM is cursory at best.
> >>>>>>>>
> >>>>>>>> I initiated the conversation with de Goede after learning that t=
he X
> >>>>>>>> server now supports being started with an open DRM file descript=
or
> >>>>>>>> (this was added for Keith Packard's xlease project).  I wondered=
 if
> >>>>>>>> that could be used to smoothen the Plymouth->X transition someho=
w and
> >>>>>>>> asked de Goede if there were any such plans.  He denied, but men=
tioned
> >>>>>>>> that a new ioctl is in the works to prevent the kernel from wipi=
ng the
> >>>>>>>> contents of a frame buffer after a device is closed, and that th=
is
> >>>>>>>> would help to keep transitions smooth.     =20
> >>>>>>>
> >>>>>>> Hi,
> >>>>>>>
> >>>>>>> I believe the kernel is not wiping anything on device close. If
> >>>>>>> something in the KMS state is wiped, it originates in userspace:
> >>>>>>>
> >>>>>>> - Plymouth doing something (e.g. RmFB on an in-use FB will turn t=
he
> >>>>>>>   output off, you need to be careful to "leak" your FB if you wan=
t a
> >>>>>>>   smooth hand-over)     =20
> >>>>>>
> >>>>>> The "kernel is not wiping anything on device close" is not true,
> >>>>>> when closing /dev/dri/card# any remaining FBs from the app closing
> >>>>>> it will be dealt with as if they were RmFB-ed, causing the screen
> >>>>>> to show what I call "the fallback fb", at least with the i915 driv=
er.     =20
> >>>>>
> >>>>> No, that's not what should happen AFAIK.
> >>>>>
> >>>>> True, all FBs that are not referenced by active CRTCs or planes will
> >>>>> get freed, since their refcount drops to zero, but those CRTCs and
> >>>>> planes that are active will remain active and therefore keep their
> >>>>> reference to the respective FBs and so the FBs remain until replace=
d or
> >>>>> turned off explicitly (by e.g. fbcon if you switch to that rather t=
han
> >>>>> another userspace KMS client). I believe that is the whole reason w=
hy
> >>>>> e.g. DRM_IOCTL_MODE_GETFB2 can be useful, otherwise the next KMS cl=
ient
> >>>>> would not have anything to scrape.
> >>>>>
> >>>>> danvet, what is the DRM core intention?     =20
> >>>>
> >>>> Historical accidents mostly. There's two things that foil easy
> >>>> handover to the next compositor:
> >>>> - RMFB instead of CLOSEFB semantics, especially when closing the
> >>>> drmfd. This is uapi, so anything we change needs to be opt-in   =20
> >>>
> >>> What does this mean and refer to?
> >>>
> >>> Are you trying to say, that closing the DRM device fd (freeing the fi=
le
> >>> description) causes an implicit RmFB on all the FBs tied to that DRM
> >>> device file description?
> >>>
> >>> I never realised that before.   =20
> >>
> >> Yes, final close does iterate over fb and do an RMFB. Which is why we'=
ve
> >> had this discussion whether closefb semantics should be an ADDFB2 flag=
 at
> >> creation time instead. =20
> >=20
> > Hi Daniel,
> >=20
> > such flag would make sense to me. =20
>=20
> Hmm, I was thinking having a separate call to mark a FB to switch to
> closefb semantics. But both plymouth (because of end of animation)
> and GNOME (because a mostly empty gnome-shell needs to be rendered
> to avoid leaking privacy sensitive info) will need to prepare a
> special FB on exit anyways, so then an ADDFB2 flag would work fine.
>=20
> I would be happy to work on the plymouth side of this, so that we
> have at least one consumer of such a flag lined up for merging.

Right, but I'm thinking this from the other side: why would anyone
deliberately *want* RmFB semantics on device close?

I can't think of any, and hence I would be inclined to assume that
userspace would just switch to using closefb semantics for everything
all the time.

Legacy userspace is one thing, but userspace that is updated to set
closefb semantics will also be aware of what closefb means: it leaves
the FBs up and CRTCs and planes enabled, if you leave them like that.
So if they don't want that, they know they should not do that.

Asking in another way: why would the same program sometimes use RmFB
semantics and sometimes closefb semantics? Even more so, why would one
switch an FB from one to the other?

Hmm... to prevent leaking sensitive FBs on crash, perhaps? But you can
do that decision at AddFB2 time, right? Maybe not, as you can't really
force EGL to allocate a new buffer at will. Oh, but when EGL gives me a
buffer that I know is safe to leave up, I also know that it is not up
on any KMS plane (no front buffer rendering), so I can just RmFB and
AddFB2 again. That's a bit of a detour though.

At least a separate ioctl on an FB would be more flexible than a flag
at AddFB2.

Btw. what happens if I try to AddFB2 the same buffer twice?


Thanks,
pq

--Sig_/OqYFlt1VWZ7a7o17_z=0afT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmFMOWQACgkQI1/ltBGq
qqeRLxAAiDb0Owmkwx8X5bOCiKh8VSS0nrbMea/YhkUDmG3R3tbJGh7qPAkY+GoI
+dxdEdD8a9PNRk5Wv7TJnKuFP/Y7QjMX9AwCh7eHVjxeLA/gsZWwY3i5Qu2L0TNV
y22MyXBkaZmEtDZwD92eEcv1XsXvTHtVTyzGgMey2ngmTwvNvll3KZL/371FlZyP
x7rPLDo4BumEj+X8afb2ajrL2euOr46gLk1FVrRkMLkAOvL/tahGKTym5tblAsp5
DdsICr2LlzHXBEpPydt79Nbqhy/f+ViIWuNdesxc2YCNGGwn27eDhpcO7noIFrIh
gyYdwWz2kM3uzOvm94mH1TTY+NqUcI6zYLq6Nbrr0d7icqUAbnNDMG2KfzqIBwNf
JCmaSIa8XYhYvOAhya90DHnEFFxaRFt2Xm9pZ9iDb/EtLjc4VWhIlPwnvwtogrhB
C76+7nyXGRKnrCNRt4KiELUbSUL/9yUMaR3pXsdB6bWasjDvUpD6Ar2OAgSUyA6B
ruSIkXoEBfPOXSbFh+fIom3ubgPW6gB4QdAj4zivghqRGzQBJbjSavlstSAMJL1c
2g8fg4dmOsJv1lJYGv98jCEw+iZf9OdJOPRxFZaAGs/qnsv3Yl72Szms9Ayax2Dl
2DOIs97ICjDdipPf93CUshsSv/rea5nntRE7jT9paA2c03k3Gz0=
=3oV3
-----END PGP SIGNATURE-----

--Sig_/OqYFlt1VWZ7a7o17_z=0afT--
