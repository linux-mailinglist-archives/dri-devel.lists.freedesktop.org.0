Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8661A75866E
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 23:04:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6323410E080;
	Tue, 18 Jul 2023 21:04:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [5.144.164.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E613010E080
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 21:04:35 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 5B9953F434;
 Tue, 18 Jul 2023 23:04:32 +0200 (CEST)
Date: Tue, 18 Jul 2023 23:04:31 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v2 12/15] arm64: dts: qcom: sm6125: Switch fixed xo_board
 clock to RPM XO clock
Message-ID: <zytqzpzkuaqpzyylgyj6jjhbisq674an5s5z522e4hvbbny6ip@2ct5u23kpj46>
References: <20230627-sm6125-dpu-v2-0-03e430a2078c@somainline.org>
 <20230627-sm6125-dpu-v2-12-03e430a2078c@somainline.org>
 <84eb1d40-436b-a5b4-a4e3-75a511ad5a90@linaro.org>
 <st3nrb54zxa5xp7qqkdyygf7t6ucgzl3xc5w6d426xy6udj4fx@puakunoaoj2l>
 <CAA8EJpqHh4ZWZxuRMLN2z8BZYFqzoWxZV=oW1ANzEJy4i-PWNw@mail.gmail.com>
 <ba1a6af3-b522-09da-ae81-88f75eae7a47@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ba1a6af3-b522-09da-ae81-88f75eae7a47@linaro.org>
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
 Jami Kettunen <jami.kettunen@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-06-29 21:14:47, Konrad Dybcio wrote:
> On 29.06.2023 14:26, Dmitry Baryshkov wrote:
> > On Thu, 29 Jun 2023 at 15:09, Marijn Suijten
> > <marijn.suijten@somainline.org> wrote:
> >>
> >> On 2023-06-29 13:55:28, Dmitry Baryshkov wrote:
> >>> On 27/06/2023 23:14, Marijn Suijten wrote:
> >>>> We have a working RPM XO clock; no other driver except rpmcc should be
> >>>> parenting directly to the fixed-factor xo_board clock nor should it be
> >>>> reachable by that global name.  Remove the name to that effect, so that
> >>>> every clock relation is explicitly defined in DTS.
> >>>>
> >>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> >>>> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> >>>> ---
> >>>>   arch/arm64/boot/dts/qcom/sm6125.dtsi | 7 ++++---
> >>>>   1 file changed, 4 insertions(+), 3 deletions(-)
> >>>>
> >>>> diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
> >>>> index 722dde560bec..edb03508dba3 100644
> >>>> --- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
> >>>> +++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
> >>>> @@ -22,7 +22,6 @@ xo_board: xo-board {
> >>>>                     compatible = "fixed-clock";
> >>>>                     #clock-cells = <0>;
> >>>>                     clock-frequency = <19200000>;
> >>>> -                   clock-output-names = "xo_board";
> >>>
> >>> Why? I'd say, leave it.
> >>
> >> The exact reason is explained in the commit message.
> > 
> > Usually we do no not kill the xo_board name for the sake of anybody
> > still looking for the old name. Weak argument, I know.
> The only users are (rg -l '"xo_board"' drivers):
> 
> drivers/clk/qcom/mmcc-msm8974.c
> drivers/clk/qcom/a53-pll.c
> drivers/clk/qcom/gcc-msm8974.c
> drivers/clk/qcom/clk-smd-rpm.c
> drivers/clk/qcom/mmcc-msm8996.c
> drivers/clk/qcom/gcc-msm8916.c
> drivers/clk/qcom/gcc-apq8084.c
> drivers/clk/qcom/gcc-msm8996.c
> drivers/clk/qcom/mmcc-apq8084.c
> drivers/clk/qcom/clk-rpmh.c
> drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c
> 
> This platform only binds clk-smd-rpm, but patch 11 provides a
> direct reference in the DT.

And following a quick check, those occurrences all have
.fw_name="xo",.name="xo_board", allowing the clock to be provided via
DT.  For sm6125, I'd like it to be required like that: all dt-bindings
require an "xo" board where relevant, after all.

- Marijn

> 
> Konrad
> 
> > 
> >>
> >>>
> >>> With that fixed:
> >>
> >> Hence I don't think it makes sense to "fix" this.
> >>
> >> - Marijn
> >>
> >>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > 
> > 
> > 
