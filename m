Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3707AF8B91
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 10:29:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A1A910E978;
	Fri,  4 Jul 2025 08:29:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iPS3kRfF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 738DC10E1F8;
 Fri,  4 Jul 2025 08:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751617749; x=1783153749;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=gG26AaTUPpVFlo+hmvLaEPOw27iCEk6y9MznH6i3r6Y=;
 b=iPS3kRfFySw3EtZoHIcCUq6YkPYeoansIvR6L19P+oVsvM3g9aMPXrhs
 88PRlpMCzT0qoXEirxyd+XdaSMjLgCjbGMSM65bM+JcM+bK+mFGG5xCm0
 GNRcWW40uc+5Fm3lxz/rPnW9By3FH/x+hmV9Y1Jegy9tOzycLOYiauQP9
 D4d6F9H98f2k/zkqPjtOtCajYYKtZoN6iGIjgHExiMYgRyz8MXvEZW2+I
 m6lzSj81FRJRvBFENqlHt32tDGtIwNS9ABPGxbfeSDY14opDPa3SEjLhz
 xodK/O3yiLAnbSNZ11OXioLAnvO+t0hZI+/RSAuOInioyOcG0HBh5lQUz Q==;
X-CSE-ConnectionGUID: V2eBbkXcQQm2D+afY1HY4w==
X-CSE-MsgGUID: /7UAvKGqQ+yG1vH7XOpKqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="53875387"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; d="scan'208";a="53875387"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 01:29:08 -0700
X-CSE-ConnectionGUID: UK+Tic1oRWivQ7E1XxZcgA==
X-CSE-MsgGUID: SokHSIpkSIWzveBJV5HGOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; d="scan'208";a="155164725"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.102])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 01:29:04 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Askar Safin <safinaskar@zohomail.com>, regressions
 <regressions@lists.linux.dev>, intel-gfx
 <intel-gfx@lists.freedesktop.org>, kexec <kexec@lists.infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, iommu
 <iommu@lists.linux.dev>, Ben Hutchings <benh@debian.org>
Cc: anushasrivatsa <anusha.srivatsa@intel.com>, joonaslahtinen
 <joonas.lahtinen@linux.intel.com>, tvrtkoursulin
 <tvrtko.ursulin@linux.intel.com>, josesouza <jose.souza@intel.com>,
 davehansen <dave.hansen@linux.intel.com>
Subject: Re: Second kexec_file_load (but not kexec_load) fails on i915 if
 CONFIG_INTEL_IOMMU_DEFAULT_ON=n
In-Reply-To: <197d1dc3bff.c01ddb9024897.1898328361232711826@zohomail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <197d1dc3bff.c01ddb9024897.1898328361232711826@zohomail.com>
Date: Fri, 04 Jul 2025 11:29:01 +0300
Message-ID: <cd3ca680ac5751368941713c1071e04d69544d47@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

On Thu, 03 Jul 2025, Askar Safin <safinaskar@zohomail.com> wrote:
> TL;DR: I found a bug in strange interaction in kexec_file_load (but not k=
exec_load) and i915
> TL;DR#2: Second (sometimes third or forth) kexec (using kexec_file_load) =
fails on my particular hardware
> TL;DR#3: I did 55 expirements, each of them required a lot of boots, in t=
otal I did 1908 boots

Thanks for the detailed debug info. I'm afraid all I can say at this
point is, please file all of this in a bug report as described in
[1]. Please add the drm.debug related options, and attach the dmesgs and
configs in the bug instead of pointing at external sites.

BR,
Jani.


[1] https://drm.pages.freedesktop.org/intel-docs/how-to-file-i915-bugs.html


