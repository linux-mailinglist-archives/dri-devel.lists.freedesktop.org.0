Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F01FA88CAEC
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 18:31:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0181910F169;
	Tue, 26 Mar 2024 17:31:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="leL6xffx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com
 [209.85.219.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ACDF10F169
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 17:31:45 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id
 3f1490d57ef6-dd02fb9a31cso5435577276.3
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 10:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711474304; x=1712079104; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9zt/phGBfZSdp8qy9N6Gw8zdXEBb0+nioLRknU84U6I=;
 b=leL6xffxc47ndK17J0r69UV9d6fbDFFmmm0xo4Z9rS0abwvJUG/zg7fR05isYTOp7j
 ZkVhQhHCQLNTY7TlBMzWuI8GcJ1IedT86dCM8QKroEqUqQZpIqCx+7PERfDdZl6nCI0Q
 lfwYkCmf75RlAizy4fT+NpuQnPB2Z0X83QAVgGEpRyd1OZHIf9NhJ6NVlIarWHz9S15U
 rX1aFa3kFILdIyTS6oqX/jXGjGnsWyYQapcQgfyBLdjMa5PdGWCs8fuAQ+qy6/phhSpE
 Gm4+x0cIdeQ+pLTfIpxFemKK1eVyYtNfxMH6jkLx1LiGD+isU8pG+pZRqjdq4JH2bDWQ
 ttMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711474304; x=1712079104;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9zt/phGBfZSdp8qy9N6Gw8zdXEBb0+nioLRknU84U6I=;
 b=MX7lnHiF2+yBfGGCiO5sF9qzYGgGuxqZ2J7HU5DEuHDnAP4hyTBPPP3DpXpvazKgMg
 7mBVyUwIPoDbxbcnvGmzhZ+2BkZvpv2gZezo8bl1B4YaiN0eNeqhIDXUzQ0Q/om7E1Ed
 U/4oYVDkhYpZZTymqe/nh/Oluw/w/y7WBIt5D9DsCMB66RyAGfxnkjbQRYyiHXMOFaes
 UwewpIiZuPRl/F8sFrVTshM/FCJseo7cq6A8XDKe1wmLTLCRaAzW70GO8FoEOCfG3nJt
 kSz3079+eGjtUy9BH2XlgZVZWD2o6jPc8fXqizg+Mz42aJwiwTtyKjY95bm1d+Clzs44
 pSGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpjw75ldS3n9b4Yt3k3HrGLqxrsAIrIbjGpq/JDtnFC2WcVsX8EXkDRC8NYG614B1VCPG0ehWO0WngfR6QJDVOTp3PR5wlhWbnCu3kL6uL
X-Gm-Message-State: AOJu0YweVtuGTGaqN7E6HJBaboj/KcrACNvbFmjaATUyz2U6AKFWwuTt
 t5VfzS480dUNmk2VLLxoXqQlJSUvecdixfcA/7ghiIKRPj+pafpn6ASgG8NlCLuRoxxJdEknQ7S
 WLBsybbaQnGxpzTXZvOoj6enaWaLzF39JNCGvKw==
X-Google-Smtp-Source: AGHT+IHKvErihvCqyYvqxnaKemrvy7TNx3gwuqYnQoUJPA6s9U6270M569opHM8owaC5W9WEJhp8lM+R6e3WArVuFyo=
X-Received: by 2002:a25:db10:0:b0:dcb:be59:25e1 with SMTP id
 g16-20020a25db10000000b00dcbbe5925e1mr291813ybf.30.1711474304335; Tue, 26 Mar
 2024 10:31:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240326-msm-dp-cleanup-v1-0-e775556ecec0@quicinc.com>
 <20240326-msm-dp-cleanup-v1-4-e775556ecec0@quicinc.com>
In-Reply-To: <20240326-msm-dp-cleanup-v1-4-e775556ecec0@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 26 Mar 2024 19:31:33 +0200
Message-ID: <CAA8EJpoJQ+K6S7PbeWt740WhaMRWbNmu2LXz1Js+x8HgzuH24A@mail.gmail.com>
Subject: Re: [PATCH 4/6] drm/msm/dp: Use function arguments for aux writes
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

On Tue, 26 Mar 2024 at 17:06, Bjorn Andersson <andersson@kernel.org> wrote:
>
> From: Bjorn Andersson <quic_bjorande@quicinc.com>
>
> The dp_aux write operations takes the data to be operated on through a
> member of struct dp_catalog, rather than as an argument to the function.
>
> No state is maintained other than across the calling of the functions,
> so replace this member with a function argument.

Definitely yes, thank you!

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_aux.c     | 9 +++------
>  drivers/gpu/drm/msm/dp/dp_catalog.c | 8 ++++----
>  drivers/gpu/drm/msm/dp/dp_catalog.h | 5 ++---
>  3 files changed, 9 insertions(+), 13 deletions(-)

-- 
With best wishes
Dmitry
