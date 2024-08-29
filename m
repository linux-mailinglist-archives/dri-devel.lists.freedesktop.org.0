Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C85C1963E19
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 10:11:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1801210E612;
	Thu, 29 Aug 2024 08:11:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA95F10E610;
 Thu, 29 Aug 2024 08:11:51 +0000 (UTC)
X-UUID: 54b60bb465de11efa216b1d71e6e1362-20240829
X-CTIC-Tags: HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NO_NAME, HR_CTE_8B,
 HR_CTT_MISS
 HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME, HR_SJ_LANG
 HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM, HR_SJ_PHRASE, HR_SJ_PHRASE_LEN
 HR_SJ_PRE_RE, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT, HR_TO_NO_NAME
 DN_TRUSTED, SRC_TRUSTED, SA_TRUSTED, SA_EXISTED, SN_TRUSTED
 SN_EXISTED, SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS, CIE_BAD
 CIE_GOOD, CIE_GOOD_SPF, GTI_FG_BS, GTI_RG_INFO, GTI_C_BU
 AMN_T1, AMN_GOOD, AMN_C_TI, AMN_C_BU, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38, REQID:ce9c4b22-c925-4fd2-952f-fa40832ff2b2, IP:15,
 URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-3,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:12
X-CID-INFO: VERSION:1.1.38, REQID:ce9c4b22-c925-4fd2-952f-fa40832ff2b2, IP:15,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:-3,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:12
X-CID-META: VersionHash:82c5f88, CLOUDID:63e1b3db4a4e3506366ec8e9954b823e,
 BulkI
 D:240822220608SXRKO8Y3,BulkQuantity:1,Recheck:0,SF:64|66|100|17|19|42|25|1
 01|74|102,TC:nil,Content:0|-5,EDM:-3,IP:-2,URL:0,File:nil,RT:nil,Bulk:40,Q
 S:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI
X-UUID: 54b60bb465de11efa216b1d71e6e1362-20240829
X-User: yaolu@kylinos.cn
Received: from localhost.localdomain [(111.48.58.10)] by mailgw.kylinos.cn
 (envelope-from <yaolu@kylinos.cn>) (Generic MTA)
 with ESMTP id 1307947314; Thu, 29 Aug 2024 16:11:45 +0800
From: Lu Yao <yaolu@kylinos.cn>
To: mario.limonciello@amd.com
Cc: Hawking.Zhang@amd.com, Jun.Ma2@amd.com, Tim.Huang@amd.com,
 Xinhui.Pan@amd.com, alexander.deucher@amd.com,
 amd-gfx@lists.freedesktop.org, andrealmeid@igalia.com, candice.li@amd.com,
 christian.koenig@amd.com, hamza.mahfooz@amd.com, jesse.zhang@amd.com,
 kenneth.feng@amd.com, kevinyang.wang@amd.com, lijo.lazar@amd.com,
 linux-kernel@vger.kernel.org, sunil.khatri@amd.com,
 victorchengchi.lu@amd.com, yaolu@kylinos.cn,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/amdgpu: fix OLAND card ip_init failed during kdump
 caputrue kernel boot
