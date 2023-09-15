Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE347A14D5
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 06:38:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F6B110E12E;
	Fri, 15 Sep 2023 04:38:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A22E710E12E
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Sep 2023 04:38:14 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-68fbd31d9ddso1431572b3a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 21:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1694752694; x=1695357494;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=P6xmR7jlw0IbB3VWBm5rVQtoneTVrpegGRYEYV8nLys=;
 b=YpF/SYzhlri6MIvSLSfLVSuu3kSIOKI+Xwr8W8EzrvwNbND9GLEpwZGLJo74aqVtLu
 o3P03+AGFYv3w+t52qXrxiv64tHZtFcVmWKSJIm5ghbiO06EZ4OUoYPqeXssLS3UgbEH
 6V+HXVGYOXQ9gDpb3sVcVGZWG3JVgP4t8CAG0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694752694; x=1695357494;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P6xmR7jlw0IbB3VWBm5rVQtoneTVrpegGRYEYV8nLys=;
 b=ceHkKm3dHUsLfSmdAejkYU0Mw0JG0dJhjeHTClafoAna2nP9cBzmSDm1+ITaxYDo7u
 lI7ZFZRYzXN09dQUD63M72S6dhC5q7TYOuG0nXn4cgPDs5KyReFN4/lBdToXir5n0iiB
 QAtuEcaCWRjKpV2UwBD7VDrsc6gOxdP4RyuScTFzq01H2JIIOyHOJLPC4kHpji0X+kGo
 Nact4xiWyJDsfuQ+kOJ7yGtX/o1bn52jRR2/6PqptjPdxAboaqY0lw+tDz7eglNy39Kg
 bzkWjOkskUK8X3hTIwGl6J87tYQVpjUInBwHfn9knBQm2JxeugdMlVOPyAqS5OGrjAq+
 irQQ==
X-Gm-Message-State: AOJu0YzRf3l5ng6plwKV7MBnvJJjXDzlSEzXN3IV3M6dTdyOiYoyxkCs
 WUQfuxZK+FJQXPTpifoW/fngSg==
X-Google-Smtp-Source: AGHT+IFwyKUaO6hudOvRJCuyZ4AGYfBVqP4sKU1jrW6uaQ5K3+beOE0L71mI880YRk0jfwOpAcpWng==
X-Received: by 2002:a05:6a00:21cb:b0:68f:fa05:b77a with SMTP id
 t11-20020a056a0021cb00b0068ffa05b77amr613661pfj.31.1694752694070; 
 Thu, 14 Sep 2023 21:38:14 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 j13-20020aa7800d000000b0068fb1709f52sm2061763pfi.136.2023.09.14.21.38.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 21:38:13 -0700 (PDT)
Date: Thu, 14 Sep 2023 21:38:12 -0700
From: Kees Cook <keescook@chromium.org>
To: Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH] drm/i915: refactor deprecated strncpy
Message-ID: <202309142137.DDC1D0A@keescook>
References: <20230914-strncpy-drivers-gpu-drm-i915-gem-selftests-mock_context-c-v1-1-c3f92df942e0@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230914-strncpy-drivers-gpu-drm-i915-gem-selftests-mock_context-c-v1-1-c3f92df942e0@google.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 14, 2023 at 09:14:07PM +0000, Justin Stitt wrote:
> `strncpy` is deprecated for use on NUL-terminated destination strings [1].
> 
> We should prefer more robust and less ambiguous string interfaces.
> 
> A suitable replacement is `strscpy` [2] due to the fact that it guarantees
> NUL-termination on the destination buffer without unnecessarily NUL-padding.
> 
> `ctx` is zero allocated and as such strncpy's NUL-padding behavior was
> strictly a performance hit which should now be resolved. It should be
> noted, however, that performance is not critical in these selftests,
> especially by these margins.
> 
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
> Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html [2]
> Link: https://github.com/KSPP/linux/issues/90
> Cc: linux-hardening@vger.kernel.org
> Signed-off-by: Justin Stitt <justinstitt@google.com>
> ---
>  drivers/gpu/drm/i915/gem/selftests/mock_context.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/selftests/mock_context.c b/drivers/gpu/drm/i915/gem/selftests/mock_context.c
> index 8ac6726ec16b..025b9c773b93 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/mock_context.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/mock_context.c
> @@ -36,7 +36,7 @@ mock_context(struct drm_i915_private *i915,
>  	if (name) {
>  		struct i915_ppgtt *ppgtt;
>  
> -		strncpy(ctx->name, name, sizeof(ctx->name) - 1);
> +		strscpy(ctx->name, name, sizeof(ctx->name) - 1);

I'd expect the "- 1" to go away...

-Kees

>  
>  		ppgtt = mock_ppgtt(i915, name);
>  		if (!ppgtt)
> 
> ---
> base-commit: 3669558bdf354cd352be955ef2764cde6a9bf5ec
> change-id: 20230914-strncpy-drivers-gpu-drm-i915-gem-selftests-mock_context-c-980c8ecc9142
> 
> Best regards,
> --
> Justin Stitt <justinstitt@google.com>
> 

-- 
Kees Cook
