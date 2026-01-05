Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C51BCF42DE
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 15:39:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 643C010E418;
	Mon,  5 Jan 2026 14:39:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="PRkXbSPE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13CD910E04E
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jan 2026 14:39:39 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-42e2ba54a6fso6070860f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Jan 2026 06:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1767623977; x=1768228777; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ljlfQTMdubiXy6Trb6w37rOF+8B2DpqBmlsGz29D7zE=;
 b=PRkXbSPEmvAHx9QgD4tgupV9n/YQxIaMSAyvTOEbrsNHnodxsNPiPLtHDCiG2xEak8
 JeKaGShzzo1qY20bpb+C91ot3/rnh3djqNPkBhfQVTRyJllukqsJEJkmIwCoNDYFY1t6
 MIi6WHTlV7MSsxYLqPhqLOnzP5arCIUdeF+24r84mkd4/jdc9A/km+/QE5qFkVoAI9hT
 u8GvMIZ/efefkwGDZz23xI6HaOXJVcLCirRrMcBL15P8uPkJEm3TScm6X4KcylZNEBCs
 QZ4WOgviNfoUklnZz4jk8e0XP2jLN2/fcnN30VG7Kykpn5+VyHbM6ocgpkgLh7Jdur2o
 VVKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767623977; x=1768228777;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ljlfQTMdubiXy6Trb6w37rOF+8B2DpqBmlsGz29D7zE=;
 b=sq0tur+lyG1epnf16V4rxAegMFoor95bGH4br/3t1QY2/cUjcfoFqcyB498RffIoVN
 8wq+vBgouWvhTMQPiPdPoATmMvVSu0VxsD/pHV6YfDnm9MfYeEhAf8x8Z4Q93c9Sof+R
 +6Unkzb553Gyd8gF/1+p7nN70RwFFPyfI80Eb6qVLhogpbFYZC5bhXLMc2gU+6MSvnxH
 VB0kuPjj+iXiQeFtfGOfmaeWBY0/PK72IkCVtmmEefI8mlIAQ+Q2OXeyVTX6YKpNGlGg
 TakwYbvoPnVTzxAqSw0wCyfjmpAlx2y2lXhefjRIfjEjBz0/52QHjWH1Kvn6myrkMC1d
 6Dmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5y3y136iKd9CzDvXL+oBbVkBTolS5mwpR2W4dD1wtFdWCGKWAPPFkX3ysuu1gqQoGeG6BDS09OcE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyVSVE9y1poAKlSj10B37ypoW56S99fVLxt89R5vt6pnp/g9uMX
 4puPhtmFbK1sS4muys5MRCixvOAC8ZVbBwY3Td0eSqIGTGSJ5wXgL/O6tfxQIbxaQkY=
X-Gm-Gg: AY/fxX7h553iePQFomqQZikjT50TggkKUiJ0o70IX5fsnyiMuUKEVrZof6ljmb0p2ju
 f/EeBgPXDq1oXOBj2clk2vZh8E145/5ml7PUGX5ymjEcoO+vlutLyUH4zG87W+5IYdncDX0fUj6
 xlTo2Rj/sLp0eEJTQLa1RwxTWVk7CTfdwwFsSRcZ+487weyJ9dIWNP1BCJqeIRZKZ40Hx/CmMDq
 mWtyLRyHTbpbUd1ql0Y6YydfFDHywxEkiWbMX1Q+sATuDJfWV+cJXnl0+shyiO/NNRX8AjiD5N1
 9lFW8GjLwI9Kd8XmNmiN7SuRzkoz4IHI6equRdE8Dc6ceBdw0L9vjCPY2js4A8qb0kzjSAfEHRY
 dzjJBNFqV9I2sXhZ/OQLNWOKAsLkPwyytcCZoOyS3//it0bWNQNeuRKsIaHRM/nbRTYHdEmLIoN
 5BnrfHheBaxco0cbdk
X-Google-Smtp-Source: AGHT+IHi6fS0MK2Kosi15XiBw2e95XkRVwWYbIeQ5N6L4qMRxWQV+A5hUru6upLl+PEiAB1wfKiYMw==
X-Received: by 2002:a05:6000:220b:b0:430:fbce:f382 with SMTP id
 ffacd0b85a97d-4324e4d04d4mr60068477f8f.25.1767623977366; 
 Mon, 05 Jan 2026 06:39:37 -0800 (PST)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324ea1afbfsm102065572f8f.9.2026.01.05.06.39.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jan 2026 06:39:36 -0800 (PST)
Date: Mon, 5 Jan 2026 17:39:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sun Jian <sun.jian.kdev@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v1 2/4] staging: fbtft: ssd1351: send gamma table via
 fbtft_write_buf_dc()
