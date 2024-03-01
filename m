Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B315D86E7C0
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 18:52:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DEE610E120;
	Fri,  1 Mar 2024 17:52:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HrVAiMut";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8824E10E11D;
 Fri,  1 Mar 2024 17:52:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 62108619C8;
 Fri,  1 Mar 2024 17:52:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6F5CC433F1;
 Fri,  1 Mar 2024 17:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709315528;
 bh=eXoHHqlUv+ocYn2KKFi9ZKx6ERkFZTOcTcwpaPExuVI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HrVAiMutZQezfJbYV3TUqSN6fprFMBM/1O47qXOKKky/Ym8cG43fYrDXnI20zLv9Y
 QsmCu/fK9X4wOvuy+4yPp9VluDpMkz7ofkMzL3yOdJ9NcLCcBfEaXC7+4Gv8syNF8c
 uum0r18Id0vJu2MzhTVjx61Ae0YDKUkbX9tm2dxc9Ioytz6248wDLtu/J3RTlC8vQ8
 lSeYAd/4M0oFNwKaxqt71JBDnJIRw2s7xmgYy+POh4Cqmb4fKkFmYmQ0Y6R4o1Cuzc
 nSTBS6113X6qTIdNteQH0POeFH46qJDiCnADQQ/UcWHenY+HUY3I4l9B3L8LmH3/de
 vp+YA2GNpHBvA==
Date: Fri, 1 Mar 2024 11:52:05 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Abel Vesa <abel.vesa@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: display: msm: dp-controller:
 document X1E80100 compatible
Message-ID: <20240301175205.GB2438612-robh@kernel.org>
References: <20240222-x1e80100-display-refactor-connector-v2-0-bd4197dfceab@linaro.org>
 <20240222-x1e80100-display-refactor-connector-v2-1-bd4197dfceab@linaro.org>
 <a90dcd83-d158-4ec1-9186-0658c108afef@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a90dcd83-d158-4ec1-9186-0658c108afef@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 27, 2024 at 04:45:25PM +0100, Krzysztof Kozlowski wrote:
> On 22/02/2024 16:55, Abel Vesa wrote:
> > Add the X1E80100 to the list of compatibles and document the is-edp
> > flag. The controllers are expected to operate in DP mode by default,
> > and this flag can be used to select eDP mode.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> >  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > index ae53cbfb2193..ed11852e403d 100644
> > --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > @@ -27,6 +27,7 @@ properties:
> >            - qcom,sdm845-dp
> >            - qcom,sm8350-dp
> >            - qcom,sm8650-dp
> > +          - qcom,x1e80100-dp
> >        - items:
> >            - enum:
> >                - qcom,sm8150-dp
> > @@ -73,6 +74,11 @@ properties:
> >        - description: phy 0 parent
> >        - description: phy 1 parent
> >  
> > +  is-edp:
> > +    $ref: /schemas/types.yaml#/definitions/flag
> > +    description:
> > +      Tells the controller to switch to eDP mode
> 
> 
> DP controller cannot be edp, so property "is-edp" is confusing. Probably
> you want to choose some phy mode, so you should rather use "phy-mode"
> property. I am sure we've been here...

phy-mode belongs in the phy node though. Not that you couldn't look in 
the phy node and see, but everyone likes all the properties they need 
nicely packaged up in their driver's node.

> Anyway, if you define completely new property without vendor prefix,
> that's a generic property, so you need to put it in some common schema
> for all Display Controllers, not only Qualcomm.

I'm trying to unsee what the driver is doing... Hard-coding the 
connector type and some instance indices. Uhhhh! I'm sure I'm to blame 
for rejecting those in DT.

I've suggested connector nodes in the past. More generally, whatever is 
attached at the other end (as it could be a bridge rather than a 
connector) knows what mode is needed. It's simple negotiation. Each end 
presents what they support. You take the union of the list(s) and get 
the mode. If there's more than one, then the kernel or user gets to 
choose.

Qualcomm is not the only one with this problem. Solve it for everyone...

Rob
