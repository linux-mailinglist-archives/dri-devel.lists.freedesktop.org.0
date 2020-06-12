Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F791F7D4F
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jun 2020 21:01:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52BAA6E17D;
	Fri, 12 Jun 2020 19:01:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01FDD6E172;
 Fri, 12 Jun 2020 19:01:23 +0000 (UTC)
IronPort-SDR: quevn4sBY5H8TCzJwMsB7Nv/b2ZOfdL858uuxVdm4dOxkT6lyIbdaW2PtuHF7y3I0nHxZea1ah
 HJOkVeiWz7oA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2020 12:01:23 -0700
IronPort-SDR: RUthxAecRtJDN3IUOma7E1sUNf8nDQSgsU8tSvQZROXhFlW48CpcR+qmtIbWivwUE9e9Lr2Hhn
 VfxFck+MUyrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,504,1583222400"; d="scan'208";a="380812671"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga001.fm.intel.com with SMTP; 12 Jun 2020 12:01:19 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 12 Jun 2020 22:01:19 +0300
Date: Fri, 12 Jun 2020 22:01:19 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Manasi Navare <manasi.d.navare@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/dp: DP PHY compliance for JSL
Message-ID: <20200612190119.GN6112@intel.com>
References: <1591247028-5868-1-git-send-email-vidya.srinivas@intel.com>
 <20200604190612.GI6112@intel.com>
 <fea323968324ceefe813d34d80fdd9779614aa01.camel@intel.com>
 <20200604210319.GJ6112@intel.com> <20200612182542.GA7458@intel.com>
 <20200612183637.GL6112@intel.com> <20200612184413.GC7458@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200612184413.GC7458@intel.com>
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

On Fri, Jun 12, 2020 at 11:44:13AM -0700, Manasi Navare wrote:
> On Fri, Jun 12, 2020 at 09:36:37PM +0300, Ville Syrj=E4l=E4 wrote:
> > On Fri, Jun 12, 2020 at 11:25:42AM -0700, Manasi Navare wrote:
> > > On Fri, Jun 05, 2020 at 12:03:19AM +0300, Ville Syrj=E4l=E4 wrote:
> > > > On Thu, Jun 04, 2020 at 08:01:03PM +0000, Almahallawy, Khaled wrote:
> > > > > On Thu, 2020-06-04 at 22:06 +0300, Ville Syrj=E4l=E4 wrote:
> > > > > > On Thu, Jun 04, 2020 at 10:33:48AM +0530, Vidya Srinivas wrote:
> > > > > > > Signed-off-by: Khaled Almahallawy <khaled.almahallawy@intel.c=
om>
> > > > > > > Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
> > > > > > > ---
> > > > > > >  drivers/gpu/drm/i915/display/intel_dp.c | 40
> > > > > > > ++++++++++++++++++++++++++-------
> > > > > > >  1 file changed, 32 insertions(+), 8 deletions(-)
> > > > > > > =

> > > > > > > diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> > > > > > > b/drivers/gpu/drm/i915/display/intel_dp.c
> > > > > > > index 7223367171d1..44663e8ac9a1 100644
> > > > > > > --- a/drivers/gpu/drm/i915/display/intel_dp.c
> > > > > > > +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> > > > > > > @@ -5470,22 +5470,32 @@ intel_dp_autotest_phy_ddi_disable(str=
uct
> > > > > > > intel_dp *intel_dp)
> > > > > > >  	struct drm_i915_private *dev_priv =3D to_i915(dev);
> > > > > > >  	struct intel_crtc *crtc =3D to_intel_crtc(intel_dig_port-
> > > > > > > >base.base.crtc);
> > > > > > >  	enum pipe pipe =3D crtc->pipe;
> > > > > > > -	u32 trans_ddi_func_ctl_value, trans_conf_value,
> > > > > > > dp_tp_ctl_value;
> > > > > > > +	u32 trans_ddi_func_ctl_value, trans_conf_value,
> > > > > > > dp_tp_ctl_value, trans_ddi_port_mask;
> > > > > > > +	enum port port =3D intel_dig_port->base.port;
> > > > > > > +	i915_reg_t dp_tp_reg;
> > > > > > > +
> > > > > > > +	if (IS_ELKHARTLAKE(dev_priv)) {
> > > > > > > +		dp_tp_reg =3D DP_TP_CTL(port);
> > > > > > > +		trans_ddi_port_mask =3D TRANS_DDI_PORT_MASK;
> > > > > > > +	} else if (IS_TIGERLAKE(dev_priv)) {
> > > > > > > +		dp_tp_reg =3D TGL_DP_TP_CTL(pipe);
> > > > > > > +		trans_ddi_port_mask =3D TGL_TRANS_DDI_PORT_MASK;
> > > > > > > +	}
> > > > > > >  =

> > > > > > >  	trans_ddi_func_ctl_value =3D intel_de_read(dev_priv,
> > > > > > >  						 TRANS_DDI_FUNC_CTL(pip
> > > > > > > e));
> > > > > > >  	trans_conf_value =3D intel_de_read(dev_priv, PIPECONF(pipe)=
);
> > > > > > > -	dp_tp_ctl_value =3D intel_de_read(dev_priv, TGL_DP_TP_CTL(p=
ipe));
> > > > > > >  =

