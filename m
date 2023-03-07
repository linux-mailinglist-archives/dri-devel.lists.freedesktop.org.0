Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A08A6AD8F3
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 09:16:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C68110E380;
	Tue,  7 Mar 2023 08:16:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B18BD10E381
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 08:16:23 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id k10so25071505edk.13
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Mar 2023 00:16:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678176982;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4nDYeNViOfggxIfzDROShYRUgmdfTcb/BnnR2M5KEIc=;
 b=w8llI7QPcpMyUTDXYAZJGp1+kvh1rlpFLMjH8wbFFDZww7zjI+hLF3l0py/pym6MY+
 9cQAvW2mQjavd2f/CXHyyk1bGlydLLpHrz7RdnmV+HxkdBx77YoqhVUog+iBKCE4AjHm
 e9etJqugxqb3EEaDRF0LNlr+GsmIdkLLhLnPezid7kcj3lGI0g8YHFmeis9nEDeNlNPX
 JgTXzDmZIfR6Mrp6YXdD1CWaToVyoHMRHIFRXLqPvqX6kct1VQGPDgv5X/pdbahI8yyj
 Vo3glMnWIRVqSIXYXW7jRIsim2WlegveWdkCOeM+fZ4hrzb42ehfmxa8V8KSomzkVPa6
 yXSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678176982;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4nDYeNViOfggxIfzDROShYRUgmdfTcb/BnnR2M5KEIc=;
 b=dj/hPhsh+fbT06J3gDMkP0BAHRB/3VKY9oail+48PMVpU9ACpa5HRNH3PLciHksBTe
 TmzFa3XNaM2PHPMNwUNVv6ZvHsXTdT8UWj57pidkxwFXR5YCm0gAtqE/bYv/gy69spoO
 7rwdEK5hpMoWZyzx8p4u7zqBX9oaEMxQ7utBv9JWke3LYpbt3laulR18c/QjAPxTIztO
 JRYpASZkD8JaP+sqBOHktHk05TgFlrJWv4rwX5QrA3CGXDF/Hljp28PmtUmA2FEc5Tv6
 wBORXQdAL11+64WKDlT32o4eJxKIpQ40g+T97Z/xefF0I9qd8E1vnUi4qQS0zGPipq2K
 nUjg==
X-Gm-Message-State: AO0yUKVlFfx1bjMng3scYm34uFj5Czs79xfpBK5FnoBDKxqR2rj2WeCe
 becqland5Z9H0Nbci2twKY3s2Q==
X-Google-Smtp-Source: AK7set9pStbAm3PmBs5vLzhyt+fZdTXRfRWPgXBTYQeJjhU+7VkWzt64OghaTAQEV09Vb5icRVNAlA==
X-Received: by 2002:a17:906:6a1e:b0:8b1:fc58:a4ad with SMTP id
 qw30-20020a1709066a1e00b008b1fc58a4admr18504773ejc.11.1678176982155; 
 Tue, 07 Mar 2023 00:16:22 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:5310:35c7:6f9e:2cd3?
 ([2a02:810d:15c0:828:5310:35c7:6f9e:2cd3])
 by smtp.gmail.com with ESMTPSA id
 j23-20020a170906255700b008d9c518a318sm5788324ejb.142.2023.03.07.00.16.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 00:16:21 -0800 (PST)
Message-ID: <e8c0f0db-fe2a-52b6-ac8c-7810b348af8c@linaro.org>
Date: Tue, 7 Mar 2023 09:16:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3] dt-bindings: display: mediatek: Fix the duplicated
 fallback
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
References: <20230306-ccorr-binding-fix-v3-0-7877613a35cb@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230306-ccorr-binding-fix-v3-0-7877613a35cb@baylibre.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/03/2023 17:20, Alexandre Mergnat wrote:
> The item which have the mediatek,mt8192-disp-ccorr const compatible already
> exist above. Remove duplicated fallback.

Your commit msg is really misleading - I was looking for duplicated
compatible, but could not find it. You just have there unnecessary one
more list in oneOf, so this could be written simpler, but no compatibles
are duplicated...

> 
> Fixes: 137272ef1b0f ("dt-bindings: display: mediatek: Fix the fallback for mediatek,mt8186-disp-ccorr")

Style issue, not a fix, because nothing is duplicated.

> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
> Fix MTK color correction binding
> 
> The fallback compatible has been duplicated in the 137272ef1b0f commit.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>



Best regards,
Krzysztof

