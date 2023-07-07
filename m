Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFCB74AD39
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 10:38:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96FFE10E532;
	Fri,  7 Jul 2023 08:38:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE7F310E532
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 08:38:50 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2b6afc1ceffso25311521fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jul 2023 01:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688719128; x=1691311128;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=jdz4yUav0CoUeV1ITbQePIKFJzZnLPaPSWn598w7G1Q=;
 b=kPifuksebSibDAbVF0YuIPbw109saEeOl0/7vG40N27FE+Iiz1gy873nrV92oe8A+z
 jInci0YXtc/yKpaHsGxIPmywPaTTjDQO9bimD2CL6Okd9ImgGCq/VCKFYKkAuHegY6oL
 h1awvRjL7EfGqgNQROulJjrsTFCIxoxZLA/T1EW6ZQClFDq8EE9H6P1m6r8mfNymOFfJ
 Vf08vle+46FTOA2YrfQbEk4TdERTcsIFFfcNgE9BAbNvpKqsW0Iso45YmGP6gJsQ2kGi
 NGtYWeMK1aWZeTarcQVo0wwrXDTotOIJT6vzlbdgIUHAErNcbQkPksEY+wkYMN6i+Yfh
 mQGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688719128; x=1691311128;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jdz4yUav0CoUeV1ITbQePIKFJzZnLPaPSWn598w7G1Q=;
 b=PCcZumfJPHLr0WaUK0LZ5GjcEpbyhGDSDDdiu0LU4ppZ7yNL3n7rgmkdR+odex/foX
 BkRGkk27N1TWeqfvu3Mx+BM+JI58Cai35v02GhqhcpXBMaGl+jqaYHtWwZTSiKpayQVM
 EAAhrZQuyJo306lWYEBr2H6nLsNny9dC1Ou5VDE3D+XdSgZ2q4rmbJNj1+XJdx8b4kT7
 91VpBGt0xqvJXHkWR/SJ1ZA4iDEp5iBAt4s/6J+5Wd8/aCJrI//KUtYUoDeiwbXmBKD2
 GWNvhKo+gmH2rTqqatM/NoYohJMkhBVAraNtaerFG5yrIg6Pheh8l5OUnfrBc4Js9y8F
 H1KQ==
X-Gm-Message-State: ABy/qLaz5Zm0E/JenoHC3Avt86mjhdJl65terC+cUqsl6nQeXkjUUn/0
 1IM4uXXAs1gE8GJQrKZSD+w=
X-Google-Smtp-Source: APBJJlENeOle1ddPkwkBTBO+eKJkyyAM0xYWLVNCAYa4yI3+SU5L5xvpUKKDRWhcq530AurVkXlR3Q==
X-Received: by 2002:a2e:97c7:0:b0:2b7:a64:6c3e with SMTP id
 m7-20020a2e97c7000000b002b70a646c3emr1884036ljj.26.1688719127903; 
 Fri, 07 Jul 2023 01:38:47 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 w4-20020a2e9bc4000000b002b475f087desm669499ljj.56.2023.07.07.01.38.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 01:38:47 -0700 (PDT)
Date: Fri, 7 Jul 2023 11:38:37 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Michael Banack <banackm@vmware.com>
Subject: Re: [PATCH v4 2/8] drm/atomic: Add support for mouse hotspots
Message-ID: <20230707113837.1a9d31e9@eldfell>
In-Reply-To: <247b630c-8b16-7c33-987e-8b3451be3c70@vmware.com>
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
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/NnvDNeiYE+ncE3bwpcafEh2";
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

--Sig_/NnvDNeiYE+ncE3bwpcafEh2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 6 Jul 2023 09:23:46 -0700
Michael Banack <banackm@vmware.com> wrote:

> On 7/6/23 01:01, Pekka Paalanen wrote:
> > On Wed, 5 Jul 2023 09:08:07 -0700
> > Michael Banack <banackm@vmware.com> wrote:
> > =20
> >> On 7/4/23 01:08, Pekka Paalanen wrote: =20
> >>> On Mon, 3 Jul 2023 14:06:56 -0700
> >>> Michael Banack <banackm@vmware.com> wrote:
> >>>    =20
> >>>> Hi, I can speak to the virtual mouse/console half of this from the
> >>>> VMware-side.
> >>>>
> >>>> I believe Zack's preparing a new set of comments here that can speak=
 to
