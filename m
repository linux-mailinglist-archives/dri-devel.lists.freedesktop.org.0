Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3F59EE6FC
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 13:45:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D3FE10E439;
	Thu, 12 Dec 2024 12:45:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cY8r67GY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BFD410E439
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 12:45:19 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4361b6f9faeso3566215e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 04:45:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734007518; x=1734612318; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=b0MIlrd8hgKTeaMZkhqf3o5F9gaR/A/34B2prwrX9Lc=;
 b=cY8r67GYlrn0CjLC8DNGPggca8KcMvMgtbtxPfGJkdvTWlxPIbBCPemaiOm2qSYMAv
 Z6/L889kQH2Tl/d7MaufW+3ko78eG78bORgYerirK3cSrbL1WUjcy/trG2WbvcVDACYX
 oQoVTn7uLvyvUKsnB0gyuxdXDTyiJ46ONdVdJ2B8L/HZtVuWkY266F3bcII38bc8UF0M
 D0IKav/PAW+tqRzDrUozB5jtrDazBO7nT6FBZH0YmH6wdDwBPikxDJIadQgJ6T5fjH67
 Fxystg7+7gC0Q3E4ge8P8WDnbp6j7K47tWWUlWHWLNByayrpBhO4jP43/8vObjr9TicW
 rc6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734007518; x=1734612318;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b0MIlrd8hgKTeaMZkhqf3o5F9gaR/A/34B2prwrX9Lc=;
 b=AYvh4XuLyX3DShy5rILYLEVdb6oBJfkPtb80xVVPN6/LWWlpPsANhHBtCF94+UVRHB
 ITmz1lP3n3AMWHwq1rFPiO7GfiFSkdgRHn3Hj0G6fFENeEKKyGZMmgx00zW3d46hphw/
 QLsSttni8TsfCGCmKQHqaSl4SVpGAS2/X0SY83oWPf0RxgfwHqSl7HUROLvLmxFrunoD
 oOpEeP8CkEuPmtsg8P/YPhJanN8mbSHpolwrt+WWg8kK6G1CUGpyGdwKRtMgWTQYFH3l
 ucnq1YI5beu+F5TptC+x+TyAKL7ucVNYtpwrIW4hCTqncMo1/Nsg8YQ3dF9n78EMDAqX
 ljVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVF0zZ7/RHrgFV2kT1Ywhk1EdYWLpeUU4djgUGuFcywToz1VoHIdWUBrgBA68gi9Q/GOpZBlGdqkw8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzdQnDE8Ga9makRXZb1t0GU8tloiUdaFAJkfQuK/HUDQ0KT3Qm7
 FDJIVXLCWSa+GrpEJIXkXCEsGVmINDyQFfQLO0vmZIn6KlGy/ZeVw56KRagdRg8=
X-Gm-Gg: ASbGncvS/9lvuQ0PccupJ1vLewPURnL9tEWI4XEiZMANEIepWpjU3yab5lMXfW96jD+
 DLNy6CsQBpby8p/hjA4DbXI4EVxLt85uw6hRZ4FaGD1aES2fNOFqVJxyIUILMmMI2a8JR9XaS61
 kyLIXGKLN9Q+tpHPPHK0Q87vINjyoRBAkC2MVgs8aDc4vnl/hN6p3n6dsCEAI0yc+fYXLAwVrm/
 u7eUClEmPRpMVy9tY4QxzEq2ndoz4DGN7ggDWrMf5gN6pS3R83Y4LVYJwn2Iw==
X-Google-Smtp-Source: AGHT+IEyNpazD7YeXxHYvPwjQS+Xs0/1F2YZVhWJvmtRAVKWT7Dsk7UichfBnzoTMoxDG9nSIZeQ6Q==
X-Received: by 2002:a05:600c:34c6:b0:434:fe3c:c662 with SMTP id
 5b1f17b1804b1-4362310c025mr22321795e9.12.1734007516330; 
 Thu, 12 Dec 2024 04:45:16 -0800 (PST)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43625716e5csm15409365e9.36.2024.12.12.04.45.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2024 04:45:15 -0800 (PST)
Date: Thu, 12 Dec 2024 15:45:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Maxime Ripard <mripard@kernel.org>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] drm/vc4: unlock on error in
 vc4_hvs_get_fifo_frame_count()
Message-ID: <92dfd6cd-2e10-4606-9502-3619c4b265a0@stanley.mountain>
References: <02c87d9c-76b8-4d93-b0da-0e4f7d4952ae@stanley.mountain>
 <CAPY8ntD9XzrzrhX=1XojjcZmRm60KLc39HZq0bJ9cEq0J7nQ9g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPY8ntD9XzrzrhX=1XojjcZmRm60KLc39HZq0bJ9cEq0J7nQ9g@mail.gmail.com>
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

On Thu, Dec 12, 2024 at 11:54:28AM +0000, Dave Stevenson wrote:
> I don't know how others feel.

These days we have "warning: this statement may fall through
[-Wimplicit-fallthrough=]" which triggers a build failure so fallthrough
bugs are pretty rare.

But I only care about *your* opinion, Dave.  Everyone else can bounce.

I'll send a v2 which adds the break.

regards,
dan carpenter
