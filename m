Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 918B66B1E95
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 09:49:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D7F010E7B1;
	Thu,  9 Mar 2023 08:49:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BE5210E7B1
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 08:49:03 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id a32so1071992ljq.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Mar 2023 00:49:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678351741;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ndQH7nAbuFcVR/u/HQsjMbEiAKZj5mUlBWSv1hdxxug=;
 b=Fb9OmPAOd5KS4H8D3+pBZFeBepyfAqDGqkOEsG924nynzRB+ZBVaIz1bl2j8WLJEkp
 oi+4tFWoo/vjLODwyQPBN5pd6St6I8WvEr7ycr31AXzAsuwKVrOhO8UFY2FfBbaW8RL/
 wziauTtv6gr+1DCr+Gbb1RiQcnyUhNGaM5Ug155ZwSp/utUU0t9xNycdxsVOO+C4xMKL
 TqU7CUqL0+bQ4NAA4wydrczSYbATVJm1mgcByyHu3wqukezabLUMN9bZda1R4im74ttC
 46261RaP2oF/9CH9PuxFfyIqRuFlLrS/LDIcsf1NqG8pKbkAoP6277NvrxLlSxkbMuuo
 QMkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678351741;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ndQH7nAbuFcVR/u/HQsjMbEiAKZj5mUlBWSv1hdxxug=;
 b=v85ehGAKm3o9okY1M+0REurE/0QEHmjnmWJYKu00vM/ZP5LUrvBxsep4ztmr9PN/t6
 wdSCXhNGM/sxJD4UTte20lc3NeTguP2/O9Kxo2Vbn4XFjJVdjHeVP3nvdjpx9FhqV3aw
 2vn4ScXTV7AYhSo4ANvmmoullQF13egCTxRrWuagOSE9j7T21Q9ihZ+X2ZQ+agzifY/u
 /OTooPrXWgjCbUyrKjdec1EsWsMaPTwpDgGvbl5j/6tTiC0vxyT/Y8HdufYpho9Z6GVl
 5QbsY/KtCUwFYAYr4+SViOy1H8i4xhqAeD2nKg0shk8/ErAk2Cxoto9lJsfke0Y2ai93
 f8BA==
X-Gm-Message-State: AO0yUKVJHmgSisYjOlAEkKxcILsJK7jne0Yuok/laQn2em1oQltfvUkg
 S5i6QCMd6z5bURbqljcToaV9Ew==
X-Google-Smtp-Source: AK7set8LMu/BEMahbfX8gOyx7vqpoCvyQcWjOT4Pg5tbVcOM9eItld6zLilvF6VjTTGz35wNktmXUA==
X-Received: by 2002:a2e:b613:0:b0:295:b0ee:666d with SMTP id
 r19-20020a2eb613000000b00295b0ee666dmr5604860ljn.53.1678351741139; 
 Thu, 09 Mar 2023 00:49:01 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 s15-20020a2e98cf000000b002986d306698sm584002ljj.95.2023.03.09.00.49.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Mar 2023 00:49:00 -0800 (PST)
Message-ID: <55b40f8f-b1d8-71ba-0af5-91e08e69160f@linaro.org>
Date: Thu, 9 Mar 2023 10:49:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/2] drm/probe_helper: warning on poll_enabled for issue
 catching
Content-Language: en-GB
To: Guchun Chen <guchun.chen@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 hawking.zhang@amd.com, spasswolf@web.de, mike@fireburn.co.uk
References: <20230309054839.2709424-1-guchun.chen@amd.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230309054839.2709424-1-guchun.chen@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/03/2023 07:48, Guchun Chen wrote:
> In order to catch issues in other drivers to ensure proper call
> sequence of polling function.
> 
> Bug: https://gitlab.freedesktop.org/drm/amd/-/issues/2411
> Fixes: a4e771729a51("drm/probe_helper: sort out poll_running vs poll_enabled")

Previously it was suggested that this is not a fix, so the Fixes header 
is incorrect.

Also please use -vN when preparing/sending patchsets. This is v2.

> Reported-by: Bert Karwatzki <spasswolf@web.de>
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Guchun Chen <guchun.chen@amd.com>
> ---
>   drivers/gpu/drm/drm_probe_helper.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
> index 8127be134c39..85e0e80d4a52 100644
> --- a/drivers/gpu/drm/drm_probe_helper.c
> +++ b/drivers/gpu/drm/drm_probe_helper.c
> @@ -852,6 +852,8 @@ EXPORT_SYMBOL(drm_kms_helper_is_poll_worker);
>    */
>   void drm_kms_helper_poll_disable(struct drm_device *dev)
>   {
> +	WARN_ON(!dev->mode_config.poll_enabled);
> +
>   	if (dev->mode_config.poll_running)
>   		drm_kms_helper_disable_hpd(dev);
>   

-- 
With best wishes
Dmitry

