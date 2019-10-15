Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FC8D7FB5
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 21:16:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D6F26E3A4;
	Tue, 15 Oct 2019 19:16:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C5676E3A4
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 19:16:13 +0000 (UTC)
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it
 [2.224.242.101]) (Authenticated sender: jacopo@jmondi.org)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id E68C740005;
 Tue, 15 Oct 2019 19:16:05 +0000 (UTC)
Date: Tue, 15 Oct 2019 21:17:54 +0200
From: Jacopo Mondi <jacopo@jmondi.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v5 5/8] drm: rcar-du: crtc: Control CMM operations
Message-ID: <20191015191754.hil5xc45lbzn3226@uno.localdomain>
References: <20191015104621.62514-1-jacopo+renesas@jmondi.org>
 <20191015104621.62514-6-jacopo+renesas@jmondi.org>
 <42ae76b8-c65f-8c5e-e83a-fc6a422d2624@ideasonboard.com>
 <20191015133752.oyb3p6iyr3ekjxic@uno.localdomain>
 <20191015175422.GN4875@pendragon.ideasonboard.com>
MIME-Version: 1.0
In-Reply-To: <20191015175422.GN4875@pendragon.ideasonboard.com>
User-Agent: NeoMutt/20180716
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: muroya@ksk.co.jp, horms@verge.net.au, VenkataRajesh.Kalakodima@in.bosch.com,
 airlied@linux.ie, koji.matsuoka.xm@renesas.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, geert@linux-m68k.org,
 seanpaul@chromium.org, Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Harsha.ManjulaMallikarjun@in.bosch.com, uli+renesas@fpond.eu,
 ezequiel@collabora.com
Content-Type: multipart/mixed; boundary="===============1763416765=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1763416765==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ahlhhwwxjeyfb4yu"
Content-Disposition: inline


--ahlhhwwxjeyfb4yu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Laurent,

On Tue, Oct 15, 2019 at 08:54:22PM +0300, Laurent Pinchart wrote:
> Hi Jacopo,
>
> Thank you for the patch.
>
> On Tue, Oct 15, 2019 at 03:37:52PM +0200, Jacopo Mondi wrote:
> > On Tue, Oct 15, 2019 at 02:15:35PM +0100, Kieran Bingham wrote:
> > > On 15/10/2019 11:46, Jacopo Mondi wrote:
> > > > Implement CMM handling in the crtc begin and enable atomic callbacks,
> > > > and enable CMM unit through the Display Extensional Functions
> > >
> > > Extensional ?
> > >
> > > Perhaps this should just be Display Extension Functions?
> > > Wow - that's actually what they call it in the data-sheet.
> > >
> > > > register at group setup time.
> > >
> > > Only a trivial extra blank line below that I can find... so
> > >
> > > Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > >
> > > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > > > ---
> > > >  drivers/gpu/drm/rcar-du/rcar_du_crtc.c  | 79 +++++++++++++++++++++++++
> > > >  drivers/gpu/drm/rcar-du/rcar_du_group.c |  5 ++
> > > >  drivers/gpu/drm/rcar-du/rcar_du_regs.h  |  5 ++
> > > >  3 files changed, 89 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> > > > index 23f1d6cc1719..4bc50a3f4a00 100644
> > > > --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> > > > +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> > > > @@ -21,6 +21,7 @@
> > > >  #include <drm/drm_plane_helper.h>
> > > >  #include <drm/drm_vblank.h>
> > > >
> > > > +#include "rcar_cmm.h"
> > > >  #include "rcar_du_crtc.h"
> > > >  #include "rcar_du_drv.h"
> > > >  #include "rcar_du_encoder.h"
> > > > @@ -474,6 +475,70 @@ static void rcar_du_crtc_wait_page_flip(struct rcar_du_crtc *rcrtc)
> > > >  	rcar_du_crtc_finish_page_flip(rcrtc);
> > > >  }
> > > >
> > > > +/* -----------------------------------------------------------------------------
> > > > + * Color Management Module (CMM)
> > > > + */
>
> Missing blank line.
>
> > > > +static int rcar_du_cmm_enable(struct drm_crtc *crtc)
> > > > +{
> > > > +	struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
> > > > +
> > > > +	if (!rcrtc->cmm)
> > > > +		return 0;
> > > > +
> > > > +	return rcar_cmm_enable(rcrtc->cmm);
> > > > +}
> > > > +
> > > > +static void rcar_du_cmm_disable(struct drm_crtc *crtc)
> > > > +{
> > > > +	struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
> > > > +
> > > > +	if (!rcrtc->cmm)
> > > > +		return;
> > > > +
> > > > +	rcar_cmm_disable(rcrtc->cmm);
> > > > +}
>
> I think I would have inlined those two functions in their only call site
> as
>
> 	if (rcrtc->cmm)
> 		rcar_cmm_enable(rcrtc->cmm);
>
> but that's up to you.
>

