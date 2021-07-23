Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D345A3D3220
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 05:08:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 088B66F567;
	Fri, 23 Jul 2021 03:08:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75F506F567
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 03:08:21 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4GWDm32TzSz9sV8;
 Fri, 23 Jul 2021 13:08:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1627009699;
 bh=juWx6JEmBlfY/hXTeotgtpNHxgO/f40Z10DLhKyCX00=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=IfHJfEqkGUbWipeER+fI5fzAq3G/QQFzJ14eSRFgeG/PwWe++n6Jd543ruDjH9nk4
 /9jpkzNwayzrUNpNYp2sgSbilGcR+sMUhOXS/muGt0N8iqsIwgmGT8KFEooIl50uoB
 QOe/1X9j0CMM3vZKMTbjeCN42f+XHGImoPyAbEx3VnM9dIM00WN42/V4nbMi5+y5Us
 z9J155SoFE4yrPeyW374k9o5kHCjegt/CcLRUe49cOzfb8UvxhERlsur26mznzgXZO
 w+h5IEGT+h3EjZpkVP80I2cv2chlmWEmymTCKnEbkcYVcHxVhyrxB/rYfOJUtzwi6n
 Rvfldep25MxUQ==
Date: Fri, 23 Jul 2021 13:08:18 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>, Dave Airlie <airlied@linux.ie>,
 DRI <dri-devel@lists.freedesktop.org>
Subject: Re: linux-next: manual merge of the amdgpu tree with the drm-fixes
 tree
Message-ID: <20210723130818.1a33137a@canb.auug.org.au>
In-Reply-To: <20210723125807.3c779f68@canb.auug.org.au>
References: <20210723125807.3c779f68@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TQBcQZ487Tkwv/LKABop_Ae";
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Stylon Wang <stylon.wang@amd.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/TQBcQZ487Tkwv/LKABop_Ae
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 23 Jul 2021 12:58:07 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>

> + #ifdef CONFIG_DRM_AMD_DC_HDCP
> + 	if (cp_psp && cp_psp->funcs.enable_assr) {
> + 		if (!cp_psp->funcs.enable_assr(cp_psp->handle, link)) {
> + 			/* since eDP implies ASSR on, change panel
> + 			 * mode to disable ASSR
> + 			 */
> + 			panel_mode =3D DP_PANEL_MODE_DEFAULT;
> + 		}
>  -	} else
>  -		panel_mode =3D DP_PANEL_MODE_DEFAULT;
> + #endif

I corrected that to put back just the closing '}'.

--=20
Cheers,
Stephen Rothwell

--Sig_/TQBcQZ487Tkwv/LKABop_Ae
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmD6MqIACgkQAVBC80lX
0GzFjQf/ZusZ3vNUug4X6dFtIHKVLSoalBpVlvRCwj/RLimGfuPkQiqqOxWRVseb
05xkIYX76Mvk3N8Cy84kN128dZVG1uW0MQUtVCWcL4l+FQQySiZMH8erwA5dsrXO
lcLXD3W75s5HAdvvhgmTJacHn0ZpQI/mv5hAOsnLwB7TupZEYSdTFHtGoubpRNoa
uJdOXntoA0nxd3KmM/VsE9wn03tA0ff9QQoVCjB4zST1vogDG0dXtBFN4HGyslbU
Yw/xaibJS66n4fMAMFuvWb+EJGEJQholdQ78KWjKxPB3+AKcOCicXREvb3RXX++z
LrU1abJt+u92pvXN/JBcM0oT/oczYA==
=tUzc
-----END PGP SIGNATURE-----

--Sig_/TQBcQZ487Tkwv/LKABop_Ae--
