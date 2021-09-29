Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 042A541C750
	for <lists+dri-devel@lfdr.de>; Wed, 29 Sep 2021 16:52:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85A5B6EAA1;
	Wed, 29 Sep 2021 14:52:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEB2F6EAA1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 14:52:23 +0000 (UTC)
Received: by mail-qt1-x82b.google.com with SMTP id r1so2493601qta.12
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 07:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=7JUE3KnwhzODMFVKnxXssJhCx06ypOEtInaS9VOkBkc=;
 b=fEPcDyJIUlgGINqrdGQWXxbylyFaK2FDZ+tEciqN1QqVHxIMoGNh01cy71i9hulBrb
 Ecc7pqn9FQVSle5p2ib31pKYcFcSqKGUAw9fD/Rt9nu0snwFY1nEa/em0Ns1EHUEgWUY
 +6lLX31R29/Q4STnRF5RkIQZqKLDrtYuhAHSZXscTv6ISV8k4RTz7pj/3T2bkLjWsBWr
 tIYoNBMLBHIcsfd8YqNrY3P0urlD5femmNoTWhT3FWznuSpYrbg9svfyHncSXzewI/VU
 y40kzfszbo6mXYwIoydOPnVsAL19hUGrqerQkdCpYI0j4xR3eJIBpLt6AOq+Tr2T6Jof
 k8uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=7JUE3KnwhzODMFVKnxXssJhCx06ypOEtInaS9VOkBkc=;
 b=ZOXocdLptIgKlbcDRqtrEOw7iMQG4rk/38IunaTTRbOcb5ApLAXL6jQEse7T8sPxvv
 J3p3IJU+6P9ktA+N1xOlsB67yjrC8dKZTalNfSlhmvJ3eYgvEgwf68alrpNwOmzwRc62
 F1Isfeu2v25qgWje3+PJYNEJrUNh9kc4fBZ0CX1dmrbnt/He2/841hdixQjAcGQJ21nI
 a89sqnzp1m61KbvN9j/M6g3iLkj8pG59GbC0dviF34e7NPx2hMBx1jshEd5WnKFK0cV8
 LfNL46J4a1Phy1LasraO5AFcv2hfdojSG+zaX3pYwpdcuCJQdGrenjGxBzOtoqcipm2n
 Po9A==
X-Gm-Message-State: AOAM531L3adlAGQM69DHQM2Ywb2F+2T2k/Ovv57yF2eOvxZSMos2+bF1
 XtgQVect/n+gf0Hb3542XPF4rw==
X-Google-Smtp-Source: ABdhPJz2Dh587oAtNE+3dwmaLnKNyuoarrG+93H0oIr0lYSQ8p8duyHAHS/lBIVypGgw9ktyNvRQ2g==
X-Received: by 2002:ac8:534b:: with SMTP id d11mr269756qto.167.1632927143089; 
 Wed, 29 Sep 2021 07:52:23 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id o21sm48055qtt.12.2021.09.29.07.52.22
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 29 Sep 2021 07:52:22 -0700 (PDT)
Date: Wed, 29 Sep 2021 10:52:20 -0400
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
Message-ID: <20210929145220.GV2515@art_vandelay>
References: <20210915203834.1439-1-sean@poorly.run>
 <20210915203834.1439-14-sean@poorly.run>
 <2486179cbd76c34a9c085dfff98448e5@codeaurora.org>
 <20210928180219.GT2515@art_vandelay>
 <48a284181bf6211b60f8318531051add@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <48a284181bf6211b60f8318531051add@codeaurora.org>
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

