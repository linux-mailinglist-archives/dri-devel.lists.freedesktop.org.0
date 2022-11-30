Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C80263E11F
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 21:08:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E60E910E4D0;
	Wed, 30 Nov 2022 20:07:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5F2F10E4D0;
 Wed, 30 Nov 2022 20:07:45 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6C069B81CD5;
 Wed, 30 Nov 2022 20:07:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D56FBC433D6;
 Wed, 30 Nov 2022 20:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669838863;
 bh=7+AZ/AGCKZtG91XadBL5ljZgYXCyQsHOIz9tdN8lLaU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CHpsvWzNvGaGEwLZ3ChSHJX0ewNB+1hY8j1sBe19XSoOePTwc/IoyhsI/t2DHIq8O
 QCfQ8dnlWPVZHRwnhIJooNM651FAf4zsn7+nwJ1gjLJVXgSrGq6wcUqIMnQf5NrVhs
 L2a0LzrRj3U+5AoDPB4EU8VgLd8U0zd5/34q68X1zLYkRiX//tb7tLeYaPnRbFEdgr
 CYMe/GGb+Lxxu8VqALf38KaGu1suBI+c96mMMwPM6ow/ONQBPEWP1klVP0sn3COjPL
 RREeOfejrGMMsP6KfnLvr5CFiV4COKEau0LhkSN8eiK0lnwSx7Cth8PkMRv+xeEtPS
 WVzkisNbj20+A==
Date: Wed, 30 Nov 2022 14:07:39 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Subject: Re: [PATCH v3 10/12] arm64: dts: qcom: sc8280xp: Define some of the
 display blocks
Message-ID: <20221130200739.ube7hvobythkbhuy@builder.lan>
References: <20221026032624.30871-1-quic_bjorande@quicinc.com>
 <20221026032624.30871-11-quic_bjorande@quicinc.com>
 <528e0921-73d7-655e-c3dc-ac3ebb3a5979@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <528e0921-73d7-655e-c3dc-ac3ebb3a5979@quicinc.com>
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
 Johan Hovold <johan@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 18, 2022 at 03:15:25PM -0800, Kuogee Hsieh wrote:
> 
> On 10/25/2022 8:26 PM, Bjorn Andersson wrote:
[..]
> > +		mdss0: display-subsystem@ae00000 {
[..]
> > +
> just curious, where are mdss0_dp0 and mdss0_dp1?. Are two dp/usb combo phys
> not going used?

They are, but at the time of posting this, the QMP nodes was still being
reworked to support expressing the DP-part of things.

Now that the rework is in place I will include them as I respin this
series.

Regards,
Bjorn
