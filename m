Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E532746B8C
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 10:08:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 124FA10E02E;
	Tue,  4 Jul 2023 08:08:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E226410E02E
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jul 2023 08:08:51 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2b6f52e1c5cso5642401fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jul 2023 01:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688458128; x=1691050128;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=leNmqkm222H/I9PHEpbUEDioh26L1s4f9bEMnidA20g=;
 b=NoBPutS6qfi1WUrHPhnornVfDzgMjhucllkSk5DHEAZVk5NEUYgVqQlunjGTKDenZM
 aM2P3grmjRw8PN5nD7Vtf7MEzSn/VxE3NwIFvDgqUCdzrQ1r44YUp+hcaL9DQZvQNeRS
 K5JKmEbuAUBoeu5OXMOY9uLYzzItlqr15smUFtO107MOoKD5t2AGvcy3ojOYOPEM2orM
 fV1Vx3+IeY6JYssbevt72pPOE6KPcFMj34gOF+wOPhc2V8th7FlrYyR6AZ4GHN8xQSlw
 Asnwyy+y7FQ7HPqxaaZVca6V0TG8G9gm48le9Dw5mvImslxyxVaUOdmGGnTdzTVcfoMc
 iP4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688458128; x=1691050128;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=leNmqkm222H/I9PHEpbUEDioh26L1s4f9bEMnidA20g=;
 b=lQpweZmjNcswM8KKr8LFqQnZ6vf8dK7zkj0aPobghVbS+IfhMVxntKrJxs9CyqM0wm
 wKY1nhxDi8nPnABzQRmVCF4xYFk0lp8K0MPf4jX0I0UHHKJO3ZKO/n8lmGuhlisJcC2J
 MaGisyLFSzb0AKinQwbOeVykjSBiLnPrxf4Ip3Z0laa1NxKmx4qc7zDgX6SoqV3yosHv
 0IS4Ltgoykpm3j4zjfEYOf7jeTU4k6vB1EwOeqLBQoAllAcRaabwg8NY1Ah0ZsXw8wuY
 2D+jkNVxq4sJ0cSCK72c5RqeRYvBFV11bMCjzI14A8GegaEddQr1jPTnc6lhopdWu47D
 dd9Q==
X-Gm-Message-State: ABy/qLZI2oAEKj61uLqpfLKw6HcoC2ATtYy7S0b8RWNH9ev5DR9IGOI5
 LuQsHdhT4ouff9e/PjSJF/k=
X-Google-Smtp-Source: APBJJlG9qtzOksTbW1UkNNjBotepJiyArjZDIcZioPa1F7DSk3AiU+jE5gMbxgG14+WJZpmuyjo8Sw==
X-Received: by 2002:a2e:800b:0:b0:2b6:9ed0:46f4 with SMTP id
 j11-20020a2e800b000000b002b69ed046f4mr8914185ljg.23.1688458127944; 
 Tue, 04 Jul 2023 01:08:47 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 d4-20020a2e96c4000000b002b6bccf2845sm3752234ljj.59.2023.07.04.01.08.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jul 2023 01:08:47 -0700 (PDT)
Date: Tue, 4 Jul 2023 11:08:45 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Michael Banack <banackm@vmware.com>
Subject: Re: [PATCH v4 2/8] drm/atomic: Add support for mouse hotspots
Message-ID: <20230704110845.490344f5@eldfell>
In-Reply-To: <6c5449cf-b7a6-1125-9493-0fe968166915@vmware.com>
References: <20230628052133.553154-1-zack@kde.org>
 <20230628052133.553154-3-zack@kde.org>
 <20230628104106.30360b55@eldfell> <20230628105424.11eb45ec@eldfell>
 <2fb2f3985df4d6710e5ad33f6e618a52004714df.camel@vmware.com>
 <20230629110348.3530f427@eldfell>
 <6c5449cf-b7a6-1125-9493-0fe968166915@vmware.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gZUZCPYEuZ5Sv9355xOgOku";
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

