Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C0A64B5DA
	for <lists+dri-devel@lfdr.de>; Tue, 13 Dec 2022 14:14:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EDDE10E1E4;
	Tue, 13 Dec 2022 13:13:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30BD510E0F0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 13:13:41 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id p36so4789048lfa.12
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 05:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vd3T8ah0dWWDH2U5v0IMPHsJRf7PThuVXGlxa+Fk7UM=;
 b=V1fR4x97oaWfy1VMojxg6M8O2dPqeQVawUxtzpzfwbxeCJOzWCJmgQcNe8l22OI1k9
 UaJ06VWqGFv8hCDEuZth1+8OH+LI5MeQ1oK+ZdqHZ2dDwj3DZoumzNSLSu/m/7O6u5Z0
 tRDwRsta6XHOMSBHDue+xmitUdWdjlUYvLKE3aBX+gFymGdKjiJ+5xLke/pqW0Ayn/Lo
 SZ6vDRn4XE5bL1WcmnFRlMyuiAIIv2UHBig4XRzBv4vdDd2JGwA2cZik9/iHF91X/XWy
 q2OepdSYTD629UA1O7uWAQ0KOa+xHKscbiiTm6fegvMtXfJm/yn06Qs6oFQZ/oPMIWNq
 6yiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vd3T8ah0dWWDH2U5v0IMPHsJRf7PThuVXGlxa+Fk7UM=;
 b=0Miyk2/euxDaVjF4+faYBPGH7dV8auaN/txQYq/h3/kFsdpgh7+ekjnkP1kwQfZlnX
 1nWuOEZQftnPOVOPla3lt5Iz+6Djault/PGziKtrXzgJhcWWClAGqBlhL+GcJmOCImJf
 lfrQqQDls7sk7elz30TAGPQG7hv3L5rI2cKncaaRIk4AhCTL2WTACp5nElpYHAMMXINq
 vCA5rkcPeqsrq2pWjRCjwWX+kW5jXtrEx2hmUBYu8Xv4UUaiyAyqCzElzZS+21RpZG3u
 N+YpxOugxx4eIQqLSRGK6OJZNnOrU8RHqA+QyzRcrb/FVVvBPHXlzsPzQXp1QrOUzyQ/
 SIpw==
X-Gm-Message-State: ANoB5pkvIa1TepPspBcLOj+EqLxXSPQxlwoLMZGkE9rtnGmmtE/+bjfk
 fyOkfHLKM13bbfNJ0ft/+sUhhw==
X-Google-Smtp-Source: AA0mqf5wXBdUAnvmZIvysTHRCIWUkZNsPqVOmaLbYbtInVwUKBFj2syz/R6zVfkeLETTtp1+isewQQ==
X-Received: by 2002:a05:6512:6d1:b0:4b4:91e2:7864 with SMTP id
 u17-20020a05651206d100b004b491e27864mr6016763lff.26.1670937219058; 
 Tue, 13 Dec 2022 05:13:39 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 25-20020ac24839000000b004b5979f9ba8sm360705lft.210.2022.12.13.05.13.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Dec 2022 05:13:38 -0800 (PST)
Message-ID: <bca77270-f3ac-f23f-ef96-43f9f7d574c4@linaro.org>
Date: Tue, 13 Dec 2022 14:13:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v11 2/5] dt-bindings: msm/dp: add data-lanes and
 link-frequencies property
Content-Language: en-US
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
References: <1670539015-11808-1-git-send-email-quic_khsieh@quicinc.com>
 <1670539015-11808-3-git-send-email-quic_khsieh@quicinc.com>
 <5a3865ed-8847-db04-3d60-f35438250bef@linaro.org>
 <5aa16223-dbf6-996c-1985-794302dcce91@quicinc.com>
 <be1411e8-1d07-7643-977c-a306016fd660@linaro.org>
 <b6d90c1f-5365-7197-be63-96c3d8cf0746@quicinc.com>
 <e53844b7-601b-f355-302b-cc871962a446@linaro.org>
 <8b306c8f-3089-4aaf-7fc1-038a8330c89a@quicinc.com>
 <CAA8EJpr5RYyQa7xu1_xJ0F-dn-H9aOf0KE-CDgDCwnZu3HPgXg@mail.gmail.com>
 <a9e2f269-b9df-814f-adcd-f5577f590fa7@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <a9e2f269-b9df-814f-adcd-f5577f590fa7@quicinc.com>
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
Cc: devicetree@vger.kernel.org, quic_sbillaka@quicinc.com,
 freedreno@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 andersson@kernel.org, konrad.dybcio@somainline.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, robh+dt@kernel.org,
 vkoul@kernel.org, agross@kernel.org, linux-arm-msm@vger.kernel.org,
 swboyd@chromium.org, sean@poorly.run, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/12/2022 00:41, Abhinav Kumar wrote:
>>>
>>> besides, i think i have to sent the whole series patches include this
>>> one to address your new comments on other patch.
>>>
>>> is this correct?
>>
>> No. Please fix your system first, validate your patches and send them
>> afterwards. You can not expect others to do your job.
>>
> 
> Just finished working with kuogee on this. This issue had been reported 
> by few others earlier (example 
> https://lore.kernel.org/lkml/bc9be279-a130-d5e7-4397-bbb389d14403@intel.com/T/).

This report says:
"Sorry for the inconvenience, please ignore this false positive."

Best regards,
Krzysztof

