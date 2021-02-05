Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D163114C7
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 23:16:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A47FB6F510;
	Fri,  5 Feb 2021 22:16:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC0746F510
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 22:16:44 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id jj19so14530606ejc.4
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Feb 2021 14:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lagfreegames.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3kp/ssO08V/FY7QsvN3DMxWquJo+13gFrtQMZOim6zA=;
 b=M4ijjVScAGYeDFtPLSQUcmiTwAtxyv89sLB66yyfVTXwnVvVvUN00ubY/V6m51Z2PP
 S8M+azcFDCJh/C5JGzAbm2OrjM1pQ7xIhh3Y8mWIGHJc9AYyo8pA2Bv4WkSqFOerjiV5
 3/eksl9cGfxUw6zkwj0UvP9BDK5eVvSSe65CdGl6akl1++UMcE1E3Dy7I6aVlln2E4Qk
 TeNwcxatPbGAn9EnVhXk9fOU3245XVPVS6MfhOfOeNVJjlB5zKZOWNKdpzjsKMcBfsfu
 StGuVFG3s5KIYJ15I0Tz94XbXQ1GqdrynZ96DSiSmigQQuBWXGMmiOkN2AUTu2jCC7di
 ZhOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3kp/ssO08V/FY7QsvN3DMxWquJo+13gFrtQMZOim6zA=;
 b=bNweO7B3+qoX4K7Hu6uQYsU37/TJAO/hy0vwL+/I8bz+Zp14Jbl7LPbaerLSNGAvok
 Zx+GUZiJ2Io3waAMFDgtxa6ChlELF94MWF20fIowqk8q6IEjxL2mMIkUVdYd8clGPJo4
 91k8FWhjvABA+J1woxS5fRhYPZ4udlJyVwJhncL7u7M8NJTvPX+MhOowikMYiZXJVt7N
 UG204vHyEKipI3201BDVDPwTa0KEEpYC8WGrbEwDGJy4dOojhWWlhLzh8rfcfdT/wOwX
 z8exI8qzR5JL94n+3zjjvnMjqJqbNhi93XSoC63S5C4pi1HZMl9CcghLfjJRaNwicNKU
 aOGA==
X-Gm-Message-State: AOAM533Xe46jOqvjQynlqE6xDcCxBo5NR5ioUUYZ7Lb0iSMuhDH1q4nr
 V+YJXNesuohKuB7ib1IdlSSvIT8lQrC6rjYcchS9OJTZPeL25w==
X-Google-Smtp-Source: ABdhPJxoOzs3YFeA6eMoBrBNsWHVx+Jsnw6yNRUYN7CTVrXtDf4kIAhtdord4ETNVbfA8bjafLpA5ba3q8qztx3ll3o=
X-Received: by 2002:a17:906:3101:: with SMTP id
 1mr6149715ejx.115.1612563403510; 
 Fri, 05 Feb 2021 14:16:43 -0800 (PST)
MIME-Version: 1.0
References: <1612493666-757-1-git-send-email-jpark37@lagfreegames.com>
In-Reply-To: <1612493666-757-1-git-send-email-jpark37@lagfreegames.com>
From: James Park <james.park@lagfreegames.com>
Date: Fri, 5 Feb 2021 14:16:08 -0800
Message-ID: <CABjik9etLLp=ZzEZS3hjRBVFwK-vuJoTTLT3rK9iijSjam3utQ@mail.gmail.com>
Subject: Re: [PATCH] drm: DRM_FOURCC_STANDALONE macro support
To: James Park <jpark37@lagfreegames.com>, Simon Ser <contact@emersion.fr>, 
 Emil Velikov <emil.l.velikov@gmail.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 4, 2021 at 6:55 PM James Park <jpark37@lagfreegames.com> wrote:
