Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AAB72DF139
	for <lists+dri-devel@lfdr.de>; Sat, 19 Dec 2020 20:13:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 807CF89B66;
	Sat, 19 Dec 2020 19:13:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 399 seconds by postgrey-1.36 at gabe;
 Sat, 19 Dec 2020 19:13:14 UTC
Received: from foo.stuge.se (foo.stuge.se [212.116.89.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A725789B66
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Dec 2020 19:13:14 +0000 (UTC)
Received: (qmail 22660 invoked by uid 1000); 19 Dec 2020 19:06:31 -0000
Message-ID: <20201219190631.22659.qmail@stuge.se>
Date: Sat, 19 Dec 2020 19:06:31 +0000
From: Peter Stuge <peter@stuge.se>
To: Meelis Roos <mroos@linux.ee>
Subject: Re: udl: Unrecognized vendor firmware descriptor (all zeroes)
References: <c299a6dd-97b6-c095-0e0a-c76681fd8dae@linux.ee>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c299a6dd-97b6-c095-0e0a-c76681fd8dae@linux.ee>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Meelis Roos wrote:
> Is it something wrong with the device, Linux USB stack or UDL driver?

It looks like the device.


> [379953.534772] usb 1-3.4: new high-speed USB device number 23 using xhci_hcd
> [379953.630502] usb 1-3.4: New USB device found, idVendor=17e9, idProduct=01e0, bcdDevice= 0.03
> [379953.635493] usb 1-3.4: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> [379953.640411] usb 1-3.4: Product: Lenovo Enhanced USB Port Replicator
> [379953.645573] usb 1-3.4: Manufacturer: DisplayLink
> [379953.650430] usb 1-3.4: SerialNumber: 01>0-128530
> [379953.662128] [drm] vendor descriptor length:e0 data:00 00 00 00 00 00 00 00 00 00 00

Do the descriptors perhaps change, if you run lsusb -v for the device
a second or two after plugging it in? (Of course they shouldn't, but ..)

Also, the device connects as a high-speed (480Mbps) device through xhci
(so perhaps on a super-speed port?). Can you try connecting the device to
a high-speed-only port and see if it behaves the same?

It might be enough to place a high-speed hub between computer and device
for that test.


Or if you already tested with a high-speed-only port on your xHCI but the
device is actually super-speed-capable then can you try connecting it to a
super-speed port?


//Peter
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
