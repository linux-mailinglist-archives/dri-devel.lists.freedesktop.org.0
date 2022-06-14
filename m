Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DA354AAC0
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 09:37:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87F2E10FB2A;
	Tue, 14 Jun 2022 07:36:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9A0310FB2A;
 Tue, 14 Jun 2022 07:36:56 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id g2so8753430ljk.5;
 Tue, 14 Jun 2022 00:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=zZuf+KOYd+DAgWvhF7jj4OZN169JdWIOAD9CczBh73c=;
 b=WDEzjD1hSIqWD9ydPMYTXB0B8yYrRSlvjzpIXGxLtOia8gB4KdsWVSaMgbfRm6DY/2
 +4UYxu+zXYVQaulxhLHwAc9PmPsDQn8uV+4E9zqH6SEdVCgCfLTeXuOih1fddjcIhw9U
 CapnD8ilH+71ALYJVwjVInnuRko7ZO0XrwmCMEI/3whJLwoBegf1G+TuG+K+OCU3K2Ya
 rkmqECJgOzqNLrKAhaH46UB+RMVpSHC1yZzisf52t4N4uTA2U9o2AWaXxJPUtSrYmXI4
 cjCcCmUdmAcHNLpLb8MFO9qwdspa5CXUkMrt0FChWVbD3YDndaJX9tnf0sFryu+RQ6sC
 6i8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=zZuf+KOYd+DAgWvhF7jj4OZN169JdWIOAD9CczBh73c=;
 b=Kv8rJT8UG63JCJgSff6bDczdf/c+xdmqjcl/ISXQlsvECmyMYimE2BXIUXEp8C4IHN
 EcENT/4ezsx0NjX+6JlnrW/aZ4rPfFoVo4WU3Jeag3BCqodP+mMGJTjZQ0OSDagKbcJw
 8MO5L6RumBiFfGcadct92mQzXYl/LPFtDxxP/HhAA/tUYSWaOHbbCedGJG4H750hFRgu
 cykzhe49Aqz74YArw2hRdTP4WP98imAzOZKas4awAz7jcjS918/navXec5T64L5Js/aN
 YYZJx6nHqbjmRBbAoDPDIHTHUXFw5lrqyh72tq8Tl6cqw4k4AVaw9rIhPxx5njoH1PAm
 kD9A==
X-Gm-Message-State: AJIora8xGOmqZBuvYT2CHAWOQQMTG9KjiWSCpPZ3zfFMYC8sPcXE2jPZ
 2Ovjq0eKGb7kMgjaHAkv68Q=
X-Google-Smtp-Source: AGRyM1vF1oEMutMLJ0zpRfm7vo3bg7FF729JrV3BHu15PLlY7kPjnxuiiNdvIQ/ZbPyik7VdGO6qfg==
X-Received: by 2002:a2e:70a:0:b0:255:52d4:1a62 with SMTP id
 10-20020a2e070a000000b0025552d41a62mr1740952ljh.145.1655192214805; 
 Tue, 14 Jun 2022 00:36:54 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 s22-20020a2e9c16000000b002555bfbfd9esm1245145lji.92.2022.06.14.00.36.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jun 2022 00:36:54 -0700 (PDT)
Date: Tue, 14 Jun 2022 10:36:42 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Zack Rusin <zackr@vmware.com>
Subject: Re: [PATCH 0/6] drm: Add mouse cursor hotspot support to atomic KMS
Message-ID: <20220614103642.48003975@eldfell>
In-Reply-To: <b25276d2448f69a5a3eb3b5a69cec7074a821d6d.camel@vmware.com>
References: <20220602154243.1015688-1-zack@kde.org>
 <wRnf-Lm5zz6v1e-NlnFPteyARuLl-R98mOZZVjePHD5ue7QQNR_TSU7RwYBssgUa7xM5hf7Fe59-gMEj81ESrHY3mu_H7yE0dtGhFHFPTnc=@emersion.fr>
 <YqMDoSMOL2rsfJj/@phenom.ffwll.local>
 <YqMH14MEqGZtujfk@phenom.ffwll.local>
 <efacab57ba2105c5b5faa49e85b9f582e0983332.camel@vmware.com>
 <20220613103310.4629f213@eldfell>
 <bcd08cc889e5861d39c115aaf3713ee4152faeca.camel@vmware.com>
 <20220613172511.6b3eac17@eldfell>
 <b25276d2448f69a5a3eb3b5a69cec7074a821d6d.camel@vmware.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.oMD2TzH18+c23t7c_2lZiV";
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

