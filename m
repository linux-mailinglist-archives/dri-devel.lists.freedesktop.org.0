Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D00DD4F0625
	for <lists+dri-devel@lfdr.de>; Sat,  2 Apr 2022 22:26:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5793410E11F;
	Sat,  2 Apr 2022 20:26:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [IPv6:2607:f8b0:4864:20::f35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3405710E11F
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Apr 2022 20:26:35 +0000 (UTC)
Received: by mail-qv1-xf35.google.com with SMTP id f3so4573034qvz.10
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Apr 2022 13:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QB0eo72y6FVZ0oU4JIps4fOnMAO+oClDWy1YjIZjL/c=;
 b=WsjkuDwwoa3g9mvKJsL+Y+5IhFD3xsQFVDkNUAS3Mzmr/ZWiDeLtX6UdpE5KCpPAkU
 4DYT/K9KCCotzJ6zlWueDyGuQXB68VflTcz212Ml55fDJYI+Jn7XFwfnxiXCrUr5xZ2B
 yVwU+edqQJ1OkNakKYD+55rEMoNOl15O0DluBw7AgLSZ3ABcDzs48xYfRVTTeHIqPOhb
 S9pl6SmynSKzB4zo3/xu9Puf6lk6lja5bR9vMXBQQKYyqiBJAFInLhgZLZXEnaDFxXr+
 ZtpdliCY5R9nlEndcV3coBblNz9gs7fbixEw9JuNVFMHtHxipiW40TTbzpcGXCOr+BRr
 dBAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QB0eo72y6FVZ0oU4JIps4fOnMAO+oClDWy1YjIZjL/c=;
 b=FdJDRrim5LGmScU+wPkoyJSy6kVYi0uByKOcxoA6/GvoZjtIRS5Tl4dWiX4rEQi+1V
 iM+MLNOXJoIgxqxtex1Lss7+qveAZRuJ577pC65+nnkJyQPib+0hOhZzcdjdZZmqwjYz
 DKyF41/QZHA+jtqfFcaNQzR6hc/H45cLOkxpza0jnOaeLMq/QmdW9Xlff+/MPP6VDTU7
 NowebHqSc4g/HDlxiC248BiZt70Qkhp8HyAT6z1LqPSpJTT5zCZse7iabIxMGApTRPaL
 qJtBw8HRVX0hdz7K1GPJ9plkuJzesLQa0fPNyBwHjql6KYyWJ2Rm5NeKcQgsycK9bG7B
 Vq+w==
X-Gm-Message-State: AOAM530/Ov7FuF446MDPRzTjj0eTbGgh73ESMAh2O94GLRBDjtzqRKbn
 tHgTgbriEEaW95LcYBLAl7LHsLNu0WNIfqvR+fDY+Q==
X-Google-Smtp-Source: ABdhPJyOclbx6ZxnfFkNqKq1SFZp9RuXDLSvl9rQ8srJRugzrvyKznh3ayrfvwqMdnFoa8uizhMrAJf2kev/oVHQDZs=
X-Received: by 2002:a05:6214:921:b0:443:ce3d:577b with SMTP id
 dk1-20020a056214092100b00443ce3d577bmr1502390qvb.122.1648931194181; Sat, 02
 Apr 2022 13:26:34 -0700 (PDT)
MIME-Version: 1.0
References: <1648656179-10347-1-git-send-email-quic_sbillaka@quicinc.com>
 <1648656179-10347-2-git-send-email-quic_sbillaka@quicinc.com>
 <CAD=FV=X+QvjwoT2zGP82KW4kD0oMUY6ZgCizSikNX_Uj8dNDqA@mail.gmail.com>
 <392b933f-760c-3c81-1040-c514045df3da@linaro.org>
 <CAD=FV=W4PYK-t607yjRbfjDjjEZX0KdgHDRukw_vSH8E8EDH6w@mail.gmail.com>
In-Reply-To: <CAD=FV=W4PYK-t607yjRbfjDjjEZX0KdgHDRukw_vSH8E8EDH6w@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 2 Apr 2022 23:26:22 +0300
Message-ID: <CAA8EJppt9XONbgtKfmHmN+==QNqiVJeb8GKJFdZm=yyY-tgmHQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/8] drm/msm/dp: Add eDP support via aux_bus
To: Doug Anderson <dianders@chromium.org>
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
Cc: quic_kalyant <quic_kalyant@quicinc.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 quic_vproddut <quic_vproddut@quicinc.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 Sean Paul <seanpaul@chromium.org>, quic_aravindh@quicinc.com,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 2 Apr 2022 at 20:06, Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Sat, Apr 2, 2022 at 3:37 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On 01/04/2022 02:22, Doug Anderson wrote:
> > > Hi,
> > >
> > > On Wed, Mar 30, 2022 at 9:03 AM Sankeerth Billakanti
> > > <quic_sbillaka@quicinc.com> wrote:
> > >>
> > >> @@ -1547,6 +1593,10 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
> > >>
> > >>          dp_display->encoder = encoder;
> > >>
> > >> +       ret = dp_display_get_next_bridge(dp_display);
> > >> +       if (ret)
> > >> +               return ret;
> > >
> > > It feels weird to me that this is in a function called "modeset_init",
> > > though I certainly don't know the structure of the MSM display code
> > > well enough to fully comment.
> >
> > It's called modeset_init() as it initializes KMS objects used by DP
> > driver. We have similar functions for dsi and hdmi
>
> Sorry, I wasn't meaning to imply that modeset_init() was a bad name or
> anything. Mostly saying that I wasn't sure that modeset init was the
> proper time to populate the aux bus. ...but then again, perhaps it is
> given the current structure of this driver?
>
>
> > > My expectation would have been that
> > > devm_of_dp_aux_populate_ep_devices() would have been called from your
> > > probe routine and then you would have returned -EPROBE_DEFER from your
> > > probe if you were unable to find the panel afterwards.
> >
> > I don't think it's possible to call it from probe() since
> > drm_dp_aux_register() is called only from dp_display_bind().
> > The PHY also isn't initialized at that moment, so we can not probe AUX
> > devices.
> >
> > The overall semantics of the AUX bus is not clear to me.
> > Typically the bus is populated (and probed) when devices are accessible.
> > But for the display related buses this might not be the case.
>
> In general the AUX bus is modeled much like the i2c bus. You probe the
> sub-device when you're able to transfer. Then you can confirm that the
> device is actually there and init the device.
>
>
> > For example for the DSI bus we clearly define that DSI transfer are not
> > possible before the corresponding bridge's (or panel's) enable call.
> >
> > Maybe the same approach should be adopted for the AUX bus. This would
> > allow us to populate the AUX bus before hardware access is actually
> > possible, thus creating all the DRM bridges before the hardware is
> > actually up and running.
>
> So I guess what you're proposing is that you could probe the devices
> under the AUX bus and they could acquire resources (and possibly
> return EPROBE_DEFER) at a point in time _before_ it's actually
> possible to transfer. Then I guess you'd later do the transfer?

