Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBBD38D05E
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 23:57:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EAA26F920;
	Fri, 21 May 2021 21:57:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 893E36F920
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 21:57:12 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 d3-20020a9d29030000b029027e8019067fso19321676otb.13
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 14:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=Pd7ky5cxDb+qxzJPiCzfS73ME9CuHoqRQM37v+k83B4=;
 b=hEWVM/nvf00TFCvYEtUvgRbGojwxiR3Xlb4OIR6nUJv/kcZu76ZTGZ7ogyUEeilbIC
 tZYDOwLEzD9l2dpBfqePGUkwUp2OYTw16Kip9gbdyR0H1OKM42auzXMCFM+47ulZUuph
 6Lym33huSHkbIkeNSWu3+jZgbAA1er/HDgAug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=Pd7ky5cxDb+qxzJPiCzfS73ME9CuHoqRQM37v+k83B4=;
 b=IuUa9Yto65KFoUdzrvRVrBAL2yu201RfZcRPpDFmnYUd4kSP3sMTjPZhlg2IrYzFFw
 l/daQ8wpvePdkM4L0wpgyhS1QgvMZAjRSViqNOVcJ+BTPlF8EZlFPtKqw50s/jC1EyDw
 uhmsFAw9cJnB129kJTyaI5x5P3gZnUPwGm37sOvQcUCtZoUnsXoRL9V0Ej3cA0P8bewe
 o0lCJyE3z8sexwBg77U6CA/qBv2rA2m38eZwVnHfV7EN45uMoWa5fJQPvC/bV3Gm6MwG
 oia4RjzELaiv8gg+d0Mn5ECT9lhAUSsRfijdln5VHwyDqOmmIKEqEg4M/fYHG/LnW0sr
 U6vw==
X-Gm-Message-State: AOAM533wp2RHxCiAyatMnjI7/fO9Xqh6S0Mhc8CkBBYkRNx3/mpAXCPR
 Rs4TMfrMpFxpVsKKAWJaCRABslCZh171R8s9S7PFPaFT25I=
X-Google-Smtp-Source: ABdhPJyjbsrGqouAWtP/zueb6T/6vS7R8/wyCxfqpPAl8atKW0srTtbu4Y125oTZNM8SGNMwKaikdSMQ7jjhuRI9rTw=
X-Received: by 2002:a05:6830:4a1:: with SMTP id
 l1mr10235034otd.25.1621634231832; 
 Fri, 21 May 2021 14:57:11 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 21 May 2021 14:57:11 -0700
MIME-Version: 1.0
In-Reply-To: <20210507212505.1224111-1-swboyd@chromium.org>
References: <20210507212505.1224111-1-swboyd@chromium.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Fri, 21 May 2021 14:57:11 -0700
Message-ID: <CAE-0n53jA7xPctEU9TkBf=eot4SGs85gpGMjUiDn_ZiMvVLvKw@mail.gmail.com>
Subject: Re: [PATCH 0/3] drm/msm/dp: Simplify aux code
To: Rob Clark <robdclark@gmail.com>
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
Cc: Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <khsieh@codeaurora.org>, Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Stephen Boyd (2021-05-07 14:25:02)
> Here's a few patches that simplify the aux handling code and bubble up
> timeouts and nacks to the upper DRM layers. The goal is to get DRM to
> know that the other side isn't there or that there's been a timeout,
> instead of saying that everything is fine and putting some error message
> into the logs.
>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Abhinav Kumar <abhinavk@codeaurora.org>
> Cc: Kuogee Hsieh <khsieh@codeaurora.org>
> Cc: aravindh@codeaurora.org
> Cc: Sean Paul <sean@poorly.run>
>

Kuogee, have you had a change to review this series?

> Stephen Boyd (3):
>   drm/msm/dp: Simplify aux irq handling code
>   drm/msm/dp: Shrink locking area of dp_aux_transfer()
>   drm/msm/dp: Handle aux timeouts, nacks, defers
>
>  drivers/gpu/drm/msm/dp/dp_aux.c     | 181 ++++++++++++----------------
>  drivers/gpu/drm/msm/dp/dp_aux.h     |   8 --
>  drivers/gpu/drm/msm/dp/dp_catalog.c |   2 +-
>  drivers/gpu/drm/msm/dp/dp_catalog.h |   2 +-
>  4 files changed, 80 insertions(+), 113 deletions(-)
>
>
> base-commit: 51595e3b4943b0079638b2657f603cf5c8ea3a66
> --
> https://chromeos.dev
>
