Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE558959233
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 03:33:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA61E10E463;
	Wed, 21 Aug 2024 01:33:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="O+JBTyS1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA72010E463
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2024 01:33:05 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-710e39961f4so4215814b3a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 18:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724203985; x=1724808785; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Ftd1IDF8uP3S8XVIxFMU0f4TBPiPOQnJZcwvztab0TI=;
 b=O+JBTyS1dvPMfz4B69Trqg03LBbyCYPpcxu+6ikV+n41JntNcUBHLD4nNobpbbrx74
 EywywF2EQgXN9UM6mN1b2E0MgvMcfGtUFeDTyYG0KONRo6xx/54M23/pcIrQOVxWxI7r
 4mUv6dLCVkAYPO1OeNkoEhriPXcIouCVWdwNyBjsiX8ZahgymzJs7dECPfj8WvJAY5jM
 VxpXEby834pSh3ZuXNf9PXS+k83U6NbldEHVH2tHq080i20UX/HbRuK07Ta2zCIdDXct
 hq2xJOzdzcqSBwwZlyB7RYamLCw5Bsu21y7bKmcnIyYk9yHRaQWqfKr5mWKsNtCtCNoQ
 m5mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724203985; x=1724808785;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ftd1IDF8uP3S8XVIxFMU0f4TBPiPOQnJZcwvztab0TI=;
 b=f0GMH0R0s058dg/fsN1zmjmr5cdMpS0fSKCDwG/zizz56q5jfr/yvWqf2YRZk+8OFO
 cgvFUk2hJvE1kZt1pRfoLz8lEVXdiFdysITS3SKrC3sLFRgRJt+tGAVbw2SHmhQEnC8G
 d5xFkYzH9m1COUsMFGE8cRC6fQDS5xUB+/o4R6yWbvP5ItmBJm+gPSY6tvMJbhBLo3Mc
 3J1ftdyTcy+NBcnwBKe4d0MQ+MVXjqBJhgmF0JxQCXIS+m8fb44V4bQJDUffyIx8h/R9
 BSIWMbMHhDkM+at3TT84Gd/KEWHywS5aUUAHMQbN/+ZAJR/1pgXDG/r9YwnF4hD06Z7w
 2IEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5AQFQhRpDbEyUQXdW6Jor8DzrgZWHMGhA18gZMopVLC+MyRMmidatNLCvcbII2xz87OI11wfJyF0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyyDq069PdArF5rmIfyCRTWPktqCGCZyRpLN3RniFi4exGwmgbP
 x2xPmMfHcot3SuZuWwgc3YHEnWBY9pC2SMb4/16Sgiaia+bVCCZ+
X-Google-Smtp-Source: AGHT+IGgq8Bs1TaJCeHCZ10a7+TD9emDRmGLEWIF2iln3CIQrIJw0tE0RlKdDODRSGOnPKl4rDw6HA==
X-Received: by 2002:a05:6a00:10c1:b0:713:e70e:f7ea with SMTP id
 d2e1a72fcca58-71423484c49mr982638b3a.7.1724203985277; 
 Tue, 20 Aug 2024 18:33:05 -0700 (PDT)
Received: from localhost.localdomain ([117.189.239.180])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7127af18621sm8844478b3a.153.2024.08.20.18.33.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2024 18:33:04 -0700 (PDT)
Date: Wed, 21 Aug 2024 09:32:57 +0800
From: Jianhua Lu <lujianhua000@gmail.com>
To: Liao Chen <liaochen4@huawei.com>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com, deller@gmx.de
Subject: Re: [PATCH -next] backlight: ktz8866: fix module autoloading
Message-ID: <ZsVDyadlVGR2NrHA@localhost.localdomain>
References: <20240820121628.42321-1-liaochen4@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240820121628.42321-1-liaochen4@huawei.com>
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

On Tue, Aug 20, 2024 at 12:16:28PM +0000, Liao Chen wrote:
> diff --git a/drivers/video/backlight/ktz8866.c b/drivers/video/backlight/ktz8866.c
> index 2e508741c0af..351c2b4d63ed 100644
> --- a/drivers/video/backlight/ktz8866.c
> +++ b/drivers/video/backlight/ktz8866.c
> @@ -190,6 +190,7 @@ static const struct of_device_id ktz8866_match_table[] = {
>  	},
>  	{},
>  };
> +MODULE_DEVICE_TABLE(of, ktz8866_match_table);
>  
>  static struct i2c_driver ktz8866_driver = {
>  	.driver = {
> -- 
> 2.34.1
> 

Reviewed-by: Jianhua Lu <lujianhua000@gmail.com>