--Sig_/.oMD2TzH18+c23t7c_2lZiV
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 13 Jun 2022 14:54:57 +0000
Zack Rusin <zackr@vmware.com> wrote:

> On Mon, 2022-06-13 at 17:25 +0300, Pekka Paalanen wrote:
> > On Mon, 13 Jun 2022 13:14:48 +0000
> > Zack Rusin <zackr@vmware.com> wrote:
> >  =20
> > > On Mon, 2022-06-13 at 10:33 +0300, Pekka Paalanen wrote: =20
> > > > On Fri, 10 Jun 2022 14:24:01 +0000
> > > > Zack Rusin <zackr@vmware.com> wrote:
> > > >    =20
> > > > > On Fri, 2022-06-10 at 10:59 +0200, Daniel Vetter wrote:   =20
> > > > > > =E2=9A=A0 External Email
> > > > > >=20
> > > > > > On Fri, Jun 10, 2022 at 10:41:05AM +0200, Daniel Vetter wrote: =
    =20
> > > > > > > Hi all,
> > > > > > >=20
> > > > > > > Kinda top post because the thread is sprawling and I think we=
 need a
> > > > > > > summary/restart. I think there's at least 3 issues here:
> > > > > > >=20
> > > > > > > - lack of hotspot property support, which means compositors c=
an't really
> > > > > > >   support hotspot with atomic. Which isn't entirely true, bec=
ause you
> > > > > > >   totally can use atomic for the primary planes/crtcs and the=
 legacy
> > > > > > >   cursor ioctls, but I understand that people might find that=
 a bit silly :-)
> > > > > > >=20
> > > > > > >   Anyway this problme is solved by the patch set here, and I =
think results
> > > > > > >   in some nice cleanups to boot.
> > > > > > >=20
> > > > > > > - the fact that cursors for virtual drivers are not planes, b=
ut really
> > > > > > >   special things. Which just breaks the universal plane kms u=
api. That
> > > > > > >   part isn't solved, and I do agree with Simon and Pekka that=
 we really
