Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8AE131B48
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2020 23:25:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1415D89B67;
	Mon,  6 Jan 2020 22:25:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com
 [IPv6:2607:f8b0:4864:20::944])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B75D389B67
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2020 22:25:51 +0000 (UTC)
Received: by mail-ua1-x944.google.com with SMTP id z24so12340956uam.7
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jan 2020 14:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eV/1akoxP7P3ABmGBw2S16HDMJ8eaLjqFUo1f5/sSLU=;
 b=Nyopb1GgYHuYm4R4qPjbmQiRz9pqSDRwa0NMCNwzi97cVj5VOB0eC1RQIKPkLo7RAY
 3Yfg8Sb5Xzxc2VGfuD3QSRolbSggv0XZfau1AluQ0W6H97XjPI2HXUl3iqL/kDoH8Uf3
 zHQkdzZ2Dg3uxiLBFDyXjtSHyOlzhm3/QNAgk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eV/1akoxP7P3ABmGBw2S16HDMJ8eaLjqFUo1f5/sSLU=;
 b=L+B/p4/K5nOe/BzzwuoyQLJa59eC2sMjt128abM+2EGYZbWHPfP6tt+ur3dCVEeu74
 NF+FvdM3b7idmSMbx9NwvPTzuj8VxSefPYLbCtv7igXGFQnFcWknLfHBkOGhlpm8b4sR
 3BWplR1Efl/u9weRHZ0t1O3iqWMz3epRUiZ1rHhwMC5EXtWvNoel6f4+dhzAoPi4YFAU
 WJ1fSDhX3wzDJVIMl3DBBtWu+4MJcqEMGCdUauKrVMazx6FsYiTFR13eU+tXeL6hojiT
 20OLbNOvylRsSfIf0JSHtwr303Z8hObv1fp454kfYNz20i4BsIUhnV9NkM8BLftol+qQ
 WptQ==
X-Gm-Message-State: APjAAAWoEtqdXBUcNd9o8iTQrTh1xphPXe2UkA6BqaNODwQu+WmlinpU
 6RZp342M04hMRCvuVUdQhSN0QwFUDAE=
X-Google-Smtp-Source: APXvYqzSTzl/L0xmlrWmb220toHGd6sNObuNpiRuy2NwiyVoxN0kQxU4Tk/zuhaTcrt1slcQVpopkg==
X-Received: by 2002:ab0:7219:: with SMTP id u25mr62703684uao.10.1578349550303; 
 Mon, 06 Jan 2020 14:25:50 -0800 (PST)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com.
 [209.85.217.49])
 by smtp.gmail.com with ESMTPSA id d65sm18636874vkh.49.2020.01.06.14.25.49
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jan 2020 14:25:49 -0800 (PST)
Received: by mail-vs1-f49.google.com with SMTP id s16so31095342vsc.10
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jan 2020 14:25:49 -0800 (PST)
X-Received: by 2002:a67:8704:: with SMTP id j4mr55143272vsd.106.1578349548941; 
 Mon, 06 Jan 2020 14:25:48 -0800 (PST)
MIME-Version: 1.0
References: <HE1PR06MB40118544456FC5461F49DDE8AC2E0@HE1PR06MB4011.eurprd06.prod.outlook.com>
In-Reply-To: <HE1PR06MB40118544456FC5461F49DDE8AC2E0@HE1PR06MB4011.eurprd06.prod.outlook.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 6 Jan 2020 14:25:37 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XbmwC1H446Og9juqYBR66ozjNVw9SDa2WWz=sKQg_imw@mail.gmail.com>
Message-ID: <CAD=FV=XbmwC1H446Og9juqYBR66ozjNVw9SDa2WWz=sKQg_imw@mail.gmail.com>
Subject: Re: [PATCH for 5.5] phy/rockchip: inno-hdmi: round clock rate down to
 closest 1000 Hz
To: Jonas Karlman <jonas@kwiboo.se>
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 Sean Paul <seanpaul@chromium.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Dec 23, 2019 at 12:49 AM Jonas Karlman <jonas@kwiboo.se> wrote:
>
> Commit 287422a95fe2 ("drm/rockchip: Round up _before_ giving to the clock framework")
> changed what rate clk_round_rate() is called with, an additional 999 Hz
> added to the requsted mode clock. This has caused a regression on RK3328
> and presumably also on RK3228 because the inno-hdmi-phy clock requires an
> exact match of the requested rate in the pre pll config table.
>
> When an exact match is not found the parent clock rate (24MHz) is returned
> to the clk_round_rate() caller. This cause wrong pixel clock to be used and
> result in no-signal when configuring a mode on RK3328.
>
> Fix this by rounding the rate down to closest 1000 Hz in round_rate func,
> this allows an exact match to be found in pre pll config table.
>
> Fixes: 287422a95fe2 ("drm/rockchip: Round up _before_ giving to the clock framework")
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---
>  drivers/phy/rockchip/phy-rockchip-inno-hdmi.c | 4 ++++
>  1 file changed, 4 insertions(+)

Sorry for the regression and thanks for the fix.  It seems sane to me
since you're just matching against your own table and all the rates
there are all in kHz.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
