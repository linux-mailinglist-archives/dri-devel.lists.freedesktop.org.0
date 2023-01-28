Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4D767F766
	for <lists+dri-devel@lfdr.de>; Sat, 28 Jan 2023 11:55:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FA1F10E0CB;
	Sat, 28 Jan 2023 10:55:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B04C810E1BF
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jan 2023 00:36:34 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id 7so4270832pga.1
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 16:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ngV2jAGcgKwPSxDB2msvOATMdg/kRpFsQ26PeRK1jug=;
 b=m9X1jv951hwBD3MZBWTQAcNlGw3flk6sMAyZVZZRqlRscJuqw2DwpTSw/xfMmVSIfx
 CFMKrim0x0ZmiFQt7Icr/sLlAIOW5hoPT8UB4qZ60tmN1640ULybNfiDbXms2YtMJ3sF
 buj5iN62M6ldybUZOSlz0adAoTdyUQmthjx+C+/mN4BEr2zVLR+dz/cboTIzXdEks+Mi
 HgGTfS5f7cyzSQ7FhBX95d7qnr0lVx3wQXL8t2q505eK0rCvANgv3noDjDu3uzhRkBMe
 5BkYsWrtBWCKePagJR6j3+Kg2orAzjzCA4FHwjF677sYHllpPvwae/C5fxVJ6hhjqKDx
 Ducg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ngV2jAGcgKwPSxDB2msvOATMdg/kRpFsQ26PeRK1jug=;
 b=Cvyhih86UMPa+T9Zw19s4qZH1c5+B4V5DiRfc+DQCohFz2i+Mp8sNyV81D4u4GqE7o
 xS2H3VqncG6ZYIfoJAxRykFsthwM3VKNA31LzHMzLxO/03d8to9X7OTSk1kOcF/SfGos
 XRUwdkkX5utt7apsTP1METRNlelm2nd7Sx7QYD1hVfmCK6LL2To81PIvebcsa2MsEvs/
 qbKzQyPWC6ZE3w5PCwHiMAjsZ5q+n16jGqrDlwXxb5CxYYUmWTR8XvSDVw5VSipFE/Qr
 yisK5piyd83SZJMu/UnZ97ewU5DZ6kPVCEGyTPrTIEQxSZOHOGsXs0ZMtDewZw6PMR07
 ABFA==
X-Gm-Message-State: AO0yUKW0sauhg2Ln7TLhiy7XDBt3pCWuDwYoO98Bw4SvLt4gBrVSJg1c
 UXTFaARJ8YfmgT9XBYC5lY0=
X-Google-Smtp-Source: AK7set9FzMVNmBNdTaaLUnX4dSm57huamq9DYZIItfdDqoBW7fFmyr0gJVoH0f042wmyq6geVVZLnA==
X-Received: by 2002:a05:6a00:2406:b0:590:6ff5:5704 with SMTP id
 z6-20020a056a00240600b005906ff55704mr10616570pfh.8.1674866194244; 
 Fri, 27 Jan 2023 16:36:34 -0800 (PST)
Received: from Gentoo (n220246252084.netvigator.com. [220.246.252.84])
 by smtp.gmail.com with ESMTPSA id
 o23-20020aa79797000000b00580978caca7sm3215472pfp.45.2023.01.27.16.36.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 16:36:33 -0800 (PST)
Date: Sat, 28 Jan 2023 08:36:28 +0800
From: Jianhua Lu <lujianhua000@gmail.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] backlight: ktz8866: Convert to i2c's .probe_new()
Message-ID: <Y9RuDM9VAMBzj4vd@Gentoo>
References: <20230127152639.1347229-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230127152639.1347229-1-u.kleine-koenig@pengutronix.de>
X-Mailman-Approved-At: Sat, 28 Jan 2023 10:55:32 +0000
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Lee Jones <lee@kernel.org>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 27, 2023 at 04:26:39PM +0100, Uwe Kleine-König wrote:
> The probe function doesn't make use of the i2c_device_id * parameter so
> it can be trivially converted.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
> Hello,
> 
> there is an ongoing effort to convert all drivers to .probe_new to
> eventually drop .probe with the i2c_device_id parameter. This driver
> currently sits in next so wasn't on my radar before.
> 
> My plan is to tackle that after the next merge window. So I ask you to
> either apply this patch during the next merge window or accept that it
> will go in via the i2c tree together with the patch that drops .probe().
> 
> Best regards
> Uwe
> 
>  drivers/video/backlight/ktz8866.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/video/backlight/ktz8866.c b/drivers/video/backlight/ktz8866.c
> index 97b723719e13..d38c13ad39c7 100644
> --- a/drivers/video/backlight/ktz8866.c
> +++ b/drivers/video/backlight/ktz8866.c
> @@ -124,8 +124,7 @@ static void ktz8866_init(struct ktz8866 *ktz)
>  		ktz8866_write(ktz, LCD_BIAS_CFG1, LCD_BIAS_EN);
>  }
>  
> -static int ktz8866_probe(struct i2c_client *client,
> -			 const struct i2c_device_id *id)
> +static int ktz8866_probe(struct i2c_client *client)
>  {
>  	struct backlight_device *backlight_dev;
>  	struct backlight_properties props;
> @@ -197,7 +196,7 @@ static struct i2c_driver ktz8866_driver = {
>  		.name = "ktz8866",
>  		.of_match_table = ktz8866_match_table,
>  	},
> -	.probe = ktz8866_probe,
> +	.probe_new = ktz8866_probe,
I think .probe_new() will be renamed to new .probe() again when there are
patches dropping old .probe(). I prefer that you pack this commit to the
i2c-tree commit that drops old .probe(). 
>  	.remove = ktz8866_remove,
>  	.id_table = ktz8866_ids,
>  };
> 
> base-commit: 2241ab53cbb5cdb08a6b2d4688feb13971058f65
> prerequisite-patch-id: 2e7d7db8c0a90b8cd1deb6bbc51ead4c89c89b62
> -- 
> 2.39.0
> 
