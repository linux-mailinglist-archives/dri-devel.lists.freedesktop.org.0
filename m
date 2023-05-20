Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5B770A43C
	for <lists+dri-devel@lfdr.de>; Sat, 20 May 2023 03:18:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 363DB10E629;
	Sat, 20 May 2023 01:18:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABE4110E113
 for <dri-devel@lists.freedesktop.org>; Sat, 20 May 2023 01:18:52 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2ac785015d7so42351271fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 18:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684545531; x=1687137531;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YQeGWuW8RcPla1MeSBzNJGfr9g0lsAtcWxD6c9UFs98=;
 b=hTtCjc7O5oTR1ftdHf2UZ4g2m3ZmcB+HMAAdY4R4wijTwQl//sNkm18HJt9V6HvP3+
 qWB10B5bbVifvIm+cvM6CQxb9F1YjSFWQQLd6y6O+a0XrXAvTHzilOVwDj/iu7UWNfez
 XCDWiJn4cdsJJzz/KCVSVinL+J+lzEFWHJ1DlGs3cG6IrvbwXYQPnNKo1ZeAJzxoZeSI
 +I1YRiW6A1YArltMc0MVVTNR6/zl4ztl881mS/gn6lv7FNPEZCt+YECQzxcn8rcMAz8Z
 B3lZBEv7f0Ie2OHyhwtPCOtHgJnpulRe7RxzbTzGX0qeEgpR0FUOWuUl231igBSdP80x
 6iPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684545531; x=1687137531;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YQeGWuW8RcPla1MeSBzNJGfr9g0lsAtcWxD6c9UFs98=;
 b=Ek2AnXVW6X2my1269zJJg0bnU4l7862IRiWMHTNg7qf+tnqsNPLiIssugCR7vwcivY
 BOoHp2/SGh869OZ25VlZ+Z31DQW3zGhfd7tswWLZrDAut2JN5yL7PLB78fZgkOdMTwEL
 1jEQhtxYvAZ8ihri4ZGXUPEutCJR7AIxrEjTjo9oMzPEUqTgyqEH/v7AAOt/KyQI0jHA
 CACyElszWmfiM3fbvsfkRyfrcEH7nIF8FA3SRR+FlweWGDiVosXVWUxR0mqgIL17EOLd
 dczb7kpe73eg49820QbSlbEJfUf9T8VwPQ8Za694TMrTcYxGHjX/+7JDMmpL/OFAfWIW
 eXIA==
X-Gm-Message-State: AC+VfDxhwGNWHWAoiLrFXjXIJreb9tYt2z6g3qzjz2h016tKofrX1uLj
 QTljXUhnIjxZs2HU0o5TwDnPJQ==
X-Google-Smtp-Source: ACHHUZ4nWlf1P1MoPeTL7kAFyzkQHlLj8djlYxph5xL2WpK5rj3dqdtDO2ujXNAkWiZVCdilAvLr5A==
X-Received: by 2002:a2e:92cd:0:b0:2a7:a30e:d11b with SMTP id
 k13-20020a2e92cd000000b002a7a30ed11bmr1595802ljh.7.1684545530859; 
 Fri, 19 May 2023 18:18:50 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 n18-20020a2e9052000000b00295a3a64816sm76710ljg.2.2023.05.19.18.18.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 May 2023 18:18:50 -0700 (PDT)
Message-ID: <bbdced3e-b7be-493c-e6a8-4aba3aa2d09d@linaro.org>
Date: Sat, 20 May 2023 04:18:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/3] drm/msm/dp: Drop now unused dp_hpd module
Content-Language: en-GB
To: Bjorn Andersson <quic_bjorande@quicinc.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
References: <20230515030256.300104-1-quic_bjorande@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230515030256.300104-1-quic_bjorande@quicinc.com>
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Vinod Polimera <quic_vpolimer@quicinc.com>,
 freedreno@lists.freedesktop.org, Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15/05/2023 06:02, Bjorn Andersson wrote:
> The dp_hpd module is a remnant from the downstream design and is now
> completely unused. Drop it and all references to it.
> 
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_debug.c   |  8 ++-
>   drivers/gpu/drm/msm/dp/dp_debug.h   | 12 ++---
>   drivers/gpu/drm/msm/dp/dp_display.c | 35 +------------
>   drivers/gpu/drm/msm/dp/dp_hpd.c     | 67 -------------------------
>   drivers/gpu/drm/msm/dp/dp_hpd.h     | 78 -----------------------------
>   drivers/gpu/drm/msm/dp/dp_panel.h   |  1 -
>   6 files changed, 11 insertions(+), 190 deletions(-)
>   delete mode 100644 drivers/gpu/drm/msm/dp/dp_hpd.c
>   delete mode 100644 drivers/gpu/drm/msm/dp/dp_hpd.h

I think this is not complete. Could you please check if 
https://patchwork.freedesktop.org/patch/433883/?series=90198&rev=1 works 
for you?

-- 
With best wishes
Dmitry

