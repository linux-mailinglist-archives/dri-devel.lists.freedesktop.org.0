Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF5F82D707
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jan 2024 11:18:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 199D010E251;
	Mon, 15 Jan 2024 10:18:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A4A910E231;
 Mon, 15 Jan 2024 10:17:57 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::225])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 058A3C2F7F;
 Mon, 15 Jan 2024 10:17:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 06C7C1C0011;
 Mon, 15 Jan 2024 10:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1705313871;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ZEf3znytnn/5u2nQ5HISUI8I48juAUPjkUbskiAR5Kw=;
 b=D+ToKPMERGdPs/q2d4zNP/9bvGUhVQK5CVJRXIH159Dbdok5XKx+SDxxvtWyXcnZl+cTOy
 dL3W86EvwKpiOkK0aAxkybSxSMq9qtu97OctBkFrmHvFe0gftp3svl8uew5BfLFwZukvH8
 jxD+NiNPB7+zisUpEPmBCMUPydiDjAPBJvIjo7lJ97qdOWGzdWXDlQXukLQIJFar083KFq
 edoOYr0ljwhZ+dCALcpn8nmIei6LeU8A/pdQnm9MZCdkJkRvwHFzrXFgrW3zFTcHIvAKzP
 n6NOzeTAt9wM9agfLe3th8vcIHBRBWJdza2d/Wuwr88nIU+WLv4IZO2in8cm0Q==
Message-ID: <d3ffc899948961cd3327db1ad0e59970dcf87bca.camel@bootlin.com>
Subject: Re: Failed to create a rescuer kthread for the amdgpu-reset-dev
 workqueue
From: Thomas Perrot <thomas.perrot@bootlin.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 alexander.deucher@amd.com, Xinhui.Pan@amd.com, lijo.lazar@amd.com, 
 kenneth.feng@amd.com, guchun.chen@amd.com, evan.quan@amd.com, 
 srinivasan.shanmugam@amd.com
Date: Mon, 15 Jan 2024 11:17:49 +0100
In-Reply-To: <95e791b0-4672-4a1a-940b-684d8c96e995@amd.com>
References: <cf1a3a2b7599b7b6900ff45aa8b204169411687f.camel@bootlin.com>
 <95e791b0-4672-4a1a-940b-684d8c96e995@amd.com>
Autocrypt: addr=thomas.perrot@bootlin.com; prefer-encrypt=mutual;
 keydata=mQGNBF+/ZOUBDAC2DghCjZvmgYcve02OG7dGZ7Iy58uEwne3LB7w7nRwdAxKw7ZaiVqwYO+yNGVi+GVx7oA6Wn4pv46z+QDRLQiq6OseuXhkSGCg7U/yBCUq12B/GRGO1Qt2Qi1mJJT1s+1qZ5Gxv6Nypz9qKVn94GM2bR1hXBga0t87vBpebThOHmX5d/0dqIcVxRCM7onNb0dDyRoVgLS5rBhQzrLCMrJaCy39xZUy0J1SOlH4Mgk6EhJIPYY4wlzikGX6urg+Tc9EjGd78ry0e0p5U5qgjFR5QGJDy1GnU3CfwbT9sowdCASDbQDUoltlv2iWJCLa0xl97KVchCa0pr7HKbFA3J5SLKqFYUBCkFL+5WudYlz2nXxiUgyviMQxyK+ij66kEi6/2zFDAecd43pHV7790ptqZBC3Jc67Emj7Vo3ShX6RXPPxxbeCTOF2ukI45aJ9XcVFH/MFE96NjXj8uahnIsiTPyuCUoJu8tj7TSQyue874qJqVQvqlFyt2aZYJZ8ruq8AEQEAAbQpVGhvbWFzIFBlcnJvdCA8dGhvbWFzLnBlcnJvdEBib290bGluLmNvbT6JAc4EEwEIADgCGwMFCwkIBwIGFQoJCAsCBBYCAwECHgECF4AWIQSHQHfGpqMKIwOoEiGfwAsFcf4K7QUCX79mdwAKCRCfwAsFcf4K7fhbC/wP0kSl6id2E/K3+UdXk6CLMVRbCFLCREzQs5WFpQ6l/I0WGOamhrOgegdszheiVForlUP8d37XSpFAqydhKGaN78V5Dps0Wmwm4lIlS4MtQXJtSLUHXDJLIZLW0pw8tiPLKsd1o/yDkXEdnpsjJTRG6SdDSHnyOB2/gh4p+yTaLytFdARk/r4/P26+L+FiH0fFl+RnBt19LPklfKgeDc7GwIifja+nIWpp3W23DAUuI6xduEut25Q89yu7Ci8CliLfAiLy9bIGjBQWU2Y+1/j/7KuPj6VbBsZWL
 TZY0hUmpJSTnWAqc9SMsNxo7NSQuddgviz5e2tqucaRqxP02FGzNa8U4NAKdWaXrlHG5Dglj9XH0DK+SH+c96qqFewYD8VPQ6XAGxQcXbrtJmiMor1R2DfziispLRvJcfYs8xqabbCtoS3ouXB9XRi8hn7A2khME1ryS+Oh63JshXHnw6bmjCpVd/p+fGLIGU6A47pJOpviKR4jEO84pl2ejtDZ3Te5AY0EX79k5QEMAMNL3Jqgtre1+nGSt2SxDoLCzBUxufh+nHXgSPK4+dka3R1nmv8Ek1XGJ/PYp9PRXqaRGMaMb61OXsxU2vs9+Blg8ko7FE7wwMTohfRlGMxwNB0adFIqXeuyoEm9rKIUMez+WCiE97FTvZpJgjuIBal30JjaDxyqTSB22tS1cT7bXQTkX9Ijml1zunD+WmfFKLvddhMthOF5hnxMgnBJlAXDHyd6F1kEFYwEgbugldym65D0Z8xyVyJkfKQSmamUW4jcbg8FvVjVwWCg/gH6N+KokR2VQOnbqyB/5ISb0w/cggnH8I36KZnPZ9YRXpFK2Le6QG8mEnWf8f4h8S50ZtV98v7ANb6F9DbLbfK+qoKWdyxhXQCRzoV1vT64eOrJnxaL7uE7g9mkpQvspETK2lBx1okPn9f1qe1On096T4huS7qrhEF+Qt8fg1yAK1G5Ifj7o9nk8uGvFoHly0edTzf4BNZIjruXaM9PNpYMGutT+j/TcTY60a+vQi6GKTf0LQARAQABiQG2BBgBCAAgAhsMFiEEh0B3xqajCiMDqBIhn8ALBXH+Cu0FAl+/aA8ACgkQn8ALBXH+Cu10Rwv/fNlo+C3lnNnJUr+1t7toVZFynsPCBRXhoGvCNlJZa1/mOQGzKLWd4vKoNrCsjm3wmbaajTTST7FmnphUmGahx8/Fn/iU+BeNflLW/Z54RbqC7b+0NpeagueoTtgeYzxGsbrammwtkCk4T6YzS4pIRbubde/kKxAYrb/CZU
 0S//jkiNumQmWn2Pi+VPXHldd/7vXAaBkzkhN/mzIhBxZRebE1+qADKzDt70J393NfA5nq2FuUU3Q2se5CFBvOpDmsxMhiGQrOOREGMzWj46NA3qsC4VxpetgbjTf1gY/JwvWItWMfVA23SkqRcflE5Mv6gLE39uGSnuYAE6T6j0dMlwPwxhoikSjfeEsEayvBM75xKJvMkXOzZS56rmpx+dC2AlrUFTMFnT9RlalKixZn9McKIELk6eeJkU3m2euvf5JxabEhuNK2zlUQPhXNRlMwTWfTBuDsxcLXnsNi+h4ULfjbBu3VTfdE6DhC7phy6Q8dJuAn8MJDRySBqp/L4juX
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-cMV9dIg4T3JiQTgXtcRJ"
User-Agent: Evolution 3.50.3 (3.50.3-1.fc39) 
MIME-Version: 1.0
X-GND-Sasl: thomas.perrot@bootlin.com
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--=-cMV9dIg4T3JiQTgXtcRJ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Christian,

