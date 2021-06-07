Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8833B39D605
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 09:30:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84EAC6E462;
	Mon,  7 Jun 2021 07:30:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00A466E3AE;
 Mon,  7 Jun 2021 07:30:05 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id r198so21303906lff.11;
 Mon, 07 Jun 2021 00:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=Hm+bqYAc0acRSQw44lJ54WJ0QTYWzcefCRH9RSjGtYQ=;
 b=S/u7jgq8swWok/p7FDPqmf7ihj7GdpsuWFB6ZCSgwsOsBeTj6EgmP7ooxTZ6GQL16F
 qlTFyh9SUOjpykAleDNj2HMcVKcZe1iElIUuekgUgV+RaX40lwQ8bDQZ5UR14oVCWuoW
 pXzSqCG313V40f0cX58q5BVB3St542/Nft4soNvR1xrgPbABJyom6UxvQfDcysY+Uytn
 eMcSLgAspr1l0BfQpsGKorWG7D0KFR5r212sk8eZM2kAFE62FeG8qMV2HnY45jCfFPDE
 Gjws/MwuJhyTyX1HTNbX1j5FpHqZh2lO9a4WwOcSiZnswE2mi8Y/I/FUa/vmn/nlCTH/
 UdYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=Hm+bqYAc0acRSQw44lJ54WJ0QTYWzcefCRH9RSjGtYQ=;
 b=uDE4nRidYD/2pM1awpcYKiK4/RlvOlWrTNOHjJlThPlPf5ADW6xJ9a77WfRPDlreHU
 2PdWp16HuLAU8G7C15CDZAEMMQJ2fz7ASu9b9y6RNEchMCdJ+g+AWYwpXD36LuHLI/8h
 HNB6xIuzEODmEcxSwLcoz/0oH/Bgn8GELPalQkiznzSJ5Y95iWHvm5PINqM4BoJwlg15
 X5zLDWxdGuHUYM66Kqj5+wWR7pF1p1UPTHhQ6n1Ze4fDT+jR0O45j5kjw1cqsfXOhfQZ
 gChCfw+JTAH+DjsnFL6Un9jO79HPGQUJIrsKVjlOpcBK46nBZB4kdP8FtPI8xJ82HFg1
 jDFw==
X-Gm-Message-State: AOAM530QkKKIlM8eq+UlumNGhys1LZvqnKX0Yxxo34pxZRuGE3RNpeEX
 UsRA3M2gDuplj3cN+ezXFhg=
X-Google-Smtp-Source: ABdhPJyEUnlknHejWXYT8mfYjZlc/t9DsYSUycmgRHYzp4R8KLePHnGKWdsofOfqgONbP3R9rFcIlg==
X-Received: by 2002:a05:6512:3588:: with SMTP id
 m8mr11415511lfr.309.1623051004308; 
 Mon, 07 Jun 2021 00:30:04 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id a7sm953905lfo.159.2021.06.07.00.30.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 00:30:03 -0700 (PDT)
Date: Mon, 7 Jun 2021 10:29:43 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [PATCH 0/9] Enhance pipe color support for multi segmented luts
Message-ID: <20210607102943.5c9bceb9@eldfell>
In-Reply-To: <0909131c-1340-c93b-7b80-b661497ccf73@amd.com>
References: <20210601104135.29020-1-uma.shankar@intel.com>
 <0909131c-1340-c93b-7b80-b661497ccf73@amd.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/KI4E/K1vbHM16sqc.qGZXfD"; protocol="application/pgp-signature"
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
Cc: intel-gfx@lists.freedesktop.org, Uma Shankar <uma.shankar@intel.com>,
 Sebastian Wick <sebastian@sebastianwick.net>, dri-devel@lists.freedesktop.org,
 bhanuprakash.modem@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/KI4E/K1vbHM16sqc.qGZXfD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 4 Jun 2021 14:51:25 -0400
Harry Wentland <harry.wentland@amd.com> wrote:

> On 2021-06-01 6:41 a.m., Uma Shankar wrote:
> > Modern hardwares have multi segmented lut approach to prioritize
> > the darker regions of the spectrum. This series introduces a new
> > UAPI to define the lut ranges supported by the respective hardware.
> >=20
> > This also enables Pipe Color Management Support for Intel's XE_LPD hw.
> > Enable Support for Pipe Degamma with the increased lut samples
> > supported by hardware. This also adds support for newly introduced
> > Logarithmic Gamma for XE_LPD. Also added the gamma readout support.
> >=20
> > The Logarithmic gamma implementation on XE_LPD is non linear and adds 25
> > segments with non linear lut samples in each segment. The expectation
> > is userspace will create the luts as per this distribution and pass
> > the final samples to driver to be programmed in hardware.
> >  =20
>=20
> Is this design targetting Intel XE_LPD HW in particular or is it intended
> to be generic?
>=20
> If this is intended to be generic I think it would benefit from a lot more
> documentation. At this point it's difficult for me to see how to adapt th=
is
> to AMD HW. It would take me a while to be comfortable to make a call on w=
hether
> we can use it or not. And what about other vendors?
>=20
> I think we need to be cautious in directly exposing HW functionality thro=
ugh
> UAPI. The CM parts of AMD HW seem to be changing in some way each generat=
ion
> and it looks like the same is true for Intel. The trouble we have with ad=
apting
> the old gamma/degamma properties to modern HW is some indication to me th=
at
> this approach is somewhat problematic.
>=20
> It would be useful to understand and document the specific use-cases we w=
ant to
> provide to userspace implementers with this functionality. Do we want to =
support
> modern transfer functions such as PQ or HLG? If so, it might be beneficia=
l to
> have an API to explicitly specify that, and then use LUT tables in driver=
s that
> are optimized for the implementing HW.

