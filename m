Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E41429EFD67
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 21:26:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E96210EE95;
	Thu, 12 Dec 2024 20:26:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="f+zm3FTq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BFB110EE94
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 20:26:19 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id
 3f1490d57ef6-e399e904940so789982276.2
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 12:26:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1734035178; x=1734639978;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=NHTrlUxaL8vdfToHnmluTFj/u73SQePE/WFT8/rVGF4=;
 b=f+zm3FTqmG4zV/TcP1P6+Xpjq2xH0zkiAxGiG19EsfNTR0bJeTdj5tJxKJSH5zNrSI
 vzVL7NPGI/In2axebJ0JOpFKXWAcVCU88GcH+ZBfOoaSR62bdav3zpVX2keZkEXE9F4l
 Z0mriBisV5lCTXu6kpBoNrsgT7vx8UPFn58SM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734035178; x=1734639978;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NHTrlUxaL8vdfToHnmluTFj/u73SQePE/WFT8/rVGF4=;
 b=TdOpGKl+H5KRgotXpY/SRi1ps+US/Chr1aQVvAWHlK+yLH7KkVQWYIcUnLNDqjz9ma
 EMpAEGKvaEODwFLvBL8Sz4XENBv8uWBjtIbGU9i6vIyoClTSWAHC+lRFagTYU6LCseC1
 wR8RyU5CeTf15mCU47dYKwO0YqyxuISaXlUSlQp259dth/O973+YE6FnK5pZSt6el+C+
 mkavh4S831RviuTJ/IBr+cAoiEPPZqP84/I6LNiR/DlI5U6/+uQCb5hGvaJyFB4gADxp
 mE3cJ7k7Z71UNWTHB5tcx36ynxm85+8VI9/Ogm8SnYWB6MJm2OrSayj8RGR2do701S76
 TJWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/fgKuHIlOUyqyxSOeKxpJYn1DtHNz7NCj4gndYSMDdsdXrecQyHIsK5dXWPjWNVR39KLP+OZ6ZuM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw9hMfkQCwJGtYIzqrYQaTB4XKQQwE+CIwx6BOMtq4KVDYlzOXW
 82sCynfSMFFIxQLBOX/EugMRAbKOXZ0Stfjfdq1b2wxjxEuPprYSXr1Amh+0DgkM12NtVdBKd4P
 RM+sXyIJU0VvevReuU9yofkfl0TqQMw66Gnhc
X-Gm-Gg: ASbGncuIfGi5cgx4QG8W3KxzhLMUx99Sx9DjGLGcqX04cpUG6XUl/Y7v1lcAdS/ZD4n
 HPQXDh5FfUbbZV1bR2Lj+MtLWu/oMm6La/rtDZ/650Q7rNysytyEjzML+JGPLMYzW9Q==
X-Google-Smtp-Source: AGHT+IGs4i6eqssuEGaehVKE7QOtcQ5CB1FUkhV3LRogQBH52O8B55VM3orOmTDcSA3soHh0ekrOCA9i5WdjzCvIzoI=
X-Received: by 2002:a05:6902:1692:b0:e38:b48b:5fc3 with SMTP id
 3f1490d57ef6-e4350ba9a5emr55975276.32.1734035178204; Thu, 12 Dec 2024
 12:26:18 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 12 Dec 2024 12:26:17 -0800
MIME-Version: 1.0
In-Reply-To: <20241212-fd-dp-audio-fixup-v3-5-0b1c65e7dba3@linaro.org>
References: <20241212-fd-dp-audio-fixup-v3-0-0b1c65e7dba3@linaro.org>
 <20241212-fd-dp-audio-fixup-v3-5-0b1c65e7dba3@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Thu, 12 Dec 2024 12:26:17 -0800
Message-ID: <CAE-0n50N1m5f5vFD+ZP_DM8FbkTyBYP-VWy=yBNo+yd3_zgm0w@mail.gmail.com>
Subject: Re: [PATCH v3 05/14] drm/msm/dp: move I/O functions to global header
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Paloma Arellano <quic_parellan@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Simona Vetter <simona@ffwll.ch>
Cc: Douglas Anderson <dianders@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

Quoting Dmitry Baryshkov (2024-12-11 15:41:40)
> Move msm_dp_read()/msm_write_foo() functions to the dp_catalog.h,
> allowing other modules to access the data directly.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
