Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A6A423636
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 05:09:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA62A6E4D0;
	Wed,  6 Oct 2021 03:09:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A4EC6E4CB
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Oct 2021 03:09:13 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1633489755; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=cGWm9p96uee9kl9a/RcxnVxSrJFcq4CEJVNgv/WnjvE=;
 b=r2Ne878jOfYfG9/m+DEn66jvO5eiGmuS5JlMCGIDpjOKl8I+KgNrT4unEhOMTBVJK0ftlYM0
 V+a1RbE+wCov7Z81yebmLsKoCNZ7npIBmFn0RR8L42x5nMZJXTaJxkcswzJHWsijzTJaKrAf
 bqggvwR/KUbyGPh+taM2xfA6Qek=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 615d135603355859c8014bb4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 06 Oct 2021 03:09:10
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 3F076C43617; Wed,  6 Oct 2021 03:09:10 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id D5172C4338F;
 Wed,  6 Oct 2021 03:09:07 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 05 Oct 2021 20:09:07 -0700
From: abhinavk@codeaurora.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, David
 Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Kalyan Thota <kalyan_t@codeaurora.org>,
 Kuogee Hsieh <khsieh@codeaurora.org>, Rob Herring <robh+dt@kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Freedreno] [PATCH v4 4/7] drm/msm/dp: Allow attaching a drm_panel
In-Reply-To: <YV0FRvYS8vQYKLI2@ripper>
References: <20211005231323.2663520-1-bjorn.andersson@linaro.org>
 <20211005231323.2663520-5-bjorn.andersson@linaro.org>
 <28fbd8f5b2d6bae7bedfc7e81e3fddd9@codeaurora.org> <YV0FRvYS8vQYKLI2@ripper>
Message-ID: <1238652fd3200a71a92a5f46e63dd50d@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
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

