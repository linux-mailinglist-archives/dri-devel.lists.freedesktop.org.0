Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D8E3809D0
	for <lists+dri-devel@lfdr.de>; Fri, 14 May 2021 14:44:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95DF86E1DE;
	Fri, 14 May 2021 12:44:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 573 seconds by postgrey-1.36 at gabe;
 Fri, 14 May 2021 12:44:09 UTC
Received: from vulcan.natalenko.name (vulcan.natalenko.name [104.207.131.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CE376E1DE;
 Fri, 14 May 2021 12:44:09 +0000 (UTC)
Received: from localhost (unknown [151.237.229.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by vulcan.natalenko.name (Postfix) with ESMTPSA id 388E6A7F2E9;
 Fri, 14 May 2021 14:34:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=natalenko.name;
 s=dkim-20170712; t=1620995672;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4vwJiGTh6ElCKYC/wP6uUt98bvM4B8L74svpei6Ju4s=;
 b=k4P0PRaU0pOt6NoAaXdArjthun1X5Z3xm0J1NP99QO/kCvs7gH1yjGmb+kD3/UPVsnEPt0
 i524R6BXymUAbd3WqekM3GGLRvv1td6RiAvViZTPemp6ph4IkukuqsnjhA+G5TSxVEcWmM
 uBtPbYE483kRT7/HYynefUDrEIeOnvE=
Date: Fri, 14 May 2021 14:34:31 +0200
From: Oleksandr Natalenko <oleksandr@natalenko.name>
To: Thomas Stein <himbeere@meine-oma.de>
Subject: Re: thinkpad x1 carbon display flickering after update to 5.12. good
 on 5.11.x (i915)
Message-ID: <20210514123431.fqvaa437zlw7rq7j@spock.localdomain>
References: <1a6cf0a3dc8a2c6364265ad7249b76b1@meine-oma.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1a6cf0a3dc8a2c6364265ad7249b76b1@meine-oma.de>
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
Cc: David Airlie <airlied@linux.ie>, Lucas De Marchi <lucas.demarchi@intel.com>,
 linux-kernel@vger.kernel.org, Manasi Navare <manasi.d.navare@intel.com>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>, Sean Paul <seanpaul@chromium.org>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello.

On Fri, May 14, 2021 at 10:24:26AM +0200, Thomas Stein wrote:
> After upgrading to linux 5.12 the display on my X1 Carbon Gen 2 starts to
> flicker. Well actually it seems to turn off and on again and again. Here a
> link to a video a person posted who has the same issue as me obviousely. https://linuxove.com/thinkpad-x1-carbon-gen-3-display-flickering-on-linux-kernel-5-12/
> 
> This happens without having Xorg running too. So it can't be related to
> Xorg. The kernel boots and after a few seconds, the kernel messages scoll
> through, the flickering starts. Nothing special in dmesg.
> 
> dmesg:
> 
> himbeere@rather ~ $ dmesg | grep i915
> [    0.713595] i915 0000:00:02.0: vgaarb: deactivate vga console
> [    0.720280] i915 0000:00:02.0: vgaarb: changed VGA decodes:
> olddecodes=io+mem,decodes=io+mem:owns=io+mem
> [    0.741494] i915 0000:00:02.0: [drm] Panel advertises DPCD backlight
> support, but VBT disagrees. If your backlight controls don't work try
> booting with i915.enable_dpcd_backlight=1. If your machine needs this,
> please file a _new_ bug report on drm/i915, see
> https://gitlab.freedesktop.org/drm/intel/-/wikis/How-to-file-i915-bugs for
> details.
> [    1.864837] [drm] Initialized i915 1.6.0 20201103 for 0000:00:02.0 on
> minor 0
> [    1.875907] fbcon: i915drmfb (fb0) is primary device
> [    3.158255] i915 0000:00:02.0: [drm] fb0: i915drmfb frame buffer device
> himbeere@rather ~ $
> 
> Downgrading to 5.11 solves the issue for me. Any ideas?

Does [1] fix your issue?

[1] https://cgit.freedesktop.org/drm-tip/patch/?id=acca7762eb71bc05a8f28d29320d193150051f79

-- 
  Oleksandr Natalenko (post-factum)
