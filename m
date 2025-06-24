Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 428F3AE6C07
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 18:04:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BB0D10E5E7;
	Tue, 24 Jun 2025 16:04:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pxJhHrWA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB66D10E096
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 16:04:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 58DA761142;
 Tue, 24 Jun 2025 16:04:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DF1BC4CEE3;
 Tue, 24 Jun 2025 16:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750781068;
 bh=QbCVRBh2Lu2DWsu/OspFLvrpSVg7Vb0ull1pA72H2zE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pxJhHrWA1IAKtCFz64tYdA190DbEFcxU37tR5p6wbNLYPycUj0Zy3cLlPgm/VdhVQ
 uB36eC2CiSE3m6yUPyIrUSfIT3SVZiA/NL7Xox2zUksSymsGbW8fEifGGaRTxv70vI
 NH7FvmiKC+D4cuCmVmmeOot6oMsgYxjSadwId5IS4q8YYF5b2vBOJ2B7THpRpDi0OB
 oNxcr23ltHETJ+6PuAcGHjmHl9z5dMQ+4G+3dE/JEt4kvbc4iWutLCvZ/3n8/l8Wsn
 TnObWWLGYvd2UMUFK7/T2C42G5zh8zSbBSXMi9PbQavNYe/Uz9eZQsdYRcmVL0ttr+
 BSxERCJRbX4uw==
Date: Tue, 24 Jun 2025 18:04:25 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, 
 Michal Wilczynski <m.wilczynski@samsung.com>, Drew Fustini <drew@pdp7.com>,
 Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Frank Binns <frank.binns@imgtec.com>, 
 Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Marek Szyprowski <m.szyprowski@samsung.com>, 
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [GIT PULL] Immutable tag between the pwrseq, drm and pmdomain
 trees for v6.17-rc1
Message-ID: <20250624-didactic-inquisitive-axolotl-33c2ce@houat>
References: <20250624141013.81358-1-brgl@bgdev.pl>
 <CAMRc=MeKfWsf8T1tJLdj=+7aq0zGpQ07pHd2Mz-Y=Bwae0sAbw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="t7y4wxlov2z67pu2"
Content-Disposition: inline
In-Reply-To: <CAMRc=MeKfWsf8T1tJLdj=+7aq0zGpQ07pHd2Mz-Y=Bwae0sAbw@mail.gmail.com>
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


--t7y4wxlov2z67pu2
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [GIT PULL] Immutable tag between the pwrseq, drm and pmdomain
 trees for v6.17-rc1
MIME-Version: 1.0

Hi,

On Tue, Jun 24, 2025 at 04:40:43PM +0200, Bartosz Golaszewski wrote:
> On Tue, Jun 24, 2025 at 4:10=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
> >
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Here's an immutable tag containing the thead 1520 power sequencing driv=
er
> > for the drm and pmdomain trees to pull from.
> >
> > Best Regards,
> > Bartosz Golaszewski
>=20
> Just an FYI - there don't seem to be any actual build-time
> dependencies between this driver and the rest of the code that uses it
> (thanks to the aux bus usage etc.) so Michal, Ulf et al: you can
> probably skip the pull if you can rely on this being available in
> linux-next for run-time testing.

Yeah, I was about to say I don't think we will pull it in DRM. As far as
I know, it's only about runtime dependencies that will be reconciled
when all the trees will be merged by Linus.

Maxime

--t7y4wxlov2z67pu2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaFrMiQAKCRAnX84Zoj2+
dsYBAYCu3xP1Pw5J37rmb/byVqOoAoydBCvTz3kfgbVQp3vPUTr0ZD2UbuN+ujlL
Zkmbkk0BfiUojDX+qMMUGMXoyoaJl+/0kqMvR5GbrFkjXthPpZDq6r6DYHOfahhj
xLUHbqmIbg==
=0bcI
-----END PGP SIGNATURE-----

--t7y4wxlov2z67pu2--
