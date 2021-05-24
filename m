Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C30238E1B2
	for <lists+dri-devel@lfdr.de>; Mon, 24 May 2021 09:31:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A3556E10E;
	Mon, 24 May 2021 07:31:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 444706E10A;
 Mon, 24 May 2021 07:31:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4032160E0B;
 Mon, 24 May 2021 07:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621841464;
 bh=cREJ80BL8BLuZgT+HaJzUef/mFV18kZDbQk7m7I+jPU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eJsdxDzaBy1arpXCQzikBLvfQrnAFDhoK+HcBFvtv3nagX2qfuPSnkbjdGF08OcO5
 LxSa8cp+3d/TCLTvb+JZXBI3rDzi4/gYnY2M2X09TKGi3EyKitxSdi+jybFOSKXhU1
 r4gxzWQwFu+KcVhrcT9a7e9culSTiL1jbHz4mJ/mDSIIpun9+9Xl7wfUAUO1vbu1vo
 RFCDb9AzDRCvPsJ++HcipaCTdMfWSXzM+OsuD8E1jYFNlNhIiRpO3pRUZA+cg3O3Vl
 eTNML0luuoMeL10sXJ53apRLzlM2Bs1y53gg0pd9ndu1bx+MLMP+f5FSmF2QT4ihQJ
 BH3AMOgbVEa7A==
Date: Mon, 24 May 2021 13:00:59 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [RFC PATCH 02/13] dt-bindings: msm/dsi: Document Display Stream
 Compression (DSC) parameters
Message-ID: <YKtWM+BYeIA+P+55@vkoul-mobl.Dlink>
References: <20210521124946.3617862-1-vkoul@kernel.org>
 <20210521124946.3617862-3-vkoul@kernel.org>
 <20210521144237.GZ2484@yoga>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210521144237.GZ2484@yoga>
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
Cc: devicetree@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Abhinav Kumar <abhinavk@codeaurora.org>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21-05-21, 09:42, Bjorn Andersson wrote:
> On Fri 21 May 07:49 CDT 2021, Vinod Koul wrote:
> 
> > DSC enables streams to be compressed before we send to panel. This
> > requires DSC enabled encoder and a panel to be present. So we add this
> > information in board DTS and find if DSC can be enabled and the
> > parameters required to configure DSC are added to binding document along
> > with example
> > 
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> >  .../devicetree/bindings/display/msm/dsi.txt       | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/msm/dsi.txt b/Documentation/devicetree/bindings/display/msm/dsi.txt
> > index b9a64d3ff184..83d2fb92267e 100644
> > --- a/Documentation/devicetree/bindings/display/msm/dsi.txt
> > +++ b/Documentation/devicetree/bindings/display/msm/dsi.txt
> > @@ -48,6 +48,13 @@ Optional properties:
> >  - pinctrl-n: the "sleep" pinctrl state
> >  - ports: contains DSI controller input and output ports as children, each
> >    containing one endpoint subnode.
> > +- qcom,mdss-dsc-enabled: Display Stream Compression (DSC) is enabled
> > +- qcom,mdss-slice-height: DSC slice height in pixels
> > +- qcom,mdss-slice-width: DSC slice width in pixels
> > +- qcom,mdss-slice-per-pkt: DSC slices per packet
> > +- qcom,mdss-bit-per-component: DSC bits per component
> > +- qcom,mdss-bit-per-pixel: DSC bits per pixel
> > +- qcom,mdss-block-prediction-enable: Block prediction mode of DSC enabled
> >  
> >    DSI Endpoint properties:
> >    - remote-endpoint: For port@0, set to phandle of the connected panel/bridge's
> > @@ -188,6 +195,14 @@ Example:
> >  		qcom,master-dsi;
> >  		qcom,sync-dual-dsi;
> >  
> > +		qcom,mdss-dsc-enabled;
> 
> To me the activation of DSC seems to be a property of the panel.

I think there are three parts to the problem
1. Panel needs to support it
2. Host needs to support it
3. Someone needs to decide to use when both the above conditions are
met.

There are cases where above 1, 2 will be satisfied, but we might be okay
without DSC too.. so how to decide when to do DSC :)

I feel it is more of a system property. And I also think that these
parameters here are host configuration and not really for panel...

> 
> > +		qcom,mdss-slice-height = <16>;
> > +		qcom,mdss-slice-width = <540>;
> > +		qcom,mdss-slice-per-pkt = <1>;
> > +		qcom,mdss-bit-per-component = <8>;
> > +		qcom,mdss-bit-per-pixel = <8>;
> > +		qcom,mdss-block-prediction-enable;
> 
> Which of these properties relates to the DSC encoder and what needs to
> be agreed with the sink? Can't we derive e.g. bpp from the information
> we have from the attached panel already?

Let me go back and check on this a bit more

Thanks
-- 
~Vinod
