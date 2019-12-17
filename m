Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFBB1223F9
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 06:43:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 274596E940;
	Tue, 17 Dec 2019 05:43:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DA026E93E;
 Tue, 17 Dec 2019 05:43:04 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 24D5C20023;
 Tue, 17 Dec 2019 06:42:57 +0100 (CET)
Date: Tue, 17 Dec 2019 06:42:55 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Dec 16 (drm_panel & intel_panel)
Message-ID: <20191217054255.GA26868@ravnborg.org>
References: <20191216162209.5b5256dd@canb.auug.org.au>
 <d92bec2a-62cb-004e-7f8c-01fc12a53a74@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d92bec2a-62cb-004e-7f8c-01fc12a53a74@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=4kOG7-xGWyIPk-DUqGkA:9 a=CjuIK1q_8ugA:10
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Randy.

On Mon, Dec 16, 2019 at 08:25:11AM -0800, Randy Dunlap wrote:
> On 12/15/19 9:22 PM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20191213:
> > 
> 
> on x86_64:
> 
> ld: drivers/gpu/drm/drm_panel.o: in function `drm_panel_of_backlight':
> (.text+0x2ee): undefined reference to `devm_of_find_backlight'
> 
> ld: drivers/gpu/drm/i915/display/intel_panel.o: in function `intel_backlight_device_register':
> intel_panel.c:(.text+0x593e): undefined reference to `backlight_device_register'
> ld: drivers/gpu/drm/i915/display/intel_panel.o: in function `intel_backlight_device_unregister':
> intel_panel.c:(.text+0x5a04): undefined reference to `backlight_device_unregister'
> 
> CONFIG_DRM_PANEL=y
> CONFIG_BACKLIGHT_CLASS_DEVICE=m
> CONFIG_DRM_I915=y
> 
> Full randconfig file is attached.

Can you please verify if you have:
907aa265fde6589b8059dc51649c6d1f49ade2f3
("drm/drm_panel: fix EXPORT of drm_panel_of_backlight")

This commit is supposed to fix it.

	Sam

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
