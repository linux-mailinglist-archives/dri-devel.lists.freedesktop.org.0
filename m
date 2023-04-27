Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 901346F02A0
	for <lists+dri-devel@lfdr.de>; Thu, 27 Apr 2023 10:34:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A6B310E325;
	Thu, 27 Apr 2023 08:34:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F75110E325
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Apr 2023 08:34:03 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id
 ca18e2360f4ac-7606df33c42so200621039f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Apr 2023 01:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1682584442; x=1685176442;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sABY6A67E6Cr5HzYkc9PhVkZQhkD8kgg0GZ6k0SOVCs=;
 b=ZXCewySSCGLGW2ssIYmj8XvdD9bNIevJa4tXEfsy/2Rz+vT3jB+TdKdDT0dHQdtQ7P
 NhkiCmfWRYa1242dz9Hna3BPrYr0bHYXfjGTQyIMEr46utyp7Zty4/mxL4k08MdVqMbv
 NysGsqgJnHdLCcEzprjPToeuBT/32G1FAqNKY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682584442; x=1685176442;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sABY6A67E6Cr5HzYkc9PhVkZQhkD8kgg0GZ6k0SOVCs=;
 b=SPeOdzDJ5xem38NcpQziek5mdy1GZWSc/u0KVTTuQqimDvQYs/itZhWPZry2AsMYK9
 +tH+zdhrzRbHChu8+6oWepaLmyC8EBc6B5ChVwsn0XarF+MgmY6xbDOCJdJuSm5XCtjx
 s+bRCmUGR/YdUAZ/qN0WFxiyIznL6aytFzViVofFDa8vO9YdT62cUEPU47suEyFqsFFK
 FUI2jc4rrMQlshRjBVnacqMF/ELj0dStBEnQl5jsc1c04728NlXZJdiTb7LYqogmV2s9
 MQTppeskwlaNTwJ5OrP7C5k2AsjCWqIKXC8x4BNMIB+gwYapFCg/uBE3AlBj7bz4LY7Z
 LcGw==
X-Gm-Message-State: AC+VfDw5puhRQXI4+M4iR169Z6LvkggcR6F0+k0a2mnWH8uT4m5JMaOT
 FMeHmeD6aRikA0SeaOEwphcxw+jNE8qaDH+Kf1PQYg==
X-Google-Smtp-Source: ACHHUZ6G8bxKhwblghlEc4n/zFsjFZp0dwMaJ3weKd4SVVgKwn7iy+BZ9ek6/DBO+rvf15mslpALYE3KPS/vz18U6n8=
X-Received: by 2002:a92:c84d:0:b0:318:ab40:4e9b with SMTP id
 b13-20020a92c84d000000b00318ab404e9bmr742195ilq.2.1682584441951; Thu, 27 Apr
 2023 01:34:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230331091145.737305-1-treapking@chromium.org>
 <20230331091145.737305-5-treapking@chromium.org>
 <CAE-0n51E5foFWQAsA73662_5e6XP426wuUCVVmcS5UWwiYpDmw@mail.gmail.com>
 <CAEXTbpdcbB_z4ZGCGzc-cM74ECKyxekbroKCWFnhH8eR=4HmvA@mail.gmail.com>
 <CAE-0n50atfmr-bFh5XtTCm4WpSijJGSe0B5JP8ni7CCYk7Bs5A@mail.gmail.com>
 <CAE-0n51Qy-KDGHOCr4Smpebq1fCURqvJ2RJz6KAtVpv5e+DSGA@mail.gmail.com>
 <CAEXTbpeKe1dVHp9cauMN-9nQb35oJ-ZhdFV-8BiWzjjhWAy0Zg@mail.gmail.com>
In-Reply-To: <CAEXTbpeKe1dVHp9cauMN-9nQb35oJ-ZhdFV-8BiWzjjhWAy0Zg@mail.gmail.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Thu, 27 Apr 2023 16:33:51 +0800
Message-ID: <CAEXTbpcBrd9W_BLcDO5JO9v=r+WOOfU8KmuSyZKr5sT=ezk6KA@mail.gmail.com>
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

