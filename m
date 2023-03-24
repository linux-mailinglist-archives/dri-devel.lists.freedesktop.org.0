Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBA46C78A6
	for <lists+dri-devel@lfdr.de>; Fri, 24 Mar 2023 08:17:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C247210E50B;
	Fri, 24 Mar 2023 07:17:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD09E10E50C
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 07:17:41 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id h8so4144562ede.8
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 00:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679642260;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aXAkVT7qE3o2b6C1GZG01G7UNo5SeuZbrIlsD61ojCg=;
 b=WZLVM+Pvfjz9X30E2t8w3NE+GPwpnZcHc3b860wehev3NfRVUhKjczo7KpM/+Nv+aB
 Qe1ZdEuzfcoHXfljY1J+hOFllH3jsHTI/eX4O1i7tJKofF7J2WVA1TZh19r/Ry9PG6Sb
 sbiVK/XhecqUzwxRoadxoayaqwPEYt14l16rlKvhaBJ8ji8dcnZNd1hihPs5V4m9xDhb
 M9W5K/VvULUiC10++uH5t7hoEs6yfpyT6VKFJtkKVhQ163arDQAS+DkHysj8pn65CJao
 nAZKAE9Q6SZFYJ5Z7YGdl4rPE641i8GdCuQhQTg9q0SUI2mOlUviYms3O5SBepQwqlQX
 Vmvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679642260;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aXAkVT7qE3o2b6C1GZG01G7UNo5SeuZbrIlsD61ojCg=;
 b=ogzpSPh9bSPP0eyTQjqd3+QQvHCAgcolmznvowR6/uhrNkiLSYE90Un015LEhsQpvo
 A/xZ/Zoar5MWq6qOQfmtiNEHzpcARGUQiQdpHWdCmy+qjgVRaOL4eVoyyZn4SrINHHe/
 YTEAf0nkWgigQqFpI31ycfPLIHWvqD9SaK5vXcAK855RAvbLrhKOT3CHe/nTi1cDH13Q
 /tUpqjO0J21Pa3swgJdTInXiNZJ2wOmVVlpaU+d/4lonkc5/b8I+lUBxsB9VAVsjzusn
 FU1FQY1YBrHSuR1hruCM1S7NEd8pEKL0m6Y/HexStZFrqylSsv2dPncq+OX1MfZq7BcM
 QvcQ==
X-Gm-Message-State: AAQBX9eTnf6HZ+ZN9Z7YZUh9Eahsq91QW49uAetc9AvJ+w8c/Lq5X2wM
 fcOVWoFOIyDq9W1fWfsKzoqakQ==
X-Google-Smtp-Source: AKy350Z0IEgUlLyGvvrQ30h1GQdZUzu5+nU1YNH91UDza4dmttvtndN3IIVzkTqrz4PLJOMOJ62uwg==
X-Received: by 2002:a17:906:b74f:b0:92d:591f:6586 with SMTP id
 fx15-20020a170906b74f00b0092d591f6586mr1897064ejb.34.1679642260303; 
 Fri, 24 Mar 2023 00:17:40 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:ce50:243f:54cc:5373?
 ([2a02:810d:15c0:828:ce50:243f:54cc:5373])
 by smtp.gmail.com with ESMTPSA id
 24-20020a508758000000b004fb419921e2sm10316150edv.57.2023.03.24.00.17.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Mar 2023 00:17:39 -0700 (PDT)
Message-ID: <306b02e8-72bf-3eb7-f4cc-3cc5c598993b@linaro.org>
Date: Fri, 24 Mar 2023 08:17:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 6/8] arm64: dts: qcom: sm8450: remove invalid npl clock in
 vamacro node
Content-Language: en-US
To: neil.armstrong@linaro.org, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Lee Jones <lee@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 Bart Van Assche <bvanassche@acm.org>
References: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-0-3ead1e418fe4@linaro.org>
 <20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-6-3ead1e418fe4@linaro.org>
 <35e3aa8b-ccff-25fa-42da-d8934ef366c6@linaro.org>
 <006bf3bf-ab9a-4a08-3ba5-fa23ff4ea05a@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <006bf3bf-ab9a-4a08-3ba5-fa23ff4ea05a@linaro.org>
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
Cc: linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Krzysztof Kozlowski <krzk@kernel.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/03/2023 14:13, Neil Armstrong wrote:
> On 23/03/2023 11:47, Krzysztof Kozlowski wrote:
>> On 23/03/2023 11:25, Neil Armstrong wrote:
>>> Fixes the following DT bindings check error:
>>> codec@33f0000: clocks: [[137, 57, 1], [137, 102, 1], [137, 103, 1], [137, 70, 1]] is too long
>>> codec@33f0000: clock-names: 'oneOf' conditional failed, one must be fixed:
>>> 	        ['mclk', 'macro', 'dcodec', 'npl'] is too long
>>>
>>> The implementation was checked and this npl clock isn't used for the VA macro.
>>>
>>
>> This does not look correct. DTS looks good, you miss some patches in
>> your tree.
> 
> I'm based on today's linux-next, 

Which is unfortunately not enough. Several things were
fixed/added/changed and are pending. I brought the topic of pending
branch few times on IRC for that reason.

> while the other lpass macros uses the npl clock,
> the lpass vamacro bindings doesn't document the npl clock.
> 
> And I found no fixes whatsover to add the npl clock to bindings.

Really? lore finds it easily:

https://lore.kernel.org/all/20221118071849.25506-2-srinivas.kandagatla@linaro.org/


Best regards,
Krzysztof

