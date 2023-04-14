Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2EB6E1E28
	for <lists+dri-devel@lfdr.de>; Fri, 14 Apr 2023 10:26:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA7AB10EC70;
	Fri, 14 Apr 2023 08:26:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D624110E9C3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 08:26:13 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-94a342ef3beso331041666b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 01:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681460772; x=1684052772;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rSkWZezR+vqkZFp6+fgJXWtGYjSC31F616DHHfTgnbs=;
 b=YbpxrlJEO6rJpM13esqj9YpbRhqodoJNkqeHSgCOD332x7y5N0fPCSTQ0yLvD5wenb
 GLt4Evexto+bOd2Ah/+XykMEkoTlLoAK57hXgV5mfc208HHMz0JqN1BPL5PY2tmX2bJs
 NrClGKQDdWbWmrnPcjqYlaR/hKf4dL8WNWpmgEKJz5QWxxXfqqZ76H4mPHpuCOI+HPSq
 tjSHUqhvDGAyXz32AyTnQSvB7vdVlgdhtPKaXZr7OSy6T6D3xA2fvA273ZjJLlR2Ibtq
 DWxjJ5V92lT5z8R6ntSM5EtYmt7uCmET3AwGlt1JTBBoC3f6/8OIXQpZvHRhbeg2xyvs
 NG8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681460772; x=1684052772;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rSkWZezR+vqkZFp6+fgJXWtGYjSC31F616DHHfTgnbs=;
 b=bcKqm74HU+A0vnmA6gpShDbKNtFLNZZw3T0j/WEkA83+9f/5HrWKDA+0UFIk24DqNh
 I7zRTWUs2wFg9X/BSwnAQHAvgxgV/NRc3ASYUotDiRnCalM/bOLMVWzdnn/LkZr/ZfBw
 NGRMrzygMHU72fYLxkxrB2HMciULC4fkIdwW/g+68mX7hVhFG8Njm+icb7qeGKe+z2M9
 DmBSgR0RGjBC96MpjQDzY1RdGWyBBzD94ylL6OwTQVwTLxURU+VJ/t9KsuCvXTbGDzF2
 6WJKBzYhxfVvUX/4bAt8oCspJ3k6VZ/eYg2JpARGFXxO1sFGz4e5VKjpZRbZgh1y9EdC
 /Y4w==
X-Gm-Message-State: AAQBX9fRmAGo3Z6yjsocF9Q+wTSOvYu9FWHvgoV/8vSkMZAtme6dYEcN
 W4SyLSRS0ApTNJXJ/vDG2uO7Ew==
X-Google-Smtp-Source: AKy350Zl5EsPrYWjWc2BV+2p02ac4Z5+rHGkCzS5hfLqWTDjM0k1AIqkHnhpqhIPnH9CGZC2xb8oiA==
X-Received: by 2002:aa7:c957:0:b0:504:b228:878d with SMTP id
 h23-20020aa7c957000000b00504b228878dmr4943365edt.25.1681460772047; 
 Fri, 14 Apr 2023 01:26:12 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:8a60:6b0f:105a:eefb?
 ([2a02:810d:15c0:828:8a60:6b0f:105a:eefb])
 by smtp.gmail.com with ESMTPSA id
 w17-20020aa7cb51000000b004aeeb476c5bsm1804975edt.24.2023.04.14.01.26.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Apr 2023 01:26:11 -0700 (PDT)
Message-ID: <3d3b1717-00eb-c27c-ee34-0255ee71d0da@linaro.org>
Date: Fri, 14 Apr 2023 10:26:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 07/27] dt-bindings: display: mediatek: rdma: Add
 compatible for MediaTek MT6795
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 matthias.bgg@gmail.com
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-8-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230412112739.160376-8-angelogioacchino.delregno@collabora.com>
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
> Add a compatible string for MediaTek Helio X10 MT6795's RDMA block: this
> is the same as MT8173.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,rdma.yaml   | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

