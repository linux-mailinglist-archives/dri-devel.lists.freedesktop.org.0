Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 434B469538C
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 23:03:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7862210E09C;
	Mon, 13 Feb 2023 22:03:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FD5110E189
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 22:03:52 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id rp23so35379103ejb.7
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 14:03:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SciaDGlhBSACeEgmQUctvCJzUdxmTqWquIcBNRcQQUE=;
 b=qAUVIMC+kxGeBGNC8PtHQK3/XUIUx+e027q4Aye6trnlmNsJKvFzFM243I+N4pYU5b
 /CC14MXMszJUy5agtczW7mAlyynsNIdLMT5+qjWMdRytyz1cGWVSupc6NvFRRu3RgbmU
 XeZoLLzPgajFYh9kw3YakluNdbpFyZAzoA+q1fth0/8UOadMxeyZlpYuPjC+lxE9ZTne
 jQR+naF+SyZ5BdhPH1Gf9OBhB5SsU5g/sdsBG/yyYR4RhEv2BNV3EY4vAkDyDrF5iFob
 EaXdUn3nVijeBkxhvxGfNkjyB8GWfJFgmRCVfkzJBnWJEFCUxLuEPdw74cCAlH9AA+8C
 tXKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SciaDGlhBSACeEgmQUctvCJzUdxmTqWquIcBNRcQQUE=;
 b=uYU+eyxtWJrmSGlGr4OYKWz5WkIAPvwGmHTOWOFZBBdU+66ivg7yyiTaepsslxKeKb
 C6Mr06yXwh1GXNGYupmjLO9Z8GkZG1ohca1ZmbrBsBxEHh3KC25kT3OV/eYtqPpWYSHt
 wIw2bPRnuTSocDO3MOAV1Xcp7/Fl+U/Eb0B+B5xP/mcFb/UFj3BYMbfpHmpPCBv3kuK9
 gOpoqG0zF0wbOgcfGcVEkna/DuCdwh9HyC7GimBtGCPG69yESm8WrEi/HT6jopPJ7gWf
 tffLojG5hfO2uvi2GblJ3jS2ewB76b5DGz3YZfqJ0hrkgyo+q/HGeXSSJfJgkYQwgJ9/
 V7dA==
X-Gm-Message-State: AO0yUKVYyMik7lDnF9YcsUg/gVcSclWvV+47fora9pFrokLOUkK0Tf6v
 8VK1yVpjhH8amw5ocu6eW5/dBw==
X-Google-Smtp-Source: AK7set/cQftJ3aQ9LX+7ynFyd9oqMGzpGy76JqW65Ia+KeGGF8ri9wWHOvqmZwvJtKPsunxoXmAtOQ==
X-Received: by 2002:a17:906:e99:b0:861:7a02:1046 with SMTP id
 p25-20020a1709060e9900b008617a021046mr377565ejf.37.1676325830819; 
 Mon, 13 Feb 2023 14:03:50 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 dx12-20020a170906a84c00b008b128106fc7sm396128ejb.46.2023.02.13.14.03.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 14:03:50 -0800 (PST)
Message-ID: <9e68a5fb-8dc1-481c-ebf3-b6ad3545319f@linaro.org>
Date: Tue, 14 Feb 2023 00:03:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH v3 3/4] drm/msm/dpu: Remove empty prepare_commit()
 function
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
References: <20230213194819.608-1-quic_jesszhan@quicinc.com>
 <20230213194819.608-4-quic_jesszhan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230213194819.608-4-quic_jesszhan@quicinc.com>
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
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 marijn.suijten@somainline.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/02/2023 21:48, Jessica Zhang wrote:
> Now that the TE setup has been moved to prepare_for_kickoff(), and
> dpu_encoder_prepare_commit() is not empty, remove prepare_commit()
> from DPU driver.

Well. dpu_encoder_prepare_commit() is not empty. I'd say instead:

"... to prepare_for_kickoff(), we have no prepare_commit() callbacks 
left. This makes dpu_encoder_prepare_commit() do nothing. Remove ..."

Otherwise LGTM.

> 
> Changes in V3:
> - Reworded commit message to be more clear
> - Corrected spelling mistake in commit message
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 19 -------------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  7 -------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 21 ---------------------
>   3 files changed, 47 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index dcceed91aed8..35e120b5ef53 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -2090,25 +2090,6 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
>   	ctl->ops.clear_pending_flush(ctl);
>   }
>   
> -void dpu_encoder_prepare_commit(struct drm_encoder *drm_enc)
> -{
> -	struct dpu_encoder_virt *dpu_enc;
> -	struct dpu_encoder_phys *phys;
> -	int i;
> -
> -	if (!drm_enc) {
> -		DPU_ERROR("invalid encoder\n");
> -		return;
> -	}
> -	dpu_enc = to_dpu_encoder_virt(drm_enc);
> -
> -	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
> -		phys = dpu_enc->phys_encs[i];
> -		if (phys->ops.prepare_commit)
> -			phys->ops.prepare_commit(phys);
> -	}
> -}
> -

[skipped the rest]

-- 
With best wishes
Dmitry

