Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 345712B35E2
	for <lists+dri-devel@lfdr.de>; Sun, 15 Nov 2020 16:48:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EEDE6E9AD;
	Sun, 15 Nov 2020 15:48:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B608A6E9B0
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Nov 2020 15:48:52 +0000 (UTC)
Received: by mail-il1-x142.google.com with SMTP id q1so12873376ilt.6
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Nov 2020 07:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen.nl; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ldoygcZvwmHBr2LihqdGJdHmsiaQ8Ox3v1+2IXOyC/Y=;
 b=KEGRwcVl1affchl5stJpoRryPTUjdZH0hRjio1s01SssbdzvL6jcCXSp+q0ZWCqOXl
 tf0YUXJ+6Mz3hXrQtgNCOSgzM2znemVTcCPRyXW9RpptpfHxo8SL/B8lFGr4EvoDf45U
 nE6C0o2mlr+3WbEvyDUd/Q9vCPJJN75u9Pn79PKcCz03Y8HELuM4EXEwlTi3UEvuoqT3
 z9hplF61nBW66plhMamlkkNm/fIDErpNQLJXOgE1Axt+GdKrw4ZT/Nh1UyQ135o297rC
 GLFV+fEa5rdL+ZmhGQ5Dh5dhyumFxp+6O5ruXdAyq2YkhSoQHU1//Lm7WbOcbjedhtMS
 uefA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ldoygcZvwmHBr2LihqdGJdHmsiaQ8Ox3v1+2IXOyC/Y=;
 b=iESmwtMymZfCtc+D6GgYGwOtQe5wVQoKqx3EluSaRWXZYv7P+Iz6y8CEUOkhqZMWLp
 axxBU7fW46PjcVukcpBI9stQyTp1IxGw1sA7hiXQ2xvby/JXNPP2tyLVhldMe0HW+t4M
 rq2fDjH7H/1M8a0qOia93NRKg9xB0MS7vAL6o4Oa45Umx2yUPxU+fSLUynlci0MZ9wlY
 2+/ncq5nO1LMsttd85eDd8d6BanQ4+hdIO1AdGbarUVTYfZpjZGVmp6eoKBEJjiDw04I
 vAa6o5rViMhTzdfKZjs1Am04ibBlPV2U9Kan1naqVf+Y96qK+FLuVvqhWAwD0GXeQNZK
 Vlbg==
X-Gm-Message-State: AOAM5333beCQfiNMhkoZRSg7NQb+IcZinYgNi1L4tUNp/WCjSIE0YA6B
 wqVFtvjhJUHm6RExR6Qf3dHarcDpmCdJKzQ3GuVzfg==
X-Google-Smtp-Source: ABdhPJxd7r4mxb99HJVhGPFZd1NyUgk39chxk7fuOxMyWjpwCJwakV0c0uK6fVHqzWWurmFN46P9LCfT0WD1GXB7RJ4=
X-Received: by 2002:a92:c7a2:: with SMTP id f2mr5839047ilk.294.1605455332127; 
 Sun, 15 Nov 2020 07:48:52 -0800 (PST)
MIME-Version: 1.0
References: <6NXsveJa7IUiRftZcOguXi1dj0UifPcrDRtR1oOgrU@cp3-web-009.plabs.ch>
In-Reply-To: <6NXsveJa7IUiRftZcOguXi1dj0UifPcrDRtR1oOgrU@cp3-web-009.plabs.ch>
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Date: Sun, 15 Nov 2020 16:48:49 +0100
Message-ID: <CAP+8YyHLjEe718h2LZUNCYKx4VBw9J2=0BO9-ogzu9NTzCGdng@mail.gmail.com>
Subject: Re: [PATCH] drm/fourcc: fix AMD modifiers PACKERS field doc
To: Simon Ser <contact@emersion.fr>
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>

On Sun, Nov 15, 2020 at 10:39 AM Simon Ser <contact@emersion.fr> wrote:
>
> This field doesn't alias with BANK_XOR_BITS: PACKERS is bits 26:28 while
> BANK_XOR_BITS is bits 23:25.
>
> Fixes: 8ba16d599374 ("drm/fourcc: Add AMD DRM modifiers.")
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> Cc: Alex Deucher <alexdeucher@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>  include/uapi/drm/drm_fourcc.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index ca48ed0e6bc1..29c7a8694479 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -1196,7 +1196,7 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
>  #define AMD_FMT_MOD_PIPE_XOR_BITS_MASK 0x7
>  #define AMD_FMT_MOD_BANK_XOR_BITS_SHIFT 23
>  #define AMD_FMT_MOD_BANK_XOR_BITS_MASK 0x7
> -#define AMD_FMT_MOD_PACKERS_SHIFT 26 /* aliases with BANK_XOR_BITS */
> +#define AMD_FMT_MOD_PACKERS_SHIFT 26
>  #define AMD_FMT_MOD_PACKERS_MASK 0x7
>  #define AMD_FMT_MOD_RB_SHIFT 29
>  #define AMD_FMT_MOD_RB_MASK 0x7
> --
> 2.29.2
>
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
