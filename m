Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B90BF41B59E
	for <lists+dri-devel@lfdr.de>; Tue, 28 Sep 2021 20:02:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98DD56E91F;
	Tue, 28 Sep 2021 18:02:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [IPv6:2607:f8b0:4864:20::830])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 611806E91C
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 18:02:22 +0000 (UTC)
Received: by mail-qt1-x830.google.com with SMTP id l13so20749933qtv.3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 11:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=+5VWjy8Fq49Y0oU4GhrpcO9PkvbYY7ylHg6qCcFlNQY=;
 b=eimnEcu76/8gwkbirAOwKdMz3jEr/ek9Rn3wgqGFS5KtD7/LzEviTI8GNdrtjEIRJi
 PvnosJ6FN0ZATtaPxt3iJtyDI/uqObtWoPcCEKQxHtDyZC2mzC0siHRmpjMM7ncfafXv
 YRHBjHRR868f0U+udlwV4zoWOaJrYxr/cCaumckeqC6iCFiwghuy48+vFnYYdcwhnLoA
 UcNTPXHfvj0WUs2whlz5+YtJ7b11JVL2Fip5pxE/YFJ8Fh/gYrMwZnsmcF/URctxKhA8
 /yQHrmlXXQ4UPetNvMoqEJXfIcgYuSSOv22h1QFrrinucUbUBxgtBf65oqpuJs0MNaOc
 Joxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=+5VWjy8Fq49Y0oU4GhrpcO9PkvbYY7ylHg6qCcFlNQY=;
 b=0Hov9Lx4JiZ9PiU+PwHHcQ+eVRQO+laTNpp3gIhp6yHoLCs0fIdMNzv5TwvPuh8YLk
 X/V8n994o5sVMpofLhMvM3bZgYwEZC0NVpU4ZaTpLUroJ1zZOQ4ezJZMnbJ3qMfM49ah
 9PPiKCV38jKeFhbCiNx0BTFWAeC1F6E1q4O4mIvT2WHWCYOPBlJxA/K2ne3YiW3HXdJI
 YG+IbCe7YUDH9yTn3fxxR4PjuggTvW25d6VnwKqGJtHHju8q7JTll7ZKTXg2/HDei+96
 NZ2WAKTng+EY4+zSiWdMKwKTzY8/1a1ZNo1ly5KA3JabODQMbVVE0KsoTUY/HjMNXmIM
 s8sw==
X-Gm-Message-State: AOAM530oKUEOi4mtaL6SKE3uhr95DegamD7XBpffmRasAkyL0Iel2g2s
 cUga0lsvs+g6VVrQD2aVrrPXOw==
X-Google-Smtp-Source: ABdhPJzAGQ/PYJu3J6jKA9b5zZX9OsSADRbPsHiih2zie0XDgmtPFecNprS98M1n9dgcfUOY51mAig==
X-Received: by 2002:a05:622a:1712:: with SMTP id
 h18mr7011365qtk.389.1632852141272; 
 Tue, 28 Sep 2021 11:02:21 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id m139sm16416558qke.18.2021.09.28.11.02.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 28 Sep 2021 11:02:20 -0700 (PDT)
Date: Tue, 28 Sep 2021 14:02:19 -0400
From: Sean Paul <sean@poorly.run>
To: abhinavk@codeaurora.org
Cc: Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 swboyd@chromium.org, Sean Paul <seanpaul@chromium.org>,
 Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [Freedreno] [PATCH v2 13/13] drm/msm: Implement HDCP 1.x using
 the new drm HDCP helpers
Message-ID: <20210928180219.GT2515@art_vandelay>
References: <20210915203834.1439-1-sean@poorly.run>
 <20210915203834.1439-14-sean@poorly.run>
 <2486179cbd76c34a9c085dfff98448e5@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2486179cbd76c34a9c085dfff98448e5@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
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

On Tue, Sep 21, 2021 at 07:25:41PM -0700, abhinavk@codeaurora.org wrote:
> On 2021-09-15 13:38, Sean Paul wrote:
> > From: Sean Paul <seanpaul@chromium.org>
> > 
> > This patch adds HDCP 1.x support to msm DP connectors using the new HDCP
> > helpers.
> > 
> > Cc: Stephen Boyd <swboyd@chromium.org>
> > Signed-off-by: Sean Paul <seanpaul@chromium.org>
> > Link:
> > https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-15-sean@poorly.run
> > #v1
> > 
> > Changes in v2:
> > -Squash [1] into this patch with the following changes (Stephen)
> >   -Update the sc7180 dtsi file
> >   -Remove resource names and just use index (Stephen)
> > 
> 
> 
> > [1]
> > https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-14-sean@poorly.run
> > ---

/snip

> > diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> > index 904535eda0c4..98731fd262d6 100644
> > --- a/drivers/gpu/drm/msm/Makefile
> > +++ b/drivers/gpu/drm/msm/Makefile
> > @@ -109,6 +109,7 @@ msm-$(CONFIG_DRM_MSM_DP)+= dp/dp_aux.o \
> >  	dp/dp_ctrl.o \
> >  	dp/dp_display.o \
> >  	dp/dp_drm.o \
> > +	dp/dp_hdcp.o \
> >  	dp/dp_hpd.o \
> >  	dp/dp_link.o \
> >  	dp/dp_panel.o \
> > diff --git a/drivers/gpu/drm/msm/dp/dp_debug.c
> > b/drivers/gpu/drm/msm/dp/dp_debug.c
> > index 2f6247e80e9d..de16fca8782a 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_debug.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_debug.c

/snip

> > +static ssize_t dp_hdcp_key_write(struct file *file, const char __user
> > *ubuf,
> > +				 size_t len, loff_t *offp)
> > +{
> > +	char *input_buffer;
> > +	int ret = 0;
> > +	struct dp_debug_private *debug = file->private_data;
> > +	struct drm_device *dev;
> > +
> > +	dev = debug->drm_dev;
> > +
> > +	if (len != (DRM_HDCP_KSV_LEN + DP_HDCP_NUM_KEYS * DP_HDCP_KEY_LEN))
> > +		return -EINVAL;
> > +
> > +	if (!debug->hdcp)
> > +		return -ENOENT;
> > +
> > +	input_buffer = memdup_user_nul(ubuf, len);
> > +	if (IS_ERR(input_buffer))
> > +		return PTR_ERR(input_buffer);
> > +
> > +	ret = dp_hdcp_ingest_key(debug->hdcp, input_buffer, len);
> > +
> > +	kfree(input_buffer);
> > +	if (ret < 0) {
> > +		DRM_ERROR("Could not ingest HDCP key, ret=%d\n", ret);
> > +		return ret;
> > +	}
> > +
> > +	*offp += len;
> > +	return len;
> > +}
> 
> It seems like the HDCP keys written using debugfs, just for my
> understanding,
> are you storing this in some secure partition and the usermode reads from it
> and writes them here?
> 

We have not sorted out the userspace side of HDCP enablement yet, so it remains
to be seen whether the keys will be injected via debugfs/firmware file/property.

/snip

> > +static int dp_connector_atomic_check(struct drm_connector *connector,
> > +				     struct drm_atomic_state *state)
> > +{
> > +	struct drm_connector_state *conn_state;
> > +	struct dp_connector_state *dp_state;
> > +
> > +	conn_state = drm_atomic_get_new_connector_state(state, connector);
> > +	dp_state = to_dp_connector_state(conn_state);
> > +
> > +	dp_state->hdcp_transition = drm_hdcp_atomic_check(connector, state);
> 
> I have a general question related to the transition flag and overall tying
> the HDCP
> enable and authentication to the commit.
> So lets say there is a case where the driver needs to disable HDCP. It could
> be due
> to link integrity failure OR some other error condition which usermode is
> not aware of.
> In that case, we will set this hdcp_transition to true but in the next
> commit we will
> actually do the authentication. What if usermode doesnt issue a new frame?
> This question arises because currently the link intergrity check is done
> using SW polling
> in the previous patchset. But as I had commented there, this occurs in HW
> for us.
> I dont see that isr itself in this patchset. So wanted to understand if
> thats part of this
> approach to still tie it with commit.
> 
> So if we go with the HW polling based approach which is the preferred
> method, we need to
> untie this from the commit.
> 

In the case of error, the worker will detect it and try to re-authenticate. If
the re-authentication is successful, userspace will continue to be unaware and
everything will keep working. If re-authentication is unsuccessful, the worker
will update the property value and issue a uevent to userspace. So HDCP
enablement is only tied to commits when the property value is changing as a
result of userspace.

Regarding SW vs HW link checks, I don't think there's any difference in efficacy
between them. If HW can be relied on to issue an interrupt in failure cases, a
follow-up set allowing for this seems like a great idea.

> > +
> > +	return 0;
> > +}

/snip

