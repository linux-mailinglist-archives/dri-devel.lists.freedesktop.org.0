Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D261C3C4C8
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 09:19:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D717D89135;
	Tue, 11 Jun 2019 07:19:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id BC66189135
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 07:19:34 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id B303272167; Tue, 11 Jun 2019 07:19:34 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110888] 5.0.21 kernel crash when many GPU app run concurrently 
 , error msg: amdgpu_vm_validate_pt_bos() failed. ,
 Not enough memory for command submission!
Date: Tue, 11 Jun 2019 07:19:34 +0000
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
Message-ID: <bug-110888-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1669552043=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1669552043==
Content-Type: multipart/alternative; boundary="15602375740.Cfa2c0.9560"
Content-Transfer-Encoding: 7bit


--15602375740.Cfa2c0.9560
Date: Tue, 11 Jun 2019 07:19:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110888

            Bug ID: 110888
           Summary: 5.0.21 kernel crash when many GPU app run concurrently
                     , error msg: amdgpu_vm_validate_pt_bos() failed. ,
                    Not enough memory for command submission!
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

Env=EF=BC=9Akernel 5.0.21 mesa 18.2.8 firmware 1.179 drm 2.4.97 binder-dkms=
 1.3
+android image kydroid cm-13.0-19.05.30-1-clouddisk RAM 192G. AMD RX580 8GB

We test run 77 GPU apps concurrently, kernel crash and auto reboot

journalctl log #100 (comment)

crash dump


