Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C718398547
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 11:29:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA5F96E3AA;
	Wed,  2 Jun 2021 09:28:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 711C86E342;
 Wed,  2 Jun 2021 09:28:55 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id e11so1701507ljn.13;
 Wed, 02 Jun 2021 02:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=M194TrS8bcD9yZ374WYAbnYqYQmXXMUwq5hbG1LKbbI=;
 b=Cvubv3hrkV8pnrF9fd8fgRIgKXsMg4xWaazZ4KFAAgKQfXV+tvAtchazY/+vLWNTC4
 y1o/FhcNkoA7KGjcDJ43VhXA3n+pSNKMStzEZLnj14umhcBfui0bQqf2PYRM5geb29H/
 b1aQMmvFl7Z+sMFwItV8v8To213ci1d9MmqJsWDIz+jfQkwmYXBy0e0yhmO5mzgmsUum
 8fi9YCLS11jQXLYugoJiOxpK/I4BwI9PqexyEuAdCs46weA+2+dbfyWdv5sWMLsVyRAR
 M4yiHBSp9WOFNIOiKtj3A6JeJxvT2KPW/MMUeYRMKYHUWiOPEa+fAznZvD04/WdArbDx
 TQIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=M194TrS8bcD9yZ374WYAbnYqYQmXXMUwq5hbG1LKbbI=;
 b=Me8pKPd3vXgt9ozC1jWktKceactKtN63Wb1R0t2TNodaekmBPSgyldscaQUaJdA0rP
 LU4+BCtqDlNgrqvF/jfpoL73n3bxKOWRj6e+cCC5rIQwnj90hWddJr2IqXEwyHShFIR+
 Cx9jF/ahtf+RvImv5grF5rMB65xdWEupyid10U8a0p0Q7g0JFQGrpDfrw9YNJbveSdtU
 kJxIBwql1fwVuZ7/gZ90oRG//fT9Oh5Z/dH8zNQSRnxPES9HHjV8MmhpEEzAvznb8yU2
 SXgGhWi1UnAP7WZrgqwe1jUTSnr1MHXSuOxW/HBgA97TbPnJsGBUkYMPB+SzkW/5712o
 PkYQ==
X-Gm-Message-State: AOAM532/Cd7J/9HECFdwMMdbE7GCHfCIhFo1pvg327LhRY3U/fQzxqZy
 odNX+Sa0K01tcGSQhriOKbw=
X-Google-Smtp-Source: ABdhPJxI1iDKl354xhC/C/tCOy4/GoJ2BxK6BrPrYklMca2vRk4pecvpEAQbUcJDYmGxdFm/WHxkfQ==
X-Received: by 2002:a05:651c:151:: with SMTP id
 c17mr2434843ljd.314.1622626133888; 
 Wed, 02 Jun 2021 02:28:53 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id u4sm2134895lfl.100.2021.06.02.02.28.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 02:28:53 -0700 (PDT)
Date: Wed, 2 Jun 2021 12:28:50 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Uma Shankar <uma.shankar@intel.com>
Subject: Re: [PATCH 00/21] Add Support for Plane Color Lut and CSC features
Message-ID: <20210602122850.29412a29@eldfell>
In-Reply-To: <20210601105218.29185-1-uma.shankar@intel.com>
References: <20210601105218.29185-1-uma.shankar@intel.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/31hJ5jTLg3OyoeedSz07hM."; protocol="application/pgp-signature"
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 bhanuprakash.modem@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/31hJ5jTLg3OyoeedSz07hM.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue,  1 Jun 2021 16:21:57 +0530
Uma Shankar <uma.shankar@intel.com> wrote:

