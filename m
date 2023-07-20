Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E7775AAF2
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 11:36:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9273310E58D;
	Thu, 20 Jul 2023 09:36:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9432B10E58E
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 09:36:01 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-51f7fb9a944so780626a12.3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 02:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689845760; x=1690450560; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MbEixaOkxNJN74ak67fuMAe8qbP5jIXA+BkpUoZ/+vw=;
 b=DyBZCxUTKXm94FjQXQ7w8jrcELARpqFqL+Kg0e7f1vQIwD46ODVgs6YOY8OpfvDtAR
 KTDMJxfZqdo2XWn2fRr44udKWcP9k6VxBv7qTq9MQMSKPNr00WULucw30rJPezx7HU+r
 9oVqxAFlbNjB1i9UED2nkTueAVo5545WyqLFfUK1TvY6e+XOQoWL4hGOsYCirnhmKLxA
 GlvPrr6FtX/2aXYd5+c3sl4mDhH8MBSOnopNn+29pHLiEIPi6z9naAV74MRxqYKTa+WD
 vkGkyObwNkpGgXAnJ/Mmkmw8KxqrfFSmpXy7v6un9wZLIBGgDA/OBufg14vk9r9uEFOc
 l5cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689845760; x=1690450560;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MbEixaOkxNJN74ak67fuMAe8qbP5jIXA+BkpUoZ/+vw=;
 b=VRljIioew5dUQmod0FDp1whLebPPA6KH+A84RyLBEdPsE6vTeFM1rrHy+jwC4oDThJ
 hEzNs6iymETilIKkaETMqKiyKSv6H5NKj2eWMKbr0uISGOIgxZmG/GMeR5NaSRw6VFU9
 0I4OwyUlwSgU8EupJ2n5yVwEhe2F7O5oI/k3L7DHF4DuNKOaqfzIzDaMds67uZB5aHRf
 /o9dkqhcR3uT8210+jTor2YVnAMrYJ6sBAgHFYH6auIhes4thyQ897pM5OzlEHaCKKAK
 l5TigDbxMIOo1VPPRgDRPx4CO1iaaYloBtkcaYiLwVEkShAIzOk3UAjM8IdlaDces39C
 GP0Q==
X-Gm-Message-State: ABy/qLb6Q2KwwrvS+8mWJZcVPdHRtvvUXHAt0lv8qeWm11JX/gRYx70J
 XZHZipoLRGT/59Q41TsaMxogQg==
X-Google-Smtp-Source: APBJJlHdcqWTCi4MqbmDQdedPbHXGtLDE+1AHMjwt6QtLxsX6n9wzm9peAh8UPM3H/gm2b/+7s6XsA==
X-Received: by 2002:aa7:d7d1:0:b0:51e:ebd:9f5b with SMTP id
 e17-20020aa7d7d1000000b0051e0ebd9f5bmr4608092eds.36.1689845759752; 
 Thu, 20 Jul 2023 02:35:59 -0700 (PDT)
Received: from [10.1.3.131]
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id
 w17-20020aa7cb51000000b005217a24addbsm489507edt.20.2023.07.20.02.35.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jul 2023 02:35:59 -0700 (PDT)
Message-ID: <2e497eb2-f927-90bf-daf4-684d6aa0fbd6@baylibre.com>
Date: Thu, 20 Jul 2023 11:35:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3,2/3] drm/mediatek: dp: Add the audio packet flag to
 mtk_dp_data struct
To: Shuijing Li <shuijing.li@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 jitao.shi@mediatek.com
References: <20230720082604.18618-1-shuijing.li@mediatek.com>
 <20230720082604.18618-3-shuijing.li@mediatek.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230720082604.18618-3-shuijing.li@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

On 20/07/2023 10:26, Shuijing Li wrote:
> The audio packet arrangement function is to only arrange audio.
> packets into the Hblanking area. In order to align with the HW
> default setting of mt8195, this function needs to be turned off.

-- 
Regards,
Alexandre
