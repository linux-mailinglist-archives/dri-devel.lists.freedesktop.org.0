Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D419742568
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jun 2023 14:10:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0030610E164;
	Thu, 29 Jun 2023 12:09:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::168])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B58D10E13A;
 Thu, 29 Jun 2023 12:09:53 +0000 (UTC)
Received: from SoMainline.org (82-72-63-87.cable.dynamic.v4.ziggo.nl
 [82.72.63.87])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 472443F384;
 Thu, 29 Jun 2023 14:09:47 +0200 (CEST)
Date: Thu, 29 Jun 2023 14:09:45 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 12/15] arm64: dts: qcom: sm6125: Switch fixed xo_board
 clock to RPM XO clock
Message-ID: <st3nrb54zxa5xp7qqkdyygf7t6ucgzl3xc5w6d426xy6udj4fx@puakunoaoj2l>
References: <20230627-sm6125-dpu-v2-0-03e430a2078c@somainline.org>
 <20230627-sm6125-dpu-v2-12-03e430a2078c@somainline.org>
 <84eb1d40-436b-a5b4-a4e3-75a511ad5a90@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <84eb1d40-436b-a5b4-a4e3-75a511ad5a90@linaro.org>
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
Cc: Michael Turquette <mturquette@baylibre.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, dri-devel@lists.freedesktop.org,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-clk@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Andy Gross <agross@kernel.org>, Lux Aliaga <they@mint.lgbt>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>, Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Loic Poulain <loic.poulain@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jami Kettunen <jami.kettunen@somainline.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-06-29 13:55:28, Dmitry Baryshkov wrote:
> On 27/06/2023 23:14, Marijn Suijten wrote:
> > We have a working RPM XO clock; no other driver except rpmcc should be
> > parenting directly to the fixed-factor xo_board clock nor should it be
> > reachable by that global name.  Remove the name to that effect, so that
> > every clock relation is explicitly defined in DTS.
> > 
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> > Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> > ---
> >   arch/arm64/boot/dts/qcom/sm6125.dtsi | 7 ++++---
> >   1 file changed, 4 insertions(+), 3 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
> > index 722dde560bec..edb03508dba3 100644
> > --- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
> > @@ -22,7 +22,6 @@ xo_board: xo-board {
> >   			compatible = "fixed-clock";
> >   			#clock-cells = <0>;
> >   			clock-frequency = <19200000>;
> > -			clock-output-names = "xo_board";
> 
> Why? I'd say, leave it.

The exact reason is explained in the commit message.

> 
> With that fixed:

Hence I don't think it makes sense to "fix" this.

- Marijn

> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