> >>>> most of your concerns, but I'll answer some of the other questions d=
irectly.
> >>>>
> >>>> On 6/29/23 01:03, Pekka Paalanen wrote: =20
> >>>>> Is it really required that the hotspot coordinates fall inside the
> >>>>> cursor plane? Will the atomic commit be rejected otherwise? =20
> >>>> Most console systems require the hotspot to get within the cursor im=
age,
> >>>> but in theory it's semantically meaningful to have it extend outside=
 the
> >>>> image.
> >>>>
> >>>> VMware's clients in particular will clamp the hotspot to the dimensi=
on
> >>>> of the cursor image if we receive one that's out of bounds.
> >>>>
> >>>> So I would assume the right thing to do here would be to allow it and
> >>>> let the clients figure out how to best handle it. =20
> >>> Hi,
> >>>
> >>> if it is normal that clients clamp the hotspot to inside the cursor
> >>> image, then I would come to the opposite conclusion: KMS UAPI needs to
> >>> require the hotspot to be within the cursor image. Otherwise the
> >>> results would be unpredictable, if clients still continue to clamp it
> >>> anyway. I would assume that clients in use today are not prepared to
> >>> handle hotspot outside the cursor image.
> >>>
> >>> It is also not a big deal to require that. I think it would be very r=
are
> >>> to not have hotspot inside the cursor image, and even if it happened,
> >>> the only consequence would be that the guest display server falls back
> >>> to rendered cursor instead of a cursor plane. That may happen any time
> >>> anyway, if an application sets e.g. a huge cursor that exceeds cursor
> >>> plane size limits. =20
> >> Hypervisors are normally more privileged than the kernel, so any
> >> hypervisor/remoting client here really should be dealing with this case
> >> rather than trusting the kernel to handle it for them. =20
> > Sorry, handle what? Trust the guest kernel to do what?
> >
> > Personally I'm only interested in the KMS UAPI the guest kernel offers
> > to guest userspace, and requiring hotspot to be inside the cursor image
> > is fine. I don't think it needs even a strong justification, it's what
> > most would likely expect, and expectations are good to record in spec.
> >
> > The UAPI contract is between (guest) kernel and (guest) userspace, and
> > I expect the kernel to fully enforce that towards the userspace.
> >
> > I understand that hypervisors cannot trust guest kernels for security,
> > but I also think that's a different matter. =20
>=20
> You were saying that results would be unpredictable if the kernel=20
> allowed hotspots to be outside the dimensions of the cursor image. I'm=20
> not clear in what way you think that would cause unpredictable results,=20
> or what problems that would cause?

That statement was based on the assumption that existing hypervisors
and VM viewer applications are not prepared to deal with hotspots
outside of cursor image. Therefore, if a guest is upgraded to a version
that uses hotspots outside of cursor images, and the VM stack is not
updated, it will malfunction.

Therefore it is best to model the new UAPI in a way that is compatible
with existing VM stack, especially since allowing this new feature
(hotspots outside of cursor image) has no known benefits.

Below I see my assumption was incorrect, but it still causes you to
fall back to something less optimal.

> Essentially setting the hotspot properties means that the hypervisor=20
> console can choose to either draw the cursor where the plane is located,=
=20
> or use the cursor-plane + hotspot information to draw the cursor where=20
> the user's mouse is on the client.
>=20
> That works the same whether the hotspot is clamped or not.=C2=A0 We mostl=
y=20
> use clamping to avoid pathological cases (like a hotspot ot MAX_UINT32),=
=20
> and get away with it because real Guest applications that do this are=20
> very rare.

My point here is that you can design the new Linux UAPI to help you:
you can rule out cases that would lead to non-optimal behaviour, like
falling back to the drawing of cursor plane you mention when it would
be better to commandeer the cursor plane with the hotspot information.

> >>>>> The question of which input device corresponds to which cursor plane
> >>>>> might be good to answer too. I presume the VM runner is configured =
to
> >>>>> expose exactly one of each, so there can be only one association? =
=20
> >>>> As far as I know, all of the VM consoles are written as though they
> >>>> taking the place of what would the the physical monitors and input
> >>>> devices on a native machine.=C2=A0 So they assume that there is one =
user,
> >>>> sitting in front of one console, and all monitors/input devices are
> >>>> being used by that user. =20
> >>> Ok, but having a single user does not mean that there cannot be
> >>> multiple independent pointers, especially on Wayland. The same with
> >>> keyboards. =20
> >> True, and if the userspace is doing anything complicated here, the
> >> hypervisor has to be responsible for ensuring that whatever it's doing
> >> works with that, or else this system won't work.=C2=A0 I don't know th=
at the
> >> kernel is in a good position to police that. =20
> > What do you mean by policing here?
> >
> > Isn't it the hypervisor that determines what virtual input devices will
> > be available to the guest OS? Therefore, the hypervisor is in a
> > position to expose exactly one pointer device and exactly one
> > cursor plane to guest OS which means the guest OS cannot get the
> > association wrong. If that's the general and expected hypervisor
> > policy, then there is no need to design explicit device association in
> > the guest kernel UAPI. If so, I'd like it to be mentioned in the kernel
> > docs, too. =20
>=20
> I'm not entirely sure how to fit what you're calling a "pointer" into my=
=20
> mental model of what the hypervisor is doing...

