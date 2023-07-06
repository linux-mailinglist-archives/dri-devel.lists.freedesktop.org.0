Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6197496FA
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 10:02:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E006710E461;
	Thu,  6 Jul 2023 08:02:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 993A010E461
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jul 2023 08:02:00 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4f9fdb0ef35so474392e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jul 2023 01:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688630516; x=1691222516;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=vyp/9XA3VeIwo5vQ7cCyAzz/r1gWic6MPkKz9UeIw+E=;
 b=pckOCiwvSFJdPSywrL07QtFMj/VRIVVZIyETx4qKUnFtK+zJWvgiHBEYorOxf2e5bU
 qWo660jvOdN++HAIkiWE00DG9ycoO3Fq3Psz5ie/PT4tFM3cn/sWBZVt+GgWcwvxtFAy
 9v76o1qg7d+KEVfkGLeMST+MnHs7a7FvhVBMMtozTXpynRcFtxn6qYEypw0D7/a+k/QN
 ce5tAl1LlHY03I1hdcQzheXI4fdV0hR5npyGix/aH0NCKmEJzvXSsy/8rgWb394HvHnX
 JXi1PUdHW91PIuWK/Q/eihC3F7qrFd6bgfkw9/a9LkH9Kwc84D7BeR/GHK7IgaPZbX0y
 HBgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688630516; x=1691222516;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vyp/9XA3VeIwo5vQ7cCyAzz/r1gWic6MPkKz9UeIw+E=;
 b=FTQLIJqhJNNU44DQfvNkIbuff/6rReVKdTSP+WG6H290mwwM29b9MBLxm9PkTxbHk1
 EyzWSvlohqDumbjI7Venjb9YipHXF1+bykNTEs22Fl7Ku5bjGyD/9cOZEaNAF4GFguCP
 CcRArQabxk88yoSVRI0bpfLFCAY2UpJ0oHr9ZU766J+fO9zd0SQe8qrv3Lb4KcdOWSkm
 cJ4qQa2lnqvVOwc/a0jcgxeNk1eHVHhpzXS19ARmJ3jB5i18+QmSQICnkzkfD3ya9tMo
 sUEvefqkcbl7I6FjNoCoR2pGTWpRyhHvAJxBSzLqeqGYv/tf0ROZIw+omrQByFY6VnvG
 xdAQ==
X-Gm-Message-State: ABy/qLbTJhio9MNErG7+VCAO8wOKS0XUCKz/fcLrfJGgDVvNNAKDPlO/
 k+taecxNCyWFwknvvbODy/8=
X-Google-Smtp-Source: APBJJlF5RjWA4GTXUWCaFELyL9DiEfvK0nGmLGMqQud3MfABSgq7em4Asg5YktZHh9FFoQTcaFAtMQ==
X-Received: by 2002:a19:644a:0:b0:4f8:7524:8431 with SMTP id
 b10-20020a19644a000000b004f875248431mr864725lfj.44.1688630515958; 
 Thu, 06 Jul 2023 01:01:55 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 r13-20020ac25a4d000000b004cc9042c9cfsm150761lfn.158.2023.07.06.01.01.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jul 2023 01:01:55 -0700 (PDT)
Date: Thu, 6 Jul 2023 11:01:46 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Michael Banack <banackm@vmware.com>
Subject: Re: [PATCH v4 2/8] drm/atomic: Add support for mouse hotspots
Message-ID: <20230706110146.0abeda0a@eldfell>
In-Reply-To: <ce7754be-8085-ffd1-93f3-a774f7fcdb87@vmware.com>
References: <20230628052133.553154-1-zack@kde.org>
 <20230628052133.553154-3-zack@kde.org>
 <20230628104106.30360b55@eldfell> <20230628105424.11eb45ec@eldfell>
 <2fb2f3985df4d6710e5ad33f6e618a52004714df.camel@vmware.com>
 <20230629110348.3530f427@eldfell>
 <6c5449cf-b7a6-1125-9493-0fe968166915@vmware.com>
 <20230704110845.490344f5@eldfell>
 <ce7754be-8085-ffd1-93f3-a774f7fcdb87@vmware.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/QywG=US0h+xqCr5nio6mF+P";
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

--Sig_/QywG=US0h+xqCr5nio6mF+P
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 5 Jul 2023 09:08:07 -0700
Michael Banack <banackm@vmware.com> wrote:

> On 7/4/23 01:08, Pekka Paalanen wrote:
> > On Mon, 3 Jul 2023 14:06:56 -0700
> > Michael Banack <banackm@vmware.com> wrote:
> > =20
> >> Hi, I can speak to the virtual mouse/console half of this from the
> >> VMware-side.
> >>
> >> I believe Zack's preparing a new set of comments here that can speak to
> >> most of your concerns, but I'll answer some of the other questions dir=
ectly.
> >>
> >> On 6/29/23 01:03, Pekka Paalanen wrote: =20
> >>> Is it really required that the hotspot coordinates fall inside the
> >>> cursor plane? Will the atomic commit be rejected otherwise? =20
> >> Most console systems require the hotspot to get within the cursor imag=
e,
> >> but in theory it's semantically meaningful to have it extend outside t=
he
> >> image.
> >>
> >> VMware's clients in particular will clamp the hotspot to the dimension
> >> of the cursor image if we receive one that's out of bounds.
> >>
> >> So I would assume the right thing to do here would be to allow it and
> >> let the clients figure out how to best handle it. =20
> > Hi,
> >
> > if it is normal that clients clamp the hotspot to inside the cursor
> > image, then I would come to the opposite conclusion: KMS UAPI needs to
> > require the hotspot to be within the cursor image. Otherwise the
> > results would be unpredictable, if clients still continue to clamp it
> > anyway. I would assume that clients in use today are not prepared to
> > handle hotspot outside the cursor image.
> >
> > It is also not a big deal to require that. I think it would be very rare
> > to not have hotspot inside the cursor image, and even if it happened,
> > the only consequence would be that the guest display server falls back
> > to rendered cursor instead of a cursor plane. That may happen any time
> > anyway, if an application sets e.g. a huge cursor that exceeds cursor
> > plane size limits. =20
> Hypervisors are normally more privileged than the kernel, so any=20
> hypervisor/remoting client here really should be dealing with this case=20
> rather than trusting the kernel to handle it for them.

Sorry, handle what? Trust the guest kernel to do what?

Personally I'm only interested in the KMS UAPI the guest kernel offers
to guest userspace, and requiring hotspot to be inside the cursor image
is fine. I don't think it needs even a strong justification, it's what
most would likely expect, and expectations are good to record in spec.

The UAPI contract is between (guest) kernel and (guest) userspace, and
I expect the kernel to fully enforce that towards the userspace.

I understand that hypervisors cannot trust guest kernels for security,
but I also think that's a different matter.

>  From that perspective, we would normally try to preserve the=20
> application/guest semantics as much as possible, and then that gives us=20
> the ability to deal with this on the hypervisor side if it turns out=20
> that there's a critical case with the hotspot outside the image that we=20
> need to handle.
>=20
> But that said, while I've seen real Guests do this in the past, I don't=20
> recall seeing this from any modern operating systems, so I don't think=20
> it's a big deal for us either way.
>=20
> >
> > What I'm after with the question is that the requirement must be spelled
> > out clearly if it is there, or not even hinted at if it's not there. =20
> Agreed.
>=20
> >>> The question of which input device corresponds to which cursor plane
> >>> might be good to answer too. I presume the VM runner is configured to
> >>> expose exactly one of each, so there can be only one association? =20
> >> As far as I know, all of the VM consoles are written as though they
> >> taking the place of what would the the physical monitors and input
> >> devices on a native machine.=C2=A0 So they assume that there is one us=
er,
> >> sitting in front of one console, and all monitors/input devices are
> >> being used by that user. =20
> > Ok, but having a single user does not mean that there cannot be
> > multiple independent pointers, especially on Wayland. The same with
> > keyboards. =20
>=20
> True, and if the userspace is doing anything complicated here, the=20
> hypervisor has to be responsible for ensuring that whatever it's doing=20
> works with that, or else this system won't work.=C2=A0 I don't know that =
the=20
> kernel is in a good position to police that.

What do you mean by policing here?

Isn't it the hypervisor that determines what virtual input devices will
be available to the guest OS? Therefore, the hypervisor is in a
position to expose exactly one pointer device and exactly one
cursor plane to guest OS which means the guest OS cannot get the
association wrong. If that's the general and expected hypervisor
policy, then there is no need to design explicit device association in
the guest kernel UAPI. If so, I'd like it to be mentioned in the kernel
docs, too.

> > =20
> >> Any more complicated multi-user/multi-cursor setup would have to be
> >> coordinated through a lot of layers (ie from the VM's userspace/kernel
> >> and then through hypervisor/client-consoles), and as far as I know
> >> nobody has tried to plumb that all the way through.=C2=A0 Even physical
> >> multi-user/multi-console configurations like that are rare. =20
> > Right.
> >
> > So if there a VM viewer client running on a Wayland system, that viewer
> > client may be presented with an arbitrary number of independent
> > pointer/keyboard/touchscreen input devices. Then it is up to the client
> > to pick one at a time to pass through to the VM.
> >
> > That's fine.
> >
> > I just think it would be good to document, that VM/viewer systems
> > expect to expose just a single pointer to the guest, hence it is
> > obvious which input device in the guest is associated with all the
> > cursor planes in the guest. =20
>=20
> I don't have a problem adding something that suggests what we think the=20
> hypervisors are doing, but I would be a little cautious trying to=20
> prescribe what the hypervisors should be doing here.

