Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 136DC7AC667
	for <lists+dri-devel@lfdr.de>; Sun, 24 Sep 2023 05:01:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2A5A10E0D9;
	Sun, 24 Sep 2023 03:01:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86C5010E0D9
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Sep 2023 03:01:43 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id
 af79cd13be357-7741bffd123so192174285a.0
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Sep 2023 20:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1695524502; x=1696129302;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=8GXhdXaI2PB2O/8obE4EjH0QyOha/I4HQFMH4noGYrw=;
 b=QL2LJp7A77BQ3NeRabVMjHTXG+7e9X9ITund23D+92HatnoSOirMejOHaoESx23gsd
 LnCobeHzx0zgZy4Ubs/5pWWtbebcxekAdPlSe7h7uEQ19FkLmr6r6TBsvY1rZM40fGFO
 RvHnc4jHy419k/oiczKPOszFSDYcwHfsqfiAc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695524502; x=1696129302;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8GXhdXaI2PB2O/8obE4EjH0QyOha/I4HQFMH4noGYrw=;
 b=VH2xk244phPvfRTJgTDk4VTXm5B1FPwyKv8w9EmenzBhnCaUw4Wm1SrctxIuNpGvyz
 yZfwqGx6VrUJd7lWAVML/GXO80FoTzl1lmT6+gIaXYjUroFu71d4/ZkSYvFect6vBBOC
 DOlwnuSFhZEWq8lJeUZkQWvMzQlZsgDsV8jW0VENrB81S19dnXKh0wpuMakPzhM76bce
 +Qbk+QGth/5d9qFcHtREgBw+IfeEnu7leie/jpVHGsWYKS3IK6W2LQbfg4TCdGQKA7R/
 tDsK+34RYMFCCRJNzinH+UfvB260KjRlr3Iy/xPo7Pq1oqh4a9aU4PSs9N9+R4fOlNOt
 LDWQ==
X-Gm-Message-State: AOJu0Yw+2O41caQgldfun5naVINoy+x8TULSdyjpTAbNIfvyaphKypiR
 AZUFnt4r3AmFnMYLwQZqEV5hhQ==
X-Google-Smtp-Source: AGHT+IGr9Of4kfacxpIKInFWXLzjnKSPS5GSoT5UjUfjr++q5sAWMQH24+jZaDPQ+nAE/RwJWzNCOw==
X-Received: by 2002:a05:620a:16b9:b0:76f:1dd4:101f with SMTP id
 s25-20020a05620a16b900b0076f1dd4101fmr3430900qkj.39.1695524502575; 
 Sat, 23 Sep 2023 20:01:42 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 x26-20020aa784da000000b0068c0fcb40d3sm5568979pfn.211.2023.09.23.20.01.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Sep 2023 20:01:41 -0700 (PDT)
Date: Sat, 23 Sep 2023 20:01:41 -0700
From: Kees Cook <keescook@chromium.org>
To: Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH v2] drm/gma500: refactor deprecated strncpy
Message-ID: <202309232000.E307B49B@keescook>
References: <20230919-drivers-gpu-drm-gma500-oaktrail_lvds_i2c-c-v2-1-9ebe6983b4cb@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230919-drivers-gpu-drm-gma500-oaktrail_lvds_i2c-c-v2-1-9ebe6983b4cb@google.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 19, 2023 at 04:41:16AM +0000, Justin Stitt wrote:
> `strncpy` is deprecated for use on NUL-terminated destination strings [1].
> 
> We should prefer more robust and less ambiguous string interfaces.
> 
> Since `chan->base.name` is expected to be NUL-terminated, a suitable
> replacement is `strscpy` [2] due to the fact that it guarantees
> NUL-termination on the destination buffer without also unnecessarily
> NUL-padding (since `chan` is kzalloc'd already).
> 
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
> Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html [2]
> Link: https://github.com/KSPP/linux/issues/90
> Cc: linux-hardening@vger.kernel.org
> Signed-off-by: Justin Stitt <justinstitt@google.com>

Thanks, looks good. If a v3 is needed, Subject can be improved to be
"...: Replace strncpy with strscpy".

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
