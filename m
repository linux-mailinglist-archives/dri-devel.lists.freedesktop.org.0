Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CE36669C9
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 04:47:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90CAA10E85F;
	Thu, 12 Jan 2023 03:47:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9100F10E180
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 03:47:49 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id bt23so26537498lfb.5
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 19:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7Fsl+XczVC3y4xjwVEHLq7wRpg+RhgoiNYUxqTCYb0k=;
 b=jTrIlEPHQzVODaR9L4thDNELRop3PCxB2opiacEeP7ERfvm2au9eho36bUUGf6jgsb
 ro3f6jyZ3hlXueqYVv9RA1cVV4DAEHllfBJbbHV8CnaMwnogc5DuSNs8H8UcU5dftBVX
 gv77KCmxHHJ9XQDX9XdqSGYeR+EW1RPQdLlWf0y+LlZaH1frHTFyeVvxKZfZMh/4cYBG
 9wsYiHCAjzFghSnDmgaEGTzBKW4B0Ki+7Umq8R4pjmqt6EY5h/Ddqh2xs9YojNowi27z
 hFf23qGeyHaiEhFfZ9xVrExVWRIgqj6Yj66++j9HVT52/IcNYbPdUhDlR2zDGHt5C9cY
 DEhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7Fsl+XczVC3y4xjwVEHLq7wRpg+RhgoiNYUxqTCYb0k=;
 b=GrGKe2se0ItdV/Vzwv5z7Gl7/kM9f/E06MYjMF423/YeZSPD1P41qO5xukmDY/cqCY
 eSUIGamkd2k29JBVk6cmAx96Rc6eLbdxPvnS2t5ypQ20WwLWTqSqIfeKBsHUT15x+dFb
 Ce2hAsE6my5o0fdewuC0XK2Cj4ee12Zjbxcz9ho2axNbnOdqtSR6d+Vd/c4dns8Oc28G
 763tuPC0Ii+mmrsoZTRDpo2RUIX2hJVyG/FmB80viWk0qH0ruJi7oAmAmqJbHGfPxaMB
 EQxns3H+MThpxPgn9ifODuup0bfs7xrhXXrdMo+Hg3MG7LF1aySm0iHxfGeozYCFz1SL
 pkZQ==
X-Gm-Message-State: AFqh2kpO6kquEkpF4FqQSiQUaPBERi4a/Zk2HyKwLJ0G5OZnfEQdk+01
 12rYwu9wFWcEZ2OVEiE+yjGzwQ==
X-Google-Smtp-Source: AMrXdXuQG4UzES00pUNruIlJSGp0UifU8fTI13RVg7hyEjFVE0tWTAya3H82zSigyuo2lGZ6wlMEfA==
X-Received: by 2002:ac2:5454:0:b0:4cc:8985:b565 with SMTP id
 d20-20020ac25454000000b004cc8985b565mr2840726lfn.30.1673495267980; 
 Wed, 11 Jan 2023 19:47:47 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 t17-20020a056512209100b004a4754c5db5sm3041591lfr.244.2023.01.11.19.47.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 19:47:47 -0800 (PST)
Message-ID: <a15da787-cdf4-464b-1d90-a413ac8c59ce@linaro.org>
Date: Thu, 12 Jan 2023 05:47:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 1/2] drm/msm/dsi: add a helper method to compute the
 dsi byte clk
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, freedreno@lists.freedesktop.org
References: <20230112001600.12791-1-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230112001600.12791-1-quic_abhinavk@quicinc.com>
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
Cc: dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 quic_jesszhan@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/01/2023 02:15, Abhinav Kumar wrote:
> Re-arrange the dsi_calc_pclk method to two helpers, one to
> compute the DSI byte clk and the other to compute the pclk.
> 
> This makes the separation of the two clean and also allows
> clients to compute and use the dsi byte clk separately.
> 
> changes in v2:
> 	- move the assignments to definition lines
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dsi/dsi.h      |  2 ++
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 21 ++++++++++++++-------
>   2 files changed, 16 insertions(+), 7 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

