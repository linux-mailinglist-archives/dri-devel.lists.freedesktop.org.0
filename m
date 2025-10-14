Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D011BBD8C63
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 12:31:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD44210E21F;
	Tue, 14 Oct 2025 10:31:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="jhHVLY6M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 546C510E21F
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 10:31:56 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id DBCE04E4108C;
 Tue, 14 Oct 2025 10:31:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A49A2606EC;
 Tue, 14 Oct 2025 10:31:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8630B102F2291; 
 Tue, 14 Oct 2025 12:31:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1760437913; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=IurHRNwPS5bUvPhYdCwcQ9dFIG4PiztIuBV3e51dI4o=;
 b=jhHVLY6MGMT6NDtAeVatp666lR0Q3ErPybpTm/GZoCgz52fhFxeBZ88/KUFrMTy3tn7nQx
 OLS1Y0nMFLudn8RUF2CezHmKOrxoNrzt37GuMMWroWZOFA8DvMJx8528kv6PFAOjUSAuHj
 rP7u8nf0IR9tDMaWousMtO0BAZwxT+1SZ/bkG7QEgBQ3BkgmOhTovPDY+F549/aI4PI/R1
 ds3aArNw5sDGxPKxhcFdvtuWMyjVUlQtpwpEv6qpufX7RxRmd0s1A9lEYNFStkzqSfS8dn
 0KsWwqvCN97v7SEMnmAO9DkNSYqxxVgkSdSux6tQJYqLJQU35Ow8k53fcAybrA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 14 Oct 2025 12:31:35 +0200
Message-Id: <DDHZ5GO9MPF0.CGYTVBI74FOZ@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
To: "Ernest Van Hoecke" <ernestvanhoecke@gmail.com>, "Anusha Srivatsa"
 <asrivats@redhat.com>, "Maxime Ripard" <mripard@kernel.org>
Cc: "Neil Armstrong" <neil.armstrong@linaro.org>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Jessica Zhang" <quic_jesszhan@quicinc.com>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Thomas Zimmermann"
 <tzimmermann@suse.de>, "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Hui
 Pu" <Hui.Pu@gehealthcare.com>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <imx@lists.linux.dev>,
 <regressions@lists.linux.dev>
Subject: Re: [REGRESSION] drm/panel/panel-simple v6.17 WARNING regression
X-Mailer: aerc 0.20.1
References: <hlf4wdopapxnh4rekl5s3kvoi6egaga3lrjfbx6r223ar3txri@3ik53xw5idyh>
In-Reply-To: <hlf4wdopapxnh4rekl5s3kvoi6egaga3lrjfbx6r223ar3txri@3ik53xw5idyh>
X-Last-TLS-Session-Version: TLSv1.3
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

Hello Ernest,

thanks for your detailed analysis and report!

