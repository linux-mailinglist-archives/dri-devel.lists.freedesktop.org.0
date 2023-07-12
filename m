Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FD2751364
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 00:12:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 489D610E5E0;
	Wed, 12 Jul 2023 22:12:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F59210E5E5
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 22:12:34 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4fb8574a3a1so93161e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 15:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689199952; x=1689804752;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EqJysxxH1qyXFydxpNCv52Aaqqbtf6IwIITmwO/wNJQ=;
 b=JBQeOa4LORI6IiOjXziMyaosDGZUzKT8grbrXHAZmLPrP8dHVOYLwvub8tlUqcaVVB
 giXaxvW6g9aVaw2k9tFBQPZWgdaMoFodILOEXc0p6pg2IELeA5TWjRWuMDTiAquAfmZK
 iel7rZZVdH8ucTP/q/y3ILDsYgLTWRT3HzCyTV52VYnyZf9get3Pyq/UdgiF/gO/fnQ3
 o8xV7l70pRaRwkFWw5v6poV7RzWOfFAyZLuibSMEhV31HywY9qSsdt6tL1rypspLJsgT
 r8v76q5j/6f5IxrzWM9p/Fa7iwKmT58lhz/qlfvUq8mmmIbvZKm1r927Xd/4s6lDNY3Q
 v8fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689199952; x=1689804752;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EqJysxxH1qyXFydxpNCv52Aaqqbtf6IwIITmwO/wNJQ=;
 b=gJzrDlTK9a/xlro6J7iIKb91v6DmJfVcOAYmFdMFdY/MDoFsiaEdM6RaDP0LhoaZ93
 5xdb01ER5HKUIz95u7WJiO3evGIUrC+FohF+yAanzZwa7GU0TpuS+aWafVay+GUkH15a
 X7CZki5qEzHYP/wnA2hrhW7THat8rM5CL/DjcBF+wx2mOC5s6Ozlvdc1EC+qHxpxC+Wn
 4niipM205jvM0sJx1miO0FBbmJWiG0E2mFpzvuF0+WTrHb4m8/nuxyGAUF79Em3SdhtG
 Wbg5DNuZFE3zpys3n3eKlsPhyal+OOWmWOws3PEmhRiz4qnS3K7RrfRGlchArICa6Ltu
 0uvw==
X-Gm-Message-State: ABy/qLbR/wDniaOXI48hWyxX7ht7C3vJdZpYki8yBc24S+PTIzi+cVBZ
 BmI2400MrrtVgLRLUYw90LwVyw==
X-Google-Smtp-Source: APBJJlEYK5pVKISzqJSpYdTFE5+RBHoJVqo0NACxt7MWjJFIbYGhPLLWT27+wIuJW1HjBYGUyJft+g==
X-Received: by 2002:a05:6512:230a:b0:4fa:a217:1e76 with SMTP id
 o10-20020a056512230a00b004faa2171e76mr20605162lfu.9.1689199952649; 
 Wed, 12 Jul 2023 15:12:32 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 c5-20020ac25305000000b004f3789c8bd5sm866377lfh.132.2023.07.12.15.12.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jul 2023 15:12:32 -0700 (PDT)
Message-ID: <f0778167-17c7-b072-1e44-e8b6cdeb29d6@linaro.org>
Date: Thu, 13 Jul 2023 01:12:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v5 4/5] drm/msm/dpu: rename enable_compression() to
 program_intf_cmd_cfg()
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230712012003.2212-1-quic_abhinavk@quicinc.com>
 <20230712012003.2212-5-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230712012003.2212-5-quic_abhinavk@quicinc.com>
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
> Rename the intf's enable_compression() op to program_intf_cmd_cfg()
> and allow it to accept a struct intf_cmd_mode_cfg to program
> all the bits at once. This can be re-used by widebus later on as
> well as it touches the same register.
> 
> changes in v5:
> 	- rename struct intf_cmd_mode_cfg to dpu_hw_intf_cmd_mode_cfg
> 	- remove couple of comments
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 8 ++++++--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c          | 8 +++++---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h          | 9 +++++++--
>   3 files changed, 18 insertions(+), 7 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

