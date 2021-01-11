Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0F82F1A04
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 16:49:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D99E6E101;
	Mon, 11 Jan 2021 15:49:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B39AC6E101
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 15:49:39 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id 11so61818oty.9
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 07:49:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7pI5yzrkUcgPAt0X+Zm7RmUBKnOlY5XxpK23F917uVU=;
 b=ol4IP7LUMXzIiAjgzp+dknK0DB8U9Myfss+iZahvDjUTnL4MmkmK1iX50Ig0/INihk
 febQFMtmeeGNuWopiVnB9aS8l365yUbcTpHNtsLqxnthKZmldZCy34BITEujV9bSJ7Sj
 n12t9gEwJEttrfdc2C0aYS8glFVDfmFV6so7Srsbcye7kljx841ZBau1rELm1fVDrk4r
 LkmO82aQTd9U9ks6Pt5F4Y3JHSnPs6JrJLLYdYXRK2WVkpwf3zkRd5S6OMakzIyaol/s
 Vw8V+ZixPZnR1Xn54+vk47L3rHrjH7PeDjqY6iYTamcpS0h/KQB7GkJ39yQ/UiuRyky1
 4ugA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7pI5yzrkUcgPAt0X+Zm7RmUBKnOlY5XxpK23F917uVU=;
 b=saHqkMObOZ+1S78lbqNCCmdRpk9XhCCoV6WcWCaMk2sPJeJc/2NPbF0B0tdl+mZ1nR
 PRWdNBcnhibZ7Ehu5lLAbR06CdKdWDGgiMogy/eG5aWlrT5cs23CDj6gkxU1JFn25ORg
 XBm8KRo2oJXM1DbDdfCuG6i6PKKUDHCc5iwupvKSYXRRC7yOn4kgS2TGYSEgAFCu+S+8
 no3fhkQw+GK+Xwg0fYB5LJXKGaA3Yq3tEgd86LMcPc0g2yb2kCbwvcLCxa151aUqPE5g
 hGAFqCIp2FKItHfGH7C8gi3n5XM3qlXCcefKrSBCwaqNubnVjMK2f1jltrP4D/nUNYRN
 tVzw==
X-Gm-Message-State: AOAM531DKNF0KuDBGAz2q9VGArZLXQDl9sXTaJtZwhf7mCxbt3xF+jRh
 p0KeYZaM2EfzUCp/dTboHSg6vzY+8x56DdX7y0k=
X-Google-Smtp-Source: ABdhPJyhXOvOyU9PkVO5HADK/d5XAObeXy36+VJEEL7RbKK/ruTat47UGYKBnOur2oXJyLr8ZPDW9RRJlwXfXsqhVDI=
X-Received: by 2002:a9d:75d4:: with SMTP id c20mr11269634otl.311.1610380178989; 
 Mon, 11 Jan 2021 07:49:38 -0800 (PST)
MIME-Version: 1.0
References: <20201216024359.12995-1-laurent.pinchart+renesas@ideasonboard.com>
 <20201216024359.12995-2-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20201216024359.12995-2-laurent.pinchart+renesas@ideasonboard.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 11 Jan 2021 10:49:28 -0500
