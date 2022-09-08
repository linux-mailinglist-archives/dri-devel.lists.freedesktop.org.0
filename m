Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9435B23AD
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 18:36:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BEEF10EB65;
	Thu,  8 Sep 2022 16:35:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41AE410EB65;
 Thu,  8 Sep 2022 16:35:52 +0000 (UTC)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-1278624b7c4so27597806fac.5; 
 Thu, 08 Sep 2022 09:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=hLpP2vLkmHAkBu72Xw/qw4Y2ARx5ZEgjqG2GkL6yFHQ=;
 b=Zz2Th2hgem5aVGa3nejylF4M27MKZ2zYaHzgHyetcSyY92ICnt/y3EOhs+3w0Ejjl6
 5wnBVrPk0tX1mkkgU8uxCoFCGT5NnueyvihHqTof+bvqvWRYyMgXmYYl3/bro1aLjl/I
 oT58Ui/n1DkaT6+yfABSOUofYbWU2wZWVeuztKjrYLcixXc5J1kuaXgsOetMW5TA5m3N
 8gq7G8b3fwjqtUp9S1kB2XpirjT3QQgLJlZGpd/djY5Xm4jRGHPgYip6pxGmSSEF8MWU
 l4pXVyY3eNkFPTTJ/FqvN0r3Vf8s8m9K0TjvPdZyhxLIvdyEzUn3IKHDC9hhryHjkDND
 oQlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=hLpP2vLkmHAkBu72Xw/qw4Y2ARx5ZEgjqG2GkL6yFHQ=;
 b=gT6eYB57lkY95a6OGUxcr7MCoInX+eRL4KF/H8JDEzwvYcRtEcqxcUTFuQr6a9d9Av
 GI85205wCCmUmFy45FJLUOK8wUUeIUP/EJ3+IJ6b4t/F96wuhYQ4oOtw6VuosdF8gFGj
 7mzPLXuasBatRj9rLH0/0wU7nQv/1111xH21HdkhE0YyvKuUGwBn7ls9j7KJwGrLIOe6
 0Ecih5oB/w0G/W01tsMmJl9QtK4leSCuNcmkCMnlZzzrWSTyNvpwpGQNyTBMZuEAfbao
 9TBb5mTAeynuTj/HkuLBnlvD0KDvHi72y8qnVCNp1r7nHTyrP9UpVQacsXXsjVvLS/i4
 pcHQ==
X-Gm-Message-State: ACgBeo0397nfeVokQKXfWJ/ABiWtGpejBagORf4+AWlLdrja8cgPKEvR
 jVBsCl4zawfS8JW7RuF9ggeLFioiYP/xxlLQvdo=
X-Google-Smtp-Source: AA6agR585X+jR4CaVmzjDB8XBTGKuPTWUb3oeghzVyypz6C8tOdELpC3b3SAjqPLRxvBPeoG07B7jFUddZdsDJRfLN0=
X-Received: by 2002:a05:6808:2187:b0:344:eccd:3fc5 with SMTP id
 be7-20020a056808218700b00344eccd3fc5mr1992661oib.46.1662654951141; Thu, 08
 Sep 2022 09:35:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220908155202.57862-1-alexander.deucher@amd.com>
 <2b5b57e7-9f81-45c4-1375-4577d3854bbd@amd.com>
