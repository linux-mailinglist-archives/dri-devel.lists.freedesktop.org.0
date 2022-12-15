Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35EBE64E2D9
	for <lists+dri-devel@lfdr.de>; Thu, 15 Dec 2022 22:13:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99CC210E56F;
	Thu, 15 Dec 2022 21:13:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E89F10E0DF
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 21:12:52 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id j4so498006lfk.0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 13:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oDfDciBtjqio6Aoq7U3wQ0SeOeVeyEYOG//I4W1fW38=;
 b=UnXXlWM8X/g13GA0rI98mTs2FE1YDDEZD2wA/ssKIOF7/XkbeKEv9UstQYRte2vasf
 CCLXPKyjny6tD96g+fMA8chLChQ0H+zUN4owm0zKn9Z3unBEJDx5SvAq2g4vrVqK9Q9B
 EM9Kdenx2jK/NYzjrQ632TtlcjJXXNdV4IQXiQPp5p6KcRy7eZugU8zM/FUrsuIetAeX
 a+gZG+sfl+HastflB3ripCVU0UuQhypmXVdetGhSotKDC27MOGnio2dDkWbHd/sLBpH+
 8QGyUISJ24T9E1UAdNlV1uoxRHEDvozJEp5994KysBuRF8rACvgh7XppkYhpllmam8Rs
 0C/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oDfDciBtjqio6Aoq7U3wQ0SeOeVeyEYOG//I4W1fW38=;
 b=G1Gzxw1o1kVIjJaMhnk8K3aUuIKMXKve/m06N29SbjFtvAVcEehbmEZYJ7ZE05lVVp
 wh8mZCjazhOC8om4WbDwR3A4WPcg7DgpZKcUR2G3nKNRZB3xAJEFiUCBlMrxJbMeELGz
 W/6KYysbtW6W5Nx32RYaan1zo0hvOMDSaETagDMxR3elV3TzkiGAd92+5P/COeN3L5ba
 PkThOrBrqU5DfFONXOEWQkqz3hXmUiX2R0PA8yRcZV53+JA7Qn2l+NOour9m14ehIz0I
 JetMH/EuvKaC3L7Zs+Jh5nU4y0nBq8OvbbWODUIMr7dkMORk1PfSNgvRUBLWrhhBdJAC
 AY2A==
X-Gm-Message-State: AFqh2kpYHZ94GXMykkmqtNC5bzPcxKUWwBmJnbPMfFl29YeKeEDSoHqP
 OTHwW6ZLoaHDtiWNcDFsqmKKmA==
X-Google-Smtp-Source: AMrXdXvcBK0ZRDgSr8CNfaYfL6EIyq4QaWK6endXNbC4xNmAE0sgU4YT/cpftdG7G9hAOqvPWOR0tw==
X-Received: by 2002:a05:6512:1048:b0:4bc:df73:445c with SMTP id
 c8-20020a056512104800b004bcdf73445cmr1302727lfb.32.1671138770365; 
 Thu, 15 Dec 2022 13:12:50 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 a15-20020a056512200f00b004a46a9cebe2sm12674lfb.289.2022.12.15.13.12.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Dec 2022 13:12:49 -0800 (PST)
Message-ID: <011c1ce3-605a-1ad5-d7df-b91e8c6808bc@linaro.org>
Date: Thu, 15 Dec 2022 23:12:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v12 2/5] dt-bindings: msm/dp: add data-lanes and
 link-frequencies property
Content-Language: en-GB
To: Stephen Boyd <swboyd@chromium.org>, Kuogee Hsieh
 <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@gmail.com,
 andersson@kernel.org, daniel@ffwll.ch, devicetree@vger.kernel.org,
 dianders@chromium.org, dri-devel@lists.freedesktop.org,
 konrad.dybcio@somainline.org, krzysztof.kozlowski+dt@linaro.org,
 robdclark@gmail.com, robh+dt@kernel.org, sean@poorly.run, vkoul@kernel.org
References: <1670967848-31475-1-git-send-email-quic_khsieh@quicinc.com>
 <1670967848-31475-3-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n52eHYCqxUJqQXoaQ8vyqCk-QfouSun+zUp3yo5DufWbwg@mail.gmail.com>
 <b38af164-08bc-07e7-dfaf-fb4d6d89d7db@quicinc.com>
 <CAE-0n53Cb6TFGfM6AYup5aP4=24j0ujVPi463oVqmzfNV2B4RA@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAE-0n53Cb6TFGfM6AYup5aP4=24j0ujVPi463oVqmzfNV2B4RA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 15/12/2022 02:38, Stephen Boyd wrote:
