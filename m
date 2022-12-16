Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B136D64F1E9
	for <lists+dri-devel@lfdr.de>; Fri, 16 Dec 2022 20:44:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 044F510E61D;
	Fri, 16 Dec 2022 19:43:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 622FF10E61D
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Dec 2022 19:43:34 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id l8so3193025ljh.13
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Dec 2022 11:43:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5v3DTUUK9HWsuJ728YQdmI/3MYIJakXIG+/ypBoFlg4=;
 b=TR+keLRSOuNks+ort96TplixqpdCyIfwiFZDVGZ2bk29lCJRVgmJn9B4+aIZmNmpM6
 s25vYcbYQyNrC3sCYmveellFJPaEcgjhKfu6LbVe5A/hhf1bNMz0gkWPWXfEGRdmh64H
 AAN6KvYTlPfKrlHQJOjOebvLPHVTJt1E5TQK+Zo+dvfai4S9LJeVcPrxW29nPTwuQMeu
 dYm21n1BDa8/JquM0b7+Wra4o8gWWhCdg0yMMoTE6q/O/M/BBayA5Wg5Xv/UPwiaoy0m
 16csMKH8WYZo7llmb2nzF7TSeVTZtL2ifNc1umpbEh1ntmpdd8Xi3kGKRe1P9zMHmfCK
 ANqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5v3DTUUK9HWsuJ728YQdmI/3MYIJakXIG+/ypBoFlg4=;
 b=sBh1ARU8i/fRf2HquOplD8rdNYp5pSz2y72xHY7bkT7pXcj1VKRjOr2rWkf8QItvqc
 41CKBETRzYWUFzg+wjiYBMV3snAKzuFGEa+mupvnKzJr6tlFgjRX03VZbETEnl0RhZwl
 gf81PYhoBkwbfd+hshX/ZHL6J+bWm9HWZ49CC2ZByL3TWI/T3IOfI2Kq6EyvlmLBy0NF
 dqdfbH/98uYQ3uSQf8h9IKX+SLYdHB3RlCcYWtz/gYA66FCGagZRi3tae9oKCFTwhxW4
 aOEGw8uA6qx3jcri5wJLCwlJrbjunGcwMyxuZUdOBhLZrdGROs81ZioQAX0nYqUTCFkj
 vNxw==
X-Gm-Message-State: ANoB5pmBObxhQ5yg2V2c6wFK6CSHtTR2ZRH77STqp7Eyn0myLOrvYUK9
 8OGT7q+oZ09MZfRESnHJFQa1zA==
X-Google-Smtp-Source: AA0mqf7GCqmJ35fBBKyZlmxCpuJA/nqT6StlV5LbEr1iBaDaP9QNW9xMBWGks8bIH2qIOhSCXFui4Q==
X-Received: by 2002:a05:651c:1949:b0:276:acfb:4911 with SMTP id
 bs9-20020a05651c194900b00276acfb4911mr11050204ljb.36.1671219812520; 
 Fri, 16 Dec 2022 11:43:32 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 z5-20020a056512370500b004b564e1a4e0sm292295lfr.76.2022.12.16.11.43.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 11:43:31 -0800 (PST)
Message-ID: <b5653fce-de91-932a-fc12-d4e69fafe9d5@linaro.org>
Date: Fri, 16 Dec 2022 21:43:31 +0200
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
 <011c1ce3-605a-1ad5-d7df-b91e8c6808bc@linaro.org>
 <CAE-0n51fxiNX6N2WvXrXXjmGtiDk-SwnyikRnDEKaK-rug2-Ew@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAE-0n51fxiNX6N2WvXrXXjmGtiDk-SwnyikRnDEKaK-rug2-Ew@mail.gmail.com>
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

Krzysztof, there is a bunch of DTS code below. If you can comment on it 
(and on my understanding of the existing schemas) that would be great.

