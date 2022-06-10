Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 161B7545DC9
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 09:49:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64ADE10EF15;
	Fri, 10 Jun 2022 07:49:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A96410EF15;
 Fri, 10 Jun 2022 07:49:49 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id y32so41553369lfa.6;
 Fri, 10 Jun 2022 00:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=qcbkzXed/yCCzEcxhuOOEacfsTUVtBDnoeFG4UDTccM=;
 b=Gm6NuWC8uEvTCE+mjfepiH3VoNv0ABc2BH1RMain6nMvqbbL3omuE+LBl7dVyfrhre
 pB9p27kJErn4w3E3YQDVxYyQat9FW4iUbMY8d2RBma4FuQnVJZKI6wkFQ78rb254osXG
 HLS4VSSdn17c18f+3qihhfu4Q1Ue/m4gOuCehXda7bRxdEMZu3FX8BRc+VhmM/R7sQFI
 bqAjjYdKm14JpyJFXwXgsck8W6qwl7A+4BpJp1B32PHbSfaCdtAgmV0tBsUpAAef5OcF
 DiFMNL/eTRuGWVpXDOaFOklKantV1YcsL0BMET5YzvpaOP7+qHEnfYA3k+ef+gea6AqS
 xk/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=qcbkzXed/yCCzEcxhuOOEacfsTUVtBDnoeFG4UDTccM=;
 b=uqIzxYnOIWmusiOCa2k1WZ5IOqbwYdKrAOEimvoWg5NUg+EvoIjRn4Drkemfq2bb/G
 QQP3h8CfdSwMikDIgGbqMqqk4Zml/6hSlenc3JxbsSBomsiDccdDqWwUmlV5/cTNd7uO
 bXM5SlaydoyA4CpnvuszIHaBcmqc6BNkxGFWlbGNU9D0fzs1oCkEZ/kkuw3KECtnVhGS
 YZWFcfk+pSWjxz5RmXIV7jJQNWv3uzry/Lw/zSXn7pZa68RN2UJ+qBn90UWiQz8SqgK/
 KnzZA/OIOlzqz3/23tWmLvI34K4SMD9OQSkzQkhNxZottPcqtzMKEe+3RQfNvuVztnYG
 W2bA==
X-Gm-Message-State: AOAM532u49cmFHqXGbH/SyiNVvOx1JLJLRI7wced4NHPSmCJL8MC8Ivr
 +d3VvnMJlNe3O5CHmlBL9E4=
X-Google-Smtp-Source: ABdhPJzwKHkl+EvasBbM9dm5oeGusyQGZC9M92qbq0nLJcgA8gr47rArtPbs8OwbpQJxCJgsiceR+A==
X-Received: by 2002:a05:6512:6c6:b0:47d:b651:daeb with SMTP id
 u6-20020a05651206c600b0047db651daebmr445752lff.360.1654847387339; 
 Fri, 10 Jun 2022 00:49:47 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 h23-20020ac25977000000b0047255d21128sm4620857lfp.87.2022.06.10.00.49.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 00:49:46 -0700 (PDT)
Date: Fri, 10 Jun 2022 10:49:31 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Zack Rusin <zackr@vmware.com>
Subject: Re: [PATCH 0/6] drm: Add mouse cursor hotspot support to atomic KMS
Message-ID: <20220610104931.29e1d172@eldfell>
In-Reply-To: <0485fdf9844f8c89cd5670096b78f8090378b2a1.camel@vmware.com>
References: <20220602154243.1015688-1-zack@kde.org>
 <wRnf-Lm5zz6v1e-NlnFPteyARuLl-R98mOZZVjePHD5ue7QQNR_TSU7RwYBssgUa7xM5hf7Fe59-gMEj81ESrHY3mu_H7yE0dtGhFHFPTnc=@emersion.fr>
 <20220607110707.02eccda5@eldfell>
 <197201d5da2c504502b8c2225d6766338b18d732.camel@vmware.com>
 <20220608105338.22592a09@eldfell>
 <0485fdf9844f8c89cd5670096b78f8090378b2a1.camel@vmware.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/RZQYNUEIsMgAdC646ZT_i4K";
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
Cc: "hdegoede@redhat.com" <hdegoede@redhat.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "gurchetansingh@chromium.org" <gurchetansingh@chromium.org>,
 Martin Krastev <krastevm@vmware.com>, "kraxel@redhat.com" <kraxel@redhat.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "wayland-devel@lists.freedesktop.org" <wayland-devel@lists.freedesktop.org>,
 Maaz Mombasawala <mombasawalam@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/RZQYNUEIsMgAdC646ZT_i4K
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 9 Jun 2022 19:39:39 +0000
Zack Rusin <zackr@vmware.com> wrote:

