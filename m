Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55429502FF1
	for <lists+dri-devel@lfdr.de>; Fri, 15 Apr 2022 23:13:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 338CE10E151;
	Fri, 15 Apr 2022 21:13:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E57BB10E117
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Apr 2022 21:13:22 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id bv19so17143487ejb.6
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Apr 2022 14:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=difZoTs3fizyF97rw8HbvX7weZ7x4PWWMkxfgOaZlYs=;
 b=Tpwq/EjVcuEvXK/fee2skALLMAOp1mL5FMbMNqXPTvClywQDtncZ78ZfZ6H6q9m/QY
 lOIu0EXSvexsZUOWHp2Os8EvOY/2Ve2PXNejVC5VGYCqtw6L1itBpLwvIZH9m33gesdI
 qum/ECx3fjJUF+MV40PAVZIjzPSHmIo8MTCaU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=difZoTs3fizyF97rw8HbvX7weZ7x4PWWMkxfgOaZlYs=;
 b=f/KHS62T3aqLE0f9Oe47v4StJhLnEtf2UOXZYsSrKnxGX6LmRoI+hDK8ruHJYixH90
 D7BxhyLRYusvHQxYQ2hPVzDx3LNyr6yYlbXVpq77rC58IxDBc6wo0bii85tmVYaMQwYE
 VWiOWP2g95w7hO02A42QnlyTptThhjKdpr/XN3nr71+MkriPibnfL7PrDKIQbvTpbjWU
 q9gWCb18fte39FypB/oWEdVbwEh7p4UHXfofPAzyziulvqojreS1Hx9LAcsR5wtbqYZi
 62UgbUx0qkfVbN06yl/24+9lJ8UJ8fJBXr/6YeKlPVpSqwoU70Cgy3G4NhiZ8cezPjkx
 V5hg==
X-Gm-Message-State: AOAM532imDMNges5R0FLk+9FhJX4YFy+b3oYe8Cl46tDMCkeiOth5OCH
 j10/wk6Y+C2EDtFGqoV3s/x6Y96q9oVssQ==
X-Google-Smtp-Source: ABdhPJyou1rsxhDRvcr97R5/5cXoe93o/spCYp7wv8n0ec0WcL1m0Ut6KwZHMRl8F7NDAiIWurpipA==
X-Received: by 2002:a17:907:7f08:b0:6e8:b005:5f4e with SMTP id
 qf8-20020a1709077f0800b006e8b0055f4emr668395ejc.177.1650057200969; 
 Fri, 15 Apr 2022 14:13:20 -0700 (PDT)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com.
 [209.85.221.51]) by smtp.gmail.com with ESMTPSA id
 fy29-20020a1709069f1d00b006e8d248fc2csm1938061ejc.108.2022.04.15.14.13.19
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Apr 2022 14:13:19 -0700 (PDT)
Received: by mail-wr1-f51.google.com with SMTP id q3so11241644wrj.7
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Apr 2022 14:13:19 -0700 (PDT)
X-Received: by 2002:a5d:4d0e:0:b0:207:a329:24fa with SMTP id
 z14-20020a5d4d0e000000b00207a32924famr583305wrt.342.1650057198545; Fri, 15
 Apr 2022 14:13:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220409023628.2104952-1-dianders@chromium.org>
 <20220408193536.RFC.1.I4182ae27e00792842cb86f1433990a0ef9c0a073@changeid>
 <CAE-0n53vDRdndb7=ShovrJV0P1CvV0JgV6JTNQNMr-KWtyg8Jg@mail.gmail.com>
In-Reply-To: <CAE-0n53vDRdndb7=ShovrJV0P1CvV0JgV6JTNQNMr-KWtyg8Jg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 15 Apr 2022 14:13:05 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V3bQGy1ho_WJZ1oOVwJhADvTPJ8uUyOG63_LzWcd7Scg@mail.gmail.com>
Message-ID: <CAD=FV=V3bQGy1ho_WJZ1oOVwJhADvTPJ8uUyOG63_LzWcd7Scg@mail.gmail.com>
Subject: Re: [RFC PATCH 1/6] drm/dp: Helpers to make it easier for drivers to
 use DP AUX bus properly