> This is how a typical display color hardware pipeline looks like:
>  +-------------------------------------------+
>  |                RAM                        |
>  |  +------+    +---------+    +---------+   |
>  |  | FB 1 |    |  FB 2   |    | FB N    |   |
>  |  +------+    +---------+    +---------+   |
>  +-------------------------------------------+
>        |  Plane Color Hardware Block |
>  +--------------------------------------------+
>  | +---v-----+   +---v-------+   +---v------+ |
>  | | Plane A |   | Plane B   |   | Plane N  | |
>  | | DeGamma |   | Degamma   |   | Degamma  | |
>  | +---+-----+   +---+-------+   +---+------+ |
>  |     |             |               |        |
>  | +---v-----+   +---v-------+   +---v------+ |
>  | |Plane A  |   | Plane B   |   | Plane N  | |
>  | |CSC/CTM  |   | CSC/CTM   |   | CSC/CTM  | |
>  | +---+-----+   +----+------+   +----+-----+ |
>  |     |              |               |       |
>  | +---v-----+   +----v------+   +----v-----+ |
>  | | Plane A |   | Plane B   |   | Plane N  | |
>  | | Gamma   |   | Gamma     |   | Gamma    | |
>  | +---+-----+   +----+------+   +----+-----+ |
>  |     |              |               |       |
>  +--------------------------------------------+
> +------v--------------v---------------v-------|
> ||                                           ||
> ||           Pipe Blender                    ||
> +--------------------+------------------------+
> |                    |                        |
> |        +-----------v----------+             |
> |        |  Pipe DeGamma        |             |
> |        |                      |             |
> |        +-----------+----------+             |
> |                    |            Pipe Color  |
> |        +-----------v----------+ Hardware    |
> |        |  Pipe CSC/CTM        |             |
> |        |                      |             |
> |        +-----------+----------+             |
> |                    |                        |
> |        +-----------v----------+             |
> |        |  Pipe Gamma          |             |
> |        |                      |             |
> |        +-----------+----------+             |
> |                    |                        |
> +---------------------------------------------+
>                      |
>                      v
>                Pipe Output

Hi,

this is an excellent picture. I have long been wanting schematics like
that in the DRM UAPI documentation. Another note on that:
https://lists.freedesktop.org/archives/dri-devel/2021-May/307310.html

But the schematic for DRM UAPI documentation needs to be written in
terms of the abstract KMS pipeline with property names spelled out,
like in what Ville sketched in that email.

> This patch series adds properties for plane color features. It adds
> properties for degamma used to linearize data and CSC used for gamut
> conversion. It also includes Gamma support used to again non-linearize
> data as per panel supported color space. These can be utilize by user
> space to convert planes from one format to another, one color space to
> another etc.

This is very much welcome!

There is also the thread:
https://lists.freedesktop.org/archives/dri-devel/2021-May/306726.html

Everything mentioned will interact with each other by changing what the
abstract KMS pixel pipeline does. I think you and Harry should probably
look at each others' suggestions and see how to fit them all into a
single abstract KMS pipeline.

People are adding new pieces into KMS left and right, and I fear we
lose sight of how everything will actually work together when all KMS
properties are supposed to be generic and potentially present
simultaneously. This is why I would very much like to have that *whole*
abstract KMS pipeline documented with *everything*. Otherwise it is
coming really hard fast to figure out how generic userspace should use
all these KMS properties together.

Or if there cannot be a single abstract KMS pipeline, then sure, have
multiple, as long as they are documented and how userspace will know
which pipeline it is dealing with, and what things are mutually
exclusive so we can avoid writing userspace code for combinations that
will never exist.


Thanks,
pq

