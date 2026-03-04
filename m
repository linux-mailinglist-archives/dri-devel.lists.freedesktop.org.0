Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EAeIBqg5qGkTqgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 14:54:48 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8CCD200C75
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 14:54:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F045D10EA33;
	Wed,  4 Mar 2026 13:54:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=aol.com header.i=@aol.com header.b="GHmUdr0K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic302-21.consmr.mail.gq1.yahoo.com
 (sonic302-21.consmr.mail.gq1.yahoo.com [98.137.68.147])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B86E010EA33
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 13:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1772632484; bh=BCwzxIRRfROvhH1rQsj5yzrbrb8fxFA/K7MzcQmkxnc=;
 h=Subject:From:To:Cc:In-Reply-To:References:Date:From:Subject:Reply-To;
 b=GHmUdr0K6tAx0QIOYNhXZNgBk0Wo0GebNmP6Z7PdkCmJeBCSTrdht2qjvkCadJIxFdfDPhB6duWjwNobN/KDkB7qU1Z7YY/ZRCSnFOo4txQGemcGOgnOF44LsVokS04dwgtF5zJtoWSELvz7bWIInVnfjTYFEWbcB0jY+6KDm9VZEfHNRX8jKsUCytoi2U803QEAiZjCdrvYZX47eAPSS6QxocRydb9FDdPhIeTTFce1Cn0aYFIdgv1kd9Q3YZD98xLgQnmT6GTUcYUuqNhvfXEpZMlBpJbCIN/Up1WVfKMSQYCCV2aH43BAiChFgG68TdC5o4/WfAaT+sbH1n2KIA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1772632484; bh=lzd1NssAdECZK5RfvbMAZkjCPUMG4Jw2aPxzIQqXO5m=;
 h=X-Sonic-MF:Subject:From:To:Date:From:Subject;
 b=tt//YttFpd/Ouvjnl9rV2CccE2pinbxwrLd98BmyIRZdYpbPcPyHkOT0iQ1ReKfHm1+/kNta1Q7U+b23fc8d17uOzkmf0aLDP7neR4YwK6F537iZy7pXJ9CFSpStHuH3+J7vJ8wf7uRm+MD6Wvc+kM8VaF+yL+ht37rq2bzTHAkIvdmHL/YdVISol8XUl0GwBTOMDNspSewJEnwcqolUJBAAjN/0urMFKEm5E3APIhWfQaHxMPOnI0O0YLJFDzrmgRzpsyaxSb6MuW2VPfuNwmhXC/0aXfMylZS1Kf0aE2VDJ0A2JrXkuMF5LsayDSdVLtkk+2hgM6AUW6WvPWy8Xw==
