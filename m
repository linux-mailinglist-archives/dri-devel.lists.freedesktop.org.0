Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9842C1CCE3D
	for <lists+dri-devel@lfdr.de>; Sun, 10 May 2020 23:44:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4F9089F71;
	Sun, 10 May 2020 21:44:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E631F89F71
 for <dri-devel@lists.freedesktop.org>; Sun, 10 May 2020 21:44:23 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id f8so3083097plt.2
 for <dri-devel@lists.freedesktop.org>; Sun, 10 May 2020 14:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:thread-topic:thread-index:date:message-id
 :references:in-reply-to:accept-language:content-language
 :content-transfer-encoding:mime-version;
 bh=TbO75A5Gn8gWHO4gwUNWqoHwkBpk2egJ3kslUHiUBjc=;
 b=Ys8fwHHyoBUtdt4s9CCwekJehrIh/ska7PwkTviYx+3AT7ZT/5ORkSkrZHO/qg9h/P
 c+QTP2XZT/DJniIHP33j9F7b4QpZ4vEysQUJswattEOXJFQGGG/sxegHP4K1rmHemjkY
 QSu7UGL8AdYqIeiI/uRNq0QPETdeLmX7H+nY1ZNRwZQgyV6J9b2vLl8H+BXL3oJ7qPSL
 99oC241UfxIGRlpClQehSF7znp1aCyV4eQM/pEkO8Y1DoeQdXvVATE+QXZLQZ2lxfZBR
 4hEg3L/xzyOLLjMXhmXfDv1/JBAFsurjMrAOpm2TIK+LMdo1ryC+QKL1kzK6GMVfy3uq
 UtzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:thread-topic:thread-index
 :date:message-id:references:in-reply-to:accept-language
 :content-language:content-transfer-encoding:mime-version;
 bh=TbO75A5Gn8gWHO4gwUNWqoHwkBpk2egJ3kslUHiUBjc=;
 b=c1iGE3W8kBlbQoCIzRs50oyBXbFrF3zDrKDBPsiwt4v0AQZOnEPxZISbGKFZm45O9c
 IuZfkNRtq6+toLaKmuJz2HfjaWbJluy9SRl3x7oiGSd2ecBzuCiowR82bD840+KWn/NR
 NaLC+PSgLdiw6TMhwxGUmnfUoaFoaifpxLsx1o45bWy/OlCwQb8BWFvpOaD+YAkh1o2z
 KAvFNTCeT0o8DBidDnQrWk0SJPy9wTCWHPflpPhxo4ELlTJ55blDyUZAzARuQl3v1Txk
 fvyiYFeOqiWYT8UnZW2+JwnHwt2XaU09hPjGAQVgLY7Hg87GT1WeaxD2cy7W7dQjSVBv
 EX9A==
X-Gm-Message-State: AGi0Pua+n8eZ3XyD2Kym3SVfkBaIH1Iw6YmQ/bVsKreeWb3gP6S+80r0
 RrAnokWMunBAZDQWrR/Qk4QTZWBI
X-Google-Smtp-Source: APiQypLpiBUrsTPNHWIeSrqoqJ1lPzhBjZ1nog8zsbMNjYWmqB4S+b7C+ekQ8gXMrQwgkeXU7xQodg==
X-Received: by 2002:a17:90a:9302:: with SMTP id
 p2mr18359448pjo.230.1589147063246; 
 Sun, 10 May 2020 14:44:23 -0700 (PDT)
Received: from SL2P216MB0105.KORP216.PROD.OUTLOOK.COM ([2603:1046:100:22::5])
 by smtp.gmail.com with ESMTPSA id
 j186sm7566456pfb.220.2020.05.10.14.44.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 10 May 2020 14:44:22 -0700 (PDT)
