Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F4B783B64
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 10:06:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 030CD10E2F1;
	Tue, 22 Aug 2023 08:06:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5133110E2EA
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Aug 2023 08:06:07 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A324C60EB6;
 Tue, 22 Aug 2023 08:06:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75EEEC433C7;
 Tue, 22 Aug 2023 08:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692691566;
 bh=7nFJmQsg0QQl+DVMPOeNrxjR2t6HRodjAeDtQY+RzMY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E4zym6stsQOD/oBgW4YMDgyiJ2/IgugzWRbQLeY9Yjqb7LXagafkUqJlkdk7VH7D4
 SXN2d0pu10kYKPRz8a6uXxritxXM10MNKPvY4GqZWYb1QdK7xgoPIb3BNRK5g0sqYH
 BiZiE0//YTj51qYz1vG8s5OTBL0spF71OQwD+qIvSUMzD71W+0LtGrCEcB8EEy55g6
 TTOak4+0A74e9aQoNHSGtj1llNdVTalJSL9SV/v1IR7DN72hw89T+7u3NC82Ykyqxw
 Dbl0t0va3Ln5udNpoPebLiuc/sNnLZfECY0uawJ0NVvwcr8QeJITvfrmWYe9FLALU2
 CGxxCZ8YkGUgw==
Date: Tue, 22 Aug 2023 10:06:02 +0200
From: "mripard@kernel.org" <mripard@kernel.org>
To: Ying Liu <victor.liu@nxp.com>
Subject: Re: [PATCH v14 0/6] drm/imx: Introduce i.MX8qm/qxp DPU DRM
Message-ID: <x3odw5zxaz5r52zmwf6owdgalthkhbjogsvblzuj3vjaugu3kr@6jr4lsaxkkn3>
References: <20230106055056.2883302-1-victor.liu@nxp.com>
 <AM7PR04MB7046E7F22B817FC6FE8DA95A981FA@AM7PR04MB7046.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="b7dz62g3jq6f5w2p"
Content-Disposition: inline
In-Reply-To: <AM7PR04MB7046E7F22B817FC6FE8DA95A981FA@AM7PR04MB7046.eurprd04.prod.outlook.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>,
 "Laurentiu Palcu \(OSS\)" <laurentiu.palcu@oss.nxp.com>,
 Guido =?utf-8?Q?G=C3=BCnther?= <guido.gunther@puri.sm>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--b7dz62g3jq6f5w2p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Aug 22, 2023 at 05:36:14AM +0000, Ying Liu wrote:
