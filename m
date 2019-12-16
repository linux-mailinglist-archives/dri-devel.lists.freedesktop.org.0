Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D85BD11FD0F
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 04:03:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A8FA6E267;
	Mon, 16 Dec 2019 03:03:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D52466E14C;
 Mon, 16 Dec 2019 03:03:39 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id b8so1154965edx.7;
 Sun, 15 Dec 2019 19:03:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FENccwgG3uhDFjFer/TFmu057ClxmW4CVGbxtoIFMB4=;
 b=lGz6e9nBem502eg2UkB2ElczfOfMUTTPmNAvCmmBy7w0wDxoaxzBPHFahYzHlzsm17
 CtfS2gVKhSAfAxASLk1ZjoDkO2mzQBggj9X8xu3kcGvLYblNoPIzLpnTBtGfhgU1KftW
 YO6yNfnmUfjXO9GNBSvUOrD7dE9zHp0Po2esVq1eqr+1J5g0OSr2BDSQEeuYZ1wTNUcJ
 jfC9vPn52qrlHFXECyJ6LP4X8PX93pHlYWE25+51r3Fw1b9WtCdBtJgPqTIu8YLuCbdL
 AkBV3ZTxk7SAmMt0xd462dt+9uIz8FdSVbSc8ai/OK1hslEiqMtMtdlvILbtSRbRymUV
 tWDA==
X-Gm-Message-State: APjAAAU9JXIjI7JD7NkopRN0CTM4+JBn2kCbDCCeWPHT+VnJ3dK1C99O
 j1X9Xe+1YtiCUd87EBlIo5wP08mQNMQ=
X-Google-Smtp-Source: APXvYqxTMrO5/RIsknqIqGgkDR1uR2G2npqDCTDfqTA4SFZgdDegxOptsUpcSvkfVFTaIhp5/wdI5A==
X-Received: by 2002:a05:6402:1802:: with SMTP id
 g2mr29267579edy.253.1576465417834; 
 Sun, 15 Dec 2019 19:03:37 -0800 (PST)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com.
 [209.85.128.50])
 by smtp.gmail.com with ESMTPSA id s12sm1026670eja.79.2019.12.15.19.03.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Dec 2019 19:03:37 -0800 (PST)
Received: by mail-wm1-f50.google.com with SMTP id b72so3057792wme.4;
 Sun, 15 Dec 2019 19:03:37 -0800 (PST)
X-Received: by 2002:a7b:cf12:: with SMTP id l18mr29527605wmg.66.1576465416941; 
 Sun, 15 Dec 2019 19:03:36 -0800 (PST)
MIME-Version: 1.0
References: <20191215211223.1451499-1-martin.blumenstingl@googlemail.com>
In-Reply-To: <20191215211223.1451499-1-martin.blumenstingl@googlemail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 16 Dec 2019 11:03:25 +0800
X-Gmail-Original-Message-ID: <CAGb2v6528SUOyefhsnjEwG7vfud3+Ce+_=CM3cM4vKiRcmNXAA@mail.gmail.com>
Message-ID: <CAGb2v6528SUOyefhsnjEwG7vfud3+Ce+_=CM3cM4vKiRcmNXAA@mail.gmail.com>
Subject: Re: [RFC v1 0/1] drm: lima: devfreq and cooling device support
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, lima@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, steven.price@arm.com,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 yuq825@gmail.com,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 alyssa.rosenzweig@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 16, 2019 at 5:12 AM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> This is my attempt at adding devfreq (and cooling device) support to
> the lima driver.
> I didn't have much time to do in-depth testing. However, I'm sending
> this out early because there are many SoCs with Mali-400/450 GPU so
> I want to avoid duplicating the work with somebody else.
>
> The code is derived from panfrost_devfreq.c which is why I kept the
> Collabora copyright in lima_devfreq.c. Please let me know if I should
> drop this or how I can make it more clear that I "borrowed" the code
> from panfrost.

I think it's more common to have separate copyright notices. First you
have yours, then a second paragraph stating the code is derived from
foo, and then attach the copyright statements for foo.

ChenYu

> I am seeking comments in two general areas:
> - regarding the integration into the existing lima code
> - for the actual devfreq code (I had to adapt the panfrost code
>   slightly, because lima uses a bus and a GPU/core clock)
>
> My own TODO list includes "more" testing on various Amlogic SoCs.
> So far I have tested this on Meson8b and Meson8m2 (which both have a
> GPU OPP table defined). However, I still need to test this on a GXL
> board (which is currently missing the GPU OPP table).
>
>
> Martin Blumenstingl (1):
>   drm/lima: Add optional devfreq support
>
>  drivers/gpu/drm/lima/Kconfig        |   1 +
>  drivers/gpu/drm/lima/Makefile       |   3 +-
>  drivers/gpu/drm/lima/lima_devfreq.c | 162 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/lima/lima_devfreq.h |  15 +++
>  drivers/gpu/drm/lima/lima_device.c  |   4 +
>  drivers/gpu/drm/lima/lima_device.h  |  11 ++
>  drivers/gpu/drm/lima/lima_drv.c     |  14 ++-
>  drivers/gpu/drm/lima/lima_sched.c   |   7 ++
>  drivers/gpu/drm/lima/lima_sched.h   |   3 +
>  9 files changed, 217 insertions(+), 3 deletions(-)
>  create mode 100644 drivers/gpu/drm/lima/lima_devfreq.c
>  create mode 100644 drivers/gpu/drm/lima/lima_devfreq.h
>
> --
> 2.24.1
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
