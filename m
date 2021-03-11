Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4130C337337
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 13:59:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E88B76EC4B;
	Thu, 11 Mar 2021 12:59:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com
 [IPv6:2607:f8b0:4864:20::92b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 908B56EBA8
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 11:08:17 +0000 (UTC)
Received: by mail-ua1-x92b.google.com with SMTP id v23so471636uaq.13
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 03:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=blade-group.com; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=IKN2YE9rf2k51s5seKgxzve/YuUxA86odNxm9jauz4o=;
 b=OSaMtdm2C8T7dfoIIhftTSny/1z4a6SS+azC+92Ago9/4s7moK5d2SpDHs8/ZfAgFp
 gc71MehMM9qLcePTm+2gm/vY6XvHY+xAR+zCoitPU8gPZaWLljGkfbUZjCmehY3SnF6L
 SYKvqwvGgMFgc75sRWC9Jupf85n88/PoyOeugk99rqBE+EKYY2S3Ed/wt4L8CqX0NADd
 YbFoo6HFU7/v3uw0/U8E8BSXSdc8ZK6wUIFSvOWjsdIZekSwzmnqZ70L4n2k81BbrYV4
 4AxxowURtlYBx3uRrbZVwM8+ggEfk541mkvvUTPmyTJPSsMqQoevGwdv7p1m709oc+Bf
 i5xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=IKN2YE9rf2k51s5seKgxzve/YuUxA86odNxm9jauz4o=;
 b=TyqeUNBVq6L6uIEoq71/PJlMxc++CntrWdlGYygu19dg0JiTiWCAALafh3KD93sRfD
 aElIReI9YFTCoDqfOorruKE1RjAjy+OF5AjGFO6BLbyL4Qf7B08icN3HH9Sap0ooiJ23
 srLW9pYePYl2Vf9vqPlbfQ3r8/ELQAtluQkBBKZUj3S5CSiIRi+H/YUmIE3SrTI8+eUl
 zFLw/ttoeGlAYHusjcLOQJUeqgwLqfaEUw9LhxMaZsjJJaJmBO50xLLJGNb3/AYbVsmf
 UZ2oQsTNxhhSb4baKzg35ba9yZ51PW2wVrUI5IW7NSJTo5tdb915RLVfMzidSSnVeyfh
 q7/w==
X-Gm-Message-State: AOAM530k5N14dFBMC7lUhddx87RuSU/JyiEiDL6EqhVaRrz7e5Tl5NaH
 M+k1BGSXrjV9yMEqY3zhBgy32Vg6KeGp0MgQNh2G4Q==
X-Google-Smtp-Source: ABdhPJza3NwWWBKdVuDscfKQKIpCqkz+hgJK3OEFQlYMoPkm1UW7ua79lJ2eXQ1sZKNXrly6dh84h5E5HTVuUCnUhTc=
X-Received: by 2002:a9f:25e6:: with SMTP id 93mr4315163uaf.57.1615460896643;
 Thu, 11 Mar 2021 03:08:16 -0800 (PST)
MIME-Version: 1.0
From: Yann Dirson <yann.dirson@blade-group.com>
Date: Thu, 11 Mar 2021 12:08:05 +0100
Message-ID: <CA+4=imaTJ4deZjdoODhAMm3REeP99nt8BPf3buymbPum8mW5ag@mail.gmail.com>
Subject: Re: [v3] drm: rockchip: hdmi: enable higher resolutions than FHD
To: Vicente Bergas <vicencb@gmail.com>, Doug Anderson <dianders@chromium.org>
X-Mailman-Approved-At: Thu, 11 Mar 2021 12:59:37 +0000
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
Cc: crj <algea.cao@rock-chips.com>, David Airlie <airlied@linux.ie>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>,
 Caesar Wang <wxt@rock-chips.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Vicente wrote:
> This patch series enable a QHD HDMI monitor to work at native resolution.
> Tested on a Sapphire board with RK3399 connected to a Q27q-10 monitor at 2560x1440@60

Which kernel did you test this patch series on ?

I am trying to get this to work on our rk3999 hardware, with a Dell
s2719dgf with 2560x1440@60 and 2560x1440@144, both of which do work
with Rockchip's 4.4 branch.

If I'm applying this patch to 5.10.18, everything breaks:
- the newly-shown 2560x1440 mode is selected by default, but dclk_vop0
is set to 200000 not 241500, and screen stays black
- if I switch to 1920x1080 with xrandr I get no video output either
- if then I request to switch back to 2560x1440, I can see dclk_vop0
getting set back to 200000, and after a couple of seconds get
something like the following, freezing the board:

[   97.504469] rk3x-i2c ff3c0000.i2c: timeout, ipd: 0x10, state: 1
[   98.528471] rk3x-i2c ff3c0000.i2c: timeout, ipd: 0x10, state: 1
[   99.552469] rk3x-i2c ff3c0000.i2c: timeout, ipd: 0x10, state: 1
[  100.576469] rk3x-i2c ff3c0000.i2c: timeout, ipd: 0x10, state: 1
[  101.600468] rk3x-i2c ff3c0000.i2c: timeout, ipd: 0x10, state: 1
[  101.601011] cpu cpu4: _set_opp_voltage: failed to set voltage
(1200000 1200000 1200000 mV): -110
[  101.601793] cpufreq: __target_index: Failed to change cpu frequency: -110
[  117.496429] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
[  117.496975] rcu:     0-...0: (10 ticks this GP)
idle=bf6/1/0x4000000000000002 softirq=716/718 fqs=415
[  117.497765] rcu:     5-...0: (6 ticks this GP)
idle=916/1/0x4000000000000000 softirq=613/614 fqs=415
[  117.498547]  (detected by 2, t=5252 jiffies, g=677, q=6)

It also tends to cause timeouts right on boot afterwards if I don't
leave the board unplugged for a few seconds.


If I apply the same patch to 5.4.88, the clock rate when switching to
1080p gets a value you may have seen yourself given your previous
patches, and the screen does not get the signal (and I don't even need
to switch back to 1440p to hang the platform):

root@shadow-ghost:~# cat /sys/kernel/debug/clk/dclk_vop0/clk_rate
148500999
root@shadow-ghost:~# [   60.986455] rcu: INFO: rcu_preempt detected
stalls on CPUs/tasks:
[   60.987001] rcu:     0-...0: (4 ticks this GP)
idle=2ce/1/0x4000000000000002 softirq=513/513 fqs=2625
[   60.987791] rcu:     2-...0: (4 ticks this GP)
idle=862/1/0x4000000000000000 softirq=519/520 fqs=2625
[   60.988579]  (detected by 1, t=5252 jiffies, g=529, q=1)
[   60.989043] Task dump for CPU 0:
[   60.989327] irq/40-ff940000 R  running task        0   161      2 0x0000002a
[   60.989945] Call trace:
[   60.990172]  __switch_to+0xd8/0x120
[   60.990482]  __wake_up_common_lock+0x78/0xc0
[   60.990857]  __wake_up+0x14/0x20
[   60.991143]  netlink_broadcast_filtered+0x2f4/0x3dc
[   60.991570]  netlink_broadcast+0x14/0x20
[   60.991914]  0xffff80001180bae0
[   60.992190] Task dump for CPU 2:
[   60.992472] udevd           R  running task        0   170      1 0x00000002
[   60.993088] Call trace:
[   60.993306]  __switch_to+0xd8/0x120
[   60.993612]  0xffff000079a60c80
[   60.993889]  0xaaaafc79fcf8
[   60.994135]  0x65


OTOH, if I apply the same patch to 4.19.177, I have no trouble
switching to 1080p, and when I ask to switch back to 1440p the screen
does get a signal, although it reports 1903x1440 50Hz, probably due to
the clock rate getting capped to 200000.

Any idea where those hangs with kernels 5.x would come from ?  That
could help cutting down bisect time on this :)


Other experiments show that dclk_vop0 on 4.4rk gets its 241500 rate
from vpll (via dclk_vop0_div), but on mainline vpll apparently refuses
to provide this (proposing just 148500 instead) so it is cpll of gpll
which gets to provide a 200000 kHz clock.

What could be the reason for this ?

Best regards,
-- 
Yann Dirson <yann@blade-group.com>
Blade / Shadow -- http://shadow.tech
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