[ 3138.636753] [drm:amdgpu_cs_parser_bos.isra.11 [amdgpu]] ERROR
amdgpu_vm_validate_pt_bos() failed.
[ 3138.636831] [drm:amdgpu_cs_parser_bos.isra.11 [amdgpu]] ERROR
amdgpu_vm_validate_pt_bos() failed.
[ 3138.636915] [drm:amdgpu_cs_parser_bos.isra.11 [amdgpu]] ERROR
amdgpu_vm_validate_pt_bos() failed.
[ 3138.636989] [drm:amdgpu_cs_ioctl [amdgpu]] ERROR Not enough memory for
command submission!
[ 3138.647377] [drm:amdgpu_cs_ioctl [amdgpu]] ERROR Not enough memory for
command submission!
[ 3138.657138] [drm:amdgpu_cs_ioctl [amdgpu]] ERROR Not enough memory for
command submission!
[ 3138.801062] Unable to handle kernel access to user memory outside uaccess
routines at virtual address 00000000000000a8
[ 3138.801240] [drm:amdgpu_cs_parser_bos.isra.11 [amdgpu]] ERROR
amdgpu_vm_validate_pt_bos() failed.
[ 3138.811638] Mem abort info:
[ 3138.811642] ESR =3D 0x96000004
[ 3138.811644] Exception class =3D DABT (current EL), IL =3D 32 bits
[ 3138.811647] SET =3D 0, FnV =3D 0
[ 3138.811649] EA =3D 0, S1PTW =3D 0
[ 3138.811651] Data abort info:
[ 3138.811653] ISV =3D 0, ISS =3D 0x00000004
[ 3138.811655] CM =3D 0, WnR =3D 0
[ 3138.811660] user pgtable: 4k pages, 48-bit VAs, pgdp =3D 000000000787c0fb
[ 3138.811663] [00000000000000a8] pgd=3D0000000000000000
[ 3138.811669] Internal error: Oops: 96000004 [#1] SMP
[ 3138.811673] Modules linked in: nfnetlink_log veth xt_CHECKSUM iptable_ma=
ngle
nf_conntrack_netlink nfnetlink xfrm_user xfrm_algo br_netfilter xt_nat
ipt_MASQUERADE overlay xt_recent ipt_REJECT nf_reject_ipv4 xt_tcpudp devlink
xt_mark xt_comment xt_conntrack bridge stp llc ebtable_filter ebtables
ip6table_filter ip6_tables iptable_filter xt_addrtype iptable_nat nf_nat_ip=
v4
nf_nat bpfilter ip_vs_sh ip_vs_wrr ip_vs_rr ip_vs nf_conntrack nf_defrag_ip=
v6
nf_defrag_ipv4 input_leds joydev nls_iso8859_1 snd_hda_intel snd_hda_codec
snd_hda_core snd_hwdep snd_pcm snd_timer snd soundcore ipmi_ssif ipmi_si
ipmi_devintf ipmi_msghandler sch_fq_codel ib_iser rdma_cm iw_cm ib_cm ib_co=
re
iscsi_tcp libiscsi_tcp libiscsi scsi_transport_iscsi binder_dkms(OE) ip_tab=
les
x_tables autofs4 ses enclosure btrfs zstd_compress raid10 raid456
async_raid6_recov async_memcpy async_pq async_xor async_tx xor xor_neon
raid6_pq libcrc32c raid1 raid0 multipath linear hibmc_drm hid_generic usbhid
hid marvell aes_ce_blk
[ 3138.811754] aes_ce_cipher
[ 3138.822304] [drm:amdgpu_cs_ioctl [amdgpu]] ERROR Not enough memory for
command submission!
[ 3138.827351] amdgpu crct10dif_ce chash i2c_algo_bit ghash_ce gpu_sched ttm
sha2_ce sha256_arm64 drm_kms_helper sha1_ce syscopyarea sysfillrect sysimgb=
lt
fb_sys_fops drm hns_enet_drv mpt3sas e1000e hisi_sas_v2_hw raid_class
hisi_sas_main ehci_platform libsas hns_dsaf scsi_transport_sas hns_mdio hnae
aes_neon_bs aes_neon_blk crypto_simd cryptd aes_arm64
[ 3138.827381] Process BootAnimation (pid: 240132, stack limit =3D
0x00000000184b1ef3)
[ 3138.827386] CPU: 17 PID: 240132 Comm: BootAnimation Kdump: loaded Tainte=
d: G
OE 5.0.0-2106051013-generic #appstreamdebug
[ 3138.827388] Hardware name: Huawei TaiShan 2280 /BC11SPCD, BIOS 1.56
09/20/2018
[ 3138.827391] pstate: 60400005 (nZCv daif +PAN -UAO)
[ 3138.827499] pc : amdgpu_vm_init+0x1e4/0x490 [amdgpu]
[ 3138.827583] lr : amdgpu_vm_init+0x298/0x490 [amdgpu]
[ 3138.867149] [drm:amdgpu_cs_parser_bos.isra.11 [amdgpu]] ERROR
amdgpu_vm_validate_pt_bos() failed.
[ 3138.868460] sp : ffff0003b1a5b900
[ 3138.868462] x29: ffff0003b1a5b900 x28: ffff8013f4f36000
[ 3138.868466] x27: ffff8013ae49e0c0 x26: ffff8013ae49e100
[ 3138.868469] x25: ffff0000097de000 x24: 0000000000008143
[ 3138.868472] x23: 0000000000000000 x22: ffff000011994000
[ 3138.868474] x21: 00000000fffffff4 x20: 0000000000000050
[ 3138.868477] x19: ffff8013ae49e000 x18: 0000000000000000
[ 3138.868480] x17: 0000000000000000 x16: 0000000000000101
[ 3138.868483] x15: 0000000000000000 x14: ffff0000110a6748
[ 3138.868485] x13: 0000000000000001 x12: 0000000000000000
[ 3138.873930] [drm:amdgpu_cs_ioctl [amdgpu]] ERROR Not enough memory for
command submission!
[ 3138.878709] x11: 0000000000000001 x10: 0000000000000000
[ 3138.878712] x9 : ffff000008f674f0 x8 : ffff000011994b48
[ 3138.878715] x7 : ffff000008f58e20 x6 : 0000000000000000
[ 3138.878718] x5 : 0000000000000000 x4 : ffff000011994b48
[ 3138.878720] x3 : 0000000000000001 x2 : 7d8b3ec762676c00
[ 3138.878723] x1 : 0000000000000000 x0 : 00000000fffffff4
[ 3138.878729] Call trace:
[ 3138.878823] amdgpu_vm_init+0x1e4/0x490 [amdgpu]
[ 3138.878912] amdgpu_driver_open_kms+0x9c/0x200 [amdgpu]
[ 3139.153799] drm_file_alloc+0x134/0x258 [drm]
[ 3139.158515] drm_open+0xac/0x210 [drm]
[ 3139.163037] drm_stub_open+0xec/0x118 [drm]
[ 3139.167537] chrdev_open+0xac/0x1c0
[ 3139.171858] do_dentry_open+0x1c4/0x370
[ 3139.175949] vfs_open+0x38/0x48
[ 3139.179895] do_last+0x32c/0x8b0
[ 3139.183680] path_openat+0x90/0x288
[ 3139.187217] do_filp_open+0x88/0x108
[ 3139.190768] do_sys_open+0x1b0/0x3b0
[ 3139.194222] __arm64_sys_openat+0x2c/0x38
[ 3139.197480] el0_svc_common+0x8c/0x190
[ 3139.200847] el0_svc_handler+0x38/0x78
[ 3139.202961] [drm:amdgpu_cs_parser_bos.isra.11 [amdgpu]] ERROR
amdgpu_vm_validate_pt_bos() failed.
[ 3139.203982] el0_svc+0x8/0xc
[ 3139.211009] [drm:amdgpu_cs_ioctl [amdgpu]] ERROR Not enough memory for
command submission!
[ 3139.214079] Code: 2a0003f5 34000540 f9406277 910142f4 (b9405a80)
[ 3139.214210] SMP: stopping secondary CPUs
[ 3139.226747] Starting crashdump kernel...
[ 3139.230360] Bye!

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15602375740.Cfa2c0.9560
Date: Tue, 11 Jun 2019 07:19:34 +0000
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
   title=3D"NEW - 5.0.21 kernel crash when many GPU app run concurrently , =
error msg: amdgpu_vm_validate_pt_bos() failed. , Not enough memory for comm=
and submission!"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110888">110888</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>5.0.21 kernel crash when many GPU app run concurrently  , err=
or msg: amdgpu_vm_validate_pt_bos() failed. , Not enough memory for command=
 submission!
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
        <pre>Env=EF=BC=9Akernel 5.0.21 mesa 18.2.8 firmware 1.179 drm 2.4.9=
7 binder-dkms 1.3
+android image kydroid cm-13.0-19.05.30-1-clouddisk RAM 192G. AMD RX580 8GB

We test run 77 GPU apps concurrently, kernel crash and auto reboot

journalctl log #100 (comment)

crash dump


[ 3138.636753] [drm:amdgpu_cs_parser_bos.isra.11 [amdgpu]] ERROR
amdgpu_vm_validate_pt_bos() failed.
[ 3138.636831] [drm:amdgpu_cs_parser_bos.isra.11 [amdgpu]] ERROR
amdgpu_vm_validate_pt_bos() failed.
[ 3138.636915] [drm:amdgpu_cs_parser_bos.isra.11 [amdgpu]] ERROR
amdgpu_vm_validate_pt_bos() failed.
[ 3138.636989] [drm:amdgpu_cs_ioctl [amdgpu]] ERROR Not enough memory for
command submission!
[ 3138.647377] [drm:amdgpu_cs_ioctl [amdgpu]] ERROR Not enough memory for
command submission!
[ 3138.657138] [drm:amdgpu_cs_ioctl [amdgpu]] ERROR Not enough memory for
command submission!
[ 3138.801062] Unable to handle kernel access to user memory outside uaccess
routines at virtual address 00000000000000a8
[ 3138.801240] [drm:amdgpu_cs_parser_bos.isra.11 [amdgpu]] ERROR
amdgpu_vm_validate_pt_bos() failed.
[ 3138.811638] Mem abort info:
[ 3138.811642] ESR =3D 0x96000004
[ 3138.811644] Exception class =3D DABT (current EL), IL =3D 32 bits
[ 3138.811647] SET =3D 0, FnV =3D 0
[ 3138.811649] EA =3D 0, S1PTW =3D 0
[ 3138.811651] Data abort info:
[ 3138.811653] ISV =3D 0, ISS =3D 0x00000004
[ 3138.811655] CM =3D 0, WnR =3D 0
[ 3138.811660] user pgtable: 4k pages, 48-bit VAs, pgdp =3D 000000000787c0fb
[ 3138.811663] [00000000000000a8] pgd=3D0000000000000000
[ 3138.811669] Internal error: Oops: 96000004 [#1] SMP
[ 3138.811673] Modules linked in: nfnetlink_log veth xt_CHECKSUM iptable_ma=
ngle
nf_conntrack_netlink nfnetlink xfrm_user xfrm_algo br_netfilter xt_nat
ipt_MASQUERADE overlay xt_recent ipt_REJECT nf_reject_ipv4 xt_tcpudp devlink
xt_mark xt_comment xt_conntrack bridge stp llc ebtable_filter ebtables
ip6table_filter ip6_tables iptable_filter xt_addrtype iptable_nat nf_nat_ip=
v4
nf_nat bpfilter ip_vs_sh ip_vs_wrr ip_vs_rr ip_vs nf_conntrack nf_defrag_ip=
v6
nf_defrag_ipv4 input_leds joydev nls_iso8859_1 snd_hda_intel snd_hda_codec
snd_hda_core snd_hwdep snd_pcm snd_timer snd soundcore ipmi_ssif ipmi_si
ipmi_devintf ipmi_msghandler sch_fq_codel ib_iser rdma_cm iw_cm ib_cm ib_co=
re
iscsi_tcp libiscsi_tcp libiscsi scsi_transport_iscsi binder_dkms(OE) ip_tab=
les
x_tables autofs4 ses enclosure btrfs zstd_compress raid10 raid456
async_raid6_recov async_memcpy async_pq async_xor async_tx xor xor_neon
raid6_pq libcrc32c raid1 raid0 multipath linear hibmc_drm hid_generic usbhid
hid marvell aes_ce_blk
[ 3138.811754] aes_ce_cipher
[ 3138.822304] [drm:amdgpu_cs_ioctl [amdgpu]] ERROR Not enough memory for
command submission!
[ 3138.827351] amdgpu crct10dif_ce chash i2c_algo_bit ghash_ce gpu_sched ttm
sha2_ce sha256_arm64 drm_kms_helper sha1_ce syscopyarea sysfillrect sysimgb=
lt
fb_sys_fops drm hns_enet_drv mpt3sas e1000e hisi_sas_v2_hw raid_class
hisi_sas_main ehci_platform libsas hns_dsaf scsi_transport_sas hns_mdio hnae
aes_neon_bs aes_neon_blk crypto_simd cryptd aes_arm64
[ 3138.827381] Process BootAnimation (pid: 240132, stack limit =3D
0x00000000184b1ef3)
[ 3138.827386] CPU: 17 PID: 240132 Comm: BootAnimation Kdump: loaded Tainte=
d: G
OE 5.0.0-2106051013-generic #appstreamdebug
[ 3138.827388] Hardware name: Huawei TaiShan 2280 /BC11SPCD, BIOS 1.56
09/20/2018
[ 3138.827391] pstate: 60400005 (nZCv daif +PAN -UAO)
[ 3138.827499] pc : amdgpu_vm_init+0x1e4/0x490 [amdgpu]
[ 3138.827583] lr : amdgpu_vm_init+0x298/0x490 [amdgpu]
[ 3138.867149] [drm:amdgpu_cs_parser_bos.isra.11 [amdgpu]] ERROR
amdgpu_vm_validate_pt_bos() failed.
[ 3138.868460] sp : ffff0003b1a5b900
[ 3138.868462] x29: ffff0003b1a5b900 x28: ffff8013f4f36000
[ 3138.868466] x27: ffff8013ae49e0c0 x26: ffff8013ae49e100
[ 3138.868469] x25: ffff0000097de000 x24: 0000000000008143
[ 3138.868472] x23: 0000000000000000 x22: ffff000011994000
[ 3138.868474] x21: 00000000fffffff4 x20: 0000000000000050
[ 3138.868477] x19: ffff8013ae49e000 x18: 0000000000000000
[ 3138.868480] x17: 0000000000000000 x16: 0000000000000101
[ 3138.868483] x15: 0000000000000000 x14: ffff0000110a6748
[ 3138.868485] x13: 0000000000000001 x12: 0000000000000000
[ 3138.873930] [drm:amdgpu_cs_ioctl [amdgpu]] ERROR Not enough memory for
command submission!
[ 3138.878709] x11: 0000000000000001 x10: 0000000000000000
[ 3138.878712] x9 : ffff000008f674f0 x8 : ffff000011994b48
[ 3138.878715] x7 : ffff000008f58e20 x6 : 0000000000000000
[ 3138.878718] x5 : 0000000000000000 x4 : ffff000011994b48
[ 3138.878720] x3 : 0000000000000001 x2 : 7d8b3ec762676c00
[ 3138.878723] x1 : 0000000000000000 x0 : 00000000fffffff4
[ 3138.878729] Call trace:
[ 3138.878823] amdgpu_vm_init+0x1e4/0x490 [amdgpu]
[ 3138.878912] amdgpu_driver_open_kms+0x9c/0x200 [amdgpu]
[ 3139.153799] drm_file_alloc+0x134/0x258 [drm]
[ 3139.158515] drm_open+0xac/0x210 [drm]
[ 3139.163037] drm_stub_open+0xec/0x118 [drm]
[ 3139.167537] chrdev_open+0xac/0x1c0
[ 3139.171858] do_dentry_open+0x1c4/0x370
[ 3139.175949] vfs_open+0x38/0x48
[ 3139.179895] do_last+0x32c/0x8b0
[ 3139.183680] path_openat+0x90/0x288
[ 3139.187217] do_filp_open+0x88/0x108
[ 3139.190768] do_sys_open+0x1b0/0x3b0
[ 3139.194222] __arm64_sys_openat+0x2c/0x38
[ 3139.197480] el0_svc_common+0x8c/0x190
[ 3139.200847] el0_svc_handler+0x38/0x78
[ 3139.202961] [drm:amdgpu_cs_parser_bos.isra.11 [amdgpu]] ERROR
amdgpu_vm_validate_pt_bos() failed.
[ 3139.203982] el0_svc+0x8/0xc
[ 3139.211009] [drm:amdgpu_cs_ioctl [amdgpu]] ERROR Not enough memory for
command submission!
[ 3139.214079] Code: 2a0003f5 34000540 f9406277 910142f4 (b9405a80)
[ 3139.214210] SMP: stopping secondary CPUs
[ 3139.226747] Starting crashdump kernel...
[ 3139.230360] Bye!</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15602375740.Cfa2c0.9560--

--===============1669552043==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1669552043==--