My definition: A pointer is a pointing input device that requires a
cursor image to be drawn at the right location for it to be usable.

> For a typical Linux Guest, we currently expose 3+ virtual mouse devices,=
=20
> and choose which one to send input to based on what their guest drivers=20
> are doing, and what kind of input we got from the client.=C2=A0 We expect=
 the=20
> input from all of those to end up in the same user desktop session,=20
> which we expect to own all the virtual screens, and that the user the=20
> only gets one cursor image from that.

Why do you need to expose so many pointer devices? Just curious.

If you do expose multiple mouse (pointer) devices, then guest OS can
choose to use each of them as a different independent cursor on the
same desktop. The only thing stopping that is that it's not usually
useful, so it's not done.

Therefore, what you need to document in the Linux UAPI instead is that
*all* pointer devices are associated with the *same* cursor plane. That
forbids the multi-pointer pointer scenario the VM stack cannot handle.

> But we think of that as being a contract between the user desktop and=20
> the hypervisor, not the graphics/mouse drivers.=C2=A0 I might be out of t=
ouch=20
> with how Wayland/KMS thinks of this, but normally the user desktop is=20
> receiving the mouse events (in terms of either relative dx/dy, or=20
> absolute mouse device coordinates [0, MAX_UINT32] or something) and=20
> mapping those onto specific pixels in the user's desktop, which then=20
> gets passed up to the graphics driver as the location of the mouse cursor.

The contract between the guest desktop and the hypervisor is the Linux
UAPI contract. There is no other contract that generic guest userspace
knows of. The UAPI is defined by Linux, and implemented by Linux device
drivers and shared subsystem cores. Wayland is not part of that
contract, but DRM KMS is. Specifically, it is the Wayland or X11
display server that uses the contract on behalf of the guest desktop.

On other parts, yes, you're correct.

> So I guess I'm not clear on what kind of usermode<=3D>kernel contract you=
=20
> want here if the kernel isn't what's owning the translation between the=20
> mouse input and the cursor position.=C2=A0 The hypervisor awkwardly has t=
o=20
> straddle both the input/graphics domain, and we do so by making=20
> assumptions about how the user desktop is going to behave.

Correct. In order to reduce that awkwardness, I encourage you to write
down the expectations and requirements in this new Linux UAPI (the KMS
cursor place hotspot property). Then you can be much more confident on
how a random Linux desktop will behave.

It will also help the reviewers here to understand what the new UAPI is
and how it is supposed to work.

>  From VMware's perspective, I think it's fair to document that all input=
=20
> devices are expected to feed into the same single cursor plane.=C2=A0 Or =
to=20
> generalize that slightly, if a virtual graphics driver chose to expose=20
> multiple cursor planes, then I think noting that it's the hypervisor's=20
> responsibility to ensure that it's synchronizing the correct cursor=20
> hotspot with the correct user pointer is probably also fair, but we=20
> would be extrapolating past what anyone is doing today (as far as I'm=20
> aware).

Right. I think it's best to leave multiple cursor planes scenario out
for now, because there is no way the hypervisor could know which is
which for the guest userspace until you add more Linux UAPI to
communicate that.

People developing KMS, and for KMS, are accustomed to every CRTC
(output) potentially having its own cursor plane. Hence, it is a
surprise to rely on there being essentially only one cursor plane on
the whole DRM device.