On Fri, 2024-01-12 at 09:17 +0100, Christian K=C3=B6nig wrote:
> Well the driver load is interrupted for some reason.
>=20
> Have you set any timeout for modprobe?
>=20

We don't set a modprobe timeout.

Kind regards,
Thomas

> Regards,
> Christian.
>=20
> Am 12.01.24 um 09:11 schrieb Thomas Perrot:
> > Hello,
> >=20
> > We are updating the kernel from the 6.1 to the 6.6 and we observe
> > an
> > amdgpu=E2=80=99s regression with Radeon RX580 8GB and SiFive Unmatched:
> > =E2=80=9Cworkqueue: Failed to create a rescuer kthread for wq 'amdgpu-
> > reset-
> > dev': -EINTR
> > [drm:amdgpu_reset_create_reset_domain [amdgpu]] *ERROR* Failed to
> > allocate wq for amdgpu_reset_domain!
> > amdgpu 0000:07:00.0: amdgpu: Fatal error during GPU init
> > amdgpu 0000:07:00.0: amdgpu: amdgpu: finishing device.
> > amdgpu: probe of 0000:07:00.0 failed with error -12=E2=80=9D
> >=20
> > We tried to figure it out without success for the moment, do you
> > have
> > some advice to identify the root cause and to fix it?
> >=20
> > Kind regards,
> > Thomas Perrot
> >=20
>=20

--=20
Thomas Perrot, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com


--=-cMV9dIg4T3JiQTgXtcRJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQGzBAABCAAdFiEEh0B3xqajCiMDqBIhn8ALBXH+Cu0FAmWlBk0ACgkQn8ALBXH+
Cu2j/Qv6A5oWfrKUk0H6c+EJltETug8YjAC0uUNMXeqZc3IunJYIEvifQbnwOU6P
M8zc1K4C75r+6C8+x/fvc5Bb7mgFjr4nR2aDmNMMmsddH4o79Mm0djnce/m60L5+
CsgEM/vxLaYv3w3/pAefbFSpkRA7JauCJYWPSnueSMxvuSeyVZB8agqqcrMbgh1i
6NbuLsm3TGZToHCBN0HgSvh4fhYYeLDTO0kx510Dy3Ha6C2A/4LgPtlKg0Na4+2p
gWVDlwN7iO3qGSA8SGy2rekwfZQ3qfZYeUmzu5ZxJeecH0f7Lu7H77zCJl6j0io4
wGI6SkbhvR3BBDDRB/kV44MjYNiVsm08lZmzZQmFrD0k3SM20VJXkfaZb76q0Si4
oEt3RZXqLPUSafMGPhtBQmmzgeAy2w+2jk/7iHw6uLcjM9qRxw8kXwwraRLqEke+
8GZbG8kg9hoS40RRXuYk6YgCjD+8dDVj3Mh0wZkneyz3+/mPpw4YZg9KXNAEAxk9
pC11KECt
=z8NM
-----END PGP SIGNATURE-----

--=-cMV9dIg4T3JiQTgXtcRJ--
