Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0292848FA8
	for <lists+dri-devel@lfdr.de>; Sun,  4 Feb 2024 18:24:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08C1810E0A7;
	Sun,  4 Feb 2024 17:24:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Q1nwSozu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
 [209.85.219.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A687610E04B
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Feb 2024 17:24:13 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-dc238cb1b17so3359088276.0
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Feb 2024 09:24:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707067450; x=1707672250; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=T1P19T303L/B43bwnD9+Y7IOxEcnJdUhgKJO0qIHJpc=;
 b=Q1nwSozu7qxX6V9GxbU05RvHqdQYJdr8Vy+ZpK3h1vuOVC1iIgF1Jv+4jiJ037ufyU
 Y+SL4fIpzliFhsATqvWBerQfKmKEIbWJeBy3OhitZgHiPQ0ncDIX2QTwWqb4YrtjEG11
 580gbxSo3n9WqP8zxhVrm+z+n7Nf5Czm3uO1H5T6PtMllkUKZiPNgQmNJnIS4jpJl3dO
 Iy0LPuZDUZoCeP6TRy4lEdh+LYxcmiUMJu5PgaTyb84iFvz5pnGv97DmQxGVChKRb8pt
 imLgNUqSz5JL4MuFvLWKPrcOKxUCkScQV90QdpGYszgKMhFKcdn8xHpK/IBxCV1OnMnt
 0DGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707067450; x=1707672250;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=T1P19T303L/B43bwnD9+Y7IOxEcnJdUhgKJO0qIHJpc=;
 b=BwDEkVpOeur+3BPLmoPskTQrOfgOauqsDvWvk6YjiIAnpv+mi9qMv2kEUsrocwirbO
 UD3hkSX11oUHjVKiee1XVwFucoal5fbamqtaLPcENeStTwTzPMMuDw18hQg+G5/P7ZOB
 Yt17OTuR36VGwhy336jqoFqrTKt8C6giXusVjiR5TUhKwY8XRMzvkY8lnGzXOsw1nHn/
 xO8HYHX6bfPPcrg1suE1qsaeNlvIjvcCWv7JlV0o8kyNZRBq1cmPb1irFHdGfIljhpO4
 iFr0ZpvJ3Ggims/gTM1dNspH899fnwiCZ7/faaQEkUgYC0s4A+/Np28fSCRdFm1+Y8hA
 imzA==
X-Gm-Message-State: AOJu0YwUYGyXMI9xKOVnHXKhAZeW/Y2NCIITiBIx4VabYI7uIn4QFCWe
 ylxB1Om5lXR7V5bvoQpj8iNfRqbdwwWn6dkU5LcGxgo1vdrrOVaO0bQbEonhW0kLteeXFKuT80/
 ZgZls333zjCATtV7EdKVZ75XdFDL+UUKHptug0w==
X-Google-Smtp-Source: AGHT+IHZYVkC99LHGk0ItLne/MvFpBr+BVnK1MV9EqBBA9F3ArKp+lRF7UX8mtilpk16mlV1PhE7o33VzQh5K0Ob39s=
X-Received: by 2002:a25:ac5e:0:b0:dc6:4b37:e95 with SMTP id
 r30-20020a25ac5e000000b00dc64b370e95mr7149348ybd.26.1707067450280; Sun, 04
 Feb 2024 09:24:10 -0800 (PST)
MIME-Version: 1.0
References: <20240204-drm-msm-dsi-remove-open-coded-get-bpp-v1-1-c16212de7e86@somainline.org>
In-Reply-To: <20240204-drm-msm-dsi-remove-open-coded-get-bpp-v1-1-c16212de7e86@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 4 Feb 2024 18:23:59 +0100
Message-ID: <CAA8EJprcdzEzYKzscyB0J5VrWfF77xJs1SZaoCpP-GQZ2AFmpw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dsi: Replace dsi_get_bpp() with mipi_dsi header
 function
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Sun, 4 Feb 2024 at 18:04, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> drm_mipi_dsi.h already provides a conversion function from MIPI_DSI_FMT_
> to bpp, named mipi_dsi_pixel_format_to_bpp().
>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 18 ++++--------------
>  1 file changed, 4 insertions(+), 14 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
