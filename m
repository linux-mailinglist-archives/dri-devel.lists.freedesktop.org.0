Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DAFD4ED3B7
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 08:05:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D947210FA1C;
	Thu, 31 Mar 2022 06:05:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B94A210FA1B;
 Thu, 31 Mar 2022 06:05:47 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C9A4861656;
 Thu, 31 Mar 2022 06:05:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2AFDC340ED;
 Thu, 31 Mar 2022 06:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648706743;
 bh=QQKn+Kv4FLipNOaxDBLqAUQ//ylLu2B/5Kt8RPNpRr4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fbInko8+mnPe6uxn0w7FVcGvtXjG+NE7LfwKIopJqKNt8OPhQaDArQMOt0qc8ge/t
 SLJoRK0tMmLrcbeSgGx6LtbRXc8qtzM/Be2+YkRBVmStrHi/VT2RMl8o14WGcwx1J1
 zIDZcTJU56GTnvNNDIk5SSzqqRj2OoHAvFlc+Ikjj0lNDPH349iGDORgJ2OWtMJ6Xp
 P4kxh8gOv+wANKWvGjqEzWIMsPOvxgiIapuvkjPBGGBJhdwDPwJpTiPXotmDdOjYKa
 QG96BQbQl0Ih7K5swrwEPWAXi7Kv402R/xuxng8j/zVMCxB4oigcKrQP4ENgLueBlf
 IUWluFcNjF4HQ==
Date: Thu, 31 Mar 2022 11:35:38 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: display: msm: dsi: remove address/size cells
Message-ID: <YkVEsqiRamfTmNi0@matsya>
References: <20220328152923.90623-1-krzysztof.kozlowski@linaro.org>
 <CAA8EJprWoxWwk5EWEfWdLquPR+2=u6V0-v1-+wHMHOk8HiEyNw@mail.gmail.com>
 <YkHtY9absUjmqmW7@matsya>
 <12b0056b-8032-452b-f325-6f36037b5a80@linaro.org>
 <CAL_Jsq+6rx0UU6ryH+z_8KLQqKKuhTCnh=Oft2F03bcze+EV0Q@mail.gmail.com>
 <YkKmPSesQfS6RLCD@matsya> <YkMrPnRbsl3FBig8@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YkMrPnRbsl3FBig8@robh.at.kernel.org>
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

On 29-03-22, 10:52, Rob Herring wrote:
> On Tue, Mar 29, 2022 at 12:01:52PM +0530, Vinod Koul wrote:
> > On 28-03-22, 13:21, Rob Herring wrote:
> > > On Mon, Mar 28, 2022 at 12:18 PM Krzysztof Kozlowski
> > > <krzysztof.kozlowski@linaro.org> wrote:
> > > >
> > > > On 28/03/2022 19:16, Vinod Koul wrote:
> > > > > On 28-03-22, 19:43, Dmitry Baryshkov wrote:
> > > > >> On Mon, 28 Mar 2022 at 18:30, Krzysztof Kozlowski
> > > > >> <krzysztof.kozlowski@linaro.org> wrote:
> > > > >>>
> > > > >>> The DSI node is not a bus and the children do not have unit addresses.
> > > > >>>
> > > > >>> Reported-by: Vinod Koul <vkoul@kernel.org>
> > > > >>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > > >>
> > > > >> NAK.
> > > > >> DSI panels are children of the DSI device tree node with the reg = <0>; address.
> > > > >> This is the convention used by other platforms too (see e.g.
> > > > >> arch/arm64/boot/dts/freescale/imx8mq-evk.dts).
> > > > >
> > > > > So we should add reg = 0, i will update my dtsi fix
> > > > >
> > > >
> > > > To "ports" node? No. The reg=0 is for children of the bus, so the
> > > > panels. How to combine both without warnings - ports and panel@0 - I
> > > > don't know yet...
> > > 
> > > I don't think that should case a warning. Or at least it's one we turn off.
> > 
> > Well in this case I think we might need a fix:
> > Here is the example quoted in the binding. We have ports{} and then the
> > two port@0 and port@1 underneath.
> 
> It's the #address-cells/#size-cells under 'ports' that applies to 'port' 
> nodes. As 'ports' has no address (reg) itself, it doesn't need 
> #address-cells/#size-cells in its parent node.
> 
> > 
> > So it should be okay to drop #address-cells/#size-cells from dsi node
> > but keep in ports node...
> 
> Yes.
> 
> > Thoughts...?
> 
> But I thought a panel@0 node was being added? If so then you need to add 
> them back.

I guess we should make this optional, keep it when adding panel@0 node
and skip for rest where not applicable..? Dmitry is that fine with you?

-- 
~Vinod
