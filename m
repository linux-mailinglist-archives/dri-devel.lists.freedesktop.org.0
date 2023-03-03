Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0189E6A94CC
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 11:04:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F056310E0D4;
	Fri,  3 Mar 2023 10:04:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9991210E0D4
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Mar 2023 10:04:30 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id k14so2866033lfj.7
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Mar 2023 02:04:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bu1XsCiuemEgXLrsyqbVOjx0c5HoiOQ23/TsjbuCBoM=;
 b=sh/z6/R4aUSyJKc7WkEfC84gl355wbnXtzv9pgOWC/nInmAGvm9qM8m/hwYke4e6D2
 OsK6lQbQEETsY02kiiYWajoKO3enetC7iXxWjK+Hk01+yi1h2F/vAedPkclf1woV+485
 L9WVUwlu+XQPFwuYog2IhQ6v+YX8AdKnRzBjEkvEjjOC9RK7vC1v9H9gtnYhcMWHv1O9
 YaIs8tnOLJVbv7lrlC72u5aZXh0vXOEP0jmXoVls+sGEYncp1e845U+MPpN20C+1x2Nr
 qI3O+sppkZJFb3WCz9NThTYEzelmhPYDLhZ9nY4Te0jtxAbNObXAzKBM0OlVnyjkiqbm
 LlVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bu1XsCiuemEgXLrsyqbVOjx0c5HoiOQ23/TsjbuCBoM=;
 b=r978gTIhRxXh0/6LRc9V6rjE/sFf56Fn6qMpiU6b5qozg09rzut8A6gqHiSx3zlrtj
 /y//0FElVhgM/mN4UXPXaXGwChr+ztxpgOEpVBAWHux0xWA2i85E3+JXK2qNSCWW1ZG7
 Uf8ZkTnTsNxFCKcfSlAfBfO4t7UkHVWFruA69+iqjPKF0CtlusFVbFdMmbz/c1tigiv7
 /O5gu3aqnxkvfF8DPaYuCbaKY6fFVwGNc2UJxTVAn0GC9vRnM13aNPHl6RyamlVFv08B
 34qSk0mpZeuazMY+Q4xHPCwkMQiPvqrXbrYona+YddXzGo/XBq/uTCsmhc4olFE1mOm9
 Nquw==
X-Gm-Message-State: AO0yUKUHiQicWe/i64ghN5cedTjsY55q9d3ZQJAUjAp1xISajQjkJMVJ
 7K+KwPCwju0UOf4Bc7vVCwRo5w==
X-Google-Smtp-Source: AK7set9P64Lzkb6Z0OzuupIyugVRsWfQPf/es/+T2UMX0/iSa+2NFSVoLhg7hou7R53lJFPqZXXp0w==
X-Received: by 2002:a19:f610:0:b0:4dd:abb6:8699 with SMTP id
 x16-20020a19f610000000b004ddabb68699mr388316lfe.40.1677837870086; 
 Fri, 03 Mar 2023 02:04:30 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 b9-20020ac25629000000b004dc4c5149dasm324457lff.301.2023.03.03.02.04.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Mar 2023 02:04:29 -0800 (PST)
Message-ID: <9a14e543-98b3-8df5-46f6-b890b4d3baaa@linaro.org>
Date: Fri, 3 Mar 2023 12:04:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v9 13/15] drm/msm: Add wait-boost support
Content-Language: en-GB
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230302235356.3148279-1-robdclark@gmail.com>
 <20230302235356.3148279-14-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230302235356.3148279-14-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Pekka Paalanen <ppaalanen@gmail.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03/03/2023 01:53, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Add a way for various userspace waits to signal urgency.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/msm_drv.c | 12 ++++++++----
>   drivers/gpu/drm/msm/msm_gem.c |  5 +++++
>   include/uapi/drm/msm_drm.h    | 14 ++++++++++++--
>   3 files changed, 25 insertions(+), 6 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

