Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFDF616664
	for <lists+dri-devel@lfdr.de>; Wed,  2 Nov 2022 16:43:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2B0C10E4CD;
	Wed,  2 Nov 2022 15:43:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6189F10E4CD
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Nov 2022 15:43:29 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id l6so16648840pjj.0
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Nov 2022 08:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=pWzb2SKkWTuON7pNcNwFRnwOMg1HNM3x+PlBBYRnE78=;
 b=b1IH6B/wne44OiQXZ9i7FSHJfVW3zIn74ViSqHYAsPnDbPDFo4b0mp4Ea/23Y8yiZp
 4Na6VVGOm+h4UD3nlKM9Rl3pFiFLTzf9UB+jUhfO+J4ZNn+X8eC78BvcBr769QMsJqUU
 WTfGJ4gwtPde3j8W3mqjzgHAHbhf+xT06ghwE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pWzb2SKkWTuON7pNcNwFRnwOMg1HNM3x+PlBBYRnE78=;
 b=hAizUTdel+dJwaxHTuUMS9X5DeklJaupRm2wsYnYcA5dAynCKP/vdnqj4bepaRFtro
 u6sUeAuAE38ZljSxmHv4Zwv44UEYORXk0dzRZurRexmCD7ZeBNapf5qQ8W65/Moj52da
 5dVH+c0fhksGx+QPYpIEnmOKPXSuOuSj/I4pRYYQGjYs8CaJPnzU7vxHm74qp8D5XiSJ
 O/zUEtMUArew9vECwRJpPQIlSvy4cIKDR43xstTAzstWmzh+j7Fyt7X+uqtYMemz2WdB
 zaOHK1APLNagTfq229sJlT7iKPQ4A/5KRk7IZepz+qHw7QIscddzKBmkgkrV++LXh3Lz
 F1WQ==
X-Gm-Message-State: ACrzQf2iIrx3iTSmYFz0xm5fEzIWs2MozXU/DvK0hPn+GP6i/29wJ6k/
 d/KDZ41WUXP+FU+uNnRcoyKjow==
X-Google-Smtp-Source: AMsMyM7PDeQil3IUTDK8DEQhhfPtLai6Y8bKaPW2tqDAKdyYKrgbMX/ec7FMD6Z/EWccGgv35ijpyA==
X-Received: by 2002:a17:903:32cf:b0:187:4b3a:15fd with SMTP id
 i15-20020a17090332cf00b001874b3a15fdmr2922849plr.99.1667403808948; 
 Wed, 02 Nov 2022 08:43:28 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 w10-20020aa79a0a000000b0056c681af185sm8605569pfj.87.2022.11.02.08.43.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 08:43:28 -0700 (PDT)
Date: Wed, 2 Nov 2022 08:43:27 -0700
From: Kees Cook <keescook@chromium.org>
To: Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH] drm/fsl-dcu: Fix return type of
 fsl_dcu_drm_connector_mode_valid()
Message-ID: <202211020843.A19F75B@keescook>
References: <20221102154215.78059-1-nathan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221102154215.78059-1-nathan@kernel.org>
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
Cc: llvm@lists.linux.dev, Tom Rix <trix@redhat.com>,
 Alison Wang <alison.wang@nxp.com>, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 patches@lists.linux.dev, Sami Tolvanen <samitolvanen@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 02, 2022 at 08:42:15AM -0700, Nathan Chancellor wrote:
> With clang's kernel control flow integrity (kCFI, CONFIG_CFI_CLANG),
> indirect call targets are validated against the expected function
> pointer prototype to make sure the call target is valid to help mitigate
> ROP attacks. If they are not identical, there is a failure at run time,
> which manifests as either a kernel panic or thread getting killed. A
> proposed warning in clang aims to catch these at compile time, which
> reveals:
> 
>   drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c:74:16: error: incompatible function pointer types initializing 'enum drm_mode_status (*)(struct drm_connector *, struct drm_display_mode *)' with an expression of type 'int (struct drm_connector *, struct drm_display_mode *)' [-Werror,-Wincompatible-function-pointer-types-strict]
>           .mode_valid = fsl_dcu_drm_connector_mode_valid,
>                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   1 error generated.
> 
> ->mode_valid() in 'struct drm_connector_helper_funcs' expects a return
> type of 'enum drm_mode_status', not 'int'. Adjust the return type of
> fsl_dcu_drm_connector_mode_valid() to match the prototype's to resolve
> the warning and CFI failure.
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/1750
> Reported-by: Sami Tolvanen <samitolvanen@google.com>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
