Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B62A5E659
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 22:17:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37CC110E7D3;
	Wed, 12 Mar 2025 21:17:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="yoA8Aokz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
 [209.85.219.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D3A710E7D5
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 21:17:00 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id
 6a1803df08f44-6e41e18137bso2484536d6.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 14:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741814219; x=1742419019; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XxDKgr5VuN6noi0Wfhw4cTV3jZ9TmVruadjdpxToKRg=;
 b=yoA8AokzBKKeCgnepQFmb66D6OcTkVA2ZxYzH2FIhZXopz37JNVt5YaICXGFYlMfQ3
 yB2OFXtcMV9O9Uxrzy9X5/AZ1ehSiWa0CtVsPZvsQTkCHE9F3ZcsjwOd4O4Cw2bTluQE
 ZsuJZ5hLm1Y1YfHvqk+eVXxDib9sNJF9KzCn9IcczruTe1u1Uu/jVsulR6OAD+bNhMZz
 i9Rq1NayrhDEd9VUSVV6+Kv7dYUgNNtrWWzgfdJvNXQSHUeWY822+oW+aimTFJDQtnzT
 lfDzmvbntKMJP80iPGBNgHSBUfGHNYjnL8uz9lS+E+6uL/848JIannves0q5JdR39WPi
 l3jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741814219; x=1742419019;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XxDKgr5VuN6noi0Wfhw4cTV3jZ9TmVruadjdpxToKRg=;
 b=uEkI1aMF1rlLX8hX12RyOGEtBIeJuBWkEFEcKTMxsiTws53XnEnrFWZDGQC0FjYh8D
 LEiGgEwo08o9StPHogvcn2GKXhmKBmyIiDJb4Y/W8v8zXRtOPLgl8xNQI81+g6aMYZ9X
 jWdODgeYfQPdXoOZFWJ7tt1qq5XOg+Xdvqxlli8awVOQZZhhd9iRfuZ8lF+OzsDhBugq
 UGw5qiMak+yzTE550cqhgGF09HVnVNueZpEAkSHyz6P9SqXAbcToqiAgOKG3jsRLnkv2
 6WayMH0uaz48DTKtPOYwsztu+8OglkMhnmuWtV6zDm7emRxJrZxBMt+PF1jiOx1wl+w9
 v6yw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXe60gQ3pXUexCPfYSZ1f7rk575pyHxk8NueKXc3fVi8binEFFTl7sQtjTk8gPhgJKWRjex3ssGvE0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YziMN59N+1B4eh25nUwFYfss+rs8B/HYq/6+iGsyQ/Z7M61zYg1
 cFytmNzUIWtbkbwdvcWAtqNjcSui4YFcw4XdHgqL/blHtcODufMc+W53DF6FhWOmGHE7f3PhA/Q
 XczLzwnYiWxHtsadGdHXqCB5uSEhzacabAwu5+A==
X-Gm-Gg: ASbGncuEqcfM6To7forColVaK3kMXXpqeM77EZa7y2MNi5WkFWngkcpSU3zhl6YLZFJ
 t3+3NBT/kWGY8uJgXVvm+TJy3srj7YUtrPHBCXEXP8uhvwwJodznIeUUD1JObwGBuZ1KFR4puj8
 7ibTOw2A163ZvaKjYR33IGLCfHOw==
X-Google-Smtp-Source: AGHT+IE8URVhSLvPJIFsnTX7Z5pSwgsdAxYcwLbP1+O/xS7LPEmPA9PmITKDBxz3rcylfz6xQGMlbZxbKqtozlnBWHY=
X-Received: by 2002:ad4:5b84:0:b0:6e6:698f:cafd with SMTP id
 6a1803df08f44-6e900681c65mr390346036d6.37.1741814219178; Wed, 12 Mar 2025
 14:16:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250311234109.136510-1-alex.vinarskis@gmail.com>
In-Reply-To: <20250311234109.136510-1-alex.vinarskis@gmail.com>
From: Stefan Schmidt <stefan.schmidt@linaro.org>
Date: Wed, 12 Mar 2025 22:16:48 +0100
X-Gm-Features: AQ5f1JpPzCg_wcL5Oq5TpalUho1WYNfDBRHd08R0PtwUoX5vs0HUJe7LYQzHVM0
Message-ID: <CAEvtbusre2PUwNiD42d-xTCVf4dV0npN-5UxxwrjriVOsbj0Fg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] drm/msm/dp: Introduce link training per-segment
 for LTTPRs
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, laurentiu.tudor1@dell.com,
 abel.vesa@linaro.org, johan@kernel.org
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

