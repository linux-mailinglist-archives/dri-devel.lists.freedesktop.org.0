Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 659E441B529
	for <lists+dri-devel@lfdr.de>; Tue, 28 Sep 2021 19:33:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB32B6E906;
	Tue, 28 Sep 2021 17:33:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 852E76E903
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 17:33:39 +0000 (UTC)
Received: by mail-qt1-x831.google.com with SMTP id d8so20623014qtd.5
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 10:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=70n+XEY0HXO/+ZEBN/2DCJ2jjfSAY4lK7P8Bu+Zy0lM=;
 b=H4mVcWCkVOWkXm86D/HGeaBkxcVm4u5kE81DMOfjtrWC1EjNtZB6VxDNfnVFKggAHk
 jruVnCwHLEBXaYZvHjdbg6DG62uzIcynnyI/VO8Ew1r67/jHIT1xjK+4a3/Dq0EwgocT
 YNmU3FuAimCn1q/VBLkbtLh7Q80SNmn75sO6ddgawNORGowgMu5NW7CiJIS9RUolCCM1
 c5I/RtvRP1/d691qjF517b9FXz7tpsPKRXMJgy42cMp8wuHqy8Rn6F+ll7o0nGRgbQv+
 NlzlCP8R8QyuYDmPt0ptPjKv/328NYVmJfonhNiMczyuBXpTrLffZ1TdFbZZikCHFFiE
 QjOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=70n+XEY0HXO/+ZEBN/2DCJ2jjfSAY4lK7P8Bu+Zy0lM=;
 b=k8imoeErRXmPItd6OwRt0Miyqj4wUP4guda04dfz+YHGuYf1Btbyb02h/t1hxv9yon
 0gmLi8FwGdqjCYfEDecwiAxfcS+zKk7S3/ArpiivZmj09ettfHW83UPnpBv06FabHPW/
 8z0+VIeUtst16b0hVGGsx8XUuIaBA1SyNWXI76V5CJegGW5IJjRw745+pQmHFtWcxADu
 QwKiGKZ3N4lnzMRVjm8kqF9qB9Z4x3koGz3Fw9voCv3js2s5HbnWSooU8K0TA3+UVyAx
 otc+NVcfdpTyK+m8OIggDhaAEXXErBs2vMSNZmA2mApQlHQqajSUve0H4AUxBH/JWGPl
 nFEw==
X-Gm-Message-State: AOAM533aXu3P3HFKXHZtYWoUaiKeQmx18I0LiQDUxoITM5OXVa7ASHYX
 RfCWA6jML6p1xR9mwCJT9atPbQ==
X-Google-Smtp-Source: ABdhPJwn/ZeI3JH9V7JmKqJAxkMxLajjAaVEvvmfZLty9Kr/S38GPlMk2tyu4OxjCTrRjbNS4HWlVA==
X-Received: by 2002:ac8:13c4:: with SMTP id i4mr6871699qtj.350.1632850418520; 
 Tue, 28 Sep 2021 10:33:38 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id u13sm14671502qki.38.2021.09.28.10.33.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 28 Sep 2021 10:33:37 -0700 (PDT)
Date: Tue, 28 Sep 2021 13:33:36 -0400
From: Sean Paul <sean@poorly.run>
To: abhinavk@codeaurora.org
Cc: Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 swboyd@chromium.org, Sean Paul <seanpaul@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [Freedreno] [PATCH v2 04/13] drm/hdcp: Expand HDCP helper
 library for enable/disable/check
Message-ID: <20210928173336.GS2515@art_vandelay>
References: <20210915203834.1439-1-sean@poorly.run>
 <20210915203834.1439-5-sean@poorly.run>
 <e96c4be49ef53fec4a81785a43ecb18f@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e96c4be49ef53fec4a81785a43ecb18f@codeaurora.org>
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

