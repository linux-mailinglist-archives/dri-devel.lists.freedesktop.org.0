Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93CD052A415
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 16:01:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3432B10E04D;
	Tue, 17 May 2022 14:01:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 446FA10E04D
 for <dri-devel@lists.freedesktop.org>; Tue, 17 May 2022 14:01:46 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id g184so17046959pgc.1
 for <dri-devel@lists.freedesktop.org>; Tue, 17 May 2022 07:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MYT6AoGjpjKPZE95kv4oaDF35B9E5NzFdrvZoyxWcfA=;
 b=h1qEseCrbWCj13XjC66q1TpmrQDsxSXfNGCvfk3f0yHCGxRlvkQo+FG5JqeH0W3WNV
 oqbfBYZplGBv5LWIVW8pynuaooMkDr1dshu0Td5haE8lk0E8KVd22UjjbPshRn8qDOyc
 ibV/i8A9SGqrXhoTxPMrgStxernfMqqJfe5L0A1ooekmAeqZzZXMBKaec1xYDeOB5btY
 SbldITFsqMnPUw9GkuT7uaZQsY+KvMAKzJV3tV8Z1m5vPLwYVGAOspxc2b4Yb082Z1Zg
 6P4+CfjPKz2vQ0XOKiCap262JZRqFPTnkFlHaZw/w+r9PV9hsqijym3LhHGcr8LxuDjP
 OTvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MYT6AoGjpjKPZE95kv4oaDF35B9E5NzFdrvZoyxWcfA=;
 b=AVaLqpa2SMqMtEBK7Is9doTw3FjiLidJAlAdbrsg8XdsSL1+H06AL/eKAAsBJ5O3VV
 kE+uMrGAmIHN7+AUGrEZs+A7uuXeyEZoBxWOM5MZUanpjebcXFMHGAlYR/X28pi4uI63
 irnNbsI8wY8uY7VM7EM1eomskIKon6Vm33SGACUAEX5cVsv/4yTRp5FUJu1lTTSIlocy
 4ieLscOLH97k9omO5Le4+bw+lHy0KXyqd05SCakfSUyNUCTTt4lSjMgM4E52kiszKbGW
 UD0RPidYXLR1uNynnKiBBTlCS4ibEl2jsmdYhxuwxfNi5S3KTSMayFz1H4CmIdVku6V7
 tdlQ==
X-Gm-Message-State: AOAM531BmkjYRhSsSMZuNcFcjZQ7czRcSmcvOB8xBXYPMlImFhZpIp1Z
 RGR+6jB3h0MXgoVo73eay5y9BxWZVriFs/Gk9Wu2byg3bCg=
X-Google-Smtp-Source: ABdhPJxJJdV1gKFQTcRKSnGQ3y//p40QUYAHJFm/TBZOjXQB3WsSLQ1+IBIurA4uiIr+8zv3iOSg7rJj4y/374mFa5I=
X-Received: by 2002:a63:31d3:0:b0:3f5:d1f4:5f95 with SMTP id
 x202-20020a6331d3000000b003f5d1f45f95mr1754162pgx.178.1652796105800; Tue, 17
 May 2022 07:01:45 -0700 (PDT)
MIME-Version: 1.0
References: <449e08ca791a3ca308de5477c1bdc1f6eb1b34e7.1652104211.git.geert+renesas@glider.be>
 <6ac50bba-e18f-0aeb-90a3-5e448328b22e@denx.de>
In-Reply-To: <6ac50bba-e18f-0aeb-90a3-5e448328b22e@denx.de>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 17 May 2022 16:01:34 +0200
Message-ID: <CAG3jFyvXbVCMqo=mjSd_jk2kCcg8fJe585E1b5P-tGb_y0aXVw@mail.gmail.com>
Subject: Re: [PATCH] drm: bridge: DRM_FSL_LDB should depend on ARCH_MXC
To: Marek Vasut <marex@denx.de>
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
Cc: dri-devel@lists.freedesktop.org,
 Geert Uytterhoeven <geert+renesas@glider.be>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 9 May 2022 at 16:41, Marek Vasut <marex@denx.de> wrote:
>
> On 5/9/22 15:52, Geert Uytterhoeven wrote:
> > The Freescale i.MX8MP LDB bridge is only present on Freescale i.MX8MP
> > SoCs.  Hence add a dependency on ARCH_MXC, to prevent asking the user
> > about this driver when configuring a kernel without i.MX SoC support.
> >
> > Fixes: 463db5c2ed4aed01 ("drm: bridge: ldb: Implement simple Freescale i.MX8MP LDB bridge")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Reviewed-by: Marek Vasut <marex@denx.de>

Applied to drm-misc-next
