Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB01243484
	for <lists+dri-devel@lfdr.de>; Thu, 13 Aug 2020 09:12:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 280786E46B;
	Thu, 13 Aug 2020 07:12:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 391936E93A
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 17:40:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id 80ACD29873C
Date: Wed, 12 Aug 2020 13:40:05 -0400
From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: James Jones <jajones@nvidia.com>
Subject: Re: [git pull] drm for 5.8-rc1
Message-ID: <20200812174005.GA1705@kevin>
References: <261cd7c9-6853-3d5f-3a3e-86b65c9dba71@nvidia.com>
 <CACO55ttJwjh2HZsygwqA7HUeF5UMuP0=Y9RyZU=UJsf-gWGagA@mail.gmail.com>
 <ad64c242-95f3-d346-87f3-a9ac149dc3a2@nvidia.com>
 <CACO55tt81q3VwpEmz9wxeUzWGPLXA1XPj8ZgxhuELUBPDpX1PA@mail.gmail.com>
 <CACO55ts2AHgDNZKBvoU8NZf26V8BJDGkKiapY=1xaUQ1DrC8SA@mail.gmail.com>
 <CACO55tvF0dOQ=myUpccmfHc+hCVQZoXQnCA0iHeXQo3B=UaD0Q@mail.gmail.com>
 <CAKb7UviVa32hWv+y+_kwbZzkJAxKcWr1RPCgkGt-mi=uayUKyw@mail.gmail.com>
 <0e882aa7-d0ea-19b0-a13d-4f7bc0d384aa@nvidia.com>
 <CACO55ttP_J8riS_PhCG+-Br+AvsYKRTLg_+wn2pXF9kgXkmjeQ@mail.gmail.com>
 <785eb70c-d9e7-dbdf-b044-337618fcea1a@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <785eb70c-d9e7-dbdf-b044-337618fcea1a@nvidia.com>
X-Mailman-Approved-At: Thu, 13 Aug 2020 07:12:31 +0000
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <treding@nvidia.com>, Karol Herbst <kherbst@redhat.com>
Content-Type: multipart/mixed; boundary="===============0165786021=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0165786021==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LQksG6bCIzRHxTLp"
Content-Disposition: inline


--LQksG6bCIzRHxTLp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> ...and in merging my code with Alyssa's new panfrost format modifier
> support, I see panfrost does the opposite of this and treats a format
> modifier list of only INVALID as "don't care".  I modeled the new nouveau
> behavior on the Iris driver.  Now I'm not sure which is correct :-(

....and neither am I. Uh-oh.

I modeled the panfrost code after v3d_resource_create_with_modifiers,
which treats INVALID as "don't care". I can confirm the panfrost code
works (in the sense that it's functional on the machines I've tested),
but I don't know if it is actually correct. I think it is, since
otherwise you end up using linear in places it's unnecessary, but I'm
not sure where this is spec'd.

--LQksG6bCIzRHxTLp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQ17gm7CvANAdqvY4/v5QWgr1WA0FAl80KXAACgkQ/v5QWgr1
WA1alw//brcNc8VdVseZouqNRrmlu+FMkiBZMnxAG4BWKVrFmpJhTD+QScSyNwVI
23d9SqkXa7TV3aFgV/U51//MSeW8O44RYOQQPR4lUFNmmXI0xpcY+7B9/BA98vAF
QBZ+xJNvz0SIgKSxX/owfMAn+bq6jnqj2oouCkkkXE62zmzFh9EiRwfGw1jf4xQB
Gd2vBslJjhurEfUna0r2U6tQggvtMP5hPLoGpDHL6ImaP8hjpdZNhuGn8WntCvLi
gUfomsHXN4b4CYacw+lg33HGHTIJUo615Jpr0NuAOeR9c6Qx09xTcBnxFrzayWH+
V6kYtUH+4L/p2jfrE1966sCZ7epWViYl9SKd+tsQvjX6uro2ee8yYsVohWKN9PkD
0GTqPIW71c9wUifh0XhyhGlcvGMVTrT3pC7ti85Gn5DJqFnqs74yTpfcAbH7gko/
7PUd+Peco7k+nta86fy+Z5A1Cvh7ZP2nQGOUhm6hNfGnDfXoYpm/qxeqAjvWqwJf
rK0RLfaizCa9cfoCkegqdgglctmzL7qrBLHljf62/LecPa9x2YxqJDcoz27EeDYk
VhtRg2PbS2IRp5yMbPyJT0K2qnqw7LKS4r/MAVJn5ISXKntwT/Nx1Gxa3JnP3qXk
d+aJHDoTUrNYqNMbZBw2hXd2Tl4UxOq/0Q1EHUnFxyvm+aGJ8iA=
=ZUZu
-----END PGP SIGNATURE-----

--LQksG6bCIzRHxTLp--

--===============0165786021==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0165786021==--
