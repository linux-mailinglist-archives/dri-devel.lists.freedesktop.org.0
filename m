Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5CB9ABAE3
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 03:15:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 223C710E22D;
	Wed, 23 Oct 2024 01:15:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Qy2qkXmo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBD9B10E22D
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 01:15:49 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id
 d75a77b69052e-46098928354so43950821cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 18:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1729646149; x=1730250949;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=MDV7eJC3+oDJ66+nOuejsfUlqPbzueqG4aQIpJGm5jM=;
 b=Qy2qkXmoMNZM4U3VcgEeLyiOfm101wQve/GCSnhjDuxHihwunwcT0P2PowAzxxKhZU
 1Zgvvm8lzTmV4c1pEE1qfTQ1Q0+/6Ue8rW+rVthRQUrkkuFt/MR4yvqma01FuEvpwow5
 Mxqfb1YStBD651b85yDu3+cWkEwiy8he2Q6WE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729646149; x=1730250949;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MDV7eJC3+oDJ66+nOuejsfUlqPbzueqG4aQIpJGm5jM=;
 b=wA8kZrVzOspxNn5m8okZGRWQK0nc1HciHzt2RoFXL/x9mrm5zwt3+6lhkcBUXlk+FL
 EotamgeM+44DoUNZy3Z/46o96Zo6o9Co2b3/4mHqwhqgZK/Aat3VHfPJ6+4xkzM0VWPv
 FTt3Fdd4skmYkRXetmp43umaVnX4XfOQfsPuHeibKWub8sYFKN3IjPfl+Bllpi4vEaIA
 rleMT+RMFdsjPok4IvsrvGeaYUugVBbNF9PezA/Apxmz5apLq6sXKzpjtDPZ/TIhrEU+
 wRGJFoHZ/D8QcXQKQLUWOrSyAd5M2F5ADL3XxrZxNi1gdf8LeG4tjejzRdeiHLDPGism
 jh9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUU/UFpHoz9Shs48p2g6yuKqqmQ/jCV1HPF4nPDXXctIA6uYiksUQNXEc111rXrX9hZr6O/qWb4rGQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxS3Lhgj1A2SPLslErR5sKWJVXuEdH/SnJospYKoTpIgyLi1zf1
 yAeafg4LpHAZ+ORudPV03veyxOWXSc7B3iqjE7VwmTXvFVmCQy1LnEi0Q4BRTryLJ+iHTA1nHXA
 WrFPFkkmM/S/v1o74dZxSUXJSNeqBW8aq2nuK
X-Google-Smtp-Source: AGHT+IFQcx+O120v4jMcosEsD7YDeJhO0LSJsSQbSB2xO/5x1KCa08838jsJtZu4dV5T3yuW9UjApkWi+Qx0emqLoqU=
X-Received: by 2002:ac8:7f54:0:b0:460:874f:f8bf with SMTP id
 d75a77b69052e-461146ce389mr10841271cf.34.1729646148785; Tue, 22 Oct 2024
 18:15:48 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 22 Oct 2024 18:15:48 -0700
MIME-Version: 1.0
In-Reply-To: <phdcjgqqpjpruxp7v2mw446q73xr3eg4wfgfbjw5tasgr2pgg2@77swbk47b2tg>
References: <20240901040658.157425-1-swboyd@chromium.org>
 <20240901040658.157425-16-swboyd@chromium.org>
 <phdcjgqqpjpruxp7v2mw446q73xr3eg4wfgfbjw5tasgr2pgg2@77swbk47b2tg>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 22 Oct 2024 18:15:47 -0700
Message-ID: <CAE-0n514QMaQC2yjKP8bZqyfbv6B3AQm=+NJ87vxo6NdYiL03A@mail.gmail.com>
Subject: Re: [PATCH v4 15/18] dt-bindings: usb: Add ports to
 google,cros-ec-typec for DP altmode
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
 patches@lists.linux.dev, devicetree@vger.kernel.org, 
 Douglas Anderson <dianders@chromium.org>, Pin-yen Lin <treapking@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Benson Leung <bleung@chromium.org>, 
 Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, 
 dri-devel@lists.freedesktop.org, Guenter Roeck <groeck@chromium.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lee Jones <lee@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Prashant Malani <pmalani@chromium.org>, 
 Robert Foss <rfoss@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Tzung-Bi Shih <tzungbi@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Ivan Orlov <ivan.orlov0322@gmail.com>, 
 linux-acpi@vger.kernel.org, linux-usb@vger.kernel.org, 
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2024-09-20 02:38:53)
> On Sat, Aug 31, 2024 at 09:06:53PM GMT, Stephen Boyd wrote:
>
> Based on our disccusions at LPC, here are several DT examples that seem
> sensible to implement this case and several related cases from other
> ChromeBooks.