Date: Thu, 29 Aug 2024 16:11:41 +0800
Message-Id: <20240829081141.134471-1-yaolu@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <5dcd603a-7d62-439d-9a07-9d7d9324e0b6@amd.com>
References: <5dcd603a-7d62-439d-9a07-9d7d9324e0b6@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On 2024/8/22 22:05, Mario Limonciello wrote:
> On 7/23/2024 04:42, Lu Yao wrote:
>> [Why]
>> When running kdump test on a machine with R7340 card, a hang is caused due
>> to the failure of 'amdgpu_device_ip_init()', error message as follows:
>>
>>    '[drm:amdgpu_device_ip_init [amdgpu]] *ERROR* hw_init of IP block <si_dpm> failed -22'
>>    '[drm:uvd_v3_1_hw_init [amdgpu]] *ERROR* amdgpu: UVD Firmware validate fail (-22).'
>>    '[drm:amdgpu_device_ip_init [amdgpu]] *ERROR* hw_init of IP block <uvd_v3_1> failed -22'
>>    'amdgpu 0000:01:00.0: amdgpu: amdgpu_device_ip_init failed'
>>    'amdgpu 0000:01:00.0: amdgpu: Fatal error during GPU init'
>>
>> This is because the caputrue kernel does not power off when it starts, 
>
> Presumably you mean:
> s/caputrue/capture/ 
Oh, you're right. It's a mistake.
>
>> cause hardware status does not reset.
>>
>> [How]
>> Add 'is_kdump_kernel()' judgment.
>> For 'si_dpm' block, use disable and then enable.
>> For 'uvd_v3_1' block, skip loading during the initialization phase.
>>
>> Signed-off-by: Lu Yao <yaolu@kylinos.cn>
>> ---
>> During test, I first modified the 'amdgpu_device_ip_hw_init_phase*', make
>> it does not end directly when a block hw_init failed.
>>
>> After analysis, 'si_dpm' block failed at 'si_dpm_enable()->
>> amdgpu_si_is_smc_running()', calling 'si_dpm_disable()' before can resolve.
>> 'uvd_v3_1' block failed at 'uvd_v3_1_hw_init()->uvd_v3_1_fw_validate()',
>> read mmUVD_FW_STATUS value is 0x27220102, I didn't find out why. But for
>> caputrue kernel, UVD is not required. Therefore, don't added this block. 
>
> Hmm, a few thoughs.
>
> 1) Although you used this for the R7340, these concepts you're identifying probably make sense on most AMD GPUs.  SUch checks might be better to uplevel to earlier in IP discovery code.
>
> 2) I'd actually argue we don't want to have the kdump capture kernel do ANY hardware init.  You're going to lose hardware state which "could" be valuable information for debugging a problem that caused a panic.
>
So, maybe  should skip all the  ip_block hw_init functions when kdump?
> That being said, I'm not really sure what framebuffer can drive the display across a kexec if you don't load amdgpu.  What actually happens if you blacklist amdgpu in the capture kernel?
>
> What happens with your patch in place?
>
> At least for me I'd like to see a kernel log from both cases.
>

After add 'initcall_blacklist=amdgpu_init' in KDUMP_CMDLINE_APPEND,  kernel logs are as follow:

[    4.085602][ 0]   nvme0n1: p1 p2 p3 p4 p5 p6
[    4.157927][ 0]  [drm] radeon kernel modesetting enabled.
[    4.163383][ 0]  radeon 0000:01:00.0: SI support disabled by module param
[    5.387012][ 0]  initcall amdgpu_init blacklisted
[    6.613733][ 0]  initcall amdgpu_init blacklisted
[    7.859320][ 0]  mtsnd build info: e3fc429
[    8.687512][ 0]  EXT4-fs (nvme0n1p3): orphan cleanup on readonly fs
[    8.694035][ 0]  EXT4-fs (nvme0n1p3): mounted filesystem 75c1e96b-cef8-4ed3-86ea-45010c7b859c ro with ordered data mode. Quota mode: none.
[    9.309862][ 0]  device-mapper: core: CONFIG_IMA_DISABLE_HTABLE is disabled. Duplicate IMA measurements will not be recorded in the IMA log.
[    9.325236][ 0]  device-mapper: uevent: version 1.0.3
[    9.330946][ 0]  systemd[1]: Starting modprobe@fuse.service - Load Kernel Module fuse...
[    9.341512][ 0]  device-mapper: ioctl: 4.48.0-ioctl (2023-03-01) initialised: dm-devel@redhat.com
[    9.380944][ 0]  fuse: init (API version 7.39)
[    9.390196][ 0]  loop: module loaded
[    9.486957][ 0]  lp: driver loaded but no devices found
[    9.494904][ 0]  EXT4-fs (nvme0n1p3): re-mounted 75c1e96b-cef8-4ed3-86ea-45010c7b859c r/w. Quota mode: none.
[    9.505931][ 0]  systemd[1]: Starting systemd-udev-trigger.service - Coldplug All udev Devices...
[    9.518899][ 0]  ppdev: user-space parallel port driver
[    9.524908][ 0]  systemd[1]: Started systemd-journald.service - Journal Service.
[    9.574209][ 0]  systemd-journald[350]: Received client request to flush runtime journal.
[   10.118484][ 0]  snd_hda_intel 0000:00:1f.3: Unknown capability 0
[   11.590124][ 0]  hdaudio hdaudioC0D2: Unable to configure, disabling
[   23.892640][ 0]  reboot: Restarting system

