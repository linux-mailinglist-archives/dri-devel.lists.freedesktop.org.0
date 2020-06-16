Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D6E1FAFF3
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jun 2020 14:13:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D33906E8B4;
	Tue, 16 Jun 2020 12:13:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C9056E8B4
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jun 2020 12:13:37 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id h5so20543088wrc.7
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jun 2020 05:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=XOpwR4mIR2BCAlfbtgwg7hVDYytNk2LC5Gn0C2pFEjI=;
 b=H0amGzbKmNHajF0PJbw8sQ0GVUVnGZbR5ikJ3UIrjhWzwtqmVos/IvMs5zlHorsuTe
 H6/Rn9mJXHaVeMVmkDsGytnzd5eu/63BgtnDKza/LvmRWe04CfIbaJ7VxhN6wc5527GZ
 jC5lZY1MtJ2HPn4LSF/yUc4agZjN0G+q5lPb8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=XOpwR4mIR2BCAlfbtgwg7hVDYytNk2LC5Gn0C2pFEjI=;
 b=BnlDYiN/GL1oKCt7zI6vPAITe6nR/klH2w7SfmeIQ84eu2Pz8cJ0dE96BSf8b/voTR
 VKmAlF7tBIW6Qv/U7Td9z7GloF+PROYvu9F74SfePxAxZuxRKP61iQ9d399/LyV2TAZT
 ZwOqudto5WhjIt/6OQJKGzmx52tWVmREx3472oym1FZg9A3UGvMEEm1TGMu4zslkhC5M
 wu0GdzE/ypHO2py8fxIJHWh0p0no/eqvJZQDNaVd89ZloBXrysHQIk7xbLeS/4mSH5Z+
 fn1cqOJjimMhdX6S+6gNhj7M5mcMmtnGNl/UNzMZJNg6dx3Ihl1h5OV0aCY611uL/c+2
 /dTA==
X-Gm-Message-State: AOAM532N/dYYMTHO+aR1AwIgmxs3didIPWxbPHnqRj1uAn63i/hVJEna
 Xo+RhXikbseuQ++HVkVGA/KUTw==
X-Google-Smtp-Source: ABdhPJw/BfFtQEbS61mEKoH0YXR2JtcvUHpUygOCU7K0n0/KtoXZhakuzt4lYFic9+8J6LVf6k3NmA==
X-Received: by 2002:a5d:5483:: with SMTP id h3mr2900010wrv.10.1592309615920;
 Tue, 16 Jun 2020 05:13:35 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n204sm3991714wma.5.2020.06.16.05.13.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jun 2020 05:13:35 -0700 (PDT)
Date: Tue, 16 Jun 2020 14:13:33 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Masanari Iida <standby24x7@gmail.com>
Subject: Re: [PATCH] drm/kselftest: fix spellint typo in test-drm_mm.c
Message-ID: <20200616121333.GO20149@phenom.ffwll.local>
Mail-Followup-To: Masanari Iida <standby24x7@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 airlied@linux.ie, chris@chris-wilson.co.uk
References: <20200615121151.1557985-1-standby24x7@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200615121151.1557985-1-standby24x7@gmail.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 15, 2020 at 09:11:51PM +0900, Masanari Iida wrote:
> This patch fix a spelling typo in test-drm_mm.c
> 
> Signed-off-by: Masanari Iida <standby24x7@gmail.com>

Applied, thanks for your patch.
-Daniel

> ---
>  drivers/gpu/drm/selftests/test-drm_mm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/selftests/test-drm_mm.c b/drivers/gpu/drm/selftests/test-drm_mm.c
> index 9aabe82dcd3a..31602134c515 100644
> --- a/drivers/gpu/drm/selftests/test-drm_mm.c
> +++ b/drivers/gpu/drm/selftests/test-drm_mm.c
> @@ -2359,7 +2359,7 @@ static int __init test_drm_mm_init(void)
>  	while (!random_seed)
>  		random_seed = get_random_int();
>  
> -	pr_info("Testing DRM range manger (struct drm_mm), with random_seed=0x%x max_iterations=%u max_prime=%u\n",
> +	pr_info("Testing DRM range manager (struct drm_mm), with random_seed=0x%x max_iterations=%u max_prime=%u\n",
>  		random_seed, max_iterations, max_prime);
>  	err = run_selftests(selftests, ARRAY_SIZE(selftests), NULL);
>  
> -- 
> 2.27.0.83.g0313f36c6ebe
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
