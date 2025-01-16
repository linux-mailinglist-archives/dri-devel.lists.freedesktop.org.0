Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79117A13428
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 08:45:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC10D10E8E3;
	Thu, 16 Jan 2025 07:45:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="SOkPke0u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81A6510E1C8
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 07:45:32 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-53f757134cdso650352e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 23:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737013531; x=1737618331; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=SF4kJSME40b8HtlbDBsx+ifq4mTDH36yRswbkqZsxSo=;
 b=SOkPke0uCE8VxSr5DZvujjJcMWadg4nQkeeOIXYKZi5yfu+VPQUnbiKqFCuLHflTcg
 knntxDkHDOs77FE+7XVVLssI+eKFsKQdOPBOnG7unITx6VJAMKVC0g0KXOmbjU0D5p2L
 pozO9n98MEfyuoR4HRAEXyfhsg8Uv1jU610TM5UKEoEJYIUeZKCawwgwyu2A5qDRy/I1
 oct1vDd7opDHK5HpORgvQzij/jK5Em9ixUohf83jxcI8pdEtGC3yNecusjomcIFyv7Al
 WuGMkLjAxKUxORjEnW9IqJ0gja9iNmtP/VJikdY52oe1I3ZTlehZAgVtjclCMXh2MfHV
 Jgsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737013531; x=1737618331;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SF4kJSME40b8HtlbDBsx+ifq4mTDH36yRswbkqZsxSo=;
 b=eQTZweO+zZDm2FCEM5fzipORQnyHl4z77edRWA1J1dFqfLy9FmYeMG6gN0rh5ZEPL0
 BRrK2/opQgi4ughatQ09m0kWC9hHqVVuS/EMPBRRqyV/bZ2qdg3UjlRv1o+0z5hNts0G
 dXZwB36tKh2LG/o5MyyPfvHdEud12wrbfEfXL1YuH9AZOUeBKfm+LdH597NJnD/4AYdd
 77a7y2x7e8i1pv6lWXoBryHY/ZlSvTLFu+/utTRjGIgJkgA13k68RryCQfTHyNOX6t/Y
 p4LvMcIAREFVWdwlGCpkM38D95fD+l/A+xWh0m3xXUzZigVyqdAx/GZvK9kkD2zz2z/I
 l/Iw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWedzx7jZcJc7cQYKIqvUJrs+6rO59DvqailfNp+s/NYaZWptNKU+BtcsrG747/FXDwTJZy1J7TOs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxH6inGKoTOcJ7bU4Y/cuO2SYHoXa7AmdAEZgauXaHnWUJvIw6S
 7YTrFHlbAWv6Z/EZSeB1D9xE7UsJwW3E84rRBADOmecWR7fPXNAbkrpI8Y12moI=
X-Gm-Gg: ASbGncufM3QBN+jUdVmgpn1Az1Qhc7rtlnDMjB6v01LcTAxSrfen/GuhO1Xi3GUUDLV
 GhQxZ9LVs19t/EeuIB0DFzGohVbIdHuacpWOfxVTjq4CBhEidaAJiykIjI7nSjOkYIX+eOmfGoE
 wA66A8icW2c/xNpwwSoLZpVUdbVSoEiwYF1FgRQzuD7AXh3QXOsZX39ltrEp5b3stGCclfgcm2t
 aQpdV9XmFAAdkurB/oIJdtB/V/zdJLp6YlRt5dInwFmDzu2IrwhGTh5saoCuqW8I7UXKj/+h2Cl
 zC9jnur8Qx0ETULcJGEVYqfIex7ZLoCRQCyL
X-Google-Smtp-Source: AGHT+IF16iTWm/Ux1y1yeoWpVsxtYCCgAEvfeQgL8CcjHyHteM6fc3KbQL2N2YDTvHojx/4UlsRhOg==
X-Received: by 2002:a05:6512:10cd:b0:542:1bdd:748d with SMTP id
 2adb3069b0e04-542845bcce9mr10097421e87.13.1737013530854; 
 Wed, 15 Jan 2025 23:45:30 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428beaaa1bsm2219099e87.170.2025.01.15.23.45.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2025 23:45:29 -0800 (PST)
Date: Thu, 16 Jan 2025 09:45:27 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 02/16] drm/msm/dpu: Do not fix number of DSC
Message-ID: <3ea3cus4mgruw52r3mqbhpzj5afgr5762izdm7jqdyhsikhpjx@klo7sce74jxr>
References: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
 <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-2-74749c6eba33@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-2-74749c6eba33@linaro.org>
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

On Thu, Jan 16, 2025 at 03:25:51PM +0800, Jun Nie wrote:
> Currently, if DSC is enabled, only 2 DSC engines are supported so far.
> More usage cases will be added, such as 4 DSC in 4:4:2 topology. So
> get the real number of DSCs to decide whether DSC merging is needed.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