On 2021-10-05 19:09, Bjorn Andersson wrote:
> On Tue 05 Oct 17:35 PDT 2021, abhinavk@codeaurora.org wrote:
> 
>> Hi Bjorn
>> 
>> On 2021-10-05 16:13, Bjorn Andersson wrote:
>> > eDP panels might need some power sequencing and backlight management,
>> > so make it possible to associate a drm_panel with an eDP instance and
>> > prepare and enable the panel accordingly.
>> >
>> > Now that we know which hardware instance is DP and which is eDP,
>> > parser->parse() is passed the connector_type and the parser is limited
>> > to only search for a panel in the eDP case.
>> >
>> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>> > ---
>> >
>> > Changes since v3:
>> > - Previously posted separately, now added to series
>> > - Make the search for a panel conditional on it being an eDP connector
>> > - Move the search to of_graph port 1 (was 2 to distinguish from DP
>> > link to USB-C connector)
>> >
>> >  drivers/gpu/drm/msm/dp/dp_display.c |  9 ++++++---
>> >  drivers/gpu/drm/msm/dp/dp_display.h |  1 +
>> >  drivers/gpu/drm/msm/dp/dp_drm.c     | 11 +++++++++++
>> >  drivers/gpu/drm/msm/dp/dp_parser.c  | 30 ++++++++++++++++++++++++++++-
>> >  drivers/gpu/drm/msm/dp/dp_parser.h  |  3 ++-
>> >  5 files changed, 49 insertions(+), 5 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c
>> > b/drivers/gpu/drm/msm/dp/dp_display.c
>> > index eaf08f9e7d87..bdaf227f05dc 100644
>> > --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> > @@ -10,6 +10,7 @@
>> >  #include <linux/component.h>
>> >  #include <linux/of_irq.h>
>> >  #include <linux/delay.h>
>> > +#include <drm/drm_panel.h>
>> >
>> >  #include "msm_drv.h"
>> >  #include "msm_kms.h"
>> > @@ -230,12 +231,14 @@ static int dp_display_bind(struct device *dev,
>> > struct device *master,
>> >  	priv = drm->dev_private;
>> >  	priv->dp = &(dp->dp_display);
>> >
>> > -	rc = dp->parser->parse(dp->parser);
>> > +	rc = dp->parser->parse(dp->parser, dp->dp_display.connector_type);
>> >  	if (rc) {
>> >  		DRM_ERROR("device tree parsing failed\n");
>> >  		goto end;
>> >  	}
>> >
>> > +	dp->dp_display.panel_bridge = dp->parser->panel_bridge;
>> > +
>> >  	dp->aux->drm_dev = drm;
>> >  	rc = dp_aux_register(dp->aux);
>> >  	if (rc) {
>> > @@ -822,7 +825,7 @@ static int dp_display_set_mode(struct msm_dp
>> > *dp_display,
>> >  	return 0;
>> >  }
>> >
>> > -static int dp_display_prepare(struct msm_dp *dp)
>> > +static int dp_display_prepare(struct msm_dp *dp_display)
>> >  {
>> >  	return 0;
>> >  }
>> > @@ -896,7 +899,7 @@ static int dp_display_disable(struct
>> > dp_display_private *dp, u32 data)
>> >  	return 0;
>> >  }
>> >
>> > -static int dp_display_unprepare(struct msm_dp *dp)
>> > +static int dp_display_unprepare(struct msm_dp *dp_display)
>> >  {
>> >  	return 0;
>> >  }
>> > diff --git a/drivers/gpu/drm/msm/dp/dp_display.h
>> > b/drivers/gpu/drm/msm/dp/dp_display.h
>> > index 02999408c052..24aefca66029 100644
>> > --- a/drivers/gpu/drm/msm/dp/dp_display.h
>> > +++ b/drivers/gpu/drm/msm/dp/dp_display.h
>> > @@ -15,6 +15,7 @@ struct msm_dp {
>> >  	struct device *codec_dev;
>> >  	struct drm_connector *connector;
>> >  	struct drm_encoder *encoder;
>> > +	struct drm_bridge *panel_bridge;
>> >  	bool is_connected;
>> >  	bool audio_enabled;
>> >  	bool power_on;
>> > diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c
>> > b/drivers/gpu/drm/msm/dp/dp_drm.c
>> > index f33e31523f56..76856c4ee1d6 100644
>> > --- a/drivers/gpu/drm/msm/dp/dp_drm.c
>> > +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
>> > @@ -5,6 +5,7 @@
>> >
>> >  #include <drm/drm_atomic_helper.h>
>> >  #include <drm/drm_atomic.h>
>> > +#include <drm/drm_bridge.h>
>> >  #include <drm/drm_crtc.h>
>> >
>> >  #include "msm_drv.h"
>> > @@ -160,5 +161,15 @@ struct drm_connector
>> > *dp_drm_connector_init(struct msm_dp *dp_display)
>> >
>> >  	drm_connector_attach_encoder(connector, dp_display->encoder);
>> >
>> > +	if (dp_display->panel_bridge) {
>> > +		ret = drm_bridge_attach(dp_display->encoder,
>> > +					dp_display->panel_bridge, NULL,
>> > +					DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>> > +		if (ret < 0) {
>> > +			DRM_ERROR("failed to attach panel bridge: %d\n", ret);
>> > +			return ERR_PTR(ret);
>> > +		}
>> > +	}
>> > +
>> >  	return connector;
>> >  }
>> > diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c
>> > b/drivers/gpu/drm/msm/dp/dp_parser.c
>> > index 4d6e047f803d..eb6bbfbea484 100644
>> > --- a/drivers/gpu/drm/msm/dp/dp_parser.c
>> > +++ b/drivers/gpu/drm/msm/dp/dp_parser.c
>> > @@ -6,6 +6,7 @@
>> >  #include <linux/of_gpio.h>
>> >  #include <linux/phy/phy.h>
>> >
>> > +#include <drm/drm_of.h>
>> >  #include <drm/drm_print.h>
>> >
>> >  #include "dp_parser.h"
>> > @@ -263,7 +264,28 @@ static int dp_parser_clock(struct dp_parser
>> > *parser)
>> >  	return 0;
>> >  }
>> >
>> > -static int dp_parser_parse(struct dp_parser *parser)
>> > +static int dp_parser_find_panel(struct dp_parser *parser)
>> > +{
>> > +	struct device *dev = &parser->pdev->dev;
>> > +	struct drm_panel *panel;
>> > +	int rc;
>> > +
>> > +	rc = drm_of_find_panel_or_bridge(dev->of_node, 1, 0, &panel, NULL);
>> > +	if (rc) {
>> > +		DRM_ERROR("failed to acquire DRM panel: %d\n", rc);
>> > +		return rc;
>> > +	}
>> > +
>> > +	parser->panel_bridge = devm_drm_panel_bridge_add(dev, panel);
>> > +	if (IS_ERR(parser->panel_bridge)) {
>> > +		DRM_ERROR("failed to create panel bridge\n");
>> > +		return PTR_ERR(parser->panel_bridge);
>> > +	}
>> 
>> When we add a bridge using devm_drm_panel_bridge_add(), it will 
>> register
>> with default bridge functions which is fine
>> because we need the panel power to be controlled here.
>> 
>> 
>> 140 static const struct drm_bridge_funcs panel_bridge_bridge_funcs = {
>> 141 	.attach = panel_bridge_attach,
>> 142 	.detach = panel_bridge_detach,
>> 143 	.pre_enable = panel_bridge_pre_enable,
>> 144 	.enable = panel_bridge_enable,
>> 145 	.disable = panel_bridge_disable,
>> 146 	.post_disable = panel_bridge_post_disable,
>> 147 	.get_modes = panel_bridge_get_modes,
>> 
>> But what about the EDID related things, the DP/eDP driver already 
>> reads the
>> EDID and gets the modes so we need to skip
>> that in this case as otherwise it will end up calling the 
>> panel_get_modes in
>> the eDP panel which will be redundant.
>> 
>> Let me know if I am missing something in this proposal.
>> 
> 
> I'm slightly lost when it comes to these types, so can you please help
> me understand why the panel_bridge_bridge_funcs->get_modes() would be
> invoked with the proposed patches.
> 
> Because adding a log print in panel_bridge_get_modes() shows that it's
> not invoked.
> 
> 
> So I think we have the opposite problem, rather than having two
> redundant get_modes we only support relying on the EDID information
> directly in the DP driver, at this point.
> 
> So unless I'm missing something critical, this works and provides panel
> and backlight controls and the additional work to move the EDID read 
> out
> to the panel driver would better be done after this initial support
> lands?
> 
> Regards,
> Bjorn

I missed this line which uses the DRM_BRIDGE_ATTACH_NO_CONNECTOR

+		ret = drm_bridge_attach(dp_display->encoder,
+					dp_display->panel_bridge, NULL,
+					DRM_BRIDGE_ATTACH_NO_CONNECTOR);

In this case, no separate connector will get created and hence get_modes 
will not
be called again since this is just a virtual bridge. That explains why 
your log
didnt show up.

I will continue checking the rest of this patch.

> 
>> > +
>> > +	return 0;
>> > +}
>> > +
>> > +static int dp_parser_parse(struct dp_parser *parser, int
>> > connector_type)
>> >  {
>> >  	int rc = 0;
>> >
>> > @@ -284,6 +306,12 @@ static int dp_parser_parse(struct dp_parser
>> > *parser)
>> >  	if (rc)
>> >  		return rc;
>> >
>> > +	if (connector_type == DRM_MODE_CONNECTOR_eDP) {
>> > +		rc = dp_parser_find_panel(parser);
>> > +		if (rc)
>> > +			return rc;
>> > +	}
>> > +
>> >  	/* Map the corresponding regulator information according to
>> >  	 * version. Currently, since we only have one supported platform,
>> >  	 * mapping the regulator directly.
>> > diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h
>> > b/drivers/gpu/drm/msm/dp/dp_parser.h
>> > index dac10923abde..3172da089421 100644
>> > --- a/drivers/gpu/drm/msm/dp/dp_parser.h
>> > +++ b/drivers/gpu/drm/msm/dp/dp_parser.h
>> > @@ -123,8 +123,9 @@ struct dp_parser {
>> >  	struct dp_display_data disp_data;
>> >  	const struct dp_regulator_cfg *regulator_cfg;
>> >  	u32 max_dp_lanes;
>> > +	struct drm_bridge *panel_bridge;
>> >
>> > -	int (*parse)(struct dp_parser *parser);
>> > +	int (*parse)(struct dp_parser *parser, int connector_type);
>> >  };
>> >
>> >  /**