(Apologies for getting back to this late. I've been brewing on this topic
for a month; only appropriate for Halloween.)

This is the Trogdor case, one DP controller with 2 lanes DP coming out
that is steered with an analog mux controlled by the EC:

>
> typec {
>         compatible = "google,cros-ec-typec";
>
>         port {
>                 typec_dp_in: endpoint {
>                         remote-endpoint = <&usb_1_qmp_phy_out_dp>;
>                 };
>         };
>
>         usb_c0: connector@0 {
>                 compatible = "usb-c-connector";
>                 reg = <0>;
>
>                 ports {
>                         port@0 {
>                                 reg = <0>;
>                                 usb_c0_hs_in: endpoint {
>                                         remote-endpoint = <&usb_hub_dfp1_hs>;
>                                 };
>                         };
>
>                         port@1 {
>                                 reg = <1>;
>                                 usb_c0_ss_in: endpoint {
>                                         remote-endpoint = <&usb_hub_dfp1_ss>;
>                                 };
>                         };
>                 };
>         };
>
>         usb_c1: connector@1 {
>                 compatible = "usb-c-connector";
>                 reg = <1>;
>
>                 ports {
>                         port@0 {
>                                 reg = <0>;
>                                 usb_c1_hs_in: endpoint {
>                                         remote-endpoint = <&usb_hub_dfp2_hs>;
>                                 };
>                         };
>
>                         port@1 {
>                                 reg = <1>;
>                                 usb_c1_ss_in: endpoint {
>                                         remote-endpoint = <&usb_hub_dfp2_ss>;
>                                 };
>                         };
>                 };
>         };
> };
>
> &usb_1_qmpphy {
>         ports {
>                 port@0 {
>                         endpoint@0 {
>                                 data-lanes = <0 1>;
>                                 // this might go to USB-3 hub
>                         };
>
>                         usb_1_qmp_phy_out_dp: endpoint@1 {
>                                 remote-endpoint = <&typec_dp_in>;
>                                 data-lanes = <2 3>;
>                         };
>                 }
>         };
> };
>
> -------

This is one Corsola case, one DP controller (IT6505) that's an external
bridge that has 4 lanes DP but only 2 lanes of DP are usable at a time
because 2 physical lanes are wired to one usb-c-connector while the
other 2 physical lanes are wired to the other usb-c-connector. I say
"one Corsola case" because there's also a DP bridge (ANX7625) on some
Corsola variants that only has two DP lanes with a crosspoint switch
that can send those DP lanes out of one of two pairs of lanes. The other
two lanes are for USB3 output data if the part is connected to USB3 on
the input side. I suspect this ANX7625 case can be described in the same
way as below with two output endpoints and data-lanes describing which
lanes are used for either DP endpoint.

