Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 210F873EBD5
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jun 2023 22:28:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 313A510E11C;
	Mon, 26 Jun 2023 20:28:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it [5.144.164.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDD9C10E11C
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 20:28:47 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 63F771F48A;
 Mon, 26 Jun 2023 22:28:43 +0200 (CEST)
Date: Mon, 26 Jun 2023 22:28:41 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH 06/15] dt-bindings: display/msm: sc7180-dpu: Describe
 SM6125
Message-ID: <26pqxmuuyznb4qbi4wkiexr5excxenfmiuojrqgrz5k5t5palm@ttlk6m2zuokm>
References: <20230624-sm6125-dpu-v1-0-1d5a638cebf2@somainline.org>
 <20230624-sm6125-dpu-v1-6-1d5a638cebf2@somainline.org>
 <6bbf239f-d530-2f1e-ff52-361f7c9cc951@linaro.org>
 <75d64lixeawfoqbrctm4thzh73cxkvnlmnh5xgbpf277pmh3gz@zthnqvvuxmeq>
 <a6f3906a-98a7-de7a-3e26-4b8c45fe93f7@linaro.org>
 <w3bbdq72thnerbyglb4dyshzg4vu5go2wpsciprk27vah6w2ms@yc4eqclct24a>
 <3daf9990-79da-9adf-af6a-d9007c186557@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3daf9990-79da-9adf-af6a-d9007c186557@linaro.org>
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
 Krzysztof Kozlowski <krzk@kernel.org>, Andy Gross <agross@kernel.org>,
 Lux Aliaga <they@mint.lgbt>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, Jami Kettunen <jami.kettunen@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-06-26 20:57:51, Konrad Dybcio wrote:
> On 26.06.2023 19:54, Marijn Suijten wrote:
> > On 2023-06-26 18:16:58, Krzysztof Kozlowski wrote:
> >> On 25/06/2023 21:52, Marijn Suijten wrote:
> >>> On 2023-06-24 11:12:52, Krzysztof Kozlowski wrote:
> >>>> On 24/06/2023 02:41, Marijn Suijten wrote:
> >>>>> SM6125 is identical to SM6375 except that while downstream also defines
> >>>>> a throttle clock, its presence results in timeouts whereas SM6375
> >>>>> requires it to not observe any timeouts.
> >>>>
> >>>> Then it should not be allowed, so you need either "else:" block or
> >>>> another "if: properties: compatible:" to disallow it. Because in current
> >>>> patch it would be allowed.
> >>>
> >>> That means this binding is wrong/incomplete for all other SoCs then.
> >>> clock(-name)s has 6 items, and sets `minItems: 6`.  Only for sm6375-dpu
> > 
> > Of course meant to say that clock(-name)s has **7** items, not 6.
> > 
> >>> does it set `minItems: 7`, but an else case is missing.
> >>
> >> Ask the author why it is done like this.
> > 
> > Konrad, can you clarify why other 

(Looks like I forgot to complete this sentence before sending,
apologies)

> 6375 needs the throttle clk and the clock(-names) are strongly ordered
> so having minItems: 6 discards the last entry

The question is whether or not we should have maxItems: 6 to disallow
the clock from being passed: right now it is optional and either is
allowed for any !6375 SoC.

- Marijn

> 
> Konrad
> > 
> >>> Shall I send a Fixes: ed41005f5b7c ("dt-bindings: display/msm:
> >>> sc7180-dpu: Describe SM6350 and SM6375") for that, and should maxItems:
> >>> 6 be the default under clock(-name)s or in an else:?
> >>
> >> There is no bug to fix. Or at least it is not yet known. Whether other
> >> devices should be constrained as well - sure, sounds reasonable, but I
> >> did not check the code exactly.
> > 
> > I don't know either, but we need this information to decide whether to
> > use `maxItems: 6`:
> > 
> > 1. Directly on the property;
> > 2. In an `else:` case on the current `if: sm6375-dpu` (should have the
> >    same effect as 1., afaik);
> > 3. In a second `if:` case that lists all SoCS explicitly.
> > 
> > Since we don't have this information, I think option 3. is the right way
> > to go, setting `maxItems: 6` for qcom,sm6125-dpu.
> > 
> > However, it is not yet understood why downstream is able to use the
> > throttle clock without repercussions.
> > 
> >> We talk here about this patch.
> > 
> > We used this patch to discover that other SoCs are similarly
> > unconstrained.  But if you don't want me to look into it, by all means!
> > Saves me a lot of time.  So I will go with option 3.
> > 
> > - Marijn
