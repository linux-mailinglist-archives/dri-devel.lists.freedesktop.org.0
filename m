Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F13D34622A
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 16:01:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BEFF6E93C;
	Tue, 23 Mar 2021 15:01:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com
 [IPv6:2607:f8b0:4864:20::c30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EEF36E93C;
 Tue, 23 Mar 2021 15:01:05 +0000 (UTC)
Received: by mail-oo1-xc30.google.com with SMTP id
 w1-20020a4adec10000b02901bc77feac3eso5005180oou.3; 
 Tue, 23 Mar 2021 08:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MVCoKkCqJZzN9wlMxcIT977e4kipSpX9b+GAtdQCUQ4=;
 b=ssWmDwgF/PsJRaCsBF+KVdRE49iM3WN148ZUTQosDfbZ+9Aj8/5N9+zEI3W87YDkpt
 hyjP7bptfqS0vNzYScVS0UnJjxGpfSZRQlrqEhqK02F8q2Tjf5ktx8eiEBBZ75eb1zfO
 A3sMDpeU9Y5SQqTBoMDM1VoSMXeTSLmCaIHylTJtjXGaGu/T1Ayn7EZoJ06IoB72JpN4
 wBPPyuoijAsff35VAHRsM22AzRkfs41mHClT9h9XSRnwWrn21fVKQOh+oxAYKvm/ylS5
 gqSUBSJo2ujq6UhwEe8jOYQMQsh/B0Nzz/1NNaqbiBJcWSPswwWFJeMDFa13VLFwQHno
 eOVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MVCoKkCqJZzN9wlMxcIT977e4kipSpX9b+GAtdQCUQ4=;
 b=R6gkBUfR6sxzlhT1Df3FkTMxeeveMPvMquhJ5dvB98u/eeJNDzip/BHY4unDqb5C5e
 c8DAnZtTa2Z9xzFuz2GgMSsQyH5V6oTYHnhTz1/QUWIh38Puv6Xv81FX9F+0v4n6v00a
 l+BS0eemgZkyU5/4BKEK+DWuaN8Qm6DyG/8S/UQKfPZVbQG5kY0KRZvuDl8nZfznFcxR
 EW4VrL3p3c8rkLvfbQj6+hCjfvnhFEd/UROYxso4jUFBwfkONahc5uuIhh6bS+W/N7rX
 W0uMA2z/DuVPPYyYPr1QdMiHhnBeNRYdUHBw9+04xMPqsrtPTubSVuAGaGG+fTe8VOYE
 Gm6Q==
X-Gm-Message-State: AOAM531QnDRLwDRBIG+y0cBqhi6cVmpouItH87JiTe+cJ3ZrwyBgKJuQ
 GHdXkQRUNYsXQaBPRvjMZgRrW344z8V1Gux55NQ=
X-Google-Smtp-Source: ABdhPJyVXQoRcrIFx3RZdlq5mSTmgKwJUqfUm074Go5J8ggF04dlHskZzeXJgkhMr5CuuYNIRMcVpx3NsjV1sImXTFw=
X-Received: by 2002:a4a:4005:: with SMTP id n5mr4153901ooa.61.1616511664731;
 Tue, 23 Mar 2021 08:01:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210322115458.3961825-1-arnd@kernel.org>
In-Reply-To: <20210322115458.3961825-1-arnd@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 23 Mar 2021 11:00:53 -0400
Message-ID: <CADnq5_O-nxHA==3RMAZki_Wxgo5dQuJMAQq6xU1q=sze6KN0nw@mail.gmail.com>
Subject: Re: [PATCH] amdgpu: avoid incorrect %hu format string
To: Arnd Bergmann <arnd@kernel.org>
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
Cc: Nathan Chancellor <nathan@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 David Airlie <airlied@linux.ie>, Tom Rix <trix@redhat.com>,
 xinhui pan <xinhui.pan@amd.com>, Nick Desaulniers <ndesaulniers@google.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Sonny Jiang <sonny.jiang@amd.com>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Chen Li <chenli@uniontech.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Mon, Mar 22, 2021 at 7:55 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> clang points out that the %hu format string does not match the type
> of the variables here:
>
> drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:263:7: warning: format specifies type 'unsigned short' but the argument has type 'unsigned int' [-Wformat]
>                                   version_major, version_minor);
>                                   ^~~~~~~~~~~~~
> include/drm/drm_print.h:498:19: note: expanded from macro 'DRM_ERROR'
>         __drm_err(fmt, ##__VA_ARGS__)
>                   ~~~    ^~~~~~~~~~~
>
> Change it to a regular %u, the same way a previous patch did for
> another instance of the same warning.
>
> Fixes: 0b437e64e0af ("drm/amdgpu: remove h from printk format specifier")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> index e2ed4689118a..c6dbc0801604 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> @@ -259,7 +259,7 @@ int amdgpu_uvd_sw_init(struct amdgpu_device *adev)
>                 if ((adev->asic_type == CHIP_POLARIS10 ||
>                      adev->asic_type == CHIP_POLARIS11) &&
>                     (adev->uvd.fw_version < FW_1_66_16))
> -                       DRM_ERROR("POLARIS10/11 UVD firmware version %hu.%hu is too old.\n",
> +                       DRM_ERROR("POLARIS10/11 UVD firmware version %u.%u is too old.\n",
>                                   version_major, version_minor);
>         } else {
>                 unsigned int enc_major, enc_minor, dec_minor;
> --
> 2.29.2
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
