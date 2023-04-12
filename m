Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29AC46DF006
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 11:06:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 527AE10E273;
	Wed, 12 Apr 2023 09:06:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 330 seconds by postgrey-1.36 at gabe;
 Wed, 12 Apr 2023 09:06:19 UTC
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EE5410E273
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 09:06:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1681290013; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=TNYyrT4vY6sYLf8S1YBY/TEMyP0QuqVzsqGTtzvBBABiNrPM0NDskD2DCEcNlWPPjm
 FDn8MDSTSNFhfq77p6oMHvrwRY7kUyYzLyao5hIxBAt9x1hgBIA77U9BvhqwTqlUgvSS
 naNkpPezjEmETLWScNGvVL1hlQ9LRh+Z1pZ8KcTLOS8s0Fm53WIsoKKPxZmsdCa8a/bD
 cmdAy65Kz5FpRtjV1gU+njbxoCAgNkBRabdjsW+iOc225tT2E90YX9nvmwuAqPv2iBcm
 CG5N51j7AJYb77Ou0qi1VKzpIwedUPCM8KnNPRbV+M8av3EylVyTRDnzrzQY/2eMEdCk
 18Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1681290013;
 s=strato-dkim-0002; d=strato.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=/VjutI0ZUYEY9Ei7NXg8wL9n4Z6riGTDoSp4YbEhNkk=;
 b=f+A1ZnvjndNx1J1DHJVvNo1nws/pfvvnt4Chg6Laeb8WYBi72iLLnz/wVd12USZTJm
 f2nooNg0mER3krmEm/zXOvW2oDducYjPl935TohyisGJccmBAMfEsR4A/9+0JHIPx1fC
 S2BVzeL9xZnIs8HaCC5MecyszyLXUvnST8PF3ALmG1mvY4cHRduOlkyVOewxzg5uGPcS
 +d0DE8W2x+cSciUugEaTpbspYYyKBpPRF2gjTNIeWYUXdsx7trooxf0K/wm4lJ86FG+U
 HDqpfsPPUieewQSdFRHCVgMfWo3hjm0f6gR/G/kCm8/XvH69bNgY7349Pmn5k9nKFFZo
 Ib9Q==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1681290013;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=/VjutI0ZUYEY9Ei7NXg8wL9n4Z6riGTDoSp4YbEhNkk=;
 b=m3VT2z9T2tcl120BvhUEqF5ZibQxYeYF9VcA0znmJ95k/+Rc0RsxjqHQN9UrkpQeB9
 V/GTLSZ3pFVXk97n6yswnIoAK0gNQVj6laYEyZUgytMTYrwohl+koBF/riZpxuqYZDma
 UswiqhxTv4M+GKtuYcqwSOKfBb0L6cGWIGSr516aksPlIano3vwtdvT1UAcMUL3qV3Mj
 53mzdcIx403UdSBjJ79tqBihCC+x2wOCxNvoqp4SRffppkaxVS21FGalKXZnwhhSpR7+
 PweeWZOVhfXC7q2L8rJFy4nVMs8zZY4n+7CNvaEwZl5vQcvlr0UBon81Z5LRxruBGUYL
 z+/g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1681290013;
 s=strato-dkim-0003; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=/VjutI0ZUYEY9Ei7NXg8wL9n4Z6riGTDoSp4YbEhNkk=;
 b=qvUgf2XSOgQFiY7gIIxTLJNBriJB6iaFSUbDCPDCOo6zQJ1PFCEbZlyucnrvkEEXxd
 axE8wxiRRTQRGRRPIRAA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBp5hRw/qviAxtjc3/w3ZTELzCe0ZLT+GJmiExc1F+owl9gUPBewg=="
Received: from [IPv6:2001:9e8:a5ee:ed00:57a:8fd6:b9c0:aefd]
 by smtp.strato.de (RZmta 49.4.0 AUTH) with ESMTPSA id C9fe35z3C90DMxP
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Wed, 12 Apr 2023 11:00:13 +0200 (CEST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH] drm/omap: dsi: Fix deferred probe warnings
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20230412085044.GP11253@pendragon.ideasonboard.com>
Date: Wed, 12 Apr 2023 11:00:12 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <64CDFAA9-4CA3-4557-9C84-E563600B810C@goldelico.com>
References: <20230412073954.20601-1-tony@atomide.com>
 <20230412085044.GP11253@pendragon.ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailer: Apple Mail (2.3445.104.21)
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
Cc: Tomi Valkeinen <tomba@kernel.org>, Tony Lindgren <tony@atomide.com>,
 Sebastian Reichel <sre@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


> Am 12.04.2023 um 10:50 schrieb Laurent Pinchart =
<laurent.pinchart@ideasonboard.com>:
>=20
> Hi Tony,
>=20
> Thank you for the patch.
>=20
> On Wed, Apr 12, 2023 at 10:39:53AM +0300, Tony Lindgren wrote:
>> We may not have dsi->dsidev initialized during probe, and that can
>> lead into various dsi related warnings as omap_dsi_host_detach() gets
>> called with dsi->dsidev set to NULL.
>>=20
>> The warnings can be "Fixed dependency cycle(s)" followed by a
>> WARNING: CPU: 0 PID: 787 at drivers/gpu/drm/omapdrm/dss/dsi.c:4414.
>=20
> How can this happen ? I assume .detach() can't be called without a
> priori successful call to .attach(), that that sets dsi->dsidev.

