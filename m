Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8459E18AE0B
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 09:09:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCE886E9B9;
	Thu, 19 Mar 2020 08:09:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D2FE6E58E
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 21:07:48 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id z5so147916pfn.5
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 14:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UnW3oRxVQHnYvwZ2+HCKUVYxiIim+eBLvaQELpxrRqU=;
 b=qN4+WX6llXdXg7OP2ngw/tmuSenPNNwNDboXm8R0BqN7TKq6AnxLkKLG8Q99y9IZ6T
 YDfO8JIUTC9v2tBafpZVOOd0JFYHC0mDB+lxnynMKQQLixMFCn9aOM1p/8pLBMWijDoE
 rLQazFqDavwllYsf3wPN4aql2BpoZjato+DcTWKqNtpooKdE/nwFO0dcUImcroRCILJO
 aPVcdVsQK6Yfq1FM6t0YjsW0hhvgLZRy2qsN7Ze0/hX0uJaqnU3valz6jPspG792A5BE
 UiFdDU6CdJPC5k87CYj8sMC2aAKdppbSCjkh0rgWDLetIMv33zXhdzo2jCnPehDY1cV5
 BkdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UnW3oRxVQHnYvwZ2+HCKUVYxiIim+eBLvaQELpxrRqU=;
 b=atgdjNfsOxynRXCj3N3XESFdfxFkBGvCqa2zD9QHRwifZjhvMY5lrjNx85nZHMlrrl
 WRAfXu6eiIBwpQhLRa1zO58Yhg2iFSAxYPdXTuq1B0+DmM3I4Z5nIxgFRi1Q5rGC32Mf
 V9uPqwTCMC6Ea7qz3sth9Xy7NoeRLTLq3wr/cXOqqi10+wcKfhxHXfmofzAg1/TDwOfE
 jcsKs1jbFKnUBBbTIoQk1XJtFEBo4eH5whtxoridi1zRkO3ywCVi7omkVr7+ThMHc5M5
 gDULnfiIhcv84xZrkTeSZVNNOPXtBb2NFdTxyTDrV4bkwMUccYVipJxRTVN8HWplutvr
 5qYw==
X-Gm-Message-State: ANhLgQ3oKrsTq/RMtJXW/ouoXXQs9DU4jpVnZ7LSaBty9bbE2D9F8poA
 X6rd638fiCFMDm6V1jxjSOBEehAjdul/JJ8GGoZFfQ==
X-Google-Smtp-Source: ADFU+vtrCbWLsD9Kl2sgpRCLWJgG9WETEekWUwb95aIHCLvQp5JpBJCHYMAZGw01/Hcy77aG8jAmyFceFlIcLkd5Les=
X-Received: by 2002:aa7:8b54:: with SMTP id i20mr215129pfd.39.1584565667463;
 Wed, 18 Mar 2020 14:07:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200318002500.52471-1-natechancellor@gmail.com>
 <20200318210408.4113-1-natechancellor@gmail.com>
In-Reply-To: <20200318210408.4113-1-natechancellor@gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 18 Mar 2020 14:07:34 -0700
Message-ID: <CAKwvOdmjzemFW9jF-CW1RhLJJbMvFO_NrPUeyi=rdLNVZURsfw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/amdgpu: Remove unnecessary variable shadow in
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
 Alex Deucher <alexander.deucher@amd.com>, Joe Perches <joe@perches.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 18, 2020 at 2:05 PM Nathan Chancellor
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
> shadow is only assigned in one condition and used as the condition for
> another if statement; combine the two if statements and remove shadow
> to make the code cleaner and resolve this warning.
>
> Fixes: 2e0cc4d48b91 ("drm/amdgpu: revise RLCG access path")
> Link: https://github.com/ClangBuiltLinux/linux/issues/936
> Suggested-by: Joe Perches <joe@perches.com>
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> ---
>
> v1 -> v2:
>
> * Remove shadow altogether, as suggested by Joe Perches.
> * Add Nick's Reviewed-by, as I assume it still stands.

yep, thanks

>
>  drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> index 7bc2486167e7..496b9edca3c3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> @@ -735,7 +735,6 @@ void gfx_v9_0_rlcg_wreg(struct amdgpu_device *adev, u32 offset, u32 v)
>         static void *spare_int;
>         static uint32_t grbm_cntl;
>         static uint32_t grbm_idx;
> -       bool shadow;
>
>         scratch_reg0 = adev->rmmio + (adev->reg_offset[GC_HWIP][0][mmSCRATCH_REG0_BASE_IDX] + mmSCRATCH_REG0)*4;
>         scratch_reg1 = adev->rmmio + (adev->reg_offset[GC_HWIP][0][mmSCRATCH_REG1_BASE_IDX] + mmSCRATCH_REG1)*4;
> @@ -751,10 +750,7 @@ void gfx_v9_0_rlcg_wreg(struct amdgpu_device *adev, u32 offset, u32 v)
>                 return;
>         }
>
> -       if (offset == grbm_cntl || offset == grbm_idx)
> -               shadow = true;
> -
> -       if (shadow) {
> +       if (offset == grbm_cntl || offset == grbm_idx) {
>                 if (offset  == grbm_cntl)
>                         writel(v, scratch_reg2);
>                 else if (offset == grbm_idx)
> --
> 2.26.0.rc1
>


-- 
Thanks,
~Nick Desaulniers
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
