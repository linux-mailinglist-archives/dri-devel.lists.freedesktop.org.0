Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC8D60EDB8
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 04:00:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAFCF10E02F;
	Thu, 27 Oct 2022 02:00:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E19E789241;
 Thu, 27 Oct 2022 02:00:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 82565B8248F;
 Thu, 27 Oct 2022 02:00:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E53A7C433D6;
 Thu, 27 Oct 2022 02:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666836010;
 bh=fEmNsHQQ9juIELz/DqPpbf8dPuEX8/DoLTXLcXs/7vg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NLlYHemIJNjy8Vlfqm3abshkq+/C78tb/qpwJPNWeNURRUoggCTAScIoZLvTeYmKJ
 mNBdd+/m/ZyWpQ0CjCaWGjDl6uepoPpevVQNRghI4OgMISXIX37F19ZLjQvzQiC9yP
 NZok2HF26kx6Y2JWilgU0nVVjG/ncM2XKE39V32Ls47NuQgEsrAcBYqknC/pVpUEO7
 WhjEuWhnbQe4GxbSzYakLVkScWWsnf3SINrRvLhANYeRsXMdUGMm2bI46MPT9QQNw1
 wkxQzOR6ZX2yHfTpshT9sXS3H1DI8zb3b+/+R7DEj2gesFgMcMmXG3yOGLd6uPbaxc
 NWRrUnV4eML0w==
Date: Wed, 26 Oct 2022 21:00:07 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v3 12/12] arm64: dts: qcom: sa8295-adp: Enable DP instances
Message-ID: <20221027020007.bkbmqbodihxlefnl@builder.lan>
References: <20221026032624.30871-1-quic_bjorande@quicinc.com>
 <20221026032624.30871-13-quic_bjorande@quicinc.com>
 <Y1ke9xp8m5zWg+Mu@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y1ke9xp8m5zWg+Mu@hovoldconsulting.com>
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
Cc: freedreno@lists.freedesktop.org,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Bjorn Andersson <quic_bjorande@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 26, 2022 at 01:50:15PM +0200, Johan Hovold wrote:
> On Tue, Oct 25, 2022 at 08:26:24PM -0700, Bjorn Andersson wrote:
> > From: Bjorn Andersson <bjorn.andersson@linaro.org>
> > 
> > The SA8295P ADP has, among other interfaces, six MiniDP connectors which
> > are connected to MDSS0 DP2 and DP3, and MDSS1 DP0 through DP3.
> > 
> > Enable Display Clock controllers, MDSS instanced, MDPs, DP controllers,
> > DP PHYs and link them all together.
> > 
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> > ---
> 
> >  &apps_rsc {
> > @@ -156,13 +240,169 @@ vreg_l7g: ldo7 {
> >  
> >  		vreg_l8g: ldo8 {
> >  			regulator-name = "vreg_l8g";
> > -			regulator-min-microvolt = <880000>;
> > -			regulator-max-microvolt = <880000>;
> > +			regulator-min-microvolt = <912000>;
> > +			regulator-max-microvolt = <912000>;
> > +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +			regulator-allow-set-load;
> 
> Did you really intend to allow set-load here?
> 
> I'm guessing this wasn't the case, but otherwise you also need to
> specify the valid modes.
> 

I see no reason for keeping it at this point in time, will drop it.

Thanks,
Bjorn

> > +		};
> > +
> > +		vreg_l11g: ldo11 {
> > +			regulator-name = "vreg_l11g";
> > +			regulator-min-microvolt = <912000>;
> > +			regulator-max-microvolt = <912000>;
> >  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> >  		};
> >  	};
> >  };
> 
> > +&mdss0_dp2_phy {
> > +	status = "okay";
> > +
> > +	vdda-phy-supply = <&vreg_l8g>;
> > +	vdda-pll-supply = <&vreg_l3g>;
> > +};
> 
> Johan
