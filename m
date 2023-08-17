Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4DD077F40A
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 12:06:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DE7D10E424;
	Thu, 17 Aug 2023 10:05:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2DF310E424
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 10:05:56 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4fe457ec6e7so12123072e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 03:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692266755; x=1692871555;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tU1OBnu/6KxECDpM0IzJ/SgAaQcKe+fJT4+4ZHxLk2k=;
 b=o7F1Q+VWc8vFZ8O6jibK3igZE8P/juYrKZZGxZfHPCtZBv/VveZyfn2blr+KinpS0o
 BYsM5RQa9Vekp/1Of4n3WHI72P6R+VBCXIzL5Yi3nCjm2jApUfXOmZlRYSd+ZatQl74B
 zwx2QQ/0hyQmoRvj+dizVxULpy3Jv0KL2KKN2sLlRLZAsUPN5rZSEKR/fa45rOL3eITm
 DdbedVuyXLZRQRRpKs0GVKJnwxH6dwrvNmYoBZxTDgmUCbGryeK2AEgtL2GXtv2VOHlt
 NUudH9bgGBCVBbASmSZtGH/P42s5t2qkTN2BZPq3kWaEIv2CV3PIq6FkbGqknTCjIc6G
 +xyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692266755; x=1692871555;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tU1OBnu/6KxECDpM0IzJ/SgAaQcKe+fJT4+4ZHxLk2k=;
 b=M+mEdRSC0AuCgr46r2Vxa8hh4E2lCn5iOLurLB5NJShA75DoB5eiwCPI2OQ8C8i8az
 vKG33UhjCt5mVK7ZohGDXIObiTavONKc72fbc+ha3u6nHNOuaOr+HKWZdk86KCzXeMq4
 rm8XVGvJMudAj7rnMLzvddRv2jkDH3KyrdBzat2ggn4lsfM6ofOsAP8tNe8Gtfs56BWs
 SQcXmgpk3qT9oJNN78y/ja4Oo2my3Yki5KNMcaN7GNrB7Htr9nTYB9JcMrqbbcZX+kZI
 WwmIm0Fopiq6rychBu/ZSqJC2FYE6mHWQWZzZLu3mtLTtvDVx3Ezz7xaG8Ui/49RSXOR
 GBuQ==
X-Gm-Message-State: AOJu0Yw6dH/YEydCLFuMmLAVJYjBFHrhBRuX/N6viuZgXpvwTWdT/cQp
 hLWJCJFw5E1YndkWP7r+gjogRw==
X-Google-Smtp-Source: AGHT+IFCG5Al/QsWgxP4N4ZeswwQ4NoxpW9761uM5QnL5lXermAgUtYjDUWYz2a42K4cgDwfPj70ow==
X-Received: by 2002:a19:915b:0:b0:4f8:8be4:8a82 with SMTP id
 y27-20020a19915b000000b004f88be48a82mr3310881lfj.22.1692266754892; 
 Thu, 17 Aug 2023 03:05:54 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 h24-20020a197018000000b004ff9ab6463fsm276653lfc.87.2023.08.17.03.05.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Aug 2023 03:05:54 -0700 (PDT)
Message-ID: <c485b64e-3c83-4616-b8d8-76c2c7d56b0e@linaro.org>
Date: Thu, 17 Aug 2023 13:05:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/7] phy: Add HDMI configuration options
To: Sandor Yu <Sandor.yu@nxp.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
 vkoul@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
References: <20230808083243.3113192-1-Sandor.yu@nxp.com>
 <20230808083243.3113192-3-Sandor.yu@nxp.com>
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230808083243.3113192-3-Sandor.yu@nxp.com>
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
Cc: oliver.brown@nxp.com, alexander.stein@ew.tq-group.com, sam@ravnborg.org,
 linux-imx@nxp.com, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/08/2023 11:32, Sandor Yu wrote:
> Allow HDMI PHYs to be configured through the generic
> functions through a custom structure added to the generic union.
> 
> The parameters added here are based on HDMI PHY
> implementation practices.  The current set of parameters
> should cover the potential users.
> 
> Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> ---
>   include/linux/phy/phy-hdmi.h | 24 ++++++++++++++++++++++++
>   include/linux/phy/phy.h      |  7 ++++++-
>   2 files changed, 30 insertions(+), 1 deletion(-)
>   create mode 100644 include/linux/phy/phy-hdmi.h

I think this looks good now, thank you!

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

