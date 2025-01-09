Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED01A06A19
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 02:03:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE07D10E2B3;
	Thu,  9 Jan 2025 01:03:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ipZjEjvJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64EFD10E14E
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 01:03:00 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-5d3d0205bd5so424073a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jan 2025 17:03:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736384519; x=1736989319; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=HIgUgl4N79dadeiXZRtpkyo/N44P164pFj//QzRGV20=;
 b=ipZjEjvJsEODPUOWud7WPHDyom3zrGAFS6g14N2UdWeKSubvS2VFp3lPZPIAn5y4QK
 D8bRD+NHkjht1pVmI0bn+kPuFb22P9kzsOz1P562evlQuWmibTxCkHLI7OAjPFDpbGH/
 ejnnvQF1AG3iwNzle8Ol2QtWGctISRWwUTYM8p1fAihDWjrsr1ppcJQ4WmZ8EjpJ/O9c
 fYhlwG+Um5yJRMeb/2PQBx8BAQ/8NRyao8xhqHwcFA9gVlaaK9eYo/aIP9J8lE21jV9M
 JoGSuT2UuG6R4/xUpmkT3BJ5a5JSCDqrGhF9DyDpRkpjg1qA8VDZnJ4tFyg1Mk+rYKTk
 zvaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736384519; x=1736989319;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HIgUgl4N79dadeiXZRtpkyo/N44P164pFj//QzRGV20=;
 b=OaZAfF/BeML/+oBdrBK/559ieG3GjDEDvaSxU6amlmC16lb+Usce7ID8+msbIWa9rP
 0fX4i1iPApWy65Np7y5vF0E0GtNIH3nciXzByRgD1UYGLbq/D5Fqp+T7TN7L575x9pqJ
 0eGdRYt/YeT7HVAOw/TpSD06GPAJ/mE1CX6SjV98ZmY/7nf1zFReGKJCtl5kthggvFCT
 sg0wPXGXVIWezR5iEFkxTcq/z4DNhPz6n0VzU6vYvvnLmMkNaBvAqDlLl8FEjuYvP842
 w5zLzbrkLIvDw2yhmng45d2XvpwzVFY7OvDcq3DQJzJ3V5GUL7EPYRS2F4l85E9oey3y
 3MCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWo00gRruLP9uxio6RtikRAxgrfElKvXLs79Ygkx4usiL7X1OWJ/wkoxElYds8f9taJz4gUGM7WaqY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxtVAJ8w5c4cAdBf407XWIUR/qZQ/8jdHLoE2ln0RY2ahA8do/8
 Nrwep0XL4sv4W7rkBl8D27QkEI5Zk0wqoXQnWGybU+FWrbgSuw++5Cn9lZByeg9xzy/s1YB2vAO
 J
X-Gm-Gg: ASbGncs7ORgBK6E6K89iZo27zT+sXS68T9A672TjYgqCeG1rQFDVTHYYX799w6EYpQC
 De0oNgqpgv3jaPexqSsvR8swPfRMzP617w9xVZ44jD21Zvq8Vz8UPR8zR8fTNyNhbJXrwhbL6+z
 rCj5jC3GZj63hUTemG9AVHQT0Fo2BnGjmjfm+zWg78TjTAhfs+yakJEnxeBFNVHiiyc0JsVk4fF
 cXq4KgLEsToEt5dco98Kf+rFw6A1GMuvSDcT2VK1G82BlU+M2fHhFfzVn2wV9hGSVUmvbXjuG4n
 dk08/sw0Eb4/ESZ1uOv9DlBohleywKdp6u+u
X-Google-Smtp-Source: AGHT+IELUqPRnCGpQ4QsIILyGi10OQNYGAtMxjnWsGZVt+RoeZcTFjHg8GOZFcw/nz8qgnwgQ+uKZw==
X-Received: by 2002:a05:6512:b0f:b0:540:3566:985c with SMTP id
 2adb3069b0e04-542845d1495mr1192732e87.26.1736381155638; 
 Wed, 08 Jan 2025 16:05:55 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428be49a28sm30057e87.42.2025.01.08.16.05.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 16:05:54 -0800 (PST)
Date: Thu, 9 Jan 2025 02:05:51 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, quic_abhinavk@quicinc.com,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/msm/dpu: Initialize return value for
 dpu_assign_plane_resources()
Message-ID: <nlxhx5dlc6y4m5htbfv6l27ms66jpse4umj4c42fzrcctnvy6a@5dbsjmuqsjwn>
References: <20250108-virtual-planes-fixes-v1-0-420cb36df94a@quicinc.com>
 <20250108-virtual-planes-fixes-v1-1-420cb36df94a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108-virtual-planes-fixes-v1-1-420cb36df94a@quicinc.com>
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

On Wed, Jan 08, 2025 at 02:40:47PM -0800, Jessica Zhang wrote:
> Initialize the return value so that the dpu_crtc_atomic_check() doesn't
> fail if the virtual planes command line parameter is enabled and no planes
> are visible.
> 
> Fixes: 774bcfb73176 ("drm/msm/dpu: add support for virtual planes")
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
