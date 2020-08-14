Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20AA0244D66
	for <lists+dri-devel@lfdr.de>; Fri, 14 Aug 2020 19:17:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CBB16EB93;
	Fri, 14 Aug 2020 17:17:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F10F6EB93
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 17:17:16 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id r2so8992185wrs.8
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 10:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SlydmTlfj2dLMEudKa5LE4aqm+4mOYiOVpEmen9Nj+o=;
 b=qd3Ygfrhlx69B9yMiV7fO9b4oVx/RNKCNp0m424sClZj4hnWHyBai/z44GsQ4YH0m7
 0EJ+yJY8lD4p34dKR+sgMf0bRdA7AdsWuRsGB25ZqnhIbtbx+92R5oDEfvYHgk1q6+rT
 uSIiHAFb3+ZGAfQjXd43RQAECB+QGC50YYdDsoOJ4XCA2trNovOrp4ozHNDb7Q8stjua
 R3VdrjfrMRjtHCQYqHfxoxTAMZTTLfCcyE5uciCRgG3GvfXjihOIA1X7thsqGKYPAFC8
 LB2Y6xRLujTM2Jvd4rN+TboZZxlryritpvZXpM2A9wIIj7FnMh9Gvdpg/Rz+FpPniRf3
 TDvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SlydmTlfj2dLMEudKa5LE4aqm+4mOYiOVpEmen9Nj+o=;
 b=YbJ7QJAI4S/ihxMGCy6syzffyo0goUOGpziD6ZHNHrflzyKl4KFLFTl5WWeVuThQRh
 rOEjyLW/1+VG3bqo284y09fmCqpir7LjDeNAb/rKDBFwp6a54ckhyWflD2wEEZq8qeYc
 7pS5yGSW3Bxc50TFeDUEA8mLPGw1+7cuFliYeIW0MCLqyomFeSRnOP5uX3LqsRAAOu81
 NN2G+QpH0pOz+qnzVgvGQ/EYjhobc6j0jW/kN5KyPuscNN/aSXI2gRsvAFuPW6d/d1Xp
 vsFAm+mgIm0iHFWJ5y7UALUJIaRGW3hXnNvBO50s2XrEj7NJY2HTfIaTuMubSq3Vg7hx
 nnHQ==
X-Gm-Message-State: AOAM5310g/Gk/ElJMy31SxztCaJlhpX5XL9Tbe4WZP4GxhnXFn9O6JiC
 iipIQYkX/9GnszIthuanHB4g6I6eyR9jPY2MjZDoaQ==
X-Google-Smtp-Source: ABdhPJzz61ZzdQHN6JX2W+dsLYbBLj5i50QjE4GcitFjkTMdx6RkazzVTsRszIq5jN4R+Z5RD/uAEOgf9SQ5ZXMO698=
X-Received: by 2002:a05:6000:120c:: with SMTP id
 e12mr3521192wrx.354.1597425434928; 
 Fri, 14 Aug 2020 10:17:14 -0700 (PDT)
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
In-Reply-To: <20200814162210.GA611027@ulmo>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 14 Aug 2020 18:17:03 +0100
Message-ID: <CAPj87rMXXTNntwYk=58tVRRkjvYJb-+a=bnzJZjWJv21v_+7KQ@mail.gmail.com>
Subject: Re: [git pull] drm for 5.8-rc1
To: Thierry Reding <thierry.reding@gmail.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 James Jones <jajones@nvidia.com>, Thierry Reding <treding@nvidia.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Karol Herbst <kherbst@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, 14 Aug 2020 at 17:22, Thierry Reding <thierry.reding@gmail.com> wrote:
> I suspect that the reason why this works in X but not in Wayland is
> because X passes the right usage flags, whereas Weston may not. But I'll
> have to investigate more in order to be sure.

Weston allocates its own buffers for displaying the result of
composition through GBM with USE_SCANOUT, which is definitely correct.

Wayland clients (common to all compositors, in Mesa's
src/egl/drivers/dri2/platform_wayland.c) allocate with USE_SHARED but
_not_ USE_SCANOUT, which is correct in that they are guaranteed to be
shared, but not guaranteed to be scanned out. The expectation is that
non-scanout-compatible buffers would be rejected by gbm_bo_import if
not drmModeAddFB2.

One difference between Weston and all other compositors (GNOME Shell,
KWin, Sway, etc) is that Weston uses KMS planes for composition when
it can (i.e. when gbm_bo_import from dmabuf + drmModeAddFB2 from
gbm_bo handle + atomic check succeed), but the other compositors only
use the GPU. So if you have different assumptions about the layout of
imported buffers between the GPU and KMS, that would explain a fair
bit.

> Perhaps we can go and release X 1.21.0 with that modifier enablement
> patch and that'll motivate desktops to adopt it as well as the default?

Unfortunately we don't really have a good way out of this one. They
were disabled because the non-modifier path on Intel can be linear or
X-tiled (row-major), whereas the modifier path enables Y-tiled
(column-major) and compressed layouts. Y-tiled is the most efficient,
but Intel could only spare about six transistors for the global FIFO
shared between all their plane fetch engines, and Y-tiled blows
straight through it. Both X and Shell would thus fail to enable high
resolutions or many heads (2x 4K is enough even on modern platforms
IIRC), so they just turned modifiers off.

The best solution would be to do a global atomic_check across all
outputs and just blacklist modifiers until you find one which works,
but Shell doesn't yet have that code, and -modesetting ... well,
no-one's volunteered to do that yet, or probably ever.

Cheers,
Daniel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
