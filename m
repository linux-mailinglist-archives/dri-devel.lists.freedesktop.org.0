Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 488C67465F8
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 01:02:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EE4D10E249;
	Mon,  3 Jul 2023 23:02:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95BFF10E24A
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jul 2023 23:02:03 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4fafe87c6fbso7660275e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jul 2023 16:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688425320; x=1691017320;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JYnjAjsNdc+08o7EfBrn0+tklBHBzj+VlOunjsVeIes=;
 b=sibiPYk/YJKgJiBGHF8C2gv7Orv9I7XefFQOV/sb/PxrndhfP9Zbp9YizegWG9y4Fr
 5XWLYeOXVwjavRSiX1PseOeffxEd4vP7KbSEdqTO0TYz10xHnpdPONC1dJBjEuvdcnvD
 aGse+zNiRl4W4qL0c4RZZ0MULPO2B4Aa9ktN421OFr/vS161jggrL+X2OaS8NGSR9APW
 s8iqA1JV5S9R1yow+ZyVKtb6xCze7TVxK+MZNYQ09jtl37vxSTZyY3PNMavIoNQkgFxU
 NebITzm5Mo/8NyIRLS5L+sM5DEYP61sHk93U/WZEW8/GUF3uB6U6/8FbwICfI0QUeSXY
 IQLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688425320; x=1691017320;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JYnjAjsNdc+08o7EfBrn0+tklBHBzj+VlOunjsVeIes=;
 b=Y538pQysN463xZS/W7dQoBJNSq2zBecgc2eKBLF65KTWcdjh+SMMZB6r2grW4Mme6I
 6cMrPa5mF3L0yO9FZpiDweBGg0Fed67M0CdX0UlLwJ6BYcj7i6E6JWqJwUrjPf3F/17s
 OEqtQTjcQqLQDcfytdHoxOuTHCd2yrM7dQ0HlnyWIaLCcT7VI8eJAlEy/2+jsBDSbknh
 EyMqUjnIpoJnJszBjLvb/OpEgVevPJvNxe7Ia7Dwh/Z2+gRsrxh/55S7iWUhuhe2lEQ1
 mi5nw8IH9laIuNmzANqae35MgVe7tuNmMbLh+C0wMHMj2B8TYAzeopQt79MS2cfcOoqS
 JOuA==
X-Gm-Message-State: ABy/qLZRFFfbk+5pM0u/FOV5haKTukUOFKKmkvtrPYnLQYgF4TD7BZ0h
 yOXISwZH2EvMKnkblkGYcQHB6w==
X-Google-Smtp-Source: APBJJlFugmQY5xvSs/ktG8Zm+2+0PfQ9R6eeHqJiC2Wo1/jOi9JmJ35CadEz5D48JhJml5DGCDH4cw==
X-Received: by 2002:a05:6512:3f02:b0:4f9:b6f8:844f with SMTP id
 y2-20020a0565123f0200b004f9b6f8844fmr8008342lfa.39.1688425319700; 
 Mon, 03 Jul 2023 16:01:59 -0700 (PDT)
Received: from [192.168.1.101] (abyj26.neoplus.adsl.tpnet.pl. [83.9.29.26])
 by smtp.gmail.com with ESMTPSA id
 y26-20020ac255ba000000b004fba6f38f87sm2134802lfg.24.2023.07.03.16.01.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jul 2023 16:01:59 -0700 (PDT)
Message-ID: <654b0bbb-9dc3-b71d-b16f-cf6b1a327bbb@linaro.org>
Date: Tue, 4 Jul 2023 01:01:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 0/4] Qualcomm REFGEN regulator
To: Mark Brown <broonie@kernel.org>
References: <20230628-topic-refgen-v3-0-9fbf0e605d23@linaro.org>
 <b93cb054-fd42-46e5-aef3-dc41b36a85f9@sirena.org.uk>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <b93cb054-fd42-46e5-aef3-dc41b36a85f9@sirena.org.uk>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Andy Gross <agross@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4.07.2023 00:59, Mark Brown wrote:
> On Mon, Jul 03, 2023 at 08:15:53PM +0200, Konrad Dybcio wrote:
> 
>> Recent Qualcomm SoCs have a REFGEN (reference voltage generator) regulator
>> responsible for providing a reference voltage to some on-SoC IPs (like DSI
>> or PHYs). It can be turned off when unused to save power.
>>
>> This series introduces the driver for it and lets the DSI driver
>> consume it.
> 
> What's the expected plan for merging this - should I be applying the DRM
> patch?
Uh sorry for not clarifying.. please just take the first two.

Konrad
