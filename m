Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22AC085EB7B
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 23:00:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54A1510E5E3;
	Wed, 21 Feb 2024 22:00:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Y2mV6MaF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AC6610E5E3;
 Wed, 21 Feb 2024 22:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1708552806;
 bh=XnVUPIkyCpULff+S414jT9EjhkNpiO8qlJBr7sBhaGM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Y2mV6MaFSgV0UP3J3HeMAGsYirQsj+sP//OrS+/CUTPvxW4fctS88LezG04WdU6z+
 /dr0c47MoAZEd71kENsFfWLIXIT+vUxWnR8pTGc17MYqccZsNoL96+hizbaKCHfbaq
 vRib2s69g46VgA0ZqzPx/A5nq91/Ijm7jUJXefOYbo5CzpYnLlmqVG2+xAWlX5/WBX
 msus5ECBHcmPr9jCNka7FX1CtHwsBim3rkwMjbt2oNGEaDnx3mhhgfCmKeHlE6aSYV
 lHlAfh00/4VH3jBMa8No7aOjJsNchOQTlevj1EBxSrdr7hh8qFbpmBmafOIjeX9zs9
 nJS2PhOLQFbEQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Tg9Dg6qWdz4wcq;
 Thu, 22 Feb 2024 09:00:03 +1100 (AEDT)
Date: Thu, 22 Feb 2024 08:59:40 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Jani Nikula
 <jani.nikula@linux.intel.com>, Arnd Bergmann <arnd@kernel.org>, Oded Gabbay
 <ogabbay@kernel.org>, Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?=
 <thomas.hellstrom@linux.intel.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, "Matthew Brost"
 <matthew.brost@intel.com>, Riana Tauro <riana.tauro@intel.com>, "Daniele
 Ceraolo Spurio" <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/xe: skip building debugfs code for CONFIG_DEBUG_FS=n
Message-ID: <20240222085940.6cbb7c9f@canb.auug.org.au>
In-Reply-To: <zospejkdqekbndbov3ubbbvr5skxwohezeslzciivhxakfjoek@oa5sp2ffcfix>
References: <20240213134817.3347574-1-arnd@kernel.org>
 <877cj88lck.fsf@intel.com>
 <17209419-093b-4674-8b43-06c92312ef61@app.fastmail.com>
 <ngu6vq5izal6suyr57p4vlxnrn4kxyii4ewdktxvw7k3uezlcz@6oevav3wpcjh>
 <20240221172117.243799cf@canb.auug.org.au>
 <zospejkdqekbndbov3ubbbvr5skxwohezeslzciivhxakfjoek@oa5sp2ffcfix>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/kwb+M4tVslI2c0Tke07JtS9";
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

--Sig_/kwb+M4tVslI2c0Tke07JtS9
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Lucas,

On Wed, 21 Feb 2024 13:45:35 -0600 Lucas De Marchi <lucas.demarchi@intel.co=
m> wrote:
>
> I don't think it's needed since drm-xe-next covers what is in
> drm-xe-fixes. Please add other maintainers and mailing list:
>=20
> M:      Oded Gabbay <ogabbay@kernel.org>
> M:      Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> L:      intel-xe@lists.freedesktop.org

Added.

--=20
Cheers,
Stephen Rothwell

--Sig_/kwb+M4tVslI2c0Tke07JtS9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmXWckwACgkQAVBC80lX
0Gy5RQf/YxLuUSlc6Waa++WKI6+FKVhnxdxobjQoYhkC06LrLHdzLcOysj83pER8
jnoWCVjjB/KLSYlkALPht0we/GD2S10sH90KhaizyNf0Nwoz+tbx4W+IkLih1OOi
N/ujaQ+THyYXrvPtWNzzpMfrUYtOjwTaQd6CbREhlZMFprT/VTBL+Dov9xIwY3ZM
B9UAClAUP1KztZ7TuJco6Xh/jmi/0Q6kUcDfsev6klN4xAc+ZvUWkms2MQc7j5dt
mZQ1Z9nvatbwHaA1ZrWoAwGpEpHRtidCal/hir28pfgD4H3q6j0K1eVH4Clp915U
J15bKiSmBvBppvngNb2EZ72SYYdzVw==
=PsF1
-----END PGP SIGNATURE-----

--Sig_/kwb+M4tVslI2c0Tke07JtS9--
