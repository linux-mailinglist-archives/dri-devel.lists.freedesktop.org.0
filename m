Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C778D64957E
	for <lists+dri-devel@lfdr.de>; Sun, 11 Dec 2022 19:02:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 079A710E124;
	Sun, 11 Dec 2022 18:02:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0101910E0FA;
 Sat, 10 Dec 2022 15:32:25 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id g7so11580370lfv.5;
 Sat, 10 Dec 2022 07:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=oRHZR/X7WaqGo/ddCHzOT7n/qAXJIlyYM4HSSM5FYTI=;
 b=oWs97s9T9ZOV8JYqwjPC83XXYRQ+DQv6LGrumD66MR7dux1ml4pStevZJdOfxhZtqF
 W2Wet39svhu2GuEolvQqlnN1DlPiYFeSrbgLypBIhA/uluFpd9sBcMAXEdO6f3w4Gob/
 pVLFFRWPe5EPZWu7zGGxsbxaiNIyGnWvw53M0uHEM/CSovlLEBnjXeHS8biTfJRl7pSo
 Jw5qliJ655VlI1M9/zxQSKoMf35bNX7eJhEV/fqx7dWou9GWne/vdr24bZw1neDCj4pH
 9LjO3md+UZDKttUvXY4T0GaOpdTrpa9BSrGDkTsBNgHPKubsmfI1WIR0q20wT9f5MAq4
 yYZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oRHZR/X7WaqGo/ddCHzOT7n/qAXJIlyYM4HSSM5FYTI=;
 b=m9/hAF4gCEBI2uCyF3ZgVG8AEiTpm6+tkU0Iyl5RXhrFGtjIyYhQxCIKqJeIW9sCIF
 Vb5tgWIDSotXBNc6VI+A8HtxyN2NvVqGbtddt7VoqWCJ2kSsBJUoTyapPSvtLoQSMpII
 0tEPagTO56dP1tOwa+k7rJQeReDdqOHu4ACGySw3dAaiWECtslLIXethvDeJwzaWPJpD
 JLCZpnX9isQnXaRMLzAerCTiu9zsPiyKsoUU7y//J3B4A+TvGej7OSKELaGmNY9v4TIA
 m7rx4YgQCaL/hEL94rXAybNL3pXoM3dRzgiwdCLADCrBpo1GPb+VVh5onGAymlnSESfB
 AKGA==
X-Gm-Message-State: ANoB5plRBUJCoRAZBaZgcEV5XyZRz+jBooK322KujrfdbLjHHxCj048D
 0fWwtjj0jt94pLnC6k07e1o/E6NmLA==
X-Google-Smtp-Source: AA0mqf4EnqYjdHi4JwYAqkn0XuWsk/1Xf0XuybAtZo8z2BUqeJFa4esXZY8uIEYC1xLugHQAHz8SZg==
X-Received: by 2002:a05:6512:151a:b0:4b2:28c7:b2bb with SMTP id
 bq26-20020a056512151a00b004b228c7b2bbmr3638369lfb.1.1670686344041; 
 Sat, 10 Dec 2022 07:32:24 -0800 (PST)
Received: from sqrt.uni.cx (0854358661.static.corbina.ru. [95.31.0.167])
 by smtp.gmail.com with ESMTPSA id
 a13-20020a19f80d000000b004a46f92a15bsm759806lff.41.2022.12.10.07.32.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Dec 2022 07:32:23 -0800 (PST)
