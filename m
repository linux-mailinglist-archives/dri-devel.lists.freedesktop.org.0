Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89DF873F864
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 11:11:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6403010E2CF;
	Tue, 27 Jun 2023 09:11:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AE6D10E2CC
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jun 2023 09:11:06 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id CBBC83F39B;
 Tue, 27 Jun 2023 11:11:02 +0200 (CEST)
Date: Tue, 27 Jun 2023 11:11:01 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 03/15] dt-bindings: clock: qcom,dispcc-sm6125: Require
 GCC PLL0 DIV clock
Message-ID: <3iyd2ptxdpnrzfh6qkzjnn2uvxftnjfoiinra5ji6skf53gkop@etttvi3a2lle>
References: <6311f26f-79ee-c471-649f-5e0b4629cfcc@linaro.org>
 <uuy5prkjhhs66te7h6z3pu4lzj2cfbiqk6ftjijwoeqpw573av@ogs6cboanvzc>
 <ziykmixskqkgheigefvyo4q3katbc4uix6jtcg7mncs25z4tj5@5gykrfgns4bm>
 <16731023-7dc7-d43d-1b16-fda44c0948ed@linaro.org>
 <yofju7jp7vmv33x7dzvzoelpumfsz3fjqy2ozakfphsuysunon@pglt2wzlsjex>
 <683a6f7e-bf1a-aff2-070b-472fb14e0353@linaro.org>
 <3nnk4xvmpnum2q6g6c6crjlqq3ra7j2z5zis53xcqbvevymuhz@mkffvs45n6ut>
 <145ab255-b3f8-1c6c-824d-5f1b40568d30@linaro.org>
 <makhh4ebdmoa5f6r4mbx4g2v2cpcsi74wqf3622dxuli4w7tb6@els2rvqcnvgz>
 <e1c53cd8-9875-08dc-5662-58f868c40628@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e1c53cd8-9875-08dc-5662-58f868c40628@kernel.org>
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
 linux-clk@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
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

On 2023-06-27 11:07:22, Krzysztof Kozlowski wrote:
> On 27/06/2023 11:02, Marijn Suijten wrote:
> >>>>> So deleting a new item at the end does not matter.  But what if I respin
> >>>>> this patch to add the new clock _at the end_, which will then be at the
> >>>>> same index as the previous GCC_DISP_AHB_CLK?
> >>>>
> >>>> I think you know the answer, right? What do you want to prove? That two
> >>>> independent changes can have together negative effect? We know this.
> >>>
> >>> The question is whether this is allowed?
> >>
> >> That would be an ABI break and I already explained if it is or is not
> >> allowed.
> > 
> > How should we solve it then, if we cannot remove GCC_DISP_AHB_CLK in one
> > patch and add GCC_DISP_GPLL0_DIV_CLK_SRC **at the end** in the next
> > patch?  Keep an empty spot at the original index of GCC_DISP_AHB_CLK?
> 
> I don't know if you are trolling me or really asking question, so just
> in case it is the latter:

Apologies if it comes across that way, but I am genuinely
misunderstanding what is and is not allowed as part of this ABI...

> "No one is locked into the ABI. SoC maintainer decides on this. "

Especially if it is up to the SoC mantainer.

> Also:
> https://lore.kernel.org/linux-arm-msm/20230608152759.GA2721945-robh@kernel.org/
> 
> https://lore.kernel.org/linux-arm-msm/CAL_JsqKOq+PdjUPVYqdC7QcjGxp-KbAG_O9e+zrfY7k-wRr1QQ@mail.gmail.com/
> 
> https://lore.kernel.org/linux-arm-msm/20220602143245.GA2256965-robh@kernel.org/
> 
> https://lore.kernel.org/linux-arm-msm/20220601202452.GA365963-robh@kernel.org/
> 
> Any many more.

In that sense the question above is not for you, but for the SoC
maintainer?  Whom, I hope, will say that we can be lenient in changing
the ABI for a platform that is only slowly being brought up by a bunch
of community developers and unlikely to be touched by anyone else.

Thanks for helping out so far!

- Marijn
