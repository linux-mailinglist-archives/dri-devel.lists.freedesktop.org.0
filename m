Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F23A438CF5B
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 22:51:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 592F66F909;
	Fri, 21 May 2021 20:51:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C99B6F909
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 20:51:31 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id b25so20935009oic.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 13:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=l3rd5AGI0TAgU4dtT99rPSZ8nP9k8iKog4797AOuSyg=;
 b=BvqrmKhXYuSofPpie5wCq1uz0GOh3zVoi+zkwMXzyCc1/ZumnWykKUQcPuUQ7k78IZ
 1mgXbD7C0AswJZfNAk6Ep/GcnyG8oSwA+ySHdMg8R57kGPfEhIFjzEW+Mrl1RV4kkkQh
 S5FesVuR9gRmM8T0fihLkf3blfyX90vsRUUIg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=l3rd5AGI0TAgU4dtT99rPSZ8nP9k8iKog4797AOuSyg=;
 b=IBPJA9Jb1taEesYwFBIU1hSh5GKhnuH9GGveozixzbauP4pnfNMTMvTy3PumlprEmk
 ZUtRoAPOH1+Q+9hSee/UkR9Sak+gQammFuhdUQWHAi1dkuAdvSL1YYb8ffZCTBGxqBQu
 hndJNfoH46UrS18qzDCzTmvcxAoSksxV/ZDQql85f4+wOiW8NiTsQz+XRYwQluDXGNL4
 4REmABqfspDVM2ZCU9nB+ZmQflt8hgMYSPVSqeuKG8YkczPJKt/7+9hoHDH/6vlLzIfu
 1nFk4iMwszzKh0MTk7UBFxXVDBNc4bheMO9Xt8jSgy7c7GgeLou5Mfxpt1x8+hOqNDH6
 L33w==
X-Gm-Message-State: AOAM530FAw7JEn7zPxl7tzSAXPu+5fo5W1pnCc/s5DskQ50pZcvnUELC
 ZNiZhwv8R1k659BhjS9m0ugXJMZKu8AFhDqxpkoNzg==
X-Google-Smtp-Source: ABdhPJy8yyDStkfnRUcpaPHXw8vmuuF1l+lnjun1dIZYi3XPD6IA6ZpnNyOOiz7CIUPzpV6TIwk8LLzDT0k/qiDtLHg=
X-Received: by 2002:aca:654d:: with SMTP id j13mr3622784oiw.125.1621630290832; 
 Fri, 21 May 2021 13:51:30 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 21 May 2021 13:51:30 -0700
MIME-Version: 1.0
In-Reply-To: <20210521160029.GA2484@yoga>
References: <1621592844-6414-1-git-send-email-mkrishn@codeaurora.org>
 <20210521160029.GA2484@yoga>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Fri, 21 May 2021 13:51:30 -0700
Message-ID: <CAE-0n53y2_icuPf+j8hd1hGyWRbD2V0Fye+aGSe0M9zku_0DOA@mail.gmail.com>
Subject: Re: [PATCH v17 1/4] dt-bindings: msm: disp: add yaml schemas for DPU
 bindings
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Krishna Manikandan <mkrishn@codeaurora.org>
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
Cc: sean@poorly.run, devicetree@vger.kernel.org, vinod.koul@linaro.org,
 linux-arm-msm@vger.kernel.org, abhinavk@codeaurora.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dianders@chromium.org, khsieh@codeaurora.org, robh+dt@kernel.org,
 tanmay@codeaurora.org, kalyan_t@codeaurora.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Bjorn Andersson (2021-05-21 09:00:29)
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

I requested that the existing DT not change a while ago when the DP
interface was being added to this binding. Is it possible to figure out
what interface it is that the port is for from the binding? It feels
like the problem is that the driver wants to look through the graph and
make connectors for each one, but it doesn't know what type of connector
to make.