>
> Use DRM_FOURCC_STANDALONE to include drm_fourcc.h without drm.h.
>
> Copy type definitions from drm.h to drm_fourcc.h, and wrap with
> DRM_BASIC_TYPED_DEFINED to avoid redundant inclusion.
>
> This will allow code to avoid unnecessary definitions.
>
> Signed-off-by: James Park <jpark37@lagfreegames.com>
> ---
>  include/uapi/drm/drm.h        | 35 ++++++++++++++++++++++++++++-------
>  include/uapi/drm/drm_fourcc.h | 35 +++++++++++++++++++++++++++++++++++
>  2 files changed, 63 insertions(+), 7 deletions(-)
>
> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> index 808b48a..5640062 100644
> --- a/include/uapi/drm/drm.h
> +++ b/include/uapi/drm/drm.h
> @@ -36,23 +36,25 @@
>  #ifndef _DRM_H_
>  #define _DRM_H_
>
> +/**
> + * DRM_BASIC_TYPES_DEFINED section exists in both drm.h and drm_fourcc.h files.
> + * Do not modify the section in one file without updating the other!
> + */
> +
> +#ifndef DRM_BASIC_TYPES_DEFINED
> +#define DRM_BASIC_TYPES_DEFINED
> +
>  #if defined(__KERNEL__)
>
>  #include <linux/types.h>
> -#include <asm/ioctl.h>
> -typedef unsigned int drm_handle_t;
>
>  #elif defined(__linux__)
>
>  #include <linux/types.h>
> -#include <asm/ioctl.h>
> -typedef unsigned int drm_handle_t;
>
> -#else /* One of the BSDs */
> +#else /* Not Linux */
>
>  #include <stdint.h>
> -#include <sys/ioccom.h>
> -#include <sys/types.h>
>  typedef int8_t   __s8;
>  typedef uint8_t  __u8;
>  typedef int16_t  __s16;
> @@ -62,6 +64,25 @@ typedef uint32_t __u32;
>  typedef int64_t  __s64;
>  typedef uint64_t __u64;
>  typedef size_t   __kernel_size_t;
> +
> +#endif
> +
> +#endif /* DRM_BASIC_TYPES_DEFINED */
> +
> +#if defined(__KERNEL__)
> +
> +#include <asm/ioctl.h>
> +typedef unsigned int drm_handle_t;
> +
> +#elif defined(__linux__)
> +
> +#include <asm/ioctl.h>
> +typedef unsigned int drm_handle_t;
> +
> +#else /* One of the BSDs */
> +
> +#include <sys/ioccom.h>
> +#include <sys/types.h>
>  typedef unsigned long drm_handle_t;
>
>  #endif
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index 723c8e2..5e5f4cf 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -24,7 +24,42 @@
>  #ifndef DRM_FOURCC_H
>  #define DRM_FOURCC_H
>
> +/**
> + * DRM_BASIC_TYPES_DEFINED section exists in both drm.h and drm_fourcc.h files.
> + * Do not modify the section in one file without updating the other!
> + */
> +
> +#ifndef DRM_BASIC_TYPES_DEFINED
> +#define DRM_BASIC_TYPES_DEFINED
> +
> +#if defined(__KERNEL__)
> +
> +#include <linux/types.h>
> +
> +#elif defined(__linux__)
> +
> +#include <linux/types.h>
> +
> +#else /* Not Linux */
> +
> +#include <stdint.h>
> +typedef int8_t   __s8;
> +typedef uint8_t  __u8;
> +typedef int16_t  __s16;
> +typedef uint16_t __u16;
> +typedef int32_t  __s32;
> +typedef uint32_t __u32;
> +typedef int64_t  __s64;
> +typedef uint64_t __u64;
> +typedef size_t   __kernel_size_t;
> +
> +#endif
> +
> +#endif /* DRM_BASIC_TYPES_DEFINED */
> +
> +#ifndef DRM_FOURCC_STANDALONE
>  #include "drm.h"
> +#endif
>
>  #if defined(__cplusplus)
>  extern "C" {
> --
> 2.7.4
>

Forgot to include Emil and Simon.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
