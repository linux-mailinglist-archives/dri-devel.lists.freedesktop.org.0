Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ACB1BEBF36
	for <lists+dri-devel@lfdr.de>; Sat, 18 Oct 2025 00:52:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75A0910E1CA;
	Fri, 17 Oct 2025 22:52:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="F8heZjg+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1522A10E15A;
 Fri, 17 Oct 2025 22:52:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D4A084A62D;
 Fri, 17 Oct 2025 22:52:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D79DFC4CEF9;
 Fri, 17 Oct 2025 22:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760741536;
 bh=9m38dHlYeupV7BLbp372QPrZPXXhaYcQGUiETcqMnUQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=F8heZjg+XtWVM2qiYjl6ePyBS21vW7t/MbPfOmYrFBHujmXx7gzV9fU6rkYdLxcls
 Is6cBMugc1RqaSdCe1kvooFJdxJJ7qqWLyXj0S51AtJANSkZKdoQJd5T4Gcm/Y+RE2
 DimtuErPoZsfIpg0sGWf3D4XBU/t8bK9YRNEBy9wuU7VXrsyD3616jloftiRdjypD7
 ZgjsrvsN7AKwyGoFl5vDCj69w7egpKtQYP/PZvYBh9zAnN9djZzsSUiIkLH3NLS7pI
 1KKlcEqH2JQTSwyB6Yhoflu7FdhJVLV2CHdyiKWPIbps+ZDnskeX+H/R1AGuHdZYxc
 rOnm9HcswqTdg==
Date: Fri, 17 Oct 2025 15:54:09 -0700
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>,
 marijn.suijten@somainline.org, swboyd@chromium.org, 
 mripard@kernel.org, abel.vesa@linaro.org, konradybcio@kernel.org,
 robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, robin.clark@oss.qualcomm.com, 
 jessica.zhang@oss.qualcomm.com, abhinav.kumar@linux.dev, sean@poorly.run,
 airlied@gmail.com, 
 simona@ffwll.ch, alex.vinarskis@gmail.com, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, 
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com, quic_riteshk@quicnic.com,
 quic_amitsi@quicnic.com
Subject: Re: [PATCH 3/4] arm64: dts: qcom: lemans-ride: Enable dispcc1
Message-ID: <62nvkgq4f5hoew4lbvszizplkm67t67dbpskej3ha6m55jnblx@vajuvual7lng>
References: <20250926085956.2346179-1-quic_mkuntuma@quicinc.com>
 <20250926085956.2346179-4-quic_mkuntuma@quicinc.com>
 <v4b35cmwbkoosdgs3d6ftml4yvdkyh27q65ssqojplb7uyniwp@wuxbeof7cikr>
 <869d1f94-9d66-4045-abdb-6e88d504a884@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <869d1f94-9d66-4045-abdb-6e88d504a884@oss.qualcomm.com>
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

On Wed, Oct 01, 2025 at 11:43:44AM +0200, Konrad Dybcio wrote:
> On 9/26/25 3:53 PM, Dmitry Baryshkov wrote:
> > On Fri, Sep 26, 2025 at 02:29:55PM +0530, Mani Chandana Ballary Kuntumalla wrote:
> >> This change enables display1 clock controller.
> >>
> >> Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
> >> ---
> >>  arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi | 4 ++++
> >>  1 file changed, 4 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
> >> index c69aa2f41ce2..d4436bc473ba 100644
> >> --- a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
> >> @@ -436,6 +436,10 @@ vreg_l8e: ldo8 {
> >>  	};
> >>  };
> >>  
> >> +&dispcc1 {
> >> +	status = "okay";
> > 
> > I think this one should be enabled by default. Unless Konrad or Bjorn
> > disagrees, please fix lemans.dtsi.
> 
> Of course there is no reason for clock controllers to be disabled
> 

On SC8280XP we have the same setup (two MDSS), there the clock
controller was left disabled because not all SKUs had that IP-block
accessible.

Whether this is the case of not for Lemans I don't know, if it is then
the commit message should have stated that.

Regards,
Bjorn

> Konrad