Mmm, I preferred to avoid if() in the caller, but as this is a small
increment to an existing big driver, I'll go for the most consistent
way

> > > > +
> > > > +static int rcar_du_cmm_check(struct drm_crtc *crtc,
> > > > +			     struct drm_crtc_state *state)
> > > > +{
> > > > +	struct drm_property_blob *drm_lut = state->gamma_lut;
> > > > +	struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
> > > > +	struct device *dev = rcrtc->dev->dev;
> > > > +
> > > > +	if (!rcrtc->cmm || !drm_lut)
> > > > +		return 0;
> > > > +
> > > > +	/* We only accept fully populated LUT tables. */
> > > > +	if (CM2_LUT_SIZE * sizeof(struct drm_color_lut) !=
> > > > +	    drm_lut->length) {
>
> How about
>
> 	if (drm_color_lut_size(drm_lut) != CM2_LUT_SIZE)
>
> ?
>

Better :)

> > > > +		dev_err(dev, "invalid gamma lut size: %lu bytes\n",
> > > > +			drm_lut->length);
> > > > +		return -EINVAL;
> > > > +	}
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static void rcar_du_cmm_setup(struct drm_crtc *crtc)
> > > > +{
> > > > +	struct drm_property_blob *drm_lut = crtc->state->gamma_lut;
> > > > +	struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
> > > > +	struct rcar_cmm_config cmm_config = {};
> > > > +
> > > > +	if (!rcrtc->cmm)
> > > > +		return;
> > > > +
> > > > +	if (drm_lut) {
> > > > +		cmm_config.lut.enable = true;
> > > > +		cmm_config.lut.table = (struct drm_color_lut *)drm_lut->data;
> > > > +
> > > > +	} else {
> > > > +		cmm_config.lut.enable = false;
> > > > +	}
>
> This could be changed to
>
> 	if (drm_lut)
> 		cmm_config.lut.table = (struct drm_color_lut *)drm_lut->data;
>
> if we dropped the enable field.
>

Dropping enable seems good

> > > > +
> > > > +	rcar_cmm_setup(rcrtc->cmm, &cmm_config);
> > > > +}
> > > > +
> > > >  /* -----------------------------------------------------------------------------
> > > >   * Start/Stop and Suspend/Resume
> > > >   */
> > > > @@ -619,6 +684,8 @@ static void rcar_du_crtc_stop(struct rcar_du_crtc *rcrtc)
> > > >  	if (rcar_du_has(rcrtc->dev, RCAR_DU_FEATURE_VSP1_SOURCE))
> > > >  		rcar_du_vsp_disable(rcrtc);
> > > >
> > > > +	rcar_du_cmm_disable(crtc);
> > > > +
> > > >  	/*
> > > >  	 * Select switch sync mode. This stops display operation and configures
> > > >  	 * the HSYNC and VSYNC signals as inputs.
> > > > @@ -631,6 +698,7 @@ static void rcar_du_crtc_stop(struct rcar_du_crtc *rcrtc)
> > > >  					   DSYSR_TVM_SWITCH);
> > > >
> > > >  	rcar_du_group_start_stop(rcrtc->group, false);
> > > > +
> > >
> > > Extra blank line...
> >
> > Thanks for spotting this. I'm quite sure I run checkpatch (I just
> > re-did) and not warnings for the extra white space in the previous
> > patch, or this extra blank line o_0
> >
> > > >  }
> > > >
> > > >  /* -----------------------------------------------------------------------------
> > > > @@ -642,6 +710,11 @@ static int rcar_du_crtc_atomic_check(struct drm_crtc *crtc,
> > > >  {
> > > >  	struct rcar_du_crtc_state *rstate = to_rcar_crtc_state(state);
> > > >  	struct drm_encoder *encoder;
> > > > +	int ret;
> > > > +
> > > > +	ret = rcar_du_cmm_check(crtc, state);
> > > > +	if (ret)
> > > > +		return ret;
> > > >
> > > >  	/* Store the routes from the CRTC output to the DU outputs. */
> > > >  	rstate->outputs = 0;
> > > > @@ -667,6 +740,7 @@ static void rcar_du_crtc_atomic_enable(struct drm_crtc *crtc,
> > > >  	struct rcar_du_crtc_state *rstate = to_rcar_crtc_state(crtc->state);
> > > >  	struct rcar_du_device *rcdu = rcrtc->dev;
> > > >
> > > > +	rcar_du_cmm_enable(crtc);
> > > >  	rcar_du_crtc_get(rcrtc);
> > > >
> > > >  	/*
> > > > @@ -686,6 +760,7 @@ static void rcar_du_crtc_atomic_enable(struct drm_crtc *crtc,
> > > >  	}
> > > >
> > > >  	rcar_du_crtc_start(rcrtc);
> > > > +	rcar_du_cmm_setup(crtc);
>
> This is the only part that really bothers me, we setup the LUT after
> starting the CRTC, so the first frame will be output with a disabled
> LUT, or possibly even with the LUT enabled in the middle of the frame.

I tested by programming a gamma_table to the very first frame, and the
table gets set. I cannot tell at the naked eye if it actually takes effect
on the first one though :)

> Do I recall correctly that moving setup before start causes issues ?
> Could you explain what happens ?

Simply, the machine hangs :0

The chip manual prescribes to ("35A.3.2 CMM Setting")

4) LUT Activation: Set LUT_EN bit of CMM_LUT_CTRL register to 1
5) DU Activation
6) LUT updates: (In case of single buffer mode)
        Any accesses to update LUT table after next frame start,
        output value from CMM is not guaranteed.

What we do is actually
5) 4) 6) as 4 and 6 happens in cmm_setup()

It seems anyway from point 6 description that there are not many ways
to programm a LUT table -before- DU activation, but it might depends
if DU activation implies only clock and power activation, or the
actual routing and compositor activation as it happens in
rcar_du_crtc_start().

I could actually try to program the CMM just before the VSP compositor
is activated... Is it worth it ?

>
> > > >  }
> > > >
> > > >  static void rcar_du_crtc_atomic_disable(struct drm_crtc *crtc,
> > > > @@ -739,6 +814,10 @@ static void rcar_du_crtc_atomic_begin(struct drm_crtc *crtc,
> > > >  	 */
> > > >  	rcar_du_crtc_get(rcrtc);
> > > >
> > > > +	/* If the active state changed, we let .atomic_enable handle CMM. */
> > > > +	if (crtc->state->color_mgmt_changed && !crtc->state->active_changed)
> > > > +		rcar_du_cmm_setup(crtc);
> > >
> > > Aha, this is quite neat for handling the timings.
> >
> > Yes, much more streamlined than what we had. Thanks Sean and Ezequiel :)
>
> Yes, it guarantees that the CRTC is enabled, so we should be safe with
> the assumption from patch 3/8 that rcar_du_cmm_setup() is always called
> with the CMM enabled.
>
> Interestingly though, this doesn't implement atomicity. That will be a
> very interesting challenge. We should use double buffering of the LUT in
> the CMM to avoid it being modified in the middle of the frame, but how
> to update it in sync with the commit, and thus the VSP, remains to be
> researched.
>
> Could you maybe add a TODO comment in patch 3/8 to mention that we
> should use double buffering ?
>

