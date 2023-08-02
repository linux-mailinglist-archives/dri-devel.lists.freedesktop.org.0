Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 499DB76CEED
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 15:38:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C8D110E189;
	Wed,  2 Aug 2023 13:38:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B9CE10E189
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 13:38:20 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2b9cd6a554cso88418321fa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Aug 2023 06:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690983499; x=1691588299;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pMJcLgqq+qsMssEfJ2CwIRiJpFGbiB0yAWJkA5kXxOU=;
 b=tuWtLApQI+lJ9MCuv940aXrM7xsyVP5NFmuEK4Pr05+2YTVnoffT80ISBeUFH2ITdU
 DsA8KS1ixGcx0g4iIB1/8h2J39Wd/iznNHJm4E8o5NwJVVOgjjJiw32i8/sKCti8uQrM
 UkEVRZeVXFSLuGAK5IYdH9QWjvsJ/tdSo1Hv2zoErgEhmxwBMxRQM+rktUTWWn8+4DWq
 nCQ8vUksJCgNv6MUec2HbR2TmVA0T7IEi0YKaOPaKmJZwckoFnWo1UNMPwguYklaCFiO
 CtmaCPxt2NS5qKbh0c0E7tiI4s+lzDWkBrCEfNScLGUf63yvPnx0XmRNXSOG2RYqthxm
 puDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690983499; x=1691588299;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pMJcLgqq+qsMssEfJ2CwIRiJpFGbiB0yAWJkA5kXxOU=;
 b=R0oa24gVjxvCcxdKwB413eXXPbCTiL/kkDLFQqo+OMerBbCeCRrnnepdN3EUYGTMV3
 658r0CW09HZE61KN6Ll3128ryV6VhPgUcJr+UTPBRWCAwET0GZOx+VdV0ncH/cLdWiYt
 npfX6hCrTVtQOHk9KQKQniMwdUNVqM7LTpBNRcQxucpENhk0UFc7OXMaKlWUU4wPu3Ti
 BLPDdaugDh28Y0kEBtFUh92bQwkDjCmGh7LAzjlRYF9I2omZrXs6IpGNNMptpjPZLgQv
 /7JB5mmcAnNOzKxgxbWZrezzQswqV/pb6LvdGYBbLaH9itSxbU/sBIS67noGyNev7g0A
 xnoA==
X-Gm-Message-State: ABy/qLYLijCLaXEesIFaOriwyvQQufY3luFxO90kvHcyyL/2beugC8Us
 7MZ7IAdDonDh/91i8aUndhoaAA==
X-Google-Smtp-Source: APBJJlHzyf/zEcrCxTCJVBOveSBn5qEYuzHmJSmt5lAZM8FgyvRHeoYIVOW4SGs/6XhBbP37lGkKrw==
X-Received: by 2002:a05:651c:1028:b0:2b6:a763:5d13 with SMTP id
 w8-20020a05651c102800b002b6a7635d13mr4864222ljm.27.1690983498799; 
 Wed, 02 Aug 2023 06:38:18 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 j8-20020a2eb708000000b002b9e65912cesm1842077ljo.140.2023.08.02.06.38.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Aug 2023 06:38:18 -0700 (PDT)
Message-ID: <5cf0e3fa-f66d-06c4-cfda-c48efd8c6508@linaro.org>
Date: Wed, 2 Aug 2023 16:38:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] Revert "drm/bridge: lt9611: Do not generate HFP/HBP/HSA
 and EOT packet"
Content-Language: en-GB
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Marek Vasut <marex@denx.de>
References: <20230802-revert-do-not-generate-hfp-hbp-hsa-eot-packet-v1-1-f8a20084e15a@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230802-revert-do-not-generate-hfp-hbp-hsa-eot-packet-v1-1-f8a20084e15a@linaro.org>
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
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Amit Pundir <amit.pundir@linaro.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02/08/2023 11:52, Neil Armstrong wrote:
> This reverts commit [1] to fix display regression on the Dragonboard 845c
> (SDM845) devboard.
> 
> There's a mismatch on the real action of the following flags:
> - MIPI_DSI_MODE_VIDEO_NO_HSA
> - MIPI_DSI_MODE_VIDEO_NO_HFP
> - MIPI_DSI_MODE_VIDEO_NO_HBP
> which leads to a non-working display on qcom platforms.
> 
> [1] 8ddce13ae696 ("drm/bridge: lt9611: Do not generate HFP/HBP/HSA and EOT packet")
> 
> Cc: Marek Vasut <marex@denx.de>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Fixes: 8ddce13ae69 ("drm/bridge: lt9611: Do not generate HFP/HBP/HSA and EOT packet")
> Reported-by: Amit Pundir <amit.pundir@linaro.org>
> Link: https://lore.kernel.org/r/CAMi1Hd0TD=2z_=bcDrht3H_wiLvAFcv8Z-U_r_KUOoeMc6UMjw@mail.gmail.com/
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   drivers/gpu/drm/bridge/lontium-lt9611.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
>
Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> #fix db845c

The boards broken by [1] are used in production by different parties 
since 5.10, breaking them doesn't seem more acceptable than breaking the 
new out-of-tree iMX8m hardware.

-- 
With best wishes
Dmitry