> > > > > > >   should solve this before we unleash even more compositors o=
nto the
> > > > > > >   atomic paths of virtual drivers.
> > > > > > >=20
> > > > > > >   I think the simplest solution for this is:
> > > > > > >   1. add a new DRM_PLANE_TYPE_VIRTUAL_CURSOR, and set that fo=
r these
> > > > > > >   special cursor planes on all virtual drivers
> > > > > > >   2. add the new "I understand virtual cursors planes" setpar=
am, filter
> > > > > > >   virtual cursor planes for userspace which doesn't set this =
(like we do
> > > > > > >   right now if userspace doesn't set the universal plane mode)
> > > > > > >   3. backport the above patches to all stable kernels
> > > > > > >   4. make sure the hotspot property is only set on VIRTUAL_CU=
RSOR planes
> > > > > > >   and nothing else in the rebased patch series     =20
> > > > > >=20
> > > > > > Simon also mentioned on irc that these special planes must not =
expose the
> > > > > > CRTC_X/Y property, since that doesn't really do much at all. Or=
 is our
> > > > > > understanding of how this all works for commandeered cursors wr=
ong?     =20
> > > > >=20
> > > > > Yes, that's the part I don't understand. I don't think I see how =
the CRTC_X|Y
> > > > > properties aren't used.
> > > > >=20
> > > > > I think the confusion might stem from the fact that it appears th=
at the
> > > > > hypervisors/hosts are moving that plane, which is not the case. W=
e never move the
> > > > > plane itself, we redirect the mouse focus/movement, that's what's=
 reducing the
> > > > > latency but don't touch drm internals. I can't speak for every vi=
rtualized stack,
> > > > > but what is happening on ours is that we set the image that's on =
the cursor plane as
> > > > > the cursor on the machine that's running the guest. So when you m=
ove the mouse
> > > > > across the screen as you enter the VM window the cursor plane isn=
't touched, but the
> > > > > local machines cursor changes to what's inside the cursor plane. =
When the mouse is
> > > > > clicked the mouse device in the guest generates the event with th=
e proper
> > > > > coordinates (hence we need the hotspot to route that event correc=
tly). That's when
> > > > > the guest reacts just like it would normally on native if a mouse=
 event was
> > > > > received.
> > > > >=20
> > > > > The actual cursor plane might not be visible while this is happen=
ing but even when
> > > > > it's not visible it's still at whatever crtc_x|y the guest thinks=
 it is. crtc_x|y
> > > > > are still only driven by the guests mouse device.
> > > > >=20
> > > > > We control the mouse device and visibility of the cursor plane it=
self based on
> > > > > what's happening in the system but I don't think that's that diff=
erent from a native
> > > > > system.   =20
> > > >=20
> > > > Sorry Zack, while I'm sure that is technically correct and very det=
aily
> > > > accurate, it's totally not any different to what we have been talki=
ng
> > > > about all along.
> > > >=20
> > > > We care about how things look like to the end user, and not what
> > > > property values the guest KMS driver might have for each plane. The=
 KMS
> > > > UAPI contract is about how things look to the end user, not just wh=
at
> > > > values might be stored in a KMS driver (and then ignored).
> > > >=20
> > > > It doesn't matter if the CRTC_X/Y properties remain at what the gue=
st
> > > > userspace set them to, if you are going to hide the "real" virtual
> > > > cursor plane and instead upload the cursor image to the host window
> > > > system to be composited independently. You are breaking the UAPI
> > > > contract. What the end user sees is *not* what the guest OS program=
med.
> > > > That's the whole point.
> > > >=20
> > > > What you described is the very definition of cursor plane commandee=
ring
> > > > as I defined it: showing the cursor image not where the guest OS pu=
t it.
> > > >=20
> > > > I never assumed that you would actually reflect host cursor positio=
n in
> > > > the guest KMS cursor plane CRTC_X/Y. You just ignore those values
> > > > completely in the VM stack levels closer to the end user's eyes in
> > > > seamless mouse mode. The end effect is the same.   =20
> > >=20
> > > But we don't ignore them, we absolutely need them to set the mouse cu=
rsor. This is a
> > > two way process, I think Hans mentioned that, mouse might be "seamles=
s", i.e. it's
> > > the host routing clicks to the guest, or it might be "guest locked", =
also known as
> > > "gaming mouse", in which case it's fully guest routed/controlled. To =
have any idea
> > > where the cursor is we absolutely require the crtc_x|y. =20
> >=20
> > Ok, so seamless mouse mode ignores CRTC_X/Y. This is the commandeered
> > mode.
> >=20
> > The normal non-commandeered mode, or what you seem to call "guest
> > locked" which I guess also includes grabbing the mouse into the VM
> > viewer window in the host/viewer system, requires CRTC_X/Y. That's
> > clear.
> >=20
> > In other words, the VM stack is switching between seamless pointer,
> > normal pointer, and normal pointer with a grab on the VM viewer winsys,
> > right?
> >=20
> > This only means that virtual cursor planes do need CRTC_X/Y properties.
> > That's fine.
> >=20
> > The VM stack is still breaking the KMS UAPI contract if the VM stack
> > enters seamless pointer mode without an explicit approval from the guest
> > userspace. You can't say it's ok to do seamless pointer if you
> > *sometimes* also do normal pointer instead, that's not enough. =20
>=20
> I don't think I ever said that.

I did read that from your replies to the claims that you are ignoring
CRTC_X/Y. It's the impression I got.

Saying that you don't ignore CRTC_X/Y but also implying that you are
not always using them as the cursor image position did not make sense
to me.

> In general I'm not making any philosophical
> argument, all I'm saying is that "virtualized drivers require hotspot
> info". Simon and you are saying that we can't get it until we fix
> other issues with virtualized drivers and I'm simply pointing out
> that your solutions do not work. When we started I did mention that
> this is a lot bigger issue, that's been present for years and will be
> hard to solve, which is why we're off to crazy town right now talking
> about essentially forking kms for virtualized drivers.

The reason I am saying that you need to fix other issues with
virtualized drivers at the same time is because those other issues are
the sole and only reason why the driver would ever need hotspot info.

Hotspot info must not be necessary for correct KMS operation, yet you
seem to insist it is. You assume that cursor plane commandeering is ok
to do. But it is not ok without adding the KMS UAPI that would allow
it: a way for guest userspace to explicitly say that commandeering will
be ok.

If and only if guest userspace says commandeering is ok, then you can
require hotspot info. On the other hand, you cannot retrofit hotspot
info by saying that if a driver exposes hotspot properties then all KMS
clients must set them. That would be a kernel regression by definition:
KMS clients that used to abide the KMS UAPI contract are suddenly
breaking the contract because the kernel changed the contract.

Therefore I very much disagree that virtualized drivers need hotspot
info. They do not strictly need hotspot info for correct operation,
they need it only for making the user experience more smooth, which is
an optional optimization. That optimization may be very important in
practise, but it's still an optimization and is generally not expected
by KMS clients.

I have not understood yet why our proposed solutions do not work. You
keep saying they don't work, but how do they not work?

It is exactly that forking of KMS that I do not want. Hence we need
explicit approval from KMS clients that doing those tricks you want to
do will be ok. If you do those tricks without explicit KMS client
approval, then you have forked KMS: we have two kinds of drivers, they
behave differently, and there is no way for userspace to know which way
they behave, aside for special-casing by driver name, which would be a
maintenance nightmare.

I would not want virtualized drivers to do any of those tricks to begin
with, at all, because that's not what KMS is designed for. But I have
already given in to the idea of the use case (seamless pointer mode)
that requires hotspot info, so I am not fighting against that.

> I thought the solution consisting of an addition of a
> DRM_CLIENT_CAP_VIRTUAL_CURSOR_AWARE flag and hiding the cursor plane in v=
irtualized
> drivers for clients that advertise DRM_CLIENT_CAP_ATOMIC but not
> DRM_CLIENT_CAP_VIRTUAL_CURSOR_AWARE was simple enough and enough to get w=
eston using
> software cursors while having a clear path for gnome-shell and kwin to us=
e atomic
> with virtualized drivers without rewriting them. If we can't agree on tha=
t then, at
> this point, it might be better if we just schedule an irc and/or video co=
nference
> with all interested parties to figure this out.

I thought we already agreed on that. I think it's a fine plan from
userspace perspective, and it's along the lines of what Daniel Vetter
wrote which I agreed to.

I don't care if there is cursor plane not being exposed or yes being
exposed. I only care that if a cursor plane is exposed, and it is used
by a KMS client, and the KMS client does not explicitly indicate that
commandeering is ok, then commandeering cannot happen.


Thanks,
pq

--Sig_/.oMD2TzH18+c23t7c_2lZiV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmKoOooACgkQI1/ltBGq
qqdbEA/8DteZ9eVeoJQUXq9EnfKLix3xXXP+CzUPREhbHqgE4faCL6kXXHMnaiXS
WM6CyGErGn3eBJ3vI7bU3DVMoVqMLLo2K+1Mkkt/aP89Zi0tiUi6RDGc2Pw0l+kj
qQLYR0dNdX3irVenJl0JJArjFD8wu5G0NF1CItvS0+OGI//ynCl8tBtCoXVKccmu
CUZY31z6ti9z1pbwQPbjfWTukpCAnUqV3j/c7Bxsl3mz/5LvCWUqzjmn8f+fCqoJ
ZYGu5Ab52Lu2IN/BXLZUEmhAuslNPJSk3R25hjiaGMQP9stexjbsHS80DjDxPahY
+PZyzwNVawXLdfu4SWwxYoIlciY10P7IY9tFrLsz3Mu8dHpBiI1jwMgVjWFEXtxY
mVYKSZ049DJ3elkWJsWnmWBaoiKnqwYGQgVj2Vvb/eHukV1bwQm3QubBB/kF0yny
+pXj6Yj5PH2/73H1qMnM1vJVZ/ooeNAzQ5rep8FiUweAtmXg4jlu+iRFKlVep62P
2h3Zej+YvLkrJRxXYlsQpBxq76D0gQUVxyULTJfdSNYKfC56zorjxeY4nWq5hoEd
hU1n+trgbeyH/VyS4Ll84ILlhKuBIt3mQhMbC7Sth+Pg0NSFmQWOqyrpyUEok6o4
1xDOJHxIaLGjiXDLQlQUt5dJvhqtwqu+7mKU2bQv0KaGQCdDmW8=
=qpjx
-----END PGP SIGNATURE-----

--Sig_/.oMD2TzH18+c23t7c_2lZiV--
