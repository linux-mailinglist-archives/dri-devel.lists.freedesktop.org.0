Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 251904F8040
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 15:14:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11D2D10EA54;
	Thu,  7 Apr 2022 13:14:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DF1810EA54
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 13:14:21 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id d29so7773690wra.10
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Apr 2022 06:14:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=StoUKCkj0ckT+oznBnUV4MpEJLxKOboDM1phKSbSnVI=;
 b=a6rrFrtWXSwsK20LrlIWtUOpppJYpnj+8CoPoNXPHmf8kcAmW8SbBgo5b3b3rDSsM4
 UzIsByNybXzQHryfzzQ2TGjxk30mVnv2gmOW49SLaiqFi2vXZkywsrnFu7LGbel/h+i4
 IkmfUcGivNty8PC3JK9y0sBkL8eCnAKA+SLGPZLqj7onsRORwwLlALztl7wW11aab3zs
 ZAlDe5U8xzwzMXaTUiQdWhTOsFFLQFwvgDG2wHbLBzsc0rSD9B+k4juHNPlj+vxlYAjs
 7DO7Fhi1hHOkv6wAYe9G0rwoq5geYB2CjW9yXLwhqbfHsb89qzy93nsQqYx8TLcbKKTY
 ewRw==
X-Gm-Message-State: AOAM530S3KtT152YWmkxRW2IsKeFuZ1B2T9vrrIdQ671CK47YM4Ig55N
 JBGA8nSHyoHW8er02+hcf/8vql8lBHg=
X-Google-Smtp-Source: ABdhPJwYS8v1XjLf6ynFOc8VYIK9N9bjrMLjnsFxFf4PmaQPhVJ/3bI0ajLbuJv53Ev+i1iTpbiq5Q==
X-Received: by 2002:a5d:64cb:0:b0:205:8d25:704f with SMTP id
 f11-20020a5d64cb000000b002058d25704fmr11052344wri.518.1649337260047; 
 Thu, 07 Apr 2022 06:14:20 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id
 n20-20020a05600c4f9400b0038cbd13e06esm7846181wmq.2.2022.04.07.06.14.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 06:14:19 -0700 (PDT)
Date: Thu, 7 Apr 2022 13:14:18 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Saurabh Sengar <ssengar@linux.microsoft.com>
Subject: Re: [PATCH v2] drm/hyperv: Added error message for fb size greater
 then allocated
Message-ID: <20220407131418.dr4agu2zebcdlsyg@liuwe-devbox-debian-v2>
References: <1649312827-728-1-git-send-email-ssengar@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1649312827-728-1-git-send-email-ssengar@linux.microsoft.com>
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
Cc: linux-hyperv@vger.kernel.org, airlied@linux.ie, ssengar@microsoft.com,
 decui@microsoft.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, mikelley@microsoft.com,
 drawat.floss@gmail.com, Wei Liu <wei.liu@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 06, 2022 at 11:27:07PM -0700, Saurabh Sengar wrote:
> Added error message when the size of requested framebuffer is more then
> the allocated size by vmbus mmio region for framebuffer
> 
> Signed-off-by: Saurabh Sengar <ssengar@linux.microsoft.com>
> ---
> v1 -> v2 : Corrected Sign-off
> 
>  drivers/gpu/drm/hyperv/hyperv_drm_modeset.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c b/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
> index e82b815..92587f0 100644
> --- a/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
> +++ b/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
> @@ -123,8 +123,11 @@ static int hyperv_pipe_check(struct drm_simple_display_pipe *pipe,
>  	if (fb->format->format != DRM_FORMAT_XRGB8888)
>  		return -EINVAL;
>  
> -	if (fb->pitches[0] * fb->height > hv->fb_size)
> +	if (fb->pitches[0] * fb->height > hv->fb_size) {
> +		drm_err(&hv->dev, "hv->hdev, fb size requested by process %s for %d X %d (pitch %d) is greater then allocated size %ld\n",

then -> than.

> +		current->comm, fb->width, fb->height, fb->pitches[0], hv->fb_size);
>  		return -EINVAL;
> +	}
>  
>  	return 0;
>  }
> -- 
> 1.8.3.1
> 