If the UAPI has been designed to cater for specific hypervisor
configurations, then I think the assumptions should definitely be
documented in the UAPI. Hypervisor developers can look at the UAPI and
see what it caters for and what it doesn't. It's not a spec for what
hypervisors must or must not do, but an explanation of what works and
what doesn't given that guest userspace is forced to follow the UAPI.

If there is no record of how the input vs. output device association is
expected to be handled, I will be raising questions about it until it
is.

Having limitations is fine, but they need to be documented.

> I certainly can't speak for all of them, but we at least do a lot of odd=
=20
> tricks to keep this coordinated that violate what would normally be=20
> abstraction layers in a physical system such as having the mouse and the=
=20
> display adapter collude.=C2=A0 Ultimately it's the hypervisor that is=20
> responsible for doing the synchronization correctly, and the kernel=20
> really isn't involved there besides ferrying the right information down.

Are you happy with that, having to chase and special-case guest OS quirks?

Or would you rather know how a guest Linux kernel expects and enforces
guest userspace to behave, and develop for that, making all Linux OSs
look fairly similar?

You have a golden opportunity here to define how a Linux guest OS needs
to behave. When it's enshrined in Linux UAPI, it will hold for decades,
too.

> >
> > Btw. what do you do if a guest display server simultaneously uses
> > multiple cursor planes, assuming there are multiple outputs each with a
> > cursor plane? Or does the VM/viewer system limit the number of outputs
> > to one for the guest? =20
>=20
> Zack would have to confirm what the vmwgfx driver does, but the VMware=20
> virtual display hardware at least only has one cursor position.=C2=A0 So =
I=20
> would assume that vmwgfx tries to only expose one plane and the rest get=
=20
> emulated, or else it just picks one to set live, but I'm not an expert=20
> on vmwgfx.

Right. I would not expect a guest driver to invent more virtual devices
than what the hypervisor exposes.

I believe that using universal planes KMS UAPI, a guest display driver
can also expose a single cursor plane that can migrate between CRTCs.

> Normally we try to run a userspace agent in the Guest that also helps=20
> coordinate screen positions/resolutions to match what the user wanted on=
=20
> their client.=C2=A0 So when a user connects and requests from our UI that=
=20
> they want the screens to be a particular configuration, we then send a=20
> message to the userspace agent which coordinates with the display=20
> manager to request that setup.=C2=A0 You can certainly manually configure=
=20
> modes with things like rotation/topologies that break the console mouse,=
=20
> but we try not to put the user into that state as much as possible.=C2=A0=
=20
> Multiple cursors in the Guest display manager probably fall into that=20
> category.

That sounds like something that only works with Xorg as the guest
display server, as X11 allows you to do that, and Wayland does not.

You could do similar things through the guest kernel display driver by
manufacturing hotplug events and changing read-only KMS properties
accordingly, at least to some degree.

At some point, extending KMS for virtualized use cases stops being
reasonable and it would be better to connect to the guest using VNC,
RDP, or such. But I think adding hotspot properties is on the
reasonable side and far from that line.


Thanks,
pq

--Sig_/QywG=US0h+xqCr5nio6mF+P
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmSmdOoACgkQI1/ltBGq
qqclhhAAhpDZYUvpA0R4YRDhTLqNPuMbpC168+ykYvnr660auL+lwZoauNizAYA4
klc59eXm95/YbfY5mRNI6IGyscSRoCQHNlUEC5CGLEhpvdRnjc4pBtI6tucNKgd9
bSXJJBEwZF1a5rN21pftwB37p+nMVLRMF/pS5u7mcfUafwTsEO3yJxziX3LUoIch
niK4VYesreKg7S7Lfm2cdoF7ohlyA6FzV2xuc1xl80ZKPHsxavgnD1UjdYHRUG8J
D6/U+qFoxzXwgpSBHCKirWi3QAAxMmAVawOv6ZPotVPJHJI4o8INbhflq4CQA2Ek
HthpPFTt3WB7SgSAmjfQnNOL86bCKCHgrc8ODlE43ipKDrSiu99gm8GG5I5No7tk
vYvp1c/d0vLF/3KYjTkFbuFt2fVI0Ecc8N30Nl9mvs6EX23g8PQ9YGgZKStHKf41
gBooXW+zTSzJnceI6vrvFMxsmhuTiBBynUKAEJ+kCa/W2U9OWd7NtL0EggwrEEtI
dfJj7nP6aF3pora3uYbNDnzI8PXvmTTlBu/a9mnhAx7IuyjXytjp0hraE4bbLGk6
E0lgdeYB8aBqqpIvFzud5t+0zbp1hZtiJwb/D/v89uaBFxvZY3LPIIEfK4HjUKSc
mArH2UNpErBJQZfpMCv796Fh5742hpoK4FlAWQIkd897IrIM654=
=AhGl
-----END PGP SIGNATURE-----

--Sig_/QywG=US0h+xqCr5nio6mF+P--