On Tue, Sep 28, 2021 at 02:35:09PM -0700, abhinavk@codeaurora.org wrote:
> On 2021-09-28 11:02, Sean Paul wrote:
> > On Tue, Sep 21, 2021 at 07:25:41PM -0700, abhinavk@codeaurora.org wrote:
> > > On 2021-09-15 13:38, Sean Paul wrote:
> > > > From: Sean Paul <seanpaul@chromium.org>
> > > >
> > > > This patch adds HDCP 1.x support to msm DP connectors using the new HDCP
> > > > helpers.
> > > >
> > > > Cc: Stephen Boyd <swboyd@chromium.org>
> > > > Signed-off-by: Sean Paul <seanpaul@chromium.org>
> > > > Link:
> > > > https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-15-sean@poorly.run
> > > > #v1
> > > >
> > > > Changes in v2:
> > > > -Squash [1] into this patch with the following changes (Stephen)
> > > >   -Update the sc7180 dtsi file
> > > >   -Remove resource names and just use index (Stephen)
> > > >
> > > 
> > > 
> > > > [1]
> > > > https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-14-sean@poorly.run
> > > > ---
> > 
> > /snip
> > 
> > > > diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> > > > index 904535eda0c4..98731fd262d6 100644
> > > > --- a/drivers/gpu/drm/msm/Makefile
> > > > +++ b/drivers/gpu/drm/msm/Makefile
> > > > @@ -109,6 +109,7 @@ msm-$(CONFIG_DRM_MSM_DP)+= dp/dp_aux.o \
> > > >  	dp/dp_ctrl.o \
> > > >  	dp/dp_display.o \
> > > >  	dp/dp_drm.o \
> > > > +	dp/dp_hdcp.o \
> > > >  	dp/dp_hpd.o \
> > > >  	dp/dp_link.o \
> > > >  	dp/dp_panel.o \
> > > > diff --git a/drivers/gpu/drm/msm/dp/dp_debug.c
> > > > b/drivers/gpu/drm/msm/dp/dp_debug.c
> > > > index 2f6247e80e9d..de16fca8782a 100644
> > > > --- a/drivers/gpu/drm/msm/dp/dp_debug.c
> > > > +++ b/drivers/gpu/drm/msm/dp/dp_debug.c
> > 
> > /snip
> > 
> > > > +static ssize_t dp_hdcp_key_write(struct file *file, const char __user
> > > > *ubuf,
> > > > +				 size_t len, loff_t *offp)
> > > > +{
> > > > +	char *input_buffer;
> > > > +	int ret = 0;
> > > > +	struct dp_debug_private *debug = file->private_data;
> > > > +	struct drm_device *dev;
> > > > +
> > > > +	dev = debug->drm_dev;
> > > > +
> > > > +	if (len != (DRM_HDCP_KSV_LEN + DP_HDCP_NUM_KEYS * DP_HDCP_KEY_LEN))
> > > > +		return -EINVAL;
> > > > +
> > > > +	if (!debug->hdcp)
> > > > +		return -ENOENT;
> > > > +
> > > > +	input_buffer = memdup_user_nul(ubuf, len);
> > > > +	if (IS_ERR(input_buffer))
> > > > +		return PTR_ERR(input_buffer);
> > > > +
> > > > +	ret = dp_hdcp_ingest_key(debug->hdcp, input_buffer, len);
> > > > +
> > > > +	kfree(input_buffer);
> > > > +	if (ret < 0) {
> > > > +		DRM_ERROR("Could not ingest HDCP key, ret=%d\n", ret);
> > > > +		return ret;
> > > > +	}
> > > > +
> > > > +	*offp += len;
> > > > +	return len;
> > > > +}
> > > 
> > > It seems like the HDCP keys written using debugfs, just for my
> > > understanding,
> > > are you storing this in some secure partition and the usermode reads
> > > from it
> > > and writes them here?
> > > 
> > 
> > We have not sorted out the userspace side of HDCP enablement yet, so it
> > remains
> > to be seen whether the keys will be injected via debugfs/firmware
> > file/property.
> > 
> > /snip
> > 
> > > > +static int dp_connector_atomic_check(struct drm_connector *connector,
> > > > +				     struct drm_atomic_state *state)
> > > > +{
> > > > +	struct drm_connector_state *conn_state;
> > > > +	struct dp_connector_state *dp_state;
> > > > +
> > > > +	conn_state = drm_atomic_get_new_connector_state(state, connector);
> > > > +	dp_state = to_dp_connector_state(conn_state);
> > > > +
> > > > +	dp_state->hdcp_transition = drm_hdcp_atomic_check(connector, state);
> > > 
> > > I have a general question related to the transition flag and overall
> > > tying
> > > the HDCP
> > > enable and authentication to the commit.
> > > So lets say there is a case where the driver needs to disable HDCP.
> > > It could
> > > be due
> > > to link integrity failure OR some other error condition which
> > > usermode is
> > > not aware of.
> > > In that case, we will set this hdcp_transition to true but in the next
> > > commit we will
> > > actually do the authentication. What if usermode doesnt issue a new
> > > frame?
> > > This question arises because currently the link intergrity check is
> > > done
> > > using SW polling
> > > in the previous patchset. But as I had commented there, this occurs
> > > in HW
> > > for us.
> > > I dont see that isr itself in this patchset. So wanted to understand
> > > if
> > > thats part of this
> > > approach to still tie it with commit.
> > > 
> > > So if we go with the HW polling based approach which is the preferred
> > > method, we need to
> > > untie this from the commit.
> > > 
> > 
> > In the case of error, the worker will detect it and try to
> > re-authenticate. If
> > the re-authentication is successful, userspace will continue to be
> > unaware and
> > everything will keep working. If re-authentication is unsuccessful, the
> > worker
> > will update the property value and issue a uevent to userspace. So HDCP
> > enablement is only tied to commits when the property value is changing
> > as a
> > result of userspace.
> > 
> > Regarding SW vs HW link checks, I don't think there's any difference in
> > efficacy
> > between them. If HW can be relied on to issue an interrupt in failure
> > cases, a
> > follow-up set allowing for this seems like a great idea.
> > 
> 
> Thanks for the explanation. Yes, from our experience it has been pretty
> reliable to
> issue signal integrity failures. We already had the isr based approach
> downstream
> and would prefer to keep it that way based on our experience of it firing
> reliably.
> We can still keep the SW polling code but it should come into effect only if
> HW polling
> is not supported / preferred.

Ok, understood. Unfortunately I don't have access to a testing rig which could
exercise the interrupt. Do you think you could post a follow-on patch to
implement this?


> 
> > > > +
> > > > +	return 0;
> > > > +}
> > 
> > /snip
> > 

