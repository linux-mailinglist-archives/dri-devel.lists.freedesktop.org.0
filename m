Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E579C90AA61
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 11:57:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB53810E329;
	Mon, 17 Jun 2024 09:57:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KY8NvdbP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B2A110E329
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 09:57:25 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-52bc335e49aso4784030e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 02:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718618243; x=1719223043; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=GAu3yut6C33w0f3QgUUkKHsVifCYw6coodnkymy99jw=;
 b=KY8NvdbPG1PFMLnuvynFcW+AA+qqsUhVxVIo9pDa7URLOWODNaqMoQ/RXt5SPPGpiW
 g+6gt4pxpssgsn0UZ6mrp2lG496chnkuK2zWBzD2WMIsPqeGlCWXHqTtWw8AxHEg6/vJ
 0dClhdk+ReKlrBYVHw+c6o77jR16zvNhBNmLpo1wzT2BcxyY19VEoB3B1MGyqPH2FAd0
 ft0rpMHRaS9s4c9GJJRnmU6uX6PG9cQegALMeAsalUZOhyuFQ7KIQLLWTmtTxVaqHcmz
 8uXX5oEStgs4NxbxErDOy8pB6krV7PkgM5p7DHpQwM1lebEzplaUn8UxstvnQTVKVVZt
 IcuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718618243; x=1719223043;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GAu3yut6C33w0f3QgUUkKHsVifCYw6coodnkymy99jw=;
 b=i49v84UXx9tZEe9L2WGKeEjZ52Mm5QvSoxmQtMqsx8dgelk5dRfZH+0v4wuhoPmjoB
 dfiLL0bC5VUiDnKaR2QsXpw5mYKlq4VoThI+7ScZ2AtDJVlTpLrGWHjGCTYTSMKzYSc/
 Gio1pcOlcPMr94DUxucg5gABqT78JfdKVU6cwFI2X4Qp8JZO4TNVMezIMHCVW8AY2/Gr
 FUzb3dd1Ap1kJVsPS0ubkFDAnPiB7Fw5xn2zkiQj+gV1rbvjNx7sRCfCErpX4gdCibUU
 WmfIeDwkmFZv7IZq0u3V8bvIWeG+JbKgNHllYypSmOecHBo3oASYVlIX/iArAFYTxxth
 22sg==
X-Gm-Message-State: AOJu0YxYbf0TSKg6H5RPSRuyr4pHuNzweAIc3HfQpkbrTg8Aj2Slzte2
 fetSzX/WCf0uZRC7cIyDSoHnG5DqZWUrIzHRFjhs3n7k5hG1yT/lQw50d34Vw56M4T276q6qnC5
 gBHc=
X-Google-Smtp-Source: AGHT+IGd0lubX4e/KngoOZFs4XUo7XaV0srvqIlzUax7XiFNyo+YBY3jricMn+yHE/eYu10R++2NAQ==
X-Received: by 2002:a05:6512:2350:b0:52c:a1ad:18bd with SMTP id
 2adb3069b0e04-52ca6e54ceamr8567114e87.6.1718618241899; 
 Mon, 17 Jun 2024 02:57:21 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca2887effsm1197140e87.257.2024.06.17.02.57.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 02:57:21 -0700 (PDT)
Date: Mon, 17 Jun 2024 12:57:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jean Delvare <jdelvare@suse.de>
Cc: dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH RESEND] drm/display: Drop obsolete dependency on
 COMPILE_TEST
Message-ID: <xd2yybtxvzte7gwqwg2vudzvhoekqao2dle6zsuduzjzi3rsay@xhahwof2prph>
References: <20240617103018.515f0bf1@endymion.delvare>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240617103018.515f0bf1@endymion.delvare>
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

On Mon, Jun 17, 2024 at 10:30:30AM GMT, Jean Delvare wrote:
> Since commit 0166dc11be91 ("of: make CONFIG_OF user selectable"), it
> is possible to test-build any driver which depends on OF on any
> architecture by explicitly selecting OF. Therefore depending on
> COMPILE_TEST as an alternative is no longer needed.

The goal of this clause is to allow build-testing the driver with OF
being disabled (meaning that some of OF functions are stubbed and some
might disappear). I don't see how user-selectable OF provides the same
result.

> 
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
> Already sent on: 2022-11-21, 2023-01-27, 2023-12-02
> 
> This is one of the only 3 remaining occurrences of this deprecated
> construct.
> 
> Who can pick this patch and get it upstream?
> 
>  drivers/gpu/drm/display/Kconfig |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- linux-6.6.orig/drivers/gpu/drm/display/Kconfig
> +++ linux-6.6/drivers/gpu/drm/display/Kconfig
> @@ -3,7 +3,7 @@
>  config DRM_DP_AUX_BUS
>  	tristate
>  	depends on DRM
> -	depends on OF || COMPILE_TEST
> +	depends on OF
>  
>  config DRM_DISPLAY_HELPER
>  	tristate
> 
> 
> -- 
> Jean Delvare
> SUSE L3 Support

-- 
With best wishes
Dmitry
