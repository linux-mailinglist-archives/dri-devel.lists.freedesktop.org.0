Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB13973698
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 14:00:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DCFF10E7A0;
	Tue, 10 Sep 2024 11:59:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AbHsUOG5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F8D510E7A0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2024 11:59:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4F3855C021B;
 Tue, 10 Sep 2024 11:59:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F7CEC4CEC3;
 Tue, 10 Sep 2024 11:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725969595;
 bh=cUCDRbBErAAoJlh8tblnGbkXDRsg/AAOLJeqTKetPgM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AbHsUOG5POnujaToGxaetCcAiAOuf73FugTzA2g6XA13NNB07NmBEV8dtqnjZj2NW
 n1Mu48xZrf4X3CHsuAFPjSfLHLAv5ywLlx8xVxCcS53XMP2dhzjYdayO2z8avUjAei
 /iL3CNgClreQXhPHQQ25Q+WcsjnjOICeLKbb7bENi5DLBBwBx3FvmJVm5XJLMOfog4
 TLA0c5HZnMPbMZ238fBzZ6VBpzcXQrYav4ID5jhsl13w9A3vzat8KUylts53Zprjtu
 zJVZ+RWaiUdY0fCLB0dpChIohluLj4a7DxoRgp7Q2TPlgU9uBfU6uQSDiicWt37+Ui
 Ks405ow8suOJA==
Date: Tue, 10 Sep 2024 13:59:52 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Cc: Borislav Petkov <bp@alien8.de>, linux-stm32@st-md-mailman.stormreply.com,
 Yannick Fertre <yannick.fertre@foss.st.com>, 
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: dw_mipi_dsi-stm.c:(.text+0x8db9a3): undefined reference to
 `clk_hw_unregister'
Message-ID: <20240910-gleaming-boa-of-drama-d0a4db@houat>
References: <20240905081902.GAZtlpdlQp5XOm5XtO@fat_crate.local>
 <544a633e-de53-493d-9c29-de8ff52630da@foss.st.com>
 <20240909084506.GBZt61kqqGVUTqjKc4@fat_crate.local>
 <0e9018d0-c49f-4dac-aa0f-b05504f9c6f6@foss.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="ikp2nxlqytchy5qv"
Content-Disposition: inline
In-Reply-To: <0e9018d0-c49f-4dac-aa0f-b05504f9c6f6@foss.st.com>
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


--ikp2nxlqytchy5qv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 10, 2024 at 12:48:49PM GMT, Raphael Gallais-Pou wrote:
>=20
> On 9/9/24 10:45, Borislav Petkov wrote:
> > On Mon, Sep 09, 2024 at 08:57:57AM +0200, Raphael Gallais-Pou wrote:
> >> Arnd Bergmann sent a patch regarding this issue on x86 that I merged s=
everal
> >> weeks ago.
> >>
> >> https://lore.kernel.org/lkml/20240719075454.3595358-1-arnd@kernel.org/
> >> https://lore.kernel.org/all/c3d0757a-07c0-4f83-9f06-c3ad205aa1e9@foss.=
st.com/
> > Thanks.
> >
> >> Now, I'm not familiar with PowerPC architecture and toolchains, but I =
think
> >> this patch should fix your problem.  Do you have the above fixup in yo=
ur
> >> tree ? If not please try it.
> > Not PowerPC - it is an x86 build. I do random config builds as part of =
build
> > testing and when a driver depends on COMPILE_TEST, it does gets built i=
n some
> > .configs. So some may fail, as in this case.
>=20
> Unless I am mistaken, the link you provided refers to a PowerPC linker er=
ror:
>=20
> [...]
>=20
> compiler: powerpc-linux-gcc (GCC) 14.1.0
>=20
> [...]
>    powerpc-linux-ld: drivers/gpu/drm/stm/dw_mipi_dsi-stm.o: in function `=
dw_mipi_dsi_stm_remove':
>    dw_mipi_dsi-stm.c:(.text+0x664): undefined reference to `of_clk_del_pr=
ovider'
> >> powerpc-linux-ld: dw_mipi_dsi-stm.c:(.text+0x66c): undefined reference=
 to `clk_hw_unregister'    powerpc-linux-ld: drivers/gpu/drm/stm/dw_mipi_ds=
i-stm.o: in function `dw_mipi_dsi_stm_probe':
>    dw_mipi_dsi-stm.c:(.text+0x98c): undefined reference to `clk_hw_regist=
er'
>=20
> >
> > So I think you should send that patch to Linus now so that such randcon=
fig
> > builds do not fail anymore.
>=20
> What do you mean by 'sending it to Linus' ? If you meant to do a pull req=
uest,
> then no. This patch is already in the drm-misc tree, which means it will =
keep
> its usual pace of merging with the rest of the drm-misc tree.
>=20
> For more information about drm-misc tree:
> https://drm.pages.freedesktop.org/maintainer-tools/repositories/drm-misc.=
html#merge-timeline

That's not entirely correct. This should have been merged in
drm-misc-fixes to begin with. I've cherry-picked the patch and pushed
it.

Maxime

--ikp2nxlqytchy5qv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZuA0uAAKCRAnX84Zoj2+
dgyDAYCAyvDYsPL75t2AkYl/NeLGpHI0ydusikNL/pViVa44jYu00uf/os+RII4U
dJpBTEUBgIaB1vXiJA/gQbNty16ep7csySm1uhCN7oxqzpj2egL/ETWyppe/T/+R
ABp2aU8SiA==
=h+RS
-----END PGP SIGNATURE-----

--ikp2nxlqytchy5qv--
