Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B98E4B7C05
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 01:41:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74CDA10E5D3;
	Wed, 16 Feb 2022 00:41:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com
 [IPv6:2607:f8b0:4864:20::c32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EFE910E5D8
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 00:41:04 +0000 (UTC)
Received: by mail-oo1-xc32.google.com with SMTP id
 f11-20020a4abb0b000000b002e9abf6bcbcso754163oop.0
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 16:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=D6kOuJ3sFRAfxlfcJvGvD0WdwWS/gNKzCWsG8Lno9eY=;
 b=iX4gNuGKYZNG9hM1lAyY7Nf/bZLA5KTwEcEMmT3v/Wkao8xyAeGNUtg1UxOYaO42aC
 XZstBpPHLaxU6YJNIWfSub+ULsZeKmX/L7ae/TPdpY5zEOmW7JYZjAIs56FeEgSA/CLE
 wG0hkTYT7TAeJo1PVmmZFXS/PQWpRu2EtuOzM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D6kOuJ3sFRAfxlfcJvGvD0WdwWS/gNKzCWsG8Lno9eY=;
 b=HEASo9s4toT0zBkGZypmxfWXpVLfvwOzjFviYwZMPVvxro30WYMVr6lL+KDfYGkv54
 wQrvR5JQkc3tk/uOK2NfQroZUg9V7USXcZCTaglEPEIylWocckx23d7ffELSvjySRiqK
 FGVl8vEkSgqwmE6Yfqc/MLxZO4A5wnV3/sOfHfavKoHvnLgS7YuoWV74YVsnhcbNN8Tv
 pFz6Y3+JsqfTZ4AulUEEknnlWwmuAlTuoahp2GWvxnKj7FoQUcbpwW8ofb/sYvrNw+fT
 wOv3sRw6VNrqAMeHb8zDXPJpewokbxmGPM+GES/fYh05k8M1eHOWxhPOzq3Gf0U/7uD4
 YhXw==
X-Gm-Message-State: AOAM532b/9VNTYVtSjsuNCDAUr1L1bM6aX3fcKNDUwu6e/9fpFy7WVFR
 BHfr+sd/Y5Ss9DOgNCEKpfBZLoMaoEcpQQ==
X-Google-Smtp-Source: ABdhPJzBZIb+PimtHrYglUpHiQsCROaIB5kRkENbO6IU7Wyb9IMSMYjkJRL2gMdAVFVk6CsvuWZHrw==
X-Received: by 2002:a05:6871:4006:b0:d0:f000:a77 with SMTP id
 kx6-20020a056871400600b000d0f0000a77mr176141oab.243.1644972063080; 
 Tue, 15 Feb 2022 16:41:03 -0800 (PST)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com.
 [209.85.167.170])
 by smtp.gmail.com with ESMTPSA id z17sm14143599otk.62.2022.02.15.16.41.01
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Feb 2022 16:41:02 -0800 (PST)
Received: by mail-oi1-f170.google.com with SMTP id z24so819126oib.6
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 16:41:01 -0800 (PST)
X-Received: by 2002:a05:6808:1b29:b0:2ce:6ee7:2cc5 with SMTP id
 bx41-20020a0568081b2900b002ce6ee72cc5mr2715980oib.243.1644972061370; Tue, 15
 Feb 2022 16:41:01 -0800 (PST)
MIME-Version: 1.0
References: <20211001144212.v2.1.I773a08785666ebb236917b0c8e6c05e3de471e75@changeid>
 <CAD=FV=XU0bYVZk+-jPWZVoODW79QXOJ=NQy+RH=fYyX+LCZb2Q@mail.gmail.com>
 <CA+ASDXPXKVwcZGYoagJYPm4E7DzaJmEVEv2FANhLH-juJw+r+Q@mail.gmail.com>
 <CAD=FV=VYe1rLKANQ8eom7g8x1v6_s_OYnX819Ax4m7O3UwDHmg@mail.gmail.com>
In-Reply-To: <CAD=FV=VYe1rLKANQ8eom7g8x1v6_s_OYnX819Ax4m7O3UwDHmg@mail.gmail.com>
From: Brian Norris <briannorris@chromium.org>
Date: Tue, 15 Feb 2022 16:40:49 -0800
X-Gmail-Original-Message-ID: <CA+ASDXO8c4dK31p=kvBABJQsDUs20qVHM6NxYf1JQDCr2oswAw@mail.gmail.com>
Message-ID: <CA+ASDXO8c4dK31p=kvBABJQsDUs20qVHM6NxYf1JQDCr2oswAw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: analogix_dp: Grab runtime PM reference for
 DP-AUX
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>, LKML <linux-kernel@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 "# 4.0+" <stable@vger.kernel.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 15, 2022 at 3:46 PM Doug Anderson <dianders@chromium.org> wrote:
> On Tue, Feb 15, 2022 at 2:52 PM Brian Norris <briannorris@chromium.org> wrote:
> > It still makes me wonder what the point
> > of the /dev/drm_dp_aux<N> interface is though, because it seems like
> > you're pretty much destined to not have reliable operation through
> > that means.
>
> I can't say I have tons of history for those files. I seem to recall
> maybe someone using them to have userspace tweak the embedded
> backlight on some external DP connected panels? I think we also might
> use it in Chrome OS to update the firmware of panels (dunno if
> internal or external) in some cases too? I suspect that it works OK
> for certain situations but it's really not going to work in all
> cases...

Yes, I believe I'm only submitting patches like this because fwupd
apparently likes to indiscriminately whack at dpaux devices:
https://github.com/fwupd/fwupd/tree/main/plugins/synaptics-mst#kernel-dp-aux-interface

That seems like a bad idea.

(We've already disabled that plugin on these systems, but it seems
wise not to leave the stumbling block here for the next time.)

> I suppose this just further proves the point that this is really not a
> great interface to rely on. It's fine for debugging during hardware
> bringup and I guess in limited situations it might be OK, but it's
> really not something we want userspace tweaking with anyway, right? In
> general I expect it's up to the kernel to be controlling peripherals
> on the DP AUX bus. The kernel should have a backlight driver and
> should do the AUX transfers needed. Having userspace in there mucking
> with things is just a bad idea. I mean, userspace also doesn't know
> when a panel has been power cycled and potentially lost any changes
> that they might have written, right?
>
> I sorta suspect that most of the uses of these files are there because
> there wasn't a kernel driver and someone thought that doing it in
> userspace was the way to go?

*shrug* beats me.

Brian
