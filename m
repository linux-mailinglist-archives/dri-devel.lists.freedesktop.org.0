Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE1360249D
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 08:41:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A24410EE62;
	Tue, 18 Oct 2022 06:40:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B053610E0D5
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Oct 2022 06:40:50 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id r17so29842250eja.7
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Oct 2022 23:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3qSKLLHkEw4VIDysM7JjLHt5uEy1MrM6e4LnVr/A1wA=;
 b=MfoZP2L+smxgLnnBqSXyJItCYjNkvKYd2jU3oe2V2y7mCPLd8ueUa/SrcYkqamvI/C
 bSAhCvNOPCeN/om5QuxxTDVTj0tQSpcHzuIIy7km4uRDPxnz4fEsfxMX7Vv89uzFuo0w
 cCPqml8EKRQmLbj2ALuAXXOuW8XKQmtYjBH9Q1tMDG+w0XQ19+qz74Ch/pFTc/EKN+3G
 O5P6PaMImWpNa2JcgctCOjRNs+vuceb1kK4J+Sjcneqg7gwiB9uKpCxOXMLmx1F8Jcxm
 3doF/m8U+V7fa2hH/7FV/5rUKcrHBVYauHX1Vb0yU1q9edPApwpJVWsnCGq4WFQoAEj/
 UC2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3qSKLLHkEw4VIDysM7JjLHt5uEy1MrM6e4LnVr/A1wA=;
 b=ZT3aOwEk+jEEZm14sCriUN0B9a0Bu6mXhIsj19NiyQkrR9LRTQlJkAC9hK8lrCv610
 I6BXAHVD08QSLEvyaCBwlgrwBWMn4TITBKhqcQPqaf0KgEUQi/rtp+jCWbL0cyD9qth+
 kbzxcbdNUSJrK/2lxD66q0dwgMZrZQ5VL+qy5hoD8zYlYk3NTZ4qPEDazd9PhQkAplSH
 hGhgZXvIO/b67oXEJwIOu/GBH9QKJFL3SwWVjJy1E6R9hlH5W+7bBzK4a81gVMyJq3EO
 zYX1kN9fvH1o4+Nu7qznKKtzkUXj9yzrmcTqwbJ7OteNxOam7mSMAK6Xw/dG5ojI6zJX
 O14w==
X-Gm-Message-State: ACrzQf2xUgNr3zuDzNjF48JLI3Eeoq+hKi4Y5zDfxOKHtU0yUKJWVZIl
 /sGaY8D62/Owxr6CyzifP4v/FXP46tK7GVhbX9KOjA==
X-Google-Smtp-Source: AMsMyM5tSVeVL7XbXoufhFpYTt18SaC3nzf+Vy74G6XizLwzydCVPsvi0vZZQQctTAIsclP7QuV/4UbppnGxeDlbOBc=
X-Received: by 2002:a17:907:7b93:b0:770:1d4f:4de9 with SMTP id
 ne19-20020a1709077b9300b007701d4f4de9mr1145742ejc.201.1666075249007; Mon, 17
 Oct 2022 23:40:49 -0700 (PDT)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 18 Oct 2022 12:10:36 +0530
Message-ID: <CA+G9fYsuc9G+RO81E=vHMqxYStsmLURLdOB0NF26kJ1=K8pRZA@mail.gmail.com>
Subject: not ok 1 - single_pixel_source_buffer: The buggy address belongs to
 the physical page
To: open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org, 
 kunit-dev@googlegroups.com
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

Following kunit tests started failing on Linux mainline.
 - drm_format_helper_test =E2=80=94 FAIL
 - drm_test_fb_xrgb8888_to_xrgb2101010 =E2=80=94 FAIL
 - single_pixel_source_buffer =E2=80=94 FAIL

Good: v6.0-3015-g2bca25eaeba6
Bad: v6.0-5118-g833477fce7a1

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

[   50.320990]         # Subtest: drm_test_fb_xrgb8888_to_xrgb2101010
[   50.322059] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[   50.326436] BUG: KASAN: slab-out-of-bounds in
drm_test_fb_xrgb8888_to_xrgb2101010+0x2dd/0x520
[   50.329249] Read of size 4 at addr ffff888104d7a5cc by task
kunit_try_catch/619
[   50.331596]
[   50.332135] CPU: 1 PID: 619 Comm: kunit_try_catch Tainted: G    B
         N 6.0.0 #1
