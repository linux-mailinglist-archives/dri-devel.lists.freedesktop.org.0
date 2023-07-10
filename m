Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A53074CFB4
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 10:17:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C898010E21D;
	Mon, 10 Jul 2023 08:17:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A02810E21D
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 08:17:29 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4fba1288bbdso5763334e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 01:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688977047; x=1691569047;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=2W6391FaazJohky88htwUa9E+eu+nKtNCql+EyNmOQA=;
 b=lG3UeXVioUGyQezvovtyCW6KO/kPaSeYh03FzZfALfY98pIfntZCuNpZyhGxfc48dd
 fmjybi25CwaJlqjI/g1s2Gryw8/2eufRwAwnrOSTd33XH5HT5Jzi1XHZAOHZMw/9ZEkX
 cEtkaRGWq3pWCANvdwoNndLTJKV+ta8LcWbCgpnyBw2HReRwiw+yGjh1Z76FpIHzy6RJ
 fGcSiUSW3vcWrqMzbD6vT4nn9v7ZOIESrEKUmRdIBReZCNNCadyWLym3yc7RlCbzRwPe
 /1vsyKV71K1oRmiQoNo/1KI0KNPrfebh5tpLqVBHeFMxkI61Pwl5E2j45Nd93xeFZZY2
 j6iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688977047; x=1691569047;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2W6391FaazJohky88htwUa9E+eu+nKtNCql+EyNmOQA=;
 b=c4whTYRbrB6nCYCMDgx24P7a44fhUSqbwtj0Zdy2fB7rAGFiUdB5Zm2Y4UKIC6RaJR
 ZgvSeRkiMY7gZHBsywgdw/eaHOn64m2WHT29gE/YAlReec+NUjiTcUg4/UTc5es/QYUZ
 qbtVH0+bLT87xyWwriUTfHkidwA4jP32h6UnCjdVYfs6TFSr98YM9ktO7+5y8gfZniao
 ts7MRPMqHFeQEy+TCGtlT4a8K5HVY44/ugaJutIq4H1TW2Nznr02hkooQCuNXL2toNNO
 s8UEnUon2mdu5nwmn0twhduabAz80icQElDbp0atezO1VSwEWiSC0wOTOkmqlcMArskI
 x5mw==
X-Gm-Message-State: ABy/qLYYRSjX1BVggVOUzU2mkRWfyfpe0avFqpQSe8zf/t2ayM62VkOK
 B444l3UZRcHcXIXjE7H0hf4=
X-Google-Smtp-Source: APBJJlGNZ812GKjap2M9WcCUSgpcEdHqohzAwYTSoF6DAieUCA65fULguLTeYjUuiyAeBkMPND0jjw==
X-Received: by 2002:a05:6512:1116:b0:4f8:74b5:b4ec with SMTP id
 l22-20020a056512111600b004f874b5b4ecmr12129724lfg.41.1688977046753; 
 Mon, 10 Jul 2023 01:17:26 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 y8-20020a197508000000b004f26d63f823sm1591060lfe.237.2023.07.10.01.17.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jul 2023 01:17:26 -0700 (PDT)
Date: Mon, 10 Jul 2023 11:17:06 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Michael Banack <banackm@vmware.com>
Subject: Re: [PATCH v4 2/8] drm/atomic: Add support for mouse hotspots
Message-ID: <20230710111706.209cfd55@eldfell>
In-Reply-To: <6be74496-f14e-302c-329e-d865f5ee3c36@vmware.com>
References: <20230628052133.553154-1-zack@kde.org>
 <20230628052133.553154-3-zack@kde.org>
 <20230628104106.30360b55@eldfell> <20230628105424.11eb45ec@eldfell>
 <2fb2f3985df4d6710e5ad33f6e618a52004714df.camel@vmware.com>
 <20230629110348.3530f427@eldfell>
 <6c5449cf-b7a6-1125-9493-0fe968166915@vmware.com>
 <20230704110845.490344f5@eldfell>
 <ce7754be-8085-ffd1-93f3-a774f7fcdb87@vmware.com>
 <20230706110146.0abeda0a@eldfell>
 <247b630c-8b16-7c33-987e-8b3451be3c70@vmware.com>
 <20230707113837.1a9d31e9@eldfell>
 <6be74496-f14e-302c-329e-d865f5ee3c36@vmware.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ZXeb/YcS=N+XhCQOS4OGrqY";
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
Cc: "mripard@kernel.org" <mripard@kernel.org>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "javierm@redhat.com" <javierm@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Martin Krastev <krastevm@vmware.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, Ian Forbes <iforbes@vmware.com>,
 Maaz Mombasawala <mombasawalam@vmware.com>, "zack@kde.org" <zack@kde.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/ZXeb/YcS=N+XhCQOS4OGrqY
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 7 Jul 2023 13:54:21 -0700
Michael Banack <banackm@vmware.com> wrote:

