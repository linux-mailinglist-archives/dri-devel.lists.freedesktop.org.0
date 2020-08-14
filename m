Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED9C244AF2
	for <lists+dri-devel@lfdr.de>; Fri, 14 Aug 2020 15:57:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A5336EB61;
	Fri, 14 Aug 2020 13:57:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85F386EB68
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 13:57:28 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id 3so8021354wmi.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 06:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=HDBviwsXTKiLoVXPPMoJmURYrb3OzGTdFKTsXdkHmxg=;
 b=HZyu/+vc01tWF15d+yONBbUAyz4lOvMCLp3lq0iWF8DuXeshD/mDPy9Emen+13FkxF
 Vp1j8cRVl1TEcMGFfm0y9sIlYWpyxtjmAgMDAg/GpH3FAerowJmMp4lqw9QjfmKAvAHY
 sf/Kjc8+aFheZQkJ8t5rNwpvUdz+3hhu+Da7hfYaf/UclAvOJ5Q4/cp29CVoI9BqIGo/
 +L3j6ph0e/8CRylHUxPw46SgqFzj+hKru1D9Y5MLjwBDxEbURhcLbLY27AVchBWjJMIY
 H/8/NvlxoCkpDoJ/ML53cs6KMdrU41OljTK3dJpRI7JwHm9qwAix0VzE8mrdfFx35xDu
 hq/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=HDBviwsXTKiLoVXPPMoJmURYrb3OzGTdFKTsXdkHmxg=;
 b=XRTKB1R/kZ/LZ4lVz1/2KS+JmnqqPaRZ0RACBjk2515y+3noZP+TuTaAwtItAft/G1
 JsBXUPs9qs5oOFfIxIff6OQ83FAZyqb6vbobBiwMUA9YBvmZfxcozWWjsUEDXCwUrzyX
 q99xj5tcNlbX5D4e8fIfNf11AbQLjYDIAzKYXRGfYwkTD52hdYRs9LHCmSM6QJHKYHoj
 YaLbi+jG88hUPv88xbTGjd48/MRbKcXSyHGowotSx33nrF7SqpG0SpyumPVLtid3wOOP
 gycpVgZa1kgYdYgWj1fV3aEmwz3/5xKGGlK/ViXP3K/6JJ5C3WZlpr/Fvu1PKHWLgR3x
 CuXQ==
X-Gm-Message-State: AOAM532P4W15wvmKntMeXwTWZaSjmCkX+0s87sGMtGteo0jvApk6u6Bw
 mMlmUxO/zTacarF4rWaP6i4=
X-Google-Smtp-Source: ABdhPJzXBIUMRpszzIJ02jn/6uQ7rG2ZV1miXiKsAUFsEvJgQguIhbImRz8iUM4Mxl195mEdE9zbrQ==
X-Received: by 2002:a1c:bc54:: with SMTP id m81mr2818136wmf.73.1597413447089; 
 Fri, 14 Aug 2020 06:57:27 -0700 (PDT)
Received: from localhost
 (p200300e41f10ca00f451c56750ebc625.dip0.t-ipconnect.de.
 [2003:e4:1f10:ca00:f451:c567:50eb:c625])
 by smtp.gmail.com with ESMTPSA id b142sm15439626wmd.19.2020.08.14.06.57.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Aug 2020 06:57:25 -0700 (PDT)