After with my patch in place:

[    4.074629][ 0]   nvme0n1: p1 p2 p3 p4 p5 p6
[    4.146956][ 0]  [drm] radeon kernel modesetting enabled.
[    4.152409][ 0]  radeon 0000:01:00.0: SI support disabled by module param
[    5.379207][ 0]  [drm] amdgpu kernel modesetting enabled.
[    5.384909][ 0]  amdgpu: Virtual CRAT table created for CPU
[    5.390514][ 0]  amdgpu: Topology: Add CPU node
[    5.395225][ 0]  [drm] initializing kernel modesetting (OLAND 0x1002:0x6611 0x1642:0x1869 0x87).
[    5.404040][ 0]  [drm] register mmio base: 0xA1600000
[    5.409118][ 0]  [drm] register mmio size: 262144
[    5.413864][ 0]  [drm] add ip block number 0 <si_common>
[    5.419207][ 0]  [drm] add ip block number 1 <gmc_v6_0>
[    5.424448][ 0]  [drm] add ip block number 2 <si_ih>
[    5.429427][ 0]  [drm] add ip block number 3 <gfx_v6_0>
[    5.434668][ 0]  [drm] add ip block number 4 <si_dma>
[    5.439733][ 0]  [drm] add ip block number 5 <si_dpm>
[    5.444803][ 0]  [drm] add ip block number 6 <dce_v6_0>
[    5.450051][ 0]  amdgpu 0000:01:00.0: amdgpu: Fetched VBIOS from VFCT
[    5.456517][ 0]  amdgpu: ATOM BIOS: 113-RADEONI6910-B03-BT
[    5.462023][ 0]  kfd kfd: amdgpu: OLAND  not supported in kfd
[    5.467857][ 0]  amdgpu 0000:01:00.0: vgaarb: deactivate vga console
[    5.474239][ 0]  amdgpu 0000:01:00.0: amdgpu: Trusted Memory Zone (TMZ) feature not supported
[    5.482781][ 0]  amdgpu 0000:01:00.0: amdgpu: PCIE atomic ops is not supported
[    5.490242][ 0]  [drm] PCIE gen 3 link speeds already enabled
[    5.496017][ 0]  [drm] vm size is 64 GB, 2 levels, block size is 10-bit, fragment size is 9-bit
[    5.504778][ 0]  amdgpu 0000:01:00.0: amdgpu: VRAM: 1024M 0x000000F400000000 - 0x000000F43FFFFFFF (1024M used)
[    5.514812][ 0]  amdgpu 0000:01:00.0: amdgpu: GART: 1024M 0x000000FF00000000 - 0x000000FF3FFFFFFF
[    5.523710][ 0]  [drm] Detected VRAM RAM=1024M, BAR=1024M
[    5.529133][ 0]  [drm] RAM width 32bits GDDR5
[    5.533532][ 0]  [drm] amdgpu: 1024M of VRAM memory ready
[    5.538963][ 0]  [drm] amdgpu: 225M of GTT memory ready.
[    5.544293][ 0]  [drm] GART: num cpu pages 262144, num gpu pages 262144
[    5.550950][ 0]  amdgpu 0000:01:00.0: amdgpu: PCIE GART of 1024M enabled (table at 0x000000F400E00000).
[    5.560859][ 0]  [drm] Internal thermal controller with fan control
[    5.567163][ 0]  [drm] amdgpu: dpm initialized
[    5.571642][ 0]  [drm] AMDGPU Display Connectors
[    5.576278][ 0]  [drm] Connector 0:
[    5.579782][ 0]  [drm]   HDMI-A-1
[    5.583108][ 0]  [drm]   HPD2  
[    5.586088][ 0]  [drm]   DDC: 0x1950 0x1950 0x1951 0x1951 0x1952 0x1952 0x1953 0x1953
[    5.593937][ 0]  [drm]   Encoders:
[    5.597353][ 0]  [drm]     DFP1: INTERNAL_UNIPHY
[    5.601985][ 0]  [drm] Connector 1:
[    5.605488][ 0]  [drm]   VGA-1
[    5.608553][ 0]  [drm]   DDC: 0x194c 0x194c 0x194d 0x194d 0x194e 0x194e 0x194f 0x194f
[    5.616400][ 0]  [drm]   Encoders:
[    5.619807][ 0]  [drm]     CRT1: INTERNAL_KLDSCP_DAC1
[    5.985857][ 0]  amdgpu 0000:01:00.0: amdgpu: SE 1, SH per SE 1, CU per SH 6, active_cu_number 6
[    6.346743][ 0]  [drm] Initialized amdgpu 3.54.0 20150101 for 0000:01:00.0 on minor 0
[    6.433683][ 0]  fbcon: amdgpudrmfb (fb0) is primary device
[    6.439260][ 0]  Console: switching to colour frame buffer device 240x67
[    6.454578][ 0]  amdgpu 0000:01:00.0: [drm] fb0: amdgpudrmfb frame buffer device
[    6.816426][ 0]  mtsnd build info: e3fc429
[    7.827506][ 0]  EXT4-fs (nvme0n1p3): orphan cleanup on readonly fs
[    7.834021][ 0]  EXT4-fs (nvme0n1p3): mounted filesystem 75c1e96b-cef8-4ed3-86ea-45010c7b859c ro with ordered data mode. Quota mode: none.
[    8.502847][ 0]  device-mapper: core: CONFIG_IMA_DISABLE_HTABLE is disabled. Duplicate IMA measurements will not be recorded in the IMA log.
[    8.517899][ 0]  systemd[1]: Starting modprobe@fuse.service - Load Kernel Module fuse...
[    8.526044][ 0]  device-mapper: uevent: version 1.0.3
[    8.531923][ 0]  systemd[1]: Starting modprobe@loop.service - Load Kernel Module loop...
[    8.545910][ 0]  systemd[1]: systemd-fsck-root.service - File System Check on Root Device was skipped because of an unmet condition check (ConditionPathExists=!/run/initramfs/fsck-root).
[    8.564367][ 0]  fuse: init (API version 7.39)
[    8.568872][ 0]  device-mapper: ioctl: 4.48.0-ioctl (2023-03-01) initialised: dm-devel@redhat.com
[    8.581889][ 0]  systemd[1]: Starting systemd-journald.service - Journal Service...
[    8.591857][ 0]  loop: module loaded
[    8.639020][ 0]  lp: driver loaded but no devices found
[    8.662288][ 0]  systemd[1]: systemd-tpm2-setup-early.service - TPM2 SRK Setup (Early) was skipped because of an unmet condition check (ConditionSecurity=measured-uki).
[    8.685851][ 0]  ppdev: user-space parallel port driver
[    8.697866][ 0]  EXT4-fs (nvme0n1p3): re-mounted 75c1e96b-cef8-4ed3-86ea-45010c7b859c r/w. Quota mode: none.
[    9.362160][ 0]  snd_hda_intel 0000:00:1f.3: Unknown capability 0
[    9.716497][ 0]  hdaudio hdaudioC0D2: Unable to configure, disabling
[   20.101499][ 0]  reboot: Restarting system

Compared with the blacklist method, amdgpu driver initialization can be completed after adding patch.
From the external observation, more startup animation can be shown (of course, this is meaningless, because it will restart immediately).
