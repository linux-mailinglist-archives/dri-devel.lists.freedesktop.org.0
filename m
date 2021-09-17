Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 669EF40F095
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 05:54:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13B226EB52;
	Fri, 17 Sep 2021 03:54:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B100D6EB52
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 03:54:08 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 n2-20020a9d6f02000000b0054455dae485so5902139otq.3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 20:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=d5KyeDq946nuEeP72I+rCwfJA6i1ndu160NKjlUa2U0=;
 b=mt1KgHCUrzi0gHUfIAMUuM50Mo8Ku7RFyKsj1qvnM2za0GMZ7eHfB+N2t9eBxjt7vS
 MVnIxvn0Uz1RI0WYgj1ULdJJHLoi4wAHt2ST37m5sfn7bGAXLpGsbL/FULbxhsq2T37v
 DkIQseFnkfaed/TqEmvIaV7jHFC+81p/zsZxw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=d5KyeDq946nuEeP72I+rCwfJA6i1ndu160NKjlUa2U0=;
 b=UbeV/zU0wec3OVpC8ekk5uM1Y2Zq7CfFmSDBddHAtonh4K+i1zGDhVWYMkxS8MzTFz
 quJ9IEkQ3cgMuW58VOn0FMZmWtlq5s4cEetwMuRrxYd94dnCV3oVRZ3GfTV+F2xdl/mY
 qH9zUhuEUhEP3D7m8PRjQVVLH65x6fVcI2AVvlNUW8ewmlZ4VqFtzegIIt9YeBsHTJRh
 DGkmVNhsiOOii5jxprVBErQoP6FxQ9ZpBgISyAnpsU8/k1s5ZQA2uWVx8SdnWAVw2plZ
 mOLJF203zSlNHhFHllzW3qGgpDJ/q3MzC6HVzVtetfEilSUOm+48xIqDpZ+1ugTF5ld2
 AC9A==
X-Gm-Message-State: AOAM533aVK7NVS4oX4AUJJ79hxAzFFQu4IGabxbcuZLdq7B4VcmrZqkm
 vBcQwU4F0LUtgUzQlfmnfmV9O2bp8fYnvdJmo6MHEA==
X-Google-Smtp-Source: ABdhPJzcbhAQp1Hj5R9izqiK2ZL89sVw4r1RXvzPY1p8ELBpYgolJMvLXTBcI+y11f9ZXleFHZ3dGmm68Ou4VgvCCb8=
X-Received: by 2002:a05:6830:1212:: with SMTP id
 r18mr7334996otp.159.1631850848045; 
 Thu, 16 Sep 2021 20:54:08 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 16 Sep 2021 20:54:07 -0700
MIME-Version: 1.0
In-Reply-To: <20210915203834.1439-10-sean@poorly.run>
References: <20210915203834.1439-1-sean@poorly.run>
 <20210915203834.1439-10-sean@poorly.run>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 16 Sep 2021 20:54:07 -0700
Message-ID: <CAE-0n504ZgOW-=3_DgPy+rFxNnkYjjp2U83X=K1ZMne-cN0ZPw@mail.gmail.com>
Subject: Re: [PATCH v2 09/13] drm/msm/dpu: Remove useless checks in dpu_encoder
To: Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Sean Paul <seanpaul@chromium.org>, Rob Clark <robdclark@gmail.com>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org
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

Quoting Sean Paul (2021-09-15 13:38:28)
> From: Sean Paul <seanpaul@chromium.org>
>
> A couple more useless checks to remove in dpu_encoder.
>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-10-sean@poorly.run #v1
>
> Changes in v2:
> -None
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
