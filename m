Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D03FFC47
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2019 00:34:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 733C389FA7;
	Sun, 17 Nov 2019 23:34:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4125F89FA7
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Nov 2019 23:34:35 +0000 (UTC)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAHNVvTf084871
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Nov 2019 18:34:33 -0500
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wayf4dspk-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Nov 2019 18:34:27 -0500
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <dri-devel@lists.freedesktop.org> from <sbobroff@linux.ibm.com>;
 Sun, 17 Nov 2019 23:34:25 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Sun, 17 Nov 2019 23:34:23 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xAHNYMBM41418770
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 17 Nov 2019 23:34:22 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B7C3EA4053;
 Sun, 17 Nov 2019 23:34:22 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1B606A404D;
 Sun, 17 Nov 2019 23:34:22 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sun, 17 Nov 2019 23:34:22 +0000 (GMT)
Received: from osmium (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id D1CBBA01EA;
 Mon, 18 Nov 2019 10:34:19 +1100 (AEDT)
Date: Mon, 18 Nov 2019 10:34:19 +1100
From: Sam Bobroff <sbobroff@linux.ibm.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH 1/1] drm/radeon drm/amdgpu: fix bad DMA from
 INTERRUPT_CNTL2
References: <0657d1ec504d2f58de5835f4d67625b583005a09.1573783477.git.sbobroff@linux.ibm.com>
 <CADnq5_NLSJCe+3wZV1YVmP6F_K9RcA=eSiH=xPQ39+u89Z2cCg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADnq5_NLSJCe+3wZV1YVmP6F_K9RcA=eSiH=xPQ39+u89Z2cCg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
x-cbid: 19111723-0016-0000-0000-000002C6375F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19111723-0017-0000-0000-00003327E4FF
Message-Id: <20191117233419.GB5434@osmium>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-17_05:2019-11-15,2019-11-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015
 mlxscore=0 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0
 mlxlogscore=999 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911170225
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0353787827=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0353787827==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="p4qYPpj5QlsIQJ0K"
Content-Disposition: inline


