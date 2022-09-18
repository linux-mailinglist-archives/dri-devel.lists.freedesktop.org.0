Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C81D65BBD43
	for <lists+dri-devel@lfdr.de>; Sun, 18 Sep 2022 11:59:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C6D510E506;
	Sun, 18 Sep 2022 09:59:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2A3210E506
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Sep 2022 09:59:40 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id y14so178721ljn.7
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Sep 2022 02:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=3ca7URV85yKrxkToGpu5yTV2JozZM+SddjYQgSu2cPE=;
 b=NOcdK9y/IjxvLB4AlRNbhchnxrCLfR6JPe46yDdIinRSWhtPe2DIGR+jViOuIdF9JM
 7Y82F9iTQixXrvZE1Gb8a3LYZMV2kSA76NMRrQRrdgR9CtYdHDv09+Z9FHoekSHSshHl
 V+0hh/FwUDRiuV/pCrfPWXWrxOxScvQj4+ACgX4p1+VmJCtM3Pf7QdVcC9uDf196BYld
 SvW9UxigPwEKACj833dwq8FgRAPr8ieQKqnL3dteFivX4taQIGE8vTNniNKK5pWKUd/0
 Z30zxc6cPQCdAgsZKNL+6X4ZQB1ko9AxFL4CbZ6pn2KQNRmvpNOPqmTZlK2eDTPQBcTz
 Zk6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=3ca7URV85yKrxkToGpu5yTV2JozZM+SddjYQgSu2cPE=;
 b=rYHwQNfVN/U369G4g1MvQNGmCNnUR+Nr4/7TWXi+gAXEZvej2RS+Pjy7Wf4M+rViId
 7Iqy9WCn3C4mT8SWIx8YSbjBWC1l6KzHEn0rmTTRPtT/n1W2u0UyVOJb4liMbb3+BPyj
 eBUzY/15X//GO1xRsNRXjhKi0su9k9TWCdU4+GlhGDrumcDK24bWItrBnZyKEUpDRxMx
 bNJoE5T/+0itJ9+co9uhqmj/GkB80SyYxCYq3+dj9rG26W94MmLkSr0PYTIuG550+TOj
 k1glikzfkiod0u830NQa/bO1VkKEqd/POQ6ShYdpmMDu72TZv+tk6zj7IAUs4vAz3upq
 cHKA==
X-Gm-Message-State: ACrzQf2bBLBbp6peE/fqUYWI6ekPow4blv9D0hCrFo8MZJaCcc54sWe5
 oI1RrkIaU5PMdEUeBFLDIBFQ8A==
X-Google-Smtp-Source: AMsMyM6wA7xiTfhm8VgutQ4QQLmSyc5iFV5KfVuxKLS87itQMc+B2x5hO48lsJyXLMZ9mMrxMnGLAQ==
X-Received: by 2002:a2e:bf23:0:b0:26c:83e:b4d3 with SMTP id
 c35-20020a2ebf23000000b0026c083eb4d3mr3666235ljr.282.1663495179307; 
 Sun, 18 Sep 2022 02:59:39 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 du7-20020a056512298700b00498f67cbfa9sm4580438lfb.22.2022.09.18.02.59.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Sep 2022 02:59:38 -0700 (PDT)
Message-ID: <e88739bc-b799-bb5f-cd5d-73e9e689cbba@linaro.org>
Date: Sun, 18 Sep 2022 10:59:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH RESEND v3 2/9] dt-bindings: mediatek: Add gamma compatible
 for mt8195
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20220912013006.27541-1-jason-jh.lin@mediatek.com>
 <20220912013006.27541-3-jason-jh.lin@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220912013006.27541-3-jason-jh.lin@mediatek.com>
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
Cc: devicetree@vger.kernel.org, "zheng-yan.chen" <zheng-yan.chen@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/09/2022 02:29, Jason-JH.Lin wrote:
> From: "zheng-yan.chen" <zheng-yan.chen@mediatek.com>
> 
> mt8195 uses 10bit-to-12bit gamma-LUT, which is not compatible with
> current 9bit-to-10bit gamma-LUT.
> 
> This patch thus add constant compatible for mt8195, which means that
> mt8195 should only use specified mt8195 gamma driver data.
> 
> Also, delete related compatible from enum, to ensure that
> mt8195 will not accidentally get others' gamma driver data and thus
> cause fatal error.
> 
> Signed-off-by: zheng-yan.chen <zheng-yan.chen@mediatek.com>
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