Hi Harry,

from my very limited understanding so far, enum might be fine for PQ,
but HLG is not just one transfer function, although it may often be
confused as one. PQ and HLG are fundamentally different designs to HDR
broadcasting I believe. It would be unfortunate to make a mistake here,
engraving it into UAPI.

> Or is the use case tone mapping? If so,
> would a parametric definition of tone mapping be easier to manage?

A very good question at least I have no idea about.


Thanks,
pq

> > +-----+------------------------------+
> > | x   |  2 pow x segment|No of Entries
> > |     |  0              | 1          |
> > | 0   |  1              | 1          |
> > | 1   |  2              | 2          |
> > | 2   |  4              | 2          |
> > | 3   |  8              | 2          |
> > | 4   |  16             | 2          |
> > | 5   |  32             | 4          |
> > | 6   |  64             | 4          |
> > | 7   |  128            | 4          |
> > | 8   |  256            | 8          |
> > | 9   |  512            | 8          |
> > | 10  |  1024           | 8          |
> > | 11  |  2048           | 16         |
> > | 12  |  4096           | 16         |
> > | 13  |  8192           | 16         |
> > | 14  |  16384          | 32         |
> > | 15  |  32768          | 32         |
> > | 16  |  65536          | 64         |
> > | 17  |  131072         | 64         |
> > | 18  |  262144         | 64         |
> > | 19  |  524288         | 32         |
> > | 20  |  1048576        | 32         |
> > | 21  |  2097152        | 32         |
> > | 22  |  4194304        | 32         |
> > | 23  |  8388608        | 32         |
> > | 24  |  16777216       | 1          |
> > |     | Total Entries   | 511        |
> >  -----+-----------------+------------+
> >=20
> > Credits: Special mention and credits to Ville Syrjala for coming up
> > with a design for this feature and inputs. This series is based on
> > his original design.
> >=20
> > Note: Userspace support for this new UAPI will be done on Chrome and
> > plan is to get this supported on mutter as well. We will notify the
> > list once we have that ready for review.
> >  =20
>=20
> Is this an RFC? If so it would be good to mark it as such.
>=20
> Harry
>=20
> > Uma Shankar (9):
> >   drm: Add gamma mode property
> >   drm/i915/xelpd: Define color lut range structure
> >   drm/i915/xelpd: Add support for Logarithmic gamma mode
> >   drm/i915/xelpd: Attach gamma mode property
> >   drm: Add Client Cap for advance gamma mode
> >   drm/i915/xelpd: logarithmic gamma enabled only with advance gamma mode
> >   drm/i915/xelpd: Enable Pipe Degamma
> >   drm/i915/xelpd: Add Pipe Color Lut caps to platform config
> >   drm/i915/xelpd: Enable XE_LPD Gamma Lut readout
> >=20
> >  drivers/gpu/drm/drm_atomic_uapi.c          |   8 +
> >  drivers/gpu/drm/drm_color_mgmt.c           |  75 ++++
> >  drivers/gpu/drm/drm_ioctl.c                |   5 +
> >  drivers/gpu/drm/i915/display/intel_color.c | 454 ++++++++++++++++++++-
> >  drivers/gpu/drm/i915/i915_pci.c            |   3 +-
> >  drivers/gpu/drm/i915/i915_reg.h            |   7 +
> >  include/drm/drm_atomic.h                   |   1 +
> >  include/drm/drm_color_mgmt.h               |   8 +
> >  include/drm/drm_crtc.h                     |  25 ++
> >  include/drm/drm_file.h                     |   8 +
> >  include/uapi/drm/drm.h                     |   8 +
> >  include/uapi/drm/drm_mode.h                |  43 ++
> >  12 files changed, 630 insertions(+), 15 deletions(-)
> >  =20
>=20


--Sig_/KI4E/K1vbHM16sqc.qGZXfD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmC9yucACgkQI1/ltBGq
qqfILw//WJ1QBvfbpHEcLkjayGRhul9TCzrHG0W3x8RLTWUrA04t9t0q5AexJNpV
4taoSRxJ4hSbPxxbnyVQCjhBarnhBSIvn/IvnFOF+bN3/9hE1RQ/jrdr7W7OEeGy
e8jDnCgZzXXIqFZeoOmHRs3oVUNje9pbFN0jFG1QlC0acMzqoar5ISKO16WwIg60
+9KKsdV99h70h4ZvQMdwOKWEwB5nQWtWu+3GFX1SFN32gfWRxCedhyHLCl8Uymev
lBLq47Mo7vQGrne1fLm0xoNJ6SlrzUXMzAlbHkxqWZ6A/oeu6TC7mt2knK8Yx5Bg
k1QPVK6e0fwemsf37K5PBUKXPYMzys83u8ThVrL/JAks3rxgYe+hJQm+D0PpUr+U
lWm2kbeJxreHjEVotJuwoFqkgNDgrLZ/C+hu/kojehl4Rw2Jv0B9HkRjXDh1yg7E
uFuu4lNf51IeUwhJU62YHGyWu8j5Ps4BX48fHjx2WHF/4bC9errhwGDimkIuKW2v
6hyRr+WMcX1DwAgz2ZzTFoAoX3h5apy5IUPv1CdhTYoAjr28mcF9RyX7m8wjxL2W
vEzRlgZTf+qnMG02pQgw3OfqtQgQgUN4+s06SjnxiYA/xoQvsSoHua5joUGf/h9X
72bGu1vO5RFTQLRUrqS/IIMzsIQocaSrgmF5Zclu/SW7e+TzzJk=
=MFmg
-----END PGP SIGNATURE-----

--Sig_/KI4E/K1vbHM16sqc.qGZXfD--
