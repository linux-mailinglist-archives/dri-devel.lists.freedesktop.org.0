Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0BA18AE03
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 09:09:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FDBF6E9AA;
	Thu, 19 Mar 2020 08:09:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 551EA6E962
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 20:44:08 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id l184so110118pfl.7
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 13:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=suYHs9658zHP4xficEGq5WrBjqIzHfAOzaIFRECzM5Y=;
 b=n/X1upys3h4rJNYvIw5j6AOUliQjvpmhy+m+9DZtWbYDpENrMWU9gX5OfOPjZCHqCq
 3N7EyTuBY29aXC98swHoyCoDuXnLG1HE/1H5jXDW/qG1EW1lh3uw7U7CfUWRbfjqOkcL
 hSX9Of+C0ataFtlnWTZFimXaINj+GxUPy1TZ1osPcSFYCZ/kscC0Ip/qBbdiSN6vpz8B
 PpgAdT3mzS/u+Sv9CKxeQP2Ut+/oAyg0LMSWhIbEHFuVBW/XOVLB2LgC/R2qCD140Jcm
 MxM0L8LtdKgiUYTUC3GZ3Oceg48BDmYiFzjjt+SlBqWpTOO5mU17+RKzxJjJStQpV7vw
 OnTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=suYHs9658zHP4xficEGq5WrBjqIzHfAOzaIFRECzM5Y=;
 b=ITh/TheuPFuNxv4y/aJXya3GQh0Ma0xTQiEnrrUPuD8g5PCEScdClWlTDtoG+GtUYG
 DO0SYTAFOf9ijIwd+RrP/73E++FAM5sNwZJGRG8GI3Po7HBZFjpj9oA6DM44AoDEKXkY
 LCryZpO/l+r1j9SxYD+rGm3sH0LVEhzl8DtB3N5Zm4Zw+6xBkCsQnZcY4RuaCUsof6m3
 GCjV+BTSCLpr+rjIjlRtg2aCXHFBbhTVChmuD5wO1NnGEyG3xFrXzVt6g2hen1WhrwS+
 AFozV/OrSdfshG0B8JGzpl6NCpESqMst5wrcyD3uk6AeKd4AsrsZgztwkBWpBZ2YDYqj
 VlJQ==
X-Gm-Message-State: ANhLgQ2kxUV4Aw1IsYzCEHF706a139Rb+bgUfYXi3tcwh/F4cGINI38o
 cqRGdt0UqLL1frv/dSwYK4Ora57ZpE2puMfDXAq0GA==
X-Google-Smtp-Source: ADFU+vvuYGfe5Sd8RCUOsHGVZHh0QkYvusq8LOKEvmO8g5PG8CN5UlQKq17NQMJwPUgG4KkltVfEVBtrogvoQJfagUE=
X-Received: by 2002:aa7:8b54:: with SMTP id i20mr116252pfd.39.1584564247262;
 Wed, 18 Mar 2020 13:44:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200318002500.52471-1-natechancellor@gmail.com>
 <3a997f4ee640e607a171a19668f5f5484062116c.camel@perches.com>
In-Reply-To: <3a997f4ee640e607a171a19668f5f5484062116c.camel@perches.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 18 Mar 2020 13:43:54 -0700
Message-ID: <CAKwvOd=AA8NrqmOR=E7+e6dHEVo3DZwfSuK72DGzHG+X56pB7A@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Initialize shadow to false in
 gfx_v9_0_rlcg_wreg
To: Joe Perches <joe@perches.com>
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
 Nathan Chancellor <natechancellor@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 18, 2020 at 1:28 PM Joe Perches <joe@perches.com> wrote:
>
> On Tue, 2020-03-17 at 17:25 -0700, Nathan Chancellor wrote:
> > clang warns:
> >
> > drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:754:6: warning: variable 'shadow'
> > is used uninitialized whenever 'if' condition is
> > false [-Wsometimes-uninitialized]
> >         if (offset == grbm_cntl || offset == grbm_idx)
> >             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:757:6: note: uninitialized use
> > occurs here
> >         if (shadow) {
> >             ^~~~~~
>
> Wouldn't it be better to get rid of the shadow variable completely?

Yes, much better indeed. Seems it only has one use.

> ---
>  drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> index 7bc248..496b9e 100644
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
>
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/3a997f4ee640e607a171a19668f5f5484062116c.camel%40perches.com.



-- 
Thanks,
~Nick Desaulniers
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
