Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 176663C4AE
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 09:07:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFC1F89151;
	Tue, 11 Jun 2019 07:07:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4753F8909C
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 07:07:43 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 42DE372167; Tue, 11 Jun 2019 07:07:43 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110887] 5.0 kernel crash , drm:amdgpu_gem_va_ioctl [amdgpu]]
 *ERROR* Couldn't update BO_VA (-2)
Date: Tue, 11 Jun 2019 07:07:43 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: wormwang@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
Message-ID: <bug-110887-502@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Content-Type: multipart/mixed; boundary="===============1516597393=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1516597393==
Content-Type: multipart/alternative; boundary="15602368630.84C5faF.7756"
Content-Transfer-Encoding: 7bit


--15602368630.84C5faF.7756
Date: Tue, 11 Jun 2019 07:07:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110887

            Bug ID: 110887
           Summary: 5.0 kernel crash , drm:amdgpu_gem_va_ioctl [amdgpu]]
                    *ERROR* Couldn't update BO_VA (-2)
           Product: DRI
           Version: DRI git
          Hardware: ARM
                OS: Linux (All)
            Status: NEW
          Severity: critical
          Priority: medium
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: wormwang@yahoo.com

Env: kernel 5.0.13, AMD rx580 GPU 8GB


We run about 32 game soft on the GPU concurrently and run a media=20
encoder soft on VCE by vaapi at same time.

We meet the kernel crash, after runing 3 to 7 days. . We meet such crash=20
5 times. We had enabled kdump ,if you need other kernel dump info, we=20
can upload them


Log:

