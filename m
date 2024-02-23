Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8A8861631
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 16:46:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D26510EC42;
	Fri, 23 Feb 2024 15:46:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="uIirtlHU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2A3F10EC42;
 Fri, 23 Feb 2024 15:46:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 024E9634F7;
 Fri, 23 Feb 2024 15:46:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B61CC433F1;
 Fri, 23 Feb 2024 15:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708703201;
 bh=3K1YElhmGqBFBiWcDwhwhoj2GW63wMKrK52rUUQ+rtM=;
 h=Date:From:To:CC:Subject:In-Reply-To:References:From;
 b=uIirtlHUpC1FGughklquX9RfUKvNSJRmLfGw1z6KEj84g2kNdfMf0OHxDtvMYlRpc
 jpCHdbxXBGrv7CNMzN2Pic348dI8sAkJ6cvSJ+G353tThgHm/WNhaS914LXko7/3TG
 CtYyjFrH3MQN0YMDAs1xk/NR8jYopK86es26QS4ut9XvudOIUQcFfBbf2nbfgO4pav
 QEOyyt5BKwN0fn0mON21uiGer6nB4Kt54Vg1qv3eKHZpU1FsED3euVNchv4nbZs014
 dchJL+OVNuKY+58W/itQGCUXYuUMf3UoGk2ge41JIuP4vW5A102AdbStULbdkKbjxW
 U7S1sJP8HwoWg==
Date: Fri, 23 Feb 2024 07:46:40 -0800
From: Kees Cook <kees@kernel.org>
To: kernel test robot <lkp@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>,
 dri-devel@lists.freedesktop.org, io-uring@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 linux-hardening@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-sound@vger.kernel.org, mhi@lists.linux.dev,
 nouveau@lists.freedesktop.org, ntfs3@lists.linux.dev,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: =?US-ASCII?Q?Re=3A_=5Blinux-next=3Amaster=5D_BUILD_REGRESSION?=
 =?US-ASCII?Q?_e31185ce00a96232308300008db193416ceb9769?=
User-Agent: K-9 Mail for Android
In-Reply-To: <202402231222.DVB9DC74-lkp@intel.com>
References: <202402231222.DVB9DC74-lkp@intel.com>
Message-ID: <3532AACB-176A-4C48-9855-CCD6C97FDE91@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
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



On February 22, 2024 8:29:28 PM PST, kernel test robot <lkp@intel=2Ecom> w=
rote:
>tree/branch: https://git=2Ekernel=2Eorg/pub/scm/linux/kernel/git/next/lin=
ux-next=2Egit master
>branch HEAD: e31185ce00a96232308300008db193416ceb9769  Add linux-next spe=
cific files for 20240222
>
>Error/Warning reports:
>
>https://lore=2Ekernel=2Eorg/oe-kbuild-all/202402222223=2Eh9rFmYj4-lkp@int=
el=2Ecom
>https://lore=2Ekernel=2Eorg/oe-kbuild-all/202402222314=2EJ6A7eb4B-lkp@int=
el=2Ecom
>https://lore=2Ekernel=2Eorg/oe-kbuild-all/202402230537=2E2s6Nhfsn-lkp@int=
el=2Ecom
>
>Error/Warning: (recently discovered and may have been fixed)
>
>arch/arm/boot/compressed/misc=2Ec:157:6: warning: no previous prototype f=
or function '__fortify_panic' [-Wmissing-prototypes]
>arch/arm/boot/compressed/misc=2Eh:13:36: error: macro "fortify_panic" req=
uires 2 arguments, but only 1 given

This is fixed for the subsequent -next tree=2E

>arch/sh/boot/compressed/=2E=2E/=2E=2E/=2E=2E/=2E=2E/lib/decompress_unxz=
=2Ec:350:(=2Etext+0x20b4): undefined reference to `__ubsan_handle_out_of_bo=
unds'
>sh4-linux-ld: arch/sh/boot/compressed/=2E=2E/=2E=2E/=2E=2E/=2E=2E/lib/xz/=
xz_dec_lzma2=2Ec:751:(=2Etext+0x904): undefined reference to `__ubsan_handl=
e_out_of_bounds'

This is fixed here and is waiting to land:
https://lore=2Ekernel=2Eorg/linux-hardening/20240130232717=2Ework=2E088-ke=
es@kernel=2Eorg/

-Kees

--=20
Kees Cook
