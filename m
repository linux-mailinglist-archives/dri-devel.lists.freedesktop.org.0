Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA6C1F7CF8
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jun 2020 20:36:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AA196E162;
	Fri, 12 Jun 2020 18:36:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1B766E145;
 Fri, 12 Jun 2020 18:36:41 +0000 (UTC)
IronPort-SDR: lZ64LugYH9fINKUo7x0j6zUwOI5UXvfKnKZld35wMzcvpakyQIvtMBp3j4zzK6r7OUPvZMmelX
 S8Q2RLnzEFqA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2020 11:36:41 -0700
IronPort-SDR: 6HK/QEG8btZ70hTCt/G2/Y6Zx45cMdG6jrKvghSLiqdxbfz7monMC9qjbn71FwasXAnyv6v5KL
 5Sa0bGMIK+dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,504,1583222400"; d="scan'208";a="350604756"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga001.jf.intel.com with SMTP; 12 Jun 2020 11:36:38 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 12 Jun 2020 21:36:37 +0300
Date: Fri, 12 Jun 2020 21:36:37 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Manasi Navare <manasi.d.navare@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/dp: DP PHY compliance for JSL
Message-ID: <20200612183637.GL6112@intel.com>
References: <1591247028-5868-1-git-send-email-vidya.srinivas@intel.com>
 <20200604190612.GI6112@intel.com>
 <fea323968324ceefe813d34d80fdd9779614aa01.camel@intel.com>
 <20200604210319.GJ6112@intel.com> <20200612182542.GA7458@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200612182542.GA7458@intel.com>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Srinivas, Vidya" <vidya.srinivas@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Almahallawy, Khaled" <khaled.almahallawy@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 12, 2020 at 11:25:42AM -0700, Manasi Navare wrote:
> On Fri, Jun 05, 2020 at 12:03:19AM +0300, Ville Syrj=E4l=E4 wrote:
> > On Thu, Jun 04, 2020 at 08:01:03PM +0000, Almahallawy, Khaled wrote:
> > > On Thu, 2020-06-04 at 22:06 +0300, Ville Syrj=E4l=E4 wrote:
> > > > On Thu, Jun 04, 2020 at 10:33:48AM +0530, Vidya Srinivas wrote:
> > > > > Signed-off-by: Khaled Almahallawy <khaled.almahallawy@intel.com>
> > > > > Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
> > > > > ---
> > > > >  drivers/gpu/drm/i915/display/intel_dp.c | 40
> > > > > ++++++++++++++++++++++++++-------
> > > > >  1 file changed, 32 insertions(+), 8 deletions(-)
> > > > > =

> > > > > diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> > > > > b/drivers/gpu/drm/i915/display/intel_dp.c
> > > > > index 7223367171d1..44663e8ac9a1 100644
> > > > > --- a/drivers/gpu/drm/i915/display/intel_dp.c
> > > > > +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> > > > > @@ -5470,22 +5470,32 @@ intel_dp_autotest_phy_ddi_disable(struct
> > > > > intel_dp *intel_dp)
> > > > >  	struct drm_i915_private *dev_priv =3D to_i915(dev);
> > > > >  	struct intel_crtc *crtc =3D to_intel_crtc(intel_dig_port-
> > > > > >base.base.crtc);
> > > > >  	enum pipe pipe =3D crtc->pipe;
> > > > > -	u32 trans_ddi_func_ctl_value, trans_conf_value,
> > > > > dp_tp_ctl_value;
> > > > > +	u32 trans_ddi_func_ctl_value, trans_conf_value,
> > > > > dp_tp_ctl_value, trans_ddi_port_mask;
> > > > > +	enum port port =3D intel_dig_port->base.port;
> > > > > +	i915_reg_t dp_tp_reg;
> > > > > +
> > > > > +	if (IS_ELKHARTLAKE(dev_priv)) {
> > > > > +		dp_tp_reg =3D DP_TP_CTL(port);
> > > > > +		trans_ddi_port_mask =3D TRANS_DDI_PORT_MASK;
> > > > > +	} else if (IS_TIGERLAKE(dev_priv)) {
> > > > > +		dp_tp_reg =3D TGL_DP_TP_CTL(pipe);
> > > > > +		trans_ddi_port_mask =3D TGL_TRANS_DDI_PORT_MASK;
> > > > > +	}
> > > > >  =

