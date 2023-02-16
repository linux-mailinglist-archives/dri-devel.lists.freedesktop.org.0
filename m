Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE474699A7A
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 17:49:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7848310EE11;
	Thu, 16 Feb 2023 16:49:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BBF510EE11
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 16:49:05 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id m10so2613451ljp.3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 08:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bHKHX1HAZBr85iXwo+WtkQELZyFCk6BcVCrttzsLWZU=;
 b=zak29ERZiQt8Id07KJzutrFccKuEBZa/n53O2dbu5L2/sZ6mWojebQbhZTvmDUcjnp
 0ZFrq8l1JsgyqOH/UBUH9NRlfA5iIqSYZM6CWtFEZnCmabWQrXUkQHv1O6KsYdvsCEKw
 e2xOd4tfdbUtjBHZl5k/ZyfhoLGZYjNYo0Q6A2supNUwxbjY+qvtGk1BPUp8GAEKj0vO
 E0KsVX7CLDrgIw6j3mt0fBsZzJGip7/FK1kBKKBz7BeK5goIQjW2IkznvdTymyZjWsqR
 t7pJt4mMEdZQ8M3aHsn/E3dN91vR8mLYn97uaHy5DiX0NT6z07hRM+5LD5X8ZlNXcdyG
 i0Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bHKHX1HAZBr85iXwo+WtkQELZyFCk6BcVCrttzsLWZU=;
 b=5cUQJ0xldWjawIBUxM0poNsBUcU9Hv2ddR6PPkHn1fN8g6YY2P0z6IwuxGOkhfrJmk
 Hiwrk4CUnZAAezPEDZ5V9xmvu8I3R2UGBqgSAN8uN4dwGVlFM6+1IDjw1QxFc+9wrWES
 HXa8XastNhHy57lPH17ZEqBlbX7TQeaoIz8+NqSp3BLKUCEZe97h+iBiyA9CPdppOdoJ
 PfmRvDMgJUj2vTRadT/hSlR3K2WRK22eRz8O/KJKnXEaKXG2LH0puDn5IB+I7/pSvU6A
 uDftqpe9Q0yxrXdPt1VtMX2njOVnDN0Apo3VpDogZQFdpk4sf60Xd4HaTuv9luLe0ASl
 buPQ==
X-Gm-Message-State: AO0yUKUDl4ayjjz6b8aynjuSLLodVlm8wcgiwfPhiEStme+yrrSV+S/a
 w9mN2vY8WKqDXmaFh14Uoyxf9w==
X-Google-Smtp-Source: AK7set8MsvIGToSTGnh3xHzEOHexpm2Mv0MCDS0pFbnIcUwoVg9VY1ezx/Gcsdy3k2wE6PDGRUYaQg==
X-Received: by 2002:a05:651c:2220:b0:293:4e08:1aab with SMTP id
 y32-20020a05651c222000b002934e081aabmr2865284ljq.10.1676566143576; 
 Thu, 16 Feb 2023 08:49:03 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 o4-20020a2e9444000000b002935284f5a4sm274997ljh.13.2023.02.16.08.49.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Feb 2023 08:49:02 -0800 (PST)
Message-ID: <e2f5fb1d-b57f-4695-5345-c82faea127b0@linaro.org>
Date: Thu, 16 Feb 2023 18:49:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v3 20/27] drm/msm/dpu: add dpu_hw_pipe_cfg to
 dpu_plane_state
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230203182132.1307834-1-dmitry.baryshkov@linaro.org>
 <20230203182132.1307834-21-dmitry.baryshkov@linaro.org>
 <8e89bdc2-94ff-63b8-3089-c946e0226cff@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <8e89bdc2-94ff-63b8-3089-c946e0226cff@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 06/02/2023 21:07, Abhinav Kumar wrote:
> 
> 
> On 2/3/2023 10:21 AM, Dmitry Baryshkov wrote:
>> Now as all accesses to pipe_cfg and pstate have been cleaned, re-add
>> struct dpu_hw_pipe_cfg back to dpu_plane_state, so that
>> dpu_plane_atomic_check() and dpu_plane_atomic_update() do not have a
>> chance to disagree about src/dst rectangles (currently
>> dpu_plane_atomic_check() uses unclipped rectangles, while
>> dpu_plane_atomic_update() uses clipped rectangles calculated by
>> drm_atomic_helper_check_plane_state()).
>>
> The title of the patch should now say "add dpu_hw_sspp_cfg"
> 
> I have a question on the commit text, why does it say "re-add" and not 
> "add".
> 
> dpu_hw_pipe_cfg/dpu_hw_sspp_cfg was not a part of dpu_plane_state even 
> before and I dont recall it was removed in this series and then added back.

Ack, I'll fix both items in v4.

> 
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 64 ++++++++++-------------
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  2 +
>>   2 files changed, 30 insertions(+), 36 deletions(-)-- 
With best wishes
Dmitry

