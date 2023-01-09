Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A4E663050
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 20:27:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C81110E46C;
	Mon,  9 Jan 2023 19:27:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2B2510E46C
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 19:27:19 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id bn26so9320304wrb.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jan 2023 11:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=AatgqnKq1CxFV2DrkoIsHDbH5JbnnXUvQ3qRmHwP/LU=;
 b=dEc6RlClcIs6wxNbRR3NVwyC94tdcHcu82YVCTo9dv0trlIfh/WEhb1krw/nw2/j9c
 2kHySNIRXWXb8Xgd0FyDm8s6Fl3wk5TA1OY+B3zTeZmkRL0FufQUP81/VVZ4iRzJbDhO
 uRZ74GPWm9R1DaPcA1L7MRGR4o/NkotKEE+KrrfWP2lB4SLaDr/1pf7si/UFGIc0uhPd
 +jk+rfp0N4N+DZJX1laAL3WlI1au2sH017wil9IODKL5TsSV26u5zLCFtGJr8YIcZqYb
 +38fW0lmLUDFCws0L0qBGeY87k2iYe/nyNrOgJihAnKZJK3I+kHVXLK0wiM1sBLOY28B
 uZiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AatgqnKq1CxFV2DrkoIsHDbH5JbnnXUvQ3qRmHwP/LU=;
 b=VywidJVe53yn2NiVotrHgquYcBXlDhZbTFeUYhprKAlIXTpdMaK9kBJ5/yP5Avww0H
 ziqWcKEWKHSo60EVlpEqAd2SFWXkBVpB59L8ThA0ZgSFbvzBIo8yHN9YdwSCxMBGyixv
 KJHjxdazcX51vCXtoAQGPJCPEPL+KdO3iXM40sr+mW6lwiBPSdkZKUqnRLJjf8Bng3rw
 M96hvbff1i3ZsnL2Nmns3pVHYEvtYj7xr20WHkaMKJ+5Wl5nJqISkVx1DZVz4nLrKRFQ
 96MVJnsPwqchUM0aFYF3wz3pipEX+zDpO90SbGvE7mM5rQ50NDkqWRRJ93iMfxOvXd1M
 j/Lw==
X-Gm-Message-State: AFqh2kpyGlk832RtaHhTVv2wm0dTgf6oD2pEen2wvEJ7N++t2+OWQNgG
 ReXrI/abJOeCO4B0cqQY8qohEA==
X-Google-Smtp-Source: AMrXdXtKuWYWcHD9ct5AJC0r/ItSFbWSkVrTGs9jFFFYd1KOZItI2ChrrMAwigq/S5gyc1pMuUbDoA==
X-Received: by 2002:a05:6000:18c9:b0:242:88af:d88b with SMTP id
 w9-20020a05600018c900b0024288afd88bmr42003097wrq.43.1673292438489; 
 Mon, 09 Jan 2023 11:27:18 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:d3bb:5fe9:fe57:33a2?
 ([2a01:e0a:982:cbb0:d3bb:5fe9:fe57:33a2])
 by smtp.gmail.com with ESMTPSA id
 z8-20020a5d6548000000b0028df2d57204sm10880416wrv.81.2023.01.09.11.27.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 11:27:18 -0800 (PST)
Message-ID: <e707be74-29d7-6649-9595-144314829503@linaro.org>
Date: Mon, 9 Jan 2023 20:27:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: panel: document the Visionox
 VTDR6130 AMOLED DSI Panel bindings
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230103-topic-sm8550-upstream-vtdr6130-panel-v2-0-dd6200f47a76@linaro.org>
 <20230103-topic-sm8550-upstream-vtdr6130-panel-v2-1-dd6200f47a76@linaro.org>
 <4b7458ce-18cf-8222-b5c7-349e07dc6b87@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <4b7458ce-18cf-8222-b5c7-349e07dc6b87@linaro.org>
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
Reply-To: neil.armstrong@linaro.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/01/2023 13:15, Krzysztof Kozlowski wrote:
> On 09/01/2023 09:49, Neil Armstrong wrote:
>> Document the 1080x2400 Visionox VTDR6130 AMOLED DSI Panel bindings.
>>
> 
> If there is going to be resend:
> 
> Subject: drop last, redundant "bindings".

I'll fix it while applying, thanks

> 
> Best regards,
> Krzysztof
> 

