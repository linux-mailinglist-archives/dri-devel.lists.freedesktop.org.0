Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D96E173AD8B
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 01:59:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0270710E5BC;
	Thu, 22 Jun 2023 23:59:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A51D10E5BC
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 23:59:06 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2b4725e9917so1622851fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 16:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687478344; x=1690070344;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yyhmYJx/oJKFeU+NO8Awpq9ZWnYSt6vLG+dti5DQq9g=;
 b=ESLQBcZZpKSOVu3J2i5wbB7Ok/kWC3yma/hppJwAt/ZBZZhaWfjIpxBAfo8Ri3dDxe
 331ldYN7HKvXpTZpWHZVDtQ1SN+Nwwk9+lQx5D1JQ+sleueJ78pfsAgiKkgFrDREX+CD
 jy8aAY15uwcKQblhuZUXt1axpwZ5F17yAHKehQBp712ZTjUXkO10NpZvF0+wa12l79yd
 Z2W4oATLugH9bzogNVvUpWcExWkMxbKUtlpbeb0aBXHLCXnt3CiXf6VeUm0m4VWF6soK
 /Tradn85RdK4GDGxQ4iEoOPVUcNp1azMDrm+zoh2VSG7b5b0b+T6+xKVY0ftLw78SSSt
 rX5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687478344; x=1690070344;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yyhmYJx/oJKFeU+NO8Awpq9ZWnYSt6vLG+dti5DQq9g=;
 b=EMq8LC8kFjiOJqh0XvFkO1GzOa3ezpYZKIvqWjRUglp9c+LRghjSEQSKeepgnTrtTZ
 mZrBPUhOKFVt663ZXjdoW8chkN/wkOB5n2s/i+qzyjPWawBv6p+yzu2BeyWnyqef7SNp
 t2+Tmabw8hh879kGJdOeLppgvhaTd3eRjXC65pHRGlgCMrgxpzyaxW4W4LxD87QiW7gC
 XMQipVqW/rhU/4dGf9+oxsYsu40jq5Kf4Uerj+gjObyfn3Rqm2zPkuunWkeevbLT/kvU
 juLRaPTNQwaXnuitUk74fsCzTHWD8Dq0vfgFaNlwEiP33eqivLeWkPOVEzjK3zVhLekA
 ACBQ==
X-Gm-Message-State: AC+VfDz10Xk1uCg+Nk2XiW0OA5SXbj9xzIAmgabhsQlz9X4GgPvdBteD
 3wORqE8KqWkkYRG/xRDl4XYVkp+8cpyWQXj+ZHE=
X-Google-Smtp-Source: ACHHUZ7uBnBOQeXQK/Qk8WLcwAVG8BL2oOHHK1g3QEaFZxzrfxsycpxyc2v14BJUHtDT0JstJfZatQ==
X-Received: by 2002:a2e:a1c8:0:b0:2b1:a810:e43a with SMTP id
 c8-20020a2ea1c8000000b002b1a810e43amr13441236ljm.34.1687478344174; 
 Thu, 22 Jun 2023 16:59:04 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 x18-20020a2e9dd2000000b002b1edfe817fsm1495978ljj.88.2023.06.22.16.59.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jun 2023 16:59:03 -0700 (PDT)
Message-ID: <fc458e8d-9821-23cd-6a73-264ff6f04226@linaro.org>
Date: Fri, 23 Jun 2023 02:59:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/6] drm/msm: Update dev core dump to not print backwards
Content-Language: en-GB
To: Ryan McCann <quic_rmccann@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230622-devcoredump_patch-v1-0-3b2cdcc6a576@quicinc.com>
 <20230622-devcoredump_patch-v1-1-3b2cdcc6a576@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230622-devcoredump_patch-v1-1-3b2cdcc6a576@quicinc.com>
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_jesszhan@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/06/2023 02:48, Ryan McCann wrote:
> Device core dump add block method adds hardware blocks to dumping queue
> with stack behavior which causes the hardware blocks to be printed in
> reverse order. Change the addition to dumping queue data structure
> from "list_add" to "list_add_tail" for FIFO queue behavior.
> 
> Fixes: 98659487b845 ("drm/msm: add support to take dpu snapshot")
> Signed-off-by: Ryan McCann <quic_rmccann@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

