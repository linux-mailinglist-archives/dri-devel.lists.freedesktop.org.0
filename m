Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD8C560EDB
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 03:57:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2C5310E319;
	Thu, 30 Jun 2022 01:57:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9374110E319;
 Thu, 30 Jun 2022 01:57:24 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 h14-20020a1ccc0e000000b0039eff745c53so696816wmb.5; 
 Wed, 29 Jun 2022 18:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qdKdTCtNsd2q3yyCl80PhBz12PXESIt3xwlp2rRhZIk=;
 b=KfF7ZFS9NFrkWlDud9w6rtd3isEKK9vmUWsziwc0EV5Huqhp1flNzs0am0DuEEOQol
 tOCjaro4iaqz8UI3gnD/rkVRBf7ThztHSuroaeLhff4beHX4q8fjsNK8GnxXqe1/Qvx6
 VdpS2eBp7V8PCFUASKDsYNg4C+cIJodeuVf5ftKL2MvRO4LHTeLt6nKf3BM8ENbn2Zjq
 CYmYge8IwsXS4D1iVOpLJpWr4jdip2ZlF3lJ3X9s0dx1IbH5r9pDD7oAgx++vQywcxFI
 b0LN+f2FoicBllLiGsaot4hBT4q9DPf7xHRS20A+Jc6vhRMphbBjErvwhzeKlIf/dkoW
 WIuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qdKdTCtNsd2q3yyCl80PhBz12PXESIt3xwlp2rRhZIk=;
 b=v1njcqInJGEFXuV6d7Apqi/xNMMNK5q/L7SiOWr4MgmHi1Zi1ajfTX4qQBVtn0Qw9n
 DYl6fS4AXQ4vAe28oSeib71IpnOUqwr37WwOtBhJRszvlsEIfAJhWymbiChCWgx6OCg7
 scizeCwCx4OhcWGbgcgwCREXZkYrWG96YteVxMWypcY8LydH0HMzIUBIzjvz39cvdr+o
 Unn/1TsNujfC20zV29dL3KuCWc+2WMofuikLOvEyuNDMC01UZl831Wh1D/m4c5ZTgv/Q
 Di53FmRp+RiZ54NcZnVOf840Nf+jDcP9co0OW7ogYm8t0FxfjpHGDinW0hzXtHFKi4c2
 9ENA==
X-Gm-Message-State: AJIora+HwW3yAOQXHtpy4LNdtlC4ZAOZJ+s5k/oEFXEBGgtB+bllj7US
 jhw2pDapY2aFTRWoqppQ6fLkLWZnUaI3zeoLUfQ=
X-Google-Smtp-Source: AGRyM1tn/QWXIm16gupv6o40jn+N+JJwF8Z/jp2zMOHOjRGrHGQB29zHDzYlhwKzaQHPb6wFJtXnIqkm9WmNIcgtKzI=
X-Received: by 2002:a05:600c:4f83:b0:3a1:7310:62e7 with SMTP id
 n3-20020a05600c4f8300b003a1731062e7mr4908639wmq.84.1656554243027; Wed, 29 Jun
 2022 18:57:23 -0700 (PDT)
MIME-Version: 1.0
References: <1656429606-2765-1-git-send-email-quic_khsieh@quicinc.com>
 <F35C87BF-46A5-41D3-B8A5-B2AB4A24252D@linaro.org>
 <CAD=FV=X3cv=Q30pODyi__OyRY+LbFT14RfEELvm_DAeHafF70g@mail.gmail.com>
In-Reply-To: <CAD=FV=X3cv=Q30pODyi__OyRY+LbFT14RfEELvm_DAeHafF70g@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 29 Jun 2022 18:57:35 -0700
Message-ID: <CAF6AEGvFYK3x_CmErkKsmYNEv9y8AksE9UB_sfp-Z7RieX=tVg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: make eDP panel as the first connected
 connector
To: Doug Anderson <dianders@chromium.org>
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 David Airlie <airlied@linux.ie>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Vinod Koul <vkoul@kernel.org>,
 Andy Gross <agross@kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 29, 2022 at 5:36 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Tue, Jun 28, 2022 at 1:14 PM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On 28 June 2022 18:20:06 GMT+03:00, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
> > >Some userspace presumes that the first connected connector is the main
> > >display, where it's supposed to display e.g. the login screen. For
> > >laptops, this should be the main panel.
> > >
> > >This patch call drm_helper_move_panel_connectors_to_head() after
> > >drm_bridge_connector_init() to make sure eDP stay at head of
> > >connected connector list. This fixes unexpected corruption happen
> > >at eDP panel if eDP is not placed at head of connected connector
> > >list.
> >
> > The change itself is a good fix anyway. (And I'd ack it.) However I would like to understand why does it fix the corruption issue. What is we have eDP and DSI, with DSI ending up before the eDP? Would we see the issue?
> > Also could you please describe the mind of corruption you are observing?
>
> I've spent a whole bunch of time poking at this and in the end my
> conclusion is this:
>
> 1. The glitchyness seems to be a result of the Chrome OS userspace
> somehow telling the kernel to do something wrong.
>
> 2. I believe (though I have no proof other than Kuogee's patch fixing
> things) that the Chrome OS userspace is simply confused by the eDP
> connector being second. This would imply that Kuogee's patch is
> actually the right one.
>
> 3. It would be ideal if the Chrome OS userspace were fixed to handle
> this, but it's an area of code that I've never looked at. It also
> seems terribly low priority to fix since apparently other OSes have
> similar problems (seems like this code was originally added by
> RedHat?)
>
>
> Specifically, I tested with a similar but "persistent" glitch that I
> reproduced. The glitch Kuogee was digging into was a transitory glitch
> on the eDP (internal) display when you plugged in a DP (external)
> display. It would show up for a frame or two and then be fixed. I can
> get a similar-looking glitch (vertical black and white bars) that
> persists by doing these steps on a Chrome OS device (and Chrome OS
> kernel):
>
> a) Observe screen looks good.
> b) Observe DP not connected.
> c) Plug in DP
> d) See transitory glitch on screen, then it all looks fine.
> e) set_power_policy --ac_screen_dim_delay=5 --ac_screen_off_delay=10
> f) Wait for screen to turn off
> g) Unplug DP
> h) Hit key on keyboard to wake device.
> i) See glitchy.
> j) Within 5 seconds: set_power_policy --ac_screen_dim_delay=5000
> --ac_screen_off_delay=10000
>
> Once I'm in the persistent glitch:
>
> * The "screenshot" command in Chrome OS shows corruption. Not exactly
> black and white bars, but the image produced has distinct bands of
> garbage.
>
> * I can actually toggle between VT2 and the main screen (VT1). Note
> that VT1/VT2 are not quite the normal Linux managed solution--I
> believe they're handled by frecon. In any case, when I switch to VT2
> it looks normal (I can see the login prompt). Then back to VT1 and the
> vertical bars glitch. Back to VT2 and it's normal. Back to VT1 and the
> glitch again. This implies (especially with the extra evidence of
> screenshot) that the display controller hardware is all fine and that
> it's the underlying data that's somehow messed up.

fwiw, from looking at this a bit w/ Doug, I think the "glitch" is
simply just an un-renderered buffer being interpreted by the display
controller as UBWC (because userspace tells it to)

BR,
-R

> When I pick Kuogee's patch then this "persistent" glitch goes away
> just like the transitory one does.
>
> I'm going to go ahead and do:
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Tested-by: Douglas Anderson <dianders@chromium.org>