Exactly.

>
> I guess conceivably one could re-design the DRM subsystem like that,
> but I don't think it's trivial.

The problem is that the DRM subsystem is already designed like that.
All the bridge chains are static. They are created during the device
probe. And the modes are populated later (via the get_modes()
callback), after the HPD signal is delivered.
For the encoder/bridge chains it is explicitly stated that the display
pipe (clocks and timing signals) are not running before bridge's
enable() callback or after the disable() callback being called.

> Why? I believe that we need to know
> things about the panel at probe time. For instance, we need to be able
> to populate the panel's modes.

As I said, panel modes are not needed at the probe time. The fact that
most (if not all) of the panel drivers provide them in the platform
data (and thus modes are typically populated at the probe time) comes
from the fact that the panel is usually a known static piece of
hardware. With the generic edp-panel this is no longer the case. A
single device handles a (probed) variety of panels.

Compare it with the generic monitor:
We have a known bridge (display-connector.c), so the driver can build
the display chain. However a set of modes is not known till the actual
monitor is plugged into the device.

> To get this information we need the
> EDID which means we need to be able to do a transfer. If we're using
> an AUX backlight we also need to add info about the backlight at probe
> time and that also needs the transfer to work.

Yes, the backlight is the problem in the suggested design. I'm not
sure when panel->backlight has to  be populated for things to work.
If we can set it after the probe but before calling into
mode_set/drm_bridge_chain_enable(), then it should be fine.

> So I guess the net result is maybe we should just keep it where it is.
> Long term I'd be interested in knowing if there's a reason why we
> can't structure the driver so that AUX transfers can happen with less
> intertwining with the rest of the code, but that can happen later. I
> would expect that you'd basically just need clocks and regulators on
> and maybe your PHY on. Ideally with some pm_runtime fun we should be
> able to do that independently with anything else the driver needs to
> do?

Not really. The driver is shared between the DP and eDP. And the DP
(well, combo DP+USB-C) part has quite logical expectations that e.g.
AUX channel is not up until all negotiations about the USB-C altmodes
are done and the HPD event is delivered. This is the source for my
suggestion regarding AUX bus rework/redesign. For non-eDP cases the
connected device becomes known much later than the dp_parser code runs
(and much later than all the bridges are to be instantiated).

Another option would be to keep common drm/msm/dp core code and split
the actual driver code into two distinct code paths: one supporting
DP, another one supporting eDP. I think, up to now we were trying hard
to stay away from such a split.

-- 
With best wishes
Dmitry