Message-ID: <CADnq5_MWJH4BN6_JMLwUBxBygov-0W=PQm50JjxtrYuR6Js2fg@mail.gmail.com>
Subject: Re: [PATCH v2 02/10] drm: uapi: amd: Use SPDX in DRM drivers uAPI
 headers
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 15, 2020 at 9:44 PM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
>
> The AMD DRM drivers uAPI headers are licensed under the MIT license,
> and carry copies of the license with slight variations. Replace them
> with SPDX headers.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Acked-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  include/uapi/drm/amdgpu_drm.h | 19 +------------------
>  include/uapi/drm/r128_drm.h   | 20 +-------------------
>  include/uapi/drm/radeon_drm.h | 20 +-------------------
>  3 files changed, 3 insertions(+), 56 deletions(-)
>
> diff --git a/include/uapi/drm/amdgpu_drm.h b/include/uapi/drm/amdgpu_drm.h
> index 7fb9c09ee93f..8ca36b088d71 100644
> --- a/include/uapi/drm/amdgpu_drm.h
> +++ b/include/uapi/drm/amdgpu_drm.h
> @@ -1,3 +1,4 @@
> +/* SPDX-License-Identifier: MIT */
>  /* amdgpu_drm.h -- Public header for the amdgpu driver -*- linux-c -*-
>   *
>   * Copyright 2000 Precision Insight, Inc., Cedar Park, Texas.
> @@ -5,24 +6,6 @@
>   * Copyright 2002 Tungsten Graphics, Inc., Cedar Park, Texas.
>   * Copyright 2014 Advanced Micro Devices, Inc.
>   *
> - * Permission is hereby granted, free of charge, to any person obtaining a
> - * copy of this software and associated documentation files (the "Software"),
> - * to deal in the Software without restriction, including without limitation
> - * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> - * and/or sell copies of the Software, and to permit persons to whom the
> - * Software is furnished to do so, subject to the following conditions:
> - *
> - * The above copyright notice and this permission notice shall be included in
> - * all copies or substantial portions of the Software.
> - *
> - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> - * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> - * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> - * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> - * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> - * OTHER DEALINGS IN THE SOFTWARE.
> - *
>   * Authors:
>   *    Kevin E. Martin <martin@valinux.com>
>   *    Gareth Hughes <gareth@valinux.com>
> diff --git a/include/uapi/drm/r128_drm.h b/include/uapi/drm/r128_drm.h
> index 690e9c62f510..c426e6a1c843 100644
> --- a/include/uapi/drm/r128_drm.h
> +++ b/include/uapi/drm/r128_drm.h
> @@ -1,3 +1,4 @@
> +/* SPDX-License-Identifier: MIT */
>  /* r128_drm.h -- Public header for the r128 driver -*- linux-c -*-
>   * Created: Wed Apr  5 19:24:19 2000 by kevin@precisioninsight.com
>   */
> @@ -6,25 +7,6 @@
>   * Copyright 2000 VA Linux Systems, Inc., Sunnyvale, California.
>   * All rights reserved.
>   *
> - * Permission is hereby granted, free of charge, to any person obtaining a
> - * copy of this software and associated documentation files (the "Software"),
> - * to deal in the Software without restriction, including without limitation
> - * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> - * and/or sell copies of the Software, and to permit persons to whom the
> - * Software is furnished to do so, subject to the following conditions:
> - *
> - * The above copyright notice and this permission notice (including the next
> - * paragraph) shall be included in all copies or substantial portions of the
> - * Software.
> - *
> - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> - * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> - * PRECISION INSIGHT AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
> - * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> - * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> - * DEALINGS IN THE SOFTWARE.
> - *
>   * Authors:
>   *    Gareth Hughes <gareth@valinux.com>
>   *    Kevin E. Martin <martin@valinux.com>
> diff --git a/include/uapi/drm/radeon_drm.h b/include/uapi/drm/radeon_drm.h
> index 490a59cc4532..b5c4ef813a9e 100644
> --- a/include/uapi/drm/radeon_drm.h
> +++ b/include/uapi/drm/radeon_drm.h
> @@ -1,3 +1,4 @@
> +/* SPDX-License-Identifier: MIT */
>  /* radeon_drm.h -- Public header for the radeon driver -*- linux-c -*-
>   *
>   * Copyright 2000 Precision Insight, Inc., Cedar Park, Texas.
> @@ -5,25 +6,6 @@
>   * Copyright 2002 Tungsten Graphics, Inc., Cedar Park, Texas.
>   * All rights reserved.
>   *
> - * Permission is hereby granted, free of charge, to any person obtaining a
> - * copy of this software and associated documentation files (the "Software"),
> - * to deal in the Software without restriction, including without limitation
> - * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> - * and/or sell copies of the Software, and to permit persons to whom the
> - * Software is furnished to do so, subject to the following conditions:
> - *
> - * The above copyright notice and this permission notice (including the next
> - * paragraph) shall be included in all copies or substantial portions of the
> - * Software.
> - *
> - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> - * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> - * PRECISION INSIGHT AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
> - * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> - * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> - * DEALINGS IN THE SOFTWARE.
> - *
>   * Authors:
>   *    Kevin E. Martin <martin@valinux.com>
>   *    Gareth Hughes <gareth@valinux.com>
> --
> Regards,
>
> Laurent Pinchart
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
