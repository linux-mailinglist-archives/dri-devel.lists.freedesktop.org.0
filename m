Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0EF6162F32
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2020 20:00:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4DBE6E4DE;
	Tue, 18 Feb 2020 19:00:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F17856E4DE
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 19:00:41 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id z2so21192922oih.6
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 11:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vVon9MCR2eKlk3dtcH82oPxf8ZW6p7b6JHgOz9jQlJ8=;
 b=EZwGBR7wltaso7KhEh5dfSJbjAp4uSZHWmBk/Y+mD4q9cTqryM6/WOKaX6tY5jqXyZ
 uLqXtUPtOlgsxM5z7Au9JuQbFew4H2vmEZFtsqH6qZzC2WL00Snld3cL6E+pGUhqs9Jc
 11g1hFBfNlSpwjlDkVO1lpcQxQhXZGPmeqcJI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vVon9MCR2eKlk3dtcH82oPxf8ZW6p7b6JHgOz9jQlJ8=;
 b=Q6oEjxUjEAvpY8XkegBKbYDQre08GUDecFcPnNvgmnEiTxKThcKjKmvZHpsaIhyDqb
 hstRyXAqKzw4aVktJ/OWYT5iYw95s9UIhyzjh/LbmRhvE7ugWXRWXIZnr58ynjEA4AnB
 cZg6kAUw3kc34iJ+2aY5hZX64C08jtzL1JfNX/0M2oygKnWCLkLby5G5SxATocuiTvb7
 SBR2pQDaRRShSjvZYa9DbiAfCXOImcaf+GuJw0YMvqaF14gw/K1z5mMf+Ln5h89Ml8N5
 TYnbhnG4Nu5yjqQC72YnePSsg2vrsZVT4Cmu+gIieyu6cAOWAw5CqSh62doFrJIoY9D1
 PWtw==
X-Gm-Message-State: APjAAAXt+IvUkRQqXAsBenlilbZfBwf+czDiT4xPhhCCrtI1CWLJUjkw
 z5fSpT2CGkSZ6d0+F+qWj7nsaFbTKDASIkNxPB6EHg==
X-Google-Smtp-Source: APXvYqwFFnV1mL2xMZPIBgZloQiK9LP4j3LCKSgLL4kBiHdrCnQ/AeAqqg7MVL9ZKN98b//hq7cvNGKRbvdJqFGadB4=
X-Received: by 2002:a05:6808:10b:: with SMTP id
 b11mr2254105oie.110.1582052441303; 
 Tue, 18 Feb 2020 11:00:41 -0800 (PST)
MIME-Version: 1.0
References: <20200218172821.18378-1-wambui.karugax@gmail.com>
In-Reply-To: <20200218172821.18378-1-wambui.karugax@gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 18 Feb 2020 20:00:30 +0100
Message-ID: <CAKMK7uHeSW-sFCZK09n89mJ66J3sb0EtxYU9Ojfi-adM7czTug@mail.gmail.com>
Subject: Re: [PATCH] drm/arc: make arcpgu_debugfs_init return 0
To: Wambui Karuga <wambui.karugax@gmail.com>
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
Cc: Dave Airlie <airlied@linux.ie>, Greg KH <gregkh@linuxfoundation.org>,
 Alexey Brodkin <abrodkin@synopsys.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 18, 2020 at 6:28 PM Wambui Karuga <wambui.karugax@gmail.com> wrote:
>
> As drm_debugfs_create_files should return void, remove its use as the
> return value of arcpgu_debugfs_init and have the latter function
> return 0 directly.
>
> Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
> ---
>  drivers/gpu/drm/arc/arcpgu_drv.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/arc/arcpgu_drv.c b/drivers/gpu/drm/arc/arcpgu_drv.c
> index d6a6692db0ac..660b25f9588e 100644
> --- a/drivers/gpu/drm/arc/arcpgu_drv.c
> +++ b/drivers/gpu/drm/arc/arcpgu_drv.c
> @@ -139,8 +139,10 @@ static struct drm_info_list arcpgu_debugfs_list[] = {
>
>  static int arcpgu_debugfs_init(struct drm_minor *minor)
>  {
> -       return drm_debugfs_create_files(arcpgu_debugfs_list,
> -               ARRAY_SIZE(arcpgu_debugfs_list), minor->debugfs_root, minor);
> +       drm_debugfs_create_files(arcpgu_debugfs_list,
> +                                ARRAY_SIZE(arcpgu_debugfs_list),
> +                                minor->debugfs_root, minor);
> +       return 0;

For cases like these I think we should go a step further and also
remove the return value from the driver wrapper. And that all the way
up until there's something that actually needs to return a value for
some other reason than debugfs.
-Daniel

>  }
>  #endif
>
> --
> 2.25.0
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
