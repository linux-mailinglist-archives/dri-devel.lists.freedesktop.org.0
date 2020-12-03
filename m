Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C63E42CD2CA
	for <lists+dri-devel@lfdr.de>; Thu,  3 Dec 2020 10:46:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CA4A6E09E;
	Thu,  3 Dec 2020 09:46:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DCC46E09E
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Dec 2020 09:45:58 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id f24so1779860ljk.13
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Dec 2020 01:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BTlGzfvUDypCFqBvmwFfmXu7/Iijd722QkVqWCD+4QI=;
 b=bOPBTRe50dYnkJ7KzuNO3KMBoOL5eDeV4gnBOgpirA/GmSas8uJIVl/0AipZZfHHgU
 izUtY2aDaCqgfgibTyhMfxUI3Ef650Dyhe/Af/T6Ml1aotfBZhD0ssZMQ8alTNgB9rlf
 KxqACJO6bCDMENd3UGRJuqM1bmlgMalk1kJn6ekpbu7vcda2NQSEHQuwwelZIWovIYv+
 sePPGyTUFPvDUVZKJy8yx3nmU22zyii42ryEO/hQtDIoIJB5UGhYDEe8qZPCKoAkc5EK
 MEmZqomFiLTuOiFQ0bd+9JA4UNIVGuOUUFlRceY200NI+d3QFu5RWT8Ly0JAMchrMVyC
 VCzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BTlGzfvUDypCFqBvmwFfmXu7/Iijd722QkVqWCD+4QI=;
 b=oymRFEZc19t3GfZ3YRDCEE8wMqhX/IvSG7Gypz2csrcFDBQEv38+b07L1zwdtSCYZZ
 Az+9vt/oS2aOOdx0xBPtHbwfJUmpHlCiEh/t3Cf19/zUOhwxJ5qnzv9qLilPNbrkSuND
 MFURWoPZLe9gpJAtWOGQKOqU+VkxoqZy4I8VwIPPz63KUBhb00lptD+kWy1GgTeGVmtZ
 I6m8Hu1TL1NbAVrXfb6sYAWYbHPJFN5KK+MvfCoeEjvfeT17l/se41JH7b78Ivo7vw4j
 dBpPVvJbCpoNXRoYr/rXyhKHh7379N0AlTJbk0/9B6jC5Sl8qWP6VZRKJWGgTeYRz4P2
 XoDw==
X-Gm-Message-State: AOAM533aMC4Iw7RvTNg1F5f5uyRAZKvaqJ4UN9s/WTaDnsZB8K/93MJP
 hIJ43P0rNhltGj9YOZhE6FtVoUnEchkDE9E2UxA=
X-Google-Smtp-Source: ABdhPJznT/PWInkyvV39FGkv6HV6ouOsc33obT6CjacNijL/qI0gOOjcVcvRx4jTpI/e2HMMVnBgfsYiRZjlIEW/5fQ=
X-Received: by 2002:a2e:89d7:: with SMTP id c23mr895401ljk.397.1606988757039; 
 Thu, 03 Dec 2020 01:45:57 -0800 (PST)
MIME-Version: 1.0
References: <X8ikkAqZfnDO2lu6@mwanda>
In-Reply-To: <X8ikkAqZfnDO2lu6@mwanda>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Thu, 3 Dec 2020 10:45:46 +0100
Message-ID: <CAMeQTsZYx7KB2mUfv7uwOJ+FJ5-UUj-YH7m7y0bTB-LsPm4xvw@mail.gmail.com>
Subject: Re: [PATCH] gma500: clean up error handling in init
To: Dan Carpenter <dan.carpenter@oracle.com>
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>, Dave Airlie <airlied@redhat.com>,
 Alan Cox <alan@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 3, 2020 at 9:41 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The main problem with this error handling was that it didn't clean up if
> i2c_add_numbered_adapter() failed.  This code is pretty old, and doesn't
> match with today's checkpatch.pl standards so I took the opportunity to
> tidy it up a bit.  I changed the NULL comparison, and removed the
> WARNING message if kzalloc() fails and updated the label names.

Thanks! Looks good.

I'll apply this to drm-misc-next

-Patrik

>
> Fixes: 1b082ccf5901 ("gma500: Add Oaktrail support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/gpu/drm/gma500/oaktrail_hdmi_i2c.c | 22 +++++++++++++---------
>  1 file changed, 13 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/gma500/oaktrail_hdmi_i2c.c b/drivers/gpu/drm/gma500/oaktrail_hdmi_i2c.c
> index e28107061148..fc9a34ed58bd 100644
> --- a/drivers/gpu/drm/gma500/oaktrail_hdmi_i2c.c
> +++ b/drivers/gpu/drm/gma500/oaktrail_hdmi_i2c.c
> @@ -279,11 +279,8 @@ int oaktrail_hdmi_i2c_init(struct pci_dev *dev)
>         hdmi_dev = pci_get_drvdata(dev);
>
>         i2c_dev = kzalloc(sizeof(struct hdmi_i2c_dev), GFP_KERNEL);
> -       if (i2c_dev == NULL) {
> -               DRM_ERROR("Can't allocate interface\n");
> -               ret = -ENOMEM;
> -               goto exit;
> -       }
> +       if (!i2c_dev)
> +               return -ENOMEM;
>
>         i2c_dev->adap = &oaktrail_hdmi_i2c_adapter;
>         i2c_dev->status = I2C_STAT_INIT;
> @@ -300,16 +297,23 @@ int oaktrail_hdmi_i2c_init(struct pci_dev *dev)
>                           oaktrail_hdmi_i2c_adapter.name, hdmi_dev);
>         if (ret) {
>                 DRM_ERROR("Failed to request IRQ for I2C controller\n");
> -               goto err;
> +               goto free_dev;
>         }
>
>         /* Adapter registration */
>         ret = i2c_add_numbered_adapter(&oaktrail_hdmi_i2c_adapter);
> -       return ret;
> +       if (ret) {
> +               DRM_ERROR("Failed to add I2C adapter\n");
> +               goto free_irq;
> +       }
>
> -err:
> +       return 0;
> +
> +free_irq:
> +       free_irq(dev->irq, hdmi_dev);
> +free_dev:
>         kfree(i2c_dev);
> -exit:
> +
>         return ret;
>  }
>
> --
> 2.29.2
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
