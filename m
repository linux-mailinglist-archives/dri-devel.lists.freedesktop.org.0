Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C632173E6C6
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jun 2023 19:47:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06ED210E12B;
	Mon, 26 Jun 2023 17:47:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [5.144.164.166])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B76C10E121
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 17:47:43 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 448113F64A;
 Mon, 26 Jun 2023 19:47:39 +0200 (CEST)
Date: Mon, 26 Jun 2023 19:47:37 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 03/15] dt-bindings: clock: qcom,dispcc-sm6125: Require
 GCC PLL0 DIV clock
Message-ID: <w36fif3isv2nwzvket6dslfoz3vwng7bv3hy6qtezftlqha74a@kd5c6q4ontsf>
References: <20230624-sm6125-dpu-v1-0-1d5a638cebf2@somainline.org>
 <20230624-sm6125-dpu-v1-3-1d5a638cebf2@somainline.org>
 <c9681bce-efa8-9b79-4bf6-837dd6a2dc12@linaro.org>
 <edrftxqhywiaxvbonyh25cmubrg77y4dryqoy7id4ndan2lfa7@rhvcoavtg5vl>
 <f62d750e-da73-fece-c3de-0dac1fbb9827@linaro.org>
 <dp2ucgmql2jff52nbxti2hwjchtgjkbrwcgpx3p7ruodz7adnj@635pcqr6fv4x>
 <c3c79634-b4d3-84a4-4c41-8d74d8648313@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c3c79634-b4d3-84a4-4c41-8d74d8648313@linaro.org>
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
 dri-devel@lists.freedesktop.org, Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-clk@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Andy Gross <agross@kernel.org>, Lux Aliaga <they@mint.lgbt>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>, Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-06-26 18:15:13, Krzysztof Kozlowski wrote:
> On 26/06/2023 16:26, Marijn Suijten wrote:
> > On 2023-06-26 11:43:39, Konrad Dybcio wrote:
> >> On 25.06.2023 21:48, Marijn Suijten wrote:
> >>> On 2023-06-24 03:45:02, Konrad Dybcio wrote:
> >>>> On 24.06.2023 02:41, Marijn Suijten wrote:
> >>>>> The "gcc_disp_gpll0_div_clk_src" clock is consumed by the driver, will
> >>>>> be passed from DT, and should be required by the bindings.
> >>>>>
> >>>>> Fixes: 8397c9c0c26b ("dt-bindings: clock: add QCOM SM6125 display clock bindings")
> >>>>> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> >>>>> ---
> >>>> Ideally, you'd stick it at the bottom of the list, as the items: order
> >>>> is part of the ABI
> >>>
> >>> This isn't an ABI break, as this driver nor its bindings require/declare
> >>> a fixed order: they declare a relation between clocks and clock-names.
> >> Bindings describe the ABI, drivers implement compliant code flow.
> > 
> > That is how bindings are supposed to be...  However typically the driver
> > is written/ported first and then the bindings are simply created to
> 
> Your development process does not matter for the bindings. Whatever you
> decide to do "typically" is your choice, although of course I understand
> why you do it like that. You can argument the same that "I never create
> bindings in my process, so the driver defines the ABI".

This is not my process, nor my choice.

> > reflect this, and sometimes (as is the case with this patch)
> > incorrectly.
> > 
> > That, together with a lack of DTS and known-working device with it
> > (which is why I'm submitting driver+bindings+dts in one series now!)
> > makes us shoot ourselves in the foot by locking everyone into an ABI
> > that makes no sense.
> 
> No one is locked into the ABI. SoC maintainer decides on this. However
> unjustified ABI breaking or not caring about it at all is not the way to
> go. It is not the correct process.

It definitely sounds like it.

> >>> This orders the GCC clock just like other dispccs.  And the previous
> >>> patch dropped the unused cfg_ahb_clk from the bindings, so all bets are
> >>> off anyway.
> >> Thinking about it again, the binding has not been consumed by any upstream
> >> DT to date, so it should (tm) be fine to let it slide..
> > 
> > Exactly, I hope/doubt anyone was already using these incomplete
> > bindings.  And again: the ABI here is the name->phandle mapping, the
> > order Does Not Matter™.
> 
> No, it's not. Your one driver does not define the ABI. There are many
> different drivers, many different operating systems and other software
> components.

You missed the point entirely.

The point is that someone contributed a dt-bindings patch that does not
represent the hardware (hence not the driver for that hardware either).
It was taken without objection.  So now what?  We are stuck with a
broken ABI that does not allow us to describe the hardware?

If there are many different drivers and other OSes, why are we solely
responsible for describing broken bindings?  Why were there no
objections elsewhere that this does not allow us to describe the
hardware in question?

Note that the person signing off on and sending that initial dt-bindings
patch for qcom,dispcc-sm6125.yaml is me, by the way.

- Marijn
