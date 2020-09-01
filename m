Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 203E3258CF0
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 12:42:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D79F6E296;
	Tue,  1 Sep 2020 10:42:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 034316E296
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 10:42:37 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id a17so954326wrn.6
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Sep 2020 03:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=emvGbDPc9MYA09VtobrZyk9zbs2ZsXKS0mYa31RjV3A=;
 b=RCBDNL4v3xdU/te/yIGZgSfB3H3Yz6fjDCguYFEqhd8yy6BgJfFtN9/Eu2cN7yk9Tn
 4EZMcQBd0lIG2EtZigZkKvLuhIsYi+EDjqEE5TL5T0bkoeJ14zkKJPYY3RO4r+b/onkm
 5f3+JkJcNgpBm2PRFaEsIHSQUSpPkZmxISho8Tw6+mdjeozQVxDs6JoVqw6/8YIwYI3E
 gGfbh4kFtrJZGbZK4GKFTOQa2ZOb2T7Ukh8TB8Id8fR2UTrK9HtduHoz/2UWaJb/p/KZ
 uRGYpW3LiDDLNLUlitgghiFDXZRUmS/Q3jCr+qqwP6+Zzn926E3Fyt+2w6Mf6x4N0qbn
 3dZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=emvGbDPc9MYA09VtobrZyk9zbs2ZsXKS0mYa31RjV3A=;
 b=J+Ye9/7IWWXfSiub3fkCbYKI8As22WK17x8z2J0gmwH+Gpxe8XxdZoCJvgBUsVKKbI
 T3qBXFrxc6/6Kbi1A4lZDRwTY2BuYEkmk9sbUDmQd/Bzdiswy9hMTG/tW52V+uCqqoA3
 jxr24dealS92ED3WBWG2Xw78wETbHVwUioQ97GlbWt/EyIwWMiN82bql+cdE18EeSkGM
 f2YuCToU+YVFh9Hj349WVEZqDFTWNUe3NRoV2FuYZKxaKHdEiSASZGMMlK+OKG3hCzzl
 7ar3bJL2LJjOtyBwM8zjEgpHcLqaucg70GLnNMml+hQ0Dz48jkC77Cg64CJTsGfh9IfY
 2gSw==
X-Gm-Message-State: AOAM531r/6FxhTYWAa463u/tuuAd5ppuNFuuSKK4WRx5pWVgrlUui6Hd
 JKtCjqRt/tgg1ZEI2Ns99Euhb3xwb+MkaSSsXUKNqg==
X-Google-Smtp-Source: ABdhPJxvGG+ixX1KCbbPY9bzKq30lFdXklFXuPIu3173u2dPcSKrnb3Eey5HINzhM26PGez/tW5MYgILsMSo18Quleo=
X-Received: by 2002:adf:8306:: with SMTP id 6mr1191757wrd.256.1598956956581;
 Tue, 01 Sep 2020 03:42:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200814140527.GD556087@ulmo>
 <CACO55tsr9hTd6mkaKfnnEWUz-7X=Sx7EY5sr1BVz-O2ftr98ww@mail.gmail.com>
 <20200814153449.GH556087@ulmo>
 <CACO55tt69SbBKLkmTVtoq2BLRJGbO5fmUH4dFWX_qC7nii3jSQ@mail.gmail.com>
 <20200814160631.GI556087@ulmo>
 <CACO55tvzoCBNvvnrzn9fSQZwB-hXPPApFMkbJ+ZGWDHgkgkJTw@mail.gmail.com>
 <20200814162210.GA611027@ulmo>
 <CAPj87rMXXTNntwYk=58tVRRkjvYJb-+a=bnzJZjWJv21v_+7KQ@mail.gmail.com>
 <CAKMK7uFsTP-tN49SKJhm9w49EF3Ars0c1bF4=iUrEtKHCLzCTg@mail.gmail.com>
 <20200818143751.GB814860@ulmo> <20200901071347.GP2352366@phenom.ffwll.local>
In-Reply-To: <20200901071347.GP2352366@phenom.ffwll.local>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 1 Sep 2020 11:42:25 +0100
Message-ID: <CAPj87rNohgqO3cc9P8VP0TmYDo1cCx4jWyJLP4m9APwmEr9Ocg@mail.gmail.com>
Subject: Re: [git pull] drm for 5.8-rc1
To: Daniel Vetter <daniel@ffwll.ch>
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

Hi,

On Tue, 1 Sep 2020 at 08:13, Daniel Vetter <daniel@ffwll.ch> wrote:
> I think right thing to do is *shrug*, please use modifiers. They're meant
> to solve these kind of problems for real, adding more hacks to paper over
> userspace not using modifiers doesn't seem like a good idea.
>
> Wrt dri3, since we do client-side allocations and don't have modifiers, we
> have to pessimistically assume we'll get scanned out. Modifiers and
> relevant protocol is fixing this again, but for tegra where we essentially
> can't get this right that leaves us in a very tough spot.

DRI3 has had modifiers for a couple/few years now ...

Cheers,
Daniel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
