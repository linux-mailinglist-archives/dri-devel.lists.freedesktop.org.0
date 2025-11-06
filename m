Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1676FC3BF6B
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 16:10:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EE4910E113;
	Thu,  6 Nov 2025 15:10:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 440 seconds by postgrey-1.36 at gabe;
 Thu, 06 Nov 2025 15:10:46 UTC
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0AAD10E113
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 15:10:46 +0000 (UTC)
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
 by leonov.paulk.fr (Postfix) with ESMTPS id 8FCE91F8004A
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 15:03:22 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
 id 21A9CB0AA87; Thu,  6 Nov 2025 15:03:21 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on spamassassin
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT
 autolearn=disabled version=4.0.0
Received: from collins (unknown [192.168.1.1])
 by laika.paulk.fr (Postfix) with ESMTPSA id D776CB0A6F3;
 Thu,  6 Nov 2025 15:03:19 +0000 (UTC)
Date: Thu, 6 Nov 2025 16:03:17 +0100
From: Paul Kocialkowski <paulk@sys-base.io>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH] drm/sun4i: Cleanup v3s mixer config fields ordering and
 indentation
Message-ID: <aQy4tVdoQeoEyuMV@collins>
References: <20250704154149.3464461-1-paulk@sys-base.io>
 <aKhFPRP8ILNkKAvy@shepard>
 <CAGb2v66=Ppqw+_fpAsRYd_4OBOhbHkk7RetfEXbYmvQ_+hoe7g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="0I3HyHXU+o/IGbUL"
Content-Disposition: inline
In-Reply-To: <CAGb2v66=Ppqw+_fpAsRYd_4OBOhbHkk7RetfEXbYmvQ_+hoe7g@mail.gmail.com>
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


--0I3HyHXU+o/IGbUL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Chen-Yu,

Le Thu 06 Nov 25, 14:01, Chen-Yu Tsai a =C3=A9crit :
> On Fri, Aug 22, 2025 at 6:24=E2=80=AFPM Paul Kocialkowski <paulk@sys-base=
=2Eio> wrote:
> >
> > Hi,
> >
> > On Fri 04 Jul 25, 17:41, Paul Kocialkowski wrote:
> > > The v3s mixer config definition is a bit messy. Tidy it up.
> > > No function change is intended.
> >
> > This patch didn't make it in the previous cycle.
> > Would it be possible to pick it up this time?
>=20
> I guess this is going to conflict with Jernej's refactoring / cleanup
> series.
>=20
> And, I think v3s is not the only one that has fields in a different order.
> Might we clean this up after all the refactoring?

Sure, it's better if this doesn't get in the way of the rework.
I'll send something after the rework is merged if the issue still exists.

Thanks,

Paul

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--0I3HyHXU+o/IGbUL
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmkMuLUACgkQhP3B6o/u
lQw+jg/+Mg60NxB2i+9ikMTfbzq3n2Owcv3rvikDcScmhu8WSIKRvFQC8jGJbUM4
5jsEuxjK/RtQyvoxmkuD404H54uPHes5kFIhZ5V2OJqxTN3UUptRmgsHhqwElZQI
G1be0tjhzXpoF1R/KsWfWi1xmf3tyf+kgapFhmAfdIU/E9To5b3BJydLDk0vMFFF
3bg+wujCC5OLjIWe3HbgrkAdHaqctEf4eMQCDQTW6TcyX3WMz6yRh7BCQluxtun4
R4a8XOMV5Pe6fgSWDLTSQ+QL5e1hcFjNTGRWzPqQ0CJkAVo7AdfOfUNxhQcTjbRB
jynrXFpdIoQAfj2NnSdrPheb/0cbKphnKlPSC1oiFM2DlJwveYUxTBliHBPUFO5g
Pxp9djf6mRLf3wXJXcozb9o4RWX0YXSh0jobwb6UeEIN8xYxix+5pMvFfO73IrQg
4hD+P7EfN53wQcMg993CWfO6h7d36XWDglFBUJQI7jIXQuuIOhIKCpv+1+RWZ/9m
UE0JJgPOXp3Suz7fR3IsVeNaoL4sGWY510e/ZUdddZflJNv7pAhklLCV/TbTPf54
jInSCc2fitmkqYGqCa+n9g0Yn8OoPMwGoqwI6FxT9QbaF5hWEKt0uvlp9uAs1srN
lpy0Pnxeniypj5RUxCNb0VoQ8FxJjeLkKqEzrD0uJheXl7Vpph4=
=lqF6
-----END PGP SIGNATURE-----

--0I3HyHXU+o/IGbUL--
