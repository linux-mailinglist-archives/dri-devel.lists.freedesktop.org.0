Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 100004B195E
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 00:22:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 054C710E97E;
	Thu, 10 Feb 2022 23:22:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com
 [IPv6:2607:f8b0:4864:20::c32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 882C710E97E
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Feb 2022 23:22:37 +0000 (UTC)
Received: by mail-oo1-xc32.google.com with SMTP id
 t75-20020a4a3e4e000000b002e9c0821d78so8353306oot.4
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Feb 2022 15:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=VWcjiP0aJllSyLu5U7SuD3WWUkksQFBkkd2fOLl4Q3g=;
 b=DQkeyAZAViLmDFiSaddRDOcrKfXdLrLVdNU6dUqr4gmx3UcugdllIp0uoMgmIJNl7C
 R9Q5w4bmcYoN1zMGB3Z3oDaGVqS9OFoPJ5GoUNpNLi/detKsVXtwGKgc+zGrz7xICbhB
 GaVbpw4SGsyFeaf71CGt74oSc0hXwm+c62TRcU2MTAXpDogpMY+6Dg2x2JbNUq3fJYPg
 csv7YWwUBSNCQ+mEBwFBK//hqNw1g6lGazliwGgV6Ufdwg/+R5bQrP8r2SjXEy0c/BYn
 muoGUegKH/dEB3MCiZ2PYFjXb3h3LvchHVy4MF06pKHqKPLyadW9IEcbjbbQaQu6o1R6
 Y+1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VWcjiP0aJllSyLu5U7SuD3WWUkksQFBkkd2fOLl4Q3g=;
 b=mmGlvfRLl/5d1nDKcn5ukzgxX+XqcugpVkDBC0FDHdci+rCGOxVoDQ258h1lThnIP6
 zJsRI8E3Xt13GX+sRkSBlNBvgKZTua8Amf4cfaejmaulYIpTh0EYi+zoaWZhELyYW6X/
 2TSDzpvFvJkA79SM6R5MZzZR3tPYQalLR0/J6RNuFVms9dtzJUTuVfyHlYqNt3yIWRMV
 ATpkqyc5ywPq0P0R2er06fjTlUPoEwy7+0h+wTB6BZ9vDlysjX9KVn7OCxY5o2EPiDXo
 jNopprDPEa5mOW+ESjR5Lzras9s46IjXv/5MHKUV/Jaa6TttM0uVEpPViXjbSuQdkqvM
 RxFg==
X-Gm-Message-State: AOAM530X4Y2ACxC79St/o6OjSn3lKN4jaINXA68RBqKkhsBv8Zu5eDAM
 NGaZIKWYpXwDIjTF91neLr6z8A==
X-Google-Smtp-Source: ABdhPJzGHTz/lbwaYjTzQQN0oGwFuY/HWnLxlow29evo1zJed7Y64duTC98MM2AHDncWWIysYjlhOw==
X-Received: by 2002:a05:6870:a3c2:: with SMTP id
 h2mr1522821oak.152.1644535356674; 
 Thu, 10 Feb 2022 15:22:36 -0800 (PST)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id b32sm3163784oaq.43.2022.02.10.15.22.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 15:22:36 -0800 (PST)
Date: Thu, 10 Feb 2022 15:24:51 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 1/2] drm: Add HPD state to
 drm_connector_oob_hotplug_event()
Message-ID: <YgWewzgtHM7B6KUI@ripper>
References: <20220208044328.588860-1-bjorn.andersson@linaro.org>
 <YgJISIIacBnFyTLq@kroah.com> <YgV8GyK9G0gbWAaq@ripper>
 <CAA8EJppkZTRApQbuEUACw=r2kBH+321_f1ZqRf_-veEuwB56zg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJppkZTRApQbuEUACw=r2kBH+321_f1ZqRf_-veEuwB56zg@mail.gmail.com>
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
Cc: linux-arm-msm@vger.kernel.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>, linux-usb@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu 10 Feb 13:12 PST 2022, Dmitry Baryshkov wrote:

