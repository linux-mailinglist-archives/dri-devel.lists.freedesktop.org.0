Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC834C59CC
	for <lists+dri-devel@lfdr.de>; Sun, 27 Feb 2022 07:17:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDABC10E5A4;
	Sun, 27 Feb 2022 06:17:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57CCD10E5A4
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Feb 2022 06:17:28 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id 27so8629854pgk.10
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Feb 2022 22:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ow8n9bnT7hSkaP9jr1cS5lcPgbno/KHHbNMAFcjqosI=;
 b=pLWATeuoF6Rho2C/qM1ObggjqCTCKSIYrmdUZXDGKsszkUsAcjDi8VTX5dBAAheyrc
 2eLojOdeb2kcq1mma3uEI8OUkGk26ttPxm8x3MSBLv08iAAlkpKYBpjC/08jQI8CI6g7
 mNTlEeepAa7CPOnQwdggaSjivRcEMvtwVnkI0rwbjzZqdq3Yk+OshYxU4s/sij/K1dcS
 CYYILFIBcnoy7ZXwgSbgGYPV5U2DYKSXKjk/BuAA0Gdr7+/snYtbGwJMnqjfG25q1NiG
 YE0EA8C6V7uyinJ7fGojLVAL7sWjiuk5pgwHshd1MK98BogSKQHXMomLJq7bf/rjT7dB
 HxPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ow8n9bnT7hSkaP9jr1cS5lcPgbno/KHHbNMAFcjqosI=;
 b=NkjuViJcm+MIim9TijXbg1SH6cXPZWWz1t5DsinAZdcuzgZRR8PlizlRK3dlwcyyLO
 33FL5y2x5wLP9/azLUO6t9vKo8Mqiy3HYlVs6nQOqqSjDsyeeVgKQnSWI0cdtkJeDgTe
 2Zxd45+qWdFHwiefqES827vtcP6pJ/hNc+cgbK2suLPKLeWnV5PXhKttDSatvfnuDp4T
 RiAGctEw192oMXn7Pj7hPEP47ffaQnq92tpmcakVoLuBiXtkkQm+Uge8mz2a3kutLcBt
 P4nXPS6sjCcZ/UbZ/Y+zLhuz+S8Dp5NAGfmtbaTeVEYQlmTJOzvRDPIGbMUCZ2J5b4DD
 ctQQ==
X-Gm-Message-State: AOAM533BkEttJtYIHoonV5XVJXch7SsSWrGf9GFRsoxEUJ2XX8PzItfg
 N7OBLWvhqmR6zgwbLHVChdPanxYVV3+yFDoYrw==
X-Google-Smtp-Source: ABdhPJy1AveXJn8qgloASy8DlTcYT+KqBr50ybb+b17ayKSx1dDtKKCqD4uBZzJB1bfxpLxka+6SDhFJU63Wx843Tfo=
X-Received: by 2002:a05:6a00:1991:b0:4e1:a7dd:96e5 with SMTP id
 d17-20020a056a00199100b004e1a7dd96e5mr15890456pfl.2.1645942647724; Sat, 26
 Feb 2022 22:17:27 -0800 (PST)
MIME-Version: 1.0
References: <CAMhUBjmetJqbERvQ8513b-wHuV68hqLTuUVWiORyJyXP26gO7Q@mail.gmail.com>
 <YhpBPQuqPNmqasxE@ls3530>
In-Reply-To: <YhpBPQuqPNmqasxE@ls3530>
From: Zheyu Ma <zheyuma97@gmail.com>
Date: Sun, 27 Feb 2022 14:17:16 +0800
Message-ID: <CAMhUBjn_cGF_Htap+iJri991tXPQiqwn_EPY6XuPu+bH07m=eg@mail.gmail.com>
Subject: Re: [BUG] fbdev: sm712fb: Page fault in smtcfb_read
To: Helge Deller <deller@gmx.de>
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-fbdev@vger.kernel.org, sudipm.mukherjee@gmail.com,
 dri-devel@lists.freedesktop.org, teddy.wang@siliconmotion.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Feb 26, 2022 at 11:03 PM Helge Deller <deller@gmx.de> wrote:
>
> * Zheyu Ma <zheyuma97@gmail.com>:
> > I found a minor in the smtcfb_read() function of the driver sm712fb.
> >
> > This read function can not handle the case that the size of the
> > buffer is 3 and does not check for it, which may cause a page fault.
> >
> > The following log reveals it:
> >
> > [ 2432.614490] BUG: unable to handle page fault for address: ffffc90001ffffff
> > [ 2432.618474] RIP: 0010:smtcfb_read+0x230/0x3e0
> > [ 2432.626551] Call Trace:
> > [ 2432.626770]  <TASK>
> > [ 2432.626950]  vfs_read+0x198/0xa00
> > [ 2432.627225]  ? do_sys_openat2+0x27d/0x350
> > [ 2432.627552]  ? __fget_light+0x54/0x340
> > [ 2432.627871]  ksys_read+0xce/0x190
> > [ 2432.628143]  do_syscall_64+0x43/0x90
>
> Could you try the attached patch ?

Good, the patch works for me, thanks.

Tested-by: Zheyu Ma <zheyuma97@gmail.com>
>
>
> diff --git a/drivers/video/fbdev/sm712fb.c b/drivers/video/fbdev/sm712fb.c
> index 0dbc6bf8268a..ab45212ccf66 100644
> --- a/drivers/video/fbdev/sm712fb.c
> +++ b/drivers/video/fbdev/sm712fb.c
> @@ -1047,7 +1047,7 @@ static ssize_t smtcfb_read(struct fb_info *info, char __user *buf,
>         if (count + p > total_size)
>                 count = total_size - p;
>
> -       buffer = kmalloc((count > PAGE_SIZE) ? PAGE_SIZE : count, GFP_KERNEL);
> +       buffer = kmalloc(PAGE_SIZE, GFP_KERNEL);
>         if (!buffer)
>                 return -ENOMEM;
>
> @@ -1059,25 +1059,11 @@ static ssize_t smtcfb_read(struct fb_info *info, char __user *buf,
>         while (count) {
>                 c = (count > PAGE_SIZE) ? PAGE_SIZE : count;
>                 dst = buffer;
> -               for (i = c >> 2; i--;) {
> -                       *dst = fb_readl(src++);
> -                       *dst = big_swap(*dst);
> +               for (i = (c + 3) >> 2; i--;) {
> +                       u32 val = fb_readl(src++);
> +                       *dst = big_swap(val);
>                         dst++;
>                 }
> -               if (c & 3) {
> -                       u8 *dst8 = (u8 *)dst;
> -                       u8 __iomem *src8 = (u8 __iomem *)src;
> -
> -                       for (i = c & 3; i--;) {
> -                               if (i & 1) {
> -                                       *dst8++ = fb_readb(++src8);
> -                               } else {
> -                                       *dst8++ = fb_readb(--src8);
> -                                       src8 += 2;
> -                               }
> -                       }
> -                       src = (u32 __iomem *)src8;
> -               }
>
>                 if (copy_to_user(buf, buffer, c)) {
>                         err = -EFAULT;

Regards,
Zheyu Ma
