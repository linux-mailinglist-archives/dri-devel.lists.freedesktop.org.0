Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D8A640510
	for <lists+dri-devel@lfdr.de>; Fri,  2 Dec 2022 11:48:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A4B810E6C6;
	Fri,  2 Dec 2022 10:48:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06CCB10E61B;
 Thu,  1 Dec 2022 15:28:15 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id z4so2266685ljq.6;
 Thu, 01 Dec 2022 07:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=I60qRur/Rzv4u6a+ivWgI1SLIHd90vzAcEFlRIt/Pss=;
 b=aGiHaCjK4Z+Bxruj2zQVSraGs5fsj83rhc3KJaakwCmZh5qrjJT1R5+4v+GzIdIDOB
 0ejXE39CoRySHfF2JxbqB5gw0Wp2zTHgFZCkGiaWdN0lPD2aAxn3mN3zVsgQQbDkkTsj
 Jj3yZhunclp/uQ3g0FpwA2MM2rEaA8mKeINZ+AjCvicS6REiNSK2vlY0g0vjNoLj7tCa
 QnTOEHdVFefm4i1anaoh4JercSfZ8PyC6qvzK74Frc8cAvHwrvvb9x/k9tIqM/4b8/fi
 FMEgMQ2Xy5nAzmYtj76S3aadLosZz2DiESJcim47JOnzdBt5n/XxX3AcjrDc/ckCS/4o
 XnYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I60qRur/Rzv4u6a+ivWgI1SLIHd90vzAcEFlRIt/Pss=;
 b=Q9j/vcBlsHYYEZl1UO+vZVUZE3FuF+Ozj3Gr2IxFuzW0o4V1XGaSwH/qhaZVX3lCJg
 kg9ezKxB3hXSRSoK0ROhGN6FwN/s9GDbu6c5u85Wrl10Gh3w9geLFS3IdVQvntPQUGiI
 5lSMWiJwEOwHlwz+IcOr25AJV54aG+UCB+Bx2SEWFcJ8b8PTq0hKberW5zECp+4FCEY5
 hCA5bVW0Ye+YOZ/C2a5IM7vCQkWHR2dSPSANQyJ2qTF/vrsDABcU+eXcelGh3clnFD0o
 CPDhcxHtl2sFcy4pQNSi9VuDcdy+G+NPx5Dx4kftWT0BnwINrwTNyx8+c3pWGFtxA2X7
 o3cg==
X-Gm-Message-State: ANoB5pmbj/wzaZvXkkvhqs0yJOZ9N1qxRG4S4LuH0/OfTcETjNCOiSP1
 q1TWc/giyyhUiiHfUIA9GA==
X-Google-Smtp-Source: AA0mqf7Gt9dyo260czgryuU61mcMxK5NBm+14JJwjnmpfYfP1BJQ5RP8Q/cuRzi/qr60KMzKDne1Qw==
X-Received: by 2002:a2e:aa94:0:b0:277:871:5712 with SMTP id
 bj20-20020a2eaa94000000b0027708715712mr20467929ljb.129.1669908493089; 
 Thu, 01 Dec 2022 07:28:13 -0800 (PST)
Received: from sqrt.uni.cx (0854358661.static.corbina.ru. [95.31.0.167])
 by smtp.gmail.com with ESMTPSA id
 h9-20020ac24da9000000b00499b1873d6dsm675011lfe.269.2022.12.01.07.28.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 07:28:12 -0800 (PST)
Date: Thu, 1 Dec 2022 18:28:21 +0300
From: Mikhail Krylov <sqarert@gmail.com>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: Screen corruption using radeon kernel driver
Message-ID: <Y4jIFb2JK5hOG01+@sqrt.uni.cx>
References: <CADnq5_MactA_n4sTKZ_-TpYFZnOfEeygHF3r+zH94By2Dm86cA@mail.gmail.com>
 <Y4YsWo8MPAeg9DRQ@sqrt.uni.cx>
 <CADnq5_MNmOHVuszVfCZ8Ajm85Wb5roe4-20BEXXzsEVpAC_Rkg@mail.gmail.com>
 <Y4Y9SJC7gtUxP4+R@sqrt.uni.cx>
 <a5f73cfa-bd2a-3ab8-1e5c-253cfd832ea7@arm.com>
 <CADnq5_M5ScTd0AYddRBRiEupxRsV16eHFnLnZ3QYzE5gyMPqhw@mail.gmail.com>
 <adf4a9b2-c30d-1e74-9848-7a63b3e0c674@arm.com>
 <CADnq5_PCGVhpk0TpnJKBx7BODV8xWk4hAyXM27tCxBpyS2y9gw@mail.gmail.com>
 <Y4e2NU4E6ZvFlEaL@sqrt.uni.cx>
 <087f62d7-7d82-4e42-305b-c48176d7d77b@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="SxSZJLoZnTwjRZEa"
