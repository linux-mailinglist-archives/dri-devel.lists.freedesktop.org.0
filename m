Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0DD890274
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 15:59:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38F6F10EB49;
	Thu, 28 Mar 2024 14:59:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LjLjEtTY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com
 [209.85.219.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE8F8112477
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 14:58:58 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id
 3f1490d57ef6-dccb1421bdeso1034968276.1
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 07:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711637938; x=1712242738; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lVCKoZbBGmgPMba+uygt1ZNYOjbI400KcrPMv9qgScQ=;
 b=LjLjEtTYP0BsP59ypla4wD4AzG981pWeBfA4YqHhSebiKYODC/W0u3NZE8sINGzBx9
 dGOVGjP6taXFJXucf+XXrv9Xom4XeRciUdw3Yjx4IPTy2d+N1QRQSogAaEYyK3dyeFEz
 aitmTO+Wfi6+txo0/eV1FSUjMMtw/7cXV3/4oh3yxIB98sIn8zm/3irbDx2LvO8YQfyN
 b5zrFGs98J5ozCtrCfh4vbchlth/Kqq0eMunlyaRaNUIH5Di0vXzEBKduTB6+4rOgkAm
 Ic5Hu+vn1bxSE1gQf+OKJWK1XxmgRBaVCaJVxLYWYizFiUnS+dG7GwsqGtwgtBh9OpFr
 0QCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711637938; x=1712242738;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lVCKoZbBGmgPMba+uygt1ZNYOjbI400KcrPMv9qgScQ=;
 b=QajinMoWuUYJFtIUd3DBct6uUbIpyeFa2ca2IrlsnAx9vk44HMiILZsSvCjdPfvhwf
 xgtA6djJIX6IiDqJaTs6WcvMQlk0rTAbBcx4aer5XGDNnK/S2XjGYJVMHo2hWX9tcWKC
 oQs7ltrQWPh+SDXGxf0Q3VK7f6g8/9s0FmnSq/yJ8D0ktjuALiwYsOPlupK4advioZjX
 gGU1I7yYR6+yiwiY8ZIuwn9u/OGp3y52rqSwUayQn6pE+LfSihhdDcfKlPyYQ2eVkiu+
 1rBV7fLCScsq/VZjc1ANUIPruVgKguFuyfoTqwmlcksyAX19IpgLF4+IAoa8zCVG38yd
 BdVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAsyaxRnsFS+aP/viQ63gyiRkpLA3AQuozeX+34V29hJDno9MNj9k7VEbWUJu5z/xDMYer93CCrqreCZ/akdTasMfDhLsnufizZoAkpF0w
X-Gm-Message-State: AOJu0YyRd+Glc//0xCLbGSskwTWXy/qfOaFngK63kBCXdpItNSGn02Em
 y9O8lLOsdHD64IhmxJ40H7hGU90DkuZ1rvCAtuQS910RoXUstdevhWtpyDflgqwuDuh663aP3b6
 sPWz/E22ojYvNH1TGNkrOCkgeogbmi29NtpIKcg==
X-Google-Smtp-Source: AGHT+IF+BfSq3vmTR71It1RsEmYi9x9S3nf8WUR4Z19wo3uyG6m3RAGGX4yROeCZyzIC+VlGw62uQlxPCj6DGfxVw0Y=
X-Received: by 2002:a25:ddc6:0:b0:dcb:38d3:3c6a with SMTP id
 u189-20020a25ddc6000000b00dcb38d33c6amr3189252ybg.46.1711637937782; Thu, 28
 Mar 2024 07:58:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240328-msm-dp-cleanup-v2-0-a5aed9798d32@quicinc.com>
 <20240328-msm-dp-cleanup-v2-1-a5aed9798d32@quicinc.com>
In-Reply-To: <20240328-msm-dp-cleanup-v2-1-a5aed9798d32@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 28 Mar 2024 16:58:47 +0200
Message-ID: <CAA8EJpqr=SE_-9JMNd+QksTkVsPJGk-F2tJcAyH95t4RAW5aoA@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] drm/msm/dp: Drop unused dp_debug struct
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Bjorn Andersson <quic_bjorande@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
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

On Thu, 28 Mar 2024 at 16:35, Bjorn Andersson <andersson@kernel.org> wrote:
>
> From: Bjorn Andersson <quic_bjorande@quicinc.com>
>
> The members of struct dp_debug are no longer used, so the only purpose
> of this struct is as a type of the return value of dp_debug_get(), to
> signal success/error.
>
> Drop the struct in favor of signalling the result of initialization
> using an int, then merge dp_debug_get() with dp_debug_init() to avoid
> the unnecessar boilerplate code.
>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_debug.c   | 59 +++++++++++--------------------------
>  drivers/gpu/drm/msm/dp/dp_debug.h   | 38 +++++++-----------------
>  drivers/gpu/drm/msm/dp/dp_display.c | 10 ++-----
>  3 files changed, 31 insertions(+), 76 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