--p4qYPpj5QlsIQJ0K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 15, 2019 at 09:58:18AM -0500, Alex Deucher wrote:
> On Thu, Nov 14, 2019 at 9:05 PM Sam Bobroff <sbobroff@linux.ibm.com> wrot=
e:
> >
> > The INTERRUPT_CNTL2 register expects a valid DMA address, but is
> > currently set with a GPU MC address.  This can cause problems on
> > systems that detect the resulting DMA read from an invalid address
> > (found on a Power8 guest).
> >
> > Instead, use the DMA address of the dummy page because it will always
> > be safe.
> >
> > Fixes: d8f60cfc9345 ("drm/radeon/kms: Add support for interrupts on r6x=
x/r7xx chips (v3)")
> > Fixes: 25a857fbe973 ("drm/radeon/kms: add support for interrupts on SI")
> > Fixes: a59781bbe528 ("drm/radeon: add support for interrupts on CIK (v5=
)")
> > Fixes: 27ae10641e9c ("drm/amdgpu: add interupt handler implementation f=
or si v3")
> > Signed-off-by: Sam Bobroff <sbobroff@linux.ibm.com>
>=20
> Can you split this into two patches, one for radeon and one for
> amdgpu?  I'll apply them.
>=20
> Thanks!
>=20
> Alex

No problem at all, I'll post it as v2.

Cheers,
Sam.
>=20
> > ---
> > A couple of notes:
> > - Initial discussion:
> >   https://lists.freedesktop.org/archives/dri-devel/2019-November/244090=
=2Ehtml
> > - I have only tested the case that uses r600_irq_init(), but they are a=
ll very
> >   similar.
> > - I've included a fixes tag for each change, but I don't know if that's=
 the
> >   right thing to do in this case (please feel free to fix them on commi=
t or
> >   whatever).
> >
> > Cheers,
> > Sam.
> >
> >  drivers/gpu/drm/amd/amdgpu/si_ih.c | 3 ++-
> >  drivers/gpu/drm/radeon/cik.c       | 4 ++--
> >  drivers/gpu/drm/radeon/r600.c      | 4 ++--
> >  drivers/gpu/drm/radeon/si.c        | 4 ++--
> >  4 files changed, 8 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/si_ih.c b/drivers/gpu/drm/amd/a=
mdgpu/si_ih.c
> > index 57bb5f9e08b2..88ae27a5a03d 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/si_ih.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/si_ih.c
> > @@ -64,7 +64,8 @@ static int si_ih_irq_init(struct amdgpu_device *adev)
> >         u32 interrupt_cntl, ih_cntl, ih_rb_cntl;
> >
> >         si_ih_disable_interrupts(adev);
> > -       WREG32(INTERRUPT_CNTL2, adev->irq.ih.gpu_addr >> 8);
> > +       /* set dummy read address to dummy page address */
> > +       WREG32(INTERRUPT_CNTL2, adev->dummy_page_addr >> 8);
> >         interrupt_cntl =3D RREG32(INTERRUPT_CNTL);
> >         interrupt_cntl &=3D ~IH_DUMMY_RD_OVERRIDE;
> >         interrupt_cntl &=3D ~IH_REQ_NONSNOOP_EN;
> > diff --git a/drivers/gpu/drm/radeon/cik.c b/drivers/gpu/drm/radeon/cik.c
> > index 62eab82a64f9..897442754fd0 100644
> > --- a/drivers/gpu/drm/radeon/cik.c
> > +++ b/drivers/gpu/drm/radeon/cik.c
> > @@ -6969,8 +6969,8 @@ static int cik_irq_init(struct radeon_device *rde=
v)
> >         }
> >
> >         /* setup interrupt control */
> > -       /* XXX this should actually be a bus address, not an MC address=
=2E same on older asics */
> > -       WREG32(INTERRUPT_CNTL2, rdev->ih.gpu_addr >> 8);
> > +       /* set dummy read address to dummy page address */
> > +       WREG32(INTERRUPT_CNTL2, rdev->dummy_page.addr >> 8);
> >         interrupt_cntl =3D RREG32(INTERRUPT_CNTL);
> >         /* IH_DUMMY_RD_OVERRIDE=3D0 - dummy read disabled with msi, ena=
bled without msi
> >          * IH_DUMMY_RD_OVERRIDE=3D1 - dummy read controlled by IH_DUMMY=
_RD_EN
> > diff --git a/drivers/gpu/drm/radeon/r600.c b/drivers/gpu/drm/radeon/r60=
0.c
> > index e937cc01910d..033bc466a862 100644
> > --- a/drivers/gpu/drm/radeon/r600.c
> > +++ b/drivers/gpu/drm/radeon/r600.c
> > @@ -3696,8 +3696,8 @@ int r600_irq_init(struct radeon_device *rdev)
> >         }
> >
> >         /* setup interrupt control */
> > -       /* set dummy read address to ring address */
> > -       WREG32(INTERRUPT_CNTL2, rdev->ih.gpu_addr >> 8);
> > +       /* set dummy read address to dummy page address */
> > +       WREG32(INTERRUPT_CNTL2, rdev->dummy_page.addr >> 8);
> >         interrupt_cntl =3D RREG32(INTERRUPT_CNTL);
> >         /* IH_DUMMY_RD_OVERRIDE=3D0 - dummy read disabled with msi, ena=
bled without msi
> >          * IH_DUMMY_RD_OVERRIDE=3D1 - dummy read controlled by IH_DUMMY=
_RD_EN
> > diff --git a/drivers/gpu/drm/radeon/si.c b/drivers/gpu/drm/radeon/si.c
> > index 05894d198a79..1d8efb0eefdb 100644
> > --- a/drivers/gpu/drm/radeon/si.c
> > +++ b/drivers/gpu/drm/radeon/si.c
> > @@ -5997,8 +5997,8 @@ static int si_irq_init(struct radeon_device *rdev)
> >         }
> >
> >         /* setup interrupt control */
> > -       /* set dummy read address to ring address */
> > -       WREG32(INTERRUPT_CNTL2, rdev->ih.gpu_addr >> 8);
> > +       /* set dummy read address to dummy page address */
> > +       WREG32(INTERRUPT_CNTL2, rdev->dummy_page.addr >> 8);
> >         interrupt_cntl =3D RREG32(INTERRUPT_CNTL);
> >         /* IH_DUMMY_RD_OVERRIDE=3D0 - dummy read disabled with msi, ena=
bled without msi
> >          * IH_DUMMY_RD_OVERRIDE=3D1 - dummy read controlled by IH_DUMMY=
_RD_EN
> > --
> > 2.22.0.216.g00a2a96fc9
> >

--p4qYPpj5QlsIQJ0K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEELWWF8pdtWK5YQRohMX8w6AQl/iIFAl3R2PsACgkQMX8w6AQl
/iL3eQgAm0OkPD+LZhcORzfdlyNScYBOP9qbqJfkfEKnILFkStxgGuPyAAUctWvs
Anf3AwkkXUZFbNW7qCnxNgSzFJoGTxAHflkHLQ7kzeryM2kZTeXc1/hTC9lsm8Ow
XQSACDECzXo7CmqYcAXY+9hMyVUj8zXkuWodT7s/Aub8pQwm4wB417PvIHzocdw/
2+1SINgiDdFIaNHlf2yKYgzLkp1iEuZ1/amHhn0TYsqVdX8xYb7MvxB2PzfeVxBU
w4u8pHBNnM7eS235Ey8qqGmVPpvjKbAkaOArNo2QhcEcUzu7qz+lWoZIeo4yGU9C
ihpxK+i9A0zPQIoHYkp7PRsfILRQjg==
=rSzv
-----END PGP SIGNATURE-----

--p4qYPpj5QlsIQJ0K--


--===============0353787827==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0353787827==--

