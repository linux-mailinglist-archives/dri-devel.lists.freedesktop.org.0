Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC2C49CEFD
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 16:55:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBC1210E40F;
	Wed, 26 Jan 2022 15:55:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6237A10E40F
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 15:55:09 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id y17so57048ilm.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 07:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8N6pkwfXspakdaJZNWnP38Bamfx4gDdG3F4Wrj2z8a0=;
 b=R4PjleZoJRZEHoITMXop0eh4gJ/ykFxgKSZE/XIEndxWeSjox8Ho5Y5WSEwGWD5nwI
 9IYUDjyO/sH115RZ8zr4aaHKv4uwuJ6DuRjt//KHrKEHmkUBteL2Q1nGUdQFKi1z9vuI
 qG8pW5RzxHr7VPzE3Xb0fueZxlRwCDsn2SfCw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8N6pkwfXspakdaJZNWnP38Bamfx4gDdG3F4Wrj2z8a0=;
 b=xw4tmPb01K7dwBWcWDQI2/KqjCLNjxWe93cRhnc4l56jmOG56VAxLY1BafxOdkLfob
 CBOyHP5miNPxnQqMHaIwWBK9PgedCOxBst1sBYD9gSBFoX1d/XioUwZ9woDrFeMK7fCW
 yiHycEOp/Kgya3MAgXdmnLjQphCpSRLSacFyPWZFIg9o9vwyedaXU8trs+8JuRs7yuEI
 eV75rkkA5Oc/XutrkEc6RUJCuzgE/5t0W5bcVvtYhPH/wsaPD9/7t7n54/pQ55DEpcfX
 IX9H9l4wiIjG1uDL5FYhTADCUk85yBUtaRX1YjFOtPI/7UrjDRn7UBunzz8YvANO+dhR
 +0GA==
X-Gm-Message-State: AOAM530cW27sF5yZrKxdUjo2mwqQ/8cWtv++fWAlbtUCUJa8m/JveRTx
 AY9ItRl2jylTXZbo7g1S5YXNn5I0phHGaw==
X-Google-Smtp-Source: ABdhPJwZI+uWQ95oyC277fiEDxaCArUDDLa+trdHxvPvrj81gjt3VZfJqqNU5Ehz6tKRC+KPtXO7EA==
X-Received: by 2002:a92:8747:: with SMTP id d7mr14621815ilm.203.1643212508571; 
 Wed, 26 Jan 2022 07:55:08 -0800 (PST)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com.
 [209.85.166.53])
 by smtp.gmail.com with ESMTPSA id i11sm10755599iow.9.2022.01.26.07.55.06
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jan 2022 07:55:06 -0800 (PST)
Received: by mail-io1-f53.google.com with SMTP id c188so40652iof.6
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 07:55:06 -0800 (PST)
X-Received: by 2002:a02:7a4f:: with SMTP id z15mr10410746jad.50.1643212505706; 
 Wed, 26 Jan 2022 07:55:05 -0800 (PST)
MIME-Version: 1.0
References: <20220126145549.617165-1-s.hauer@pengutronix.de>
 <20220126145549.617165-8-s.hauer@pengutronix.de>
In-Reply-To: <20220126145549.617165-8-s.hauer@pengutronix.de>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 26 Jan 2022 07:54:53 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U7W_oWjS_gCurAkNdkcuHQGn-XH=-VwP2MSG9zO92ySg@mail.gmail.com>
Message-ID: <CAD=FV=U7W_oWjS_gCurAkNdkcuHQGn-XH=-VwP2MSG9zO92ySg@mail.gmail.com>
Subject: Re: [PATCH 07/27] drm/rockchip: dw_hdmi: Use auto-generated tables
To: Sascha Hauer <s.hauer@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
 <devicetree@vger.kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Peter Geis <pgwipeout@gmail.com>,
 =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Sascha Hauer <kernel@pengutronix.de>, Yakir Yang <ykk@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Jan 26, 2022 at 6:58 AM Sascha Hauer <s.hauer@pengutronix.de> wrote=
:
>
> From: Douglas Anderson <dianders at chromium.org>
>
> The previous tables for mpll_cfg and curr_ctrl were created using the
> 20-pages of example settings provided by the PHY vendor.  Those
> example settings weren't particularly dense, so there were places
> where we were guessing what the settings would be for 10-bit and
> 12-bit (not that we use those anyway).  It was also always a lot of
> extra work every time we wanted to add a new clock rate since we had
> to cross-reference several tables.
>
> In <http://crosreview.com/285855> I've gone through the work to figure

The `crosreview.com` syntax doesn't seem to work anymore. Could maybe
update to https://crrev.com/c/285855 ?

> out how to generate this table automatically.  Let's now use the
> automatically generated table and then we'll never need to look at it
> again.
>
> We only support 8-bit mode right now and only support a small number
> of clock rates and and I've verified that the only 8-bit rate that was
> affected was 148.5.  That mode appears to have been wrong in the old
> table.
>
> Changes since v3:
> - new patch
>
> Signed-off-by: Douglas Anderson <dianders at chromium.org>
> Signed-off-by: Yakir Yang <ykk at rock-chips.com>

Should probably change the "at" to "@" ?

> Reviewed-by: St=C3=A9phane Marchesin <marcheu at chromium.org>

In general shouldn't carry downstream reviews when posting upstream
unless you're certain that the person intended it...


It's been a long time, but in general I think I was fairly confident
in the numbers that my script pumped out, at least given the caveat of
no pixel repetition and 8-bit only. That being said, I didn't have any
inside knowledge of the hardware and just figured out formulas that
seemed to match the table that I had. YMMV.

I'll also say that when I did a rebase of veyron (rk3288-based
Chromebook) to 4.19 about 2.5 years ago, I ended up squashing several
of these patches into 1. That can be found at
<https://crrev.com/c/1661056>. That also has details about why some of
these patches never made it upstream. The main reason, at least in the
case of rk3288, was the PLL sharing problem that nobody ever solved.
rk3288 didn't have quite enough PLLs and thus, if you were using both
VOPs, one of the VOPs was going to be severely limited in what pixel
clocks it could make. There was no framework deciding which VOP should
be limited and how the system should react to this...


In any case, I'm pretty far disconnected from all this stuff now, but
I wish you the best of luck in trying to get it all solved!

-Doug