Date: Sat, 10 Dec 2022 18:32:36 +0300
From: Mikhail Krylov <sqarert@gmail.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: Screen corruption using radeon kernel driver
Message-ID: <Y5SmlC/h3aT8VEx7@sqrt.uni.cx>
References: <CADnq5_NTyvZR16_N0TzMo3f9Mg6EwOuwuBgYzDA=U7tur7Fmnw@mail.gmail.com>
 <Y4UelMnRkY7/0G6U@sqrt.uni.cx>
 <CADnq5_MactA_n4sTKZ_-TpYFZnOfEeygHF3r+zH94By2Dm86cA@mail.gmail.com>
 <Y4YsWo8MPAeg9DRQ@sqrt.uni.cx>
 <CADnq5_MNmOHVuszVfCZ8Ajm85Wb5roe4-20BEXXzsEVpAC_Rkg@mail.gmail.com>
 <Y4Y9SJC7gtUxP4+R@sqrt.uni.cx>
 <a5f73cfa-bd2a-3ab8-1e5c-253cfd832ea7@arm.com>
 <CADnq5_M5ScTd0AYddRBRiEupxRsV16eHFnLnZ3QYzE5gyMPqhw@mail.gmail.com>
 <adf4a9b2-c30d-1e74-9848-7a63b3e0c674@arm.com>
 <CADnq5_PCGVhpk0TpnJKBx7BODV8xWk4hAyXM27tCxBpyS2y9gw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="qHLOkjE0yNQwf+r7"
Content-Disposition: inline
In-Reply-To: <CADnq5_PCGVhpk0TpnJKBx7BODV8xWk4hAyXM27tCxBpyS2y9gw@mail.gmail.com>
X-Mailman-Approved-At: Sun, 11 Dec 2022 18:02:33 +0000
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
Cc: Robin Murphy <robin.murphy@arm.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--qHLOkjE0yNQwf+r7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 30, 2022 at 11:07:32AM -0500, Alex Deucher wrote:
> On Wed, Nov 30, 2022 at 10:42 AM Robin Murphy <robin.murphy@arm.com> wrot=
e:
> >
> > On 2022-11-30 14:28, Alex Deucher wrote:
> > > On Wed, Nov 30, 2022 at 7:54 AM Robin Murphy <robin.murphy@arm.com> w=
rote:
> > >>
> > >> On 2022-11-29 17:11, Mikhail Krylov wrote:
> > >>> On Tue, Nov 29, 2022 at 11:05:28AM -0500, Alex Deucher wrote:
> > >>>> On Tue, Nov 29, 2022 at 10:59 AM Mikhail Krylov <sqarert@gmail.com=
> wrote:
> > >>>>>
> > >>>>> On Tue, Nov 29, 2022 at 09:44:19AM -0500, Alex Deucher wrote:
> > >>>>>> On Mon, Nov 28, 2022 at 3:48 PM Mikhail Krylov <sqarert@gmail.co=
m> wrote:
> > >>>>>>>
> > >>>>>>> On Mon, Nov 28, 2022 at 09:50:50AM -0500, Alex Deucher wrote:
> > >>>>>>>
> > >>>>>>>>>> [excessive quoting removed]
> > >>>>>>>
> > >>>>>>>>> So, is there any progress on this issue? I do understand it's=
 not a high
