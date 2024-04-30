Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F658B6F81
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2024 12:19:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95D5F10F70F;
	Tue, 30 Apr 2024 10:19:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bmasaC8W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A2E210F70F
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2024 10:19:53 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2def8e58471so86266551fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2024 03:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714472391; x=1715077191; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Oi+zY4jrvA7etE5aJ4Zb1R79uvZhxlcK87yfMIoJspk=;
 b=bmasaC8WYOpp1oMQAXYKlP8Iiy8xJuGzSfvq5+4lIkC0HKfhUhNgtbujd2jBTHhRrH
 E3DP2DpvHbWhUzL2BLeFR2sUbmiVg05PSlNNwYWR/ml2t3hhvVZsAOFPxyd95IXZmiEr
 Y8XUZbpxpsaVUK9hpSHBHcNVZQ0oZLEcDXdtOZM04rz6vmfprUy0Ig/lZqj1cXB10gdL
 xfrtkiVsr0U3HVDz/Wk4BQ9kG1dWjqvJNDXwLiTqiGAo2vm/q2feNGLSfg44Mxet725u
 im52CIndf/DCSwt4j9h99jVr1kPAYKAu0BL7DUL7Ir521S4w3efByIUdEMjp6tfxxP0g
 QWsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714472391; x=1715077191;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Oi+zY4jrvA7etE5aJ4Zb1R79uvZhxlcK87yfMIoJspk=;
 b=PGVB2axiKF4aJNhQaKSE8x6Iw7N1UCRd6Na+4rfvbVmQXOVIHUlYvnRkFAi5NMiBN4
 ho7uJwBLW+V+OVTI3j4YXAV1VSBXC2GqX0LExDWIXJ2ZMGDpN5yw/0sBmwXdkZgZBlKn
 +JFeMsq3AHLqbZpsx4qJoaJPt5c66bPFXBDqHZX6dJli0GO8BXy3W+uREcoTB1JjImM6
 TnNVCZDnqyuKufVFYST4PGl6HgAUmFv0XgW25q9S5e4jG7qBL36SU0r1hgAu6CK1FlP0
 XulHxzssRXBc4WSEDw1nqNy+olJX5sYSNPRY6yiUk7KbDHx6Y0S/k+hRRmLEWidn3ILE
 OgVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCULndEJDO4C+sfl2k1rd8w3TfEuKIY/IY4/Fa5Hbx+XPw7Q11s/6jAQkgwJZXkbD2gtbzaTolC8pC6BfQkzwEND6sZEnUqLDImB6tnrY+iH
X-Gm-Message-State: AOJu0YyRumCyAtfF08qPVsVBuloKqD9lIQUP6dBTXXBjM3LC6nH49CqC
 QzS/qTf4aQZGUuDYhUsIsQXbZHRbatgXMjYE7Prp9jd9FPRdtPvaKFSwYCdpfcg=
X-Google-Smtp-Source: AGHT+IFivDvhkvzdK3js9J8r/Omj4m9EtI36Z7K6bKiY8IRU1gTzJE2IoEcCjop9Y8xeDqlTpaY03A==
X-Received: by 2002:a19:6907:0:b0:51c:1657:b04a with SMTP id
 e7-20020a196907000000b0051c1657b04amr9624458lfc.63.1714472389353; 
 Tue, 30 Apr 2024 03:19:49 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 e1-20020a196901000000b0051bc10ea8ccsm2520317lfc.38.2024.04.30.03.19.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Apr 2024 03:19:49 -0700 (PDT)
Date: Tue, 30 Apr 2024 13:19:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Randy Dunlap <rdunlap@infradead.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v1 1/3] drm/panel: ili9341: Correct use of device
 property APIs
Message-ID: <oin54zqdhrdp7glme7te6yd4yoddwqkg24igzktw6lg4toh7t2@lcrmkwmujjpq>
References: <20240425142706.2440113-1-andriy.shevchenko@linux.intel.com>
 <20240425142706.2440113-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240425142706.2440113-2-andriy.shevchenko@linux.intel.com>
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

On Thu, Apr 25, 2024 at 05:26:17PM +0300, Andy Shevchenko wrote:
> It seems driver missed the point of proper use of device property APIs.
> Correct this by updating headers and calls respectively.
> 
> Fixes: 5a04227326b0 ("drm/panel: Add ilitek ili9341 panel driver")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpu/drm/panel/Kconfig                | 2 +-
>  drivers/gpu/drm/panel/panel-ilitek-ili9341.c | 5 +++--
>  2 files changed, 4 insertions(+), 3 deletions(-)
> 


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
