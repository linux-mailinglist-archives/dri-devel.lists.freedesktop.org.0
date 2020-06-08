Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E531F14A4
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jun 2020 10:44:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAC3C6E0E5;
	Mon,  8 Jun 2020 08:44:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2F1C6E087;
 Mon,  8 Jun 2020 08:44:46 +0000 (UTC)
IronPort-SDR: BAbTiSUofSqTCK2qOi+1UpCnzA86c20635Su73xmT/1PiiyOBSYRqaUd+oadfY2aamx06TIzSo
 JWlZiewIWoiA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2020 01:44:46 -0700
IronPort-SDR: ELbVMt2O8zpR2Xhd1Z0qLTHHJs15KfwSUMnYaEKYxNaETKAtD8j/md/UdwZsLZ0OLfw20vlm2y
 Zy5p8N8aUQZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,487,1583222400"; d="scan'208";a="446659125"
Received: from irsmsx152.ger.corp.intel.com ([163.33.192.66])
 by orsmga005.jf.intel.com with ESMTP; 08 Jun 2020 01:44:43 -0700
Received: from irsmsx603.ger.corp.intel.com (163.33.146.9) by
 IRSMSX152.ger.corp.intel.com (163.33.192.66) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 8 Jun 2020 09:44:42 +0100
Received: from irsmsx603.ger.corp.intel.com (163.33.146.9) by
 irsmsx603.ger.corp.intel.com (163.33.146.9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 8 Jun 2020 09:44:42 +0100
Received: from irsmsx603.ger.corp.intel.com ([163.33.146.9]) by
 irsmsx603.ger.corp.intel.com ([163.33.146.9]) with mapi id 15.01.1713.004;
 Mon, 8 Jun 2020 09:44:42 +0100
From: "Saarinen, Jani" <jani.saarinen@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, David Howells
 <dhowells@redhat.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: RE: [Intel-gfx] A panic and a hang in the i915 drm driver
Thread-Topic: [Intel-gfx] A panic and a hang in the i915 drm driver
Thread-Index: AQHWPGfvz3KF1nPqZEKmcYLA/FtGmqjOSNMAgAAgY7A=
Date: Mon, 8 Jun 2020 08:44:42 +0000
Message-ID: <4ff2445aff8d44c5961a6d194a8f4663@intel.com>
References: <2136072.1591491984@warthog.procyon.org.uk>
 <87o8puxak1.fsf@intel.com>
In-Reply-To: <87o8puxak1.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.2.0.6
dlp-reaction: no-action
dlp-product: dlpe-windows
x-originating-ip: [163.33.253.164]
MIME-Version: 1.0
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
Cc: "dhowells@redhat.com" <dhowells@redhat.com>,
 "airlied@redhat.com" <airlied@redhat.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

HI, =

> -----Original Message-----
> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Ja=
ni Nikula
> Sent: maanantai 8. kes=E4kuuta 2020 10.49
> To: David Howells <dhowells@redhat.com>; Joonas Lahtinen
> <joonas.lahtinen@linux.intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Cc: intel-gfx@lists.freedesktop.org; linux-kernel@vger.kernel.org; dri-
> devel@lists.freedesktop.org; dhowells@redhat.com; airlied@redhat.com
> Subject: Re: [Intel-gfx] A panic and a hang in the i915 drm driver
> =

> On Sun, 07 Jun 2020, David Howells <dhowells@redhat.com> wrote:
> > Hi,
> >
> > I'm seeing the attached oops and panic from the i915 drm driver.  I've =
tried
> > bisecting it, but there's a problem in that one of the merged branches =
causes
> > the machine to hang without output.
It was not this one? =

https://gitlab.freedesktop.org/drm/intel/-/issues/1892


> =

> Cc: Ville and GG, I thought this was fixed (reverted) already.
> =

> BR,
> Jani.
> =

> =

> >
> > The oops for commit c41219fda6e04255c44d37fd2c0d898c1c46abf1 looks like:
> >
> > BUG: kernel NULL pointer dereference, address: 0000000000000000
> > #PF: supervisor read access in kernel mode
> > #PF: error_code(0x0000) - not-present page
> > PGD 0 P4D 0
> > Oops: 0000 [#1] SMP PTI
> > CPU: 2 PID: 1 Comm: swapper/0 Not tainted 5.7.0-rc2-fscache+ #883
> > Hardware name: ASUS All Series/H97-PLUS, BIOS 2306 10/09/2014
> > RIP: 0010:intel_psr_enabled+0xb/0x6e
> > Code: 8b 44 24 08 65 48 33 04 25 28 00 00 00 74 05 e8 7e ff 97 ff 48 83=
 c4 10 5b 5d
> 41 5c 41 5d c3 0f 1f 44 00 00 41 55 41 54 55 53 <48> 8b 9f d8 fe ff ff f6=
 83 5e 08 00
> 00 20 75 05 45 31 e4 eb 44 80
> > RSP: 0000:ffff88840dedfa18 EFLAGS: 00010246
> > RAX: 0000000000000000 RBX: ffff8884086f9000 RCX: 0000000000000000
> > RDX: 0000000000000001 RSI: ffff8884086f9000 RDI: 0000000000000128
> > RBP: ffff8884086fb000 R08: 0000000000000000 R09: 0000000000000001
> > R10: 0000000000000001 R11: 00000000000000ff R12: ffff888408680000
> > R13: 0000000000000000 R14: 0000000000000000 R15: ffff8884086fb200
> > FS:  0000000000000000(0000) GS:ffff88840fb00000(0000)
> knlGS:0000000000000000
> > CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > CR2: 0000000000000000 CR3: 000000000440c001 CR4: 00000000001606e0
> > Call Trace:
> >  intel_read_dp_sdp+0x71/0x2c5
> >  hsw_crt_get_config+0x18/0x41
> >  intel_modeset_readout_hw_state+0x24d/0x662
> >  ? do_raw_spin_lock+0x8b/0xcd
> >  ? _raw_spin_lock_irqsave+0x10/0x16
> >  intel_modeset_setup_hw_state+0xa8/0xb59
> >  ? __next_node_in+0x39/0x42
> >  ? ww_mutex_lock+0x3d/0x1da
> >  ? modeset_lock+0xd4/0x114
> >  ? drm_modeset_lock_all_ctx+0x86/0xcc
> >  intel_modeset_init+0x285/0x5bf
> >  ? intel_irq_postinstall+0x485/0x4d1
> >  i915_driver_probe+0x1b4/0x49c
> >  ? __kernfs_new_node+0x161/0x1b2
> >  ? rpm_resume+0x45e/0x485
> >  i915_pci_probe+0xfd/0x11d
> >  ? __pm_runtime_resume+0x51/0x5e
> >  local_pci_probe+0x39/0x7a
> >  pci_device_probe+0xf5/0x14f
> >  ? sysfs_do_create_link_sd.isra.0+0x77/0xa3
> >  really_probe+0x140/0x2a9
> >  driver_probe_device+0x9c/0xd1
> >  device_driver_attach+0x3c/0x55
> >  __driver_attach+0x97/0x9f
> >  ? device_driver_attach+0x55/0x55
> >  bus_for_each_dev+0x72/0xa8
> >  bus_add_driver+0x108/0x1b9
> >  driver_register+0x9e/0xd7
> >  ? mipi_dsi_bus_init+0x11/0x11
> >  i915_init+0x58/0x6b
> >  do_one_initcall+0x83/0x18a
> >  kernel_init_freeable+0x19b/0x1fd
> >  ? rest_init+0x9f/0x9f
> >  kernel_init+0xa/0xfa
> >  ret_from_fork+0x1f/0x30
> > Modules linked in:
> > CR2: 0000000000000000
> > ---[ end trace d0c4f561618aeb37 ]---
> > RIP: 0010:intel_psr_enabled+0xb/0x6e
> > Code: 8b 44 24 08 65 48 33 04 25 28 00 00 00 74 05 e8 7e ff 97 ff 48 83=
 c4 10 5b 5d
> 41 5c 41 5d c3 0f 1f 44 00 00 41 55 41 54 55 53 <48> 8b 9f d8 fe ff ff f6=
 83 5e 08 00
> 00 20 75 05 45 31 e4 eb 44 80
> > RSP: 0000:ffff88840dedfa18 EFLAGS: 00010246
> > RAX: 0000000000000000 RBX: ffff8884086f9000 RCX: 0000000000000000
> > RDX: 0000000000000001 RSI: ffff8884086f9000 RDI: 0000000000000128
> > RBP: ffff8884086fb000 R08: 0000000000000000 R09: 0000000000000001
> > R10: 0000000000000001 R11: 00000000000000ff R12: ffff888408680000
> > R13: 0000000000000000 R14: 0000000000000000 R15: ffff8884086fb200
> > FS:  0000000000000000(0000) GS:ffff88840fb00000(0000)
> knlGS:0000000000000000
> > CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > CR2: 0000000000000000 CR3: 000000000440c001 CR4: 00000000001606e0
> > Kernel panic - not syncing: Attempted to kill init! exitcode=3D0x000000=
09
> > Kernel Offset: disabled
> > ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=
=3D0x00000009 ]---
> >
> >
> > Decoding the RIP gives:
> >
> > RIP: 0010:intel_psr_enabled (/data/fs/linux-
> fs/build3/../drivers/gpu/drm/i915/display/intel_display_types.h:1595 /dat=
a/fs/linux-
> fs/build3/../drivers/gpu/drm/i915/display/intel_psr.c:1598)
> >
> >
> >
> > Commit c41219fda6e04255c44d37fd2c0d898c1c46abf1 ("Merge tag
> > 'drm-intel-next-fixes-2020-05-20' of
> > git://anongit.freedesktop.org/drm/drm-intel into drm-next") is definite=
ly bad
> > and logs an oops to the console and panics, but it's a merge.
> >
> > On one side is e20bb857dea2f620ff37ae541ed8aee70e3c89f1 ("Merge tag
> > 'exynos-drm-next-for-v5.8' of
> > git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos into
> > drm-next"), which hangs.  This is also a merge.
> >
> > One side of e20bb is f84e1ba336a4f47ae251e4d2d8a694902571b0df
> > ("drm/exynos-vidi: convert platform driver to use dev_groups") which is=
 good.
> >
> > The other side of c4121 and e20bb derive from the same line of commits,=
 with
> > three patches between.  All of these, down to at least
> > 230982d8d8df7f9d9aa216840ea2db1df6ad5d37 ("drm/i915: Update DRIVER_DATE
> to
> > 20200430") cause the machine to hang without any sort of console output.
> >
> > Commit bfbe1744e4417986419236719922a9a7fda224d1 ("Merge tag
> > 'amd-drm-next-5.8-2020-05-19' of git://people.freedesktop.org/~agd5f/li=
nux
> > into drm-next") is good.
> >
> > Commit 47e51832ae93534d872511ba557115722582d94c
> > ("drm/i915/gvt: use context lrc_reg_state for shadow ppgtt override") i=
s good.
> >
> > I've attached the git log and the config file.
> >
> > David
> >
> > git bisect start
> > # bad: [ad09aeb7d10d8003cb208a7d2d8e5c7fa63b767d] afs: Fix file locking
> > git bisect bad ad09aeb7d10d8003cb208a7d2d8e5c7fa63b767d
> > # good: [3d77e6a8804abcc0504c904bd6e5cdf3a5cf8162] Linux 5.7
> > git bisect good 3d77e6a8804abcc0504c904bd6e5cdf3a5cf8162
> > # bad: [2e63f6ce7ed2c4ff83ba30ad9ccad422289a6c63] Merge branch
> 'uaccess.comedi' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs
> > git bisect bad 2e63f6ce7ed2c4ff83ba30ad9ccad422289a6c63
> > # good: [cfa3b8068b09f25037146bfd5eed041b78878bee] Merge tag 'for-linus-
> hmm' of git://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma
> > git bisect good cfa3b8068b09f25037146bfd5eed041b78878bee
> > # bad: [c41219fda6e04255c44d37fd2c0d898c1c46abf1] Merge tag 'drm-intel-=
next-
> fixes-2020-05-20' of git://anongit.freedesktop.org/drm/drm-intel into drm=
-next
> > git bisect bad c41219fda6e04255c44d37fd2c0d898c1c46abf1
> > # good: [937eea297e26effac6809a0bf8c20e6ca9d90b9a] Merge tag 'amd-drm-
> next-5.8-2020-04-24' of git://people.freedesktop.org/~agd5f/linux into dr=
m-next
> > git bisect good 937eea297e26effac6809a0bf8c20e6ca9d90b9a
> > # good: [a1fb548962397bb8609bb46e566809a9a1b30044] Merge tag 'drm-intel-
> next-2020-04-30' of git://anongit.freedesktop.org/drm/drm-intel into drm-=
next
> > git bisect good a1fb548962397bb8609bb46e566809a9a1b30044
> > # good: [f84e1ba336a4f47ae251e4d2d8a694902571b0df] drm/exynos-vidi:
> convert platform driver to use dev_groups
> > git bisect good f84e1ba336a4f47ae251e4d2d8a694902571b0df
> > # skip: [d9162348db12487754e61f73497bdcfcea753590] drm/i915: Introduce
> skl_plane_wm_level accessor.
> > git bisect skip d9162348db12487754e61f73497bdcfcea753590
> > # skip: [84eac0c65940d9633247b0c8c826d4bcb7307351] drm/i915/gt: Force p=
te
> cacheline to main memory
> > git bisect skip 84eac0c65940d9633247b0c8c826d4bcb7307351
> > # skip: [802a5820fc0c0f12b40280db3dbaaf8359b07243] drm/i915: Extract
> i915_cs_timestamp_{ns_to_ticks,tick_to_ns}()
> > git bisect skip 802a5820fc0c0f12b40280db3dbaaf8359b07243
> > # skip: [1c8ee8b92fb6ac9d5975147cc902e8c142eca338] drm/i915/gt: Restore
> Cherryview back to full-ppgtt
> > git bisect skip 1c8ee8b92fb6ac9d5975147cc902e8c142eca338
> > # skip: [2e2701582a8039b2f8a2fa811237ac8ec98355fa] drm/i915: Nuke point=
less
> div by 64bit
> > git bisect skip 2e2701582a8039b2f8a2fa811237ac8ec98355fa
> > # skip: [4a0ca47a8e2fdfb7c9f5b23bba79fa632a5cd8fc] drm/i915/gt: Suspend
> tasklets before resume sanitization
> > git bisect skip 4a0ca47a8e2fdfb7c9f5b23bba79fa632a5cd8fc
> > # skip: [20f505f2253106f695ba6fa0a415159145a8fb2a] drm/i915: Restrict q=
gv
> points which don't have enough bandwidth.
> > git bisect skip 20f505f2253106f695ba6fa0a415159145a8fb2a
> > # skip: [d8d5afe35e3f88f73436f79f974d96a67e879637] drm/i915: Make
> active_pipes check skl specific
> > git bisect skip d8d5afe35e3f88f73436f79f974d96a67e879637
> > # skip: [1be8f347d70b5027b7b223c665756d85feaf36b6] Merge tag 'gvt-next-
> 2020-05-12' of https://github.com/intel/gvt-linux into drm-intel-next-que=
ued
> > git bisect skip 1be8f347d70b5027b7b223c665756d85feaf36b6
> > # skip: [b428d57006663d18e3f6f98644ff9e8702a33ca4] drm/i915/gt: Reset
> execlists registers before HWSP
> > git bisect skip b428d57006663d18e3f6f98644ff9e8702a33ca4
> > # skip: [6b6cd2ebd8d071e55998e32b648bb8081f7f02bb] drm/i915: Mark
> concurrent submissions with a weak-dependency
> > git bisect skip 6b6cd2ebd8d071e55998e32b648bb8081f7f02bb
> > # skip: [1d0a6c8486aa53f7545e80f5f0293ed99e48ffc0] drm/i915: Extract sk=
l SAGV
> checking
> > git bisect skip 1d0a6c8486aa53f7545e80f5f0293ed99e48ffc0
> > # skip: [cafac5a983619944afa639c53f0d5d885616a3d2] drm/i915/dp: Add
> compute routine for DP PSR VSC SDP
> > git bisect skip cafac5a983619944afa639c53f0d5d885616a3d2
> > # skip: [61b088c5374a9f886efa1edbb49ce552bd1f9cba] drm/i915/ehl: Restri=
ct
> w/a 1607087056 for EHL/JSL
> > git bisect skip 61b088c5374a9f886efa1edbb49ce552bd1f9cba
> > # skip: [2045d666ae634f1676660acfb864bcba0e9f86ca] drm/i915: Ignore sub=
mit-
> fences on the same timeline
> > git bisect skip 2045d666ae634f1676660acfb864bcba0e9f86ca
> > # skip: [16e87459673a5cbef35cc0f2e15c664b10a4cdb6] drm/i915/gt: Move the
> batch buffer pool from the engine to the gt
> > git bisect skip 16e87459673a5cbef35cc0f2e15c664b10a4cdb6
> > # skip: [ce58867ee17afecda7917e74a0d10afd7138c6d4] drm/i915: Fix enabled
> infoframe states of lspcon
> > git bisect skip ce58867ee17afecda7917e74a0d10afd7138c6d4
> > # skip: [a211da9c771bf97395a3ced83a3aa383372b13a7] drm/i915/gt: Make
> timeslicing an explicit engine property
> > git bisect skip a211da9c771bf97395a3ced83a3aa383372b13a7
> > # skip: [dee66f3e071b394de16da18e2807f371b789b1be] drm/i915: Add state
> readout for DP HDR Metadata Infoframe SDP
> > git bisect skip dee66f3e071b394de16da18e2807f371b789b1be
> > # skip: [964a9b0f611ee7fedc90641bfcc2efe6ce6206aa] drm/i915/gem: Use
> chained reloc batches
> > git bisect skip 964a9b0f611ee7fedc90641bfcc2efe6ce6206aa
> > # skip: [f1e79c7e183c8e35def44b07ff7ac221fa87bf04] drm/i915: Replace ze=
ro-
> length array with flexible-array
> > git bisect skip f1e79c7e183c8e35def44b07ff7ac221fa87bf04
> > # good: [ab9c21124d6e03460c9c59006a61cc076fefa82e] drm/amdgpu: Add cmd
> to control XGMI link sleep
> > git bisect good ab9c21124d6e03460c9c59006a61cc076fefa82e
> > # skip: [e31fe02eff2610f40ac8d7efe57ec0b881b75508] drm/i915: Make
> intel_timeline_init static
> > git bisect skip e31fe02eff2610f40ac8d7efe57ec0b881b75508
> > # skip: [d96536f0fe699729a0974eb5b65eb0d87cc747e1] drm/i915: Fix AUX po=
wer
> domain toggling across TypeC mode resets
> > git bisect skip d96536f0fe699729a0974eb5b65eb0d87cc747e1
> > # skip: [a80d73673bc7676d0bab7f7ab51d00c5e461992d] drm/i915: Tidy await=
ing
> on dma-fences
> > git bisect skip a80d73673bc7676d0bab7f7ab51d00c5e461992d
> > # skip: [25444ca6cbb9fe375aa9bba58784a735efe2a649] drm/i915/fbc: Require
> linear fb stride to be multiple of 512 bytes on gen9/glk
> > git bisect skip 25444ca6cbb9fe375aa9bba58784a735efe2a649
> > # skip: [795d4d7fa34154fc621c1048f8b92e4f6bd3926f] drm/i915: Mark the
> addition of the initial-breadcrumb in the request
> > git bisect skip 795d4d7fa34154fc621c1048f8b92e4f6bd3926f
> > # skip: [d19b29be653691a179e54aafc84fc40667a63ee7] drm/i915: Nuke
> mode.vrefresh usage
> > git bisect skip d19b29be653691a179e54aafc84fc40667a63ee7
> > # skip: [260a6c1bdf1e072ae4d96f0d1ec2917237f1b627] drm/i915: Fix glk
> watermark calculations
> > git bisect skip 260a6c1bdf1e072ae4d96f0d1ec2917237f1b627
> > # skip: [56f1b31f1dd60db4b02024a13eea45b5bbccc44e] drm/i915: Store CS
> timestamp frequency in Hz
> > git bisect skip 56f1b31f1dd60db4b02024a13eea45b5bbccc44e
> > # skip: [b2379ba2b9c207f6a76b4b8c3d7252a82cfd8f7d] drm/i915: Remove
> duplicate inline specifier on write_pte
> > git bisect skip b2379ba2b9c207f6a76b4b8c3d7252a82cfd8f7d
> > # skip: [0065e5f5cc56136da0be900c4a3121b38a82f37d] drm/i915/display: Wa=
rn if
> the FBC is still writing to stolen on removal
> > git bisect skip 0065e5f5cc56136da0be900c4a3121b38a82f37d
> > # skip: [0398993b82f40ad02d88da7c894e3faae2da3b0a] drm/i915: Stash hpd
> status bits under dev_priv
> > git bisect skip 0398993b82f40ad02d88da7c894e3faae2da3b0a
> > # skip: [7241c57d3140ad3b613777a8515ffe1f653d4800] drm/i915: Add TGL+ S=
AGV
> support
> > git bisect skip 7241c57d3140ad3b613777a8515ffe1f653d4800
> > # skip: [c7e8a3d674fbaa5b12ddc681bdf46c34a27e55d5] drm/i915: Use stashed
> away hpd isr bits in intel_digital_port_connected()
> > git bisect skip c7e8a3d674fbaa5b12ddc681bdf46c34a27e55d5
> > # skip: [f136c58a0de98e1b56483b7fc8c209dba0a496d9] drm/i915: Added requ=
ired
> new PCode commands
> > git bisect skip f136c58a0de98e1b56483b7fc8c209dba0a496d9
> > # skip: [9bad40a27dac1f88012a1e2db0bfc5ae58fa0370] drm/i915/selftests:
> Always flush before unpining after writing
> > git bisect skip 9bad40a27dac1f88012a1e2db0bfc5ae58fa0370
> > # skip: [977253df6433f85d5e2cb3ab0f8eb4127f8173dd] drm/i915/gt: Stop ho=
lding
> onto the pinned_default_state
> > git bisect skip 977253df6433f85d5e2cb3ab0f8eb4127f8173dd
> > # skip: [a1b2eeacbc55573afc56341e08b506aee6451c3d] drm/i915: Remove
> unused HAS_FWTABLE macro
> > git bisect skip a1b2eeacbc55573afc56341e08b506aee6451c3d
> > # skip: [24fe5f2ab2478053d50a3bc629ada895903a5cbc] drm/i915: Propagate
> error from completed fences
> > git bisect skip 24fe5f2ab2478053d50a3bc629ada895903a5cbc
> > # skip: [73e28cc40bf00b5d168cb8f5cff1ae63e9097446] drm/i915: Handle idl=
ing
> during i915_gem_evict_something busy loops
> > git bisect skip 73e28cc40bf00b5d168cb8f5cff1ae63e9097446
> > # skip: [f02ac414ba9497d1887b1de7fe69954284f157ac] Revert "drm/i915/tgl:
> Include ro parts of l3 to invalidate"
> > git bisect skip f02ac414ba9497d1887b1de7fe69954284f157ac
> > # skip: [b0a997ae5248b293b6f6d1996ea49c57f7b94227] drm/i915: Emit
> await(batch) before MI_BB_START
> > git bisect skip b0a997ae5248b293b6f6d1996ea49c57f7b94227
> > # skip: [32d7171ee2ae6e19c63b826904cf62d3d5a7f6fa] drm/i915/gen12: Fix =
HDC
> pipeline flush
> > git bisect skip 32d7171ee2ae6e19c63b826904cf62d3d5a7f6fa
> > # good: [5e7067b24fcf1549c72988dd92de6d17ff3d2077] drm/amdgpu: Add DPM
> function for XGMI link power down control
> > git bisect good 5e7067b24fcf1549c72988dd92de6d17ff3d2077
> > # skip: [d248b371f7479a99caccf91da2ec6adee85e5e70] drm/i915/gen12:
> Invalidate aux table entries forcibly
> > git bisect skip d248b371f7479a99caccf91da2ec6adee85e5e70
> > # good: [b7f0656a25467fc26eb7fc375caf38ee99f5d004] drm/amdgpu: Updated
> XGMI power down control support check
> > git bisect good b7f0656a25467fc26eb7fc375caf38ee99f5d004
> > # good: [4e01847c38f7a5e2b0ffa8ff74d6bf0e85924240] drm/amdgpu: optimize
> amdgpu device attribute code
> > git bisect good 4e01847c38f7a5e2b0ffa8ff74d6bf0e85924240
> > # skip: [f45ce9336ff0640e491c642a84ea02f21daac3a4] video/hdmi: Add Unpa=
ck
> only function for DRM infoframe
> > git bisect skip f45ce9336ff0640e491c642a84ea02f21daac3a4
> > # good: [bfbe1744e4417986419236719922a9a7fda224d1] Merge tag 'amd-drm-
> next-5.8-2020-05-19' of git://people.freedesktop.org/~agd5f/linux into dr=
m-next
> > git bisect good bfbe1744e4417986419236719922a9a7fda224d1
> > # skip: [701f026521980dd0151130f818558e17c608ed2e] drm/i915: Drop
> I915_RESET_TIMEOUT and friends
> > git bisect skip 701f026521980dd0151130f818558e17c608ed2e
> > # skip: [378974f7f9754acfd5630327917c6b813495f1a9] drm/i915: Allow some
> leniency in PCU reads
> > git bisect skip 378974f7f9754acfd5630327917c6b813495f1a9
> > # good: [47e51832ae93534d872511ba557115722582d94c] drm/i915/gvt: use
> context lrc_reg_state for shadow ppgtt override
> > git bisect good 47e51832ae93534d872511ba557115722582d94c
> > # skip: [230982d8d8df7f9d9aa216840ea2db1df6ad5d37] drm/i915: Update
> DRIVER_DATE to 20200430
> > git bisect skip 230982d8d8df7f9d9aa216840ea2db1df6ad5d37
> > #
> > # Automatically generated file; DO NOT EDIT.
> > # Linux/x86_64 5.7.0-rc2 Kernel Configuration
> > #
> >
> > #
> > # Compiler: x86_64-linux-gnu-gcc (GCC) 9.2.1 20190827 (Red Hat Cross 9.=
2.1-3)
> > #
> > CONFIG_CC_IS_GCC=3Dy
> > CONFIG_GCC_VERSION=3D90201
> > CONFIG_LD_VERSION=3D234000000
> > CONFIG_CLANG_VERSION=3D0
> > CONFIG_CC_HAS_ASM_GOTO=3Dy
> > CONFIG_CC_HAS_ASM_INLINE=3Dy
> > CONFIG_CC_HAS_WARN_MAYBE_UNINITIALIZED=3Dy
> > CONFIG_CC_DISABLE_WARN_MAYBE_UNINITIALIZED=3Dy
> > CONFIG_IRQ_WORK=3Dy
> > CONFIG_BUILDTIME_TABLE_SORT=3Dy
> > CONFIG_THREAD_INFO_IN_TASK=3Dy
> >
> > #
> > # General setup
> > #
> > CONFIG_INIT_ENV_ARG_LIMIT=3D32
> > # CONFIG_COMPILE_TEST is not set
> > CONFIG_LOCALVERSION=3D"-fscache"
> > # CONFIG_LOCALVERSION_AUTO is not set
> > CONFIG_BUILD_SALT=3D""
> > CONFIG_HAVE_KERNEL_GZIP=3Dy
> > CONFIG_HAVE_KERNEL_BZIP2=3Dy
> > CONFIG_HAVE_KERNEL_LZMA=3Dy
> > CONFIG_HAVE_KERNEL_XZ=3Dy
> > CONFIG_HAVE_KERNEL_LZO=3Dy
> > CONFIG_HAVE_KERNEL_LZ4=3Dy
> > # CONFIG_KERNEL_GZIP is not set
> > # CONFIG_KERNEL_BZIP2 is not set
> > # CONFIG_KERNEL_LZMA is not set
> > CONFIG_KERNEL_XZ=3Dy
> > # CONFIG_KERNEL_LZO is not set
> > # CONFIG_KERNEL_LZ4 is not set
> > CONFIG_DEFAULT_HOSTNAME=3D"(none)"
> > CONFIG_SWAP=3Dy
> > CONFIG_SYSVIPC=3Dy
> > CONFIG_SYSVIPC_SYSCTL=3Dy
> > CONFIG_POSIX_MQUEUE=3Dy
> > CONFIG_POSIX_MQUEUE_SYSCTL=3Dy
> > CONFIG_CROSS_MEMORY_ATTACH=3Dy
> > # CONFIG_USELIB is not set
> > CONFIG_AUDIT=3Dy
> > CONFIG_HAVE_ARCH_AUDITSYSCALL=3Dy
> > CONFIG_AUDITSYSCALL=3Dy
> >
> > #
> > # IRQ subsystem
> > #
> > CONFIG_GENERIC_IRQ_PROBE=3Dy
> > CONFIG_GENERIC_IRQ_SHOW=3Dy
> > CONFIG_GENERIC_IRQ_EFFECTIVE_AFF_MASK=3Dy
> > CONFIG_GENERIC_PENDING_IRQ=3Dy
> > CONFIG_GENERIC_IRQ_MIGRATION=3Dy
> > CONFIG_HARDIRQS_SW_RESEND=3Dy
> > CONFIG_IRQ_DOMAIN=3Dy
> > CONFIG_IRQ_DOMAIN_HIERARCHY=3Dy
> > CONFIG_GENERIC_MSI_IRQ=3Dy
> > CONFIG_GENERIC_MSI_IRQ_DOMAIN=3Dy
> > CONFIG_GENERIC_IRQ_MATRIX_ALLOCATOR=3Dy
> > CONFIG_GENERIC_IRQ_RESERVATION_MODE=3Dy
> > CONFIG_IRQ_FORCED_THREADING=3Dy
> > CONFIG_SPARSE_IRQ=3Dy
> > # CONFIG_GENERIC_IRQ_DEBUGFS is not set
> > # end of IRQ subsystem
> >
> > CONFIG_CLOCKSOURCE_WATCHDOG=3Dy
> > CONFIG_ARCH_CLOCKSOURCE_INIT=3Dy
> > CONFIG_CLOCKSOURCE_VALIDATE_LAST_CYCLE=3Dy
> > CONFIG_GENERIC_TIME_VSYSCALL=3Dy
> > CONFIG_GENERIC_CLOCKEVENTS=3Dy
> > CONFIG_GENERIC_CLOCKEVENTS_BROADCAST=3Dy
> > CONFIG_GENERIC_CLOCKEVENTS_MIN_ADJUST=3Dy
> > CONFIG_GENERIC_CMOS_UPDATE=3Dy
> >
> > #
> > # Timers subsystem
> > #
> > CONFIG_TICK_ONESHOT=3Dy
> > CONFIG_NO_HZ_COMMON=3Dy
> > # CONFIG_HZ_PERIODIC is not set
> > # CONFIG_NO_HZ_IDLE is not set
> > CONFIG_NO_HZ_FULL=3Dy
> > CONFIG_CONTEXT_TRACKING=3Dy
> > CONFIG_CONTEXT_TRACKING_FORCE=3Dy
> > # CONFIG_NO_HZ is not set
> > CONFIG_HIGH_RES_TIMERS=3Dy
> > # end of Timers subsystem
> >
> > CONFIG_PREEMPT_NONE=3Dy
> > # CONFIG_PREEMPT_VOLUNTARY is not set
> > # CONFIG_PREEMPT is not set
> >
> > #
> > # CPU/Task time and stats accounting
> > #
> > CONFIG_VIRT_CPU_ACCOUNTING=3Dy
> > CONFIG_VIRT_CPU_ACCOUNTING_GEN=3Dy
> > # CONFIG_IRQ_TIME_ACCOUNTING is not set
> > # CONFIG_SCHED_THERMAL_PRESSURE is not set
> > CONFIG_BSD_PROCESS_ACCT=3Dy
> > CONFIG_BSD_PROCESS_ACCT_V3=3Dy
> > CONFIG_TASKSTATS=3Dy
> > CONFIG_TASK_DELAY_ACCT=3Dy
> > CONFIG_TASK_XACCT=3Dy
> > CONFIG_TASK_IO_ACCOUNTING=3Dy
> > # CONFIG_PSI is not set
> > # end of CPU/Task time and stats accounting
> >
> > CONFIG_CPU_ISOLATION=3Dy
> >
> > #
> > # RCU Subsystem
> > #
> > CONFIG_TREE_RCU=3Dy
> > # CONFIG_RCU_EXPERT is not set
> > CONFIG_SRCU=3Dy
> > CONFIG_TREE_SRCU=3Dy
> > CONFIG_RCU_STALL_COMMON=3Dy
> > CONFIG_RCU_NEED_SEGCBLIST=3Dy
> > CONFIG_RCU_NOCB_CPU=3Dy
> > # end of RCU Subsystem
> >
> > CONFIG_BUILD_BIN2C=3Dy
> > # CONFIG_IKCONFIG is not set
> > # CONFIG_IKHEADERS is not set
> > CONFIG_LOG_BUF_SHIFT=3D16
> > CONFIG_LOG_CPU_MAX_BUF_SHIFT=3D12
> > CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=3D13
> > CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=3Dy
> >
> > #
> > # Scheduler features
> > #
> > # CONFIG_UCLAMP_TASK is not set
> > # end of Scheduler features
> >
> > CONFIG_ARCH_SUPPORTS_NUMA_BALANCING=3Dy
> > CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=3Dy
> > CONFIG_CC_HAS_INT128=3Dy
> > CONFIG_ARCH_SUPPORTS_INT128=3Dy
> > # CONFIG_NUMA_BALANCING is not set
> > CONFIG_CGROUPS=3Dy
> > CONFIG_PAGE_COUNTER=3Dy
> > CONFIG_MEMCG=3Dy
> > CONFIG_MEMCG_SWAP=3Dy
> > CONFIG_MEMCG_SWAP_ENABLED=3Dy
> > CONFIG_MEMCG_KMEM=3Dy
> > CONFIG_BLK_CGROUP=3Dy
> > CONFIG_CGROUP_WRITEBACK=3Dy
> > CONFIG_CGROUP_SCHED=3Dy
> > CONFIG_FAIR_GROUP_SCHED=3Dy
> > # CONFIG_CFS_BANDWIDTH is not set
> > # CONFIG_RT_GROUP_SCHED is not set
> > # CONFIG_CGROUP_PIDS is not set
> > CONFIG_CGROUP_RDMA=3Dy
> > CONFIG_CGROUP_FREEZER=3Dy
> > CONFIG_CGROUP_HUGETLB=3Dy
> > CONFIG_CPUSETS=3Dy
> > CONFIG_PROC_PID_CPUSET=3Dy
> > CONFIG_CGROUP_DEVICE=3Dy
> > CONFIG_CGROUP_CPUACCT=3Dy
> > CONFIG_CGROUP_PERF=3Dy
> > # CONFIG_CGROUP_BPF is not set
> > # CONFIG_CGROUP_DEBUG is not set
> > CONFIG_SOCK_CGROUP_DATA=3Dy
> > CONFIG_NAMESPACES=3Dy
> > CONFIG_UTS_NS=3Dy
> > CONFIG_TIME_NS=3Dy
> > CONFIG_IPC_NS=3Dy
> > CONFIG_USER_NS=3Dy
> > CONFIG_PID_NS=3Dy
> > CONFIG_NET_NS=3Dy
> > # CONFIG_CHECKPOINT_RESTORE is not set
> > # CONFIG_SCHED_AUTOGROUP is not set
> > # CONFIG_SYSFS_DEPRECATED is not set
> > CONFIG_RELAY=3Dy
> > CONFIG_BLK_DEV_INITRD=3Dy
> > CONFIG_INITRAMFS_SOURCE=3D""
> > CONFIG_RD_GZIP=3Dy
> > # CONFIG_RD_BZIP2 is not set
> > # CONFIG_RD_LZMA is not set
> > # CONFIG_RD_XZ is not set
> > # CONFIG_RD_LZO is not set
> > # CONFIG_RD_LZ4 is not set
> > # CONFIG_BOOT_CONFIG is not set
> > # CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE is not set
> > CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy
> > CONFIG_SYSCTL=3Dy
> > CONFIG_HAVE_UID16=3Dy
> > CONFIG_SYSCTL_EXCEPTION_TRACE=3Dy
> > CONFIG_HAVE_PCSPKR_PLATFORM=3Dy
> > CONFIG_BPF=3Dy
> > CONFIG_EXPERT=3Dy
> > CONFIG_UID16=3Dy
> > CONFIG_MULTIUSER=3Dy
> > # CONFIG_SGETMASK_SYSCALL is not set
> > # CONFIG_SYSFS_SYSCALL is not set
> > CONFIG_FHANDLE=3Dy
> > CONFIG_POSIX_TIMERS=3Dy
> > CONFIG_PRINTK=3Dy
> > CONFIG_PRINTK_NMI=3Dy
> > CONFIG_BUG=3Dy
> > CONFIG_ELF_CORE=3Dy
> > CONFIG_PCSPKR_PLATFORM=3Dy
> > CONFIG_BASE_FULL=3Dy
> > CONFIG_FUTEX=3Dy
> > CONFIG_FUTEX_PI=3Dy
> > CONFIG_EPOLL=3Dy
> > CONFIG_SIGNALFD=3Dy
> > CONFIG_TIMERFD=3Dy
> > CONFIG_EVENTFD=3Dy
> > CONFIG_SHMEM=3Dy
> > CONFIG_AIO=3Dy
> > # CONFIG_IO_URING is not set
> > CONFIG_ADVISE_SYSCALLS=3Dy
> > CONFIG_MEMBARRIER=3Dy
> > CONFIG_KALLSYMS=3Dy
> > CONFIG_KALLSYMS_ALL=3Dy
> > CONFIG_KALLSYMS_ABSOLUTE_PERCPU=3Dy
> > CONFIG_KALLSYMS_BASE_RELATIVE=3Dy
> > CONFIG_BPF_SYSCALL=3Dy
> > CONFIG_ARCH_WANT_DEFAULT_BPF_JIT=3Dy
> > # CONFIG_USERFAULTFD is not set
> > CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE=3Dy
> > CONFIG_RSEQ=3Dy
> > # CONFIG_DEBUG_RSEQ is not set
> > # CONFIG_EMBEDDED is not set
> > CONFIG_HAVE_PERF_EVENTS=3Dy
> > # CONFIG_PC104 is not set
> >
> > #
> > # Kernel Performance Events And Counters
> > #
> > CONFIG_PERF_EVENTS=3Dy
> > # CONFIG_DEBUG_PERF_USE_VMALLOC is not set
> > # end of Kernel Performance Events And Counters
> >
> > CONFIG_VM_EVENT_COUNTERS=3Dy
> > CONFIG_COMPAT_BRK=3Dy
> > CONFIG_SLAB=3Dy
> > # CONFIG_SLUB is not set
> > # CONFIG_SLOB is not set
> > CONFIG_SLAB_MERGE_DEFAULT=3Dy
> > # CONFIG_SLAB_FREELIST_RANDOM is not set
> > # CONFIG_SHUFFLE_PAGE_ALLOCATOR is not set
> > CONFIG_SYSTEM_DATA_VERIFICATION=3Dy
> > # CONFIG_PROFILING is not set
> > CONFIG_TRACEPOINTS=3Dy
> > # end of General setup
> >
> > CONFIG_64BIT=3Dy
> > CONFIG_X86_64=3Dy
> > CONFIG_X86=3Dy
> > CONFIG_INSTRUCTION_DECODER=3Dy
> > CONFIG_OUTPUT_FORMAT=3D"elf64-x86-64"
> > CONFIG_LOCKDEP_SUPPORT=3Dy
> > CONFIG_STACKTRACE_SUPPORT=3Dy
> > CONFIG_MMU=3Dy
> > CONFIG_ARCH_MMAP_RND_BITS_MIN=3D28
> > CONFIG_ARCH_MMAP_RND_BITS_MAX=3D32
> > CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MIN=3D8
> > CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=3D16
> > CONFIG_GENERIC_ISA_DMA=3Dy
> > CONFIG_GENERIC_BUG=3Dy
> > CONFIG_GENERIC_BUG_RELATIVE_POINTERS=3Dy
> > CONFIG_ARCH_MAY_HAVE_PC_FDC=3Dy
> > CONFIG_GENERIC_CALIBRATE_DELAY=3Dy
> > CONFIG_ARCH_HAS_CPU_RELAX=3Dy
> > CONFIG_ARCH_HAS_CACHE_LINE_SIZE=3Dy
> > CONFIG_ARCH_HAS_FILTER_PGPROT=3Dy
> > CONFIG_HAVE_SETUP_PER_CPU_AREA=3Dy
> > CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=3Dy
> > CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=3Dy
> > CONFIG_ARCH_HIBERNATION_POSSIBLE=3Dy
> > CONFIG_ARCH_SUSPEND_POSSIBLE=3Dy
> > CONFIG_ARCH_WANT_GENERAL_HUGETLB=3Dy
> > CONFIG_ZONE_DMA32=3Dy
> > CONFIG_AUDIT_ARCH=3Dy
> > CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=3Dy
> > CONFIG_HAVE_INTEL_TXT=3Dy
> > CONFIG_X86_64_SMP=3Dy
> > CONFIG_ARCH_SUPPORTS_UPROBES=3Dy
> > CONFIG_FIX_EARLYCON_MEM=3Dy
> > CONFIG_PGTABLE_LEVELS=3D4
> > CONFIG_CC_HAS_SANE_STACKPROTECTOR=3Dy
> >
> > #
> > # Processor type and features
> > #
> > CONFIG_ZONE_DMA=3Dy
> > CONFIG_SMP=3Dy
> > CONFIG_X86_FEATURE_NAMES=3Dy
> > CONFIG_X86_MPPARSE=3Dy
> > # CONFIG_GOLDFISH is not set
> > # CONFIG_RETPOLINE is not set
> > CONFIG_X86_CPU_RESCTRL=3Dy
> > # CONFIG_X86_EXTENDED_PLATFORM is not set
> > # CONFIG_X86_INTEL_LPSS is not set
> > # CONFIG_X86_AMD_PLATFORM_DEVICE is not set
> > CONFIG_IOSF_MBI=3Dy
> > # CONFIG_IOSF_MBI_DEBUG is not set
> > CONFIG_X86_SUPPORTS_MEMORY_FAILURE=3Dy
> > # CONFIG_SCHED_OMIT_FRAME_POINTER is not set
> > # CONFIG_HYPERVISOR_GUEST is not set
> > # CONFIG_MK8 is not set
> > # CONFIG_MPSC is not set
> > CONFIG_MCORE2=3Dy
> > # CONFIG_MATOM is not set
> > # CONFIG_GENERIC_CPU is not set
> > CONFIG_X86_INTERNODE_CACHE_SHIFT=3D6
> > CONFIG_X86_L1_CACHE_SHIFT=3D6
> > CONFIG_X86_INTEL_USERCOPY=3Dy
> > CONFIG_X86_USE_PPRO_CHECKSUM=3Dy
> > CONFIG_X86_P6_NOP=3Dy
> > CONFIG_X86_TSC=3Dy
> > CONFIG_X86_CMPXCHG64=3Dy
> > CONFIG_X86_CMOV=3Dy
> > CONFIG_X86_MINIMUM_CPU_FAMILY=3D64
> > CONFIG_X86_DEBUGCTLMSR=3Dy
> > CONFIG_IA32_FEAT_CTL=3Dy
> > CONFIG_X86_VMX_FEATURE_NAMES=3Dy
> > # CONFIG_PROCESSOR_SELECT is not set
> > CONFIG_CPU_SUP_INTEL=3Dy
> > CONFIG_CPU_SUP_AMD=3Dy
> > CONFIG_CPU_SUP_HYGON=3Dy
> > CONFIG_CPU_SUP_CENTAUR=3Dy
> > CONFIG_CPU_SUP_ZHAOXIN=3Dy
> > CONFIG_HPET_TIMER=3Dy
> > CONFIG_HPET_EMULATE_RTC=3Dy
> > CONFIG_DMI=3Dy
> > CONFIG_GART_IOMMU=3Dy
> > # CONFIG_MAXSMP is not set
> > CONFIG_NR_CPUS_RANGE_BEGIN=3D2
> > CONFIG_NR_CPUS_RANGE_END=3D512
> > CONFIG_NR_CPUS_DEFAULT=3D64
> > CONFIG_NR_CPUS=3D4
> > CONFIG_SCHED_SMT=3Dy
> > CONFIG_SCHED_MC=3Dy
> > CONFIG_SCHED_MC_PRIO=3Dy
> > CONFIG_X86_LOCAL_APIC=3Dy
> > CONFIG_X86_IO_APIC=3Dy
> > # CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS is not set
> > CONFIG_X86_MCE=3Dy
> > # CONFIG_X86_MCELOG_LEGACY is not set
> > CONFIG_X86_MCE_INTEL=3Dy
> > # CONFIG_X86_MCE_AMD is not set
> > CONFIG_X86_MCE_THRESHOLD=3Dy
> > # CONFIG_X86_MCE_INJECT is not set
> > CONFIG_X86_THERMAL_VECTOR=3Dy
> >
> > #
> > # Performance monitoring
> > #
> > CONFIG_PERF_EVENTS_INTEL_UNCORE=3Dy
> > CONFIG_PERF_EVENTS_INTEL_RAPL=3Dy
> > CONFIG_PERF_EVENTS_INTEL_CSTATE=3Dy
> > # CONFIG_PERF_EVENTS_AMD_POWER is not set
> > # end of Performance monitoring
> >
> > CONFIG_X86_16BIT=3Dy
> > CONFIG_X86_ESPFIX64=3Dy
> > CONFIG_X86_VSYSCALL_EMULATION=3Dy
> > # CONFIG_X86_IOPL_IOPERM is not set
> > # CONFIG_I8K is not set
> > # CONFIG_MICROCODE is not set
> > CONFIG_X86_MSR=3Dy
> > CONFIG_X86_CPUID=3Dy
> > # CONFIG_X86_5LEVEL is not set
> > CONFIG_X86_DIRECT_GBPAGES=3Dy
> > # CONFIG_X86_CPA_STATISTICS is not set
> > # CONFIG_AMD_MEM_ENCRYPT is not set
> > CONFIG_NUMA=3Dy
> > # CONFIG_AMD_NUMA is not set
> > CONFIG_X86_64_ACPI_NUMA=3Dy
> > CONFIG_NODES_SPAN_OTHER_NODES=3Dy
> > # CONFIG_NUMA_EMU is not set
> > CONFIG_NODES_SHIFT=3D6
> > CONFIG_ARCH_SPARSEMEM_ENABLE=3Dy
> > CONFIG_ARCH_SPARSEMEM_DEFAULT=3Dy
> > CONFIG_ARCH_SELECT_MEMORY_MODEL=3Dy
> > CONFIG_ARCH_PROC_KCORE_TEXT=3Dy
> > CONFIG_ILLEGAL_POINTER_VALUE=3D0xdead000000000000
> > # CONFIG_X86_PMEM_LEGACY is not set
> > # CONFIG_X86_CHECK_BIOS_CORRUPTION is not set
> > CONFIG_X86_RESERVE_LOW=3D64
> > CONFIG_MTRR=3Dy
> > # CONFIG_MTRR_SANITIZER is not set
> > CONFIG_X86_PAT=3Dy
> > CONFIG_ARCH_USES_PG_UNCACHED=3Dy
> > CONFIG_ARCH_RANDOM=3Dy
> > CONFIG_X86_SMAP=3Dy
> > CONFIG_X86_UMIP=3Dy
> > CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS=3Dy
> > CONFIG_X86_INTEL_TSX_MODE_OFF=3Dy
> > # CONFIG_X86_INTEL_TSX_MODE_ON is not set
> > # CONFIG_X86_INTEL_TSX_MODE_AUTO is not set
> > CONFIG_EFI=3Dy
> > CONFIG_EFI_STUB=3Dy
> > # CONFIG_EFI_MIXED is not set
> > CONFIG_SECCOMP=3Dy
> > # CONFIG_HZ_100 is not set
> > CONFIG_HZ_250=3Dy
> > # CONFIG_HZ_300 is not set
> > # CONFIG_HZ_1000 is not set
> > CONFIG_HZ=3D250
> > CONFIG_SCHED_HRTICK=3Dy
> > CONFIG_KEXEC=3Dy
> > CONFIG_KEXEC_FILE=3Dy
> > CONFIG_ARCH_HAS_KEXEC_PURGATORY=3Dy
> > # CONFIG_KEXEC_SIG is not set
> > # CONFIG_CRASH_DUMP is not set
> > CONFIG_PHYSICAL_START=3D0x1000000
> > CONFIG_RELOCATABLE=3Dy
> > # CONFIG_RANDOMIZE_BASE is not set
> > CONFIG_PHYSICAL_ALIGN=3D0x1000000
> > CONFIG_HOTPLUG_CPU=3Dy
> > # CONFIG_BOOTPARAM_HOTPLUG_CPU0 is not set
> > # CONFIG_DEBUG_HOTPLUG_CPU0 is not set
> > CONFIG_COMPAT_VDSO=3Dy
> > # CONFIG_LEGACY_VSYSCALL_EMULATE is not set
> > CONFIG_LEGACY_VSYSCALL_XONLY=3Dy
> > # CONFIG_LEGACY_VSYSCALL_NONE is not set
> > # CONFIG_CMDLINE_BOOL is not set
> > CONFIG_MODIFY_LDT_SYSCALL=3Dy
> > CONFIG_HAVE_LIVEPATCH=3Dy
> > CONFIG_LIVEPATCH=3Dy
> > # end of Processor type and features
> >
> > CONFIG_ARCH_HAS_ADD_PAGES=3Dy
> > CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=3Dy
> > CONFIG_USE_PERCPU_NUMA_NODE_ID=3Dy
> > CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=3Dy
> > CONFIG_ARCH_ENABLE_HUGEPAGE_MIGRATION=3Dy
> >
> > #
> > # Power management and ACPI options
> > #
> > # CONFIG_SUSPEND is not set
> > # CONFIG_HIBERNATION is not set
> > CONFIG_PM=3Dy
> > # CONFIG_PM_DEBUG is not set
> > CONFIG_PM_CLK=3Dy
> > CONFIG_WQ_POWER_EFFICIENT_DEFAULT=3Dy
> > CONFIG_ENERGY_MODEL=3Dy
> > CONFIG_ARCH_SUPPORTS_ACPI=3Dy
> > CONFIG_ACPI=3Dy
> > CONFIG_ACPI_LEGACY_TABLES_LOOKUP=3Dy
> > CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=3Dy
> > CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=3Dy
> > # CONFIG_ACPI_DEBUGGER is not set
> > CONFIG_ACPI_SPCR_TABLE=3Dy
> > CONFIG_ACPI_LPIT=3Dy
> > # CONFIG_ACPI_PROCFS_POWER is not set
> > CONFIG_ACPI_REV_OVERRIDE_POSSIBLE=3Dy
> > # CONFIG_ACPI_EC_DEBUGFS is not set
> > CONFIG_ACPI_AC=3Dy
> > # CONFIG_ACPI_BATTERY is not set
> > CONFIG_ACPI_BUTTON=3Dy
> > CONFIG_ACPI_VIDEO=3Dy
> > CONFIG_ACPI_FAN=3Dy
> > CONFIG_ACPI_DOCK=3Dy
> > CONFIG_ACPI_CPU_FREQ_PSS=3Dy
> > CONFIG_ACPI_PROCESSOR_CSTATE=3Dy
> > CONFIG_ACPI_PROCESSOR_IDLE=3Dy
> > CONFIG_ACPI_CPPC_LIB=3Dy
> > CONFIG_ACPI_PROCESSOR=3Dy
> > # CONFIG_ACPI_IPMI is not set
> > CONFIG_ACPI_HOTPLUG_CPU=3Dy
> > CONFIG_ACPI_PROCESSOR_AGGREGATOR=3Dy
> > CONFIG_ACPI_THERMAL=3Dy
> > CONFIG_ARCH_HAS_ACPI_TABLE_UPGRADE=3Dy
> > CONFIG_ACPI_TABLE_UPGRADE=3Dy
> > CONFIG_ACPI_DEBUG=3Dy
> > # CONFIG_ACPI_PCI_SLOT is not set
> > CONFIG_ACPI_CONTAINER=3Dy
> > CONFIG_ACPI_HOTPLUG_IOAPIC=3Dy
> > # CONFIG_ACPI_SBS is not set
> > CONFIG_ACPI_HED=3Dy
> > # CONFIG_ACPI_CUSTOM_METHOD is not set
> > # CONFIG_ACPI_BGRT is not set
> > # CONFIG_ACPI_REDUCED_HARDWARE_ONLY is not set
> > # CONFIG_ACPI_NFIT is not set
> > CONFIG_ACPI_NUMA=3Dy
> > # CONFIG_ACPI_HMAT is not set
> > CONFIG_HAVE_ACPI_APEI=3Dy
> > CONFIG_HAVE_ACPI_APEI_NMI=3Dy
> > CONFIG_ACPI_APEI=3Dy
> > CONFIG_ACPI_APEI_GHES=3Dy
> > # CONFIG_ACPI_APEI_PCIEAER is not set
> > CONFIG_ACPI_APEI_EINJ=3Dy
> > # CONFIG_ACPI_APEI_ERST_DEBUG is not set
> > # CONFIG_DPTF_POWER is not set
> > # CONFIG_PMIC_OPREGION is not set
> > # CONFIG_ACPI_CONFIGFS is not set
> > CONFIG_X86_PM_TIMER=3Dy
> > # CONFIG_SFI is not set
> >
> > #
> > # CPU Frequency scaling
> > #
> > CONFIG_CPU_FREQ=3Dy
> > CONFIG_CPU_FREQ_GOV_ATTR_SET=3Dy
> > CONFIG_CPU_FREQ_GOV_COMMON=3Dy
> > CONFIG_CPU_FREQ_STAT=3Dy
> > # CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is not set
> > # CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
> > # CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
> > # CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND is not set
> > CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE=3Dy
> > # CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL is not set
> > CONFIG_CPU_FREQ_GOV_PERFORMANCE=3Dy
> > CONFIG_CPU_FREQ_GOV_POWERSAVE=3Dy
> > CONFIG_CPU_FREQ_GOV_USERSPACE=3Dy
> > CONFIG_CPU_FREQ_GOV_ONDEMAND=3Dy
> > CONFIG_CPU_FREQ_GOV_CONSERVATIVE=3Dy
> > CONFIG_CPU_FREQ_GOV_SCHEDUTIL=3Dy
> >
> > #
> > # CPU frequency scaling drivers
> > #
> > CONFIG_X86_INTEL_PSTATE=3Dy
> > CONFIG_X86_PCC_CPUFREQ=3Dy
> > CONFIG_X86_ACPI_CPUFREQ=3Dy
> > # CONFIG_X86_ACPI_CPUFREQ_CPB is not set
> > # CONFIG_X86_POWERNOW_K8 is not set
> > # CONFIG_X86_AMD_FREQ_SENSITIVITY is not set
> > # CONFIG_X86_SPEEDSTEP_CENTRINO is not set
> > # CONFIG_X86_P4_CLOCKMOD is not set
> >
> > #
> > # shared options
> > #
> > # end of CPU Frequency scaling
> >
> > #
> > # CPU Idle
> > #
> > CONFIG_CPU_IDLE=3Dy
> > CONFIG_CPU_IDLE_GOV_LADDER=3Dy
> > CONFIG_CPU_IDLE_GOV_MENU=3Dy
> > # CONFIG_CPU_IDLE_GOV_TEO is not set
> > # end of CPU Idle
> >
> > CONFIG_INTEL_IDLE=3Dy
> > # end of Power management and ACPI options
> >
> > #
> > # Bus options (PCI etc.)
> > #
> > CONFIG_PCI_DIRECT=3Dy
> > CONFIG_PCI_MMCONFIG=3Dy
> > CONFIG_MMCONF_FAM10H=3Dy
> > # CONFIG_PCI_CNB20LE_QUIRK is not set
> > # CONFIG_ISA_BUS is not set
> > CONFIG_ISA_DMA_API=3Dy
> > CONFIG_AMD_NB=3Dy
> > # CONFIG_X86_SYSFB is not set
> > # end of Bus options (PCI etc.)
> >
> > #
> > # Binary Emulations
> > #
> > CONFIG_IA32_EMULATION=3Dy
> > # CONFIG_X86_X32 is not set
> > CONFIG_COMPAT_32=3Dy
> > CONFIG_COMPAT=3Dy
> > CONFIG_COMPAT_FOR_U64_ALIGNMENT=3Dy
> > CONFIG_SYSVIPC_COMPAT=3Dy
> > # end of Binary Emulations
> >
> > #
> > # Firmware Drivers
> > #
> > # CONFIG_EDD is not set
> > CONFIG_FIRMWARE_MEMMAP=3Dy
> > CONFIG_DMIID=3Dy
> > # CONFIG_DMI_SYSFS is not set
> > CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBACK=3Dy
> > # CONFIG_FW_CFG_SYSFS is not set
> > # CONFIG_GOOGLE_FIRMWARE is not set
> >
> > #
> > # EFI (Extensible Firmware Interface) Support
> > #
> > # CONFIG_EFI_VARS is not set
> > CONFIG_EFI_ESRT=3Dy
> > CONFIG_EFI_RUNTIME_MAP=3Dy
> > # CONFIG_EFI_FAKE_MEMMAP is not set
> > CONFIG_EFI_RUNTIME_WRAPPERS=3Dy
> > # CONFIG_EFI_CAPSULE_LOADER is not set
> > # CONFIG_EFI_TEST is not set
> > # CONFIG_APPLE_PROPERTIES is not set
> > # CONFIG_RESET_ATTACK_MITIGATION is not set
> > # CONFIG_EFI_RCI2_TABLE is not set
> > # CONFIG_EFI_DISABLE_PCI_DMA is not set
> > # end of EFI (Extensible Firmware Interface) Support
> >
> > CONFIG_UEFI_CPER=3Dy
> > CONFIG_UEFI_CPER_X86=3Dy
> > CONFIG_EFI_EARLYCON=3Dy
> >
> > #
> > # Tegra firmware driver
> > #
> > # end of Tegra firmware driver
> > # end of Firmware Drivers
> >
> > CONFIG_HAVE_KVM=3Dy
> > # CONFIG_VIRTUALIZATION is not set
> > CONFIG_AS_AVX512=3Dy
> > CONFIG_AS_SHA1_NI=3Dy
> > CONFIG_AS_SHA256_NI=3Dy
> >
> > #
> > # General architecture-dependent options
> > #
> > CONFIG_CRASH_CORE=3Dy
> > CONFIG_KEXEC_CORE=3Dy
> > CONFIG_HOTPLUG_SMT=3Dy
> > CONFIG_HAVE_OPROFILE=3Dy
> > CONFIG_OPROFILE_NMI_TIMER=3Dy
> > CONFIG_KPROBES=3Dy
> > CONFIG_JUMP_LABEL=3Dy
> > # CONFIG_STATIC_KEYS_SELFTEST is not set
> > CONFIG_OPTPROBES=3Dy
> > CONFIG_KPROBES_ON_FTRACE=3Dy
> > CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=3Dy
> > CONFIG_ARCH_USE_BUILTIN_BSWAP=3Dy
> > CONFIG_KRETPROBES=3Dy
> > CONFIG_HAVE_IOREMAP_PROT=3Dy
> > CONFIG_HAVE_KPROBES=3Dy
> > CONFIG_HAVE_KRETPROBES=3Dy
> > CONFIG_HAVE_OPTPROBES=3Dy
> > CONFIG_HAVE_KPROBES_ON_FTRACE=3Dy
> > CONFIG_HAVE_FUNCTION_ERROR_INJECTION=3Dy
> > CONFIG_HAVE_NMI=3Dy
> > CONFIG_HAVE_ARCH_TRACEHOOK=3Dy
> > CONFIG_HAVE_DMA_CONTIGUOUS=3Dy
> > CONFIG_GENERIC_SMP_IDLE_THREAD=3Dy
> > CONFIG_ARCH_HAS_FORTIFY_SOURCE=3Dy
> > CONFIG_ARCH_HAS_SET_MEMORY=3Dy
> > CONFIG_ARCH_HAS_SET_DIRECT_MAP=3Dy
> > CONFIG_HAVE_ARCH_THREAD_STRUCT_WHITELIST=3Dy
> > CONFIG_ARCH_WANTS_DYNAMIC_TASK_STRUCT=3Dy
> > CONFIG_HAVE_ASM_MODVERSIONS=3Dy
> > CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=3Dy
> > CONFIG_HAVE_RSEQ=3Dy
> > CONFIG_HAVE_FUNCTION_ARG_ACCESS_API=3Dy
> > CONFIG_HAVE_CLK=3Dy
> > CONFIG_HAVE_HW_BREAKPOINT=3Dy
> > CONFIG_HAVE_MIXED_BREAKPOINTS_REGS=3Dy
> > CONFIG_HAVE_USER_RETURN_NOTIFIER=3Dy
> > CONFIG_HAVE_PERF_EVENTS_NMI=3Dy
> > CONFIG_HAVE_HARDLOCKUP_DETECTOR_PERF=3Dy
> > CONFIG_HAVE_PERF_REGS=3Dy
> > CONFIG_HAVE_PERF_USER_STACK_DUMP=3Dy
> > CONFIG_HAVE_ARCH_JUMP_LABEL=3Dy
> > CONFIG_HAVE_ARCH_JUMP_LABEL_RELATIVE=3Dy
> > CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=3Dy
> > CONFIG_HAVE_CMPXCHG_LOCAL=3Dy
> > CONFIG_HAVE_CMPXCHG_DOUBLE=3Dy
> > CONFIG_ARCH_WANT_COMPAT_IPC_PARSE_VERSION=3Dy
> > CONFIG_ARCH_WANT_OLD_COMPAT_IPC=3Dy
> > CONFIG_HAVE_ARCH_SECCOMP_FILTER=3Dy
> > CONFIG_SECCOMP_FILTER=3Dy
> > CONFIG_HAVE_ARCH_STACKLEAK=3Dy
> > CONFIG_HAVE_STACKPROTECTOR=3Dy
> > CONFIG_CC_HAS_STACKPROTECTOR_NONE=3Dy
> > CONFIG_STACKPROTECTOR=3Dy
> > CONFIG_STACKPROTECTOR_STRONG=3Dy
> > CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES=3Dy
> > CONFIG_HAVE_CONTEXT_TRACKING=3Dy
> > CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=3Dy
> > CONFIG_HAVE_IRQ_TIME_ACCOUNTING=3Dy
> > CONFIG_HAVE_MOVE_PMD=3Dy
> > CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=3Dy
> > CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD=3Dy
> > CONFIG_HAVE_ARCH_HUGE_VMAP=3Dy
> > CONFIG_ARCH_WANT_HUGE_PMD_SHARE=3Dy
> > CONFIG_HAVE_ARCH_SOFT_DIRTY=3Dy
> > CONFIG_HAVE_MOD_ARCH_SPECIFIC=3Dy
> > CONFIG_MODULES_USE_ELF_RELA=3Dy
> > CONFIG_HAVE_IRQ_EXIT_ON_IRQ_STACK=3Dy
> > CONFIG_ARCH_HAS_ELF_RANDOMIZE=3Dy
> > CONFIG_HAVE_ARCH_MMAP_RND_BITS=3Dy
> > CONFIG_HAVE_EXIT_THREAD=3Dy
> > CONFIG_ARCH_MMAP_RND_BITS=3D28
> > CONFIG_HAVE_ARCH_MMAP_RND_COMPAT_BITS=3Dy
> > CONFIG_ARCH_MMAP_RND_COMPAT_BITS=3D8
> > CONFIG_HAVE_ARCH_COMPAT_MMAP_BASES=3Dy
> > CONFIG_HAVE_COPY_THREAD_TLS=3Dy
> > CONFIG_HAVE_STACK_VALIDATION=3Dy
> > CONFIG_HAVE_RELIABLE_STACKTRACE=3Dy
> > CONFIG_OLD_SIGSUSPEND3=3Dy
> > CONFIG_COMPAT_OLD_SIGACTION=3Dy
> > CONFIG_COMPAT_32BIT_TIME=3Dy
> > CONFIG_HAVE_ARCH_VMAP_STACK=3Dy
> > # CONFIG_VMAP_STACK is not set
> > CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=3Dy
> > CONFIG_STRICT_KERNEL_RWX=3Dy
> > CONFIG_ARCH_HAS_STRICT_MODULE_RWX=3Dy
> > CONFIG_STRICT_MODULE_RWX=3Dy
> > CONFIG_HAVE_ARCH_PREL32_RELOCATIONS=3Dy
> > CONFIG_ARCH_USE_MEMREMAP_PROT=3Dy
> > # CONFIG_LOCK_EVENT_COUNTS is not set
> > CONFIG_ARCH_HAS_MEM_ENCRYPT=3Dy
> >
> > #
> > # GCOV-based kernel profiling
> > #
> > # CONFIG_GCOV_KERNEL is not set
> > CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=3Dy
> > # end of GCOV-based kernel profiling
> >
> > CONFIG_HAVE_GCC_PLUGINS=3Dy
> > CONFIG_GCC_PLUGINS=3Dy
> > # CONFIG_GCC_PLUGIN_CYC_COMPLEXITY is not set
> > # CONFIG_GCC_PLUGIN_LATENT_ENTROPY is not set
> > # CONFIG_GCC_PLUGIN_RANDSTRUCT is not set
> > # end of General architecture-dependent options
> >
> > CONFIG_RT_MUTEXES=3Dy
> > CONFIG_BASE_SMALL=3D0
> > CONFIG_MODULE_SIG_FORMAT=3Dy
> > CONFIG_MODULES=3Dy
> > # CONFIG_MODULE_FORCE_LOAD is not set
> > CONFIG_MODULE_UNLOAD=3Dy
> > # CONFIG_MODULE_FORCE_UNLOAD is not set
> > # CONFIG_MODVERSIONS is not set
> > # CONFIG_MODULE_SRCVERSION_ALL is not set
> > CONFIG_MODULE_SIG=3Dy
> > # CONFIG_MODULE_SIG_FORCE is not set
> > CONFIG_MODULE_SIG_ALL=3Dy
> > # CONFIG_MODULE_SIG_SHA1 is not set
> > # CONFIG_MODULE_SIG_SHA224 is not set
> > CONFIG_MODULE_SIG_SHA256=3Dy
> > # CONFIG_MODULE_SIG_SHA384 is not set
> > # CONFIG_MODULE_SIG_SHA512 is not set
> > CONFIG_MODULE_SIG_HASH=3D"sha256"
> > # CONFIG_MODULE_COMPRESS is not set
> > # CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS is not set
> > CONFIG_UNUSED_SYMBOLS=3Dy
> > CONFIG_MODULES_TREE_LOOKUP=3Dy
> > CONFIG_BLOCK=3Dy
> > CONFIG_BLK_SCSI_REQUEST=3Dy
> > CONFIG_BLK_DEV_BSG=3Dy
> > # CONFIG_BLK_DEV_BSGLIB is not set
> > # CONFIG_BLK_DEV_INTEGRITY is not set
> > # CONFIG_BLK_DEV_ZONED is not set
> > # CONFIG_BLK_DEV_THROTTLING is not set
> > # CONFIG_BLK_CMDLINE_PARSER is not set
> > # CONFIG_BLK_WBT is not set
> > # CONFIG_BLK_CGROUP_IOLATENCY is not set
> > # CONFIG_BLK_CGROUP_IOCOST is not set
> > CONFIG_BLK_DEBUG_FS=3Dy
> > # CONFIG_BLK_SED_OPAL is not set
> >
> > #
> > # Partition Types
> > #
> > # CONFIG_PARTITION_ADVANCED is not set
> > CONFIG_MSDOS_PARTITION=3Dy
> > CONFIG_EFI_PARTITION=3Dy
> > # end of Partition Types
> >
> > CONFIG_BLOCK_COMPAT=3Dy
> > CONFIG_BLK_MQ_PCI=3Dy
> > CONFIG_BLK_PM=3Dy
> >
> > #
> > # IO Schedulers
> > #
> > CONFIG_MQ_IOSCHED_DEADLINE=3Dy
> > CONFIG_MQ_IOSCHED_KYBER=3Dy
> > # CONFIG_IOSCHED_BFQ is not set
> > # end of IO Schedulers
> >
> > CONFIG_ASN1=3Dy
> > CONFIG_UNINLINE_SPIN_UNLOCK=3Dy
> > CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=3Dy
> > CONFIG_MUTEX_SPIN_ON_OWNER=3Dy
> > CONFIG_RWSEM_SPIN_ON_OWNER=3Dy
> > CONFIG_LOCK_SPIN_ON_OWNER=3Dy
> > CONFIG_ARCH_USE_QUEUED_SPINLOCKS=3Dy
> > CONFIG_QUEUED_SPINLOCKS=3Dy
> > CONFIG_ARCH_USE_QUEUED_RWLOCKS=3Dy
> > CONFIG_QUEUED_RWLOCKS=3Dy
> > CONFIG_ARCH_HAS_SYNC_CORE_BEFORE_USERMODE=3Dy
> > CONFIG_ARCH_HAS_SYSCALL_WRAPPER=3Dy
> > CONFIG_FREEZER=3Dy
> >
> > #
> > # Executable file formats
> > #
> > CONFIG_BINFMT_ELF=3Dy
> > CONFIG_COMPAT_BINFMT_ELF=3Dy
> > CONFIG_ELFCORE=3Dy
> > # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
> > CONFIG_BINFMT_SCRIPT=3Dy
> > CONFIG_BINFMT_MISC=3Dy
> > CONFIG_COREDUMP=3Dy
> > # end of Executable file formats
> >
> > #
> > # Memory Management options
> > #
> > CONFIG_SELECT_MEMORY_MODEL=3Dy
> > CONFIG_SPARSEMEM_MANUAL=3Dy
> > CONFIG_SPARSEMEM=3Dy
> > CONFIG_NEED_MULTIPLE_NODES=3Dy
> > CONFIG_HAVE_MEMORY_PRESENT=3Dy
> > CONFIG_SPARSEMEM_EXTREME=3Dy
> > CONFIG_SPARSEMEM_VMEMMAP_ENABLE=3Dy
> > CONFIG_SPARSEMEM_VMEMMAP=3Dy
> > CONFIG_HAVE_MEMBLOCK_NODE_MAP=3Dy
> > CONFIG_HAVE_FAST_GUP=3Dy
> > # CONFIG_MEMORY_HOTPLUG is not set
> > CONFIG_SPLIT_PTLOCK_CPUS=3D4
> > # CONFIG_COMPACTION is not set
> > # CONFIG_PAGE_REPORTING is not set
> > CONFIG_MIGRATION=3Dy
> > CONFIG_PHYS_ADDR_T_64BIT=3Dy
> > CONFIG_BOUNCE=3Dy
> > CONFIG_VIRT_TO_BUS=3Dy
> > CONFIG_MMU_NOTIFIER=3Dy
> > # CONFIG_KSM is not set
> > CONFIG_DEFAULT_MMAP_MIN_ADDR=3D4096
> > CONFIG_ARCH_SUPPORTS_MEMORY_FAILURE=3Dy
> > # CONFIG_MEMORY_FAILURE is not set
> > # CONFIG_TRANSPARENT_HUGEPAGE is not set
> > CONFIG_ARCH_WANTS_THP_SWAP=3Dy
> > # CONFIG_CLEANCACHE is not set
> > # CONFIG_FRONTSWAP is not set
> > # CONFIG_CMA is not set
> > CONFIG_ZPOOL=3Dm
> > CONFIG_ZBUD=3Dm
> > CONFIG_Z3FOLD=3Dm
> > CONFIG_ZSMALLOC=3Dm
> > # CONFIG_PGTABLE_MAPPING is not set
> > # CONFIG_ZSMALLOC_STAT is not set
> > CONFIG_GENERIC_EARLY_IOREMAP=3Dy
> > # CONFIG_DEFERRED_STRUCT_PAGE_INIT is not set
> > # CONFIG_IDLE_PAGE_TRACKING is not set
> > CONFIG_ARCH_HAS_PTE_DEVMAP=3Dy
> > CONFIG_ARCH_USES_HIGH_VMA_FLAGS=3Dy
> > CONFIG_ARCH_HAS_PKEYS=3Dy
> > # CONFIG_PERCPU_STATS is not set
> > # CONFIG_GUP_BENCHMARK is not set
> > CONFIG_ARCH_HAS_PTE_SPECIAL=3Dy
> > # end of Memory Management options
> >
> > CONFIG_NET=3Dy
> > CONFIG_SKB_EXTENSIONS=3Dy
> >
> > #
> > # Networking options
> > #
> > CONFIG_PACKET=3Dy
> > # CONFIG_PACKET_DIAG is not set
> > CONFIG_UNIX=3Dy
> > CONFIG_UNIX_SCM=3Dy
> > # CONFIG_UNIX_DIAG is not set
> > # CONFIG_TLS is not set
> > CONFIG_XFRM=3Dy
> > CONFIG_XFRM_ALGO=3Dy
> > # CONFIG_XFRM_USER is not set
> > # CONFIG_XFRM_INTERFACE is not set
> > # CONFIG_XFRM_SUB_POLICY is not set
> > # CONFIG_XFRM_MIGRATE is not set
> > # CONFIG_XFRM_STATISTICS is not set
> > CONFIG_XFRM_IPCOMP=3Dy
> > # CONFIG_NET_KEY is not set
> > # CONFIG_XDP_SOCKETS is not set
> > CONFIG_INET=3Dy
> > CONFIG_IP_MULTICAST=3Dy
> > CONFIG_IP_ADVANCED_ROUTER=3Dy
> > CONFIG_IP_FIB_TRIE_STATS=3Dy
> > CONFIG_IP_MULTIPLE_TABLES=3Dy
> > CONFIG_IP_ROUTE_MULTIPATH=3Dy
> > CONFIG_IP_ROUTE_VERBOSE=3Dy
> > # CONFIG_IP_PNP is not set
> > # CONFIG_NET_IPIP is not set
> > # CONFIG_NET_IPGRE_DEMUX is not set
> > # CONFIG_IP_MROUTE is not set
> > # CONFIG_SYN_COOKIES is not set
> > # CONFIG_NET_IPVTI is not set
> > # CONFIG_NET_FOU is not set
> > # CONFIG_INET_AH is not set
> > # CONFIG_INET_ESP is not set
> > # CONFIG_INET_IPCOMP is not set
> > CONFIG_INET_DIAG=3Dy
> > CONFIG_INET_TCP_DIAG=3Dy
> > # CONFIG_INET_UDP_DIAG is not set
> > # CONFIG_INET_RAW_DIAG is not set
> > # CONFIG_INET_DIAG_DESTROY is not set
> > # CONFIG_TCP_CONG_ADVANCED is not set
> > CONFIG_TCP_CONG_CUBIC=3Dy
> > CONFIG_DEFAULT_TCP_CONG=3D"cubic"
> > # CONFIG_TCP_MD5SIG is not set
> > CONFIG_IPV6=3Dy
> > CONFIG_IPV6_ROUTER_PREF=3Dy
> > CONFIG_IPV6_ROUTE_INFO=3Dy
> > CONFIG_IPV6_OPTIMISTIC_DAD=3Dy
> > CONFIG_INET6_AH=3Dy
> > CONFIG_INET6_ESP=3Dy
> > # CONFIG_INET6_ESP_OFFLOAD is not set
> > CONFIG_INET6_IPCOMP=3Dy
> > CONFIG_IPV6_MIP6=3Dy
> > CONFIG_INET6_XFRM_TUNNEL=3Dy
> > CONFIG_INET6_TUNNEL=3Dy
> > # CONFIG_IPV6_VTI is not set
> > # CONFIG_IPV6_SIT is not set
> > # CONFIG_IPV6_TUNNEL is not set
> > CONFIG_IPV6_MULTIPLE_TABLES=3Dy
> > CONFIG_IPV6_SUBTREES=3Dy
> > # CONFIG_IPV6_MROUTE is not set
> > # CONFIG_IPV6_SEG6_LWTUNNEL is not set
> > # CONFIG_IPV6_SEG6_HMAC is not set
> > # CONFIG_IPV6_RPL_LWTUNNEL is not set
> > CONFIG_NETLABEL=3Dy
> > # CONFIG_MPTCP is not set
> > CONFIG_NETWORK_SECMARK=3Dy
> > CONFIG_NET_PTP_CLASSIFY=3Dy
> > # CONFIG_NETWORK_PHY_TIMESTAMPING is not set
> > # CONFIG_NETFILTER is not set
> > # CONFIG_BPFILTER is not set
> > # CONFIG_IP_DCCP is not set
> > CONFIG_IP_SCTP=3Dy
> > # CONFIG_SCTP_DBG_OBJCNT is not set
> > CONFIG_SCTP_DEFAULT_COOKIE_HMAC_MD5=3Dy
> > # CONFIG_SCTP_DEFAULT_COOKIE_HMAC_SHA1 is not set
> > # CONFIG_SCTP_DEFAULT_COOKIE_HMAC_NONE is not set
> > CONFIG_SCTP_COOKIE_HMAC_MD5=3Dy
> > # CONFIG_SCTP_COOKIE_HMAC_SHA1 is not set
> > CONFIG_INET_SCTP_DIAG=3Dy
> > CONFIG_RDS=3Dy
> > CONFIG_RDS_TCP=3Dm
> > # CONFIG_RDS_DEBUG is not set
> > # CONFIG_TIPC is not set
> > # CONFIG_ATM is not set
> > # CONFIG_L2TP is not set
> > CONFIG_STP=3Dy
> > CONFIG_BRIDGE=3Dy
> > CONFIG_BRIDGE_IGMP_SNOOPING=3Dy
> > CONFIG_HAVE_NET_DSA=3Dy
> > # CONFIG_NET_DSA is not set
> > # CONFIG_VLAN_8021Q is not set
> > # CONFIG_DECNET is not set
> > CONFIG_LLC=3Dy
> > # CONFIG_LLC2 is not set
> > # CONFIG_ATALK is not set
> > # CONFIG_X25 is not set
> > # CONFIG_LAPB is not set
> > # CONFIG_PHONET is not set
> > # CONFIG_6LOWPAN is not set
> > # CONFIG_IEEE802154 is not set
> > # CONFIG_NET_SCHED is not set
> > # CONFIG_DCB is not set
> > CONFIG_DNS_RESOLVER=3Dy
> > # CONFIG_BATMAN_ADV is not set
> > # CONFIG_OPENVSWITCH is not set
> > # CONFIG_VSOCKETS is not set
> > CONFIG_NETLINK_DIAG=3Dy
> > # CONFIG_MPLS is not set
> > # CONFIG_NET_NSH is not set
> > # CONFIG_HSR is not set
> > # CONFIG_NET_SWITCHDEV is not set
> > # CONFIG_NET_L3_MASTER_DEV is not set
> > # CONFIG_NET_NCSI is not set
> > CONFIG_RPS=3Dy
> > CONFIG_RFS_ACCEL=3Dy
> > CONFIG_XPS=3Dy
> > CONFIG_CGROUP_NET_PRIO=3Dy
> > CONFIG_CGROUP_NET_CLASSID=3Dy
> > CONFIG_NET_RX_BUSY_POLL=3Dy
> > CONFIG_BQL=3Dy
> > # CONFIG_BPF_JIT is not set
> > CONFIG_NET_FLOW_LIMIT=3Dy
> >
> > #
> > # Network testing
> > #
> > # CONFIG_NET_PKTGEN is not set
> > # CONFIG_NET_DROP_MONITOR is not set
> > # end of Network testing
> > # end of Networking options
> >
> > # CONFIG_HAMRADIO is not set
> > # CONFIG_CAN is not set
> > # CONFIG_BT is not set
> > CONFIG_AF_RXRPC=3Dy
> > CONFIG_AF_RXRPC_IPV6=3Dy
> > # CONFIG_AF_RXRPC_INJECT_LOSS is not set
> > CONFIG_AF_RXRPC_DEBUG=3Dy
> > CONFIG_RXKAD=3Dy
> > # CONFIG_AF_KCM is not set
> > CONFIG_FIB_RULES=3Dy
> > # CONFIG_WIRELESS is not set
> > # CONFIG_WIMAX is not set
> > # CONFIG_RFKILL is not set
> > # CONFIG_NET_9P is not set
> > # CONFIG_CAIF is not set
> > CONFIG_CEPH_LIB=3Dm
> > # CONFIG_CEPH_LIB_PRETTYDEBUG is not set
> > CONFIG_CEPH_LIB_USE_DNS_RESOLVER=3Dy
> > # CONFIG_NFC is not set
> > # CONFIG_PSAMPLE is not set
> > # CONFIG_NET_IFE is not set
> > # CONFIG_LWTUNNEL is not set
> > CONFIG_GRO_CELLS=3Dy
> > # CONFIG_FAILOVER is not set
> > CONFIG_ETHTOOL_NETLINK=3Dy
> > CONFIG_HAVE_EBPF_JIT=3Dy
> >
> > #
> > # Device Drivers
> > #
> > CONFIG_HAVE_EISA=3Dy
> > # CONFIG_EISA is not set
> > CONFIG_HAVE_PCI=3Dy
> > CONFIG_PCI=3Dy
> > CONFIG_PCI_DOMAINS=3Dy
> > CONFIG_PCIEPORTBUS=3Dy
> > CONFIG_PCIEAER=3Dy
> > # CONFIG_PCIEAER_INJECT is not set
> > # CONFIG_PCIE_ECRC is not set
> > CONFIG_PCIEASPM=3Dy
> > CONFIG_PCIEASPM_DEFAULT=3Dy
> > # CONFIG_PCIEASPM_POWERSAVE is not set
> > # CONFIG_PCIEASPM_POWER_SUPERSAVE is not set
> > # CONFIG_PCIEASPM_PERFORMANCE is not set
> > CONFIG_PCIE_PME=3Dy
> > # CONFIG_PCIE_DPC is not set
> > # CONFIG_PCIE_PTM is not set
> > # CONFIG_PCIE_BW is not set
> > CONFIG_PCI_MSI=3Dy
> > CONFIG_PCI_MSI_IRQ_DOMAIN=3Dy
> > CONFIG_PCI_QUIRKS=3Dy
> > # CONFIG_PCI_DEBUG is not set
> > # CONFIG_PCI_STUB is not set
> > CONFIG_PCI_ATS=3Dy
> > CONFIG_PCI_LOCKLESS_CONFIG=3Dy
> > # CONFIG_PCI_IOV is not set
> > CONFIG_PCI_PRI=3Dy
> > CONFIG_PCI_PASID=3Dy
> > CONFIG_PCI_LABEL=3Dy
> > # CONFIG_HOTPLUG_PCI is not set
> >
> > #
> > # PCI controller drivers
> > #
> > # CONFIG_VMD is not set
> >
> > #
> > # DesignWare PCI Core Support
> > #
> > # CONFIG_PCIE_DW_PLAT_HOST is not set
> > # CONFIG_PCI_MESON is not set
> > # end of DesignWare PCI Core Support
> >
> > #
> > # Mobiveil PCIe Core Support
> > #
> > # end of Mobiveil PCIe Core Support
> >
> > #
> > # Cadence PCIe controllers support
> > #
> > # end of Cadence PCIe controllers support
> > # end of PCI controller drivers
> >
> > #
> > # PCI Endpoint
> > #
> > # CONFIG_PCI_ENDPOINT is not set
> > # end of PCI Endpoint
> >
> > #
> > # PCI switch controller drivers
> > #
> > # CONFIG_PCI_SW_SWITCHTEC is not set
> > # end of PCI switch controller drivers
> >
> > # CONFIG_PCCARD is not set
> > # CONFIG_RAPIDIO is not set
> >
> > #
> > # Generic Driver Options
> > #
> > CONFIG_UEVENT_HELPER=3Dy
> > CONFIG_UEVENT_HELPER_PATH=3D"/sbin/hotplug"
> > CONFIG_DEVTMPFS=3Dy
> > CONFIG_DEVTMPFS_MOUNT=3Dy
> > CONFIG_STANDALONE=3Dy
> > CONFIG_PREVENT_FIRMWARE_BUILD=3Dy
> >
> > #
> > # Firmware loader
> > #
> > CONFIG_FW_LOADER=3Dy
> > CONFIG_FW_LOADER_PAGED_BUF=3Dy
> > CONFIG_EXTRA_FIRMWARE=3D""
> > # CONFIG_FW_LOADER_USER_HELPER is not set
> > CONFIG_FW_LOADER_COMPRESS=3Dy
> > # end of Firmware loader
> >
> > CONFIG_ALLOW_DEV_COREDUMP=3Dy
> > # CONFIG_DEBUG_DRIVER is not set
> > # CONFIG_DEBUG_DEVRES is not set
> > # CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
> > # CONFIG_TEST_ASYNC_DRIVER_PROBE is not set
> > CONFIG_GENERIC_CPU_AUTOPROBE=3Dy
> > CONFIG_GENERIC_CPU_VULNERABILITIES=3Dy
> > CONFIG_DMA_SHARED_BUFFER=3Dy
> > # CONFIG_DMA_FENCE_TRACE is not set
> > # end of Generic Driver Options
> >
> > #
> > # Bus devices
> > #
> > # CONFIG_MHI_BUS is not set
> > # end of Bus devices
> >
> > # CONFIG_CONNECTOR is not set
> > # CONFIG_GNSS is not set
> > # CONFIG_MTD is not set
> > # CONFIG_OF is not set
> > CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=3Dy
> > # CONFIG_PARPORT is not set
> > CONFIG_PNP=3Dy
> > # CONFIG_PNP_DEBUG_MESSAGES is not set
> >
> > #
> > # Protocols
> > #
> > CONFIG_PNPACPI=3Dy
> > CONFIG_BLK_DEV=3Dy
> > # CONFIG_BLK_DEV_NULL_BLK is not set
> > # CONFIG_BLK_DEV_FD is not set
> > # CONFIG_BLK_DEV_PCIESSD_MTIP32XX is not set
> > # CONFIG_ZRAM is not set
> > # CONFIG_BLK_DEV_UMEM is not set
> > CONFIG_BLK_DEV_LOOP=3Dy
> > CONFIG_BLK_DEV_LOOP_MIN_COUNT=3D8
> > # CONFIG_BLK_DEV_CRYPTOLOOP is not set
> > # CONFIG_BLK_DEV_DRBD is not set
> > # CONFIG_BLK_DEV_NBD is not set
> > # CONFIG_BLK_DEV_SKD is not set
> > # CONFIG_BLK_DEV_SX8 is not set
> > # CONFIG_BLK_DEV_RAM is not set
> > # CONFIG_CDROM_PKTCDVD is not set
> > # CONFIG_ATA_OVER_ETH is not set
> > CONFIG_BLK_DEV_RBD=3Dm
> > # CONFIG_BLK_DEV_RSXX is not set
> >
> > #
> > # NVME Support
> > #
> > # CONFIG_BLK_DEV_NVME is not set
> > # CONFIG_NVME_FC is not set
> > # CONFIG_NVME_TARGET is not set
> > # end of NVME Support
> >
> > #
> > # Misc devices
> > #
> > # CONFIG_AD525X_DPOT is not set
> > # CONFIG_DUMMY_IRQ is not set
> > # CONFIG_IBM_ASM is not set
> > # CONFIG_PHANTOM is not set
> > # CONFIG_TIFM_CORE is not set
> > # CONFIG_ICS932S401 is not set
> > CONFIG_ENCLOSURE_SERVICES=3Dy
> > # CONFIG_HP_ILO is not set
> > # CONFIG_APDS9802ALS is not set
> > # CONFIG_ISL29003 is not set
> > # CONFIG_ISL29020 is not set
> > # CONFIG_SENSORS_TSL2550 is not set
> > # CONFIG_SENSORS_BH1770 is not set
> > # CONFIG_SENSORS_APDS990X is not set
> > # CONFIG_HMC6352 is not set
> > # CONFIG_DS1682 is not set
> > # CONFIG_SRAM is not set
> > # CONFIG_PCI_ENDPOINT_TEST is not set
> > # CONFIG_XILINX_SDFEC is not set
> > # CONFIG_PVPANIC is not set
> > CONFIG_C2PORT=3Dm
> > # CONFIG_C2PORT_DURAMAR_2150 is not set
> >
> > #
> > # EEPROM support
> > #
> > # CONFIG_EEPROM_AT24 is not set
> > # CONFIG_EEPROM_LEGACY is not set
> > # CONFIG_EEPROM_MAX6875 is not set
> > # CONFIG_EEPROM_93CX6 is not set
> > # CONFIG_EEPROM_IDT_89HPESX is not set
> > # CONFIG_EEPROM_EE1004 is not set
> > # end of EEPROM support
> >
> > # CONFIG_CB710_CORE is not set
> >
> > #
> > # Texas Instruments shared transport line discipline
> > #
> > # end of Texas Instruments shared transport line discipline
> >
> > # CONFIG_SENSORS_LIS3_I2C is not set
> > # CONFIG_ALTERA_STAPL is not set
> > CONFIG_INTEL_MEI=3Dy
> > CONFIG_INTEL_MEI_ME=3Dy
> > # CONFIG_INTEL_MEI_TXE is not set
> > # CONFIG_INTEL_MEI_HDCP is not set
> > # CONFIG_VMWARE_VMCI is not set
> >
> > #
> > # Intel MIC & related support
> > #
> > # CONFIG_INTEL_MIC_BUS is not set
> > # CONFIG_SCIF_BUS is not set
> > # CONFIG_VOP_BUS is not set
> > # end of Intel MIC & related support
> >
> > # CONFIG_GENWQE is not set
> > # CONFIG_ECHO is not set
> > # CONFIG_MISC_ALCOR_PCI is not set
> > # CONFIG_MISC_RTSX_PCI is not set
> > # CONFIG_MISC_RTSX_USB is not set
> > # CONFIG_HABANA_AI is not set
> > # CONFIG_UACCE is not set
> > # end of Misc devices
> >
> > CONFIG_HAVE_IDE=3Dy
> > # CONFIG_IDE is not set
> >
> > #
> > # SCSI device support
> > #
> > CONFIG_SCSI_MOD=3Dy
> > # CONFIG_RAID_ATTRS is not set
> > CONFIG_SCSI=3Dy
> > CONFIG_SCSI_DMA=3Dy
> > CONFIG_SCSI_PROC_FS=3Dy
> >
> > #
> > # SCSI support type (disk, tape, CD-ROM)
> > #
> > CONFIG_BLK_DEV_SD=3Dy
> > # CONFIG_CHR_DEV_ST is not set
> > # CONFIG_BLK_DEV_SR is not set
> > CONFIG_CHR_DEV_SG=3Dy
> > # CONFIG_CHR_DEV_SCH is not set
> > # CONFIG_SCSI_ENCLOSURE is not set
> > CONFIG_SCSI_CONSTANTS=3Dy
> > # CONFIG_SCSI_LOGGING is not set
> > # CONFIG_SCSI_SCAN_ASYNC is not set
> >
> > #
> > # SCSI Transports
> > #
> > CONFIG_SCSI_SPI_ATTRS=3Dy
> > # CONFIG_SCSI_FC_ATTRS is not set
> > # CONFIG_SCSI_ISCSI_ATTRS is not set
> > # CONFIG_SCSI_SAS_ATTRS is not set
> > # CONFIG_SCSI_SAS_LIBSAS is not set
> > # CONFIG_SCSI_SRP_ATTRS is not set
> > # end of SCSI Transports
> >
> > # CONFIG_SCSI_LOWLEVEL is not set
> > # CONFIG_SCSI_DH is not set
> > # end of SCSI device support
> >
> > CONFIG_ATA=3Dy
> > CONFIG_SATA_HOST=3Dy
> > CONFIG_PATA_TIMINGS=3Dy
> > CONFIG_ATA_VERBOSE_ERROR=3Dy
> > CONFIG_ATA_FORCE=3Dy
> > CONFIG_ATA_ACPI=3Dy
> > # CONFIG_SATA_ZPODD is not set
> > # CONFIG_SATA_PMP is not set
> >
> > #
> > # Controllers with non-SFF native interface
> > #
> > CONFIG_SATA_AHCI=3Dy
> > CONFIG_SATA_MOBILE_LPM_POLICY=3D0
> > CONFIG_SATA_AHCI_PLATFORM=3Dy
> > # CONFIG_SATA_INIC162X is not set
> > # CONFIG_SATA_ACARD_AHCI is not set
> > # CONFIG_SATA_SIL24 is not set
> > # CONFIG_ATA_SFF is not set
> > CONFIG_MD=3Dy
> > # CONFIG_BLK_DEV_MD is not set
> > # CONFIG_BCACHE is not set
> > CONFIG_BLK_DEV_DM_BUILTIN=3Dy
> > CONFIG_BLK_DEV_DM=3Dy
> > # CONFIG_DM_DEBUG is not set
> > # CONFIG_DM_UNSTRIPED is not set
> > # CONFIG_DM_CRYPT is not set
> > # CONFIG_DM_SNAPSHOT is not set
> > # CONFIG_DM_THIN_PROVISIONING is not set
> > # CONFIG_DM_CACHE is not set
> > # CONFIG_DM_WRITECACHE is not set
> > # CONFIG_DM_ERA is not set
> > # CONFIG_DM_CLONE is not set
> > # CONFIG_DM_MIRROR is not set
> > # CONFIG_DM_RAID is not set
> > # CONFIG_DM_ZERO is not set
> > # CONFIG_DM_MULTIPATH is not set
> > # CONFIG_DM_DELAY is not set
> > # CONFIG_DM_DUST is not set
> > # CONFIG_DM_INIT is not set
> > CONFIG_DM_UEVENT=3Dy
> > # CONFIG_DM_FLAKEY is not set
> > # CONFIG_DM_VERITY is not set
> > # CONFIG_DM_SWITCH is not set
> > # CONFIG_DM_LOG_WRITES is not set
> > # CONFIG_DM_INTEGRITY is not set
> > # CONFIG_TARGET_CORE is not set
> > # CONFIG_FUSION is not set
> >
> > #
> > # IEEE 1394 (FireWire) support
> > #
> > # CONFIG_FIREWIRE is not set
> > # CONFIG_FIREWIRE_NOSY is not set
> > # end of IEEE 1394 (FireWire) support
> >
> > # CONFIG_MACINTOSH_DRIVERS is not set
> > CONFIG_NETDEVICES=3Dy
> > CONFIG_NET_CORE=3Dy
> > # CONFIG_BONDING is not set
> > # CONFIG_DUMMY is not set
> > # CONFIG_WIREGUARD is not set
> > # CONFIG_EQUALIZER is not set
> > # CONFIG_NET_FC is not set
> > # CONFIG_NET_TEAM is not set
> > # CONFIG_MACVLAN is not set
> > # CONFIG_IPVLAN is not set
> > # CONFIG_VXLAN is not set
> > # CONFIG_GENEVE is not set
> > # CONFIG_BAREUDP is not set
> > # CONFIG_GTP is not set
> > # CONFIG_MACSEC is not set
> > # CONFIG_NETCONSOLE is not set
> > CONFIG_TUN=3Dy
> > # CONFIG_TUN_VNET_CROSS_LE is not set
> > CONFIG_VETH=3Dy
> > # CONFIG_NLMON is not set
> > # CONFIG_ARCNET is not set
> >
> > #
> > # Distributed Switch Architecture drivers
> > #
> > # end of Distributed Switch Architecture drivers
> >
> > CONFIG_ETHERNET=3Dy
> > CONFIG_MDIO=3Dy
> > # CONFIG_NET_VENDOR_3COM is not set
> > # CONFIG_NET_VENDOR_ADAPTEC is not set
> > # CONFIG_NET_VENDOR_AGERE is not set
> > # CONFIG_NET_VENDOR_ALACRITECH is not set
> > # CONFIG_NET_VENDOR_ALTEON is not set
> > # CONFIG_ALTERA_TSE is not set
> > # CONFIG_NET_VENDOR_AMAZON is not set
> > # CONFIG_NET_VENDOR_AMD is not set
> > # CONFIG_NET_VENDOR_AQUANTIA is not set
> > # CONFIG_NET_VENDOR_ARC is not set
> > # CONFIG_NET_VENDOR_ATHEROS is not set
> > # CONFIG_NET_VENDOR_AURORA is not set
> > # CONFIG_NET_VENDOR_BROADCOM is not set
> > # CONFIG_NET_VENDOR_BROCADE is not set
> > # CONFIG_NET_VENDOR_CADENCE is not set
> > # CONFIG_NET_VENDOR_CAVIUM is not set
> > # CONFIG_NET_VENDOR_CHELSIO is not set
> > # CONFIG_NET_VENDOR_CISCO is not set
> > # CONFIG_NET_VENDOR_CORTINA is not set
> > # CONFIG_CX_ECAT is not set
> > # CONFIG_DNET is not set
> > # CONFIG_NET_VENDOR_DEC is not set
> > # CONFIG_NET_VENDOR_DLINK is not set
> > # CONFIG_NET_VENDOR_EMULEX is not set
> > # CONFIG_NET_VENDOR_EZCHIP is not set
> > # CONFIG_NET_VENDOR_GOOGLE is not set
> > # CONFIG_NET_VENDOR_HUAWEI is not set
> > CONFIG_NET_VENDOR_I825XX=3Dy
> > CONFIG_NET_VENDOR_INTEL=3Dy
> > # CONFIG_E100 is not set
> > # CONFIG_E1000 is not set
> > # CONFIG_E1000E is not set
> > # CONFIG_IGB is not set
> > # CONFIG_IGBVF is not set
> > # CONFIG_IXGB is not set
> > CONFIG_IXGBE=3Dy
> > CONFIG_IXGBE_HWMON=3Dy
> > # CONFIG_IXGBEVF is not set
> > # CONFIG_I40E is not set
> > # CONFIG_I40EVF is not set
> > # CONFIG_ICE is not set
> > # CONFIG_FM10K is not set
> > # CONFIG_IGC is not set
> > # CONFIG_JME is not set
> > # CONFIG_NET_VENDOR_MARVELL is not set
> > # CONFIG_NET_VENDOR_MELLANOX is not set
> > # CONFIG_NET_VENDOR_MICREL is not set
> > # CONFIG_NET_VENDOR_MICROCHIP is not set
> > # CONFIG_NET_VENDOR_MICROSEMI is not set
> > # CONFIG_NET_VENDOR_MYRI is not set
> > # CONFIG_FEALNX is not set
> > # CONFIG_NET_VENDOR_NATSEMI is not set
> > # CONFIG_NET_VENDOR_NETERION is not set
> > # CONFIG_NET_VENDOR_NETRONOME is not set
> > # CONFIG_NET_VENDOR_NI is not set
> > # CONFIG_NET_VENDOR_NVIDIA is not set
> > # CONFIG_NET_VENDOR_OKI is not set
> > # CONFIG_ETHOC is not set
> > # CONFIG_NET_VENDOR_PACKET_ENGINES is not set
> > # CONFIG_NET_VENDOR_PENSANDO is not set
> > # CONFIG_NET_VENDOR_QLOGIC is not set
> > # CONFIG_NET_VENDOR_QUALCOMM is not set
> > # CONFIG_NET_VENDOR_RDC is not set
> > CONFIG_NET_VENDOR_REALTEK=3Dy
> > # CONFIG_8139CP is not set
> > # CONFIG_8139TOO is not set
> > CONFIG_R8169=3Dy
> > # CONFIG_NET_VENDOR_RENESAS is not set
> > # CONFIG_NET_VENDOR_ROCKER is not set
> > # CONFIG_NET_VENDOR_SAMSUNG is not set
> > # CONFIG_NET_VENDOR_SEEQ is not set
> > # CONFIG_NET_VENDOR_SOLARFLARE is not set
> > # CONFIG_NET_VENDOR_SILAN is not set
> > # CONFIG_NET_VENDOR_SIS is not set
> > # CONFIG_NET_VENDOR_SMSC is not set
> > # CONFIG_NET_VENDOR_SOCIONEXT is not set
> > # CONFIG_NET_VENDOR_STMICRO is not set
> > # CONFIG_NET_VENDOR_SUN is not set
> > # CONFIG_NET_VENDOR_SYNOPSYS is not set
> > # CONFIG_NET_VENDOR_TEHUTI is not set
> > # CONFIG_NET_VENDOR_TI is not set
> > # CONFIG_NET_VENDOR_VIA is not set
> > # CONFIG_NET_VENDOR_WIZNET is not set
> > # CONFIG_NET_VENDOR_XILINX is not set
> > # CONFIG_FDDI is not set
> > # CONFIG_HIPPI is not set
> > # CONFIG_NET_SB1000 is not set
> > CONFIG_MDIO_DEVICE=3Dy
> > CONFIG_MDIO_BUS=3Dy
> > # CONFIG_MDIO_BCM_UNIMAC is not set
> > # CONFIG_MDIO_BITBANG is not set
> > # CONFIG_MDIO_MSCC_MIIM is not set
> > # CONFIG_MDIO_MVUSB is not set
> > # CONFIG_MDIO_THUNDER is not set
> > # CONFIG_MDIO_XPCS is not set
> > CONFIG_PHYLIB=3Dy
> >
> > #
> > # MII PHY device drivers
> > #
> > # CONFIG_ADIN_PHY is not set
> > # CONFIG_AMD_PHY is not set
> > # CONFIG_AQUANTIA_PHY is not set
> > # CONFIG_AX88796B_PHY is not set
> > # CONFIG_BCM7XXX_PHY is not set
> > # CONFIG_BCM87XX_PHY is not set
> > # CONFIG_BROADCOM_PHY is not set
> > # CONFIG_BCM84881_PHY is not set
> > # CONFIG_CICADA_PHY is not set
> > # CONFIG_CORTINA_PHY is not set
> > # CONFIG_DAVICOM_PHY is not set
> > # CONFIG_DP83822_PHY is not set
> > # CONFIG_DP83TC811_PHY is not set
> > # CONFIG_DP83848_PHY is not set
> > # CONFIG_DP83867_PHY is not set
> > # CONFIG_DP83869_PHY is not set
> > # CONFIG_FIXED_PHY is not set
> > # CONFIG_ICPLUS_PHY is not set
> > # CONFIG_INTEL_XWAY_PHY is not set
> > # CONFIG_LSI_ET1011C_PHY is not set
> > # CONFIG_LXT_PHY is not set
> > # CONFIG_MARVELL_PHY is not set
> > # CONFIG_MARVELL_10G_PHY is not set
> > # CONFIG_MICREL_PHY is not set
> > # CONFIG_MICROCHIP_PHY is not set
> > # CONFIG_MICROCHIP_T1_PHY is not set
> > # CONFIG_MICROSEMI_PHY is not set
> > # CONFIG_NATIONAL_PHY is not set
> > # CONFIG_NXP_TJA11XX_PHY is not set
> > # CONFIG_QSEMI_PHY is not set
> > CONFIG_REALTEK_PHY=3Dy
> > # CONFIG_RENESAS_PHY is not set
> > # CONFIG_ROCKCHIP_PHY is not set
> > # CONFIG_SMSC_PHY is not set
> > # CONFIG_STE10XP is not set
> > # CONFIG_TERANETICS_PHY is not set
> > # CONFIG_VITESSE_PHY is not set
> > # CONFIG_XILINX_GMII2RGMII is not set
> > # CONFIG_PPP is not set
> > # CONFIG_SLIP is not set
> > # CONFIG_USB_NET_DRIVERS is not set
> > # CONFIG_WLAN is not set
> >
> > #
> > # Enable WiMAX (Networking options) to see the WiMAX drivers
> > #
> > # CONFIG_WAN is not set
> > # CONFIG_VMXNET3 is not set
> > # CONFIG_FUJITSU_ES is not set
> > # CONFIG_NETDEVSIM is not set
> > # CONFIG_NET_FAILOVER is not set
> > # CONFIG_ISDN is not set
> > # CONFIG_NVM is not set
> >
> > #
> > # Input device support
> > #
> > CONFIG_INPUT=3Dy
> > # CONFIG_INPUT_FF_MEMLESS is not set
> > # CONFIG_INPUT_POLLDEV is not set
> > # CONFIG_INPUT_SPARSEKMAP is not set
> > # CONFIG_INPUT_MATRIXKMAP is not set
> >
> > #
> > # Userland interfaces
> > #
> > CONFIG_INPUT_MOUSEDEV=3Dy
> > CONFIG_INPUT_MOUSEDEV_PSAUX=3Dy
> > CONFIG_INPUT_MOUSEDEV_SCREEN_X=3D1024
> > CONFIG_INPUT_MOUSEDEV_SCREEN_Y=3D768
> > # CONFIG_INPUT_JOYDEV is not set
> > CONFIG_INPUT_EVDEV=3Dy
> > # CONFIG_INPUT_EVBUG is not set
> >
> > #
> > # Input Device Drivers
> > #
> > CONFIG_INPUT_KEYBOARD=3Dy
> > # CONFIG_KEYBOARD_ADP5588 is not set
> > # CONFIG_KEYBOARD_ADP5589 is not set
> > CONFIG_KEYBOARD_ATKBD=3Dy
> > # CONFIG_KEYBOARD_QT1050 is not set
> > # CONFIG_KEYBOARD_QT1070 is not set
> > # CONFIG_KEYBOARD_QT2160 is not set
> > # CONFIG_KEYBOARD_DLINK_DIR685 is not set
> > # CONFIG_KEYBOARD_LKKBD is not set
> > # CONFIG_KEYBOARD_TCA6416 is not set
> > # CONFIG_KEYBOARD_TCA8418 is not set
> > # CONFIG_KEYBOARD_LM8333 is not set
> > # CONFIG_KEYBOARD_MAX7359 is not set
> > # CONFIG_KEYBOARD_MCS is not set
> > # CONFIG_KEYBOARD_MPR121 is not set
> > # CONFIG_KEYBOARD_NEWTON is not set
> > # CONFIG_KEYBOARD_OPENCORES is not set
> > # CONFIG_KEYBOARD_SAMSUNG is not set
> > # CONFIG_KEYBOARD_STOWAWAY is not set
> > # CONFIG_KEYBOARD_SUNKBD is not set
> > # CONFIG_KEYBOARD_XTKBD is not set
> > CONFIG_INPUT_MOUSE=3Dy
> > CONFIG_MOUSE_PS2=3Dy
> > # CONFIG_MOUSE_PS2_ALPS is not set
> > # CONFIG_MOUSE_PS2_BYD is not set
> > # CONFIG_MOUSE_PS2_LOGIPS2PP is not set
> > # CONFIG_MOUSE_PS2_SYNAPTICS is not set
> > CONFIG_MOUSE_PS2_SYNAPTICS_SMBUS=3Dy
> > # CONFIG_MOUSE_PS2_CYPRESS is not set
> > # CONFIG_MOUSE_PS2_LIFEBOOK is not set
> > # CONFIG_MOUSE_PS2_TRACKPOINT is not set
> > # CONFIG_MOUSE_PS2_ELANTECH is not set
> > # CONFIG_MOUSE_PS2_SENTELIC is not set
> > # CONFIG_MOUSE_PS2_TOUCHKIT is not set
> > # CONFIG_MOUSE_PS2_FOCALTECH is not set
> > CONFIG_MOUSE_PS2_SMBUS=3Dy
> > # CONFIG_MOUSE_SERIAL is not set
> > # CONFIG_MOUSE_APPLETOUCH is not set
> > # CONFIG_MOUSE_BCM5974 is not set
> > # CONFIG_MOUSE_CYAPA is not set
> > # CONFIG_MOUSE_ELAN_I2C is not set
> > # CONFIG_MOUSE_VSXXXAA is not set
> > # CONFIG_MOUSE_SYNAPTICS_I2C is not set
> > # CONFIG_MOUSE_SYNAPTICS_USB is not set
> > # CONFIG_INPUT_JOYSTICK is not set
> > # CONFIG_INPUT_TABLET is not set
> > # CONFIG_INPUT_TOUCHSCREEN is not set
> > # CONFIG_INPUT_MISC is not set
> > # CONFIG_RMI4_CORE is not set
> >
> > #
> > # Hardware I/O ports
> > #
> > CONFIG_SERIO=3Dy
> > CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=3Dy
> > CONFIG_SERIO_I8042=3Dy
> > # CONFIG_SERIO_SERPORT is not set
> > # CONFIG_SERIO_CT82C710 is not set
> > # CONFIG_SERIO_PCIPS2 is not set
> > CONFIG_SERIO_LIBPS2=3Dy
> > # CONFIG_SERIO_RAW is not set
> > # CONFIG_SERIO_ALTERA_PS2 is not set
> > # CONFIG_SERIO_PS2MULT is not set
> > # CONFIG_SERIO_ARC_PS2 is not set
> > # CONFIG_USERIO is not set
> > # CONFIG_GAMEPORT is not set
> > # end of Hardware I/O ports
> > # end of Input device support
> >
> > #
> > # Character devices
> > #
> > CONFIG_TTY=3Dy
> > CONFIG_VT=3Dy
> > CONFIG_CONSOLE_TRANSLATIONS=3Dy
> > CONFIG_VT_CONSOLE=3Dy
> > CONFIG_HW_CONSOLE=3Dy
> > # CONFIG_VT_HW_CONSOLE_BINDING is not set
> > CONFIG_UNIX98_PTYS=3Dy
> > CONFIG_LEGACY_PTYS=3Dy
> > CONFIG_LEGACY_PTY_COUNT=3D256
> > CONFIG_LDISC_AUTOLOAD=3Dy
> >
> > #
> > # Serial drivers
> > #
> > CONFIG_SERIAL_EARLYCON=3Dy
> > CONFIG_SERIAL_8250=3Dy
> > CONFIG_SERIAL_8250_DEPRECATED_OPTIONS=3Dy
> > CONFIG_SERIAL_8250_PNP=3Dy
> > # CONFIG_SERIAL_8250_16550A_VARIANTS is not set
> > # CONFIG_SERIAL_8250_FINTEK is not set
> > CONFIG_SERIAL_8250_CONSOLE=3Dy
> > CONFIG_SERIAL_8250_PCI=3Dy
> > # CONFIG_SERIAL_8250_EXAR is not set
> > CONFIG_SERIAL_8250_NR_UARTS=3D4
> > CONFIG_SERIAL_8250_RUNTIME_UARTS=3D4
> > CONFIG_SERIAL_8250_EXTENDED=3Dy
> > # CONFIG_SERIAL_8250_MANY_PORTS is not set
> > CONFIG_SERIAL_8250_SHARE_IRQ=3Dy
> > # CONFIG_SERIAL_8250_DETECT_IRQ is not set
> > # CONFIG_SERIAL_8250_RSA is not set
> > CONFIG_SERIAL_8250_DWLIB=3Dy
> > # CONFIG_SERIAL_8250_DW is not set
> > # CONFIG_SERIAL_8250_RT288X is not set
> > CONFIG_SERIAL_8250_LPSS=3Dy
> > CONFIG_SERIAL_8250_MID=3Dy
> >
> > #
> > # Non-8250 serial port support
> > #
> > # CONFIG_SERIAL_UARTLITE is not set
> > CONFIG_SERIAL_CORE=3Dy
> > CONFIG_SERIAL_CORE_CONSOLE=3Dy
> > # CONFIG_SERIAL_JSM is not set
> > # CONFIG_SERIAL_SCCNXP is not set
> > # CONFIG_SERIAL_SC16IS7XX is not set
> > # CONFIG_SERIAL_ALTERA_JTAGUART is not set
> > # CONFIG_SERIAL_ALTERA_UART is not set
> > # CONFIG_SERIAL_ARC is not set
> > # CONFIG_SERIAL_RP2 is not set
> > # CONFIG_SERIAL_FSL_LPUART is not set
> > # CONFIG_SERIAL_FSL_LINFLEXUART is not set
> > # CONFIG_SERIAL_SPRD is not set
> > # end of Serial drivers
> >
> > # CONFIG_SERIAL_NONSTANDARD is not set
> > # CONFIG_N_GSM is not set
> > # CONFIG_NOZOMI is not set
> > # CONFIG_NULL_TTY is not set
> > # CONFIG_TRACE_SINK is not set
> > # CONFIG_SERIAL_DEV_BUS is not set
> > # CONFIG_TTY_PRINTK is not set
> > CONFIG_IPMI_HANDLER=3Dy
> > CONFIG_IPMI_DMI_DECODE=3Dy
> > CONFIG_IPMI_PLAT_DATA=3Dy
> > # CONFIG_IPMI_PANIC_EVENT is not set
> > CONFIG_IPMI_DEVICE_INTERFACE=3Dy
> > CONFIG_IPMI_SI=3Dy
> > CONFIG_IPMI_SSIF=3Dy
> > # CONFIG_IPMI_WATCHDOG is not set
> > # CONFIG_IPMI_POWEROFF is not set
> > # CONFIG_HW_RANDOM is not set
> > # CONFIG_APPLICOM is not set
> > # CONFIG_MWAVE is not set
> > # CONFIG_DEVMEM is not set
> > CONFIG_DEVKMEM=3Dy
> > # CONFIG_NVRAM is not set
> > # CONFIG_RAW_DRIVER is not set
> > CONFIG_DEVPORT=3Dy
> > CONFIG_HPET=3Dy
> > CONFIG_HPET_MMAP=3Dy
> > CONFIG_HPET_MMAP_DEFAULT=3Dy
> > # CONFIG_HANGCHECK_TIMER is not set
> > CONFIG_TCG_TPM=3Dy
> > # CONFIG_TCG_TIS is not set
> > # CONFIG_TCG_TIS_I2C_ATMEL is not set
> > # CONFIG_TCG_TIS_I2C_INFINEON is not set
> > # CONFIG_TCG_TIS_I2C_NUVOTON is not set
> > # CONFIG_TCG_NSC is not set
> > # CONFIG_TCG_ATMEL is not set
> > # CONFIG_TCG_INFINEON is not set
> > # CONFIG_TCG_CRB is not set
> > CONFIG_TCG_VTPM_PROXY=3Dy
> > # CONFIG_TCG_TIS_ST33ZP24_I2C is not set
> > # CONFIG_TELCLOCK is not set
> > # CONFIG_XILLYBUS is not set
> > # end of Character devices
> >
> > # CONFIG_RANDOM_TRUST_CPU is not set
> > # CONFIG_RANDOM_TRUST_BOOTLOADER is not set
> >
> > #
> > # I2C support
> > #
> > CONFIG_I2C=3Dy
> > CONFIG_ACPI_I2C_OPREGION=3Dy
> > CONFIG_I2C_BOARDINFO=3Dy
> > CONFIG_I2C_COMPAT=3Dy
> > CONFIG_I2C_CHARDEV=3Dy
> > CONFIG_I2C_MUX=3Dy
> >
> > #
> > # Multiplexer I2C Chip support
> > #
> > # CONFIG_I2C_MUX_LTC4306 is not set
> > # CONFIG_I2C_MUX_PCA9541 is not set
> > # CONFIG_I2C_MUX_REG is not set
> > # CONFIG_I2C_MUX_MLXCPLD is not set
> > # end of Multiplexer I2C Chip support
> >
> > CONFIG_I2C_HELPER_AUTO=3Dy
> > CONFIG_I2C_SMBUS=3Dy
> > CONFIG_I2C_ALGOBIT=3Dy
> >
> > #
> > # I2C Hardware Bus support
> > #
> >
> > #
> > # PC SMBus host controller drivers
> > #
> > # CONFIG_I2C_ALI1535 is not set
> > # CONFIG_I2C_ALI1563 is not set
> > # CONFIG_I2C_ALI15X3 is not set
> > # CONFIG_I2C_AMD756 is not set
> > # CONFIG_I2C_AMD8111 is not set
> > # CONFIG_I2C_AMD_MP2 is not set
> > CONFIG_I2C_I801=3Dy
> > # CONFIG_I2C_ISCH is not set
> > # CONFIG_I2C_ISMT is not set
> > # CONFIG_I2C_PIIX4 is not set
> > # CONFIG_I2C_NFORCE2 is not set
> > # CONFIG_I2C_NVIDIA_GPU is not set
> > # CONFIG_I2C_SIS5595 is not set
> > # CONFIG_I2C_SIS630 is not set
> > # CONFIG_I2C_SIS96X is not set
> > # CONFIG_I2C_VIA is not set
> > # CONFIG_I2C_VIAPRO is not set
> >
> > #
> > # ACPI drivers
> > #
> > CONFIG_I2C_SCMI=3Dy
> >
> > #
> > # I2C system bus drivers (mostly embedded / system-on-chip)
> > #
> > # CONFIG_I2C_DESIGNWARE_PLATFORM is not set
> > # CONFIG_I2C_DESIGNWARE_PCI is not set
> > # CONFIG_I2C_EMEV2 is not set
> > # CONFIG_I2C_OCORES is not set
> > # CONFIG_I2C_PCA_PLATFORM is not set
> > # CONFIG_I2C_SIMTEC is not set
> > # CONFIG_I2C_XILINX is not set
> >
> > #
> > # External I2C/SMBus adapter drivers
> > #
> > # CONFIG_I2C_DIOLAN_U2C is not set
> > # CONFIG_I2C_ROBOTFUZZ_OSIF is not set
> > # CONFIG_I2C_TAOS_EVM is not set
> > # CONFIG_I2C_TINY_USB is not set
> >
> > #
> > # Other I2C/SMBus bus drivers
> > #
> > # CONFIG_I2C_MLXCPLD is not set
> > # end of I2C Hardware Bus support
> >
> > # CONFIG_I2C_STUB is not set
> > # CONFIG_I2C_SLAVE is not set
> > # CONFIG_I2C_DEBUG_CORE is not set
> > # CONFIG_I2C_DEBUG_ALGO is not set
> > # CONFIG_I2C_DEBUG_BUS is not set
> > # end of I2C support
> >
> > # CONFIG_I3C is not set
> > # CONFIG_SPI is not set
> > # CONFIG_SPMI is not set
> > # CONFIG_HSI is not set
> > CONFIG_PPS=3Dy
> > # CONFIG_PPS_DEBUG is not set
> >
> > #
> > # PPS clients support
> > #
> > # CONFIG_PPS_CLIENT_KTIMER is not set
> > # CONFIG_PPS_CLIENT_LDISC is not set
> > # CONFIG_PPS_CLIENT_GPIO is not set
> >
> > #
> > # PPS generators support
> > #
> >
> > #
> > # PTP clock support
> > #
> > CONFIG_PTP_1588_CLOCK=3Dy
> >
> > #
> > # Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional cloc=
ks.
> > #
> > # CONFIG_PTP_1588_CLOCK_IDT82P33 is not set
> > # CONFIG_PTP_1588_CLOCK_IDTCM is not set
> > # end of PTP clock support
> >
> > # CONFIG_PINCTRL is not set
> > # CONFIG_GPIOLIB is not set
> > # CONFIG_W1 is not set
> > # CONFIG_POWER_AVS is not set
> > # CONFIG_POWER_RESET is not set
> > CONFIG_POWER_SUPPLY=3Dy
> > # CONFIG_POWER_SUPPLY_DEBUG is not set
> > CONFIG_POWER_SUPPLY_HWMON=3Dy
> > # CONFIG_PDA_POWER is not set
> > # CONFIG_TEST_POWER is not set
> > # CONFIG_CHARGER_ADP5061 is not set
> > # CONFIG_BATTERY_DS2780 is not set
> > # CONFIG_BATTERY_DS2781 is not set
> > # CONFIG_BATTERY_DS2782 is not set
> > # CONFIG_BATTERY_SBS is not set
> > # CONFIG_CHARGER_SBS is not set
> > # CONFIG_BATTERY_BQ27XXX is not set
> > # CONFIG_BATTERY_MAX17040 is not set
> > # CONFIG_BATTERY_MAX17042 is not set
> > # CONFIG_CHARGER_MAX8903 is not set
> > # CONFIG_CHARGER_LP8727 is not set
> > # CONFIG_CHARGER_BQ2415X is not set
> > # CONFIG_CHARGER_SMB347 is not set
> > # CONFIG_BATTERY_GAUGE_LTC2941 is not set
> > CONFIG_HWMON=3Dy
> > # CONFIG_HWMON_DEBUG_CHIP is not set
> >
> > #
> > # Native drivers
> > #
> > # CONFIG_SENSORS_ABITUGURU is not set
> > # CONFIG_SENSORS_ABITUGURU3 is not set
> > # CONFIG_SENSORS_AD7414 is not set
> > # CONFIG_SENSORS_AD7418 is not set
> > # CONFIG_SENSORS_ADM1021 is not set
> > # CONFIG_SENSORS_ADM1025 is not set
> > # CONFIG_SENSORS_ADM1026 is not set
> > # CONFIG_SENSORS_ADM1029 is not set
> > # CONFIG_SENSORS_ADM1031 is not set
> > # CONFIG_SENSORS_ADM1177 is not set
> > # CONFIG_SENSORS_ADM9240 is not set
> > # CONFIG_SENSORS_ADT7410 is not set
> > # CONFIG_SENSORS_ADT7411 is not set
> > # CONFIG_SENSORS_ADT7462 is not set
> > # CONFIG_SENSORS_ADT7470 is not set
> > # CONFIG_SENSORS_ADT7475 is not set
> > # CONFIG_SENSORS_AS370 is not set
> > # CONFIG_SENSORS_ASC7621 is not set
> > # CONFIG_SENSORS_AXI_FAN_CONTROL is not set
> > # CONFIG_SENSORS_K8TEMP is not set
> > # CONFIG_SENSORS_K10TEMP is not set
> > # CONFIG_SENSORS_FAM15H_POWER is not set
> > # CONFIG_SENSORS_APPLESMC is not set
> > # CONFIG_SENSORS_ASB100 is not set
> > # CONFIG_SENSORS_ASPEED is not set
> > # CONFIG_SENSORS_ATXP1 is not set
> > # CONFIG_SENSORS_DRIVETEMP is not set
> > # CONFIG_SENSORS_DS620 is not set
> > # CONFIG_SENSORS_DS1621 is not set
> > # CONFIG_SENSORS_DELL_SMM is not set
> > # CONFIG_SENSORS_I5K_AMB is not set
> > # CONFIG_SENSORS_F71805F is not set
> > # CONFIG_SENSORS_F71882FG is not set
> > # CONFIG_SENSORS_F75375S is not set
> > # CONFIG_SENSORS_FSCHMD is not set
> > # CONFIG_SENSORS_FTSTEUTATES is not set
> > # CONFIG_SENSORS_GL518SM is not set
> > # CONFIG_SENSORS_GL520SM is not set
> > # CONFIG_SENSORS_G760A is not set
> > # CONFIG_SENSORS_G762 is not set
> > # CONFIG_SENSORS_HIH6130 is not set
> > # CONFIG_SENSORS_IBMAEM is not set
> > # CONFIG_SENSORS_IBMPEX is not set
> > # CONFIG_SENSORS_I5500 is not set
> > CONFIG_SENSORS_CORETEMP=3Dy
> > # CONFIG_SENSORS_IT87 is not set
> > # CONFIG_SENSORS_JC42 is not set
> > # CONFIG_SENSORS_POWR1220 is not set
> > # CONFIG_SENSORS_LINEAGE is not set
> > # CONFIG_SENSORS_LTC2945 is not set
> > # CONFIG_SENSORS_LTC2947_I2C is not set
> > # CONFIG_SENSORS_LTC2990 is not set
> > # CONFIG_SENSORS_LTC4151 is not set
> > # CONFIG_SENSORS_LTC4215 is not set
> > # CONFIG_SENSORS_LTC4222 is not set
> > # CONFIG_SENSORS_LTC4245 is not set
> > # CONFIG_SENSORS_LTC4260 is not set
> > # CONFIG_SENSORS_LTC4261 is not set
> > # CONFIG_SENSORS_MAX16065 is not set
> > # CONFIG_SENSORS_MAX1619 is not set
> > # CONFIG_SENSORS_MAX1668 is not set
> > # CONFIG_SENSORS_MAX197 is not set
> > # CONFIG_SENSORS_MAX31730 is not set
> > # CONFIG_SENSORS_MAX6621 is not set
> > # CONFIG_SENSORS_MAX6639 is not set
> > # CONFIG_SENSORS_MAX6642 is not set
> > # CONFIG_SENSORS_MAX6650 is not set
> > # CONFIG_SENSORS_MAX6697 is not set
> > # CONFIG_SENSORS_MAX31790 is not set
> > # CONFIG_SENSORS_MCP3021 is not set
> > # CONFIG_SENSORS_TC654 is not set
> > # CONFIG_SENSORS_LM63 is not set
> > # CONFIG_SENSORS_LM73 is not set
> > # CONFIG_SENSORS_LM75 is not set
> > # CONFIG_SENSORS_LM77 is not set
> > # CONFIG_SENSORS_LM78 is not set
> > # CONFIG_SENSORS_LM80 is not set
> > # CONFIG_SENSORS_LM83 is not set
> > # CONFIG_SENSORS_LM85 is not set
> > # CONFIG_SENSORS_LM87 is not set
> > # CONFIG_SENSORS_LM90 is not set
> > # CONFIG_SENSORS_LM92 is not set
> > # CONFIG_SENSORS_LM93 is not set
> > # CONFIG_SENSORS_LM95234 is not set
> > # CONFIG_SENSORS_LM95241 is not set
> > # CONFIG_SENSORS_LM95245 is not set
> > # CONFIG_SENSORS_PC87360 is not set
> > # CONFIG_SENSORS_PC87427 is not set
> > # CONFIG_SENSORS_NTC_THERMISTOR is not set
> > # CONFIG_SENSORS_NCT6683 is not set
> > # CONFIG_SENSORS_NCT6775 is not set
> > # CONFIG_SENSORS_NCT7802 is not set
> > # CONFIG_SENSORS_NCT7904 is not set
> > # CONFIG_SENSORS_NPCM7XX is not set
> > # CONFIG_SENSORS_PCF8591 is not set
> > CONFIG_PMBUS=3Dy
> > CONFIG_SENSORS_PMBUS=3Dy
> > # CONFIG_SENSORS_ADM1275 is not set
> > # CONFIG_SENSORS_BEL_PFE is not set
> > # CONFIG_SENSORS_INSPUR_IPSPS is not set
> > # CONFIG_SENSORS_IR35221 is not set
> > # CONFIG_SENSORS_IR38064 is not set
> > # CONFIG_SENSORS_IRPS5401 is not set
> > # CONFIG_SENSORS_ISL68137 is not set
> > # CONFIG_SENSORS_LM25066 is not set
> > # CONFIG_SENSORS_LTC2978 is not set
> > # CONFIG_SENSORS_LTC3815 is not set
> > # CONFIG_SENSORS_MAX16064 is not set
> > # CONFIG_SENSORS_MAX20730 is not set
> > # CONFIG_SENSORS_MAX20751 is not set
> > # CONFIG_SENSORS_MAX31785 is not set
> > # CONFIG_SENSORS_MAX34440 is not set
> > # CONFIG_SENSORS_MAX8688 is not set
> > # CONFIG_SENSORS_PXE1610 is not set
> > # CONFIG_SENSORS_TPS40422 is not set
> > # CONFIG_SENSORS_TPS53679 is not set
> > # CONFIG_SENSORS_UCD9000 is not set
> > # CONFIG_SENSORS_UCD9200 is not set
> > # CONFIG_SENSORS_XDPE122 is not set
> > # CONFIG_SENSORS_ZL6100 is not set
> > # CONFIG_SENSORS_SHT21 is not set
> > # CONFIG_SENSORS_SHT3x is not set
> > # CONFIG_SENSORS_SHTC1 is not set
> > # CONFIG_SENSORS_SIS5595 is not set
> > # CONFIG_SENSORS_DME1737 is not set
> > # CONFIG_SENSORS_EMC1403 is not set
> > # CONFIG_SENSORS_EMC2103 is not set
> > # CONFIG_SENSORS_EMC6W201 is not set
> > # CONFIG_SENSORS_SMSC47M1 is not set
> > # CONFIG_SENSORS_SMSC47M192 is not set
> > # CONFIG_SENSORS_SMSC47B397 is not set
> > # CONFIG_SENSORS_SCH5627 is not set
> > # CONFIG_SENSORS_SCH5636 is not set
> > # CONFIG_SENSORS_STTS751 is not set
> > # CONFIG_SENSORS_SMM665 is not set
> > # CONFIG_SENSORS_ADC128D818 is not set
> > # CONFIG_SENSORS_ADS7828 is not set
> > # CONFIG_SENSORS_AMC6821 is not set
> > # CONFIG_SENSORS_INA209 is not set
> > # CONFIG_SENSORS_INA2XX is not set
> > # CONFIG_SENSORS_INA3221 is not set
> > # CONFIG_SENSORS_TC74 is not set
> > # CONFIG_SENSORS_THMC50 is not set
> > # CONFIG_SENSORS_TMP102 is not set
> > # CONFIG_SENSORS_TMP103 is not set
> > # CONFIG_SENSORS_TMP108 is not set
> > # CONFIG_SENSORS_TMP401 is not set
> > # CONFIG_SENSORS_TMP421 is not set
> > # CONFIG_SENSORS_TMP513 is not set
> > # CONFIG_SENSORS_VIA_CPUTEMP is not set
> > # CONFIG_SENSORS_VIA686A is not set
> > # CONFIG_SENSORS_VT1211 is not set
> > # CONFIG_SENSORS_VT8231 is not set
> > # CONFIG_SENSORS_W83773G is not set
> > # CONFIG_SENSORS_W83781D is not set
> > # CONFIG_SENSORS_W83791D is not set
> > # CONFIG_SENSORS_W83792D is not set
> > # CONFIG_SENSORS_W83793 is not set
> > # CONFIG_SENSORS_W83795 is not set
> > # CONFIG_SENSORS_W83L785TS is not set
> > # CONFIG_SENSORS_W83L786NG is not set
> > # CONFIG_SENSORS_W83627HF is not set
> > # CONFIG_SENSORS_W83627EHF is not set
> > # CONFIG_SENSORS_XGENE is not set
> >
> > #
> > # ACPI drivers
> > #
> > CONFIG_SENSORS_ACPI_POWER=3Dy
> > CONFIG_SENSORS_ATK0110=3Dy
> > CONFIG_THERMAL=3Dy
> > # CONFIG_THERMAL_STATISTICS is not set
> > CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=3D0
> > CONFIG_THERMAL_HWMON=3Dy
> > CONFIG_THERMAL_WRITABLE_TRIPS=3Dy
> > CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE=3Dy
> > # CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
> > # CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
> > # CONFIG_THERMAL_GOV_FAIR_SHARE is not set
> > CONFIG_THERMAL_GOV_STEP_WISE=3Dy
> > # CONFIG_THERMAL_GOV_BANG_BANG is not set
> > CONFIG_THERMAL_GOV_USER_SPACE=3Dy
> > # CONFIG_THERMAL_GOV_POWER_ALLOCATOR is not set
> > # CONFIG_THERMAL_EMULATION is not set
> >
> > #
> > # Intel thermal drivers
> > #
> > # CONFIG_INTEL_POWERCLAMP is not set
> > CONFIG_X86_PKG_TEMP_THERMAL=3Dy
> > # CONFIG_INTEL_SOC_DTS_THERMAL is not set
> >
> > #
> > # ACPI INT340X thermal drivers
> > #
> > # CONFIG_INT340X_THERMAL is not set
> > # end of ACPI INT340X thermal drivers
> >
> > CONFIG_INTEL_PCH_THERMAL=3Dy
> > # end of Intel thermal drivers
> >
> > CONFIG_WATCHDOG=3Dy
> > CONFIG_WATCHDOG_CORE=3Dy
> > # CONFIG_WATCHDOG_NOWAYOUT is not set
> > CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED=3Dy
> > CONFIG_WATCHDOG_OPEN_TIMEOUT=3D0
> > # CONFIG_WATCHDOG_SYSFS is not set
> >
> > #
> > # Watchdog Pretimeout Governors
> > #
> > # CONFIG_WATCHDOG_PRETIMEOUT_GOV is not set
> >
> > #
> > # Watchdog Device Drivers
> > #
> > # CONFIG_SOFT_WATCHDOG is not set
> > # CONFIG_WDAT_WDT is not set
> > # CONFIG_XILINX_WATCHDOG is not set
> > # CONFIG_ZIIRAVE_WATCHDOG is not set
> > # CONFIG_CADENCE_WATCHDOG is not set
> > # CONFIG_DW_WATCHDOG is not set
> > # CONFIG_MAX63XX_WATCHDOG is not set
> > # CONFIG_ACQUIRE_WDT is not set
> > # CONFIG_ADVANTECH_WDT is not set
> > # CONFIG_ALIM1535_WDT is not set
> > # CONFIG_ALIM7101_WDT is not set
> > # CONFIG_EBC_C384_WDT is not set
> > # CONFIG_F71808E_WDT is not set
> > # CONFIG_SP5100_TCO is not set
> > # CONFIG_SBC_FITPC2_WATCHDOG is not set
> > # CONFIG_EUROTECH_WDT is not set
> > # CONFIG_IB700_WDT is not set
> > # CONFIG_IBMASR is not set
> > # CONFIG_WAFER_WDT is not set
> > # CONFIG_I6300ESB_WDT is not set
> > # CONFIG_IE6XX_WDT is not set
> > CONFIG_ITCO_WDT=3Dy
> > CONFIG_ITCO_VENDOR_SUPPORT=3Dy
> > # CONFIG_IT8712F_WDT is not set
> > # CONFIG_IT87_WDT is not set
> > # CONFIG_HP_WATCHDOG is not set
> > # CONFIG_SC1200_WDT is not set
> > # CONFIG_PC87413_WDT is not set
> > # CONFIG_NV_TCO is not set
> > # CONFIG_60XX_WDT is not set
> > # CONFIG_CPU5_WDT is not set
> > # CONFIG_SMSC_SCH311X_WDT is not set
> > # CONFIG_SMSC37B787_WDT is not set
> > # CONFIG_TQMX86_WDT is not set
> > # CONFIG_VIA_WDT is not set
> > # CONFIG_W83627HF_WDT is not set
> > # CONFIG_W83877F_WDT is not set
> > # CONFIG_W83977F_WDT is not set
> > # CONFIG_MACHZ_WDT is not set
> > # CONFIG_SBC_EPX_C3_WATCHDOG is not set
> > CONFIG_INTEL_MEI_WDT=3Dy
> > # CONFIG_NI903X_WDT is not set
> > # CONFIG_NIC7018_WDT is not set
> >
> > #
> > # PCI-based Watchdog Cards
> > #
> > # CONFIG_PCIPCWATCHDOG is not set
> > # CONFIG_WDTPCI is not set
> >
> > #
> > # USB-based Watchdog Cards
> > #
> > # CONFIG_USBPCWATCHDOG is not set
> > CONFIG_SSB_POSSIBLE=3Dy
> > # CONFIG_SSB is not set
> > CONFIG_BCMA_POSSIBLE=3Dy
> > # CONFIG_BCMA is not set
> >
> > #
> > # Multifunction device drivers
> > #
> > CONFIG_MFD_CORE=3Dy
> > # CONFIG_MFD_AS3711 is not set
> > # CONFIG_PMIC_ADP5520 is not set
> > # CONFIG_MFD_BCM590XX is not set
> > # CONFIG_MFD_BD9571MWV is not set
> > # CONFIG_MFD_AXP20X_I2C is not set
> > # CONFIG_MFD_MADERA is not set
> > # CONFIG_PMIC_DA903X is not set
> > # CONFIG_MFD_DA9052_I2C is not set
> > # CONFIG_MFD_DA9055 is not set
> > # CONFIG_MFD_DA9062 is not set
> > # CONFIG_MFD_DA9063 is not set
> > # CONFIG_MFD_DA9150 is not set
> > # CONFIG_MFD_DLN2 is not set
> > # CONFIG_MFD_MC13XXX_I2C is not set
> > # CONFIG_HTC_PASIC3 is not set
> > # CONFIG_MFD_INTEL_QUARK_I2C_GPIO is not set
> > CONFIG_LPC_ICH=3Dy
> > # CONFIG_LPC_SCH is not set
> > CONFIG_MFD_INTEL_LPSS=3Dy
> > CONFIG_MFD_INTEL_LPSS_ACPI=3Dy
> > CONFIG_MFD_INTEL_LPSS_PCI=3Dy
> > # CONFIG_MFD_IQS62X is not set
> > # CONFIG_MFD_JANZ_CMODIO is not set
> > # CONFIG_MFD_KEMPLD is not set
> > # CONFIG_MFD_88PM800 is not set
> > # CONFIG_MFD_88PM805 is not set
> > # CONFIG_MFD_88PM860X is not set
> > # CONFIG_MFD_MAX14577 is not set
> > # CONFIG_MFD_MAX77693 is not set
> > # CONFIG_MFD_MAX77843 is not set
> > # CONFIG_MFD_MAX8907 is not set
> > # CONFIG_MFD_MAX8925 is not set
> > # CONFIG_MFD_MAX8997 is not set
> > # CONFIG_MFD_MAX8998 is not set
> > # CONFIG_MFD_MT6397 is not set
> > # CONFIG_MFD_MENF21BMC is not set
> > # CONFIG_MFD_VIPERBOARD is not set
> > # CONFIG_MFD_RETU is not set
> > # CONFIG_MFD_PCF50633 is not set
> > # CONFIG_MFD_RDC321X is not set
> > # CONFIG_MFD_RT5033 is not set
> > # CONFIG_MFD_RC5T583 is not set
> > # CONFIG_MFD_SEC_CORE is not set
> > # CONFIG_MFD_SI476X_CORE is not set
> > # CONFIG_MFD_SM501 is not set
> > # CONFIG_MFD_SKY81452 is not set
> > # CONFIG_MFD_SMSC is not set
> > # CONFIG_ABX500_CORE is not set
> > # CONFIG_MFD_SYSCON is not set
> > # CONFIG_MFD_TI_AM335X_TSCADC is not set
> > # CONFIG_MFD_LP3943 is not set
> > # CONFIG_MFD_LP8788 is not set
> > # CONFIG_MFD_TI_LMU is not set
> > # CONFIG_MFD_PALMAS is not set
> > # CONFIG_TPS6105X is not set
> > # CONFIG_TPS6507X is not set
> > # CONFIG_MFD_TPS65086 is not set
> > # CONFIG_MFD_TPS65090 is not set
> > # CONFIG_MFD_TI_LP873X is not set
> > # CONFIG_MFD_TPS6586X is not set
> > # CONFIG_MFD_TPS65912_I2C is not set
> > # CONFIG_MFD_TPS80031 is not set
> > # CONFIG_TWL4030_CORE is not set
> > # CONFIG_TWL6040_CORE is not set
> > # CONFIG_MFD_WL1273_CORE is not set
> > # CONFIG_MFD_LM3533 is not set
> > # CONFIG_MFD_TQMX86 is not set
> > # CONFIG_MFD_VX855 is not set
> > # CONFIG_MFD_ARIZONA_I2C is not set
> > # CONFIG_MFD_WM8400 is not set
> > # CONFIG_MFD_WM831X_I2C is not set
> > # CONFIG_MFD_WM8350_I2C is not set
> > # CONFIG_MFD_WM8994 is not set
> > # end of Multifunction device drivers
> >
> > # CONFIG_REGULATOR is not set
> > # CONFIG_RC_CORE is not set
> > # CONFIG_MEDIA_SUPPORT is not set
> >
> > #
> > # Graphics support
> > #
> > # CONFIG_AGP is not set
> > CONFIG_INTEL_GTT=3Dy
> > CONFIG_VGA_ARB=3Dy
> > CONFIG_VGA_ARB_MAX_GPUS=3D16
> > # CONFIG_VGA_SWITCHEROO is not set
> > CONFIG_DRM=3Dy
> > CONFIG_DRM_MIPI_DSI=3Dy
> > # CONFIG_DRM_DP_AUX_CHARDEV is not set
> > # CONFIG_DRM_DEBUG_MM is not set
> > # CONFIG_DRM_DEBUG_SELFTEST is not set
> > CONFIG_DRM_KMS_HELPER=3Dy
> > CONFIG_DRM_KMS_FB_HELPER=3Dy
> > # CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS is not set
> > CONFIG_DRM_FBDEV_EMULATION=3Dy
> > CONFIG_DRM_FBDEV_OVERALLOC=3D100
> > # CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM is not set
> > # CONFIG_DRM_LOAD_EDID_FIRMWARE is not set
> > # CONFIG_DRM_DP_CEC is not set
> >
> > #
> > # I2C encoder or helper chips
> > #
> > # CONFIG_DRM_I2C_CH7006 is not set
> > # CONFIG_DRM_I2C_SIL164 is not set
> > # CONFIG_DRM_I2C_NXP_TDA998X is not set
> > # CONFIG_DRM_I2C_NXP_TDA9950 is not set
> > # end of I2C encoder or helper chips
> >
> > #
> > # ARM devices
> > #
> > # end of ARM devices
> >
> > # CONFIG_DRM_RADEON is not set
> > # CONFIG_DRM_AMDGPU is not set
> > # CONFIG_DRM_NOUVEAU is not set
> > CONFIG_DRM_I915=3Dy
> > CONFIG_DRM_I915_FORCE_PROBE=3D""
> > CONFIG_DRM_I915_CAPTURE_ERROR=3Dy
> > CONFIG_DRM_I915_COMPRESS_ERROR=3Dy
> > CONFIG_DRM_I915_USERPTR=3Dy
> > # CONFIG_DRM_I915_GVT is not set
> >
> > #
> > # drm/i915 Debugging
> > #
> > # CONFIG_DRM_I915_WERROR is not set
> > # CONFIG_DRM_I915_DEBUG is not set
> > # CONFIG_DRM_I915_DEBUG_MMIO is not set
> > # CONFIG_DRM_I915_SW_FENCE_DEBUG_OBJECTS is not set
> > # CONFIG_DRM_I915_SW_FENCE_CHECK_DAG is not set
> > # CONFIG_DRM_I915_DEBUG_GUC is not set
> > # CONFIG_DRM_I915_SELFTEST is not set
> > # CONFIG_DRM_I915_LOW_LEVEL_TRACEPOINTS is not set
> > # CONFIG_DRM_I915_DEBUG_VBLANK_EVADE is not set
> > # CONFIG_DRM_I915_DEBUG_RUNTIME_PM is not set
> > # end of drm/i915 Debugging
> >
> > #
> > # drm/i915 Profile Guided Optimisation
> > #
> > CONFIG_DRM_I915_FENCE_TIMEOUT=3D10000
> > CONFIG_DRM_I915_USERFAULT_AUTOSUSPEND=3D250
> > CONFIG_DRM_I915_HEARTBEAT_INTERVAL=3D2500
> > CONFIG_DRM_I915_PREEMPT_TIMEOUT=3D100
> > CONFIG_DRM_I915_MAX_REQUEST_BUSYWAIT=3D8000
> > CONFIG_DRM_I915_STOP_TIMEOUT=3D100
> > CONFIG_DRM_I915_TIMESLICE_DURATION=3D1
> > # end of drm/i915 Profile Guided Optimisation
> >
> > # CONFIG_DRM_VGEM is not set
> > # CONFIG_DRM_VKMS is not set
> > # CONFIG_DRM_VMWGFX is not set
> > # CONFIG_DRM_GMA500 is not set
> > # CONFIG_DRM_UDL is not set
> > # CONFIG_DRM_AST is not set
> > # CONFIG_DRM_MGAG200 is not set
> > # CONFIG_DRM_QXL is not set
> > # CONFIG_DRM_BOCHS is not set
> > CONFIG_DRM_PANEL=3Dy
> >
> > #
> > # Display Panels
> > #
> > # CONFIG_DRM_PANEL_RASPBERRYPI_TOUCHSCREEN is not set
> > # end of Display Panels
> >
> > CONFIG_DRM_BRIDGE=3Dy
> > CONFIG_DRM_PANEL_BRIDGE=3Dy
> >
> > #
> > # Display Interface Bridges
> > #
> > # CONFIG_DRM_ANALOGIX_ANX78XX is not set
> > # end of Display Interface Bridges
> >
> > # CONFIG_DRM_ETNAVIV is not set
> > # CONFIG_DRM_CIRRUS_QEMU is not set
> > # CONFIG_DRM_GM12U320 is not set
> > # CONFIG_DRM_VBOXVIDEO is not set
> > # CONFIG_DRM_LEGACY is not set
> > CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=3Dy
> >
> > #
> > # Frame buffer Devices
> > #
> > CONFIG_FB_CMDLINE=3Dy
> > CONFIG_FB_NOTIFY=3Dy
> > CONFIG_FB=3Dy
> > CONFIG_FIRMWARE_EDID=3Dy
> > CONFIG_FB_CFB_FILLRECT=3Dy
> > CONFIG_FB_CFB_COPYAREA=3Dy
> > CONFIG_FB_CFB_IMAGEBLIT=3Dy
> > CONFIG_FB_SYS_FILLRECT=3Dy
> > CONFIG_FB_SYS_COPYAREA=3Dy
> > CONFIG_FB_SYS_IMAGEBLIT=3Dy
> > # CONFIG_FB_FOREIGN_ENDIAN is not set
> > CONFIG_FB_SYS_FOPS=3Dy
> > CONFIG_FB_DEFERRED_IO=3Dy
> > CONFIG_FB_MODE_HELPERS=3Dy
> > # CONFIG_FB_TILEBLITTING is not set
> >
> > #
> > # Frame buffer hardware drivers
> > #
> > # CONFIG_FB_CIRRUS is not set
> > # CONFIG_FB_PM2 is not set
> > # CONFIG_FB_CYBER2000 is not set
> > # CONFIG_FB_ARC is not set
> > # CONFIG_FB_ASILIANT is not set
> > # CONFIG_FB_IMSTT is not set
> > # CONFIG_FB_VGA16 is not set
> > # CONFIG_FB_VESA is not set
> > # CONFIG_FB_EFI is not set
> > # CONFIG_FB_N411 is not set
> > # CONFIG_FB_HGA is not set
> > # CONFIG_FB_OPENCORES is not set
> > # CONFIG_FB_S1D13XXX is not set
> > # CONFIG_FB_NVIDIA is not set
> > # CONFIG_FB_RIVA is not set
> > # CONFIG_FB_I740 is not set
> > # CONFIG_FB_LE80578 is not set
> > # CONFIG_FB_MATROX is not set
> > # CONFIG_FB_RADEON is not set
> > # CONFIG_FB_ATY128 is not set
> > # CONFIG_FB_ATY is not set
> > # CONFIG_FB_S3 is not set
> > # CONFIG_FB_SAVAGE is not set
> > # CONFIG_FB_SIS is not set
> > # CONFIG_FB_NEOMAGIC is not set
> > # CONFIG_FB_KYRO is not set
> > # CONFIG_FB_3DFX is not set
> > # CONFIG_FB_VOODOO1 is not set
> > # CONFIG_FB_VT8623 is not set
> > # CONFIG_FB_TRIDENT is not set
> > # CONFIG_FB_ARK is not set
> > # CONFIG_FB_PM3 is not set
> > # CONFIG_FB_CARMINE is not set
> > # CONFIG_FB_SMSCUFX is not set
> > # CONFIG_FB_UDL is not set
> > # CONFIG_FB_IBM_GXT4500 is not set
> > # CONFIG_FB_VIRTUAL is not set
> > # CONFIG_FB_METRONOME is not set
> > # CONFIG_FB_MB862XX is not set
> > # CONFIG_FB_SIMPLE is not set
> > # CONFIG_FB_SM712 is not set
> > # end of Frame buffer Devices
> >
> > #
> > # Backlight & LCD device support
> > #
> > # CONFIG_LCD_CLASS_DEVICE is not set
> > CONFIG_BACKLIGHT_CLASS_DEVICE=3Dy
> > # CONFIG_BACKLIGHT_GENERIC is not set
> > # CONFIG_BACKLIGHT_APPLE is not set
> > # CONFIG_BACKLIGHT_QCOM_WLED is not set
> > # CONFIG_BACKLIGHT_SAHARA is not set
> > # CONFIG_BACKLIGHT_ADP8860 is not set
> > # CONFIG_BACKLIGHT_ADP8870 is not set
> > # CONFIG_BACKLIGHT_LM3639 is not set
> > # CONFIG_BACKLIGHT_LV5207LP is not set
> > # CONFIG_BACKLIGHT_BD6107 is not set
> > # CONFIG_BACKLIGHT_ARCXCNN is not set
> > # end of Backlight & LCD device support
> >
> > CONFIG_HDMI=3Dy
> >
> > #
> > # Console display driver support
> > #
> > CONFIG_VGA_CONSOLE=3Dy
> > # CONFIG_VGACON_SOFT_SCROLLBACK is not set
> > CONFIG_DUMMY_CONSOLE=3Dy
> > CONFIG_DUMMY_CONSOLE_COLUMNS=3D80
> > CONFIG_DUMMY_CONSOLE_ROWS=3D25
> > # CONFIG_FRAMEBUFFER_CONSOLE is not set
> > # end of Console display driver support
> >
> > CONFIG_LOGO=3Dy
> > CONFIG_LOGO_LINUX_MONO=3Dy
> > CONFIG_LOGO_LINUX_VGA16=3Dy
> > CONFIG_LOGO_LINUX_CLUT224=3Dy
> > # end of Graphics support
> >
> > # CONFIG_SOUND is not set
> >
> > #
> > # HID support
> > #
> > CONFIG_HID=3Dy
> > # CONFIG_HID_BATTERY_STRENGTH is not set
> > # CONFIG_HIDRAW is not set
> > # CONFIG_UHID is not set
> > CONFIG_HID_GENERIC=3Dy
> >
> > #
> > # Special HID drivers
> > #
> > # CONFIG_HID_A4TECH is not set
> > # CONFIG_HID_ACCUTOUCH is not set
> > # CONFIG_HID_ACRUX is not set
> > # CONFIG_HID_APPLE is not set
> > # CONFIG_HID_APPLEIR is not set
> > # CONFIG_HID_AUREAL is not set
> > # CONFIG_HID_BELKIN is not set
> > # CONFIG_HID_BETOP_FF is not set
> > # CONFIG_HID_CHERRY is not set
> > # CONFIG_HID_CHICONY is not set
> > # CONFIG_HID_COUGAR is not set
> > # CONFIG_HID_MACALLY is not set
> > # CONFIG_HID_CMEDIA is not set
> > # CONFIG_HID_CREATIVE_SB0540 is not set
> > # CONFIG_HID_CYPRESS is not set
> > # CONFIG_HID_DRAGONRISE is not set
> > # CONFIG_HID_EMS_FF is not set
> > # CONFIG_HID_ELECOM is not set
> > # CONFIG_HID_ELO is not set
> > # CONFIG_HID_EZKEY is not set
> > # CONFIG_HID_GEMBIRD is not set
> > # CONFIG_HID_GFRM is not set
> > # CONFIG_HID_GLORIOUS is not set
> > # CONFIG_HID_HOLTEK is not set
> > # CONFIG_HID_KEYTOUCH is not set
> > # CONFIG_HID_KYE is not set
> > # CONFIG_HID_UCLOGIC is not set
> > # CONFIG_HID_WALTOP is not set
> > # CONFIG_HID_VIEWSONIC is not set
> > # CONFIG_HID_GYRATION is not set
> > # CONFIG_HID_ICADE is not set
> > # CONFIG_HID_ITE is not set
> > # CONFIG_HID_JABRA is not set
> > # CONFIG_HID_TWINHAN is not set
> > # CONFIG_HID_KENSINGTON is not set
> > # CONFIG_HID_LCPOWER is not set
> > # CONFIG_HID_LENOVO is not set
> > # CONFIG_HID_MAGICMOUSE is not set
> > # CONFIG_HID_MALTRON is not set
> > # CONFIG_HID_MAYFLASH is not set
> > # CONFIG_HID_REDRAGON is not set
> > # CONFIG_HID_MICROSOFT is not set
> > # CONFIG_HID_MONTEREY is not set
> > # CONFIG_HID_MULTITOUCH is not set
> > # CONFIG_HID_NTI is not set
> > # CONFIG_HID_NTRIG is not set
> > # CONFIG_HID_ORTEK is not set
> > # CONFIG_HID_PANTHERLORD is not set
> > # CONFIG_HID_PENMOUNT is not set
> > # CONFIG_HID_PETALYNX is not set
> > # CONFIG_HID_PICOLCD is not set
> > # CONFIG_HID_PLANTRONICS is not set
> > # CONFIG_HID_PRIMAX is not set
> > # CONFIG_HID_RETRODE is not set
> > # CONFIG_HID_ROCCAT is not set
> > # CONFIG_HID_SAITEK is not set
> > # CONFIG_HID_SAMSUNG is not set
> > # CONFIG_HID_SPEEDLINK is not set
> > # CONFIG_HID_STEAM is not set
> > # CONFIG_HID_STEELSERIES is not set
> > # CONFIG_HID_SUNPLUS is not set
> > # CONFIG_HID_RMI is not set
> > # CONFIG_HID_GREENASIA is not set
> > # CONFIG_HID_SMARTJOYPLUS is not set
> > # CONFIG_HID_TIVO is not set
> > # CONFIG_HID_TOPSEED is not set
> > # CONFIG_HID_THRUSTMASTER is not set
> > # CONFIG_HID_UDRAW_PS3 is not set
> > # CONFIG_HID_WACOM is not set
> > # CONFIG_HID_XINMO is not set
> > # CONFIG_HID_ZEROPLUS is not set
> > # CONFIG_HID_ZYDACRON is not set
> > # CONFIG_HID_SENSOR_HUB is not set
> > # CONFIG_HID_ALPS is not set
> > # CONFIG_HID_MCP2221 is not set
> > # end of Special HID drivers
> >
> > #
> > # USB HID support
> > #
> > CONFIG_USB_HID=3Dy
> > # CONFIG_HID_PID is not set
> > # CONFIG_USB_HIDDEV is not set
> > # end of USB HID support
> >
> > #
> > # I2C HID support
> > #
> > # CONFIG_I2C_HID is not set
> > # end of I2C HID support
> >
> > #
> > # Intel ISH HID support
> > #
> > CONFIG_INTEL_ISH_HID=3Dy
> > # CONFIG_INTEL_ISH_FIRMWARE_DOWNLOADER is not set
> > # end of Intel ISH HID support
> > # end of HID support
> >
> > CONFIG_USB_OHCI_LITTLE_ENDIAN=3Dy
> > CONFIG_USB_SUPPORT=3Dy
> > CONFIG_USB_COMMON=3Dy
> > # CONFIG_USB_ULPI_BUS is not set
> > CONFIG_USB_ARCH_HAS_HCD=3Dy
> > CONFIG_USB=3Dy
> > CONFIG_USB_PCI=3Dy
> > # CONFIG_USB_ANNOUNCE_NEW_DEVICES is not set
> >
> > #
> > # Miscellaneous USB options
> > #
> > CONFIG_USB_DEFAULT_PERSIST=3Dy
> > CONFIG_USB_DYNAMIC_MINORS=3Dy
> > # CONFIG_USB_OTG is not set
> > # CONFIG_USB_OTG_WHITELIST is not set
> > # CONFIG_USB_OTG_BLACKLIST_HUB is not set
> > CONFIG_USB_AUTOSUSPEND_DELAY=3D2
> > # CONFIG_USB_MON is not set
> >
> > #
> > # USB Host Controller Drivers
> > #
> > # CONFIG_USB_C67X00_HCD is not set
> > CONFIG_USB_XHCI_HCD=3Dy
> > # CONFIG_USB_XHCI_DBGCAP is not set
> > CONFIG_USB_XHCI_PCI=3Dy
> > # CONFIG_USB_XHCI_PLATFORM is not set
> > CONFIG_USB_EHCI_HCD=3Dy
> > # CONFIG_USB_EHCI_ROOT_HUB_TT is not set
> > CONFIG_USB_EHCI_TT_NEWSCHED=3Dy
> > CONFIG_USB_EHCI_PCI=3Dy
> > # CONFIG_USB_EHCI_FSL is not set
> > # CONFIG_USB_EHCI_HCD_PLATFORM is not set
> > # CONFIG_USB_OXU210HP_HCD is not set
> > # CONFIG_USB_ISP116X_HCD is not set
> > # CONFIG_USB_FOTG210_HCD is not set
> > CONFIG_USB_OHCI_HCD=3Dy
> > CONFIG_USB_OHCI_HCD_PCI=3Dy
> > # CONFIG_USB_OHCI_HCD_PLATFORM is not set
> > CONFIG_USB_UHCI_HCD=3Dy
> > # CONFIG_USB_SL811_HCD is not set
> > # CONFIG_USB_R8A66597_HCD is not set
> > # CONFIG_USB_HCD_TEST_MODE is not set
> >
> > #
> > # USB Device Class drivers
> > #
> > # CONFIG_USB_ACM is not set
> > # CONFIG_USB_PRINTER is not set
> > # CONFIG_USB_WDM is not set
> > # CONFIG_USB_TMC is not set
> >
> > #
> > # NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
> > #
> >
> > #
> > # also be needed; see USB_STORAGE Help for more info
> > #
> > CONFIG_USB_STORAGE=3Dy
> > # CONFIG_USB_STORAGE_DEBUG is not set
> > # CONFIG_USB_STORAGE_REALTEK is not set
> > # CONFIG_USB_STORAGE_DATAFAB is not set
> > # CONFIG_USB_STORAGE_FREECOM is not set
> > # CONFIG_USB_STORAGE_ISD200 is not set
> > # CONFIG_USB_STORAGE_USBAT is not set
> > # CONFIG_USB_STORAGE_SDDR09 is not set
> > # CONFIG_USB_STORAGE_SDDR55 is not set
> > # CONFIG_USB_STORAGE_JUMPSHOT is not set
> > # CONFIG_USB_STORAGE_ALAUDA is not set
> > # CONFIG_USB_STORAGE_ONETOUCH is not set
> > # CONFIG_USB_STORAGE_KARMA is not set
> > # CONFIG_USB_STORAGE_CYPRESS_ATACB is not set
> > # CONFIG_USB_STORAGE_ENE_UB6250 is not set
> > # CONFIG_USB_UAS is not set
> >
> > #
> > # USB Imaging devices
> > #
> > # CONFIG_USB_MDC800 is not set
> > # CONFIG_USB_MICROTEK is not set
> > # CONFIG_USBIP_CORE is not set
> > # CONFIG_USB_CDNS3 is not set
> > # CONFIG_USB_MUSB_HDRC is not set
> > # CONFIG_USB_DWC3 is not set
> > # CONFIG_USB_DWC2 is not set
> > # CONFIG_USB_CHIPIDEA is not set
> > # CONFIG_USB_ISP1760 is not set
> >
> > #
> > # USB port drivers
> > #
> > # CONFIG_USB_SERIAL is not set
> >
> > #
> > # USB Miscellaneous drivers
> > #
> > # CONFIG_USB_EMI62 is not set
> > # CONFIG_USB_EMI26 is not set
> > # CONFIG_USB_ADUTUX is not set
> > # CONFIG_USB_SEVSEG is not set
> > # CONFIG_USB_LEGOTOWER is not set
> > # CONFIG_USB_LCD is not set
> > # CONFIG_USB_CYPRESS_CY7C63 is not set
> > # CONFIG_USB_CYTHERM is not set
> > # CONFIG_USB_IDMOUSE is not set
> > # CONFIG_USB_FTDI_ELAN is not set
> > # CONFIG_USB_APPLEDISPLAY is not set
> > # CONFIG_APPLE_MFI_FASTCHARGE is not set
> > # CONFIG_USB_SISUSBVGA is not set
> > # CONFIG_USB_LD is not set
> > # CONFIG_USB_TRANCEVIBRATOR is not set
> > # CONFIG_USB_IOWARRIOR is not set
> > # CONFIG_USB_TEST is not set
> > # CONFIG_USB_EHSET_TEST_FIXTURE is not set
> > # CONFIG_USB_ISIGHTFW is not set
> > # CONFIG_USB_YUREX is not set
> > # CONFIG_USB_EZUSB_FX2 is not set
> > # CONFIG_USB_HUB_USB251XB is not set
> > # CONFIG_USB_HSIC_USB3503 is not set
> > # CONFIG_USB_HSIC_USB4604 is not set
> > # CONFIG_USB_LINK_LAYER_TEST is not set
> >
> > #
> > # USB Physical Layer drivers
> > #
> > # CONFIG_NOP_USB_XCEIV is not set
> > # CONFIG_USB_ISP1301 is not set
> > # end of USB Physical Layer drivers
> >
> > CONFIG_USB_GADGET=3Dm
> > # CONFIG_USB_GADGET_DEBUG is not set
> > # CONFIG_USB_GADGET_DEBUG_FILES is not set
> > # CONFIG_USB_GADGET_DEBUG_FS is not set
> > CONFIG_USB_GADGET_VBUS_DRAW=3D2
> > CONFIG_USB_GADGET_STORAGE_NUM_BUFFERS=3D2
> >
> > #
> > # USB Peripheral Controller
> > #
> > # CONFIG_USB_FOTG210_UDC is not set
> > # CONFIG_USB_GR_UDC is not set
> > # CONFIG_USB_R8A66597 is not set
> > # CONFIG_USB_PXA27X is not set
> > # CONFIG_USB_MV_UDC is not set
> > # CONFIG_USB_MV_U3D is not set
> > # CONFIG_USB_M66592 is not set
> > # CONFIG_USB_BDC_UDC is not set
> > # CONFIG_USB_AMD5536UDC is not set
> > # CONFIG_USB_NET2272 is not set
> > # CONFIG_USB_NET2280 is not set
> > # CONFIG_USB_GOKU is not set
> > # CONFIG_USB_EG20T is not set
> > # CONFIG_USB_DUMMY_HCD is not set
> > # end of USB Peripheral Controller
> >
> > CONFIG_USB_LIBCOMPOSITE=3Dm
> > CONFIG_USB_F_FS=3Dm
> > CONFIG_USB_CONFIGFS=3Dm
> > # CONFIG_USB_CONFIGFS_SERIAL is not set
> > # CONFIG_USB_CONFIGFS_ACM is not set
> > # CONFIG_USB_CONFIGFS_OBEX is not set
> > # CONFIG_USB_CONFIGFS_NCM is not set
> > # CONFIG_USB_CONFIGFS_ECM is not set
> > # CONFIG_USB_CONFIGFS_ECM_SUBSET is not set
> > # CONFIG_USB_CONFIGFS_RNDIS is not set
> > # CONFIG_USB_CONFIGFS_EEM is not set
> > # CONFIG_USB_CONFIGFS_MASS_STORAGE is not set
> > # CONFIG_USB_CONFIGFS_F_LB_SS is not set
> > CONFIG_USB_CONFIGFS_F_FS=3Dy
> > # CONFIG_USB_CONFIGFS_F_HID is not set
> > # CONFIG_USB_CONFIGFS_F_PRINTER is not set
> >
> > #
> > # USB Gadget precomposed configurations
> > #
> > # CONFIG_USB_ZERO is not set
> > # CONFIG_USB_ETH is not set
> > # CONFIG_USB_G_NCM is not set
> > # CONFIG_USB_GADGETFS is not set
> > # CONFIG_USB_FUNCTIONFS is not set
> > # CONFIG_USB_MASS_STORAGE is not set
> > # CONFIG_USB_G_SERIAL is not set
> > # CONFIG_USB_G_PRINTER is not set
> > # CONFIG_USB_CDC_COMPOSITE is not set
> > # CONFIG_USB_G_ACM_MS is not set
> > # CONFIG_USB_G_MULTI is not set
> > # CONFIG_USB_G_HID is not set
> > # CONFIG_USB_G_DBGP is not set
> > # CONFIG_USB_RAW_GADGET is not set
> > # end of USB Gadget precomposed configurations
> >
> > # CONFIG_TYPEC is not set
> > # CONFIG_USB_ROLE_SWITCH is not set
> > # CONFIG_MMC is not set
> > # CONFIG_MEMSTICK is not set
> > # CONFIG_NEW_LEDS is not set
> > # CONFIG_ACCESSIBILITY is not set
> > # CONFIG_INFINIBAND is not set
> > CONFIG_EDAC_ATOMIC_SCRUB=3Dy
> > CONFIG_EDAC_SUPPORT=3Dy
> > # CONFIG_EDAC is not set
> > CONFIG_RTC_LIB=3Dy
> > CONFIG_RTC_MC146818_LIB=3Dy
> > CONFIG_RTC_CLASS=3Dy
> > CONFIG_RTC_HCTOSYS=3Dy
> > CONFIG_RTC_HCTOSYS_DEVICE=3D"rtc0"
> > CONFIG_RTC_SYSTOHC=3Dy
> > CONFIG_RTC_SYSTOHC_DEVICE=3D"rtc0"
> > # CONFIG_RTC_DEBUG is not set
> > CONFIG_RTC_NVMEM=3Dy
> >
> > #
> > # RTC interfaces
> > #
> > CONFIG_RTC_INTF_SYSFS=3Dy
> > CONFIG_RTC_INTF_PROC=3Dy
> > CONFIG_RTC_INTF_DEV=3Dy
> > # CONFIG_RTC_INTF_DEV_UIE_EMUL is not set
> > # CONFIG_RTC_DRV_TEST is not set
> >
> > #
> > # I2C RTC drivers
> > #
> > # CONFIG_RTC_DRV_ABB5ZES3 is not set
> > # CONFIG_RTC_DRV_ABEOZ9 is not set
> > # CONFIG_RTC_DRV_ABX80X is not set
> > # CONFIG_RTC_DRV_DS1307 is not set
> > # CONFIG_RTC_DRV_DS1374 is not set
> > # CONFIG_RTC_DRV_DS1672 is not set
> > # CONFIG_RTC_DRV_MAX6900 is not set
> > # CONFIG_RTC_DRV_RS5C372 is not set
> > # CONFIG_RTC_DRV_ISL1208 is not set
> > # CONFIG_RTC_DRV_ISL12022 is not set
> > # CONFIG_RTC_DRV_X1205 is not set
> > # CONFIG_RTC_DRV_PCF8523 is not set
> > # CONFIG_RTC_DRV_PCF85063 is not set
> > # CONFIG_RTC_DRV_PCF85363 is not set
> > # CONFIG_RTC_DRV_PCF8563 is not set
> > # CONFIG_RTC_DRV_PCF8583 is not set
> > # CONFIG_RTC_DRV_M41T80 is not set
> > # CONFIG_RTC_DRV_BQ32K is not set
> > # CONFIG_RTC_DRV_S35390A is not set
> > # CONFIG_RTC_DRV_FM3130 is not set
> > # CONFIG_RTC_DRV_RX8010 is not set
> > # CONFIG_RTC_DRV_RX8581 is not set
> > # CONFIG_RTC_DRV_RX8025 is not set
> > # CONFIG_RTC_DRV_EM3027 is not set
> > # CONFIG_RTC_DRV_RV3028 is not set
> > # CONFIG_RTC_DRV_RV8803 is not set
> > # CONFIG_RTC_DRV_SD3078 is not set
> >
> > #
> > # SPI RTC drivers
> > #
> > CONFIG_RTC_I2C_AND_SPI=3Dy
> >
> > #
> > # SPI and I2C RTC drivers
> > #
> > # CONFIG_RTC_DRV_DS3232 is not set
> > # CONFIG_RTC_DRV_PCF2127 is not set
> > # CONFIG_RTC_DRV_RV3029C2 is not set
> >
> > #
> > # Platform RTC drivers
> > #
> > CONFIG_RTC_DRV_CMOS=3Dy
> > # CONFIG_RTC_DRV_DS1286 is not set
> > # CONFIG_RTC_DRV_DS1511 is not set
> > # CONFIG_RTC_DRV_DS1553 is not set
> > # CONFIG_RTC_DRV_DS1685_FAMILY is not set
> > # CONFIG_RTC_DRV_DS1742 is not set
> > # CONFIG_RTC_DRV_DS2404 is not set
> > # CONFIG_RTC_DRV_STK17TA8 is not set
> > # CONFIG_RTC_DRV_M48T86 is not set
> > # CONFIG_RTC_DRV_M48T35 is not set
> > # CONFIG_RTC_DRV_M48T59 is not set
> > # CONFIG_RTC_DRV_MSM6242 is not set
> > # CONFIG_RTC_DRV_BQ4802 is not set
> > # CONFIG_RTC_DRV_RP5C01 is not set
> > # CONFIG_RTC_DRV_V3020 is not set
> >
> > #
> > # on-CPU RTC drivers
> > #
> > # CONFIG_RTC_DRV_FTRTC010 is not set
> >
> > #
> > # HID Sensor RTC drivers
> > #
> > # CONFIG_DMADEVICES is not set
> >
> > #
> > # DMABUF options
> > #
> > CONFIG_SYNC_FILE=3Dy
> > # CONFIG_SW_SYNC is not set
> > # CONFIG_UDMABUF is not set
> > # CONFIG_DMABUF_MOVE_NOTIFY is not set
> > # CONFIG_DMABUF_SELFTESTS is not set
> > # CONFIG_DMABUF_HEAPS is not set
> > # end of DMABUF options
> >
> > # CONFIG_AUXDISPLAY is not set
> > # CONFIG_UIO is not set
> > # CONFIG_VFIO is not set
> > # CONFIG_VIRT_DRIVERS is not set
> > # CONFIG_VIRTIO_MENU is not set
> > # CONFIG_VDPA_MENU is not set
> > CONFIG_VHOST_MENU=3Dy
> > # CONFIG_VHOST_NET is not set
> > # CONFIG_VHOST_VDPA is not set
> > # CONFIG_VHOST_CROSS_ENDIAN_LEGACY is not set
> >
> > #
> > # Microsoft Hyper-V guest support
> > #
> > # end of Microsoft Hyper-V guest support
> >
> > # CONFIG_GREYBUS is not set
> > # CONFIG_STAGING is not set
> > CONFIG_X86_PLATFORM_DEVICES=3Dy
> > CONFIG_ACPI_WMI=3Dy
> > CONFIG_WMI_BMOF=3Dy
> > # CONFIG_INTEL_WMI_THUNDERBOLT is not set
> > CONFIG_MXM_WMI=3Dy
> > # CONFIG_PEAQ_WMI is not set
> > # CONFIG_XIAOMI_WMI is not set
> > # CONFIG_ACERHDF is not set
> > # CONFIG_ACER_WIRELESS is not set
> > # CONFIG_ACER_WMI is not set
> > # CONFIG_APPLE_GMUX is not set
> > # CONFIG_ASUS_LAPTOP is not set
> > # CONFIG_ASUS_WIRELESS is not set
> > # CONFIG_DCDBAS is not set
> > # CONFIG_DELL_SMBIOS is not set
> > # CONFIG_DELL_RBU is not set
> > # CONFIG_DELL_SMO8800 is not set
> > # CONFIG_DELL_WMI_AIO is not set
> > # CONFIG_FUJITSU_LAPTOP is not set
> > # CONFIG_FUJITSU_TABLET is not set
> > # CONFIG_GPD_POCKET_FAN is not set
> > # CONFIG_HP_ACCEL is not set
> > # CONFIG_HP_WIRELESS is not set
> > # CONFIG_HP_WMI is not set
> > # CONFIG_IBM_RTL is not set
> > # CONFIG_SENSORS_HDAPS is not set
> > # CONFIG_INTEL_ATOMISP2_PM is not set
> > # CONFIG_INTEL_HID_EVENT is not set
> > # CONFIG_INTEL_MENLOW is not set
> > # CONFIG_INTEL_VBTN is not set
> > # CONFIG_SURFACE_3_POWER_OPREGION is not set
> > # CONFIG_SURFACE_PRO3_BUTTON is not set
> > # CONFIG_MSI_WMI is not set
> > # CONFIG_SAMSUNG_LAPTOP is not set
> > # CONFIG_SAMSUNG_Q10 is not set
> > # CONFIG_TOSHIBA_BT_RFKILL is not set
> > # CONFIG_TOSHIBA_HAPS is not set
> > # CONFIG_TOSHIBA_WMI is not set
> > # CONFIG_ACPI_CMPC is not set
> > # CONFIG_LG_LAPTOP is not set
> > # CONFIG_PANASONIC_LAPTOP is not set
> > # CONFIG_SYSTEM76_ACPI is not set
> > # CONFIG_TOPSTAR_LAPTOP is not set
> > # CONFIG_I2C_MULTI_INSTANTIATE is not set
> > # CONFIG_INTEL_IPS is not set
> > # CONFIG_INTEL_RST is not set
> > # CONFIG_INTEL_SMARTCONNECT is not set
> >
> > #
> > # Intel Speed Select Technology interface support
> > #
> > CONFIG_INTEL_SPEED_SELECT_INTERFACE=3Dy
> > # end of Intel Speed Select Technology interface support
> >
> > # CONFIG_INTEL_TURBO_MAX_3 is not set
> > # CONFIG_INTEL_UNCORE_FREQ_CONTROL is not set
> > # CONFIG_INTEL_PMC_CORE is not set
> > # CONFIG_INTEL_PMC_IPC is not set
> > # CONFIG_INTEL_PUNIT_IPC is not set
> > CONFIG_PMC_ATOM=3Dy
> > # CONFIG_MFD_CROS_EC is not set
> > # CONFIG_CHROME_PLATFORMS is not set
> > # CONFIG_MELLANOX_PLATFORM is not set
> > CONFIG_CLKDEV_LOOKUP=3Dy
> > CONFIG_HAVE_CLK_PREPARE=3Dy
> > CONFIG_COMMON_CLK=3Dy
> >
> > #
> > # Common Clock Framework
> > #
> > # CONFIG_COMMON_CLK_MAX9485 is not set
> > # CONFIG_COMMON_CLK_SI5341 is not set
> > # CONFIG_COMMON_CLK_SI5351 is not set
> > # CONFIG_COMMON_CLK_SI544 is not set
> > # CONFIG_COMMON_CLK_CDCE706 is not set
> > # CONFIG_COMMON_CLK_CS2000_CP is not set
> > # end of Common Clock Framework
> >
> > # CONFIG_HWSPINLOCK is not set
> >
> > #
> > # Clock Source drivers
> > #
> > CONFIG_CLKEVT_I8253=3Dy
> > CONFIG_I8253_LOCK=3Dy
> > CONFIG_CLKBLD_I8253=3Dy
> > # end of Clock Source drivers
> >
> > CONFIG_MAILBOX=3Dy
> > CONFIG_PCC=3Dy
> > # CONFIG_ALTERA_MBOX is not set
> > CONFIG_IOMMU_IOVA=3Dy
> > CONFIG_IOASID=3Dy
> > CONFIG_IOMMU_API=3Dy
> > CONFIG_IOMMU_SUPPORT=3Dy
> >
> > #
> > # Generic IOMMU Pagetable Support
> > #
> > # end of Generic IOMMU Pagetable Support
> >
> > # CONFIG_IOMMU_DEBUGFS is not set
> > # CONFIG_IOMMU_DEFAULT_PASSTHROUGH is not set
> > # CONFIG_AMD_IOMMU is not set
> > CONFIG_DMAR_TABLE=3Dy
> > CONFIG_INTEL_IOMMU=3Dy
> > CONFIG_INTEL_IOMMU_SVM=3Dy
> > CONFIG_INTEL_IOMMU_DEFAULT_ON=3Dy
> > CONFIG_INTEL_IOMMU_FLOPPY_WA=3Dy
> > # CONFIG_INTEL_IOMMU_SCALABLE_MODE_DEFAULT_ON is not set
> > # CONFIG_IRQ_REMAP is not set
> >
> > #
> > # Remoteproc drivers
> > #
> > # CONFIG_REMOTEPROC is not set
> > # end of Remoteproc drivers
> >
> > #
> > # Rpmsg drivers
> > #
> > # CONFIG_RPMSG_QCOM_GLINK_RPM is not set
> > # CONFIG_RPMSG_VIRTIO is not set
> > # end of Rpmsg drivers
> >
> > # CONFIG_SOUNDWIRE is not set
> >
> > #
> > # SOC (System On Chip) specific Drivers
> > #
> >
> > #
> > # Amlogic SoC drivers
> > #
> > # end of Amlogic SoC drivers
> >
> > #
> > # Aspeed SoC drivers
> > #
> > # end of Aspeed SoC drivers
> >
> > #
> > # Broadcom SoC drivers
> > #
> > # end of Broadcom SoC drivers
> >
> > #
> > # NXP/Freescale QorIQ SoC drivers
> > #
> > # end of NXP/Freescale QorIQ SoC drivers
> >
> > #
> > # i.MX SoC drivers
> > #
> > # end of i.MX SoC drivers
> >
> > #
> > # Qualcomm SoC drivers
> > #
> > # end of Qualcomm SoC drivers
> >
> > # CONFIG_SOC_TI is not set
> >
> > #
> > # Xilinx SoC drivers
> > #
> > # CONFIG_XILINX_VCU is not set
> > # end of Xilinx SoC drivers
> > # end of SOC (System On Chip) specific Drivers
> >
> > # CONFIG_PM_DEVFREQ is not set
> > # CONFIG_EXTCON is not set
> > # CONFIG_MEMORY is not set
> > # CONFIG_IIO is not set
> > # CONFIG_NTB is not set
> > # CONFIG_VME_BUS is not set
> > # CONFIG_PWM is not set
> >
> > #
> > # IRQ chip support
> > #
> > # end of IRQ chip support
> >
> > # CONFIG_IPACK_BUS is not set
> > # CONFIG_RESET_CONTROLLER is not set
> >
> > #
> > # PHY Subsystem
> > #
> > # CONFIG_GENERIC_PHY is not set
> > # CONFIG_BCM_KONA_USB2_PHY is not set
> > # CONFIG_PHY_PXA_28NM_HSIC is not set
> > # CONFIG_PHY_PXA_28NM_USB2 is not set
> > # CONFIG_PHY_INTEL_EMMC is not set
> > # end of PHY Subsystem
> >
> > # CONFIG_POWERCAP is not set
> > # CONFIG_MCB is not set
> >
> > #
> > # Performance monitor support
> > #
> > # end of Performance monitor support
> >
> > CONFIG_RAS=3Dy
> > # CONFIG_USB4 is not set
> >
> > #
> > # Android
> > #
> > # CONFIG_ANDROID is not set
> > # end of Android
> >
> > # CONFIG_LIBNVDIMM is not set
> > # CONFIG_DAX is not set
> > CONFIG_NVMEM=3Dy
> > # CONFIG_NVMEM_SYSFS is not set
> >
> > #
> > # HW tracing support
> > #
> > # CONFIG_STM is not set
> > # CONFIG_INTEL_TH is not set
> > # end of HW tracing support
> >
> > # CONFIG_FPGA is not set
> > # CONFIG_TEE is not set
> > # CONFIG_UNISYS_VISORBUS is not set
> > # CONFIG_SIOX is not set
> > # CONFIG_SLIMBUS is not set
> > # CONFIG_INTERCONNECT is not set
> > # CONFIG_COUNTER is not set
> > # CONFIG_MOST is not set
> > # end of Device Drivers
> >
> > #
> > # File systems
> > #
> > CONFIG_DCACHE_WORD_ACCESS=3Dy
> > CONFIG_VALIDATE_FS_PARSER=3Dy
> > CONFIG_FS_IOMAP=3Dy
> > # CONFIG_EXT2_FS is not set
> > # CONFIG_EXT3_FS is not set
> > CONFIG_EXT4_FS=3Dy
> > CONFIG_EXT4_USE_FOR_EXT2=3Dy
> > CONFIG_EXT4_FS_POSIX_ACL=3Dy
> > CONFIG_EXT4_FS_SECURITY=3Dy
> > # CONFIG_EXT4_DEBUG is not set
> > CONFIG_JBD2=3Dy
> > # CONFIG_JBD2_DEBUG is not set
> > CONFIG_FS_MBCACHE=3Dy
> > # CONFIG_REISERFS_FS is not set
> > # CONFIG_JFS_FS is not set
> > CONFIG_XFS_FS=3Dy
> > CONFIG_XFS_QUOTA=3Dy
> > CONFIG_XFS_POSIX_ACL=3Dy
> > # CONFIG_XFS_RT is not set
> > # CONFIG_XFS_ONLINE_SCRUB is not set
> > # CONFIG_XFS_WARN is not set
> > # CONFIG_XFS_DEBUG is not set
> > # CONFIG_GFS2_FS is not set
> > # CONFIG_OCFS2_FS is not set
> > CONFIG_BTRFS_FS=3Dy
> > CONFIG_BTRFS_FS_POSIX_ACL=3Dy
> > CONFIG_BTRFS_FS_CHECK_INTEGRITY=3Dy
> > # CONFIG_BTRFS_FS_RUN_SANITY_TESTS is not set
> > CONFIG_BTRFS_DEBUG=3Dy
> > # CONFIG_BTRFS_ASSERT is not set
> > CONFIG_BTRFS_FS_REF_VERIFY=3Dy
> > CONFIG_NILFS2_FS=3Dm
> > CONFIG_F2FS_FS=3Dm
> > CONFIG_F2FS_STAT_FS=3Dy
> > CONFIG_F2FS_FS_XATTR=3Dy
> > CONFIG_F2FS_FS_POSIX_ACL=3Dy
> > CONFIG_F2FS_FS_SECURITY=3Dy
> > # CONFIG_F2FS_CHECK_FS is not set
> > # CONFIG_F2FS_IO_TRACE is not set
> > # CONFIG_F2FS_FAULT_INJECTION is not set
> > # CONFIG_F2FS_FS_COMPRESSION is not set
> > # CONFIG_FS_DAX is not set
> > CONFIG_FS_POSIX_ACL=3Dy
> > CONFIG_EXPORTFS=3Dy
> > CONFIG_EXPORTFS_BLOCK_OPS=3Dy
> > CONFIG_FILE_LOCKING=3Dy
> > CONFIG_MANDATORY_FILE_LOCKING=3Dy
> > # CONFIG_FS_ENCRYPTION is not set
> > # CONFIG_FS_VERITY is not set
> > CONFIG_FSNOTIFY=3Dy
> > CONFIG_DNOTIFY=3Dy
> > CONFIG_INOTIFY_USER=3Dy
> > CONFIG_FANOTIFY=3Dy
> > CONFIG_FANOTIFY_ACCESS_PERMISSIONS=3Dy
> > # CONFIG_QUOTA is not set
> > # CONFIG_QUOTA_NETLINK_INTERFACE is not set
> > CONFIG_QUOTACTL=3Dy
> > CONFIG_QUOTACTL_COMPAT=3Dy
> > CONFIG_AUTOFS4_FS=3Dy
> > CONFIG_AUTOFS_FS=3Dy
> > CONFIG_FUSE_FS=3Dm
> > # CONFIG_CUSE is not set
> > # CONFIG_VIRTIO_FS is not set
> > # CONFIG_OVERLAY_FS is not set
> >
> > #
> > # Caches
> > #
> > CONFIG_FSCACHE=3Dy
> > CONFIG_FSCACHE_STATS=3Dy
> > # CONFIG_FSCACHE_HISTOGRAM is not set
> > # CONFIG_FSCACHE_DEBUG is not set
> > CONFIG_FSCACHE_OBJECT_LIST=3Dy
> > CONFIG_CACHEFILES=3Dy
> > # CONFIG_CACHEFILES_DEBUG is not set
> > # CONFIG_CACHEFILES_HISTOGRAM is not set
> > # end of Caches
> >
> > #
> > # CD-ROM/DVD Filesystems
> > #
> > # CONFIG_ISO9660_FS is not set
> > # CONFIG_UDF_FS is not set
> > # end of CD-ROM/DVD Filesystems
> >
> > #
> > # DOS/FAT/EXFAT/NT Filesystems
> > #
> > # CONFIG_MSDOS_FS is not set
> > # CONFIG_VFAT_FS is not set
> > # CONFIG_EXFAT_FS is not set
> > # CONFIG_NTFS_FS is not set
> > # end of DOS/FAT/EXFAT/NT Filesystems
> >
> > #
> > # Pseudo filesystems
> > #
> > CONFIG_PROC_FS=3Dy
> > CONFIG_PROC_KCORE=3Dy
> > CONFIG_PROC_SYSCTL=3Dy
> > CONFIG_PROC_PAGE_MONITOR=3Dy
> > # CONFIG_PROC_CHILDREN is not set
> > CONFIG_PROC_PID_ARCH_STATUS=3Dy
> > CONFIG_PROC_CPU_RESCTRL=3Dy
> > CONFIG_KERNFS=3Dy
> > CONFIG_SYSFS=3Dy
> > CONFIG_TMPFS=3Dy
> > CONFIG_TMPFS_POSIX_ACL=3Dy
> > CONFIG_TMPFS_XATTR=3Dy
> > CONFIG_HUGETLBFS=3Dy
> > CONFIG_HUGETLB_PAGE=3Dy
> > CONFIG_MEMFD_CREATE=3Dy
> > CONFIG_ARCH_HAS_GIGANTIC_PAGE=3Dy
> > CONFIG_CONFIGFS_FS=3Dy
> > CONFIG_EFIVAR_FS=3Dy
> > # end of Pseudo filesystems
> >
> > CONFIG_MISC_FILESYSTEMS=3Dy
> > # CONFIG_ORANGEFS_FS is not set
> > # CONFIG_ADFS_FS is not set
> > # CONFIG_AFFS_FS is not set
> > # CONFIG_ECRYPT_FS is not set
> > # CONFIG_HFS_FS is not set
> > # CONFIG_HFSPLUS_FS is not set
> > # CONFIG_BEFS_FS is not set
> > # CONFIG_BFS_FS is not set
> > # CONFIG_EFS_FS is not set
> > # CONFIG_CRAMFS is not set
> > # CONFIG_SQUASHFS is not set
> > # CONFIG_VXFS_FS is not set
> > # CONFIG_MINIX_FS is not set
> > # CONFIG_OMFS_FS is not set
> > # CONFIG_HPFS_FS is not set
> > # CONFIG_QNX4FS_FS is not set
> > # CONFIG_QNX6FS_FS is not set
> > # CONFIG_ROMFS_FS is not set
> > CONFIG_PSTORE=3Dy
> > CONFIG_PSTORE_DEFLATE_COMPRESS=3Dy
> > # CONFIG_PSTORE_LZO_COMPRESS is not set
> > # CONFIG_PSTORE_LZ4_COMPRESS is not set
> > # CONFIG_PSTORE_LZ4HC_COMPRESS is not set
> > # CONFIG_PSTORE_842_COMPRESS is not set
> > # CONFIG_PSTORE_ZSTD_COMPRESS is not set
> > CONFIG_PSTORE_COMPRESS=3Dy
> > CONFIG_PSTORE_DEFLATE_COMPRESS_DEFAULT=3Dy
> > CONFIG_PSTORE_COMPRESS_DEFAULT=3D"deflate"
> > # CONFIG_PSTORE_CONSOLE is not set
> > # CONFIG_PSTORE_PMSG is not set
> > # CONFIG_PSTORE_FTRACE is not set
> > # CONFIG_PSTORE_RAM is not set
> > # CONFIG_SYSV_FS is not set
> > # CONFIG_UFS_FS is not set
> > # CONFIG_EROFS_FS is not set
> > CONFIG_NETWORK_FILESYSTEMS=3Dy
> > CONFIG_NFS_FS=3Dy
> > # CONFIG_NFS_V2 is not set
> > # CONFIG_NFS_V3 is not set
> > CONFIG_NFS_V4=3Dy
> > # CONFIG_NFS_SWAP is not set
> > # CONFIG_NFS_V4_1 is not set
> > # CONFIG_NFS_FSCACHE is not set
> > # CONFIG_NFS_USE_LEGACY_DNS is not set
> > CONFIG_NFS_USE_KERNEL_DNS=3Dy
> > CONFIG_NFS_DEBUG=3Dy
> > CONFIG_NFS_DISABLE_UDP_SUPPORT=3Dy
> > # CONFIG_NFSD is not set
> > CONFIG_GRACE_PERIOD=3Dy
> > CONFIG_LOCKD=3Dy
> > CONFIG_NFS_COMMON=3Dy
> > CONFIG_SUNRPC=3Dy
> > CONFIG_SUNRPC_GSS=3Dy
> > CONFIG_SUNRPC_DEBUG=3Dy
> > # CONFIG_CEPH_FS is not set
> > # CONFIG_CIFS is not set
> > # CONFIG_CODA_FS is not set
> > CONFIG_AFS_FS=3Dy
> > CONFIG_AFS_DEBUG=3Dy
> > CONFIG_AFS_FSCACHE=3Dy
> > CONFIG_AFS_DEBUG_CURSOR=3Dy
> > CONFIG_NLS=3Dy
> > CONFIG_NLS_DEFAULT=3D"iso8859-1"
> > # CONFIG_NLS_CODEPAGE_437 is not set
> > # CONFIG_NLS_CODEPAGE_737 is not set
> > # CONFIG_NLS_CODEPAGE_775 is not set
> > # CONFIG_NLS_CODEPAGE_850 is not set
> > # CONFIG_NLS_CODEPAGE_852 is not set
> > # CONFIG_NLS_CODEPAGE_855 is not set
> > # CONFIG_NLS_CODEPAGE_857 is not set
> > # CONFIG_NLS_CODEPAGE_860 is not set
> > # CONFIG_NLS_CODEPAGE_861 is not set
> > # CONFIG_NLS_CODEPAGE_862 is not set
> > # CONFIG_NLS_CODEPAGE_863 is not set
> > # CONFIG_NLS_CODEPAGE_864 is not set
> > # CONFIG_NLS_CODEPAGE_865 is not set
> > # CONFIG_NLS_CODEPAGE_866 is not set
> > # CONFIG_NLS_CODEPAGE_869 is not set
> > # CONFIG_NLS_CODEPAGE_936 is not set
> > # CONFIG_NLS_CODEPAGE_950 is not set
> > # CONFIG_NLS_CODEPAGE_932 is not set
> > # CONFIG_NLS_CODEPAGE_949 is not set
> > # CONFIG_NLS_CODEPAGE_874 is not set
> > # CONFIG_NLS_ISO8859_8 is not set
> > # CONFIG_NLS_CODEPAGE_1250 is not set
> > # CONFIG_NLS_CODEPAGE_1251 is not set
> > # CONFIG_NLS_ASCII is not set
> > # CONFIG_NLS_ISO8859_1 is not set
> > # CONFIG_NLS_ISO8859_2 is not set
> > # CONFIG_NLS_ISO8859_3 is not set
> > # CONFIG_NLS_ISO8859_4 is not set
> > # CONFIG_NLS_ISO8859_5 is not set
> > # CONFIG_NLS_ISO8859_6 is not set
> > # CONFIG_NLS_ISO8859_7 is not set
> > # CONFIG_NLS_ISO8859_9 is not set
> > # CONFIG_NLS_ISO8859_13 is not set
> > # CONFIG_NLS_ISO8859_14 is not set
> > # CONFIG_NLS_ISO8859_15 is not set
> > # CONFIG_NLS_KOI8_R is not set
> > # CONFIG_NLS_KOI8_U is not set
> > # CONFIG_NLS_MAC_ROMAN is not set
> > # CONFIG_NLS_MAC_CELTIC is not set
> > # CONFIG_NLS_MAC_CENTEURO is not set
> > # CONFIG_NLS_MAC_CROATIAN is not set
> > # CONFIG_NLS_MAC_CYRILLIC is not set
> > # CONFIG_NLS_MAC_GAELIC is not set
> > # CONFIG_NLS_MAC_GREEK is not set
> > # CONFIG_NLS_MAC_ICELAND is not set
> > # CONFIG_NLS_MAC_INUIT is not set
> > # CONFIG_NLS_MAC_ROMANIAN is not set
> > # CONFIG_NLS_MAC_TURKISH is not set
> > # CONFIG_NLS_UTF8 is not set
> > CONFIG_DLM=3Dy
> > # CONFIG_DLM_DEBUG is not set
> > # CONFIG_UNICODE is not set
> > # end of File systems
> >
> > #
> > # Security options
> > #
> > CONFIG_KEYS=3Dy
> > CONFIG_KEYS_REQUEST_CACHE=3Dy
> > CONFIG_PERSISTENT_KEYRINGS=3Dy
> > CONFIG_BIG_KEYS=3Dy
> > CONFIG_TRUSTED_KEYS=3Dy
> > CONFIG_ENCRYPTED_KEYS=3Dy
> > CONFIG_KEY_DH_OPERATIONS=3Dy
> > # CONFIG_SECURITY_DMESG_RESTRICT is not set
> > CONFIG_SECURITY=3Dy
> > CONFIG_SECURITY_WRITABLE_HOOKS=3Dy
> > CONFIG_SECURITYFS=3Dy
> > CONFIG_SECURITY_NETWORK=3Dy
> > CONFIG_PAGE_TABLE_ISOLATION=3Dy
> > CONFIG_SECURITY_NETWORK_XFRM=3Dy
> > CONFIG_SECURITY_PATH=3Dy
> > # CONFIG_INTEL_TXT is not set
> > CONFIG_LSM_MMAP_MIN_ADDR=3D65536
> > CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=3Dy
> > # CONFIG_HARDENED_USERCOPY is not set
> > # CONFIG_FORTIFY_SOURCE is not set
> > # CONFIG_STATIC_USERMODEHELPER is not set
> > CONFIG_SECURITY_SELINUX=3Dy
> > CONFIG_SECURITY_SELINUX_BOOTPARAM=3Dy
> > CONFIG_SECURITY_SELINUX_DISABLE=3Dy
> > CONFIG_SECURITY_SELINUX_DEVELOP=3Dy
> > CONFIG_SECURITY_SELINUX_AVC_STATS=3Dy
> > CONFIG_SECURITY_SELINUX_CHECKREQPROT_VALUE=3D1
> > CONFIG_SECURITY_SELINUX_SIDTAB_HASH_BITS=3D9
> > CONFIG_SECURITY_SELINUX_SID2STR_CACHE_SIZE=3D256
> > # CONFIG_SECURITY_SMACK is not set
> > # CONFIG_SECURITY_TOMOYO is not set
> > # CONFIG_SECURITY_APPARMOR is not set
> > # CONFIG_SECURITY_LOADPIN is not set
> > CONFIG_SECURITY_YAMA=3Dy
> > # CONFIG_SECURITY_SAFESETID is not set
> > # CONFIG_SECURITY_LOCKDOWN_LSM is not set
> > # CONFIG_INTEGRITY is not set
> > # CONFIG_IMA_SECURE_AND_OR_TRUSTED_BOOT is not set
> > CONFIG_DEFAULT_SECURITY_SELINUX=3Dy
> > # CONFIG_DEFAULT_SECURITY_DAC is not set
> > CONFIG_LSM=3D"yama,loadpin,safesetid,integrity,selinux,smack,tomoyo,app=
armor"
> >
> > #
> > # Kernel hardening options
> > #
> >
> > #
> > # Memory initialization
> > #
> > CONFIG_INIT_STACK_NONE=3Dy
> > # CONFIG_GCC_PLUGIN_STRUCTLEAK_USER is not set
> > # CONFIG_GCC_PLUGIN_STRUCTLEAK_BYREF is not set
> > # CONFIG_GCC_PLUGIN_STRUCTLEAK_BYREF_ALL is not set
> > # CONFIG_GCC_PLUGIN_STACKLEAK is not set
> > # CONFIG_INIT_ON_ALLOC_DEFAULT_ON is not set
> > # CONFIG_INIT_ON_FREE_DEFAULT_ON is not set
> > # end of Memory initialization
> > # end of Kernel hardening options
> > # end of Security options
> >
> > CONFIG_XOR_BLOCKS=3Dy
> > CONFIG_CRYPTO=3Dy
> >
> > #
> > # Crypto core or helper
> > #
> > # CONFIG_CRYPTO_FIPS is not set
> > CONFIG_CRYPTO_ALGAPI=3Dy
> > CONFIG_CRYPTO_ALGAPI2=3Dy
> > CONFIG_CRYPTO_AEAD=3Dy
> > CONFIG_CRYPTO_AEAD2=3Dy
> > CONFIG_CRYPTO_SKCIPHER=3Dy
> > CONFIG_CRYPTO_SKCIPHER2=3Dy
> > CONFIG_CRYPTO_HASH=3Dy
> > CONFIG_CRYPTO_HASH2=3Dy
> > CONFIG_CRYPTO_RNG=3Dy
> > CONFIG_CRYPTO_RNG2=3Dy
> > CONFIG_CRYPTO_RNG_DEFAULT=3Dy
> > CONFIG_CRYPTO_AKCIPHER2=3Dy
> > CONFIG_CRYPTO_AKCIPHER=3Dy
> > CONFIG_CRYPTO_KPP2=3Dy
> > CONFIG_CRYPTO_KPP=3Dy
> > CONFIG_CRYPTO_ACOMP2=3Dy
> > CONFIG_CRYPTO_MANAGER=3Dy
> > CONFIG_CRYPTO_MANAGER2=3Dy
> > # CONFIG_CRYPTO_USER is not set
> > # CONFIG_CRYPTO_MANAGER_DISABLE_TESTS is not set
> > # CONFIG_CRYPTO_MANAGER_EXTRA_TESTS is not set
> > CONFIG_CRYPTO_GF128MUL=3Dy
> > CONFIG_CRYPTO_NULL=3Dy
> > CONFIG_CRYPTO_NULL2=3Dy
> > # CONFIG_CRYPTO_PCRYPT is not set
> > # CONFIG_CRYPTO_CRYPTD is not set
> > CONFIG_CRYPTO_AUTHENC=3Dy
> > # CONFIG_CRYPTO_TEST is not set
> >
> > #
> > # Public-key cryptography
> > #
> > CONFIG_CRYPTO_RSA=3Dy
> > CONFIG_CRYPTO_DH=3Dy
> > # CONFIG_CRYPTO_ECDH is not set
> > # CONFIG_CRYPTO_ECRDSA is not set
> > # CONFIG_CRYPTO_CURVE25519 is not set
> > # CONFIG_CRYPTO_CURVE25519_X86 is not set
> >
> > #
> > # Authenticated Encryption with Associated Data
> > #
> > CONFIG_CRYPTO_CCM=3Dm
> > CONFIG_CRYPTO_GCM=3Dy
> > # CONFIG_CRYPTO_CHACHA20POLY1305 is not set
> > # CONFIG_CRYPTO_AEGIS128 is not set
> > # CONFIG_CRYPTO_AEGIS128_AESNI_SSE2 is not set
> > CONFIG_CRYPTO_SEQIV=3Dy
> > CONFIG_CRYPTO_ECHAINIV=3Dy
> >
> > #
> > # Block modes
> > #
> > CONFIG_CRYPTO_CBC=3Dy
> > # CONFIG_CRYPTO_CFB is not set
> > CONFIG_CRYPTO_CTR=3Dy
> > # CONFIG_CRYPTO_CTS is not set
> > CONFIG_CRYPTO_ECB=3Dy
> > # CONFIG_CRYPTO_LRW is not set
> > # CONFIG_CRYPTO_OFB is not set
> > CONFIG_CRYPTO_PCBC=3Dy
> > # CONFIG_CRYPTO_XTS is not set
> > # CONFIG_CRYPTO_KEYWRAP is not set
> > # CONFIG_CRYPTO_NHPOLY1305_SSE2 is not set
> > # CONFIG_CRYPTO_NHPOLY1305_AVX2 is not set
> > # CONFIG_CRYPTO_ADIANTUM is not set
> > # CONFIG_CRYPTO_ESSIV is not set
> >
> > #
> > # Hash modes
> > #
> > CONFIG_CRYPTO_CMAC=3Dm
> > CONFIG_CRYPTO_HMAC=3Dy
> > # CONFIG_CRYPTO_XCBC is not set
> > # CONFIG_CRYPTO_VMAC is not set
> >
> > #
> > # Digest
> > #
> > CONFIG_CRYPTO_CRC32C=3Dy
> > # CONFIG_CRYPTO_CRC32C_INTEL is not set
> > CONFIG_CRYPTO_CRC32=3Dm
> > # CONFIG_CRYPTO_CRC32_PCLMUL is not set
> > CONFIG_CRYPTO_XXHASH=3Dy
> > CONFIG_CRYPTO_BLAKE2B=3Dy
> > # CONFIG_CRYPTO_BLAKE2S is not set
> > # CONFIG_CRYPTO_BLAKE2S_X86 is not set
> > CONFIG_CRYPTO_CRCT10DIF=3Dy
> > # CONFIG_CRYPTO_CRCT10DIF_PCLMUL is not set
> > CONFIG_CRYPTO_GHASH=3Dy
> > # CONFIG_CRYPTO_POLY1305 is not set
> > # CONFIG_CRYPTO_POLY1305_X86_64 is not set
> > CONFIG_CRYPTO_MD4=3Dm
> > CONFIG_CRYPTO_MD5=3Dy
> > # CONFIG_CRYPTO_MICHAEL_MIC is not set
> > # CONFIG_CRYPTO_RMD128 is not set
> > # CONFIG_CRYPTO_RMD160 is not set
> > # CONFIG_CRYPTO_RMD256 is not set
> > # CONFIG_CRYPTO_RMD320 is not set
> > CONFIG_CRYPTO_SHA1=3Dy
> > # CONFIG_CRYPTO_SHA1_SSSE3 is not set
> > # CONFIG_CRYPTO_SHA256_SSSE3 is not set
> > # CONFIG_CRYPTO_SHA512_SSSE3 is not set
> > CONFIG_CRYPTO_SHA256=3Dy
> > CONFIG_CRYPTO_SHA512=3Dm
> > # CONFIG_CRYPTO_SHA3 is not set
> > # CONFIG_CRYPTO_SM3 is not set
> > # CONFIG_CRYPTO_STREEBOG is not set
> > # CONFIG_CRYPTO_TGR192 is not set
> > # CONFIG_CRYPTO_WP512 is not set
> > # CONFIG_CRYPTO_GHASH_CLMUL_NI_INTEL is not set
> >
> > #
> > # Ciphers
> > #
> > CONFIG_CRYPTO_AES=3Dy
> > # CONFIG_CRYPTO_AES_TI is not set
> > # CONFIG_CRYPTO_AES_NI_INTEL is not set
> > # CONFIG_CRYPTO_ANUBIS is not set
> > CONFIG_CRYPTO_ARC4=3Dm
> > # CONFIG_CRYPTO_BLOWFISH is not set
> > # CONFIG_CRYPTO_BLOWFISH_X86_64 is not set
> > # CONFIG_CRYPTO_CAMELLIA is not set
> > # CONFIG_CRYPTO_CAMELLIA_X86_64 is not set
> > # CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64 is not set
> > # CONFIG_CRYPTO_CAMELLIA_AESNI_AVX2_X86_64 is not set
> > # CONFIG_CRYPTO_CAST5 is not set
> > # CONFIG_CRYPTO_CAST5_AVX_X86_64 is not set
> > # CONFIG_CRYPTO_CAST6 is not set
> > # CONFIG_CRYPTO_CAST6_AVX_X86_64 is not set
> > CONFIG_CRYPTO_DES=3Dy
> > # CONFIG_CRYPTO_DES3_EDE_X86_64 is not set
> > CONFIG_CRYPTO_FCRYPT=3Dy
> > # CONFIG_CRYPTO_KHAZAD is not set
> > # CONFIG_CRYPTO_SALSA20 is not set
> > # CONFIG_CRYPTO_CHACHA20 is not set
> > # CONFIG_CRYPTO_CHACHA20_X86_64 is not set
> > # CONFIG_CRYPTO_SEED is not set
> > # CONFIG_CRYPTO_SERPENT is not set
> > # CONFIG_CRYPTO_SERPENT_SSE2_X86_64 is not set
> > # CONFIG_CRYPTO_SERPENT_AVX_X86_64 is not set
> > # CONFIG_CRYPTO_SERPENT_AVX2_X86_64 is not set
> > # CONFIG_CRYPTO_SM4 is not set
> > # CONFIG_CRYPTO_TEA is not set
> > # CONFIG_CRYPTO_TWOFISH is not set
> > # CONFIG_CRYPTO_TWOFISH_X86_64 is not set
> > # CONFIG_CRYPTO_TWOFISH_X86_64_3WAY is not set
> > # CONFIG_CRYPTO_TWOFISH_AVX_X86_64 is not set
> >
> > #
> > # Compression
> > #
> > CONFIG_CRYPTO_DEFLATE=3Dy
> > CONFIG_CRYPTO_LZO=3Dm
> > # CONFIG_CRYPTO_842 is not set
> > # CONFIG_CRYPTO_LZ4 is not set
> > # CONFIG_CRYPTO_LZ4HC is not set
> > # CONFIG_CRYPTO_ZSTD is not set
> >
> > #
> > # Random Number Generation
> > #
> > # CONFIG_CRYPTO_ANSI_CPRNG is not set
> > CONFIG_CRYPTO_DRBG_MENU=3Dy
> > CONFIG_CRYPTO_DRBG_HMAC=3Dy
> > # CONFIG_CRYPTO_DRBG_HASH is not set
> > # CONFIG_CRYPTO_DRBG_CTR is not set
> > CONFIG_CRYPTO_DRBG=3Dy
> > CONFIG_CRYPTO_JITTERENTROPY=3Dy
> > CONFIG_CRYPTO_USER_API=3Dy
> > CONFIG_CRYPTO_USER_API_HASH=3Dy
> > # CONFIG_CRYPTO_USER_API_SKCIPHER is not set
> > # CONFIG_CRYPTO_USER_API_RNG is not set
> > # CONFIG_CRYPTO_USER_API_AEAD is not set
> > CONFIG_CRYPTO_HASH_INFO=3Dy
> >
> > #
> > # Crypto library routines
> > #
> > CONFIG_CRYPTO_LIB_AES=3Dy
> > CONFIG_CRYPTO_LIB_ARC4=3Dm
> > # CONFIG_CRYPTO_LIB_BLAKE2S is not set
> > CONFIG_CRYPTO_LIB_CHACHA_GENERIC=3Dy
> > CONFIG_CRYPTO_LIB_CHACHA=3Dy
> > # CONFIG_CRYPTO_LIB_CURVE25519 is not set
> > CONFIG_CRYPTO_LIB_DES=3Dy
> > CONFIG_CRYPTO_LIB_POLY1305_RSIZE=3D11
> > CONFIG_CRYPTO_LIB_POLY1305_GENERIC=3Dy
> > CONFIG_CRYPTO_LIB_POLY1305=3Dy
> > CONFIG_CRYPTO_LIB_CHACHA20POLY1305=3Dy
> > CONFIG_CRYPTO_LIB_SHA256=3Dy
> > # CONFIG_CRYPTO_HW is not set
> > CONFIG_ASYMMETRIC_KEY_TYPE=3Dy
> > CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=3Dy
> > # CONFIG_ASYMMETRIC_TPM_KEY_SUBTYPE is not set
> > CONFIG_X509_CERTIFICATE_PARSER=3Dy
> > # CONFIG_PKCS8_PRIVATE_KEY_PARSER is not set
> > CONFIG_PKCS7_MESSAGE_PARSER=3Dy
> > CONFIG_PKCS7_TEST_KEY=3Dy
> > CONFIG_SIGNED_PE_FILE_VERIFICATION=3Dy
> >
> > #
> > # Certificates for signature checking
> > #
> > CONFIG_MODULE_SIG_KEY=3D"certs/signing_key.pem"
> > CONFIG_SYSTEM_TRUSTED_KEYRING=3Dy
> > CONFIG_SYSTEM_TRUSTED_KEYS=3D""
> > CONFIG_SYSTEM_EXTRA_CERTIFICATE=3Dy
> > CONFIG_SYSTEM_EXTRA_CERTIFICATE_SIZE=3D4096
> > CONFIG_SECONDARY_TRUSTED_KEYRING=3Dy
> > CONFIG_SYSTEM_BLACKLIST_KEYRING=3Dy
> > CONFIG_SYSTEM_BLACKLIST_HASH_LIST=3D"/data/modsign/blacklist"
> > # end of Certificates for signature checking
> >
> > CONFIG_BINARY_PRINTF=3Dy
> >
> > #
> > # Library routines
> > #
> > CONFIG_RAID6_PQ=3Dy
> > CONFIG_RAID6_PQ_BENCHMARK=3Dy
> > # CONFIG_PACKING is not set
> > CONFIG_BITREVERSE=3Dy
> > CONFIG_GENERIC_STRNCPY_FROM_USER=3Dy
> > CONFIG_GENERIC_STRNLEN_USER=3Dy
> > CONFIG_GENERIC_NET_UTILS=3Dy
> > CONFIG_GENERIC_FIND_FIRST_BIT=3Dy
> > # CONFIG_CORDIC is not set
> > CONFIG_RATIONAL=3Dy
> > CONFIG_GENERIC_PCI_IOMAP=3Dy
> > CONFIG_GENERIC_IOMAP=3Dy
> > CONFIG_ARCH_USE_CMPXCHG_LOCKREF=3Dy
> > CONFIG_ARCH_HAS_FAST_MULTIPLIER=3Dy
> > CONFIG_CRC_CCITT=3Dy
> > CONFIG_CRC16=3Dy
> > CONFIG_CRC_T10DIF=3Dy
> > CONFIG_CRC_ITU_T=3Dy
> > CONFIG_CRC32=3Dy
> > # CONFIG_CRC32_SELFTEST is not set
> > CONFIG_CRC32_SLICEBY8=3Dy
> > # CONFIG_CRC32_SLICEBY4 is not set
> > # CONFIG_CRC32_SARWATE is not set
> > # CONFIG_CRC32_BIT is not set
> > # CONFIG_CRC64 is not set
> > # CONFIG_CRC4 is not set
> > # CONFIG_CRC7 is not set
> > CONFIG_LIBCRC32C=3Dy
> > # CONFIG_CRC8 is not set
> > CONFIG_XXHASH=3Dy
> > # CONFIG_RANDOM32_SELFTEST is not set
> > CONFIG_ZLIB_INFLATE=3Dy
> > CONFIG_ZLIB_DEFLATE=3Dy
> > CONFIG_LZO_COMPRESS=3Dy
> > CONFIG_LZO_DECOMPRESS=3Dy
> > CONFIG_ZSTD_COMPRESS=3Dy
> > CONFIG_ZSTD_DECOMPRESS=3Dy
> > CONFIG_XZ_DEC=3Dy
> > CONFIG_XZ_DEC_X86=3Dy
> > # CONFIG_XZ_DEC_POWERPC is not set
> > # CONFIG_XZ_DEC_IA64 is not set
> > # CONFIG_XZ_DEC_ARM is not set
> > # CONFIG_XZ_DEC_ARMTHUMB is not set
> > # CONFIG_XZ_DEC_SPARC is not set
> > CONFIG_XZ_DEC_BCJ=3Dy
> > # CONFIG_XZ_DEC_TEST is not set
> > CONFIG_DECOMPRESS_GZIP=3Dy
> > CONFIG_GENERIC_ALLOCATOR=3Dy
> > CONFIG_INTERVAL_TREE=3Dy
> > CONFIG_ASSOCIATIVE_ARRAY=3Dy
> > CONFIG_HAS_IOMEM=3Dy
> > CONFIG_HAS_IOPORT_MAP=3Dy
> > CONFIG_HAS_DMA=3Dy
> > CONFIG_NEED_SG_DMA_LENGTH=3Dy
> > CONFIG_NEED_DMA_MAP_STATE=3Dy
> > CONFIG_ARCH_DMA_ADDR_T_64BIT=3Dy
> > CONFIG_SWIOTLB=3Dy
> > # CONFIG_DMA_API_DEBUG is not set
> > CONFIG_SGL_ALLOC=3Dy
> > CONFIG_IOMMU_HELPER=3Dy
> > CONFIG_CHECK_SIGNATURE=3Dy
> > CONFIG_CPU_RMAP=3Dy
> > CONFIG_DQL=3Dy
> > CONFIG_GLOB=3Dy
> > # CONFIG_GLOB_SELFTEST is not set
> > CONFIG_NLATTR=3Dy
> > CONFIG_CLZ_TAB=3Dy
> > # CONFIG_IRQ_POLL is not set
> > CONFIG_MPILIB=3Dy
> > CONFIG_OID_REGISTRY=3Dy
> > CONFIG_UCS2_STRING=3Dy
> > CONFIG_HAVE_GENERIC_VDSO=3Dy
> > CONFIG_GENERIC_GETTIMEOFDAY=3Dy
> > CONFIG_GENERIC_VDSO_TIME_NS=3Dy
> > CONFIG_FONT_SUPPORT=3Dy
> > CONFIG_FONT_8x16=3Dy
> > CONFIG_FONT_AUTOSELECT=3Dy
> > CONFIG_SG_POOL=3Dy
> > CONFIG_ARCH_HAS_PMEM_API=3Dy
> > CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE=3Dy
> > CONFIG_ARCH_HAS_UACCESS_MCSAFE=3Dy
> > CONFIG_ARCH_STACKWALK=3Dy
> > CONFIG_SBITMAP=3Dy
> > # CONFIG_STRING_SELFTEST is not set
> > # end of Library routines
> >
> > #
> > # Kernel hacking
> > #
> >
> > #
> > # printk and dmesg options
> > #
> > # CONFIG_PRINTK_TIME is not set
> > # CONFIG_PRINTK_CALLER is not set
> > CONFIG_CONSOLE_LOGLEVEL_DEFAULT=3D7
> > CONFIG_CONSOLE_LOGLEVEL_QUIET=3D4
> > CONFIG_MESSAGE_LOGLEVEL_DEFAULT=3D4
> > # CONFIG_BOOT_PRINTK_DELAY is not set
> > # CONFIG_DYNAMIC_DEBUG is not set
> > CONFIG_SYMBOLIC_ERRNAME=3Dy
> > CONFIG_DEBUG_BUGVERBOSE=3Dy
> > # end of printk and dmesg options
> >
> > #
> > # Compile-time checks and compiler options
> > #
> > CONFIG_DEBUG_INFO=3Dy
> > # CONFIG_DEBUG_INFO_REDUCED is not set
> > # CONFIG_DEBUG_INFO_SPLIT is not set
> > # CONFIG_DEBUG_INFO_DWARF4 is not set
> > # CONFIG_DEBUG_INFO_BTF is not set
> > # CONFIG_GDB_SCRIPTS is not set
> > # CONFIG_ENABLE_MUST_CHECK is not set
> > CONFIG_FRAME_WARN=3D2048
> > # CONFIG_STRIP_ASM_SYMS is not set
> > # CONFIG_READABLE_ASM is not set
> > CONFIG_HEADERS_INSTALL=3Dy
> > CONFIG_DEBUG_SECTION_MISMATCH=3Dy
> > CONFIG_SECTION_MISMATCH_WARN_ONLY=3Dy
> > CONFIG_STACK_VALIDATION=3Dy
> > # CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
> > # end of Compile-time checks and compiler options
> >
> > #
> > # Generic Kernel Debugging Instruments
> > #
> > CONFIG_MAGIC_SYSRQ=3Dy
> > CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=3D0x1
> > CONFIG_MAGIC_SYSRQ_SERIAL=3Dy
> > CONFIG_MAGIC_SYSRQ_SERIAL_SEQUENCE=3D""
> > CONFIG_DEBUG_FS=3Dy
> > CONFIG_HAVE_ARCH_KGDB=3Dy
> > # CONFIG_KGDB is not set
> > CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=3Dy
> > # CONFIG_UBSAN is not set
> > # end of Generic Kernel Debugging Instruments
> >
> > CONFIG_DEBUG_KERNEL=3Dy
> > CONFIG_DEBUG_MISC=3Dy
> >
> > #
> > # Memory Debugging
> > #
> > # CONFIG_PAGE_EXTENSION is not set
> > # CONFIG_DEBUG_PAGEALLOC is not set
> > # CONFIG_PAGE_OWNER is not set
> > # CONFIG_PAGE_POISONING is not set
> > # CONFIG_DEBUG_PAGE_REF is not set
> > # CONFIG_DEBUG_RODATA_TEST is not set
> > CONFIG_GENERIC_PTDUMP=3Dy
> > # CONFIG_PTDUMP_DEBUGFS is not set
> > # CONFIG_DEBUG_OBJECTS is not set
> > # CONFIG_DEBUG_SLAB is not set
> > CONFIG_HAVE_DEBUG_KMEMLEAK=3Dy
> > # CONFIG_DEBUG_KMEMLEAK is not set
> > # CONFIG_DEBUG_STACK_USAGE is not set
> > # CONFIG_SCHED_STACK_END_CHECK is not set
> > # CONFIG_DEBUG_VM is not set
> > CONFIG_ARCH_HAS_DEBUG_VIRTUAL=3Dy
> > # CONFIG_DEBUG_VIRTUAL is not set
> > # CONFIG_DEBUG_MEMORY_INIT is not set
> > # CONFIG_DEBUG_PER_CPU_MAPS is not set
> > CONFIG_HAVE_ARCH_KASAN=3Dy
> > CONFIG_HAVE_ARCH_KASAN_VMALLOC=3Dy
> > CONFIG_CC_HAS_KASAN_GENERIC=3Dy
> > # CONFIG_KASAN is not set
> > CONFIG_KASAN_STACK=3D1
> > # end of Memory Debugging
> >
> > # CONFIG_DEBUG_SHIRQ is not set
> >
> > #
> > # Debug Oops, Lockups and Hangs
> > #
> > # CONFIG_PANIC_ON_OOPS is not set
> > CONFIG_PANIC_ON_OOPS_VALUE=3D0
> > CONFIG_PANIC_TIMEOUT=3D0
> > CONFIG_LOCKUP_DETECTOR=3Dy
> > CONFIG_SOFTLOCKUP_DETECTOR=3Dy
> > # CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
> > CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC_VALUE=3D0
> > CONFIG_HARDLOCKUP_DETECTOR_PERF=3Dy
> > CONFIG_HARDLOCKUP_CHECK_TIMESTAMP=3Dy
> > CONFIG_HARDLOCKUP_DETECTOR=3Dy
> > # CONFIG_BOOTPARAM_HARDLOCKUP_PANIC is not set
> > CONFIG_BOOTPARAM_HARDLOCKUP_PANIC_VALUE=3D0
> > CONFIG_DETECT_HUNG_TASK=3Dy
> > CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=3D120
> > # CONFIG_BOOTPARAM_HUNG_TASK_PANIC is not set
> > CONFIG_BOOTPARAM_HUNG_TASK_PANIC_VALUE=3D0
> > CONFIG_WQ_WATCHDOG=3Dy
> > # CONFIG_TEST_LOCKUP is not set
> > # end of Debug Oops, Lockups and Hangs
> >
> > #
> > # Scheduler Debugging
> > #
> > # CONFIG_SCHED_DEBUG is not set
> > CONFIG_SCHED_INFO=3Dy
> > # CONFIG_SCHEDSTATS is not set
> > # end of Scheduler Debugging
> >
> > # CONFIG_DEBUG_TIMEKEEPING is not set
> >
> > #
> > # Lock Debugging (spinlocks, mutexes, etc...)
> > #
> > CONFIG_LOCK_DEBUGGING_SUPPORT=3Dy
> > # CONFIG_PROVE_LOCKING is not set
> > # CONFIG_LOCK_STAT is not set
> > CONFIG_DEBUG_RT_MUTEXES=3Dy
> > CONFIG_DEBUG_SPINLOCK=3Dy
> > CONFIG_DEBUG_MUTEXES=3Dy
> > # CONFIG_DEBUG_WW_MUTEX_SLOWPATH is not set
> > # CONFIG_DEBUG_RWSEMS is not set
> > # CONFIG_DEBUG_LOCK_ALLOC is not set
> > # CONFIG_DEBUG_ATOMIC_SLEEP is not set
> > # CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
> > # CONFIG_LOCK_TORTURE_TEST is not set
> > # CONFIG_WW_MUTEX_SELFTEST is not set
> > # end of Lock Debugging (spinlocks, mutexes, etc...)
> >
> > CONFIG_STACKTRACE=3Dy
> > # CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set
> > # CONFIG_DEBUG_KOBJECT is not set
> >
> > #
> > # Debug kernel data structures
> > #
> > # CONFIG_DEBUG_LIST is not set
> > # CONFIG_DEBUG_PLIST is not set
> > # CONFIG_DEBUG_SG is not set
> > # CONFIG_DEBUG_NOTIFIERS is not set
> > # CONFIG_BUG_ON_DATA_CORRUPTION is not set
> > # end of Debug kernel data structures
> >
> > # CONFIG_DEBUG_CREDENTIALS is not set
> >
> > #
> > # RCU Debugging
> > #
> > # CONFIG_RCU_PERF_TEST is not set
> > # CONFIG_RCU_TORTURE_TEST is not set
> > CONFIG_RCU_CPU_STALL_TIMEOUT=3D60
> > # CONFIG_RCU_TRACE is not set
> > # CONFIG_RCU_EQS_DEBUG is not set
> > # end of RCU Debugging
> >
> > # CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
> > # CONFIG_DEBUG_BLOCK_EXT_DEVT is not set
> > # CONFIG_CPU_HOTPLUG_STATE_CONTROL is not set
> > # CONFIG_LATENCYTOP is not set
> > CONFIG_USER_STACKTRACE_SUPPORT=3Dy
> > CONFIG_NOP_TRACER=3Dy
> > CONFIG_HAVE_FUNCTION_TRACER=3Dy
> > CONFIG_HAVE_FUNCTION_GRAPH_TRACER=3Dy
> > CONFIG_HAVE_DYNAMIC_FTRACE=3Dy
> > CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=3Dy
> > CONFIG_HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=3Dy
> > CONFIG_HAVE_FTRACE_MCOUNT_RECORD=3Dy
> > CONFIG_HAVE_SYSCALL_TRACEPOINTS=3Dy
> > CONFIG_HAVE_FENTRY=3Dy
> > CONFIG_HAVE_C_RECORDMCOUNT=3Dy
> > CONFIG_TRACE_CLOCK=3Dy
> > CONFIG_RING_BUFFER=3Dy
> > CONFIG_EVENT_TRACING=3Dy
> > CONFIG_CONTEXT_SWITCH_TRACER=3Dy
> > CONFIG_TRACING=3Dy
> > CONFIG_GENERIC_TRACER=3Dy
> > CONFIG_TRACING_SUPPORT=3Dy
> > CONFIG_FTRACE=3Dy
> > # CONFIG_BOOTTIME_TRACING is not set
> > CONFIG_FUNCTION_TRACER=3Dy
> > CONFIG_FUNCTION_GRAPH_TRACER=3Dy
> > CONFIG_DYNAMIC_FTRACE=3Dy
> > CONFIG_DYNAMIC_FTRACE_WITH_REGS=3Dy
> > CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=3Dy
> > # CONFIG_FUNCTION_PROFILER is not set
> > # CONFIG_STACK_TRACER is not set
> > # CONFIG_PREEMPTIRQ_EVENTS is not set
> > # CONFIG_IRQSOFF_TRACER is not set
> > # CONFIG_SCHED_TRACER is not set
> > # CONFIG_HWLAT_TRACER is not set
> > # CONFIG_MMIOTRACE is not set
> > CONFIG_FTRACE_SYSCALLS=3Dy
> > # CONFIG_TRACER_SNAPSHOT is not set
> > CONFIG_BRANCH_PROFILE_NONE=3Dy
> > # CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
> > # CONFIG_PROFILE_ALL_BRANCHES is not set
> > # CONFIG_BLK_DEV_IO_TRACE is not set
> > CONFIG_KPROBE_EVENTS=3Dy
> > # CONFIG_KPROBE_EVENTS_ON_NOTRACE is not set
> > # CONFIG_UPROBE_EVENTS is not set
> > CONFIG_BPF_EVENTS=3Dy
> > CONFIG_DYNAMIC_EVENTS=3Dy
> > CONFIG_PROBE_EVENTS=3Dy
> > # CONFIG_BPF_KPROBE_OVERRIDE is not set
> > CONFIG_FTRACE_MCOUNT_RECORD=3Dy
> > # CONFIG_HIST_TRIGGERS is not set
> > # CONFIG_TRACE_EVENT_INJECT is not set
> > # CONFIG_TRACEPOINT_BENCHMARK is not set
> > # CONFIG_RING_BUFFER_BENCHMARK is not set
> > # CONFIG_TRACE_EVAL_MAP_FILE is not set
> > # CONFIG_FTRACE_STARTUP_TEST is not set
> > # CONFIG_RING_BUFFER_STARTUP_TEST is not set
> > # CONFIG_PREEMPTIRQ_DELAY_TEST is not set
> > # CONFIG_KPROBE_EVENT_GEN_TEST is not set
> > # CONFIG_PROVIDE_OHCI1394_DMA_INIT is not set
> > CONFIG_SAMPLES=3Dy
> > # CONFIG_SAMPLE_TRACE_EVENTS is not set
> > # CONFIG_SAMPLE_TRACE_PRINTK is not set
> > # CONFIG_SAMPLE_FTRACE_DIRECT is not set
> > # CONFIG_SAMPLE_TRACE_ARRAY is not set
> > # CONFIG_SAMPLE_KOBJECT is not set
> > # CONFIG_SAMPLE_KPROBES is not set
> > # CONFIG_SAMPLE_HW_BREAKPOINT is not set
> > # CONFIG_SAMPLE_KFIFO is not set
> > # CONFIG_SAMPLE_LIVEPATCH is not set
> > # CONFIG_SAMPLE_CONFIGFS is not set
> > # CONFIG_SAMPLE_HIDRAW is not set
> > # CONFIG_SAMPLE_PIDFD is not set
> > # CONFIG_SAMPLE_SECCOMP is not set
> > # CONFIG_SAMPLE_VFIO_MDEV_MDPY_FB is not set
> > CONFIG_SAMPLE_VFS=3Dy
> > # CONFIG_SAMPLE_INTEL_MEI is not set
> > CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=3Dy
> >
> > #
> > # x86 Debugging
> > #
> > CONFIG_TRACE_IRQFLAGS_SUPPORT=3Dy
> > CONFIG_X86_VERBOSE_BOOTUP=3Dy
> > CONFIG_EARLY_PRINTK=3Dy
> > # CONFIG_EARLY_PRINTK_DBGP is not set
> > # CONFIG_EARLY_PRINTK_USB_XDBC is not set
> > # CONFIG_EFI_PGT_DUMP is not set
> > # CONFIG_DEBUG_WX is not set
> > CONFIG_DOUBLEFAULT=3Dy
> > # CONFIG_DEBUG_TLBFLUSH is not set
> > # CONFIG_IOMMU_DEBUG is not set
> > CONFIG_HAVE_MMIOTRACE_SUPPORT=3Dy
> > # CONFIG_X86_DECODER_SELFTEST is not set
> > CONFIG_IO_DELAY_0X80=3Dy
> > # CONFIG_IO_DELAY_0XED is not set
> > # CONFIG_IO_DELAY_UDELAY is not set
> > # CONFIG_IO_DELAY_NONE is not set
> > # CONFIG_DEBUG_BOOT_PARAMS is not set
> > # CONFIG_CPA_DEBUG is not set
> > # CONFIG_DEBUG_ENTRY is not set
> > # CONFIG_DEBUG_NMI_SELFTEST is not set
> > # CONFIG_X86_DEBUG_FPU is not set
> > # CONFIG_PUNIT_ATOM_DEBUG is not set
> > CONFIG_UNWINDER_ORC=3Dy
> > # CONFIG_UNWINDER_FRAME_POINTER is not set
> > # CONFIG_UNWINDER_GUESS is not set
> > # end of x86 Debugging
> >
> > #
> > # Kernel Testing and Coverage
> > #
> > # CONFIG_KUNIT is not set
> > # CONFIG_NOTIFIER_ERROR_INJECTION is not set
> > CONFIG_FUNCTION_ERROR_INJECTION=3Dy
> > # CONFIG_FAULT_INJECTION is not set
> > CONFIG_ARCH_HAS_KCOV=3Dy
> > CONFIG_CC_HAS_SANCOV_TRACE_PC=3Dy
> > # CONFIG_KCOV is not set
> > # CONFIG_RUNTIME_TESTING_MENU is not set
> > # CONFIG_MEMTEST is not set
> > # end of Kernel Testing and Coverage
> > # end of Kernel hacking
> =

> --
> Jani Nikula, Intel Open Source Graphics Center
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
