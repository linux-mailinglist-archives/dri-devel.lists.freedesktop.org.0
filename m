Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B368244ABB
	for <lists+dri-devel@lfdr.de>; Fri, 14 Aug 2020 15:40:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D0556EB4E;
	Fri, 14 Aug 2020 13:40:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72517882B5
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 13:40:42 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id a14so8397216wra.5
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 06:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=OegCYW5raVa3CT76RE9goyk5TLCVrSAr7XzD9SbXb0Y=;
 b=u3/VeROtIFukIROK8qBDEPIMe4p34A221g5XKXbwEN5bKvUzBsApRlvcv16e1j9gHd
 2BR5cL8cmcQ0k5XBKQzgDzKLbhccqqSn0LTwSQVvgmYu3+oDVVt2eSNtuLysm5MWqA2S
 eIsjxWWjRlvwlMqKz5lPa0OnVNBX+HjIl3oTHCbzA2YdwlEycvy0+vYf0UkqizFP8ZGq
 HdHhe6KP+3Z/M/MjUI7ymYdNFIF3zPZ2vK2rnO180z/4hyYDfNao1lzqs5i0nk01ituQ
 lIv4ITQgSIR87JdBiUpRJrfrY7Rp3zOIGHwUowXNEn+Hp8cERkR5sBnsAQQKyHewOJ6A
 JrxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=OegCYW5raVa3CT76RE9goyk5TLCVrSAr7XzD9SbXb0Y=;
 b=d6NPDOELoCNvjcpqqLRZMQ9KWPm0RfN4giMK4OcfDaEmckETuAg2PE3JG29ccYfwMi
 rUyIvpzlhRfE3EC6E1dDZ2V7mQHI1QFKkFklffdKJQdJw0TA3fnS3tAWI20Qg6foVzf9
 fulTKxeWl+yPzhY3JWzVcpiRelYzmcoRaJb9rpaWAfk1bHjReETb3BjMvQdc+uMVKRU0
 m3pAIFOioCvKVwrezHL/jiIAYlaojj/mtOVUCHUn/AUGRrEXTp2PMRTguPowCnhKcZql
 CFyap29tojQDSVhyqV4Hpy/JXJsLUM0rdy0mp+x+zCYimHezzp3cLkTVprbV3Ye5nPeI
 jZMg==
X-Gm-Message-State: AOAM531eJw7e4jY98nPPZKmtFAqsK4w0UaJgLlP0kbbEiFYHMPXOXAyZ
 f6FLVbHLUAMOv3jG7Vt5bjo=
X-Google-Smtp-Source: ABdhPJxQjrQIaOAxRqF51ChpcVBHRX7dxhWnh4Dqo9kQnnm6ElkBpMB1vziWn6Qq30vSx+gs5WjRow==
X-Received: by 2002:adf:e8ca:: with SMTP id k10mr2788707wrn.110.1597412440437; 
 Fri, 14 Aug 2020 06:40:40 -0700 (PDT)
Received: from localhost
 (p200300e41f10ca00f451c56750ebc625.dip0.t-ipconnect.de.
 [2003:e4:1f10:ca00:f451:c567:50eb:c625])
 by smtp.gmail.com with ESMTPSA id k10sm16259186wrm.74.2020.08.14.06.40.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Aug 2020 06:40:39 -0700 (PDT)