From: Jingoo Han <jingoohan1@gmail.com>
To: =?iso-8859-1?Q?Noralf_Tr=F8nnes?= <noralf@tronnes.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "lee.jones@linaro.org" <lee.jones@linaro.org>
Subject: Re: [PATCH v2 01/10] backlight: Add backlight_device_get_by_name()
Thread-Topic: [PATCH v2 01/10] backlight: Add backlight_device_get_by_name()
Thread-Index: AWZuNzkxnA4fzGnWCrmX5dZ1Wlp95mZuNzkx3D5IIXY=
X-MS-Exchange-MessageSentRepresentingType: 1
Date: Sun, 10 May 2020 21:44:17 +0000
Message-ID: <SL2P216MB0105AD2B905A372B585A2828AAA00@SL2P216MB0105.KORP216.PROD.OUTLOOK.COM>
References: <20200509141619.32970-1-noralf@tronnes.org>
 <20200509141619.32970-2-noralf@tronnes.org>
In-Reply-To: <20200509141619.32970-2-noralf@tronnes.org>
Accept-Language: ko-KR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-Exchange-Organization-SCL: -1
X-MS-TNEF-Correlator: 
X-MS-Exchange-Organization-RecordReviewCfmType: 0
MIME-Version: 1.0
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
Cc: Han Jingoo <jingoohan1@gmail.com>,
 "daniel.thompson@linaro.org" <daniel.thompson@linaro.org>,
 "sam@ravnborg.org" <sam@ravnborg.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/9/20, 10:16 AM, Noralf Tr=F8nnes wrote:
> =

> Add a way to lookup a backlight device based on its name.
> Will be used by a USB display gadget getting the name from configfs.
>
> Cc: Lee Jones <lee.jones@linaro.org>

Please delete this line, because Lee already sent his Acked-by.

> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>

Acked-by: Jingoo Han <jingoohan1@gmail.com>

Best regards,
Jingoo Han

> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> Acked-by: Lee Jones <lee.jones@linaro.org>
> Signed-off-by: Noralf Tr=F8nnes <noralf@tronnes.org>
> ---
 > drivers/video/backlight/backlight.c | 21 +++++++++++++++++++++
 > include/linux/backlight.h           |  1 +
 > 2 files changed, 22 insertions(+)
>
> diff --git a/drivers/video/backlight/backlight.c b/drivers/video/backligh=
t/backlight.c
> index cac3e35d7630..92d80aa0c0ef 100644
> --- a/drivers/video/backlight/backlight.c
> +++ b/drivers/video/backlight/backlight.c
> @@ -432,6 +432,27 @@ struct backlight_device *backlight_device_get_by_typ=
e(enum backlight_type type)
>  }
>  EXPORT_SYMBOL(backlight_device_get_by_type);
>  =

> +/**
> + * backlight_device_get_by_name - Get backlight device by name
> + * @name: Device name
> + *
> + * This function looks up a backlight device by its name. It obtains a r=
eference
> + * on the backlight device and it is the caller's responsibility to drop=
 the
> + * reference by calling backlight_put().
> + *
> + * Returns:
> + * A pointer to the backlight device if found, otherwise NULL.
> + */
> +struct backlight_device *backlight_device_get_by_name(const char *name)
> +{
> +	struct device *dev;
> +
> +	dev =3D class_find_device_by_name(backlight_class, name);
> +
> +	return dev ? to_backlight_device(dev) : NULL;
> +}
> +EXPORT_SYMBOL(backlight_device_get_by_name);
> +
>  /**
>   * backlight_device_unregister - unregisters a backlight device object.
>   * @bd: the backlight device object to be unregistered and freed.
> diff --git a/include/linux/backlight.h b/include/linux/backlight.h
> index c7d6b2e8c3b5..56e4580d4f55 100644
> --- a/include/linux/backlight.h
> +++ b/include/linux/backlight.h
> @@ -190,6 +190,7 @@ extern void backlight_force_update(struct backlight_d=
evice *bd,
>  extern int backlight_register_notifier(struct notifier_block *nb);
>  extern int backlight_unregister_notifier(struct notifier_block *nb);
>  extern struct backlight_device *backlight_device_get_by_type(enum backli=
ght_type type);
> +struct backlight_device *backlight_device_get_by_name(const char *name);
>  extern int backlight_device_set_brightness(struct backlight_device *bd, =
unsigned long brightness);
>  =

>  #define to_backlight_device(obj) container_of(obj, struct backlight_devi=
ce, dev)
> -- =

> 2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