> On Wed, 2022-06-08 at 10:53 +0300, Pekka Paalanen wrote:
> > On Tue, 7 Jun 2022 17:50:24 +0000
> > Zack Rusin <zackr@vmware.com> wrote:
> >  =20
> > > On Tue, 2022-06-07 at 11:07 +0300, Pekka Paalanen wrote: =20
> > > > On Fri, 03 Jun 2022 14:14:59 +0000
> > > > Simon Ser <contact@emersion.fr> wrote:
> > > >    =20
> > > > > Hi,
> > > > >=20
> > > > > Please, read this thread:
> > > > > https://lists.freedesktop.org/archives/dri-devel/2020-March/threa=
d.html#259615
> > > > >=20
> > > > > It has a lot of information about the pitfalls of cursor hotspot =
and
> > > > > other things done by VM software.
> > > > >=20
> > > > > In particular: since the driver will ignore the KMS cursor plane
> > > > > position set by user-space, I don't think it's okay to just expose
> > > > > without opt-in from user-space (e.g. with a DRM_CLIENT_CAP).
> > > > >=20
> > > > > cc wayland-devel and Pekka for user-space feedback.
> > > > >=20
> > > > > On Thursday, June 2nd, 2022 at 17:42, Zack Rusin <zack@kde.org> w=
rote:
> > > > >    =20
> > > > > > - all userspace code needs to hardcore a list of drivers which =
require
> > > > > > hotspots because there's no way to query from drm "does this dr=
iver
> > > > > > require hotspot"     =20
> > > > >=20
> > > > > Can you elaborate? I'm not sure I understand what you mean here.
> > > > >    =20
> > > >=20
> > > > Hi Zack and everyone,
> > > >=20
> > > > I would like to try to reboot this discussion and explain where I c=
ome
> > > > from. Maybe I have misunderstood something.   =20
> > >=20
> > > <snip> First of all thanks for restarting the discussions. I think Ge=
rd did a good
> > > job responding to individual points, so let me take a step back and e=
xplain the big
> > > picture here so we can reboot.
> > >  =20
> > > > Which root problems do you want to solve exactly?   =20
> > >=20
> > > The problem that this patch set is solving is the relatively trivial =
problem of not
> > > having a way of setting the hotspot in the atomic kms interface. When=
 we
> > > (virtualized drivers) are using the native cursor we need to know not=
 only the image =20
> >=20
> > Could you clarify what is "native cursor" here?
> > I guess it is the host window system pointer's cursor? =20
>=20
> Right, exactly. I'm a little hesitant to call it "host" because it gets t=
ricky in
> remote scenarios, where the host is some ESXi server but the local machin=
e is the
> one that's actually interacting with the guest. So it's the cursor of the=
 machine
> where the guest screen is displayed.
>=20
>=20
> > > Now, where the disagreements come from is from the fact that all virt=
ualized drivers
> > > do not implement the atomic KMS cursor plane contract exactly as spec=
ified. In
> > > atomic kms with universal planes the "cursor" plane can be anything s=
o asking for
> > > hotspot's for something that's not a cursor is a bit silly (but argua=
bly so is
> > > calling it a cursor plane and then complaining that people expect cur=
sor in it).
> > >=20
> > > So the argument is that we can't put hotspot data into atomic kms wit=
hout first
> > > rewriting all of the virtualized drivers cursor code to fix the under=
lying contract
> > > violation that they all commit. That would likely be a lot easier sel=
l if not that
> > > gnome/kde don't put none cursor stuff in the cursor plane, so all thi=
s work is to
> > > fix breakages that seem to affect 0 of our users (and I completely un=
derstand that
> > > we'd still like all the drivers to be correct and unified in terms of=
 their
> > > behaviour, I'm just saying it's a hard sell without something that we=
 can point to
> > > and say "this fixes/improves things for our customers")  =20
> >=20
> > What's the cost of making paravirtualized drivers honour the UAPI contr=
act?
> > Can't you do that on the side of implementing these new hotspot
> > properties, with the little addition to allowing guest userspace to be
> > explicit about whether it supports commandeering or not? =20
>=20
> I'm reluctant here because "fixing" here seems to be a bit ephemeral as w=
e move from
> one solution to the next. I'm happy to write a patch that's adding a
> DRM_CLIENT_CAP_VIRTUAL_CURSOR_AWARE flag and hiding the cursor plane in v=
irtualized
> drivers for clients that advertise DRM_CLIENT_CAP_ATOMIC but not
> DRM_CLIENT_CAP_VIRTUAL_CURSOR_AWARE, but that doesn't solve Weston on vir=
tualized
> drivers.

Mind, I have not talked about hiding cursor planes. I have talked
*only* about stopping commandeering cursor planes if guest userspace
does not indicate it is prepared for commandeering.

I don't understand how it does not "solve on Weston on virtualized
drivers". Can you explain what is not solved?

As far as I can see, it does solve Weston: it makes cursor plane
behaviour correct from KMS UAPI contract point of view. Anything that
is not quite optimal after that with cursor planes you can blame on
Weston not making use of additional optional features.

Cursor plane itself is an additional optional feature. Userspace has no
obligation to use one at all, but if it does, it better behave by the
UAPI contract.

> I feel like that's a larger discussion. One that we need to have in gener=
al - it's
> about standardising on behaviour of userspace with virtualized drivers, e=
.g. on
> Weston even the most basic functionality of virtualized drivers which is =
resizing a
> window doesn't work correctly (virtualized drivers send drm_kms_helper_ho=
tplug_event
> which sends a HOTPLUG=3D1 event with a changed preferred width/height but=
 Weston
