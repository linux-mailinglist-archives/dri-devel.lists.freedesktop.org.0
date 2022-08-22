Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF8159CA46
	for <lists+dri-devel@lfdr.de>; Mon, 22 Aug 2022 22:43:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F164A2AB1;
	Mon, 22 Aug 2022 20:42:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61567A2A92
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 20:42:37 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id d23so12562767lfl.13
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 13:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=T2n+Lv4KvObfEMOxqTtH9zJ8A2GPm+1tT6W+HrcRbLY=;
 b=uyR1Lq08Xt37Czv3fZnuQVC5djaS3RavHhqAE/nCVhDLnogNF0T4hECW+gb+J0XekS
 QRBAGt31862H1JfZEACVl+hVxlN+IMC2vy70jeCbPeXbsk4gjBGEmbxpVg+Xs5Eu8dEr
 xLXdznl02Wmki6mmYdK0CWLvyZs3GeMF8MaxxjFHKbN206D+syv/Xzknoyph17E22L7p
 t7VkVqUua0QyUOt2KalftjWfOyu6NIIqssjZOd5ixXL+DPd2zWLVfC63eJAE3yPwSaoF
 RSEDw4hb25LQuNn/HtIgkk/luUb/j5F9LUML0zjL6P0NIAhEbAV406iw01PkA323hO7+
 f1BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=T2n+Lv4KvObfEMOxqTtH9zJ8A2GPm+1tT6W+HrcRbLY=;
 b=tURcT3TlEAaL2H4+z+A0WRtis9PBSyZCOd63iA9v1q0/3PLFTDlyUxRHxvIMPY4dod
 4NNyhvu2TEgW+q88DIWyjpnnJAtDbnq70jwCcxHQ5fkTDsAwRn5XKlQyjvt8yJbxCJ1b
 k97WT3kWHofxYkAZSZcbr5+oHfQOR3HPPl+a2SBH1TwK/yk2N/JBTpntXay95B7bDlRj
 CcNUU9DEh6x6uvu9h6wxVaTxdqHdmzrh/Svfk+fxon7ViOtbwRiiCG3jfooFDenGbble
 ljFAv76qyxrP+i8w5iSETDS8ia23dj0AV25ih+jnqCTj9V321+z8Qk9RUPekjFnn1nY6
 cg+Q==
X-Gm-Message-State: ACgBeo18FcmLR7VoHzbNEaFGHAZ/gAGcfwl8uEg3t31Lkp8dZGZrtbRa
 HqAf4ZTgJk37w3EuBa+lIhaIBA==
X-Google-Smtp-Source: AA6agR5rCB4QhCUzVyTSuhrloe4Tlr3L7LCyjaozOGYIYqRMr4K9wKFtZ6ZXnjidUe1hpMsTfB1upg==
X-Received: by 2002:a05:6512:1385:b0:491:4152:c9d7 with SMTP id
 p5-20020a056512138500b004914152c9d7mr7667543lfa.675.1661200955744; 
 Mon, 22 Aug 2022 13:42:35 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 s8-20020a197708000000b0048a891e4d88sm2089178lfc.193.2022.08.22.13.42.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Aug 2022 13:42:35 -0700 (PDT)
Message-ID: <ea75b23f-d389-b24e-9ebd-2fd35bf33fd1@linaro.org>
Date: Mon, 22 Aug 2022 23:42:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH] drm/msm: Add fault-injection support
Content-Language: en-GB
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20220807172848.2432845-1-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220807172848.2432845-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/08/2022 20:28, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Intended as a way to trigger error paths in mesa.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/msm_debugfs.c |  8 ++++++++
>   drivers/gpu/drm/msm/msm_drv.c     | 15 +++++++++++++++
>   drivers/gpu/drm/msm/msm_drv.h     |  7 +++++++
>   3 files changed, 30 insertions(+)
> -- 
With best wishes
Dmitry

