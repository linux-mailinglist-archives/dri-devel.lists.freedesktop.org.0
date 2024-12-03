Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3FF9E3013
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 00:51:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A12110E278;
	Tue,  3 Dec 2024 23:51:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="fe5X3b3L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3418110E278
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 23:51:00 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id
 af79cd13be357-7b6662bc408so480259585a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2024 15:51:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1733269859; x=1733874659;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=EnjgP+/pVl9iI2xT3/J2oBRnCck1VdgzOQo4g6wMy/Y=;
 b=fe5X3b3L1uJwae/C95UCpByR4Z04Gelvcit2VZ9+HMjdZBsvgMbNeqiIkta+pUUbue
 HTIITqPzdEBZFZ/9poSYjyu2nFHYRr7nrV3JNjQJBCSmAoh70EOiOaGc/lPjphLTYT6l
 69Mno33xKBpBhHv0cvO7s23alJ1jZWtu1VZp8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733269859; x=1733874659;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EnjgP+/pVl9iI2xT3/J2oBRnCck1VdgzOQo4g6wMy/Y=;
 b=D2i16PIhub3KQIaLZxOD/EO6+SETVFGa4vNiRoXyrvJ6jv/gAYLY02f7l0r11ozNVX
 MwbayqdVIuO37050VtIWmCyLzN6+Z3MMFdRM4MpTqrJ+g3Ef58CYOYNDBv+KKDRHyiQ/
 qHC3E8UPIQf0wJ/ZC+izvWGf88hn2u4sXnwZCtr9lsHO/eYwSGNPsl7Iq0/TlTpYerRJ
 QjzPhAERiUOk2m245gqv9rRO8e4VUhbHN+ML3wM87H9Dg23XeukMSjjHzdHptDo6Xm/V
 O6/B58eRlNwi3pVcBxTftrhqO1X0wmNjyOyJnuFJ0zsovio4lAum+hLtquHJxD1bcBW0
 osXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/jonfceiqZsCApAMYj6juMYBnY++FwYNU/ngqPq0CHcs7oqdCFUB6RpWB70dHXYoHg2+l/ZQkY5s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywp8Y5SrNw6Z1jMRuLkUukWbtqA5BaztURLgFEgk9RF1kHpCIUV
 x0VPPIFNwiTGzmaiw5G2riabyH21Nd5mT5b6Sjz1OnM4fbj+J/bKM2rs6akOyyVKlnoWOfNxRY7
 U9wEaDabJRqV/oLqhzypZme/e83a32yloJ6bV
X-Gm-Gg: ASbGncs4ANPBvrE8AfIapEQvfgCyWiWXWrcButeV7a3vwXs8YpYsEuSCSukk9LW609s
 wc++khrV4h3ekQUrOi/VMzmPqxxFmLLMAhY5dgeXD4ncs+ogMtIh/4AnfNRQ=
X-Google-Smtp-Source: AGHT+IHEgBXWoi8BJHO3jSXOG7m1oHxpYBSZUKMhC1usrxD/ibe1QmfujCFJzYfILghK3QdcAVLyYpr9Sv5mqRngbJA=
X-Received: by 2002:a05:6214:2029:b0:6d3:7a47:2034 with SMTP id
 6a1803df08f44-6d8c443cefdmr40855326d6.3.1733269858918; Tue, 03 Dec 2024
 15:50:58 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 3 Dec 2024 15:50:58 -0800