> > >>>>>>>>> priority one, and today I've checked it on 6.0 kernel, and
> > >>>>>>>>> unfortunately, it still persists...
> > >>>>>>>>>
> > >>>>>>>>> I'm considering writing a patch that will allow user to overr=
ide
> > >>>>>>>>> need_dma32/dma_bits setting with a module parameter. I'll hav=
e some time
> > >>>>>>>>> after the New Year for that.
> > >>>>>>>>>
> > >>>>>>>>> Is it at all possible that such a patch will be merged into k=
ernel?
> > >>>>>>>>>
> > >>>>>>>> On Mon, Nov 28, 2022 at 9:31 AM Mikhail Krylov <sqarert@gmail.=
com> wrote:
> > >>>>>>>> Unless someone familiar with HIMEM can figure out what is goin=
g wrong
> > >>>>>>>> we should just revert the patch.
> > >>>>>>>>
> > >>>>>>>> Alex
> > >>>>>>>
> > >>>>>>>
> > >>>>>>> Okay, I was suggesting that mostly because
> > >>>>>>>
> > >>>>>>> a) it works for me with dma_bits =3D 40 (I understand that's wh=
at it is
> > >>>>>>> without the original patch applied);
> > >>>>>>>
> > >>>>>>> b) there's a hint of uncertainity on this line
> > >>>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git/tree/drivers/gpu/drm/radeon/radeon_device.c#n1359
> > >>>>>>> saying that for AGP dma_bits =3D 32 is the safest option, so ap=
parently there are
> > >>>>>>> setups, unlike mine, where dma_bits =3D 32 is better than 40.
> > >>>>>>>
> > >>>>>>> But I'm in no position to argue, just wanted to make myself cle=
ar.
> > >>>>>>> I'm okay with rebuilding the kernel for my machine until the or=
iginal
> > >>>>>>> patch is reverted or any other fix is applied.
> > >>>>>>
> > >>>>>> What GPU do you have and is it AGP?  If it is AGP, does setting
> > >>>>>> radeon.agpmode=3D-1 also fix it?
> > >>>>>>
> > >>>>>> Alex
> > >>>>>
> > >>>>> That is ATI Radeon X1950, and, unfortunately, radeon.agpmode=3D-1=
 doesn't
> > >>>>> help, it just makes 3D acceleration in games such as OpenArena st=
op
> > >>>>> working.
> > >>>>
> > >>>> Just to confirm, is the board AGP or PCIe?
> > >>>>
> > >>>> Alex
> > >>>
> > >>> It is AGP. That's an old machine.
> > >>
> > >> Can you check whether dma_addressing_limited() is actually returning=
 the
> > >> expected result at the point of radeon_ttm_init()? Disabling highmem=
 is
> > >> presumably just hiding whatever problem exists, by throwing away all
> > >>   >32-bit RAM such that use_dma32 doesn't matter.
> > >
> > > The device in question only supports a 32 bit DMA mask so
> > > dma_addressing_limited() should return true.  Bounce buffers are not
> > > really usable on GPUs because they map so much memory.  If
> > > dma_addressing_limited() returns false, that would explain it.
> >
> > Right, it appears to be the only part of the offending commit that
> > *could* reasonably make any difference, so I'm primarily wondering if
> > dma_get_required_mask() somehow gets confused.
>=20
> Mikhail,
>=20
> Can you see that dma_addressing_limited() and dma_get_required_mask()
> return in this case?
>=20
> Alex
>=20
>=20
> >
> > Thanks,
> > Robin.

Hello again, I was able to confirm by adding printk() to the functions
and recompiling the kernel that dma_addressing_limited() returns
*false* on the kernel with the bug.=20

And dma_get_required_mask() returns 0x7fffffff, as I said before.

--qHLOkjE0yNQwf+r7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEq9zNqT9shXHTn/gRzNfc0dbmrQAFAmOUppQACgkQzNfc0dbm
rQBMsgf/bzRG5sxNt7IdPwZ6SLqNx2TjJgsM1brmVw+7uDUOEX4AU7IdFozicGeJ
fDuW14yYf9jleJ5hn4rQBPKKdVAQ1B12kQHSHDVm9vBtW8VjLylc0V/2F66HF8W7
mCJN7j6c0Z1o7AJ7mZju3fRPMoF/wW1Qivnw3ywR63LVowcyxKP4xCe99Zp9jIy0
IQAdVc6Dw5fJ2s1Hbb9laEDYKNPH6EoUQJmRYmgVSjvW1aELziumjhnGu2h6TW45
QNYHlpEX86Qgc8VCDQ5X7S3BBQDnh+tlwRtRt0xBtkTqbLjJ93imk1YBcHkIlcjy
Yp1fiEHx4UUhqVrQnhf/JP/8AlikDA==
=E5Zh
-----END PGP SIGNATURE-----

--qHLOkjE0yNQwf+r7--