Date: Fri, 14 Aug 2020 15:40:38 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: James Jones <jajones@nvidia.com>
Subject: Re: [git pull] drm for 5.8-rc1
Message-ID: <20200814134038.GA556087@ulmo>
References: <CAKMK7uG8x4dHrRnzK9FFrJbtWsdLk+TTObK9r-nSncKowHVe3A@mail.gmail.com>
 <CAPM=9twK34VyR2kwiR1jzxqys1Bng2Vt8FY6aQTvCe2GL0Zopg@mail.gmail.com>
 <261cd7c9-6853-3d5f-3a3e-86b65c9dba71@nvidia.com>
 <CACO55ttJwjh2HZsygwqA7HUeF5UMuP0=Y9RyZU=UJsf-gWGagA@mail.gmail.com>
 <ad64c242-95f3-d346-87f3-a9ac149dc3a2@nvidia.com>
 <CACO55tt81q3VwpEmz9wxeUzWGPLXA1XPj8ZgxhuELUBPDpX1PA@mail.gmail.com>
 <CACO55ts2AHgDNZKBvoU8NZf26V8BJDGkKiapY=1xaUQ1DrC8SA@mail.gmail.com>
 <CACO55tvF0dOQ=myUpccmfHc+hCVQZoXQnCA0iHeXQo3B=UaD0Q@mail.gmail.com>
 <CAKb7UviVa32hWv+y+_kwbZzkJAxKcWr1RPCgkGt-mi=uayUKyw@mail.gmail.com>
 <0e882aa7-d0ea-19b0-a13d-4f7bc0d384aa@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <0e882aa7-d0ea-19b0-a13d-4f7bc0d384aa@nvidia.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <treding@nvidia.com>, Karol Herbst <kherbst@redhat.com>
Content-Type: multipart/mixed; boundary="===============0348110940=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0348110940==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3MwIy2ne0vdjdPXF"
Content-Disposition: inline


--3MwIy2ne0vdjdPXF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 12, 2020 at 10:03:46AM -0700, James Jones wrote:
> On 8/12/20 5:37 AM, Ilia Mirkin wrote:
> > On Wed, Aug 12, 2020 at 8:24 AM Karol Herbst <kherbst@redhat.com> wrote:
> > >=20
> > > On Wed, Aug 12, 2020 at 12:43 PM Karol Herbst <kherbst@redhat.com> wr=
ote:
> > > >=20
> > > > On Wed, Aug 12, 2020 at 12:27 PM Karol Herbst <kherbst@redhat.com> =
wrote:
> > > > >=20
> > > > > On Wed, Aug 12, 2020 at 2:19 AM James Jones <jajones@nvidia.com> =
wrote:
> > > > > >=20
> > > > > > Sorry for the slow reply here as well.  I've been in the proces=
s of
> > > > > > rebasing and reworking the userspace patches.  I'm not clear my=
 changes
