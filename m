Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A986E8DA7
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 11:11:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B142210EA91;
	Thu, 20 Apr 2023 09:11:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2018310E06C
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 09:10:58 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id
 ca18e2360f4ac-76375982b6aso76674939f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 02:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1681981857; x=1684573857;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jApLsIPicCWYWY8ghJs6Wqkso3cOUL2m8oysLKQNPCs=;
 b=Ur9jtx0E94T0GI9XNaXArOQcj0se42481pOZjFlLPL+HB5Lj3VQ0Skl82gG5KPW/re
 V0XDWaTSQ6C8cKi+Hx/1+6fYNfQIAmbBMmPo9Tx61XMp6Lk4cMhypk7IL0R+08PSOOT6
 fulCTs04wVatbGLIdZn0FIjfOxwjNWV2iKIEk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681981857; x=1684573857;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jApLsIPicCWYWY8ghJs6Wqkso3cOUL2m8oysLKQNPCs=;
 b=gNI39JbVF9Jc5iaDiKPA+4rlHMu7tsImsSPwu/eUbdP207TuZf793IAR+80WyPeMle
 gqU4Uj0d0wWpokkjjBqRpD+S0e/SKX/r7h27BpHDN7C2NerRI2RVdV76YQXadqVNKCwY
 GxWSeGF5eA/ahfiU5/TDHPOUSkWNEWE6nqeUf++0V94JB9LGhvid2XOfFdXmBwvWbbW6
 mJpHh9vVzuWJvHIDutCtmwp5oG9WLsJzXvEwmBjkZJgqFniaS/wlIuv+cP3OeGXn+tvk
 AoJ+gU5kwaAoB16ySOe+tn/ppRMyEKo7s/LSky8kvptdhXN5IFdo5745K4dr8iT0CQy3
 tzqw==
X-Gm-Message-State: AAQBX9cXKrV9IGkK9zIqhrcf0A0Na2L02iphkDyaEVtU2o1J8XVBj3oi
 0eYSFE+6oBL5jJkM4SyrYY9aIrYyid/adX/bjS12tw==
X-Google-Smtp-Source: AKy350Y4t++JqRfXaFXQUgB02uSAJYZVXkFSdgGLBxELTeSwXAZpeLFbnln9lKU9ujIzGQATjnMs8vmkMD8DbLkGgsY=
X-Received: by 2002:a02:b019:0:b0:40f:910c:92d6 with SMTP id
 p25-20020a02b019000000b0040f910c92d6mr253400jah.6.1681981856946; Thu, 20 Apr
 2023 02:10:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230331091145.737305-1-treapking@chromium.org>
 <20230331091145.737305-5-treapking@chromium.org>
 <CAE-0n51E5foFWQAsA73662_5e6XP426wuUCVVmcS5UWwiYpDmw@mail.gmail.com>
 <CAEXTbpdcbB_z4ZGCGzc-cM74ECKyxekbroKCWFnhH8eR=4HmvA@mail.gmail.com>
 <CAE-0n50atfmr-bFh5XtTCm4WpSijJGSe0B5JP8ni7CCYk7Bs5A@mail.gmail.com>
 <CAE-0n51Qy-KDGHOCr4Smpebq1fCURqvJ2RJz6KAtVpv5e+DSGA@mail.gmail.com>
In-Reply-To: <CAE-0n51Qy-KDGHOCr4Smpebq1fCURqvJ2RJz6KAtVpv5e+DSGA@mail.gmail.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Thu, 20 Apr 2023 17:10:46 +0800
Message-ID: <CAEXTbpeKe1dVHp9cauMN-9nQb35oJ-ZhdFV-8BiWzjjhWAy0Zg@mail.gmail.com>
Subject: Re: [PATCH v15 04/10] dt-bindings: display: bridge: anx7625: Add
 mode-switch support
