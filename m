Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 920451B1B0B
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 03:05:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 956D86E867;
	Tue, 21 Apr 2020 01:05:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B80276E867
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 01:05:01 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id s9so9629845eju.1
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 18:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=t8z5VWgZjAeVfvVL0BHA/W6t+TdOdX0ymrvMNRwoeHU=;
 b=fnBot7Fca5TUmQ+L/rzFjjgDHgWyUpL6VYXI3UIDIxDcBP3XiNLfj1Nx9+mgYro9E8
 nOzgZqN3ff21PyjfYlwWFvZ/SwF90ECV1p10n/SHiVSwYLkIqkgl3cnWutvLcN0DIVvA
 TO3s9vVb1oQnnCvYdRxldq2yl2Y5BucmZzJpg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t8z5VWgZjAeVfvVL0BHA/W6t+TdOdX0ymrvMNRwoeHU=;
 b=BW62vhhdf+KbMmUxieAuZE6b4KAAFTGrKlxpKKv3Xu0PX9pVc5+/Tpmx9dr50K0+BN
 DJ11i8bizo2AMe8YVMp8hNoenmZuqDJ9QmvDAEJ5mWrMbBzq52qhoQra1BHkLT46McJR
 rM9fzKvAREOiHhDaRFHxOEaHYZPW9IdmwZToqN93CBRUXeLupNkrRM5/p8bKIfEyVOaW
 ny349M0wENzLK7DR5izORPj71BJ3/ipZTAfskeiEM5bSIVN1XySpReMF9WL63UsDAKMF
 ZxiF3fvIOQW0zDs9KkrEs6nvS9bm5Ii8EZjDCLtmBXor6fOo7/7V8tGJaZkvAYL2JE0O
 oOEQ==
X-Gm-Message-State: AGi0PuaUzIHIlxr77CWHqXmBQbLtiOoUyuCpJAtqmX3NavykeRqDShcu
 ziviMVeIe9alv3Yh+O1oYVbaPPasHi8fuQSbP0E=
X-Google-Smtp-Source: APiQypJ9RQ8Y7J3lsg/SXPX3NDFzgPc/25FyFFqsjHr5dq96MspGxBWOZgQtwUEIsHMU5TVbe4X9G0cCfOVIHxGNmF0=
X-Received: by 2002:a17:907:2155:: with SMTP id
 rk21mr19400529ejb.163.1587431100366; 
 Mon, 20 Apr 2020 18:05:00 -0700 (PDT)
MIME-Version: 1.0
References: <a5945463f86c984151962a475a3ee56a2893e85d.1587407777.git.christophe.leroy@c-s.fr>
 <bb0a6081f7b95ee64ca20f92483e5b9661cbacb2.1587407777.git.christophe.leroy@c-s.fr>
In-Reply-To: <bb0a6081f7b95ee64ca20f92483e5b9661cbacb2.1587407777.git.christophe.leroy@c-s.fr>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 21 Apr 2020 01:04:48 +0000
Message-ID: <CACPK8Xf+h378ddF_YakTT++gv_Zx-raBqg54VkKPS3=qe6193Q@mail.gmail.com>
Subject: Re: [PATCH 5/5] powerpc: Remove _ALIGN_UP(),
 _ALIGN_DOWN() and _ALIGN()
To: Christophe Leroy <christophe.leroy@c-s.fr>
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
Cc: linux-fbdev@vger.kernel.org, kvm@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Paul Mackerras <paulus@samba.org>,
 Michael Ellerman <mpe@ellerman.id.au>, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 20 Apr 2020 at 18:39, Christophe Leroy <christophe.leroy@c-s.fr> wrote:
>
> These three powerpc macros have been replaced by
> equivalent generic macros and are not used anymore.
>
> Remove them.
>
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

Reviewed-By: Joel Stanley <joel@jms.id.au>

riscv has a copy of these too that could probably be removed:

arch/riscv/include/asm/page.h:#define _ALIGN_UP(addr, size)
(((addr)+((size)-1))&(~((size)-1)))
arch/riscv/include/asm/page.h:#define _ALIGN(addr, size)
_ALIGN_UP(addr, size)



> ---
>  arch/powerpc/include/asm/page.h | 7 -------
>  1 file changed, 7 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/page.h b/arch/powerpc/include/asm/page.h
> index 3ee8df0f66e0..a63fe6f3a0ff 100644
> --- a/arch/powerpc/include/asm/page.h
> +++ b/arch/powerpc/include/asm/page.h
> @@ -249,13 +249,6 @@ static inline bool pfn_valid(unsigned long pfn)
>  #include <asm/page_32.h>
>  #endif
>
> -/* align addr on a size boundary - adjust address up/down if needed */
> -#define _ALIGN_UP(addr, size)   __ALIGN_KERNEL(addr, size)
> -#define _ALIGN_DOWN(addr, size)        ((addr)&(~((typeof(addr))(size)-1)))
> -
> -/* align addr on a size boundary - adjust address up if needed */
> -#define _ALIGN(addr,size)     _ALIGN_UP(addr,size)
> -
>  /*
>   * Don't compare things with KERNELBASE or PAGE_OFFSET to test for
>   * "kernelness", use is_kernel_addr() - it should do what you want.
> --
> 2.25.0
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
