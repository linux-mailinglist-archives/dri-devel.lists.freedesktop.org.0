Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7690D1187E1
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 13:15:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9413188EE9;
	Tue, 10 Dec 2019 12:15:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4549788EE9
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 12:15:07 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id p17so2911075wma.1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 04:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=6FFSA9wNlB1mceTFZXdXOBrwfLCL+yaQKkQFS8RYW3o=;
 b=B4dMv16trqTdVzglp6FaBeEkiWC0BXW2qPhEcQ/c1Xhz+TCV/tW+tEodRuyKsYw45c
 3vCUBg2s/zqOWsqCRiz+YpVFek/vhA3huH7WbOfCBXFPtWfExzGPIJePGmXx/c8ysP/9
 BYv2U1MwjGVNc7sY+yDZawgo5wYKpLVP5OrMpbEmW6tbBzcR5ZxAd6PyhpQAURWi0TuH
 7yyLLHjzdwTnOMty8WD5pV2FiSdLOkn/gUJ9pW3Er03woQme00HC+/CwxqdGHG3BhK10
 cCpAykavlIAB3Zf/9fwiRG7C1VARK1u/hjMJM7Qh38ND+12sD71gHuy5+WU4N+FLniWl
 tqMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=6FFSA9wNlB1mceTFZXdXOBrwfLCL+yaQKkQFS8RYW3o=;
 b=j3j0xDb8C7PnUeC5y2AjpZvL3wTHCo0vMi0quHtty/ljCWyIpwBWEuo0eMtKvoxGTW
 emqlyVc9CLdf5aeG8q1hrze1bjkWs9nNR0jCSGQOo+g96zquRxO4YsiRN0KeHZ2BkJYn
 AqSc2HWGe1zISVCnIeJDOVFAgAiZ3yZgRrTSpSa1as39jbD2o6NQB+0fP3K8ZN/WciDq
 iLThhLMk0/M63v3a1JtWTC/uSe7rkMSUaPIx68ZprBB6lZl/ky0go1VfKNbCzKfLFcpr
 2a2uYvXL5jzgoao/1Km48RQ0/FTbrLzMBjar4MOHZdSw5ciaeB1i3AuhtcoSCo7qHdMv
 939w==
X-Gm-Message-State: APjAAAUosyPkRZmkh9io8qiWTcSnP+4LhtEELnQXooeOalBbCCYRE/bO
 Bux4l7S2GDh6Al5jRfDzlno=
X-Google-Smtp-Source: APXvYqx10e6k+vdszCn8c2+AEc5kV0jj+ooOAxynNrxL50akX3Yjrmn/5tep5SYgj/W7e2HOh3ayQw==
X-Received: by 2002:a1c:1b88:: with SMTP id b130mr4692583wmb.4.1575980105752; 
 Tue, 10 Dec 2019 04:15:05 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
 by smtp.gmail.com with ESMTPSA id d8sm3011567wre.13.2019.12.10.04.15.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2019 04:15:04 -0800 (PST)
Date: Tue, 10 Dec 2019 13:15:03 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/doc: Drop :c:func: markup
Message-ID: <20191210121503.GB2703785@ulmo>
References: <20191204101933.861169-1-daniel.vetter@ffwll.ch>
 <20191205160537.GC1914185@ulmo>
 <20191210103316.GT624164@phenom.ffwll.local>
MIME-Version: 1.0
In-Reply-To: <20191210103316.GT624164@phenom.ffwll.local>
User-Agent: Mutt/1.12.2 (2019-09-21)
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: multipart/mixed; boundary="===============0931680717=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0931680717==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oC1+HKm2/end4ao3"
Content-Disposition: inline


--oC1+HKm2/end4ao3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 10, 2019 at 11:33:16AM +0100, Daniel Vetter wrote:
> On Thu, Dec 05, 2019 at 05:05:37PM +0100, Thierry Reding wrote:
> > On Wed, Dec 04, 2019 at 11:19:33AM +0100, Daniel Vetter wrote:
> > > Kernel sphinx has learned how to do that in
> > >=20
> > > commit d74b0d31dddeac2b44c715588d53d9a1e5b1158e
> > > Author: Jonathan Corbet <corbet@lwn.net>
> > > Date:   Thu Apr 25 07:55:07 2019 -0600
> > >=20
> > >     Docs: An initial automarkup extension for sphinx
> > >=20
> > > Unfortunately it hasn't learned that yet for structures, so we're
> > > stuck with the :c:type: noise for now still.
> > >=20
> > > Cc:  Jonathan Corbet <corbet@lwn.net>
>=20
> Jon, any plans to also add the other auto-markup eventually? We have quite
> an impressive pile of :c:type: noise in our docs ...

I had briefly taken a look at this and typed up a prototype that was
basically doing the same thing as for :c:func: but it didn't work for
some reason. After looking at the code and some Sphinx documentation
for an hour or so without an increase in understanding I gave up.

I'm sure someone with deeper knowledge of this would be able to make it
work.

Thierry

> > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > ---
> > >  Documentation/gpu/drm-internals.rst |  4 +-
> > >  Documentation/gpu/drm-kms.rst       |  7 ++-
> > >  Documentation/gpu/drm-mm.rst        | 68 +++++++++++++--------------=
--
> > >  3 files changed, 36 insertions(+), 43 deletions(-)
> >=20
> > Reviewed-by: Thierry Reding <treding@nvidia.com>
>=20
> Thanks for taking a look, patch merged to drm-misc-next.
>=20
> Cheers, Daniel
> --=20
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

--oC1+HKm2/end4ao3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3vjEcACgkQ3SOs138+
s6EY2g/9GZrDyY2/kNfAiq4F1EUKGgVz6nMJT1Dd89hc1/5PgUWr7kAsNjGz4uJW
8DC7N6xgBJCk9BCMHbFKRE5AoqAbsSsZelmmIvOcNNA7amv4dIRCeOL782Soryac
/RYmKYuNtqImspfygXCEXV3XBiOBW4PnRWVXPt1cUrPFAEr9IjZCk7YEGX42NH4R
hzegh15E5w2ZEsswS/0ryqMavGQyirv6SiRP2g8wH6SvaYD/Fx3qdL1eG312j/2X
8GESHe8OPINIQdX91RRKN1eGu/+Yt9zwfALyAAZ6KL6hyUvrPFGpMMn3cg4URGgP
m3FQeFDcsnKGY5k6uEIXJ9UZhqSlaeN+UFgtN/eMji37hsxiFnxt924RduaabDBn
K/WlCRc4DLNa9dcNTEKZ/EC+EA99G7SF1EcR2lhHd6QP4Yi6Bvc783d+/IpG1WLy
K/fQkF60Wr+DKS0J+pZOow/7LxzIO3uAhxc6s4OWErhyS2sz9lr53pHiNO5YQTks
Ax7isKHEsfke1Ys+VVFOIJcE37XStg9/nM9rZRcXdcgYTPP7AynmapTGFKTrM3P1
fqACjlubHAZa+hiizoEHE9LRLyDcIVyXWGLBsoqgC/3+C7dmeqYe0gdwPLVK039P
5BYzeygOukXIgQ8VtHQqD2M8mHd17U5XeFcp+PvBtn+xrL9NY0A=
=Fgtc
-----END PGP SIGNATURE-----

--oC1+HKm2/end4ao3--

--===============0931680717==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0931680717==--