Content-Disposition: inline
In-Reply-To: <087f62d7-7d82-4e42-305b-c48176d7d77b@arm.com>
X-Mailman-Approved-At: Fri, 02 Dec 2022 10:48:00 +0000
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
Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--SxSZJLoZnTwjRZEa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 01, 2022 at 02:00:58PM +0000, Robin Murphy wrote:
> On 2022-11-30 19:59, Mikhail Krylov wrote:
> > On Wed, Nov 30, 2022 at 11:07:32AM -0500, Alex Deucher wrote:
> > > On Wed, Nov 30, 2022 at 10:42 AM Robin Murphy <robin.murphy@arm.com> =
wrote:
> > > >=20
> > > > On 2022-11-30 14:28, Alex Deucher wrote:
> > > > > On Wed, Nov 30, 2022 at 7:54 AM Robin Murphy <robin.murphy@arm.co=
m> wrote:
> > > > > >=20
> > > > > > On 2022-11-29 17:11, Mikhail Krylov wrote:
> > > > > > > On Tue, Nov 29, 2022 at 11:05:28AM -0500, Alex Deucher wrote:
> > > > > > > > On Tue, Nov 29, 2022 at 10:59 AM Mikhail Krylov <sqarert@gm=
ail.com> wrote:
> > > > > > > > >=20
> > > > > > > > > On Tue, Nov 29, 2022 at 09:44:19AM -0500, Alex Deucher wr=
ote:
> > > > > > > > > > On Mon, Nov 28, 2022 at 3:48 PM Mikhail Krylov <sqarert=
@gmail.com> wrote:
> > > > > > > > > > >=20
> > > > > > > > > > > On Mon, Nov 28, 2022 at 09:50:50AM -0500, Alex Deuche=
r wrote:
> > > > > > > > > > >=20
> > > > > > > > > > > > > > [excessive quoting removed]
> > > > > > > > > > >=20
> > > > > > > > > > > > > So, is there any progress on this issue? I do und=
erstand it's not a high
> > > > > > > > > > > > > priority one, and today I've checked it on 6.0 ke=
rnel, and
> > > > > > > > > > > > > unfortunately, it still persists...
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > I'm considering writing a patch that will allow u=
ser to override
> > > > > > > > > > > > > need_dma32/dma_bits setting with a module paramet=
er. I'll have some time
> > > > > > > > > > > > > after the New Year for that.
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > Is it at all possible that such a patch will be m=
erged into kernel?
> > > > > > > > > > > > >=20
> > > > > > > > > > > > On Mon, Nov 28, 2022 at 9:31 AM Mikhail Krylov <sqa=
rert@gmail.com> wrote:
> > > > > > > > > > > > Unless someone familiar with HIMEM can figure out w=
hat is going wrong
> > > > > > > > > > > > we should just revert the patch.
> > > > > > > > > > > >=20
> > > > > > > > > > > > Alex
> > > > > > > > > > >=20
> > > > > > > > > > >=20
> > > > > > > > > > > Okay, I was suggesting that mostly because
> > > > > > > > > > >=20
> > > > > > > > > > > a) it works for me with dma_bits =3D 40 (I understand=
 that's what it is
> > > > > > > > > > > without the original patch applied);
> > > > > > > > > > >=20
> > > > > > > > > > > b) there's a hint of uncertainity on this line
> > > > > > > > > > > https://git.kernel.org/pub/scm/linux/kernel/git/torva=
lds/linux.git/tree/drivers/gpu/drm/radeon/radeon_device.c#n1359
> > > > > > > > > > > saying that for AGP dma_bits =3D 32 is the safest opt=
ion, so apparently there are
> > > > > > > > > > > setups, unlike mine, where dma_bits =3D 32 is better =
than 40.
> > > > > > > > > > >=20
> > > > > > > > > > > But I'm in no position to argue, just wanted to make =
myself clear.
> > > > > > > > > > > I'm okay with rebuilding the kernel for my machine un=
til the original
> > > > > > > > > > > patch is reverted or any other fix is applied.
> > > > > > > > > >=20
> > > > > > > > > > What GPU do you have and is it AGP?  If it is AGP, does=
 setting
