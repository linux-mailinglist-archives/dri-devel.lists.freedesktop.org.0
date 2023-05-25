Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A02577106CD
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 10:00:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9920510E120;
	Thu, 25 May 2023 08:00:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24D0510E120
 for <dri-devel@lists.freedesktop.org>; Thu, 25 May 2023 08:00:01 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f6dfc4dffaso238135e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 25 May 2023 01:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685001600; x=1687593600;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=Rx6/AkchhhsIk24IhJ++7ZLwXy7ijhSBwh/BY8UUZQc=;
 b=c9mNv6qaak/+jqDMGn3APvrr0+w5ES0c1AXI6yC9/c9lAG4EPwi49Txcj5wWxuApZr
 ksHgUxODxOTedlSiCT7b4eHmnSiLO/9tL8AME3h15Z6ar5myK9hI4dYRDxnvjHK50aCF
 Rsjpw/xs7XIBDEhTu00iegVvL2gf8NDKn2Anjnm7tsPydrfChLCRa6VhBAfl6FBECjG5
 a0dbx99g1URkUvbhsvZ5y4DDF1VHEY3x0OL4fYijdjkNPzJxU4K14wdQ8CeVjaout3Gw
 jsjhN8/zjx99gvNTg+vyp9I5cuLrvAJ6u7il4vyi+KSKMg9rRuddb3Ff/AeX991jC8h0
 KRbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685001600; x=1687593600;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Rx6/AkchhhsIk24IhJ++7ZLwXy7ijhSBwh/BY8UUZQc=;
 b=eLF9S6GIQG98WAN76dIev/vjhuUmBLFBYVWWIE/46ttZ2aBilbARfk7LUsMBRq9HDN
 6v9Di3iBW0SXuC0vIjYPgEwXPy2lU8mRq6MWy6BkgpO5p0stAGgTqqPgSqTHqRLVKX92
 U+lLw01ywkmcrvD8KRWseyb/+lebXXkoL1CeGJIP9QSFpMk4kus1bNlcdbHrsOmRQ0Eb
 TjpF1O6IxiOc9OWos//zic3dFNwgqd+ULu5AekTT/d0y7DVfZ/47LXljH+1dNbi4oAc7
 PFyLhaUE1zA90E0HrFKZmJbuSC4UV5jEu2CYwX+V6LNpv031M83063HIBPeArVuZqx6j
 +m2w==
X-Gm-Message-State: AC+VfDyTP3NPaMwYHTb6qkYw+dMIun2uDJYZIEz9omyIs1adVdaDbukW
 d/3q+8T2lFjaxygI2J/M7mZAXw==
X-Google-Smtp-Source: ACHHUZ4TryZ8bkmN1UsFCBXfEMWzWC55lUiNfaVtlNpCYURcJisdCMit0DGkffnluVcPdw3cG+osKg==
X-Received: by 2002:a1c:7913:0:b0:3f6:770:fafd with SMTP id
 l19-20020a1c7913000000b003f60770fafdmr2037330wme.7.1685001599877; 
 Thu, 25 May 2023 00:59:59 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:5cdb:105b:7481:b0e6?
 ([2a01:e0a:982:cbb0:5cdb:105b:7481:b0e6])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a05600c225200b003f60a446fe5sm1178490wmm.29.2023.05.25.00.59.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 May 2023 00:59:59 -0700 (PDT)
Message-ID: <1adda828-cf35-fb2c-6db5-f9ca91b5b62a@linaro.org>
Date: Thu, 25 May 2023 09:59:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
From: neil.armstrong@linaro.org
Subject: Re: [v3 0/4] Support Starry-himax83102-j02 and Starry-ili9882t TDDI
 MIPI-DSI panel
Content-Language: en-US
To: Cong Yang <yangcong5@huaqin.corp-partner.google.com>, dianders@chromium.org
References: <CAD=FV=XUuzjjLq3YP3683jOd06odwk5Dox5MS8oY8goB-_8T5w@mail.gmail.com>
 <20230525025000.3692510-1-yangcong5@huaqin.corp-partner.google.com>
Organization: Linaro Developer Services
In-Reply-To: <20230525025000.3692510-1-yangcong5@huaqin.corp-partner.google.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, sam@ravnborg.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, hsinyi@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 25/05/2023 04:49, Cong Yang wrote:
> Compare V2: order of the tables match the order they're
> referenced.
> 
> Cong Yang (4):
>    dt-bindings: display: panel: Add compatible for Starry himax83102-j02
>    drm/panel: Support for Starry-himax83102-j02 TDDI MIPI-DSI panel
>    dt-bindings: display: panel: Add compatible for Starry ili9882t
>    drm/panel: Support for Starry-ili9882t TDDI MIPI-DSI panel
> 
>   .../display/panel/boe,tv101wum-nl6.yaml       |   4 +
>   .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 471 ++++++++++++++++++
>   2 files changed, 475 insertions(+)
>

Please resend without Conor's acks on patches 2 and 4.

Thanks,
Neil


