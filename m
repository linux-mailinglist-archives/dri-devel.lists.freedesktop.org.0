Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A635163CC3
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 06:39:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8715C6EB0D;
	Wed, 19 Feb 2020 05:39:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com
 [IPv6:2607:f8b0:4864:20::b42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D91866E431;
 Wed, 19 Feb 2020 05:39:31 +0000 (UTC)
Received: by mail-yb1-xb42.google.com with SMTP id k69so11804899ybk.4;
 Tue, 18 Feb 2020 21:39:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d6qeSHn0R8eb7oUSh15TXKxMRyNgkmSfzopxI3yp3FM=;
 b=RcJvnBF7TNNpu0kEihSEJQdZW95fpfOgZ8O3iNQbqQAgROzILUpdP+uVsm/rcl1j+J
 pjHjdUQD8jTt8MxZmqU2s6sl3TKCO/vW71rwrEK/UNzllPgXKlnfv5KaYhTHQQZhpq0q
 JzCLLmRVQWZMfwLNHqdwVTUvsX+P25oawWZv8lgqmJqQxFnKmdRsV7u5bPjM+hGEOwQW
 jbjIL2+JuT+a7/TcxjKhX4/fI4aVB7FYyLDvxHe0mCM5rGF8gzWRiVHauRngciMbMnGR
 5cuP6muvicfgeDgvGntE9eVb9lOsAigqLa/NwsuMIcUXZjY07CHLO43xs3HWFA8ufjwd
 gpMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d6qeSHn0R8eb7oUSh15TXKxMRyNgkmSfzopxI3yp3FM=;
 b=fGE1gYTPwe207ElgkMMNoQFB4m9fQflqPoAF40K1hOZ7/hWQleSVmZf6RTr2LMoZgP
 Ly9VpiOom6bGJtt/oGmNhokYMadeIjXyy2ZF42ojQCb3nYhvXCyc9I1k01UHZ6FeXXSs
 YdqheUyLRno9oRKXre4uGZUOfV4DQl7mUnj+HYnQuHG8FUAocNWmmQ5xoPvi31kpd3OH
 EJxHdTS6e/i+Kv7R9Q8lhndwtqGNXQxzFPhW9G9Q/XoPHQT5fHAQ4Orw6c+GRydf/7N5
 zaBSG1t4BXK83g7AFZSjEVFFjaO/oknuUZwCVy/QSUDtiFrrnV+7Tu11QPHeMAs2Tvx8
 OnMg==
X-Gm-Message-State: APjAAAUcBf6qifxd/XiAGRva6soMwOIFMx6MSddioed8waxx5Nui3JFd
 zGaYfEzpsobdWCMu8uEtVRZoZL91F91nO/5kZsU=
X-Google-Smtp-Source: APXvYqw7XK3ql/hUSl5JmamnqXChYaKmxXHXPH/aXXM9HWgu2rFUFD7ZrvlJDTyhaeZmP6y0+qG8Ip7GA1hGQ3aztoo=
X-Received: by 2002:a25:42ca:: with SMTP id
 p193mr20880605yba.147.1582090771031; 
 Tue, 18 Feb 2020 21:39:31 -0800 (PST)
MIME-Version: 1.0
References: <20200218172821.18378-1-wambui.karugax@gmail.com>
 <20200218172821.18378-6-wambui.karugax@gmail.com>
In-Reply-To: <20200218172821.18378-6-wambui.karugax@gmail.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Wed, 19 Feb 2020 15:39:20 +1000
Message-ID: <CACAvsv4fWZWqQozMFPnyk7nXVyGPvszhY33qEQ74D0eAHofp2Q@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH] drm/nouveau: remove checks for return value of
 debugfs functions
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
Cc: Dave Airlie <airlied@linux.ie>, ML nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 19 Feb 2020 at 03:28, Wambui Karuga <wambui.karugax@gmail.com> wrote:
>
> As there is no need to check for the return value of debugfs_create_file
> and drm_debugfs_create_files, remove unnecessary checks and error
> handling in nouveau_drm_debugfs_init.
Thanks!

>
> Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_debugfs.c | 20 ++++++++------------
>  1 file changed, 8 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.c b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> index 7dfbbbc1beea..15a3d40edf02 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> @@ -222,22 +222,18 @@ nouveau_drm_debugfs_init(struct drm_minor *minor)
>  {
>         struct nouveau_drm *drm = nouveau_drm(minor->dev);
>         struct dentry *dentry;
> -       int i, ret;
> +       int i;
>
>         for (i = 0; i < ARRAY_SIZE(nouveau_debugfs_files); i++) {
> -               dentry = debugfs_create_file(nouveau_debugfs_files[i].name,
> -                                            S_IRUGO | S_IWUSR,
> -                                            minor->debugfs_root, minor->dev,
> -                                            nouveau_debugfs_files[i].fops);
> -               if (!dentry)
> -                       return -ENOMEM;
> +               debugfs_create_file(nouveau_debugfs_files[i].name,
> +                                   S_IRUGO | S_IWUSR,
> +                                   minor->debugfs_root, minor->dev,
> +                                   nouveau_debugfs_files[i].fops);
>         }
>
> -       ret = drm_debugfs_create_files(nouveau_debugfs_list,
> -                                      NOUVEAU_DEBUGFS_ENTRIES,
> -                                      minor->debugfs_root, minor);
> -       if (ret)
> -               return ret;
> +       drm_debugfs_create_files(nouveau_debugfs_list,
> +                                NOUVEAU_DEBUGFS_ENTRIES,
> +                                minor->debugfs_root, minor);
>
>         /* Set the size of the vbios since we know it, and it's confusing to
>          * userspace if it wants to seek() but the file has a length of 0
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