On 16/12/2022 04:16, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2022-12-15 13:12:49)
>> On 15/12/2022 02:38, Stephen Boyd wrote:
>>> Quoting Kuogee Hsieh (2022-12-14 14:56:23)
>>>>
>>>> Once link training start, then there are no any interactions between
>>>> controller and phy during link training session.
>>>
>>> What do you mean? The DP controller calls phy_configure() and changes
>>> the link rate. The return value from phy_configure() should be checked
>>> and link training should skip link rates that aren't supported and/or
>>> number of lanes that aren't supported.
>>
>> I'd toss another coin into the argument. We have previously discussed
>> using the link-frequencies property in the context of limiting link
>> speeds for the DSI. There we have both hardware (SoC) limitations and
>> the board limitations as in some cases the DSI lanes can not sustain
>> some high rate. I still hope for these patches to materialize at some point.
>>
>> For the DP this is more or less the same story. We have the hardware
>> (SoC, PHY, etc) limitations, but also we have the board/device
>> limitations. For example some of the board might not be able to support
>> HBR3 e.g. because of the PCB design. And while it might be logical to
>> also add the 'max bit rate' support to the eDP & combo PHYs, it
>> definitely makes sense to be able to limit the rate on the DP <->
>> `something' link.


This discussion made me review some parts of the bindings (and note that 
I was wrong in some of the cases in my previous mail).

> Honestly I don't think the PHY even makes sense to put the link rate
> property. In the case of Trogdor, the DP controller and DP PHY both
> support all DP link frequencies. The limiting factor is the TCPC
> redriver that is only rated to support HBR2. We don't describe the TCPC
> in DT because the EC controls it. This means we have to put the limit
> *somewhere*, and putting it in the DP output node is the only place we
> have right now. I would really prefer we put it wherever the limit is,
> in this case either in the EC node or on the type-c ports.
Yeah, the redriver kind of mixes the puzzle. We have one on the RB5 
board, and I could not find a good way to express it in the DT.

> 
> Another nice to have feature would be to support different TCPCs connected
> to the same DP port. We were considering doing this on Trogdor, where we
> would have a TCPC rated for HBR2 and another TCPC rated for HBR3 and
> then detect which TCPC was in use to adjust the supported link rates.
> We didn't do this though, so the idea got back-burnered.
> 
> When the SoC is directly wired to a DP connector, I'd expect the
> connector to have the link rate property. That's because the connector
> or the traces outside of the SoC will be the part that's limiting the
> supported frequencies, not the SoC. The graph would need to be walked to
> find the link rate of course. The PHY could do this just as much as the
> DP controller could.

Yes, I also thought about putting the frequencies in the connector 
first. But then, the video-interfaces.yaml describes these properties as 
a property of the link.

So the end result can look this way:

displayport_controller@ae900000 {
   phys = <&qmp_combo_phy 1>;


   ports {
     port@0 {
       endpoint {
         remote-endpoint = <&dpu_intf_out>;
       };
     };
     port@1 {
       dp_out: endpoint {
         remote-endpoint = <&dp_con_in>;
       };
     };
   };
};

dp-connector {
   compatible = "dp-connector";
   port {
     dp_con_in: endpoint {
       remote-endpoint = <&dp_out>;
     };
   };
};

In such case the data-lanes and link-frequencies logically fall into the 
dp_out node, in full accordance with the video-interfaces.yaml.

> 
>>
>> Now, for all the practical purposes this `something' for the DP is the
>> DP connector, the eDP panel or the USB-C mux (with the possible
>> redrivers in the middle).
>>
>> Thus I'd support Kuogee's proposal to have link-frequencies in the DP's
>> outbound endpoint. This is the link which will be driven by the data
>> stream from the Linux point of view. The PHY is linked through the
>> 'phys' property, but it doesn't participate in the USB-C (or in the
>> connector/panel) graph.
> 
> Why doesn't the PHY participate in the graph? The eDP panel could just
> as easily be connected to the eDP PHY if the PHY participated in the
> graph.

I think that for eDP we have a much simpler graph, which is more in tune 
with the dp-connector one:

displayport_controller@ae900000 {
   phys = <&qmp_edp_phy>;

   aux-bus {
     panel {
       port {
         panel_in: endpoint {
           remote-endpoint = <&dp_out>;
         };
       };
     };
   };

   ports {
     port@0 {
       endpoint {
         remote-endpoint = <&dpu_intf_out>;
       };
     };
     port@1 {
       dp_out: endpoint {
         remote-endpoint = <&panel_in>;
       };
     };
   };
};


> 
>>
>> Now let's discuss the data lanes. Currently we have them in the DP
>> property itself. Please correct me if I'm wrong, but I think that we can
>> drop it for all the practical purposes.
> 
> I vaguely recall that the driver was checking data-lanes to figure out
> how many lanes are usable.

Yes, I think so. However this binding doesn't follow the 
video-interfaces.yaml, thus I suggested moving the property to the 
proper place, the endpoint.

> This is another shortcut taken on Trogdor to
> work around a lack of complete DP bindings. We only support two lanes of
> DP on Trogdor.

How do you implement the rest of USB-C functionality on the Trogdor? Do 
you support USB role switching? Does EC use the DP_HPD GPIO to notify 
the DP controller about all the events?

