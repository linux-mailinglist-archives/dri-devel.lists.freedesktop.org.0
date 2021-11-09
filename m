Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3638E44B212
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 18:38:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8B116E437;
	Tue,  9 Nov 2021 17:38:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E566F6E5A3
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Nov 2021 17:38:30 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id f8so79921953edy.4
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Nov 2021 09:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A9E8XpGt9Id5ZZSuwCFFlN1voqoc3gGd1K8qDWIcEeo=;
 b=bJciuYdLH7xxuaQOYFZwx92QdQKvM/m1+45cYqjjbj1+YHuXcNrvKvqRNQsEADA91Y
 H96OzUG81NICSYiiOkPLwxj3y0xdzppQYbBVNf2UU6Yhk6sR9OI/4oyS7uYaJRQkD9I7
 nvIT93EnIDGh9HFzDGG/fv5VrPODu9VoMEaQs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A9E8XpGt9Id5ZZSuwCFFlN1voqoc3gGd1K8qDWIcEeo=;
 b=c4eW74OQD3oAjX82oVVHcFFBUFryrnV5zGJC2zHnDfaUOFK5T5+QrCrz1uVGt0++NB
 R6K/7Bq1QuBtqDNUtgs1Z2CMfBkT1VR4hIZNoaWxS28aC1A4BBOpmVAvgtgkHXhjcTL5
 rPt0nPdVWH7iYmongZbJRF87V2QqYFBbAN5c9J3IzCqghkxd4HGIq5X/XeXuka/vdobq
 G+0e92i1/ws7RL0fCP5rGnKuT+ph9nn+lUD4YvKPemh5WdmzwPZWIpBAgGR8mBJd4pWv
 yHTFEUJseV60wQfsEBILwXZlPIQTWCTHedV5PehKvb1FsKzZ3L3ssKRmbYDyw3cPYv2D
 aG3Q==
X-Gm-Message-State: AOAM530Fma+XpJWWPt2+2oC8s8wGDf95HWygZ2cEDHX+Xdgp0tS21mwT
 uRYBFJ1idgEH4siIf92EBrBMGDfuaFxd0pxm4w3LWw==
X-Google-Smtp-Source: ABdhPJy3jZjo7AoKemu76ikvz5C4nttoEfEhvfyPeFrK58W0+UEYjwxUYkBWrlmm+aoCQ3PLDykqg8fvrO3kJuadMMI=
X-Received: by 2002:a17:907:1c82:: with SMTP id
 nb2mr11576949ejc.218.1636479508422; 
 Tue, 09 Nov 2021 09:38:28 -0800 (PST)
MIME-Version: 1.0
References: <20211109173357.780-1-tharvey@gateworks.com>
In-Reply-To: <20211109173357.780-1-tharvey@gateworks.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Tue, 9 Nov 2021 23:08:17 +0530
Message-ID: <CAMty3ZBEt5_zcBu0=f5WzbV8DUwsB+fz0vdA3GdOXF84zm16Jw@mail.gmail.com>
Subject: Re: [RFC] arm64: dts: imx8mm: Add MIPI and LCDIF nodes
To: Tim Harvey <tharvey@gateworks.com>
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
Cc: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Tommaso Merciai <tomm.merciai@gmail.com>, Adam Ford <aford173@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 9, 2021 at 11:04 PM Tim Harvey <tharvey@gateworks.com> wrote:
>
> Add nodes for MIPI DSI and LCDIF on IMX8MM
>
> I'm currently working with a set of patches to convert drm/exynos
> to a bridge [1] and add IMX8MM support [2] in order to get IMX8MM DSI
> working for display with a Raspberry Pi DSI touchscreen compatible with
> a Toshiba TC358762 DSI bridge and Powertip PH800480T013-IDF02
> touchscreen.
>
> I had this working on a 5.10 kernel with the old blk-ctl and
> power-domain drivers that didn't make it into mainline but my 5.15
> series with blk-ctl backported from next hangs right after
> "[drm] Initialized mxsfb-drm 1.0.0 20160824 for 32e00000.lcdif on minor 0"
> so I assume I have a power-domain not getting enabled.
>
> Please let me know if you see an issue with the way I've configured
> power-domain or clocks here.

I'm reworking back on top of drm-misc-next, may be I will let you know
in couple of days.

Jagan.
