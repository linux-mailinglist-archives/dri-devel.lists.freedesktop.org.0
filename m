Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0790D548088
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 09:33:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B567610EE86;
	Mon, 13 Jun 2022 07:33:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7FCD10EE79;
 Mon, 13 Jun 2022 07:33:23 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id e4so5248062ljl.1;
 Mon, 13 Jun 2022 00:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=d2MWFr68E8R5m6FIODzkBcHpM+C8EWSxAs2T6SkKDEc=;
 b=FJJ4GotZv7NFp2wbngxGvhrusMC3rQpexTTuSAiJ1hMZsj87Zt1Dh02VTKUDvHwRXZ
 avxm18l4D2tigrs4talut982sS5rwNJ9CWolvZ6rdtn7RF6xWus3u2G2h5a+c5fsCKX2
 lY1dP+cu2I9bXIFxzedqUuS51TuGPleBpI+bH0oa4Ab8P1YvKVOo22G9uVOWU03fri7s
 qsbsTZncPcCHdC3duIczRDgvvNHPkbMFId3VRI1mi1mmJVmn1BPXAZtEGwY5S6CLTH7r
 E2uyPyd1cKf+9WveeHVwGZGhOEOixuDEVLFp3tH6DIGsBRNh3JvVxWbRcuI3LTlWbIDU
 xnpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=d2MWFr68E8R5m6FIODzkBcHpM+C8EWSxAs2T6SkKDEc=;
 b=eLSphBolWiM5/uw9Gi2UyQ1fKQajBWS/e1L1ibZhpQWwLcnUp+EuumQiqt3S667vW0
 ZRzxOmv8CiBJT5AM3SkddfazMmeg1pgi9wW5HyBLCRd5j60h2wqJsVJsoA6GlQEM5qfb
 e9jWeExekbVC8elj9LITNez0MkcGMdmkgnW5lyWdt8N5SSh2qRDQyNn+c5YGfzEZwcCI
 kA5bm8Bj841FOfGMaPgpZUm9oOHk6l/Ob0TBLDRzhP/kTGg7dltvQHSE5y1uPRj6KilT
 e5HV6sHN/GGvWj1y+BJQvE5dkzt2+8WUu4bH0fEiJDfet6awYoJbyKKxBNcJ8DWAPIBc
 1Imw==
X-Gm-Message-State: AOAM531XCkKxefIGcUk44mRq5VRuYC/XW84IBMPNNDakG0KP8Zm3fyCc
 8u9txl8uwuOVzJO062leZv8=
X-Google-Smtp-Source: ABdhPJypPHmn1yFGIiTQfZw0uGIW41lUP8oUdHIkzN65It8ZwsagILwwOH4VXhBIIFrUnAfEXDI+yw==
X-Received: by 2002:a2e:954e:0:b0:255:3768:9986 with SMTP id
 t14-20020a2e954e000000b0025537689986mr47265978ljh.516.1655105601671; 
 Mon, 13 Jun 2022 00:33:21 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 v13-20020a056512348d00b0047255d21141sm885145lfr.112.2022.06.13.00.33.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 00:33:21 -0700 (PDT)
Date: Mon, 13 Jun 2022 10:33:10 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Zack Rusin <zackr@vmware.com>
Subject: Re: [PATCH 0/6] drm: Add mouse cursor hotspot support to atomic KMS
Message-ID: <20220613103310.4629f213@eldfell>
In-Reply-To: <efacab57ba2105c5b5faa49e85b9f582e0983332.camel@vmware.com>
References: <20220602154243.1015688-1-zack@kde.org>
 <wRnf-Lm5zz6v1e-NlnFPteyARuLl-R98mOZZVjePHD5ue7QQNR_TSU7RwYBssgUa7xM5hf7Fe59-gMEj81ESrHY3mu_H7yE0dtGhFHFPTnc=@emersion.fr>
 <YqMDoSMOL2rsfJj/@phenom.ffwll.local>
 <YqMH14MEqGZtujfk@phenom.ffwll.local>
 <efacab57ba2105c5b5faa49e85b9f582e0983332.camel@vmware.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/snE1F5y3ZdctI8liljdNgCU";
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
Cc: "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "hdegoede@redhat.com" <hdegoede@redhat.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "gurchetansingh@chromium.org" <gurchetansingh@chromium.org>,
 Martin Krastev <krastevm@vmware.com>, "kraxel@redhat.com" <kraxel@redhat.com>,
 "wayland-devel@lists.freedesktop.org" <wayland-devel@lists.freedesktop.org>,
 Maaz Mombasawala <mombasawalam@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/snE1F5y3ZdctI8liljdNgCU
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 10 Jun 2022 14:24:01 +0000
Zack Rusin <zackr@vmware.com> wrote:

> On Fri, 2022-06-10 at 10:59 +0200, Daniel Vetter wrote:
> > =E2=9A=A0 External Email
> >=20
> > On Fri, Jun 10, 2022 at 10:41:05AM +0200, Daniel Vetter wrote: =20
> > > Hi all,
> > >=20
> > > Kinda top post because the thread is sprawling and I think we need a
> > > summary/restart. I think there's at least 3 issues here:
> > >=20
> > > - lack of hotspot property support, which means compositors can't rea=
lly
> > >   support hotspot with atomic. Which isn't entirely true, because you
> > >   totally can use atomic for the primary planes/crtcs and the legacy
> > >   cursor ioctls, but I understand that people might find that a bit s=
illy :-)
> > >=20
> > >   Anyway this problme is solved by the patch set here, and I think re=
sults
> > >   in some nice cleanups to boot.
> > >=20
> > > - the fact that cursors for virtual drivers are not planes, but really
> > >   special things. Which just breaks the universal plane kms uapi. That
> > >   part isn't solved, and I do agree with Simon and Pekka that we real=
ly
> > >   should solve this before we unleash even more compositors onto the
> > >   atomic paths of virtual drivers.
> > >=20
> > >   I think the simplest solution for this is:
> > >   1. add a new DRM_PLANE_TYPE_VIRTUAL_CURSOR, and set that for these
> > >   special cursor planes on all virtual drivers
> > >   2. add the new "I understand virtual cursors planes" setparam, filt=
er
> > >   virtual cursor planes for userspace which doesn't set this (like we=
 do
> > >   right now if userspace doesn't set the universal plane mode)
> > >   3. backport the above patches to all stable kernels
> > >   4. make sure the hotspot property is only set on VIRTUAL_CURSOR pla=
nes
> > >   and nothing else in the rebased patch series =20
> >=20
> > Simon also mentioned on irc that these special planes must not expose t=
he
> > CRTC_X/Y property, since that doesn't really do much at all. Or is our
> > understanding of how this all works for commandeered cursors wrong? =20
>=20
> Yes, that's the part I don't understand. I don't think I see how the CRTC=
_X|Y
> properties aren't used.
>=20
> I think the confusion might stem from the fact that it appears that the
> hypervisors/hosts are moving that plane, which is not the case. We never =
move the
> plane itself, we redirect the mouse focus/movement, that's what's reducin=
g the
> latency but don't touch drm internals. I can't speak for every virtualize=
d stack,
> but what is happening on ours is that we set the image that's on the curs=
or plane as
> the cursor on the machine that's running the guest. So when you move the =
mouse
> across the screen as you enter the VM window the cursor plane isn't touch=
ed, but the
> local machines cursor changes to what's inside the cursor plane. When the=
 mouse is
> clicked the mouse device in the guest generates the event with the proper
> coordinates (hence we need the hotspot to route that event correctly). Th=
at's when
> the guest reacts just like it would normally on native if a mouse event w=
as
> received.
>=20
> The actual cursor plane might not be visible while this is happening but =
even when
> it's not visible it's still at whatever crtc_x|y the guest thinks it is. =
crtc_x|y
> are still only driven by the guests mouse device.
>=20
> We control the mouse device and visibility of the cursor plane itself bas=
ed on
> what's happening in the system but I don't think that's that different fr=
om a native
> system.

