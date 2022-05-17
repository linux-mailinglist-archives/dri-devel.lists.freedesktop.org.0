Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2BB529BA2
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 10:02:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48B60112ECB;
	Tue, 17 May 2022 08:02:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7905F112ECB
 for <dri-devel@lists.freedesktop.org>; Tue, 17 May 2022 08:02:32 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id j28so7273744eda.13
 for <dri-devel@lists.freedesktop.org>; Tue, 17 May 2022 01:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=xtfFxNQ4kXjnMowlOhtuczG/jVCPXMAxYap4G9Z9g4o=;
 b=HnPwwtmGhHal34IN62BohKnesTIAiJhZH/Mea1AjY9eivo9Z4ZXNv451zmhJn2bU6r
 G5PtXi9/vxmwNwW9cz/BanVwTkhxLUZ9j4NGk3TWyDI+atyps9zyk7SVj4CwbHlIV2UY
 KphPuli3AQw+8UE+yenQWPNpZGrAFvWsgcV5tMB5Wt0vk6WwRUoZQ/Ienfv3dQd12QAD
 pUzYH8gNLOwNtEO70chtu0cgEOMl7ZE417fud+dIciRDMGLg2anL0BKRhz2X67Me75cZ
 UNtZlLMwUbRhQhWp9UlWNcOkLtVZ2acOeyMHzKKQfkip7CcTf58qLYrt9qFUk63uItn2
 nElA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xtfFxNQ4kXjnMowlOhtuczG/jVCPXMAxYap4G9Z9g4o=;
 b=m7p3L9O888WoSVmmUlwGHQLR2AwNg7MeiS3P3/y/Y10rB4rM6kSFpaYt8zo2Sza2Kr
 cUefR+6smapTmb0APU+QnpjAAIXAsdt2ppdKVGre4KQFDB69xRLL5I3pUjP29Fk7t5WB
 rmdYrLipAx77PAMsEnVoFr017Nmj5/xJ7oCZRLQ0DQ25NA9K6Caj4mbyw29PaMZMvMjt
 nMaJemo4OyWhtNm2eyRnV97qplG8EC39OQ+VBV/SWg6VABauvUOr/U9iFX35Fb8t278Z
 dc8vsG1zzQKGNJ81l2DaUjg5q1y2qyyq7y0I1FpHcANc/Y3PI+ukXJawxAJchKexFjS+
 DVdA==
X-Gm-Message-State: AOAM531mAZkyjElvsN4M5wmxpMcUB6b0f+WH1ffA5RciDatbf5r6Odfk
 qvpUABZ8fU29EIlSG7oiKmOQyA==
X-Google-Smtp-Source: ABdhPJy2xVmqaMW2+SK5q/96Y2Kc8dHmYLGF5OSaHiqk3OvCVkn1VCaUxDtmUCtWcrd9LTtbI/cLvQ==
X-Received: by 2002:a05:6402:84c:b0:428:4cc4:8212 with SMTP id
 b12-20020a056402084c00b004284cc48212mr17530588edz.171.1652774551112; 
 Tue, 17 May 2022 01:02:31 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 md14-20020a170906ae8e00b006f3ef214dccsm737988ejb.50.2022.05.17.01.02.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 01:02:30 -0700 (PDT)
Message-ID: <20a7087d-dddd-134b-4cef-0ebcbc5115f3@linaro.org>
Date: Tue, 17 May 2022 10:02:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v1 02/13] dt-bindings: Add headers for Host1x and VIC on
 Tegra234
Content-Language: en-US
To: cyndis@kapsi.fi, thierry.reding@gmail.com, jonathanh@nvidia.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, digetx@gmail.com
References: <20220516100213.1536571-1-cyndis@kapsi.fi>
 <20220516100213.1536571-3-cyndis@kapsi.fi>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220516100213.1536571-3-cyndis@kapsi.fi>
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/05/2022 12:02, cyndis@kapsi.fi wrote:
> From: Mikko Perttunen <mperttunen@nvidia.com>
> 
> Add clock, memory controller, powergate and reset dt-binding headers
> for Host1x and VIC on Tegra234.
> 
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>

All your patches are send from wrong email address and the SoB chain is
not correct. Please add respective SoB.

This applies to entire patchset.


Best regards,
Krzysztof
