Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E6194D25E
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 16:42:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B780F10E935;
	Fri,  9 Aug 2024 14:42:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="W6IsRg/v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFF8C10E935
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2024 14:42:40 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-5a156556fb4so2587614a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Aug 2024 07:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723214559; x=1723819359; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=EJ6x68SVn9l/rEaIOjZbaLG4v3ZBQSVdzvMkr4BOLnE=;
 b=W6IsRg/vnwPwlrnvhpJ5K6h1TRWHG6eqA6SidbqrcaBFSjDP1mWqwLGxrBZkkJttO/
 VyP8UXRAgrEdAhG7fG+BYaVaP4aGLxUw5XXGi8gHUetrMaN0qJ37rjlk7EvxRGi0IHQA
 koS8cqm2uix+rb0xvF31+Lx/TxcDoUkB54sUw5DvhHGTBcQsBZg3KomtJ8Bj63X7pz+Q
 UYVs5N87Epi6+c4+fh56/lpAeKeiOaMz1JHNc9KJVI89ZTabJprEoBlVLssFE9kGszTH
 YNiOiNzAsIiBGQTEz1qtIDQ4nLzzVVeys4aSeaGLw0W2bpUwhlCZr+CVVE3RqfbGnQpZ
 5soQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723214559; x=1723819359;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EJ6x68SVn9l/rEaIOjZbaLG4v3ZBQSVdzvMkr4BOLnE=;
 b=vR703PyEHI6OPRbwvZTTO5P6Y2QDwz26TF5/YOc1ym2M183W+TFM1Bi6I0etlJuiIV
 WtEYZ3JrYvhNOjG7qayMN7C2z5BI9Dey/nyqg81Ry2YArAX9GC1PJyE5BIphz8xdG41l
 r4GDyoU05QnYXTFdjsyhCBY4uzNt4nNdB80ria3yo/mwPJSLoDvTP9Z2/pAyt/MO3r7g
 hBBiN4+lQsar8waGAQ4rbZdMgLI09DLiLViFrsMQxwFdaE5mJtUGEL5zOTEN2DdEx0Vd
 TrEkWhf71Ad+aX01+gZKsy6BaY1H0M/MIhg6OnCOpuHYPpypE4BkNjifWfU+RN4Fk0bo
 KpSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAx8ugLLa1mJsxZhV03zSklOln51bZJYXpLWtW2N7eTNHxd5mF79JZoTVazc+56+lc1Rmrdev1DQo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyVXbwCgJ3D6H/Q5jRMOSYhK1K/+db9FwnmlGafQzki91uD4/UY
 He7QNAugK+jUChOOdRpAPf3+5Yg8mzQpbpUNMs20ivOB7hD0K0qGm4d9Y32tI1Q=
X-Google-Smtp-Source: AGHT+IH1TWOy97ETcTplA1MtQKCoS3LFPfum0DPCd6fTTLZAlQKCA2baV4vNFWcjn6rsWNaXtYSuKA==
X-Received: by 2002:a05:6402:848:b0:59e:a1a6:134d with SMTP id
 4fb4d7f45d1cf-5bd0a63f468mr1207333a12.32.1723214558805; 
 Fri, 09 Aug 2024 07:42:38 -0700 (PDT)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5bbb2c1f856sm1580740a12.25.2024.08.09.07.42.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Aug 2024 07:42:38 -0700 (PDT)
Date: Fri, 9 Aug 2024 17:42:32 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] fbdev: omapfb: panel-sony-acx565akm: Simplify
 show_cabc_available_modes()
Message-ID: <aa43c1f8-05bc-4edd-b7ba-474953f28f5c@stanley.mountain>
References: <91fc9049558a4865d441930c8f4732461f478eca.1723110340.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <91fc9049558a4865d441930c8f4732461f478eca.1723110340.git.christophe.jaillet@wanadoo.fr>
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

On Thu, Aug 08, 2024 at 11:46:11AM +0200, Christophe JAILLET wrote:
> Use sysfs_emit_at() instead of snprintf() + custom logic.
> Using sysfs_emit_at() is much more simple.
> 
> Also, sysfs_emit() is already used in this function, so using
> sysfs_emit_at() is more consistent.
> 
> Also simplify the logic:
>   - always add a space after an entry
>   - change the last space into a '\n'
> 
> Finally it is easy to see that, given the size of cabc_modes, PAGE_SIZE
> can not be reached.
> So better keep everything simple (and correct).
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  .../omap2/omapfb/displays/panel-sony-acx565akm.c  | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c b/drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c
> index 71d2e015960c..fc975615d5c9 100644
> --- a/drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c
> +++ b/drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c
> @@ -466,19 +466,20 @@ static ssize_t show_cabc_available_modes(struct device *dev,
>  		char *buf)
>  {
>  	struct panel_drv_data *ddata = dev_get_drvdata(dev);
> -	int len;
> +	int len = 0;
>  	int i;
>  
>  	if (!ddata->has_cabc)
>  		return sysfs_emit(buf, "%s\n", cabc_modes[0]);
>  
> -	for (i = 0, len = 0;
> -	     len < PAGE_SIZE && i < ARRAY_SIZE(cabc_modes); i++)
> -		len += snprintf(&buf[len], PAGE_SIZE - len, "%s%s%s",
> -			i ? " " : "", cabc_modes[i],
> -			i == ARRAY_SIZE(cabc_modes) - 1 ? "\n" : "");
> +	for (i = 0; i < ARRAY_SIZE(cabc_modes); i++)
> +		len += sysfs_emit_at(buf, len, "%s ", cabc_modes[i]);
> +
> +	/* Remove the trailing space */
> +	if (len)
> +		buf[len - 1] = '\n';

I'm uncomfortable with this line.  It assumes we don't overflow PAGE_SIZE where
the original code was careful about checking.  Probably easiest to do what the
original code did and say:

	for (i = 0; i < ARRAY_SIZE(cabc_modes); i++)
		len += sysfs_emit_at(buf, len, "%s%s", cabc_modes[i],
				     i == ARRAY_SIZE(cabc_modes) - 1 ? "\n" : "");

regards,
dan carpenter


