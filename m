Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D4C5BBD32
	for <lists+dri-devel@lfdr.de>; Sun, 18 Sep 2022 11:59:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC49110E504;
	Sun, 18 Sep 2022 09:59:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4F5910E504
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Sep 2022 09:59:22 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id f14so41348863lfg.5
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Sep 2022 02:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=4ehZ01ierpa8aV+DwFDA/QfU8AbJ3Sxz0urqCktyHto=;
 b=zfbTfZTBGGrOtwcCfbQ2TIWBCBfcERkyEFmwGP882yp4QL4Z/LjPDolpNmRdxMRnel
 h4GH1vknLx8OIN8GhLFfqFHXImzyArBiAv4Mli6zjuGUIUlIqAyo0M5K0NOxw473WvfL
 LiQ9QfKnxkSCT6xBgttVDJUVs/0Zi3HPkqIelat3l7o6wPh1dspA5pn09CRFUgOQACa/
 8nl67ooK8btEibjOfIQvC7F9poEzItq0uT5PXnsA1JobO3CQHMYCGIexjrgElBsxOSJA
 zSrFbdS0VEAuHfHMLZwlmy4hlgM4fz0Tfw7GGro98L27HrwIl2VAJI5JtbEwDjWKoQR+
 Tn+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=4ehZ01ierpa8aV+DwFDA/QfU8AbJ3Sxz0urqCktyHto=;
 b=qu6rqJhSDfAtu5yVesadkoXio1AuftknSFB/m3a8sVEnu3DQqip4q9QrYQQ764Mwc6
 QXcGJpmZoPmcs4tH/WE0CUTY76m9P9TO+KXRfTtP743AVzVr1s5lmjdp7KjUItXFXTcT
 Yeg1eDAoXVjx+XXcxv3eCx5fgKGsAXejzgeEqT4KzxOwwIz0w3ODomCqJq61uYwfDN1B
 smL6KtyjMVrZ2N5ChleafaMWK2eFn3Zw/dbUubJLO0jpNbR09Ke2ZAwT0SQYKbO/2qG8
 F3Si4+0Lf8kz5dxMaIFZ0lHOMEwAJ77gmjMXUSXRYzmzB4eXPGoH6EuRfyOEqoFjpZSJ
 FtXA==
X-Gm-Message-State: ACrzQf0jg0cA1FNqNV2/djcMriXqDJqBxRXQEPZ0f9rXEQNwN6Wzf7Q0
 WyJYIUELgSIztKbw+W0NUcgN9Q==
X-Google-Smtp-Source: AMsMyM48ImG4+1wZ8Ib7kLBNZkQzNRMtywTwNKeQsq6baW5JUi3+2dCgzBh1fbWoli1bPXgJu/9mXg==
X-Received: by 2002:ac2:52b1:0:b0:499:f7ac:14da with SMTP id
 r17-20020ac252b1000000b00499f7ac14damr4742858lfm.597.1663495161116; 
 Sun, 18 Sep 2022 02:59:21 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 f24-20020ac25cd8000000b0049468f9e697sm4574959lfq.236.2022.09.18.02.59.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Sep 2022 02:59:20 -0700 (PDT)
Message-ID: <286f4aee-0774-2206-3a96-5ae27dcfbc9b@linaro.org>
Date: Sun, 18 Sep 2022 10:59:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH RESEND v3 1/9] dt-bindings: mediatek: modify item
 formatting for gamma
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20220912013006.27541-1-jason-jh.lin@mediatek.com>
 <20220912013006.27541-2-jason-jh.lin@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220912013006.27541-2-jason-jh.lin@mediatek.com>
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
> Since the items with only one const should be dedicated as enum,
> merge all such items into one enum item.
> 
> Fixes: 4ed545e7d100 ("dt-bindings: display: mediatek: disp: split each block to individual yaml")
> Signed-off-by: zheng-yan.chen <zheng-yan.chen@mediatek.com>
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
