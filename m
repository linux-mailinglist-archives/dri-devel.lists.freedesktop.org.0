Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 313B68FF155
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 17:55:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9909E10E9D5;
	Thu,  6 Jun 2024 15:55:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wd2M20Xg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 842C910E9D0
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2024 15:55:54 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2ea9386cde0so13936621fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2024 08:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717689352; x=1718294152; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Y1fwDi7m8Ls7tvW3PNXKUz3XR7Aa+gs5JKKnJgNGOmM=;
 b=wd2M20Xg9ESD/4VHxAI65OyKSRicT1om1tOwdvKCAADWdgVbnJXsvf8AeCx5BuGyZk
 VV6W8R0WPgKSxMnqR6d6ER2KhYVb9ArDn7sAjIMSrioRJQrGLybcC7QRe+H0wng/bsyN
 EygSzYz9I3fYpTm7wWq+Xfo1bl38udvVWQutGKxMPMLidrElyzBPpx9py36yI9liL+b7
 r9BNI7EVkAMHcW8evvN+h8U4Hv31cowU2a+PqHpFxesU2nhqsM9CblJlcxT3jUe+NNn0
 EV22l0nE5yiaTsL8Y+Z/d/zpj6l5VBmR/OT0+OJB2SLeYt1Xxk5vZRS06TO6dXMYknRM
 7H4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717689352; x=1718294152;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y1fwDi7m8Ls7tvW3PNXKUz3XR7Aa+gs5JKKnJgNGOmM=;
 b=aArJfPN9He5ok4PUTIzHGOH8F3o43HOx56/CgKk+YiX7kiHWva3Znd9tYfX8wcAWEV
 +9qAO8VXUVARJlyJGM0DVVuMCT8KumcpqWLJO1Z5IkkZrHcvuk/eydeUS8Q4DhQVUvaM
 57cIkFzJe715OS52pheKJ9KyXgfqyjDc1qzJ2walcvC0mqte/EpYJ8c4uBQbCvwZKH6j
 sCTKSjcc6hlo38FgEY/4BeDqRVLcLrF45al28YJp7Pw/OArDORJjLnHSYTYnxnLE9m5I
 SHM4dK2JfknjClwtZoDkGvxoeaYUkg4SbALbAOwMUG3WgSnXIYiwyRZTBOme5K8UJwgt
 XcjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUhUcEns3AuhJ7zxDH7WCw1AUYi+BehPqeJ8SXpVLiCWtxfFxHunPmaemPyXpg2jkztNPIAlT/9OFeKXyWlbodaaIkHZ8U4Q1zSo5I8dNY
X-Gm-Message-State: AOJu0YxPIUpKNJ1P76S6YQyQh7B1EbdwMos1gYV7j09wJmEckGulNFgy
 gAyoFXUv8uFo7+YAHTd6RwnaXRnph2u3FrXRhcWV4EQu+zXNcrQjMv0RxOKIkxE=
X-Google-Smtp-Source: AGHT+IF4280Hgq0kqRgUvq0jhrs3am+fMEcFKbapIcsA4lrLBrVyPmTNuamu+kjd/+STHe9uv+uXYg==
X-Received: by 2002:a05:651c:a0d:b0:2ea:7e6c:42e8 with SMTP id
 38308e7fff4ca-2eadce79aeemr851011fa.39.1717689352020; 
 Thu, 06 Jun 2024 08:55:52 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ead41b05f1sm2390791fa.78.2024.06.06.08.55.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jun 2024 08:55:51 -0700 (PDT)
Date: Thu, 6 Jun 2024 18:55:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Connor Abbott <cwabbott0@gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: Fix A702 UBWC mode
Message-ID: <7mvu3xeosx45eorr277f47tb4ymujr7lu5m3vytfcphasxsxnw@qtia62v4bi5k>
References: <20240606-topic-a702_ubwcmode-v1-1-283fa9588af8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240606-topic-a702_ubwcmode-v1-1-283fa9588af8@linaro.org>
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

On Thu, Jun 06, 2024 at 01:10:49PM +0200, Konrad Dybcio wrote:
> UBWC_MODE is a one-bit-wide field, so a value of 2 is obviously bogus.
> 
> Replace it with the correct value (0).
> 
> Fixes: 18397519cb62 ("drm/msm/adreno: Add A702 support")
> Reported-by: Connor Abbott <cwabbott0@gmail.com>
> Closes: https://lore.kernel.org/linux-arm-msm/CACu1E7FTN=kwaDJMNiTmFspALzj2+Q-nvsN5ugi=vz4RdUGvGw@mail.gmail.com/
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
-- 
With best wishes
Dmitry