On Tue, Sep 21, 2021 at 04:34:59PM -0700, abhinavk@codeaurora.org wrote:
> On 2021-09-15 13:38, Sean Paul wrote:
> > From: Sean Paul <seanpaul@chromium.org>
> > 
> > This patch expands upon the HDCP helper library to manage HDCP
> > enable, disable, and check.
> > 
> > Previous to this patch, the majority of the state management and sink
> > interaction is tucked inside the Intel driver with the understanding
> > that once a new platform supported HDCP we could make good decisions
> > about what should be centralized. With the addition of HDCP support
> > for Qualcomm, it's time to migrate the protocol-specific bits of HDCP
> > authentication, key exchange, and link checks to the HDCP helper.
> > 
> > In terms of functionality, this migration is 1:1 with the Intel driver,
> > however things are laid out a bit differently than with intel_hdcp.c,
> > which is why this is a separate patch from the i915 transition to the
> > helper. On i915, the "shim" vtable is used to account for HDMI vs. DP
> > vs. DP-MST differences whereas the helper library uses a LUT to
> > account for the register offsets and a remote read function to route
> > the messages. On i915, storing the sink information in the source is
> > done inline whereas now we use the new drm_hdcp_helper_funcs vtable
> > to store and fetch information to/from source hw. Finally, instead of
> > calling enable/disable directly from the driver, we'll leave that
> > decision to the helper and by calling drm_hdcp_helper_atomic_commit()
> > from the driver. All told, this will centralize the protocol and state
> > handling in the helper, ensuring we collect all of our bugs^Wlogic
> > in one place.
> > 
> > Signed-off-by: Sean Paul <seanpaul@chromium.org>
> > Link:
> > https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-5-sean@poorly.run
> > #v1
> > 
> > Changes in v2:
> > -Fixed set-but-unused variable identified by 0-day
> > ---
> >  drivers/gpu/drm/drm_hdcp.c | 1103 ++++++++++++++++++++++++++++++++++++
> >  include/drm/drm_hdcp.h     |  191 +++++++
> >  2 files changed, 1294 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/drm_hdcp.c b/drivers/gpu/drm/drm_hdcp.c
> > index 742313ce8f6f..47c6e6923a76 100644
> > --- a/drivers/gpu/drm/drm_hdcp.c
> > +++ b/drivers/gpu/drm/drm_hdcp.c

/snip

> > +static void drm_hdcp_helper_check_work(struct work_struct *work)
> > +{
> > +	struct drm_hdcp_helper_data *data =
> > container_of(to_delayed_work(work),
> > +							 struct drm_hdcp_helper_data,
> > +							 check_work);
> > +	unsigned long check_link_interval;
> > +
> 
> Does this SW polling for Ri' mismatch need to be done even if the HW is
> capable of doing it
> on its own?
> MSM HDCP 1x HW can periodically check Ri' mismatches and issue an interrupt
> if there is a mismatch.
> In that case this SW polling is not needed. So maybe check if the HW
> supports polling and if so
> skip this SW polling?
> 

One could certainly change this to be HW driven. There is also an interrupt on
Intel for DP links which [re]schedules link check in the interrupt handler,
something similar could be done for msm. Note that even on these Intel links
which support the CP interrupt, the worker still runs on the normal cadence. I
haven't considered relying solely on the interrupt since I want to be sure we
didn't miss anything.

Sean

> > +	mutex_lock(&data->mutex);
> > +	if (data->value != DRM_MODE_CONTENT_PROTECTION_ENABLED)
> > +		goto out_data_mutex;
> > +
> > +	drm_hdcp_helper_driver_lock(data);
> > +
> > +	if (data->enabled_type == DRM_MODE_HDCP_CONTENT_TYPE1) {
> > +		if (drm_hdcp_hdcp2_check_link(data))
> > +			goto out;
> > +		check_link_interval = DRM_HDCP2_CHECK_PERIOD_MS;
> > +	} else {
> > +		if (drm_hdcp_hdcp1_check_link(data))
> > +			goto out;
> > +		check_link_interval = DRM_HDCP_CHECK_PERIOD_MS;
> > +	}
> > +	schedule_delayed_work(&data->check_work, check_link_interval);
> > +
> > +out:
> > +	drm_hdcp_helper_driver_unlock(data);
> > +out_data_mutex:
> > +	mutex_unlock(&data->mutex);
> > +}

/snip

-- 
Sean Paul, Software Engineer, Google / Chromium OS
