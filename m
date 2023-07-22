Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F52B75D931
	for <lists+dri-devel@lfdr.de>; Sat, 22 Jul 2023 04:46:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A50A10E0D6;
	Sat, 22 Jul 2023 02:46:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F09710E0D6;
 Sat, 22 Jul 2023 02:46:28 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9625561DC1;
 Sat, 22 Jul 2023 02:46:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAEE2C433C8;
 Sat, 22 Jul 2023 02:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689993987;
 bh=aNTT4YCh064DdPhuzYjOFZH8M/TlP7tVKcY5DRWkLbY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PatEbBu0PJuSuPMOavd0Bgz5MoATe7dvFYC3BQMHS9KVSYOfVXsR+r7XnIr/ybT/4
 LunhUPVDXX5zwHgPYh5vRtd469Jk4mFySJi7BgfILEWaeg3LNywLp0vSY/iezLHfdz
 DAvUhJPdGGkY0g2teq0kIGGeHOwx7U4Mv65YNc5AceLjfn3tUPjZhNNvRLsAdqo+Eg
 Tk4GT7cg+/erYcSWl26HFvwl1fz7Dv0TDcr6su9l1iHZSogRfsG1Ksgapq1OQ1DyVT
 DiNsfJiFb3TTg2542sb34tk2S2FlEDrcWnqZh8E0NggYf7wbSP1MrHsN4HvBPYGZ0F
 lFyXIymmnzB8w==
Date: Fri, 21 Jul 2023 19:49:45 -0700
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 0/5] arm64: dts: qcom: qrb5165-rb5: enable DP support
Message-ID: <vo7boshin545hx27ov3rrkhbglkf42f7yl5r5geltqyqw3lmol@icdicnqvrvrx>
References: <20230709041926.4052245-1-dmitry.baryshkov@linaro.org>
 <yjr3i54z4ddifn7y6ls65h65su54xtuzx3gvibw6ld4x27fd7x@ganmrdp4vzx7>
 <0075783f-9166-89aa-a9f9-068494e468e3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0075783f-9166-89aa-a9f9-068494e468e3@linaro.org>
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
Cc: devicetree@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Andy Gross <agross@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 18, 2023 at 09:09:41AM +0300, Dmitry Baryshkov wrote:
> On 18/07/2023 07:37, Bjorn Andersson wrote:
> > On Sun, Jul 09, 2023 at 07:19:21AM +0300, Dmitry Baryshkov wrote:
> > > Implement DisplayPort support for the Qualcomm RB5 platform.
> > > 
> > > Note: while testing this, I had link training issues with several
> > > dongles with DP connectors. Other DisplayPort-USB-C dongles (with HDMI
> > > or VGA connectors) work perfectly.
> > > 
> > > Dependencies: [1]
> > > Soft-dependencies: [2], [3]
> > > 
> > > [1] https://lore.kernel.org/linux-arm-msm/20230515133643.3621656-1-bryan.odonoghue@linaro.org/
> > 
> > I'm not able to find a version of this series ready to be merged, can
> > you please help me find it?
> 
> This = Bryan's? I have posted some (small) feedback regarding v8. You also
> had issues with orientation switching bindings, etc. So there should be v9.
> 

Right, Bryan's series. You linked to v8 which has requests for changes,
and I can't find v9. Am I just bad at searching?

Regards,
Bjorn
