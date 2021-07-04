Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F203BAE40
	for <lists+dri-devel@lfdr.de>; Sun,  4 Jul 2021 20:14:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CE568997C;
	Sun,  4 Jul 2021 18:13:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CC558997C;
 Sun,  4 Jul 2021 18:13:57 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id t15so15829084wry.11;
 Sun, 04 Jul 2021 11:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y6S2/wsZZvCto6OggBe0r+M5LCBVH1Exsptmfkk/eec=;
 b=MdqBKo3IYnVfJYh3IDgykU7wNifd7Z2JuffeMXN6HNu+Q3bof0QfSCr1OQy92UJUQ1
 LwBt45JYJ2DbnR4cZQze0yFKvW3yFd8IAvXEEMVjE8mJ5VqJpIuTKskkvcgGR6GNJTOc
 iT9pi3a7Mzu34NMaubZSrNUG7h2FBqwAUAn14aBsqhCjVUAJMRjWy01i5YnYTpuG8fst
 8ngf5CN2dl83RG2anh71unWCgqAgX35KZyQ1cX8Ps2vKFrBTOdD2sxR60DT6HwmlHCmJ
 hydyfJmchATFqwoqbhy33uxiVvNtZgzPo7sEHomgf++wMr8RxF5Syd3FGtVUxFfOzEY0
 PGsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y6S2/wsZZvCto6OggBe0r+M5LCBVH1Exsptmfkk/eec=;
 b=ix4EGBYrPSrTHJlD9pOmuko735/cVg0E6M03oqlam9uOufAXriubH9V7kcUZSvYaKs
 1UqPUjNPzGZcNbNhxhEgnw5vy1o3vliFnlM15CPuGvsetn8UQS1Q+V4Fb34N7XtLUo9b
 knSDHuSA4yys5soIHCUERLXlBnxIliALCmj+/nI4eE4/KnF32Rcn5PiZNRF+YLcxyEvn
 aT0IHuNNnSX/P2Mod3cvN/FffnpLIfhWGpDBp/q0+i2erYf/8afFCm0Sq0RGrEbUZ2XQ
 9ru7rvesQ/4aA8L+60dWKTPZLdVhEObs8xnge5sNXtPAtIxJDnhCqy7JL9YAjAZnPJ3A
 vVjQ==
X-Gm-Message-State: AOAM533Zcz8LuYDmFilYjijG/bVQQXKQTQHfEwDQs6zs7/O8F1keR0ka
 dlcvbB3He6gk0zWRf1H6Eprryvl0H9CtzRb0VeI=
X-Google-Smtp-Source: ABdhPJw9nU5SAZWiLf1A5FaSPUAJd1PIz3WPubDGpEHQ0/GfCnN2Trp06uS8baSrMF3YcxOya43XulJVfx4RjuI4Dyc=
X-Received: by 2002:adf:eb43:: with SMTP id u3mr11318754wrn.83.1625422435770; 
 Sun, 04 Jul 2021 11:13:55 -0700 (PDT)
MIME-Version: 1.0
References: <1625311962-14185-1-git-send-email-kalyan_t@codeaurora.org>
 <5dcd850a-280c-c356-32e5-35a4fe089f4e@linaro.org>
In-Reply-To: <5dcd850a-280c-c356-32e5-35a4fe089f4e@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Sun, 4 Jul 2021 11:17:57 -0700
Message-ID: <CAF6AEGvhu9a5yigu-HZZjHuD34i_DyjC8kteYgh73POeS02xcQ@mail.gmail.com>
Subject: Re: [RFC] Inline rotation support in dpu driver
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Krishna Manikandan <mkrishn@codeaurora.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Douglas Anderson <dianders@chromium.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jul 4, 2021 at 1:25 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 03/07/2021 14:32, Kalyan Thota wrote:
> > This change adds support for inline rotation in the dpu driver.
> > When inline rotation is enabled the VIG pipes will directly fetch the image
> > from memory in a rotated fashion
> >
> > Inline rotation has following restrictions
> > 1) Supported only with compressed formats
>
> NV12, which is the only format you declare, is not compressed.

nv12 can be used with the UBWC modifier, fwiw.. we use this in CrOS,
albeit with a hack on the v4l2 side to work around lack of modifier
support in v4l2

BR,
-R

> > 2) max pre rotated height is 1088
> > 3) restrictions with downscaling ratio
> >
> > Queries:
> >
> > 1) Since inline rotation works for fewer pixel formats with specific modifier, how can we provide this information to the compositor so that
> > chrome compositor can choose between overlaying or falling back to GPU. In the patch it fails in the atomic check.
> >
> > 2) If a display composition fails in atomic check due to any of the restrictions in overlays
> > can chrome compositor switch it back to the GPU and re trigger the commit ?
> >
> > posting it as RFC as validation is not complete, please share early comments on this.
> >
> > Kalyan Thota (1):
> >    drm/msm/disp/dpu1: add support for inline rotation in dpu driver
> >
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 47 +++++++++----
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 20 ++++++
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      | 93 ++++++++++++++++++++------
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h      |  2 +
> >   4 files changed, 128 insertions(+), 34 deletions(-)
> >
>
>
> --
> With best wishes
> Dmitry
