Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9774B8FE5
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 19:10:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 069F610E245;
	Wed, 16 Feb 2022 18:10:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EB8410E245
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 18:10:32 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id h5so693353ioj.3
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 10:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dhg8ObNqJqU9MXgC8htbZHEYozTLZfTKNUE4M3ppPEQ=;
 b=X3YBCQPLYrjbSwdYieYTzfp5aHHmxsfeg3RTf4qZg0wFQ6+c9DxcKdaAJmOlc37Dsv
 CTdEpl0BzCTg87o7PF2lX4vr7saXRgNN4zH/iPLgcyLTPMZGhRdeuiUlyPMWzB1yffkQ
 L1SizYyjHV+Gfh5MA9OSmEyn4e1glalJ49FS0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dhg8ObNqJqU9MXgC8htbZHEYozTLZfTKNUE4M3ppPEQ=;
 b=7UdwBtoVVB+7E5xLmWvC6VtgmpcY4/mDsbLRKjJiWcGxMQiTKi2MwYlHP6zTY61llu
 5SRS69o7ZmmsTHG8xWALgu8WSflRMkzdkGQt4r62ik0wXEAScNHuHM1SSJlidJzUumrU
 nY7kePS7Vh0a8bbKCaLZi8asPGJenW/Wj9S1tYRY2+H7JomMyVbxFznGwcN9WShauANI
 PGdTS1BDYTYIedue5M2F7p8I31sZzknaEXZIWV1HuEa5R4wNHy68u5gQR1txzF2YSYZ+
 xm4Lvu3xK22UQMqVe2mnxF2Y6nc240Slr4XG1uFTSFICLLnObEqDmlV+5KANbakWRtSV
 EiuA==
X-Gm-Message-State: AOAM532JXVew2NE8L/3O5wMQcZU76vO3GyI1eUvx0AIL/FxIpFoE6M/k
 V9Y67l5i9UeVt8dqTfiQZR/2yX/o7TLF8A==
X-Google-Smtp-Source: ABdhPJyEe61qV4bW9MSYwTKTpl9yxTrDKhv1WDNE/yuZYPviBhNX/YkgezyROvrwQSkHV46IxnkOSw==
X-Received: by 2002:a05:6638:16cf:b0:314:352a:6d9b with SMTP id
 g15-20020a05663816cf00b00314352a6d9bmr2522571jat.95.1645035031103; 
 Wed, 16 Feb 2022 10:10:31 -0800 (PST)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com.
 [209.85.166.172])
 by smtp.gmail.com with ESMTPSA id o13sm291671iou.3.2022.02.16.10.10.28
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 10:10:29 -0800 (PST)
Received: by mail-il1-f172.google.com with SMTP id d7so404155ilf.8
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 10:10:28 -0800 (PST)
X-Received: by 2002:a05:6e02:144f:b0:2bd:da3d:f50b with SMTP id
 p15-20020a056e02144f00b002bdda3df50bmr2425111ilo.165.1645035028535; Wed, 16
 Feb 2022 10:10:28 -0800 (PST)
MIME-Version: 1.0
References: <20211001144212.v2.1.I773a08785666ebb236917b0c8e6c05e3de471e75@changeid>
 <CAD=FV=XU0bYVZk+-jPWZVoODW79QXOJ=NQy+RH=fYyX+LCZb2Q@mail.gmail.com>
 <CA+ASDXPXKVwcZGYoagJYPm4E7DzaJmEVEv2FANhLH-juJw+r+Q@mail.gmail.com>
 <CAD=FV=VYe1rLKANQ8eom7g8x1v6_s_OYnX819Ax4m7O3UwDHmg@mail.gmail.com>
 <CA+ASDXO8c4dK31p=kvBABJQsDUs20qVHM6NxYf1JQDCr2oswAw@mail.gmail.com>
In-Reply-To: <CA+ASDXO8c4dK31p=kvBABJQsDUs20qVHM6NxYf1JQDCr2oswAw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 16 Feb 2022 10:10:16 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XivCxy-7Wszv9pnHELi=gRCMeVasEweza17XTtEoiT4A@mail.gmail.com>
Message-ID: <CAD=FV=XivCxy-7Wszv9pnHELi=gRCMeVasEweza17XTtEoiT4A@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: analogix_dp: Grab runtime PM reference for
 DP-AUX
To: Brian Norris <briannorris@chromium.org>
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

Hi,

On Tue, Feb 15, 2022 at 4:41 PM Brian Norris <briannorris@chromium.org> wrote:
>
> On Tue, Feb 15, 2022 at 3:46 PM Doug Anderson <dianders@chromium.org> wrote:
> > On Tue, Feb 15, 2022 at 2:52 PM Brian Norris <briannorris@chromium.org> wrote:
> > > It still makes me wonder what the point
> > > of the /dev/drm_dp_aux<N> interface is though, because it seems like
> > > you're pretty much destined to not have reliable operation through
> > > that means.
> >
> > I can't say I have tons of history for those files. I seem to recall
> > maybe someone using them to have userspace tweak the embedded
> > backlight on some external DP connected panels? I think we also might
> > use it in Chrome OS to update the firmware of panels (dunno if
> > internal or external) in some cases too? I suspect that it works OK
> > for certain situations but it's really not going to work in all
> > cases...
>
> Yes, I believe I'm only submitting patches like this because fwupd
> apparently likes to indiscriminately whack at dpaux devices:
> https://github.com/fwupd/fwupd/tree/main/plugins/synaptics-mst#kernel-dp-aux-interface
>
> That seems like a bad idea.
>
> (We've already disabled that plugin on these systems, but it seems
> wise not to leave the stumbling block here for the next time.)

Yeah, it doesn't seem great. I guess it's _slightly_ less bad since
it's for an external device. As I understand it, they never really
turn off in the same way. It still feels like letting userspace
indiscriminately whack at DP AUX registers isn't a great idea, though.