[   50.333876] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996),
BIOS 1.12.0-1 04/01/2014
[   50.335138] Call Trace:
[   50.335531]  <TASK>
[   50.335879]  dump_stack_lvl+0x49/0x62
[   50.336462]  print_report.cold+0x5e/0x5d9
[   50.337069]  ? _raw_spin_unlock_irqrestore+0x33/0x60
[   50.337820]  ? update_kunit_status+0xee/0x160
[   50.338494]  ? drm_test_fb_xrgb8888_to_xrgb2101010+0x2dd/0x520
[   50.339354]  kasan_report+0xaa/0x130
[   50.339905]  ? drm_fb_xrgb8888_to_xrgb2101010+0xa0/0xd0
[   50.340680]  ? drm_test_fb_xrgb8888_to_xrgb2101010+0x2dd/0x520
[   50.341576]  __asan_load4+0x80/0xa0
[   50.342112]  drm_test_fb_xrgb8888_to_xrgb2101010+0x2dd/0x520
[   50.342958]  ? drm_test_fb_xrgb8888_to_gray8+0x470/0x470
[   50.343778]  ? update_load_avg+0x80/0xb80
[   50.344407]  ? update_cfs_group+0x22/0x160
[   50.345036]  ? load_balance+0x14d0/0x14d0
[   50.345652]  ? dequeue_entity+0x1f2/0x6a0
[   50.346263]  ? rcu_qs+0x1c/0x120
[   50.346773]  ? finish_task_switch.isra.0+0xe0/0x410
[   50.347532]  ? __kasan_check_write+0x14/0x20
[   50.348192]  ? _raw_spin_lock_irqsave+0x9e/0x100
[   50.348891]  ? _raw_spin_unlock_irqrestore+0x28/0x60
[   50.349625]  ? trace_preempt_on+0x2a/0xf0
[   50.350242]  ? __kthread_parkme+0x4f/0xd0
[   50.350857]  kunit_try_run_case+0x91/0xd0
[   50.351479]  ? kunit_catch_run_case+0x80/0x80
[   50.352151]  ? kunit_try_catch_throw+0x40/0x40
[   50.352897]  kunit_generic_run_threadfn_adapter+0x2f/0x50
[   50.353890]  kthread+0x179/0x1b0
[   50.354410]  ? kthread_complete_and_exit+0x30/0x30
[   50.355126]  ret_from_fork+0x22/0x30
[   50.355708]  </TASK>
[   50.356047]
[   50.356284] Allocated by task 619:
[   50.356817]  kasan_save_stack+0x26/0x50
[   50.357410]  __kasan_kmalloc+0xae/0xe0
[   50.357980]  __kmalloc+0x1cf/0x390
[   50.358501]  kunit_kmalloc_array_init+0x4b/0x80
[   50.359189]  __kunit_add_resource+0x67/0x100
[   50.359859]  kunit_kmalloc_array+0xf8/0x170
[   50.360490]  drm_test_fb_xrgb8888_to_xrgb2101010+0x19f/0x520
[   50.361341]  kunit_try_run_case+0x91/0xd0
[   50.361948]  kunit_generic_run_threadfn_adapter+0x2f/0x50
[   50.362747]  kthread+0x179/0x1b0
[   50.363230]  ret_from_fork+0x22/0x30
[   50.363779]
[   50.364015] The buggy address belongs to the object at ffff888104d7a5c8
[   50.364015]  which belongs to the cache kmalloc-8 of size 8
[   50.365824] The buggy address is located 4 bytes inside of
[   50.365824]  8-byte region [ffff888104d7a5c8, ffff888104d7a5d0)
[   50.367485]
[   50.367736] The buggy address belongs to the physical page:
[   50.368579] page:000000003c09c153 refcount:1 mapcount:0
mapping:0000000000000000 index:0x0 pfn:0x104d7a
[   50.369991] flags: 0x200000000000200(slab|node=3D0|zone=3D2)
[   50.370804] raw: 0200000000000200 0000000000000000 dead000000000122
ffff888100042280
[   50.371933] raw: 0000000000000000 0000000080660066 00000001ffffffff
0000000000000000
[   50.373021] page dumped because: kasan: bad access detected
[   50.373958]
[   50.374202] Memory state around the buggy address:
[   50.374935]  ffff888104d7a480: fc fb fc fc fc fc fb fc fc fc fc fb
fc fc fc fc
[   50.376019]  ffff888104d7a500: fb fc fc fc fc fb fc fc fc fc fb fc
fc fc fc fb
[   50.377098] >ffff888104d7a580: fc fc fc fc fa fc fc fc fc 04 fc fc
fc fc fa fc
[   50.378174]                                               ^
[   50.379025]  ffff888104d7a600: fc fc fc fa fc fc fc fc fa fc fc fc
fc fa fc fc
[   50.380123]  ffff888104d7a680: fc fc 00 fc fc fc fc fa fc fc fc fc
fa fc fc fc
[   50.381191] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[   50.382461]         not ok 1 - single_pixel_source_buffer
[   50.382909]         ok 2 - single_pixel_clip_rectangle
[   50.384319]         ok 3 - well_known_colors
[   50.385393]         ok 4 - destination_pitch
[   50.386029]     # drm_test_fb_xrgb8888_to_xrgb2101010: pass:3
fail:1 skip:0 total:4
[   50.386657]     not ok 5 - drm_test_fb_xrgb8888_to_xrgb2101010
[   50.387762] # drm_format_helper_test: pass:4 fail:1 skip:0 total:5
[   50.388598] # Totals: pass:19 fail:1 skip:0 total:20
[   50.389467] not ok 33 - drm_format_helper_test

Test log link,
https://lkft.validation.linaro.org/scheduler/job/5633513#L7056
https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.0-5118-g8=
33477fce7a1/testrun/12273332/suite/kunit/tests/

Test results comparison:
https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.1-rc1/tes=
trun/12468488/suite/kunit/test/drm_format_helper_test/history/?page=3D2

For your reference:
https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.0-3015-g2=
bca25eaeba6/testrun/12237941/suite/kunit/tests/

metadata:
  git_ref: master
  git_repo: https://gitlab.com/Linaro/lkft/mirrors/torvalds/linux-mainline
  git_sha: 833477fce7a14d43ae4c07f8ddc32fa5119471a2
  git_describe: v6.0-5118-g833477fce7a1
  kernel_version: 6.0.0
  kernel-config: https://builds.tuxbuild.com/2FjJ6bdUwO43y6QWMJyjklBN9Ji/co=
nfig
  build-url: https://gitlab.com/Linaro/lkft/mirrors/torvalds/linux-mainline=
/-/pipelines/659360852
  artifact-location: https://builds.tuxbuild.com/2FjJ6bdUwO43y6QWMJyjklBN9J=
i
  toolchain: gcc-11

--
Linaro LKFT
https://lkft.linaro.org
