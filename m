Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A80492DF124
	for <lists+dri-devel@lfdr.de>; Sat, 19 Dec 2020 19:58:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01ED4898E8;
	Sat, 19 Dec 2020 18:58:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 442 seconds by postgrey-1.36 at gabe;
 Sat, 19 Dec 2020 18:58:17 UTC
Received: from mx2.cyber.ee (mx2.cyber.ee [193.40.6.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42954898E8
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Dec 2020 18:58:17 +0000 (UTC)
From: Meelis Roos <mroos@linux.ee>
Subject: udl: Unrecognized vendor firmware descriptor (all zeroes)
To: dri-devel@lists.freedesktop.org
Message-ID: <c299a6dd-97b6-c095-0e0a-c76681fd8dae@linux.ee>
Date: Sat, 19 Dec 2020 20:49:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
Content-Language: en-US
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I got a Lenovo USB port replicator (model no: K33415) with DisplayLink VGA. When I plug it into
my Lenovo laptop (with no display attached to the dock yet), USB hub and audio devices from the
dock are found but the DisplayLink device initialization gets an error. All bytes in vendor firmware
descriptor and EDID seem to be zero.

Is it something wrong with the device, Linux USB stack or UDL driver?

[379953.534772] usb 1-3.4: new high-speed USB device number 23 using xhci_hcd
[379953.630502] usb 1-3.4: New USB device found, idVendor=17e9, idProduct=01e0, bcdDevice= 0.03
[379953.635493] usb 1-3.4: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[379953.640411] usb 1-3.4: Product: Lenovo Enhanced USB Port Replicator
[379953.645573] usb 1-3.4: Manufacturer: DisplayLink
[379953.650430] usb 1-3.4: SerialNumber: 01>0-128530
[379953.662128] [drm] vendor descriptor length:e0 data:00 00 00 00 00 00 00 00 00 00 00
[379953.667129] [drm:udl_init.cold [udl]] *ERROR* Unrecognized vendor firmware descriptor
[379953.673031] [drm] Initialized udl 0.0.1 20120220 for 1-3.4:1.0 on minor 1
[379953.677693] [drm] Initialized udl on minor 1
[379953.733025] udl 1-3.4:1.0: [drm] DVI-I-1: EDID is invalid:
[379953.735019]         [00] ZERO 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[379953.737014]         [00] ZERO 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[379953.739061]         [00] ZERO 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[379953.741086]         [00] ZERO 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[379953.743170]         [00] ZERO 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[379953.745163]         [00] ZERO 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[379953.747176]         [00] ZERO 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[379953.749093]         [00] ZERO 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[379953.751015] udl 1-3.4:1.0: [drm] Cannot find any crtc or sizes
[379953.753565] [drm] vendor descriptor length:e0 data:00 00 00 00 00 00 00 00 00 00 00
[379953.755501] [drm:udl_init.cold [udl]] *ERROR* Unrecognized vendor firmware descriptor
[379953.758261] [drm] Initialized udl 0.0.1 20120220 for 1-3.4:1.1 on minor 3
[379953.760405] [drm] Initialized udl on minor 3
[379953.827661] udl 1-3.4:1.1: [drm] DVI-I-3: EDID is invalid:
[379953.832758]         [00] ZERO 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[379953.838083]         [00] ZERO 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[379953.843553]         [00] ZERO 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[379953.848803]         [00] ZERO 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[379953.853151]         [00] ZERO 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[379953.856164]         [00] ZERO 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[379953.858381]         [00] ZERO 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[379953.860334]         [00] ZERO 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[379953.862199] udl 1-3.4:1.1: [drm] Cannot find any crtc or sizes
[379964.084865] udl 1-3.4:1.0: [drm] Cannot find any crtc or sizes
[379964.089921] udl 1-3.4:1.1: [drm] Cannot find any crtc or sizes

-- 
Meelis Roos <mroos@linux.ee>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