Hello Aleksandrs,

On Wed, 12 Mar 2025 at 00:41, Aleksandrs Vinarskis
<alex.vinarskis@gmail.com> wrote:
>
> Recently added Initial LTTPR support in msm/dp has configured LTTPR(s)
> to non-transparent mode to enable video output on X1E-based devices
> that come with LTTPR on the motherboards. However, video would not work
> if additional LTTPR(s) are present between sink and source, which is
> the case for USB Type-C docks (eg. Dell WD19TB/WD22TB4), and at least
> some universal Thunderbolt/USB Type-C monitors (eg. Dell U2725QE).
>
> First, take into account LTTPR capabilities when computing max link
> rate, number of lanes. Take into account previous discussion on the
> lists - exit early if reading DPCD caps failed. This also fixes
> "*ERROR* panel edid read failed" on some monitors which seems to be
> caused by msm_dp_panel_read_sink_caps running before LTTPR(s) are
> initialized.
>
> Finally, implement link training per-segment. Pass lttpr_count to all
> required helpers.
> This seems to also partially improve UI (Wayland) hanging when
> changing external display's link parameters (resolution, framerate):
> * Prior to this series, via direct USB Type-C to display connection,
>   attempt to change resolution or framerate hangs the UI, setting does
>   not stick. Some back and forth replugging finally sets desired
>   parameters.
> * With this series, via direct USB Type-C to display connection,
>   changing parameters works most of the time, without UI freezing. Via
>   docking station/multiple LTTPRs the setting again does not stick.
> * On Xorg changing link paramaters works in all combinations.
>
> These appear to be mainlink initialization related, as in all cases LT
> passes successfully.
>
> Test matrix:
> * Dell XPS 9345, Ubuntu 24.10, Gnome 47, Wayland
>         * Left USB Type-C, Right USB Type-C
>         * Direct monitor connection, Dell WD19TB, Dell WD22TB4, USB
>           Type-C to HDMI dongle, USB Type-C to DP dongle
>         * Dell AW3423DWF, Samsung LS24A600, dual Samsung LS24A600 (one
>           monitor per USB Type-C connector)
> * Dell XPS 9345, Ubuntu 24.10, Gnome 47, Wayland
>         * Left USB Type-C, Right USB Type-C
>         * Direct monitor connection
>         * Samsung S34BG85 (USB Type-C), Dell U2725QE (universal
>           Thunderbolt/USB Type-C, probes with an LTTPR when in USB
>           Type-C/DP Alt mode)

You can  add the following:
* Dell XPS 9345, Debian trixie/sid, Gnome 48, Wayland
        * Left USB Type-C, Right USB Type-C
        * Dell WD15 Dock with DisplayPort connected
        * Dell HD22Q dock with HDMI connected
        * USB Type-C to HDMI dongle
        * Dell U3417W

> In both cases, "Thunderbot Support"/"USB4 PCIE Tunneling" was disabled
> in UEFI to force universal Thunderbolt/USB Type-C devices to work in
> DP Alt mode.
> In both cases laptops had HBR3 patches applied [1], resulting in
> maximum successful link at 3440x1440@100hz and 4k@60hz respectively.
> When using Dell WD22TB4/U2725QE, USB Type-C pin assigment D got enabled
> and USB3.0 devices were working in parallel to video ouput.
>
> Known issues:
> * As mentioned above, it appears that on Gnome+Wayland framerate and
>   resolution parameter adjustment is not stable.

I can confirm this on Gnome 48 + Wayland as well. Sometimes the resolution
change from gnome settings gets stuck and does not apply. It normally works
here around every third try or so when using a dock.

> Due to lack of access to the official DisplayPort specfication, changes
> were primarily inspired by/reverse engineered from Intel's i915 driver.
>
> [1] https://lore.kernel.org/all/20250226231436.16138-2-alex.vinarskis@gmail.com/
>
> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>

Tested-by: Stefan Schmidt <stefan.schmidt@linaro.org>

regards
Stefan Schmidt