> Userspace can take smart blending decisions and utilize these hardware
> supported plane color features to get accurate color profile. The same
> can help in consistent color quality from source to panel taking
> advantage of advanced color features in hardware.
>=20
> These patches add the property interfaces and enable helper functions.
> This series adds Intel's XE_LPD hw specific plane gamma feature. We
> can build up and add other platform/hardware specific implementation
> on top of this series.
>=20
> Credits: Special mention and credits to Ville Syrjala for coming up
> with a design for this feature and inputs. This series is based on
> his original design and idea.
>=20
> Note: Userspace support for this new UAPI will be done on Chrome. We
> will notify the list once we have that ready for review.
>=20
> ToDo: State readout for this feature will be added next.
>=20
> Uma Shankar (21):
>   drm: Add Enhanced Gamma and color lut range attributes
>   drm: Add Plane Degamma Mode property
>   drm: Add Plane Degamma Lut property
>   drm/i915/xelpd: Define Degamma Lut range struct for HDR planes
>   drm/i915/xelpd: Add register definitions for Plane Degamma
>   drm/i915/xelpd: Enable plane color features
>   drm/i915/xelpd: Add color capabilities of SDR planes
>   drm/i915/xelpd: Program Plane Degamma Registers
>   drm/i915/xelpd: Add plane color check to glk_plane_color_ctl
>   drm/i915/xelpd: Initialize plane color features
>   drm/i915/xelpd: Load plane color luts from atomic flip
>   drm: Add Plane CTM property
>   drm: Add helper to attach Plane ctm property
>   drm/i915/xelpd: Define Plane CSC Registers
>   drm/i915/xelpd: Enable Plane CSC
>   drm: Add Plane Gamma Mode property
>   drm: Add Plane Gamma Lut property
>   drm/i915/xelpd: Define and Initialize Plane Gamma Lut range
>   drm/i915/xelpd: Add register definitions for Plane Gamma
>   drm/i915/xelpd: Program Plane Gamma Registers
>   drm/i915/xelpd: Enable plane gamma
>=20
>  Documentation/gpu/drm-kms.rst                 |  90 +++
>  drivers/gpu/drm/drm_atomic.c                  |   1 +
>  drivers/gpu/drm/drm_atomic_state_helper.c     |  12 +
>  drivers/gpu/drm/drm_atomic_uapi.c             |  38 ++
>  drivers/gpu/drm/drm_color_mgmt.c              | 177 +++++-
>  .../gpu/drm/i915/display/intel_atomic_plane.c |   6 +
>  .../gpu/drm/i915/display/intel_atomic_plane.h |   2 +
>  drivers/gpu/drm/i915/display/intel_color.c    | 513 ++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_color.h    |   2 +
>  .../drm/i915/display/skl_universal_plane.c    |  15 +-
>  drivers/gpu/drm/i915/i915_drv.h               |   3 +
>  drivers/gpu/drm/i915/i915_reg.h               | 176 +++++-
>  include/drm/drm_mode_object.h                 |   2 +-
>  include/drm/drm_plane.h                       |  81 +++
>  include/uapi/drm/drm_mode.h                   |  58 ++
>  15 files changed, 1170 insertions(+), 6 deletions(-)
>=20


--Sig_/31hJ5jTLg3OyoeedSz07hM.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmC3T1IACgkQI1/ltBGq
qqfCvA//bbl5B3LEsCaWaE3Zy7KrzTIBY3dND2M6tt2soXtzv1p14YEB8ei6kGjm
S4vc06P5qYCRj3dlj6nWW9gAAl8IKVFu20a0zUfBwZts4eOT3/wqFzeI0LTJTANg
VEdFK1eFJAntDb15VYky6CrNaVKS8VzwbNonSaptWg2U64FWFFNhdKKoipdH2Pqv
GbncerDI4QxCyZ9Y9h21cdR6OyAHm2Ih55I/7CXquthQvbCHudDl3WLLj7Q2dKD5
m6mISCON7RrELzFrKJpIm+dz2l2O9AAMzBRZ62kPx86iAHD+GYE4wQif6+l8pMSF
T6DtDK2F4aCrshSthcVhehq28TSeKj1O1lY6zu5r+iCk9fi6epuUvGD5Dk8KKqlV
6ZVXIhgcogNikjoZ/TRs8fOjO9XubT/H+uzqmofC8Z007A+PB2DoGG7qzXM+FHuY
AvSkUov1+HYP5Jo5HyOnAyFCU7aeStfAZp104dEJY0NVQwCyftCdQIguhLd9gv8t
K9snvCf2aSzC55wrRl5qxSdKFk01KEfvKClFOkE9vMgS0LkU8cKYOIdFHmrupnNC
cGU4DejMI9XPCF4nyVmwM0QcSTU6pUk4AbTJjdANwx8z0SW0cCRlJrm90YyYJOXl
lf6zx303Mldaq2uG28dV4W+sT0R9iFMUoyezQq0Rv1tntEHZET4=
=iZ+4
-----END PGP SIGNATURE-----

--Sig_/31hJ5jTLg3OyoeedSz07hM.--
