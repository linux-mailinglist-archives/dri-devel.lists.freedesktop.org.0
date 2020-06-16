Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCA71FAFED
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jun 2020 14:12:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD0776E8B2;
	Tue, 16 Jun 2020 12:12:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34A5C6E8B2
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jun 2020 12:12:48 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id c3so20477646wru.12
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jun 2020 05:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=Q6OsjkJk4pboo5l2xvILBNUm3B6366KdViVmWJQJc1w=;
 b=kdsn5tjdB6ktRJ9mmWCnOQ9CfEMUqcxAszDkUfimcaluXzI0gXdq+3lGnL2wowHLuJ
 XVwwdLvjpzcwXu8CBc8dnkftrxJ1N7+/Y46OkIHUxelWqtxbn8YE5rj6g16lNDhVb/7G
 XCprtIPsYY1SGOmOrKUjp11REFjEEO+9rO8Qg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=Q6OsjkJk4pboo5l2xvILBNUm3B6366KdViVmWJQJc1w=;
 b=Ijjv3pheRl8tzJxBqq4Bf5vODujEkszoGSr2qZNMCS/+4SG3ObTzDAJQ5/hv0vOR0S
 DJavjJOGG7vpAxwpp/WVY1uSV/9+VMf+9oqHUxljwtTtNgiAnrf0Qv33UC4TvL2xaKfY
 j0HBVa51EH6DfQ3XI8eZ7ADkJ/CnYJ5pMOTb+OltskFHp+OzPQqGvUfK6hDltloZS63o
 NFhFupxe0sDaPSIVnJR4DzFNpUMYKKMgWp0uXP/8ZM/gSwHzkym1XXoCWXb5wFuGenV3
 Xga1H98W5VXF+0Fn94sHbBEXZvCq+AqMTExc9njPgYlXXz94Plhtd6dSkbDxp54CAy7e
 csfg==
X-Gm-Message-State: AOAM5304picOHCxzu12XbEh4OHPR1NttisQZtmZbYoJmiiYS/G/ipYp5
 l5dN4FjVGjlAnNWYPAV6+fUKLA==
X-Google-Smtp-Source: ABdhPJwE/rveo96P37ip4JED1ZrNUfLnxqMG17ohOhxH9h34F9ic/IEpoM6pzw55iAcxdQcPOHNGsQ==
X-Received: by 2002:adf:a396:: with SMTP id l22mr2758118wrb.24.1592309566724; 
 Tue, 16 Jun 2020 05:12:46 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q11sm29162628wrv.67.2020.06.16.05.12.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jun 2020 05:12:46 -0700 (PDT)
Date: Tue, 16 Jun 2020 14:12:44 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH 0/6] remove deprecated i2c_new_device API
Message-ID: <20200616121244.GN20149@phenom.ffwll.local>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-i2c@vger.kernel.org, linux-fbdev@vger.kernel.org,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org
References: <20200615075816.2848-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200615075816.2848-1-wsa+renesas@sang-engineering.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: linux-fbdev@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 15, 2020 at 09:58:09AM +0200, Wolfram Sang wrote:
> I want to remove the above API this cycle, and just a few patches have
> not made it into 5.8-rc1. They have been reviewed and most had been
> promised to get into linux-next, but well, things happen. So, I hope it
> is okay for everyone to collect them like this and push them via I2C for
> 5.8-rc2.

for the drm side of things:

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
> One minor exception is the media documentation patch which I simply have
> missed so far, but it is trivial.
> 
> And then, finally, there is the removal of the old API as the final
> patch. Phew, that's been a long ride.
> 
> I am open for comments, of course.
> 
> Happy hacking,
> 
>    Wolfram
> 
> 
> Wolfram Sang (6):
>   drm: encoder_slave: fix refcouting error for modules
>   drm: encoder_slave: use new I2C API
>   x86/platform/intel-mid: convert to use i2c_new_client_device()
>   video: backlight: tosa_lcd: convert to use i2c_new_client_device()
>   Documentation: media: convert to use i2c_new_client_device()
>   i2c: remove deprecated i2c_new_device API
> 
>  .../driver-api/media/v4l2-subdev.rst          |  2 +-
>  .../userspace-api/media/conf_nitpick.py       |  2 +-
>  arch/x86/platform/intel-mid/sfi.c             |  4 +--
>  drivers/gpu/drm/drm_encoder_slave.c           | 15 ++++-------
>  drivers/i2c/i2c-core-base.c                   | 25 -------------------
>  drivers/video/backlight/tosa_lcd.c            |  4 +--
>  include/linux/i2c.h                           |  8 +++---
>  7 files changed, 14 insertions(+), 46 deletions(-)
> 
> -- 
> 2.27.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
