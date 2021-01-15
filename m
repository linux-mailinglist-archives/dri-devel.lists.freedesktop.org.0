Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BEB2F7DC8
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 15:11:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6903A6E40F;
	Fri, 15 Jan 2021 14:11:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFDAA6E40F
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 14:10:59 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id my11so5569028pjb.1
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 06:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yVMDQ0NoHdwzCzsf38XWdiH+uvMyE/EInOhZIyF3pLo=;
 b=L9+njV6fLMgwDoj3nkpi20rCK9v8g/jT8uOnoKDnpbOOLMATTVsSJLEAAYgTZQMQVq
 GlYGESYqvxmLJDkVbBmOumM/88YD05LfW+TRbh1YmKsCSAx546p/BsKf1sOB29cWyOTF
 5j1nayyN5V86P3pT7YcqjxhIFsT/Vo0aIWhKl0R0e/M3NIP4gQYgQdOAK9LP9ftp5e4n
 /plzAuUVVQ1JZtHImRWI4DuhhH/zbHSFkFeffT6bWspn8DolVML8q4b+xxl5vpG0t2KA
 hCFM+rPQiaAS3IYAlvMvPvO02Qv+FcnYp80FnZIASHm4+CqGt9LyOGijf2mIIya9V0Mp
 NA8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yVMDQ0NoHdwzCzsf38XWdiH+uvMyE/EInOhZIyF3pLo=;
 b=t9iZlouKboTML4C8dAxscRpSMKG3rUhzyvdXpRH+r8mIhMSJZJ4H+JsD+XPdHXiOn/
 6eZ6KXOdlSou8dx5FU4d2QXD7tDIGNIvpvfacbKA2txjNOmKuuhMEbc0yiCl0OVagmY7
 0ZPQaLawm6ODTWSOfmphQJLNjPDXyKZFpF3WOGXQPcqjm7CTme07BNop/XOskMp9c/30
 riNleZ3BG7Gf9g/61RiF9ozruvHyUSZ/57VrV+d99dJ0HN1uYK4DzRBlFJ8qoDEsnqvl
 L3HxveyWnVU1cky2WwJF1+CS3Jy1RIG4XOFCYhNgxfwmO1FwooqfEHvprTxmuIJt8PV8
 W7LQ==
X-Gm-Message-State: AOAM533z1P64TMYDSmr4dIa6f07coMPNtFp+zOUFsc+5Yxih2xtQPMt8
 eRmqlMjaBcsbbxGk6uQoh86IDf6u+FPJ1SJtovM=
X-Google-Smtp-Source: ABdhPJye8Onw5+7k1mn9VwwIHJZF7LhD4GwKWMQ6MKPojRrH+4GPTVSOl/9nW+SnAf+X5fkCuryE/1bCQlw6Ox/lAVI=
X-Received: by 2002:a17:90b:17c7:: with SMTP id
 me7mr10623511pjb.205.1610719859407; 
 Fri, 15 Jan 2021 06:10:59 -0800 (PST)
MIME-Version: 1.0
References: <20210115130911.71073-1-colin.king@canonical.com>
In-Reply-To: <20210115130911.71073-1-colin.king@canonical.com>
From: Sumera Priyadarsini <sylphrenadin@gmail.com>
Date: Fri, 15 Jan 2021 19:40:47 +0530
Message-ID: <CACAkLuqG+4cq9w9=JEjB-5KPcxu==2+Sen6GMknM495vELgEFA@mail.gmail.com>
Subject: Re: [PATCH][next] drm/vkms: Fix missing kmalloc allocation failure
 check
To: Colin King <colin.king@canonical.com>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Melissa Wen <melissa.srw@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 15, 2021 at 6:39 PM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> Currently the kmalloc allocation for config is not being null
> checked and could potentially lead to a null pointer dereference.
> Fix this by adding the missing null check.
>
> Addresses-Coverity: ("Dereference null return value")
> Fixes: 2df7af93fdad ("drm/vkms: Add vkms_config type")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Good catch, thank you!

Reviewed-by: Sumera Priyadarsini <sylphrenadin@gmail.com>
> ---
>  drivers/gpu/drm/vkms/vkms_drv.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> index 708f7f54001d..2173b82606f6 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -188,7 +188,11 @@ static int vkms_create(struct vkms_config *config)
>
>  static int __init vkms_init(void)
>  {
> -       struct vkms_config *config = kmalloc(sizeof(*config), GFP_KERNEL);
> +       struct vkms_config *config;
> +
> +       config = kmalloc(sizeof(*config), GFP_KERNEL);
> +       if (!config)
> +               return -ENOMEM;
>
>         default_config = config;
>
> --
> 2.29.2
>
regards,
Sumera
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
