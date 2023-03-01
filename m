Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB206A6D36
	for <lists+dri-devel@lfdr.de>; Wed,  1 Mar 2023 14:41:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54CB110E25E;
	Wed,  1 Mar 2023 13:41:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B6F610E25E
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Mar 2023 13:41:44 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id b16so5361371iof.11
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Mar 2023 05:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Kq5OR9hoC260+bemchGBNuQjrNOZhrK9iuZRCuifkTs=;
 b=RNGjW0fKHBPVSu32cnLyQ80bXdFmMDWGyWr8DyQlkX0JakbZI256w+r+tZD8H5sgLv
 Mv93XNX6nbqefYx/euZAMec/fMtwLa6mGSn4k3ROmTxw2u0ojuqabJH+jtV4tzRPAMKB
 Sf4KhzQY2gByZpvCMeUGD+L6zbuVQ94yycdGRyqLMeZsxotjVaKc1YYEOfw+n4dN1ZvQ
 Fgf2sYQftnkmbDAqBSJbZxAR34gndmTIaEgKOwgBjqv+i0tZaPptUnvevGUMUG3iHXCh
 bev3NxJ2B5iVDweZuR2h4Wenct2gS8Uo/P9mjYJ37PUqnG+cmME2c1cqJdMTE6E2Xg2W
 lHkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Kq5OR9hoC260+bemchGBNuQjrNOZhrK9iuZRCuifkTs=;
 b=QR21jQsmOCu2NutmmVJAw9hdjiK3Bnb1CGp3MHJprgdaq3gfZbGi86i43hwodDg6gb
 xaYc6XlYRqK8TCWGNUdkt54FpyxdcD2NKHLKbUCQuM0xjC8Zi6692dwDClLLLTAw2Mo/
 SsxKusNG1Jeq+Fm6masdX8tCEeTy3ghbOsKx7AceeQg8cxtTGCku+Pr3dKRVWys0nfbY
 uOawICosokE8lU0zjjJoGv7h3xFT6CEtrgxtmvYvYYWT7XBMw4jRq+msP25UxdzfKSo/
 AtQS6deck3oxVB409I/9ZGfVI4h5hTvt/0vIqmvFuHuvxIcQvxzzornxC8GbuBHdt+/Y
 LH8A==
X-Gm-Message-State: AO0yUKWgnvtFaglQVBEfjYf1OHMo/FXpyR2mbz73S0pvFec6Z8w0sEZm
 SS1ZQE98ib/8krhc7tdAWx0JWs/mr1AisdQGollOxg==
X-Google-Smtp-Source: AK7set+BWIITMwStn5iOknYU9Ytckv0R80OlViWQC7TNRL095p3FTuT9mKhGhMd4MFbc9GXISWxJtJVx+O7r52M/2LM=
X-Received: by 2002:a02:85cb:0:b0:3c5:b47:539a with SMTP id
 d69-20020a0285cb000000b003c50b47539amr2818912jai.5.1677678103307; Wed, 01 Mar
 2023 05:41:43 -0800 (PST)
MIME-Version: 1.0
References: <cad03d25-0ea0-32c4-8173-fd1895314bce@I-love.SAKURA.ne.jp>
 <CAMuHMdUH4CU9EfoirSxjivg08FDimtstn7hizemzyQzYeq6b6g@mail.gmail.com>
 <86bdfea2-7125-2e54-c2c0-920f28ff80ce@I-love.SAKURA.ne.jp>
 <CAG_fn=VJrJDNSea6DksLt5uBe_sDu0+8Ofg+ifscOyDdMKj3XQ@mail.gmail.com>
 <Y7a6XkCNTkxxGMNC@phenom.ffwll.local>
 <032386fc-fffb-1f17-8cfd-94b35b6947ee@I-love.SAKURA.ne.jp>
In-Reply-To: <032386fc-fffb-1f17-8cfd-94b35b6947ee@I-love.SAKURA.ne.jp>
From: Alexander Potapenko <glider@google.com>
Date: Wed, 1 Mar 2023 14:41:06 +0100
Message-ID: <CAG_fn=V4-zzo+6HFG+wCbJRYHRh+Xx=r1weyCBJG-afpaG4Hag@mail.gmail.com>
Subject: Re: [PATCH] fbcon: Use kzalloc() in fbcon_prepare_logo()
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Marco Elver <elver@google.com>, Kees Cook <keescook@chromium.org>,
 Helge Deller <deller@gmx.de>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 kasan-dev <kasan-dev@googlegroups.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 DRI <dri-devel@lists.freedesktop.org>, Dmitry Vyukov <dvyukov@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>
> I'd like to avoid touching per-arch asm/string.h files if possible.
>
> Can't we do like below (i.e. keep asm implementations as-is, but
> automatically redirect to __msan_memset()) ? If yes, we could move all
> __msan_*() redirection from per-arch asm/string.h files to the common
> linux/string.h file?
>
> diff --git a/include/linux/string.h b/include/linux/string.h
> index c062c581a98b..403813b04e00 100644
> --- a/include/linux/string.h
> +++ b/include/linux/string.h
> @@ -360,4 +360,15 @@ static __always_inline size_t str_has_prefix(const char *str, const char *prefix
>         return strncmp(str, prefix, len) == 0 ? len : 0;
>  }
>
> +#if defined(__SANITIZE_MEMORY__) && defined(__NO_FORTIFY)
> +#undef memset
> +#define memset(dest, src, count) __msan_memset((dest), (src), (count))
> +#undef memset16
> +#define memset16(dest, src, count) __msan_memset((dest), (src), (count) << 1)
> +#undef memset32
> +#define memset32(dest, src, count) __msan_memset((dest), (src), (count) << 2)
> +#undef memset64
> +#define memset64(dest, src, count) __msan_memset((dest), (src), (count) << 3)
> +#endif

The problem with this approach is that it can only work for
memset/memcpy/memmove, whereas any function that is implemented in
lib/string.c may require undefining the respective __HAVE_ARCH_FNAME
so that KMSAN can instrument it.