To: Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Guenter Roeck <groeck@chromium.org>,
 Marek Vasut <marex@denx.de>, chrome-platform@lists.linux.dev,
 Robert Foss <rfoss@kernel.org>, Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-acpi@vger.kernel.org,
 Chen-Yu Tsai <wenst@chromium.org>, devicetree@vger.kernel.org,
 =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, Rob Herring <robh+dt@kernel.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Daniel Scally <djrscally@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Prashant Malani <pmalani@chromium.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 20, 2023 at 2:10=E2=80=AFPM Stephen Boyd <swboyd@chromium.org> =
wrote:
>
> Quoting Stephen Boyd (2023-04-13 17:22:46)
> > Quoting Pin-yen Lin (2023-04-13 02:50:44)
> > >
> > > Actually the `mode-switch` property here is mainly because
> > > `fwnode_typec_mux_get`[1] and `typec_mux_match`[2] only return matche=
s
> > > when the property is present. I am not sure what side effects would b=
e
> > > if I remove the ID-matching condition in `typec_mux_match`, so I adde=
d
> > > the property here.
> > >
> > > Is it feasible to remove the `mode-switch` property here given the
> > > existing implementation of the Type-C framework?
> >
> > Omitting the mode-switch property would require changes to the type-c
> > framework.
> >
> > I'm wondering if we can have this anx driver register mode switches for
> > however many endpoints exist in the output port all the time when the
> > aux-bus node doesn't exist. Then the type-c framework can walk from the
> > usb-c-connector to each connected node looking for a device that is bot=
h
> > a drm_bridge and a mode-switch. When it finds that combination, it know=
s
> > that the mode-switch has been found. This hinges on the idea that a
> > device that would have the mode-switch property is a drm_bridge and
> > would register a mode-switch with the type-c framework.
> >
> > It may be a little complicated though, because we would only register
> > one drm_bridge for the input to this anx device. The type-c walking cod=
e
> > would need to look at the graph endpoint, and find the parent device to
> > see if it is a drm_bridge.
>
> I've been thinking more about this. I think we should only have the
> 'mode-switch' property possible when the USB input pins (port@2) are
> connected and the DPI input pins are connected (port@0). Probably you
> don't have that case though?

No we don't have the use case that uses the USB input pins on anx7625.
>
> In your case, this device should register either one or two drm_bridges
> that connect to whatever downstream is actually muxing the 2 DP lanes
> with the USB SS lanes onto the usb-c-connector.

What do you mean by "muxing the 2 DP lanes with the USB SS lanes''? In
our use case, the USB data lanes from both ports are connected to a
USB hub, but the DP lanes are muxed by the crosspoint switch on
anx7625. HPD and AUX for the external display are muxed by the EC. You
can find the diagram at
https://lore.kernel.org/linux-usb/YxGzk6DNAt0aCvIY@chromium.org/

> If that is the EC for
> ChromeOS, then the EC should have a binding that accepts some number of
> input ports for DP. The EC would act as a drm_bridge, or in this case
> probably two bridges, and also as two type-c switches for each
> drm_bridge corresponding to the usb-c-connector nodes. When DP is on the
> cable, the type-c switch/mux would signal to the drm_bridge that the
> display is 'connected' via DRM_BRIDGE_OP_DETECT and struct
> drm_bridge_funcs::detect(). Then the drm_bridge in this anx part would
> implement struct drm_bridge_funcs::atomic_enable() and configure the
> crosspoint switch the right way depending on the reg property of the
> output node in port@1.

So there will be two drm bridges that act as the downstreams for
anx7625, and we find the downstream with connector_status_connected to
configure the crosspoint switch? How do we support that kind of
topology given that the drm bridge chain is currently a list? Are you
suggesting making the bridge topology to a tree, or maintaining the
two downstreams inside the anx7625 driver and not attaching them to
the bridge chain?

Also, if we still register mode switches on the two downstream
bridges, why do you prefer that over the original approach that
register switches in the anx7625 driver?

>
> Because you don't have the part that implements the orientation-switch,
> you don't need to implement the code for it. I think simply adding
> support in the binding for mode-switch and orientation-switch if this is
> directly wired to a usb-c-connector should be sufficient. Those
> properties would be at the top-level and not part of the graph binding.
