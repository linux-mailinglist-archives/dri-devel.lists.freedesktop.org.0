Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 599C67DE773
	for <lists+dri-devel@lfdr.de>; Wed,  1 Nov 2023 22:36:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 871F610E7B7;
	Wed,  1 Nov 2023 21:36:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADB5810E7B7
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Nov 2023 21:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1698874562;
 bh=Tc9Od7uZzUpcDkFA6Z+9u8/VaaOVwHRS3BLloEaoKt4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=q8Uc0YKFkW9mB0YEBh+dLF6rWfPQKN0qWQpBVUo542KtMT7GhIg+C4c+Dodab//36
 iETdV0V+NSyrbSKDhc8hgMPYsmKVCh86pQGcfbBnCIieaSVf7nli5NyaoGja15WCyG
 ZnXVmAAt6SsKC4vMmclb0c6N8K7C5DVj+NA44yjSD5rnMOX34GPUVvLAtjaETA76zY
 0cGBQ6HHoVDsNtwb0xPyPMbOQfAIgrrvJJxW7hL5OBl0kiM3mtP4efzAOvF15DGeRP
 CjboKuepsHUiZ6eGImsBUpV/TOzT3oG2MI+yCGhexGDHU3bg/o83xF3xkqdrqP9ugI
 ABTVUs/Y/7GoQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4SLL0d3Krxz4xTy;
 Thu,  2 Nov 2023 08:36:01 +1100 (AEDT)
Date: Thu, 2 Nov 2023 08:36:00 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: manual merge of the drm tree with the mm-stable tree
Message-ID: <20231102083600.09d99853@canb.auug.org.au>
In-Reply-To: <20231024115206.4ce24d96@canb.auug.org.au>
References: <20231024115206.4ce24d96@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/N7nrQ1_td42St2V9n7v.Jnw";
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
Cc: Rob Clark <robdclark@chromium.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Qi Zheng <zhengqi.arch@bytedance.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/N7nrQ1_td42St2V9n7v.Jnw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 24 Oct 2023 11:52:06 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the drm tree got a conflict in:
>=20
>   drivers/gpu/drm/msm/msm_drv.c
>=20
> between commit:
>=20
>   cd61a76c210a ("drm/msm: dynamically allocate the drm-msm_gem shrinker")
>=20
> from the mm-stable tree and commit:
>=20
>   506efcba3129 ("drm/msm: carve out KMS code from msm_drv.c")
>=20
> from the drm tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc drivers/gpu/drm/msm/msm_drv.c
> index 7f20249d6071,443bbc3ed750..000000000000
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@@ -457,23 -265,12 +265,14 @@@ static int msm_drm_init(struct device *
>   	if (ret)
>   		goto err_deinit_vram;
>  =20
> - 	/* the fw fb could be anywhere in memory */
> - 	ret =3D drm_aperture_remove_framebuffers(drv);
> - 	if (ret)
> - 		goto err_msm_uninit;
> -=20
>  -	msm_gem_shrinker_init(ddev);
>  +	ret =3D msm_gem_shrinker_init(ddev);
>  +	if (ret)
>  +		goto err_msm_uninit;
>  =20
>   	if (priv->kms_init) {
> - 		ret =3D priv->kms_init(ddev);
> - 		if (ret) {
> - 			DRM_DEV_ERROR(dev, "failed to load kms\n");
> - 			priv->kms =3D NULL;
> + 		ret =3D msm_drm_kms_init(dev, drv);
> + 		if (ret)
>   			goto err_msm_uninit;
> - 		}
> - 		kms =3D priv->kms;
>   	} else {
>   		/* valid only for the dummy headless case, where of_node=3DNULL */
>   		WARN_ON(dev->of_node);

This is now a conflict between the mm-stable tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/N7nrQ1_td42St2V9n7v.Jnw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmVCxMAACgkQAVBC80lX
0Gwz9wf/R/f690zGY9wZCNsiAugX8tgZjfZNF2WcXaaEVkaV9HFZfKmoFFxVKwda
YPRWy14+G78+3M/fdfChDskXa+/bv+3yuFBcJWtSRNWr2Z6hMNDtkKeX6KE4Tj5I
sWHtlS8UpxqZqnZxu0IHm5Y2diwF/nrqjJwnIn2A1pvMGtMy7+jkBHJ5nVh4ZTqN
E17M+VdPWAkIxG1mjK3UHZxhfj3diWm8UvKlGCVzFgmlFOqwTQk+POJw0sZmoQYj
pHMfAJkTPbtG1wTcH14VytBNnzrXqARKmUFkYMS5raaOe6+jyprn2MzGMvuckflp
gVK26Pmjy6OHATYH/2AsHaAd+nR3Hg==
=UVvx
-----END PGP SIGNATURE-----

--Sig_/N7nrQ1_td42St2V9n7v.Jnw--
