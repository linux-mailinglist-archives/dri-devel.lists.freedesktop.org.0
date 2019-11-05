Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 703B8EF9C2
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2019 10:42:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCA2E6E972;
	Tue,  5 Nov 2019 09:42:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF06D6E972;
 Tue,  5 Nov 2019 09:42:25 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id s1so20551835wro.0;
 Tue, 05 Nov 2019 01:42:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=l5LRN7Dvl/WqsUVGb5xWF7E3mv2WtmwuuLJJUoMyRMU=;
 b=plwSkmm2EdC1ZlQTUbKq1HGwcfdHW/OraufVeXDddZWTQxIjV1oUg66FBPG7jMrtRB
 xGRXYfPqEGJJk3NWwGoMtNUZGScJhA9WdqjgGmeOwfYiQFffSdhwD65+8X7nSisydBId
 qcMqJnEgao46tjEdVGav50quI8f67ufvbzNBJFUoIdZlHvjIb6G87BXa1MLHRRPcLHQR
 w24MJe6yuCBnicC9q4arj4hwTrl8/tu69UD1yUq+kEnkJoB5nnkrSpxmimJhHTM7Y8r/
 6cCFyU4wMMzFj8JiFrFtEZhn6Z1Rvk4pfwtSrFDdBRK523mDhdAtal67wypAiYcFx4rh
 LMwQ==
X-Gm-Message-State: APjAAAV7ikEYQ2RR2vHIbcVruCClLmT0VPtcSPKluiaA18MTe3oMumAR
 LMGqLTNRNJAVH31Dzi8rCsibeunD
X-Google-Smtp-Source: APXvYqw6lE9yR09Dt5lccilPWbDq/2UoIiPHtSPktyH7WX3zY8JoszMy4z2chiDt4nQ90aJKb6391w==
X-Received: by 2002:adf:f388:: with SMTP id m8mr23563875wro.18.1572946944457; 
 Tue, 05 Nov 2019 01:42:24 -0800 (PST)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id z15sm19602930wrr.19.2019.11.05.01.42.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2019 01:42:23 -0800 (PST)
Date: Tue, 5 Nov 2019 10:42:21 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [Intel-gfx] [PATCH v2 4/5] drm/dsi: rename
 MIPI_DCS_SET_PARTIAL_AREA to MIPI_DCS_SET_PARTIAL_ROWS
Message-ID: <20191105094221.GB1607358@ulmo>
References: <20191028150047.22048-1-jani.nikula@intel.com>
 <20191028150047.22048-4-jani.nikula@intel.com>
MIME-Version: 1.0
In-Reply-To: <20191028150047.22048-4-jani.nikula@intel.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=l5LRN7Dvl/WqsUVGb5xWF7E3mv2WtmwuuLJJUoMyRMU=;
 b=d+ILKiCgjzPqB3cylly4kl5m1v2Tcn4bYlVxuaKIC1vtDDtkk/nRv5wb7givrJNIGB
 oXREXh0xuJeHfsVuDagDrxF2e5+OZ50gbh90SpcN6pfDL/Npkx8bijI3bStM7jLPJxJP
 kGgnp6geVbJmHLmJ3bI/JfytN7LIAtTMMD6r1MtAHpsxxgdmsOJZ7az5e5ieCMiDb9rz
 f0h5le8Na5lI3IWkadJYctqLHbJp5Ilwf51P09mmXWTPg/XYZZwCFCj9KTk5CwY+GRIz
 wXAQf4RKiuco3GBHkY04tPvEGeLZeaJ3RJCE/IyRsLZUcz9dvvNRaCnKckaIcpml1jcp
 O9Qg==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: intel-gfx@lists.freedesktop.org, David Lechner <david@lechnology.com>,
 dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1293910310=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1293910310==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ftEhullJWpWg/VHq"
Content-Disposition: inline


--ftEhullJWpWg/VHq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 28, 2019 at 05:00:46PM +0200, Jani Nikula wrote:
> The DCS command has been named SET_PARTIAL_ROWS in the DCS spec since
> v1.02, for more than a decade. Rename the enumeration to match the spec.
>=20
> v2: add comment about the rename (David Lechner)
>=20
> Cc: David Lechner <david@lechnology.com>
> Cc: Vandita Kulkarni <vandita.kulkarni@intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/tiny/st7586.c | 2 +-
>  include/video/mipi_display.h  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Thierry Reding <treding@nvidia.com>

--ftEhullJWpWg/VHq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3BQ/sACgkQ3SOs138+
s6ERZxAAuI/Sgs4RWr9zVwM3mxaE2Kv74y7767o3CaCiRBpOWy+W7mF+GgHD0IId
7jINrYF1PQK9iaLNY/VmZLp+pqvECInxRuNE/6IgukYPtnXDYi8UITSMAY2MROvi
Af2tkzlSzRP2+UNohuY+4eY0orEycyrpVlcL/dvORZt0y/GOvjgHFdY56ugIR0uJ
NsxHBSED9ZFVjSOXhJKxeFIGxoXOZ68na9Sfc5TtPjiGAwpfLGK5ln4x7I/+bNpp
KlYbb7WUFsY/YIqYf6iaIRF7vg83jKETGPU2Yh3TtEa6Xwiz0MxMQ+XWb2dOLvfi
fLxIXgN/Gj8bRvZnPd1+TobFMFhWJoQ3TKHTIcN70qpR194G4KydQrXLdI79e0z3
eZ8POC0XEn6xnepl5q1hXeJyfhNAxLL40J+XHFCjW+Qql0psY1abxLVC1WFJfw9M
vO7TGlCcm8t5wv35gzmtXgSURe52+LV0oWaTHghb5X9lVvdmL9Y29OZDxpA7tZlw
Cyw5BjWa9F30BS7UNuLdy/SUsMGGFHNlhhAsKI7kW5Za70VSPJQyCv8lFlIyE0Va
Yj9pHKbX0LunTjgSHOaSLaUzd8vlqTzuAorDLj82ExzQ/pIPpDvzx2SbbL4u1Cxw
Woh7RU3aLzBvvZ2xfWA2FB6YzFfDuhAawLd5vcLAH3wgNQkvfr8=
=MX29
-----END PGP SIGNATURE-----

--ftEhullJWpWg/VHq--

--===============1293910310==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1293910310==--
