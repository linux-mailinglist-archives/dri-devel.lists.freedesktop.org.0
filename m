Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 249FC9F4290
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 06:25:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1DA910E15D;
	Tue, 17 Dec 2024 05:25:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="UcaPKcwZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4D5210E15D
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 05:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1734413108;
 bh=2f+ZqjAke4iwHTR3GFedpFF4D+O1tQcfClogyNIP9aU=;
 h=Date:To:Cc:From:Subject:From;
 b=UcaPKcwZ4mjOq0DS7zkxVoTCYSjWFRlhFgDOXKO2NhUsKAha1gtstN7nGjdV1KuH6
 ovnW0hIesyC5coGCFkD4MSbMUhGFTWxJnqml5AJr8q9ycGmL+uX7ZzyVWda/4dbzJ5
 m3G4uoUiW2Pg0g40cct1EX6Fhh0+rhIR0/HK/gi6L1qUDspw38QH2bbVcTGtAogyS/
 2RLUE9VKtnkLMoLzNzGsVLZrWkb0Qube6E0FTd2TYW2zsVJzcF3/OSRKD0TE3DcQFq
 LNw3jtsYdI9bnCG0vGAFkPeQsCxKcQ604a6NZle4f+ic8jXGjHEMp7dwKLeknOqboB
 8FGUvgn9nuf7w==
Received: from [192.168.50.250] (unknown [171.76.86.135])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 0D2DC17E108D;
 Tue, 17 Dec 2024 06:25:04 +0100 (CET)
Message-ID: <c0b4cded-0971-4abb-9965-2acf4602d7cd@collabora.com>
Date: Tue, 17 Dec 2024 10:54:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 airlied@gmail.com, daniel@ffwll.ch, Daniel Stone <daniels@collabora.com>,
 Helen Mae Koike Fornazier <helen.koike@collabora.com>,
 Sergi Blanch Torne <sergi.blanch.torne@collabora.com>,
 Guilherme Alcarde Gallo <guilherme.gallo@collabora.com>
From: Vignesh Raman <vignesh.raman@collabora.com>
Subject: drm-ci: flake test:
 kms_bw@connected-linear-tiling-1-displays-2160x1440p
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi Maintainers,

There are some flake tests reported for mediatek driver testing in drm-ci.

# Board Name: mt8173-elm-hana
# Failure Rate: 100
# IGT Version: 1.29-g33adea9eb
# Linux Version: 6.13.0-rc2
kms_bw@connected-linear-tiling-1-displays-2160x1440p

command: cd "/igt/libexec/igt-gpu-tools" && 
"/igt/libexec/igt-gpu-tools/kms_bw" "--run-subtest" 
"connected-linear-tiling-1-displays-2160x1440p"
pid: 329
exit status: exit status: 98
stdout:
-------
IGT-Version: 1.29-g33adea9eb (aarch64) (Linux: 6.13.0-rc2-g1f006005ebf8 
aarch64)
Using IGT_SRANDOM=1734348965 for randomisation
Opened device: /dev/dri/card0
Starting subtest: connected-linear-tiling-1-displays-2160x1440p
Stack trace:
   #0 ../lib/igt_core.c:2051 __igt_fail_assert()
   #1 ../lib/igt_pipe_crc.c:236 pipe_crc_new()
   #2 ../tests/kms_bw.c:133 run_test_linear_tiling()
   #3 ../tests/kms_bw.c:295 __igt_unique____real_main264()
   #4 ../tests/kms_bw.c:264 main()
   #5 [__libc_init_first+0x80]
   #6 [__libc_start_main+0x98]
   #7 [_start+0x30]
Subtest connected-linear-tiling-1-displays-2160x1440p: FAIL (0.336s)
stderr:
-------
(kms_bw:329) igt_pipe_crc-CRITICAL: Test assertion failure function 
pipe_crc_new, file ../lib/igt_pipe_crc.c:240:
(kms_bw:329) igt_pipe_crc-CRITICAL: Failed assertion: pipe_crc->ctl_fd != -1
(kms_bw:329) igt_pipe_crc-CRITICAL: Last errno: 2, No such file or directory
Subtest connected-linear-tiling-1-displays-2160x1440p failed.
**** DEBUG ****
(kms_bw:329) DEBUG: Test requirement passed: !(pipe >= num_pipes)
(kms_bw:329) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 && 
plane_idx < pipe->n_planes
(kms_bw:329) igt_pipe_crc-CRITICAL: Test assertion failure function 
pipe_crc_new, file ../lib/igt_pipe_crc.c:240:
(kms_bw:329) igt_pipe_crc-CRITICAL: Failed assertion: pipe_crc->ctl_fd != -1
(kms_bw:329) igt_pipe_crc-CRITICAL: Last errno: 2, No such file or directory
(kms_bw:329) igt_core-INFO: Stack trace:
(kms_bw:329) igt_core-INFO:   #0 ../lib/igt_core.c:2051 __igt_fail_assert()
(kms_bw:329) igt_core-INFO:   #1 ../lib/igt_pipe_crc.c:236 pipe_crc_new()
(kms_bw:329) igt_core-INFO:   #2 ../tests/kms_bw.c:133 
run_test_linear_tiling()
(kms_bw:329) igt_core-INFO:   #3 ../tests/kms_bw.c:295 
__igt_unique____real_main264()
(kms_bw:329) igt_core-INFO:   #4 ../tests/kms_bw.c:264 main()
(kms_bw:329) igt_core-INFO:   #5 [__libc_init_first+0x80]
(kms_bw:329) igt_core-INFO:   #6 [__libc_start_main+0x98]
(kms_bw:329) igt_core-INFO:   #7 [_start+0x30]
****  END  ****

Pipeline link: 
https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/68249775

Please could you have a look at these test results and let us know if 
you need more information. Thank you.

Regards,
Vignesh
