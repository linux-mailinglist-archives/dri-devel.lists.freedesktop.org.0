Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B296C7847
	for <lists+dri-devel@lfdr.de>; Fri, 24 Mar 2023 07:52:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5D6F10E4F0;
	Fri, 24 Mar 2023 06:52:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F3B010E4F0;
 Fri, 24 Mar 2023 06:52:53 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8D380B822F0;
 Fri, 24 Mar 2023 06:52:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66CBDC433EF;
 Fri, 24 Mar 2023 06:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679640770;
 bh=eAgzktUw36k84XyIpPeAFS22zFe2LwUnrI5YTkK3tLk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Uy30E47500cQwy4yveoh3p8sqXsEoe+5WtY81PxbQuING23HmwERsmB7HB8++fsRL
 6tf9dyoa+9lOSJDTyt8wAonTHUJ0J2SrrJaC/GykO8O2X81R5HlxhLGQiOswPNt15v
 LBKYrhQ/4EyL5pWH9aYSkZf0utMxXoAMTpLO+bozn4KB0AlAclLd69fkP65H8p14bB
 dQ4qZmtsnGVZ6bOEqV+QlcvaokRXCD0k2xn1sCYyZj8BvIQfmiZGbrrSS4IhJH2lFf
 AeuQ51n2upKFnkTasj7teSd/zFmIgybVLp+nXod5NVPr4G+lsLl+ScgH1UzpcAA9Nh
 FeR0MtGg+uDTg==
Date: Thu, 23 Mar 2023 23:52:47 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 7/8] arm64: dts: qcom: sm8450: remove invalid reg-names
 from ufs node
Message-ID: <20230324065247.GA9598@sol.localdomain>
References: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-0-3ead1e418fe4@linaro.org>
 <20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-7-3ead1e418fe4@linaro.org>
 <9614782e-0d78-e8f2-a438-452cfa86f80b@linaro.org>
 <316d7d7d-b370-36e1-648a-400447d2dd47@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <316d7d7d-b370-36e1-648a-400447d2dd47@linaro.org>
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
Cc: Alim Akhtar <alim.akhtar@samsung.com>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bart Van Assche <bvanassche@acm.org>, linux-scsi@vger.kernel.org,
 Lee Jones <lee@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>,
 Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
 Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Avri Altman <avri.altman@wdc.com>,
 Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>,
 Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Neil,

On Thu, Mar 23, 2023 at 02:10:44PM +0100, Neil Armstrong wrote:
> Hi,
> 
> On 23/03/2023 11:49, Krzysztof Kozlowski wrote:
> > On 23/03/2023 11:25, Neil Armstrong wrote:
> > > Fixes the following DT bindings check error:
> > > ufshc@1d84000: Unevaluated properties are not allowed ('reg-names' was unexpected)
> > > 
> > > Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> > > ---
> > >   arch/arm64/boot/dts/qcom/sm8450.dtsi | 1 -
> > >   1 file changed, 1 deletion(-)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> > > index ef9bae2e6acc..8ecc48c7c5ef 100644
> > > --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> > > @@ -3996,7 +3996,6 @@ ufs_mem_hc: ufshc@1d84000 {
> > >   				     "jedec,ufs-2.0";
> > >   			reg = <0 0x01d84000 0 0x3000>,
> > >   			      <0 0x01d88000 0 0x8000>;
> > > -			reg-names = "std", "ice";
> > 
> > This is also part of:
> > https://lore.kernel.org/linux-arm-msm/20230308155838.1094920-8-abel.vesa@linaro.org/#Z31arch:arm64:boot:dts:qcom:sm8450.dtsi
> > but I actually wonder whether you just missed some binding patch?
> 
> I'm aware of Abel's RFC patchset to support shared ICE, but this is a cleanup of the current DT,
> and the current bindings schema doesn't document reg-names.
> 

The ufs-qcom driver accesses the "ice" registers by name, so the reg-names can't
be removed from the device tree.  A few months ago there was a patch to fix the
device tree schema for qcom,ufs to include the reg-names.  It looks like that
patch got missed, though:
https://lore.kernel.org/r/20221209-dt-binding-ufs-v2-2-dc7a04699579@fairphone.com

- Eric
