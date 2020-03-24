Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4831192260
	for <lists+dri-devel@lfdr.de>; Wed, 25 Mar 2020 09:17:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AF8C6E57E;
	Wed, 25 Mar 2020 08:17:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CDF36E25C
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 13:36:03 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id cf14so11496328edb.13
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 06:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TMB75Qkz8yI3t1WgLX4NDid7APvWxFWZwvhtkRGYDD0=;
 b=YmaPzGpXLGUa5XCjv+/RdXu1YOk3nivWvqRjx/vlBo4hqqJMk61wmNSN10Iul77Nvo
 E2L8DGlsGEt1ZD8RNEtVTvW8atC1lJhwwbwWlVmw0Kle33ZWDgaUBzU4LXO6eNZ2+t/3
 7DOFjDXJpe06e+edi5OVIv5ZrmN3GgBmYGQk9Gh9Gdc3HQYrcGeRwPDfduTjETjLmLC0
 W4ghmX+aNoJ9x1cnG7XrpgydcXceO9B0t87y35x/4tvjwkUofUE8CKAZbbP35QzShhcL
 KxnbtZtkYvIV9nmhS+8rEJgSTDL46IbvmxBicE2mgMB+B9Ke6u0ZBK8Ou7pw41gMrIAy
 aD/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TMB75Qkz8yI3t1WgLX4NDid7APvWxFWZwvhtkRGYDD0=;
 b=GbG6X1ad8AC5qKi2xiS/0Aqswfjfk3MGeKAIroleEyorIUlndjYI56wmyJuPF4LiSk
 y1TvD3v5ylWcPG39DqWrqDN6vpORwXURz18rgEmQRSe6n9IfhUXpJPfERgw4/80zQc6/
 NSWXvQJy5V7+X2R3oHYCWLXyFEbMxylUmJ7Cm75+/o6pbmiKYTnWFDH/j3DUFAfo71Iq
 xDHTdgPRTolWjqtfTK6hzmTpzW6h8rt8Qh6nnjly53otO5oO3WX9tqcDH1jKE8LTIY+5
 DqsbTa0IdSzgSYmnaS1P7bo8TY2iBk3XCGdOBy3f4zl4C9sHhRyO6BDp9Xgr0M8wrBsS
 UlFg==
X-Gm-Message-State: ANhLgQ2MH3vFeVjkOGw6nGcMFXjfRZ/sUW2WShjGMpS6ZidpfGLpoSqe
 9KQRagtizsvLem/yfugWR+t+qG5GZFAzHBUQgIw=
X-Google-Smtp-Source: ADFU+vscfGIZKpwjX0dEGgS35+1q/HihwK1k2Qfxg2EzIk59b8orP/i57EWa5pCCRT3SkfBE+JjbKeYPuy25TYl1VEA=
X-Received: by 2002:a50:f743:: with SMTP id j3mr26864098edn.22.1585056962133; 
 Tue, 24 Mar 2020 06:36:02 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20200310023550eucas1p10797f834d7dc16f634cf644011462393@eucas1p1.samsung.com>
 <20200310023536.13622-1-hslester96@gmail.com>
 <1f5e6f52-c638-f73e-cf9d-88eb641a010d@samsung.com>
In-Reply-To: <1f5e6f52-c638-f73e-cf9d-88eb641a010d@samsung.com>
From: Chuhong Yuan <hslester96@gmail.com>
Date: Tue, 24 Mar 2020 21:35:51 +0800
Message-ID: <CANhBUQ1JV3drHn-HO2urK-Q7yUNtLhk09UuBG7F=qV7Lid=0ww@mail.gmail.com>
Subject: Re: [PATCH v3] video: fbdev: vesafb: add missed release_region
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
X-Mailman-Approved-At: Wed, 25 Mar 2020 08:16:37 +0000
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
Cc: linux-fbdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 20, 2020 at 8:01 PM Bartlomiej Zolnierkiewicz
<b.zolnierkie@samsung.com> wrote:
>
>
> On 3/10/20 3:35 AM, Chuhong Yuan wrote:
> > The driver forgets to free the I/O region in remove and probe
> > failure.
> > Add the missed calls to fix it.
> >
> > Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
> > ---
> > Changes in v3:
> >   - Revise the commit message.
> >   - Add an error handler to suit the "goto error" before request_region().
> >   - Revise the order of operations in remove.
> >
> >  drivers/video/fbdev/vesafb.c | 9 ++++++---
> >  1 file changed, 6 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/video/fbdev/vesafb.c b/drivers/video/fbdev/vesafb.c
> > index a1fe24ea869b..c7bc9ace47d4 100644
> > --- a/drivers/video/fbdev/vesafb.c
> > +++ b/drivers/video/fbdev/vesafb.c
> > @@ -439,7 +439,7 @@ static int vesafb_probe(struct platform_device *dev)
> >                      "vesafb: abort, cannot ioremap video memory 0x%x @ 0x%lx\n",
> >                       vesafb_fix.smem_len, vesafb_fix.smem_start);
> >               err = -EIO;
> > -             goto err;
> > +             goto err_release_region;
> >       }
> >
> >       printk(KERN_INFO "vesafb: framebuffer at 0x%lx, mapped to 0x%p, "
> > @@ -458,15 +458,17 @@ static int vesafb_probe(struct platform_device *dev)
> >
> >       if (fb_alloc_cmap(&info->cmap, 256, 0) < 0) {
> >               err = -ENOMEM;
> > -             goto err;
> > +             goto err_release_region;
> >       }
> >       if (register_framebuffer(info)<0) {
> >               err = -EINVAL;
> >               fb_dealloc_cmap(&info->cmap);
> > -             goto err;
> > +             goto err_release_region;
> >       }
> >       fb_info(info, "%s frame buffer device\n", info->fix.id);
> >       return 0;
> > +err_release_region:
> > +     release_region(0x3c0, 32);
>
> This is incorrect.
>
> The cleanup order should be the reverse of the probing order.
>
> Also request_region() return value is not checked by the driver
> (there is a comment that it can fail and is optional):
>
>         /* request failure does not faze us, as vgacon probably has this
>          * region already (FIXME) */
>         request_region(0x3c0, 32, "vesafb");
>
> so what would happen in such case? It seems that unconditionally
> doing the release will result in freeing the I/O region owned by
> the other driver (vgacon)..
>

Maybe we can add a field to represent whether the request succeeds?
request_region() returns source *, we can store it and check whether
it is null when
we are going to call release_region().

> >  err:
> >       arch_phys_wc_del(par->wc_cookie);
> >       if (info->screen_base)
> > @@ -481,6 +483,7 @@ static int vesafb_remove(struct platform_device *pdev)
> >       struct fb_info *info = platform_get_drvdata(pdev);
> >
> >       unregister_framebuffer(info);
> > +     release_region(0x3c0, 32);
> >       framebuffer_release(info);
> >
> >       return 0;
> >
>
> Best regards,
> --
> Bartlomiej Zolnierkiewicz
> Samsung R&D Institute Poland
> Samsung Electronics
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
