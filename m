Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F83070F36D
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 11:50:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80ED810E648;
	Wed, 24 May 2023 09:50:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C2C810E647;
 Wed, 24 May 2023 09:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684921817; x=1716457817;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=AHaPKxRJsJfEmgKrbdk7X9VP2w6I/wDac/mkRqDZPHc=;
 b=Yv+2yJHH9GKou/KFL6oebJzAaLFcraF0yLmvaWwUI6+zT32U0E+VewLs
 Bt+ANYMW4lnNk68XOL/DFqoc+ELbVPb/wEqZXS56V6YjfC5cz2PjhjAUV
 V64H7AYKw4ob59O+owHJFlfT8T6zqYYLIuio6ukcinmyc8EogDclnO3qa
 i5JaKs4jjxmwCVi2tkqA8jyZcJyt1igR3Q6Ymen50D5Ms75VHZyvmiRJ/
 sh4iLbsu3uCCc3wNnz+ypuoa8t+/y1V8Al0o2YEUE52ihmtuKnXwEnvNv
 WT7IAj/lk9g0jsun7bj466MRB7//TRUX7TAVs6gMcJy2Lf8x0AykCpruR Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="333140062"
X-IronPort-AV: E=Sophos;i="6.00,188,1681196400"; d="scan'208";a="333140062"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 02:50:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="848676445"
X-IronPort-AV: E=Sophos;i="6.00,188,1681196400"; d="scan'208";a="848676445"
Received: from kuha.fi.intel.com ([10.237.72.185])
 by fmsmga001.fm.intel.com with SMTP; 24 May 2023 02:50:11 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation);
 Wed, 24 May 2023 12:50:10 +0300
Date: Wed, 24 May 2023 12:50:10 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Bjorn Andersson <andersson@kernel.org>
Subject: Re: [RFC] drm/msm/dp: Allow attaching a drm_panel
Message-ID: <ZG3d0pW1qN55lWTZ@kuha.fi.intel.com>
References: <YVyMwsvLl6XalJxB@ripper>
 <CAD=FV=WY+g38p7--QKZCaQnSqx7VvdwC36jH-VKnrEWoxK=XHQ@mail.gmail.com>
 <YV0KBWxVtKgOp2Cj@ripper>
 <CAD=FV=X5JFE3u9BtxxocaUrYNSpYXJN90UJ8HOvXZE6oYiVsDQ@mail.gmail.com>
 <CACeCKac4b_ej87cQD692TNwpsoFsmBwDcSeLy5fp+pvLX1si7g@mail.gmail.com>
 <YV7JNH9QvI4cBz5s@kuha.fi.intel.com> <YV8dEKMhNKKl20j6@ripper>
 <YWA7vXp+4QbKWU1S@kuha.fi.intel.com>
 <do5veo5axxbvmcddpqf7u5rfer6soxzy5selfnjv5sn6n57h47@q3hfznslndba>
 <20230522215348.uoyboow26n2o3tel@ripper>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230522215348.uoyboow26n2o3tel@ripper>
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Doug Anderson <dianders@chromium.org>, Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Kuogee Hsieh <khsieh@codeaurora.org>, Prashant Malani <pmalani@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Vara Reddy <varar@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>,
 Sean Paul <sean@poorly.run>, LKML <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 22, 2023 at 02:53:48PM -0700, Bjorn Andersson wrote:
