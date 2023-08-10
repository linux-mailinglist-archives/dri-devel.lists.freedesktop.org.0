Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 113C6776F08
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 06:19:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A548A10E4AD;
	Thu, 10 Aug 2023 04:19:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BF9110E4AB;
 Thu, 10 Aug 2023 04:19:48 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1qTx9F-0004H5-4C; Thu, 10 Aug 2023 06:19:45 +0200
Message-ID: <94a31824-016a-7fe3-7477-e3ab500844c1@leemhuis.info>
Date: Thu, 10 Aug 2023 06:19:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Nouveau] Fwd: System (Xeon Nvidia) hangs at boot terminal after
 kernel 6.4.7
Content-Language: en-US, de-DE
To: Bagas Sanjaya <bagasdotme@gmail.com>, Ben Skeggs <bskeggs@redhat.com>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Peter Bottomley <peebee@gmx.com>, peter@peebee.org.uk
References: <4b0c06ba-b05c-071c-d494-67775bd7250f@gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <4b0c06ba-b05c-071c-d494-67775bd7250f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1691641188;
 15a91e0e; 
X-HE-SMSGID: 1qTx9F-0004H5-4C
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
Cc: Linux Nouveau <nouveau@lists.freedesktop.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Stable <stable@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10.08.23 05:03, Bagas Sanjaya wrote:
> 
> I notice a regression report on Bugzilla [1]. Quoting from it:
> 
>> Kernel 6.4.6 compiled from source worked AOK on my desktop with Intel Xeon cpu and Nvidia graphics - see below for system specs.
>>
>> Kernels 6.4.7 & 6.4.8 also compiled from source with identical configs hang with a frozen boot terminal screen after a significant way through the boot sequence (e.g. whilst running /etc/profile). The system may still be running as a sound is emitted when the power button is pressed (only way to escape from the system hang).
> [...]
>> Computer Profile:
>>  Machine                    Dell Inc. Precision WorkStation T5400   (version: Not Specified)
>>  Mainboard                  Dell Inc. 0RW203 (version: NA)
>>  • BIOS                     Dell Inc. A11 | Date: 04/30/2012 | Type: Legacy
>>  • CPU                      Intel(R) Xeon(R) CPU E5450 @ 3.00GHz (4 cores)
>>  • RAM                      Total: 7955 MB | Used: 1555 MB (19.5%) | Actual Used: 775 MB (9.7%)
>>  Graphics                   Resolution: 1366x768 pixels | Display Server: X.Org 21.1.8
>>  • device-0                 NVIDIA Corporation GT218 [NVS 300] [10de:10d8] (rev a2)
>>  Audio                      ALSA
>>  • device-0                 Intel Corporation 631xESB/632xESB High Definition Audio Controller [8086:269a] (rev 09)
>>  • device-1                 NVIDIA Corporation High Definition Audio Controller [10de:0be3] (rev a1)
>>  Network                    wlan1
>>  • device-0                 Ethernet: Broadcom Inc. and subsidiaries NetXtreme BCM5754 Gigabit Ethernet PCI Express [14e4:167a] (rev 02)
> 
> See Bugzilla for the full thread.
> [...]
> [1]: https://bugzilla.kernel.org/show_bug.cgi?id=217776

Not my area of expertise, but nevertheless pretty sure this is the same
issue already discussed here, as it's a GT218 there as well at 6.4.7 is
the version that commit was backported to:

https://lore.kernel.org/all/20230806213107.GFZNARG6moWpFuSJ9W@fat_crate.local/

No final solution ready yet, but looks like the culprit will be reverted.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.
