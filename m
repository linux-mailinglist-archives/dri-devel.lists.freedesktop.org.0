Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C566ACECE
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 21:04:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 303F710E452;
	Mon,  6 Mar 2023 20:03:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 570 seconds by postgrey-1.36 at gabe;
 Mon, 06 Mar 2023 16:44:30 UTC
Received: from mail.rmail.be (mail.rmail.be [85.234.218.189])
 by gabe.freedesktop.org (Postfix) with ESMTP id 677C210E2C5
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 16:44:30 +0000 (UTC)
Received: from mail.rmail.be (domotica.rmail.be [10.238.9.4])
 by mail.rmail.be (Postfix) with ESMTP id 5302B34561;
 Mon,  6 Mar 2023 17:34:58 +0100 (CET)
MIME-Version: 1.0
Date: Mon, 06 Mar 2023 17:34:58 +0100
From: AL13N <alien@rmail.be>
To: Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>,
 dri-devel@lists.freedesktop.org
Subject: [regression] RPI4B drm vc4: no crtc or sizes since 5.17 (works in
 5.16; and still broken in at least 6.1)
Message-ID: <7d216faea9647d328651460167bc27f6@rmail.be>
X-Sender: alien@rmail.be
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 06 Mar 2023 20:03:52 +0000
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

Hi,

I have a RPI4B connected on 2nd HDMI port (furthest away from power) to 
a 4K TV, which works until 5.16, from 5.17 there is no X (or plymouth), 
the cause of no X is that EDID gives nothing, and in the journal; there 
is "Cannot find any crct or sizes". Only the kernel is changed for this.

In 5.16 instead of this message there is a bunch of hex lines prefixed 
with BAD.

It is still broken in 6.1 at the very least.

I donno if this is related to this part, but I wanted to try a newer 
kernel, because the RPI4 seems to do all the video decoding in software 
and cannot seem to handle it.


logs:
vc4-drm gpu: bound fef05700.hdmi (ops vc4_hdmi_ops [vc4])
vc4-drm gpu: bound fe004000.txp (ops vc4_txp_ops [vc4])
vc4-drm gpu: bound fe206000.pixelvalve (ops vc4_crtc_ops [vc4])
vc4-drm gpu: bound fe207000.pixelvalve (ops vc4_crtc_ops [vc4])
vc4-drm gpu: bound fe20a000.pixelvalve (ops vc4_crtc_ops [vc4])
vc4-drm gpu: bound fe216000.pixelvalve (ops vc4_crtc_ops [vc4])
vc4-drm gpu: bound fec12000.pixelvalve (ops vc4_crtc_ops [vc4])
checking generic (3ea81000 12c000) vs hw (0 ffffffffffffffff)
fb0: switching to vc4 from simple
Console: switching to colour dummy device 80x25
[drm] Initialized vc4 0.0.0 20140616 for gpu on minor 0
vc4-drm gpu: [drm] Cannot find any crtc or sizes
