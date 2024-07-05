Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 041AF928402
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2024 10:46:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29E0210E155;
	Fri,  5 Jul 2024 08:46:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gqSmC6f6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA88610E09C
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2024 08:46:15 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-42122ac2f38so8621325e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jul 2024 01:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720169174; x=1720773974; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Vqe4KnkOYZvhw0LoLhK32nqj8NEoWKv+/VqzK0jL6Vs=;
 b=gqSmC6f6tLV+i9qjsKNp+kyR7itmFthqIL6/uqJshU8q2drvp47i+8WbbuvBDx1Rdn
 kDdGgNgXk9mo40vr6ldl89tb+RwTjgx92KdEYLSU2VTRqBhXLohUJXkluDjGrEAy8Bjw
 bT95woTduKtDSfMjfLHe+KFbd664wnsHzn5aD/RXoMrnR+BtJk10Hi+HMpkxr9LyXibB
 CIanEz7yqSo2Rv2qy3BmgPmY9PfeyWskSu6m2unhvn41HRIbRmD2pjS8omOwgz/rG08n
 beQHvzflhKLBnI7GFwZAJPtXYDpJuhczxxKI9Z3E1CjDoi0PuaURTW6EFEDdK1tAmYw5
 Yplw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720169174; x=1720773974;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vqe4KnkOYZvhw0LoLhK32nqj8NEoWKv+/VqzK0jL6Vs=;
 b=xMAUS7ok4pjEK/8+YZ16B9b8vKZC723ZHwf8Jr2k4fVkOsY6urgNZ3XvT0qympN3XW
 eib6NQjmuZXFHesRSILgZejvAQAct5Dq9ojAFp2ITfCUkPPnEnvS1pG/GeSHfYKuIPEo
 pDUGi2KgWMyjuGov5RLBlTEoiuQICa6fquL4wsP7YsVbEx/EAQqBrCMD3YbQ2x1xadSd
 MVqyBZjycX6ykomteIWoD+0m+tFKe+7UHdvLq1nwStbka3Txowql+g6w/kTSRUPT0j9t
 Chdg2qNfAvLwRpWG1AljNgm4iJmVnqwJ3/aw6h9nx1j5ZTHgkN/0aPbN462e9VWGsHQE
 +zuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXY7Ic8rOdAOgsDBQ/0NpIVdbXxXY6Zh0HV+odSJvB/bcaIA1Ud1HGqKoq6zhBsfnN1YL4vq9h17XVaXV6gyHZ03bh9keZqZ8Gm8VB16yEJ
X-Gm-Message-State: AOJu0Yz6p0nYHwpp6aDdfGWy6gmweyN/FbhlOUtjDmwc8jK0gGLb0UmN
 hZoBBeWbdfHEUExC5aiNYTQsxaaFJ+KlE+blRoWJpBv3dcLCL4FIa5JNLRAFy/Y=
X-Google-Smtp-Source: AGHT+IHLaWHMsrIEkAGvMoO52ZSCdECYDkbf6R9gSoFbVCf+dsJ9hk2JLjnNeb/U+Qrngj9X8+Z9Iw==
X-Received: by 2002:a05:600c:4f01:b0:425:6290:b11b with SMTP id
 5b1f17b1804b1-4264b197124mr33304105e9.18.1720169174264; 
 Fri, 05 Jul 2024 01:46:14 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4264a25181asm53763085e9.30.2024.07.05.01.46.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jul 2024 01:46:13 -0700 (PDT)
Date: Fri, 5 Jul 2024 09:46:12 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: lee@kernel.org, jingoohan1@gmail.com, deller@gmx.de,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] backlight: l4f00242t03: Add check for spi_setup
Message-ID: <20240705084612.GA110803@aspen.lan>
References: <20240705083834.3006465-1-nichen@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240705083834.3006465-1-nichen@iscas.ac.cn>
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

On Fri, Jul 05, 2024 at 04:38:34PM +0800, Chen Ni wrote:
> Add check for the return value of spi_setup() and return the error
> if it fails in order to catch the error.
>
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
>  drivers/video/backlight/l4f00242t03.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/video/backlight/l4f00242t03.c b/drivers/video/backlight/l4f00242t03.c
> index dd0874f8c7ff..a4e27adee8ac 100644
> --- a/drivers/video/backlight/l4f00242t03.c
> +++ b/drivers/video/backlight/l4f00242t03.c
> @@ -166,6 +166,7 @@ static const struct lcd_ops l4f_ops = {
>  static int l4f00242t03_probe(struct spi_device *spi)
>  {
>  	struct l4f00242t03_priv *priv;
> +	int ret;
>
>  	priv = devm_kzalloc(&spi->dev, sizeof(struct l4f00242t03_priv),
>  				GFP_KERNEL);
> @@ -174,7 +175,9 @@ static int l4f00242t03_probe(struct spi_device *spi)
>
>  	spi_set_drvdata(spi, priv);
>  	spi->bits_per_word = 9;
> -	spi_setup(spi);
> +	ret = spi_setup(spi);
> +	if (ret < 0)
> +		return ret;

Good change but please add a dev_err_probe() here to match the other
error paths in this function.


Daniel.