--Sig_/gZUZCPYEuZ5Sv9355xOgOku
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 3 Jul 2023 14:06:56 -0700
Michael Banack <banackm@vmware.com> wrote:

> Hi, I can speak to the virtual mouse/console half of this from the=20
> VMware-side.
>=20
> I believe Zack's preparing a new set of comments here that can speak to=20
> most of your concerns, but I'll answer some of the other questions direct=
ly.
>=20
> On 6/29/23 01:03, Pekka Paalanen wrote:
> >
> > Is it really required that the hotspot coordinates fall inside the
> > cursor plane? Will the atomic commit be rejected otherwise? =20
> Most console systems require the hotspot to get within the cursor image,=
=20
> but in theory it's semantically meaningful to have it extend outside the=
=20
> image.
>=20
> VMware's clients in particular will clamp the hotspot to the dimension=20
> of the cursor image if we receive one that's out of bounds.
>=20
> So I would assume the right thing to do here would be to allow it and=20
> let the clients figure out how to best handle it.

Hi,

if it is normal that clients clamp the hotspot to inside the cursor
image, then I would come to the opposite conclusion: KMS UAPI needs to
require the hotspot to be within the cursor image. Otherwise the
results would be unpredictable, if clients still continue to clamp it
anyway. I would assume that clients in use today are not prepared to
handle hotspot outside the cursor image.

It is also not a big deal to require that. I think it would be very rare
to not have hotspot inside the cursor image, and even if it happened,
the only consequence would be that the guest display server falls back
to rendered cursor instead of a cursor plane. That may happen any time
anyway, if an application sets e.g. a huge cursor that exceeds cursor
plane size limits.

What I'm after with the question is that the requirement must be spelled
out clearly if it is there, or not even hinted at if it's not there.

> > =20
> >>   *
> >>   * This information is only relevant for drivers working on top
> >>   * of para-virtualized hardware. The reason for that is that
> >>   * the hotspot is fairly encapsulated in the system but imagine having
> >>   * multiple windows with virtual machines running on servers
> >>   * across the globe, as you move the mouse across the screen
> >>   * and the cursor moves over those multiple windows you wouldn't
> >>   * want to be sending those mouse events to those machines, so virtual
> >>   * machine monitors implement an optimization where unless the mouse
> >>   * is locked to the VM window (e.g. via a click) instead of propagati=
ng
> >>   * those mouse events to those VM's they change the image of the nati=
ve
> >>   * cursor to what's inside the mouse cursor plane and do not interact
> >>   * with the VM window until mouse is clicked in it. =20
> > Surely the mouse events are sent to those machines across the globe
> > regardless?
> >
> > The point I believe you want to make is that in addition that, a
> > virtual machine viewer application independently moves the cursor image
> > on the viewer window to avoid the roundtrip latency across the globe
> > between mouse movement and cursor movement.
> >
> > Why is the locking you mention relevant? Wouldn't you do this
> > optimization always if there is any cursor plane image set?
> >
> > Or if you literally do mean that no input is sent to the VM at all
> > until the pointer is locked to that window, then why bother using the
> > guest cursor image without locking?
> >
> > I suppose different viewers could do different things, so maybe it's
> > not necessary to go into those details. Just the idea of the viewer
> > independently moving the cursor image to reduce hand-eye latency is
> > important, right? =20
>=20
> Yeah, the discussions of "locking" here are more implementation details=20
> of how VMware's console works, and while=C2=A0 there are other consoles t=
hat=20
> work this way, many of them don't.
>=20
> So it's probably more confusing than helpful without some more=20
> background that the other layers here don't need to worry about.

Cool.

> The main idea is that the client needs to know where the VM thinks the=20
> mouse is to determine whether it /can/ safely accelerate it all the way=20
> through to the client's cursor stack.=C2=A0 If something else in the VM i=
s=20
> moving the mouse around, like an additional remote connection, then the=20
> client needs to fallback to an emulated cursor on the client side for a=20
> while.