>
> Okay, so I found a bug. Steps to reproduce:
> - I have Dell Precision 7780
> - I have recent Debian x86_64 sid installed (bug reproducible with both D=
ebian kernels and mainline ones)
> - Bug is reproducible on many kernels, including very recent ones, for ex=
ample 6.15.4
> - Boot system, then do kexec into the same system using kexec_file_load. =
I. e. pass --kexec-file-syscall to "kexec" command
> - Then kexec from this kexec'ed system again (i. e. you should do two kex=
ec's in a row)
> - Then do 3rd kexec, etc
> - Repeat kexec's until you do 100 kexec's or your system start to misbeha=
ve
>
> On my computer the system starts to misbehave after some number of kexec'=
s. This always happens after 2nd kexec attempt.
> I. e. the first kexec is always successful. But second sometimes is not.
> I never was able to perform 100 kexec's in a row.
> After some kexec attempt the system starts to misbehave: oopses, panics, =
locked system, etc.
>
> Notes:
>
> - I tried to bisect "kexec-tools" package, but bisect merely gave me comm=
it, which switched to kexec_file_load as a default.
> Bug is reproducible if we use kexec_file_load, but doesn't reproduce if w=
e use kexec_load
>
> - Bug is reproducible even if we boot via init=3D/bin/bash (note: this me=
ans that initramfs is still part of the boot process). (If we boot to norma=
l GUI, bug is reproducible, too)
>
> - When I reproduce I use this command line: "root=3DUUID=3D... rootflags=
=3Dsubvol=3D... ro init=3D..."
>
> - Debian package "plymouth" is required for reproducing. (It reproduces w=
ith plymouth, but doesn't reproduce without plymouth.) But note that I neve=
r see actual plymouth screen! I. e. presence of
> "plymouth" on the system somehow affects bug reproduciblity despite plymo=
uth animation never actually shown. I don't know why this happens, but I su=
spect that I don't pass "splash" to kernel command line, and thus don't see=
 plymouth screen. But I suspect that plymouth is still included to initramf=
s and from there somehow affects boot process
>
> - Bug reproduces in Debian, but doesn't reproduce in Ubuntu. After a lot =
of expirementing I finally understood why: Ubuntu kernel has CONFIG_INTEL_I=
OMMU_DEFAULT_ON=3Dy, and Debian kernel has not. Additional expirements foun=
d that it is culpit. I. e. the bug is reproducible with CONFIG_INTEL_IOMMU_=
DEFAULT_ON=3Dn and not reproducbile with CONFIG_INTEL_IOMMU_DEFAULT_ON=3Dy =
. (So advice for distributions: do what Ubuntu does, i. e. set CONFIG_INTEL=
_IOMMU_DEFAULT_ON=3Dy to hide this bug)
>
> - Bug is not reproducible in old enough kernels, so I did bisect on Linux=
. Bisect showed me these commits: d4a2393049..4a75f32fc7. I. e. bug is repr=
oducible in 4a75f32fc7, but doesn't reproduce in d4a2393049. Between them t=
here is a middle commit 52407c220c44c8dcc6a, which is not testable. Here ar=
e these commits:
>
> commit 4a75f32fc783128d0c42ef73fa62a20379a66828
> Author: Anusha Srivatsa <anusha.srivatsa@intel.com>
>
> =C2=A0 =C2=A0drm/i915/rpl-s: Add PCH Support for Raptor Lake S
>
> commit 52407c220c44c8dcc6aa8aa35ffc8a2db3c849a9
> Author: Anusha Srivatsa <anusha.srivatsa@intel.com>
>
> =C2=A0 =C2=A0drm/i915/rpl-s: Add PCI IDS for Raptor Lake S
>
> It seems these commits merely added support for my Intel GPU model. So th=
is is fake regression. I'm not sure this should be treated as proper regres=
sion and whether regzbot should be notified. (What do you think?)
>
> Still formally this is regression: I did expirements and they show that b=
ug present in 4a75f32fc783128d0c42 and not present before. (Side note: in l=
atest kernels both wayland and x11 work, in d4a2393049 x11 works and waylan=
d doesn't.)
>
> I tried to reproduce the bug in Qemu, but I was unable to do so. It seems=
 Intel GPU is required, maybe even my particular model.
>
> Here is "lspci -vnn -d :*:0300" for my GPU:
>
> 00:02.0 VGA compatible controller [0300]: Intel Corporation Raptor Lake-S=
 UHD Graphics [8086:a788] (rev 04) (prog-if 00 [VGA controller])
>         Subsystem: Dell Raptor Lake-S UHD Graphics [1028:0c42]
>         Flags: bus master, fast devsel, latency 0, IRQ 202, IOMMU group 0
>         Memory at 604b000000 (64-bit, non-prefetchable) [size=3D16M]
>         Memory at 4000000000 (64-bit, prefetchable) [size=3D256M]
>         I/O ports at 3000 [size=3D64]
>         Expansion ROM at 000c0000 [virtual] [disabled] [size=3D128K]
>         Capabilities: [40] Vendor Specific Information: Len=3D0c <?>
>         Capabilities: [70] Express Root Complex Integrated Endpoint, MSI =
00
>         Capabilities: [ac] MSI: Enable+ Count=3D1/1 Maskable+ 64bit-
>         Capabilities: [d0] Power Management version 2
>         Capabilities: [100] Process Address Space ID (PASID)
>         Capabilities: [200] Address Translation Service (ATS)
>         Capabilities: [300] Page Request Interface (PRI)
>         Capabilities: [320] Single Root I/O Virtualization (SR-IOV)
>         Kernel driver in use: i915
>         Kernel modules: i915
>
> dmidecode:
> https://zerobin.net/?aebea072b93d8122#z4W9URnV+k9ZZErhP4etQkxlfpyRKf++uKM=
NoO5PGjs=3D
>
> - I use "root=3DUUID=3D... rootflags=3Dsubvol=3D... ro init=3D..." as a c=
ommand line for reproducing. If I add "recovery nomodeset dis_ucode_ldr" (t=
his is options used by Ubuntu in recovery mode), the bug stops to reproduce
>
> Again, in short, full list of things required for successful reproducing:
> - Intel GPU, possibly my particular model
> - Kernel with support for my model (4a75f32fc783128d0c42 and later up to =
6.15.4)
> - Kexec at least two times. (One kexec never fails, 100 kexec's in a row =
never succeed)
> - kexec_file_load as opposed to kexec_load
> - Initramfs
> - Lack of parameters "recovery nomodeset dis_ucode_ldr" (i. e. one of the=
m stops reproducing)
> - plymouth
> - CONFIG_INTEL_IOMMU_DEFAULT_ON=3Dn
>
> Removing of ANY of them stops the bug, and I proved this by lots of expir=
ements.
>
> In total I did 55+ expirements, each of them required up to 100 boots. In=
 total I did 1908 (!!!!!!) boots on my physical laptop (I mean kexec boots =
here). No, I'm not faking this number, here is my actual directories with r=
esults:
>
> user@subvolume:~$ ls /rbt/kx-results/
> @rec-2025-06-29T201723Z-bad-4    @rec-2025-06-29T214650Z-good-60  @rec-20=
25-07-03T050626Z-bad-41    @rec-2025-07-03T104125Z-bad-28    @rec-2025-07-0=
3T133705Z-bad-3
> @rec-2025-06-29T203429Z-good-60  @rec-2025-06-29T215558Z-bad-8    @rec-20=
25-07-03T060107Z-good-100  @rec-2025-07-03T111727Z-bad-13    @rec-2025-07-0=
3T141647Z-good-100
> @rec-2025-06-29T205626Z-good-60  @rec-2025-07-01T042949Z-bad-12   @rec-20=
25-07-03T074810Z-good-100  @rec-2025-07-03T122242Z-good-100  @rec-2025-07-0=
3T145705Z-good-100
> @rec-2025-06-29T211612Z-bad-6    @rec-2025-07-02T120101Z-good-60  @rec-20=
25-07-03T082914Z-good-100  @rec-2025-07-03T123958Z-bad-12    @rec-2025-07-0=
3T152406Z-bad-50
> @rec-2025-06-29T212932Z-good-60  @rec-2025-07-03T031038Z-good-60  @rec-20=
25-07-03T100615Z-good-100  @rec-2025-07-03T132116Z-good-100  @rec-2025-07-0=
3T154204Z-bad-15
> user@subvolume:~$ ls /rbt/kx-manual-testing/
> 2025-07-01-03-19-good-6  2025-07-01-03-56-good-4  2025-07-01-05-28-bad-3 =
 2025-07-01-06-35-bad-2  2025-07-01-09-46-good-8
> 2025-07-01-03-44-good-3  2025-07-01-04-47-good-3  2025-07-01-06-19-bad-2 =
 2025-07-01-09-21-bad-2  2025-07-02-13-09-good
> user@subvolume:~$ ls /rbt/kx-vanilla-results/
> 2025-06-30T005219Z_5.16.0-kx-df0cc57e057f18e4-3e17eec5ff024b63_1626_good_=
60      2025-06-30T023542Z_5.16.0-rc2-kx-87bb2a410dcfb617-9f30253daecd39e5_=
1663_bad_4
> 2025-06-30T012313Z_5.17.0-kx-f443e374ae131c16-91b07dce12a83fab_1674_bad_1=
        2025-06-30T032312Z_5.16.0-rc2-kx-c9ee950a2ca55ea0-854a1f40ce042801_=
1662_bad_6
> 2025-06-30T013555Z_5.16.0-kx-22ef12195e13c5ec-9aaf880b25942f2a_1668_bad_7=
        2025-06-30T033528Z_5.16.0-rc2-kx-ba884a411700dc56-854a1f40ce042801_=
1662_good_60
> 2025-06-30T014106Z_5.16.0-kx-9bcbf894b6872216-b828905f3cf12050_1664_bad_2=
        2025-06-30T034645Z_5.16.0-rc2-kx-d4a23930490df39f-854a1f40ce042801_=
1662_good_60
> 2025-06-30T014634Z_5.16.0-rc5-kx-cb6846fbb83b574c-83e7c6cf2ede57b4_1663_b=
ad_6    2025-06-30T035232Z_5.16.0-rc2-kx-4a75f32fc783128d-854a1f40ce042801_=
1662_bad_5
> 2025-06-30T015713Z_5.16.0-rc2-kx-15bb79910fe734ad-9f30253daecd39e5_1663_g=
ood_60  2025-06-30T042058Z_5.16.0-rc2-kx-4a75f32fc783128d-854a1f40ce042801_=
1662_bad_1
> 2025-06-30T020235Z_5.16.0-rc5-kx-b06103b5325364e0-26176b9b704a5c24_1664_b=
ad_6    2025-06-30T050000Z_6.15.4-kx-e60eb441596d1c70-2378f4efc5e956e5_2366=
_bad_2
> 2025-06-30T020717Z_5.16.0-rc5-kx-eacef9fd61dcf5ea-26176b9b704a5c24_1664_b=
ad_1    2025-06-30T053011Z_6.15.4-kx-e60eb441596d1c70-2378f4efc5e956e5_2366=
_good_60
> 2025-06-30T021738Z_5.16.0-rc2-kx-67b858dd89932086-8d2f1d17f1e1933c_1662_g=
ood_60  2025-06-30T060619Z_5.16.0-rc2-kx-d4a23930490df39f-854a1f40ce042801_=
1662_good_60
> 2025-06-30T022759Z_5.16.0-rc2-kx-17815f624a90579a-854a1f40ce042801_1662_g=
ood_60  2025-06-30T061448Z_5.16.0-rc2-kx-4a75f32fc783128d-854a1f40ce042801_=
1662_bad_1
>
> Each number in the end of file/directory name is number of boots. In tota=
l we have 1908 boots. Testing was mostly automatical, using my script.
>
> Here is one example dmesg from mainline commit e60eb441596d1c70 (somewher=
e around 6.15.4):
>
> https://zerobin.net/?119ff118fd47b363#BpziYs6dNz5PaT7H8w2hlveoEYa4DDtITGk=
yd9o57LE=3D
>
> This is was dmesg from 2nd (and in the same time last) boot. The next boo=
t (i. e. kexec) was unsuccessful. Corresponding config:
>
> https://zerobin.net/?009c807e1df41af8#gnmrswlbaFbdPTuzNq6NFkQd/Jhb3Ds0ZlL=
iwNanXnc=3D
>
> If you want results from all expirements, here is a link: https://filebin=
.net/45g2757b2iwaeen7 (1 Mb, expires after 7 days). Usually expirements com=
e with full reproducer script.
>
> But what I described above is already enough, I think this link is not ne=
eded.
>
> I will be available for testing in coming days, then I will switch to oth=
er things, and so will not be available for testing.
> If you want more time, then, please, ask for it, i. e. say me something l=
ike "Please, be available for testing in more 10 days".
>
> --
> Askar Safin
> https://types.pl/@safinaskar
>

--=20
Jani Nikula, Intel