To: Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Philip Chen <philipchen@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Robert Foss <robert.foss@linaro.org>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Apr 14, 2022 at 4:52 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Douglas Anderson (2022-04-08 19:36:23)
> > As talked about in the kerneldoc for "struct dp_aux_ep_client" in this
> > patch and also in the past in commit a1e3667a9835 ("drm/bridge:
> > ti-sn65dsi86: Promote the AUX channel to its own sub-dev"), to use the
> > DP AUX bus properly we really need two "struct device"s. One "struct
> > device" is in charge of providing the DP AUX bus and the other is
> > where we'll try to get a reference to the newly probed endpoint
> > devices.
> >
> > In ti-sn65dsi86 this wasn't too difficult to accomplish. That driver
> > is already broken up into several "struct devices" anyway because it
> > also provides a PWM and some GPIOs. Adding one more wasn't that
> > difficult / ugly.
> >
> > When I tried to do the same solution in parade-ps8640, it felt like I
> > was copying too much boilerplate code. I made the realization that I
> > didn't _really_ need a separate "driver" for each person that wanted
> > to do the same thing. By putting all the "driver" related code in a
> > common place then we could save a bit of hassle. This change
> > effectively adds a new "ep_client" driver that can be used by
> > anyone. The devices instantiated by this driver will just call through
> > to the probe/remove/shutdown calls provided.
> >
> > At the moment, the "ep_client" driver is backed by the Linux auxiliary
> > bus (unfortunate naming--this has nothing to do with DP AUX). I didn't
> > want to expose this to clients, though, so as far as clients are
> > concerned they get a vanilla "struct device".
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
>
> Is it correct that the struct dp_aux_ep_client is largely equivalent to
> a struct dp_aux_ep_device? What's the difference? I think it is a fully
> probed dp_aux_ep_device? Or a way to tell the driver that calls
> of_dp_aux_populate_ep_devices() that the endpoint has probed now?

They're not the same. The "DP AUX Endpoint Device" is essentially the
panel, though at one point in time someone argued that conceivably one
could put other devices on it even though this might be a really bad
idea. At some point in the discussion someone mentioned the concept of
a touchscreen running over DP Aux had been discussed and, indeed, "dp
aux touchscreen" gets hits if you search for it. The idea that it
could be something different is one reason why I refrained from
calling it a panel in all the function names and always tried to call
it a "DP AUX Endpoint".

The "DP AUX Endpoint Device Client" is the client of the panel, or the
code that needs to get a reference to the panel. Logically, I guess
this is the part of the eDP controller that's responsible for shoving
bits to the panel. Essentially the drm_bridge. Most importantly, it's
_not_ the part of the eDP controller providing the AUX bus.


> I read the commit text but it didn't click until I read the next patch
> that this is solving a probe ordering/loop problem. The driver that
> creates the 'struct drm_dp_aux' and populates devices on the DP aux bus
> with of_dp_aux_populate_ep_devices() wants to be sure that the
> drm_bridge made by the 'struct dp_aux_ep_driver' probe routine in
> edp-panel is going to be there before calling drm_of_get_bridge().
>
>         of_dp_aux_populate_ep_devices();
>         [No idea if the bridge is registered yet]
>         drm_of_get_bridge();
>
> The solution is to retry the drm_of_get_bridge() until 'struct
> dp_aux_ep_driver' probes and registers the next bridge. It looks like a
> wait_for_completion() on top of drm_of_get_bridge() implemented through
> driver probe and -EPROBE_DEFER; no disrespect!

Yes, that's exactly what it is.


> Is there another problem here that the driver that creates the 'struct
> drm_dp_aux' and populates devices on the DP aux bus with
> of_dp_aux_populate_ep_devices() wants to use that same 'struct
> drm_dp_aux' directly to poke at some 'struct dp_aux_ep_device' that was
> populated? And the 'struct dp_aux_ep_device' may either not be probed
> and bound to a 'struct dp_aux_ep_driver' or it may not be powered on
> because it went to runtime PM suspend?
>
> Put another way, I worry that the owner of 'struct drm_dp_aux' wants to
> use some function in include/drm/dp/drm_dp_helper.h that takes the
> 'struct drm_dp_aux' directly without considering the device model state
> of the endpoint device (the 'struct dp_aux_ep_device'). That would be a
> similar problem as waiting for the endpoint to be powered on and probed.
> Solving that through a sub-driver feels awkward.
>
> What if we had some function like drm_dp_get_aux_ep() that took a
> 'struct drm_dp_aux' and looked for the endpoint device (there can only
> be one?),

The code is designed to handle the fact that there could be more than
one AUX endpoint device. I don't know if this will ever happen but it
is plausible. The "touchscreen over DP AUX", if that ever became a
thing supported in Linux, could be an example. In some sense, I guess
we could have modeled the AUX backlight for homestar this way as a
second "DP AUX Endpoint", though we didn't...


> waited for it to be probed,

The $1M question: where should it be doing the waiting? Are you
imagining this straight in my probe? AKA:

def ps8640_probe(...):
  ...
  devm_of_dp_aux_populate_ep_devices(...);
  do_the_wait(...);
  bridge = devm_drm_of_get_bridge(...);
  if (bridge == -EPROBE_DEFER)
    return -EPROBE_DEFER;
  ...

Essentially, if the panel is probing asynchronously then this would
wait for it. If the panel instead needs some resources then it should
be fine for us to just pass the -EPROBE_DEFER up and we'll both try
probing again later. That definitely feels simpler to me and matches
how I would wish things to work.

There are two problems:

1. I'm not sure how to wait. Early in ps8640 support I had Philip try
wait_for_device_probe(). That wasn't so happy. I suppose I could try
to come up with some solution if this is indeed the way we want to go.

2. The way probing currently works, if we end up in the -EPROBE_DEFER
case then we end up with an infinite loop. :( As I understand it, the
basic rule is that if your probe causes any additional devices to be
created (like by calling devm_of_dp_aux_populate_ep_devices()) then
your probe isn't allowed to return -EPROBE_DEFER after the call. This
is the same problem that the main msm used to have (Dmitry says it's
fixed now). I think this is just a fundamental design issue with
deferred probing. Anytime a device probes then it causes
driver_deferred_probe_trigger() to run again. So we basically have:

a) ps8640 probe returns -EPROBE_DEFER for whatever reason.
b) some device in the system probes and all deferred probes are retriggered.
c) ps8640 gets pulled off the list by the worker
d) ps8640 probe gets called
e) ps8640 creates a sub device for the panel, which triggers deferred probing
f) ps8640 returns and gets put on the deferred list
g) goto step c)

