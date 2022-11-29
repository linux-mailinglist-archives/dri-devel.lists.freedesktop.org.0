Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0439963D144
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 10:00:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A45E10E42B;
	Wed, 30 Nov 2022 09:00:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A620910E0A1;
 Tue, 29 Nov 2022 17:11:34 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id a7so18010579ljq.12;
 Tue, 29 Nov 2022 09:11:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6SteAwUAUCgIRYXNNmtZkw/nMqCarAX3ZBQIfUV2s5s=;
 b=pjNINGpRvxyUiXVXmfnb/wNr0bYZ6AzQGLG3v89Vv6jpCKBd/yWZZbucH5nRaaLurg
 CAYjnYhalu6Wzaj6wceb/G0kao5blSHJQb9DjmQNdUmaFed6LqmCOFEWJz3nNzGVSIW3
 rPVDNHKG8B63HgTUc1Z1Tk0w0naN/3P4eTKwv49HjInEe2RVUgcYXNwPtWpgV4Yc9UwT
 HXcmxAVllayB43I0HFXPMGkXzbArQSxMmkx7FXPO8rNkqbesf2CLCzhlvkp0mWm61S9F
 X7FyC0/igPHtDuaomnWS/4Z0DSujtVVj9zHYjlxUykG/3z3cymEL8ys/YK5A+gt10dyM
 uKpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6SteAwUAUCgIRYXNNmtZkw/nMqCarAX3ZBQIfUV2s5s=;
 b=jbbI3IcpPzqUb72IwDIrOJO2oljFmzmhwxfhYmb+3l7ZZV0qHxQ4gzTAgreUPLt/rA
 9NdX1ZcRhTGuHVnUyxCTUjBNEdzjJHMeEsKHpTeMZnJ9RBG5qC8rCSXOYxmCDnq57tBR
 eSUuz1SJEK1pULxuJYospdTqAb2mWUVN4NScyfwF4TO1cacsBASjEOlaB8YpCij+CCO6
 4yP5k4Yx18g76wThQbGft5gHxwX67U/l76E1uG2/9bp6MIbyb6eSw79JcP9v0t9Gjutl
 fIcWQplksdBUE1n5Pzr4DuXzWL9fJLAz7yvwD7WANNKQO4DWMSvI8HIO7+lKwBDzX+6e
 CBCA==
X-Gm-Message-State: ANoB5plhtYTjOCjzJHQXs1xIwccc/s0YWxHhGxT2Usdiq1SIHECYQn+g
 LU/AeIZPWm2Otod2bdK2PtpI3i2mXA==
X-Google-Smtp-Source: AA0mqf4rA3Cz5Wta+szAsI8J8dMV0Stkg+e73CKnI1bZwe27t8CYpA+LWst8FrVrRVprm+9XWjb2Ug==
X-Received: by 2002:a2e:9806:0:b0:279:97ef:c1ee with SMTP id
 a6-20020a2e9806000000b0027997efc1eemr6150070ljj.165.1669741892827; 
 Tue, 29 Nov 2022 09:11:32 -0800 (PST)
Received: from sqrt.uni.cx (0854358661.static.corbina.ru. [95.31.0.167])
 by smtp.gmail.com with ESMTPSA id
 c13-20020a2e9d8d000000b0026dd4be2290sm1586553ljj.90.2022.11.29.09.11.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Nov 2022 09:11:32 -0800 (PST)
Date: Tue, 29 Nov 2022 20:11:36 +0300
From: Mikhail Krylov <sqarert@gmail.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: Screen corruption using radeon kernel driver
Message-ID: <Y4Y9SJC7gtUxP4+R@sqrt.uni.cx>
References: <20220423193145.3301ed06@desktop>
 <CADnq5_PXgFBXZ03LXE8qOdimzfKYGhzX1JnycJQcHWcMZdgJug@mail.gmail.com>
 <Y4TGOb3UGmDslyYF@sqrt.uni.cx>
 <CADnq5_NTyvZR16_N0TzMo3f9Mg6EwOuwuBgYzDA=U7tur7Fmnw@mail.gmail.com>
 <Y4UelMnRkY7/0G6U@sqrt.uni.cx>
 <CADnq5_MactA_n4sTKZ_-TpYFZnOfEeygHF3r+zH94By2Dm86cA@mail.gmail.com>
 <Y4YsWo8MPAeg9DRQ@sqrt.uni.cx>
 <CADnq5_MNmOHVuszVfCZ8Ajm85Wb5roe4-20BEXXzsEVpAC_Rkg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="XglWa2+FEr8HAz/a"
