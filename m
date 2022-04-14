Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7FE501DB6
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 23:51:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6751010E22B;
	Thu, 14 Apr 2022 21:51:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 094C910E22B
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Apr 2022 21:51:32 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id b15so7985341edn.4
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Apr 2022 14:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IWv2Ppbp50uTzsTbYA0OggS+HfcMIlPvUJ7mUKY3HEI=;
 b=jpVPYefQu+vId/3f5egszIn+HK5nNmft6hktSoVVoMwB7NsgD6J+XSQn5+0NH/VWpy
 VXjCbtOuADG+DrniheywOPAuqHUYmIbMlmpQM4SZTG2ymrScPAO9N3TVG4g4LXgCf37m
 1z3OH2jWXmMbPBBx9Yi2sjclyIwaE72EoZKY4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IWv2Ppbp50uTzsTbYA0OggS+HfcMIlPvUJ7mUKY3HEI=;
 b=NT3m682RVIEIFb5faSWIOgVR8W8HTZT2MIs7yi8/zfelBYQPTlS2pL1s6MAxue3ZZ0
 gB2KlzHVnjgmj7++ThhQEd68tBaBn+mxdB6XVTA+1SgVe+AINJuU5cUC5C4kwHRdCSxx
 Vs+QRN7PYDKaeMCr4bOEhp7g4LwwCqopdWsGPfWuoU3SRK+/6h8m8OaGXi6U3pLXuk+w
 G+20VCkrc2XFB5KxF3iW+0N3xVmuhewnaFhJoN3D9u1gzNIWnGaqlThocwvKISYZSM3G
 12DCJdS7XYmd14iUvSe3+yc/rt9fkjhQsNA0P9Bvi9RDdb7NWeiQbczGRedxQ6OMaQ8S
 iD/Q==
X-Gm-Message-State: AOAM532pg9OGopwrIz79ucJ8hTTHw9K/dqk9BdoHvCmIDqlhmWGmrqfU
 KUL3DXzw2fTixg6qW2Y8ZlrfCqZ0Wqjgf554Yl0=
X-Google-Smtp-Source: ABdhPJxgM84ftxbOvdgcZS9JDIbXS/9T20PMRZSvSFolUrfbkX8WLDgQKDLXfJWy2AbTFimcZoUPIw==
X-Received: by 2002:a05:6402:516e:b0:41d:79f1:ff43 with SMTP id
 d14-20020a056402516e00b0041d79f1ff43mr5256473ede.141.1649973090221; 
 Thu, 14 Apr 2022 14:51:30 -0700 (PDT)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com.
 [209.85.128.51]) by smtp.gmail.com with ESMTPSA id
 vr7-20020a170906bfe700b006e8325fe130sm1043040ejb.31.2022.04.14.14.51.28
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Apr 2022 14:51:28 -0700 (PDT)
Received: by mail-wm1-f51.google.com with SMTP id
 l62-20020a1c2541000000b0038e4570af2fso4038478wml.5
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Apr 2022 14:51:28 -0700 (PDT)
X-Received: by 2002:a05:600c:4f10:b0:38c:ae36:d305 with SMTP id
 l16-20020a05600c4f1000b0038cae36d305mr499148wmq.34.1649973087758; Thu, 14 Apr
 2022 14:51:27 -0700 (PDT)
MIME-Version: 1.0
References: <1649938766-6768-1-git-send-email-quic_sbillaka@quicinc.com>
 <1649938766-6768-2-git-send-email-quic_sbillaka@quicinc.com>
 <CAD=FV=Wmiv2WGhFCLYmXbWESNOh5FfobjNme85aU6YtN1SLVDA@mail.gmail.com>
 <81c3a9fb-4c92-6969-c715-ca085322f9c6@linaro.org>
 <CAE-0n50obe_aqzwQY-X1yH4emjjOErOJ_wj9sQe=HoWEZ3vjTw@mail.gmail.com>
 <CAD=FV=U4qtst5q--_1794Pdjsc7b_JMRAh+X_vr-9qJx5NtOrw@mail.gmail.com>
 <56453228-d4b2-c7e4-7b72-6de8637f2def@linaro.org>