> > > > > > will address the Jetson Nano issue, but if you'd like to try th=
em, the
> > > > > > latest userspace changes are available here:
> > > > > >=20
> > > > > >     https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/3=
724
> > > > > >=20
> > > > > > And the tegra-drm kernel patches are here:
> > > > > >=20
> > > > > >=20
> > > > > > https://patchwork.ozlabs.org/project/linux-tegra/patch/20191217=
005205.2573-1-jajones@nvidia.com/
> > > > > >=20
> > > > > > Those + the kernel changes addressed in this thread are everyth=
ing I had
> > > > > > outstanding.
> > > > > >=20
> > > > >=20
> > > > > I don't know if that's caused by your changes or not, but now the
> > > > > assert I hit is a different one pointing out that
> > > > > nvc0_miptree_select_best_modifier fails in a certain case and ret=
urns
> > > > > MOD_INVALID... anyway, it seems like with your patches applied it=
's
> > > > > now way easier to debug and figure out what's going wrong, so may=
be I
> > > > > can figure it out now :)
> > > > >=20
> > > >=20
> > > > collected some information which might help to track it down.
> > > >=20
> > > > src/gallium/frontends/dri/dri2.c:648 is the assert hit: assert(*zsb=
uf)
> > > >=20
> > > > templ is {reference =3D {count =3D 0}, width0 =3D 300, height0 =3D =
300, depth0
> > > > =3D 1, array_size =3D 1, format =3D PIPE_FORMAT_Z24X8_UNORM, target=
 =3D
> > > > PIPE_TEXTURE_2D, last_level =3D 0, nr_samples =3D 0, nr_storage_sam=
ples =3D
> > > > 0, usage =3D 0, bind =3D 1, flags =3D 0, next =3D 0x0, screen =3D 0=
x0}
> > > >=20
> > > > inside tegra_screen_resource_create modifier says
> > > > DRM_FORMAT_MOD_INVALID as template->bind is 1
> > > >=20
> > > > and nvc0_miptree_select_best_modifier returns DRM_FORMAT_MOD_INVALI=
D,
> > > > so the call just returns NULL leading to the assert.
> > > >=20
> > > > Btw, this is on Xorg-1.20.8-1.fc32.aarch64 with glxgears.
> > > >=20
> > >=20
> > > So I digged a bit deeper and here is what tripps it of:
> > >=20
> > > when the context gets made current, the normal framebuffer validation
> > > and render buffer allocation is done, but we end up inside
> > > tegra_screen_resource_create at some point with PIPE_BIND_SCANOUT set
> > > in template->bind. Now the tegra driver forces the
> > > DRM_FORMAT_MOD_LINEAR modifier and calls into
> > > resource_create_with_modifiers.
> > >=20
> > > If it wouldn't do that, nouveau would allocate a tiled buffer, with
> > > that it's linear and we at some point end up with an assert about a
> > > depth_stencil buffer being there even though it shouldn't. If I always
> > > use DRM_FORMAT_MOD_INVALID in tegra_screen_resource_create, things
> > > just work.
> > >=20
> > > That's kind of the cause I pinpointed the issue down to. But I have no
> > > idea what's supposed to happen and what the actual bug is.
> >=20
> > Yeah, the bug with tegra has always been "trying to render to linear
> > color + tiled depth", which the hardware plain doesn't support. (And
> > linear depth isn't a thing.)
> >=20
> > Question is whether what it's doing necessary. PIPE_BIND_SCANOUT
> > (/linear) requirements are needed for DRI2 to work (well, maybe not in
> > theory, but at least in practice the nouveau ddx expects linear
> > buffers). However tegra operates on a more DRI3-like basis, so with
> > "client" allocations, tiled should work OK as long as there's
> > something in tegra to copy it to linear when necessary?
>=20
> I can confirm the above: Our hardware can't render to linear depth buffer=
s,
> nor can it mix linear color buffers with block linear depth buffers.
>=20
> I think there's a misunderstanding on expected behavior of
> resource_create_with_modifiers() here too: tegra_screen_resource_create()=
 is
> passing DRM_FORMAT_MOD_INVALID as the only modifier in non-scanout cases.
> Previously, I believe nouveau may have treated that as "no modifiers
> specified.  Fall back to internal layout selection logic", but in my patc=
hes
> I "fixed" it to match other drivers' behavior, in that allocation will fa=
il
> if that is the only modifier in the list, since it is equivalent to passi=
ng
> in a list containing only unsupported modifiers.  To get fallback behavio=
r,
> tegra_screen_resource_create() should pass in (NULL, 0) for (modifiers,
> count), or just call resource_create() on the underlying screen instead.
>=20
> Beyond that, I can only offer my thoughts based on analysis of the code
> referenced here so far:
>=20
> While I've learned from the origins of this thread applications/things
> external to Mesa in general shouldn't be querying format modifiers of
> buffers created without format modifiers, tegra is a Mesa internal compon=
ent
> that already has some intimate knowledge of how the nouveau driver it sits
> on top of works.  Nouveau will always be able to construct and return a
> valid format modifier for unorm single sampled color buffers (and hopeful=
ly,
> anything that can scan out going forward), both before and after my patch=
es
> I believe, regardless of how they were allocated.  After my patches, it
> should even work for things that can't scan out in theory.  Hence, looking
> at this without knowledge of what motivated the original changes, it seems
> like tegra_screen_resource_create should just naively forward the
> resource_create() call, relying on nouveau to select a layout and provide=
 a
