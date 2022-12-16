Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF4B64E5EE
	for <lists+dri-devel@lfdr.de>; Fri, 16 Dec 2022 03:17:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D299710E112;
	Fri, 16 Dec 2022 02:17:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C66A110E112
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Dec 2022 02:17:00 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id b13so1365752lfo.3
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 18:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=ZjzJ9WhXTE05RyYmA2QPUmpA1woceeeGkNWHWVQ74Zw=;
 b=OLJ7301U8awIprSdPqVp0AeaPAOHWm9MPFVQyjMsaXgsQZLu11WBxsrEWthXE7/KNx
 0vS+zetx1Fj+nhl9sRIXB3Vw/NzRzi+XXlpAWZN7B0grA97yyMyxWGe5i/ODjIhnS2IE
 TqoHfjZMX5tMxaMR7PEKlNXfJe7y6WzyNyBvc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZjzJ9WhXTE05RyYmA2QPUmpA1woceeeGkNWHWVQ74Zw=;
 b=DZTFrj9tNJS5fgHyLlIWKsgaLlyD13e1AxSN38C9YNMTpwIRooz2Q5XWTD4kMUeUhG
 DNeNqEZAlYt9qWEryA9yJ0Il+7szU8OtXN8vxzzgy7I3O25UJNw9+QHsUHaoQ6Ummj7x
 u7R08P5bMifh1oCP3dulLvaIKLn6HhtSVVkYMMjkpNkSD75DrHBJVTiCk5q6KzAr4n5T
 SypkOLd9Ae5+H7pBGVVcHM3W5d55xQzMxdKsLL2HpGg6j73HKGrp5u8LtvX4L1HpxV8h
 jCju4aDgocmR8TMGtzlgrheQ1M/UhooMnJNJ+zzXR2bkY6YhWTsjyGgByQ1tfCwY4fai
 OKiw==
X-Gm-Message-State: ANoB5pnagTmLrvkIZYcjwth2l++NndwxZXL3nEZBBlxmaIaMNj/dIg3N
 Oy0Yd9HJri6BuH4emTBaZ7AW9bFk5Cvm2V+KkIppyQ==
X-Google-Smtp-Source: AA0mqf4XFFn9U8qhxQns74Iy+JaP4Zci521QKQ2DHw7bDkXrHuGVld02sorOChBHmli/Ok1/ppDmtG7ZTYBpkTsdKzg=
X-Received: by 2002:a05:6512:3618:b0:4b4:e824:2339 with SMTP id
 f24-20020a056512361800b004b4e8242339mr25179662lfs.82.1671157018871; Thu, 15
 Dec 2022 18:16:58 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 Dec 2022 21:16:58 -0500
MIME-Version: 1.0
In-Reply-To: <011c1ce3-605a-1ad5-d7df-b91e8c6808bc@linaro.org>
References: <1670967848-31475-1-git-send-email-quic_khsieh@quicinc.com>
 <1670967848-31475-3-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n52eHYCqxUJqQXoaQ8vyqCk-QfouSun+zUp3yo5DufWbwg@mail.gmail.com>
 <b38af164-08bc-07e7-dfaf-fb4d6d89d7db@quicinc.com>
 <CAE-0n53Cb6TFGfM6AYup5aP4=24j0ujVPi463oVqmzfNV2B4RA@mail.gmail.com>
 <011c1ce3-605a-1ad5-d7df-b91e8c6808bc@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 15 Dec 2022 21:16:57 -0500
Message-ID: <CAE-0n51fxiNX6N2WvXrXXjmGtiDk-SwnyikRnDEKaK-rug2-Ew@mail.gmail.com>
Subject: Re: [PATCH v12 2/5] dt-bindings: msm/dp: add data-lanes and
 link-frequencies property
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 agross@kernel.org, airlied@gmail.com, andersson@kernel.org, daniel@ffwll.ch, 
 devicetree@vger.kernel.org, dianders@chromium.org, 
 dri-devel@lists.freedesktop.org, konrad.dybcio@somainline.org, 
 krzysztof.kozlowski+dt@linaro.org, robdclark@gmail.com, robh+dt@kernel.org, 
 sean@poorly.run, vkoul@kernel.org
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
Cc: linux-arm-msm@vger.kernel.org, quic_sbillaka@quicinc.com,
 freedreno@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-12-15 13:12:49)
