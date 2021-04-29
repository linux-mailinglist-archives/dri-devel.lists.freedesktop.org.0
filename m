Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C1836E49D
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 07:50:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFE556EC76;
	Thu, 29 Apr 2021 05:49:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8F686E1A4
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 04:47:11 +0000 (UTC)
Received: from mail-oo1-f71.google.com ([209.85.161.71])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <chris.chiu@canonical.com>) id 1lbyZy-0007So-5E
 for dri-devel@lists.freedesktop.org; Thu, 29 Apr 2021 04:47:10 +0000
Received: by mail-oo1-f71.google.com with SMTP id
 e18-20020a0568200612b02901ec8fefe582so14360226oow.22
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 21:47:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=rRim53UzJWgVMkdOW0b/+ZBSUNTOdVPMyNPZwfBxAPo=;
 b=d8JqgOn/i1oLc2AdWFeVszGYuGkl5gCStDkDCam1mhwNVn0JeWAsSIWxcY0bmQbAVJ
 xqDmaFSZ2+0bw3rhOpawMtylu2986S3on0bV7LXf9DisRn1GyhHjb1xvC/G+cKWR58y8
 szo0W6LpSROzlC0xpaw+gQRdUOSj5D9nD9BveHMASujV/dY85VsuNQZPfDDom/I/NuDJ
 pl99VfB5/ivSYp4JboUSzMBFIV0GVyxmcokGIznGaUSclA8cyOKg8vWtRwqpvNhnYtCJ
 e5y9oBqm/L6Jv2mWzJIobPeS4aKkPzzGfb7qFu1/fmbfEo3csYo4K/GLeZTt7zalHqQn
 I3zQ==
X-Gm-Message-State: AOAM532/dfYa9XjTUeKwkXsG8aFJ8iFXBepWAR3AZMbtuHRfyNDk2rJU
 zOkG6mzZUG8MmJN7rnrAN+Q+eSnSxBk1RGqoswlkiGYuy66i+l9g41G3yuj7e85M6eZbnGYzyNo
 EJookp8oTWphssk99OLYfUrP0ljB3tyoQOp1ack9xg+/ht/a3EHJxF2L1762FsQ==
X-Received: by 2002:aca:3d86:: with SMTP id k128mr5603677oia.86.1619671629097; 
 Wed, 28 Apr 2021 21:47:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyqdMpxb8MWKz1tOE3sKrkJg5plm8nWbqA9fYdsOBpP6o5Ws798cfd23tiJN70JL2O/48OnzYTMqiwUxSqj8FI=
X-Received: by 2002:aca:3d86:: with SMTP id k128mr5603660oia.86.1619671628872; 
 Wed, 28 Apr 2021 21:47:08 -0700 (PDT)
MIME-Version: 1.0
From: Chris Chiu <chris.chiu@canonical.com>
Date: Thu, 29 Apr 2021 12:46:58 +0800
Message-ID: <CABTNMG1TRbAW+ULs9Ss27owvxppf-dA=F7M0vGp1EtHwDcK51w@mail.gmail.com>
Subject: TGL: : No video output on external monitor after unplug and re-plug
 the cable
To: imre.deak@intel.com, jani.nikula@linux.intel.com, 
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com, 
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Linux Kernel <linux-kernel@vger.kernel.org>
X-Mailman-Approved-At: Thu, 29 Apr 2021 05:49:48 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We found another bug after the fix of
https://gitlab.freedesktop.org/drm/intel/-/issues/2538. The external
monitor is also connected via WD19's HDMI/DisplayPort just as #2538.
However, the display monitor can only be detected and show output at
the very first time we power on the WD19 dock. If we unplug the cable
and replug again, the monitor seems to be detected but there's no
video output.

When we power on the WD19 dock with cable connected to the monitor,
the drm kernel log shows as follows

 i915 0000:00:02.0: [drm:intel_get_hpd_pins.isra.0 [i915]] hotplug
event received, stat 0x00010000, dig 0x0088888a, pins 0x00000200, long
0x00000200
 i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digital hpd on
[ENCODER:292:DDI D] - long
 i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] Received HPD
interrupt on PIN 9 - cnt: 10
 i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] got hpd irq on
[ENCODER:292:DDI D] - long
 i915 0000:00:02.0: [drm:i915_hotplug_work_func [i915]] running
encoder hotplug functions
 i915 0000:00:02.0: [drm:i915_hotplug_work_func [i915]] Connector DP-1
(pin 9) received hotplug event. (retry 0)
 i915 0000:00:02.0: [drm:intel_dp_detect [i915]] [CONNECTOR:293:DP-1]
 i915 0000:00:02.0: [drm:intel_power_well_enable [i915]] enabling TC cold off
 i915 0000:00:02.0: [drm:tgl_tc_cold_request [i915]] TC cold block succeeded
 i915 0000:00:02.0: [drm:__intel_tc_port_lock [i915]] Port D/TC#1: TC
port mode reset (tbt-alt -> dp-alt)
 i915 0000:00:02.0: [drm:intel_power_well_enable [i915]] enabling AUX D TC1
 i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_kms_helper]] AUX D/port
D: 0xf0000 AUX -> (ret=  8) 14 1e 40 55 02 00 00 00
 i915 0000:00:02.0: [drm:intel_dp_lttpr_init [i915]] LTTPR common
capabilities: 14 1e 40 55 02 00 00 00

Then I replug the cable, the intel_power_well_enable() in
intel_dp_aux_xfer() shows "enabling DC off" power domain instead of
enabling AUX D TC1. After that, the flooded i915 0000:00:02.0:
[drm:intel_dp_aux_xfer [i915]] AUX D/port D: timeout (status
0x7d4003ff) keeps show up and no video output.

I filed a bug on
https://gitlab.freedesktop.org/drm/intel/-/issues/3407 and also
uploaded the journal log  with kernel boot parameter
"drm.debug=0x10e".

Can anyone suggest what happens at the replug? What can we do to
identify the cause? Thanks

Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
