Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E47479845
	for <lists+dri-devel@lfdr.de>; Sat, 18 Dec 2021 03:58:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2429810E342;
	Sat, 18 Dec 2021 02:58:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx-lax3-1.ucr.edu (mx-lax3-1.ucr.edu [169.235.156.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4EDD10E342
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Dec 2021 02:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
 t=1639796298; x=1671332298;
 h=mime-version:references:in-reply-to:from:date:message-id:
 subject:to:cc; bh=KziBpYYiI76v0rTQKZkMxGcmjJMQJL/2X+fDliRgTY8=;
 b=gGI7Da3X8yRuroq1MfLOkweZKKXBTuZ7BMsEfyG1oc+hpMgFG1z/32B8
 OvbLf2bQ0rsQ2z1VnFyv1zN37C87VSU4Xe70hSwTkm0zc/xM1xUDydEX7
 n8E46lVePDbCqX3ZuPJIiend6PCKscqB4mE+olMFMoONNzo8nhSZleILz
 CSpfnzUbeBdPxA1hCTWeMKBLT8tOyTgrGtbfRKlqTztgpe1DembEJWr7E
 eFfB0PAJv7LvOWWzi7jaGOL97lHrqFZwgcTA3esu27MmhpIOWXdoqQpFm
 Xt23n56bjLgkyz6bdT8FnhPLHotto573ixd2ofeD6KOo6Co4sOCAzwuaN Q==;
IronPort-SDR: TiPbtrRG1voHTRWCf7EdeScP+FjudQpGGoCmhrKzLoh+THhWtrtCWk3KGKZSr2sIagcUH+JI3j
 b3vSpCY+BUg+Ov1p+6vu2g9Bw4YlJrtDBYXsP1pD378NKIQrH6pVDcJBGPg3pbWKimyD+ntGfd
 pxN55+4X4kLViQcnZE1vKMG0Lqw5yLAFwwtihSIlnLjfh+Gu5490AZFPuy/zcyLH6Fn3N4sjNs
 /8lG2JCNl+xT0c1b0oxR8XEZONT7/AT/6eq4KmRqGQivg/wPUewfoH0s394hgwgyv4yRPn2Cz+
 x2UGOzyu/wEzLCXsqV24VHgK
X-IronPort-AV: E=Sophos;i="5.88,215,1635231600"; d="scan'208";a="91880344"
Received: from mail-yb1-f199.google.com ([209.85.219.199])
 by smtp-lax3-1.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Dec 2021 18:58:17 -0800
Received: by mail-yb1-f199.google.com with SMTP id
 w5-20020a25ac05000000b005c55592df4dso8559021ybi.12
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 18:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucr.edu; s=rmail;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8vmmsxncbFQ/2xzccVTZIkFvvP7ArQ13zGZOkstUsL4=;
 b=sTD11NtvmH1Wv1kqJu2D8MlUjyJcoEmt2d7+XfYXMulaWxXKuc6ajV7X/2OwVhFI22
 5/uGolBmOKVtUn/vvXD3Et12z1EV98H3MUEL6OMaXJqq+IJaDfnYYa0vcB5dumi3YJGf
 y6SMwAQXEgrG9URbzO7R3PgY7j0vTkxDElUZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8vmmsxncbFQ/2xzccVTZIkFvvP7ArQ13zGZOkstUsL4=;
 b=iiM/+S+iaBsXqjH1rkwjTKtTeJFll1tDaAmLi55yRBx3Po0rQry20UX2H0iKbVG4Aw
 iqwW1D/+lAaNzB7C6S18uWcIG6dFZtQTmRwrM8yUxubmpe7omjYd2Ag8n9qnmxYceMTy
 PC2cXOd8HaO2j8zMTXzFHN+4nUUHtXegUW/YareI/n7CyPo0EmaWHZ1GMomKFdiwJPVI
 QdNXfpYL9hOueHDB+3LMoe/eJpoCLJXwWAb9w8ynq/GiyyV8ZamJd0WULqcIzTjOQkCV
 sbt3STiv7w0jquCovjWcytoAccJuRpoIetFwxBCaM4jS+ZDSpPCs5fBzZfLNwJA5V6lG
 Zfgw==
X-Gm-Message-State: AOAM531P/Z3iDr3AOMGuEAHzzv/bRKHttVijhZZ6IpNcbet3+6RNKHtz
 Kq2256IbjicVvvCcRANkHYsL2GGpiM95+VDJqy6Ev1GVB26+nxQW2Y9qcXr7gwlIkhjKd8R9XUw
 2yFWVczxTECT7DRGkqqdndunyzLBpBWgTJnjW2ZqYR9Dq8g==
X-Received: by 2002:a25:a2c1:: with SMTP id c1mr8726868ybn.473.1639796295342; 
 Fri, 17 Dec 2021 18:58:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxp6oA3pKkoWsKv1T0ej6zGhz3AR1ptfd0MFDEzORS1I7HWhSsr8wqxEJJfoR4dKLFSYf+Key6yqyGe/HuR3xk=
X-Received: by 2002:a25:a2c1:: with SMTP id c1mr8726855ybn.473.1639796295099; 
 Fri, 17 Dec 2021 18:58:15 -0800 (PST)
MIME-Version: 1.0
References: <20211116070708.429432-1-yzhai003@ucr.edu>
 <6a79eef26121afa9190de5a021f4edef53fc9651.camel@redhat.com>
In-Reply-To: <6a79eef26121afa9190de5a021f4edef53fc9651.camel@redhat.com>
From: Yizhuo Zhai <yzhai003@ucr.edu>
Date: Fri, 17 Dec 2021 18:58:04 -0800
Message-ID: <CABvMjLQky6Xe80oJ9pPALjQ_SgMmp-Crp4z-Y08SiRo4TNTPSg@mail.gmail.com>
Subject: Re: [PATCH] In function nvkm_ioctl_map(), the variable "type" could
 be uninitialized if "nvkm_object_map()" returns error code, however, it does
 not check the return value and directly use the "type" in the if statement,
 which is potentially unsafe.
To: Lyude Paul <lyude@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lyude:
I appreciate your feedback and I misplaced the commit message to the
title, I have modified it and resend the patch.
I made my linux development tree a mess, so I sent a brandly new one
and cc you. Thanks again for your help: )


On Tue, Nov 16, 2021 at 1:18 PM Lyude Paul <lyude@redhat.com> wrote:
>
> This is a very long patch name, it should probably be shorter and the
> details in the patch title moved into the actual commit description
> instead. Also a couple of things aren't formatted correctly:
>
> * Cc tag for stable is missing, see
>   https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
> * Fixes tag isn't formatted properly
>
> I generally recommend using `dim fixes` from
> https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
> in order to get the correct stable kernel CC tag and Fixes: tag (you can
> drop any of the Ccs it gives you beyond the one to stable at vger dot
> kernel dot org.
>
> Also, if you could try to Cc: me on the next version - will help me
> respond faster :).
>
> On Mon, 2021-11-15 at 23:07 -0800, Yizhuo Zhai wrote:
> > Fixes:01326050391ce("drm/nouveau/core/object: allow arguments to
> > be passed to map function")
> > Signed-off-by: Yizhuo Zhai <yzhai003@ucr.edu>
> > ---
> >  drivers/gpu/drm/nouveau/nvkm/core/ioctl.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
> > b/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
> > index 735cb6816f10..4264d9d79783 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
> > @@ -266,6 +266,8 @@ nvkm_ioctl_map(struct nvkm_client *client,
> >                 ret = nvkm_object_map(object, data, size, &type,
> >                                       &args->v0.handle,
> >                                       &args->v0.length);
> > +               if (ret)
> > +                       return ret;
> >                 if (type == NVKM_OBJECT_MAP_IO)
> >                         args->v0.type = NVIF_IOCTL_MAP_V0_IO;
> >                 else
>
> --
> Cheers,
>  Lyude Paul (she/her)
>  Software Engineer at Red Hat
>


--
Kind Regards,

Yizhuo Zhai

Computer Science, Graduate Student
University of California, Riverside
