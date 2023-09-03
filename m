Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E2B790F15
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 00:40:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBED610E259;
	Sun,  3 Sep 2023 22:40:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A884D10E259
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Sep 2023 22:39:59 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-5008faf4456so1323956e87.3
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Sep 2023 15:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693780798; x=1694385598; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3njyN7L52ply28cLSWvghKHcDvpsiniGrJ+Mxrq7efI=;
 b=u9W3iM43czpNa5uPGgTXgWzMNPT17YVA1iby7yTdAFK4xLnXEuo9lO6qoXAm/pYBH3
 JrIUw/d6zYqQ/CJzeTb0eiE8nDafFNhqezeKSaIDfSnq1vH0BoEYttPOJamJNND/PFLI
 NzHUo5PkC0wCOW1FysuzXv0fa65V11AF/T++FlOyCJqs9OJLYFblqxNlY/cwE4Ow7lZM
 6FLSv9kAzC7GD01Ws9UHNXiaaPtgajeyQhV6TkKErdLHZexIxjg5zrVzWo7ecg1GtxgS
 PJV/xmSyMg34lIB5DMmwg/VCBnfL2rPUWCTt2QAN+T9IilLZFkS2QgVhpCU/tpD1X1WD
 OF2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693780798; x=1694385598;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3njyN7L52ply28cLSWvghKHcDvpsiniGrJ+Mxrq7efI=;
 b=UjBBGTt0JfyLZifN08MzOiv1+LzE86vLy4BiLtHuhaHJHDRhfV4b3mdLiK1fi0nSxL
 rttZEMG2yzBkjKqH1CAO2/uYln1Hwao/7ajoy8Zvmq5xfnAQH/pT2RgfLXW9NnSGH8Z7
 8hY5zDJe//VJMKzMk9yKMzMZ/UB2XUai4KxaB9PjzhJ0hf1Gl72H4Biqvj4A/h53tMbI
 BEzCnboOjdnP8IrBW/D8acvK5JuUIcufhMUFcnCPhTJJnSLEPCS0SQOxdy6K5/BFdJxL
 rYtRECyPmCM1OFRhFaq+LEHrAUV+DrRCBaVVPx7uVsT6a0yTFpTjSIhcK/7lPSPYbeKO
 fhug==
X-Gm-Message-State: AOJu0Yxyh7joKKsjDDuGCrMEeYQOVi40frQQVMcZknWkehoYzAbvyV71
 niyRcsX2FBRwNS3v7/oFkKwGxQ==
X-Google-Smtp-Source: AGHT+IHqA5bKFtbDh+6zSj7AEktpbIX5QdrDfqbVTVJTxtGdex58MNMVKlZ2+5ZRABDSdhyKeGSD5A==
X-Received: by 2002:a05:6512:3701:b0:500:7e64:cff1 with SMTP id
 z1-20020a056512370100b005007e64cff1mr4786349lfr.14.1693780797803; 
 Sun, 03 Sep 2023 15:39:57 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 bo9-20020a0564020b2900b0052889d090bfsm4972604edb.79.2023.09.03.15.39.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Sep 2023 15:39:57 -0700 (PDT)
Message-ID: <79297172-7be5-4eb1-9288-83334f8302b6@linaro.org>
Date: Mon, 4 Sep 2023 01:39:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] drm/msm/dp: Inline dp_link_parse_sink_count()
Content-Language: en-GB
To: Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230829184735.2841739-1-swboyd@chromium.org>
 <20230829184735.2841739-7-swboyd@chromium.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230829184735.2841739-7-swboyd@chromium.org>
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
Cc: Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Vinod Polimera <quic_vpolimer@quicinc.com>,
 patches@lists.linux.dev, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29/08/2023 21:47, Stephen Boyd wrote:
> The function dp_link_parse_sink_count() is really just
> drm_dp_read_sink_count(). It debug prints out the bit for content
> protection (DP_SINK_CP_READY), but that is not useful beyond debug
> because 'link->dp_link.sink_count' is overwritten to only contain the
> sink_count in this same function. Just use drm_dp_read_sink_count() in
> the one place this function is called to simplify.
> 
> Cc: Vinod Polimera <quic_vpolimer@quicinc.com>
> Cc: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>   drivers/gpu/drm/msm/dp/dp_link.c | 38 +++-----------------------------
>   1 file changed, 3 insertions(+), 35 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