> On 15/12/2022 02:38, Stephen Boyd wrote:
> > Quoting Kuogee Hsieh (2022-12-14 14:56:23)
> >>
> >> Once link training start, then there are no any interactions between
> >> controller and phy during link training session.
> >
> > What do you mean? The DP controller calls phy_configure() and changes
> > the link rate. The return value from phy_configure() should be checked
> > and link training should skip link rates that aren't supported and/or
> > number of lanes that aren't supported.
>
> I'd toss another coin into the argument. We have previously discussed
> using the link-frequencies property in the context of limiting link
> speeds for the DSI. There we have both hardware (SoC) limitations and
> the board limitations as in some cases the DSI lanes can not sustain
> some high rate. I still hope for these patches to materialize at some point.
>
> For the DP this is more or less the same story. We have the hardware
> (SoC, PHY, etc) limitations, but also we have the board/device
> limitations. For example some of the board might not be able to support
> HBR3 e.g. because of the PCB design. And while it might be logical to
> also add the 'max bit rate' support to the eDP & combo PHYs, it
> definitely makes sense to be able to limit the rate on the DP <->
> `something' link.

Honestly I don't think the PHY even makes sense to put the link rate
property. In the case of Trogdor, the DP controller and DP PHY both
support all DP link frequencies. The limiting factor is the TCPC
redriver that is only rated to support HBR2. We don't describe the TCPC
in DT because the EC controls it. This means we have to put the limit
*somewhere*, and putting it in the DP output node is the only place we
have right now. I would really prefer we put it wherever the limit is,
in this case either in the EC node or on the type-c ports.

Another nice to have feature would be to support different TCPCs connected
to the same DP port. We were considering doing this on Trogdor, where we
would have a TCPC rated for HBR2 and another TCPC rated for HBR3 and
then detect which TCPC was in use to adjust the supported link rates.
We didn't do this though, so the idea got back-burnered.

When the SoC is directly wired to a DP connector, I'd expect the
connector to have the link rate property. That's because the connector
or the traces outside of the SoC will be the part that's limiting the
supported frequencies, not the SoC. The graph would need to be walked to
find the link rate of course. The PHY could do this just as much as the
DP controller could.

>
> Now, for all the practical purposes this `something' for the DP is the
> DP connector, the eDP panel or the USB-C mux (with the possible
> redrivers in the middle).
>
> Thus I'd support Kuogee's proposal to have link-frequencies in the DP's
> outbound endpoint. This is the link which will be driven by the data
> stream from the Linux point of view. The PHY is linked through the
> 'phys' property, but it doesn't participate in the USB-C (or in the
> connector/panel) graph.

Why doesn't the PHY participate in the graph? The eDP panel could just
as easily be connected to the eDP PHY if the PHY participated in the
graph.

>
> Now let's discuss the data lanes. Currently we have them in the DP
> property itself. Please correct me if I'm wrong, but I think that we can
> drop it for all the practical purposes.

I vaguely recall that the driver was checking data-lanes to figure out
how many lanes are usable. This is another shortcut taken on Trogdor to
work around a lack of complete DP bindings. We only support two lanes of
DP on Trogdor.

> Judging by the DP compat string
> the driver can determine if it uses 2 lanes (eDP) or 4 lanes
> (full-featured DP). In case of USB-C when the altmode dictates whether
> to use 2 or 4 lanes, the TCPM (Type-C Port Manager) will negotiate the
> mode and pin configuration, then inform the DP controller about the
> selected amount of lanes. Then DP informs the PHY about the selection
> (note, PHY doesn't have control at all in this scenario).
>
> The only problematic case is the mixed mode ports, which if I understand
> correctly, can be configured either to eDP or DP modes. I'm not sure who
> specifies and limits the amount of lanes available to the DP controller.
>

This would depend on where we send the type-c message in the kernel. It
really gets to the heart of the question too. Should the PHY be "dumb"
and do whatever the controller tells it to do? Or should the PHY be
aware of what's going on and take action itself? Note that the
data-lanes property is also used to remap lanes. On sc7180 the lane
remapping happens in the DP PHY, and then the type-c PHY can flip that
too, so if we don't involve the PHY(s) in the graph we'll have to
express this information in the DP controller graph and then pass it to
the PHY from the controller. Similarly, when we have more dynamic
configuration of the type-c PHY, where USB may or may not be used
because the TCPM has decided to use 2 or 4 lanes of DP, the data-lanes
property will only indicate lane mappings and not the number of lanes
supported. We'll again have to express the number of lanes to the PHY by
parsing the type-c messages.

It looks simpler to me if the PHY APIs push errors up to the caller for
unsupported configurations. This will hopefully make it easier for the
DP controller when the DP lanes are muxed onto a type-c port so that the
controller doesn't have to parse type-c messages. Instead, the PHY will
get the type-c message, stash away supported number of lanes and link
rates and then notify the DP controller to retrain the link with the
link training algorithm. A few steps of the link training may be
skipped, but the type-c message parsing won't need to be part of the DP
controller code. Said another way, the DP controller can stay focused on
DP instead of navigating type-c in addition to DP.

From a binding perspective, data-lanes/link-frequencies are part of the
graph binding. Having a graph port without a remote-endpoint doesn't
really make any sense. Therefore we should decide to either connect the
PHY into the graph and constrain it via graph properties like
data-lanes, or leave it disconnected and have the controller drive the
PHY (or PHYs when we have type-c). The type-c framework will want the
orientation control (the type-c PHY) to be part of the graph from the
usb-c-connector. That way we can properly map the PHY pins to the
flipped or not-flipped state of the cable. Maybe we don't need to
connect the PHY to the DP graph? Instead there can be a type-c graph for
the PHY, TCPM, etc. and a display graph for the display chain. It feels
like that must not work somehow.

Either way, I don't see how or why these properties should be part of
the DP controller. The controller isn't the limiting part, it's the
redriver or the board/connector/panel that's the limiting factor. Walk
the graph to find the lowest common denominator of link-frequencies and
handle data-lanes either statically in the PHY or dynamically by parsing
type-c messages. How does the eDP panel indicate only two lanes are
supported when all four lanes are wired? I thought that link training
just fails but I don't know.