> On 7/7/23 01:38, Pekka Paalanen wrote:

...

> >>>>>>> The question of which input device corresponds to which cursor pl=
ane
> >>>>>>> might be good to answer too. I presume the VM runner is configure=
d to
> >>>>>>> expose exactly one of each, so there can be only one association?=
 =20
> >>>>>> As far as I know, all of the VM consoles are written as though they
> >>>>>> taking the place of what would the the physical monitors and input
> >>>>>> devices on a native machine.=C2=A0 So they assume that there is on=
e user,
> >>>>>> sitting in front of one console, and all monitors/input devices are
> >>>>>> being used by that user. =20
> >>>>> Ok, but having a single user does not mean that there cannot be
> >>>>> multiple independent pointers, especially on Wayland. The same with
> >>>>> keyboards. =20
> >>>> True, and if the userspace is doing anything complicated here, the
> >>>> hypervisor has to be responsible for ensuring that whatever it's doi=
ng
> >>>> works with that, or else this system won't work.=C2=A0 I don't know =
that the
> >>>> kernel is in a good position to police that. =20
> >>> What do you mean by policing here?
> >>>
> >>> Isn't it the hypervisor that determines what virtual input devices wi=
ll
> >>> be available to the guest OS? Therefore, the hypervisor is in a
> >>> position to expose exactly one pointer device and exactly one
> >>> cursor plane to guest OS which means the guest OS cannot get the
> >>> association wrong. If that's the general and expected hypervisor
> >>> policy, then there is no need to design explicit device association in
> >>> the guest kernel UAPI. If so, I'd like it to be mentioned in the kern=
el
> >>> docs, too. =20
> >> I'm not entirely sure how to fit what you're calling a "pointer" into =
my
> >> mental model of what the hypervisor is doing... =20
> > My definition: A pointer is a pointing input device that requires a
> > cursor image to be drawn at the right location for it to be usable. =20
> Right, but normal desktops (and our consoles) expect multiple input=20
> devices to feed into a single cursor.=C2=A0 So the connection between the=
=20
> on-screen cursor and the corresponding input-devices is not clear to me=20
> when you start talking about multiple pointers, even without any=20
> hypervisors in the picture.

The connection is simple: there is an independent on-screen cursor for
each logical pointer. How that cursor is drawn is irrelevant to the end
user, and Wayland compositors (a type of a display server) will use any
means necessary to draw it.

Each logical pointer has one cursor that is independent from all other
logical pointers. Each logical pointer can have any number of input
devices controlling it. The assignments are decided by the userspace
and implemented in a display (window system) server.

This has been ingrained into the fundamental design of Wayland, even if
the feature is rarely used in practise. The window system may expose
multiple independent pointers to applications, and each pointer may also
interact with the same window simultaneously. This naturally leads to
the question "which cursor goes with which input device?", and the
kernel, or anything below it, does not know that if there are multiple
possibilities.


