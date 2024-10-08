Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9924993B80
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 02:00:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49EBD10E02B;
	Tue,  8 Oct 2024 00:00:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="NwbIDl6k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECFC610E02B;
 Tue,  8 Oct 2024 00:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1728345610;
 bh=yjAEA3gAg2MrSRwiY5GNHjLAVYmztAgeqRcgOAiLRR0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NwbIDl6kQHNBWm97ZxScLI/dYOIHt0zRS56Nj7VWm50Oo04LcwDMSmsH4yU+qMMzI
 d4Rb132HhKpeufbXPs4Bt3wuTZgeQdoNMQn2aDXbQk8SIGscWapXGyUOS5texwA99r
 gUcA8aTUrT6h3gOoO7bM15i1DKGvkuj+tTjxnV4oRNRER0tVgxp0JVTGAwPWvBqGyC
 36x7afKicQSXONqkrtkko/sJrkXeZwYpaYxtw8VQEfhDbAOKiYYp7/SZbmaoJjnA9+
 0LJZdY3FQAPXH9/K5ND2yiZRB58x6cOYDnEFEYqSRaX8vr4XBhCPEPpoSRkt1iD3LG
 XWKf9kohqV3oQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4XMx3Y0ppHz4wxx;
 Tue,  8 Oct 2024 11:00:09 +1100 (AEDT)
Date: Tue, 8 Oct 2024 11:00:08 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, Thomas =?UTF-8?B?SGVsbHN0?=
 =?UTF-8?B?csO2bQ==?= <thomas.hellstrom@linux.intel.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 DRM XE List <intel-xe@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: Re: linux-next: manual merge of the drm-xe tree with the
 drm-misc-fixes tree
Message-ID: <20241008110008.243b9be7@canb.auug.org.au>
In-Reply-To: <20241004121800.7ab3214b@canb.auug.org.au>
References: <20241004121800.7ab3214b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/waKzPEYWWWoW7vIuYvwUsaZ";
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

--Sig_/waKzPEYWWWoW7vIuYvwUsaZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 4 Oct 2024 12:18:00 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the drm-xe tree got a conflict in:
>=20
>   drivers/gpu/drm/xe/xe_guc_submit.c
>=20
> between commit:
>=20
>   9286a191abe2 ("drm/xe: Drop GuC submit_wq pool")
>=20
> from the drm-misc-fixes tree and commit:
>=20
>   861108666cc0 ("drm/xe: fix UAF around queue destruction")

This is now also commit

  2d2be279f1ca ("drm/xe: fix UAF around queue destruction")

in Linus' tree.

> from the drm-xe tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc drivers/gpu/drm/xe/xe_guc_submit.c
> index 17c25f18e286,8a5c21a87977..000000000000
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@@ -224,11 -224,80 +224,27 @@@ static bool exec_queue_killed_or_banned
>   		 EXEC_QUEUE_STATE_BANNED));
>   }
>  =20
>  -#ifdef CONFIG_PROVE_LOCKING
>  -static int alloc_submit_wq(struct xe_guc *guc)
>  -{
>  -	int i;
>  -
>  -	for (i =3D 0; i < NUM_SUBMIT_WQ; ++i) {
>  -		guc->submission_state.submit_wq_pool[i] =3D
>  -			alloc_ordered_workqueue("submit_wq", 0);
>  -		if (!guc->submission_state.submit_wq_pool[i])
>  -			goto err_free;
>  -	}
>  -
>  -	return 0;
>  -
>  -err_free:
>  -	while (i)
>  -		destroy_workqueue(guc->submission_state.submit_wq_pool[--i]);
>  -
>  -	return -ENOMEM;
>  -}
>  -
>  -static void free_submit_wq(struct xe_guc *guc)
>  -{
>  -	int i;
>  -
>  -	for (i =3D 0; i < NUM_SUBMIT_WQ; ++i)
>  -		destroy_workqueue(guc->submission_state.submit_wq_pool[i]);
>  -}
>  -
>  -static struct workqueue_struct *get_submit_wq(struct xe_guc *guc)
>  -{
>  -	int idx =3D guc->submission_state.submit_wq_idx++ % NUM_SUBMIT_WQ;
>  -
>  -	return guc->submission_state.submit_wq_pool[idx];
>  -}
>  -#else
>  -static int alloc_submit_wq(struct xe_guc *guc)
>  -{
>  -	return 0;
>  -}
>  -
>  -static void free_submit_wq(struct xe_guc *guc)
>  -{
>  -
>  -}
>  -
>  -static struct workqueue_struct *get_submit_wq(struct xe_guc *guc)
>  -{
>  -	return NULL;
>  -}
>  -#endif
>  -
> + static void xe_guc_submit_fini(struct xe_guc *guc)
> + {
> + 	struct xe_device *xe =3D guc_to_xe(guc);
> + 	struct xe_gt *gt =3D guc_to_gt(guc);
> + 	int ret;
> +=20
> + 	ret =3D wait_event_timeout(guc->submission_state.fini_wq,
> + 				 xa_empty(&guc->submission_state.exec_queue_lookup),
> + 				 HZ * 5);
> +=20
> + 	drain_workqueue(xe->destroy_wq);
> +=20
> + 	xe_gt_assert(gt, ret);
> + }
> +=20
>   static void guc_submit_fini(struct drm_device *drm, void *arg)
>   {
>   	struct xe_guc *guc =3D arg;
>  =20
> + 	xe_guc_submit_fini(guc);
>   	xa_destroy(&guc->submission_state.exec_queue_lookup);
>  -	free_submit_wq(guc);
>   }
>  =20
>   static void guc_submit_wedged_fini(void *arg)

This is now a conflict between the drm-misc-fixes tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/waKzPEYWWWoW7vIuYvwUsaZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcEdggACgkQAVBC80lX
0GwcqQf/QUyq9Ta+LN7BSZ39z3xyI+qoj2TryT7/RlRUujMo4Skcqv4D5DPGjG5q
gUR//jxTEBotj4tqZzcfX4C416sIe/cdP5H1wlfCDaSrTrZJfIaS3470rhYfrwrk
E4CIVonkoQnUG0SXewfQ0YjZwMl89kVNXQTLFnK18kSRqqEN4bIm19IvFlnDUOqb
fhmuWOjpx7pxpZqvnwKvGcO1hyvK0hfw7YSdvFZ0beTbGmfjzFacqL1WhojXMWAi
s5AQsaEWL3IKj+Zo/8NqYEHZOEsLdM9RVAygiL3QYgBES47IgmZ4s0hP4yISns0J
ii7rApDRcbXeip+mveodZyWyVhY+eA==
=Dqw3
-----END PGP SIGNATURE-----

--Sig_/waKzPEYWWWoW7vIuYvwUsaZ--
