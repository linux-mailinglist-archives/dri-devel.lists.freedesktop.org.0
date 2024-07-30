Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA9B940EAC
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 12:11:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B64AB10E077;
	Tue, 30 Jul 2024 10:11:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="C94Rw9c7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB8C810E03F;
 Tue, 30 Jul 2024 10:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1722334259;
 bh=kwKNQoRGs15Za4VXh2kjUQHdxhfWjLaz7h4GWTcgp4Q=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=C94Rw9c72yphekMPRbh9BRcAmXHLMbC0clvUEwMzIMuLov5zfnlWp6D2NbaKrjENj
 diI9mVB1n3Rfpe7YZ4kp8i9EUFhGfpFV4ENWNpyma+t5YmX/6OT4zBMHicMWCrkFbV
 1PnsUaY2gipiuj/Ho34cOrzpXaRE9LJdVJFkSAd97mLbcpmqkYLeoITcEGnVfu0FO7
 czPlAhxqU3mJq8nVPTXL4s2teD5GhlPBs7nQGtOdFkpalT5yi8c90FDfYCI6/dLka0
 Tsu8JYztEU+fgPkXj+6/Y9qy7QEtrPjFmlKjNuWqr/zwgS9MPkJKp9PAPA84CdvvGI
 up/qFIB/4G89g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4WY9wf25hWz4w2K;
 Tue, 30 Jul 2024 20:10:58 +1000 (AEST)
Date: Tue, 30 Jul 2024 20:10:56 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@intel.com>, "Golani, Mitulkumar
 Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the drm-intel tree
Message-ID: <20240730201056.70f71496@canb.auug.org.au>
In-Reply-To: <679e9674-9611-48a8-8f94-4285b080d3f6@intel.com>
References: <20240612141110.3aebb166@canb.auug.org.au>
 <20240715091234.5e8b2701@canb.auug.org.au>
 <774fa28d-b196-0030-2fb2-5d5fb8a7d1cc@intel.com>
 <679e9674-9611-48a8-8f94-4285b080d3f6@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=G3dNmxhcEOQZR/IIswhZ6+";
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

--Sig_/=G3dNmxhcEOQZR/IIswhZ6+
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 15 Jul 2024 14:13:37 +0200 Maarten Lankhorst <maarten.lankhorst@int=
el.com> wrote:
>
> Den 2024-07-15 kl. 06:21, skrev Golani, Mitulkumar Ajitkumar:
> >
> > On 15-07-2024 04:42, Stephen Rothwell wrote: =20
> >>
> >> On Wed, 12 Jun 2024 14:11:10 +1000 Stephen Rothwell <sfr@canb.auug.org=
.au> wrote: =20
> >>> After merging the drm-intel tree, today's linux-next build (htmldocs)
> >>> produced this warning:
> >>>
> >>> include/drm/display/drm_dp_helper.h:127: warning: Function parameter =
or struct member 'target_rr_divider' not described in 'drm_dp_as_sdp'
> >>>
> >>> Introduced by commit
> >>>
> >>> =C2=A0=C2=A0 a20c6d954d75 ("drm/dp: Add refresh rate divider to struc=
t representing AS SDP") =20
> >> I am now seeing that warning after the merge of the drm tree. =20
> > Hi Stephen Rothwell,
> >
> > I have already floated changes : https://patchwork.freedesktop.org/patc=
h/604143/?series=3D136072&rev=3D1
> >
> > Need help on Ack from drm-maintainers to merge. =20
>=20
> There you go, does it need to go through drm-misc too?

I am still seeing these warnings.

--=20
Cheers,
Stephen Rothwell

--Sig_/=G3dNmxhcEOQZR/IIswhZ6+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaovDAACgkQAVBC80lX
0GxhAwf/QRSEG82Aa/sWPYI4rGYGbNFFEXZQyaInF/Azo+K39nV9y47YMdIcWyFx
MsHH8M6ftbecZO/nb7Kgdux1fM76N/Uuj5X6d+q6OefCVcUdWt6ZFW2qGEIfZGzC
1XwFhnJCgmJwyofIle5GnozosdJk3sOm1lu8XRVNtuYQTf/xIa6C4VcJIOaasoES
fa4Oz9JX2LJ6IcUj+2m7Oh6P+8Gh8oAeeksbxsTEldGY8v2owzpPEA7eycC3kYq7
VxennagkUo91gtE6FnLeIRqux/ZQbHBt4TNPdQMcl21BeWzWRb6W51yQ4mXkC1BB
L3hiELb8HALzCHTzPNMMfm+lxD9wxg==
=y++b
-----END PGP SIGNATURE-----

--Sig_/=G3dNmxhcEOQZR/IIswhZ6+--
