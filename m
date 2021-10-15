Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1912342EECA
	for <lists+dri-devel@lfdr.de>; Fri, 15 Oct 2021 12:31:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C45C6E249;
	Fri, 15 Oct 2021 10:31:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 427 seconds by postgrey-1.36 at gabe;
 Fri, 15 Oct 2021 10:31:14 UTC
Received: from gimli.rothwell.id.au (gimli.rothwell.id.au [103.230.158.156])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 500226E249;
 Fri, 15 Oct 2021 10:31:14 +0000 (UTC)
Received: from authenticated.rothwell.id.au (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.rothwell.id.au (Postfix) with ESMTPSA id 4HW2S13FD3z101M;
 Fri, 15 Oct 2021 21:24:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rothwell.id.au;
 s=201702; t=1634293443;
 bh=tepJe4AXXxss/DiAoGZR08QB5qtGDqWnkQk6fLoZ39o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=UzXkr8yt/ZzXjeAilE9mwRB87eXjfTUhvt6kRbgUvMg1YWSg8Llkt88gdbMLEOs2U
 y9LLxjqP5hHrBAi24C/ME2pTa9LUEIlEDCt4mL6YY/uluom1/jwPQBrBqgx8L2OurL
 OD7QsJXUXNXVyTt8n5P9jrf+KAWBXesq//YhO8QIZl7m5eA3BBaCQDqXtW3Aq0Gpos
 /i314NHc1lXIQiZdDsAMxso4F9hxeLT5GF9yOV5EaWcM+wIGU9MqHlVeGppPZi42oS
 oIWWxoqnCOjZFJyMRpCWS9QxGgddIInlSYqGXOzgH5CyCLYBCjX6xSflsVgMEPod63
 cD93pKWVrPwhA==
Date: Fri, 15 Oct 2021 21:23:59 +1100
From: Stephen Rothwell <sfr@rothwell.id.au>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Daniel Vetter
 <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20211015212359.30e2fb01@elm.ozlabs.ibm.com>
In-Reply-To: <87h7divcet.fsf@intel.com>
References: <20211015202648.258445ef@canb.auug.org.au>
 <87h7divcet.fsf@intel.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9bo9n8X6MVEuaY_0YZ+30wy";
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

--Sig_/9bo9n8X6MVEuaY_0YZ+30wy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jani,

On Fri, 15 Oct 2021 12:56:58 +0300 Jani Nikula <jani.nikula@intel.com> wrot=
e:
>
> The fix looks good, but I'd rename __stack_depot_print too added in the
> same commit. Do you want to respin or shall I take it from here?

If you are happy to take it on, then thanks.

--=20
Cheers,
Stephen Rothwell

--Sig_/9bo9n8X6MVEuaY_0YZ+30wy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFpVr8ACgkQAVBC80lX
0GwUcgf/c+KVcX32awGERmuiAMlIyuV579fRV+2X98LX/oqdTTurqeHrABVDPZii
g+1XP5IQ/l0buN7ELXLWQQqVK2p9VJHBii9/F/Qth1g69JqaTPbo9qBbrzaxWtnc
c+NFNr15G3/t9DGH286JE1W6q0EeQ17j/X47D4UWwpXVRryCrCfjAHgBpykThswA
gAZ0YplO+TsLanJ12oFxEATntf5zaO1ZCzbqYvsbUxcVcfr59OD21HzaOjKlY+Uo
37c9JVzpOWnvHv1A9N96ipw492H8EEjRAr/TLh7vjJDNJN/JkGXBlDQj7RxcHUNW
EnmZ3aoYZJXncCm44D8cgtmxLRnQKQ==
=RJqB
-----END PGP SIGNATURE-----

--Sig_/9bo9n8X6MVEuaY_0YZ+30wy--
