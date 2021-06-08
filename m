Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A637E39F108
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 10:34:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20C9E6EB35;
	Tue,  8 Jun 2021 08:34:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 740056EB33;
 Tue,  8 Jun 2021 08:34:42 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id v22so29466248lfa.3;
 Tue, 08 Jun 2021 01:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=PhFqEIBYuRQ18mjDFeLC0goTzo0PBBXgL1uT7uG4TC8=;
 b=nZ9cRaSbFqxdW2y+r3hiesOzzryxBOO9IPovi5XrWlueGkii8FDsw2DQtplU2Xwhxm
 axI1y70lt3l0EAf9J88jnrzdsrvHCX0FqHQQXlp9+XdV18BbLNniw7vePdovuTjsY1F/
 aXQL0VJC4bAz6PJqHy89oeMfTcvpVBBLZGzWP99mEFhdYdlJlZP9u2ta8QvPZT2QHn4u
 lK0jDPenr6n00i/sswI/WJLr5WkJggnXgqsQHzhgVhB3Qf3AyJKAeQKZh9twOC2pqL7c
 bbRUKcZCh1Iplq6m0zBqKeRQLckxVWwbnYC7WmXuxKzUpv4MOBVAiOCGEI5+uPSlI2Dh
 SWWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=PhFqEIBYuRQ18mjDFeLC0goTzo0PBBXgL1uT7uG4TC8=;
 b=HT+u0NVvWklVeAs//tEdRdKbvH5z9qviQDNEsKQqMTpTXgJFMzqbH6GhTeLLdWLtDf
 78bq441G19RPHUVxkRnPl5tqbeNS+qaIbhDlFok35dqnOR6AtFAp4gw3pl1DmMVz2qVR
 y2lSWBJi3zZG/cBlqzGJ7fvlEtKY9JBcccc2HkqMThzc7yjUkkrP+QW/Og+eRJlwoK21
 ihDujHF7Kz8MaKrT/hLc+/LSRt/QifgJ6+aoORNF/Gogy73EYpk7GMG0PAlCG6B9U8GF
 LebMuqLik39mg7ldekgZXEGHH37H4XG85HF/VIT40jxLEa1ggbzohU+ftJiM0xromRkW
 7nHA==
X-Gm-Message-State: AOAM533nz/+lGUeEo1+sfx3NL2dNitdQI6BfOrfDdKxAWj3ybsQi8sWL
 KetD9aZYsaRJUJzh82hdPrQ=
X-Google-Smtp-Source: ABdhPJyFOEWFf/3ZW/FetD/M27Cj4dqAQIx1eiC4eZJkXHyA6p1/XazqRnjJUtrpJNys4aNmZ/uU0A==
X-Received: by 2002:ac2:44c2:: with SMTP id d2mr14256000lfm.337.1623141279305; 
 Tue, 08 Jun 2021 01:34:39 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id i17sm362322lfe.31.2021.06.08.01.34.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 01:34:38 -0700 (PDT)
Date: Tue, 8 Jun 2021 11:34:35 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: "Shankar, Uma" <uma.shankar@intel.com>, Harry Wentland
 <harry.wentland@amd.com>
Subject: Re: [PATCH 02/21] drm: Add Plane Degamma Mode property
Message-ID: <20210608113435.6f621fb1@eldfell>
In-Reply-To: <152c3ac0e84e4bcdae832d8819179fce@intel.com>
References: <20210601105218.29185-1-uma.shankar@intel.com>
 <20210601105218.29185-3-uma.shankar@intel.com>
 <2154f1d1-2c86-ede7-4b23-acab93e3eb00@amd.com>
 <152c3ac0e84e4bcdae832d8819179fce@intel.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/uJsuDkeBN=0/RC70KuKa7p6"; protocol="application/pgp-signature"
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Sebastian Wick <sebastian@sebastianwick.net>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Modem,
 Bhanuprakash" <bhanuprakash.modem@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/uJsuDkeBN=0/RC70KuKa7p6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 7 Jun 2021 17:34:06 +0000
