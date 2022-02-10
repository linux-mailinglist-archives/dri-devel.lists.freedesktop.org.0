Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 762B44B1833
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 23:32:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B332E10E96F;
	Thu, 10 Feb 2022 22:32:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FA0A10E976
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Feb 2022 22:32:17 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 l43-20020a9d1cab000000b005aa50ff5869so4824951ota.0
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Feb 2022 14:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=JrHddR19ZD1tkokZWOCBaXxsomwE9JN1w01NkG4YDyU=;
 b=AOxrl24mI7dYWR6YtN6FZh7Gl8Pj9u1/oljFksQs78r7CJZJVslHGJgUXkU3T118zO
 5MabSKCGeA7XPcl6ZBXZ+ckDl4624CJhaTRZIvaYdMPWDswR7kRx2BnBROovCkRS5KAb
 v/dNvZSkxZ4eOyeO8ieSlwckmJ6DsV2Mu0bqephhV80yiUd6PiAibe/CXd0OUMBlSJXl
 fW0se2KH0qWF/80+Qhj3bCRSE2mHsyNIUsnlRC3kFbXUCRtMo/svqx2QM8V09K1Th68f
 qgJgmdXGbHyRfqqNF6jgkASk6+VHUf9/+aNcb/aceiaWgrrgUtF4wgFrBn6OXZl9Ohpv
 Tedw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JrHddR19ZD1tkokZWOCBaXxsomwE9JN1w01NkG4YDyU=;
 b=GQmziTvd6o1HanGxwjBooiVcOfjj1JwAAdjRox9KLQIwotDmtgS4FcBmiSQBD8LMlU
 zXEODZ7WGhA2qvvdfaV3pbr4E0GOHAy7AmKQVzqA0/mg9ug9UvchPv5m/lMT3ZV5s7x7
 hCTsoRi0VPa8rwZzn2LLd9R2tfI+c4CwFSmRiSzr+9V7QQIgj24ksCyZttl7Djb+5XsA
 xuSoO+EYstMNDr6Fm1aT3UQcfnxcEq0/0kPGtIIrgKVu6/asrbdDO+KKN/olbP33eIKC
 ZipnSsf8UQvPS+at+J1OfIwjMhl6pSElJL9OOuScY2ZR/Mx/JviOpIXqyHEmgO9LSHlG
 nlIg==
X-Gm-Message-State: AOAM530e3jqc9x4F9qNhGTDP57Iw/S0exXhZYUbSoU7zg4uQf5sbw1UI
 gO54EgsimgprUZI2tm+/T/71Mg==
X-Google-Smtp-Source: ABdhPJxJ7/q4RbdB3oTSoXedG6ikpzgyv4pQn6CfOszGopvOcDpzuPeg37Y9NWvFxF93GL7eMhYPBg==
X-Received: by 2002:a05:6830:92a:: with SMTP id
 v42mr3756586ott.48.1644532336413; 
 Thu, 10 Feb 2022 14:32:16 -0800 (PST)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id 6sm8819888oig.29.2022.02.10.14.32.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 14:32:15 -0800 (PST)
Date: Thu, 10 Feb 2022 14:34:30 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 2/2] drm/msm/dp: Implement oob_hotplug_event()
Message-ID: <YgWS9iZ+1uJBd9Lj@ripper>
References: <20220208044328.588860-1-bjorn.andersson@linaro.org>
 <20220208044328.588860-2-bjorn.andersson@linaro.org>
 <YgIecy+W/lGzL6ac@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YgIecy+W/lGzL6ac@kroah.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>, linux-usb@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon 07 Feb 23:40 PST 2022, Greg Kroah-Hartman wrote:

> On Mon, Feb 07, 2022 at 08:43:28PM -0800, Bjorn Andersson wrote:
> > The Qualcomm DisplayPort driver contains traces of the necessary
> > plumbing to hook up USB HPD, in the form of the dp_hpd module and the
> > dp_usbpd_cb struct. Use this as basis for implementing the
> > oob_hotplug_event() callback, by amending the dp_hpd module with the
> > missing logic.
> > 
> > Overall the solution is similar to what's done downstream, but upstream
> > all the code to disect the HPD notification lives on the calling side of
> > drm_connector_oob_hotplug_event().
> > 
> > drm_connector_oob_hotplug_event() performs the lookup of the
> > drm_connector based on fwnode, hence the need to assign the fwnode in
> > dp_drm_connector_init().
> > 
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/dp/dp_display.c |  8 ++++++++
> >  drivers/gpu/drm/msm/dp/dp_display.h |  2 ++
> >  drivers/gpu/drm/msm/dp/dp_drm.c     | 10 ++++++++++
> >  drivers/gpu/drm/msm/dp/dp_hpd.c     | 19 +++++++++++++++++++
> >  drivers/gpu/drm/msm/dp/dp_hpd.h     |  4 ++++
> >  5 files changed, 43 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > index 7cc4d21f2091..124a2f794382 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > @@ -414,6 +414,13 @@ static int dp_display_usbpd_configure_cb(struct device *dev)
> >  	return dp_display_process_hpd_high(dp);
> >  }
> >  
> > +void dp_display_oob_hotplug_event(struct msm_dp *dp_display, bool hpd_state)
> > +{
> > +	struct dp_display_private *dp = container_of(dp_display, struct dp_display_private, dp_display);
> > +
> > +	dp->usbpd->oob_event(dp->usbpd, hpd_state);
> > +}
> > +
> >  static int dp_display_usbpd_disconnect_cb(struct device *dev)
> >  {
> >  	struct dp_display_private *dp = dev_get_dp_display_private(dev);
> > @@ -1251,6 +1258,7 @@ static int dp_display_probe(struct platform_device *pdev)
> >  	dp->pdev = pdev;
> >  	dp->name = "drm_dp";
> >  	dp->dp_display.connector_type = desc->connector_type;
> > +	dp->dp_display.dev = &pdev->dev;
> 
> You did not properly reference count this pointer you just saved.  What
> is to keep that pointer from going away without you knowing about it?
> 

The "dp" object only lives while &pdev->dev is alive, both logically and
as its devres allocated on &pdev-dev. So for this reference I don't see
that we should refcount it.

> And you already have a pointer to pdev, why save another one here?
> 

The Qualcomm DisplayPort driver has per-c-file private context structs
and "dp" is one such object. So I simply can't dereference it and get to
pdev from the other c-file in the same driver...

But I only need it in dp_drm.c to during initialization to get a
reference to the associated fwnode, so it seems that I can rework this
and pass the pointer as a parameter to dp_drm_connector_init().

That looks to be cleaner as well.

Thanks,
Bjorn
