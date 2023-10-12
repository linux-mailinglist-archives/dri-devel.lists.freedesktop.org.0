Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7CAA7C6233
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 03:28:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69E0C10E3EF;
	Thu, 12 Oct 2023 01:27:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDFE110E3CE;
 Thu, 12 Oct 2023 01:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1697074070;
 bh=J8Qnx2sCAxUCzPDNIHkIPr+OI4WaMav0iSRgTQB3ipU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lck2TuazuWYN1RyagGvhZVEPKye8aEe20EGf6lj90LuwyXsu6wAzZhIBJcwzBoykF
 QNC9xmP/ROpfLTa4PN5W++QjZhIy7DSArV4alnOo7G4k8ZnK+ig2bUEjKDSA6p0WQN
 L7AmpbVpdz36+65RbNQ+3PKQE0UPbJKlcMuNKtR84RvhKL5g891DfdJtmZ3zjC3L5c
 Z/hWqsy2kk96tkO5W/j1PCpKeBjL/d03cc+bv4Qi+1yh1lajvRwH8hY9htGGDcuHhs
 ZN5sqeP8lHbX/boCVJ4hPELposgsIpAmvkkhbkwt22R2N6P3B12hNTh9hwnwf2lZ2W
 evdA0jh1U+D6w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4S5X7n6gk2z4xPY;
 Thu, 12 Oct 2023 12:27:49 +1100 (AEDT)
Date: Thu, 12 Oct 2023 12:27:49 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20231012122749.45d37e52@canb.auug.org.au>
In-Reply-To: <20231012122209.6f2768df@canb.auug.org.au>
References: <20231012122209.6f2768df@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/VHNQbpLwKeOceXrqi_0uSe6";
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 RD Babiera <rdbabiera@google.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/VHNQbpLwKeOceXrqi_0uSe6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 12 Oct 2023 12:22:09 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the drm-misc tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> drivers/usb/typec/altmodes/displayport.c: In function 'dp_altmode_vdm':
> drivers/usb/typec/altmodes/displayport.c:309:33: error: too few arguments=
 to function 'drm_connector_oob_hotplug_event'
>   309 |                                 drm_connector_oob_hotplug_event(d=
p->connector_fwnode);
>       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> In file included from drivers/usb/typec/altmodes/displayport.c:17:
> include/drm/drm_connector.h:1984:6: note: declared here
>  1984 | void drm_connector_oob_hotplug_event(struct fwnode_handle *connec=
tor_fwnode,
>       |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>=20
> Caused by commit
>=20
>   fc93835bb0d7 ("drm: Add HPD state to drm_connector_oob_hotplug_event()")
>=20
> interacting with commit
>=20
>   89434b069e46 ("usb: typec: altmodes/displayport: Signal hpd low when ex=
iting mode")
>=20
> from the usb.current tree.
>=20
> I have applied the following merge fix patch.
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 12 Oct 2023 12:17:31 +1100
> Subject: [PATCH] fix up for "drm: Add HPD state to
>  drm_connector_oob_hotplug_event()"
>=20
> interacting with commit
>=20
>   89434b069e46 ("usb: typec: altmodes/displayport: Signal hpd low when ex=
iting mode")
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/usb/typec/altmodes/displayport.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec=
/altmodes/displayport.c
> index ddfb5b6ace4f..eb0bf08fc97a 100644
> --- a/drivers/usb/typec/altmodes/displayport.c
> +++ b/drivers/usb/typec/altmodes/displayport.c
> @@ -306,7 +306,8 @@ static int dp_altmode_vdm(struct typec_altmode *alt,
>  			dp->data.status =3D 0;
>  			dp->data.conf =3D 0;
>  			if (dp->hpd) {
> -				drm_connector_oob_hotplug_event(dp->connector_fwnode);
> +				drm_connector_oob_hotplug_event(dp->connector_fwnode

Pretend that there is a comma at the end of the above line :-)

> +								connector_status_disconnected);
>  				dp->hpd =3D false;
>  				sysfs_notify(&dp->alt->dev.kobj, "displayport", "hpd");
>  			}
> --=20
> 2.40.1

--=20
Cheers,
Stephen Rothwell

--Sig_/VHNQbpLwKeOceXrqi_0uSe6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmUnS5UACgkQAVBC80lX
0GwDZgf+NaN4xD1Pb86+Q0qdo86qD1QPdJ3JvRCXl4ThEjqTA4eHqE/ZA+kHiXpt
ylUTlQI6D2UqLTvbG1lUTrTbhfaUA0JjkctwA4nu6VWbbZbvnUMjO/FiP0VisGys
6seAZxDIk22ejVC3hExiM/Y/EH2MsAwehpOmCXyGxQ1YOBrvMW1G59OyEuZKNRxB
bGKcYO89Fvq+gs9CVGHezfCYXZOzm7yX2sPs0kQEnabKsA511+NGuBAUeqP5bsPU
t9C1L3TV7uaR4qqAUUiq4PfiThICk7ZlS7ugr3ZHnZEr1rM7GYvK2Ls4/1I++/6S
axHrG/X5alpWf3WJ/3tjGQrvkSV52g==
=2mTb
-----END PGP SIGNATURE-----

--Sig_/VHNQbpLwKeOceXrqi_0uSe6--