> > > > > > > +	dp_tp_ctl_value =3D intel_de_read(dev_priv, dp_tp_reg);
> > > > > > >  	trans_ddi_func_ctl_value &=3D ~(TRANS_DDI_FUNC_ENABLE |
> > > > > > > -				      TGL_TRANS_DDI_PORT_MASK);
> > > > > > > +					trans_ddi_port_mask);
> > > > > > >  	trans_conf_value &=3D ~PIPECONF_ENABLE;
> > > > > > >  	dp_tp_ctl_value &=3D ~DP_TP_CTL_ENABLE;
> > > > > > >  =

> > > > > > >  	intel_de_write(dev_priv, PIPECONF(pipe), trans_conf_value);
> > > > > > >  	intel_de_write(dev_priv, TRANS_DDI_FUNC_CTL(pipe),
> > > > > > >  		       trans_ddi_func_ctl_value);
> > > > > > > -	intel_de_write(dev_priv, TGL_DP_TP_CTL(pipe), dp_tp_ctl_val=
ue);
> > > > > > > +	intel_de_write(dev_priv, dp_tp_reg, dp_tp_ctl_value);
> > > > > > =

> > > > > > All this ad-hoc modeset code really should not exist. It's goin=
g to
> > > > > > have different bugs than the norma modeset paths, so compliance
> > > > > > testing
> > > > > > this special code proves absolutely nothing about the normal mo=
deset
> > > > > > code. IMO someone needs to take up the task of rewrtiting all t=
his to
> > > > > > just perform normal modesets.
> > > > > =

> > > > > Agree. I've just found that we get kernel NULL pointer dereferenc=
e and
> > > > > panic when we try to access to_intel_crtc(intel_dig_port-
> > > > > >base.base.crtc).
> > > > =

> > > > Yeah, that's a legacy pointer which should no longer be used at all
> > > > with atomic drivers. I'm slowly trying to clear out all this legacy
> > > > cruft. The next step I had hoped to take was
> > > > https://patchwork.freedesktop.org/series/76993/ but then this
> > > > compliacnce stuff landed and threw another wrench into the works.
> > > =

> > > We had several discussions on design of DP PHY compliance and the pat=
ches were on the M-L
> > > for quite some time without anyone giving feedback on the actual desi=
gn of whether they should
> > > happen through modeset or directly from the PHY comp request short pu=
lse.
> > > My first feedback was also that this should happen through a complete=
 modeset where after we get
> > > PHY comp request we send a uevent like we do for link layer complianc=
e and then trigger a full modeset.
> > > But honestly that was just a lot of overhead and =

> > > The reason we decided to go with this ad hoc approach was that with P=
HY compliance request,
> > > nothing really changes in terms of link parameters so we do not need =
to go through
> > > a complete modeset request unlike link layer compliance where we need=
 to do compute config
> > > all over again to do the link params computation.
> > > =

> > > Every PHY comp request first sends a link layer comp request that doe=
s a full modeset
> > > and sets up the desired link rate/lane count.
> > > Then with PHY request, all we need to do is disable pipe conf, dp_tp_=
ctl, set the PHY patterns
> > > and renable the pipe conf and dp_tp_ctl without interfering and doing=
 anything with a full modeset.
> > > =

> > > Now i think if we need to scale this to other platforms, can we add a=
 per platform hook
> > > for handle_phy_request that gets the correct DP_TP_CTL etc and sets u=
p the PHY patterns and
> > > reenables the already set link?
> > > =

> > > We have thoroughly tested this using the scopes and DPR 100 and it ha=
s been working correctly
> > > with the existing IGT compliance tool so IMO no need to rewrite the e=
ntire set of patches.
> > > =

> > > Ville, Khaled ?
> > =

> > You're just multiplying the amount of work and bugs we have
> > for every platform.
> > =

> > And as said testing some special compliance paths proves
> > pretty much nothing about the real code paths. So the only
> > point of that code AFAICS it to tick some "we haz
> > compliance code?" checkbox in some random spreadsheet instead
> > of actually providing evidence that our real code works
> > correctly.
> >
> =

> I thougt the whole point of PHY compliance is not to be able to see if the
> driver can do a modeset but just to confirm that driver is able to send
> the requested patterns out on already enabled link. So shouldnt doing this
> directly through the phy request handling on short pulse suffice?

You're not proving the driver proper can transmit the requested stuff,
you're only proving the special compliance code can do that. I could
easily break the normal codepaths and yet this magic compliance thing
could still indicate that everything is hunky dory.

> =

> But if we want to insert this in the modeset what should be the flow:
> - AFter getting PHY request, store the requested PHY patterns, send a uev=
ent

You don't really need any uevent. We coukd do the stuff directly from =

the hotplug work.

> - This will trigger a complete modeset, in this path for atomic check, see
> if PHY compliance test active then ignore recomputing the parameters and
> also in the commit tail, only disable the Pipeconf, dp_tp_ctl and send th=
ese patterns
> and then reenable?

We should just do a full modeset if possible. Randomly turning the
pipe/etc. on/off without following the proper modeset sequence is
dubious at best.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
