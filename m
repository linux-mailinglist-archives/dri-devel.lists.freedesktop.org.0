Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C615A23BE
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 11:09:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1AA810E7A5;
	Fri, 26 Aug 2022 09:09:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A4D110E797
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 09:09:15 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id q18so961716ljg.12
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 02:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=SNV8O/j0YC1LnQIURnHLXp1X7n9kt6rf3nYGRIpE0BY=;
 b=ZBKdDfcD4nil3pqJq6LwBIiTZorLaHyPtanKz04jAXuXlP5owAtD/wo5GbtNEqV0RW
 cvNKckWCWQq10qWYnZOg5HXYhfvT6q2Pi8tHSUqOsx64rZ9tBS1YecovDS/OIFaGBzui
 iN/zPL9qWD1Tz74K3MVHhpyF394lq/+x8/cp7Sl7eM67Ryrh3Cmqy+fWQVcBYgYuSIFM
 lim55CXl6sk7roaDfA0QrzNjhSL7/7ziaBdHldts/nj4QRfrSfQXuY7RN+qm7itN+Fsf
 ERe8kpVoayqjoR1R6rcBeVIkEsoZLbdyD3PrBvve9a3wtxZh/TopNdXrbeRJxDU4UAIe
 luQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=SNV8O/j0YC1LnQIURnHLXp1X7n9kt6rf3nYGRIpE0BY=;
 b=wWHPPBGd59YBHU2bKbnM7qLySbW7v2wSqCo9ZyABWJSPQz4ufCuY8HRqtm72s+H0cd
 bxvTkUt7CSteeLGJx5u+lWESkvnv4YQa3GVLnNzyygRAwolNKjKmdoIBW6h3j5A+12ER
 JkXQFp4rJ+MeD84rGxK8rs9wZcu1FF/3GFJE3op63wyaTTGRFNntamktwpBQ2ajrsQB7
 k56I6udKu1sQd0clVYpOHApFe59tU3TqvfStlNMO1LMQel/PF4cZGWiR0txfD9n65jFZ
 6CWf5SkwsNLIlX+796QvcSZCDHRvaG19o4a3ZVbIc3nEYQTAFzkJJsoZZOs0xgIOC1mu
 n5RQ==
X-Gm-Message-State: ACgBeo3R2DskccTreOfUKXnIdw2fd2UvWHVIOoM365quiBrgbgDV5+XL
 oL9M6OlatB4hR5FlZ72vqVB3FA==
X-Google-Smtp-Source: AA6agR4uPuUZ2AMFJatBZ7/LNfyWyktlihZYaXvgka5zA4yqK6tAUXi24Vs3MnxDbnhgmlGclDtJMw==
X-Received: by 2002:a2e:a90a:0:b0:261:d622:248c with SMTP id
 j10-20020a2ea90a000000b00261d622248cmr1985262ljq.332.1661504953633; 
 Fri, 26 Aug 2022 02:09:13 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 b10-20020a056512070a00b0048a91266268sm306753lfs.232.2022.08.26.02.09.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 02:09:13 -0700 (PDT)
Message-ID: <a7a313c2-66bb-0551-22c1-365cf9a5c855@linaro.org>
Date: Fri, 26 Aug 2022 12:09:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH] drm/msm/dpu: populate wb or intf before reset_intf_cfg
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, freedreno@lists.freedesktop.org
References: <1657912468-17254-1-git-send-email-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1657912468-17254-1-git-send-email-quic_abhinavk@quicinc.com>
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
 quic_jesszhan@quicinc.com, quic_aravindh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15/07/2022 22:14, Abhinav Kumar wrote:
> dpu_encoder_helper_phys_cleanup() was not populating neither
> wb or intf to the intf_cfg before calling the reset_intf_cfg().
> 
> This causes the reset of the active bits of wb/intf to be
> skipped which is incorrect.
> 
> Fix this by populating the relevant wb or intf indices correctly.
> 
> Fixes: ae4d721ce100 ("drm/msm/dpu: add an API to reset the encoder related hw blocks")
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

