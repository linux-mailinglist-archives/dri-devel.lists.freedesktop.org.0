Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2EF616DC2
	for <lists+dri-devel@lfdr.de>; Wed,  2 Nov 2022 20:22:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD6CA10E5A7;
	Wed,  2 Nov 2022 19:22:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A738410E5A7
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Nov 2022 19:22:12 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id k15so9226754pfg.2
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Nov 2022 12:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=4EDI3vYbHaaiAQeZuuGzJ5Pv1WpOR32gAtsS0QDWLuw=;
 b=cf2nTr5YnckoTzWzbGWmtwmcSXrd8AamU45cN4BkmLr5woysN2W1kdbIKrPwII4PVI
 ce8I7YTY4uSDnL6ZPBTz94gxiF8GCs7pA974P296j4z8qCIMA1+np81HnE/zTRa6yv+M
 k3Z8gi82o4u4QsaXVn9ASZodldSA4+ubXIZL0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4EDI3vYbHaaiAQeZuuGzJ5Pv1WpOR32gAtsS0QDWLuw=;
 b=A3oEQJEWa6AMoEzVwOnRGhPHYWWx8iFoMjAx/o1VOiecPc5i+QyubTUM/qMSFh45kM
 /wbecVzwIwbfpmCymPhVXQ8z/Ga2dEeOAEWmn6N3Q7CGdaq5RYuW2Fl0h4GDnDQjkHo1
 l7tjjchY23N/LkPKpWJ0tTdSgmcIZzIvwoyRkEW/Bd3v38opJ4AWvon+oucVVk/GMnOJ
 AjUSpgovxge+KvU+iEdLeXYrmSKh4MI3AlqsXISObMcCeXmPws4x33vS7eKxS16vlI+N
 xeGAV+dyJcZzDasHn7nhJny1nNEPv9UaRKi5bWOBSd9DAM4VTd7CCVM0dCtjwxjmB5gf
 9uLQ==
X-Gm-Message-State: ACrzQf2Edx9QG8XR4y/XCVN6pD441W6Eb6mEoFrqiHFn20w3YW9ZuD4E
 vfhjdMDNrZr4JmF5QfUMjQXrSyoqorfBLA==
X-Google-Smtp-Source: AMsMyM6VtLTeGYSXsL6Ro3gC8gkszOK2+Cjl0KViNXychOWaLiDIqn26ITH/JYsmSRn3aX4X3qwIeQ==
X-Received: by 2002:a05:6a00:1391:b0:56d:2b6f:57b3 with SMTP id
 t17-20020a056a00139100b0056d2b6f57b3mr23293181pfg.56.1667416932256; 
 Wed, 02 Nov 2022 12:22:12 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 85-20020a621658000000b005609d3d3008sm9054723pfw.171.2022.11.02.12.22.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 12:22:11 -0700 (PDT)
Date: Wed, 2 Nov 2022 12:22:11 -0700
From: Kees Cook <keescook@chromium.org>
To: Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH] drm/mediatek: Fix return type of
 mtk_hdmi_bridge_mode_valid()
Message-ID: <202211021222.1E8A8BCB43@keescook>
References: <20221102154712.540548-1-nathan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221102154712.540548-1-nathan@kernel.org>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Tom Rix <trix@redhat.com>,
 llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 patches@lists.linux.dev, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 02, 2022 at 08:47:12AM -0700, Nathan Chancellor wrote:
> With clang's kernel control flow integrity (kCFI, CONFIG_CFI_CLANG),
> indirect call targets are validated against the expected function
> pointer prototype to make sure the call target is valid to help mitigate
> ROP attacks. If they are not identical, there is a failure at run time,
> which manifests as either a kernel panic or thread getting killed. A
> proposed warning in clang aims to catch these at compile time, which
> reveals:
> 
>   drivers/gpu/drm/mediatek/mtk_hdmi.c:1407:16: error: incompatible function pointer types initializing 'enum drm_mode_status (*)(struct drm_bridge *, const struct drm_display_info *, const struct drm_display_mode *)' with an expression of type 'int (struct drm_bridge *, const struct drm_display_info *, const struct drm_display_mode *)' [-Werror,-Wincompatible-function-pointer-types-strict]
>           .mode_valid = mtk_hdmi_bridge_mode_valid,
>                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
>   1 error generated.
> 
> ->mode_valid() in 'struct drm_bridge_funcs' expects a return type of
> 'enum drm_mode_status', not 'int'. Adjust the return type of
> mtk_hdmi_bridge_mode_valid() to match the prototype's to resolve the
> warning and CFI failure.
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/1750
> Reported-by: Sami Tolvanen <samitolvanen@google.com>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
