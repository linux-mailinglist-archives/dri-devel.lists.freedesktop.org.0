Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 567C85E848C
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 23:04:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06B3E10E99E;
	Fri, 23 Sep 2022 21:04:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A04E10E130
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 21:04:16 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id bj12so3048152ejb.13
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 14:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=Zn8iXtJzLQTfvlg1B5Ug66alU1b6v54dZuHDSVAJ4uw=;
 b=abTOyeMgwoVVViLhF9zBe/P1TKCgJptRY4q9nZDgqolSgXjZa+sj6rY2CgxuMuWxI5
 vvCsuPflwFRUloZo4apZ06j+dnsQrItS8mzQQPk+ksgE5DOpPwpClftwj5oPym38Po6e
 aaza4J202EnXPYQi/FEM6VrKuH+ohaRFR1awnPraLdIZOO7XFWYFry/Ht/0Pcs4GSvEY
 O+XpQ0VyqWo+2r8/WPlQM0wPhgapYhE0ZSLfw4gFW0zAhxKv3ry7vWEDVhKKDu8Wlpc3
 xXN2reFUUKCtSGmjjWqG6JsCsQ2nUKGR7bDezoTYwS1WRsQTfGkZJvntsWL2bfgWql8Q
 rhCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=Zn8iXtJzLQTfvlg1B5Ug66alU1b6v54dZuHDSVAJ4uw=;
 b=DNUd1CIkmzD/5U5q3qfxh6t4hqWoQEHoM8y0G5x9xySdiK8NdJLruBpYwckJyenQGc
 XfmotJA0ujEBdPcBL8wwgof5b3syPFhunNhqlX90/N2mlVJvba0F4PfMvRA0bAefxFt0
 eb9+8SVn4JzdEfyQXsYbZUmJBrWjtxNoQmbdtJFv2iN41AYHfiXIVi36iOhx/ArEji9J
 EOd3j60bKnQ9aS4EYEAHuLKMKHlC5vUu5fXFL0+Yy1eoGs6rrCC/GkM7flOtQWVd6Wbk
 0S7dg1Bfox819RlIgb74Qirg3Fnj/SZS2XiT3iOKkXmMyCpQu79jxhOMHrwbCXOZGOEL
 7EaA==
X-Gm-Message-State: ACrzQf3gJhWIkdlrTGGPMkfdpJtWIKZrmgbm9wzJQbL+9MlbCHxtq9Yd
 KaBk6xXOyjkzxQsXezkA5yBQ5LA8WY3WiQaFk4k=
X-Google-Smtp-Source: AMsMyM6PiF+Y8BuBaQcDsMNwSbvvz8XbL0YwfcucOn9VHklzV9G4GmE7QCaBNCXvP2nzr1ZNxCBRmMbPbO3Yw4x9O4I=
X-Received: by 2002:a17:907:7fa2:b0:781:ca3d:b385 with SMTP id
 qk34-20020a1709077fa200b00781ca3db385mr8926425ejc.641.1663967054564; Fri, 23
 Sep 2022 14:04:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220923063448.239259-1-ye.xingchen@zte.com.cn>
In-Reply-To: <20220923063448.239259-1-ye.xingchen@zte.com.cn>
From: Han Jingoo <jingoohan1@gmail.com>
Date: Fri, 23 Sep 2022 14:04:03 -0700
Message-ID: <CAPOBaE5FHNUCND1zOr3H7sBw_H7fK8Pvfi+Y=6SQHmkGSt9wUg@mail.gmail.com>
Subject: Re: [PATCH linux-next] backlight: use sysfs_emit() to instead of
 scnprintf()
To: cgel.zte@gmail.com
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
Cc: daniel.thompson@linaro.org, ye xingchen <ye.xingchen@zte.com.cn>,
 deller@gmx.de, lee@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 22, 2022 <cgel.zte@gmail.com> wrote:
>
> From: ye xingchen <ye.xingchen@zte.com.cn>
>
> Replace the open-code with sysfs_emit() to simplify the code.
>
> Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>

Acked-by: Jingoo Han <jingoohan1@gmail.com>

Best regards,
Jingoo Han

> ---
>  drivers/video/backlight/lm3533_bl.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/video/backlight/lm3533_bl.c b/drivers/video/backlight/lm3533_bl.c
> index 1df1b6643c0b..5e2ce9285245 100644
> --- a/drivers/video/backlight/lm3533_bl.c
> +++ b/drivers/video/backlight/lm3533_bl.c
> @@ -66,7 +66,7 @@ static ssize_t show_id(struct device *dev,
>  {
>         struct lm3533_bl *bl = dev_get_drvdata(dev);
>
> -       return scnprintf(buf, PAGE_SIZE, "%d\n", bl->id);
> +       return sysfs_emit(buf, "%d\n", bl->id);
>  }
>
>  static ssize_t show_als_channel(struct device *dev,
> @@ -75,7 +75,7 @@ static ssize_t show_als_channel(struct device *dev,
>         struct lm3533_bl *bl = dev_get_drvdata(dev);
>         unsigned channel = lm3533_bl_get_ctrlbank_id(bl);
>
> -       return scnprintf(buf, PAGE_SIZE, "%u\n", channel);
> +       return sysfs_emit(buf, "%u\n", channel);
>  }
>
>  static ssize_t show_als_en(struct device *dev,
> @@ -95,7 +95,7 @@ static ssize_t show_als_en(struct device *dev,
>         mask = 1 << (2 * ctrlbank);
>         enable = val & mask;
>
> -       return scnprintf(buf, PAGE_SIZE, "%d\n", enable);
> +       return sysfs_emit(buf, "%d\n", enable);
>  }
>
>  static ssize_t store_als_en(struct device *dev,
> @@ -147,7 +147,7 @@ static ssize_t show_linear(struct device *dev,
>         else
>                 linear = 0;
>
> -       return scnprintf(buf, PAGE_SIZE, "%x\n", linear);
> +       return sysfs_emit(buf, "%x\n", linear);
>  }
>
>  static ssize_t store_linear(struct device *dev,
> @@ -190,7 +190,7 @@ static ssize_t show_pwm(struct device *dev,
>         if (ret)
>                 return ret;
>
> -       return scnprintf(buf, PAGE_SIZE, "%u\n", val);
> +       return sysfs_emit(buf, "%u\n", val);
>  }
>
>  static ssize_t store_pwm(struct device *dev,
> --
> 2.25.1
