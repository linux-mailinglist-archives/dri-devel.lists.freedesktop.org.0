Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 143C476CCF5
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 14:38:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5123210E0C7;
	Wed,  2 Aug 2023 12:38:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBA2C10E0C7
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 12:38:45 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2b9d3dacb33so78565041fa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Aug 2023 05:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690979924; x=1691584724;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Mu7ImHe9BF/wKqscLqA+TxdeQBiXlIVRVBMiuB/kjjo=;
 b=kKxmV3etpREz4jcInH9s4vPpD4RGAkuUPthMnVqDiu1ybF60kn4ffnk/3z7EmSkvnP
 PoU3F4F//hEFcSxYny4+R1KrHLMUhKZ7+0hlJ/EIvuKoaAesEckQAtmuys9lAr40hwqr
 B8c0MVIKvObOfmqr5daxRjfxc5k7vaGJrHLKRzzKcrLOVTzGbCSJwXQ0DVgGl+1jvrBC
 RR53Ji58al9vLfd+J4B+WvCqjkh0mKKIiwx3IsUe+tViwiEelPdF+P54tXjbEl5MMSHK
 ZfNWVgsyoawt81+ykeJExwHfkxULhLbDfgBSXN8uIh4XGlws4X9sb4MRQ/jR6wxvv6kX
 vg2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690979924; x=1691584724;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Mu7ImHe9BF/wKqscLqA+TxdeQBiXlIVRVBMiuB/kjjo=;
 b=bLdZmpTTG97R0s5LKPpOVNlQTkp8LwEjEHzz8WMhQ5VjhNV7IA4ensTjCBb6i0fuAN
 D7LeWaWQAK7/dUdouHG295p2WdWVCrXXAsgonRFNcSFNyJyANdHfOYC1D27uJ8PEwAgw
 VQyH6J39t2Ln2PPIu+RwDI8aPqqnLmI5AscXv+9LrnjJbvlFa9xBUr3b8hYQp1uwIuwn
 QSABDWWgKAD7dCLu1EzxsuevyLpXtic09MlZTcyRyRPkTEy+qtkUn6pBT4yA/Mjs3SI6
 T+xdWVeli/bqsr5unxerpeMeTWgmIyzTA7fgKYMwQAoM3FxoCb2Bcr3iaoprkKmU1HAm
 LU2Q==
X-Gm-Message-State: ABy/qLab4jxRB/L0IPMPfnr1y3s02gjCKbDVQDTAty5b8O8wOxDA6F8/
 i85kS3dCgGigI9tUMzYCyeZnlg==
X-Google-Smtp-Source: APBJJlFXGf9zDlg/as28BI/NRgQLAjUlMBqGpkLB4hqdUr16qDL5WbwNwlGM5Qw7G2tfEqbSxJ4tpw==
X-Received: by 2002:a2e:97c6:0:b0:2b7:2ea:33c3 with SMTP id
 m6-20020a2e97c6000000b002b702ea33c3mr5099880ljj.22.1690979924053; 
 Wed, 02 Aug 2023 05:38:44 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 a4-20020a2e8304000000b002b6ad323248sm3570622ljh.10.2023.08.02.05.38.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Aug 2023 05:38:43 -0700 (PDT)
Message-ID: <ce99a777-10cc-f380-65c8-ef76843ca181@linaro.org>
Date: Wed, 2 Aug 2023 15:38:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] Revert "drm/bridge: lt9611: Do not generate HFP/HBP/HSA
 and EOT packet"
Content-Language: en-GB
To: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230802-revert-do-not-generate-hfp-hbp-hsa-eot-packet-v1-1-f8a20084e15a@linaro.org>
 <6cd079a4-2f5b-0169-cbaf-b59a72f1b32b@denx.de>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <6cd079a4-2f5b-0169-cbaf-b59a72f1b32b@denx.de>
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

On 02/08/2023 15:07, Marek Vasut wrote:
> On 8/2/23 10:52, Neil Armstrong wrote:
>> This reverts commit [1] to fix display regression on the Dragonboard 845c
>> (SDM845) devboard.
>>
>> There's a mismatch on the real action of the following flags:
>> - MIPI_DSI_MODE_VIDEO_NO_HSA
>> - MIPI_DSI_MODE_VIDEO_NO_HFP
>> - MIPI_DSI_MODE_VIDEO_NO_HBP
>> which leads to a non-working display on qcom platforms.
>>
>> [1] 8ddce13ae696 ("drm/bridge: lt9611: Do not generate HFP/HBP/HSA and 
>> EOT packet")
>>
>> Cc: Marek Vasut <marex@denx.de>
>> Cc: Robert Foss <rfoss@kernel.org>
>> Cc: Jagan Teki <jagan@amarulasolutions.com>
>> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Fixes: 8ddce13ae69 ("drm/bridge: lt9611: Do not generate HFP/HBP/HSA 
>> and EOT packet")
>> Reported-by: Amit Pundir <amit.pundir@linaro.org>
>> Link: 
>> https://lore.kernel.org/r/CAMi1Hd0TD=2z_=bcDrht3H_wiLvAFcv8Z-U_r_KUOoeMc6UMjw@mail.gmail.com/
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> 
> This breaks LT9611 operation on i.MX8M Mini/Nano/Plus, so, NAK.
> 
> I am currently using this LT9611 with Linux 6.1.y in production and this 
> is not acceptable. I also believe the correct fix is on the MSM side, 
> not on the LT9611 driver side, since MSM incorrectly implements these 
> flags.

Up to now we saw no proof that MSM incorrectly implements the flags.

-- 
With best wishes
Dmitry

