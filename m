Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 246C220B1EE
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jun 2020 15:00:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9278C89E1D;
	Fri, 26 Jun 2020 13:00:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E08E89E1D
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 13:00:40 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id s9so10197175ljm.11
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 06:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=wcUDZIUFugUpa9+wrTgwTZBKNibeddZnDP3zraRy5sc=;
 b=dPhI8FRRiTeuuC4BWBvnmLmEbGkMbnv/1gQ7HI1TF3t4hNtdnaVI8o4+ADDmlfg7Hb
 5UnBHalyiNaVWOV5JJUVZLA3Y8S1h1kDSRaizlZCM2GGE90ey8NM4XVH3WU0KFOv0Foq
 JbipFmRfub+ennaEZhfW8v6a5hwkTC/OApq1znFfC3cH3jH0HYPC7sWGuwVX/Dc9fDIc
 I7aZPwKopQ6yAvtXBTsCm8OdbSA2XgySAjgwkRDi7ulByodjYtsvDkygrB0jG2Qj4Pnu
 x42mdTCTMmslHNysVJpFiJmXvPt9sd3SscZ4yvOQ87mgFKb0Rx8KTE6i6hF922DPK5Gb
 kBug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=wcUDZIUFugUpa9+wrTgwTZBKNibeddZnDP3zraRy5sc=;
 b=WRmi4Xq11rlrEdHRh7ty+3E4jXksRC8mJrpuix4IFSPQtE6CZlCmdnjJnKgN5Tumdm
 yOM5/fujkq8yJai53+tdcS0flJw8RiwqWvm9b338TwseJN08bH/KPw5cplyTQ31ZpVgn
 8vcRF7CmCziROVyQaQR6DW6aKpl/8L5gyZpNCI4MY+UAZTjuEvLdGDgtIfB/uKhlQE7Y
 2Zbvaso9o3YTu6UCMWQqYs8ToGG0gMU18wlolhX26A1CuJ3gY2ayeeuk5xJ5U48MGdUG
 FvACr3zbn81ut8y5tNFEtB2xr63Fm4t7W78xuZg4kuKqOMGsBEsTEnVpXX9i17aJaTCl
 sg5A==
X-Gm-Message-State: AOAM533LUv4rG8m4fWRv1GaTRmNnYG00b3ZXkL+fxziXhkqOghzyKevm
 eGmmJyp3e9XW1fgU5T17PHE=
X-Google-Smtp-Source: ABdhPJz7Goo4GiOmub19oxlnY9bxKUBx1435h9lyZ3tYgVrZQoCT2RJ4YMzOEz3Hj2stZRT/gxTQdA==
X-Received: by 2002:a2e:8601:: with SMTP id a1mr1281899lji.255.1593176438641; 
 Fri, 26 Jun 2020 06:00:38 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id j8sm410563ljo.10.2020.06.26.06.00.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2020 06:00:38 -0700 (PDT)
Date: Fri, 26 Jun 2020 16:00:28 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [RFC] drm: expose connector status values in uapi
Message-ID: <20200626160028.1b26ee37@eldfell>
In-Reply-To: <4MY6RJHdVv-Ad6CY6Ds1G3aXoDmtABtBaIQHoC3Rfaj5zJ6WV3fOzFOZnIrKczKBcdh4gTHljlRRDaoKKa2vCUzW5TTYNobB5p3BcRdLwdw=@emersion.fr>
References: <-LYZxtmyBTf36wklyxa0PphDQ1FecAgEF7TMnSvyCm9Y_EFmz-4AUROX6qc4HKUjomE0HumDgVrSIbHsUMJnRSrBR2c3gPCVDNUmz7klPkE=@emersion.fr>
 <20200626121541.31835549@eldfell>
 <4MY6RJHdVv-Ad6CY6Ds1G3aXoDmtABtBaIQHoC3Rfaj5zJ6WV3fOzFOZnIrKczKBcdh4gTHljlRRDaoKKa2vCUzW5TTYNobB5p3BcRdLwdw=@emersion.fr>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0524157546=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0524157546==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/83ZHIOjo2E07rmmD5Mrb7Gb"; protocol="application/pgp-signature"

--Sig_/83ZHIOjo2E07rmmD5Mrb7Gb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 26 Jun 2020 12:05:16 +0000
Simon Ser <contact@emersion.fr> wrote:

> On Friday, June 26, 2020 11:15 AM, Pekka Paalanen <ppaalanen@gmail.com> w=
rote:
>=20
> > I have no opinion really if adding yet another set of the same
> > definitions is good or not. We do need the UAPI doc, but that does not
> > necessarily mean we also need definition code in UAPI headers.
> >
> > I give this one a shrug. =20
>=20
> But then uapi docs don't document uapi, instead document internal
> kernel enums? And also user-space not using libdrm needs to have these
> hardcoded somewhere.

DRM properties are already like this. You don't find property names or
enum value names in UAPI headers, you only find them in UAPI docs.

> The libdrm re-definitions are annoying. Maybe a better way forward
> would be to have a "status" prop, which could then also be used for
> the planned fine-grained uapi events.

That might be nice.


Thanks,
pq

--Sig_/83ZHIOjo2E07rmmD5Mrb7Gb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl718WwACgkQI1/ltBGq
qqf4eQ//SYbpFyeG0OVIiNosCyvw+hqU/CSjYDGAICn/LYdqXSr7apSs52pWHIlS
CTSRN/5cG9RU/BbWUP82+QpD6JwoN8n60gu77mNeA6B8ig/k3gtkbIAOgSX2O1te
I4JqNfHJ0s+fSohTSrTfTXHmprbyEnlEIAJ9IObwrGeBxsT5nG/3JfN5T2BmKwTT
nBT+7Oh3BWBgi6nEcJOhPVxaW2QbjUl5k0ZspkEFPj866xbRZobvYaEBkbsLuJ4E
zGtjY2l3r+1ZGIz/4du9F6lUMc8Svde5Y+sxiXZfeKnv5vlpEcEbjbinQoK3HmLZ
ZlRT8DANv5QV18UTWFNr25EfQibP5mSEQm2ZCjbBvubBqMO2Ht3R1faMGHAsTIXA
7a9JlAfCDlPqufeCQ4cq/N7YtZZYNXPnJBkSttaA+S4wFeIRNNt9fVeiMGhFPkc+
GGDitlt30rsKVX9MQn6qJNOC9f501Zslva2jfjlnYw8fttAEM09PXnKZ36JZ41Lt
oNmLX5curybOr4aU7Bk/vOBTFgIcw9Q19uiW72FyMarXL4Y1uObpSKEeODgVmOQS
7WImou5F3rWn4runHTfXVH0TQMV52MIhcqbCzAI8C+e+lRSS2xTrnVeRsSuW4u33
/7yn8WNsJjoZgBUvl/llkYUp0aT/BR3PNFSliPO33tsb8hfg8dc=
=U5qi
-----END PGP SIGNATURE-----

--Sig_/83ZHIOjo2E07rmmD5Mrb7Gb--

--===============0524157546==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0524157546==--
