Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 998A6374DCE
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 05:03:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DAFB89F75;
	Thu,  6 May 2021 03:03:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3633889F75
 for <dri-devel@lists.freedesktop.org>; Thu,  6 May 2021 03:03:46 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id l6so4252089oii.1
 for <dri-devel@lists.freedesktop.org>; Wed, 05 May 2021 20:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=K5oeKhWnfTWljork6kG9sjbCOLkcBK1xWa+5KaC6FfA=;
 b=UItIGd7fy9lsjOKrGP51zo5biHp/hQ/qj8iEs7ows6xMHHZEOVCCwh/oCqJqhv7QyP
 GpVpfRCLRhEcdWvHM3S45/tuTNnTHr1cnmB780Clarf0Ni3xz8NtNqvmqrrWN3qmUxle
 SljoP9JJ81W8g5OAM8qrbLvloB/N+DJxN+e3bw8NvHwBZvjmTLOQmZSvonEaVkhcLzz3
 jeO2laQrsWp9z5eYTbMXbUddswgcVQERss0lxJTns4VW8iiv+WNjX/u62SAf7dNB9HPz
 ba2tIvVIqsSEpegW7iiBlhidbKXSp4VqdduclITPSzbqCKYF2EdMhX0CWF3sONTr8Cwv
 BC0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=K5oeKhWnfTWljork6kG9sjbCOLkcBK1xWa+5KaC6FfA=;
 b=qqRjZCnH14sblWUqFo5PiaQrCw8/Dcw9d0od4PCOxqOp48IrWcJWG+owBFVwsjjqHG
 WhkCd33qWjjVyLbwjBEozG2Msm+gcOwKfghcxXmXyTofrPILQszCGdL9yzk3OeyMXH31
 K8yZFSoT/CxE/3Vz1M5UZgwGgUeAB5lLG82dErTep1ineGbj+z9nL2rG8XaRBXd6xqt2
 JM4vYgnm5CdBFow47+sdfV1BmkEjt9Wr41orEdNaOC6KOjDORskUF86Zhu3gJ5NU+Mez
 lJXT1c7IHBhKuWI7mESGRhXeraXrcLl25nt4hv3OfOjJsYGmNm0/rrru3y7HozD1zl/D
 qWkw==
X-Gm-Message-State: AOAM530+o/MjxEwbpfryPpgvmk6EcAuTJFSyCaT0aAPxjvUV3E5zbB1i
 Md+WFXk+gdqymqwt6GyApyA=
X-Google-Smtp-Source: ABdhPJzJF8Vcj0ULOhre2WMz85zKPLyV9PDxnCgEyzDtZmmFR3z5ebRss2D5d0LbII8uCzq6wp4GXw==
X-Received: by 2002:a05:6808:20d:: with SMTP id
 l13mr1459416oie.158.1620270225476; 
 Wed, 05 May 2021 20:03:45 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id h12sm314064otk.55.2021.05.05.20.03.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 20:03:45 -0700 (PDT)
Date: Wed, 5 May 2021 20:03:43 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH] fbmem: Correct position of '__maybe_unused' in
 proc_fb_seq_ops
Message-ID: <20210506030343.GA741106@roeck-us.net>
References: <20210505182808.3855516-1-nathan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210505182808.3855516-1-nathan@kernel.org>
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
Cc: linux-fbdev@vger.kernel.org, kernel test robot <lkp@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, clang-built-linux@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 05, 2021 at 11:28:08AM -0700, Nathan Chancellor wrote:
> Clang warns:
> 
>  drivers/video/fbdev/core/fbmem.c:736:21: warning: attribute
>  declaration must precede definition [-Wignored-attributes]
>  static const struct __maybe_unused seq_operations proc_fb_seq_ops = {
>                      ^
>  ./include/linux/compiler_attributes.h:273:56: note: expanded from macro
>  '__maybe_unused'
>  #define __maybe_unused                  __attribute__((__unused__))
>                                                         ^
>  ./include/linux/seq_file.h:31:8: note: previous definition is here
>  struct seq_operations {
>         ^
>  1 warning generated.
> 
> The attribute should not split the type 'struct seq_operations'. Move it
> before the struct keyword so that it works properly and there is no more
> warning.
> 

Oops, sorry.

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Guenter

> Fixes: b9d79e4ca4ff ("fbmem: Mark proc_fb_seq_ops as __maybe_unused")
> Link: https://github.com/ClangBuiltLinux/linux/issues/1371
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  drivers/video/fbdev/core/fbmem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
> index 52c606c0f8a2..84c484f37b4a 100644
> --- a/drivers/video/fbdev/core/fbmem.c
> +++ b/drivers/video/fbdev/core/fbmem.c
> @@ -733,7 +733,7 @@ static int fb_seq_show(struct seq_file *m, void *v)
>  	return 0;
>  }
>  
> -static const struct __maybe_unused seq_operations proc_fb_seq_ops = {
> +static const __maybe_unused struct seq_operations proc_fb_seq_ops = {
>  	.start	= fb_seq_start,
>  	.next	= fb_seq_next,
>  	.stop	= fb_seq_stop,
> 
> base-commit: b9d79e4ca4ff23543d6b33c736ba07c1f0a9dcb1
> -- 
> 2.31.1.362.g311531c9de
> 
