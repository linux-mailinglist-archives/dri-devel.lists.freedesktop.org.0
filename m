Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF1854DCFC
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 10:36:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D729112866;
	Thu, 16 Jun 2022 08:36:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32124113A16
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 08:36:09 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id h23so1140353lfe.4
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 01:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Sp++qMSjAxtM+Eq+pojlgGtpCw9HAjBH7qr+7RoPkC8=;
 b=NlRsTqV8hSyNMX7Zq5gp6Mu5BdvAPkKT2VmAMRjdS8oxyLZ0PXJbwKv0JFiFYAjlga
 X175OjUnyhTBkdGbwrzOj3Owzntx3W7v/5ZoRf2hwKMMzCoTyT996bw3MNcBa92SOSYV
 biDM4RND7iDeR5d1tj6RUjtCNeZxiKeNVpTmiWWYdutL/SeJfxfl+Y/FwuPOERYvHeFd
 +KrlZTlvN41jM/HcinVwZ+03386Fox9s8+Uo64/XzV8WQBkbrExiwz3A+AMlAoaghKxt
 qHKc4dDsd8uAq3k1zLSi9+jEPG+WLQs9O7jrFqpQND97Pyk5FVNG8awNqVJkKpnX5sIu
 9n1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Sp++qMSjAxtM+Eq+pojlgGtpCw9HAjBH7qr+7RoPkC8=;
 b=wk+kJupaMhR6MldUEnOPP2xX3Wnqhg6mQ+cWkaquwD5RsocuKy4259xoW9yuVRysti
 4SBk+eEEnqi5j1YBxrT9ynmiMOhrYIUUSx7T/fyuebOsx0AKAPZYkZQXoZkQKl+VHi6a
 3FUTyV/a7zGQRGCDuu5UTT3+wHc14i6CE4ETRsvxobtd0k0ppEp4IN0wiXgFlXDb1KpJ
 AS1Xs97WSRP13LZqtxoJWCGSIXwMU18bUEVAv5il8DhuvLISsaZXEt/CRR2HNyeNjYti
 uezoHdDzhjORa4jGJGioc40dsCSMhQUCShbawCIPEYPbO2JTLt9SHVmJzTOfUPAmsASg
 Svbw==
X-Gm-Message-State: AJIora8vfBCFKJibUTDbrC6bsGPeH9NGpH1emuybc7oMZm0QyrkdahHK
 tOriaNbj2/l1EFxxF9UfDMrZyQ==
X-Google-Smtp-Source: AGRyM1uYAwE8j3ndr8BuaPuY9hMoadEaUfqqzduY2JYirp7TumkbVEmcSj5rVd/SyXcYeTGt3RC7ZQ==
X-Received: by 2002:a19:dc0f:0:b0:47f:1b37:8d8a with SMTP id
 t15-20020a19dc0f000000b0047f1b378d8amr2035728lfg.12.1655368567218; 
 Thu, 16 Jun 2022 01:36:07 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 u28-20020ac25bdc000000b0047255d2112asm148225lfn.89.2022.06.16.01.36.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jun 2022 01:36:06 -0700 (PDT)
Message-ID: <253d0390-8a90-c16f-41b4-99ad03b781c8@linaro.org>
Date: Thu, 16 Jun 2022 11:36:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] drm/msm/dpu: set preferred mode for writeback connector
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, freedreno@lists.freedesktop.org
References: <1655335395-16159-1-git-send-email-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1655335395-16159-1-git-send-email-quic_abhinavk@quicinc.com>
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
Cc: markyacoub@chromium.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, seanpaul@chromium.org, quic_jesszhan@quicinc.com,
 quic_aravindh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/06/2022 02:23, Abhinav Kumar wrote:
> After [1] was merged to IGT, we use either the first supported
> mode in the list OR the preferred mode to determine the primary
> plane to use for the sub-test due to the IGT API [2].
> 
> Since writeback does not set any preferred mode, this was
> selecting 4k as that was the first entry in the list.
> 
> We use maxlinewidth to add the list of supported modes for
> the writeback connector which is the right thing to do, however
> since we do not have dual-SSPP support yet for DPU, this fails
> the bandwidth check in dpu_core_perf_crtc_check().
> 
> Till we have dual-SSPP support, workaround this mismatch between
> the list of supported modes and maxlinewidth limited modes by
> marking 640x480 as the preferred mode for DPU writeback because
> kms_writeback tests 640x480 mode only [3].

Telling that we support modes up to 4k, failing to set 4k mode and then 
using the preferred mode to force IGT to lower resolution sounds like a 
hack.

As adding wide dual-SSPP support will take some time. I'd suggest 
dropping support for 4k modes for now and using DEFAULT_DPU_LINE_WIDTH 
instead (or hw_wb->caps->maxlinewidth). A comment in the source code 
that the check should be removed/modified once dual-SSPP is supported 
would be helpful.


> [1]: https://patchwork.freedesktop.org/patch/486441/
> [2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/blob/master/lib/igt_kms.c#L1562
> [3]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/blob/master/tests/kms_writeback.c#L68
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Any Fixes tags?

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> index 399115e4e217..104cc59d6466 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> @@ -10,9 +10,14 @@ static int dpu_wb_conn_get_modes(struct drm_connector *connector)
>   	struct drm_device *dev = connector->dev;
>   	struct msm_drm_private *priv = dev->dev_private;
>   	struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
> +	int count;
>   
> -	return drm_add_modes_noedid(connector, dpu_kms->catalog->caps->max_linewidth,
> +	count = drm_add_modes_noedid(connector, dpu_kms->catalog->caps->max_linewidth,
>   			dev->mode_config.max_height);
> +
> +	drm_set_preferred_mode(connector, 640, 480);
> +
> +	return count;
>   }
>   
>   static const struct drm_connector_funcs dpu_wb_conn_funcs = {


-- 
With best wishes
Dmitry
