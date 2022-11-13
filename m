Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CAF3626FB9
	for <lists+dri-devel@lfdr.de>; Sun, 13 Nov 2022 14:28:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D413410E213;
	Sun, 13 Nov 2022 13:28:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AD1410E213
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Nov 2022 13:28:34 +0000 (UTC)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-368edbc2c18so83249427b3.13
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Nov 2022 05:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RBRObaACq4skoaxVBrtZ8v0pRx/dpMfq/nTCZQT1EHw=;
 b=VDVypVr2NsABEUCO9Cj6h0vr/oZ1XbPzamFb8IxL8D+6CoUairk26NtyP6QzbbxX+e
 VdZTX7UXqnsgeqSPb/WvaNYDVRUL13ZXpU9K5J+1/u2vv7aYyRZpk/5nTCoIAVCN2Plx
 riQN8+haehHwRzcRBIUuyv/3WDKweKIUVAvFxie/6POJBP9YNHk4I7/VztlXUew0DhpT
 fzerrqtrkdY8oyOOpGoH3mMJy2SMWc+IPGFBNaRU28FR64AGGi3twcm+2kmT1IwB9Bz/
 dbMclVr/Hm77ubm3BlLJa0wzjpFThvPjZczK97kfxtu1weYiryhFjWX+1wd8XYaCd4kC
 +zIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RBRObaACq4skoaxVBrtZ8v0pRx/dpMfq/nTCZQT1EHw=;
 b=UHsXaJqSTCOGCZPMdGos218ytL5H0TSj89/vMekbF7BWm5IFrWIxmzZJ7w4FIxO9wQ
 s1aaWZr9VKNG+g/1knHFrvr18y7k/8e+ejl+zaRz72UJ4VrY3acVeQhFRn8jtlGyCAUy
 Vh92EehMfXzf5pW4CHykoAzoCsPAb7TfRVmCIuHwIMYvNQ+qFmO6XC6ihedJXd+sIa6M
 1PKl/FQ7y3eYIyPYdxWigbPuL43bAhec+k0RJiJoy50YsNwOHkmAc99JxU7u6I5IOWSM
 iN+eGhAnjBOTeBe1FAN1x67dcbouuk7Muk+5BYz/uoq77LDeUds3t+mkWD/bww3M3PqX
 8LEg==
X-Gm-Message-State: ANoB5pkVd10FCGB8HyaOIzBpxX+ZXv2VkwEp3VnpWuHaXv0hKfvfjI0D
 Fz8JqxVlCgwHHRHM2hJlsA98Xhu/1a5QS7YHXv7xeA==
X-Google-Smtp-Source: AA0mqf5/V8vAkG5yu8rfNBpBbPJKTqV98nZ/6hF0TeBD4mhjv0NsSJ3V9OLj2ZBQHss3zSAeh3o2CXznf0PuDUzBWmc=
X-Received: by 2002:a0d:d84d:0:b0:37b:e3ae:decc with SMTP id
 a74-20020a0dd84d000000b0037be3aedeccmr8432724ywe.418.1668346113283; Sun, 13
 Nov 2022 05:28:33 -0800 (PST)
MIME-Version: 1.0
References: <0abf1924-485b-8f1c-c8c8-d14dcccc3a27@quicinc.com>
 <0Co5PrfVEsYkXu9wz6ixpiFl0aWmXfIng6NSPOiYNcrAfHZx0w2crkWN7InPdtR-YTAb1IxLovgcEHCmFpmaqA==@protonmail.internalid>
 <20220712132258.671263-1-dmitry.baryshkov@linaro.org>
 <1892d0af-8aa4-dc03-887a-e44bb623b836@linaro.org>
In-Reply-To: <1892d0af-8aa4-dc03-887a-e44bb623b836@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 13 Nov 2022 16:28:22 +0300
Message-ID: <CAA8EJpq_9iC1rkiZVom28Kv_B3QLd4pBgFObxBfSpJ+Xh=Mp1g@mail.gmail.com>
Subject: Re: [PATCH v2.5] drm/msm/dsi: switch to DRM_PANEL_BRIDGE
To: Caleb Connolly <caleb.connolly@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Caleb,

On Fri, 11 Nov 2022 at 18:30, Caleb Connolly <caleb.connolly@linaro.org> wrote:
>
> Hi,
>
> This patch has caused a regression on 6.1-rc for some devices that use
> DSI panels. The new behaviour results in the DSI controller being
> switched off before the panel unprepare hook is called. As a result,
> panel drivers which call mipi_dsi_dcs_write() or similar in
> unprepare() fail.

Thanks for the notice. Can you move your command stream to
panel_disable() hook? (even if it's just as a temporary workaround)

From what I see from other panels, some of them call
mipi_dsi_dcs_set_display_off() in the unprepare() hook, while others
do it in disable().

Yes, this is (again) the DSI host vs device order here. Short story:
the DRM has a notion of 'the display pipe (i.e. clocks and timing
signals) feeding the bridge being running'. That's the difference
between enable/pre_enable and disable/post_disable. For the DSI we
have a third state, when the DSI clock and ln0 allow transferring
commands to the panel, but the image is not enabled.

There was a somewhat promising patchset at [1], but it seems it went
out of the radar. I can try working on an alternative (explicit)
approach if I have time.

With respect to your panel. Let me quote the docs: 'Before stopping
video transmission from the display controller it can be necessary to
turn off the panel to avoid visual glitches. This is done in the
.disable() function. Analogously to .enable() this typically involves
turning off the backlight and waiting for some time to make sure no
image is visible on the panel. It is then safe for the display
controller to cease transmission of video data.'

So, if we stop the call chain after switching the DSI host off but
before calling the panel's unprepare() hook, will we see any
artifacts/image leftover/etc. on the panel? Generally I have the
feeling that all panels should call mipi_dsi_dcs_set_display_off() in
the .disable() hook, not in the .unprepare() one.

[1] https://lore.kernel.org/dri-devel/cover.1646406653.git.dave.stevenson@raspberrypi.com/

>
> I've noticed it specifically on the OnePlus 6 (with upstream Samsung
> s0fef00 panel driver) and the SHIFT6mq with an out of tree driver.
>
> On 12/07/2022 14:22, Dmitry Baryshkov wrote:
> > Currently the DSI driver has two separate paths: one if the next device
> > in a chain is a bridge and another one if the panel is connected
> > directly to the DSI host. Simplify the code path by using panel-bridge
> > driver (already selected in Kconfig) and dropping support for
> > handling the panel directly.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >
> > I'm not sending this as a separate patchset (I'd like to sort out mdp5
> > first), but more of a preview of changes related to
> > msm_dsi_manager_ext_bridge_init().
> >
> > ---
> >   drivers/gpu/drm/msm/dsi/dsi.c         |  35 +---
> >   drivers/gpu/drm/msm/dsi/dsi.h         |  16 +-
> >   drivers/gpu/drm/msm/dsi/dsi_host.c    |  25 ---
> >   drivers/gpu/drm/msm/dsi/dsi_manager.c | 283 +++-----------------------
> >   4 files changed, 36 insertions(+), 323 deletions(-)

[skipped the patch itself]

-- 
With best wishes
Dmitry
