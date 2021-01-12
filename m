Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5332F2E63
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 12:51:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEE306E1E9;
	Tue, 12 Jan 2021 11:51:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FFDE6E1CF
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 11:51:15 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id n8so2534501ljg.3
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 03:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=6moJeJqDS+Hx6MR6GidrbRrCLfXvlKb00iIvNI6nvMg=;
 b=Jwbbrx2oUjhmRVD4fy0c1aB9LjXb0CRyb5TODeRCH1tWz+EzorwfM784/L2scTOKue
 q7rmyJNxcxiZWIMDomCeXedUtR3OKzmGVQQuVezBjlbT+ydycEHX/MNXLEdFI98oTLk/
 uhIzet/V4YjoSP3hnjOHCmo6Movu4AgEi0dmVeyM2i5ZvgE9GACRcCb4R4ZkkzzhWvMh
 EJTR2uqFLQuJf3yXiiRI8Pc18QF+8jeOpc77uhZBffLweDK2hugAFk0AzqEG3GhrMqo+
 nHbVRzhC1ZobT53qdzbHFjPjh8D22sQFHuzie+wpGkZDR9o3AKIMS8AOn0DBD7Y5Jhri
 u7/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=6moJeJqDS+Hx6MR6GidrbRrCLfXvlKb00iIvNI6nvMg=;
 b=rcnmovnLYhJpNXT3fO4QGEypZzz8F4KWJimUJrg4/t7G+E+05nCHkGq8VDb7Q9Y4LV
 pyw4M4byHyBiEt/iZ/3mjrlZekwwfeMftnFtdXOWsgoHyTRjJWRZnS0rzlFam0jdwPAT
 Og/PZwGKsFr0odjV+IHTS/c7KxaWR1LBg2asRCh07KxCvNWG19el0hfESGSJBTQe4BL3
 uGsoKMcsQc6WZ3xgPW8Yg8AamjyKhaj28+0yqlRcB3AyDSntXy/CaJ9EfWqF/WFvWXr6
 ULo+rNyzg3HQlWbm/GSRD7lr1tjf28E0UrzUiJBuDtJp7Pj7DTZxaRx635X5VC9lAnPn
 nflQ==
X-Gm-Message-State: AOAM5301R9PyC5VB+ecd62WpMLApQZZAEamwMQX3ZY7KGfv0k7G24RBW
 J01PfxJQ0Bp2ZvhcWmoeNx4=
X-Google-Smtp-Source: ABdhPJzvQido0cBG24fXNTB1p5H2se27B8OBucCbXY2pdePrpd5FjbwPhXpSN2aD9AzfPcBk+OJXBQ==
X-Received: by 2002:a2e:914d:: with SMTP id q13mr1818124ljg.205.1610452273856; 
 Tue, 12 Jan 2021 03:51:13 -0800 (PST)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id u12sm280110lff.250.2021.01.12.03.51.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 03:51:13 -0800 (PST)
Date: Tue, 12 Jan 2021 13:50:43 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH 0/4] drm: rcar-du: Add cubic LUT support
Message-ID: <20210112135043.30388d3d@eldfell>
In-Reply-To: <20201221015730.28333-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20201221015730.28333-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============0633438856=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0633438856==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/YTIKGpk2iLi69YChR+ELP9e"; protocol="application/pgp-signature"

--Sig_/YTIKGpk2iLi69YChR+ELP9e
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 21 Dec 2020 03:57:26 +0200
Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com> wrote:

> Hello,
>=20
> This patch series adds cubic (3D) look up table support to the CMM and
> DU drivers, and extend the KMS userspace API to expose the cubic LUT to
> userspace.

Hi,

when you say "cubic" I immediately think "polynomial of third degree",
and got really curious how that works. But it seems that is not at all
what you have here, instead you have a 3D LUT with probably
trilinear(?) interpolation.

I would suggest to stop using the misleading term "cubic" (e.g. cubic
interpolation is a thing).

Where does the abbreviation CLU come from? If that refers to cubic as
well, it would be best to change that too to avoid misleading.

Unless your hardware actually does cubic interpolation in the 3D LUT?

