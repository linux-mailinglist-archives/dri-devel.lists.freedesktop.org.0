Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4495177F6
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 22:21:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80B9A10F40D;
	Mon,  2 May 2022 20:21:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C94DE10F40C
 for <dri-devel@lists.freedesktop.org>; Mon,  2 May 2022 20:21:48 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id a10so16291027oif.9
 for <dri-devel@lists.freedesktop.org>; Mon, 02 May 2022 13:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=Hnmgk1ySV+moaLIfrdDLqyWaX7EZfxJDQNVTelHhwlk=;
 b=gydCa1XT3apUAkWqXWGcIv8NATUn3b5OIjEgWQojw1AQGHzMfpZeo9joN/mAtp6vF4
 RATtUVBlgARss+TIibRbANVlifmimy169eXr6DHY32MIJqavLG7QyZWzHaVCqkKbsbGH
 bTsbNB8No7BI70qEq7TAxEiYAo+mL6p0QUQVo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=Hnmgk1ySV+moaLIfrdDLqyWaX7EZfxJDQNVTelHhwlk=;
 b=r3buncYHx6L4NvnKM9WmL22uQ9dVEFM2etA9LKssI8HO5700dUZJgGT9qj1gHd6fFC
 1cPT2Nose37C5dD6b6UX+iMEaPrjxeL4aqxjQw5sGDpz90MHUsMKD0bEoBG4Zuwto0ui
 5GyBc1x4KytRd8ENG6jKc2CN6yE4kEXbZFWlJ/5gvF6lXMU7MJ6tZA5N1qpDqxPOW9aU
 AKHo5pAqOrMYac+1qaeN8g46gFC4WqR3ptGsWaPva7XTTPSl4DWMDq+GjCBhXzW/RM3D
 PNyVPHTVyYsR9TR5AF53P2h/VTnYyLQhkiKhHH2mxa556URiiqTqfTqiilr7VtbvdaIx
 kK5g==
X-Gm-Message-State: AOAM530zyG6Q6pFGEo3Eb9IboUydgJh2IzrJuf/ZrcVXEtaBnUdtYr9N
 1RdNJuwc+3dSEFvK0GdZFGLO5ENg9Mmr+4YfNIMkBQ==
X-Google-Smtp-Source: ABdhPJz7Vn608xLnAEGnfBR/CF4+B1u6SgDOO8wJhOwh61lwA74hFrR7wESd2zWhIRSmS2D8o8Hov5xpX/cGP4R/d9s=
X-Received: by 2002:a05:6808:1296:b0:325:8fb:68f3 with SMTP id
 a22-20020a056808129600b0032508fb68f3mr389482oiw.193.1651522908083; Mon, 02
 May 2022 13:21:48 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 2 May 2022 13:21:47 -0700
MIME-Version: 1.0
In-Reply-To: <20220430005210.339-1-quic_jesszhan@quicinc.com>
References: <20220430005210.339-1-quic_jesszhan@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 2 May 2022 13:21:47 -0700
Message-ID: <CAE-0n53rPrJwK+6BfdeDR-LYmLTrdbvagrQZzGtM34OWtW8aVA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/dpu: Clean up CRC debug logs
To: Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 seanpaul@chromium.org, dmitry.baryshkov@linaro.org, quic_aravindh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Jessica Zhang (2022-04-29 17:52:10)
> Currently, dpu_hw_lm_collect_misr returns EINVAL if CRC is disabled.
> This causes a lot of spam in the DRM debug logs as it's called for every
> vblank.
>
> Instead of returning EINVAL when CRC is disabled in
> dpu_hw_lm_collect_misr, let's return ENODATA and add an extra ENODATA check
> before the debug log in dpu_crtc_get_crc.
>
> Changes since V1:
> - Added reported-by and suggested-by tags
>
> Reported-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Suggested-by: Rob Clark <robdclark@chromium.org>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> Tested-by: Jessica Zhang <quic_jesszhan@quicinc.com> # RB5  (qrb5165)
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
