Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 812991B661C
	for <lists+dri-devel@lfdr.de>; Thu, 23 Apr 2020 23:23:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B3F56E9D5;
	Thu, 23 Apr 2020 21:23:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34BDB6E9D5
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 21:23:44 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id x26so3505284pgc.10
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 14:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XUMoGhY5L7Ce12qPN/+ZvR9RdaPKROuCE+nbwYYQZjo=;
 b=s0/OP9DDA3gkPf7NIb24mAh7l/E0qodqA1SOp9ziVmNnIO9fT1oyN0LqMv9o8L6cen
 aeolu96fv+P5eTrlCkNWKxCnSM5ynJO+jOCCnD876QvT1ehFUguZKa+fBN6STq19O97O
 CiSJHOHTJcGiurWOmlLB1qHssbx4D74cfm9x0/fQS+rfmkru01P064qg/bnR3v4epEQh
 TCORYK94sO0/9w08wp1/9p2v3kB56BoaHNZ3XLFvV8JaQAZuRa/mzaLQxwyDc972iOBO
 WbiNhpWsdPTip3BN3vU8Tdlk8uVXTq3w4rfWnC8/sBaX1OCT5xwnSys8Ir+UFqeGjNhP
 UBdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XUMoGhY5L7Ce12qPN/+ZvR9RdaPKROuCE+nbwYYQZjo=;
 b=JgyLesHPczBrh2LNtO2SA9jwZGsHQiLsc8Dt9DXac6LlbUi1+BzaXHF9PaBTdZyGBQ
 AZjxtHi46Mv+FthcxIhH1idDfEghXGZIZ5uAyQtR9HzcI/KdF0PzQClszMeovuhpuW5D
 /6Ot82H/QUA7GAsFIf1MjwymWdx0gJa0yksx+orlpr7kzWRhbXLdqgNmhSwIF7yeM8CG
 bhBMHys7bQYb5qU+dGBzcRIRYMYL+xG7Ka7W2vqRP7n+qrh9XSGQWaDwi5KtLYQ7c8Rb
 N1KtBhttMDBhUfOa4GL1yW+mpvMjEpL0pG2FPO8d2DyD0AmKKqlwtiqCl+Ab6IkOiVSd
 Pgfg==
X-Gm-Message-State: AGi0PubX+p6h9sjBMR5/hx7gYb1bv4ZXIf1iGf7BUxN7pAQ3j9QR7p/5
 NmLjeQH8lfZsV/L8CqdICf/bRqNBG06J1NqZHWM=
X-Google-Smtp-Source: APiQypLtTkISyuDrfh11O88zSEDSw5J46od7eHcJ6QRa2ED7NGyRC8Qv79IS5r4EZ/IHXaEND1Yvqmh+MsIkorv+RlA=
X-Received: by 2002:a63:1c1:: with SMTP id 184mr6033217pgb.203.1587677023745; 
 Thu, 23 Apr 2020 14:23:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200423164251.3349-1-zhengdejin5@gmail.com>
In-Reply-To: <20200423164251.3349-1-zhengdejin5@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 24 Apr 2020 00:23:31 +0300
Message-ID: <CAHp75VdSv4AooA-hrgoQH-qs_8woFbzHJH99AKrYUrwae7xoZQ@mail.gmail.com>
Subject: Re: [PATCH v3] console: newport_con: fix an issue about leak related
 system resources
To: Dejin Zheng <zhengdejin5@gmail.com>
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
Cc: akpm@osdl.org, linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 23, 2020 at 7:42 PM Dejin Zheng <zhengdejin5@gmail.com> wrote:
>
> A call of the function do_take_over_console() can fail here.
> The corresponding system resources were not released then.
> Thus add a call of iounmap() and release_mem_region()
> together with the check of a failure predicate. and also
> add release_mem_region() on device removal.

FWIW,
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Fixes: e86bb8acc0fdc ("[PATCH] VT binding: Make newport_con support binding")
> Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
> Suggested-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
> ---
> v2 -> v3:
>         - modify commit tag CC to Cc by Andy's suggestion.
>         - modify Subject 'console: console:' to 'console: newport_con:'
>           by Bartlomiej's suggestion.
>         - add missing release_mem_region() on error and on device removal
>           by Bartlomiej's suggestion.
>         - add correct fixes commit, before this patch, add a wrong 'Fixes:
>           e84de0c6190503 ("MIPS: GIO bus support for SGI IP22/28")'
>           thanks Bartlomiej again!
>
> v1 -> v2:
>         - modify the commit comments. The commit comments have some more
>           appropriate instructions by Markus'suggestion. here is my first
>           version commit comments:
>
>           if do_take_over_console() return an error in the newport_probe(),
>           due to the io virtual address is not released, it will cause a
>           leak.
>
>  drivers/video/console/newport_con.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/video/console/newport_con.c b/drivers/video/console/newport_con.c
> index 00dddf6e08b0..2d2ee17052e8 100644
> --- a/drivers/video/console/newport_con.c
> +++ b/drivers/video/console/newport_con.c
> @@ -32,6 +32,8 @@
>  #include <linux/linux_logo.h>
>  #include <linux/font.h>
>
> +#define NEWPORT_LEN    0x10000
> +
>  #define FONT_DATA ((unsigned char *)font_vga_8x16.data)
>
>  /* borrowed from fbcon.c */
> @@ -43,6 +45,7 @@
>  static unsigned char *font_data[MAX_NR_CONSOLES];
>
>  static struct newport_regs *npregs;
> +static unsigned long newport_addr;
>
>  static int logo_active;
>  static int topscan;
> @@ -702,7 +705,6 @@ const struct consw newport_con = {
>  static int newport_probe(struct gio_device *dev,
>                          const struct gio_device_id *id)
>  {
> -       unsigned long newport_addr;
>         int err;
>
>         if (!dev->resource.start)
> @@ -712,7 +714,7 @@ static int newport_probe(struct gio_device *dev,
>                 return -EBUSY; /* we only support one Newport as console */
>
>         newport_addr = dev->resource.start + 0xF0000;
> -       if (!request_mem_region(newport_addr, 0x10000, "Newport"))
> +       if (!request_mem_region(newport_addr, NEWPORT_LEN, "Newport"))
>                 return -ENODEV;
>
>         npregs = (struct newport_regs *)/* ioremap cannot fail */
> @@ -720,6 +722,11 @@ static int newport_probe(struct gio_device *dev,
>         console_lock();
>         err = do_take_over_console(&newport_con, 0, MAX_NR_CONSOLES - 1, 1);
>         console_unlock();
> +
> +       if (err) {
> +               iounmap((void *)npregs);
> +               release_mem_region(newport_addr, NEWPORT_LEN);
> +       }
>         return err;
>  }
>
> @@ -727,6 +734,7 @@ static void newport_remove(struct gio_device *dev)
>  {
>         give_up_console(&newport_con);
>         iounmap((void *)npregs);
> +       release_mem_region(newport_addr, NEWPORT_LEN);
>  }
>
>  static struct gio_device_id newport_ids[] = {
> --
> 2.25.0
>


-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