> >>>    =20
> >>>> Any more complicated multi-user/multi-cursor setup would have to be
> >>>> coordinated through a lot of layers (ie from the VM's userspace/kern=
el
> >>>> and then through hypervisor/client-consoles), and as far as I know
> >>>> nobody has tried to plumb that all the way through.=C2=A0 Even physi=
cal
> >>>> multi-user/multi-console configurations like that are rare. =20
> >>> Right.
> >>>
> >>> So if there a VM viewer client running on a Wayland system, that view=
er
> >>> client may be presented with an arbitrary number of independent
> >>> pointer/keyboard/touchscreen input devices. Then it is up to the clie=
nt
> >>> to pick one at a time to pass through to the VM.
> >>>
> >>> That's fine.
> >>>
> >>> I just think it would be good to document, that VM/viewer systems
> >>> expect to expose just a single pointer to the guest, hence it is
> >>> obvious which input device in the guest is associated with all the
> >>> cursor planes in the guest. =20
> >> I don't have a problem adding something that suggests what we think the
> >> hypervisors are doing, but I would be a little cautious trying to
> >> prescribe what the hypervisors should be doing here. =20
> > If the UAPI has been designed to cater for specific hypervisor
> > configurations, then I think the assumptions should definitely be
> > documented in the UAPI. Hypervisor developers can look at the UAPI and
> > see what it caters for and what it doesn't. It's not a spec for what
> > hypervisors must or must not do, but an explanation of what works and
> > what doesn't given that guest userspace is forced to follow the UAPI.
> >
> > If there is no record of how the input vs. output device association is
> > expected to be handled, I will be raising questions about it until it
> > is.
> >
> > Having limitations is fine, but they need to be documented. =20
>=20
> I think my confusion here is that if we were to try and support=20
> multi-user or multi-pointer sessions, our instinct would probably be to=20
> bypass the kernel entirely and work with a userspace<->hypervisor=20
> channel for communicating what the user desktops think the session=20
> topology is.

In that case it is outside of the Linux UAPI scope, and that is fine.
You would not use Linux DRM devices for output or Linux input devices
for input. I mentioned VNC and RDP previously as options. RDP has even
extensions to take advantage of device and memory sharing with the host
AFAIK.

> But as I noted above, I think it's fair to document that this is all=20
> assumed to be working in an environment where there is one cursor plane=20
> shared across all displays, and all input devices used by the hypervisor=
=20
> are processed as part of that session.=C2=A0 (If that's what you're looki=
ng=20
> for...)

Yes!

> > =20
> >> I certainly can't speak for all of them, but we at least do a lot of o=
dd
> >> tricks to keep this coordinated that violate what would normally be
> >> abstraction layers in a physical system such as having the mouse and t=
he
> >> display adapter collude.=C2=A0 Ultimately it's the hypervisor that is
> >> responsible for doing the synchronization correctly, and the kernel
> >> really isn't involved there besides ferrying the right information dow=
n. =20
> > Are you happy with that, having to chase and special-case guest OS quir=
ks?
> >
> > Or would you rather know how a guest Linux kernel expects and enforces
> > guest userspace to behave, and develop for that, making all Linux OSs
> > look fairly similar?
> >
> > You have a golden opportunity here to define how a Linux guest OS needs
> > to behave. When it's enshrined in Linux UAPI, it will hold for decades,
> > too. =20
>=20
> I mean, we're certainly happy to make this as nice as possible for=20
> ourselves and others, but when we're trying to support OS's from the=20
> last 30+ years, we end up with a lot of quirks no matter what we do.
>=20
> I mentioned earlier about the display<=3D>input mapping, but the model we=
=20
> use internally is closer to what a desktop manager is doing that a=20
> kernel.=C2=A0 So each virtual display is rooted at a point in the topolog=
y=20
> that corresponds to the user desktop's idea of how the mouse moves=20
> around the screens, and then we use that to map client mouse coordinates=
=20
> into whatever space the input device is using so that the guest's=20
> desktop send the mouse to the correct location.
>=20
> I'm not a KMS expert either, but I thought that the X11/Wayland=20
> component was still doing that display<=3D>mouse mapping and the kernel=20
> just matched up the display images with the monitors.

Correct.

However, in your case, the userspace (Wayland or X11 display server) is
not free to choose any arbitrary input-cursor association they might
want. You have a specific expectation that all pointing devices control
the same pointer. Since the hotspot property is exclusive to your use
case, I think it make sense to write down the expectations with the
hotspot property. Guest userspace has to explicitly program for the
hotspot property anyway, so it can also take care of your requirements.

This is the whole reason why paravirtualized cursor planes are being
hidden from atomic KMS userspace unless userspace promises to use the
hotspot property correctly: some Wayland compositors are happy to put
regular windows on cursor planes when there is no other use for a
cursor plane from time to time, to avoid CPU or GPU composition. After
all, the main use of KMS planes is to off-load parts of desktop
composition to dedicated display hardware in order to save power and
improve performance.

Btw. rather than with the KMS hotspot property literally, these things
could also be documented with the flag
(DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT) that userspace uses to promise
that it handles the hotspot property correctly.