[172936.893428] binder_dkms: binder_deferred_func, binder_index =3D 12
[172937.052608] pci_generic_config_write32: 138 callbacks suppressed
[172937.052615] pci_bus 000d:30: 2-byte config write to 000d:30:00.0=20
offset 0x4 may corrupt adjacent RW1C bits
[172937.052633] pci_bus 000c:20: 2-byte config write to 000c:20:00.0=20
offset 0x44 may corrupt adjacent RW1C bits
[172937.054110] amdgpu 000d:31:00.0: couldn't schedule ib on ring <gfx>
[172937.062690] [drm:amdgpu_job_run [amdgpu]] *ERROR* Error scheduling=20
IBs (-22)
[172937.069361] pci_bus 000c:20: 2-byte config write to 000c:20:00.0=20
offset 0x78 may corrupt adjacent RW1C bits
[172937.071029] pci_bus 000c:20: 2-byte config write to 000c:20:00.0=20
offset 0x80 may corrupt adjacent RW1C bits
[172937.071034] pci_bus 000c:20: 2-byte config write to 000c:20:00.0=20
offset 0x8c may corrupt adjacent RW1C bits
[172937.071038] pci_bus 000c:20: 2-byte config write to 000c:20:00.0=20
offset 0x98 may corrupt adjacent RW1C bits
[172937.071042] pci_bus 000c:20: 2-byte config write to 000c:20:00.0=20
offset 0xa0 may corrupt adjacent RW1C bits
[172937.071083] pci_bus 000c:20: 2-byte config write to 000c:20:00.0=20
offset 0x44 may corrupt adjacent RW1C bits
[172937.071091] amdgpu 000d:31:00.0: couldn't schedule ib on ring <gfx>
[172937.071094] pci_bus 000c:20: 2-byte config write to 000c:20:00.0=20
offset 0x44 may corrupt adjacent RW1C bits
[172937.071110] pci_bus 000c:20: 2-byte config write to 000c:20:00.0=20
offset 0x4 may corrupt adjacent RW1C bits
[172937.079477] [drm:amdgpu_job_run [amdgpu]] *ERROR* Error scheduling=20
IBs (-22)
[172937.087723] amdgpu 000d:31:00.0: couldn't schedule ib on ring <gfx>
[172937.095955] [drm:amdgpu_job_run [amdgpu]] *ERROR* Error scheduling=20
IBs (-22)
[172937.104270] amdgpu 000d:31:00.0: couldn't schedule ib on ring <gfx>
[172937.112418] [drm:amdgpu_job_run [amdgpu]] *ERROR* Error scheduling=20
IBs (-22)
[172937.120490] amdgpu 000d:31:00.0: couldn't schedule ib on ring <gfx>
[172937.128525] [drm:amdgpu_job_run [amdgpu]] *ERROR* Error scheduling=20
IBs (-22)
[172937.136557] amdgpu 000d:31:00.0: couldn't schedule ib on ring <gfx>
[172937.144446] [drm:amdgpu_job_run [amdgpu]] *ERROR* Error scheduling=20
IBs (-22)
[172937.152254] amdgpu 000d:31:00.0: couldn't schedule ib on ring <gfx>
[172937.160039] [drm:amdgpu_job_run [amdgpu]] *ERROR* Error scheduling=20
IBs (-22)
[172937.167779] amdgpu 000d:31:00.0: couldn't schedule ib on ring <gfx>
[172937.175490] [drm:amdgpu_job_run [amdgpu]] *ERROR* Error scheduling=20
IBs (-22)
[172937.176747] binder_dkms: binder_defer_work 12
[172937.183035] amdgpu 000d:31:00.0: couldn't schedule ib on ring <gfx>
[172937.183075] binder_dkms: binder_deferred_func, binder_index =3D 12
[172937.355641] [drm:amdgpu_job_run [amdgpu]] *ERROR* Error scheduling=20
IBs (-22)
[172937.362028] amdgpu 000d:31:00.0: couldn't schedule ib on ring <gfx>
[172937.368253] pcieport 0004:48:00.0: can't derive routing for PCI INT A
[172937.368425] megaraid_sas 0004:49:00.0: PCI INT A: no GSI
[172937.368585] [drm:amdgpu_job_run [amdgpu]] *ERROR* Error scheduling=20
IBs (-22)
[172937.370828] amdgpu 0005:01:00.0: couldn't schedule ib on ring <gfx>
[172937.375070] amdgpu 000d:31:00.0: couldn't schedule ib on ring <gfx>
[172937.375167] [drm:amdgpu_job_run [amdgpu]] *ERROR* Error scheduling=20
IBs (-22)
[172937.375190] amdgpu 000d:31:00.0: couldn't schedule ib on ring <gfx>
[172937.381702] [drm:amdgpu_job_run [amdgpu]] *ERROR* Error scheduling=20
IBs (-22)
[172937.381732] amdgpu 0005:01:00.0: couldn't schedule ib on ring <gfx>
[172937.387959] [drm:amdgpu_job_run [amdgpu]] *ERROR* Error scheduling=20
IBs (-22)
[172937.387990] amdgpu 000d:31:00.0: couldn't schedule ib on ring <gfx>
[172937.394171] [drm:amdgpu_job_run [amdgpu]] *ERROR* Error scheduling=20
IBs (-22)
[172937.394186] amdgpu 0005:01:00.0: couldn't schedule ib on ring <gfx>
[172937.400498] [drm:amdgpu_job_run [amdgpu]] *ERROR* Error scheduling=20
IBs (-22)
[172937.400523] amdgpu 000d:31:00.0: couldn't schedule ib on ring <gfx>
[172937.406755] [drm:amdgpu_job_run [amdgpu]] *ERROR* Error scheduling=20
IBs (-22)
[172937.406775] amdgpu 0005:01:00.0: couldn't schedule ib on ring <gfx>
[172937.412977] [drm:amdgpu_job_run [amdgpu]] *ERROR* Error scheduling=20
IBs (-22)
[172937.412998] amdgpu 000d:31:00.0: couldn't schedule ib on ring <gfx>
[172937.419250] [drm:amdgpu_job_run [amdgpu]] *ERROR* Error scheduling=20
IBs (-22)
[172937.419273] amdgpu 0005:01:00.0: couldn't schedule ib on ring <gfx>
[172937.422361] [drm] schedsdma0 is not ready, skipping
[172937.422363] [drm] schedsdma1 is not ready, skipping
[172937.422448] [drm:amdgpu_gem_va_ioctl [amdgpu]] *ERROR* Couldn't=20
update BO_VA (-2)
[172937.425437] [drm:amdgpu_job_run [amdgpu]] *ERROR* Error scheduling=20
IBs (-22)
[172937.425450] amdgpu 000d:31:00.0: couldn't schedule ib on ring <gfx>
[172937.431814] [drm:amdgpu_job_run [amdgpu]] *ERROR* Error scheduling=20
IBs (-22)
[172937.431837] amdgpu 0005:01:00.0: couldn't schedule ib on ring <gfx>
[172937.438038] [drm:amdgpu_job_run [amdgpu]] *ERROR* Error scheduling=20
IBs (-22)
[172937.438054] amdgpu 000d:31:00.0: couldn't schedule ib on ring <gfx>
[172937.450635] amdgpu 000d:31:00.0: couldn't schedule ib on ring <gfx>
[172937.454268] pcieport 0002:e8:00.0: can't derive routing for PCI INT B
[172937.454272] ixgbe 0002:e9:00.1: PCI INT B: no GSI
[172937.456923] [drm:amdgpu_job_run [amdgpu]] *ERROR* Error scheduling=20
IBs (-22)
[172937.456967] amdgpu 0005:01:00.0: couldn't schedule ib on ring <gfx>
[172937.463122] [drm:amdgpu_job_run [amdgpu]] *ERROR* Error scheduling=20
IBs (-22)
[172937.463148] amdgpu 000d:31:00.0: couldn't schedule ib on ring <gfx>
[172937.469428] [drm:amdgpu_job_run [amdgpu]] *ERROR* Error scheduling=20
IBs (-22)
[172937.469455] amdgpu 0005:01:00.0: couldn't schedule ib on ring <gfx>
[172937.475705] [drm:amdgpu_job_run [amdgpu]] *ERROR* Error scheduling=20
IBs (-22)
[172937.475722] amdgpu 000d:31:00.0: couldn't schedule ib on ring <gfx>
[172937.481928] [drm:amdgpu_job_run [amdgpu]] *ERROR* Error scheduling=20
IBs (-22)
[172937.481946] amdgpu 0005:01:00.0: couldn't schedule ib on ring <gfx>
[172937.488092] [drm:amdgpu_job_run [amdgpu]] *ERROR* Error scheduling=20
IBs (-22)
[172937.488108] amdgpu 000d:31:00.0: couldn't schedule ib on ring <gfx>
[172937.494407] [drm:amdgpu_job_run [amdgpu]] *ERROR* Error scheduling=20
IBs (-22)
[172937.494440] amdgpu 0005:01:00.0: couldn't schedule ib on ring <gfx>
[172937.500663] [drm:amdgpu_job_run [amdgpu]] *ERROR* Error scheduling=20
IBs (-22)
[172937.500678] amdgpu 000d:31:00.0: couldn't schedule ib on ring <gfx>
[172937.506909] [drm:amdgpu_job_run [amdgpu]] *ERROR* Error scheduling=20
IBs (-22)
[172937.506930] amdgpu 0005:01:00.0: couldn't schedule ib on ring <gfx>
[172937.511392] [drm] schedsdma0 is not ready, skipping
[172937.511394] [drm] schedsdma1 is not ready, skipping
[172937.511481] [drm:amdgpu_gem_va_ioctl [amdgpu]] *ERROR* Couldn't=20
update BO_VA (-2)
[172937.512346] Unable to handle kernel access to user memory outside=20
uaccess routines at virtual address 0000000000000008
[172937.512348] Mem abort info:
[172937.512350]???? ESR =3D 0x96000004
[172937.512352]???? Exception class =3D DABT (current EL), IL =3D 32 bits
[172937.512353]???? SET =3D 0, FnV =3D 0
[172937.512354]???? EA =3D 0, S1PTW =3D 0
[172937.512355] Data abort info:
[172937.512356]???? ISV =3D 0, ISS =3D 0x00000004
[172937.512357]???? CM =3D 0, WnR =3D 0
[172937.512359] user pgtable: 4k pages, 48-bit VAs, pgdp =3D 00000000fb340b=
c6
[172937.512361] [0000000000000008] pgd=3D000000139dfe9003,=20
pud=3D00000015d583a003, pmd=3D0000000000000000
[172937.512367] Internal error: Oops: 96000004 [#1] SMP
[172937.512370] Modules linked in: nfnetlink_log veth ipt_REJECT=20
nf_reject_ipv4 xt_comment xt_mark xt_nat xt_tcpudp ipt_MASQUERADE=20
nf_conntrack_netlink nfnetlink xfrm_user xt_conntrack br_netfilter=20
bridge stp llc iptable_filter xt_addrtype iptable_nat nf_nat_ipv4 nf_nat=20
bpfilter ip_vs_sh ip_vs_wrr ip_vs_rr ip_vs nf_conntrack nf_defrag_ipv6=20
nf_defrag_ipv4 overlay nls_iso8859_1 joydev input_leds snd_hda_intel=20
snd_hda_codec snd_hda_core snd_hwdep snd_pcm snd_timer ipmi_ssif snd=20
ipmi_si soundcore ipmi_devintf ipmi_msghandler tcp_bbr sch_fq ib_iser=20
rdma_cm iw_cm ib_cm ib_core iscsi_tcp libiscsi_tcp libiscsi=20
scsi_transport_iscsi binder_dkms(OE) ip_tables x_tables autofs4 btrfs=20
zstd_compress raid10 raid456 async_raid6_recov async_memcpy async_pq=20
async_xor async_tx xor xor_neon raid6_pq libcrc32c raid1 raid0 multipath=20
linear hibmc_drm hid_generic usbhid hid ses enclosure marvell aes_ce_blk=20
aes_ce_cipher amdgpu chash i2c_algo_bit gpu_sched ttm crct10dif_ce=20
drm_kms_helper ghash_ce syscopyarea sha2_ce
[172937.512432]?? sysfillrect sysimgblt fb_sys_fops sha256_arm64 sha1_ce=20
ixgbe drm hisi_sas_v2_hw hisi_sas_main megaraid_sas xfrm_algo libsas=20
mdio ehci_platform scsi_transport_sas hns_dsaf hns_enet_drv hns_mdio=20
hnae aes_neon_bs aes_neon_blk crypto_simd cryptd aes_arm64
[172937.512448] Process RenderThread (pid: 1569015, stack limit =3D=20
0x00000000349701c4)
[172937.512451] CPU: 23 PID: 1569015 Comm: RenderThread Kdump: loaded=20
Tainted: G???????????????????? OE???????? 5.0.13-1905061257-generic #appstr=
eam
[172937.512453] Hardware name: Huawei TaiShan 2280 /BC11SPCD, BIOS 1.58=20
10/24/2018
[172937.512454] pstate: 80400005 (Nzcv daif +PAN -UAO)
[172937.512531] pc : amdgpu_vm_bo_update_mapping+0x120/0x3a0 [amdgpu]
[172937.512603] lr : amdgpu_vm_bo_update+0x2a4/0x6b8 [amdgpu]
[172937.512604] sp : ffff0000c0e4b8c0
[172937.512605] x29: ffff0000c0e4b8c0 x28: ffff801fd3010000
[172937.512608] x27: 0000000000000001 x26: ffff80161d777000
[172937.512610] x25: 0000000000100d1f x24: 0000000000100d00
[172937.512612] x23: 0000000000000000 x22: ffff809533c54f00
[172937.512614] x21: 0000000000000037 x20: ffff0000116cc000
[172937.512616] x19: 000000000000000a x18: 0000000000000000
[172937.512618] x17: 0000000000000000 x16: 0000000000000000
[172937.512620] x15: 0000000000000000 x14: 00000003000000b0
[172937.512623] x13: 0000000600000240 x12: 0000000000000000
[172937.512624] x11: 000000060000018d x10: 0000000000000040
[172937.512627] x9 : 0000000000000000 x8 : ffff0000c0e4b860
[172937.512628] x7 : 0000000000000020 x6 : 000000000000001f
[172937.512631] x5 : 0000000000100d1f x4 : 0000000000100d00
[172937.512633] x3 : 0000000000000000 x2 : 000000000000000b
[172937.512636] x1 : 0000000000000000 x0 :=20
ffff80161d776000[172937.512638] Call trace:
[172937.512711]?? amdgpu_vm_bo_update_mapping+0x120/0x3a0 [amdgpu]
[172937.512784]?? amdgpu_vm_bo_update+0x2a4/0x6b8 [amdgpu]
[172937.512857]?? amdgpu_cs_ioctl+0xcbc/0x14a8 [amdgpu]
[172937.512882]?? drm_ioctl_kernel+0x90/0x100 [drm]
[172937.512904]?? drm_ioctl+0x1ec/0x418 [drm]
[172937.512977]?? amdgpu_drm_ioctl+0x58/0x90 [amdgpu]
[172937.513055] [drm:amdgpu_job_run [amdgpu]] *ERROR* Error scheduling=20
IBs (-22)
[172937.513136]?? amdgpu_kms_compat_ioctl+0x40/0x68 [amdgpu]
[172937.513140] amdgpu 000d:31:00.0: couldn't schedule ib on ring <gfx>
[172937.513220] [drm:amdgpu_job_run [amdgpu]] *ERROR* Error scheduling=20
IBs (-22)
[172937.513235] amdgpu 000d:31:00.0: couldn't schedule ib on ring <gfx>
[172937.513311] [drm:amdgpu_job_run [amdgpu]] *ERROR* Error scheduling=20
IBs (-22)
[172937.513323] amdgpu 000d:31:00.0: couldn't schedule ib on ring <gfx>
[172937.513412] [drm:amdgpu_job_run [amdgpu]] *ERROR* Error scheduling=20
IBs (-22)
[172937.513421] amdgpu 000d:31:00.0: couldn't schedule ib on ring <gfx>
[172937.513497] [drm:amdgpu_job_run [amdgpu]] *ERROR* Error scheduling=20
IBs (-22)
[172937.513513] amdgpu 000d:31:00.0: couldn't schedule ib on ring <gfx>
[172937.513587] [drm:amdgpu_job_run [amdgpu]] *ERROR* Error scheduling=20
IBs (-22)
[172937.513603] amdgpu 000d:31:00.0: couldn't schedule ib on ring <gfx>
[172937.513677] [drm:amdgpu_job_run [amdgpu]] *ERROR* Error scheduling=20
IBs (-22)
[172937.513687] amdgpu 000d:31:00.0: couldn't schedule ib on ring <gfx>
[172937.513761] [drm:amdgpu_job_run [amdgpu]] *ERROR* Error scheduling=20
IBs (-22)
[172937.522750] amdgpu 000d:31:00.0: couldn't schedule ib on ring <gfx>
[172937.522822] [drm:amdgpu_job_run [amdgpu]] *ERROR* Error scheduling=20
IBs (-22)
[172937.525171]?? __arm64_compat_sys_ioctl+0x144/0x410
[172937.525177]?? el0_svc_common+0x78/0x120
[172937.525179]?? el0_svc_compat_handler+0x30/0x40
[172937.525182]?? el0_svc_compat+0x8/0x34
[172937.525187] Code: f9406b41 b966c793 f941e800 71002e7f (f9400421)
[172937.525195] SMP: stopping secondary CPUs
[172937.526945] Starting crashdump kernel...
[172937.526952] Bye!

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15602368630.84C5faF.7756
Date: Tue, 11 Jun 2019 07:07:43 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - 5.0 kernel crash , drm:amdgpu_gem_va_ioctl [amdgpu]] *ERR=
OR* Couldn't update BO_VA (-2)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110887">110887</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>5.0 kernel crash , drm:amdgpu_gem_va_ioctl [amdgpu]] *ERROR* =
Couldn't update BO_VA (-2)
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>DRI
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>DRI git
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>ARM
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>critical
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>DRM/AMDgpu
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>wormwang&#64;yahoo.com
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Env: kernel 5.0.13, AMD rx580 GPU 8GB


