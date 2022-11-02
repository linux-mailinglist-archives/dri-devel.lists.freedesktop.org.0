Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C492A616D68
	for <lists+dri-devel@lfdr.de>; Wed,  2 Nov 2022 20:06:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5130D10E5A0;
	Wed,  2 Nov 2022 19:06:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB2CE10E574
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Nov 2022 19:06:35 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id i3so17221865pfc.11
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Nov 2022 12:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=YLJw50A1K+KhusFBEa675+xxaU3caL5GDgA+x/6AGwQ=;
 b=eanRVW/LBbSyQtTn8NWCZTTDAawhljklM58TSIe0LHlwW/gHbMD11JP3ckeaEe/msg
 vmppBy0RmvOGmkJW6vTqFKB6oG4y+0rkYyOuCChrP4Sy/x03U/caHHgMIFnNNWlXRSYQ
 MKBSw57TYyF6OcudfzZhtv+PDEccU/3X7mxRc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YLJw50A1K+KhusFBEa675+xxaU3caL5GDgA+x/6AGwQ=;
 b=TANhhhOPAW956jFPHvKN+pWKBy90HjXD0zq0EhGe6iL3ZTE4Pjk3krseVgc6TwsYwQ
 YJ6RbYSg/k7bgcQNdjM7UjC17P9YONpVbzRRhXEPP2qGUZLwQmti9ppDr+uGPt3i3Kd4
 kY0xlvQmefMqoWGA+C92NxBfwQmsiYUqTAX4DPD/DIkOgzQK5iuEpbpUyy6zsNCyNzNp
 cnS+Oy1YZQKqm/Y0jiImdHF7fS4JYj42lVjPVglrVWy28pI/TLk1I3GZYHoji3lzRPQe
 L/Gut+IOTbBGZfXpRMr7dKFB6kpRg+2ETSgxLDDu/kKKvExR+5IrWqV448DyOfIkSpFe
 RHPw==
X-Gm-Message-State: ACrzQf31EN07VKTFmM4iRUelbfvJpsG4+JOekZjeoIAcEKeXktZiKXtu
 Ziuotw3cpEnV1JPgNAZl95bP6fAtvhxgVA==
X-Google-Smtp-Source: AMsMyM5nOP7TB+tQ3IHpynS+a4tGqv36tuqeuJEkR1BO6kWK8sdX+uSJsUdso0ZtKCVhfl6YA8bm0g==
X-Received: by 2002:a05:6a00:1688:b0:53b:4239:7c5c with SMTP id
 k8-20020a056a00168800b0053b42397c5cmr27219671pfc.81.1667415995509; 
 Wed, 02 Nov 2022 12:06:35 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 s17-20020a170902ea1100b00186727e5f5csm8710774plg.248.2022.11.02.12.06.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 12:06:35 -0700 (PDT)
Date: Wed, 2 Nov 2022 12:06:34 -0700
From: Kees Cook <keescook@chromium.org>
To: Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH] drm/meson: Fix return type of
 meson_encoder_cvbs_mode_valid()
Message-ID: <202211021206.F5C5954F66@keescook>
References: <20221102155242.1927166-1-nathan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221102155242.1927166-1-nathan@kernel.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Tom Rix <trix@redhat.com>,
 llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 patches@lists.linux.dev, Sami Tolvanen <samitolvanen@google.com>,
 linux-amlogic@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 02, 2022 at 08:52:42AM -0700, Nathan Chancellor wrote:
> With clang's kernel control flow integrity (kCFI, CONFIG_CFI_CLANG),
> indirect call targets are validated against the expected function
> pointer prototype to make sure the call target is valid to help mitigate
> ROP attacks. If they are not identical, there is a failure at run time,
> which manifests as either a kernel panic or thread getting killed. A
> proposed warning in clang aims to catch these at compile time, which
> reveals:
> 
>   drivers/gpu/drm/meson/meson_encoder_cvbs.c:211:16: error: incompatible function pointer types initializing 'enum drm_mode_status (*)(struct drm_bridge *, const struct drm_display_info *, const struct drm_display_mode *)' with an expression of type 'int (struct drm_bridge *, const struct drm_display_info *, const struct drm_display_mode *)' [-Werror,-Wincompatible-function-pointer-types-strict]
>           .mode_valid = meson_encoder_cvbs_mode_valid,
>                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   1 error generated.
> 
> ->mode_valid() in 'struct drm_bridge_funcs' expects a return type of
> 'enum drm_mode_status', not 'int'. Adjust the return type of
> meson_encoder_cvbs_mode_valid() to match the prototype's to resolve the
> warning and CFI failure.
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/1750
> Reported-by: Sami Tolvanen <samitolvanen@google.com>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
