Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A26FA674F47
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 09:19:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0FA810EA60;
	Fri, 20 Jan 2023 08:19:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5009F10EA60
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 08:19:41 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 bg13-20020a05600c3c8d00b003d9712b29d2so5287815wmb.2
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 00:19:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DejPImVCu9b73ZFjXinX4PYBTQWTGZ6YeR5qwnqlpkA=;
 b=XNCCufWi9BAYtfFA8Pjg2oK8lDw5HB6O0FRIfDmYltO6z1FR9MtCFE6t11SEfHAGl7
 ghqwu6g0qeBrL419RftxQe51DQDXjuNqDvXS5kQj1dnWOZLpq9RqOCDkfqYCOOKMdZoc
 mbdox9RD80yt9TyDtCs1fR/WiPZ7VLRDcOu3Sgv/OaokS9eIMLM3qHgx0O4xotl8t7dS
 k/WPuaKTvoV8EBr0R8BNRFdEdRs3oEAqhdU+GuAqGnLXSVAAzobs0m52xj3/4tM4jNbH
 EPA+FkWfvWp1DfdOF+wDp4+BhQzKr83rXdmfAcB8j1jPY8OEpHXvzvSLodeJXJEY3nZy
 paUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DejPImVCu9b73ZFjXinX4PYBTQWTGZ6YeR5qwnqlpkA=;
 b=Qdi9VQ4ttyxemCyN904Rizv/ZhDdi7V8hOAet1y5vc/INOxU8TRQQ/+ZkNXfYFmM81
 nMLZT5RCxYVOvJNGYKUrPvhd5My4FGrZhKvAUoKlPL7XOohittJBbkYjcVgyCY45bmYG
 bqlk930grqRLqHWNWtt2dMqNI06mIARrOoD4exsxuWXZfghNLDva4Bwth4kUHBH+DRDe
 gGkfkJJFdIODta87nMGLiY1Yui+1YwtfWoerILsSI6wLDhZKyUeyC358TRKpcW70AfDX
 wfh0j6BSI3/BAMeZhGUTF8dFXSNP3J44mpCyYDvhe9qqZLnEIiuMkL553OxbinR41Kpf
 2Irg==
X-Gm-Message-State: AFqh2krN/R3n7ZmBkHx3gSSOcIKOVEe3oQVXyCvEML58QgLBUkV6gsNw
 WpTLcn9egjKfk8MlvSG4qxd+EQ==
X-Google-Smtp-Source: AMrXdXu/pKC2rNh+xmqUB2tFhOUrv4J1pVmi08/ed1IaMUKcL9X57+Kp0ItOfHb2ZKCtPTfu5RfoEQ==
X-Received: by 2002:a05:600c:3296:b0:3cf:82b9:2fe6 with SMTP id
 t22-20020a05600c329600b003cf82b92fe6mr13905566wmp.8.1674202779766; 
 Fri, 20 Jan 2023 00:19:39 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 w12-20020a05600c474c00b003db2b81660esm1547808wmo.21.2023.01.20.00.19.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Jan 2023 00:19:39 -0800 (PST)
Message-ID: <73834163-b06e-1f1a-47bc-d93607ab80b4@linaro.org>
Date: Fri, 20 Jan 2023 09:19:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 1/2] dt-bindings: panel: Add compatible for Anbernic
 RG353V-V2 panel
Content-Language: en-US
To: Chris Morgan <macroalpha82@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230119230415.1283379-1-macroalpha82@gmail.com>
 <20230119230415.1283379-2-macroalpha82@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230119230415.1283379-2-macroalpha82@gmail.com>
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
Cc: megous@megous.com, devicetree@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, agx@sigxcpu.org,
 Chris Morgan <macromorgan@hotmail.com>, robh+dt@kernel.org,
 thierry.reding@gmail.com, sam@ravnborg.org, kernel@puri.sm
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20/01/2023 00:04, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> The Anbernic RG353V-V2 panel is a 5 inch 640x480 MIPI-DSI LCD panel.
> It's based on the ST7703 LCD controller just like rocktech,jh057n00900.
> It's used in a 2nd revision of the Anbernic RG353V handheld gaming
> device. Like the first revision of the RG353V the control chip is known
> but the panel itself is unknown, so name it for the device.
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