> > > > > > > > > > radeon.agpmode=3D-1 also fix it?
> > > > > > > > > >=20
> > > > > > > > > > Alex
> > > > > > > > >=20
> > > > > > > > > That is ATI Radeon X1950, and, unfortunately, radeon.agpm=
ode=3D-1 doesn't
> > > > > > > > > help, it just makes 3D acceleration in games such as Open=
Arena stop
> > > > > > > > > working.
> > > > > > > >=20
> > > > > > > > Just to confirm, is the board AGP or PCIe?
> > > > > > > >=20
> > > > > > > > Alex
> > > > > > >=20
> > > > > > > It is AGP. That's an old machine.
> > > > > >=20
> > > > > > Can you check whether dma_addressing_limited() is actually retu=
rning the
> > > > > > expected result at the point of radeon_ttm_init()? Disabling hi=
ghmem is
> > > > > > presumably just hiding whatever problem exists, by throwing awa=
y all
> > > > > >    >32-bit RAM such that use_dma32 doesn't matter.
> > > > >=20
> > > > > The device in question only supports a 32 bit DMA mask so
> > > > > dma_addressing_limited() should return true.  Bounce buffers are =
not
> > > > > really usable on GPUs because they map so much memory.  If
> > > > > dma_addressing_limited() returns false, that would explain it.
> > > >=20
> > > > Right, it appears to be the only part of the offending commit that
> > > > *could* reasonably make any difference, so I'm primarily wondering =
if
> > > > dma_get_required_mask() somehow gets confused.
> > >=20
> > > Mikhail,
> > >=20
> > > Can you see that dma_addressing_limited() and dma_get_required_mask()
> > > return in this case?
> > >=20
> > > Alex
> > >=20
> > >=20
> > > >=20
> > > > Thanks,
> > > > Robin.
> >=20
> > Unfortunately, right now I don't have enough time for kernel
> > modifications and rebuilds (I will later!), so I did a quick-and-dirty
> > research with kprobe.
> >=20
> > The problem is that dma_addressing_limited() seems to be inlined and
> > kprobe fails to intercept it.
> >=20
> > But I managed to get the result of dma_get_required_mask(). It returns
> > 0x7fffffff (!) on the vanilla (with the patch, buggy) kernel:
> > $ sudo kprobe-perf 'r:dma_get_required_mask $retval'
> > Tracing kprobe dma_get_required_mask. Ctrl-C to end.
> >          modprobe-1244    [000] d...   105.582816: dma_get_required_mas=
k: (radeon_ttm_init+0x61/0x240 [radeon] <- dma_get_required_mask) arg1=3D0x=
7fffffff
> >=20
> > This function does not even get called in the kernel without the patch
> > that I built myself. I believe that's because ttm_bo_device_init()
> > doesn't call it without the patch.
> >=20
> > Hope that helps at least a bit. If not, I'll be able to do more thorough
> > research in a couple of weeks, probably.
>=20
> Hmm, just to clarify, what's your actual RAM layout? I've been assuming
> that the issue must be caused by unexpected DMA address truncation, but
> double-checking the older threads it seems that might not be the case.
> I just did a quick sanity-check of both HIGHMEM4G and HIGHMEM64G configs
> in a VM with either 2GB or 4GB of RAM assigned, and the
> dma_direct_get_required_mask() calculation seemed to return the
> appropriate result for all combinations.
>=20
> Otherwise, the only significant difference of use_dma32 seems to be to
> switch TTM's allocation flags from GFP_HIGHUSER to GFP_DMA32. Could it
> just be that the highmem support somewhere between TTM and radeon has
> bitrotted, and it hasn't been noticed until this change because everyone
> still using a 32-bit system with highmem also happens not to be using a
> newer 40-bit-capable GPU? Or perhaps it never worked for AGP at all, in
> which case an explicit special case might be clearer?
>=20
> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon=
/radeon_ttm.c
> index d33fec488713..acb2d534bff5 100644
> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> @@ -696,6 +696,7 @@ int radeon_ttm_init(struct radeon_device *rdev)
>  			       rdev->ddev->anon_inode->i_mapping,
>  			       rdev->ddev->vma_offset_manager,
>  			       rdev->need_swiotlb,
> +			       rdev->flags & RADEON_IS_AGP ||
>  			       dma_addressing_limited(&rdev->pdev->dev));
>  	if (r) {
>  		DRM_ERROR("failed initializing buffer object driver(%d).\n", r);
>=20
> Robin.

Sorry, not sure what you mean, I'll try to guess:

The bug exists on the stock 32-bit non-pae debian kernel (pae one also
works, but bug persists even there):

https://packages.debian.org/stable/kernel/linux-image-5.10.0-18-686

It has the following memory layout related options:

CONFIG_HIGHMEM4G=3Dy
CONFIG_VMSPLIT_3G=3Dy
CONFIG_HIGHMEM=3Dy

The machine itself has 1.5G of RAM (1024M + 512M sticks).

--SxSZJLoZnTwjRZEa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEq9zNqT9shXHTn/gRzNfc0dbmrQAFAmOIyBUACgkQzNfc0dbm
rQBeEwgAkwcneelTzDT3LbMsnEFxBRdhvE+ABRH+CT+EnLXOrbqya+LwJ81GImED
bPE6+Fa4c5ZAHQ71R72XF4AEHe3s1J1Wz7mymyIKErz+Uhf+AXKjNGsqqUQHHykh
9BTFT6kDnMIVOOTYdIi+DlJlo0gGXVCFiit1EygYkEoq/rurQjnYVtywRH8DfuVw
xDuujte6y5ZDdGGURnaP31+aXa4OqrMV3EG1X2yh6zrzSjTnaHyugieJgWo0H2fk
HdidSe+IM3G+x14qZcnvfii/zCobTs/OVVEhQoha7bsfM2/O4IvFtIP/IKGzP1bB
Vx7gujDKrIWaiRE31ZicWdx2MXBN4A==
=ch0n
-----END PGP SIGNATURE-----

--SxSZJLoZnTwjRZEa--
