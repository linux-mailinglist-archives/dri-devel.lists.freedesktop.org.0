Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B189F5485AF
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 16:25:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 037F610E78A;
	Mon, 13 Jun 2022 14:25:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F6A410E78A;
 Mon, 13 Jun 2022 14:25:24 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id g2so6392415ljk.5;
 Mon, 13 Jun 2022 07:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=u2V/RmVdHoaW/Wuv/kT74I+sOJaoDxDE7B7E1xiN3c4=;
 b=qWaSn6YtyHM82ldp/WkOlTKQ96cS0zFDqbHy5VB/txEAQ7xRxbCGAM0QdzEYv6HFD6
 +7Sf6ok1xDsuhjWu9/637mRUO1VWEjpXXRb4UJra5xcYk/YDXaj/CpYRM9dcbHs3d4ya
 RNMx9KGeAt0Yd9aAk6yPZr1+KRota2dLI75Nor4Wx1wJSxEmydjs0eU2sqyH9sr7JcNX
 JUOfR7ZxBHdoDx+YdSZhhyM5l+O1vq0JmK0kbciQpPGjy88Io6hxw7oVYZ1SQQ+a2F2k
 Mw3+h8Y+8UXlqOXJ4j4gPIKT5EnSvB1gtuqzeFTaUu4i9lchuTYE9ZbLJ6ZauJvDXGZY
 roiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=u2V/RmVdHoaW/Wuv/kT74I+sOJaoDxDE7B7E1xiN3c4=;
 b=cWG7/k5qQVUBUjhwvPgxkVWDkP+5lIYiunjL7lthHL7AzQo5g9AZw8gzw3JTiojiv5
 ve8JlJZf2LlKM9Ap7KJ6hEQlVQGWM9NB6cGZ8w2p8TKrBLLQWOzDRFUzCsMn4omRtY5S
 U9UXvdmT/77uhE5MdZ4gZJDjMaAAiJDItQm61BWbfPWVH1Ql+VIdbQBzxx1bFTQ1/vmU
 jQNmoaj3ZyONRjl/rgzyrKCDSCvIyvOByG+JMhvq5dDJmxv/+1CRsja8+wXUX5bZ4wvL
 Vm6tWTlPs8l4x+OGVZRnFDNIA6JxzjS2uwzCuBBrDkuHqwcdffcx+EHTLQkpwOtJRFkd
 qOVg==
X-Gm-Message-State: AOAM530vvk5x1fVFHekDSyXgcNZyoVptse4+OKmImoJRdvcLymokzVrI
 P1v2mTciH2QTf7Rqye784/8=
X-Google-Smtp-Source: ABdhPJzW0GMkkL9vA9woUFuwjaDKyhIrfzzmcHHJl5aVCvbI/6+p9gNvOvxVqwVbT25qQGpLzp0Llg==
X-Received: by 2002:a2e:740c:0:b0:255:5ce8:2bc2 with SMTP id
 p12-20020a2e740c000000b002555ce82bc2mr34686952ljc.61.1655130322661; 
 Mon, 13 Jun 2022 07:25:22 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 m7-20020ac24ac7000000b00479543652a6sm1005136lfp.128.2022.06.13.07.25.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 07:25:22 -0700 (PDT)
Date: Mon, 13 Jun 2022 17:25:11 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Zack Rusin <zackr@vmware.com>
Subject: Re: [PATCH 0/6] drm: Add mouse cursor hotspot support to atomic KMS
Message-ID: <20220613172511.6b3eac17@eldfell>
In-Reply-To: <bcd08cc889e5861d39c115aaf3713ee4152faeca.camel@vmware.com>
References: <20220602154243.1015688-1-zack@kde.org>
 <wRnf-Lm5zz6v1e-NlnFPteyARuLl-R98mOZZVjePHD5ue7QQNR_TSU7RwYBssgUa7xM5hf7Fe59-gMEj81ESrHY3mu_H7yE0dtGhFHFPTnc=@emersion.fr>
 <YqMDoSMOL2rsfJj/@phenom.ffwll.local>
 <YqMH14MEqGZtujfk@phenom.ffwll.local>
 <efacab57ba2105c5b5faa49e85b9f582e0983332.camel@vmware.com>
 <20220613103310.4629f213@eldfell>
 <bcd08cc889e5861d39c115aaf3713ee4152faeca.camel@vmware.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3Dba.8.lVcLoXMNFyRNfd2z";
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

