Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF112CA05C
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 11:53:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2877E6E55E;
	Tue,  1 Dec 2020 10:53:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9D6B6E4EA
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 10:53:00 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B1Aqv8L035012;
 Tue, 1 Dec 2020 04:52:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1606819977;
 bh=lfly8oevt5k7WIecAa5D7f2sbx2HA+Q3lmNkq+YiFdU=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=Pb+/vQBzwHUTdrwEQ3WtJTOb0iu+Oht/AIpzkBMiw/tqlF8cZkuFL+4pXro/8YYx/
 neWaca3Yg4aIKl62zYNiMa/FHIecinF1JMwrUBhI1EBZcYdh8ycD2RHgJlfoFAf1Ec
 ird7hEb5REhUOFanU9am2HkCz8z1yiLQNOtSPnGc=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B1AqvEM115026
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 1 Dec 2020 04:52:57 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 1 Dec
 2020 04:52:57 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 1 Dec 2020 04:52:57 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B1AquTi127951;
 Tue, 1 Dec 2020 04:52:56 -0600
Date: Tue, 1 Dec 2020 16:22:55 +0530
From: Nikhil Devshatwar <nikhil.nd@ti.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3 4/6] drm/tidss: Set bus_format correctly from
 bridge/connector
Message-ID: <20201201105255.kl2dn6hjneo4gtld@NiksLab>
References: <20201119160134.9244-1-nikhil.nd@ti.com>
 <20201119160134.9244-5-nikhil.nd@ti.com>
 <20201130094527.GD4141@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201130094527.GD4141@pendragon.ideasonboard.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>, Sekhar Nori <nsekhar@ti.com>,
 Yuti Amonkar <yamonkar@cadence.com>, dri-devel@lists.freedesktop.org,
 Swapnil Jakhade <sjakhade@cadence.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11:45-20201130, Laurent Pinchart wrote:
> Hi Nikhil,
> 
> Thank you for the patch.
> 
> On Thu, Nov 19, 2020 at 09:31:32PM +0530, Nikhil Devshatwar wrote:
> > Remove the old code to iterate over the bridge chain, as this is
> > already done by the framework.
> > The bridge state should have the negotiated bus format and flags.
> > Use these from the bridge's state.
> > If the bridge does not support format negotiation, error out
> > and fail.
> > 
> > Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> > Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> > ---
> > 
> > Notes:
> >     changes from v2:
> >     * Remove the old code and use the flags from the bridge state
> > 
> >  drivers/gpu/drm/tidss/tidss_encoder.c | 36 +++++++++++----------------
> >  1 file changed, 14 insertions(+), 22 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/tidss/tidss_encoder.c b/drivers/gpu/drm/tidss/tidss_encoder.c
> > index e278a9c89476..08d5083c5508 100644
> > --- a/drivers/gpu/drm/tidss/tidss_encoder.c
> > +++ b/drivers/gpu/drm/tidss/tidss_encoder.c
> > @@ -21,37 +21,29 @@ static int tidss_encoder_atomic_check(struct drm_encoder *encoder,
> >  {
> >  	struct drm_device *ddev = encoder->dev;
> >  	struct tidss_crtc_state *tcrtc_state = to_tidss_crtc_state(crtc_state);
> > -	struct drm_display_info *di = &conn_state->connector->display_info;
> > +	struct drm_bridge_state *bstate;
> >  	struct drm_bridge *bridge;
> > -	bool bus_flags_set = false;
> >  
> >  	dev_dbg(ddev->dev, "%s\n", __func__);
> >  
> > -	/*
> > -	 * Take the bus_flags from the first bridge that defines
> > -	 * bridge timings, or from the connector's display_info if no
> > -	 * bridge defines the timings.
> > -	 */
> > -	drm_for_each_bridge_in_chain(encoder, bridge) {
> > -		if (!bridge->timings)
> > -			continue;
> > -
> > -		tcrtc_state->bus_flags = bridge->timings->input_bus_flags;
> > -		bus_flags_set = true;
> > -		break;
> > +	/* Copy the bus_format and flags from the first bridge's state */
> > +	bridge = drm_bridge_chain_get_first_bridge(encoder);
> > +	bstate = drm_atomic_get_new_bridge_state(crtc_state->state, bridge);
> > +	if (bstate) {
> > +		tcrtc_state->bus_format = bstate->input_bus_cfg.format;
> > +		tcrtc_state->bus_flags = bstate->input_bus_cfg.flags;
> > +	} else {
> > +		dev_err(ddev->dev, "Could not get the bridge state\n");
> > +		return -EINVAL;
> >  	}
> 
> I'd write this
> 
> 	bstate = drm_atomic_get_new_bridge_state(crtc_state->state, bridge);
> 	if (!bstate) {
> 		dev_err(ddev->dev, "Could not get the bridge state\n");
> 		return -EINVAL;
> 	}
> 
> 	tcrtc_state->bus_format = bstate->input_bus_cfg.format;
> 	tcrtc_state->bus_flags = bstate->input_bus_cfg.flags;

Looks better this way. I'll update

Nikhil Devshatwar

> >  
> > -	if (!di->bus_formats || di->num_bus_formats == 0)  {
> > -		dev_err(ddev->dev, "%s: No bus_formats in connected display\n",
> > -			__func__);
> > +	if (tcrtc_state->bus_format == 0 ||
> > +	    tcrtc_state->bus_format == MEDIA_BUS_FMT_FIXED) {
> > +
> > +		dev_err(ddev->dev, "Bridge connected to the encoder did not specify media bus format\n");
> >  		return -EINVAL;
> >  	}
> >  
> > -	// XXX any cleaner way to set bus format and flags?
> > -	tcrtc_state->bus_format = di->bus_formats[0];
> > -	if (!bus_flags_set)
> > -		tcrtc_state->bus_flags = di->bus_flags;
> > -
> >  	return 0;
> >  }
> >  
> 
> -- 
> Regards,
> 
> Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
