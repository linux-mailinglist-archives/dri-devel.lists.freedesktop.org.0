Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B0D894DD5
	for <lists+dri-devel@lfdr.de>; Tue,  2 Apr 2024 10:46:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEE6A10FB67;
	Tue,  2 Apr 2024 08:46:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.b="QY7wOFYA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FA6510FB66;
 Tue,  2 Apr 2024 08:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 In-Reply-To:References; bh=UOKR97xWJsCzeiNSwUpoZzyukhRCG3SAXSValTgdpjo=;
 t=1712047577; x=1712479577; b=QY7wOFYAEl2GbwxwqcV/x+Qs+5aMVDCyol9VzQ4Rwy6jwKk
 D4Nd5rhawfwDSSPOWDNEsgdzXz3dGpSx/Heo9SGrXWl4cR5GScuz61OpHbi97rbO9uBNjHM95DlEt
 hBQr1FvxTT92S5BBn9DhZZyz4GFM3srK+rtmmzVH+4AOrp4I1bNPYzz2CQRNMuwjdMJYLWZVhuJP8
 OGfHSrlGVZWQKVxx8hAYLUvbTRfBNTX3/3ZmLXRuV92ua6rE7rhhcJL1rAN5qU2WGc5lw0tZbnJGr
 OfVVnEiYXxVDwV/FYgWK2LRH4sHY6NGW8940fz3VFnKjpb7g+l1I9fwK4UfLWdYg==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1rrZmW-0000jW-Qi; Tue, 02 Apr 2024 10:46:12 +0200
Message-ID: <ecc8bd98-0dac-4f17-abb3-ebc8b10fd0f7@leemhuis.info>
Date: Tue, 2 Apr 2024 10:46:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] external monitor+Dell dock in 6.8
To: Imre Deak <imre.deak@intel.com>
Cc: regressions@lists.linux.dev, Andrei Gaponenko <beamflash@quaintcat.com>,
 LKML <linux-kernel@vger.kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
References: <22aa3878-62c7-9a2c-cfcc-303f373871f6@quaintcat.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Content-Language: en-US, de-DE
In-Reply-To: <22aa3878-62c7-9a2c-cfcc-303f373871f6@quaintcat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1712047577;
 d6aa77ea; 
X-HE-SMSGID: 1rrZmW-0000jW-Qi
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
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Adding a few folks and list while dropping the stable list, as this is
unrelated to it]

On 31.03.24 07:59, Andrei Gaponenko wrote:
> 
> I noticed a regression with the mailine kernel pre-compiled by EPEL.
> I have just tried linux-6.9-rc1.tar.gz from kernel.org, and it still
> misbehaves.
> 
> The default setup: a laptop is connected to a dock, Dell WD22TB4, via
> a USB-C cable.  The dock is connected to an external monitor via a
> Display Port cable.  With a "good" kernel everything works.  With a
> "broken" kernel, the external monitor is still correctly identified by
> the system, and is shown as enabled in plasma systemsettings. The
> system also behaves like the monitor is working, for example, one can
> move the mouse pointer off the laptop screen.  However the external
> monitor screen stays black, and it eventually goes to sleep.

Just a quick heads up to ensure people are aware of it:

Imre Deak, turns out this is caused by a patch of yours: 55eaef16417448
("drm/i915/dp_mst: Handle the Synaptics HBlank expansion quirk"). Andrei
Gaponenko meanwhile filed a ticket about it here:

https://gitlab.freedesktop.org/drm/intel/-/issues/10637

Ciao, Thorsten

> Everything worked with EPEL mainline kernels up to and including
> kernel-ml-6.7.9-1.el9.elrepo.x86_64
> 
> The breakage is observed in
> 
> kernel-ml-6.8.1-1.el9.elrepo.x86_64
> kernel-ml-6.8.2-1.el9.elrepo.x86_64
> linux-6.9-rc1.tar.gz from kernel.org (with olddefconfig)
> 
> Other tests: using an HDMI cable instead of the Display Port cable
> between the monitor and the dock does not change things, black screen
> with the newer kernels.
> 
> Using a small HDMI-to-USB-C adapter instead of the dock results in a
> working system, even with the newer kernels.  So the breakage appears
> to be specific to the Dell WD22TB4 dock.
> 
> Operating System: AlmaLinux 9.3 (Shamrock Pampas Cat)
> 
> uname -mi: x86_64 x86_64
> 
> Laptop: Dell Precision 5470/02RK6V
> 
> lsusb |grep dock
> Bus 003 Device 007: ID 413c:b06e Dell Computer Corp. Dell dock
> Bus 003 Device 008: ID 413c:b06f Dell Computer Corp. Dell dock
> Bus 003 Device 006: ID 0bda:5413 Realtek Semiconductor Corp. Dell dock
> Bus 003 Device 005: ID 0bda:5487 Realtek Semiconductor Corp. Dell dock
> Bus 002 Device 004: ID 0bda:0413 Realtek Semiconductor Corp. Dell dock
> Bus 002 Device 003: ID 0bda:0487 Realtek Semiconductor Corp. Dell dock
> 
> dmesg and kernel config are attached to 
> https://bugzilla.kernel.org/show_bug.cgi?id=218663
> 
> #regzbot introduced: v6.7.9..v6.8.1

P.S.:

#regzbot duplicate: https://bugzilla.kernel.org/show_bug.cgi?id=218663
#regzbot duplicate: https://gitlab.freedesktop.org/drm/intel/-/issues/10637
#regzbot title: drm/i915/dp_mst: external monitor on Dell dock broke
