Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B388F6E1E13
	for <lists+dri-devel@lfdr.de>; Fri, 14 Apr 2023 10:24:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0E8610E1AB;
	Fri, 14 Apr 2023 08:24:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3E4310E1AB
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 08:24:07 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id fy21so754253ejb.9
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 01:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681460646; x=1684052646;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=B5WD2gH3v1xh1o9givBu2e0w5swNPvhe4afXVRz+MMM=;
 b=oL2AVZdFWoDex9JkWRqff2ZD9V1chGSVX2PbXu8xygcwfNgaAECi+J/jq4IvngaZ7y
 PXGFg2oWbN+6Ti1aDMNflhZMr4aeTCV3Fn7wAS84QyfBZGasr5mGwO0KpsOsSl3yllKq
 a5Kgb8EnYyMQ2TK5voW/kOf2a52ATwrGmt455naheGH5rx3rVv/nu3hCSVmeLvah5YN3
 09EKjCFWOrlStNsycYRXmax28GtewTPwjDFXqtd4ViyFL3W44QWTbc3Qp7XrRfwjFI55
 1F7nc9TR5jfSu3SLXYSajVg9nGUKOBP1By4Ju0iluU9P8Lg0Gd8VGmCVHAI4Mg3ZEjdm
 vUlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681460646; x=1684052646;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=B5WD2gH3v1xh1o9givBu2e0w5swNPvhe4afXVRz+MMM=;
 b=VnFTDXIudG5AK1p94KDFpFenOnPEgv3EIUPFsPpTMHs7B6M4xWl+pK0+Sh0uzvpuTn
 nxgGVZpAjNcr0Kfxq1neQBpp6A1w3uEq8nVKAurez084T5K+EwhOZkMD5QWZ7uhUmKis
 gy0lUAO6srSH1sqVGjHwrP89BB3UCH+nzW24ytdmwp9LNBy6vMs8oDEN8qbUgY7ACoZ3
 WX/PSSuEZx4Sa+4EEWOQa4+1TistAssdpQ6VKhkUDIzxvmGPZ6Lva1xiDkbnY/ma5eps
 vBfIYBTQdISqQ8rsGQ668NQLLavgGp6viTq2NXnckWgrpa+1GQv750N6MnuCY/+mT+Ob
 sutw==
X-Gm-Message-State: AAQBX9fdNdouzsIPzHaHaC/uoz9WsQZmVdLji3kVTKLJgBDHt8EpbZj/
 OqAS5Hu7lps1zcuSGsvCAW9juQ==
X-Google-Smtp-Source: AKy350Yyst89FsoZKHfvDoqzSjH2OZKJJ8WXXeFSuUX3l3Dk4pEzIM0gMQIP9wV/17aCQ0jwNMC+hg==
X-Received: by 2002:a17:907:1191:b0:94a:4875:262d with SMTP id
 uz17-20020a170907119100b0094a4875262dmr5997882ejb.67.1681460646226; 
 Fri, 14 Apr 2023 01:24:06 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:8a60:6b0f:105a:eefb?
 ([2a02:810d:15c0:828:8a60:6b0f:105a:eefb])
 by smtp.gmail.com with ESMTPSA id
 p8-20020a17090664c800b0094b360a281dsm2094426ejn.123.2023.04.14.01.24.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Apr 2023 01:24:05 -0700 (PDT)
Message-ID: <1ef0beda-9608-d73c-bab6-a07a971f939e@linaro.org>
Date: Fri, 14 Apr 2023 10:24:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 04/27] dt-bindings: display: mediatek: aal: Add compatible
 for MediaTek MT6795
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 matthias.bgg@gmail.com
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-5-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230412112739.160376-5-angelogioacchino.delregno@collabora.com>
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 linux-phy@lists.infradead.org, kernel@collabora.com, xinlei.lee@mediatek.com,
 kishon@kernel.org, phone-devel@vger.kernel.org, jassisinghbrar@gmail.com,
 linux-pwm@vger.kernel.org, u.kleine-koenig@pengutronix.de,
 chunkuang.hu@kernel.org, jitao.shi@mediatek.com, houlong.wei@mediatek.com,
 chunfeng.yun@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, ~postmarketos/upstreaming@lists.sr.ht,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 vkoul@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/04/2023 13:27, AngeloGioacchino Del Regno wrote:
> Add a compatible string for MediaTek Helio X10 MT6795: similarly to
> MT8173, this SoC has the gamma LUT registers in DISP_AAL.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

