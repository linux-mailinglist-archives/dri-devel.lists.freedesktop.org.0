Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A421E55530D
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 20:14:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF8B710E1B6;
	Wed, 22 Jun 2022 18:14:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9B8A10E1B6
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 18:14:10 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id o23so13237054ljg.13
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 11:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=tOaTUPPd6PdnEExOp4k5WWfYtYj0K5ouhfpsiU0MJ+w=;
 b=lMSz4dBNNkjwUgQVLw2XHuk6MaRJIayQLYaVfK4Jg5y35/dTMC79+wGsynebGHJPzu
 oEke8IHC9DqEek694z88Vsyk9VHBG+98m0tvqwI6Gv47nFn7SaHIi8fIMqyZei/q7i9j
 AbJBhCa8grNO6PMrhiSwdzC9AwDyUnhf8NbfvnKAo9XXUTs9MgsIpu5QHq2KPFWhjQJt
 AdgoTxsY/5ooIOCtlABRvN19t8xjZwvlfqE1QDNAND/moluseFEqnsmhOJbTFZ0BGD5g
 fBSCyKEgKo+avosEChFcl4zGwUtdyxowcDOPMKyiCrUhNOE8XRFAM60zzgB2Hwo4mOpK
 ePzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tOaTUPPd6PdnEExOp4k5WWfYtYj0K5ouhfpsiU0MJ+w=;
 b=xILKSS2x8ZmucXggqXrNp+m99qDh5uJ13zkh9qKBXYY88oXslMidJhrk4E1jQI8H5W
 SbQeCzho+Js3MGvWvb3Q9wB1Ud/9Pz08oEuBECJQZPze3MRi5YoaBAgpv7jnY0sDbhSt
 QA5KlbuRTVh0VA4nDnSoXIBNYnMXIHXgMhdUHahWl5Npjs9mV3a3zgMDPQun96eIYvKo
 UPGuIXEYvAWbJfoXsUr2O4NJp9sSBBJOYxunEppCk0vjMDK5QPmwUhXxl6hAzps2rTji
 jNrhdyySLXvfqmlJyx+UQkNI1/21TnRNj9Yj9RSZ98QWfoVnfQn5D7WjaAJWtIbNVqNJ
 pKMg==
X-Gm-Message-State: AJIora9VLsqyzHT3hq2K0GOJCDmxY/zaMHjMz4LUjeKhajOU3BmongF2
 YDfXHgBgUqN9vgLDNffsc2EHVg==
X-Google-Smtp-Source: AGRyM1sDZSQ9wOQc+S8b6FOus1k4rbB5EVldDN3tKv3CSF+uyrl2CuvZ7MLOW3KGU6zXdS6vurt5qw==
X-Received: by 2002:a2e:a16f:0:b0:25a:7527:95ce with SMTP id
 u15-20020a2ea16f000000b0025a752795cemr2622679ljl.305.1655921649232; 
 Wed, 22 Jun 2022 11:14:09 -0700 (PDT)
Received: from [192.168.1.212] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 u1-20020a199201000000b0047255d210dbsm2641802lfd.10.2022.06.22.11.14.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jun 2022 11:14:08 -0700 (PDT)
Message-ID: <fb4310fd-61b1-08ab-c1fb-ed530684a390@linaro.org>
Date: Wed, 22 Jun 2022 21:14:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] drm/msm/dp: reset drm_dev to NULL at dp_display_unbind()
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, robdclark@gmail.com,
 sean@poorly.run, swboyd@chromium.org, dianders@chromium.org,
 vkoul@kernel.org, daniel@ffwll.ch, airlied@linux.ie, agross@kernel.org,
 bjorn.andersson@linaro.org
References: <1655916845-31760-1-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1655916845-31760-1-git-send-email-quic_khsieh@quicinc.com>
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, quic_aravindh@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/06/2022 19:54, Kuogee Hsieh wrote:
> During msm initialize phase, dp_display_unbind() will be called to undo
> initializations had been done by dp_display_bind() previously if there is
> error happen at msm_drm_bind. Under this kind of circumstance, drm_device
> may not be populated completed which causes system crash at drm_dev_dbg().
> This patch reset drm_dev to NULL so that following drm_dev_dbg() will not
> refer to any internal fields of drm_device to prevent system from crashing.
> Below are panic stack trace,
> 
> [   53.584904] Unable to handle kernel paging request at virtual address 0000000070018001
> .
> [   53.702212] Hardware name: Qualcomm Technologies, Inc. sc7280 CRD platform (rev5+) (DT)
> [   53.710445] pstate: 20400009 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [   53.717596] pc : string_nocheck+0x1c/0x64
> [   53.721738] lr : string+0x54/0x60
> [   53.725162] sp : ffffffc013d6b650
> [   53.728590] pmr_save: 000000e0
> [   53.731743] x29: ffffffc013d6b650 x28: 0000000000000002 x27: 0000000000ffffff
> [   53.739083] x26: ffffffc013d6b710 x25: ffffffd07a066ae0 x24: ffffffd07a419f97
> [   53.746420] x23: ffffffd07a419f99 x22: ffffff81fef360d4 x21: ffffff81fef364d4
> [   53.753760] x20: ffffffc013d6b6f8 x19: ffffffd07a06683c x18: 0000000000000000
> [   53.761093] x17: 4020386678302f30 x16: 00000000000000b0 x15: ffffffd0797523c8
> [   53.768429] x14: 0000000000000004 x13: ffff0000ffffff00 x12: ffffffd07a066b2c
> [   53.775780] x11: 0000000000000000 x10: 000000000000013c x9 : 0000000000000000
> [   53.783117] x8 : ffffff81fef364d4 x7 : 0000000000000000 x6 : 0000000000000000
> [   53.790445] x5 : 0000000000000000 x4 : ffff0a00ffffff04 x3 : ffff0a00ffffff04
> [   53.797783] x2 : 0000000070018001 x1 : ffffffffffffffff x0 : ffffff81fef360d4
> [   53.805136] Call trace:
> [   53.807667]  string_nocheck+0x1c/0x64
> [   53.811439]  string+0x54/0x60
> [   53.814498]  vsnprintf+0x374/0x53c
> [   53.818009]  pointer+0x3dc/0x40c
> [   53.821340]  vsnprintf+0x398/0x53c
> [   53.824854]  vscnprintf+0x3c/0x88
> [   53.828274]  __trace_array_vprintk+0xcc/0x2d4
> [   53.832768]  trace_array_printk+0x8c/0xb4
> [   53.836900]  drm_trace_printf+0x74/0x9c
> [   53.840875]  drm_dev_dbg+0xfc/0x1b8
> [   53.844480]  dp_pm_suspend+0x70/0xf8
> [   53.848164]  dpm_run_callback+0x60/0x1a0
> [   53.852222]  __device_suspend+0x304/0x3f4
> [   53.856363]  dpm_suspend+0xf8/0x3a8
> [   53.859959]  dpm_suspend_start+0x8c/0xc0
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/dp/dp_display.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 2b72639..02fff70 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -316,6 +316,8 @@ static void dp_display_unbind(struct device *dev, struct device *master,
>   
>   	dp_power_client_deinit(dp->power);
>   	dp_aux_unregister(dp->aux);
> +	dp->drm_dev = NULL;
> +	dp->aux->drm_dev = NULL;
>   	priv->dp[dp->id] = NULL;
>   }
>   


-- 
With best wishes
Dmitry
