Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E3C5E793D
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 13:16:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E44510E84D;
	Fri, 23 Sep 2022 11:16:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B02510E896
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 11:16:32 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id o2so19249317lfc.10
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 04:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=imfixrLTcFv0DjzU/dBzDYnTw5P7/+vfO0bvwY3AaxI=;
 b=MoPAeC2L93mgPRD5pDgFVI6zu+tIfs/JI3Z5NQ5sk6nDadC/eSzT/hsTzjUOTbWEOq
 tOdtkpPuIqXaYzi6qUcbd5WMDaDx6qAsyOrSWU8pTT0GUbXRXG/Fgbq4NmyI9XESozAK
 0SMMy/CMOljs9VJUyp1n70p2iKCPrZXmAZxGKLOLbI4usnuKaVlDwZIW8iaM194o6Ahc
 UIr4yZiSx+eG2Y+L16RfslOBJHlOlvHOgxdqhXCF9U1O0ZgIvBeX9LXW9JwULrdJYDw7
 Hlv7soEyuVBmuKo8akucgCVfR5PrtrimIfOpAT8xh3qNdOSKBOLOqQjxRMpbeF2YN5wv
 L1Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=imfixrLTcFv0DjzU/dBzDYnTw5P7/+vfO0bvwY3AaxI=;
 b=se29JHt7K8YhtukSjfiBMuRSJOdye/6VRFh271JXDxOOlJaNnTBHchJNvQo7ij6Syp
 yOTFdPgWKxH2WYCzf9haqKZ93iMQ4nDGoHIhE5D+wUx4DEXpYbjNGiTB0jlrdRu6UV9B
 TNUFgxTaypZUzzBY+3SGekcKgrd236Z+7M/bfdHOBKMCGYxoL8sRDFGfYEQn3YltSJTl
 CewhfimoE2mX3YRdlKAFbGZ+8R0iwfpVJoz8rh7xggTftj1BB2w7eUqX17Of1uWA1WUg
 9kWo5zdIvao4YvW7BVmmAVQmwkK85sY2QyVid052jN4uDtqmxv8+ess/HOUiG5FtLqzT
 xS6g==
X-Gm-Message-State: ACrzQf1kg0Zi6siSyYtEicRy7ilDiX0D416VQJEAVvE6pdd2cYiANVVg
 LzLAW0Vme4W/1Hk4T0wLBuUgUg==
X-Google-Smtp-Source: AMsMyM4gSgqslj/MXw3qZkhMqASVAraPUn/Jbo4yjv87pRK0j9zeCR2ZBNA3WHH91SMkygEjXeAtgA==
X-Received: by 2002:a05:6512:3d87:b0:499:f2b6:7021 with SMTP id
 k7-20020a0565123d8700b00499f2b67021mr2854963lfv.103.1663931790576; 
 Fri, 23 Sep 2022 04:16:30 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 g8-20020a2ea4a8000000b0026c3ecf9a39sm1348838ljm.38.2022.09.23.04.16.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Sep 2022 04:16:30 -0700 (PDT)
Message-ID: <33e9babb-0492-2f41-d055-45ed32d55906@linaro.org>
Date: Fri, 23 Sep 2022 13:16:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] dt-bindings: display: mediatek: dpi: Add compatible for
 MediaTek MT8188
Content-Language: en-US
To: liangxu.xu@mediatek.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de, 
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 jitao.shi@mediatek.com
References: <20220923014227.6566-1-liangxu.xu@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220923014227.6566-1-liangxu.xu@mediatek.com>
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
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/09/2022 03:42, liangxu.xu@mediatek.com wrote:
> From: liangxu xu <liangxu.xu@mediatek.com>
> 
> Add dt-binding documentation of dpi for MediaTek MT8188 SoC.
> 
> Signed-off-by: liangxu xu <liangxu.xu@mediatek.com>

Where is the DTS? Where are driver changes?

Best regards,
Krzysztof

