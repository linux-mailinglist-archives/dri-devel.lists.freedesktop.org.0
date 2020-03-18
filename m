Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0770A18ADF9
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 09:09:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C52A6E286;
	Thu, 19 Mar 2020 08:08:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E8EA89BF0
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 20:11:14 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id u68so80722pfb.2
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 13:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uyesW/I7eVgVyicQueL0CdgpIWranWUqdWTYkhPayEw=;
 b=buSa8RvhjkGTpbBdwHw59o+jZbhgGKbLiBhfH2emwRGZx+wImu/ULynC+CYcg4rbnN
 7u/sZ5xGCoq+T5kYpewP2vLW85uO1fq4YujHF493zxwEabsXuLVHqEVBgMO0yperyLOQ
 AtTa0SNg0Vpxa9cnuaCRmnDgdd6OUlcFvuwrqY2yQKESkO6+71cCLK0W7op0OVEM+m71
 bmHlAQZyTzrYwa9K+oAbP/9IT2f1hX4tKoj3P+qQzuyNSpl9vHmuXGkCkfMgsGFs75PI
 mWxN19hhTjPvb5ClZNqP2xO8sPSOSOpXKlWhnpcOAQxMrQLi1lorTBOjOJgOlh1AkNit
 ImZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uyesW/I7eVgVyicQueL0CdgpIWranWUqdWTYkhPayEw=;
 b=Q3kn9/6X4kfuJeVdkPVa58wwtQG33sZrWGhIyQpXv2GsyZ7efT79cKdcdRM7rvc1JA
 0CVKYExR06GlDo8xgL+/se8f9FvFnMavZbvtE7ouE12XTauxSni8mGcXvpX165wuthai
 otwATd2UDu/tOZ3X6nE9YciEURnL368bQnuFpUHutDHg/KPkDRDYiLyLGIlqqts6yofn
 VE+bpn/r+Pn7xf1RBpYKDGPHjjDIuYvBCRETUlA4YGqlOqLeLjeyIMIO5bAhT8fAeut7
 MJ/VIm13V1nsUBUDlfW4p/sWOXN/VVsDE+ZtO2iz0/qW80iJiWNQgkKxjTqpHXGi4bvp
 K5OA==
X-Gm-Message-State: ANhLgQ31DBZeNSPXJ2Kebn/XtXLs6lo1SM05eFJsDBN86CW3mZYF/AXg
 qnIDxPmCUvW0NEk/ZGmjcjt//xMCI55uc85D6CI8XQ==
X-Google-Smtp-Source: ADFU+vsvmlakcRCCZHYwnyZMgY3Y37TRHQ0ECfXdqwlx7G77wz0frDIB6p4cU0iSRnIO6PsnQPSCLbvLu8yOZe6YOM8=
X-Received: by 2002:a63:4d6:: with SMTP id 205mr6229525pge.10.1584562273205;
 Wed, 18 Mar 2020 13:11:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200318002500.52471-1-natechancellor@gmail.com>
In-Reply-To: <20200318002500.52471-1-natechancellor@gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 18 Mar 2020 13:11:00 -0700
Message-ID: <CAKwvOdkzdBYgixrSKKfo7=god4Q0GaMORmFWUfrJ27JiGhBx2Q@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Initialize shadow to false in
 gfx_v9_0_rlcg_wreg
To: Nathan Chancellor <natechancellor@gmail.com>
X-Mailman-Approved-At: Thu, 19 Mar 2020 08:08:58 +0000
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 17, 2020 at 5:25 PM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> clang warns:
>
> drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:754:6: warning: variable 'shadow'
> is used uninitialized whenever 'if' condition is
> false [-Wsometimes-uninitialized]
>         if (offset == grbm_cntl || offset == grbm_idx)
>             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:757:6: note: uninitialized use
> occurs here
>         if (shadow) {
>             ^~~~~~
> drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:754:2: note: remove the 'if' if
> its condition is always true
>         if (offset == grbm_cntl || offset == grbm_idx)
>         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:738:13: note: initialize the
> variable 'shadow' to silence this warning
>         bool shadow;
>                    ^
>                     = 0
> 1 warning generated.
>
> It is not wrong so initialize shadow to false to ensure shadow is always
> used initialized.

Yep, thanks for the patch.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
> Fixes: 2e0cc4d48b91 ("drm/amdgpu: revise RLCG access path")
> Link: https://github.com/ClangBuiltLinux/linux/issues/936
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> index 7bc2486167e7..affbff76758c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> @@ -735,7 +735,7 @@ void gfx_v9_0_rlcg_wreg(struct amdgpu_device *adev, u32 offset, u32 v)
>         static void *spare_int;
>         static uint32_t grbm_cntl;
>         static uint32_t grbm_idx;
> -       bool shadow;
> +       bool shadow = false;
>
>         scratch_reg0 = adev->rmmio + (adev->reg_offset[GC_HWIP][0][mmSCRATCH_REG0_BASE_IDX] + mmSCRATCH_REG0)*4;
>         scratch_reg1 = adev->rmmio + (adev->reg_offset[GC_HWIP][0][mmSCRATCH_REG1_BASE_IDX] + mmSCRATCH_REG1)*4;
> --
> 2.26.0.rc1
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20200318002500.52471-1-natechancellor%40gmail.com.



-- 
Thanks,
~Nick Desaulniers
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
