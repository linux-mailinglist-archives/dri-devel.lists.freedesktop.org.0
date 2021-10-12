Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A93B842A3A5
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 13:50:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A5DF6E92B;
	Tue, 12 Oct 2021 11:50:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C2196E838;
 Tue, 12 Oct 2021 11:50:16 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id j5so86761510lfg.8;
 Tue, 12 Oct 2021 04:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=SrntpRbu5QulyzSvxwN8r/CdV/rdDhc5Kc2yPQ6QOuU=;
 b=m1tyPinjSb2LtDW6Egf+VpQcfsg+4hJEdZXf9i61YIi39CACC7h5oPHvjZlB9sZA5W
 YCesBQ+F53gepArtoSK9wewqdlc+uhCZ+Rq8JEFk7tYkTBnMExY2a68OlqhCckSb2Rbl
 zdC0jsJyXF5nnIiOT7v4zi7PKXxfovp4fcZavNWSgP00AmAv1WRcEF8PtylMiUqdBpeC
 Q5qw+wDTL35hZlKUhhDqBRQRPjb8adPVBV+Qq2OHmbAaZdqlb83xOIVHx6jhcaTRqaY4
 VuhurgPU4mdaahyFukEKwmAmFlbwHAgksneDUkQQYBjcTXL6lDph01tIWkC/Na/9HJhX
 eeAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=SrntpRbu5QulyzSvxwN8r/CdV/rdDhc5Kc2yPQ6QOuU=;
 b=5vHfSN/DsKwGHBV1loKHNXuC0IdwnWIm6EXUEJWVR/PF+Y0wsTZxMYixHUPBg7Gcrt
 S207ZEnKOMKfb/8IKQNoOF+G/WMwiu5IIZWkuYWOyYN6NrlZ6/aR0HcUHEgzf3oBzq/K
 3L9sdOxs+PdoVn/fSXKQNeemc3aCudbPkCtNl/6RmegDI451zQYVgY2Iq8KkjFExnhSo
 1XGB1JjHRrdNFdWGjNr/wUg0PbRL5K8Lyk+EhOFTcHUopUS0LozYYnCZ8Jqxnq/L/cOC
 jHjBmy+2Jkof2s5UsDB0jR+FFKnzPnRZ1UFBQEofM+Qhc2gHcwCEdxM/MybGC/luPEYj
 yi/A==
X-Gm-Message-State: AOAM5314Jpob2dOVEMG3jW84DVg2Es89AN/c9AocK2xFkdVmXiCmbKZh
 n2sbJr0XdlBhcEK6hR3fIrc=
X-Google-Smtp-Source: ABdhPJy4BjM5X0NzZyDDEFzM0UbY45cxv/qVwsR7/vuzQNlakh+VGE+qIFlHA+5xF94ZfnD36Rp5hQ==
X-Received: by 2002:a2e:8e8a:: with SMTP id z10mr27134137ljk.243.1634039414425; 
 Tue, 12 Oct 2021 04:50:14 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id s17sm967463ljc.95.2021.10.12.04.50.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 04:50:14 -0700 (PDT)
Date: Tue, 12 Oct 2021 14:50:02 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Uma Shankar <uma.shankar@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 harry.wentland@amd.com, ville.syrjala@linux.intel.com,
 brian.starkey@arm.com, sebastian@sebastianwick.net, Shashank.Sharma@amd.com
Subject: Re: [RFC v2 03/22] drm: Add Plane Degamma Mode property
Message-ID: <20211012145002.4382df2b@eldfell>
In-Reply-To: <20210906213904.27918-4-uma.shankar@intel.com>
References: <20210906213904.27918-1-uma.shankar@intel.com>
 <20210906213904.27918-4-uma.shankar@intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yzuO+SoAZmC5pV0ldD9RNJ5";
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/yzuO+SoAZmC5pV0ldD9RNJ5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue,  7 Sep 2021 03:08:45 +0530
Uma Shankar <uma.shankar@intel.com> wrote:

