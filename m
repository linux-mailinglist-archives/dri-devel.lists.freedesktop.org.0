Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4049E5ED72B
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 10:11:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A403910E305;
	Wed, 28 Sep 2022 08:10:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD13110E308
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 08:10:45 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id h3so13524165lja.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 01:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=rUICUybu6k0R4UQZStovjdZZu8+1QmB1D6rhkDrri7s=;
 b=zcU6Zt06NfSw6rtHpF/0WoRvYMzJGGOGsQ4PtB8bWas8oYS5jS1kApvxWqN4DZbRNv
 fR5rRyUGz5C2pQHyt2eWNrUzy+XWWLbStre7c9kv1tveT1nUaZJZR8FWRKETK4S5hMEA
 RCoHummTvDbLsCSMmVFR2VvkOasUGWwVc5GbAane2C69s+SLWOuGn3K/Z1R8cMEkQ5vB
 GoTrUJrk3XOEA++b7AlZhvnC5mggUa2okKs5TagDlZQ08FRxBMG5TwBGWljqKchuTcPt
 xjNXMwZE5CIJj6h3jW3ZSk6PcRWyDezypPmF2SusxXPrdavZBqjkakaw/9bAr3C0PrSC
 RpDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=rUICUybu6k0R4UQZStovjdZZu8+1QmB1D6rhkDrri7s=;
 b=tSVO1I/kVhVYx99Z/PXDtxvwKKRF1uKFYLQGosoA+cJ3wXqcNhXBYCbJl3VLsinXv1
 LV2NBsLrbbVl6y1pECBUxe0m5KiUaTH6gom/T8Mw7OwhQLjVaZdK4h89VSRVdHJjx/Ih
 hYz38xVHL3eatkdCdoe96/Krfx/tbcFFRKbTAiTi7lVTlkGGvviNPds/W9Cv1ZF+BLPl
 zU8tt3spEnbWYFSo97lr1zCkyavN0XYttpSNrCMVZht2eBb5MyrGG7gjZMXBQJ2s3N/M
 memafHZo0LzE9qA0KFwhHN4Cu9pILkQl21KkzI2SvR92lOcPGmwazbvYrXnSsh8weH5g
 0Z7g==
X-Gm-Message-State: ACrzQf2IIr+YE83Ye40uUTZTSQ8GroMRTXd+4I76lrXKeCA6zLR6i1ln
 2JZAz3pY0nqqq4zqLqDoixKJNw==
X-Google-Smtp-Source: AMsMyM4GcksiN2jCplk/XJkNgZ4GAeUF9gbGq/34+da9ycl8TtmT37p61IniHzNnRv52dUw/ixEr/Q==
X-Received: by 2002:a2e:9c2:0:b0:26a:cbe5:21ae with SMTP id
 185-20020a2e09c2000000b0026acbe521aemr11616443ljj.354.1664352643756; 
 Wed, 28 Sep 2022 01:10:43 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 s2-20020a05651c200200b0026c12b9b329sm370663ljo.70.2022.09.28.01.10.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 01:10:43 -0700 (PDT)
Message-ID: <b4b772c6-8dfe-bcba-8850-aac282f38aed@linaro.org>
Date: Wed, 28 Sep 2022 10:10:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v5 1/6] dt-bindings: arm: mediatek: mmsys: change
 compatible for MT8195
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20220927152704.12018-1-jason-jh.lin@mediatek.com>
 <20220927152704.12018-2-jason-jh.lin@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220927152704.12018-2-jason-jh.lin@mediatek.com>
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
Cc: devicetree@vger.kernel.org, Singo Chang <singo.chang@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 27/09/2022 17:26, Jason-JH.Lin wrote:
> For previous MediaTek SoCs, such as MT8173, there are 2 display HW
> pipelines binding to 1 mmsys with the same power domain, the same
> clock driver and the same mediatek-drm driver.
> 
> For MT8195, VDOSYS0 and VDOSYS1 are 2 display HW pipelines binding to
> 2 different power domains, different clock drivers and different
> mediatek-drm drivers.
> 
> Moreover, Hardware pipeline of VDOSYS0 has these components: COLOR,
> CCORR, AAL, GAMMA, DITHER. They are related to the PQ (Picture Quality)
> and they makes VDOSYS0 supports PQ function while they are not
> including in VDOSYS1.
> 
> Hardware pipeline of VDOSYS1 has the component ETHDR (HDR related
> component). It makes VDOSYS1 supports the HDR function while it's not
> including in VDOSYS0.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

