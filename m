Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A25A8796A
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 09:51:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B97C110E30F;
	Mon, 14 Apr 2025 07:51:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rpBiSthL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57CD910E30F
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 07:51:18 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-43ce70f9afbso43186935e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 00:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1744617077; x=1745221877; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=jRSJH2g0yvmNkJq0Jk/qKN71nZMtC9VZJg8Hi1uPjK8=;
 b=rpBiSthL0Aqq/oVAPT6x0B7JgdWJMI8Hx/Rb5HtJRPzEsiFrb1WfWunl3qFMbj8SPG
 +VjuRLbPNMpbKmlC3AV5boIkDQZQYpVUF3PVa1JGjwbpjKBzuJTN3jvSDsizU1fi34An
 qsF5zFIGAXdhDEbn8sGrvHwNNC0lHyrQh+2oiAhbGboxyVbiiMep2jfuPknIEqcmK30k
 BD+NPLVXi8bLivOh8BfcJ8YW0uYTK2lRF2Q+t0cu2ZTyS6vWXK9Jsi+PBoDdegO8cFT1
 im+d9HsiWhjOv3JqRgCU5xLg/Ovsmim16DZhdRyIHQX+5YXb645iaaJy2yZrMdJ27/Vr
 suKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744617077; x=1745221877;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jRSJH2g0yvmNkJq0Jk/qKN71nZMtC9VZJg8Hi1uPjK8=;
 b=AVh39bNBTOqDtdW6xg02crVt+hOOs9Rim0jT5onqR7DMNaXcXoOVkk28vXxWhrHej8
 wMX/ixs8SNCYPxmU9ioKceQWDG/wnJAZoUR4JozmBM80YmBJv3rjwObUkbyUlS1/+IYJ
 k/3OvKV6BhIvz8XuDeOtd0EiJgWMEypULD5bFiejGiCtD7fy73Mxp3haI7NchxvUjJLq
 nGMqKOyYdlFDxK6sHO0/zZkSpd3SN4zMr5eylulz742XRqNzW4ANdjuUGT8wNfPD1QiI
 chwTFKLihe1aZNQYjP4A3zAcL+Tb/9BsNcGU8IMmQeP61T16ZSfH8ahAfmDVkzDNGi9f
 aZpg==
X-Gm-Message-State: AOJu0YxFi8jTeY/4ijwsmdzsO4MKwF+N+KrghPN7OY3Vx3T/lMVlSW8T
 O8/a2wzUca6Mnmq9pNfRE0e9KdasehQ2HjPNqRXxj9klafM9JVbyC8eMA+5ar0WelXjdBaRph3n
 +
X-Gm-Gg: ASbGncsp2M92F+9uK+xBl81vg73FMEkaCWyDEEUAOHLgmnk0fIRXq5lecMdyhwz/+FK
 awBGCvF1W9jZgpPLdU5yi4cjZ3H9mjW96c6SdIG8/Uw2FoQQH25tt8BwUGWT4nhfQ8Xd8fPYnhY
 wOdKdRroGDz5ION37qs296tCKkx84V39dRThFw8ffpENVILF0/1vSpfK/35tdLb3bPrQGInMMR3
 C2qe8zWmrDMdThIXWsN0aDyVIH2c3HX6S89yjosSAjOoddHPGVMtRwUgBaikj9o4gjv9Mct8XKL
 EIWqXsuL1pYBB4Trlw0gxT9IvB+9nhsp+aePRWMQ/LOyXA==
X-Google-Smtp-Source: AGHT+IHmtz9dxUQgFh4Jlkvf19QYhjV4MZdnoC+OL4zfNGLS71VfC5rshg8801uLHQzbtZ6/hivs1A==
X-Received: by 2002:a05:600c:5107:b0:43c:fcb1:528a with SMTP id
 5b1f17b1804b1-43f3a93379dmr87263565e9.6.1744617076875; 
 Mon, 14 Apr 2025 00:51:16 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-43f23572c38sm169470435e9.32.2025.04.14.00.51.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Apr 2025 00:51:16 -0700 (PDT)
Date: Mon, 14 Apr 2025 10:51:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [bug report] drm/panthor: Call panthor_gpu_coherency_init()
 after PM resume()
Message-ID: <4da470aa-4f84-460e-aff8-dabc8cc4da15@stanley.mountain>
References: <6cb91960-1bb6-43d5-aec3-ed6048e8613e@stanley.mountain>
 <20250414093448.64cef724@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414093448.64cef724@collabora.com>
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

On Mon, Apr 14, 2025 at 09:34:48AM +0200, Boris Brezillon wrote:
> >     235         /* If PM is disabled, we need to call panthor_device_resume() manually. */
> >     236         if (!IS_ENABLED(CONFIG_PM)) {
> >     237                 ret = panthor_device_resume(ptdev->base.dev);
> >     238                 if (ret)
> >     239                         return ret;
> >     240         }
> >     241 
> >     242         ret = panthor_gpu_init(ptdev);
> >     243         if (ret)
> >     244                 goto err_rpm_put;
> >     245 
> >     246         ret = panthor_gpu_coherency_init(ptdev);
> >     247         if (ret)
> > --> 248                 return ret;  
> >                         ^^^^^^^^^^^
> > Missing cleanup?
> 
> Thanks for the report, it should definitely be
> 
> 			goto err_unplug_gpu;
> 
> Do you plan to send a patch, or should I do it?
> 

I'm on vacation.

regards,
dan carpenter