>> Judging by the DP compat string
>> the driver can determine if it uses 2 lanes (eDP) or 4 lanes
>> (full-featured DP). In case of USB-C when the altmode dictates whether
>> to use 2 or 4 lanes, the TCPM (Type-C Port Manager) will negotiate the
>> mode and pin configuration, then inform the DP controller about the
>> selected amount of lanes. Then DP informs the PHY about the selection
>> (note, PHY doesn't have control at all in this scenario).
>>
>> The only problematic case is the mixed mode ports, which if I understand
>> correctly, can be configured either to eDP or DP modes. I'm not sure who
>> specifies and limits the amount of lanes available to the DP controller.
>>
> 
> This would depend on where we send the type-c message in the kernel. It
> really gets to the heart of the question too. Should the PHY be "dumb"
> and do whatever the controller tells it to do? Or should the PHY be
> aware of what's going on and take action itself? Note that the
> data-lanes property is also used to remap lanes. On sc7180 the lane
> remapping happens in the DP PHY, and then the type-c PHY can flip that
> too, so if we don't involve the PHY(s) in the graph we'll have to
> express this information in the DP controller graph and then pass it to
> the PHY from the controller. Similarly, when we have more dynamic
> configuration of the type-c PHY, where USB may or may not be used
> because the TCPM has decided to use 2 or 4 lanes of DP, the data-lanes
> property will only indicate lane mappings and not the number of lanes
> supported. We'll again have to express the number of lanes to the PHY by
> parsing the type-c messages.
> 
> It looks simpler to me if the PHY APIs push errors up to the caller for
> unsupported configurations. This will hopefully make it easier for the
> DP controller when the DP lanes are muxed onto a type-c port so that the
> controller doesn't have to parse type-c messages. Instead, the PHY will
> get the type-c message, stash away supported number of lanes and link
> rates and then notify the DP controller to retrain the link with the
> link training algorithm. A few steps of the link training may be
> skipped, but the type-c message parsing won't need to be part of the DP
> controller code. Said another way, the DP controller can stay focused on
> DP instead of navigating type-c in addition to DP.

Yes, not like the downstream. We have a separate TCPM instance, so this 
should be a part of the usb framework, not the DP.

> 
>  From a binding perspective, data-lanes/link-frequencies are part of the
> graph binding. Having a graph port without a remote-endpoint doesn't
> really make any sense. Therefore we should decide to either connect the
> PHY into the graph and constrain it via graph properties like
> data-lanes, or leave it disconnected and have the controller drive the
> PHY (or PHYs when we have type-c). The type-c framework will want the
> orientation control (the type-c PHY) to be part of the graph from the
> usb-c-connector. That way we can properly map the PHY pins to the
> flipped or not-flipped state of the cable. Maybe we don't need to
> connect the PHY to the DP graph? Instead there can be a type-c graph for
> the PHY, TCPM, etc. and a display graph for the display chain. It feels
> like that must not work somehow.



Just as a reminder:

tcpc: tcpc {
   connector {
     compatible = "usb-c-connector";
     ports {
       port@0 {
         con_hs_ep: endpoint {
           remote-endpoint = <&typec_hs_ep>;
         };
       };
       con_ss_ep: port@1 {
         endpoint {
           remote-endpoint = <&typec_ss_ep>;
         };
       };
       port@2 {
         con_sbu_ep: endpoint {
           remote-endpoint = <&typec_sbu_ep>;
         };
       };
     };
   };
};

Judging from the bindings and all the examples the HS connection should 
be implemented as:

usb@a6f8800 {
   compatible = "qcom,SoC-dwc3", "qcom,dwc3";
   usb@a600000 {
     // existing part
     compatible = "snps,dwc3";
     phys = <&qmp_hs_phy>, <&qmp_combo_phy 0>;

     // new properties per snps,dwc3.yaml
     usb-role-switch;
     port {
       usb_hs_ep: endpoint {
         remote-endpoint = <&con_hs_ep>;
       };
     };
   };
};

qmp_hs_phy: phy@88e3000 {
   #phy-cells = <1>;
};

qmp_combo_phy: phy@88e9000 {
   #phy-cells = <1>;
};

sbu-switch { // GPIO, FSA4480, CrOS EC, etc. See fcs,fsa4480.yaml
   orientation-switch;
   mode-switch;
   port {
     typec_sbu_ep: endpoint {
       remote-endpoint = <&con_sbu_ep>;
     };
   };
};

This is quite logical, as SBU lines from the connector are terminated at 
the switch.

Other devices land the SS lanes at the dwc3 controller (imx8mq-librem5, 
hi3660-hikey960), at the SS lanes switch (r8a774c0-cat874, 
beacon-renesom-baseboard) or at the TypeC PHY itself (rk3399-eaidk-610, 
rk3399-firefly, rk3399-orangepi, rk3399-pinebook-pro).

Thus I'd do the same as rk3399:

&qmp_combo_phy {
   port {
     typec_ss_ep: endpoint {
       remote-endpoint = <&con_ss_ep>;
     };
   };
};

Letting the combo PHY know the orientation would probably require 
additional setup, so we might end up with:

&qmp_combo_phy {
   orientation-switch;
   // maybe also mode-switch; ???
   ports {
     port@0 {
       typec_ss_ep: endpoint {
         remote-endpoint = <&con_ss_ep>;
       };
     };
     port@1 {
       phy_sbu_ep: endpoint {
         remote-endpoint = <&con_phy_sbu_ep>;
       };
     };
   };
};

&tcpc {
   connector {
     ports {
       port@2 {
         con_sbu_ep: endpoint@0 {
           remote-endpoint = <&typec_sbu_ep>;
         };
         con_phy_sbu_ep: endpoint@0 {
           remote-endpoint = <&phy_sbu_ep>;
         };
       };
     };
   };
};

OR:

&qmp_combo_phy {
   orientation-switch;
   // maybe also mode-switch; ???
   ports {
     port@0 {
       typec_ss_ep: endpoint {
         remote-endpoint = <&con_ss_ep>;
       };
     };
     port@1 {
       phy_sbu_ep: endpoint {
         remote-endpoint = <&switch_sbu_ep>;
       };
     };
   };
};

sbu-switch { // GPIO, FSA4480, CrOS EC, etc. See fcs,fsa4480.yaml
   orientation-switch;
   mode-switch;
   ports {
     port@0 {
       typec_sbu_ep: endpoint {
         remote-endpoint = <&con_sbu_ep>;
       };
     };
     port@1 {
       switch_sbu_ep: endpoint {
         remote-endpoint = <&phy_sbu_ep>;
       };
     };
};

I can not select, which one suits better in this case, slight preference 
for the second implementation, as it follows the hardware design.

The redriver then can either be sitting near the EP ports, or be 
implemented in a following way, replacing the switch.

&qmp_combo_phy {
   orientation-switch;
   // maybe also mode-switch; ???
   ports {
     port@0 {
       phy_ss_ep: endpoint {
         remote-endpoint = <&re_ss_ep>;
       };
     };
     port@1 {
       phy_sbu_ep: endpoint {
         remote-endpoint = <&re_sbu_ep>;
       };
     };
   };
};

redriver {
   orientation-switch;
   mode-switch;
   ports {
     port@0 {
       typec_ss_ep: endpoint@0 {
         remote-endpoint = <&con_ss_ep>;
       };
       typec_sbu_ep: endpoint@1 {
         remote-endpoint = <&con_sbu_ep>;
       };
     };
     port@1 {
       re_ss_ep: endpoint@0 {
         remote-endpoint = <&phy_ss_ep>;
       };
       re_sbu_ep: endpoint@1 {
         remote-endpoint = <&phy_sbu_ep>;
       };
     };
   };
};

However all these examples leave the dp_out endpoint unconnected, there 
is no 'next DRM bridge' yet. Original Intel design suggested putting a 
single link from the tcpc node to the displayport controller in the 
corresponding altmode definition. Then the altmode controller would use 
the drm_connector_oob_hotplug_event() to notify the DP connector.

Since unlike Intel we use drm bridges, Bjorn's suggestion was to 
implement the drm_bridge inside pmic_glink (typec port manager in his 
case) and to link it to the dp_out.

This again raises a question regarding the redrivers. I do not think 
that we should add additional links from the redriver to the dp. Neither 
should it implement the drm_bridge.

> Either way, I don't see how or why these properties should be part of
> the DP controller. The controller isn't the limiting part, it's the
> redriver or the board/connector/panel that's the limiting factor. Walk
> the graph to find the lowest common denominator of link-frequencies and
> handle data-lanes either statically in the PHY or dynamically by parsing
> type-c messages. How does the eDP panel indicate only two lanes are
> supported when all four lanes are wired? I thought that link training
> just fails but I don't know.

I think you would agree that data-lanes is the property of the link. It 
might be the link between the DP and the panel, between the DP and 
redriver, or (in the theoretic case) a link between the redriver and the 
connector. Compare this with the DSI case, when we are putting the 
data-lanes property to the host-bridge or host-panel graph link.

For the link rates it's not that obvious, but I also think that 
redrivers can impose different limits on its links.

That said, I think we might end up implementing two different mechanisms 
for such limitations:

- The one coming from the dp_out endpoint (and thus a link to the next 
DP bridge/panel/connector/etc). The link specifies the number of data 
lanes and the maximum link rate.

- Another one implemented through the QMP combo PHY, knowing SoC 
limitations, being able to parse the link to the redriver or the USB-C 
connector and further query the link properties.

-- 
With best wishes
Dmitry

