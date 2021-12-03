Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B992E467D0E
	for <lists+dri-devel@lfdr.de>; Fri,  3 Dec 2021 19:15:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1547D7AEE7;
	Fri,  3 Dec 2021 18:15:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D11227AC40
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Dec 2021 18:15:55 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id 207so7751363ljf.10
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Dec 2021 10:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=XETtVR3trVk3mJEQkxCtSey9MCpDGt0zZTF/ap46FO4=;
 b=iE+jSRpvnSte9JQZsPdsAtZykCqnIKnwliWjcBkac6g9S8TiM0IYmlI6EKWy4QNEZw
 Ym3r0jYJScGyrC9KBtisi3lUBkl/rYPfU04BF+xB3kNL69x9DH6Fl8dVFaQChzDdLdLK
 GCu8Y5mmIDGC0OFY8sGn9SON0zMzwp0FulyeVBQFONB4YuX9OkFW176Nr9AWp4uRa1a8
 EOeuK2q9zE7/HA0RzIC7Qig8z2XBsldCOqnR3mZVWIvUDwfJMc5DowTlXKHAoCBcCX1a
 OWpFBAL4COxKVUBuciWVNH81t1oax2Y06D/jq5GGu4tD17gb9fKIr6UL514OBKFT94rg
 Symg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XETtVR3trVk3mJEQkxCtSey9MCpDGt0zZTF/ap46FO4=;
 b=JOmjHMSX+xnfjCGPDKn8By9XmNOZD7QzhBs+9gdh1T38JtG/GMQXltRiOb9iJ+ugiB
 DBqTuDOO4/2F3aNbruf7cwMFeAwdF+bp3NSG1Trdr5DWV0orFPtjcSlqp1VK6w39pm0t
 lVykc5J84MyiqX5QxDQcO1WPTY36+aZX92bu/2CEWX9kCwId8Gkp73Wi1vFZi/xO9C96
 Bj9mAQtJK8j6AI0Or3mXqDkxMEuo2cEYMzwM3oAUYG9qb+9+AgnM/RUmTIzWtMbDXwMQ
 w7aipmbuGTuWqm5hoLx1nuQi0l/3FCDl5GIOcAmK7wGUXopQLYt0CEv+/0o8HpdbenGw
 kBOQ==
X-Gm-Message-State: AOAM532ZOC/LYx/4pokAXAJ9p1l/tJ3wWoUmuWr4Nb3GFfO7w82qTaCu
 uiBTUGLNpDtEynOGc/f0kbY1zg==
X-Google-Smtp-Source: ABdhPJxILDGn/88i8VPm+vst3qYWiNJp3eau+aa1yVIcKUDIXOvNW/S0cGXGWtSkxE7P8RkvkOYe0Q==
X-Received: by 2002:a05:651c:50c:: with SMTP id
 o12mr20110619ljp.438.1638555354010; 
 Fri, 03 Dec 2021 10:15:54 -0800 (PST)
Received: from [192.168.1.8] ([185.24.52.156])
 by smtp.gmail.com with ESMTPSA id l20sm453938lfj.36.2021.12.03.10.15.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Dec 2021 10:15:53 -0800 (PST)
Message-ID: <ffdf9007-d2cc-2437-684c-66c00bb0ceda@linaro.org>
Date: Fri, 3 Dec 2021 21:15:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] drm/msm/dpu: removed logically dead code
Content-Language: en-GB
To: Ameer Hamza <amhamza.mgc@gmail.com>, robdclark@gmail.com,
 sean@poorly.run, quic_abhinavk@quicinc.com, airlied@linux.ie, daniel@ffwll.ch
References: <20211203161846.37720-1-amhamza.mgc@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20211203161846.37720-1-amhamza.mgc@gmail.com>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03/12/2021 19:18, Ameer Hamza wrote:
> Fixed coverity warning by removing the dead code
> 
> Addresses-Coverity: 1494147 ("Logically dead code")
> 
> Signed-off-by: Ameer Hamza <amhamza.mgc@gmail.com>

While the patch is correct, remove the 'fail' part completely by moving 
DPU_ERROR and return statement in place of corresponding goto statements.

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> index 185379b18572..75f0c0cee661 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> @@ -751,8 +751,6 @@ struct dpu_encoder_phys *dpu_encoder_phys_vid_init(
>   
>   fail:
>   	DPU_ERROR("failed to create encoder\n");
> -	if (phys_enc)
> -		dpu_encoder_phys_vid_destroy(phys_enc);
>   
>   	return ERR_PTR(ret);
>   }
> 


-- 
With best wishes
Dmitry
