Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4D0650BCE
	for <lists+dri-devel@lfdr.de>; Mon, 19 Dec 2022 13:35:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F22210E294;
	Mon, 19 Dec 2022 12:35:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3894710E294
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Dec 2022 12:35:16 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id kw15so21045451ejc.10
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Dec 2022 04:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rCYG7t1izN/gOyqR3UaPefTWs3YwGVtAE/HZuYn9Rfc=;
 b=ZKtkG+FX5U20S1M6EMAO9s5DcYzxSPb3NQCBOLLNZKUq1ijR3Q2uoYri0UIzTgvgB0
 BuFxphDmBbwcllU3Gq/LcNYSqtuoFmVbWfxHoWpZbb485QqVZreK8NBdka6pJ9kqxEfi
 b6g2VtgxtP/YluAJZKnBbJAR0WCcpqKp7HjTA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rCYG7t1izN/gOyqR3UaPefTWs3YwGVtAE/HZuYn9Rfc=;
 b=l7Je+H7rl424jt51s5VFSIcu96rK7duhT04xZrntjnVfzeg8ds0NdNChfxc8myccVt
 7Mwt79x7OzREXIufJlGZMv69QaRBqwtYxCCXVHPs6/NY+Xp8w0XZRLnhuX/rp9CrL7Nl
 DMhEPCbfOTsO/qubhbkAoZntcppUngM8NWAPfX8BrB0Ek4/202KS9Qd+eiw2sJFGafxY
 8ERp65C6V7qe134em0/G7ZX8LaTiKtbbsYYVeOwALlnDYsCyr9YthEq+4xlYGpohRvZC
 vtKw4HVhfyB3jw93Js9R3Km6XQ/T2NY6OyH7fwfwWJ0lrKQzSiHDUe6YvDr+CkAgwDFm
 7KdA==
X-Gm-Message-State: ANoB5pnvMwx3c8a+HrW74acJ8YMuLTPv290t7Fx7TnHuL8IkmQBTi8vk
 dHh2wLrcnH8BM6HXejnP5KnndxEvh5nc3C/FemxY3Q==
X-Google-Smtp-Source: AA0mqf7MRvG+Qj2JseT+Qj2IY04GU3ehuu2j+6yoRs/z0TWbsGNO6utzwcWxYija4unhyYJGQ57ZKqf8K83fjcrrTnQ=
X-Received: by 2002:a17:906:8383:b0:7c1:19ea:dda with SMTP id
 p3-20020a170906838300b007c119ea0ddamr8979778ejx.31.1671453314287; Mon, 19 Dec
 2022 04:35:14 -0800 (PST)
MIME-Version: 1.0
References: <20221002064540.2500257-1-michael@amarulasolutions.com>
In-Reply-To: <20221002064540.2500257-1-michael@amarulasolutions.com>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Mon, 19 Dec 2022 13:35:02 +0100
Message-ID: <CAOf5uw=2zjki8DEkgvDTKrj6V=FS44Z1WN3AvFZvzuN-MU_y4Q@mail.gmail.com>
Subject: Re: [RFC PATCH 0/4] Add RGB ttl connection on rockchip phy
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@ti.com>, linux-rockchip@lists.infradead.org,
 Vinod Koul <vkoul@kernel.org>, linux-phy@lists.infradead.org,
 linux-amarula@amarulasolutions.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all

On Sun, Oct 2, 2022 at 8:45 AM Michael Trimarchi
<michael@amarulasolutions.com> wrote:
>
> The rockchip phy can be convigured in ttl mode. The phy is shared
> between lvds, dsi, ttl. The configuration that now I'm able to support
> has the display output on some set of pins on standard vop output
> and a set of pins using the ttl phy. The solution is not clean as I
> would like to have because some register that are used to enable
> the TTL, are in the same register area of the dsi controller.
> In order to test I must add the following
>
> dsi_dphy: phy@ff2e0000 {
>
>         reg = <0x0 0xff2e0000 0x0 0x10000>,
>                 <0x0 0xff450000 0x0 0x10000>;
>         ...
> }
>
> The problem here is the second region I have added is the same of
> dsi logic. Only one register is needed by the the phy driver
>

Is there anyone who has time to review it?

Michael

> Michael Trimarchi (4):
>   phy: add PHY_MODE_TTL
>   phy: rockchip: Add inno_is_valid_phy_mode
>   phy: rockchip: Implement TTY phy mode
>   drm/rockchip: rgb: Add dphy connection to rgb output
>
>  drivers/gpu/drm/rockchip/rockchip_rgb.c       | 18 +++++
>  .../phy/rockchip/phy-rockchip-inno-dsidphy.c  | 72 +++++++++++++++++++
>  include/linux/phy/phy.h                       |  3 +-
>  3 files changed, 92 insertions(+), 1 deletion(-)
>
> --
> 2.34.1
>


-- 
Michael Nazzareno Trimarchi
Co-Founder & Chief Executive Officer
M. +39 347 913 2170
michael@amarulasolutions.com
__________________________________

Amarula Solutions BV
Joop Geesinkweg 125, 1114 AB, Amsterdam, NL
T. +31 (0)85 111 9172
info@amarulasolutions.com
www.amarulasolutions.com