In-Reply-To: <2b5b57e7-9f81-45c4-1375-4577d3854bbd@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 8 Sep 2022 12:35:39 -0400
Message-ID: <CADnq5_PE_i-E7gLKOZh34U=Z9B7gV7EN6eaC5fuJ3EMdWhKkoQ@mail.gmail.com>
Subject: Re: [pull] amdgpu, amdkfd, radeon, drm drm-next-6.1
To: Felix Kuehling <felix.kuehling@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, daniel.vetter@ffwll.ch,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 8, 2022 at 12:29 PM Felix Kuehling <felix.kuehling@amd.com> wro=
te:
>
>
> On 2022-09-08 11:52, Alex Deucher wrote:
> > Hi Dave, Daniel,
> >
> > New stuff for 6.1.
> >
> > The following changes since commit 085292c3d78015412b752ee1ca4c7725fd2b=
f2fc:
> >
> >    Revert "drm/amd/amdgpu: add pipe1 hardware support" (2022-08-16 18:1=
4:31 -0400)
> >
> > are available in the Git repository at:
> >
> >    https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.1=
-2022-09-08
> >
> > for you to fetch changes up to 780244a2fe8a82424c85f4cb15e45d0bbeec8f26=
:
> >
> >    drm/amd/amdgpu: Add missing CGTS*TCC_DISABLE to 10.3 headers (2022-0=
9-07 22:28:42 -0400)
> >
> > ----------------------------------------------------------------
> > amd-drm-next-6.1-2022-09-08:
> >
> > amdgpu:
> > - Mode2 reset for RDNA2
> > - Lots of new DC documentation
> > - Add documentation about different asic families
> > - DSC improvements
> > - Aldebaran fixes
> > - Misc spelling and grammar fixes
> > - GFXOFF stats support for vangogh
> > - DC frame size fixes
> > - NBIO 7.7 updates
> > - DCN 3.2 updates
> > - DCN 3.1.4 Updates
> > - SMU 13.x updates
> > - Misc bug fixes
> > - Rework DC register offset handling
> > - GC 11.x updates
> > - PSP 13.x updates
> > - SDMA 6.x updates
> > - GMC 11.x updates
> > - SR-IOV updates
> > - PSP fixes for TA unloading
> > - DSC passthrough support
> > - Misc code cleanups
> >
> > amdkfd:
> > - ISA fixes for some GC 10.3 IPs
> > - Misc code cleanups
> >
> > radeon:
> > - Delayed work flush fix
> > - Use time_after for some jiffies calculations
> >
> > drm:
> > - DSC passthrough aux support
> >
> > ----------------------------------------------------------------
> > Alex Deucher (1):
> >        drm/amd/display: fix documentation for amdgpu_dm_update_freesync=
_caps()
> >
> > Alex Sierra (1):
> >        drm/amdgpu: ensure no PCIe peer access for CPU XGMI iolinks
> >
> > Alvin Lee (6):
> >        drm/amd/display: Free phantom plane and stream properly
> >        drm/amd/display: Add interface to track PHY state
> >        drm/amd/display: Uncomment SubVP scaling case
> >        drm/amd/display: Don't choose SubVP display if ActiveMargin > 0
> >        drm/amd/display: Only commit SubVP state after pipe programming
> >        drm/amd/display: SubVP missing scaling case
> >
> > Andr=C3=A9 Almeida (4):
> >        drm/amd: Add detailed GFXOFF stats to debugfs
> >        drm/amd/pm: Implement GFXOFF's entry count and residency for van=
gogh
> >        Documentation/gpu: Document GFXOFF's count and residency
> >        drm/amdgpu: Document gfx_off members of struct amdgpu_gfx
> >
> > Anthony Koo (2):
> >        drm/amd/display: [FW Promotion] Release 0.0.130.0
> >        drm/amd/display: [FW Promotion] Release 0.0.132.0
> >
> > Aric Cyr (3):
> >        drm/amd/display: 3.2.199
> >        drm/amd/display: 3.2.200
> >        drm/amd/display: 3.2.201
> >
> > Asher Song (1):
> >        drm/amd/display: remove a duplicated declaration
> >
> > Aurabindo Pillai (8):
> >        drm/amd/display: change to runtime initialization for reg offset=
s for DCN32
> >        drm/amd/display: change to runtime initialization for reg offset=
s for DCN321
> >        drm/amd/display: program k1/k2 divider for virtual signal for DC=
N32
> >        drm/amd/display: Fix CAB cursor size allocation for DCN32/321
> >        drm/amd/display: disable display fresh from MALL on an edge case=
 for DCN321
> >        drm/amd/display: use actual cursor size instead of max for CAB a=
llocation
> >        drm/amd/display: Revert "program k1/k2 divider for virtual signa=
l for DCN32"
> >        drm/amd/display: Use correct plane for CAB cursor size allocatio=
n
> >
> > Bernard Zhao (4):
> >        drm/amd: fix potential memory leak
> >        drm/amd: fix potential memory leak
> >        drm/amd: remove possible condition with no effect (if =3D=3D els=
e)
> >        drm/amd: remove possible condition with no effect (if =3D=3D els=
e)
> >
> > Candice Li (1):
> >        drm/amdgpu: Check num_gfx_rings for gfx v9_0 rb setup.
> >
> > Charlene Liu (1):
> >        drm/amd/display: fix wrong register access
> >
> > Chengming Gui (3):
> >        drm/amd/amdgpu: avoid soft reset check when gpu recovery disable=
d
> >        drm/amd/amdgpu: skip ucode loading if ucode_size =3D=3D 0
> >        drm/amd/amdgpu: add rlc_firmware_header_v2_4 to amdgpu_firmware_=
header
> >
> > David Belanger (1):
> >        drm/amdkfd: Added GFX 11.0.3 Support
> >
> > David Gow (1):
> >        drm/amd/display: fix overflow on MIN_I64 definition
> >
> > Derek Lai (1):
> >        drm/amd/display: do not change pipe split policy for RV2
> >
> > Duncan Ma (1):
> >        drm/amd/display: Fix OTG H timing reset for dcn314
> >
> > Ethan Wellenreiter (2):
> >        drm/amd/display: Re-initialize viewport after pipe merge
> >        drm/amd/display: Fix check for stream and plane
> >
> > Evan Quan (5):
> >        drm/amd/pm: update SMU 13.0.0 driver_if header
> >        drm/amd/pm: use vbios carried pptable for those supported SKUs
> >        drm/amd/pm: use vbios carried pptable for all SMU13.0.7 SKUs
> >        drm/amd/pm: bump SMU 13.0.0 driver_if header version
> >        drm/amd/pm: add missing SetMGpuFanBoostLimitRpm mapping for SMU =
13.0.7
> >
> > Felix Kuehling (1):
> >        drm/amdkfd: Allocate doorbells only when needed
>
> This patch broke CRIU. Rajneesh posted a fix for it. I'd recommend
> including the fix, though we're still debating the root cause and may
> refine it later:
>
> [Patch v2] drm/amdkfd: Fix CRIU restore op due to doorbell offset

