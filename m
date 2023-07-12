Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3209C751368
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 00:12:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36F4110E5DB;
	Wed, 12 Jul 2023 22:12:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 725B710E5DB
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 22:12:49 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2b6f52e1c5cso121424821fa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 15:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689199967; x=1689804767;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kkGA8tuEErOePoNy3EdHOL/zl3SZc+Vt0Ew0ErvT8mU=;
 b=lH2FqqhDHHDX36mNRP/QdjgoIz4yvtCqadkC3gKCh3ThuFdDHClo2jZlds1KG8lkwN
 gzJ1nKu4NQmKv7GICs9P1ecvCJkvJw6tau5QrWbeD95xUjPB3Duf0Lw0GYL96cnksZHx
 ONM9++tCPFu7CDYRl/fufHQOs+oHp46HtoRhfKCd0WZJw/zx/I1QjB0QaFIpjaJ9ULbH
 r+2nn+E3W4BeDZHWXZh8+igM6t4tIQcxwsup201uccwvNPYAUgJ4mAM3A1NQW1wS/dyV
 9TNhoN3C48NRAj8nzMNhcUBeTV0x7r1ZcNwq/v4AGTCw00Ub+B3iePymOi4M25mUxDbo
 xSDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689199967; x=1689804767;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kkGA8tuEErOePoNy3EdHOL/zl3SZc+Vt0Ew0ErvT8mU=;
 b=UNj0E5gGu21JVUbJQGg1qQXZxeXp0JMLic0AFbBu13WywUxJ6N1KLIdGj//DDWCqo7
 TphlAJQ3YLoKIC2PIgB+WaTlzAr32Ql1fmrpkh+V4EWk3dIEvIrPDWF+un3WvilPpaII
 EMa1wnkH6WqwAqJa5CrhDm13oaR5bBw+M0T72LG/dFzsq/v2xqyGzKmRP/uH1HFqvEFV
 3QJurSD+XyG521lRhEke0PQR9TNcrmXrgpL0e1OQknBZrv/E7E4JwiBmAwe/De1aXHtz
 sbpLcUi/f6DcLWv//mRzHaJprCVLC456Wzu0yitYVLLOfyYc4yg6OuEZYOzFtSizC/gE
 pwWw==
X-Gm-Message-State: ABy/qLbYNw/JAEWI4viDnOfr+DvAM+2W748Fy69qr4QrBprh7+nHgYaS
 DvpFMP/4CZl6qtUZsbgZIDOHCw==
X-Google-Smtp-Source: APBJJlELSBRlCxDuYvGE7L2An9o9WYKFyL7A0pAsvhe/Ya45rkgFuRs7wWsnMf4bQu4Oushng93JFA==
X-Received: by 2002:a2e:9295:0:b0:2b6:9ed0:46f4 with SMTP id
 d21-20020a2e9295000000b002b69ed046f4mr18641190ljh.23.1689199967579; 
 Wed, 12 Jul 2023 15:12:47 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 c18-20020a2e9d92000000b002b6b7a98c4bsm1167725ljj.77.2023.07.12.15.12.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jul 2023 15:12:47 -0700 (PDT)
Message-ID: <005a1c19-2ff4-f00b-6c88-42cf343651a8@linaro.org>
Date: Thu, 13 Jul 2023 01:12:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v5 3/5] drm/msm/dpu: rename all hw_intf structs to have
 dpu_hw prefix
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230712012003.2212-1-quic_abhinavk@quicinc.com>
 <20230712012003.2212-4-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230712012003.2212-4-quic_abhinavk@quicinc.com>
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
Cc: quic_jesszhan@quicinc.com, andersson@kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/07/2023 04:20, Abhinav Kumar wrote:
> dpu_hw_intf has a few instances of structs which do not have
> the dpu_hw prefix. Lets fix this by renaming those structs
> and updating the usage of those accordingly.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   | 18 +++++++++---------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c    |  6 +++---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h    | 12 ++++++------
>   3 files changed, 18 insertions(+), 18 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