> On Thu, 10 Feb 2022 at 23:54, Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > On Tue 08 Feb 02:39 PST 2022, Greg Kroah-Hartman wrote:
> >
> > > On Mon, Feb 07, 2022 at 08:43:27PM -0800, Bjorn Andersson wrote:
> > > > In some implementations, such as the Qualcomm platforms, the display
> > > > driver has no way to query the current HPD state and as such it's
> > > > impossible to distinguish between disconnect and attention events.
> > > >
> > > > Add a parameter to drm_connector_oob_hotplug_event() to pass the HPD
> > > > state.
> > > >
> > > > Also push the test for unchanged state in the displayport altmode driver
> > > > into the i915 driver, to allow other drivers to act upon each update.
> > > >
> > > > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > > ---
> > > >
> > > > Note that the Intel driver has only been compile tested with this patch.
> > > >
> > > >  drivers/gpu/drm/drm_connector.c          |  6 ++++--
> > > >  drivers/gpu/drm/i915/display/intel_dp.c  | 14 +++++++++++---
> > > >  drivers/gpu/drm/i915/i915_drv.h          |  3 +++
> > > >  drivers/usb/typec/altmodes/displayport.c |  9 ++-------
> > > >  include/drm/drm_connector.h              |  5 +++--
> > > >  5 files changed, 23 insertions(+), 14 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> > > > index a50c82bc2b2f..ad7295597c0f 100644
> > > > --- a/drivers/gpu/drm/drm_connector.c
> > > > +++ b/drivers/gpu/drm/drm_connector.c
> > > > @@ -2825,6 +2825,7 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
> > > >  /**
> > > >   * drm_connector_oob_hotplug_event - Report out-of-band hotplug event to connector
> > > >   * @connector_fwnode: fwnode_handle to report the event on
> > > > + * @hpd_state: number of data lanes available
> > >
> > > "number"?
> > >
> > > >   *
> > > >   * On some hardware a hotplug event notification may come from outside the display
> > > >   * driver / device. An example of this is some USB Type-C setups where the hardware
> > > > @@ -2834,7 +2835,8 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
> > > >   * This function can be used to report these out-of-band events after obtaining
> > > >   * a drm_connector reference through calling drm_connector_find_by_fwnode().
> > > >   */
> > > > -void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode)
> > > > +void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
> > > > +                                bool hpd_state)
> > >
> > > This is a boolean, how can it be a number?
> > >
> >
> > The kerneldoc wasn't appropriately updated as this went from being
> > "number of data lanes" to "the hot plug detect (hpd) state".
> >
> > > And having a "flag" like this is a pain, how do you know what the
> > > parameter really means?
> > >
> >
> > You're right, "state" isn't a boolean property, let's rename it
> > "hpd_high" to clarify it.
> 
> "connected" ?
> 

I've been trying to find some references to point to, but my
understanding is that in a DisplayPort or HDMI connector/cable you have
a dedicated HPD pin, which when high denotes the sink is alive _and_
EDID can be read.

So in a situation where you have a multifunction USB & DP/HDMI hub where
you connect a display, you might have the USB hub connected to the host
and you might even have your sink connected, but HPD could still be low
until the display is ready to talk to you. So physically everything is
connected, but this property will still be "not connected".

As such I don't think it's appropriate to name it "connected".

Regards,
Bjorn

