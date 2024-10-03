Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F5F98ECE5
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 12:26:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52FA510E084;
	Thu,  3 Oct 2024 10:26:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="U7CsTFtJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com
 [209.85.219.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BC7410E084
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2024 10:26:07 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id
 3f1490d57ef6-e25d11cc9f0so628930276.3
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Oct 2024 03:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1727951166; x=1728555966;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SjyuhCfqNCFRAbzuCuRzaWP0WNjSayZ0FhFg02rgmIM=;
 b=U7CsTFtJRRVOIWPCtnJ8itKyNe6HVXjFKoKpawtYOQ3Q5RIijdPXhGW5vKZymM0LkF
 7+0ZorA9si58ofzrRy7CGSgP4vZVr7vXb1/HzD8wo+rx/megoryEQzd9na33aVCa4S7a
 NL5JY43RTk+qeMPRzDUszDpbf6HUTeXcgZw/uHoRaEt04KOcxbhGeOPoPRk5qULViA+K
 2tQSjJXq7dv62I3M93XlK+vezCBhwdIxO2bUhCtK6zKlH0CWZhAB0CMRbRKNMeJcfrz2
 vT2p9dIUcums+HOwTS4CE10YoFsBwmPyM/pAbdfLfnhE0W2ECtQh9XgoIw++CVe/druE
 7v4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727951166; x=1728555966;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SjyuhCfqNCFRAbzuCuRzaWP0WNjSayZ0FhFg02rgmIM=;
 b=YbR10P4h50GQwgRSohefAaa2C67BzGb3VrgbKu6l2VxCycWoBMrZvRJC60un+kzqdB
 YX1MBSFK6CsX/bSD/Be8moTsJVEGhKMH9SQLCudsUOx1y8jbX6iKiaaqz/FoVbUPpH/z
 kNzb3QCI6LXrP+WlzmqnFBI79uclutzZGNCZDyMGba7hu1fw/kCEL9S/9F99+u2fNPuv
 tn+rOHYYcOmFfmRuA+9Ufcf0gzF9+zUQQjQDSnl6nFSFqQJq0niPgh7cWXg2wtM3b3WM
 TSNRwSg1IWwdPlYKCEILRkm8Rzg68DaexTsv57yF0L+wLUOU+zuK3SuNQM29MrJ0FpiW
 FzEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2rEPzv9LvjLvRCpBjPvk2sLXhJq973b1uJcV2ofCvmd8YBRgt65iTVRQuhds4RpNnaFNuLR1ikkc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzqjvPWjIo4yk8JKsFyjC8OH1Jw54vMvJSRhkThRXEM9Nm2NWOE
 8Z6dAaFfXs3Hm6sNO3plrwBJl+S5LMqTqPUksQO1netjx/OFBzKHAoSMHNTtga6kH2Hcled4JU0
 08ZTOmgLYQPMPb+Iv3ds/e966riWOr2CQEPO+dg==
X-Google-Smtp-Source: AGHT+IF91Uitc/DAZxzVTKwWvm+H/TQmZ+9+FE15zjSLiCFHyvLNGfUeQlUaYYS9JzDhqSID1kuQsEOYvsgV9VR/QlI=
X-Received: by 2002:a05:6902:200f:b0:e1d:2e05:1958 with SMTP id
 3f1490d57ef6-e263841538emr4320294276.46.1727951166045; Thu, 03 Oct 2024
 03:26:06 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20241003092859eucas1p1b9706a1e0a4ae23b490ae0f1c3c1d32d@eucas1p1.samsung.com>
 <20241003092826.1942901-1-m.szyprowski@samsung.com>
In-Reply-To: <20241003092826.1942901-1-m.szyprowski@samsung.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 3 Oct 2024 11:25:49 +0100
Message-ID: <CAPY8ntDcbx_7HayDV7Jwa+rfCiDjecAGr5BNdiSKi7Y3i9yuog@mail.gmail.com>
Subject: Re: [PATCH 0/2] drm: Two fixes for the 'Provide client setup helper
 and convert drivers' patchset
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Javier Martinez Canillas <javierm@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi Marek

On Thu, 3 Oct 2024 at 10:29, Marek Szyprowski <m.szyprowski@samsung.com> wr=
ote:
>
> Dear All,
>
> Yesterday the "drm: Provide client setup helper and convert drivers"
> patchset [1] landed in linux-next. In my tests I found that it causes ker=
nel
> NULL pointer dereference on ARM/ARM64 based Raspberry Pi4B boards. It
> turned out that the conversion of the VC4 DRM driver is a bit incomplete,
> so I've decided to provide the needed fix. While developping it I've
> found that a small fix to generic drm/fbdev-helper helps to avoid NULL
> pointer dereference in the future in case of similar problems.

This duplicates the patches I sent yesterday -
https://lists.freedesktop.org/archives/dri-devel/2024-October/472428.html

I chose EINVAL instead of ENODEV for the return value if neither probe
function was defined - I don't know which is better/preferred.

  Dave

> Those patches fixes the following problem observed on Raspberry Pi4B
> boards:
>
> 8<--- cut here ---
> Unable to handle kernel NULL pointer dereference at virtual address 00000=
020 when write
> [00000020] *pgd=3D00000000
> Internal error: Oops: 805 [#1] SMP ARM
> Modules linked in: aes_arm aes_generic cmac brcmfmac_wcc brcmfmac brcmuti=
l sha256_generic libsha256 sha256_arm cfg80211 hci_uart btbcm crc32_arm_ce =
raspberrypi_hwmon bluetooth ecdh_generic vc4 ecc libaes snd_soc_hdmi_codec =
snd_soc_core ac97_bus snd_pcm_dmaengine snd_pcm v3d bcm2711_thermal snd_tim=
er genet drm_shmem_helper snd gpu_sched soundcore drm_dma_helper
> CPU: 1 UID: 0 PID: 21 Comm: kworker/1:0 Not tainted 6.12.0-rc1-next-20241=
002 #15363
> Hardware name: BCM2711
> Workqueue: events output_poll_execute
> PC is at __drm_fb_helper_initial_config_and_unlock+0x30c/0x518
> LR is at __drm_fb_helper_initial_config_and_unlock+0x26c/0x518
> pc : [<c0aec770>]    lr : [<c0aec6d0>]    psr: 60000013
> ...
> Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
> Control: 10c5383d  Table: 04ef006a  DAC: 00000051
> ...
> Register r12 information: slab task_struct start c213c400 pointer offset =
0 size 2176
> Process kworker/1:0 (pid: 21, stack limit =3D 0x98a73703)
> Stack: (0xf0879e28 to 0xf087a000)
> ...
> Call trace:
>  __drm_fb_helper_initial_config_and_unlock from drm_client_dev_hotplug+0x=
ac/0x104
>  drm_client_dev_hotplug from output_poll_execute+0x298/0x2a0
>  output_poll_execute from process_one_work+0x178/0x3c0
>  process_one_work from worker_thread+0x270/0x42c
>  worker_thread from kthread+0xe0/0xfc
>  kthread from ret_from_fork+0x14/0x28
> Exception stack(0xf0879fb0 to 0xf0879ff8)
> 9fa0:                                     00000000 00000000 00000000 0000=
0000
> 9fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 0000=
0000
> 9fe0: 00000000 00000000 00000000 00000000 00000013 00000000
> Code: e30a3724 e5942038 e34c3186 e8b30003 (e5820020)
> ---[ end trace 0000000000000000 ]---
>
> [1] https://patchwork.freedesktop.org/series/137389/
>
> Best regards
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
>
>
> Patch summary:
>
> Marek Szyprowski (2):
>   drm/fbdev-helper: fail if driver provides no fbdev/fb probe functions
>   drm/vc4: Provides DRM_FBDEV_DMA_DRIVER_OPS also for vc5_drm_driver
>
>  drivers/gpu/drm/drm_fb_helper.c | 3 +++
>  drivers/gpu/drm/vc4/vc4_drv.c   | 1 +
>  2 files changed, 4 insertions(+)
>
> --
> 2.34.1
>
