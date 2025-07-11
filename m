Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04661B016D8
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 10:52:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DF3110E9D1;
	Fri, 11 Jul 2025 08:52:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="PSFfQFXw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 540D210E9D0
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 08:52:21 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-454ac069223so15646055e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 01:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1752223940; x=1752828740; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8derBKGkrTEyUk4H7Vgf14bpDSTC61VSwEgs7ngR2I8=;
 b=PSFfQFXwJ9Pg9j3GhAVoj8QYlN+pUABisatw2LnrLOOMXd3OvN93CQ4NLvp+8U9Bz6
 1MznHfM1N2KZ9tZHTZ+1TYW5blgsjtqOFwGDv/LeEDepNYm9rR1hVeG6RhbUDQ6tDHxx
 4pSHIm5fS10aIhx4j+2Z8I62tDg/zu4H2bNAQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752223940; x=1752828740;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8derBKGkrTEyUk4H7Vgf14bpDSTC61VSwEgs7ngR2I8=;
 b=thR086HqHNrQ2YCZ3BYiyVBMTAaWVYG/ZDOgeoBGkjxIAUllFbiUyK2TcVrJtX5bco
 4lU6ywv6u2lWsC/4aCv1ziYPrPJQoOwv3Ed2ewf4lrpPU2PB+Ra2dtP39iOay+u9a/Jt
 0qCFFupr/yh+gWKVw6tQnA5l5XtJzx6LNAgZ9waiIKPWjKSvXeyn1do3K7kfheTCwAqP
 4IDBzaTK0timXxM1IrVtm1MQuGBr/05zfFuuyHCt7TNZUdITeViyo4MtgRd7dWU3W1N7
 K2qR0/1+n7tH7SGfM7XfPSsUxzVsdWTQCkx0QlLyjM9GlY0hW55tw0fIDdC6muRzRCKB
 icnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJYqLgmKXiAdSRWOIKsA4Du2BCvWWb+CPqA7dw/XRyc7QotIpDtCaANTZ4G+X3+oz/f//Jzq7WNfo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzMws7SMloL4kiWA8mjYRs46MgkDTezKGAn+beP4uTo107/MFRp
 TdgAjJnAiwB52Of27UBIPKe0O4cF+gug0UN/RGLQk2AOLCF7yWnF+uLLGsLSCXPH/+c=
X-Gm-Gg: ASbGnctVio+mtLVrybzhGlA4Rby/0vv5EgaFcIvSilD/0bz+mWzKzSxTFUn7k1iT4ki
 ANwc/Fl47T4G+7ktWcAP4++vPL4x9gQOWqgghch0zu4OgA5TuTmJloHG37tdG3nJJ+hwigRpzkE
 iuYtg3g84VDzNCw5XYk/fJvvHeY05NpgNMi1rLzVt3S5C10Ggn/XyCUjQVOLceiWhuPQ5UvSupP
 JX327JtrQ7QivY7ClAEAfLUpFzhmRFk6YX9G0c8dNQY3FnylTB63AR7J5avZAPGUm5Ca34A+g9R
 1ElMRmVPZ/1zU80fiawQmQpRlxa3AySxf2PV+L48+9uYgCdvS/VP+NjPoj12m/lHNrj0kwK7eBT
 jg9dlUiegp30eVCN/Vf4xGewaP7QjXITdeIF/SnMy9RWj
X-Google-Smtp-Source: AGHT+IHb717NClqAG1xifIUSeLJK08Q/iqQmZrgvVQp+OyvdWt/usHRp8NPbh9G8VPNNxhojCPLDSQ==
X-Received: by 2002:a05:600c:8207:b0:43b:c857:e9d7 with SMTP id
 5b1f17b1804b1-454e2addac7mr22372895e9.5.1752223939638; 
 Fri, 11 Jul 2025 01:52:19 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454dd540b52sm40898565e9.28.2025.07.11.01.52.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 01:52:19 -0700 (PDT)
Date: Fri, 11 Jul 2025 10:52:17 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Sean Christopherson <seanjc@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Kevin Loughlin <kevinloughlin@google.com>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 Kai Huang <kai.huang@intel.com>, Ingo Molnar <mingo@kernel.org>,
 Zheyun Shen <szy0127@sjtu.edu.cn>, Mingwei Zhang <mizhang@google.com>,
 Francesco Lavra <francescolavra.fl@gmail.com>
Subject: Re: [PATCH v3 1/8] drm/gpu: Remove dead checks on
 wbinvd_on_all_cpus()'s return value
Message-ID: <aHDQwa8FnZ33Rj8u@phenom.ffwll.local>
Mail-Followup-To: Sean Christopherson <seanjc@google.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Kevin Loughlin <kevinloughlin@google.com>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 Kai Huang <kai.huang@intel.com>, Ingo Molnar <mingo@kernel.org>,
 Zheyun Shen <szy0127@sjtu.edu.cn>,
 Mingwei Zhang <mizhang@google.com>,
 Francesco Lavra <francescolavra.fl@gmail.com>
References: <20250522233733.3176144-1-seanjc@google.com>
 <20250522233733.3176144-2-seanjc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522233733.3176144-2-seanjc@google.com>
X-Operating-System: Linux phenom 6.12.30-amd64 
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

On Thu, May 22, 2025 at 04:37:25PM -0700, Sean Christopherson wrote:
> Remove the checks and associated pr_err() on wbinvd_on_all_cpus() failure,
> as the helper has unconditionally returned 0/success since commit
> caa759323c73 ("smp: Remove smp_call_function() and on_each_cpu() return
> values").
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>

I guess this'll all land through x86 trees, for that on this and the patch
from Peter to adjust the module exports to include drm and i915:

Acked-by: Simona Vetter <simona.vetter@ffwll.ch>

Cheers, Sima
> ---
>  drivers/gpu/drm/drm_cache.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_cache.c b/drivers/gpu/drm/drm_cache.c
> index 7051c9c909c2..ea1d2d5d2c66 100644
> --- a/drivers/gpu/drm/drm_cache.c
> +++ b/drivers/gpu/drm/drm_cache.c
> @@ -93,8 +93,7 @@ drm_clflush_pages(struct page *pages[], unsigned long num_pages)
>  		return;
>  	}
>  
> -	if (wbinvd_on_all_cpus())
> -		pr_err("Timed out waiting for cache flush\n");
> +	wbinvd_on_all_cpus();
>  
>  #elif defined(__powerpc__)
>  	unsigned long i;
> @@ -139,8 +138,7 @@ drm_clflush_sg(struct sg_table *st)
>  		return;
>  	}
>  
> -	if (wbinvd_on_all_cpus())
> -		pr_err("Timed out waiting for cache flush\n");
> +	wbinvd_on_all_cpus();
>  #else
>  	WARN_ONCE(1, "Architecture has no drm_cache.c support\n");
>  #endif
> @@ -172,8 +170,7 @@ drm_clflush_virt_range(void *addr, unsigned long length)
>  		return;
>  	}
>  
> -	if (wbinvd_on_all_cpus())
> -		pr_err("Timed out waiting for cache flush\n");
> +	wbinvd_on_all_cpus();
>  #else
>  	WARN_ONCE(1, "Architecture has no drm_cache.c support\n");
>  #endif
> -- 
> 2.49.0.1151.ga128411c76-goog
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
