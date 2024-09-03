Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A402D96A14C
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 16:55:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D792E10E5C7;
	Tue,  3 Sep 2024 14:54:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="EC2ksVqD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B0A410E0EA
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 14:54:58 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-58ef19aa69dso5032068a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 07:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725375296; x=1725980096; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=db2ndbu/vXCNONnSDu1Fc7RY2m2odGGHeBIDFICLit8=;
 b=EC2ksVqDx9SJr+Ej5BlE1jVDkXV5akfmkBzWLXHiHKgwgJb2+YIMtbjyCcjpcFXJQX
 IBDIgkvQwlHJ9W7f70B0iddRnEC9Dww3/mZ7W3C0dVEKUT/mcgJheKFF6docU0YhE/at
 VOAqAaPkqALkIZ4CD2rgPn2hnXl6XsOiBGDEKrRVbD0+65dJL+i2KQ0V27XK0l/Aos3E
 rJIuJT6da5bVNmb1DzVR8w6hwlUDspBMyKOualCENNSMKBMCLYgrhrh3/odK1xM9l9vq
 uoSdS0kJfV5Pnt9ssquD5tlrgmq4KlBBsyqpIEhNRbmAFQhxpmszz+R7ruiZ2+y18+Kf
 aMHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725375296; x=1725980096;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=db2ndbu/vXCNONnSDu1Fc7RY2m2odGGHeBIDFICLit8=;
 b=r637h3xsnJOM1uhCNpnbH6DFyBNzds7giEb2KgR8HrgUQE9jM8ZFbe1Ht7JLU3wCSF
 TRcCNQ6bkFIeupSgJ2+iuEM/P9ro5krTl83+lgF1keBY2bS+KuA5uFLicmMvaZ3uqV/d
 F6LaGMDRHRAuohItw5zgSLH/9h3bZ4eJerYOftclX+xPXGdaTxF5/qTjEOKXkOhhCzpu
 lpN28VNip0MbxQIXC/OxnsNtf9A8ULoEQZfAR2Reg3+I9gA+ipyeMFQB0gMLKdrPFL7t
 Sdsd4ADr9RSd3ZtgCPZfdw3k9G8bXOIx7gfZiS653/uGKSPnLar3D44gqBsiKsbIjm/W
 YiuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPaS6UdqSlaOyncSUYSiex/Y82tAB9O/mg/RHuOkObK7nTBHKCjORzqPO7/IYpTl1Ok3kYW56I0VE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz40W+bpWb+Grm76+FtRoRePX0eBxX7SGowtfSuMedH5qq74gPO
 opEvCjZm2n+bT2XvJopYu1d+eVa5CD3+Gkd3burDRJj6jZ67URsktro9WOgNho4=
X-Google-Smtp-Source: AGHT+IEyUf/v4h/Ijd2K+a2Wjxfx10xMb/xv27U7b2cAgzUjpyJE1MBmrex/8Ky5wCP/si8xCkynyw==
X-Received: by 2002:a17:906:6a0a:b0:a86:6858:8a8f with SMTP id
 a640c23a62f3a-a89b94cef4amr833383966b.26.1725375296428; 
 Tue, 03 Sep 2024 07:54:56 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8989196a86sm691362066b.127.2024.09.03.07.54.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 07:54:56 -0700 (PDT)
Date: Tue, 3 Sep 2024 15:54:53 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: lee@kernel.org, jingoohan1@gmail.com, deller@gmx.de,
 bonbons@linux-vserver.org, jikos@kernel.org, bentiss@kernel.org,
 shc_work@mail.ru, s.hauer@pengutronix.de, kernel@pengutronix.de,
 shawnguo@kernel.org, festevam@gmail.com,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-omap@vger.kernel.org
Subject: Re: [PATCH 01/28] backlight: lcd: Rearrange code in
 fb_notifier_callback()
Message-ID: <20240903145453.GC12939@aspen.lan>
References: <20240820093452.68270-1-tzimmermann@suse.de>
 <20240820093452.68270-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240820093452.68270-2-tzimmermann@suse.de>
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

On Tue, Aug 20, 2024 at 11:22:39AM +0200, Thomas Zimmermann wrote:
> First aqcuire the ops_lock and do al tests while holing it. Rearranges

s/aqcuire/acquire/
s/al/all/

> the code in lcd's fb_notifier_callback() to resemble the callback in
> the backlight module. This will simplify later changes to these tests.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/video/backlight/lcd.c | 24 ++++++++++++++----------
>  1 file changed, 14 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/video/backlight/lcd.c b/drivers/video/backlight/lcd.c
> index ceec90ca758b..0cd0fa1b24f9 100644
> --- a/drivers/video/backlight/lcd.c
> +++ b/drivers/video/backlight/lcd.c
> @@ -29,21 +29,25 @@ static int fb_notifier_callback(struct notifier_block *self,
>  {
>  	struct lcd_device *ld;
>  	struct fb_event *evdata = data;
> +	struct fb_info *info = evdata->info;
>
>  	ld = container_of(self, struct lcd_device, fb_notif);
> +	mutex_lock(&ld->ops_lock);
> +

guard(mutex)(&ld->ops_lock); and eliminating all the goto code would be
better here but not a huge deal.



Daniel.
