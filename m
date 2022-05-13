Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9B5525D5A
	for <lists+dri-devel@lfdr.de>; Fri, 13 May 2022 10:31:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7690210E865;
	Fri, 13 May 2022 08:31:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B898510ECC0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 May 2022 08:31:41 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id l18so14775348ejc.7
 for <dri-devel@lists.freedesktop.org>; Fri, 13 May 2022 01:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=TNsY3qFCwXQblJPsVdG0LCyrHmw8JZ3ev2jxwT+LE+k=;
 b=UmoVPN2ActdAg0q/sV9x+QJ52g/PRzhZYttsOVqZVE9TDTLQCLgWe93efuunDeoxjT
 JKwn69yqazKwiIaopRnbqE/8GHCsx9Kv3ntH8qnhKygS8mJ14jDjtAMFSBOuwvQoa9Ct
 YaPjpGSl6DdFPek+/OyRhTvuFBMcBwG4+Yk2cQpAKzZkUcphG0Vf2zGx0nVsw0faKeTK
 +BbguEHyFGfTnEpGH1atu8e3E0LvKRJDWkjkwgUEPXC1VGmuX+j9/BJpwEneLkcWH5D/
 wgq8A4ncwnOA/+xOuHfLxxt9VhVLX9oUdfWFMKIV0b8g1C4gBIBClbHFabaBUYNMiIvg
 7C3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TNsY3qFCwXQblJPsVdG0LCyrHmw8JZ3ev2jxwT+LE+k=;
 b=Nt1BQ3NrB4cdPx5h2D00UmvzWpD/66yOA7KoScG4YONJ+TJwS5H4WFdgcSwKemMaxG
 8mVmbtHgWwkbqOBsxIwWYM2Vq+YRkjmqFaKRyBY4XByjiZEvbzwz7r0nEkYomKl5Tx8C
 /knIekOmoi5Dw2jIJRe+vwJ2hpI/w6KfGn/zWM27DnL8ByQDCJd8jmpvUprivPqMYAD7
 1CTvzIsDpxtFT9DRgwlsQ8UJ6kWEvBh2BJI48cPTe21vsaS+COOItWtCtL7fFHIWdATM
 bRRgFN1gZ0lB+LmNPACQTTLJwNycD7lDJFerJxuCEa3L7C6y8oDhUFselCnu4h8A9R2y
 qv1A==
X-Gm-Message-State: AOAM532BYOuDyblBlxYvIrAgtIoYEPrrV3Xs1m+0XnTSks2uOP5CcuVT
 XEl5Z8OtF74cnw8LOwCsfqw7zg==
X-Google-Smtp-Source: ABdhPJxqCWpvbuwp3Q2VpbEQTmfvZ/vEwaSon3Dgg8K2eunwuY85dxL2dgA71OmAhW/k9YjTGKOZCA==
X-Received: by 2002:a17:907:3e94:b0:6f4:64ad:1e2 with SMTP id
 hs20-20020a1709073e9400b006f464ad01e2mr3241417ejc.464.1652430700338; 
 Fri, 13 May 2022 01:31:40 -0700 (PDT)
Received: from [192.168.0.169] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 eb22-20020a170907281600b006f3ef214e51sm511129ejc.183.2022.05.13.01.31.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 01:31:39 -0700 (PDT)
Message-ID: <cded90e2-b060-d144-b20c-cb8fdfcd4a7d@linaro.org>
Date: Fri, 13 May 2022 10:31:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 3/3] dt-bindings: mediatek: add ethdr definition for
 mt8195
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de
References: <20220512080523.25082-1-rex-bc.chen@mediatek.com>
 <20220512080523.25082-4-rex-bc.chen@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220512080523.25082-4-rex-bc.chen@mediatek.com>
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie, jason-jh.lin@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, nancy.lin@mediatek.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/05/2022 10:05, Rex-BC Chen wrote:
> From: "Nancy.Lin" <nancy.lin@mediatek.com>
> 
> Add vdosys1 ETHDR definition.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