MIME-Version: 1.0
In-Reply-To: <cartdeijkv6z23dgm7uif4lti3lahfqmuyxcmruzqbefhsp6yk@m6ocjhncs2ko>
References: <lf7y7wpuca6kzqcglgs5d443iusf7xjocum4adi7t3npfavccx@zgsp37oyztme>
 <yk3xidaisbd56yndaucax7otijjauqmm7lqm6q4q633kdawlqo@qaq27lwxmvwd>
 <CAE-0n501j+8bMnMKabFyZjn+MLUy3Z68Hiv1PsfW0APy5ggN8g@mail.gmail.com>
 <gstohhcdnmnkszk4l2ikd5xiewtotgo5okia62paauj6zpaw7y@4wchyvoynm2p>
 <CAE-0n50z6MNa7WOsg-NU7k8BpFeJJyYfHX3ov6DsthLWauSNpA@mail.gmail.com>
 <hqmx7jtkvrwvb27n56hw7rpefhp37lhr3a5fawz7gsl76uuj5s@h7m6wpdhibkk>
 <CAE-0n50y1O2C47zOGJPmMjKXK_m6a=jhpEAP4nW+RymZbo2xyg@mail.gmail.com>
 <5kisfv22tgqwzjpxqrbx56ywr7l4r7pny3pl2r7crv4rijqbwk@azricdasttg7>
 <CAE-0n50Bxi2GfnxOmMwe-F+k5jMSiyAVPDb6K8pYm-i6hpJTOA@mail.gmail.com>
 <cartdeijkv6z23dgm7uif4lti3lahfqmuyxcmruzqbefhsp6yk@m6ocjhncs2ko>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Tue, 3 Dec 2024 15:50:58 -0800
Message-ID: <CAE-0n51-QLLje0f7T4p3xK6Q-FRk4K0NUrVVm4cxkKoevuzktw@mail.gmail.com>
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

Quoting Dmitry Baryshkov (2024-11-21 14:59:42)
> On Tue, Nov 19, 2024 at 08:09:31PM -0500, Stephen Boyd wrote:
> >
> > It sounds like we're debating how to handle lane assignment in the
> > kernel. Either way, the code is going to be implemented in the bridge
> > driver because it's the one that has to change what physical lane a
> > logical lane is assigned to. The question is if it should be some sort
> > of bridge_funcs callback, or should bridge drivers hook into the typec
> > framework to expose an orientation switch, or something else?
>
> I was assuming that orientation switch is such kind of a hook.
>
> >
> > I'm thinking we should introduce some sort of bridge_funcs callback that
> > can be called from the DP altmode driver, either parallel to the
> > drm_connector_oob_hotplug_event() function or from it directly. If we
> > can pass the fwnode for the usb-c-connector to the oob_hotplug_event
> > callback, maybe that's all we need to figure out which lanes go where.
> > And then in the 2 DP connector muxing world we can call
> > drm_connector_oob_hotplug_event() with one or the other DP connector
> > node, which will likely be children nodes of the "HPD redriver" device.
>
> If you call it from drm_bridge_connector's oob_hotplug_event handler,
> this should fly. Does it cover your 3-DP or 4-DP usecases?
>

I think it will work as long as we're able to add some sort of property
to the usb-c-connector node to indicate that the DP lanes are flipped.
It feels like that should be in the displayport altmode node to keep
things tidy because the SuperSpeed port is overloaded. Maybe the drm
framework can have some API that can take the fwnode from the
oob_hotplug_event handler and tell the bridge driver which way the
orientation is.

 connector {
   compatible = "usb-c-connector";

   altmodes {
     displayport {
       orientation-reversed;
     }
   };

   ports {
     ...
   };
 };


 int drm_dp_typec_orientation_flipped(struct fwnode_handle *fwnode)
 {
   struct fwnode_handle *altmodes;
   struct fwnode_handle *dp;

   altmodes = fwnode_get_named_child_node(fwnode, "altmodes");
   if (!altmodes)
     return -EINVAL;

   dp = fwnode_get_named_child_node(altmodes, "displayport");
   if (!dp)
     return -EINVAL;

   if (fwnode_property_read_bool(dp, "orientation-reversed"))
     return 1;

   return 0;
 }

There's another wrinkle on some Corsola devices where the EC says
there's a usb-c-connector on the board, but in reality the DP lanes are
connected to a DP-to-HDMI bridge that is controlled by the EC which goes
to an HDMI connector on the side of the laptop. The EC does the
arbitration as usual because there's only one DP source and one or two
usb type-c connectors physically on the laptop in addition to the HDMI
connector.

The easiest way to imagine this is that we took the usb-c-connector and
jammed an HDMI dongle in there with some glue so that it can never be
removed. There isn't any USB going there either because it can't be
used. I suppose we can continue to describe this with an
altmodes/displayport node but then add some compatible like
"usb-c-hdmi-connector" or another property to the altmodes/displayport
node like "type = hdmi" that signifies this is a connector that only
outputs HDMI.
