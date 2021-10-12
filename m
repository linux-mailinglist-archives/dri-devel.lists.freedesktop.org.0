Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C9942B083
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 01:45:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45DA76E041;
	Tue, 12 Oct 2021 23:44:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E92006E041
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Oct 2021 23:44:52 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1634082294; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=mHPP5W7TjLLB2IK782/iCA79yKz/hSXYmIb0/Vv+xbI=;
 b=YiWTJEHWK2ArUYlS2I877gHKpAWkPNetkUTfd2RokUox0DdLTlM22t4YkODveoSgmP/mKGPZ
 VsTPFGprsYN2ffTFWLhRLqMOxB/eq8h/bLn1sc3Qf1bumIvEO9xAeo5q1LEPc6vpbaURYEyi
 GGFBJcRONVEXW+s3vMMV7Sj5BXE=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 61661de6f3e5b80f1f70d401 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 12 Oct 2021 23:44:38
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 969BEC43616; Tue, 12 Oct 2021 23:44:38 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id B45DCC4338F;
 Tue, 12 Oct 2021 23:44:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 12 Oct 2021 16:44:36 -0700
From: abhinavk@codeaurora.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Stephen Boyd <swboyd@chromium.org>,
 Kuogee Hsieh <khsieh@codeaurora.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: Use the connector passed to
 dp_debug_get()
In-Reply-To: <YWYcXxZzjU8gLNf5@ripper>
References: <20211010030435.4000642-1-bjorn.andersson@linaro.org>
 <50925d684962690e42b2eb8ab8479835@codeaurora.org> <YWYcXxZzjU8gLNf5@ripper>
Message-ID: <f93a4c96fc84ea1e306abf2d2210d75e@codeaurora.org>
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

On 2021-10-12 16:38, Bjorn Andersson wrote:
> On Tue 12 Oct 16:03 PDT 2021, abhinavk@codeaurora.org wrote:
> 
>> On 2021-10-09 20:04, Bjorn Andersson wrote:
>> > The debugfs code is provided an array of a single drm_connector. Then to
>> > access the connector, the list of all connectors of the DRM device is
>> > traversed and all non-DisplayPort connectors are skipped, to find the
>> > one and only DisplayPort connector.
>> >
>> > But as we move to support multiple DisplayPort controllers this will now
>> > find multiple connectors and has no way to distinguish them.
>> >
>> > Pass the single connector to dp_debug_get() and use this in the debugfs
>> > functions instead, both to simplify the code and the support the
>> > multiple instances.
>> >
>> Change itself is fine, hence
>> Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
>> 
> 
> Thanks.
> 
>> What has to be checked now is now to create multiple DP nodes for 
>> multi-DP
>> cases.
>> Today, the debug node will be created only once :
>> 
>> https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c#L206
>> 
>> This also needs to be expanded for multi-DP to make the solution 
>> complete.
>> 
> 
> In my multi-DP support patch I end up invoking msm_dp_debugfs_init() 
> for
> each of the DP/eDP instances and in its current form the first one gets
> registered and any others will fail because of the resulting name
> collision.
> 
> This patch came as a byproduct of the effort of addressing that 
> problem.
> 
> Regards,
> Bjorn

Ah, okay. Yes i see the part you are referring to in 
https://patchwork.freedesktop.org/patch/457667/:

@@ -203,8 +204,10 @@  static int dpu_kms_debugfs_init(struct msm_kms 
*kms, struct drm_minor *minor)
  	dpu_debugfs_vbif_init(dpu_kms, entry);
  	dpu_debugfs_core_irq_init(dpu_kms, entry);

-	if (priv->dp)
-		msm_dp_debugfs_init(priv->dp, minor);
+	for (i = 0; i < ARRAY_SIZE(priv->dp); i++) {
+		if (priv->dp[i])
+			msm_dp_debugfs_init(priv->dp[i], minor);
+	}

That clarifies it. Thanks.

