Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDCB31292D1
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2019 09:12:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4F466E5A3;
	Mon, 23 Dec 2019 08:10:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C04856EC88
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2019 18:09:54 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id w62so5617106pfw.8
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2019 10:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1NoYeCvzhEf2ThmFbvrz2tyjWvGOYahfq+FFDczVt3k=;
 b=G64k8noTQfo52NnZSStBp4byZlOS2XeDgJ4imbftROkrulALEygiIYb1pRSKCdbG1S
 8d0B7yLoYnzw/lHrZkSdQgbnutH+wIICxJliskMoYCqQJ0SZV6y7fW2FC9aY3vsXu8IH
 x0fBdXM7i8UDYPF1e+OYcSNx7D8v0wqQm3uHoOQ3swGp2LDEEZRsDK/xSJ/FSej6CDvr
 vewMxURaqh4vqbtLiC7rX/NZdaw8RaqsVUxY6T7+ll4e+fagxenkEwuCklykqXaIYCmC
 EI4m/qm6ESlDwz2EP+UT7a7d41VRkt4JiOQC8DQZcoKW7EPK67pJVWVUzoIQ7kGAHK6O
 Ok+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1NoYeCvzhEf2ThmFbvrz2tyjWvGOYahfq+FFDczVt3k=;
 b=XMjoXGzxSudla1Tx9QpjTv6hFZD/gWYk5j7nILoVbaKgGCiOkRJdYBvAq/feOhHwB/
 FnCCnmZcY8wcc7WCkKXw550t+J3hvolmQXKOfB9Ytxse4boW/h1spGwE3LsWEits8is0
 cLGJOEOolxMhkq9Ed2CFGWVlVPppWLcNmPuse2CNK/nkS6uByiHPgIt2vAZUzRvHWAQd
 WMNYFFPoXDZN0MeZO0Qx2pz68ujPiiAM0N5e3pkxveRa2B5wJKKBrOtEecJ4YUh5oCKj
 guKT0O004pOx3CGEIe8FkYNftOP0Qcs4RQTiRm5dmcXNJ5DpC+Z9/t4ikNepKOWF1xfs
 fndQ==
X-Gm-Message-State: APjAAAWvkwq/LuD7DO1RAHzHY1/qvZv+EmZ0QbbJD6KulMn1dgjrqL1Y
 6MMDe4V3CoTsUpf/ZDJxeKffFHWlqXLVImYOGt9T8g==
X-Google-Smtp-Source: APXvYqyQqxrvt9MqS1V+wSCAIwQ8mrA8vpt+5ti4yyobuNNh3cA/iDEG6Da1zNuN4ot+7zz3CDCWpMjliCcjY9zAJf0=
X-Received: by 2002:a63:590e:: with SMTP id n14mr15983487pgb.10.1576865394047; 
 Fri, 20 Dec 2019 10:09:54 -0800 (PST)
MIME-Version: 1.0
References: <20191218030025.10064-1-natechancellor@gmail.com>
In-Reply-To: <20191218030025.10064-1-natechancellor@gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 20 Dec 2019 10:09:43 -0800
Message-ID: <CAKwvOdk0hz-Eu00yRwRT6MFDmxPWdgnuYZWxGxASicCq68NivQ@mail.gmail.com>
Subject: Re: [PATCH] fbmem: Adjust indentation in fb_prepare_logo and fb_blank
To: Nathan Chancellor <natechancellor@gmail.com>
X-Mailman-Approved-At: Mon, 23 Dec 2019 08:10:46 +0000
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
Cc: clang-built-linux <clang-built-linux@googlegroups.com>,
 linux-fbdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 17, 2019 at 7:00 PM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> Clang warns:
>
> ../drivers/video/fbdev/core/fbmem.c:665:3: warning: misleading
> indentation; statement is not part of the previous 'else'
> [-Wmisleading-indentation]
>         if (fb_logo.depth > 4 && depth > 4) {
>         ^
> ../drivers/video/fbdev/core/fbmem.c:661:2: note: previous statement is
> here
>         else
>         ^
> ../drivers/video/fbdev/core/fbmem.c:1075:3: warning: misleading
> indentation; statement is not part of the previous 'if'
> [-Wmisleading-indentation]
>         return ret;
>         ^
> ../drivers/video/fbdev/core/fbmem.c:1072:2: note: previous statement is
> here
>         if (!ret)
>         ^
> 2 warnings generated.
>
> This warning occurs because there are spaces before the tabs on these
> lines. Normalize the indentation in these functions so that it is
> consistent with the Linux kernel coding style and clang no longer warns.
>
> Fixes: 1692b37c99d5 ("fbdev: Fix logo if logo depth is less than framebuffer depth")
> Link: https://github.com/ClangBuiltLinux/linux/issues/825
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  drivers/video/fbdev/core/fbmem.c | 36 ++++++++++++++++----------------
>  1 file changed, 18 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
> index 0662b61fdb50..bf63cc0e6b65 100644
> --- a/drivers/video/fbdev/core/fbmem.c
> +++ b/drivers/video/fbdev/core/fbmem.c
> @@ -662,20 +662,20 @@ int fb_prepare_logo(struct fb_info *info, int rotate)
>                 fb_logo.depth = 1;
>
>
> -       if (fb_logo.depth > 4 && depth > 4) {
> -               switch (info->fix.visual) {
> -               case FB_VISUAL_TRUECOLOR:
> -                       fb_logo.needs_truepalette = 1;
> -                       break;
> -               case FB_VISUAL_DIRECTCOLOR:
> -                       fb_logo.needs_directpalette = 1;
> -                       fb_logo.needs_cmapreset = 1;
> -                       break;
> -               case FB_VISUAL_PSEUDOCOLOR:
> -                       fb_logo.needs_cmapreset = 1;
> -                       break;
> -               }
> -       }
> +       if (fb_logo.depth > 4 && depth > 4) {
> +               switch (info->fix.visual) {
> +               case FB_VISUAL_TRUECOLOR:
> +                       fb_logo.needs_truepalette = 1;
> +                       break;
> +               case FB_VISUAL_DIRECTCOLOR:
> +                       fb_logo.needs_directpalette = 1;
> +                       fb_logo.needs_cmapreset = 1;
> +                       break;
> +               case FB_VISUAL_PSEUDOCOLOR:
> +                       fb_logo.needs_cmapreset = 1;
> +                       break;
> +               }
> +       }
>
>         height = fb_logo.logo->height;
>         if (fb_center_logo)
> @@ -1060,19 +1060,19 @@ fb_blank(struct fb_info *info, int blank)
>         struct fb_event event;
>         int ret = -EINVAL;
>
> -       if (blank > FB_BLANK_POWERDOWN)
> -               blank = FB_BLANK_POWERDOWN;
> +       if (blank > FB_BLANK_POWERDOWN)
> +               blank = FB_BLANK_POWERDOWN;
>
>         event.info = info;
>         event.data = &blank;
>
>         if (info->fbops->fb_blank)
> -               ret = info->fbops->fb_blank(blank, info);
> +               ret = info->fbops->fb_blank(blank, info);
>
>         if (!ret)
>                 fb_notifier_call_chain(FB_EVENT_BLANK, &event);
>
> -       return ret;
> +       return ret;
>  }
>  EXPORT_SYMBOL(fb_blank);
>
> --
> 2.24.1
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20191218030025.10064-1-natechancellor%40gmail.com.



-- 
Thanks,
~Nick Desaulniers
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
