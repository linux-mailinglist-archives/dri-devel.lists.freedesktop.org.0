Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8CF426211
	for <lists+dri-devel@lfdr.de>; Fri,  8 Oct 2021 03:33:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84D6C6E061;
	Fri,  8 Oct 2021 01:32:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 971526E067
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Oct 2021 01:32:57 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id d131so17586519ybd.5
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Oct 2021 18:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gq7gSaT8ZCVg6gwqjOCmpvWG1r7KdegQCpYgjA1Cxgs=;
 b=hVG5BypZOZMCcxoDGMEmb2d9pZUnGW/iR+RCKisjdYIqpy8yvWSifIvE2OUdlFI6Ja
 13maROVbcAL6wGxCVvyunsWZL+fOFSQXxIgBep9HCx1s5QSsO2JL52Vt7IYYdTRXNX0L
 vUEQhiRyZqpCWn+6wdnHnutN9SnZ578yCdcqtzgCeWsxPd2G85GnvCPuz76qi56gD9Wn
 x2t+4Xgurl5aJkUUghCq6mdySZ2DRhRRZ5CAvm0obdf1j2xHacoZzAcDEovfozPu51f6
 3P8Fi8Jd0PUWTi7Ii5Uf3Nu9ORslbQq/dIBGVASDJ2mv1bWoFG0h1Ml6tuUz1GBHr9ry
 UhYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gq7gSaT8ZCVg6gwqjOCmpvWG1r7KdegQCpYgjA1Cxgs=;
 b=FEZJj9a1LfACnVaZo/zE2NrldTYrocRDlp1BINEIgpljm+FZ2Y4FWCaVJ4rSD3BVbM
 lGOiibgfCMKcQDBRUify/l3x/IsPV1qO+SYw3Pu1MrwvcQg1eX83CNgMO7foDAadZl5A
 qGd+2jLOEXBnwTcznf67PaeNzVqw95O1asTRQbGiut1YfNn8FpT153NSfL3UrI7oZoF1
 gAw11qAcAUXXaPTi7EVUJGRiYGJDUiNA8gqmr/GYELb7ohqeQOZuaNbhpwaSDmWiYLMd
 vflhFpLfMjWzoTLxUwH/EwZJYNZGNXPrskukYhNQ6q6SrnGTwrRj/bT0ev9x774klhab
 NMVA==
X-Gm-Message-State: AOAM533/Hw2YA/BNn1Uc0rhCWC+pe+HhA0jeXtFBw4CgJo0GOtlcfjI3
 MTsKuu+c7b9nRCOpF+pjUPTGkaX0hT23t9NYXi0jww==
X-Google-Smtp-Source: ABdhPJwphJSVZlbF7TYID3eDKwABnbApJ6AEo/HmKTo0cd9M1/cJR2ESOZf/6UZkw6FwofeT9MuMFeh+InmawpGTJ/w=
X-Received: by 2002:a05:6902:154c:: with SMTP id
 r12mr454424ybu.432.1633656776620; 
 Thu, 07 Oct 2021 18:32:56 -0700 (PDT)
MIME-Version: 1.0
References: <20211006193819.2654854-1-swboyd@chromium.org>
 <20211006193819.2654854-3-swboyd@chromium.org>
 <CAGETcx9T59dHXodt9MW=tTV_hYhtNOZzYFT=35D--VN7WJ0GqQ@mail.gmail.com>
 <CAE-0n50YqKr1nKy-4WaxsfuwPiJ5kZcf46t-U_4i-TpfXzOX1g@mail.gmail.com>
 <CAE-0n532XYgT=dTTCyLcwikvxgUyGi=TcybDh=v3wQTNb=wqyw@mail.gmail.com>
 <CAGETcx_0GRg7u3dAxP9u0qO-hfJ0N3V44CGLwFFX1kVxZ00g+w@mail.gmail.com>
 <CAE-0n52ytNtf5atojYrLviuAKOt3v+mLVoPeqtRUf-6uBpkiJA@mail.gmail.com>