/snip

> > > > +static int dp_hdcp_hdcp1_store_receiver_info(struct drm_connector
> > > > *connector,
> > > > +					     u32 *ksv, u32 status, u8 bcaps,
> > > > +					     bool is_repeater)
> > > > +{
> > > > +	struct dp_hdcp *hdcp = dp_display_connector_to_hdcp(connector);
> > > > +	u32 val;
> > > > +
> > > > +	dp_hdcp_write_tz(hdcp, HDCP_SEC_DP_TZ_HV_HLOS_HDCP_RCVPORT_DATA0,
> > > > +			 ksv[0]);
> > > > +	dp_hdcp_write_tz(hdcp, HDCP_SEC_DP_TZ_HV_HLOS_HDCP_RCVPORT_DATA1,
> > > > +			 ksv[1]);
> > > > +
> > > > +	val = ((status & GENMASK(15, 0)) << 8) | (bcaps & GENMASK(7, 0));
> > > > +
> > > > +	dp_hdcp_write_tz(hdcp, HDCP_SEC_DP_TZ_HV_HLOS_HDCP_RCVPORT_DATA12,
> > > > val);
> > > > +
> > > 
> > > Cant this entire API be skipped for non-repeater cases from the hdcp
> > > lib
> > > layer?
> > > You can write the bcaps to this earlier and write the bstatus only
> > > if its a
> > > repeater.
> > 
> > Could you expand on the benefits of this?
> 
> We can avoid the call coming into the vendor driver hook itself as it need
> not be called
> for non-repeater cases. So something like this can be done in the HDCP lib?
> 
> if ( repeater && ops->hdcp1_store_receiver_info )
>      ops->hdcp1_store_receiver_info(....);
> 

Unfortunately this would break Intel's implementation.

> > 
> > > 
> > > > +	return 0;
> > > > +}
> > 
> > /snip

-- 
Sean Paul, Software Engineer, Google / Chromium OS
