Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7F3616D6D
	for <lists+dri-devel@lfdr.de>; Wed,  2 Nov 2022 20:06:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EA1810E574;
	Wed,  2 Nov 2022 19:06:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED82710E574
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Nov 2022 19:06:51 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 p15-20020a17090a348f00b002141615576dso2990806pjb.4
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Nov 2022 12:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=71cIGVUi+2jVEjXbTMLP+sHbufV3ZHGsKiLlY1xVyE4=;
 b=fjGGSl6TZGy6MhSeAlQ9V3XlMvK9/dKuFuRpy8Ew/54JsuPSu62uZ6R7xn5ia9d6mL
 xmWYa3LxJrXqfZL52eFl4W2S7p0zWy5w3mpFGbEqxRpS4Jz1o7xWa7Czjp+BMc/29Ion
 AObRStps16tXSHWBnfGNhb6ksTT8C1QPkW5mM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=71cIGVUi+2jVEjXbTMLP+sHbufV3ZHGsKiLlY1xVyE4=;
 b=x9Ed6p5FCe/xPHzKzmOHoGGhcwrjBnZHOlgbrY3vr4F0YxF9/vQm4cw3GtoFZ3AWpm
 Ko7yCCwy9EW1n8I82E9ysHJGxEl7Tg7Qkqd/h6btuDPJz+tTuWrKkCUB3z+1O+PeBUM3
 z2a0Nv0OYxdPhpjWUFpQX1Tme6PYoSa/jEWc5ppPZf3UoNs+tEwNwVdqQROHOf7ihq6f
 8SWfWLvND0xMDssGLz95PEzMv6MdMj5C6PqsWs5vRb/aPqPWknAZsdjZj75mXcEL7LyR
 0usor1L7c74lvcYZf3P5gXx/kCi1xinBakhMNYEuR+tS8unLNd7IcNQAZbI5PaTCdXEW
 4jGA==
X-Gm-Message-State: ACrzQf3bfui+QlsBrmQynTlisRDw5Q+ADfFxvZ0WBSZ3bIwO33Udq4UW
 0q/ZI+N4A4ZaelRO0ZgHBs6LCQ==
X-Google-Smtp-Source: AMsMyM7w0eDTA7/r8K67/N2jqI2Q9w/r0P434xSeZcahrG3KviKdGBv3lb4n7+RNP3OVrJqxGz8rXA==
X-Received: by 2002:a17:90a:bf82:b0:214:6fd:90ec with SMTP id
 d2-20020a17090abf8200b0021406fd90ecmr11317834pjs.61.1667416011472; 
 Wed, 02 Nov 2022 12:06:51 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 l12-20020a170903244c00b0017da2798025sm8710635pls.295.2022.11.02.12.06.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 12:06:50 -0700 (PDT)
Date: Wed, 2 Nov 2022 12:06:50 -0700
From: Kees Cook <keescook@chromium.org>
To: Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH] drm/sti: Fix return type of
 sti_{dvo,hda,hdmi}_connector_mode_valid()
Message-ID: <202211021206.1A488F29C@keescook>
References: <20221102155623.3042869-1-nathan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221102155623.3042869-1-nathan@kernel.org>
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
Cc: Tom Rix <trix@redhat.com>, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, patches@lists.linux.dev,
 Sami Tolvanen <samitolvanen@google.com>,
 Alain Volmat <alain.volmat@foss.st.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 02, 2022 at 08:56:23AM -0700, Nathan Chancellor wrote:
> With clang's kernel control flow integrity (kCFI, CONFIG_CFI_CLANG),
> indirect call targets are validated against the expected function
> pointer prototype to make sure the call target is valid to help mitigate
> ROP attacks. If they are not identical, there is a failure at run time,
> which manifests as either a kernel panic or thread getting killed. A
> proposed warning in clang aims to catch these at compile time, which
> reveals:
> 
>   drivers/gpu/drm/sti/sti_hda.c:637:16: error: incompatible function pointer types initializing 'enum drm_mode_status (*)(struct drm_connector *, struct drm_display_mode *)' with an expression of type 'int (struct drm_connector *, struct drm_display_mode *)' [-Werror,-Wincompatible-function-pointer-types-strict]
>           .mode_valid = sti_hda_connector_mode_valid,
>                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   drivers/gpu/drm/sti/sti_dvo.c:376:16: error: incompatible function pointer types initializing 'enum drm_mode_status (*)(struct drm_connector *, struct drm_display_mode *)' with an expression of type 'int (struct drm_connector *, struct drm_display_mode *)' [-Werror,-Wincompatible-function-pointer-types-strict]
>           .mode_valid = sti_dvo_connector_mode_valid,
>                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   drivers/gpu/drm/sti/sti_hdmi.c:1035:16: error: incompatible function pointer types initializing 'enum drm_mode_status (*)(struct drm_connector *, struct drm_display_mode *)' with an expression of type 'int (struct drm_connector *, struct drm_display_mode *)' [-Werror,-Wincompatible-function-pointer-types-strict]
>           .mode_valid = sti_hdmi_connector_mode_valid,
>                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> ->mode_valid() in 'struct drm_connector_helper_funcs' expects a return
> type of 'enum drm_mode_status', not 'int'. Adjust the return type of
> sti_{dvo,hda,hdmi}_connector_mode_valid() to match the prototype's to
> resolve the warning and CFI failure.
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/1750
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
