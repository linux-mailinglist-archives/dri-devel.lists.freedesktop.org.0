Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFCF3B8EA6
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jul 2021 10:07:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D84C6E7FA;
	Thu,  1 Jul 2021 08:07:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A6836E223;
 Thu,  1 Jul 2021 08:07:19 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id u25so7165165ljj.11;
 Thu, 01 Jul 2021 01:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=8jnybML410UZAwAL1Sodz/BTtxVasL+j5oDNIXqfgfU=;
 b=iL3FaynRTR3K1xAlWjmyPQtKbEKAdvqYNOC1JWN8s/OFpb2ghPoNFfxPXuM/pABzqa
 7gvK5Fd+SyNxCDEjd6l8Y9hJL9qgyrV1LP7+MQEd5GCFAxEHnR6fOrHFCUZBm3hnAZ4K
 UdnuwEG3nlbZfzstornSSIT9pA38cenSo06841zVmXeqbSGQmS6U7cteX45mk6fbmZ+l
 WNOgo07exbEQmsB6IjAWXlD+tpEVsImQFvWdQ4L+/ueHxAVgiE3p7DN3CUwrtOXLVj4X
 ILanMA4ZkeLo9QtbzUOfaw1io3GJcFRVUfJ0vssfybFptFz69XcrUypVCSi3c9wOwEXX
 iYUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=8jnybML410UZAwAL1Sodz/BTtxVasL+j5oDNIXqfgfU=;
 b=RxSnh1l9/ltCSA3hA2cDdBllB4ebXYUlMF9gepN9RPfHAeVCYnRmyiBfbIPrKQptbU
 VsD52dJ28OqOXhMF3zpDXnpvZo8qe86u1f3qagvWQzrvvhxDNdsVNYu9/xKI3QlhKAIs
 cZ/u/gPtnB6IU5CvNUBvyfVtwE4naGNnWXBTptMTNAXmQEIuCX8Ih47HXGLMGkG60laJ
 eav4hrrCpe+DvMy62QWbQMH5VhtNrx5XhjyBbbRNkL3b846dy0g8EkX/oaCG7CZQdrUa
 Frd3xAov4t7wGRgQ0GJvXwY46luZtXhDPo0bPxyaVY39ph7ao8uzFUd6gxff/asiXa/K
 hCOQ==
X-Gm-Message-State: AOAM533ilIpj9c62WrfTmJVSBYow9Gn3WjDOG5/OOQeykKltNEoc1742
 Z80rAOAw2GBiD8S4eBJnM7o=
X-Google-Smtp-Source: ABdhPJyA8nEXUhjX46vyag/J2AAiPiDJFqnJaSs4gO4dm8UxJxM0SxQQEwk6CW4sd36nPyk2DXdVAg==
X-Received: by 2002:a2e:a378:: with SMTP id i24mr10854299ljn.441.1625126837850; 
 Thu, 01 Jul 2021 01:07:17 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id q27sm74388lfb.173.2021.07.01.01.07.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jul 2021 01:07:17 -0700 (PDT)
Date: Thu, 1 Jul 2021 11:07:14 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Werner Sembach <wse@tuxedocomputers.com>
Subject: Re: [PATCH v4 12/17] drm/uAPI: Add "preferred color format" drm
 property as setting for userspace
Message-ID: <20210701110714.61f3e2af@eldfell>
In-Reply-To: <d3674d49-8bca-7ecf-1735-7bff2d9d526e@tuxedocomputers.com>
References: <20210618091116.14428-1-wse@tuxedocomputers.com>
 <20210618091116.14428-13-wse@tuxedocomputers.com>
 <20210622101516.6a53831c@eldfell>
 <jIDQ2rRRMWlhDDPf08Z8xZlEE8HTBx7fHsylFdK0joSSFVyES8D444Giyiji9zbIm7dU4QpbsXZLvIDTbGW0wEoUWKsMEI4evizn0UdGMvM=@emersion.fr>
 <20210629141712.21f00c38@eldfell>
 <6d8716e0-e68a-e7b7-a341-a7471c413e9c@tuxedocomputers.com>
 <20210630114133.47397e2f@eldfell>
 <d3674d49-8bca-7ecf-1735-7bff2d9d526e@tuxedocomputers.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DtmT9xsU+7CGEc67EzdDs4G";
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
Cc: sunpeng.li@amd.com, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 airlied@linux.ie, amd-gfx@lists.freedesktop.org, tzimmermann@suse.de,
 rodrigo.vivi@intel.com, alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/DtmT9xsU+7CGEc67EzdDs4G
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 30 Jun 2021 11:20:18 +0200
Werner Sembach <wse@tuxedocomputers.com> wrote:

> Am 30.06.21 um 10:41 schrieb Pekka Paalanen:
>=20
> > On Tue, 29 Jun 2021 13:39:18 +0200
> > Werner Sembach <wse@tuxedocomputers.com> wrote:
> > =20
> >> Am 29.06.21 um 13:17 schrieb Pekka Paalanen: =20
> >>> On Tue, 29 Jun 2021 08:12:54 +0000
> >>> Simon Ser <contact@emersion.fr> wrote:
> >>>    =20
> >>>> On Tuesday, June 22nd, 2021 at 09:15, Pekka Paalanen <ppaalanen@gmai=
l.com> wrote:
> >>>>    =20
> >>>>> yes, I think this makes sense, even if it is a property that one ca=
n't
> >>>>> tell for sure what it does before hand.
> >>>>>
> >>>>> Using a pair of properties, preference and active, to ask for somet=
hing
> >>>>> and then check what actually worked is good for reducing the
> >>>>> combinatorial explosion caused by needing to "atomic TEST_ONLY comm=
it"
> >>>>> test different KMS configurations. Userspace has a better chance of
> >>>>> finding a configuration that is possible.
> >>>>>
> >>>>> OTOH, this has the problem than in UI one cannot tell the user in
> >>>>> advance which options are truly possible. Given that KMS properties=
 are