"Shankar, Uma" <uma.shankar@intel.com> wrote:

> > -----Original Message-----
> > From: Harry Wentland <harry.wentland@amd.com>
> > Sent: Friday, June 4, 2021 11:54 PM
> > To: Shankar, Uma <uma.shankar@intel.com>; intel-gfx@lists.freedesktop.o=
rg; dri-
> > devel@lists.freedesktop.org
> > Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>; Cyr, Aric
> > <Aric.Cyr@amd.com>
> > Subject: Re: [PATCH 02/21] drm: Add Plane Degamma Mode property
> >=20
> > On 2021-06-01 6:51 a.m., Uma Shankar wrote: =20
> > > Add Plane Degamma Mode as an enum property. Create a helper function
> > > for all plane color management features.
> > >
> > > This is an enum property with values as blob_id's and exposes the
> > > various gamma modes supported and the lut ranges. Getting the blob id
> > > in userspace, user can get the mode supported and also the range of
> > > gamma mode supported with number of lut coefficients. It can then set
> > > one of the modes using this enum property.
> > >
> > > Lut values will be sent through separate GAMMA_LUT blob property.
> > >
> > > Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> > > ---
> > >  Documentation/gpu/drm-kms.rst             | 90 ++++++++++++++++++++++
> > >  drivers/gpu/drm/drm_atomic.c              |  1 +
> > >  drivers/gpu/drm/drm_atomic_state_helper.c |  2 +
> > >  drivers/gpu/drm/drm_atomic_uapi.c         |  4 +
> > >  drivers/gpu/drm/drm_color_mgmt.c          | 93 +++++++++++++++++++++=
+-
> > >  include/drm/drm_mode_object.h             |  2 +-
> > >  include/drm/drm_plane.h                   | 23 ++++++
> > >  7 files changed, 212 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/Documentation/gpu/drm-kms.rst
> > > b/Documentation/gpu/drm-kms.rst index 87e5023e3f55..752be545e7d7
> > > 100644
> > > --- a/Documentation/gpu/drm-kms.rst
> > > +++ b/Documentation/gpu/drm-kms.rst
> > > @@ -514,9 +514,99 @@ Damage Tracking Properties  Color Management
> > > Properties
> > >  ---------------------------
> > >
> > > +Below is how a typical hardware pipeline for color will look like:
> > > +
> > > +.. kernel-render:: DOT
> > > +   :alt: Display Color Pipeline
> > > +   :caption: Display Color Pipeline Overview
> > > +
> > > +   digraph "KMS" {
> > > +      node [shape=3Dbox]
> > > +
> > > +      subgraph cluster_static {
> > > +          style=3Ddashed
> > > +          label=3D"Display Color Hardware Blocks"
> > > +
> > > +          node [bgcolor=3Dgrey style=3Dfilled]
> > > +          "Plane Degamma A" -> "Plane CSC/CTM A"
> > > +          "Plane CSC/CTM A" -> "Plane Gamma A"
> > > +          "Pipe Blender" [color=3Dlightblue,style=3Dfilled, width=3D=
5.25, height=3D0.75];
> > > +          "Plane Gamma A" -> "Pipe Blender"
> > > +	  "Pipe Blender" -> "Pipe DeGamma"
> > > +          "Pipe DeGamma" -> "Pipe CSC/CTM"
> > > +          "Pipe CSC/CTM" -> "Pipe Gamma"
> > > +          "Pipe Gamma" -> "Pipe Output"
> > > +      }
> > > + =20
> >=20
> > It might be worthwhile to also highlight the YCbCr coefficient matrix i=
n the pipeline,
> > between the FB and Plane degamma, i.e.
> >   YCbCr coefficients > plane degamma > csc > ...
> >=20
> > One problem with this view is that not all HW will support all (or any)=
 of these CM
> > blocks on all planes. For example, on AMD HW cursors are very different=
 from other
> > planes and don't really have full CM support.
> >  =20
> > > +      subgraph cluster_static {
> > > +          style=3Ddashed
> > > +
> > > +          node [shape=3Dbox]
> > > +          "Plane Degamma B" -> "Plane CSC/CTM B"
> > > +          "Plane CSC/CTM B" -> "Plane Gamma B"
> > > +          "Plane Gamma B" -> "Pipe Blender"
> > > +      }
> > > +
> > > +      subgraph cluster_static {
> > > +          style=3Ddashed
> > > +
> > > +          node [shape=3Dbox]
> > > +          "Plane Degamma C" -> "Plane CSC/CTM C"
> > > +          "Plane CSC/CTM C" -> "Plane Gamma C"
> > > +          "Plane Gamma C" -> "Pipe Blender"
> > > +      }
> > > +
> > > +      subgraph cluster_fb {
> > > +          style=3Ddashed
> > > +          label=3D"RAM"
> > > +
> > > +          node [shape=3Dbox width=3D1.7 height=3D0.2]
> > > +
> > > +          "FB 1" -> "Plane Degamma A"
> > > +          "FB 2" -> "Plane Degamma B"
> > > +          "FB 3" -> "Plane Degamma C"
> > > +      }
> > > +   }
> > > +
> > > +In real world usecases,
> > > +
> > > +1. Plane Degamma can be used to linearize a non linear gamma encoded
> > > +framebuffer. This is needed to do any linear math like color space
> > > +conversion. For ex, linearize frames encoded in SRGB or by HDR curve.
> > > +
> > > +2. Later Plane CTM block can convert the content to some different
> > > +colorspace. For ex, SRGB to BT2020 etc.
> > > +
> > > +3. Plane Gamma block can be used later to re-apply the non-linear
> > > +curve. This can also be used to apply Tone Mapping for HDR usecases.
> > > + =20
> >=20
> > This would mean you're blending in gamma space which is likely not what=
 most