> 
>> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>> > ---
>> >  drivers/gpu/drm/msm/dp/dp_debug.c   | 131 ++++++++++------------------
>> >  drivers/gpu/drm/msm/dp/dp_debug.h   |   2 +-
>> >  drivers/gpu/drm/msm/dp/dp_display.c |   2 +-
>> >  3 files changed, 46 insertions(+), 89 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/msm/dp/dp_debug.c
>> > b/drivers/gpu/drm/msm/dp/dp_debug.c
>> > index af709d93bb9f..da4323556ef3 100644
>> > --- a/drivers/gpu/drm/msm/dp/dp_debug.c
>> > +++ b/drivers/gpu/drm/msm/dp/dp_debug.c
>> > @@ -24,7 +24,7 @@ struct dp_debug_private {
>> >  	struct dp_usbpd *usbpd;
>> >  	struct dp_link *link;
>> >  	struct dp_panel *panel;
>> > -	struct drm_connector **connector;
>> > +	struct drm_connector *connector;
>> >  	struct device *dev;
>> >  	struct drm_device *drm_dev;
>> >
>> > @@ -97,59 +97,35 @@ DEFINE_SHOW_ATTRIBUTE(dp_debug);
>> >
>> >  static int dp_test_data_show(struct seq_file *m, void *data)
>> >  {
>> > -	struct drm_device *dev;
>> > -	struct dp_debug_private *debug;
>> > -	struct drm_connector *connector;
>> > -	struct drm_connector_list_iter conn_iter;
>> > +	const struct dp_debug_private *debug = m->private;
>> > +	const struct drm_connector *connector = debug->connector;
>> >  	u32 bpc;
>> >
>> > -	debug = m->private;
>> > -	dev = debug->drm_dev;
>> > -	drm_connector_list_iter_begin(dev, &conn_iter);
>> > -	drm_for_each_connector_iter(connector, &conn_iter) {
>> > -
>> > -		if (connector->connector_type !=
>> > -			DRM_MODE_CONNECTOR_DisplayPort)
>> > -			continue;
>> > -
>> > -		if (connector->status == connector_status_connected) {
>> > -			bpc = debug->link->test_video.test_bit_depth;
>> > -			seq_printf(m, "hdisplay: %d\n",
>> > -					debug->link->test_video.test_h_width);
>> > -			seq_printf(m, "vdisplay: %d\n",
>> > -					debug->link->test_video.test_v_height);
>> > -			seq_printf(m, "bpc: %u\n",
>> > -					dp_link_bit_depth_to_bpc(bpc));
>> > -		} else
>> > -			seq_puts(m, "0");
>> > +	if (connector->status == connector_status_connected) {
>> > +		bpc = debug->link->test_video.test_bit_depth;
>> > +		seq_printf(m, "hdisplay: %d\n",
>> > +				debug->link->test_video.test_h_width);
>> > +		seq_printf(m, "vdisplay: %d\n",
>> > +				debug->link->test_video.test_v_height);
>> > +		seq_printf(m, "bpc: %u\n",
>> > +				dp_link_bit_depth_to_bpc(bpc));
>> > +	} else {
>> > +		seq_puts(m, "0");
>> >  	}
>> >
>> > -	drm_connector_list_iter_end(&conn_iter);
>> > -
>> >  	return 0;
>> >  }
>> >  DEFINE_SHOW_ATTRIBUTE(dp_test_data);
>> >
>> >  static int dp_test_type_show(struct seq_file *m, void *data)
>> >  {
>> > -	struct dp_debug_private *debug = m->private;
>> > -	struct drm_device *dev = debug->drm_dev;
>> > -	struct drm_connector *connector;
>> > -	struct drm_connector_list_iter conn_iter;
>> > -
>> > -	drm_connector_list_iter_begin(dev, &conn_iter);
>> > -	drm_for_each_connector_iter(connector, &conn_iter) {
>> > -
>> > -		if (connector->connector_type !=
>> > -			DRM_MODE_CONNECTOR_DisplayPort)
>> > -			continue;
>> > +	const struct dp_debug_private *debug = m->private;
>> > +	const struct drm_connector *connector = debug->connector;
>> >
>> > -		if (connector->status == connector_status_connected)
>> > -			seq_printf(m, "%02x", DP_TEST_LINK_VIDEO_PATTERN);
>> > -		else
>> > -			seq_puts(m, "0");
>> > -	}
>> > -	drm_connector_list_iter_end(&conn_iter);
>> > +	if (connector->status == connector_status_connected)
>> > +		seq_printf(m, "%02x", DP_TEST_LINK_VIDEO_PATTERN);
>> > +	else
>> > +		seq_puts(m, "0");
>> >
>> >  	return 0;
>> >  }
>> > @@ -161,14 +137,12 @@ static ssize_t dp_test_active_write(struct file
>> > *file,
>> >  {
>> >  	char *input_buffer;
>> >  	int status = 0;
>> > -	struct dp_debug_private *debug;
>> > -	struct drm_device *dev;
>> > -	struct drm_connector *connector;
>> > -	struct drm_connector_list_iter conn_iter;
>> > +	const struct dp_debug_private *debug;
>> > +	const struct drm_connector *connector;
>> >  	int val = 0;
>> >
>> >  	debug = ((struct seq_file *)file->private_data)->private;
>> > -	dev = debug->drm_dev;
>> > +	connector = debug->connector;
>> >
>> >  	if (len == 0)
>> >  		return 0;
>> > @@ -179,30 +153,22 @@ static ssize_t dp_test_active_write(struct file
>> > *file,
>> >
>> >  	DRM_DEBUG_DRIVER("Copied %d bytes from user\n", (unsigned int)len);
>> >
>> > -	drm_connector_list_iter_begin(dev, &conn_iter);
>> > -	drm_for_each_connector_iter(connector, &conn_iter) {
>> > -		if (connector->connector_type !=
>> > -			DRM_MODE_CONNECTOR_DisplayPort)
>> > -			continue;
>> > -
>> > -		if (connector->status == connector_status_connected) {
>> > -			status = kstrtoint(input_buffer, 10, &val);
>> > -			if (status < 0)
>> > -				break;
>> > -			DRM_DEBUG_DRIVER("Got %d for test active\n", val);
>> > -			/* To prevent erroneous activation of the compliance
>> > -			 * testing code, only accept an actual value of 1 here
>> > -			 */
>> > -			if (val == 1)
>> > -				debug->panel->video_test = true;
>> > -			else
>> > -				debug->panel->video_test = false;
>> > +	if (connector->status == connector_status_connected) {
>> > +		status = kstrtoint(input_buffer, 10, &val);
>> > +		if (status < 0) {
>> > +			kfree(input_buffer);
>> > +			return status;
>> >  		}
>> > +		DRM_DEBUG_DRIVER("Got %d for test active\n", val);
>> > +		/* To prevent erroneous activation of the compliance
>> > +		 * testing code, only accept an actual value of 1 here
>> > +		 */
>> > +		if (val == 1)
>> > +			debug->panel->video_test = true;
>> > +		else
>> > +			debug->panel->video_test = false;
>> >  	}
>> > -	drm_connector_list_iter_end(&conn_iter);
>> >  	kfree(input_buffer);
>> > -	if (status < 0)
>> > -		return status;
>> >
>> >  	*offp += len;
>> >  	return len;
>> > @@ -211,25 +177,16 @@ static ssize_t dp_test_active_write(struct file
>> > *file,
>> >  static int dp_test_active_show(struct seq_file *m, void *data)
>> >  {
>> >  	struct dp_debug_private *debug = m->private;
>> > -	struct drm_device *dev = debug->drm_dev;
>> > -	struct drm_connector *connector;
>> > -	struct drm_connector_list_iter conn_iter;
>> > -
>> > -	drm_connector_list_iter_begin(dev, &conn_iter);
>> > -	drm_for_each_connector_iter(connector, &conn_iter) {
>> > -		if (connector->connector_type !=
>> > -			DRM_MODE_CONNECTOR_DisplayPort)
>> > -			continue;
>> > -
>> > -		if (connector->status == connector_status_connected) {
>> > -			if (debug->panel->video_test)
>> > -				seq_puts(m, "1");
>> > -			else
>> > -				seq_puts(m, "0");
>> > -		} else
>> > +	struct drm_connector *connector = debug->connector;
>> > +
>> > +	if (connector->status == connector_status_connected) {
>> > +		if (debug->panel->video_test)
>> > +			seq_puts(m, "1");
>> > +		else
>> >  			seq_puts(m, "0");
>> > +	} else {
>> > +		seq_puts(m, "0");
>> >  	}
>> > -	drm_connector_list_iter_end(&conn_iter);
>> >
>> >  	return 0;
>> >  }
>> > @@ -278,7 +235,7 @@ static int dp_debug_init(struct dp_debug
>> > *dp_debug, struct drm_minor *minor)
>> >
>> >  struct dp_debug *dp_debug_get(struct device *dev, struct dp_panel
>> > *panel,
>> >  		struct dp_usbpd *usbpd, struct dp_link *link,
>> > -		struct drm_connector **connector, struct drm_minor *minor)
>> > +		struct drm_connector *connector, struct drm_minor *minor)
>> >  {
>> >  	int rc = 0;
>> >  	struct dp_debug_private *debug;
>> > diff --git a/drivers/gpu/drm/msm/dp/dp_debug.h
>> > b/drivers/gpu/drm/msm/dp/dp_debug.h
>> > index 7eaedfbb149c..3f90acfffc5a 100644
>> > --- a/drivers/gpu/drm/msm/dp/dp_debug.h
>> > +++ b/drivers/gpu/drm/msm/dp/dp_debug.h
>> > @@ -43,7 +43,7 @@ struct dp_debug {
>> >   */
>> >  struct dp_debug *dp_debug_get(struct device *dev, struct dp_panel
>> > *panel,
>> >  		struct dp_usbpd *usbpd, struct dp_link *link,
>> > -		struct drm_connector **connector,
>> > +		struct drm_connector *connector,
>> >  		struct drm_minor *minor);
>> >
>> >  /**
>> > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c
>> > b/drivers/gpu/drm/msm/dp/dp_display.c
>> > index 1708b7cdc1b3..41a6f58916e6 100644
>> > --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> > @@ -1464,7 +1464,7 @@ void msm_dp_debugfs_init(struct msm_dp
>> > *dp_display, struct drm_minor *minor)
>> >  	dev = &dp->pdev->dev;
>> >
>> >  	dp->debug = dp_debug_get(dev, dp->panel, dp->usbpd,
>> > -					dp->link, &dp->dp_display.connector,
>> > +					dp->link, dp->dp_display.connector,
>> >  					minor);
>> >  	if (IS_ERR(dp->debug)) {
>> >  		rc = PTR_ERR(dp->debug);