On Thu, Apr 20, 2023 at 5:10=E2=80=AFPM Pin-yen Lin <treapking@chromium.org=
> wrote:
>
> On Thu, Apr 20, 2023 at 2:10=E2=80=AFPM Stephen Boyd <swboyd@chromium.org=
> wrote:
> >
> > Quoting Stephen Boyd (2023-04-13 17:22:46)
> > > Quoting Pin-yen Lin (2023-04-13 02:50:44)
> > > >
> > > > Actually the `mode-switch` property here is mainly because
> > > > `fwnode_typec_mux_get`[1] and `typec_mux_match`[2] only return matc=
hes
> > > > when the property is present. I am not sure what side effects would=
 be
> > > > if I remove the ID-matching condition in `typec_mux_match`, so I ad=
ded
> > > > the property here.
> > > >
> > > > Is it feasible to remove the `mode-switch` property here given the
> > > > existing implementation of the Type-C framework?
> > >
> > > Omitting the mode-switch property would require changes to the type-c
> > > framework.
> > >
> > > I'm wondering if we can have this anx driver register mode switches f=
or
> > > however many endpoints exist in the output port all the time when the
> > > aux-bus node doesn't exist. Then the type-c framework can walk from t=
he
> > > usb-c-connector to each connected node looking for a device that is b=
oth
> > > a drm_bridge and a mode-switch. When it finds that combination, it kn=
ows
> > > that the mode-switch has been found. This hinges on the idea that a
> > > device that would have the mode-switch property is a drm_bridge and
> > > would register a mode-switch with the type-c framework.

I spent some time working on this approach on the Type-C side. The
issue I met is that the driver doesn't know whether a node is a
drm_bridge before the anx7625 driver probes. When there is a
"mode-switch" property in the node, the Type-C framework knows that
"here is a mode switch, but the corresponding driver hasn't registered
the typec_mux". So it returns -EPROBE_DEFER and retries later.
However, if we remove the property, the Type-C framework won't know
whether a node will be registered as a drm_bridge and register a
typec_mux.

Do you have other suggestions on this if we want to choose this approach?

Best regards,
Pin-yen
> > >
> > > It may be a little complicated though, because we would only register
> > > one drm_bridge for the input to this anx device. The type-c walking c=
ode
> > > would need to look at the graph endpoint, and find the parent device =
to
> > > see if it is a drm_bridge.
> >
> > I've been thinking more about this. I think we should only have the
> > 'mode-switch' property possible when the USB input pins (port@2) are
> > connected and the DPI input pins are connected (port@0). Probably you
> > don't have that case though?
>
> No we don't have the use case that uses the USB input pins on anx7625.
> >
> > In your case, this device should register either one or two drm_bridges
> > that connect to whatever downstream is actually muxing the 2 DP lanes
> > with the USB SS lanes onto the usb-c-connector.
>
> What do you mean by "muxing the 2 DP lanes with the USB SS lanes''? In
> our use case, the USB data lanes from both ports are connected to a
> USB hub, but the DP lanes are muxed by the crosspoint switch on
> anx7625. HPD and AUX for the external display are muxed by the EC. You
> can find the diagram at
> https://lore.kernel.org/linux-usb/YxGzk6DNAt0aCvIY@chromium.org/
>
> > If that is the EC for
> > ChromeOS, then the EC should have a binding that accepts some number of
> > input ports for DP. The EC would act as a drm_bridge, or in this case
> > probably two bridges, and also as two type-c switches for each
> > drm_bridge corresponding to the usb-c-connector nodes. When DP is on th=
e
> > cable, the type-c switch/mux would signal to the drm_bridge that the
> > display is 'connected' via DRM_BRIDGE_OP_DETECT and struct
> > drm_bridge_funcs::detect(). Then the drm_bridge in this anx part would
> > implement struct drm_bridge_funcs::atomic_enable() and configure the
> > crosspoint switch the right way depending on the reg property of the
> > output node in port@1.
>
> So there will be two drm bridges that act as the downstreams for
> anx7625, and we find the downstream with connector_status_connected to
> configure the crosspoint switch? How do we support that kind of
> topology given that the drm bridge chain is currently a list? Are you
> suggesting making the bridge topology to a tree, or maintaining the
> two downstreams inside the anx7625 driver and not attaching them to
> the bridge chain?
>
> Also, if we still register mode switches on the two downstream
> bridges, why do you prefer that over the original approach that
> register switches in the anx7625 driver?
>
> >
> > Because you don't have the part that implements the orientation-switch,
> > you don't need to implement the code for it. I think simply adding
> > support in the binding for mode-switch and orientation-switch if this i=
s
> > directly wired to a usb-c-connector should be sufficient. Those
> > properties would be at the top-level and not part of the graph binding.
