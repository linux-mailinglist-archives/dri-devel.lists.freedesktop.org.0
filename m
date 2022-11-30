Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67CDD63EACE
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 09:06:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E49B10E558;
	Thu,  1 Dec 2022 08:06:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAA1610E4D0;
 Wed, 30 Nov 2022 19:59:44 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id j16so28564863lfe.12;
 Wed, 30 Nov 2022 11:59:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=wsRNVj1SuiMgDuAEZtfyqQX6ogKWoYcLr0RsgGH+j24=;
 b=SOCyRvVy7PJyJdu6RSjKYdA8kA0zPjg6sIt0Vye2yHwZHr/h+FUljfzoQ4X9Jp50QU
 5DOmZra6jN4sfdRqD6A9LgBRkgUG2l+v2QJRvpprJwWu5Q+CQ5olt69ffPGqUB3R6P5k
 3Y8vKUqB7G5+8XBFlmui2ChhutJol/d5V5jtomkAdKUHqrzPW+dPuS14n8OAW6lYR65j
 8I5pdyDNHkP94AzG7MooP0Y9x5Q0k6AowYEhsm8+eQVPOGjWzyruxRCxYNYSAvd97dty
 USThCm5xfibB9nF7nEUT1EF5QMl2HJBsomW64FKtxULPkp6g73Vk0JPU/Cy7ATG5DMll
 QXrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wsRNVj1SuiMgDuAEZtfyqQX6ogKWoYcLr0RsgGH+j24=;
 b=oT3r9R7N7Qd3ogpqLwhJEsgWo17OjodA9GAlW9KQydr8qDXSbywMJ10v6vNEpI2o4j
 X5xx251y9X2FoGvnSbsssJfOWh05CK40w10proLvGGC4GFN0ByPhOkjxvruTceySlBhy
 Jh/kX6Ba9n9XFydlOEV+eDhPG02n7VUsx5RCgcUAnjurkoJ+JVyXAi1nSvqiO6QGh9AM
 p/j3i+T6t9nUIP8kWDvkYl3X4SgDDCZcE4dgAtBUzw7HWX/86P30z2uZALUhMg34Q6GT
 Dr/rilulhZY7TprH732j5kF6dFWIhjc9Oa/18/K+lgyhJ+iAR8wNrpG8Mc/2EVlv5ymc
 NnBg==
X-Gm-Message-State: ANoB5plyPl+fLM0dbxH7p8D1QhcEwLHGj4bdLwkfKf7c9YCyI4qj88iW
 PNEwIgSzWKAFOxGfoaysJg==
X-Google-Smtp-Source: AA0mqf4Ry4+YelQ8SIECwZBgAH9PBhxjHfSB1BDmSSrbF4Fk1OCc8TpM7+VG367fp+AWaIXJO8TDjw==
X-Received: by 2002:a05:6512:2512:b0:4ac:9008:482 with SMTP id
 be18-20020a056512251200b004ac90080482mr20542254lfb.402.1669838383035; 
 Wed, 30 Nov 2022 11:59:43 -0800 (PST)
Received: from sqrt.uni.cx (0854358661.static.corbina.ru. [95.31.0.167])
 by smtp.gmail.com with ESMTPSA id
 dw8-20020a0565122c8800b004998d9ccb62sm363838lfb.99.2022.11.30.11.59.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Nov 2022 11:59:42 -0800 (PST)
Date: Wed, 30 Nov 2022 22:59:49 +0300
From: Mikhail Krylov <sqarert@gmail.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: Screen corruption using radeon kernel driver
Message-ID: <Y4e2NU4E6ZvFlEaL@sqrt.uni.cx>
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
 protocol="application/pgp-signature"; boundary="1T0tJLMulipd1+oz"
Content-Disposition: inline
In-Reply-To: <CADnq5_PCGVhpk0TpnJKBx7BODV8xWk4hAyXM27tCxBpyS2y9gw@mail.gmail.com>
X-Mailman-Approved-At: Thu, 01 Dec 2022 08:06:25 +0000
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


--1T0tJLMulipd1+oz
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

Unfortunately, right now I don't have enough time for kernel
modifications and rebuilds (I will later!), so I did a quick-and-dirty
research with kprobe.=20

The problem is that dma_addressing_limited() seems to be inlined and
kprobe fails to intercept it.

But I managed to get the result of dma_get_required_mask(). It returns
0x7fffffff (!) on the vanilla (with the patch, buggy) kernel:
=20
$ sudo kprobe-perf 'r:dma_get_required_mask $retval'
Tracing kprobe dma_get_required_mask. Ctrl-C to end.
        modprobe-1244    [000] d...   105.582816: dma_get_required_mask: (r=
adeon_ttm_init+0x61/0x240 [radeon] <- dma_get_required_mask) arg1=3D0x7ffff=
fff

This function does not even get called in the kernel without the patch
that I built myself. I believe that's because ttm_bo_device_init()
doesn't call it without the patch.

Hope that helps at least a bit. If not, I'll be able to do more thorough
research in a couple of weeks, probably.

--1T0tJLMulipd1+oz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEq9zNqT9shXHTn/gRzNfc0dbmrQAFAmOHtjUACgkQzNfc0dbm
rQBUFQf/RPQX4sJCoDVInDLJcSPC9/9wkluXfUl1uiwpxr2+X59oFmbIn0NSsc5i
UzqmWR8mz4oZEmYbeRLY6cGPqwYS4iCA7TcXGK6Mr/dYZNmvl50PHi1rVM27PAE6
oq7Pbbj+KyOBhFAqT/1c+wBpva5r7eZTVXqRWsgJ1XiDQiOwDKSS9G4h8jPZseQW
iGcvSSfRhjXuAGqMXte/ae5zZ/HnVCb49fqiYZ2yotMTxLXQ6Z2DvsWIyfrbLHfe
bORy5u1WraX6WOxJn7SdkCV31eJquw6b9Pk7V8J/fUEP+kMQSZ70BPYZpEnny2S5
y9l8nOs0GB/ACym1rcKC0Pz6gP8v1Q==
=tj3L
-----END PGP SIGNATURE-----

--1T0tJLMulipd1+oz--
