Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F508EBF02
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 09:10:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B75C89321;
	Fri,  1 Nov 2019 08:10:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCA7D6E174
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2019 04:59:06 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Oct 2019 21:59:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,253,1569308400"; 
 d="xz'?scan'208";a="375471152"
Received: from xsang-optiplex-9020.sh.intel.com (HELO xsang-OptiPlex-9020)
 ([10.239.159.135])
 by orsmga005.jf.intel.com with ESMTP; 31 Oct 2019 21:58:58 -0700
Date: Fri, 1 Nov 2019 13:06:32 +0800
From: kernel test robot <oliver.sang@intel.com>
To: John Stultz <john.stultz@linaro.org>
Subject: [kselftests]  475bfb4b00: kernel_selftests.dmabuf-heaps.make_fail
Message-ID: <20191101050632.GC23674@xsang-OptiPlex-9020>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="m51xatjYGsM+13rf"
Content-Disposition: inline
In-Reply-To: <20191021190310.85221-6-john.stultz@linaro.org>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Mailman-Approved-At: Fri, 01 Nov 2019 08:09:55 +0000
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
Cc: Hillf Danton <hdanton@sina.com>, Sudipto Paul <Sudipto.Paul@arm.com>,
 Vincent Donnefort <Vincent.Donnefort@arm.com>, Chenbo Feng <fengc@google.com>,
 lkml <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 Alistair Strachan <astrachan@google.com>,
 Christoph Hellwig <hch@infradead.org>, lkp@lists.01.org,
 dri-devel@lists.freedesktop.org, Hridya Valsaraju <hridya@google.com>,
 "Andrew F . Davis" <afd@ti.com>, Pratik Patel <pratikp@codeaurora.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--m51xatjYGsM+13rf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the following commit (built with gcc-7):

commit: 475bfb4b00bc0f91400ac501f7edf16b595cd61b ("[PATCH v13 5/5] kselftes=
ts: Add dma-heap test")
url: https://github.com/0day-ci/linux/commits/John-Stultz/DMA-BUF-Heaps-des=
taging-ION/20191024-134108


in testcase: kernel_selftests
with following parameters:

	group: kselftests-01

test-description: The kernel contains a set of "self tests" under the tools=
/testing/selftests/ directory. These are intended to be small unit tests to=
 exercise individual code paths in the kernel.
test-url: https://www.kernel.org/doc/Documentation/kselftest.txt


on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m =
8G

caused below changes (please refer to attached dmesg/kmsg for entire log/ba=
cktrace):




If you fix the issue, kindly add following tag
Reported-by: kernel test robot <oliver.sang@intel.com>

KERNEL SELFTESTS: linux_headers_dir is /usr/src/linux-headers-x86_64-rhel-7=
=2E6-475bfb4b00bc0f91400ac501f7edf16b595cd61b
2019-10-25 16:32:04 make run_tests -C capabilities
make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b0=
0bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/capabilities'
gcc -O2 -g -std=3Dgnu99 -Wall    test_execve.c -lcap-ng -lrt -ldl -o /usr/s=
rc/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf16b595cd61b/=
tools/testing/selftests/capabilities/test_execve
gcc -O2 -g -std=3Dgnu99 -Wall    validate_cap.c -lcap-ng -lrt -ldl -o /usr/=
src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf16b595cd61b=
/tools/testing/selftests/capabilities/validate_cap
TAP version 13
1..1
# selftests: capabilities: test_execve
# # validate_cap:: Capabilities after execve were correct
# # validate_cap:: Capabilities after execve were correct
# # validate_cap:: Capabilities after execve were correct
# # validate_cap:: Capabilities after execve were correct
# # validate_cap:: Capabilities after execve were correct
# # validate_cap:: Capabilities after execve were correct
# # validate_cap:: Capabilities after execve were correct
# # validate_cap:: Capabilities after execve were correct
# TAP version 13
# 1..12
# # [RUN]	+++ Tests with uid =3D=3D 0 +++
# # [NOTE]	Using global UIDs for tests
# # [RUN]	Root =3D> ep
# ok 1 Passed
# # Check cap_ambient manipulation rules
# ok 2 PR_CAP_AMBIENT_RAISE failed on non-inheritable cap
# ok 3 PR_CAP_AMBIENT_RAISE failed on non-permitted cap
# ok 4 PR_CAP_AMBIENT_RAISE worked
# ok 5 Basic manipulation appears to work
# # [RUN]	Root +i =3D> eip
# ok 6 Passed
# # [RUN]	UID 0 +ia =3D> eipa
# ok 7 Passed
# # [RUN]	Root +ia, suidroot =3D> eipa
# ok 8 Passed
# # [RUN]	Root +ia, suidnonroot =3D> ip
# ok 9 Passed
# # [RUN]	Root +ia, sgidroot =3D> eipa
# ok 10 Passed
# ok 11 Passed
# # [RUN]	Root +ia, sgidnonroot =3D> eip
# ok 12 Passed
# # Pass 12 Fail 0 Xfail 0 Xpass 0 Skip 0 Error 0
# # validate_cap:: Capabilities after execve were correct
# # validate_cap:: Capabilities after execve were correct
# # validate_cap:: Capabilities after execve were correct
# # validate_cap:: Capabilities after execve were correct
# # validate_cap:: Capabilities after execve were correct
# # =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
# TAP version 13
# 1..9
# # [RUN]	+++ Tests with uid !=3D 0 +++
# # [NOTE]	Using global UIDs for tests
# # [RUN]	Non-root =3D> no caps
# ok 1 Passed
# # Check cap_ambient manipulation rules
# ok 2 PR_CAP_AMBIENT_RAISE failed on non-inheritable cap
# ok 3 PR_CAP_AMBIENT_RAISE failed on non-permitted cap
# ok 4 PR_CAP_AMBIENT_RAISE worked
# ok 5 Basic manipulation appears to work
# # [RUN]	Non-root +i =3D> i
# ok 6 Passed
# # [RUN]	UID 1 +ia =3D> eipa
# ok 7 Passed
# # [RUN]	Non-root +ia, sgidnonroot =3D> i
# ok 8 Passed
# ok 9 Passed
# # Pass 9 Fail 0 Xfail 0 Xpass 0 Skip 0 Error 0
# # =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
ok 1 selftests: capabilities: test_execve
make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00=
bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/capabilities'
ignored_by_lkp cgroup test
2019-10-25 16:32:05 make run_tests -C cpu-hotplug
make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b0=
0bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/cpu-hotplug'
TAP version 13
1..1
# selftests: cpu-hotplug: cpu-on-off-test.sh
# pid 1512's current affinity mask: 3
# pid 1512's new affinity mask: 1
# CPU online/offline summary:
# present_cpus =3D 0-1 present_max =3D 1
# 	 Cpus in online state: 0-1
# 	 Cpus in offline state: 0
# Limited scope test: one hotplug cpu
# 	 (leaves cpu in the original state):
# 	 online to offline to online: cpu 1
ok 1 selftests: cpu-hotplug: cpu-on-off-test.sh
make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00=
bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/cpu-hotplug'
2019-10-25 16:32:05 make run_tests -C cpufreq
make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b0=
0bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/cpufreq'
TAP version 13
1..1
# selftests: cpufreq: main.sh
# pid 1579's current affinity mask: 3
# pid 1579's new affinity mask: 1
not ok 1 selftests: cpufreq: main.sh # exit=3D2
make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00=
bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/cpufreq'
dmabuf-heaps test: not in Makefile
2019-10-25 16:32:06 make TARGETS=3Ddmabuf-heaps
make --no-builtin-rules ARCH=3Dx86 -C ../../.. headers_install
make[1]: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb=
4b00bc0f91400ac501f7edf16b595cd61b'
  HOSTCC  scripts/basic/fixdep
  HOSTCC  scripts/unifdef
  WRAP    arch/x86/include/generated/uapi/asm/bpf_perf_event.h
  WRAP    arch/x86/include/generated/uapi/asm/errno.h
  WRAP    arch/x86/include/generated/uapi/asm/fcntl.h
  WRAP    arch/x86/include/generated/uapi/asm/ioctl.h
  WRAP    arch/x86/include/generated/uapi/asm/ioctls.h
  WRAP    arch/x86/include/generated/uapi/asm/ipcbuf.h
  WRAP    arch/x86/include/generated/uapi/asm/param.h
  WRAP    arch/x86/include/generated/uapi/asm/poll.h
  WRAP    arch/x86/include/generated/uapi/asm/resource.h
  WRAP    arch/x86/include/generated/uapi/asm/socket.h
  WRAP    arch/x86/include/generated/uapi/asm/sockios.h
  WRAP    arch/x86/include/generated/uapi/asm/termbits.h
  WRAP    arch/x86/include/generated/uapi/asm/termios.h
  WRAP    arch/x86/include/generated/uapi/asm/types.h
  SYSTBL  arch/x86/include/generated/asm/syscalls_32.h
  SYSHDR  arch/x86/include/generated/uapi/asm/unistd_32.h
  SYSHDR  arch/x86/include/generated/uapi/asm/unistd_64.h
  SYSHDR  arch/x86/include/generated/uapi/asm/unistd_x32.h
  HOSTCC  arch/x86/tools/relocs_32.o
  HOSTCC  arch/x86/tools/relocs_64.o
  HOSTCC  arch/x86/tools/relocs_common.o
  HOSTLD  arch/x86/tools/relocs
  UPD     include/generated/uapi/linux/version.h
  HDRINST usr/include/video/edid.h
  HDRINST usr/include/video/sisfb.h
  HDRINST usr/include/video/uvesafb.h
  HDRINST usr/include/drm/armada_drm.h
  HDRINST usr/include/drm/drm_sarea.h
  HDRINST usr/include/drm/exynos_drm.h
  HDRINST usr/include/drm/i810_drm.h
  HDRINST usr/include/drm/mga_drm.h
  HDRINST usr/include/drm/qxl_drm.h
  HDRINST usr/include/drm/r128_drm.h
  HDRINST usr/include/drm/radeon_drm.h
  HDRINST usr/include/drm/savage_drm.h
  HDRINST usr/include/drm/sis_drm.h
  HDRINST usr/include/drm/tegra_drm.h
  HDRINST usr/include/drm/vc4_drm.h
  HDRINST usr/include/drm/vgem_drm.h
  HDRINST usr/include/drm/via_drm.h
  HDRINST usr/include/drm/vmwgfx_drm.h
  HDRINST usr/include/drm/omap_drm.h
  HDRINST usr/include/drm/drm.h
  HDRINST usr/include/drm/drm_fourcc.h
  HDRINST usr/include/drm/drm_mode.h
  HDRINST usr/include/drm/etnaviv_drm.h
  HDRINST usr/include/drm/i915_drm.h
  HDRINST usr/include/drm/lima_drm.h
  HDRINST usr/include/drm/msm_drm.h
  HDRINST usr/include/drm/nouveau_drm.h
  HDRINST usr/include/drm/panfrost_drm.h
  HDRINST usr/include/drm/v3d_drm.h
  HDRINST usr/include/drm/virtgpu_drm.h
  HDRINST usr/include/drm/amdgpu_drm.h
  HDRINST usr/include/mtd/inftl-user.h
  HDRINST usr/include/mtd/mtd-user.h
  HDRINST usr/include/mtd/nftl-user.h
  HDRINST usr/include/mtd/mtd-abi.h
  HDRINST usr/include/mtd/ubi-user.h
  HDRINST usr/include/xen/evtchn.h
  HDRINST usr/include/xen/gntalloc.h
  HDRINST usr/include/xen/gntdev.h
  HDRINST usr/include/xen/privcmd.h
  HDRINST usr/include/asm-generic/auxvec.h
  HDRINST usr/include/asm-generic/bitsperlong.h
  HDRINST usr/include/asm-generic/bpf_perf_event.h
  HDRINST usr/include/asm-generic/errno-base.h
  HDRINST usr/include/asm-generic/errno.h
  HDRINST usr/include/asm-generic/fcntl.h
  HDRINST usr/include/asm-generic/int-l64.h
  HDRINST usr/include/asm-generic/int-ll64.h
  HDRINST usr/include/asm-generic/ioctl.h
  HDRINST usr/include/asm-generic/ipcbuf.h
  HDRINST usr/include/asm-generic/kvm_para.h
  HDRINST usr/include/asm-generic/msgbuf.h
  HDRINST usr/include/asm-generic/param.h
  HDRINST usr/include/asm-generic/poll.h
  HDRINST usr/include/asm-generic/posix_types.h
  HDRINST usr/include/asm-generic/resource.h
  HDRINST usr/include/asm-generic/sembuf.h
  HDRINST usr/include/asm-generic/setup.h
  HDRINST usr/include/asm-generic/shmbuf.h
  HDRINST usr/include/asm-generic/signal-defs.h
  HDRINST usr/include/asm-generic/signal.h
  HDRINST usr/include/asm-generic/stat.h
  HDRINST usr/include/asm-generic/statfs.h
  HDRINST usr/include/asm-generic/swab.h
  HDRINST usr/include/asm-generic/termbits.h
  HDRINST usr/include/asm-generic/termios.h
  HDRINST usr/include/asm-generic/types.h
  HDRINST usr/include/asm-generic/ucontext.h
  HDRINST usr/include/asm-generic/hugetlb_encode.h
  HDRINST usr/include/asm-generic/ioctls.h
  HDRINST usr/include/asm-generic/mman-common.h
  HDRINST usr/include/asm-generic/mman.h
  HDRINST usr/include/asm-generic/siginfo.h
  HDRINST usr/include/asm-generic/socket.h
  HDRINST usr/include/asm-generic/sockios.h
  HDRINST usr/include/asm-generic/unistd.h
  HDRINST usr/include/rdma/cxgb4-abi.h
  HDRINST usr/include/rdma/hfi/hfi1_ioctl.h
  HDRINST usr/include/rdma/hfi/hfi1_user.h
  HDRINST usr/include/rdma/i40iw-abi.h
  HDRINST usr/include/rdma/ib_user_mad.h
  HDRINST usr/include/rdma/ib_user_sa.h
  HDRINST usr/include/rdma/mlx4-abi.h
  HDRINST usr/include/rdma/mthca-abi.h
  HDRINST usr/include/rdma/nes-abi.h
  HDRINST usr/include/rdma/ocrdma-abi.h
  HDRINST usr/include/rdma/qedr-abi.h
  HDRINST usr/include/rdma/rdma_user_ioctl.h
  HDRINST usr/include/rdma/cxgb3-abi.h
  HDRINST usr/include/rdma/bnxt_re-abi.h
  HDRINST usr/include/rdma/efa-abi.h
  HDRINST usr/include/rdma/hns-abi.h
  HDRINST usr/include/rdma/ib_user_ioctl_cmds.h
  HDRINST usr/include/rdma/ib_user_ioctl_verbs.h
  HDRINST usr/include/rdma/ib_user_verbs.h
  HDRINST usr/include/rdma/mlx5-abi.h
  HDRINST usr/include/rdma/mlx5_user_ioctl_cmds.h
  HDRINST usr/include/rdma/mlx5_user_ioctl_verbs.h
  HDRINST usr/include/rdma/rdma_netlink.h
  HDRINST usr/include/rdma/rdma_user_cm.h
  HDRINST usr/include/rdma/rdma_user_ioctl_cmds.h
  HDRINST usr/include/rdma/rdma_user_rxe.h
  HDRINST usr/include/rdma/rvt-abi.h
  HDRINST usr/include/rdma/siw-abi.h
  HDRINST usr/include/rdma/vmw_pvrdma-abi.h
  HDRINST usr/include/misc/cxl.h
  HDRINST usr/include/misc/fastrpc.h
  HDRINST usr/include/misc/habanalabs.h
  HDRINST usr/include/misc/ocxl.h
  HDRINST usr/include/misc/xilinx_sdfec.h
  HDRINST usr/include/linux/a.out.h
  HDRINST usr/include/linux/acct.h
  HDRINST usr/include/linux/adb.h
  HDRINST usr/include/linux/affs_hardblocks.h
  HDRINST usr/include/linux/agpgart.h
  HDRINST usr/include/linux/am437x-vpfe.h
  HDRINST usr/include/linux/android/binder.h
  HDRINST usr/include/linux/android/binderfs.h
  HDRINST usr/include/linux/apm_bios.h
  HDRINST usr/include/linux/arcfb.h
  HDRINST usr/include/linux/arm_sdei.h
  HDRINST usr/include/linux/aspeed-lpc-ctrl.h
  HDRINST usr/include/linux/atalk.h
  HDRINST usr/include/linux/atm.h
  HDRINST usr/include/linux/atm_eni.h
  HDRINST usr/include/linux/atm_he.h
  HDRINST usr/include/linux/atm_idt77105.h
  HDRINST usr/include/linux/atm_nicstar.h
  HDRINST usr/include/linux/atm_tcp.h
  HDRINST usr/include/linux/atm_zatm.h
  HDRINST usr/include/linux/atmapi.h
  HDRINST usr/include/linux/atmarp.h
  HDRINST usr/include/linux/atmbr2684.h
  HDRINST usr/include/linux/atmclip.h
  HDRINST usr/include/linux/atmdev.h
  HDRINST usr/include/linux/atmioc.h
  HDRINST usr/include/linux/atmlec.h
  HDRINST usr/include/linux/atmmpc.h
  HDRINST usr/include/linux/atmppp.h
  HDRINST usr/include/linux/atmsap.h
  HDRINST usr/include/linux/atmsvc.h
  HDRINST usr/include/linux/auto_dev-ioctl.h
  HDRINST usr/include/linux/auto_fs4.h
  HDRINST usr/include/linux/auxvec.h
  HDRINST usr/include/linux/ax25.h
  HDRINST usr/include/linux/b1lli.h
  HDRINST usr/include/linux/baycom.h
  HDRINST usr/include/linux/bcache.h
  HDRINST usr/include/linux/bcm933xx_hcs.h
  HDRINST usr/include/linux/blkpg.h
  HDRINST usr/include/linux/blktrace_api.h
  HDRINST usr/include/linux/bpf_common.h
  HDRINST usr/include/linux/bpf_perf_event.h
  HDRINST usr/include/linux/bpqether.h
  HDRINST usr/include/linux/bsg.h
  HDRINST usr/include/linux/bt-bmc.h
  HDRINST usr/include/linux/byteorder/big_endian.h
  HDRINST usr/include/linux/byteorder/little_endian.h
  HDRINST usr/include/linux/caif/caif_socket.h
  HDRINST usr/include/linux/caif/if_caif.h
  HDRINST usr/include/linux/can/bcm.h
  HDRINST usr/include/linux/can/error.h
  HDRINST usr/include/linux/can/raw.h
  HDRINST usr/include/linux/can/vxcan.h
  HDRINST usr/include/linux/can/gw.h
  HDRINST usr/include/linux/can/j1939.h
  HDRINST usr/include/linux/can/netlink.h
  HDRINST usr/include/linux/capability.h
  HDRINST usr/include/linux/capi.h
  HDRINST usr/include/linux/cciss_defs.h
  HDRINST usr/include/linux/cciss_ioctl.h
  HDRINST usr/include/linux/cdrom.h
  HDRINST usr/include/linux/cgroupstats.h
  HDRINST usr/include/linux/cifs/cifs_mount.h
  HDRINST usr/include/linux/cm4000_cs.h
  HDRINST usr/include/linux/cn_proc.h
  HDRINST usr/include/linux/connector.h
  HDRINST usr/include/linux/const.h
  HDRINST usr/include/linux/coresight-stm.h
  HDRINST usr/include/linux/cramfs_fs.h
  HDRINST usr/include/linux/cuda.h
  HDRINST usr/include/linux/cyclades.h
  HDRINST usr/include/linux/cycx_cfm.h
  HDRINST usr/include/linux/dcbnl.h
  HDRINST usr/include/linux/dccp.h
  HDRINST usr/include/linux/dlm.h
  HDRINST usr/include/linux/dlm_device.h
  HDRINST usr/include/linux/dlm_netlink.h
  HDRINST usr/include/linux/dlm_plock.h
  HDRINST usr/include/linux/dlmconstants.h
  HDRINST usr/include/linux/dm-log-userspace.h
  HDRINST usr/include/linux/dn.h
  HDRINST usr/include/linux/dqblk_xfs.h
  HDRINST usr/include/linux/dvb/ca.h
  HDRINST usr/include/linux/dvb/dmx.h
  HDRINST usr/include/linux/dvb/frontend.h
  HDRINST usr/include/linux/dvb/net.h
  HDRINST usr/include/linux/dvb/version.h
  HDRINST usr/include/linux/dvb/audio.h
  HDRINST usr/include/linux/dvb/osd.h
  HDRINST usr/include/linux/dvb/video.h
  HDRINST usr/include/linux/edd.h
  HDRINST usr/include/linux/efs_fs_sb.h
  HDRINST usr/include/linux/elf-fdpic.h
  HDRINST usr/include/linux/elfcore.h
  HDRINST usr/include/linux/errno.h
  HDRINST usr/include/linux/erspan.h
  HDRINST usr/include/linux/eventpoll.h
  HDRINST usr/include/linux/fadvise.h
  HDRINST usr/include/linux/falloc.h
  HDRINST usr/include/linux/fd.h
  HDRINST usr/include/linux/fdreg.h
  HDRINST usr/include/linux/fib_rules.h
  HDRINST usr/include/linux/fiemap.h
  HDRINST usr/include/linux/filter.h
  HDRINST usr/include/linux/firewire-constants.h
  HDRINST usr/include/linux/fsi.h
  HDRINST usr/include/linux/fsl_hypervisor.h
  HDRINST usr/include/linux/fsmap.h
  HDRINST usr/include/linux/futex.h
  HDRINST usr/include/linux/gameport.h
  HDRINST usr/include/linux/genetlink.h
  HDRINST usr/include/linux/genwqe/genwqe_card.h
  HDRINST usr/include/linux/gfs2_ondisk.h
  HDRINST usr/include/linux/gigaset_dev.h
  HDRINST usr/include/linux/gtp.h
  HDRINST usr/include/linux/hdlc.h
  HDRINST usr/include/linux/hdlc/ioctl.h
  HDRINST usr/include/linux/hdlcdrv.h
  HDRINST usr/include/linux/hdreg.h
  HDRINST usr/include/linux/hid.h
  HDRINST usr/include/linux/hiddev.h
  HDRINST usr/include/linux/hidraw.h
  HDRINST usr/include/linux/hpet.h
  HDRINST usr/include/linux/hsi/cs-protocol.h
  HDRINST usr/include/linux/hsi/hsi_char.h
  HDRINST usr/include/linux/hsr_netlink.h
  HDRINST usr/include/linux/hw_breakpoint.h
  HDRINST usr/include/linux/hyperv.h
  HDRINST usr/include/linux/hysdn_if.h
  HDRINST usr/include/linux/i2c-dev.h
  HDRINST usr/include/linux/i2c.h
  HDRINST usr/include/linux/i2o-dev.h
  HDRINST usr/include/linux/i8k.h
  HDRINST usr/include/linux/icmp.h
  HDRINST usr/include/linux/if_addrlabel.h
  HDRINST usr/include/linux/if_alg.h
  HDRINST usr/include/linux/if_arcnet.h
  HDRINST usr/include/linux/if_cablemodem.h
  HDRINST usr/include/linux/if_eql.h
  HDRINST usr/include/linux/if_fc.h
  HDRINST usr/include/linux/if_frad.h
  HDRINST usr/include/linux/if_hippi.h
  HDRINST usr/include/linux/if_infiniband.h
  HDRINST usr/include/linux/if_ltalk.h
  HDRINST usr/include/linux/if_macsec.h
  HDRINST usr/include/linux/if_phonet.h
  HDRINST usr/include/linux/if_plip.h
  HDRINST usr/include/linux/if_ppp.h
  HDRINST usr/include/linux/if_pppol2tp.h
  HDRINST usr/include/linux/if_pppox.h
  HDRINST usr/include/linux/if_slip.h
  HDRINST usr/include/linux/if_team.h
  HDRINST usr/include/linux/if_x25.h
  HDRINST usr/include/linux/ife.h
  HDRINST usr/include/linux/iio/events.h
  HDRINST usr/include/linux/iio/types.h
  HDRINST usr/include/linux/ila.h
  HDRINST usr/include/linux/in_route.h
  HDRINST usr/include/linux/inotify.h
  HDRINST usr/include/linux/ioctl.h
  HDRINST usr/include/linux/ip.h
  HDRINST usr/include/linux/ip6_tunnel.h
  HDRINST usr/include/linux/ipc.h
  HDRINST usr/include/linux/ipmi.h
  HDRINST usr/include/linux/ipmi_msgdefs.h
  HDRINST usr/include/linux/ipsec.h
  HDRINST usr/include/linux/ipv6_route.h
  HDRINST usr/include/linux/ipx.h
  HDRINST usr/include/linux/irqnr.h
  HDRINST usr/include/linux/isdn/capicmd.h
  HDRINST usr/include/linux/iso_fs.h
  HDRINST usr/include/linux/ivtv.h
  HDRINST usr/include/linux/ivtvfb.h
  HDRINST usr/include/linux/joystick.h
  HDRINST usr/include/linux/kcm.h
  HDRINST usr/include/linux/kcmp.h
  HDRINST usr/include/linux/kcov.h
  HDRINST usr/include/linux/kd.h
  HDRINST usr/include/linux/kdev_t.h
  HDRINST usr/include/linux/kernel.h
  HDRINST usr/include/linux/kernelcapi.h
  HDRINST usr/include/linux/keyboard.h
  HDRINST usr/include/linux/l2tp.h
  HDRINST usr/include/linux/lightnvm.h
  HDRINST usr/include/linux/llc.h
  HDRINST usr/include/linux/loop.h
  HDRINST usr/include/linux/lp.h
  HDRINST usr/include/linux/lwtunnel.h
  HDRINST usr/include/linux/major.h
  HDRINST usr/include/linux/map_to_7segment.h
  HDRINST usr/include/linux/matroxfb.h
  HDRINST usr/include/linux/max2175.h
  HDRINST usr/include/linux/membarrier.h
  HDRINST usr/include/linux/mempolicy.h
  HDRINST usr/include/linux/meye.h
  HDRINST usr/include/linux/mic_common.h
  HDRINST usr/include/linux/mic_ioctl.h
  HDRINST usr/include/linux/minix_fs.h
  HDRINST usr/include/linux/mmc/ioctl.h
  HDRINST usr/include/linux/mmtimer.h
  HDRINST usr/include/linux/module.h
  HDRINST usr/include/linux/mpls.h
  HDRINST usr/include/linux/mpls_iptunnel.h
  HDRINST usr/include/linux/mqueue.h
  HDRINST usr/include/linux/msg.h
  HDRINST usr/include/linux/mtio.h
  HDRINST usr/include/linux/n_r3964.h
  HDRINST usr/include/linux/nbd-netlink.h
  HDRINST usr/include/linux/nbd.h
  HDRINST usr/include/linux/net.h
  HDRINST usr/include/linux/netconf.h
  HDRINST usr/include/linux/netdevice.h
  HDRINST usr/include/linux/netfilter/ipset/ip_set_bitmap.h
  HDRINST usr/include/linux/netfilter/ipset/ip_set_hash.h
  HDRINST usr/include/linux/netfilter/ipset/ip_set_list.h
  HDRINST usr/include/linux/netfilter/ipset/ip_set.h
  HDRINST usr/include/linux/netfilter/nf_conntrack_common.h
  HDRINST usr/include/linux/netfilter/nf_conntrack_ftp.h
  HDRINST usr/include/linux/netfilter/nf_conntrack_sctp.h
  HDRINST usr/include/linux/netfilter/nf_conntrack_tcp.h
  HDRINST usr/include/linux/netfilter/nf_conntrack_tuple_common.h
  HDRINST usr/include/linux/netfilter/nf_log.h
  HDRINST usr/include/linux/netfilter/nf_nat.h
  HDRINST usr/include/linux/netfilter/nf_tables_compat.h
  HDRINST usr/include/linux/netfilter/nfnetlink.h
  HDRINST usr/include/linux/netfilter/nfnetlink_acct.h
  HDRINST usr/include/linux/netfilter/nfnetlink_compat.h
  HDRINST usr/include/linux/netfilter/nfnetlink_conntrack.h
  HDRINST usr/include/linux/netfilter/nfnetlink_cthelper.h
  HDRINST usr/include/linux/netfilter/nfnetlink_cttimeout.h
  HDRINST usr/include/linux/netfilter/nfnetlink_osf.h
  HDRINST usr/include/linux/netfilter/nfnetlink_queue.h
  HDRINST usr/include/linux/netfilter/x_tables.h
  HDRINST usr/include/linux/netfilter/xt_AUDIT.h
  HDRINST usr/include/linux/netfilter/xt_CHECKSUM.h
  HDRINST usr/include/linux/netfilter/xt_CLASSIFY.h
  HDRINST usr/include/linux/netfilter/xt_CONNMARK.h
  HDRINST usr/include/linux/netfilter/xt_CONNSECMARK.h
  HDRINST usr/include/linux/netfilter/xt_CT.h
  HDRINST usr/include/linux/netfilter/xt_DSCP.h
  HDRINST usr/include/linux/netfilter/xt_HMARK.h
  HDRINST usr/include/linux/netfilter/xt_IDLETIMER.h
  HDRINST usr/include/linux/netfilter/xt_LED.h
  HDRINST usr/include/linux/netfilter/xt_LOG.h
  HDRINST usr/include/linux/netfilter/xt_MARK.h
  HDRINST usr/include/linux/netfilter/xt_NFLOG.h
  HDRINST usr/include/linux/netfilter/xt_NFQUEUE.h
  HDRINST usr/include/linux/netfilter/xt_RATEEST.h
  HDRINST usr/include/linux/netfilter/xt_SECMARK.h
  HDRINST usr/include/linux/netfilter/xt_TCPMSS.h
  HDRINST usr/include/linux/netfilter/xt_TCPOPTSTRIP.h
  HDRINST usr/include/linux/netfilter/xt_TEE.h
  HDRINST usr/include/linux/netfilter/xt_TPROXY.h
  HDRINST usr/include/linux/netfilter/xt_addrtype.h
  HDRINST usr/include/linux/netfilter/xt_bpf.h
  HDRINST usr/include/linux/netfilter/xt_cluster.h
  HDRINST usr/include/linux/netfilter/xt_comment.h
  HDRINST usr/include/linux/netfilter/xt_connbytes.h
  HDRINST usr/include/linux/netfilter/xt_connlimit.h
  HDRINST usr/include/linux/netfilter/xt_connmark.h
  HDRINST usr/include/linux/netfilter/xt_conntrack.h
  HDRINST usr/include/linux/netfilter/xt_cpu.h
  HDRINST usr/include/linux/netfilter/xt_dccp.h
  HDRINST usr/include/linux/netfilter/xt_devgroup.h
  HDRINST usr/include/linux/netfilter/xt_dscp.h
  HDRINST usr/include/linux/netfilter/xt_ecn.h
  HDRINST usr/include/linux/netfilter/xt_esp.h
  HDRINST usr/include/linux/netfilter/xt_hashlimit.h
  HDRINST usr/include/linux/netfilter/xt_helper.h
  HDRINST usr/include/linux/netfilter/xt_ipcomp.h
  HDRINST usr/include/linux/netfilter/xt_iprange.h
  HDRINST usr/include/linux/netfilter/xt_ipvs.h
  HDRINST usr/include/linux/netfilter/xt_l2tp.h
  HDRINST usr/include/linux/netfilter/xt_length.h
  HDRINST usr/include/linux/netfilter/xt_limit.h
  HDRINST usr/include/linux/netfilter/xt_mac.h
  HDRINST usr/include/linux/netfilter/xt_mark.h
  HDRINST usr/include/linux/netfilter/xt_multiport.h
  HDRINST usr/include/linux/netfilter/xt_osf.h
  HDRINST usr/include/linux/netfilter/xt_physdev.h
  HDRINST usr/include/linux/netfilter/xt_pkttype.h
  HDRINST usr/include/linux/netfilter/xt_quota.h
  HDRINST usr/include/linux/netfilter/xt_rateest.h
  HDRINST usr/include/linux/netfilter/xt_realm.h
  HDRINST usr/include/linux/netfilter/xt_recent.h
  HDRINST usr/include/linux/netfilter/xt_rpfilter.h
  HDRINST usr/include/linux/netfilter/xt_sctp.h
  HDRINST usr/include/linux/netfilter/xt_set.h
  HDRINST usr/include/linux/netfilter/xt_socket.h
  HDRINST usr/include/linux/netfilter/xt_state.h
  HDRINST usr/include/linux/netfilter/xt_statistic.h
  HDRINST usr/include/linux/netfilter/xt_string.h
  HDRINST usr/include/linux/netfilter/xt_tcpmss.h
  HDRINST usr/include/linux/netfilter/xt_tcpudp.h
  HDRINST usr/include/linux/netfilter/xt_time.h
  HDRINST usr/include/linux/netfilter/xt_u32.h
  HDRINST usr/include/linux/netfilter/nf_synproxy.h
  HDRINST usr/include/linux/netfilter/nf_tables.h
  HDRINST usr/include/linux/netfilter/nfnetlink_log.h
  HDRINST usr/include/linux/netfilter/xt_SYNPROXY.h
  HDRINST usr/include/linux/netfilter/xt_cgroup.h
  HDRINST usr/include/linux/netfilter/xt_connlabel.h
  HDRINST usr/include/linux/netfilter/xt_nfacct.h
  HDRINST usr/include/linux/netfilter/xt_owner.h
  HDRINST usr/include/linux/netfilter/xt_policy.h
  HDRINST usr/include/linux/netfilter_arp.h
  HDRINST usr/include/linux/netfilter_arp/arpt_mangle.h
  HDRINST usr/include/linux/netfilter_arp/arp_tables.h
  HDRINST usr/include/linux/netfilter_bridge/ebt_802_3.h
  HDRINST usr/include/linux/netfilter_bridge/ebt_among.h
  HDRINST usr/include/linux/netfilter_bridge/ebt_arp.h
  HDRINST usr/include/linux/netfilter_bridge/ebt_arpreply.h
  HDRINST usr/include/linux/netfilter_bridge/ebt_ip.h
  HDRINST usr/include/linux/netfilter_bridge/ebt_ip6.h
  HDRINST usr/include/linux/netfilter_bridge/ebt_limit.h
  HDRINST usr/include/linux/netfilter_bridge/ebt_log.h
  HDRINST usr/include/linux/netfilter_bridge/ebt_mark_m.h
  HDRINST usr/include/linux/netfilter_bridge/ebt_mark_t.h
  HDRINST usr/include/linux/netfilter_bridge/ebt_nat.h
  HDRINST usr/include/linux/netfilter_bridge/ebt_nflog.h
  HDRINST usr/include/linux/netfilter_bridge/ebt_pkttype.h
  HDRINST usr/include/linux/netfilter_bridge/ebt_redirect.h
  HDRINST usr/include/linux/netfilter_bridge/ebt_stp.h
  HDRINST usr/include/linux/netfilter_bridge/ebt_vlan.h
  HDRINST usr/include/linux/netfilter_bridge/ebtables.h
  HDRINST usr/include/linux/netfilter_ipv4/ipt_CLUSTERIP.h
  HDRINST usr/include/linux/netfilter_ipv4/ipt_ECN.h
  HDRINST usr/include/linux/netfilter_ipv4/ipt_REJECT.h
  HDRINST usr/include/linux/netfilter_ipv4/ipt_TTL.h
  HDRINST usr/include/linux/netfilter_ipv4/ipt_ah.h
  HDRINST usr/include/linux/netfilter_ipv4/ipt_ecn.h
  HDRINST usr/include/linux/netfilter_ipv4/ipt_ttl.h
  HDRINST usr/include/linux/netfilter_ipv4/ip_tables.h
  HDRINST usr/include/linux/netfilter_ipv4/ipt_LOG.h
  HDRINST usr/include/linux/netfilter_ipv6/ip6t_HL.h
  HDRINST usr/include/linux/netfilter_ipv6/ip6t_NPT.h
  HDRINST usr/include/linux/netfilter_ipv6/ip6t_REJECT.h
  HDRINST usr/include/linux/netfilter_ipv6/ip6t_ah.h
  HDRINST usr/include/linux/netfilter_ipv6/ip6t_frag.h
  HDRINST usr/include/linux/netfilter_ipv6/ip6t_hl.h
  HDRINST usr/include/linux/netfilter_ipv6/ip6t_ipv6header.h
  HDRINST usr/include/linux/netfilter_ipv6/ip6t_mh.h
  HDRINST usr/include/linux/netfilter_ipv6/ip6t_opts.h
  HDRINST usr/include/linux/netfilter_ipv6/ip6t_rt.h
  HDRINST usr/include/linux/netfilter_ipv6/ip6t_srh.h
  HDRINST usr/include/linux/netfilter_ipv6/ip6_tables.h
  HDRINST usr/include/linux/netfilter_ipv6/ip6t_LOG.h
  HDRINST usr/include/linux/netlink_diag.h
  HDRINST usr/include/linux/netrom.h
  HDRINST usr/include/linux/nfc.h
  HDRINST usr/include/linux/nfs.h
  HDRINST usr/include/linux/nfs2.h
  HDRINST usr/include/linux/nfs3.h
  HDRINST usr/include/linux/nfs4.h
  HDRINST usr/include/linux/nfs4_mount.h
  HDRINST usr/include/linux/nfs_fs.h
  HDRINST usr/include/linux/nfs_idmap.h
  HDRINST usr/include/linux/nfsacl.h
  HDRINST usr/include/linux/nfsd/debug.h
  HDRINST usr/include/linux/nfsd/export.h
  HDRINST usr/include/linux/nfsd/nfsfh.h
  HDRINST usr/include/linux/nfsd/stats.h
  HDRINST usr/include/linux/nfsd/cld.h
  HDRINST usr/include/linux/nilfs2_api.h
  HDRINST usr/include/linux/nsfs.h
  HDRINST usr/include/linux/nubus.h
  HDRINST usr/include/linux/nvram.h
  HDRINST usr/include/linux/omap3isp.h
  HDRINST usr/include/linux/omapfb.h
  HDRINST usr/include/linux/oom.h
  HDRINST usr/include/linux/packet_diag.h
  HDRINST usr/include/linux/param.h
  HDRINST usr/include/linux/parport.h
  HDRINST usr/include/linux/patchkey.h
  HDRINST usr/include/linux/pci.h
  HDRINST usr/include/linux/pcitest.h
  HDRINST usr/include/linux/personality.h
  HDRINST usr/include/linux/pfkeyv2.h
  HDRINST usr/include/linux/phantom.h
  HDRINST usr/include/linux/phonet.h
  HDRINST usr/include/linux/pktcdvd.h
  HDRINST usr/include/linux/poll.h
  HDRINST usr/include/linux/posix_acl.h
  HDRINST usr/include/linux/posix_acl_xattr.h
  HDRINST usr/include/linux/posix_types.h
  HDRINST usr/include/linux/ppp-comp.h
  HDRINST usr/include/linux/pps.h
  HDRINST usr/include/linux/pr.h
  HDRINST usr/include/linux/psample.h
  HDRINST usr/include/linux/qemu_fw_cfg.h
  HDRINST usr/include/linux/qnx4_fs.h
  HDRINST usr/include/linux/qnxtypes.h
  HDRINST usr/include/linux/qrtr.h
  HDRINST usr/include/linux/quota.h
  HDRINST usr/include/linux/radeonfb.h
  HDRINST usr/include/linux/raid/md_u.h
  HDRINST usr/include/linux/raid/md_p.h
  HDRINST usr/include/linux/random.h
  HDRINST usr/include/linux/raw.h
  HDRINST usr/include/linux/reboot.h
  HDRINST usr/include/linux/reiserfs_fs.h
  HDRINST usr/include/linux/reiserfs_xattr.h
  HDRINST usr/include/linux/resource.h
  HDRINST usr/include/linux/rfkill.h
  HDRINST usr/include/linux/rio_cm_cdev.h
  HDRINST usr/include/linux/rio_mport_cdev.h
  HDRINST usr/include/linux/romfs_fs.h
  HDRINST usr/include/linux/rose.h
  HDRINST usr/include/linux/route.h
  HDRINST usr/include/linux/rpmsg.h
  HDRINST usr/include/linux/rseq.h
  HDRINST usr/include/linux/rtc.h
  HDRINST usr/include/linux/scc.h
  HDRINST usr/include/linux/sched/types.h
  HDRINST usr/include/linux/scif_ioctl.h
  HDRINST usr/include/linux/screen_info.h
  HDRINST usr/include/linux/sdla.h
  HDRINST usr/include/linux/securebits.h
  HDRINST usr/include/linux/seg6.h
  HDRINST usr/include/linux/seg6_genl.h
  HDRINST usr/include/linux/seg6_hmac.h
  HDRINST usr/include/linux/seg6_iptunnel.h
  HDRINST usr/include/linux/seg6_local.h
  HDRINST usr/include/linux/selinux_netlink.h
  HDRINST usr/include/linux/sem.h
  HDRINST usr/include/linux/serial_reg.h
  HDRINST usr/include/linux/signal.h
  HDRINST usr/include/linux/signalfd.h
  HDRINST usr/include/linux/smc.h
  HDRINST usr/include/linux/smiapp.h
  HDRINST usr/include/linux/sock_diag.h
  HDRINST usr/include/linux/sonet.h
  HDRINST usr/include/linux/sonypi.h
  HDRINST usr/include/linux/sound.h
  HDRINST usr/include/linux/soundcard.h
  HDRINST usr/include/linux/spi/spidev.h
  HDRINST usr/include/linux/stat.h
  HDRINST usr/include/linux/stddef.h
  HDRINST usr/include/linux/stm.h
  HDRINST usr/include/linux/string.h
  HDRINST usr/include/linux/sunrpc/debug.h
  HDRINST usr/include/linux/suspend_ioctls.h
  HDRINST usr/include/linux/swab.h
  HDRINST usr/include/linux/sync_file.h
  HDRINST usr/include/linux/synclink.h
  HDRINST usr/include/linux/sysinfo.h
  HDRINST usr/include/linux/target_core_user.h
  HDRINST usr/include/linux/tc_act/tc_defact.h
  HDRINST usr/include/linux/tc_act/tc_bpf.h
  HDRINST usr/include/linux/tc_act/tc_connmark.h
  HDRINST usr/include/linux/tc_act/tc_csum.h
  HDRINST usr/include/linux/tc_act/tc_ct.h
  HDRINST usr/include/linux/tc_act/tc_ctinfo.h
  HDRINST usr/include/linux/tc_act/tc_gact.h
  HDRINST usr/include/linux/tc_act/tc_ife.h
  HDRINST usr/include/linux/tc_act/tc_ipt.h
  HDRINST usr/include/linux/tc_act/tc_mirred.h
  HDRINST usr/include/linux/tc_act/tc_mpls.h
  HDRINST usr/include/linux/tc_act/tc_nat.h
  HDRINST usr/include/linux/tc_act/tc_pedit.h
  HDRINST usr/include/linux/tc_act/tc_sample.h
  HDRINST usr/include/linux/tc_act/tc_skbedit.h
  HDRINST usr/include/linux/tc_act/tc_skbmod.h
  HDRINST usr/include/linux/tc_act/tc_tunnel_key.h
  HDRINST usr/include/linux/tc_act/tc_vlan.h
  HDRINST usr/include/linux/tc_ematch/tc_em_cmp.h
  HDRINST usr/include/linux/tc_ematch/tc_em_ipt.h
  HDRINST usr/include/linux/tc_ematch/tc_em_meta.h
  HDRINST usr/include/linux/tc_ematch/tc_em_nbyte.h
  HDRINST usr/include/linux/tc_ematch/tc_em_text.h
  HDRINST usr/include/linux/tcp_metrics.h
  HDRINST usr/include/linux/tee.h
  HDRINST usr/include/linux/termios.h
  HDRINST usr/include/linux/thermal.h
  HDRINST usr/include/linux/timerfd.h
  HDRINST usr/include/linux/times.h
  HDRINST usr/include/linux/tiocl.h
  HDRINST usr/include/linux/tipc_sockets_diag.h
  HDRINST usr/include/linux/toshiba.h
  HDRINST usr/include/linux/tty.h
  HDRINST usr/include/linux/tty_flags.h
  HDRINST usr/include/linux/types.h
  HDRINST usr/include/linux/udf_fs_i.h
  HDRINST usr/include/linux/uhid.h
  HDRINST usr/include/linux/uinput.h
  HDRINST usr/include/linux/uio.h
  HDRINST usr/include/linux/uleds.h
  HDRINST usr/include/linux/ultrasound.h
  HDRINST usr/include/linux/un.h
  HDRINST usr/include/linux/unistd.h
  HDRINST usr/include/linux/usb/cdc-wdm.h
  HDRINST usr/include/linux/usb/cdc.h
  HDRINST usr/include/linux/usb/ch11.h
  HDRINST usr/include/linux/usb/charger.h
  HDRINST usr/include/linux/usb/functionfs.h
  HDRINST usr/include/linux/usb/g_printer.h
  HDRINST usr/include/linux/usb/gadgetfs.h
  HDRINST usr/include/linux/usb/midi.h
  HDRINST usr/include/linux/usb/audio.h
  HDRINST usr/include/linux/usb/ch9.h
  HDRINST usr/include/linux/usb/g_uvc.h
  HDRINST usr/include/linux/usb/tmc.h
  HDRINST usr/include/linux/usb/video.h
  HDRINST usr/include/linux/usbip.h
  HDRINST usr/include/linux/userfaultfd.h
  HDRINST usr/include/linux/userio.h
  HDRINST usr/include/linux/utime.h
  HDRINST usr/include/linux/utsname.h
  HDRINST usr/include/linux/uuid.h
  HDRINST usr/include/linux/uvcvideo.h
  HDRINST usr/include/linux/v4l2-dv-timings.h
  HDRINST usr/include/linux/v4l2-mediabus.h
  HDRINST usr/include/linux/v4l2-subdev.h
  HDRINST usr/include/linux/vbox_err.h
  HDRINST usr/include/linux/veth.h
  HDRINST usr/include/linux/virtio_9p.h
  HDRINST usr/include/linux/virtio_console.h
  HDRINST usr/include/linux/virtio_crypto.h
  HDRINST usr/include/linux/virtio_input.h
  HDRINST usr/include/linux/virtio_mmio.h
  HDRINST usr/include/linux/virtio_net.h
  HDRINST usr/include/linux/virtio_pci.h
  HDRINST usr/include/linux/virtio_rng.h
  HDRINST usr/include/linux/virtio_scsi.h
  HDRINST usr/include/linux/virtio_types.h
  HDRINST usr/include/linux/virtio_vsock.h
  HDRINST usr/include/linux/vm_sockets.h
  HDRINST usr/include/linux/vm_sockets_diag.h
  HDRINST usr/include/linux/vsockmon.h
  HDRINST usr/include/linux/vt.h
  HDRINST usr/include/linux/vtpm_proxy.h
  HDRINST usr/include/linux/watchdog.h
  HDRINST usr/include/linux/wimax.h
  HDRINST usr/include/linux/wimax/i2400m.h
  HDRINST usr/include/linux/wireless.h
  HDRINST usr/include/linux/x25.h
  HDRINST usr/include/linux/xattr.h
  HDRINST usr/include/linux/xfrm.h
  HDRINST usr/include/linux/xilinx-v4l2-controls.h
  HDRINST usr/include/linux/zorro.h
  HDRINST usr/include/linux/zorro_ids.h
  HDRINST usr/include/linux/libc-compat.h
  HDRINST usr/include/linux/ppp-ioctl.h
  HDRINST usr/include/linux/ppp_defs.h
  HDRINST usr/include/linux/cec-funcs.h
  HDRINST usr/include/linux/chio.h
  HDRINST usr/include/linux/if.h
  HDRINST usr/include/linux/ipv6.h
  HDRINST usr/include/linux/adfs_fs.h
  HDRINST usr/include/linux/aio_abi.h
  HDRINST usr/include/linux/aspeed-p2a-ctrl.h
  HDRINST usr/include/linux/audit.h
  HDRINST usr/include/linux/auto_fs.h
  HDRINST usr/include/linux/batadv_packet.h
  HDRINST usr/include/linux/batman_adv.h
  HDRINST usr/include/linux/bfs_fs.h
  HDRINST usr/include/linux/binfmts.h
  HDRINST usr/include/linux/blkzoned.h
  HDRINST usr/include/linux/bpf.h
  HDRINST usr/include/linux/bpfilter.h
  HDRINST usr/include/linux/btf.h
  HDRINST usr/include/linux/btrfs.h
  HDRINST usr/include/linux/btrfs_tree.h
  HDRINST usr/include/linux/can.h
  HDRINST usr/include/linux/cec.h
  HDRINST usr/include/linux/coda.h
  HDRINST usr/include/linux/coff.h
  HDRINST usr/include/linux/cryptouser.h
  HDRINST usr/include/linux/devlink.h
  HDRINST usr/include/linux/dm-ioctl.h
  HDRINST usr/include/linux/dma-buf.h
  HDRINST usr/include/linux/dns_resolver.h
  HDRINST usr/include/linux/elf-em.h
  HDRINST usr/include/linux/elf.h
  HDRINST usr/include/linux/errqueue.h
  HDRINST usr/include/linux/ethtool.h
  HDRINST usr/include/linux/fanotify.h
  HDRINST usr/include/linux/fb.h
  HDRINST usr/include/linux/fcntl.h
  HDRINST usr/include/linux/firewire-cdev.h
  HDRINST usr/include/linux/fou.h
  HDRINST usr/include/linux/fpga-dfl.h
  HDRINST usr/include/linux/fs.h
  HDRINST usr/include/linux/fscrypt.h
  HDRINST usr/include/linux/fsverity.h
  HDRINST usr/include/linux/fuse.h
  HDRINST usr/include/linux/gen_stats.h
  HDRINST usr/include/linux/gpio.h
  HDRINST usr/include/linux/gsmmux.h
  HDRINST usr/include/linux/hash_info.h
  HDRINST usr/include/linux/icmpv6.h
  HDRINST usr/include/linux/if_addr.h
  HDRINST usr/include/linux/if_arp.h
  HDRINST usr/include/linux/if_bonding.h
  HDRINST usr/include/linux/if_bridge.h
  HDRINST usr/include/linux/if_ether.h
  HDRINST usr/include/linux/if_fddi.h
  HDRINST usr/include/linux/if_link.h
  HDRINST usr/include/linux/if_packet.h
  HDRINST usr/include/linux/if_tun.h
  HDRINST usr/include/linux/if_tunnel.h
  HDRINST usr/include/linux/if_vlan.h
  HDRINST usr/include/linux/if_xdp.h
  HDRINST usr/include/linux/igmp.h
  HDRINST usr/include/linux/in.h
  HDRINST usr/include/linux/in6.h
  HDRINST usr/include/linux/inet_diag.h
  HDRINST usr/include/linux/input-event-codes.h
  HDRINST usr/include/linux/input.h
  HDRINST usr/include/linux/io_uring.h
  HDRINST usr/include/linux/iommu.h
  HDRINST usr/include/linux/ip_vs.h
  HDRINST usr/include/linux/ipmi_bmc.h
  HDRINST usr/include/linux/isst_if.h
  HDRINST usr/include/linux/jffs2.h
  HDRINST usr/include/linux/kernel-page-flags.h
  HDRINST usr/include/linux/kexec.h
  HDRINST usr/include/linux/keyctl.h
  HDRINST usr/include/linux/kfd_ioctl.h
  HDRINST usr/include/linux/kvm.h
  HDRINST usr/include/linux/kvm_para.h
  HDRINST usr/include/linux/limits.h
  HDRINST usr/include/linux/lirc.h
  HDRINST usr/include/linux/magic.h
  HDRINST usr/include/linux/mdio.h
  HDRINST usr/include/linux/media-bus-format.h
  HDRINST usr/include/linux/media.h
  HDRINST usr/include/linux/mei.h
  HDRINST usr/include/linux/memfd.h
  HDRINST usr/include/linux/mii.h
  HDRINST usr/include/linux/mman.h
  HDRINST usr/include/linux/mount.h
  HDRINST usr/include/linux/mroute.h
  HDRINST usr/include/linux/mroute6.h
  HDRINST usr/include/linux/msdos_fs.h
  HDRINST usr/include/linux/ncsi.h
  HDRINST usr/include/linux/ndctl.h
  HDRINST usr/include/linux/neighbour.h
  HDRINST usr/include/linux/net_dropmon.h
  HDRINST usr/include/linux/net_namespace.h
  HDRINST usr/include/linux/net_tstamp.h
  HDRINST usr/include/linux/netfilter.h
  HDRINST usr/include/linux/netfilter_bridge.h
  HDRINST usr/include/linux/netfilter_decnet.h
  HDRINST usr/include/linux/netfilter_ipv4.h
  HDRINST usr/include/linux/netfilter_ipv6.h
  HDRINST usr/include/linux/netlink.h
  HDRINST usr/include/linux/nexthop.h
  HDRINST usr/include/linux/nfs_mount.h
  HDRINST usr/include/linux/nilfs2_ondisk.h
  HDRINST usr/include/linux/nl80211.h
  HDRINST usr/include/linux/openvswitch.h
  HDRINST usr/include/linux/pci_regs.h
  HDRINST usr/include/linux/perf_event.h
  HDRINST usr/include/linux/pkt_cls.h
  HDRINST usr/include/linux/pkt_sched.h
  HDRINST usr/include/linux/pmu.h
  HDRINST usr/include/linux/ppdev.h
  HDRINST usr/include/linux/prctl.h
  HDRINST usr/include/linux/psci.h
  HDRINST usr/include/linux/psp-sev.h
  HDRINST usr/include/linux/ptp_clock.h
  HDRINST usr/include/linux/ptrace.h
  HDRINST usr/include/linux/rds.h
  HDRINST usr/include/linux/rtnetlink.h
  HDRINST usr/include/linux/rxrpc.h
  HDRINST usr/include/linux/sctp.h
  HDRINST usr/include/linux/seccomp.h
  HDRINST usr/include/linux/sed-opal.h
  HDRINST usr/include/linux/serial.h
  HDRINST usr/include/linux/serio.h
  HDRINST usr/include/linux/shm.h
  HDRINST usr/include/linux/smc_diag.h
  HDRINST usr/include/linux/snmp.h
  HDRINST usr/include/linux/socket.h
  HDRINST usr/include/linux/sockios.h
  HDRINST usr/include/linux/switchtec_ioctl.h
  HDRINST usr/include/linux/sysctl.h
  HDRINST usr/include/linux/taskstats.h
  HDRINST usr/include/linux/tcp.h
  HDRINST usr/include/linux/time.h
  HDRINST usr/include/linux/time_types.h
  HDRINST usr/include/linux/timex.h
  HDRINST usr/include/linux/tipc.h
  HDRINST usr/include/linux/tipc_config.h
  HDRINST usr/include/linux/tipc_netlink.h
  HDRINST usr/include/linux/tls.h
  HDRINST usr/include/linux/udmabuf.h
  HDRINST usr/include/linux/udp.h
  HDRINST usr/include/linux/unix_diag.h
  HDRINST usr/include/linux/usbdevice_fs.h
  HDRINST usr/include/linux/v4l2-common.h
  HDRINST usr/include/linux/v4l2-controls.h
  HDRINST usr/include/linux/vbox_vmmdev_types.h
  HDRINST usr/include/linux/vboxguest.h
  HDRINST usr/include/linux/vfio.h
  HDRINST usr/include/linux/vfio_ccw.h
  HDRINST usr/include/linux/vhost.h
  HDRINST usr/include/linux/vhost_types.h
  HDRINST usr/include/linux/videodev2.h
  HDRINST usr/include/linux/virtio_balloon.h
  HDRINST usr/include/linux/virtio_blk.h
  HDRINST usr/include/linux/virtio_config.h
  HDRINST usr/include/linux/virtio_fs.h
  HDRINST usr/include/linux/virtio_gpu.h
  HDRINST usr/include/linux/virtio_ids.h
  HDRINST usr/include/linux/virtio_iommu.h
  HDRINST usr/include/linux/virtio_pmem.h
  HDRINST usr/include/linux/virtio_ring.h
  HDRINST usr/include/linux/vmcore.h
  HDRINST usr/include/linux/wait.h
  HDRINST usr/include/linux/wmi.h
  HDRINST usr/include/linux/xdp_diag.h
  HDRINST usr/include/linux/dma-heap.h
  HDRINST usr/include/linux/nvme_ioctl.h
  HDRINST usr/include/linux/pg.h
  HDRINST usr/include/linux/sched.h
  HDRINST usr/include/linux/serial_core.h
  HDRINST usr/include/sound/asequencer.h
  HDRINST usr/include/sound/asoc.h
  HDRINST usr/include/sound/asound_fm.h
  HDRINST usr/include/sound/compress_offload.h
  HDRINST usr/include/sound/compress_params.h
  HDRINST usr/include/sound/emu10k1.h
  HDRINST usr/include/sound/hdsp.h
  HDRINST usr/include/sound/hdspm.h
  HDRINST usr/include/sound/sb16_csp.h
  HDRINST usr/include/sound/sfnt_info.h
  HDRINST usr/include/sound/snd_sst_tokens.h
  HDRINST usr/include/sound/tlv.h
  HDRINST usr/include/sound/usb_stream.h
  HDRINST usr/include/sound/asound.h
  HDRINST usr/include/sound/firewire.h
  HDRINST usr/include/sound/skl-tplg-interface.h
  HDRINST usr/include/sound/sof/abi.h
  HDRINST usr/include/sound/sof/fw.h
  HDRINST usr/include/sound/sof/header.h
  HDRINST usr/include/sound/sof/tokens.h
  HDRINST usr/include/scsi/cxlflash_ioctl.h
  HDRINST usr/include/scsi/fc/fc_els.h
  HDRINST usr/include/scsi/fc/fc_fs.h
  HDRINST usr/include/scsi/fc/fc_gs.h
  HDRINST usr/include/scsi/fc/fc_ns.h
  HDRINST usr/include/scsi/scsi_bsg_fc.h
  HDRINST usr/include/scsi/scsi_bsg_ufs.h
  HDRINST usr/include/scsi/scsi_netlink.h
  HDRINST usr/include/scsi/scsi_netlink_fc.h
  HDRINST usr/include/linux/version.h
  HDRINST usr/include/asm/a.out.h
  HDRINST usr/include/asm/auxvec.h
  HDRINST usr/include/asm/bitsperlong.h
  HDRINST usr/include/asm/boot.h
  HDRINST usr/include/asm/debugreg.h
  HDRINST usr/include/asm/e820.h
  HDRINST usr/include/asm/hw_breakpoint.h
  HDRINST usr/include/asm/ist.h
  HDRINST usr/include/asm/kvm_perf.h
  HDRINST usr/include/asm/ldt.h
  HDRINST usr/include/asm/mce.h
  HDRINST usr/include/asm/mman.h
  HDRINST usr/include/asm/msgbuf.h
  HDRINST usr/include/asm/msr.h
  HDRINST usr/include/asm/mtrr.h
  HDRINST usr/include/asm/posix_types.h
  HDRINST usr/include/asm/posix_types_32.h
  HDRINST usr/include/asm/posix_types_64.h
  HDRINST usr/include/asm/posix_types_x32.h
  HDRINST usr/include/asm/prctl.h
  HDRINST usr/include/asm/processor-flags.h
  HDRINST usr/include/asm/ptrace-abi.h
  HDRINST usr/include/asm/ptrace.h
  HDRINST usr/include/asm/sembuf.h
  HDRINST usr/include/asm/setup.h
  HDRINST usr/include/asm/shmbuf.h
  HDRINST usr/include/asm/sigcontext.h
  HDRINST usr/include/asm/signal.h
  HDRINST usr/include/asm/stat.h
  HDRINST usr/include/asm/statfs.h
  HDRINST usr/include/asm/swab.h
  HDRINST usr/include/asm/ucontext.h
  HDRINST usr/include/asm/vm86.h
  HDRINST usr/include/asm/vsyscall.h
  HDRINST usr/include/asm/bootparam.h
  HDRINST usr/include/asm/byteorder.h
  HDRINST usr/include/asm/hwcap2.h
  HDRINST usr/include/asm/kvm.h
  HDRINST usr/include/asm/kvm_para.h
  HDRINST usr/include/asm/perf_regs.h
  HDRINST usr/include/asm/sigcontext32.h
  HDRINST usr/include/asm/siginfo.h
  HDRINST usr/include/asm/svm.h
  HDRINST usr/include/asm/unistd.h
  HDRINST usr/include/asm/vmx.h
  HDRINST usr/include/asm/unistd_x32.h
  HDRINST usr/include/asm/unistd_64.h
  HDRINST usr/include/asm/unistd_32.h
  HDRINST usr/include/asm/types.h
  HDRINST usr/include/asm/termios.h
  HDRINST usr/include/asm/termbits.h
  HDRINST usr/include/asm/sockios.h
  HDRINST usr/include/asm/socket.h
  HDRINST usr/include/asm/resource.h
  HDRINST usr/include/asm/poll.h
  HDRINST usr/include/asm/param.h
  HDRINST usr/include/asm/ipcbuf.h
  HDRINST usr/include/asm/ioctls.h
  HDRINST usr/include/asm/ioctl.h
  HDRINST usr/include/asm/fcntl.h
  HDRINST usr/include/asm/errno.h
  HDRINST usr/include/asm/bpf_perf_event.h
  INSTALL ./usr/include
make[1]: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4=
b00bc0f91400ac501f7edf16b595cd61b'
make[1]: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb=
4b00bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/dmabuf-heaps'
gcc -static -O3 -Wl,-no-as-needed -Wall    dmabuf-heap.c  -o /usr/src/perf_=
selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf16b595cd61b/tools/te=
sting/selftests/dmabuf-heaps/dmabuf-heap
dmabuf-heap.c:16:21: fatal error: drm/drm.h: No such file or directory
 #include <drm/drm.h>
                     ^
compilation terminated.
=2E./lib.mk:138: recipe for target '/usr/src/perf_selftests-x86_64-rhel-7.6=
-475bfb4b00bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/dmabuf-he=
aps/dmabuf-heap' failed
make[1]: *** [/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac=
501f7edf16b595cd61b/tools/testing/selftests/dmabuf-heaps/dmabuf-heap] Error=
 1
make[1]: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4=
b00bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/dmabuf-heaps'
Makefile:143: recipe for target 'all' failed
make: *** [all] Error 2
2019-10-25 16:32:18 make run_tests -C dmabuf-heaps
make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b0=
0bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/dmabuf-heaps'
gcc -static -O3 -Wl,-no-as-needed -Wall    dmabuf-heap.c  -o /usr/src/perf_=
selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf16b595cd61b/tools/te=
sting/selftests/dmabuf-heaps/dmabuf-heap
dmabuf-heap.c:16:21: fatal error: drm/drm.h: No such file or directory
 #include <drm/drm.h>
                     ^
compilation terminated.
=2E./lib.mk:138: recipe for target '/usr/src/perf_selftests-x86_64-rhel-7.6=
-475bfb4b00bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/dmabuf-he=
aps/dmabuf-heap' failed
make: *** [/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501=
f7edf16b595cd61b/tools/testing/selftests/dmabuf-heaps/dmabuf-heap] Error 1
make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00=
bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/dmabuf-heaps'
ignored_by_lkp efivarfs test: /sys/firmware/efi dir does not exist
2019-10-25 16:32:18 make run_tests -C exec
make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b0=
0bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/exec'
gcc -Wall -Wno-nonnull -D_GNU_SOURCE    execveat.c  -o /usr/src/perf_selfte=
sts-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf16b595cd61b/tools/testing/=
selftests/exec/execveat
execveat.c:8:0: warning: "_GNU_SOURCE" redefined
 #define _GNU_SOURCE  /* to get O_PATH, AT_EMPTY_PATH */
=20
<command-line>:0:0: note: this is the location of the previous definition
gcc -Wall -Wno-nonnull -D_GNU_SOURCE    recursion-depth.c  -o /usr/src/perf=
_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf16b595cd61b/tools/t=
esting/selftests/exec/recursion-depth
cd /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf16b=
595cd61b/tools/testing/selftests/exec && ln -s -f execveat execveat.symlink
cp /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf16b=
595cd61b/tools/testing/selftests/exec/execveat /usr/src/perf_selftests-x86_=
64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf16b595cd61b/tools/testing/selftest=
s/exec/execveat.denatured
chmod -x /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7=
edf16b595cd61b/tools/testing/selftests/exec/execveat.denatured
echo '#!/bin/sh' > /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91=
400ac501f7edf16b595cd61b/tools/testing/selftests/exec/script
echo 'exit $*' >> /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f914=
00ac501f7edf16b595cd61b/tools/testing/selftests/exec/script
chmod +x /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7=
edf16b595cd61b/tools/testing/selftests/exec/script
mkdir -p /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7=
edf16b595cd61b/tools/testing/selftests/exec/subdir
TAP version 13
1..2
# selftests: exec: execveat
# /bin/sh: 0: Can't open /dev/fd/8/usr/src/perf_selftests-x86_64-rhel-7.6-4=
75bfb4b00bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/exec/xxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxx/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx/xxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxx/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx/xxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxx/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx/xxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxx/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx/xxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxx/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx/xxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxx/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx/xxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx/yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy=
yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy=
yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy=
yyy
# Check success of execveat(5, '../execveat', 0)... [OK]
# Check success of execveat(7, 'execveat', 0)... [OK]
# Check success of execveat(9, 'execveat', 0)... [OK]
# Check success of execveat(-100, '/usr/src/perf_selfte...ftests/exec/execv=
eat', 0)... [OK]
# Check success of execveat(99, '/usr/src/perf_selfte...ftests/exec/execvea=
t', 0)... [OK]
# Check success of execveat(11, '', 4096)... [OK]
# Check success of execveat(20, '', 4096)... [OK]
# Check success of execveat(12, '', 4096)... [OK]
# Check success of execveat(17, '', 4096)... [OK]
# Check success of execveat(17, '', 4096)... [OK]
# Check success of execveat(18, '', 4096)... [OK]
# Check failure of execveat(11, '', 0) with ENOENT... [OK]
# Check failure of execveat(11, '(null)', 4096) with EFAULT... [OK]
# Check success of execveat(7, 'execveat.symlink', 0)... [OK]
# Check success of execveat(9, 'execveat.symlink', 0)... [OK]
# Check success of execveat(-100, '/usr/src/perf_selfte...xec/execveat.syml=
ink', 0)... [OK]
# Check success of execveat(13, '', 4096)... [OK]
# Check success of execveat(13, '', 4352)... [OK]
# Check failure of execveat(7, 'execveat.symlink', 256) with ELOOP... [OK]
# Check failure of execveat(9, 'execveat.symlink', 256) with ELOOP... [OK]
# Check failure of execveat(-100, '/usr/src/perf_selftests-x86_64-rhel-7.6-=
475bfb4b00bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/exec/execv=
eat.symlink', 256) with ELOOP... [OK]
# Check success of execveat(5, '../script', 0)... [OK]
# Check success of execveat(7, 'script', 0)... [OK]
# Check success of execveat(9, 'script', 0)... [OK]
# Check success of execveat(-100, '/usr/src/perf_selfte...elftests/exec/scr=
ipt', 0)... [OK]
# Check success of execveat(16, '', 4096)... [OK]
# Check success of execveat(16, '', 4352)... [OK]
# Check failure of execveat(21, '', 4096) with ENOENT... [OK]
# Check failure of execveat(10, 'script', 0) with ENOENT... [OK]
# Check success of execveat(19, '', 4096)... [OK]
# Check success of execveat(19, '', 4096)... [OK]
# Check success of execveat(6, '../script', 0)... [OK]
# Check success of execveat(6, 'script', 0)... [OK]
# Check success of execveat(6, '../script', 0)... [OK]
# Check failure of execveat(6, 'script', 0) with ENOENT... [OK]
# Check failure of execveat(7, 'execveat', 65535) with EINVAL... [OK]
# Check failure of execveat(7, 'no-such-file', 0) with ENOENT... [OK]
# Check failure of execveat(9, 'no-such-file', 0) with ENOENT... [OK]
# Check failure of execveat(-100, 'no-such-file', 0) with ENOENT... [OK]
# Check failure of execveat(7, '', 4096) with EACCES... [OK]
# Check failure of execveat(7, 'Makefile', 0) with EACCES... [OK]
# Check failure of execveat(14, '', 4096) with EACCES... [OK]
# Check failure of execveat(15, '', 4096) with EACCES... [OK]
# Check failure of execveat(99, '', 4096) with EBADF... [OK]
# Check failure of execveat(99, 'execveat', 0) with EBADF... [OK]
# Check failure of execveat(11, 'execveat', 0) with ENOTDIR... [OK]
# Invoke copy of 'execveat' via filename of length 4094:
# Check success of execveat(22, '', 4096)... [OK]
# Check success of execveat(8, 'usr/src/perf_selftes...yyyyyyyyyyyyyyyyyyyy=
', 0)... [OK]
# Invoke copy of 'script' via filename of length 4094:
# Check success of execveat(23, '', 4096)... [OK]
# Check success of execveat(8, 'usr/src/perf_selftes...yyyyyyyyyyyyyyyyyyyy=
', 0)... [OK]
ok 1 selftests: exec: execveat
# selftests: exec: recursion-depth
ok 2 selftests: exec: recursion-depth
make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00=
bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/exec'
ignored_by_lkp filesystems test
2019-10-25 16:32:19 mv /lib/udev/rules.d/50-firmware.rules .
2019-10-25 16:32:19 /etc/init.d/udev restart
Restarting udev (via systemctl): udev.service.
2019-10-25 16:32:19 make run_tests -C firmware
make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b0=
0bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/firmware'
TAP version 13
1..1
# selftests: firmware: fw_run_tests.sh
# -----------------------------------------------------
# Running kernel configuration test 1 -- rare
# Emulates:
# CONFIG_FW_LOADER=3Dy
# CONFIG_FW_LOADER_USER_HELPER=3Dn
# CONFIG_FW_LOADER_USER_HELPER_FALLBACK=3Dn
# ./fw_filesystem.sh: filesystem loading works
# ./fw_filesystem.sh: async filesystem loading works
#=20
# Testing with the file present...
# Batched request_firmware() normal try #1: OK
# Batched request_firmware() normal try #2: OK
# Batched request_firmware() normal try #3: OK
# Batched request_firmware() normal try #4: OK
# Batched request_firmware() normal try #5: OK
# Batched request_firmware_into_buf() normal try #1: OK
# Batched request_firmware_into_buf() normal try #2: OK
# Batched request_firmware_into_buf() normal try #3: OK
# Batched request_firmware_into_buf() normal try #4: OK
# Batched request_firmware_into_buf() normal try #5: OK
# Batched request_firmware_direct() normal try #1: OK
# Batched request_firmware_direct() normal try #2: OK
# Batched request_firmware_direct() normal try #3: OK
# Batched request_firmware_direct() normal try #4: OK
# Batched request_firmware_direct() normal try #5: OK
# Batched request_firmware_nowait(uevent=3Dtrue) normal try #1: OK
# Batched request_firmware_nowait(uevent=3Dtrue) normal try #2: OK
# Batched request_firmware_nowait(uevent=3Dtrue) normal try #3: OK
# Batched request_firmware_nowait(uevent=3Dtrue) normal try #4: OK
# Batched request_firmware_nowait(uevent=3Dtrue) normal try #5: OK
# Batched request_firmware_nowait(uevent=3Dfalse) normal try #1: OK
# Batched request_firmware_nowait(uevent=3Dfalse) normal try #2: OK
# Batched request_firmware_nowait(uevent=3Dfalse) normal try #3: OK
# Batched request_firmware_nowait(uevent=3Dfalse) normal try #4: OK
# Batched request_firmware_nowait(uevent=3Dfalse) normal try #5: OK
#=20
# Testing with the file missing...
# Batched request_firmware() nofile try #1: OK
# Batched request_firmware() nofile try #2: OK
# Batched request_firmware() nofile try #3: OK
# Batched request_firmware() nofile try #4: OK
# Batched request_firmware() nofile try #5: OK
# Batched request_firmware_into_buf() nofile try #1: OK
# Batched request_firmware_into_buf() nofile try #2: OK
# Batched request_firmware_into_buf() nofile try #3: OK
# Batched request_firmware_into_buf() nofile try #4: OK
# Batched request_firmware_into_buf() nofile try #5: OK
# Batched request_firmware_direct() nofile try #1: OK
# Batched request_firmware_direct() nofile try #2: OK
# Batched request_firmware_direct() nofile try #3: OK
# Batched request_firmware_direct() nofile try #4: OK
# Batched request_firmware_direct() nofile try #5: OK
# Batched request_firmware_nowait(uevent=3Dtrue) nofile try #1: OK
# Batched request_firmware_nowait(uevent=3Dtrue) nofile try #2: OK
# Batched request_firmware_nowait(uevent=3Dtrue) nofile try #3: OK
# Batched request_firmware_nowait(uevent=3Dtrue) nofile try #4: OK
# Batched request_firmware_nowait(uevent=3Dtrue) nofile try #5: OK
# Batched request_firmware_nowait(uevent=3Dfalse) nofile try #1: OK
# Batched request_firmware_nowait(uevent=3Dfalse) nofile try #2: OK
# Batched request_firmware_nowait(uevent=3Dfalse) nofile try #3: OK
# Batched request_firmware_nowait(uevent=3Dfalse) nofile try #4: OK
# Batched request_firmware_nowait(uevent=3Dfalse) nofile try #5: OK
# usermode helper disabled so ignoring test
# -----------------------------------------------------
# Running kernel configuration test 2 -- distro
# Emulates:
# CONFIG_FW_LOADER=3Dy
# CONFIG_FW_LOADER_USER_HELPER=3Dy
# CONFIG_FW_LOADER_USER_HELPER_FALLBACK=3Dn
# ./fw_filesystem.sh: timeout works
# ./fw_filesystem.sh: filesystem loading works
# ./fw_filesystem.sh: async filesystem loading works
#=20
# Testing with the file present...
# Batched request_firmware() normal try #1: OK
# Batched request_firmware() normal try #2: OK
# Batched request_firmware() normal try #3: OK
# Batched request_firmware() normal try #4: OK
# Batched request_firmware() normal try #5: OK
# Batched request_firmware_into_buf() normal try #1: OK
# Batched request_firmware_into_buf() normal try #2: OK
# Batched request_firmware_into_buf() normal try #3: OK
# Batched request_firmware_into_buf() normal try #4: OK
# Batched request_firmware_into_buf() normal try #5: OK
# Batched request_firmware_direct() normal try #1: OK
# Batched request_firmware_direct() normal try #2: OK
# Batched request_firmware_direct() normal try #3: OK
# Batched request_firmware_direct() normal try #4: OK
# Batched request_firmware_direct() normal try #5: OK
# Batched request_firmware_nowait(uevent=3Dtrue) normal try #1: OK
# Batched request_firmware_nowait(uevent=3Dtrue) normal try #2: not ok 1 se=
lftests: firmware: fw_run_tests.sh # TIMEOUT
make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00=
bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/firmware'
2019-10-25 16:33:06 mv 50-firmware.rules /lib/udev/rules.d/50-firmware.rules
2019-10-25 16:33:06 make run_tests -C ftrace
make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b0=
0bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/ftrace'
TAP version 13
1..1
# selftests: ftrace: ftracetest
# =3D=3D=3D Ftrace unit tests =3D=3D=3D
# [1] Basic trace file check	[PASS]
# [2] Basic test for tracers	[PASS]
# [3] Basic trace clock test	[PASS]
# [4] Basic event tracing check	[PASS]
# [5] Change the ringbuffer size	[PASS]
# [6] Snapshot and tracing setting	[PASS]
# [7] trace_pipe and trace_marker	[PASS]
# [8] Generic dynamic event - add/remove kprobe events	[PASS]
# [9] Generic dynamic event - add/remove synthetic events	[PASS]
# [10] Generic dynamic event - selective clear (compatibility)	[PASS]
# [11] Generic dynamic event - generic clear event	[PASS]
# [12] event tracing - enable/disable with event level files	[PASS]
# [13] event tracing - restricts events based on pid	[PASS]
# [14] event tracing - enable/disable with subsystem level files	[PASS]
# [15] event tracing - enable/disable with top level files	[PASS]
# [16] Test trace_printk from module	[UNRESOLVED]
# [17] ftrace - function graph filters with stack tracer	[PASS]
# [18] ftrace - function graph filters	[PASS]
# [19] ftrace - function glob filters	[PASS]
# [20] ftrace - function pid filters	[PASS]
# [21] ftrace - stacktrace filter command	[PASS]
# [22] ftrace - function trace with cpumask	[PASS]
# [23] ftrace - test for function event triggers	[PASS]
# [24] ftrace - function trace on module	[UNRESOLVED]
# [25] ftrace - function profiling	[PASS]
# [26] ftrace - function profiler with function tracing	[PASS]
# [27] ftrace - test reading of set_ftrace_filter	[PASS]
# [28] ftrace - Max stack tracer	[PASS]
# [29] ftrace - test for function traceon/off triggers	[PASS]
# [30] ftrace - test tracing error log support	[PASS]
# [31] Test creation and deletion of trace instances while setting an event=
	[PASS]
# [32] Test creation and deletion of trace instances	[PASS]
# [33] Kprobe dynamic event - adding and removing	[PASS]
# [34] Kprobe dynamic event - busy event check	[PASS]
# [35] Kprobe dynamic event with arguments	[PASS]
# [36] Kprobe event with comm arguments	[PASS]
# [37] Kprobe event string type argument	[PASS]
# [38] Kprobe event symbol argument	[PASS]
# [39] Kprobe event argument syntax	[PASS]
# [40] Kprobes event arguments with types	[PASS]
# [41] Kprobe event user-memory access	[PASS]
# [42] Kprobe event auto/manual naming	[PASS]
# [43] Kprobe dynamic event with function tracer	[PASS]
# [44] Kprobe dynamic event - probing module	[UNRESOLVED]
# [45] Create/delete multiprobe on kprobe event	[PASS]
# [46] Kprobe event parser error log check	[FAIL]
# [47] Kretprobe dynamic event with arguments	[PASS]
# [48] Kretprobe dynamic event with maxactive	[PASS]
# [49] Register/unregister many kprobe eventsnot ok 1 selftests: ftrace: ft=
racetest # TIMEOUT
make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00=
bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/ftrace'
2019-10-25 16:34:08 make run_tests -C futex
make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b0=
0bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/futex'
make[1]: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb=
4b00bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/futex/functional'
make --no-builtin-rules INSTALL_HDR_PATH=3D$OUTPUT/usr \
	ARCH=3Dx86 -C ../../../../.. headers_install
make[2]: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb=
4b00bc0f91400ac501f7edf16b595cd61b'
  INSTALL /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f=
7edf16b595cd61b/tools/testing/selftests/futex/functional/usr/include
make[2]: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4=
b00bc0f91400ac501f7edf16b595cd61b'
gcc  -g -O2 -Wall -D_GNU_SOURCE -pthread -I../include -I../../   -pthread -=
lrt  futex_wait_timeout.c ../include/futextest.h ../include/atomic.h ../inc=
lude/logging.h  -o /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91=
400ac501f7edf16b595cd61b/tools/testing/selftests/futex/functional/futex_wai=
t_timeout
gcc  -g -O2 -Wall -D_GNU_SOURCE -pthread -I../include -I../../   -pthread -=
lrt  futex_wait_wouldblock.c ../include/futextest.h ../include/atomic.h ../=
include/logging.h  -o /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0=
f91400ac501f7edf16b595cd61b/tools/testing/selftests/futex/functional/futex_=
wait_wouldblock
gcc  -g -O2 -Wall -D_GNU_SOURCE -pthread -I../include -I../../   -pthread -=
lrt  futex_requeue_pi.c ../include/futextest.h ../include/atomic.h ../inclu=
de/logging.h  -o /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f9140=
0ac501f7edf16b595cd61b/tools/testing/selftests/futex/functional/futex_reque=
ue_pi
gcc  -g -O2 -Wall -D_GNU_SOURCE -pthread -I../include -I../../   -pthread -=
lrt  futex_requeue_pi_signal_restart.c ../include/futextest.h ../include/at=
omic.h ../include/logging.h  -o /usr/src/perf_selftests-x86_64-rhel-7.6-475=
bfb4b00bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/futex/functio=
nal/futex_requeue_pi_signal_restart
gcc  -g -O2 -Wall -D_GNU_SOURCE -pthread -I../include -I../../   -pthread -=
lrt  futex_requeue_pi_mismatched_ops.c ../include/futextest.h ../include/at=
omic.h ../include/logging.h  -o /usr/src/perf_selftests-x86_64-rhel-7.6-475=
bfb4b00bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/futex/functio=
nal/futex_requeue_pi_mismatched_ops
gcc  -g -O2 -Wall -D_GNU_SOURCE -pthread -I../include -I../../   -pthread -=
lrt  futex_wait_uninitialized_heap.c ../include/futextest.h ../include/atom=
ic.h ../include/logging.h  -o /usr/src/perf_selftests-x86_64-rhel-7.6-475bf=
b4b00bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/futex/functiona=
l/futex_wait_uninitialized_heap
gcc  -g -O2 -Wall -D_GNU_SOURCE -pthread -I../include -I../../   -pthread -=
lrt  futex_wait_private_mapped_file.c ../include/futextest.h ../include/ato=
mic.h ../include/logging.h  -o /usr/src/perf_selftests-x86_64-rhel-7.6-475b=
fb4b00bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/futex/function=
al/futex_wait_private_mapped_file
make[1]: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4=
b00bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/futex/functional'
TAP version 13
1..1
# selftests: futex: run.sh
#=20
# TAP version 13
# 1..1
# # futex_requeue_pi: Test requeue functionality
# # 	Arguments: broadcast=3D0 locked=3D0 owner=3D0 timeout=3D0ns
# ok 1 futex-requeue-pi
# # Pass 1 Fail 0 Xfail 0 Xpass 0 Skip 0 Error 0
# TAP version 13
# 1..1
# # futex_requeue_pi: Test requeue functionality
# # 	Arguments: broadcast=3D1 locked=3D0 owner=3D0 timeout=3D0ns
# ok 1 futex-requeue-pi
# # Pass 1 Fail 0 Xfail 0 Xpass 0 Skip 0 Error 0
# TAP version 13
# 1..1
# # futex_requeue_pi: Test requeue functionality
# # 	Arguments: broadcast=3D1 locked=3D1 owner=3D0 timeout=3D0ns
# ok 1 futex-requeue-pi
# # Pass 1 Fail 0 Xfail 0 Xpass 0 Skip 0 Error 0
# TAP version 13
# 1..1
# # futex_requeue_pi: Test requeue functionality
# # 	Arguments: broadcast=3D1 locked=3D0 owner=3D1 timeout=3D0ns
# ok 1 futex-requeue-pi
# # Pass 1 Fail 0 Xfail 0 Xpass 0 Skip 0 Error 0
# TAP version 13
# 1..1
# # futex_requeue_pi: Test requeue functionality
# # 	Arguments: broadcast=3D0 locked=3D1 owner=3D0 timeout=3D0ns
# ok 1 futex-requeue-pi
# # Pass 1 Fail 0 Xfail 0 Xpass 0 Skip 0 Error 0
# TAP version 13
# 1..1
# # futex_requeue_pi: Test requeue functionality
# # 	Arguments: broadcast=3D0 locked=3D0 owner=3D1 timeout=3D0ns
# ok 1 futex-requeue-pi
# # Pass 1 Fail 0 Xfail 0 Xpass 0 Skip 0 Error 0
# TAP version 13
# 1..1
# # futex_requeue_pi: Test requeue functionality
# # 	Arguments: broadcast=3D1 locked=3D1 owner=3D0 timeout=3D5000ns
# ok 1 futex-requeue-pi
# # Pass 1 Fail 0 Xfail 0 Xpass 0 Skip 0 Error 0
# TAP version 13
# 1..1
# # futex_requeue_pi: Test requeue functionality
# # 	Arguments: broadcast=3D0 locked=3D1 owner=3D0 timeout=3D5000ns
# ok 1 futex-requeue-pi
# # Pass 1 Fail 0 Xfail 0 Xpass 0 Skip 0 Error 0
# TAP version 13
# 1..1
# # futex_requeue_pi: Test requeue functionality
# # 	Arguments: broadcast=3D1 locked=3D1 owner=3D0 timeout=3D500000ns
# ok 1 futex-requeue-pi
# # Pass 1 Fail 0 Xfail 0 Xpass 0 Skip 0 Error 0
# TAP version 13
# 1..1
# # futex_requeue_pi: Test requeue functionality
# # 	Arguments: broadcast=3D0 locked=3D1 owner=3D0 timeout=3D500000ns
# ok 1 futex-requeue-pi
# # Pass 1 Fail 0 Xfail 0 Xpass 0 Skip 0 Error 0
# TAP version 13
# 1..1
# # futex_requeue_pi: Test requeue functionality
# # 	Arguments: broadcast=3D1 locked=3D0 owner=3D0 timeout=3D5000ns
# ok 1 futex-requeue-pi
# # Pass 1 Fail 0 Xfail 0 Xpass 0 Skip 0 Error 0
# TAP version 13
# 1..1
# # futex_requeue_pi: Test requeue functionality
# # 	Arguments: broadcast=3D0 locked=3D0 owner=3D0 timeout=3D5000ns
# ok 1 futex-requeue-pi
# # Pass 1 Fail 0 Xfail 0 Xpass 0 Skip 0 Error 0
# TAP version 13
# 1..1
# # futex_requeue_pi: Test requeue functionality
# # 	Arguments: broadcast=3D1 locked=3D0 owner=3D0 timeout=3D500000ns
# ok 1 futex-requeue-pi
# # Pass 1 Fail 0 Xfail 0 Xpass 0 Skip 0 Error 0
# TAP version 13
# 1..1
# # futex_requeue_pi: Test requeue functionality
# # 	Arguments: broadcast=3D0 locked=3D0 owner=3D0 timeout=3D500000ns
# ok 1 futex-requeue-pi
# # Pass 1 Fail 0 Xfail 0 Xpass 0 Skip 0 Error 0
# TAP version 13
# 1..1
# # futex_requeue_pi: Test requeue functionality
# # 	Arguments: broadcast=3D1 locked=3D0 owner=3D1 timeout=3D5000ns
# ok 1 futex-requeue-pi
# # Pass 1 Fail 0 Xfail 0 Xpass 0 Skip 0 Error 0
# TAP version 13
# 1..1
# # futex_requeue_pi: Test requeue functionality
# # 	Arguments: broadcast=3D0 locked=3D1 owner=3D0 timeout=3D5000ns
# ok 1 futex-requeue-pi
# # Pass 1 Fail 0 Xfail 0 Xpass 0 Skip 0 Error 0
# TAP version 13
# 1..1
# # futex_requeue_pi: Test requeue functionality
# # 	Arguments: broadcast=3D1 locked=3D0 owner=3D1 timeout=3D500000ns
# ok 1 futex-requeue-pi
# # Pass 1 Fail 0 Xfail 0 Xpass 0 Skip 0 Error 0
# TAP version 13
# 1..1
# # futex_requeue_pi: Test requeue functionality
# # 	Arguments: broadcast=3D0 locked=3D1 owner=3D0 timeout=3D500000ns
# ok 1 futex-requeue-pi
# # Pass 1 Fail 0 Xfail 0 Xpass 0 Skip 0 Error 0
# TAP version 13
# 1..1
# # futex_requeue_pi: Test requeue functionality
# # 	Arguments: broadcast=3D1 locked=3D1 owner=3D0 timeout=3D2000000000ns
# ok 1 futex-requeue-pi
# # Pass 1 Fail 0 Xfail 0 Xpass 0 Skip 0 Error 0
# TAP version 13
# 1..1
# # futex_requeue_pi: Test requeue functionality
# # 	Arguments: broadcast=3D0 locked=3D1 owner=3D0 timeout=3D2000000000ns
# ok 1 futex-requeue-pi
# # Pass 1 Fail 0 Xfail 0 Xpass 0 Skip 0 Error 0
#=20
# TAP version 13
# 1..1
# # futex_requeue_pi_mismatched_ops: Detect mismatched requeue_pi operations
# ok 1 futex-requeue-pi-mismatched-ops
# # Pass 1 Fail 0 Xfail 0 Xpass 0 Skip 0 Error 0
#=20
# TAP version 13
# 1..1
# # futex_requeue_pi_signal_restart: Test signal handling during requeue_pi
# # 	Arguments: <none>
# ok 1 futex-requeue-pi-signal-restart
# # Pass 1 Fail 0 Xfail 0 Xpass 0 Skip 0 Error 0
#=20
# TAP version 13
# 1..1
# # futex_wait_timeout: Block on a futex and wait for timeout
# # 	Arguments: timeout=3D100000ns
# ok 1 futex-wait-timeout
# # Pass 1 Fail 0 Xfail 0 Xpass 0 Skip 0 Error 0
#=20
# TAP version 13
# 1..1
# # futex_wait_wouldblock: Test the unexpected futex value in FUTEX_WAIT
# ok 1 futex-wait-wouldblock
# # Pass 1 Fail 0 Xfail 0 Xpass 0 Skip 0 Error 0
#=20
# TAP version 13
# 1..1
# # futex_wait_uninitialized_heap: Test the uninitialized futex value in FU=
TEX_WAIT
# ok 1 futex-wait-uninitialized-heap
# # Pass 1 Fail 0 Xfail 0 Xpass 0 Skip 0 Error 0
# TAP version 13
# 1..1
# # futex_wait_private_mapped_file: Test the futex value of private file ma=
ppings in FUTEX_WAIT
# ok 1 futex-wait-private-mapped-file
# # Pass 1 Fail 0 Xfail 0 Xpass 0 Skip 0 Error 0
ok 1 selftests: futex: run.sh
make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00=
bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/futex'
2019-10-25 16:34:21 make run_tests -C gpio
make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b0=
0bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/gpio'
make OUTPUT=3D/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac=
501f7edf16b595cd61b/tools/gpio/ -C /usr/src/perf_selftests-x86_64-rhel-7.6-=
475bfb4b00bc0f91400ac501f7edf16b595cd61b/tools/gpio
make[1]: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb=
4b00bc0f91400ac501f7edf16b595cd61b/tools/gpio'
mkdir -p /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7=
edf16b595cd61b/tools/gpio/include/linux 2>&1 || true
ln -sf /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7ed=
f16b595cd61b/tools/gpio/../../include/uapi/linux/gpio.h /usr/src/perf_selft=
ests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf16b595cd61b/tools/gpio/in=
clude/linux/gpio.h
make -f /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7e=
df16b595cd61b/tools/build/Makefile.build dir=3D. obj=3Dlsgpio
make[2]: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb=
4b00bc0f91400ac501f7edf16b595cd61b/tools/gpio'
  CC       /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501=
f7edf16b595cd61b/tools/gpio/lsgpio.o
  CC       /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501=
f7edf16b595cd61b/tools/gpio/gpio-utils.o
  LD       /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501=
f7edf16b595cd61b/tools/gpio/lsgpio-in.o
make[2]: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4=
b00bc0f91400ac501f7edf16b595cd61b/tools/gpio'
  LINK     /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501=
f7edf16b595cd61b/tools/gpio/lsgpio
make -f /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7e=
df16b595cd61b/tools/build/Makefile.build dir=3D. obj=3Dgpio-hammer
make[2]: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb=
4b00bc0f91400ac501f7edf16b595cd61b/tools/gpio'
  CC       /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501=
f7edf16b595cd61b/tools/gpio/gpio-hammer.o
  LD       /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501=
f7edf16b595cd61b/tools/gpio/gpio-hammer-in.o
make[2]: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4=
b00bc0f91400ac501f7edf16b595cd61b/tools/gpio'
  LINK     /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501=
f7edf16b595cd61b/tools/gpio/gpio-hammer
make -f /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7e=
df16b595cd61b/tools/build/Makefile.build dir=3D. obj=3Dgpio-event-mon
make[2]: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb=
4b00bc0f91400ac501f7edf16b595cd61b/tools/gpio'
  CC       /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501=
f7edf16b595cd61b/tools/gpio/gpio-event-mon.o
  LD       /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501=
f7edf16b595cd61b/tools/gpio/gpio-event-mon-in.o
make[2]: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4=
b00bc0f91400ac501f7edf16b595cd61b/tools/gpio'
  LINK     /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501=
f7edf16b595cd61b/tools/gpio/gpio-event-mon
make[1]: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4=
b00bc0f91400ac501f7edf16b595cd61b/tools/gpio'
gcc -O2 -g -std=3Dgnu99 -Wall -I../../../../usr/include/ -I/usr/include/lib=
mount -I/usr/include/blkid -I/usr/include/uuid    gpio-mockup-chardev.c /us=
r/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf16b595cd6=
1b/tools/gpio/gpio-utils.o  -lmount -o gpio-mockup-chardev
make --no-builtin-rules ARCH=3Dx86 -C ../../../.. headers_install
make[1]: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb=
4b00bc0f91400ac501f7edf16b595cd61b'
  INSTALL ./usr/include
make[1]: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4=
b00bc0f91400ac501f7edf16b595cd61b'
TAP version 13
1..1
# selftests: gpio: gpio-mockup.sh
# 1.  Test dynamic allocation of gpio successful means insert gpiochip and
#     manipulate gpio pin successful
# GPIO gpio-mockup test with ranges: <-1,32>:=20
# -1,32     =20
# gpio<gpio-mockup> test failed
# Test gpiochip gpio-mockup: GPIO gpio-mockup test with ranges: <-1,32,-1,3=
2>:=20
# -1,32,-1,32=20
# gpio<gpio-mockup> test failed
# Test gpiochip gpio-mockup: GPIO gpio-mockup test with ranges: <-1,32,-1,3=
2,-1,32>:=20
# -1,32,-1,32,-1,32=20
# gpio<gpio-mockup> test failed
# Test gpiochip gpio-mockup: 3.  Error test: successful means insert gpioch=
ip failed
# 3.1 Test number of gpio overflow
# GPIO gpio-mockup test with ranges: <-1,32,-1,1024>:=20
# -1,32,-1,1024=20
# Test gpiochip gpio-mockup: Invalid test successful
# GPIO test PASS
ok 1 selftests: gpio: gpio-mockup.sh
make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00=
bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/gpio'
ia64 test: not in Makefile
2019-10-25 16:34:22 make TARGETS=3Dia64
make --no-builtin-rules ARCH=3Dx86 -C ../../.. headers_install
make[1]: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb=
4b00bc0f91400ac501f7edf16b595cd61b'
  INSTALL ./usr/include
make[1]: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4=
b00bc0f91400ac501f7edf16b595cd61b'
make[1]: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb=
4b00bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/ia64'
Makefile:9: warning: overriding recipe for target 'clean'
=2E./lib.mk:123: warning: ignoring old recipe for target 'clean'
gcc     aliasing-test.c   -o aliasing-test
make[1]: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4=
b00bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/ia64'
2019-10-25 16:34:24 make run_tests -C ia64
make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b0=
0bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/ia64'
Makefile:9: warning: overriding recipe for target 'clean'
=2E./lib.mk:123: warning: ignoring old recipe for target 'clean'
TAP version 13
1..1
# selftests: ia64: aliasing-test
# PASS: /dev/mem 0x0-0xa0000 is readable
# PASS: /dev/mem 0xa0000-0xc0000 is mappable
# PASS: /dev/mem 0xc0000-0x100000 is readable
# PASS: /dev/mem 0x0-0x100000 is mappable
# PASS: /sys/devices/pci0000:00/0000:00:02.0/rom read 39422 bytes
# PASS: /sys/devices/pci0000:00/0000:00:03.0/rom read 231422 bytes
# PASS: /proc/bus/pci/00/00.0 0x0-0xa0000 not mappable
# PASS: /proc/bus/pci/00/01.0 0x0-0xa0000 not mappable
# PASS: /proc/bus/pci/00/01.1 0x0-0xa0000 not mappable
# PASS: /proc/bus/pci/00/01.3 0x0-0xa0000 not mappable
# PASS: /proc/bus/pci/00/02.0 0x0-0xa0000 not mappable
# PASS: /proc/bus/pci/00/03.0 0x0-0xa0000 not mappable
# PASS: /proc/bus/pci/00/04.0 0x0-0xa0000 not mappable
# PASS: /proc/bus/pci/00/05.0 0x0-0xa0000 not mappable
# PASS: /proc/bus/pci/00/06.0 0x0-0xa0000 not mappable
# PASS: /proc/bus/pci/00/07.0 0x0-0xa0000 not mappable
# PASS: /proc/bus/pci/00/08.0 0x0-0xa0000 not mappable
# PASS: /proc/bus/pci/00/09.0 0x0-0xa0000 not mappable
# PASS: /proc/bus/pci/00/0a.0 0x0-0xa0000 not mappable
# PASS: /proc/bus/pci/00/0b.0 0x0-0xa0000 not mappable
# PASS: /proc/bus/pci/00/00.0 0xa0000-0xc0000 not mappable
# PASS: /proc/bus/pci/00/01.0 0xa0000-0xc0000 not mappable
# PASS: /proc/bus/pci/00/01.1 0xa0000-0xc0000 not mappable
# PASS: /proc/bus/pci/00/01.3 0xa0000-0xc0000 not mappable
# PASS: /proc/bus/pci/00/02.0 0xa0000-0xc0000 not mappable
# PASS: /proc/bus/pci/00/03.0 0xa0000-0xc0000 not mappable
# PASS: /proc/bus/pci/00/04.0 0xa0000-0xc0000 not mappable
# PASS: /proc/bus/pci/00/05.0 0xa0000-0xc0000 not mappable
# PASS: /proc/bus/pci/00/06.0 0xa0000-0xc0000 not mappable
# PASS: /proc/bus/pci/00/07.0 0xa0000-0xc0000 not mappable
# PASS: /proc/bus/pci/00/08.0 0xa0000-0xc0000 not mappable
# PASS: /proc/bus/pci/00/09.0 0xa0000-0xc0000 not mappable
# PASS: /proc/bus/pci/00/0a.0 0xa0000-0xc0000 not mappable
# PASS: /proc/bus/pci/00/0b.0 0xa0000-0xc0000 not mappable
# PASS: /proc/bus/pci/00/00.0 0xc0000-0x100000 not mappable
# PASS: /proc/bus/pci/00/01.0 0xc0000-0x100000 not mappable
# PASS: /proc/bus/pci/00/01.1 0xc0000-0x100000 not mappable
# PASS: /proc/bus/pci/00/01.3 0xc0000-0x100000 not mappable
# PASS: /proc/bus/pci/00/02.0 0xc0000-0x100000 not mappable
# PASS: /proc/bus/pci/00/03.0 0xc0000-0x100000 not mappable
# PASS: /proc/bus/pci/00/04.0 0xc0000-0x100000 not mappable
# PASS: /proc/bus/pci/00/05.0 0xc0000-0x100000 not mappable
# PASS: /proc/bus/pci/00/06.0 0xc0000-0x100000 not mappable
# PASS: /proc/bus/pci/00/07.0 0xc0000-0x100000 not mappable
# PASS: /proc/bus/pci/00/08.0 0xc0000-0x100000 not mappable
# PASS: /proc/bus/pci/00/09.0 0xc0000-0x100000 not mappable
# PASS: /proc/bus/pci/00/0a.0 0xc0000-0x100000 not mappable
# PASS: /proc/bus/pci/00/0b.0 0xc0000-0x100000 not mappable
# PASS: /proc/bus/pci/00/00.0 0x0-0x100000 not mappable
# PASS: /proc/bus/pci/00/01.0 0x0-0x100000 not mappable
# PASS: /proc/bus/pci/00/01.1 0x0-0x100000 not mappable
# PASS: /proc/bus/pci/00/01.3 0x0-0x100000 not mappable
# PASS: /proc/bus/pci/00/02.0 0x0-0x100000 not mappable
# PASS: /proc/bus/pci/00/03.0 0x0-0x100000 not mappable
# PASS: /proc/bus/pci/00/04.0 0x0-0x100000 not mappable
# PASS: /proc/bus/pci/00/05.0 0x0-0x100000 not mappable
# PASS: /proc/bus/pci/00/06.0 0x0-0x100000 not mappable
# PASS: /proc/bus/pci/00/07.0 0x0-0x100000 not mappable
# PASS: /proc/bus/pci/00/08.0 0x0-0x100000 not mappable
# PASS: /proc/bus/pci/00/09.0 0x0-0x100000 not mappable
# PASS: /proc/bus/pci/00/0a.0 0x0-0x100000 not mappable
# PASS: /proc/bus/pci/00/0b.0 0x0-0x100000 not mappable
ok 1 selftests: ia64: aliasing-test
make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00=
bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/ia64'
2019-10-25 16:34:25 make run_tests -C intel_pstate
make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b0=
0bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/intel_pstate'
gcc  -Wall -D_GNU_SOURCE    msr.c  -lm -o /usr/src/perf_selftests-x86_64-rh=
el-7.6-475bfb4b00bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/int=
el_pstate/msr
gcc  -Wall -D_GNU_SOURCE    aperf.c  -lm -o /usr/src/perf_selftests-x86_64-=
rhel-7.6-475bfb4b00bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/i=
ntel_pstate/aperf
TAP version 13
1..1
# selftests: intel_pstate: run.sh
# cpupower: error while loading shared libraries: libcpupower.so.0: cannot =
open shared object file: No such file or directory
# ./run.sh: line 90: / 1000: syntax error: operand expected (error token is=
 "/ 1000")
# cpupower: error while loading shared libraries: libcpupower.so.0: cannot =
open shared object file: No such file or directory
# ./run.sh: line 92: / 1000: syntax error: operand expected (error token is=
 "/ 1000")
# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
# The marketing frequency of the cpu is 0 MHz
# The maximum frequency of the cpu is  MHz
# The minimum frequency of the cpu is  MHz
# Target	      Actual	    Difference	  MSR(0x199)	max_perf_pct
ok 1 selftests: intel_pstate: run.sh
make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00=
bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/intel_pstate'
2019-10-25 16:34:25 make run_tests -C ipc
make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b0=
0bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/ipc'
gcc -DCONFIG_X86_64 -D__x86_64__ -I../../../../usr/include/    msgque.c  -o=
 /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf16b59=
5cd61b/tools/testing/selftests/ipc/msgque
TAP version 13
1..1
# selftests: ipc: msgque
# # Pass 0 Fail 0 Xfail 0 Xpass 0 Skip 0 Error 0
ok 1 selftests: ipc: msgque
make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00=
bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/ipc'
ignored_by_lkp ir.ir_loopback_rcmm tests
2019-10-25 16:34:25 make run_tests -C ir
make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b0=
0bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/ir'
gcc -Wall -O2 -I../../../include/uapi    ir_loopback.c  -o /usr/src/perf_se=
lftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf16b595cd61b/tools/test=
ing/selftests/ir/ir_loopback
TAP version 13
1..1
# selftests: ir: ir_loopback.sh
# Sending IR on rc0 and receiving IR on rc0.
# Testing protocol rc-5 for decoder rc-5 (1/18)...
# Testing scancode:1f2a
# Testing scancode:1252
# Testing scancode:1614
# Testing scancode:b56
# Testing scancode:e14
# Testing scancode:1120
# Testing scancode:652
# Testing scancode:b15
# Testing scancode:146b
# Testing scancode:a73
# OK
# Testing protocol rc-5x-20 for decoder rc-5 (2/18)...
# Testing scancode:84a37
# Testing scancode:1b7311
# Testing scancode:1d1218
# Testing scancode:1f6c19
# Testing scancode:e5b01
# Testing scancode:94622
# Testing scancode:8030e
# Testing scancode:13411b
# Testing scancode:c6313
# Testing scancode:87b13
# OK
# Testing protocol rc-5-sz for decoder rc-5-sz (3/18)...
# Testing scancode:82b
# Testing scancode:2c7f
# Testing scancode:e85
# Testing scancode:159
# Testing scancode:543
# Testing scancode:f5b
# Testing scancode:15a
# Testing scancode:235f
# Testing scancode:23b0
# Testing scancode:531
# OK
# Testing protocol jvc for decoder jvc (4/18)...
# Testing scancode:58af
# Testing scancode:835a
# Testing scancode:8804
# Testing scancode:8f43
# Testing scancode:f31
# Testing scancode:5618
# Testing scancode:4063
# Testing scancode:7603
# Testing scancode:21ae
# Testing scancode:754f
# OK
# Testing protocol sony-12 for decoder sony (5/18)...
# Testing scancode:76
# Testing scancode:1e0025
# Testing scancode:e0060
# Testing scancode:1d000f
# Testing scancode:1d007e
# Testing scancode:1d0061
# Testing scancode:70031
# Testing scancode:6004c
# Testing scancode:10003d
# Testing scancode:140044
# OK
# Testing protocol sony-15 for decoder sony (6/18)...
# Testing scancode:ce001f
# Testing scancode:840068
# Testing scancode:760043
# Testing scancode:3c0025
# Testing scancode:9b0041
# Testing scancode:ee0006
# Testing scancode:2f0000
# Testing scancode:12001c
# Testing scancode:320066
# Testing scancode:870031
# OK
# Testing protocol sony-20 for decoder sony (7/18)...
# Testing scancode:12464d
# Testing scancode:c6b15
# Testing scancode:1dfd0b
# Testing scancode:6ce51
# Testing scancode:afa59
# Testing scancode:120c3c
# Testing scancode:f246a
# Testing scancode:183a3c
# Testing scancode:16823f
# Testing scancode:54618
# OK
# Testing protocol nec for decoder nec (8/18)...
# Testing scancode:b00b
# Testing scancode:e336
# Testing scancode:b2bd
# Testing scancode:18eb
# Testing scancode:d645
# Testing scancode:8bbb
# Testing scancode:5d4d
# Testing scancode:ff6
# Testing scancode:e887
# Testing scancode:e38a
# OK
# Testing protocol nec-x for decoder nec (9/18)...
# Testing scancode:d02d3a
# Testing scancode:96c0a7
# Testing scancode:eb01f2
# Testing scancode:46b6fd
# Testing scancode:d2f74c
# Testing scancode:8661b3
# Testing scancode:34d603
# Testing scancode:2cd4c
# Testing scancode:9912cf
# Testing scancode:66e869
# OK
# Testing protocol nec-32 for decoder nec (10/18)...
# Testing scancode:6d8a46fd
# Testing scancode:61ab591d
# Testing scancode:3113537f
# Testing scancode:6f684409
# Testing scancode:2bf2276e
# Testing scancode:ade4dd8
# Testing scancode:231a5045
# Testing scancode:62a14bd8
# Testing scancode:52968894
# Testing scancode:4670d285
# OK
# Testing protocol sanyo for decoder sanyo (11/18)...
# Testing scancode:691f0
# Testing scancode:138a0
# Testing scancode:7b5bb
# Testing scancode:a44ad
# Testing scancode:1a518b
# Testing scancode:1c8c00
# Testing scancode:bd068
# Testing scancode:10aed8
# Testing scancode:189bf6
# Testing scancode:13b8f0
# OK
# Testing protocol rc-6-0 for decoder rc-6 (12/18)...
# Testing scancode:9262
# Testing scancode:c930
# Testing scancode:7997
# Testing scancode:9454
# Testing scancode:802d
# Testing scancode:70e3
# Testing scancode:f608
# Testing scancode:5630
# Testing scancode:3e2f
# Testing scancode:8d7
# OK
# Testing protocol rc-6-6a-20 for decoder rc-6 (13/18)...
# Testing scancode:b3e9a
# Testing scancode:a852d
# Testing scancode:d61f4
# Testing scancode:e9219
# Testing scancode:2c936
# Testing scancode:f8963
# Testing scancode:cdff1
# Testing scancode:d197b
# Testing scancode:d53b
# Testing scancode:36885
# OK
# Testing protocol rc-6-6a-24 for decoder rc-6 (14/18)...
# Testing scancode:ddec00
# Testing scancode:27672c
# Testing scancode:54a125
# Testing scancode:c5a1bb
# Testing scancode:91abd9
# Testing scancode:4ef2b1
# Testing scancode:222dbb
# Testing scancode:bd7c42
# Testing scancode:dfa189
# Testing scancode:3ac9b1
# OK
# Testing protocol rc-6-6a-32 for decoder rc-6 (15/18)...
# Testing scancode:16b13532
# Testing scancode:7ed733ec
# Testing scancode:452392e1
# Testing scancode:7b3baec9
# Testing scancode:33b9c840
# Testing scancode:6153130e
# Testing scancode:1b991fac
# Testing scancode:f22be48
# Testing scancode:43b7693f
# Testing scancode:49f95ddb
# OK
# Testing protocol rc-6-mce for decoder rc-6 (16/18)...
# Testing scancode:800f4720
# Testing scancode:800f27d9
# Testing scancode:800f6308
# Testing scancode:800f2914
# Testing scancode:800f39f2
# Testing scancode:800f2c3e
# Testing scancode:800f3277
# Testing scancode:800f19e3
# Testing scancode:800f45ba
# Testing scancode:800f07b3
# OK
# Testing protocol sharp for decoder sharp (17/18)...
# Testing scancode:268
# Testing scancode:11ba
# Testing scancode:edf
# Testing scancode:38e
# Testing scancode:1376
# Testing scancode:1ab8
# Testing scancode:163f
# Testing scancode:131
# Testing scancode:16fa
# Testing scancode:17c8
# OK
# Testing protocol imon for decoder imon (18/18)...
# Testing scancode:2ea44ae3
# Testing scancode:6cda4c2c
# Testing scancode:21cbebb4
# Testing scancode:73c7ddc4
# Testing scancode:6815faf5
# Testing scancode:5585b3f5
# Testing scancode:551af0d3
# Testing scancode:3af1aa1
# Testing scancode:64a8723d
# Testing scancode:18d25a12
# OK
# # Planned tests !=3D run tests (0 !=3D 180)
# # Pass 180 Fail 0 Xfail 0 Xpass 0 Skip 0 Error 0
ok 1 selftests: ir: ir_loopback.sh
make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00=
bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/ir'
2019-10-25 16:34:35 make run_tests -C kcmp
make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b0=
0bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/kcmp'
gcc -I../../../../usr/include/    kcmp_test.c  -o /usr/src/perf_selftests-x=
86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf16b595cd61b/tools/testing/selft=
ests/kcmp/kcmp_test
TAP version 13
1..1
# selftests: kcmp: kcmp_test
# pid1:  17536 pid2:  17537 FD:  1 FILES:  2 VM:  1 FS:  2 SIGHAND:  1 IO: =
 0 SYSVSEM:  0 INV: -1
# PASS: 0 returned as expected
# PASS: 0 returned as expected
# PASS: 0 returned as expected
# # Planned tests !=3D run tests (0 !=3D 3)
# # Pass 3 Fail 0 Xfail 0 Xpass 0 Skip 0 Error 0
# # Planned tests !=3D run tests (0 !=3D 3)
# # Pass 3 Fail 0 Xfail 0 Xpass 0 Skip 0 Error 0
# # Pass 0 Fail 0 Xfail 0 Xpass 0 Skip 0 Error 0
ok 1 selftests: kcmp: kcmp_test
make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00=
bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/kcmp'
2019-10-25 16:34:35 make run_tests -C kexec
make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b0=
0bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/kexec'
TAP version 13
1..2
# selftests: kexec: test_kexec_load.sh
# [INFO] kexec_load is enabled
# [INFO] IMA enabled
# [INFO] efivars is not mounted on /sys/firmware/efi/efivars
# efi_vars is not enabled
#=20
not ok 1 selftests: kexec: test_kexec_load.sh # SKIP
# selftests: kexec: test_kexec_file_load.sh
# [INFO] kexec_file_load is enabled
# [INFO] IMA enabled
# [INFO] efivars is not mounted on /sys/firmware/efi/efivars
# efi_vars is not enabled
#=20
not ok 2 selftests: kexec: test_kexec_file_load.sh # SKIP
make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00=
bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/kexec'
kmod test: not in Makefile
2019-10-25 16:34:36 make TARGETS=3Dkmod
make --no-builtin-rules ARCH=3Dx86 -C ../../.. headers_install
make[1]: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb=
4b00bc0f91400ac501f7edf16b595cd61b'
  INSTALL ./usr/include
make[1]: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4=
b00bc0f91400ac501f7edf16b595cd61b'
make[1]: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb=
4b00bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/kmod'
make[1]: Nothing to be done for 'all'.
make[1]: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4=
b00bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/kmod'
2019-10-25 16:34:36 make run_tests -C kmod
make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b0=
0bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/kmod'
TAP version 13
1..1
# selftests: kmod: kmod.sh
# Fri Oct 25 16:34:37 CST 2019
# Running test: kmod_test_0001 - run #0
# kmod_test_0001_driver: OK! - loading kmod test
# kmod_test_0001_driver: OK! - Return value: 256 (MODULE_NOT_FOUND), expect=
ed MODULE_NOT_FOUND
# kmod_test_0001_fs: OK! - loading kmod test
# kmod_test_0001_fs: OK! - Return value: -22 (-EINVAL), expected -EINVAL
# Fri Oct 25 16:34:37 CST 2019
# Running test: kmod_test_0001 - run #1
# kmod_test_0001_driver: OK! - loading kmod test
# kmod_test_0001_driver: OK! - Return value: 256 (MODULE_NOT_FOUND), expect=
ed MODULE_NOT_FOUND
# kmod_test_0001_fs: OK! - loading kmod test
# kmod_test_0001_fs: OK! - Return value: -22 (-EINVAL), expected -EINVAL
# Fri Oct 25 16:34:37 CST 2019
# Running test: kmod_test_0001 - run #2
# kmod_test_0001_driver: OK! - loading kmod test
# kmod_test_0001_driver: OK! - Return value: 256 (MODULE_NOT_FOUND), expect=
ed MODULE_NOT_FOUND
# kmod_test_0001_fs: OK! - loading kmod test
# kmod_test_0001_fs: OK! - Return value: -22 (-EINVAL), expected -EINVAL
# Fri Oct 25 16:34:37 CST 2019
# Running test: kmod_test_0002 - run #0
# kmod_test_0002_driver: OK! - loading kmod test
# kmod_test_0002_driver: OK! - Return value: 256 (MODULE_NOT_FOUND), expect=
ed MODULE_NOT_FOUND
# kmod_test_0002_fs: OK! - loading kmod test
# kmod_test_0002_fs: OK! - Return value: -22 (-EINVAL), expected -EINVAL
# Fri Oct 25 16:34:37 CST 2019
# Running test: kmod_test_0002 - run #1
# kmod_test_0002_driver: OK! - loading kmod test
# kmod_test_0002_driver: OK! - Return value: 256 (MODULE_NOT_FOUND), expect=
ed MODULE_NOT_FOUND
# kmod_test_0002_fs: OK! - loading kmod test
# kmod_test_0002_fs: OK! - Return value: -22 (-EINVAL), expected -EINVAL
# Fri Oct 25 16:34:37 CST 2019
# Running test: kmod_test_0002 - run #2
# kmod_test_0002_driver: OK! - loading kmod test
# kmod_test_0002_driver: OK! - Return value: 256 (MODULE_NOT_FOUND), expect=
ed MODULE_NOT_FOUND
# kmod_test_0002_fs: OK! - loading kmod test
# kmod_test_0002_fs: OK! - Return value: -22 (-EINVAL), expected -EINVAL
# Fri Oct 25 16:34:37 CST 2019
# Running test: kmod_test_0003 - run #0
# kmod_test_0003: OK! - loading kmod test
# kmod_test_0003: OK! - Return value: 0 (SUCCESS), expected SUCCESS
# Fri Oct 25 16:34:37 CST 2019
# Running test: kmod_test_0004 - run #0
# kmod_test_0004: OK! - loading kmod test
# kmod_test_0004: OK! - Return value: 0 (SUCCESS), expected SUCCESS
# Fri Oct 25 16:34:37 CST 2019
# Running test: kmod_test_0005 - run #0
# kmod_test_0005: OK! - loading kmod test
# kmod_test_0005: OK! - Return value: 0 (SUCCESS), expected SUCCESS
# Fri Oct 25 16:34:38 CST 2019
# Running test: kmod_test_0005 - run #1
# kmod_test_0005: OK! - loading kmod test
# kmod_test_0005: OK! - Return value: 0 (SUCCESS), expected SUCCESS
# Fri Oct 25 16:34:38 CST 2019
# Running test: kmod_test_0005 - run #2
# kmod_test_0005: OK! - loading kmod test
# kmod_test_0005: OK! - Return value: 0 (SUCCESS), expected SUCCESS
# Fri Oct 25 16:34:38 CST 2019
# Running test: kmod_test_0005 - run #3
# kmod_test_0005: OK! - loading kmod test
# kmod_test_0005: OK! - Return value: 0 (SUCCESS), expected SUCCESS
# Fri Oct 25 16:34:38 CST 2019
# Running test: kmod_test_0005 - run #4
# kmod_test_0005: OK! - loading kmod test
# kmod_test_0005: OK! - Return value: 0 (SUCCESS), expected SUCCESS
# Fri Oct 25 16:34:38 CST 2019
# Running test: kmod_test_0005 - run #5
# kmod_test_0005: OK! - loading kmod test
# kmod_test_0005: OK! - Return value: 0 (SUCCESS), expected SUCCESS
# Fri Oct 25 16:34:38 CST 2019
# Running test: kmod_test_0005 - run #6
# kmod_test_0005: OK! - loading kmod test
# kmod_test_0005: OK! - Return value: 0 (SUCCESS), expected SUCCESS
# Fri Oct 25 16:34:38 CST 2019
# Running test: kmod_test_0005 - run #7
# kmod_test_0005: OK! - loading kmod test
# kmod_test_0005: OK! - Return value: 0 (SUCCESS), expected SUCCESS
# Fri Oct 25 16:34:38 CST 2019
# Running test: kmod_test_0005 - run #8
# kmod_test_0005: OK! - loading kmod test
# kmod_test_0005: OK! - Return value: 0 (SUCCESS), expected SUCCESS
# Fri Oct 25 16:34:39 CST 2019
# Running test: kmod_test_0005 - run #9
# kmod_test_0005: OK! - loading kmod test
# kmod_test_0005: OK! - Return value: 0 (SUCCESS), expected SUCCESS
# Fri Oct 25 16:34:39 CST 2019
# Running test: kmod_test_0006 - run #0
# kmod_test_0006: OK! - loading kmod test
# kmod_test_0006: OK! - Return value: 0 (SUCCESS), expected SUCCESS
# Fri Oct 25 16:34:41 CST 2019
# Running test: kmod_test_0006 - run #1
# kmod_test_0006: OK! - loading kmod test
# kmod_test_0006: OK! - Return value: 0 (SUCCESS), expected SUCCESS
# Fri Oct 25 16:34:43 CST 2019
# Running test: kmod_test_0006 - run #2
# kmod_test_0006: OK! - loading kmod test
# kmod_test_0006: OK! - Return value: 0 (SUCCESS), expected SUCCESS
# Fri Oct 25 16:34:44 CST 2019
# Running test: kmod_test_0006 - run #3
# kmod_test_0006: OK! - loading kmod test
# kmod_test_0006: OK! - Return value: 0 (SUCCESS), expected SUCCESS
# Fri Oct 25 16:34:46 CST 2019
# Running test: kmod_test_0006 - run #4
# kmod_test_0006: OK! - loading kmod test
# kmod_test_0006: OK! - Return value: 0 (SUCCESS), expected SUCCESS
# Fri Oct 25 16:34:47 CST 2019
# Running test: kmod_test_0006 - run #5
# kmod_test_0006: OK! - loading kmod test
# kmod_test_0006: OK! - Return value: 0 (SUCCESS), expected SUCCESS
# Fri Oct 25 16:34:47 CST 2019
# Running test: kmod_test_0006 - run #6
# kmod_test_0006: OK! - loading kmod test
# kmod_test_0006: OK! - Return value: 0 (SUCCESS), expected SUCCESS
# Fri Oct 25 16:34:49 CST 2019
# Running test: kmod_test_0006 - run #7
# kmod_test_0006: OK! - loading kmod test
# kmod_test_0006: OK! - Return value: 0 (SUCCESS), expected SUCCESS
# Fri Oct 25 16:34:49 CST 2019
# Running test: kmod_test_0006 - run #8
# kmod_test_0006: OK! - loading kmod test
# kmod_test_0006: OK! - Return value: 0 (SUCCESS), expected SUCCESS
# Fri Oct 25 16:34:50 CST 2019
# Running test: kmod_test_0006 - run #9
# kmod_test_0006: OK! - loading kmod test
# kmod_test_0006: OK! - Return value: 0 (SUCCESS), expected SUCCESS
# Fri Oct 25 16:34:51 CST 2019
# Running test: kmod_test_0007 - run #0
# kmod_test_0005: OK! - loading kmod test
# kmod_test_0005: OK! - Return value: 0 (SUCCESS), expected SUCCESS
# kmod_test_0006: OK! - loading kmod test
# kmod_test_0006: OK! - Return value: 0 (SUCCESS), expected SUCCESS
# Fri Oct 25 16:34:55 CST 2019
# Running test: kmod_test_0007 - run #1
# kmod_test_0005: OK! - loading kmod test
# kmod_test_0005: OK! - Return value: 0 (SUCCESS), expected SUCCESS
# kmod_test_0006: OK! - loading kmod test
# kmod_test_0006: OK! - Return value: 0 (SUCCESS), expected SUCCESS
# Fri Oct 25 16:34:58 CST 2019
# Running test: kmod_test_0007 - run #2
# kmod_test_0005: OK! - loading kmod test
# kmod_test_0005: OK! - Return value: 0 (SUCCESS), expected SUCCESS
# kmod_test_0006: OK! - loading kmod test
# kmod_test_0006: OK! - Return value: 0 (SUCCESS), expected SUCCESS
# Fri Oct 25 16:35:01 CST 2019
# Running test: kmod_test_0007 - run #3
# kmod_test_0005: OK! - loading kmod test
# kmod_test_0005: OK! - Return value: 0 (SUCCESS), expected SUCCESS
# kmod_test_0006: OK! - loading kmod test
# kmod_test_0006: OK! - Return value: 0 (SUCCESS), expected SUCCESS
# Fri Oct 25 16:35:05 CST 2019
# Running test: kmod_test_0007 - run #4
# kmod_test_0005: OK! - loading kmod test
# kmod_test_0005: OK! - Return value: 0 (SUCCESS), expected SUCCESS
# kmod_test_0006: OK! - loading kmod test
# kmod_test_0006: OK! - Return value: 0 (SUCCESS), expected SUCCESS
# ./kmod.sh: line 529: [[: 1 0002:3:1 0003:1:1 0004:1:1 0005:10:1 0006:10:1=
 0007:5:1 0008:150:1 0009:150:1: syntax error in expression (error token is=
 "0002:3:1 0003:1:1 0004:1:1 0005:10:1 0006:10:1 0007:5:1 0008:150:1 0009:1=
50:1")
# ./kmod.sh: line 529: [[: 1 0002:3:1 0003:1:1 0004:1:1 0005:10:1 0006:10:1=
 0007:5:1 0008:150:1 0009:150:1: syntax error in expression (error token is=
 "0002:3:1 0003:1:1 0004:1:1 0005:10:1 0006:10:1 0007:5:1 0008:150:1 0009:1=
50:1")
# Test completed
ok 1 selftests: kmod: kmod.sh
make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00=
bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/kmod'
2019-10-25 16:35:08 make run_tests -C kvm
make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b0=
0bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/kvm'
make --no-builtin-rules ARCH=3Dx86 -C ../../../.. headers_install
make[1]: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb=
4b00bc0f91400ac501f7edf16b595cd61b'
  INSTALL ./usr/include
make[1]: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4=
b00bc0f91400ac501f7edf16b595cd61b'
gcc -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=3Dgnu99 -fno-stac=
k-protector -fno-PIE -I../../../../tools/include -I../../../../usr/include/=
 -Iinclude -Ilib -Iinclude/x86_64 -I..   -c lib/assert.c -o /usr/src/perf_s=
elftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf16b595cd61b/tools/tes=
ting/selftests/kvm/lib/assert.o
gcc -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=3Dgnu99 -fno-stac=
k-protector -fno-PIE -I../../../../tools/include -I../../../../usr/include/=
 -Iinclude -Ilib -Iinclude/x86_64 -I..   -c lib/elf.c -o /usr/src/perf_self=
tests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf16b595cd61b/tools/testin=
g/selftests/kvm/lib/elf.o
gcc -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=3Dgnu99 -fno-stac=
k-protector -fno-PIE -I../../../../tools/include -I../../../../usr/include/=
 -Iinclude -Ilib -Iinclude/x86_64 -I..   -c lib/io.c -o /usr/src/perf_selft=
ests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf16b595cd61b/tools/testing=
/selftests/kvm/lib/io.o
gcc -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=3Dgnu99 -fno-stac=
k-protector -fno-PIE -I../../../../tools/include -I../../../../usr/include/=
 -Iinclude -Ilib -Iinclude/x86_64 -I..   -c lib/kvm_util.c -o /usr/src/perf=
_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf16b595cd61b/tools/t=
esting/selftests/kvm/lib/kvm_util.o
gcc -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=3Dgnu99 -fno-stac=
k-protector -fno-PIE -I../../../../tools/include -I../../../../usr/include/=
 -Iinclude -Ilib -Iinclude/x86_64 -I..   -c lib/sparsebit.c -o /usr/src/per=
f_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf16b595cd61b/tools/=
testing/selftests/kvm/lib/sparsebit.o
gcc -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=3Dgnu99 -fno-stac=
k-protector -fno-PIE -I../../../../tools/include -I../../../../usr/include/=
 -Iinclude -Ilib/x86_64 -Iinclude/x86_64 -I..   -c lib/x86_64/processor.c -=
o /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf16b5=
95cd61b/tools/testing/selftests/kvm/lib/x86_64/processor.o
gcc -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=3Dgnu99 -fno-stac=
k-protector -fno-PIE -I../../../../tools/include -I../../../../usr/include/=
 -Iinclude -Ilib/x86_64 -Iinclude/x86_64 -I..   -c lib/x86_64/vmx.c -o /usr=
/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf16b595cd61=
b/tools/testing/selftests/kvm/lib/x86_64/vmx.o
gcc -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=3Dgnu99 -fno-stac=
k-protector -fno-PIE -I../../../../tools/include -I../../../../usr/include/=
 -Iinclude -Ilib/x86_64 -Iinclude/x86_64 -I..   -c lib/x86_64/ucall.c -o /u=
sr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf16b595cd=
61b/tools/testing/selftests/kvm/lib/x86_64/ucall.o
ar crs /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7ed=
f16b595cd61b/tools/testing/selftests/kvm/libkvm.a /usr/src/perf_selftests-x=
86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf16b595cd61b/tools/testing/selft=
ests/kvm/lib/assert.o /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0=
f91400ac501f7edf16b595cd61b/tools/testing/selftests/kvm/lib/elf.o /usr/src/=
perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf16b595cd61b/too=
ls/testing/selftests/kvm/lib/io.o /usr/src/perf_selftests-x86_64-rhel-7.6-4=
75bfb4b00bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/kvm/lib/kvm=
_util.o /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7e=
df16b595cd61b/tools/testing/selftests/kvm/lib/sparsebit.o /usr/src/perf_sel=
ftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf16b595cd61b/tools/testi=
ng/selftests/kvm/lib/x86_64/processor.o /usr/src/perf_selftests-x86_64-rhel=
-7.6-475bfb4b00bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/kvm/l=
ib/x86_64/vmx.o /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400=
ac501f7edf16b595cd61b/tools/testing/selftests/kvm/lib/x86_64/ucall.o
gcc -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=3Dgnu99 -fno-stac=
k-protector -fno-PIE -I../../../../tools/include -I../../../../usr/include/=
 -Iinclude -Ix86_64 -Iinclude/x86_64 -I..  -pthread  -no-pie   x86_64/cr4_c=
puid_sync_test.c /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f9140=
0ac501f7edf16b595cd61b/tools/testing/selftests/kvm/libkvm.a  -o /usr/src/pe=
rf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf16b595cd61b/tools=
/testing/selftests/kvm/x86_64/cr4_cpuid_sync_test
gcc -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=3Dgnu99 -fno-stac=
k-protector -fno-PIE -I../../../../tools/include -I../../../../usr/include/=
 -Iinclude -Ix86_64 -Iinclude/x86_64 -I..  -pthread  -no-pie   x86_64/evmcs=
_test.c /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7e=
df16b595cd61b/tools/testing/selftests/kvm/libkvm.a  -o /usr/src/perf_selfte=
sts-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf16b595cd61b/tools/testing/=
selftests/kvm/x86_64/evmcs_test
gcc -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=3Dgnu99 -fno-stac=
k-protector -fno-PIE -I../../../../tools/include -I../../../../usr/include/=
 -Iinclude -Ix86_64 -Iinclude/x86_64 -I..  -pthread  -no-pie   x86_64/hyper=
v_cpuid.c /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f=
7edf16b595cd61b/tools/testing/selftests/kvm/libkvm.a  -o /usr/src/perf_self=
tests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf16b595cd61b/tools/testin=
g/selftests/kvm/x86_64/hyperv_cpuid
gcc -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=3Dgnu99 -fno-stac=
k-protector -fno-PIE -I../../../../tools/include -I../../../../usr/include/=
 -Iinclude -Ix86_64 -Iinclude/x86_64 -I..  -pthread  -no-pie   x86_64/mmio_=
warning_test.c /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400a=
c501f7edf16b595cd61b/tools/testing/selftests/kvm/libkvm.a  -o /usr/src/perf=
_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf16b595cd61b/tools/t=
esting/selftests/kvm/x86_64/mmio_warning_test
gcc -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=3Dgnu99 -fno-stac=
k-protector -fno-PIE -I../../../../tools/include -I../../../../usr/include/=
 -Iinclude -Ix86_64 -Iinclude/x86_64 -I..  -pthread  -no-pie   x86_64/platf=
orm_info_test.c /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400=
ac501f7edf16b595cd61b/tools/testing/selftests/kvm/libkvm.a  -o /usr/src/per=
f_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf16b595cd61b/tools/=
testing/selftests/kvm/x86_64/platform_info_test
gcc -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=3Dgnu99 -fno-stac=
k-protector -fno-PIE -I../../../../tools/include -I../../../../usr/include/=
 -Iinclude -Ix86_64 -Iinclude/x86_64 -I..  -pthread  -no-pie   x86_64/set_s=
regs_test.c /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac50=
1f7edf16b595cd61b/tools/testing/selftests/kvm/libkvm.a  -o /usr/src/perf_se=
lftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf16b595cd61b/tools/test=
ing/selftests/kvm/x86_64/set_sregs_test
gcc -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=3Dgnu99 -fno-stac=
k-protector -fno-PIE -I../../../../tools/include -I../../../../usr/include/=
 -Iinclude -Ix86_64 -Iinclude/x86_64 -I..  -pthread  -no-pie   x86_64/smm_t=
est.c /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf=
16b595cd61b/tools/testing/selftests/kvm/libkvm.a  -o /usr/src/perf_selftest=
s-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf16b595cd61b/tools/testing/se=
lftests/kvm/x86_64/smm_test
gcc -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=3Dgnu99 -fno-stac=
k-protector -fno-PIE -I../../../../tools/include -I../../../../usr/include/=
 -Iinclude -Ix86_64 -Iinclude/x86_64 -I..  -pthread  -no-pie   x86_64/state=
_test.c /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7e=
df16b595cd61b/tools/testing/selftests/kvm/libkvm.a  -o /usr/src/perf_selfte=
sts-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf16b595cd61b/tools/testing/=
selftests/kvm/x86_64/state_test
gcc -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=3Dgnu99 -fno-stac=
k-protector -fno-PIE -I../../../../tools/include -I../../../../usr/include/=
 -Iinclude -Ix86_64 -Iinclude/x86_64 -I..  -pthread  -no-pie   x86_64/sync_=
regs_test.c /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac50=
1f7edf16b595cd61b/tools/testing/selftests/kvm/libkvm.a  -o /usr/src/perf_se=
lftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf16b595cd61b/tools/test=
ing/selftests/kvm/x86_64/sync_regs_test
gcc -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=3Dgnu99 -fno-stac=
k-protector -fno-PIE -I../../../../tools/include -I../../../../usr/include/=
 -Iinclude -Ix86_64 -Iinclude/x86_64 -I..  -pthread  -no-pie   x86_64/vmx_c=
lose_while_nested_test.c /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00=
bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/kvm/libkvm.a  -o /us=
r/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf16b595cd6=
1b/tools/testing/selftests/kvm/x86_64/vmx_close_while_nested_test
gcc -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=3Dgnu99 -fno-stac=
k-protector -fno-PIE -I../../../../tools/include -I../../../../usr/include/=
 -Iinclude -Ix86_64 -Iinclude/x86_64 -I..  -pthread  -no-pie   x86_64/vmx_d=
irty_log_test.c /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400=
ac501f7edf16b595cd61b/tools/testing/selftests/kvm/libkvm.a  -o /usr/src/per=
f_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf16b595cd61b/tools/=
testing/selftests/kvm/x86_64/vmx_dirty_log_test
gcc -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=3Dgnu99 -fno-stac=
k-protector -fno-PIE -I../../../../tools/include -I../../../../usr/include/=
 -Iinclude -Ix86_64 -Iinclude/x86_64 -I..  -pthread  -no-pie   x86_64/vmx_s=
et_nested_state_test.c /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc=
0f91400ac501f7edf16b595cd61b/tools/testing/selftests/kvm/libkvm.a  -o /usr/=
src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf16b595cd61b=
/tools/testing/selftests/kvm/x86_64/vmx_set_nested_state_test
gcc -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=3Dgnu99 -fno-stac=
k-protector -fno-PIE -I../../../../tools/include -I../../../../usr/include/=
 -Iinclude -Ix86_64 -Iinclude/x86_64 -I..  -pthread  -no-pie   x86_64/vmx_t=
sc_adjust_test.c /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f9140=
0ac501f7edf16b595cd61b/tools/testing/selftests/kvm/libkvm.a  -o /usr/src/pe=
rf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf16b595cd61b/tools=
/testing/selftests/kvm/x86_64/vmx_tsc_adjust_test
gcc -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=3Dgnu99 -fno-stac=
k-protector -fno-PIE -I../../../../tools/include -I../../../../usr/include/=
 -Iinclude -I. -Iinclude/x86_64 -I..  -pthread  -no-pie   clear_dirty_log_t=
est.c /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf=
16b595cd61b/tools/testing/selftests/kvm/libkvm.a  -o /usr/src/perf_selftest=
s-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf16b595cd61b/tools/testing/se=
lftests/kvm/clear_dirty_log_test
gcc -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=3Dgnu99 -fno-stac=
k-protector -fno-PIE -I../../../../tools/include -I../../../../usr/include/=
 -Iinclude -I. -Iinclude/x86_64 -I..  -pthread  -no-pie   dirty_log_test.c =
/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf16b595=
cd61b/tools/testing/selftests/kvm/libkvm.a  -o /usr/src/perf_selftests-x86_=
64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf16b595cd61b/tools/testing/selftest=
s/kvm/dirty_log_test
gcc -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=3Dgnu99 -fno-stac=
k-protector -fno-PIE -I../../../../tools/include -I../../../../usr/include/=
 -Iinclude -I. -Iinclude/x86_64 -I..  -pthread  -no-pie   kvm_create_max_vc=
pus.c /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf=
16b595cd61b/tools/testing/selftests/kvm/libkvm.a  -o /usr/src/perf_selftest=
s-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf16b595cd61b/tools/testing/se=
lftests/kvm/kvm_create_max_vcpus
TAP version 13
1..16
# selftests: kvm: cr4_cpuid_sync_test
not ok 1 selftests: kvm: cr4_cpuid_sync_test # SKIP
# selftests: kvm: evmcs_test
# Testing guest mode: PA-bits:ANY, VA-bits:48,  4K pages
not ok 2 selftests: kvm: evmcs_test # SKIP
# selftests: kvm: hyperv_cpuid
not ok 3 selftests: kvm: hyperv_cpuid # SKIP
# selftests: kvm: mmio_warning_test
# =3D=3D=3D=3D Test Assertion Failure =3D=3D=3D=3D
#   lib/kvm_util.c:1642: f !=3D NULL
#   pid=3D22848 tid=3D22848 - No such file or directory
#      1	0x0000000000403cce: vm_is_unrestricted_guest at kvm_util.c:1641
#      2	0x00000000004011e7: main at mmio_warning_test.c:100
#      3	0x00007f723a5fbbba: ?? ??:0
#      4	0x00000000004012c9: _start at ??:?
#   Error in opening KVM dev file: 2
not ok 4 selftests: kvm: mmio_warning_test # exit=3D254
# selftests: kvm: platform_info_test
not ok 5 selftests: kvm: platform_info_test # SKIP
# selftests: kvm: set_sregs_test
# Testing guest mode: PA-bits:ANY, VA-bits:48,  4K pages
not ok 6 selftests: kvm: set_sregs_test # SKIP
# selftests: kvm: smm_test
# Testing guest mode: PA-bits:ANY, VA-bits:48,  4K pages
not ok 7 selftests: kvm: smm_test # SKIP
# selftests: kvm: state_test
# Testing guest mode: PA-bits:ANY, VA-bits:48,  4K pages
not ok 8 selftests: kvm: state_test # SKIP
# selftests: kvm: sync_regs_test
not ok 9 selftests: kvm: sync_regs_test # SKIP
# selftests: kvm: vmx_close_while_nested_test
not ok 10 selftests: kvm: vmx_close_while_nested_test # SKIP
# selftests: kvm: vmx_dirty_log_test
# Testing guest mode: PA-bits:ANY, VA-bits:48,  4K pages
not ok 11 selftests: kvm: vmx_dirty_log_test # SKIP
# selftests: kvm: vmx_set_nested_state_test
not ok 12 selftests: kvm: vmx_set_nested_state_test # SKIP
# selftests: kvm: vmx_tsc_adjust_test
not ok 13 selftests: kvm: vmx_tsc_adjust_test # SKIP
# selftests: kvm: clear_dirty_log_test
not ok 14 selftests: kvm: clear_dirty_log_test # SKIP
# selftests: kvm: dirty_log_test
# Test iterations: 32, interval: 10 (ms)
# Testing guest mode: PA-bits:ANY, VA-bits:48,  4K pages
not ok 15 selftests: kvm: dirty_log_test # SKIP
# selftests: kvm: kvm_create_max_vcpus
not ok 16 selftests: kvm: kvm_create_max_vcpus # SKIP
make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00=
bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/kvm'
2019-10-25 16:35:13 make run_tests -C lib
make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b0=
0bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/lib'
TAP version 13
1..4
# selftests: lib: printf.sh
# printf: ok
ok 1 selftests: lib: printf.sh
# selftests: lib: bitmap.sh
# bitmap: ok
ok 2 selftests: lib: bitmap.sh
# selftests: lib: prime_numbers.sh
# prime numbers: ok
ok 3 selftests: lib: prime_numbers.sh
# selftests: lib: strscpy.sh
# strscpy*: ok
ok 4 selftests: lib: strscpy.sh
make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00=
bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/lib'
locking test: not in Makefile
2019-10-25 16:35:14 make TARGETS=3Dlocking
make --no-builtin-rules ARCH=3Dx86 -C ../../.. headers_install
make[1]: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb=
4b00bc0f91400ac501f7edf16b595cd61b'
  INSTALL ./usr/include
make[1]: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4=
b00bc0f91400ac501f7edf16b595cd61b'
make[1]: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb=
4b00bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/locking'
make[1]: Nothing to be done for 'all'.
make[1]: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4=
b00bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/locking'
2019-10-25 16:35:14 make run_tests -C locking
make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b0=
0bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/locking'
TAP version 13
1..1
# selftests: locking: ww_mutex.sh
# locking/ww_mutex: ok
ok 1 selftests: locking: ww_mutex.sh
make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00=
bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/locking'



To reproduce:

        # build kernel
	cd linux
	cp config-5.4.0-rc4-00042-g475bfb4b00bc0 .config
	make HOSTCC=3Dgcc-7 CC=3Dgcc-7 ARCH=3Dx86_64 olddefconfig prepare modules_=
prepare bzImage

        git clone https://github.com/intel/lkp-tests.git
        cd lkp-tests
        bin/lkp qemu -k <bzImage> job-script # job-script is attached in th=
is email



Thanks,
Oliver Sang


--m51xatjYGsM+13rf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="config-5.4.0-rc4-00042-g475bfb4b00bc0"

#
# Automatically generated file; DO NOT EDIT.
# Linux/x86_64 5.4.0-rc4 Kernel Configuration
#

#
# Compiler: gcc-7 (Debian 7.4.0-14) 7.4.0
#
CONFIG_CC_IS_GCC=y
CONFIG_GCC_VERSION=70400
CONFIG_CLANG_VERSION=0
CONFIG_CC_CAN_LINK=y
CONFIG_CC_HAS_ASM_GOTO=y
CONFIG_CC_HAS_ASM_INLINE=y
CONFIG_CC_HAS_WARN_MAYBE_UNINITIALIZED=y
CONFIG_IRQ_WORK=y
CONFIG_BUILDTIME_EXTABLE_SORT=y
CONFIG_THREAD_INFO_IN_TASK=y

#
# General setup
#
CONFIG_INIT_ENV_ARG_LIMIT=32
# CONFIG_COMPILE_TEST is not set
# CONFIG_HEADER_TEST is not set
CONFIG_LOCALVERSION=""
CONFIG_LOCALVERSION_AUTO=y
CONFIG_BUILD_SALT=""
CONFIG_HAVE_KERNEL_GZIP=y
CONFIG_HAVE_KERNEL_BZIP2=y
CONFIG_HAVE_KERNEL_LZMA=y
CONFIG_HAVE_KERNEL_XZ=y
CONFIG_HAVE_KERNEL_LZO=y
CONFIG_HAVE_KERNEL_LZ4=y
CONFIG_KERNEL_GZIP=y
# CONFIG_KERNEL_BZIP2 is not set
# CONFIG_KERNEL_LZMA is not set
# CONFIG_KERNEL_XZ is not set
# CONFIG_KERNEL_LZO is not set
# CONFIG_KERNEL_LZ4 is not set
CONFIG_DEFAULT_HOSTNAME="(none)"
CONFIG_SWAP=y
CONFIG_SYSVIPC=y
CONFIG_SYSVIPC_SYSCTL=y
CONFIG_POSIX_MQUEUE=y
CONFIG_POSIX_MQUEUE_SYSCTL=y
CONFIG_CROSS_MEMORY_ATTACH=y
CONFIG_USELIB=y
CONFIG_AUDIT=y
CONFIG_HAVE_ARCH_AUDITSYSCALL=y
CONFIG_AUDITSYSCALL=y

#
# IRQ subsystem
#
CONFIG_GENERIC_IRQ_PROBE=y
CONFIG_GENERIC_IRQ_SHOW=y
CONFIG_GENERIC_IRQ_EFFECTIVE_AFF_MASK=y
CONFIG_GENERIC_PENDING_IRQ=y
CONFIG_GENERIC_IRQ_MIGRATION=y
CONFIG_IRQ_DOMAIN=y
CONFIG_IRQ_SIM=y
CONFIG_IRQ_DOMAIN_HIERARCHY=y
CONFIG_GENERIC_MSI_IRQ=y
CONFIG_GENERIC_MSI_IRQ_DOMAIN=y
CONFIG_GENERIC_IRQ_MATRIX_ALLOCATOR=y
CONFIG_GENERIC_IRQ_RESERVATION_MODE=y
CONFIG_IRQ_FORCED_THREADING=y
CONFIG_SPARSE_IRQ=y
# CONFIG_GENERIC_IRQ_DEBUGFS is not set
# end of IRQ subsystem

CONFIG_CLOCKSOURCE_WATCHDOG=y
CONFIG_ARCH_CLOCKSOURCE_DATA=y
CONFIG_ARCH_CLOCKSOURCE_INIT=y
CONFIG_CLOCKSOURCE_VALIDATE_LAST_CYCLE=y
CONFIG_GENERIC_TIME_VSYSCALL=y
CONFIG_GENERIC_CLOCKEVENTS=y
CONFIG_GENERIC_CLOCKEVENTS_BROADCAST=y
CONFIG_GENERIC_CLOCKEVENTS_MIN_ADJUST=y
CONFIG_GENERIC_CMOS_UPDATE=y

#
# Timers subsystem
#
CONFIG_TICK_ONESHOT=y
CONFIG_NO_HZ_COMMON=y
# CONFIG_HZ_PERIODIC is not set
# CONFIG_NO_HZ_IDLE is not set
CONFIG_NO_HZ_FULL=y
CONFIG_CONTEXT_TRACKING=y
# CONFIG_CONTEXT_TRACKING_FORCE is not set
CONFIG_NO_HZ=y
CONFIG_HIGH_RES_TIMERS=y
# end of Timers subsystem

# CONFIG_PREEMPT_NONE is not set
CONFIG_PREEMPT_VOLUNTARY=y
# CONFIG_PREEMPT is not set
CONFIG_PREEMPT_COUNT=y

#
# CPU/Task time and stats accounting
#
CONFIG_VIRT_CPU_ACCOUNTING=y
CONFIG_VIRT_CPU_ACCOUNTING_GEN=y
# CONFIG_IRQ_TIME_ACCOUNTING is not set
CONFIG_HAVE_SCHED_AVG_IRQ=y
CONFIG_BSD_PROCESS_ACCT=y
CONFIG_BSD_PROCESS_ACCT_V3=y
CONFIG_TASKSTATS=y
CONFIG_TASK_DELAY_ACCT=y
CONFIG_TASK_XACCT=y
CONFIG_TASK_IO_ACCOUNTING=y
# CONFIG_PSI is not set
# end of CPU/Task time and stats accounting

CONFIG_CPU_ISOLATION=y

#
# RCU Subsystem
#
CONFIG_TREE_RCU=y
# CONFIG_RCU_EXPERT is not set
CONFIG_SRCU=y
CONFIG_TREE_SRCU=y
CONFIG_TASKS_RCU=y
CONFIG_RCU_STALL_COMMON=y
CONFIG_RCU_NEED_SEGCBLIST=y
CONFIG_RCU_NOCB_CPU=y
# end of RCU Subsystem

CONFIG_BUILD_BIN2C=y
CONFIG_IKCONFIG=y
CONFIG_IKCONFIG_PROC=y
# CONFIG_IKHEADERS is not set
CONFIG_LOG_BUF_SHIFT=20
CONFIG_LOG_CPU_MAX_BUF_SHIFT=12
CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=13
CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=y

#
# Scheduler features
#
# end of Scheduler features

CONFIG_ARCH_SUPPORTS_NUMA_BALANCING=y
CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=y
CONFIG_ARCH_SUPPORTS_INT128=y
CONFIG_NUMA_BALANCING=y
CONFIG_NUMA_BALANCING_DEFAULT_ENABLED=y
CONFIG_CGROUPS=y
CONFIG_PAGE_COUNTER=y
CONFIG_MEMCG=y
CONFIG_MEMCG_SWAP=y
CONFIG_MEMCG_SWAP_ENABLED=y
CONFIG_MEMCG_KMEM=y
CONFIG_BLK_CGROUP=y
CONFIG_CGROUP_WRITEBACK=y
CONFIG_CGROUP_SCHED=y
CONFIG_FAIR_GROUP_SCHED=y
CONFIG_CFS_BANDWIDTH=y
CONFIG_RT_GROUP_SCHED=y
CONFIG_CGROUP_PIDS=y
CONFIG_CGROUP_RDMA=y
CONFIG_CGROUP_FREEZER=y
CONFIG_CGROUP_HUGETLB=y
CONFIG_CPUSETS=y
CONFIG_PROC_PID_CPUSET=y
CONFIG_CGROUP_DEVICE=y
CONFIG_CGROUP_CPUACCT=y
CONFIG_CGROUP_PERF=y
CONFIG_CGROUP_BPF=y
# CONFIG_CGROUP_DEBUG is not set
CONFIG_SOCK_CGROUP_DATA=y
CONFIG_NAMESPACES=y
CONFIG_UTS_NS=y
CONFIG_IPC_NS=y
CONFIG_USER_NS=y
CONFIG_PID_NS=y
CONFIG_NET_NS=y
CONFIG_CHECKPOINT_RESTORE=y
CONFIG_SCHED_AUTOGROUP=y
# CONFIG_SYSFS_DEPRECATED is not set
CONFIG_RELAY=y
CONFIG_BLK_DEV_INITRD=y
CONFIG_INITRAMFS_SOURCE=""
CONFIG_RD_GZIP=y
CONFIG_RD_BZIP2=y
CONFIG_RD_LZMA=y
CONFIG_RD_XZ=y
CONFIG_RD_LZO=y
CONFIG_RD_LZ4=y
CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=y
# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
CONFIG_SYSCTL=y
CONFIG_HAVE_UID16=y
CONFIG_SYSCTL_EXCEPTION_TRACE=y
CONFIG_HAVE_PCSPKR_PLATFORM=y
CONFIG_BPF=y
CONFIG_EXPERT=y
CONFIG_UID16=y
CONFIG_MULTIUSER=y
CONFIG_SGETMASK_SYSCALL=y
CONFIG_SYSFS_SYSCALL=y
# CONFIG_SYSCTL_SYSCALL is not set
CONFIG_FHANDLE=y
CONFIG_POSIX_TIMERS=y
CONFIG_PRINTK=y
CONFIG_PRINTK_NMI=y
CONFIG_BUG=y
CONFIG_ELF_CORE=y
CONFIG_PCSPKR_PLATFORM=y
CONFIG_BASE_FULL=y
CONFIG_FUTEX=y
CONFIG_FUTEX_PI=y
CONFIG_EPOLL=y
CONFIG_SIGNALFD=y
CONFIG_TIMERFD=y
CONFIG_EVENTFD=y
CONFIG_SHMEM=y
CONFIG_AIO=y
CONFIG_IO_URING=y
CONFIG_ADVISE_SYSCALLS=y
CONFIG_MEMBARRIER=y
CONFIG_KALLSYMS=y
CONFIG_KALLSYMS_ALL=y
CONFIG_KALLSYMS_ABSOLUTE_PERCPU=y
CONFIG_KALLSYMS_BASE_RELATIVE=y
CONFIG_BPF_SYSCALL=y
CONFIG_BPF_JIT_ALWAYS_ON=y
CONFIG_USERFAULTFD=y
CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE=y
CONFIG_RSEQ=y
# CONFIG_DEBUG_RSEQ is not set
CONFIG_EMBEDDED=y
CONFIG_HAVE_PERF_EVENTS=y
# CONFIG_PC104 is not set

#
# Kernel Performance Events And Counters
#
CONFIG_PERF_EVENTS=y
# CONFIG_DEBUG_PERF_USE_VMALLOC is not set
# end of Kernel Performance Events And Counters

CONFIG_VM_EVENT_COUNTERS=y
CONFIG_SLUB_DEBUG=y
# CONFIG_SLUB_MEMCG_SYSFS_ON is not set
# CONFIG_COMPAT_BRK is not set
# CONFIG_SLAB is not set
CONFIG_SLUB=y
# CONFIG_SLOB is not set
CONFIG_SLAB_MERGE_DEFAULT=y
# CONFIG_SLAB_FREELIST_RANDOM is not set
# CONFIG_SLAB_FREELIST_HARDENED is not set
# CONFIG_SHUFFLE_PAGE_ALLOCATOR is not set
CONFIG_SLUB_CPU_PARTIAL=y
CONFIG_SYSTEM_DATA_VERIFICATION=y
CONFIG_PROFILING=y
CONFIG_TRACEPOINTS=y
# end of General setup

CONFIG_64BIT=y
CONFIG_X86_64=y
CONFIG_X86=y
CONFIG_INSTRUCTION_DECODER=y
CONFIG_OUTPUT_FORMAT="elf64-x86-64"
CONFIG_ARCH_DEFCONFIG="arch/x86/configs/x86_64_defconfig"
CONFIG_LOCKDEP_SUPPORT=y
CONFIG_STACKTRACE_SUPPORT=y
CONFIG_MMU=y
CONFIG_ARCH_MMAP_RND_BITS_MIN=28
CONFIG_ARCH_MMAP_RND_BITS_MAX=32
CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MIN=8
CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=16
CONFIG_GENERIC_ISA_DMA=y
CONFIG_GENERIC_BUG=y
CONFIG_GENERIC_BUG_RELATIVE_POINTERS=y
CONFIG_ARCH_MAY_HAVE_PC_FDC=y
CONFIG_GENERIC_CALIBRATE_DELAY=y
CONFIG_ARCH_HAS_CPU_RELAX=y
CONFIG_ARCH_HAS_CACHE_LINE_SIZE=y
CONFIG_ARCH_HAS_FILTER_PGPROT=y
CONFIG_HAVE_SETUP_PER_CPU_AREA=y
CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=y
CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=y
CONFIG_ARCH_HIBERNATION_POSSIBLE=y
CONFIG_ARCH_SUSPEND_POSSIBLE=y
CONFIG_ARCH_WANT_GENERAL_HUGETLB=y
CONFIG_ZONE_DMA32=y
CONFIG_AUDIT_ARCH=y
CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=y
CONFIG_HAVE_INTEL_TXT=y
CONFIG_X86_64_SMP=y
CONFIG_ARCH_SUPPORTS_UPROBES=y
CONFIG_FIX_EARLYCON_MEM=y
CONFIG_DYNAMIC_PHYSICAL_MASK=y
CONFIG_PGTABLE_LEVELS=5
CONFIG_CC_HAS_SANE_STACKPROTECTOR=y

#
# Processor type and features
#
CONFIG_ZONE_DMA=y
CONFIG_SMP=y
CONFIG_X86_FEATURE_NAMES=y
CONFIG_X86_X2APIC=y
CONFIG_X86_MPPARSE=y
# CONFIG_GOLDFISH is not set
CONFIG_RETPOLINE=y
CONFIG_X86_CPU_RESCTRL=y
CONFIG_X86_EXTENDED_PLATFORM=y
# CONFIG_X86_NUMACHIP is not set
# CONFIG_X86_VSMP is not set
CONFIG_X86_UV=y
# CONFIG_X86_GOLDFISH is not set
# CONFIG_X86_INTEL_MID is not set
CONFIG_X86_INTEL_LPSS=y
CONFIG_X86_AMD_PLATFORM_DEVICE=y
CONFIG_IOSF_MBI=y
# CONFIG_IOSF_MBI_DEBUG is not set
CONFIG_X86_SUPPORTS_MEMORY_FAILURE=y
# CONFIG_SCHED_OMIT_FRAME_POINTER is not set
CONFIG_HYPERVISOR_GUEST=y
CONFIG_PARAVIRT=y
CONFIG_PARAVIRT_XXL=y
# CONFIG_PARAVIRT_DEBUG is not set
CONFIG_PARAVIRT_SPINLOCKS=y
CONFIG_X86_HV_CALLBACK_VECTOR=y
CONFIG_XEN=y
CONFIG_XEN_PV=y
CONFIG_XEN_PV_SMP=y
# CONFIG_XEN_DOM0 is not set
CONFIG_XEN_PVHVM=y
CONFIG_XEN_PVHVM_SMP=y
CONFIG_XEN_512GB=y
CONFIG_XEN_SAVE_RESTORE=y
# CONFIG_XEN_DEBUG_FS is not set
# CONFIG_XEN_PVH is not set
CONFIG_KVM_GUEST=y
CONFIG_ARCH_CPUIDLE_HALTPOLL=y
# CONFIG_PVH is not set
# CONFIG_KVM_DEBUG_FS is not set
CONFIG_PARAVIRT_TIME_ACCOUNTING=y
CONFIG_PARAVIRT_CLOCK=y
# CONFIG_JAILHOUSE_GUEST is not set
# CONFIG_ACRN_GUEST is not set
# CONFIG_MK8 is not set
# CONFIG_MPSC is not set
# CONFIG_MCORE2 is not set
# CONFIG_MATOM is not set
CONFIG_GENERIC_CPU=y
CONFIG_X86_INTERNODE_CACHE_SHIFT=6
CONFIG_X86_L1_CACHE_SHIFT=6
CONFIG_X86_TSC=y
CONFIG_X86_CMPXCHG64=y
CONFIG_X86_CMOV=y
CONFIG_X86_MINIMUM_CPU_FAMILY=64
CONFIG_X86_DEBUGCTLMSR=y
# CONFIG_PROCESSOR_SELECT is not set
CONFIG_CPU_SUP_INTEL=y
CONFIG_CPU_SUP_AMD=y
CONFIG_CPU_SUP_HYGON=y
CONFIG_CPU_SUP_CENTAUR=y
CONFIG_CPU_SUP_ZHAOXIN=y
CONFIG_HPET_TIMER=y
CONFIG_HPET_EMULATE_RTC=y
CONFIG_DMI=y
CONFIG_GART_IOMMU=y
# CONFIG_CALGARY_IOMMU is not set
CONFIG_MAXSMP=y
CONFIG_NR_CPUS_RANGE_BEGIN=8192
CONFIG_NR_CPUS_RANGE_END=8192
CONFIG_NR_CPUS_DEFAULT=8192
CONFIG_NR_CPUS=8192
CONFIG_SCHED_SMT=y
CONFIG_SCHED_MC=y
CONFIG_SCHED_MC_PRIO=y
CONFIG_X86_LOCAL_APIC=y
CONFIG_X86_IO_APIC=y
CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS=y
CONFIG_X86_MCE=y
CONFIG_X86_MCELOG_LEGACY=y
CONFIG_X86_MCE_INTEL=y
CONFIG_X86_MCE_AMD=y
CONFIG_X86_MCE_THRESHOLD=y
CONFIG_X86_MCE_INJECT=m
CONFIG_X86_THERMAL_VECTOR=y

#
# Performance monitoring
#
CONFIG_PERF_EVENTS_INTEL_UNCORE=y
CONFIG_PERF_EVENTS_INTEL_RAPL=y
CONFIG_PERF_EVENTS_INTEL_CSTATE=y
# CONFIG_PERF_EVENTS_AMD_POWER is not set
# end of Performance monitoring

CONFIG_X86_16BIT=y
CONFIG_X86_ESPFIX64=y
CONFIG_X86_VSYSCALL_EMULATION=y
CONFIG_I8K=m
CONFIG_MICROCODE=y
CONFIG_MICROCODE_INTEL=y
CONFIG_MICROCODE_AMD=y
CONFIG_MICROCODE_OLD_INTERFACE=y
CONFIG_X86_MSR=y
CONFIG_X86_CPUID=y
CONFIG_X86_5LEVEL=y
CONFIG_X86_DIRECT_GBPAGES=y
# CONFIG_X86_CPA_STATISTICS is not set
CONFIG_AMD_MEM_ENCRYPT=y
# CONFIG_AMD_MEM_ENCRYPT_ACTIVE_BY_DEFAULT is not set
CONFIG_NUMA=y
CONFIG_AMD_NUMA=y
CONFIG_X86_64_ACPI_NUMA=y
CONFIG_NODES_SPAN_OTHER_NODES=y
# CONFIG_NUMA_EMU is not set
CONFIG_NODES_SHIFT=10
CONFIG_ARCH_SPARSEMEM_ENABLE=y
CONFIG_ARCH_SPARSEMEM_DEFAULT=y
CONFIG_ARCH_SELECT_MEMORY_MODEL=y
CONFIG_ARCH_MEMORY_PROBE=y
CONFIG_ARCH_PROC_KCORE_TEXT=y
CONFIG_ILLEGAL_POINTER_VALUE=0xdead000000000000
CONFIG_X86_PMEM_LEGACY_DEVICE=y
CONFIG_X86_PMEM_LEGACY=m
CONFIG_X86_CHECK_BIOS_CORRUPTION=y
# CONFIG_X86_BOOTPARAM_MEMORY_CORRUPTION_CHECK is not set
CONFIG_X86_RESERVE_LOW=64
CONFIG_MTRR=y
CONFIG_MTRR_SANITIZER=y
CONFIG_MTRR_SANITIZER_ENABLE_DEFAULT=1
CONFIG_MTRR_SANITIZER_SPARE_REG_NR_DEFAULT=1
CONFIG_X86_PAT=y
CONFIG_ARCH_USES_PG_UNCACHED=y
CONFIG_ARCH_RANDOM=y
CONFIG_X86_SMAP=y
CONFIG_X86_INTEL_UMIP=y
CONFIG_X86_INTEL_MPX=y
CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS=y
CONFIG_EFI=y
CONFIG_EFI_STUB=y
CONFIG_EFI_MIXED=y
CONFIG_SECCOMP=y
# CONFIG_HZ_100 is not set
# CONFIG_HZ_250 is not set
# CONFIG_HZ_300 is not set
CONFIG_HZ_1000=y
CONFIG_HZ=1000
CONFIG_SCHED_HRTICK=y
CONFIG_KEXEC=y
CONFIG_KEXEC_FILE=y
CONFIG_ARCH_HAS_KEXEC_PURGATORY=y
# CONFIG_KEXEC_SIG is not set
CONFIG_CRASH_DUMP=y
CONFIG_KEXEC_JUMP=y
CONFIG_PHYSICAL_START=0x1000000
CONFIG_RELOCATABLE=y
CONFIG_RANDOMIZE_BASE=y
CONFIG_X86_NEED_RELOCS=y
CONFIG_PHYSICAL_ALIGN=0x200000
CONFIG_DYNAMIC_MEMORY_LAYOUT=y
CONFIG_RANDOMIZE_MEMORY=y
CONFIG_RANDOMIZE_MEMORY_PHYSICAL_PADDING=0xa
CONFIG_HOTPLUG_CPU=y
CONFIG_BOOTPARAM_HOTPLUG_CPU0=y
# CONFIG_DEBUG_HOTPLUG_CPU0 is not set
# CONFIG_COMPAT_VDSO is not set
CONFIG_LEGACY_VSYSCALL_EMULATE=y
# CONFIG_LEGACY_VSYSCALL_XONLY is not set
# CONFIG_LEGACY_VSYSCALL_NONE is not set
# CONFIG_CMDLINE_BOOL is not set
CONFIG_MODIFY_LDT_SYSCALL=y
CONFIG_HAVE_LIVEPATCH=y
CONFIG_LIVEPATCH=y
# end of Processor type and features

CONFIG_ARCH_HAS_ADD_PAGES=y
CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=y
CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE=y
CONFIG_USE_PERCPU_NUMA_NODE_ID=y
CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=y
CONFIG_ARCH_ENABLE_HUGEPAGE_MIGRATION=y
CONFIG_ARCH_ENABLE_THP_MIGRATION=y

#
# Power management and ACPI options
#
CONFIG_ARCH_HIBERNATION_HEADER=y
CONFIG_SUSPEND=y
CONFIG_SUSPEND_FREEZER=y
# CONFIG_SUSPEND_SKIP_SYNC is not set
CONFIG_HIBERNATE_CALLBACKS=y
CONFIG_HIBERNATION=y
CONFIG_PM_STD_PARTITION=""
CONFIG_PM_SLEEP=y
CONFIG_PM_SLEEP_SMP=y
# CONFIG_PM_AUTOSLEEP is not set
# CONFIG_PM_WAKELOCKS is not set
CONFIG_PM=y
CONFIG_PM_DEBUG=y
CONFIG_PM_ADVANCED_DEBUG=y
# CONFIG_PM_TEST_SUSPEND is not set
CONFIG_PM_SLEEP_DEBUG=y
# CONFIG_DPM_WATCHDOG is not set
CONFIG_PM_TRACE=y
CONFIG_PM_TRACE_RTC=y
CONFIG_PM_CLK=y
# CONFIG_WQ_POWER_EFFICIENT_DEFAULT is not set
# CONFIG_ENERGY_MODEL is not set
CONFIG_ARCH_SUPPORTS_ACPI=y
CONFIG_ACPI=y
CONFIG_ACPI_LEGACY_TABLES_LOOKUP=y
CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=y
CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=y
# CONFIG_ACPI_DEBUGGER is not set
CONFIG_ACPI_SPCR_TABLE=y
CONFIG_ACPI_LPIT=y
CONFIG_ACPI_SLEEP=y
# CONFIG_ACPI_PROCFS_POWER is not set
CONFIG_ACPI_REV_OVERRIDE_POSSIBLE=y
CONFIG_ACPI_EC_DEBUGFS=m
CONFIG_ACPI_AC=y
CONFIG_ACPI_BATTERY=y
CONFIG_ACPI_BUTTON=y
CONFIG_ACPI_VIDEO=m
CONFIG_ACPI_FAN=y
# CONFIG_ACPI_TAD is not set
CONFIG_ACPI_DOCK=y
CONFIG_ACPI_CPU_FREQ_PSS=y
CONFIG_ACPI_PROCESSOR_CSTATE=y
CONFIG_ACPI_PROCESSOR_IDLE=y
CONFIG_ACPI_CPPC_LIB=y
CONFIG_ACPI_PROCESSOR=y
CONFIG_ACPI_IPMI=m
CONFIG_ACPI_HOTPLUG_CPU=y
CONFIG_ACPI_PROCESSOR_AGGREGATOR=m
CONFIG_ACPI_THERMAL=y
CONFIG_ACPI_NUMA=y
CONFIG_ARCH_HAS_ACPI_TABLE_UPGRADE=y
CONFIG_ACPI_TABLE_UPGRADE=y
# CONFIG_ACPI_DEBUG is not set
CONFIG_ACPI_PCI_SLOT=y
CONFIG_ACPI_CONTAINER=y
CONFIG_ACPI_HOTPLUG_MEMORY=y
CONFIG_ACPI_HOTPLUG_IOAPIC=y
CONFIG_ACPI_SBS=m
CONFIG_ACPI_HED=y
CONFIG_ACPI_CUSTOM_METHOD=m
CONFIG_ACPI_BGRT=y
# CONFIG_ACPI_REDUCED_HARDWARE_ONLY is not set
CONFIG_ACPI_NFIT=m
# CONFIG_NFIT_SECURITY_DEBUG is not set
# CONFIG_ACPI_HMAT is not set
CONFIG_HAVE_ACPI_APEI=y
CONFIG_HAVE_ACPI_APEI_NMI=y
CONFIG_ACPI_APEI=y
CONFIG_ACPI_APEI_GHES=y
CONFIG_ACPI_APEI_PCIEAER=y
CONFIG_ACPI_APEI_MEMORY_FAILURE=y
CONFIG_ACPI_APEI_EINJ=m
CONFIG_ACPI_APEI_ERST_DEBUG=y
# CONFIG_DPTF_POWER is not set
CONFIG_ACPI_WATCHDOG=y
CONFIG_ACPI_EXTLOG=m
CONFIG_ACPI_ADXL=y
# CONFIG_PMIC_OPREGION is not set
# CONFIG_ACPI_CONFIGFS is not set
CONFIG_X86_PM_TIMER=y
CONFIG_SFI=y

#
# CPU Frequency scaling
#
CONFIG_CPU_FREQ=y
CONFIG_CPU_FREQ_GOV_ATTR_SET=y
CONFIG_CPU_FREQ_GOV_COMMON=y
# CONFIG_CPU_FREQ_STAT is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND=y
# CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL is not set
CONFIG_CPU_FREQ_GOV_PERFORMANCE=y
CONFIG_CPU_FREQ_GOV_POWERSAVE=y
CONFIG_CPU_FREQ_GOV_USERSPACE=y
CONFIG_CPU_FREQ_GOV_ONDEMAND=y
CONFIG_CPU_FREQ_GOV_CONSERVATIVE=y
# CONFIG_CPU_FREQ_GOV_SCHEDUTIL is not set

#
# CPU frequency scaling drivers
#
CONFIG_X86_INTEL_PSTATE=y
CONFIG_X86_PCC_CPUFREQ=m
CONFIG_X86_ACPI_CPUFREQ=m
CONFIG_X86_ACPI_CPUFREQ_CPB=y
CONFIG_X86_POWERNOW_K8=m
CONFIG_X86_AMD_FREQ_SENSITIVITY=m
# CONFIG_X86_SPEEDSTEP_CENTRINO is not set
CONFIG_X86_P4_CLOCKMOD=m

#
# shared options
#
CONFIG_X86_SPEEDSTEP_LIB=m
# end of CPU Frequency scaling

#
# CPU Idle
#
CONFIG_CPU_IDLE=y
# CONFIG_CPU_IDLE_GOV_LADDER is not set
CONFIG_CPU_IDLE_GOV_MENU=y
# CONFIG_CPU_IDLE_GOV_TEO is not set
# CONFIG_CPU_IDLE_GOV_HALTPOLL is not set
CONFIG_HALTPOLL_CPUIDLE=y
# end of CPU Idle

CONFIG_INTEL_IDLE=y
# end of Power management and ACPI options

#
# Bus options (PCI etc.)
#
CONFIG_PCI_DIRECT=y
CONFIG_PCI_MMCONFIG=y
CONFIG_PCI_XEN=y
CONFIG_MMCONF_FAM10H=y
# CONFIG_PCI_CNB20LE_QUIRK is not set
# CONFIG_ISA_BUS is not set
CONFIG_ISA_DMA_API=y
CONFIG_AMD_NB=y
# CONFIG_X86_SYSFB is not set
# end of Bus options (PCI etc.)

#
# Binary Emulations
#
CONFIG_IA32_EMULATION=y
# CONFIG_X86_X32 is not set
CONFIG_COMPAT_32=y
CONFIG_COMPAT=y
CONFIG_COMPAT_FOR_U64_ALIGNMENT=y
CONFIG_SYSVIPC_COMPAT=y
# end of Binary Emulations

CONFIG_X86_DEV_DMA_OPS=y

#
# Firmware Drivers
#
CONFIG_EDD=m
# CONFIG_EDD_OFF is not set
CONFIG_FIRMWARE_MEMMAP=y
CONFIG_DMIID=y
CONFIG_DMI_SYSFS=y
CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBACK=y
CONFIG_ISCSI_IBFT_FIND=y
CONFIG_ISCSI_IBFT=m
CONFIG_FW_CFG_SYSFS=y
# CONFIG_FW_CFG_SYSFS_CMDLINE is not set
# CONFIG_GOOGLE_FIRMWARE is not set

#
# EFI (Extensible Firmware Interface) Support
#
CONFIG_EFI_VARS=y
CONFIG_EFI_ESRT=y
CONFIG_EFI_VARS_PSTORE=y
CONFIG_EFI_VARS_PSTORE_DEFAULT_DISABLE=y
CONFIG_EFI_RUNTIME_MAP=y
# CONFIG_EFI_FAKE_MEMMAP is not set
CONFIG_EFI_RUNTIME_WRAPPERS=y
# CONFIG_EFI_BOOTLOADER_CONTROL is not set
# CONFIG_EFI_CAPSULE_LOADER is not set
# CONFIG_EFI_TEST is not set
CONFIG_APPLE_PROPERTIES=y
# CONFIG_RESET_ATTACK_MITIGATION is not set
# CONFIG_EFI_RCI2_TABLE is not set
# end of EFI (Extensible Firmware Interface) Support

CONFIG_UEFI_CPER=y
CONFIG_UEFI_CPER_X86=y
CONFIG_EFI_DEV_PATH_PARSER=y
CONFIG_EFI_EARLYCON=y

#
# Tegra firmware driver
#
# end of Tegra firmware driver
# end of Firmware Drivers

CONFIG_HAVE_KVM=y
CONFIG_HAVE_KVM_IRQCHIP=y
CONFIG_HAVE_KVM_IRQFD=y
CONFIG_HAVE_KVM_IRQ_ROUTING=y
CONFIG_HAVE_KVM_EVENTFD=y
CONFIG_KVM_MMIO=y
CONFIG_KVM_ASYNC_PF=y
CONFIG_HAVE_KVM_MSI=y
CONFIG_HAVE_KVM_CPU_RELAX_INTERCEPT=y
CONFIG_KVM_VFIO=y
CONFIG_KVM_GENERIC_DIRTYLOG_READ_PROTECT=y
CONFIG_KVM_COMPAT=y
CONFIG_HAVE_KVM_IRQ_BYPASS=y
CONFIG_HAVE_KVM_NO_POLL=y
CONFIG_VIRTUALIZATION=y
CONFIG_KVM=m
CONFIG_KVM_INTEL=m
CONFIG_KVM_AMD=m
CONFIG_KVM_AMD_SEV=y
CONFIG_KVM_MMU_AUDIT=y
CONFIG_VHOST_NET=m
# CONFIG_VHOST_SCSI is not set
CONFIG_VHOST_VSOCK=m
CONFIG_VHOST=m
# CONFIG_VHOST_CROSS_ENDIAN_LEGACY is not set

#
# General architecture-dependent options
#
CONFIG_CRASH_CORE=y
CONFIG_KEXEC_CORE=y
CONFIG_HOTPLUG_SMT=y
CONFIG_OPROFILE=m
CONFIG_OPROFILE_EVENT_MULTIPLEX=y
CONFIG_HAVE_OPROFILE=y
CONFIG_OPROFILE_NMI_TIMER=y
CONFIG_KPROBES=y
CONFIG_JUMP_LABEL=y
# CONFIG_STATIC_KEYS_SELFTEST is not set
CONFIG_OPTPROBES=y
CONFIG_KPROBES_ON_FTRACE=y
CONFIG_UPROBES=y
CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=y
CONFIG_ARCH_USE_BUILTIN_BSWAP=y
CONFIG_KRETPROBES=y
CONFIG_USER_RETURN_NOTIFIER=y
CONFIG_HAVE_IOREMAP_PROT=y
CONFIG_HAVE_KPROBES=y
CONFIG_HAVE_KRETPROBES=y
CONFIG_HAVE_OPTPROBES=y
CONFIG_HAVE_KPROBES_ON_FTRACE=y
CONFIG_HAVE_FUNCTION_ERROR_INJECTION=y
CONFIG_HAVE_NMI=y
CONFIG_HAVE_ARCH_TRACEHOOK=y
CONFIG_HAVE_DMA_CONTIGUOUS=y
CONFIG_GENERIC_SMP_IDLE_THREAD=y
CONFIG_ARCH_HAS_FORTIFY_SOURCE=y
CONFIG_ARCH_HAS_SET_MEMORY=y
CONFIG_ARCH_HAS_SET_DIRECT_MAP=y
CONFIG_HAVE_ARCH_THREAD_STRUCT_WHITELIST=y
CONFIG_ARCH_WANTS_DYNAMIC_TASK_STRUCT=y
CONFIG_HAVE_ASM_MODVERSIONS=y
CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
CONFIG_HAVE_RSEQ=y
CONFIG_HAVE_FUNCTION_ARG_ACCESS_API=y
CONFIG_HAVE_CLK=y
CONFIG_HAVE_HW_BREAKPOINT=y
CONFIG_HAVE_MIXED_BREAKPOINTS_REGS=y
CONFIG_HAVE_USER_RETURN_NOTIFIER=y
CONFIG_HAVE_PERF_EVENTS_NMI=y
CONFIG_HAVE_HARDLOCKUP_DETECTOR_PERF=y
CONFIG_HAVE_PERF_REGS=y
CONFIG_HAVE_PERF_USER_STACK_DUMP=y
CONFIG_HAVE_ARCH_JUMP_LABEL=y
CONFIG_HAVE_ARCH_JUMP_LABEL_RELATIVE=y
CONFIG_HAVE_RCU_TABLE_FREE=y
CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=y
CONFIG_HAVE_ALIGNED_STRUCT_PAGE=y
CONFIG_HAVE_CMPXCHG_LOCAL=y
CONFIG_HAVE_CMPXCHG_DOUBLE=y
CONFIG_ARCH_WANT_COMPAT_IPC_PARSE_VERSION=y
CONFIG_ARCH_WANT_OLD_COMPAT_IPC=y
CONFIG_HAVE_ARCH_SECCOMP_FILTER=y
CONFIG_SECCOMP_FILTER=y
CONFIG_HAVE_ARCH_STACKLEAK=y
CONFIG_HAVE_STACKPROTECTOR=y
CONFIG_CC_HAS_STACKPROTECTOR_NONE=y
CONFIG_STACKPROTECTOR=y
CONFIG_STACKPROTECTOR_STRONG=y
CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES=y
CONFIG_HAVE_CONTEXT_TRACKING=y
CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=y
CONFIG_HAVE_IRQ_TIME_ACCOUNTING=y
CONFIG_HAVE_MOVE_PMD=y
CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=y
CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD=y
CONFIG_HAVE_ARCH_HUGE_VMAP=y
CONFIG_ARCH_WANT_HUGE_PMD_SHARE=y
CONFIG_HAVE_ARCH_SOFT_DIRTY=y
CONFIG_HAVE_MOD_ARCH_SPECIFIC=y
CONFIG_MODULES_USE_ELF_RELA=y
CONFIG_HAVE_IRQ_EXIT_ON_IRQ_STACK=y
CONFIG_ARCH_HAS_ELF_RANDOMIZE=y
CONFIG_HAVE_ARCH_MMAP_RND_BITS=y
CONFIG_HAVE_EXIT_THREAD=y
CONFIG_ARCH_MMAP_RND_BITS=28
CONFIG_HAVE_ARCH_MMAP_RND_COMPAT_BITS=y
CONFIG_ARCH_MMAP_RND_COMPAT_BITS=8
CONFIG_HAVE_ARCH_COMPAT_MMAP_BASES=y
CONFIG_HAVE_COPY_THREAD_TLS=y
CONFIG_HAVE_STACK_VALIDATION=y
CONFIG_HAVE_RELIABLE_STACKTRACE=y
CONFIG_OLD_SIGSUSPEND3=y
CONFIG_COMPAT_OLD_SIGACTION=y
CONFIG_64BIT_TIME=y
CONFIG_COMPAT_32BIT_TIME=y
CONFIG_HAVE_ARCH_VMAP_STACK=y
CONFIG_VMAP_STACK=y
CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=y
CONFIG_STRICT_KERNEL_RWX=y
CONFIG_ARCH_HAS_STRICT_MODULE_RWX=y
CONFIG_STRICT_MODULE_RWX=y
CONFIG_ARCH_HAS_REFCOUNT=y
# CONFIG_REFCOUNT_FULL is not set
CONFIG_HAVE_ARCH_PREL32_RELOCATIONS=y
CONFIG_ARCH_USE_MEMREMAP_PROT=y
# CONFIG_LOCK_EVENT_COUNTS is not set
CONFIG_ARCH_HAS_MEM_ENCRYPT=y

#
# GCOV-based kernel profiling
#
# CONFIG_GCOV_KERNEL is not set
CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=y
# end of GCOV-based kernel profiling

CONFIG_PLUGIN_HOSTCC="g++"
CONFIG_HAVE_GCC_PLUGINS=y
CONFIG_GCC_PLUGINS=y

#
# GCC plugins
#
# CONFIG_GCC_PLUGIN_CYC_COMPLEXITY is not set
# CONFIG_GCC_PLUGIN_LATENT_ENTROPY is not set
# CONFIG_GCC_PLUGIN_RANDSTRUCT is not set
# end of GCC plugins
# end of General architecture-dependent options

CONFIG_RT_MUTEXES=y
CONFIG_BASE_SMALL=0
CONFIG_MODULE_SIG_FORMAT=y
CONFIG_MODULES=y
CONFIG_MODULE_FORCE_LOAD=y
CONFIG_MODULE_UNLOAD=y
# CONFIG_MODULE_FORCE_UNLOAD is not set
# CONFIG_MODVERSIONS is not set
# CONFIG_MODULE_SRCVERSION_ALL is not set
CONFIG_MODULE_SIG=y
# CONFIG_MODULE_SIG_FORCE is not set
CONFIG_MODULE_SIG_ALL=y
# CONFIG_MODULE_SIG_SHA1 is not set
# CONFIG_MODULE_SIG_SHA224 is not set
CONFIG_MODULE_SIG_SHA256=y
# CONFIG_MODULE_SIG_SHA384 is not set
# CONFIG_MODULE_SIG_SHA512 is not set
CONFIG_MODULE_SIG_HASH="sha256"
# CONFIG_MODULE_COMPRESS is not set
# CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS is not set
# CONFIG_UNUSED_SYMBOLS is not set
# CONFIG_TRIM_UNUSED_KSYMS is not set
CONFIG_MODULES_TREE_LOOKUP=y
CONFIG_BLOCK=y
CONFIG_BLK_SCSI_REQUEST=y
CONFIG_BLK_DEV_BSG=y
CONFIG_BLK_DEV_BSGLIB=y
CONFIG_BLK_DEV_INTEGRITY=y
CONFIG_BLK_DEV_ZONED=y
CONFIG_BLK_DEV_THROTTLING=y
# CONFIG_BLK_DEV_THROTTLING_LOW is not set
# CONFIG_BLK_CMDLINE_PARSER is not set
# CONFIG_BLK_WBT is not set
# CONFIG_BLK_CGROUP_IOLATENCY is not set
# CONFIG_BLK_CGROUP_IOCOST is not set
CONFIG_BLK_DEBUG_FS=y
CONFIG_BLK_DEBUG_FS_ZONED=y
# CONFIG_BLK_SED_OPAL is not set

#
# Partition Types
#
CONFIG_PARTITION_ADVANCED=y
# CONFIG_ACORN_PARTITION is not set
# CONFIG_AIX_PARTITION is not set
CONFIG_OSF_PARTITION=y
CONFIG_AMIGA_PARTITION=y
# CONFIG_ATARI_PARTITION is not set
CONFIG_MAC_PARTITION=y
CONFIG_MSDOS_PARTITION=y
CONFIG_BSD_DISKLABEL=y
CONFIG_MINIX_SUBPARTITION=y
CONFIG_SOLARIS_X86_PARTITION=y
CONFIG_UNIXWARE_DISKLABEL=y
# CONFIG_LDM_PARTITION is not set
CONFIG_SGI_PARTITION=y
# CONFIG_ULTRIX_PARTITION is not set
CONFIG_SUN_PARTITION=y
CONFIG_KARMA_PARTITION=y
CONFIG_EFI_PARTITION=y
# CONFIG_SYSV68_PARTITION is not set
# CONFIG_CMDLINE_PARTITION is not set
# end of Partition Types

CONFIG_BLOCK_COMPAT=y
CONFIG_BLK_MQ_PCI=y
CONFIG_BLK_MQ_VIRTIO=y
CONFIG_BLK_PM=y

#
# IO Schedulers
#
CONFIG_MQ_IOSCHED_DEADLINE=y
CONFIG_MQ_IOSCHED_KYBER=y
# CONFIG_IOSCHED_BFQ is not set
# end of IO Schedulers

CONFIG_PREEMPT_NOTIFIERS=y
CONFIG_PADATA=y
CONFIG_ASN1=y
CONFIG_INLINE_SPIN_UNLOCK_IRQ=y
CONFIG_INLINE_READ_UNLOCK=y
CONFIG_INLINE_READ_UNLOCK_IRQ=y
CONFIG_INLINE_WRITE_UNLOCK=y
CONFIG_INLINE_WRITE_UNLOCK_IRQ=y
CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=y
CONFIG_MUTEX_SPIN_ON_OWNER=y
CONFIG_RWSEM_SPIN_ON_OWNER=y
CONFIG_LOCK_SPIN_ON_OWNER=y
CONFIG_ARCH_USE_QUEUED_SPINLOCKS=y
CONFIG_QUEUED_SPINLOCKS=y
CONFIG_ARCH_USE_QUEUED_RWLOCKS=y
CONFIG_QUEUED_RWLOCKS=y
CONFIG_ARCH_HAS_SYNC_CORE_BEFORE_USERMODE=y
CONFIG_ARCH_HAS_SYSCALL_WRAPPER=y
CONFIG_FREEZER=y

#
# Executable file formats
#
CONFIG_BINFMT_ELF=y
CONFIG_COMPAT_BINFMT_ELF=y
CONFIG_ELFCORE=y
CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS=y
CONFIG_BINFMT_SCRIPT=y
CONFIG_BINFMT_MISC=m
CONFIG_COREDUMP=y
# end of Executable file formats

#
# Memory Management options
#
CONFIG_SELECT_MEMORY_MODEL=y
CONFIG_SPARSEMEM_MANUAL=y
CONFIG_SPARSEMEM=y
CONFIG_NEED_MULTIPLE_NODES=y
CONFIG_HAVE_MEMORY_PRESENT=y
CONFIG_SPARSEMEM_EXTREME=y
CONFIG_SPARSEMEM_VMEMMAP_ENABLE=y
CONFIG_SPARSEMEM_VMEMMAP=y
CONFIG_HAVE_MEMBLOCK_NODE_MAP=y
CONFIG_HAVE_FAST_GUP=y
CONFIG_MEMORY_ISOLATION=y
CONFIG_HAVE_BOOTMEM_INFO_NODE=y
CONFIG_MEMORY_HOTPLUG=y
CONFIG_MEMORY_HOTPLUG_SPARSE=y
# CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE is not set
CONFIG_MEMORY_HOTREMOVE=y
CONFIG_SPLIT_PTLOCK_CPUS=4
CONFIG_MEMORY_BALLOON=y
CONFIG_BALLOON_COMPACTION=y
CONFIG_COMPACTION=y
CONFIG_MIGRATION=y
CONFIG_CONTIG_ALLOC=y
CONFIG_PHYS_ADDR_T_64BIT=y
CONFIG_BOUNCE=y
CONFIG_VIRT_TO_BUS=y
CONFIG_MMU_NOTIFIER=y
CONFIG_KSM=y
CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
CONFIG_ARCH_SUPPORTS_MEMORY_FAILURE=y
CONFIG_MEMORY_FAILURE=y
CONFIG_HWPOISON_INJECT=m
CONFIG_TRANSPARENT_HUGEPAGE=y
CONFIG_TRANSPARENT_HUGEPAGE_ALWAYS=y
# CONFIG_TRANSPARENT_HUGEPAGE_MADVISE is not set
CONFIG_ARCH_WANTS_THP_SWAP=y
CONFIG_THP_SWAP=y
CONFIG_TRANSPARENT_HUGE_PAGECACHE=y
CONFIG_CLEANCACHE=y
CONFIG_FRONTSWAP=y
CONFIG_CMA=y
# CONFIG_CMA_DEBUG is not set
# CONFIG_CMA_DEBUGFS is not set
CONFIG_CMA_AREAS=7
CONFIG_MEM_SOFT_DIRTY=y
CONFIG_ZSWAP=y
CONFIG_ZPOOL=y
CONFIG_ZBUD=y
# CONFIG_Z3FOLD is not set
CONFIG_ZSMALLOC=y
# CONFIG_PGTABLE_MAPPING is not set
# CONFIG_ZSMALLOC_STAT is not set
CONFIG_GENERIC_EARLY_IOREMAP=y
CONFIG_DEFERRED_STRUCT_PAGE_INIT=y
CONFIG_IDLE_PAGE_TRACKING=y
CONFIG_ARCH_HAS_PTE_DEVMAP=y
CONFIG_ZONE_DEVICE=y
CONFIG_DEV_PAGEMAP_OPS=y
# CONFIG_DEVICE_PRIVATE is not set
CONFIG_FRAME_VECTOR=y
CONFIG_ARCH_USES_HIGH_VMA_FLAGS=y
CONFIG_ARCH_HAS_PKEYS=y
# CONFIG_PERCPU_STATS is not set
# CONFIG_GUP_BENCHMARK is not set
# CONFIG_READ_ONLY_THP_FOR_FS is not set
CONFIG_ARCH_HAS_PTE_SPECIAL=y
# end of Memory Management options

CONFIG_NET=y
CONFIG_COMPAT_NETLINK_MESSAGES=y
CONFIG_NET_INGRESS=y
CONFIG_NET_EGRESS=y
CONFIG_SKB_EXTENSIONS=y

#
# Networking options
#
CONFIG_PACKET=y
CONFIG_PACKET_DIAG=m
CONFIG_UNIX=y
CONFIG_UNIX_SCM=y
CONFIG_UNIX_DIAG=m
# CONFIG_TLS is not set
CONFIG_XFRM=y
CONFIG_XFRM_ALGO=y
CONFIG_XFRM_USER=y
# CONFIG_XFRM_INTERFACE is not set
CONFIG_XFRM_SUB_POLICY=y
CONFIG_XFRM_MIGRATE=y
CONFIG_XFRM_STATISTICS=y
CONFIG_XFRM_IPCOMP=m
CONFIG_NET_KEY=m
CONFIG_NET_KEY_MIGRATE=y
# CONFIG_XDP_SOCKETS is not set
CONFIG_INET=y
CONFIG_IP_MULTICAST=y
CONFIG_IP_ADVANCED_ROUTER=y
CONFIG_IP_FIB_TRIE_STATS=y
CONFIG_IP_MULTIPLE_TABLES=y
CONFIG_IP_ROUTE_MULTIPATH=y
CONFIG_IP_ROUTE_VERBOSE=y
CONFIG_IP_ROUTE_CLASSID=y
CONFIG_IP_PNP=y
CONFIG_IP_PNP_DHCP=y
# CONFIG_IP_PNP_BOOTP is not set
# CONFIG_IP_PNP_RARP is not set
CONFIG_NET_IPIP=m
CONFIG_NET_IPGRE_DEMUX=m
CONFIG_NET_IP_TUNNEL=m
CONFIG_NET_IPGRE=m
CONFIG_NET_IPGRE_BROADCAST=y
CONFIG_IP_MROUTE_COMMON=y
CONFIG_IP_MROUTE=y
CONFIG_IP_MROUTE_MULTIPLE_TABLES=y
CONFIG_IP_PIMSM_V1=y
CONFIG_IP_PIMSM_V2=y
CONFIG_SYN_COOKIES=y
CONFIG_NET_IPVTI=m
CONFIG_NET_UDP_TUNNEL=m
CONFIG_NET_FOU=m
CONFIG_NET_FOU_IP_TUNNELS=y
CONFIG_INET_AH=m
CONFIG_INET_ESP=m
# CONFIG_INET_ESP_OFFLOAD is not set
CONFIG_INET_IPCOMP=m
CONFIG_INET_XFRM_TUNNEL=m
CONFIG_INET_TUNNEL=m
CONFIG_INET_DIAG=m
CONFIG_INET_TCP_DIAG=m
CONFIG_INET_UDP_DIAG=m
# CONFIG_INET_RAW_DIAG is not set
# CONFIG_INET_DIAG_DESTROY is not set
CONFIG_TCP_CONG_ADVANCED=y
CONFIG_TCP_CONG_BIC=m
CONFIG_TCP_CONG_CUBIC=y
CONFIG_TCP_CONG_WESTWOOD=m
CONFIG_TCP_CONG_HTCP=m
CONFIG_TCP_CONG_HSTCP=m
CONFIG_TCP_CONG_HYBLA=m
CONFIG_TCP_CONG_VEGAS=m
# CONFIG_TCP_CONG_NV is not set
CONFIG_TCP_CONG_SCALABLE=m
CONFIG_TCP_CONG_LP=m
CONFIG_TCP_CONG_VENO=m
CONFIG_TCP_CONG_YEAH=m
CONFIG_TCP_CONG_ILLINOIS=m
CONFIG_TCP_CONG_DCTCP=m
# CONFIG_TCP_CONG_CDG is not set
# CONFIG_TCP_CONG_BBR is not set
CONFIG_DEFAULT_CUBIC=y
# CONFIG_DEFAULT_RENO is not set
CONFIG_DEFAULT_TCP_CONG="cubic"
CONFIG_TCP_MD5SIG=y
CONFIG_IPV6=y
CONFIG_IPV6_ROUTER_PREF=y
CONFIG_IPV6_ROUTE_INFO=y
CONFIG_IPV6_OPTIMISTIC_DAD=y
CONFIG_INET6_AH=m
CONFIG_INET6_ESP=m
# CONFIG_INET6_ESP_OFFLOAD is not set
CONFIG_INET6_IPCOMP=m
CONFIG_IPV6_MIP6=m
# CONFIG_IPV6_ILA is not set
CONFIG_INET6_XFRM_TUNNEL=m
CONFIG_INET6_TUNNEL=m
CONFIG_IPV6_VTI=m
CONFIG_IPV6_SIT=m
CONFIG_IPV6_SIT_6RD=y
CONFIG_IPV6_NDISC_NODETYPE=y
CONFIG_IPV6_TUNNEL=m
CONFIG_IPV6_GRE=m
CONFIG_IPV6_FOU=m
CONFIG_IPV6_FOU_TUNNEL=m
CONFIG_IPV6_MULTIPLE_TABLES=y
# CONFIG_IPV6_SUBTREES is not set
CONFIG_IPV6_MROUTE=y
CONFIG_IPV6_MROUTE_MULTIPLE_TABLES=y
CONFIG_IPV6_PIMSM_V2=y
CONFIG_IPV6_SEG6_LWTUNNEL=y
# CONFIG_IPV6_SEG6_HMAC is not set
CONFIG_IPV6_SEG6_BPF=y
CONFIG_NETLABEL=y
CONFIG_NETWORK_SECMARK=y
CONFIG_NET_PTP_CLASSIFY=y
CONFIG_NETWORK_PHY_TIMESTAMPING=y
CONFIG_NETFILTER=y
CONFIG_NETFILTER_ADVANCED=y
CONFIG_BRIDGE_NETFILTER=m

#
# Core Netfilter Configuration
#
CONFIG_NETFILTER_INGRESS=y
CONFIG_NETFILTER_NETLINK=m
CONFIG_NETFILTER_FAMILY_BRIDGE=y
CONFIG_NETFILTER_FAMILY_ARP=y
CONFIG_NETFILTER_NETLINK_ACCT=m
CONFIG_NETFILTER_NETLINK_QUEUE=m
CONFIG_NETFILTER_NETLINK_LOG=m
CONFIG_NETFILTER_NETLINK_OSF=m
CONFIG_NF_CONNTRACK=m
CONFIG_NF_LOG_COMMON=m
# CONFIG_NF_LOG_NETDEV is not set
CONFIG_NETFILTER_CONNCOUNT=m
CONFIG_NF_CONNTRACK_MARK=y
CONFIG_NF_CONNTRACK_SECMARK=y
CONFIG_NF_CONNTRACK_ZONES=y
CONFIG_NF_CONNTRACK_PROCFS=y
CONFIG_NF_CONNTRACK_EVENTS=y
CONFIG_NF_CONNTRACK_TIMEOUT=y
CONFIG_NF_CONNTRACK_TIMESTAMP=y
CONFIG_NF_CONNTRACK_LABELS=y
CONFIG_NF_CT_PROTO_DCCP=y
CONFIG_NF_CT_PROTO_GRE=y
CONFIG_NF_CT_PROTO_SCTP=y
CONFIG_NF_CT_PROTO_UDPLITE=y
CONFIG_NF_CONNTRACK_AMANDA=m
CONFIG_NF_CONNTRACK_FTP=m
CONFIG_NF_CONNTRACK_H323=m
CONFIG_NF_CONNTRACK_IRC=m
CONFIG_NF_CONNTRACK_BROADCAST=m
CONFIG_NF_CONNTRACK_NETBIOS_NS=m
CONFIG_NF_CONNTRACK_SNMP=m
CONFIG_NF_CONNTRACK_PPTP=m
CONFIG_NF_CONNTRACK_SANE=m
CONFIG_NF_CONNTRACK_SIP=m
CONFIG_NF_CONNTRACK_TFTP=m
CONFIG_NF_CT_NETLINK=m
CONFIG_NF_CT_NETLINK_TIMEOUT=m
# CONFIG_NETFILTER_NETLINK_GLUE_CT is not set
CONFIG_NF_NAT=m
CONFIG_NF_NAT_AMANDA=m
CONFIG_NF_NAT_FTP=m
CONFIG_NF_NAT_IRC=m
CONFIG_NF_NAT_SIP=m
CONFIG_NF_NAT_TFTP=m
CONFIG_NF_NAT_REDIRECT=y
CONFIG_NF_NAT_MASQUERADE=y
CONFIG_NETFILTER_SYNPROXY=m
CONFIG_NF_TABLES=m
# CONFIG_NF_TABLES_SET is not set
# CONFIG_NF_TABLES_INET is not set
# CONFIG_NF_TABLES_NETDEV is not set
# CONFIG_NFT_NUMGEN is not set
CONFIG_NFT_CT=m
CONFIG_NFT_COUNTER=m
# CONFIG_NFT_CONNLIMIT is not set
CONFIG_NFT_LOG=m
CONFIG_NFT_LIMIT=m
CONFIG_NFT_MASQ=m
CONFIG_NFT_REDIR=m
# CONFIG_NFT_TUNNEL is not set
# CONFIG_NFT_OBJREF is not set
CONFIG_NFT_QUEUE=m
# CONFIG_NFT_QUOTA is not set
CONFIG_NFT_REJECT=m
CONFIG_NFT_COMPAT=m
CONFIG_NFT_HASH=m
# CONFIG_NFT_XFRM is not set
# CONFIG_NFT_SOCKET is not set
# CONFIG_NFT_OSF is not set
# CONFIG_NFT_TPROXY is not set
# CONFIG_NFT_SYNPROXY is not set
# CONFIG_NF_FLOW_TABLE is not set
CONFIG_NETFILTER_XTABLES=y

#
# Xtables combined modules
#
CONFIG_NETFILTER_XT_MARK=m
CONFIG_NETFILTER_XT_CONNMARK=m
CONFIG_NETFILTER_XT_SET=m

#
# Xtables targets
#
CONFIG_NETFILTER_XT_TARGET_AUDIT=m
CONFIG_NETFILTER_XT_TARGET_CHECKSUM=m
CONFIG_NETFILTER_XT_TARGET_CLASSIFY=m
CONFIG_NETFILTER_XT_TARGET_CONNMARK=m
CONFIG_NETFILTER_XT_TARGET_CONNSECMARK=m
CONFIG_NETFILTER_XT_TARGET_CT=m
CONFIG_NETFILTER_XT_TARGET_DSCP=m
CONFIG_NETFILTER_XT_TARGET_HL=m
CONFIG_NETFILTER_XT_TARGET_HMARK=m
CONFIG_NETFILTER_XT_TARGET_IDLETIMER=m
CONFIG_NETFILTER_XT_TARGET_LED=m
CONFIG_NETFILTER_XT_TARGET_LOG=m
CONFIG_NETFILTER_XT_TARGET_MARK=m
CONFIG_NETFILTER_XT_NAT=m
CONFIG_NETFILTER_XT_TARGET_NETMAP=m
CONFIG_NETFILTER_XT_TARGET_NFLOG=m
CONFIG_NETFILTER_XT_TARGET_NFQUEUE=m
CONFIG_NETFILTER_XT_TARGET_NOTRACK=m
CONFIG_NETFILTER_XT_TARGET_RATEEST=m
CONFIG_NETFILTER_XT_TARGET_REDIRECT=m
CONFIG_NETFILTER_XT_TARGET_MASQUERADE=m
CONFIG_NETFILTER_XT_TARGET_TEE=m
CONFIG_NETFILTER_XT_TARGET_TPROXY=m
CONFIG_NETFILTER_XT_TARGET_TRACE=m
CONFIG_NETFILTER_XT_TARGET_SECMARK=m
CONFIG_NETFILTER_XT_TARGET_TCPMSS=m
CONFIG_NETFILTER_XT_TARGET_TCPOPTSTRIP=m

#
# Xtables matches
#
CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=m
CONFIG_NETFILTER_XT_MATCH_BPF=m
CONFIG_NETFILTER_XT_MATCH_CGROUP=m
CONFIG_NETFILTER_XT_MATCH_CLUSTER=m
CONFIG_NETFILTER_XT_MATCH_COMMENT=m
CONFIG_NETFILTER_XT_MATCH_CONNBYTES=m
CONFIG_NETFILTER_XT_MATCH_CONNLABEL=m
CONFIG_NETFILTER_XT_MATCH_CONNLIMIT=m
CONFIG_NETFILTER_XT_MATCH_CONNMARK=m
CONFIG_NETFILTER_XT_MATCH_CONNTRACK=m
CONFIG_NETFILTER_XT_MATCH_CPU=m
CONFIG_NETFILTER_XT_MATCH_DCCP=m
CONFIG_NETFILTER_XT_MATCH_DEVGROUP=m
CONFIG_NETFILTER_XT_MATCH_DSCP=m
CONFIG_NETFILTER_XT_MATCH_ECN=m
CONFIG_NETFILTER_XT_MATCH_ESP=m
CONFIG_NETFILTER_XT_MATCH_HASHLIMIT=m
CONFIG_NETFILTER_XT_MATCH_HELPER=m
CONFIG_NETFILTER_XT_MATCH_HL=m
# CONFIG_NETFILTER_XT_MATCH_IPCOMP is not set
CONFIG_NETFILTER_XT_MATCH_IPRANGE=m
CONFIG_NETFILTER_XT_MATCH_IPVS=m
CONFIG_NETFILTER_XT_MATCH_L2TP=m
CONFIG_NETFILTER_XT_MATCH_LENGTH=m
CONFIG_NETFILTER_XT_MATCH_LIMIT=m
CONFIG_NETFILTER_XT_MATCH_MAC=m
CONFIG_NETFILTER_XT_MATCH_MARK=m
CONFIG_NETFILTER_XT_MATCH_MULTIPORT=m
CONFIG_NETFILTER_XT_MATCH_NFACCT=m
CONFIG_NETFILTER_XT_MATCH_OSF=m
CONFIG_NETFILTER_XT_MATCH_OWNER=m
CONFIG_NETFILTER_XT_MATCH_POLICY=m
CONFIG_NETFILTER_XT_MATCH_PHYSDEV=m
CONFIG_NETFILTER_XT_MATCH_PKTTYPE=m
CONFIG_NETFILTER_XT_MATCH_QUOTA=m
CONFIG_NETFILTER_XT_MATCH_RATEEST=m
CONFIG_NETFILTER_XT_MATCH_REALM=m
CONFIG_NETFILTER_XT_MATCH_RECENT=m
CONFIG_NETFILTER_XT_MATCH_SCTP=m
CONFIG_NETFILTER_XT_MATCH_SOCKET=m
CONFIG_NETFILTER_XT_MATCH_STATE=m
CONFIG_NETFILTER_XT_MATCH_STATISTIC=m
CONFIG_NETFILTER_XT_MATCH_STRING=m
CONFIG_NETFILTER_XT_MATCH_TCPMSS=m
CONFIG_NETFILTER_XT_MATCH_TIME=m
CONFIG_NETFILTER_XT_MATCH_U32=m
# end of Core Netfilter Configuration

CONFIG_IP_SET=m
CONFIG_IP_SET_MAX=256
CONFIG_IP_SET_BITMAP_IP=m
CONFIG_IP_SET_BITMAP_IPMAC=m
CONFIG_IP_SET_BITMAP_PORT=m
CONFIG_IP_SET_HASH_IP=m
CONFIG_IP_SET_HASH_IPMARK=m
CONFIG_IP_SET_HASH_IPPORT=m
CONFIG_IP_SET_HASH_IPPORTIP=m
CONFIG_IP_SET_HASH_IPPORTNET=m
CONFIG_IP_SET_HASH_IPMAC=m
CONFIG_IP_SET_HASH_MAC=m
CONFIG_IP_SET_HASH_NETPORTNET=m
CONFIG_IP_SET_HASH_NET=m
CONFIG_IP_SET_HASH_NETNET=m
CONFIG_IP_SET_HASH_NETPORT=m
CONFIG_IP_SET_HASH_NETIFACE=m
CONFIG_IP_SET_LIST_SET=m
CONFIG_IP_VS=m
CONFIG_IP_VS_IPV6=y
# CONFIG_IP_VS_DEBUG is not set
CONFIG_IP_VS_TAB_BITS=12

#
# IPVS transport protocol load balancing support
#
CONFIG_IP_VS_PROTO_TCP=y
CONFIG_IP_VS_PROTO_UDP=y
CONFIG_IP_VS_PROTO_AH_ESP=y
CONFIG_IP_VS_PROTO_ESP=y
CONFIG_IP_VS_PROTO_AH=y
CONFIG_IP_VS_PROTO_SCTP=y

#
# IPVS scheduler
#
CONFIG_IP_VS_RR=m
CONFIG_IP_VS_WRR=m
CONFIG_IP_VS_LC=m
CONFIG_IP_VS_WLC=m
# CONFIG_IP_VS_FO is not set
# CONFIG_IP_VS_OVF is not set
CONFIG_IP_VS_LBLC=m
CONFIG_IP_VS_LBLCR=m
CONFIG_IP_VS_DH=m
CONFIG_IP_VS_SH=m
# CONFIG_IP_VS_MH is not set
CONFIG_IP_VS_SED=m
CONFIG_IP_VS_NQ=m

#
# IPVS SH scheduler
#
CONFIG_IP_VS_SH_TAB_BITS=8

#
# IPVS MH scheduler
#
CONFIG_IP_VS_MH_TAB_INDEX=12

#
# IPVS application helper
#
CONFIG_IP_VS_FTP=m
CONFIG_IP_VS_NFCT=y
CONFIG_IP_VS_PE_SIP=m

#
# IP: Netfilter Configuration
#
CONFIG_NF_DEFRAG_IPV4=m
CONFIG_NF_SOCKET_IPV4=m
CONFIG_NF_TPROXY_IPV4=m
# CONFIG_NF_TABLES_IPV4 is not set
# CONFIG_NF_TABLES_ARP is not set
CONFIG_NF_DUP_IPV4=m
# CONFIG_NF_LOG_ARP is not set
CONFIG_NF_LOG_IPV4=m
CONFIG_NF_REJECT_IPV4=m
CONFIG_NF_NAT_SNMP_BASIC=m
CONFIG_NF_NAT_PPTP=m
CONFIG_NF_NAT_H323=m
CONFIG_IP_NF_IPTABLES=m
CONFIG_IP_NF_MATCH_AH=m
CONFIG_IP_NF_MATCH_ECN=m
CONFIG_IP_NF_MATCH_RPFILTER=m
CONFIG_IP_NF_MATCH_TTL=m
CONFIG_IP_NF_FILTER=m
CONFIG_IP_NF_TARGET_REJECT=m
CONFIG_IP_NF_TARGET_SYNPROXY=m
CONFIG_IP_NF_NAT=m
CONFIG_IP_NF_TARGET_MASQUERADE=m
CONFIG_IP_NF_TARGET_NETMAP=m
CONFIG_IP_NF_TARGET_REDIRECT=m
CONFIG_IP_NF_MANGLE=m
CONFIG_IP_NF_TARGET_CLUSTERIP=m
CONFIG_IP_NF_TARGET_ECN=m
CONFIG_IP_NF_TARGET_TTL=m
CONFIG_IP_NF_RAW=m
CONFIG_IP_NF_SECURITY=m
CONFIG_IP_NF_ARPTABLES=m
CONFIG_IP_NF_ARPFILTER=m
CONFIG_IP_NF_ARP_MANGLE=m
# end of IP: Netfilter Configuration

#
# IPv6: Netfilter Configuration
#
CONFIG_NF_SOCKET_IPV6=m
CONFIG_NF_TPROXY_IPV6=m
# CONFIG_NF_TABLES_IPV6 is not set
CONFIG_NF_DUP_IPV6=m
CONFIG_NF_REJECT_IPV6=m
CONFIG_NF_LOG_IPV6=m
CONFIG_IP6_NF_IPTABLES=m
CONFIG_IP6_NF_MATCH_AH=m
CONFIG_IP6_NF_MATCH_EUI64=m
CONFIG_IP6_NF_MATCH_FRAG=m
CONFIG_IP6_NF_MATCH_OPTS=m
CONFIG_IP6_NF_MATCH_HL=m
CONFIG_IP6_NF_MATCH_IPV6HEADER=m
CONFIG_IP6_NF_MATCH_MH=m
CONFIG_IP6_NF_MATCH_RPFILTER=m
CONFIG_IP6_NF_MATCH_RT=m
# CONFIG_IP6_NF_MATCH_SRH is not set
CONFIG_IP6_NF_TARGET_HL=m
CONFIG_IP6_NF_FILTER=m
CONFIG_IP6_NF_TARGET_REJECT=m
CONFIG_IP6_NF_TARGET_SYNPROXY=m
CONFIG_IP6_NF_MANGLE=m
CONFIG_IP6_NF_RAW=m
CONFIG_IP6_NF_SECURITY=m
CONFIG_IP6_NF_NAT=m
CONFIG_IP6_NF_TARGET_MASQUERADE=m
CONFIG_IP6_NF_TARGET_NPT=m
# end of IPv6: Netfilter Configuration

CONFIG_NF_DEFRAG_IPV6=m
# CONFIG_NF_TABLES_BRIDGE is not set
# CONFIG_NF_CONNTRACK_BRIDGE is not set
CONFIG_BRIDGE_NF_EBTABLES=m
CONFIG_BRIDGE_EBT_BROUTE=m
CONFIG_BRIDGE_EBT_T_FILTER=m
CONFIG_BRIDGE_EBT_T_NAT=m
CONFIG_BRIDGE_EBT_802_3=m
CONFIG_BRIDGE_EBT_AMONG=m
CONFIG_BRIDGE_EBT_ARP=m
CONFIG_BRIDGE_EBT_IP=m
CONFIG_BRIDGE_EBT_IP6=m
CONFIG_BRIDGE_EBT_LIMIT=m
CONFIG_BRIDGE_EBT_MARK=m
CONFIG_BRIDGE_EBT_PKTTYPE=m
CONFIG_BRIDGE_EBT_STP=m
CONFIG_BRIDGE_EBT_VLAN=m
CONFIG_BRIDGE_EBT_ARPREPLY=m
CONFIG_BRIDGE_EBT_DNAT=m
CONFIG_BRIDGE_EBT_MARK_T=m
CONFIG_BRIDGE_EBT_REDIRECT=m
CONFIG_BRIDGE_EBT_SNAT=m
CONFIG_BRIDGE_EBT_LOG=m
CONFIG_BRIDGE_EBT_NFLOG=m
# CONFIG_BPFILTER is not set
CONFIG_IP_DCCP=m
CONFIG_INET_DCCP_DIAG=m

#
# DCCP CCIDs Configuration
#
# CONFIG_IP_DCCP_CCID2_DEBUG is not set
CONFIG_IP_DCCP_CCID3=y
# CONFIG_IP_DCCP_CCID3_DEBUG is not set
CONFIG_IP_DCCP_TFRC_LIB=y
# end of DCCP CCIDs Configuration

#
# DCCP Kernel Hacking
#
# CONFIG_IP_DCCP_DEBUG is not set
# end of DCCP Kernel Hacking

CONFIG_IP_SCTP=m
# CONFIG_SCTP_DBG_OBJCNT is not set
# CONFIG_SCTP_DEFAULT_COOKIE_HMAC_MD5 is not set
CONFIG_SCTP_DEFAULT_COOKIE_HMAC_SHA1=y
# CONFIG_SCTP_DEFAULT_COOKIE_HMAC_NONE is not set
CONFIG_SCTP_COOKIE_HMAC_MD5=y
CONFIG_SCTP_COOKIE_HMAC_SHA1=y
CONFIG_INET_SCTP_DIAG=m
# CONFIG_RDS is not set
# CONFIG_TIPC is not set
CONFIG_ATM=m
CONFIG_ATM_CLIP=m
# CONFIG_ATM_CLIP_NO_ICMP is not set
CONFIG_ATM_LANE=m
# CONFIG_ATM_MPOA is not set
CONFIG_ATM_BR2684=m
# CONFIG_ATM_BR2684_IPFILTER is not set
CONFIG_L2TP=m
CONFIG_L2TP_DEBUGFS=m
CONFIG_L2TP_V3=y
CONFIG_L2TP_IP=m
CONFIG_L2TP_ETH=m
CONFIG_STP=m
CONFIG_GARP=m
CONFIG_MRP=m
CONFIG_BRIDGE=m
CONFIG_BRIDGE_IGMP_SNOOPING=y
CONFIG_BRIDGE_VLAN_FILTERING=y
CONFIG_HAVE_NET_DSA=y
# CONFIG_NET_DSA is not set
CONFIG_VLAN_8021Q=m
CONFIG_VLAN_8021Q_GVRP=y
CONFIG_VLAN_8021Q_MVRP=y
# CONFIG_DECNET is not set
CONFIG_LLC=m
# CONFIG_LLC2 is not set
# CONFIG_ATALK is not set
# CONFIG_X25 is not set
# CONFIG_LAPB is not set
# CONFIG_PHONET is not set
CONFIG_6LOWPAN=m
# CONFIG_6LOWPAN_DEBUGFS is not set
CONFIG_6LOWPAN_NHC=m
CONFIG_6LOWPAN_NHC_DEST=m
CONFIG_6LOWPAN_NHC_FRAGMENT=m
CONFIG_6LOWPAN_NHC_HOP=m
CONFIG_6LOWPAN_NHC_IPV6=m
CONFIG_6LOWPAN_NHC_MOBILITY=m
CONFIG_6LOWPAN_NHC_ROUTING=m
CONFIG_6LOWPAN_NHC_UDP=m
# CONFIG_6LOWPAN_GHC_EXT_HDR_HOP is not set
# CONFIG_6LOWPAN_GHC_UDP is not set
# CONFIG_6LOWPAN_GHC_ICMPV6 is not set
# CONFIG_6LOWPAN_GHC_EXT_HDR_DEST is not set
# CONFIG_6LOWPAN_GHC_EXT_HDR_FRAG is not set
# CONFIG_6LOWPAN_GHC_EXT_HDR_ROUTE is not set
CONFIG_IEEE802154=m
# CONFIG_IEEE802154_NL802154_EXPERIMENTAL is not set
CONFIG_IEEE802154_SOCKET=m
CONFIG_IEEE802154_6LOWPAN=m
CONFIG_MAC802154=m
CONFIG_NET_SCHED=y

#
# Queueing/Scheduling
#
CONFIG_NET_SCH_CBQ=m
CONFIG_NET_SCH_HTB=m
CONFIG_NET_SCH_HFSC=m
CONFIG_NET_SCH_ATM=m
CONFIG_NET_SCH_PRIO=m
CONFIG_NET_SCH_MULTIQ=m
CONFIG_NET_SCH_RED=m
CONFIG_NET_SCH_SFB=m
CONFIG_NET_SCH_SFQ=m
CONFIG_NET_SCH_TEQL=m
CONFIG_NET_SCH_TBF=m
# CONFIG_NET_SCH_CBS is not set
# CONFIG_NET_SCH_ETF is not set
# CONFIG_NET_SCH_TAPRIO is not set
CONFIG_NET_SCH_GRED=m
CONFIG_NET_SCH_DSMARK=m
CONFIG_NET_SCH_NETEM=m
CONFIG_NET_SCH_DRR=m
CONFIG_NET_SCH_MQPRIO=m
# CONFIG_NET_SCH_SKBPRIO is not set
CONFIG_NET_SCH_CHOKE=m
CONFIG_NET_SCH_QFQ=m
CONFIG_NET_SCH_CODEL=m
CONFIG_NET_SCH_FQ_CODEL=m
# CONFIG_NET_SCH_CAKE is not set
CONFIG_NET_SCH_FQ=m
# CONFIG_NET_SCH_HHF is not set
# CONFIG_NET_SCH_PIE is not set
CONFIG_NET_SCH_INGRESS=m
CONFIG_NET_SCH_PLUG=m
# CONFIG_NET_SCH_DEFAULT is not set

#
# Classification
#
CONFIG_NET_CLS=y
CONFIG_NET_CLS_BASIC=m
CONFIG_NET_CLS_TCINDEX=m
CONFIG_NET_CLS_ROUTE4=m
CONFIG_NET_CLS_FW=m
CONFIG_NET_CLS_U32=m
CONFIG_CLS_U32_PERF=y
CONFIG_CLS_U32_MARK=y
CONFIG_NET_CLS_RSVP=m
CONFIG_NET_CLS_RSVP6=m
CONFIG_NET_CLS_FLOW=m
CONFIG_NET_CLS_CGROUP=y
CONFIG_NET_CLS_BPF=m
CONFIG_NET_CLS_FLOWER=m
CONFIG_NET_CLS_MATCHALL=m
CONFIG_NET_EMATCH=y
CONFIG_NET_EMATCH_STACK=32
CONFIG_NET_EMATCH_CMP=m
CONFIG_NET_EMATCH_NBYTE=m
CONFIG_NET_EMATCH_U32=m
CONFIG_NET_EMATCH_META=m
CONFIG_NET_EMATCH_TEXT=m
# CONFIG_NET_EMATCH_CANID is not set
CONFIG_NET_EMATCH_IPSET=m
# CONFIG_NET_EMATCH_IPT is not set
CONFIG_NET_CLS_ACT=y
CONFIG_NET_ACT_POLICE=m
CONFIG_NET_ACT_GACT=m
CONFIG_GACT_PROB=y
CONFIG_NET_ACT_MIRRED=m
CONFIG_NET_ACT_SAMPLE=m
CONFIG_NET_ACT_IPT=m
CONFIG_NET_ACT_NAT=m
CONFIG_NET_ACT_PEDIT=m
CONFIG_NET_ACT_SIMP=m
CONFIG_NET_ACT_SKBEDIT=m
CONFIG_NET_ACT_CSUM=m
# CONFIG_NET_ACT_MPLS is not set
CONFIG_NET_ACT_VLAN=m
# CONFIG_NET_ACT_BPF is not set
CONFIG_NET_ACT_CONNMARK=m
# CONFIG_NET_ACT_CTINFO is not set
CONFIG_NET_ACT_SKBMOD=m
# CONFIG_NET_ACT_IFE is not set
CONFIG_NET_ACT_TUNNEL_KEY=m
# CONFIG_NET_ACT_CT is not set
# CONFIG_NET_TC_SKB_EXT is not set
CONFIG_NET_SCH_FIFO=y
CONFIG_DCB=y
CONFIG_DNS_RESOLVER=m
# CONFIG_BATMAN_ADV is not set
CONFIG_OPENVSWITCH=m
CONFIG_OPENVSWITCH_GRE=m
CONFIG_OPENVSWITCH_VXLAN=m
CONFIG_OPENVSWITCH_GENEVE=m
CONFIG_VSOCKETS=m
CONFIG_VSOCKETS_DIAG=m
CONFIG_VMWARE_VMCI_VSOCKETS=m
CONFIG_VIRTIO_VSOCKETS=m
CONFIG_VIRTIO_VSOCKETS_COMMON=m
CONFIG_HYPERV_VSOCKETS=m
CONFIG_NETLINK_DIAG=m
CONFIG_MPLS=y
CONFIG_NET_MPLS_GSO=y
CONFIG_MPLS_ROUTING=m
CONFIG_MPLS_IPTUNNEL=m
CONFIG_NET_NSH=m
# CONFIG_HSR is not set
CONFIG_NET_SWITCHDEV=y
CONFIG_NET_L3_MASTER_DEV=y
# CONFIG_NET_NCSI is not set
CONFIG_RPS=y
CONFIG_RFS_ACCEL=y
CONFIG_XPS=y
# CONFIG_CGROUP_NET_PRIO is not set
CONFIG_CGROUP_NET_CLASSID=y
CONFIG_NET_RX_BUSY_POLL=y
CONFIG_BQL=y
CONFIG_BPF_JIT=y
CONFIG_BPF_STREAM_PARSER=y
CONFIG_NET_FLOW_LIMIT=y

#
# Network testing
#
CONFIG_NET_PKTGEN=m
CONFIG_NET_DROP_MONITOR=y
# end of Network testing
# end of Networking options

# CONFIG_HAMRADIO is not set
CONFIG_CAN=m
CONFIG_CAN_RAW=m
CONFIG_CAN_BCM=m
CONFIG_CAN_GW=m
# CONFIG_CAN_J1939 is not set

#
# CAN Device Drivers
#
CONFIG_CAN_VCAN=m
# CONFIG_CAN_VXCAN is not set
CONFIG_CAN_SLCAN=m
CONFIG_CAN_DEV=m
CONFIG_CAN_CALC_BITTIMING=y
# CONFIG_CAN_KVASER_PCIEFD is not set
CONFIG_CAN_C_CAN=m
CONFIG_CAN_C_CAN_PLATFORM=m
CONFIG_CAN_C_CAN_PCI=m
CONFIG_CAN_CC770=m
# CONFIG_CAN_CC770_ISA is not set
CONFIG_CAN_CC770_PLATFORM=m
# CONFIG_CAN_IFI_CANFD is not set
# CONFIG_CAN_M_CAN is not set
# CONFIG_CAN_PEAK_PCIEFD is not set
CONFIG_CAN_SJA1000=m
CONFIG_CAN_EMS_PCI=m
# CONFIG_CAN_F81601 is not set
CONFIG_CAN_KVASER_PCI=m
CONFIG_CAN_PEAK_PCI=m
CONFIG_CAN_PEAK_PCIEC=y
CONFIG_CAN_PLX_PCI=m
# CONFIG_CAN_SJA1000_ISA is not set
CONFIG_CAN_SJA1000_PLATFORM=m
CONFIG_CAN_SOFTING=m

#
# CAN SPI interfaces
#
# CONFIG_CAN_HI311X is not set
# CONFIG_CAN_MCP251X is not set
# end of CAN SPI interfaces

#
# CAN USB interfaces
#
CONFIG_CAN_8DEV_USB=m
CONFIG_CAN_EMS_USB=m
CONFIG_CAN_ESD_USB2=m
# CONFIG_CAN_GS_USB is not set
CONFIG_CAN_KVASER_USB=m
# CONFIG_CAN_MCBA_USB is not set
CONFIG_CAN_PEAK_USB=m
# CONFIG_CAN_UCAN is not set
# end of CAN USB interfaces

# CONFIG_CAN_DEBUG_DEVICES is not set
# end of CAN Device Drivers

CONFIG_BT=m
CONFIG_BT_BREDR=y
CONFIG_BT_RFCOMM=m
CONFIG_BT_RFCOMM_TTY=y
CONFIG_BT_BNEP=m
CONFIG_BT_BNEP_MC_FILTER=y
CONFIG_BT_BNEP_PROTO_FILTER=y
CONFIG_BT_CMTP=m
CONFIG_BT_HIDP=m
CONFIG_BT_HS=y
CONFIG_BT_LE=y
# CONFIG_BT_6LOWPAN is not set
# CONFIG_BT_LEDS is not set
# CONFIG_BT_SELFTEST is not set
CONFIG_BT_DEBUGFS=y

#
# Bluetooth device drivers
#
CONFIG_BT_INTEL=m
CONFIG_BT_BCM=m
CONFIG_BT_RTL=m
CONFIG_BT_HCIBTUSB=m
# CONFIG_BT_HCIBTUSB_AUTOSUSPEND is not set
CONFIG_BT_HCIBTUSB_BCM=y
# CONFIG_BT_HCIBTUSB_MTK is not set
CONFIG_BT_HCIBTUSB_RTL=y
CONFIG_BT_HCIBTSDIO=m
CONFIG_BT_HCIUART=m
CONFIG_BT_HCIUART_H4=y
CONFIG_BT_HCIUART_BCSP=y
CONFIG_BT_HCIUART_ATH3K=y
# CONFIG_BT_HCIUART_INTEL is not set
# CONFIG_BT_HCIUART_AG6XX is not set
CONFIG_BT_HCIBCM203X=m
CONFIG_BT_HCIBPA10X=m
CONFIG_BT_HCIBFUSB=m
CONFIG_BT_HCIVHCI=m
CONFIG_BT_MRVL=m
CONFIG_BT_MRVL_SDIO=m
CONFIG_BT_ATH3K=m
# CONFIG_BT_MTKSDIO is not set
# end of Bluetooth device drivers

# CONFIG_AF_RXRPC is not set
# CONFIG_AF_KCM is not set
CONFIG_STREAM_PARSER=y
CONFIG_FIB_RULES=y
CONFIG_WIRELESS=y
CONFIG_WIRELESS_EXT=y
CONFIG_WEXT_CORE=y
CONFIG_WEXT_PROC=y
CONFIG_WEXT_PRIV=y
CONFIG_CFG80211=m
# CONFIG_NL80211_TESTMODE is not set
# CONFIG_CFG80211_DEVELOPER_WARNINGS is not set
# CONFIG_CFG80211_CERTIFICATION_ONUS is not set
CONFIG_CFG80211_REQUIRE_SIGNED_REGDB=y
CONFIG_CFG80211_USE_KERNEL_REGDB_KEYS=y
CONFIG_CFG80211_DEFAULT_PS=y
# CONFIG_CFG80211_DEBUGFS is not set
CONFIG_CFG80211_CRDA_SUPPORT=y
CONFIG_CFG80211_WEXT=y
CONFIG_LIB80211=m
# CONFIG_LIB80211_DEBUG is not set
CONFIG_MAC80211=m
CONFIG_MAC80211_HAS_RC=y
CONFIG_MAC80211_RC_MINSTREL=y
CONFIG_MAC80211_RC_DEFAULT_MINSTREL=y
CONFIG_MAC80211_RC_DEFAULT="minstrel_ht"
CONFIG_MAC80211_MESH=y
CONFIG_MAC80211_LEDS=y
CONFIG_MAC80211_DEBUGFS=y
# CONFIG_MAC80211_MESSAGE_TRACING is not set
# CONFIG_MAC80211_DEBUG_MENU is not set
CONFIG_MAC80211_STA_HASH_MAX_SIZE=0
# CONFIG_WIMAX is not set
CONFIG_RFKILL=m
CONFIG_RFKILL_LEDS=y
CONFIG_RFKILL_INPUT=y
# CONFIG_RFKILL_GPIO is not set
CONFIG_NET_9P=y
CONFIG_NET_9P_VIRTIO=y
# CONFIG_NET_9P_XEN is not set
# CONFIG_NET_9P_DEBUG is not set
# CONFIG_CAIF is not set
CONFIG_CEPH_LIB=m
# CONFIG_CEPH_LIB_PRETTYDEBUG is not set
CONFIG_CEPH_LIB_USE_DNS_RESOLVER=y
# CONFIG_NFC is not set
CONFIG_PSAMPLE=m
# CONFIG_NET_IFE is not set
CONFIG_LWTUNNEL=y
CONFIG_LWTUNNEL_BPF=y
CONFIG_DST_CACHE=y
CONFIG_GRO_CELLS=y
CONFIG_NET_SOCK_MSG=y
CONFIG_NET_DEVLINK=y
CONFIG_PAGE_POOL=y
CONFIG_FAILOVER=m
CONFIG_HAVE_EBPF_JIT=y

#
# Device Drivers
#
CONFIG_HAVE_EISA=y
# CONFIG_EISA is not set
CONFIG_HAVE_PCI=y
CONFIG_PCI=y
CONFIG_PCI_DOMAINS=y
CONFIG_PCIEPORTBUS=y
CONFIG_HOTPLUG_PCI_PCIE=y
CONFIG_PCIEAER=y
CONFIG_PCIEAER_INJECT=m
CONFIG_PCIE_ECRC=y
CONFIG_PCIEASPM=y
# CONFIG_PCIEASPM_DEBUG is not set
CONFIG_PCIEASPM_DEFAULT=y
# CONFIG_PCIEASPM_POWERSAVE is not set
# CONFIG_PCIEASPM_POWER_SUPERSAVE is not set
# CONFIG_PCIEASPM_PERFORMANCE is not set
CONFIG_PCIE_PME=y
# CONFIG_PCIE_DPC is not set
# CONFIG_PCIE_PTM is not set
# CONFIG_PCIE_BW is not set
CONFIG_PCI_MSI=y
CONFIG_PCI_MSI_IRQ_DOMAIN=y
CONFIG_PCI_QUIRKS=y
# CONFIG_PCI_DEBUG is not set
# CONFIG_PCI_REALLOC_ENABLE_AUTO is not set
CONFIG_PCI_STUB=y
# CONFIG_PCI_PF_STUB is not set
# CONFIG_XEN_PCIDEV_FRONTEND is not set
CONFIG_PCI_ATS=y
CONFIG_PCI_LOCKLESS_CONFIG=y
CONFIG_PCI_IOV=y
CONFIG_PCI_PRI=y
CONFIG_PCI_PASID=y
# CONFIG_PCI_P2PDMA is not set
CONFIG_PCI_LABEL=y
CONFIG_PCI_HYPERV=m
CONFIG_HOTPLUG_PCI=y
CONFIG_HOTPLUG_PCI_ACPI=y
CONFIG_HOTPLUG_PCI_ACPI_IBM=m
# CONFIG_HOTPLUG_PCI_CPCI is not set
CONFIG_HOTPLUG_PCI_SHPC=y

#
# PCI controller drivers
#

#
# Cadence PCIe controllers support
#
# end of Cadence PCIe controllers support

CONFIG_VMD=y
CONFIG_PCI_HYPERV_INTERFACE=m

#
# DesignWare PCI Core Support
#
# CONFIG_PCIE_DW_PLAT_HOST is not set
# CONFIG_PCI_MESON is not set
# end of DesignWare PCI Core Support
# end of PCI controller drivers

#
# PCI Endpoint
#
# CONFIG_PCI_ENDPOINT is not set
# end of PCI Endpoint

#
# PCI switch controller drivers
#
# CONFIG_PCI_SW_SWITCHTEC is not set
# end of PCI switch controller drivers

CONFIG_PCCARD=y
# CONFIG_PCMCIA is not set
CONFIG_CARDBUS=y

#
# PC-card bridges
#
CONFIG_YENTA=m
CONFIG_YENTA_O2=y
CONFIG_YENTA_RICOH=y
CONFIG_YENTA_TI=y
CONFIG_YENTA_ENE_TUNE=y
CONFIG_YENTA_TOSHIBA=y
# CONFIG_RAPIDIO is not set

#
# Generic Driver Options
#
CONFIG_UEVENT_HELPER=y
CONFIG_UEVENT_HELPER_PATH=""
CONFIG_DEVTMPFS=y
CONFIG_DEVTMPFS_MOUNT=y
CONFIG_STANDALONE=y
CONFIG_PREVENT_FIRMWARE_BUILD=y

#
# Firmware loader
#
CONFIG_FW_LOADER=y
CONFIG_FW_LOADER_PAGED_BUF=y
CONFIG_EXTRA_FIRMWARE=""
CONFIG_FW_LOADER_USER_HELPER=y
# CONFIG_FW_LOADER_USER_HELPER_FALLBACK is not set
# CONFIG_FW_LOADER_COMPRESS is not set
# end of Firmware loader

CONFIG_WANT_DEV_COREDUMP=y
CONFIG_ALLOW_DEV_COREDUMP=y
CONFIG_DEV_COREDUMP=y
# CONFIG_DEBUG_DRIVER is not set
# CONFIG_DEBUG_DEVRES is not set
# CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
# CONFIG_TEST_ASYNC_DRIVER_PROBE is not set
CONFIG_SYS_HYPERVISOR=y
CONFIG_GENERIC_CPU_AUTOPROBE=y
CONFIG_GENERIC_CPU_VULNERABILITIES=y
CONFIG_REGMAP=y
CONFIG_REGMAP_I2C=y
CONFIG_REGMAP_SPI=y
CONFIG_REGMAP_IRQ=y
CONFIG_DMA_SHARED_BUFFER=y
# CONFIG_DMA_FENCE_TRACE is not set
# end of Generic Driver Options

#
# Bus devices
#
# end of Bus devices

CONFIG_CONNECTOR=y
CONFIG_PROC_EVENTS=y
# CONFIG_GNSS is not set
CONFIG_MTD=m
# CONFIG_MTD_TESTS is not set

#
# Partition parsers
#
# CONFIG_MTD_AR7_PARTS is not set
# CONFIG_MTD_CMDLINE_PARTS is not set
# CONFIG_MTD_REDBOOT_PARTS is not set
# end of Partition parsers

#
# User Modules And Translation Layers
#
CONFIG_MTD_BLKDEVS=m
CONFIG_MTD_BLOCK=m
# CONFIG_MTD_BLOCK_RO is not set
# CONFIG_FTL is not set
# CONFIG_NFTL is not set
# CONFIG_INFTL is not set
# CONFIG_RFD_FTL is not set
# CONFIG_SSFDC is not set
# CONFIG_SM_FTL is not set
# CONFIG_MTD_OOPS is not set
# CONFIG_MTD_SWAP is not set
# CONFIG_MTD_PARTITIONED_MASTER is not set

#
# RAM/ROM/Flash chip drivers
#
# CONFIG_MTD_CFI is not set
# CONFIG_MTD_JEDECPROBE is not set
CONFIG_MTD_MAP_BANK_WIDTH_1=y
CONFIG_MTD_MAP_BANK_WIDTH_2=y
CONFIG_MTD_MAP_BANK_WIDTH_4=y
CONFIG_MTD_CFI_I1=y
CONFIG_MTD_CFI_I2=y
# CONFIG_MTD_RAM is not set
# CONFIG_MTD_ROM is not set
# CONFIG_MTD_ABSENT is not set
# end of RAM/ROM/Flash chip drivers

#
# Mapping drivers for chip access
#
# CONFIG_MTD_COMPLEX_MAPPINGS is not set
# CONFIG_MTD_INTEL_VR_NOR is not set
# CONFIG_MTD_PLATRAM is not set
# end of Mapping drivers for chip access

#
# Self-contained MTD device drivers
#
# CONFIG_MTD_PMC551 is not set
# CONFIG_MTD_DATAFLASH is not set
# CONFIG_MTD_MCHP23K256 is not set
# CONFIG_MTD_SST25L is not set
# CONFIG_MTD_SLRAM is not set
# CONFIG_MTD_PHRAM is not set
# CONFIG_MTD_MTDRAM is not set
# CONFIG_MTD_BLOCK2MTD is not set

#
# Disk-On-Chip Device Drivers
#
# CONFIG_MTD_DOCG3 is not set
# end of Self-contained MTD device drivers

# CONFIG_MTD_ONENAND is not set
# CONFIG_MTD_RAW_NAND is not set
# CONFIG_MTD_SPI_NAND is not set

#
# LPDDR & LPDDR2 PCM memory drivers
#
# CONFIG_MTD_LPDDR is not set
# end of LPDDR & LPDDR2 PCM memory drivers

# CONFIG_MTD_SPI_NOR is not set
CONFIG_MTD_UBI=m
CONFIG_MTD_UBI_WL_THRESHOLD=4096
CONFIG_MTD_UBI_BEB_LIMIT=20
# CONFIG_MTD_UBI_FASTMAP is not set
# CONFIG_MTD_UBI_GLUEBI is not set
# CONFIG_MTD_UBI_BLOCK is not set
# CONFIG_MTD_HYPERBUS is not set
# CONFIG_OF is not set
CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=y
CONFIG_PARPORT=m
CONFIG_PARPORT_PC=m
CONFIG_PARPORT_SERIAL=m
# CONFIG_PARPORT_PC_FIFO is not set
# CONFIG_PARPORT_PC_SUPERIO is not set
# CONFIG_PARPORT_AX88796 is not set
CONFIG_PARPORT_1284=y
CONFIG_PARPORT_NOT_PC=y
CONFIG_PNP=y
# CONFIG_PNP_DEBUG_MESSAGES is not set

#
# Protocols
#
CONFIG_PNPACPI=y
CONFIG_BLK_DEV=y
CONFIG_BLK_DEV_NULL_BLK=m
CONFIG_BLK_DEV_NULL_BLK_FAULT_INJECTION=y
CONFIG_BLK_DEV_FD=m
CONFIG_CDROM=m
# CONFIG_PARIDE is not set
CONFIG_BLK_DEV_PCIESSD_MTIP32XX=m
# CONFIG_ZRAM is not set
# CONFIG_BLK_DEV_UMEM is not set
CONFIG_BLK_DEV_LOOP=m
CONFIG_BLK_DEV_LOOP_MIN_COUNT=0
# CONFIG_BLK_DEV_CRYPTOLOOP is not set
# CONFIG_BLK_DEV_DRBD is not set
CONFIG_BLK_DEV_NBD=m
# CONFIG_BLK_DEV_SKD is not set
CONFIG_BLK_DEV_SX8=m
CONFIG_BLK_DEV_RAM=m
CONFIG_BLK_DEV_RAM_COUNT=16
CONFIG_BLK_DEV_RAM_SIZE=16384
CONFIG_CDROM_PKTCDVD=m
CONFIG_CDROM_PKTCDVD_BUFFERS=8
# CONFIG_CDROM_PKTCDVD_WCACHE is not set
CONFIG_ATA_OVER_ETH=m
CONFIG_XEN_BLKDEV_FRONTEND=m
CONFIG_VIRTIO_BLK=y
# CONFIG_VIRTIO_BLK_SCSI is not set
CONFIG_BLK_DEV_RBD=m
# CONFIG_BLK_DEV_RSXX is not set

#
# NVME Support
#
CONFIG_NVME_CORE=m
CONFIG_BLK_DEV_NVME=m
CONFIG_NVME_MULTIPATH=y
CONFIG_NVME_FABRICS=m
CONFIG_NVME_FC=m
# CONFIG_NVME_TCP is not set
CONFIG_NVME_TARGET=m
CONFIG_NVME_TARGET_LOOP=m
CONFIG_NVME_TARGET_FC=m
CONFIG_NVME_TARGET_FCLOOP=m
# CONFIG_NVME_TARGET_TCP is not set
# end of NVME Support

#
# Misc devices
#
CONFIG_SENSORS_LIS3LV02D=m
# CONFIG_AD525X_DPOT is not set
# CONFIG_DUMMY_IRQ is not set
# CONFIG_IBM_ASM is not set
# CONFIG_PHANTOM is not set
CONFIG_TIFM_CORE=m
CONFIG_TIFM_7XX1=m
# CONFIG_ICS932S401 is not set
CONFIG_ENCLOSURE_SERVICES=m
CONFIG_SGI_XP=m
CONFIG_HP_ILO=m
CONFIG_SGI_GRU=m
# CONFIG_SGI_GRU_DEBUG is not set
CONFIG_APDS9802ALS=m
CONFIG_ISL29003=m
CONFIG_ISL29020=m
CONFIG_SENSORS_TSL2550=m
CONFIG_SENSORS_BH1770=m
CONFIG_SENSORS_APDS990X=m
# CONFIG_HMC6352 is not set
# CONFIG_DS1682 is not set
CONFIG_VMWARE_BALLOON=m
# CONFIG_LATTICE_ECP3_CONFIG is not set
# CONFIG_SRAM is not set
# CONFIG_PCI_ENDPOINT_TEST is not set
# CONFIG_XILINX_SDFEC is not set
CONFIG_PVPANIC=y
# CONFIG_C2PORT is not set

#
# EEPROM support
#
CONFIG_EEPROM_AT24=m
# CONFIG_EEPROM_AT25 is not set
CONFIG_EEPROM_LEGACY=m
CONFIG_EEPROM_MAX6875=m
CONFIG_EEPROM_93CX6=m
# CONFIG_EEPROM_93XX46 is not set
# CONFIG_EEPROM_IDT_89HPESX is not set
# CONFIG_EEPROM_EE1004 is not set
# end of EEPROM support

CONFIG_CB710_CORE=m
# CONFIG_CB710_DEBUG is not set
CONFIG_CB710_DEBUG_ASSUMPTIONS=y

#
# Texas Instruments shared transport line discipline
#
# CONFIG_TI_ST is not set
# end of Texas Instruments shared transport line discipline

CONFIG_SENSORS_LIS3_I2C=m
CONFIG_ALTERA_STAPL=m
CONFIG_INTEL_MEI=m
CONFIG_INTEL_MEI_ME=m
# CONFIG_INTEL_MEI_TXE is not set
# CONFIG_INTEL_MEI_HDCP is not set
CONFIG_VMWARE_VMCI=m

#
# Intel MIC & related support
#

#
# Intel MIC Bus Driver
#
# CONFIG_INTEL_MIC_BUS is not set

#
# SCIF Bus Driver
#
# CONFIG_SCIF_BUS is not set

#
# VOP Bus Driver
#
# CONFIG_VOP_BUS is not set

#
# Intel MIC Host Driver
#

#
# Intel MIC Card Driver
#

#
# SCIF Driver
#

#
# Intel MIC Coprocessor State Management (COSM) Drivers
#

#
# VOP Driver
#
# end of Intel MIC & related support

# CONFIG_GENWQE is not set
# CONFIG_ECHO is not set
# CONFIG_MISC_ALCOR_PCI is not set
# CONFIG_MISC_RTSX_PCI is not set
# CONFIG_MISC_RTSX_USB is not set
# CONFIG_HABANA_AI is not set
# end of Misc devices

CONFIG_HAVE_IDE=y
# CONFIG_IDE is not set

#
# SCSI device support
#
CONFIG_SCSI_MOD=y
CONFIG_RAID_ATTRS=m
CONFIG_SCSI=y
CONFIG_SCSI_DMA=y
CONFIG_SCSI_NETLINK=y
CONFIG_SCSI_PROC_FS=y

#
# SCSI support type (disk, tape, CD-ROM)
#
CONFIG_BLK_DEV_SD=m
CONFIG_CHR_DEV_ST=m
CONFIG_BLK_DEV_SR=m
CONFIG_BLK_DEV_SR_VENDOR=y
CONFIG_CHR_DEV_SG=m
CONFIG_CHR_DEV_SCH=m
CONFIG_SCSI_ENCLOSURE=m
CONFIG_SCSI_CONSTANTS=y
CONFIG_SCSI_LOGGING=y
CONFIG_SCSI_SCAN_ASYNC=y

#
# SCSI Transports
#
CONFIG_SCSI_SPI_ATTRS=m
CONFIG_SCSI_FC_ATTRS=m
CONFIG_SCSI_ISCSI_ATTRS=m
CONFIG_SCSI_SAS_ATTRS=m
CONFIG_SCSI_SAS_LIBSAS=m
CONFIG_SCSI_SAS_ATA=y
CONFIG_SCSI_SAS_HOST_SMP=y
CONFIG_SCSI_SRP_ATTRS=m
# end of SCSI Transports

CONFIG_SCSI_LOWLEVEL=y
CONFIG_ISCSI_TCP=m
CONFIG_ISCSI_BOOT_SYSFS=m
CONFIG_SCSI_CXGB3_ISCSI=m
CONFIG_SCSI_CXGB4_ISCSI=m
CONFIG_SCSI_BNX2_ISCSI=m
CONFIG_SCSI_BNX2X_FCOE=m
CONFIG_BE2ISCSI=m
# CONFIG_BLK_DEV_3W_XXXX_RAID is not set
CONFIG_SCSI_HPSA=m
CONFIG_SCSI_3W_9XXX=m
CONFIG_SCSI_3W_SAS=m
# CONFIG_SCSI_ACARD is not set
CONFIG_SCSI_AACRAID=m
# CONFIG_SCSI_AIC7XXX is not set
CONFIG_SCSI_AIC79XX=m
CONFIG_AIC79XX_CMDS_PER_DEVICE=4
CONFIG_AIC79XX_RESET_DELAY_MS=15000
# CONFIG_AIC79XX_DEBUG_ENABLE is not set
CONFIG_AIC79XX_DEBUG_MASK=0
# CONFIG_AIC79XX_REG_PRETTY_PRINT is not set
# CONFIG_SCSI_AIC94XX is not set
CONFIG_SCSI_MVSAS=m
# CONFIG_SCSI_MVSAS_DEBUG is not set
CONFIG_SCSI_MVSAS_TASKLET=y
CONFIG_SCSI_MVUMI=m
# CONFIG_SCSI_DPT_I2O is not set
# CONFIG_SCSI_ADVANSYS is not set
CONFIG_SCSI_ARCMSR=m
# CONFIG_SCSI_ESAS2R is not set
# CONFIG_MEGARAID_NEWGEN is not set
# CONFIG_MEGARAID_LEGACY is not set
CONFIG_MEGARAID_SAS=m
CONFIG_SCSI_MPT3SAS=m
CONFIG_SCSI_MPT2SAS_MAX_SGE=128
CONFIG_SCSI_MPT3SAS_MAX_SGE=128
CONFIG_SCSI_MPT2SAS=m
# CONFIG_SCSI_SMARTPQI is not set
CONFIG_SCSI_UFSHCD=m
CONFIG_SCSI_UFSHCD_PCI=m
# CONFIG_SCSI_UFS_DWC_TC_PCI is not set
# CONFIG_SCSI_UFSHCD_PLATFORM is not set
# CONFIG_SCSI_UFS_BSG is not set
CONFIG_SCSI_HPTIOP=m
# CONFIG_SCSI_BUSLOGIC is not set
# CONFIG_SCSI_MYRB is not set
# CONFIG_SCSI_MYRS is not set
CONFIG_VMWARE_PVSCSI=m
# CONFIG_XEN_SCSI_FRONTEND is not set
CONFIG_HYPERV_STORAGE=m
CONFIG_LIBFC=m
CONFIG_LIBFCOE=m
CONFIG_FCOE=m
CONFIG_FCOE_FNIC=m
# CONFIG_SCSI_SNIC is not set
# CONFIG_SCSI_DMX3191D is not set
# CONFIG_SCSI_FDOMAIN_PCI is not set
# CONFIG_SCSI_GDTH is not set
CONFIG_SCSI_ISCI=m
# CONFIG_SCSI_IPS is not set
CONFIG_SCSI_INITIO=m
# CONFIG_SCSI_INIA100 is not set
# CONFIG_SCSI_PPA is not set
# CONFIG_SCSI_IMM is not set
CONFIG_SCSI_STEX=m
# CONFIG_SCSI_SYM53C8XX_2 is not set
# CONFIG_SCSI_IPR is not set
# CONFIG_SCSI_QLOGIC_1280 is not set
CONFIG_SCSI_QLA_FC=m
CONFIG_TCM_QLA2XXX=m
# CONFIG_TCM_QLA2XXX_DEBUG is not set
CONFIG_SCSI_QLA_ISCSI=m
# CONFIG_QEDI is not set
# CONFIG_QEDF is not set
# CONFIG_SCSI_LPFC is not set
# CONFIG_SCSI_DC395x is not set
# CONFIG_SCSI_AM53C974 is not set
# CONFIG_SCSI_WD719X is not set
CONFIG_SCSI_DEBUG=m
CONFIG_SCSI_PMCRAID=m
CONFIG_SCSI_PM8001=m
# CONFIG_SCSI_BFA_FC is not set
CONFIG_SCSI_VIRTIO=m
# CONFIG_SCSI_CHELSIO_FCOE is not set
CONFIG_SCSI_DH=y
CONFIG_SCSI_DH_RDAC=y
CONFIG_SCSI_DH_HP_SW=y
CONFIG_SCSI_DH_EMC=y
CONFIG_SCSI_DH_ALUA=y
# end of SCSI device support

CONFIG_ATA=y
CONFIG_ATA_VERBOSE_ERROR=y
CONFIG_ATA_ACPI=y
# CONFIG_SATA_ZPODD is not set
CONFIG_SATA_PMP=y

#
# Controllers with non-SFF native interface
#
CONFIG_SATA_AHCI=y
CONFIG_SATA_MOBILE_LPM_POLICY=0
CONFIG_SATA_AHCI_PLATFORM=y
# CONFIG_SATA_INIC162X is not set
CONFIG_SATA_ACARD_AHCI=m
CONFIG_SATA_SIL24=m
CONFIG_ATA_SFF=y

#
# SFF controllers with custom DMA interface
#
CONFIG_PDC_ADMA=m
CONFIG_SATA_QSTOR=m
CONFIG_SATA_SX4=m
CONFIG_ATA_BMDMA=y

#
# SATA SFF controllers with BMDMA
#
CONFIG_ATA_PIIX=m
# CONFIG_SATA_DWC is not set
CONFIG_SATA_MV=m
CONFIG_SATA_NV=m
CONFIG_SATA_PROMISE=m
CONFIG_SATA_SIL=m
CONFIG_SATA_SIS=m
CONFIG_SATA_SVW=m
CONFIG_SATA_ULI=m
CONFIG_SATA_VIA=m
CONFIG_SATA_VITESSE=m

#
# PATA SFF controllers with BMDMA
#
CONFIG_PATA_ALI=m
CONFIG_PATA_AMD=m
CONFIG_PATA_ARTOP=m
CONFIG_PATA_ATIIXP=m
CONFIG_PATA_ATP867X=m
CONFIG_PATA_CMD64X=m
# CONFIG_PATA_CYPRESS is not set
# CONFIG_PATA_EFAR is not set
CONFIG_PATA_HPT366=m
CONFIG_PATA_HPT37X=m
CONFIG_PATA_HPT3X2N=m
CONFIG_PATA_HPT3X3=m
# CONFIG_PATA_HPT3X3_DMA is not set
CONFIG_PATA_IT8213=m
CONFIG_PATA_IT821X=m
CONFIG_PATA_JMICRON=m
CONFIG_PATA_MARVELL=m
CONFIG_PATA_NETCELL=m
CONFIG_PATA_NINJA32=m
# CONFIG_PATA_NS87415 is not set
CONFIG_PATA_OLDPIIX=m
# CONFIG_PATA_OPTIDMA is not set
CONFIG_PATA_PDC2027X=m
CONFIG_PATA_PDC_OLD=m
# CONFIG_PATA_RADISYS is not set
CONFIG_PATA_RDC=m
CONFIG_PATA_SCH=m
CONFIG_PATA_SERVERWORKS=m
CONFIG_PATA_SIL680=m
CONFIG_PATA_SIS=m
CONFIG_PATA_TOSHIBA=m
# CONFIG_PATA_TRIFLEX is not set
CONFIG_PATA_VIA=m
# CONFIG_PATA_WINBOND is not set

#
# PIO-only SFF controllers
#
# CONFIG_PATA_CMD640_PCI is not set
# CONFIG_PATA_MPIIX is not set
# CONFIG_PATA_NS87410 is not set
# CONFIG_PATA_OPTI is not set
# CONFIG_PATA_PLATFORM is not set
# CONFIG_PATA_RZ1000 is not set

#
# Generic fallback / legacy drivers
#
CONFIG_PATA_ACPI=m
CONFIG_ATA_GENERIC=m
# CONFIG_PATA_LEGACY is not set
CONFIG_MD=y
CONFIG_BLK_DEV_MD=y
CONFIG_MD_AUTODETECT=y
CONFIG_MD_LINEAR=m
CONFIG_MD_RAID0=m
CONFIG_MD_RAID1=m
CONFIG_MD_RAID10=m
CONFIG_MD_RAID456=m
CONFIG_MD_MULTIPATH=m
CONFIG_MD_FAULTY=m
# CONFIG_MD_CLUSTER is not set
# CONFIG_BCACHE is not set
CONFIG_BLK_DEV_DM_BUILTIN=y
CONFIG_BLK_DEV_DM=m
CONFIG_DM_DEBUG=y
CONFIG_DM_BUFIO=m
# CONFIG_DM_DEBUG_BLOCK_MANAGER_LOCKING is not set
CONFIG_DM_BIO_PRISON=m
CONFIG_DM_PERSISTENT_DATA=m
# CONFIG_DM_UNSTRIPED is not set
CONFIG_DM_CRYPT=m
CONFIG_DM_SNAPSHOT=m
CONFIG_DM_THIN_PROVISIONING=m
CONFIG_DM_CACHE=m
CONFIG_DM_CACHE_SMQ=m
# CONFIG_DM_WRITECACHE is not set
CONFIG_DM_ERA=m
# CONFIG_DM_CLONE is not set
CONFIG_DM_MIRROR=m
CONFIG_DM_LOG_USERSPACE=m
CONFIG_DM_RAID=m
CONFIG_DM_ZERO=m
CONFIG_DM_MULTIPATH=m
CONFIG_DM_MULTIPATH_QL=m
CONFIG_DM_MULTIPATH_ST=m
CONFIG_DM_DELAY=m
# CONFIG_DM_DUST is not set
CONFIG_DM_UEVENT=y
CONFIG_DM_FLAKEY=m
CONFIG_DM_VERITY=m
# CONFIG_DM_VERITY_VERIFY_ROOTHASH_SIG is not set
# CONFIG_DM_VERITY_FEC is not set
CONFIG_DM_SWITCH=m
CONFIG_DM_LOG_WRITES=m
# CONFIG_DM_INTEGRITY is not set
# CONFIG_DM_ZONED is not set
CONFIG_TARGET_CORE=m
CONFIG_TCM_IBLOCK=m
CONFIG_TCM_FILEIO=m
CONFIG_TCM_PSCSI=m
CONFIG_TCM_USER2=m
CONFIG_LOOPBACK_TARGET=m
CONFIG_TCM_FC=m
CONFIG_ISCSI_TARGET=m
CONFIG_ISCSI_TARGET_CXGB4=m
# CONFIG_SBP_TARGET is not set
CONFIG_FUSION=y
CONFIG_FUSION_SPI=m
# CONFIG_FUSION_FC is not set
CONFIG_FUSION_SAS=m
CONFIG_FUSION_MAX_SGE=128
CONFIG_FUSION_CTL=m
CONFIG_FUSION_LOGGING=y

#
# IEEE 1394 (FireWire) support
#
CONFIG_FIREWIRE=m
CONFIG_FIREWIRE_OHCI=m
CONFIG_FIREWIRE_SBP2=m
CONFIG_FIREWIRE_NET=m
# CONFIG_FIREWIRE_NOSY is not set
# end of IEEE 1394 (FireWire) support

CONFIG_MACINTOSH_DRIVERS=y
CONFIG_MAC_EMUMOUSEBTN=y
CONFIG_NETDEVICES=y
CONFIG_MII=y
CONFIG_NET_CORE=y
CONFIG_BONDING=m
CONFIG_DUMMY=m
# CONFIG_EQUALIZER is not set
CONFIG_NET_FC=y
CONFIG_IFB=m
CONFIG_NET_TEAM=m
CONFIG_NET_TEAM_MODE_BROADCAST=m
CONFIG_NET_TEAM_MODE_ROUNDROBIN=m
CONFIG_NET_TEAM_MODE_RANDOM=m
CONFIG_NET_TEAM_MODE_ACTIVEBACKUP=m
CONFIG_NET_TEAM_MODE_LOADBALANCE=m
CONFIG_MACVLAN=m
CONFIG_MACVTAP=m
# CONFIG_IPVLAN is not set
CONFIG_VXLAN=m
CONFIG_GENEVE=m
# CONFIG_GTP is not set
CONFIG_MACSEC=y
CONFIG_NETCONSOLE=m
CONFIG_NETCONSOLE_DYNAMIC=y
CONFIG_NETPOLL=y
CONFIG_NET_POLL_CONTROLLER=y
CONFIG_NTB_NETDEV=m
CONFIG_TUN=m
CONFIG_TAP=m
# CONFIG_TUN_VNET_CROSS_LE is not set
CONFIG_VETH=m
CONFIG_VIRTIO_NET=m
CONFIG_NLMON=m
CONFIG_NET_VRF=y
CONFIG_VSOCKMON=m
# CONFIG_ARCNET is not set
# CONFIG_ATM_DRIVERS is not set

#
# CAIF transport drivers
#

#
# Distributed Switch Architecture drivers
#
# end of Distributed Switch Architecture drivers

CONFIG_ETHERNET=y
CONFIG_MDIO=y
# CONFIG_NET_VENDOR_3COM is not set
# CONFIG_NET_VENDOR_ADAPTEC is not set
CONFIG_NET_VENDOR_AGERE=y
# CONFIG_ET131X is not set
CONFIG_NET_VENDOR_ALACRITECH=y
# CONFIG_SLICOSS is not set
# CONFIG_NET_VENDOR_ALTEON is not set
# CONFIG_ALTERA_TSE is not set
CONFIG_NET_VENDOR_AMAZON=y
CONFIG_ENA_ETHERNET=m
CONFIG_NET_VENDOR_AMD=y
CONFIG_AMD8111_ETH=m
CONFIG_PCNET32=m
CONFIG_AMD_XGBE=m
# CONFIG_AMD_XGBE_DCB is not set
CONFIG_AMD_XGBE_HAVE_ECC=y
CONFIG_NET_VENDOR_AQUANTIA=y
CONFIG_AQTION=m
CONFIG_NET_VENDOR_ARC=y
CONFIG_NET_VENDOR_ATHEROS=y
CONFIG_ATL2=m
CONFIG_ATL1=m
CONFIG_ATL1E=m
CONFIG_ATL1C=m
CONFIG_ALX=m
CONFIG_NET_VENDOR_AURORA=y
# CONFIG_AURORA_NB8800 is not set
CONFIG_NET_VENDOR_BROADCOM=y
CONFIG_B44=m
CONFIG_B44_PCI_AUTOSELECT=y
CONFIG_B44_PCICORE_AUTOSELECT=y
CONFIG_B44_PCI=y
# CONFIG_BCMGENET is not set
CONFIG_BNX2=m
CONFIG_CNIC=m
CONFIG_TIGON3=y
CONFIG_TIGON3_HWMON=y
CONFIG_BNX2X=m
CONFIG_BNX2X_SRIOV=y
# CONFIG_SYSTEMPORT is not set
CONFIG_BNXT=m
CONFIG_BNXT_SRIOV=y
CONFIG_BNXT_FLOWER_OFFLOAD=y
CONFIG_BNXT_DCB=y
CONFIG_BNXT_HWMON=y
CONFIG_NET_VENDOR_BROCADE=y
CONFIG_BNA=m
CONFIG_NET_VENDOR_CADENCE=y
CONFIG_MACB=m
CONFIG_MACB_USE_HWSTAMP=y
# CONFIG_MACB_PCI is not set
CONFIG_NET_VENDOR_CAVIUM=y
# CONFIG_THUNDER_NIC_PF is not set
# CONFIG_THUNDER_NIC_VF is not set
# CONFIG_THUNDER_NIC_BGX is not set
# CONFIG_THUNDER_NIC_RGX is not set
CONFIG_CAVIUM_PTP=y
CONFIG_LIQUIDIO=m
CONFIG_LIQUIDIO_VF=m
CONFIG_NET_VENDOR_CHELSIO=y
# CONFIG_CHELSIO_T1 is not set
CONFIG_CHELSIO_T3=m
CONFIG_CHELSIO_T4=m
# CONFIG_CHELSIO_T4_DCB is not set
CONFIG_CHELSIO_T4VF=m
CONFIG_CHELSIO_LIB=m
CONFIG_NET_VENDOR_CISCO=y
CONFIG_ENIC=m
CONFIG_NET_VENDOR_CORTINA=y
# CONFIG_CX_ECAT is not set
CONFIG_DNET=m
CONFIG_NET_VENDOR_DEC=y
CONFIG_NET_TULIP=y
CONFIG_DE2104X=m
CONFIG_DE2104X_DSL=0
CONFIG_TULIP=y
# CONFIG_TULIP_MWI is not set
CONFIG_TULIP_MMIO=y
# CONFIG_TULIP_NAPI is not set
CONFIG_DE4X5=m
CONFIG_WINBOND_840=m
CONFIG_DM9102=m
CONFIG_ULI526X=m
CONFIG_PCMCIA_XIRCOM=m
# CONFIG_NET_VENDOR_DLINK is not set
CONFIG_NET_VENDOR_EMULEX=y
CONFIG_BE2NET=m
CONFIG_BE2NET_HWMON=y
CONFIG_BE2NET_BE2=y
CONFIG_BE2NET_BE3=y
CONFIG_BE2NET_LANCER=y
CONFIG_BE2NET_SKYHAWK=y
CONFIG_NET_VENDOR_EZCHIP=y
CONFIG_NET_VENDOR_GOOGLE=y
# CONFIG_GVE is not set
# CONFIG_NET_VENDOR_HP is not set
CONFIG_NET_VENDOR_HUAWEI=y
# CONFIG_HINIC is not set
# CONFIG_NET_VENDOR_I825XX is not set
CONFIG_NET_VENDOR_INTEL=y
# CONFIG_E100 is not set
CONFIG_E1000=y
CONFIG_E1000E=y
CONFIG_E1000E_HWTS=y
CONFIG_IGB=y
CONFIG_IGB_HWMON=y
CONFIG_IGBVF=m
# CONFIG_IXGB is not set
CONFIG_IXGBE=y
CONFIG_IXGBE_HWMON=y
CONFIG_IXGBE_DCB=y
CONFIG_IXGBEVF=m
CONFIG_I40E=y
CONFIG_I40E_DCB=y
CONFIG_IAVF=m
CONFIG_I40EVF=m
# CONFIG_ICE is not set
CONFIG_FM10K=m
# CONFIG_IGC is not set
CONFIG_JME=m
CONFIG_NET_VENDOR_MARVELL=y
CONFIG_MVMDIO=m
CONFIG_SKGE=y
# CONFIG_SKGE_DEBUG is not set
CONFIG_SKGE_GENESIS=y
CONFIG_SKY2=m
# CONFIG_SKY2_DEBUG is not set
CONFIG_NET_VENDOR_MELLANOX=y
CONFIG_MLX4_EN=m
CONFIG_MLX4_EN_DCB=y
CONFIG_MLX4_CORE=m
CONFIG_MLX4_DEBUG=y
CONFIG_MLX4_CORE_GEN2=y
# CONFIG_MLX5_CORE is not set
# CONFIG_MLXSW_CORE is not set
# CONFIG_MLXFW is not set
# CONFIG_NET_VENDOR_MICREL is not set
# CONFIG_NET_VENDOR_MICROCHIP is not set
CONFIG_NET_VENDOR_MICROSEMI=y
# CONFIG_MSCC_OCELOT_SWITCH is not set
CONFIG_NET_VENDOR_MYRI=y
CONFIG_MYRI10GE=m
CONFIG_MYRI10GE_DCA=y
# CONFIG_FEALNX is not set
# CONFIG_NET_VENDOR_NATSEMI is not set
CONFIG_NET_VENDOR_NETERION=y
# CONFIG_S2IO is not set
# CONFIG_VXGE is not set
CONFIG_NET_VENDOR_NETRONOME=y
CONFIG_NFP=m
CONFIG_NFP_APP_FLOWER=y
CONFIG_NFP_APP_ABM_NIC=y
# CONFIG_NFP_DEBUG is not set
CONFIG_NET_VENDOR_NI=y
# CONFIG_NI_XGE_MANAGEMENT_ENET is not set
# CONFIG_NET_VENDOR_NVIDIA is not set
CONFIG_NET_VENDOR_OKI=y
CONFIG_ETHOC=m
CONFIG_NET_VENDOR_PACKET_ENGINES=y
# CONFIG_HAMACHI is not set
CONFIG_YELLOWFIN=m
CONFIG_NET_VENDOR_PENSANDO=y
# CONFIG_IONIC is not set
CONFIG_NET_VENDOR_QLOGIC=y
CONFIG_QLA3XXX=m
CONFIG_QLCNIC=m
CONFIG_QLCNIC_SRIOV=y
CONFIG_QLCNIC_DCB=y
CONFIG_QLCNIC_HWMON=y
CONFIG_NETXEN_NIC=m
CONFIG_QED=m
CONFIG_QED_SRIOV=y
CONFIG_QEDE=m
CONFIG_NET_VENDOR_QUALCOMM=y
# CONFIG_QCOM_EMAC is not set
# CONFIG_RMNET is not set
# CONFIG_NET_VENDOR_RDC is not set
CONFIG_NET_VENDOR_REALTEK=y
# CONFIG_ATP is not set
CONFIG_8139CP=y
CONFIG_8139TOO=y
# CONFIG_8139TOO_PIO is not set
# CONFIG_8139TOO_TUNE_TWISTER is not set
CONFIG_8139TOO_8129=y
# CONFIG_8139_OLD_RX_RESET is not set
CONFIG_R8169=y
CONFIG_NET_VENDOR_RENESAS=y
CONFIG_NET_VENDOR_ROCKER=y
CONFIG_ROCKER=m
CONFIG_NET_VENDOR_SAMSUNG=y
# CONFIG_SXGBE_ETH is not set
# CONFIG_NET_VENDOR_SEEQ is not set
CONFIG_NET_VENDOR_SOLARFLARE=y
CONFIG_SFC=m
CONFIG_SFC_MTD=y
CONFIG_SFC_MCDI_MON=y
CONFIG_SFC_SRIOV=y
CONFIG_SFC_MCDI_LOGGING=y
CONFIG_SFC_FALCON=m
CONFIG_SFC_FALCON_MTD=y
# CONFIG_NET_VENDOR_SILAN is not set
# CONFIG_NET_VENDOR_SIS is not set
CONFIG_NET_VENDOR_SMSC=y
CONFIG_EPIC100=m
# CONFIG_SMSC911X is not set
CONFIG_SMSC9420=m
CONFIG_NET_VENDOR_SOCIONEXT=y
# CONFIG_NET_VENDOR_STMICRO is not set
# CONFIG_NET_VENDOR_SUN is not set
CONFIG_NET_VENDOR_SYNOPSYS=y
# CONFIG_DWC_XLGMAC is not set
# CONFIG_NET_VENDOR_TEHUTI is not set
CONFIG_NET_VENDOR_TI=y
# CONFIG_TI_CPSW_PHY_SEL is not set
CONFIG_TLAN=m
# CONFIG_NET_VENDOR_VIA is not set
# CONFIG_NET_VENDOR_WIZNET is not set
CONFIG_NET_VENDOR_XILINX=y
# CONFIG_XILINX_AXI_EMAC is not set
# CONFIG_XILINX_LL_TEMAC is not set
# CONFIG_FDDI is not set
# CONFIG_HIPPI is not set
# CONFIG_NET_SB1000 is not set
CONFIG_MDIO_DEVICE=y
CONFIG_MDIO_BUS=y
# CONFIG_MDIO_BCM_UNIMAC is not set
CONFIG_MDIO_BITBANG=m
# CONFIG_MDIO_GPIO is not set
# CONFIG_MDIO_MSCC_MIIM is not set
# CONFIG_MDIO_THUNDER is not set
CONFIG_PHYLIB=y
CONFIG_SWPHY=y
# CONFIG_LED_TRIGGER_PHY is not set

#
# MII PHY device drivers
#
# CONFIG_ADIN_PHY is not set
CONFIG_AMD_PHY=m
# CONFIG_AQUANTIA_PHY is not set
# CONFIG_AX88796B_PHY is not set
CONFIG_AT803X_PHY=m
# CONFIG_BCM7XXX_PHY is not set
CONFIG_BCM87XX_PHY=m
CONFIG_BCM_NET_PHYLIB=m
CONFIG_BROADCOM_PHY=m
CONFIG_CICADA_PHY=m
# CONFIG_CORTINA_PHY is not set
CONFIG_DAVICOM_PHY=m
# CONFIG_DP83822_PHY is not set
# CONFIG_DP83TC811_PHY is not set
# CONFIG_DP83848_PHY is not set
# CONFIG_DP83867_PHY is not set
CONFIG_FIXED_PHY=y
CONFIG_ICPLUS_PHY=m
# CONFIG_INTEL_XWAY_PHY is not set
CONFIG_LSI_ET1011C_PHY=m
CONFIG_LXT_PHY=m
CONFIG_MARVELL_PHY=m
# CONFIG_MARVELL_10G_PHY is not set
CONFIG_MICREL_PHY=m
# CONFIG_MICROCHIP_PHY is not set
# CONFIG_MICROCHIP_T1_PHY is not set
# CONFIG_MICROSEMI_PHY is not set
CONFIG_NATIONAL_PHY=m
# CONFIG_NXP_TJA11XX_PHY is not set
CONFIG_QSEMI_PHY=m
CONFIG_REALTEK_PHY=y
# CONFIG_RENESAS_PHY is not set
# CONFIG_ROCKCHIP_PHY is not set
CONFIG_SMSC_PHY=m
CONFIG_STE10XP=m
# CONFIG_TERANETICS_PHY is not set
CONFIG_VITESSE_PHY=m
# CONFIG_XILINX_GMII2RGMII is not set
# CONFIG_MICREL_KS8995MA is not set
# CONFIG_PLIP is not set
CONFIG_PPP=m
CONFIG_PPP_BSDCOMP=m
CONFIG_PPP_DEFLATE=m
CONFIG_PPP_FILTER=y
CONFIG_PPP_MPPE=m
CONFIG_PPP_MULTILINK=y
CONFIG_PPPOATM=m
CONFIG_PPPOE=m
CONFIG_PPTP=m
CONFIG_PPPOL2TP=m
CONFIG_PPP_ASYNC=m
CONFIG_PPP_SYNC_TTY=m
CONFIG_SLIP=m
CONFIG_SLHC=m
CONFIG_SLIP_COMPRESSED=y
CONFIG_SLIP_SMART=y
# CONFIG_SLIP_MODE_SLIP6 is not set
CONFIG_USB_NET_DRIVERS=y
CONFIG_USB_CATC=y
CONFIG_USB_KAWETH=y
CONFIG_USB_PEGASUS=y
CONFIG_USB_RTL8150=y
CONFIG_USB_RTL8152=m
# CONFIG_USB_LAN78XX is not set
CONFIG_USB_USBNET=y
CONFIG_USB_NET_AX8817X=y
CONFIG_USB_NET_AX88179_178A=m
CONFIG_USB_NET_CDCETHER=y
CONFIG_USB_NET_CDC_EEM=y
CONFIG_USB_NET_CDC_NCM=m
CONFIG_USB_NET_HUAWEI_CDC_NCM=m
CONFIG_USB_NET_CDC_MBIM=m
CONFIG_USB_NET_DM9601=y
# CONFIG_USB_NET_SR9700 is not set
# CONFIG_USB_NET_SR9800 is not set
CONFIG_USB_NET_SMSC75XX=y
CONFIG_USB_NET_SMSC95XX=y
CONFIG_USB_NET_GL620A=y
CONFIG_USB_NET_NET1080=y
CONFIG_USB_NET_PLUSB=y
CONFIG_USB_NET_MCS7830=y
CONFIG_USB_NET_RNDIS_HOST=y
CONFIG_USB_NET_CDC_SUBSET_ENABLE=y
CONFIG_USB_NET_CDC_SUBSET=y
CONFIG_USB_ALI_M5632=y
CONFIG_USB_AN2720=y
CONFIG_USB_BELKIN=y
CONFIG_USB_ARMLINUX=y
CONFIG_USB_EPSON2888=y
CONFIG_USB_KC2190=y
CONFIG_USB_NET_ZAURUS=y
CONFIG_USB_NET_CX82310_ETH=m
CONFIG_USB_NET_KALMIA=m
CONFIG_USB_NET_QMI_WWAN=m
CONFIG_USB_HSO=m
CONFIG_USB_NET_INT51X1=y
CONFIG_USB_IPHETH=y
CONFIG_USB_SIERRA_NET=y
CONFIG_USB_VL600=m
# CONFIG_USB_NET_CH9200 is not set
# CONFIG_USB_NET_AQC111 is not set
CONFIG_WLAN=y
# CONFIG_WIRELESS_WDS is not set
CONFIG_WLAN_VENDOR_ADMTEK=y
# CONFIG_ADM8211 is not set
CONFIG_ATH_COMMON=m
CONFIG_WLAN_VENDOR_ATH=y
# CONFIG_ATH_DEBUG is not set
# CONFIG_ATH5K is not set
# CONFIG_ATH5K_PCI is not set
CONFIG_ATH9K_HW=m
CONFIG_ATH9K_COMMON=m
CONFIG_ATH9K_BTCOEX_SUPPORT=y
# CONFIG_ATH9K is not set
CONFIG_ATH9K_HTC=m
# CONFIG_ATH9K_HTC_DEBUGFS is not set
# CONFIG_CARL9170 is not set
# CONFIG_ATH6KL is not set
# CONFIG_AR5523 is not set
# CONFIG_WIL6210 is not set
# CONFIG_ATH10K is not set
# CONFIG_WCN36XX is not set
CONFIG_WLAN_VENDOR_ATMEL=y
# CONFIG_ATMEL is not set
# CONFIG_AT76C50X_USB is not set
CONFIG_WLAN_VENDOR_BROADCOM=y
# CONFIG_B43 is not set
# CONFIG_B43LEGACY is not set
# CONFIG_BRCMSMAC is not set
# CONFIG_BRCMFMAC is not set
CONFIG_WLAN_VENDOR_CISCO=y
# CONFIG_AIRO is not set
CONFIG_WLAN_VENDOR_INTEL=y
# CONFIG_IPW2100 is not set
# CONFIG_IPW2200 is not set
CONFIG_IWLEGACY=m
CONFIG_IWL4965=m
CONFIG_IWL3945=m

#
# iwl3945 / iwl4965 Debugging Options
#
CONFIG_IWLEGACY_DEBUG=y
CONFIG_IWLEGACY_DEBUGFS=y
# end of iwl3945 / iwl4965 Debugging Options

CONFIG_IWLWIFI=m
CONFIG_IWLWIFI_LEDS=y
CONFIG_IWLDVM=m
CONFIG_IWLMVM=m
CONFIG_IWLWIFI_OPMODE_MODULAR=y
# CONFIG_IWLWIFI_BCAST_FILTERING is not set

#
# Debugging Options
#
# CONFIG_IWLWIFI_DEBUG is not set
CONFIG_IWLWIFI_DEBUGFS=y
# CONFIG_IWLWIFI_DEVICE_TRACING is not set
# end of Debugging Options

CONFIG_WLAN_VENDOR_INTERSIL=y
# CONFIG_HOSTAP is not set
# CONFIG_HERMES is not set
# CONFIG_P54_COMMON is not set
# CONFIG_PRISM54 is not set
CONFIG_WLAN_VENDOR_MARVELL=y
# CONFIG_LIBERTAS is not set
# CONFIG_LIBERTAS_THINFIRM is not set
# CONFIG_MWIFIEX is not set
# CONFIG_MWL8K is not set
CONFIG_WLAN_VENDOR_MEDIATEK=y
# CONFIG_MT7601U is not set
# CONFIG_MT76x0U is not set
# CONFIG_MT76x0E is not set
# CONFIG_MT76x2E is not set
# CONFIG_MT76x2U is not set
# CONFIG_MT7603E is not set
# CONFIG_MT7615E is not set
CONFIG_WLAN_VENDOR_RALINK=y
# CONFIG_RT2X00 is not set
CONFIG_WLAN_VENDOR_REALTEK=y
# CONFIG_RTL8180 is not set
# CONFIG_RTL8187 is not set
# CONFIG_RTL_CARDS is not set
# CONFIG_RTL8XXXU is not set
# CONFIG_RTW88 is not set
CONFIG_WLAN_VENDOR_RSI=y
# CONFIG_RSI_91X is not set
CONFIG_WLAN_VENDOR_ST=y
# CONFIG_CW1200 is not set
CONFIG_WLAN_VENDOR_TI=y
# CONFIG_WL1251 is not set
# CONFIG_WL12XX is not set
# CONFIG_WL18XX is not set
# CONFIG_WLCORE is not set
CONFIG_WLAN_VENDOR_ZYDAS=y
# CONFIG_USB_ZD1201 is not set
# CONFIG_ZD1211RW is not set
CONFIG_WLAN_VENDOR_QUANTENNA=y
# CONFIG_QTNFMAC_PCIE is not set
CONFIG_MAC80211_HWSIM=m
# CONFIG_USB_NET_RNDIS_WLAN is not set
# CONFIG_VIRT_WIFI is not set

#
# Enable WiMAX (Networking options) to see the WiMAX drivers
#
CONFIG_WAN=y
# CONFIG_LANMEDIA is not set
CONFIG_HDLC=m
CONFIG_HDLC_RAW=m
# CONFIG_HDLC_RAW_ETH is not set
CONFIG_HDLC_CISCO=m
CONFIG_HDLC_FR=m
CONFIG_HDLC_PPP=m

#
# X.25/LAPB support is disabled
#
# CONFIG_PCI200SYN is not set
# CONFIG_WANXL is not set
# CONFIG_PC300TOO is not set
# CONFIG_FARSYNC is not set
CONFIG_DLCI=m
CONFIG_DLCI_MAX=8
# CONFIG_SBNI is not set
CONFIG_IEEE802154_DRIVERS=m
CONFIG_IEEE802154_FAKELB=m
# CONFIG_IEEE802154_AT86RF230 is not set
# CONFIG_IEEE802154_MRF24J40 is not set
# CONFIG_IEEE802154_CC2520 is not set
# CONFIG_IEEE802154_ATUSB is not set
# CONFIG_IEEE802154_ADF7242 is not set
# CONFIG_IEEE802154_CA8210 is not set
# CONFIG_IEEE802154_MCR20A is not set
# CONFIG_IEEE802154_HWSIM is not set
CONFIG_XEN_NETDEV_FRONTEND=m
CONFIG_VMXNET3=m
CONFIG_FUJITSU_ES=m
CONFIG_THUNDERBOLT_NET=m
CONFIG_HYPERV_NET=m
CONFIG_NETDEVSIM=m
CONFIG_NET_FAILOVER=m
CONFIG_ISDN=y
CONFIG_ISDN_CAPI=m
# CONFIG_CAPI_TRACE is not set
CONFIG_ISDN_CAPI_CAPI20=m
CONFIG_ISDN_CAPI_MIDDLEWARE=y
CONFIG_MISDN=m
CONFIG_MISDN_DSP=m
CONFIG_MISDN_L1OIP=m

#
# mISDN hardware drivers
#
CONFIG_MISDN_HFCPCI=m
CONFIG_MISDN_HFCMULTI=m
CONFIG_MISDN_HFCUSB=m
CONFIG_MISDN_AVMFRITZ=m
CONFIG_MISDN_SPEEDFAX=m
CONFIG_MISDN_INFINEON=m
CONFIG_MISDN_W6692=m
CONFIG_MISDN_NETJET=m
CONFIG_MISDN_HDLC=m
CONFIG_MISDN_IPAC=m
CONFIG_MISDN_ISAR=m
CONFIG_NVM=y
# CONFIG_NVM_PBLK is not set

#
# Input device support
#
CONFIG_INPUT=y
CONFIG_INPUT_LEDS=y
CONFIG_INPUT_FF_MEMLESS=y
CONFIG_INPUT_POLLDEV=m
CONFIG_INPUT_SPARSEKMAP=m
# CONFIG_INPUT_MATRIXKMAP is not set

#
# Userland interfaces
#
CONFIG_INPUT_MOUSEDEV=y
# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024
CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768
CONFIG_INPUT_JOYDEV=m
CONFIG_INPUT_EVDEV=y
# CONFIG_INPUT_EVBUG is not set

#
# Input Device Drivers
#
CONFIG_INPUT_KEYBOARD=y
# CONFIG_KEYBOARD_ADC is not set
# CONFIG_KEYBOARD_ADP5588 is not set
# CONFIG_KEYBOARD_ADP5589 is not set
# CONFIG_KEYBOARD_APPLESPI is not set
CONFIG_KEYBOARD_ATKBD=y
# CONFIG_KEYBOARD_QT1050 is not set
# CONFIG_KEYBOARD_QT1070 is not set
# CONFIG_KEYBOARD_QT2160 is not set
# CONFIG_KEYBOARD_DLINK_DIR685 is not set
# CONFIG_KEYBOARD_LKKBD is not set
# CONFIG_KEYBOARD_GPIO is not set
# CONFIG_KEYBOARD_GPIO_POLLED is not set
# CONFIG_KEYBOARD_TCA6416 is not set
# CONFIG_KEYBOARD_TCA8418 is not set
# CONFIG_KEYBOARD_MATRIX is not set
# CONFIG_KEYBOARD_LM8323 is not set
# CONFIG_KEYBOARD_LM8333 is not set
# CONFIG_KEYBOARD_MAX7359 is not set
# CONFIG_KEYBOARD_MCS is not set
# CONFIG_KEYBOARD_MPR121 is not set
# CONFIG_KEYBOARD_NEWTON is not set
# CONFIG_KEYBOARD_OPENCORES is not set
# CONFIG_KEYBOARD_SAMSUNG is not set
# CONFIG_KEYBOARD_STOWAWAY is not set
# CONFIG_KEYBOARD_SUNKBD is not set
# CONFIG_KEYBOARD_TM2_TOUCHKEY is not set
# CONFIG_KEYBOARD_XTKBD is not set
CONFIG_INPUT_MOUSE=y
CONFIG_MOUSE_PS2=y
CONFIG_MOUSE_PS2_ALPS=y
CONFIG_MOUSE_PS2_BYD=y
CONFIG_MOUSE_PS2_LOGIPS2PP=y
CONFIG_MOUSE_PS2_SYNAPTICS=y
CONFIG_MOUSE_PS2_SYNAPTICS_SMBUS=y
CONFIG_MOUSE_PS2_CYPRESS=y
CONFIG_MOUSE_PS2_LIFEBOOK=y
CONFIG_MOUSE_PS2_TRACKPOINT=y
CONFIG_MOUSE_PS2_ELANTECH=y
CONFIG_MOUSE_PS2_ELANTECH_SMBUS=y
CONFIG_MOUSE_PS2_SENTELIC=y
# CONFIG_MOUSE_PS2_TOUCHKIT is not set
CONFIG_MOUSE_PS2_FOCALTECH=y
CONFIG_MOUSE_PS2_VMMOUSE=y
CONFIG_MOUSE_PS2_SMBUS=y
CONFIG_MOUSE_SERIAL=m
CONFIG_MOUSE_APPLETOUCH=m
CONFIG_MOUSE_BCM5974=m
CONFIG_MOUSE_CYAPA=m
# CONFIG_MOUSE_ELAN_I2C is not set
CONFIG_MOUSE_VSXXXAA=m
# CONFIG_MOUSE_GPIO is not set
CONFIG_MOUSE_SYNAPTICS_I2C=m
CONFIG_MOUSE_SYNAPTICS_USB=m
# CONFIG_INPUT_JOYSTICK is not set
CONFIG_INPUT_TABLET=y
CONFIG_TABLET_USB_ACECAD=m
CONFIG_TABLET_USB_AIPTEK=m
CONFIG_TABLET_USB_GTCO=m
# CONFIG_TABLET_USB_HANWANG is not set
CONFIG_TABLET_USB_KBTAB=m
# CONFIG_TABLET_USB_PEGASUS is not set
# CONFIG_TABLET_SERIAL_WACOM4 is not set
CONFIG_INPUT_TOUCHSCREEN=y
CONFIG_TOUCHSCREEN_PROPERTIES=y
# CONFIG_TOUCHSCREEN_ADS7846 is not set
# CONFIG_TOUCHSCREEN_AD7877 is not set
# CONFIG_TOUCHSCREEN_AD7879 is not set
# CONFIG_TOUCHSCREEN_ADC is not set
# CONFIG_TOUCHSCREEN_ATMEL_MXT is not set
# CONFIG_TOUCHSCREEN_AUO_PIXCIR is not set
# CONFIG_TOUCHSCREEN_BU21013 is not set
# CONFIG_TOUCHSCREEN_BU21029 is not set
# CONFIG_TOUCHSCREEN_CHIPONE_ICN8505 is not set
# CONFIG_TOUCHSCREEN_CY8CTMG110 is not set
# CONFIG_TOUCHSCREEN_CYTTSP_CORE is not set
# CONFIG_TOUCHSCREEN_CYTTSP4_CORE is not set
# CONFIG_TOUCHSCREEN_DYNAPRO is not set
# CONFIG_TOUCHSCREEN_HAMPSHIRE is not set
# CONFIG_TOUCHSCREEN_EETI is not set
# CONFIG_TOUCHSCREEN_EGALAX_SERIAL is not set
# CONFIG_TOUCHSCREEN_EXC3000 is not set
# CONFIG_TOUCHSCREEN_FUJITSU is not set
# CONFIG_TOUCHSCREEN_GOODIX is not set
# CONFIG_TOUCHSCREEN_HIDEEP is not set
# CONFIG_TOUCHSCREEN_ILI210X is not set
# CONFIG_TOUCHSCREEN_S6SY761 is not set
# CONFIG_TOUCHSCREEN_GUNZE is not set
# CONFIG_TOUCHSCREEN_EKTF2127 is not set
# CONFIG_TOUCHSCREEN_ELAN is not set
CONFIG_TOUCHSCREEN_ELO=m
CONFIG_TOUCHSCREEN_WACOM_W8001=m
CONFIG_TOUCHSCREEN_WACOM_I2C=m
# CONFIG_TOUCHSCREEN_MAX11801 is not set
# CONFIG_TOUCHSCREEN_MCS5000 is not set
# CONFIG_TOUCHSCREEN_MMS114 is not set
# CONFIG_TOUCHSCREEN_MELFAS_MIP4 is not set
# CONFIG_TOUCHSCREEN_MTOUCH is not set
# CONFIG_TOUCHSCREEN_INEXIO is not set
# CONFIG_TOUCHSCREEN_MK712 is not set
# CONFIG_TOUCHSCREEN_PENMOUNT is not set
# CONFIG_TOUCHSCREEN_EDT_FT5X06 is not set
# CONFIG_TOUCHSCREEN_TOUCHRIGHT is not set
# CONFIG_TOUCHSCREEN_TOUCHWIN is not set
# CONFIG_TOUCHSCREEN_PIXCIR is not set
# CONFIG_TOUCHSCREEN_WDT87XX_I2C is not set
# CONFIG_TOUCHSCREEN_WM97XX is not set
# CONFIG_TOUCHSCREEN_USB_COMPOSITE is not set
# CONFIG_TOUCHSCREEN_TOUCHIT213 is not set
# CONFIG_TOUCHSCREEN_TSC_SERIO is not set
# CONFIG_TOUCHSCREEN_TSC2004 is not set
# CONFIG_TOUCHSCREEN_TSC2005 is not set
# CONFIG_TOUCHSCREEN_TSC2007 is not set
# CONFIG_TOUCHSCREEN_RM_TS is not set
# CONFIG_TOUCHSCREEN_SILEAD is not set
# CONFIG_TOUCHSCREEN_SIS_I2C is not set
# CONFIG_TOUCHSCREEN_ST1232 is not set
# CONFIG_TOUCHSCREEN_STMFTS is not set
# CONFIG_TOUCHSCREEN_SUR40 is not set
# CONFIG_TOUCHSCREEN_SURFACE3_SPI is not set
# CONFIG_TOUCHSCREEN_SX8654 is not set
# CONFIG_TOUCHSCREEN_TPS6507X is not set
# CONFIG_TOUCHSCREEN_ZET6223 is not set
# CONFIG_TOUCHSCREEN_ZFORCE is not set
# CONFIG_TOUCHSCREEN_ROHM_BU21023 is not set
# CONFIG_TOUCHSCREEN_IQS5XX is not set
CONFIG_INPUT_MISC=y
# CONFIG_INPUT_AD714X is not set
# CONFIG_INPUT_BMA150 is not set
# CONFIG_INPUT_E3X0_BUTTON is not set
# CONFIG_INPUT_MSM_VIBRATOR is not set
CONFIG_INPUT_PCSPKR=m
# CONFIG_INPUT_MMA8450 is not set
CONFIG_INPUT_APANEL=m
CONFIG_INPUT_GP2A=m
# CONFIG_INPUT_GPIO_BEEPER is not set
# CONFIG_INPUT_GPIO_DECODER is not set
# CONFIG_INPUT_GPIO_VIBRA is not set
CONFIG_INPUT_ATLAS_BTNS=m
CONFIG_INPUT_ATI_REMOTE2=m
CONFIG_INPUT_KEYSPAN_REMOTE=m
# CONFIG_INPUT_KXTJ9 is not set
CONFIG_INPUT_POWERMATE=m
CONFIG_INPUT_YEALINK=m
CONFIG_INPUT_CM109=m
CONFIG_INPUT_UINPUT=m
# CONFIG_INPUT_PCF8574 is not set
# CONFIG_INPUT_PWM_BEEPER is not set
# CONFIG_INPUT_PWM_VIBRA is not set
CONFIG_INPUT_GPIO_ROTARY_ENCODER=m
# CONFIG_INPUT_ADXL34X is not set
# CONFIG_INPUT_IMS_PCU is not set
# CONFIG_INPUT_CMA3000 is not set
CONFIG_INPUT_XEN_KBDDEV_FRONTEND=m
# CONFIG_INPUT_IDEAPAD_SLIDEBAR is not set
# CONFIG_INPUT_DRV260X_HAPTICS is not set
# CONFIG_INPUT_DRV2665_HAPTICS is not set
# CONFIG_INPUT_DRV2667_HAPTICS is not set
CONFIG_RMI4_CORE=m
# CONFIG_RMI4_I2C is not set
# CONFIG_RMI4_SPI is not set
CONFIG_RMI4_SMB=m
CONFIG_RMI4_F03=y
CONFIG_RMI4_F03_SERIO=m
CONFIG_RMI4_2D_SENSOR=y
CONFIG_RMI4_F11=y
CONFIG_RMI4_F12=y
CONFIG_RMI4_F30=y
# CONFIG_RMI4_F34 is not set
# CONFIG_RMI4_F54 is not set
# CONFIG_RMI4_F55 is not set

#
# Hardware I/O ports
#
CONFIG_SERIO=y
CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=y
CONFIG_SERIO_I8042=y
CONFIG_SERIO_SERPORT=y
# CONFIG_SERIO_CT82C710 is not set
# CONFIG_SERIO_PARKBD is not set
# CONFIG_SERIO_PCIPS2 is not set
CONFIG_SERIO_LIBPS2=y
CONFIG_SERIO_RAW=m
CONFIG_SERIO_ALTERA_PS2=m
# CONFIG_SERIO_PS2MULT is not set
CONFIG_SERIO_ARC_PS2=m
CONFIG_HYPERV_KEYBOARD=m
# CONFIG_SERIO_GPIO_PS2 is not set
# CONFIG_USERIO is not set
# CONFIG_GAMEPORT is not set
# end of Hardware I/O ports
# end of Input device support

#
# Character devices
#
CONFIG_TTY=y
CONFIG_VT=y
CONFIG_CONSOLE_TRANSLATIONS=y
CONFIG_VT_CONSOLE=y
CONFIG_VT_CONSOLE_SLEEP=y
CONFIG_HW_CONSOLE=y
CONFIG_VT_HW_CONSOLE_BINDING=y
CONFIG_UNIX98_PTYS=y
# CONFIG_LEGACY_PTYS is not set
CONFIG_SERIAL_NONSTANDARD=y
# CONFIG_ROCKETPORT is not set
CONFIG_CYCLADES=m
# CONFIG_CYZ_INTR is not set
# CONFIG_MOXA_INTELLIO is not set
# CONFIG_MOXA_SMARTIO is not set
CONFIG_SYNCLINK=m
CONFIG_SYNCLINKMP=m
CONFIG_SYNCLINK_GT=m
CONFIG_NOZOMI=m
# CONFIG_ISI is not set
CONFIG_N_HDLC=m
CONFIG_N_GSM=m
# CONFIG_TRACE_SINK is not set
# CONFIG_NULL_TTY is not set
CONFIG_LDISC_AUTOLOAD=y
CONFIG_DEVMEM=y
# CONFIG_DEVKMEM is not set

#
# Serial drivers
#
CONFIG_SERIAL_EARLYCON=y
CONFIG_SERIAL_8250=y
# CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
CONFIG_SERIAL_8250_PNP=y
# CONFIG_SERIAL_8250_FINTEK is not set
CONFIG_SERIAL_8250_CONSOLE=y
CONFIG_SERIAL_8250_DMA=y
CONFIG_SERIAL_8250_PCI=y
CONFIG_SERIAL_8250_EXAR=y
CONFIG_SERIAL_8250_NR_UARTS=32
CONFIG_SERIAL_8250_RUNTIME_UARTS=4
CONFIG_SERIAL_8250_EXTENDED=y
CONFIG_SERIAL_8250_MANY_PORTS=y
CONFIG_SERIAL_8250_SHARE_IRQ=y
# CONFIG_SERIAL_8250_DETECT_IRQ is not set
CONFIG_SERIAL_8250_RSA=y
CONFIG_SERIAL_8250_DWLIB=y
CONFIG_SERIAL_8250_DW=y
# CONFIG_SERIAL_8250_RT288X is not set
CONFIG_SERIAL_8250_LPSS=y
CONFIG_SERIAL_8250_MID=y

#
# Non-8250 serial port support
#
# CONFIG_SERIAL_MAX3100 is not set
# CONFIG_SERIAL_MAX310X is not set
# CONFIG_SERIAL_UARTLITE is not set
CONFIG_SERIAL_CORE=y
CONFIG_SERIAL_CORE_CONSOLE=y
CONFIG_SERIAL_JSM=m
# CONFIG_SERIAL_SCCNXP is not set
# CONFIG_SERIAL_SC16IS7XX is not set
# CONFIG_SERIAL_ALTERA_JTAGUART is not set
# CONFIG_SERIAL_ALTERA_UART is not set
# CONFIG_SERIAL_IFX6X60 is not set
CONFIG_SERIAL_ARC=m
CONFIG_SERIAL_ARC_NR_PORTS=1
# CONFIG_SERIAL_RP2 is not set
# CONFIG_SERIAL_FSL_LPUART is not set
# CONFIG_SERIAL_FSL_LINFLEXUART is not set
# end of Serial drivers

CONFIG_SERIAL_MCTRL_GPIO=y
# CONFIG_SERIAL_DEV_BUS is not set
# CONFIG_TTY_PRINTK is not set
CONFIG_PRINTER=m
# CONFIG_LP_CONSOLE is not set
CONFIG_PPDEV=m
CONFIG_HVC_DRIVER=y
CONFIG_HVC_IRQ=y
CONFIG_HVC_XEN=y
CONFIG_HVC_XEN_FRONTEND=y
CONFIG_VIRTIO_CONSOLE=y
CONFIG_IPMI_HANDLER=m
CONFIG_IPMI_DMI_DECODE=y
CONFIG_IPMI_PLAT_DATA=y
# CONFIG_IPMI_PANIC_EVENT is not set
CONFIG_IPMI_DEVICE_INTERFACE=m
CONFIG_IPMI_SI=m
CONFIG_IPMI_SSIF=m
CONFIG_IPMI_WATCHDOG=m
CONFIG_IPMI_POWEROFF=m
CONFIG_HW_RANDOM=y
CONFIG_HW_RANDOM_TIMERIOMEM=m
CONFIG_HW_RANDOM_INTEL=m
CONFIG_HW_RANDOM_AMD=m
CONFIG_HW_RANDOM_VIA=m
CONFIG_HW_RANDOM_VIRTIO=y
CONFIG_NVRAM=y
# CONFIG_APPLICOM is not set
# CONFIG_MWAVE is not set
CONFIG_RAW_DRIVER=y
CONFIG_MAX_RAW_DEVS=8192
CONFIG_HPET=y
CONFIG_HPET_MMAP=y
# CONFIG_HPET_MMAP_DEFAULT is not set
CONFIG_HANGCHECK_TIMER=m
CONFIG_UV_MMTIMER=m
CONFIG_TCG_TPM=y
CONFIG_HW_RANDOM_TPM=y
CONFIG_TCG_TIS_CORE=y
CONFIG_TCG_TIS=y
# CONFIG_TCG_TIS_SPI is not set
CONFIG_TCG_TIS_I2C_ATMEL=m
CONFIG_TCG_TIS_I2C_INFINEON=m
CONFIG_TCG_TIS_I2C_NUVOTON=m
CONFIG_TCG_NSC=m
CONFIG_TCG_ATMEL=m
CONFIG_TCG_INFINEON=m
# CONFIG_TCG_XEN is not set
CONFIG_TCG_CRB=y
# CONFIG_TCG_VTPM_PROXY is not set
CONFIG_TCG_TIS_ST33ZP24=m
CONFIG_TCG_TIS_ST33ZP24_I2C=m
# CONFIG_TCG_TIS_ST33ZP24_SPI is not set
CONFIG_TELCLOCK=m
CONFIG_DEVPORT=y
# CONFIG_XILLYBUS is not set
# end of Character devices

# CONFIG_RANDOM_TRUST_CPU is not set
# CONFIG_RANDOM_TRUST_BOOTLOADER is not set

#
# I2C support
#
CONFIG_I2C=y
CONFIG_ACPI_I2C_OPREGION=y
CONFIG_I2C_BOARDINFO=y
CONFIG_I2C_COMPAT=y
CONFIG_I2C_CHARDEV=m
CONFIG_I2C_MUX=m

#
# Multiplexer I2C Chip support
#
# CONFIG_I2C_MUX_GPIO is not set
# CONFIG_I2C_MUX_LTC4306 is not set
# CONFIG_I2C_MUX_PCA9541 is not set
# CONFIG_I2C_MUX_PCA954x is not set
# CONFIG_I2C_MUX_REG is not set
# CONFIG_I2C_MUX_MLXCPLD is not set
# end of Multiplexer I2C Chip support

CONFIG_I2C_HELPER_AUTO=y
CONFIG_I2C_SMBUS=m
CONFIG_I2C_ALGOBIT=y
CONFIG_I2C_ALGOPCA=m

#
# I2C Hardware Bus support
#

#
# PC SMBus host controller drivers
#
# CONFIG_I2C_ALI1535 is not set
# CONFIG_I2C_ALI1563 is not set
# CONFIG_I2C_ALI15X3 is not set
CONFIG_I2C_AMD756=m
CONFIG_I2C_AMD756_S4882=m
CONFIG_I2C_AMD8111=m
# CONFIG_I2C_AMD_MP2 is not set
CONFIG_I2C_I801=m
CONFIG_I2C_ISCH=m
CONFIG_I2C_ISMT=m
CONFIG_I2C_PIIX4=m
CONFIG_I2C_NFORCE2=m
CONFIG_I2C_NFORCE2_S4985=m
# CONFIG_I2C_NVIDIA_GPU is not set
# CONFIG_I2C_SIS5595 is not set
# CONFIG_I2C_SIS630 is not set
CONFIG_I2C_SIS96X=m
CONFIG_I2C_VIA=m
CONFIG_I2C_VIAPRO=m

#
# ACPI drivers
#
CONFIG_I2C_SCMI=m

#
# I2C system bus drivers (mostly embedded / system-on-chip)
#
# CONFIG_I2C_CBUS_GPIO is not set
CONFIG_I2C_DESIGNWARE_CORE=m
CONFIG_I2C_DESIGNWARE_PLATFORM=m
# CONFIG_I2C_DESIGNWARE_SLAVE is not set
# CONFIG_I2C_DESIGNWARE_PCI is not set
# CONFIG_I2C_DESIGNWARE_BAYTRAIL is not set
# CONFIG_I2C_EMEV2 is not set
# CONFIG_I2C_GPIO is not set
# CONFIG_I2C_OCORES is not set
CONFIG_I2C_PCA_PLATFORM=m
CONFIG_I2C_SIMTEC=m
# CONFIG_I2C_XILINX is not set

#
# External I2C/SMBus adapter drivers
#
CONFIG_I2C_DIOLAN_U2C=m
CONFIG_I2C_PARPORT=m
CONFIG_I2C_PARPORT_LIGHT=m
# CONFIG_I2C_ROBOTFUZZ_OSIF is not set
# CONFIG_I2C_TAOS_EVM is not set
CONFIG_I2C_TINY_USB=m
CONFIG_I2C_VIPERBOARD=m

#
# Other I2C/SMBus bus drivers
#
# CONFIG_I2C_MLXCPLD is not set
# end of I2C Hardware Bus support

CONFIG_I2C_STUB=m
# CONFIG_I2C_SLAVE is not set
# CONFIG_I2C_DEBUG_CORE is not set
# CONFIG_I2C_DEBUG_ALGO is not set
# CONFIG_I2C_DEBUG_BUS is not set
# end of I2C support

# CONFIG_I3C is not set
CONFIG_SPI=y
# CONFIG_SPI_DEBUG is not set
CONFIG_SPI_MASTER=y
# CONFIG_SPI_MEM is not set

#
# SPI Master Controller Drivers
#
# CONFIG_SPI_ALTERA is not set
# CONFIG_SPI_AXI_SPI_ENGINE is not set
# CONFIG_SPI_BITBANG is not set
# CONFIG_SPI_BUTTERFLY is not set
# CONFIG_SPI_CADENCE is not set
# CONFIG_SPI_DESIGNWARE is not set
# CONFIG_SPI_NXP_FLEXSPI is not set
# CONFIG_SPI_GPIO is not set
# CONFIG_SPI_LM70_LLP is not set
# CONFIG_SPI_OC_TINY is not set
# CONFIG_SPI_PXA2XX is not set
# CONFIG_SPI_ROCKCHIP is not set
# CONFIG_SPI_SC18IS602 is not set
# CONFIG_SPI_SIFIVE is not set
# CONFIG_SPI_MXIC is not set
# CONFIG_SPI_XCOMM is not set
# CONFIG_SPI_XILINX is not set
# CONFIG_SPI_ZYNQMP_GQSPI is not set

#
# SPI Protocol Masters
#
# CONFIG_SPI_SPIDEV is not set
# CONFIG_SPI_LOOPBACK_TEST is not set
# CONFIG_SPI_TLE62X0 is not set
# CONFIG_SPI_SLAVE is not set
# CONFIG_SPMI is not set
# CONFIG_HSI is not set
CONFIG_PPS=y
# CONFIG_PPS_DEBUG is not set

#
# PPS clients support
#
# CONFIG_PPS_CLIENT_KTIMER is not set
CONFIG_PPS_CLIENT_LDISC=m
CONFIG_PPS_CLIENT_PARPORT=m
CONFIG_PPS_CLIENT_GPIO=m

#
# PPS generators support
#

#
# PTP clock support
#
CONFIG_PTP_1588_CLOCK=y
CONFIG_DP83640_PHY=m
CONFIG_PTP_1588_CLOCK_KVM=m
# end of PTP clock support

CONFIG_PINCTRL=y
CONFIG_PINMUX=y
CONFIG_PINCONF=y
CONFIG_GENERIC_PINCONF=y
# CONFIG_DEBUG_PINCTRL is not set
CONFIG_PINCTRL_AMD=m
# CONFIG_PINCTRL_MCP23S08 is not set
# CONFIG_PINCTRL_SX150X is not set
CONFIG_PINCTRL_BAYTRAIL=y
# CONFIG_PINCTRL_CHERRYVIEW is not set
CONFIG_PINCTRL_INTEL=m
# CONFIG_PINCTRL_BROXTON is not set
CONFIG_PINCTRL_CANNONLAKE=m
# CONFIG_PINCTRL_CEDARFORK is not set
CONFIG_PINCTRL_DENVERTON=m
CONFIG_PINCTRL_GEMINILAKE=m
# CONFIG_PINCTRL_ICELAKE is not set
CONFIG_PINCTRL_LEWISBURG=m
CONFIG_PINCTRL_SUNRISEPOINT=m
CONFIG_GPIOLIB=y
CONFIG_GPIOLIB_FASTPATH_LIMIT=512
CONFIG_GPIO_ACPI=y
CONFIG_GPIOLIB_IRQCHIP=y
# CONFIG_DEBUG_GPIO is not set
CONFIG_GPIO_SYSFS=y
CONFIG_GPIO_GENERIC=m

#
# Memory mapped GPIO drivers
#
CONFIG_GPIO_AMDPT=m
# CONFIG_GPIO_DWAPB is not set
# CONFIG_GPIO_EXAR is not set
# CONFIG_GPIO_GENERIC_PLATFORM is not set
CONFIG_GPIO_ICH=m
# CONFIG_GPIO_LYNXPOINT is not set
# CONFIG_GPIO_MB86S7X is not set
# CONFIG_GPIO_VX855 is not set
# CONFIG_GPIO_XILINX is not set
# CONFIG_GPIO_AMD_FCH is not set
# end of Memory mapped GPIO drivers

#
# Port-mapped I/O GPIO drivers
#
# CONFIG_GPIO_F7188X is not set
# CONFIG_GPIO_IT87 is not set
# CONFIG_GPIO_SCH is not set
# CONFIG_GPIO_SCH311X is not set
# CONFIG_GPIO_WINBOND is not set
# CONFIG_GPIO_WS16C48 is not set
# end of Port-mapped I/O GPIO drivers

#
# I2C GPIO expanders
#
# CONFIG_GPIO_ADP5588 is not set
# CONFIG_GPIO_MAX7300 is not set
# CONFIG_GPIO_MAX732X is not set
# CONFIG_GPIO_PCA953X is not set
# CONFIG_GPIO_PCF857X is not set
# CONFIG_GPIO_TPIC2810 is not set
# end of I2C GPIO expanders

#
# MFD GPIO expanders
#
# end of MFD GPIO expanders

#
# PCI GPIO expanders
#
# CONFIG_GPIO_AMD8111 is not set
# CONFIG_GPIO_ML_IOH is not set
# CONFIG_GPIO_PCI_IDIO_16 is not set
# CONFIG_GPIO_PCIE_IDIO_24 is not set
# CONFIG_GPIO_RDC321X is not set
# end of PCI GPIO expanders

#
# SPI GPIO expanders
#
# CONFIG_GPIO_MAX3191X is not set
# CONFIG_GPIO_MAX7301 is not set
# CONFIG_GPIO_MC33880 is not set
# CONFIG_GPIO_PISOSR is not set
# CONFIG_GPIO_XRA1403 is not set
# end of SPI GPIO expanders

#
# USB GPIO expanders
#
CONFIG_GPIO_VIPERBOARD=m
# end of USB GPIO expanders

CONFIG_GPIO_MOCKUP=y
# CONFIG_W1 is not set
# CONFIG_POWER_AVS is not set
CONFIG_POWER_RESET=y
# CONFIG_POWER_RESET_RESTART is not set
CONFIG_POWER_SUPPLY=y
# CONFIG_POWER_SUPPLY_DEBUG is not set
CONFIG_POWER_SUPPLY_HWMON=y
# CONFIG_PDA_POWER is not set
# CONFIG_GENERIC_ADC_BATTERY is not set
# CONFIG_TEST_POWER is not set
# CONFIG_CHARGER_ADP5061 is not set
# CONFIG_BATTERY_DS2780 is not set
# CONFIG_BATTERY_DS2781 is not set
# CONFIG_BATTERY_DS2782 is not set
# CONFIG_BATTERY_SBS is not set
# CONFIG_CHARGER_SBS is not set
# CONFIG_MANAGER_SBS is not set
# CONFIG_BATTERY_BQ27XXX is not set
# CONFIG_BATTERY_MAX17040 is not set
# CONFIG_BATTERY_MAX17042 is not set
# CONFIG_CHARGER_MAX8903 is not set
# CONFIG_CHARGER_LP8727 is not set
# CONFIG_CHARGER_GPIO is not set
# CONFIG_CHARGER_LT3651 is not set
# CONFIG_CHARGER_BQ2415X is not set
# CONFIG_CHARGER_BQ24257 is not set
# CONFIG_CHARGER_BQ24735 is not set
# CONFIG_CHARGER_BQ25890 is not set
CONFIG_CHARGER_SMB347=m
# CONFIG_BATTERY_GAUGE_LTC2941 is not set
# CONFIG_CHARGER_RT9455 is not set
CONFIG_HWMON=y
CONFIG_HWMON_VID=m
# CONFIG_HWMON_DEBUG_CHIP is not set

#
# Native drivers
#
CONFIG_SENSORS_ABITUGURU=m
CONFIG_SENSORS_ABITUGURU3=m
# CONFIG_SENSORS_AD7314 is not set
CONFIG_SENSORS_AD7414=m
CONFIG_SENSORS_AD7418=m
CONFIG_SENSORS_ADM1021=m
CONFIG_SENSORS_ADM1025=m
CONFIG_SENSORS_ADM1026=m
CONFIG_SENSORS_ADM1029=m
CONFIG_SENSORS_ADM1031=m
CONFIG_SENSORS_ADM9240=m
CONFIG_SENSORS_ADT7X10=m
# CONFIG_SENSORS_ADT7310 is not set
CONFIG_SENSORS_ADT7410=m
CONFIG_SENSORS_ADT7411=m
CONFIG_SENSORS_ADT7462=m
CONFIG_SENSORS_ADT7470=m
CONFIG_SENSORS_ADT7475=m
# CONFIG_SENSORS_AS370 is not set
CONFIG_SENSORS_ASC7621=m
CONFIG_SENSORS_K8TEMP=m
CONFIG_SENSORS_K10TEMP=m
CONFIG_SENSORS_FAM15H_POWER=m
CONFIG_SENSORS_APPLESMC=m
CONFIG_SENSORS_ASB100=m
# CONFIG_SENSORS_ASPEED is not set
CONFIG_SENSORS_ATXP1=m
CONFIG_SENSORS_DS620=m
CONFIG_SENSORS_DS1621=m
CONFIG_SENSORS_DELL_SMM=m
CONFIG_SENSORS_I5K_AMB=m
CONFIG_SENSORS_F71805F=m
CONFIG_SENSORS_F71882FG=m
CONFIG_SENSORS_F75375S=m
CONFIG_SENSORS_FSCHMD=m
# CONFIG_SENSORS_FTSTEUTATES is not set
CONFIG_SENSORS_GL518SM=m
CONFIG_SENSORS_GL520SM=m
CONFIG_SENSORS_G760A=m
# CONFIG_SENSORS_G762 is not set
# CONFIG_SENSORS_HIH6130 is not set
CONFIG_SENSORS_IBMAEM=m
CONFIG_SENSORS_IBMPEX=m
# CONFIG_SENSORS_IIO_HWMON is not set
# CONFIG_SENSORS_I5500 is not set
CONFIG_SENSORS_CORETEMP=m
CONFIG_SENSORS_IT87=m
CONFIG_SENSORS_JC42=m
# CONFIG_SENSORS_POWR1220 is not set
CONFIG_SENSORS_LINEAGE=m
# CONFIG_SENSORS_LTC2945 is not set
# CONFIG_SENSORS_LTC2990 is not set
CONFIG_SENSORS_LTC4151=m
CONFIG_SENSORS_LTC4215=m
# CONFIG_SENSORS_LTC4222 is not set
CONFIG_SENSORS_LTC4245=m
# CONFIG_SENSORS_LTC4260 is not set
CONFIG_SENSORS_LTC4261=m
# CONFIG_SENSORS_MAX1111 is not set
CONFIG_SENSORS_MAX16065=m
CONFIG_SENSORS_MAX1619=m
CONFIG_SENSORS_MAX1668=m
CONFIG_SENSORS_MAX197=m
# CONFIG_SENSORS_MAX31722 is not set
# CONFIG_SENSORS_MAX6621 is not set
CONFIG_SENSORS_MAX6639=m
CONFIG_SENSORS_MAX6642=m
CONFIG_SENSORS_MAX6650=m
CONFIG_SENSORS_MAX6697=m
# CONFIG_SENSORS_MAX31790 is not set
CONFIG_SENSORS_MCP3021=m
# CONFIG_SENSORS_TC654 is not set
# CONFIG_SENSORS_ADCXX is not set
CONFIG_SENSORS_LM63=m
# CONFIG_SENSORS_LM70 is not set
CONFIG_SENSORS_LM73=m
CONFIG_SENSORS_LM75=m
CONFIG_SENSORS_LM77=m
CONFIG_SENSORS_LM78=m
CONFIG_SENSORS_LM80=m
CONFIG_SENSORS_LM83=m
CONFIG_SENSORS_LM85=m
CONFIG_SENSORS_LM87=m
CONFIG_SENSORS_LM90=m
CONFIG_SENSORS_LM92=m
CONFIG_SENSORS_LM93=m
CONFIG_SENSORS_LM95234=m
CONFIG_SENSORS_LM95241=m
CONFIG_SENSORS_LM95245=m
CONFIG_SENSORS_PC87360=m
CONFIG_SENSORS_PC87427=m
CONFIG_SENSORS_NTC_THERMISTOR=m
# CONFIG_SENSORS_NCT6683 is not set
CONFIG_SENSORS_NCT6775=m
# CONFIG_SENSORS_NCT7802 is not set
# CONFIG_SENSORS_NCT7904 is not set
# CONFIG_SENSORS_NPCM7XX is not set
CONFIG_SENSORS_PCF8591=m
CONFIG_PMBUS=m
CONFIG_SENSORS_PMBUS=m
CONFIG_SENSORS_ADM1275=m
# CONFIG_SENSORS_IBM_CFFPS is not set
# CONFIG_SENSORS_INSPUR_IPSPS is not set
# CONFIG_SENSORS_IR35221 is not set
# CONFIG_SENSORS_IR38064 is not set
# CONFIG_SENSORS_IRPS5401 is not set
# CONFIG_SENSORS_ISL68137 is not set
CONFIG_SENSORS_LM25066=m
CONFIG_SENSORS_LTC2978=m
# CONFIG_SENSORS_LTC3815 is not set
CONFIG_SENSORS_MAX16064=m
# CONFIG_SENSORS_MAX20751 is not set
# CONFIG_SENSORS_MAX31785 is not set
CONFIG_SENSORS_MAX34440=m
CONFIG_SENSORS_MAX8688=m
# CONFIG_SENSORS_PXE1610 is not set
# CONFIG_SENSORS_TPS40422 is not set
# CONFIG_SENSORS_TPS53679 is not set
CONFIG_SENSORS_UCD9000=m
CONFIG_SENSORS_UCD9200=m
CONFIG_SENSORS_ZL6100=m
CONFIG_SENSORS_SHT15=m
CONFIG_SENSORS_SHT21=m
# CONFIG_SENSORS_SHT3x is not set
# CONFIG_SENSORS_SHTC1 is not set
CONFIG_SENSORS_SIS5595=m
CONFIG_SENSORS_DME1737=m
CONFIG_SENSORS_EMC1403=m
# CONFIG_SENSORS_EMC2103 is not set
CONFIG_SENSORS_EMC6W201=m
CONFIG_SENSORS_SMSC47M1=m
CONFIG_SENSORS_SMSC47M192=m
CONFIG_SENSORS_SMSC47B397=m
CONFIG_SENSORS_SCH56XX_COMMON=m
CONFIG_SENSORS_SCH5627=m
CONFIG_SENSORS_SCH5636=m
# CONFIG_SENSORS_STTS751 is not set
# CONFIG_SENSORS_SMM665 is not set
# CONFIG_SENSORS_ADC128D818 is not set
CONFIG_SENSORS_ADS7828=m
# CONFIG_SENSORS_ADS7871 is not set
CONFIG_SENSORS_AMC6821=m
CONFIG_SENSORS_INA209=m
CONFIG_SENSORS_INA2XX=m
# CONFIG_SENSORS_INA3221 is not set
# CONFIG_SENSORS_TC74 is not set
CONFIG_SENSORS_THMC50=m
CONFIG_SENSORS_TMP102=m
# CONFIG_SENSORS_TMP103 is not set
# CONFIG_SENSORS_TMP108 is not set
CONFIG_SENSORS_TMP401=m
CONFIG_SENSORS_TMP421=m
CONFIG_SENSORS_VIA_CPUTEMP=m
CONFIG_SENSORS_VIA686A=m
CONFIG_SENSORS_VT1211=m
CONFIG_SENSORS_VT8231=m
# CONFIG_SENSORS_W83773G is not set
CONFIG_SENSORS_W83781D=m
CONFIG_SENSORS_W83791D=m
CONFIG_SENSORS_W83792D=m
CONFIG_SENSORS_W83793=m
CONFIG_SENSORS_W83795=m
# CONFIG_SENSORS_W83795_FANCTRL is not set
CONFIG_SENSORS_W83L785TS=m
CONFIG_SENSORS_W83L786NG=m
CONFIG_SENSORS_W83627HF=m
CONFIG_SENSORS_W83627EHF=m
# CONFIG_SENSORS_XGENE is not set

#
# ACPI drivers
#
CONFIG_SENSORS_ACPI_POWER=m
CONFIG_SENSORS_ATK0110=m
CONFIG_THERMAL=y
# CONFIG_THERMAL_STATISTICS is not set
CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=0
CONFIG_THERMAL_HWMON=y
CONFIG_THERMAL_WRITABLE_TRIPS=y
CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE=y
# CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
# CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
# CONFIG_THERMAL_DEFAULT_GOV_POWER_ALLOCATOR is not set
CONFIG_THERMAL_GOV_FAIR_SHARE=y
CONFIG_THERMAL_GOV_STEP_WISE=y
CONFIG_THERMAL_GOV_BANG_BANG=y
CONFIG_THERMAL_GOV_USER_SPACE=y
# CONFIG_THERMAL_GOV_POWER_ALLOCATOR is not set
# CONFIG_CLOCK_THERMAL is not set
# CONFIG_DEVFREQ_THERMAL is not set
# CONFIG_THERMAL_EMULATION is not set

#
# Intel thermal drivers
#
CONFIG_INTEL_POWERCLAMP=m
CONFIG_X86_PKG_TEMP_THERMAL=m
CONFIG_INTEL_SOC_DTS_IOSF_CORE=m
# CONFIG_INTEL_SOC_DTS_THERMAL is not set

#
# ACPI INT340X thermal drivers
#
CONFIG_INT340X_THERMAL=m
CONFIG_ACPI_THERMAL_REL=m
# CONFIG_INT3406_THERMAL is not set
CONFIG_PROC_THERMAL_MMIO_RAPL=y
# end of ACPI INT340X thermal drivers

# CONFIG_INTEL_PCH_THERMAL is not set
# end of Intel thermal drivers

# CONFIG_GENERIC_ADC_THERMAL is not set
CONFIG_WATCHDOG=y
CONFIG_WATCHDOG_CORE=y
# CONFIG_WATCHDOG_NOWAYOUT is not set
CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED=y
CONFIG_WATCHDOG_OPEN_TIMEOUT=0
CONFIG_WATCHDOG_SYSFS=y

#
# Watchdog Pretimeout Governors
#
# CONFIG_WATCHDOG_PRETIMEOUT_GOV is not set

#
# Watchdog Device Drivers
#
CONFIG_SOFT_WATCHDOG=m
CONFIG_WDAT_WDT=m
# CONFIG_XILINX_WATCHDOG is not set
# CONFIG_ZIIRAVE_WATCHDOG is not set
# CONFIG_CADENCE_WATCHDOG is not set
# CONFIG_DW_WATCHDOG is not set
# CONFIG_MAX63XX_WATCHDOG is not set
# CONFIG_ACQUIRE_WDT is not set
# CONFIG_ADVANTECH_WDT is not set
CONFIG_ALIM1535_WDT=m
CONFIG_ALIM7101_WDT=m
# CONFIG_EBC_C384_WDT is not set
CONFIG_F71808E_WDT=m
CONFIG_SP5100_TCO=m
CONFIG_SBC_FITPC2_WATCHDOG=m
# CONFIG_EUROTECH_WDT is not set
CONFIG_IB700_WDT=m
CONFIG_IBMASR=m
# CONFIG_WAFER_WDT is not set
CONFIG_I6300ESB_WDT=y
CONFIG_IE6XX_WDT=m
CONFIG_ITCO_WDT=y
CONFIG_ITCO_VENDOR_SUPPORT=y
CONFIG_IT8712F_WDT=m
CONFIG_IT87_WDT=m
CONFIG_HP_WATCHDOG=m
CONFIG_HPWDT_NMI_DECODING=y
# CONFIG_SC1200_WDT is not set
# CONFIG_PC87413_WDT is not set
CONFIG_NV_TCO=m
# CONFIG_60XX_WDT is not set
# CONFIG_CPU5_WDT is not set
CONFIG_SMSC_SCH311X_WDT=m
# CONFIG_SMSC37B787_WDT is not set
# CONFIG_TQMX86_WDT is not set
CONFIG_VIA_WDT=m
CONFIG_W83627HF_WDT=m
CONFIG_W83877F_WDT=m
CONFIG_W83977F_WDT=m
CONFIG_MACHZ_WDT=m
# CONFIG_SBC_EPX_C3_WATCHDOG is not set
CONFIG_INTEL_MEI_WDT=m
# CONFIG_NI903X_WDT is not set
# CONFIG_NIC7018_WDT is not set
# CONFIG_MEN_A21_WDT is not set
CONFIG_XEN_WDT=m

#
# PCI-based Watchdog Cards
#
CONFIG_PCIPCWATCHDOG=m
CONFIG_WDTPCI=m

#
# USB-based Watchdog Cards
#
CONFIG_USBPCWATCHDOG=m
CONFIG_SSB_POSSIBLE=y
CONFIG_SSB=m
CONFIG_SSB_SPROM=y
CONFIG_SSB_PCIHOST_POSSIBLE=y
CONFIG_SSB_PCIHOST=y
CONFIG_SSB_SDIOHOST_POSSIBLE=y
CONFIG_SSB_SDIOHOST=y
CONFIG_SSB_DRIVER_PCICORE_POSSIBLE=y
CONFIG_SSB_DRIVER_PCICORE=y
CONFIG_SSB_DRIVER_GPIO=y
CONFIG_BCMA_POSSIBLE=y
CONFIG_BCMA=m
CONFIG_BCMA_HOST_PCI_POSSIBLE=y
CONFIG_BCMA_HOST_PCI=y
# CONFIG_BCMA_HOST_SOC is not set
CONFIG_BCMA_DRIVER_PCI=y
CONFIG_BCMA_DRIVER_GMAC_CMN=y
CONFIG_BCMA_DRIVER_GPIO=y
# CONFIG_BCMA_DEBUG is not set

#
# Multifunction device drivers
#
CONFIG_MFD_CORE=y
# CONFIG_MFD_AS3711 is not set
# CONFIG_PMIC_ADP5520 is not set
# CONFIG_MFD_AAT2870_CORE is not set
# CONFIG_MFD_BCM590XX is not set
# CONFIG_MFD_BD9571MWV is not set
# CONFIG_MFD_AXP20X_I2C is not set
# CONFIG_MFD_MADERA is not set
# CONFIG_PMIC_DA903X is not set
# CONFIG_MFD_DA9052_SPI is not set
# CONFIG_MFD_DA9052_I2C is not set
# CONFIG_MFD_DA9055 is not set
# CONFIG_MFD_DA9062 is not set
# CONFIG_MFD_DA9063 is not set
# CONFIG_MFD_DA9150 is not set
# CONFIG_MFD_DLN2 is not set
# CONFIG_MFD_MC13XXX_SPI is not set
# CONFIG_MFD_MC13XXX_I2C is not set
# CONFIG_HTC_PASIC3 is not set
# CONFIG_HTC_I2CPLD is not set
# CONFIG_MFD_INTEL_QUARK_I2C_GPIO is not set
CONFIG_LPC_ICH=m
CONFIG_LPC_SCH=m
# CONFIG_INTEL_SOC_PMIC_CHTDC_TI is not set
CONFIG_MFD_INTEL_LPSS=y
CONFIG_MFD_INTEL_LPSS_ACPI=y
CONFIG_MFD_INTEL_LPSS_PCI=y
# CONFIG_MFD_JANZ_CMODIO is not set
# CONFIG_MFD_KEMPLD is not set
# CONFIG_MFD_88PM800 is not set
# CONFIG_MFD_88PM805 is not set
# CONFIG_MFD_88PM860X is not set
# CONFIG_MFD_MAX14577 is not set
# CONFIG_MFD_MAX77693 is not set
# CONFIG_MFD_MAX77843 is not set
# CONFIG_MFD_MAX8907 is not set
# CONFIG_MFD_MAX8925 is not set
# CONFIG_MFD_MAX8997 is not set
# CONFIG_MFD_MAX8998 is not set
# CONFIG_MFD_MT6397 is not set
# CONFIG_MFD_MENF21BMC is not set
# CONFIG_EZX_PCAP is not set
CONFIG_MFD_VIPERBOARD=m
# CONFIG_MFD_RETU is not set
# CONFIG_MFD_PCF50633 is not set
# CONFIG_UCB1400_CORE is not set
# CONFIG_MFD_RDC321X is not set
# CONFIG_MFD_RT5033 is not set
# CONFIG_MFD_RC5T583 is not set
# CONFIG_MFD_SEC_CORE is not set
# CONFIG_MFD_SI476X_CORE is not set
CONFIG_MFD_SM501=m
CONFIG_MFD_SM501_GPIO=y
# CONFIG_MFD_SKY81452 is not set
# CONFIG_MFD_SMSC is not set
# CONFIG_ABX500_CORE is not set
# CONFIG_MFD_SYSCON is not set
# CONFIG_MFD_TI_AM335X_TSCADC is not set
# CONFIG_MFD_LP3943 is not set
# CONFIG_MFD_LP8788 is not set
# CONFIG_MFD_TI_LMU is not set
# CONFIG_MFD_PALMAS is not set
# CONFIG_TPS6105X is not set
# CONFIG_TPS65010 is not set
# CONFIG_TPS6507X is not set
# CONFIG_MFD_TPS65086 is not set
# CONFIG_MFD_TPS65090 is not set
# CONFIG_MFD_TI_LP873X is not set
# CONFIG_MFD_TPS6586X is not set
# CONFIG_MFD_TPS65910 is not set
# CONFIG_MFD_TPS65912_I2C is not set
# CONFIG_MFD_TPS65912_SPI is not set
# CONFIG_MFD_TPS80031 is not set
# CONFIG_TWL4030_CORE is not set
# CONFIG_TWL6040_CORE is not set
# CONFIG_MFD_WL1273_CORE is not set
# CONFIG_MFD_LM3533 is not set
# CONFIG_MFD_TQMX86 is not set
CONFIG_MFD_VX855=m
# CONFIG_MFD_ARIZONA_I2C is not set
# CONFIG_MFD_ARIZONA_SPI is not set
# CONFIG_MFD_WM8400 is not set
# CONFIG_MFD_WM831X_I2C is not set
# CONFIG_MFD_WM831X_SPI is not set
# CONFIG_MFD_WM8350_I2C is not set
# CONFIG_MFD_WM8994 is not set
# end of Multifunction device drivers

# CONFIG_REGULATOR is not set
CONFIG_RC_CORE=m
CONFIG_RC_MAP=m
CONFIG_LIRC=y
CONFIG_RC_DECODERS=y
CONFIG_IR_NEC_DECODER=m
CONFIG_IR_RC5_DECODER=m
CONFIG_IR_RC6_DECODER=m
CONFIG_IR_JVC_DECODER=m
CONFIG_IR_SONY_DECODER=m
CONFIG_IR_SANYO_DECODER=m
CONFIG_IR_SHARP_DECODER=m
CONFIG_IR_MCE_KBD_DECODER=m
# CONFIG_IR_XMP_DECODER is not set
CONFIG_IR_IMON_DECODER=m
# CONFIG_IR_RCMM_DECODER is not set
CONFIG_RC_DEVICES=y
CONFIG_RC_ATI_REMOTE=m
CONFIG_IR_ENE=m
CONFIG_IR_IMON=m
# CONFIG_IR_IMON_RAW is not set
CONFIG_IR_MCEUSB=m
CONFIG_IR_ITE_CIR=m
CONFIG_IR_FINTEK=m
CONFIG_IR_NUVOTON=m
CONFIG_IR_REDRAT3=m
CONFIG_IR_STREAMZAP=m
CONFIG_IR_WINBOND_CIR=m
# CONFIG_IR_IGORPLUGUSB is not set
CONFIG_IR_IGUANA=m
CONFIG_IR_TTUSBIR=m
CONFIG_RC_LOOPBACK=m
# CONFIG_IR_SERIAL is not set
# CONFIG_IR_SIR is not set
# CONFIG_RC_XBOX_DVD is not set
CONFIG_MEDIA_SUPPORT=m

#
# Multimedia core support
#
CONFIG_MEDIA_CAMERA_SUPPORT=y
CONFIG_MEDIA_ANALOG_TV_SUPPORT=y
CONFIG_MEDIA_DIGITAL_TV_SUPPORT=y
CONFIG_MEDIA_RADIO_SUPPORT=y
# CONFIG_MEDIA_SDR_SUPPORT is not set
# CONFIG_MEDIA_CEC_SUPPORT is not set
CONFIG_MEDIA_CONTROLLER=y
CONFIG_MEDIA_CONTROLLER_DVB=y
CONFIG_VIDEO_DEV=m
# CONFIG_VIDEO_V4L2_SUBDEV_API is not set
CONFIG_VIDEO_V4L2=m
CONFIG_VIDEO_V4L2_I2C=y
# CONFIG_VIDEO_ADV_DEBUG is not set
# CONFIG_VIDEO_FIXED_MINOR_RANGES is not set
CONFIG_VIDEO_TUNER=m
CONFIG_VIDEOBUF_GEN=m
CONFIG_VIDEOBUF_DMA_SG=m
CONFIG_VIDEOBUF_VMALLOC=m
CONFIG_DVB_CORE=m
# CONFIG_DVB_MMAP is not set
CONFIG_DVB_NET=y
CONFIG_TTPCI_EEPROM=m
CONFIG_DVB_MAX_ADAPTERS=8
CONFIG_DVB_DYNAMIC_MINORS=y
# CONFIG_DVB_DEMUX_SECTION_LOSS_LOG is not set
# CONFIG_DVB_ULE_DEBUG is not set

#
# Media drivers
#
CONFIG_MEDIA_USB_SUPPORT=y

#
# Webcam devices
#
CONFIG_USB_VIDEO_CLASS=m
CONFIG_USB_VIDEO_CLASS_INPUT_EVDEV=y
CONFIG_USB_GSPCA=m
CONFIG_USB_M5602=m
CONFIG_USB_STV06XX=m
CONFIG_USB_GL860=m
CONFIG_USB_GSPCA_BENQ=m
CONFIG_USB_GSPCA_CONEX=m
CONFIG_USB_GSPCA_CPIA1=m
# CONFIG_USB_GSPCA_DTCS033 is not set
CONFIG_USB_GSPCA_ETOMS=m
CONFIG_USB_GSPCA_FINEPIX=m
CONFIG_USB_GSPCA_JEILINJ=m
CONFIG_USB_GSPCA_JL2005BCD=m
# CONFIG_USB_GSPCA_KINECT is not set
CONFIG_USB_GSPCA_KONICA=m
CONFIG_USB_GSPCA_MARS=m
CONFIG_USB_GSPCA_MR97310A=m
CONFIG_USB_GSPCA_NW80X=m
CONFIG_USB_GSPCA_OV519=m
CONFIG_USB_GSPCA_OV534=m
CONFIG_USB_GSPCA_OV534_9=m
CONFIG_USB_GSPCA_PAC207=m
CONFIG_USB_GSPCA_PAC7302=m
CONFIG_USB_GSPCA_PAC7311=m
CONFIG_USB_GSPCA_SE401=m
CONFIG_USB_GSPCA_SN9C2028=m
CONFIG_USB_GSPCA_SN9C20X=m
CONFIG_USB_GSPCA_SONIXB=m
CONFIG_USB_GSPCA_SONIXJ=m
CONFIG_USB_GSPCA_SPCA500=m
CONFIG_USB_GSPCA_SPCA501=m
CONFIG_USB_GSPCA_SPCA505=m
CONFIG_USB_GSPCA_SPCA506=m
CONFIG_USB_GSPCA_SPCA508=m
CONFIG_USB_GSPCA_SPCA561=m
CONFIG_USB_GSPCA_SPCA1528=m
CONFIG_USB_GSPCA_SQ905=m
CONFIG_USB_GSPCA_SQ905C=m
CONFIG_USB_GSPCA_SQ930X=m
CONFIG_USB_GSPCA_STK014=m
# CONFIG_USB_GSPCA_STK1135 is not set
CONFIG_USB_GSPCA_STV0680=m
CONFIG_USB_GSPCA_SUNPLUS=m
CONFIG_USB_GSPCA_T613=m
CONFIG_USB_GSPCA_TOPRO=m
# CONFIG_USB_GSPCA_TOUPTEK is not set
CONFIG_USB_GSPCA_TV8532=m
CONFIG_USB_GSPCA_VC032X=m
CONFIG_USB_GSPCA_VICAM=m
CONFIG_USB_GSPCA_XIRLINK_CIT=m
CONFIG_USB_GSPCA_ZC3XX=m
CONFIG_USB_PWC=m
# CONFIG_USB_PWC_DEBUG is not set
CONFIG_USB_PWC_INPUT_EVDEV=y
# CONFIG_VIDEO_CPIA2 is not set
CONFIG_USB_ZR364XX=m
CONFIG_USB_STKWEBCAM=m
CONFIG_USB_S2255=m
# CONFIG_VIDEO_USBTV is not set

#
# Analog TV USB devices
#
CONFIG_VIDEO_PVRUSB2=m
CONFIG_VIDEO_PVRUSB2_SYSFS=y
CONFIG_VIDEO_PVRUSB2_DVB=y
# CONFIG_VIDEO_PVRUSB2_DEBUGIFC is not set
CONFIG_VIDEO_HDPVR=m
CONFIG_VIDEO_USBVISION=m
# CONFIG_VIDEO_STK1160_COMMON is not set
# CONFIG_VIDEO_GO7007 is not set

#
# Analog/digital TV USB devices
#
CONFIG_VIDEO_AU0828=m
CONFIG_VIDEO_AU0828_V4L2=y
# CONFIG_VIDEO_AU0828_RC is not set
CONFIG_VIDEO_CX231XX=m
CONFIG_VIDEO_CX231XX_RC=y
CONFIG_VIDEO_CX231XX_ALSA=m
CONFIG_VIDEO_CX231XX_DVB=m
CONFIG_VIDEO_TM6000=m
CONFIG_VIDEO_TM6000_ALSA=m
CONFIG_VIDEO_TM6000_DVB=m

#
# Digital TV USB devices
#
CONFIG_DVB_USB=m
# CONFIG_DVB_USB_DEBUG is not set
CONFIG_DVB_USB_DIB3000MC=m
CONFIG_DVB_USB_A800=m
CONFIG_DVB_USB_DIBUSB_MB=m
# CONFIG_DVB_USB_DIBUSB_MB_FAULTY is not set
CONFIG_DVB_USB_DIBUSB_MC=m
CONFIG_DVB_USB_DIB0700=m
CONFIG_DVB_USB_UMT_010=m
CONFIG_DVB_USB_CXUSB=m
# CONFIG_DVB_USB_CXUSB_ANALOG is not set
CONFIG_DVB_USB_M920X=m
CONFIG_DVB_USB_DIGITV=m
CONFIG_DVB_USB_VP7045=m
CONFIG_DVB_USB_VP702X=m
CONFIG_DVB_USB_GP8PSK=m
CONFIG_DVB_USB_NOVA_T_USB2=m
CONFIG_DVB_USB_TTUSB2=m
CONFIG_DVB_USB_DTT200U=m
CONFIG_DVB_USB_OPERA1=m
CONFIG_DVB_USB_AF9005=m
CONFIG_DVB_USB_AF9005_REMOTE=m
CONFIG_DVB_USB_PCTV452E=m
CONFIG_DVB_USB_DW2102=m
CONFIG_DVB_USB_CINERGY_T2=m
CONFIG_DVB_USB_DTV5100=m
CONFIG_DVB_USB_AZ6027=m
CONFIG_DVB_USB_TECHNISAT_USB2=m
CONFIG_DVB_USB_V2=m
CONFIG_DVB_USB_AF9015=m
CONFIG_DVB_USB_AF9035=m
CONFIG_DVB_USB_ANYSEE=m
CONFIG_DVB_USB_AU6610=m
CONFIG_DVB_USB_AZ6007=m
CONFIG_DVB_USB_CE6230=m
CONFIG_DVB_USB_EC168=m
CONFIG_DVB_USB_GL861=m
CONFIG_DVB_USB_LME2510=m
CONFIG_DVB_USB_MXL111SF=m
CONFIG_DVB_USB_RTL28XXU=m
# CONFIG_DVB_USB_DVBSKY is not set
# CONFIG_DVB_USB_ZD1301 is not set
CONFIG_DVB_TTUSB_BUDGET=m
CONFIG_DVB_TTUSB_DEC=m
CONFIG_SMS_USB_DRV=m
CONFIG_DVB_B2C2_FLEXCOP_USB=m
# CONFIG_DVB_B2C2_FLEXCOP_USB_DEBUG is not set
# CONFIG_DVB_AS102 is not set

#
# Webcam, TV (analog/digital) USB devices
#
CONFIG_VIDEO_EM28XX=m
# CONFIG_VIDEO_EM28XX_V4L2 is not set
CONFIG_VIDEO_EM28XX_ALSA=m
CONFIG_VIDEO_EM28XX_DVB=m
CONFIG_VIDEO_EM28XX_RC=m
CONFIG_MEDIA_PCI_SUPPORT=y

#
# Media capture support
#
# CONFIG_VIDEO_MEYE is not set
# CONFIG_VIDEO_SOLO6X10 is not set
# CONFIG_VIDEO_TW5864 is not set
# CONFIG_VIDEO_TW68 is not set
# CONFIG_VIDEO_TW686X is not set

#
# Media capture/analog TV support
#
CONFIG_VIDEO_IVTV=m
# CONFIG_VIDEO_IVTV_DEPRECATED_IOCTLS is not set
# CONFIG_VIDEO_IVTV_ALSA is not set
CONFIG_VIDEO_FB_IVTV=m
# CONFIG_VIDEO_FB_IVTV_FORCE_PAT is not set
# CONFIG_VIDEO_HEXIUM_GEMINI is not set
# CONFIG_VIDEO_HEXIUM_ORION is not set
# CONFIG_VIDEO_MXB is not set
# CONFIG_VIDEO_DT3155 is not set

#
# Media capture/analog/hybrid TV support
#
CONFIG_VIDEO_CX18=m
CONFIG_VIDEO_CX18_ALSA=m
CONFIG_VIDEO_CX23885=m
CONFIG_MEDIA_ALTERA_CI=m
# CONFIG_VIDEO_CX25821 is not set
CONFIG_VIDEO_CX88=m
CONFIG_VIDEO_CX88_ALSA=m
CONFIG_VIDEO_CX88_BLACKBIRD=m
CONFIG_VIDEO_CX88_DVB=m
CONFIG_VIDEO_CX88_ENABLE_VP3054=y
CONFIG_VIDEO_CX88_VP3054=m
CONFIG_VIDEO_CX88_MPEG=m
CONFIG_VIDEO_BT848=m
CONFIG_DVB_BT8XX=m
CONFIG_VIDEO_SAA7134=m
CONFIG_VIDEO_SAA7134_ALSA=m
CONFIG_VIDEO_SAA7134_RC=y
CONFIG_VIDEO_SAA7134_DVB=m
CONFIG_VIDEO_SAA7164=m

#
# Media digital TV PCI Adapters
#
CONFIG_DVB_AV7110_IR=y
CONFIG_DVB_AV7110=m
CONFIG_DVB_AV7110_OSD=y
CONFIG_DVB_BUDGET_CORE=m
CONFIG_DVB_BUDGET=m
CONFIG_DVB_BUDGET_CI=m
CONFIG_DVB_BUDGET_AV=m
CONFIG_DVB_BUDGET_PATCH=m
CONFIG_DVB_B2C2_FLEXCOP_PCI=m
# CONFIG_DVB_B2C2_FLEXCOP_PCI_DEBUG is not set
CONFIG_DVB_PLUTO2=m
CONFIG_DVB_DM1105=m
CONFIG_DVB_PT1=m
# CONFIG_DVB_PT3 is not set
CONFIG_MANTIS_CORE=m
CONFIG_DVB_MANTIS=m
CONFIG_DVB_HOPPER=m
CONFIG_DVB_NGENE=m
CONFIG_DVB_DDBRIDGE=m
# CONFIG_DVB_DDBRIDGE_MSIENABLE is not set
# CONFIG_DVB_SMIPCIE is not set
# CONFIG_DVB_NETUP_UNIDVB is not set
# CONFIG_V4L_PLATFORM_DRIVERS is not set
# CONFIG_V4L_MEM2MEM_DRIVERS is not set
# CONFIG_V4L_TEST_DRIVERS is not set
# CONFIG_DVB_PLATFORM_DRIVERS is not set

#
# Supported MMC/SDIO adapters
#
CONFIG_SMS_SDIO_DRV=m
CONFIG_RADIO_ADAPTERS=y
CONFIG_RADIO_TEA575X=m
# CONFIG_RADIO_SI470X is not set
# CONFIG_RADIO_SI4713 is not set
# CONFIG_USB_MR800 is not set
# CONFIG_USB_DSBR is not set
# CONFIG_RADIO_MAXIRADIO is not set
# CONFIG_RADIO_SHARK is not set
# CONFIG_RADIO_SHARK2 is not set
# CONFIG_USB_KEENE is not set
# CONFIG_USB_RAREMONO is not set
# CONFIG_USB_MA901 is not set
# CONFIG_RADIO_TEA5764 is not set
# CONFIG_RADIO_SAA7706H is not set
# CONFIG_RADIO_TEF6862 is not set
# CONFIG_RADIO_WL1273 is not set

#
# Texas Instruments WL128x FM driver (ST based)
#
# end of Texas Instruments WL128x FM driver (ST based)

#
# Supported FireWire (IEEE 1394) Adapters
#
CONFIG_DVB_FIREDTV=m
CONFIG_DVB_FIREDTV_INPUT=y
CONFIG_MEDIA_COMMON_OPTIONS=y

#
# common driver options
#
CONFIG_VIDEO_CX2341X=m
CONFIG_VIDEO_TVEEPROM=m
CONFIG_CYPRESS_FIRMWARE=m
CONFIG_VIDEOBUF2_CORE=m
CONFIG_VIDEOBUF2_V4L2=m
CONFIG_VIDEOBUF2_MEMOPS=m
CONFIG_VIDEOBUF2_VMALLOC=m
CONFIG_VIDEOBUF2_DMA_SG=m
CONFIG_VIDEOBUF2_DVB=m
CONFIG_DVB_B2C2_FLEXCOP=m
CONFIG_VIDEO_SAA7146=m
CONFIG_VIDEO_SAA7146_VV=m
CONFIG_SMS_SIANO_MDTV=m
CONFIG_SMS_SIANO_RC=y
# CONFIG_SMS_SIANO_DEBUGFS is not set

#
# Media ancillary drivers (tuners, sensors, i2c, spi, frontends)
#
CONFIG_MEDIA_SUBDRV_AUTOSELECT=y
CONFIG_MEDIA_ATTACH=y
CONFIG_VIDEO_IR_I2C=m

#
# I2C Encoders, decoders, sensors and other helper chips
#

#
# Audio decoders, processors and mixers
#
CONFIG_VIDEO_TVAUDIO=m
CONFIG_VIDEO_TDA7432=m
# CONFIG_VIDEO_TDA9840 is not set
# CONFIG_VIDEO_TEA6415C is not set
# CONFIG_VIDEO_TEA6420 is not set
CONFIG_VIDEO_MSP3400=m
CONFIG_VIDEO_CS3308=m
CONFIG_VIDEO_CS5345=m
CONFIG_VIDEO_CS53L32A=m
# CONFIG_VIDEO_TLV320AIC23B is not set
# CONFIG_VIDEO_UDA1342 is not set
CONFIG_VIDEO_WM8775=m
CONFIG_VIDEO_WM8739=m
CONFIG_VIDEO_VP27SMPX=m
# CONFIG_VIDEO_SONY_BTF_MPX is not set

#
# RDS decoders
#
CONFIG_VIDEO_SAA6588=m

#
# Video decoders
#
# CONFIG_VIDEO_ADV7183 is not set
# CONFIG_VIDEO_BT819 is not set
# CONFIG_VIDEO_BT856 is not set
# CONFIG_VIDEO_BT866 is not set
# CONFIG_VIDEO_KS0127 is not set
# CONFIG_VIDEO_ML86V7667 is not set
# CONFIG_VIDEO_SAA7110 is not set
CONFIG_VIDEO_SAA711X=m
# CONFIG_VIDEO_TVP514X is not set
# CONFIG_VIDEO_TVP5150 is not set
# CONFIG_VIDEO_TVP7002 is not set
# CONFIG_VIDEO_TW2804 is not set
# CONFIG_VIDEO_TW9903 is not set
# CONFIG_VIDEO_TW9906 is not set
# CONFIG_VIDEO_TW9910 is not set
# CONFIG_VIDEO_VPX3220 is not set

#
# Video and audio decoders
#
CONFIG_VIDEO_SAA717X=m
CONFIG_VIDEO_CX25840=m

#
# Video encoders
#
CONFIG_VIDEO_SAA7127=m
# CONFIG_VIDEO_SAA7185 is not set
# CONFIG_VIDEO_ADV7170 is not set
# CONFIG_VIDEO_ADV7175 is not set
# CONFIG_VIDEO_ADV7343 is not set
# CONFIG_VIDEO_ADV7393 is not set
# CONFIG_VIDEO_AK881X is not set
# CONFIG_VIDEO_THS8200 is not set

#
# Camera sensor devices
#
# CONFIG_VIDEO_OV2640 is not set
# CONFIG_VIDEO_OV2659 is not set
# CONFIG_VIDEO_OV2680 is not set
# CONFIG_VIDEO_OV2685 is not set
# CONFIG_VIDEO_OV6650 is not set
# CONFIG_VIDEO_OV5695 is not set
# CONFIG_VIDEO_OV772X is not set
# CONFIG_VIDEO_OV7640 is not set
# CONFIG_VIDEO_OV7670 is not set
# CONFIG_VIDEO_OV7740 is not set
# CONFIG_VIDEO_OV9640 is not set
# CONFIG_VIDEO_VS6624 is not set
# CONFIG_VIDEO_MT9M111 is not set
# CONFIG_VIDEO_MT9T112 is not set
# CONFIG_VIDEO_MT9V011 is not set
# CONFIG_VIDEO_MT9V111 is not set
# CONFIG_VIDEO_SR030PC30 is not set
# CONFIG_VIDEO_RJ54N1 is not set

#
# Lens drivers
#
# CONFIG_VIDEO_AD5820 is not set

#
# Flash devices
#
# CONFIG_VIDEO_ADP1653 is not set
# CONFIG_VIDEO_LM3560 is not set
# CONFIG_VIDEO_LM3646 is not set

#
# Video improvement chips
#
CONFIG_VIDEO_UPD64031A=m
CONFIG_VIDEO_UPD64083=m

#
# Audio/Video compression chips
#
CONFIG_VIDEO_SAA6752HS=m

#
# SDR tuner chips
#

#
# Miscellaneous helper chips
#
# CONFIG_VIDEO_THS7303 is not set
CONFIG_VIDEO_M52790=m
# CONFIG_VIDEO_I2C is not set
# end of I2C Encoders, decoders, sensors and other helper chips

#
# SPI helper chips
#
# end of SPI helper chips

#
# Media SPI Adapters
#
# CONFIG_CXD2880_SPI_DRV is not set
# end of Media SPI Adapters

CONFIG_MEDIA_TUNER=m

#
# Customize TV tuners
#
CONFIG_MEDIA_TUNER_SIMPLE=m
CONFIG_MEDIA_TUNER_TDA18250=m
CONFIG_MEDIA_TUNER_TDA8290=m
CONFIG_MEDIA_TUNER_TDA827X=m
CONFIG_MEDIA_TUNER_TDA18271=m
CONFIG_MEDIA_TUNER_TDA9887=m
CONFIG_MEDIA_TUNER_TEA5761=m
CONFIG_MEDIA_TUNER_TEA5767=m
# CONFIG_MEDIA_TUNER_MSI001 is not set
CONFIG_MEDIA_TUNER_MT20XX=m
CONFIG_MEDIA_TUNER_MT2060=m
CONFIG_MEDIA_TUNER_MT2063=m
CONFIG_MEDIA_TUNER_MT2266=m
CONFIG_MEDIA_TUNER_MT2131=m
CONFIG_MEDIA_TUNER_QT1010=m
CONFIG_MEDIA_TUNER_XC2028=m
CONFIG_MEDIA_TUNER_XC5000=m
CONFIG_MEDIA_TUNER_XC4000=m
CONFIG_MEDIA_TUNER_MXL5005S=m
CONFIG_MEDIA_TUNER_MXL5007T=m
CONFIG_MEDIA_TUNER_MC44S803=m
CONFIG_MEDIA_TUNER_MAX2165=m
CONFIG_MEDIA_TUNER_TDA18218=m
CONFIG_MEDIA_TUNER_FC0011=m
CONFIG_MEDIA_TUNER_FC0012=m
CONFIG_MEDIA_TUNER_FC0013=m
CONFIG_MEDIA_TUNER_TDA18212=m
CONFIG_MEDIA_TUNER_E4000=m
CONFIG_MEDIA_TUNER_FC2580=m
CONFIG_MEDIA_TUNER_M88RS6000T=m
CONFIG_MEDIA_TUNER_TUA9001=m
CONFIG_MEDIA_TUNER_SI2157=m
CONFIG_MEDIA_TUNER_IT913X=m
CONFIG_MEDIA_TUNER_R820T=m
# CONFIG_MEDIA_TUNER_MXL301RF is not set
CONFIG_MEDIA_TUNER_QM1D1C0042=m
CONFIG_MEDIA_TUNER_QM1D1B0004=m
# end of Customize TV tuners

#
# Customise DVB Frontends
#

#
# Multistandard (satellite) frontends
#
CONFIG_DVB_STB0899=m
CONFIG_DVB_STB6100=m
CONFIG_DVB_STV090x=m
CONFIG_DVB_STV0910=m
CONFIG_DVB_STV6110x=m
CONFIG_DVB_STV6111=m
CONFIG_DVB_MXL5XX=m
CONFIG_DVB_M88DS3103=m

#
# Multistandard (cable + terrestrial) frontends
#
CONFIG_DVB_DRXK=m
CONFIG_DVB_TDA18271C2DD=m
CONFIG_DVB_SI2165=m
CONFIG_DVB_MN88472=m
CONFIG_DVB_MN88473=m

#
# DVB-S (satellite) frontends
#
CONFIG_DVB_CX24110=m
CONFIG_DVB_CX24123=m
CONFIG_DVB_MT312=m
CONFIG_DVB_ZL10036=m
CONFIG_DVB_ZL10039=m
CONFIG_DVB_S5H1420=m
CONFIG_DVB_STV0288=m
CONFIG_DVB_STB6000=m
CONFIG_DVB_STV0299=m
CONFIG_DVB_STV6110=m
CONFIG_DVB_STV0900=m
CONFIG_DVB_TDA8083=m
CONFIG_DVB_TDA10086=m
CONFIG_DVB_TDA8261=m
CONFIG_DVB_VES1X93=m
CONFIG_DVB_TUNER_ITD1000=m
CONFIG_DVB_TUNER_CX24113=m
CONFIG_DVB_TDA826X=m
CONFIG_DVB_TUA6100=m
CONFIG_DVB_CX24116=m
CONFIG_DVB_CX24117=m
CONFIG_DVB_CX24120=m
CONFIG_DVB_SI21XX=m
CONFIG_DVB_TS2020=m
CONFIG_DVB_DS3000=m
CONFIG_DVB_MB86A16=m
CONFIG_DVB_TDA10071=m

#
# DVB-T (terrestrial) frontends
#
CONFIG_DVB_SP8870=m
CONFIG_DVB_SP887X=m
CONFIG_DVB_CX22700=m
CONFIG_DVB_CX22702=m
# CONFIG_DVB_S5H1432 is not set
CONFIG_DVB_DRXD=m
CONFIG_DVB_L64781=m
CONFIG_DVB_TDA1004X=m
CONFIG_DVB_NXT6000=m
CONFIG_DVB_MT352=m
CONFIG_DVB_ZL10353=m
CONFIG_DVB_DIB3000MB=m
CONFIG_DVB_DIB3000MC=m
CONFIG_DVB_DIB7000M=m
CONFIG_DVB_DIB7000P=m
# CONFIG_DVB_DIB9000 is not set
CONFIG_DVB_TDA10048=m
CONFIG_DVB_AF9013=m
CONFIG_DVB_EC100=m
CONFIG_DVB_STV0367=m
CONFIG_DVB_CXD2820R=m
CONFIG_DVB_CXD2841ER=m
CONFIG_DVB_RTL2830=m
CONFIG_DVB_RTL2832=m
CONFIG_DVB_SI2168=m
# CONFIG_DVB_ZD1301_DEMOD is not set
CONFIG_DVB_GP8PSK_FE=m
# CONFIG_DVB_CXD2880 is not set

#
# DVB-C (cable) frontends
#
CONFIG_DVB_VES1820=m
CONFIG_DVB_TDA10021=m
CONFIG_DVB_TDA10023=m
CONFIG_DVB_STV0297=m

#
# ATSC (North American/Korean Terrestrial/Cable DTV) frontends
#
CONFIG_DVB_NXT200X=m
CONFIG_DVB_OR51211=m
CONFIG_DVB_OR51132=m
CONFIG_DVB_BCM3510=m
CONFIG_DVB_LGDT330X=m
CONFIG_DVB_LGDT3305=m
CONFIG_DVB_LGDT3306A=m
CONFIG_DVB_LG2160=m
CONFIG_DVB_S5H1409=m
CONFIG_DVB_AU8522=m
CONFIG_DVB_AU8522_DTV=m
CONFIG_DVB_AU8522_V4L=m
CONFIG_DVB_S5H1411=m

#
# ISDB-T (terrestrial) frontends
#
CONFIG_DVB_S921=m
CONFIG_DVB_DIB8000=m
CONFIG_DVB_MB86A20S=m

#
# ISDB-S (satellite) & ISDB-T (terrestrial) frontends
#
CONFIG_DVB_TC90522=m
# CONFIG_DVB_MN88443X is not set

#
# Digital terrestrial only tuners/PLL
#
CONFIG_DVB_PLL=m
CONFIG_DVB_TUNER_DIB0070=m
CONFIG_DVB_TUNER_DIB0090=m

#
# SEC control devices for DVB-S
#
CONFIG_DVB_DRX39XYJ=m
CONFIG_DVB_LNBH25=m
# CONFIG_DVB_LNBH29 is not set
CONFIG_DVB_LNBP21=m
CONFIG_DVB_LNBP22=m
CONFIG_DVB_ISL6405=m
CONFIG_DVB_ISL6421=m
CONFIG_DVB_ISL6423=m
CONFIG_DVB_A8293=m
# CONFIG_DVB_LGS8GL5 is not set
CONFIG_DVB_LGS8GXX=m
CONFIG_DVB_ATBM8830=m
CONFIG_DVB_TDA665x=m
CONFIG_DVB_IX2505V=m
CONFIG_DVB_M88RS2000=m
CONFIG_DVB_AF9033=m
# CONFIG_DVB_HORUS3A is not set
# CONFIG_DVB_ASCOT2E is not set
# CONFIG_DVB_HELENE is not set

#
# Common Interface (EN50221) controller drivers
#
CONFIG_DVB_CXD2099=m
# CONFIG_DVB_SP2 is not set

#
# Tools to develop new frontends
#
CONFIG_DVB_DUMMY_FE=m
# end of Customise DVB Frontends

#
# Graphics support
#
CONFIG_AGP=y
CONFIG_AGP_AMD64=y
CONFIG_AGP_INTEL=y
CONFIG_AGP_SIS=y
CONFIG_AGP_VIA=y
CONFIG_INTEL_GTT=y
CONFIG_VGA_ARB=y
CONFIG_VGA_ARB_MAX_GPUS=64
CONFIG_VGA_SWITCHEROO=y
CONFIG_DRM=m
CONFIG_DRM_MIPI_DSI=y
CONFIG_DRM_DP_AUX_CHARDEV=y
CONFIG_DRM_DEBUG_SELFTEST=m
CONFIG_DRM_KMS_HELPER=m
CONFIG_DRM_KMS_FB_HELPER=y
CONFIG_DRM_FBDEV_EMULATION=y
CONFIG_DRM_FBDEV_OVERALLOC=100
# CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM is not set
CONFIG_DRM_LOAD_EDID_FIRMWARE=y
# CONFIG_DRM_DP_CEC is not set
CONFIG_DRM_TTM=m
CONFIG_DRM_VRAM_HELPER=m
CONFIG_DRM_GEM_SHMEM_HELPER=y

#
# I2C encoder or helper chips
#
CONFIG_DRM_I2C_CH7006=m
CONFIG_DRM_I2C_SIL164=m
# CONFIG_DRM_I2C_NXP_TDA998X is not set
# CONFIG_DRM_I2C_NXP_TDA9950 is not set
# end of I2C encoder or helper chips

#
# ARM devices
#
# end of ARM devices

# CONFIG_DRM_RADEON is not set
# CONFIG_DRM_AMDGPU is not set

#
# ACP (Audio CoProcessor) Configuration
#
# end of ACP (Audio CoProcessor) Configuration

# CONFIG_DRM_NOUVEAU is not set
CONFIG_DRM_I915=m
# CONFIG_DRM_I915_ALPHA_SUPPORT is not set
CONFIG_DRM_I915_FORCE_PROBE=""
CONFIG_DRM_I915_CAPTURE_ERROR=y
CONFIG_DRM_I915_COMPRESS_ERROR=y
CONFIG_DRM_I915_USERPTR=y
CONFIG_DRM_I915_GVT=y
CONFIG_DRM_I915_GVT_KVMGT=m

#
# drm/i915 Debugging
#
# CONFIG_DRM_I915_WERROR is not set
# CONFIG_DRM_I915_DEBUG is not set
# CONFIG_DRM_I915_DEBUG_MMIO is not set
# CONFIG_DRM_I915_SW_FENCE_DEBUG_OBJECTS is not set
# CONFIG_DRM_I915_SW_FENCE_CHECK_DAG is not set
# CONFIG_DRM_I915_DEBUG_GUC is not set
# CONFIG_DRM_I915_SELFTEST is not set
# CONFIG_DRM_I915_LOW_LEVEL_TRACEPOINTS is not set
# CONFIG_DRM_I915_DEBUG_VBLANK_EVADE is not set
# CONFIG_DRM_I915_DEBUG_RUNTIME_PM is not set
# end of drm/i915 Debugging

#
# drm/i915 Profile Guided Optimisation
#
CONFIG_DRM_I915_USERFAULT_AUTOSUSPEND=250
CONFIG_DRM_I915_SPIN_REQUEST=5
# end of drm/i915 Profile Guided Optimisation

CONFIG_DRM_VGEM=m
# CONFIG_DRM_VKMS is not set
CONFIG_DRM_VMWGFX=m
CONFIG_DRM_VMWGFX_FBCON=y
CONFIG_DRM_GMA500=m
CONFIG_DRM_GMA600=y
CONFIG_DRM_GMA3600=y
CONFIG_DRM_UDL=m
CONFIG_DRM_AST=m
CONFIG_DRM_MGAG200=m
CONFIG_DRM_CIRRUS_QEMU=m
CONFIG_DRM_QXL=m
CONFIG_DRM_BOCHS=m
CONFIG_DRM_VIRTIO_GPU=m
CONFIG_DRM_PANEL=y

#
# Display Panels
#
# CONFIG_DRM_PANEL_RASPBERRYPI_TOUCHSCREEN is not set
# end of Display Panels

CONFIG_DRM_BRIDGE=y
CONFIG_DRM_PANEL_BRIDGE=y

#
# Display Interface Bridges
#
# CONFIG_DRM_ANALOGIX_ANX78XX is not set
# end of Display Interface Bridges

# CONFIG_DRM_ETNAVIV is not set
# CONFIG_DRM_GM12U320 is not set
# CONFIG_TINYDRM_HX8357D is not set
# CONFIG_TINYDRM_ILI9225 is not set
# CONFIG_TINYDRM_ILI9341 is not set
# CONFIG_TINYDRM_MI0283QT is not set
# CONFIG_TINYDRM_REPAPER is not set
# CONFIG_TINYDRM_ST7586 is not set
# CONFIG_TINYDRM_ST7735R is not set
# CONFIG_DRM_XEN is not set
# CONFIG_DRM_VBOXVIDEO is not set
# CONFIG_DRM_LEGACY is not set
CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=y
CONFIG_DRM_LIB_RANDOM=y

#
# Frame buffer Devices
#
CONFIG_FB_CMDLINE=y
CONFIG_FB_NOTIFY=y
CONFIG_FB=y
# CONFIG_FIRMWARE_EDID is not set
CONFIG_FB_BOOT_VESA_SUPPORT=y
CONFIG_FB_CFB_FILLRECT=y
CONFIG_FB_CFB_COPYAREA=y
CONFIG_FB_CFB_IMAGEBLIT=y
CONFIG_FB_SYS_FILLRECT=m
CONFIG_FB_SYS_COPYAREA=m
CONFIG_FB_SYS_IMAGEBLIT=m
# CONFIG_FB_FOREIGN_ENDIAN is not set
CONFIG_FB_SYS_FOPS=m
CONFIG_FB_DEFERRED_IO=y
# CONFIG_FB_MODE_HELPERS is not set
CONFIG_FB_TILEBLITTING=y

#
# Frame buffer hardware drivers
#
# CONFIG_FB_CIRRUS is not set
# CONFIG_FB_PM2 is not set
# CONFIG_FB_CYBER2000 is not set
# CONFIG_FB_ARC is not set
# CONFIG_FB_ASILIANT is not set
# CONFIG_FB_IMSTT is not set
# CONFIG_FB_VGA16 is not set
# CONFIG_FB_UVESA is not set
CONFIG_FB_VESA=y
CONFIG_FB_EFI=y
# CONFIG_FB_N411 is not set
# CONFIG_FB_HGA is not set
# CONFIG_FB_OPENCORES is not set
# CONFIG_FB_S1D13XXX is not set
# CONFIG_FB_NVIDIA is not set
# CONFIG_FB_RIVA is not set
# CONFIG_FB_I740 is not set
# CONFIG_FB_LE80578 is not set
# CONFIG_FB_INTEL is not set
# CONFIG_FB_MATROX is not set
# CONFIG_FB_RADEON is not set
# CONFIG_FB_ATY128 is not set
# CONFIG_FB_ATY is not set
# CONFIG_FB_S3 is not set
# CONFIG_FB_SAVAGE is not set
# CONFIG_FB_SIS is not set
# CONFIG_FB_VIA is not set
# CONFIG_FB_NEOMAGIC is not set
# CONFIG_FB_KYRO is not set
# CONFIG_FB_3DFX is not set
# CONFIG_FB_VOODOO1 is not set
# CONFIG_FB_VT8623 is not set
# CONFIG_FB_TRIDENT is not set
# CONFIG_FB_ARK is not set
# CONFIG_FB_PM3 is not set
# CONFIG_FB_CARMINE is not set
# CONFIG_FB_SM501 is not set
# CONFIG_FB_SMSCUFX is not set
# CONFIG_FB_UDL is not set
# CONFIG_FB_IBM_GXT4500 is not set
# CONFIG_FB_VIRTUAL is not set
# CONFIG_XEN_FBDEV_FRONTEND is not set
# CONFIG_FB_METRONOME is not set
# CONFIG_FB_MB862XX is not set
CONFIG_FB_HYPERV=m
# CONFIG_FB_SIMPLE is not set
# CONFIG_FB_SM712 is not set
# end of Frame buffer Devices

#
# Backlight & LCD device support
#
CONFIG_LCD_CLASS_DEVICE=m
# CONFIG_LCD_L4F00242T03 is not set
# CONFIG_LCD_LMS283GF05 is not set
# CONFIG_LCD_LTV350QV is not set
# CONFIG_LCD_ILI922X is not set
# CONFIG_LCD_ILI9320 is not set
# CONFIG_LCD_TDO24M is not set
# CONFIG_LCD_VGG2432A4 is not set
CONFIG_LCD_PLATFORM=m
# CONFIG_LCD_AMS369FG06 is not set
# CONFIG_LCD_LMS501KF03 is not set
# CONFIG_LCD_HX8357 is not set
# CONFIG_LCD_OTM3225A is not set
CONFIG_BACKLIGHT_CLASS_DEVICE=y
# CONFIG_BACKLIGHT_GENERIC is not set
# CONFIG_BACKLIGHT_PWM is not set
CONFIG_BACKLIGHT_APPLE=m
# CONFIG_BACKLIGHT_PM8941_WLED is not set
# CONFIG_BACKLIGHT_SAHARA is not set
# CONFIG_BACKLIGHT_ADP8860 is not set
# CONFIG_BACKLIGHT_ADP8870 is not set
# CONFIG_BACKLIGHT_LM3630A is not set
# CONFIG_BACKLIGHT_LM3639 is not set
CONFIG_BACKLIGHT_LP855X=m
# CONFIG_BACKLIGHT_GPIO is not set
# CONFIG_BACKLIGHT_LV5207LP is not set
# CONFIG_BACKLIGHT_BD6107 is not set
# CONFIG_BACKLIGHT_ARCXCNN is not set
# end of Backlight & LCD device support

CONFIG_HDMI=y

#
# Console display driver support
#
CONFIG_VGA_CONSOLE=y
CONFIG_VGACON_SOFT_SCROLLBACK=y
CONFIG_VGACON_SOFT_SCROLLBACK_SIZE=64
# CONFIG_VGACON_SOFT_SCROLLBACK_PERSISTENT_ENABLE_BY_DEFAULT is not set
CONFIG_DUMMY_CONSOLE=y
CONFIG_DUMMY_CONSOLE_COLUMNS=80
CONFIG_DUMMY_CONSOLE_ROWS=25
CONFIG_FRAMEBUFFER_CONSOLE=y
CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=y
CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
# CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER is not set
# end of Console display driver support

CONFIG_LOGO=y
# CONFIG_LOGO_LINUX_MONO is not set
# CONFIG_LOGO_LINUX_VGA16 is not set
CONFIG_LOGO_LINUX_CLUT224=y
# end of Graphics support

CONFIG_SOUND=m
CONFIG_SOUND_OSS_CORE=y
CONFIG_SOUND_OSS_CORE_PRECLAIM=y
CONFIG_SND=m
CONFIG_SND_TIMER=m
CONFIG_SND_PCM=m
CONFIG_SND_PCM_ELD=y
CONFIG_SND_HWDEP=m
CONFIG_SND_SEQ_DEVICE=m
CONFIG_SND_RAWMIDI=m
CONFIG_SND_COMPRESS_OFFLOAD=m
CONFIG_SND_JACK=y
CONFIG_SND_JACK_INPUT_DEV=y
CONFIG_SND_OSSEMUL=y
# CONFIG_SND_MIXER_OSS is not set
# CONFIG_SND_PCM_OSS is not set
CONFIG_SND_PCM_TIMER=y
CONFIG_SND_HRTIMER=m
CONFIG_SND_DYNAMIC_MINORS=y
CONFIG_SND_MAX_CARDS=32
# CONFIG_SND_SUPPORT_OLD_API is not set
CONFIG_SND_PROC_FS=y
CONFIG_SND_VERBOSE_PROCFS=y
# CONFIG_SND_VERBOSE_PRINTK is not set
# CONFIG_SND_DEBUG is not set
CONFIG_SND_VMASTER=y
CONFIG_SND_DMA_SGBUF=y
CONFIG_SND_SEQUENCER=m
CONFIG_SND_SEQ_DUMMY=m
CONFIG_SND_SEQUENCER_OSS=m
CONFIG_SND_SEQ_HRTIMER_DEFAULT=y
CONFIG_SND_SEQ_MIDI_EVENT=m
CONFIG_SND_SEQ_MIDI=m
CONFIG_SND_SEQ_MIDI_EMUL=m
CONFIG_SND_SEQ_VIRMIDI=m
CONFIG_SND_MPU401_UART=m
CONFIG_SND_OPL3_LIB=m
CONFIG_SND_OPL3_LIB_SEQ=m
CONFIG_SND_VX_LIB=m
CONFIG_SND_AC97_CODEC=m
CONFIG_SND_DRIVERS=y
CONFIG_SND_PCSP=m
CONFIG_SND_DUMMY=m
CONFIG_SND_ALOOP=m
CONFIG_SND_VIRMIDI=m
CONFIG_SND_MTPAV=m
# CONFIG_SND_MTS64 is not set
# CONFIG_SND_SERIAL_U16550 is not set
CONFIG_SND_MPU401=m
# CONFIG_SND_PORTMAN2X4 is not set
CONFIG_SND_AC97_POWER_SAVE=y
CONFIG_SND_AC97_POWER_SAVE_DEFAULT=5
CONFIG_SND_PCI=y
CONFIG_SND_AD1889=m
# CONFIG_SND_ALS300 is not set
# CONFIG_SND_ALS4000 is not set
CONFIG_SND_ALI5451=m
CONFIG_SND_ASIHPI=m
CONFIG_SND_ATIIXP=m
CONFIG_SND_ATIIXP_MODEM=m
CONFIG_SND_AU8810=m
CONFIG_SND_AU8820=m
CONFIG_SND_AU8830=m
# CONFIG_SND_AW2 is not set
# CONFIG_SND_AZT3328 is not set
CONFIG_SND_BT87X=m
# CONFIG_SND_BT87X_OVERCLOCK is not set
CONFIG_SND_CA0106=m
CONFIG_SND_CMIPCI=m
CONFIG_SND_OXYGEN_LIB=m
CONFIG_SND_OXYGEN=m
# CONFIG_SND_CS4281 is not set
CONFIG_SND_CS46XX=m
CONFIG_SND_CS46XX_NEW_DSP=y
CONFIG_SND_CTXFI=m
CONFIG_SND_DARLA20=m
CONFIG_SND_GINA20=m
CONFIG_SND_LAYLA20=m
CONFIG_SND_DARLA24=m
CONFIG_SND_GINA24=m
CONFIG_SND_LAYLA24=m
CONFIG_SND_MONA=m
CONFIG_SND_MIA=m
CONFIG_SND_ECHO3G=m
CONFIG_SND_INDIGO=m
CONFIG_SND_INDIGOIO=m
CONFIG_SND_INDIGODJ=m
CONFIG_SND_INDIGOIOX=m
CONFIG_SND_INDIGODJX=m
CONFIG_SND_EMU10K1=m
CONFIG_SND_EMU10K1_SEQ=m
CONFIG_SND_EMU10K1X=m
CONFIG_SND_ENS1370=m
CONFIG_SND_ENS1371=m
# CONFIG_SND_ES1938 is not set
CONFIG_SND_ES1968=m
CONFIG_SND_ES1968_INPUT=y
CONFIG_SND_ES1968_RADIO=y
# CONFIG_SND_FM801 is not set
CONFIG_SND_HDSP=m
CONFIG_SND_HDSPM=m
CONFIG_SND_ICE1712=m
CONFIG_SND_ICE1724=m
CONFIG_SND_INTEL8X0=m
CONFIG_SND_INTEL8X0M=m
CONFIG_SND_KORG1212=m
CONFIG_SND_LOLA=m
CONFIG_SND_LX6464ES=m
CONFIG_SND_MAESTRO3=m
CONFIG_SND_MAESTRO3_INPUT=y
CONFIG_SND_MIXART=m
# CONFIG_SND_NM256 is not set
CONFIG_SND_PCXHR=m
# CONFIG_SND_RIPTIDE is not set
CONFIG_SND_RME32=m
CONFIG_SND_RME96=m
CONFIG_SND_RME9652=m
# CONFIG_SND_SONICVIBES is not set
CONFIG_SND_TRIDENT=m
CONFIG_SND_VIA82XX=m
CONFIG_SND_VIA82XX_MODEM=m
CONFIG_SND_VIRTUOSO=m
CONFIG_SND_VX222=m
# CONFIG_SND_YMFPCI is not set

#
# HD-Audio
#
CONFIG_SND_HDA=m
CONFIG_SND_HDA_INTEL=m
# CONFIG_SND_HDA_INTEL_DETECT_DMIC is not set
CONFIG_SND_HDA_HWDEP=y
CONFIG_SND_HDA_RECONFIG=y
CONFIG_SND_HDA_INPUT_BEEP=y
CONFIG_SND_HDA_INPUT_BEEP_MODE=0
CONFIG_SND_HDA_PATCH_LOADER=y
CONFIG_SND_HDA_CODEC_REALTEK=m
CONFIG_SND_HDA_CODEC_ANALOG=m
CONFIG_SND_HDA_CODEC_SIGMATEL=m
CONFIG_SND_HDA_CODEC_VIA=m
CONFIG_SND_HDA_CODEC_HDMI=m
CONFIG_SND_HDA_CODEC_CIRRUS=m
CONFIG_SND_HDA_CODEC_CONEXANT=m
CONFIG_SND_HDA_CODEC_CA0110=m
CONFIG_SND_HDA_CODEC_CA0132=m
CONFIG_SND_HDA_CODEC_CA0132_DSP=y
CONFIG_SND_HDA_CODEC_CMEDIA=m
CONFIG_SND_HDA_CODEC_SI3054=m
CONFIG_SND_HDA_GENERIC=m
CONFIG_SND_HDA_POWER_SAVE_DEFAULT=0
# end of HD-Audio

CONFIG_SND_HDA_CORE=m
CONFIG_SND_HDA_DSP_LOADER=y
CONFIG_SND_HDA_COMPONENT=y
CONFIG_SND_HDA_I915=y
CONFIG_SND_HDA_EXT_CORE=m
CONFIG_SND_HDA_PREALLOC_SIZE=512
CONFIG_SND_INTEL_NHLT=m
# CONFIG_SND_SPI is not set
CONFIG_SND_USB=y
CONFIG_SND_USB_AUDIO=m
CONFIG_SND_USB_AUDIO_USE_MEDIA_CONTROLLER=y
CONFIG_SND_USB_UA101=m
CONFIG_SND_USB_USX2Y=m
CONFIG_SND_USB_CAIAQ=m
CONFIG_SND_USB_CAIAQ_INPUT=y
CONFIG_SND_USB_US122L=m
CONFIG_SND_USB_6FIRE=m
CONFIG_SND_USB_HIFACE=m
CONFIG_SND_BCD2000=m
CONFIG_SND_USB_LINE6=m
CONFIG_SND_USB_POD=m
CONFIG_SND_USB_PODHD=m
CONFIG_SND_USB_TONEPORT=m
CONFIG_SND_USB_VARIAX=m
CONFIG_SND_FIREWIRE=y
CONFIG_SND_FIREWIRE_LIB=m
# CONFIG_SND_DICE is not set
# CONFIG_SND_OXFW is not set
CONFIG_SND_ISIGHT=m
# CONFIG_SND_FIREWORKS is not set
# CONFIG_SND_BEBOB is not set
# CONFIG_SND_FIREWIRE_DIGI00X is not set
# CONFIG_SND_FIREWIRE_TASCAM is not set
# CONFIG_SND_FIREWIRE_MOTU is not set
# CONFIG_SND_FIREFACE is not set
CONFIG_SND_SOC=m
CONFIG_SND_SOC_COMPRESS=y
CONFIG_SND_SOC_TOPOLOGY=y
CONFIG_SND_SOC_ACPI=m
# CONFIG_SND_SOC_AMD_ACP is not set
# CONFIG_SND_SOC_AMD_ACP3x is not set
# CONFIG_SND_ATMEL_SOC is not set
# CONFIG_SND_DESIGNWARE_I2S is not set

#
# SoC Audio for Freescale CPUs
#

#
# Common SoC Audio options for Freescale CPUs:
#
# CONFIG_SND_SOC_FSL_ASRC is not set
# CONFIG_SND_SOC_FSL_SAI is not set
# CONFIG_SND_SOC_FSL_AUDMIX is not set
# CONFIG_SND_SOC_FSL_SSI is not set
# CONFIG_SND_SOC_FSL_SPDIF is not set
# CONFIG_SND_SOC_FSL_ESAI is not set
# CONFIG_SND_SOC_FSL_MICFIL is not set
# CONFIG_SND_SOC_IMX_AUDMUX is not set
# end of SoC Audio for Freescale CPUs

# CONFIG_SND_I2S_HI6210_I2S is not set
# CONFIG_SND_SOC_IMG is not set
CONFIG_SND_SOC_INTEL_SST_TOPLEVEL=y
CONFIG_SND_SST_IPC=m
CONFIG_SND_SST_IPC_ACPI=m
CONFIG_SND_SOC_INTEL_SST_ACPI=m
CONFIG_SND_SOC_INTEL_SST=m
CONFIG_SND_SOC_INTEL_SST_FIRMWARE=m
CONFIG_SND_SOC_INTEL_HASWELL=m
CONFIG_SND_SST_ATOM_HIFI2_PLATFORM=m
# CONFIG_SND_SST_ATOM_HIFI2_PLATFORM_PCI is not set
CONFIG_SND_SST_ATOM_HIFI2_PLATFORM_ACPI=m
CONFIG_SND_SOC_INTEL_SKYLAKE=m
CONFIG_SND_SOC_INTEL_SKL=m
CONFIG_SND_SOC_INTEL_APL=m
CONFIG_SND_SOC_INTEL_KBL=m
CONFIG_SND_SOC_INTEL_GLK=m
CONFIG_SND_SOC_INTEL_CNL=m
CONFIG_SND_SOC_INTEL_CFL=m
# CONFIG_SND_SOC_INTEL_CML_H is not set
# CONFIG_SND_SOC_INTEL_CML_LP is not set
CONFIG_SND_SOC_INTEL_SKYLAKE_FAMILY=m
CONFIG_SND_SOC_INTEL_SKYLAKE_SSP_CLK=m
# CONFIG_SND_SOC_INTEL_SKYLAKE_HDAUDIO_CODEC is not set
CONFIG_SND_SOC_INTEL_SKYLAKE_COMMON=m
CONFIG_SND_SOC_ACPI_INTEL_MATCH=m
CONFIG_SND_SOC_INTEL_MACH=y
CONFIG_SND_SOC_INTEL_HASWELL_MACH=m
CONFIG_SND_SOC_INTEL_BDW_RT5677_MACH=m
CONFIG_SND_SOC_INTEL_BROADWELL_MACH=m
CONFIG_SND_SOC_INTEL_BYTCR_RT5640_MACH=m
CONFIG_SND_SOC_INTEL_BYTCR_RT5651_MACH=m
CONFIG_SND_SOC_INTEL_CHT_BSW_RT5672_MACH=m
CONFIG_SND_SOC_INTEL_CHT_BSW_RT5645_MACH=m
CONFIG_SND_SOC_INTEL_CHT_BSW_MAX98090_TI_MACH=m
# CONFIG_SND_SOC_INTEL_CHT_BSW_NAU8824_MACH is not set
# CONFIG_SND_SOC_INTEL_BYT_CHT_CX2072X_MACH is not set
CONFIG_SND_SOC_INTEL_BYT_CHT_DA7213_MACH=m
CONFIG_SND_SOC_INTEL_BYT_CHT_ES8316_MACH=m
CONFIG_SND_SOC_INTEL_BYT_CHT_NOCODEC_MACH=m
CONFIG_SND_SOC_INTEL_SKL_RT286_MACH=m
CONFIG_SND_SOC_INTEL_SKL_NAU88L25_SSM4567_MACH=m
CONFIG_SND_SOC_INTEL_SKL_NAU88L25_MAX98357A_MACH=m
CONFIG_SND_SOC_INTEL_DA7219_MAX98357A_GENERIC=m
CONFIG_SND_SOC_INTEL_BXT_DA7219_MAX98357A_MACH=m
CONFIG_SND_SOC_INTEL_BXT_RT298_MACH=m
CONFIG_SND_SOC_INTEL_KBL_RT5663_MAX98927_MACH=m
CONFIG_SND_SOC_INTEL_KBL_RT5663_RT5514_MAX98927_MACH=m
# CONFIG_SND_SOC_INTEL_KBL_DA7219_MAX98357A_MACH is not set
# CONFIG_SND_SOC_INTEL_KBL_DA7219_MAX98927_MACH is not set
# CONFIG_SND_SOC_INTEL_KBL_RT5660_MACH is not set
# CONFIG_SND_SOC_INTEL_GLK_RT5682_MAX98357A_MACH is not set
# CONFIG_SND_SOC_MTK_BTCVSD is not set
# CONFIG_SND_SOC_SOF_TOPLEVEL is not set

#
# STMicroelectronics STM32 SOC audio support
#
# end of STMicroelectronics STM32 SOC audio support

# CONFIG_SND_SOC_XILINX_I2S is not set
# CONFIG_SND_SOC_XILINX_AUDIO_FORMATTER is not set
# CONFIG_SND_SOC_XILINX_SPDIF is not set
# CONFIG_SND_SOC_XTFPGA_I2S is not set
# CONFIG_ZX_TDM is not set
CONFIG_SND_SOC_I2C_AND_SPI=m

#
# CODEC drivers
#
# CONFIG_SND_SOC_AC97_CODEC is not set
# CONFIG_SND_SOC_ADAU1701 is not set
# CONFIG_SND_SOC_ADAU1761_I2C is not set
# CONFIG_SND_SOC_ADAU1761_SPI is not set
# CONFIG_SND_SOC_ADAU7002 is not set
# CONFIG_SND_SOC_AK4104 is not set
# CONFIG_SND_SOC_AK4118 is not set
# CONFIG_SND_SOC_AK4458 is not set
# CONFIG_SND_SOC_AK4554 is not set
# CONFIG_SND_SOC_AK4613 is not set
# CONFIG_SND_SOC_AK4642 is not set
# CONFIG_SND_SOC_AK5386 is not set
# CONFIG_SND_SOC_AK5558 is not set
# CONFIG_SND_SOC_ALC5623 is not set
# CONFIG_SND_SOC_BD28623 is not set
# CONFIG_SND_SOC_BT_SCO is not set
# CONFIG_SND_SOC_CS35L32 is not set
# CONFIG_SND_SOC_CS35L33 is not set
# CONFIG_SND_SOC_CS35L34 is not set
# CONFIG_SND_SOC_CS35L35 is not set
# CONFIG_SND_SOC_CS35L36 is not set
# CONFIG_SND_SOC_CS42L42 is not set
# CONFIG_SND_SOC_CS42L51_I2C is not set
# CONFIG_SND_SOC_CS42L52 is not set
# CONFIG_SND_SOC_CS42L56 is not set
# CONFIG_SND_SOC_CS42L73 is not set
# CONFIG_SND_SOC_CS4265 is not set
# CONFIG_SND_SOC_CS4270 is not set
# CONFIG_SND_SOC_CS4271_I2C is not set
# CONFIG_SND_SOC_CS4271_SPI is not set
# CONFIG_SND_SOC_CS42XX8_I2C is not set
# CONFIG_SND_SOC_CS43130 is not set
# CONFIG_SND_SOC_CS4341 is not set
# CONFIG_SND_SOC_CS4349 is not set
# CONFIG_SND_SOC_CS53L30 is not set
# CONFIG_SND_SOC_CX2072X is not set
CONFIG_SND_SOC_DA7213=m
CONFIG_SND_SOC_DA7219=m
CONFIG_SND_SOC_DMIC=m
# CONFIG_SND_SOC_ES7134 is not set
# CONFIG_SND_SOC_ES7241 is not set
CONFIG_SND_SOC_ES8316=m
# CONFIG_SND_SOC_ES8328_I2C is not set
# CONFIG_SND_SOC_ES8328_SPI is not set
# CONFIG_SND_SOC_GTM601 is not set
CONFIG_SND_SOC_HDAC_HDMI=m
# CONFIG_SND_SOC_INNO_RK3036 is not set
# CONFIG_SND_SOC_MAX98088 is not set
CONFIG_SND_SOC_MAX98090=m
CONFIG_SND_SOC_MAX98357A=m
# CONFIG_SND_SOC_MAX98504 is not set
# CONFIG_SND_SOC_MAX9867 is not set
CONFIG_SND_SOC_MAX98927=m
# CONFIG_SND_SOC_MAX98373 is not set
# CONFIG_SND_SOC_MAX9860 is not set
# CONFIG_SND_SOC_MSM8916_WCD_DIGITAL is not set
# CONFIG_SND_SOC_PCM1681 is not set
# CONFIG_SND_SOC_PCM1789_I2C is not set
# CONFIG_SND_SOC_PCM179X_I2C is not set
# CONFIG_SND_SOC_PCM179X_SPI is not set
# CONFIG_SND_SOC_PCM186X_I2C is not set
# CONFIG_SND_SOC_PCM186X_SPI is not set
# CONFIG_SND_SOC_PCM3060_I2C is not set
# CONFIG_SND_SOC_PCM3060_SPI is not set
# CONFIG_SND_SOC_PCM3168A_I2C is not set
# CONFIG_SND_SOC_PCM3168A_SPI is not set
# CONFIG_SND_SOC_PCM512x_I2C is not set
# CONFIG_SND_SOC_PCM512x_SPI is not set
# CONFIG_SND_SOC_RK3328 is not set
CONFIG_SND_SOC_RL6231=m
CONFIG_SND_SOC_RL6347A=m
CONFIG_SND_SOC_RT286=m
CONFIG_SND_SOC_RT298=m
CONFIG_SND_SOC_RT5514=m
CONFIG_SND_SOC_RT5514_SPI=m
# CONFIG_SND_SOC_RT5616 is not set
# CONFIG_SND_SOC_RT5631 is not set
CONFIG_SND_SOC_RT5640=m
CONFIG_SND_SOC_RT5645=m
CONFIG_SND_SOC_RT5651=m
CONFIG_SND_SOC_RT5663=m
CONFIG_SND_SOC_RT5670=m
CONFIG_SND_SOC_RT5677=m
CONFIG_SND_SOC_RT5677_SPI=m
# CONFIG_SND_SOC_SGTL5000 is not set
# CONFIG_SND_SOC_SIMPLE_AMPLIFIER is not set
# CONFIG_SND_SOC_SIRF_AUDIO_CODEC is not set
# CONFIG_SND_SOC_SPDIF is not set
# CONFIG_SND_SOC_SSM2305 is not set
# CONFIG_SND_SOC_SSM2602_SPI is not set
# CONFIG_SND_SOC_SSM2602_I2C is not set
CONFIG_SND_SOC_SSM4567=m
# CONFIG_SND_SOC_STA32X is not set
# CONFIG_SND_SOC_STA350 is not set
# CONFIG_SND_SOC_STI_SAS is not set
# CONFIG_SND_SOC_TAS2552 is not set
# CONFIG_SND_SOC_TAS5086 is not set
# CONFIG_SND_SOC_TAS571X is not set
# CONFIG_SND_SOC_TAS5720 is not set
# CONFIG_SND_SOC_TAS6424 is not set
# CONFIG_SND_SOC_TDA7419 is not set
# CONFIG_SND_SOC_TFA9879 is not set
# CONFIG_SND_SOC_TLV320AIC23_I2C is not set
# CONFIG_SND_SOC_TLV320AIC23_SPI is not set
# CONFIG_SND_SOC_TLV320AIC31XX is not set
# CONFIG_SND_SOC_TLV320AIC32X4_I2C is not set
# CONFIG_SND_SOC_TLV320AIC32X4_SPI is not set
# CONFIG_SND_SOC_TLV320AIC3X is not set
CONFIG_SND_SOC_TS3A227E=m
# CONFIG_SND_SOC_TSCS42XX is not set
# CONFIG_SND_SOC_TSCS454 is not set
# CONFIG_SND_SOC_UDA1334 is not set
# CONFIG_SND_SOC_WM8510 is not set
# CONFIG_SND_SOC_WM8523 is not set
# CONFIG_SND_SOC_WM8524 is not set
# CONFIG_SND_SOC_WM8580 is not set
# CONFIG_SND_SOC_WM8711 is not set
# CONFIG_SND_SOC_WM8728 is not set
# CONFIG_SND_SOC_WM8731 is not set
# CONFIG_SND_SOC_WM8737 is not set
# CONFIG_SND_SOC_WM8741 is not set
# CONFIG_SND_SOC_WM8750 is not set
# CONFIG_SND_SOC_WM8753 is not set
# CONFIG_SND_SOC_WM8770 is not set
# CONFIG_SND_SOC_WM8776 is not set
# CONFIG_SND_SOC_WM8782 is not set
# CONFIG_SND_SOC_WM8804_I2C is not set
# CONFIG_SND_SOC_WM8804_SPI is not set
# CONFIG_SND_SOC_WM8903 is not set
# CONFIG_SND_SOC_WM8904 is not set
# CONFIG_SND_SOC_WM8960 is not set
# CONFIG_SND_SOC_WM8962 is not set
# CONFIG_SND_SOC_WM8974 is not set
# CONFIG_SND_SOC_WM8978 is not set
# CONFIG_SND_SOC_WM8985 is not set
# CONFIG_SND_SOC_ZX_AUD96P22 is not set
# CONFIG_SND_SOC_MAX9759 is not set
# CONFIG_SND_SOC_MT6351 is not set
# CONFIG_SND_SOC_MT6358 is not set
# CONFIG_SND_SOC_NAU8540 is not set
# CONFIG_SND_SOC_NAU8810 is not set
# CONFIG_SND_SOC_NAU8822 is not set
CONFIG_SND_SOC_NAU8824=m
CONFIG_SND_SOC_NAU8825=m
# CONFIG_SND_SOC_TPA6130A2 is not set
# end of CODEC drivers

# CONFIG_SND_SIMPLE_CARD is not set
CONFIG_SND_X86=y
CONFIG_HDMI_LPE_AUDIO=m
CONFIG_SND_SYNTH_EMUX=m
# CONFIG_SND_XEN_FRONTEND is not set
CONFIG_AC97_BUS=m

#
# HID support
#
CONFIG_HID=y
CONFIG_HID_BATTERY_STRENGTH=y
CONFIG_HIDRAW=y
CONFIG_UHID=m
CONFIG_HID_GENERIC=y

#
# Special HID drivers
#
CONFIG_HID_A4TECH=y
# CONFIG_HID_ACCUTOUCH is not set
CONFIG_HID_ACRUX=m
# CONFIG_HID_ACRUX_FF is not set
CONFIG_HID_APPLE=y
CONFIG_HID_APPLEIR=m
# CONFIG_HID_ASUS is not set
CONFIG_HID_AUREAL=m
CONFIG_HID_BELKIN=y
# CONFIG_HID_BETOP_FF is not set
# CONFIG_HID_BIGBEN_FF is not set
CONFIG_HID_CHERRY=y
CONFIG_HID_CHICONY=y
# CONFIG_HID_CORSAIR is not set
# CONFIG_HID_COUGAR is not set
# CONFIG_HID_MACALLY is not set
CONFIG_HID_PRODIKEYS=m
# CONFIG_HID_CMEDIA is not set
# CONFIG_HID_CP2112 is not set
# CONFIG_HID_CREATIVE_SB0540 is not set
CONFIG_HID_CYPRESS=y
CONFIG_HID_DRAGONRISE=m
# CONFIG_DRAGONRISE_FF is not set
# CONFIG_HID_EMS_FF is not set
# CONFIG_HID_ELAN is not set
CONFIG_HID_ELECOM=m
# CONFIG_HID_ELO is not set
CONFIG_HID_EZKEY=y
# CONFIG_HID_GEMBIRD is not set
# CONFIG_HID_GFRM is not set
CONFIG_HID_HOLTEK=m
# CONFIG_HOLTEK_FF is not set
# CONFIG_HID_GT683R is not set
CONFIG_HID_KEYTOUCH=m
CONFIG_HID_KYE=m
CONFIG_HID_UCLOGIC=m
CONFIG_HID_WALTOP=m
# CONFIG_HID_VIEWSONIC is not set
CONFIG_HID_GYRATION=m
CONFIG_HID_ICADE=m
CONFIG_HID_ITE=y
# CONFIG_HID_JABRA is not set
CONFIG_HID_TWINHAN=m
CONFIG_HID_KENSINGTON=y
CONFIG_HID_LCPOWER=m
CONFIG_HID_LED=m
# CONFIG_HID_LENOVO is not set
CONFIG_HID_LOGITECH=y
CONFIG_HID_LOGITECH_DJ=m
CONFIG_HID_LOGITECH_HIDPP=m
# CONFIG_LOGITECH_FF is not set
# CONFIG_LOGIRUMBLEPAD2_FF is not set
# CONFIG_LOGIG940_FF is not set
# CONFIG_LOGIWHEELS_FF is not set
CONFIG_HID_MAGICMOUSE=y
# CONFIG_HID_MALTRON is not set
# CONFIG_HID_MAYFLASH is not set
CONFIG_HID_REDRAGON=y
CONFIG_HID_MICROSOFT=y
CONFIG_HID_MONTEREY=y
CONFIG_HID_MULTITOUCH=m
# CONFIG_HID_NTI is not set
CONFIG_HID_NTRIG=y
CONFIG_HID_ORTEK=m
CONFIG_HID_PANTHERLORD=m
# CONFIG_PANTHERLORD_FF is not set
# CONFIG_HID_PENMOUNT is not set
CONFIG_HID_PETALYNX=m
CONFIG_HID_PICOLCD=m
CONFIG_HID_PICOLCD_FB=y
CONFIG_HID_PICOLCD_BACKLIGHT=y
CONFIG_HID_PICOLCD_LCD=y
CONFIG_HID_PICOLCD_LEDS=y
CONFIG_HID_PICOLCD_CIR=y
CONFIG_HID_PLANTRONICS=y
CONFIG_HID_PRIMAX=m
# CONFIG_HID_RETRODE is not set
CONFIG_HID_ROCCAT=m
CONFIG_HID_SAITEK=m
CONFIG_HID_SAMSUNG=m
CONFIG_HID_SONY=m
# CONFIG_SONY_FF is not set
CONFIG_HID_SPEEDLINK=m
# CONFIG_HID_STEAM is not set
CONFIG_HID_STEELSERIES=m
CONFIG_HID_SUNPLUS=m
CONFIG_HID_RMI=m
CONFIG_HID_GREENASIA=m
# CONFIG_GREENASIA_FF is not set
CONFIG_HID_HYPERV_MOUSE=m
CONFIG_HID_SMARTJOYPLUS=m
# CONFIG_SMARTJOYPLUS_FF is not set
CONFIG_HID_TIVO=m
CONFIG_HID_TOPSEED=m
CONFIG_HID_THINGM=m
CONFIG_HID_THRUSTMASTER=m
# CONFIG_THRUSTMASTER_FF is not set
# CONFIG_HID_UDRAW_PS3 is not set
# CONFIG_HID_U2FZERO is not set
CONFIG_HID_WACOM=m
CONFIG_HID_WIIMOTE=m
# CONFIG_HID_XINMO is not set
CONFIG_HID_ZEROPLUS=m
# CONFIG_ZEROPLUS_FF is not set
CONFIG_HID_ZYDACRON=m
CONFIG_HID_SENSOR_HUB=m
CONFIG_HID_SENSOR_CUSTOM_SENSOR=m
CONFIG_HID_ALPS=m
# end of Special HID drivers

#
# USB HID support
#
CONFIG_USB_HID=y
CONFIG_HID_PID=y
CONFIG_USB_HIDDEV=y
# end of USB HID support

#
# I2C HID support
#
CONFIG_I2C_HID=m
# end of I2C HID support

#
# Intel ISH HID support
#
CONFIG_INTEL_ISH_HID=y
# CONFIG_INTEL_ISH_FIRMWARE_DOWNLOADER is not set
# end of Intel ISH HID support
# end of HID support

CONFIG_USB_OHCI_LITTLE_ENDIAN=y
CONFIG_USB_SUPPORT=y
CONFIG_USB_COMMON=y
# CONFIG_USB_LED_TRIG is not set
# CONFIG_USB_ULPI_BUS is not set
# CONFIG_USB_CONN_GPIO is not set
CONFIG_USB_ARCH_HAS_HCD=y
CONFIG_USB=y
CONFIG_USB_PCI=y
CONFIG_USB_ANNOUNCE_NEW_DEVICES=y

#
# Miscellaneous USB options
#
CONFIG_USB_DEFAULT_PERSIST=y
# CONFIG_USB_DYNAMIC_MINORS is not set
# CONFIG_USB_OTG is not set
# CONFIG_USB_OTG_WHITELIST is not set
# CONFIG_USB_OTG_BLACKLIST_HUB is not set
CONFIG_USB_LEDS_TRIGGER_USBPORT=m
CONFIG_USB_AUTOSUSPEND_DELAY=2
CONFIG_USB_MON=y

#
# USB Host Controller Drivers
#
# CONFIG_USB_C67X00_HCD is not set
CONFIG_USB_XHCI_HCD=y
# CONFIG_USB_XHCI_DBGCAP is not set
CONFIG_USB_XHCI_PCI=y
# CONFIG_USB_XHCI_PLATFORM is not set
CONFIG_USB_EHCI_HCD=y
CONFIG_USB_EHCI_ROOT_HUB_TT=y
CONFIG_USB_EHCI_TT_NEWSCHED=y
CONFIG_USB_EHCI_PCI=y
# CONFIG_USB_EHCI_FSL is not set
# CONFIG_USB_EHCI_HCD_PLATFORM is not set
# CONFIG_USB_OXU210HP_HCD is not set
# CONFIG_USB_ISP116X_HCD is not set
# CONFIG_USB_FOTG210_HCD is not set
# CONFIG_USB_MAX3421_HCD is not set
CONFIG_USB_OHCI_HCD=y
CONFIG_USB_OHCI_HCD_PCI=y
# CONFIG_USB_OHCI_HCD_PLATFORM is not set
CONFIG_USB_UHCI_HCD=y
# CONFIG_USB_U132_HCD is not set
# CONFIG_USB_SL811_HCD is not set
# CONFIG_USB_R8A66597_HCD is not set
# CONFIG_USB_HCD_BCMA is not set
# CONFIG_USB_HCD_SSB is not set
# CONFIG_USB_HCD_TEST_MODE is not set

#
# USB Device Class drivers
#
CONFIG_USB_ACM=m
CONFIG_USB_PRINTER=m
CONFIG_USB_WDM=m
CONFIG_USB_TMC=m

#
# NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
#

#
# also be needed; see USB_STORAGE Help for more info
#
CONFIG_USB_STORAGE=m
# CONFIG_USB_STORAGE_DEBUG is not set
CONFIG_USB_STORAGE_REALTEK=m
CONFIG_REALTEK_AUTOPM=y
CONFIG_USB_STORAGE_DATAFAB=m
CONFIG_USB_STORAGE_FREECOM=m
CONFIG_USB_STORAGE_ISD200=m
CONFIG_USB_STORAGE_USBAT=m
CONFIG_USB_STORAGE_SDDR09=m
CONFIG_USB_STORAGE_SDDR55=m
CONFIG_USB_STORAGE_JUMPSHOT=m
CONFIG_USB_STORAGE_ALAUDA=m
CONFIG_USB_STORAGE_ONETOUCH=m
CONFIG_USB_STORAGE_KARMA=m
CONFIG_USB_STORAGE_CYPRESS_ATACB=m
CONFIG_USB_STORAGE_ENE_UB6250=m
CONFIG_USB_UAS=m

#
# USB Imaging devices
#
CONFIG_USB_MDC800=m
CONFIG_USB_MICROTEK=m
CONFIG_USBIP_CORE=m
# CONFIG_USBIP_VHCI_HCD is not set
# CONFIG_USBIP_HOST is not set
# CONFIG_USBIP_DEBUG is not set
# CONFIG_USB_CDNS3 is not set
# CONFIG_USB_MUSB_HDRC is not set
# CONFIG_USB_DWC3 is not set
# CONFIG_USB_DWC2 is not set
# CONFIG_USB_CHIPIDEA is not set
# CONFIG_USB_ISP1760 is not set

#
# USB port drivers
#
CONFIG_USB_USS720=m
CONFIG_USB_SERIAL=y
CONFIG_USB_SERIAL_CONSOLE=y
CONFIG_USB_SERIAL_GENERIC=y
# CONFIG_USB_SERIAL_SIMPLE is not set
CONFIG_USB_SERIAL_AIRCABLE=m
CONFIG_USB_SERIAL_ARK3116=m
CONFIG_USB_SERIAL_BELKIN=m
CONFIG_USB_SERIAL_CH341=m
CONFIG_USB_SERIAL_WHITEHEAT=m
CONFIG_USB_SERIAL_DIGI_ACCELEPORT=m
CONFIG_USB_SERIAL_CP210X=m
CONFIG_USB_SERIAL_CYPRESS_M8=m
CONFIG_USB_SERIAL_EMPEG=m
CONFIG_USB_SERIAL_FTDI_SIO=m
CONFIG_USB_SERIAL_VISOR=m
CONFIG_USB_SERIAL_IPAQ=m
CONFIG_USB_SERIAL_IR=m
CONFIG_USB_SERIAL_EDGEPORT=m
CONFIG_USB_SERIAL_EDGEPORT_TI=m
# CONFIG_USB_SERIAL_F81232 is not set
# CONFIG_USB_SERIAL_F8153X is not set
CONFIG_USB_SERIAL_GARMIN=m
CONFIG_USB_SERIAL_IPW=m
CONFIG_USB_SERIAL_IUU=m
CONFIG_USB_SERIAL_KEYSPAN_PDA=m
CONFIG_USB_SERIAL_KEYSPAN=m
CONFIG_USB_SERIAL_KLSI=m
CONFIG_USB_SERIAL_KOBIL_SCT=m
CONFIG_USB_SERIAL_MCT_U232=m
# CONFIG_USB_SERIAL_METRO is not set
CONFIG_USB_SERIAL_MOS7720=m
CONFIG_USB_SERIAL_MOS7715_PARPORT=y
CONFIG_USB_SERIAL_MOS7840=m
# CONFIG_USB_SERIAL_MXUPORT is not set
CONFIG_USB_SERIAL_NAVMAN=m
CONFIG_USB_SERIAL_PL2303=m
CONFIG_USB_SERIAL_OTI6858=m
CONFIG_USB_SERIAL_QCAUX=m
CONFIG_USB_SERIAL_QUALCOMM=m
CONFIG_USB_SERIAL_SPCP8X5=m
CONFIG_USB_SERIAL_SAFE=m
CONFIG_USB_SERIAL_SAFE_PADDED=y
CONFIG_USB_SERIAL_SIERRAWIRELESS=m
CONFIG_USB_SERIAL_SYMBOL=m
# CONFIG_USB_SERIAL_TI is not set
CONFIG_USB_SERIAL_CYBERJACK=m
CONFIG_USB_SERIAL_XIRCOM=m
CONFIG_USB_SERIAL_WWAN=m
CONFIG_USB_SERIAL_OPTION=m
CONFIG_USB_SERIAL_OMNINET=m
CONFIG_USB_SERIAL_OPTICON=m
CONFIG_USB_SERIAL_XSENS_MT=m
# CONFIG_USB_SERIAL_WISHBONE is not set
CONFIG_USB_SERIAL_SSU100=m
CONFIG_USB_SERIAL_QT2=m
# CONFIG_USB_SERIAL_UPD78F0730 is not set
CONFIG_USB_SERIAL_DEBUG=m

#
# USB Miscellaneous drivers
#
CONFIG_USB_EMI62=m
CONFIG_USB_EMI26=m
CONFIG_USB_ADUTUX=m
CONFIG_USB_SEVSEG=m
CONFIG_USB_LEGOTOWER=m
CONFIG_USB_LCD=m
# CONFIG_USB_CYPRESS_CY7C63 is not set
# CONFIG_USB_CYTHERM is not set
CONFIG_USB_IDMOUSE=m
CONFIG_USB_FTDI_ELAN=m
CONFIG_USB_APPLEDISPLAY=m
CONFIG_USB_SISUSBVGA=m
CONFIG_USB_SISUSBVGA_CON=y
CONFIG_USB_LD=m
# CONFIG_USB_TRANCEVIBRATOR is not set
CONFIG_USB_IOWARRIOR=m
# CONFIG_USB_TEST is not set
# CONFIG_USB_EHSET_TEST_FIXTURE is not set
CONFIG_USB_ISIGHTFW=m
# CONFIG_USB_YUREX is not set
CONFIG_USB_EZUSB_FX2=m
# CONFIG_USB_HUB_USB251XB is not set
CONFIG_USB_HSIC_USB3503=m
# CONFIG_USB_HSIC_USB4604 is not set
# CONFIG_USB_LINK_LAYER_TEST is not set
# CONFIG_USB_CHAOSKEY is not set
CONFIG_USB_ATM=m
CONFIG_USB_SPEEDTOUCH=m
CONFIG_USB_CXACRU=m
CONFIG_USB_UEAGLEATM=m
CONFIG_USB_XUSBATM=m

#
# USB Physical Layer drivers
#
# CONFIG_NOP_USB_XCEIV is not set
# CONFIG_USB_GPIO_VBUS is not set
# CONFIG_USB_ISP1301 is not set
# end of USB Physical Layer drivers

# CONFIG_USB_GADGET is not set
CONFIG_TYPEC=y
# CONFIG_TYPEC_TCPM is not set
CONFIG_TYPEC_UCSI=y
# CONFIG_UCSI_CCG is not set
CONFIG_UCSI_ACPI=y
# CONFIG_TYPEC_TPS6598X is not set

#
# USB Type-C Multiplexer/DeMultiplexer Switch support
#
# CONFIG_TYPEC_MUX_PI3USB30532 is not set
# end of USB Type-C Multiplexer/DeMultiplexer Switch support

#
# USB Type-C Alternate Mode drivers
#
# CONFIG_TYPEC_DP_ALTMODE is not set
# end of USB Type-C Alternate Mode drivers

# CONFIG_USB_ROLE_SWITCH is not set
CONFIG_MMC=m
CONFIG_MMC_BLOCK=m
CONFIG_MMC_BLOCK_MINORS=8
CONFIG_SDIO_UART=m
# CONFIG_MMC_TEST is not set

#
# MMC/SD/SDIO Host Controller Drivers
#
# CONFIG_MMC_DEBUG is not set
CONFIG_MMC_SDHCI=m
CONFIG_MMC_SDHCI_IO_ACCESSORS=y
CONFIG_MMC_SDHCI_PCI=m
CONFIG_MMC_RICOH_MMC=y
CONFIG_MMC_SDHCI_ACPI=m
CONFIG_MMC_SDHCI_PLTFM=m
# CONFIG_MMC_SDHCI_F_SDH30 is not set
# CONFIG_MMC_WBSD is not set
CONFIG_MMC_TIFM_SD=m
# CONFIG_MMC_SPI is not set
CONFIG_MMC_CB710=m
CONFIG_MMC_VIA_SDMMC=m
CONFIG_MMC_VUB300=m
CONFIG_MMC_USHC=m
# CONFIG_MMC_USDHI6ROL0 is not set
CONFIG_MMC_CQHCI=m
# CONFIG_MMC_TOSHIBA_PCI is not set
# CONFIG_MMC_MTK is not set
# CONFIG_MMC_SDHCI_XENON is not set
CONFIG_MEMSTICK=m
# CONFIG_MEMSTICK_DEBUG is not set

#
# MemoryStick drivers
#
# CONFIG_MEMSTICK_UNSAFE_RESUME is not set
CONFIG_MSPRO_BLOCK=m
# CONFIG_MS_BLOCK is not set

#
# MemoryStick Host Controller Drivers
#
CONFIG_MEMSTICK_TIFM_MS=m
CONFIG_MEMSTICK_JMICRON_38X=m
CONFIG_MEMSTICK_R592=m
CONFIG_NEW_LEDS=y
CONFIG_LEDS_CLASS=y
# CONFIG_LEDS_CLASS_FLASH is not set
# CONFIG_LEDS_BRIGHTNESS_HW_CHANGED is not set

#
# LED drivers
#
# CONFIG_LEDS_APU is not set
CONFIG_LEDS_LM3530=m
# CONFIG_LEDS_LM3532 is not set
# CONFIG_LEDS_LM3642 is not set
# CONFIG_LEDS_PCA9532 is not set
# CONFIG_LEDS_GPIO is not set
CONFIG_LEDS_LP3944=m
# CONFIG_LEDS_LP3952 is not set
CONFIG_LEDS_LP55XX_COMMON=m
CONFIG_LEDS_LP5521=m
CONFIG_LEDS_LP5523=m
CONFIG_LEDS_LP5562=m
# CONFIG_LEDS_LP8501 is not set
CONFIG_LEDS_CLEVO_MAIL=m
# CONFIG_LEDS_PCA955X is not set
# CONFIG_LEDS_PCA963X is not set
# CONFIG_LEDS_DAC124S085 is not set
# CONFIG_LEDS_PWM is not set
# CONFIG_LEDS_BD2802 is not set
CONFIG_LEDS_INTEL_SS4200=m
# CONFIG_LEDS_TCA6507 is not set
# CONFIG_LEDS_TLC591XX is not set
# CONFIG_LEDS_LM355x is not set

#
# LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)
#
CONFIG_LEDS_BLINKM=m
# CONFIG_LEDS_MLXCPLD is not set
# CONFIG_LEDS_MLXREG is not set
# CONFIG_LEDS_USER is not set
# CONFIG_LEDS_NIC78BX is not set
# CONFIG_LEDS_TI_LMU_COMMON is not set

#
# LED Triggers
#
CONFIG_LEDS_TRIGGERS=y
CONFIG_LEDS_TRIGGER_TIMER=m
CONFIG_LEDS_TRIGGER_ONESHOT=m
# CONFIG_LEDS_TRIGGER_DISK is not set
# CONFIG_LEDS_TRIGGER_MTD is not set
CONFIG_LEDS_TRIGGER_HEARTBEAT=m
CONFIG_LEDS_TRIGGER_BACKLIGHT=m
# CONFIG_LEDS_TRIGGER_CPU is not set
# CONFIG_LEDS_TRIGGER_ACTIVITY is not set
CONFIG_LEDS_TRIGGER_GPIO=m
CONFIG_LEDS_TRIGGER_DEFAULT_ON=m

#
# iptables trigger is under Netfilter config (LED target)
#
CONFIG_LEDS_TRIGGER_TRANSIENT=m
CONFIG_LEDS_TRIGGER_CAMERA=m
# CONFIG_LEDS_TRIGGER_PANIC is not set
# CONFIG_LEDS_TRIGGER_NETDEV is not set
# CONFIG_LEDS_TRIGGER_PATTERN is not set
CONFIG_LEDS_TRIGGER_AUDIO=m
# CONFIG_ACCESSIBILITY is not set
# CONFIG_INFINIBAND is not set
CONFIG_EDAC_ATOMIC_SCRUB=y
CONFIG_EDAC_SUPPORT=y
CONFIG_EDAC=y
CONFIG_EDAC_LEGACY_SYSFS=y
# CONFIG_EDAC_DEBUG is not set
CONFIG_EDAC_DECODE_MCE=m
CONFIG_EDAC_GHES=y
CONFIG_EDAC_AMD64=m
# CONFIG_EDAC_AMD64_ERROR_INJECTION is not set
CONFIG_EDAC_E752X=m
CONFIG_EDAC_I82975X=m
CONFIG_EDAC_I3000=m
CONFIG_EDAC_I3200=m
CONFIG_EDAC_IE31200=m
CONFIG_EDAC_X38=m
CONFIG_EDAC_I5400=m
CONFIG_EDAC_I7CORE=m
CONFIG_EDAC_I5000=m
CONFIG_EDAC_I5100=m
CONFIG_EDAC_I7300=m
CONFIG_EDAC_SBRIDGE=m
CONFIG_EDAC_SKX=m
# CONFIG_EDAC_I10NM is not set
CONFIG_EDAC_PND2=m
CONFIG_RTC_LIB=y
CONFIG_RTC_MC146818_LIB=y
CONFIG_RTC_CLASS=y
CONFIG_RTC_HCTOSYS=y
CONFIG_RTC_HCTOSYS_DEVICE="rtc0"
# CONFIG_RTC_SYSTOHC is not set
# CONFIG_RTC_DEBUG is not set
CONFIG_RTC_NVMEM=y

#
# RTC interfaces
#
CONFIG_RTC_INTF_SYSFS=y
CONFIG_RTC_INTF_PROC=y
CONFIG_RTC_INTF_DEV=y
# CONFIG_RTC_INTF_DEV_UIE_EMUL is not set
# CONFIG_RTC_DRV_TEST is not set

#
# I2C RTC drivers
#
# CONFIG_RTC_DRV_ABB5ZES3 is not set
# CONFIG_RTC_DRV_ABEOZ9 is not set
# CONFIG_RTC_DRV_ABX80X is not set
CONFIG_RTC_DRV_DS1307=m
# CONFIG_RTC_DRV_DS1307_CENTURY is not set
CONFIG_RTC_DRV_DS1374=m
# CONFIG_RTC_DRV_DS1374_WDT is not set
CONFIG_RTC_DRV_DS1672=m
CONFIG_RTC_DRV_MAX6900=m
CONFIG_RTC_DRV_RS5C372=m
CONFIG_RTC_DRV_ISL1208=m
CONFIG_RTC_DRV_ISL12022=m
CONFIG_RTC_DRV_X1205=m
CONFIG_RTC_DRV_PCF8523=m
# CONFIG_RTC_DRV_PCF85063 is not set
# CONFIG_RTC_DRV_PCF85363 is not set
CONFIG_RTC_DRV_PCF8563=m
CONFIG_RTC_DRV_PCF8583=m
CONFIG_RTC_DRV_M41T80=m
CONFIG_RTC_DRV_M41T80_WDT=y
CONFIG_RTC_DRV_BQ32K=m
# CONFIG_RTC_DRV_S35390A is not set
CONFIG_RTC_DRV_FM3130=m
# CONFIG_RTC_DRV_RX8010 is not set
CONFIG_RTC_DRV_RX8581=m
CONFIG_RTC_DRV_RX8025=m
CONFIG_RTC_DRV_EM3027=m
# CONFIG_RTC_DRV_RV3028 is not set
# CONFIG_RTC_DRV_RV8803 is not set
# CONFIG_RTC_DRV_SD3078 is not set

#
# SPI RTC drivers
#
# CONFIG_RTC_DRV_M41T93 is not set
# CONFIG_RTC_DRV_M41T94 is not set
# CONFIG_RTC_DRV_DS1302 is not set
# CONFIG_RTC_DRV_DS1305 is not set
# CONFIG_RTC_DRV_DS1343 is not set
# CONFIG_RTC_DRV_DS1347 is not set
# CONFIG_RTC_DRV_DS1390 is not set
# CONFIG_RTC_DRV_MAX6916 is not set
# CONFIG_RTC_DRV_R9701 is not set
CONFIG_RTC_DRV_RX4581=m
# CONFIG_RTC_DRV_RX6110 is not set
# CONFIG_RTC_DRV_RS5C348 is not set
# CONFIG_RTC_DRV_MAX6902 is not set
# CONFIG_RTC_DRV_PCF2123 is not set
# CONFIG_RTC_DRV_MCP795 is not set
CONFIG_RTC_I2C_AND_SPI=y

#
# SPI and I2C RTC drivers
#
CONFIG_RTC_DRV_DS3232=m
CONFIG_RTC_DRV_DS3232_HWMON=y
# CONFIG_RTC_DRV_PCF2127 is not set
CONFIG_RTC_DRV_RV3029C2=m
CONFIG_RTC_DRV_RV3029_HWMON=y

#
# Platform RTC drivers
#
CONFIG_RTC_DRV_CMOS=y
CONFIG_RTC_DRV_DS1286=m
CONFIG_RTC_DRV_DS1511=m
CONFIG_RTC_DRV_DS1553=m
# CONFIG_RTC_DRV_DS1685_FAMILY is not set
CONFIG_RTC_DRV_DS1742=m
CONFIG_RTC_DRV_DS2404=m
CONFIG_RTC_DRV_STK17TA8=m
# CONFIG_RTC_DRV_M48T86 is not set
CONFIG_RTC_DRV_M48T35=m
CONFIG_RTC_DRV_M48T59=m
CONFIG_RTC_DRV_MSM6242=m
CONFIG_RTC_DRV_BQ4802=m
CONFIG_RTC_DRV_RP5C01=m
CONFIG_RTC_DRV_V3020=m

#
# on-CPU RTC drivers
#
# CONFIG_RTC_DRV_FTRTC010 is not set

#
# HID Sensor RTC drivers
#
# CONFIG_RTC_DRV_HID_SENSOR_TIME is not set
CONFIG_DMADEVICES=y
# CONFIG_DMADEVICES_DEBUG is not set

#
# DMA Devices
#
CONFIG_DMA_ENGINE=y
CONFIG_DMA_VIRTUAL_CHANNELS=y
CONFIG_DMA_ACPI=y
# CONFIG_ALTERA_MSGDMA is not set
# CONFIG_INTEL_IDMA64 is not set
CONFIG_INTEL_IOATDMA=m
# CONFIG_QCOM_HIDMA_MGMT is not set
# CONFIG_QCOM_HIDMA is not set
CONFIG_DW_DMAC_CORE=y
CONFIG_DW_DMAC=m
CONFIG_DW_DMAC_PCI=y
# CONFIG_DW_EDMA is not set
# CONFIG_DW_EDMA_PCIE is not set
CONFIG_HSU_DMA=y

#
# DMA Clients
#
CONFIG_ASYNC_TX_DMA=y
# CONFIG_DMATEST is not set
CONFIG_DMA_ENGINE_RAID=y

#
# DMABUF options
#
CONFIG_SYNC_FILE=y
CONFIG_SW_SYNC=y
# CONFIG_UDMABUF is not set
# CONFIG_DMABUF_SELFTESTS is not set
# CONFIG_DMABUF_HEAPS is not set
# end of DMABUF options

CONFIG_DCA=m
CONFIG_AUXDISPLAY=y
# CONFIG_HD44780 is not set
CONFIG_KS0108=m
CONFIG_KS0108_PORT=0x378
CONFIG_KS0108_DELAY=2
CONFIG_CFAG12864B=m
CONFIG_CFAG12864B_RATE=20
# CONFIG_IMG_ASCII_LCD is not set
# CONFIG_PARPORT_PANEL is not set
# CONFIG_CHARLCD_BL_OFF is not set
# CONFIG_CHARLCD_BL_ON is not set
CONFIG_CHARLCD_BL_FLASH=y
# CONFIG_PANEL is not set
CONFIG_UIO=m
CONFIG_UIO_CIF=m
CONFIG_UIO_PDRV_GENIRQ=m
# CONFIG_UIO_DMEM_GENIRQ is not set
CONFIG_UIO_AEC=m
CONFIG_UIO_SERCOS3=m
CONFIG_UIO_PCI_GENERIC=m
# CONFIG_UIO_NETX is not set
# CONFIG_UIO_PRUSS is not set
# CONFIG_UIO_MF624 is not set
CONFIG_UIO_HV_GENERIC=m
CONFIG_VFIO_IOMMU_TYPE1=m
CONFIG_VFIO_VIRQFD=m
CONFIG_VFIO=m
CONFIG_VFIO_NOIOMMU=y
CONFIG_VFIO_PCI=m
# CONFIG_VFIO_PCI_VGA is not set
CONFIG_VFIO_PCI_MMAP=y
CONFIG_VFIO_PCI_INTX=y
# CONFIG_VFIO_PCI_IGD is not set
CONFIG_VFIO_MDEV=m
CONFIG_VFIO_MDEV_DEVICE=m
CONFIG_IRQ_BYPASS_MANAGER=m
# CONFIG_VIRT_DRIVERS is not set
CONFIG_VIRTIO=y
CONFIG_VIRTIO_MENU=y
CONFIG_VIRTIO_PCI=y
CONFIG_VIRTIO_PCI_LEGACY=y
# CONFIG_VIRTIO_PMEM is not set
CONFIG_VIRTIO_BALLOON=y
CONFIG_VIRTIO_INPUT=m
# CONFIG_VIRTIO_MMIO is not set

#
# Microsoft Hyper-V guest support
#
CONFIG_HYPERV=m
CONFIG_HYPERV_TIMER=y
CONFIG_HYPERV_UTILS=m
CONFIG_HYPERV_BALLOON=m
# end of Microsoft Hyper-V guest support

#
# Xen driver support
#
CONFIG_XEN_BALLOON=y
# CONFIG_XEN_BALLOON_MEMORY_HOTPLUG is not set
CONFIG_XEN_SCRUB_PAGES_DEFAULT=y
CONFIG_XEN_DEV_EVTCHN=m
# CONFIG_XEN_BACKEND is not set
CONFIG_XENFS=m
CONFIG_XEN_COMPAT_XENFS=y
CONFIG_XEN_SYS_HYPERVISOR=y
CONFIG_XEN_XENBUS_FRONTEND=y
# CONFIG_XEN_GNTDEV is not set
# CONFIG_XEN_GRANT_DEV_ALLOC is not set
# CONFIG_XEN_GRANT_DMA_ALLOC is not set
CONFIG_SWIOTLB_XEN=y
# CONFIG_XEN_PVCALLS_FRONTEND is not set
CONFIG_XEN_PRIVCMD=m
CONFIG_XEN_HAVE_PVMMU=y
CONFIG_XEN_EFI=y
CONFIG_XEN_AUTO_XLATE=y
CONFIG_XEN_ACPI=y
CONFIG_XEN_HAVE_VPMU=y
# end of Xen driver support

# CONFIG_GREYBUS is not set
CONFIG_STAGING=y
# CONFIG_PRISM2_USB is not set
# CONFIG_COMEDI is not set
# CONFIG_RTL8192U is not set
CONFIG_RTLLIB=m
CONFIG_RTLLIB_CRYPTO_CCMP=m
CONFIG_RTLLIB_CRYPTO_TKIP=m
CONFIG_RTLLIB_CRYPTO_WEP=m
CONFIG_RTL8192E=m
# CONFIG_RTL8723BS is not set
CONFIG_R8712U=m
# CONFIG_R8188EU is not set
# CONFIG_RTS5208 is not set
# CONFIG_VT6655 is not set
# CONFIG_VT6656 is not set

#
# IIO staging drivers
#

#
# Accelerometers
#
# CONFIG_ADIS16203 is not set
# CONFIG_ADIS16240 is not set
# end of Accelerometers

#
# Analog to digital converters
#
# CONFIG_AD7816 is not set
# CONFIG_AD7192 is not set
# CONFIG_AD7280 is not set
# end of Analog to digital converters

#
# Analog digital bi-direction converters
#
# CONFIG_ADT7316 is not set
# end of Analog digital bi-direction converters

#
# Capacitance to digital converters
#
# CONFIG_AD7150 is not set
# CONFIG_AD7746 is not set
# end of Capacitance to digital converters

#
# Direct Digital Synthesis
#
# CONFIG_AD9832 is not set
# CONFIG_AD9834 is not set
# end of Direct Digital Synthesis

#
# Network Analyzer, Impedance Converters
#
# CONFIG_AD5933 is not set
# end of Network Analyzer, Impedance Converters

#
# Active energy metering IC
#
# CONFIG_ADE7854 is not set
# end of Active energy metering IC

#
# Resolver to digital converters
#
# CONFIG_AD2S1210 is not set
# end of Resolver to digital converters
# end of IIO staging drivers

# CONFIG_FB_SM750 is not set

#
# Speakup console speech
#
# CONFIG_SPEAKUP is not set
# end of Speakup console speech

# CONFIG_STAGING_MEDIA is not set

#
# Android
#
# CONFIG_ASHMEM is not set
# CONFIG_ANDROID_VSOC is not set
CONFIG_ION=y
CONFIG_ION_SYSTEM_HEAP=y
# CONFIG_ION_CMA_HEAP is not set
# end of Android

# CONFIG_LTE_GDM724X is not set
CONFIG_FIREWIRE_SERIAL=m
CONFIG_FWTTY_MAX_TOTAL_PORTS=64
CONFIG_FWTTY_MAX_CARD_PORTS=32
# CONFIG_GS_FPGABOOT is not set
# CONFIG_UNISYSSPAR is not set
# CONFIG_WILC1000_SDIO is not set
# CONFIG_WILC1000_SPI is not set
# CONFIG_MOST is not set
# CONFIG_KS7010 is not set
# CONFIG_PI433 is not set

#
# Gasket devices
#
# CONFIG_STAGING_GASKET_FRAMEWORK is not set
# end of Gasket devices

# CONFIG_FIELDBUS_DEV is not set
# CONFIG_KPC2000 is not set

#
# ISDN CAPI drivers
#
CONFIG_CAPI_AVM=y
CONFIG_ISDN_DRV_AVMB1_B1PCI=m
CONFIG_ISDN_DRV_AVMB1_B1PCIV4=y
CONFIG_ISDN_DRV_AVMB1_T1PCI=m
CONFIG_ISDN_DRV_AVMB1_C4=m
CONFIG_ISDN_DRV_GIGASET=m
CONFIG_GIGASET_CAPI=y
CONFIG_GIGASET_BASE=m
CONFIG_GIGASET_M105=m
CONFIG_GIGASET_M101=m
# CONFIG_GIGASET_DEBUG is not set
CONFIG_HYSDN=m
CONFIG_HYSDN_CAPI=y
# end of ISDN CAPI drivers

CONFIG_USB_WUSB=m
CONFIG_USB_WUSB_CBAF=m
# CONFIG_USB_WUSB_CBAF_DEBUG is not set
# CONFIG_USB_WHCI_HCD is not set
CONFIG_USB_HWA_HCD=m
CONFIG_UWB=m
CONFIG_UWB_HWA=m
CONFIG_UWB_WHCI=m
CONFIG_UWB_I1480U=m
# CONFIG_EXFAT_FS is not set
CONFIG_QLGE=m
CONFIG_X86_PLATFORM_DEVICES=y
CONFIG_ACER_WMI=m
# CONFIG_ACER_WIRELESS is not set
CONFIG_ACERHDF=m
# CONFIG_ALIENWARE_WMI is not set
CONFIG_ASUS_LAPTOP=m
CONFIG_DCDBAS=m
CONFIG_DELL_SMBIOS=m
CONFIG_DELL_SMBIOS_WMI=y
CONFIG_DELL_SMBIOS_SMM=y
CONFIG_DELL_LAPTOP=m
CONFIG_DELL_WMI=m
CONFIG_DELL_WMI_DESCRIPTOR=m
CONFIG_DELL_WMI_AIO=m
# CONFIG_DELL_WMI_LED is not set
CONFIG_DELL_SMO8800=m
CONFIG_DELL_RBTN=m
CONFIG_DELL_RBU=m
CONFIG_FUJITSU_LAPTOP=m
CONFIG_FUJITSU_TABLET=m
CONFIG_AMILO_RFKILL=m
# CONFIG_GPD_POCKET_FAN is not set
CONFIG_HP_ACCEL=m
CONFIG_HP_WIRELESS=m
CONFIG_HP_WMI=m
# CONFIG_LG_LAPTOP is not set
CONFIG_MSI_LAPTOP=m
CONFIG_PANASONIC_LAPTOP=m
CONFIG_COMPAL_LAPTOP=m
CONFIG_SONY_LAPTOP=m
CONFIG_SONYPI_COMPAT=y
CONFIG_IDEAPAD_LAPTOP=m
# CONFIG_SURFACE3_WMI is not set
CONFIG_THINKPAD_ACPI=m
CONFIG_THINKPAD_ACPI_ALSA_SUPPORT=y
# CONFIG_THINKPAD_ACPI_DEBUGFACILITIES is not set
# CONFIG_THINKPAD_ACPI_DEBUG is not set
# CONFIG_THINKPAD_ACPI_UNSAFE_LEDS is not set
CONFIG_THINKPAD_ACPI_VIDEO=y
CONFIG_THINKPAD_ACPI_HOTKEY_POLL=y
CONFIG_SENSORS_HDAPS=m
# CONFIG_INTEL_MENLOW is not set
CONFIG_EEEPC_LAPTOP=m
CONFIG_ASUS_WMI=m
CONFIG_ASUS_NB_WMI=m
CONFIG_EEEPC_WMI=m
# CONFIG_ASUS_WIRELESS is not set
CONFIG_ACPI_WMI=m
CONFIG_WMI_BMOF=m
CONFIG_INTEL_WMI_THUNDERBOLT=m
# CONFIG_XIAOMI_WMI is not set
CONFIG_MSI_WMI=m
# CONFIG_PEAQ_WMI is not set
CONFIG_TOPSTAR_LAPTOP=m
CONFIG_ACPI_TOSHIBA=m
CONFIG_TOSHIBA_BT_RFKILL=m
# CONFIG_TOSHIBA_HAPS is not set
# CONFIG_TOSHIBA_WMI is not set
CONFIG_ACPI_CMPC=m
# CONFIG_INTEL_INT0002_VGPIO is not set
CONFIG_INTEL_HID_EVENT=m
CONFIG_INTEL_VBTN=m
CONFIG_INTEL_IPS=m
CONFIG_INTEL_PMC_CORE=m
# CONFIG_IBM_RTL is not set
CONFIG_SAMSUNG_LAPTOP=m
CONFIG_MXM_WMI=m
CONFIG_INTEL_OAKTRAIL=m
CONFIG_SAMSUNG_Q10=m
CONFIG_APPLE_GMUX=m
# CONFIG_INTEL_RST is not set
# CONFIG_INTEL_SMARTCONNECT is not set
# CONFIG_INTEL_PMC_IPC is not set
# CONFIG_SURFACE_PRO3_BUTTON is not set
# CONFIG_INTEL_PUNIT_IPC is not set
# CONFIG_MLX_PLATFORM is not set
# CONFIG_INTEL_TURBO_MAX_3 is not set
# CONFIG_I2C_MULTI_INSTANTIATE is not set
# CONFIG_INTEL_ATOMISP2_PM is not set
# CONFIG_HUAWEI_WMI is not set
# CONFIG_PCENGINES_APU2 is not set

#
# Intel Speed Select Technology interface support
#
# CONFIG_INTEL_SPEED_SELECT_INTERFACE is not set
# end of Intel Speed Select Technology interface support

CONFIG_PMC_ATOM=y
# CONFIG_MFD_CROS_EC is not set
# CONFIG_CHROME_PLATFORMS is not set
# CONFIG_MELLANOX_PLATFORM is not set
CONFIG_CLKDEV_LOOKUP=y
CONFIG_HAVE_CLK_PREPARE=y
CONFIG_COMMON_CLK=y

#
# Common Clock Framework
#
# CONFIG_COMMON_CLK_MAX9485 is not set
# CONFIG_COMMON_CLK_SI5341 is not set
# CONFIG_COMMON_CLK_SI5351 is not set
# CONFIG_COMMON_CLK_SI544 is not set
# CONFIG_COMMON_CLK_CDCE706 is not set
# CONFIG_COMMON_CLK_CS2000_CP is not set
# CONFIG_COMMON_CLK_PWM is not set
# end of Common Clock Framework

# CONFIG_HWSPINLOCK is not set

#
# Clock Source drivers
#
CONFIG_CLKEVT_I8253=y
CONFIG_I8253_LOCK=y
CONFIG_CLKBLD_I8253=y
# end of Clock Source drivers

CONFIG_MAILBOX=y
CONFIG_PCC=y
# CONFIG_ALTERA_MBOX is not set
CONFIG_IOMMU_IOVA=y
CONFIG_IOMMU_API=y
CONFIG_IOMMU_SUPPORT=y

#
# Generic IOMMU Pagetable Support
#
# end of Generic IOMMU Pagetable Support

# CONFIG_IOMMU_DEBUGFS is not set
# CONFIG_IOMMU_DEFAULT_PASSTHROUGH is not set
CONFIG_AMD_IOMMU=y
CONFIG_AMD_IOMMU_V2=m
CONFIG_DMAR_TABLE=y
CONFIG_INTEL_IOMMU=y
# CONFIG_INTEL_IOMMU_SVM is not set
# CONFIG_INTEL_IOMMU_DEFAULT_ON is not set
CONFIG_INTEL_IOMMU_FLOPPY_WA=y
CONFIG_IRQ_REMAP=y
CONFIG_HYPERV_IOMMU=y

#
# Remoteproc drivers
#
# CONFIG_REMOTEPROC is not set
# end of Remoteproc drivers

#
# Rpmsg drivers
#
# CONFIG_RPMSG_QCOM_GLINK_RPM is not set
# CONFIG_RPMSG_VIRTIO is not set
# end of Rpmsg drivers

# CONFIG_SOUNDWIRE is not set

#
# SOC (System On Chip) specific Drivers
#

#
# Amlogic SoC drivers
#
# end of Amlogic SoC drivers

#
# Aspeed SoC drivers
#
# end of Aspeed SoC drivers

#
# Broadcom SoC drivers
#
# end of Broadcom SoC drivers

#
# NXP/Freescale QorIQ SoC drivers
#
# end of NXP/Freescale QorIQ SoC drivers

#
# i.MX SoC drivers
#
# end of i.MX SoC drivers

#
# Qualcomm SoC drivers
#
# end of Qualcomm SoC drivers

# CONFIG_SOC_TI is not set

#
# Xilinx SoC drivers
#
# CONFIG_XILINX_VCU is not set
# end of Xilinx SoC drivers
# end of SOC (System On Chip) specific Drivers

CONFIG_PM_DEVFREQ=y

#
# DEVFREQ Governors
#
CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=m
# CONFIG_DEVFREQ_GOV_PERFORMANCE is not set
# CONFIG_DEVFREQ_GOV_POWERSAVE is not set
# CONFIG_DEVFREQ_GOV_USERSPACE is not set
# CONFIG_DEVFREQ_GOV_PASSIVE is not set

#
# DEVFREQ Drivers
#
# CONFIG_PM_DEVFREQ_EVENT is not set
# CONFIG_EXTCON is not set
# CONFIG_MEMORY is not set
CONFIG_IIO=y
CONFIG_IIO_BUFFER=y
CONFIG_IIO_BUFFER_CB=y
# CONFIG_IIO_BUFFER_HW_CONSUMER is not set
CONFIG_IIO_KFIFO_BUF=y
CONFIG_IIO_TRIGGERED_BUFFER=m
# CONFIG_IIO_CONFIGFS is not set
CONFIG_IIO_TRIGGER=y
CONFIG_IIO_CONSUMERS_PER_TRIGGER=2
# CONFIG_IIO_SW_DEVICE is not set
# CONFIG_IIO_SW_TRIGGER is not set

#
# Accelerometers
#
# CONFIG_ADIS16201 is not set
# CONFIG_ADIS16209 is not set
# CONFIG_ADXL345_I2C is not set
# CONFIG_ADXL345_SPI is not set
# CONFIG_ADXL372_SPI is not set
# CONFIG_ADXL372_I2C is not set
# CONFIG_BMA180 is not set
# CONFIG_BMA220 is not set
# CONFIG_BMC150_ACCEL is not set
# CONFIG_DA280 is not set
# CONFIG_DA311 is not set
# CONFIG_DMARD09 is not set
# CONFIG_DMARD10 is not set
CONFIG_HID_SENSOR_ACCEL_3D=m
# CONFIG_IIO_ST_ACCEL_3AXIS is not set
# CONFIG_KXSD9 is not set
# CONFIG_KXCJK1013 is not set
# CONFIG_MC3230 is not set
# CONFIG_MMA7455_I2C is not set
# CONFIG_MMA7455_SPI is not set
# CONFIG_MMA7660 is not set
# CONFIG_MMA8452 is not set
# CONFIG_MMA9551 is not set
# CONFIG_MMA9553 is not set
# CONFIG_MXC4005 is not set
# CONFIG_MXC6255 is not set
# CONFIG_SCA3000 is not set
# CONFIG_STK8312 is not set
# CONFIG_STK8BA50 is not set
# end of Accelerometers

#
# Analog to digital converters
#
# CONFIG_AD7124 is not set
# CONFIG_AD7266 is not set
# CONFIG_AD7291 is not set
# CONFIG_AD7298 is not set
# CONFIG_AD7476 is not set
# CONFIG_AD7606_IFACE_PARALLEL is not set
# CONFIG_AD7606_IFACE_SPI is not set
# CONFIG_AD7766 is not set
# CONFIG_AD7768_1 is not set
# CONFIG_AD7780 is not set
# CONFIG_AD7791 is not set
# CONFIG_AD7793 is not set
# CONFIG_AD7887 is not set
# CONFIG_AD7923 is not set
# CONFIG_AD7949 is not set
# CONFIG_AD799X is not set
# CONFIG_HI8435 is not set
# CONFIG_HX711 is not set
# CONFIG_INA2XX_ADC is not set
# CONFIG_LTC2471 is not set
# CONFIG_LTC2485 is not set
# CONFIG_LTC2497 is not set
# CONFIG_MAX1027 is not set
# CONFIG_MAX11100 is not set
# CONFIG_MAX1118 is not set
# CONFIG_MAX1363 is not set
# CONFIG_MAX9611 is not set
# CONFIG_MCP320X is not set
# CONFIG_MCP3422 is not set
# CONFIG_MCP3911 is not set
# CONFIG_NAU7802 is not set
# CONFIG_TI_ADC081C is not set
# CONFIG_TI_ADC0832 is not set
# CONFIG_TI_ADC084S021 is not set
# CONFIG_TI_ADC12138 is not set
# CONFIG_TI_ADC108S102 is not set
# CONFIG_TI_ADC128S052 is not set
# CONFIG_TI_ADC161S626 is not set
# CONFIG_TI_ADS1015 is not set
# CONFIG_TI_ADS7950 is not set
# CONFIG_TI_TLC4541 is not set
# CONFIG_VIPERBOARD_ADC is not set
# CONFIG_XILINX_XADC is not set
# end of Analog to digital converters

#
# Analog Front Ends
#
# end of Analog Front Ends

#
# Amplifiers
#
# CONFIG_AD8366 is not set
# end of Amplifiers

#
# Chemical Sensors
#
# CONFIG_ATLAS_PH_SENSOR is not set
# CONFIG_BME680 is not set
# CONFIG_CCS811 is not set
# CONFIG_IAQCORE is not set
# CONFIG_SENSIRION_SGP30 is not set
# CONFIG_SPS30 is not set
# CONFIG_VZ89X is not set
# end of Chemical Sensors

#
# Hid Sensor IIO Common
#
CONFIG_HID_SENSOR_IIO_COMMON=m
CONFIG_HID_SENSOR_IIO_TRIGGER=m
# end of Hid Sensor IIO Common

#
# SSP Sensor Common
#
# CONFIG_IIO_SSP_SENSORHUB is not set
# end of SSP Sensor Common

#
# Digital to analog converters
#
# CONFIG_AD5064 is not set
# CONFIG_AD5360 is not set
# CONFIG_AD5380 is not set
# CONFIG_AD5421 is not set
# CONFIG_AD5446 is not set
# CONFIG_AD5449 is not set
# CONFIG_AD5592R is not set
# CONFIG_AD5593R is not set
# CONFIG_AD5504 is not set
# CONFIG_AD5624R_SPI is not set
# CONFIG_LTC1660 is not set
# CONFIG_LTC2632 is not set
# CONFIG_AD5686_SPI is not set
# CONFIG_AD5696_I2C is not set
# CONFIG_AD5755 is not set
# CONFIG_AD5758 is not set
# CONFIG_AD5761 is not set
# CONFIG_AD5764 is not set
# CONFIG_AD5791 is not set
# CONFIG_AD7303 is not set
# CONFIG_AD8801 is not set
# CONFIG_DS4424 is not set
# CONFIG_M62332 is not set
# CONFIG_MAX517 is not set
# CONFIG_MCP4725 is not set
# CONFIG_MCP4922 is not set
# CONFIG_TI_DAC082S085 is not set
# CONFIG_TI_DAC5571 is not set
# CONFIG_TI_DAC7311 is not set
# CONFIG_TI_DAC7612 is not set
# end of Digital to analog converters

#
# IIO dummy driver
#
# end of IIO dummy driver

#
# Frequency Synthesizers DDS/PLL
#

#
# Clock Generator/Distribution
#
# CONFIG_AD9523 is not set
# end of Clock Generator/Distribution

#
# Phase-Locked Loop (PLL) frequency synthesizers
#
# CONFIG_ADF4350 is not set
# CONFIG_ADF4371 is not set
# end of Phase-Locked Loop (PLL) frequency synthesizers
# end of Frequency Synthesizers DDS/PLL

#
# Digital gyroscope sensors
#
# CONFIG_ADIS16080 is not set
# CONFIG_ADIS16130 is not set
# CONFIG_ADIS16136 is not set
# CONFIG_ADIS16260 is not set
# CONFIG_ADXRS450 is not set
# CONFIG_BMG160 is not set
# CONFIG_FXAS21002C is not set
CONFIG_HID_SENSOR_GYRO_3D=m
# CONFIG_MPU3050_I2C is not set
# CONFIG_IIO_ST_GYRO_3AXIS is not set
# CONFIG_ITG3200 is not set
# end of Digital gyroscope sensors

#
# Health Sensors
#

#
# Heart Rate Monitors
#
# CONFIG_AFE4403 is not set
# CONFIG_AFE4404 is not set
# CONFIG_MAX30100 is not set
# CONFIG_MAX30102 is not set
# end of Heart Rate Monitors
# end of Health Sensors

#
# Humidity sensors
#
# CONFIG_AM2315 is not set
# CONFIG_DHT11 is not set
# CONFIG_HDC100X is not set
# CONFIG_HID_SENSOR_HUMIDITY is not set
# CONFIG_HTS221 is not set
# CONFIG_HTU21 is not set
# CONFIG_SI7005 is not set
# CONFIG_SI7020 is not set
# end of Humidity sensors

#
# Inertial measurement units
#
# CONFIG_ADIS16400 is not set
# CONFIG_ADIS16460 is not set
# CONFIG_ADIS16480 is not set
# CONFIG_BMI160_I2C is not set
# CONFIG_BMI160_SPI is not set
# CONFIG_KMX61 is not set
# CONFIG_INV_MPU6050_I2C is not set
# CONFIG_INV_MPU6050_SPI is not set
# CONFIG_IIO_ST_LSM6DSX is not set
# end of Inertial measurement units

#
# Light sensors
#
# CONFIG_ACPI_ALS is not set
# CONFIG_ADJD_S311 is not set
# CONFIG_AL3320A is not set
# CONFIG_APDS9300 is not set
# CONFIG_APDS9960 is not set
# CONFIG_BH1750 is not set
# CONFIG_BH1780 is not set
# CONFIG_CM32181 is not set
# CONFIG_CM3232 is not set
# CONFIG_CM3323 is not set
# CONFIG_CM36651 is not set
# CONFIG_GP2AP020A00F is not set
# CONFIG_SENSORS_ISL29018 is not set
# CONFIG_SENSORS_ISL29028 is not set
# CONFIG_ISL29125 is not set
CONFIG_HID_SENSOR_ALS=m
CONFIG_HID_SENSOR_PROX=m
# CONFIG_JSA1212 is not set
# CONFIG_RPR0521 is not set
# CONFIG_LTR501 is not set
# CONFIG_LV0104CS is not set
# CONFIG_MAX44000 is not set
# CONFIG_MAX44009 is not set
# CONFIG_NOA1305 is not set
# CONFIG_OPT3001 is not set
# CONFIG_PA12203001 is not set
# CONFIG_SI1133 is not set
# CONFIG_SI1145 is not set
# CONFIG_STK3310 is not set
# CONFIG_ST_UVIS25 is not set
# CONFIG_TCS3414 is not set
# CONFIG_TCS3472 is not set
# CONFIG_SENSORS_TSL2563 is not set
# CONFIG_TSL2583 is not set
# CONFIG_TSL2772 is not set
# CONFIG_TSL4531 is not set
# CONFIG_US5182D is not set
# CONFIG_VCNL4000 is not set
# CONFIG_VCNL4035 is not set
# CONFIG_VEML6070 is not set
# CONFIG_VL6180 is not set
# CONFIG_ZOPT2201 is not set
# end of Light sensors

#
# Magnetometer sensors
#
# CONFIG_AK8975 is not set
# CONFIG_AK09911 is not set
# CONFIG_BMC150_MAGN_I2C is not set
# CONFIG_BMC150_MAGN_SPI is not set
# CONFIG_MAG3110 is not set
CONFIG_HID_SENSOR_MAGNETOMETER_3D=m
# CONFIG_MMC35240 is not set
# CONFIG_IIO_ST_MAGN_3AXIS is not set
# CONFIG_SENSORS_HMC5843_I2C is not set
# CONFIG_SENSORS_HMC5843_SPI is not set
# CONFIG_SENSORS_RM3100_I2C is not set
# CONFIG_SENSORS_RM3100_SPI is not set
# end of Magnetometer sensors

#
# Multiplexers
#
# end of Multiplexers

#
# Inclinometer sensors
#
CONFIG_HID_SENSOR_INCLINOMETER_3D=m
CONFIG_HID_SENSOR_DEVICE_ROTATION=m
# end of Inclinometer sensors

#
# Triggers - standalone
#
# CONFIG_IIO_INTERRUPT_TRIGGER is not set
# CONFIG_IIO_SYSFS_TRIGGER is not set
# end of Triggers - standalone

#
# Digital potentiometers
#
# CONFIG_AD5272 is not set
# CONFIG_DS1803 is not set
# CONFIG_MAX5432 is not set
# CONFIG_MAX5481 is not set
# CONFIG_MAX5487 is not set
# CONFIG_MCP4018 is not set
# CONFIG_MCP4131 is not set
# CONFIG_MCP4531 is not set
# CONFIG_MCP41010 is not set
# CONFIG_TPL0102 is not set
# end of Digital potentiometers

#
# Digital potentiostats
#
# CONFIG_LMP91000 is not set
# end of Digital potentiostats

#
# Pressure sensors
#
# CONFIG_ABP060MG is not set
# CONFIG_BMP280 is not set
# CONFIG_DPS310 is not set
CONFIG_HID_SENSOR_PRESS=m
# CONFIG_HP03 is not set
# CONFIG_MPL115_I2C is not set
# CONFIG_MPL115_SPI is not set
# CONFIG_MPL3115 is not set
# CONFIG_MS5611 is not set
# CONFIG_MS5637 is not set
# CONFIG_IIO_ST_PRESS is not set
# CONFIG_T5403 is not set
# CONFIG_HP206C is not set
# CONFIG_ZPA2326 is not set
# end of Pressure sensors

#
# Lightning sensors
#
# CONFIG_AS3935 is not set
# end of Lightning sensors

#
# Proximity and distance sensors
#
# CONFIG_ISL29501 is not set
# CONFIG_LIDAR_LITE_V2 is not set
# CONFIG_MB1232 is not set
# CONFIG_RFD77402 is not set
# CONFIG_SRF04 is not set
# CONFIG_SX9500 is not set
# CONFIG_SRF08 is not set
# CONFIG_VL53L0X_I2C is not set
# end of Proximity and distance sensors

#
# Resolver to digital converters
#
# CONFIG_AD2S90 is not set
# CONFIG_AD2S1200 is not set
# end of Resolver to digital converters

#
# Temperature sensors
#
# CONFIG_MAXIM_THERMOCOUPLE is not set
# CONFIG_HID_SENSOR_TEMP is not set
# CONFIG_MLX90614 is not set
# CONFIG_MLX90632 is not set
# CONFIG_TMP006 is not set
# CONFIG_TMP007 is not set
# CONFIG_TSYS01 is not set
# CONFIG_TSYS02D is not set
# CONFIG_MAX31856 is not set
# end of Temperature sensors

CONFIG_NTB=m
# CONFIG_NTB_MSI is not set
CONFIG_NTB_AMD=m
# CONFIG_NTB_IDT is not set
# CONFIG_NTB_INTEL is not set
# CONFIG_NTB_SWITCHTEC is not set
# CONFIG_NTB_PINGPONG is not set
# CONFIG_NTB_TOOL is not set
CONFIG_NTB_PERF=m
CONFIG_NTB_TRANSPORT=m
# CONFIG_VME_BUS is not set
CONFIG_PWM=y
CONFIG_PWM_SYSFS=y
# CONFIG_PWM_LPSS_PCI is not set
# CONFIG_PWM_LPSS_PLATFORM is not set
# CONFIG_PWM_PCA9685 is not set

#
# IRQ chip support
#
# end of IRQ chip support

# CONFIG_IPACK_BUS is not set
# CONFIG_RESET_CONTROLLER is not set

#
# PHY Subsystem
#
CONFIG_GENERIC_PHY=y
# CONFIG_BCM_KONA_USB2_PHY is not set
# CONFIG_PHY_PXA_28NM_HSIC is not set
# CONFIG_PHY_PXA_28NM_USB2 is not set
# CONFIG_PHY_CPCAP_USB is not set
# end of PHY Subsystem

CONFIG_POWERCAP=y
CONFIG_INTEL_RAPL_CORE=m
CONFIG_INTEL_RAPL=m
# CONFIG_IDLE_INJECT is not set
# CONFIG_MCB is not set

#
# Performance monitor support
#
# end of Performance monitor support

CONFIG_RAS=y
# CONFIG_RAS_CEC is not set
CONFIG_THUNDERBOLT=y

#
# Android
#
CONFIG_ANDROID=y
# CONFIG_ANDROID_BINDER_IPC is not set
# end of Android

CONFIG_LIBNVDIMM=m
CONFIG_BLK_DEV_PMEM=m
CONFIG_ND_BLK=m
CONFIG_ND_CLAIM=y
CONFIG_ND_BTT=m
CONFIG_BTT=y
CONFIG_ND_PFN=m
CONFIG_NVDIMM_PFN=y
CONFIG_NVDIMM_DAX=y
CONFIG_NVDIMM_KEYS=y
CONFIG_DAX_DRIVER=y
CONFIG_DAX=y
CONFIG_DEV_DAX=y
CONFIG_DEV_DAX_PMEM=m
CONFIG_DEV_DAX_KMEM=y
CONFIG_DEV_DAX_PMEM_COMPAT=m
CONFIG_NVMEM=y
CONFIG_NVMEM_SYSFS=y

#
# HW tracing support
#
# CONFIG_STM is not set
# CONFIG_INTEL_TH is not set
# end of HW tracing support

# CONFIG_FPGA is not set
CONFIG_PM_OPP=y
# CONFIG_UNISYS_VISORBUS is not set
# CONFIG_SIOX is not set
# CONFIG_SLIMBUS is not set
# CONFIG_INTERCONNECT is not set
# CONFIG_COUNTER is not set
# end of Device Drivers

#
# File systems
#
CONFIG_DCACHE_WORD_ACCESS=y
# CONFIG_VALIDATE_FS_PARSER is not set
CONFIG_FS_IOMAP=y
# CONFIG_EXT2_FS is not set
# CONFIG_EXT3_FS is not set
CONFIG_EXT4_FS=m
CONFIG_EXT4_USE_FOR_EXT2=y
CONFIG_EXT4_FS_POSIX_ACL=y
CONFIG_EXT4_FS_SECURITY=y
# CONFIG_EXT4_DEBUG is not set
CONFIG_JBD2=m
# CONFIG_JBD2_DEBUG is not set
CONFIG_FS_MBCACHE=m
# CONFIG_REISERFS_FS is not set
# CONFIG_JFS_FS is not set
CONFIG_XFS_FS=m
CONFIG_XFS_QUOTA=y
CONFIG_XFS_POSIX_ACL=y
CONFIG_XFS_RT=y
CONFIG_XFS_ONLINE_SCRUB=y
CONFIG_XFS_ONLINE_REPAIR=y
CONFIG_XFS_DEBUG=y
CONFIG_XFS_ASSERT_FATAL=y
CONFIG_GFS2_FS=m
CONFIG_GFS2_FS_LOCKING_DLM=y
CONFIG_OCFS2_FS=m
CONFIG_OCFS2_FS_O2CB=m
CONFIG_OCFS2_FS_USERSPACE_CLUSTER=m
CONFIG_OCFS2_FS_STATS=y
CONFIG_OCFS2_DEBUG_MASKLOG=y
# CONFIG_OCFS2_DEBUG_FS is not set
CONFIG_BTRFS_FS=m
CONFIG_BTRFS_FS_POSIX_ACL=y
# CONFIG_BTRFS_FS_CHECK_INTEGRITY is not set
# CONFIG_BTRFS_FS_RUN_SANITY_TESTS is not set
# CONFIG_BTRFS_DEBUG is not set
# CONFIG_BTRFS_ASSERT is not set
# CONFIG_BTRFS_FS_REF_VERIFY is not set
# CONFIG_NILFS2_FS is not set
CONFIG_F2FS_FS=m
CONFIG_F2FS_STAT_FS=y
CONFIG_F2FS_FS_XATTR=y
CONFIG_F2FS_FS_POSIX_ACL=y
# CONFIG_F2FS_FS_SECURITY is not set
# CONFIG_F2FS_CHECK_FS is not set
# CONFIG_F2FS_IO_TRACE is not set
# CONFIG_F2FS_FAULT_INJECTION is not set
CONFIG_FS_DAX=y
CONFIG_FS_DAX_PMD=y
CONFIG_FS_POSIX_ACL=y
CONFIG_EXPORTFS=y
CONFIG_EXPORTFS_BLOCK_OPS=y
CONFIG_FILE_LOCKING=y
CONFIG_MANDATORY_FILE_LOCKING=y
CONFIG_FS_ENCRYPTION=y
# CONFIG_FS_VERITY is not set
CONFIG_FSNOTIFY=y
CONFIG_DNOTIFY=y
CONFIG_INOTIFY_USER=y
CONFIG_FANOTIFY=y
CONFIG_FANOTIFY_ACCESS_PERMISSIONS=y
CONFIG_QUOTA=y
CONFIG_QUOTA_NETLINK_INTERFACE=y
CONFIG_PRINT_QUOTA_WARNING=y
# CONFIG_QUOTA_DEBUG is not set
CONFIG_QUOTA_TREE=y
# CONFIG_QFMT_V1 is not set
CONFIG_QFMT_V2=y
CONFIG_QUOTACTL=y
CONFIG_QUOTACTL_COMPAT=y
CONFIG_AUTOFS4_FS=y
CONFIG_AUTOFS_FS=y
CONFIG_FUSE_FS=m
CONFIG_CUSE=m
# CONFIG_VIRTIO_FS is not set
CONFIG_OVERLAY_FS=m
# CONFIG_OVERLAY_FS_REDIRECT_DIR is not set
# CONFIG_OVERLAY_FS_REDIRECT_ALWAYS_FOLLOW is not set
# CONFIG_OVERLAY_FS_INDEX is not set
# CONFIG_OVERLAY_FS_XINO_AUTO is not set
# CONFIG_OVERLAY_FS_METACOPY is not set

#
# Caches
#
CONFIG_FSCACHE=m
CONFIG_FSCACHE_STATS=y
# CONFIG_FSCACHE_HISTOGRAM is not set
# CONFIG_FSCACHE_DEBUG is not set
# CONFIG_FSCACHE_OBJECT_LIST is not set
CONFIG_CACHEFILES=m
# CONFIG_CACHEFILES_DEBUG is not set
# CONFIG_CACHEFILES_HISTOGRAM is not set
# end of Caches

#
# CD-ROM/DVD Filesystems
#
CONFIG_ISO9660_FS=m
CONFIG_JOLIET=y
CONFIG_ZISOFS=y
CONFIG_UDF_FS=m
# end of CD-ROM/DVD Filesystems

#
# DOS/FAT/NT Filesystems
#
CONFIG_FAT_FS=m
CONFIG_MSDOS_FS=m
CONFIG_VFAT_FS=m
CONFIG_FAT_DEFAULT_CODEPAGE=437
CONFIG_FAT_DEFAULT_IOCHARSET="ascii"
# CONFIG_FAT_DEFAULT_UTF8 is not set
# CONFIG_NTFS_FS is not set
# end of DOS/FAT/NT Filesystems

#
# Pseudo filesystems
#
CONFIG_PROC_FS=y
CONFIG_PROC_KCORE=y
CONFIG_PROC_VMCORE=y
# CONFIG_PROC_VMCORE_DEVICE_DUMP is not set
CONFIG_PROC_SYSCTL=y
CONFIG_PROC_PAGE_MONITOR=y
CONFIG_PROC_CHILDREN=y
CONFIG_PROC_PID_ARCH_STATUS=y
CONFIG_KERNFS=y
CONFIG_SYSFS=y
CONFIG_TMPFS=y
CONFIG_TMPFS_POSIX_ACL=y
CONFIG_TMPFS_XATTR=y
CONFIG_HUGETLBFS=y
CONFIG_HUGETLB_PAGE=y
CONFIG_MEMFD_CREATE=y
CONFIG_ARCH_HAS_GIGANTIC_PAGE=y
CONFIG_CONFIGFS_FS=y
CONFIG_EFIVAR_FS=y
# end of Pseudo filesystems

CONFIG_MISC_FILESYSTEMS=y
# CONFIG_ORANGEFS_FS is not set
# CONFIG_ADFS_FS is not set
# CONFIG_AFFS_FS is not set
# CONFIG_ECRYPT_FS is not set
# CONFIG_HFS_FS is not set
# CONFIG_HFSPLUS_FS is not set
# CONFIG_BEFS_FS is not set
# CONFIG_BFS_FS is not set
# CONFIG_EFS_FS is not set
# CONFIG_JFFS2_FS is not set
# CONFIG_UBIFS_FS is not set
CONFIG_CRAMFS=m
CONFIG_CRAMFS_BLOCKDEV=y
# CONFIG_CRAMFS_MTD is not set
CONFIG_SQUASHFS=m
CONFIG_SQUASHFS_FILE_CACHE=y
# CONFIG_SQUASHFS_FILE_DIRECT is not set
CONFIG_SQUASHFS_DECOMP_SINGLE=y
# CONFIG_SQUASHFS_DECOMP_MULTI is not set
# CONFIG_SQUASHFS_DECOMP_MULTI_PERCPU is not set
CONFIG_SQUASHFS_XATTR=y
CONFIG_SQUASHFS_ZLIB=y
# CONFIG_SQUASHFS_LZ4 is not set
CONFIG_SQUASHFS_LZO=y
CONFIG_SQUASHFS_XZ=y
# CONFIG_SQUASHFS_ZSTD is not set
# CONFIG_SQUASHFS_4K_DEVBLK_SIZE is not set
# CONFIG_SQUASHFS_EMBEDDED is not set
CONFIG_SQUASHFS_FRAGMENT_CACHE_SIZE=3
# CONFIG_VXFS_FS is not set
CONFIG_MINIX_FS=m
# CONFIG_OMFS_FS is not set
# CONFIG_HPFS_FS is not set
# CONFIG_QNX4FS_FS is not set
# CONFIG_QNX6FS_FS is not set
# CONFIG_ROMFS_FS is not set
CONFIG_PSTORE=y
CONFIG_PSTORE_DEFLATE_COMPRESS=y
# CONFIG_PSTORE_LZO_COMPRESS is not set
# CONFIG_PSTORE_LZ4_COMPRESS is not set
# CONFIG_PSTORE_LZ4HC_COMPRESS is not set
# CONFIG_PSTORE_842_COMPRESS is not set
# CONFIG_PSTORE_ZSTD_COMPRESS is not set
CONFIG_PSTORE_COMPRESS=y
CONFIG_PSTORE_DEFLATE_COMPRESS_DEFAULT=y
CONFIG_PSTORE_COMPRESS_DEFAULT="deflate"
CONFIG_PSTORE_CONSOLE=y
CONFIG_PSTORE_PMSG=y
# CONFIG_PSTORE_FTRACE is not set
CONFIG_PSTORE_RAM=m
# CONFIG_SYSV_FS is not set
# CONFIG_UFS_FS is not set
# CONFIG_EROFS_FS is not set
CONFIG_NETWORK_FILESYSTEMS=y
CONFIG_NFS_FS=y
# CONFIG_NFS_V2 is not set
CONFIG_NFS_V3=y
CONFIG_NFS_V3_ACL=y
CONFIG_NFS_V4=m
# CONFIG_NFS_SWAP is not set
CONFIG_NFS_V4_1=y
CONFIG_NFS_V4_2=y
CONFIG_PNFS_FILE_LAYOUT=m
CONFIG_PNFS_BLOCK=m
CONFIG_PNFS_FLEXFILE_LAYOUT=m
CONFIG_NFS_V4_1_IMPLEMENTATION_ID_DOMAIN="kernel.org"
# CONFIG_NFS_V4_1_MIGRATION is not set
CONFIG_NFS_V4_SECURITY_LABEL=y
CONFIG_ROOT_NFS=y
# CONFIG_NFS_USE_LEGACY_DNS is not set
CONFIG_NFS_USE_KERNEL_DNS=y
CONFIG_NFS_DEBUG=y
CONFIG_NFSD=m
CONFIG_NFSD_V2_ACL=y
CONFIG_NFSD_V3=y
CONFIG_NFSD_V3_ACL=y
CONFIG_NFSD_V4=y
CONFIG_NFSD_PNFS=y
# CONFIG_NFSD_BLOCKLAYOUT is not set
CONFIG_NFSD_SCSILAYOUT=y
# CONFIG_NFSD_FLEXFILELAYOUT is not set
CONFIG_NFSD_V4_SECURITY_LABEL=y
CONFIG_GRACE_PERIOD=y
CONFIG_LOCKD=y
CONFIG_LOCKD_V4=y
CONFIG_NFS_ACL_SUPPORT=y
CONFIG_NFS_COMMON=y
CONFIG_SUNRPC=y
CONFIG_SUNRPC_GSS=m
CONFIG_SUNRPC_BACKCHANNEL=y
CONFIG_RPCSEC_GSS_KRB5=m
# CONFIG_SUNRPC_DISABLE_INSECURE_ENCTYPES is not set
CONFIG_SUNRPC_DEBUG=y
CONFIG_CEPH_FS=m
# CONFIG_CEPH_FSCACHE is not set
CONFIG_CEPH_FS_POSIX_ACL=y
# CONFIG_CEPH_FS_SECURITY_LABEL is not set
CONFIG_CIFS=m
# CONFIG_CIFS_STATS2 is not set
CONFIG_CIFS_ALLOW_INSECURE_LEGACY=y
CONFIG_CIFS_WEAK_PW_HASH=y
CONFIG_CIFS_UPCALL=y
CONFIG_CIFS_XATTR=y
CONFIG_CIFS_POSIX=y
CONFIG_CIFS_DEBUG=y
# CONFIG_CIFS_DEBUG2 is not set
# CONFIG_CIFS_DEBUG_DUMP_KEYS is not set
CONFIG_CIFS_DFS_UPCALL=y
# CONFIG_CIFS_FSCACHE is not set
# CONFIG_CODA_FS is not set
# CONFIG_AFS_FS is not set
CONFIG_9P_FS=y
CONFIG_9P_FS_POSIX_ACL=y
# CONFIG_9P_FS_SECURITY is not set
CONFIG_NLS=y
CONFIG_NLS_DEFAULT="utf8"
CONFIG_NLS_CODEPAGE_437=y
CONFIG_NLS_CODEPAGE_737=m
CONFIG_NLS_CODEPAGE_775=m
CONFIG_NLS_CODEPAGE_850=m
CONFIG_NLS_CODEPAGE_852=m
CONFIG_NLS_CODEPAGE_855=m
CONFIG_NLS_CODEPAGE_857=m
CONFIG_NLS_CODEPAGE_860=m
CONFIG_NLS_CODEPAGE_861=m
CONFIG_NLS_CODEPAGE_862=m
CONFIG_NLS_CODEPAGE_863=m
CONFIG_NLS_CODEPAGE_864=m
CONFIG_NLS_CODEPAGE_865=m
CONFIG_NLS_CODEPAGE_866=m
CONFIG_NLS_CODEPAGE_869=m
CONFIG_NLS_CODEPAGE_936=m
CONFIG_NLS_CODEPAGE_950=m
CONFIG_NLS_CODEPAGE_932=m
CONFIG_NLS_CODEPAGE_949=m
CONFIG_NLS_CODEPAGE_874=m
CONFIG_NLS_ISO8859_8=m
CONFIG_NLS_CODEPAGE_1250=m
CONFIG_NLS_CODEPAGE_1251=m
CONFIG_NLS_ASCII=y
CONFIG_NLS_ISO8859_1=m
CONFIG_NLS_ISO8859_2=m
CONFIG_NLS_ISO8859_3=m
CONFIG_NLS_ISO8859_4=m
CONFIG_NLS_ISO8859_5=m
CONFIG_NLS_ISO8859_6=m
CONFIG_NLS_ISO8859_7=m
CONFIG_NLS_ISO8859_9=m
CONFIG_NLS_ISO8859_13=m
CONFIG_NLS_ISO8859_14=m
CONFIG_NLS_ISO8859_15=m
CONFIG_NLS_KOI8_R=m
CONFIG_NLS_KOI8_U=m
CONFIG_NLS_MAC_ROMAN=m
CONFIG_NLS_MAC_CELTIC=m
CONFIG_NLS_MAC_CENTEURO=m
CONFIG_NLS_MAC_CROATIAN=m
CONFIG_NLS_MAC_CYRILLIC=m
CONFIG_NLS_MAC_GAELIC=m
CONFIG_NLS_MAC_GREEK=m
CONFIG_NLS_MAC_ICELAND=m
CONFIG_NLS_MAC_INUIT=m
CONFIG_NLS_MAC_ROMANIAN=m
CONFIG_NLS_MAC_TURKISH=m
CONFIG_NLS_UTF8=m
CONFIG_DLM=m
CONFIG_DLM_DEBUG=y
# CONFIG_UNICODE is not set
# end of File systems

#
# Security options
#
CONFIG_KEYS=y
CONFIG_KEYS_COMPAT=y
# CONFIG_KEYS_REQUEST_CACHE is not set
CONFIG_PERSISTENT_KEYRINGS=y
CONFIG_BIG_KEYS=y
CONFIG_TRUSTED_KEYS=y
CONFIG_ENCRYPTED_KEYS=y
# CONFIG_KEY_DH_OPERATIONS is not set
# CONFIG_SECURITY_DMESG_RESTRICT is not set
CONFIG_SECURITY=y
CONFIG_SECURITY_WRITABLE_HOOKS=y
CONFIG_SECURITYFS=y
CONFIG_SECURITY_NETWORK=y
CONFIG_PAGE_TABLE_ISOLATION=y
CONFIG_SECURITY_NETWORK_XFRM=y
CONFIG_SECURITY_PATH=y
CONFIG_INTEL_TXT=y
CONFIG_LSM_MMAP_MIN_ADDR=65535
CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=y
CONFIG_HARDENED_USERCOPY=y
CONFIG_HARDENED_USERCOPY_FALLBACK=y
# CONFIG_HARDENED_USERCOPY_PAGESPAN is not set
# CONFIG_FORTIFY_SOURCE is not set
# CONFIG_STATIC_USERMODEHELPER is not set
CONFIG_SECURITY_SELINUX=y
CONFIG_SECURITY_SELINUX_BOOTPARAM=y
CONFIG_SECURITY_SELINUX_DISABLE=y
CONFIG_SECURITY_SELINUX_DEVELOP=y
CONFIG_SECURITY_SELINUX_AVC_STATS=y
CONFIG_SECURITY_SELINUX_CHECKREQPROT_VALUE=1
# CONFIG_SECURITY_SMACK is not set
# CONFIG_SECURITY_TOMOYO is not set
CONFIG_SECURITY_APPARMOR=y
CONFIG_SECURITY_APPARMOR_HASH=y
CONFIG_SECURITY_APPARMOR_HASH_DEFAULT=y
# CONFIG_SECURITY_APPARMOR_DEBUG is not set
# CONFIG_SECURITY_LOADPIN is not set
CONFIG_SECURITY_YAMA=y
# CONFIG_SECURITY_SAFESETID is not set
# CONFIG_SECURITY_LOCKDOWN_LSM is not set
CONFIG_INTEGRITY=y
CONFIG_INTEGRITY_SIGNATURE=y
CONFIG_INTEGRITY_ASYMMETRIC_KEYS=y
CONFIG_INTEGRITY_TRUSTED_KEYRING=y
# CONFIG_INTEGRITY_PLATFORM_KEYRING is not set
CONFIG_INTEGRITY_AUDIT=y
CONFIG_IMA=y
CONFIG_IMA_MEASURE_PCR_IDX=10
CONFIG_IMA_LSM_RULES=y
# CONFIG_IMA_TEMPLATE is not set
CONFIG_IMA_NG_TEMPLATE=y
# CONFIG_IMA_SIG_TEMPLATE is not set
CONFIG_IMA_DEFAULT_TEMPLATE="ima-ng"
CONFIG_IMA_DEFAULT_HASH_SHA1=y
# CONFIG_IMA_DEFAULT_HASH_SHA256 is not set
# CONFIG_IMA_DEFAULT_HASH_SHA512 is not set
CONFIG_IMA_DEFAULT_HASH="sha1"
# CONFIG_IMA_WRITE_POLICY is not set
# CONFIG_IMA_READ_POLICY is not set
CONFIG_IMA_APPRAISE=y
# CONFIG_IMA_ARCH_POLICY is not set
# CONFIG_IMA_APPRAISE_BUILD_POLICY is not set
CONFIG_IMA_APPRAISE_BOOTPARAM=y
# CONFIG_IMA_APPRAISE_MODSIG is not set
CONFIG_IMA_TRUSTED_KEYRING=y
# CONFIG_IMA_BLACKLIST_KEYRING is not set
# CONFIG_IMA_LOAD_X509 is not set
CONFIG_EVM=y
CONFIG_EVM_ATTR_FSUUID=y
# CONFIG_EVM_ADD_XATTRS is not set
# CONFIG_EVM_LOAD_X509 is not set
CONFIG_DEFAULT_SECURITY_SELINUX=y
# CONFIG_DEFAULT_SECURITY_APPARMOR is not set
# CONFIG_DEFAULT_SECURITY_DAC is not set
CONFIG_LSM="lockdown,yama,loadpin,safesetid,integrity,selinux,smack,tomoyo,apparmor"

#
# Kernel hardening options
#

#
# Memory initialization
#
CONFIG_INIT_STACK_NONE=y
# CONFIG_GCC_PLUGIN_STRUCTLEAK_USER is not set
# CONFIG_GCC_PLUGIN_STRUCTLEAK_BYREF is not set
# CONFIG_GCC_PLUGIN_STRUCTLEAK_BYREF_ALL is not set
# CONFIG_GCC_PLUGIN_STACKLEAK is not set
# CONFIG_INIT_ON_ALLOC_DEFAULT_ON is not set
# CONFIG_INIT_ON_FREE_DEFAULT_ON is not set
# end of Memory initialization
# end of Kernel hardening options
# end of Security options

CONFIG_XOR_BLOCKS=m
CONFIG_ASYNC_CORE=m
CONFIG_ASYNC_MEMCPY=m
CONFIG_ASYNC_XOR=m
CONFIG_ASYNC_PQ=m
CONFIG_ASYNC_RAID6_RECOV=m
CONFIG_CRYPTO=y

#
# Crypto core or helper
#
CONFIG_CRYPTO_ALGAPI=y
CONFIG_CRYPTO_ALGAPI2=y
CONFIG_CRYPTO_AEAD=y
CONFIG_CRYPTO_AEAD2=y
CONFIG_CRYPTO_BLKCIPHER=y
CONFIG_CRYPTO_BLKCIPHER2=y
CONFIG_CRYPTO_HASH=y
CONFIG_CRYPTO_HASH2=y
CONFIG_CRYPTO_RNG=y
CONFIG_CRYPTO_RNG2=y
CONFIG_CRYPTO_RNG_DEFAULT=y
CONFIG_CRYPTO_AKCIPHER2=y
CONFIG_CRYPTO_AKCIPHER=y
CONFIG_CRYPTO_KPP2=y
CONFIG_CRYPTO_KPP=m
CONFIG_CRYPTO_ACOMP2=y
CONFIG_CRYPTO_MANAGER=y
CONFIG_CRYPTO_MANAGER2=y
CONFIG_CRYPTO_USER=m
CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
CONFIG_CRYPTO_GF128MUL=y
CONFIG_CRYPTO_NULL=y
CONFIG_CRYPTO_NULL2=y
CONFIG_CRYPTO_PCRYPT=m
CONFIG_CRYPTO_CRYPTD=m
CONFIG_CRYPTO_AUTHENC=m
CONFIG_CRYPTO_TEST=m
CONFIG_CRYPTO_SIMD=m
CONFIG_CRYPTO_GLUE_HELPER_X86=m
CONFIG_CRYPTO_ENGINE=m

#
# Public-key cryptography
#
CONFIG_CRYPTO_RSA=y
CONFIG_CRYPTO_DH=m
CONFIG_CRYPTO_ECC=m
CONFIG_CRYPTO_ECDH=m
# CONFIG_CRYPTO_ECRDSA is not set

#
# Authenticated Encryption with Associated Data
#
CONFIG_CRYPTO_CCM=m
CONFIG_CRYPTO_GCM=y
# CONFIG_CRYPTO_CHACHA20POLY1305 is not set
# CONFIG_CRYPTO_AEGIS128 is not set
# CONFIG_CRYPTO_AEGIS128_AESNI_SSE2 is not set
CONFIG_CRYPTO_SEQIV=y
CONFIG_CRYPTO_ECHAINIV=m

#
# Block modes
#
CONFIG_CRYPTO_CBC=y
# CONFIG_CRYPTO_CFB is not set
CONFIG_CRYPTO_CTR=y
CONFIG_CRYPTO_CTS=y
CONFIG_CRYPTO_ECB=y
CONFIG_CRYPTO_LRW=m
# CONFIG_CRYPTO_OFB is not set
CONFIG_CRYPTO_PCBC=m
CONFIG_CRYPTO_XTS=y
# CONFIG_CRYPTO_KEYWRAP is not set
# CONFIG_CRYPTO_NHPOLY1305_SSE2 is not set
# CONFIG_CRYPTO_NHPOLY1305_AVX2 is not set
# CONFIG_CRYPTO_ADIANTUM is not set
CONFIG_CRYPTO_ESSIV=m

#
# Hash modes
#
CONFIG_CRYPTO_CMAC=m
CONFIG_CRYPTO_HMAC=y
CONFIG_CRYPTO_XCBC=m
CONFIG_CRYPTO_VMAC=m

#
# Digest
#
CONFIG_CRYPTO_CRC32C=y
CONFIG_CRYPTO_CRC32C_INTEL=m
CONFIG_CRYPTO_CRC32=m
CONFIG_CRYPTO_CRC32_PCLMUL=m
# CONFIG_CRYPTO_XXHASH is not set
CONFIG_CRYPTO_CRCT10DIF=y
CONFIG_CRYPTO_CRCT10DIF_PCLMUL=m
CONFIG_CRYPTO_GHASH=y
# CONFIG_CRYPTO_POLY1305 is not set
# CONFIG_CRYPTO_POLY1305_X86_64 is not set
CONFIG_CRYPTO_MD4=m
CONFIG_CRYPTO_MD5=y
CONFIG_CRYPTO_MICHAEL_MIC=m
CONFIG_CRYPTO_RMD128=m
CONFIG_CRYPTO_RMD160=m
CONFIG_CRYPTO_RMD256=m
CONFIG_CRYPTO_RMD320=m
CONFIG_CRYPTO_SHA1=y
CONFIG_CRYPTO_SHA1_SSSE3=y
CONFIG_CRYPTO_SHA256_SSSE3=y
CONFIG_CRYPTO_SHA512_SSSE3=m
CONFIG_CRYPTO_LIB_SHA256=y
CONFIG_CRYPTO_SHA256=y
CONFIG_CRYPTO_SHA512=y
# CONFIG_CRYPTO_SHA3 is not set
# CONFIG_CRYPTO_SM3 is not set
# CONFIG_CRYPTO_STREEBOG is not set
CONFIG_CRYPTO_TGR192=m
CONFIG_CRYPTO_WP512=m
CONFIG_CRYPTO_GHASH_CLMUL_NI_INTEL=m

#
# Ciphers
#
CONFIG_CRYPTO_LIB_AES=y
CONFIG_CRYPTO_AES=y
# CONFIG_CRYPTO_AES_TI is not set
CONFIG_CRYPTO_AES_NI_INTEL=m
CONFIG_CRYPTO_ANUBIS=m
CONFIG_CRYPTO_LIB_ARC4=m
CONFIG_CRYPTO_ARC4=m
CONFIG_CRYPTO_BLOWFISH=m
CONFIG_CRYPTO_BLOWFISH_COMMON=m
CONFIG_CRYPTO_BLOWFISH_X86_64=m
CONFIG_CRYPTO_CAMELLIA=m
CONFIG_CRYPTO_CAMELLIA_X86_64=m
CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64=m
CONFIG_CRYPTO_CAMELLIA_AESNI_AVX2_X86_64=m
CONFIG_CRYPTO_CAST_COMMON=m
CONFIG_CRYPTO_CAST5=m
CONFIG_CRYPTO_CAST5_AVX_X86_64=m
CONFIG_CRYPTO_CAST6=m
CONFIG_CRYPTO_CAST6_AVX_X86_64=m
CONFIG_CRYPTO_LIB_DES=m
CONFIG_CRYPTO_DES=m
# CONFIG_CRYPTO_DES3_EDE_X86_64 is not set
CONFIG_CRYPTO_FCRYPT=m
CONFIG_CRYPTO_KHAZAD=m
CONFIG_CRYPTO_SALSA20=m
# CONFIG_CRYPTO_CHACHA20 is not set
# CONFIG_CRYPTO_CHACHA20_X86_64 is not set
CONFIG_CRYPTO_SEED=m
CONFIG_CRYPTO_SERPENT=m
CONFIG_CRYPTO_SERPENT_SSE2_X86_64=m
CONFIG_CRYPTO_SERPENT_AVX_X86_64=m
CONFIG_CRYPTO_SERPENT_AVX2_X86_64=m
# CONFIG_CRYPTO_SM4 is not set
CONFIG_CRYPTO_TEA=m
CONFIG_CRYPTO_TWOFISH=m
CONFIG_CRYPTO_TWOFISH_COMMON=m
CONFIG_CRYPTO_TWOFISH_X86_64=m
CONFIG_CRYPTO_TWOFISH_X86_64_3WAY=m
CONFIG_CRYPTO_TWOFISH_AVX_X86_64=m

#
# Compression
#
CONFIG_CRYPTO_DEFLATE=y
CONFIG_CRYPTO_LZO=y
# CONFIG_CRYPTO_842 is not set
# CONFIG_CRYPTO_LZ4 is not set
# CONFIG_CRYPTO_LZ4HC is not set
# CONFIG_CRYPTO_ZSTD is not set

#
# Random Number Generation
#
CONFIG_CRYPTO_ANSI_CPRNG=m
CONFIG_CRYPTO_DRBG_MENU=y
CONFIG_CRYPTO_DRBG_HMAC=y
CONFIG_CRYPTO_DRBG_HASH=y
CONFIG_CRYPTO_DRBG_CTR=y
CONFIG_CRYPTO_DRBG=y
CONFIG_CRYPTO_JITTERENTROPY=y
CONFIG_CRYPTO_USER_API=y
CONFIG_CRYPTO_USER_API_HASH=y
CONFIG_CRYPTO_USER_API_SKCIPHER=y
CONFIG_CRYPTO_USER_API_RNG=m
# CONFIG_CRYPTO_USER_API_AEAD is not set
# CONFIG_CRYPTO_STATS is not set
CONFIG_CRYPTO_HASH_INFO=y
CONFIG_CRYPTO_HW=y
CONFIG_CRYPTO_DEV_PADLOCK=m
CONFIG_CRYPTO_DEV_PADLOCK_AES=m
CONFIG_CRYPTO_DEV_PADLOCK_SHA=m
# CONFIG_CRYPTO_DEV_ATMEL_ECC is not set
# CONFIG_CRYPTO_DEV_ATMEL_SHA204A is not set
CONFIG_CRYPTO_DEV_CCP=y
CONFIG_CRYPTO_DEV_CCP_DD=m
CONFIG_CRYPTO_DEV_SP_CCP=y
CONFIG_CRYPTO_DEV_CCP_CRYPTO=m
CONFIG_CRYPTO_DEV_SP_PSP=y
# CONFIG_CRYPTO_DEV_CCP_DEBUGFS is not set
CONFIG_CRYPTO_DEV_QAT=m
CONFIG_CRYPTO_DEV_QAT_DH895xCC=m
CONFIG_CRYPTO_DEV_QAT_C3XXX=m
CONFIG_CRYPTO_DEV_QAT_C62X=m
CONFIG_CRYPTO_DEV_QAT_DH895xCCVF=m
CONFIG_CRYPTO_DEV_QAT_C3XXXVF=m
CONFIG_CRYPTO_DEV_QAT_C62XVF=m
# CONFIG_CRYPTO_DEV_NITROX_CNN55XX is not set
CONFIG_CRYPTO_DEV_CHELSIO=m
CONFIG_CRYPTO_DEV_VIRTIO=m
# CONFIG_CRYPTO_DEV_SAFEXCEL is not set
CONFIG_ASYMMETRIC_KEY_TYPE=y
CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=y
# CONFIG_ASYMMETRIC_TPM_KEY_SUBTYPE is not set
CONFIG_X509_CERTIFICATE_PARSER=y
# CONFIG_PKCS8_PRIVATE_KEY_PARSER is not set
CONFIG_PKCS7_MESSAGE_PARSER=y
# CONFIG_PKCS7_TEST_KEY is not set
CONFIG_SIGNED_PE_FILE_VERIFICATION=y

#
# Certificates for signature checking
#
CONFIG_MODULE_SIG_KEY="certs/signing_key.pem"
CONFIG_SYSTEM_TRUSTED_KEYRING=y
CONFIG_SYSTEM_TRUSTED_KEYS=""
# CONFIG_SYSTEM_EXTRA_CERTIFICATE is not set
# CONFIG_SECONDARY_TRUSTED_KEYRING is not set
CONFIG_SYSTEM_BLACKLIST_KEYRING=y
CONFIG_SYSTEM_BLACKLIST_HASH_LIST=""
# end of Certificates for signature checking

CONFIG_BINARY_PRINTF=y

#
# Library routines
#
CONFIG_RAID6_PQ=m
CONFIG_RAID6_PQ_BENCHMARK=y
# CONFIG_PACKING is not set
CONFIG_BITREVERSE=y
CONFIG_GENERIC_STRNCPY_FROM_USER=y
CONFIG_GENERIC_STRNLEN_USER=y
CONFIG_GENERIC_NET_UTILS=y
CONFIG_GENERIC_FIND_FIRST_BIT=y
CONFIG_CORDIC=m
CONFIG_PRIME_NUMBERS=m
CONFIG_RATIONAL=y
CONFIG_GENERIC_PCI_IOMAP=y
CONFIG_GENERIC_IOMAP=y
CONFIG_ARCH_USE_CMPXCHG_LOCKREF=y
CONFIG_ARCH_HAS_FAST_MULTIPLIER=y
CONFIG_CRC_CCITT=y
CONFIG_CRC16=y
CONFIG_CRC_T10DIF=y
CONFIG_CRC_ITU_T=m
CONFIG_CRC32=y
# CONFIG_CRC32_SELFTEST is not set
CONFIG_CRC32_SLICEBY8=y
# CONFIG_CRC32_SLICEBY4 is not set
# CONFIG_CRC32_SARWATE is not set
# CONFIG_CRC32_BIT is not set
# CONFIG_CRC64 is not set
# CONFIG_CRC4 is not set
# CONFIG_CRC7 is not set
CONFIG_LIBCRC32C=m
CONFIG_CRC8=m
CONFIG_XXHASH=y
# CONFIG_RANDOM32_SELFTEST is not set
CONFIG_ZLIB_INFLATE=y
CONFIG_ZLIB_DEFLATE=y
CONFIG_LZO_COMPRESS=y
CONFIG_LZO_DECOMPRESS=y
CONFIG_LZ4_DECOMPRESS=y
CONFIG_ZSTD_COMPRESS=m
CONFIG_ZSTD_DECOMPRESS=m
CONFIG_XZ_DEC=y
CONFIG_XZ_DEC_X86=y
CONFIG_XZ_DEC_POWERPC=y
CONFIG_XZ_DEC_IA64=y
CONFIG_XZ_DEC_ARM=y
CONFIG_XZ_DEC_ARMTHUMB=y
CONFIG_XZ_DEC_SPARC=y
CONFIG_XZ_DEC_BCJ=y
# CONFIG_XZ_DEC_TEST is not set
CONFIG_DECOMPRESS_GZIP=y
CONFIG_DECOMPRESS_BZIP2=y
CONFIG_DECOMPRESS_LZMA=y
CONFIG_DECOMPRESS_XZ=y
CONFIG_DECOMPRESS_LZO=y
CONFIG_DECOMPRESS_LZ4=y
CONFIG_GENERIC_ALLOCATOR=y
CONFIG_REED_SOLOMON=m
CONFIG_REED_SOLOMON_ENC8=y
CONFIG_REED_SOLOMON_DEC8=y
CONFIG_TEXTSEARCH=y
CONFIG_TEXTSEARCH_KMP=m
CONFIG_TEXTSEARCH_BM=m
CONFIG_TEXTSEARCH_FSM=m
CONFIG_BTREE=y
CONFIG_INTERVAL_TREE=y
CONFIG_XARRAY_MULTI=y
CONFIG_ASSOCIATIVE_ARRAY=y
CONFIG_HAS_IOMEM=y
CONFIG_HAS_IOPORT_MAP=y
CONFIG_HAS_DMA=y
CONFIG_NEED_SG_DMA_LENGTH=y
CONFIG_NEED_DMA_MAP_STATE=y
CONFIG_ARCH_DMA_ADDR_T_64BIT=y
CONFIG_ARCH_HAS_FORCE_DMA_UNENCRYPTED=y
CONFIG_SWIOTLB=y
CONFIG_DMA_CMA=y

#
# Default contiguous memory area size:
#
CONFIG_CMA_SIZE_MBYTES=200
CONFIG_CMA_SIZE_SEL_MBYTES=y
# CONFIG_CMA_SIZE_SEL_PERCENTAGE is not set
# CONFIG_CMA_SIZE_SEL_MIN is not set
# CONFIG_CMA_SIZE_SEL_MAX is not set
CONFIG_CMA_ALIGNMENT=8
# CONFIG_DMA_API_DEBUG is not set
CONFIG_SGL_ALLOC=y
CONFIG_IOMMU_HELPER=y
CONFIG_CHECK_SIGNATURE=y
CONFIG_CPUMASK_OFFSTACK=y
CONFIG_CPU_RMAP=y
CONFIG_DQL=y
CONFIG_GLOB=y
# CONFIG_GLOB_SELFTEST is not set
CONFIG_NLATTR=y
CONFIG_CLZ_TAB=y
CONFIG_IRQ_POLL=y
CONFIG_MPILIB=y
CONFIG_SIGNATURE=y
CONFIG_DIMLIB=y
CONFIG_OID_REGISTRY=y
CONFIG_UCS2_STRING=y
CONFIG_HAVE_GENERIC_VDSO=y
CONFIG_GENERIC_GETTIMEOFDAY=y
CONFIG_FONT_SUPPORT=y
# CONFIG_FONTS is not set
CONFIG_FONT_8x8=y
CONFIG_FONT_8x16=y
CONFIG_SG_POOL=y
CONFIG_ARCH_HAS_PMEM_API=y
CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE=y
CONFIG_ARCH_HAS_UACCESS_MCSAFE=y
CONFIG_ARCH_STACKWALK=y
CONFIG_SBITMAP=y
# CONFIG_STRING_SELFTEST is not set
# end of Library routines

#
# Kernel hacking
#

#
# printk and dmesg options
#
CONFIG_PRINTK_TIME=y
# CONFIG_PRINTK_CALLER is not set
CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7
CONFIG_CONSOLE_LOGLEVEL_QUIET=4
CONFIG_MESSAGE_LOGLEVEL_DEFAULT=4
CONFIG_BOOT_PRINTK_DELAY=y
CONFIG_DYNAMIC_DEBUG=y
# end of printk and dmesg options

#
# Compile-time checks and compiler options
#
CONFIG_DEBUG_INFO=y
CONFIG_DEBUG_INFO_REDUCED=y
# CONFIG_DEBUG_INFO_SPLIT is not set
# CONFIG_DEBUG_INFO_DWARF4 is not set
# CONFIG_DEBUG_INFO_BTF is not set
# CONFIG_GDB_SCRIPTS is not set
CONFIG_ENABLE_MUST_CHECK=y
CONFIG_FRAME_WARN=2048
CONFIG_STRIP_ASM_SYMS=y
# CONFIG_READABLE_ASM is not set
CONFIG_DEBUG_FS=y
# CONFIG_HEADERS_INSTALL is not set
CONFIG_OPTIMIZE_INLINING=y
CONFIG_DEBUG_SECTION_MISMATCH=y
CONFIG_SECTION_MISMATCH_WARN_ONLY=y
CONFIG_STACK_VALIDATION=y
# CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
# end of Compile-time checks and compiler options

CONFIG_MAGIC_SYSRQ=y
CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=0x1
CONFIG_MAGIC_SYSRQ_SERIAL=y
CONFIG_DEBUG_KERNEL=y
CONFIG_DEBUG_MISC=y

#
# Memory Debugging
#
# CONFIG_PAGE_EXTENSION is not set
# CONFIG_DEBUG_PAGEALLOC is not set
# CONFIG_PAGE_OWNER is not set
# CONFIG_PAGE_POISONING is not set
# CONFIG_DEBUG_PAGE_REF is not set
CONFIG_DEBUG_RODATA_TEST=y
# CONFIG_DEBUG_OBJECTS is not set
# CONFIG_SLUB_DEBUG_ON is not set
# CONFIG_SLUB_STATS is not set
CONFIG_HAVE_DEBUG_KMEMLEAK=y
# CONFIG_DEBUG_KMEMLEAK is not set
# CONFIG_DEBUG_STACK_USAGE is not set
# CONFIG_DEBUG_VM is not set
CONFIG_ARCH_HAS_DEBUG_VIRTUAL=y
# CONFIG_DEBUG_VIRTUAL is not set
CONFIG_DEBUG_MEMORY_INIT=y
CONFIG_MEMORY_NOTIFIER_ERROR_INJECT=m
# CONFIG_DEBUG_PER_CPU_MAPS is not set
CONFIG_HAVE_ARCH_KASAN=y
CONFIG_CC_HAS_KASAN_GENERIC=y
# CONFIG_KASAN is not set
CONFIG_KASAN_STACK=1
# end of Memory Debugging

CONFIG_ARCH_HAS_KCOV=y
CONFIG_CC_HAS_SANCOV_TRACE_PC=y
# CONFIG_KCOV is not set
CONFIG_DEBUG_SHIRQ=y

#
# Debug Lockups and Hangs
#
CONFIG_LOCKUP_DETECTOR=y
CONFIG_SOFTLOCKUP_DETECTOR=y
# CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC_VALUE=0
CONFIG_HARDLOCKUP_DETECTOR_PERF=y
CONFIG_HARDLOCKUP_CHECK_TIMESTAMP=y
CONFIG_HARDLOCKUP_DETECTOR=y
CONFIG_BOOTPARAM_HARDLOCKUP_PANIC=y
CONFIG_BOOTPARAM_HARDLOCKUP_PANIC_VALUE=1
# CONFIG_DETECT_HUNG_TASK is not set
# CONFIG_WQ_WATCHDOG is not set
# end of Debug Lockups and Hangs

CONFIG_PANIC_ON_OOPS=y
CONFIG_PANIC_ON_OOPS_VALUE=1
CONFIG_PANIC_TIMEOUT=0
CONFIG_SCHED_DEBUG=y
CONFIG_SCHED_INFO=y
CONFIG_SCHEDSTATS=y
# CONFIG_SCHED_STACK_END_CHECK is not set
# CONFIG_DEBUG_TIMEKEEPING is not set

#
# Lock Debugging (spinlocks, mutexes, etc...)
#
CONFIG_LOCK_DEBUGGING_SUPPORT=y
# CONFIG_PROVE_LOCKING is not set
# CONFIG_LOCK_STAT is not set
# CONFIG_DEBUG_RT_MUTEXES is not set
# CONFIG_DEBUG_SPINLOCK is not set
# CONFIG_DEBUG_MUTEXES is not set
# CONFIG_DEBUG_WW_MUTEX_SLOWPATH is not set
# CONFIG_DEBUG_RWSEMS is not set
# CONFIG_DEBUG_LOCK_ALLOC is not set
CONFIG_DEBUG_ATOMIC_SLEEP=y
# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
CONFIG_LOCK_TORTURE_TEST=m
CONFIG_WW_MUTEX_SELFTEST=m
# end of Lock Debugging (spinlocks, mutexes, etc...)

CONFIG_STACKTRACE=y
# CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set
# CONFIG_DEBUG_KOBJECT is not set
CONFIG_DEBUG_BUGVERBOSE=y
CONFIG_DEBUG_LIST=y
# CONFIG_DEBUG_PLIST is not set
# CONFIG_DEBUG_SG is not set
# CONFIG_DEBUG_NOTIFIERS is not set
# CONFIG_DEBUG_CREDENTIALS is not set

#
# RCU Debugging
#
CONFIG_TORTURE_TEST=m
CONFIG_RCU_PERF_TEST=m
CONFIG_RCU_TORTURE_TEST=m
CONFIG_RCU_CPU_STALL_TIMEOUT=60
# CONFIG_RCU_TRACE is not set
# CONFIG_RCU_EQS_DEBUG is not set
# end of RCU Debugging

# CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
# CONFIG_DEBUG_BLOCK_EXT_DEVT is not set
# CONFIG_CPU_HOTPLUG_STATE_CONTROL is not set
CONFIG_NOTIFIER_ERROR_INJECTION=m
CONFIG_PM_NOTIFIER_ERROR_INJECT=m
# CONFIG_NETDEV_NOTIFIER_ERROR_INJECT is not set
CONFIG_FUNCTION_ERROR_INJECTION=y
CONFIG_FAULT_INJECTION=y
# CONFIG_FAILSLAB is not set
# CONFIG_FAIL_PAGE_ALLOC is not set
CONFIG_FAIL_MAKE_REQUEST=y
# CONFIG_FAIL_IO_TIMEOUT is not set
# CONFIG_FAIL_FUTEX is not set
CONFIG_FAULT_INJECTION_DEBUG_FS=y
# CONFIG_FAIL_FUNCTION is not set
# CONFIG_FAIL_MMC_REQUEST is not set
CONFIG_LATENCYTOP=y
CONFIG_USER_STACKTRACE_SUPPORT=y
CONFIG_NOP_TRACER=y
CONFIG_HAVE_FUNCTION_TRACER=y
CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
CONFIG_HAVE_DYNAMIC_FTRACE=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=y
CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
CONFIG_HAVE_FENTRY=y
CONFIG_HAVE_C_RECORDMCOUNT=y
CONFIG_TRACER_MAX_TRACE=y
CONFIG_TRACE_CLOCK=y
CONFIG_RING_BUFFER=y
CONFIG_EVENT_TRACING=y
CONFIG_CONTEXT_SWITCH_TRACER=y
CONFIG_RING_BUFFER_ALLOW_SWAP=y
CONFIG_TRACING=y
CONFIG_GENERIC_TRACER=y
CONFIG_TRACING_SUPPORT=y
CONFIG_FTRACE=y
CONFIG_FUNCTION_TRACER=y
CONFIG_FUNCTION_GRAPH_TRACER=y
# CONFIG_PREEMPTIRQ_EVENTS is not set
# CONFIG_IRQSOFF_TRACER is not set
CONFIG_SCHED_TRACER=y
CONFIG_HWLAT_TRACER=y
CONFIG_FTRACE_SYSCALLS=y
CONFIG_TRACER_SNAPSHOT=y
# CONFIG_TRACER_SNAPSHOT_PER_CPU_SWAP is not set
CONFIG_BRANCH_PROFILE_NONE=y
# CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
# CONFIG_PROFILE_ALL_BRANCHES is not set
CONFIG_STACK_TRACER=y
CONFIG_BLK_DEV_IO_TRACE=y
CONFIG_KPROBE_EVENTS=y
# CONFIG_KPROBE_EVENTS_ON_NOTRACE is not set
CONFIG_UPROBE_EVENTS=y
CONFIG_BPF_EVENTS=y
CONFIG_DYNAMIC_EVENTS=y
CONFIG_PROBE_EVENTS=y
CONFIG_DYNAMIC_FTRACE=y
CONFIG_DYNAMIC_FTRACE_WITH_REGS=y
CONFIG_FUNCTION_PROFILER=y
# CONFIG_BPF_KPROBE_OVERRIDE is not set
CONFIG_FTRACE_MCOUNT_RECORD=y
# CONFIG_FTRACE_STARTUP_TEST is not set
# CONFIG_MMIOTRACE is not set
CONFIG_TRACING_MAP=y
CONFIG_HIST_TRIGGERS=y
# CONFIG_TRACEPOINT_BENCHMARK is not set
CONFIG_RING_BUFFER_BENCHMARK=m
# CONFIG_RING_BUFFER_STARTUP_TEST is not set
# CONFIG_PREEMPTIRQ_DELAY_TEST is not set
# CONFIG_TRACE_EVAL_MAP_FILE is not set
CONFIG_PROVIDE_OHCI1394_DMA_INIT=y
CONFIG_RUNTIME_TESTING_MENU=y
# CONFIG_LKDTM is not set
# CONFIG_TEST_LIST_SORT is not set
# CONFIG_TEST_SORT is not set
# CONFIG_KPROBES_SANITY_TEST is not set
# CONFIG_BACKTRACE_SELF_TEST is not set
# CONFIG_RBTREE_TEST is not set
# CONFIG_REED_SOLOMON_TEST is not set
# CONFIG_INTERVAL_TREE_TEST is not set
# CONFIG_PERCPU_TEST is not set
CONFIG_ATOMIC64_SELFTEST=y
# CONFIG_ASYNC_RAID6_TEST is not set
# CONFIG_TEST_HEXDUMP is not set
# CONFIG_TEST_STRING_HELPERS is not set
CONFIG_TEST_STRSCPY=m
# CONFIG_TEST_KSTRTOX is not set
CONFIG_TEST_PRINTF=m
CONFIG_TEST_BITMAP=m
# CONFIG_TEST_BITFIELD is not set
# CONFIG_TEST_UUID is not set
# CONFIG_TEST_XARRAY is not set
# CONFIG_TEST_OVERFLOW is not set
# CONFIG_TEST_RHASHTABLE is not set
# CONFIG_TEST_HASH is not set
# CONFIG_TEST_IDA is not set
CONFIG_TEST_LKM=m
CONFIG_TEST_VMALLOC=m
CONFIG_TEST_USER_COPY=m
CONFIG_TEST_BPF=m
CONFIG_TEST_BLACKHOLE_DEV=m
# CONFIG_FIND_BIT_BENCHMARK is not set
CONFIG_TEST_FIRMWARE=m
CONFIG_TEST_SYSCTL=m
# CONFIG_TEST_UDELAY is not set
CONFIG_TEST_STATIC_KEYS=m
CONFIG_TEST_KMOD=m
# CONFIG_TEST_MEMCAT_P is not set
CONFIG_TEST_LIVEPATCH=m
# CONFIG_TEST_STACKINIT is not set
# CONFIG_TEST_MEMINIT is not set
# CONFIG_MEMTEST is not set
# CONFIG_BUG_ON_DATA_CORRUPTION is not set
# CONFIG_SAMPLES is not set
CONFIG_HAVE_ARCH_KGDB=y
# CONFIG_KGDB is not set
CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=y
# CONFIG_UBSAN is not set
CONFIG_UBSAN_ALIGNMENT=y
CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=y
CONFIG_STRICT_DEVMEM=y
# CONFIG_IO_STRICT_DEVMEM is not set
CONFIG_TRACE_IRQFLAGS_SUPPORT=y
CONFIG_EARLY_PRINTK_USB=y
CONFIG_X86_VERBOSE_BOOTUP=y
CONFIG_EARLY_PRINTK=y
CONFIG_EARLY_PRINTK_DBGP=y
# CONFIG_EARLY_PRINTK_USB_XDBC is not set
# CONFIG_X86_PTDUMP is not set
# CONFIG_EFI_PGT_DUMP is not set
# CONFIG_DEBUG_WX is not set
CONFIG_DOUBLEFAULT=y
# CONFIG_DEBUG_TLBFLUSH is not set
# CONFIG_IOMMU_DEBUG is not set
CONFIG_HAVE_MMIOTRACE_SUPPORT=y
CONFIG_X86_DECODER_SELFTEST=y
CONFIG_IO_DELAY_0X80=y
# CONFIG_IO_DELAY_0XED is not set
# CONFIG_IO_DELAY_UDELAY is not set
# CONFIG_IO_DELAY_NONE is not set
CONFIG_DEBUG_BOOT_PARAMS=y
# CONFIG_CPA_DEBUG is not set
# CONFIG_DEBUG_ENTRY is not set
# CONFIG_DEBUG_NMI_SELFTEST is not set
CONFIG_X86_DEBUG_FPU=y
# CONFIG_PUNIT_ATOM_DEBUG is not set
CONFIG_UNWINDER_ORC=y
# CONFIG_UNWINDER_FRAME_POINTER is not set
# CONFIG_UNWINDER_GUESS is not set
# end of Kernel hacking

--m51xatjYGsM+13rf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=job-script

#!/bin/sh

export_top_env()
{
	export suite='kernel_selftests'
	export testcase='kernel_selftests'
	export category='functional'
	export need_memory='2G'
	export need_cpu=2
	export kernel_cmdline='kvm-intel.unrestricted_guest=0'
	export job_origin='/lkp/lkp/.src-20191025-131303/allot/cyclic:vm-p1:linux-devel:devel-hourly/vm-snb/kernel_selftests.yaml'
	export queue_cmdline_keys='branch
commit'
	export queue='bisect'
	export testbox='vm-snb-0fe51004c2cd'
	export tbox_group='vm-snb'
	export nr_vm=64
	export submit_id='5db2b1eb7e23131baa40de53'
	export job_file='/lkp/jobs/scheduled/vm-snb-0fe51004c2cd/kernel_selftests-kselftests-01-debian-x86_64-2019-05-14.cgz-475bfb4b00bc0-20191025-7082-uoyd3u-2.yaml'
	export id='18fdf11ab994b5a13cedb3d0d1c074b6a67f8fce'
	export queuer_version='/lkp-src'
	export arch='x86_64'
	export model='qemu-system-x86_64 -enable-kvm -cpu SandyBridge'
	export nr_cpu=2
	export memory='8G'
	export hdd_partitions='/dev/vda /dev/vdb /dev/vdc /dev/vdd /dev/vde /dev/vdf'
	export swap_partitions='/dev/vdg'
	export need_kernel_headers=true
	export need_kernel_selftests=true
	export need_kconfig='CONFIG_RUNTIME_TESTING_MENU=y
CONFIG_TEST_FIRMWARE
CONFIG_TEST_USER_COPY
CONFIG_MEMORY_NOTIFIER_ERROR_INJECT
CONFIG_MEMORY_HOTPLUG_SPARSE=y
CONFIG_NOTIFIER_ERROR_INJECTION
CONFIG_FTRACE=y
CONFIG_TEST_BITMAP
CONFIG_TEST_PRINTF
CONFIG_TEST_STATIC_KEYS
CONFIG_BPF_SYSCALL=y
CONFIG_NET_CLS_BPF=m
CONFIG_BPF_EVENTS=y
CONFIG_TEST_BPF=m
CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=y
CONFIG_HIST_TRIGGERS=y
CONFIG_EMBEDDED=y
CONFIG_GPIOLIB=y
CONFIG_GPIO_MOCKUP=y
CONFIG_USERFAULTFD=y
CONFIG_SYNC_FILE=y
CONFIG_SW_SYNC=y
CONFIG_MISC_FILESYSTEMS=y
CONFIG_PSTORE=y
CONFIG_PSTORE_PMSG=y
CONFIG_PSTORE_CONSOLE=y
CONFIG_PSTORE_RAM=m
CONFIG_EXPERT=y
CONFIG_CHECKPOINT_RESTORE=y
CONFIG_EFIVAR_FS
CONFIG_TEST_KMOD=m
CONFIG_TEST_LKM=m
CONFIG_XFS_FS=m
CONFIG_TUN=m
CONFIG_BTRFS_FS=m
CONFIG_TEST_SYSCTL=m
CONFIG_BPF_STREAM_PARSER=y
CONFIG_CGROUP_BPF=y
CONFIG_IPV6_MULTIPLE_TABLES=y
CONFIG_NET_L3_MASTER_DEV=y
CONFIG_IP_MULTIPLE_TABLES=y
CONFIG_NET_VRF=y
CONFIG_NET_FOU=m
CONFIG_NET_FOU_IP_TUNNELS=y
CONFIG_MACSEC=y
CONFIG_X86_INTEL_MPX=y
CONFIG_RC_CORE=m ~ (4\.1[4-9]|4\.20|5\.)
CONFIG_RC_DEVICES=y
CONFIG_RC_LOOPBACK
CONFIG_IPV6_SEG6_LWTUNNEL=y ~ v(4\.1[0-9]|4\.20|5\.)
CONFIG_LWTUNNEL=y
CONFIG_WW_MUTEX_SELFTEST=m ~ v(4\.1[1-9]|4\.20|5\.)
CONFIG_DRM_DEBUG_SELFTEST=m ~ v(4\.1[8-9]|4\.20|5\.)
CONFIG_TEST_LIVEPATCH=m ~ v(5\.[1-9])
CONFIG_LIRC=y
CONFIG_RC_DECODERS=y
CONFIG_IR_SHARP_DECODER=m
CONFIG_ANDROID=y ~ v(3\.[3-9]|3\.1[0-9]|4\.|5\.)
CONFIG_STAGING=y
CONFIG_ION=y ~ v(3\.1[4-9]|4\.|5\.)
CONFIG_ION_SYSTEM_HEAP=y ~ v(4\.1[2-9]|4\.20|5\.)
CONFIG_MPLS_ROUTING=m ~ v(4\.[1-9]|4\.1[0-9]|4\.20|5\.)
CONFIG_MPLS_IPTUNNEL=m ~ v(4\.[3-9]|4\.1[0-9]|4\.20|5\.)
CONFIG_TEST_STRSCPY=m ~ v(5\.2$|5\.[3-9])
CONFIG_TEST_BLACKHOLE_DEV=m ~ v(5\.[3-9])
CONFIG_TEST_VMALLOC=m ~ v(5\.[1-9])
CONFIG_IR_IMON_DECODER=m ~ v(4\.1[7-9|4\.20]|5\.)
CONFIG_KVM_GUEST=y'
	export commit='475bfb4b00bc0f91400ac501f7edf16b595cd61b'
	export ssh_base_port=23032
	export kconfig='x86_64-rhel-7.6'
	export compiler='gcc-7'
	export rootfs='debian-x86_64-2019-05-14.cgz'
	export enqueue_time='2019-10-25 16:27:59 +0800'
	export _id='5db2b20f7e23131baa40de55'
	export _rt='/result/kernel_selftests/kselftests-01/vm-snb/debian-x86_64-2019-05-14.cgz/x86_64-rhel-7.6/gcc-7/475bfb4b00bc0f91400ac501f7edf16b595cd61b'
	export user='lkp'
	export head_commit='181bcceb0212baf278f170cdcda1c3d530bd1fe4'
	export base_commit='7d194c2100ad2a6dded545887d02754948ca5241'
	export branch='linux-devel/devel-hourly-2019102423'
	export result_root='/result/kernel_selftests/kselftests-01/vm-snb/debian-x86_64-2019-05-14.cgz/x86_64-rhel-7.6/gcc-7/475bfb4b00bc0f91400ac501f7edf16b595cd61b/8'
	export scheduler_version='/lkp/lkp/.src-20191025-144941'
	export LKP_SERVER='inn'
	export max_uptime=3600
	export initrd='/osimage/debian/debian-x86_64-2019-05-14.cgz'
	export bootloader_append='root=/dev/ram0
user=lkp
job=/lkp/jobs/scheduled/vm-snb-0fe51004c2cd/kernel_selftests-kselftests-01-debian-x86_64-2019-05-14.cgz-475bfb4b00bc0-20191025-7082-uoyd3u-2.yaml
ARCH=x86_64
kconfig=x86_64-rhel-7.6
branch=linux-devel/devel-hourly-2019102423
commit=475bfb4b00bc0f91400ac501f7edf16b595cd61b
BOOT_IMAGE=/pkg/linux/x86_64-rhel-7.6/gcc-7/475bfb4b00bc0f91400ac501f7edf16b595cd61b/vmlinuz-5.4.0-rc4-00042-g475bfb4b00bc0
kvm-intel.unrestricted_guest=0
max_uptime=3600
RESULT_ROOT=/result/kernel_selftests/kselftests-01/vm-snb/debian-x86_64-2019-05-14.cgz/x86_64-rhel-7.6/gcc-7/475bfb4b00bc0f91400ac501f7edf16b595cd61b/8
LKP_SERVER=inn
debug
apic=debug
sysrq_always_enabled
rcupdate.rcu_cpu_stall_timeout=100
net.ifnames=0
printk.devkmsg=on
panic=-1
softlockup_panic=1
nmi_watchdog=panic
oops=panic
load_ramdisk=2
prompt_ramdisk=0
drbd.minor_count=8
systemd.log_level=err
ignore_loglevel
console=tty0
earlyprintk=ttyS0,115200
console=ttyS0,115200
vga=normal
rw'
	export modules_initrd='/pkg/linux/x86_64-rhel-7.6/gcc-7/475bfb4b00bc0f91400ac501f7edf16b595cd61b/modules.cgz'
	export bm_initrd='/osimage/deps/debian-x86_64-2018-04-03.cgz/run-ipconfig_2018-04-03.cgz,/osimage/deps/debian-x86_64-2018-04-03.cgz/lkp_2019-08-05.cgz,/osimage/deps/debian-x86_64-2018-04-03.cgz/rsync-rootfs_2018-04-03.cgz,/osimage/deps/debian-x86_64-2018-04-03.cgz/kernel_selftests_2019-10-20.cgz,/osimage/pkg/debian-x86_64-2018-04-03.cgz/kernel_selftests-x86_64-998d75510e37_2019-10-20.cgz'
	export linux_headers_initrd='/pkg/linux/x86_64-rhel-7.6/gcc-7/475bfb4b00bc0f91400ac501f7edf16b595cd61b/linux-headers.cgz'
	export linux_selftests_initrd='/pkg/linux/x86_64-rhel-7.6/gcc-7/475bfb4b00bc0f91400ac501f7edf16b595cd61b/linux-selftests.cgz'
	export lkp_initrd='/osimage/user/lkp/lkp-x86_64.cgz'
	export site='inn'
	export LKP_CGI_PORT=80
	export LKP_CIFS_PORT=139
	export schedule_notify_address=
	export kernel='/pkg/linux/x86_64-rhel-7.6/gcc-7/475bfb4b00bc0f91400ac501f7edf16b595cd61b/vmlinuz-5.4.0-rc4-00042-g475bfb4b00bc0'
	export dequeue_time='2019-10-25 16:29:53 +0800'
	export job_initrd='/lkp/jobs/scheduled/vm-snb-0fe51004c2cd/kernel_selftests-kselftests-01-debian-x86_64-2019-05-14.cgz-475bfb4b00bc0-20191025-7082-uoyd3u-2.cgz'

	[ -n "$LKP_SRC" ] ||
	export LKP_SRC=/lkp/${user:-lkp}/src
}

run_job()
{
	echo $$ > $TMP/run-job.pid

	. $LKP_SRC/lib/http.sh
	. $LKP_SRC/lib/job.sh
	. $LKP_SRC/lib/env.sh

	export_top_env

	run_monitor $LKP_SRC/monitors/wrapper kmsg
	run_monitor $LKP_SRC/monitors/wrapper heartbeat
	run_monitor $LKP_SRC/monitors/wrapper meminfo
	run_monitor $LKP_SRC/monitors/wrapper oom-killer
	run_monitor $LKP_SRC/monitors/plain/watchdog

	run_test group='kselftests-01' $LKP_SRC/tests/wrapper kernel_selftests
}

extract_stats()
{
	export stats_part_begin=
	export stats_part_end=

	$LKP_SRC/stats/wrapper kernel_selftests
	$LKP_SRC/stats/wrapper kmsg
	$LKP_SRC/stats/wrapper meminfo

	$LKP_SRC/stats/wrapper time kernel_selftests.time
	$LKP_SRC/stats/wrapper dmesg
	$LKP_SRC/stats/wrapper kmsg
	$LKP_SRC/stats/wrapper last_state
	$LKP_SRC/stats/wrapper stderr
	$LKP_SRC/stats/wrapper time
}

"$@"

--m51xatjYGsM+13rf
Content-Type: application/x-xz
Content-Disposition: attachment; filename="dmesg.xz"
Content-Transfer-Encoding: base64

/Td6WFoAAATm1rRGAgAhARYAAAB0L+Wj5lEVzxBdADKYSqt8kKSEWvAZo7Ydv/tz/AJuxJZ5
vBF30b/zsUFOhv9TudZULcPnnyAaraV0UdmWBL/0Qq2x8RyxDtkd8eBUmhlmsGDkLnjG8/UC
/LVJ3DTG+b3WBVv4UOrCMeZ4fnRs1FjHB3J1kLMaTwlPnZUJsQUBFz3kAq+8nEl8hIINjeOZ
EKurWO7z/2vyynCflqXBs7k7ST1C+1q3vKZEWzubWvEcs4ZNv7svzIkzvJRLrs/6XOrn1A/W
iUHYLogziYJm7SYleBFuExTFGMm5GvRz2pdwz/khRbrK/JkxIBWd4UlQcvJJjv9mQiD1CxJg
AjDAuouez00K4LwHzqrPNtKg64gPKy+XV7O7oDuqh5Oa64blOEA7YrJ6IKI0q88d8qRlcmMx
GkMNIirAjspWHtWX0EZB+RVuET13+pK5cIh4//bjvRWPS2U8/Hrvie5M7gCwh9xcdCuQA5ka
o3ccIvvvCLc93RhmGeGyuhjUycU7Z7BXPcko8UehLUQ7au6FRn/kW0EMMH+b8tiqtODxVWY0
QRnvO7+5SvwZL8lqbrXWEqTWZZzjAVVFRUM6P0PXjGwaZpO0hiqoD0+KVAJJFXAuJB3CVWdp
Y/qs58iXlTt5BOKGCg7YoY6qTd9GMXLvlBrGi7XjIPMwv22JzPzM2kw54u1iYAzfj0W+pmf2
NBuknsp3ZGgmVtWbiIBy8t8AcGsALbC9hIgdY2nB1vPUoCki72EPeIikxBYfDV4aL0DS27WP
JLwibft0fFdoS8ldpRpRj0ZTHa36PsAKZ8PF3Tyf95Ff2bqoLyv1L6VbtRa/f+eON++S335e
xyzU3AvlMvn+RPQR9LWJdE/RHSzc2gDc4G3Llg2JaR305mc5LKjI8R81w8axA1uUiIw8jdOQ
SHv8A/ky+yjXwfsP7Swd+2X30gg/qtX9GIWJWa5QKePka03I4TzBeAezwxlsDwPElrWl9neV
YLiDbZD2vFNo5LJPOUjXJJjAWjy4yDbKDHyejX2oItZEd1mGjJAnak28ZriarOuciD8TLn/w
zbQ7RkS0pk2wdL3ZNfZsdBxHxfCFTLr6bPfT6TA2jwlt/aS5bhQqcRIV7P+EMW0rIiOzDp8E
4h6BsVDPSEku3SFIoJTsN2jzZL3znvE/ql4XewLhgjXD8k8Jfcc8WJXukROOQn/oGs2dFS14
oXBJ1FUcDkd5N6vYLG/wITtMDa5XJzhVtBLemYyrhcmdN6LqcwHcB1upxiBuxP9LVu6FbGl1
oJ5F9Q1U1HoG85YtyIkHxZ94vwSequ6UO5N2wvsLig3KvHREVMK/KtCBqbgq6puoun0K29Hm
o+3/4KRDH5H14h1WMGOUnm0CzG4d4jVnLGDrFnzhFTagB3t5pp0Rix1Nb4Vs5nUo1HM8d+Yw
LLC7gNPUQxqL66c0QFuxYQhUGUzMQ3unJoBfPJFXKNhf8no4Qj3JmEuklgq7ubZFbOx82SH5
s9tjd91bkti7bYnmERW/+eHPI8EiVSOj7/UwijRK7pjnu3SokNVElr+1q9yv0YiE+xjv0Pb9
OtdLfrCqa4hjVzTpShPveGvCMfoBP2OijPerD/sVqBQqmH+Sk46BOuGu4yMjfSvNBtQRJGyJ
J70UD2fPHkekCIBF1gXBmqVuKtKCytd20/bNxmCxiYl7fn5k7Ft+ZVZ8U5FOJlJ+rlMq/nQX
7V+TX/4iAsRoSijm6Q0n3tLEGSu1gMnMmATu+3f7zDmkyh44S1XEFvRGBhuWuaOsTps3ww/C
nmu0PwmfX/N8ShaRpse0d/88qzPtDf0e8pArCZRh9fMcgN9mjb4ftF0UKVavA+TxDI3uYh8a
lDIiBSoglW6nF7f8w/HS3xrog7RsqGD1rOX0VJnBYOx/QlJDQauOgAzcF7T0/FtGq2dEbFNx
G982RPTd9I4L79np+ZhA3jRVPFzZJBI/I8JmVpsXvNvLOS8wd9pKCZu4i2R650SBdtNoSocQ
KPP0EcuVrBQe4P1DDCobgH39z9mKaqzykYawbRVUnFQh9ORqgoOzl6V2svn2a3BPhw0EGibH
qMzPALgSkE0TKuu+uA3UoF8/+SXIeaep7fKzXo8e2nIOFsR2UwRn6bvY0Hoa36HPGJsUz/pW
1HdlKDD3gnyzDHznR4Ty+1NwwBdlb9Ea45Jd7r3rl/Q+C8g0qhWReaZBWBxEa8rANAcQ6Xh5
APrkUTrqOKLY2fS1xtIgSkc9lkGBnnwY1J4RsO7v0dYjJFcsDQErqezjfE+ogTtdCLANXsQN
76ZxT9VWxUYktX7SoETyZBtOb2FdwDC+Qd6jdx26cJs/xXMefui5c8zzxypmg5sfKsmKakZh
sgOfM2eRN+jlzBAX75bGKLuwym9FXQVJ+tucRAQQkceGmVLinUhUJ/TMOZWPGeaDaC7ec+Ds
UZJVbhM4vxEEy77hhoZo04fruUInoc/NCj6VGldvl/g7mniM+EfIwo1ecyIjs/HjNgERTekz
klJKuZW3HL7oaLDM/I7GWREXU7Je16911S0HIcb2f+h7s0iiK7abZLgKCzqye1sUxzePxsEE
eKTj2qz5hdj0vHHxXiDCt2/LIsYZebUJghIzlcmFOI21K44nmNb6ZtO+KpLLRmGp2Wlmqrmb
+jJsiniFfCXbgqNhoc/Xu2kDoJLSmY97/aaApi8VO0geM2cb3hoRp8GjbWG4Co72Q8Q0iW0g
v371O4gCf78/7CSRWcbY2jhCM1SaaGnsQFDIpv4LnhxV6W1sCGwK9JXZjJZFfBQTvKJnFoVT
6mAzkpQU2bnaMXNDx7r/iTEIApowBvRjlRTrOUv7s7tp0DStWY7XPYjRcGIShNnT15N5cPF/
qhVQZOeE0yz31MvNqav26Vcz5r2zndLDR8tUkFkSI8RaS3QjzCFsQvLYCooyH4V5K6G/hsWt
MVvZmhURabR3cFiFn6wmJ5su29WeVmXdU9WU1xpfTr+PC6kdD6uY4Lx4DCeLIkDcmcQYR7al
tYlTsE1XJwEZTsZXV578iC460R8nCbOzdOmlP2hB7YX8P06A7s0jWoSvT/mSV4oEx7JWdN23
XTJ5yghHfyEFsCWlwF6bEblUu0WSgJEbss7+VXkITjy4m2mdyCweesNdaBG3IbMTwei6tlXx
hw1B6mK44/CnAjY365c6qPySLs8eYOqFR5GnQ0YC/HuWEGo5WsLy2FhLiL5AwLhurD9bCP0K
25h2vvX8UdffQ2i5iTDdAY5FTBcs4iHtqI0/mRWK9YBr8/JCuEDbwE62LxEQkw8LQmF13wh8
13K2KDWZcG1s/Bu+CfoaI0lXxQHCiu4zTBYI88TT4UxWpz6xN4Eh299qowRdXRUwUzGiWN0J
T4KHSC4cBtK4NkXw/BT4uItpSUQYleLEs12jTGgggeI+5FkBBUzNXJMLkvN+bmwtLUuV8Z5/
deB2iUwHCj1/tfVgOYGoQVabIvrCqpgUik056Ojh9fQ1P4GlddjRvRjRTWx27vB7FckriK4H
xjD+4Yk1sBBPmQsOvOMbdCYw1Zim8MquO20HTxJAFzcmZKsJKffb3ngfBoU5lBCQFjBl+8z9
yV2/XI9n+NQ8y/vjZvP3p+dJM3SEJUNKBAYlfPtCvckSqVwkZhllfNWQUJzRulQBfevDaB5Z
8o6d1sJP6gR7vrfcMd68/7EDmMhpcHRDVBYEXBxe6dKdGCj90dt4F0nRxgsyM48M9+D08bE1
24oFohKDupS67dGugR7NRP8oTeuHpGW/Mi3kDxD4kyLfEU+HQ5bMBUlyxFd6h982Ze3zmpY6
YreHhNS7UpXMGsNnl38rAddfTm0ZuU3QJtGRYuq22I2JRRIUPGBDjrk2nGTjuVGG+cRNr8BU
zQLKVX8JwjvYrBdjH5ZWLGSrwNXXtKRSinqxFiAi2Kwy0ZopvE72OTqIGisSpIIgXD8l/G1L
XcnRyiOGI78GpI1kSddv/H/1T+GAXsJkrOTNrzLgS4yD5eIaK0kmJBMIqrwHz2d2ryI+8FLE
hwmaMKXXCN9CN1I8pX53wC8Eq9OsQJLPUFiSzaZN692NS7Nz0p0fPmjbf/wu26pxdWKiUXZg
xY4y0rc5ioE1/95DO1f8AHPEDj5VWEt/7KV841VfGD3bgYRMUI+wcWEoKaFWtNhuRP8JhxFg
k4liPu+3MU0PdovedCr2aUYT5RNba1kmd/tWEUg8JDKtm3qOww+Wg0ePz0KxyVjSqbQQQ5gh
xKAcd1Co9DWhzU9soKyq0GAIFMBKAKAHUEdpxfDp2ZLCod3LjdmNGaLRNNcmlNavVz4gs0+V
ZDYYIuvpFt+qzASZYSTLY6Zyf2c/LAoA0ZlLkKY9ULlC1TKrVtIeUBmtesLgRrLFGw8KHPnU
sxp4E3f227MIbe5aDK1cuPS6JUMk3SDdlkzHWzORpAjytHTd8p+wb5B8TB001Srvuvn4V7sd
Ey8bkSyX+tQy5XXS+s+EkL+sW18s2gXp3en+Y/TPHHeIaJZqgaFzI4f54eHW+kS4BpZgjXkd
B5VU7kFlTDYcTMAe7IqT+wwvQmC0PplopY188Tq29ktjktuVD5VtkttLjV3vw/6XssFyatOZ
w7al6NedPRY7nzO5MbQepmUktgIKKVg7mm02ZqWOswU/4apJ5cMygk+bCpCuju0tcSBaC8Nh
goCkh1fBaPPJtPefw1ksOS2jfmBaswM/RU0t/LydSmf0VTm8mLjqGG8FgfYOmvX5K5/+TtAp
mvTbbTA+cElepGBJcgRP/cJNWYKXuQSGifJvdKi27v6aHdB6o+VhTmakAvO2n2LGlXxu3Ogq
ZOFTYhpMuq08+pnz1ZyyUtwlNG3/IKyFPe1rRx3fWoSTTSzNii62NqNz6ad8wCJdea3XFzHB
a2dl/7VmOyAU9exySIxL4NpTo5k0PHP/0NzlMEIVJY50z+0Th5JfX4tKV9VZwrrJDtYA8h2F
vlfLmzOCGHkHmo6m+3Ork7dFA9lH+UE6rr5tQ6gMt46T2wqFh4xNB8m5yicIK3wcxCE7et5r
Gjbs7/sbKRH2FmtkE2ZonYyWuwRe2PaznOxvY21PuQC2w1ZYLwQUc11rWVKIiRKPFvoWn6cn
lZb9CFmpOTY0Vp7clR4ic7t5ITDThGiyd0K2/1VZAD31q0McHwIekvHYdrlxzh4/Qv0aB41u
s5NuKMnMcej0/DXOaPTyaYZVq1v+1gSVISPBGw+P/3nDwC6uvc4SySKrQetvJhlUtp/iw0VZ
M9pBfzU25S7mEaKW8Yt3zQDLtKStwUwJmmA+GiZN0KGOLH5yNWRTVujWl1Tu9ToVnFedjCnj
0EUXQTA12jDReMXpn587nFa08uO2aooCDx8lrn5SJDiJVjBil0LVqr4R9N08f5E3UZMgR9xk
IwEhuUhNDL4pzB3v1sP2UT8ZfY9O97DrZtPb44s9j00gNx6BJsUuUAx/BfmhUyibt8McS2V4
nhebR/6tQhvIMWWltHDnssL+163BRMnQEqUBOEDLF4cAkGP1QiJCGZJ4w/RrWiUtWt5ORX+/
J6DXxHTiYs/HYskud/TTw6ahAEIm5hOqAj+p9Ha/hGOG2hch70HH7t2AC9ECaJyhBBXLt7Ft
pMRdYfY+XnJ5Pfpljo/3Z3RWWBtv9usat4YOAYcIfPiw9tKg7GKY7wRxSympUR5cGW4VZTK4
up3v66pob8KiZw508WuzXg0cr0oe2nTymlTE8pUrUBk3IRQPvg3VJ8twtymfhP0nFvYCzKhR
eDsE4DYWj2LKKDvlwBWOttM0GgFuWpapVmUf3ZC8aVqLfyBHXOTTA/h+W10kYCj55ofetP1h
chO6rO8Gr5odMplUdp56ZfP0ynMtpmZrrrhKgV+NLDW06hrbzps9Qmf3nb9pTlmS0W0GAAmw
zpDTnmQ0KyytZ7X7p466Obqs2Vz6BbwEWPi3ZzyjXoW4fXbQ3CisQP/6GsJLhiUCTdXlQGC2
lKvq/JNwuvW1buoqJVuLw85xrOhgnj9mTC9sheNSHStgINaPPh9NiniI1+F8+pzvKT0+A37Z
oIAwXmSTh4g17Iyb8NNJ6H0D/ZD89BC1KSC2M4+TWK9Ja0xzJueEkCktb7ta/rUxtZlc5o1e
sUZ9YbjcHgaIQ9oiivOCJBQzceIAJkJZmhBS4WTTXD5xatJ900mc5fw2Wr4QSYG0ae7rA3gq
+4uzEeikhXMH9AvTK7vO30uPG3bFp7fgYGDGMI8lKgiNxrjw0l8izlhxxAh2MxQGeruCTHLA
nShywLehEbs4Ukf12O/Lda3MEPhqxiT3vw6QNY2chmRioD7rSR2RCc8LScOlnbdzIEDj7evP
gV+Lm+DtzLRemXXRDcIud7VLkJv3Kj2wvdti0YZnIWsEvT9GQbyMIG4XVQZckIPuUK4kLAjP
/10SlqLqCSyR9qGkVRoL5Lq1Oni8YyBWPynMcRZyHUWf4TGp0WKfTBdiOJkxaU+zuqMyQYzj
G48yqiFbF717pt/ZfkE7NQUpyDwUyzenEP4Q79yGJ0fXKshXcqjxU7HfxG0AKz/CqKnFr4ap
yEOA0GUcfVzfMIwMNgdA/OcXJb9Jplc90uaRuojZsNMkGikv7jbFnzvzPOqM07iphhSTqpQ3
ks5TM4TiwGvHAvZgqXptzeFSzddKwplGcsvn3xYgKIo52PEevny+0h39oD3MCFRS+UrtIU5P
ptt0OM25msFHiSmFxrg61XRWOsJopFGBCdvNRPTO32wv8Wg6wVRzFV5xaIlqx5NlztrskhLA
SQyxn7kk9CKXIxOLYl7nP+iMsNI8sM+xda/7hCbJkAgLi0zZyzB2FOVYXg8VtwJHIE5dPihf
XDEJC0bRPDMhsJkUC8p12van85l0+nhDo3Rezrzl+CtZ2PGnpCBQSZt2LTOqNcKfBFDiJB9I
HGHDltewWoP0NChYluqm+MsAMqnLwArflRyVn50Dw+wjxC8kBvx/Q3eXtbpv0wn0qo6dToxX
DhQ1Ci2A4oz8BxJomqpQmQpB48VBgd+ln8EfJfmh5J4VvP25gEogqW1PgXfVkhrN3eL8LRhS
1m8WFzWNwDzhNY67R4Q4FjkWiYpWLT5FaHEwdfnXzjuac/IbLhxbxb/U77cioWy9ua0ccPx9
V448I9mEcyU0O32s6jXjjDX+XKstI1sXbalgrn777AbuVsNYu+RoqavIc65bqBm1vR4w6ZxU
fOjRubEwGZNPPKgM2e/zAu0cpM7V2f0d7cW1bljTBgU/1iZU0MJbuuq3S/Uc+ucBU72YN20O
W0tJ3InerVtGAQtHA7FwKXWtElAb1OOKTkcFc82Dn23AA8NPAjArPwY7UU0LciixhcuTieTx
PSFpjiblOH5zR8OfAkYDP/51stJb/Ujtao3Tftb0FreEhU6Ye0qUtYjazahf46VjP3JJBCXQ
Vw7AlTv0et1hu9p2fUz1Dic9y0wUsxFh5/OKKlDhRNUZsjCIIWZI7aQ2tmZ4fbqKsQOwAV2P
X+MSrGn9OxevVK5XdC64Jn22ZcWJqUw8srJ55UlRjsMW2OxP/5j/YqkxTFNm7GPYUKnogdNO
Y6GM5im6CI0TBFcTehISFMSPZXfSpsFxHBR7braB1Lt45nvsGGUBJavFfOoVqSXlbB48GO3O
BoBOwtf9yQCmiRHwmMKYApudSN1uay9qXFn/iuSe2PDY2ZWTmj3CVMJPK8v0z8mo2lMxsQ7/
8vaz0wq7Dp9r+7Ir4cypuZZtNtez/hUFpC7L+I/FjT0MQQaPgCCnveORN8V30Epu2HBt2hyo
vKsvO3gwT8fji1rwm3JRn8QR0DgtKpPp/X5w97TTygpRAasw+4cugHlt0cBlMWgU/yLTxCGn
oKjzZKN9u8ujB5jdzqmxBav3ykj362ZH2tZp1qxHIZ7SColgXFKNZl5Ch34vMQnmK3ts6c66
GD8XILiJPpG1qHARKJvyBIfFCDyV6njXPHutmWGo/XRBnHrCXT2F2SvgbWvd0F6Yns+kZ89q
vLO4cimoQG7FFyHtI1v/iOVOfesK10Zm09h8LUPEVbgHw25XE98bXpKNOo3lDoe73oRnP2Rk
SdkYvWGsKWX/5y5/XYlkYGxfLu4oDsctWbWwD9fshdpHfCxWXSs3pQx6VmAGB97Uw1VTs9tH
LwjIet0at1aqX+ejPDw0GYsJHr8NJYWH70jymBHNJlaxyRwybqThUDmwu5GVvfy8r8M0GM6g
OYIhex4LUbjYr2L6aPAo81TZw801q2eF450OA3VJ/PwvFkrKs9nOcvdVggHyw0FuZHqdEuYP
VEjyoKmZi80Gb3owQiGUMzljezeWtFK3CjlB4uNWcW4qCsipPftPaJfgNfaDwRl/42v5zYF5
XgrcqLLP4FHGwgVZGjd7s85tmpRrsMECNiXBBsTY8tN/8LbUBNeqYCRKEN7ZA4ZrRB/zyBtr
izFeBmHFLh+2HmKrHPg1/6Kbe6ceyhlJHq3woo5vZfm9Tta8p+62RTGo7bE189lqiTxP5ipE
K3hmQUJtzny8Mr6lvM8npf0fxZBuP4+yn/X3bG8J80ZI+gHgUa6sgS1P+eouIZZXQLPigBJF
XIw0jJ8z7LXJ3Y5zQweu9XXZc3yTqJybKqKU6jq2FdkU82xIG71PmrUE7gEno+uaSof2AKpt
4uxuMNRG/FibZuBy0EQg5xl2kCWrkUomrZ77KGfeDWkLUi+RlTGyBxt+IiT80CK+WobVvMtS
V1DYrhezSVIhxS6IrZSKTdaEfoXoDjlQaSSKAuQo4sCn3ER/21gYGGVSmWvA2r2tw8q24udZ
OMQ0bQlVjnkFF91FgiUbF3stlX9NnKbBZeheJMZDzoSBw7p9gkINdPqkG8dyr04NyC5VOYIf
QpGD0YRLXt0n+XtzGf9+dqi+yg51zSDony2uwp2gH1dN3N8I0ZHm1lywluCWaTEvkc2O2HDQ
9ceZbrjKx2LLT5ir0TuORi//RlYkl7bYHL/SwnzFbYKKMfO4S2IIjQn7w3rX6G3NQWsZGgzf
gJV3cu29LU5m0gaV3TwGtcqsZK+B5AXyuLw+ysQkHnDoxHu5W1RukQPdggoEa7aplPl2UzmK
AKsBGJcYQmtgqyq9h5ogcKLeCY2huWzvS/eaNlZf6bLpu8Ijj8joqVs61WoIf8t9n1yqSj5P
pvHnRkR2BDG2fXKgH+GltokyiHBPpqjEv/y5v2cqftjnRin8xDLhmpNj2aKCvwDA+kxDyNvG
Tf/yZ7r8PY0FGy3YLJxhSkaeVzLyHpJ928MNbjZvoevqEfdFvreaTDY9i453C4C/59EiMb2F
dKMq0AxEWASvs7pvgeEHuK31zhQ2e7jB16gE15gVWKnG9dbF9Qd2uy3cFcUE8EOw+fDbJF3t
sY4Hix6IfQnMbukEZVRJ33ttDcxm9vBCfKttvUd1Ya0TqXqEw1LGpPVyrMDzu3vvpEMnBvQp
pEITh4hMWPD7WraR/KuEMk9wmy9uQC54xzMB9fiIBqahYhBXQdrEgd57YI1y1zUYi0vCDJTZ
J8QU1jvpU97dkRz5kck64b2g3jhs87ZpsC4wyw5dSxzJvWcUDkGI36hTdeqSeH5PdBz/3Fji
EOsEIm0MSAL6z85FlHH5QiPHOwEvxjn6QHILcDL49fI+ZFYEKWr+lvHGOdPe4smkpM4kFwau
B9CdQt8e3o0Sh6pSKCANucnkEmPLasID9WS0d3RMHqLUtdtAQS9bj+bGeJnDrrpdKr/oj2S6
oLUDpDv/OIW+O8lW+atS/lLs8OX1ZflajzQ6ipFLiC2knWQGoap57ZQDLlvLNoTQKy8p5hLg
siGbl3QNfS46/RgG4upLbflbzYC4H3bPF/9njB/jUZf97S/uIi9p04QI23eo/aWZeN5rwwDg
DtD5BEkqcVUie1msM1HU9MU93qsrA8SyYpUlZA7t5Ey2Qf3blpLPHAlIO76GLzhw6binLutn
nmAD/NnbuLFREJLPehjzXVdw0ObOy/li7KNvMsNFmnHiHpjBaqJ3JOyp1zhk4o3X8kXQR3QG
/HOTc5N3aLHfhqcbPYnyLrg8UDWGmlm9Clg+OSAMZJUArlceXh+N/qo7YI5U7d5CSvKeQzkI
Xttsec4pG0baNMldIgS8/isl1HvOqc5ugGO0K9c9zHD6ETWv6jR8Iic15Slvx1rahshcwfoI
vk0jcQVMv9hnGteeMXUghX+j4Oow9zqfhOQ+JSTzg9hjVbVrSq0SQ2g26ZIi4fFozRmHikTd
54hz0nQf7iDw9A5NoiudTlcHY/4PdAgit7SUHIpr81zcl4trJj/2lCBYM/pUyd0MF+OjS7nU
DTPNmK6OE541oEgWpwrJe7oZMtT/Fdte3CfHyDn5qP8Y/sI4dI76TNANGPKbNVXY3n9bkJvj
Ip2MtrplcFjq7bw/F+wmceR6ip5nqRE1V0fZy2c23Cl5LwXhBiNZp5OtBUdLLWvs9NEnXY8S
domHxrhiYB26Jd8JTDq/0TGQrp+Asq9uYKhsS42MEdEBOx+GuoM68UyMKPOrN6ZnGCYQcSbY
8veShsAUO6VPhWkiXFUu9cPCSwH2pDJkezft4+2WrlIqQ8nCWwDdqZfgRcl+DDdFo4eKZdFy
Uhd3UbzABOuCr5XidH47CpwpKthUG9grRRsnpwc6aWfAhO4rgKCFlRBuMi3ici5UuFDn+zPo
uiCbDMflBE91lJYxrDlel+cGJFh4ombHAvkMyxO/UKUeySA0zzR6nsfYly+yzodgcpGsnMvH
ZYMP03aWoKWi9Rci1HD9TOAUcb/nZtYJAGrKh/sD6BPgf69royTlKXOezHyQMZpufFsIBJsj
dKEYtACP3qM4Vh0g2MexBNxE8VwSOzaUGX1PGB0dBpldi9EU/g9PHVq1CvOL9eNrQRLT0P41
q4Jvax9P6/UXTktZkhAkGg3AKeWVIUmWg3ElskaI8B1WeI7z/xY3FM4l3IQrtxgX2czTO+qW
4BKBkiOLCFO5nxwj11ydf2Gp9VvvFKl50yRpDJv0KkHDJE8p1dc+chwSEKN52GDnGw0ntv0s
i1533xvtMfp0lYMdbfW4U489HVhLV5z4+4tF6t4jJZfAruIHO0X4Jtgdg5eLS4HgkuU7KY95
NChjgIdN0uEZMDBeNNtRadwXfWkZNxo3GkPT+c4g9NjrpPUN4hdOMs6BXAlZ6Xs5S3FPvGKk
o4Ryi6czWkF0D+W6nHjbv0CnZx8MH+RlZDJxGbs/McOPhEadn5K9+rOhxu/lPff1AA4t4LNN
goqrlMiN0VsKCJiHTGCf76oyK9ovTUvQOnOBMyzS2PshFXY7NwA4euImq4hyt/082bZ/PF/F
x91p6PPSY/PatzUC7UgwG0gZmqDuyU2W2arSb95B08qUhuaeA7vOYx+olEjU4PXubCQaSH1k
4T1xtJjol9VOHYwA2ON1E9a1Ocm/E0cbBNTDMyTgVi/8iOtBoTRhGDPPxFV3iNiG0EnoQ4Pp
EdRrGMpghjxP1LJxfgAZhFmn9SoEs6FH+faDjXe4DmXDR7P8PtnZPwb+Dx5wVh/Ecswi/xgH
W6/gPxKBups20B4ef7lX5z5xDrM5voSpzArWxPHSrywA1ycGvRtrp4hEibhDe5A/x+dqyUW6
8fHnWHS4ko0lLIRpfm8bnRkIipMP9MJa2h03ZffCred3Rb+GiUaJAakUBeWmZvwP3AtVUY18
SZhy6+iKSKs53E7CJEmBWxQGHTH7KbPyeJbCxpRbP+klMo05TcgfwsMszMtciXxj2I1qmzj3
cfDlXEeJtH+1ovWBwC9tDfH8xXy0b5om7EroW6xapQghgAtUAuiEZh/e2tQ9t6OEhaqQ6Tbn
+smcRrJ5Lbi+K86CjjBXV1smPD9jYGfrdNylJPYBow4hLtE6zUadhO9TiPSzzMb1E8cFAWC+
khQ9F0GGGW0uHRhAyFT7PZVJEqezGppfEpIuWRu3pXGGSpf+y9vFsk1qY9kOdCrW58qWEoAa
EucRLJTgxMu5FcSfUle4AvqOGlyiARGDcMe0i0m+Y5sH4/Q9MCv2Pps+c9NoG0Q3T5URLHL2
yXkhfmM/DOTPbcWJYqd/VI4bhse/N/KpJFEdjqbVX0vp38G99Q1McPheRuC8JxA1CuHrtXyR
7Qxt99n0nYWgwNdYNlID3qGQSbkWFpsj/cmcouvjwbbgq4icKfERSPEhAObRs66VyoL+ODQn
k557mR+Wb1iR9gBjTs3SOX7TIpxjo/sEPJSotdbpQO9qZT1jrZWq8Uz9XKnvUjB6ha8N1fwH
EkuhuP1YNAH5gsJ+j7VJXM+evEPDWf1MA8UOJeEI4yENJikkqwawqxowWDhypk5ztZPp7UI8
jmcDdekDTxMJO2ge7JQRwSFTXGfcIgkXdlmUCBDC1pt9VujivGfhxceM/ZlbvI0ggnV8fVGY
t89MdMvVJ3Y3oflEaDwzSyykmgo5BkfhOgNK0xuasUuDcpgj25raLHoBQAqe0inlEJurVsG8
Tommdv5hNY+WiGFrnk/u7sPw5/RHKdJPCHv2fEHSFnWDEUHAofR/Z/Qil5gBKGitqmyLZsqB
0dcKQZ2z5bt26T+KNXMdgh6F3fxjVgganq4cosZmky6v+KJoKBj9iDC+sPqu1YJmjvSldnTm
froNksGP2ibYR6OO+EaLQWSzoavzOwodwYiF0JZ5X9QEl117OlSW6ROK+m+L9WzqWLRT9MVu
vIYu247wcOlSofVRQhyP2cWN9gNLxECcE5Ei0MwRwKfgGqq9k1gCjRX8wHFUp6nBWsYOYHWz
4rh6zyYWxrAOVRQONYJuq1QmfW6J9/oYjgTTB8T+rSntSVATC90YACw/gRJg/elnbxJht2ZY
H4oisTP5tAIS/NB+ZvhIrC+u4DEoxzs38nsv9AXL0fMdgYG23kUxb0c7/r1+BXSywoY0kA9Q
qQWzfo2iuj7BIGCnXjCMTf7XLNSJtek27+YboxpSShPA5kWZn42Uj8b3wcLbuXLnrJ9vEq0e
rLK+QYt7nrI8b7a3T4E71Hk/x0dQQOMSh9dVHzDehGHGJkEjYTOBBYtTv+md1bB8ZYITtf3m
4u7K/FHRlTTkz4mQZy3C9n8IP/a0akuZVlcMXa5/O4eQhBfiTa4NjhF6SHh5uNRMTfrfwKNp
eZOCkfZiVQWPW2kbEmRHsTkcU4+y0/8E2tbWv8nD+dwi/Z59EA0Mm8Ck/EzpzakjB1GxsZ4d
rV9Ri++zOCguuqLc8laOn+OiR1jTotz+am5fFHhNt8HJp5kezQDEa4TbGRZ23w69vDZSaL2Y
OFVgL7oN+7Gp4Kbru/xmYa45ZX4nmvpI5iYwCd4ouK/4CrR5Vuj6f1CzdqW0fELKcW8mgSvV
aDUhYZrFhse5/hK3yElEeutbmalSfgQjL4DpBdig3uDn8tvaHPbypfDsXEiPgeJtz9H96Y+G
rVfUc8KzTqKi72Yyaatpn400QBEPsv6D/WYTeEDeLPZ8RhV6VTY7wprIHjbdpGc0KQu9nk3I
WYvijp+bz/92nC5W+z9D+BBCAnPNXJlO8QFKSSn798wNkkLqUR3Th8Jf1QwKFEXeIFyMuV1f
6UO6Ou4cl9sXFiMRbXKPcCoF5sY/nDjn6M9QRMyOdZs/IN7ofDGH8BoKodiPAFb5owx0Hh+v
Ha6JvmGTCYaTNvznq7wt8jCT0h1QH9lvOBm2v4CW9xlLQeOxuV+PfiSz5np6lTiJrIFzmcW/
b/hmKBYy8uzTRXI/hxae8swjBmulEeuVL7IUI1dNK7qTSzHlJdSPr3WxdgW5y9JUsJE9rNaG
PPmyU6bJBsD6Z7TdvqHD3dAPpVl7xyiynGOrQcPNvwi3ZFpzDJ43FqK4UDDYg7O+EWF8sRkg
2VRAvc1lqIVvLfinVenOV79ofo+FIkybVB0Qenavvx/YF4HbdLsgH8V/3kjQC8rwIJEJAo8m
XtF83O9+B8KQo2+lMiIZYVBGmARv328WmpgeIkZ8gJeB6ZAbVSI9gQuCeN/6kpKSWkxewzxd
H6ngtH/VO4z/DJLikTE74rxBKjIJo1lRfEg0Or1UXN1eLcZTmi/DAxXpFbyr2PW+qfPBhF3G
HaIh+m1mS7OtoU3MiDj82Mp6hv9oU1mdw4sqWXZRkZnNpt9BlWPLMzkrZ1oLSYCqlGczQ29X
drUzWJ/SDppR0R3Ex2SSS581RpJ0oXrbgdak/udGILev4d+R/mIdiHVVUzO3jlRjK1kfaPQl
cdv+oYK55jCg4MMQHxxhkdxcYphNADsRz1Egcfukf/f/t6watjcEo6rQtzNqriZH8ff9tEkp
/UGFQMUbJfJvbUbt9rXAwyD4d9ZTXd20owoQSU59BgeTj7707AIZA44/X7P+CUs+P9L2CDaM
7fDEyYwm4flVTOnaw+d/0Ue3hPkXZ2cGmEsj5KFwhiqX1lxM3hytqS46UTENde67G4vWthfE
lxVcyPASYuemP/LwKHI1cYJ6nhVHGu9Gp0tuUMc4zPo5RJwvfNSa8eFU8Dw8T/QR2BciLXHu
lPyf/OrgrwcgGL+wwcG9aQtnWByxJyAi2t/Om+NemqhFB4CHhKx+mHNcAYp2hiZXTuc3cvAJ
XcIFvQ89S9mQoPotflV+cT5Xt81mXC1Ktq2ia543M+FRvMLdO/NsqycgXkJn2GzjGeWeJ3S3
OTwAsS1OZL2G9+xbQS24fWI6ZKXNx6THvbPU1zMm52td2rCy1/iBq4SQ9dMHKDkyvHKjP7s1
dHVjjlMItbxorZcYNwfhtu0lRbnMDMkNhFzsu471t21QLGpgIEWlZ3L9/+ISURo5UgcU55RC
EPUanHmRem4ce7rWD/PpoXGENbVFvr54wZlhkwDovITAJhpRdeKYneblu/UZoQJfBOsUw/26
zFITvjxAaxjNVVg2s8O+/gzHdAJxK+Cgz7hBY6YVQph6S306OV80x4/iK5X7NoXKa2MY3tJI
gSsTGmzZng8yLbBBNFdlXOe+ZbJ8YZXbbchKoFvvTkbLkvzco8UkLVh73l4ymndVtTyvnKAk
8m8BqXPhG5ojh6eSnEJIu0qZp+clKQ11yFKyE2205rgeYDcLfUTFPOC7gOMX1Z7JBz1xMD/G
1xLo6mvtZdosM3dM7b9oBuI37sc9rnfpfOmdMNQFm2UrRME+IkDas+lWqcj0JZJqzZMCxk2W
HgM1fjhGtGpvl4FxSA7gpxwLWPU7iqmMPVLr/7Dux9P/b/5gE564DjonPLoWEpPXGpOE4FGa
fUcUe1ghhkww3bVi0GtyN1x01zTtZpDQm0AzSy2GaAMjvlqn0RMGMYecaZmwOlOvp9B+ZigJ
/A+LWiKhhZtqEaD+h1ueMUgEBZc/y+OC2ys4OsCsciubv4TJll64sHy50SbFLmQjTaVkcu6P
VQXoMqfYpSUbgc6zW39doCOsJ9QzePA7UFWxrB4CJxpyrHRxKu6Oo3BEtFC6Yhl9dCXKKwNt
KKS8s8hP3mJ8zDvUO+MVJsuMJ8xDqJIo1zSrkwcOzOrHLiDRndOQuI0INAlGwnoy0qVMaf1x
CzkZ5EjvCqmozox4AxKA8pniuWFFXacCXfNPd7T8/YN1A/fwjBfcMLe1RlDg2Fy8eCST2YLP
isGEseNg53f5Q1VUITo9osbIgp/iPO5nZ2S8rIKwnOvgu9ebzNPO+Gbq48BiIXUmQ/ev3zW/
7gMQN1BB9GwmPu3iEkcSvALPpockVS74jbBoQ1ah8oH63E2Kwmdb06OzM1oFZLT07kGLQfnD
H6A5hZD/cndrSyxAVVzjnv8KK6BAAoQ8KeCGbXUg0RP4LJb31WUH2xi11fZNXlEB0Eq751IM
d1sFcewdv6z3iIeL2Yvr/7JBCqKq/vsjePMfTL9B3C+r3HmS258blmDMw4XXcrb5A6d1SraH
JuRBRK7oglUhFteACDO1pebuTtHBHLZpwAAgkqwcrIrQODq3FmQttBECOAQIUtHQJsd17e+q
rof/3wpVY/pHsqOJhwDjKFm8vEVcgH0hbhzM1LzTlcr07m1kxqDI0tnOvbseDvMaJn9tn1aA
9sRCRNMVwvlBfH6HnYid7Ygqg5k65+vnr6L/4Yq29i0jvuMktbYZsDaxjSoeWLynON2k5Ppm
et8p5dvUyrv9J9F6Gz7tPLlAsqbDsIBKDV+hJx2SRGwagkvSf9CTnW1DrkEfwVuxnRDSJf0C
tUDDKc8aya9swjb0swekU0IYZYiGK8w/Yz47zKOsbKIgm//FhNJMmB6RR00l2H9puS9/eIrq
eb0yq4u+L2thu+owD1pAmouh7Y9qmmY9YeZnrbXZareXF6ynFMOajnOEYhIbCaep5xCDHoFM
gFm9daIOO5adbRixuMDeEzfImq9OdG+A3g5jpxsEx0IQtIEzyZ8vhY5v+fHP6MYIe02uxdDD
iHo0y8N1ppQEeIUG+5Xm+KBotnifGl8Y+TD6a6V62szXJ9nHNJx6zLTggtOAfUw2MgPh7pLX
LgY6qfpFsjlC/CdMwffmLUulAck7DF8wjmciML4ALzGebxqoyT6kSF+Z7F01nfNsE2k30U0j
Ras3CdRYwKehRFQQewlR1SG4revbln+KIQQG6d/0JNYrl4XqM+O+2irvXY2B03c0mMt8FiIQ
so/LsmLSL1EJ0ty50z/9T26QNfJz82X71GYCUlnoMg5Gl8AV/cbPaL7sjJbnrjMYm4saNf0f
KR/Zq/bHAHkOVQXSJLSgvIstjCdeUmIvp7C8gC3VnWt6pREsa3Qq0UHYyp+av2vbBHKwgNHd
ETZAnzAmNpkRCNM3IPu7QhFEoLwDHEp/BL/t3bHH+zQVK8RVeNGoNIpiyt95L9X1rRdlo2/g
H+fw/DvHRcgx/rprd113ia5xw+lYwZ3e/i7+Ornyibe7++spCBl1oEdltiYNiBCC+hOQLOb7
pcKt/OY+sJ2VzYxxzcF48LUGGmM8/0s+9U3byvVUJUfSK24b8gnIGgGL4S/ZQqexWAGlJ6ci
d/tdczUd2c7QsbgWKF8mtAXotqGbj5s0jg9suf41ONm3ab7DWQLaepM0QTAzO5fofmZwzSRj
hKqvahlFkwohTq1KqjjHfVMXwZXrf7SuQmTpaDxyfkLhdPsAWDqPekg2YygGMHlmiH10WeeC
fQ0yDyRYpPhP7LMlCpg3J7dfhNZ5QxTNr/e7Q2Wio6TexZmSvCVOVO65t6tb93BndV6LPEUX
QW6t3xfu6CZNcvfxPgU4zPbmwc8CyxnIBNBr61+Rk04oZyadqmK//2kPbtROBm7ZKLG/UbwB
zVhZg6xT9y9wdcLBW1tYExhUu5yDGdW0WHyeA6Zp4UqS7SPdZ6foK2QIoNPoz2xHRMJdN6df
oUFX5lEo6hp0b3XSnMANJ0IkyHB1I5bv4pkibtQYBCpmPfJIWhn+evuM40LHh0T6sq7+wYKK
1nZHQab4DbC+lHeAuTGfoiNS4n7B7Q+IXBXvgMhHdl3B7nY+uXzBPwNOrphTB67fFjZ0mG0C
dcTEfeLQ6gT/KI7ZRIZ8td/yy5FfvDoNyV+4ftCHW7cfwDCMLXtn9DOd0vdgwwFAOTNwRy7X
Na+hQPfz5Hk1air+d2yHJnPUHrUjgnAVOhMsZlWW4+xkJ79/+2XflQxEbOZgtdnlvQLve4Sy
t9fSmN27njldKByao0e4aa+NmYynlPLiVYWRFg9hY3+W4gZkOr+uIzTTDk01AmEpSYhLQT7o
djXa5qL0ePvhMjzDoNw5SelNrYFCjThNd3fWNNBKT+G07t/CU8vUig+saxGfDY+g8SOENqgR
qX8Hy0PdYPxz+rjaekpZ8n9UHkyPQZUJCaNg6XYdOagIrvTnYJ+F/cB/WvC0g/1i3/X0PbpX
6/I7ZgjNC1eC9d/Eo1rbjsfXQBbeBqMT5XMEfcRHpcMsY8g9JiHsMsmkrz7VMyCfHzBJDtig
YOBVbhh7ZWUe383v+vJL7zhccfgDLkoJ6l6uO4bfR0F+49v0AYHdGmhjeLSpsUpMDXbGkXjZ
vrWilAEmrfwzFooGuWI3rRpmR0u43GIQ7MP53T4pcylsMqq17Hu+MMoxIwRHMSVVh4S3ROYv
YZVzzsxl9zZiV/9tLKqRpTiWekFly9QzFqPaDBlW0TRJJD8dA/Vra/cP+Wq4YnBaw8EOLQ87
rLrIpCVeOlz5v9B2FyerCgm04o3ps+wfrfa7oWuUy/Krfwyt9DTD2IjKD1QBkCayATTMBXaZ
8Rh6ztrk44LuJEEVNEPy9zeH25Bli32lk64SjvFj0aRFPHn11mOHrqCKTr/pddbhou156C1k
afBL/m3Y1OsvDDV1zmTOS45shrh82D+Z0y6Knr/WqfB1fdxWse81XyLu+msojZKXCKx9OXOw
hgylC06p1oB58HVES7/AsyvGyr2shmxZjTa22Q16ehKZtgyNVDNGhpU+y/8jLVLx5mKJGODB
xP2WAIeCj9R+Dxs0vHDD4ItsbbWX9Q7em3tgYmpCNBJpFB6qkqXkPueJQKN6C5f74IzVzKBA
Us7xofQ8c197r/pBOC2hV3sJkh5QoDiv7t9XmDmoK4gNwiz/kj6wEjj/NFGqqOoqUYVHjuvy
hV+3tIXTUjy9YeDha5ULjzs9vtaU9irW1VsROWUfpSQ3C48QFaTDJE3FhgHkG7z3b93pGwFe
4SauPpi2xGKixlE/7OKqsX2i0XI4xk4j0Is6WVB95JGVzeu3cT55ZqiMPRCvNLMcJ0YLjfKE
s+UB5gLPz3U1NlnCTpdMi8FXt7Mubg0OHJ0QMzvswEPauaoU48i8bAa06AJfdBpb3uDpG3aA
Urqkwch3DNnQy8XhpzjtnAFPPpxEj3lHGhMif1o0UDWn5PVqk1fU/vjsM6W2PWNw5cHxi2wV
Fm/xBbAf8Zmktbsjezg33NeZSmo8aCL/yCxbImUGkdx0udOI0Nxw0HgGW1t4qvXKFF3w9Z2p
g1rg2hboa491t774vTG8O70JpEzU6JJbsbiGqMN4WRjtBvHuSYEy3lHRqe6WupB+RU6QeCBm
cRdaFVYMu+eE2FRbPb9e4mH24U6P9cbeZbg5q4i47FuXMfzJXQmvOYYg5iEmjAMAJLCXj6HE
98LxEjFD4TrRStRRh3ky2tB41r3JvksPlMOSxswDj58pEZsVUm8Xr8n67Uw7sSBPIvcsZdDI
XaJIY099APRnJxU0EVm56QU6AV0R3ZsgIZ7wza3LyxnFUz/KQebZcyaZF5OINLW+thweZHCf
uTCRLUVm1V03e6aNRHWbuLvN8xtTh86KPsx6CtFBhn8U3TCI4tTnjcgBkDxlQdqVEj/9xzEG
j3LO0Cr43mvw4vUqFSY11nbz8B2I/gJNWpOfyHfP1ZFSh7en+bebFZ/NctUTPCWxYzt7GJFP
FSIfWFNSBgQthmQi86y4D6Yq+bTewhs0Wcdqc1mtWvBY2CNlN/hRri09c3QqUTbsf2HBLiQM
jvWMt/sBy5fvhpXAlLONspdEMYVUwDWK33gv2kLlbNKhS1pJPGJ+wuZzdbsXMSFIVm2ftyLn
/zIstq8fFqE7SA41nsCByO3pvTJFkaXRBeaPnyiX1RgUwh8xRyyMvWk3aTHO1BU/mfBIzuKE
3V+5Myx2C30d1srWgPEyMrTekfgSSJSjQ9RO4u34znOL2rdxmnWH5BVGbGQ5qLvLetxgqhU3
laImoFW4RDKa9GWMBn9lKbHs1hZ91K2oUMAEsiPt4GFqJbfWWz+CDaPKaiPFxnidCEEwtZlc
osjgTD+TrB/WetESNaK8t3RT1KneQqB3w2p36M8yM44HfKGIYF+wfirxih6vAtalHv5VJIQ7
25LqD+b/F35Cf8p8Wobq8SusLOyGt1a4hQSadjE9niiUe1RqIDmP6QC37/tnLI8zBy1CA0bt
CdgCbzHvPF/qz3/9PIveSXsAIojtzSaIYEEVs0+/O64U5ZEwlfxOqZZyCjMi/Gh3+vJWU0Ob
Zlr68uPf/0wJlcvUGXA+iJuw/Bm4uIM9B4fczNukdhdoIvANpZFuvzidQJwE672aG0vW2bqU
0mmAAaN21zoWCWNYu8a3q6AWMHLYonwXtexGLqGh/dyAqC4yG0UGmn533LkOXyhIaHU3FNWu
ED1QF2OAv80qMwq2SelMAl9pdLMpMaTI35BXZr0UEoRSSWfReAS0Isxe24GHBekrnvW7TQ8h
MStiuDX+WZkYPcBBhiPx0OPrhlrCgNdJCMgPGiGFj69MBczse1DKnPNPDL+XS5e+QshV75ph
nc37JXVDKyUgu4G31cTAlljZBRtYWAn5vZ95LyUWgxBisjDXwDp9/0TFBYLZAQ+ycdC6fuf4
jO29r2PwYEqbPlOUHJS9XdJk/JNif2x3wZVNuzrvvkcQ0Cw1QmR8Nj0nYwY60wJ9aKMF/uUp
hTGzT3XrbULvhei+iwRXl4+vG6Fhjeu82RpjsUrAB8PZw2Np/r+pgKUFOqvw6qJ52CwSoYeM
7aWARUv2kwl/VU4JF10BTtb60toy7bw0Ml6s/2QbGaPhSW3k7kLoKUEIFzxcnVrlAIe7u8rt
bvNFup37UbzirStqPsbPMV2rBVlj6TiGndEf6cvXLzlaw3w/YsGXMuNL8dvBv3fKgqW/pTEd
gEOfGKXHfQN3MGBooI2ZCzA7Ylex4/OhlsuU7Lp1s0CPtiVB/SecQSzTPRcU7dJyE0DJ/Shd
uLeuylRCNPLX1aKtErzmMe6Z/7u98gzcD449kyLMuvNJaYDk6yyMgN8b372z7HUELlaRlpr8
mS96rQroTtm94qbfXUDxTbM2aWvyWHAJOt2S8xmmls5ELwyTY248el/xSTlylGdMwoiIQa2h
TnJ+04aszq4eWPDZbpfupnkoO1SCvnKUJqERNRVulhbALx9y224RBoMczoREzaiTaJvvIiS4
6c8u54WSTk+Ljw/ZtpYRdJY+OFW/rgqryXXGFxH0HmQ6HUybVmmlt4oCFmfQQyI0lpPoUruh
c9o5lHfES5LL+Wvyrk3PoV7WD7YC5JTCRhMzqcqBfpkw7xTNIDNEdwZDkUUISoswYjj+zot7
Unsaei7NZW8K6pm97aaMxNvkc24KI8UvxpKbMk8t7PSX/qqp7Jr+oYjsnWO/2jXtwlyOKo8T
hGXryQB/P2EOri1UbmB+nisn1rIdFGvYTeiURysONYQI61zRzZ6zd72KWYxRSbBX14ri/3ER
YS5YAzjtfQfClcHSUduc7CM3WvJL+NiFWF7Qm05S0KKR3PlCHZb9hGFZNFqedenFToIbEOa+
EbivvjqlHf6ZJulxrxBhQrHTMTVZCygbryaX1FSrWfjjr/l3da9CdFOI0/TsG0lFHJ1EpXxd
bf+dVurXaKiKIM4Ny1OsHzo0IGeNlSewy9GbD5jd5MFGrb9MCpmp/rdw46QgA6fCX8tauB/H
t/Ob6NBPKQcwJFpNb3obLJ4THtTixjtrwJCvsQthf0/cnP8ebHHnyO0PJJzsON1/q+pkDnOK
FlWJXcZFcRj55UaaWF4+KxI8zROpUTeEMP7TEZGOAUuds31sJZhEzkPHT0+vYVJMJPgMF0I/
WaMKqjz6VLfiHBod0il6HGk66T0LxNcapG3oJupIg4mPz28T8B8m+oE+cW+1zGnIHrf5NTzV
sqJNawGO4Yr9yvaZwXNOhokOdY3WXyE4lDRUi+uWazirUXX91S/0FS10i5WpT9y15F0QnMZh
hNTnff9t27iNfynzfvkvXKKIllRbUHWC+haRi1VCEYyHihNyqsEW5SrsTTAVgaQM/n0E4YIo
zSHU27LavsbcQhmxSFXICaWO6wmu9PgxKCgiQotg/ssX26hJ3alVlEnKsS2L3EAcINKkDm/L
9QLQRq7LZE4NxQhoOeLL0P9hekUT6SMz1LOHKrAHYN8d8oViRYqN18VCG7SWsb8PPiFDb8Tv
swkOuLyCHsBXiHAil/DU9SR93y5S2jdAtCVqvCsx3pybKRXvAtGK2mPiECB3H70uy2LcZmXG
TqNcHbmvxxsFKoAnEz/q+XUQwYjPPM79kjPcDJDDKPN+4KNJocQdgb5nED8tEk6FbeNXYJfQ
pF0oF8dt7kqCOYxKocxv5it2JOva0C8YCS2PYnff8s14i8cHPuQsv5BPcXO52O8sfoW+1yT3
+elo/iS+u9LEaV+LxNlWyTZp+4SkeoijjVpXCoJfhgpzYJctrOYBVpwTx/Mv9Y3etQgc4xrF
JUGeBkprcywecFH3j8ORLAohuPhEtYivsoOTi/LYA/Gge+07Atg9px1g7U7M3FgwK60W3jAf
XlrWzqOCeb9Rpb4D7e2EJhjX87qiF5bwPZ27wjQP0dy39/vkwIp03yxISDO2AstlspRtSkyS
DvkMlOlDOXabLaBZHHar2Er9vhSwc1A4BR7d548ZtIlCE8lWj0YrfLFWPRbjFPmaGbdpSbq0
pgIPjsBL3dGG0Ek1WIt0bBX7Y5N4jdjLG4JkdD8vBJSJ5JEuWPwIfr5eDfedfueavxih3i8B
7R0xgwDJLKh92TwIkpbi5tQCprNllkOPIVZmXa8V8p0FM5ItQ7tYBhx4e3C2ioT7NGoi6Vj6
p+fRWknYd/9QN7iH0P6HlX5bYnC5dNxI3ahS7b6cDxBd5WP5gSqLPPOjw+WJMPwv6i3SmZD8
hff/bXImhm0rPjewiyXxwFOkl/ckg3MSQ4I58JoJFr7g5TQRctoYFmk1jOGMMQCNxX9HgJZ4
re48PS9cOC+5bePJJK3Lc5gXaqQuVS+cXBgHpsQxP4wXmyVHpv8vEV6QOLiEUYWuQC80WLRe
GJ9/cGVvFZvrMbIPObSrRSjO2NkxLw46m9yPmh7YO2DfIP3AMyxS5VqOZ9ENe4pq2Jh+jGQn
nWI+gks69yY5V3IODZEVy/Yu0bhPy/CmzDYJHJj78B8v/3Hlo/0Y9w8etOAL6KXPXjkMc/Gr
C5qp0bwjOwV5gJjybv5oHsYiUZQhx/RoeUqaIt2eueJLeyOEdiBk34UG5GKZywE+87XCGojh
geJaeelM2eOPVRpA66NNqynKOhyfe3xcFYZrXkrv7ENrc1RjjLO3/lQnLYQXi/yKb1H2mF8r
DZE/07sK7d9ol/Aa58VKGwvy1CWqY8zF+nWMacRqy+WJp6fqDCcsQR/ZFn6Ow6EeK5mJabGV
UxWNkefZBVM1GvzKwtT8+gHldB6xc9j7m6Sd7+//D4xFUtLobMWMc3RQlk37upRkJG7QN03O
n9CMrJDJTALMJoXDgyzrltc1mTPbqkKSZ+bfqyHagwchmDnTze/ItUjyQWRsWfh0k2YaAiUv
IdSZNTYwHQRqWAhZk7O8YKtT81iMdyO/cdUHfdWX4fi4dmyjaes1mfZS89SvbqUCQ0XhKqOZ
HxzaMu730I/GyXa6okMPXo4reW++uC7cSqjt74NtN4o0dpD6FA0KaiWl71g70vwfXRNNRDOW
fB77ENwxawekHF8NXJeYsSa6q+m5rYEHuaS9dkXIPVd937AUDwd8x9suQE+NLQ8S2Ws3P8vO
A3YxjLxGazy6Z933+RVhsj3skyjFBFfg0gyCNXZpAdUKyw7fzHHg1gTZhXO7PojGDqREHpW8
LK9BgrOgXZH0aHxU4NJOGrIUQgGV9FvWDcZoavnJlLcnxyt5Ep/AC9+AEblRfC0W8AOjUJbP
4NCIADVyb9lpcPe7EQxmBg1JOaPtaDG2+MGUEVbNsrjoCUS10Htp/ThHAFHa7NQXL3ktHGTZ
gTzLt+GIEkgDsjD3cOBIsL2UF4D0xM+P9xZYo4wuiMnLfZNtBeNLN1R6Ssn25x4bDfIY8t/O
DAVRdHobSsANaIqnFK6oIrVPUGBHUx0PLgjKncB3ZkhFfsXTqZwwtaeRXjyN2YxwplZVrg4N
r8qeFYECrBcUuosAElezxrGpmoDJjotJs9KTW9gsR/kSznMxiJfEK8hFdSu2PsB2L/T7m0c9
pb/FNQDTBjzLraCa0r+XSH+YJF7oZzly54S9HpcQG6pRZWwcT+Vcl+czz0LEhOQsHC8sqdt5
1sK1/4QP/GwkLPzydOdXu8f+iRe9ZD3JoJ+4C2rZY1HkGDjcMeDgCzei4rO7pE7xkPUOwSko
zq5rEVDOmNghS3pC26KyBilRBN0q2XQFw4d64HgpcD83rysIwrlS227aP+srSkGpH2bBQtYc
Aw9jxuubeLWj8FIO1z516qgBu2gf717kzVEY8XAllsMvetkjQW3XX7WTEmkDbonKGGqIuYbi
3Hg72mbq7JDHJDYc/hy22bvVCw8MnhdHcQ6vqhAeJl/bBj/RNGDfBdXmpb8dNet8rOwkVG7z
mSEOVXWvEYDqazmU5P8v+PN/wvItGRiq5ye/r5u4ThS56qgobwA5w2VAyp5jPqSj8Bm5z2QL
7ZpatyBF7hR6rO1WoHNAwEFrEWaPqHaJ1nr61na76LDUC+oWgXaTB3J3Lw4b3icC/wcv33cW
+pfzSEzjTgicLSvoioVau+kp311I/6N7vOmU/dXbU5oa58JZbffaGjJozzxUydnw77Rjx/rV
ZqLMAZTweC22l1zcQkT3YKffh8dNkFdayY9yeZAkLONWGR6rUAJeQF5x8lay6lNqLfSEaRoQ
b+Zc7rGK/bfrcvHvthz8QTJwuDH+nKHfSxUTBwnME5KWlhT8IrYjBszql01lKdPvcnXiLoS2
qBY3CYs1r4a4mGfjMwt/ufLq3bqcioXl+XcbKBceZk8MLVcM0Rbkd45XlFNUPh4z702LxkXr
qbb1tIK9vzNFjTd/3+Wdr5Ehr3qhPd2rUBYIVM8+Gf277Zrk5evM3tEHVd1H87pk46g2EvlR
tFHUa3Ydn18MSpDqJ854YR6x2G+TXEYNwpZQaGND1/FzmG01OdV9QywmfeMarQYtgSBn8LWE
vdSURyU1kmkRpu+xhJKn87mYoA17PRO2OUI4M96/uJzyjJ2CWfF4KKUhWjT7qGosdIktAA5P
SgfPpX5JXA1Jqj4nNAMPpLynQ/wRU8hsdC4LyQef1rTeUZiu5TKknD/sWr62WPIbB20zuYuD
Hn65K0cbFYvA09ze0UFKnZXJmsnLwq93bGMKD0MwggaRb44I45UCfv6yGwpUB9wtFW3QF/zx
bA6eUaL1O7l8oIE8g/XZJsnmwAXX4Xgd8pXiYBQtfSK9Ij3ZqBcbHduR8KQq9ZSbasYZJXJb
JE84JCRKlEXqseAxybKVmbcnvHOLx+X8OcrTd5GkR3p133YYceoxI735Mix8Yy+sXLiJfsrU
xfN2a2Lzh4Wdgl70fZ5UfpI+UkcNOdm763hPHlVzlC4WKhMZt03CEaPtq3uaA79F/IX3La8v
AaUlgwjnLV5c+XlvqXFbL0dQnF0fBNGDPSXlTY1qTMGurnE/WQKKRnuGVAeuC+yllNcd9WNa
nvbkmrgfrsQX/mL4k8Cd65yut2Dmfr7KoRPA7EcHY8tot3yRDyCGedmPEbEkBnYaWTKE+TjX
LtAHcrBqOdKb/+cVuhD+5EDDU0t+IYn8IrIhYwttk9yCo5dqNUil1X5Qa0r4Y4EWedFpRRgV
GvTiEBe9QfWKMVnc8pe37dN1y1BT4xJIp2W5sYrf0KslbP5n2ORVqmWj8IorsXxrqSpr5I01
btdqwbfqJAdvvEyAFft7sD9YBUrE2S8dW6/YPWDTj68V2Lb4iN1Vx9AZgDAsy4+Mkn7qurGd
Z8tVcb05rOr5fDua5DwXjndtUl24/zKqcekVOQV7a5dnIu95r1kwsSRIhJtGWLyPujdYr/cX
3wx1sv1s4Fh4WmnMRSRBDzd0rIJi15UuWu4D3cLWyoM2tAOKN3NoK3zgWm5NIlsxeC6FBlyK
QOLu72hwm0tigxffK5trOSkuvofBC+u6f8qZDFIXAAjhgzy9K+BzxRAYwr3l4tSyhxesg/Rc
RQY46afFPG2rdb+91tx/3oYR0IioTq6vg/m7mpiKIJpqlC4sw982mq2m6CN5xjvHNYd+pGhN
DT7BGK2M53wnLcMIPvU7yCQJqVHoXXDfC/IuaIZ6KTpz199kSP8uqac/84WoohfnBVO9bNWl
2tPkbVKSSgI3QObIDpkeFyTMXP0JCPEnOfGKhcIKq6EXNapdAQnoXv7EsdXgLQkp/MBDWbHC
eUnhxv//UDkbq9qm0+vDCtTpsDf7aehdvlPXk83lK6xjvAq3Qyc05zjmnGIYoFBjfsTaOIAy
Q6gg4ZF92KOTbBcUf2d1RJZ9HFftV7Fyy7yd+KBa9LlXSrs9nwR634/BjheeelraNvS6C+JP
SdO9O362udI+WVTewj4CIjlf713UgQsPh3gNhO+MD8Dq5KcPD8GDt+YmWqzV/egvuRmhvXpn
knTkOCgjChb06KZcGG/wnlICh5VKbVjCb2sZgDCeRoFDkGN6oMIKRfOMegTx72JJ5Bifm5Yp
4lIFCoxjDIHZfpVtjEahpRlQdRv2yB4zOB8CDjRqk/AVUAB19F90+NKvu9aZvRov7ORW2qow
v5oMEsILR8FXE5jfm1NHYP9VDJ5GiNvI2bNLwEygG+J6sTs1oUsjlv9yZ7ARgx2Dlru9zi6M
56yVwEdBId9h6DBnhslrH1M+neKnH00RSvrrRhe/BlPrt0w8bYYYBRDIzYzjpMBnNK4aqhS/
Tb9ZvR30fb+NN83JW8WPXLh2Lwmezr+xmqFQ8XvLiPWr6M9wSRxzR/FkwrpP8PsWQbrG4AOw
mhOQDXgzfroIW8RY/yJTwIavuQB3/PEYoACcBvOI7KtKYMUmzsUJwTMPeZubq5JCrAFFC2CY
gg14nIWIKXgoZYuWO8vL/nZoFHvCaaQ7LJGwAQrSmqmSndiF/9mNICzNeJbpkCh1PwRXUNwV
LsjZZbPcRPJGHL4Gphp7EWn+453NYFSEeomjV55WMSbejLsmGcWKNVPdufR2C7b9wzRtm1xh
BrnYKp44fJTgm5saiK1fd3ZJHS1upnb9LB5AhYFCRtVIYVii9TSmUl/lYT2QVKAwVj+z3uTM
te9wDJXttBQNtaA/JlTaEWSWpSeauQCR1lx62uhZwBSuJmHgJKDsr0fNCmsSa3nBOGaldSgi
lV4NjfzDaNtj7qohNgkeNBCl706MMaMq/20fcPJP3Dxx2Gb0d1P87FrD+7P4pbq3ZoQuhc/z
EwV5psCv5WZR1mi3PpqtRAg3gMtGUmEEpM5deHNbGl4V83fMqZY/Yw3xooGesI9Sg6zkh28w
+HczJQLSAIZAmVzTVdllO+lRW5bdiVmv80L/SANVQComTkc1NYXlpWy3CeEypbwy+JO6ePMV
xFP13L8sNsvKuqBds4GA0C2LMRj278kG2Bt3qVn/QxjgFQrrb88KP5AACdCQRnqanCZsas9h
8AGiHkogtCykELF2GiFf+Dz/UDUnY7eEdsJ/mKcCeA+MptFGMD1z8HjpN/YiIyl+KKaJndMS
xICrpwJyoTLG0vT3e6EW3LIRyidDffI7PqjKvpnYZP8HE/U5xPM625GX9WoUZZme++jY42ao
0B7MAM+Z0/3FU9lA9Ddku3KdIzieKqpyW6GERR6JxjfM5iIMDHj0Nf5lQOgijrOGJwxEjall
2Ncu7PuVpyhpJlxNROZJnWmSUq6ERaXRNqRfP+3QQpCepS9w+zVA4pFEOeW3KO6XnJpo3Qtv
oymtNRBEr9vSRpXLJm8Ds5c0MHNuCJri05EE9166FXAH0v1xGOU6ePYSrepHNOQ5QfMymtSa
hRX1++x87k8d84HUdLkqU1J/VCnE05fgaUs0HaLmb7i9EqjcESKV/ql7wuRacgKIcRynMMOj
ttNUCuIxQnlsPW+zXp5IgzUIYYVMr65NIjME+Te782QZ74D97Vd6285VI3E83611UmoG1Zvk
y13fbwbWWaxKPEJ6fIzpV7lrIoI0IVAQFYciNdMC6+Ea09vdJEHMkiSiKEkfR3D7wZhsEQHz
VY44PHDBDzFreDD/A/nJNVhvazZZT6TTEqvwUjWzuuIMFX5dyqKF2CI6ma4GnjsvxO/tGr79
wtoUnXoUj+KAEGc6lsJB5N7GvMXOYrHQ+2CJ/+L09ty9pYFOm7yODmKFTE2Orl2+MdpguHW4
crVIl6XhW5L8pCpi/Zu3+L8DtSCzyoqaOgI56qJ1y84PYS0kNBzxftWrWanybC4AAbtBinma
CC9LuXiyL06JvHhbCIQQK1H6dShMKtM+lMEdMO8RQInEJrb3uTeRNXV7DK+CnuSmX70v90mw
eIEo9VA7svafbkDiWbwvSQCaW4H4soJGa80rOVC4Y2kvxtgwRAsRQ4p9dLwyAd8JMFFDFSYQ
mKA+1GdOH8CuYZ21ib16L7DT++IJP1twQRhkNWPQM93g24Ux9AACopLFA/RwaV1OshKDZY+6
DvHMS6ueIYnDqSvFsWvHSed7Yjvd7A+Riwc8+gB5SG90jiM/zicnBzG0UZs9RSOsQAg4kEZx
Y6JVTTwsM6HxBLAR/cwEEv+UU/sHDANJ/jJBin40RRvNv2EF/vy/QeWZkQmfwWb5QbZZkj34
Eh0YwtwoKSetSH8XYPI9YMq3gKRT5GCdktyvwZetDq/XdqwDh5NG9nnrgRiP1/Z22aPaor3j
3T6Um7GwcMc9ob9CQJIvEyG/n2Hrp3alFE7zsZXPpNPDR9bmZBYuMJnbh6q+N9hX9aVbmLxN
+WgI6J8AmSAGTD8IiQuggGqrN3BN+wI8hsK8BH5+oQKgGNjlj+vpguR2TN+tDcFuS49CIDAB
AltRiZNR7gpti+/Dwcot9fgVcklBbeIkpHkdAipj6ouIEilPgA14I54J4CVsCLoVxtfti7pD
Ev9Lg0gGMKCa7AemJJ3PZI9ofl+cA56TD3iBWC+GQoe3dnTMVm1Ty1hUV718j0TOMwgiKHRp
a4iQ+oOJZ0gH29m0vsfuhTxAgPzbxm2ts/AgPBewit+osjERLqH8pcf9zneKGeFR9w1YDDP3
XGHOnprG3qByv35DVoFKF30Ff5J8+LzJcF2UbR2QiiMhPp5Ran7uFH2IRX75dItI6F30MIrK
W6Z47qWKv4E9flTpkyk7Z+3lqKNOQBE2B7Lxcc1ZT1xOe7b6mSMh+JKSq9rAKQjGnDv0B/De
LM25TjiAccnpM41ISntUdMp5Mlv4NXKMhNYFndBPb9NtdW0HOA2nn2VushoJ26mnUVY60YTH
/PLao38tQB6pGKEt8dul9zxdNn1SDBWiI1/19XNY6F8gypVwiaO4IqTqs18SnFVG1vdFKg7J
CsjE/TiZo/7CBA7H2/pf7tVl/eNXyFwrXnRCAMXIMwshwFk1Ad8ZIf+rBHmGY04uQCzln/oO
zAW2D39vj0LYbrY3nv7tAHoKwVHUuxjWK0pUnSo3DNYwPQpFZjV25dQMlbqd0cEO6w1ZNxZp
OzypePz1xqMxGv4C3zZpiWtqsfztL6bbjDLwgolPEb/jR/9mw3dclHbxJN33FCLsEaISXCeY
44rFhjhOd5kgwao3gU8kPEuD04TwtjCkb4DnnBsUGOaAeLMtBpL8WklYzIU1wLL7wFqfPPsN
UCJvY9hv4OHZSKrotkaksB19G1CxlCzfP6n4YmmG1toz7PURe9h8TdJzDw0ZbxEBwv9tMcra
Z7yIu9zxaaeAv2iMr37IHT2i3CPVCq3zeviqA1GvrPKVmzmXUPD6O3FyiEMWvemHD26UXDFp
zF3+oxav9M+9sLXx6bkNXx3OwxKZBlKEMnET/EEsirUyoE4NjujdYBIv5MjH4LTatG/APoSC
KQljdZ6gaqhozw/333eSEvZiL7FYHKzoihLR5GtTS9zxEQcqaYlvrtfg6/fmRzgy2aO3nXuH
K8gXbqZw6UykFyy1zg9eK8iHqZnY9fN0pMY/RgiBX4h1UTKfEp1QsjGO0uLHZn3dtcvRFkRs
5KZ6SCFF5Vbls7zseHitx3FPwV301Rbl+ehovuo5MKW30ASV3KSlZhH2sCBL9yfsWR5RQWnU
iuJkurXCk1ay1hFh2YF892OHqCOW+ulX84HBWnpE2EM5PGgtErhZzazB8v57cfZ1v2cZF2L3
p4FlxaUA+ZlfLOCOGkt5wbKLCdGWs/Cp112afSm2q0bTupjmkl/Ie+m2xjG1TEihIhGo6Sa3
jYNiV5Q4jLKGiHHYuKuDErSmCwUz99/G0jdRri5H7SvMu6ppkadf4XRa363jv84YFALfypBY
JyXxUoRhd7RM+eSgZ1FtDLt07ST2GVz9nsH/LW2nDomqXDA8HpjimoYBoHanrbA5IeqtXqOW
oORvPwZAExiDS20iUNEBCvjsHqVdclaOfp/Nwqc/yWVyvF7DkoNqPXoQGeTytJ7Vjc4Mt2tO
4kM30eex1qp7voNl7vFqyspjo61L/KJyKF/GVGbwQ1AsPP3WnRjxbo5qWlso3ggN5j620CIq
L+qvpJMjJfjbCa4rbg5QkP5xiUHPUDH/xvtWJ/pigyRxLUj7XDF6fBNDnc7uePjE6qB/2gqt
Rc/+XdZCrBZDQHCimzlR2uVs5pycTpV+CEkf0hSLEFQ8NavczvX5/C+d0USI/NzCb0o00vhe
Q+wdyjSozTFMrzdChaYPwVPm9ur5+d3BluwULBVyS++5vA15hMACVES2YfbVFywSC/XKHYjl
1DDhuM0iXXlqYwj49C0db/SAgBB5dKZkkn/dysEn1JaVhbkc2M1OABg+kQWmu8PvsBGMHtyu
z1+23rKI1V9RDobqUvJaqbxZ3NCQ0F5ChNBjatEhuHlE9yf5yu14p4mOUsK6NylAdUSjk/I/
gGFZ73Tz1Cb7me33VYxTbQLWYIowml+kz3sWjnc4lY6b5Fvi80lUpHGabjXx57VAjBQJYq0i
JQ2xow/GvxXrCv1qVKSMAEuLgvnDUH6mw8ywH+s7WpiufMnVHl+1O5Ab/81SWo3VOABsV7uR
c3jqx/SYAB8e0N3SKC0nUFqj+vJFkRxSEakryS7Xs0XYRQuc5GAYCPJv87sz3QKctl6Tw2r0
jJSS1YUriXb760thvxNZtnp6oNxf1pVhdgS23w1eLL9yydcjbQYAn0W7HfcUIokknpZs8+ko
r9ndqDMntwwwNtXDyDoU8bwr/ID3XLgzfu1R3tfZTKN6Pr67vX19zBl/6mn2Ub7lEZLxSHeK
EEr/hRq/erCPEcA1ekJdFqky1z+vaB4t4TgOH5CESI0xbMvSmtq/2TgWlrisIERqhtj9RfyK
CycrVzvt3tpC6DH/jYrWvZiOR9QmbJjFykVGfUsIQBIixADwnY3QDd+Pp8W7mqZn+yRAecGO
Gjp45EGj9n2PTCS302dZ+AiZ0WCT3opDFQxGwoAD3A2R3+ItpCzQtQT/c4a/Kl2jMQvU5+Qf
FxjJXR1CzjNA+x18AsYuHH8Z1t/tQ2Ef9+4JEoVQ3NUcqpZq/7FF54NB1Y5wgk53B43f83iT
TB0T2MJLgFnN/cI7TdRUlQbM4YTbUuSB6r2GVXWbYvmx6TDLu/l1+CUDG2WVJxvf3M1jAoiP
k76VhBKnSAdbylO5t84fYcoHUs5V/tO2ci2Av4rckNwvEJDFtIrQKb3JcRaC9ZaQhPwYy2B7
QQpqgKxAaVz5UYSTcoKeWDMKSEh2rKl72k3DMEcIUya5ExRy7wTw9+k7FmqGVIiuhMCga4Ry
9N+N1SNhkUxCuzJVkRHnGA0fG5Kiv9DhWy2JjAG1wFwQYyk9dCnqEmyqwEf67SkO9EM+nN/u
dRBrRcGBy31UmtmrH6UQkue2IdhLYmg1uowIuVi08euYXSta6sqB0PFfXkylFQkAsGvaBe0p
JT6yX+hUS+4nBwL2DI5c5H/RoY4dVBfLDlLhTMiZI7P/TYb0jGB1scKf2hiNjOXEX2abeGM2
/FKAUlJvJrhuXfDOgWlxuVWVbMpbaGxc7ZWd4SABYmIG21sx4X3jNNZbWTSy2jZvSiqKtVej
pHLpp6/W/giIuYhm8QeX0fh/1u/JWusxe0IF3Bf/HBrsb1wWicfJTVKorp+dY0ffpgyg2vW0
8vqFtN4Ubi4Hmp6p5BMxpg6M2dwrJ64hxKA/HpU3HfThT7V/Zikfno69DJbV1DopgYMw1Y4+
ZgdZMvjISVPrdJ0Wp3eB2s175VEWAgKT2r8TbgfD1okIGbmrr1tuHr4QJu51VONMdqk+WoXs
Z7KrrCteLhHb471hGJoLr97xK60AoxOXrOXgSXghmVJs/BX9dsjtLbYqfVrHWJ++/0aGIjSP
plAFYWKcs5TYUpJjY2P48ug5puyL0wl0zFeSfwKGxyBz67QP81JMBfjCLxpP3GxukZHYkmv/
njnY4dFJpLp21R2zyEBK/MzTXBAXcxM9/vVHNslCyFyP5gwqdDt/FT1of2aDOatXUAMzoS/U
l3Vn2DgvAmQNnACPBoZwJIqzMrRUiaKUjmbAdk3yEgySIM3K5QrU3AG8yX2+PZQBDTf0ZE7d
nO29ylJVTac7m129YGIeoVf6fBVQv4Rrje5/9QkReuXp1vWSHzyOKzHQrAT6srsDviblv+gO
HLsAbyvQ7CvalGl8biclFkXh/wXAp0AVSVn5jL5IdMovOAdVF/oUpBece7G00qoRj67ANt15
bSw0xL25eUHBoXg+Iz5RMa4XtE3x4AeFEYpZZD0FU6R0aB6SUTpQDC3/i0wW/eLoX3MzjB8K
aptfAkAnVLuHTXPq+vjczA01+ltx34vVXt57q/GrUIzj3q1OTdDKB1Y4OG+NMNYbCTM4WUax
OGIo7ycdamt2lt+9amAsXa6qbfQlnGwt5AWsMigfBxxqu6YYIWGOkRJbpchs03l+HYNakW3k
YYEA6YMKSD5p+yYaFXMdmWUj4o19xis8Ge7c4dB6FgqyDnoC11e4Ik2WPu+S5X1GVkr4R4Su
YTef/ONxXV7DO2ItAx6wXYyDMAPYLSgkUceMb0WnN/YlVWMA//pn/pc2fiiHKM/AkyVARVbX
5MxWiN9xjzOwuU+kshdLnVRqsD29TGudRMeP5TzERXEyRn5PxFjgzH5K4Km1SeGotovbVGD3
vfZmYa891k0476YLl9gyltscLsLfJ8rJMeIaRKBc7nbMHVbQwkDI/u6ebPwB2TSK3uyM7F4x
lSCBul970hdqde7UdRbBF5L3xRw6hx3O9o7utwlXBbmW2QrTNvCL7BtKuQLmzftfujN6rQ1v
ptbIIkPhg+QLSpbYYIz3ZmQSbCKoVur3KfSkJpNmamR1h9JZ5L769Fyw69510HBhtEQIAI2d
B6sks+zTV7A687PGt9+y55NBHtze8zgtNmWc2DCUFr42kYqLOALVeo1HOzD1GTQfoubzqOVs
3TkntmWqSwg8jUhlVNP+20rvLjOjs8Gu4C3a8mEsCTNzdseG1xohxDhyKnGjZOF2GhwGD1Ew
WReDqR5P7Kmle1tBDlYehY+vXKEEqkA5YRl7EQtGIgoovGdaR713/HAQ9xUnrCG9KiqbAlvV
THgHwczPdxOt23U82gvH5mBy9Bod3+3yxbGTHlQ0m0Z2+F5t7WYjpOhGWOtZJ0c08qg9izeY
wAxytnZt6KvGaq0duLnRCV3cjgWJeyxtkMTMCTcpMtQE1j2DQvtQyiDdz99iYI0Ct0m7pmtr
6u48uq27btjXxBwuRSqqL4FNsVM+ErmpfyQRtb0P2YnDASm9+noxwelj4cuhPNYESCJlFxdw
Uq/B4tatbYZSf5lLNyGlQqiwzW+nlree0omZTYqkxH/1iLM7nNRUjTlNompjAhX+/I9briFI
Erck/PptrazblM9N593Pbg1NXtjyRE4/N8KgYwWi77trv+xhsmSp8theeurafTw3kjSwJEmg
eeWPDJdgAoy5ngIsOV9E+Lpdi2zwnK1eq6b3WS6tqD/RfkMF5BMLTh6CX00WfCg9CwuaXVoD
p2tG0moD+cbnIBduAz64WIE+TM3yVMndaybrmOZN2BoX3NwFIp4fUV+UnngAJx+G5kiK46rw
z0XxTCwc7efYs2I3EQ0JaAkN8v22KppN25jjEmxkryKBdz3vpYyGuFQw8aX6AXzlyX+S/1Me
VMmbvujD62aAjs+F14cbkfr7NoWrKPFAQ6Y2QdzIGOho4xU6elCAVab2zUordN812ueY3bcy
snEi8Kw9VoakRdD5bdecnrqCBEwSGnK8sROp6RQEsPJ/urF/MNGHMOfAw2ZyklnnUEwdrsIa
kRoprOqOsOgGxDGdyupFb2PZtleq21V9l9YCLRn3jQ7hKXMMS9lbrJYIy/wK9gmVQ4b9ZyLA
woCUVW80Lylw1/kOX9yIfkUPjsv3jRGGOiO7zDfZG1jlWdk8fFCi9lvOio+GM0aIWjrnGw34
RvYKFBac9gmfRRYfr5jwvPWd8+SDONegyTUCo4XCOroER2CmmxDB6C6WLhTwHTxrGAw4ZtgU
FJqvtgMY7BGcOMXcvjPvN1VMHBg34dGheGoVLSCn5oU9cGXj8rWTy4uUmKIKTPrVuN5uYcLY
WB9c+4CSXGTnpqy3FtENE+XA2Ao2VJeL7D71inEWSH5Nx+dlkXOJt5Tj9hWNMG91nTt7hrTb
QPwM2qfptUiZ8zbxnypUgRWTy2RKq2kmCkD2dBgsMD4lQawIG674J3yWEu9SeSf/PktkmVQy
uUDt9ABBo8WQXf0XM51kdAoQt+0s0kdPpkZ+4zld1kQgY5NcNFJb/F1PHqdhUsI7zrwEOQmo
Jtxonyf1UlsKxAEPDQPInbDiD0QDh/m6mMUMBPxkeUZSToSm/BbYeKBIYhmTbP+xm9cKpEod
whLkJswrgUMxrChAOgwYJCnzFL+CjvqLyhlz7FWSBVkvZ4VajvlFANjrcAuKyMAQAfWAed+u
Qnyr3PbWBKh4Zz2iWQdqeIs2w7nKDoSDOoDQm63I/1q4uIx6c7NrF9LEk7TgkToHn4MCuPiR
jzkyPdIiWWGPB8UZDqi70+S2cWjjWOnrPD5vVrxWaGMHSDvUZQPss15G9TcyyFmuluXUIqhp
mCS95w3PjRcSlJIJhTYshv/jiHKGFuNWVW6FQ3MK3XwGbxU5V4VMogVE6zRTCQscnwIsb+hL
5fLz818LxuxrRihfkHGFPlr2zfFZ8STtCJPO5XNdhtrI7Qi2Um2HmE7fsYtbCvRrQ/xsdQCW
fdOLBlAD+Tz5JMrDcLWKMIGhAoP2xJHCJYVfIxNZtIVqPASykJwHt6YpO7AZMB5YBj6U6Ix8
jXPisain91mpKylIxpcvcYk1bSiOz5Z1/EYo1XWoGDe3ZxOX9wfjc43aKEbFm6+GXkjN1qUI
VCikI56etNg3G4iv2FR2hyZ9bgL4mdytCrlOMmvyux+OS48UrYCBLWpc27qQO7D4pzhqiKiN
dBKnZjayc24RKNQwr/mjSbTE3S4jdA82y2n+DCL18VYD7BP+sHeVxhq7uaLld3htiV1vnpjv
Ux2IdSbOLfewiLB0F+mDkZHBTnw/sBdUeXnH9d1J58LAFjt551HinSgzeMq7Zy+V6EV10l9w
Pbzyi7ZX+9UylCEh/A8a7CpQQdw9xztdcNqbWzexvaIWzkShPAQ+08UKKsAdgnn3V+0O74Of
LZA7yj1rYrrI+tO1DimgO+ABRhKma7ERRYjTI96veGDKRO42y2lYNhtAqz6hIL6JgV9k0vIh
EEFp86VvU3tHXArAAVKskPLO66aRk2dKYif217erQdKjdPMB6KyXbeXVNxZbexrtfNTavsdK
I+Q6tf/LRDrY/AoCEr59YAnY0dK1DULLucsNehKcKDp/ARXddJt7dVu74VsGcOV74skX70rK
AcXaFPcRqN2Ein4LYJsXXhKnNiv33Zf6PFGSfVTKgvZzUR/2utBbF0ubtdWorUY8FQcnKOYt
fomPhdpUxWmNYeYr96vIVO30DOJf53beVvfEWhAK+KhjtJQllO8fQ6mJv2sA7UXEeLM6IaZE
oMcGW/OPHLNGFtzpYry2fOlH3FNPMdihQOBH2pqb+BDW0iscILExRzDwi3nZyeoyzyYn8L2q
zh4xZtHMis4jEmn9Kmsi6pn/UiUjBMx/nSrhd8cMEEmiV8AEcnmNGbY81fUR80LeR63p9gkG
v7lfp9SElLxLs+5t7zAvS2kOha5t52oXvf2zVdfBFd3Clz3+EXxWeAC8ImfRr7JP85uXzTiV
GIXJIO7fNPNDn9sX2i+5m52pfFwpbonKVK9gpTN3gIadAGAa0OaLWrVRk3MpdwQ/GOysR821
a06ATdbUf6fRHpaqSqkU80EFG0jIXGuvM6d9RtZXcRMdKK0/KM2ycS6Kd4EUTKbuU6cheZbz
G4nTBkWZVSsJ5xJ6wXsrvgjM4OPFMoxNN1lMeu346eDdbhjTaYia0TtZPj/ZcvtAjqqhkKCo
UiLF/tUf5YV6w4lGeUpg5uNk9vEJH4SFBZGpr03VxwHvWjALXQ9GCMarXqVlklAaqs0vI3p7
j7+FFp/6BGaXj2joNxWQdqQr3lEFceNGSF7fnH08qiGdgq3fOjx77lj0rTM1TbEfNi9OgmEf
V3Zng4pqEXes7mVt7g5bkI9KwR6MlerNhGEH2WzHVTmTgpfbpgaXfVEiz+JhKUNsSmGEBPLU
hVkBuhvKFEnNLpkvGNKmepK67kcCX/FU5po1kTXmPfo0n7igCYh3KFxwxJfYg5jdF3IaGZGu
M+Rwq4BAj0Lq4a/Vk4/M2duvWkyozXDxKwIpF6lSAwjD53QK33LwRsz3sSZGQx6zbf57RWxC
1rc8WQWVfYZGLhqYRt2FAPx8fMwwhpW1cJkyDmP480Y2zvruPJK5OSVD47Ig7M2tcg5LjVwk
vyjKpa9+hpD3EeyruG7ImOgdGx/oVmzGO5HVGVCOVNd56mt4A/Ov4j9nfOXSJdqVwRJ9Jouf
x3pzodtkHmUTUFKS3J58hgBqSq+mtrwtDZHPOsaPmiC4PVAR9oHSe9BjYbeac0Xh21x9/cnD
6BN6x3dmUL6P/1pMuVCielrwnz4FeEU+LiHOcDaJWY3f5tzqp/DLjHCEK2Svgqef+zmpl+SP
7SxEPDe4/7njJ4cvXzdyMoy+k0KNYani3VLd9dXE/t5peyusYzt9E9ANXbadpMFtd8j72zPu
5hIvMDfGOQqcCJujw69AZOZFqRD7j9w2d7YZUHCcRRKFZ5PtpQs5RLmMPOMBJ6bTilLrkhKJ
9rfnAW8AONB0Mo/S0rTvgliFx9Hkb0r1Chnny6G7oxR4ZA+xvNvONN/Uu9/4l1FDQ7AQODhx
kjwlO83yeNwnnvQl8OHDiD6LTet7pl80TYm6Nv1PLNRHUsr8fS16qNAkCuSpaE9jaCS/eCWD
XU5YhRUUNUjkdhrfAhu2hCskIBHdLyBBaFcpEAvvmVyepnQT8vbO+wPs0MkgX0k7IkBYvQYE
RnIW93ksqilm0oVUUnIJcFh3/5vmv0/WRZ7Hz5T8SKWU1Woal+Oi5iOg6nviXqJz1yRmhMJE
3P8UyaN4w+H4Sc0EZ4BubIOAp4EVEh/SsLaQyhY3Ctrya1Jke0rUJJqhErSJSlNERfFGSCIS
aRR5TDj+rqOboQ88DAICP6AfAKU8dgAwHw75nycH5Kj5ZAy6OSE+zlVaPTl5tytPanlnWqei
lKGUzNDTq9XDP2IpxlzDybejGYodwKHQK6VkSeM3B8MJvBU4p87UdDgPC23ZOjUZ+lhpJF73
jg+WxF5+hanPyDQmHkcWXmuZwGpJZWCZ9jx4ZJcDB7fqn+GqxGSONvvauKKtYizAANkQbIar
ZtWfzZoFuwEPXzrr0T0lveN9sh8HuLYbSB/FsCH66zEMfiThpIGqDawEUm5AAl9TWbf68atZ
wM9EfMtsEq5X7dYpBAH5YYgXvwP2MghYqbk49VJ7blnqDZwp2eGpNU2WpnfsKKvEmahZun/x
PGhOS83v4FEYyqWNvvis5XtBk8haotz6rFlEulLlerjE+OeSHW9IV0oLh34b+dFtnzkzGNp0
uSMUIpTePbQhuPoYjpdLin6rODAOwg2Qr41GrvYWT31Lb9E5EJHSzYwYmn9MTwi7Z3YVaNWZ
0lOMwrm9SRLP/wEdunexzpEVQ2dygTOnEX7yCkStVIRRwmhNXFb1UA6cBx4z/8w99iEvMpqj
UnYJK+tCclByivBBqLtsCJIHs3TabjNSBqfACR+gC1GTQG4XN36MW9ZMOCbR47e0OXp5jOR2
oWVgW8iLnzyliu1L17+A1h4anC+lPPsVgkiHc+BCYczkDcsyQbapEa/3UsFhpzUhbYFhLMgH
nZDZhotrPFh4OayrQ8WNhR9ZkgFmePZCuF856Gaevu09RzzsjgM+TAWcxd2wINvbbwuS7wTE
MG4osNIkLP/NdTKE0GPlt7IFmiU5pXBjwIwgoMym+ku+9hjQ5p3D/gypYKojZE1lcvaimncX
S37Zv/mLoesoinnLI1Ar2UJVbmG2MxAO1Bqzgakon9vHBc0Y65DPIXmdp8slIl87vV2qMibA
+XLYky3aSPaus4t9VgBjHPXQZJDt3147nQGHkxtueZk09e/EwoeOR6mnr+BTS9qxJYeH8bRf
VwZp31fat7j/Y55eUYKhO0TXd0iKx7hxY/54vWczFOiHfn870fe4hWsyDLI5ntcH1Ks9+omF
tjHA2bG0Vw7/acsEawKMz8cnf+9Ga1PEbL6h+tUui+LjwJ/0gfJ6p1fh8sTSGC0Dv5HYKveZ
5G39TZk6+CVLtid2+2xhDE3EfHmb4srbm4etXz7U1FJHiElRFnfGHsEgspyq+OGu5wz4kOVv
XQSCyX57YLdVa077Rt8X8zx2y2zulB5Wp7RyhVE+dily3RV2bgErf+M6XHTxkAchxk06/HmR
ljr2/XE1iMe7GZpecy93cGfW34cxj9sgYYHsTzPgqBgcw1LQy+6dPUx4IsJ5OPx5gfGsR3JC
5V1KU16asJI85JV1MJhH9Ez7NvKDWKMKpKU9yNL/ryEBQmDem5ZOhPk4aiWjSVKBB2OtpFS6
iDrRumIjP/sLzR0+DE2Y1moqmhWe2dJ014RyE/HSEDLeyfHYFuWkEGffs5BcIDOAu6nq4YKQ
jMMBbmBRmWI1xzmdo3I9rDxgJYnh/f7GTVJS05HDFvrgfwl0n5jSIh8EERwzUkasZE+iRgYw
8p0NOVzm/0RaY7zYoCLu0XD+z3vQ+WkZQ7wk7f1XQqFF652UmnpDTPKSHb8qTDCtJFD2PD/+
vaPHz0JcvjV2cofBs2FgpG8+nD6FngCjPyfNdqwGW+BJIbVYjuZggr1O2dqAduwBQPiTF1rq
VaQvHA1IW67F0EEVLFCfkHQltao0X1hhjTJD0JhY81QCMjYNG6lcGIhNlkHARK1W4AAluFNu
+1PjvFzYEvo4jsL2/4YJOrpC6QxBVoCyzwlMojnu2DOx93WPsRSQ/hvNpJ8uX0MSSo0AbOqt
vumnc8myRP8YVctZu+Yy2hVzdN3josuMNlRsfeEzRuGDmf98+lnSw6VjT8Ov15VXsf/pkYW2
Sy++ii4W45h6OSXfWWM9Uj9eRt5buybA1wIp17dsuZ6HeI8pqAKFgzCItKK9pdiBfEx7MXk+
h+d9ycdxrPYi63PJS0npm+e3KaXvyxjclfY2qtRaygJnzXM9dWPyix20x3x1xIN51qsJWixc
HNITYk9bwnhLl8Tu/kuJVn89hOG8gIduhUziFOjWWVDX+eYVmbQwsGkvbB/EC9AuhN4SbGJh
mEhBeXt0n7k2H980xNSoMm+UckzPcw9BAakJTrwhB2G2cDjYOSGjQ/Jj7WcZBaaTM4zP8WSC
Q68VwZ3/2IAz5S2gDLAjPlrqbHE62zriV8w94flaXgn7pGVLtMviN+G7uiaokd8xHQTmdgIh
aYaqRxQOTK/0xuII+68lwYdL37p4seMlr8gvg144dOTwffpH3BIy7ZSmpryJLIVj3QEvS9Wj
6tBMYIyRFp/BVx0WFMYyKJSkRstt2PVg6ATf81k6ugvm3WdImi8mVSixL4vZgWIaGf/nOiBz
onJxUhLpcZWgfEMObnHDtYvWQfOMjW4B5+qyzArOWzfbyHIc6gTkLTpuKVY+QXqbOTGv0gpA
p4BSn+XQf1vzsCh2gudvL2YddcyiELrmq62PfdEBD6Pn8ExGruGsfuRaXul0qGRcA8tbLfYp
51ujdodpQfD7+zcG0soRlAy2nmXswcaxU9BtzLFOQj80duvSMmr89OK6jfpIV5BaVAj+ZHul
0iSpNFSNk3YuzznO9IwPQ3f6Sbb/Co++cb1xvysqQ2NRLHLT+Sv4PkFXXSZ2Bk1DsrbkJ2PC
zN4DNJ4fPnCwYFNoIrMj0oZ3Xa8EBr4j/c9wRpSbmGlhApA5JclUXAtTXO2dLIgItNSEGiLj
gxMyPDYH/XS9b3pzT7UZ2bAzqYMxSNnqg0oKihYMBUYA8HLHuEdjIGN+QrkNuXXiFuZQ9nY9
FFY7Y+4prUjINN2/R7/8VV9VdbF6q6vyiGKrKTmzVuVR1ZqNIdwKNHTKpLCrzNdqczPNNhof
uqdE3mTkqYZWB5Y89lCpOuQQ7XSKP3qUWTvVa/pUJ7FvSouT9c5tgGLatr0bN5jRbTMjNKuC
z2jMgpMiEjUBcZUw6IzT2Zh+7eNFxhvoaoKPK67Y19cL5exIrjRrH93AFI7sF6sOPzX0grFE
ybjpTtL5aWhebRR1f/o4/4/DJsI3KLQymfyKwo4J2gGL0/ieDuEZ2lv7kccYlPXmg/2jXNv0
3jSSj9mgDaOggoUNRdewFpLg3zTyWNjC7sVvdexxKaEd6TT4AtPBS9+LqS1LiPw0k6+RNICy
IqfTN4TatUtqC13qBNvgCvzjQQQQV9TGN6osOgytkgafcfwbv0scsjop7jhxFQTFWZxA1MdL
XBHrfhqeNN20ue0rDnmoK+F6E0Yh2YyfAEV2VY+SMXqt1htcDSfIQ8Q5tQTIaSSPkixNoh9m
HSXN3DZES6B/u2fdFyPheT6w1qfYwIDgKLKT0wF/V2vfJxKB0oADSeJtoA8LdsWi9vuOMs5M
DK6nb+61Fs6ZN9mxvY53e4nifPHEGJojYPC8JvKrBSNPzlh0IhWiygXVSXLPY3riJSyUpKi+
4dpWOD1uCt6pQ9YCuB0yHe62EcyjmWcVXrcU0RpznSWDF2kXnjktSsfni62gCyry7JsEOkGh
JqvJ2Gsj2PM+3gWPQxPlSCMOmzxmnbOS5PG13dZuE1HBtJMvvew7rO/RZwlYIF94qqfZv2Hs
DsFEzJVFyHQTaZIX/EFDUEjKwnD0XJmN7Z40gcp2e4SmhRDE/XMAHge7cQ3YHxXZza8datmr
6eZJz0tl5RuDmdHg4Ew0PQM2HiVP9Q8pGIC5D5+2p/heBLEnwuuXLtV+9yu81Qx9Y9ktht2S
gE/QXvEyfS3T099yvaRjb5POiDBPmSDQ+8cnLrD+dAHSoueDK9n+kTVfP0QcP2r6cGkpiwVC
+wkKRmYxn5/C/pt7H0x9B25OjIo063wjiEKSpUjQ26ZH50Ay4SZ0NuQiSlkf8DOuVHvkcZQv
S4Kr1c8p4CCPoG4Oikfqyqquz4ZEYYOadkHtScA0WBiCsZNXZz8JyhXV0sQBdoMUMF3XhdUo
UwT3AwNqMDc+Axm504Vvjz4R9Ktj16JF1nW0eNE/0dQ5AvtrqCn+LBnSTyriGWGYSUmWvWyd
5F0/LVz0A6lz1PvSrQ+1/kXufzql+OQ0NDFlHaL39UCRfcEFV7MAbUzTioITB6AX+3iS8V0s
Di+XENzfuXpJk4bSxZeqo95Cw/N/N3S3mG6tkhaag68Zhpe0uHoGAO8h9UVwhZIwy2ZENYkl
I4iQLxYMqQbqpAx4b+lMS5pP91YrtvaeEnNwlanYh/rp0fWYSqbluo2FPD0A9kI5A4esZ65+
Vx/POl7oVshwFA701mIZwBU1mlMusNsjTl5SJPjO5EqOV8IgU5UmdvkNgZMifHWekYXD+LD6
EP63lXXvjaw05bcPqdOPZ5DVJ+N76Jd5pcRC9WFHSpYr0t8XagXtyIfLLb8rn9MCKP5rB0Q5
PzLNUb+EFnex0BqWCPCuaglDuMwOxm4iG8Ase1OrTuONurVR7iE1lecjaZeCSUWSMaji23UN
kDslS3Xilr4ohydHaE4+Z+6awcXp98XLzUUU8lzb4U7qczErVIh+dwcytNsGGayMshma/dXv
EBFk3BAyf6iIOIdj6od6jyZ2bmQvz01HTQumFRxQT2v6EA/IeF8iNuZ7ZhLGs/XuHj0k87u9
Hq2tAn2msZgJ+Og4gOAGNJlltI2MHJY0xZFElKTGWlaFkv07AIvQBmuYcVX0BrBhQkMs0Ay+
6go8FUSHkoy7vFZ3RUhwXSAEnedo7IhYF7Dt65j6Bt5IWQ6W4ieWP8uHUfS6z9ZvGJnhligN
dl32Kftu9kcsahJI3WC7zOoIjGL5oYkUNSA27V/ods19RkJNyIni0jVapJDftwZT8z4Alyv7
N7RLPnntuhrItbFV4HdVPSJN4qjgUEAQ61MDo5krHKh87ZxP/Or8T9cm5jfRDHc8JV3M8V9n
Yqo70dBmaYDA2JXcM7LLMePH5/LBLBkFquPcPd7QwDWcbZ3ILJ23P5aCNxncSf0Ms7RHFsPx
PRwozgGjReKRpussWDX8vKJxLVOmQ4hbyakCUuVec29oM6epQn62O+7RRdJqqdnKctvFWati
dR5SFxyd4SbJj5pgWfkh3rJewzRX4gYjTtGBRPByVHvDDgn8yMk4CH4umEDCR7T/+UY67pZo
mi+kP8PwgRYG3cyK4wfgXNAQXX7OZgppbtJ3n2/09cEKYvLLq6fdexOtPHKo/DlsZ7X85AbM
b94sDPAiiv0U3gmmwf5ICfEdqRlXqYFhUuNyi+qZmwlx48Wv/pWLtAgxhMTHADBqyYIMUtD6
N2Jdt+UGrcuII5OCMs1oOZq5GOHmcEHUdsIsT7NNBIkWGScF9AnHljOVg8PTifqbsqqTc+j4
tDigHaOzSgf74N8vyyuqBi8m0ZMn8nQMl2HIDgOPUHWOv5s3ynS66o03tnFCQcsSQIYtEwgR
7W/7/k/CocbgPORpM0sdQF/DoGR+fr9epQuQgggFSAsQfwvX68b0Tclwc5s246Dv8tZHOT+x
U77TpYw5vp9uv8M1EyRcQnlwPxheL/qmQgytbZwXCd8ZpuH21W5f5p3PdEQNKyLU5oGKuSZ0
pkkH4Bfdm4aFCLCWHzRHnu02+TBpnrDVCsndAI2QFBKrahnTW4MLVvmENvFwUHo0tfmSgSRh
9dfWQcp3AAclyd84JIvoZcKUuk9FTLxDNnr2vn2ThpgsRAXEtpV4aZqxAEvQUzqtqGqA8rS5
dCZruYt+AsIN47KNZN3IC3wZ55ZVaMCMFZa25lHijcFvMonswhTeHpCKZ5BUuA+hrhEDtYE9
HschVplc33teJRKk/1Tt2lzjSbEckHRHxSOAG0zChmVneF13o6GeVAQGS2lCqcdQCSiyY9tv
uWrtYHrpAXJlF94Y8VU1y/0dc7KCDT8LY4f8Z1EtuzvSvI0ukKd10maZzEeDQNJ3Z/L++cBi
uCVQgB5NarJ2fpZB3DKW39fil/yvvXBNbkjisf4n8cnbevAzACmE9fC4EXJnS3oBJmshrZ1u
uJyzaRk/FGQBkCr0a6EHmaWEb1bPdy9J+jH29Ebna6HnYGYqmI9WtlAoCSsL7fzE9IWZzpFT
hV3GccX5c/9io9Vcl6My4O8Y+AcUk0XaZvzkwGUWy78zxlI3pXSqMaaFx6Bwe6D2tTfDz+fr
RAejf2WM06ngE+OFm4gGPfbIW7V9EjgFC+y656IOtphPyAzUKYkgPs2xsVFuTs2g36r2zceL
RBtW4W56h4LdqnNirzYJaq0YoLFGeXyCoyFqIxZ9Nybk/EuuLyJN/pnVzoh2c+9mpiXA7iZT
sLTRMUJvlYa3tzdruoj7v7DAPSX0oHIwu5InCtRKDq3RysHmEhct4ibHz8DA267WabCghsvc
wCBigBUys6qwIg7yT16YV2T69DK+Km1iovCqOxZwfv3BsweWse7AnXYpW1OU8QbwgB47LvV4
vf0WHGnEMmMCBkF1dfC/iOQX+yFWJ6tBIfUo/mQfGBNkIgFHMBgKnXy1ejfSjsF9yumhjlBY
YYlfcKILsStqVRTfHcKca+nnF67MoEHYKC6UYLY3/7pzynHdP22yaNWImTCrAgpZAANjEKOk
969ZpuiXYWYtwiYYqeCwI9/Ui42AP4KoNj1Ydvu2wciQQqCVrDFRD0LGDIBh4JGvQsupHcya
4ggvJyjYnoe7oUS1KHUPiaoTfGA9X6FK8r605RfD0aDM3WMPfmW9RycCGUVFbGVwtNil4MxM
vqecHDjngQPc0mAO3jwkTTbf0hbZ9AXNhdhPWi+JgcBqCnESpXD0KQCc6s5BE63CxqPGJG1A
nXA0MmJvAP+UcOBQcErR22o9HdJXvNfUcc23E075I8iD8Qi5kvNEBLk0GZt3PMcNbHlxzwyi
nZDNaZT6f3Yy7FsdBXSFftNSBUhoiEqjyUKgRTKGRPxY80+BMmokccSZ097oWnMSDBo+L5XH
r0jF2kSMyUuPQT6xj9wEus6rM8H7YCYeLABzv43DlLV3Pym2jelgR7GAiQCwqtFrPWwlOMw9
OghL3FjYfNDthKtJgzF4BYlXEWcxXYJ9Js56UUx4wfRcsx0bY1Ey3/G6upgDPbkMZys6h3TV
eaNlkYAjUgeCuHVJNqSGWFzfee5DIdgh37AsAfJrrz7np8PBeseJlp2FUlHSPDCleJ+Kr6Aj
bwr/cV63F/zF3fGtj4KKHmC/yyio2oULl29TJ9r0oAZH3BgQyrhsaAcxMvAhyZxIBf+BH8U4
ef7L+FU0ODosyFzjieMLhNzqBb0Ppi/oQ7OmL+lVTgFl1sLHaaDXFLER2umuJgktN4+IERo2
rC6zuJ2wR+WmlC9tSORvI/R0V0YP4XC8/e3/R6NRxNRXS1q91pUs6lVYZq2zwV5030g91y5y
0YSNQ1bOjeH2pT9raptNyerxY16ZT0TciYq4YvJCmUIPnwBK5A/LJkbl7esv0BivHTV+VNfw
KY0gGsY4t+J88Nsr2NvVpZg0v64GDa9r7p1MufLv+/RNe3HQbqWuwhTWhWM2vH4WSyPp2e60
6TdtvDHkTfRsFYGwRaMgQRLRrqhMFsf4Qv1JedYFC00VKW0KZtRoDlMoq4cnHzjzcEFJevy7
rUYh82ShwRSZl4fCn+SG/2fCV2WYkGf3WviFtQQVpf90+9wlmL6vjYDaHIDPq1Wv/pMlscV3
ABSzs0qq/S6tj5j5tJqfunKsElIzPnQiDKVDr4ZJu5EFgXT+Exzn0UeV/aco7rOQqhcqbiFu
C6EtyAbeq3U+4ArKOn/qvHfMuFU3Pb55zVZb2NcBi27d6EnRFtg5KJwexNF3uvZ6HOP1pVea
mqDUfDwQ9RhJZ2Zkx74uP86agC5Lt/Ln+OTSBG5Ba0X7d0p2Vo4Mfg7j6t4Dj3rFsGADpc7Y
hSE+bH/NCoHtKtDt6q67M6GVFKuwIIoGqV5lK2RpqoPP46X4dn2NKdDOewUfF2aoIOfBpkux
ZN5pwBf1W+h0184oCzF4qk2xok+6FrtmJY2D8Gllf19tdTRBLbhExa9t4i2DwxruP0vPFWUV
uKjUATmyCRz0TEDE0GK/WdCwrwAxIXV2iWHsSjjggSZyTNQIYF6d26aAFy6iFEdXKFwJpLrj
5vyH51TCDuj8PASsoPiRXuIIHxWDEJLQmWQ28678HkjI/zzOwvYezyAZmmTIeYEmvpSGsN8z
qTlH8sEPLNbMUKa/LtDmKCMEY3BYtdHJCjJsg/ZYFpes05k3v0SUZnJziUgi8sqN8m2YRZe3
CVYbORaTKFXBFOhUlCcZvjGUFZxsfvG716u271aHQcPsAO1+Wq3S1OQyBe5yQzG27R/YoMLV
1RAyk38+vkGyBlIgqqYqLs1wVDcJdqqm1s+LKIf88vTgWUZvxCv9Z30Tzlb/OhBnaPKhEU8D
G5fFimJ21CTkwZtjAEEbLCKJG86AXchBgIUwzcTZpccpkad8jkq+NqDD1uwAH8Zv43tky5Um
z8idmAZDQuGUOp6b4VUepaLnH0Sf8rpSRufaRsgrrVkEAQFIGLLhGKZAO7HNKcQy40nDT/zx
lh+kfdqDJ+gCdKUn7TFaHOhV4710yJtWvOQtDoHHYUCtVo8bp3QOUT1kP5Vf3SE3ManLueyL
ocfze4paC4aFPDHiCj90z7tV8SYbNAFOXUui1smEKBpRBEJcZTN/q3+8KyNl6ll4q+xvSj1t
69zfFZPi9UfipqhF7R7p3KuNQejDUcxLXJhXp7oujt6yeKLJe20hc4+68Mux1HHmJyxPYxeQ
jMUd+osnClwamL9UKGpUaiy74/AfeP/QJPwvgqjl50KCwsw0/rGN7reo9xZx2Vc2VUC/WhPW
0rkdBV7K5W8yza4hRpX0+LXw+w1RIAqmmO5dUpV/72JEk57lNrt/zRaVCz2ylzqCab9jbTrM
CQWmcmXn0pRWpEW3RKyIMUpmbB+RDfM3sGAODeHXN/gvYSfRSggJN+HfGqryeQot0IOzWXtJ
2BCtYOa/ZhEgBfFp7Yz2Ob/uROEel6eTfukvbPGmuGNhHsyMG+kECb4d6IXbuS7YWpVx3gky
ONVNKyXOEt34Xw56QdyY2zmyGclNR4BHUdOky/oVZLXS7yLHTYlTua+iNBbA+sN2LwEXkOOT
G/K+2uzLcZ/iCScWUjPMyRv7KjSCx3D5Se/0HGAMBb61b7Lqe5mGzQoSRPHbXQTcScZsY0KY
VwgwHXQ5/7nwIcQ+A/7srQI6DhNdECFgGH7o16Zu5vnzw4pB1lfqdPVtwIV3en+emkVgS/Ju
Nl2iv92fwmMz704pZ5wxFZpb6dSX8Bvy8CU/3qYKMdNHyljjNuo4F5mdTPljLPLADFg18yIj
N0zcIgblfMl0dtioQZ/z+hDGUKJf5CY2VKpClQMN1U46UoS5AK6k0PFoNUMft1RYY7dPoEK4
RJMchSJnDhC473/BOwTp5htDTTKhOxrzqlCBWi2/dF17c/7HaLv8/jZMsGUvYA9XBDa7ky6s
fE7GVubK3xS2PKR4HdAttpqyn/C2TbNw9noyn+sL/VyKm23sf7g5Tto7igO9rcF8FSqLUEW5
beGPspGhQo0SoiSYJ2/Zg3k3om3lppxgB7S+LcGKUXYFdB/mWNA6MBG+4OtlVatplK6ke1W8
3/czqgGxXqhsiqpOHt09prihdVW3xGi+E47ggOdW6C5EofOxSi8mh8QfewofExJq1nvbXb0C
uVRygBu/uLrs9tVqS1caXQEiUvD4zwZS9BE2wU6Z7IV7/uBAxv/vfQ7mQvkzD1GkXNWPj6XA
aVln6OzuKg57SGX1yl+LwihKO+XfTNn4sY+mu0/B61faFkVqLkaMvITy9QZg1tA4tq1Db7DX
FKZgqw4dExVmRmtm+2lz9jw4t81dYaX+NhVvwE0g0d/56g0XRdoFhi4tis6zU8qDCj4Y4N7z
TGp1DwXi5hVS1EuH2CFzo0cVbu5ZULjiiK2PL7p1pJLx0EVePh6/tPkE9IXKzmmmdt+ZB7Ps
f1r+XGEwF5U2YOGwWaS1597SDE/I9eZZJ5lqid/lgJU1knTOZLMICHaQUkVD/TvtQGOSpN00
fzZgXa9/rLgruh2craGwbEmlm1eshj772DKBFG+O/rgl0TnzpCQQp/1ersrhV3oaf15aF7xv
irFz29AGRWlCCK+uBMJr96PJJrMXhTVgr0fLBmN6gXod6ZA0zGJJY90YFM6UagUX2UW1ibL7
91yfAUSEA53vz8JVTvZcToDXDgU3j6wjL5SKT7UjqvunP8S9MYXtJLT8zwXeq92l8TIfzYX+
K0DaSxyWeLrlD/G4l/GBp0m2zlEZKdI/Se3hBS0pr89DtpVa+S4oE5QbbSyjml5Ga5qJur6L
dWggHZ3PtUbUb4Du0+CjipZNEdwDa6bB09QZHL70fhhcuZXn9kPrY1wVFA00MmlSLNGPrbT/
Oj/KIttEQ09KZ5Upk056FjWeYG0F2C6h12I5/MSSLYybjSFvamRIvcQWGj8WIb0MkjFWEAQG
DcVJUNDWoip2wImCkVkfRMNxxeWtYKjX9kst71K158C2kGaWiO+/4K80Vhuczs5jHEraupBc
e5LYhqbwST9egRUPhtGUPpXwvA+jUB5QISQm4rocTTlZohLyTS35SXpr6zv6hfQukrKfiXhe
0UGks7cT3FNPoS1h5AzySSeeWxbaiiwaRxtBct/p3OZ2jTLldOOsTlsrNTLkD3WBXdQKlc13
dEvynHMoWJx/pFZJCSQGsno1s83GSCWTUXQm34AsHZNM8zzn+EDOa9hkLJUGmwjE6Lw+c62r
RmmbYR089/G3xckrZ3UoEEuZOFJvau9kfHZuIqrYmO6zeiUXJIietFWBba5zQWtGbfT5qpJj
GAZ0DN6vvYu81I+7CWzkoCH5Q3pFsA9YPv5lGBMBWVYoSlFwtaGu3R+sZcX3DZJSFmNspVaF
nbDGL5i56qszhSmQRg0KJCe8AZBZzkDQRRB75Qa+zsiG5Z13PSaRlYfmwZ1lwUrbq0hwCeke
d+Ls3HjBRqpccIhU2NihingTNSPusE7skQM+RVzSKiKyWx2k19rn2AhRc3BxZNwd1qhL2Hee
ar+7tzEv0rCkJBp6nM6nEOPNGe1SG3MAkvUxftK6/4RuSBnLn8kvevBYd5sj3EbXhG09wSpj
XgfRT8rcGKByfwsKTshR7xEcBp+rKcQiSszeTzlukV7vUE6n0lsXzs9lZa1G5ZNPge9MtDUZ
4WUQyfYmrg6Y9p3KX14NxnUE8J34KH8zV/BEtcg//NFdGBa4X9VJcS2RsnQkDklDk2O64Ciy
i7aQ6K89SAbxEeQe/u8ljYKQDpDpvPS5DqQ2dv7Nsd4oBJ1ICdJyGbtENEviS+67hLtsdrFn
vAjwtaUet0GmRwP4yMAHrVYtE6J14wTN/ZOMNvLvwQvGE8zR1iKxYvRjf2T0igj5Rc19Cpli
k2VwiMTTVlgHfntftLguBg3/HuPKlet8Z1+XgoDb/WgXkgXIDLI/LTHrM2TTYvdB8eGg9nBt
/1Lt3jCPqeKpbbw9aPXNgkuDuF6hh4c4RES4qOeGcDl6vpxbf/A6IHEjDdn6C8SEunROWDcI
FRUGgP4kJz9z8KsIFSQf6bsUUmuHdE6t4ZVZ3/OWW05ADD8fcDkwQ+/BslJbBxJeDFM3fqaJ
sRHWnYRb2SEfwrw3Fbw+exB8BZPvVRvsrZ3D2vCawh2OpehQ6+iNpJgIdD2HVWmfW5qPNn62
dgX2qdnFHswQrDbIp6bXT0hHbBhTeWemsCpYHsIkBZHr7d6aNdNVhOCauOo7cbDX38dNmvp6
lrIcjZdEEyOrNgoMtjKUHriVc8IZY5zphTaYnDuMqZVgLq9DGO/EuJYewqHoKxk++BN3jtVl
55R5wCPFm48xa0C5tJtSIaC8ZDmyF8JOhHHqky2/UOSfRNTV5h9Y/RDcIJnPN6098iwbAZD5
JVTmqhU8mo3PJVEm98MshS8XLpbECH04PAMChjk7ApoZaopzecQHGlVYDUc6BJ3YtUTle8Ce
otsnZn/wt3ZfWwPY0sEEFLeQmCywxuXwd+8++BK4blTass7oxRCddpEKsDWQU2M+1tPjWHYl
vi3Z+idKwRsuENmeEeaI3jVZSqdTCPE3iZnyOfR+rX9oencmJBhTwa3QCN3/t3NSDCnx5kIm
4yCgQQArVVmj9LxyWuM1dVJVGx1rHyEKdzagUu6n7a7mglJoallYGJxdcqCTlKxNUfcyk39P
MhN09SJCts4dhyWr6IXpC7XiECDXPtJ2T+HjmCPhJfDNknQZ1/Jflw+Uxo7PSd6WZTfh0fco
v2ibYHxos9YYCKU1jn/O1CrqMqCz5QTl84OfOqfeozfNeqkbQiz/eHLjzoZPfx3/locXxzfT
rIV5VDaWAmpHGfFhCFY60VC9WY+LLMbk4n9rBwIeg/HQa6cEKGW97vF7bqP+zjRRaZsBIHfR
jfZNwTPYUDqNYTVytZXBze99mT4EgeJOYLMU6BuuKJjfxBTMsvagbtVRNYajLJe5pP9fZicO
T0GVOrYgsy6fEkT9Yw1xkUXCn6gNpHhypr80e0WIroiXSakiO8+3qPW5Rx2SL3whn8xYS5hN
WD1hsGG+VFtfkMbi1NoEpse+MOyXC09A69u99ouqUCDQZENvasQsDLnDo+7Jd0Vgrnla/Xdi
WiaU/tTa3kccDdVOgi6FGJyR8QJ25ym7hzwElp+oHYbfCb6Rl42ce37owkW8i3CMM3WEJMfe
5CwyozDnqzxoBEgEip1KKkiRoF+ZgXLRUeRvi2JQ0hlDS0Rp5t5tSSicdOKPmTee2oR+YO0N
KL4isqSAjxY5acxlEWgq8ZVw8YxGX4zTlxFGiaoklPJ/V7TJuBASuqxKljkBVMgzPjCNgZ4U
BSijzyz0tX8RBQSO4u5qzTeVoewzaI/PTtu0kIqZsStcw0mvp724bJQfdfK5vjhehJS2Z6BI
zMa4fJcu4L377s+p1eF6dr8wl+wUz19TT2DIGw0tZ+PQVjfkFEIHKbHLGrhh5qh08LE+FWJr
Yt/1wN5yCbpe27mrsHupZCBKX3toGXMvM2ITWDI6vRS3K/r+iMeI4uhu//7quJrSxDstKoc1
BkIWphoSQbmFuVfQK8zdLg5yEqqC+8o3J/7HFQGWhPqBtYRoLF5XtYwB5XUWw5uvqyjTeMSy
CxY/8bvk3C+WxnrMa8TcDDwla7HnKXxLQ8+2VYha+V1GiJm9p1P6/K1NhkYTJpyEw3l7Gf+f
0320n5fSY62SnBT6kkqOjEP36sNsI8twh1yKLGPjdVNlLBpSzjwEFNHobtw6rIskEwSzkFxR
/GDCq+LzakIXK7MoOoZMRRsOdd4Zp6dCtofLwVE5SCKIgiiiEUVx5GQo/PX0mlLUHsF/jJ5t
kzfsp8Q/GYH1hkgJuU8okLweJUesemJmeteHXxrIAoYZ5JSvoRUQiXnRc7EqyiWvDdGk0aTJ
osDrAxNJ3pTw/vuNqhKL9rnt2FGBH0xVXQtmB7zlZQYqLPmo1Ux7K2nlcl3AC2moHnchud6e
/5uwjMRcHd3b7q0lxKmSR5e8DpSTjBRnBRjCk5xCbhpctAWro0u3SH0jKjcN5vZbu3wCId/d
o223Q+NPDzEIYo2pG+cIdGNcgKDWdG9IGiyHVv4tnhJzfb8XD3Lzfbtf7BUFRFizGGpYrux8
FYgdSSOiM4yVN0LBylfvO+FQnHSY8Hr0uKTL8RJ+bdoaQB0Ou/O7UqDcQfYuUGb3tNjSUqii
r8t7zZ1Sd/557AJYaGQtROVxFBx7fV+AmkZq1jEvYBOt3HJ/hxAMRYHZodoWav4Joewn+6QV
hIpqHXqhG2CgWeyJ+j+vLlEDJWny9flPh6g+ycXEt4XcSHrC9ekg5fO1+nT39W3FZk52TUjs
Iqgjjk+o2C3HsxyCehQR5XaiyE9m1+954HnH7ZNEU9jFUTsFdML2TdoIus341Uf18NqQlRj4
Y+POr07k0XKxfeYvRWSoGJnbrW7PR2N+4k4DyLE2XJFehGcZ89+a33zkK8IKvhMjBBFRX1o+
DjCGK4lpq8YznOWLUxX8W4SAVqyWPmhRXSveHG+w0deQu41ayTZPr6BYP02/hiXjMGkfHyqh
pu3QrEprc/KuGS9I4qip2ffaWNj+GFJosgb6RJRicYGCi35FSXcUoV8oidWBS/sKv46fgUac
2spGSqUieHuxcwMyhBjy1UrssQm51OfAuEyS8HU5jGMd6zG+oxKc4mr1wsBCM3yyY2c7lBRK
y3twS/6dSiHRcrGkJgiuYxWD9AZNM20eKhpEObBQTWrcqtaOF1eK+CymBZnqLwbCtRpzq8X9
6AZ7tW8UUHjbOvLSUvR7bsbELaX8ujXlJ6r6kHw86gEnNR31vmhfGFPraUntXDadPzjLXS0m
Dtx094CUzrTliC0nAqP0Eq2/735DQ3usO3pHxBnQrj2z6aBS90paKKUEmajUTMoIYjlCTQWT
01d/0Tlhe1LrUW2BBcHl8WkKD+Bd+pNHWZQTUkD3yopiS3gpQFFXo34lAEn7CtRU8E3rA2tT
/kK3Il9oFd/DjU1tJgphbzzHagHCe6YZhB7gH3g4BV2B3y57EST6Nu6Ed3KNOIl8olOpuWM+
u8VJcfq+lJqgCRamBJR6DixTiuYcMFC5Zv5weJNvyBEc3ALnt/BvD+i5nBktsQ4VUcvJUUY+
3rO8yxnGpURAUYuNMCZw1NkdYULeYkub/Z4vybwC0HUhOc8TSURBhr2+KVMCCKXSfdG8Dnj5
5yZGVXMRyxj2ojWlh42YQWR0/pipxTjFpcQ97cSRJyWzIn0ZnTfC1tytfe5K06wHKIfbGRhu
foXUScofUyVeYl6AjoAUPDgnusyMWQtBR4v397CKwSwriHKYPJc/4jyEhMIO1RJDxsGSPEhx
+sop58bKu3pu2+DotzRq3FHHckAWiMxhpoCAYOClHpHW1Pf8bCazyjC3Xgd/D7VSbkrU8ti3
/Mlci5+qsuks3wv0cczizq7vm7Bcvbj3+ZxOGHQSexaZ3GPnnG+kr3TXNmRbONwFFJ5kPF6t
97hwyloa+v1yClVTxcUpBsuj4ceymn2uAkbk3BxsnmlgJ1wdORPljFpgUHGLpZmRrznc2cgj
MeOrPBZfzGqxYS44rPMQRYftL8pbzyRKjfrMtCA36J6xBr7TjL9Xf5+VvmDmEa6vX8DWzy2m
ED/TBK46odqk+4NpKE48fawr1s8YThodcCxZD5pSvsdKUH3HvrR4Idh51BPW+wgginivmmYQ
TJz5/gC0wRgbTowUserj9wjFvdr4rtmDKzpTsLdrGvg0zdhkK000ueEZP63DTlF5RoWixILw
CdFVLKIeldMhCV3ri9KKOR7obe3Hxpc/yBh9ckU6hGQcZQATZHQzb/TSuzJNDiCMCN9fIVwK
4sNfBS6qoQc8UtTjzTooD/b3ZVvSiIg0RK3Rk3LrYC2Gnbs3P7dkKSe7FADV9g4xt+kYQX6y
22X5aLYtYutw9AiZMUig9Tsfhbdy5H8ezhytzd+2F1BZa0AP9n1/AlTZtkHqjfePx584bybg
oJdB7nzvxr/y5pATk+IgqaojryEwmqR72xQpTVo0sZmJqdMq6/Zd9lJj98N0QFKbJbC0LlGL
waGs68bclSZ0y0XFenUagZiLCallsFmjTlYcJj0iDL+Ylf2A7tmtys40vzADsBoe/QpTPeqL
ynakNVq7D5KLqJKM6JCgQSXpNAAF74icu8u9po6M3Ebp6ttcT6f/cgFzbNC3hnhsXh276F81
cQUYskOAtancubQDr67ofvqRiFQ61f0CQgO9mnxYQ6u7Jr2Y7V6BsdMpVPmwmNNxWPq3ScJ5
WEoNmITPJ92Bbo9+6Jnv14oFPXbiGGu0WFwjWKxcjq8g5DQaM+1FpPjQB83iqdtv4ozqMZ0w
bi79ubcBO14q79qpHaPgg9/EzZfIHCo4PKCFKlGJIGD53y4viB2qaNfvhYk7aj4N2OtSKx83
zbWR7Uz2m+I6A8/QXbYbd6ej6ASfy1SjfOnIU7xqmifJAApPBQ5dg5F7jz9+lGavRROuNIS6
SnCGlyeJ8jj3lpkUH2Q0/al7tmWK9CP9tbU3Jd2BNiDXWqNqrhK21X2m2PfPcdL+HlIz2GF1
S1vugptoMYHH0ex64pK+29xZ5dJLHvvUeZs6siXQW9JEDbssPV+ewAi17Bfnb2ko3TVXMy/U
JpKD5y7P7evD04qNijhO7gfmRnsyVJNGKJRDuIRnzNhtMZNH5gNAxpEhDUB+w0w2uZtkwmo0
gUBeFIZMnjR5N+gjwsVyd7kw0siUu8gItfN4z/WXps3GMhRUb3lKr2cProl0GMgPUua0QA3n
icxS3DjFsd/o/HLBpmdib60wGBiGL9BpniqD7V0/yjfkURQFGAVS9Qp6uwfqaPodljzYvlsK
jMINSM+mNfm0YWButYvFVphuEzdG4x6rcyMVhg7QEgXzmnNP81Y9KFyU9AALAxtyizbMkM1E
HhAzDA+66QR1+VbjjiSDiNqaUey7p0drwHxOE/hkRrU1iM2gm/9+vlJDPYpE7UC/Ix9GMsxm
JQhX+b1jD9VEBiZHBWXSTH8TgOjAnznVnUd7CjPavl4bXi5JhR3bnG+Ihb34q4MdWLN0akwJ
+iAmiEVAu6mz2eLfsKEgbxstwqXnEg7bFgxsbQLQ/zBemWFpMidT02rqoH8C6tiykO5Iys6S
M8Pk6CYXlovkQMRnIh4HwwcdN2umnb4BzByhOp4UuzEqIYVAvBvBlFUb1BsTx+gb+Xbi/6TW
75Am87wuTJ67wZWWBR3I7iGBYvONgi6ObFJQTpdRxC910rANguMe3zVX5g/GJ2SZfbcHT1r0
ZCXZewAtdkIS2IESOU8DWH7NASsrjoFk0NnOVWZirw7qbZv6SFx8qzczveaCZNtoTvrhfk4+
6YDNKkOaL1XbQiCUFz4XTAyDnGGaZowN2yb8U02Hy8Iu+/gegFRQQZiOo57EkNDx3OrWlSMe
8ulTo7Xi4i9DhBNTZbC6qmhZ0YPFw/hqrjIGCJdfUnnvr8DQWeFQm+dY/3lkKfbSvP5yi6tR
b12z2sVV00qSpsLYSjBMvSa7LvH0V8twURSm1E2z8a6U+te4gY/p8gXYGyquqGMgi3PwlqpQ
DwrT+/SDkvuCE7LDcsQuja5mINfHKDNaqEIQGgk5qN2A8ozwEBbuA+jAXf7U7+zXTOD4+NJk
GfBM/xZ0UUIxqqMiA70taoJBJUsGsH5j2MLv5BBREOdtHZnYLi1IiGQQiLUBqS4phVPwygcR
OnEpbzGqFo/eW7q8JARf0lLfMuUWi91kIB2UugD7QiIlwKMCZ8y2y/yO4FFDL3D2PyeJFVFo
DVjFL/OyyCa6Eabiv1NCs3xKjJ+5l1UF/LkbUqs0o9hXSNk/iAiTd5UY4UqVv4Em/NsEwwaS
l+qF2ko5M9DEUXbLV2X8uoqNSjKnonpxjG+vKPA6Vl/VnHxajnBi3YCV0DFPBAnfDI12Z5Np
U58jr2AalyWnsEm83y5r4HAQ3GtsOHztlPizWjvvwcX25NIxQrwUJwjxxUDZZJbr3sXRK9Kv
Z71gJjqYUtGrI/wjn2o5a8vWcuoTV3cehi1OToXxm9XFB2Wh03aoB6k6eUotd7TsBJAq3P3s
85upplM+5XAUQ38gj8iOCBolIb5vDSppOpvSHM37qWNmlzMIz3dy9fEgVgZV8b2NCO0ITCux
GUE2tt6ePB9etDh6afCwhvwmW5Cjz/8j0+jgN6WtA+1RURJ4IQTMLR/qSvYN8XuCI0Fnqasj
p/qnBeSfK8JQXEz90jZf22hyuYJ38D1c9DgCoxsMFlIRxOdQG5SwycyH+d6f+rrFQ2hhtpUu
NrFcB8ZEpjSWu6giL1llTowsZdofK6XzCk16EIXjTztEBVd3JShkqQWuRpFTyTvXXLtbj6D1
QJsRCG2klFhjuHrr9kVuNvI8NZBXr2brTV2R1T+d4rY+V0nMElKnJu/mLU/pLkh+JI9aW+EO
/vy4LCa1dIaQWm/x0wjj5WA8GeOXAws+oOnLI4yukv2CDD2LVwlftVvFx7ymjps3VwQ0n/2Q
aD9dlCHmtlhd4pVNB194uyxp13KDTRxhPz8od+9HoFc7m10tjUIFnprD4tjDN15r/Srffsmx
0GEzOvfdsooxZzbs5yBiFyqe2p2KNO7k9YMi3DLUgEWnEbiNnqOn+AxlcfplKdGEPB7IrgzR
NQhitS4r9Hyl/IBBadPs3BmrkvTyBubGiBaUON+NRqPDZERInmXT6hQ7gv1OP8T4jNH5Ql8f
Jtd5Z1G2gU8yCjynpX8GAN+s0AgtsNgOdCeBwiYj6HKi2HJuISRzwMtK1hv4mFjK+2ZPsQ7+
lBt03uUcXBDVH2HrT2pHJly4GDqCdMzFX5CMe0BIxiThgNtDwge8sA+9S9D0tme/Hjknqr9D
d7mgSy3EuGIjpHW83ilivdzJRS9k/b0SPhD12/9WW5RInT6fIVm1Cak+uDzyAfDIQXu/QGFE
6QlREyP2Ii77lO0/pOFrkjEF44Yi7932TbipOno6C0t7Nqys6jsO81F2gv0cP76vrd1cXBad
+qY1Q3dIn40TsWbYIBeOSJQN7RDmIDnUrqvoHp6MH25sVkib4tOKnjaFrzUj6zJEOfe3QY5i
dLP0J/YngAmqE//275jcL1fcAx7JnTyHPBbAzW+B5dN4yFFcOAJnnzwroHXjeQd5jqQj740d
KKZDuzEji0T4iwnhXyXdkmGeDfGGf4o8E4oVMON8x6QUdnzRv8RIesOYUO3GpYZPir7YfBwV
wy7hQTNCyLF5SmHEB1DwMHRyEKt/f8soI0HBMI6ExyV2LGSxezJmV+m893/aCZh4rMFAwKgI
nVbQNw2IWlWoVUp2vKAnW46fI+Q/AIY5WHheFlQTItNJINggGJsFRF80OPrvhAaS5BuyyXOg
zu+JK3Q67Z8yh43zB/81yL7Xa6sz/NuhIQ6EBZlvZvLtX4+q8HU7awBeOeTl6OfXrHrRPBCh
DxH6VS6DgKjjswUWcVQzQL+FjeTl3BXC6+UaAyfxLu0vSkvbWTaus0n3Nx2onz3FffGNY1zc
d0HRxIBS0XkXDa4ltGfH5WhzVbmj/hOnltihaljyrVGCG44Y4TMvnrlFEfIbcpX0b7dRqDKD
0htpelC9asxVw5xpWwGeV/mPxrQw+ufn7GP3EmDSLe5AFmwDrrruW2chiMrby96Lhvh38vY4
Wz/4cQO5aIooTzax38jpOzusjVZ83/eXfskMvQ1fju6hTEYxVsDM3Qrc5GvlyrCxkGPd3uSm
82kft0g2zty4MKoTjJTBZgbWxmXxh8XWHFiP1cDsc8nFUXGy1snF3b8XQ293GFGfldNCZlzZ
sUfevrdNOaeD3vENmm9jNn6HnBXziVOscmnDfqg7FaBYr7xKtA0yb3SiX4DlMNzgp0Ddhqru
slvg/dZUgOfPoMyey5zOKVFl2DueTgnazqNkl5NJgpgztqWmEmht/oBvxZRiHe3HHITCfv8N
CMkd/tITHUeJFrnc1+gQHI9nerxR5IisQ9BJj0f1dvnFDH3zbWPwd4nre1dS8Xu3j0mvX+19
wmOUuthkmjIjGNdSqFAJ+RYqbz6wQovNiLlgmMdPQVk6b2hVgdFnQ4ts+BdhIDQYMJKX0yvm
tjY+MP75mAADMIsOvc0MHROuTqs0FeJVtain+OaJzmsaqB3DNbb6S4aZeO0hBkKTHp71KvCz
g4TUVqfeCLzRYEkrU2WCS2MUvF1V1kxZWCXKtIgr56jRb6IGb5pAeUDJwN0Ev1INbU1Pr2gF
DQcMZbnYV2wvXM8wzKQTt0zPC+cvLLxj1mJ3OwIWI4whz2VDSdKpSDqNBRTkZ0fVq63ycefJ
+yfOWlmeHXJXFNoppRHRQqpSZciiM5UjvkHYjiD0IrRbNpnbfB0HHakT1mWTl89/L/FmPhSo
/ppLnqEdQqX2AD08Aku5DHlEMz3BI0VyHCA0li6nFLvn9bC95+VUgKFBqefpFCe5ZiIOHYam
2nCj1rDWoWVJ5y4kjnYriCKZN5hNBDJgdcZFUv+3YE4WW5isx5L+rYj7cQ7nXN+MJp1A97xy
IE1qbSlClCeD/mK8OrQ/baOKB6Ff84jHBwzq6+X+X0H8r7w3QKGdpZdl6yhvHY94AV2ytk3a
oqd1ppS8lVm7B7ylDOd9rhl9wigmiA8kLg06m0+9+SFnGM7Qg/JrDMHkBlUb6hp9e2SeXafb
J5mqD8VinIN5p8nHFotpEUSq5dsZW37e2Ck8GUt5q3sNx8Akf1R8VZHlKPpVTEe4H6CTFBtI
pT8SF8DR7ydiqwjNJJDJuzZjaoE1hI5WCtpZLV/2HAoWjaE2Qm9m7SJaHg0FSntWi7ATip1P
8Ze9Yf/3T/s+WxM7otb3p7qHqQXumngYn5iqi5hmXsOMEwou1X/gZ3PcB7xYjUQZ3DX8XziP
d5bngAiX8GS1rl7s9Kptx/w+MKWmEhTLNhcBQRDZMgixzpyHABw9bxa24wrQjU6xSLBIVEHD
BxUcurR/9/7x8gXrcmzt34Izugo+G2VmL6xII4emoKTgK4HblNHL6N6/7zlsfY8ZrTl6i/B3
Bdw651ocrk3iMm9+aE+FDRS7mh1DQy4GH9OWcY/yR0jKrotNzg1fyKe5xzem/mcIGYTTQYoZ
rXLlq5/BoIizzeKcb56CAk2/WetgDB2CPJxDOUWUEouImZda7SWRKn/tTYNjVi7ziFPoOTmL
nbb/tL+XaHp4za8+q8h5q3FdoMPFUrc/c34nvAvV+93I42+0bGi3FKulU2iGhryo3pTG6N1Q
xWTf69VALOBBcknJcJ3r/nary5vLkXKI4IOtLGPPmUaXwY6IeXzJYt8lV9bjSi1DVAIHVB2C
239ygbldzAX1nt7/vok5s5y3wIADmvyOK2pm+iJSokzh0LvuXL1p1X7ieyVyJH59IB3bZZHT
hBcpT+aY4PAb022YDIrkXxBsBiQyKGCRXsHUTjC/WWOQskQ0Ifa12leygVzPmwtwE+BWVq7V
83GD2rXjCUd8O0R9hEkewWuOXBQvuNE6Ya1/u896BkYyFXVUGDHdMV02qgCrvKO1KyzoQfX4
pjDMWBCbJKRcjAS7bpKUADpPKmUgFjssF6KHWq44FbQoBCQz2wwf08qzhL0E6tXvp6/M+VGU
0rzCbqmQqW7izbPfWZ7KjVK5KOFkQIgpEDln+uj1nM2p2laAvoQofZOPzrG6VnC+l3vcTjqn
gXCSwL19gaSB2+iV/pefXmtl3nD83HZDTIluvlJlB6ZislRdICNOo8TyaobAHfmXTc8eXoES
vVFjV46CFm1NNU0LTeO5wHKucw68wBCWBwEJ26Tx4JngZrz2hjF2eh+Woayya1OmEyTU7mtx
e4HQBXRtAzeNSH7MNkX7tQJgQ5vliHFru9cvc3wUxMDyCCDHSuzzBrwN/ZEGDFvBjqnRsKFo
B3OKqlMVNtz3p89mIg1UnP3eovmJTIxf/lDfQW+1P7dwZCcwtSgMLCt1WaCzJuFCOTd4MPnJ
xbTZMtFv36dZ+l4Ifkx+Ma7/NWGE/A8oXm0bss31uKzd9uj5nASleMJuy48MPaSwscoWRC0f
PCSbJnHDgizeEDoNsNgo5oj8siLq/NpIi6XpxtdAg9he5jXzYg0DNyzj8Y2d9Ls/9yeQ5xZ2
v0FRS5cK+R85yY9MAylCfrkK1tF4BnJLJQrNpR+mWf/vrtRgkR1wvQleAIlwUBCDvhHXEVFo
Tgf9o1u7DFlge8dHtdJrQyl+lJ/izOdB0hG7niATSPLSSgJNEZkA/9Ua3yC6zRftydc//bg/
c9zis/vGuIsBoRXLkba2qw2FZNwOE0KzzFosO+0jfyD+Ewdey2iHhfBx+WDxKpllg8LB7j3m
Z4CPEXM6WU1xcnb0fBoFFUSXavkSQupKtBYg/hviNMaLbEOMdpVBI3S40hJd++jhU+gjs7V8
6FimvxBQzhQlwJmqxI/hO61qhB741kUnMcNgQYhYhmoxtogI5H59Tmel3wqhNup+cfJHz2oT
i322GPm8qBgEjk7ivRxAvcmPRGjFgkcU/Tq8jtMI4YSM4zf/tzWrLIJ6jI1mGm1m+q8GLtm6
eHlTOBAow0p6oqKZVEzdqgqLOoHTgsYjGYSA3+KuhZiW3BdhEiKrsKZE/sPHJgw0oeRHSznd
GV3U4dBs0gVPpVm8yy1d0aRP+bTNTurTSiTtvJO84f+TtF1SCdMG1ZVQWuU//JedERnR+PX3
i9ZBB5FbmLRfKBrLfUbXSocmNm0+TD/hITP9PfPM2pCttPXX+9GvSMZPlV8S/ZzQIFdmErwS
f/nHqEhD9+2Inq08IrnxHkeQsfQtBW9uItIvyNdB3ZlEln4UfHkfjujDZteBWRmB3LzgtGpM
SEGkdkof9e8lPoKSpzwIOb0+cBJE/sVAEQo2l1/H0/nS2o3KEE6l8y4bUTCBcaEYeMe3Hch4
t/dSU6hEQ/7RZ4okqDLt7TpzX5qXZX+ZriJKFJ95x94mga74J+hw1q6rlqeRqQJ41MnIcWh4
5O9W5Dpr7p7PPU1GzXS5eAij4uA2+X77Ukn1E+yLND9sr6e76BsGlriECaW0Ls/o02bodz1f
aPNSvkoBKeQ0Weo+sYTrMYVff9LvViL+nqmMgF8C+/GEDstN8VZWKsTCvDIn8PRzNZbl7txe
9HHSZ7XwuAB+Sr10+uj0zzt+qcrBQdp2kh7gOYRHt5NqxBIxjrijK9oB1Hxz0EiQYhqgRfGK
VgqNcxBDFPYj56oq05fFP7h3N+/gMrjG5dCe4oDFIhgJdWGpLlb9QQtObImosHTLXeN04wWP
AzNHnqPDhcL8IJx3La4ShIIBpFxD9T5tOlkuiRn52KN0Y2uMONS5VHZPRWW1aIRumGac0KzN
SAV7ZFnGfRRFi1YfhGnyf4U3ZRY67wilJnSEDpJSxysJ+2K5RiSePhHu0G+GKiOUDoWLAj/0
t3irOI5X68uQcQAx/TWQBsd6lBmFHXT/X5KQ8Qo0Ngnh0zUpmclE2fbCz4NEOHps7fYOpHUv
OwVtC+SF6wcHAGSmwloM7dq7tTDO1eVLzewWg+HlaIQj9OEiiAPr0tswoXjJnevfc6sh8VIe
22rK1/cqHYpV3gp90R/P6pRCLY7IuxDsMqnHvydeqJ/xMM9WFqn3Hk8yfeizqCH/PNs7GpB2
fZuFBh+698fCewO16uItdiUSLRp0jE5g4hDNbSuCzEtdnJ+9g99a+ER8f1zqCKqDn3cv72eN
r4JnCntTM/ItPlG7n48/EvSxlxbjqsAhu6nS5VJ+SkPy4bz9GeJtNsUNQvjCFVhPKJIcX5Di
zEZlgGOCmhnhzdyYCyTyqeR+eOHABJnwAc6oByAMcWEcFo/yTRiA13xvePrqle33hvcDNVjL
3y6oKu3VjECmN23z/9t2jBNwn392rRr+7XPbtoYqSN+NfwGYFogm8YxTEm5K2Cp4gOIdskTK
fG72cABol02HJwunKJ8bez67nfJFop198Uj8/EaDPaaUcypyLayRLcyb+JeHr5TWPfzYocg4
mH8zXrE6FoDufAoFkakUUIzY0ggsPSFnJWErKDGRwllbZ5hoffGvJX7TbqvDA8T+hfXd7SMk
u5o6iAu5uBVv08Yp7uqK6KoWDfQXNVIVWGRcKnHcIRMi6jRAwdyYIpgqkbMeKQrf840NpzJp
nCPawB/EES3JpjX4qnxpyvb/m4IX/bLv77MLBORT7qCtdnmwSJEwBVIl70gvOzrcLNjZWQ49
k9SeWdyF2hft6pAqk2Iq1B6YqwpKH0IZCqR6AWpfM3Fshw9sd6J6457AR1k7RUH4Dph2pub6
kP0bOL1LdDqgxzALsP3QWzxmuhOiY4KFUHztjN4HIMzrlMr9qsXokBocyoxMCCXh3RqJGVuB
k4D3v0qtui1yPVaccdLkAi58b4m4d1ni+mw4vhshQJjUj0PSn1SWZ3c8QmAAsqqW3Ob85b3p
zBPOnys1rQqM9iACqzw7U8/7SEEALhjoLJ3ONbZQ+Q+8MKQ9FpXmICrlYFXDE42XqetO91Vn
ALmALvXEuug481M6n+EQQgTaBRIDY7l3Kf/EnLZDTKbaC8qFKYpFFHc/4rABLjGvm9dXhrug
adLTku+COywUMR+zPzFCAwGGL5LUTvMH8gEwo7xw1BG/JqxTs549mSjEq7UksgEFUczVUT+0
WHH2RxEGNp66adG97eOmIxzJG4JYc8da+VS/7fRxXbCeLGPYnKkdW+p5d+wfaIIWdCbBZxQY
EQOiS9eEhbBn62Ma9TGbPWzabh4Js+QbrBS9Ttc59IfkorokbPhjOg3J00GR3D5KL12mVP1y
giqJXPf5VdmQu6QfOQIKfHA0eImEPUwvHkTJ++vQ3E2uXTKSosNJpxCCM2FqV4xy6MSfhSAs
9gMg96yW/WaTTOOJ3kNVObyiinQlQz20Lnss9WF1rvXAmM0EIwuRDFn9AKV+o1p/cXnWEJoS
P6bbowQ++Rq9pHaEmE0Ny6MVCSbI2bccNxl37ijvx4EdZW4lYJYYx6wKgogmpbf53a3AFLKi
0DUGswoJ93fCEDJ//7F9oQyntpgVL8aqjf3fJv5YGFR25RC6XMMVv/HGa/iS7iLD2Qy0se4/
99D5CnxSjmyPWMKBoGUWJ6vlsKr++Iqm8EOtE5Hr0delJGKTaahy5pjJVlLynwssN/mbJEHA
3rCr8ZXnrFKbGUF+WAd53jUKwh6aiQj2764TTk1TDQ4IIGDo+tnd/KAMkizt4lt1pFjV1OO2
oEujtHKiesWqAaXvy7xjk6UlO5e94VxlhMR4gbhXf/Rqwm7ZBBtzRf7LrXuxqTm2PVaGy5Pp
Y6sbLwIRhDSfOys3CiHvhQ2zt46q2riOm7UTDpC7keuubnfXd90ocNIJRvBe6m0fsDz8742c
pmZnP9qI81TPIyKT//RkjtgMRJu+f+ILoO/zXvF2k8qnu0JO3J5Li9xg2zeleF7gVH7bBh/T
9qeLap7lPc0Q25bjBhdxHoFHZIgUrPAyFnr155FGaXpNW8O1t7il0YiRVFKHqV96GToe/jWo
DXLHdBaARPHJhIl92yP1VDcV+lIKHtcgmE2ZX3z5nP2U8NQbDJbag/BNtBYL31aUUa+u35FQ
aPrLnd3ogp3tRzCVC3l7PtWUz1dR+uyuaYfqDa4iG4AbkeR3WFiPIcbFF1q3ONx91IHCLaR/
d4sW/+aVBOTOPl5+Nxj7BuYgEqPCdP74nyHErAad0HHKd9MtgphoP1FMwxU4J3ZAZMI5+PM/
HXbFOxdAXQR14CqPrlJE3WT3/LQFVsV4ziGMfo3sPFsMJbasxwyu2AbMS/+rYqpdpRGJ6CF3
fkn4iAiiMjb1i/DWABLupO6vX6qcgLqLg2g8kAmrdjfVIPAMrTTXcM+ADu79zkEFr7Vu9ed7
Ln796RFSLMkbr65yWjZzqz3fh+RWzv//RHK513Me36m/OJ5KWI3F2vbLSGBpARaUgu4H9/gH
lOG/VpiQB7MfE9OKVj9MW+tpqOeOGy4CONGESk1h1H5lpERwr+apBxCLMfgvTaj0rzaWOXZP
QXp2VM9M7OjGJCX8Jqn83vlUUbvy5PjPqnJmZHKSf6BrIVJXeaHMJRYMT+oaybcaM/iO7WvW
cZfCWvXBCqjjVEOTXpQfLs45XwOkZKNWu32Fpj0r/T4gGTUsWRcVX0qu9r3NQ7Oe/eKr/9pr
atKaMfBBiy1+p4bDrxFF6Pv2zIz+WKtNlASx/qzQwhPulPYYEE85EebO/h3+kaZ86jlr3zhC
iz5EvFg+5O3HlSHDTM5C0zDUfliutE1K8DFb0jSlzpJdbgEUfAd6fld7tPSJlXxNO50iQlnK
+zXTBYdNiPdZ4deMvxJODrFUTa0nsdWG5nOhP0DY1v5GuNXLXhIkI2qmfCKED64qD6oaxUvh
7/yQnb/S89AXlPKPQLCtFvy9okCTp7ZxEVkrM7a8B9Cj8l5deUEmS0/abQ9CpYRL5BZMVMev
1fZFsQTmOCGTL4P9Atceem9VZqRqQN7+P53WgtUNh9j5ENsakyj030yOiHIxr+UfqLxIs7Su
ayb3tJiHhqLaDfcVsyQP+hjVZ1c+GmrGx54rXP8i2BPqErVKikiGr7FuNzN5owRf9aDTDbxe
5htDq/2EKItTVYbNox0q+g4ck9cGvKw/V6VSdPlfJH3bLQ7ROzl7/8H/YxAz9JHBrAtQPBsF
4WK1oF7f3m7xiX0BE3+vijAaieBbrMJkMzT57ORdP3AoxDOLJoruUMCNnly5ehi3ib5mWzc/
htvHvEDyLxfUNX9TE9Nv5NUVNX3lJWokWOJsh40fhrymq7PVAWx0g+sv/+BRUwPNQIydFeOU
jEpoYwMYpjsSgOlk3ADsNBd9YQ4jZalWwXMNzKPalD2Ce/LY53U6Cg/oq3e82gW7JLMQfs7S
x/nPu/HXRD4vLbEQA0F3AtrGJYoF+8qZt2bWjVabsu10pLemfftI3W+O0fPtKp1U9Uc0spqD
vsUI5rzLYH8qQ6d/heci9AhF/XQSlqE8KTqv7ANBYWGgDGDsbr500RmYW4Ml2+RBzSHnEbTu
iGU8JA378Tuxvb/9e0WNvB1y+OsX99lkmdxrEUPgPk7POAQ4yRMQBpHepqEp+KhlthU2Xpya
q+W4ousKVip9x2o1cuwibaYU6DKZ2/PNflYrMnYWUAsIYcXVf5z8g6DiapM/I1SeZiKKDgcR
zwBTYcvCBHRsi91CawxHQYXqDPvy7xgHAWW/3ND9u9xeWy+5x4rW2XmaLuXoJhSl0AY9JJFe
ITPHmiYnoJlepLdTpDR8AAv0v56M4eSgSJZWaRAzYAomhM/02mRs34zMAhRhqsrVdMLYywbk
er5mW5fu31Ht0z3j6MxgcXORGdf/JgXCBwz+Uv9I8zHLJq0eFtonR3+p+Vm2BZ0V2cMF48W/
DQNyMc0tlq7nLVNenQMqfFJoe3l+lZEePM5i74j/1t2zuwYpGz8ZdOUd6LjrL9AWWWx2cQD5
nWvgDAojsYdPVRJiArvolb5IZYYJvPxn39UDKmPm+BUa52HAXIURY+U8FjqiM4F8Xj4fs0ix
0wZ/gNuozZXKFbDdLE0S9BrRlqoSww58S5WEoXE/5pEmS0th/mmLmRq/JOgH3JGqxt8DTJzi
gg+u6iqvhJPGPy9AD0IBhrH49ncLgSVoKJoi5/uEB3cftKiXHwbetXqfjL++7DIBlLcDGH9d
xcSJknpPbr1NUu0fj4jUfNO9ApQWGmNDHV2iT7rT3V13GWutcFknd68WR1qie6/QYaqahrGh
JiR7g7NB6T5NTW3KIwvFPAlFB8LH7QxJmxhsQfte83SVmzL5jCEclJqcGo68wzCA8LOaPIaU
nRB0fos7A0jSUbi2+hPPA6V+g75/olWpH7yxi5Zp/LxtGh2sYoAg9hTt67n3Xmuo/4AA7JuN
TnvWtpAXbY1CsKr8vh+1tm0Hk+Fgqd+AK3pXElMITmt4Z++RY2i3D8RaG9vmQUe9MLx8/4m3
NjL3ECXsoXCNsy02BptVIg9kiQH8Wyh0Y30h14LIVHXde4KI6ItWK80U0U4rOeUW4uaJ69il
Pnz4fXfc+wdnrGi1rHhsI2IMUepDzFTRkSHgkHpIjPbmpWlHlyGY0rBPbQSBopw9R0iuSfO7
lIxYNlZeGvo+7LFi3dAo35ywJihJZprf3kSOO2aVYOAYw1dDo6D2PTgcxn59a+oyJKezd/fV
EYPydMK7O6OOc6acdbDW9ghLfrPnFBKzPC9QgdkKfoiY9QPZCr7PXSuQ2qwtRgGu3hBRmthf
SzrNmyEhk+i6hoOU0PaaErimSHhswyhNlol1bIR0KKYmSUPhm4UM2f/YbIWF1rmVqqtjj6yq
9uA+aJhVgVAVGzw+XZkVfaChKTS4pT9t1SxJNUZFL+qMb+6mGeW5vyt0jrcKCP50craSK7iX
8eJPGR5+wozUdCdS+QAQwLnkJJlfCB9JtakSjL8mWLTjVl/UwmExAXj7bwpgzg0rMoM/Cw+i
XOYZz0RBtDmmbzBAgY1uMQ1IvOzDuFa05sNNIhJXT/m82VfVb1GJsvII7E0FVtobL3znPGkA
KMLOpgt7lu9UODvtSv7WNMDdJqDMmcFmUZJlMMnzP6YgnK/34KYnvjLDBl/c2tfdOVXouyHZ
iYW4Wwibf4iqo1XkO+LG7IZjiTk7xfq7UUHHtFMBPX7jN1C1UaKLVMw1HFOASWSKAV5AqhaE
6xBPXJ1Nyzsn+oelBJdkhuW8gV0YhYwhk3Qu40NzCjlf/08VkbRKRwlk4u3wgN5sD7m37oZq
GqUhDeIG5ledCIYPdjV3NJSP4brUmwdlFQM7pwdAt7b/2zh4uubPwuh3DJH5y2ojWLTHoacE
XVTNI53THysreQ+sRXcMnEYEzijsUhKDIj9CWort5U44n2+tuF0to2KKR1PPxl2wPVwFBDSK
E/DbLAJ8A4tajBokchJcLBDxLUIQidN9cgNyJ+cPuZqLKe+ovirDHKtWORf6+MGmqGNKt+UO
tVsjmrn9r5fSPW6NbYQ9d4pGTgMdbRwbogt8VFqlzDa+31qXB66hBg1yIIzSRTj01/59ulCo
11H7CpbAJF0C9uUIRKo//aCuXuOyiYSw3+3pscDHu2wtmMevQ0RGD7jzdFFkb5gFXjmf2t8q
qCZJlPwsUVg+yAJ5HjhVXh3z5EbH9O5Akx+H5b8xkKC9rymR+qcByuR7BhlbhKJXHnRuJFy9
VKj+xFXaA+QKb4E2u2JYWtIzwuN10svHU2QolC7OSP1bce9oapI27W8IijAR0VDjmApq1SuU
p4TrdXrbN3njJh6nKEcoNBVSShvHISgWKvz2giiqw2nmiRpQyk9q3iTbCh1oQzxRBY1go9v5
jf88JyEOo7wQWwTuw8W2YZwbb4ObZFghD9IlKmTlgEHLOnKsuVaS2NyQ2msC3kMK0fTuBNB7
PvSOuPrjWoFfu+f1FEJl2KhqJOti2m1A/14iCIgW8Te/NcL9JSoWGRRMso0mSeC6XoW9SJMF
nvYpyL1e66hgl5dvtnBkRTDY3yOkyW0ylgREePDszdQjKmyCZSib4N2a8b+B04rN+nFBTt6I
/dftaXLN330uO34kJNUiPGzX3XfoW6/ehzugyRG5v4BdlUwk8DEkc/TKIBnCiOm87WeH5QO+
CbL6Jm7E1TXmiqMGs4rH/4pE6qQ0Yc/jLu5cpDLJ4dnr2lQW+qyYH2WwubMduEBhgT1xs91I
I65tUbBgk9g0/sSUJfM1b/yDxe9Z48hh9CJXzDZOai1oT/3HPf8EPywdsDE0JyoxZUUSNX2O
iLkrefoEPoIIHTnAQCiwCkxGs52VOg5RvXPbCWDpWnDzt0GrBPkoFHo/PBi/dGM2fiq2tTE4
OH9NZZSFbF+LDYYJWJl7bx68csV+PoIVkIWx5diBWKEMVnR6oCDXtZAaJNjVAhDFI5Vu24iw
tYK0jQrb1qEbRgbOTuIeEaO4iTihXt8M02cj7ohWx45BFLIY/F3Lko8aRFQ7CIYCk7AeFmQ6
FeaaXOSVI1frv6Jt/knp05JAJttNpQZGdmfnNzvn0lOjqIGHOrkDf5lupXbzv46/8WAkhlmX
ismxlpljBDO4zXhWK+Qs11GY7U1SozVpnVYTK4zpR1K62fjO9xIGa+xQfqFOC6FoyCNOuSYl
Xvw4q+PsK4FjhTtTlKiNnkcqxjZvKDCc7ne7dW3YXPy06aEibo86tzS5SFzF5IM2ywTphX8D
5jZ5nFDayUC9AkyDfJnvLh0vOaJTr14IMpzDHvNW0g6jyetb/3OE0U70vW5iQjTZAD92u5QY
5r6/n1v9xEeZZRuzCwZU8W0mPMRhLa62bmMZolYRDVrCX05upsPHpD2zzAqfBpypjwUfrfMq
dXL/8M8MSdo82bw58oyy4Nr/MQD9UajmGh10hiZF9jkufm0R6L444sjJweEPCBKo0eCnEIJe
Yv3e8/YvL+hADs9D44Kksd0KeOt5yax36YpNNOpDBvAgl+yj+QLDcdBfXMWDFn65q33jLchD
/wLbwdQNoGKv7uO69lWak6cndBStQQDriI/oBPrGGgFRWiJ90sa3XgIe0o+r+Tp6Tjzg5o4R
oBY7iAUtrenuk0ICGWNsj0s8vqj1x6Gi7yr7/LSL0P7UCgFT51kSqyMBTTXe8xEuQMz+U8lc
5nSdn5VvvCXT/SfpXUUdfKWmQ3nMa5pqKgVdAr5nTICcUwccudz49VyyiFyKFL3Y2z+5qwYj
95R8qMfvVZObql9Qedn0+M/fh64pzjOTPBTQTukFZk/II3rBlf2jJrBvejbI4DT8SNNHP1LI
BMRKnvQHVx3teYizTHMIvQ27ThBLXQUhP2dv2/5leUlQRTddJA0JhGFQJzk59hi+YvctjXSq
TTi79TMyaMk3WcCgkaHqpGvt36tC0Zu7eur6/0LV8d0QdE6/vrnRUFpMea8hByKS3jmYWFtC
s4JwFAqdzclCf/FucJueSl9qZncPHQJQtQw9/FY9q/p6X5y84+lV5Nu1wr/XlPIYdEyF4qaS
EZGKruZBdsQluJTg7Swo9pUe9QAo8d5iyRDpnmQQTyRdJrKiJa+cBZraalm4QxruO/6N0ynT
7zVKv2LL3T15DI5tngf0esMYDN2pbV97qGuEcsp2UhZ/c5G3JufpaKob68tz8NW0bdXYSLsU
SlBXATF7/5BhAdN6a6wdSto+aAKSqe8c2k5JLtaBv0V4YvIIQ2dpZAJuLxSltt2UhM9KuhES
QTb1AgPauiv2H9KkqHoYc1JEFrIjSDWodZwmNukR1rhrsdUZeV4f6XiBpeF2u8tHWSr4TKcH
vlCLndXVTwhCfVmFJnIM0LriIrDY3/oWG8LEBCFR0ocmxu0sC6uZU1BwZf7Lal0hOtfyNpL3
tiMIWVTyI2RS2iBiAU/ZMeL/DjaduX/6fXKknzOwnGgJrsZD/y6GGxOXfyzSVc9k1OJsw7yc
LVAOo8t92RDCqIgFdDJeRnHQn6rg9jJSxy9hZno0t7xC+WG4cQx3rxILZr/i858avLYqQ6+d
FBCDPnHvYwwJKg/wqXwgASh+BT7wzSKTUGo2oiIuAhSmqDZzvwERQ9aVWOmvQQYEmvgCE5lV
8J3cRi4Uw+u+p/rZNxGR+sqDYpl3r0kuHxhIpcENk9pJUTt28q3VZvT144PF8r9isdyAXYRl
yVq1NoHPUVDGoQppNvrAhklTsAYj6KlhxKgR8jAstVBHUQ6rFny/PZ5RHUoiCfdUHxsQODI2
9y6wGk3+BO15kKKPgNdftGeu6ZJ4YlyGa8nnQkHrenvQEFfjboW300wfQcc/F/Cbp7iOlFS8
72Umhbe2xF9tPDnC0qbYmO6nr1a35JSN0Hwsu3Pz0XSB8J+Rwn5zZwxB/5yyBK3RICfEmaVB
oNv5XQpgMUZnYULbl6IYfsvI2GjY/HY1MdVIKFdksM3ujdCIZjTygDKliThxoTuuEywf6Rrb
yFJwlrwJLxOOQSBVGGermffye1m6As4MnnynEf1ZDYuMYqLw/1dBg4DMchMPiiDw4unnk4e3
/G7vQnxymGvzL8kdDZu5wX13efcz2UyCgEFZ/MImFbZoG0Cz5hMDn3JqApW90bovHXeGlSkA
LzfJ3GMagr//KWQAiRcXQLN1FJ5hvNQTSJJaako9HzOBUpVgDgYBwuZbaab6UDmfw3zbzrui
bX12o1g6AjAiU7ZDrm3RdqxB6AI/4DpLc/H+cl60PrQSj1eeA+lbfnLzV+yeFQEqtnMys3/G
mFYblUn3DeHXoSVRurqw7edUh9Pg6cgUi63t3crX1zudAiROU0DSifl66U5EVllmEGZHLSo1
Bo0FM4ODfp5VvinYWQnPS2+wjjY3YIbUmUa0X8Yf2bOO5x7dHcNaZZds8rTyQULgX7/49Jz3
FA298CDthvwiI8ynFtbXUM/OJXuTuAhHyB18n9TEo1hFQeaB6TW6tdBy75tsqVwdoeNWNK71
v0bswcrHKoFFsrBkeQ6g008oS2GTh6/cTrj4nsUrFc7LDUuhtDhH7h2lZQiROh/r/Q+rOvEH
Z8JikI7kI1n9/p3mbkK7MbT1k+WRXAWyS1K3XqNGjnUxx9PIGLn5I/9crSl64jXuSKj+0o+G
WfVG4YGGe5fGDcN+VNPIUZ3fA3CiDe/PdKEtBg4XTY3/RKNoRYuqzU4Cf6OMoxz1pedyhFGR
YNjm5BOrtD8pacdlyxUweR+LRmmDCAZLy7k3jmaXE2jxHCyGDjbtuIBeuwOUA9e0baNlqqth
yMeSwKDZFTMXZekRvSxBCVwVCq2CpQwoYKNP9yXb2f50fhuB8qYWhuas2n3VqlTgMR1gKDeI
S0GSuEE3teVtBHRI50a1LUTl0BBl8UYNJfiUdy75RFJ2WsjAG5PJ2622SEUUo0e1O35THhHc
u7UsKjMyFufzALjm56JFb2T3iEZXUQ/MhiyDFrbzSIoRmW5TfF/tRILwmz7FVvb+2gJ6EPTX
OLHtXAC3Tx0tWW2EK6riJiSuuFX9lDzla1Sc0DyNCEMIp5ev540uxyEkCU6wMfke9ZXP2L5Q
sFAk+HKdoWhc+Ft+OF9rleTFAgBY2beN8dT5qH+kzX/2TAJkbHyh15EWXFDJp2I+AlmVpHNr
CPKc5zGwCjr5wDyiqNms8fpGpMQr6SVbZKsTkiLy4Mrr9j4EJDK9WTYsxWjo2l9uVu73gMBO
U6lXIVGdnRu2Wi6ooPsHMqczqClUmw44pCjO72yMTnXJRwDOjOAejE8Z21/IXIXYREZk4w9V
E1+v4uYpv5WwgAQKvtDKpdIBZ+zqp3uLwHcFkzbcznbEDbcuk3DzHYpNrQcozEaas/2skFKT
4Kd0m9NjrhWf/r13i9zzxVBi8XvTl/KIWT4G78y0FIwidV6xmp9giWMGU+5ioNmkevmcz38z
W1I8ENFpkfl3i79mHZ5ELJTKc4KThsV4AFdjK9qxUWggHKbeVWZwIlfd7ooLySSGXB+v5j3w
FwbHe8TY3SbkHJ7zqzySFQnzYZUlF0oHubWd4TV44kPV0afyVJ/RO6CLPpLRyiH40tOlmpKU
4JGD+hOCj0VMZsZI290OiNz/jf1a8j+i7IXYuP0SnYc70qMiejlTe7Ejf6/GEuoLvyXhHnbE
CmASPA2pS2lAj8MMwLMvs4SLWPIfiak5kOwSutekpgIpTDgZpa0tc9wTPJoQckIgTIKsC95g
3dFeK98na9dMThEQe1RYElehSBvGrfv61TQ+eJckexLp/XKP4FD7bJl1IDnHDezrGviKwcJg
DYHsLNOE52O1VZXaUBKW7bb7FGJFKXHTBkJ3JPM8tvktQU8XvcmgUci0wq9ERLcuAOr0ycvb
kKdx4PvACZcMw4NKSwCQDfmDB5CmnrAy5EqL/TOPcRnB1kDVxTUhOcbnuN9jG77utUkiVgpl
e3fImDhdBkf+EAQAS9pbq/CFAKEAAayeA5aiGT6BzNCxxGf7AgAAAAAEWVo=

--m51xatjYGsM+13rf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=kernel_selftests
Content-Transfer-Encoding: quoted-printable

KERNEL SELFTESTS: linux_headers_dir is /usr/src/linux-headers-x86_64-rhel-7=
=2E6-475bfb4b00bc0f91400ac501f7edf16b595cd61b
2019-10-25 16:32:04 make run_tests -C capabilities
make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b0=
0bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/capabilities'
gcc -O2 -g -std=3Dgnu99 -Wall    test_execve.c -lcap-ng -lrt -ldl -o /usr/s=
rc/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf16b595cd61b/=
tools/testing/selftests/capabilities/test_execve
gcc -O2 -g -std=3Dgnu99 -Wall    validate_cap.c -lcap-ng -lrt -ldl -o /usr/=
src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf16b595cd61b=
/tools/testing/selftests/capabilities/validate_cap
TAP version 13
1..1
# selftests: capabilities: test_execve
# # validate_cap:: Capabilities after execve were correct
# # validate_cap:: Capabilities after execve were correct
# # validate_cap:: Capabilities after execve were correct
# # validate_cap:: Capabilities after execve were correct
# # validate_cap:: Capabilities after execve were correct
# # validate_cap:: Capabilities after execve were correct
# # validate_cap:: Capabilities after execve were correct
# # validate_cap:: Capabilities after execve were correct
# TAP version 13
# 1..12
# # [RUN]	+++ Tests with uid =3D=3D 0 +++
# # [NOTE]	Using global UIDs for tests
# # [RUN]	Root =3D> ep
# ok 1 Passed
# # Check cap_ambient manipulation rules
# ok 2 PR_CAP_AMBIENT_RAISE failed on non-inheritable cap
# ok 3 PR_CAP_AMBIENT_RAISE failed on non-permitted cap
# ok 4 PR_CAP_AMBIENT_RAISE worked
# ok 5 Basic manipulation appears to work
# # [RUN]	Root +i =3D> eip
# ok 6 Passed
# # [RUN]	UID 0 +ia =3D> eipa
# ok 7 Passed
# # [RUN]	Root +ia, suidroot =3D> eipa
# ok 8 Passed
# # [RUN]	Root +ia, suidnonroot =3D> ip
# ok 9 Passed
# # [RUN]	Root +ia, sgidroot =3D> eipa
# ok 10 Passed
# ok 11 Passed
# # [RUN]	Root +ia, sgidnonroot =3D> eip
# ok 12 Passed
# # Pass 12 Fail 0 Xfail 0 Xpass 0 Skip 0 Error 0
# # validate_cap:: Capabilities after execve were correct
# # validate_cap:: Capabilities after execve were correct
# # validate_cap:: Capabilities after execve were correct
# # validate_cap:: Capabilities after execve were correct
# # validate_cap:: Capabilities after execve were correct
# # =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
# TAP version 13
# 1..9
# # [RUN]	+++ Tests with uid !=3D 0 +++
# # [NOTE]	Using global UIDs for tests
# # [RUN]	Non-root =3D> no caps
# ok 1 Passed
# # Check cap_ambient manipulation rules
# ok 2 PR_CAP_AMBIENT_RAISE failed on non-inheritable cap
# ok 3 PR_CAP_AMBIENT_RAISE failed on non-permitted cap
# ok 4 PR_CAP_AMBIENT_RAISE worked
# ok 5 Basic manipulation appears to work
# # [RUN]	Non-root +i =3D> i
# ok 6 Passed
# # [RUN]	UID 1 +ia =3D> eipa
# ok 7 Passed
# # [RUN]	Non-root +ia, sgidnonroot =3D> i
# ok 8 Passed
# ok 9 Passed
# # Pass 9 Fail 0 Xfail 0 Xpass 0 Skip 0 Error 0
# # =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
ok 1 selftests: capabilities: test_execve
make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00=
bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/capabilities'
ignored_by_lkp cgroup test
2019-10-25 16:32:05 make run_tests -C cpu-hotplug
make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b0=
0bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/cpu-hotplug'
TAP version 13
1..1
# selftests: cpu-hotplug: cpu-on-off-test.sh
# pid 1512's current affinity mask: 3
# pid 1512's new affinity mask: 1
# CPU online/offline summary:
# present_cpus =3D 0-1 present_max =3D 1
# 	 Cpus in online state: 0-1
# 	 Cpus in offline state: 0
# Limited scope test: one hotplug cpu
# 	 (leaves cpu in the original state):
# 	 online to offline to online: cpu 1
ok 1 selftests: cpu-hotplug: cpu-on-off-test.sh
make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00=
bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/cpu-hotplug'
2019-10-25 16:32:05 make run_tests -C cpufreq
make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b0=
0bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/cpufreq'
TAP version 13
1..1
# selftests: cpufreq: main.sh
# pid 1579's current affinity mask: 3
# pid 1579's new affinity mask: 1
not ok 1 selftests: cpufreq: main.sh # exit=3D2
make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00=
bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/cpufreq'
dmabuf-heaps test: not in Makefile
2019-10-25 16:32:06 make TARGETS=3Ddmabuf-heaps
make --no-builtin-rules ARCH=3Dx86 -C ../../.. headers_install
make[1]: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb=
4b00bc0f91400ac501f7edf16b595cd61b'
  HOSTCC  scripts/basic/fixdep
  HOSTCC  scripts/unifdef
  WRAP    arch/x86/include/generated/uapi/asm/bpf_perf_event.h
  WRAP    arch/x86/include/generated/uapi/asm/errno.h
  WRAP    arch/x86/include/generated/uapi/asm/fcntl.h
  WRAP    arch/x86/include/generated/uapi/asm/ioctl.h
  WRAP    arch/x86/include/generated/uapi/asm/ioctls.h
  WRAP    arch/x86/include/generated/uapi/asm/ipcbuf.h
  WRAP    arch/x86/include/generated/uapi/asm/param.h
  WRAP    arch/x86/include/generated/uapi/asm/poll.h
  WRAP    arch/x86/include/generated/uapi/asm/resource.h
  WRAP    arch/x86/include/generated/uapi/asm/socket.h
  WRAP    arch/x86/include/generated/uapi/asm/sockios.h
  WRAP    arch/x86/include/generated/uapi/asm/termbits.h
  WRAP    arch/x86/include/generated/uapi/asm/termios.h
  WRAP    arch/x86/include/generated/uapi/asm/types.h
  SYSTBL  arch/x86/include/generated/asm/syscalls_32.h
  SYSHDR  arch/x86/include/generated/uapi/asm/unistd_32.h
  SYSHDR  arch/x86/include/generated/uapi/asm/unistd_64.h
  SYSHDR  arch/x86/include/generated/uapi/asm/unistd_x32.h
  HOSTCC  arch/x86/tools/relocs_32.o
  HOSTCC  arch/x86/tools/relocs_64.o
  HOSTCC  arch/x86/tools/relocs_common.o
  HOSTLD  arch/x86/tools/relocs
  UPD     include/generated/uapi/linux/version.h
  HDRINST usr/include/video/edid.h
  HDRINST usr/include/video/sisfb.h
  HDRINST usr/include/video/uvesafb.h
  HDRINST usr/include/drm/armada_drm.h
  HDRINST usr/include/drm/drm_sarea.h
  HDRINST usr/include/drm/exynos_drm.h
  HDRINST usr/include/drm/i810_drm.h
  HDRINST usr/include/drm/mga_drm.h
  HDRINST usr/include/drm/qxl_drm.h
  HDRINST usr/include/drm/r128_drm.h
  HDRINST usr/include/drm/radeon_drm.h
  HDRINST usr/include/drm/savage_drm.h
  HDRINST usr/include/drm/sis_drm.h
  HDRINST usr/include/drm/tegra_drm.h
  HDRINST usr/include/drm/vc4_drm.h
  HDRINST usr/include/drm/vgem_drm.h
  HDRINST usr/include/drm/via_drm.h
  HDRINST usr/include/drm/vmwgfx_drm.h
  HDRINST usr/include/drm/omap_drm.h
  HDRINST usr/include/drm/drm.h
  HDRINST usr/include/drm/drm_fourcc.h
  HDRINST usr/include/drm/drm_mode.h
  HDRINST usr/include/drm/etnaviv_drm.h
  HDRINST usr/include/drm/i915_drm.h
  HDRINST usr/include/drm/lima_drm.h
  HDRINST usr/include/drm/msm_drm.h
  HDRINST usr/include/drm/nouveau_drm.h
  HDRINST usr/include/drm/panfrost_drm.h
  HDRINST usr/include/drm/v3d_drm.h
  HDRINST usr/include/drm/virtgpu_drm.h
  HDRINST usr/include/drm/amdgpu_drm.h
  HDRINST usr/include/mtd/inftl-user.h
  HDRINST usr/include/mtd/mtd-user.h
  HDRINST usr/include/mtd/nftl-user.h
  HDRINST usr/include/mtd/mtd-abi.h
  HDRINST usr/include/mtd/ubi-user.h
  HDRINST usr/include/xen/evtchn.h
  HDRINST usr/include/xen/gntalloc.h
  HDRINST usr/include/xen/gntdev.h
  HDRINST usr/include/xen/privcmd.h
  HDRINST usr/include/asm-generic/auxvec.h
  HDRINST usr/include/asm-generic/bitsperlong.h
  HDRINST usr/include/asm-generic/bpf_perf_event.h
  HDRINST usr/include/asm-generic/errno-base.h
  HDRINST usr/include/asm-generic/errno.h
  HDRINST usr/include/asm-generic/fcntl.h
  HDRINST usr/include/asm-generic/int-l64.h
  HDRINST usr/include/asm-generic/int-ll64.h
  HDRINST usr/include/asm-generic/ioctl.h
  HDRINST usr/include/asm-generic/ipcbuf.h
  HDRINST usr/include/asm-generic/kvm_para.h
  HDRINST usr/include/asm-generic/msgbuf.h
  HDRINST usr/include/asm-generic/param.h
  HDRINST usr/include/asm-generic/poll.h
  HDRINST usr/include/asm-generic/posix_types.h
  HDRINST usr/include/asm-generic/resource.h
  HDRINST usr/include/asm-generic/sembuf.h
  HDRINST usr/include/asm-generic/setup.h
  HDRINST usr/include/asm-generic/shmbuf.h
  HDRINST usr/include/asm-generic/signal-defs.h
  HDRINST usr/include/asm-generic/signal.h
  HDRINST usr/include/asm-generic/stat.h
  HDRINST usr/include/asm-generic/statfs.h
  HDRINST usr/include/asm-generic/swab.h
  HDRINST usr/include/asm-generic/termbits.h
  HDRINST usr/include/asm-generic/termios.h
  HDRINST usr/include/asm-generic/types.h
  HDRINST usr/include/asm-generic/ucontext.h
  HDRINST usr/include/asm-generic/hugetlb_encode.h
  HDRINST usr/include/asm-generic/ioctls.h
  HDRINST usr/include/asm-generic/mman-common.h
  HDRINST usr/include/asm-generic/mman.h
  HDRINST usr/include/asm-generic/siginfo.h
  HDRINST usr/include/asm-generic/socket.h
  HDRINST usr/include/asm-generic/sockios.h
  HDRINST usr/include/asm-generic/unistd.h
  HDRINST usr/include/rdma/cxgb4-abi.h
  HDRINST usr/include/rdma/hfi/hfi1_ioctl.h
  HDRINST usr/include/rdma/hfi/hfi1_user.h
  HDRINST usr/include/rdma/i40iw-abi.h
  HDRINST usr/include/rdma/ib_user_mad.h
  HDRINST usr/include/rdma/ib_user_sa.h
  HDRINST usr/include/rdma/mlx4-abi.h
  HDRINST usr/include/rdma/mthca-abi.h
  HDRINST usr/include/rdma/nes-abi.h
  HDRINST usr/include/rdma/ocrdma-abi.h
  HDRINST usr/include/rdma/qedr-abi.h
  HDRINST usr/include/rdma/rdma_user_ioctl.h
  HDRINST usr/include/rdma/cxgb3-abi.h
  HDRINST usr/include/rdma/bnxt_re-abi.h
  HDRINST usr/include/rdma/efa-abi.h
  HDRINST usr/include/rdma/hns-abi.h
  HDRINST usr/include/rdma/ib_user_ioctl_cmds.h
  HDRINST usr/include/rdma/ib_user_ioctl_verbs.h
  HDRINST usr/include/rdma/ib_user_verbs.h
  HDRINST usr/include/rdma/mlx5-abi.h
  HDRINST usr/include/rdma/mlx5_user_ioctl_cmds.h
  HDRINST usr/include/rdma/mlx5_user_ioctl_verbs.h
  HDRINST usr/include/rdma/rdma_netlink.h
  HDRINST usr/include/rdma/rdma_user_cm.h
  HDRINST usr/include/rdma/rdma_user_ioctl_cmds.h
  HDRINST usr/include/rdma/rdma_user_rxe.h
  HDRINST usr/include/rdma/rvt-abi.h
  HDRINST usr/include/rdma/siw-abi.h
  HDRINST usr/include/rdma/vmw_pvrdma-abi.h
  HDRINST usr/include/misc/cxl.h
  HDRINST usr/include/misc/fastrpc.h
  HDRINST usr/include/misc/habanalabs.h
  HDRINST usr/include/misc/ocxl.h
  HDRINST usr/include/misc/xilinx_sdfec.h
  HDRINST usr/include/linux/a.out.h
  HDRINST usr/include/linux/acct.h
  HDRINST usr/include/linux/adb.h
  HDRINST usr/include/linux/affs_hardblocks.h
  HDRINST usr/include/linux/agpgart.h
  HDRINST usr/include/linux/am437x-vpfe.h
  HDRINST usr/include/linux/android/binder.h
  HDRINST usr/include/linux/android/binderfs.h
  HDRINST usr/include/linux/apm_bios.h
  HDRINST usr/include/linux/arcfb.h
  HDRINST usr/include/linux/arm_sdei.h
  HDRINST usr/include/linux/aspeed-lpc-ctrl.h
  HDRINST usr/include/linux/atalk.h
  HDRINST usr/include/linux/atm.h
  HDRINST usr/include/linux/atm_eni.h
  HDRINST usr/include/linux/atm_he.h
  HDRINST usr/include/linux/atm_idt77105.h
  HDRINST usr/include/linux/atm_nicstar.h
  HDRINST usr/include/linux/atm_tcp.h
  HDRINST usr/include/linux/atm_zatm.h
  HDRINST usr/include/linux/atmapi.h
  HDRINST usr/include/linux/atmarp.h
  HDRINST usr/include/linux/atmbr2684.h
  HDRINST usr/include/linux/atmclip.h
  HDRINST usr/include/linux/atmdev.h
  HDRINST usr/include/linux/atmioc.h
  HDRINST usr/include/linux/atmlec.h
  HDRINST usr/include/linux/atmmpc.h
  HDRINST usr/include/linux/atmppp.h
  HDRINST usr/include/linux/atmsap.h
  HDRINST usr/include/linux/atmsvc.h
  HDRINST usr/include/linux/auto_dev-ioctl.h
  HDRINST usr/include/linux/auto_fs4.h
  HDRINST usr/include/linux/auxvec.h
  HDRINST usr/include/linux/ax25.h
  HDRINST usr/include/linux/b1lli.h
  HDRINST usr/include/linux/baycom.h
  HDRINST usr/include/linux/bcache.h
  HDRINST usr/include/linux/bcm933xx_hcs.h
  HDRINST usr/include/linux/blkpg.h
  HDRINST usr/include/linux/blktrace_api.h
  HDRINST usr/include/linux/bpf_common.h
  HDRINST usr/include/linux/bpf_perf_event.h
  HDRINST usr/include/linux/bpqether.h
  HDRINST usr/include/linux/bsg.h
  HDRINST usr/include/linux/bt-bmc.h
  HDRINST usr/include/linux/byteorder/big_endian.h
  HDRINST usr/include/linux/byteorder/little_endian.h
  HDRINST usr/include/linux/caif/caif_socket.h
  HDRINST usr/include/linux/caif/if_caif.h
  HDRINST usr/include/linux/can/bcm.h
  HDRINST usr/include/linux/can/error.h
  HDRINST usr/include/linux/can/raw.h
  HDRINST usr/include/linux/can/vxcan.h
  HDRINST usr/include/linux/can/gw.h
  HDRINST usr/include/linux/can/j1939.h
  HDRINST usr/include/linux/can/netlink.h
  HDRINST usr/include/linux/capability.h
  HDRINST usr/include/linux/capi.h
  HDRINST usr/include/linux/cciss_defs.h
  HDRINST usr/include/linux/cciss_ioctl.h
  HDRINST usr/include/linux/cdrom.h
  HDRINST usr/include/linux/cgroupstats.h
  HDRINST usr/include/linux/cifs/cifs_mount.h
  HDRINST usr/include/linux/cm4000_cs.h
  HDRINST usr/include/linux/cn_proc.h
  HDRINST usr/include/linux/connector.h
  HDRINST usr/include/linux/const.h
  HDRINST usr/include/linux/coresight-stm.h
  HDRINST usr/include/linux/cramfs_fs.h
  HDRINST usr/include/linux/cuda.h
  HDRINST usr/include/linux/cyclades.h
  HDRINST usr/include/linux/cycx_cfm.h
  HDRINST usr/include/linux/dcbnl.h
  HDRINST usr/include/linux/dccp.h
  HDRINST usr/include/linux/dlm.h
  HDRINST usr/include/linux/dlm_device.h
  HDRINST usr/include/linux/dlm_netlink.h
  HDRINST usr/include/linux/dlm_plock.h
  HDRINST usr/include/linux/dlmconstants.h
  HDRINST usr/include/linux/dm-log-userspace.h
  HDRINST usr/include/linux/dn.h
  HDRINST usr/include/linux/dqblk_xfs.h
  HDRINST usr/include/linux/dvb/ca.h
  HDRINST usr/include/linux/dvb/dmx.h
  HDRINST usr/include/linux/dvb/frontend.h
  HDRINST usr/include/linux/dvb/net.h
  HDRINST usr/include/linux/dvb/version.h
  HDRINST usr/include/linux/dvb/audio.h
  HDRINST usr/include/linux/dvb/osd.h
  HDRINST usr/include/linux/dvb/video.h
  HDRINST usr/include/linux/edd.h
  HDRINST usr/include/linux/efs_fs_sb.h
  HDRINST usr/include/linux/elf-fdpic.h
  HDRINST usr/include/linux/elfcore.h
  HDRINST usr/include/linux/errno.h
  HDRINST usr/include/linux/erspan.h
  HDRINST usr/include/linux/eventpoll.h
  HDRINST usr/include/linux/fadvise.h
  HDRINST usr/include/linux/falloc.h
  HDRINST usr/include/linux/fd.h
  HDRINST usr/include/linux/fdreg.h
  HDRINST usr/include/linux/fib_rules.h
  HDRINST usr/include/linux/fiemap.h
  HDRINST usr/include/linux/filter.h
  HDRINST usr/include/linux/firewire-constants.h
  HDRINST usr/include/linux/fsi.h
  HDRINST usr/include/linux/fsl_hypervisor.h
  HDRINST usr/include/linux/fsmap.h
  HDRINST usr/include/linux/futex.h
  HDRINST usr/include/linux/gameport.h
  HDRINST usr/include/linux/genetlink.h
  HDRINST usr/include/linux/genwqe/genwqe_card.h
  HDRINST usr/include/linux/gfs2_ondisk.h
  HDRINST usr/include/linux/gigaset_dev.h
  HDRINST usr/include/linux/gtp.h
  HDRINST usr/include/linux/hdlc.h
  HDRINST usr/include/linux/hdlc/ioctl.h
  HDRINST usr/include/linux/hdlcdrv.h
  HDRINST usr/include/linux/hdreg.h
  HDRINST usr/include/linux/hid.h
  HDRINST usr/include/linux/hiddev.h
  HDRINST usr/include/linux/hidraw.h
  HDRINST usr/include/linux/hpet.h
  HDRINST usr/include/linux/hsi/cs-protocol.h
  HDRINST usr/include/linux/hsi/hsi_char.h
  HDRINST usr/include/linux/hsr_netlink.h
  HDRINST usr/include/linux/hw_breakpoint.h
  HDRINST usr/include/linux/hyperv.h
  HDRINST usr/include/linux/hysdn_if.h
  HDRINST usr/include/linux/i2c-dev.h
  HDRINST usr/include/linux/i2c.h
  HDRINST usr/include/linux/i2o-dev.h
  HDRINST usr/include/linux/i8k.h
  HDRINST usr/include/linux/icmp.h
  HDRINST usr/include/linux/if_addrlabel.h
  HDRINST usr/include/linux/if_alg.h
  HDRINST usr/include/linux/if_arcnet.h
  HDRINST usr/include/linux/if_cablemodem.h
  HDRINST usr/include/linux/if_eql.h
  HDRINST usr/include/linux/if_fc.h
  HDRINST usr/include/linux/if_frad.h
  HDRINST usr/include/linux/if_hippi.h
  HDRINST usr/include/linux/if_infiniband.h
  HDRINST usr/include/linux/if_ltalk.h
  HDRINST usr/include/linux/if_macsec.h
  HDRINST usr/include/linux/if_phonet.h
  HDRINST usr/include/linux/if_plip.h
  HDRINST usr/include/linux/if_ppp.h
  HDRINST usr/include/linux/if_pppol2tp.h
  HDRINST usr/include/linux/if_pppox.h
  HDRINST usr/include/linux/if_slip.h
  HDRINST usr/include/linux/if_team.h
  HDRINST usr/include/linux/if_x25.h
  HDRINST usr/include/linux/ife.h
  HDRINST usr/include/linux/iio/events.h
  HDRINST usr/include/linux/iio/types.h
  HDRINST usr/include/linux/ila.h
  HDRINST usr/include/linux/in_route.h
  HDRINST usr/include/linux/inotify.h
  HDRINST usr/include/linux/ioctl.h
  HDRINST usr/include/linux/ip.h
  HDRINST usr/include/linux/ip6_tunnel.h
  HDRINST usr/include/linux/ipc.h
  HDRINST usr/include/linux/ipmi.h
  HDRINST usr/include/linux/ipmi_msgdefs.h
  HDRINST usr/include/linux/ipsec.h
  HDRINST usr/include/linux/ipv6_route.h
  HDRINST usr/include/linux/ipx.h
  HDRINST usr/include/linux/irqnr.h
  HDRINST usr/include/linux/isdn/capicmd.h
  HDRINST usr/include/linux/iso_fs.h
  HDRINST usr/include/linux/ivtv.h
  HDRINST usr/include/linux/ivtvfb.h
  HDRINST usr/include/linux/joystick.h
  HDRINST usr/include/linux/kcm.h
  HDRINST usr/include/linux/kcmp.h
  HDRINST usr/include/linux/kcov.h
  HDRINST usr/include/linux/kd.h
  HDRINST usr/include/linux/kdev_t.h
  HDRINST usr/include/linux/kernel.h
  HDRINST usr/include/linux/kernelcapi.h
  HDRINST usr/include/linux/keyboard.h
  HDRINST usr/include/linux/l2tp.h
  HDRINST usr/include/linux/lightnvm.h
  HDRINST usr/include/linux/llc.h
  HDRINST usr/include/linux/loop.h
  HDRINST usr/include/linux/lp.h
  HDRINST usr/include/linux/lwtunnel.h
  HDRINST usr/include/linux/major.h
  HDRINST usr/include/linux/map_to_7segment.h
  HDRINST usr/include/linux/matroxfb.h
  HDRINST usr/include/linux/max2175.h
  HDRINST usr/include/linux/membarrier.h
  HDRINST usr/include/linux/mempolicy.h
  HDRINST usr/include/linux/meye.h
  HDRINST usr/include/linux/mic_common.h
  HDRINST usr/include/linux/mic_ioctl.h
  HDRINST usr/include/linux/minix_fs.h
  HDRINST usr/include/linux/mmc/ioctl.h
  HDRINST usr/include/linux/mmtimer.h
  HDRINST usr/include/linux/module.h
  HDRINST usr/include/linux/mpls.h
  HDRINST usr/include/linux/mpls_iptunnel.h
  HDRINST usr/include/linux/mqueue.h
  HDRINST usr/include/linux/msg.h
  HDRINST usr/include/linux/mtio.h
  HDRINST usr/include/linux/n_r3964.h
  HDRINST usr/include/linux/nbd-netlink.h
  HDRINST usr/include/linux/nbd.h
  HDRINST usr/include/linux/net.h
  HDRINST usr/include/linux/netconf.h
  HDRINST usr/include/linux/netdevice.h
  HDRINST usr/include/linux/netfilter/ipset/ip_set_bitmap.h
  HDRINST usr/include/linux/netfilter/ipset/ip_set_hash.h
  HDRINST usr/include/linux/netfilter/ipset/ip_set_list.h
  HDRINST usr/include/linux/netfilter/ipset/ip_set.h
  HDRINST usr/include/linux/netfilter/nf_conntrack_common.h
  HDRINST usr/include/linux/netfilter/nf_conntrack_ftp.h
  HDRINST usr/include/linux/netfilter/nf_conntrack_sctp.h
  HDRINST usr/include/linux/netfilter/nf_conntrack_tcp.h
  HDRINST usr/include/linux/netfilter/nf_conntrack_tuple_common.h
  HDRINST usr/include/linux/netfilter/nf_log.h
  HDRINST usr/include/linux/netfilter/nf_nat.h
  HDRINST usr/include/linux/netfilter/nf_tables_compat.h
  HDRINST usr/include/linux/netfilter/nfnetlink.h
  HDRINST usr/include/linux/netfilter/nfnetlink_acct.h
  HDRINST usr/include/linux/netfilter/nfnetlink_compat.h
  HDRINST usr/include/linux/netfilter/nfnetlink_conntrack.h
  HDRINST usr/include/linux/netfilter/nfnetlink_cthelper.h
  HDRINST usr/include/linux/netfilter/nfnetlink_cttimeout.h
  HDRINST usr/include/linux/netfilter/nfnetlink_osf.h
  HDRINST usr/include/linux/netfilter/nfnetlink_queue.h
  HDRINST usr/include/linux/netfilter/x_tables.h
  HDRINST usr/include/linux/netfilter/xt_AUDIT.h
  HDRINST usr/include/linux/netfilter/xt_CHECKSUM.h
  HDRINST usr/include/linux/netfilter/xt_CLASSIFY.h
  HDRINST usr/include/linux/netfilter/xt_CONNMARK.h
  HDRINST usr/include/linux/netfilter/xt_CONNSECMARK.h
  HDRINST usr/include/linux/netfilter/xt_CT.h
  HDRINST usr/include/linux/netfilter/xt_DSCP.h
  HDRINST usr/include/linux/netfilter/xt_HMARK.h
  HDRINST usr/include/linux/netfilter/xt_IDLETIMER.h
  HDRINST usr/include/linux/netfilter/xt_LED.h
  HDRINST usr/include/linux/netfilter/xt_LOG.h
  HDRINST usr/include/linux/netfilter/xt_MARK.h
  HDRINST usr/include/linux/netfilter/xt_NFLOG.h
  HDRINST usr/include/linux/netfilter/xt_NFQUEUE.h
  HDRINST usr/include/linux/netfilter/xt_RATEEST.h
  HDRINST usr/include/linux/netfilter/xt_SECMARK.h
  HDRINST usr/include/linux/netfilter/xt_TCPMSS.h
  HDRINST usr/include/linux/netfilter/xt_TCPOPTSTRIP.h
  HDRINST usr/include/linux/netfilter/xt_TEE.h
  HDRINST usr/include/linux/netfilter/xt_TPROXY.h
  HDRINST usr/include/linux/netfilter/xt_addrtype.h
  HDRINST usr/include/linux/netfilter/xt_bpf.h
  HDRINST usr/include/linux/netfilter/xt_cluster.h
  HDRINST usr/include/linux/netfilter/xt_comment.h
  HDRINST usr/include/linux/netfilter/xt_connbytes.h
  HDRINST usr/include/linux/netfilter/xt_connlimit.h
  HDRINST usr/include/linux/netfilter/xt_connmark.h
  HDRINST usr/include/linux/netfilter/xt_conntrack.h
  HDRINST usr/include/linux/netfilter/xt_cpu.h
  HDRINST usr/include/linux/netfilter/xt_dccp.h
  HDRINST usr/include/linux/netfilter/xt_devgroup.h
  HDRINST usr/include/linux/netfilter/xt_dscp.h
  HDRINST usr/include/linux/netfilter/xt_ecn.h
  HDRINST usr/include/linux/netfilter/xt_esp.h
  HDRINST usr/include/linux/netfilter/xt_hashlimit.h
  HDRINST usr/include/linux/netfilter/xt_helper.h
  HDRINST usr/include/linux/netfilter/xt_ipcomp.h
  HDRINST usr/include/linux/netfilter/xt_iprange.h
  HDRINST usr/include/linux/netfilter/xt_ipvs.h
  HDRINST usr/include/linux/netfilter/xt_l2tp.h
  HDRINST usr/include/linux/netfilter/xt_length.h
  HDRINST usr/include/linux/netfilter/xt_limit.h
  HDRINST usr/include/linux/netfilter/xt_mac.h
  HDRINST usr/include/linux/netfilter/xt_mark.h
  HDRINST usr/include/linux/netfilter/xt_multiport.h
  HDRINST usr/include/linux/netfilter/xt_osf.h
  HDRINST usr/include/linux/netfilter/xt_physdev.h
  HDRINST usr/include/linux/netfilter/xt_pkttype.h
  HDRINST usr/include/linux/netfilter/xt_quota.h
  HDRINST usr/include/linux/netfilter/xt_rateest.h
  HDRINST usr/include/linux/netfilter/xt_realm.h
  HDRINST usr/include/linux/netfilter/xt_recent.h
  HDRINST usr/include/linux/netfilter/xt_rpfilter.h
  HDRINST usr/include/linux/netfilter/xt_sctp.h
  HDRINST usr/include/linux/netfilter/xt_set.h
  HDRINST usr/include/linux/netfilter/xt_socket.h
  HDRINST usr/include/linux/netfilter/xt_state.h
  HDRINST usr/include/linux/netfilter/xt_statistic.h
  HDRINST usr/include/linux/netfilter/xt_string.h
  HDRINST usr/include/linux/netfilter/xt_tcpmss.h
  HDRINST usr/include/linux/netfilter/xt_tcpudp.h
  HDRINST usr/include/linux/netfilter/xt_time.h
  HDRINST usr/include/linux/netfilter/xt_u32.h
  HDRINST usr/include/linux/netfilter/nf_synproxy.h
  HDRINST usr/include/linux/netfilter/nf_tables.h
  HDRINST usr/include/linux/netfilter/nfnetlink_log.h
  HDRINST usr/include/linux/netfilter/xt_SYNPROXY.h
  HDRINST usr/include/linux/netfilter/xt_cgroup.h
  HDRINST usr/include/linux/netfilter/xt_connlabel.h
  HDRINST usr/include/linux/netfilter/xt_nfacct.h
  HDRINST usr/include/linux/netfilter/xt_owner.h
  HDRINST usr/include/linux/netfilter/xt_policy.h
  HDRINST usr/include/linux/netfilter_arp.h
  HDRINST usr/include/linux/netfilter_arp/arpt_mangle.h
  HDRINST usr/include/linux/netfilter_arp/arp_tables.h
  HDRINST usr/include/linux/netfilter_bridge/ebt_802_3.h
  HDRINST usr/include/linux/netfilter_bridge/ebt_among.h
  HDRINST usr/include/linux/netfilter_bridge/ebt_arp.h
  HDRINST usr/include/linux/netfilter_bridge/ebt_arpreply.h
  HDRINST usr/include/linux/netfilter_bridge/ebt_ip.h
  HDRINST usr/include/linux/netfilter_bridge/ebt_ip6.h
  HDRINST usr/include/linux/netfilter_bridge/ebt_limit.h
  HDRINST usr/include/linux/netfilter_bridge/ebt_log.h
  HDRINST usr/include/linux/netfilter_bridge/ebt_mark_m.h
  HDRINST usr/include/linux/netfilter_bridge/ebt_mark_t.h
  HDRINST usr/include/linux/netfilter_bridge/ebt_nat.h
  HDRINST usr/include/linux/netfilter_bridge/ebt_nflog.h
  HDRINST usr/include/linux/netfilter_bridge/ebt_pkttype.h
  HDRINST usr/include/linux/netfilter_bridge/ebt_redirect.h
  HDRINST usr/include/linux/netfilter_bridge/ebt_stp.h
  HDRINST usr/include/linux/netfilter_bridge/ebt_vlan.h
  HDRINST usr/include/linux/netfilter_bridge/ebtables.h
  HDRINST usr/include/linux/netfilter_ipv4/ipt_CLUSTERIP.h
  HDRINST usr/include/linux/netfilter_ipv4/ipt_ECN.h
  HDRINST usr/include/linux/netfilter_ipv4/ipt_REJECT.h
  HDRINST usr/include/linux/netfilter_ipv4/ipt_TTL.h
  HDRINST usr/include/linux/netfilter_ipv4/ipt_ah.h
  HDRINST usr/include/linux/netfilter_ipv4/ipt_ecn.h
  HDRINST usr/include/linux/netfilter_ipv4/ipt_ttl.h
  HDRINST usr/include/linux/netfilter_ipv4/ip_tables.h
  HDRINST usr/include/linux/netfilter_ipv4/ipt_LOG.h
  HDRINST usr/include/linux/netfilter_ipv6/ip6t_HL.h
  HDRINST usr/include/linux/netfilter_ipv6/ip6t_NPT.h
  HDRINST usr/include/linux/netfilter_ipv6/ip6t_REJECT.h
  HDRINST usr/include/linux/netfilter_ipv6/ip6t_ah.h
  HDRINST usr/include/linux/netfilter_ipv6/ip6t_frag.h
  HDRINST usr/include/linux/netfilter_ipv6/ip6t_hl.h
  HDRINST usr/include/linux/netfilter_ipv6/ip6t_ipv6header.h
  HDRINST usr/include/linux/netfilter_ipv6/ip6t_mh.h
  HDRINST usr/include/linux/netfilter_ipv6/ip6t_opts.h
  HDRINST usr/include/linux/netfilter_ipv6/ip6t_rt.h
  HDRINST usr/include/linux/netfilter_ipv6/ip6t_srh.h
  HDRINST usr/include/linux/netfilter_ipv6/ip6_tables.h
  HDRINST usr/include/linux/netfilter_ipv6/ip6t_LOG.h
  HDRINST usr/include/linux/netlink_diag.h
  HDRINST usr/include/linux/netrom.h
  HDRINST usr/include/linux/nfc.h
  HDRINST usr/include/linux/nfs.h
  HDRINST usr/include/linux/nfs2.h
  HDRINST usr/include/linux/nfs3.h
  HDRINST usr/include/linux/nfs4.h
  HDRINST usr/include/linux/nfs4_mount.h
  HDRINST usr/include/linux/nfs_fs.h
  HDRINST usr/include/linux/nfs_idmap.h
  HDRINST usr/include/linux/nfsacl.h
  HDRINST usr/include/linux/nfsd/debug.h
  HDRINST usr/include/linux/nfsd/export.h
  HDRINST usr/include/linux/nfsd/nfsfh.h
  HDRINST usr/include/linux/nfsd/stats.h
  HDRINST usr/include/linux/nfsd/cld.h
  HDRINST usr/include/linux/nilfs2_api.h
  HDRINST usr/include/linux/nsfs.h
  HDRINST usr/include/linux/nubus.h
  HDRINST usr/include/linux/nvram.h
  HDRINST usr/include/linux/omap3isp.h
  HDRINST usr/include/linux/omapfb.h
  HDRINST usr/include/linux/oom.h
  HDRINST usr/include/linux/packet_diag.h
  HDRINST usr/include/linux/param.h
  HDRINST usr/include/linux/parport.h
  HDRINST usr/include/linux/patchkey.h
  HDRINST usr/include/linux/pci.h
  HDRINST usr/include/linux/pcitest.h
  HDRINST usr/include/linux/personality.h
  HDRINST usr/include/linux/pfkeyv2.h
  HDRINST usr/include/linux/phantom.h
  HDRINST usr/include/linux/phonet.h
  HDRINST usr/include/linux/pktcdvd.h
  HDRINST usr/include/linux/poll.h
  HDRINST usr/include/linux/posix_acl.h
  HDRINST usr/include/linux/posix_acl_xattr.h
  HDRINST usr/include/linux/posix_types.h
  HDRINST usr/include/linux/ppp-comp.h
  HDRINST usr/include/linux/pps.h
  HDRINST usr/include/linux/pr.h
  HDRINST usr/include/linux/psample.h
  HDRINST usr/include/linux/qemu_fw_cfg.h
  HDRINST usr/include/linux/qnx4_fs.h
  HDRINST usr/include/linux/qnxtypes.h
  HDRINST usr/include/linux/qrtr.h
  HDRINST usr/include/linux/quota.h
  HDRINST usr/include/linux/radeonfb.h
  HDRINST usr/include/linux/raid/md_u.h
  HDRINST usr/include/linux/raid/md_p.h
  HDRINST usr/include/linux/random.h
  HDRINST usr/include/linux/raw.h
  HDRINST usr/include/linux/reboot.h
  HDRINST usr/include/linux/reiserfs_fs.h
  HDRINST usr/include/linux/reiserfs_xattr.h
  HDRINST usr/include/linux/resource.h
  HDRINST usr/include/linux/rfkill.h
  HDRINST usr/include/linux/rio_cm_cdev.h
  HDRINST usr/include/linux/rio_mport_cdev.h
  HDRINST usr/include/linux/romfs_fs.h
  HDRINST usr/include/linux/rose.h
  HDRINST usr/include/linux/route.h
  HDRINST usr/include/linux/rpmsg.h
  HDRINST usr/include/linux/rseq.h
  HDRINST usr/include/linux/rtc.h
  HDRINST usr/include/linux/scc.h
  HDRINST usr/include/linux/sched/types.h
  HDRINST usr/include/linux/scif_ioctl.h
  HDRINST usr/include/linux/screen_info.h
  HDRINST usr/include/linux/sdla.h
  HDRINST usr/include/linux/securebits.h
  HDRINST usr/include/linux/seg6.h
  HDRINST usr/include/linux/seg6_genl.h
  HDRINST usr/include/linux/seg6_hmac.h
  HDRINST usr/include/linux/seg6_iptunnel.h
  HDRINST usr/include/linux/seg6_local.h
  HDRINST usr/include/linux/selinux_netlink.h
  HDRINST usr/include/linux/sem.h
  HDRINST usr/include/linux/serial_reg.h
  HDRINST usr/include/linux/signal.h
  HDRINST usr/include/linux/signalfd.h
  HDRINST usr/include/linux/smc.h
  HDRINST usr/include/linux/smiapp.h
  HDRINST usr/include/linux/sock_diag.h
  HDRINST usr/include/linux/sonet.h
  HDRINST usr/include/linux/sonypi.h
  HDRINST usr/include/linux/sound.h
  HDRINST usr/include/linux/soundcard.h
  HDRINST usr/include/linux/spi/spidev.h
  HDRINST usr/include/linux/stat.h
  HDRINST usr/include/linux/stddef.h
  HDRINST usr/include/linux/stm.h
  HDRINST usr/include/linux/string.h
  HDRINST usr/include/linux/sunrpc/debug.h
  HDRINST usr/include/linux/suspend_ioctls.h
  HDRINST usr/include/linux/swab.h
  HDRINST usr/include/linux/sync_file.h
  HDRINST usr/include/linux/synclink.h
  HDRINST usr/include/linux/sysinfo.h
  HDRINST usr/include/linux/target_core_user.h
  HDRINST usr/include/linux/tc_act/tc_defact.h
  HDRINST usr/include/linux/tc_act/tc_bpf.h
  HDRINST usr/include/linux/tc_act/tc_connmark.h
  HDRINST usr/include/linux/tc_act/tc_csum.h
  HDRINST usr/include/linux/tc_act/tc_ct.h
  HDRINST usr/include/linux/tc_act/tc_ctinfo.h
  HDRINST usr/include/linux/tc_act/tc_gact.h
  HDRINST usr/include/linux/tc_act/tc_ife.h
  HDRINST usr/include/linux/tc_act/tc_ipt.h
  HDRINST usr/include/linux/tc_act/tc_mirred.h
  HDRINST usr/include/linux/tc_act/tc_mpls.h
  HDRINST usr/include/linux/tc_act/tc_nat.h
  HDRINST usr/include/linux/tc_act/tc_pedit.h
  HDRINST usr/include/linux/tc_act/tc_sample.h
  HDRINST usr/include/linux/tc_act/tc_skbedit.h
  HDRINST usr/include/linux/tc_act/tc_skbmod.h
  HDRINST usr/include/linux/tc_act/tc_tunnel_key.h
  HDRINST usr/include/linux/tc_act/tc_vlan.h
  HDRINST usr/include/linux/tc_ematch/tc_em_cmp.h
  HDRINST usr/include/linux/tc_ematch/tc_em_ipt.h
  HDRINST usr/include/linux/tc_ematch/tc_em_meta.h
  HDRINST usr/include/linux/tc_ematch/tc_em_nbyte.h
  HDRINST usr/include/linux/tc_ematch/tc_em_text.h
  HDRINST usr/include/linux/tcp_metrics.h
  HDRINST usr/include/linux/tee.h
  HDRINST usr/include/linux/termios.h
  HDRINST usr/include/linux/thermal.h
  HDRINST usr/include/linux/timerfd.h
  HDRINST usr/include/linux/times.h
  HDRINST usr/include/linux/tiocl.h
  HDRINST usr/include/linux/tipc_sockets_diag.h
  HDRINST usr/include/linux/toshiba.h
  HDRINST usr/include/linux/tty.h
  HDRINST usr/include/linux/tty_flags.h
  HDRINST usr/include/linux/types.h
  HDRINST usr/include/linux/udf_fs_i.h
  HDRINST usr/include/linux/uhid.h
  HDRINST usr/include/linux/uinput.h
  HDRINST usr/include/linux/uio.h
  HDRINST usr/include/linux/uleds.h
  HDRINST usr/include/linux/ultrasound.h
  HDRINST usr/include/linux/un.h
  HDRINST usr/include/linux/unistd.h
  HDRINST usr/include/linux/usb/cdc-wdm.h
  HDRINST usr/include/linux/usb/cdc.h
  HDRINST usr/include/linux/usb/ch11.h
  HDRINST usr/include/linux/usb/charger.h
  HDRINST usr/include/linux/usb/functionfs.h
  HDRINST usr/include/linux/usb/g_printer.h
  HDRINST usr/include/linux/usb/gadgetfs.h
  HDRINST usr/include/linux/usb/midi.h
  HDRINST usr/include/linux/usb/audio.h
  HDRINST usr/include/linux/usb/ch9.h
  HDRINST usr/include/linux/usb/g_uvc.h
  HDRINST usr/include/linux/usb/tmc.h
  HDRINST usr/include/linux/usb/video.h
  HDRINST usr/include/linux/usbip.h
  HDRINST usr/include/linux/userfaultfd.h
  HDRINST usr/include/linux/userio.h
  HDRINST usr/include/linux/utime.h
  HDRINST usr/include/linux/utsname.h
  HDRINST usr/include/linux/uuid.h
  HDRINST usr/include/linux/uvcvideo.h
  HDRINST usr/include/linux/v4l2-dv-timings.h
  HDRINST usr/include/linux/v4l2-mediabus.h
  HDRINST usr/include/linux/v4l2-subdev.h
  HDRINST usr/include/linux/vbox_err.h
  HDRINST usr/include/linux/veth.h
  HDRINST usr/include/linux/virtio_9p.h
  HDRINST usr/include/linux/virtio_console.h
  HDRINST usr/include/linux/virtio_crypto.h
  HDRINST usr/include/linux/virtio_input.h
  HDRINST usr/include/linux/virtio_mmio.h
  HDRINST usr/include/linux/virtio_net.h
  HDRINST usr/include/linux/virtio_pci.h
  HDRINST usr/include/linux/virtio_rng.h
  HDRINST usr/include/linux/virtio_scsi.h
  HDRINST usr/include/linux/virtio_types.h
  HDRINST usr/include/linux/virtio_vsock.h
  HDRINST usr/include/linux/vm_sockets.h
  HDRINST usr/include/linux/vm_sockets_diag.h
  HDRINST usr/include/linux/vsockmon.h
  HDRINST usr/include/linux/vt.h
  HDRINST usr/include/linux/vtpm_proxy.h
  HDRINST usr/include/linux/watchdog.h
  HDRINST usr/include/linux/wimax.h
  HDRINST usr/include/linux/wimax/i2400m.h
  HDRINST usr/include/linux/wireless.h
  HDRINST usr/include/linux/x25.h
  HDRINST usr/include/linux/xattr.h
  HDRINST usr/include/linux/xfrm.h
  HDRINST usr/include/linux/xilinx-v4l2-controls.h
  HDRINST usr/include/linux/zorro.h
  HDRINST usr/include/linux/zorro_ids.h
  HDRINST usr/include/linux/libc-compat.h
  HDRINST usr/include/linux/ppp-ioctl.h
  HDRINST usr/include/linux/ppp_defs.h
  HDRINST usr/include/linux/cec-funcs.h
  HDRINST usr/include/linux/chio.h
  HDRINST usr/include/linux/if.h
  HDRINST usr/include/linux/ipv6.h
  HDRINST usr/include/linux/adfs_fs.h
  HDRINST usr/include/linux/aio_abi.h
  HDRINST usr/include/linux/aspeed-p2a-ctrl.h
  HDRINST usr/include/linux/audit.h
  HDRINST usr/include/linux/auto_fs.h
  HDRINST usr/include/linux/batadv_packet.h
  HDRINST usr/include/linux/batman_adv.h
  HDRINST usr/include/linux/bfs_fs.h
  HDRINST usr/include/linux/binfmts.h
  HDRINST usr/include/linux/blkzoned.h
  HDRINST usr/include/linux/bpf.h
  HDRINST usr/include/linux/bpfilter.h
  HDRINST usr/include/linux/btf.h
  HDRINST usr/include/linux/btrfs.h
  HDRINST usr/include/linux/btrfs_tree.h
  HDRINST usr/include/linux/can.h
  HDRINST usr/include/linux/cec.h
  HDRINST usr/include/linux/coda.h
  HDRINST usr/include/linux/coff.h
  HDRINST usr/include/linux/cryptouser.h
  HDRINST usr/include/linux/devlink.h
  HDRINST usr/include/linux/dm-ioctl.h
  HDRINST usr/include/linux/dma-buf.h
  HDRINST usr/include/linux/dns_resolver.h
  HDRINST usr/include/linux/elf-em.h
  HDRINST usr/include/linux/elf.h
  HDRINST usr/include/linux/errqueue.h
  HDRINST usr/include/linux/ethtool.h
  HDRINST usr/include/linux/fanotify.h
  HDRINST usr/include/linux/fb.h
  HDRINST usr/include/linux/fcntl.h
  HDRINST usr/include/linux/firewire-cdev.h
  HDRINST usr/include/linux/fou.h
  HDRINST usr/include/linux/fpga-dfl.h
  HDRINST usr/include/linux/fs.h
  HDRINST usr/include/linux/fscrypt.h
  HDRINST usr/include/linux/fsverity.h
  HDRINST usr/include/linux/fuse.h
  HDRINST usr/include/linux/gen_stats.h
  HDRINST usr/include/linux/gpio.h
  HDRINST usr/include/linux/gsmmux.h
  HDRINST usr/include/linux/hash_info.h
  HDRINST usr/include/linux/icmpv6.h
  HDRINST usr/include/linux/if_addr.h
  HDRINST usr/include/linux/if_arp.h
  HDRINST usr/include/linux/if_bonding.h
  HDRINST usr/include/linux/if_bridge.h
  HDRINST usr/include/linux/if_ether.h
  HDRINST usr/include/linux/if_fddi.h
  HDRINST usr/include/linux/if_link.h
  HDRINST usr/include/linux/if_packet.h
  HDRINST usr/include/linux/if_tun.h
  HDRINST usr/include/linux/if_tunnel.h
  HDRINST usr/include/linux/if_vlan.h
  HDRINST usr/include/linux/if_xdp.h
  HDRINST usr/include/linux/igmp.h
  HDRINST usr/include/linux/in.h
  HDRINST usr/include/linux/in6.h
  HDRINST usr/include/linux/inet_diag.h
  HDRINST usr/include/linux/input-event-codes.h
  HDRINST usr/include/linux/input.h
  HDRINST usr/include/linux/io_uring.h
  HDRINST usr/include/linux/iommu.h
  HDRINST usr/include/linux/ip_vs.h
  HDRINST usr/include/linux/ipmi_bmc.h
  HDRINST usr/include/linux/isst_if.h
  HDRINST usr/include/linux/jffs2.h
  HDRINST usr/include/linux/kernel-page-flags.h
  HDRINST usr/include/linux/kexec.h
  HDRINST usr/include/linux/keyctl.h
  HDRINST usr/include/linux/kfd_ioctl.h
  HDRINST usr/include/linux/kvm.h
  HDRINST usr/include/linux/kvm_para.h
  HDRINST usr/include/linux/limits.h
  HDRINST usr/include/linux/lirc.h
  HDRINST usr/include/linux/magic.h
  HDRINST usr/include/linux/mdio.h
  HDRINST usr/include/linux/media-bus-format.h
  HDRINST usr/include/linux/media.h
  HDRINST usr/include/linux/mei.h
  HDRINST usr/include/linux/memfd.h
  HDRINST usr/include/linux/mii.h
  HDRINST usr/include/linux/mman.h
  HDRINST usr/include/linux/mount.h
  HDRINST usr/include/linux/mroute.h
  HDRINST usr/include/linux/mroute6.h
  HDRINST usr/include/linux/msdos_fs.h
  HDRINST usr/include/linux/ncsi.h
  HDRINST usr/include/linux/ndctl.h
  HDRINST usr/include/linux/neighbour.h
  HDRINST usr/include/linux/net_dropmon.h
  HDRINST usr/include/linux/net_namespace.h
  HDRINST usr/include/linux/net_tstamp.h
  HDRINST usr/include/linux/netfilter.h
  HDRINST usr/include/linux/netfilter_bridge.h
  HDRINST usr/include/linux/netfilter_decnet.h
  HDRINST usr/include/linux/netfilter_ipv4.h
  HDRINST usr/include/linux/netfilter_ipv6.h
  HDRINST usr/include/linux/netlink.h
  HDRINST usr/include/linux/nexthop.h
  HDRINST usr/include/linux/nfs_mount.h
  HDRINST usr/include/linux/nilfs2_ondisk.h
  HDRINST usr/include/linux/nl80211.h
  HDRINST usr/include/linux/openvswitch.h
  HDRINST usr/include/linux/pci_regs.h
  HDRINST usr/include/linux/perf_event.h
  HDRINST usr/include/linux/pkt_cls.h
  HDRINST usr/include/linux/pkt_sched.h
  HDRINST usr/include/linux/pmu.h
  HDRINST usr/include/linux/ppdev.h
  HDRINST usr/include/linux/prctl.h
  HDRINST usr/include/linux/psci.h
  HDRINST usr/include/linux/psp-sev.h
  HDRINST usr/include/linux/ptp_clock.h
  HDRINST usr/include/linux/ptrace.h
  HDRINST usr/include/linux/rds.h
  HDRINST usr/include/linux/rtnetlink.h
  HDRINST usr/include/linux/rxrpc.h
  HDRINST usr/include/linux/sctp.h
  HDRINST usr/include/linux/seccomp.h
  HDRINST usr/include/linux/sed-opal.h
  HDRINST usr/include/linux/serial.h
  HDRINST usr/include/linux/serio.h
  HDRINST usr/include/linux/shm.h
  HDRINST usr/include/linux/smc_diag.h
  HDRINST usr/include/linux/snmp.h
  HDRINST usr/include/linux/socket.h
  HDRINST usr/include/linux/sockios.h
  HDRINST usr/include/linux/switchtec_ioctl.h
  HDRINST usr/include/linux/sysctl.h
  HDRINST usr/include/linux/taskstats.h
  HDRINST usr/include/linux/tcp.h
  HDRINST usr/include/linux/time.h
  HDRINST usr/include/linux/time_types.h
  HDRINST usr/include/linux/timex.h
  HDRINST usr/include/linux/tipc.h
  HDRINST usr/include/linux/tipc_config.h
  HDRINST usr/include/linux/tipc_netlink.h
  HDRINST usr/include/linux/tls.h
  HDRINST usr/include/linux/udmabuf.h
  HDRINST usr/include/linux/udp.h
  HDRINST usr/include/linux/unix_diag.h
  HDRINST usr/include/linux/usbdevice_fs.h
  HDRINST usr/include/linux/v4l2-common.h
  HDRINST usr/include/linux/v4l2-controls.h
  HDRINST usr/include/linux/vbox_vmmdev_types.h
  HDRINST usr/include/linux/vboxguest.h
  HDRINST usr/include/linux/vfio.h
  HDRINST usr/include/linux/vfio_ccw.h
  HDRINST usr/include/linux/vhost.h
  HDRINST usr/include/linux/vhost_types.h
  HDRINST usr/include/linux/videodev2.h
  HDRINST usr/include/linux/virtio_balloon.h
  HDRINST usr/include/linux/virtio_blk.h
  HDRINST usr/include/linux/virtio_config.h
  HDRINST usr/include/linux/virtio_fs.h
  HDRINST usr/include/linux/virtio_gpu.h
  HDRINST usr/include/linux/virtio_ids.h
  HDRINST usr/include/linux/virtio_iommu.h
  HDRINST usr/include/linux/virtio_pmem.h
  HDRINST usr/include/linux/virtio_ring.h
  HDRINST usr/include/linux/vmcore.h
  HDRINST usr/include/linux/wait.h
  HDRINST usr/include/linux/wmi.h
  HDRINST usr/include/linux/xdp_diag.h
  HDRINST usr/include/linux/dma-heap.h
  HDRINST usr/include/linux/nvme_ioctl.h
  HDRINST usr/include/linux/pg.h
  HDRINST usr/include/linux/sched.h
  HDRINST usr/include/linux/serial_core.h
  HDRINST usr/include/sound/asequencer.h
  HDRINST usr/include/sound/asoc.h
  HDRINST usr/include/sound/asound_fm.h
  HDRINST usr/include/sound/compress_offload.h
  HDRINST usr/include/sound/compress_params.h
  HDRINST usr/include/sound/emu10k1.h
  HDRINST usr/include/sound/hdsp.h
  HDRINST usr/include/sound/hdspm.h
  HDRINST usr/include/sound/sb16_csp.h
  HDRINST usr/include/sound/sfnt_info.h
  HDRINST usr/include/sound/snd_sst_tokens.h
  HDRINST usr/include/sound/tlv.h
  HDRINST usr/include/sound/usb_stream.h
  HDRINST usr/include/sound/asound.h
  HDRINST usr/include/sound/firewire.h
  HDRINST usr/include/sound/skl-tplg-interface.h
  HDRINST usr/include/sound/sof/abi.h
  HDRINST usr/include/sound/sof/fw.h
  HDRINST usr/include/sound/sof/header.h
  HDRINST usr/include/sound/sof/tokens.h
  HDRINST usr/include/scsi/cxlflash_ioctl.h
  HDRINST usr/include/scsi/fc/fc_els.h
  HDRINST usr/include/scsi/fc/fc_fs.h
  HDRINST usr/include/scsi/fc/fc_gs.h
  HDRINST usr/include/scsi/fc/fc_ns.h
  HDRINST usr/include/scsi/scsi_bsg_fc.h
  HDRINST usr/include/scsi/scsi_bsg_ufs.h
  HDRINST usr/include/scsi/scsi_netlink.h
  HDRINST usr/include/scsi/scsi_netlink_fc.h
  HDRINST usr/include/linux/version.h
  HDRINST usr/include/asm/a.out.h
  HDRINST usr/include/asm/auxvec.h
  HDRINST usr/include/asm/bitsperlong.h
  HDRINST usr/include/asm/boot.h
  HDRINST usr/include/asm/debugreg.h
  HDRINST usr/include/asm/e820.h
  HDRINST usr/include/asm/hw_breakpoint.h
  HDRINST usr/include/asm/ist.h
  HDRINST usr/include/asm/kvm_perf.h
  HDRINST usr/include/asm/ldt.h
  HDRINST usr/include/asm/mce.h
  HDRINST usr/include/asm/mman.h
  HDRINST usr/include/asm/msgbuf.h
  HDRINST usr/include/asm/msr.h
  HDRINST usr/include/asm/mtrr.h
  HDRINST usr/include/asm/posix_types.h
  HDRINST usr/include/asm/posix_types_32.h
  HDRINST usr/include/asm/posix_types_64.h
  HDRINST usr/include/asm/posix_types_x32.h
  HDRINST usr/include/asm/prctl.h
  HDRINST usr/include/asm/processor-flags.h
  HDRINST usr/include/asm/ptrace-abi.h
  HDRINST usr/include/asm/ptrace.h
  HDRINST usr/include/asm/sembuf.h
  HDRINST usr/include/asm/setup.h
  HDRINST usr/include/asm/shmbuf.h
  HDRINST usr/include/asm/sigcontext.h
  HDRINST usr/include/asm/signal.h
  HDRINST usr/include/asm/stat.h
  HDRINST usr/include/asm/statfs.h
  HDRINST usr/include/asm/swab.h
  HDRINST usr/include/asm/ucontext.h
  HDRINST usr/include/asm/vm86.h
  HDRINST usr/include/asm/vsyscall.h
  HDRINST usr/include/asm/bootparam.h
  HDRINST usr/include/asm/byteorder.h
  HDRINST usr/include/asm/hwcap2.h
  HDRINST usr/include/asm/kvm.h
  HDRINST usr/include/asm/kvm_para.h
  HDRINST usr/include/asm/perf_regs.h
  HDRINST usr/include/asm/sigcontext32.h
  HDRINST usr/include/asm/siginfo.h
  HDRINST usr/include/asm/svm.h
  HDRINST usr/include/asm/unistd.h
  HDRINST usr/include/asm/vmx.h
  HDRINST usr/include/asm/unistd_x32.h
  HDRINST usr/include/asm/unistd_64.h
  HDRINST usr/include/asm/unistd_32.h
  HDRINST usr/include/asm/types.h
  HDRINST usr/include/asm/termios.h
  HDRINST usr/include/asm/termbits.h
  HDRINST usr/include/asm/sockios.h
  HDRINST usr/include/asm/socket.h
  HDRINST usr/include/asm/resource.h
  HDRINST usr/include/asm/poll.h
  HDRINST usr/include/asm/param.h
  HDRINST usr/include/asm/ipcbuf.h
  HDRINST usr/include/asm/ioctls.h
  HDRINST usr/include/asm/ioctl.h
  HDRINST usr/include/asm/fcntl.h
  HDRINST usr/include/asm/errno.h
  HDRINST usr/include/asm/bpf_perf_event.h
  INSTALL ./usr/include
make[1]: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4=
b00bc0f91400ac501f7edf16b595cd61b'
make[1]: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb=
4b00bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/dmabuf-heaps'
gcc -static -O3 -Wl,-no-as-needed -Wall    dmabuf-heap.c  -o /usr/src/perf_=
selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf16b595cd61b/tools/te=
sting/selftests/dmabuf-heaps/dmabuf-heap
dmabuf-heap.c:16:21: fatal error: drm/drm.h: No such file or directory
 #include <drm/drm.h>
                     ^
compilation terminated.
=2E./lib.mk:138: recipe for target '/usr/src/perf_selftests-x86_64-rhel-7.6=
-475bfb4b00bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/dmabuf-he=
aps/dmabuf-heap' failed
make[1]: *** [/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac=
501f7edf16b595cd61b/tools/testing/selftests/dmabuf-heaps/dmabuf-heap] Error=
 1
make[1]: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4=
b00bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/dmabuf-heaps'
Makefile:143: recipe for target 'all' failed
make: *** [all] Error 2
2019-10-25 16:32:18 make run_tests -C dmabuf-heaps
make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b0=
0bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/dmabuf-heaps'
gcc -static -O3 -Wl,-no-as-needed -Wall    dmabuf-heap.c  -o /usr/src/perf_=
selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf16b595cd61b/tools/te=
sting/selftests/dmabuf-heaps/dmabuf-heap
dmabuf-heap.c:16:21: fatal error: drm/drm.h: No such file or directory
 #include <drm/drm.h>
                     ^
compilation terminated.
=2E./lib.mk:138: recipe for target '/usr/src/perf_selftests-x86_64-rhel-7.6=
-475bfb4b00bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/dmabuf-he=
aps/dmabuf-heap' failed
make: *** [/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501=
f7edf16b595cd61b/tools/testing/selftests/dmabuf-heaps/dmabuf-heap] Error 1
make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00=
bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/dmabuf-heaps'
ignored_by_lkp efivarfs test: /sys/firmware/efi dir does not exist
2019-10-25 16:32:18 make run_tests -C exec
make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b0=
0bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/exec'
gcc -Wall -Wno-nonnull -D_GNU_SOURCE    execveat.c  -o /usr/src/perf_selfte=
sts-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf16b595cd61b/tools/testing/=
selftests/exec/execveat
execveat.c:8:0: warning: "_GNU_SOURCE" redefined
 #define _GNU_SOURCE  /* to get O_PATH, AT_EMPTY_PATH */
=20
<command-line>:0:0: note: this is the location of the previous definition
gcc -Wall -Wno-nonnull -D_GNU_SOURCE    recursion-depth.c  -o /usr/src/perf=
_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf16b595cd61b/tools/t=
esting/selftests/exec/recursion-depth
cd /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf16b=
595cd61b/tools/testing/selftests/exec && ln -s -f execveat execveat.symlink
cp /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf16b=
595cd61b/tools/testing/selftests/exec/execveat /usr/src/perf_selftests-x86_=
64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf16b595cd61b/tools/testing/selftest=
s/exec/execveat.denatured
chmod -x /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7=
edf16b595cd61b/tools/testing/selftests/exec/execveat.denatured
echo '#!/bin/sh' > /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91=
400ac501f7edf16b595cd61b/tools/testing/selftests/exec/script
echo 'exit $*' >> /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f914=
00ac501f7edf16b595cd61b/tools/testing/selftests/exec/script
chmod +x /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7=
edf16b595cd61b/tools/testing/selftests/exec/script
mkdir -p /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7=
edf16b595cd61b/tools/testing/selftests/exec/subdir
TAP version 13
1..2
# selftests: exec: execveat
# /bin/sh: 0: Can't open /dev/fd/8/usr/src/perf_selftests-x86_64-rhel-7.6-4=
75bfb4b00bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/exec/xxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxx/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx/xxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxx/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx/xxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxx/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx/xxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxx/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx/xxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxx/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx/xxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxx/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx/xxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx/yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy=
yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy=
yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy=
yyy
# Check success of execveat(5, '../execveat', 0)... [OK]
# Check success of execveat(7, 'execveat', 0)... [OK]
# Check success of execveat(9, 'execveat', 0)... [OK]
# Check success of execveat(-100, '/usr/src/perf_selfte...ftests/exec/execv=
eat', 0)... [OK]
# Check success of execveat(99, '/usr/src/perf_selfte...ftests/exec/execvea=
t', 0)... [OK]
# Check success of execveat(11, '', 4096)... [OK]
# Check success of execveat(20, '', 4096)... [OK]
# Check success of execveat(12, '', 4096)... [OK]
# Check success of execveat(17, '', 4096)... [OK]
# Check success of execveat(17, '', 4096)... [OK]
# Check success of execveat(18, '', 4096)... [OK]
# Check failure of execveat(11, '', 0) with ENOENT... [OK]
# Check failure of execveat(11, '(null)', 4096) with EFAULT... [OK]
# Check success of execveat(7, 'execveat.symlink', 0)... [OK]
# Check success of execveat(9, 'execveat.symlink', 0)... [OK]
# Check success of execveat(-100, '/usr/src/perf_selfte...xec/execveat.syml=
ink', 0)... [OK]
# Check success of execveat(13, '', 4096)... [OK]
# Check success of execveat(13, '', 4352)... [OK]
# Check failure of execveat(7, 'execveat.symlink', 256) with ELOOP... [OK]
# Check failure of execveat(9, 'execveat.symlink', 256) with ELOOP... [OK]
# Check failure of execveat(-100, '/usr/src/perf_selftests-x86_64-rhel-7.6-=
475bfb4b00bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/exec/execv=
eat.symlink', 256) with ELOOP... [OK]
# Check success of execveat(5, '../script', 0)... [OK]
# Check success of execveat(7, 'script', 0)... [OK]
# Check success of execveat(9, 'script', 0)... [OK]
# Check success of execveat(-100, '/usr/src/perf_selfte...elftests/exec/scr=
ipt', 0)... [OK]
# Check success of execveat(16, '', 4096)... [OK]
# Check success of execveat(16, '', 4352)... [OK]
# Check failure of execveat(21, '', 4096) with ENOENT... [OK]
# Check failure of execveat(10, 'script', 0) with ENOENT... [OK]
# Check success of execveat(19, '', 4096)... [OK]
# Check success of execveat(19, '', 4096)... [OK]
# Check success of execveat(6, '../script', 0)... [OK]
# Check success of execveat(6, 'script', 0)... [OK]
# Check success of execveat(6, '../script', 0)... [OK]
# Check failure of execveat(6, 'script', 0) with ENOENT... [OK]
# Check failure of execveat(7, 'execveat', 65535) with EINVAL... [OK]
# Check failure of execveat(7, 'no-such-file', 0) with ENOENT... [OK]
# Check failure of execveat(9, 'no-such-file', 0) with ENOENT... [OK]
# Check failure of execveat(-100, 'no-such-file', 0) with ENOENT... [OK]
# Check failure of execveat(7, '', 4096) with EACCES... [OK]
# Check failure of execveat(7, 'Makefile', 0) with EACCES... [OK]
# Check failure of execveat(14, '', 4096) with EACCES... [OK]
# Check failure of execveat(15, '', 4096) with EACCES... [OK]
# Check failure of execveat(99, '', 4096) with EBADF... [OK]
# Check failure of execveat(99, 'execveat', 0) with EBADF... [OK]
# Check failure of execveat(11, 'execveat', 0) with ENOTDIR... [OK]
# Invoke copy of 'execveat' via filename of length 4094:
# Check success of execveat(22, '', 4096)... [OK]
# Check success of execveat(8, 'usr/src/perf_selftes...yyyyyyyyyyyyyyyyyyyy=
', 0)... [OK]
# Invoke copy of 'script' via filename of length 4094:
# Check success of execveat(23, '', 4096)... [OK]
# Check success of execveat(8, 'usr/src/perf_selftes...yyyyyyyyyyyyyyyyyyyy=
', 0)... [OK]
ok 1 selftests: exec: execveat
# selftests: exec: recursion-depth
ok 2 selftests: exec: recursion-depth
make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00=
bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/exec'
ignored_by_lkp filesystems test
2019-10-25 16:32:19 mv /lib/udev/rules.d/50-firmware.rules .
2019-10-25 16:32:19 /etc/init.d/udev restart
Restarting udev (via systemctl): udev.service.
2019-10-25 16:32:19 make run_tests -C firmware
make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b0=
0bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/firmware'
TAP version 13
1..1
# selftests: firmware: fw_run_tests.sh
# -----------------------------------------------------
# Running kernel configuration test 1 -- rare
# Emulates:
# CONFIG_FW_LOADER=3Dy
# CONFIG_FW_LOADER_USER_HELPER=3Dn
# CONFIG_FW_LOADER_USER_HELPER_FALLBACK=3Dn
# ./fw_filesystem.sh: filesystem loading works
# ./fw_filesystem.sh: async filesystem loading works
#=20
# Testing with the file present...
# Batched request_firmware() normal try #1: OK
# Batched request_firmware() normal try #2: OK
# Batched request_firmware() normal try #3: OK
# Batched request_firmware() normal try #4: OK
# Batched request_firmware() normal try #5: OK
# Batched request_firmware_into_buf() normal try #1: OK
# Batched request_firmware_into_buf() normal try #2: OK
# Batched request_firmware_into_buf() normal try #3: OK
# Batched request_firmware_into_buf() normal try #4: OK
# Batched request_firmware_into_buf() normal try #5: OK
# Batched request_firmware_direct() normal try #1: OK
# Batched request_firmware_direct() normal try #2: OK
# Batched request_firmware_direct() normal try #3: OK
# Batched request_firmware_direct() normal try #4: OK
# Batched request_firmware_direct() normal try #5: OK
# Batched request_firmware_nowait(uevent=3Dtrue) normal try #1: OK
# Batched request_firmware_nowait(uevent=3Dtrue) normal try #2: OK
# Batched request_firmware_nowait(uevent=3Dtrue) normal try #3: OK
# Batched request_firmware_nowait(uevent=3Dtrue) normal try #4: OK
# Batched request_firmware_nowait(uevent=3Dtrue) normal try #5: OK
# Batched request_firmware_nowait(uevent=3Dfalse) normal try #1: OK
# Batched request_firmware_nowait(uevent=3Dfalse) normal try #2: OK
# Batched request_firmware_nowait(uevent=3Dfalse) normal try #3: OK
# Batched request_firmware_nowait(uevent=3Dfalse) normal try #4: OK
# Batched request_firmware_nowait(uevent=3Dfalse) normal try #5: OK
#=20
# Testing with the file missing...
# Batched request_firmware() nofile try #1: OK
# Batched request_firmware() nofile try #2: OK
# Batched request_firmware() nofile try #3: OK
# Batched request_firmware() nofile try #4: OK
# Batched request_firmware() nofile try #5: OK
# Batched request_firmware_into_buf() nofile try #1: OK
# Batched request_firmware_into_buf() nofile try #2: OK
# Batched request_firmware_into_buf() nofile try #3: OK
# Batched request_firmware_into_buf() nofile try #4: OK
# Batched request_firmware_into_buf() nofile try #5: OK
# Batched request_firmware_direct() nofile try #1: OK
# Batched request_firmware_direct() nofile try #2: OK
# Batched request_firmware_direct() nofile try #3: OK
# Batched request_firmware_direct() nofile try #4: OK
# Batched request_firmware_direct() nofile try #5: OK
# Batched request_firmware_nowait(uevent=3Dtrue) nofile try #1: OK
# Batched request_firmware_nowait(uevent=3Dtrue) nofile try #2: OK
# Batched request_firmware_nowait(uevent=3Dtrue) nofile try #3: OK
# Batched request_firmware_nowait(uevent=3Dtrue) nofile try #4: OK
# Batched request_firmware_nowait(uevent=3Dtrue) nofile try #5: OK
# Batched request_firmware_nowait(uevent=3Dfalse) nofile try #1: OK
# Batched request_firmware_nowait(uevent=3Dfalse) nofile try #2: OK
# Batched request_firmware_nowait(uevent=3Dfalse) nofile try #3: OK
# Batched request_firmware_nowait(uevent=3Dfalse) nofile try #4: OK
# Batched request_firmware_nowait(uevent=3Dfalse) nofile try #5: OK
# usermode helper disabled so ignoring test
# -----------------------------------------------------
# Running kernel configuration test 2 -- distro
# Emulates:
# CONFIG_FW_LOADER=3Dy
# CONFIG_FW_LOADER_USER_HELPER=3Dy
# CONFIG_FW_LOADER_USER_HELPER_FALLBACK=3Dn
# ./fw_filesystem.sh: timeout works
# ./fw_filesystem.sh: filesystem loading works
# ./fw_filesystem.sh: async filesystem loading works
#=20
# Testing with the file present...
# Batched request_firmware() normal try #1: OK
# Batched request_firmware() normal try #2: OK
# Batched request_firmware() normal try #3: OK
# Batched request_firmware() normal try #4: OK
# Batched request_firmware() normal try #5: OK
# Batched request_firmware_into_buf() normal try #1: OK
# Batched request_firmware_into_buf() normal try #2: OK
# Batched request_firmware_into_buf() normal try #3: OK
# Batched request_firmware_into_buf() normal try #4: OK
# Batched request_firmware_into_buf() normal try #5: OK
# Batched request_firmware_direct() normal try #1: OK
# Batched request_firmware_direct() normal try #2: OK
# Batched request_firmware_direct() normal try #3: OK
# Batched request_firmware_direct() normal try #4: OK
# Batched request_firmware_direct() normal try #5: OK
# Batched request_firmware_nowait(uevent=3Dtrue) normal try #1: OK
# Batched request_firmware_nowait(uevent=3Dtrue) normal try #2: not ok 1 se=
lftests: firmware: fw_run_tests.sh # TIMEOUT
make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00=
bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/firmware'
2019-10-25 16:33:06 mv 50-firmware.rules /lib/udev/rules.d/50-firmware.rules
2019-10-25 16:33:06 make run_tests -C ftrace
make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b0=
0bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/ftrace'
TAP version 13
1..1
# selftests: ftrace: ftracetest
# =3D=3D=3D Ftrace unit tests =3D=3D=3D
# [1] Basic trace file check	[PASS]
# [2] Basic test for tracers	[PASS]
# [3] Basic trace clock test	[PASS]
# [4] Basic event tracing check	[PASS]
# [5] Change the ringbuffer size	[PASS]
# [6] Snapshot and tracing setting	[PASS]
# [7] trace_pipe and trace_marker	[PASS]
# [8] Generic dynamic event - add/remove kprobe events	[PASS]
# [9] Generic dynamic event - add/remove synthetic events	[PASS]
# [10] Generic dynamic event - selective clear (compatibility)	[PASS]
# [11] Generic dynamic event - generic clear event	[PASS]
# [12] event tracing - enable/disable with event level files	[PASS]
# [13] event tracing - restricts events based on pid	[PASS]
# [14] event tracing - enable/disable with subsystem level files	[PASS]
# [15] event tracing - enable/disable with top level files	[PASS]
# [16] Test trace_printk from module	[UNRESOLVED]
# [17] ftrace - function graph filters with stack tracer	[PASS]
# [18] ftrace - function graph filters	[PASS]
# [19] ftrace - function glob filters	[PASS]
# [20] ftrace - function pid filters	[PASS]
# [21] ftrace - stacktrace filter command	[PASS]
# [22] ftrace - function trace with cpumask	[PASS]
# [23] ftrace - test for function event triggers	[PASS]
# [24] ftrace - function trace on module	[UNRESOLVED]
# [25] ftrace - function profiling	[PASS]
# [26] ftrace - function profiler with function tracing	[PASS]
# [27] ftrace - test reading of set_ftrace_filter	[PASS]
# [28] ftrace - Max stack tracer	[PASS]
# [29] ftrace - test for function traceon/off triggers	[PASS]
# [30] ftrace - test tracing error log support	[PASS]
# [31] Test creation and deletion of trace instances while setting an event=
	[PASS]
# [32] Test creation and deletion of trace instances	[PASS]
# [33] Kprobe dynamic event - adding and removing	[PASS]
# [34] Kprobe dynamic event - busy event check	[PASS]
# [35] Kprobe dynamic event with arguments	[PASS]
# [36] Kprobe event with comm arguments	[PASS]
# [37] Kprobe event string type argument	[PASS]
# [38] Kprobe event symbol argument	[PASS]
# [39] Kprobe event argument syntax	[PASS]
# [40] Kprobes event arguments with types	[PASS]
# [41] Kprobe event user-memory access	[PASS]
# [42] Kprobe event auto/manual naming	[PASS]
# [43] Kprobe dynamic event with function tracer	[PASS]
# [44] Kprobe dynamic event - probing module	[UNRESOLVED]
# [45] Create/delete multiprobe on kprobe event	[PASS]
# [46] Kprobe event parser error log check	[FAIL]
# [47] Kretprobe dynamic event with arguments	[PASS]
# [48] Kretprobe dynamic event with maxactive	[PASS]
# [49] Register/unregister many kprobe eventsnot ok 1 selftests: ftrace: ft=
racetest # TIMEOUT
make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00=
bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/ftrace'
2019-10-25 16:34:08 make run_tests -C futex
make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b0=
0bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/futex'
make[1]: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb=
4b00bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/futex/functional'
make --no-builtin-rules INSTALL_HDR_PATH=3D$OUTPUT/usr \
	ARCH=3Dx86 -C ../../../../.. headers_install
make[2]: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb=
4b00bc0f91400ac501f7edf16b595cd61b'
  INSTALL /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f=
7edf16b595cd61b/tools/testing/selftests/futex/functional/usr/include
make[2]: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4=
b00bc0f91400ac501f7edf16b595cd61b'
gcc  -g -O2 -Wall -D_GNU_SOURCE -pthread -I../include -I../../   -pthread -=
lrt  futex_wait_timeout.c ../include/futextest.h ../include/atomic.h ../inc=
lude/logging.h  -o /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91=
400ac501f7edf16b595cd61b/tools/testing/selftests/futex/functional/futex_wai=
t_timeout
gcc  -g -O2 -Wall -D_GNU_SOURCE -pthread -I../include -I../../   -pthread -=
lrt  futex_wait_wouldblock.c ../include/futextest.h ../include/atomic.h ../=
include/logging.h  -o /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0=
f91400ac501f7edf16b595cd61b/tools/testing/selftests/futex/functional/futex_=
wait_wouldblock
gcc  -g -O2 -Wall -D_GNU_SOURCE -pthread -I../include -I../../   -pthread -=
lrt  futex_requeue_pi.c ../include/futextest.h ../include/atomic.h ../inclu=
de/logging.h  -o /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f9140=
0ac501f7edf16b595cd61b/tools/testing/selftests/futex/functional/futex_reque=
ue_pi
gcc  -g -O2 -Wall -D_GNU_SOURCE -pthread -I../include -I../../   -pthread -=
lrt  futex_requeue_pi_signal_restart.c ../include/futextest.h ../include/at=
omic.h ../include/logging.h  -o /usr/src/perf_selftests-x86_64-rhel-7.6-475=
bfb4b00bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/futex/functio=
nal/futex_requeue_pi_signal_restart
gcc  -g -O2 -Wall -D_GNU_SOURCE -pthread -I../include -I../../   -pthread -=
lrt  futex_requeue_pi_mismatched_ops.c ../include/futextest.h ../include/at=
omic.h ../include/logging.h  -o /usr/src/perf_selftests-x86_64-rhel-7.6-475=
bfb4b00bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/futex/functio=
nal/futex_requeue_pi_mismatched_ops
gcc  -g -O2 -Wall -D_GNU_SOURCE -pthread -I../include -I../../   -pthread -=
lrt  futex_wait_uninitialized_heap.c ../include/futextest.h ../include/atom=
ic.h ../include/logging.h  -o /usr/src/perf_selftests-x86_64-rhel-7.6-475bf=
b4b00bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/futex/functiona=
l/futex_wait_uninitialized_heap
gcc  -g -O2 -Wall -D_GNU_SOURCE -pthread -I../include -I../../   -pthread -=
lrt  futex_wait_private_mapped_file.c ../include/futextest.h ../include/ato=
mic.h ../include/logging.h  -o /usr/src/perf_selftests-x86_64-rhel-7.6-475b=
fb4b00bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/futex/function=
al/futex_wait_private_mapped_file
make[1]: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4=
b00bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/futex/functional'
TAP version 13
1..1
# selftests: futex: run.sh
#=20
# TAP version 13
# 1..1
# # futex_requeue_pi: Test requeue functionality
# # 	Arguments: broadcast=3D0 locked=3D0 owner=3D0 timeout=3D0ns
# ok 1 futex-requeue-pi
# # Pass 1 Fail 0 Xfail 0 Xpass 0 Skip 0 Error 0
# TAP version 13
# 1..1
# # futex_requeue_pi: Test requeue functionality
# # 	Arguments: broadcast=3D1 locked=3D0 owner=3D0 timeout=3D0ns
# ok 1 futex-requeue-pi
# # Pass 1 Fail 0 Xfail 0 Xpass 0 Skip 0 Error 0
# TAP version 13
# 1..1
# # futex_requeue_pi: Test requeue functionality
# # 	Arguments: broadcast=3D1 locked=3D1 owner=3D0 timeout=3D0ns
# ok 1 futex-requeue-pi
# # Pass 1 Fail 0 Xfail 0 Xpass 0 Skip 0 Error 0
# TAP version 13
# 1..1
# # futex_requeue_pi: Test requeue functionality
# # 	Arguments: broadcast=3D1 locked=3D0 owner=3D1 timeout=3D0ns
# ok 1 futex-requeue-pi
# # Pass 1 Fail 0 Xfail 0 Xpass 0 Skip 0 Error 0
# TAP version 13
# 1..1
# # futex_requeue_pi: Test requeue functionality
# # 	Arguments: broadcast=3D0 locked=3D1 owner=3D0 timeout=3D0ns
# ok 1 futex-requeue-pi
# # Pass 1 Fail 0 Xfail 0 Xpass 0 Skip 0 Error 0
# TAP version 13
# 1..1
# # futex_requeue_pi: Test requeue functionality
# # 	Arguments: broadcast=3D0 locked=3D0 owner=3D1 timeout=3D0ns
# ok 1 futex-requeue-pi
# # Pass 1 Fail 0 Xfail 0 Xpass 0 Skip 0 Error 0
# TAP version 13
# 1..1
# # futex_requeue_pi: Test requeue functionality
# # 	Arguments: broadcast=3D1 locked=3D1 owner=3D0 timeout=3D5000ns
# ok 1 futex-requeue-pi
# # Pass 1 Fail 0 Xfail 0 Xpass 0 Skip 0 Error 0
# TAP version 13
# 1..1
# # futex_requeue_pi: Test requeue functionality
# # 	Arguments: broadcast=3D0 locked=3D1 owner=3D0 timeout=3D5000ns
# ok 1 futex-requeue-pi
# # Pass 1 Fail 0 Xfail 0 Xpass 0 Skip 0 Error 0
# TAP version 13
# 1..1
# # futex_requeue_pi: Test requeue functionality
# # 	Arguments: broadcast=3D1 locked=3D1 owner=3D0 timeout=3D500000ns
# ok 1 futex-requeue-pi
# # Pass 1 Fail 0 Xfail 0 Xpass 0 Skip 0 Error 0
# TAP version 13
# 1..1
# # futex_requeue_pi: Test requeue functionality
# # 	Arguments: broadcast=3D0 locked=3D1 owner=3D0 timeout=3D500000ns
# ok 1 futex-requeue-pi
# # Pass 1 Fail 0 Xfail 0 Xpass 0 Skip 0 Error 0
# TAP version 13
# 1..1
# # futex_requeue_pi: Test requeue functionality
# # 	Arguments: broadcast=3D1 locked=3D0 owner=3D0 timeout=3D5000ns
# ok 1 futex-requeue-pi
# # Pass 1 Fail 0 Xfail 0 Xpass 0 Skip 0 Error 0
# TAP version 13
# 1..1
# # futex_requeue_pi: Test requeue functionality
# # 	Arguments: broadcast=3D0 locked=3D0 owner=3D0 timeout=3D5000ns
# ok 1 futex-requeue-pi
# # Pass 1 Fail 0 Xfail 0 Xpass 0 Skip 0 Error 0
# TAP version 13
# 1..1
# # futex_requeue_pi: Test requeue functionality
# # 	Arguments: broadcast=3D1 locked=3D0 owner=3D0 timeout=3D500000ns
# ok 1 futex-requeue-pi
# # Pass 1 Fail 0 Xfail 0 Xpass 0 Skip 0 Error 0
# TAP version 13
# 1..1
# # futex_requeue_pi: Test requeue functionality
# # 	Arguments: broadcast=3D0 locked=3D0 owner=3D0 timeout=3D500000ns
# ok 1 futex-requeue-pi
# # Pass 1 Fail 0 Xfail 0 Xpass 0 Skip 0 Error 0
# TAP version 13
# 1..1
# # futex_requeue_pi: Test requeue functionality
# # 	Arguments: broadcast=3D1 locked=3D0 owner=3D1 timeout=3D5000ns
# ok 1 futex-requeue-pi
# # Pass 1 Fail 0 Xfail 0 Xpass 0 Skip 0 Error 0
# TAP version 13
# 1..1
# # futex_requeue_pi: Test requeue functionality
# # 	Arguments: broadcast=3D0 locked=3D1 owner=3D0 timeout=3D5000ns
# ok 1 futex-requeue-pi
# # Pass 1 Fail 0 Xfail 0 Xpass 0 Skip 0 Error 0
# TAP version 13
# 1..1
# # futex_requeue_pi: Test requeue functionality
# # 	Arguments: broadcast=3D1 locked=3D0 owner=3D1 timeout=3D500000ns
# ok 1 futex-requeue-pi
# # Pass 1 Fail 0 Xfail 0 Xpass 0 Skip 0 Error 0
# TAP version 13
# 1..1
# # futex_requeue_pi: Test requeue functionality
# # 	Arguments: broadcast=3D0 locked=3D1 owner=3D0 timeout=3D500000ns
# ok 1 futex-requeue-pi
# # Pass 1 Fail 0 Xfail 0 Xpass 0 Skip 0 Error 0
# TAP version 13
# 1..1
# # futex_requeue_pi: Test requeue functionality
# # 	Arguments: broadcast=3D1 locked=3D1 owner=3D0 timeout=3D2000000000ns
# ok 1 futex-requeue-pi
# # Pass 1 Fail 0 Xfail 0 Xpass 0 Skip 0 Error 0
# TAP version 13
# 1..1
# # futex_requeue_pi: Test requeue functionality
# # 	Arguments: broadcast=3D0 locked=3D1 owner=3D0 timeout=3D2000000000ns
# ok 1 futex-requeue-pi
# # Pass 1 Fail 0 Xfail 0 Xpass 0 Skip 0 Error 0
#=20
# TAP version 13
# 1..1
# # futex_requeue_pi_mismatched_ops: Detect mismatched requeue_pi operations
# ok 1 futex-requeue-pi-mismatched-ops
# # Pass 1 Fail 0 Xfail 0 Xpass 0 Skip 0 Error 0
#=20
# TAP version 13
# 1..1
# # futex_requeue_pi_signal_restart: Test signal handling during requeue_pi
# # 	Arguments: <none>
# ok 1 futex-requeue-pi-signal-restart
# # Pass 1 Fail 0 Xfail 0 Xpass 0 Skip 0 Error 0
#=20
# TAP version 13
# 1..1
# # futex_wait_timeout: Block on a futex and wait for timeout
# # 	Arguments: timeout=3D100000ns
# ok 1 futex-wait-timeout
# # Pass 1 Fail 0 Xfail 0 Xpass 0 Skip 0 Error 0
#=20
# TAP version 13
# 1..1
# # futex_wait_wouldblock: Test the unexpected futex value in FUTEX_WAIT
# ok 1 futex-wait-wouldblock
# # Pass 1 Fail 0 Xfail 0 Xpass 0 Skip 0 Error 0
#=20
# TAP version 13
# 1..1
# # futex_wait_uninitialized_heap: Test the uninitialized futex value in FU=
TEX_WAIT
# ok 1 futex-wait-uninitialized-heap
# # Pass 1 Fail 0 Xfail 0 Xpass 0 Skip 0 Error 0
# TAP version 13
# 1..1
# # futex_wait_private_mapped_file: Test the futex value of private file ma=
ppings in FUTEX_WAIT
# ok 1 futex-wait-private-mapped-file
# # Pass 1 Fail 0 Xfail 0 Xpass 0 Skip 0 Error 0
ok 1 selftests: futex: run.sh
make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00=
bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/futex'
2019-10-25 16:34:21 make run_tests -C gpio
make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b0=
0bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/gpio'
make OUTPUT=3D/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac=
501f7edf16b595cd61b/tools/gpio/ -C /usr/src/perf_selftests-x86_64-rhel-7.6-=
475bfb4b00bc0f91400ac501f7edf16b595cd61b/tools/gpio
make[1]: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb=
4b00bc0f91400ac501f7edf16b595cd61b/tools/gpio'
mkdir -p /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7=
edf16b595cd61b/tools/gpio/include/linux 2>&1 || true
ln -sf /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7ed=
f16b595cd61b/tools/gpio/../../include/uapi/linux/gpio.h /usr/src/perf_selft=
ests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf16b595cd61b/tools/gpio/in=
clude/linux/gpio.h
make -f /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7e=
df16b595cd61b/tools/build/Makefile.build dir=3D. obj=3Dlsgpio
make[2]: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb=
4b00bc0f91400ac501f7edf16b595cd61b/tools/gpio'
  CC       /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501=
f7edf16b595cd61b/tools/gpio/lsgpio.o
  CC       /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501=
f7edf16b595cd61b/tools/gpio/gpio-utils.o
  LD       /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501=
f7edf16b595cd61b/tools/gpio/lsgpio-in.o
make[2]: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4=
b00bc0f91400ac501f7edf16b595cd61b/tools/gpio'
  LINK     /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501=
f7edf16b595cd61b/tools/gpio/lsgpio
make -f /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7e=
df16b595cd61b/tools/build/Makefile.build dir=3D. obj=3Dgpio-hammer
make[2]: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb=
4b00bc0f91400ac501f7edf16b595cd61b/tools/gpio'
  CC       /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501=
f7edf16b595cd61b/tools/gpio/gpio-hammer.o
  LD       /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501=
f7edf16b595cd61b/tools/gpio/gpio-hammer-in.o
make[2]: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4=
b00bc0f91400ac501f7edf16b595cd61b/tools/gpio'
  LINK     /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501=
f7edf16b595cd61b/tools/gpio/gpio-hammer
make -f /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7e=
df16b595cd61b/tools/build/Makefile.build dir=3D. obj=3Dgpio-event-mon
make[2]: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb=
4b00bc0f91400ac501f7edf16b595cd61b/tools/gpio'
  CC       /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501=
f7edf16b595cd61b/tools/gpio/gpio-event-mon.o
  LD       /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501=
f7edf16b595cd61b/tools/gpio/gpio-event-mon-in.o
make[2]: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4=
b00bc0f91400ac501f7edf16b595cd61b/tools/gpio'
  LINK     /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501=
f7edf16b595cd61b/tools/gpio/gpio-event-mon
make[1]: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4=
b00bc0f91400ac501f7edf16b595cd61b/tools/gpio'
gcc -O2 -g -std=3Dgnu99 -Wall -I../../../../usr/include/ -I/usr/include/lib=
mount -I/usr/include/blkid -I/usr/include/uuid    gpio-mockup-chardev.c /us=
r/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf16b595cd6=
1b/tools/gpio/gpio-utils.o  -lmount -o gpio-mockup-chardev
make --no-builtin-rules ARCH=3Dx86 -C ../../../.. headers_install
make[1]: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb=
4b00bc0f91400ac501f7edf16b595cd61b'
  INSTALL ./usr/include
make[1]: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4=
b00bc0f91400ac501f7edf16b595cd61b'
TAP version 13
1..1
# selftests: gpio: gpio-mockup.sh
# 1.  Test dynamic allocation of gpio successful means insert gpiochip and
#     manipulate gpio pin successful
# GPIO gpio-mockup test with ranges: <-1,32>:=20
# -1,32     =20
# gpio<gpio-mockup> test failed
# Test gpiochip gpio-mockup: GPIO gpio-mockup test with ranges: <-1,32,-1,3=
2>:=20
# -1,32,-1,32=20
# gpio<gpio-mockup> test failed
# Test gpiochip gpio-mockup: GPIO gpio-mockup test with ranges: <-1,32,-1,3=
2,-1,32>:=20
# -1,32,-1,32,-1,32=20
# gpio<gpio-mockup> test failed
# Test gpiochip gpio-mockup: 3.  Error test: successful means insert gpioch=
ip failed
# 3.1 Test number of gpio overflow
# GPIO gpio-mockup test with ranges: <-1,32,-1,1024>:=20
# -1,32,-1,1024=20
# Test gpiochip gpio-mockup: Invalid test successful
# GPIO test PASS
ok 1 selftests: gpio: gpio-mockup.sh
make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00=
bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/gpio'
ia64 test: not in Makefile
2019-10-25 16:34:22 make TARGETS=3Dia64
make --no-builtin-rules ARCH=3Dx86 -C ../../.. headers_install
make[1]: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb=
4b00bc0f91400ac501f7edf16b595cd61b'
  INSTALL ./usr/include
make[1]: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4=
b00bc0f91400ac501f7edf16b595cd61b'
make[1]: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb=
4b00bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/ia64'
Makefile:9: warning: overriding recipe for target 'clean'
=2E./lib.mk:123: warning: ignoring old recipe for target 'clean'
gcc     aliasing-test.c   -o aliasing-test
make[1]: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4=
b00bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/ia64'
2019-10-25 16:34:24 make run_tests -C ia64
make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b0=
0bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/ia64'
Makefile:9: warning: overriding recipe for target 'clean'
=2E./lib.mk:123: warning: ignoring old recipe for target 'clean'
TAP version 13
1..1
# selftests: ia64: aliasing-test
# PASS: /dev/mem 0x0-0xa0000 is readable
# PASS: /dev/mem 0xa0000-0xc0000 is mappable
# PASS: /dev/mem 0xc0000-0x100000 is readable
# PASS: /dev/mem 0x0-0x100000 is mappable
# PASS: /sys/devices/pci0000:00/0000:00:02.0/rom read 39422 bytes
# PASS: /sys/devices/pci0000:00/0000:00:03.0/rom read 231422 bytes
# PASS: /proc/bus/pci/00/00.0 0x0-0xa0000 not mappable
# PASS: /proc/bus/pci/00/01.0 0x0-0xa0000 not mappable
# PASS: /proc/bus/pci/00/01.1 0x0-0xa0000 not mappable
# PASS: /proc/bus/pci/00/01.3 0x0-0xa0000 not mappable
# PASS: /proc/bus/pci/00/02.0 0x0-0xa0000 not mappable
# PASS: /proc/bus/pci/00/03.0 0x0-0xa0000 not mappable
# PASS: /proc/bus/pci/00/04.0 0x0-0xa0000 not mappable
# PASS: /proc/bus/pci/00/05.0 0x0-0xa0000 not mappable
# PASS: /proc/bus/pci/00/06.0 0x0-0xa0000 not mappable
# PASS: /proc/bus/pci/00/07.0 0x0-0xa0000 not mappable
# PASS: /proc/bus/pci/00/08.0 0x0-0xa0000 not mappable
# PASS: /proc/bus/pci/00/09.0 0x0-0xa0000 not mappable
# PASS: /proc/bus/pci/00/0a.0 0x0-0xa0000 not mappable
# PASS: /proc/bus/pci/00/0b.0 0x0-0xa0000 not mappable
# PASS: /proc/bus/pci/00/00.0 0xa0000-0xc0000 not mappable
# PASS: /proc/bus/pci/00/01.0 0xa0000-0xc0000 not mappable
# PASS: /proc/bus/pci/00/01.1 0xa0000-0xc0000 not mappable
# PASS: /proc/bus/pci/00/01.3 0xa0000-0xc0000 not mappable
# PASS: /proc/bus/pci/00/02.0 0xa0000-0xc0000 not mappable
# PASS: /proc/bus/pci/00/03.0 0xa0000-0xc0000 not mappable
# PASS: /proc/bus/pci/00/04.0 0xa0000-0xc0000 not mappable
# PASS: /proc/bus/pci/00/05.0 0xa0000-0xc0000 not mappable
# PASS: /proc/bus/pci/00/06.0 0xa0000-0xc0000 not mappable
# PASS: /proc/bus/pci/00/07.0 0xa0000-0xc0000 not mappable
# PASS: /proc/bus/pci/00/08.0 0xa0000-0xc0000 not mappable
# PASS: /proc/bus/pci/00/09.0 0xa0000-0xc0000 not mappable
# PASS: /proc/bus/pci/00/0a.0 0xa0000-0xc0000 not mappable
# PASS: /proc/bus/pci/00/0b.0 0xa0000-0xc0000 not mappable
# PASS: /proc/bus/pci/00/00.0 0xc0000-0x100000 not mappable
# PASS: /proc/bus/pci/00/01.0 0xc0000-0x100000 not mappable
# PASS: /proc/bus/pci/00/01.1 0xc0000-0x100000 not mappable
# PASS: /proc/bus/pci/00/01.3 0xc0000-0x100000 not mappable
# PASS: /proc/bus/pci/00/02.0 0xc0000-0x100000 not mappable
# PASS: /proc/bus/pci/00/03.0 0xc0000-0x100000 not mappable
# PASS: /proc/bus/pci/00/04.0 0xc0000-0x100000 not mappable
# PASS: /proc/bus/pci/00/05.0 0xc0000-0x100000 not mappable
# PASS: /proc/bus/pci/00/06.0 0xc0000-0x100000 not mappable
# PASS: /proc/bus/pci/00/07.0 0xc0000-0x100000 not mappable
# PASS: /proc/bus/pci/00/08.0 0xc0000-0x100000 not mappable
# PASS: /proc/bus/pci/00/09.0 0xc0000-0x100000 not mappable
# PASS: /proc/bus/pci/00/0a.0 0xc0000-0x100000 not mappable
# PASS: /proc/bus/pci/00/0b.0 0xc0000-0x100000 not mappable
# PASS: /proc/bus/pci/00/00.0 0x0-0x100000 not mappable
# PASS: /proc/bus/pci/00/01.0 0x0-0x100000 not mappable
# PASS: /proc/bus/pci/00/01.1 0x0-0x100000 not mappable
# PASS: /proc/bus/pci/00/01.3 0x0-0x100000 not mappable
# PASS: /proc/bus/pci/00/02.0 0x0-0x100000 not mappable
# PASS: /proc/bus/pci/00/03.0 0x0-0x100000 not mappable
# PASS: /proc/bus/pci/00/04.0 0x0-0x100000 not mappable
# PASS: /proc/bus/pci/00/05.0 0x0-0x100000 not mappable
# PASS: /proc/bus/pci/00/06.0 0x0-0x100000 not mappable
# PASS: /proc/bus/pci/00/07.0 0x0-0x100000 not mappable
# PASS: /proc/bus/pci/00/08.0 0x0-0x100000 not mappable
# PASS: /proc/bus/pci/00/09.0 0x0-0x100000 not mappable
# PASS: /proc/bus/pci/00/0a.0 0x0-0x100000 not mappable
# PASS: /proc/bus/pci/00/0b.0 0x0-0x100000 not mappable
ok 1 selftests: ia64: aliasing-test
make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00=
bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/ia64'
2019-10-25 16:34:25 make run_tests -C intel_pstate
make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b0=
0bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/intel_pstate'
gcc  -Wall -D_GNU_SOURCE    msr.c  -lm -o /usr/src/perf_selftests-x86_64-rh=
el-7.6-475bfb4b00bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/int=
el_pstate/msr
gcc  -Wall -D_GNU_SOURCE    aperf.c  -lm -o /usr/src/perf_selftests-x86_64-=
rhel-7.6-475bfb4b00bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/i=
ntel_pstate/aperf
TAP version 13
1..1
# selftests: intel_pstate: run.sh
# cpupower: error while loading shared libraries: libcpupower.so.0: cannot =
open shared object file: No such file or directory
# ./run.sh: line 90: / 1000: syntax error: operand expected (error token is=
 "/ 1000")
# cpupower: error while loading shared libraries: libcpupower.so.0: cannot =
open shared object file: No such file or directory
# ./run.sh: line 92: / 1000: syntax error: operand expected (error token is=
 "/ 1000")
# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
# The marketing frequency of the cpu is 0 MHz
# The maximum frequency of the cpu is  MHz
# The minimum frequency of the cpu is  MHz
# Target	      Actual	    Difference	  MSR(0x199)	max_perf_pct
ok 1 selftests: intel_pstate: run.sh
make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00=
bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/intel_pstate'
2019-10-25 16:34:25 make run_tests -C ipc
make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b0=
0bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/ipc'
gcc -DCONFIG_X86_64 -D__x86_64__ -I../../../../usr/include/    msgque.c  -o=
 /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf16b59=
5cd61b/tools/testing/selftests/ipc/msgque
TAP version 13
1..1
# selftests: ipc: msgque
# # Pass 0 Fail 0 Xfail 0 Xpass 0 Skip 0 Error 0
ok 1 selftests: ipc: msgque
make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00=
bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/ipc'
ignored_by_lkp ir.ir_loopback_rcmm tests
2019-10-25 16:34:25 make run_tests -C ir
make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b0=
0bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/ir'
gcc -Wall -O2 -I../../../include/uapi    ir_loopback.c  -o /usr/src/perf_se=
lftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf16b595cd61b/tools/test=
ing/selftests/ir/ir_loopback
TAP version 13
1..1
# selftests: ir: ir_loopback.sh
# Sending IR on rc0 and receiving IR on rc0.
# Testing protocol rc-5 for decoder rc-5 (1/18)...
# Testing scancode:1f2a
# Testing scancode:1252
# Testing scancode:1614
# Testing scancode:b56
# Testing scancode:e14
# Testing scancode:1120
# Testing scancode:652
# Testing scancode:b15
# Testing scancode:146b
# Testing scancode:a73
# OK
# Testing protocol rc-5x-20 for decoder rc-5 (2/18)...
# Testing scancode:84a37
# Testing scancode:1b7311
# Testing scancode:1d1218
# Testing scancode:1f6c19
# Testing scancode:e5b01
# Testing scancode:94622
# Testing scancode:8030e
# Testing scancode:13411b
# Testing scancode:c6313
# Testing scancode:87b13
# OK
# Testing protocol rc-5-sz for decoder rc-5-sz (3/18)...
# Testing scancode:82b
# Testing scancode:2c7f
# Testing scancode:e85
# Testing scancode:159
# Testing scancode:543
# Testing scancode:f5b
# Testing scancode:15a
# Testing scancode:235f
# Testing scancode:23b0
# Testing scancode:531
# OK
# Testing protocol jvc for decoder jvc (4/18)...
# Testing scancode:58af
# Testing scancode:835a
# Testing scancode:8804
# Testing scancode:8f43
# Testing scancode:f31
# Testing scancode:5618
# Testing scancode:4063
# Testing scancode:7603
# Testing scancode:21ae
# Testing scancode:754f
# OK
# Testing protocol sony-12 for decoder sony (5/18)...
# Testing scancode:76
# Testing scancode:1e0025
# Testing scancode:e0060
# Testing scancode:1d000f
# Testing scancode:1d007e
# Testing scancode:1d0061
# Testing scancode:70031
# Testing scancode:6004c
# Testing scancode:10003d
# Testing scancode:140044
# OK
# Testing protocol sony-15 for decoder sony (6/18)...
# Testing scancode:ce001f
# Testing scancode:840068
# Testing scancode:760043
# Testing scancode:3c0025
# Testing scancode:9b0041
# Testing scancode:ee0006
# Testing scancode:2f0000
# Testing scancode:12001c
# Testing scancode:320066
# Testing scancode:870031
# OK
# Testing protocol sony-20 for decoder sony (7/18)...
# Testing scancode:12464d
# Testing scancode:c6b15
# Testing scancode:1dfd0b
# Testing scancode:6ce51
# Testing scancode:afa59
# Testing scancode:120c3c
# Testing scancode:f246a
# Testing scancode:183a3c
# Testing scancode:16823f
# Testing scancode:54618
# OK
# Testing protocol nec for decoder nec (8/18)...
# Testing scancode:b00b
# Testing scancode:e336
# Testing scancode:b2bd
# Testing scancode:18eb
# Testing scancode:d645
# Testing scancode:8bbb
# Testing scancode:5d4d
# Testing scancode:ff6
# Testing scancode:e887
# Testing scancode:e38a
# OK
# Testing protocol nec-x for decoder nec (9/18)...
# Testing scancode:d02d3a
# Testing scancode:96c0a7
# Testing scancode:eb01f2
# Testing scancode:46b6fd
# Testing scancode:d2f74c
# Testing scancode:8661b3
# Testing scancode:34d603
# Testing scancode:2cd4c
# Testing scancode:9912cf
# Testing scancode:66e869
# OK
# Testing protocol nec-32 for decoder nec (10/18)...
# Testing scancode:6d8a46fd
# Testing scancode:61ab591d
# Testing scancode:3113537f
# Testing scancode:6f684409
# Testing scancode:2bf2276e
# Testing scancode:ade4dd8
# Testing scancode:231a5045
# Testing scancode:62a14bd8
# Testing scancode:52968894
# Testing scancode:4670d285
# OK
# Testing protocol sanyo for decoder sanyo (11/18)...
# Testing scancode:691f0
# Testing scancode:138a0
# Testing scancode:7b5bb
# Testing scancode:a44ad
# Testing scancode:1a518b
# Testing scancode:1c8c00
# Testing scancode:bd068
# Testing scancode:10aed8
# Testing scancode:189bf6
# Testing scancode:13b8f0
# OK
# Testing protocol rc-6-0 for decoder rc-6 (12/18)...
# Testing scancode:9262
# Testing scancode:c930
# Testing scancode:7997
# Testing scancode:9454
# Testing scancode:802d
# Testing scancode:70e3
# Testing scancode:f608
# Testing scancode:5630
# Testing scancode:3e2f
# Testing scancode:8d7
# OK
# Testing protocol rc-6-6a-20 for decoder rc-6 (13/18)...
# Testing scancode:b3e9a
# Testing scancode:a852d
# Testing scancode:d61f4
# Testing scancode:e9219
# Testing scancode:2c936
# Testing scancode:f8963
# Testing scancode:cdff1
# Testing scancode:d197b
# Testing scancode:d53b
# Testing scancode:36885
# OK
# Testing protocol rc-6-6a-24 for decoder rc-6 (14/18)...
# Testing scancode:ddec00
# Testing scancode:27672c
# Testing scancode:54a125
# Testing scancode:c5a1bb
# Testing scancode:91abd9
# Testing scancode:4ef2b1
# Testing scancode:222dbb
# Testing scancode:bd7c42
# Testing scancode:dfa189
# Testing scancode:3ac9b1
# OK
# Testing protocol rc-6-6a-32 for decoder rc-6 (15/18)...
# Testing scancode:16b13532
# Testing scancode:7ed733ec
# Testing scancode:452392e1
# Testing scancode:7b3baec9
# Testing scancode:33b9c840
# Testing scancode:6153130e
# Testing scancode:1b991fac
# Testing scancode:f22be48
# Testing scancode:43b7693f
# Testing scancode:49f95ddb
# OK
# Testing protocol rc-6-mce for decoder rc-6 (16/18)...
# Testing scancode:800f4720
# Testing scancode:800f27d9
# Testing scancode:800f6308
# Testing scancode:800f2914
# Testing scancode:800f39f2
# Testing scancode:800f2c3e
# Testing scancode:800f3277
# Testing scancode:800f19e3
# Testing scancode:800f45ba
# Testing scancode:800f07b3
# OK
# Testing protocol sharp for decoder sharp (17/18)...
# Testing scancode:268
# Testing scancode:11ba
# Testing scancode:edf
# Testing scancode:38e
# Testing scancode:1376
# Testing scancode:1ab8
# Testing scancode:163f
# Testing scancode:131
# Testing scancode:16fa
# Testing scancode:17c8
# OK
# Testing protocol imon for decoder imon (18/18)...
# Testing scancode:2ea44ae3
# Testing scancode:6cda4c2c
# Testing scancode:21cbebb4
# Testing scancode:73c7ddc4
# Testing scancode:6815faf5
# Testing scancode:5585b3f5
# Testing scancode:551af0d3
# Testing scancode:3af1aa1
# Testing scancode:64a8723d
# Testing scancode:18d25a12
# OK
# # Planned tests !=3D run tests (0 !=3D 180)
# # Pass 180 Fail 0 Xfail 0 Xpass 0 Skip 0 Error 0
ok 1 selftests: ir: ir_loopback.sh
make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00=
bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/ir'
2019-10-25 16:34:35 make run_tests -C kcmp
make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b0=
0bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/kcmp'
gcc -I../../../../usr/include/    kcmp_test.c  -o /usr/src/perf_selftests-x=
86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf16b595cd61b/tools/testing/selft=
ests/kcmp/kcmp_test
TAP version 13
1..1
# selftests: kcmp: kcmp_test
# pid1:  17536 pid2:  17537 FD:  1 FILES:  2 VM:  1 FS:  2 SIGHAND:  1 IO: =
 0 SYSVSEM:  0 INV: -1
# PASS: 0 returned as expected
# PASS: 0 returned as expected
# PASS: 0 returned as expected
# # Planned tests !=3D run tests (0 !=3D 3)
# # Pass 3 Fail 0 Xfail 0 Xpass 0 Skip 0 Error 0
# # Planned tests !=3D run tests (0 !=3D 3)
# # Pass 3 Fail 0 Xfail 0 Xpass 0 Skip 0 Error 0
# # Pass 0 Fail 0 Xfail 0 Xpass 0 Skip 0 Error 0
ok 1 selftests: kcmp: kcmp_test
make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00=
bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/kcmp'
2019-10-25 16:34:35 make run_tests -C kexec
make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b0=
0bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/kexec'
TAP version 13
1..2
# selftests: kexec: test_kexec_load.sh
# [INFO] kexec_load is enabled
# [INFO] IMA enabled
# [INFO] efivars is not mounted on /sys/firmware/efi/efivars
# efi_vars is not enabled
#=20
not ok 1 selftests: kexec: test_kexec_load.sh # SKIP
# selftests: kexec: test_kexec_file_load.sh
# [INFO] kexec_file_load is enabled
# [INFO] IMA enabled
# [INFO] efivars is not mounted on /sys/firmware/efi/efivars
# efi_vars is not enabled
#=20
not ok 2 selftests: kexec: test_kexec_file_load.sh # SKIP
make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00=
bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/kexec'
kmod test: not in Makefile
2019-10-25 16:34:36 make TARGETS=3Dkmod
make --no-builtin-rules ARCH=3Dx86 -C ../../.. headers_install
make[1]: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb=
4b00bc0f91400ac501f7edf16b595cd61b'
  INSTALL ./usr/include
make[1]: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4=
b00bc0f91400ac501f7edf16b595cd61b'
make[1]: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb=
4b00bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/kmod'
make[1]: Nothing to be done for 'all'.
make[1]: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4=
b00bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/kmod'
2019-10-25 16:34:36 make run_tests -C kmod
make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b0=
0bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/kmod'
TAP version 13
1..1
# selftests: kmod: kmod.sh
# Fri Oct 25 16:34:37 CST 2019
# Running test: kmod_test_0001 - run #0
# kmod_test_0001_driver: OK! - loading kmod test
# kmod_test_0001_driver: OK! - Return value: 256 (MODULE_NOT_FOUND), expect=
ed MODULE_NOT_FOUND
# kmod_test_0001_fs: OK! - loading kmod test
# kmod_test_0001_fs: OK! - Return value: -22 (-EINVAL), expected -EINVAL
# Fri Oct 25 16:34:37 CST 2019
# Running test: kmod_test_0001 - run #1
# kmod_test_0001_driver: OK! - loading kmod test
# kmod_test_0001_driver: OK! - Return value: 256 (MODULE_NOT_FOUND), expect=
ed MODULE_NOT_FOUND
# kmod_test_0001_fs: OK! - loading kmod test
# kmod_test_0001_fs: OK! - Return value: -22 (-EINVAL), expected -EINVAL
# Fri Oct 25 16:34:37 CST 2019
# Running test: kmod_test_0001 - run #2
# kmod_test_0001_driver: OK! - loading kmod test
# kmod_test_0001_driver: OK! - Return value: 256 (MODULE_NOT_FOUND), expect=
ed MODULE_NOT_FOUND
# kmod_test_0001_fs: OK! - loading kmod test
# kmod_test_0001_fs: OK! - Return value: -22 (-EINVAL), expected -EINVAL
# Fri Oct 25 16:34:37 CST 2019
# Running test: kmod_test_0002 - run #0
# kmod_test_0002_driver: OK! - loading kmod test
# kmod_test_0002_driver: OK! - Return value: 256 (MODULE_NOT_FOUND), expect=
ed MODULE_NOT_FOUND
# kmod_test_0002_fs: OK! - loading kmod test
# kmod_test_0002_fs: OK! - Return value: -22 (-EINVAL), expected -EINVAL
# Fri Oct 25 16:34:37 CST 2019
# Running test: kmod_test_0002 - run #1
# kmod_test_0002_driver: OK! - loading kmod test
# kmod_test_0002_driver: OK! - Return value: 256 (MODULE_NOT_FOUND), expect=
ed MODULE_NOT_FOUND
# kmod_test_0002_fs: OK! - loading kmod test
# kmod_test_0002_fs: OK! - Return value: -22 (-EINVAL), expected -EINVAL
# Fri Oct 25 16:34:37 CST 2019
# Running test: kmod_test_0002 - run #2
# kmod_test_0002_driver: OK! - loading kmod test
# kmod_test_0002_driver: OK! - Return value: 256 (MODULE_NOT_FOUND), expect=
ed MODULE_NOT_FOUND
# kmod_test_0002_fs: OK! - loading kmod test
# kmod_test_0002_fs: OK! - Return value: -22 (-EINVAL), expected -EINVAL
# Fri Oct 25 16:34:37 CST 2019
# Running test: kmod_test_0003 - run #0
# kmod_test_0003: OK! - loading kmod test
# kmod_test_0003: OK! - Return value: 0 (SUCCESS), expected SUCCESS
# Fri Oct 25 16:34:37 CST 2019
# Running test: kmod_test_0004 - run #0
# kmod_test_0004: OK! - loading kmod test
# kmod_test_0004: OK! - Return value: 0 (SUCCESS), expected SUCCESS
# Fri Oct 25 16:34:37 CST 2019
# Running test: kmod_test_0005 - run #0
# kmod_test_0005: OK! - loading kmod test
# kmod_test_0005: OK! - Return value: 0 (SUCCESS), expected SUCCESS
# Fri Oct 25 16:34:38 CST 2019
# Running test: kmod_test_0005 - run #1
# kmod_test_0005: OK! - loading kmod test
# kmod_test_0005: OK! - Return value: 0 (SUCCESS), expected SUCCESS
# Fri Oct 25 16:34:38 CST 2019
# Running test: kmod_test_0005 - run #2
# kmod_test_0005: OK! - loading kmod test
# kmod_test_0005: OK! - Return value: 0 (SUCCESS), expected SUCCESS
# Fri Oct 25 16:34:38 CST 2019
# Running test: kmod_test_0005 - run #3
# kmod_test_0005: OK! - loading kmod test
# kmod_test_0005: OK! - Return value: 0 (SUCCESS), expected SUCCESS
# Fri Oct 25 16:34:38 CST 2019
# Running test: kmod_test_0005 - run #4
# kmod_test_0005: OK! - loading kmod test
# kmod_test_0005: OK! - Return value: 0 (SUCCESS), expected SUCCESS
# Fri Oct 25 16:34:38 CST 2019
# Running test: kmod_test_0005 - run #5
# kmod_test_0005: OK! - loading kmod test
# kmod_test_0005: OK! - Return value: 0 (SUCCESS), expected SUCCESS
# Fri Oct 25 16:34:38 CST 2019
# Running test: kmod_test_0005 - run #6
# kmod_test_0005: OK! - loading kmod test
# kmod_test_0005: OK! - Return value: 0 (SUCCESS), expected SUCCESS
# Fri Oct 25 16:34:38 CST 2019
# Running test: kmod_test_0005 - run #7
# kmod_test_0005: OK! - loading kmod test
# kmod_test_0005: OK! - Return value: 0 (SUCCESS), expected SUCCESS
# Fri Oct 25 16:34:38 CST 2019
# Running test: kmod_test_0005 - run #8
# kmod_test_0005: OK! - loading kmod test
# kmod_test_0005: OK! - Return value: 0 (SUCCESS), expected SUCCESS
# Fri Oct 25 16:34:39 CST 2019
# Running test: kmod_test_0005 - run #9
# kmod_test_0005: OK! - loading kmod test
# kmod_test_0005: OK! - Return value: 0 (SUCCESS), expected SUCCESS
# Fri Oct 25 16:34:39 CST 2019
# Running test: kmod_test_0006 - run #0
# kmod_test_0006: OK! - loading kmod test
# kmod_test_0006: OK! - Return value: 0 (SUCCESS), expected SUCCESS
# Fri Oct 25 16:34:41 CST 2019
# Running test: kmod_test_0006 - run #1
# kmod_test_0006: OK! - loading kmod test
# kmod_test_0006: OK! - Return value: 0 (SUCCESS), expected SUCCESS
# Fri Oct 25 16:34:43 CST 2019
# Running test: kmod_test_0006 - run #2
# kmod_test_0006: OK! - loading kmod test
# kmod_test_0006: OK! - Return value: 0 (SUCCESS), expected SUCCESS
# Fri Oct 25 16:34:44 CST 2019
# Running test: kmod_test_0006 - run #3
# kmod_test_0006: OK! - loading kmod test
# kmod_test_0006: OK! - Return value: 0 (SUCCESS), expected SUCCESS
# Fri Oct 25 16:34:46 CST 2019
# Running test: kmod_test_0006 - run #4
# kmod_test_0006: OK! - loading kmod test
# kmod_test_0006: OK! - Return value: 0 (SUCCESS), expected SUCCESS
# Fri Oct 25 16:34:47 CST 2019
# Running test: kmod_test_0006 - run #5
# kmod_test_0006: OK! - loading kmod test
# kmod_test_0006: OK! - Return value: 0 (SUCCESS), expected SUCCESS
# Fri Oct 25 16:34:47 CST 2019
# Running test: kmod_test_0006 - run #6
# kmod_test_0006: OK! - loading kmod test
# kmod_test_0006: OK! - Return value: 0 (SUCCESS), expected SUCCESS
# Fri Oct 25 16:34:49 CST 2019
# Running test: kmod_test_0006 - run #7
# kmod_test_0006: OK! - loading kmod test
# kmod_test_0006: OK! - Return value: 0 (SUCCESS), expected SUCCESS
# Fri Oct 25 16:34:49 CST 2019
# Running test: kmod_test_0006 - run #8
# kmod_test_0006: OK! - loading kmod test
# kmod_test_0006: OK! - Return value: 0 (SUCCESS), expected SUCCESS
# Fri Oct 25 16:34:50 CST 2019
# Running test: kmod_test_0006 - run #9
# kmod_test_0006: OK! - loading kmod test
# kmod_test_0006: OK! - Return value: 0 (SUCCESS), expected SUCCESS
# Fri Oct 25 16:34:51 CST 2019
# Running test: kmod_test_0007 - run #0
# kmod_test_0005: OK! - loading kmod test
# kmod_test_0005: OK! - Return value: 0 (SUCCESS), expected SUCCESS
# kmod_test_0006: OK! - loading kmod test
# kmod_test_0006: OK! - Return value: 0 (SUCCESS), expected SUCCESS
# Fri Oct 25 16:34:55 CST 2019
# Running test: kmod_test_0007 - run #1
# kmod_test_0005: OK! - loading kmod test
# kmod_test_0005: OK! - Return value: 0 (SUCCESS), expected SUCCESS
# kmod_test_0006: OK! - loading kmod test
# kmod_test_0006: OK! - Return value: 0 (SUCCESS), expected SUCCESS
# Fri Oct 25 16:34:58 CST 2019
# Running test: kmod_test_0007 - run #2
# kmod_test_0005: OK! - loading kmod test
# kmod_test_0005: OK! - Return value: 0 (SUCCESS), expected SUCCESS
# kmod_test_0006: OK! - loading kmod test
# kmod_test_0006: OK! - Return value: 0 (SUCCESS), expected SUCCESS
# Fri Oct 25 16:35:01 CST 2019
# Running test: kmod_test_0007 - run #3
# kmod_test_0005: OK! - loading kmod test
# kmod_test_0005: OK! - Return value: 0 (SUCCESS), expected SUCCESS
# kmod_test_0006: OK! - loading kmod test
# kmod_test_0006: OK! - Return value: 0 (SUCCESS), expected SUCCESS
# Fri Oct 25 16:35:05 CST 2019
# Running test: kmod_test_0007 - run #4
# kmod_test_0005: OK! - loading kmod test
# kmod_test_0005: OK! - Return value: 0 (SUCCESS), expected SUCCESS
# kmod_test_0006: OK! - loading kmod test
# kmod_test_0006: OK! - Return value: 0 (SUCCESS), expected SUCCESS
# ./kmod.sh: line 529: [[: 1 0002:3:1 0003:1:1 0004:1:1 0005:10:1 0006:10:1=
 0007:5:1 0008:150:1 0009:150:1: syntax error in expression (error token is=
 "0002:3:1 0003:1:1 0004:1:1 0005:10:1 0006:10:1 0007:5:1 0008:150:1 0009:1=
50:1")
# ./kmod.sh: line 529: [[: 1 0002:3:1 0003:1:1 0004:1:1 0005:10:1 0006:10:1=
 0007:5:1 0008:150:1 0009:150:1: syntax error in expression (error token is=
 "0002:3:1 0003:1:1 0004:1:1 0005:10:1 0006:10:1 0007:5:1 0008:150:1 0009:1=
50:1")
# Test completed
ok 1 selftests: kmod: kmod.sh
make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00=
bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/kmod'
2019-10-25 16:35:08 make run_tests -C kvm
make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b0=
0bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/kvm'
make --no-builtin-rules ARCH=3Dx86 -C ../../../.. headers_install
make[1]: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb=
4b00bc0f91400ac501f7edf16b595cd61b'
  INSTALL ./usr/include
make[1]: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4=
b00bc0f91400ac501f7edf16b595cd61b'
gcc -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=3Dgnu99 -fno-stac=
k-protector -fno-PIE -I../../../../tools/include -I../../../../usr/include/=
 -Iinclude -Ilib -Iinclude/x86_64 -I..   -c lib/assert.c -o /usr/src/perf_s=
elftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf16b595cd61b/tools/tes=
ting/selftests/kvm/lib/assert.o
gcc -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=3Dgnu99 -fno-stac=
k-protector -fno-PIE -I../../../../tools/include -I../../../../usr/include/=
 -Iinclude -Ilib -Iinclude/x86_64 -I..   -c lib/elf.c -o /usr/src/perf_self=
tests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf16b595cd61b/tools/testin=
g/selftests/kvm/lib/elf.o
gcc -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=3Dgnu99 -fno-stac=
k-protector -fno-PIE -I../../../../tools/include -I../../../../usr/include/=
 -Iinclude -Ilib -Iinclude/x86_64 -I..   -c lib/io.c -o /usr/src/perf_selft=
ests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf16b595cd61b/tools/testing=
/selftests/kvm/lib/io.o
gcc -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=3Dgnu99 -fno-stac=
k-protector -fno-PIE -I../../../../tools/include -I../../../../usr/include/=
 -Iinclude -Ilib -Iinclude/x86_64 -I..   -c lib/kvm_util.c -o /usr/src/perf=
_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf16b595cd61b/tools/t=
esting/selftests/kvm/lib/kvm_util.o
gcc -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=3Dgnu99 -fno-stac=
k-protector -fno-PIE -I../../../../tools/include -I../../../../usr/include/=
 -Iinclude -Ilib -Iinclude/x86_64 -I..   -c lib/sparsebit.c -o /usr/src/per=
f_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf16b595cd61b/tools/=
testing/selftests/kvm/lib/sparsebit.o
gcc -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=3Dgnu99 -fno-stac=
k-protector -fno-PIE -I../../../../tools/include -I../../../../usr/include/=
 -Iinclude -Ilib/x86_64 -Iinclude/x86_64 -I..   -c lib/x86_64/processor.c -=
o /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf16b5=
95cd61b/tools/testing/selftests/kvm/lib/x86_64/processor.o
gcc -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=3Dgnu99 -fno-stac=
k-protector -fno-PIE -I../../../../tools/include -I../../../../usr/include/=
 -Iinclude -Ilib/x86_64 -Iinclude/x86_64 -I..   -c lib/x86_64/vmx.c -o /usr=
/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf16b595cd61=
b/tools/testing/selftests/kvm/lib/x86_64/vmx.o
gcc -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=3Dgnu99 -fno-stac=
k-protector -fno-PIE -I../../../../tools/include -I../../../../usr/include/=
 -Iinclude -Ilib/x86_64 -Iinclude/x86_64 -I..   -c lib/x86_64/ucall.c -o /u=
sr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf16b595cd=
61b/tools/testing/selftests/kvm/lib/x86_64/ucall.o
ar crs /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7ed=
f16b595cd61b/tools/testing/selftests/kvm/libkvm.a /usr/src/perf_selftests-x=
86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf16b595cd61b/tools/testing/selft=
ests/kvm/lib/assert.o /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0=
f91400ac501f7edf16b595cd61b/tools/testing/selftests/kvm/lib/elf.o /usr/src/=
perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf16b595cd61b/too=
ls/testing/selftests/kvm/lib/io.o /usr/src/perf_selftests-x86_64-rhel-7.6-4=
75bfb4b00bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/kvm/lib/kvm=
_util.o /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7e=
df16b595cd61b/tools/testing/selftests/kvm/lib/sparsebit.o /usr/src/perf_sel=
ftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf16b595cd61b/tools/testi=
ng/selftests/kvm/lib/x86_64/processor.o /usr/src/perf_selftests-x86_64-rhel=
-7.6-475bfb4b00bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/kvm/l=
ib/x86_64/vmx.o /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400=
ac501f7edf16b595cd61b/tools/testing/selftests/kvm/lib/x86_64/ucall.o
gcc -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=3Dgnu99 -fno-stac=
k-protector -fno-PIE -I../../../../tools/include -I../../../../usr/include/=
 -Iinclude -Ix86_64 -Iinclude/x86_64 -I..  -pthread  -no-pie   x86_64/cr4_c=
puid_sync_test.c /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f9140=
0ac501f7edf16b595cd61b/tools/testing/selftests/kvm/libkvm.a  -o /usr/src/pe=
rf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf16b595cd61b/tools=
/testing/selftests/kvm/x86_64/cr4_cpuid_sync_test
gcc -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=3Dgnu99 -fno-stac=
k-protector -fno-PIE -I../../../../tools/include -I../../../../usr/include/=
 -Iinclude -Ix86_64 -Iinclude/x86_64 -I..  -pthread  -no-pie   x86_64/evmcs=
_test.c /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7e=
df16b595cd61b/tools/testing/selftests/kvm/libkvm.a  -o /usr/src/perf_selfte=
sts-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf16b595cd61b/tools/testing/=
selftests/kvm/x86_64/evmcs_test
gcc -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=3Dgnu99 -fno-stac=
k-protector -fno-PIE -I../../../../tools/include -I../../../../usr/include/=
 -Iinclude -Ix86_64 -Iinclude/x86_64 -I..  -pthread  -no-pie   x86_64/hyper=
v_cpuid.c /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f=
7edf16b595cd61b/tools/testing/selftests/kvm/libkvm.a  -o /usr/src/perf_self=
tests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf16b595cd61b/tools/testin=
g/selftests/kvm/x86_64/hyperv_cpuid
gcc -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=3Dgnu99 -fno-stac=
k-protector -fno-PIE -I../../../../tools/include -I../../../../usr/include/=
 -Iinclude -Ix86_64 -Iinclude/x86_64 -I..  -pthread  -no-pie   x86_64/mmio_=
warning_test.c /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400a=
c501f7edf16b595cd61b/tools/testing/selftests/kvm/libkvm.a  -o /usr/src/perf=
_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf16b595cd61b/tools/t=
esting/selftests/kvm/x86_64/mmio_warning_test
gcc -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=3Dgnu99 -fno-stac=
k-protector -fno-PIE -I../../../../tools/include -I../../../../usr/include/=
 -Iinclude -Ix86_64 -Iinclude/x86_64 -I..  -pthread  -no-pie   x86_64/platf=
orm_info_test.c /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400=
ac501f7edf16b595cd61b/tools/testing/selftests/kvm/libkvm.a  -o /usr/src/per=
f_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf16b595cd61b/tools/=
testing/selftests/kvm/x86_64/platform_info_test
gcc -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=3Dgnu99 -fno-stac=
k-protector -fno-PIE -I../../../../tools/include -I../../../../usr/include/=
 -Iinclude -Ix86_64 -Iinclude/x86_64 -I..  -pthread  -no-pie   x86_64/set_s=
regs_test.c /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac50=
1f7edf16b595cd61b/tools/testing/selftests/kvm/libkvm.a  -o /usr/src/perf_se=
lftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf16b595cd61b/tools/test=
ing/selftests/kvm/x86_64/set_sregs_test
gcc -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=3Dgnu99 -fno-stac=
k-protector -fno-PIE -I../../../../tools/include -I../../../../usr/include/=
 -Iinclude -Ix86_64 -Iinclude/x86_64 -I..  -pthread  -no-pie   x86_64/smm_t=
est.c /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf=
16b595cd61b/tools/testing/selftests/kvm/libkvm.a  -o /usr/src/perf_selftest=
s-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf16b595cd61b/tools/testing/se=
lftests/kvm/x86_64/smm_test
gcc -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=3Dgnu99 -fno-stac=
k-protector -fno-PIE -I../../../../tools/include -I../../../../usr/include/=
 -Iinclude -Ix86_64 -Iinclude/x86_64 -I..  -pthread  -no-pie   x86_64/state=
_test.c /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7e=
df16b595cd61b/tools/testing/selftests/kvm/libkvm.a  -o /usr/src/perf_selfte=
sts-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf16b595cd61b/tools/testing/=
selftests/kvm/x86_64/state_test
gcc -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=3Dgnu99 -fno-stac=
k-protector -fno-PIE -I../../../../tools/include -I../../../../usr/include/=
 -Iinclude -Ix86_64 -Iinclude/x86_64 -I..  -pthread  -no-pie   x86_64/sync_=
regs_test.c /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac50=
1f7edf16b595cd61b/tools/testing/selftests/kvm/libkvm.a  -o /usr/src/perf_se=
lftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf16b595cd61b/tools/test=
ing/selftests/kvm/x86_64/sync_regs_test
gcc -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=3Dgnu99 -fno-stac=
k-protector -fno-PIE -I../../../../tools/include -I../../../../usr/include/=
 -Iinclude -Ix86_64 -Iinclude/x86_64 -I..  -pthread  -no-pie   x86_64/vmx_c=
lose_while_nested_test.c /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00=
bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/kvm/libkvm.a  -o /us=
r/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf16b595cd6=
1b/tools/testing/selftests/kvm/x86_64/vmx_close_while_nested_test
gcc -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=3Dgnu99 -fno-stac=
k-protector -fno-PIE -I../../../../tools/include -I../../../../usr/include/=
 -Iinclude -Ix86_64 -Iinclude/x86_64 -I..  -pthread  -no-pie   x86_64/vmx_d=
irty_log_test.c /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400=
ac501f7edf16b595cd61b/tools/testing/selftests/kvm/libkvm.a  -o /usr/src/per=
f_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf16b595cd61b/tools/=
testing/selftests/kvm/x86_64/vmx_dirty_log_test
gcc -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=3Dgnu99 -fno-stac=
k-protector -fno-PIE -I../../../../tools/include -I../../../../usr/include/=
 -Iinclude -Ix86_64 -Iinclude/x86_64 -I..  -pthread  -no-pie   x86_64/vmx_s=
et_nested_state_test.c /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc=
0f91400ac501f7edf16b595cd61b/tools/testing/selftests/kvm/libkvm.a  -o /usr/=
src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf16b595cd61b=
/tools/testing/selftests/kvm/x86_64/vmx_set_nested_state_test
gcc -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=3Dgnu99 -fno-stac=
k-protector -fno-PIE -I../../../../tools/include -I../../../../usr/include/=
 -Iinclude -Ix86_64 -Iinclude/x86_64 -I..  -pthread  -no-pie   x86_64/vmx_t=
sc_adjust_test.c /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f9140=
0ac501f7edf16b595cd61b/tools/testing/selftests/kvm/libkvm.a  -o /usr/src/pe=
rf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf16b595cd61b/tools=
/testing/selftests/kvm/x86_64/vmx_tsc_adjust_test
gcc -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=3Dgnu99 -fno-stac=
k-protector -fno-PIE -I../../../../tools/include -I../../../../usr/include/=
 -Iinclude -I. -Iinclude/x86_64 -I..  -pthread  -no-pie   clear_dirty_log_t=
est.c /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf=
16b595cd61b/tools/testing/selftests/kvm/libkvm.a  -o /usr/src/perf_selftest=
s-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf16b595cd61b/tools/testing/se=
lftests/kvm/clear_dirty_log_test
gcc -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=3Dgnu99 -fno-stac=
k-protector -fno-PIE -I../../../../tools/include -I../../../../usr/include/=
 -Iinclude -I. -Iinclude/x86_64 -I..  -pthread  -no-pie   dirty_log_test.c =
/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf16b595=
cd61b/tools/testing/selftests/kvm/libkvm.a  -o /usr/src/perf_selftests-x86_=
64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf16b595cd61b/tools/testing/selftest=
s/kvm/dirty_log_test
gcc -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=3Dgnu99 -fno-stac=
k-protector -fno-PIE -I../../../../tools/include -I../../../../usr/include/=
 -Iinclude -I. -Iinclude/x86_64 -I..  -pthread  -no-pie   kvm_create_max_vc=
pus.c /usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf=
16b595cd61b/tools/testing/selftests/kvm/libkvm.a  -o /usr/src/perf_selftest=
s-x86_64-rhel-7.6-475bfb4b00bc0f91400ac501f7edf16b595cd61b/tools/testing/se=
lftests/kvm/kvm_create_max_vcpus
TAP version 13
1..16
# selftests: kvm: cr4_cpuid_sync_test
not ok 1 selftests: kvm: cr4_cpuid_sync_test # SKIP
# selftests: kvm: evmcs_test
# Testing guest mode: PA-bits:ANY, VA-bits:48,  4K pages
not ok 2 selftests: kvm: evmcs_test # SKIP
# selftests: kvm: hyperv_cpuid
not ok 3 selftests: kvm: hyperv_cpuid # SKIP
# selftests: kvm: mmio_warning_test
# =3D=3D=3D=3D Test Assertion Failure =3D=3D=3D=3D
#   lib/kvm_util.c:1642: f !=3D NULL
#   pid=3D22848 tid=3D22848 - No such file or directory
#      1	0x0000000000403cce: vm_is_unrestricted_guest at kvm_util.c:1641
#      2	0x00000000004011e7: main at mmio_warning_test.c:100
#      3	0x00007f723a5fbbba: ?? ??:0
#      4	0x00000000004012c9: _start at ??:?
#   Error in opening KVM dev file: 2
not ok 4 selftests: kvm: mmio_warning_test # exit=3D254
# selftests: kvm: platform_info_test
not ok 5 selftests: kvm: platform_info_test # SKIP
# selftests: kvm: set_sregs_test
# Testing guest mode: PA-bits:ANY, VA-bits:48,  4K pages
not ok 6 selftests: kvm: set_sregs_test # SKIP
# selftests: kvm: smm_test
# Testing guest mode: PA-bits:ANY, VA-bits:48,  4K pages
not ok 7 selftests: kvm: smm_test # SKIP
# selftests: kvm: state_test
# Testing guest mode: PA-bits:ANY, VA-bits:48,  4K pages
not ok 8 selftests: kvm: state_test # SKIP
# selftests: kvm: sync_regs_test
not ok 9 selftests: kvm: sync_regs_test # SKIP
# selftests: kvm: vmx_close_while_nested_test
not ok 10 selftests: kvm: vmx_close_while_nested_test # SKIP
# selftests: kvm: vmx_dirty_log_test
# Testing guest mode: PA-bits:ANY, VA-bits:48,  4K pages
not ok 11 selftests: kvm: vmx_dirty_log_test # SKIP
# selftests: kvm: vmx_set_nested_state_test
not ok 12 selftests: kvm: vmx_set_nested_state_test # SKIP
# selftests: kvm: vmx_tsc_adjust_test
not ok 13 selftests: kvm: vmx_tsc_adjust_test # SKIP
# selftests: kvm: clear_dirty_log_test
not ok 14 selftests: kvm: clear_dirty_log_test # SKIP
# selftests: kvm: dirty_log_test
# Test iterations: 32, interval: 10 (ms)
# Testing guest mode: PA-bits:ANY, VA-bits:48,  4K pages
not ok 15 selftests: kvm: dirty_log_test # SKIP
# selftests: kvm: kvm_create_max_vcpus
not ok 16 selftests: kvm: kvm_create_max_vcpus # SKIP
make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00=
bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/kvm'
2019-10-25 16:35:13 make run_tests -C lib
make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b0=
0bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/lib'
TAP version 13
1..4
# selftests: lib: printf.sh
# printf: ok
ok 1 selftests: lib: printf.sh
# selftests: lib: bitmap.sh
# bitmap: ok
ok 2 selftests: lib: bitmap.sh
# selftests: lib: prime_numbers.sh
# prime numbers: ok
ok 3 selftests: lib: prime_numbers.sh
# selftests: lib: strscpy.sh
# strscpy*: ok
ok 4 selftests: lib: strscpy.sh
make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00=
bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/lib'
locking test: not in Makefile
2019-10-25 16:35:14 make TARGETS=3Dlocking
make --no-builtin-rules ARCH=3Dx86 -C ../../.. headers_install
make[1]: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb=
4b00bc0f91400ac501f7edf16b595cd61b'
  INSTALL ./usr/include
make[1]: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4=
b00bc0f91400ac501f7edf16b595cd61b'
make[1]: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb=
4b00bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/locking'
make[1]: Nothing to be done for 'all'.
make[1]: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4=
b00bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/locking'
2019-10-25 16:35:14 make run_tests -C locking
make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b0=
0bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/locking'
TAP version 13
1..1
# selftests: locking: ww_mutex.sh
# locking/ww_mutex: ok
ok 1 selftests: locking: ww_mutex.sh
make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.6-475bfb4b00=
bc0f91400ac501f7edf16b595cd61b/tools/testing/selftests/locking'

--m51xatjYGsM+13rf
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--m51xatjYGsM+13rf--
