Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEBB464352E
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 21:02:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11F7010E298;
	Mon,  5 Dec 2022 20:02:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27DA410E297;
 Mon,  5 Dec 2022 20:02:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 78F18B81210;
 Mon,  5 Dec 2022 20:02:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4354C433D6;
 Mon,  5 Dec 2022 20:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670270560;
 bh=Nr9qAFkOjKJXxGf3nfHjroa81FlJK3z/0Sp6VRgIWw4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=F7dsTvcw6XxQIkuPJEHkC3DudoJfY5i/o15Y0mWAslMqBR/i3j0mL8KRA6r1hrwnT
 MIrbyWsJBtNaQ+ePnVBeJ6eGZIfCrueUqkTjQVuJESrD+MZknd+PmdXq2bPY2EX0cE
 aGITTerd65L+p9kX7i7BNngq5197vQ+YnhitP3jj0LlPE4ocq4q6uqWmEcbxfE5a3x
 fzp5bSWGDFZH4LdVX8DuS1+YX/1/VKL+cYE6IVtz44mDdcvYyH4oLjX5smA37NzYpo
 X7NkbPRSI4l6gIBK+juFlcQWpXmnJXxqUVfGoCuHjcFkrzowbOLBgI+rRDaxTd6ISO
 1tSSveccz0RGw==
Date: Mon, 5 Dec 2022 14:02:36 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v4 13/13] arm64: dts: qcom: sa8295-adp: Enable DP instances
Message-ID: <20221205200236.2t25pv5abrgkrt5k@builder.lan>
References: <20221205174433.16847-1-quic_bjorande@quicinc.com>
 <20221205174433.16847-14-quic_bjorande@quicinc.com>
 <b58f6935-b6ac-128b-2fec-a06dccc3210f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b58f6935-b6ac-128b-2fec-a06dccc3210f@linaro.org>
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
Cc: Kalyan Thota <quic_kalyant@quicinc.com>, freedreno@lists.freedesktop.org,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Bjorn Andersson <quic_bjorande@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sean Paul <sean@poorly.run>,
 Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 05, 2022 at 07:09:45PM +0100, Konrad Dybcio wrote:
> On 05/12/2022 18:44, Bjorn Andersson wrote:
> > diff --git a/arch/arm64/boot/dts/qcom/sa8295p-adp.dts b/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
[..]
> > +&mdss0_dp2 {
> > +	status = "okay";
> status should go last.
> 

Thanks for pointing that out. Would be nice if the computer told me
that...somehow...

> > +
> > +	data-lanes = <0 1 2 3>;
> > +
> > +	ports {
> > +		port@1 {
> > +			reg = <1>;
> > +			mdss0_dp2_phy_out: endpoint {
> That's quite a lot of indentation.. couldn't these endpoints be defined in
> the SoC DT?
> 

The alternative would be to have the description of each DP controller
split over multiple nodes and rely on the reader to stitch together the
view of the node based on the label.
Based on the naming of these labels they would at least be adjacent, so
it wouldn't be that bad.

But I feel that there is enough DP-controller nodes in this board
already; I've yet to describe the two USB Type-C controllers or the two
DSI-DP bridges.
So I don't know if it's worth optimizing indentation-level within each
node like this.


And we will end up mixing this optimization between DP controllers, USB
Type-C nodes, QMP nodes, DSI-DP bridges.

Regards,
Bjorn
