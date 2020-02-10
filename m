Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C1E1570C9
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2020 09:26:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 007776E92B;
	Mon, 10 Feb 2020 08:26:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com
 [IPv6:2607:f8b0:4864:20::b42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDE626E92B;
 Mon, 10 Feb 2020 08:26:03 +0000 (UTC)
Received: by mail-yb1-xb42.google.com with SMTP id s35so3215235ybi.0;
 Mon, 10 Feb 2020 00:26:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=43XyHfKAaNPwgYgkkYK63R6QsAZuOrXyeXcn4MIztAs=;
 b=rkfXRvAX1M5NcUKiOYmsWZO4yhj9fqUsR0uU/qr0n6Di7YYF7UzDp52ewieCrrqWaC
 o9ccXtoJUiQzlvlRZ+l5GLB1xhJJvulgv+rQeQjdpPVlv8ArY8dKYuqMYL2l7HF42/Mj
 CHRLyqiHcmFSCYN4SNVGUKrgUTQMe0ltKi+P4fqUjkFWjRS+uMpqTKxK6TW1GrYfNvEP
 q3FIy2BTi4BCGrzk7RflswBuTQvCWGDTm4tPNQE/0+ep/+LyP9CANT+ziHY2BYj50y5Y
 x93RFgB7nNci/1uxepf558zRQ+XqWepxyOjQx3xP9wAZDt0vwTEa8lV658XBCVejIB4a
 uJ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=43XyHfKAaNPwgYgkkYK63R6QsAZuOrXyeXcn4MIztAs=;
 b=X7AYBfVDNyuNxDEuAtqXSb9UEyR1EDSgqe8/skCTDcWW6Mm2m1RPuEhztktXGi2Jqp
 uctdDAd85pjIVt5eYKedtCTUPyzKWH9TChNo7NeNEgfwMePS6s3RnxB5MD4wRSouWo/z
 ad33iIsp4RhxcX+ART0yADguJ2vFoiDWHB26nxXxF31vOs7NMDWnGHU9EOQcZkIlEWFd
 b6mF7YeqrOv4kEJ61spEI4s/OnG72MBN2sUeohkwNJ9FL6KcUHcyI0jOz0By8YQyWF8Y
 tO0dx7P9MQTbSNoFtimT51243y1MuURSm5sMLPTHFf+y1FcyGRDMbYWP1zTB9D6mstE/
 V7Mg==
X-Gm-Message-State: APjAAAVVdZVi8aI1/3s/uR6Jt6o8opA5+PHpUq9mrCMElHrmW8R6NCC6
 nRRjRaUtCJtpOxYujuzwZAngm6pil0HYgnOtpdE=
X-Google-Smtp-Source: APXvYqzNFMeGOWls9djYYg/ae72pshGhzqMBjXzbXcBItVFMrqLENYfkReOiF2tOlz/wfX/QzoYuCCnsi8m4eUNbkCc=
X-Received: by 2002:a25:7395:: with SMTP id o143mr299899ybc.435.1581323162995; 
 Mon, 10 Feb 2020 00:26:02 -0800 (PST)
MIME-Version: 1.0
References: <20200209105525.GA1620170@kroah.com>
In-Reply-To: <20200209105525.GA1620170@kroah.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Mon, 10 Feb 2020 18:25:52 +1000
Message-ID: <CACAvsv7YUGE7z5C4j5mT_P01zr-TcoZymN1D4LD3F9vUYc98Cg@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH] nouveau: no need to check return value of
 debugfs_create functions
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
Cc: David Airlie <airlied@linux.ie>, ML nouveau <nouveau@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 9 Feb 2020 at 22:56, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> When calling debugfs functions, there is no need to ever check the
> return value.  The function can work or not, but the code logic should
> never do something different based on this.
Thanks!

>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  drivers/gpu/drm/nouveau/nouveau_debugfs.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.c b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> index 080e964d49aa..d1c82fc45a68 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> @@ -224,14 +224,10 @@ nouveau_drm_debugfs_init(struct drm_minor *minor)
>         struct dentry *dentry;
>         int i;
>
> -       for (i = 0; i < ARRAY_SIZE(nouveau_debugfs_files); i++) {
> -               dentry = debugfs_create_file(nouveau_debugfs_files[i].name,
> -                                            S_IRUGO | S_IWUSR,
> -                                            minor->debugfs_root, minor->dev,
> -                                            nouveau_debugfs_files[i].fops);
> -               if (!dentry)
> -                       return -ENOMEM;
> -       }
> +       for (i = 0; i < ARRAY_SIZE(nouveau_debugfs_files); i++)
> +               debugfs_create_file(nouveau_debugfs_files[i].name,
> +                                   S_IRUGO | S_IWUSR, minor->debugfs_root,
> +                                   minor->dev, nouveau_debugfs_files[i].fops);
>
>         drm_debugfs_create_files(nouveau_debugfs_list,
>                                  NOUVEAU_DEBUGFS_ENTRIES,
> --
> 2.25.0
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