On first instinct, you might think this is easy to solve. Maybe
somehow you could make it so the "trigger" doesn't re-trigger the
ps8640 since it hasn't actually _returned_ from probing yet. The
problem is that I believe there'd be a race in the async probe case.
See the description for driver_deferred_probe_trigger() for some
details.


What we _could_ do is that we could re-create deferred probing
ourselves. :-P So instead of creating a sub-device, I could kick off
some type of asynchronous task that would periodically run and look to
see if the panel has shown up. Then, once the panel shows up then I
could create the bridge. I'm not really convinced that this is better,
though.


> and then powered it up via some
> pm_runtime_get_sync()? My understanding is that with edp-panel we have
> two power "domains" of importance, the panel power domain and the DP/eDP
> power domain. Access to the AUX bus via 'struct drm_dp_aux' needs both
> power domains to be powered on. If the 'struct dp_aux_ep_device' is in
> hand, then both power domains can be powered on by making sure the power
> state of the 'struct dp_aux_ep_device::dev' is enabled. If only the
> 'struct drm_dp_aux' is in hand then we'll need to do something more like
> find the child device and power it on.

So right now it doesn't work that way. The whole thing is structured
more like an i2c bus. The i2c bus doesn't power its devices on. The
devices are in charge of powering themselves on. If the i2c bus itself
has a low power state that it can be in when the devices don't need to
communicate then that's fine. It can power itself on whenever the
devices need to communicate. If this is a high-cost thing then the bus
can use pm_runtime. Following this model is what leads us to the panel
being in charge of reading the EDID.


> Could the 'struct drm_dp_aux' functions in drm_dp_helper.h do this
> automatically somehow? Maybe we can drop a variable in 'struct
> drm_dp_aux' when of_dp_aux_populate_ep_devices() is called that the
> other side may not be powered up. Then if something tries to transfer on
> that aux channel it powers on all children of 'struct drm_dp_aux::dev'
> that are on the 'dp_aux_bus_type' or bails out if those devices haven't
> probed yet or can't be powered on.

We can have more discussions about powering and who's in charge of
powering who if we need to, but it's not really what this series is
about. Here we're worried about making sure that we acquire all of our
resources before we create the drm_bridge. Said another way: we're
trying to acquire a handle to the panel before we add the bridge
because once we add the bridge we're asserting that we're all ready to
go and start using things, right? So we basically just want to make
sure that the panel is present and able to acquire all of _its_
resources.



-Doug
