Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D406D2F83
	for <lists+dri-devel@lfdr.de>; Sat,  1 Apr 2023 11:53:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE4AD10E080;
	Sat,  1 Apr 2023 09:53:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D7C210E080
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Apr 2023 09:53:33 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id r11so24711872wrr.12
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Apr 2023 02:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680342812;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qOhA43LmOrt8qpSaW/te4zffJ9QGZH2fj5kj0zYlFHQ=;
 b=aV9fJxI8HVKJHfqCRSmsB9pzLwNDj78SV+1sF/RdFom0TmCGg1D6C4piyaIP+CQlFj
 VY0LBD1dDk+/Xla/udoffg4SS+LjBTOb1GLmTqYdUKwhk50p1YSi40/wldJkLPviZUiV
 vAQJj6CmkuA4NiNaLmTjYjzYL5PHcUZlP13dMnQK34qAOokUXrgnanE8jXMuSJKi0k7n
 i8JiM2VUEZA7xmINNz0rOpgemjCAA/S+y6FGShUA0x7hWUcpgGLRFaqXqlsoRDdtME8Q
 0PscSrdrgv+F37isys+eBaQ2uuV3Ie/rgA4QfYY2mkFGo35nQQ7INBaURS8RvNnz5mk8
 9BuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680342812;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qOhA43LmOrt8qpSaW/te4zffJ9QGZH2fj5kj0zYlFHQ=;
 b=XJ7esqkK2eMCWQnuIfd9sHMRvvicCRCYYn1xPdl0kRpkX7vDMxsOm5znifA6DQyLvL
 s4YTiam6e6FvWa9kOZ8j1gJZ7g0rTSJkXEzbWRiRbrAtaWvOfjLtx/BwuLwAMwN1BRbV
 otsnJmE1+JiNi+bY5mCT/tmUZ+wrhACPV0M3WWirErVTEcvxHHbBe5cLcMMzl0T1ICXN
 wdnt3kwXPkRCQRrT2/kfTNdi9KF8xrix5E8/9vIRSdJz/RM2FNEPDbQeltaVnzV3X9dj
 Zg+iF7Lv7/uUxXVMW0J0f5bvl7mcVWp6zYgY1wFcGmkKyDw58H8R3zUiG0V1QM3DA+5r
 LdzA==
X-Gm-Message-State: AAQBX9fBbmrJlxy9MSZVR2gPiEo/t9LrDFQUHkWROfNPu2Ew5ZzEr8RD
 HiCB/S6X/no6L1JxCoMMMOxnVQ==
X-Google-Smtp-Source: AKy350befYly/lSC5kDrLJqEFpU6KISleaqO8PETRRTz0P/MBUQizsolm9NPaMHLFin3D8iORHoYfA==
X-Received: by 2002:adf:e391:0:b0:2d9:10e7:57e8 with SMTP id
 e17-20020adfe391000000b002d910e757e8mr9128945wrm.16.1680342811799; 
 Sat, 01 Apr 2023 02:53:31 -0700 (PDT)
Received: from [172.50.14.32] (5-226-109-132.static.ip.netia.com.pl.
 [5.226.109.132]) by smtp.gmail.com with ESMTPSA id
 g6-20020adfe406000000b002d743eeab39sm4470590wrm.58.2023.04.01.02.53.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 01 Apr 2023 02:53:31 -0700 (PDT)
Message-ID: <5a8a5cfb-6b56-42e9-8e75-14a936de2c4f@linaro.org>
Date: Sat, 1 Apr 2023 11:53:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] dt-bindings: arm: nvidia: Drop unneeded quotes
Content-Language: en-US
To: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20230331182159.1900674-1-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230331182159.1900674-1-robh@kernel.org>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 31/03/2023 20:21, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

