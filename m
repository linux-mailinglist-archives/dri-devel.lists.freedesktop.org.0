Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69FA769FE66
	for <lists+dri-devel@lfdr.de>; Wed, 22 Feb 2023 23:22:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07CA110E456;
	Wed, 22 Feb 2023 22:22:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 958AF10E455
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Feb 2023 22:22:44 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id w27so12034625lfu.4
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Feb 2023 14:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=atzpGGm4vagUHizle3JgA9VVbXqT62LG4zh3TeyuV3k=;
 b=z3HAXW0r+lBjP33n3TNvCI7k44IekUH5PFat+cB07EL6dqRd2YdAOFE6sHRm06PTCx
 5ZRmH6n7pROQPFle8JBqNEs/lyQY1sZPmKdPB13sKN5sjz4TKeIMgF0F1jVPR/4mW8+7
 IJjxEJwCzXjmQVjqK3k3+erufB2HHOSUwxpp0HZQvBuB/3mUGt4GssoSkle12dUBv/b5
 32HVgPy9GJlDkp3JxNO0tgIE3UAe7HpN2aoTbDnE5q8RiU8hMpAH72pxsJ3l62kt7+ZE
 bwSqs+AK+lrxCwPCvBpOCHlqPZjOmJ+k6JYkoBtpZArbD9pQOCUMd12Wv4PU8p4pITvT
 WJsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=atzpGGm4vagUHizle3JgA9VVbXqT62LG4zh3TeyuV3k=;
 b=J1528uAB0CG2cukmhfXTs56Tlw20J1ZTywCV+XAzgb2ZUx0cycuxa9fUKayXWRsZgE
 pYpzPUk87BqySK8mG4ax4PtW0zX8bNbGrMISXG6qjomUGutgbtVFinrLUApijMri80R6
 Gl4L2iN6YuEC0RMO3VnWbkwny5bYkVh7hlmq/KcWwVyQf2oXs/eiY92JF0kqGKXVtXcH
 m0JBIJkmxnIVbhPjuO/tqubWVrQZLlFUgGGrJV87IwMxiTcT5CGKSf4cepnmP2Wx0Kui
 NkFEwSyXs5qEXxNs1kssL1c5y5+H0u8UnGvuRLEcKiSusGWpCKB/DVD0hgCjAAper109
 XOyA==
X-Gm-Message-State: AO0yUKXT5Da9Dq4fO49XwSOO0JYfnip/aR5wR7pQ9k65jeF3hFHjGDIY
 O68m+pu0G70Fn4FIGASj95GHPg==
X-Google-Smtp-Source: AK7set9n3cIGAeZEY7Yp6SQEIqmsXNCVJMpeL/gyWazXzSu4mnct6+IYJTjeiy23AJy9CGnSUq/4DQ==
X-Received: by 2002:ac2:46d9:0:b0:4dc:807a:d134 with SMTP id
 p25-20020ac246d9000000b004dc807ad134mr2911452lfo.65.1677104562994; 
 Wed, 22 Feb 2023 14:22:42 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 r1-20020ac25a41000000b004d85a7e8b17sm398111lfn.269.2023.02.22.14.22.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Feb 2023 14:22:42 -0800 (PST)
Message-ID: <414f038f-7196-e3ca-5854-222c7c42348d@linaro.org>
Date: Thu, 23 Feb 2023 00:22:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 4/5] drm/msm/a4xx: Implement .gpu_busy
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20230222-konrad-longbois-next-v1-0-01021425781b@linaro.org>
 <20230222-konrad-longbois-next-v1-4-01021425781b@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230222-konrad-longbois-next-v1-4-01021425781b@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/02/2023 23:47, Konrad Dybcio wrote:
> Add support for gpu_busy on a4xx, which is required for devfreq
> support.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/gpu/drm/msm/adreno/a4xx_gpu.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

