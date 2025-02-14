Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D21F3A36194
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 16:25:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E755010ECF1;
	Fri, 14 Feb 2025 15:25:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="McmSLo55";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17D7710ECF3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 15:25:11 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-3061513d353so23028511fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 07:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739546709; x=1740151509; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=0QV017oy9c2+67TXbcW6HEVWCD0Wca5ntOQ3G5XPdyw=;
 b=McmSLo55hcmPYIuZWdwXPkSOlaBxO6cz+Hns065UNRbLXcIX9dx+e2ZMn2MvxhSk6p
 S+niqdl1kww4YaxZbpt+Lw00VIMa+JqIPF0gFejaj13REn+0xytPP+ALM32l4j27xUqP
 /rCZGFNYke7FS//IHgBFOqVxV60g8EiWyy+yW4Q4YpLl92gKhh4EJu0a9GP+Fp7Aqmte
 u1blbepsLC+LzL9LbBKuiFogM/SrX7zkyrtqBWEs6b7J9n3QOy7wc0l4uVi7JHVO/GHr
 BbwZihXuygypHvMNAaprLrlGZUNx8+Mz66M3LqrunSEIuuyzgbcNaaXQMiSzQMmcRbGy
 wZqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739546709; x=1740151509;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0QV017oy9c2+67TXbcW6HEVWCD0Wca5ntOQ3G5XPdyw=;
 b=t0MZyum7/DDtJgcKalcSDYNFPCvOPKYiy7vby1cfbHSrBT9jZqb6L/56dgahP1MgAc
 aCYWRC4/JuAK6ohs+HsZYRfndw/rLvpayNjHFXvtqbfow2FTC7W3F2Ug13XIsbCnVwyx
 4i4CYCkHhHt8EF7k4HaHiwoxV/ZpFUQWb6gIo5Xh4GEI5dJ1clpehib4SC45bdDnGdFy
 RHyvsJxWBSoUrnINXtvCx7eTeqGod6A6spmHaYtzsAHBjWZYxcMjvGB021x4JwN13Bnb
 zi28HlIupRE6FrKyoI2Z2Cr9z/XNGn2KsKwl3QWAxSTJkI08UWObQ9fgSLz7DOKhGka5
 ttGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWaqN+8q5lET0r5vaoRlQOfbIBV5yeC+pqokFJQI4Hl6Rj9SptA7dmTfRGZoEKTyzKXFPx498CqYNw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxcmAk3OXPbO5In+WTHvW/it1SVDpidAtvQcsMm27a8QJTQQzsV
 c6Qe7SEW29oqF10MXGysxbfSRPyXT2YNoAZhYh5hCA8E9G1uJj5dR2iMz81P3EI=
X-Gm-Gg: ASbGncvLtmZoY4rzugc6LY36ysAp2d7ZcVmFLrHuvamTgDd0y5XzOnsbE5wRATDfrJZ
 AHeX6aDR6NxdFctgIQp5n0ljHhe+hwN0Zt9wd7tPPUTS34vYptuYiwjfeI159bTTAYNKemfzExi
 42udMlFgo2HTrbKXlVaZh3GjA2yevHo76cDU+tFdAOglCgyInXGkLQ628hPlrBpVF7WseBgqo1C
 7qxaZrq/BNIKPy1qkjsFctuY1+WhcifcA1dEcWXNp9QsZ8tKcvJTolvTRSS8+SMUhY95Na7iF/J
 n9a+bA8qXLP+kt5lRYHSQuJFn9eyOYB2b3H/zSyn60swPSsxAOuyRONse+DYYxhucGjfqx8=
X-Google-Smtp-Source: AGHT+IFEbu/Es9QSrWtt2Yag3f1NkYdoImR5hqO/3iTeDk8yGy2fux53rC1a2Q7G+vsrvcqf91Iq6g==
X-Received: by 2002:a05:651c:b20:b0:307:af84:3e6 with SMTP id
 38308e7fff4ca-309037abfb4mr33795161fa.6.1739546709373; 
 Fri, 14 Feb 2025 07:25:09 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-309100effbasm5921531fa.29.2025.02.14.07.25.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2025 07:25:08 -0800 (PST)
Date: Fri, 14 Feb 2025 17:25:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] drm/msm/dsi: Drop unnecessary -ENOMEM message
Message-ID: <ipmzsjejxpdtpknjbvhn3774nkkm722qtuwvhnv5njnl3afjei@p36q3euy5j37>
References: <20250214-drm-msm-cleanups-v2-0-1bec50f37dc1@linaro.org>
 <20250214-drm-msm-cleanups-v2-4-1bec50f37dc1@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250214-drm-msm-cleanups-v2-4-1bec50f37dc1@linaro.org>
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

On Fri, Feb 14, 2025 at 02:17:47PM +0100, Krzysztof Kozlowski wrote:
> Kernel core already prints detailed report about memory allocation
> failures, so drivers should not have their own error messages.
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
