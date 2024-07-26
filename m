Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B45D93CEE6
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2024 09:36:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F0A610E008;
	Fri, 26 Jul 2024 07:36:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar-org.20230601.gappssmtp.com header.i=@fooishbar-org.20230601.gappssmtp.com header.b="ObpngfWU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 871F010E008
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2024 07:36:16 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id
 6a1803df08f44-6b95b710e2cso2258646d6.2
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2024 00:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20230601.gappssmtp.com; s=20230601; t=1721979375; x=1722584175;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1TPKPX97TTgh+bMeyaRqhyTEqJldy/1yPCfnocQWuqg=;
 b=ObpngfWU0jPnZrK1+pDetc07EASJM1jWpYjEMnPPbYNsNV7SFLpquJ5YOkBhZXeN4x
 91AQG8nJnxbnZVHyvEjEEmu8/Kqilvvyn/7Gtrd71BaSeichkVqKZQ04w5bFj0g/LBDM
 cZozhNkARI4jXg4i/QfwUp2BQXiAZkxnU5lCwHUijdg5SUlQdJ7/6MgMLmDYAyfRipSv
 m0syVAFc8j4484qPJOdtkh7UQxZfNoIhJ8rxPUO1inHCDKIOSH13seauCRKEST1k/Yd/
 yvti345yfHz9budZmythZIbBnLQ9iAeKA48mDGTPxIIt74ZB+XPbKd+Sn0fiQwU8A1Ss
 MwkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721979375; x=1722584175;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1TPKPX97TTgh+bMeyaRqhyTEqJldy/1yPCfnocQWuqg=;
 b=k4ktGXuCSBnB12gzQ8AjKLU2E/CTMV6bbhxMORtRACgDRLAfh/qGfTX6CBvR0GlahI
 rvwOKPOXDD7e9GDEAXn8WIjIwtPs8qJyzgeg1h6bkLCQ7KbSwZVgUt+ENDxZm9q8hqwq
 cv0D6Iub+iAXpwttk70AgEnX0RKUPh1L76EvzPc9+UMJUQ3WK0WpEv7jMJJkdISoS9mg
 rNQz5kv46ozOMrwndjVTNKd5o/7dVQOJdq6ll6hWYVy59b4x1w7wGT1fLkstYqVSzV+O
 2dwWhBaBCVnpxb4YKVBwYPfK/8VCNmL3GW/bVQ/FQurRi6XkpuiY1ttBBdEicdBPeg0m
 Rqvw==
X-Gm-Message-State: AOJu0YxF9pKhYAnYgnAn0LDKgYLrcGnllkwj1zP2zPMDiTGxV/UO+cjz
 hIKMdZHhJlHSIXK5FPYpFNZaIZI8oRqt/nigTHd8dHtoUlBnJMf75v6zmUGpbeylUlF+P4duMHw
 zk7cAOAVFE3SfGFBn6/CrwRprGIdWYHuJ5pchgw==
X-Google-Smtp-Source: AGHT+IGGlYtpl5CnwGzsbFku57FVU+vQWQg6UYr2oNR/eVitvY8vea0qGTJakNZeMiN0ELTqnJHGNHAzrUdeSPuNRfE=
X-Received: by 2002:ad4:5b8f:0:b0:6b2:dd54:b634 with SMTP id
 6a1803df08f44-6bb40894335mr53497916d6.39.1721979375321; Fri, 26 Jul 2024
 00:36:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240724101015.523535-1-vignesh.raman@collabora.com>
 <20240724101015.523535-6-vignesh.raman@collabora.com>
In-Reply-To: <20240724101015.523535-6-vignesh.raman@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 26 Jul 2024 08:36:04 +0100
Message-ID: <CAPj87rMJUSRJ9G1uv-w5a_4qqS0R1dDaUEofoJf=ehbMszdfOw@mail.gmail.com>
Subject: Re: [PATCH v8 5/5] drm/ci: rockchip: add tests for rockchip display
 driver
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
 helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch, 
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com, 
 deborah.brouwer@collabora.com, robdclark@gmail.com, 
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

Hi Vignesh,

