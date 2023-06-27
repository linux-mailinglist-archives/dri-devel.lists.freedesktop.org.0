Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4749973F475
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 08:24:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D8FF10E291;
	Tue, 27 Jun 2023 06:24:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B6E210E292
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jun 2023 06:24:47 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3fa8cd4a113so20049215e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 23:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687847084; x=1690439084;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=C98sJ4ODjsZ+PIPWAYUbo/b94g4oGT8VWWd+gYZdC8Y=;
 b=uv3jvPbk6CbFCNFmndl4tn3daErP8c9c+QwKX1LiovcdtenXucdTjrfhHEwnPFk843
 dweIw/aef9loL0yiVDr0Vf7L/7Bfg1dKHeWQt8/xdo+fgvBpiekVo4CWxJYbeHkLZ4jT
 NLEOr0TsDrmJHcERtGoeICW2oyedjRQFfES5Q4+QD08PCzrfHUjE5PQB4OwmrjKkfqL5
 XjPVw9WjVfgsypASqiH88mQG2CQgXBBynh7WWyRujqsUMeYLMSeqDiP86a96/V0yKSsz
 PSiVVnd9ZBRQsl14hAOhOw7kg7a5DcewJW3X2ofiGv/cpFQ1gM2eScgFsMxDKENvUOAM
 +vYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687847084; x=1690439084;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=C98sJ4ODjsZ+PIPWAYUbo/b94g4oGT8VWWd+gYZdC8Y=;
 b=gukCTdIcL4IbQ8yrk53DHeSFFEX+n31uwP1LPrsRAh/IVAEZZ78st5C8WbnDAnkpWd
 bFM24A3gpyLsmHd6WLhSaNZ3Js0Bd4j+7TpeXB0gj3yWK37HZA2idh/ohydHSyXbdjBd
 ivomAppMZJm1RJCPQQf3a3Dsr0XSNa49KSnjQ+QEtC+zFfEnN9PjFxCLqkyQPe6ukkin
 Md8gO7DpUYudgahFLVg9MjIhhpC4UHAh29DMk8/Wg0aRDCB/3uWHM38p4chRNTLwiTtu
 wUooG3Go4Ze+UXbvsL5OM50ojQUBLhZ2gb3L61xkV3d10rA38VKCz7l+RITf0vzQ/b2f
 5ZqA==
X-Gm-Message-State: AC+VfDykseTs4AEZEbjo7qdPsgMYCknvN5/3NVJAHVUIIFbNO9GrYJqr
 P/rBUnL1nOezaP8Nu+PAyEx3EQ==
X-Google-Smtp-Source: ACHHUZ5m0+fZBZC74PuVSF50TNZrU4lB5BVimIJf0UB/moRgkUGOinN/zs+UsF+XR3uW/d//lA5nWA==
X-Received: by 2002:a05:600c:213:b0:3f6:91c:4e86 with SMTP id
 19-20020a05600c021300b003f6091c4e86mr21721010wmi.3.1687847084390; 
 Mon, 26 Jun 2023 23:24:44 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
 by smtp.gmail.com with ESMTPSA id
 t25-20020a1c7719000000b003fba80535a5sm226240wmi.24.2023.06.26.23.24.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jun 2023 23:24:43 -0700 (PDT)
Message-ID: <16731023-7dc7-d43d-1b16-fda44c0948ed@linaro.org>
Date: Tue, 27 Jun 2023 08:24:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 03/15] dt-bindings: clock: qcom, dispcc-sm6125: Require GCC
 PLL0 DIV clock
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230624-sm6125-dpu-v1-0-1d5a638cebf2@somainline.org>
 <20230624-sm6125-dpu-v1-3-1d5a638cebf2@somainline.org>
 <c9681bce-efa8-9b79-4bf6-837dd6a2dc12@linaro.org>
 <55b0ca89-8f2e-5383-59d4-6809e813abf8@linaro.org>
 <vnp263d43flny2ibt3n7fbloyi26enqrejnobogplfu5fcj6l3@s7zkxrsi2rde>
 <52c57cab-10cf-2e7e-2c1d-fa6506786d45@linaro.org>
 <jmtjuya4c423rmdlo4ubvvqndbxvgapal5otjqnejdpdd25izp@kewbjmqdu2xs>
 <6311f26f-79ee-c471-649f-5e0b4629cfcc@linaro.org>
 <uuy5prkjhhs66te7h6z3pu4lzj2cfbiqk6ftjijwoeqpw573av@ogs6cboanvzc>
 <ziykmixskqkgheigefvyo4q3katbc4uix6jtcg7mncs25z4tj5@5gykrfgns4bm>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ziykmixskqkgheigefvyo4q3katbc4uix6jtcg7mncs25z4tj5@5gykrfgns4bm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 26/06/2023 20:53, Marijn Suijten wrote:
> On 2023-06-26 20:51:38, Marijn Suijten wrote:
> <snip>
>>> Not really, binding also defines the list of clocks - their order and
>>> specific entries. This changes.
>>
>> And so it does in "dt-bindings: clock: qcom,dispcc-sm6125: Remove unused
>> GCC_DISP_AHB_CLK"?
> 
> Never mind: it is the last item so the order of the other items doesn't
> change.  The total number of items decreases though, which sounds like
> an ABI-break too?

How does it break? Old DTS works exactly the same, doesn't it?

Best regards,
Krzysztof

