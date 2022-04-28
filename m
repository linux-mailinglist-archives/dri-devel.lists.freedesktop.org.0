Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A7251393E
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 17:58:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89FDE10E75D;
	Thu, 28 Apr 2022 15:58:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D56D10E74C
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 15:58:55 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id v4so7263777ljd.10
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 08:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=UIG7QfsSHAl3PyOileeC1vkbpeul6vxhfK0AnKiH0N0=;
 b=PX5PmB8wgnwExSmFKR9M8r+1wv8Svna0JzAzAo0Ak3lq1sJo9YpUutlZ088t3huhyD
 iuT/jMsdcy/BQgvuKCR+GEei3sOwVpVLAo8kYQgijpzpWJILUHXTqktWEhi7GEC15jFF
 3NmM4f88blGLHYGCaH9qxHHoTBXPx6rb8SkH8fmFRrfcZjPTs/Olma0zD9i0xU5KAwmt
 +EMEA4yw1HfziYAEh2/qvDhBpM1BS+vLZSAZr9Nsxdegf5OezdogpyYEZl4GKb18c+Bm
 xix7mgWVpMOsFTCFy0WWCt8z79oQ6d+91N0dbZkhWqfb+v98GyGPcUp7zJv4EgqjPSzZ
 SDAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UIG7QfsSHAl3PyOileeC1vkbpeul6vxhfK0AnKiH0N0=;
 b=6V6yBxCPoWs1rBdYeVaFJg2NXeKKKxeNHeyFOxeJ0Sl7ZCKm8uWQ2Bo3268xtjXX+S
 pv5KZ8n68sJwY0cxUgJpnWvFDrwuEATJTcJnIKMGWos8DHh61i9v6byZnqhQHnwbmGSw
 H3b4NM3hCva6ITwn/mO9fHjpFXwBEN6XBFjbH5JljNbFaC+T+FmlosXHmkZz1fJvQjku
 Q539hw/HkoFv1ipcPxjBeuVDSRcHLYOPnp1rmuwE5DK3mnJBfajNqf3G2gGtdYNzi3EK
 fQzUeF9PRKTGegUTEzieLy7yeUnbV5D6fQLSklObJ7Q39+8McchPBe9gWeyyjkziDbmI
 PK8g==
X-Gm-Message-State: AOAM533VJggWR8j8gc5SYnbER8J/EtxtR2S+gwPAQA6CvDoE0yJnghDm
 Zj/f1vrht95ctx4yN663ZNzQqg==
X-Google-Smtp-Source: ABdhPJyKCoZQa2T0UeY6R/3MJ4jYyifIvJ/DMD+qCDiIJWOriX59bMzJkolyqfS4+ved5eRC5IeNRw==
X-Received: by 2002:a2e:9c02:0:b0:24d:bcbd:1c77 with SMTP id
 s2-20020a2e9c02000000b0024dbcbd1c77mr22080525lji.19.1651161533331; 
 Thu, 28 Apr 2022 08:58:53 -0700 (PDT)
Received: from [192.168.43.7] ([188.162.64.61])
 by smtp.gmail.com with ESMTPSA id
 i18-20020ac25b52000000b004722a9966b3sm32603lfp.298.2022.04.28.08.58.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Apr 2022 08:58:52 -0700 (PDT)
Message-ID: <c1f46c3a-4b89-3d6d-06af-242b859f1cab@linaro.org>
Date: Thu, 28 Apr 2022 18:58:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] drm/msm/dpu: remove unused refcount for encoder_phys_wb
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, freedreno@lists.freedesktop.org
References: <1651160067-26431-1-git-send-email-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1651160067-26431-1-git-send-email-quic_abhinavk@quicinc.com>
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

On 28/04/2022 18:34, Abhinav Kumar wrote:
> Remove the unused local variable refcount for encoder_phys_wb
> as the one part of wb_enc is used directly.
> 
> Fixes: 0ce51f19453e ("drm/msm/dpu: introduce the dpu_encoder_phys_* for writeback")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> index cb5c7da53c29..904124a3477e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> @@ -407,9 +407,6 @@ static void dpu_encoder_phys_wb_irq_ctrl(
>   
>   	struct dpu_encoder_phys_wb *wb_enc = to_dpu_encoder_phys_wb(phys);
>   	int ret = 0;
> -	int refcount;
> -
> -	refcount = atomic_read(&wb_enc->wbirq_refcount);
>   
>   	if (enable && atomic_inc_return(&wb_enc->wbirq_refcount) == 1) {
>   		dpu_core_irq_register_callback(phys->dpu_kms,

As I glanced onto this function, it seems you miss updating `ret` here. 
Could you please fix that too?


-- 
With best wishes
Dmitry
