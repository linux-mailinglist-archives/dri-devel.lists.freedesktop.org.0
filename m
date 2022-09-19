Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0FE5BD63B
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 23:18:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1727610E13B;
	Mon, 19 Sep 2022 21:18:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4A1710E12F;
 Mon, 19 Sep 2022 21:18:38 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3EF68B81CBF;
 Mon, 19 Sep 2022 21:18:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C91A6C433C1;
 Mon, 19 Sep 2022 21:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663622315;
 bh=zyKwpB+TZU0POEehx6BHCVgBibbVZtVjpx2DjzNk6fw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NeKrC1aMNRDeZ8TX0sQIYnI3jRBY2AmbpSrAEqqpTnrm0POsTUBO95bXhxkr0k4sQ
 9FnvmU+FbXIPtS92p05VBEF/2KkGn3Wy2pGfaNXzqElVoTbnKwn+EzA1c+cEZ7gxZ3
 K83CLaoZcnbMn7DGbuzYC7DgT3bPgUDe/BZe6utD8+xB7mvgjpMdwXCI3j/giNRpFb
 ox59Fu5TFuUgyvP4HJ8CF8mmAG77RTzyhdkVJ3BnradIr2GfTK5Ipk9K26le2/ARBp
 UtZ4c3Gt+V5Y8piAFwQ1Lx30k96Vc1cFIf+ey9cqkuIs6b1afA5SU65az10f9dfEvs
 AzvHhpOB6NVUA==
Date: Mon, 19 Sep 2022 16:18:32 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 1/7] dt-bindings: msm/dp: Add SDM845 and SC8280XP
 compatibles
Message-ID: <20220919211832.6b3buqxrnfp6yjjg@builder.lan>
References: <20220916200028.25009-1-quic_bjorande@quicinc.com>
 <20220916200028.25009-2-quic_bjorande@quicinc.com>
 <1641e41c-08c7-859b-644a-28d966fb00f3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1641e41c-08c7-859b-644a-28d966fb00f3@linaro.org>
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

On Sat, Sep 17, 2022 at 06:03:27PM +0100, Krzysztof Kozlowski wrote:
> On 16/09/2022 21:00, Bjorn Andersson wrote:
> > From: Bjorn Andersson <bjorn.andersson@linaro.org>
> > 
> > Add compatibles for the DisplayPort and Embedded DisplayPort blocks in
> > Qualcomm SDM845 and SC8280XP platforms.
> > 
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> 
> No need for quicinc SoB (unless you also take ownership).
> 

It's my understanding that both needs to be there. Bjorn @ Linaro
authored the patch and the author must certify its origin, but as the
submitter I must certify its origin.

I'm not entirely sure what you mean about taking ownership, I am going
to pursue getting these patches landed. But it wouldn't be correct for
new me to claim I authored them.

Regards,
Bjorn

> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>\
> 
> 
> Best regards,
> Krzysztof
