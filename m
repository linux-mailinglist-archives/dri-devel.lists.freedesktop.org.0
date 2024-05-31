Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E848D6A3A
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 21:58:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B07610E087;
	Fri, 31 May 2024 19:58:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="dSLVNuBj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BB9A10E087
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 19:58:39 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-52b7ffd9f6eso1900269e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 12:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717185517; x=1717790317; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=2zzL15EC2L89F0jcA6FwGlL6a9GXwi72mLESASORZ3U=;
 b=dSLVNuBjH5DCh3vHnKA0pndtQ0IwEXFDKYQpMlsH9iXEr7y6nwWNNzW/cqrV3rCiJF
 UxF8Wo+UXu37izJ5Y9S4RGYTgm3L7QWIt0Lsc8PKRVN2R5Np2wKn01W/wL6qXr8y1u7z
 WOIjQuCPKmF1qD7zKabCmUdGfDUuVGRJ5VkdXOfiJnWkz3PxjOsM8pZtPdflqbq1CMq1
 h1GC/RXKEUD6ko1aJI5TZXzvTvAORRbxLzZgsO3I/UZjUA/iPP4r5chOWRg+BXhERAkc
 yHRwAQO/u6QgoXdbHQM3XeIetn6ZPzomTyY0/PuDGDduDhLfAQRZty+aeA+KS4FfmQbK
 sGzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717185517; x=1717790317;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2zzL15EC2L89F0jcA6FwGlL6a9GXwi72mLESASORZ3U=;
 b=JRNMcKhHXYzwbefxjsOikslr7dNI2/sHhv149SJeAEgVtul5P/Go4bhAMdma7tAeWb
 hh+IoISl4zQnwmyMMxf4YWw4X1AV+6t5+Q/gYk9NLOxG8eQ5eNBOqjUhnEEhNa0G+ZBK
 qMhhjR6k7U0jmQ1zdoUY0kqN8sh7YnPdVStiRvRY90dyjp8eTAnbu778Rw9rvCi3+jmi
 mgyoCdEiJ4jXhiM4vp7lJA3mAUFjTFkKgZrudXasBG1lI111O06ulXNJmy8EsxaGGU3J
 tHKmd2Cya3+p1ixCve42LiDaqwCZJCKb/X82I6s7QEBQf6aMcA6XfNMrKObm2vyKrFqF
 2HPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZKyEFrE1BHn2KL2OZ4q7JDJESjXAyIiukimhxm8U5a0aAVu7M9RZwORTjNO13VfCMONIu94wzRNdFFD67IBEEVqz0dicF2rm4wRD++NFd
X-Gm-Message-State: AOJu0YyJ8GOA6T3ubMGYkvAeansKEYooTJjdveYhVLJTUbDMkAEPnEEe
 BHNgxDst7znvb6gjX4rn6mD8Y6k2TFvjjS/qv9bfJdRM+sCDe55Ht95lMxPXhGg=
X-Google-Smtp-Source: AGHT+IEwiQ6pk+BKY1MK9bmBUgM955M0mWQUYVZ2U93GbXyqgrUjB4xGztU6OWyYemMzgch8INelqA==
X-Received: by 2002:a19:6a09:0:b0:523:8a14:9149 with SMTP id
 2adb3069b0e04-52b8956b5c9mr1678167e87.21.1717185517080; 
 Fri, 31 May 2024 12:58:37 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b84d7f94fsm426524e87.207.2024.05.31.12.58.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 May 2024 12:58:36 -0700 (PDT)
Date: Fri, 31 May 2024 22:58:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: tjakobi@math.uni-bielefeld.de
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] drm: panel-orientation-quirks: Add quirk for Aya
 Neo KUN
Message-ID: <geyj3ixnlka232jndzkydfr2n7a4lipqumyihujzkhdgdmp5wg@hthqr3agxvtr>
References: <20240310220401.895591-1-tjakobi@math.uni-bielefeld.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240310220401.895591-1-tjakobi@math.uni-bielefeld.de>
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

On Sun, Mar 10, 2024 at 11:04:00PM +0100, tjakobi@math.uni-bielefeld.de wrote:
> From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
> 
> Similar to the other Aya Neo devices this one features
> again a portrait screen, here with a native resolution
> of 1600x2560.
> 
> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
> ---
>  drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