We run about 32 game soft on the GPU concurrently and run a media=20
encoder soft on VCE by vaapi at same time.

We meet the kernel crash, after runing 3 to 7 days. . We meet such crash=20
5 times. We had enabled kdump ,if you need other kernel dump info, we=20
can upload them


Log:

[172936.893428] binder_dkms: binder_deferred_func, binder_index =3D 12
[172937.052608] pci_generic_config_write32: 138 callbacks suppressed
[172937.052615] pci_bus 000d:30: 2-byte config write to 000d:30:00.0=20
offset 0x4 may corrupt adjacent RW1C bits
[172937.052633] pci_bus 000c:20: 2-byte config write to 000c:20:00.0=20
offset 0x44 may corrupt adjacent RW1C bits
[172937.054110] amdgpu 000d:31:00.0: couldn't schedule ib on ring &lt;gfx&g=
t;
[172937.062690] [drm:amdgpu_job_run [amdgpu]] *ERROR* Error scheduling=20
IBs (-22)
[172937.069361] pci_bus 000c:20: 2-byte config write to 000c:20:00.0=20
offset 0x78 may corrupt adjacent RW1C bits
[172937.071029] pci_bus 000c:20: 2-byte config write to 000c:20:00.0=20
offset 0x80 may corrupt adjacent RW1C bits
[172937.071034] pci_bus 000c:20: 2-byte config write to 000c:20:00.0=20
offset 0x8c may corrupt adjacent RW1C bits
[172937.071038] pci_bus 000c:20: 2-byte config write to 000c:20:00.0=20
offset 0x98 may corrupt adjacent RW1C bits
[172937.071042] pci_bus 000c:20: 2-byte config write to 000c:20:00.0=20
offset 0xa0 may corrupt adjacent RW1C bits
[172937.071083] pci_bus 000c:20: 2-byte config write to 000c:20:00.0=20
offset 0x44 may corrupt adjacent RW1C bits
[172937.071091] amdgpu 000d:31:00.0: couldn't schedule ib on ring &lt;gfx&g=
t;
[172937.071094] pci_bus 000c:20: 2-byte config write to 000c:20:00.0=20
offset 0x44 may corrupt adjacent RW1C bits
[172937.071110] pci_bus 000c:20: 2-byte config write to 000c:20:00.0=20
offset 0x4 may corrupt adjacent RW1C bits
[172937.079477] [drm:amdgpu_job_run [amdgpu]] *ERROR* Error scheduling=20
IBs (-22)
[172937.087723] amdgpu 000d:31:00.0: couldn't schedule ib on ring &lt;gfx&g=
t;
[172937.095955] [drm:amdgpu_job_run [amdgpu]] *ERROR* Error scheduling=20
IBs (-22)
[172937.104270] amdgpu 000d:31:00.0: couldn't schedule ib on ring &lt;gfx&g=
t;
[172937.112418] [drm:amdgpu_job_run [amdgpu]] *ERROR* Error scheduling=20
IBs (-22)
[172937.120490] amdgpu 000d:31:00.0: couldn't schedule ib on ring &lt;gfx&g=
t;
[172937.128525] [drm:amdgpu_job_run [amdgpu]] *ERROR* Error scheduling=20
IBs (-22)
[172937.136557] amdgpu 000d:31:00.0: couldn't schedule ib on ring &lt;gfx&g=
t;
[172937.144446] [drm:amdgpu_job_run [amdgpu]] *ERROR* Error scheduling=20
IBs (-22)
[172937.152254] amdgpu 000d:31:00.0: couldn't schedule ib on ring &lt;gfx&g=
t;
[172937.160039] [drm:amdgpu_job_run [amdgpu]] *ERROR* Error scheduling=20
IBs (-22)
[172937.167779] amdgpu 000d:31:00.0: couldn't schedule ib on ring &lt;gfx&g=
t;
[172937.175490] [drm:amdgpu_job_run [amdgpu]] *ERROR* Error scheduling=20
IBs (-22)
[172937.176747] binder_dkms: binder_defer_work 12
[172937.183035] amdgpu 000d:31:00.0: couldn't schedule ib on ring &lt;gfx&g=
t;
[172937.183075] binder_dkms: binder_deferred_func, binder_index =3D 12
[172937.355641] [drm:amdgpu_job_run [amdgpu]] *ERROR* Error scheduling=20
IBs (-22)
[172937.362028] amdgpu 000d:31:00.0: couldn't schedule ib on ring &lt;gfx&g=
t;
[172937.368253] pcieport 0004:48:00.0: can't derive routing for PCI INT A
[172937.368425] megaraid_sas 0004:49:00.0: PCI INT A: no GSI
[172937.368585] [drm:amdgpu_job_run [amdgpu]] *ERROR* Error scheduling=20
IBs (-22)
[172937.370828] amdgpu 0005:01:00.0: couldn't schedule ib on ring &lt;gfx&g=
t;
[172937.375070] amdgpu 000d:31:00.0: couldn't schedule ib on ring &lt;gfx&g=
t;
[172937.375167] [drm:amdgpu_job_run [amdgpu]] *ERROR* Error scheduling=20
IBs (-22)
[172937.375190] amdgpu 000d:31:00.0: couldn't schedule ib on ring &lt;gfx&g=
t;
[172937.381702] [drm:amdgpu_job_run [amdgpu]] *ERROR* Error scheduling=20
IBs (-22)
[172937.381732] amdgpu 0005:01:00.0: couldn't schedule ib on ring &lt;gfx&g=
t;
[172937.387959] [drm:amdgpu_job_run [amdgpu]] *ERROR* Error scheduling=20
IBs (-22)
[172937.387990] amdgpu 000d:31:00.0: couldn't schedule ib on ring &lt;gfx&g=
t;
[172937.394171] [drm:amdgpu_job_run [amdgpu]] *ERROR* Error scheduling=20
IBs (-22)
[172937.394186] amdgpu 0005:01:00.0: couldn't schedule ib on ring &lt;gfx&g=
t;
[172937.400498] [drm:amdgpu_job_run [amdgpu]] *ERROR* Error scheduling=20
IBs (-22)
[172937.400523] amdgpu 000d:31:00.0: couldn't schedule ib on ring &lt;gfx&g=
t;
[172937.406755] [drm:amdgpu_job_run [amdgpu]] *ERROR* Error scheduling=20
IBs (-22)
[172937.406775] amdgpu 0005:01:00.0: couldn't schedule ib on ring &lt;gfx&g=
t;
[172937.412977] [drm:amdgpu_job_run [amdgpu]] *ERROR* Error scheduling=20
IBs (-22)
[172937.412998] amdgpu 000d:31:00.0: couldn't schedule ib on ring &lt;gfx&g=
t;
[172937.419250] [drm:amdgpu_job_run [amdgpu]] *ERROR* Error scheduling=20
IBs (-22)
[172937.419273] amdgpu 0005:01:00.0: couldn't schedule ib on ring &lt;gfx&g=
t;
[172937.422361] [drm] schedsdma0 is not ready, skipping
[172937.422363] [drm] schedsdma1 is not ready, skipping
[172937.422448] [drm:amdgpu_gem_va_ioctl [amdgpu]] *ERROR* Couldn't=20
update BO_VA (-2)
[172937.425437] [drm:amdgpu_job_run [amdgpu]] *ERROR* Error scheduling=20
IBs (-22)
[172937.425450] amdgpu 000d:31:00.0: couldn't schedule ib on ring &lt;gfx&g=
t;
[172937.431814] [drm:amdgpu_job_run [amdgpu]] *ERROR* Error scheduling=20
IBs (-22)
[172937.431837] amdgpu 0005:01:00.0: couldn't schedule ib on ring &lt;gfx&g=
t;
[172937.438038] [drm:amdgpu_job_run [amdgpu]] *ERROR* Error scheduling=20
IBs (-22)
[172937.438054] amdgpu 000d:31:00.0: couldn't schedule ib on ring &lt;gfx&g=
t;
[172937.450635] amdgpu 000d:31:00.0: couldn't schedule ib on ring &lt;gfx&g=
t;
[172937.454268] pcieport 0002:e8:00.0: can't derive routing for PCI INT B
[172937.454272] ixgbe 0002:e9:00.1: PCI INT B: no GSI
[172937.456923] [drm:amdgpu_job_run [amdgpu]] *ERROR* Error scheduling=20
IBs (-22)
[172937.456967] amdgpu 0005:01:00.0: couldn't schedule ib on ring &lt;gfx&g=
t;
[172937.463122] [drm:amdgpu_job_run [amdgpu]] *ERROR* Error scheduling=20
IBs (-22)
[172937.463148] amdgpu 000d:31:00.0: couldn't schedule ib on ring &lt;gfx&g=
t;
[172937.469428] [drm:amdgpu_job_run [amdgpu]] *ERROR* Error scheduling=20
IBs (-22)
[172937.469455] amdgpu 0005:01:00.0: couldn't schedule ib on ring &lt;gfx&g=
t;
[172937.475705] [drm:amdgpu_job_run [amdgpu]] *ERROR* Error scheduling=20
IBs (-22)
[172937.475722] amdgpu 000d:31:00.0: couldn't schedule ib on ring &lt;gfx&g=
t;
[172937.481928] [drm:amdgpu_job_run [amdgpu]] *ERROR* Error scheduling=20
IBs (-22)
[172937.481946] amdgpu 0005:01:00.0: couldn't schedule ib on ring &lt;gfx&g=
t;
[172937.488092] [drm:amdgpu_job_run [amdgpu]] *ERROR* Error scheduling=20
IBs (-22)
[172937.488108] amdgpu 000d:31:00.0: couldn't schedule ib on ring &lt;gfx&g=
t;
[172937.494407] [drm:amdgpu_job_run [amdgpu]] *ERROR* Error scheduling=20
IBs (-22)
[172937.494440] amdgpu 0005:01:00.0: couldn't schedule ib on ring &lt;gfx&g=
t;
[172937.500663] [drm:amdgpu_job_run [amdgpu]] *ERROR* Error scheduling=20
IBs (-22)
[172937.500678] amdgpu 000d:31:00.0: couldn't schedule ib on ring &lt;gfx&g=
t;
[172937.506909] [drm:amdgpu_job_run [amdgpu]] *ERROR* Error scheduling=20
IBs (-22)
[172937.506930] amdgpu 0005:01:00.0: couldn't schedule ib on ring &lt;gfx&g=
t;
[172937.511392] [drm] schedsdma0 is not ready, skipping
[172937.511394] [drm] schedsdma1 is not ready, skipping
[172937.511481] [drm:amdgpu_gem_va_ioctl [amdgpu]] *ERROR* Couldn't=20
update BO_VA (-2)
[172937.512346] Unable to handle kernel access to user memory outside=20
uaccess routines at virtual address 0000000000000008
[172937.512348] Mem abort info:
[172937.512350]???? ESR =3D 0x96000004
[172937.512352]???? Exception class =3D DABT (current EL), IL =3D 32 bits
[172937.512353]???? SET =3D 0, FnV =3D 0
[172937.512354]???? EA =3D 0, S1PTW =3D 0
[172937.512355] Data abort info:
[172937.512356]???? ISV =3D 0, ISS =3D 0x00000004
[172937.512357]???? CM =3D 0, WnR =3D 0
[172937.512359] user pgtable: 4k pages, 48-bit VAs, pgdp =3D 00000000fb340b=
c6
[172937.512361] [0000000000000008] pgd=3D000000139dfe9003,=20
pud=3D00000015d583a003, pmd=3D0000000000000000
[172937.512367] Internal error: Oops: 96000004 [#1] SMP
[172937.512370] Modules linked in: nfnetlink_log veth ipt_REJECT=20
nf_reject_ipv4 xt_comment xt_mark xt_nat xt_tcpudp ipt_MASQUERADE=20
nf_conntrack_netlink nfnetlink xfrm_user xt_conntrack br_netfilter=20
bridge stp llc iptable_filter xt_addrtype iptable_nat nf_nat_ipv4 nf_nat=20
bpfilter ip_vs_sh ip_vs_wrr ip_vs_rr ip_vs nf_conntrack nf_defrag_ipv6=20
nf_defrag_ipv4 overlay nls_iso8859_1 joydev input_leds snd_hda_intel=20
snd_hda_codec snd_hda_core snd_hwdep snd_pcm snd_timer ipmi_ssif snd=20
ipmi_si soundcore ipmi_devintf ipmi_msghandler tcp_bbr sch_fq ib_iser=20
rdma_cm iw_cm ib_cm ib_core iscsi_tcp libiscsi_tcp libiscsi=20
scsi_transport_iscsi binder_dkms(OE) ip_tables x_tables autofs4 btrfs=20
zstd_compress raid10 raid456 async_raid6_recov async_memcpy async_pq=20
async_xor async_tx xor xor_neon raid6_pq libcrc32c raid1 raid0 multipath=20
linear hibmc_drm hid_generic usbhid hid ses enclosure marvell aes_ce_blk=20
aes_ce_cipher amdgpu chash i2c_algo_bit gpu_sched ttm crct10dif_ce=20
drm_kms_helper ghash_ce syscopyarea sha2_ce
[172937.512432]?? sysfillrect sysimgblt fb_sys_fops sha256_arm64 sha1_ce=20
ixgbe drm hisi_sas_v2_hw hisi_sas_main megaraid_sas xfrm_algo libsas=20
mdio ehci_platform scsi_transport_sas hns_dsaf hns_enet_drv hns_mdio=20
hnae aes_neon_bs aes_neon_blk crypto_simd cryptd aes_arm64
[172937.512448] Process RenderThread (pid: 1569015, stack limit =3D=20
0x00000000349701c4)
[172937.512451] CPU: 23 PID: 1569015 Comm: RenderThread Kdump: loaded=20
Tainted: G???????????????????? OE???????? 5.0.13-1905061257-generic #appstr=
eam
[172937.512453] Hardware name: Huawei TaiShan 2280 /BC11SPCD, BIOS 1.58=20
10/24/2018
[172937.512454] pstate: 80400005 (Nzcv daif +PAN -UAO)
[172937.512531] pc : amdgpu_vm_bo_update_mapping+0x120/0x3a0 [amdgpu]
[172937.512603] lr : amdgpu_vm_bo_update+0x2a4/0x6b8 [amdgpu]
[172937.512604] sp : ffff0000c0e4b8c0
[172937.512605] x29: ffff0000c0e4b8c0 x28: ffff801fd3010000
[172937.512608] x27: 0000000000000001 x26: ffff80161d777000
[172937.512610] x25: 0000000000100d1f x24: 0000000000100d00
[172937.512612] x23: 0000000000000000 x22: ffff809533c54f00
[172937.512614] x21: 0000000000000037 x20: ffff0000116cc000
[172937.512616] x19: 000000000000000a x18: 0000000000000000
[172937.512618] x17: 0000000000000000 x16: 0000000000000000
[172937.512620] x15: 0000000000000000 x14: 00000003000000b0
[172937.512623] x13: 0000000600000240 x12: 0000000000000000
[172937.512624] x11: 000000060000018d x10: 0000000000000040
[172937.512627] x9 : 0000000000000000 x8 : ffff0000c0e4b860
[172937.512628] x7 : 0000000000000020 x6 : 000000000000001f
[172937.512631] x5 : 0000000000100d1f x4 : 0000000000100d00
[172937.512633] x3 : 0000000000000000 x2 : 000000000000000b
[172937.512636] x1 : 0000000000000000 x0 :=20
ffff80161d776000[172937.512638] Call trace:
[172937.512711]?? amdgpu_vm_bo_update_mapping+0x120/0x3a0 [amdgpu]
[172937.512784]?? amdgpu_vm_bo_update+0x2a4/0x6b8 [amdgpu]
[172937.512857]?? amdgpu_cs_ioctl+0xcbc/0x14a8 [amdgpu]
[172937.512882]?? drm_ioctl_kernel+0x90/0x100 [drm]
[172937.512904]?? drm_ioctl+0x1ec/0x418 [drm]
[172937.512977]?? amdgpu_drm_ioctl+0x58/0x90 [amdgpu]
[172937.513055] [drm:amdgpu_job_run [amdgpu]] *ERROR* Error scheduling=20
IBs (-22)
[172937.513136]?? amdgpu_kms_compat_ioctl+0x40/0x68 [amdgpu]
[172937.513140] amdgpu 000d:31:00.0: couldn't schedule ib on ring &lt;gfx&g=
t;
[172937.513220] [drm:amdgpu_job_run [amdgpu]] *ERROR* Error scheduling=20
IBs (-22)
[172937.513235] amdgpu 000d:31:00.0: couldn't schedule ib on ring &lt;gfx&g=
t;
[172937.513311] [drm:amdgpu_job_run [amdgpu]] *ERROR* Error scheduling=20
IBs (-22)
[172937.513323] amdgpu 000d:31:00.0: couldn't schedule ib on ring &lt;gfx&g=
t;
[172937.513412] [drm:amdgpu_job_run [amdgpu]] *ERROR* Error scheduling=20
IBs (-22)
[172937.513421] amdgpu 000d:31:00.0: couldn't schedule ib on ring &lt;gfx&g=
t;
[172937.513497] [drm:amdgpu_job_run [amdgpu]] *ERROR* Error scheduling=20
IBs (-22)
[172937.513513] amdgpu 000d:31:00.0: couldn't schedule ib on ring &lt;gfx&g=
t;
[172937.513587] [drm:amdgpu_job_run [amdgpu]] *ERROR* Error scheduling=20
IBs (-22)
[172937.513603] amdgpu 000d:31:00.0: couldn't schedule ib on ring &lt;gfx&g=
t;
[172937.513677] [drm:amdgpu_job_run [amdgpu]] *ERROR* Error scheduling=20
IBs (-22)
[172937.513687] amdgpu 000d:31:00.0: couldn't schedule ib on ring &lt;gfx&g=
t;
[172937.513761] [drm:amdgpu_job_run [amdgpu]] *ERROR* Error scheduling=20
IBs (-22)
[172937.522750] amdgpu 000d:31:00.0: couldn't schedule ib on ring &lt;gfx&g=
t;
[172937.522822] [drm:amdgpu_job_run [amdgpu]] *ERROR* Error scheduling=20
IBs (-22)
[172937.525171]?? __arm64_compat_sys_ioctl+0x144/0x410
[172937.525177]?? el0_svc_common+0x78/0x120
[172937.525179]?? el0_svc_compat_handler+0x30/0x40
[172937.525182]?? el0_svc_compat+0x8/0x34
[172937.525187] Code: f9406b41 b966c793 f941e800 71002e7f (f9400421)
[172937.525195] SMP: stopping secondary CPUs
[172937.526945] Starting crashdump kernel...
[172937.526952] Bye!</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15602368630.84C5faF.7756--

--===============1516597393==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1516597393==--
