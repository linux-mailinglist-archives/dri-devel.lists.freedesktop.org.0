Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB9C907E73
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 00:00:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29BBC10EBC0;
	Thu, 13 Jun 2024 22:00:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="LMX958yk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E954E10EBC0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 21:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1718315993;
 bh=Hd/9wMpw8pzEUMYSc1ulvSblxTiLluyG6ie+LF/7UNY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LMX958ykXJ7Od31qbDtsybegrEu+jkMZRISMpaaR2Ib+yrSb7k16rbf0DHWRkFACu
 m7mfUJwEHRuXbtvLhT6lOu9gShzu0Dx3TFonF45G6TBSvGw0D8+kbZ6vAL2abaFuvp
 7M/zLNpTT3uj4/ISRXkiuzIFxq7W4WUQ/XswwgZ2rNdjMf4THnJvVUkYoR/pYy6wq5
 0PLsMr9/FKrtfdfW9CZ79Lnee53h8C7s+05Mz7GuJp0gbr1Yfp7YR+USJldw0xGd68
 5jjBI2yXvfIcSQMfeyXrQM7WmYEZDoY416u2GiXxstpLStbPgO0jRNMUuqSk9Ap4fA
 pNaYhpMOmlOrw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4W0btH1kLVz4wbp;
 Fri, 14 Jun 2024 07:59:51 +1000 (AEST)
Date: Fri, 14 Jun 2024 07:59:49 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jocelyn Falempe <jfalempe@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Helge Deller <deller@gmx.de>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/3] drm/panic: Fixes and graphical logo
Message-ID: <20240614075949.3a3c667f@canb.auug.org.au>
In-Reply-To: <CAMuHMdUGEuX+8EP3gbCB-Kgri=h34q0ryjOd5-KE-4+fWWwsGQ@mail.gmail.com>
References: <cover.1718199918.git.geert+renesas@glider.be>
 <386a229b-6904-465d-b772-921f99815e8c@redhat.com>
 <CAMuHMdWy15T1JPH6w=xLyx_-zpHJA_VUe_Mu+h5zNPXEZw8+RQ@mail.gmail.com>
 <cff14393-d702-4fcd-8a13-034692dc931e@redhat.com>
 <CAMuHMdUGEuX+8EP3gbCB-Kgri=h34q0ryjOd5-KE-4+fWWwsGQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TYz4mwKz+tY5O7NzfgBXWFo";
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

--Sig_/TYz4mwKz+tY5O7NzfgBXWFo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Thu, 13 Jun 2024 11:48:15 +0200 Geert Uytterhoeven <geert@linux-m68k.org=
> wrote:
>
> > > Has the drm-misc git repo moved? =20
> >
> > It moved to gitlab recently, the new url is
> > git@gitlab.freedesktop.org:drm/misc/kernel.git =20
>=20
> Time to tell Stephen...

linux-next has been using that URL for some time.

--=20
Cheers,
Stephen Rothwell

--Sig_/TYz4mwKz+tY5O7NzfgBXWFo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZra9UACgkQAVBC80lX
0GyyvwgAonqH5POJPfFcpY00KeYI0W+oRAz3XhU+G43kiim27cnfbH/4LTUy7xDN
zVClA/NdLFu41bCo12IFL9S0tQqwgovyf6WnC8ukZgzkP3IfwQM1QflN/eT5CTmw
fB5Gs28QBS69WjWiIRBnmctNJvd2Hrsx90wt+uks8jiMel2CcluxBb3v1IeVUzsW
z8XajIBH22llHGhAArbL0yFBa9Bxqn/UVhbqxvSo1dy1ZvQnRHj+wRNtIu+ktpbB
dtYOMRfEcA0x8ReH6l4p6sI8F2dH3fuckfQPMnejelmBOFjVssGtbRIfhR/UrQAD
XUpdSFUETO9IkDj9Z0z9VFbmH9olVw==
=485Q
-----END PGP SIGNATURE-----

--Sig_/TYz4mwKz+tY5O7NzfgBXWFo--
