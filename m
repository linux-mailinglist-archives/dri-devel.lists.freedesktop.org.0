Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBF7560A40
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 21:24:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F96410E5F4;
	Wed, 29 Jun 2022 19:24:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C59710E5AF
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 19:24:51 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 h9-20020a17090a648900b001ecb8596e43so426056pjj.5
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 12:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=9Hg6I9zeE2mX7y1Kwp5HGrN9se+daDngQCVeCJN2hQo=;
 b=IHHJXvmt/crKIXOOob5TxusXKYG48k7WLUJj0h+v10ciPM1RhsCmqOXBoekZj7R0in
 lcDNDgYLk15zve9+MfKFmCVEUR1QFTXYSxjdyt6b/dPsZMXlXd1mLmGwguGT+CfHKkJY
 DgL8+s5PHmB3hMHpuQYzciCYdYo/qwe4a0vd+zW1nZN6GowFVcdHenm8Ae547bWX65pa
 cBDSBUiPO/U8NU0+2IzxCNhfh/eQI66knPGRB0TGoK8xqn/r3fdahtllv/YtVZ3PCGAJ
 YWOeCo88hW8ZL23U/iXJOxPde6ZCN7qdlJ1Oxy4YmW7z3ybJey3+jGzgz28EY7CpI+gW
 cpfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9Hg6I9zeE2mX7y1Kwp5HGrN9se+daDngQCVeCJN2hQo=;
 b=b3AFX1FpNACldmXa/2g6chMfRq8h3i283tnS6WJpIb1HRg/QKJqxK0C/O043VXDYlA
 hxMOl6imfRmmwZ4ec/MSdoX59M1ZQLKBXqHsIJFk/3ijMdDrdRUiUP+PsB11ZqHxwcR3
 43HltZ/ZQpJhYwqbQv2DNn/lyeXu4wPg87mOEPDCA6Ip9n2zO5OdPaY3FtrBxL8LddsU
 lXUEZfuGQ7/hAgFZk8kZLw9omlXJa1T8rFHM7ReQ+qYO+JMlqM1LGQgzj/L+4QBIQ7QP
 EenOtGct+ebp9SXRnIZr7WC0tqdMt5fRQV4I3snsBpzcODlYfS1XPTrfZbUGuToOHFMh
 UxLA==
X-Gm-Message-State: AJIora8qjFVfgH/XWfponqcIGgRhiAMH4TYGSibnG2xq6ypZEAQebrPn
 DDQylOIRyW80T0UIWTcqrPWX+aKaD4U=
X-Google-Smtp-Source: AGRyM1suNZW80NIetQIFN9CUqSOhW7hgtVEaYQvk66+tj7YWcjsH7Y/R3tRHlvbsaylnif11ajrgJA==
X-Received: by 2002:a17:90b:1b0e:b0:1ec:e2f6:349e with SMTP id
 nu14-20020a17090b1b0e00b001ece2f6349emr7371203pjb.14.1656530690532; 
 Wed, 29 Jun 2022 12:24:50 -0700 (PDT)
Received: from [172.30.1.37] ([14.32.163.5]) by smtp.gmail.com with ESMTPSA id
 g10-20020a170902934a00b0016a11b9aeaasm11742829plp.225.2022.06.29.12.24.49
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jun 2022 12:24:50 -0700 (PDT)
Message-ID: <3cc21e9d-9d6b-73c2-db6b-2c53413c5300@gmail.com>
Date: Thu, 30 Jun 2022 04:24:42 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 6/6] i2c: Make remove callback return void
Content-Language: en-US
To: dri-devel@lists.freedesktop.org
References: <20220628140313.74984-1-u.kleine-koenig@pengutronix.de>
 <20220628140313.74984-7-u.kleine-koenig@pengutronix.de>
From: Chanwoo Choi <cwchoi00@gmail.com>
In-Reply-To: <20220628140313.74984-7-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Uwe,

On 22. 6. 28. 23:03, Uwe Kleine-König wrote:
> static const struct of_device_id atmel_sha204a_dt_ids[] = {
> diff --git a/drivers/extcon/extcon-rt8973a.c b/drivers/extcon/extcon-rt8973a.c
> index 40c07f4d656e..d1c674f3f2b9 100644
> --- a/drivers/extcon/extcon-rt8973a.c
> +++ b/drivers/extcon/extcon-rt8973a.c
> @@ -647,13 +647,11 @@ static int rt8973a_muic_i2c_probe(struct i2c_client *i2c,
>  	return 0;
>  }
>  
> -static int rt8973a_muic_i2c_remove(struct i2c_client *i2c)
> +static void rt8973a_muic_i2c_remove(struct i2c_client *i2c)
>  {
>  	struct rt8973a_muic_info *info = i2c_get_clientdata(i2c);
>  
>  	regmap_del_irq_chip(info->irq, info->irq_data);
> -
> -	return 0;
>  }
>  
>  static const struct of_device_id rt8973a_dt_match[] = {
> diff --git a/drivers/gpio/gpio-adp5588.c b/drivers/gpio/gpio-adp5588.c
> index e388e75103f4..acb673dc9005 100644
> --- a/drivers/gpio/gpio-adp5588.c
> +++ b/drivers/gpio/gpio-adp5588.c
> @@ -411,14 +411,12 @@ static int adp5588_gpio_probe(struct i2c_client *client)
>  	return 0;
>  }

Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Samsung Electronics
Chanwoo Choi
