Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B51D3358E1D
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 22:08:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BD3F6E1A4;
	Thu,  8 Apr 2021 20:08:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 479B56E1A4
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Apr 2021 20:08:29 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 t23-20020a0568301e37b02901b65ab30024so3548657otr.4
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Apr 2021 13:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/SpcVGDdp89HQnM1Bzwek/8vZIkYEFVCUzp9ZdaowZE=;
 b=r7rN4mMnhHcorA32BOFF32cWMR9OsmPyCDiyaJ2FkmlznDZEj8p3a6Oo3mUaRDXOaW
 9L38a5QT8TQSjSoxtOP6tKcwlghf4PAM1DQq9AlUmSMLHeTQw2lUgHC6dk/TYn4j/xcI
 QhRYcwM/6/9iVNMqafIcxUeyKRpknXnancYg88D+94oPHGhMgyosqKt5NwuXhQwS8Jxn
 P12A3ARhxvjQW1XbX/BmBCXWrwNKOy6QKP2klfnYCW3NMf+gbwmaf3wQUK7jbEqqIhFS
 re6Mz0J494Kf16ikJyeJag4RWsG4oGPleoob3xYKcfb7fFtKC94WPjY2uGAxx01T9utE
 arEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/SpcVGDdp89HQnM1Bzwek/8vZIkYEFVCUzp9ZdaowZE=;
 b=MnChDrVDj28JfTkIGjKAUCzYzXGxaJzikCbgl58x8RBOf5rJ4hosOyPTNBXLvXqu/K
 SkslMS0xESKzbcy4SqbRKfuooKayWANdC1cs15yY+lzPJVutYRZYjYkOpBeNVVWkNu5i
 V5iw1NUlBbwZE1NrIHEKkSvv8VkscWFqPqDfSDG3CCzvAQQWxItusgIHasL92JSg5V03
 +iO7F3ysKdDh/9XyiZOwVakzcvRh7jj1xRUNanrICiSL4bSWadw+6SfH4nEJeyuD72/Z
 PlSmMqVgdEmLfBRQKhJ2G1JrUNWYvZyahMgeY1QlewLIWPjoLqtCrCLbT9dv5u7cTc6N
 JejA==
X-Gm-Message-State: AOAM530h2IZvmkZWw1mlGjzDIQ60Vrq7yukJkYzs9/XV7nWKVQpiPfW5
 YEoip+0Ox/0E0gGR7BNDGWUJY29t2XNq+attvYRsk9h8KPk=
X-Google-Smtp-Source: ABdhPJwrURNVI7QWg/RnJbH3umxLXlSKW/C0jH/vFSm48C32FmQfZ2PAAZKtWQ4vUbgTn6t4XdElXfDmMFFURMHjnyg=
X-Received: by 2002:a9d:be2:: with SMTP id 89mr3024304oth.23.1617912508581;
 Thu, 08 Apr 2021 13:08:28 -0700 (PDT)
MIME-Version: 1.0
References: <1617884011-51265-1-git-send-email-tiantao6@hisilicon.com>
In-Reply-To: <1617884011-51265-1-git-send-email-tiantao6@hisilicon.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 8 Apr 2021 16:08:17 -0400
Message-ID: <CADnq5_NVk1YvUwfNzN+XHwT2YSGpiOf3TdBynUt_vyoAr-bVqw@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon/r600: Fix variables that are not used after
 assignment
To: Tian Tao <tiantao6@hisilicon.com>
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
Cc: Dave Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Thu, Apr 8, 2021 at 8:13 AM Tian Tao <tiantao6@hisilicon.com> wrote:
>
> err was not used after being assigned -EINVAL and was given a new value,
> so here add goto to handle the error case.
>
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> ---
>  drivers/gpu/drm/radeon/r600.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/radeon/r600.c b/drivers/gpu/drm/radeon/r600.c
> index b44e0c6..d516ad7 100644
> --- a/drivers/gpu/drm/radeon/r600.c
> +++ b/drivers/gpu/drm/radeon/r600.c
> @@ -2570,6 +2570,7 @@ int r600_init_microcode(struct radeon_device *rdev)
>                 pr_err("r600_cp: Bogus length %zu in firmware \"%s\"\n",
>                        rdev->me_fw->size, fw_name);
>                 err = -EINVAL;
> +               goto out;
>         }
>
>         snprintf(fw_name, sizeof(fw_name), "radeon/%s_rlc.bin", rlc_chip_name);
> @@ -2580,6 +2581,7 @@ int r600_init_microcode(struct radeon_device *rdev)
>                 pr_err("r600_rlc: Bogus length %zu in firmware \"%s\"\n",
>                        rdev->rlc_fw->size, fw_name);
>                 err = -EINVAL;
> +               goto out;
>         }
>
>         if ((rdev->family >= CHIP_RV770) && (rdev->family <= CHIP_HEMLOCK)) {
> --
> 2.7.4
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
