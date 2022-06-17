Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 907D554EE50
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 02:10:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB12510FA9C;
	Fri, 17 Jun 2022 00:10:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96E2B10FA9C;
 Fri, 17 Jun 2022 00:10:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1B84161358;
 Fri, 17 Jun 2022 00:10:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B08EC34114;
 Fri, 17 Jun 2022 00:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655424605;
 bh=cD73xFTYbV7d8FwYS/+LxjiTrj6GgeC/IFBJ0+It07Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tsv9SdWuVyJNQeGUF1E0Nr3uDUJB7EeBVN4u0A2d1DNJmaibpJ6rwo//bI+x83hie
 aqyUD+fTDgnqYB6+kjpDVxuVMQbM5ZhBaucwIzgRmR66O2Y73qfViA6R4DUSDKG8ot
 26pywnT/zcUitfw8JYK3Av8QaIknlH0gJhsoG3o3NGo0fh2OsXwG1K5CyBtrn0ZCoa
 yry1hDGnxYxhmOGfpf/4zKhfGF+GHYrpP9OuvTx18I7hEMr+wGmdQPKsPyZPR+hmdR
 gO8VzaiAsi/SeYo6HlyAOkvp3lJcdb51Rvn5HBnbqA7Tstf42V8uC4MJQ1rkXllg6a
 mvXY0iCAi1/Vg==
Date: Thu, 16 Jun 2022 17:10:04 -0700
From: Vinod Koul <vkoul@kernel.org>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 2/2] dt-bindings: phy: List supplies for qcom,edp-phy
Message-ID: <YqvGXNGIzVHp7QtV@matsya>
References: <20220425210643.2420919-1-dianders@chromium.org>
 <20220425140619.2.Iae013f0ff4599294189f3a6e91376fad137bbabf@changeid>
 <CAD=FV=Wbi=CXhPpOUJj=1PdgB8i6Lf1Sfr=T7wrQsgBx790S_w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=FV=Wbi=CXhPpOUJj=1PdgB8i6Lf1Sfr=T7wrQsgBx790S_w@mail.gmail.com>
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
Cc: quic_kalyant <quic_kalyant@quicinc.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Rob Clark <robdclark@chromium.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-phy@lists.infradead.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16-06-22, 08:35, Doug Anderson wrote:
> Hi,
> 
> On Mon, Apr 25, 2022 at 2:07 PM Douglas Anderson <dianders@chromium.org> wrote:
> >
> > We're supposed to list the supplies in the dt bindings but there are
> > none in the eDP PHY bindings.
> >
> > Looking at the driver in Linux, I can see that there seem to be two
> > relevant supplies: "vdda-phy" and "vdda-pll". Let's add those to the
> > bindings.
> >
> > NOTE: from looking at the Qualcomm datasheet for sc7280, it's not
> > immediately clear how to figure out how to fill in these supplies. The
> > only two eDP related supplies are simply described as "power for eDP
> > 0.9V circuits" and "power for eDP 1.2V circuits". From guessing and
> > from comparing how a similar PHY is hooked up on other similar
> > Qualcomm boards, I'll make the educated guess that the 1.2V supply
> > goes to "vdda-phy" and the 0.9V supply goes to "vdda-pll" and I'll use
> > that in the example here.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> >  Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml | 6 ++++++
> >  1 file changed, 6 insertions(+)
> 
> Even though patch #1 in this series should be dropped, this patch
> (patch #2) is still valid. Vinod: I assume this would land in your
> tree along with the first two patches in Kuogee's series [1], which
> are related. Please let me know if you need me to re-send or anything.

I have applied this patch, thanks

> [1] https://lore.kernel.org/r/1653507433-22585-1-git-send-email-quic_khsieh@quicinc.com/

This needs rebase on phy split which I have picked

-- 
~Vinod
