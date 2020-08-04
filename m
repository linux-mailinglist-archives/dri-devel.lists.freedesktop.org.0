Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD2523BCA1
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 16:49:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D81BE6E21F;
	Tue,  4 Aug 2020 14:49:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B18CF6E21F;
 Tue,  4 Aug 2020 14:49:01 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id c2so24221201edx.8;
 Tue, 04 Aug 2020 07:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g4HmwOYH2FipfU55YwXNgn+/KWI9nU6qQar00eEKnTI=;
 b=jARuo43f4imeZbHxuoML4wNyRPTOwuEdSxdGaGmmEjiQMf0k+ARZ+35S8UliQueShq
 eP0wC8Ag/bCp+Zrr1kaAC9ZuZGyh2J/cqvk1OBx0WpDyelZgZdAiRCd0WFo8tZmYqo0Y
 7PiuhEGNILTeXGo46kKTLVePah8v3wCgRDJum0EXMPbocMpUleVTqO0Y272GXbjUyPH5
 lYGAdiePK9a28RHry1cVndmlMfgRO4RvoJjBqJJDQK0K4ygPlXwB8/yGPyFFCbWItV6u
 UQ9oavX098EpyXsAOA9V3NiotNgRWXOY0NuVucJnh4q/wfX2aBpvyy4qCt4UMFYOlEUY
 KpZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g4HmwOYH2FipfU55YwXNgn+/KWI9nU6qQar00eEKnTI=;
 b=IM++2ZkY584qHhnN5lzJl7tJ8OqybU+DDcxz8KSLy4bjo1IQZPZkP4SfY07CFOk+If
 sd/4peYsR6PNGKa+YnEWMKft7tK1VY9C9XcLssGpQB6H90NtkXb9ZAFYjPukzF0eAz0M
 BgNffYIll4SsJvsc2zxOFxiTMcRQRXXLvDoMkVe2YkCjT50ZObhc5ScNqGTw9+B33fwS
 HMXRsUBGq+nsmiZP8WPM5ke0s4xMf2gfE6xpK7YLk0gX91a5/xqENzbdwkmV2gCII6en
 L84UM6mRup5wIfNg7m0Fr2yXfI9qVuwr12JH/yy7X9NlgS8UY9GmYWsjTFtpbj99F3Hu
 Zerg==
X-Gm-Message-State: AOAM5311RW0AFMUGgZ0Oy+UVMOB/UQzBVZonphM9DLNjzvrNTTNPQrMn
 RukX9vO3/y6JiMCaoMqx8hGLiIsJCdug4T28/2k=
X-Google-Smtp-Source: ABdhPJzvDZkA05JzMe/6DGwbz7nTKib7xTiBIdtvgBQrjNjFlefh8ZT9iPjGtuAI7EG71+3trm7KlYtgLwGlIRjAHP0=
X-Received: by 2002:aa7:da46:: with SMTP id w6mr17536741eds.7.1596552540239;
 Tue, 04 Aug 2020 07:49:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200726111215.22361-1-konradybcio@gmail.com>
 <20200726111215.22361-5-konradybcio@gmail.com>
 <20200803110016.GL12965@vkoul-mobl>
 <CAF6AEGtW29BtJPq1xDEtvtkPHFVWEd_QJk5FpJEQPbmofnS64Q@mail.gmail.com>
 <20200804120946.GQ12965@vkoul-mobl>
In-Reply-To: <20200804120946.GQ12965@vkoul-mobl>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 4 Aug 2020 07:49:44 -0700
Message-ID: <CAF6AEGttPJSy+PcspPgxj2OELEyh2Xj-Gm2Uiv7Pcv6JMDE-tg@mail.gmail.com>
Subject: Re: [PATCH 4/9] drm/msm/dsi: Add phy configuration for SDM630/636/660
To: Vinod Koul <vkoul@kernel.org>
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
Cc: Krzysztof Wilczynski <kw@linux.com>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, David Airlie <airlied@linux.ie>,
 Michael Turquette <mturquette@baylibre.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-clk <linux-clk@vger.kernel.org>,
 Konrad Dybcio <konradybcio@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>,
 martin.botka1@gmail.com, Andy Gross <agross@kernel.org>,
 Brian Masney <masneyb@onstation.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Xiaozhe Shi <xiaozhes@codeaurora.org>, Rob Herring <robh+dt@kernel.org>,
 Sean Paul <sean@poorly.run>, Ben Dooks <ben.dooks@codethink.co.uk>,
 Felipe Balbi <balbi@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux USB List <linux-usb@vger.kernel.org>,
 Harigovindan P <harigovi@codeaurora.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 zhengbin <zhengbin13@huawei.com>, Manu Gautam <mgautam@codeaurora.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 4, 2020 at 5:09 AM Vinod Koul <vkoul@kernel.org> wrote:
>
> On 03-08-20, 09:06, Rob Clark wrote:
> > On Mon, Aug 3, 2020 at 4:00 AM Vinod Koul <vkoul@kernel.org> wrote:
> > >
> > > On 26-07-20, 13:12, Konrad Dybcio wrote:
> > > > These SoCs make use of the 14nm phy, but at different
> > > > addresses than other 14nm units.
> > > >
> > > > Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
> > > > ---
> > > >  .../devicetree/bindings/display/msm/dsi.txt    |  1 +
> > > >  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c          |  2 ++
> > > >  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h          |  1 +
> > > >  drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c     | 18 ++++++++++++++++++
> > >
> > > Is there a reason why dsi phy needs to be here and not in phy subsystem
> > > drivers/phy/ ?
> >
> > *maybe* it would be possible to split out all of the dsi (and hdmi)
> > phy to drivers/phy.  But splitting out just the new ones wouldn't be
> > practical (it would duplicate a lot of code, and make the rest of the
> > dsi code have to deal with both cases).  And unlike dp/usb-c I'm not
> > really sure I see an advantage to justify the churn.
>
> So the question would be if it helps in reuse if we do that and does it
> result in a better solution than dsi code managing the phy. The
> advantage of framework (like phy) is that different subsystems can use
> a (phy) driver and common framework helps reduce duplicates.

I'm not aware of any re-use that would be possible by splitting it
out.. if there were, it would be a more compelling argument.

It does increase the complexity and possibilities for getting kernel
config wrong.  There are devices like the aarch64 laptops which do not
have a debug serial port, where debugging issues like that can be a
pain when you get no display.  OTOH that might be balanced out a bit
by using a common framework/api that others are familiar with.

Overall, nowhere near high enough on my priority list to spend time
on.. there are bigger fires.  If someone was really motivated about
this and wanted to send (tested) patches, then I'd take a look and see
how it turned out.

BR,
-R

> Yes sure the question was not for a new phy but about the whole
> msm/dsi/phy code and future for it.
>
> --
> ~Vinod
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
