Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC4F5E5714
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 02:14:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A698E10E143;
	Thu, 22 Sep 2022 00:14:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54AE810E143;
 Thu, 22 Sep 2022 00:14:35 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6B43FB81E97;
 Thu, 22 Sep 2022 00:14:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDD59C433C1;
 Thu, 22 Sep 2022 00:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663805672;
 bh=AqQ9r6jKKEdIP1KLMG+7Lq7QqqeArJ/0yKpA4jI6foM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GWXzjieCObHHLAI7eAidV1+pSLEjUgOnbjmxVnfaqwrQgaFRxrIwMzD92BBTiDmNp
 Lvljc+9ApYsP2PVl0HFUD5UKwHJYOn/MkzcRfRU2Xd+G6YIc7L2rraiXnOzfkb77Et
 aNiyAAY48lW95eG4NnMbgCIe4VlHsZVQiyGXDKHXnAtim5Boc68pbVGMJZgRuStimz
 HERLh/vDN/9eNZ80FuLF3fUJy2yWACyfYnqtpTMllOV+Fh0Vk/u/98UGJgHO1BRVTV
 mloqMmODCZrGdOrLJPSXUZJ0CPFJxUGRWlEK/gCCR8LV9XpDqgcwNKOm2Xd89yZh/Q
 tidsaAe9FepsA==
Date: Wed, 21 Sep 2022 19:14:29 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 1/7] dt-bindings: msm/dp: Add SDM845 and SC8280XP
 compatibles
Message-ID: <20220922001429.zqfap3clprvlo6jo@builder.lan>
References: <20220916200028.25009-1-quic_bjorande@quicinc.com>
 <20220916200028.25009-2-quic_bjorande@quicinc.com>
 <1641e41c-08c7-859b-644a-28d966fb00f3@linaro.org>
 <20220919211832.6b3buqxrnfp6yjjg@builder.lan>
 <6b242b44-b657-c7a6-63ca-465c7031376f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6b242b44-b657-c7a6-63ca-465c7031376f@linaro.org>
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
Cc: devicetree@vger.kernel.org,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Bjorn Andersson <quic_bjorande@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 20, 2022 at 09:09:13AM +0200, Krzysztof Kozlowski wrote:
> On 19/09/2022 23:18, Bjorn Andersson wrote:
> > On Sat, Sep 17, 2022 at 06:03:27PM +0100, Krzysztof Kozlowski wrote:
> >> On 16/09/2022 21:00, Bjorn Andersson wrote:
> >>> From: Bjorn Andersson <bjorn.andersson@linaro.org>
> >>>
> >>> Add compatibles for the DisplayPort and Embedded DisplayPort blocks in
> >>> Qualcomm SDM845 and SC8280XP platforms.
> >>>
> >>> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> >>> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> >>
> >> No need for quicinc SoB (unless you also take ownership).
> >>
> > 
> > It's my understanding that both needs to be there. Bjorn @ Linaro
> > authored the patch and the author must certify its origin, but as the
> > submitter I must certify its origin.
> 
> It's the same person. There are no two Bjorns (unless there are :) ), so
> you certify with old email. SoB chain is coming from people, not email
> addresses.
> 

IANAL, but I don't think it's the same person. I can't use my old
signature to certify the origin in a contribution today and I can't
claim authorship of something Linaro did.

> And it is not only my understanding of SoB chain.
> https://lore.kernel.org/all/YuKcBO5JatwRYQJ3@kroah.com/
> 

Again, IANAL, but I think the situation is different given AMD and
Xilinx relationship.

> > 
> > I'm not entirely sure what you mean about taking ownership, 
> 
> I meant you to be the author of the commit.
> 

As mentioned above, I can't do that.

Regards,
Bjorn

> > I am going
> > to pursue getting these patches landed. But it wouldn't be correct for
> > new me to claim I authored them.
> 
> Yeah, that's true.
> 
> 
> Best regards,
> Krzysztof
