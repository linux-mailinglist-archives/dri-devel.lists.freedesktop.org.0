Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 288A87BC043
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 22:24:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95FC810E566;
	Fri,  6 Oct 2023 20:24:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE33410E566
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Oct 2023 20:23:59 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-27762a19386so1809010a91.2
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Oct 2023 13:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1696623839; x=1697228639;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=yeQqUbIodZOEmRnT0u+h/uvWq4E1WjoaKYarDgehFlU=;
 b=Pw3kzF5BnM1/J+brTVyeexL0CD8xOPCs8n7DfELrERg4+scF8fm9Vf9uokalehrPHH
 HzPnpjhHXSxo4efETYnvsI/qRbHprYF4lgGQFpRc+pMOY094omA5CM7n/cR5JTRV+mD0
 R+YMAavHRzZW+YQWCq2tV7eVcZPMiB9uasz24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696623839; x=1697228639;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yeQqUbIodZOEmRnT0u+h/uvWq4E1WjoaKYarDgehFlU=;
 b=woXGZMZGpu3G69YuDepQUaNhUacSBBg9UYVGj0AyBYIHnWtnjnz0DPXHTNKcT9Qao3
 agm6M3JlY4xh3NW4f/iFmlDXGnu/W/zXAFluQ+UJ567ljCzB6yoXCnXc7JvS79r3n1MP
 1MQ2z/Lj/XhAhg/2Zo5HFbCFbrSnhbVHbaCDK33XWaZxzbGxzaWA9VQGuyNfPSN6MvXa
 CHb7PyJy0Yrr76+TD9TLVwx/h89q9lOmslnMIwv06KxSxjSYC/08Fv5yGc8BxlN3+YLe
 QrGu6SOUa8Bu8tYA0YAvXI163KTiD3mYPc+L+kVL1oaCtLXOzer0MrMklVTmeNbNv+Qd
 3sjQ==
X-Gm-Message-State: AOJu0Yxrd0LFyWfCPj/NTdl4VKYqINXoFouDRFMIICqM0O2VaBIoEYQT
 cuSTVUATDquEoDSm+v9OEztf0g==
X-Google-Smtp-Source: AGHT+IHEr5nv1cWEM1Y3LbpIOqHG/Lj+SrRUHy4wA915uDKNkG765B0Y8Pm/6H1gh2Qpt05VCVwqjA==
X-Received: by 2002:a17:90a:a085:b0:276:e14a:4991 with SMTP id
 r5-20020a17090aa08500b00276e14a4991mr8929179pjp.2.1696623839216; 
 Fri, 06 Oct 2023 13:23:59 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 13-20020a170902c10d00b001bc68602e54sm4343643pli.142.2023.10.06.13.23.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Oct 2023 13:23:58 -0700 (PDT)
Date: Fri, 6 Oct 2023 13:23:56 -0700
From: Kees Cook <keescook@chromium.org>
To: Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH v2] drm/etnaviv: refactor deprecated strncpy
Message-ID: <202310061323.05B262D@keescook>
References: <20230918-strncpy-drivers-gpu-drm-etnaviv-etnaviv_perfmon-c-v2-1-8ae12071c138@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230918-strncpy-drivers-gpu-drm-etnaviv-etnaviv_perfmon-c-v2-1-8ae12071c138@google.com>
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

On Mon, Sep 18, 2023 at 01:34:08PM +0000, Justin Stitt wrote:
> `strncpy` is deprecated for use on NUL-terminated destination strings [1].
> 
> We should prefer more robust and less ambiguous string interfaces.
> 
> A suitable replacement is `strscpy_pad` due to the fact that it
> guarantees NUL-termination on the destination buffer whilst maintaining
> the NUL-padding behavior that strncpy provides.

Friend ping. Who can pick this change up?

Thanks!

-Kees

> 
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
> Link: https://github.com/KSPP/linux/issues/90
> Cc: linux-hardening@vger.kernel.org
> Cc: Bo YU <tsu.yubo@gmail.com>
> Signed-off-by: Justin Stitt <justinstitt@google.com>
> ---
> Changes in v2:
> - use strscpy_pad (thanks Kees)
> - Link to v1: https://lore.kernel.org/r/20230914-strncpy-drivers-gpu-drm-etnaviv-etnaviv_perfmon-c-v1-1-3adc2d9bfc52@google.com
> ---
> Similar to [2] which was never picked up. Let's prefer strscpy_pad to strlcpy, though
> 
> [2]: https://lore.kernel.org/all/20190328080918.9290-1-tsu.yubo@gmail.com/
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_perfmon.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c b/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
> index bafdfe49c1d8..dc9dea664a28 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
> @@ -511,7 +511,7 @@ int etnaviv_pm_query_dom(struct etnaviv_gpu *gpu,
>  
>  	domain->id = domain->iter;
>  	domain->nr_signals = dom->nr_signals;
> -	strncpy(domain->name, dom->name, sizeof(domain->name));
> +	strscpy_pad(domain->name, dom->name, sizeof(domain->name));
>  
>  	domain->iter++;
>  	if (domain->iter == nr_domains)
> @@ -540,7 +540,7 @@ int etnaviv_pm_query_sig(struct etnaviv_gpu *gpu,
>  	sig = &dom->signal[signal->iter];
>  
>  	signal->id = signal->iter;
> -	strncpy(signal->name, sig->name, sizeof(signal->name));
> +	strscpy_pad(signal->name, sig->name, sizeof(signal->name));
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
