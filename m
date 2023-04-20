Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D35EC6E8A2C
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 08:11:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5FF710EB69;
	Thu, 20 Apr 2023 06:10:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B021310EB69
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 06:10:53 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id q21so1644563ljp.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 23:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1681971051; x=1684563051;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=cNPBzX6Y4DzEXkxrIsPy5WXkjPdEdrZU6Sa+8uyinhQ=;
 b=T6LFJAc7v8GrrcO2kqA4STxSTFczF6e9f/FFkoTN386zEbafQ9OeBNDHhzAj0y4B5y
 mjd4LqgBkN/Apo4JcK8bye9Edyo0Gu+PlOi/enVL4YyxQh4xdjTYDNPZJFb3GYxQ8Bf8
 CVvxKkEvnNo9DJ02bKZUUmN9AY23CoqMNkrT8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681971051; x=1684563051;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cNPBzX6Y4DzEXkxrIsPy5WXkjPdEdrZU6Sa+8uyinhQ=;
 b=Rphmtwxzj4ux9hi3tgXlTiFsaq1bnAHm6C7uqIKtJt7UcsuNuGYpg3XXxDFAo8jj38
 lMLHCSQ+v6/AYkrN60Gf+Q7huUPlQ45xrpz1QY5sxTyDZxEzt24fYaJeRzPai3+WmF9m
 bVJtGTpea0OIWRNNQa8L5tBzEexyXGqwZ5g2THSd1xcwZjQ5GhZKmPUz7bzd9PXptYRN
 wfRjhqFJmRTI4sjstaF02iAi9qdJogHNaO7xlmv8PjjJoI+teARti6kpfpc6oqRiVCrW
 TGcCXcvZ5GezJw8xJqe48HUKKYE+E8MqV6hv/rzpvoD8t+Votc+M1/AnWktvKV9A1gVJ
 5LvA==
X-Gm-Message-State: AAQBX9c0Rh66Nwgx+Ij+H1ZBBl10xPoBpQ2Sd/07JqHvtayRWE5LW7UG
 KG2JLZA/c9bRdUQ5z7AglXbylC6qeroFRdJr2ik0Yg==
X-Google-Smtp-Source: AKy350Ydm+ji1Zz5gF+5t9+VddXM85teKkwpvpc0TGbgwOoQH/RjUhZIpMjhSmt4c7794yXFCLb7VjgGzoZF/T4iQuA=
X-Received: by 2002:a2e:9051:0:b0:2a8:e4d3:11de with SMTP id
 n17-20020a2e9051000000b002a8e4d311demr105767ljg.20.1681971051475; Wed, 19 Apr
 2023 23:10:51 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 19 Apr 2023 23:10:50 -0700
MIME-Version: 1.0
In-Reply-To: <CAE-0n50atfmr-bFh5XtTCm4WpSijJGSe0B5JP8ni7CCYk7Bs5A@mail.gmail.com>
References: <20230331091145.737305-1-treapking@chromium.org>
 <20230331091145.737305-5-treapking@chromium.org>
 <CAE-0n51E5foFWQAsA73662_5e6XP426wuUCVVmcS5UWwiYpDmw@mail.gmail.com>
 <CAEXTbpdcbB_z4ZGCGzc-cM74ECKyxekbroKCWFnhH8eR=4HmvA@mail.gmail.com>
 <CAE-0n50atfmr-bFh5XtTCm4WpSijJGSe0B5JP8ni7CCYk7Bs5A@mail.gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 19 Apr 2023 23:10:50 -0700
Message-ID: <CAE-0n51Qy-KDGHOCr4Smpebq1fCURqvJ2RJz6KAtVpv5e+DSGA@mail.gmail.com>
Subject: Re: [PATCH v15 04/10] dt-bindings: display: bridge: anx7625: Add
 mode-switch support
To: Pin-yen Lin <treapking@chromium.org>
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

Quoting Stephen Boyd (2023-04-13 17:22:46)
> Quoting Pin-yen Lin (2023-04-13 02:50:44)
> >
> > Actually the `mode-switch` property here is mainly because
> > `fwnode_typec_mux_get`[1] and `typec_mux_match`[2] only return matches
> > when the property is present. I am not sure what side effects would be
> > if I remove the ID-matching condition in `typec_mux_match`, so I added
> > the property here.
> >
> > Is it feasible to remove the `mode-switch` property here given the
> > existing implementation of the Type-C framework?
>
> Omitting the mode-switch property would require changes to the type-c
> framework.
>
> I'm wondering if we can have this anx driver register mode switches for
> however many endpoints exist in the output port all the time when the
> aux-bus node doesn't exist. Then the type-c framework can walk from the
> usb-c-connector to each connected node looking for a device that is both
> a drm_bridge and a mode-switch. When it finds that combination, it knows
> that the mode-switch has been found. This hinges on the idea that a
> device that would have the mode-switch property is a drm_bridge and
> would register a mode-switch with the type-c framework.
>
> It may be a little complicated though, because we would only register
> one drm_bridge for the input to this anx device. The type-c walking code
> would need to look at the graph endpoint, and find the parent device to
> see if it is a drm_bridge.

I've been thinking more about this. I think we should only have the
'mode-switch' property possible when the USB input pins (port@2) are
connected and the DPI input pins are connected (port@0). Probably you
don't have that case though?

In your case, this device should register either one or two drm_bridges
that connect to whatever downstream is actually muxing the 2 DP lanes
with the USB SS lanes onto the usb-c-connector. If that is the EC for
ChromeOS, then the EC should have a binding that accepts some number of
input ports for DP. The EC would act as a drm_bridge, or in this case
probably two bridges, and also as two type-c switches for each
drm_bridge corresponding to the usb-c-connector nodes. When DP is on the
cable, the type-c switch/mux would signal to the drm_bridge that the
display is 'connected' via DRM_BRIDGE_OP_DETECT and struct
drm_bridge_funcs::detect(). Then the drm_bridge in this anx part would
implement struct drm_bridge_funcs::atomic_enable() and configure the
crosspoint switch the right way depending on the reg property of the
output node in port@1.

Because you don't have the part that implements the orientation-switch,
you don't need to implement the code for it. I think simply adding
support in the binding for mode-switch and orientation-switch if this is
directly wired to a usb-c-connector should be sufficient. Those
properties would be at the top-level and not part of the graph binding.
