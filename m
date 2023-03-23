Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93ECE6C6943
	for <lists+dri-devel@lfdr.de>; Thu, 23 Mar 2023 14:13:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C07610E815;
	Thu, 23 Mar 2023 13:13:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ED0E10E815
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Mar 2023 13:13:05 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id u1so1087157wmn.5
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Mar 2023 06:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679577183;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=juhp9OBUsPann54i4wUeJoNbrt/MgaPH7KWeZa71+xE=;
 b=jNzxhh+kAMOJUnJAJiZlm8CqqNjJB84FeneV/bsFBFNkwsv5ewzKW99RwM/+yo+dWD
 O5M7PoVQ+HmSm0Fp7TUSM4WUmaCD/M9RquYD/SYCw+xZ3DF85LQBhq6DffN9QsAzPSiz
 +SXGeH8zvrCymDFBZtcQHoWfSF5M0GCyh2Yk8xunJZ3oUEoj5sOSwvola6tWm9KPAExx
 wppVx0YrDi/ArfaymWwbqT75kwaGW9d3Z9Vn8zQPyMtL5GoGAHwYOoySoOmjx3hdS1VP
 UJk4RORne+G8ZcUQqELIerD3KaGhrzSzjw76MslFrWinmJXZ+hINTJ/vsGD5S7LbjbfF
 VXWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679577183;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=juhp9OBUsPann54i4wUeJoNbrt/MgaPH7KWeZa71+xE=;
 b=CUJAvWeqgh5xfMwqFiXofKtJVJItaSHAqG//hOpsKDW4V5EC1sl/cz1MfN+ME9EWjo
 IfBsGpudiB9eBxnI4YvEiMfTb6/7hPO5GRNtzC5IdKol7NFP8Lk9HgrU5bX53AFsbYUc
 U++9M6G5TWnm8PQN98t+yO4eZkeY425D+JFbLYFAPrjNK0VK640hN/MxnMUsyqROe9KA
 6mSP1sKTY2qCgLih6HKgEOKUHMQSGwiRGEaQSQvxacyW9IBn5hBa+nOq9ZH9k2OSYHH3
 +zRhkTucN5SfoeQqK7cLnqowgGqx9ZLtfohGBU6En+zpJHJ5cKBeBy2pGGKyqUXSsBda
 Fuxw==
X-Gm-Message-State: AO0yUKWv18Aqmt52dLZrzFd0rkXuuTY6X+fqoJzNpYSky2J/BnsDt311
 cbrZ+xCYps/cwfwEZwxDKUngcw==
X-Google-Smtp-Source: AK7set9AOlKnA/7JArDu4NZy/tacv+1Jc1By+62lRGQ2qjTDOfxTCEOmbDcLbYSrwaVOaWhWVZPiKA==
X-Received: by 2002:a1c:f709:0:b0:3ed:c763:2765 with SMTP id
 v9-20020a1cf709000000b003edc7632765mr2405501wmh.7.1679577183642; 
 Thu, 23 Mar 2023 06:13:03 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:e25a:65de:379a:3899?
 ([2a01:e0a:982:cbb0:e25a:65de:379a:3899])
 by smtp.gmail.com with ESMTPSA id
 v4-20020a05600c470400b003ee8ab8d6cfsm1825918wmo.21.2023.03.23.06.13.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Mar 2023 06:13:03 -0700 (PDT)
Message-ID: <006bf3bf-ab9a-4a08-3ba5-fa23ff4ea05a@linaro.org>
Date: Thu, 23 Mar 2023 14:13:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 6/8] arm64: dts: qcom: sm8450: remove invalid npl clock in
 vamacro node
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
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
Organization: Linaro Developer Services
In-Reply-To: <35e3aa8b-ccff-25fa-42da-d8934ef366c6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Reply-To: neil.armstrong@linaro.org
Cc: linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Krzysztof Kozlowski <krzk@kernel.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/03/2023 11:47, Krzysztof Kozlowski wrote:
> On 23/03/2023 11:25, Neil Armstrong wrote:
>> Fixes the following DT bindings check error:
>> codec@33f0000: clocks: [[137, 57, 1], [137, 102, 1], [137, 103, 1], [137, 70, 1]] is too long
>> codec@33f0000: clock-names: 'oneOf' conditional failed, one must be fixed:
>> 	        ['mclk', 'macro', 'dcodec', 'npl'] is too long
>>
>> The implementation was checked and this npl clock isn't used for the VA macro.
>>
> 
> This does not look correct. DTS looks good, you miss some patches in
> your tree.

I'm based on today's linux-next, while the other lpass macros uses the npl clock,
the lpass vamacro bindings doesn't document the npl clock.

And I found no fixes whatsover to add the npl clock to bindings.

Neil

> 
> Best regards,
> Krzysztof
> 

