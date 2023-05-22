Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7809170CB8D
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 22:51:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 113E410E2A6;
	Mon, 22 May 2023 20:51:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7603810E2A6;
 Mon, 22 May 2023 20:51:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7283360B9D;
 Mon, 22 May 2023 20:51:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 708C8C433D2;
 Mon, 22 May 2023 20:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684788664;
 bh=uAOI6NRM2lDoQD6rkgsSSjr3bhCTcMyU/c9/JQDCgds=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=i5/urfNqdTldR61lOTP1lzgusHa6pALe5AAP1XxtvPwjiMKCE/4dtdok5X2HTAS+F
 enyd/5LdqVBHgos8VOhPQDZro0Z9qqYN03DNDhL52B1gAZ9i8qn48fKixd3FT1ucwf
 JiYgPTtCQEta1KohTyKW9J9+9w3WguA1i0U5/lIJyfhZAjlKlcVmVflQ/StQIANkmI
 XC4i0+9VXSE4AGm7cuH7Tfzg1ISvwhYkIjUZW6IsqSCrqQp5f5+5m+wfEqXNTH9e5a
 omxwPl/zJ2jMaAqbs+V+rMGT3JWzdYpU5ASg/7PVqQZPUqZd+0BMKRMXPg3lIvmyIF
 muY54sVKGR1fA==
Date: Mon, 22 May 2023 15:51:01 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [RFC] drm/msm/dp: Allow attaching a drm_panel
Message-ID: <do5veo5axxbvmcddpqf7u5rfer6soxzy5selfnjv5sn6n57h47@q3hfznslndba>
References: <YVumL1lHLqtb/HKS@ripper>
 <CAD=FV=W9uKq00wXn4H1ax0u2D=R8Wn3J-Je43uxcPyDtk7AK7Q@mail.gmail.com>
 <YVyMwsvLl6XalJxB@ripper>
 <CAD=FV=WY+g38p7--QKZCaQnSqx7VvdwC36jH-VKnrEWoxK=XHQ@mail.gmail.com>
 <YV0KBWxVtKgOp2Cj@ripper>
 <CAD=FV=X5JFE3u9BtxxocaUrYNSpYXJN90UJ8HOvXZE6oYiVsDQ@mail.gmail.com>
 <CACeCKac4b_ej87cQD692TNwpsoFsmBwDcSeLy5fp+pvLX1si7g@mail.gmail.com>
 <YV7JNH9QvI4cBz5s@kuha.fi.intel.com> <YV8dEKMhNKKl20j6@ripper>
 <YWA7vXp+4QbKWU1S@kuha.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YWA7vXp+4QbKWU1S@kuha.fi.intel.com>
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

On Fri, Oct 08, 2021 at 03:38:21PM +0300, Heikki Krogerus wrote:
> Hi,
> 
> On Thu, Oct 07, 2021 at 09:15:12AM -0700, Bjorn Andersson wrote:
> > The one thing that I still don't understand though is, if the typec_mux
> > is used by the typec controller to inform _the_ mux about the function
> > to be used, what's up with the complexity in typec_mux_match()? This is
> > what lead me to believe that typec_mux was enabling/disabling individual
> > altmodes, rather just flipping the physical switch at the bottom.
> 
> Ah, typec_mux_match() is a mess. I'm sorry about that. I think most of
> the code in that function is not used by anybody. If I remember
> correctly, all that complexity is attempting to solve some
> hypothetical corner case(s). Probable a case where we have multiple
> muxes per port to deal with.
> 
> I think it would probable be best to clean the function to the bare
> minimum by keeping only the parts that are actually used today
> (attached).
> 

Sorry for not replying to this in a timely manner Heikki. I've been
ignoring this issue for a long time now, just adding "svid" to our dts
files. But, this obviously shows up in DT validation - and I'd prefer
not defining these properties as valid.

The attached patch works as expected.

Could you please spin this as a proper patch, so we can get it merged?

Regards,
Bjorn

> thanks,
> 
> -- 
> heikki

> diff --git a/drivers/usb/typec/mux.c b/drivers/usb/typec/mux.c
> index c8340de0ed495..44f168c9bd9bf 100644
> --- a/drivers/usb/typec/mux.c
> +++ b/drivers/usb/typec/mux.c
> @@ -193,56 +193,15 @@ static int mux_fwnode_match(struct device *dev, const void *fwnode)
>  static void *typec_mux_match(struct fwnode_handle *fwnode, const char *id,
>  			     void *data)
>  {
> -	const struct typec_altmode_desc *desc = data;
>  	struct device *dev;
> -	bool match;
> -	int nval;
> -	u16 *val;
> -	int ret;
> -	int i;
>  
>  	/*
> -	 * Check has the identifier already been "consumed". If it
> -	 * has, no need to do any extra connection identification.
> +	 * The connection identifier will be needed with device graph (OF graph).
> +	 * Device graph is not supported by this code yet, so bailing out.
>  	 */
> -	match = !id;
> -	if (match)
> -		goto find_mux;
> -
> -	/* Accessory Mode muxes */
> -	if (!desc) {
> -		match = fwnode_property_present(fwnode, "accessory");
> -		if (match)
> -			goto find_mux;
> -		return NULL;
> -	}
> -
> -	/* Alternate Mode muxes */
> -	nval = fwnode_property_count_u16(fwnode, "svid");
> -	if (nval <= 0)
> -		return NULL;
> -
> -	val = kcalloc(nval, sizeof(*val), GFP_KERNEL);
> -	if (!val)
> -		return ERR_PTR(-ENOMEM);
> -
> -	ret = fwnode_property_read_u16_array(fwnode, "svid", val, nval);
> -	if (ret < 0) {
> -		kfree(val);
> -		return ERR_PTR(ret);
> -	}
> -
> -	for (i = 0; i < nval; i++) {
> -		match = val[i] == desc->svid;
> -		if (match) {
> -			kfree(val);
> -			goto find_mux;
> -		}
> -	}
> -	kfree(val);
> -	return NULL;
> +	if (id)
> +		return ERR_PTR(-ENOTSUPP);
>  
> -find_mux:
>  	dev = class_find_device(&typec_mux_class, NULL, fwnode,
>  				mux_fwnode_match);
>  

