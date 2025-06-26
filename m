Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2CAAE99E4
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jun 2025 11:25:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50F7810E861;
	Thu, 26 Jun 2025 09:25:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=dolcini.it header.i=@dolcini.it header.b="HE9EmomO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB78B10E861
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 09:25:26 +0000 (UTC)
Received: from gaggiata.pivistrello.it (93-49-2-63.ip317.fastwebnet.it
 [93.49.2.63])
 by mail11.truemail.it (Postfix) with ESMTPA id 640301F967;
 Thu, 26 Jun 2025 11:25:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
 s=default; t=1750929925;
 bh=oQiL2nk762kw5hgZ/7yLoXi+yV+vsX0JHtdeUc0YXFY=;
 h=Received:From:To:Subject;
 b=HE9EmomOlz2739bN8MLQHMe8DK71hV/EWB3nf7vOcyRuATfWdfu9hsBvYqfS9lYtL
 2pip2Jrqz+es1fSzAjzqB4m3VfZmUDS3n/Dx6LCFuw+Kb9hlUlDU3B1leS1xEqJJjc
 9B7lfga9jODnJ6PLNanjpUR75gFAX/NLgnOM+2jHnNVJ5uKZGu+7k6FEBp6OwN0Gg1
 O1TTeHq33HMEIaenHxycMCz4Oa0gXRVX9O0sRA9qauH8j/CyCxLyD+UIbfIq2YMC7S
 sYzoN82zfMxVCqY2IWzTtBmP8dAUYeRzPgSemmVF9HmbypI9kS8151s3sfg9aWk7/E
 hC/qtLWxiwaJA==
Received: by gaggiata.pivistrello.it (Postfix, from userid 1000)
 id 08CEA7F9CF; Thu, 26 Jun 2025 11:25:25 +0200 (CEST)
Date: Thu, 26 Jun 2025 11:25:24 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Anusha Srivatsa <asrivats@redhat.com>,
 Francesco Dolcini <francesco@dolcini.it>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] drm/panel: panel-simple: Fix panel-dpi probe error
Message-ID: <aF0SBNGmTpgtBTC3@gaggiata.pivistrello.it>
References: <20250625-drm-panel-simple-fixes-v1-0-c428494a86b8@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625-drm-panel-simple-fixes-v1-0-c428494a86b8@kernel.org>
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

Hello Maxime,
thanks for the patch

On Wed, Jun 25, 2025 at 08:48:37AM +0200, Maxime Ripard wrote:
> Here's a series fixing (hopefully) the panel-simple regression for
> panels with a panel-dpi compatible.
> 
> It's only build tested, so if you could give that series a try
> Francesco, I'd really appreciate it.

It does not build for me, applied on top of commit ee88bddf7f2f ("Merge tag
'bpf-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf")

  SYNC    include/config/auto.conf.cmd
  CALL    scripts/checksyscalls.sh
  CC      drivers/gpu/drm/drm_of.o
  CC [M]  drivers/gpu/drm/panel/panel-simple.o
  AR      drivers/gpu/drm/built-in.a
  AR      drivers/gpu/built-in.a
  AR      drivers/built-in.a
  AR      built-in.a
  AR      vmlinux.a
  LD      vmlinux.o
  OBJCOPY modules.builtin.modinfo
  GEN     modules.builtin
  GEN     .vmlinux.objs
  MODPOST Module.symvers
ERROR: modpost: "mipi_dsi_bus_type" [drivers/gpu/drm/panel/panel-simple.ko] undefined!
make[2]: *** [scripts/Makefile.modpost:147: Module.symvers] Error 1
make[1]: *** [/home/francesco/Toradex/sources/linux/Makefile:1953: modpost] Error 2
make: *** [Makefile:248: __sub-make] Error 2
[Exit 2]