X-YMail-OSG: wHn2y0QVM1lP8QoOY4nLVSROvD02cN6gCoXtw.fSauVK3k5QX6F7pJ1.4PJxzJW
 hShlcYD3Ts7TmLNz5AnNSKdyI4mI1ykzDZvEsN1K5hKXOU5QVYI9rdRs1JKB3RHKKpWrU.EntuZs
 H96m_0BN8a6Wc3bWxLBKXQeFp6umwSiSx8RQvsq.K7hPzh9hxbo3HnLdtADpirTlKQTqiBZBxJZH
 bJI8aZVYmJ0Sj.T5aU3rSgjd3ZfvM4UMcis_3NyxwruVtVoaxGSXX64Yp77bpIDpb.MspBjkA4PN
 8UfBwDd_l1pws9pDosfB0WPO3xQ.APiZDcggIgxsnPL4IMf9UK9pgp8EF9aTtZIfK.OFtmlyJPUN
 mWdY2HlzMI05IVisFx8clMC3_xwbEwD7r3uq4Y5YXILWaQx4oEkuwx_2Y9PzQ4yDvn9_q_bf6vEK
 trswyEF1NTKSFI5enAfCwUjKcKxvn4_WSPS2ThgIdAeFL9.SPspeXoYo7RSdGNwZDGS445dgbVx5
 x00EHoaplHndod8II5zfTyKLSfn4mUBj0VxD8iZ6VBhtWfOPobJQ8pnnmmxWUYDCUpWRXgeNbWmU
 rKU30HN1fiHPZdgcxaiBHMl0HyYJBtBBdIF8dHLl9SckmuB760aJZF3xlOzH0cWRcDFEs6IVLzJd
 oKYZP3_g3pmNYcgzV7h5zESiK4qLseqntOM57wZLqCBitiQG4tjxIAIwkD_8RoX3mVQwbjmWlDGC
 AJY0Fk.cfcc_A7UbPZUdwtF.s4TCKtZwu5JH9GMzQp3azUvO5s_BQP80P0Le7OOSY4_divrQeGQb
 IaBUkf06kwtElDFHQv.3UHYs8dNaNecafkzeoFWB11y83FVSZLEqECX41opLlNI.sDz0sjHu6Z5s
 QruuXi1jFhHi9Rgcob0AGKWb58yfLBnJDJTQMu8oRW_GcWxdPFJGPzBBHCjKHYqGYr5nuV2INeI0
 3nrZ71kB0kV0RiO6alqUs0httA4sPQ3k1OR7yanUUKh0_PF_Gb2UmEkpmnPox76xjLdTz9KcdDKE
 rVb_ABHdF.japnhvMYf05rfAcdscn4UzLzIFbiXDPzkYW8kC0QS32mKTFtBOiHiaUWirswxufC.6
 pmRp415IDcLHPOcRPmNjYDPQWq0pYJQ.iIPJYqWTbCChSlaI0sN7qrdhT5ckP219Psf_IZoMj7cr
 TNxoqe5.JCrMS56jRoYQ593UPehmCo26Dsyuunqbny8f7xfIGLr_7iHxZmjDXaWE2cH5Reu3TvbH
 fYHPpvBHh6RFEt.0O0Qg9nMHuexoYbzPixf4vAk6JP4p1QF5RjIRoZIDvgyXpHfEirPxbG9b8eyn
 m1GnJj.6ojykoCNY6Tg935YXLC0RTvXM827X8iX_bgZJ26MC0VwZkZJVjsipaak1CRfNwAIv7a6U
 uGDfEEhurWKCdDotTAd7umz1uU7AwuEuVfNj1hrTHKK..A_s4fJbdMRMbrBEwhhVsQKLjMuHkNbO
 XzjP.bJv8rqwQ_50U5vllDKojJ1jTSeldTZ0gugxaz.GVRinF5uPacbErtdGi6MARAFCbtoxqY9Q
 1A_16uYtUEK5efP3iSdeDy.jCodOTAXiIsGqvNrYlC3tXLCSarbWicorrL_bfoHyRXg03XfNvgrq
 QtFOEOeWE9wsnrRoi3e8XxcMLlUjYWNM9RNQw5lpK6Cd.BIp4XCsXH35Uhh4eME3V2L8UbJOPwhO
 9wsJkFbiVkKkJbZHxVEAcS3LUy1nX5EqbG95ptUljuO0V_rMLdPVL0XErrQvbWjCBoYJ7mif6lGb
 WsDEU2biAaREs_1GBEdUG0iTGNy4TjtmyA3ptrl3WO6KQDBOYrgX.QuGf_yod33i0w65rhOKdVFQ
 5WLAt9Qz4LGJKcQTOAMZRkIAdvtlkFtTkoVVC_eudHa0WN3hgE.TdLl.SuEqgyBhjpq1ckbTNotT
 KA0cfwo5nqTCufQBVTVriVtB6k8C8XNikKi9SQwCBAbNe4ASAX0meiiM_dTQQcFhFqmKADaPgV6c
 nDmop7Jnp3CLpB9KzlZmqqYk8X7PnWxG9aRC46.F8Kyu1x9SLiOTyAoEig39jZSxaYcoSLnPWYd0
 t4x3fGs56ax.5CM1.nwgCFEVYPywPKbwAxX6OVg.HkUATZo7v9_xvf2D9c8CUJ.zFbpJl9KSAbW_
 SuVJ0hmhPSXcNozkE75EgjK.BiIUw8ceRz3uAHMM8re0mbZMsnOWq_KYcMNggM2hgsP_AwUWovtf
 YMuRUYb_HDmiLN3aFo9YjVxCMBRvugpCK3H27mSnG9SHqEuJ_zr2m6DalaJbrgeWV
