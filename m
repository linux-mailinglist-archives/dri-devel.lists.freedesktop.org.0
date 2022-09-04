Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EADF15AC249
	for <lists+dri-devel@lfdr.de>; Sun,  4 Sep 2022 06:21:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BB8B10E6B5;
	Sun,  4 Sep 2022 04:20:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 455 seconds by postgrey-1.36 at gabe;
 Sun, 04 Sep 2022 04:20:46 UTC
Received: from mail.gtsys.com.hk
 (tunnel316222-pt.tunnel.tserv25.sin1.ipv6.he.net [IPv6:2001:470:35:5f1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED40010E6B5
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Sep 2022 04:20:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.gtsys.com.hk (Postfix) with ESMTP id 1426F229A2E6
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Sep 2022 12:13:10 +0800 (HKT)
X-Virus-Scanned: Debian amavisd-new at gtsys.com.hk
Received: from mail.gtsys.com.hk ([127.0.0.1])
 by localhost (mail.gtsys.com.hk [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uXsjHVnnxVjy for <dri-devel@lists.freedesktop.org>;
 Sun,  4 Sep 2022 12:13:09 +0800 (HKT)
Received: from s01.gtsys.com.hk (unknown [10.128.4.2])
 by mail.gtsys.com.hk (Postfix) with ESMTP id DC1B0229A2E4
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Sep 2022 12:13:09 +0800 (HKT)
Received: from [10.128.1.32] (unknown [182.239.117.154])
 by s01.gtsys.com.hk (Postfix) with ESMTPSA id A9BC1C019F2
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Sep 2022 12:13:09 +0800 (HKT)
Content-Type: multipart/alternative;
 boundary="------------AkzzFM5pu9INZbCT9o9b8VGe"
Message-ID: <254478a0-4077-00fb-7923-2d8d45f1c59a@gtsys.com.hk>
Date: Sun, 4 Sep 2022 12:13:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
From: Chris Ruehl <chris.ruehl@gtsys.com.hk>
Subject: mesa-22.3.0-devel + linux-5.19.6 + mediapipe: panfrost js fault
To: dri-devel@lists.freedesktop.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------AkzzFM5pu9INZbCT9o9b8VGe
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Something you might have a head up for it,

have a mediapipe application for POSE which use the T860 GPU for the calculation
but the kernel driver report error (js fault) - I see one or 2 calculation 
frames on the mat-picture output only before
the pipe stop working.

Linux bullseye64 5.19.6 #1 SMP PREEMPT Fri Sep 2 02:25:59 UTC 2022 aarch64 GNU/Linux

[    5.164415] panfrost ff9a0000.gpu: clock rate = 500000000
[    5.169845] panfrost ff9a0000.gpu: [drm:panfrost_devfreq_init [panfrost]] 
Failed to register cooling device
[    5.169989] panfrost ff9a0000.gpu: mali-t860 id 0x860 major 0x2 minor 0x0 
status 0x0
[    5.169999] panfrost ff9a0000.gpu: features: 00000000,00000407, issues: 
00000000,24040400
[    5.170008] panfrost ff9a0000.gpu: Features: L2:0x07120206 Shader:0x00000000 
Tiler:0x00000809 Mem:0x1 MMU:0x00002830 AS:0xff JS:0x7
[    5.170017] panfrost ff9a0000.gpu: shader_present=0xf l2_present=0x1
[    5.206827] [drm] Initialized panfrost 1.2.0 20180908 for ff9a0000.gpu on minor 1
...
[  162.862064] panfrost ff9a0000.gpu: js fault, js=1, status=DATA_INVALID_FAULT, 
head=0xaba7100, tail=0xaba7100
[  162.862269] panfrost ff9a0000.gpu: js fault, js=1, status=DATA_INVALID_FAULT, 
head=0xa1e0100, tail=0xa1e0100

Have a RK3399 customized board and compiled the mesa drivers for it

meson $1 . build/ \
-D dri-drivers= \
-D vulkan-drivers= \
-D gallium-drivers=panfrost,kmsro \
-D llvm=disabled \
-D libunwind=false \
-D platforms=x11,wayland

glmark2 runs flawless scores 588.

Same code run on a x86_64 with an AMD GPU working fine.

Anything help fix the bug is welcome.

Thanks
Chris
--------------AkzzFM5pu9INZbCT9o9b8VGe
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#f1f4f7">
    Hi,<br>
    <br>
    Something you might have a head up for it,<br>
    <br>
    have a mediapipe application for POSE which use the T860 GPU for the
    calculation<br>
    but the kernel driver report error (js fault) - I see one or 2
    calculation frames on the mat-picture output only before<br>
    the pipe stop working.<br>
    <br>
    Linux bullseye64 5.19.6 #1 SMP PREEMPT Fri Sep 2 02:25:59 UTC 2022
    aarch64 GNU/Linux<br>
    <br>
    [    5.164415] panfrost ff9a0000.gpu: clock rate = 500000000<br>
    [    5.169845] panfrost ff9a0000.gpu: [drm:panfrost_devfreq_init
    [panfrost]] Failed to register cooling device<br>
    [    5.169989] panfrost ff9a0000.gpu: mali-t860 id 0x860 major 0x2
    minor 0x0 status 0x0<br>
    [    5.169999] panfrost ff9a0000.gpu: features: 00000000,00000407,
    issues: 00000000,24040400<br>
    [    5.170008] panfrost ff9a0000.gpu: Features: L2:0x07120206
    Shader:0x00000000 Tiler:0x00000809 Mem:0x1 MMU:0x00002830 AS:0xff
    JS:0x7<br>
    [    5.170017] panfrost ff9a0000.gpu: shader_present=0xf
    l2_present=0x1<br>
    [    5.206827] [drm] Initialized panfrost 1.2.0 20180908 for
    ff9a0000.gpu on minor 1<br>
    ...<br>
    [  162.862064] panfrost ff9a0000.gpu: js fault, js=1,
    status=DATA_INVALID_FAULT, head=0xaba7100, tail=0xaba7100<br>
    [  162.862269] panfrost ff9a0000.gpu: js fault, js=1,
    status=DATA_INVALID_FAULT, head=0xa1e0100, tail=0xa1e0100<br>
    <br>
    Have a RK3399 customized board and compiled the mesa drivers for it<br>
    <br>
    meson $1 . build/ \<br>
    -D dri-drivers= \<br>
    -D vulkan-drivers= \<br>
    -D gallium-drivers=panfrost,kmsro \<br>
    -D llvm=disabled \<br>
    -D libunwind=false \<br>
    -D platforms=x11,wayland<br>
    <br>
    glmark2 runs flawless scores 588.<br>
    <br>
    Same code run on a x86_64 with an AMD GPU working fine. <br>
    <br>
    Anything help fix the bug is welcome.<br>
    <br>
    Thanks<br>
    Chris<br>
  </body>
</html>

--------------AkzzFM5pu9INZbCT9o9b8VGe--
