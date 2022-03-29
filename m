Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3BC4EB10D
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 17:52:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E27E410EC01;
	Tue, 29 Mar 2022 15:52:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
 [209.85.210.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5807E10EC01;
 Tue, 29 Mar 2022 15:52:33 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id
 i11-20020a9d4a8b000000b005cda3b9754aso13024236otf.12; 
 Tue, 29 Mar 2022 08:52:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=53EmT+0Iq+omqog9hMr5TTHzAfJsIFc7d5dRnXaOt/M=;
 b=CeR+eyNa2pv0Ha7lJhw3In43tpS30MEZg1L70D8e4gqmpuZ1Nv7L7d0VHKafXTcfXX
 23hQgfGwAd4GpVt8+/Cy8rhkB6J/C1m661gastPx+ehUf6fivt8h4Wv/PiUZhPCo+HKl
 Pa7SgsOG9X4GxrwU/VHakE27l2HBzYnZ5qjhooDAcrHeFnVD4JNkBU1nk0iiojCHl9It
 nWCbeUnz9hNqmhA7esnMz0hcEnrFJnf61XZjaHdHeff+vuNuVxGwAlEuiRVBepp91+EC
 Vvm0/nKvNFx4aIYDTofKHfFsSfckkBOBoFm4DKTEgnwr0wvnHRj3ZsZ8uDKbmyhYa/XJ
 qKsA==
X-Gm-Message-State: AOAM532iNtO5Mq9deqxfbq1ZVLWLW9IeAH4/k3hPPx2OdbdnUA51d37U
 HBg97TfwKBa8PJpQWBUI9w==
X-Google-Smtp-Source: ABdhPJxC5Hfm9CPFftdhNmRBujVYhVRHBBUN06bjxcKnKO/caVZGn/GJf5+6eZLXAAmSoxm06F8jyA==
X-Received: by 2002:a9d:1991:0:b0:5cd:b2a1:5c50 with SMTP id
 k17-20020a9d1991000000b005cdb2a15c50mr1389734otk.217.1648569152513; 
 Tue, 29 Mar 2022 08:52:32 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 w7-20020a9d6387000000b005b2265711fcsm7520205otk.16.2022.03.29.08.52.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 08:52:31 -0700 (PDT)
Received: (nullmailer pid 753124 invoked by uid 1000);
 Tue, 29 Mar 2022 15:52:30 -0000
Date: Tue, 29 Mar 2022 10:52:30 -0500
From: Rob Herring <robh@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH] dt-bindings: display: msm: dsi: remove address/size cells
Message-ID: <YkMrPnRbsl3FBig8@robh.at.kernel.org>
References: <20220328152923.90623-1-krzysztof.kozlowski@linaro.org>
 <CAA8EJprWoxWwk5EWEfWdLquPR+2=u6V0-v1-+wHMHOk8HiEyNw@mail.gmail.com>
 <YkHtY9absUjmqmW7@matsya>
 <12b0056b-8032-452b-f325-6f36037b5a80@linaro.org>
 <CAL_Jsq+6rx0UU6ryH+z_8KLQqKKuhTCnh=Oft2F03bcze+EV0Q@mail.gmail.com>
 <YkKmPSesQfS6RLCD@matsya>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YkKmPSesQfS6RLCD@matsya>
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
Cc: freedreno <freedreno@lists.freedesktop.org>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Sean Paul <sean@poorly.run>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 29, 2022 at 12:01:52PM +0530, Vinod Koul wrote:
> On 28-03-22, 13:21, Rob Herring wrote:
> > On Mon, Mar 28, 2022 at 12:18 PM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> > >
> > > On 28/03/2022 19:16, Vinod Koul wrote:
> > > > On 28-03-22, 19:43, Dmitry Baryshkov wrote:
> > > >> On Mon, 28 Mar 2022 at 18:30, Krzysztof Kozlowski
> > > >> <krzysztof.kozlowski@linaro.org> wrote:
> > > >>>
> > > >>> The DSI node is not a bus and the children do not have unit addresses.
> > > >>>
> > > >>> Reported-by: Vinod Koul <vkoul@kernel.org>
> > > >>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > >>
> > > >> NAK.
> > > >> DSI panels are children of the DSI device tree node with the reg = <0>; address.
> > > >> This is the convention used by other platforms too (see e.g.
> > > >> arch/arm64/boot/dts/freescale/imx8mq-evk.dts).
> > > >
> > > > So we should add reg = 0, i will update my dtsi fix
> > > >
> > >
> > > To "ports" node? No. The reg=0 is for children of the bus, so the
> > > panels. How to combine both without warnings - ports and panel@0 - I
> > > don't know yet...
> > 
> > I don't think that should case a warning. Or at least it's one we turn off.
> 
> Well in this case I think we might need a fix:
> Here is the example quoted in the binding. We have ports{} and then the
> two port@0 and port@1 underneath.

It's the #address-cells/#size-cells under 'ports' that applies to 'port' 
nodes. As 'ports' has no address (reg) itself, it doesn't need 
#address-cells/#size-cells in its parent node.

> 
> So it should be okay to drop #address-cells/#size-cells from dsi node
> but keep in ports node...

Yes.

> Thoughts...?

But I thought a panel@0 node was being added? If so then you need to add 
them back.

Rob