> Hi,
>=20
> > On Friday, January 6, 2023 1:50 PM Ying Liu wrote:
> >=20
> > Hi,
> >=20
> >=20
> > This is the v14 series to introduce i.MX8qm/qxp Display Processing Unit=
(DPU)
> > DRM support.
> >=20
> > DPU is comprised of a blit engine for 2D graphics, a display controller
> > and a command sequencer.  Outside of DPU, optional prefetch engines can
> > fetch data from memory prior to some DPU fetchunits of blit engine and
> > display controller.  The pre-fetchers support linear formats and Vivante
> > GPU tile formats.
> >=20
> > Reference manual can be found at:
> > https://www.nxp.com/webapp/Download?colCode=3DIMX8DQXPRM
> >=20
> >=20
> > This patch set adds kernel modesetting support for the display controll=
er part.
> > It supports two CRTCs per display controller, several planes, prefetch
> > engines and some properties of CRTC and plane.  Currently, the register=
s of
> > the controller is accessed without command sequencer involved, instead =
just
> > by
> > using CPU.  DRM connectors would be created from the DPU KMS driver.
> >=20
> >=20
> > Patch 1 ~ 3 add dt-bindings for DPU and prefetch engines.
> > Patch 4 is a minor improvement of a macro to suppress warning as the KMS
> > driver
> > uses it.
> > Patch 5 introduces the DPU DRM support.
> > Patch 6 updates MAINTAINERS.
> >=20
> > Welcome comments, thanks.
> >=20
> > v13->v14:
> > * Rebase the patch series to the latest drm-misc-next branch(v6.1-rc6 b=
ased).
> > * Include drm_fbdev_generic.h in dpu_drv.c due to the rebase.
> > * Fix dpu drm driver suspend/resume by properly get drm device through
> >   dev_get_drvdata().
> > * Use pm_ptr() macro for dpu core driver PM operations.
> > * Use pm_sleep_ptr() macro for dpu drm driver PM operations.
> > * Use DEFINE_SIMPLE_DEV_PM_OPS() macro to define dpu drm driver PM
> > operations,
> >   instead of SIMPLE_DEV_PM_OPS().
> > * Update year of Copyright.
> > * Add SoC series name 'i.MX8'/'IMX8'/'imx8' to dpu driver module decrip=
tion,
> >   Kconfig name, dpu driver names and dpu driver object name.
> >=20
> > v12->v13:
> > * Drop 'drm->irq_enabled =3D true;' from patch 5/6 to fix a potential b=
uild
> >   break reported by 'kernel test robot <lkp@intel.com>'.  drm->irq_enab=
led
> >   should not be used by imx-dpu drm as it is only used by legacy drivers
> >   with userspace modesetting.
> >=20
> > v11->v12:
> > * Rebase the series upon v6.1-rc1.
> > * Minor update on Kconfigs, struct names and macro names for patch 5/6
> >   due to the rebase.
> >=20
> > v10->v11:
> > * Rebase the series upon v6.0-rc1.
> > * Include drm_blend.h and drm_framebuffer.h in dpu-kms.c and dpu-
> > plane.c
> >   to fix build errors due to the rebase.
> > * Fix a checkpatch warning for dpu-crtc.c.
> > * Properly use dev_err_probe() to return it's return value directly whe=
re
> >   possible.
> >=20
> > v9->v10:
> > * Rebase the series upon v5.18-rc1.
> > * Make 'checkpatch.pl --strict' happier for patch 5/6.
> > * Add Rob's R-b tag on patch 3/6.
> > * Add Laurentiu's R-b tag on patch 5/6.
> > * Add Laurentiu's A-b tag on patch 6/6.
> >=20
> > v8->v9:
> > * Use drm_atomic_get_new_plane_state() in dpu_plane_atomic_update()
> > for
> >   patch 5/6. (Laurentiu)
> > * Drop getting DPU DT alias ID for patch 5/6, as it is unused.
> > * Reference 'interrupts-extended' schema instead of 'interrupts' for pa=
tch
> > 3/6
> >   to require an additional DPR interrupt(r_rtram_stall) because the ref=
erence
> >   manual does mention it, though the driver doesn't get/use it for now.
> >   Reference 'interrupt-names' schema to define the two DPR interrupt na=
mes
> > -
> >   'dpr_wrap' and 'r_rtram_stall'.  Accordingly, patch 5/6 gets the 'dpr=
_wrap'
> >   interrupt by name.
> > * Drop Rob's R-b tag on patch 3/6, as review is needed.
> >=20
> > v7->v8:
> > * Rebase this series up onto the latest drm-misc-next branch, due to DRM
> > plane
> >   helper functions API change(atomic_check and atomic_update) from DRM
> > atomic
> >   core.  So, dpu_plane_atomic_check() and dpu_plane_atomic_update() are
> > updated
> >   accordingly in patch 5/6.  Also, rename plane->state variables and re=
levant
> >   DPU plane state variables in those two functions to reflect they are =
new
> >   states, like the patch 'drm: Rename plane->state variables in atomic =
update
> >   and disable' recently landed in drm-misc-next.
> > * Replace drm_gem_fb_prepare_fb() with
> > drm_gem_plane_helper_prepare_fb() in
> >   patch 5/6, due to DRM core API change.
> > * Improve DPR burst length for GPU standard tile and 32bpp GPU super ti=
le in
> >   patch 5/6 to align with the latest version of internal HW documention.
> >=20
> > v6->v7:
> > * Fix return value of dpu_get_irqs() if platform_get_irq() fails. (Laur=
entiu)
> > * Use the function array dpu_irq_handler[] to store individual DPU irq
> > handlers.
> >   (Laurentiu)
> > * Call get/put() hooks directly to get/put DPU fetchunits for DPU plane=
 groups.
