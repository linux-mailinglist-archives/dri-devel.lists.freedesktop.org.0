Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8326F6C870A
	for <lists+dri-devel@lfdr.de>; Fri, 24 Mar 2023 21:47:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF01610E074;
	Fri, 24 Mar 2023 20:47:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0822F10E074
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 20:47:28 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id ew6so12573790edb.7
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 13:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679690846;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gvJuFk30qXvHsXmKvq2WXms+VNACf251BO2nmorEuAE=;
 b=TPOAgzMTYkViLIjcHeqRkpM16OmWLnnbSWgzEmaWJhwgv6eN1kJDftmvs1qIr3Lpic
 ypGfjEotaFTMZpJBjFijOTrxiGbMN2vhUX+dyTqFbm9U1NI7mTwp+TM2X5IMrdIYObb1
 QCB0JNg9jdvMvi2jimAXGw/rrnK/mikPXCPcvazVy+qiYekvbuqavaUQ/HBEhUDPcfeE
 7U0QDgpID8b7+iN+jfwEGzyC+OIPybCaixweKOBhBIL+6sbMSCDxbkuom5nH3Z/kZUh+
 1us+I2Is9gmKVZRbqsGTsU7zIVTW+rzj5UdwTPuf4VFL+OpMXhvvqEwbP2xCCabM8XtZ
 sAyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679690846;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gvJuFk30qXvHsXmKvq2WXms+VNACf251BO2nmorEuAE=;
 b=AbrvRZ9cYRiO8SrBbzFLix34ZGkWsPLVrRUXPXFGS9n8qk25roh6UoF4s/xEbjk6CU
 N9IptfkrC/ts6VWXHxaEsx7YeYqB96Nst9tvJLpK4GLMJEwIoZiAawsEVDGaH0zZGM7o
 TSitfzfP27ARg5NV2TK20Ohg5+GG4lH/OC+XsBp2PXyITcC+xNr6Ntt7WQnqTecPvQVi
 eI1feUX6pPrfr9k69/djqE69VUUgJr45wQtqwYS90ps7Ur1kyiPuToRf9K8ErFoRp23P
 1Tx3yVyhpHkqFGlwLJuto9E5lxjlx32CZFEbzVMrhm/0TNjxMjZGMUHaKwHEhEhSo6ey
 eT2w==
X-Gm-Message-State: AAQBX9fZqiASiFgeGrlBhWvc8nPvPLA92Oj957J5nSb3nKbVPiRFa7gd
 3Vs3nYq9ErozfK1JLKsPWSVGrkg6uvg62At580Y=
X-Google-Smtp-Source: AKy350YwCpEJ2Rxx3nxkTYvfEOr50qMbvXpKHh3yxBpw2u57GGoC30mDM0iDbjcLJi0wu6059ATpFA==
X-Received: by 2002:a17:906:b049:b0:937:9a24:370b with SMTP id
 bj9-20020a170906b04900b009379a24370bmr4185300ejb.67.1679690846477; 
 Fri, 24 Mar 2023 13:47:26 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:3027:fb0b:ae08:588?
 ([2a02:810d:15c0:828:3027:fb0b:ae08:588])
 by smtp.gmail.com with ESMTPSA id
 v15-20020a170906858f00b0093229e527cdsm10307455ejx.42.2023.03.24.13.47.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Mar 2023 13:47:26 -0700 (PDT)
Message-ID: <8c88fe1b-cb91-22e3-6fcd-c2fdf2202cc0@linaro.org>
Date: Fri, 24 Mar 2023 21:47:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: sm8450: remove invalid
 properties in cluster-sleep nodes
Content-Language: en-US
To: Bjorn Andersson <andersson@kernel.org>
References: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v2-0-0ca1bea1a843@linaro.org>
 <20230323-topic-sm8450-upstream-dt-bindings-fixes-v2-2-0ca1bea1a843@linaro.org>
 <20230324174518.2arvdglqqixmxqcp@ripper>
 <fdd51d3d-a1fd-c3a9-c578-59a11c5213de@linaro.org>
 <20230324195713.5blwpv7xjijlrtt5@ripper>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230324195713.5blwpv7xjijlrtt5@ripper>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/03/2023 20:57, Bjorn Andersson wrote:
> On Fri, Mar 24, 2023 at 08:27:12PM +0100, Krzysztof Kozlowski wrote:
>> On 24/03/2023 18:45, Bjorn Andersson wrote:
>>> On Fri, Mar 24, 2023 at 10:28:47AM +0100, Neil Armstrong wrote:
>>>> Fixes the following DT bindings check error:
>>>
>>> Is that because idle-state-name and local-timer-stop should not be
>>> defined for domain-idle-states or are you just clearing out the
>>> dtbs_check warning?
>>>
>>> According to cpu-capacity.txt local-timer-stop seems to have been a
>>> property relevant for clusters in the past, was this a mistake in the
>>> binding or did something change when this was moved to
>>> domain-idle-states?
>>
>> I cannot find anything about local-timer-stop in cpu-capacity.txt. Where
>> do you see it?
>>
> 
> Ohh, you're right it's only mentioned in the example.
> 
> But idle-states.yaml documents the property for both cpus and clusters,
> and it's used throughout the examples.
>
> Our cluster states are defined in domanin-idle-states instead of
> idle-state, does this imply that the flag is no longer applicable
> per cluster in this mode of operation?

As you noticed their meaning is interleaving. For example on SC7280 we
use arm,idle-state for cluster. But other Qualcomm platforms rather
define clusters as domain-idle-states and in that case, nothing parses
tgat flag. The flag is only for cpuidle dt_idle_states. For
power-domains it was always ignored.

Funny fact - both cpu/cluster idle-states and power-domain-idle-states
will end up eventually in cpuidle-psci.c...

Best regards,
Krzysztof