I have a similar patch (not submitted because it looks like a =
workaround) in our LetuxOS kernel:

=
https://git.goldelico.com/?p=3Dletux-kernel.git;a=3Dcommitdiff;h=3D0656acb=
534439d4546b33826de62694e1df1b8ad

There I had commented:

dsi_init_output() called by dsi_probe() may fail. In that
case mipi_dsi_host_unregister() is called which may call
omap_dsi_host_detach() with uninitialized dsi->dsidev
because omap_dsi_host_attach() was never called before.

This happens if the panel driver asks for an EPROBE_DEFER.

So let's suppress the WARN() in this special case.

[    7.416759] WARNING: CPU: 0 PID: 32 at =
drivers/gpu/drm/omapdrm/dss/dsi.c:4419 omap_dsi_host_detach+0x3c/0xbc =
[omapdrm]
[    7.436053] Modules linked in: ina2xx_adc snd_soc_ts3a227e =
bq2429x_charger bq27xxx_battery_i2c(+) bq27xxx_battery ina2xx =
tca8418_keypad as5013(+) omapdrm hci_uart cec palmas_pwrbutton btbcm =
bmp280_spi palmas_gpadc bluetooth usb3503 ecdh_generic bmc150_accel_i2c =
bmg160_i2c ecc bmc150_accel_core bmg160_core bmc150_magn_i2c bmp280_i2c =
bmc150_magn bno055 industrialio_triggered_buffer bmp280 kfifo_buf =
snd_soc_omap_aess display_connector drm_kms_helper syscopyarea =
snd_soc_omap_mcbsp snd_soc_ti_sdma sysfillrect ti_tpd12s015 sysimgblt =
fb_sys_fops wwan_on_off snd_soc_gtm601 generic_adc_battery drm =
snd_soc_w2cbw003_bt industrialio drm_panel_orientation_quirks pwm_bl =
pwm_omap_dmtimer ip_tables x_tables ipv6 autofs4
[    7.507068] CPU: 0 PID: 32 Comm: kworker/u4:2 Tainted: G        W     =
     6.1.0-rc3-letux-lpae+ #11107
[    7.516964] Hardware name: Generic OMAP5 (Flattened Device Tree)
[    7.523284] Workqueue: events_unbound deferred_probe_work_func
[    7.529456]  unwind_backtrace from show_stack+0x10/0x14
[    7.534972]  show_stack from dump_stack_lvl+0x40/0x4c
[    7.540315]  dump_stack_lvl from __warn+0xb0/0x164
[    7.545379]  __warn from warn_slowpath_fmt+0x70/0x9c
[    7.550625]  warn_slowpath_fmt from omap_dsi_host_detach+0x3c/0xbc =
[omapdrm]
[    7.558137]  omap_dsi_host_detach [omapdrm] from =
mipi_dsi_remove_device_fn+0x10/0x20
[    7.566376]  mipi_dsi_remove_device_fn from =
device_for_each_child+0x60/0x94
[    7.573729]  device_for_each_child from =
mipi_dsi_host_unregister+0x20/0x54
[    7.580992]  mipi_dsi_host_unregister from dsi_probe+0x5d8/0x744 =
[omapdrm]
[    7.588315]  dsi_probe [omapdrm] from platform_probe+0x58/0xa8
[    7.594542]  platform_probe from really_probe+0x144/0x2ac
[    7.600249]  really_probe from __driver_probe_device+0xc4/0xd8
[    7.606411]  __driver_probe_device from driver_probe_device+0x3c/0xb8
[    7.613216]  driver_probe_device from =
__device_attach_driver+0x58/0xbc
[    7.620115]  __device_attach_driver from bus_for_each_drv+0xa0/0xb4
[    7.626737]  bus_for_each_drv from __device_attach+0xdc/0x150
[    7.632808]  __device_attach from bus_probe_device+0x28/0x80
[    7.638792]  bus_probe_device from deferred_probe_work_func+0x84/0xa0
[    7.645595]  deferred_probe_work_func from =
process_one_work+0x1a4/0x2d8
[    7.652587]  process_one_work from worker_thread+0x214/0x2b8
[    7.658567]  worker_thread from kthread+0xe4/0xf0
[    7.663542]  kthread from ret_from_fork+0x14/0x1c
[    7.668515] Exception stack(0xf01b5fb0 to 0xf01b5ff8)
[    7.673827] 5fa0:                                     00000000 =
00000000 00000000 00000000
[    7.682435] 5fc0: 00000000 00000000 00000000 00000000 00000000 =
00000000 00000000 00000000
[    7.691038] 5fe0: 00000000 00000000 00000000 00000000 00000013 =
00000000

Hope this helps to find the real cause.

BR,
Nikolaus