> On Mon, May 22, 2023 at 03:51:01PM -0500, Bjorn Andersson wrote:
> > On Fri, Oct 08, 2021 at 03:38:21PM +0300, Heikki Krogerus wrote:
> > > Hi,
> > > 
> > > On Thu, Oct 07, 2021 at 09:15:12AM -0700, Bjorn Andersson wrote:
> > > > The one thing that I still don't understand though is, if the typec_mux
> > > > is used by the typec controller to inform _the_ mux about the function
> > > > to be used, what's up with the complexity in typec_mux_match()? This is
> > > > what lead me to believe that typec_mux was enabling/disabling individual
> > > > altmodes, rather just flipping the physical switch at the bottom.
> > > 
> > > Ah, typec_mux_match() is a mess. I'm sorry about that. I think most of
> > > the code in that function is not used by anybody. If I remember
> > > correctly, all that complexity is attempting to solve some
> > > hypothetical corner case(s). Probable a case where we have multiple
> > > muxes per port to deal with.
> > > 
> > > I think it would probable be best to clean the function to the bare
> > > minimum by keeping only the parts that are actually used today
> > > (attached).
> > > 
> > 
> > Sorry for not replying to this in a timely manner Heikki. I've been
> > ignoring this issue for a long time now, just adding "svid" to our dts
> > files. But, this obviously shows up in DT validation - and I'd prefer
> > not defining these properties as valid.
> > 
> > The attached patch works as expected.
> > 
> 
> Sorry, I must have failed at applying the patch - it doesn't work...
> 
> > Could you please spin this as a proper patch, so we can get it merged?
> > 
> > Regards,
> > Bjorn
> > 
> > > thanks,
> > > 
> > > -- 
> > > heikki
> > 
> > > diff --git a/drivers/usb/typec/mux.c b/drivers/usb/typec/mux.c
> > > index c8340de0ed495..44f168c9bd9bf 100644
> > > --- a/drivers/usb/typec/mux.c
> > > +++ b/drivers/usb/typec/mux.c
> > > @@ -193,56 +193,15 @@ static int mux_fwnode_match(struct device *dev, const void *fwnode)
> > >  static void *typec_mux_match(struct fwnode_handle *fwnode, const char *id,
> > >  			     void *data)
> > >  {
> > > -	const struct typec_altmode_desc *desc = data;
> > >  	struct device *dev;
> > > -	bool match;
> > > -	int nval;
> > > -	u16 *val;
> > > -	int ret;
> > > -	int i;
> > >  
> > >  	/*
> > > -	 * Check has the identifier already been "consumed". If it
> > > -	 * has, no need to do any extra connection identification.
> > > +	 * The connection identifier will be needed with device graph (OF graph).
> > > +	 * Device graph is not supported by this code yet, so bailing out.
> > >  	 */
> > > -	match = !id;
> > > -	if (match)
> > > -		goto find_mux;
> > > -
> > > -	/* Accessory Mode muxes */
> > > -	if (!desc) {
> > > -		match = fwnode_property_present(fwnode, "accessory");
> > > -		if (match)
> > > -			goto find_mux;
> > > -		return NULL;
> > > -	}
> > > -
> > > -	/* Alternate Mode muxes */
> > > -	nval = fwnode_property_count_u16(fwnode, "svid");
> > > -	if (nval <= 0)
> > > -		return NULL;
> > > -
> > > -	val = kcalloc(nval, sizeof(*val), GFP_KERNEL);
> > > -	if (!val)
> > > -		return ERR_PTR(-ENOMEM);
> > > -
> > > -	ret = fwnode_property_read_u16_array(fwnode, "svid", val, nval);
> > > -	if (ret < 0) {
> > > -		kfree(val);
> > > -		return ERR_PTR(ret);
> > > -	}
> > > -
> > > -	for (i = 0; i < nval; i++) {
> > > -		match = val[i] == desc->svid;
> > > -		if (match) {
> > > -			kfree(val);
> > > -			goto find_mux;
> > > -		}
> > > -	}
> > > -	kfree(val);
> > > -	return NULL;
> > > +	if (id)
> 
> We pass id as "mode-switch", so this will never be NULL. But we also only
> want to consider endpoints with "mode-switch", otherwise we'll fail if
> any of the referred endpoints is not implementing a typec_mux...
> 
> So this needs the same snippet we find in typec_switch_match():
> 
> 	/*
> 	 * Device graph (OF graph) does not give any means to identify the
> 	 * device type or the device class of the remote port parent that @fwnode
> 	 * represents, so in order to identify the type or the class of @fwnode
> 	 * an additional device property is needed. With typec switches the
> 	 * property is named "orientation-switch" (@id). The value of the device
> 	 * property is ignored.
> 	 */
> 	if (id && !fwnode_property_present(fwnode, id))
> 	        return NULL;
> 
> With that, this works as expected!

Okay. I'll change that and send the patch out.

thanks,

-- 
heikki