X-Sonic-MF: <rubenru09@aol.com>
X-Sonic-ID: 54bc90d6-c5d8-4462-ab24-506ac2a97f5c
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic302.consmr.mail.gq1.yahoo.com with HTTP; Wed, 4 Mar 2026 13:54:44 +0000
Received: by hermes--production-ir2-bbcfb4457-g4h2c (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID e71cf96f7b38aa2129032e4b4def2133; 
 Wed, 04 Mar 2026 13:54:41 +0000 (UTC)
Message-ID: <19f2ab51a085c99e69533d551bb029f092872073.camel@aol.com>
Subject: Re: [PATCH] drm/gud: Test for imported buffers with
 drm_gem_is_imported()
From: Ruben Wauters <rubenru09@aol.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com, 
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
In-Reply-To: <20260227133113.235940-4-tzimmermann@suse.de>
References: <20260227133113.235940-4-tzimmermann@suse.de>
Autocrypt: addr=rubenru09@aol.com; prefer-encrypt=mutual;
 keydata=mQINBGQqWbcBEADD5YXfvC27D1wjh1hOmjTjSwAFjQDGynLtrhBBZpJ+NBsfu++ffR7HF
 d/AaSJ+hqJni6HBNr/DMxWYMC8fOAr6zCSAX6fD2Rvy6rq6emuLaGOFkAIWDyuFWw40anlSCPZN+f
 fXTKJvARo45ZpC9PcfNu9/iRl/CpzSdiB5U4O2YtggXPWyOm9ev+bysmn6sjS1d+IZ7iTs9Ef0O4v
 I+1VFXvZMaY0YzG7EoYnKfeeUD7IGLpI4EEkNqLaU4onLN/qkXUwjT+YTw/VtTxNCmtTVFf57RAg2
 toscC85JjcrOeGSXdpP3J9CPdcIDMpOlnE//KuJIA3QMkckPQgnYtRw3ZhbiVxLNNJSUYm7PuRd9L
 LyObX7dpi0YfsUhxmD2+grw+Yvh2YlPWFybBDBgzRIcSMMSw0ertL64hBof06aVIlT8+TBf1Sq7O+
 obGYoXUi2q6qAuz+0y11spGk0YOffx4ChGPMQGGGaXGaCcjRMuJ050MF4dtwep/mSWH/p8EJtIKY8
 LfP/2c6G8leikMddtb+wKSNUuGYE6ctgcUtlltssRt74ls/ajYE00K52dlhCiaKxd2y0KpYEfWXPE
 pfiQ8yd/P/6fZCaOleY4k8Y2/JmlVUfwfVcVmb3mKWxKQXaHhT3cEvv8yuFDZgkTvZInINKtxxzly
 1i3TlY/nn5mwwARAQABtCFSdWJlbiBXYXV0ZXJzIDxydWJlbnJ1MDlAYW9sLmNvbT6JAlQEEwEIAD
 4CGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AWIQTehs0109D1XkJCLZjSflDAUK4M4QUCaPU
 lLgIZAQAKCRDSflDAUK4M4bK/D/wOugk+nS1PVpk5XkoSB3BXpW0yEuu55EjxXuFfN7mGdtRDq6kn
 WIunzqN9vb7qBFcfz1uG9OxEQpiEhGTW7aIkgCCDbyCk//bb2uRKRy7nVHA9E8p6Zya+974iY0+LV
 LkzIN/CgDavmljWIKQvyPL280KU9PjH2blbH5g6skwAc6MU9pCp6H5W00DYFjMW1j5NCBk5d6UDQ9
 OLukHTU5lHURNB4y0EMZg1eHRjqPk/bxXQA7dAz6BtMKhY+ZY8qDd8XC0sA6Zjsr5r8Os4/mDIn8I
 mzcpVNBKiLU0wpZ58TOUuB0s8wUwXZgwyAkG0sMDqasrQAHx5aVZUfb62p3DosMALacVjHrnW4Kwp
 rwfV9lKxfxPyDoGxtcwCAEdA58fG1FsqFqDxB/qkhyvF/4fzEtcOAHcgEAXR9W5G4PU6KInEidNX1
 1B9IuXRV+5NX6pQ0JAYN10WP7TI5SVzx1ebu6+bdLM0etdLU/0urUJjrnIgfQlRItq091/Qb5k4x5
 WTTeD0Y5Ko5/LSUX95R9z06ZffKWKqrl3QpZbAJrOI9PmDwbV8E5PNsIFE84+O2iqfF01j2rXaj+I
 dRhLIkp2jnabmNTFJtCy/N0Yrx16Gd8FnbOxZkbAER8F49MAm1JBQWoIPRbjRrXKJdkAtJr43RCkS
 VabceKfcvFR7bPf9z7QdcmVkMDMxMDAwIDxydWJlbnJ1MDlAYW9sLmNvbT6JAlEEEwEIADsCGwMFC
 wkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AWIQTehs0109D1XkJCLZjSflDAUK4M4QUCaPUlJwAKCR
 DSflDAUK4M4YOiD/0au/ik0WOM0fwVYY6+PQbU9QeHAJ5kuVesCNA57Zwhe2eAeLvAkmh67hmUzTK
 XD46kqeu81cRYG4WlECv2pYUaEkPni9vmpSMTPpmXvpkekaVNrX1qgBVSd2vfP1xG3QmuQXcGiWZw
 gzPDbN/rCjs4iUqwjDrUpnb1c5va2bTfsqATAUfz4MKobkt+NGlJ7wpTY/TE2noeT2Q8v4NWcNkbM
 MMDkACUut0kyzrgeLxu5u8AS2d5TnWHaZwi5hy8egbGTe2FW/fz8GT4ZgOEExshNt2vs2Ay7CGyhm
 v8SJfsvoUQFoIjAKfQ+KLrjCL3nT27Cl1g0Xj6c16f6qH0/ns9uym6SisNr6FzxN4RauMCQsHBeRZ
 qFhJ5WYXaBBziPfa46Jrdnd385KvsQ7V5cGitM6mBx4tDo3cN0jzYqosuBVrwyiOewklRLYrf0go0
 wh31YtoJXeJ0ObH65oHINmT2gqyaii5ZHe+avPwnKE03W5pHwenGCbgSnOndy5eGeamSD7AgwKw4V
 j5r2FeK8K7tU8rpONWu0pkDqq3tMVOcDguTPufXIBFgLDQy4OoC7dHoJRplg8ull5wMjI9ERR0oaP
 8IVIXxGcFRph02eKbZfqK51lMtns3kTe5DgHao5vrE+2GseLnEWE37cWnBQDhYgjwxIWtjGVp6KG7
 eIvzsqg==
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-udLnbAZxUzMV5SGm4vsl"
MIME-Version: 1.0
Date: Wed, 04 Mar 2026 13:50:38 +0000
User-Agent: Evolution 3.56.2 
X-Mailer: WebService/1.1.25198
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol
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
X-Rspamd-Queue-Id: A8CCD200C75
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.41 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_ALLOW(-0.50)[aol.com,reject];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[aol.com:s=a2048];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[suse.de,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
	FORGED_RECIPIENTS(0.00)[m:tzimmermann@suse.de,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[rubenru09@aol.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[aol.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[aol.com:+];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rubenru09@aol.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,suse.de:email]
X-Rspamd-Action: no action


--=-udLnbAZxUzMV5SGm4vsl
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2026-02-27 at 14:31 +0100, Thomas Zimmermann wrote:
> Instead of testing import_attach for imported GEM buffers, invoke
> drm_gem_is_imported() to do the test. The test itself does not change.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Ruben Wauters <rubenru09@aol.com>

Acked-by: Ruben Wauters <rubenru09@aol.com>
> ---
>  drivers/gpu/drm/gud/gud_pipe.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_pip=
e.c
> index 4b77be94348d..11e7441de63b 100644
> --- a/drivers/gpu/drm/gud/gud_pipe.c
> +++ b/drivers/gpu/drm/gud/gud_pipe.c
> @@ -447,7 +447,7 @@ static void gud_fb_handle_damage(struct gud_device *g=
drm, struct drm_framebuffer
>  	}
> =20
>  	/* Imported buffers are assumed to be WriteCombined with uncached reads=
 */
> -	gud_flush_damage(gdrm, fb, src, !fb->obj[0]->import_attach, damage);
> +	gud_flush_damage(gdrm, fb, src, !drm_gem_is_imported(fb->obj[0]), damag=
e);
>  }
> =20
>  int gud_plane_atomic_check(struct drm_plane *plane,

--=-udLnbAZxUzMV5SGm4vsl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEE3obNNdPQ9V5CQi2Y0n5QwFCuDOEFAmmoOJsbFIAAAAAABAAO
bWFudTIsMi41KzEuMTEsMiwyAAoJENJ+UMBQrgzhGy8QAKzTFTx4RQ8ex00pScb0
L4mjo1qex+Eidtt/x8ed0mU02PPzWEY5lfFG1JtxKjAghduWC52V0nRs5dE0QtEM
GXTSvDIrvu7+L4c+DifPEu+tEYJJ7LwC/yG55dJQzqeUfcEY5yTPzC2AORBUZ+Dl
tTPUF2wCmgljOQWyqcTTLz+Ohl3Qvzn9TjueqTH2GzQGsgUuHh4lKk9OErKjpIeG
MzKu1M6/i66GlxPb45sDvb4RMNnoTUDN6qGjI8IU0udKjePNWzPGGIJxNO/9e1P7
0Himx+3yWwcal5r1vjNJXpxyBpJR+lU84HpQV7PDEQ/BTinIeJLApZ+0Svrv4/bt
s3mRA+vlJ/l449mK+EV6F6/4pqGLqjdrSP8lZNJfTvEPngAZpg4lZWLEQfVZvz+7
jFywLzZ42y9phQlgCx/RFXk47cJHpUzXuQYjs6Wi4BJPxMaKQxlKKIXa5Z+6JFGK
7XQd96TTHTFt6faYX3e0a5I8cc0PGYCX/tooG4AKVXTzCRbKwylgiMRsodRN+gg9
uWvF7OZh/zvht0bxsxadiPMA6ze/Edxpo8XX3kWmVJWLeNlYudMclZwyevU8MJEi
MJhjTs/x79YgDfUbl4JHj+fKWHcHZw7Jrhsq+QgeOXpPfyo0fq8MO0tdRqj4jcx2
pqHBeaBrUislhhsi5Dv6Fql5
=gEtm
-----END PGP SIGNATURE-----

--=-udLnbAZxUzMV5SGm4vsl--