> Add Plane Degamma Mode as an enum property. Create a helper
> function for all plane color management features.
>=20
> This is an enum property with values as blob_id's and exposes
> the various gamma modes supported and the lut ranges. Getting
> the blob id in userspace, user can get the mode supported and
> also the range of gamma mode supported with number of lut
> coefficients. It can then set one of the modes using this
> enum property.
>=20
> Lut values will be sent through separate GAMMA_LUT blob property.
>=20
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> ---
>  Documentation/gpu/drm-kms.rst             | 90 ++++++++++++++++++++++
>  drivers/gpu/drm/drm_atomic.c              |  1 +
>  drivers/gpu/drm/drm_atomic_state_helper.c |  2 +
>  drivers/gpu/drm/drm_atomic_uapi.c         |  4 +
>  drivers/gpu/drm/drm_color_mgmt.c          | 93 ++++++++++++++++++++++-
>  include/drm/drm_mode_object.h             |  2 +-
>  include/drm/drm_plane.h                   | 23 ++++++
>  7 files changed, 212 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
> index 1ef7951ded5e..f4658417bf20 100644
> --- a/Documentation/gpu/drm-kms.rst
> +++ b/Documentation/gpu/drm-kms.rst
> @@ -545,9 +545,99 @@ Damage Tracking Properties
>  Color Management Properties
>  ---------------------------
> =20
> +Below is how a typical hardware pipeline for color
> +will look like:
> +
> +.. kernel-render:: DOT
> +   :alt: Display Color Pipeline
> +   :caption: Display Color Pipeline Overview
> +
> +   digraph "KMS" {
> +      node [shape=3Dbox]
> +
> +      subgraph cluster_static {
> +          style=3Ddashed
> +          label=3D"Display Color Hardware Blocks"
> +
> +          node [bgcolor=3Dgrey style=3Dfilled]
> +          "Plane Degamma A" -> "Plane CSC/CTM A"
> +          "Plane CSC/CTM A" -> "Plane Gamma A"
> +          "Pipe Blender" [color=3Dlightblue,style=3Dfilled, width=3D5.25=
, height=3D0.75];
> +          "Plane Gamma A" -> "Pipe Blender"
> +	  "Pipe Blender" -> "Pipe DeGamma"
> +          "Pipe DeGamma" -> "Pipe CSC/CTM"
> +          "Pipe CSC/CTM" -> "Pipe Gamma"
> +          "Pipe Gamma" -> "Pipe Output"
> +      }
> +
> +      subgraph cluster_static {
> +          style=3Ddashed
> +
> +          node [shape=3Dbox]
> +          "Plane Degamma B" -> "Plane CSC/CTM B"
> +          "Plane CSC/CTM B" -> "Plane Gamma B"
> +          "Plane Gamma B" -> "Pipe Blender"
> +      }
> +
> +      subgraph cluster_static {
> +          style=3Ddashed
> +
> +          node [shape=3Dbox]
> +          "Plane Degamma C" -> "Plane CSC/CTM C"
> +          "Plane CSC/CTM C" -> "Plane Gamma C"
> +          "Plane Gamma C" -> "Pipe Blender"
> +      }
> +
> +      subgraph cluster_fb {
> +          style=3Ddashed
> +          label=3D"RAM"
> +
> +          node [shape=3Dbox width=3D1.7 height=3D0.2]
> +
> +          "FB 1" -> "Plane Degamma A"
> +          "FB 2" -> "Plane Degamma B"
> +          "FB 3" -> "Plane Degamma C"
> +      }
> +   }
> +
> +In real world usecases,
> +
> +1. Plane Degamma can be used to linearize a non linear gamma
> +encoded framebuffer. This is needed to do any linear math like
> +color space conversion. For ex, linearize frames encoded in SRGB
> +or by HDR curve.

Hi,

Maybe better to avoid the term "gamma" as the curves are not always a
pure power function.

sRGB with a small s.


Thanks,
pq

> +
> +2. Later Plane CTM block can convert the content to some different
> +colorspace. For ex, SRGB to BT2020 etc.
> +
> +3. Plane Gamma block can be used later to re-apply the non-linear
> +curve. This can also be used to apply Tone Mapping for HDR usecases.
> +
> +All the layers or framebuffers need to be converted to same color
> +space and format before blending. The plane color hardware blocks
> +can help with this. Once the Data is blended, similar color processing
> +can be done on blended output using pipe color hardware blocks.
> +
> +DRM Properties have been created to define and expose all these
> +hardware blocks to userspace. A userspace application (compositor
> +or any color app) can use these interfaces and define policies to
> +efficiently use the display hardware for such color operations.
> +
> +Pipe Color Management Properties
> +---------------------------------
> +
>  .. kernel-doc:: drivers/gpu/drm/drm_color_mgmt.c
>     :doc: overview
> =20
> +Plane Color Management Properties
> +---------------------------------
> +
> +.. kernel-doc:: drivers/gpu/drm/drm_color_mgmt.c
> +   :doc: Plane Color Properties
> +
> +.. kernel-doc:: drivers/gpu/drm/drm_color_mgmt.c
> +   :doc: export
> +
>  Tile Group Property
>  -------------------

--Sig_/yzuO+SoAZmC5pV0ldD9RNJ5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmFldmoACgkQI1/ltBGq
qqfefw/7BKjSH3433NX1MYdHBkgCZlATemhiWNUx1ayBHA96Am8KSnY4dxgTLLqD
/9OptPJWQMcL7ae9l1atPEwakAuG8g6sa+XC4LIAjmyBhm5e9lqQoWo8eOvBTUKP
ZgbCLRfj0YSNrtUmmtBwo5YS37BgYW3K+bt68dzE3GnBCmp4i5Y9Jg3qF1CEFIaM
GirYwWJlqdTnmro0Q9YoCul5qli6C2pT64fgr4H7efuSunJA/DWO9JNJ2gXO9jhS
T6eh9hVR0/EA9w8TqUIlFDmVpxKAvYlYDe07DsYv/3DEy9Qgqv+XSAwuOOQaqTL6
pCyRk/lCSvrGGuKVH6JrAR/KGx6mYnE94fIgB1XuyTDARsn0edAedTMQMfcu6g4v
2N4KyGKGVqQpO1JrBXcD65pzhwoRQo70AlvgmiCJYQLqyHNpJDcuNX1XS52T7flB
TIZGvHcWi2l+SH8lGM1aE61IT+WCgrd/BkBcxYexsRhk/iWpG3WL4NmSOvBJzQdU
X5ktAn+Pe/6oU5ib9xhAruhzGvo2PO0SbaJ7pPjfZf3DJ6cdT9oSA1kEqkp1EO7/
5WhTbQhb3pp0+6561i36xeqR1HqPSuhGEp5toLd7EAvwKFklELshkeI9DDU8k0Vs
z8QJUpOh9US7Dz2nR5cqFJkfqFGfcNJpRaRPTFdgH1M+owVXT6k=
=M6jS
-----END PGP SIGNATURE-----

--Sig_/yzuO+SoAZmC5pV0ldD9RNJ5--