> Quoting Kuogee Hsieh (2022-12-14 14:56:23)
>>
>> On 12/13/2022 3:06 PM, Stephen Boyd wrote:
>>> Quoting Kuogee Hsieh (2022-12-13 13:44:05)
>>>> Add both data-lanes and link-frequencies property into endpoint
>>> Why do we care? Please tell us why it's important.
> 
> Any response?
> 
>>>> @@ -193,6 +217,8 @@ examples:
>>>>                    reg = <1>;
>>>>                    endpoint {
>>>>                        remote-endpoint = <&typec>;
>>>> +                    data-lanes = <0 1>;
>>>> +                    link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
>>>>                    };
>>> So far we haven't used the output port on the DP controller in DT.
>>>
>>> I'm still not clear on what we should do in general for DP because
>>> there's a PHY that actually controls a lane count and lane mapping. In
>>> my mental model of the SoC, this DP controller's output port is
>>> connected to the DP PHY, which then sends the DP lanes out of the SoC to
>>> the next downstream device (i.e. a DP connector or type-c muxer). Having
>>> a remote-endpoint property with a phandle to typec doesn't fit my mental
>>> model. I'd expect it to be the typec PHY.
>> ack
>>>
>>> That brings up the question: when we have 2 lanes vs. 4 lanes will we
>>> duplicate the data-lanes property in the PHY binding? I suspect we'll
>>> have to. Hopefully that sort of duplication is OK?
>> Current we have limitation by reserve 2 data lanes for usb2, i am not
>> sure duplication to 4 lanes will work automatically.
>>>
>>> Similarly, we may have a redriver that limits the link-frequencies
>>> property further (e.g. only support <= 2.7GHz). Having multiple
>>> link-frequencies along the graph is OK, right? And isn't the
>>> link-frequencies property known here by fact that the DP controller
>>> tells us which SoC this controller is for, and thus we already know the
>>> supported link frequencies?
>>>
>>> Finally, I wonder if we should put any of this in the DP controller's
>>> output endpoint, or if we can put these sorts of properties in the DP
>>> PHY binding directly? Can't we do that and then when the DP controller
>>> tries to set 4 lanes, the PHY immediately fails the call and the link
>>> training algorithm does its thing and tries fewer lanes? And similarly,
>>> if link-frequencies were in the PHY's binding, the PHY could fail to set
>>> those frequencies during link training, returning an error to the DP
>>> controller, letting the training move on to a lower frequency. If we did
>>> that this patch series would largely be about modifying the PHY binding,
>>> updating the PHY driver to enforce constraints, and handling errors
>>> during link training in the DP controller (which may already be done? I
>>> didn't check).
>>
>>
>> phy/pll have different configuration base on link lanes and rate.
>>
>> it has to be set up before link training can start.
>>
>> Once link training start, then there are no any interactions between
>> controller and phy during link training session.
> 
> What do you mean? The DP controller calls phy_configure() and changes
> the link rate. The return value from phy_configure() should be checked
> and link training should skip link rates that aren't supported and/or
> number of lanes that aren't supported.

I'd toss another coin into the argument. We have previously discussed 
using the link-frequencies property in the context of limiting link 
speeds for the DSI. There we have both hardware (SoC) limitations and 
the board limitations as in some cases the DSI lanes can not sustain 
some high rate. I still hope for these patches to materialize at some point.

For the DP this is more or less the same story. We have the hardware 
(SoC, PHY, etc) limitations, but also we have the board/device 
limitations. For example some of the board might not be able to support 
HBR3 e.g. because of the PCB design. And while it might be logical to 
also add the 'max bit rate' support to the eDP & combo PHYs, it 
definitely makes sense to be able to limit the rate on the DP <-> 
`something' link.

Now, for all the practical purposes this `something' for the DP is the 
DP connector, the eDP panel or the USB-C mux (with the possible 
redrivers in the middle).

Thus I'd support Kuogee's proposal to have link-frequencies in the DP's 
outbound endpoint. This is the link which will be driven by the data 
stream from the Linux point of view. The PHY is linked through the 
'phys' property, but it doesn't participate in the USB-C (or in the 
connector/panel) graph.

Now let's discuss the data lanes. Currently we have them in the DP 
property itself. Please correct me if I'm wrong, but I think that we can 
drop it for all the practical purposes. Judging by the DP compat string 
the driver can determine if it uses 2 lanes (eDP) or 4 lanes 
(full-featured DP). In case of USB-C when the altmode dictates whether 
to use 2 or 4 lanes, the TCPM (Type-C Port Manager) will negotiate the 
mode and pin configuration, then inform the DP controller about the 
selected amount of lanes. Then DP informs the PHY about the selection 
(note, PHY doesn't have control at all in this scenario).

The only problematic case is the mixed mode ports, which if I understand 
correctly, can be configured either to eDP or DP modes. I'm not sure who 
specifies and limits the amount of lanes available to the DP controller.

-- 
With best wishes
Dmitry

