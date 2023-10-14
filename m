Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7ADD7C9724
	for <lists+dri-devel@lfdr.de>; Sun, 15 Oct 2023 00:54:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17ADA10E0E0;
	Sat, 14 Oct 2023 22:54:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa2d.google.com (mail-vk1-xa2d.google.com
 [IPv6:2607:f8b0:4864:20::a2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 200B810E00F;
 Sat, 14 Oct 2023 22:54:36 +0000 (UTC)
Received: by mail-vk1-xa2d.google.com with SMTP id
 71dfb90a1353d-49d55b90a5aso2214865e0c.0; 
 Sat, 14 Oct 2023 15:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697324075; x=1697928875; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E3dgwAPbWgceK8XnpO8ceX742rck1tlUzuW6UkEbMaQ=;
 b=ePrDhLbtJ4Exoer2Js7/+nfAlFKJ5MDzZ/EQ5O/p7q078RZeftkitF8aF37pBXYGDf
 NfVnvtfj8Wc2UhIAUgtK2/0rp5I0hcC0BlONIFHL4qTNedSuQUpgn/bDL5ku8IFiWfJn
 kAMGZ4lA6HwjcrDOYsdqC3ysXrdJFB2HFRiwJqpU9ecNEJib3UygXPfwLcYsjBwT//EV
 SzUVOO8J/QN/5a8qXj2fNrjs/3/jezC63EYmPD8piYQa0x9XBh6/aAegr/SibwmMFHGN
 GtcvS1B7jdydrgD2YB6UibUhEvnaFWXU7Uu2koItKYgIGUzKFOw+V8mp6711u9wy9245
 tx3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697324075; x=1697928875;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E3dgwAPbWgceK8XnpO8ceX742rck1tlUzuW6UkEbMaQ=;
 b=m1JD1ak5G5nZq2Z5MUeoW+pKB7HEtIdAiJlCMxAkzg180FqxKB+5iqBtIKC3+6WaZP
 rt5NAa2uzRzzEIXH0L6poMWjybQNOB+Tk6LfURBRa9KTvBv6uqvq9ciRWMB2QHpmT+Kt
 w8qJPb4RFFNU3PvDakNoqubt/HeqVjAyE7YT481HwEjdXxLUn1MjkJdpB5XRWx3BemLN
 HvxbfWniGkFsfWFANdozNVlFm20iXpDv7uiF/hFsZssOLzuuz4chemW9EgCAIBsDLSeM
 PULzHrnDqeCl9K3tno2fWe5SNFUwVVW3vvzDQfmRmAQ1hXUTxzNHNFadAxag2k8aPx6d
 mbpg==
X-Gm-Message-State: AOJu0YxNkJb1E0rvbn+/2HF5Qp64vvs4d+FF6Zb+JDpMckEaQhq5RkRg
 teHmdbJNRfCIC7yIHDoPBW0fLEYpRbktjtVU/w8SgrVoSsfwDQ==
X-Google-Smtp-Source: AGHT+IFfT3nqs45wSlTdh49Mfqnd7iS4fm3NazMXcrcNd0WEk8mfYCYz456yTKkBrC2Rm6aiZ0xPlI+0DL8Ucy3wF44=
X-Received: by 2002:a05:6122:1681:b0:49a:b587:ab79 with SMTP id
 1-20020a056122168100b0049ab587ab79mr2277741vkl.8.1697324075009; Sat, 14 Oct
 2023 15:54:35 -0700 (PDT)
MIME-Version: 1.0
References: <20231013224818.3456409-1-jim.cromie@gmail.com>
In-Reply-To: <20231013224818.3456409-1-jim.cromie@gmail.com>
From: jim.cromie@gmail.com
Date: Sat, 14 Oct 2023 16:54:08 -0600
Message-ID: <CAJfuBxxc1HxYNbp1vdkh8yTOTHV-5ohskCA-twx5Uf2SmWTffg@mail.gmail.com>
Subject: Re: [PATCH v7b 00/25] fix DRM_USE_DYNAMIC_DEBUG=y regression
To: linux-kernel@vger.kernel.org, jbaron@akamai.com, 
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org
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
Cc: lb@semihalf.com, groeck@google.com, linux-doc@vger.kernel.org,
 jani.nikula@intel.com, daniel.vetter@ffwll.ch, linux@rasmusvillemoes.dk,
 mcgrof@kernel.org, seanpaul@chromium.org, joe@perches.com, bleung@google.com,
 yanivt@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 13, 2023 at 4:48=E2=80=AFPM Jim Cromie <jim.cromie@gmail.com> w=
rote:
>
> hi Jason, DRM-folk
>
> (now with checkpatch fixes)

I missed fixing boxed-vector, am just dropping it.

>
> This patchest fixes the chicken-egg initialization problem in the 1st
> version of ddebug-class-maps, that DRM-CI uncovered.
>
> The root-problem was DECLARE_DYNDBG_CLASSMAP, which broke the K&R rule:
> "define once, refer many".  In patch 14 it is replaced by:
>
>  DYNDBG_CLASSMAP_DEFINE - define and export a struct ddebug_class_map
>  DYNDBG_CLASSMAP_USE - ref the exported struct
>
> test-dynamic-debug is also extended with a -submod.ko, in order to
> recapitulate the drm & drivers initialization scenario.
>
> They're on v6.6-rc5 now, and apply cleanly to drm-tip/drm-tip.
>
> Ive been running recent revs on rc3+, on my desktop and laptop.
>
> The final blocker was a missing __align(8) on the ddebug_class_user
> record inserted by DYNDBG_CLASSMAP_USE.  This caused DRM=3Dy (builtin
> only) to have a corrupt record for drm_kms_helper (builtin dependent).
> Curiously, a clang build did not exhibit this problem.
>

>
> Widespread testing is appreciated.
> I have scripts if anyone wants them.
>
> I'll forward lkp-robot reports here when I get them.
> Patches also at https://github.com/jimc/linux (dd-fix-7b)
>

Date: Sat, 14 Oct 2023 18:22:28 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Subject: [jimc:dd-fix-7a] BUILD SUCCESS 8e96f63f570a462b859876601a5f795a159=
99f6b
Message-ID: <202310141826.AN7MAD40-lkp@intel.com>
User-Agent: s-nail v14.9.24

tree/branch: https://github.com/jimc/linux.git dd-fix-7a
branch HEAD: 8e96f63f570a462b859876601a5f795a15999f6b  drm: restore
CONFIG_DRM_USE_DYNAMIC_DEBUG un-BROKEN

elapsed time: 3187m

configs tested: 103
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc
alpha                            allyesconfig   gcc
alpha                               defconfig   gcc
arc                              allmodconfig   gcc
arc                               allnoconfig   gcc
arc                              allyesconfig   gcc
arc                                 defconfig   gcc
arc                   randconfig-001-20231012   gcc
arm                              allmodconfig   gcc
arm                               allnoconfig   gcc
arm                              allyesconfig   gcc
arm                                 defconfig   gcc
arm                   randconfig-001-20231013   gcc
arm64                            allmodconfig   gcc
arm64                             allnoconfig   gcc
arm64                            allyesconfig   gcc
arm64                               defconfig   gcc
csky                             allmodconfig   gcc
csky                              allnoconfig   gcc
csky                             allyesconfig   gcc
csky                                defconfig   gcc
i386                             allmodconfig   gcc
i386                              allnoconfig   gcc
i386                             allyesconfig   gcc
i386                              debian-10.3   gcc
i386                                defconfig   gcc
i386                  randconfig-001-20231013   gcc
i386                  randconfig-002-20231013   gcc
i386                  randconfig-003-20231013   gcc
i386                  randconfig-004-20231013   gcc
i386                  randconfig-005-20231013   gcc
i386                  randconfig-006-20231013   gcc
loongarch                        allmodconfig   gcc
loongarch                         allnoconfig   gcc
loongarch                        allyesconfig   gcc
loongarch                           defconfig   gcc
loongarch             randconfig-001-20231012   gcc
m68k                             allmodconfig   gcc
m68k                              allnoconfig   gcc
m68k                             allyesconfig   gcc
m68k                                defconfig   gcc
microblaze                       allmodconfig   gcc
microblaze                        allnoconfig   gcc
microblaze                       allyesconfig   gcc
microblaze                          defconfig   gcc
mips                             allmodconfig   gcc
mips                              allnoconfig   gcc
mips                             allyesconfig   gcc
nios2                            allmodconfig   gcc
nios2                             allnoconfig   gcc
nios2                            allyesconfig   gcc
nios2                               defconfig   gcc
openrisc                         allmodconfig   gcc
openrisc                          allnoconfig   gcc
openrisc                         allyesconfig   gcc
openrisc                            defconfig   gcc
parisc                           allmodconfig   gcc
parisc                            allnoconfig   gcc
parisc                           allyesconfig   gcc
parisc                              defconfig   gcc
parisc64                            defconfig   gcc
powerpc                           allnoconfig   gcc
powerpc                          allyesconfig   gcc
riscv                            allmodconfig   gcc
riscv                             allnoconfig   gcc
riscv                            allyesconfig   gcc
riscv                               defconfig   gcc
riscv                 randconfig-001-20231012   gcc
riscv                          rv32_defconfig   gcc
s390                             allmodconfig   gcc
s390                              allnoconfig   gcc
s390                             allyesconfig   gcc
s390                                defconfig   gcc
s390                  randconfig-001-20231012   gcc
sh                               allmodconfig   gcc
sh                                allnoconfig   gcc
sh                               allyesconfig   gcc
sh                                  defconfig   gcc
sparc                            allmodconfig   gcc
sparc                             allnoconfig   gcc
sparc                            allyesconfig   gcc
sparc                               defconfig   gcc
sparc                 randconfig-001-20231013   gcc
sparc64                          allmodconfig   gcc
sparc64                          allyesconfig   gcc
sparc64                             defconfig   gcc
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc
um                             i386_defconfig   gcc
um                           x86_64_defconfig   gcc
x86_64                            allnoconfig   gcc
x86_64                           allyesconfig   gcc
x86_64                              defconfig   gcc
x86_64                randconfig-001-20231013   gcc
x86_64                randconfig-002-20231013   gcc
x86_64                randconfig-003-20231013   gcc
x86_64                randconfig-004-20231013   gcc
x86_64                randconfig-005-20231013   gcc
x86_64                randconfig-006-20231013   gcc
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


> Jim Cromie (25):

>   dyndbg: add for_each_boxed_vector

Im dropping this one, more trouble than its worth.
hopefully one falls out of flex-array work.
