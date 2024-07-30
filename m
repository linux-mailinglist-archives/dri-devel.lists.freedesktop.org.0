Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A329421E8
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 22:58:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33F40897FF;
	Tue, 30 Jul 2024 20:58:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hAPpX6je";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D06D897FF
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 20:58:31 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-6678a45eaa3so38442497b3.2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 13:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722373110; x=1722977910; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XGUaTjGQRuAuPX6hVxi1800E+WAYIuykUFeGcako8TA=;
 b=hAPpX6jeXlEBRHLMfXWXaLVyGWj7A8ERLTr13RpocMGzj0R3bLBTKYMNHBwkoogJgX
 USFm6gTc3q7dkJxqHDF5yRK9yvLsawUt8x5QKzMROAxYQYrxEgaYTRrWCBaLyzfhGPM3
 qwexl6cVdX86GO4kXRzjWdeuZp7DdSm2pc0lmIXCXquuq5m92GS4CXY+DXTmBFAMrOOk
 DaGZUIsULDgj+K5gmIgyxihrBPnmHIlF4LXk7STnDVsdAPO6win3A3xY02MOd9ibElHS
 nWORU4RLnEKaDsMbtsFDmimjh6qIuD+Q/zGrTpSmTYCx+SJ1TQwdu2Z89jJrQafxS01/
 v0Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722373110; x=1722977910;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XGUaTjGQRuAuPX6hVxi1800E+WAYIuykUFeGcako8TA=;
 b=KPh4R1yinpHGIx7DV1K/QhyhEjJvYDHIWY62ByGbpvMW5W1bFfi+GnDpviDmuEgbuD
 UD2s0iXa39nqCq4duuVo4orVXKKg/CR3d1iiE7o/gktGQ75wjfJqEpcq+5QWPgnC/EJ4
 xEp5u1QV5EMPDD23NVIZj84e3E6zUWu7GhuRpOrGlhGOZyUUzpA9KiWd2izRHNCdTpfu
 hGiMX1RlkWsR1bZjPIVOx3YzGH32WZINQEtABrRQcjUmxAKayTw3GxPWhukUpzzHGjek
 GzjHLclsvPafrwU4w3pADHZx4FbCt7Ty6Ej4GaJeN4pkx6FIA339wjgGBp53Li6soElX
 qRxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVd31pR6zSXr5Bwwb9hSVtelfuVrMzc0DYHJqRLYCSZ3eM7DlGu73pWE95TFucOqGrNN0ISaUBAzdZhCF9FbJIVjpr94R37hEY55mnP+oVe
X-Gm-Message-State: AOJu0Yxy06qq70Hyrco+TSsRmd1MoNrufBrZ9yXLW345Vg24mPSZRazi
 1saSqJOJy9Bcroj2HJ3UWAr0qlBF+rGw+asDDjF97xx6II13fKJTV6JHyR2+4FbCAz1CytFhGsy
 DiV4NRdRLu7+NDmCnRuIEFs0DdTVhNd13ev8icg==
X-Google-Smtp-Source: AGHT+IEFdstUV3s569N4xmNZPfLmtLOuBbMPT23NlFXs8kvp1e28N7b4BtDXg7e18g/cEAZfmGMoiN3PiWKUt0ViFDg=
X-Received: by 2002:a05:690c:f05:b0:650:859b:ec8d with SMTP id
 00721157ae682-67a0625250cmr156264557b3.10.1722373110344; Tue, 30 Jul 2024
 13:58:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240730195012.2595980-1-quic_abhinavk@quicinc.com>
In-Reply-To: <20240730195012.2595980-1-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 30 Jul 2024 23:58:19 +0300
Message-ID: <CAA8EJpp0pQ9j6qQbQajUj=qHdYWeiB2nedT0oQhxsGjs3t53CA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/dp: enable widebus on all relevant chipsets
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Abel Vesa <abel.vesa@linaro.org>, 
 Bjorn Andersson <quic_bjorande@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 dri-devel@lists.freedesktop.org, quic_jesszhan@quicinc.com, 
 swboyd@chromium.org, dianders@chromium.org, andersson@kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
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

Hi Abhinav,

On Tue, 30 Jul 2024 at 22:50, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> Hardware document indicates that widebus is recommended on DP on all
> MDSS chipsets starting version 5.x.x and above.
>
> Follow the guideline and mark widebus support on all relevant
> chipsets for DP.
>
> Fixes: 766f705204a0 ("drm/msm/dp: Remove now unused connector_type from desc")
> Fixes: 1b2d98bdd7b7 ("drm/msm/dp: Add DisplayPort controller for SM8650")

The issues are present in the following commits. Please consider using
them instead:

Fixes: 757a2f36ab09 ("drm/msm/dp: enable widebus feature for display port")
Fixes: 1b2d98bdd7b7 ("drm/msm/dp: Add DisplayPort controller for SM8650")


> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

-- 
With best wishes
Dmitry