On Tue Oct 14, 2025 at 10:13 AM CEST, Ernest Van Hoecke wrote:
> Hello everyone,
>
> Commit 94d50c1a2ca3 ("drm/bridge: get/put the bridge reference in drm_bri=
dge_attach/detach()")
> introduced a regression with the below warning dure probe with panel
> dpi described in the device tree.
>
> [    9.160074] ------------[ cut here ]------------
> [    9.160092] WARNING: CPU: 0 PID: 66 at /usr/src/kernel/lib/refcount.c:=
25 drm_bridge_attach+0x2c/0x1dc
> [    9.160138] refcount_t: addition on 0; use-after-free.
> [    9.160147] Modules linked in: coda_vpu(+) snd_soc_fsl_asrc snd_compre=
ss v4l2_jpeg pwm_imx27 imx_vdoa spi_imx imx6_media(C) imx_media_common(C) v=
ideobuf2_dma_contig etnaviv snd_soc_fsl_ssi v4l2_mem2mem imx_pcm_dma panel_=
simple gpio_keys gpu_sched pwm_bl loop fuse ipv6 autofs4
> [    9.160423] CPU: 0 UID: 0 PID: 66 Comm: kworker/u10:2 Tainted: G      =
   C          6.17.0-rc5-0.0.0-devel #1 PREEMPT
> [    9.160459] Tainted: [C]=3DCRAP
> [    9.160476] Hardware name: Freescale i.MX6 Quad/DualLite (Device Tree)
> [    9.160497] Workqueue: events_unbound deferred_probe_work_func
> [    9.160535] Call trace:
> [    9.160546]  unwind_backtrace from show_stack+0x10/0x14
> [    9.160603]  show_stack from dump_stack_lvl+0x54/0x68
> [    9.160637]  dump_stack_lvl from __warn+0x7c/0xd4
> [    9.160672]  __warn from warn_slowpath_fmt+0x130/0x1c4
> [    9.160726]  warn_slowpath_fmt from drm_bridge_attach+0x2c/0x1dc
> [    9.160780]  drm_bridge_attach from imx_pd_bind+0x74/0xa0
> [    9.160836]  imx_pd_bind from component_bind_all+0xfc/0x254
> [    9.160881]  component_bind_all from imx_drm_bind+0xa8/0x154
> [    9.160903]  imx_drm_bind from try_to_bring_up_aggregate_device+0x1f8/=
0x2b0
> [    9.160959]  try_to_bring_up_aggregate_device from __component_add+0x9=
c/0x160
> [    9.161003]  __component_add from imx_pd_probe+0xa8/0x160
> [    9.161042]  imx_pd_probe from platform_probe+0x5c/0x90
> [    9.161066]  platform_probe from really_probe+0xd0/0x3a4
> [    9.161093]  really_probe from __driver_probe_device+0x8c/0x1d4
> [    9.161144]  __driver_probe_device from driver_probe_device+0x34/0xd0
> [    9.161195]  driver_probe_device from __device_attach_driver+0xa4/0x13=
4
> [    9.161248]  __device_attach_driver from bus_for_each_drv+0x90/0xe4
> [    9.161299]  bus_for_each_drv from __device_attach+0xa4/0x1cc
> [    9.161328]  __device_attach from bus_probe_device+0x84/0x88
> [    9.161354]  bus_probe_device from deferred_probe_work_func+0x8c/0xcc
> [    9.161395]  deferred_probe_work_func from process_one_work+0x158/0x2e=
0
> [    9.161434]  process_one_work from worker_thread+0x254/0x3fc
> [    9.161449]  worker_thread from kthread+0x128/0x24c
> [    9.161473]  kthread from ret_from_fork+0x14/0x28
> [    9.161494] Exception stack(0xe0aa1fb0 to 0xe0aa1ff8)
> [    9.161505] 1fa0:                                     00000000 0000000=
0 00000000 00000000
> [    9.161517] 1fc0: 00000000 00000000 00000000 00000000 00000000 0000000=
0 00000000 00000000
> [    9.161529] 1fe0: 00000000 00000000 00000000 00000000 00000013 0000000=
0
> [    9.161539] ---[ end trace 0000000000000000 ]---
>
> Note that this commit was added to branch 'drm-next-2025-07-30',
> which did not contain an already mainlined fix for another regression [1]=
.
> Without that fix [2], this new regression is masked.
>
> Reverting 94d50c1a2ca3 on top of
> commit 260f6f4fda93 ("Merge tag 'drm-next-2025-07-30' of https://gitlab.f=
reedesktop.org/drm/kernel")
> fixes the issue. At that point, [1] was fixed in mainline, and the new
> regression reported here was merged in. v6.17-rc1 to v6.17-rc7 are in
> this state.

This is because the DRM_IMX has not been converted to the new
devm_drm_bridge_alloc() [0] DRM bridge allocation API, which is now
mandatory.

I converted all the bridges, except for a few which I missed because my
search was based on looking for drm_bridge_add() calls, and this driver
does not call it.

I recently sent a series proposing to make drm_bridge_add() mandatory
before drm_bridge_attach() in the docs and warn if that is violated [1]. If
you apply patch 4 of that series you should see the warning.

Let me have a look at the DRM_IMX driver, I'll try to send a series
converting it to the new API within today.

[0] https://elixir.bootlin.com/linux/v6.17.1/source/include/drm/drm_bridge.=
h#L1282
[1] https://lore.kernel.org/lkml/20251003-b4-drm-bridge-alloc-add-before-at=
tach-v1-0-92fb40d27704@bootlin.com/#t

> However, later on, another regression seems to be introduced by
> commit 8fa5909400f3 ("drm/bridge: get the bridge returned by drm_bridge_c=
hain_get_first_bridge()")
> so reverting 94d50c1a2ca3 on top of drm-misc-next does not solve
> everything. This was tested by rebasing drm-misc-next onto (260f6f4fda93
> plus the revert of 94d50c1a2ca3) and then bisecting.
>
> So in v6.18-rc1, both regressions are present.
>
> There, I get the following additional warnings:
>
> [    9.732278] ------------[ cut here ]------------
> [    9.732336] WARNING: CPU: 0 PID: 38 at lib/refcount.c:22 drm_bridge_ge=
t+0x10/0x18
> [    9.744608] refcount_t: saturated; leaking memory.

Not sure here, but it may well be another symptom of the same bug: the
refcount was not initialized correctly, so it is found inconsistent later
when trying to increase it. Let's fix the known issue and then we'll see.

Best regards,
Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
