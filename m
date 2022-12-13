Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E0464B99E
	for <lists+dri-devel@lfdr.de>; Tue, 13 Dec 2022 17:26:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 340E810E318;
	Tue, 13 Dec 2022 16:26:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D338B10E1E7;
 Tue, 13 Dec 2022 16:26:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1EAD7615C6;
 Tue, 13 Dec 2022 16:26:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61393C433EF;
 Tue, 13 Dec 2022 16:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670948770;
 bh=NkxDPuLY7Zyb3KNbQ2lo6DdobBvEk1ck2GXb4Yzjh1E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bXuoP9G941WQ5H778c1k+WBpRS0EI10F6D4Uvuf0wcMz0tXCHBB/WAK8HCq5NG0jh
 ZOtOAd6LyWTZPFdX03soWBTweC7dFblKrBbBcuLpds634TEMyF5GrJnQw4L4pqJKSD
 3Arihx7ASAzJLghNk6VlEa2Zs981Ddv58J7TzjoZ3zD2Oo/SP9nCFbsbfSDAsZSJzQ
 j502/OsTxh7P4rtt0Q1DbJ6pqeT5bguLMcC/FvTelgxdyjr6lxeviNEXhIFudTnqId
 AyEWY8B7gqOg8xDpZCe/H84DHm4N8vWdRLkodOPZCasaje3f3JyXvKtrRv19lkculb
 mxL5sVVRFczOg==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1p5872-0005vC-Dy; Tue, 13 Dec 2022 17:26:36 +0100
Date: Tue, 13 Dec 2022 17:26:36 +0100
From: Johan Hovold <johan@kernel.org>
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Subject: Re: [PATCH v5 11/12] arm64: dts: qcom: sc8280xp-crd: Enable EDP
Message-ID: <Y5invNFKLBKy30v1@hovoldconsulting.com>
References: <20221207220012.16529-1-quic_bjorande@quicinc.com>
 <20221207220012.16529-12-quic_bjorande@quicinc.com>
 <Y5MPa9l4btcDG9GP@hovoldconsulting.com>
 <20221213151012.GB16520@core-thresher1.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221213151012.GB16520@core-thresher1.qualcomm.com>
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
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 13, 2022 at 07:10:14AM -0800, Bjorn Andersson wrote:
> On Fri, Dec 09, 2022 at 11:35:23AM +0100, Johan Hovold wrote:
 
> > > +	edp_reg_en: edp-reg-en-state {
> > > +		pins = "gpio25";
> > > +		function = "gpio";
> > > +		output-enable;
> > 
> > 'output-enable' is not valid for tlmm and causes the settings to be
> > rejected:
> > 
> > 	sc8280xp-tlmm f100000.pinctrl: pin_config_group_set op failed for group 25
> > 	reg-fixed-voltage regulator-edp-3p3: Error applying setting, reverse things back
> > 
> 
> Thanks for spotting that, it doesn't seem to be needed for the gpio-regulator
> driver anyways...

I noticed that the firmware on both CRD and X13s sets the drive strength
to 16 here. Should we specify that too (and disable the pull up)
instead of relying on the firmware configuration?

Johan