Good point.

> > The question of which input device corresponds to which cursor plane
> > might be good to answer too. I presume the VM runner is configured to
> > expose exactly one of each, so there can be only one association? =20
> As far as I know, all of the VM consoles are written as though they=20
> taking the place of what would the the physical monitors and input=20
> devices on a native machine.=C2=A0 So they assume that there is one user,=
=20
> sitting in front of one console, and all monitors/input devices are=20
> being used by that user.

Ok, but having a single user does not mean that there cannot be
multiple independent pointers, especially on Wayland. The same with
keyboards.

> Any more complicated multi-user/multi-cursor setup would have to be=20
> coordinated through a lot of layers (ie from the VM's userspace/kernel=20
> and then through hypervisor/client-consoles), and as far as I know=20
> nobody has tried to plumb that all the way through.=C2=A0 Even physical=20
> multi-user/multi-console configurations like that are rare.

Right.

So if there a VM viewer client running on a Wayland system, that viewer
client may be presented with an arbitrary number of independent
pointer/keyboard/touchscreen input devices. Then it is up to the client
to pick one at a time to pass through to the VM.

That's fine.

I just think it would be good to document, that VM/viewer systems
expect to expose just a single pointer to the guest, hence it is
obvious which input device in the guest is associated with all the
cursor planes in the guest.

Btw. what do you do if a guest display server simultaneously uses
multiple cursor planes, assuming there are multiple outputs each with a
cursor plane? Or does the VM/viewer system limit the number of outputs
to one for the guest?

> >
> > Btw. for my own curiosity, what happens if there are two simultaneous
> > viewer instances open to the same VM/guest instance? Will they fight
> > over controlling the same pointer? =20
>=20
> I can't speak for all consoles, but VMware at least uses a bunch of=20
> heuristics that typically boil down to which mouse input source has been=
=20
> moving the cursor most recently.


Thanks,
pq

--Sig_/gZUZCPYEuZ5Sv9355xOgOku
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmSj040ACgkQI1/ltBGq
qqfPrQ//VLOdqOKS0e9mLHMOUMnkCv3slpSdNYvwM44hAzMW1KSdYzlcVEjmmxh7
TWId8CkcpjK2fEhEvPyF0HWtSdKH+sAUw571C8+FAF+ndP1FrMRpIx++W1ecoilm
vYtbMoLxezaN+0hC/XOwLtDv8LH0014F2x30U71kTO8pyg8cKqKOdeNt86MbjdJp
5f5OK3vatjleDp/xJuqYLv+nh77gQiggmmLlzi025rOSs1SjewcsN6cJP2K2Gpf7
/Wu8K/oCqkQSqBFrmgajP71YeOVhDXO23gT1yAajIM0DHyHEejd8r1arV2xIlXAT
6ozefYdVKqPsd9jlH+m3Eg1mQUmsTkW8bUPsdmN7bcIBkE+LwrPIjHU+Wi6aIdWY
bH5bccet1MagrWe13SB7/60DGv1BWXxDabYxtNLCo8xGlo2p2JPFwirspMD19tEq
ca67EoF5kwqCtWXbvpYYVGP3gj3px8eWJejcB7hCO3UwUt0ks1SRWKXm3iMibm0A
sEsb99oT13oEVkxGjgzJonEvCCT4JSFDzqLeSLLiDlBpgaXyVL8weAPPGz2yc6dF
VV/lzamqdMBQ8fb1ZGEMXXPgA4T6QDSEMjDo2HXyU2J8KKY9N4/SnKmxB7AQOatb
2G74u/cr2g4b/2DZSpFL1An163Ypf/yQnE0TedRgNLJhOqCIdFg=
=cEyI
-----END PGP SIGNATURE-----

--Sig_/gZUZCPYEuZ5Sv9355xOgOku--