>
> typec {
>         connector@0 {
>                 port@1 {
>                         endpoint@0 {
>                                 remtoe = <&usb_hub_0>;
>                         };
>
>                         endpoint@1 {
>                                 remote = <&dp_bridge_out_0>;
>                         };

(TL;DR: I think I have a plan with the last paragraph in this section, so
I'll hack on it for a bit to see what happens.)

I'm not thrilled about having two endpoints in the SuperSpeed port@1 to
hold both signals in the Corsola case but not the Trogdor case. The
problem is that there's only one DP endpoint on Trogdor and we can't
have two remote-endpoint properties in there pointing to either
usb-c-connector. But then on Corsola we have two DP endpoints and they
both can't go to one DP input node in the typec node's graph.

To harmonize this the typec graph can have one DP input endpoint on
Trogdor while the typec graph can have two DP input endpoints on
Corsola. In both cases, the typec graph would have two USB input
endpoints, and then we can connect output endpoints to each
usb-c-connector node. It would be similar to my existing binding in this
series, except now the typec DP port can have multiple input endpoints.

I understand from our discussions at LPC that I should use
drm_connector_oob_hotplug_event() from the displayport altmode driver
(drivers/usb/typec/altmodes/displayport.c) to tell the DP bridge like
ANX7625 or IT6505 which output endpoint should be displaying DP. I think
dp_altmode_probe() looks at the usb-c-connector node's parent, e.g.
typec in the examples above, for the drm_bridge. That means we'll need
to register a drm_bridge in the cros-ec-typec compatible node? Or we
need to use the 'displayport' property in cros-ec-typec to point at the
drm_bridge node?

Either way the problem seems to be that I need to associate one
drm_bridge with two displayport altmode drivers and pass some fwnode
handle to drm_connector_oob_hotplug_event() in a way that we can map
that back to the right output endpoint in the DP bridge graph. That
seems to imply that we need to pass the fwnode for the usb-c-connector
in addition to the fwnode for the drm_bridge, so that the drm_bridge
code can look at its DT graph and find the remote node connected.
Basically something like this:

  void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
                                       struct fwnode_handle
*usb_connector_fwnode,
                                       enum drm_connector_status status)

(We might as well also pass the number of lanes here)

Corsola could work with this design, but we'll need to teach
dp_altmode_probe() to look for the drm_bridge elsewhere besides as the
parent of the usb-c-connector node. That implies using the 'displayport'
property in the cros-ec-typec node or teaching dp_altmode_probe() to
look for the port@1/endpoint@1 remote-endpoint handle in the
usb-c-connector graph.

Assuming the bindings you've presented here are fine and good and I got
over the differences between Trogdor and Corsola, then I can make mostly
everything work with the drm_connector_oob_hotplug_event() signature
change from above and some tweaks to dp_altmode_probe() to look for
port@1/endpoint@1 first because that's the "logical" DP input endpoint
in the usb-c-connector binding's graph. Great! The final roadblock I'm
at is that HPD doesn't work on Trogdor, so I can't signal HPD through
the typec framework.

This series fixes that problem by "capturing" HPD state from the
upstream drm_bridge, e.g. msm_dp, by hooking the struct
drm_bridge_funcs::hpd_notify() path and injecting HPD into the typec
messages received from the EC. That's a workaround to make the typec
framework see HPD state changes that are otherwise invisible to the
kernel. Newer firmwares actually tell us the state of HPD properly, but
even then we have to read a gpio mux controlled by the EC to figure out
which usb-c-connector is actually muxing DP when HPD changes on either
typec_port. Having a drm_bridge in cros-ec-typec helped here because we
could hook this path and signal HPD if we knew the firmware was fixed.
If we don't have the drm_bridge anymore, I'm lost how to do this.

Maybe the right answer here is to introduce a drm_connector_dp_typec
structure that is created by the TCPM (cros-ec-typec) that sets a new
DRM_BRIDGE_OP_DP_TYPEC bridge op flag? And then teach
drm_bridge_connector about this new flag, similar to the HDMI one. The
drm_bridge could implement some function that maps the typec_port
(usb-c-connector) to the upstream drm_bridge (ANX7625) graph port,
possibly all in drm_bridge_connector_oob_hotplug_event() so that nothing
else really changes. It could also let us keep hooking the hpd_notify()
path for the workaround needed on Trogdor. And finally it may let us
harmonize the two DT bindings so that we only have one port@1/endpoint
node in the usb-c-connector.


>                 };
>         };
>
>         connector@1 {
>                 port@1 {
>                         endpoint@0 {
>                                 remtoe = <&usb_hub_1>;
>                         };
>
>                         endpoint@1 {
>                                 remote = <&dp_bridge_out_1>;
>                         };
>                 };
>         };
> };
>
> dp_bridge {
>         ports {
>                 port@1 {
>                         dp_bridge_out_0: endpoint@0 {
>                                 remote = <usb_c0_ss_dp>;
>                                 data-lanes = <0 1>;
>                         };
>
>                         dp_bridge_out_1: endpoint@1 {
>                                 remote = <usb_c1_ss_dp>;
>                                 data-lanes = <2 3>;
>                         };
>                 };
>         };
> };
>
> -------
>
> This one is really tough example, we didn't reach a conclusion here.
> If the EC doesn't handle lane remapping, dp_bridge has to get
> orientation-switch and mode-switch properties (as in the end it is the
> dp_bridge that handles reshuffling of the lanes for the Type-C). Per the
> DisplayPort standard the lanes are fixed (e.g. DPCD 101h explicitly
> names lane 0, lanes 0-1, lanes 0-1-2-3).

Are those logical or physical lanes?

I think we'll punt on this one anyway though. We don't have any plans to
do this orientation control mechanism so far. Previous attempts failed
and we put an extra orientation switch control on the board to do the
orientation flipping.
