Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA376616663
	for <lists+dri-devel@lfdr.de>; Wed,  2 Nov 2022 16:43:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7F4110E4D2;
	Wed,  2 Nov 2022 15:43:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CA3510E4D1
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Nov 2022 15:43:01 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id d10so16743446pfh.6
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Nov 2022 08:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=CbzfHUK/OIe01GljM+tYcwS2aLG1wlQhszOS90aIPbk=;
 b=TnvBNqsScJgJGa9F6e4NUp0WnQSFcyWRX8Px7ptg6cO6ctt1BRBZcdYb69cwPtIwyN
 QoHb48pAlpwFaQk7ewUS76qc4+cdspn2SEn24wD7ztEg1qPECfbSrnmQfKNybPMUuQua
 osc2GMsfESHWanbfjNZictRM04i534QWu1ZfY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CbzfHUK/OIe01GljM+tYcwS2aLG1wlQhszOS90aIPbk=;
 b=fvuJC6dA+TMoHRBE3LMR94Bn3/ottnF7zAlUFx6WJ7sW/nKz8AqkAcib9HtiRtK0mN
 HowFO3Vf8KOv+dUwqYh8R+w1w/+pmUeesyKxzRgN75vO5e9PLmlurBn/6SioLNQkeUWm
 2kb+Dfp/mG8M6DByBprKZxLnve/fP7MVChdGj+dZ4AVlUBBgqWmmAEUliAK5QUa1BcYj
 zRLrAyV9jxXzOwjXiKGmwNhVB4kLIsXZcK892Xt7A/+m1rlGjOPcgW7D9tL9w5aGxO9b
 FtvdlCDs5D98Nqsq3RQpzZYhZcsbVWrsOyxuIPOo/RVxBt7C4B+0GmNKLXCabNt67JII
 U8Fg==
X-Gm-Message-State: ACrzQf0K66MrxhcCqOcVS6eWJxqRQ8l2VRG+w4+32Y+Z6iH882F+/rmy
 w72PFRZZxJt+n3tBgZlxtwhKgA==
X-Google-Smtp-Source: AMsMyM7zf3RSyPAO0SeThAybZk/yt9Nw3pqPZ2/rk3+peKB5InTdiurM9tAyqpCR0+JSZHkWzA3xrw==
X-Received: by 2002:a65:6b81:0:b0:461:4049:7df7 with SMTP id
 d1-20020a656b81000000b0046140497df7mr22347812pgw.593.1667403780934; 
 Wed, 02 Nov 2022 08:43:00 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 b5-20020a170902650500b00186afd756edsm8431471plk.283.2022.11.02.08.43.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 08:43:00 -0700 (PDT)
Date: Wed, 2 Nov 2022 08:42:59 -0700
From: Kees Cook <keescook@chromium.org>
To: Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH 2/2] drm/amdgpu: Fix type of second parameter in
 odn_edit_dpm_table() callback
Message-ID: <202211020842.8B8E29F8@keescook>
References: <20221102152540.2389891-1-nathan@kernel.org>
 <20221102152540.2389891-2-nathan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221102152540.2389891-2-nathan@kernel.org>
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

On Wed, Nov 02, 2022 at 08:25:40AM -0700, Nathan Chancellor wrote:
> With clang's kernel control flow integrity (kCFI, CONFIG_CFI_CLANG),
> indirect call targets are validated against the expected function
> pointer prototype to make sure the call target is valid to help mitigate
> ROP attacks. If they are not identical, there is a failure at run time,
> which manifests as either a kernel panic or thread getting killed. A
> proposed warning in clang aims to catch these at compile time, which
> reveals:
> 
>   drivers/gpu/drm/amd/amdgpu/../pm/swsmu/amdgpu_smu.c:3008:29: error: incompatible function pointer types initializing 'int (*)(void *, uint32_t, long *, uint32_t)' (aka 'int (*)(void *, unsigned int, long *, unsigned int)') with an expression of type 'int (void *, enum PP_OD_DPM_TABLE_COMMAND, long *, uint32_t)' (aka 'int (void *, enum PP_OD_DPM_TABLE_COMMAND, long *, unsigned int)') [-Werror,-Wincompatible-function-pointer-types-strict]
>           .odn_edit_dpm_table      = smu_od_edit_dpm_table,
>                                      ^~~~~~~~~~~~~~~~~~~~~
>   1 error generated.
> 
> There are only two implementations of ->odn_edit_dpm_table() in 'struct
> amd_pm_funcs': smu_od_edit_dpm_table() and pp_odn_edit_dpm_table(). One
> has a second parameter type of 'enum PP_OD_DPM_TABLE_COMMAND' and the
> other uses 'u32'. Ultimately, smu_od_edit_dpm_table() calls
> ->od_edit_dpm_table() from 'struct pptable_funcs' and
> pp_odn_edit_dpm_table() calls ->odn_edit_dpm_table() from 'struct
> pp_hwmgr_func', which both have a second parameter type of 'enum
> PP_OD_DPM_TABLE_COMMAND'.
> 
> Update the type parameter in both the prototype in 'struct amd_pm_funcs'
> and pp_odn_edit_dpm_table() to 'enum PP_OD_DPM_TABLE_COMMAND', which
> cleans up the warning.
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/1750
> Reported-by: Sami Tolvanen <samitolvanen@google.com>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