If it's critical, I can respin the PR today, otherwise, I can include
the fix(es) in my PR next week.

Alex


>
> Regards,
>    Felix
>
>
> >
> > Frank Min (3):
> >        drm/amdgpu: support psp v13_0_10 ip block
> >        drm/amdgpu: add new ip block for PSP 13.0
> >        drm/amdgpu: add gc v11_0_3 ip headers
> >
> > Gabe Teeger (2):
> >        drm/amd/display: Cursor lag with PSR1 eDP
> >        drm/amd/display: Cleanup PSR flag
> >
> > George Shen (1):
> >        drm/amd/display: Fix DCN32 DPSTREAMCLK_CNTL programming
> >
> > Graham Sider (1):
> >        drm/amdgpu: Update mes_v11_api_def.h
> >
> > Greg Kroah-Hartman (1):
> >        drm/amd/display: fix memory leak when using debugfs_lookup()
> >
> > Guchun Chen (4):
> >        drm/amdgpu: use adev_to_drm to get drm device
> >        drm/amdgpu: use dev_info to benefit mGPU case
> >        drm/amdgpu: disable FRU access on special SIENNA CICHLID card
> >        drm/amdgpu: prevent toc firmware memory leak
> >
> > Hamza Mahfooz (6):
> >        drm/dp_mst: add passthrough_aux to struct drm_dp_mst_port
> >        drm/amd/display: consider DSC pass-through during mode validatio=
n
> >        drm/amd/display: implement DSC pass-through support
> >        drm/amd/display: include soc._clock_tmp[] into DC's scratch regi=
on
> >        drm/amd/display: fix i386 frame size warning
> >        drm/amd/display: fix indentation in commit_planes_for_stream()
> >
> > Hawking Zhang (16):
> >        drm/amdgpu: drop gc 11_0_0 golden settings
> >        drm/amdgpu: initialize common sw config for v11_0_3
> >        drm/amdgpu: add new ip block for SOC21
> >        drm/amdgpu: declare firmware for new SDMA 6.0.3
> >        drm/amdgpu: add new ip block for sdma 6.0
> >        drm/amdgpu: add new ip block for LSDMA 6.0
> >        drm/amdgpu: only init tap_delay ucode when it's included in ucod=
e binary
> >        drm/amdgpu: initialize gmc sw config for v11_0_3
> >        drm/amdgpu: add new ip block for GMC 11.0
> >        drm/amdgpu: declare firmware for new GC 11.0.3
> >        drm/amdgpu: declare firmware for new MES 11.0.3
> >        drm/amdgpu: init gfx config for gfx v11_0_3
> >        drm/amdgpu: enable imu_rlc_ram programming for v11_0_3
> >        drm/amdgpu: Set GC family for GC 11.0.3
> >        drm/amdgpu: add new ip block for GFX 11.0
> >        drm/amdgpu: add new ip block for MES 11.0.3
> >
> > Horace Chen (7):
> >        drm/amdgpu: add CHIP_IP_DISCOVERY support for virtualization
> >        drm/amdgpu: add sriov nbio callback structure
> >        drm/amdgpu: add a compute pipe reset for RS64
> >        drm/amdgpu: enable WPTR_POLL_ENABLE for sriov on sdma_v6_0
> >        drm/amdgpu: refine virtualization psp fw skip check
> >        drm/amdgpu: sriov remove vcn_4_0 and jpeg_4_0
> >        drm/amdgpu: Support PSP 13.0.10 on SR-IOV
> >
> > Ian Chen (2):
> >        drm/amd/display: Refactor edp dsc codes.
> >        drm/amd/display: Add comments.
> >
> > Ilya Bakoulin (1):
> >        drm/amd/display: Change AUX NACK behavior
> >
> > Iswara Nagulendran (1):
> >        drm/amd/display: Fix primary EDP link detection
> >
> > Jane Jian (4):
> >        drm/amdgpu/vcn: Disable CG/PG for SRIOV
> >        drm/amdgpu/vcn: Add vcn/vcn1 in white list to load its firmware =
under sriov
> >        drm/amdgpu/vcn: Add sriov VCN v4_0 unified queue support
> >        drm/amdgpu/vcn: Add MMSCH v4_0 support for sriov
> >
> > Jinpeng Cui (2):
> >        drm/amd/display: remove redundant vertical_line_start variable
> >        drm/amdkfd: remove redundant variables err and ret
> >
> > John Clements (3):
> >        drm/amdgpu: added firmware module for psp 13.0.10
> >        drm/amdgpu: added supported smu 13.0.10 sw pptable
> >        drm/amdgpu: enable smu block for smu 13.0.10
> >
> > Leo (Hanghong) Ma (2):
> >        drm/amd/display: Add support for visual confirm color
> >        drm/amd/display: Add visual confirm color support for SubVP
> >
> > Leo Chen (3):
> >        drm/amd/display: Adding log clock table from SMU
> >        drm/amd/display: add a override flag as wa for some specific don=
gle
> >        drm/amd/display: Missing HPO instance added
> >
> > Lewis Huang (1):
> >        drm/amd/display: Refine aux transaction before retrieve caps
> >
> > Likun Gao (1):
> >        drm/amdgpu: add MGCG perfmon setting for gfx11
> >
> > Magali Lemes (1):
> >        drm/amd/display: remove unused header
> >
> > Martin Tsai (1):
> >        drm/amd/display: Correct cursor position on horizontal mirror
> >
> > Ma=C3=ADra Canal (1):
> >        drm/amd/display: Include missing header
> >
> > Melissa Wen (4):
> >        Documentation/amdgpu_dm: Add DM color correction documentation
> >        Documentation/amdgpu/display: add DC color caps info
> >        drm/amd/display: add doc entries for MPC blending configuration
> >        Documentation/gpu/amdgpu/amdgpu_dm: add DM docs for pixel blend =
mode
> >
> > Michael Strauss (1):
> >        drm/amd/display: Add DC debug option to force LTTPR mode
> >
> > Mukul Joshi (1):
> >        drm/amdgpu: Fix page table setup on Arcturus
> >
> > Prike Liang (1):
> >        drm/amdkfd: Fix isa version for the GC 10.3.7
> >
> > Qu Huang (1):
> >        drm/amdgpu: mmVM_L2_CNTL3 register not initialized correctly
> >
> > Rafael J. Wysocki (1):
> >        drm: amd: amdgpu: ACPI: Add comment about ACPI_FADT_LOW_POWER_S0
> >
> > Robin Chen (1):
> >        drm/amd/display: Cursor flicker when entering PSRSU
> >
> > Rodrigo Siqueira (10):
> >        drm/amd/display: Add documentation to some of the cursor struct
> >        drm/amd/display: Add basic kernel doc to CRC code under DC
> >        drm/amd/display: Add some extra kernel doc to amdgpu_dm
> >        drm/amd/display: Document pipe split policy
> >        drm/amd/display: Expand documentation for timing
> >        drm/amd/display: Document some of the DML structs
> >        drm/amd/display: Remove unused code
> >        Documentation/gpu: Add info table for ASICs
> >        Documentation/gpu: Add an explanation about the DCN pipeline
> >        Documentation/gpu: Add Multiplane Overlay doc
> >
> > Roman Li (2):
> >        drm/amd/display: enable PCON support for dcn314
> >        drm/amd/display: Remove redundant check in atomic_check
> >
> > Saaem Rizvi (1):
> >        drm/amd/display: HDMI ODM Combine Policy Correction
> >
> > Samson Tam (1):
> >        drm/amd/display: fix odm 2:1 policy not being applied consistent=
ly in 4k144 modes
> >
> > Sonny Jiang (1):
> >        drm/amdgpu: Enable pg/cg flags on GC11_0_3 for VCN
> >
> > Taimur Hassan (3):
> >        drm/amd/display: Set ODM policy based on number of DSC slices
> >        drm/amd/display: Remove assert from PHY state update
> >        drm/amd/display: Allow PHY state update between same states
> >
> > Tales Aparecida (2):
> >        drm/amd/display: fix minor codestyle problems
> >        drm/amd/display: remove unneeded defines from bios parser
> >
> > Tim Huang (5):
> >        drm/amdgpu: enable GFXOFF allow control for GC IP v11.0.1
> >        drm/amdgpu: add TX_POWER_CTRL_1 macro definitions for NBIO IP v7=
.7.0
> >        drm/amdgpu: add NBIO IP v7.7.0 Clock Gating support
> >        drm/amdgpu: enable NBIO IP v7.7.0 Clock Gating
> >        drm/amdgpu: add sdma instance check for gfx11 CGCG
> >
> > Tom St Denis (1):
> >        drm/amd/amdgpu: Add missing CGTS*TCC_DISABLE to 10.3 headers
> >
> > Victor Zhao (6):
> >        drm/amdgpu: add mode2 reset for sienna_cichlid
> >        drm/amdgpu: let mode2 reset fallback to default when failure
> >        drm/amdgpu: add debugfs amdgpu_reset_level
> >        drm/amdgpu: save and restore gc hub regs
> >        drm/amdgpu: revert context to stop engine before mode2 reset
> >        drm/amdgpu: reduce reset time
> >
> > Vignesh Chander (1):
> >        drm/amdgpu: skip set_topology_info for VF
> >
> > Vladimir Stempen (1):
> >        drm/amd/display: Fix black flash when switching from ODM2to1 to =
ODMBypass
> >
> > Wang Fudong (1):
> >        drm/amd/display: set dig fifo read start level to 7 before dig f=
ifo reset
> >
> > Yang Li (5):
> >        drm/amd/display: remove unneeded semicolon
> >        drm/amd/display: clean up one inconsistent indenting
> >        drm/amd/display: clean up some inconsistent indentings
> >        drm/amd/display: clean up some inconsistent indentings
> >        drm/amd/display: clean up some inconsistent indentings
> >
> > Yang Wang (3):
> >        drm/amd/pm: add smu_v13_0_10 support
> >        drm/amd/pm: add smu_v13_0_10 driver if version
> >        drm/amdgpu: add gfxhub_v3_0_3 support
> >
> > Yang Yingliang (1):
> >        drm/amdgpu: add missing pci_disable_device() in amdgpu_pmops_run=
time_resume()
> >
> > YiPeng Chai (3):
> >        drm/amdgpu: Move psp_xgmi_terminate call from amdgpu_xgmi_remove=
_device to psp_hw_fini
> >        drm/amdgpu: fix hive reference leak when adding xgmi device
> >        drm/amdgpu: TA unload messages are not actually sent to psp when=
 amdgpu is uninstalled