> >>>>> rarely completely independent, and in this case known to depend on
> >>>>> several other KMS properties, I think it is good enough to know aft=
er
> >>>>> the fact.
> >>>>>
> >>>>> If a driver does not use what userspace prefers, there is no way to
> >>>>> understand why, or what else to change to make it happen. That prob=
lem
> >>>>> exists anyway, because TEST_ONLY commits do not give useful feedback
> >>>>> but only a yes/no. =20
> >>>> By submitting incremental atomic reqs with TEST_ONLY (i.e. only chan=
ging one
> >>>> property at a time), user-space can discover which property makes th=
e atomic
> >>>> commit fail. =20
> >>> That works if the properties are independent of each other. Color
> >>> range, color format, bpc and more may all be interconnected,
> >>> allowing only certain combinations to work.
> >>>
> >>> If all these properties have "auto" setting too, then it would be
> >>> possible to probe each property individually, but that still does not
> >>> tell which combinations are valid.
> >>>
> >>> If you probe towards a certain configuration by setting the properties
> >>> one by one, then depending on the order you pick the properties, you
> >>> may come to a different conclusion on which property breaks the
> >>> configuration. =20
> >> My mind crossed another point that must be considered: When plugin in
> >> a Monitor a list of possible Resolutions+Framerate combinations is
> >> created for xrandr and other userspace (I guess by atomic checks? but
> >> I don't know). =20
> > Hi,
> >
> > I would not think so, but I hope to be corrected if I'm wrong.
> >
> > My belief is that the driver collects a list of modes from EDID, some
> > standard modes, and maybe some other hardcoded modes, and then
> > validates each entry against all the known limitations like vertical
> > and horizontal frequency limits, discarding modes that do not fit.
> >
> > Not all limitations are known during that phase, which is why KMS
> > property "link-status" exists. When userspace actually programs a mode
> > (not a TEST_ONLY commit), the link training may fail. The kernel prunes
> > the mode from the list and sets the link status property to signal
> > failure, and sends a hotplug uevent. Userspace needs to re-check the
> > mode list and try again.
> >
> > That is a generic escape hatch for when TEST_ONLY commit succeeds, but
> > in reality the hardware cannot do it, you just cannot know until you
> > actually try for real. It causes end user visible flicker if it happens
> > on an already running connector, but since it usually happens when
> > turning a connector on to begin with, there is no flicker to be seen,
> > just a small delay in finding a mode that works.
> > =20
> >> During this drm
> >> properties are already considered, which is no problem atm because as
> >> far as i can tell there is currently no drm property that would make
> >> a certain Resolutions+Framerate combination unreachable that would be
> >> possible with everything on default. =20
> > I would not expect KMS properties to be considered at all. It would
> > reject modes that are actually possible if the some KMS properties were
> > changed. So at least going forward, current KMS property values cannot
> > factor in. =20
>=20
> At least the debugfs variable "force_yuv420_output" did change the=20
> available modes here:=20
> https://elixir.bootlin.com/linux/v5.13/source/drivers/gpu/drm/amd/display=
/amdgpu_dm/amdgpu_dm.c#L5165=20
> before my patch=20
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D68eb3ae3c63708f823aeeb63bb15197c727bd9bf

Hi,

debugfs is not proper UAPI, so we can just ignore it. Display servers
cannot be expected to poke in debugfs. Debugfs is not even supposed to
exist in production systems, but I'm sure people use it for hacking
stuff. But that's all it is for: developer testing and hacking.

> Forcing a color format via a DRM property in this function would=20
> reintroduce the problem.

The property would need to be defined differently because its presence
could otherwise break existing userspace. Well, I suppose it could
break existing userspace no matter what, so we would need the generic
"reset to sane defaults" mechanism first IMO.

DRM has client caps for exposing video modes that old userspace might
not expect, to avoid breaking old userspace. Care needs to be taken
with all new UAPI, because if a kernel upgrade makes something wrong,
it's the kernel's fault no matter what userspace is doing, in principle.

Debugfs has no problem breaking userspace AFAIU, since it's not proper
UAPI.

> And I think i915 driver works similar in this regard.
>=20
> > =20
> >> However for example forcing YCbCr420 encoding would limit the
> >> available resolutions (my screen for example only supports YCbCr420
> >> on 4k@60 and @50Hz and on no other resolution or frequency (native is
> >> 2560x1440@144Hz).
> >>
> >> So would a "force color format" that does not get resetted on
> >> repluging/reenabling a monitor break the output, for example, of an
> >> not updated xrandr, unaware of this new property? =20
> > Yes, not because the mode list would be missing the mode, but because
> > actually setting the mode would fail. =20
> Well, like described above, I think the mode would actually be missing,=20
> which is also an unexpected behavior from a user perspective.

I think that is not how the property should work.

If KMS properties would affect the list of modes, then userspace would
need to set the properties for real (TEST_ONLY cannot change anything)
and re-fetch the mode lists (maybe there is a hotplug event, maybe
not). That workflow just doesn't work.

A very interesting question is when should link-status failure not drop
the current mode from the mode list, if other KMS properties affect the
bandwidth etc. requirements of the mode. That mechanism is engineered
for old userspace that doesn't actually handle link-status but does
handle hotplug, so the hotplug triggers re-fetching the mode list and
userspace maybe trying again with a better luck since the offending
mode is gone. How to keep that working when introducing KMS properties
forcing the cable format, I don't know.

As long as the other affecting KMS properties are all "auto", the
driver will probably exhaust all possibilities to make the mode work
before signalling link-status failure and pruning the mode.
Theoretically, as I have no idea what drivers actually do.

> >
> > RandR in particular is problematic, because it does not actually
> > understand any KMS properties, it is merely a relay. So anything
> > that *uses* RandR protocol or xrandr command would also need to be
> > patched to understand the new properties.
> >
> > The kernel automatically resetting *some* properties in *some*
> > occasions seems really fragile and complicated to me, which is why I'm
> > a lot more keen to see a "reset everything to sensible defaults"
> > generic mechanism added to KMS. =20
> Would you see that mechanism not (yet) existing a blocker for this=20
> patchset/the "force-" properties?

For the active properties, no.

For the force properties, that is a very good question and I am
somewhat concerned. I can very much see how the force properties would
break userspace, but since it would require other userspace to mess up
the KMS configuration first, I'm not sure if kernel developers would
see that as a kernel regression as it is an existing problem. The force
properties just make it more pronounced.


Thanks,
pq

--Sig_/DtmT9xsU+7CGEc67EzdDs4G
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmDdd7IACgkQI1/ltBGq
qqepMxAArvsb9cS0tIdBBI0/R2vYW+KHlWwNTAkbSraEWYnRqLcDjM/pq+E01lSi
2hHtQAvt9jgsthS9HONkzdv26Hiz9IfBzyI6ORapzUvSVgavYyPlUkUVNRpwV857
/uTGhL37XbfCvWitrAysiZbu5Oahp2hfx2Q/fOwi+LnGyS6NyNYpKMVS5yGIX0Xt
19H8Fe07Slh1Wnwz2Axp1nu0+ZNVq0fbeCbKiImke7x22PZ9gMMhWNowvFoshnBY
JsKKNZqD0lGlqXLO8kOr7N1te3Ikaw3edMzESvyQrK3NS476kjUz4sFZ6jkROKFQ
YbJlFXurlTxvvCVeVxYVsNYi+uYSzm+h309iUVG4s8ksCEyfedQqVducQdVM2BHJ
85owapy/ybV/VbYxKH0IWDVN9YmW5kRu9WGGTndXjcfv7I1inFRMrNekQdRvENwk
n+YpTfKZS8AyXMVriGSmPU6lB2SGLmnvdwuH/DQ6ajdxO6TAkiZ1iRYg/Rcc6T3c
KQezim5sfLYzcj8FDNLZMGy8IDxUVxkTddIL0I14ZaPfnsmHJ4EgtIoC5aJrhK5C
h+jFEa2xwasueSUqaT/RkQ3CigALohqrxZm/ntgh5Oe9NspVhHxAUxHgLAw/yu62
0Cg6fIoI2EJLZ/L7pkREXAI2pmJSoWJm8aUASI6a81UH/FrCuzY=
=Rg8y
-----END PGP SIGNATURE-----

--Sig_/DtmT9xsU+7CGEc67EzdDs4G--