--Sig_/3Dba.8.lVcLoXMNFyRNfd2z
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 13 Jun 2022 13:14:48 +0000
Zack Rusin <zackr@vmware.com> wrote:

> On Mon, 2022-06-13 at 10:33 +0300, Pekka Paalanen wrote:
> > On Fri, 10 Jun 2022 14:24:01 +0000
> > Zack Rusin <zackr@vmware.com> wrote:
> >  =20
> > > On Fri, 2022-06-10 at 10:59 +0200, Daniel Vetter wrote: =20
> > > > =E2=9A=A0 External Email
> > > >=20
> > > > On Fri, Jun 10, 2022 at 10:41:05AM +0200, Daniel Vetter wrote:   =20
> > > > > Hi all,
> > > > >=20
> > > > > Kinda top post because the thread is sprawling and I think we nee=
d a
> > > > > summary/restart. I think there's at least 3 issues here:
> > > > >=20
> > > > > - lack of hotspot property support, which means compositors can't=
 really
> > > > >   support hotspot with atomic. Which isn't entirely true, because=
 you
> > > > >   totally can use atomic for the primary planes/crtcs and the leg=
acy
> > > > >   cursor ioctls, but I understand that people might find that a b=
it silly :-)
> > > > >=20
> > > > >   Anyway this problme is solved by the patch set here, and I thin=
k results
> > > > >   in some nice cleanups to boot.
> > > > >=20
> > > > > - the fact that cursors for virtual drivers are not planes, but r=
eally
> > > > >   special things. Which just breaks the universal plane kms uapi.=
 That
> > > > >   part isn't solved, and I do agree with Simon and Pekka that we =
really
> > > > >   should solve this before we unleash even more compositors onto =
the
> > > > >   atomic paths of virtual drivers.
> > > > >=20
> > > > >   I think the simplest solution for this is:
> > > > >   1. add a new DRM_PLANE_TYPE_VIRTUAL_CURSOR, and set that for th=
ese
> > > > >   special cursor planes on all virtual drivers
> > > > >   2. add the new "I understand virtual cursors planes" setparam, =
filter
> > > > >   virtual cursor planes for userspace which doesn't set this (lik=
e we do
> > > > >   right now if userspace doesn't set the universal plane mode)
> > > > >   3. backport the above patches to all stable kernels
> > > > >   4. make sure the hotspot property is only set on VIRTUAL_CURSOR=
 planes
> > > > >   and nothing else in the rebased patch series   =20
> > > >=20
> > > > Simon also mentioned on irc that these special planes must not expo=
se the
> > > > CRTC_X/Y property, since that doesn't really do much at all. Or is =
our
> > > > understanding of how this all works for commandeered cursors wrong?=
   =20
> > >=20
> > > Yes, that's the part I don't understand. I don't think I see how the =
CRTC_X|Y
> > > properties aren't used.
> > >=20
> > > I think the confusion might stem from the fact that it appears that t=
he
> > > hypervisors/hosts are moving that plane, which is not the case. We ne=
ver move the
> > > plane itself, we redirect the mouse focus/movement, that's what's red=
ucing the
> > > latency but don't touch drm internals. I can't speak for every virtua=
lized stack,
> > > but what is happening on ours is that we set the image that's on the =
cursor plane as
> > > the cursor on the machine that's running the guest. So when you move =
the mouse
> > > across the screen as you enter the VM window the cursor plane isn't t=
ouched, but the
> > > local machines cursor changes to what's inside the cursor plane. When=
 the mouse is
> > > clicked the mouse device in the guest generates the event with the pr=
oper
> > > coordinates (hence we need the hotspot to route that event correctly)=
. That's when
> > > the guest reacts just like it would normally on native if a mouse eve=
nt was
> > > received.
> > >=20
> > > The actual cursor plane might not be visible while this is happening =
but even when
> > > it's not visible it's still at whatever crtc_x|y the guest thinks it =
is. crtc_x|y
> > > are still only driven by the guests mouse device.
> > >=20
> > > We control the mouse device and visibility of the cursor plane itself=
 based on