> > > > >  	trans_ddi_func_ctl_value =3D intel_de_read(dev_priv,
> > > > >  						 TRANS_DDI_FUNC_CTL(pip
> > > > > e));
> > > > >  	trans_conf_value =3D intel_de_read(dev_priv, PIPECONF(pipe));
> > > > > -	dp_tp_ctl_value =3D intel_de_read(dev_priv, TGL_DP_TP_CTL(pipe)=
);
> > > > >  =

> > > > > +	dp_tp_ctl_value =3D intel_de_read(dev_priv, dp_tp_reg);
> > > > >  	trans_ddi_func_ctl_value &=3D ~(TRANS_DDI_FUNC_ENABLE |
> > > > > -				      TGL_TRANS_DDI_PORT_MASK);
> > > > > +					trans_ddi_port_mask);
> > > > >  	trans_conf_value &=3D ~PIPECONF_ENABLE;
> > > > >  	dp_tp_ctl_value &=3D ~DP_TP_CTL_ENABLE;
> > > > >  =

> > > > >  	intel_de_write(dev_priv, PIPECONF(pipe), trans_conf_value);
> > > > >  	intel_de_write(dev_priv, TRANS_DDI_FUNC_CTL(pipe),
> > > > >  		       trans_ddi_func_ctl_value);
> > > > > -	intel_de_write(dev_priv, TGL_DP_TP_CTL(pipe), dp_tp_ctl_value);
> > > > > +	intel_de_write(dev_priv, dp_tp_reg, dp_tp_ctl_value);
> > > > =

> > > > All this ad-hoc modeset code really should not exist. It's going to
> > > > have different bugs than the norma modeset paths, so compliance
> > > > testing
> > > > this special code proves absolutely nothing about the normal modeset
> > > > code. IMO someone needs to take up the task of rewrtiting all this =
to
> > > > just perform normal modesets.
> > > =

> > > Agree. I've just found that we get kernel NULL pointer dereference and
> > > panic when we try to access to_intel_crtc(intel_dig_port-
> > > >base.base.crtc).
> > =

> > Yeah, that's a legacy pointer which should no longer be used at all
> > with atomic drivers. I'm slowly trying to clear out all this legacy
> > cruft. The next step I had hoped to take was
> > https://patchwork.freedesktop.org/series/76993/ but then this
> > compliacnce stuff landed and threw another wrench into the works.
> =

> We had several discussions on design of DP PHY compliance and the patches=
 were on the M-L
> for quite some time without anyone giving feedback on the actual design o=
f whether they should
> happen through modeset or directly from the PHY comp request short pulse.
> My first feedback was also that this should happen through a complete mod=
eset where after we get
> PHY comp request we send a uevent like we do for link layer compliance an=
d then trigger a full modeset.
> But honestly that was just a lot of overhead and =

> The reason we decided to go with this ad hoc approach was that with PHY c=
ompliance request,
> nothing really changes in terms of link parameters so we do not need to g=
o through
> a complete modeset request unlike link layer compliance where we need to =
do compute config
> all over again to do the link params computation.
> =

> Every PHY comp request first sends a link layer comp request that does a =
full modeset
> and sets up the desired link rate/lane count.
> Then with PHY request, all we need to do is disable pipe conf, dp_tp_ctl,=
 set the PHY patterns
> and renable the pipe conf and dp_tp_ctl without interfering and doing any=
thing with a full modeset.
> =

> Now i think if we need to scale this to other platforms, can we add a per=
 platform hook
> for handle_phy_request that gets the correct DP_TP_CTL etc and sets up th=
e PHY patterns and
> reenables the already set link?
> =

> We have thoroughly tested this using the scopes and DPR 100 and it has be=
en working correctly
> with the existing IGT compliance tool so IMO no need to rewrite the entir=
e set of patches.
> =

> Ville, Khaled ?

You're just multiplying the amount of work and bugs we have
for every platform.

And as said testing some special compliance paths proves
pretty much nothing about the real code paths. So the only
point of that code AFAICS it to tick some "we haz
compliance code?" checkbox in some random spreadsheet instead
of actually providing evidence that our real code works
correctly.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