Content-Disposition: inline
In-Reply-To: <CADnq5_MNmOHVuszVfCZ8Ajm85Wb5roe4-20BEXXzsEVpAC_Rkg@mail.gmail.com>
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


--XglWa2+FEr8HAz/a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 29, 2022 at 11:05:28AM -0500, Alex Deucher wrote:
> On Tue, Nov 29, 2022 at 10:59 AM Mikhail Krylov <sqarert@gmail.com> wrote:
> >
> > On Tue, Nov 29, 2022 at 09:44:19AM -0500, Alex Deucher wrote:
> > > On Mon, Nov 28, 2022 at 3:48 PM Mikhail Krylov <sqarert@gmail.com> wr=
ote:
> > > >
> > > > On Mon, Nov 28, 2022 at 09:50:50AM -0500, Alex Deucher wrote:
> > > >
> > > > >>> [excessive quoting removed]
> > > >
> > > > >> So, is there any progress on this issue? I do understand it's no=
t a high
> > > > >> priority one, and today I've checked it on 6.0 kernel, and
> > > > >> unfortunately, it still persists...
> > > > >>
> > > > >> I'm considering writing a patch that will allow user to override
> > > > >> need_dma32/dma_bits setting with a module parameter. I'll have s=
ome time
> > > > >> after the New Year for that.
> > > > >>
> > > > >> Is it at all possible that such a patch will be merged into kern=
el?
> > > > >>
> > > > > On Mon, Nov 28, 2022 at 9:31 AM Mikhail Krylov <sqarert@gmail.com=
> wrote:
> > > > > Unless someone familiar with HIMEM can figure out what is going w=
rong
> > > > > we should just revert the patch.
> > > > >
> > > > > Alex
> > > >
> > > >
> > > > Okay, I was suggesting that mostly because
> > > >
> > > > a) it works for me with dma_bits =3D 40 (I understand that's what i=
t is
> > > > without the original patch applied);
> > > >
> > > > b) there's a hint of uncertainity on this line
> > > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
tree/drivers/gpu/drm/radeon/radeon_device.c#n1359
> > > > saying that for AGP dma_bits =3D 32 is the safest option, so appare=
ntly there are
> > > > setups, unlike mine, where dma_bits =3D 32 is better than 40.
> > > >
> > > > But I'm in no position to argue, just wanted to make myself clear.
> > > > I'm okay with rebuilding the kernel for my machine until the origin=
al
> > > > patch is reverted or any other fix is applied.
> > >
> > > What GPU do you have and is it AGP?  If it is AGP, does setting
> > > radeon.agpmode=3D-1 also fix it?
> > >
> > > Alex
> >
> > That is ATI Radeon X1950, and, unfortunately, radeon.agpmode=3D-1 doesn=
't
> > help, it just makes 3D acceleration in games such as OpenArena stop
> > working.
>=20
> Just to confirm, is the board AGP or PCIe?
>=20
> Alex

It is AGP. That's an old machine.

--XglWa2+FEr8HAz/a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEq9zNqT9shXHTn/gRzNfc0dbmrQAFAmOGPUgACgkQzNfc0dbm
rQCzHgf9Fh8dzbPLCyANDpCP91JuB5vQnGyYEAy9YuSuIWyUIjSzv+8sP5yISpJr
5HqQYxDCag4+AF5Cnr9TceFX/0X4LmeCcrgVn9hh+gB3YmRyBaeuajLPXibNa7Uc
bGIYeyF3YuANWHhvfeVJY7JINGtwCS/AUR8L37PTTm7DwmYzuLBwO8AaPlP6ZYRe
yS4V1NWz0ZDt2rlrLPH7r2ObEBuZh11b8VsNfiF0fOqTwdWoBalKwcL2R2ZFYSbb
7Lhvre/cUXUAwqMsWYSlZrRZdixfEhzhVTzpkeCKDTKaBHkNQqGJk7QC3UvAY6gh
Bk4xDrEWlpwAix4DtHmqtl7bmTTwgg==
=5sCM
-----END PGP SIGNATURE-----

--XglWa2+FEr8HAz/a--
