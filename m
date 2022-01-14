Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0907748F1CC
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 22:01:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D651110E1F4;
	Fri, 14 Jan 2022 21:01:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 676A910E1F4
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 21:01:38 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id w188so13857046oiw.13
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 13:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ev8VAWLABgcwjAWOJiwrx2eFMwjFEQ1Ark3f35TvFjs=;
 b=M2yojZLr84nstQZUzNRXprG2/FlU5DJXCa/4lDGpMbgAipBAIr2iB5N9qqsMfwqQkT
 g4yO681gHnyAaJL2H39tZR29z9AG/zWpTNG5WQvh3V4qvQUnEZJgbHJLq89a6QFbmj7U
 T13OJuE02K3CvAEpRN/RzVBWxyp6maN+0PkJo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ev8VAWLABgcwjAWOJiwrx2eFMwjFEQ1Ark3f35TvFjs=;
 b=zm5PEw/RrZD/2TwjIlQxtSRS7BxwCcj6P5znBVwRY0JJzaWqqSlmgr1pl/u07bViYR
 72smYQo4TF/IjAIM0W4c/xMQD9WPa7YmX1NvdFif+poOEUC8yCr7LV3NZVUHW7CY07md
 ZkSLI3Qydek0OOISF9t9/ReZjDLj1pevDb2zpFo7C07LDkpNSEgLn9B+uHIMmTskAbfn
 sLXjd+Eqi3AsaL31mjPfPje2pDqE/czf8/Hm4qmxf8hsrM3KyZZ0MQWEfH0MM/H30++L
 u9Yc74Vb/jdCU2IZyUEZccwwkl/xTem6FvAWCTX8ncLk2LBL4aXk8lUCQWpYNCgc1DUz
 Llfg==
X-Gm-Message-State: AOAM531S6zVYitUO9yvXqb+o12CKshQRnqCrpNcvDSvh92Hr+hTUZT77
 fWE2yRxRmowO3awZPSz2GjZIhJg8ElVJBQ==
X-Google-Smtp-Source: ABdhPJy7v+SmANhKanstzd3x8VQ/6Zu7O1pYojVwW3+baGSB3mP1H0F/Fx2Dy7TQdBxMq74YHf+9HQ==
X-Received: by 2002:aca:bec2:: with SMTP id o185mr8947531oif.8.1642194097382; 
 Fri, 14 Jan 2022 13:01:37 -0800 (PST)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com.
 [209.85.210.46])
 by smtp.gmail.com with ESMTPSA id k8sm2347760oon.2.2022.01.14.13.01.36
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jan 2022 13:01:36 -0800 (PST)
Received: by mail-ot1-f46.google.com with SMTP id
 w19-20020a056830061300b0058f1dd48932so11471867oti.11
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 13:01:36 -0800 (PST)
X-Received: by 2002:a9d:5908:: with SMTP id t8mr7723553oth.186.1642194095619; 
 Fri, 14 Jan 2022 13:01:35 -0800 (PST)
MIME-Version: 1.0
References: <20220114201652.3875838-1-briannorris@chromium.org>
 <20220114121515.1.I46f64b00508d9dff34abe1c3e8d2defdab4ea1e5@changeid>
In-Reply-To: <20220114121515.1.I46f64b00508d9dff34abe1c3e8d2defdab4ea1e5@changeid>
From: Brian Norris <briannorris@chromium.org>
Date: Fri, 14 Jan 2022 13:01:22 -0800
X-Gmail-Original-Message-ID: <CA+ASDXMO3sPta-vhMCqAPRFFkNa-nmY+wK6PXJaSUEXBHETG+A@mail.gmail.com>
Message-ID: <CA+ASDXMO3sPta-vhMCqAPRFFkNa-nmY+wK6PXJaSUEXBHETG+A@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: rockchip: Switch RK3399-Gru DP to SPDIF
 output
To: Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
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
Cc: devicetree <devicetree@vger.kernel.org>, alsa-devel@alsa-project.org,
 Lin Huang <hl@rock-chips.com>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel <linux-kernel@vger.kernel.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sorry to send a self-reply so quickly, but I noticed an error and want
to make sure this doesn't get merged _too_ quickly before I get to
send a revision! See below:

On Fri, Jan 14, 2022 at 12:17 PM Brian Norris <briannorris@chromium.org> wrote:
>
> Commit b18c6c3c7768 ("ASoC: rockchip: cdn-dp sound output use spdif")
> switched the platform to SPDIF, but we didn't fix up the device tree.
>
> Fixes: b18c6c3c7768 ("ASoC: rockchip: cdn-dp sound output use spdif")
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> ---
>
>  arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
> index 45a5ae5d2027..21ec073f4d51 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi

> +&spdif {
> +       status = "okay";

I need to fix up the pinctrl settings here. rk3399.dtsi has a default
that is incorrect. That's OK for several variants (Kevin and Bob,
where the pin is actually unconnected), but it breaks Scarlet (where
the pin in question is actually connected to something else).

I'll send a v2 after waiting a bit, in case there are other comments
worth addressing at the same time.

Brian

> +};