Sorry Zack, while I'm sure that is technically correct and very detaily
accurate, it's totally not any different to what we have been talking
about all along.

We care about how things look like to the end user, and not what
property values the guest KMS driver might have for each plane. The KMS
UAPI contract is about how things look to the end user, not just what
values might be stored in a KMS driver (and then ignored).

It doesn't matter if the CRTC_X/Y properties remain at what the guest
userspace set them to, if you are going to hide the "real" virtual
cursor plane and instead upload the cursor image to the host window
system to be composited independently. You are breaking the UAPI
contract. What the end user sees is *not* what the guest OS programmed.
That's the whole point.

What you described is the very definition of cursor plane commandeering
as I defined it: showing the cursor image not where the guest OS put it.

I never assumed that you would actually reflect host cursor position in
the guest KMS cursor plane CRTC_X/Y. You just ignore those values
completely in the VM stack levels closer to the end user's eyes in
seamless mouse mode. The end effect is the same.

> This is easy to see by running the "weston-simple-damage --width=3D64 --h=
eight=3D64" if
> you click on that window and move the cursor to the very edge of the virt=
ualized
> window you'll notice that it's coming out outside of the window, that's b=
ecause it's
> the local machines cursor, but if you stop the press the window will jump=
 to
> wherever it was because the real guest plane is still at crtc_x|y (and be=
cause in
> weston that window doesn't react to mouse move events like a cursor would=
 it never
> sets crtc_x|y to the mouse directed coordinates).=C2=A0
>=20
> The problem stems from the fact that the cursor plane has something that'=
s not a
> cursor and doesn't react to mouse events like a cursor would. So the flag=
 (or new
> plane) that we'd be adding is simply making user-space give the following=
 promise:
>=20
> "I understand that what's inside the cursor plane needs to react and deal=
 with mouse
> events like a mouse cursor would, i.e. it should be a mouse cursor"

Correct.

Without such explicit promise from guest userspace you cannot activate
seamless mouse mode at all.


Thanks,
pq

--Sig_/snE1F5y3ZdctI8liljdNgCU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmKm6DYACgkQI1/ltBGq
qqdqfRAApDZ9Bp6yF5MWN1zIq7yVZKfOH9CZB5SoNI3mHELGgcF6pO98JrqDLtIY
8S9DD7h1bU6Wg7Dg767hNMSfvlocHzbybzUzmTLBPMnQzSP9NUHPvNOqotRdWJqG
14KT9N0LNqp0UkVNBEWb2I69V8xY/HdLqXm0N5+AjzdU7Ev98L5xVHHbyNCAdg9E
bTJ/vmDv31ogO6TFz7H+/43lbMGFiQP0MSY0p94yAp+rn0eP7PS7T6z9y49C32QB
Yw7XYGRNlmMyRaKaulLWkIZSnrG3kynXLQz6oqR5+Uf4aq04XJha2aLKh7/QcaJ5
jgBOM91weU/0+CLy/scL1EepWESch7FRIa8l3IrsR+xErAHdvlhUv0jr/CD5BQFE
FriA87uTbBS2l4x7RYAIXlUW9WOWSFVMLusHU2yS3AoS6SJJDGFXjKPJJNyULmTJ
YXJSz2fCwQ0zdA0d1893a9exZj0kcg3iYBVpjO71SLdFp8YC9U4Dh4Mt9hl/POsx
LmyExA0oT9B5k/EUUoe3Pr7CV1M7oYKwQrTBfOphON+OMxKG2kJTr/fJeF7NtSCv
P9K1JNTwThADx7YOVW9gasFX2W0E7eemMd7gykkhqhfGOwNcVOwaR9r4876N0g/8
EtTuY4mtciW7IqyYG5GEIdD/1cmPV6ZesOID0DGcp7L1if8WaU0=
=AlrH
-----END PGP SIGNATURE-----

--Sig_/snE1F5y3ZdctI8liljdNgCU--