On Wed, 24 Jul 2024 at 11:12, Vignesh Raman <vignesh.raman@collabora.com> wrote:
> For rockchip rk3288 and rk3399, the display driver is rockchip
> and gpu driver is panfrost. Currently, in drm-ci for rockchip
> rk3288 and rk3399, only the gpu driver is tested. Refactor
> the existing rockchip jobs to test both display and gpu driver
> and update xfails.

Could you also please add RK3588 in a new series (no need to hold this
one up), with Rockchip KMS and Panthor GPU? You can use the
rk3588-rock5-b device type in LAVA.

> diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt
> index cf3a747f7cec..826cca5efbff 100644
> --- a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt
> +++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt

This is in the wrong patch?

> +++ b/drivers/gpu/drm/ci/xfails/panfrost-rk3288-skips.txt
> @@ -0,0 +1,71 @@
> +# Suspend to RAM seems to be broken on this machine
> +.*suspend.*
> +
> +# Too unstable, machine ends up hanging after lots of Oopses
> +kms_cursor_legacy.*
> +
> +# Started hanging the machine on Linux 5.19-rc2:
> +#
> +# [IGT] kms_plane_lowres: executing
> +# [IGT] kms_plane_lowres: starting subtest pipe-F-tiling-y
> +# [IGT] kms_plane_lowres: exiting, ret=77

ret 77 is a pure skip here, as you'd expect from a pipe F test,
because Rockchip doesn't have six CRTCs.

> +# Console: switching to colour frame buffer device 170x48
> +# rockchip-drm display-subsystem: [drm] *ERROR* flip_done timed out
> +# rockchip-drm display-subsystem: [drm] *ERROR* [CRTC:35:crtc-0] commit wait timed out
> +# BUG: spinlock bad magic on CPU#3, kms_plane_lowre/482
> +# 8<--- cut here ---
> +# Unable to handle kernel paging request at virtual address 7812078e
> +# [7812078e] *pgd=00000000
> +# Internal error: Oops: 5 [#1] SMP ARM
> +# Modules linked in:
> +# CPU: 3 PID: 482 Comm: kms_plane_lowre Tainted: G        W         5.19.0-rc2-323596-g00535de92171 #1
> +# Hardware name: Rockchip (Device Tree)
> +# Process kms_plane_lowre (pid: 482, stack limit = 0x1193ac2b)
> +#  spin_dump from do_raw_spin_lock+0xa4/0xe8
> +#  do_raw_spin_lock from wait_for_completion_timeout+0x2c/0x120
> +#  wait_for_completion_timeout from drm_crtc_commit_wait+0x18/0x7c
> +#  drm_crtc_commit_wait from drm_atomic_helper_wait_for_dependencies+0x44/0x168
> +#  drm_atomic_helper_wait_for_dependencies from commit_tail+0x34/0x180
> +#  commit_tail from drm_atomic_helper_commit+0x164/0x18c
> +#  drm_atomic_helper_commit from drm_atomic_commit+0xac/0xe4
> +#  drm_atomic_commit from drm_client_modeset_commit_atomic+0x23c/0x284
> +#  drm_client_modeset_commit_atomic from drm_client_modeset_commit_locked+0x60/0x1c8
> +#  drm_client_modeset_commit_locked from drm_client_modeset_commit+0x24/0x40
> +#  drm_client_modeset_commit from drm_fbdev_client_restore+0x58/0x94
> +#  drm_fbdev_client_restore from drm_client_dev_restore+0x70/0xbc
> +#  drm_client_dev_restore from drm_release+0xf4/0x114
> +#  drm_release from __fput+0x74/0x240
> +#  __fput from task_work_run+0x84/0xb4
> +#  task_work_run from do_exit+0x34c/0xa20
> +#  do_exit from do_group_exit+0x34/0x98

So this is pointing to the error being that, when a client exits, the
kernel attempts to restore fbdev and then it's broken. Pinning
pipe-F-tiling-y as specifically responsible for this seems quite odd
to me, given that it doesn't do anything but only skips. Is that maybe
just because it's the last test running in the kms_plane_lowres group
before it exits? Or does it occur more wildly on other test groups?

> +tools_test@tools_test,Fail

I keep noticing this failing everywhere. What's up with that? Have you
reported these logs to the igt list?

Cheers,
Daniel
