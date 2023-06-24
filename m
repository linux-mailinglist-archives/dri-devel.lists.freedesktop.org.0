Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B7673C9D9
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jun 2023 11:09:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4355710E148;
	Sat, 24 Jun 2023 09:09:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA30B10E148
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jun 2023 09:09:00 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-98802908fedso167465366b.1
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jun 2023 02:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687597738; x=1690189738;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0iJR1qiOnOHItJJH4VOhUi4FNwu4+h9jh885qlL4HP0=;
 b=OT3cBSaqgJw4XxYazcpaRD93GXIBn7LdLztsnGLlMNIEIyOKPL1gZmj3j+HxgBttPb
 0mtbq5H1u7zAWmKBJW/f0KfaG/iOwrpKDdt1GUksKeFH8ZWYFmLRy4vi3+87B7dBvqhf
 0KeBi3ETipQyEr5aymal6vu3bybyt1J02yrnNhDwoNkpFuSnXguiCsRQ8Hr9zx040nG5
 OXUDtuxjgX3Zif51XMvuX7vtVHt+S/K65CKN/ukJmCw2kuHrhogat9TrHvRn3SrFUSDv
 D4uxHmPtbc92N5zinMsOWc6uhMl5acWHRMK0ydlgNuz8u4P+4M/RLEvht4pW01cBa7Os
 ZJOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687597738; x=1690189738;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0iJR1qiOnOHItJJH4VOhUi4FNwu4+h9jh885qlL4HP0=;
 b=cEHWdz2i39CSqq+/TJO6uCOnlfvcE4SwbDgUpWABEg5xQJ8qok8f5y3fUKJ5hk9kKp
 oo333n5mfzKG9dUhLXmdRiz2jr/EFhfjSMe9d6+vVR5tr5g4t19HhIJxlkrd1usxsmBu
 belEkv0rHmKQ1Hn0JXJb3PQoF7EukCGTTRFGpu5LreF+zNKWQDgqDoYEmybtU5qzINbP
 c6MtYtyp2c+ZpDPskeqLKKFh/+xxwKR22cRUBdw/tNvUUnXSJ4Mzg4djY9jiKWB3MVVS
 r5sQrtK7pGFeZLhJdgSu5IomN680U0uZ2bjB8BPqRrSxQ2Xvje25ixs1SksmDzB9BivO
 /APQ==
X-Gm-Message-State: AC+VfDzDD4GfwVu74xlVWiAeO7BYb6v6z0AbSON+Utgv2S9jlanZ1lQ8
 QSvqrRYCu8hcdhsjHnssQJqHTw==
X-Google-Smtp-Source: ACHHUZ57vhhKgA2KWro0eA03NX7qoeLCiR9NZwED/O7dYzF3Ya0EjhnjcRnSJ+HMRT5ofjOczockxA==
X-Received: by 2002:a17:907:d0c:b0:973:91f7:508a with SMTP id
 gn12-20020a1709070d0c00b0097391f7508amr22977407ejc.4.1687597738687; 
 Sat, 24 Jun 2023 02:08:58 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
 by smtp.gmail.com with ESMTPSA id
 p26-20020a170906229a00b00986bf50fe7asm678897eja.60.2023.06.24.02.08.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Jun 2023 02:08:58 -0700 (PDT)
Message-ID: <55b0ca89-8f2e-5383-59d4-6809e813abf8@linaro.org>
Date: Sat, 24 Jun 2023 11:08:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 03/15] dt-bindings: clock: qcom, dispcc-sm6125: Require GCC
 PLL0 DIV clock
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>
References: <20230624-sm6125-dpu-v1-0-1d5a638cebf2@somainline.org>
 <20230624-sm6125-dpu-v1-3-1d5a638cebf2@somainline.org>
 <c9681bce-efa8-9b79-4bf6-837dd6a2dc12@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <c9681bce-efa8-9b79-4bf6-837dd6a2dc12@linaro.org>
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
Cc: devicetree@vger.kernel.org, Jami Kettunen <jami.kettunen@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Lux Aliaga <they@mint.lgbt>, Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, freedreno@lists.freedesktop.org,
 linux-clk@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/06/2023 03:45, Konrad Dybcio wrote:
> On 24.06.2023 02:41, Marijn Suijten wrote:
>> The "gcc_disp_gpll0_div_clk_src" clock is consumed by the driver, will
>> be passed from DT, and should be required by the bindings.
>>
>> Fixes: 8397c9c0c26b ("dt-bindings: clock: add QCOM SM6125 display clock bindings")
>> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
>> ---
> Ideally, you'd stick it at the bottom of the list, as the items: order
> is part of the ABI

Yes, please add them to the end. Order is fixed.

Best regards,
Krzysztof

