Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D70ED3EEFED
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 18:04:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 582D06E1F6;
	Tue, 17 Aug 2021 16:04:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foo.stuge.se (foo.stuge.se [212.116.89.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DE7B6E283
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 16:03:11 +0000 (UTC)
Received: (qmail 21027 invoked by uid 1000); 17 Aug 2021 16:03:07 -0000
Message-ID: <20210817160307.21026.qmail@stuge.se>
Date: Tue, 17 Aug 2021 16:03:07 +0000
From: Peter Stuge <peter@stuge.se>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org, linus.walleij@linaro.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 2/7] drm/format-helper: Add drm_fb_xrgb8888_to_rgb332()
References: <20210817122917.49929-1-noralf@tronnes.org>
 <20210817122917.49929-3-noralf@tronnes.org>
 <YRu/+nEX4A5i4sfl@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YRu/+nEX4A5i4sfl@phenom.ffwll.local>
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

Daniel Vetter wrote:
> Also I just realized we've totally ignored endianess on these, which is
> not great, because strictly speaking all the drm_fourcc codes should be
> little endian. But I'm also not sure that's worth fixing ...

We discussed framebuffer endianess when introducing the driver,
in the thread linked near the FIXME comment in the code.

I proposed an untested fix but Noralf wanted to wait for testing,
which I find fair. I don't think anyone has tested on BE yet.

It's on my nice-to-have list, but not at the top, and has blockers,
so if anyone else can test on BE please do. I'd recommend testing
with an actual device to compare LE and BE behavior easily.


Kind regards

//Peter