> >> So I guess I'm not clear on what kind of usermode<=3D>kernel contract =
you
> >> want here if the kernel isn't what's owning the translation between the
> >> mouse input and the cursor position.=C2=A0 The hypervisor awkwardly ha=
s to
> >> straddle both the input/graphics domain, and we do so by making
> >> assumptions about how the user desktop is going to behave. =20
> > Correct. In order to reduce that awkwardness, I encourage you to write
> > down the expectations and requirements in this new Linux UAPI (the KMS
> > cursor place hotspot property). Then you can be much more confident on
> > how a random Linux desktop will behave.
> >
> > It will also help the reviewers here to understand what the new UAPI is
> > and how it is supposed to work. =20
>=20
> The cursor hotspot is I think fairly straightforward, as far as what=20
> that means for how hypervisor clients are expected to draw the mouse,=20
> and Zack's working on that part.
>=20
> My point was that how the hypervisor then sends input is sort of outside=
=20
> the scope of the graphics portion here, and I think probably outside the=
=20
> current Linux UAPI entirely (unless there's some other input/topology=20
> system somewhere else I'm not familiar with).

I would not say that the hotspot property is in any way obvious. I've
spent my whole Wayland and compositor developer career of over 10 years
never seeing the need of the kernel knowing the hotspot myself, because
I never use VMWare like tools.

You cannot describe why hotspot property is needed or how it works
without explaining the input side. The hotspot property is actually
really weird, because its existence requires combining the input system
with the graphics system for it to make sense. The input system used to
be out of scope indeed, but this addition forces it in scope. This is
the first time that I know of when the kernel or components below the
kernel needs to know, hence there is no existing infrastructure in
Linux to record that topology or anything.

(Sidetrack: for ultra-fast displays, say 1000 Hz refresh for seamless
hand-eye coordination, it could make very much sense for userspace to
off-load arbitrary KMS plane positioning through the kernel into
hardware in general, tying the plane position to some input device
position temporarily. It might make some sense even with today's
consumer hardware. So I don't think the concept is fundamentally
limited to paravirtualized environments. But going there would need a
lot more work than I am willing to suggest to VMWare to tackle to just
make their own products better.)

> > However, in your case, the userspace (Wayland or X11 display server) is
> > not free to choose any arbitrary input-cursor association they might
> > want. You have a specific expectation that all pointing devices control
> > the same pointer. Since the hotspot property is exclusive to your use
> > case, I think it make sense to write down the expectations with the
> > hotspot property. Guest userspace has to explicitly program for the
> > hotspot property anyway, so it can also take care of your requirements.=
 =20
> I see your point, and I can see the value in documenting something to=20
> that effect, if only because it's /useful/ for userspaces trying to work=
=20
> with this.=C2=A0 (And the only way anyone is using this today.)
>=20
> But I'm still a little fuzzy on what portion of that is within the Linux=
=20
> UAPI scope for the hotspot...
>=20
> It seems like it might be more useful to restrict the scope of the Linux=
=20
> UAPI contract for how the hotspot property works to just how userspace=20
> can expect the hypervisors to display it on screen, and not try to tie=20
> in any expectations for how mouse input is going to work.
>=20
> Like, VMware is using virtual mouse devices here, but another hypervisor=
=20
> might have no kernel mouse device and instead inject input entirely=20
> through a userspace daemon?=C2=A0 So even trying to express the input par=
t of=20
> the contract in terms of kernel input devices I'm not sure makes sense.
>=20
> I guess my fear is that I don't want to lock this down in a way that=20
> excludes some well-meaning hypervisor that implements the graphics part=20
> correctly but does something just weird enough on the input side to not=20
> be considered compliant.
>=20
> So I guess I would vote for trying to include something to that effect=20
> as context or explanation, but not try to strictly define how that works?

Yes, exactly.


Thanks,
pq

--Sig_/ZXeb/YcS=N+XhCQOS4OGrqY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmSrvoIACgkQI1/ltBGq
qqd4AQ/+JEjltiVPYNu7dxLrOnCdD2/ykCQX5zxStT7f36KJPOyDREZuC81ZLubW
j6UmKe0550dwQPDgZ2NmQM6JcJhZ0pCWaxHm0xVPn6wxBb/KqTRG3Auh3Tkbl508
5sKjjRluzN6hvWA7xhJfBwuUDbwp08ABv5Da3hflsOVjRRnAFzpoFZuqDXB8/NAr
it/CImPoyBG/htBlovId7h2nQcu/qa2njWtHrgL3RlbqAkPAX4jC92fbVd9Aj3Sm
DXlnjuOyuEeSe9/v0rfQDBZ1nouA5We0MBYJENR7HZzWwzqZEnKUMaP3V80L2lqz
BmGzf/u3WBURk+YcG12IrkwPO2C+nEjQE/YNrO1KINylMStSAEPh++pY3qtmfsiM
nbvp/0qpVl6x6sXb740Y6xfrd3UW/kYHGWBpFRXp1xp/yTyLaZyjq4XMmAFXopil
n7mj7VYyF09iAyypKYt/wOW81rThkzBsKe/hgauFpn9/2mdrRhtCn4DAFNyw2MqP
cs93W/V04A79O49zh8iPbBVwhfXUOZggM1CXKfUqbo1C7/SpKWWV/sC56fvVLncH
EWN9fndUV3NBA++l3SB6mpfv9NRpidxn/sXk90hZZI1IKkZubE0ZFBHwEBXedtul
BrnH4eVD1OIPw/sdtvRtZ1Cva0e7xczjBQaSicOf/TAaV4X399w=
=T3Gw
-----END PGP SIGNATURE-----

--Sig_/ZXeb/YcS=N+XhCQOS4OGrqY--