> >   (Laurentiu)
> > * Shorten the names of individual DPU irq handlers by using DPU unit ab=
brev
> >   names to make writing dpu_irq_handler[] easier.
> > * Add Rob's R-b tag back on DPU dt-binding patch as change in v6 was
> > reviewed.
> >=20
> > v5->v6:
> > * Use graph schema in the DPU dt-binding.
> > * Do not use macros where possible in the DPU DRM driver. (Laurentiu)
> > * Break dpu_plane_atomic_check() into some smaller functions. (Laurenti=
u)
> > * Address some minor comments from Laurentiu on the DPU DRM driver.
> > * Add dpu_crtc_err() helper marco in the DPU DRM driver to tell dmesg
> >   which CRTC generates error.
> > * Drop calling dev_set_drvdata() from dpu_drm_bind/unbind() in the DPU
> > DRM
> >   driver as it is done in dpu_drm_probe().
> > * Some trivial tweaks.
> >=20
> > v4->v5:
> > * Rebase up onto the latest drm-misc-next branch and remove the hook to
> >   drm_atomic_helper_legacy_gamma_set() from patch 5/6, because it was
> > dropped
> >   by the newly landed commit 'drm: automatic legacy gamma support'.
> > * Remove a redundant blank line from dpu_plane_atomic_update() in patch
> > 5/6.
> >=20
> > v3->v4:
> > * Improve compatible properties in DPU and prefetch engines' dt bindings
> >   by using enum instead of oneOf+const.
> > * Add Rob's R-b tags on dt binding patches(patch 1/6, 2/6 and 3/6).
> > * Add Daniel's A-b tag on patch 4/6.
> >=20
> > v2->v3:
> > * Fix DPU DRM driver build warnings which are
> >   Reported-by: kernel test robot <lkp@intel.com>.
> > * Drop DPU DRM driver build dependency on IMX_SCU, as dummy SCU
> > functions have
> >   been added in header files by the patch 'firmware: imx: add dummy
> > functions'
> >   which has landed in linux-next/master branch.
> > * Add a missing blank line in include/drm/drm_atomic.h.
> >=20
> > v1->v2:
> > * Test this patch set also with i.MX8qm LVDS displays.
> > * Drop the device tree patches because we'll use new dt binding way to
> >   support i.MX8qm/qxp clocks.  This depends on a not-yet-landed patch s=
et
> >   to do basic conversions for the platforms.
> > * Fix dt binding yamllint warnings.
> > * Require bypass0 and bypass1 clocks for both i.MX8qxp and i.MX8qm in
> > DPU's
> >   dt binding documentation.
> > * Use new dt binding way to add clocks in the dt binding examples.
> > * Address several comments from Laurentiu on the DPU DRM patch.
> >=20
> >=20
> > Liu Ying (6):
> >   dt-bindings: display: imx: Add i.MX8qxp/qm DPU binding
> >   dt-bindings: display: imx: Add i.MX8qxp/qm PRG binding
> >   dt-bindings: display: imx: Add i.MX8qxp/qm DPR channel binding
> >   drm/atomic: Avoid unused-but-set-variable warning on
> >     for_each_old_plane_in_state
> >   drm/imx: Introduce i.MX8qm/qxp DPU DRM
> >   MAINTAINERS: add maintainer for i.MX8qxp DPU DRM driver
> >=20
> >  .../display/imx/fsl,imx8qxp-dprc.yaml         |  100 ++
> >  .../bindings/display/imx/fsl,imx8qxp-dpu.yaml |  387 ++++++
> >  .../bindings/display/imx/fsl,imx8qxp-prg.yaml |   60 +
> >  MAINTAINERS                                   |    9 +
> >  drivers/gpu/drm/imx/Kconfig                   |    1 +
> >  drivers/gpu/drm/imx/Makefile                  |    1 +
> >  drivers/gpu/drm/imx/dpu/Kconfig               |    9 +
> >  drivers/gpu/drm/imx/dpu/Makefile              |   10 +
> >  drivers/gpu/drm/imx/dpu/dpu-constframe.c      |  171 +++
> >  drivers/gpu/drm/imx/dpu/dpu-core.c            | 1044 +++++++++++++++++
> >  drivers/gpu/drm/imx/dpu/dpu-crtc.c            |  969 +++++++++++++++
> >  drivers/gpu/drm/imx/dpu/dpu-crtc.h            |   72 ++
> >  drivers/gpu/drm/imx/dpu/dpu-disengcfg.c       |  117 ++
> >  drivers/gpu/drm/imx/dpu/dpu-dprc.c            |  715 +++++++++++
> >  drivers/gpu/drm/imx/dpu/dpu-dprc.h            |   40 +
> >  drivers/gpu/drm/imx/dpu/dpu-drv.c             |  294 +++++
> >  drivers/gpu/drm/imx/dpu/dpu-drv.h             |   28 +
> >  drivers/gpu/drm/imx/dpu/dpu-extdst.c          |  299 +++++
> >  drivers/gpu/drm/imx/dpu/dpu-fetchdecode.c     |  292 +++++
> >  drivers/gpu/drm/imx/dpu/dpu-fetcheco.c        |  224 ++++
> >  drivers/gpu/drm/imx/dpu/dpu-fetchlayer.c      |  152 +++
> >  drivers/gpu/drm/imx/dpu/dpu-fetchunit.c       |  610 ++++++++++
> >  drivers/gpu/drm/imx/dpu/dpu-fetchunit.h       |  195 +++
> >  drivers/gpu/drm/imx/dpu/dpu-fetchwarp.c       |  248 ++++
> >  drivers/gpu/drm/imx/dpu/dpu-framegen.c        |  395 +++++++
> >  drivers/gpu/drm/imx/dpu/dpu-gammacor.c        |  223 ++++
> >  drivers/gpu/drm/imx/dpu/dpu-hscaler.c         |  275 +++++
> >  drivers/gpu/drm/imx/dpu/dpu-kms.c             |  542 +++++++++
> >  drivers/gpu/drm/imx/dpu/dpu-kms.h             |   23 +
> >  drivers/gpu/drm/imx/dpu/dpu-layerblend.c      |  348 ++++++
> >  drivers/gpu/drm/imx/dpu/dpu-plane.c           |  804 +++++++++++++
> >  drivers/gpu/drm/imx/dpu/dpu-plane.h           |   59 +
> >  drivers/gpu/drm/imx/dpu/dpu-prg.c             |  433 +++++++
> >  drivers/gpu/drm/imx/dpu/dpu-prg.h             |   45 +
> >  drivers/gpu/drm/imx/dpu/dpu-prv.h             |  231 ++++
> >  drivers/gpu/drm/imx/dpu/dpu-tcon.c            |  250 ++++
> >  drivers/gpu/drm/imx/dpu/dpu-vscaler.c         |  308 +++++
> >  drivers/gpu/drm/imx/dpu/dpu.h                 |  385 ++++++
> >  include/drm/drm_atomic.h                      |    5 +-
> >  39 files changed, 10372 insertions(+), 1 deletion(-)
> >  create mode 100644
> > Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dprc.yaml
> >  create mode 100644
> > Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dpu.yaml
> >  create mode 100644
> > Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-prg.yaml
> >  create mode 100644 drivers/gpu/drm/imx/dpu/Kconfig
> >  create mode 100644 drivers/gpu/drm/imx/dpu/Makefile
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-constframe.c
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-core.c
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-crtc.c
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-crtc.h
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-disengcfg.c
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-dprc.c
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-dprc.h
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-drv.c
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-drv.h
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-extdst.c
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-fetchdecode.c
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-fetcheco.c
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-fetchlayer.c
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-fetchunit.c
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-fetchunit.h
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-fetchwarp.c
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-framegen.c
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-gammacor.c
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-hscaler.c
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-kms.c
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-kms.h
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-layerblend.c
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-plane.c
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-plane.h
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-prg.c
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-prg.h
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-prv.h
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-tcon.c
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-vscaler.c
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu.h
> >=20
> > --
> > 2.37.1
>=20
> This patch series has been submitted for a quite long period of time.
>=20
> Anything I can do to have it landed ?

I'm not sure why it fell through the cracks, but given that it's more
than 6 monthes old, please rebase and resend it.

Maxime

--b7dz62g3jq6f5w2p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZORsagAKCRDj7w1vZxhR
xVLOAP0S4rsQCxdj1ZEL2g/aGj7r1ilhBbBzQNtVF0hihATPxgEAqgK6F5DoRQDb
7snvA50RUsoRg0vNAk16bzAhEIXP0gY=
=mLl3
-----END PGP SIGNATURE-----

--b7dz62g3jq6f5w2p--
