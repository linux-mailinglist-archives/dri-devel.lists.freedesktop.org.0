Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 237538C973A
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 00:25:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1795010E068;
	Sun, 19 May 2024 22:25:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bzJtfIPi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA82010E068
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2024 22:25:45 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-51f71e4970bso4279702e87.2
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2024 15:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716157544; x=1716762344; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=UYrU+XJ27k761lwCe7kCnnPwdlOuBzaG8t6NtqUWwio=;
 b=bzJtfIPivRLY3up3OHC5vpXwHHviTQcdM0/F2wtU7z1/HqadDk6s5pnvJd5xoBymDT
 z//xqp9sK05NBTl4Vpv8YHltoIeZz0L7+1RiAYjhZW8Ki/LvXoZxrVXOyETNsGweaWUQ
 Oc+/TA8C8zbaT4gQIU/FOSGwXQI8ca9PEATjSAWjuAP2mwczkBVq8kolIjddq9i7tSdg
 rn8wudM4hAX1L6IQ0QCkEQiIkSZzIaB8bnyVrhdD6TYEnwxollmu7LV5nORhRL5ueBrp
 aqmaL8K82zGQhOcofguOJqK+gP3lnozi3Vd726LkT2u59p+1BVJdvnCVWPS64H82XRlP
 Lc3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716157544; x=1716762344;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UYrU+XJ27k761lwCe7kCnnPwdlOuBzaG8t6NtqUWwio=;
 b=rFuVDTCyOYTtfzqpHXINWvHIZaLyvBq6+FXzG2Ok+ouRxGf+VnrtQIkTDXyjSI68jp
 s3HzxkjP+l5jQ1CSZCzidTdjZQMidwjEbaYNNaZ2aiXFmxQ935RT74o+ILIfwmHdRYIN
 6R/5ne5WenOqxQERQh6sT1BBb2oqi1xzVEA7JwhdXWjZohuG5W2HCQGg5+OsoIVggctC
 zSFVYqQz9MD5f9YezoYyQe7n4GLGwmRVYFM6/6y9Tw+E2mbbR3Wl5LXl+hKaK4Bl7ZAs
 zb5Ls70/XqKtPY49SL1lmhXA3U0d3WyWn2oV9jQhozuOtXckSoRFwhPmkfynNy03iwy1
 uTHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVA4+FiPHZ1UmDw7uu/acqKSYq5uVPWPLcP4K9T/nT6lSONDGPIrdf8tnwn5b8G5Rphcm6DxI0fDEwSz0OPReGtJFI+oL+05weu+jFHR7WE
X-Gm-Message-State: AOJu0Yz2W65xL9K+13L8igkL1pRB2V2gqpRZ3gse1DYQ/TldDcCMvEJW
 t9dT3dtFZfEo7ac36xxw5Aj4au9w1lbhvjgU6YdPQRwcxamQlIoMV5pvSQGoFts=
X-Google-Smtp-Source: AGHT+IGdC3FYdpnOZLHS9Ly6tvajsrdS+bTijHOKS6oAZvUcSjfsM10rZHFWNisj6ZI7WMc1O7UGeA==
X-Received: by 2002:a05:6512:475:b0:51a:d08d:bab4 with SMTP id
 2adb3069b0e04-5221016b518mr22160660e87.55.1716157543835; 
 Sun, 19 May 2024 15:25:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::8a5])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f38d338bsm4050078e87.166.2024.05.19.15.25.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 May 2024 15:25:43 -0700 (PDT)
Date: Mon, 20 May 2024 01:25:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@gmail.com>, Javier Martinez Canillas <javierm@redhat.com>,
 Kamil =?utf-8?Q?Trzci=C5=84ski?= <ayufan@ayufan.eu>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Ondrej Jirman <megi@xff.cz>, 
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/8] drm/panel: himax-hx8394: Handle errors from
 mipi_dsi_dcs_set_display_on() better
Message-ID: <rl75kajstjmm2nvzwx4mwjeeygzgj4p6fshl4zktdjs37bjj5x@cdwg4oghnpua>
References: <20240517213712.3135166-1-dianders@chromium.org>
 <20240517143643.1.I0a6836fffd8d7620f353becb3df2370d2898f803@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240517143643.1.I0a6836fffd8d7620f353becb3df2370d2898f803@changeid>
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

On Fri, May 17, 2024 at 02:36:36PM -0700, Douglas Anderson wrote:
> If mipi_dsi_dcs_set_display_on() returned an error then we'd store
> that in the "ret" variable and jump to error handling. We'd then
> attempt an orderly poweroff. Unfortunately we then blew away the value
> stored in "ret". That means that if the orderly poweroff actually
> worked then we're return 0 (no error) from hx8394_enable() even though
> the panel wasn't enabled.
> 
> Fix this by not blowing away "ret".
> 
> Found by code inspection.
> 
> Fixes: 65dc9360f741 ("drm: panel: Add Himax HX8394 panel controller driver")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
>  drivers/gpu/drm/panel/panel-himax-hx8394.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