Thanks,
pq

> > =20
> >>> Btw. what do you do if a guest display server simultaneously uses
> >>> multiple cursor planes, assuming there are multiple outputs each with=
 a
> >>> cursor plane? Or does the VM/viewer system limit the number of outputs
> >>> to one for the guest? =20
> >> Zack would have to confirm what the vmwgfx driver does, but the VMware
> >> virtual display hardware at least only has one cursor position.=C2=A0 =
So I
> >> would assume that vmwgfx tries to only expose one plane and the rest g=
et
> >> emulated, or else it just picks one to set live, but I'm not an expert
> >> on vmwgfx. =20
> > Right. I would not expect a guest driver to invent more virtual devices
> > than what the hypervisor exposes.
> >
> > I believe that using universal planes KMS UAPI, a guest display driver
> > can also expose a single cursor plane that can migrate between CRTCs.
> > =20
> >> Normally we try to run a userspace agent in the Guest that also helps
> >> coordinate screen positions/resolutions to match what the user wanted =
on
> >> their client.=C2=A0 So when a user connects and requests from our UI t=
hat
> >> they want the screens to be a particular configuration, we then send a
> >> message to the userspace agent which coordinates with the display
> >> manager to request that setup.=C2=A0 You can certainly manually config=
ure
> >> modes with things like rotation/topologies that break the console mous=
e,
> >> but we try not to put the user into that state as much as possible.
> >> Multiple cursors in the Guest display manager probably fall into that
> >> category. =20
> > That sounds like something that only works with Xorg as the guest
> > display server, as X11 allows you to do that, and Wayland does not.
> >
> > You could do similar things through the guest kernel display driver by
> > manufacturing hotplug events and changing read-only KMS properties
> > accordingly, at least to some degree. =20
> Yeah, what we have now is definitely X11-focused.=C2=A0 We've certainly=20
> thought about using hotplug events for controlling the display updates,=20
> and might move that direction someday.
>=20
> >
> > At some point, extending KMS for virtualized use cases stops being
> > reasonable and it would be better to connect to the guest using VNC,
> > RDP, or such. But I think adding hotspot properties is on the
> > reasonable side and far from that line. =20
>=20
> Possibly, yeah.=C2=A0 I mean, so far I don't think we're talking much abo=
ut=20
> additional extensions (beyond the hotspot), but rather additional=20
> restrictions on what the desktop manager is doing.=C2=A0 But if more exot=
ic=20
> usage of KMS becomes normal then that would be an interesting time to=20
> look at other options.
>=20
> --Michael Banack


--Sig_/NnvDNeiYE+ncE3bwpcafEh2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmSnzw0ACgkQI1/ltBGq
qqczNw/9HlHrpHlN5bU5z4Dc9Ea1YY18svR03DGcnp6XXKUz1v0VLXSKnSkGsYeY
C+KQUIEuzshONuqtfsQFUVHOPufcinWe+6x8+Rumv0HESBs12r9Vq5sLV61MCwFN
69WqCr4wD0zsInId97WFN3fn+0PeQ/6D6RYkOQvah8a3kbnubZgnAR+LaeOEH6oU
61DfSTnsGzfVZyTzVgh2OpkdU61/VmbTjI/w8htiBsi7dbepI9kVBjE9nZnxARhs
nZvjAoeZ7qdZa+HMmtjdEM2w1F7EZwiqW+f60s+8KgSKB6TLNDg+m8X2ozceU8Nw
5S0vbbCQX3Mmcsf3KAOWq7gX/oYNO83F3zeyfBk2DWFF2JslcwDInkmmaOW849pL
vUJiqU8ZoyfV1j2XzIdal931cVFdKAXocqQJrv6jgVrvv1/KN4ieY3oVOsaHT4yc
NvB1oZoHQjvlYoh7h7Cc3UclonPpt9aCH9dz0nQ9Hkb28suCgamiLMcyuQxllikY
xpYA2CQAHBgZlC/sE39o/Yq3samyiI0uZqIRm24h87nS6UB/IoG1FdqS9v7EiODV
RSYsYwRYiOR9iZaRa4Qb4PFauWbbZlgh7Ww2r2nlbyN/zCUdZi5VzTpcyF6N8voR
h+TcUqCBUDUlQbH9yMeqqmiRSxv12luXvv/Ecfd+dSWvLkoa3Go=
=wkIA
-----END PGP SIGNATURE-----

--Sig_/NnvDNeiYE+ncE3bwpcafEh2--