> > +static int dp_hdcp_load_keys(struct drm_connector *connector)
> > +{
> > +	struct dp_hdcp *hdcp = dp_display_connector_to_hdcp(connector);
> > +	struct dp_hdcp_key *key;
> > +	int i, ret = 0;
> > +
> > +	mutex_lock(&hdcp->key_lock);
> > +
> > +	key = hdcp->key;
> > +
> > +	if (!key->valid) {
> > +		ret = -ENOENT;
> > +		goto out;
> > +	}
> > +
> > +	dp_hdcp_write_dp(hdcp, DP_HDCP_SW_LOWER_AKSV, key->ksv.words[0]);
> > +	dp_hdcp_write_dp(hdcp, DP_HDCP_SW_UPPER_AKSV, key->ksv.words[1]);
> > +
> > +	for (i = 0; i < DP_HDCP_NUM_KEYS; i++) {
> > +		dp_hdcp_write_hdcp(hdcp, DP_HDCP_KEY_LSB(i),
> > +				   key->keys[i].words[0]);
> > +		dp_hdcp_write_hdcp(hdcp, DP_HDCP_KEY_MSB(i),
> > +				   key->keys[i].words[1]);
> > +	}
> > +
> > +	dp_hdcp_write_hdcp(hdcp, DP_HDCP_KEY_VALID, DP_HDCP_SW_KEY_VALID);
> 
> I think all of these are TZ_*** registers. So the separation of write_hdcp()
> Vs write_hdcp_tz()
> is not very clear to me.
> Maybe change the write APIs to something like dp_hdcp_write_hdcp_tz() for
> the first address space
> and dp_hdcp_write_hdcp_tz_hlos() for the other one?
> 

Will do in v3, thank you for the suggestion.

> > +	wmb();
> > +
> > +	dp_hdcp_write_dp(hdcp, DP_HDCP_ENTROPY_CTRL0, get_random_u32());
> > +	dp_hdcp_write_dp(hdcp, DP_HDCP_ENTROPY_CTRL1, get_random_u32());
> > +	wmb();
> > +
> > +out:
> > +	mutex_unlock(&hdcp->key_lock);
> > +	return ret;
> > +}
> > +
> > +static int dp_hdcp_hdcp2_capable(struct drm_connector *connector,
> > bool *capable)
> > +{
> > +	*capable = false;
> > +	return 0;
> > +}
> > +
> > +static int dp_hdcp_hdcp1_read_an_aksv(struct drm_connector *connector,
> > +				      u32 *an, u32 *aksv)
> > +{
> > +	struct dp_hdcp *hdcp = dp_display_connector_to_hdcp(connector);
> > +	bool keys_valid;
> > +	int ret;
> > +	u32 val;
> > +
> > +	dp_hdcp_write_dp(hdcp, DP_HDCP_CTRL, 1);
> > +
> > +	ret = read_poll_timeout(dp_hdcp_are_keys_valid, keys_valid,
> > keys_valid,
> > +				20 * 1000, 10 * 1000, false, connector);
> > +	if (ret) {
> > +		drm_err(hdcp->dev, "HDCP keys invalid %d\n", ret);
> > +		return ret;
> > +	}
> > +
> > +	/* Clear AInfo */
> > +	dp_hdcp_write_dp(hdcp, DP_HDCP_RCVPORT_DATA4, 0);
> > +
> > +	aksv[0] = dp_hdcp_read_dp(hdcp, DP_HDCP_RCVPORT_DATA3);
> > +	aksv[1] = GENMASK(7, 0) & dp_hdcp_read_dp(hdcp,
> > DP_HDCP_RCVPORT_DATA4);
> > +
> > +	ret = read_poll_timeout(dp_hdcp_read_dp, val,
> > +				(val & DP_HDCP_AN_READY_MASK) == DP_HDCP_AN_READY_MASK,
> > +				100, 10 * 1000, false, hdcp, DP_HDCP_STATUS);
> > +	if (ret) {
> > +		drm_err(hdcp->dev, "AN failed to become ready %x/%d\n", val, ret);
> > +		return ret;
> > +	}
> > +
> > +	/*
> > +	 * Get An from hardware, for unknown reasons we need to read the reg
> > +	 * twice to get valid data.
> > +	 */
> > +	dp_hdcp_read_dp(hdcp, DP_HDCP_RCVPORT_DATA5);
> > +	an[0] = dp_hdcp_read_dp(hdcp, DP_HDCP_RCVPORT_DATA5);
> > +
> > +	dp_hdcp_read_dp(hdcp, DP_HDCP_RCVPORT_DATA6);
> > +	an[1] = dp_hdcp_read_dp(hdcp, DP_HDCP_RCVPORT_DATA6);
> 
> Yes its true, but we also have a 1 microsec delay between the first and
> second one.
> So I would certainly preserve that.

Will do in v3, thank you for the suggestion.

> 
> > +
> > +	return 0;
> > +}
> > +
> > +static int dp_hdcp_hdcp1_store_receiver_info(struct drm_connector
> > *connector,
> > +					     u32 *ksv, u32 status, u8 bcaps,
> > +					     bool is_repeater)
> > +{
> > +	struct dp_hdcp *hdcp = dp_display_connector_to_hdcp(connector);
> > +	u32 val;
> > +
> > +	dp_hdcp_write_tz(hdcp, HDCP_SEC_DP_TZ_HV_HLOS_HDCP_RCVPORT_DATA0,
> > +			 ksv[0]);
> > +	dp_hdcp_write_tz(hdcp, HDCP_SEC_DP_TZ_HV_HLOS_HDCP_RCVPORT_DATA1,
> > +			 ksv[1]);
> > +
> > +	val = ((status & GENMASK(15, 0)) << 8) | (bcaps & GENMASK(7, 0));
> > +
> > +	dp_hdcp_write_tz(hdcp, HDCP_SEC_DP_TZ_HV_HLOS_HDCP_RCVPORT_DATA12,
> > val);
> > +
> 
> Cant this entire API be skipped for non-repeater cases from the hdcp lib
> layer?
> You can write the bcaps to this earlier and write the bstatus only if its a
> repeater.

Could you expand on the benefits of this?

> 
> > +	return 0;
> > +}

/snip

-- 
Sean Paul, Software Engineer, Google / Chromium OS
