Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E63094C4A94
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 17:23:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF46210E380;
	Fri, 25 Feb 2022 16:23:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B834010E380;
 Fri, 25 Feb 2022 16:23:40 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 p12-20020a05683019cc00b005af1442c9e9so3928706otp.13; 
 Fri, 25 Feb 2022 08:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wR/eoNNXBj1/My2CpHa5GPCtjCjqHRpXOZvwkOgYW9w=;
 b=EcyjzPZs9kbSzl+d2LBUySEw7Ulmassdt6Hh8IuhHTLAjFK8LAnbRNuhMjYtBURuh7
 U7PUdfm+Nkp0qFhqzg1Ssk5rv1jeROeHDT3B/Is+J9tVvn/HlyFYUEwmU1gySUuSDRnW
 KhjooY1BXTbxKsc2U7OKjXGvpb3oTkPdCkJ8JwhN1CJCTCn3eDDP6P7tBmPpKPaUKdxz
 LWkFNyBxpuCT6w5i7QQxQBxuD74obmTKjekinxfe5gHfP5xsvdu3ncX302OFGRB7X9xe
 IhOwETkKItOo8RFeRy77h4kQjtFMCklL7r7EtlhMWxZuhDmlN65X33dxeZ6vmdNc6rPT
 xK5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wR/eoNNXBj1/My2CpHa5GPCtjCjqHRpXOZvwkOgYW9w=;
 b=IE3Zs4CKuZ7ARGsV3drG8TUK6g3750a1a7KJy+Qgi3vMcK0O+i1o4kgGz5et7uuoT/
 DdfzuxmPxhxsyoJDsqTu3TaPvUs3HsBb2LMgwQGkw5m3V8a+RLcjE3JXnuzvrjeEqKnV
 W9xwXwk5aJq8rfpqsJ++DxhGpvEg4Ln3ctvO5RfD1OyIuoJsu5uLgfIVNymAk1RSaqAO
 f0u5MrTVUjjHBMeqOTooThZmokde6NdzKlL8Luf1G1JPs8rtNx7Y95UGoQckONXB1mEN
 izc0BlkAPCqa8AP9wj+Rc+p1flAygfU5Llk75t3rul30kX1Q2NJXRp0OUQpI7wX0EYZo
 Dqcg==
X-Gm-Message-State: AOAM533NXuP3cp4fw8kV1C8kQuAepEHESCY3Aaf4B5SHgnIn0SrQRGJ5
 XPH0viJ5ptXfW39DdKRhEOCpHE8hTbsPeYZ3fbo=
X-Google-Smtp-Source: ABdhPJy4YvYnuTW9nQ3arrHphuxc2EfNmJj4uEoJL2y6biBbvt5LPVxOadtYIjKArwwfIlgX/RiklDzSSXL8j5CHjGs=
X-Received: by 2002:a9d:5a06:0:b0:5af:b5fd:5b72 with SMTP id
 v6-20020a9d5a06000000b005afb5fd5b72mr2906065oth.200.1645806220062; Fri, 25
 Feb 2022 08:23:40 -0800 (PST)
MIME-Version: 1.0
References: <20220224224316.149704-1-colin.i.king@gmail.com>
In-Reply-To: <20220224224316.149704-1-colin.i.king@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 25 Feb 2022 11:23:28 -0500
Message-ID: <CADnq5_Ot37zJGv8+JPNHd5OfPy94Ek2xXnNQxbCbzUPXDofwzw@mail.gmail.com>
Subject: Re: [PATCH][next] drm/amdgpu: Fix missing assignment to variable r
To: Colin Ian King <colin.i.king@gmail.com>
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
Cc: llvm@lists.linux.dev, David Airlie <airlied@linux.ie>,
 xinhui pan <Xinhui.Pan@amd.com>, kernel-janitors@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Already fixed.  Thanks for the patch.

Alex

On Thu, Feb 24, 2022 at 5:43 PM Colin Ian King <colin.i.king@gmail.com> wrote:
>
> Currently the call to function amdgpu_benchmark_move should be
> assigning the return value to variable r as this is checked in
> the next statement, however, this assignment is missing. Fix
> this by adding in the missing assignment.
>
> Addresses clang scan warning:
> drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c:168:7: warning:
> variable 'r' is uninitialized when used here [-Wuninitialized]
>
> Fixes: 9645c9c9fb15 ("drm/amdgpu: plumb error handling though amdgpu_benchmark()")
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c
> index 3136a9ad2d54..bb293a5c6fd5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c
> @@ -163,7 +163,7 @@ int amdgpu_benchmark(struct amdgpu_device *adev, int test_number)
>                          "benchmark test: %d (simple test, VRAM to VRAM)\n",
>                          test_number);
>                 /* simple test, VRAM to VRAM */
> -               amdgpu_benchmark_move(adev, 1024*1024, AMDGPU_GEM_DOMAIN_VRAM,
> +               r = amdgpu_benchmark_move(adev, 1024*1024, AMDGPU_GEM_DOMAIN_VRAM,
>                                       AMDGPU_GEM_DOMAIN_VRAM);
>                 if (r)
>                         goto done;
> --
> 2.34.1
>
