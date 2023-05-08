Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E31B66FBFE9
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 09:05:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4654A10E336;
	Tue,  9 May 2023 07:04:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from devico.uberspace.de (devico.uberspace.de [185.26.156.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71CA910E21F
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 11:02:32 +0000 (UTC)
Received: (qmail 3777 invoked by uid 990); 8 May 2023 11:02:29 -0000
Authentication-Results: devico.uberspace.de;
	auth=pass (plain)
MIME-Version: 1.0
Date: Mon, 08 May 2023 11:02:28 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Leonard Lausen" <leonard@lausen.nl>
Message-ID: <3802269cd54ce105ef6dece03b1b9af575b4fa06@lausen.nl>
TLS-Required: No
Subject: Re: [PATCH] Revert "drm/msm/dp: Remove INIT_SETUP delay"
To: "Abhinav Kumar" <quic_abhinavk@quicinc.com>, "Bjorn Andersson"
 <andersson@kernel.org>
In-Reply-To: <b0cc40d5-6de1-91cc-e2cd-f47cc53551e4@quicinc.com>
References: <b0cc40d5-6de1-91cc-e2cd-f47cc53551e4@quicinc.com>
 <ebbcd56ac883d3c3d3024d368fab63d26e02637a@lausen.nl>
 <20230508021536.txtamifw2vkfncnx@ripper>
X-Rspamd-Bar: +
X-Rspamd-Report: MIME_GOOD(-0.1) BAYES_HAM(-0.206001) SUSPICIOUS_RECIPS(1.5)
X-Rspamd-Score: 1.193998
Received: from unknown (HELO unkown) (::1)
 by devico.uberspace.de (Haraka/3.0.1) with ESMTPSA;
 Mon, 08 May 2023 13:02:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lausen.nl; s=uberspace;
 h=from; bh=AUdYfC/8BZ2sDiqNVoYRoy2QzAnTT60/s6WkT4FmufM=;
 b=h9RKQUmsPd6uNaUCtteD/zTA9tbqUvFxDUJoAiwj6mrtP2hUMdMRNFcaYUzw4I+Om1fyOPtYph
 ziVOVPFijR8exCJZqAZoE867ZdozilBrdURxrAZYWZaxH+wnknvH/AgHxOClqTmqPSbBRbtvDWpC
 UrMZAYWXvZ5oRZHKG2ArGpXaI4X6WRnowoqz808Gz2SRvuldDPORgTx/BJ0uUvvqnCKbPBmb9ewT
 7vpY+kMQK3MwaM/XJ0q+B7dEd2d/6Lf5YZkJrUhmSor36K1qSGSG7+XKaBkK4Nrj6jZa8WYJGz0Y
 aq88Lk0v2DErb8oaPItKdcIunJD4UdHG0JlQ1EdfAJ7RIz40ffJZxBWdueoi9iZUsNnrvUdqc6Gy
 KVLQ3SqHInMvgeqaaHcX5V4Y3XTcR2CYXNeyV9xbTTEZISJqMK3lCEqG8DJu51qJVQ9yS/tzMtUe
 i/FQEZgY2fzFKduaoRoZn8nsqSxw5IrNmLbh1ND5EVk/NjPcCkJPV4Sxy4FL0WZ2P4Tx/CxIPhaY
 A+sLjsFT1VzdCFcGJB/2RzvvKbffrvp904pyRmFTpcfcc/pzQm3Jftf/R7bOnkewVqFDwWzZ+GLc
 9qCbLsq+TbhXikgVU5/WIndBQMNPVfcL9xvLw2JJz3QSda9SxyC4qBReQXho2gUrjWZWkt0fnNsn
 4=
X-Mailman-Approved-At: Tue, 09 May 2023 07:04:45 +0000
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
Cc: freedreno@lists.freedesktop.org,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Bjorn Andersson <quic_bjorande@quicinc.com>, regressions@lists.linux.dev,
 Nikita Travkin <nikita@trvn.ru>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Kuogee  Hsieh <quic_khsieh@quicinc.com>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Abhinav Kumar <quic_abhinavk@quicinc.com> writes:
> On 5/7/2023 7:15 PM, Bjorn Andersson wrote:
>> When booting with the cable connected on my X13s, 100 is long enough f=
or
>> my display to time out and require me to disconnect and reconnect the
>> cable again.
>>=20
>>=20Do we have any idea of why the reduction to 0 is causing an issue wh=
en
>> using the internal HPD?
>>=20
>>=20Regards,
>> Bjorn
> Yes, we do know why this is causing an issue. The cleaner patch for thi=
s=20
>=20will be posted this week.

Great!

> There is no need to add the 100ms delay back yet.
>=20
>=20thanks for posting this but NAK on this patch till we post the fix th=
is=20
>=20week.
>
> Appreciate a bit of patience till then.

This regression is already part of the 6.3 stable release series. Will
the new patch qualify for inclusion in 6.3.y? Or will it be part of 6.4
and this revert should go into 6.3.y?

Even with this revert, there are additional regressions in 6.3 causing
dpu errors and blank external display upon suspending and resuming the
system while an external display is connected. Will your new patch also
fix these regressions?

[  275.025497] [drm:dpu_encoder_phys_vid_wait_for_commit_done:488] [dpu e=
rror]vblank timeout
[  275.025514] [drm:dpu_kms_wait_for_commit_done:510] [dpu error]wait for=
 commit done returned -110
[  275.064141] [drm:dpu_encoder_frame_done_timeout:2382] [dpu error]enc33=
 frame done timeout

followed by a kernel panic if any modification to the display settings
is done, such as disabling the external display:

[  341.631287] Hardware name: Google Lazor (rev3 - 8) (DT)
[  341.631290] pstate: 604000c9 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BTYP=
E=3D--)
[  341.631296] pc : do_raw_spin_unlock+0xb8/0xc4
[  341.631310] lr : do_raw_spin_unlock+0x78/0xc4
[  341.631315] sp : ffffffc01100b880
[  341.631317] x29: ffffffc01100b880 x28: 0000000000000028 x27: 000000000=
0000038
[  341.631326] x26: ffffff808c89e180 x25: ffffffef33e39920 x24: 000000000=
0000000
[  341.631333] x23: ffffffef33e3ca0c x22: 0000000000000002 x21: ffffff808=
345ded8
[  341.631339] x20: ffffff808345ded0 x19: 000000000000001e x18: 000000000=
0000000
[  341.631345] x17: 0048000000000460 x16: 0441043b04600438 x15: 043800000=
89807d0
[  341.631351] x14: 07b0089807800780 x13: 0000000000000068 x12: 000000000=
0000001
[  341.631357] x11: ffffffef3413bb76 x10: 0000000000000bb0 x9 : ffffffef3=
3e3d6bc
[  341.631363] x8 : ffffff808c89ed90 x7 : ffffff80b1c9f738 x6 : 000000000=
0000001
[  341.631370] x5 : 0000000000000000 x4 : 0000000000000000 x3 : ffffff808=
345def0
[  341.631375] x2 : 00000000dead4ead x1 : 0000000000000003 x0 : 000000000=
0000000
[  341.631383] Kernel panic - not syncing: Asynchronous SError Interrupt
[  341.631386] CPU: 3 PID: 1520 Comm: kwin_wayland Not tainted 6.3.0-stb-=
cbq+ #2
[  341.631390] Hardware name: Google Lazor (rev3 - 8) (DT)
[  341.631393] Call trace:
[  341.631395]  dump_backtrace+0xc8/0x104
[  341.631402]  show_stack+0x20/0x30
[  341.631407]  dump_stack_lvl+0x48/0x60
[  341.631414]  dump_stack+0x18/0x24
[  341.631419]  panic+0x130/0x2fc
[  341.631425]  nmi_panic+0x54/0x78
[  341.631428]  arm64_serror_panic+0x74/0x80
[  341.631434]  arm64_is_fatal_ras_serror+0x6c/0x8c
[  341.631439]  do_serror+0x48/0x60
[  341.631444]  el1h_64_error_handler+0x30/0x48
[  341.631450]  el1h_64_error+0x68/0x6c
[  341.631455]  do_raw_spin_unlock+0xb8/0xc4
[  341.631460]  _raw_spin_unlock_irq+0x18/0x38
[  341.631466]  __wait_for_common+0xb8/0x154
[  341.631472]  wait_for_completion_timeout+0x28/0x34
[  341.631477]  dp_ctrl_push_idle+0x3c/0x88
[  341.631483]  dp_bridge_disable+0x20/0x2c
[  341.631488]  drm_atomic_bridge_chain_disable+0x8c/0xb8
[  341.631495]  drm_atomic_helper_commit_modeset_disables+0x198/0x450
[  341.631501]  msm_atomic_commit_tail+0x1c8/0x36c
[  341.631507]  commit_tail+0x80/0x108
[  341.631512]  drm_atomic_helper_commit+0x114/0x118
[  341.631516]  drm_atomic_commit+0xb4/0xe0
[  341.631522]  drm_mode_atomic_ioctl+0x6b0/0x890
[  341.631527]  drm_ioctl_kernel+0xe4/0x164
[  341.631534]  drm_ioctl+0x35c/0x3bc
[  341.631539]  vfs_ioctl+0x30/0x50
[  341.631547]  __arm64_sys_ioctl+0x80/0xb4
[  341.631552]  invoke_syscall+0x84/0x11c
[  341.631558]  el0_svc_common.constprop.0+0xc0/0xec
[  341.631563]  do_el0_svc+0x94/0xa4
[  341.631567]  el0_svc+0x2c/0x54
[  341.631570]  el0t_64_sync_handler+0x94/0x100
[  341.631575]  el0t_64_sync+0x194/0x198
[  341.631580] SMP: stopping secondary CPUs
[  341.831615] Kernel Offset: 0x2f2b200000 from 0xffffffc008000000
[  341.831618] PHYS_OFFSET: 0x80000000
[  341.831620] CPU features: 0x400000,61500506,3200720b
[  341.831623] Memory Limit: none
