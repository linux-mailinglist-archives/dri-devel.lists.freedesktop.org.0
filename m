Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33BF37A14CF
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 06:33:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3315310E079;
	Fri, 15 Sep 2023 04:33:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FA9010E075
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Sep 2023 04:33:26 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-68fbd5cd0ceso1465524b3a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 21:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1694752406; x=1695357206;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ortdfDKvpNIzeJx8TZszObBou7irHmSbSFxDLFsiIb8=;
 b=TG1vEn+XkHxnqpMzEUy6rWonTVQgdExRLzzEnQBUTt6eE6dV+7jCG+tVFWjdmqVB9x
 zuAYO7fcWN1LOMxuJzvrCCT7kgsB9Zc3AkQbjCSUfYNTZ8k277xnXdntaHmlIJUIrhnl
 OqFSHXfhY3S7nIsY1sUvxpD7MZRbYay1aPLFA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694752406; x=1695357206;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ortdfDKvpNIzeJx8TZszObBou7irHmSbSFxDLFsiIb8=;
 b=avJuS/gMeflEgtuaaIHE+dfgJAtahVt48kbbrXjnNi/0ovkAO2pnLxNlhVY0uvPEBu
 3/s72qfMQE5xe5nKeIqrVer5SlF1cCjr/C547SFqeHq63UgeAQJDZzUND1j13HyJJroz
 NWoiHXVZ12AM9G4y9mmsyQkaQaj4bAA2egj7YEUo+llUxfbTh/kkt6u3TaAXuqjWLbfH
 5w+cTNtMdPZ9tR1of9eq0iLPQiUIsHyfBs3E3+JhquDt+V9rVxtM89kk/ppbtRn7q+0l
 y/V9wxyasUuScxVaxj8ZmSZ7S37//ah2FILcXb3Mfx3m8X2Xarj5m01hgaLWDD6X4LpH
 aLww==
X-Gm-Message-State: AOJu0YykKRrMOvlJFCqxt0C1DMMd21CxkLpfB4s7+GsV8UiuLas0JAmC
 tqdN+bNWFefULENisav670whdg==
X-Google-Smtp-Source: AGHT+IGzXgg9/OWEiL8KkvNzLUOYOIZOZmk5y/PBBVeZQiwFgRA29dMIvxF6haF9oKiYXTr2yUlD5A==
X-Received: by 2002:a05:6a20:7d8c:b0:131:c760:2a0b with SMTP id
 v12-20020a056a207d8c00b00131c7602a0bmr967771pzj.52.1694752406562; 
 Thu, 14 Sep 2023 21:33:26 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 17-20020a170902ee5100b001bdc209b9a0sm2400126plo.201.2023.09.14.21.33.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 21:33:26 -0700 (PDT)
Date: Thu, 14 Sep 2023 21:33:25 -0700
From: Kees Cook <keescook@chromium.org>
To: Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH] drm/etnaviv: refactor deprecated strncpy
Message-ID: <202309142133.F7FBDD9@keescook>
References: <20230914-strncpy-drivers-gpu-drm-etnaviv-etnaviv_perfmon-c-v1-1-3adc2d9bfc52@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230914-strncpy-drivers-gpu-drm-etnaviv-etnaviv_perfmon-c-v1-1-3adc2d9bfc52@google.com>
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
Cc: Bo YU <tsu.yubo@gmail.com>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 linux-hardening@vger.kernel.org, Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 14, 2023 at 06:20:01PM +0000, Justin Stitt wrote:
> `strncpy` is deprecated for use on NUL-terminated destination strings [1].
> 
> We should prefer more robust and less ambiguous string interfaces.
> 
> A suitable replacement is `strscpy` [2] due to the fact that it guarantees
> NUL-termination on the destination buffer.
> 
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
> Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html [2]
> Link: https://github.com/KSPP/linux/issues/90
> Cc: linux-hardening@vger.kernel.org
> Cc: Bo YU <tsu.yubo@gmail.com>
> Signed-off-by: Justin Stitt <justinstitt@google.com>
> ---
> Similar to [1] which was never picked up. Let's prefer strscpy to strlcpy, though
> 
> [1]: https://lore.kernel.org/all/20190328080918.9290-1-tsu.yubo@gmail.com/
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_perfmon.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c b/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
> index bafdfe49c1d8..9e7bebcf24eb 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
> @@ -511,7 +511,7 @@ int etnaviv_pm_query_dom(struct etnaviv_gpu *gpu,
>  
>  	domain->id = domain->iter;
>  	domain->nr_signals = dom->nr_signals;
> -	strncpy(domain->name, dom->name, sizeof(domain->name));
> +	strscpy(domain->name, dom->name, sizeof(domain->name));

It looks like this is passing through an ioctl(). Let's use
strscpy_pad(0 instead...

-Kees

>  
>  	domain->iter++;
>  	if (domain->iter == nr_domains)
> @@ -540,7 +540,7 @@ int etnaviv_pm_query_sig(struct etnaviv_gpu *gpu,
>  	sig = &dom->signal[signal->iter];
>  
>  	signal->id = signal->iter;
> -	strncpy(signal->name, sig->name, sizeof(signal->name));
> +	strscpy(signal->name, sig->name, sizeof(signal->name));
>  
>  	signal->iter++;
>  	if (signal->iter == dom->nr_signals)
> 
> ---
> base-commit: 3669558bdf354cd352be955ef2764cde6a9bf5ec
> change-id: 20230914-strncpy-drivers-gpu-drm-etnaviv-etnaviv_perfmon-c-dd095491dfde
> 
> Best regards,
> --
> Justin Stitt <justinstitt@google.com>
> 

-- 
Kees Cook