Date: Fri, 14 Aug 2020 15:57:25 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Karol Herbst <kherbst@redhat.com>
Subject: Re: [git pull] drm for 5.8-rc1
Message-ID: <20200814135725.GC556087@ulmo>
References: <CACO55ttP_J8riS_PhCG+-Br+AvsYKRTLg_+wn2pXF9kgXkmjeQ@mail.gmail.com>
 <785eb70c-d9e7-dbdf-b044-337618fcea1a@nvidia.com>
 <20200812174005.GA1705@kevin>
 <2c5cf2e8-afd2-446d-1f27-2c225c65d447@nvidia.com>
 <CACO55tto89kT-_QKGjQ50Ht8U-4Dop6sTjNsbr1qHXhgNuDHEA@mail.gmail.com>
 <CACO55tu1RWZ0ZGcMcrU-snT3CkJtwxawwJ9990-5a+hpByh-Hw@mail.gmail.com>
 <CACO55tsfV9pGijOF5F=dLqFhpXgPSArGHXa44Mt3eRBk7z-X=g@mail.gmail.com>
 <CACO55tsEjGUhfrBdbcpT9xLa8N-T0JR-t7xFBA5pxDZ5+NiQhg@mail.gmail.com>
 <efb830fe-9ded-f5d3-6944-45adbb2a1f80@nvidia.com>
 <CACO55tsZAh4aThBSqiQJ5o6jCi+6vcfXDEfCueyBmOK62ZsW5Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACO55tsZAh4aThBSqiQJ5o6jCi+6vcfXDEfCueyBmOK62ZsW5Q@mail.gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
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
Cc: James Jones <jajones@nvidia.com>, Thierry Reding <treding@nvidia.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1962720409=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1962720409==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FsscpQKzF/jJk6ya"
Content-Disposition: inline


--FsscpQKzF/jJk6ya
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2020 at 07:48:39PM +0200, Karol Herbst wrote:
> On Thu, Aug 13, 2020 at 7:45 PM James Jones <jajones@nvidia.com> wrote:
> >
> > I'll defer to Thierry, but I think that may be by design.  Tegra format
> > modifiers were added to get things like this working in the first place,
> > right?  It's not a regression, is it?
> >
>=20
> That would be slightly annoying as this would mean by design it's
> broken by default :/ Also, we have no Xorg release supporting
> modifiers anyway and it does seem to work with X 1.20.8 (which doesn't
> enable modifier support). And I talked with Jonas (working on mutter)
> about it and there were no plans to turn on modifier support by
> default at this point.

I thought you said earlier that 1.20.8 didn't work and was hitting the
assertion?

Thierry

--FsscpQKzF/jJk6ya
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl82mEQACgkQ3SOs138+
s6EGOg//VJuA/yH4nDYteO3sbpPLB/rcetxc3mm5IoXjKuTbWobdYkC7rfqixMwp
zn1yorJ+e1cNGgTtYWvxfqCLgOvRoToG/sRr0pgdXdebNVwwT6BO8KjuUZ9EF+7I
SilsARIAj7hTD1vHSolHyMxzZm/0eUi5J4Zyt7p/Sz1Tp4svuxKhQR4E+WjeoreZ
zyH/bgjf+PmfPZvHLpsvGn3gpZc05CPxF5sHjOds7fVN1+3/jS4B5IzsXGPnYhXy
RMok+i+R+snzvG73eeaCM+dskps9M2wgCvZ1kNxkMrlD4ys+RRdyyTJNJSn1XzRR
zlsqenIhEc0+Thd491RSQw2D5noShH3Ker0vNR6AhXN3vWhNxJN2A9nnf8BWAvNP
OsGDrYZ/wmUSAw2JYywpIyGNt0kjCMzXvIR9DFZspworpuVMKaVuUXEJpNol5QIx
zDSt2CmEykprxUNiBHDogYqinPBw4m2Vxfu3h111goUODEL1CJGkDfOspqU6XYZY
FrIPlB8BwAu0PkSYxWQnHB6bvFT611tddiX5vgIuTmzdXuZ2KfkJkCVGxYFJ5GB9
PCPKdv+od499cTQYkls1Vwv1N/ntMmh2YHR0ftI5TUF+akEL8wX19bZGiPNEgIF1
NjAnYpBODgqIwI5aTuDRUFtf5u5TF0bUPluBHRJNJt8cljlQivw=
=svX7
-----END PGP SIGNATURE-----

--FsscpQKzF/jJk6ya--

--===============1962720409==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1962720409==--
