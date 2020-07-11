Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 603AB21C35A
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jul 2020 11:34:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 259DC6E103;
	Sat, 11 Jul 2020 09:34:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D1D96E103
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Jul 2020 09:34:26 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id d16so6459437edz.12
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Jul 2020 02:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uUHOvQ1RnseULY7jjRZbv5heR1BME+nXRNTnFLUAArc=;
 b=Gh+EAkR6hdE2x+k75yw7F4SbBJRXAVWl+RrXQMi5wmp8S/yPE7ARZjsF7e+APwaCWF
 /4Qo5LyzEzcfF/TEXr5s9LnO7ZpUOCKWBAvQskUOCGBP9tZ36vBD6p8GsivrDdfTR98d
 DEnqn/UqpGA7nbAmC/dg5qlU2VEzEBHZyZX14OWxVQTFTSVoQwE2nmyXCt5rbfJP5eIB
 zbokYLfaIlCE9HwnaVRJlGFTSDdaW6iXrx2jtF0VJFphzabo8EKGgPGYe4ngMXHjkWe2
 muM2zKG2O8dMWXoQYLcKB/Leas1TIIiliaAur1CpVK9frZBOjkPFkwjavwfmG+x7O9oQ
 YkVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uUHOvQ1RnseULY7jjRZbv5heR1BME+nXRNTnFLUAArc=;
 b=eQZmWqDadD2nhJBYlxCRKmikAkwNXiXwINgm1iPvHuMVBSzRcWcNH4pxZ/tLPpeRK5
 a2Sq/LlaDVftRD3HyOsh7SiWeqQZ28kZ/FGPSDB+Uv6oMsy8uSjLOQB2gUZxforbXRmC
 HxMk28x40886kP+CNChotiB2VYcheWYcQP74KEIN3amGIpHCWxjlE8wEhoYrYsDF0mk5
 Pr/zKkUpGPOu2fo/IVCpHNnYvNIjLHZSqhBIBiBwxgSY9ogLYgBr0yvC9avKxfNCdjCR
 giZ6MBOOADuSKXFIuGZm8ezRKYtrj6SR5XnQYwvCVhGS31qvWhnUlpuYGEhikzxljQxB
 x79A==
X-Gm-Message-State: AOAM530Vr/muT+iIRzrdyugot81HDPRTTvE4mwSALDeEV33uwFphLTaU
 YQuC/9PgXGvysxoCDxGkLmMF2mgnUDHqtRVJcOA0aw==
X-Google-Smtp-Source: ABdhPJyI9wVIMb2N1IM1PmqnHYZ5rKdelTTwX2p6FPuzTHr4vTILv7eLxa1LU1eI/fBA/dSZFczU1gdS2YEFalSJ4LI=
X-Received: by 2002:a05:6402:1655:: with SMTP id
 s21mr79066131edx.289.1594460064680; 
 Sat, 11 Jul 2020 02:34:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200627115245.5925-1-shawnguo@kernel.org>
In-Reply-To: <20200627115245.5925-1-shawnguo@kernel.org>
From: Shawn Guo <shawn.guo@linaro.org>
Date: Sat, 11 Jul 2020 17:34:13 +0800
Message-ID: <CAAQ0ZWSozns0ZWHJp4G56p78CnJnPdP6pLsoJP5B7-nZhqGzWw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/atomic_helper: add a flag for duplicating
 drm_private_obj state