> > compositors expect. There are numerous articles that describe why blend=
ing in
> > gamma space is problematic, such as [1]
> >=20
> > [1] https://ninedegreesbelow.com/photography/linear-gamma-blur-normal-
> > blend.html
> >=20
> > To blend in linear space this should be configured to do
> >=20
> >   Plane Degamma > Plane CTM > CRTC Gamma
> >=20
> > I think it would also be good if we moved away from calling this gamma.=
 It's really
> > only gamma for legacy SDR scenarios. For HDR cases I would never expect=
 these to
> > use gamma and even though the sRGB transfer function is based on gamma
> > functions it's complicated [2].
> >=20
> > [2] https://en.wikipedia.org/wiki/SRGB
> >=20
> > A better way to describe these would be as "transfer function" and "inv=
erse transfer
> > function." The space at various stages could then be described as linea=
r or non-
> > linear, specifically PQ, HLG, sRGB, BT709, or using another transfer fu=
nction. =20
>=20
> Yeah I just kept the naming based on what we had for crtc to avoid ambigu=
ity. But yes, we
> can rename these to have them named generically, as gamma lut actually ca=
n be used for
> Tone mapping as well and its not just meant for applying a fixed non line=
r curve only. However
> naming based on transfer function is also not optimum as Tone mapping is =
not related to transfer
> function. May be we can name them as:
> linear_lut and nl_tone_mapper_lut.
>=20
> Other ideas for names are welcome.

I would suggest to avoid any kind of naming that explicitly refers to
gamma, EOTF, EOTF^-1, tone map, or anything else that has a specific
meaning. Likewise, the diagram should not claim that the pixel data at
certain stages of the pipeline is in certain form, e.g. linear,
non-linear, or in certain color space. Doing that would semantically
restrict what userspace can do. After all, kernel UAPI design is
mechanism, not policy, right?

However, to make the pipeline understandable, the documentation could
show example configurations, where you *can* say that this LUT
implements EOTF, pixels are light-linear at that point, the color space
at another point is XXX, and so on.