In-Reply-To: <CAE-0n52ytNtf5atojYrLviuAKOt3v+mLVoPeqtRUf-6uBpkiJA@mail.gmail.com>
From: Saravana Kannan <saravanak@google.com>
Date: Thu, 7 Oct 2021 18:32:20 -0700
Message-ID: <CAGETcx9+pL1DxDyZOBGFFVsmb0haAzJTFtyQFEO9ab9u8N=FXQ@mail.gmail.com>
Subject: Re: [PATCH v2 02/34] component: Introduce the aggregate bus_type
To: Stephen Boyd <swboyd@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Russell King <rmk+kernel@arm.linux.org.uk>
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

On Thu, Oct 7, 2021 at 6:24 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Saravana Kannan (2021-10-07 18:10:24)
> > On Thu, Oct 7, 2021 at 1:11 PM Stephen Boyd <swboyd@chromium.org> wrote:
> > >
> > > Quoting Stephen Boyd (2021-10-07 11:40:07)
> > > > Quoting Saravana Kannan (2021-10-06 20:07:11)
> > > > > On Wed, Oct 6, 2021 at 12:38 PM Stephen Boyd <swboyd@chromium.org> wrote:
> > > > > > diff --git a/drivers/base/component.c b/drivers/base/component.c
> > > > > > index 0a41bbe14981..d99e99cabb99 100644
> > > > > > --- a/drivers/base/component.c
> > > > > > +++ b/drivers/base/component.c
> > > > [...]
> > > > > > +                       continue;
> > > > > > +
> > > > > > +               /* Matches put in component_del() */
> > > > > > +               get_device(&adev->dev);
> > > > > > +               c->link = device_link_add(&adev->dev, c->dev,
> > > > > > +                                         DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME);
> > > > >
> > > > > Remove the STATELESS flag and you'll get a bunch of other stuff done for free:
> > > >
> > > > I tried that and it didn't work for me. The aggregate device never
> > > > probed and I was left with no display. Let me see if I can reproduce it
> > > > with logging to provide more details.
> > >
> > > This patch fixes it (whitespace damaged sorry).
> >
> > Not sure why you have to trigger an explicit rescan, but instead of
> > this patch below, you could also try setting this flag instead?
> > DL_FLAG_AUTOPROBE_CONSUMER
> >
>
> I'd rather not conflate component driver probe with component_add()
> being called. It's simpler if that is the case, i.e. all component
> drivers are calling component_add() in their driver probe routine, but I
> don't know if that's always true. I did this poor audit of the kernel
>
> $ git grep -p \[^_]component_add | grep \.c=  | grep -v probe
> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c=static int
> amdgpu_dm_audio_init(struct amdgpu_device *adev)
> drivers/gpu/drm/i915/display/intel_audio.c=static void
> i915_audio_component_init(struct drm_i915_private *dev_priv)
> drivers/gpu/drm/i915/display/intel_hdcp.c=void
> intel_hdcp_component_init(struct drm_i915_private *dev_priv)
> drivers/gpu/drm/nouveau/dispnv50/disp.c=nv50_audio_component_init(struct
> nouveau_drm *drm)
> drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c=static int
> dw_mipi_dsi_rockchip_host_attach(void *priv_data,
> drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c=static int
> dw_mipi_dsi_dphy_init(struct phy *phy)
> drivers/gpu/drm/vc4/vc4_dsi.c=static int vc4_dsi_host_attach(struct
> mipi_dsi_host *host,
>
> and then peeking at rockchip above I see that component_add() is called
> in the mipi dsi attach ops and then I got lost trying to figure out
> where it ends up. Maybe it is still in some probe call?
>
> Anyway, I think we still have to do a rescan so that we can try to bind
> the aggregate device. Is there a better API to use for that?

If you know the exact device, you could call device_attach()? That's
what bus_rescan_devices() eventually calls, but you skip the
unnecessary looping over all the other devices.

-Saravana