Yes, that should probably be supported

> > > > +
> > > >  	if (rcar_du_has(rcrtc->dev, RCAR_DU_FEATURE_VSP1_SOURCE))
> > > >  		rcar_du_vsp_atomic_begin(rcrtc);
> > > >  }
> > > > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_group.c b/drivers/gpu/drm/rcar-du/rcar_du_group.c
> > > > index 9eee47969e77..583de800a66d 100644
> > > > --- a/drivers/gpu/drm/rcar-du/rcar_du_group.c
> > > > +++ b/drivers/gpu/drm/rcar-du/rcar_du_group.c
> > > > @@ -135,6 +135,7 @@ static void rcar_du_group_setup_didsr(struct rcar_du_group *rgrp)
> > > >  static void rcar_du_group_setup(struct rcar_du_group *rgrp)
> > > >  {
> > > >  	struct rcar_du_device *rcdu = rgrp->dev;
> > > > +	u32 defr7 = DEFR7_CODE;
> > > >
> > > >  	/* Enable extended features */
> > > >  	rcar_du_group_write(rgrp, DEFR, DEFR_CODE | DEFR_DEFE);
> > > > @@ -147,6 +148,10 @@ static void rcar_du_group_setup(struct rcar_du_group *rgrp)
> > > >
> > > >  	rcar_du_group_setup_pins(rgrp);
> > > >
>
> Could you please add a comment here to mention that we shouldn't route
> through CMM if no color management feature is used ?
>
> 	/*
> 	 * TODO: Handling routing the DU output to CMM dynamically, as we should
> 	 * bypass CMM completely when no color management feature is used.
> 	 */

I'm not sure I get what you mean. If CMM is not enabled we do not
enable the corresponding DEFR7_CMMEx

Or do you mean we should disable CMM if not gamma_table (or CLU table,
or other CMM functions) is provided ? I assume if any of those
functions is not enabled the pixels are not routed through the CMM (in
example if LUT_EN is not set, not lookup is performed). Am I wrong ?

Thanks
  j


>
> > > > +	defr7 |= (rgrp->cmms_mask & BIT(1) ? DEFR7_CMME1 : 0) |
> > > > +		 (rgrp->cmms_mask & BIT(0) ? DEFR7_CMME0 : 0);
> > > > +	rcar_du_group_write(rgrp, DEFR7, defr7);
> > > > +
> > > >  	if (rcdu->info->gen >= 2) {
> > > >  		rcar_du_group_setup_defr8(rgrp);
> > > >  		rcar_du_group_setup_didsr(rgrp);
> > > > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_regs.h b/drivers/gpu/drm/rcar-du/rcar_du_regs.h
> > > > index bc87f080b170..fb9964949368 100644
> > > > --- a/drivers/gpu/drm/rcar-du/rcar_du_regs.h
> > > > +++ b/drivers/gpu/drm/rcar-du/rcar_du_regs.h
> > > > @@ -197,6 +197,11 @@
> > > >  #define DEFR6_MLOS1		(1 << 2)
> > > >  #define DEFR6_DEFAULT		(DEFR6_CODE | DEFR6_TCNE1)
> > > >
> > > > +#define DEFR7			0x000ec
> > > > +#define DEFR7_CODE		(0x7779 << 16)
> > > > +#define DEFR7_CMME1		BIT(6)
> > > > +#define DEFR7_CMME0		BIT(4)
> > > > +
> > > >  /* -----------------------------------------------------------------------------
> > > >   * R8A7790-only Control Registers
> > > >   */
> > > >
>
> --
> Regards,
>
> Laurent Pinchart

--ahlhhwwxjeyfb4yu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl2mG2IACgkQcjQGjxah
VjyJ+RAAi41XiFprAJP0fOW2xJfcIgnt43NdApFCqPa/S8n1EmYdk6+qyVVKj9z0
mIGbKEDHifqiCyJDpDXoIUgjk9se1pSdEqVdo1KrOFtjxauoWs8zB8f4mdz4bhfz
cHT+nwkPgT4SL0QJ1sMdekgudg/DApUH1iMhLY+0NSVmSINlQxFrYU/w93egw7RB
qp+pEkvlJEgcw0Wxia6XizgloEVe5dPG9UfVaTOn6qv1TGc1VHu6Ub328g8zHwqP
0H5mLSQQEDhdtz3mbul38W4a+sujheG1eCkP9m+M6QYpRQ7U60e6jASem/kxo68A
3PK6IN4RVyp500DtSOJzktBJULBUdU5s124sU7r07uLUx/V031UzQINnT/SfwxwK
4n7vWtuFjz0syUyUV3j6nl0FOqS1W1CGgAcAB1tSjoVonzBlT++MWX/jB4EE4jpM
6/XoJMpQ/uL37pK4h1V7ZTyXjGYKLCEMDhNWLS9wEmRFg0BZ8x4VR3+w+2D5Gp9e
ezPw9rZm6eHOKQ3mPSLaGuHr6kQoKGNQzMip5/nL6lUuOm37Wjd4UoOqJcKsNjuu
eC8fiER/7thEvU+erDG4A2zoIMrKKfhMkADNUbJ3Wv81F3LpdNbnOdOD7ZlciEYG
4lD4cM4y5ENogFpSmxwfV8jEv0JMfoNuFME3SRLYrTjYorh9nrc=
=+fPV
-----END PGP SIGNATURE-----

--ahlhhwwxjeyfb4yu--

--===============1763416765==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1763416765==--
