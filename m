Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8348E37488C
	for <lists+dri-devel@lfdr.de>; Wed,  5 May 2021 21:15:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5256D6E4FE;
	Wed,  5 May 2021 19:15:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EEE088C3D
 for <dri-devel@lists.freedesktop.org>; Wed,  5 May 2021 13:53:19 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id y30so1830744pgl.7
 for <dri-devel@lists.freedesktop.org>; Wed, 05 May 2021 06:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=n1bbsdQFslUe2/D8fiyQmt7GT8BuGOrH6bymhVpBYX0=;
 b=Key2mtimVz3Ms9QHFbm4+H7mGJ0Ryu2plYuVDFRZjpPSMAdAD5nCBdXFdPFEFUJIvf
 QsPqFq2nTQv3zsXqVfDIqgtf/Q7ma8W2BEtCjCaq2veefFeg9Zf5iFSuhQWPe/MRYHhO
 J+pT6zBwMfMpXE2z4H0pWtMDJRH0kOnIGMH5JKuz7O31W0CVIV0iefAiDshNHsUT8KUw
 ys6ywYxzupKjoqkEv9sW1YvBER5/JV2MYPXmDnJq6hKgQe3DETrS0fuI4a+ZbH6vHx2T
 yU0Iv7KK9687KoatwGwgtHpGT5v4//KWks/yMgZfx4fHaRGcUHdf+eUFpqYT3bF8afEW
 hkGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n1bbsdQFslUe2/D8fiyQmt7GT8BuGOrH6bymhVpBYX0=;
 b=im8UxGovN4EFYFyxAl2jqgLC7NcWFEgbwSUDdnqaeI1OY1ht9X4gF1hH1lRq96XawT
 3d88iqsKCBjRXzBF0uTZIRGg8unNaCftahi/MRPkI3YSEYKAoTDYIcWCSQ3a/qweaHwS
 F3cWCc8c1qB0i8vQPgucef1PlU601XkXCcARxnhzAzZwgs/iWdBHdKBCxWPJQ30/5Q9M
 pPl2VGeK/OYnCrw7ki0/enjj0DqyJubtsIvGFwZHGeCzTtjIkVQnBRkKwhvSJv6F+uQX
 ZjbEXjWMlYHwg4k31Zn+8VPWuNv+7Vp5Z9xwnaFjwVpgyNWY8ueWh+dptgoCZxLJS+tN
 YBrw==
X-Gm-Message-State: AOAM530Q7n8RbPMRHgksW2H72zo8mm/gAUGA0JOzjcVl0tVxiBKgGHf4
 /nrG7hLGXOzhgsu88AdgHgU0N2bhP8UoVT1ObcI=
X-Google-Smtp-Source: ABdhPJyluxFRTo8fdiox4JZ/YBjp7C3OIiVJ3YAHoNyjb+ElKi+tqlmQFHxdzj08K6nCwubf+VSVhH2i0N/I2jSnzsg=
X-Received: by 2002:a65:4c8e:: with SMTP id m14mr27753924pgt.377.1620222798644; 
 Wed, 05 May 2021 06:53:18 -0700 (PDT)
MIME-Version: 1.0
References: <55fe7f3454d8c91dc3837ba5aa741d4a0e67378f.1618797813.git.tommyhebb@gmail.com>
In-Reply-To: <55fe7f3454d8c91dc3837ba5aa741d4a0e67378f.1618797813.git.tommyhebb@gmail.com>
From: Jonathan Liu <net147@gmail.com>
Date: Wed, 5 May 2021 23:53:07 +1000
Message-ID: <CANwerB2Jjtu=HyLEgFjf1PyJEWzE9_7rcTgTr2QAXCWXZWjC3g@mail.gmail.com>
Subject: Re: [RESEND PATCH] drm/rockchip: dsi: move all lane config except
 LCDC mux to bind()
To: Thomas Hebb <tommyhebb@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 05 May 2021 19:15:25 +0000
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
Cc: linux-rockchip@lists.infradead.org, David Airlie <airlied@linux.ie>,
 Brian Norris <briannorris@chromium.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sandy Huang <hjc@rock-chips.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Nickey Yang <nickey.yang@rock-chips.com>,
 Sean Paul <seanpaul@chromium.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 19 Apr 2021 at 02:04, Thomas Hebb <tommyhebb@gmail.com> wrote:
>
> When we first enable the DSI encoder, we currently program some per-chip
> configuration that we look up in rk3399_chip_data based on the device
> tree compatible we match. This data configures various parameters of the
> MIPI lanes, including on RK3399 whether DSI1 is slaved to DSI0 in a
> dual-mode configuration. It also selects which LCDC (i.e. VOP) to scan
> out from.
>
> This causes a problem in RK3399 dual-mode configurations, though: panel
> prepare() callbacks run before the encoder gets enabled and expect to be
> able to write commands to the DSI bus, but the bus isn't fully
> functional until the lane and master/slave configuration have been
> programmed. As a result, dual-mode panels (and possibly others too) fail
> to turn on when the rockchipdrm driver is initially loaded.
>
> Because the LCDC mux is the only thing we don't know until enable time
> (and is the only thing that can ever change), we can actually move most
> of the initialization to bind() and get it out of the way early. That's
> what this change does. (Rockchip's 4.4 BSP kernel does it in mode_set(),
> which also avoids the issue, but bind() seems like the more correct
> place to me.)
>
> Tested on a Google Scarlet board (Acer Chromebook Tab 10), which has a
> Kingdisplay KD097D04 dual-mode panel. Prior to this change, the panel's
> backlight would turn on but no image would appear when initially loading
> rockchipdrm. If I kept rockchipdrm loaded and reloaded the panel driver,
> it would come on. With this change, the panel successfully turns on
> during initial rockchipdrm load as expected.
>
> Fixes: 2d4f7bdafd70 ("drm/rockchip: dsi: migrate to use dw-mipi-dsi bridge driver")
> Signed-off-by: Thomas Hebb <tommyhebb@gmail.com>

Tested-by: Jonathan Liu <net147@gmail.com>

Fixes MIPI-DSI panel initialization for me on RK3399 too.

Regards,
Jonathan
