Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 154D07E9201
	for <lists+dri-devel@lfdr.de>; Sun, 12 Nov 2023 19:42:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77B1F10E08F;
	Sun, 12 Nov 2023 18:42:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 64521 seconds by postgrey-1.36 at gabe;
 Sun, 12 Nov 2023 18:42:03 UTC
Received: from vps.thesusis.net (vps.thesusis.net [34.202.238.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3E8310E08F
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Nov 2023 18:42:03 +0000 (UTC)
Received: by vps.thesusis.net (Postfix, from userid 1000)
 id A1719148909; Sun, 12 Nov 2023 13:42:02 -0500 (EST)
From: Phillip Susi <phill@thesusis.net>
To: Bagas Sanjaya <bagasdotme@gmail.com>, Luben Tuikov
 <luben.tuikov@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>
Subject: Re: Radeon regression in 6.6 kernel
In-Reply-To: <ZVCzCrkdRJy9AHd2@archie.me>
References: <87edgv4x3i.fsf@vps.thesusis.net> <ZVCzCrkdRJy9AHd2@archie.me>
Date: Sun, 12 Nov 2023 13:42:02 -0500
Message-ID: <87fs1addad.fsf@vps.thesusis.net>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=-=-="
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
Cc: Linux AMDGPU <amd-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Regressions <regressions@lists.linux.dev>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--=-=-=
Content-Type: text/plain

Bagas Sanjaya <bagasdotme@gmail.com> writes:

> Please show the full bisect log, and also tell why these commits are
> skipped.

Two of them would not compile and one would not boot.

Here's the log.


--=-=-=
Content-Type: text/plain
Content-Disposition: inline; filename=BISECT_LOG
Content-Description: BISECT_LOG

# bad: [4bbdb725a36b0d235f3b832bd0c1e885f0442d9f] Merge tag 'iommu-updates-v6.7' of git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu
# good: [94f6f0550c625fab1f373bb86a6669b45e9748b3] Linux 6.6-rc5
git bisect start 'HEAD' 'v6.6-rc5'
# good: [8bc9e6515183935fa0cccaf67455c439afe4982b] Merge tag 'devicetree-for-6.7' of git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux
git bisect good 8bc9e6515183935fa0cccaf67455c439afe4982b
# bad: [431f1051884e38d2a5751e4731d69b2ff289ee56] Merge tag 'leds-next-6.7' of git://git.kernel.org/pub/scm/linux/kernel/git/lee/leds
git bisect bad 431f1051884e38d2a5751e4731d69b2ff289ee56
# bad: [0364249d2073c32c5214f02866999ce940bc35a2] Merge tag 'for-6.7/dm-changes' of git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm
git bisect bad 0364249d2073c32c5214f02866999ce940bc35a2
# good: [27442758e9b4e083bef3f164a1739475c01f3202] Merge tag 'amd-drm-next-6.7-2023-10-13' of https://gitlab.freedesktop.org/agd5f/linux into drm-next
git bisect good 27442758e9b4e083bef3f164a1739475c01f3202
# bad: [631808095a82e6b6f8410a95f8b12b8d0d38b161] Merge tag 'amd-drm-next-6.7-2023-10-27' of https://gitlab.freedesktop.org/agd5f/linux into drm-next
git bisect bad 631808095a82e6b6f8410a95f8b12b8d0d38b161
# skip: [0ecf4aa32b7896b9160688bdbd20153dc06a50fb] Merge tag 'amd-drm-next-6.7-2023-10-20' of https://gitlab.freedesktop.org/agd5f/linux into drm-next
git bisect skip 0ecf4aa32b7896b9160688bdbd20153dc06a50fb
# good: [74ce0f3873821f12391bcf5469d81583d34f4c6c] accel/ivpu: Fix verbose version of REG_POLL macros
git bisect good 74ce0f3873821f12391bcf5469d81583d34f4c6c
# skip: [3f5ba636d6987ddffeaa056dea1c524da63912f3] Merge tag 'drm-msm-next-2023-10-17' of https://gitlab.freedesktop.org/drm/msm into drm-next
git bisect skip 3f5ba636d6987ddffeaa056dea1c524da63912f3
# good: [a3cd664e7f971b0f33acb3ba790c142669cd34e5] accel/ivpu: Print IPC type string instead of number
git bisect good a3cd664e7f971b0f33acb3ba790c142669cd34e5
# good: [b0b0d811eac6b4c52cb9ad632fa6384cf48869e7] drm/mediatek: Fix coverity issue with unintentional integer overflow
git bisect good b0b0d811eac6b4c52cb9ad632fa6384cf48869e7
# good: [808b43fa7e56e94563b86af2703ba88ee156e3c2] drm/i915/dp_mst: Set connector DSC capabilities and decompression AUX
git bisect good 808b43fa7e56e94563b86af2703ba88ee156e3c2
# skip: [11ae5eb516b656e8a0e4efbea90ea24c152a346d] Merge tag 'topic/vmemdup-user-array-2023-10-24-1' of git://anongit.freedesktop.org/drm/drm into drm-next
git bisect skip 11ae5eb516b656e8a0e4efbea90ea24c152a346d
# good: [a67f7a0b18c09d5b62eafb6d5c2f54e6f6ea6cf1] drm/amd/display: Update SDP VSC colorimetry from DP test automation request
git bisect good a67f7a0b18c09d5b62eafb6d5c2f54e6f6ea6cf1
# good: [dd3dd9829bf9a4ecd55482050745efdd9f7f97fc] drm/amdgpu: Remove unused variables from amdgpu_show_fdinfo
git bisect good dd3dd9829bf9a4ecd55482050745efdd9f7f97fc
# good: [b1abb484417ec8edd68df0c9bf8cb1c1fc035fd2] drm/ci: force-enable CONFIG_MSM_MMCC_8996 as built-in
git bisect good b1abb484417ec8edd68df0c9bf8cb1c1fc035fd2
# good: [5fa8f128462c5b3b20576b12286dca7fe95b3af1] drm/ci: increase i915 job timeout to 1h30m
git bisect good 5fa8f128462c5b3b20576b12286dca7fe95b3af1
# good: [3ddba96b0d7e714dee4db5aed4f7d413be43b4ba] MAINTAINERS: drm/ci: add entries for xfail files
git bisect good 3ddba96b0d7e714dee4db5aed4f7d413be43b4ba
# bad: [b70438004a14f4d0f9890b3297cd66248728546c] drm/amdgpu: move buffer funcs setting up a level
git bisect bad b70438004a14f4d0f9890b3297cd66248728546c
# skip: [56e449603f0ac580700621a356d35d5716a62ce5] drm/sched: Convert the GPU scheduler to variable number of run-queues
git bisect skip 56e449603f0ac580700621a356d35d5716a62ce5
# skip: [c07bf1636f0005f9eb7956404490672286ea59d3] MAINTAINERS: Update the GPU Scheduler email
git bisect skip c07bf1636f0005f9eb7956404490672286ea59d3
# only skipped commits left to test
# possible first bad commit: [b70438004a14f4d0f9890b3297cd66248728546c] drm/amdgpu: move buffer funcs setting up a level
# possible first bad commit: [c07bf1636f0005f9eb7956404490672286ea59d3] MAINTAINERS: Update the GPU Scheduler email
# possible first bad commit: [56e449603f0ac580700621a356d35d5716a62ce5] drm/sched: Convert the GPU scheduler to variable number of run-queues

--=-=-=--
