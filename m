Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC72616660
	for <lists+dri-devel@lfdr.de>; Wed,  2 Nov 2022 16:43:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D624910E4DB;
	Wed,  2 Nov 2022 15:42:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C68D10E4D1
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Nov 2022 15:42:55 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id b21so1079529plc.9
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Nov 2022 08:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=gbHhHvdRSfNW3M6lKiiBiHsy/aZHIegD8in6WLhhzSY=;
 b=grx0sX1vyt4doXabEeN05DzVGZaktvYdcCfg6WGKYn2Um48Zgp2UMnzv9yxRjGlvDs
 s02OzcMqRXmY81P844mFxCquKl032+JyuX8aVk9fGB0kVUT/d3ioGHRtH7AHRaujNbdw
 65vnLvXCz2xWmb3ZUvb4RYrBdcrT6g2PSeo3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gbHhHvdRSfNW3M6lKiiBiHsy/aZHIegD8in6WLhhzSY=;
 b=RicrHqwXP+Uv2sqD/ABM3LYzzyQVM84jKtJcZzKjGSseWEhwy9hdhy08Cdoiy+IExZ
 Pn0bf7HofCuadVCQpc7MEdwasodTEKjAAMLfyeYEn2fC2o9ZzVZE979jW1YRbGorkq4L
 dV73oQ1dmhkSKE9LNUaPkjT1AxUZhcQavnKGBrFEA6OF0quPSPwbsZPca5Z4lwed7Akm
 8skWRcqs/ictnF0ZVpyyV82jwDWPacdkSmAEyZf85eoVQ/3bFKZnvV9ptaLJCUgTMwxO
 bzy7yYxUg/lizgnhL3UEcP91GU21vTIH7jX68b0Rg3EK5Z4swkORgWzlvYHUzQ1XksMh
 yj3A==
X-Gm-Message-State: ACrzQf2dOKzMedwnMWtAoCiPYIIHIadwMTrFF6vhPD9YfZ3/CcY/swr5
 kuReWsgFml3skaHgdzAPVbvPeQ==
X-Google-Smtp-Source: AMsMyM5riCGdRLVGt8cheeiKjHf8n8+rR3sMc60dvYFpdMSefduVp5ovnjO/E9dJecAFytPwR3myDw==
X-Received: by 2002:a17:902:720c:b0:186:fb90:573e with SMTP id
 ba12-20020a170902720c00b00186fb90573emr25604727plb.160.1667403775155; 
 Wed, 02 Nov 2022 08:42:55 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 a15-20020a170902710f00b001885041d7b8sm47015pll.293.2022.11.02.08.42.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 08:42:54 -0700 (PDT)
Date: Wed, 2 Nov 2022 08:42:54 -0700
From: Kees Cook <keescook@chromium.org>
To: Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH 1/2] drm/amdgpu: Fix type of second parameter in
 trans_msg() callback
Message-ID: <202211020842.8F3ECD397@keescook>
References: <20221102152540.2389891-1-nathan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221102152540.2389891-1-nathan@kernel.org>
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
Cc: llvm@lists.linux.dev, Tom Rix <trix@redhat.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 patches@lists.linux.dev, amd-gfx@lists.freedesktop.org,
 Sami Tolvanen <samitolvanen@google.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 02, 2022 at 08:25:39AM -0700, Nathan Chancellor wrote:
> With clang's kernel control flow integrity (kCFI, CONFIG_CFI_CLANG),
> indirect call targets are validated against the expected function
> pointer prototype to make sure the call target is valid to help mitigate
> ROP attacks. If they are not identical, there is a failure at run time,
> which manifests as either a kernel panic or thread getting killed. A
> proposed warning in clang aims to catch these at compile time, which
> reveals:
> 
>   drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c:412:15: error: incompatible function pointer types initializing 'void (*)(struct amdgpu_device *, u32, u32, u32, u32)' (aka 'void (*)(struct amdgpu_device *, unsigned int, unsigned int, unsigned int, unsigned int)') with an expression of type 'void (struct amdgpu_device *, enum idh_request, u32, u32, u32)' (aka 'void (struct amdgpu_device *, enum idh_request, unsigned int, unsigned int, unsigned int)') [-Werror,-Wincompatible-function-pointer-types-strict]
>           .trans_msg = xgpu_ai_mailbox_trans_msg,
>                       ^~~~~~~~~~~~~~~~~~~~~~~~~
>   1 error generated.
> 
>   drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c:435:15: error: incompatible function pointer types initializing 'void (*)(struct amdgpu_device *, u32, u32, u32, u32)' (aka 'void (*)(struct amdgpu_device *, unsigned int, unsigned int, unsigned int, unsigned int)') with an expression of type 'void (struct amdgpu_device *, enum idh_request, u32, u32, u32)' (aka 'void (struct amdgpu_device *, enum idh_request, unsigned int, unsigned int, unsigned int)') [-Werror,-Wincompatible-function-pointer-types-strict]
>           .trans_msg = xgpu_nv_mailbox_trans_msg,
>                       ^~~~~~~~~~~~~~~~~~~~~~~~~
>   1 error generated.
> 
> The type of the second parameter in the prototype should be 'enum
> idh_request' instead of 'u32'. Update it to clear up the warnings.
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/1750
> Reported-by: Sami Tolvanen <samitolvanen@google.com>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