> >
> > > >  {
> > > >     struct drm_connector *connector;
> > > >
> > > > @@ -2843,7 +2845,7 @@ void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode)
> > > >             return;
> > > >
> > > >     if (connector->funcs->oob_hotplug_event)
> > > > -           connector->funcs->oob_hotplug_event(connector);
> > > > +           connector->funcs->oob_hotplug_event(connector, hpd_state);
> > > >
> > > >     drm_connector_put(connector);
> > > >  }
> > > > diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> > > > index 146b83916005..00520867d37b 100644
> > > > --- a/drivers/gpu/drm/i915/display/intel_dp.c
> > > > +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> > > > @@ -4816,15 +4816,23 @@ static int intel_dp_connector_atomic_check(struct drm_connector *conn,
> > > >     return intel_modeset_synced_crtcs(state, conn);
> > > >  }
> > > >
> > > > -static void intel_dp_oob_hotplug_event(struct drm_connector *connector)
> > > > +static void intel_dp_oob_hotplug_event(struct drm_connector *connector, bool hpd_state)
> > > >  {
> > > >     struct intel_encoder *encoder = intel_attached_encoder(to_intel_connector(connector));
> > > >     struct drm_i915_private *i915 = to_i915(connector->dev);
> > > > +   bool need_work = false;
> > > >
> > > >     spin_lock_irq(&i915->irq_lock);
> > > > -   i915->hotplug.event_bits |= BIT(encoder->hpd_pin);
> > > > +   if (hpd_state != i915->hotplug.oob_hotplug_state) {
> > > > +           i915->hotplug.event_bits |= BIT(encoder->hpd_pin);
> > > > +
> > > > +           i915->hotplug.oob_hotplug_state = hpd_state;
> > > > +           need_work = true;
> > > > +   }
> > > >     spin_unlock_irq(&i915->irq_lock);
> > > > -   queue_delayed_work(system_wq, &i915->hotplug.hotplug_work, 0);
> > > > +
> > > > +   if (need_work)
> > > > +           queue_delayed_work(system_wq, &i915->hotplug.hotplug_work, 0);
> > > >  }
> > > >
> > > >  static const struct drm_connector_funcs intel_dp_connector_funcs = {
> > > > diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> > > > index 8c1706fd81f9..543ebf1cfcf4 100644
> > > > --- a/drivers/gpu/drm/i915/i915_drv.h
> > > > +++ b/drivers/gpu/drm/i915/i915_drv.h
> > > > @@ -149,6 +149,9 @@ struct i915_hotplug {
> > > >     /* Whether or not to count short HPD IRQs in HPD storms */
> > > >     u8 hpd_short_storm_enabled;
> > > >
> > > > +   /* Last state reported by oob_hotplug_event */
> > > > +   bool oob_hotplug_state;
> > > > +
> > > >     /*
> > > >      * if we get a HPD irq from DP and a HPD irq from non-DP
> > > >      * the non-DP HPD could block the workqueue on a mode config
> > > > diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
> > > > index c1d8c23baa39..a4596be4d34a 100644
> > > > --- a/drivers/usb/typec/altmodes/displayport.c
> > > > +++ b/drivers/usb/typec/altmodes/displayport.c
> > > > @@ -59,7 +59,6 @@ struct dp_altmode {
> > > >     struct typec_displayport_data data;
> > > >
> > > >     enum dp_state state;
> > > > -   bool hpd;
> > > >
> > > >     struct mutex lock; /* device lock */
> > > >     struct work_struct work;
> > > > @@ -143,10 +142,7 @@ static int dp_altmode_status_update(struct dp_altmode *dp)
> > > >             if (!ret)
> > > >                     dp->state = DP_STATE_CONFIGURE;
> > > >     } else {
> > > > -           if (dp->hpd != hpd) {
> > > > -                   drm_connector_oob_hotplug_event(dp->connector_fwnode);
> > > > -                   dp->hpd = hpd;
> > > > -           }
> > > > +           drm_connector_oob_hotplug_event(dp->connector_fwnode, hpd);
> > > >     }
> > > >
> > > >     return ret;
> > > > @@ -573,8 +569,7 @@ void dp_altmode_remove(struct typec_altmode *alt)
> > > >     cancel_work_sync(&dp->work);
> > > >
> > > >     if (dp->connector_fwnode) {
> > > > -           if (dp->hpd)
> > > > -                   drm_connector_oob_hotplug_event(dp->connector_fwnode);
> > > > +           drm_connector_oob_hotplug_event(dp->connector_fwnode, false);
> > >
> > > See, what does "false" here mean?
> > >
> > > Name the function for what it does, do not have random flags as
> > > parameters, that makes it impossible to understand what the code is
> > > doing when you are reading it, without having to jump around and figure
> > > out what the flags are saying.
> > >
> > > And here they just don't even seem to be right :(
> > >
> >
> > Both the old and new code will signal to the DRM driver that the cable
> > was removed, the change is that we're carrying the level in the call
> > rather than just indicating that the state has changed.
> >
> > We could introduce some HPD_HIGH/HPD_LOW defines to make it easier to
> > read. But the various places I'm looking at just represented the hpd
> > state as a bool.
> >
> > Regards,
> > Bjorn
> 
> 
> 
> -- 
> With best wishes
> Dmitry
