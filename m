Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCB289C8D0
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 17:52:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43FE210E713;
	Mon,  8 Apr 2024 15:52:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="D0Gxo5wO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com
 [209.85.219.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4954D10E713
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Apr 2024 15:52:46 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id
 3f1490d57ef6-dc6d8bd618eso4333356276.3
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Apr 2024 08:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712591565; x=1713196365; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SxkgeoQeNIUqrwLW13ZD9YQozaM7Suz5SGdkew/WCbg=;
 b=D0Gxo5wOyo0wlr540mWxueJyzfIh6GPRFmeNw2jNjECG2BYxet8QsvAnfYg69isLML
 +dEtCZ+xX+sCeY4T3FQbsV5Hu5CKSTD/bQIsdIcr5x2JQ/aQYsk2vN3NUvL7ElXRGOVw
 T/hokNBKYarGh9Vlyf7+j9j2C9n+s2I4+sf811DDiELzKlUxaCcRh0qWWuFXdMRPH+Oe
 Y+42onhxFYArIsuS7TIuB/CTKew4dJ/U2tDOKU4x41cykw9jXQCKiVOkptdFnYWYYHzR
 t8f2UuaZaqe/Cl7Yg6Gd3fnmarIkmhD8nmQUqVUzAvdKoFcYU1ek12cFIiP0l+GMWPFx
 aB5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712591565; x=1713196365;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SxkgeoQeNIUqrwLW13ZD9YQozaM7Suz5SGdkew/WCbg=;
 b=nUssgMgRBFjeIGxHA5eTS29Dk8hLx2haYef83u0jVHBQKhBfhW3iRlyO14isIx3HvV
 eCSe4qlMHvS6ucUVpyzzwkBNfdhf5XBEyg+oWebNERZHudxZI3CcZY5NykAij48kBn2C
 wJjHXFfY4OEBO8hOb3gCFCOddjhjtjvMQLXvqa85iHJpeCRIefKvbwelipondFIeFhj4
 dgLY8Rdm5SaTzvzi2l6yDPPGUQ5zMS4/OcghER0uV+b5HtjNqUAsGIIGcfq7oFpEf0XD
 9wmDsLE38RYS6cmaTX1KI7MZG0PY6AYnz+orov4/BAdNxtzTiVCrLWZz5lbwp5k67mty
 NnkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEpRq4oNCqbIDLXb+MctbH3Ud3Fqe3VnPWOdaNWGAhaJXBAbrPwBeNIu4AooUgbemVsCC0/YNcNIiL/qvNfchOSgyCeOaJhmmjo/fwNDao
X-Gm-Message-State: AOJu0YxK+6SihCpa9JqXPJB8MxvaRR1TFu+ASu1jgrlN865yXhbGyjLU
 vn7PTG/5ZSN5fc8iMyMqEw5zr2n4koaWuViaqb/E42Z77T1Khj7ElBMyipGa6AgVlEMkdlEiXMk
 el/jWT9+nfRWxxqRSsZrRHmGYDBLQdmuB1G7T2w==
X-Google-Smtp-Source: AGHT+IGLnzhF0iW1cRj3Lg7cS9tUEIYYBj/O1ZdALYq3I/dJY/JXan3cwHXlFh2yn260/WHV8LwCOmumQG1gMmtuhu0=
X-Received: by 2002:a25:360a:0:b0:de0:e368:fa59 with SMTP id
 d10-20020a25360a000000b00de0e368fa59mr3976700yba.31.1712591565113; Mon, 08
 Apr 2024 08:52:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240304175152.1199270-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20240304175152.1199270-1-andriy.shevchenko@linux.intel.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 8 Apr 2024 18:52:34 +0300
Message-ID: <CAA8EJprDxKSkL=OgmAqR_4cFBYGo4tnDCE8nesgTAaYg7rYL8w@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] drm/msm/hdmi: Replace of_gpio.h by proper one
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
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

On Mon, 4 Mar 2024 at 19:51, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> of_gpio.h is deprecated and subject to remove.
> The driver doesn't use it directly, replace it
> with what is really being used.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpu/drm/msm/hdmi/hdmi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
> index c8ebd75176bb..24abcb7254cc 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
> @@ -5,8 +5,8 @@
>   * Author: Rob Clark <robdclark@gmail.com>
>   */
>
> +#include <linux/gpio/consumer.h>
>  #include <linux/of_irq.h>
> -#include <linux/of_gpio.h>
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
>
> --
> 2.43.0.rc1.1.gbec44491f096
>

First one didn't reach the PW, let's try again:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
