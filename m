Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F41273E488
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jun 2023 18:15:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B015C10E239;
	Mon, 26 Jun 2023 16:15:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06AF210E08F
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 16:15:18 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-31272fcedf6so3133827f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 09:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687796117; x=1690388117;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QXdcqnvtNLyYu0+DzoP64iL7BfxCUJXqKjjg/aEjYQI=;
 b=BQyAxkXZ/Pm8o888uBT0Y2kNK2mhYizFhK3HVzRIdqmzuAn6Gs2D3LsYIOBLcl+svX
 i9Wz2xn/4cYfe4gR0ISAEeUPFbRmu0pfQcC3OsUiNW5b+irGTbPSXOOYQ0NN0d+VAP4g
 I9NtpShUSCTrVjXqUTS/qhaxNVIsW91WNpkYLkRKPw7HIIrkhx1zivzDNqClkkLCyjF9
 mguDvcohXv41IN1B/trN9Nzi6S/Fa9cWQA0Qx29ANAysYN2Mqc8aHcbxCmXwdCdhsshu
 1+mFtTnuFPIBZpps1BIJP/pMEEGSQLlF2xivddDPAd7v/kR8RYD1MbOF8Vw0vBp7YxlG
 cuFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687796117; x=1690388117;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QXdcqnvtNLyYu0+DzoP64iL7BfxCUJXqKjjg/aEjYQI=;
 b=MZD0v78n3T+naS2vY96tQCfM5PnRDXWJz0DFguVg+d7nfekdl0NQtvUv16Mgb5dabF
 PmFHwfTszTTQ9nVUMtM2jt9zkr1NcnD8OYRkFGhkC7XL0ad/fWIYPedDselEme5tHzDA
 VdVM+QdCcg3diPHVtsv/qFmjQ115NxAneCMK6u9F+LNTfv+yTQ1w+ovfW0jnuLvz5DWw
 UWtT6Y5SAVodM9UIexQhULtjbCGBwFJ659U9hOsKYCWQwngqqFvwbPDBFDOywlCDZi31
 /GdgbgRD0MDp6JZa/ZFhILcznE7W6LMUDIzmgHZoOphAL6PhZghqypHNFqZ0+PO5kL12
 gKAg==
X-Gm-Message-State: AC+VfDzGOMLN5N4t2f/eRDJ1zsGsMO413rbuhqPvkm2OqCEQMrwxetcL
 MlaSRJNmqzotF9FphXx+9xqc3g==
X-Google-Smtp-Source: ACHHUZ6L7+dXpjqr2EV3aL4IlTsw7dGgISi6PqeOrudMedtpUkBoHht2nG3bZmc6aUVxu1ixi0dDDw==
X-Received: by 2002:adf:e684:0:b0:30e:5284:cbc4 with SMTP id
 r4-20020adfe684000000b0030e5284cbc4mr20071341wrm.68.1687796116886; 
 Mon, 26 Jun 2023 09:15:16 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
 by smtp.gmail.com with ESMTPSA id
 m16-20020a5d6250000000b003068f5cca8csm7755235wrv.94.2023.06.26.09.15.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jun 2023 09:15:16 -0700 (PDT)
Message-ID: <c3c79634-b4d3-84a4-4c41-8d74d8648313@linaro.org>
Date: Mon, 26 Jun 2023 18:15:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 03/15] dt-bindings: clock: qcom, dispcc-sm6125: Require GCC
 PLL0 DIV clock
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20230624-sm6125-dpu-v1-0-1d5a638cebf2@somainline.org>
 <20230624-sm6125-dpu-v1-3-1d5a638cebf2@somainline.org>
 <c9681bce-efa8-9b79-4bf6-837dd6a2dc12@linaro.org>
 <edrftxqhywiaxvbonyh25cmubrg77y4dryqoy7id4ndan2lfa7@rhvcoavtg5vl>
 <f62d750e-da73-fece-c3de-0dac1fbb9827@linaro.org>
 <dp2ucgmql2jff52nbxti2hwjchtgjkbrwcgpx3p7ruodz7adnj@635pcqr6fv4x>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <dp2ucgmql2jff52nbxti2hwjchtgjkbrwcgpx3p7ruodz7adnj@635pcqr6fv4x>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
 linux-kernel@vger.kernel.org, Jami Kettunen <jami.kettunen@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/06/2023 16:26, Marijn Suijten wrote:
> On 2023-06-26 11:43:39, Konrad Dybcio wrote:
>> On 25.06.2023 21:48, Marijn Suijten wrote:
>>> On 2023-06-24 03:45:02, Konrad Dybcio wrote:
>>>> On 24.06.2023 02:41, Marijn Suijten wrote:
>>>>> The "gcc_disp_gpll0_div_clk_src" clock is consumed by the driver, will
>>>>> be passed from DT, and should be required by the bindings.
>>>>>
>>>>> Fixes: 8397c9c0c26b ("dt-bindings: clock: add QCOM SM6125 display clock bindings")
>>>>> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
>>>>> ---
>>>> Ideally, you'd stick it at the bottom of the list, as the items: order
>>>> is part of the ABI
>>>
>>> This isn't an ABI break, as this driver nor its bindings require/declare
>>> a fixed order: they declare a relation between clocks and clock-names.
>> Bindings describe the ABI, drivers implement compliant code flow.
> 
> That is how bindings are supposed to be...  However typically the driver
> is written/ported first and then the bindings are simply created to

Your development process does not matter for the bindings. Whatever you
decide to do "typically" is your choice, although of course I understand
why you do it like that. You can argument the same that "I never create
bindings in my process, so the driver defines the ABI".

> reflect this, and sometimes (as is the case with this patch)
> incorrectly.
> 
> That, together with a lack of DTS and known-working device with it
> (which is why I'm submitting driver+bindings+dts in one series now!)
> makes us shoot ourselves in the foot by locking everyone into an ABI
> that makes no sense.

No one is locked into the ABI. SoC maintainer decides on this. However
unjustified ABI breaking or not caring about it at all is not the way to
go. It is not the correct process.

> 
>>> This orders the GCC clock just like other dispccs.  And the previous
>>> patch dropped the unused cfg_ahb_clk from the bindings, so all bets are
>>> off anyway.
>> Thinking about it again, the binding has not been consumed by any upstream
>> DT to date, so it should (tm) be fine to let it slide..
> 
> Exactly, I hope/doubt anyone was already using these incomplete
> bindings.  And again: the ABI here is the name->phandle mapping, the
> order Does Not Matter™.

No, it's not. Your one driver does not define the ABI. There are many
different drivers, many different operating systems and other software
components.

Best regards,
Krzysztof