> >
> > Yifan Zha (8):
> >        drm/amdgpu: Use PSP program IH_RB_CNTL registers under SRIOV
> >        drm/amdgpu: Skip the program of MMMC_VM_AGP_* in SRIOV on MMHUB =
v3_0_0
> >        drm/amdgpu: skip "Issue additional private vm invalidation to MM=
HUB" on SRIOV
> >        drm/amdgpu: Skip the VRAM base offset on SRIOV
> >        drm/amdgpu: Skip program SDMA0_SEM_WAIT_FAIL_TIMER_CNTL under SR=
IOV VF
> >        drm/amdgpu: Use RLCG to program GRBM_GFX_CNTL during full access=
 time
> >        drm/admgpu: Skip CG/PG on SOC21 under SRIOV VF
> >        drm/amd: Skip smu_v13 register irq on SRIOV VF
> >
> > Yifan Zhang (3):
> >        drm/amdgpu/mes: zero the sdma_hqd_mask of 2nd SDMA engine for SD=
MA 6.0.1
> >        drm/amdkfd: print address in hex format rather than decimal
> >        drm/amdgpu: correct doorbell range/size value for CSDMA_DOORBELL=
_RANGE
> >
> > Yu Zhe (1):
> >        drm/radeon: use time_after(a,b) to replace "a>b"
> >
> > YuBiao Wang (1):
> >        drm/amdgpu: Fix use-after-free in amdgpu_cs_ioctl
> >
> > Zhenneng Li (1):
> >        drm/radeon: add a force flush to delay work when radeon
> >
> > min tang (2):
> >        drm/amd/display: Fix comment typo
> >        drm/amd/display: Unneeded semicolon
> >
> > shaoyunl (2):
> >        drm/amdgpu: use sjt mec fw on aldebaran for sriov
> >        drm/amdgpu: Remove the additional kfd pre reset call for sriov
> >
> > sunliming (1):
> >        drm/amd/display: Fix variable dereferenced before check
> >
> > ye xingchen (2):
> >        drm/amdgpu: Remove the unneeded result variable
> >        drm/amdgpu: Remove the unneeded result variable 'r'
> >
> > zhang songyi (1):
> >        drm/amd/display: Remove the unneeded result variable
> >
> >   Documentation/gpu/amdgpu/apu-asic-info-table.csv   |     8 +
> >   Documentation/gpu/amdgpu/dgpu-asic-info-table.csv  |    24 +
> >   Documentation/gpu/amdgpu/display/dc-glossary.rst   |     2 +-
> >   Documentation/gpu/amdgpu/display/dcn-overview.rst  |    59 +
> >   .../gpu/amdgpu/display/dcn2_cm_drm_current.svg     |  1370 +
> >   .../gpu/amdgpu/display/dcn3_cm_drm_current.svg     |  1529 +
> >   .../gpu/amdgpu/display/display-manager.rst         |   141 +
> >   Documentation/gpu/amdgpu/display/index.rst         |     1 +
> >   Documentation/gpu/amdgpu/display/mpo-cursor.svg    |   435 +
> >   Documentation/gpu/amdgpu/display/mpo-overview.rst  |   242 +
> >   .../multi-display-hdcp-mpo-less-pipe-ex.svg        |   220 +
> >   .../gpu/amdgpu/display/multi-display-hdcp-mpo.svg  |   171 +
> >   .../gpu/amdgpu/display/pipeline_4k_no_split.svg    |   958 +
> >   .../gpu/amdgpu/display/pipeline_4k_split.svg       |  1062 +
> >   .../display/single-display-mpo-multi-video.svg     |   339 +
> >   .../gpu/amdgpu/display/single-display-mpo.svg      |   266 +
> >   Documentation/gpu/amdgpu/driver-misc.rst           |    17 +
> >   Documentation/gpu/amdgpu/thermal.rst               |    18 +-
> >   Documentation/gpu/drm-kms.rst                      |     2 +
> >   drivers/gpu/drm/amd/amdgpu/Makefile                |     7 +-
> >   drivers/gpu/drm/amd/amdgpu/amdgpu.h                |     6 +
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           |     6 +
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |     1 +
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |     2 +-
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c            |     2 +-
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |   170 +
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |    31 +-
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |    17 +-
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |     9 +-
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.c     |     9 +-
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |    41 +-
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h            |    14 +-
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_gfxhub.h         |     3 +
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h            |    26 +
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |     8 +-
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c            |     3 +
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |    44 +-
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |     1 +
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c          |    21 +
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h          |     1 +
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c           |     3 +
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h          |     1 +
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h            |    13 +
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |    57 +-
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h           |     5 +
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |     5 +-
> >   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |    69 +-
> >   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |    86 +-
> >   drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |    17 +-
> >   drivers/gpu/drm/amd/amdgpu/gfxhub_v2_1.c           |   108 +
> >   drivers/gpu/drm/amd/amdgpu/gfxhub_v3_0_3.c         |   511 +
> >   drivers/gpu/drm/amd/amdgpu/gfxhub_v3_0_3.h         |    29 +
> >   drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |    19 +-
> >   drivers/gpu/drm/amd/amdgpu/ih_v6_0.c               |    26 +-
> >   drivers/gpu/drm/amd/amdgpu/imu_v11_0.c             |     6 +
> >   drivers/gpu/drm/amd/amdgpu/imu_v11_0_3.c           |   144 +
> >   drivers/gpu/drm/amd/amdgpu/imu_v11_0_3.h           |    29 +
> >   drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |     3 +
> >   drivers/gpu/drm/amd/amdgpu/mmhub_v1_0.c            |     1 +
> >   drivers/gpu/drm/amd/amdgpu/mmhub_v3_0.c            |    10 +-
> >   drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.c            |    12 +-
> >   drivers/gpu/drm/amd/amdgpu/mmsch_v4_0.h            |   140 +
> >   drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c              |     1 +
> >   drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c              |     1 +
> >   drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c              |     1 +
> >   drivers/gpu/drm/amd/amdgpu/nbio_v4_3.c             |    44 +
> >   drivers/gpu/drm/amd/amdgpu/nbio_v4_3.h             |     1 +
> >   drivers/gpu/drm/amd/amdgpu/nbio_v7_7.c             |    84 +-
> >   drivers/gpu/drm/amd/amdgpu/psp_v13_0.c             |     2 +
> >   drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c             |     5 +-
> >   drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             |     5 +-
> >   drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c             |     9 +-
> >   drivers/gpu/drm/amd/amdgpu/sienna_cichlid.c        |   303 +
> >   .../inc/dml_wrapper.h =3D> amdgpu/sienna_cichlid.h}  |    14 +-
> >   drivers/gpu/drm/amd/amdgpu/soc21.c                 |    41 +-
> >   drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c              |   297 +-
> >   drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |    22 +-
> >   drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |     1 +
> >   drivers/gpu/drm/amd/amdkfd/kfd_device.c            |    14 +-
> >   drivers/gpu/drm/amd/amdkfd/kfd_doorbell.c          |     9 +
> >   drivers/gpu/drm/amd/amdkfd/kfd_process.c           |     5 -
> >   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |    24 +-
> >   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |    46 +-
> >   .../drm/amd/display/amdgpu_dm/amdgpu_dm_color.c    |   109 +-
> >   .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |     1 +
> >   .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |    64 +-
> >   .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |    84 +-
> >   .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    |     5 +-
> >   .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.h    |     8 -
> >   drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c |    19 -
> >   .../amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.c   |    46 +
> >   .../amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.c |    50 +-
> >   .../amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c |    48 +-
> >   drivers/gpu/drm/amd/display/dc/core/dc.c           |    80 +-
> >   .../gpu/drm/amd/display/dc/core/dc_hw_sequencer.c  |    38 +
> >   drivers/gpu/drm/amd/display/dc/core/dc_link.c      |    28 +-
> >   drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   |    65 +-
> >   drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |     3 -
> >   drivers/gpu/drm/amd/display/dc/dc.h                |   132 +-
> >   drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |    50 +-
> >   drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h       |     1 +
> >   drivers/gpu/drm/amd/display/dc/dc_hw_types.h       |   148 +-
> >   drivers/gpu/drm/amd/display/dc/dc_link.h           |    13 +
> >   drivers/gpu/drm/amd/display/dc/dc_stream.h         |     2 -
> >   drivers/gpu/drm/amd/display/dc/dce/dce_aux.c       |    12 +-
> >   .../amd/display/dc/dce110/dce110_hw_sequencer.c    |    21 +-
> >   drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp.c   |     5 +-
> >   drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.c  |     9 +-
> >   .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |   109 +-
> >   drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c  |    41 +-
> >   .../gpu/drm/amd/display/dc/dcn10/dcn10_resource.c  |    18 +
> >   drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c  |     9 +-
> >   drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |    15 +-
> >   .../amd/display/dc/dcn31/dcn31_dio_link_encoder.c  |     3 +
> >   drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c |     9 +-
> >   .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.c  |     1 -
> >   .../display/dc/dcn314/dcn314_dio_stream_encoder.c  |     1 +
> >   .../gpu/drm/amd/display/dc/dcn314/dcn314_optc.c    |     3 +-
> >   .../drm/amd/display/dc/dcn314/dcn314_resource.c    |     7 +-
> >   .../drm/amd/display/dc/dcn315/dcn315_resource.c    |     1 -
> >   .../drm/amd/display/dc/dcn316/dcn316_resource.c    |     1 -
> >   drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dccg.c  |     8 +-
> >   .../display/dc/dcn32/dcn32_dio_stream_encoder.c    |     5 +
> >   drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c |   101 +-
> >   drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.h |     3 +
> >   drivers/gpu/drm/amd/display/dc/dcn32/dcn32_init.c  |     1 +
> >   .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.c  |   667 +-
> >   .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.h  |  1080 +
> >   .../amd/display/dc/dcn32/dcn32_resource_helpers.c  |     2 +-
> >   .../drm/amd/display/dc/dcn321/dcn321_resource.c    |   648 +-
> >   drivers/gpu/drm/amd/display/dc/dm_helpers.h        |     7 +-
> >   .../gpu/drm/amd/display/dc/dml/calcs/bw_fixed.c    |    14 +-
> >   .../gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.c   |    32 +-
> >   .../gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c   |    34 +-
> >   .../amd/display/dc/dml/dcn30/display_mode_vba_30.c |   295 +-
> >   .../gpu/drm/amd/display/dc/dml/dcn301/dcn301_fpu.c |    40 +-
> >   .../gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c   |    77 +-
> >   .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   |    52 +-
> >   .../amd/display/dc/dml/dcn32/display_mode_vba_32.c |    10 +-
> >   .../dc/dml/dcn32/display_mode_vba_util_32.c        |     9 +-
> >   .../dc/dml/dcn32/display_mode_vba_util_32.h        |     1 +
> >   .../gpu/drm/amd/display/dc/dml/dcn321/dcn321_fpu.c |    13 +-
> >   .../drm/amd/display/dc/dml/display_mode_structs.h  |    36 +-
> >   .../gpu/drm/amd/display/dc/dml/display_mode_vba.h  |     1 +
> >   drivers/gpu/drm/amd/display/dc/dml/dml_wrapper.c   |  1884 -
> >   .../amd/display/dc/dml/dml_wrapper_translation.c   |   284 -
> >   drivers/gpu/drm/amd/display/dc/inc/core_types.h    |     4 +
> >   drivers/gpu/drm/amd/display/dc/inc/hw/hw_shared.h  |     6 +
> >   drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h        |    91 +-
> >   .../drm/amd/display/dc/inc/hw/timing_generator.h   |    14 +-
> >   drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h  |     7 +
> >   .../gpu/drm/amd/display/dc/link/link_hwss_hpo_dp.c |     4 +-
> >   drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |     1 +
> >   drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |    63 +-
> >   .../drm/amd/include/asic_reg/gc/gc_10_3_0_offset.h |     8 +
> >   .../amd/include/asic_reg/gc/gc_10_3_0_sh_mask.h    |    10 +
> >   .../drm/amd/include/asic_reg/gc/gc_11_0_3_offset.h | 12086 +++++
> >   .../amd/include/asic_reg/gc/gc_11_0_3_sh_mask.h    | 44640 ++++++++++=
+++++++++
> >   .../amd/include/asic_reg/nbio/nbio_7_7_0_offset.h  |     2 +
> >   .../amd/include/asic_reg/nbio/nbio_7_7_0_sh_mask.h |    13 +
> >   drivers/gpu/drm/amd/include/mes_v11_api_def.h      |     3 +-
> >   drivers/gpu/drm/amd/pm/amdgpu_dpm.c                |    45 +
> >   drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h            |     3 +
> >   drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |    34 +
> >   drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |    22 +
> >   .../pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_0.h |    31 +-
> >   .../amd/pm/swsmu/inc/pmfw_if/smu_v11_0_7_ppsmc.h   |     4 +-
> >   .../drm/amd/pm/swsmu/inc/pmfw_if/smu_v11_5_ppsmc.h |     5 +-
> >   drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h       |     6 +-
> >   drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h       |     9 +-
> >   .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |    54 +
> >   drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   |    76 +
> >   drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |    38 +-
> >   .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |    72 +-
> >   .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |    36 +-
> >   drivers/gpu/drm/amd/pm/swsmu/smu_internal.h        |     3 +
> >   drivers/gpu/drm/display/drm_dp_mst_topology.c      |     4 +-
> >   drivers/gpu/drm/radeon/radeon_device.c             |     3 +
> >   drivers/gpu/drm/radeon/radeon_pm.c                 |     2 +-
> >   include/drm/display/drm_dp.h                       |     1 +
> >   include/drm/display/drm_dp_mst_helper.h            |     3 +
> >   181 files changed, 69781 insertions(+), 3694 deletions(-)
> >   create mode 100644 Documentation/gpu/amdgpu/apu-asic-info-table.csv
> >   create mode 100644 Documentation/gpu/amdgpu/dgpu-asic-info-table.csv
> >   create mode 100644 Documentation/gpu/amdgpu/display/dcn2_cm_drm_curre=
nt.svg
> >   create mode 100644 Documentation/gpu/amdgpu/display/dcn3_cm_drm_curre=
nt.svg
> >   create mode 100644 Documentation/gpu/amdgpu/display/mpo-cursor.svg
> >   create mode 100644 Documentation/gpu/amdgpu/display/mpo-overview.rst
> >   create mode 100644 Documentation/gpu/amdgpu/display/multi-display-hdc=
p-mpo-less-pipe-ex.svg
> >   create mode 100644 Documentation/gpu/amdgpu/display/multi-display-hdc=
p-mpo.svg
> >   create mode 100644 Documentation/gpu/amdgpu/display/pipeline_4k_no_sp=
lit.svg
> >   create mode 100644 Documentation/gpu/amdgpu/display/pipeline_4k_split=
.svg
> >   create mode 100644 Documentation/gpu/amdgpu/display/single-display-mp=
o-multi-video.svg
> >   create mode 100644 Documentation/gpu/amdgpu/display/single-display-mp=
o.svg
> >   create mode 100644 drivers/gpu/drm/amd/amdgpu/gfxhub_v3_0_3.c
> >   create mode 100644 drivers/gpu/drm/amd/amdgpu/gfxhub_v3_0_3.h
> >   create mode 100644 drivers/gpu/drm/amd/amdgpu/imu_v11_0_3.c
> >   create mode 100644 drivers/gpu/drm/amd/amdgpu/imu_v11_0_3.h
> >   create mode 100644 drivers/gpu/drm/amd/amdgpu/mmsch_v4_0.h
> >   create mode 100644 drivers/gpu/drm/amd/amdgpu/sienna_cichlid.c
> >   rename drivers/gpu/drm/amd/{display/dc/inc/dml_wrapper.h =3D> amdgpu/=
sienna_cichlid.h} (81%)
> >   delete mode 100644 drivers/gpu/drm/amd/display/dc/dml/dml_wrapper.c
> >   delete mode 100644 drivers/gpu/drm/amd/display/dc/dml/dml_wrapper_tra=
nslation.c
> >   create mode 100644 drivers/gpu/drm/amd/include/asic_reg/gc/gc_11_0_3_=
offset.h
> >   create mode 100644 drivers/gpu/drm/amd/include/asic_reg/gc/gc_11_0_3_=
sh_mask.h