> > > what's happening in the system but I don't think that's that differen=
t from a native
> > > system. =20
> >=20
> > Sorry Zack, while I'm sure that is technically correct and very detaily
> > accurate, it's totally not any different to what we have been talking
> > about all along.
> >=20
> > We care about how things look like to the end user, and not what
> > property values the guest KMS driver might have for each plane. The KMS
> > UAPI contract is about how things look to the end user, not just what
> > values might be stored in a KMS driver (and then ignored).
> >=20
> > It doesn't matter if the CRTC_X/Y properties remain at what the guest
> > userspace set them to, if you are going to hide the "real" virtual
> > cursor plane and instead upload the cursor image to the host window
> > system to be composited independently. You are breaking the UAPI
> > contract. What the end user sees is *not* what the guest OS programmed.
> > That's the whole point.
> >=20
> > What you described is the very definition of cursor plane commandeering
> > as I defined it: showing the cursor image not where the guest OS put it.
> >=20
> > I never assumed that you would actually reflect host cursor position in
> > the guest KMS cursor plane CRTC_X/Y. You just ignore those values
> > completely in the VM stack levels closer to the end user's eyes in
> > seamless mouse mode. The end effect is the same. =20
>=20
> But we don't ignore them, we absolutely need them to set the mouse cursor=
. This is a
> two way process, I think Hans mentioned that, mouse might be "seamless", =
i.e. it's
> the host routing clicks to the guest, or it might be "guest locked", also=
 known as
> "gaming mouse", in which case it's fully guest routed/controlled. To have=
 any idea
> where the cursor is we absolutely require the crtc_x|y.

Ok, so seamless mouse mode ignores CRTC_X/Y. This is the commandeered
mode.

The normal non-commandeered mode, or what you seem to call "guest
locked" which I guess also includes grabbing the mouse into the VM
viewer window in the host/viewer system, requires CRTC_X/Y. That's
clear.

In other words, the VM stack is switching between seamless pointer,
normal pointer, and normal pointer with a grab on the VM viewer winsys,
right?

This only means that virtual cursor planes do need CRTC_X/Y properties.
That's fine.

The VM stack is still breaking the KMS UAPI contract if the VM stack
enters seamless pointer mode without an explicit approval from the guest
userspace. You can't say it's ok to do seamless pointer if you
*sometimes* also do normal pointer instead, that's not enough.


Thanks,
pq

--Sig_/3Dba.8.lVcLoXMNFyRNfd2z
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmKnSMgACgkQI1/ltBGq
qqeV2xAAj9TA9feEFoabovmB5g5WIQysP7TizSrMv9IFaunfi8uZGC/0ABIO1VaO
98/I9aOQmexyLbPgmQKcQ/OMY4JcsKu6xIu2x/8OfZRsDkhJwoHjIKZzvWknWzrs
0eWAg4RzzzF+fC2z/MDK0Pd7o4ktgHfDNKLUYQZA/uh8TpNAaItNLy1Uyjxt2yqr
oxbY2RBT4fk7vDPGn6Wya6sDkCDArMAWnfJ8RodbFBDUdVtI6stnNxN1tGo6yW+z
DFNCajlwurEeOMK+AivLpdnQ6DkxlRnw17/sCl1Y1Dl2l6EDhOVsDFXfrg6ChBGz
KYfPL7seb0ooWyzv4d2xQeOhAZK6KBs/xtKdc9X5pt3W8o0TzoDWPG2e+HjhrOGV
mBrcW/JF8wlRhFpGL0eFPe7ZfXfzUbUYddFBZI8ufa7HVHoGoVXO0TVWgpuF5KBi
ZdmUs6jVTmWAnka/HJySNnjJM3N+wpQGGJxFPSMQhEdmqy7zgwy/n11R1cV7y543
QRYdueygvf/fNwb4k/e8mqOjotDR1Pa2FjCZIhlhbzrFP3HtNLjYVQuTAGv4p7AF
iZ/Fn9fUmA/B+57ORQ3UhIZVrbBVRVF63OmlVi8n9uvltB2jbjR424/syPBhtiqE
3Bd3omLM0BX9HI1OBUAFtkKTH3wqCdxGvFx5i6/0pDMBwqrpc3A=
=ExJb
-----END PGP SIGNATURE-----

--Sig_/3Dba.8.lVcLoXMNFyRNfd2z--
