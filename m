Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F4E244D82
	for <lists+dri-devel@lfdr.de>; Fri, 14 Aug 2020 19:25:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9C4B6EB9D;
	Fri, 14 Aug 2020 17:25:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A6556EB9C
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 17:25:29 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id t7so8177233otp.0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 10:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y+BjmX7YUnKQpYU9vXERFMaofOWtD1Q2eOk/KhoCNmE=;
 b=TT08nnIcVbkonBU2cP1uTcHNOmEoYklbwVkA6OZ9jKg2Y0Z1pqPUo9Gm2zuQqGH9uG
 dG1yOsqG0bbxoc9seu4w6A2Qrwtgbn92CchnZpSh4sPo3lGIPmADddXHBf52k+XqSzcS
 ka3WpGV10GCWrv9MNwOuO3M/cSHsVcc6n31MI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y+BjmX7YUnKQpYU9vXERFMaofOWtD1Q2eOk/KhoCNmE=;
 b=NQitYh3HA0YzAGMhRsu7IM31dhibGId6/36HRIirg2xqzvJIJBhbnAMzXzslMPm1xV
 /rBQfs8itWvmEq5ALZRORJoRlulVkrMKzD+MLnFNllP3EicRL974GYkumRldGJa5sY22
 CqCbP7URE930w97hfezUhdnbVa8L9r4kUv/1Duq5yKAbc/kLueab/+nsByHNTCx+S+/6
 8Y8ZicfrtX4+YwFQ/p1MpsA2kwTJS94+KhZ6cJodD26RVM6IXBEtX2p015HWgw+38fnX
 ZpQ6696NCv6/GXDiHiXQO8hVTw+wHGrL4B6vn1BXS5dyIQoDmjVaPltvsEI5DYMKQQ+k
 6s/g==
X-Gm-Message-State: AOAM530q72xMNgmEnk2wIcISum7yINVm4H/rvArLPDC2c9jr1iNUddbD
 4Qvz1M02WHiNtLxLSpgkZEpMm89VIJ3LRh/Pv34YnA==
X-Google-Smtp-Source: ABdhPJyX1924BAPToUhlvSDL8ajd7s7minqNKnBdt5FhFW2FKNF4oMDhMDFIxfesqgMk3FvD3ZzleiKT0f74zjMXUjc=
X-Received: by 2002:a05:6830:1e71:: with SMTP id
 m17mr2805714otr.188.1597425928661; 
 Fri, 14 Aug 2020 10:25:28 -0700 (PDT)
MIME-Version: 1.0
References: <CACO55tu1RWZ0ZGcMcrU-snT3CkJtwxawwJ9990-5a+hpByh-Hw@mail.gmail.com>
 <CACO55tsfV9pGijOF5F=dLqFhpXgPSArGHXa44Mt3eRBk7z-X=g@mail.gmail.com>
 <CACO55tsEjGUhfrBdbcpT9xLa8N-T0JR-t7xFBA5pxDZ5+NiQhg@mail.gmail.com>
 <efb830fe-9ded-f5d3-6944-45adbb2a1f80@nvidia.com>
 <20200814140527.GD556087@ulmo>
 <CACO55tsr9hTd6mkaKfnnEWUz-7X=Sx7EY5sr1BVz-O2ftr98ww@mail.gmail.com>
 <20200814153449.GH556087@ulmo>
 <CACO55tt69SbBKLkmTVtoq2BLRJGbO5fmUH4dFWX_qC7nii3jSQ@mail.gmail.com>
 <20200814160631.GI556087@ulmo>
 <CACO55tvzoCBNvvnrzn9fSQZwB-hXPPApFMkbJ+ZGWDHgkgkJTw@mail.gmail.com>
 <20200814162210.GA611027@ulmo>
 <CAPj87rMXXTNntwYk=58tVRRkjvYJb-+a=bnzJZjWJv21v_+7KQ@mail.gmail.com>
In-Reply-To: <CAPj87rMXXTNntwYk=58tVRRkjvYJb-+a=bnzJZjWJv21v_+7KQ@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 14 Aug 2020 19:25:17 +0200
Message-ID: <CAKMK7uFsTP-tN49SKJhm9w49EF3Ars0c1bF4=iUrEtKHCLzCTg@mail.gmail.com>
Subject: Re: [git pull] drm for 5.8-rc1
To: Daniel Stone <daniel@fooishbar.org>
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
Cc: Karol Herbst <kherbst@redhat.com>, James Jones <jajones@nvidia.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 14, 2020 at 7:17 PM Daniel Stone <daniel@fooishbar.org> wrote:
>
> Hi,
>
> On Fri, 14 Aug 2020 at 17:22, Thierry Reding <thierry.reding@gmail.com> wrote:
> > I suspect that the reason why this works in X but not in Wayland is
> > because X passes the right usage flags, whereas Weston may not. But I'll
> > have to investigate more in order to be sure.
>
> Weston allocates its own buffers for displaying the result of
> composition through GBM with USE_SCANOUT, which is definitely correct.
>
> Wayland clients (common to all compositors, in Mesa's
> src/egl/drivers/dri2/platform_wayland.c) allocate with USE_SHARED but
> _not_ USE_SCANOUT, which is correct in that they are guaranteed to be
> shared, but not guaranteed to be scanned out. The expectation is that
> non-scanout-compatible buffers would be rejected by gbm_bo_import if
> not drmModeAddFB2.
>
> One difference between Weston and all other compositors (GNOME Shell,
> KWin, Sway, etc) is that Weston uses KMS planes for composition when
> it can (i.e. when gbm_bo_import from dmabuf + drmModeAddFB2 from
> gbm_bo handle + atomic check succeed), but the other compositors only
> use the GPU. So if you have different assumptions about the layout of
> imported buffers between the GPU and KMS, that would explain a fair
> bit.

Yeah non-modifiered multi-gpu (of any kind) is pretty much hopeless I
think. I guess the only option is if the tegra mesa driver forces
linear and an extra copy on everything that's USE_SHARED or
USE_SCANOUT.

> > Perhaps we can go and release X 1.21.0 with that modifier enablement
> > patch and that'll motivate desktops to adopt it as well as the default?
>
> Unfortunately we don't really have a good way out of this one. They
> were disabled because the non-modifier path on Intel can be linear or
> X-tiled (row-major), whereas the modifier path enables Y-tiled
> (column-major) and compressed layouts. Y-tiled is the most efficient,
> but Intel could only spare about six transistors for the global FIFO
> shared between all their plane fetch engines, and Y-tiled blows
> straight through it. Both X and Shell would thus fail to enable high
> resolutions or many heads (2x 4K is enough even on modern platforms
> IIRC), so they just turned modifiers off.
>
> The best solution would be to do a global atomic_check across all
> outputs and just blacklist modifiers until you find one which works,
> but Shell doesn't yet have that code, and -modesetting ... well,
> no-one's volunteered to do that yet, or probably ever.

Yeah best bet for modifiered X is Xwayland on top of weston right now :-/
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