To: Shawn Guo <shawnguo@kernel.org>
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
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@bootlin.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jun 27, 2020 at 7:53 PM Shawn Guo <shawnguo@kernel.org> wrote:
>
> From: Shawn Guo <shawn.guo@linaro.org>
>
> The msm/mdp5 driver uses state of drm_private_obj as its global atomic
> state, which keeps the assignment of hwpipe to plane.  With
> drm_private_obj missing from duplicate state call in context of atomic
> suspend/resume helpers, mdp5 suspend works with no problem only for the
> very first time.  Any subsequent suspend will hit the following warning,
> because hwpipe assignment doesn't get duplicated for suspend state.
>
> $ echo mem > /sys/power/state
> [   38.111144] PM: suspend entry (deep)
> [   38.111185] PM: Syncing filesystems ... done.
> [   38.114630] Freezing user space processes ... (elapsed 0.001 seconds) done.
> [   38.115912] OOM killer disabled.
> [   38.115914] Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.
> [   38.122170] ------------[ cut here ]------------
> [   38.122212] WARNING: CPU: 0 PID: 1747 at drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c:145 mdp5_pipe_release+0x90/0xc0
> [   38.122215] Modules linked in:
> [   38.122222] CPU: 0 PID: 1747 Comm: sh Not tainted 4.19.107-00515-g9d5e4d7a33ed-dirty #323
> [   38.122224] Hardware name: Square, Inc. T2 Devkit (DT)
> [   38.122228] pstate: 40000005 (nZcv daif -PAN -UAO)
> [   38.122230] pc : mdp5_pipe_release+0x90/0xc0
> [   38.122233] lr : mdp5_pipe_release+0x90/0xc0
> [   38.122235] sp : ffff00000d13b7f0
> [   38.122236] x29: ffff00000d13b7f0 x28: 0000000000000000
> [   38.122240] x27: 0000000000000002 x26: ffff800079adce00
> [   38.122243] x25: ffff800079405200 x24: 0000000000000000
> [   38.122246] x23: ffff80007a78cc08 x22: ffff80007b1cc018
> [   38.122249] x21: ffff80007b1cc000 x20: ffff80007b317080
> [   38.122252] x19: ffff80007a78ce80 x18: 0000000000020000
> [   38.122255] x17: 0000000000000000 x16: 0000000000000000
> [   38.122258] x15: 00000000fffffff0 x14: ffff000008c3fb48
> [   38.122261] x13: ffff000008cdac4a x12: ffff000008c3f000
> [   38.122264] x11: 0000000000000000 x10: ffff000008cda000
> [   38.122267] x9 : 0000000000000000 x8 : ffff000008ce4a40
> [   38.122269] x7 : 0000000000000000 x6 : 0000000039ea41a9
> [   38.122272] x5 : 0000000000000000 x4 : 0000000000000000
> [   38.122275] x3 : ffffffffffffffff x2 : c7580c109cae4500
> [   38.122278] x1 : 0000000000000000 x0 : 0000000000000024
> [   38.122281] Call trace:
> [   38.122285]  mdp5_pipe_release+0x90/0xc0
> [   38.122288]  mdp5_plane_atomic_check+0x2c0/0x448
> [   38.122294]  drm_atomic_helper_check_planes+0xd0/0x208
> [   38.122298]  drm_atomic_helper_check+0x38/0xa8
> [   38.122302]  drm_atomic_check_only+0x3e8/0x630
> [   38.122305]  drm_atomic_commit+0x18/0x58
> [   38.122309]  __drm_atomic_helper_disable_all.isra.12+0x15c/0x1a8
> [   38.122312]  drm_atomic_helper_suspend+0x80/0xf0
> [   38.122316]  msm_pm_suspend+0x4c/0x70
> [   38.122320]  dpm_run_callback.isra.6+0x20/0x68
> [   38.122323]  __device_suspend+0x110/0x308
> [   38.122326]  dpm_suspend+0x100/0x1f0
> [   38.122329]  dpm_suspend_start+0x64/0x70
> [   38.122334]  suspend_devices_and_enter+0x110/0x500
> [   38.122336]  pm_suspend+0x268/0x2c0
> [   38.122339]  state_store+0x88/0x110
> [   38.122345]  kobj_attr_store+0x14/0x28
> [   38.122352]  sysfs_kf_write+0x3c/0x50
> [   38.122355]  kernfs_fop_write+0x118/0x1e0
> [   38.122360]  __vfs_write+0x30/0x168
> [   38.122363]  vfs_write+0xa4/0x1a8
> [   38.122366]  ksys_write+0x64/0xe8
> [   38.122368]  __arm64_sys_write+0x18/0x20
> [   38.122374]  el0_svc_common+0x6c/0x178
> [   38.122377]  el0_svc_compat_handler+0x1c/0x28
> [   38.122381]  el0_svc_compat+0x8/0x18
> [   38.122383] ---[ end trace 24145b7d8545345b ]---
> [   38.491552] Disabling non-boot CPUs ...
>
> Let's add a flag for duplicating the state of drm_private_obj and set
> the flag from msm/mdp5 driver, so that the problem can be fixed while
> other drivers using drm_private_obj stay unaffected.
>
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---
> Changes for v2:
>  - Add a flag to duplicate the state of drm_private_obj conditionally,
>    so that other drivers using drm_private_obj stay unaffected.

Hi Daniel,

Are you okay with this version?

Shawn
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
