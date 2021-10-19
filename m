Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E015A4332CC
	for <lists+dri-devel@lfdr.de>; Tue, 19 Oct 2021 11:47:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A66DC6E134;
	Tue, 19 Oct 2021 09:47:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 553BF6E134
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 09:47:29 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id v20so13288696plo.7
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 02:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AW90+0ECu0jFh8CdzlWHccywuwAGlUm3CUlVVFXdqic=;
 b=fyP+7f/LVSu4Rs1PK5OiJMYlJXG9EEqWapYe/TDCTrJuP9To2ZJGCDg53mMkw/gxmM
 Fs9rJ1aGjQOmebk7RZuHNnhP6ABDlUjI7cyHSPd5SnRleJCceeF45ffEdhrIT2rs0nx7
 qMGITGCV00y6jzAQ/zaXQDqp+hoC3wGQEu4NVXEBOQHzSErshgK8R4q+RqvuFEeMcj44
 mt89gEcQ+XCXuCpsmT+9MNLSQnKxciyM6wyrtkE3XokIvdFofa4RxI47sJH5ToFPrXJF
 xLrPO0Ajp2XmD/ZAqDlfWvhDAPYEXLghaAGoVidVf0R0UIa2RKvk/noKjZx1hJ+E6QDz
 A7rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AW90+0ECu0jFh8CdzlWHccywuwAGlUm3CUlVVFXdqic=;
 b=3b+THCu5BwfgsMGGfQMpKYvglevaQXLnYT82IxsONjRgzjYI4i7FQ+dywbv259Xwvs
 VSOjN0oKxfZQ3tzfOapknSN1ruGXqNIyDybmoibFZXroHxv84w9v6A4u9ibc5iKUDbfm
 52TBntt/kpZNkMO6DrAqm2kEIgAkQcihQB6uwM6YQE8LiZwpQ85olnXWhXjRlhG1c6wp
 ruA/YI/wFx75L4K12V+l8kaDNsjkQVG6L3iOJgN3XvgZtbPvsdH1PMXbVN+sPhhGC+iF
 l5HCftiT1ZHH3kkHYyvHz/C0vSo1OOHNvtlMXUlJ4nHRScihwnFrKSSSLX2lBmEqaBmi
 DuCQ==
X-Gm-Message-State: AOAM530fslpVq2gaVOzFfLQYtFeZXX/Igc96xOJ1aZoqXy5iFlyGbrTf
 hWTrLPt0IFBQWoNwewJRwU0ZIGGMP5pqGDv3O+dUwQ==
X-Google-Smtp-Source: ABdhPJwP1HHCKcZxy6X+e0Bms/h1VpcsmX+KoWgwv5qu2dKntHFdMmYf/e2mEICECkUkU1kdjL37Qs8iz/0it4SvqNQ=
X-Received: by 2002:a17:902:c94e:b0:13f:1b02:e539 with SMTP id
 i14-20020a170902c94e00b0013f1b02e539mr32133251pla.72.1634636848802; Tue, 19
 Oct 2021 02:47:28 -0700 (PDT)
MIME-Version: 1.0
References: <20211002233447.1105-1-digetx@gmail.com>
In-Reply-To: <20211002233447.1105-1-digetx@gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 19 Oct 2021 11:47:17 +0200
Message-ID: <CAG3jFysa8G_fuGDfSLze-ovft3=gc5PXLaPtwTkC2_e0itQYNw@mail.gmail.com>
Subject: Re: [PATCH v1 0/5] Improvements for TC358768 DSI bridge driver
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>, 
 Neil Armstrong <narmstrong@baylibre.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxim Schwalm <maxim.schwalm@gmail.com>, 
 Andreas Westman Dorcsak <hedmoo@yahoo.com>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel <dri-devel@lists.freedesktop.org>, linux-tegra@vger.kernel.org, 
 linux-kernel <linux-kernel@vger.kernel.org>
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

Applied to drm-misc-next

On Sun, 3 Oct 2021 at 01:35, Dmitry Osipenko <digetx@gmail.com> wrote:
>
> This series adds couple improvements to the TC358768 DSI bridge driver,
> enabling Panasonic VVX10F004B00 DSI panel support. This panel is used by
> ASUS Transformer TF700T tablet, which is ready for upstream kernel and
> display panel support is the biggest missing part.
>
> Dmitry Osipenko (5):
>   drm/bridge: tc358768: Enable reference clock
>   drm/bridge: tc358768: Support pulse mode
>   drm/bridge: tc358768: Calculate video start delay
>   drm/bridge: tc358768: Disable non-continuous clock mode
>   drm/bridge: tc358768: Correct BTACNTRL1 programming
>
>  drivers/gpu/drm/bridge/tc358768.c | 94 +++++++++++++++++++++++--------
>  1 file changed, 71 insertions(+), 23 deletions(-)
>
> --
> 2.32.0
>