> valid modifier when queried for import.  As Karol notes, this works fine =
for
> at least this simple test case, and it's what nouveau itself would be doi=
ng
> with an equivalent callstack, excepting the modifier query, so I find it
> hard to believe it breaks some application behavior.  It'll also end up
> being equivalent (in end result, not quite semantically) to what
> dri3_alloc_render_buffer() was doing prior to the patch mentioned that br=
oke
> things for Karol, so certainly for the DRI3 usage it's the right behavior.
>=20
> Ilia, what in the nouveau DDX (As in Xfree86 DDX?) assumes linear buffers?
> It sounds like you don't think it will interact poorly with this path
> regardless?  Thierry, do you recall what motivated the force-linear code
> here?

This would've clearly been a good opportunity to leave a comment as to
why this was, but the one that's in place in
tegra_screen_resource_create() doesn't do a good job of conveying what
I was thinking at the time.

This is now all a very long time ago, so I don't recall the exact
details. However the intention at the time was to pass the invalid
modifier in the default case because I wanted Nouveau to pick whatever
it wanted, assuming that we could deal with all modifiers that it could
throw at us for display. At least at the time that was true, and I do
think you're correct that Nouveau used to treat DRM_FORMAT_MOD_INVALID
as "don't care" and then tegra_screen_import_resource() would query the
modifier from Nouveau. I don't think I ever ran into the situation where
Nouveau would use a modifier that we couldn't deal with (i.e. one of the
"legacy" modifiers after your patch).

I /think/ the linear requirement, judging by the comment, was to support
certain cases that I was running into that didn't support modifiers at
all, so I think the assumption was that they wouldn't be able to create
the framebuffer with DRM_IOCTL_MODE_ADDFB2 and hence pitch-linear would
have to be assumed.

I vaguely recall that this might have been with kmscube and/or certain
versions of the X server (I also seem to have a vague memory that glamor
being used might have been responsible for this happening or not).

Given that many things have now changed it might be worth rerunning all
of those use-cases again and trace what types of resources are being
created in the process and maybe make this a little saner.

> As to why this works for Thierry and not Karol, that's confusing.  Are you
> both using the same X11 DDX (modesetting I assume?) and X server versions?
> Could it be a difference in client-side DRI library code somehow?

It looks like Karol might have found a commit that fixes this in the X
server git. I'll run a couple of tests to see if I can reproduce with a
version prior to that "fix".

Thierry

--3MwIy2ne0vdjdPXF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl82lFMACgkQ3SOs138+
s6FyMQ/+OQr7cegMNuNcngyRC7KpENzI67MF9RpdawGgfOef2QIYqoGxlGRYNnik
4ZBuW1XuPTdiaIz5eokXow6n42D44IHIHt3omg3GusjnemnciVPLwf7QZd0XP/Zu
iNdbOjuEuDmHlV1qqSDdl4VcPXWpvZWRo4Y5eqGcbXoLhJ5M5Phkr627huJjrs7L
nuXv7+0mt6wV9wzgVhwxo5bjIbehfQllwYbjhTwd7jRXVH2k8HjNP+q+yRcfOXrm
vqYYxNnmF3vK96Tv7ZKAw4bgZwiB47OlQbO2kSOcyGNuIeww7VU4pwu0uQWOZCWk
IXVzMGmhlfwGZ/yJSoyCHfxLnxCTREhCTbi0Xat+OECpV3+Blm8C5fVzD9EudRsQ
hWWNq9IvDiMV7eqH3h1q79u2GBf1Ni9ugz/GMB+Fn7DK6IM7/p3inPZhOBCBnrS9
WzITy/gdY+MtMnAh9QjHp4VxBc0fxOcIGzG2OKT4buFp1yG1CUfEuIu9Vq26+7F+
re3HrlyWnWbdrC31FsWkN8Q7MAZuZcgUrXJ3ehkRUeS1O+xwkCd0z/OaF6eMsWKk
4qED1vQid/p4fBeMjGbjg/5MKeJxoQNAv7pmWNEygNWc/g+qK8GSOkO2oQBQDO+X
sSeNgXak8lx4WuZHBwpCSjXINSHiyB5PQI8CPk2yz7acOKQXmQQ=
=7HYp
-----END PGP SIGNATURE-----

--3MwIy2ne0vdjdPXF--

--===============0348110940==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0348110940==--