> doesn't seem to resize the fb on them which results in Weston not resizin=
g to the
> new size of the window) or even considering the suggested_x and suggested=
_y
> properties. It seems like we might need to have a wider discussion on sta=
ndardising
> those common issues on virtualized drivers because currently, I'm guessin=
g, that
> apart from Gnome and KDE most compositors are completely broken on virtua=
lized
> drivers.

You say "broken", I say "not implemented yet". *Those* problems are
Weston's own problems. They are new features that require explicit
support in Weston. No driver should try to implement those behind guest
userspace back.

This "not resizing" is not at all the same as the cursor plane
commandeering. Weston not supporting KMS-induced resizing does not
silently result in fundamentally incorrect behaviour. The CRTC size
remains the same, and nothing is actually broken. Only the end user
cannot seem to resize the viewer window, but everything works fine
otherwise. OTOH, when the VM stack commandeers the cursor plane without
permission, it breaks things so bad that user interaction is near
impossible. And it's a violation of the KMS UAPI contract.

If we are looking at things virtual drivers make strange, another thing
is that Weston is not expecting KMS pageflips to complete always
immediately regardless of the programmed refresh rate and "hardware"
refresh cycle phase. It is only luck that Weston does not end up in a
busy-loop updating the screen on virtual drivers, not intentional. We
can have a similar discussion there, are KMS drivers in general allowed
to complete atomic flips always immediately even if userspace asks for
vsync'd flips, or does it require explicit userspace opt-in.

> I'd prefer not blocking fixing hotspots until all those issues are resolv=
ed so if we
> can agree on what we'd like to fix before hotspots go in, that'd be great.

I think you are confusing things here. In my mind there is no doubt
about the KMS UAPI contract on cursor planes: commandeering is not
allowed. You have to add new UAPI to allow the VM stack to commandeer
cursor planes, and guest userspace must opt-in for that.

How you design that is up to you. Maybe a new client cap, or maybe you
inspect every atomic commit did the userspace set the hotspot
properties this time or not. The main thing is that this has been
thought about and documented.

I really do not see why adding that detail is so big deal, while not
adding that will leave virtual drivers fundamentally broken (incorrect
behaviour resulting from violating the KMS UAPI contract) for cursor
planes.

-----

Maybe we need to take another step back. Why are virtual drivers
specifically DRM KMS drivers? Was the idea not that if virtual drivers
pretend to be KMS drivers, we would not need to patch userspace? But
now we need to patch userspace anyway, so why bother with KMS and its
design limitations that are well appropriate for hardware drivers but
not for virtual drivers? If you had your own winsys virtualization
protocol, you could do so much more than KMS is ever going to allow
you, and so much better.

Or just, you know, use RDP, VNC, and whatnot there already exists.

Why KMS?

That's probably obvious to you, but not me.

I would also like to point out that I am not a kernel developer and I
have no NAK/veto rights on any kernel patches. I can only explain how
things look like from userspace perspective.

I suspect there is nothing more I can say. Those were my opinions, but
the decisions are up to kernel maintainers. Hence, I can agree to
disagree with you.


Thanks,
pq

--Sig_/RZQYNUEIsMgAdC646ZT_i4K
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmKi94sACgkQI1/ltBGq
qqdtmQ/+JLJFItSoy+UQNHcqg5hxlncrhnvtXnCNgMcm9bbeH3Ckl82eubpAbn1U
iZ1GppmFp+TmYZvOoZjcvFrzrkqJ6QYZg1YUka2287sUoAEyropWyDsQA394psP/
A61ccy53HHxa78yegRoIb6emdZ/2JImWBf91e0aLXNWiQatNLG5/F3DWh+aAMNIr
/Lf0ftn2Tpa4XRe7HFeUfjz34YAQoAfhPkbMm6NGkM9X1WCpG7JHdwi3vnru+7ce
VtjyQ8eNb0qtHV6J908SpYTk5EB7u3y8Q2NYbRQQxSBkUpACFc46uWD6ZZLsvuk9
oeoQKTHy3aVFix6PCHpUNbFjviMUQNSf50FmUZwa6wTjAkdsdwgXYvEOwylyKzDY
3L2G2ZZOM6d3y2d4pzISEE1lIjqtf0x10Ab63XIMFgtWKKLtXO8IMUvY7VKcWU2+
MJLwZDkI4/+Ff9nWvMMQULDjPsLcG5yoL3mYXA8t1oNumGTayhlt4J1bOukfW3FU
KBoWVJWMXYN1/WS/JZrFsgdfAhJTbU1Z3T+B5A5/Ki1+XAA7qIXhxAx5k+/EdcgO
MRO7WL0V9/Rx6qdAOgD9PsVfW3UCCctzsRjTEYSsg5y7p+IlXAsD8nEF5rC1PktK
aTU6zhcutuguqjHO8ZTKuxB3WGoJJC60y+OetobK07IfzAvULro=
=QD8D
-----END PGP SIGNATURE-----

--Sig_/RZQYNUEIsMgAdC646ZT_i4K--