What exactly the LUT is, are pixel values linear or non-linear, and
what the color space is at any step are something that userspace will
define through providing the parameters for each processing step in the
pipeline.

Unless, your hardware has been designed for a certain policy and
deviating from that policy should be discouraged?

So what to name these:

That's the question we are struggling with at Weston too. You can seek
inspiration from CMM data structures (e.g. Little CMS 2) or from ICC
specifications. Just need to be careful to not pick a term that has
more meaning than kernel UAPI wants.

I personally like the terms "color curve" for 1D LUT -like things, and
"color mapping" for matrix or 3D LUT -like things. I'm using the term
"color transformation" for going from one encoding, color space, gamut,
and dynamic range to another with a specific render intent, which may
require a sequence of several color curves and color mappings to
achieve. But that's just me.

Why bother with all this indirection:

Use cases that want blending in non-linear spaces are one thing, but
probably less useful with HDR. Instead, I would imagine that doing
numerical optimization on a complete pipeline to achieve the best
precision given hardware limitations or minimizing memory consumption
or other, may result in different curves and mapping tables than simply
plugging in the EOTFs and CSCs into their intended places.

I have actually started to think that when Weston's DRM-backend is
trying to fit a window on a KMS plane, it would need to get the color
pipeline capabilities of that specific plane and ask the color manager
component to optimize the color transformation against the exact KMS
capabilities, evaluating whether a sufficient precision can be
achieved. Then the color manager gives back a description of how the
KMS plane would need to be configured, and the DRM-backend continues
with an atomic TEST_ONLY commit to see if it would work. The color
manager would quite likely delegate that optimization to a CMM, like
Little CMS 2 if possible. But this is all still so much hand-waving and
the KMS UAPI is not really there yet, that I will mostly just ignore
this idea for now and do something much simpler.

Or maybe all this optimization has already been done when designing the
new hardware, and we really do need to simply plug in the EOTFs and CSCs
without thinking?

Then again, if hardware changes every generation, that implies the
optimization is not complete, and there might be something to gain from
software optimization still. Old hardware always exists, too.


Thanks,
pq

--Sig_/uJsuDkeBN=0/RC70KuKa7p6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmC/K5sACgkQI1/ltBGq
qqdtpg/+PDkDkrmtYYnqisMUVWQPxR6WvjQQScSBITxdJjYPQYbWXj9MFkP9PmK5
l0dd9ed9cU2ehFOFcXEKSZpD9Z6py3Qn6IzloYmd7JrAFquoCZDKrsWvBOxNnjtr
5wrNtHeuCC4OG+FLdIHBNyb+8saa7YTm7Ra5n/AXsxXkeKX3soLuwa6ogORxlv49
uh6AeOLaeWagI6bQERooQ7ct/C0YDXddShzOQlY9li5x/fVuHgVyNQ6jGwXGAISB
I0ROiPNw2DEuExSVnsQGZAlD7G1k7YZkN8e1t0z4VEOFAsOwtjlEJjspDL24/md5
gLJNUKOo6ye8R8s1mHMGZNQXMZVM2UF5gXHcO9kaL+uBNvveHLnFNSsWWdmAcEFN
lFmobfPxNrpFTin/AmLK3kcsVS/b3zgPzvGku58RJAMdeKaiMwdvpXg5rjdUAIPs
MiKtrFa63StFq33VbQEhXXyK15/qxKpVVTPP6M6cCR2Ri4rPS0WUUEn/2W/xT6Va
ojuDB3GToyqAnHYn95N3OILW/MmXgd8y/w8nbQotPE4pRk/8LH4p9OdqzeMLxYIg
jZFqRung3O+o8B7aBkfowAjKr+M3GsEkLrydBB2cFZAlIlogqtA0/njJn8oZ7A3c
knGKbCP/aNSgmZncSaEkY0PpV8XPFERpmZ976/qAGUQifZSggjs=
=UXvB
-----END PGP SIGNATURE-----

--Sig_/uJsuDkeBN=0/RC70KuKa7p6--
