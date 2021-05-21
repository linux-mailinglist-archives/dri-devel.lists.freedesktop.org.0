Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C4738CFE8
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 23:29:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D03586E899;
	Fri, 21 May 2021 21:29:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com
 [IPv6:2607:f8b0:4864:20::c36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71BA86E899
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 21:29:20 +0000 (UTC)
Received: by mail-oo1-xc36.google.com with SMTP id
 s20-20020a4ae9940000b02902072d5df239so4894634ood.2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 14:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=zwLYpS9p+8pJmcHuXNBolppRUtNsTbIPmp+o6UQN8KY=;
 b=QtSBZYDh6GXubEPHb5E6TM+CGkEttGlt5INDzQJsT5WtE/0MFFvJhO7gbj3+Q4VeqP
 Gra4TjrLaTsgPaETf4ffiTizTTRX6QPUdE9WKtw9XQoyJ6h70L7k1R6T81ghVNTBziD7
 R3uada59gAbc3/ENK6NowtwkdkjnmhqV9mfXemPzQJzZDnM7lBSpB/4csFqbGTLhO+Xx
 LxCryxs3M7PUB1zri84mcdXv5MDouCR5BQ0ymA5H2+N7NhciVn0NdFe8GY0fT2Karlmq
 ysO9amHItoswmTqNRVDqi2LLuIWx8bhO6LQHf6iz32OyhKvY5PzoYvlD/hZtNaNE07ij
 BPwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zwLYpS9p+8pJmcHuXNBolppRUtNsTbIPmp+o6UQN8KY=;
 b=lncnAjZTqNUnG/ZxO+uwp8sZ+WBF3reacEvBGsFbIE6SKdDXoFs3vVfU/UZpCS3xin
 cc/PAcdKVUuoh5y94H34/R6ordxMpRD5YllPH7U0Npw1qC7kB0iWFuE9nwFUTXwta2MF
 HF3i66pJc/clrq4896UVNpdirUyX5waqyvylxtb//JzcZ4Yx25Gb2gpwKFwfGoG7thAT
 wsk4F7fmSDFTOzWF2tKf4vIfiXxjhacz3zP3m9WIAUAlI97iIbUIYJjhSXVvIxHGmGrG
 KUCsGmTjKL3yS9tb+7LVtW+A4WuNovIl/fmXUBLFpTTBfBF4zgtQXlEol/9NdwwwtZ6H
 2WRA==
X-Gm-Message-State: AOAM531g35CrjnC1xw551lxKjQ41ka9l+t522tB0A1DkncQin/UMuVge
 YbuNb6CnCgwPJ/TWsXkPK85jjw==
X-Google-Smtp-Source: ABdhPJz3VBmFLhgkEFqyEA6f6S120M4rxSxkrTuWLk6tRMZx5/wC8POdyrzrinnm98ZUs5b0qJv3/A==
X-Received: by 2002:a4a:4581:: with SMTP id y123mr9685400ooa.33.1621632559601; 
 Fri, 21 May 2021 14:29:19 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id x31sm1531434ota.24.2021.05.21.14.29.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 May 2021 14:29:19 -0700 (PDT)
Date: Fri, 21 May 2021 16:29:16 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v17 1/4] dt-bindings: msm: disp: add yaml schemas for DPU
 bindings
Message-ID: <20210521212916.GG2484@yoga>
References: <1621592844-6414-1-git-send-email-mkrishn@codeaurora.org>
 <20210521160029.GA2484@yoga>
 <CAE-0n53y2_icuPf+j8hd1hGyWRbD2V0Fye+aGSe0M9zku_0DOA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE-0n53y2_icuPf+j8hd1hGyWRbD2V0Fye+aGSe0M9zku_0DOA@mail.gmail.com>
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
Cc: sean@poorly.run, Krishna Manikandan <mkrishn@codeaurora.org>,
 vinod.koul@linaro.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, abhinavk@codeaurora.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dianders@chromium.org, khsieh@codeaurora.org, robh+dt@kernel.org,
 tanmay@codeaurora.org, kalyan_t@codeaurora.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri 21 May 15:51 CDT 2021, Stephen Boyd wrote:

> Quoting Bjorn Andersson (2021-05-21 09:00:29)
> > On Fri 21 May 05:27 CDT 2021, Krishna Manikandan wrote:
> > > diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
> > [..]
> > > +      ports:
> > > +        $ref: /schemas/graph.yaml#/properties/ports
> > > +        description: |
> > > +          Contains the list of output ports from DPU device. These ports
> > > +          connect to interfaces that are external to the DPU hardware,
> > > +          such as DSI, DP etc. Each output port contains an endpoint that
> > > +          describes how it is connected to an external interface.
> > > +
> > > +        properties:
> > > +          port@0:
> > > +            $ref: /schemas/graph.yaml#/properties/port
> > > +            description: DPU_INTF1 (DSI1)
> > > +
> > > +          port@2:
> > > +            $ref: /schemas/graph.yaml#/properties/port
> > > +            description: DPU_INTF0 (DP)
> >
> > Why is port@0 INTF1 and why is port@2 INTF0? In the binding you're
> > translating the two ports that are described are 0 and 1, representing
> > INTF1 and INTF2, or DSI1 and DSI2, respectively.
> >
> > Further more, I have a need for somehow describing the pairing of 4 DP
> > INTFs (INTF 0, 3, 4 and 5) and how they are connected to the 3+1 DP+eDP
> > controllers.
> >
> > Downstream this seems to be handled by adding cell-index to the DP
> > controllers and then matching that against the numbering in the driver's
> > INTF array. But rather than adding cell-index to map this, can't we
> > define that the port index is the INTF-number here?
> >
> >
> > This would obviously break compatibility with existing DTBs, but we
> > could start by doing it selectively for the new compatibles, fix up the
> > existing dts files and then drop the selective application after 1 or 2
> > LTS releases.
> 
> I requested that the existing DT not change a while ago when the DP
> interface was being added to this binding. Is it possible to figure out
> what interface it is that the port is for from the binding? It feels
> like the problem is that the driver wants to look through the graph and
> make connectors for each one, but it doesn't know what type of connector
> to make.

Today there's a single priv->dp pointer which is initialized as the one
and only displayport controller component is bound.
_dpu_kms_set_encoder_mode() has no knowledge about which interface this
single controller is attached to, so dpu_encoder_setup_display() will
always just pick INTF_DP index 0.

So in its current form if your single DP port isn't sitting on the
platform's first DP INTF you need to hack dpu_hw_catalog and remove the
previous ones.

But with my desire to reuse the DP controller code for eDP, and the fact
that I have 3 DP controllers in my laptop we need something more.

But after considering my proposal further I realized that it is too
static for my use case anyway. SC8180x has INTF 0 and 4 are wired to
the DP controllers associated with the two primary USB ports and then
INTF 3 is dynamically switched between them for MST purposes.

So using port indices would prevent me from doing this dynamic dance.

Regards,
Bjorn