In-Reply-To: <56453228-d4b2-c7e4-7b72-6de8637f2def@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 14 Apr 2022 14:51:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XjVb7tP4acjOQgg2_8oCbOxqTopJE1PUKdf2noQCHg=Q@mail.gmail.com>
Message-ID: <CAD=FV=XjVb7tP4acjOQgg2_8oCbOxqTopJE1PUKdf2noQCHg=Q@mail.gmail.com>
Subject: Re: [PATCH v7 1/4] drm/msm/dp: Add eDP support via aux_bus
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 quic_vproddut <quic_vproddut@quicinc.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 Sean Paul <seanpaul@chromium.org>, Steev Klimaszewski <steev@kali.org>,
 Aravind Venkateswaran <quic_aravindh@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Apr 14, 2022 at 2:16 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> > Hmm, interesting. Probably for DRM_BRIDGE_OP_MODES that will work?
> > It's definitely worth confirming but from my reading of the code it
> > _probably_ wouldn't hurt.
> >
> > One thing someone would want to confirm would be what would happen if
> > we move this code and the panel code to implement DRM_BRIDGE_OP_EDID
> > properly. It looks as if both actually ought to be implementing that
> > instead of DRM_BRIDGE_OP_MODES, at least in some cases. A fix for a
> > future day. Could we get into trouble if one moved before the other?
> > Then the panel would no longer override the eDP controller and the eDP
> > controller would try to read from a possibly unpowered panel?
>
> That would depend on the way the get_edid would be implemented in DP
> driver. Currently the edid is cached via the
> dp_display_process_hpd_high() -> dp_panel_read_sink_caps() call chain.
>
> With this patchset, the dp_hpd_plug_handle() ->
> dp_display_usbpd_configure_cb() -> dp_display_process_hpd_high() will be
> called too late for the get_modes/get_edid (from dp_bridge's enable() op).
>
> There is another issue. drm_panel has only get_modes() callback, so
> panel_bridge can not implement get_edid() unless we extend the panel
> interface (which might be a good idea).

Ah, that makes sense and explains why the current panel code does the
EDID reading in its get_modes() function even though get_modes() is
_documented_ that it doesn't read the EDID. ;-) I guess it's another
of the "let's move some people over to the new way but we'll keep the
old code working". Definitely makes it hard to understand at times.


> > For hotplug/detect I'm even less confident that setting the bits would
> > be harmless. I haven't sat down and traced everything, but from what I
> > can see the panel _doesn't_ set these bits, does it? I believe that
> > the rule is that when every bridge in the chain _doesn't_ implement
> > detect/hotplug that the panel is always present. The moment someone
> > says "hey, I can detect" then it suddenly becomes _not_ always
> > present. Yes, I guess we could have the panel implement "detect" and
> > return true, but I'm not convinced that's actually better...
>
> I think it makes sense to implement OP_DETECT in panel bridge (that
> always returns connector_status_connected) at least to override the
> possible detect ops in previous bridges.

So I truly don't know the right answer, but are you sure that's the
best design? I _think_ that panel_bridge is used for all kinds of
panels, right? So what if there's some type of display that uses a
panel but there's still a mechanism that supports physical detection
of the panel? By implementing "detect" in the generic panel_bridge
then you're _preventing_ anyone higher up in the chain from
implementing it and you're forcing it to be "always connected".

For instance, we could come up with a new display standard called
"pluggable eDP" that is just like eDP except that you can physically
detect it. This imaginary new display standard is different from DP
because it has eDP power sequencing (fully powers the display off when
the screen is off) but it's hot pluggable! It introduces a new pin
that goes to the DP controller called RT-HPD for "really, truly hot
plug detect" that works even when the panel is off. The existing "HPD"
pin continues to mean that the panel is read to communicate. If the
drm_panel hardcodes "always connected" then I can't implement my
"pluggable eDP" system, right? However, if we leave it just like it is
today then my new system would be easy to implement. ;-)

The above example is obviously not truly a real one but I guess my
point is that I find it more intuitive / useful to say that we should
only implement "detect" if we truly think we can detect and that if
nobody says they can detect then we must be always connected.

As an aside; I think in general it's not always easy to fit every
possible graphics system into these "bridge chains" and the simple
sequence of pre-enable, enable, etc, so we have to do our best and
accept the fact that sometimes we'll need special cases. Dave
Stephenson's patches [1] should tell us that, at least.

[1] https://lore.kernel.org/all/cover.1646406653.git.dave.stevenson@raspberrypi.com/


-Doug
