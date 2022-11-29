Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4417C63D153
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 10:01:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 525F710E434;
	Wed, 30 Nov 2022 09:01:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50E9F89C0A;
 Tue, 29 Nov 2022 15:59:20 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id d3so17816125ljl.1;
 Tue, 29 Nov 2022 07:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=yqnfIuSDQKCEiPKD062OYSflOWrksUiNSTHq0tI10t4=;
 b=JIngX6u137zKvw27fj6KpK79RHcWiq2QboIbiRSzIfr2sWiJUbLawqNXBM912nwhLf
 oMblgi/Hm2cAdz3mbybwJMxoHsXk8QrGyQQzYPHCBz8+tTDBUpmLpzLc5cGFI+8bQ/aQ
 pcbApY+aWVR7wmJmS6lnaU7MNhR3QVraZNXFPPhffM8pSem0sBz5zckNUwEIT/iW+wks
 oEsJj7CJ0UZEciod8iDqde8gGqEZ9V7KjSESz5BCvpjZSQgHTe6aaTAiiQCYlD6wPM5E
 dkr46AAW51vZ5RR0zmswFTOy4SyqYGxplxAU+jXoFUD/fXxrt7Cm80Wv2M/EwCyq3WK7
 gOfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yqnfIuSDQKCEiPKD062OYSflOWrksUiNSTHq0tI10t4=;
 b=RQU8jlMjH41Bfpv41qtZKgsyKSRfivj5Cmx/sg6YKIycrVQZR/pddbPk01+Wer9g/c
 LCC++Fp3coatgfwa4tO07yYxHA6SbWRc8agwS4ozhakATGE0pa6FPepV0sERf/LNO8n3
 K7YeWMp88zYoFG0H5SNyEmVutcK+Lh2czNRXCFlfXh9BMupWxlYbsbwCDtvQLN0x5646
 o3/Ner0ybIKri646CrCQLD/6Jv9vFVckoSCoPTSX9XvJTyuTQBr71EsOT+hxJ8YTxRMq
 85PtdTLAC4MHcbCqsfWDwG7zSZ5JqBw1PaQcnm1OGUmE4nYGI2eWvGdkspKJ4yil8Hrx
 6y3g==
X-Gm-Message-State: ANoB5pnxLPcjvj9AIroWZKzXfcCFUATX27h14NuEfi5gq8TVOapAEdPN
 B0RmxfZm0SGW2liczw9n0w==
X-Google-Smtp-Source: AA0mqf4brFARYtga1lZL3Db0FT52U+x0zaZEPrUap2UpN6ip5DxglgvTfXaig3FGhU37/ZLC2elExw==
X-Received: by 2002:a2e:b80c:0:b0:279:78b7:fbed with SMTP id
 u12-20020a2eb80c000000b0027978b7fbedmr10086994ljo.308.1669737558422; 
 Tue, 29 Nov 2022 07:59:18 -0800 (PST)
Received: from sqrt.uni.cx (0854358661.static.corbina.ru. [95.31.0.167])
 by smtp.gmail.com with ESMTPSA id
 o18-20020a056512053200b00497b198987bsm2256957lfc.26.2022.11.29.07.59.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Nov 2022 07:59:17 -0800 (PST)
Date: Tue, 29 Nov 2022 18:59:22 +0300
From: Mikhail Krylov <sqarert@gmail.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: Screen corruption using radeon kernel driver
Message-ID: <Y4YsWo8MPAeg9DRQ@sqrt.uni.cx>
References: <20220423193145.3301ed06@desktop>
 <CADnq5_PXgFBXZ03LXE8qOdimzfKYGhzX1JnycJQcHWcMZdgJug@mail.gmail.com>
 <Y4TGOb3UGmDslyYF@sqrt.uni.cx>
 <CADnq5_NTyvZR16_N0TzMo3f9Mg6EwOuwuBgYzDA=U7tur7Fmnw@mail.gmail.com>
 <Y4UelMnRkY7/0G6U@sqrt.uni.cx>
 <CADnq5_MactA_n4sTKZ_-TpYFZnOfEeygHF3r+zH94By2Dm86cA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="pgcHRYxw9gu8M9se"
Content-Disposition: inline
In-Reply-To: <CADnq5_MactA_n4sTKZ_-TpYFZnOfEeygHF3r+zH94By2Dm86cA@mail.gmail.com>
X-Mailman-Approved-At: Wed, 30 Nov 2022 08:58:34 +0000
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--pgcHRYxw9gu8M9se
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 29, 2022 at 09:44:19AM -0500, Alex Deucher wrote:
> On Mon, Nov 28, 2022 at 3:48 PM Mikhail Krylov <sqarert@gmail.com> wrote:
> >
> > On Mon, Nov 28, 2022 at 09:50:50AM -0500, Alex Deucher wrote:
> >
> > >>> [excessive quoting removed]
> >
> > >> So, is there any progress on this issue? I do understand it's not a =
high
> > >> priority one, and today I've checked it on 6.0 kernel, and
> > >> unfortunately, it still persists...
> > >>
> > >> I'm considering writing a patch that will allow user to override
> > >> need_dma32/dma_bits setting with a module parameter. I'll have some =
time
> > >> after the New Year for that.
> > >>
> > >> Is it at all possible that such a patch will be merged into kernel?
> > >>
> > > On Mon, Nov 28, 2022 at 9:31 AM Mikhail Krylov <sqarert@gmail.com> wr=
ote:
> > > Unless someone familiar with HIMEM can figure out what is going wrong
> > > we should just revert the patch.
> > >
> > > Alex
> >
> >
> > Okay, I was suggesting that mostly because
> >
> > a) it works for me with dma_bits =3D 40 (I understand that's what it is
> > without the original patch applied);
> >
> > b) there's a hint of uncertainity on this line
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/drivers/gpu/drm/radeon/radeon_device.c#n1359
> > saying that for AGP dma_bits =3D 32 is the safest option, so apparently=
 there are
> > setups, unlike mine, where dma_bits =3D 32 is better than 40.
> >
> > But I'm in no position to argue, just wanted to make myself clear.
> > I'm okay with rebuilding the kernel for my machine until the original
> > patch is reverted or any other fix is applied.
>=20
> What GPU do you have and is it AGP?  If it is AGP, does setting
> radeon.agpmode=3D-1 also fix it?
>=20
> Alex

That is ATI Radeon X1950, and, unfortunately, radeon.agpmode=3D-1 doesn't
help, it just makes 3D acceleration in games such as OpenArena stop
working.

--pgcHRYxw9gu8M9se
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEq9zNqT9shXHTn/gRzNfc0dbmrQAFAmOGLFkACgkQzNfc0dbm
rQAjoQf8CjDlgzMTdVgUKYS4o/aHNm0ZwLJ99nWQSINizpvxDStg8TAu5MAf7R51
+7+UN6jC3QiRgHsbAQqrYzXq+5qemlPZYEz3Fp8m5Rz9XwoD7cn13AICSH2Vmyy7
S+HpuaDMebo5ir+ZgMQy4nOPxB8EK3WOBTVvXj38penim3a+D7ic/P2e/WR9LDwv
bDRJqMJ44QWVQQcgYGkff8Fw7eUJ2vqco7VR+azqGTxu/G2Wsr+olcOUgUmDx2+/
W8kiQqNQZBNNs9e1o6oWEqfgB+/s/Ry4xdkcwUZJw66NB9iCD6Y6LHsspsvj08F4
lto1wQKx948p+VPnpkOetziWkjHHbQ==
=POA3
-----END PGP SIGNATURE-----

--pgcHRYxw9gu8M9se--
