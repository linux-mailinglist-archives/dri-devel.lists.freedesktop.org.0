Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A8A38CBA1
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 19:11:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 250706E0AB;
	Fri, 21 May 2021 17:11:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E88A6E0AB
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 17:11:38 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 i14-20020a9d624e0000b029033683c71999so7477861otk.5
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 10:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=e9JeVn1G8IdnIeIesci3+Ayk5EovOq0M3s+2FeKNFK0=;
 b=pvPG2IpXF0bJcf/z/J6X/Jv/vHW0axAut+lT9rP4IJIFi/HUxPlCmpuFAhpJqpu8Qm
 UKWNsaKRLrau75GJcP1RCp9U6Bjer9Z9dXkVlW74husfn10xGO2KrszYfsxXxprr0EXz
 Q2X7i3RQzM2yfE8HcE4/cfKQAUwL2f62pg9Q0FhUV3JfqIc6uD4J9EW7h4TLe5UwbpdY
 Ra3rqKrtZRBn9HfWadnIHfQ7Dz/cBqOK+eNhoShTmjYFetUdRqVcXACMtXFJFVv6gm2H
 /lpBq543BSbByfrbXjd1cCNvgLCnoxoVovGQfv96UBW+qBRctQ0R7dbuxielpsvbVPP/
 Qqng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=e9JeVn1G8IdnIeIesci3+Ayk5EovOq0M3s+2FeKNFK0=;
 b=gF4VwYrWRdIf9vmqg8iIQxO6YwxOguxy/fvA8PtHRWA8bYvRmdjqUUuJXJIIPlLbst
 zsiAMwbwoPYV/C8zKSClII+lywCzOdhosZxQMDzcTUV1FLyw7OMcMDViz/rDpWc2CQ/c
 wykaJoqqoMV4Vm9ZceeRrLa38JPKjQdXurIuSlhn1xdWhqKnUhgW7yfzFdSAvaU3koG2
 b3CL9KVfo8AleG1zW4jqiYSazb28fRirjkBoAuM2tttPPI9wS4hq5qDwXnQoE6/7v3W3
 XGwE1PlpKnKXkV8D5FQMa7CnyrYrXAA/+pfG+08ZkwUlnlqGFjuxzQjnlMlB63MAokUt
 T1iw==
X-Gm-Message-State: AOAM531XRZtRBqSK9mYapTbsQRvgCfeyfurcO1kUWxdGyXD4iXq+k2D3
 dkN8/yl/LcNSmr41CXHF1w26sg==
X-Google-Smtp-Source: ABdhPJyr6YEiNQNOwzD5WfXzXxLiSfPTTV2nKIC0FlJZRbbESbv1j2UsCVQtzVFeDjV+o96hBm31nQ==
X-Received: by 2002:a9d:453:: with SMTP id 77mr9684827otc.31.1621617097435;
 Fri, 21 May 2021 10:11:37 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id e26sm1209578oig.9.2021.05.21.10.11.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 May 2021 10:11:36 -0700 (PDT)
Date: Fri, 21 May 2021 12:11:34 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Krishna Manikandan <mkrishn@codeaurora.org>
Subject: Re: [PATCH v17 1/4] dt-bindings: msm: disp: add yaml schemas for DPU
 bindings
Message-ID: <20210521171134.GB2484@yoga>
References: <1621592844-6414-1-git-send-email-mkrishn@codeaurora.org>
 <20210521160029.GA2484@yoga>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210521160029.GA2484@yoga>
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
Cc: sean@poorly.run, devicetree@vger.kernel.org, dianders@chromium.org,
 vinod.koul@linaro.org, linux-arm-msm@vger.kernel.org, abhinavk@codeaurora.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, khsieh@codeaurora.org, robh+dt@kernel.org,
 tanmay@codeaurora.org, kalyan_t@codeaurora.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri 21 May 11:00 CDT 2021, Bjorn Andersson wrote:

> On Fri 21 May 05:27 CDT 2021, Krishna Manikandan wrote:
> > diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
> [..]
> > +      ports:
> > +        $ref: /schemas/graph.yaml#/properties/ports
> > +        description: |
> > +          Contains the list of output ports from DPU device. These ports
> > +          connect to interfaces that are external to the DPU hardware,
> > +          such as DSI, DP etc. Each output port contains an endpoint that
> > +          describes how it is connected to an external interface.
> > +
> > +        properties:
> > +          port@0:
> > +            $ref: /schemas/graph.yaml#/properties/port
> > +            description: DPU_INTF1 (DSI1)
> > +
> > +          port@2:
> > +            $ref: /schemas/graph.yaml#/properties/port
> > +            description: DPU_INTF0 (DP)
> 
> Why is port@0 INTF1 and why is port@2 INTF0? In the binding you're
> translating the two ports that are described are 0 and 1, representing
> INTF1 and INTF2, or DSI1 and DSI2, respectively.
> 
> Further more, I have a need for somehow describing the pairing of 4 DP
> INTFs (INTF 0, 3, 4 and 5) and how they are connected to the 3+1 DP+eDP
> controllers.
> 
> Downstream this seems to be handled by adding cell-index to the DP
> controllers and then matching that against the numbering in the driver's
> INTF array. But rather than adding cell-index to map this, can't we
> define that the port index is the INTF-number here?
> 
> 
> This would obviously break compatibility with existing DTBs, but we
> could start by doing it selectively for the new compatibles, fix up the
> existing dts files and then drop the selective application after 1 or 2
> LTS releases.
> 

In a chat with Rob I realized that my feedback here is unrelated to the
yaml conversion and any conclusions of this discussion should be a
separate patch anyways.

So with the two style issues below resolve you have my:

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

[..]
> > +examples:
[..]
> > +                   ports {
> > +                           #address-cells = <1>;
> > +                           #size-cells = <0>;
> > +
> > +                           port@0 {
> > +                                   reg = <0>;
> > +                                   dpu_intf1_out: endpoint {
> > +                                                  remote-endpoint = <&dsi0_in>;
> > +                                   };
> > +                           };
> > +
> > +                            port@2 {
> > +                                    reg = <2>;
> > +                                    dpu_intf0_out: endpoint {
> > +                                                   remote-endpoint = <&dp_in>;
> > +                                    };
> > +                            };
> 
> The indentation is inconsistent among the ports.
> 
> > +                   };
> > +         };
> > +    };
> > +...
> > diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
[..]
> > +      operating-points-v2: true
> 
> You have a blank line between all other properties, but not here.
> 
> > +      ports:

Regards,
Bjorn
