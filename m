Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4246396678A
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 19:02:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6ECB10EA0C;
	Fri, 30 Aug 2024 17:02:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="X2kRVr1I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BBF510EA0C
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 17:02:09 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2f029e9c9cfso24510841fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 10:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725037327; x=1725642127; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=iy1KwRpNUGkj+C8RUHgjHvQd7fkZ5xQBFwgIdNo1D+c=;
 b=X2kRVr1ItOcnPUTz0TdfRaHuxaTMN7qYyZ+p684bs3A27w9ig/G3wuaMRKN8XTnBp6
 GgrTyDyTOV/AmlkawvwJSC+8yp7H6LGxkfzWh56J3PjkxsmvxqXUaLaXm7cj06vPtOAH
 zMDnsetNfnampDLN6KBXEi7JNP0AAn33f1fe3PJVpx1rYbxk5icsvP5bG6mBXn1Q3zwT
 Fop5S13qUgS3ona1wTL77bh4Vz9hLivXqt8y5fYIdz1V6kXUcOUwLmL6wQfyiQqeVmn1
 c+0/7UukL4l9Jzmohwlz+8yFoz7bdY40u8dfzxuNln5bpG4eEp32uhrLJoyX9BTwME41
 mEcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725037327; x=1725642127;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iy1KwRpNUGkj+C8RUHgjHvQd7fkZ5xQBFwgIdNo1D+c=;
 b=SNgGatasNi2DFYYcS4xLNSwrz4oV1v3yp6XVn1okro+WTvNt/IbeRuC9rtdCTmCGYd
 M0jglPXV/oO/lZIQqmxDTVykEshEi6nYYlO8HUmUrBAacocJdXutR8TqSzn7NbXG1rbA
 bxRv7EmyzUQlRZheSlGKSzzp3E0GatJhh9Uk0FfQ5OUjnoUr9TvgUguAasw1XTpel85Q
 NGxOQ7Hn6EsiWONFhz0L/+EsMXOhpfWtsg9l/BLJ77xMDKAE0Qehtlx8EfRGpqlo0AyU
 QGY045A90/tRc9N96pcpY3/feZCtoS8CJ2bCZ3kxS0g+s8khutAj5kdPMOmPQZsBQCU2
 dKyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6qwQ4jQ8Q7y6b2VgkExkvxq8O0wjRewz9AjoWZwqBc/99/m99cdZuL5MMBEe3pm4ecXP+Dfg9WbY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyHYprZiHIgXWyKnW3v2ryRTxMm8pE0HzDuHJCQPfyVrzv0b+K4
 9CA/WEDH8UTsbvTvRWiWlUFOqouKsJfRNNoHPzfB+pelgTP12iM0kjHCfG6i6tU=
X-Google-Smtp-Source: AGHT+IEPQ7h9WzerpnvpweqQa77Ds37RhEPya9x8ww4BvxZHsuGYMg+Xslva2ggdf/iA2e994Xil0Q==
X-Received: by 2002:a2e:4611:0:b0:2ef:22a6:d90d with SMTP id
 38308e7fff4ca-2f6108aef13mr51280371fa.47.1725037326455; 
 Fri, 30 Aug 2024 10:02:06 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f615171e9esm7432711fa.77.2024.08.30.10.02.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Aug 2024 10:02:06 -0700 (PDT)
Date: Fri, 30 Aug 2024 20:02:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, quic_ebharadw@quicinc.com,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH 09/21] drm/msm/dpu: add devcoredumps for cwb registers
Message-ID: <ur3mio35j4pgjuykbh4tyqroherz4oh6qnaw2jm4oq5ecj5yic@bhvdr7xtnelb>
References: <20240829-concurrent-wb-v1-0-502b16ae2ebb@quicinc.com>
 <20240829-concurrent-wb-v1-9-502b16ae2ebb@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829-concurrent-wb-v1-9-502b16ae2ebb@quicinc.com>
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

On Thu, Aug 29, 2024 at 01:48:30PM GMT, Jessica Zhang wrote:
> From: Esha Bharadwaj <quic_ebharadw@quicinc.com>
> 
> Implement instance of snapshot function to dump new registers used
> for cwb
> 
> Signed-off-by: Esha Bharadwaj <quic_ebharadw@quicinc.com>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