> The code is fairly straightforward. Patch 1/4 refactors the CMM (color
> management module, the Renesas R-Car IP core that handles 1D and 3D
> lookup tables for the display) driver, which currently supports the 1D
> (a.k.a. gamma) table only, to prepare for 3D LUT support (including a
> modification to the API between the CMM and DU drivers). The CMM driver
> is then extended in patch 2/4 to support the 3D LUT.
>=20
> Patch 3/4 adds support for the 3D LUT in the KMS core and the KMS
> userspace API, in the form of two new properties. I expect this to be
> the most controversial part of the series, not so much for the feature
> itself, but for when it is inserted in the color management pipeline.
>=20
> Finally, patch 4/4 wires the KMS extension to the DU driver.
>=20
> The R-Car CMM applies the 3D LUT at the output of the display, where
> data is transmitted in RGB space (when outputting YUV data to the
> display the CMM can't be used according to the documentation, but I
> wouldn't be entirely surprised if this limitation could be worked
> around), before the 1D LUT. I've located the 3D LUT between the CTM and
> the gamma LUT, but it could equally be placed before the degamma LUT or
> between the degamma LUT and the CTM in my case, as the R-Car color
> management pipeline has no CTM and has a single 1D LUT on the output
> side (there's provision for 1D LUT on the input side for some of the
> planes, but that's a separate topic).
>=20
> I however don't expect this to necessarily match all hardware though,
> and this feature may require us to give up on a fixed, one size fits
> them all, color management pipeline exposed to userspace. Whether this
> would mean device-specific APIs (not necessarily in the form of
> device-specific properties, but in how they map to hardware features, as
> I think helpers to handle a 3D LUT property in the KMS core can save
> code duplication in drivers), or the need for a new property to expose
> the order in which color management operations are implemented, I don't
> know.

That is a difficult problem indeed. Userspace must know everything what
happens to the pixel values exactly, beyond that I have no suggestions
there.

> I started having a look at userspace to see how this could be handled,
> searching for color management support in weston, kwin and wlroots/sway.
> All three support setting the gamma table when using the DRM/KMS
> backend, weston and kwin through the legacy API, and wlroots through the
> atomic API. Weston reads an ICC profile using Little CMS and applies the
> gamma table. kwin is a bit more elaborate, it also uses Little CMS to
> read an ICC profile, but additionally supports setting the brightness
> and color temperature. It however only sets a gamma table in the end.
> Wlroots seems to have an API to set the gamma table, but I haven't seen
> where sway uses it (I may have missed that though). In any case, there's
> limited support there for color management.
>=20
> Inputs would be appreciated on this, for instance with feedback on how
> X.org and Android handle color management, on how 3D LUTs are
> implemented on other platforms, or in general on how we would like to
> use them. I don't mind doing some work in userspace to prototype this,
> but I won't have the bandwidth to design a completely new framework.

The idea for Weston (and Wayland in general) is that the display server
uses a CMM to compute a transformation it needs to apply, based on the
display and content color properties (e.g. ICC profiles) and more. What
that transformation exactly is depends on the CMM, and it may further
depend on what kind of ICC profiles are being used (an ICC file may
contain different kinds of transformation definitions, from
parameterised standard formulas to 1D and 3D LUTs and chains of those).
So a display server gets a more or less opaque transformation object
from a CMM and needs to implement what it describes somehow.

Implementing the transformation depends on what kind of API the CMM
offers. The good thing with a 3D LUT is that, AFAIU, no matter what the
actual transformation is, it can always be represented as a 3D LUT. The
only open question then is the size and precision of the 3D LUT, and
how it is interpolated. If the precision is sufficient, a display
server may choose to use the hardware 3D LUT.

All this I believe should be internal to a Wayland display server.

Mind, that everything I talk about in the above is done in *addition*
to "the LUT" (VCGT tag in ICC files). In the X11 model of color
management, "the LUT" is considered calibration and is 3 x 1D. If some
LUT was in place when profiling a monitor, the same LUT must also be in
place when using that monitor color profile. Confusingly, calibration
values like "the LUT" are not considered as part of the color profile,
even though technically "the LUT" can be saved in an ICC file. For more
information, see:
https://ninedegreesbelow.com/photography/monitor-profile-calibrate-confuse.=
html
https://gitlab.freedesktop.org/swick/wayland-protocols/-/blob/color/unstabl=
e/color-management/color.rst

The code you saw in Weston loading a LUT from an ICC profile does the
VCGT tag part and nothing else. IOW, it loads a calibration, not a
monitor color profile. A 3D LUT could be regarded as calibration as it
is in the old-school model, or it could be actively computed and used
like the Wayland model being designed.

Loading a LUT from the VCGT tag is not really color management. It's
just calibration, like tuning the monitor brightness knob.

Simon already pointed you to
https://gitlab.freedesktop.org/wayland/wayland-protocols/-/merge_requests/14
and Weston work is underway as well, but it may be quite some time
before Weston could actually take advantage of a KMS 3D LUT. In Weston
we consider hardware features like the 3D LUT as optional optimisations
that can be used if the circumstances are right. This means that we
want the "software path", that is, GL shaders, to work first. Shaders
we can run and test everywhere, but the 3D LUT is not always available
and requires a writeback connector to test in an automated test suite..

As a summary, I could say that X.org does not do color management. Period.
X.org does allow loading "the LUT" (VCGT), but it does nothing with
color profiles. Applying color profiles is left for each X11 app to do
on their own to their own pixels. If X11 protocol extensions do not
already support setting a 3D LUT, then you have to add that to the
protocol.

Wayland is being designed differently: the display server is
responsible for color management, unless Wayland applications
explicitly ask to do it themselves. Wayland protocol is intended to
not allow free-to-all access to hardware LUTs like X11 does.

Therefore, I would say that while adding X11 protocol to set a 3D LUT
in hardware does mechanically exercise the UAPI, it does not in my
opinion prove anything about the usability of the UAPI, because it
lacks an actual use case. You would need something to meaningfully and
purposefully to set the 3D LUT to some particular values to reach some
specific effect or goal for a real world use case. This may be an
unpopular opinion, but IMO X11 RandR is little more than a library ABI
exposing KMS UAPI as is, similar to libdrm: an interface, not a full
application alone.

CrOS and Kodi mentioned by danvet sound like much better proving
vehicles than X.org, Weston I'm afraid might be quite some months away
still.


A consideration from KMS UAPI point of view: for the 3D LUT to be
usable for Wayland compositors, setting the 3D LUT must be either
glitch-free, or if it can cause a hickup, glitch, stall, or anything
else not observed during a normal pageflip, it must require
ALLOW_MODESET.

If setting any KMS property is possible without ALLOW_MODESET but it
may cause a visible glitch, pageflip timings included, then that KMS
property is much less useful to a Wayland display server as it can only
be used as if it always required ALLOW_MODESET, even with drivers where
it is glitch-free.


Thanks,
pq

--Sig_/YTIKGpk2iLi69YChR+ELP9e
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl/9jRMACgkQI1/ltBGq
qqfUPRAAmZLOyByACirPhYAtpQYbx3v5CZdlNEf9MJn4bj4gTvTHi72FZRPBgRH3
oqqeAIdX00mo9pvs/Z9etC7A1OJDD/kmYt0pFqThwZ+FE/Qd5zmVGkt/uKsIGVN9
Qn7UdOl0n3DdOFTAjt36FB2vuJ1vOB8RDdEqcgknO9a5ezms9jpxLCuOwqqTaptW
TnN0LFR7KlulSNDNjsBx5IZ5rI+ey4AzZ+QCkZsalb1m4CVqPsJF0JAx/MFJZyO+
0sQeVUHptpdhR7ntgepOdagqLsVRbk9rv3MImdNTlUlhaEhO4Lqxkno+saPOtdG9
TD2giG7aDmQ0x97PL4bFIc9NRMi4gqBwAeXQ6tNK1QXU2SLflIUyey2XYDLHsYnv
YKFWvUoozUqB6zOs8D5/xLQ2kPfePywQTosgtmQMTnMcrNKqEZHVDhMjLdPSAFMV
7OHxkmCyEdgNvTBaMiACyS7XQyeXgiZt5YVyiuSnG7xPYEX0GnGEKouRMjiqQlIA
tM5orFzbdC2UCpTEX4Aa+sE0P0aRNXEgkEBYeZ+z2wA4TPEUghKBlVQXfQw9DrAQ
7s9vw2rOYUespNx9k9Q7h9l1FI44rYwgYYyKMVkoS3PlPgOIP1f/bHs2nUoGK9Op
6hMKhfytDHJjs33dRCH3My1lJF13px+TNKdJ9uM3oMIsddTXKuc=
=7fOl
-----END PGP SIGNATURE-----

--Sig_/YTIKGpk2iLi69YChR+ELP9e--

--===============0633438856==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0633438856==--
