Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D647C7F31F8
	for <lists+dri-devel@lfdr.de>; Tue, 21 Nov 2023 16:09:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCDE210E4D9;
	Tue, 21 Nov 2023 15:09:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5F0110E4D9
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Nov 2023 15:08:58 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4079ed65471so27062155e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Nov 2023 07:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700579337; x=1701184137; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=nae4JbWQBA2aia/B95hNasr3I++DT3K8V5bSC8i7lEI=;
 b=y7VkkQWTMLYhVum+fGYis0/l8ZPGp4qw7p4kaA3GYhR+Q4RvqIzN5fybwpdZfdQ3IV
 ormJLNapXKem+imrWnZTKCQMPtpn9c9l3+PXq4nhrwBWOOWvV1wfAjADRhEJj6kgmwCQ
 xJ2kSr0FHEJvVdvWUgDES5ZPNRFFzxA+kodvpKU2YN8tEcq5soMHrZ04BadnOiJm7iue
 lONbuAGn5YS3TOba4sr9Fdk4WDlgrlYcUzA8BoIzlVNkhcdRxohvDdMVgdkdEPIDpFgx
 WUrhG6APLmC2htFlj3lEHpPDAb0dAkokcVOgNhxhCxiLh/rPuYKee9THAALkc4VR429/
 HHqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700579337; x=1701184137;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nae4JbWQBA2aia/B95hNasr3I++DT3K8V5bSC8i7lEI=;
 b=RgMGlahKdXqdBM2JZAgeVx/KGBlswWkg7cdI0Q5IfK1Nt2BlCSqLReNbXp+fzKGxqE
 p5Wfnr60pjY1xPe4L/kpC+RMCHY1I/Pye8CNDY0ZprOZisVK/O0+njggUJuA6hl4IjFy
 +GI6C5VvwsEucgnXemOjLTwRU4QicWS/yVZ5dJvI3ABC7OM/laazR79FWa/yR8Wf8E1k
 wS6Ded320qQHGyGc25YGQVPeyqrzaJZ8mq+oq43FzTc+JwJJkp7WZLA93BbIzaMynXRl
 9cMWg49iqT2KKEY7zWOoRRfBY5Ail3NeYRFIXjmEZEeQqsxyOxjT3xLWmP70V6GEtATZ
 6T4A==
X-Gm-Message-State: AOJu0Yyh+Av6dMYfogGYCL3E63AA6g5HDHoSdc1AhyasvF4u02fNe3Fk
 9qJkU2xfsM7xuVoc3CIlHzGCBA==
X-Google-Smtp-Source: AGHT+IH55XwOpCbTpm2nlb6uk8LPDmWMNuN4gHEZr7xfOXoov1mRLB8htGKYmkK0xC2O/BYriy6t0w==
X-Received: by 2002:a05:600c:4ed2:b0:405:4a78:a890 with SMTP id
 g18-20020a05600c4ed200b004054a78a890mr8499401wmq.8.1700579337271; 
 Tue, 21 Nov 2023 07:08:57 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 l6-20020a05600c4f0600b004068495910csm21858114wmq.23.2023.11.21.07.08.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Nov 2023 07:08:56 -0800 (PST)
Date: Tue, 21 Nov 2023 15:08:54 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH v3 1/1] backlight: pwm_bl: Use dev_err_probe
Message-ID: <20231121150854.GC4740@aspen.lan>
References: <20231117120625.2398417-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231117120625.2398417-1-alexander.stein@ew.tq-group.com>
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Lee Jones <lee@kernel.org>, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 17, 2023 at 01:06:25PM +0100, Alexander Stein wrote:
> Use dev_err_probe to simplify error paths. Also let dev_err_probe handle
> the -EPROBE_DEFER case and add an entry to
> /sys/kernel/debug/devices_deferred when deferred.
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
