Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 343078A9837
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 13:07:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8F0A10FA47;
	Thu, 18 Apr 2024 11:07:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zg0GNVIe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0A5410EE3C
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 11:07:34 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-518f8a69f82so867063e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 04:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713438453; x=1714043253; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=MyO/GjotGUHlFltRGjYbztp9IACAS8Q+nLylpcG9+Rw=;
 b=zg0GNVIeh1nvNZank60CqUFXrSLhy/2xgLwv4hHzTOPVY13GD2H6WDwFjewX4ERZfJ
 mPrUyHSkgYOSsYyh0adUwWoaYg/tueIyn0ilgcgrLgu7qOcJG04gpxHoold+MNTmZ4ix
 qbAXRjHPfMAVCiMefmhibUiUUcY/nLbfuC2WOKDcQgx9+ml/Qm/0go5m6zZ3axbU6CSj
 zQbA8UWN56TRkf4Huz9TrhOmjkAcLo7via1Ddb32MgiEvWDFz1+l7AxwPsS3k7osDCtc
 gAYrcbnnBaqARvDo8hqPBD/BEmZhTsQhPWK70Nh4Gn6blbknI0R+noqhnDS8TfTyMKIh
 NVlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713438453; x=1714043253;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MyO/GjotGUHlFltRGjYbztp9IACAS8Q+nLylpcG9+Rw=;
 b=H2R/ibhUvZnJ8ubhdCMdFqvcFjIZaDkI/DhgyX0WB1beCgO4+Sczk1mVov2tW5aMeK
 6OEgWtBU3rtGkMpu+EAkQEVMX2qykPNKbMnmREJTlfwti8hedNxGNRy44+FXxqlqCGHp
 WPYkYy/l1feGTRT67HrC3Fqo2Sbdp0uQRQl35PPHx0FplHnWLmXK7EMfOCEMmDut0ILo
 UYNOZJXgKQ9ai3H2ZdBKmJeZkJMSvIDOtJl5k3xxrlDXyrWiQYFXBMUiisTHL2EEKa3N
 Hobv0+CYcr8dpphXxJvQVH21mhC4Dl9z2qq1BGc5xFF0vNugDpG3xO8k57q0DZv5S5dn
 yNyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTILAu0hrn66q6ecAM6LW1HtBHbwIhJfzBFC2YwU+F5EBpnKELhEMqtv+F8Mn9/hqozonP73ht8Y1yJ87sPUhq742+BWm/0Yllx0FpRKUM
X-Gm-Message-State: AOJu0YyK2ZiAVzE1KSgrXrIWoKq9D+E0Hg/EGNWPIot3CKpcFE5QmlW5
 v1pLW1iOXRn9vW+KaHOL+2KjTWm/k0WXNeyAHmJylYmG5D1/JWO+L7kGRJQhQL4=
X-Google-Smtp-Source: AGHT+IEwPXTDTwrWeLYeoadFGaTFA9rHj1W+CNy99dyVg08+5SUOCAzomXSQbfzVVzpXPPNwtz7O1Q==
X-Received: by 2002:ac2:4853:0:b0:518:b4a3:dee1 with SMTP id
 19-20020ac24853000000b00518b4a3dee1mr1574836lfy.66.1713438452661; 
 Thu, 18 Apr 2024 04:07:32 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 t14-20020ac24c0e000000b00517374e92e9sm191076lfq.167.2024.04.18.04.07.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Apr 2024 04:07:32 -0700 (PDT)
Date: Thu, 18 Apr 2024 14:07:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 3/7] drm/msm/adreno: Implement SMEM-based speed bin
Message-ID: <7ynodjzjuxwwqkjgns5jtnkckw52qyldfpsqpjh7645swva4xk@7wucftyjyyy3>
References: <20240404-topic-smem_speedbin-v2-0-c84f820b7e5b@linaro.org>
 <20240404-topic-smem_speedbin-v2-3-c84f820b7e5b@linaro.org>
 <hi7vzqm5ebypzs6m6bw64ghgfwsdzuaxy65jpah37iw5ww7fku@n3c5sucic27i>
 <bfd6aa32-a28e-47a4-82c7-76c5dd99a44d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bfd6aa32-a28e-47a4-82c7-76c5dd99a44d@linaro.org>
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

On Thu, Apr 18, 2024 at 11:51:16AM +0200, Konrad Dybcio wrote:
> On 18.04.2024 1:43 AM, Dmitry Baryshkov wrote:
> > On Wed, Apr 17, 2024 at 10:02:55PM +0200, Konrad Dybcio wrote:
> >> On recent (SM8550+) Snapdragon platforms, the GPU speed bin data is
> >> abstracted through SMEM, instead of being directly available in a fuse.
> >>
> >> Add support for SMEM-based speed binning, which includes getting
> >> "feature code" and "product code" from said source and parsing them
> >> to form something that lets us match OPPs against.
> >>
> >> Due to the product code being ignored in the context of Adreno on
> >> production parts (as of SM8650), hardcode it to SOCINFO_PC_UNKNOWN.
> >>
> >> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> >> ---
> 
> [...]
> 
> >> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> >> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> >> @@ -6,6 +6,8 @@
> >>   * Copyright (c) 2014,2017 The Linux Foundation. All rights reserved.
> >>   */
> >>  
> >> +#include <linux/soc/qcom/socinfo.h>
> >> +
> > 
> > Stray leftover?
> 
> Looks like
> 
> [...]
> 
> >> +
> >> +#ifdef CONFIG_QCOM_SMEM
> > 
> > Please extract to a separate function and put the function under ifdef
> > (providing a stub otherwise). Having #ifndefs inside funciton body is
> > frowned upon.
> 
> Hm, this looked quite sparse and straightforward, but I can do that.
> 
> [...]
> 
> >> +/* As of SM8650, PCODE on production SoCs is meaningless wrt the GPU bin */
> >> +#define ADRENO_SKU_ID_FCODE		GENMASK(15, 0)
> >> +#define ADRENO_SKU_ID(fcode)	(SOCINFO_PC_UNKNOWN << 16 | fcode)
> > 
> > If we got rid of PCode matching, is there a need to actually use
> > SOCINFO_PC_UNKNOWN here? Or just 0 would be fine?
> 
> The IDs need to stay constant for mesa
> 
> I used the define here to:
> 
> a) define the SKU_ID structure so that it's clear what it's comprised of
> b) make it easy to add back Pcode in case it becomes useful with future SoCs
> c) avoid mistakes - PC_UNKNOWN happens to be zero, but that's a lucky
>    coincidence
> 
> We don't *match* based on PCODE, but still need to construct the ID properly
> 
> Another option would be to pass the real pcode and add some sort of
> "pcode_invalid" property that if found would ignore this part of the
> SKU_ID in mesa, but that sounds overly and unnecessarily complex.

It's fine, just add a comment please. Maybe we can rename PC_UNKNOWN to
PC_PRODUCTION?

> 
> Konrad
> 
> Konrad

-- 
With best wishes
Dmitry
