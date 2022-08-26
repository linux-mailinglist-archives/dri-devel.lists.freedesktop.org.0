Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81DC15A2A22
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 16:56:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61A7710E96D;
	Fri, 26 Aug 2022 14:56:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1101810E483
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 14:56:30 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id b142so1334832iof.10
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 07:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=WfP7PKK/kP/UQn6JDVR+ao9+K/wbktbl89yGlLt1XDA=;
 b=qSriLe6sGxvcFbE/UHHD2rI2XMDjAW0dHY7O7RcRp7Us3ZJw9H8hpT+s/MJgZyqjES
 riAXklRISS8D2FV5i5FXSxtAgiq7SZJTZ2osW8Z7a9i7LkvOYOTVRVTAuVxSdiS8lhQu
 4nBlp0HhwuO/O5FxkF2GOa7t+NodiQtKbTuBvAqfMKBPnjlia9SJhH1VTgzw4QlOlucO
 JNWKaV8jw4rzRhOEYM8SvQDbyVM2fnncFlNdJ45d9V+UuXFFsOEQ/WQmNTIBZo34/QVi
 3x6jHlYcMiCAH5TeYyOg9Aa90XVIZIg9PrgRDtDU+rGiMF/f6XMYWUMEFEDQRPdo5QKz
 vweQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=WfP7PKK/kP/UQn6JDVR+ao9+K/wbktbl89yGlLt1XDA=;
 b=Wqs+Nl5PGrp8FbSkDs3Q6u0hEk0ifo85psxW3bn6Zp2bEZoc5NLSVllsPEIPwgLCuR
 2QLtIs8eDB+HECVVo5WvPhZ9+rkwU/RM4UvCGWd9y+JHzDgXsR5qGvLEC44ConVoOcWn
 vdlbRskFfk1+PTV0SwR/Rf9jR02kADEkgBMeixA73jS4fpLkyJZPLfhl7DrXaYlSDiA2
 tpYBAN19LgritpwlR07mVBFjALy5VnkwN6FDwfv2OlCDLxGC98F1bX2gzQE1/y8XTOYw
 e7fSvxJ+4ygRoGgz3jbNAH7Mbf1u87PXFWa7ZsU9FwekuVUBuI6JFNj7MNZhtj+vkd6j
 xPlQ==
X-Gm-Message-State: ACgBeo3H5IKkaCVddELMtthscmeAAnySOsQhhAAMaw42VUQby+5nIIr7
 LrwR+sxSkhKoyfv7MjydxxxkanAy+AfU5T9v6ZJCHw==
X-Google-Smtp-Source: AA6agR6NYFhimbin+zyrq+sDMrYVT/drrxOiPOtliWNwKfkaSwhjjkNjiz6pmebIrhxHD/9opEX+9yjdpWBkP9XvnLw=
X-Received: by 2002:a05:6638:3722:b0:349:41f1:7ff5 with SMTP id
 k34-20020a056638372200b0034941f17ff5mr4067740jav.283.1661525789304; Fri, 26
 Aug 2022 07:56:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <987d6114-5fcb-d668-3b0d-ad6d8723dfdb@tronnes.org>
 <20220822074800.qzyctchqn5usr55g@houat>
 <9a15b1cf-692c-1b0d-02a6-316cbd954525@gmail.com>
 <20220825155506.wqurh5r752qfufqs@houat>
 <18737c8a-78f4-5b9f-aea2-588bc65c13d9@gmail.com>
 <9d9ba040-99d7-25cb-ba10-1c132d7f7663@gmail.com>
In-Reply-To: <9d9ba040-99d7-25cb-ba10-1c132d7f7663@gmail.com>
From: Dom Cobley <dom@raspberrypi.com>
Date: Fri, 26 Aug 2022 15:56:18 +0100
Message-ID: <CANUESCG22TrxasYoE2U0OJ7TVzNAcs_9zkuAfBQfZrEbM4h9dg@mail.gmail.com>
Subject: Re: [PATCH v1 00/35] drm: Analog TV Improvements
To: Mateusz Kwiatkowski <kfyatek@gmail.com>
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
Cc: Emma Anholt <emma@anholt.net>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-sunxi@lists.linux.dev,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Maxime Ripard <maxime@cerno.tech>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 26 Aug 2022 at 05:08, Mateusz Kwiatkowski <kfyatek@gmail.com> wrote:
> - Commenting out the pm_runtime_put() / pm_runtime_get_sync() calls in vc4_vec.c
> - Reverting this PR by Dom Cobley a.k.a. popcornmix:
>    https://github.com/raspberrypi/linux/pull/4639
>
> Either of these approaches makes VEC mode switching work again. Obviously
> neither is appropriate for a permanent solution.

Might be worth trying the latest rpi-update firmware.
There was a change that affects restoring PIXEL/VEC clocks after a
power domain cycle.
There is also a fix for a USB boot breakage.

If you still have an issue that occurs in downstream pi tree but not
upstream, then create a linux github issue.
