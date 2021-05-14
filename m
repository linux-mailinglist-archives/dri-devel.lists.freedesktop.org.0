Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9260A381919
	for <lists+dri-devel@lfdr.de>; Sat, 15 May 2021 15:35:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4EC96E3AC;
	Sat, 15 May 2021 13:35:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1492 seconds by postgrey-1.36 at gabe;
 Fri, 14 May 2021 14:10:14 UTC
Received: from mail.meine-oma.de (mail.meine-oma.de [88.99.114.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B2286EE8F;
 Fri, 14 May 2021 14:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=meine-oma.de; s=x; h=Content-Transfer-Encoding:Content-Type:Message-ID:
 References:In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XGx/7rOKdm+joqcF3hvgoi0MjdueZKKpV0droN3qfrc=; b=bY8q2dllZqbldesadPpgsKWIfH
 xbtGRBjP6CzAQue5ebzXfhX2rpJ5KoKQrFyTKdRkq3/Yubcrdll1hDgcg7IaPAJxc4KyS0ZvtV8VS
 AyY3CnDdR/w2fQjksT6lyLDdqjd8nQ8y6znLuHNhbw+/vZhfcUOokGnPHjTe1slgQLno=;
Received: from localhost ([127.0.0.1] helo=mail.meine-oma.de)
 by mail.meine-oma.de with esmtp (Exim 4.94.2)
 (envelope-from <himbeere@meine-oma.de>)
 id 1lhY7X-0003ky-5M; Fri, 14 May 2021 15:44:51 +0200
MIME-Version: 1.0
Date: Fri, 14 May 2021 15:44:51 +0200
From: Thomas Stein <himbeere@meine-oma.de>
To: Oleksandr Natalenko <oleksandr@natalenko.name>
Subject: Re: thinkpad x1 carbon display flickering after update to 5.12. good
 on 5.11.x (i915)
In-Reply-To: <20210514123431.fqvaa437zlw7rq7j@spock.localdomain>
References: <1a6cf0a3dc8a2c6364265ad7249b76b1@meine-oma.de>
 <20210514123431.fqvaa437zlw7rq7j@spock.localdomain>
Message-ID: <e41eba8500f731c979340fd810da203f@meine-oma.de>
X-Sender: himbeere@meine-oma.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sat, 15 May 2021 13:35:18 +0000
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


Yes, it does indeed! No flicker anymore. Thanks and cheers!

On 2021-05-14 14:34, Oleksandr Natalenko wrote:
> Hello.
> 
> On Fri, May 14, 2021 at 10:24:26AM +0200, Thomas Stein wrote:
>> After upgrading to linux 5.12 the display on my X1 Carbon Gen 2 starts 
>> to
>> flicker. Well actually it seems to turn off and on again and again. 
>> Here a
>> link to a video a person posted who has the same issue as me 
>> obviousely. 
>> https://linuxove.com/thinkpad-x1-carbon-gen-3-display-flickering-on-linux-kernel-5-12/
>> 
>> This happens without having Xorg running too. So it can't be related 
>> to
>> Xorg. The kernel boots and after a few seconds, the kernel messages 
>> scoll
>> through, the flickering starts. Nothing special in dmesg.
>> 
>> dmesg:
>> 
>> himbeere@rather ~ $ dmesg | grep i915
>> [    0.713595] i915 0000:00:02.0: vgaarb: deactivate vga console
>> [    0.720280] i915 0000:00:02.0: vgaarb: changed VGA decodes:
>> olddecodes=io+mem,decodes=io+mem:owns=io+mem
>> [    0.741494] i915 0000:00:02.0: [drm] Panel advertises DPCD 
>> backlight
>> support, but VBT disagrees. If your backlight controls don't work try
>> booting with i915.enable_dpcd_backlight=1. If your machine needs this,
>> please file a _new_ bug report on drm/i915, see
>> https://gitlab.freedesktop.org/drm/intel/-/wikis/How-to-file-i915-bugs 
>> for
>> details.
>> [    1.864837] [drm] Initialized i915 1.6.0 20201103 for 0000:00:02.0 
>> on
>> minor 0
>> [    1.875907] fbcon: i915drmfb (fb0) is primary device
>> [    3.158255] i915 0000:00:02.0: [drm] fb0: i915drmfb frame buffer 
>> device
>> himbeere@rather ~ $
>> 
>> Downgrading to 5.11 solves the issue for me. Any ideas?
> 
> Does [1] fix your issue?
> 
> [1] 
> https://cgit.freedesktop.org/drm-tip/patch/?id=acca7762eb71bc05a8f28d29320d193150051f79
