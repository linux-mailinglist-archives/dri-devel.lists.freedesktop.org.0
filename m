Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F303364E415
	for <lists+dri-devel@lfdr.de>; Thu, 15 Dec 2022 23:58:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3535610E597;
	Thu, 15 Dec 2022 22:57:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1351E10E599
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 22:57:40 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id ud5so2167241ejc.4
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 14:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=FjiYqubKBXS7ZvYOxxCl827BBeUF7k6PM5EHfi+VLgs=;
 b=XrTmcoxjUIc3mHLG05TRz9tN3dxkoOc6WODwSvlaUZ5g+5jL4YkBP6zPOVDKNxq95W
 E3qtrPVVdxEp5SlpFRozv6GLYRPYwk9VWxxQCoORSIhyOJL3P8ZZJRzBNP4WQ+Es8XQr
 j9PnGtPid5jPqpk2Q7gVyns/lxCtVohkAeWm8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FjiYqubKBXS7ZvYOxxCl827BBeUF7k6PM5EHfi+VLgs=;
 b=5ANmBq/yreg4k9sRdE0q06kf9c19VAAyn2dJGBU9DPkfuLmdRcACLGAboVngJn976p
 XHVwg3UgoHx7dP2cq9fwAxQ6TTqUM7oNh90qV4KutPIgdXgfjitFNM3z7oxIxsTJG3Da
 Zxlqaz72pzkvKCTJN5TEalgkzItcwDuIQ3kMjmzhr5r5+6FigqFJESAthkEqwu/fWMU2
 E1iNprxpKfDR9j6eWV9uNaE53igR9zDi80o+9LwDeJthhDjD88rWasTDDxh4wJC9O9o/
 pcvyE0AYZzWyk3reXiQIrlflsHd6mt6C9S3iHACSktBdmMZEheDCd9Lyf8XqsuiysDZV
 h62g==
X-Gm-Message-State: ANoB5pmNS5zXoy5V8YvBj5gP7ibOjnLWthQDLdQtJtEJ4w1Pvkej95jH
 CIeDe4DdCOu+7c5GlddKQL7NA/H+Jd2+D5uHKAM=
X-Google-Smtp-Source: AA0mqf6iOJNV7kT8gxfSAc8KtiavUwqBmlUvfWaqocGD181us8JCxESmWe8R7ShSA2AC0fuI92b52w==
X-Received: by 2002:a17:906:86ca:b0:7c0:f2cf:23fb with SMTP id
 j10-20020a17090686ca00b007c0f2cf23fbmr26859020ejy.52.1671145058009; 
 Thu, 15 Dec 2022 14:57:38 -0800 (PST)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com.
 [209.85.221.51]) by smtp.gmail.com with ESMTPSA id
 jx14-20020a170906ca4e00b007b47749838asm160144ejb.45.2022.12.15.14.57.37
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Dec 2022 14:57:37 -0800 (PST)
Received: by mail-wr1-f51.google.com with SMTP id u12so815377wrr.11
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 14:57:37 -0800 (PST)
X-Received: by 2002:a5d:4943:0:b0:242:3ca3:b7bd with SMTP id
 r3-20020a5d4943000000b002423ca3b7bdmr18907754wrs.583.1671145056890; Thu, 15
 Dec 2022 14:57:36 -0800 (PST)
MIME-Version: 1.0
References: <1670967848-31475-1-git-send-email-quic_khsieh@quicinc.com>
 <1670967848-31475-3-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n52eHYCqxUJqQXoaQ8vyqCk-QfouSun+zUp3yo5DufWbwg@mail.gmail.com>
 <b38af164-08bc-07e7-dfaf-fb4d6d89d7db@quicinc.com>
 <CAE-0n53Cb6TFGfM6AYup5aP4=24j0ujVPi463oVqmzfNV2B4RA@mail.gmail.com>
 <011c1ce3-605a-1ad5-d7df-b91e8c6808bc@linaro.org>
In-Reply-To: <011c1ce3-605a-1ad5-d7df-b91e8c6808bc@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 15 Dec 2022 14:57:25 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VPMKz4uR_Y4SXy6ghmfciiTBBmQM9jVj2hObcPukS5KQ@mail.gmail.com>
Message-ID: <CAD=FV=VPMKz4uR_Y4SXy6ghmfciiTBBmQM9jVj2hObcPukS5KQ@mail.gmail.com>
Subject: Re: [PATCH v12 2/5] dt-bindings: msm/dp: add data-lanes and
 link-frequencies property
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
Cc: devicetree@vger.kernel.org, quic_sbillaka@quicinc.com,
 freedreno@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 quic_abhinavk@quicinc.com, sean@poorly.run, andersson@kernel.org,
 konrad.dybcio@somainline.org, vkoul@kernel.org,
 dri-devel@lists.freedesktop.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 robh+dt@kernel.org, agross@kernel.org, linux-arm-msm@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Dec 15, 2022 at 1:12 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 15/12/2022 02:38, Stephen Boyd wrote:
> > Quoting Kuogee Hsieh (2022-12-14 14:56:23)
> >>
> >> On 12/13/2022 3:06 PM, Stephen Boyd wrote:
> >>> Quoting Kuogee Hsieh (2022-12-13 13:44:05)
> >>>> Add both data-lanes and link-frequencies property into endpoint
> >>> Why do we care? Please tell us why it's important.
> >
> > Any response?
> >
> >>>> @@ -193,6 +217,8 @@ examples:
> >>>>                    reg = <1>;
> >>>>                    endpoint {
> >>>>                        remote-endpoint = <&typec>;
> >>>> +                    data-lanes = <0 1>;
> >>>> +                    link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
> >>>>                    };
> >>> So far we haven't used the output port on the DP controller in DT.
> >>>
> >>> I'm still not clear on what we should do in general for DP because
> >>> there's a PHY that actually controls a lane count and lane mapping. In
> >>> my mental model of the SoC, this DP controller's output port is
> >>> connected to the DP PHY, which then sends the DP lanes out of the SoC to
> >>> the next downstream device (i.e. a DP connector or type-c muxer). Having
> >>> a remote-endpoint property with a phandle to typec doesn't fit my mental
> >>> model. I'd expect it to be the typec PHY.
> >> ack
> >>>
> >>> That brings up the question: when we have 2 lanes vs. 4 lanes will we
> >>> duplicate the data-lanes property in the PHY binding? I suspect we'll
> >>> have to. Hopefully that sort of duplication is OK?
> >> Current we have limitation by reserve 2 data lanes for usb2, i am not
> >> sure duplication to 4 lanes will work automatically.
> >>>
> >>> Similarly, we may have a redriver that limits the link-frequencies
> >>> property further (e.g. only support <= 2.7GHz). Having multiple
> >>> link-frequencies along the graph is OK, right? And isn't the
> >>> link-frequencies property known here by fact that the DP controller
> >>> tells us which SoC this controller is for, and thus we already know the
> >>> supported link frequencies?
> >>>
> >>> Finally, I wonder if we should put any of this in the DP controller's
> >>> output endpoint, or if we can put these sorts of properties in the DP
> >>> PHY binding directly? Can't we do that and then when the DP controller
> >>> tries to set 4 lanes, the PHY immediately fails the call and the link
> >>> training algorithm does its thing and tries fewer lanes? And similarly,
> >>> if link-frequencies were in the PHY's binding, the PHY could fail to set
> >>> those frequencies during link training, returning an error to the DP
> >>> controller, letting the training move on to a lower frequency. If we did
> >>> that this patch series would largely be about modifying the PHY binding,
> >>> updating the PHY driver to enforce constraints, and handling errors
> >>> during link training in the DP controller (which may already be done? I
> >>> didn't check).
> >>
> >>
> >> phy/pll have different configuration base on link lanes and rate.
> >>
> >> it has to be set up before link training can start.
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
>
> Now let's discuss the data lanes. Currently we have them in the DP
> property itself. Please correct me if I'm wrong, but I think that we can
> drop it for all the practical purposes. Judging by the DP compat string
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

For the most part, I'll let others debate the best way to represent
this data, but I'll comment that the above statement isn't really
correct. Specifically it's wrong to say that eDP is 2 lanes and DP is
2/4 lanes. I will say:

* An eDP display could support 1, 2, or 4 lanes.
* An eDP controller could support 1, 2, or 4 lanes.
* A board may wire up 1, 2, or 4 lanes.

Thus if you have an eDP controller that should be capable of 4 lanes
and an eDP panel that says it's capable of 4 lanes, you still might
need to use a 2 lane configuration because a board only wired up 2 of
the lanes. IMO the number of lanes that are wired up should be in the
device tree somewhere because that's where this board limit should be
defined.

Similarly, you could have an eDP controller that supports 4 lanes, you
may wire 4 lanes off the board, but an eDP panel may only support 1 or
2 lanes. This is handled by querying the panel and asking how many
lanes it supports.

-Doug