Message-ID: <aVvNJV93mprLcZwy@stanley.mountain>
References: <20260104110638.532615-1-sun.jian.kdev@gmail.com>
 <20260104110638.532615-3-sun.jian.kdev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260104110638.532615-3-sun.jian.kdev@gmail.com>
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

On Sun, Jan 04, 2026 at 07:06:36PM +0800, Sun Jian wrote:
> Clang reports a large stack frame in set_gamma() (-Wframe-larger-than=1024)
> due to the large write_reg() call emitting 63 gamma bytes via varargs.
> 
> Send the command byte (0xB8) and the gamma payload using
> fbtft_write_buf_dc() to avoid the varargs/NUMARGS stack blow-up.
> 
> No functional change intended.
> 
> Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
> ---
>  drivers/staging/fbtft/fb_ssd1351.c | 35 +++++++++++++-----------------
>  1 file changed, 15 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/staging/fbtft/fb_ssd1351.c b/drivers/staging/fbtft/fb_ssd1351.c
> index 6736b09b2f45..b4ab2c81e528 100644
> --- a/drivers/staging/fbtft/fb_ssd1351.c
> +++ b/drivers/staging/fbtft/fb_ssd1351.c
> @@ -119,43 +119,38 @@ static int set_var(struct fbtft_par *par)
>   */
>  static int set_gamma(struct fbtft_par *par, u32 *curves)
>  {
> -	unsigned long tmp[GAMMA_NUM * GAMMA_LEN];
> +	u8 data[GAMMA_LEN];

Ugh...  GAMMA_NUM is 1 so this is an annoying calculation.  So what
this does is it changes the type from unsigned long to u8 and renames
the variable.  I am fine with renaming the variable it's unrelated and
makes the review harder.

> +	u8 cmd = 0xB8;
>  	int i, acc = 0;
> +	int ret;
>  
> -	for (i = 0; i < 63; i++) {
> +	for (i = 0; i < GAMMA_LEN; i++) {

GAMMA_LEN is 63.  So this looks like a change, but it's an unrelated
cleanup.

>  		if (i > 0 && curves[i] < 2) {
>  			dev_err(par->info->device,
>  				"Illegal value in Grayscale Lookup Table at index %d : %d. Must be greater than 1\n",
>  				i, curves[i]);
>  			return -EINVAL;
>  		}
> +

This is an unrelated white space change.

>  		acc += curves[i];
> -		tmp[i] = acc;
> +
>  		if (acc > 180) {
>  			dev_err(par->info->device,
>  				"Illegal value(s) in Grayscale Lookup Table. At index=%d : %d, the accumulated value has exceeded 180\n",
>  				i, acc);
>  			return -EINVAL;
>  		}
> +
> +		data[i] = acc;

Here we move the acc assignment after the sanity check, but it's just
an unrelated cleanup.

>  	}
>  
> -	write_reg(par, 0xB8,
> -		  tmp[0],  tmp[1],  tmp[2],  tmp[3],
> -		  tmp[4],  tmp[5],  tmp[6],  tmp[7],
> -		  tmp[8],  tmp[9],  tmp[10], tmp[11],
> -		  tmp[12], tmp[13], tmp[14], tmp[15],
> -		  tmp[16], tmp[17], tmp[18], tmp[19],
> -		  tmp[20], tmp[21], tmp[22], tmp[23],
> -		  tmp[24], tmp[25], tmp[26], tmp[27],
> -		  tmp[28], tmp[29], tmp[30], tmp[31],
> -		  tmp[32], tmp[33], tmp[34], tmp[35],
> -		  tmp[36], tmp[37], tmp[38], tmp[39],
> -		  tmp[40], tmp[41], tmp[42], tmp[43],
> -		  tmp[44], tmp[45], tmp[46], tmp[47],
> -		  tmp[48], tmp[49], tmp[50], tmp[51],
> -		  tmp[52], tmp[53], tmp[54], tmp[55],
> -		  tmp[56], tmp[57], tmp[58], tmp[59],
> -		  tmp[60], tmp[61], tmp[62]);
> +	ret = fbtft_write_buf_dc(par, &cmd, 1, 0);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = fbtft_write_buf_dc(par, data, sizeof(data), 1);
> +	if (ret < 0)
> +		return ret;

These are good changes.  Just change the type from unsigned long to u8
and use fbtft_write_buf_dc() instead of write_reg().  Then do the other
changes in a separate patch.

Same for the other patches.

regards,
dan carpenter

>  
>  	return 0;
>  }
> -- 
> 2.43.0
> 
