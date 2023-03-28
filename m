Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F339F6CC0FE
	for <lists+dri-devel@lfdr.de>; Tue, 28 Mar 2023 15:32:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7CD510E3F4;
	Tue, 28 Mar 2023 13:32:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D3CC10E815
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Mar 2023 13:32:46 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id e11so12551924lji.8
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Mar 2023 06:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680010364;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mOqMV4o6u91F7/3KqJairv0TeaA7yQYahdNMsdR21Qk=;
 b=ODJKFVGAQ5ucmVJh5o0Tx4M1IAr3qyyedClqSgC5KVO+sbg2MjSjiBbEO+v/HFxqRk
 NcpadSpeWNNiIrDDrCNsNhohHD+beRsh94E6R6cpf9D3rvzmQjaOsrcZylkRo06SlDru
 U0u3ISQe/GcZFfCURhWS3b5faxmO+N1mj2jclFsNU4owsU7W9IWOKoxQjXYLJHLACUqV
 rG4lJpBMw/JOC+1buE7rQGJFuoIaiLxa5eNAwJbpqHlkEfTf/BhMeTN+aEBmRdEZnCoZ
 oECXyySEqWFKL+x/nnR0LU2tuQukg86p0XXXL45KKCCMOL14W4r4JrP56c2ubo09Itk6
 opNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680010364;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mOqMV4o6u91F7/3KqJairv0TeaA7yQYahdNMsdR21Qk=;
 b=o1EHOv+FYO5DZiLBCxkujSY59B/GNxZI++kMTb0eVz3lOyPOdEVtyzAhMFdoiJWsEs
 jIFBVyXiJc3KF5P2Hg3aDIZoYzEeIS1cvTrVwTt1XevMGEz53xXtF4TpgX0LfGiCB5mf
 nw07Vz6QALxmVpQ31h0Z5XWj0dq0SEkoO3FoaIU5eUvOoUo3Cp/MVHU4/HAu8LNXZExV
 AycyBT6n7RAnO3zqDNPfTxzQ+WkzYadXCQ4iioesOAqK4Sprk/a5l5VgkmctWL8+q+ss
 5ynrGUFRkI2UwhmiAe673AE572sPv/AvqlXSUoFNRpr9q+MJe5z2DwHVgd1caYTlYbw7
 ENXw==
X-Gm-Message-State: AAQBX9ct/QLB38UEoOaZRBCgx3ZnDwHPOh15xNO+meJNEmjN/z42nP44
 dOgXGhUc6t4t7fNDtRBW4iW8WQ==
X-Google-Smtp-Source: AKy350bNZnAibAjzuMet8+lBWu7+IZY1OLaMr4FzfyxXF8FwhF2Xr/Ng9GqSOa1UbgENlEzQcmH/9w==
X-Received: by 2002:a05:651c:446:b0:295:b0ed:ee8 with SMTP id
 g6-20020a05651c044600b00295b0ed0ee8mr5270401ljg.46.1680010364377; 
 Tue, 28 Mar 2023 06:32:44 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 j21-20020a2e8515000000b002a10b2ea089sm2622587lji.16.2023.03.28.06.32.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Mar 2023 06:32:44 -0700 (PDT)
Message-ID: <014e0cce-0bd8-fecd-f2ab-7086557c6fec@linaro.org>
Date: Tue, 28 Mar 2023 16:32:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v7 32/32] drm/msm/dpu: remove unused
 dpu_plane_validate_multirect_v2 function
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230316161653.4106395-1-dmitry.baryshkov@linaro.org>
 <20230316161653.4106395-33-dmitry.baryshkov@linaro.org>
In-Reply-To: <20230316161653.4106395-33-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/03/2023 18:16, Dmitry Baryshkov wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> After cleaning up the older multirect support the function
> dpu_plane_validate_multirect_v2() is unused. Lets remove it.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> [DB: also drop struct dpu_multirect_plane_states and R0/R1/R_MAX]
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 118 ----------------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  17 ----
>   2 files changed, 135 deletions(-)

For the sake of completeness:
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

