Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5CB455CA5
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 14:24:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4AE66EA44;
	Thu, 18 Nov 2021 13:24:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FEBB6EA44
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 13:24:20 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id i194so17914536yba.6
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 05:24:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3CHovZnyFYzL8A4y+oY7gk4d/KIvHf2oXmR6WClb8/s=;
 b=T6WqBHc0TCpshnyXZ0Y0DJ578rZDDMyf1YgWWuXk0Fpnpref3dIG0HDuViic5bsZaO
 pLHoJ0eiaSOqtmuA9Vqz7lX8uC7BW9GcYolNoaStCGDfYFj3NMQ0pmovjvUVZJEtkSLU
 gdu6Ls2fD5r5Kb7bX8FrQraDF9/jK+uZbsr5bZFfSVZZLsN9n0eHS/xCWUkL2ONPo1Yw
 ef+b5XBuooYEblM2ZFxjouFDGhGHi818ivhaxmUTv0vhgnKSCpgaNipGIXoYygx5wU1O
 EtHeCZ7CMAchl1gp4Jibq4butcBqnXKX6GO2T2IwKkGiWoH0TCK9rwNYDRLwBRHqqFHY
 u3UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3CHovZnyFYzL8A4y+oY7gk4d/KIvHf2oXmR6WClb8/s=;
 b=42xzlE7XCIyF9Bw8j9J7BCIRBWK4CTb1+M19L4qN/InTL+jOAHJMElIjTd8eHgSQZh
 iRNYOP6K5HtePstKeiYR7z+lfY039j78jS2Nm7H991xDYiW21tthLPxYLDOwY30utSMI
 AyHjh0EWBJhPaxAr6H2vKC2MacyeKIqibYhSqDFIElDdQQK3qizbT4SdsFADJzkbX/ZV
 fZ1IryjoIPi9nh9vYheUiiR6frEjuApqr3dSoJ5tZ4CQJxX95w9UdzXk3Z8S5zXeZyTm
 HrN9PIP86OnVzuLRflzjSLDzzTSdmld4MEVQ+s0Dy63r24sR4owF8oFn+MefLO1aZ6zl
 k9Ig==
X-Gm-Message-State: AOAM530sBrekf1pWdpS1Xc0S+0q/W7r+EMww+KRteGsY98NRXkn9BUU3
 5BGr3al5Q/gG8+WZNjIcPbEeArHc/zt70RYn0P2jDQ==
X-Google-Smtp-Source: ABdhPJxQH4DGzX1DsG0B1QVx1lWh1G3G3AkM7oB0/0OrlLqXkWrE2kGjQvi/XY7Qmfbr8Yqc3zf4bpfydzz5bXBUpyw=
X-Received: by 2002:a05:6902:1021:: with SMTP id
 x1mr28021143ybt.43.1637241859608; 
 Thu, 18 Nov 2021 05:24:19 -0800 (PST)
MIME-Version: 1.0
References: <20211117143347.314294-1-s.hauer@pengutronix.de>
 <3bbf42f3-bd9c-ed66-e421-8d78fbeb22ad@rock-chips.com>
 <4310886.V3yF0ifEZO@diego>
 <CAPj87rPNSt7nZX93prAYD3Emf-34RdTZWp_1TOuAybBebObZhQ@mail.gmail.com>
 <fba695b7-863a-c492-0209-41bc07c7baee@rock-chips.com>
 <CAPj87rO86Mom-076Z5QX9hd=0bQi=AQcofkc1fSR4-VV2Zo6aQ@mail.gmail.com>
 <e948ee33-d1ea-cd53-a792-2e044eed1529@rock-chips.com>
In-Reply-To: <e948ee33-d1ea-cd53-a792-2e044eed1529@rock-chips.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 18 Nov 2021 13:24:07 +0000
Message-ID: <CAPj87rOQDAP+=AGizuvHG=cOfOCNFtPhYM_g8V=XMNmJPoz6oQ@mail.gmail.com>
Subject: Re: [PATCH v1 00/12] drm/rockchip: RK356x VOP2 support
To: Andy Yan <andy.yan@rock-chips.com>
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Kever Yang <kever.yang@rock-chips.com>,
 dri-devel@lists.freedesktop.org, Sandy Huang <hjc@rock-chips.com>,
 linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Peter Geis <pgwipeout@gmail.com>, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andy,

On Thu, 18 Nov 2021 at 13:14, Andy Yan <andy.yan@rock-chips.com> wrote:
> On 11/18/21 8:07 PM, Daniel Stone wrote:
> > Technically, the driver cannot be upstreamed as-is. It looks as if it
> > were a pre-atomic driver, that was half-converted to atomic, and then
> > has been half-converted to atomic helpers as well. Things like
> > reference counting and global state are not handled correctly at all.
> > You can see this if you try to run Weston on top of the VOP2 driver:
> > the framerate is decimated because the event handling massively
> > over-synchronises, and the event timestamps which arrive are
> > incorrect. This would be fixed by correctly using the event helpers
> > that we have had in the tree for years (which would also eliminate the
> > unnecessary framebuffer reference handling). It also does not work
> > with the GPU drivers in the tree because it lacks the one-liner to
> > correctly handle dma_resv synchronisation, which makes it both too
> > fast as it displays content which is not ready, and too slow because
> > it can't do it at full frame rate.
>
> We have different team run Android , X11, Weston on rk356x, especially
> for android, we can run at 60 fps.
>
> Our vop2 driver is developed on Linux 4.19, am not sure which version of
> kernel you put our drivers on.

We forward-ported it to a current mainline kernel and started to work
on fixing some of the issues. When we did this, we went back to the
BSP tree posted on GitHub to test using a pure-BSP environment, and
observed the same breakage there.

> > Similarly, on the RK3566 EVB, the DSI does not work unless HDMI is
> > also active, but when HDMI is active at the same time as DSI, it just
>
> I am very sure rk3566 evb DSI can work without HDMI.

I'd love to know how. :) Using the meta-rockchip layer as published on
GitHub, we cannot get working DSI without HDMI, using upstream Weston.
When the HDMI connector is disabled, DSI comes up blank. When the HDMI
connector is enabled, DSI works fine but HDMI is blank.

> But take care that the vop on rk3566 has a special limitation: there are
> three windows(Cluster1/Esmart1/Smart1) that have a mirror lock, that means they
> can't be programed framebuffer address independently , they can only
> share framebuffer address with Cluster0/Esmart0/Smart0. We use these feature
> on Android.
>
> I have comment these limitation in our driver.

Yeah, we noticed this.

> Compared to old vop, vop is strong but a bit complicated, we try very had to
> make it work on as much display framework as possible.
>
> We have upstream plane, but I am really in a rush this year. So sorry
> for the late of upstream, but we glad to work with community.
>
> So Sascha, please feel free to go on with your work.

Great, thanks. If you agree with the plan I posted, then we can all go
forward with that upstream, doing the development work with ourselves
and Sascha. Hopefully Rockchip will be able to support this effort.

Cheers,
Daniel
