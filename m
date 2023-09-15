Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1327A4214
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 09:17:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D16C010E1F0;
	Mon, 18 Sep 2023 07:17:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 912 seconds by postgrey-1.36 at gabe;
 Fri, 15 Sep 2023 15:30:03 UTC
Received: from www325.your-server.de (www325.your-server.de [78.47.199.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64B6310E647
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Sep 2023 15:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=zwiebeltoralf.de; s=default1902; h=Subject:From:Cc:To:MIME-Version:Date:
 Message-ID:Content-Type:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References;
 bh=XMY5IiNbJRjrDya16HXxYk0gWqxCUtOgos+vAMFuVOI=; b=b8Qnp2YrCxYARsgV1oQpN6cA+2
 DL3eFs3B3TRc7Wt/iyxQbzCd+8E9ZTwhVF7jxOYHavTlhvtWneKlGpKiHPX1wlxyxU1eUP+e2W3gS
 8FN2EoQj5WbmNpfjyrpkyARApp1iG78sclViLSEr+9TU5k3J0S+tNpFuhtR60thVC4Cr7wkn8jKKV
 f+gLwt/qAY9bFzu8XMCzova4mNc82/OX+bCf1bUDwUsaRtVxbnYSymHOdgrF8h6BSmsOvAZ2dramw
 QMR8R6QtqfjBfw6Ksn4ehUbxfXp/UAmJ9CfV+chmDf7qSUPHrR6LWfjiQpG5/Dbgt/wWHVM27ZybG
 AeKF7Bpg==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
 by www325.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <tinderbox@zwiebeltoralf.de>)
 id 1qhAWu-000Aw5-Mo; Fri, 15 Sep 2023 17:14:48 +0200
Received: from [78.50.74.52] (helo=[192.168.178.33])
 by sslproxy01.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <tinderbox@zwiebeltoralf.de>)
 id 1qhAWu-0002q8-Ai; Fri, 15 Sep 2023 17:14:48 +0200
Content-Type: multipart/mixed; boundary="------------tmAQGE30o8GoiMk0FJGzUKDW"
Message-ID: <f7583005-73c8-c720-8595-93f616556915@zwiebeltoralf.de>
Date: Fri, 15 Sep 2023 17:14:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Content-Language: en-US
To: dri-devel <dri-devel@lists.freedesktop.org>
From: =?UTF-8?Q?Toralf_F=c3=b6rster?= <tinderbox@zwiebeltoralf.de>
Subject: WARNING: CPU: 14 PID: 125 at drivers/gpu/drm/drm_mode_object.c:45
 drm_mode_object_add+0x80/0x90 [drm]
X-Authenticated-Sender: tinderbox@zwiebeltoralf.de
X-Virus-Scanned: Clear (ClamAV 0.103.10/27032/Fri Sep 15 09:38:51 2023)
X-Mailman-Approved-At: Mon, 18 Sep 2023 07:16:21 +0000
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
Cc: Linux Kernel <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------tmAQGE30o8GoiMk0FJGzUKDW
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

I do suffer since 1 or 2 weeks from amd gpu problems (6.1.53 and before) 
like

Sep 15 16:51:22 p14s kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR* 
ring sdma0 timeout, signaled seq=122011, emitted seq=122013
Sep 15 16:51:22 p14s kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR* 
Process information: process  pid 0 thread  pid 0
Sep 15 16:51:22 p14s kernel: amdgpu 0000:04:00.0: amdgpu: GPU reset begin!
Sep 15 16:51:23 p14s kernel: amdgpu 0000:04:00.0: amdgpu: free PSP TMR 
buffer
Sep 15 16:51:23 p14s kernel: amdgpu 0000:04:00.0: amdgpu: MODE2 reset
Sep 15 16:51:23 p14s kernel: amdgpu 0000:04:00.0: amdgpu: GPU reset 
succeeded, trying to resume
Sep 15 16:51:23 p14s kernel: [drm] PCIE GART of 1024M enabled (table at 
0x000000F43FC00000).
Sep 15 16:51:23 p14s kernel: [drm] PSP is resuming...
Sep 15 16:51:23 p14s kernel: [drm] reserve 0xa00000 from 0xf43e000000 
for PSP TMR

and tried therefore 6.5.3. But dmesg gives:

WARNING: CPU: 14 PID: 125 at drivers/gpu/drm/drm_mode_object.c:45 
drm_mode_object_add+0x80/0x90 [drm]
WARNING: CPU: 14 PID: 125 at drivers/gpu/drm/drm_mode_object.c:45 
drm_mode_object_add+0x80/0x90 [drm]
WARNING: CPU: 14 PID: 125 at drivers/gpu/drm/drm_mode_object.c:45 
drm_mode_object_add+0x80/0x90 [drm]

Are those warning harmless ? Full dmesg and .config are attached.
TIA

--
toralf
--------------tmAQGE30o8GoiMk0FJGzUKDW
Content-Type: application/x-troff-man; name="dmesg-6.5.3"
Content-Disposition: attachment; filename="dmesg-6.5.3"
Content-Transfer-Encoding: quoted-printable

Linux version 6.5.3 (root@p14s) (gcc (Gentoo Hardened 12.3.1_p20230526 p2=
) 12.3.1 20230526, GNU ld (Gentoo 2.40 p5) 2.40.0) #1 SMP Fri Sep 15 17:0=
3:54 CEST 2023
Command line: BOOT_IMAGE=3D/vmlinuz-6.5.3 root=3DPARTUUID=3D4bfc6d65-4c00=
-de4f-871c-e851f5e48783 ro amd_pstate=3Dguided
KERNEL supported cpus:
  AMD AuthenticAMD
BIOS-provided physical RAM map:
BIOS-e820: [mem 0x0000000000000000-0x000000000009ffff] usable
BIOS-e820: [mem 0x0000000000100000-0x0000000009bfffff] usable
BIOS-e820: [mem 0x0000000009c00000-0x0000000009da0fff] reserved
BIOS-e820: [mem 0x0000000009da1000-0x0000000009efffff] usable
BIOS-e820: [mem 0x0000000009f00000-0x0000000009f27fff] ACPI NVS
BIOS-e820: [mem 0x0000000009f28000-0x000000007057dfff] usable
BIOS-e820: [mem 0x000000007057e000-0x000000007077dfff] type 20
BIOS-e820: [mem 0x000000007077e000-0x000000007677dfff] reserved
BIOS-e820: [mem 0x000000007677e000-0x000000007777dfff] ACPI NVS
BIOS-e820: [mem 0x000000007777e000-0x00000000777fdfff] ACPI data
BIOS-e820: [mem 0x00000000777fe000-0x0000000079ffcfff] usable
BIOS-e820: [mem 0x0000000079ffd000-0x000000007bffffff] reserved
BIOS-e820: [mem 0x000000007ce00000-0x000000007fffffff] reserved
BIOS-e820: [mem 0x00000000e0000000-0x00000000efffffff] reserved
BIOS-e820: [mem 0x00000000fde00000-0x00000000fdefffff] reserved
BIOS-e820: [mem 0x00000000fed80000-0x00000000fed80fff] reserved
BIOS-e820: [mem 0x0000000100000000-0x000000083e2fffff] usable
BIOS-e820: [mem 0x000000083f340000-0x00000008a01fffff] reserved
NX (Execute Disable) protection: active
efi: EFI v2.7 by Lenovo
efi: ACPI=3D0x777fd000 ACPI 2.0=3D0x777fd014 SMBIOS=3D0x73694000 SMBIOS 3=
=2E0=3D0x73687000 TPMFinalLog=3D0x77753000 MEMATTR=3D0x69b7e018 ESRT=3D0x=
69d46c18=20
efi: Remove mem49: MMIO range=3D[0xfde00000-0xfdefffff] (1MB) from e820 m=
ap
e820: remove [mem 0xfde00000-0xfdefffff] reserved
efi: Not removing mem50: MMIO range=3D[0xfed80000-0xfed80fff] (4KB) from =
e820 map
efi: Remove mem52: MMIO range=3D[0x880000000-0x8a01fffff] (514MB) from e8=
20 map
e820: remove [mem 0x880000000-0x8a01fffff] reserved
SMBIOS 3.3.0 present.
DMI: LENOVO 21J5002FGE/21J5002FGE, BIOS R23ET60W (1.30 ) 09/14/2022
tsc: Fast TSC calibration using PIT
tsc: Detected 2694.969 MHz processor
e820: update [mem 0x00000000-0x00000fff] usable =3D=3D> reserved
e820: remove [mem 0x000a0000-0x000fffff] usable
last_pfn =3D 0x83e300 max_arch_pfn =3D 0x400000000
MTRR map: 9 entries (3 fixed + 6 variable; max 20), built from 9 variable=
 MTRRs
x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT =20
last_pfn =3D 0x79ffd max_arch_pfn =3D 0x400000000
esrt: Reserving ESRT space from 0x0000000069d46c18 to 0x0000000069d46d68.=

e820: update [mem 0x69d46000-0x69d46fff] usable =3D=3D> reserved
Using GB pages for direct mapping
Secure boot disabled
ACPI: Early table checksum verification disabled
ACPI: RSDP 0x00000000777FD014 000024 (v02 LENOVO)
ACPI: XSDT 0x00000000777FB188 000154 (v01 LENOVO TP-R23   00001240 PTEC 0=
0000002)
ACPI: FACP 0x0000000071381000 000114 (v06 LENOVO TP-R23   00001240 PTEC 0=
0000002)
ACPI: DSDT 0x0000000071367000 0148E0 (v01 LENOVO TP-R23   00001240 INTL 2=
0180313)
ACPI: FACS 0x000000007774E000 000040
ACPI: SSDT 0x000000007369B000 0000A2 (v01 LENOVO PID0Ssdt 00000001 INTL 2=
0180313)
ACPI: SSDT 0x000000007369A000 000A93 (v01 LENOVO UsbCTabl 00000001 INTL 2=
0180313)
ACPI: SSDT 0x000000007362F000 007F5B (v02 LENOVO TP-R23   00000002 MSFT 0=
2000002)
ACPI: SSDT 0x000000007362E000 000586 (v01 LENOVO ACDC     00000001 INTL 2=
0180313)
ACPI: SSDT 0x000000007362D000 0001D8 (v01 LENOVO STD3     00000001 INTL 2=
0180313)
ACPI: SSDT 0x000000007359B000 00062A (v02 LENOVO Tpm2Tabl 00001000 INTL 2=
0180313)
ACPI: TPM2 0x000000007359A000 000034 (v03 LENOVO TP-R23   00001240 PTEC 0=
0000002)
ACPI: MSDM 0x0000000073599000 000055 (v03 LENOVO TP-R23   00001240 PTEC 0=
0000002)
ACPI: BATB 0x0000000073583000 00004A (v02 LENOVO TP-R23   00001240 PTEC 0=
0000002)
ACPI: HPET 0x0000000071380000 000038 (v01 LENOVO TP-R23   00001240 PTEC 0=
0000002)
ACPI: APIC 0x000000007137F000 00014C (v02 LENOVO TP-R23   00001240 PTEC 0=
0000002)
ACPI: MCFG 0x000000007137E000 00003C (v01 LENOVO TP-R23   00001240 PTEC 0=
0000002)
ACPI: SBST 0x000000007137D000 000030 (v01 LENOVO TP-R23   00001240 PTEC 0=
0000002)
ACPI: WSMT 0x000000007137C000 000028 (v01 LENOVO TP-R23   00001240 PTEC 0=
0000002)
ACPI: SSDT 0x0000000071361000 005354 (v02 LENOVO TP-R23   00000001 AMD  0=
0000001)
ACPI: CRAT 0x0000000071360000 000EC0 (v01 LENOVO TP-R23   00001240 PTEC 0=
0000002)
ACPI: CDIT 0x000000007135F000 000029 (v01 LENOVO TP-R23   00001240 PTEC 0=
0000002)
ACPI: VFCT 0x0000000071354000 00AE84 (v01 LENOVO TP-R23   00001240 PTEC 0=
0000002)
ACPI: FPDT 0x0000000071353000 000034 (v01 LENOVO TP-R23   00001240 PTEC 0=
0000002)
ACPI: SSDT 0x0000000073585000 000BC3 (v01 LENOVO TP-R23   00000001 INTL 2=
0180313)
ACPI: SSDT 0x000000007132B000 0015F7 (v01 LENOVO TP-R23   00000001 INTL 2=
0180313)
ACPI: SSDT 0x0000000071322000 0085B1 (v01 LENOVO TP-R23   00000001 INTL 2=
0180313)
ACPI: BGRT 0x0000000071321000 000038 (v01 LENOVO TP-R23   00001240 PTEC 0=
0000002)
ACPI: SSDT 0x0000000071320000 0007CF (v01 LENOVO TP-R23   00000001 INTL 2=
0180313)
ACPI: SSDT 0x000000007131F000 000410 (v01 LENOVO TP-R23   00000001 INTL 2=
0180313)
ACPI: SSDT 0x000000007131E000 000024 (v01 LENOVO TP-R23   00000001 INTL 2=
0180313)
ACPI: SSDT 0x000000007131C000 00185A (v01 LENOVO TP-R23   00000001 INTL 2=
0180313)
ACPI: SSDT 0x000000007131B000 0007AF (v01 LENOVO TP-R23   00000001 INTL 2=
0180313)
ACPI: SSDT 0x0000000071311000 009B23 (v01 LENOVO TP-R23   00000001 INTL 2=
0180313)
ACPI: SSDT 0x000000007130B000 0051C4 (v01 LENOVO TP-R23   00000001 INTL 2=
0180313)
ACPI: SSDT 0x000000007130A000 000DB2 (v01 LENOVO TP-R23   00000001 INTL 2=
0180313)
ACPI: SSDT 0x0000000071309000 000762 (v01 LENOVO TP-R23   00000001 INTL 2=
0180313)
ACPI: UEFI 0x000000007774D000 00009E (v01 LENOVO TP-R23   00001240 PTEC 0=
0000002)
ACPI: SSDT 0x0000000071308000 000052 (v01 LENOVO DRTM     00000001 INTL 2=
0180313)
ACPI: IVRS 0x0000000071307000 0001E4 (v02 LENOVO TP-R23   00001240 PTEC 0=
0000002)
ACPI: SSDT 0x0000000073699000 000090 (v01 LENOVO TP-R23   00000001 INTL 2=
0180313)
ACPI: SSDT 0x0000000073697000 001203 (v01 LENOVO TP-R23   00000001 INTL 2=
0180313)
ACPI: Reserving FACP table memory at [mem 0x71381000-0x71381113]
ACPI: Reserving DSDT table memory at [mem 0x71367000-0x7137b8df]
ACPI: Reserving FACS table memory at [mem 0x7774e000-0x7774e03f]
ACPI: Reserving SSDT table memory at [mem 0x7369b000-0x7369b0a1]
ACPI: Reserving SSDT table memory at [mem 0x7369a000-0x7369aa92]
ACPI: Reserving SSDT table memory at [mem 0x7362f000-0x73636f5a]
ACPI: Reserving SSDT table memory at [mem 0x7362e000-0x7362e585]
ACPI: Reserving SSDT table memory at [mem 0x7362d000-0x7362d1d7]
ACPI: Reserving SSDT table memory at [mem 0x7359b000-0x7359b629]
ACPI: Reserving TPM2 table memory at [mem 0x7359a000-0x7359a033]
ACPI: Reserving MSDM table memory at [mem 0x73599000-0x73599054]
ACPI: Reserving BATB table memory at [mem 0x73583000-0x73583049]
ACPI: Reserving HPET table memory at [mem 0x71380000-0x71380037]
ACPI: Reserving APIC table memory at [mem 0x7137f000-0x7137f14b]
ACPI: Reserving MCFG table memory at [mem 0x7137e000-0x7137e03b]
ACPI: Reserving SBST table memory at [mem 0x7137d000-0x7137d02f]
ACPI: Reserving WSMT table memory at [mem 0x7137c000-0x7137c027]
ACPI: Reserving SSDT table memory at [mem 0x71361000-0x71366353]
ACPI: Reserving CRAT table memory at [mem 0x71360000-0x71360ebf]
ACPI: Reserving CDIT table memory at [mem 0x7135f000-0x7135f028]
ACPI: Reserving VFCT table memory at [mem 0x71354000-0x7135ee83]
ACPI: Reserving FPDT table memory at [mem 0x71353000-0x71353033]
ACPI: Reserving SSDT table memory at [mem 0x73585000-0x73585bc2]
ACPI: Reserving SSDT table memory at [mem 0x7132b000-0x7132c5f6]
ACPI: Reserving SSDT table memory at [mem 0x71322000-0x7132a5b0]
ACPI: Reserving BGRT table memory at [mem 0x71321000-0x71321037]
ACPI: Reserving SSDT table memory at [mem 0x71320000-0x713207ce]
ACPI: Reserving SSDT table memory at [mem 0x7131f000-0x7131f40f]
ACPI: Reserving SSDT table memory at [mem 0x7131e000-0x7131e023]
ACPI: Reserving SSDT table memory at [mem 0x7131c000-0x7131d859]
ACPI: Reserving SSDT table memory at [mem 0x7131b000-0x7131b7ae]
ACPI: Reserving SSDT table memory at [mem 0x71311000-0x7131ab22]
ACPI: Reserving SSDT table memory at [mem 0x7130b000-0x713101c3]
ACPI: Reserving SSDT table memory at [mem 0x7130a000-0x7130adb1]
ACPI: Reserving SSDT table memory at [mem 0x71309000-0x71309761]
ACPI: Reserving UEFI table memory at [mem 0x7774d000-0x7774d09d]
ACPI: Reserving SSDT table memory at [mem 0x71308000-0x71308051]
ACPI: Reserving IVRS table memory at [mem 0x71307000-0x713071e3]
ACPI: Reserving SSDT table memory at [mem 0x73699000-0x7369908f]
ACPI: Reserving SSDT table memory at [mem 0x73697000-0x73698202]
No NUMA configuration found
Faking a node at [mem 0x0000000000000000-0x000000083e2fffff]
NODE_DATA(0) allocated [mem 0x83e2fd000-0x83e2fffff]
Zone ranges:
  DMA      [mem 0x0000000000001000-0x0000000000ffffff]
  DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
  Normal   [mem 0x0000000100000000-0x000000083e2fffff]
Movable zone start for each node
Early memory node ranges
  node   0: [mem 0x0000000000001000-0x000000000009ffff]
  node   0: [mem 0x0000000000100000-0x0000000009bfffff]
  node   0: [mem 0x0000000009da1000-0x0000000009efffff]
  node   0: [mem 0x0000000009f28000-0x000000007057dfff]
  node   0: [mem 0x00000000777fe000-0x0000000079ffcfff]
  node   0: [mem 0x0000000100000000-0x000000083e2fffff]
Initmem setup node 0 [mem 0x0000000000001000-0x000000083e2fffff]
On node 0, zone DMA: 1 pages in unavailable ranges
On node 0, zone DMA: 96 pages in unavailable ranges
On node 0, zone DMA32: 417 pages in unavailable ranges
On node 0, zone DMA32: 40 pages in unavailable ranges
On node 0, zone DMA32: 29312 pages in unavailable ranges
On node 0, zone Normal: 24579 pages in unavailable ranges
On node 0, zone Normal: 7424 pages in unavailable ranges
ACPI: PM-Timer IO Port: 0x408
ACPI: LAPIC_NMI (acpi_id[0x00] high edge lint[0x1])
ACPI: LAPIC_NMI (acpi_id[0x01] high edge lint[0x1])
ACPI: LAPIC_NMI (acpi_id[0x02] high edge lint[0x1])
ACPI: LAPIC_NMI (acpi_id[0x03] high edge lint[0x1])
ACPI: LAPIC_NMI (acpi_id[0x04] high edge lint[0x1])
ACPI: LAPIC_NMI (acpi_id[0x05] high edge lint[0x1])
ACPI: LAPIC_NMI (acpi_id[0x06] high edge lint[0x1])
ACPI: LAPIC_NMI (acpi_id[0x07] high edge lint[0x1])
ACPI: LAPIC_NMI (acpi_id[0x08] high edge lint[0x1])
ACPI: LAPIC_NMI (acpi_id[0x09] high edge lint[0x1])
ACPI: LAPIC_NMI (acpi_id[0x0a] high edge lint[0x1])
ACPI: LAPIC_NMI (acpi_id[0x0b] high edge lint[0x1])
ACPI: LAPIC_NMI (acpi_id[0x0c] high edge lint[0x1])
ACPI: LAPIC_NMI (acpi_id[0x0d] high edge lint[0x1])
ACPI: LAPIC_NMI (acpi_id[0x0e] high edge lint[0x1])
ACPI: LAPIC_NMI (acpi_id[0x0f] high edge lint[0x1])
IOAPIC[0]: apic_id 32, version 33, address 0xfec00000, GSI 0-23
IOAPIC[1]: apic_id 33, version 33, address 0xfec01000, GSI 24-55
ACPI: INT_SRC_OVR (bus 0 bus_irq 1 global_irq 1 low edge)
ACPI: INT_SRC_OVR (bus 0 bus_irq 12 global_irq 12 low edge)
ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 low level)
ACPI: Using ACPI (MADT) for SMP configuration information
ACPI: HPET id: 0x43538210 base: 0xfed00000
smpboot: Allowing 16 CPUs, 0 hotplug CPUs
[mem 0x80000000-0xdfffffff] available for PCI devices
Booting paravirtualized kernel on bare hardware
clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, ma=
x_idle_ns: 6370452778343963 ns
setup_percpu: NR_CPUS:16 nr_cpumask_bits:16 nr_cpu_ids:16 nr_node_ids:1
percpu: Embedded 45 pages/cpu s147456 r8192 d28672 u262144
pcpu-alloc: s147456 r8192 d28672 u262144 alloc=3D1*2097152
pcpu-alloc: [0] 00 01 02 03 04 05 06 07 [0] 08 09 10 11 12 13 14 15=20
Kernel command line: BOOT_IMAGE=3D/vmlinuz-6.5.3 root=3DPARTUUID=3D4bfc6d=
65-4c00-de4f-871c-e851f5e48783 ro amd_pstate=3Dguided
Unknown kernel command line parameters "BOOT_IMAGE=3D/vmlinuz-6.5.3", wil=
l be passed to user space.
random: crng init done
Dentry cache hash table entries: 4194304 (order: 13, 33554432 bytes, line=
ar)
Inode-cache hash table entries: 2097152 (order: 12, 16777216 bytes, linea=
r)
Fallback order for Node 0: 0=20
Built 1 zonelists, mobility grouping on.  Total pages: 7938425
Policy zone: Normal
mem auto-init: stack:off, heap alloc:on, heap free:on
mem auto-init: clearing system memory may take some time...
software IO TLB: area num 16.
Memory: 31459100K/32258380K available (12288K kernel code, 1677K rwdata, =
2684K rodata, 1972K init, 5144K bss, 799020K reserved, 0K cma-reserved)
SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D16, Nodes=3D1
rcu: Hierarchical RCU implementation.
rcu: 	RCU event tracing is enabled.
rcu: RCU calculated value of scheduler-enlistment delay is 30 jiffies.
NR_IRQS: 4352, nr_irqs: 1096, preallocated irqs: 16
rcu: srcu_init: Setting srcu_struct sizes based on contention.
Console: colour dummy device 80x25
printk: console [tty0] enabled
ACPI: Core revision 20230331
clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: =
133484873504 ns
APIC: Switch to symmetric I/O mode setup
AMD-Vi: ivrs, add hid:AMDI0020, uid:\_SB.FUR0, rdevid:160
AMD-Vi: ivrs, add hid:AMDI0020, uid:\_SB.FUR1, rdevid:160
AMD-Vi: ivrs, add hid:AMDI0020, uid:\_SB.FUR2, rdevid:160
AMD-Vi: ivrs, add hid:AMDI0020, uid:\_SB.FUR3, rdevid:160
AMD-Vi: Using global IVHD EFR:0x246577efa2254afa, EFR2:0x0
x2apic: IRQ remapping doesn't support X2APIC mode
Switched APIC routing to physical flat.
=2E.TIMER: vector=3D0x30 apic1=3D0 pin1=3D2 apic2=3D-1 pin2=3D-1
clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles: 0x26d8ad9f90=
8, max_idle_ns: 440795236529 ns
Calibrating delay loop (skipped), value calculated using timer frequency.=
=2E 5392.51 BogoMIPS (lpj=3D8983230)
x86/cpu: User Mode Instruction Prevention (UMIP) activated
LVT offset 1 assigned for vector 0xf9
LVT offset 2 assigned for vector 0xf4
process: using mwait in idle threads
Last level iTLB entries: 4KB 512, 2MB 512, 4MB 256
Last level dTLB entries: 4KB 2048, 2MB 2048, 4MB 1024, 1GB 0
Spectre V1 : Mitigation: usercopy/swapgs barriers and __user pointer sani=
tization
Spectre V2 : Mitigation: Retpolines
Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB on context s=
witch
Spectre V2 : Spectre v2 / SpectreRSB : Filling RSB on VMEXIT
Spectre V2 : Enabling Restricted Speculation for firmware calls
Spectre V2 : mitigation: Enabling conditional Indirect Branch Prediction =
Barrier
Spectre V2 : User space: Mitigation: STIBP always-on protection
Speculative Store Bypass: Mitigation: Speculative Store Bypass disabled v=
ia prctl
Speculative Return Stack Overflow: IBPB-extending microcode not applied!
Speculative Return Stack Overflow: WARNING: See https://kernel.org/doc/ht=
ml/latest/admin-guide/hw-vuln/srso.html for mitigation options.
Speculative Return Stack Overflow: Mitigation: safe RET, no microcode
x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
x86/fpu: Supporting XSAVE feature 0x200: 'Protection Keys User registers'=

x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
x86/fpu: xstate_offset[9]:  832, xstate_sizes[9]:    8
x86/fpu: Enabled xstate features 0x207, context size is 840 bytes, using =
'compacted' format.
Freeing SMP alternatives memory: 36K
pid_max: default: 32768 minimum: 301
LSM: initializing lsm=3Dcapability,yama,integrity
Yama: becoming mindful.
Mount-cache hash table entries: 65536 (order: 7, 524288 bytes, linear)
Mountpoint-cache hash table entries: 65536 (order: 7, 524288 bytes, linea=
r)
smpboot: CPU0: AMD Ryzen 7 PRO 6850U with Radeon Graphics (family: 0x19, =
model: 0x44, stepping: 0x1)
Performance Events: Fam17h+ core perfctr, AMD PMU driver.
=2E.. version:                0
=2E.. bit width:              48
=2E.. generic registers:      6
=2E.. value mask:             0000ffffffffffff
=2E.. max period:             00007fffffffffff
=2E.. fixed-purpose events:   0
=2E.. event mask:             000000000000003f
signal: max sigframe size: 2976
rcu: Hierarchical SRCU implementation.
rcu: 	Max phase no-delay instances is 1000.
NMI watchdog: Enabled. Permanently consumes one hw-PMU counter.
smp: Bringing up secondary CPUs ...
smpboot: x86: Booting SMP configuration:
=2E... node  #0, CPUs:        #2  #4  #6  #8 #10 #12 #14
TSC synchronization [CPU#0 -> CPU#2]:
Measured 2588706918 cycles TSC warp between CPUs, turning off TSC clock.
tsc: Marking TSC unstable due to check_tsc_sync_source failed
  #1  #3  #5  #7  #9 #11 #13 #15
Spectre V2 : Update user space SMT mitigation: STIBP always-on
smp: Brought up 1 node, 16 CPUs
smpboot: Max logical packages: 1
smpboot: Total of 16 processors activated (86273.30 BogoMIPS)
devtmpfs: initialized
ACPI: PM: Registering ACPI NVS region [mem 0x09f00000-0x09f27fff] (163840=
 bytes)
ACPI: PM: Registering ACPI NVS region [mem 0x7677e000-0x7777dfff] (167772=
16 bytes)
clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_n=
s: 6370867519511994 ns
futex hash table entries: 4096 (order: 6, 262144 bytes, linear)
pinctrl core: initialized pinctrl subsystem
NET: Registered PF_NETLINK/PF_ROUTE protocol family
DMA: preallocated 4096 KiB GFP_KERNEL pool for atomic allocations
DMA: preallocated 4096 KiB GFP_KERNEL|GFP_DMA pool for atomic allocations=

DMA: preallocated 4096 KiB GFP_KERNEL|GFP_DMA32 pool for atomic allocatio=
ns
audit: initializing netlink subsys (disabled)
audit: type=3D2000 audit(1694790300.163:1): state=3Dinitialized audit_ena=
bled=3D0 res=3D1
thermal_sys: Registered thermal governor 'fair_share'
thermal_sys: Registered thermal governor 'bang_bang'
thermal_sys: Registered thermal governor 'step_wise'
thermal_sys: Registered thermal governor 'user_space'
cpuidle: using governor menu
ACPI FADT declares the system doesn't support PCIe ASPM, so disable it
acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
PCI: MMCONFIG for domain 0000 [bus 00-ff] at [mem 0xe0000000-0xefffffff] =
(base 0xe0000000)
PCI: MMCONFIG at [mem 0xe0000000-0xefffffff] reserved as E820 entry
PCI: Using configuration type 1 for base access
mtrr: your CPUs had inconsistent fixed MTRR settings
mtrr: your CPUs had inconsistent variable MTRR settings
mtrr: probably your BIOS does not setup all CPUs.
mtrr: corrected configuration.
HugeTLB: registered 1.00 GiB page size, pre-allocated 0 pages
HugeTLB: 16380 KiB vmemmap can be freed for a 1.00 GiB page
HugeTLB: registered 2.00 MiB page size, pre-allocated 0 pages
HugeTLB: 28 KiB vmemmap can be freed for a 2.00 MiB page
cryptd: max_cpu_qlen set to 1000
fbcon: Taking over console
ACPI: Added _OSI(Module Device)
ACPI: Added _OSI(Processor Device)
ACPI: Added _OSI(3.0 _SCP Extensions)
ACPI: Added _OSI(Processor Aggregator Device)
ACPI: 23 ACPI AML tables successfully acquired and loaded
ACPI: [Firmware Bug]: BIOS _OSI(Linux) query ignored
ACPI: EC: EC started
ACPI: EC: interrupt blocked
ACPI: EC: EC_CMD/EC_SC=3D0x66, EC_DATA=3D0x62
ACPI: \_SB_.PCI0.LPC0.EC0_: Boot DSDT EC used to handle transactions
ACPI: Interpreter enabled
ACPI: PM: (supports S0 S5)
ACPI: Using IOAPIC for interrupt routing
PCI: Using host bridge windows from ACPI; if necessary, use "pci=3Dnocrs"=
 and report a bug
PCI: Using E820 reservations for host bridge windows
ACPI: Enabled 2 GPEs in block 00 to 1F
ACPI: \_SB_.PCI0.GPP6.PXSX.WRST: New power resource
ACPI: \_SB_.PCI0.GPP7.P0WW: New power resource
ACPI: \_SB_.PCI0.GPP8.P0NV: New power resource
ACPI: \_SB_.PCI0.GP11.PWRS: New power resource
ACPI: \_SB_.PCI0.GP11: Overriding _PRW sleep state (S4) by S0 from power =
resources
ACPI: \_SB_.PCI0.GP11.SWUS.PWRS: New power resource
ACPI: \_SB_.PCI0.GP12.PWRS: New power resource
ACPI: \_SB_.PCI0.GP12: Overriding _PRW sleep state (S4) by S0 from power =
resources
ACPI: \_SB_.PCI0.GP12.SWUS.PWRS: New power resource
ACPI: \_SB_.PCI0.GP17.PWRS: New power resource
ACPI: \_SB_.PCI0.GP17.VGA_.PWRS: New power resource
ACPI: \_SB_.PCI0.GP17.ACP_.PWRS: New power resource
ACPI: \_SB_.PCI0.GP17.AZAL.PWRS: New power resource
ACPI: \_SB_.PCI0.GP17.HDAU.PWRS: New power resource
ACPI: \_SB_.PCI0.GP17.XHC0.PWRS: New power resource
ACPI: \_SB_.PCI0.GP17.XHC0.RHUB.HS03.HS01.BTRT: New power resource
ACPI: \_SB_.PCI0.GP17.XHC1.PWRS: New power resource
ACPI: \_SB_.PCI0.GP18.SATA.P0S0: New power resource
ACPI: \_SB_.PCI0.GP18.SATA.P3S0: New power resource
ACPI: \_SB_.PCI0.GP19.NHI0.PWRS: New power resource
ACPI: \_SB_.PCI0.GP19.NHI0: Overriding _PRW sleep state (S3) by S0 from p=
ower resources
ACPI: \_SB_.PCI0.GP19.NHI1.PWRS: New power resource
ACPI: \_SB_.PCI0.GP19.NHI1: Overriding _PRW sleep state (S3) by S0 from p=
ower resources
ACPI: \_SB_.PCI0.GP19.XHC2.PWRS: New power resource
ACPI: \_SB_.PCI0.GP19.XHC3.PWRS: New power resource
ACPI: \_SB_.PCI0.GP19.XHC4.PWRS: New power resource
ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments =
MSI EDR HPX-Type3]
acpi PNP0A08:00: _OSC: platform does not support [SHPCHotplug AER]
acpi PNP0A08:00: _OSC: OS now controls [PCIeHotplug PME PCIeCapability LT=
R DPC]
acpi PNP0A08:00: FADT indicates ASPM is unsupported, using BIOS configura=
tion
PCI host bridge to bus 0000:00
pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000effff window]
pci_bus 0000:00: root bus resource [mem 0x80000000-0xdfffffff window]
pci_bus 0000:00: root bus resource [mem 0xf0000000-0xfdbfffff window]
pci_bus 0000:00: root bus resource [mem 0x880000000-0xffffffffff window]
pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 window]
pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
pci_bus 0000:00: root bus resource [bus 00-ff]
pci 0000:00:00.0: [1022:14b5] type 00 class 0x060000
pci 0000:00:00.2: [1022:14b6] type 00 class 0x080600
pci 0000:00:01.0: [1022:14b7] type 00 class 0x060000
pci 0000:00:02.0: [1022:14b7] type 00 class 0x060000
pci 0000:00:02.1: [1022:14ba] type 01 class 0x060400
pci 0000:00:02.1: PME# supported from D0 D3hot D3cold
pci 0000:00:02.2: [1022:14ba] type 01 class 0x060400
pci 0000:00:02.2: PME# supported from D0 D3hot D3cold
pci 0000:00:02.4: [1022:14ba] type 01 class 0x060400
pci 0000:00:02.4: PME# supported from D0 D3hot D3cold
pci 0000:00:03.0: [1022:14b7] type 00 class 0x060000
pci 0000:00:04.0: [1022:14b7] type 00 class 0x060000
pci 0000:00:08.0: [1022:14b7] type 00 class 0x060000
pci 0000:00:08.1: [1022:14b9] type 01 class 0x060400
pci 0000:00:08.1: enabling Extended Tags
pci 0000:00:08.1: PME# supported from D0 D3hot D3cold
pci 0000:00:08.3: [1022:14b9] type 01 class 0x060400
pci 0000:00:08.3: enabling Extended Tags
pci 0000:00:08.3: PME# supported from D0 D3hot D3cold
pci 0000:00:14.0: [1022:790b] type 00 class 0x0c0500
pci 0000:00:14.3: [1022:790e] type 00 class 0x060100
pci 0000:00:18.0: [1022:1679] type 00 class 0x060000
pci 0000:00:18.1: [1022:167a] type 00 class 0x060000
pci 0000:00:18.2: [1022:167b] type 00 class 0x060000
pci 0000:00:18.3: [1022:167c] type 00 class 0x060000
pci 0000:00:18.4: [1022:167d] type 00 class 0x060000
pci 0000:00:18.5: [1022:167e] type 00 class 0x060000
pci 0000:00:18.6: [1022:167f] type 00 class 0x060000
pci 0000:00:18.7: [1022:1680] type 00 class 0x060000
pci 0000:01:00.0: [10ec:8168] type 00 class 0x020000
pci 0000:01:00.0: reg 0x10: [io  0x2000-0x20ff]
pci 0000:01:00.0: reg 0x18: [mem 0x80a04000-0x80a04fff 64bit]
pci 0000:01:00.0: reg 0x20: [mem 0x80a00000-0x80a03fff 64bit]
pci 0000:01:00.0: supports D1 D2
pci 0000:01:00.0: PME# supported from D0 D1 D2 D3hot D3cold
pci 0000:00:02.1: PCI bridge to [bus 01]
pci 0000:00:02.1:   bridge window [io  0x2000-0x2fff]
pci 0000:00:02.1:   bridge window [mem 0x80a00000-0x80afffff]
pci 0000:02:00.0: [17cb:1103] type 00 class 0x028000
pci 0000:02:00.0: reg 0x10: [mem 0x80000000-0x801fffff 64bit]
pci 0000:02:00.0: PME# supported from D0 D3hot D3cold
pci 0000:02:00.0: 4.000 Gb/s available PCIe bandwidth, limited by 5.0 GT/=
s PCIe x1 link at 0000:00:02.2 (capable of 7.876 Gb/s with 8.0 GT/s PCIe =
x1 link)
pci 0000:00:02.2: PCI bridge to [bus 02]
pci 0000:00:02.2:   bridge window [mem 0x80000000-0x801fffff]
pci 0000:03:00.0: [1c5c:174a] type 00 class 0x010802
pci 0000:03:00.0: reg 0x10: [mem 0x80900000-0x80903fff 64bit]
pci 0000:03:00.0: reg 0x18: [mem 0x80905000-0x80905fff]
pci 0000:03:00.0: reg 0x1c: [mem 0x80904000-0x80904fff]
pci 0000:00:02.4: PCI bridge to [bus 03]
pci 0000:00:02.4:   bridge window [mem 0x80900000-0x809fffff]
pci 0000:04:00.0: [1002:1681] type 00 class 0x030000
pci 0000:04:00.0: reg 0x10: [mem 0x8b0000000-0x8bfffffff 64bit pref]
pci 0000:04:00.0: reg 0x18: [mem 0x8c0000000-0x8c01fffff 64bit pref]
pci 0000:04:00.0: reg 0x20: [io  0x1000-0x10ff]
pci 0000:04:00.0: reg 0x24: [mem 0x80800000-0x8087ffff]
pci 0000:04:00.0: enabling Extended Tags
pci 0000:04:00.0: BAR 0: assigned to efifb
pci 0000:04:00.0: PME# supported from D1 D2 D3hot D3cold
pci 0000:04:00.1: [1002:1640] type 00 class 0x040300
pci 0000:04:00.1: reg 0x10: [mem 0x808c8000-0x808cbfff]
pci 0000:04:00.1: enabling Extended Tags
pci 0000:04:00.1: PME# supported from D1 D2 D3hot D3cold
pci 0000:04:00.2: [1022:1649] type 00 class 0x108000
pci 0000:04:00.2: reg 0x18: [mem 0x80700000-0x807fffff]
pci 0000:04:00.2: reg 0x24: [mem 0x808cc000-0x808cdfff]
pci 0000:04:00.2: enabling Extended Tags
pci 0000:04:00.3: [1022:161d] type 00 class 0x0c0330
pci 0000:04:00.3: reg 0x10: [mem 0x80500000-0x805fffff 64bit]
pci 0000:04:00.3: enabling Extended Tags
pci 0000:04:00.3: PME# supported from D0 D3hot D3cold
pci 0000:04:00.4: [1022:161e] type 00 class 0x0c0330
pci 0000:04:00.4: reg 0x10: [mem 0x80600000-0x806fffff 64bit]
pci 0000:04:00.4: enabling Extended Tags
pci 0000:04:00.4: PME# supported from D0 D3hot D3cold
pci 0000:04:00.5: [1022:15e2] type 00 class 0x048000
pci 0000:04:00.5: reg 0x10: [mem 0x80880000-0x808bffff]
pci 0000:04:00.5: enabling Extended Tags
pci 0000:04:00.5: PME# supported from D0 D3hot D3cold
pci 0000:04:00.6: [1022:15e3] type 00 class 0x040300
pci 0000:04:00.6: reg 0x10: [mem 0x808c0000-0x808c7fff]
pci 0000:04:00.6: enabling Extended Tags
pci 0000:04:00.6: PME# supported from D0 D3hot D3cold
pci 0000:00:08.1: PCI bridge to [bus 04]
pci 0000:00:08.1:   bridge window [io  0x1000-0x1fff]
pci 0000:00:08.1:   bridge window [mem 0x80500000-0x808fffff]
pci 0000:00:08.1:   bridge window [mem 0x8b0000000-0x8c01fffff 64bit pref=
]
pci 0000:05:00.0: [1022:161f] type 00 class 0x0c0330
pci 0000:05:00.0: reg 0x10: [mem 0x80200000-0x802fffff 64bit]
pci 0000:05:00.0: enabling Extended Tags
pci 0000:05:00.0: PME# supported from D0 D3hot D3cold
pci 0000:05:00.3: [1022:15d6] type 00 class 0x0c0330
pci 0000:05:00.3: reg 0x10: [mem 0x80300000-0x803fffff 64bit]
pci 0000:05:00.3: enabling Extended Tags
pci 0000:05:00.3: PME# supported from D0 D3hot D3cold
pci 0000:05:00.4: [1022:15d7] type 00 class 0x0c0330
pci 0000:05:00.4: reg 0x10: [mem 0x80400000-0x804fffff 64bit]
pci 0000:05:00.4: enabling Extended Tags
pci 0000:05:00.4: PME# supported from D0 D3hot D3cold
pci 0000:00:08.3: PCI bridge to [bus 05]
pci 0000:00:08.3:   bridge window [mem 0x80200000-0x804fffff]
ACPI: PCI: Interrupt link LNKA configured for IRQ 0
ACPI: PCI: Interrupt link LNKB configured for IRQ 0
ACPI: PCI: Interrupt link LNKC configured for IRQ 0
ACPI: PCI: Interrupt link LNKD configured for IRQ 0
ACPI: PCI: Interrupt link LNKE configured for IRQ 0
ACPI: PCI: Interrupt link LNKF configured for IRQ 0
ACPI: PCI: Interrupt link LNKG configured for IRQ 0
ACPI: PCI: Interrupt link LNKH configured for IRQ 0
Low-power S0 idle used by default for system suspend
ACPI: EC: interrupt unblocked
ACPI: EC: event unblocked
ACPI: EC: EC_CMD/EC_SC=3D0x66, EC_DATA=3D0x62
ACPI: EC: GPE=3D0xb
ACPI: \_SB_.PCI0.LPC0.EC0_: Boot DSDT EC initialization complete
ACPI: \_SB_.PCI0.LPC0.EC0_: EC: Used to handle transactions and events
iommu: Default domain type: Translated
iommu: DMA domain TLB invalidation policy: lazy mode
ACPI: bus type USB registered
usbcore: registered new interface driver usbfs
usbcore: registered new interface driver hub
usbcore: registered new device driver usb
pps_core: LinuxPPS API ver. 1 registered
pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <gio=
metti@linux.it>
PTP clock support registered
EDAC MC: Ver: 3.0.0
efivars: Registered efivars operations
NetLabel: Initializing
NetLabel:  domain hash size =3D 128
NetLabel:  protocols =3D UNLABELED CIPSOv4 CALIPSO
NetLabel:  unlabeled traffic allowed by default
PCI: Using ACPI for IRQ routing
PCI: pci_cache_line_size set to 64 bytes
e820: reserve RAM buffer [mem 0x09c00000-0x0bffffff]
e820: reserve RAM buffer [mem 0x09f00000-0x0bffffff]
e820: reserve RAM buffer [mem 0x69d46000-0x6bffffff]
e820: reserve RAM buffer [mem 0x7057e000-0x73ffffff]
e820: reserve RAM buffer [mem 0x79ffd000-0x7bffffff]
e820: reserve RAM buffer [mem 0x83e300000-0x83fffffff]
pci 0000:04:00.0: vgaarb: setting as boot VGA device
pci 0000:04:00.0: vgaarb: bridge control possible
pci 0000:04:00.0: vgaarb: VGA device added: decodes=3Dio+mem,owns=3Dnone,=
locks=3Dnone
vgaarb: loaded
hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0
hpet0: 3 comparators, 32-bit 14.318180 MHz counter
clocksource: Switched to clocksource hpet
pnp: PnP ACPI init
system 00:00: [mem 0xfec00000-0xfec01fff] could not be reserved
system 00:00: [mem 0xfee00000-0xfee00fff] has been reserved
system 00:00: [mem 0xe0000000-0xefffffff] has been reserved
system 00:02: [io  0x0400-0x04cf] has been reserved
system 00:02: [io  0x04d0-0x04d1] has been reserved
system 00:02: [io  0x04d6] has been reserved
system 00:02: [io  0x0c00-0x0c01] has been reserved
system 00:02: [io  0x0c14] has been reserved
system 00:02: [io  0x0c50-0x0c52] has been reserved
system 00:02: [io  0x0c6c] has been reserved
system 00:02: [io  0x0c6f] has been reserved
system 00:02: [io  0x0cd0-0x0cdb] has been reserved
system 00:03: [mem 0x000e0000-0x000fffff] could not be reserved
system 00:03: [mem 0x00000000-0x01ffffff] could not be reserved
system 00:03: [mem 0xffffffe0-0xffffffff] has been reserved
system 00:03: [mem 0xfed00000-0xfed003ff] has been reserved
system 00:03: [mem 0xfed61000-0xfed613ff] has been reserved
system 00:03: [mem 0xfed80000-0xfed80fff] has been reserved
pnp: PnP ACPI: found 6 devices
clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, max_idle_ns: 2=
085701024 ns
NET: Registered PF_INET protocol family
IP idents hash table entries: 262144 (order: 9, 2097152 bytes, linear)
tcp_listen_portaddr_hash hash table entries: 16384 (order: 6, 262144 byte=
s, linear)
Table-perturb hash table entries: 65536 (order: 6, 262144 bytes, linear)
TCP established hash table entries: 262144 (order: 9, 2097152 bytes, line=
ar)
TCP bind hash table entries: 65536 (order: 9, 2097152 bytes, linear)
TCP: Hash tables configured (established 262144 bind 65536)
MPTCP token hash table entries: 32768 (order: 7, 786432 bytes, linear)
UDP hash table entries: 16384 (order: 7, 524288 bytes, linear)
UDP-Lite hash table entries: 16384 (order: 7, 524288 bytes, linear)
NET: Registered PF_UNIX/PF_LOCAL protocol family
pci 0000:00:02.1: PCI bridge to [bus 01]
pci 0000:00:02.1:   bridge window [io  0x2000-0x2fff]
pci 0000:00:02.1:   bridge window [mem 0x80a00000-0x80afffff]
pci 0000:00:02.2: PCI bridge to [bus 02]
pci 0000:00:02.2:   bridge window [mem 0x80000000-0x801fffff]
pci 0000:00:02.4: PCI bridge to [bus 03]
pci 0000:00:02.4:   bridge window [mem 0x80900000-0x809fffff]
pci 0000:00:08.1: PCI bridge to [bus 04]
pci 0000:00:08.1:   bridge window [io  0x1000-0x1fff]
pci 0000:00:08.1:   bridge window [mem 0x80500000-0x808fffff]
pci 0000:00:08.1:   bridge window [mem 0x8b0000000-0x8c01fffff 64bit pref=
]
pci 0000:00:08.3: PCI bridge to [bus 05]
pci 0000:00:08.3:   bridge window [mem 0x80200000-0x804fffff]
pci_bus 0000:00: resource 4 [mem 0x000a0000-0x000effff window]
pci_bus 0000:00: resource 5 [mem 0x80000000-0xdfffffff window]
pci_bus 0000:00: resource 6 [mem 0xf0000000-0xfdbfffff window]
pci_bus 0000:00: resource 7 [mem 0x880000000-0xffffffffff window]
pci_bus 0000:00: resource 8 [io  0x0000-0x0cf7 window]
pci_bus 0000:00: resource 9 [io  0x0d00-0xffff window]
pci_bus 0000:01: resource 0 [io  0x2000-0x2fff]
pci_bus 0000:01: resource 1 [mem 0x80a00000-0x80afffff]
pci_bus 0000:02: resource 1 [mem 0x80000000-0x801fffff]
pci_bus 0000:03: resource 1 [mem 0x80900000-0x809fffff]
pci_bus 0000:04: resource 0 [io  0x1000-0x1fff]
pci_bus 0000:04: resource 1 [mem 0x80500000-0x808fffff]
pci_bus 0000:04: resource 2 [mem 0x8b0000000-0x8c01fffff 64bit pref]
pci_bus 0000:05: resource 1 [mem 0x80200000-0x804fffff]
pci 0000:04:00.1: D0 power state depends on 0000:04:00.0
PCI: CLS 32 bytes, default 64
pci 0000:00:00.2: AMD-Vi: IOMMU performance counters supported
pci 0000:00:01.0: Adding to iommu group 0
pci 0000:00:02.0: Adding to iommu group 1
pci 0000:00:02.1: Adding to iommu group 2
pci 0000:00:02.2: Adding to iommu group 3
pci 0000:00:02.4: Adding to iommu group 4
pci 0000:00:03.0: Adding to iommu group 5
pci 0000:00:04.0: Adding to iommu group 6
pci 0000:00:08.0: Adding to iommu group 7
pci 0000:00:08.1: Adding to iommu group 8
pci 0000:00:08.3: Adding to iommu group 9
pci 0000:00:14.0: Adding to iommu group 10
pci 0000:00:14.3: Adding to iommu group 10
pci 0000:00:18.0: Adding to iommu group 11
pci 0000:00:18.1: Adding to iommu group 11
pci 0000:00:18.2: Adding to iommu group 11
pci 0000:00:18.3: Adding to iommu group 11
pci 0000:00:18.4: Adding to iommu group 11
pci 0000:00:18.5: Adding to iommu group 11
pci 0000:00:18.6: Adding to iommu group 11
pci 0000:00:18.7: Adding to iommu group 11
pci 0000:01:00.0: Adding to iommu group 12
pci 0000:02:00.0: Adding to iommu group 13
pci 0000:03:00.0: Adding to iommu group 14
pci 0000:04:00.0: Adding to iommu group 15
pci 0000:04:00.1: Adding to iommu group 16
pci 0000:04:00.2: Adding to iommu group 17
pci 0000:04:00.3: Adding to iommu group 18
pci 0000:04:00.4: Adding to iommu group 19
pci 0000:04:00.5: Adding to iommu group 20
pci 0000:04:00.6: Adding to iommu group 21
pci 0000:05:00.0: Adding to iommu group 22
pci 0000:05:00.3: Adding to iommu group 23
pci 0000:05:00.4: Adding to iommu group 24
pci 0000:00:00.2: can't derive routing for PCI INT A
pci 0000:00:00.2: PCI INT A: not connected
pci 0000:00:00.2: AMD-Vi: Found IOMMU cap 0x40
AMD-Vi: Extended features (0x246577efa2254afa, 0x0): PPR NX GT [5] IA GA =
PC GA_vAPIC
AMD-Vi: Interrupt remapping enabled
AMD-Vi: Virtual APIC enabled
PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
software IO TLB: mapped [mem 0x0000000065a6c000-0x0000000069a6c000] (64MB=
)
LVT offset 0 assigned for vector 0x400
perf: AMD IBS detected (0x000003fd)
perf/amd_iommu: Detected AMD IOMMU #0 (2 banks, 4 counters/bank).
Initialise system trusted keyrings
Key type blacklist registered
workingset: timestamp_bits=3D42 max_order=3D23 bucket_order=3D0
zbud: loaded
NET: Registered PF_ALG protocol family
Key type asymmetric registered
Asymmetric key parser 'x509' registered
io scheduler mq-deadline registered
io scheduler kyber registered
io scheduler bfq registered
pcieport 0000:00:02.1: PME: Signaling with IRQ 34
pcieport 0000:00:02.2: PME: Signaling with IRQ 35
pcieport 0000:00:02.4: PME: Signaling with IRQ 36
pcieport 0000:00:08.1: PME: Signaling with IRQ 37
pcieport 0000:00:08.3: PME: Signaling with IRQ 38
shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
efifb: probing for efifb
efifb: framebuffer at 0x8b0000000, using 8128k, total 8128k
efifb: mode is 1920x1080x32, linelength=3D7680, pages=3D1
efifb: scrolling: redraw
efifb: Truecolor: size=3D8:8:8:8, shift=3D24:16:8:0
Console: switching to colour frame buffer device 240x67
fb0: EFI VGA frame buffer device
ACPI: AC: AC Adapter [AC] (on-line)
input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/=
input0
ACPI: button: Power Button [PWRB]
input: Lid Switch as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0D:00/input/in=
put1
ACPI: button: Lid Switch [LID]
input: Sleep Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0E:00/input/=
input2
ACPI: button: Sleep Button [SLPB]
input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input3
ACPI: button: Power Button [PWRF]
Estimated ratio of average max frequency by base frequency (times 1024): =
1416
Monitor-Mwait will be used to enter C-1 state
ACPI: \_SB_.PLTF.C000: Found 3 idle states
ACPI: \_SB_.PLTF.C001: Found 3 idle states
ACPI: \_SB_.PLTF.C002: Found 3 idle states
ACPI: \_SB_.PLTF.C003: Found 3 idle states
ACPI: \_SB_.PLTF.C004: Found 3 idle states
ACPI: \_SB_.PLTF.C005: Found 3 idle states
ACPI: \_SB_.PLTF.C006: Found 3 idle states
ACPI: \_SB_.PLTF.C007: Found 3 idle states
ACPI: \_SB_.PLTF.C008: Found 3 idle states
ACPI: \_SB_.PLTF.C009: Found 3 idle states
ACPI: \_SB_.PLTF.C00A: Found 3 idle states
ACPI: \_SB_.PLTF.C00B: Found 3 idle states
ACPI: \_SB_.PLTF.C00C: Found 3 idle states
ACPI: \_SB_.PLTF.C00D: Found 3 idle states
ACPI: \_SB_.PLTF.C00E: Found 3 idle states
ACPI: \_SB_.PLTF.C00F: Found 3 idle states
ACPI: thermal: [Firmware Bug]: Invalid critical threshold (0)
ACPI: thermal: [Firmware Bug]: No valid trip found
thermal LNXTHERM:01: registered as thermal_zone0
ACPI: thermal: Thermal Zone [TZ01] (20 C)
Serial: 8250/16550 driver, 32 ports, IRQ sharing enabled
ACPI: battery: Slot [BAT0] (battery present)
Non-volatile memory driver v1.3
tpm_tis STM0151:00: 2.0 TPM (device-id 0x0, rev-id 78)
loop: module loaded
nvme 0000:03:00.0: platform quirk: setting simple suspend
usbcore: registered new interface driver usbserial_generic
nvme nvme0: pci function 0000:03:00.0
usbserial: USB Serial support registered for generic
i8042: PNP: PS/2 Controller [PNP0303:KBD,PNP0f13:MOU] at 0x60,0x64 irq 1,=
12
i8042: Warning: Keylock active
serio: i8042 KBD port at 0x60,0x64 irq 1
serio: i8042 AUX port at 0x60,0x64 irq 12
mousedev: PS/2 mouse device common for all mice
rtc_cmos 00:01: RTC can wake from S4
rtc_cmos 00:01: registered as rtc0
rtc_cmos 00:01: setting system clock to 2023-09-15T15:05:01 UTC (16947903=
01)
rtc_cmos 00:01: alarms up to one month, y3k, 114 bytes nvram, hpet irqs
input: AT Translated Set 2 keyboard as /devices/platform/i8042/serio0/inp=
ut/input4
device-mapper: core: CONFIG_IMA_DISABLE_HTABLE is disabled. Duplicate IMA=
 measurements will not be recorded in the IMA log.
device-mapper: uevent: version 1.0.3
device-mapper: ioctl: 4.48.0-ioctl (2023-03-01) initialised: dm-devel@red=
hat.com
hid: raw HID events driver (C) Jiri Kosina
usbcore: registered new interface driver usbhid
usbhid: USB HID core driver
Initializing XFRM netlink socket
NET: Registered PF_INET6 protocol family
Segment Routing with IPv6
RPL Segment Routing with IPv6
In-situ OAM (IOAM) with IPv6
mip6: Mobile IPv6
NET: Registered PF_PACKET protocol family
microcode: CPU0: patch_level=3D0x0a404102
microcode: CPU6: patch_level=3D0x0a404102
microcode: CPU7: patch_level=3D0x0a404102
microcode: CPU10: patch_level=3D0x0a404102
microcode: CPU11: patch_level=3D0x0a404102
microcode: CPU8: patch_level=3D0x0a404102
microcode: CPU9: patch_level=3D0x0a404102
microcode: CPU13: patch_level=3D0x0a404102
microcode: CPU2: patch_level=3D0x0a404102
microcode: CPU14: patch_level=3D0x0a404102
microcode: CPU1: patch_level=3D0x0a404102
microcode: CPU4: patch_level=3D0x0a404102
microcode: CPU3: patch_level=3D0x0a404102
microcode: CPU15: patch_level=3D0x0a404102
microcode: CPU5: patch_level=3D0x0a404102
microcode: CPU12: patch_level=3D0x0a404102
microcode: Microcode Update Driver: v2.2.
resctrl: L3 allocation detected
resctrl: MB allocation detected
resctrl: L3 monitoring detected
IPI shorthand broadcast: enabled
AVX2 version of gcm_enc/dec engaged.
AES CTR mode by8 optimization enabled
registered taskstats version 1
Loading compiled-in X.509 certificates
Key type .fscrypt registered
Key type fscrypt-provisioning registered
Key type big_key registered
Key type encrypted registered
ima: Allocated hash algorithm: sha256
ima: No architecture policies found
evm: Initialising EVM extended attributes:
evm: security.selinux (disabled)
evm: security.SMACK64 (disabled)
evm: security.SMACK64EXEC (disabled)
evm: security.SMACK64TRANSMUTE (disabled)
evm: security.SMACK64MMAP (disabled)
evm: security.apparmor (disabled)
evm: security.ima
evm: security.capability
evm: HMAC attrs: 0x1
RAS: Correctable Errors collector initialized.
clk: Disabling unused clocks
nvme nvme0: 16/0/0 default/read/poll queues
nvme nvme0: Ignoring bogus Namespace Identifiers
 nvme0n1: p1 p2 p3 p4 p5
psmouse serio1: trackpoint: Elan TrackPoint firmware: 0x00, buttons: 3/3
input: TPPS/2 Elan TrackPoint as /devices/platform/i8042/serio1/input/inp=
ut6
EXT4-fs (nvme0n1p4): mounted filesystem 9a0e55b4-4970-4a97-b563-74319b834=
566 ro with ordered data mode. Quota mode: disabled.
VFS: Mounted root (ext4 filesystem) readonly on device 259:4.
devtmpfs: mounted
Freeing unused decrypted memory: 2036K
Freeing unused kernel image (initmem) memory: 1972K
Write protecting the kernel read-only data: 16384k
Freeing unused kernel image (rodata/data gap) memory: 1412K
x86/mm: Checked W+X mappings: passed, no W+X pages found.
Run /sbin/init as init process
  with arguments:
    /sbin/init
  with environment:
    HOME=3D/
    TERM=3Dlinux
    BOOT_IMAGE=3D/vmlinuz-6.5.3
acpi-tad ACPI000E:00: Missing _PRW
piix4_smbus 0000:00:14.0: SMBus Host Controller at 0xb00, revision 0
piix4_smbus 0000:00:14.0: Using register 0x02 for SMBus port selection
ACPI: bus type drm_connector registered
piix4_smbus 0000:00:14.0: Auxiliary SMBus Host Controller at 0xb20
r8169 0000:01:00.0: enabling device (0000 -> 0003)
r8169 0000:01:00.0: can't disable ASPM; OS doesn't have ASPM control
ccp 0000:04:00.2: enabling device (0000 -> 0002)
ACPI: video: Video Device [VGA] (multi-head: yes  rom: no  post: no)
input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:0f=
/LNXVIDEO:00/input/input7
RAPL PMU: API unit is 2^-32 Joules, 1 fixed counters, 163840 ms ovfl time=
r
RAPL PMU: hw unit of domain package 2^-16 Joules
ccp 0000:04:00.2: tee enabled
ccp 0000:04:00.2: psp enabled
r8169 0000:01:00.0 eth0: RTL8168ep/8111ep, 9c:2d:cd:dc:6f:e5, XID 502, IR=
Q 61
r8169 0000:01:00.0 eth0: jumbo features [frames: 9194 bytes, tx checksumm=
ing: ko]
sp5100_tco: SP5100/SB800 TCO WatchDog Timer Driver
sp5100-tco sp5100-tco: Using 0xfeb00000 for watchdog MMIO address
xhci_hcd 0000:04:00.3: xHCI Host Controller
xhci_hcd 0000:04:00.3: new USB bus registered, assigned bus number 1
xhci_hcd 0000:04:00.3: hcc params 0x0120ffc5 hci version 0x120 quirks 0x0=
000000200000410
xhci_hcd 0000:04:00.3: xHCI Host Controller
xhci_hcd 0000:04:00.3: new USB bus registered, assigned bus number 2
xhci_hcd 0000:04:00.3: Host supports USB 3.1 Enhanced SuperSpeed
usb usb1: New USB device found, idVendor=3D1d6b, idProduct=3D0002, bcdDev=
ice=3D 6.05
usb usb1: New USB device strings: Mfr=3D3, Product=3D2, SerialNumber=3D1
usb usb1: Product: xHCI Host Controller
usb usb1: Manufacturer: Linux 6.5.3 xhci-hcd
usb usb1: SerialNumber: 0000:04:00.3
sp5100-tco sp5100-tco: initialized. heartbeat=3D60 sec (nowayout=3D0)
cfg80211: Loading compiled-in X.509 certificates for regulatory database
Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 4 ports detected
usb usb2: We don't know the algorithms for LPM for this host, disabling L=
PM.
usb usb2: New USB device found, idVendor=3D1d6b, idProduct=3D0003, bcdDev=
ice=3D 6.05
usb usb2: New USB device strings: Mfr=3D3, Product=3D2, SerialNumber=3D1
usb usb2: Product: xHCI Host Controller
usb usb2: Manufacturer: Linux 6.5.3 xhci-hcd
usb usb2: SerialNumber: 0000:04:00.3
hub 2-0:1.0: USB hub found
hub 2-0:1.0: 2 ports detected
xhci_hcd 0000:04:00.4: xHCI Host Controller
xhci_hcd 0000:04:00.4: new USB bus registered, assigned bus number 3
xhci_hcd 0000:04:00.4: hcc params 0x0120ffc5 hci version 0x120 quirks 0x0=
000000200000410
xhci_hcd 0000:04:00.4: xHCI Host Controller
xhci_hcd 0000:04:00.4: new USB bus registered, assigned bus number 4
xhci_hcd 0000:04:00.4: Host supports USB 3.1 Enhanced SuperSpeed
usb usb3: New USB device found, idVendor=3D1d6b, idProduct=3D0002, bcdDev=
ice=3D 6.05
usb usb3: New USB device strings: Mfr=3D3, Product=3D2, SerialNumber=3D1
usb usb3: Product: xHCI Host Controller
usb usb3: Manufacturer: Linux 6.5.3 xhci-hcd
usb usb3: SerialNumber: 0000:04:00.4
hub 3-0:1.0: USB hub found
hub 3-0:1.0: 3 ports detected
usb usb4: We don't know the algorithms for LPM for this host, disabling L=
PM.
usb usb4: New USB device found, idVendor=3D1d6b, idProduct=3D0003, bcdDev=
ice=3D 6.05
usb usb4: New USB device strings: Mfr=3D3, Product=3D2, SerialNumber=3D1
usb usb4: Product: xHCI Host Controller
usb usb4: Manufacturer: Linux 6.5.3 xhci-hcd
usb usb4: SerialNumber: 0000:04:00.4
hub 4-0:1.0: USB hub found
hub 4-0:1.0: 2 ports detected
xhci_hcd 0000:05:00.0: xHCI Host Controller
xhci_hcd 0000:05:00.0: new USB bus registered, assigned bus number 5
r8169 0000:01:00.0 enp1s0f0: renamed from eth0
xhci_hcd 0000:05:00.0: USB3 root hub has no ports
xhci_hcd 0000:05:00.0: hcc params 0x0110ffc5 hci version 0x120 quirks 0x0=
000000200000410
xhci_hcd 0000:05:00.0: xHCI Host Controller
xhci_hcd 0000:05:00.0: new USB bus registered, assigned bus number 6
xhci_hcd 0000:05:00.0: Host supports USB 3.0 SuperSpeed
usb usb5: New USB device found, idVendor=3D1d6b, idProduct=3D0002, bcdDev=
ice=3D 6.05
usb usb5: New USB device strings: Mfr=3D3, Product=3D2, SerialNumber=3D1
usb usb5: Product: xHCI Host Controller
usb usb5: Manufacturer: Linux 6.5.3 xhci-hcd
usb usb5: SerialNumber: 0000:05:00.0
hub 5-0:1.0: USB hub found
hub 5-0:1.0: 1 port detected
usb usb6: We don't know the algorithms for LPM for this host, disabling L=
PM.
usb usb6: New USB device found, idVendor=3D1d6b, idProduct=3D0003, bcdDev=
ice=3D 6.05
usb usb6: New USB device strings: Mfr=3D3, Product=3D2, SerialNumber=3D1
usb usb6: Product: xHCI Host Controller
usb usb6: Manufacturer: Linux 6.5.3 xhci-hcd
usb usb6: SerialNumber: 0000:05:00.0
hub 6-0:1.0: USB hub found
hub 6-0:1.0: config failed, hub doesn't have any ports! (err -19)
xhci_hcd 0000:05:00.3: xHCI Host Controller
xhci_hcd 0000:05:00.3: new USB bus registered, assigned bus number 7
xhci_hcd 0000:05:00.3: hcc params 0x0110ffc5 hci version 0x120 quirks 0x0=
000000200000410
xhci_hcd 0000:05:00.3: xHCI Host Controller
xhci_hcd 0000:05:00.3: new USB bus registered, assigned bus number 8
xhci_hcd 0000:05:00.3: Host supports USB 3.1 Enhanced SuperSpeed
usb usb7: New USB device found, idVendor=3D1d6b, idProduct=3D0002, bcdDev=
ice=3D 6.05
usb usb7: New USB device strings: Mfr=3D3, Product=3D2, SerialNumber=3D1
usb usb7: Product: xHCI Host Controller
usb usb7: Manufacturer: Linux 6.5.3 xhci-hcd
usb usb7: SerialNumber: 0000:05:00.3
hub 7-0:1.0: USB hub found
hub 7-0:1.0: 1 port detected
usb usb8: We don't know the algorithms for LPM for this host, disabling L=
PM.
usb usb8: New USB device found, idVendor=3D1d6b, idProduct=3D0003, bcdDev=
ice=3D 6.05
usb usb8: New USB device strings: Mfr=3D3, Product=3D2, SerialNumber=3D1
usb usb8: Product: xHCI Host Controller
usb usb8: Manufacturer: Linux 6.5.3 xhci-hcd
usb usb8: SerialNumber: 0000:05:00.3
hub 8-0:1.0: USB hub found
hub 8-0:1.0: 1 port detected
xhci_hcd 0000:05:00.4: xHCI Host Controller
xhci_hcd 0000:05:00.4: new USB bus registered, assigned bus number 9
xhci_hcd 0000:05:00.4: hcc params 0x0110ffc5 hci version 0x120 quirks 0x0=
000000200000410
xhci_hcd 0000:05:00.4: xHCI Host Controller
xhci_hcd 0000:05:00.4: new USB bus registered, assigned bus number 10
xhci_hcd 0000:05:00.4: Host supports USB 3.1 Enhanced SuperSpeed
usb usb9: New USB device found, idVendor=3D1d6b, idProduct=3D0002, bcdDev=
ice=3D 6.05
usb usb9: New USB device strings: Mfr=3D3, Product=3D2, SerialNumber=3D1
usb usb9: Product: xHCI Host Controller
usb usb9: Manufacturer: Linux 6.5.3 xhci-hcd
usb usb9: SerialNumber: 0000:05:00.4
input: SYNA8018:00 06CB:CE67 Mouse as /devices/platform/AMDI0010:01/i2c-1=
/i2c-SYNA8018:00/0018:06CB:CE67.0001/input/input8
input: SYNA8018:00 06CB:CE67 Touchpad as /devices/platform/AMDI0010:01/i2=
c-1/i2c-SYNA8018:00/0018:06CB:CE67.0001/input/input9
hid-generic 0018:06CB:CE67.0001: input,hidraw0: I2C HID v1.00 Mouse [SYNA=
8018:00 06CB:CE67] on i2c-SYNA8018:00
hub 9-0:1.0: USB hub found
thinkpad_acpi: ThinkPad ACPI Extras v0.26
thinkpad_acpi: http://ibm-acpi.sf.net/
thinkpad_acpi: ThinkPad BIOS R23ET60W (1.30 ), EC R23HT57W
thinkpad_acpi: Lenovo ThinkPad P14s Gen 3, model 21J5002FGE
hub 9-0:1.0: 1 port detected
usb usb10: We don't know the algorithms for LPM for this host, disabling =
LPM.
usb usb10: New USB device found, idVendor=3D1d6b, idProduct=3D0003, bcdDe=
vice=3D 6.05
usb usb10: New USB device strings: Mfr=3D3, Product=3D2, SerialNumber=3D1=

usb usb10: Product: xHCI Host Controller
usb usb10: Manufacturer: Linux 6.5.3 xhci-hcd
usb usb10: SerialNumber: 0000:05:00.4
kvm_amd: TSC scaling supported
kvm_amd: Nested Virtualization enabled
kvm_amd: Nested Paging enabled
kvm_amd: Virtual VMLOAD VMSAVE supported
kvm_amd: Virtual GIF supported
kvm_amd: LBR virtualization supported
hub 10-0:1.0: USB hub found
hub 10-0:1.0: 1 port detected
AMD-Vi: AMD IOMMUv2 loaded and initialized
Linux agpgart interface v0.103
thinkpad_acpi: radio switch found; radios are enabled
thinkpad_acpi: This ThinkPad has standard ACPI backlight brightness contr=
ol, supported by the ACPI video driver
thinkpad_acpi: Disabling thinkpad-acpi brightness events by default...
MCE: In-kernel MCE decoding enabled.
snd_hda_intel 0000:04:00.1: enabling device (0000 -> 0002)
snd_hda_intel 0000:04:00.6: enabling device (0000 -> 0002)
intel_rapl_common: Found RAPL domain package
intel_rapl_common: Found RAPL domain core
input: HD-Audio Generic HDMI/DP,pcm=3D3 as /devices/pci0000:00/0000:00:08=
=2E1/0000:04:00.1/sound/card0/input12
thinkpad_acpi: rfkill switch tpacpi_bluetooth_sw: radio is unblocked
snd_hda_codec_realtek hdaudioC1D0: autoconfig for ALC257: line_outs=3D1 (=
0x14/0x0/0x0/0x0/0x0) type:speaker
snd_hda_codec_realtek hdaudioC1D0:    speaker_outs=3D0 (0x0/0x0/0x0/0x0/0=
x0)
snd_hda_codec_realtek hdaudioC1D0:    hp_outs=3D1 (0x21/0x0/0x0/0x0/0x0)
snd_hda_codec_realtek hdaudioC1D0:    mono: mono_out=3D0x0
snd_hda_codec_realtek hdaudioC1D0:    inputs:
snd_hda_codec_realtek hdaudioC1D0:      Mic=3D0x19
ath11k_pci 0000:02:00.0: BAR 0: assigned [mem 0x80000000-0x801fffff 64bit=
]
ath11k_pci 0000:02:00.0: enabling device (0000 -> 0002)
ath11k_pci 0000:02:00.0: MSI vectors: 32
ath11k_pci 0000:02:00.0: wcn6855 hw2.1
NET: Registered PF_QIPCRTR protocol family
thinkpad_acpi: Standard ACPI backlight interface available, not loading n=
ative one
input: HD-Audio Generic Mic as /devices/pci0000:00/0000:00:08.1/0000:04:0=
0.6/sound/card1/input15
thinkpad_acpi: battery 1 registered (start 65, stop 100, behaviours: 0x7)=

ACPI: battery: new extension: ThinkPad Battery Extension
[drm] amdgpu kernel modesetting enabled.
input: ThinkPad Extra Buttons as /devices/platform/thinkpad_acpi/input/in=
put11
mhi mhi0: Requested to power ON
mhi mhi0: Power on setup success
input: HD-Audio Generic HDMI/DP,pcm=3D7 as /devices/pci0000:00/0000:00:08=
=2E1/0000:04:00.1/sound/card0/input13
input: HD-Audio Generic HDMI/DP,pcm=3D8 as /devices/pci0000:00/0000:00:08=
=2E1/0000:04:00.1/sound/card0/input14
input: HD-Audio Generic Headphone as /devices/pci0000:00/0000:00:08.1/000=
0:04:00.6/sound/card1/input16
usb 3-2: new full-speed USB device number 2 using xhci_hcd
usb 1-3: new high-speed USB device number 2 using xhci_hcd
usb 5-1: new high-speed USB device number 2 using xhci_hcd
usb 9-1: new high-speed USB device number 2 using xhci_hcd
input: SYNA8018:00 06CB:CE67 Mouse as /devices/platform/AMDI0010:01/i2c-1=
/i2c-SYNA8018:00/0018:06CB:CE67.0001/input/input17
input: SYNA8018:00 06CB:CE67 Touchpad as /devices/platform/AMDI0010:01/i2=
c-1/i2c-SYNA8018:00/0018:06CB:CE67.0001/input/input18
hid-multitouch 0018:06CB:CE67.0001: input,hidraw0: I2C HID v1.00 Mouse [S=
YNA8018:00 06CB:CE67] on i2c-SYNA8018:00
amdgpu: CRAT table disabled by module option
amdgpu: Virtual CRAT table created for CPU
amdgpu: Topology: Add CPU node
amdgpu 0000:04:00.0: enabling device (0006 -> 0007)
[drm] initializing kernel modesetting (YELLOW_CARP 0x1002:0x1681 0x17AA:0=
x50B7 0xD1).
[drm] register mmio base: 0x80800000
[drm] register mmio size: 524288
alsactl[997]: memfd_create() called without MFD_EXEC or MFD_NOEXEC_SEAL s=
et
[drm] add ip block number 0 <nv_common>
[drm] add ip block number 1 <gmc_v10_0>
[drm] add ip block number 2 <navi10_ih>
[drm] add ip block number 3 <psp>
[drm] add ip block number 4 <smu>
[drm] add ip block number 5 <dm>
[drm] add ip block number 6 <gfx_v10_0>
[drm] add ip block number 7 <sdma_v5_2>
[drm] add ip block number 8 <vcn_v3_0>
[drm] add ip block number 9 <jpeg_v3_0>
amdgpu 0000:04:00.0: amdgpu: Fetched VBIOS from VFCT
amdgpu: ATOM BIOS: 113-REMBRANDT-X37
[drm] VCN(0) decode is enabled in VM mode
[drm] VCN(0) encode is enabled in VM mode
[drm] JPEG decode is enabled in VM mode
Console: switching to colour dummy device 80x25
amdgpu 0000:04:00.0: vgaarb: deactivate vga console
amdgpu 0000:04:00.0: amdgpu: Trusted Memory Zone (TMZ) feature disabled a=
s experimental (default)
[drm] vm size is 262144 GB, 4 levels, block size is 9-bit, fragment size =
is 9-bit
amdgpu 0000:04:00.0: amdgpu: VRAM: 1024M 0x000000F400000000 - 0x000000F43=
FFFFFFF (1024M used)
amdgpu 0000:04:00.0: amdgpu: GART: 1024M 0x0000000000000000 - 0x000000003=
FFFFFFF
amdgpu 0000:04:00.0: amdgpu: AGP: 267419648M 0x000000F800000000 - 0x0000F=
FFFFFFFFFFF
[drm] Detected VRAM RAM=3D1024M, BAR=3D1024M
[drm] RAM width 128bits LPDDR5
[drm] amdgpu: 1024M of VRAM memory ready
[drm] amdgpu: 15433M of GTT memory ready.
[drm] GART: num cpu pages 262144, num gpu pages 262144
[drm] PCIE GART of 1024M enabled (table at 0x000000F43FC00000).
[drm] Loading DMUB firmware via PSP: version=3D0x0400003E
[drm] use_doorbell being set to: [true]
[drm] Found VCN firmware Version ENC: 1.27 DEC: 2 VEP: 0 Revision: 0
amdgpu 0000:04:00.0: amdgpu: Will use PSP to load VCN firmware
[drm] reserve 0xa00000 from 0xf43e000000 for PSP TMR
usb 1-3: New USB device found, idVendor=3D05e3, idProduct=3D0610, bcdDevi=
ce=3D61.60
usb 1-3: New USB device strings: Mfr=3D0, Product=3D1, SerialNumber=3D0
usb 1-3: Product: USB2.0 Hub
usb 5-1: New USB device found, idVendor=3D04f2, idProduct=3Db74f, bcdDevi=
ce=3D56.20
usb 5-1: New USB device strings: Mfr=3D3, Product=3D1, SerialNumber=3D2
usb 5-1: Product: Integrated Camera
usb 5-1: Manufacturer: Chicony Electronics Co.,Ltd.
usb 5-1: SerialNumber: 0001
usb 3-2: New USB device found, idVendor=3D046d, idProduct=3Dc52b, bcdDevi=
ce=3D12.10
usb 3-2: New USB device strings: Mfr=3D1, Product=3D2, SerialNumber=3D0
usb 3-2: Product: USB Receiver
usb 3-2: Manufacturer: Logitech
mc: Linux media interface: v0.10
videodev: Linux video capture interface: v2.00
usb 9-1: New USB device found, idVendor=3D17ef, idProduct=3D30af, bcdDevi=
ce=3D60.90
usb 9-1: New USB device strings: Mfr=3D10, Product=3D11, SerialNumber=3D0=

usb 9-1: Product: USB2.0 Hub
usb 9-1: Manufacturer: Lenovo
usb 5-1: Found UVC 1.10 device Integrated Camera (04f2:b74f)
hub 1-3:1.0: USB hub found
hub 1-3:1.0: 3 ports detected
usb 5-1: Found UVC 1.50 device Integrated Camera (04f2:b74f)
input: Logitech USB Receiver as /devices/pci0000:00/0000:00:08.1/0000:04:=
00.4/usb3/3-2/3-2:1.0/0003:046D:C52B.0002/input/input20
usbcore: registered new interface driver uvcvideo
hub 9-1:1.0: USB hub found
hub 9-1:1.0: 3 ports detected
hid-generic 0003:046D:C52B.0002: input,hidraw1: USB HID v1.11 Keyboard [L=
ogitech USB Receiver] on usb-0000:04:00.4-2/input0
input: Logitech USB Receiver Mouse as /devices/pci0000:00/0000:00:08.1/00=
00:04:00.4/usb3/3-2/3-2:1.1/0003:046D:C52B.0003/input/input21
input: Logitech USB Receiver Consumer Control as /devices/pci0000:00/0000=
:00:08.1/0000:04:00.4/usb3/3-2/3-2:1.1/0003:046D:C52B.0003/input/input22
amdgpu 0000:04:00.0: amdgpu: RAS: optional ras ta ucode is not available
amdgpu 0000:04:00.0: amdgpu: RAP: optional rap ta ucode is not available
amdgpu 0000:04:00.0: amdgpu: SECUREDISPLAY: securedisplay ta ucode is not=
 available
amdgpu 0000:04:00.0: amdgpu: SMU is initialized successfully!
[drm] Display Core v3.2.241 initialized on DCN 3.1
[drm] DP-HDMI FRL PCON supported
[drm] DMUB hardware initialized: version=3D0x0400003E
usb 10-1: new SuperSpeed Plus Gen 2x1 USB device number 2 using xhci_hcd
snd_hda_intel 0000:04:00.1: bound 0000:04:00.0 (ops amdgpu_dm_audio_compo=
nent_bind_ops [amdgpu])
input: Logitech USB Receiver System Control as /devices/pci0000:00/0000:0=
0:08.1/0000:04:00.4/usb3/3-2/3-2:1.1/0003:046D:C52B.0003/input/input23
hid-generic 0003:046D:C52B.0003: input,hiddev96,hidraw2: USB HID v1.11 Mo=
use [Logitech USB Receiver] on usb-0000:04:00.4-2/input1
hid-generic 0003:046D:C52B.0004: hiddev97,hidraw3: USB HID v1.11 Device [=
Logitech USB Receiver] on usb-0000:04:00.4-2/input2
mhi mhi0: Wait for device to enter SBL or Mission mode
usb 10-1: New USB device found, idVendor=3D17ef, idProduct=3D30ab, bcdDev=
ice=3D51.34
usb 10-1: New USB device strings: Mfr=3D1, Product=3D2, SerialNumber=3D3
usb 10-1: Product: USB3.1 Hub            =20
usb 10-1: Manufacturer: VIA Labs, Inc.        =20
usb 10-1: SerialNumber: 000000001
hub 10-1:1.0: USB hub found
hub 10-1:1.0: 4 ports detected
[drm] PSR support 1, DC PSR ver 0, sink PSR ver 3 DPCD caps 0x19 su_y_gra=
nularity 4
usb 3-3: new full-speed USB device number 3 using xhci_hcd
[drm] DM_MST: Differing MST start on aconnector: 0000000098159945 [id: 10=
2]
[drm] kiq ring mec 2 pipe 1 q 0
[drm] VCN decode and encode initialized successfully(under DPG Mode).
[drm] JPEG decode initialized successfully.
kfd kfd: amdgpu: Allocated 3969056 bytes on gart
kfd kfd: amdgpu: Total number of KFD nodes to be created: 1
amdgpu: Virtual CRAT table created for GPU
amdgpu: Topology: Add dGPU node [0x1681:0x1002]
kfd kfd: amdgpu: added device 1002:1681
amdgpu 0000:04:00.0: amdgpu: SE 1, SH per SE 2, CU per SH 6, active_cu_nu=
mber 12
amdgpu 0000:04:00.0: amdgpu: ring gfx_0.0.0 uses VM inv eng 0 on hub 0
amdgpu 0000:04:00.0: amdgpu: ring comp_1.0.0 uses VM inv eng 1 on hub 0
amdgpu 0000:04:00.0: amdgpu: ring comp_1.1.0 uses VM inv eng 4 on hub 0
amdgpu 0000:04:00.0: amdgpu: ring comp_1.2.0 uses VM inv eng 5 on hub 0
amdgpu 0000:04:00.0: amdgpu: ring comp_1.3.0 uses VM inv eng 6 on hub 0
amdgpu 0000:04:00.0: amdgpu: ring comp_1.0.1 uses VM inv eng 7 on hub 0
amdgpu 0000:04:00.0: amdgpu: ring comp_1.1.1 uses VM inv eng 8 on hub 0
amdgpu 0000:04:00.0: amdgpu: ring comp_1.2.1 uses VM inv eng 9 on hub 0
amdgpu 0000:04:00.0: amdgpu: ring comp_1.3.1 uses VM inv eng 10 on hub 0
amdgpu 0000:04:00.0: amdgpu: ring kiq_0.2.1.0 uses VM inv eng 11 on hub 0=

amdgpu 0000:04:00.0: amdgpu: ring sdma0 uses VM inv eng 12 on hub 0
amdgpu 0000:04:00.0: amdgpu: ring vcn_dec_0 uses VM inv eng 0 on hub 8
amdgpu 0000:04:00.0: amdgpu: ring vcn_enc_0.0 uses VM inv eng 1 on hub 8
amdgpu 0000:04:00.0: amdgpu: ring vcn_enc_0.1 uses VM inv eng 4 on hub 8
amdgpu 0000:04:00.0: amdgpu: ring jpeg_dec uses VM inv eng 5 on hub 8
[drm] Initialized amdgpu 3.54.0 20150101 for 0000:04:00.0 on minor 0
fbcon: amdgpudrmfb (fb0) is primary device
[drm] DSC precompute is not needed.
usb 9-1.1: new high-speed USB device number 3 using xhci_hcd
usb 1-3.1: new full-speed USB device number 3 using xhci_hcd
Key type trusted registered
usb 3-3: New USB device found, idVendor=3D06cb, idProduct=3D00f9, bcdDevi=
ce=3D 0.00
usb 3-3: New USB device strings: Mfr=3D0, Product=3D0, SerialNumber=3D1
usb 3-3: SerialNumber: 1a00e33a7846
usb 9-1.1: New USB device found, idVendor=3D17ef, idProduct=3D30ac, bcdDe=
vice=3D51.34
usb 9-1.1: New USB device strings: Mfr=3D1, Product=3D2, SerialNumber=3D3=

usb 9-1.1: Product: USB2.0 Hub            =20
usb 9-1.1: Manufacturer: VIA Labs, Inc.        =20
usb 9-1.1: SerialNumber: 000000001
------------[ cut here ]------------
WARNING: CPU: 14 PID: 125 at drivers/gpu/drm/drm_mode_object.c:45 drm_mod=
e_object_add+0x80/0x90 [drm]
Modules linked in: hid_logitech_dj(+) dm_crypt trusted asn1_encoder uvcvi=
deo videobuf2_vmalloc videobuf2_memops uvc videobuf2_v4l2 videodev videob=
uf2_common mc amdgpu(+) qrtr snd_ctl_led ath11k_pci(+) mhi snd_hda_codec_=
realtek snd_hda_codec_generic ath11k qmi_helpers snd_hda_codec_hdmi intel=
_rapl_msr intel_rapl_common drm_ttm_helper snd_hda_intel edac_mce_amd ttm=
 snd_intel_dspcfg agpgart amdxcp snd_hda_codec mac80211 iommu_v2 hid_mult=
itouch gpu_sched snd_hwdep think_lmi(+) kvm_amd i2c_algo_bit thinkpad_acp=
i snd_hda_core snd_pci_acp5x drm_buddy hid_generic libarc4 firmware_attri=
butes_class wmi_bmof snd_pcm drm_suballoc_helper snd_rn_pci_acp3x ledtrig=
_audio snd_timer kvm snd_acp_config drm_display_helper platform_profile c=
fg80211 irqbypass sp5100_tco xhci_pci ucsi_acpi snd_soc_acpi drm_kms_help=
er snd xhci_pci_renesas typec_ucsi crct10dif_pclmul crc32_pclmul crc32c_i=
ntel ghash_clmulni_intel rapl serio_raw video roles cec ccp xhci_hcd snd_=
pci_acp3x soundcore rfkill r8169 k10temp i2c_piix4 typec drm
 i2c_hid_acpi wmi i2c_hid amd_pmc acpi_tad
CPU: 14 PID: 125 Comm: kworker/14:1 Tainted: G                T  6.5.3 #1=

Hardware name: LENOVO 21J5002FGE/21J5002FGE, BIOS R23ET60W (1.30 ) 09/14/=
2022
Workqueue: events_long drm_dp_mst_link_probe_work [drm_display_helper]
RIP: 0010:drm_mode_object_add+0x80/0x90 [drm]
Code: 89 ef e8 d3 a5 6d d0 31 c0 85 db 0f 4e c3 5b 5d 41 5c 41 5d 31 d2 3=
1 c9 31 f6 31 ff 45 31 c0 e9 66 fe 6d d0 80 7f 58 00 74 9d <0f> 0b eb 99 =
66 66 2e 0f 1f 84 00 00 00 00 00 90 66 0f 1f 00 41 54
RSP: 0018:ffffb4a8407cf9d0 EFLAGS: 00010202
RAX: ffffffffc118d8e0 RBX: ffff8e5e53300010 RCX: 0000000000000000
RDX: 00000000b0b0b0b0 RSI: ffff8e5e54e5bc10 RDI: ffff8e5e53300010
RBP: ffff8e5e54e5bc10 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000dc0 R11: 0000000000000000 R12: 00000000b0b0b0b0
R13: 0000000000000005 R14: ffffffffc02ee996 R15: 0000000000000003
FS:  0000000000000000(0000) GS:ffff8e655f180000(0000) knlGS:0000000000000=
000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000564626382000 CR3: 00000001063a0000 CR4: 0000000000750ee0
PKRU: 55555554
Call Trace:
 <TASK>
 ? __warn+0x6f/0xd0
 ? drm_mode_object_add+0x80/0x90 [drm]
 ? report_bug+0x148/0x190
 ? handle_bug+0x3c/0x70
 ? exc_invalid_op+0x17/0x80
 ? asm_exc_invalid_op+0x1a/0x20
 ? drm_mode_object_add+0x80/0x90 [drm]
 drm_property_create+0xbc/0x150 [drm]
 drm_property_create_enum+0x1d/0x80 [drm]
 drm_mode_create_colorspace_property+0xb1/0x100 [drm]
 ? srso_alias_return_thunk+0x5/0x7f
 ? kvasprintf+0x84/0xe0
 ? srso_alias_return_thunk+0x5/0x7f
 ? __kmem_cache_alloc_node+0x177/0x300
 ? amdgpu_dm_connector_funcs_reset+0x3b/0xb0 [amdgpu]
 ? srso_alias_return_thunk+0x5/0x7f
 ? srso_alias_return_thunk+0x5/0x7f
 ? amdgpu_dm_connector_funcs_reset+0x3b/0xb0 [amdgpu]
 amdgpu_dm_connector_init_helper+0x1f0/0x2f0 [amdgpu]
 dm_dp_add_mst_connector+0xb8/0x1a0 [amdgpu]
 drm_dp_mst_port_add_connector+0x1f3/0x2e0 [drm_display_helper]
 ? srso_alias_return_thunk+0x5/0x7f
 ? up+0x3f/0x50
 ? srso_alias_return_thunk+0x5/0x7f
 ? klist_next+0x154/0x160
 ? __process_new_driver+0x30/0x30
 ? srso_alias_return_thunk+0x5/0x7f
 ? bus_for_each_drv+0x9e/0xe0
 ? srso_alias_return_thunk+0x5/0x7f
 ? i2c_register_adapter+0x272/0x760
 ? srso_alias_return_thunk+0x5/0x7f
 ? drm_dp_port_set_pdt+0x187/0x360 [drm_display_helper]
 drm_dp_send_link_address+0x545/0xb00 [drm_display_helper]
 ? __queue_work+0x15f/0x3f0
 ? srso_alias_return_thunk+0x5/0x7f
 ? queue_work_on+0x29/0x30
 drm_dp_check_and_send_link_address+0x79/0xa0 [drm_display_helper]
 drm_dp_mst_link_probe_work+0x120/0x1a0 [drm_display_helper]
 process_one_work+0x20d/0x380
 worker_thread+0x4c/0x3d0
 ? srso_alias_return_thunk+0x5/0x7f
 ? process_one_work+0x380/0x380
 kthread+0xce/0x100
 ? kthread_complete_and_exit+0x20/0x20
 ret_from_fork+0x2f/0x50
 ? kthread_complete_and_exit+0x20/0x20
 ret_from_fork_asm+0x11/0x20
 </TASK>
---[ end trace 0000000000000000 ]---
------------[ cut here ]------------
WARNING: CPU: 14 PID: 125 at drivers/gpu/drm/drm_mode_object.c:45 drm_mod=
e_object_add+0x80/0x90 [drm]
Modules linked in: hid_logitech_dj(+) dm_crypt trusted asn1_encoder uvcvi=
deo videobuf2_vmalloc videobuf2_memops uvc videobuf2_v4l2 videodev videob=
uf2_common mc amdgpu(+) qrtr snd_ctl_led ath11k_pci(+) mhi snd_hda_codec_=
realtek snd_hda_codec_generic ath11k qmi_helpers snd_hda_codec_hdmi intel=
_rapl_msr intel_rapl_common drm_ttm_helper snd_hda_intel edac_mce_amd ttm=
 snd_intel_dspcfg agpgart amdxcp snd_hda_codec mac80211 iommu_v2 hid_mult=
itouch gpu_sched snd_hwdep think_lmi(+) kvm_amd i2c_algo_bit thinkpad_acp=
i snd_hda_core snd_pci_acp5x drm_buddy hid_generic libarc4 firmware_attri=
butes_class wmi_bmof snd_pcm drm_suballoc_helper snd_rn_pci_acp3x ledtrig=
_audio snd_timer kvm snd_acp_config drm_display_helper platform_profile c=
fg80211 irqbypass sp5100_tco xhci_pci ucsi_acpi snd_soc_acpi drm_kms_help=
er snd xhci_pci_renesas typec_ucsi crct10dif_pclmul crc32_pclmul crc32c_i=
ntel ghash_clmulni_intel rapl serio_raw video roles cec ccp xhci_hcd snd_=
pci_acp3x soundcore rfkill r8169 k10temp i2c_piix4 typec drm
 i2c_hid_acpi wmi i2c_hid amd_pmc acpi_tad
CPU: 14 PID: 125 Comm: kworker/14:1 Tainted: G        W       T  6.5.3 #1=

Hardware name: LENOVO 21J5002FGE/21J5002FGE, BIOS R23ET60W (1.30 ) 09/14/=
2022
Workqueue: events_long drm_dp_mst_link_probe_work [drm_display_helper]
RIP: 0010:drm_mode_object_add+0x80/0x90 [drm]
Code: 89 ef e8 d3 a5 6d d0 31 c0 85 db 0f 4e c3 5b 5d 41 5c 41 5d 31 d2 3=
1 c9 31 f6 31 ff 45 31 c0 e9 66 fe 6d d0 80 7f 58 00 74 9d <0f> 0b eb 99 =
66 66 2e 0f 1f 84 00 00 00 00 00 90 66 0f 1f 00 41 54
RSP: 0018:ffffb4a8407cf9d0 EFLAGS: 00010202
RAX: ffffffffc118d8e0 RBX: ffff8e5e53300010 RCX: 0000000000000000
RDX: 00000000b0b0b0b0 RSI: ffff8e5e54e5bd10 RDI: ffff8e5e53300010
RBP: ffff8e5e54e5bd10 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000dc0 R11: 0000000000000000 R12: 00000000b0b0b0b0
R13: 0000000000000005 R14: ffffffffc02ee996 R15: 0000000000000003
FS:  0000000000000000(0000) GS:ffff8e655f180000(0000) knlGS:0000000000000=
000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000564626382000 CR3: 0000000791016000 CR4: 0000000000750ee0
PKRU: 55555554
Call Trace:
 <TASK>
 ? __warn+0x6f/0xd0
 ? drm_mode_object_add+0x80/0x90 [drm]
 ? report_bug+0x148/0x190
 ? handle_bug+0x3c/0x70
 ? exc_invalid_op+0x17/0x80
 ? asm_exc_invalid_op+0x1a/0x20
 ? drm_mode_object_add+0x80/0x90 [drm]
 drm_property_create+0xbc/0x150 [drm]
 drm_property_create_enum+0x1d/0x80 [drm]
 drm_mode_create_colorspace_property+0xb1/0x100 [drm]
 ? srso_alias_return_thunk+0x5/0x7f
 ? kvasprintf+0x84/0xe0
 ? srso_alias_return_thunk+0x5/0x7f
 ? __kmem_cache_alloc_node+0x177/0x300
 ? amdgpu_dm_connector_funcs_reset+0x3b/0xb0 [amdgpu]
 ? srso_alias_return_thunk+0x5/0x7f
 ? srso_alias_return_thunk+0x5/0x7f
 ? amdgpu_dm_connector_funcs_reset+0x3b/0xb0 [amdgpu]
 amdgpu_dm_connector_init_helper+0x1f0/0x2f0 [amdgpu]
 dm_dp_add_mst_connector+0xb8/0x1a0 [amdgpu]
 drm_dp_mst_port_add_connector+0x1f3/0x2e0 [drm_display_helper]
 ? srso_alias_return_thunk+0x5/0x7f
 ? up+0x3f/0x50
 ? srso_alias_return_thunk+0x5/0x7f
 ? klist_next+0x154/0x160
 ? srso_alias_return_thunk+0x5/0x7f
 ? __kmem_cache_alloc_node+0x177/0x300
 ? drm_dp_mst_add_port+0x2a/0x100 [drm_display_helper]
 drm_dp_send_link_address+0x545/0xb00 [drm_display_helper]
 ? __queue_work+0x15f/0x3f0
 ? srso_alias_return_thunk+0x5/0x7f
 ? queue_work_on+0x29/0x30
 drm_dp_check_and_send_link_address+0x79/0xa0 [drm_display_helper]
 drm_dp_mst_link_probe_work+0x120/0x1a0 [drm_display_helper]
 process_one_work+0x20d/0x380
 worker_thread+0x4c/0x3d0
 ? srso_alias_return_thunk+0x5/0x7f
 ? process_one_work+0x380/0x380
 kthread+0xce/0x100
 ? kthread_complete_and_exit+0x20/0x20
 ret_from_fork+0x2f/0x50
 ? kthread_complete_and_exit+0x20/0x20
 ret_from_fork_asm+0x11/0x20
 </TASK>
---[ end trace 0000000000000000 ]---
------------[ cut here ]------------
WARNING: CPU: 14 PID: 125 at drivers/gpu/drm/drm_mode_object.c:45 drm_mod=
e_object_add+0x80/0x90 [drm]
Modules linked in: hid_logitech_dj(+) dm_crypt trusted asn1_encoder uvcvi=
deo videobuf2_vmalloc videobuf2_memops uvc videobuf2_v4l2 videodev videob=
uf2_common mc amdgpu(+) qrtr snd_ctl_led ath11k_pci(+) mhi snd_hda_codec_=
realtek snd_hda_codec_generic ath11k qmi_helpers snd_hda_codec_hdmi intel=
_rapl_msr intel_rapl_common drm_ttm_helper snd_hda_intel edac_mce_amd ttm=
 snd_intel_dspcfg agpgart amdxcp snd_hda_codec mac80211 iommu_v2 hid_mult=
itouch gpu_sched snd_hwdep think_lmi(+) kvm_amd i2c_algo_bit thinkpad_acp=
i snd_hda_core snd_pci_acp5x drm_buddy hid_generic libarc4 firmware_attri=
butes_class wmi_bmof snd_pcm drm_suballoc_helper snd_rn_pci_acp3x ledtrig=
_audio snd_timer kvm snd_acp_config drm_display_helper platform_profile c=
fg80211 irqbypass sp5100_tco xhci_pci ucsi_acpi snd_soc_acpi drm_kms_help=
er snd xhci_pci_renesas typec_ucsi crct10dif_pclmul crc32_pclmul crc32c_i=
ntel ghash_clmulni_intel rapl serio_raw video roles cec ccp xhci_hcd snd_=
pci_acp3x soundcore rfkill r8169 k10temp i2c_piix4 typec drm
 i2c_hid_acpi wmi i2c_hid amd_pmc acpi_tad
CPU: 14 PID: 125 Comm: kworker/14:1 Tainted: G        W       T  6.5.3 #1=

Hardware name: LENOVO 21J5002FGE/21J5002FGE, BIOS R23ET60W (1.30 ) 09/14/=
2022
Workqueue: events_long drm_dp_mst_link_probe_work [drm_display_helper]
RIP: 0010:drm_mode_object_add+0x80/0x90 [drm]
Code: 89 ef e8 d3 a5 6d d0 31 c0 85 db 0f 4e c3 5b 5d 41 5c 41 5d 31 d2 3=
1 c9 31 f6 31 ff 45 31 c0 e9 66 fe 6d d0 80 7f 58 00 74 9d <0f> 0b eb 99 =
66 66 2e 0f 1f 84 00 00 00 00 00 90 66 0f 1f 00 41 54
RSP: 0018:ffffb4a8407cf9d0 EFLAGS: 00010202
RAX: ffffffffc118d8e0 RBX: ffff8e5e53300010 RCX: 0000000000000000
RDX: 00000000b0b0b0b0 RSI: ffff8e5e54e5be10 RDI: ffff8e5e53300010
RBP: ffff8e5e54e5be10 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000dc0 R11: 0000000000000000 R12: 00000000b0b0b0b0
R13: 0000000000000005 R14: ffffffffc02ee996 R15: 0000000000000003
FS:  0000000000000000(0000) GS:ffff8e655f180000(0000) knlGS:0000000000000=
000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000564626382000 CR3: 0000000791016000 CR4: 0000000000750ee0
PKRU: 55555554
Call Trace:
 <TASK>
 ? __warn+0x6f/0xd0
 ? drm_mode_object_add+0x80/0x90 [drm]
 ? report_bug+0x148/0x190
 ? handle_bug+0x3c/0x70
 ? exc_invalid_op+0x17/0x80
 ? asm_exc_invalid_op+0x1a/0x20
 ? drm_mode_object_add+0x80/0x90 [drm]
 drm_property_create+0xbc/0x150 [drm]
 drm_property_create_enum+0x1d/0x80 [drm]
 drm_mode_create_colorspace_property+0xb1/0x100 [drm]
 ? srso_alias_return_thunk+0x5/0x7f
 ? kvasprintf+0x84/0xe0
 ? srso_alias_return_thunk+0x5/0x7f
 ? __kmem_cache_alloc_node+0x177/0x300
 ? amdgpu_dm_connector_funcs_reset+0x3b/0xb0 [amdgpu]
 ? srso_alias_return_thunk+0x5/0x7f
 ? srso_alias_return_thunk+0x5/0x7f
 ? amdgpu_dm_connector_funcs_reset+0x3b/0xb0 [amdgpu]
 amdgpu_dm_connector_init_helper+0x1f0/0x2f0 [amdgpu]
 dm_dp_add_mst_connector+0xb8/0x1a0 [amdgpu]
 drm_dp_mst_port_add_connector+0x1f3/0x2e0 [drm_display_helper]
 ? srso_alias_return_thunk+0x5/0x7f
 ? up+0x3f/0x50
 ? srso_alias_return_thunk+0x5/0x7f
 ? klist_next+0x154/0x160
 ? srso_alias_return_thunk+0x5/0x7f
 ? __kmem_cache_alloc_node+0x177/0x300
 ? drm_dp_mst_add_port+0x2a/0x100 [drm_display_helper]
 drm_dp_send_link_address+0x545/0xb00 [drm_display_helper]
 ? __queue_work+0x15f/0x3f0
 ? srso_alias_return_thunk+0x5/0x7f
 ? queue_work_on+0x29/0x30
 drm_dp_check_and_send_link_address+0x79/0xa0 [drm_display_helper]
 drm_dp_mst_link_probe_work+0x120/0x1a0 [drm_display_helper]
 process_one_work+0x20d/0x380
 worker_thread+0x4c/0x3d0
 ? srso_alias_return_thunk+0x5/0x7f
 ? process_one_work+0x380/0x380
 kthread+0xce/0x100
 ? kthread_complete_and_exit+0x20/0x20
 ret_from_fork+0x2f/0x50
 ? kthread_complete_and_exit+0x20/0x20
 ret_from_fork_asm+0x11/0x20
 </TASK>
---[ end trace 0000000000000000 ]---
usb 1-3.1: New USB device found, idVendor=3D10ab, idProduct=3D9309, bcdDe=
vice=3D 0.01
usb 1-3.1: New USB device strings: Mfr=3D0, Product=3D0, SerialNumber=3D0=

hub 9-1.1:1.0: USB hub found
hub 9-1.1:1.0: 4 ports detected
EXT4-fs (nvme0n1p4): re-mounted 9a0e55b4-4970-4a97-b563-74319b834566 r/w.=
 Quota mode: disabled.
EXT4-fs (nvme0n1p4): re-mounted 9a0e55b4-4970-4a97-b563-74319b834566 r/w.=
 Quota mode: disabled.
Adding 34603004k swap on /dev/mapper/crypt-swap.  Priority:-2 extents:1 a=
cross:34603004k SSFS
usb 1-3.2: new full-speed USB device number 4 using xhci_hcd
EXT4-fs (nvme0n1p2): mounted filesystem 758145eb-f888-4b0e-acbc-f498dbd12=
0ad r/w with ordered data mode. Quota mode: disabled.
usb 1-3.2: New USB device found, idVendor=3D2ce3, idProduct=3D9563, bcdDe=
vice=3D 1.20
usb 1-3.2: New USB device strings: Mfr=3D1, Product=3D2, SerialNumber=3D0=

usb 1-3.2: Product: EMV Smartcard Reader
usb 1-3.2: Manufacturer: Generic
ath11k_pci 0000:02:00.0: chip_id 0x12 chip_family 0xb board_id 0xff soc_i=
d 0x400c1211
ath11k_pci 0000:02:00.0: fw_version 0x110b196e fw_build_timestamp 2022-12=
-22 12:54 fw_build_id WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3=
=2E6510.23
Bluetooth: Core ver 2.22
elogind-daemon[1540]: Watching system buttons on /dev/input/event3 (Power=
 Button)
elogind-daemon[1540]: Watching system buttons on /dev/input/event0 (Power=
 Button)
elogind-daemon[1540]: Watching system buttons on /dev/input/event1 (Lid S=
witch)
elogind-daemon[1540]: Watching system buttons on /dev/input/event2 (Sleep=
 Button)
elogind-daemon[1540]: Watching system buttons on /dev/input/event4 (AT Tr=
anslated Set 2 keyboard)
elogind-daemon[1540]: Watching system buttons on /dev/input/event11 (Thin=
kPad Extra Buttons)
elogind-daemon[1540]: New seat seat0.
NET: Registered PF_BLUETOOTH protocol family
Bluetooth: HCI device and connection manager initialized
Bluetooth: HCI socket layer initialized
Bluetooth: L2CAP socket layer initialized
Bluetooth: SCO socket layer initialized
usbcore: registered new interface driver btusb
Bluetooth: hci0: HCI Enhanced Setup Synchronous Connection command is adv=
ertised, but not supported.
usb 9-1.2: new full-speed USB device number 4 using xhci_hcd
Console: switching to colour frame buffer device 240x75
amdgpu 0000:04:00.0: [drm] fb0: amdgpudrmfb frame buffer device
ath11k_pci 0000:02:00.0 wlp2s0: renamed from wlan0
usb 9-1.2: New USB device found, idVendor=3D17ef, idProduct=3D30b0, bcdDe=
vice=3D 0.43
usb 9-1.2: New USB device strings: Mfr=3D1, Product=3D2, SerialNumber=3D3=

usb 9-1.2: Product: ThinkPad USB-C Dock Audio
usb 9-1.2: Manufacturer: Lenovo
usb 9-1.2: SerialNumber: 000000000000
usb 10-1.1: new SuperSpeed USB device number 3 using xhci_hcd
usb 10-1.1: New USB device found, idVendor=3D0bda, idProduct=3D8153, bcdD=
evice=3D31.23
usb 10-1.1: New USB device strings: Mfr=3D1, Product=3D2, SerialNumber=3D=
6
usb 10-1.1: Product: Realtek USB LAN
usb 10-1.1: Manufacturer: Realtek
usb 10-1.1: SerialNumber: 321000001
hid-generic 0003:17EF:30B0.0005: hiddev98,hidraw1: USB HID v1.11 Device [=
Lenovo ThinkPad USB-C Dock Audio] on usb-0000:05:00.4-1.2/input3
[drm] Downstream port present 1, type 2
usb 9-1.3: new full-speed USB device number 5 using xhci_hcd
logitech-djreceiver 0003:046D:C52B.0004: hiddev96,hidraw2: USB HID v1.11 =
Device [Logitech USB Receiver] on usb-0000:04:00.4-2/input2
usb 9-1.3: New USB device found, idVendor=3D17ef, idProduct=3D30a9, bcdDe=
vice=3Dd0.d0
usb 9-1.3: New USB device strings: Mfr=3D1, Product=3D2, SerialNumber=3D3=

usb 9-1.3: Product: 40AY
usb 9-1.3: Manufacturer: Lenovo
usb 9-1.3: SerialNumber: 1S40AY0090EUZVR0H3TW
usb 10-1.3: new SuperSpeed Plus Gen 2x1 USB device number 4 using xhci_hc=
d
input: Logitech Wireless Device PID:4051 Mouse as /devices/pci0000:00/000=
0:00:08.1/0000:04:00.4/usb3/3-2/3-2:1.2/0003:046D:C52B.0004/0003:046D:405=
1.0006/input/input25
hid-generic 0003:046D:4051.0006: input,hidraw3: USB HID v1.11 Mouse [Logi=
tech Wireless Device PID:4051] on usb-0000:04:00.4-2/input2:1
usb 10-1.3: New USB device found, idVendor=3D17ef, idProduct=3D30ad, bcdD=
evice=3D51.33
usb 10-1.3: New USB device strings: Mfr=3D1, Product=3D2, SerialNumber=3D=
3
usb 10-1.3: Product: USB3.1 Hub            =20
usb 10-1.3: Manufacturer: VIA Labs, Inc.        =20
usb 10-1.3: SerialNumber: 000000001
input: Logitech M510 as /devices/pci0000:00/0000:00:08.1/0000:04:00.4/usb=
3/3-2/3-2:1.2/0003:046D:C52B.0004/0003:046D:4051.0006/input/input29
logitech-hidpp-device 0003:046D:4051.0006: input,hidraw3: USB HID v1.11 M=
ouse [Logitech M510] on usb-0000:04:00.4-2/input2:1
hub 10-1.3:1.0: USB hub found
hub 10-1.3:1.0: 4 ports detected
usb 9-1.1.2: new high-speed USB device number 6 using xhci_hcd
Bluetooth: BNEP (Ethernet Emulation) ver 1.3
Bluetooth: BNEP filters: protocol multicast
Bluetooth: BNEP socket layer initialized
Bluetooth: MGMT ver 1.22
usbcore: registered new device driver r8152-cfgselector
usbcore: registered new interface driver snd-usb-audio
usb 9-1.1.2: New USB device found, idVendor=3D17ef, idProduct=3D482f, bcd=
Device=3D 0.21
usb 9-1.1.2: New USB device strings: Mfr=3D1, Product=3D2, SerialNumber=3D=
3
usb 9-1.1.2: Product: Lenovo 500 RGB Camera
usb 9-1.1.2: Manufacturer: SunplusIT Inc
usb 9-1.1.2: SerialNumber: 01.00.00
r8152-cfgselector 10-1.1: reset SuperSpeed USB device number 3 using xhci=
_hcd
usb 9-1.1.2: Found UVC 1.50 device Lenovo 500 RGB Camera (17ef:482f)
r8152 10-1.1:1.0 (unnamed net_device) (uninitialized): Invalid header whe=
n reading pass-thru MAC addr
r8152 10-1.1:1.0: load rtl8153b-2 v2 04/27/23 successfully
r8152 10-1.1:1.0 eth0: v1.12.13
usbcore: registered new interface driver r8152
usbcore: registered new interface driver cdc_ether
usbcore: registered new interface driver r8153_ecm
r8152 10-1.1:1.0 enp5s0f4u1u1: renamed from eth0
usb 9-1.1.2: Found UVC 1.50 device Lenovo 500 RGB Camera (17ef:482f)
usb 9-1.1.3: new high-speed USB device number 7 using xhci_hcd
usb 9-1.1.3: New USB device found, idVendor=3D17ef, idProduct=3D30ae, bcd=
Device=3D51.33
usb 9-1.1.3: New USB device strings: Mfr=3D1, Product=3D2, SerialNumber=3D=
3
usb 9-1.1.3: Product: USB2.0 Hub            =20
usb 9-1.1.3: Manufacturer: VIA Labs, Inc.        =20
usb 9-1.1.3: SerialNumber: 000000001
hub 9-1.1.3:1.0: USB hub found
hub 9-1.1.3:1.0: 4 ports detected
usb 9-1.1.3.1: new full-speed USB device number 8 using xhci_hcd
8021q: 802.1Q VLAN Support v1.8
Generic FE-GE Realtek PHY r8169-0-100:00: attached PHY driver (mii_bus:ph=
y_addr=3Dr8169-0-100:00, irq=3DMAC)
usb 9-1.1.3.1: New USB device found, idVendor=3D0b0e, idProduct=3D0420, b=
cdDevice=3D 2.25
usb 9-1.1.3.1: New USB device strings: Mfr=3D0, Product=3D2, SerialNumber=
=3D3
usb 9-1.1.3.1: Product: Jabra SPEAK 510 USB
usb 9-1.1.3.1: SerialNumber: 70BF923A6257021900
r8169 0000:01:00.0 enp1s0f0: Link is Down
usb 9-1.1.3.3: new full-speed USB device number 9 using xhci_hcd
usb 9-1.1.3.3: New USB device found, idVendor=3D046d, idProduct=3Dc318, b=
cdDevice=3D55.03
usb 9-1.1.3.3: New USB device strings: Mfr=3D1, Product=3D2, SerialNumber=
=3D0
usb 9-1.1.3.3: Product: Logitech Illuminated Keyboard
usb 9-1.1.3.3: Manufacturer: Logitech
input: Logitech Logitech Illuminated Keyboard as /devices/pci0000:00/0000=
:00:08.3/0000:05:00.4/usb9/9-1/9-1.1/9-1.1.3/9-1.1.3.3/9-1.1.3.3:1.0/0003=
:046D:C318.0008/input/input30
hid-generic 0003:046D:C318.0008: input,hidraw4: USB HID v1.11 Keyboard [L=
ogitech Logitech Illuminated Keyboard] on usb-0000:05:00.4-1.1.3.3/input0=

input: Logitech Logitech Illuminated Keyboard Consumer Control as /device=
s/pci0000:00/0000:00:08.3/0000:05:00.4/usb9/9-1/9-1.1/9-1.1.3/9-1.1.3.3/9=
-1.1.3.3:1.1/0003:046D:C318.0009/input/input31
hid-generic 0003:046D:C318.0009: input,hiddev97,hidraw5: USB HID v1.11 De=
vice [Logitech Logitech Illuminated Keyboard] on usb-0000:05:00.4-1.1.3.3=
/input1
input: Jabra SPEAK 510 USB as /devices/pci0000:00/0000:00:08.3/0000:05:00=
=2E4/usb9/9-1/9-1.1/9-1.1.3/9-1.1.3.1/9-1.1.3.1:1.3/0003:0B0E:0420.0007/i=
nput/input33
jabra 0003:0B0E:0420.0007: input,hiddev99,hidraw6: USB HID v1.11 Device [=
Jabra SPEAK 510 USB] on usb-0000:05:00.4-1.1.3.1/input3
elogind-daemon[1540]: Watching system buttons on /dev/input/event16 (Logi=
tech Logitech Illuminated Keyboard)
elogind-daemon[1540]: Watching system buttons on /dev/input/event17 (Logi=
tech Logitech Illuminated Keyboard Consumer Control)
r8152 10-1.1:1.0 enp5s0f4u1u1: carrier on
[drm] crtc[1] needs mode_changed
elogind-daemon[1540]: New session c1 of user sddm.
elogind-daemon[1540]: New session 5 of user tfoerste.
elogind-daemon[1540]: Removed session c1.
fuse: init (API version 7.38)
Bluetooth: RFCOMM TTY layer initialized
Bluetooth: RFCOMM socket layer initialized
Bluetooth: RFCOMM ver 1.11
warning: `kdeconnectd' uses wireless extensions which will stop working f=
or Wi-Fi 7 hardware; use nl80211
logitech-hidpp-device 0003:046D:4051.0006: HID++ 4.5 device connected.
--------------tmAQGE30o8GoiMk0FJGzUKDW
Content-Type: text/plain; charset=UTF-8; name=".config"
Content-Disposition: attachment; filename=".config"
Content-Transfer-Encoding: base64

IwojIEF1dG9tYXRpY2FsbHkgZ2VuZXJhdGVkIGZpbGU7IERPIE5PVCBFRElULgojIExpbnV4
L3g4NiA2LjUuMyBLZXJuZWwgQ29uZmlndXJhdGlvbgojCkNPTkZJR19DQ19WRVJTSU9OX1RF
WFQ9ImdjYyAoR2VudG9vIEhhcmRlbmVkIDEyLjMuMV9wMjAyMzA1MjYgcDIpIDEyLjMuMSAy
MDIzMDUyNiIKQ09ORklHX0NDX0lTX0dDQz15CkNPTkZJR19HQ0NfVkVSU0lPTj0xMjAzMDEK
Q09ORklHX0NMQU5HX1ZFUlNJT049MApDT05GSUdfQVNfSVNfR05VPXkKQ09ORklHX0FTX1ZF
UlNJT049MjQwMDAKQ09ORklHX0xEX0lTX0JGRD15CkNPTkZJR19MRF9WRVJTSU9OPTI0MDAw
CkNPTkZJR19MTERfVkVSU0lPTj0wCkNPTkZJR19DQ19DQU5fTElOSz15CkNPTkZJR19DQ19D
QU5fTElOS19TVEFUSUM9eQpDT05GSUdfQ0NfSEFTX0FTTV9HT1RPX09VVFBVVD15CkNPTkZJ
R19DQ19IQVNfQVNNX0dPVE9fVElFRF9PVVRQVVQ9eQpDT05GSUdfVE9PTFNfU1VQUE9SVF9S
RUxSPXkKQ09ORklHX0NDX0hBU19BU01fSU5MSU5FPXkKQ09ORklHX0NDX0hBU19OT19QUk9G
SUxFX0ZOX0FUVFI9eQpDT05GSUdfUEFIT0xFX1ZFUlNJT049MApDT05GSUdfSVJRX1dPUks9
eQpDT05GSUdfQlVJTERUSU1FX1RBQkxFX1NPUlQ9eQpDT05GSUdfVEhSRUFEX0lORk9fSU5f
VEFTSz15CgojCiMgR2VuZXJhbCBzZXR1cAojCkNPTkZJR19JTklUX0VOVl9BUkdfTElNSVQ9
MzIKIyBDT05GSUdfQ09NUElMRV9URVNUIGlzIG5vdCBzZXQKIyBDT05GSUdfV0VSUk9SIGlz
IG5vdCBzZXQKQ09ORklHX0xPQ0FMVkVSU0lPTj0iIgojIENPTkZJR19MT0NBTFZFUlNJT05f
QVVUTyBpcyBub3Qgc2V0CkNPTkZJR19CVUlMRF9TQUxUPSIiCkNPTkZJR19IQVZFX0tFUk5F
TF9HWklQPXkKQ09ORklHX0hBVkVfS0VSTkVMX0JaSVAyPXkKQ09ORklHX0hBVkVfS0VSTkVM
X0xaTUE9eQpDT05GSUdfSEFWRV9LRVJORUxfWFo9eQpDT05GSUdfSEFWRV9LRVJORUxfTFpP
PXkKQ09ORklHX0hBVkVfS0VSTkVMX0xaND15CkNPTkZJR19IQVZFX0tFUk5FTF9aU1REPXkK
IyBDT05GSUdfS0VSTkVMX0daSVAgaXMgbm90IHNldAojIENPTkZJR19LRVJORUxfQlpJUDIg
aXMgbm90IHNldAojIENPTkZJR19LRVJORUxfTFpNQSBpcyBub3Qgc2V0CiMgQ09ORklHX0tF
Uk5FTF9YWiBpcyBub3Qgc2V0CiMgQ09ORklHX0tFUk5FTF9MWk8gaXMgbm90IHNldAojIENP
TkZJR19LRVJORUxfTFo0IGlzIG5vdCBzZXQKQ09ORklHX0tFUk5FTF9aU1REPXkKQ09ORklH
X0RFRkFVTFRfSU5JVD0iIgpDT05GSUdfREVGQVVMVF9IT1NUTkFNRT0iIgpDT05GSUdfU1lT
VklQQz15CkNPTkZJR19TWVNWSVBDX1NZU0NUTD15CkNPTkZJR19QT1NJWF9NUVVFVUU9eQpD
T05GSUdfUE9TSVhfTVFVRVVFX1NZU0NUTD15CkNPTkZJR19XQVRDSF9RVUVVRT15CkNPTkZJ
R19DUk9TU19NRU1PUllfQVRUQUNIPXkKIyBDT05GSUdfVVNFTElCIGlzIG5vdCBzZXQKQ09O
RklHX0FVRElUPXkKQ09ORklHX0hBVkVfQVJDSF9BVURJVFNZU0NBTEw9eQpDT05GSUdfQVVE
SVRTWVNDQUxMPXkKCiMKIyBJUlEgc3Vic3lzdGVtCiMKQ09ORklHX0dFTkVSSUNfSVJRX1BS
T0JFPXkKQ09ORklHX0dFTkVSSUNfSVJRX1NIT1c9eQpDT05GSUdfR0VORVJJQ19JUlFfRUZG
RUNUSVZFX0FGRl9NQVNLPXkKQ09ORklHX0dFTkVSSUNfUEVORElOR19JUlE9eQpDT05GSUdf
R0VORVJJQ19JUlFfTUlHUkFUSU9OPXkKQ09ORklHX0hBUkRJUlFTX1NXX1JFU0VORD15CkNP
TkZJR19JUlFfRE9NQUlOPXkKQ09ORklHX0lSUV9ET01BSU5fSElFUkFSQ0hZPXkKQ09ORklH
X0dFTkVSSUNfTVNJX0lSUT15CkNPTkZJR19JUlFfTVNJX0lPTU1VPXkKQ09ORklHX0dFTkVS
SUNfSVJRX01BVFJJWF9BTExPQ0FUT1I9eQpDT05GSUdfR0VORVJJQ19JUlFfUkVTRVJWQVRJ
T05fTU9ERT15CkNPTkZJR19JUlFfRk9SQ0VEX1RIUkVBRElORz15CkNPTkZJR19TUEFSU0Vf
SVJRPXkKIyBDT05GSUdfR0VORVJJQ19JUlFfREVCVUdGUyBpcyBub3Qgc2V0CiMgZW5kIG9m
IElSUSBzdWJzeXN0ZW0KCkNPTkZJR19DTE9DS1NPVVJDRV9XQVRDSERPRz15CkNPTkZJR19B
UkNIX0NMT0NLU09VUkNFX0lOSVQ9eQpDT05GSUdfQ0xPQ0tTT1VSQ0VfVkFMSURBVEVfTEFT
VF9DWUNMRT15CkNPTkZJR19HRU5FUklDX1RJTUVfVlNZU0NBTEw9eQpDT05GSUdfR0VORVJJ
Q19DTE9DS0VWRU5UUz15CkNPTkZJR19HRU5FUklDX0NMT0NLRVZFTlRTX0JST0FEQ0FTVD15
CkNPTkZJR19HRU5FUklDX0NMT0NLRVZFTlRTX01JTl9BREpVU1Q9eQpDT05GSUdfR0VORVJJ
Q19DTU9TX1VQREFURT15CkNPTkZJR19IQVZFX1BPU0lYX0NQVV9USU1FUlNfVEFTS19XT1JL
PXkKQ09ORklHX1BPU0lYX0NQVV9USU1FUlNfVEFTS19XT1JLPXkKQ09ORklHX0NPTlRFWFRf
VFJBQ0tJTkc9eQpDT05GSUdfQ09OVEVYVF9UUkFDS0lOR19JRExFPXkKCiMKIyBUaW1lcnMg
c3Vic3lzdGVtCiMKQ09ORklHX1RJQ0tfT05FU0hPVD15CkNPTkZJR19OT19IWl9DT01NT049
eQojIENPTkZJR19IWl9QRVJJT0RJQyBpcyBub3Qgc2V0CkNPTkZJR19OT19IWl9JRExFPXkK
IyBDT05GSUdfTk9fSFpfRlVMTCBpcyBub3Qgc2V0CiMgQ09ORklHX05PX0haIGlzIG5vdCBz
ZXQKQ09ORklHX0hJR0hfUkVTX1RJTUVSUz15CkNPTkZJR19DTE9DS1NPVVJDRV9XQVRDSERP
R19NQVhfU0tFV19VUz0xMDAKIyBlbmQgb2YgVGltZXJzIHN1YnN5c3RlbQoKQ09ORklHX0JQ
Rj15CkNPTkZJR19IQVZFX0VCUEZfSklUPXkKQ09ORklHX0FSQ0hfV0FOVF9ERUZBVUxUX0JQ
Rl9KSVQ9eQoKIwojIEJQRiBzdWJzeXN0ZW0KIwojIENPTkZJR19CUEZfU1lTQ0FMTCBpcyBu
b3Qgc2V0CiMgQ09ORklHX0JQRl9KSVQgaXMgbm90IHNldAojIGVuZCBvZiBCUEYgc3Vic3lz
dGVtCgpDT05GSUdfUFJFRU1QVF9WT0xVTlRBUllfQlVJTEQ9eQojIENPTkZJR19QUkVFTVBU
X05PTkUgaXMgbm90IHNldApDT05GSUdfUFJFRU1QVF9WT0xVTlRBUlk9eQojIENPTkZJR19Q
UkVFTVBUIGlzIG5vdCBzZXQKIyBDT05GSUdfUFJFRU1QVF9EWU5BTUlDIGlzIG5vdCBzZXQK
Q09ORklHX1NDSEVEX0NPUkU9eQoKIwojIENQVS9UYXNrIHRpbWUgYW5kIHN0YXRzIGFjY291
bnRpbmcKIwpDT05GSUdfVElDS19DUFVfQUNDT1VOVElORz15CiMgQ09ORklHX1ZJUlRfQ1BV
X0FDQ09VTlRJTkdfR0VOIGlzIG5vdCBzZXQKQ09ORklHX0lSUV9USU1FX0FDQ09VTlRJTkc9
eQpDT05GSUdfSEFWRV9TQ0hFRF9BVkdfSVJRPXkKQ09ORklHX0JTRF9QUk9DRVNTX0FDQ1Q9
eQpDT05GSUdfQlNEX1BST0NFU1NfQUNDVF9WMz15CkNPTkZJR19UQVNLU1RBVFM9eQpDT05G
SUdfVEFTS19ERUxBWV9BQ0NUPXkKQ09ORklHX1RBU0tfWEFDQ1Q9eQpDT05GSUdfVEFTS19J
T19BQ0NPVU5USU5HPXkKIyBDT05GSUdfUFNJIGlzIG5vdCBzZXQKIyBlbmQgb2YgQ1BVL1Rh
c2sgdGltZSBhbmQgc3RhdHMgYWNjb3VudGluZwoKQ09ORklHX0NQVV9JU09MQVRJT049eQoK
IwojIFJDVSBTdWJzeXN0ZW0KIwpDT05GSUdfVFJFRV9SQ1U9eQojIENPTkZJR19SQ1VfRVhQ
RVJUIGlzIG5vdCBzZXQKQ09ORklHX1RSRUVfU1JDVT15CkNPTkZJR19SQ1VfU1RBTExfQ09N
TU9OPXkKQ09ORklHX1JDVV9ORUVEX1NFR0NCTElTVD15CiMgZW5kIG9mIFJDVSBTdWJzeXN0
ZW0KCkNPTkZJR19JS0NPTkZJRz15CkNPTkZJR19JS0NPTkZJR19QUk9DPXkKIyBDT05GSUdf
SUtIRUFERVJTIGlzIG5vdCBzZXQKQ09ORklHX0xPR19CVUZfU0hJRlQ9MTgKQ09ORklHX0xP
R19DUFVfTUFYX0JVRl9TSElGVD0xMgojIENPTkZJR19QUklOVEtfSU5ERVggaXMgbm90IHNl
dApDT05GSUdfSEFWRV9VTlNUQUJMRV9TQ0hFRF9DTE9DSz15CgojCiMgU2NoZWR1bGVyIGZl
YXR1cmVzCiMKIyBDT05GSUdfVUNMQU1QX1RBU0sgaXMgbm90IHNldAojIGVuZCBvZiBTY2hl
ZHVsZXIgZmVhdHVyZXMKCkNPTkZJR19BUkNIX1NVUFBPUlRTX05VTUFfQkFMQU5DSU5HPXkK
Q09ORklHX0FSQ0hfV0FOVF9CQVRDSEVEX1VOTUFQX1RMQl9GTFVTSD15CkNPTkZJR19DQ19I
QVNfSU5UMTI4PXkKQ09ORklHX0NDX0lNUExJQ0lUX0ZBTExUSFJPVUdIPSItV2ltcGxpY2l0
LWZhbGx0aHJvdWdoPTUiCkNPTkZJR19HQ0MxMV9OT19BUlJBWV9CT1VORFM9eQpDT05GSUdf
Q0NfTk9fQVJSQVlfQk9VTkRTPXkKQ09ORklHX0FSQ0hfU1VQUE9SVFNfSU5UMTI4PXkKQ09O
RklHX05VTUFfQkFMQU5DSU5HPXkKQ09ORklHX05VTUFfQkFMQU5DSU5HX0RFRkFVTFRfRU5B
QkxFRD15CkNPTkZJR19DR1JPVVBTPXkKQ09ORklHX1BBR0VfQ09VTlRFUj15CiMgQ09ORklH
X0NHUk9VUF9GQVZPUl9EWU5NT0RTIGlzIG5vdCBzZXQKQ09ORklHX01FTUNHPXkKQ09ORklH
X01FTUNHX0tNRU09eQpDT05GSUdfQkxLX0NHUk9VUD15CkNPTkZJR19DR1JPVVBfV1JJVEVC
QUNLPXkKQ09ORklHX0NHUk9VUF9TQ0hFRD15CkNPTkZJR19GQUlSX0dST1VQX1NDSEVEPXkK
Q09ORklHX0NGU19CQU5EV0lEVEg9eQpDT05GSUdfUlRfR1JPVVBfU0NIRUQ9eQpDT05GSUdf
U0NIRURfTU1fQ0lEPXkKQ09ORklHX0NHUk9VUF9QSURTPXkKIyBDT05GSUdfQ0dST1VQX1JE
TUEgaXMgbm90IHNldApDT05GSUdfQ0dST1VQX0ZSRUVaRVI9eQpDT05GSUdfQ0dST1VQX0hV
R0VUTEI9eQpDT05GSUdfQ1BVU0VUUz15CkNPTkZJR19QUk9DX1BJRF9DUFVTRVQ9eQpDT05G
SUdfQ0dST1VQX0RFVklDRT15CkNPTkZJR19DR1JPVVBfQ1BVQUNDVD15CkNPTkZJR19DR1JP
VVBfUEVSRj15CkNPTkZJR19DR1JPVVBfTUlTQz15CiMgQ09ORklHX0NHUk9VUF9ERUJVRyBp
cyBub3Qgc2V0CkNPTkZJR19TT0NLX0NHUk9VUF9EQVRBPXkKQ09ORklHX05BTUVTUEFDRVM9
eQpDT05GSUdfVVRTX05TPXkKQ09ORklHX1RJTUVfTlM9eQpDT05GSUdfSVBDX05TPXkKQ09O
RklHX1VTRVJfTlM9eQpDT05GSUdfUElEX05TPXkKQ09ORklHX05FVF9OUz15CkNPTkZJR19D
SEVDS1BPSU5UX1JFU1RPUkU9eQpDT05GSUdfU0NIRURfQVVUT0dST1VQPXkKQ09ORklHX1JF
TEFZPXkKIyBDT05GSUdfQkxLX0RFVl9JTklUUkQgaXMgbm90IHNldAojIENPTkZJR19CT09U
X0NPTkZJRyBpcyBub3Qgc2V0CiMgQ09ORklHX0lOSVRSQU1GU19QUkVTRVJWRV9NVElNRSBp
cyBub3Qgc2V0CkNPTkZJR19DQ19PUFRJTUlaRV9GT1JfUEVSRk9STUFOQ0U9eQojIENPTkZJ
R19DQ19PUFRJTUlaRV9GT1JfU0laRSBpcyBub3Qgc2V0CkNPTkZJR19MRF9PUlBIQU5fV0FS
Tj15CkNPTkZJR19MRF9PUlBIQU5fV0FSTl9MRVZFTD0id2FybiIKQ09ORklHX1NZU0NUTD15
CkNPTkZJR19TWVNDVExfRVhDRVBUSU9OX1RSQUNFPXkKQ09ORklHX0hBVkVfUENTUEtSX1BM
QVRGT1JNPXkKQ09ORklHX0VYUEVSVD15CkNPTkZJR19NVUxUSVVTRVI9eQpDT05GSUdfU0dF
VE1BU0tfU1lTQ0FMTD15CkNPTkZJR19TWVNGU19TWVNDQUxMPXkKQ09ORklHX0ZIQU5ETEU9
eQpDT05GSUdfUE9TSVhfVElNRVJTPXkKQ09ORklHX1BSSU5USz15CkNPTkZJR19CVUc9eQpD
T05GSUdfRUxGX0NPUkU9eQojIENPTkZJR19QQ1NQS1JfUExBVEZPUk0gaXMgbm90IHNldApD
T05GSUdfQkFTRV9GVUxMPXkKQ09ORklHX0ZVVEVYPXkKQ09ORklHX0ZVVEVYX1BJPXkKQ09O
RklHX0VQT0xMPXkKQ09ORklHX1NJR05BTEZEPXkKQ09ORklHX1RJTUVSRkQ9eQpDT05GSUdf
RVZFTlRGRD15CkNPTkZJR19TSE1FTT15CkNPTkZJR19BSU89eQpDT05GSUdfSU9fVVJJTkc9
eQpDT05GSUdfQURWSVNFX1NZU0NBTExTPXkKQ09ORklHX01FTUJBUlJJRVI9eQpDT05GSUdf
S0FMTFNZTVM9eQojIENPTkZJR19LQUxMU1lNU19TRUxGVEVTVCBpcyBub3Qgc2V0CiMgQ09O
RklHX0tBTExTWU1TX0FMTCBpcyBub3Qgc2V0CkNPTkZJR19LQUxMU1lNU19BQlNPTFVURV9Q
RVJDUFU9eQpDT05GSUdfS0FMTFNZTVNfQkFTRV9SRUxBVElWRT15CkNPTkZJR19BUkNIX0hB
U19NRU1CQVJSSUVSX1NZTkNfQ09SRT15CkNPTkZJR19LQ01QPXkKQ09ORklHX1JTRVE9eQpD
T05GSUdfQ0FDSEVTVEFUX1NZU0NBTEw9eQojIENPTkZJR19ERUJVR19SU0VRIGlzIG5vdCBz
ZXQKIyBDT05GSUdfRU1CRURERUQgaXMgbm90IHNldApDT05GSUdfSEFWRV9QRVJGX0VWRU5U
Uz15CkNPTkZJR19HVUVTVF9QRVJGX0VWRU5UUz15CiMgQ09ORklHX1BDMTA0IGlzIG5vdCBz
ZXQKCiMKIyBLZXJuZWwgUGVyZm9ybWFuY2UgRXZlbnRzIEFuZCBDb3VudGVycwojCkNPTkZJ
R19QRVJGX0VWRU5UUz15CiMgQ09ORklHX0RFQlVHX1BFUkZfVVNFX1ZNQUxMT0MgaXMgbm90
IHNldAojIGVuZCBvZiBLZXJuZWwgUGVyZm9ybWFuY2UgRXZlbnRzIEFuZCBDb3VudGVycwoK
Q09ORklHX1NZU1RFTV9EQVRBX1ZFUklGSUNBVElPTj15CiMgQ09ORklHX1BST0ZJTElORyBp
cyBub3Qgc2V0CiMgZW5kIG9mIEdlbmVyYWwgc2V0dXAKCkNPTkZJR182NEJJVD15CkNPTkZJ
R19YODZfNjQ9eQpDT05GSUdfWDg2PXkKQ09ORklHX0lOU1RSVUNUSU9OX0RFQ09ERVI9eQpD
T05GSUdfT1VUUFVUX0ZPUk1BVD0iZWxmNjQteDg2LTY0IgpDT05GSUdfTE9DS0RFUF9TVVBQ
T1JUPXkKQ09ORklHX1NUQUNLVFJBQ0VfU1VQUE9SVD15CkNPTkZJR19NTVU9eQpDT05GSUdf
QVJDSF9NTUFQX1JORF9CSVRTX01JTj0yOApDT05GSUdfQVJDSF9NTUFQX1JORF9CSVRTX01B
WD0zMgpDT05GSUdfQVJDSF9NTUFQX1JORF9DT01QQVRfQklUU19NSU49OApDT05GSUdfQVJD
SF9NTUFQX1JORF9DT01QQVRfQklUU19NQVg9MTYKQ09ORklHX0dFTkVSSUNfSVNBX0RNQT15
CkNPTkZJR19HRU5FUklDX0JVRz15CkNPTkZJR19HRU5FUklDX0JVR19SRUxBVElWRV9QT0lO
VEVSUz15CkNPTkZJR19BUkNIX01BWV9IQVZFX1BDX0ZEQz15CkNPTkZJR19HRU5FUklDX0NB
TElCUkFURV9ERUxBWT15CkNPTkZJR19BUkNIX0hBU19DUFVfUkVMQVg9eQpDT05GSUdfQVJD
SF9ISUJFUk5BVElPTl9QT1NTSUJMRT15CkNPTkZJR19BUkNIX1NVU1BFTkRfUE9TU0lCTEU9
eQpDT05GSUdfQVVESVRfQVJDSD15CkNPTkZJR19IQVZFX0lOVEVMX1RYVD15CkNPTkZJR19Y
ODZfNjRfU01QPXkKQ09ORklHX0FSQ0hfU1VQUE9SVFNfVVBST0JFUz15CkNPTkZJR19GSVhf
RUFSTFlDT05fTUVNPXkKQ09ORklHX0RZTkFNSUNfUEhZU0lDQUxfTUFTSz15CkNPTkZJR19Q
R1RBQkxFX0xFVkVMUz00CkNPTkZJR19DQ19IQVNfU0FORV9TVEFDS1BST1RFQ1RPUj15Cgoj
CiMgUHJvY2Vzc29yIHR5cGUgYW5kIGZlYXR1cmVzCiMKQ09ORklHX1NNUD15CkNPTkZJR19Y
ODZfWDJBUElDPXkKIyBDT05GSUdfWDg2X01QUEFSU0UgaXMgbm90IHNldAojIENPTkZJR19H
T0xERklTSCBpcyBub3Qgc2V0CkNPTkZJR19YODZfQ1BVX1JFU0NUUkw9eQojIENPTkZJR19Y
ODZfRVhURU5ERURfUExBVEZPUk0gaXMgbm90IHNldApDT05GSUdfWDg2X0lOVEVMX0xQU1M9
eQpDT05GSUdfWDg2X0FNRF9QTEFURk9STV9ERVZJQ0U9eQpDT05GSUdfSU9TRl9NQkk9eQoj
IENPTkZJR19JT1NGX01CSV9ERUJVRyBpcyBub3Qgc2V0CkNPTkZJR19YODZfU1VQUE9SVFNf
TUVNT1JZX0ZBSUxVUkU9eQojIENPTkZJR19TQ0hFRF9PTUlUX0ZSQU1FX1BPSU5URVIgaXMg
bm90IHNldApDT05GSUdfSFlQRVJWSVNPUl9HVUVTVD15CkNPTkZJR19QQVJBVklSVD15CiMg
Q09ORklHX1BBUkFWSVJUX0RFQlVHIGlzIG5vdCBzZXQKQ09ORklHX1BBUkFWSVJUX1NQSU5M
T0NLUz15CkNPTkZJR19YODZfSFZfQ0FMTEJBQ0tfVkVDVE9SPXkKIyBDT05GSUdfWEVOIGlz
IG5vdCBzZXQKQ09ORklHX0tWTV9HVUVTVD15CkNPTkZJR19BUkNIX0NQVUlETEVfSEFMVFBP
TEw9eQpDT05GSUdfUFZIPXkKQ09ORklHX1BBUkFWSVJUX1RJTUVfQUNDT1VOVElORz15CkNP
TkZJR19QQVJBVklSVF9DTE9DSz15CiMgQ09ORklHX0pBSUxIT1VTRV9HVUVTVCBpcyBub3Qg
c2V0CiMgQ09ORklHX0FDUk5fR1VFU1QgaXMgbm90IHNldAojIENPTkZJR19NSzggaXMgbm90
IHNldAojIENPTkZJR19NUFNDIGlzIG5vdCBzZXQKIyBDT05GSUdfTUNPUkUyIGlzIG5vdCBz
ZXQKIyBDT05GSUdfTUFUT00gaXMgbm90IHNldApDT05GSUdfR0VORVJJQ19DUFU9eQpDT05G
SUdfWDg2X0lOVEVSTk9ERV9DQUNIRV9TSElGVD02CkNPTkZJR19YODZfTDFfQ0FDSEVfU0hJ
RlQ9NgpDT05GSUdfWDg2X1RTQz15CkNPTkZJR19YODZfQ01QWENIRzY0PXkKQ09ORklHX1g4
Nl9DTU9WPXkKQ09ORklHX1g4Nl9NSU5JTVVNX0NQVV9GQU1JTFk9NjQKQ09ORklHX1g4Nl9E
RUJVR0NUTE1TUj15CkNPTkZJR19QUk9DRVNTT1JfU0VMRUNUPXkKIyBDT05GSUdfQ1BVX1NV
UF9JTlRFTCBpcyBub3Qgc2V0CkNPTkZJR19DUFVfU1VQX0FNRD15CiMgQ09ORklHX0NQVV9T
VVBfSFlHT04gaXMgbm90IHNldAojIENPTkZJR19DUFVfU1VQX0NFTlRBVVIgaXMgbm90IHNl
dAojIENPTkZJR19DUFVfU1VQX1pIQU9YSU4gaXMgbm90IHNldApDT05GSUdfSFBFVF9USU1F
Uj15CkNPTkZJR19IUEVUX0VNVUxBVEVfUlRDPXkKQ09ORklHX0RNST15CiMgQ09ORklHX0dB
UlRfSU9NTVUgaXMgbm90IHNldApDT05GSUdfQk9PVF9WRVNBX1NVUFBPUlQ9eQojIENPTkZJ
R19NQVhTTVAgaXMgbm90IHNldApDT05GSUdfTlJfQ1BVU19SQU5HRV9CRUdJTj0yCkNPTkZJ
R19OUl9DUFVTX1JBTkdFX0VORD01MTIKQ09ORklHX05SX0NQVVNfREVGQVVMVD02NApDT05G
SUdfTlJfQ1BVUz0xNgpDT05GSUdfU0NIRURfQ0xVU1RFUj15CkNPTkZJR19TQ0hFRF9TTVQ9
eQpDT05GSUdfU0NIRURfTUM9eQpDT05GSUdfWDg2X0xPQ0FMX0FQSUM9eQpDT05GSUdfWDg2
X0lPX0FQSUM9eQpDT05GSUdfWDg2X1JFUk9VVEVfRk9SX0JST0tFTl9CT09UX0lSUVM9eQpD
T05GSUdfWDg2X01DRT15CkNPTkZJR19YODZfTUNFTE9HX0xFR0FDWT15CiMgQ09ORklHX1g4
Nl9NQ0VfSU5URUwgaXMgbm90IHNldApDT05GSUdfWDg2X01DRV9BTUQ9eQpDT05GSUdfWDg2
X01DRV9USFJFU0hPTEQ9eQojIENPTkZJR19YODZfTUNFX0lOSkVDVCBpcyBub3Qgc2V0Cgoj
CiMgUGVyZm9ybWFuY2UgbW9uaXRvcmluZwojCkNPTkZJR19QRVJGX0VWRU5UU19JTlRFTF9S
QVBMPW0KQ09ORklHX1BFUkZfRVZFTlRTX0FNRF9QT1dFUj1tCkNPTkZJR19QRVJGX0VWRU5U
U19BTURfVU5DT1JFPW0KQ09ORklHX1BFUkZfRVZFTlRTX0FNRF9CUlM9eQojIGVuZCBvZiBQ
ZXJmb3JtYW5jZSBtb25pdG9yaW5nCgpDT05GSUdfWDg2XzE2QklUPXkKQ09ORklHX1g4Nl9F
U1BGSVg2ND15CkNPTkZJR19YODZfVlNZU0NBTExfRU1VTEFUSU9OPXkKIyBDT05GSUdfWDg2
X0lPUExfSU9QRVJNIGlzIG5vdCBzZXQKQ09ORklHX01JQ1JPQ09ERT15CkNPTkZJR19NSUNS
T0NPREVfQU1EPXkKIyBDT05GSUdfTUlDUk9DT0RFX0xBVEVfTE9BRElORyBpcyBub3Qgc2V0
CkNPTkZJR19YODZfTVNSPXkKQ09ORklHX1g4Nl9DUFVJRD15CiMgQ09ORklHX1g4Nl81TEVW
RUwgaXMgbm90IHNldApDT05GSUdfWDg2X0RJUkVDVF9HQlBBR0VTPXkKIyBDT05GSUdfWDg2
X0NQQV9TVEFUSVNUSUNTIGlzIG5vdCBzZXQKQ09ORklHX1g4Nl9NRU1fRU5DUllQVD15CkNP
TkZJR19BTURfTUVNX0VOQ1JZUFQ9eQpDT05GSUdfQU1EX01FTV9FTkNSWVBUX0FDVElWRV9C
WV9ERUZBVUxUPXkKQ09ORklHX05VTUE9eQojIENPTkZJR19BTURfTlVNQSBpcyBub3Qgc2V0
CkNPTkZJR19YODZfNjRfQUNQSV9OVU1BPXkKIyBDT05GSUdfTlVNQV9FTVUgaXMgbm90IHNl
dApDT05GSUdfTk9ERVNfU0hJRlQ9NApDT05GSUdfQVJDSF9TUEFSU0VNRU1fRU5BQkxFPXkK
Q09ORklHX0FSQ0hfU1BBUlNFTUVNX0RFRkFVTFQ9eQpDT05GSUdfQVJDSF9QUk9DX0tDT1JF
X1RFWFQ9eQpDT05GSUdfSUxMRUdBTF9QT0lOVEVSX1ZBTFVFPTB4ZGVhZDAwMDAwMDAwMDAw
MApDT05GSUdfWDg2X1BNRU1fTEVHQUNZX0RFVklDRT15CkNPTkZJR19YODZfUE1FTV9MRUdB
Q1k9eQpDT05GSUdfWDg2X0NIRUNLX0JJT1NfQ09SUlVQVElPTj15CkNPTkZJR19YODZfQk9P
VFBBUkFNX01FTU9SWV9DT1JSVVBUSU9OX0NIRUNLPXkKQ09ORklHX01UUlI9eQpDT05GSUdf
TVRSUl9TQU5JVElaRVI9eQpDT05GSUdfTVRSUl9TQU5JVElaRVJfRU5BQkxFX0RFRkFVTFQ9
MApDT05GSUdfTVRSUl9TQU5JVElaRVJfU1BBUkVfUkVHX05SX0RFRkFVTFQ9MQpDT05GSUdf
WDg2X1BBVD15CkNPTkZJR19BUkNIX1VTRVNfUEdfVU5DQUNIRUQ9eQpDT05GSUdfWDg2X1VN
SVA9eQpDT05GSUdfQ0NfSEFTX0lCVD15CkNPTkZJR19YODZfS0VSTkVMX0lCVD15CkNPTkZJ
R19YODZfSU5URUxfTUVNT1JZX1BST1RFQ1RJT05fS0VZUz15CkNPTkZJR19FRkk9eQpDT05G
SUdfRUZJX1NUVUI9eQpDT05GSUdfRUZJX0hBTkRPVkVSX1BST1RPQ09MPXkKIyBDT05GSUdf
RUZJX01JWEVEIGlzIG5vdCBzZXQKIyBDT05GSUdfRUZJX0ZBS0VfTUVNTUFQIGlzIG5vdCBz
ZXQKIyBDT05GSUdfRUZJX1JVTlRJTUVfTUFQIGlzIG5vdCBzZXQKIyBDT05GSUdfSFpfMTAw
IGlzIG5vdCBzZXQKIyBDT05GSUdfSFpfMjUwIGlzIG5vdCBzZXQKQ09ORklHX0haXzMwMD15
CiMgQ09ORklHX0haXzEwMDAgaXMgbm90IHNldApDT05GSUdfSFo9MzAwCkNPTkZJR19TQ0hF
RF9IUlRJQ0s9eQojIENPTkZJR19LRVhFQyBpcyBub3Qgc2V0CiMgQ09ORklHX0tFWEVDX0ZJ
TEUgaXMgbm90IHNldAojIENPTkZJR19DUkFTSF9EVU1QIGlzIG5vdCBzZXQKQ09ORklHX1BI
WVNJQ0FMX1NUQVJUPTB4MTAwMDAwMApDT05GSUdfUkVMT0NBVEFCTEU9eQpDT05GSUdfUkFO
RE9NSVpFX0JBU0U9eQpDT05GSUdfWDg2X05FRURfUkVMT0NTPXkKQ09ORklHX1BIWVNJQ0FM
X0FMSUdOPTB4MTAwMDAwMApDT05GSUdfRFlOQU1JQ19NRU1PUllfTEFZT1VUPXkKQ09ORklH
X1JBTkRPTUlaRV9NRU1PUlk9eQpDT05GSUdfUkFORE9NSVpFX01FTU9SWV9QSFlTSUNBTF9Q
QURESU5HPTB4YQojIENPTkZJR19BRERSRVNTX01BU0tJTkcgaXMgbm90IHNldApDT05GSUdf
SE9UUExVR19DUFU9eQojIENPTkZJR19MRUdBQ1lfVlNZU0NBTExfWE9OTFkgaXMgbm90IHNl
dApDT05GSUdfTEVHQUNZX1ZTWVNDQUxMX05PTkU9eQojIENPTkZJR19DTURMSU5FX0JPT0wg
aXMgbm90IHNldApDT05GSUdfTU9ESUZZX0xEVF9TWVNDQUxMPXkKIyBDT05GSUdfU1RSSUNU
X1NJR0FMVFNUQUNLX1NJWkUgaXMgbm90IHNldApDT05GSUdfSEFWRV9MSVZFUEFUQ0g9eQoj
IGVuZCBvZiBQcm9jZXNzb3IgdHlwZSBhbmQgZmVhdHVyZXMKCkNPTkZJR19DQ19IQVNfU0xT
PXkKQ09ORklHX0NDX0hBU19SRVRVUk5fVEhVTks9eQpDT05GSUdfQ0NfSEFTX0VOVFJZX1BB
RERJTkc9eQpDT05GSUdfRlVOQ1RJT05fUEFERElOR19DRkk9MTEKQ09ORklHX0ZVTkNUSU9O
X1BBRERJTkdfQllURVM9MTYKQ09ORklHX0hBVkVfQ0FMTF9USFVOS1M9eQpDT05GSUdfU1BF
Q1VMQVRJT05fTUlUSUdBVElPTlM9eQpDT05GSUdfUEFHRV9UQUJMRV9JU09MQVRJT049eQpD
T05GSUdfUkVUUE9MSU5FPXkKQ09ORklHX1JFVEhVTks9eQpDT05GSUdfQ1BVX1VOUkVUX0VO
VFJZPXkKQ09ORklHX0NQVV9JQlBCX0VOVFJZPXkKQ09ORklHX0NQVV9TUlNPPXkKQ09ORklH
X1NMUz15CkNPTkZJR19BUkNIX0hBU19BRERfUEFHRVM9eQpDT05GSUdfQVJDSF9NSFBfTUVN
TUFQX09OX01FTU9SWV9FTkFCTEU9eQoKIwojIFBvd2VyIG1hbmFnZW1lbnQgYW5kIEFDUEkg
b3B0aW9ucwojCkNPTkZJR19TVVNQRU5EPXkKQ09ORklHX1NVU1BFTkRfRlJFRVpFUj15CiMg
Q09ORklHX1NVU1BFTkRfU0tJUF9TWU5DIGlzIG5vdCBzZXQKIyBDT05GSUdfSElCRVJOQVRJ
T04gaXMgbm90IHNldApDT05GSUdfUE1fU0xFRVA9eQpDT05GSUdfUE1fU0xFRVBfU01QPXkK
IyBDT05GSUdfUE1fQVVUT1NMRUVQIGlzIG5vdCBzZXQKIyBDT05GSUdfUE1fVVNFUlNQQUNF
X0FVVE9TTEVFUCBpcyBub3Qgc2V0CiMgQ09ORklHX1BNX1dBS0VMT0NLUyBpcyBub3Qgc2V0
CkNPTkZJR19QTT15CiMgQ09ORklHX1BNX0RFQlVHIGlzIG5vdCBzZXQKQ09ORklHX1BNX0NM
Sz15CkNPTkZJR19QTV9HRU5FUklDX0RPTUFJTlM9eQojIENPTkZJR19XUV9QT1dFUl9FRkZJ
Q0lFTlRfREVGQVVMVCBpcyBub3Qgc2V0CkNPTkZJR19QTV9HRU5FUklDX0RPTUFJTlNfU0xF
RVA9eQpDT05GSUdfRU5FUkdZX01PREVMPXkKQ09ORklHX0FSQ0hfU1VQUE9SVFNfQUNQST15
CkNPTkZJR19BQ1BJPXkKQ09ORklHX0FDUElfTEVHQUNZX1RBQkxFU19MT09LVVA9eQpDT05G
SUdfQVJDSF9NSUdIVF9IQVZFX0FDUElfUERDPXkKQ09ORklHX0FDUElfU1lTVEVNX1BPV0VS
X1NUQVRFU19TVVBQT1JUPXkKQ09ORklHX0FDUElfVEFCTEVfTElCPXkKIyBDT05GSUdfQUNQ
SV9ERUJVR0dFUiBpcyBub3Qgc2V0CkNPTkZJR19BQ1BJX1NQQ1JfVEFCTEU9eQpDT05GSUdf
QUNQSV9GUERUPXkKQ09ORklHX0FDUElfTFBJVD15CkNPTkZJR19BQ1BJX1NMRUVQPXkKIyBD
T05GSUdfQUNQSV9SRVZfT1ZFUlJJREVfUE9TU0lCTEUgaXMgbm90IHNldAojIENPTkZJR19B
Q1BJX0VDX0RFQlVHRlMgaXMgbm90IHNldApDT05GSUdfQUNQSV9BQz15CkNPTkZJR19BQ1BJ
X0JBVFRFUlk9eQpDT05GSUdfQUNQSV9CVVRUT049eQpDT05GSUdfQUNQSV9WSURFTz1tCkNP
TkZJR19BQ1BJX0ZBTj15CkNPTkZJR19BQ1BJX1RBRD1tCkNPTkZJR19BQ1BJX0RPQ0s9eQpD
T05GSUdfQUNQSV9DUFVfRlJFUV9QU1M9eQpDT05GSUdfQUNQSV9QUk9DRVNTT1JfQ1NUQVRF
PXkKQ09ORklHX0FDUElfUFJPQ0VTU09SX0lETEU9eQpDT05GSUdfQUNQSV9DUFBDX0xJQj15
CkNPTkZJR19BQ1BJX1BST0NFU1NPUj15CkNPTkZJR19BQ1BJX0hPVFBMVUdfQ1BVPXkKQ09O
RklHX0FDUElfUFJPQ0VTU09SX0FHR1JFR0FUT1I9eQpDT05GSUdfQUNQSV9USEVSTUFMPXkK
Q09ORklHX0FDUElfUExBVEZPUk1fUFJPRklMRT1tCkNPTkZJR19BUkNIX0hBU19BQ1BJX1RB
QkxFX1VQR1JBREU9eQojIENPTkZJR19BQ1BJX0RFQlVHIGlzIG5vdCBzZXQKIyBDT05GSUdf
QUNQSV9QQ0lfU0xPVCBpcyBub3Qgc2V0CkNPTkZJR19BQ1BJX0NPTlRBSU5FUj15CkNPTkZJ
R19BQ1BJX0hPVFBMVUdfSU9BUElDPXkKIyBDT05GSUdfQUNQSV9TQlMgaXMgbm90IHNldApD
T05GSUdfQUNQSV9IRUQ9eQojIENPTkZJR19BQ1BJX0NVU1RPTV9NRVRIT0QgaXMgbm90IHNl
dAojIENPTkZJR19BQ1BJX0JHUlQgaXMgbm90IHNldAojIENPTkZJR19BQ1BJX1JFRFVDRURf
SEFSRFdBUkVfT05MWSBpcyBub3Qgc2V0CiMgQ09ORklHX0FDUElfTkZJVCBpcyBub3Qgc2V0
CkNPTkZJR19BQ1BJX05VTUE9eQpDT05GSUdfQUNQSV9ITUFUPXkKQ09ORklHX0hBVkVfQUNQ
SV9BUEVJPXkKQ09ORklHX0hBVkVfQUNQSV9BUEVJX05NST15CkNPTkZJR19BQ1BJX0FQRUk9
eQpDT05GSUdfQUNQSV9BUEVJX0dIRVM9eQpDT05GSUdfQUNQSV9BUEVJX1BDSUVBRVI9eQpD
T05GSUdfQUNQSV9BUEVJX01FTU9SWV9GQUlMVVJFPXkKIyBDT05GSUdfQUNQSV9BUEVJX0VJ
TkogaXMgbm90IHNldAojIENPTkZJR19BQ1BJX0FQRUlfRVJTVF9ERUJVRyBpcyBub3Qgc2V0
CkNPTkZJR19BQ1BJX0RQVEY9eQojIENPTkZJR19EUFRGX1BPV0VSIGlzIG5vdCBzZXQKIyBD
T05GSUdfRFBURl9QQ0hfRklWUiBpcyBub3Qgc2V0CkNPTkZJR19BQ1BJX0VYVExPRz1tCiMg
Q09ORklHX0FDUElfQ09ORklHRlMgaXMgbm90IHNldAojIENPTkZJR19BQ1BJX1BGUlVUIGlz
IG5vdCBzZXQKQ09ORklHX0FDUElfUENDPXkKIyBDT05GSUdfQUNQSV9GRkggaXMgbm90IHNl
dApDT05GSUdfUE1JQ19PUFJFR0lPTj15CkNPTkZJR19CWVRDUkNfUE1JQ19PUFJFR0lPTj15
CkNPTkZJR19DSFRDUkNfUE1JQ19PUFJFR0lPTj15CkNPTkZJR19YUE9XRVJfUE1JQ19PUFJF
R0lPTj15CkNPTkZJR19DSFRfV0NfUE1JQ19PUFJFR0lPTj15CkNPTkZJR19BQ1BJX1BSTVQ9
eQpDT05GSUdfWDg2X1BNX1RJTUVSPXkKCiMKIyBDUFUgRnJlcXVlbmN5IHNjYWxpbmcKIwpD
T05GSUdfQ1BVX0ZSRVE9eQpDT05GSUdfQ1BVX0ZSRVFfR09WX0FUVFJfU0VUPXkKIyBDT05G
SUdfQ1BVX0ZSRVFfU1RBVCBpcyBub3Qgc2V0CiMgQ09ORklHX0NQVV9GUkVRX0RFRkFVTFRf
R09WX1BFUkZPUk1BTkNFIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1BVX0ZSRVFfREVGQVVMVF9H
T1ZfUE9XRVJTQVZFIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1BVX0ZSRVFfREVGQVVMVF9HT1Zf
VVNFUlNQQUNFIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1BVX0ZSRVFfREVGQVVMVF9HT1ZfT05E
RU1BTkQgaXMgbm90IHNldAojIENPTkZJR19DUFVfRlJFUV9ERUZBVUxUX0dPVl9DT05TRVJW
QVRJVkUgaXMgbm90IHNldApDT05GSUdfQ1BVX0ZSRVFfREVGQVVMVF9HT1ZfU0NIRURVVElM
PXkKQ09ORklHX0NQVV9GUkVRX0dPVl9QRVJGT1JNQU5DRT15CiMgQ09ORklHX0NQVV9GUkVR
X0dPVl9QT1dFUlNBVkUgaXMgbm90IHNldAojIENPTkZJR19DUFVfRlJFUV9HT1ZfVVNFUlNQ
QUNFIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1BVX0ZSRVFfR09WX09OREVNQU5EIGlzIG5vdCBz
ZXQKIyBDT05GSUdfQ1BVX0ZSRVFfR09WX0NPTlNFUlZBVElWRSBpcyBub3Qgc2V0CkNPTkZJ
R19DUFVfRlJFUV9HT1ZfU0NIRURVVElMPXkKCiMKIyBDUFUgZnJlcXVlbmN5IHNjYWxpbmcg
ZHJpdmVycwojCiMgQ09ORklHX1g4Nl9JTlRFTF9QU1RBVEUgaXMgbm90IHNldAojIENPTkZJ
R19YODZfUENDX0NQVUZSRVEgaXMgbm90IHNldApDT05GSUdfWDg2X0FNRF9QU1RBVEU9eQpD
T05GSUdfWDg2X0FNRF9QU1RBVEVfREVGQVVMVF9NT0RFPTQKQ09ORklHX1g4Nl9BTURfUFNU
QVRFX1VUPW0KIyBDT05GSUdfWDg2X0FDUElfQ1BVRlJFUSBpcyBub3Qgc2V0CiMgQ09ORklH
X1g4Nl9TUEVFRFNURVBfQ0VOVFJJTk8gaXMgbm90IHNldAojIENPTkZJR19YODZfUDRfQ0xP
Q0tNT0QgaXMgbm90IHNldAoKIwojIHNoYXJlZCBvcHRpb25zCiMKIyBlbmQgb2YgQ1BVIEZy
ZXF1ZW5jeSBzY2FsaW5nCgojCiMgQ1BVIElkbGUKIwpDT05GSUdfQ1BVX0lETEU9eQojIENP
TkZJR19DUFVfSURMRV9HT1ZfTEFEREVSIGlzIG5vdCBzZXQKQ09ORklHX0NQVV9JRExFX0dP
Vl9NRU5VPXkKIyBDT05GSUdfQ1BVX0lETEVfR09WX1RFTyBpcyBub3Qgc2V0CiMgQ09ORklH
X0NQVV9JRExFX0dPVl9IQUxUUE9MTCBpcyBub3Qgc2V0CiMgQ09ORklHX0hBTFRQT0xMX0NQ
VUlETEUgaXMgbm90IHNldAojIGVuZCBvZiBDUFUgSWRsZQojIGVuZCBvZiBQb3dlciBtYW5h
Z2VtZW50IGFuZCBBQ1BJIG9wdGlvbnMKCiMKIyBCdXMgb3B0aW9ucyAoUENJIGV0Yy4pCiMK
Q09ORklHX1BDSV9ESVJFQ1Q9eQpDT05GSUdfUENJX01NQ09ORklHPXkKQ09ORklHX01NQ09O
Rl9GQU0xMEg9eQojIENPTkZJR19QQ0lfQ05CMjBMRV9RVUlSSyBpcyBub3Qgc2V0CiMgQ09O
RklHX0lTQV9CVVMgaXMgbm90IHNldApDT05GSUdfSVNBX0RNQV9BUEk9eQpDT05GSUdfQU1E
X05CPXkKIyBlbmQgb2YgQnVzIG9wdGlvbnMgKFBDSSBldGMuKQoKIwojIEJpbmFyeSBFbXVs
YXRpb25zCiMKIyBDT05GSUdfSUEzMl9FTVVMQVRJT04gaXMgbm90IHNldAojIENPTkZJR19Y
ODZfWDMyX0FCSSBpcyBub3Qgc2V0CiMgZW5kIG9mIEJpbmFyeSBFbXVsYXRpb25zCgpDT05G
SUdfSEFWRV9LVk09eQpDT05GSUdfSEFWRV9LVk1fUEZOQ0FDSEU9eQpDT05GSUdfSEFWRV9L
Vk1fSVJRQ0hJUD15CkNPTkZJR19IQVZFX0tWTV9JUlFGRD15CkNPTkZJR19IQVZFX0tWTV9J
UlFfUk9VVElORz15CkNPTkZJR19IQVZFX0tWTV9ESVJUWV9SSU5HPXkKQ09ORklHX0hBVkVf
S1ZNX0RJUlRZX1JJTkdfVFNPPXkKQ09ORklHX0hBVkVfS1ZNX0RJUlRZX1JJTkdfQUNRX1JF
TD15CkNPTkZJR19IQVZFX0tWTV9FVkVOVEZEPXkKQ09ORklHX0tWTV9NTUlPPXkKQ09ORklH
X0tWTV9BU1lOQ19QRj15CkNPTkZJR19IQVZFX0tWTV9NU0k9eQpDT05GSUdfSEFWRV9LVk1f
Q1BVX1JFTEFYX0lOVEVSQ0VQVD15CkNPTkZJR19LVk1fVkZJTz15CkNPTkZJR19LVk1fR0VO
RVJJQ19ESVJUWUxPR19SRUFEX1BST1RFQ1Q9eQpDT05GSUdfSEFWRV9LVk1fSVJRX0JZUEFT
Uz15CkNPTkZJR19IQVZFX0tWTV9OT19QT0xMPXkKQ09ORklHX0tWTV9YRkVSX1RPX0dVRVNU
X1dPUks9eQpDT05GSUdfSEFWRV9LVk1fUE1fTk9USUZJRVI9eQpDT05GSUdfS1ZNX0dFTkVS
SUNfSEFSRFdBUkVfRU5BQkxJTkc9eQpDT05GSUdfVklSVFVBTElaQVRJT049eQpDT05GSUdf
S1ZNPW0KQ09ORklHX0tWTV9XRVJST1I9eQpDT05GSUdfS1ZNX0FNRD1tCkNPTkZJR19LVk1f
QU1EX1NFVj15CkNPTkZJR19LVk1fU01NPXkKQ09ORklHX0tWTV9YRU49eQpDT05GSUdfQVNf
QVZYNTEyPXkKQ09ORklHX0FTX1NIQTFfTkk9eQpDT05GSUdfQVNfU0hBMjU2X05JPXkKQ09O
RklHX0FTX1RQQVVTRT15CkNPTkZJR19BU19HRk5JPXkKCiMKIyBHZW5lcmFsIGFyY2hpdGVj
dHVyZS1kZXBlbmRlbnQgb3B0aW9ucwojCkNPTkZJR19DUkFTSF9DT1JFPXkKQ09ORklHX0hP
VFBMVUdfU01UPXkKQ09ORklHX0hPVFBMVUdfQ09SRV9TWU5DPXkKQ09ORklHX0hPVFBMVUdf
Q09SRV9TWU5DX0RFQUQ9eQpDT05GSUdfSE9UUExVR19DT1JFX1NZTkNfRlVMTD15CkNPTkZJ
R19IT1RQTFVHX1NQTElUX1NUQVJUVVA9eQpDT05GSUdfSE9UUExVR19QQVJBTExFTD15CkNP
TkZJR19HRU5FUklDX0VOVFJZPXkKIyBDT05GSUdfS1BST0JFUyBpcyBub3Qgc2V0CkNPTkZJ
R19KVU1QX0xBQkVMPXkKIyBDT05GSUdfU1RBVElDX0tFWVNfU0VMRlRFU1QgaXMgbm90IHNl
dAojIENPTkZJR19TVEFUSUNfQ0FMTF9TRUxGVEVTVCBpcyBub3Qgc2V0CkNPTkZJR19IQVZF
X0VGRklDSUVOVF9VTkFMSUdORURfQUNDRVNTPXkKQ09ORklHX0FSQ0hfVVNFX0JVSUxUSU5f
QlNXQVA9eQpDT05GSUdfVVNFUl9SRVRVUk5fTk9USUZJRVI9eQpDT05GSUdfSEFWRV9JT1JF
TUFQX1BST1Q9eQpDT05GSUdfSEFWRV9LUFJPQkVTPXkKQ09ORklHX0hBVkVfS1JFVFBST0JF
Uz15CkNPTkZJR19IQVZFX09QVFBST0JFUz15CkNPTkZJR19IQVZFX0tQUk9CRVNfT05fRlRS
QUNFPXkKQ09ORklHX0FSQ0hfQ09SUkVDVF9TVEFDS1RSQUNFX09OX0tSRVRQUk9CRT15CkNP
TkZJR19IQVZFX0ZVTkNUSU9OX0VSUk9SX0lOSkVDVElPTj15CkNPTkZJR19IQVZFX05NST15
CkNPTkZJR19UUkFDRV9JUlFGTEFHU19TVVBQT1JUPXkKQ09ORklHX1RSQUNFX0lSUUZMQUdT
X05NSV9TVVBQT1JUPXkKQ09ORklHX0hBVkVfQVJDSF9UUkFDRUhPT0s9eQpDT05GSUdfSEFW
RV9ETUFfQ09OVElHVU9VUz15CkNPTkZJR19HRU5FUklDX1NNUF9JRExFX1RIUkVBRD15CkNP
TkZJR19BUkNIX0hBU19GT1JUSUZZX1NPVVJDRT15CkNPTkZJR19BUkNIX0hBU19TRVRfTUVN
T1JZPXkKQ09ORklHX0FSQ0hfSEFTX1NFVF9ESVJFQ1RfTUFQPXkKQ09ORklHX0FSQ0hfSEFT
X0NQVV9GSU5BTElaRV9JTklUPXkKQ09ORklHX0hBVkVfQVJDSF9USFJFQURfU1RSVUNUX1dI
SVRFTElTVD15CkNPTkZJR19BUkNIX1dBTlRTX0RZTkFNSUNfVEFTS19TVFJVQ1Q9eQpDT05G
SUdfQVJDSF9XQU5UU19OT19JTlNUUj15CkNPTkZJR19IQVZFX0FTTV9NT0RWRVJTSU9OUz15
CkNPTkZJR19IQVZFX1JFR1NfQU5EX1NUQUNLX0FDQ0VTU19BUEk9eQpDT05GSUdfSEFWRV9S
U0VRPXkKQ09ORklHX0hBVkVfUlVTVD15CkNPTkZJR19IQVZFX0ZVTkNUSU9OX0FSR19BQ0NF
U1NfQVBJPXkKQ09ORklHX0hBVkVfSFdfQlJFQUtQT0lOVD15CkNPTkZJR19IQVZFX01JWEVE
X0JSRUFLUE9JTlRTX1JFR1M9eQpDT05GSUdfSEFWRV9VU0VSX1JFVFVSTl9OT1RJRklFUj15
CkNPTkZJR19IQVZFX1BFUkZfRVZFTlRTX05NST15CkNPTkZJR19IQVZFX0hBUkRMT0NLVVBf
REVURUNUT1JfUEVSRj15CkNPTkZJR19IQVZFX1BFUkZfUkVHUz15CkNPTkZJR19IQVZFX1BF
UkZfVVNFUl9TVEFDS19EVU1QPXkKQ09ORklHX0hBVkVfQVJDSF9KVU1QX0xBQkVMPXkKQ09O
RklHX0hBVkVfQVJDSF9KVU1QX0xBQkVMX1JFTEFUSVZFPXkKQ09ORklHX01NVV9HQVRIRVJf
VEFCTEVfRlJFRT15CkNPTkZJR19NTVVfR0FUSEVSX1JDVV9UQUJMRV9GUkVFPXkKQ09ORklH
X01NVV9HQVRIRVJfTUVSR0VfVk1BUz15CkNPTkZJR19NTVVfTEFaWV9UTEJfUkVGQ09VTlQ9
eQpDT05GSUdfQVJDSF9IQVZFX05NSV9TQUZFX0NNUFhDSEc9eQpDT05GSUdfQVJDSF9IQVNf
Tk1JX1NBRkVfVEhJU19DUFVfT1BTPXkKQ09ORklHX0hBVkVfQUxJR05FRF9TVFJVQ1RfUEFH
RT15CkNPTkZJR19IQVZFX0NNUFhDSEdfTE9DQUw9eQpDT05GSUdfSEFWRV9DTVBYQ0hHX0RP
VUJMRT15CkNPTkZJR19IQVZFX0FSQ0hfU0VDQ09NUD15CkNPTkZJR19IQVZFX0FSQ0hfU0VD
Q09NUF9GSUxURVI9eQpDT05GSUdfU0VDQ09NUD15CkNPTkZJR19TRUNDT01QX0ZJTFRFUj15
CiMgQ09ORklHX1NFQ0NPTVBfQ0FDSEVfREVCVUcgaXMgbm90IHNldApDT05GSUdfSEFWRV9B
UkNIX1NUQUNLTEVBSz15CkNPTkZJR19IQVZFX1NUQUNLUFJPVEVDVE9SPXkKQ09ORklHX1NU
QUNLUFJPVEVDVE9SPXkKQ09ORklHX1NUQUNLUFJPVEVDVE9SX1NUUk9ORz15CkNPTkZJR19B
UkNIX1NVUFBPUlRTX0xUT19DTEFORz15CkNPTkZJR19BUkNIX1NVUFBPUlRTX0xUT19DTEFO
R19USElOPXkKQ09ORklHX0xUT19OT05FPXkKQ09ORklHX0FSQ0hfU1VQUE9SVFNfQ0ZJX0NM
QU5HPXkKQ09ORklHX0hBVkVfQVJDSF9XSVRISU5fU1RBQ0tfRlJBTUVTPXkKQ09ORklHX0hB
VkVfQ09OVEVYVF9UUkFDS0lOR19VU0VSPXkKQ09ORklHX0hBVkVfQ09OVEVYVF9UUkFDS0lO
R19VU0VSX09GRlNUQUNLPXkKQ09ORklHX0hBVkVfVklSVF9DUFVfQUNDT1VOVElOR19HRU49
eQpDT05GSUdfSEFWRV9JUlFfVElNRV9BQ0NPVU5USU5HPXkKQ09ORklHX0hBVkVfTU9WRV9Q
VUQ9eQpDT05GSUdfSEFWRV9NT1ZFX1BNRD15CkNPTkZJR19IQVZFX0FSQ0hfVFJBTlNQQVJF
TlRfSFVHRVBBR0U9eQpDT05GSUdfSEFWRV9BUkNIX1RSQU5TUEFSRU5UX0hVR0VQQUdFX1BV
RD15CkNPTkZJR19IQVZFX0FSQ0hfSFVHRV9WTUFQPXkKQ09ORklHX0hBVkVfQVJDSF9IVUdF
X1ZNQUxMT0M9eQpDT05GSUdfQVJDSF9XQU5UX0hVR0VfUE1EX1NIQVJFPXkKQ09ORklHX0hB
VkVfQVJDSF9TT0ZUX0RJUlRZPXkKQ09ORklHX0hBVkVfTU9EX0FSQ0hfU1BFQ0lGSUM9eQpD
T05GSUdfTU9EVUxFU19VU0VfRUxGX1JFTEE9eQpDT05GSUdfSEFWRV9JUlFfRVhJVF9PTl9J
UlFfU1RBQ0s9eQpDT05GSUdfSEFWRV9TT0ZUSVJRX09OX09XTl9TVEFDSz15CkNPTkZJR19T
T0ZUSVJRX09OX09XTl9TVEFDSz15CkNPTkZJR19BUkNIX0hBU19FTEZfUkFORE9NSVpFPXkK
Q09ORklHX0hBVkVfQVJDSF9NTUFQX1JORF9CSVRTPXkKQ09ORklHX0hBVkVfRVhJVF9USFJF
QUQ9eQpDT05GSUdfQVJDSF9NTUFQX1JORF9CSVRTPTI4CkNPTkZJR19QQUdFX1NJWkVfTEVT
U19USEFOXzY0S0I9eQpDT05GSUdfUEFHRV9TSVpFX0xFU1NfVEhBTl8yNTZLQj15CkNPTkZJ
R19IQVZFX09CSlRPT0w9eQpDT05GSUdfSEFWRV9KVU1QX0xBQkVMX0hBQ0s9eQpDT05GSUdf
SEFWRV9OT0lOU1RSX0hBQ0s9eQpDT05GSUdfSEFWRV9OT0lOU1RSX1ZBTElEQVRJT049eQpD
T05GSUdfSEFWRV9VQUNDRVNTX1ZBTElEQVRJT049eQpDT05GSUdfSEFWRV9TVEFDS19WQUxJ
REFUSU9OPXkKQ09ORklHX0hBVkVfUkVMSUFCTEVfU1RBQ0tUUkFDRT15CkNPTkZJR19DT01Q
QVRfMzJCSVRfVElNRT15CkNPTkZJR19IQVZFX0FSQ0hfVk1BUF9TVEFDSz15CkNPTkZJR19W
TUFQX1NUQUNLPXkKQ09ORklHX0hBVkVfQVJDSF9SQU5ET01JWkVfS1NUQUNLX09GRlNFVD15
CkNPTkZJR19SQU5ET01JWkVfS1NUQUNLX09GRlNFVD15CkNPTkZJR19SQU5ET01JWkVfS1NU
QUNLX09GRlNFVF9ERUZBVUxUPXkKQ09ORklHX0FSQ0hfSEFTX1NUUklDVF9LRVJORUxfUldY
PXkKQ09ORklHX1NUUklDVF9LRVJORUxfUldYPXkKQ09ORklHX0FSQ0hfSEFTX1NUUklDVF9N
T0RVTEVfUldYPXkKQ09ORklHX1NUUklDVF9NT0RVTEVfUldYPXkKQ09ORklHX0hBVkVfQVJD
SF9QUkVMMzJfUkVMT0NBVElPTlM9eQpDT05GSUdfQVJDSF9VU0VfTUVNUkVNQVBfUFJPVD15
CiMgQ09ORklHX0xPQ0tfRVZFTlRfQ09VTlRTIGlzIG5vdCBzZXQKQ09ORklHX0FSQ0hfSEFT
X01FTV9FTkNSWVBUPXkKQ09ORklHX0FSQ0hfSEFTX0NDX1BMQVRGT1JNPXkKQ09ORklHX0hB
VkVfU1RBVElDX0NBTEw9eQpDT05GSUdfSEFWRV9TVEFUSUNfQ0FMTF9JTkxJTkU9eQpDT05G
SUdfSEFWRV9QUkVFTVBUX0RZTkFNSUM9eQpDT05GSUdfSEFWRV9QUkVFTVBUX0RZTkFNSUNf
Q0FMTD15CkNPTkZJR19BUkNIX1dBTlRfTERfT1JQSEFOX1dBUk49eQpDT05GSUdfQVJDSF9T
VVBQT1JUU19ERUJVR19QQUdFQUxMT0M9eQpDT05GSUdfQVJDSF9TVVBQT1JUU19QQUdFX1RB
QkxFX0NIRUNLPXkKQ09ORklHX0FSQ0hfSEFTX0VMRkNPUkVfQ09NUEFUPXkKQ09ORklHX0FS
Q0hfSEFTX1BBUkFOT0lEX0wxRF9GTFVTSD15CkNPTkZJR19EWU5BTUlDX1NJR0ZSQU1FPXkK
Q09ORklHX0FSQ0hfSEFTX05PTkxFQUZfUE1EX1lPVU5HPXkKCiMKIyBHQ09WLWJhc2VkIGtl
cm5lbCBwcm9maWxpbmcKIwojIENPTkZJR19HQ09WX0tFUk5FTCBpcyBub3Qgc2V0CkNPTkZJ
R19BUkNIX0hBU19HQ09WX1BST0ZJTEVfQUxMPXkKIyBlbmQgb2YgR0NPVi1iYXNlZCBrZXJu
ZWwgcHJvZmlsaW5nCgpDT05GSUdfSEFWRV9HQ0NfUExVR0lOUz15CkNPTkZJR19HQ0NfUExV
R0lOUz15CkNPTkZJR19HQ0NfUExVR0lOX0xBVEVOVF9FTlRST1BZPXkKQ09ORklHX0ZVTkNU
SU9OX0FMSUdOTUVOVF80Qj15CkNPTkZJR19GVU5DVElPTl9BTElHTk1FTlRfMTZCPXkKQ09O
RklHX0ZVTkNUSU9OX0FMSUdOTUVOVD0xNgojIGVuZCBvZiBHZW5lcmFsIGFyY2hpdGVjdHVy
ZS1kZXBlbmRlbnQgb3B0aW9ucwoKQ09ORklHX1JUX01VVEVYRVM9eQpDT05GSUdfQkFTRV9T
TUFMTD0wCkNPTkZJR19NT0RVTEVTPXkKIyBDT05GSUdfTU9EVUxFX0RFQlVHIGlzIG5vdCBz
ZXQKIyBDT05GSUdfTU9EVUxFX0ZPUkNFX0xPQUQgaXMgbm90IHNldApDT05GSUdfTU9EVUxF
X1VOTE9BRD15CiMgQ09ORklHX01PRFVMRV9GT1JDRV9VTkxPQUQgaXMgbm90IHNldAojIENP
TkZJR19NT0RVTEVfVU5MT0FEX1RBSU5UX1RSQUNLSU5HIGlzIG5vdCBzZXQKQ09ORklHX01P
RFZFUlNJT05TPXkKQ09ORklHX0FTTV9NT0RWRVJTSU9OUz15CiMgQ09ORklHX01PRFVMRV9T
UkNWRVJTSU9OX0FMTCBpcyBub3Qgc2V0CiMgQ09ORklHX01PRFVMRV9TSUcgaXMgbm90IHNl
dAojIENPTkZJR19NT0RVTEVfQ09NUFJFU1NfTk9ORSBpcyBub3Qgc2V0CiMgQ09ORklHX01P
RFVMRV9DT01QUkVTU19HWklQIGlzIG5vdCBzZXQKIyBDT05GSUdfTU9EVUxFX0NPTVBSRVNT
X1haIGlzIG5vdCBzZXQKQ09ORklHX01PRFVMRV9DT01QUkVTU19aU1REPXkKIyBDT05GSUdf
TU9EVUxFX0RFQ09NUFJFU1MgaXMgbm90IHNldAojIENPTkZJR19NT0RVTEVfQUxMT1dfTUlT
U0lOR19OQU1FU1BBQ0VfSU1QT1JUUyBpcyBub3Qgc2V0CkNPTkZJR19NT0RQUk9CRV9QQVRI
PSIvc2Jpbi9tb2Rwcm9iZSIKQ09ORklHX1RSSU1fVU5VU0VEX0tTWU1TPXkKQ09ORklHX1VO
VVNFRF9LU1lNU19XSElURUxJU1Q9IiIKQ09ORklHX01PRFVMRVNfVFJFRV9MT09LVVA9eQpD
T05GSUdfQkxPQ0s9eQojIENPTkZJR19CTE9DS19MRUdBQ1lfQVVUT0xPQUQgaXMgbm90IHNl
dApDT05GSUdfQkxLX1JRX0FMTE9DX1RJTUU9eQpDT05GSUdfQkxLX0NHUk9VUF9SV1NUQVQ9
eQpDT05GSUdfQkxLX0RFVl9CU0dfQ09NTU9OPW0KQ09ORklHX0JMS19JQ1E9eQojIENPTkZJ
R19CTEtfREVWX0JTR0xJQiBpcyBub3Qgc2V0CiMgQ09ORklHX0JMS19ERVZfSU5URUdSSVRZ
IGlzIG5vdCBzZXQKIyBDT05GSUdfQkxLX0RFVl9aT05FRCBpcyBub3Qgc2V0CkNPTkZJR19C
TEtfREVWX1RIUk9UVExJTkc9eQojIENPTkZJR19CTEtfREVWX1RIUk9UVExJTkdfTE9XIGlz
IG5vdCBzZXQKQ09ORklHX0JMS19XQlQ9eQpDT05GSUdfQkxLX1dCVF9NUT15CiMgQ09ORklH
X0JMS19DR1JPVVBfSU9MQVRFTkNZIGlzIG5vdCBzZXQKQ09ORklHX0JMS19DR1JPVVBfSU9D
T1NUPXkKQ09ORklHX0JMS19DR1JPVVBfSU9QUklPPXkKQ09ORklHX0JMS19ERUJVR19GUz15
CiMgQ09ORklHX0JMS19TRURfT1BBTCBpcyBub3Qgc2V0CkNPTkZJR19CTEtfSU5MSU5FX0VO
Q1JZUFRJT049eQojIENPTkZJR19CTEtfSU5MSU5FX0VOQ1JZUFRJT05fRkFMTEJBQ0sgaXMg
bm90IHNldAoKIwojIFBhcnRpdGlvbiBUeXBlcwojCiMgQ09ORklHX1BBUlRJVElPTl9BRFZB
TkNFRCBpcyBub3Qgc2V0CkNPTkZJR19NU0RPU19QQVJUSVRJT049eQpDT05GSUdfRUZJX1BB
UlRJVElPTj15CiMgZW5kIG9mIFBhcnRpdGlvbiBUeXBlcwoKQ09ORklHX0JMS19NUV9QQ0k9
eQpDT05GSUdfQkxLX01RX1ZJUlRJTz15CkNPTkZJR19CTEtfUE09eQpDT05GSUdfQkxPQ0tf
SE9MREVSX0RFUFJFQ0FURUQ9eQpDT05GSUdfQkxLX01RX1NUQUNLSU5HPXkKCiMKIyBJTyBT
Y2hlZHVsZXJzCiMKQ09ORklHX01RX0lPU0NIRURfREVBRExJTkU9eQpDT05GSUdfTVFfSU9T
Q0hFRF9LWUJFUj15CkNPTkZJR19JT1NDSEVEX0JGUT15CkNPTkZJR19CRlFfR1JPVVBfSU9T
Q0hFRD15CiMgQ09ORklHX0JGUV9DR1JPVVBfREVCVUcgaXMgbm90IHNldAojIGVuZCBvZiBJ
TyBTY2hlZHVsZXJzCgpDT05GSUdfUFJFRU1QVF9OT1RJRklFUlM9eQpDT05GSUdfQVNOMT15
CkNPTkZJR19JTkxJTkVfU1BJTl9VTkxPQ0tfSVJRPXkKQ09ORklHX0lOTElORV9SRUFEX1VO
TE9DSz15CkNPTkZJR19JTkxJTkVfUkVBRF9VTkxPQ0tfSVJRPXkKQ09ORklHX0lOTElORV9X
UklURV9VTkxPQ0s9eQpDT05GSUdfSU5MSU5FX1dSSVRFX1VOTE9DS19JUlE9eQpDT05GSUdf
QVJDSF9TVVBQT1JUU19BVE9NSUNfUk1XPXkKQ09ORklHX01VVEVYX1NQSU5fT05fT1dORVI9
eQpDT05GSUdfUldTRU1fU1BJTl9PTl9PV05FUj15CkNPTkZJR19MT0NLX1NQSU5fT05fT1dO
RVI9eQpDT05GSUdfQVJDSF9VU0VfUVVFVUVEX1NQSU5MT0NLUz15CkNPTkZJR19RVUVVRURf
U1BJTkxPQ0tTPXkKQ09ORklHX0FSQ0hfVVNFX1FVRVVFRF9SV0xPQ0tTPXkKQ09ORklHX1FV
RVVFRF9SV0xPQ0tTPXkKQ09ORklHX0FSQ0hfSEFTX05PTl9PVkVSTEFQUElOR19BRERSRVNT
X1NQQUNFPXkKQ09ORklHX0FSQ0hfSEFTX1NZTkNfQ09SRV9CRUZPUkVfVVNFUk1PREU9eQpD
T05GSUdfQVJDSF9IQVNfU1lTQ0FMTF9XUkFQUEVSPXkKQ09ORklHX0ZSRUVaRVI9eQoKIwoj
IEV4ZWN1dGFibGUgZmlsZSBmb3JtYXRzCiMKQ09ORklHX0JJTkZNVF9FTEY9eQpDT05GSUdf
RUxGQ09SRT15CkNPTkZJR19DT1JFX0RVTVBfREVGQVVMVF9FTEZfSEVBREVSUz15CkNPTkZJ
R19CSU5GTVRfU0NSSVBUPXkKIyBDT05GSUdfQklORk1UX01JU0MgaXMgbm90IHNldApDT05G
SUdfQ09SRURVTVA9eQojIGVuZCBvZiBFeGVjdXRhYmxlIGZpbGUgZm9ybWF0cwoKIwojIE1l
bW9yeSBNYW5hZ2VtZW50IG9wdGlvbnMKIwpDT05GSUdfWlBPT0w9eQpDT05GSUdfU1dBUD15
CkNPTkZJR19aU1dBUD15CiMgQ09ORklHX1pTV0FQX0RFRkFVTFRfT04gaXMgbm90IHNldAoj
IENPTkZJR19aU1dBUF9FWENMVVNJVkVfTE9BRFNfREVGQVVMVF9PTiBpcyBub3Qgc2V0CiMg
Q09ORklHX1pTV0FQX0NPTVBSRVNTT1JfREVGQVVMVF9ERUZMQVRFIGlzIG5vdCBzZXQKQ09O
RklHX1pTV0FQX0NPTVBSRVNTT1JfREVGQVVMVF9MWk89eQojIENPTkZJR19aU1dBUF9DT01Q
UkVTU09SX0RFRkFVTFRfODQyIGlzIG5vdCBzZXQKIyBDT05GSUdfWlNXQVBfQ09NUFJFU1NP
Ul9ERUZBVUxUX0xaNCBpcyBub3Qgc2V0CiMgQ09ORklHX1pTV0FQX0NPTVBSRVNTT1JfREVG
QVVMVF9MWjRIQyBpcyBub3Qgc2V0CiMgQ09ORklHX1pTV0FQX0NPTVBSRVNTT1JfREVGQVVM
VF9aU1REIGlzIG5vdCBzZXQKQ09ORklHX1pTV0FQX0NPTVBSRVNTT1JfREVGQVVMVD0ibHpv
IgpDT05GSUdfWlNXQVBfWlBPT0xfREVGQVVMVF9aQlVEPXkKIyBDT05GSUdfWlNXQVBfWlBP
T0xfREVGQVVMVF9aM0ZPTEQgaXMgbm90IHNldAojIENPTkZJR19aU1dBUF9aUE9PTF9ERUZB
VUxUX1pTTUFMTE9DIGlzIG5vdCBzZXQKQ09ORklHX1pTV0FQX1pQT09MX0RFRkFVTFQ9Inpi
dWQiCkNPTkZJR19aQlVEPXkKQ09ORklHX1ozRk9MRD15CkNPTkZJR19aU01BTExPQz15CiMg
Q09ORklHX1pTTUFMTE9DX1NUQVQgaXMgbm90IHNldApDT05GSUdfWlNNQUxMT0NfQ0hBSU5f
U0laRT04CgojCiMgU0xBQiBhbGxvY2F0b3Igb3B0aW9ucwojCiMgQ09ORklHX1NMQUJfREVQ
UkVDQVRFRCBpcyBub3Qgc2V0CkNPTkZJR19TTFVCPXkKIyBDT05GSUdfU0xVQl9USU5ZIGlz
IG5vdCBzZXQKIyBDT05GSUdfU0xBQl9NRVJHRV9ERUZBVUxUIGlzIG5vdCBzZXQKQ09ORklH
X1NMQUJfRlJFRUxJU1RfUkFORE9NPXkKQ09ORklHX1NMQUJfRlJFRUxJU1RfSEFSREVORUQ9
eQojIENPTkZJR19TTFVCX1NUQVRTIGlzIG5vdCBzZXQKQ09ORklHX1NMVUJfQ1BVX1BBUlRJ
QUw9eQojIGVuZCBvZiBTTEFCIGFsbG9jYXRvciBvcHRpb25zCgpDT05GSUdfU0hVRkZMRV9Q
QUdFX0FMTE9DQVRPUj15CiMgQ09ORklHX0NPTVBBVF9CUksgaXMgbm90IHNldApDT05GSUdf
U1BBUlNFTUVNPXkKQ09ORklHX1NQQVJTRU1FTV9FWFRSRU1FPXkKQ09ORklHX1NQQVJTRU1F
TV9WTUVNTUFQX0VOQUJMRT15CkNPTkZJR19TUEFSU0VNRU1fVk1FTU1BUD15CkNPTkZJR19B
UkNIX1dBTlRfT1BUSU1JWkVfVk1FTU1BUD15CkNPTkZJR19IQVZFX0ZBU1RfR1VQPXkKQ09O
RklHX05VTUFfS0VFUF9NRU1JTkZPPXkKQ09ORklHX01FTU9SWV9JU09MQVRJT049eQpDT05G
SUdfRVhDTFVTSVZFX1NZU1RFTV9SQU09eQpDT05GSUdfQVJDSF9FTkFCTEVfTUVNT1JZX0hP
VFBMVUc9eQojIENPTkZJR19NRU1PUllfSE9UUExVRyBpcyBub3Qgc2V0CkNPTkZJR19TUExJ
VF9QVExPQ0tfQ1BVUz00CkNPTkZJR19BUkNIX0VOQUJMRV9TUExJVF9QTURfUFRMT0NLPXkK
Q09ORklHX0NPTVBBQ1RJT049eQpDT05GSUdfQ09NUEFDVF9VTkVWSUNUQUJMRV9ERUZBVUxU
PTEKQ09ORklHX1BBR0VfUkVQT1JUSU5HPXkKQ09ORklHX01JR1JBVElPTj15CkNPTkZJR19B
UkNIX0VOQUJMRV9IVUdFUEFHRV9NSUdSQVRJT049eQpDT05GSUdfQVJDSF9FTkFCTEVfVEhQ
X01JR1JBVElPTj15CkNPTkZJR19DT05USUdfQUxMT0M9eQpDT05GSUdfUEhZU19BRERSX1Rf
NjRCSVQ9eQpDT05GSUdfTU1VX05PVElGSUVSPXkKQ09ORklHX0tTTT15CkNPTkZJR19ERUZB
VUxUX01NQVBfTUlOX0FERFI9NjU1MzYKQ09ORklHX0FSQ0hfU1VQUE9SVFNfTUVNT1JZX0ZB
SUxVUkU9eQpDT05GSUdfTUVNT1JZX0ZBSUxVUkU9eQojIENPTkZJR19IV1BPSVNPTl9JTkpF
Q1QgaXMgbm90IHNldApDT05GSUdfQVJDSF9XQU5UX0dFTkVSQUxfSFVHRVRMQj15CkNPTkZJ
R19BUkNIX1dBTlRTX1RIUF9TV0FQPXkKQ09ORklHX1RSQU5TUEFSRU5UX0hVR0VQQUdFPXkK
IyBDT05GSUdfVFJBTlNQQVJFTlRfSFVHRVBBR0VfQUxXQVlTIGlzIG5vdCBzZXQKQ09ORklH
X1RSQU5TUEFSRU5UX0hVR0VQQUdFX01BRFZJU0U9eQpDT05GSUdfVEhQX1NXQVA9eQojIENP
TkZJR19SRUFEX09OTFlfVEhQX0ZPUl9GUyBpcyBub3Qgc2V0CkNPTkZJR19ORUVEX1BFUl9D
UFVfRU1CRURfRklSU1RfQ0hVTks9eQpDT05GSUdfTkVFRF9QRVJfQ1BVX1BBR0VfRklSU1Rf
Q0hVTks9eQpDT05GSUdfVVNFX1BFUkNQVV9OVU1BX05PREVfSUQ9eQpDT05GSUdfSEFWRV9T
RVRVUF9QRVJfQ1BVX0FSRUE9eQpDT05GSUdfRlJPTlRTV0FQPXkKQ09ORklHX0NNQT15CiMg
Q09ORklHX0NNQV9ERUJVRyBpcyBub3Qgc2V0CiMgQ09ORklHX0NNQV9ERUJVR0ZTIGlzIG5v
dCBzZXQKQ09ORklHX0NNQV9TWVNGUz15CkNPTkZJR19DTUFfQVJFQVM9NwpDT05GSUdfTUVN
X1NPRlRfRElSVFk9eQpDT05GSUdfR0VORVJJQ19FQVJMWV9JT1JFTUFQPXkKIyBDT05GSUdf
REVGRVJSRURfU1RSVUNUX1BBR0VfSU5JVCBpcyBub3Qgc2V0CiMgQ09ORklHX0lETEVfUEFH
RV9UUkFDS0lORyBpcyBub3Qgc2V0CkNPTkZJR19BUkNIX0hBU19DQUNIRV9MSU5FX1NJWkU9
eQpDT05GSUdfQVJDSF9IQVNfQ1VSUkVOVF9TVEFDS19QT0lOVEVSPXkKQ09ORklHX0FSQ0hf
SEFTX1BURV9ERVZNQVA9eQpDT05GSUdfQVJDSF9IQVNfWk9ORV9ETUFfU0VUPXkKQ09ORklH
X1pPTkVfRE1BPXkKQ09ORklHX1pPTkVfRE1BMzI9eQpDT05GSUdfSE1NX01JUlJPUj15CkNP
TkZJR19HRVRfRlJFRV9SRUdJT049eQpDT05GSUdfQVJDSF9VU0VTX0hJR0hfVk1BX0ZMQUdT
PXkKQ09ORklHX0FSQ0hfSEFTX1BLRVlTPXkKQ09ORklHX1ZNX0VWRU5UX0NPVU5URVJTPXkK
IyBDT05GSUdfUEVSQ1BVX1NUQVRTIGlzIG5vdCBzZXQKIyBDT05GSUdfR1VQX1RFU1QgaXMg
bm90IHNldAojIENPTkZJR19ETUFQT09MX1RFU1QgaXMgbm90IHNldApDT05GSUdfQVJDSF9I
QVNfUFRFX1NQRUNJQUw9eQpDT05GSUdfU0VDUkVUTUVNPXkKIyBDT05GSUdfQU5PTl9WTUFf
TkFNRSBpcyBub3Qgc2V0CkNPTkZJR19VU0VSRkFVTFRGRD15CkNPTkZJR19IQVZFX0FSQ0hf
VVNFUkZBVUxURkRfV1A9eQpDT05GSUdfSEFWRV9BUkNIX1VTRVJGQVVMVEZEX01JTk9SPXkK
Q09ORklHX1BURV9NQVJLRVJfVUZGRF9XUD15CiMgQ09ORklHX0xSVV9HRU4gaXMgbm90IHNl
dApDT05GSUdfQVJDSF9TVVBQT1JUU19QRVJfVk1BX0xPQ0s9eQpDT05GSUdfUEVSX1ZNQV9M
T0NLPXkKQ09ORklHX0xPQ0tfTU1fQU5EX0ZJTkRfVk1BPXkKCiMKIyBEYXRhIEFjY2VzcyBN
b25pdG9yaW5nCiMKIyBDT05GSUdfREFNT04gaXMgbm90IHNldAojIGVuZCBvZiBEYXRhIEFj
Y2VzcyBNb25pdG9yaW5nCiMgZW5kIG9mIE1lbW9yeSBNYW5hZ2VtZW50IG9wdGlvbnMKCkNP
TkZJR19ORVQ9eQpDT05GSUdfTkVUX0lOR1JFU1M9eQpDT05GSUdfTkVUX0VHUkVTUz15CkNP
TkZJR19TS0JfRVhURU5TSU9OUz15CgojCiMgTmV0d29ya2luZyBvcHRpb25zCiMKQ09ORklH
X1BBQ0tFVD15CkNPTkZJR19QQUNLRVRfRElBRz15CkNPTkZJR19VTklYPXkKQ09ORklHX1VO
SVhfU0NNPXkKQ09ORklHX0FGX1VOSVhfT09CPXkKQ09ORklHX1VOSVhfRElBRz15CiMgQ09O
RklHX1RMUyBpcyBub3Qgc2V0CkNPTkZJR19YRlJNPXkKQ09ORklHX1hGUk1fQUxHTz15CkNP
TkZJR19YRlJNX1VTRVI9eQojIENPTkZJR19YRlJNX0lOVEVSRkFDRSBpcyBub3Qgc2V0CkNP
TkZJR19YRlJNX1NVQl9QT0xJQ1k9eQpDT05GSUdfWEZSTV9NSUdSQVRFPXkKQ09ORklHX1hG
Uk1fU1RBVElTVElDUz15CkNPTkZJR19YRlJNX0VTUD1tCiMgQ09ORklHX05FVF9LRVkgaXMg
bm90IHNldApDT05GSUdfSU5FVD15CkNPTkZJR19JUF9NVUxUSUNBU1Q9eQpDT05GSUdfSVBf
QURWQU5DRURfUk9VVEVSPXkKIyBDT05GSUdfSVBfRklCX1RSSUVfU1RBVFMgaXMgbm90IHNl
dApDT05GSUdfSVBfTVVMVElQTEVfVEFCTEVTPXkKQ09ORklHX0lQX1JPVVRFX01VTFRJUEFU
SD15CkNPTkZJR19JUF9ST1VURV9WRVJCT1NFPXkKIyBDT05GSUdfSVBfUE5QIGlzIG5vdCBz
ZXQKIyBDT05GSUdfTkVUX0lQSVAgaXMgbm90IHNldAojIENPTkZJR19ORVRfSVBHUkVfREVN
VVggaXMgbm90IHNldApDT05GSUdfTkVUX0lQX1RVTk5FTD1tCkNPTkZJR19JUF9NUk9VVEVf
Q09NTU9OPXkKQ09ORklHX0lQX01ST1VURT15CkNPTkZJR19JUF9NUk9VVEVfTVVMVElQTEVf
VEFCTEVTPXkKQ09ORklHX0lQX1BJTVNNX1YxPXkKQ09ORklHX0lQX1BJTVNNX1YyPXkKQ09O
RklHX1NZTl9DT09LSUVTPXkKIyBDT05GSUdfTkVUX0lQVlRJIGlzIG5vdCBzZXQKQ09ORklH
X05FVF9VRFBfVFVOTkVMPW0KIyBDT05GSUdfTkVUX0ZPVSBpcyBub3Qgc2V0CiMgQ09ORklH
X0lORVRfQUggaXMgbm90IHNldApDT05GSUdfSU5FVF9FU1A9bQojIENPTkZJR19JTkVUX0VT
UF9PRkZMT0FEIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5FVF9FU1BJTlRDUCBpcyBub3Qgc2V0
CiMgQ09ORklHX0lORVRfSVBDT01QIGlzIG5vdCBzZXQKQ09ORklHX0lORVRfVEFCTEVfUEVS
VFVSQl9PUkRFUj0xNgpDT05GSUdfSU5FVF9ESUFHPXkKQ09ORklHX0lORVRfVENQX0RJQUc9
eQpDT05GSUdfSU5FVF9VRFBfRElBRz15CkNPTkZJR19JTkVUX1JBV19ESUFHPXkKQ09ORklH
X0lORVRfRElBR19ERVNUUk9ZPXkKQ09ORklHX1RDUF9DT05HX0FEVkFOQ0VEPXkKIyBDT05G
SUdfVENQX0NPTkdfQklDIGlzIG5vdCBzZXQKQ09ORklHX1RDUF9DT05HX0NVQklDPXkKIyBD
T05GSUdfVENQX0NPTkdfV0VTVFdPT0QgaXMgbm90IHNldAojIENPTkZJR19UQ1BfQ09OR19I
VENQIGlzIG5vdCBzZXQKIyBDT05GSUdfVENQX0NPTkdfSFNUQ1AgaXMgbm90IHNldAojIENP
TkZJR19UQ1BfQ09OR19IWUJMQSBpcyBub3Qgc2V0CiMgQ09ORklHX1RDUF9DT05HX1ZFR0FT
IGlzIG5vdCBzZXQKIyBDT05GSUdfVENQX0NPTkdfTlYgaXMgbm90IHNldAojIENPTkZJR19U
Q1BfQ09OR19TQ0FMQUJMRSBpcyBub3Qgc2V0CiMgQ09ORklHX1RDUF9DT05HX0xQIGlzIG5v
dCBzZXQKIyBDT05GSUdfVENQX0NPTkdfVkVOTyBpcyBub3Qgc2V0CiMgQ09ORklHX1RDUF9D
T05HX1lFQUggaXMgbm90IHNldAojIENPTkZJR19UQ1BfQ09OR19JTExJTk9JUyBpcyBub3Qg
c2V0CiMgQ09ORklHX1RDUF9DT05HX0RDVENQIGlzIG5vdCBzZXQKIyBDT05GSUdfVENQX0NP
TkdfQ0RHIGlzIG5vdCBzZXQKIyBDT05GSUdfVENQX0NPTkdfQkJSIGlzIG5vdCBzZXQKQ09O
RklHX0RFRkFVTFRfQ1VCSUM9eQojIENPTkZJR19ERUZBVUxUX1JFTk8gaXMgbm90IHNldApD
T05GSUdfREVGQVVMVF9UQ1BfQ09ORz0iY3ViaWMiCkNPTkZJR19UQ1BfTUQ1U0lHPXkKQ09O
RklHX0lQVjY9eQpDT05GSUdfSVBWNl9ST1VURVJfUFJFRj15CkNPTkZJR19JUFY2X1JPVVRF
X0lORk89eQpDT05GSUdfSVBWNl9PUFRJTUlTVElDX0RBRD15CiMgQ09ORklHX0lORVQ2X0FI
IGlzIG5vdCBzZXQKIyBDT05GSUdfSU5FVDZfRVNQIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5F
VDZfSVBDT01QIGlzIG5vdCBzZXQKQ09ORklHX0lQVjZfTUlQNj15CiMgQ09ORklHX0lQVjZf
SUxBIGlzIG5vdCBzZXQKIyBDT05GSUdfSVBWNl9WVEkgaXMgbm90IHNldAojIENPTkZJR19J
UFY2X1NJVCBpcyBub3Qgc2V0CiMgQ09ORklHX0lQVjZfVFVOTkVMIGlzIG5vdCBzZXQKQ09O
RklHX0lQVjZfTVVMVElQTEVfVEFCTEVTPXkKQ09ORklHX0lQVjZfU1VCVFJFRVM9eQpDT05G
SUdfSVBWNl9NUk9VVEU9eQpDT05GSUdfSVBWNl9NUk9VVEVfTVVMVElQTEVfVEFCTEVTPXkK
Q09ORklHX0lQVjZfUElNU01fVjI9eQpDT05GSUdfSVBWNl9TRUc2X0xXVFVOTkVMPXkKQ09O
RklHX0lQVjZfU0VHNl9ITUFDPXkKQ09ORklHX0lQVjZfU0VHNl9CUEY9eQpDT05GSUdfSVBW
Nl9SUExfTFdUVU5ORUw9eQpDT05GSUdfSVBWNl9JT0FNNl9MV1RVTk5FTD15CkNPTkZJR19O
RVRMQUJFTD15CkNPTkZJR19NUFRDUD15CkNPTkZJR19JTkVUX01QVENQX0RJQUc9eQpDT05G
SUdfTVBUQ1BfSVBWNj15CkNPTkZJR19ORVRXT1JLX1NFQ01BUks9eQpDT05GSUdfTkVUX1BU
UF9DTEFTU0lGWT15CkNPTkZJR19ORVRXT1JLX1BIWV9USU1FU1RBTVBJTkc9eQpDT05GSUdf
TkVURklMVEVSPXkKQ09ORklHX05FVEZJTFRFUl9BRFZBTkNFRD15CkNPTkZJR19CUklER0Vf
TkVURklMVEVSPW0KCiMKIyBDb3JlIE5ldGZpbHRlciBDb25maWd1cmF0aW9uCiMKQ09ORklH
X05FVEZJTFRFUl9JTkdSRVNTPXkKQ09ORklHX05FVEZJTFRFUl9FR1JFU1M9eQpDT05GSUdf
TkVURklMVEVSX1NLSVBfRUdSRVNTPXkKQ09ORklHX05FVEZJTFRFUl9ORVRMSU5LPW0KQ09O
RklHX05FVEZJTFRFUl9GQU1JTFlfQlJJREdFPXkKIyBDT05GSUdfTkVURklMVEVSX05FVExJ
TktfQUNDVCBpcyBub3Qgc2V0CiMgQ09ORklHX05FVEZJTFRFUl9ORVRMSU5LX1FVRVVFIGlz
IG5vdCBzZXQKIyBDT05GSUdfTkVURklMVEVSX05FVExJTktfTE9HIGlzIG5vdCBzZXQKIyBD
T05GSUdfTkVURklMVEVSX05FVExJTktfT1NGIGlzIG5vdCBzZXQKQ09ORklHX05GX0NPTk5U
UkFDSz1tCkNPTkZJR19ORl9MT0dfU1lTTE9HPW0KQ09ORklHX05FVEZJTFRFUl9DT05OQ09V
TlQ9bQpDT05GSUdfTkZfQ09OTlRSQUNLX01BUks9eQojIENPTkZJR19ORl9DT05OVFJBQ0tf
U0VDTUFSSyBpcyBub3Qgc2V0CiMgQ09ORklHX05GX0NPTk5UUkFDS19aT05FUyBpcyBub3Qg
c2V0CiMgQ09ORklHX05GX0NPTk5UUkFDS19QUk9DRlMgaXMgbm90IHNldAojIENPTkZJR19O
Rl9DT05OVFJBQ0tfRVZFTlRTIGlzIG5vdCBzZXQKIyBDT05GSUdfTkZfQ09OTlRSQUNLX1RJ
TUVPVVQgaXMgbm90IHNldAojIENPTkZJR19ORl9DT05OVFJBQ0tfVElNRVNUQU1QIGlzIG5v
dCBzZXQKIyBDT05GSUdfTkZfQ09OTlRSQUNLX0xBQkVMUyBpcyBub3Qgc2V0CkNPTkZJR19O
Rl9DVF9QUk9UT19EQ0NQPXkKQ09ORklHX05GX0NUX1BST1RPX1NDVFA9eQpDT05GSUdfTkZf
Q1RfUFJPVE9fVURQTElURT15CiMgQ09ORklHX05GX0NPTk5UUkFDS19BTUFOREEgaXMgbm90
IHNldApDT05GSUdfTkZfQ09OTlRSQUNLX0ZUUD1tCiMgQ09ORklHX05GX0NPTk5UUkFDS19I
MzIzIGlzIG5vdCBzZXQKIyBDT05GSUdfTkZfQ09OTlRSQUNLX0lSQyBpcyBub3Qgc2V0CiMg
Q09ORklHX05GX0NPTk5UUkFDS19ORVRCSU9TX05TIGlzIG5vdCBzZXQKIyBDT05GSUdfTkZf
Q09OTlRSQUNLX1NOTVAgaXMgbm90IHNldAojIENPTkZJR19ORl9DT05OVFJBQ0tfUFBUUCBp
cyBub3Qgc2V0CiMgQ09ORklHX05GX0NPTk5UUkFDS19TQU5FIGlzIG5vdCBzZXQKIyBDT05G
SUdfTkZfQ09OTlRSQUNLX1NJUCBpcyBub3Qgc2V0CkNPTkZJR19ORl9DT05OVFJBQ0tfVEZU
UD1tCkNPTkZJR19ORl9DVF9ORVRMSU5LPW0KQ09ORklHX05GX05BVD1tCkNPTkZJR19ORl9O
QVRfRlRQPW0KQ09ORklHX05GX05BVF9URlRQPW0KQ09ORklHX05GX05BVF9SRURJUkVDVD15
CkNPTkZJR19ORl9OQVRfTUFTUVVFUkFERT15CiMgQ09ORklHX05GX1RBQkxFUyBpcyBub3Qg
c2V0CkNPTkZJR19ORVRGSUxURVJfWFRBQkxFUz15CgojCiMgWHRhYmxlcyBjb21iaW5lZCBt
b2R1bGVzCiMKQ09ORklHX05FVEZJTFRFUl9YVF9NQVJLPW0KQ09ORklHX05FVEZJTFRFUl9Y
VF9DT05OTUFSSz1tCgojCiMgWHRhYmxlcyB0YXJnZXRzCiMKIyBDT05GSUdfTkVURklMVEVS
X1hUX1RBUkdFVF9BVURJVCBpcyBub3Qgc2V0CkNPTkZJR19ORVRGSUxURVJfWFRfVEFSR0VU
X0NIRUNLU1VNPW0KIyBDT05GSUdfTkVURklMVEVSX1hUX1RBUkdFVF9DTEFTU0lGWSBpcyBu
b3Qgc2V0CiMgQ09ORklHX05FVEZJTFRFUl9YVF9UQVJHRVRfQ09OTk1BUksgaXMgbm90IHNl
dAojIENPTkZJR19ORVRGSUxURVJfWFRfVEFSR0VUX0RTQ1AgaXMgbm90IHNldAojIENPTkZJ
R19ORVRGSUxURVJfWFRfVEFSR0VUX0hMIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVURklMVEVS
X1hUX1RBUkdFVF9ITUFSSyBpcyBub3Qgc2V0CiMgQ09ORklHX05FVEZJTFRFUl9YVF9UQVJH
RVRfSURMRVRJTUVSIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVURklMVEVSX1hUX1RBUkdFVF9M
RUQgaXMgbm90IHNldApDT05GSUdfTkVURklMVEVSX1hUX1RBUkdFVF9MT0c9bQojIENPTkZJ
R19ORVRGSUxURVJfWFRfVEFSR0VUX01BUksgaXMgbm90IHNldApDT05GSUdfTkVURklMVEVS
X1hUX05BVD1tCiMgQ09ORklHX05FVEZJTFRFUl9YVF9UQVJHRVRfTkVUTUFQIGlzIG5vdCBz
ZXQKIyBDT05GSUdfTkVURklMVEVSX1hUX1RBUkdFVF9ORkxPRyBpcyBub3Qgc2V0CiMgQ09O
RklHX05FVEZJTFRFUl9YVF9UQVJHRVRfTkZRVUVVRSBpcyBub3Qgc2V0CiMgQ09ORklHX05F
VEZJTFRFUl9YVF9UQVJHRVRfUkFURUVTVCBpcyBub3Qgc2V0CkNPTkZJR19ORVRGSUxURVJf
WFRfVEFSR0VUX1JFRElSRUNUPW0KQ09ORklHX05FVEZJTFRFUl9YVF9UQVJHRVRfTUFTUVVF
UkFERT1tCiMgQ09ORklHX05FVEZJTFRFUl9YVF9UQVJHRVRfVEVFIGlzIG5vdCBzZXQKIyBD
T05GSUdfTkVURklMVEVSX1hUX1RBUkdFVF9UUFJPWFkgaXMgbm90IHNldAojIENPTkZJR19O
RVRGSUxURVJfWFRfVEFSR0VUX1NFQ01BUksgaXMgbm90IHNldAojIENPTkZJR19ORVRGSUxU
RVJfWFRfVEFSR0VUX1RDUE1TUyBpcyBub3Qgc2V0CiMgQ09ORklHX05FVEZJTFRFUl9YVF9U
QVJHRVRfVENQT1BUU1RSSVAgaXMgbm90IHNldAoKIwojIFh0YWJsZXMgbWF0Y2hlcwojCkNP
TkZJR19ORVRGSUxURVJfWFRfTUFUQ0hfQUREUlRZUEU9bQojIENPTkZJR19ORVRGSUxURVJf
WFRfTUFUQ0hfQlBGIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVURklMVEVSX1hUX01BVENIX0NH
Uk9VUCBpcyBub3Qgc2V0CiMgQ09ORklHX05FVEZJTFRFUl9YVF9NQVRDSF9DTFVTVEVSIGlz
IG5vdCBzZXQKQ09ORklHX05FVEZJTFRFUl9YVF9NQVRDSF9DT01NRU5UPW0KIyBDT05GSUdf
TkVURklMVEVSX1hUX01BVENIX0NPTk5CWVRFUyBpcyBub3Qgc2V0CiMgQ09ORklHX05FVEZJ
TFRFUl9YVF9NQVRDSF9DT05OTEFCRUwgaXMgbm90IHNldApDT05GSUdfTkVURklMVEVSX1hU
X01BVENIX0NPTk5MSU1JVD1tCiMgQ09ORklHX05FVEZJTFRFUl9YVF9NQVRDSF9DT05OTUFS
SyBpcyBub3Qgc2V0CkNPTkZJR19ORVRGSUxURVJfWFRfTUFUQ0hfQ09OTlRSQUNLPW0KIyBD
T05GSUdfTkVURklMVEVSX1hUX01BVENIX0NQVSBpcyBub3Qgc2V0CiMgQ09ORklHX05FVEZJ
TFRFUl9YVF9NQVRDSF9EQ0NQIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVURklMVEVSX1hUX01B
VENIX0RFVkdST1VQIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVURklMVEVSX1hUX01BVENIX0RT
Q1AgaXMgbm90IHNldAojIENPTkZJR19ORVRGSUxURVJfWFRfTUFUQ0hfRUNOIGlzIG5vdCBz
ZXQKIyBDT05GSUdfTkVURklMVEVSX1hUX01BVENIX0VTUCBpcyBub3Qgc2V0CiMgQ09ORklH
X05FVEZJTFRFUl9YVF9NQVRDSF9IQVNITElNSVQgaXMgbm90IHNldAojIENPTkZJR19ORVRG
SUxURVJfWFRfTUFUQ0hfSEVMUEVSIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVURklMVEVSX1hU
X01BVENIX0hMIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVURklMVEVSX1hUX01BVENIX0lQQ09N
UCBpcyBub3Qgc2V0CiMgQ09ORklHX05FVEZJTFRFUl9YVF9NQVRDSF9JUFJBTkdFIGlzIG5v
dCBzZXQKQ09ORklHX05FVEZJTFRFUl9YVF9NQVRDSF9JUFZTPW0KIyBDT05GSUdfTkVURklM
VEVSX1hUX01BVENIX0wyVFAgaXMgbm90IHNldAojIENPTkZJR19ORVRGSUxURVJfWFRfTUFU
Q0hfTEVOR1RIIGlzIG5vdCBzZXQKQ09ORklHX05FVEZJTFRFUl9YVF9NQVRDSF9MSU1JVD1t
CiMgQ09ORklHX05FVEZJTFRFUl9YVF9NQVRDSF9NQUMgaXMgbm90IHNldAojIENPTkZJR19O
RVRGSUxURVJfWFRfTUFUQ0hfTUFSSyBpcyBub3Qgc2V0CkNPTkZJR19ORVRGSUxURVJfWFRf
TUFUQ0hfTVVMVElQT1JUPW0KIyBDT05GSUdfTkVURklMVEVSX1hUX01BVENIX05GQUNDVCBp
cyBub3Qgc2V0CiMgQ09ORklHX05FVEZJTFRFUl9YVF9NQVRDSF9PU0YgaXMgbm90IHNldAoj
IENPTkZJR19ORVRGSUxURVJfWFRfTUFUQ0hfT1dORVIgaXMgbm90IHNldAojIENPTkZJR19O
RVRGSUxURVJfWFRfTUFUQ0hfUE9MSUNZIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVURklMVEVS
X1hUX01BVENIX1BIWVNERVYgaXMgbm90IHNldAojIENPTkZJR19ORVRGSUxURVJfWFRfTUFU
Q0hfUEtUVFlQRSBpcyBub3Qgc2V0CiMgQ09ORklHX05FVEZJTFRFUl9YVF9NQVRDSF9RVU9U
QSBpcyBub3Qgc2V0CiMgQ09ORklHX05FVEZJTFRFUl9YVF9NQVRDSF9SQVRFRVNUIGlzIG5v
dCBzZXQKIyBDT05GSUdfTkVURklMVEVSX1hUX01BVENIX1JFQUxNIGlzIG5vdCBzZXQKQ09O
RklHX05FVEZJTFRFUl9YVF9NQVRDSF9SRUNFTlQ9bQojIENPTkZJR19ORVRGSUxURVJfWFRf
TUFUQ0hfU0NUUCBpcyBub3Qgc2V0CiMgQ09ORklHX05FVEZJTFRFUl9YVF9NQVRDSF9TT0NL
RVQgaXMgbm90IHNldApDT05GSUdfTkVURklMVEVSX1hUX01BVENIX1NUQVRFPW0KIyBDT05G
SUdfTkVURklMVEVSX1hUX01BVENIX1NUQVRJU1RJQyBpcyBub3Qgc2V0CiMgQ09ORklHX05F
VEZJTFRFUl9YVF9NQVRDSF9TVFJJTkcgaXMgbm90IHNldAojIENPTkZJR19ORVRGSUxURVJf
WFRfTUFUQ0hfVENQTVNTIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVURklMVEVSX1hUX01BVENI
X1RJTUUgaXMgbm90IHNldAojIENPTkZJR19ORVRGSUxURVJfWFRfTUFUQ0hfVTMyIGlzIG5v
dCBzZXQKIyBlbmQgb2YgQ29yZSBOZXRmaWx0ZXIgQ29uZmlndXJhdGlvbgoKIyBDT05GSUdf
SVBfU0VUIGlzIG5vdCBzZXQKQ09ORklHX0lQX1ZTPW0KIyBDT05GSUdfSVBfVlNfSVBWNiBp
cyBub3Qgc2V0CiMgQ09ORklHX0lQX1ZTX0RFQlVHIGlzIG5vdCBzZXQKQ09ORklHX0lQX1ZT
X1RBQl9CSVRTPTEyCgojCiMgSVBWUyB0cmFuc3BvcnQgcHJvdG9jb2wgbG9hZCBiYWxhbmNp
bmcgc3VwcG9ydAojCkNPTkZJR19JUF9WU19QUk9UT19UQ1A9eQpDT05GSUdfSVBfVlNfUFJP
VE9fVURQPXkKIyBDT05GSUdfSVBfVlNfUFJPVE9fRVNQIGlzIG5vdCBzZXQKIyBDT05GSUdf
SVBfVlNfUFJPVE9fQUggaXMgbm90IHNldAojIENPTkZJR19JUF9WU19QUk9UT19TQ1RQIGlz
IG5vdCBzZXQKCiMKIyBJUFZTIHNjaGVkdWxlcgojCkNPTkZJR19JUF9WU19SUj1tCiMgQ09O
RklHX0lQX1ZTX1dSUiBpcyBub3Qgc2V0CiMgQ09ORklHX0lQX1ZTX0xDIGlzIG5vdCBzZXQK
IyBDT05GSUdfSVBfVlNfV0xDIGlzIG5vdCBzZXQKIyBDT05GSUdfSVBfVlNfRk8gaXMgbm90
IHNldAojIENPTkZJR19JUF9WU19PVkYgaXMgbm90IHNldAojIENPTkZJR19JUF9WU19MQkxD
IGlzIG5vdCBzZXQKIyBDT05GSUdfSVBfVlNfTEJMQ1IgaXMgbm90IHNldAojIENPTkZJR19J
UF9WU19ESCBpcyBub3Qgc2V0CiMgQ09ORklHX0lQX1ZTX1NIIGlzIG5vdCBzZXQKIyBDT05G
SUdfSVBfVlNfTUggaXMgbm90IHNldAojIENPTkZJR19JUF9WU19TRUQgaXMgbm90IHNldAoj
IENPTkZJR19JUF9WU19OUSBpcyBub3Qgc2V0CiMgQ09ORklHX0lQX1ZTX1RXT1MgaXMgbm90
IHNldAoKIwojIElQVlMgU0ggc2NoZWR1bGVyCiMKQ09ORklHX0lQX1ZTX1NIX1RBQl9CSVRT
PTgKCiMKIyBJUFZTIE1IIHNjaGVkdWxlcgojCkNPTkZJR19JUF9WU19NSF9UQUJfSU5ERVg9
MTIKCiMKIyBJUFZTIGFwcGxpY2F0aW9uIGhlbHBlcgojCiMgQ09ORklHX0lQX1ZTX0ZUUCBp
cyBub3Qgc2V0CkNPTkZJR19JUF9WU19ORkNUPXkKCiMKIyBJUDogTmV0ZmlsdGVyIENvbmZp
Z3VyYXRpb24KIwpDT05GSUdfTkZfREVGUkFHX0lQVjQ9bQojIENPTkZJR19ORl9TT0NLRVRf
SVBWNCBpcyBub3Qgc2V0CiMgQ09ORklHX05GX1RQUk9YWV9JUFY0IGlzIG5vdCBzZXQKIyBD
T05GSUdfTkZfRFVQX0lQVjQgaXMgbm90IHNldAojIENPTkZJR19ORl9MT0dfQVJQIGlzIG5v
dCBzZXQKQ09ORklHX05GX0xPR19JUFY0PW0KQ09ORklHX05GX1JFSkVDVF9JUFY0PW0KQ09O
RklHX0lQX05GX0lQVEFCTEVTPW0KIyBDT05GSUdfSVBfTkZfTUFUQ0hfQUggaXMgbm90IHNl
dAojIENPTkZJR19JUF9ORl9NQVRDSF9FQ04gaXMgbm90IHNldAojIENPTkZJR19JUF9ORl9N
QVRDSF9SUEZJTFRFUiBpcyBub3Qgc2V0CiMgQ09ORklHX0lQX05GX01BVENIX1RUTCBpcyBu
b3Qgc2V0CkNPTkZJR19JUF9ORl9GSUxURVI9bQpDT05GSUdfSVBfTkZfVEFSR0VUX1JFSkVD
VD1tCiMgQ09ORklHX0lQX05GX1RBUkdFVF9TWU5QUk9YWSBpcyBub3Qgc2V0CkNPTkZJR19J
UF9ORl9OQVQ9bQpDT05GSUdfSVBfTkZfVEFSR0VUX01BU1FVRVJBREU9bQojIENPTkZJR19J
UF9ORl9UQVJHRVRfTkVUTUFQIGlzIG5vdCBzZXQKQ09ORklHX0lQX05GX1RBUkdFVF9SRURJ
UkVDVD1tCkNPTkZJR19JUF9ORl9NQU5HTEU9bQojIENPTkZJR19JUF9ORl9UQVJHRVRfRUNO
IGlzIG5vdCBzZXQKIyBDT05GSUdfSVBfTkZfVEFSR0VUX1RUTCBpcyBub3Qgc2V0CiMgQ09O
RklHX0lQX05GX1JBVyBpcyBub3Qgc2V0CiMgQ09ORklHX0lQX05GX1NFQ1VSSVRZIGlzIG5v
dCBzZXQKIyBDT05GSUdfSVBfTkZfQVJQVEFCTEVTIGlzIG5vdCBzZXQKIyBlbmQgb2YgSVA6
IE5ldGZpbHRlciBDb25maWd1cmF0aW9uCgojCiMgSVB2NjogTmV0ZmlsdGVyIENvbmZpZ3Vy
YXRpb24KIwojIENPTkZJR19ORl9TT0NLRVRfSVBWNiBpcyBub3Qgc2V0CiMgQ09ORklHX05G
X1RQUk9YWV9JUFY2IGlzIG5vdCBzZXQKIyBDT05GSUdfTkZfRFVQX0lQVjYgaXMgbm90IHNl
dApDT05GSUdfTkZfUkVKRUNUX0lQVjY9bQpDT05GSUdfTkZfTE9HX0lQVjY9bQpDT05GSUdf
SVA2X05GX0lQVEFCTEVTPW0KIyBDT05GSUdfSVA2X05GX01BVENIX0FIIGlzIG5vdCBzZXQK
IyBDT05GSUdfSVA2X05GX01BVENIX0VVSTY0IGlzIG5vdCBzZXQKIyBDT05GSUdfSVA2X05G
X01BVENIX0ZSQUcgaXMgbm90IHNldAojIENPTkZJR19JUDZfTkZfTUFUQ0hfT1BUUyBpcyBu
b3Qgc2V0CiMgQ09ORklHX0lQNl9ORl9NQVRDSF9ITCBpcyBub3Qgc2V0CiMgQ09ORklHX0lQ
Nl9ORl9NQVRDSF9JUFY2SEVBREVSIGlzIG5vdCBzZXQKIyBDT05GSUdfSVA2X05GX01BVENI
X01IIGlzIG5vdCBzZXQKIyBDT05GSUdfSVA2X05GX01BVENIX1JQRklMVEVSIGlzIG5vdCBz
ZXQKIyBDT05GSUdfSVA2X05GX01BVENIX1JUIGlzIG5vdCBzZXQKIyBDT05GSUdfSVA2X05G
X01BVENIX1NSSCBpcyBub3Qgc2V0CiMgQ09ORklHX0lQNl9ORl9UQVJHRVRfSEwgaXMgbm90
IHNldApDT05GSUdfSVA2X05GX0ZJTFRFUj1tCkNPTkZJR19JUDZfTkZfVEFSR0VUX1JFSkVD
VD1tCiMgQ09ORklHX0lQNl9ORl9UQVJHRVRfU1lOUFJPWFkgaXMgbm90IHNldApDT05GSUdf
SVA2X05GX01BTkdMRT1tCiMgQ09ORklHX0lQNl9ORl9SQVcgaXMgbm90IHNldAojIENPTkZJ
R19JUDZfTkZfU0VDVVJJVFkgaXMgbm90IHNldApDT05GSUdfSVA2X05GX05BVD1tCkNPTkZJ
R19JUDZfTkZfVEFSR0VUX01BU1FVRVJBREU9bQojIENPTkZJR19JUDZfTkZfVEFSR0VUX05Q
VCBpcyBub3Qgc2V0CiMgZW5kIG9mIElQdjY6IE5ldGZpbHRlciBDb25maWd1cmF0aW9uCgpD
T05GSUdfTkZfREVGUkFHX0lQVjY9bQojIENPTkZJR19ORl9DT05OVFJBQ0tfQlJJREdFIGlz
IG5vdCBzZXQKQ09ORklHX0JSSURHRV9ORl9FQlRBQkxFUz1tCiMgQ09ORklHX0JSSURHRV9F
QlRfQlJPVVRFIGlzIG5vdCBzZXQKIyBDT05GSUdfQlJJREdFX0VCVF9UX0ZJTFRFUiBpcyBu
b3Qgc2V0CkNPTkZJR19CUklER0VfRUJUX1RfTkFUPW0KIyBDT05GSUdfQlJJREdFX0VCVF84
MDJfMyBpcyBub3Qgc2V0CiMgQ09ORklHX0JSSURHRV9FQlRfQU1PTkcgaXMgbm90IHNldAoj
IENPTkZJR19CUklER0VfRUJUX0FSUCBpcyBub3Qgc2V0CiMgQ09ORklHX0JSSURHRV9FQlRf
SVAgaXMgbm90IHNldAojIENPTkZJR19CUklER0VfRUJUX0lQNiBpcyBub3Qgc2V0CiMgQ09O
RklHX0JSSURHRV9FQlRfTElNSVQgaXMgbm90IHNldAojIENPTkZJR19CUklER0VfRUJUX01B
UksgaXMgbm90IHNldAojIENPTkZJR19CUklER0VfRUJUX1BLVFRZUEUgaXMgbm90IHNldAoj
IENPTkZJR19CUklER0VfRUJUX1NUUCBpcyBub3Qgc2V0CiMgQ09ORklHX0JSSURHRV9FQlRf
VkxBTiBpcyBub3Qgc2V0CiMgQ09ORklHX0JSSURHRV9FQlRfQVJQUkVQTFkgaXMgbm90IHNl
dAojIENPTkZJR19CUklER0VfRUJUX0ROQVQgaXMgbm90IHNldApDT05GSUdfQlJJREdFX0VC
VF9NQVJLX1Q9bQojIENPTkZJR19CUklER0VfRUJUX1JFRElSRUNUIGlzIG5vdCBzZXQKIyBD
T05GSUdfQlJJREdFX0VCVF9TTkFUIGlzIG5vdCBzZXQKIyBDT05GSUdfQlJJREdFX0VCVF9M
T0cgaXMgbm90IHNldAojIENPTkZJR19CUklER0VfRUJUX05GTE9HIGlzIG5vdCBzZXQKIyBD
T05GSUdfQlBGSUxURVIgaXMgbm90IHNldAojIENPTkZJR19JUF9EQ0NQIGlzIG5vdCBzZXQK
IyBDT05GSUdfSVBfU0NUUCBpcyBub3Qgc2V0CiMgQ09ORklHX1JEUyBpcyBub3Qgc2V0CiMg
Q09ORklHX1RJUEMgaXMgbm90IHNldAojIENPTkZJR19BVE0gaXMgbm90IHNldAojIENPTkZJ
R19MMlRQIGlzIG5vdCBzZXQKQ09ORklHX1NUUD1tCkNPTkZJR19CUklER0U9bQpDT05GSUdf
QlJJREdFX0lHTVBfU05PT1BJTkc9eQpDT05GSUdfQlJJREdFX1ZMQU5fRklMVEVSSU5HPXkK
IyBDT05GSUdfQlJJREdFX01SUCBpcyBub3Qgc2V0CiMgQ09ORklHX0JSSURHRV9DRk0gaXMg
bm90IHNldAojIENPTkZJR19ORVRfRFNBIGlzIG5vdCBzZXQKQ09ORklHX1ZMQU5fODAyMVE9
bQojIENPTkZJR19WTEFOXzgwMjFRX0dWUlAgaXMgbm90IHNldAojIENPTkZJR19WTEFOXzgw
MjFRX01WUlAgaXMgbm90IHNldApDT05GSUdfTExDPW0KIyBDT05GSUdfTExDMiBpcyBub3Qg
c2V0CiMgQ09ORklHX0FUQUxLIGlzIG5vdCBzZXQKIyBDT05GSUdfWDI1IGlzIG5vdCBzZXQK
IyBDT05GSUdfTEFQQiBpcyBub3Qgc2V0CiMgQ09ORklHX1BIT05FVCBpcyBub3Qgc2V0CiMg
Q09ORklHXzZMT1dQQU4gaXMgbm90IHNldAojIENPTkZJR19JRUVFODAyMTU0IGlzIG5vdCBz
ZXQKQ09ORklHX05FVF9TQ0hFRD15CgojCiMgUXVldWVpbmcvU2NoZWR1bGluZwojCkNPTkZJ
R19ORVRfU0NIX0hUQj1tCiMgQ09ORklHX05FVF9TQ0hfSEZTQyBpcyBub3Qgc2V0CiMgQ09O
RklHX05FVF9TQ0hfUFJJTyBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9TQ0hfTVVMVElRIGlz
IG5vdCBzZXQKIyBDT05GSUdfTkVUX1NDSF9SRUQgaXMgbm90IHNldAojIENPTkZJR19ORVRf
U0NIX1NGQiBpcyBub3Qgc2V0CkNPTkZJR19ORVRfU0NIX1NGUT1tCiMgQ09ORklHX05FVF9T
Q0hfVEVRTCBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9TQ0hfVEJGIGlzIG5vdCBzZXQKIyBD
T05GSUdfTkVUX1NDSF9DQlMgaXMgbm90IHNldAojIENPTkZJR19ORVRfU0NIX0VURiBpcyBu
b3Qgc2V0CiMgQ09ORklHX05FVF9TQ0hfVEFQUklPIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVU
X1NDSF9HUkVEIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1NDSF9ORVRFTSBpcyBub3Qgc2V0
CiMgQ09ORklHX05FVF9TQ0hfRFJSIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1NDSF9NUVBS
SU8gaXMgbm90IHNldAojIENPTkZJR19ORVRfU0NIX1NLQlBSSU8gaXMgbm90IHNldAojIENP
TkZJR19ORVRfU0NIX0NIT0tFIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1NDSF9RRlEgaXMg
bm90IHNldAojIENPTkZJR19ORVRfU0NIX0NPREVMIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVU
X1NDSF9GUV9DT0RFTCBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9TQ0hfQ0FLRSBpcyBub3Qg
c2V0CiMgQ09ORklHX05FVF9TQ0hfRlEgaXMgbm90IHNldAojIENPTkZJR19ORVRfU0NIX0hI
RiBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9TQ0hfUElFIGlzIG5vdCBzZXQKQ09ORklHX05F
VF9TQ0hfSU5HUkVTUz1tCiMgQ09ORklHX05FVF9TQ0hfUExVRyBpcyBub3Qgc2V0CiMgQ09O
RklHX05FVF9TQ0hfRVRTIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1NDSF9ERUZBVUxUIGlz
IG5vdCBzZXQKCiMKIyBDbGFzc2lmaWNhdGlvbgojCkNPTkZJR19ORVRfQ0xTPXkKIyBDT05G
SUdfTkVUX0NMU19CQVNJQyBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9DTFNfUk9VVEU0IGlz
IG5vdCBzZXQKQ09ORklHX05FVF9DTFNfRlc9bQpDT05GSUdfTkVUX0NMU19VMzI9bQojIENP
TkZJR19DTFNfVTMyX1BFUkYgaXMgbm90IHNldAojIENPTkZJR19DTFNfVTMyX01BUksgaXMg
bm90IHNldAojIENPTkZJR19ORVRfQ0xTX0ZMT1cgaXMgbm90IHNldApDT05GSUdfTkVUX0NM
U19DR1JPVVA9bQojIENPTkZJR19ORVRfQ0xTX0JQRiBpcyBub3Qgc2V0CiMgQ09ORklHX05F
VF9DTFNfRkxPV0VSIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX0NMU19NQVRDSEFMTCBpcyBu
b3Qgc2V0CiMgQ09ORklHX05FVF9FTUFUQ0ggaXMgbm90IHNldApDT05GSUdfTkVUX0NMU19B
Q1Q9eQpDT05GSUdfTkVUX0FDVF9QT0xJQ0U9bQojIENPTkZJR19ORVRfQUNUX0dBQ1QgaXMg
bm90IHNldAojIENPTkZJR19ORVRfQUNUX01JUlJFRCBpcyBub3Qgc2V0CiMgQ09ORklHX05F
VF9BQ1RfU0FNUExFIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX0FDVF9JUFQgaXMgbm90IHNl
dAojIENPTkZJR19ORVRfQUNUX05BVCBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9BQ1RfUEVE
SVQgaXMgbm90IHNldAojIENPTkZJR19ORVRfQUNUX1NJTVAgaXMgbm90IHNldAojIENPTkZJ
R19ORVRfQUNUX1NLQkVESVQgaXMgbm90IHNldAojIENPTkZJR19ORVRfQUNUX0NTVU0gaXMg
bm90IHNldAojIENPTkZJR19ORVRfQUNUX01QTFMgaXMgbm90IHNldAojIENPTkZJR19ORVRf
QUNUX1ZMQU4gaXMgbm90IHNldAojIENPTkZJR19ORVRfQUNUX0JQRiBpcyBub3Qgc2V0CiMg
Q09ORklHX05FVF9BQ1RfQ09OTk1BUksgaXMgbm90IHNldAojIENPTkZJR19ORVRfQUNUX0NU
SU5GTyBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9BQ1RfU0tCTU9EIGlzIG5vdCBzZXQKIyBD
T05GSUdfTkVUX0FDVF9JRkUgaXMgbm90IHNldAojIENPTkZJR19ORVRfQUNUX1RVTk5FTF9L
RVkgaXMgbm90IHNldAojIENPTkZJR19ORVRfQUNUX0dBVEUgaXMgbm90IHNldAojIENPTkZJ
R19ORVRfVENfU0tCX0VYVCBpcyBub3Qgc2V0CkNPTkZJR19ORVRfU0NIX0ZJRk89eQojIENP
TkZJR19EQ0IgaXMgbm90IHNldAojIENPTkZJR19ETlNfUkVTT0xWRVIgaXMgbm90IHNldAoj
IENPTkZJR19CQVRNQU5fQURWIGlzIG5vdCBzZXQKIyBDT05GSUdfT1BFTlZTV0lUQ0ggaXMg
bm90IHNldAojIENPTkZJR19WU09DS0VUUyBpcyBub3Qgc2V0CkNPTkZJR19ORVRMSU5LX0RJ
QUc9eQpDT05GSUdfTVBMUz15CiMgQ09ORklHX05FVF9NUExTX0dTTyBpcyBub3Qgc2V0CiMg
Q09ORklHX01QTFNfUk9VVElORyBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9OU0ggaXMgbm90
IHNldAojIENPTkZJR19IU1IgaXMgbm90IHNldApDT05GSUdfTkVUX1NXSVRDSERFVj15CkNP
TkZJR19ORVRfTDNfTUFTVEVSX0RFVj15CkNPTkZJR19RUlRSPW0KIyBDT05GSUdfUVJUUl9U
VU4gaXMgbm90IHNldApDT05GSUdfUVJUUl9NSEk9bQpDT05GSUdfTkVUX05DU0k9eQpDT05G
SUdfTkNTSV9PRU1fQ01EX0dFVF9NQUM9eQpDT05GSUdfTkNTSV9PRU1fQ01EX0tFRVBfUEhZ
PXkKQ09ORklHX1BDUFVfREVWX1JFRkNOVD15CkNPTkZJR19NQVhfU0tCX0ZSQUdTPTE3CkNP
TkZJR19SUFM9eQpDT05GSUdfUkZTX0FDQ0VMPXkKQ09ORklHX1NPQ0tfUlhfUVVFVUVfTUFQ
UElORz15CkNPTkZJR19YUFM9eQpDT05GSUdfQ0dST1VQX05FVF9QUklPPXkKQ09ORklHX0NH
Uk9VUF9ORVRfQ0xBU1NJRD15CkNPTkZJR19ORVRfUlhfQlVTWV9QT0xMPXkKQ09ORklHX0JR
TD15CkNPTkZJR19ORVRfRkxPV19MSU1JVD15CgojCiMgTmV0d29yayB0ZXN0aW5nCiMKIyBD
T05GSUdfTkVUX1BLVEdFTiBpcyBub3Qgc2V0CiMgZW5kIG9mIE5ldHdvcmsgdGVzdGluZwoj
IGVuZCBvZiBOZXR3b3JraW5nIG9wdGlvbnMKCiMgQ09ORklHX0hBTVJBRElPIGlzIG5vdCBz
ZXQKIyBDT05GSUdfQ0FOIGlzIG5vdCBzZXQKQ09ORklHX0JUPW0KQ09ORklHX0JUX0JSRURS
PXkKQ09ORklHX0JUX1JGQ09NTT1tCkNPTkZJR19CVF9SRkNPTU1fVFRZPXkKQ09ORklHX0JU
X0JORVA9bQpDT05GSUdfQlRfQk5FUF9NQ19GSUxURVI9eQpDT05GSUdfQlRfQk5FUF9QUk9U
T19GSUxURVI9eQpDT05GSUdfQlRfSElEUD1tCiMgQ09ORklHX0JUX0hTIGlzIG5vdCBzZXQK
Q09ORklHX0JUX0xFPXkKQ09ORklHX0JUX0xFX0wyQ0FQX0VDUkVEPXkKQ09ORklHX0JUX0xF
RFM9eQpDT05GSUdfQlRfTVNGVEVYVD15CiMgQ09ORklHX0JUX0FPU1BFWFQgaXMgbm90IHNl
dAojIENPTkZJR19CVF9ERUJVR0ZTIGlzIG5vdCBzZXQKIyBDT05GSUdfQlRfU0VMRlRFU1Qg
aXMgbm90IHNldAoKIwojIEJsdWV0b290aCBkZXZpY2UgZHJpdmVycwojCkNPTkZJR19CVF9J
TlRFTD1tCkNPTkZJR19CVF9CQ009bQpDT05GSUdfQlRfUlRMPW0KQ09ORklHX0JUX01USz1t
CkNPTkZJR19CVF9IQ0lCVFVTQj1tCkNPTkZJR19CVF9IQ0lCVFVTQl9BVVRPU1VTUEVORD15
CkNPTkZJR19CVF9IQ0lCVFVTQl9QT0xMX1NZTkM9eQpDT05GSUdfQlRfSENJQlRVU0JfQkNN
PXkKQ09ORklHX0JUX0hDSUJUVVNCX01USz15CkNPTkZJR19CVF9IQ0lCVFVTQl9SVEw9eQoj
IENPTkZJR19CVF9IQ0lVQVJUIGlzIG5vdCBzZXQKIyBDT05GSUdfQlRfSENJQkNNMjAzWCBp
cyBub3Qgc2V0CiMgQ09ORklHX0JUX0hDSUJDTTQzNzcgaXMgbm90IHNldAojIENPTkZJR19C
VF9IQ0lCUEExMFggaXMgbm90IHNldAojIENPTkZJR19CVF9IQ0lCRlVTQiBpcyBub3Qgc2V0
CiMgQ09ORklHX0JUX0hDSURUTDEgaXMgbm90IHNldAojIENPTkZJR19CVF9IQ0lCVDNDIGlz
IG5vdCBzZXQKIyBDT05GSUdfQlRfSENJQkxVRUNBUkQgaXMgbm90IHNldAojIENPTkZJR19C
VF9IQ0lWSENJIGlzIG5vdCBzZXQKIyBDT05GSUdfQlRfTVJWTCBpcyBub3Qgc2V0CiMgQ09O
RklHX0JUX0FUSDNLIGlzIG5vdCBzZXQKIyBDT05GSUdfQlRfTVRLVUFSVCBpcyBub3Qgc2V0
CiMgQ09ORklHX0JUX1ZJUlRJTyBpcyBub3Qgc2V0CiMgQ09ORklHX0JUX05YUFVBUlQgaXMg
bm90IHNldAojIGVuZCBvZiBCbHVldG9vdGggZGV2aWNlIGRyaXZlcnMKCiMgQ09ORklHX0FG
X1JYUlBDIGlzIG5vdCBzZXQKIyBDT05GSUdfQUZfS0NNIGlzIG5vdCBzZXQKIyBDT05GSUdf
TUNUUCBpcyBub3Qgc2V0CkNPTkZJR19GSUJfUlVMRVM9eQpDT05GSUdfV0lSRUxFU1M9eQpD
T05GSUdfV0VYVF9DT1JFPXkKQ09ORklHX1dFWFRfUFJPQz15CkNPTkZJR19DRkc4MDIxMT1t
CiMgQ09ORklHX05MODAyMTFfVEVTVE1PREUgaXMgbm90IHNldAojIENPTkZJR19DRkc4MDIx
MV9ERVZFTE9QRVJfV0FSTklOR1MgaXMgbm90IHNldAojIENPTkZJR19DRkc4MDIxMV9DRVJU
SUZJQ0FUSU9OX09OVVMgaXMgbm90IHNldApDT05GSUdfQ0ZHODAyMTFfUkVRVUlSRV9TSUdO
RURfUkVHREI9eQpDT05GSUdfQ0ZHODAyMTFfVVNFX0tFUk5FTF9SRUdEQl9LRVlTPXkKQ09O
RklHX0NGRzgwMjExX0RFRkFVTFRfUFM9eQpDT05GSUdfQ0ZHODAyMTFfREVCVUdGUz15CkNP
TkZJR19DRkc4MDIxMV9DUkRBX1NVUFBPUlQ9eQpDT05GSUdfQ0ZHODAyMTFfV0VYVD15CkNP
TkZJR19NQUM4MDIxMT1tCkNPTkZJR19NQUM4MDIxMV9IQVNfUkM9eQpDT05GSUdfTUFDODAy
MTFfUkNfTUlOU1RSRUw9eQpDT05GSUdfTUFDODAyMTFfUkNfREVGQVVMVF9NSU5TVFJFTD15
CkNPTkZJR19NQUM4MDIxMV9SQ19ERUZBVUxUPSJtaW5zdHJlbF9odCIKQ09ORklHX01BQzgw
MjExX01FU0g9eQpDT05GSUdfTUFDODAyMTFfTEVEUz15CkNPTkZJR19NQUM4MDIxMV9ERUJV
R0ZTPXkKIyBDT05GSUdfTUFDODAyMTFfTUVTU0FHRV9UUkFDSU5HIGlzIG5vdCBzZXQKIyBD
T05GSUdfTUFDODAyMTFfREVCVUdfTUVOVSBpcyBub3Qgc2V0CkNPTkZJR19NQUM4MDIxMV9T
VEFfSEFTSF9NQVhfU0laRT0wCkNPTkZJR19SRktJTEw9bQpDT05GSUdfUkZLSUxMX0xFRFM9
eQojIENPTkZJR19SRktJTExfSU5QVVQgaXMgbm90IHNldAojIENPTkZJR19SRktJTExfR1BJ
TyBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF85UCBpcyBub3Qgc2V0CiMgQ09ORklHX0NBSUYg
aXMgbm90IHNldAojIENPTkZJR19DRVBIX0xJQiBpcyBub3Qgc2V0CiMgQ09ORklHX05GQyBp
cyBub3Qgc2V0CiMgQ09ORklHX1BTQU1QTEUgaXMgbm90IHNldAojIENPTkZJR19ORVRfSUZF
IGlzIG5vdCBzZXQKQ09ORklHX0xXVFVOTkVMPXkKIyBDT05GSUdfTFdUVU5ORUxfQlBGIGlz
IG5vdCBzZXQKQ09ORklHX0RTVF9DQUNIRT15CkNPTkZJR19HUk9fQ0VMTFM9eQpDT05GSUdf
TkVUX1NFTEZURVNUUz15CkNPTkZJR19QQUdFX1BPT0w9eQojIENPTkZJR19QQUdFX1BPT0xf
U1RBVFMgaXMgbm90IHNldApDT05GSUdfRkFJTE9WRVI9bQpDT05GSUdfRVRIVE9PTF9ORVRM
SU5LPXkKCiMKIyBEZXZpY2UgRHJpdmVycwojCkNPTkZJR19IQVZFX0VJU0E9eQojIENPTkZJ
R19FSVNBIGlzIG5vdCBzZXQKQ09ORklHX0hBVkVfUENJPXkKQ09ORklHX1BDST15CkNPTkZJ
R19QQ0lfRE9NQUlOUz15CkNPTkZJR19QQ0lFUE9SVEJVUz15CkNPTkZJR19IT1RQTFVHX1BD
SV9QQ0lFPXkKQ09ORklHX1BDSUVBRVI9eQojIENPTkZJR19QQ0lFQUVSX0lOSkVDVCBpcyBu
b3Qgc2V0CkNPTkZJR19QQ0lFX0VDUkM9eQpDT05GSUdfUENJRUFTUE09eQpDT05GSUdfUENJ
RUFTUE1fREVGQVVMVD15CiMgQ09ORklHX1BDSUVBU1BNX1BPV0VSU0FWRSBpcyBub3Qgc2V0
CiMgQ09ORklHX1BDSUVBU1BNX1BPV0VSX1NVUEVSU0FWRSBpcyBub3Qgc2V0CiMgQ09ORklH
X1BDSUVBU1BNX1BFUkZPUk1BTkNFIGlzIG5vdCBzZXQKQ09ORklHX1BDSUVfUE1FPXkKQ09O
RklHX1BDSUVfRFBDPXkKQ09ORklHX1BDSUVfUFRNPXkKQ09ORklHX1BDSUVfRURSPXkKQ09O
RklHX1BDSV9NU0k9eQpDT05GSUdfUENJX1FVSVJLUz15CiMgQ09ORklHX1BDSV9ERUJVRyBp
cyBub3Qgc2V0CiMgQ09ORklHX1BDSV9SRUFMTE9DX0VOQUJMRV9BVVRPIGlzIG5vdCBzZXQK
Q09ORklHX1BDSV9TVFVCPXkKIyBDT05GSUdfUENJX1BGX1NUVUIgaXMgbm90IHNldApDT05G
SUdfUENJX0FUUz15CkNPTkZJR19QQ0lfRE9FPXkKQ09ORklHX1BDSV9MT0NLTEVTU19DT05G
SUc9eQpDT05GSUdfUENJX0lPVj15CkNPTkZJR19QQ0lfUFJJPXkKQ09ORklHX1BDSV9QQVNJ
RD15CkNPTkZJR19QQ0lfTEFCRUw9eQojIENPTkZJR19QQ0lFX0JVU19UVU5FX09GRiBpcyBu
b3Qgc2V0CkNPTkZJR19QQ0lFX0JVU19ERUZBVUxUPXkKIyBDT05GSUdfUENJRV9CVVNfU0FG
RSBpcyBub3Qgc2V0CiMgQ09ORklHX1BDSUVfQlVTX1BFUkZPUk1BTkNFIGlzIG5vdCBzZXQK
IyBDT05GSUdfUENJRV9CVVNfUEVFUjJQRUVSIGlzIG5vdCBzZXQKQ09ORklHX1ZHQV9BUkI9
eQpDT05GSUdfVkdBX0FSQl9NQVhfR1BVUz0xNgpDT05GSUdfSE9UUExVR19QQ0k9eQpDT05G
SUdfSE9UUExVR19QQ0lfQUNQST15CiMgQ09ORklHX0hPVFBMVUdfUENJX0FDUElfSUJNIGlz
IG5vdCBzZXQKIyBDT05GSUdfSE9UUExVR19QQ0lfQ1BDSSBpcyBub3Qgc2V0CkNPTkZJR19I
T1RQTFVHX1BDSV9TSFBDPXkKCiMKIyBQQ0kgY29udHJvbGxlciBkcml2ZXJzCiMKIyBDT05G
SUdfVk1EIGlzIG5vdCBzZXQKCiMKIyBDYWRlbmNlLWJhc2VkIFBDSWUgY29udHJvbGxlcnMK
IwojIGVuZCBvZiBDYWRlbmNlLWJhc2VkIFBDSWUgY29udHJvbGxlcnMKCiMKIyBEZXNpZ25X
YXJlLWJhc2VkIFBDSWUgY29udHJvbGxlcnMKIwojIENPTkZJR19QQ0lfTUVTT04gaXMgbm90
IHNldAojIENPTkZJR19QQ0lFX0RXX1BMQVRfSE9TVCBpcyBub3Qgc2V0CiMgZW5kIG9mIERl
c2lnbldhcmUtYmFzZWQgUENJZSBjb250cm9sbGVycwoKIwojIE1vYml2ZWlsLWJhc2VkIFBD
SWUgY29udHJvbGxlcnMKIwojIGVuZCBvZiBNb2JpdmVpbC1iYXNlZCBQQ0llIGNvbnRyb2xs
ZXJzCiMgZW5kIG9mIFBDSSBjb250cm9sbGVyIGRyaXZlcnMKCiMKIyBQQ0kgRW5kcG9pbnQK
IwojIENPTkZJR19QQ0lfRU5EUE9JTlQgaXMgbm90IHNldAojIGVuZCBvZiBQQ0kgRW5kcG9p
bnQKCiMKIyBQQ0kgc3dpdGNoIGNvbnRyb2xsZXIgZHJpdmVycwojCiMgQ09ORklHX1BDSV9T
V19TV0lUQ0hURUMgaXMgbm90IHNldAojIGVuZCBvZiBQQ0kgc3dpdGNoIGNvbnRyb2xsZXIg
ZHJpdmVycwoKQ09ORklHX0NYTF9CVVM9eQpDT05GSUdfQ1hMX1BDST15CiMgQ09ORklHX0NY
TF9NRU1fUkFXX0NPTU1BTkRTIGlzIG5vdCBzZXQKQ09ORklHX0NYTF9BQ1BJPXkKQ09ORklH
X0NYTF9QTUVNPXkKIyBDT05GSUdfQ1hMX01FTSBpcyBub3Qgc2V0CkNPTkZJR19DWExfUE9S
VD15CkNPTkZJR19DWExfUkVHSU9OPXkKIyBDT05GSUdfQ1hMX1JFR0lPTl9JTlZBTElEQVRJ
T05fVEVTVCBpcyBub3Qgc2V0CkNPTkZJR19DWExfUE1VPW0KQ09ORklHX1BDQ0FSRD1tCkNP
TkZJR19QQ01DSUE9bQpDT05GSUdfUENNQ0lBX0xPQURfQ0lTPXkKQ09ORklHX0NBUkRCVVM9
eQoKIwojIFBDLWNhcmQgYnJpZGdlcwojCiMgQ09ORklHX1lFTlRBIGlzIG5vdCBzZXQKIyBD
T05GSUdfUEQ2NzI5IGlzIG5vdCBzZXQKIyBDT05GSUdfSTgyMDkyIGlzIG5vdCBzZXQKIyBD
T05GSUdfUkFQSURJTyBpcyBub3Qgc2V0CgojCiMgR2VuZXJpYyBEcml2ZXIgT3B0aW9ucwoj
CiMgQ09ORklHX1VFVkVOVF9IRUxQRVIgaXMgbm90IHNldApDT05GSUdfREVWVE1QRlM9eQpD
T05GSUdfREVWVE1QRlNfTU9VTlQ9eQojIENPTkZJR19ERVZUTVBGU19TQUZFIGlzIG5vdCBz
ZXQKQ09ORklHX1NUQU5EQUxPTkU9eQpDT05GSUdfUFJFVkVOVF9GSVJNV0FSRV9CVUlMRD15
CgojCiMgRmlybXdhcmUgbG9hZGVyCiMKQ09ORklHX0ZXX0xPQURFUj15CkNPTkZJR19GV19M
T0FERVJfREVCVUc9eQpDT05GSUdfRldfTE9BREVSX1BBR0VEX0JVRj15CkNPTkZJR19GV19M
T0FERVJfU1lTRlM9eQpDT05GSUdfRVhUUkFfRklSTVdBUkU9ImFtZC11Y29kZS9taWNyb2Nv
ZGVfYW1kX2ZhbTE5aC5iaW4iCkNPTkZJR19FWFRSQV9GSVJNV0FSRV9ESVI9Ii9saWIvZmly
bXdhcmUiCkNPTkZJR19GV19MT0FERVJfVVNFUl9IRUxQRVI9eQojIENPTkZJR19GV19MT0FE
RVJfVVNFUl9IRUxQRVJfRkFMTEJBQ0sgaXMgbm90IHNldApDT05GSUdfRldfTE9BREVSX0NP
TVBSRVNTPXkKIyBDT05GSUdfRldfTE9BREVSX0NPTVBSRVNTX1haIGlzIG5vdCBzZXQKQ09O
RklHX0ZXX0xPQURFUl9DT01QUkVTU19aU1REPXkKQ09ORklHX0ZXX0NBQ0hFPXkKQ09ORklH
X0ZXX1VQTE9BRD15CiMgZW5kIG9mIEZpcm13YXJlIGxvYWRlcgoKQ09ORklHX0FMTE9XX0RF
Vl9DT1JFRFVNUD15CiMgQ09ORklHX0RFQlVHX0RSSVZFUiBpcyBub3Qgc2V0CiMgQ09ORklH
X0RFQlVHX0RFVlJFUyBpcyBub3Qgc2V0CiMgQ09ORklHX0RFQlVHX1RFU1RfRFJJVkVSX1JF
TU9WRSBpcyBub3Qgc2V0CkNPTkZJR19ITUVNX1JFUE9SVElORz15CiMgQ09ORklHX1RFU1Rf
QVNZTkNfRFJJVkVSX1BST0JFIGlzIG5vdCBzZXQKQ09ORklHX0dFTkVSSUNfQ1BVX0FVVE9Q
Uk9CRT15CkNPTkZJR19HRU5FUklDX0NQVV9WVUxORVJBQklMSVRJRVM9eQpDT05GSUdfUkVH
TUFQPXkKQ09ORklHX1JFR01BUF9JMkM9eQpDT05GSUdfUkVHTUFQX1NQST1tCkNPTkZJR19S
RUdNQVBfTU1JTz15CkNPTkZJR19SRUdNQVBfSVJRPXkKQ09ORklHX0RNQV9TSEFSRURfQlVG
RkVSPXkKIyBDT05GSUdfRE1BX0ZFTkNFX1RSQUNFIGlzIG5vdCBzZXQKIyBDT05GSUdfRldf
REVWTElOS19TWU5DX1NUQVRFX1RJTUVPVVQgaXMgbm90IHNldAojIGVuZCBvZiBHZW5lcmlj
IERyaXZlciBPcHRpb25zCgojCiMgQnVzIGRldmljZXMKIwpDT05GSUdfTUhJX0JVUz1tCiMg
Q09ORklHX01ISV9CVVNfREVCVUcgaXMgbm90IHNldAojIENPTkZJR19NSElfQlVTX1BDSV9H
RU5FUklDIGlzIG5vdCBzZXQKIyBDT05GSUdfTUhJX0JVU19FUCBpcyBub3Qgc2V0CiMgZW5k
IG9mIEJ1cyBkZXZpY2VzCgpDT05GSUdfQ09OTkVDVE9SPXkKQ09ORklHX1BST0NfRVZFTlRT
PXkKCiMKIyBGaXJtd2FyZSBEcml2ZXJzCiMKCiMKIyBBUk0gU3lzdGVtIENvbnRyb2wgYW5k
IE1hbmFnZW1lbnQgSW50ZXJmYWNlIFByb3RvY29sCiMKIyBlbmQgb2YgQVJNIFN5c3RlbSBD
b250cm9sIGFuZCBNYW5hZ2VtZW50IEludGVyZmFjZSBQcm90b2NvbAoKIyBDT05GSUdfRURE
IGlzIG5vdCBzZXQKQ09ORklHX0ZJUk1XQVJFX01FTU1BUD15CkNPTkZJR19ETUlJRD15CkNP
TkZJR19ETUlfU1lTRlM9eQpDT05GSUdfRE1JX1NDQU5fTUFDSElORV9OT05fRUZJX0ZBTExC
QUNLPXkKIyBDT05GSUdfSVNDU0lfSUJGVCBpcyBub3Qgc2V0CiMgQ09ORklHX0ZXX0NGR19T
WVNGUyBpcyBub3Qgc2V0CkNPTkZJR19TWVNGQj15CiMgQ09ORklHX1NZU0ZCX1NJTVBMRUZC
IGlzIG5vdCBzZXQKIyBDT05GSUdfR09PR0xFX0ZJUk1XQVJFIGlzIG5vdCBzZXQKCiMKIyBF
RkkgKEV4dGVuc2libGUgRmlybXdhcmUgSW50ZXJmYWNlKSBTdXBwb3J0CiMKQ09ORklHX0VG
SV9FU1JUPXkKIyBDT05GSUdfRUZJX1ZBUlNfUFNUT1JFIGlzIG5vdCBzZXQKQ09ORklHX0VG
SV9TT0ZUX1JFU0VSVkU9eQpDT05GSUdfRUZJX0RYRV9NRU1fQVRUUklCVVRFUz15CkNPTkZJ
R19FRklfUlVOVElNRV9XUkFQUEVSUz15CiMgQ09ORklHX0VGSV9CT09UTE9BREVSX0NPTlRS
T0wgaXMgbm90IHNldAojIENPTkZJR19FRklfQ0FQU1VMRV9MT0FERVIgaXMgbm90IHNldAoj
IENPTkZJR19FRklfVEVTVCBpcyBub3Qgc2V0CiMgQ09ORklHX0FQUExFX1BST1BFUlRJRVMg
aXMgbm90IHNldAojIENPTkZJR19SRVNFVF9BVFRBQ0tfTUlUSUdBVElPTiBpcyBub3Qgc2V0
CkNPTkZJR19FRklfUkNJMl9UQUJMRT15CiMgQ09ORklHX0VGSV9ESVNBQkxFX1BDSV9ETUEg
aXMgbm90IHNldApDT05GSUdfRUZJX0VBUkxZQ09OPXkKQ09ORklHX0VGSV9DVVNUT01fU1NE
VF9PVkVSTEFZUz15CiMgQ09ORklHX0VGSV9ESVNBQkxFX1JVTlRJTUUgaXMgbm90IHNldAoj
IENPTkZJR19FRklfQ09DT19TRUNSRVQgaXMgbm90IHNldApDT05GSUdfVU5BQ0NFUFRFRF9N
RU1PUlk9eQojIGVuZCBvZiBFRkkgKEV4dGVuc2libGUgRmlybXdhcmUgSW50ZXJmYWNlKSBT
dXBwb3J0CgpDT05GSUdfVUVGSV9DUEVSPXkKQ09ORklHX1VFRklfQ1BFUl9YODY9eQoKIwoj
IFRlZ3JhIGZpcm13YXJlIGRyaXZlcgojCiMgZW5kIG9mIFRlZ3JhIGZpcm13YXJlIGRyaXZl
cgojIGVuZCBvZiBGaXJtd2FyZSBEcml2ZXJzCgojIENPTkZJR19HTlNTIGlzIG5vdCBzZXQK
IyBDT05GSUdfTVREIGlzIG5vdCBzZXQKIyBDT05GSUdfT0YgaXMgbm90IHNldApDT05GSUdf
QVJDSF9NSUdIVF9IQVZFX1BDX1BBUlBPUlQ9eQojIENPTkZJR19QQVJQT1JUIGlzIG5vdCBz
ZXQKQ09ORklHX1BOUD15CiMgQ09ORklHX1BOUF9ERUJVR19NRVNTQUdFUyBpcyBub3Qgc2V0
CgojCiMgUHJvdG9jb2xzCiMKQ09ORklHX1BOUEFDUEk9eQpDT05GSUdfQkxLX0RFVj15CiMg
Q09ORklHX0JMS19ERVZfTlVMTF9CTEsgaXMgbm90IHNldAojIENPTkZJR19CTEtfREVWX0ZE
IGlzIG5vdCBzZXQKQ09ORklHX0NEUk9NPW0KIyBDT05GSUdfQkxLX0RFVl9QQ0lFU1NEX01U
SVAzMlhYIGlzIG5vdCBzZXQKIyBDT05GSUdfWlJBTSBpcyBub3Qgc2V0CkNPTkZJR19CTEtf
REVWX0xPT1A9eQpDT05GSUdfQkxLX0RFVl9MT09QX01JTl9DT1VOVD00CiMgQ09ORklHX0JM
S19ERVZfRFJCRCBpcyBub3Qgc2V0CiMgQ09ORklHX0JMS19ERVZfTkJEIGlzIG5vdCBzZXQK
IyBDT05GSUdfQkxLX0RFVl9SQU0gaXMgbm90IHNldAojIENPTkZJR19DRFJPTV9QS1RDRFZE
IGlzIG5vdCBzZXQKIyBDT05GSUdfQVRBX09WRVJfRVRIIGlzIG5vdCBzZXQKIyBDT05GSUdf
VklSVElPX0JMSyBpcyBub3Qgc2V0CiMgQ09ORklHX0JMS19ERVZfUkJEIGlzIG5vdCBzZXQK
IyBDT05GSUdfQkxLX0RFVl9VQkxLIGlzIG5vdCBzZXQKCiMKIyBOVk1FIFN1cHBvcnQKIwpD
T05GSUdfTlZNRV9DT1JFPXkKQ09ORklHX0JMS19ERVZfTlZNRT15CkNPTkZJR19OVk1FX01V
TFRJUEFUSD15CiMgQ09ORklHX05WTUVfVkVSQk9TRV9FUlJPUlMgaXMgbm90IHNldApDT05G
SUdfTlZNRV9IV01PTj15CiMgQ09ORklHX05WTUVfRkMgaXMgbm90IHNldAojIENPTkZJR19O
Vk1FX1RDUCBpcyBub3Qgc2V0CiMgQ09ORklHX05WTUVfQVVUSCBpcyBub3Qgc2V0CiMgZW5k
IG9mIE5WTUUgU3VwcG9ydAoKIwojIE1pc2MgZGV2aWNlcwojCiMgQ09ORklHX0FENTI1WF9E
UE9UIGlzIG5vdCBzZXQKIyBDT05GSUdfRFVNTVlfSVJRIGlzIG5vdCBzZXQKIyBDT05GSUdf
SUJNX0FTTSBpcyBub3Qgc2V0CiMgQ09ORklHX1BIQU5UT00gaXMgbm90IHNldAojIENPTkZJ
R19USUZNX0NPUkUgaXMgbm90IHNldAojIENPTkZJR19JQ1M5MzJTNDAxIGlzIG5vdCBzZXQK
IyBDT05GSUdfRU5DTE9TVVJFX1NFUlZJQ0VTIGlzIG5vdCBzZXQKIyBDT05GSUdfSFBfSUxP
IGlzIG5vdCBzZXQKIyBDT05GSUdfQVBEUzk4MDJBTFMgaXMgbm90IHNldAojIENPTkZJR19J
U0wyOTAwMyBpcyBub3Qgc2V0CiMgQ09ORklHX0lTTDI5MDIwIGlzIG5vdCBzZXQKIyBDT05G
SUdfU0VOU09SU19UU0wyNTUwIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19CSDE3NzAg
aXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0FQRFM5OTBYIGlzIG5vdCBzZXQKIyBDT05G
SUdfSE1DNjM1MiBpcyBub3Qgc2V0CiMgQ09ORklHX0RTMTY4MiBpcyBub3Qgc2V0CiMgQ09O
RklHX0xBVFRJQ0VfRUNQM19DT05GSUcgaXMgbm90IHNldAojIENPTkZJR19TUkFNIGlzIG5v
dCBzZXQKIyBDT05GSUdfRFdfWERBVEFfUENJRSBpcyBub3Qgc2V0CiMgQ09ORklHX1BDSV9F
TkRQT0lOVF9URVNUIGlzIG5vdCBzZXQKIyBDT05GSUdfWElMSU5YX1NERkVDIGlzIG5vdCBz
ZXQKIyBDT05GSUdfQzJQT1JUIGlzIG5vdCBzZXQKCiMKIyBFRVBST00gc3VwcG9ydAojCiMg
Q09ORklHX0VFUFJPTV9BVDI0IGlzIG5vdCBzZXQKIyBDT05GSUdfRUVQUk9NX0FUMjUgaXMg
bm90IHNldAojIENPTkZJR19FRVBST01fTEVHQUNZIGlzIG5vdCBzZXQKIyBDT05GSUdfRUVQ
Uk9NX01BWDY4NzUgaXMgbm90IHNldAojIENPTkZJR19FRVBST01fOTNDWDYgaXMgbm90IHNl
dAojIENPTkZJR19FRVBST01fOTNYWDQ2IGlzIG5vdCBzZXQKIyBDT05GSUdfRUVQUk9NX0lE
VF84OUhQRVNYIGlzIG5vdCBzZXQKIyBDT05GSUdfRUVQUk9NX0VFMTAwNCBpcyBub3Qgc2V0
CiMgZW5kIG9mIEVFUFJPTSBzdXBwb3J0CgojIENPTkZJR19DQjcxMF9DT1JFIGlzIG5vdCBz
ZXQKCiMKIyBUZXhhcyBJbnN0cnVtZW50cyBzaGFyZWQgdHJhbnNwb3J0IGxpbmUgZGlzY2lw
bGluZQojCiMgQ09ORklHX1RJX1NUIGlzIG5vdCBzZXQKIyBlbmQgb2YgVGV4YXMgSW5zdHJ1
bWVudHMgc2hhcmVkIHRyYW5zcG9ydCBsaW5lIGRpc2NpcGxpbmUKCiMgQ09ORklHX1NFTlNP
UlNfTElTM19JMkMgaXMgbm90IHNldAojIENPTkZJR19BTFRFUkFfU1RBUEwgaXMgbm90IHNl
dAojIENPTkZJR19JTlRFTF9NRUkgaXMgbm90IHNldAojIENPTkZJR19JTlRFTF9NRUlfTUUg
aXMgbm90IHNldAojIENPTkZJR19JTlRFTF9NRUlfVFhFIGlzIG5vdCBzZXQKIyBDT05GSUdf
Vk1XQVJFX1ZNQ0kgaXMgbm90IHNldAojIENPTkZJR19HRU5XUUUgaXMgbm90IHNldAojIENP
TkZJR19FQ0hPIGlzIG5vdCBzZXQKIyBDT05GSUdfQkNNX1ZLIGlzIG5vdCBzZXQKIyBDT05G
SUdfTUlTQ19BTENPUl9QQ0kgaXMgbm90IHNldAojIENPTkZJR19NSVNDX1JUU1hfUENJIGlz
IG5vdCBzZXQKIyBDT05GSUdfTUlTQ19SVFNYX1VTQiBpcyBub3Qgc2V0CiMgQ09ORklHX1VB
Q0NFIGlzIG5vdCBzZXQKQ09ORklHX1BWUEFOSUM9eQojIENPTkZJR19QVlBBTklDX01NSU8g
aXMgbm90IHNldAojIENPTkZJR19QVlBBTklDX1BDSSBpcyBub3Qgc2V0CiMgQ09ORklHX0dQ
X1BDSTFYWFhYIGlzIG5vdCBzZXQKIyBlbmQgb2YgTWlzYyBkZXZpY2VzCgojCiMgU0NTSSBk
ZXZpY2Ugc3VwcG9ydAojCkNPTkZJR19TQ1NJX01PRD1tCiMgQ09ORklHX1JBSURfQVRUUlMg
aXMgbm90IHNldApDT05GSUdfU0NTSV9DT01NT049bQpDT05GSUdfU0NTST1tCkNPTkZJR19T
Q1NJX0RNQT15CkNPTkZJR19TQ1NJX1BST0NfRlM9eQoKIwojIFNDU0kgc3VwcG9ydCB0eXBl
IChkaXNrLCB0YXBlLCBDRC1ST00pCiMKQ09ORklHX0JMS19ERVZfU0Q9bQojIENPTkZJR19D
SFJfREVWX1NUIGlzIG5vdCBzZXQKQ09ORklHX0JMS19ERVZfU1I9bQpDT05GSUdfQ0hSX0RF
Vl9TRz1tCkNPTkZJR19CTEtfREVWX0JTRz15CiMgQ09ORklHX0NIUl9ERVZfU0NIIGlzIG5v
dCBzZXQKQ09ORklHX1NDU0lfQ09OU1RBTlRTPXkKQ09ORklHX1NDU0lfTE9HR0lORz15CkNP
TkZJR19TQ1NJX1NDQU5fQVNZTkM9eQoKIwojIFNDU0kgVHJhbnNwb3J0cwojCiMgQ09ORklH
X1NDU0lfU1BJX0FUVFJTIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9GQ19BVFRSUyBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NDU0lfSVNDU0lfQVRUUlMgaXMgbm90IHNldAojIENPTkZJR19T
Q1NJX1NBU19BVFRSUyBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfU0FTX0xJQlNBUyBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NDU0lfU1JQX0FUVFJTIGlzIG5vdCBzZXQKIyBlbmQgb2YgU0NT
SSBUcmFuc3BvcnRzCgpDT05GSUdfU0NTSV9MT1dMRVZFTD15CiMgQ09ORklHX0lTQ1NJX1RD
UCBpcyBub3Qgc2V0CiMgQ09ORklHX0lTQ1NJX0JPT1RfU1lTRlMgaXMgbm90IHNldAojIENP
TkZJR19TQ1NJX0NYR0IzX0lTQ1NJIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9DWEdCNF9J
U0NTSSBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfQk5YMl9JU0NTSSBpcyBub3Qgc2V0CiMg
Q09ORklHX0JFMklTQ1NJIGlzIG5vdCBzZXQKIyBDT05GSUdfQkxLX0RFVl8zV19YWFhYX1JB
SUQgaXMgbm90IHNldAojIENPTkZJR19TQ1NJX0hQU0EgaXMgbm90IHNldAojIENPTkZJR19T
Q1NJXzNXXzlYWFggaXMgbm90IHNldAojIENPTkZJR19TQ1NJXzNXX1NBUyBpcyBub3Qgc2V0
CiMgQ09ORklHX1NDU0lfQUNBUkQgaXMgbm90IHNldAojIENPTkZJR19TQ1NJX0FBQ1JBSUQg
aXMgbm90IHNldAojIENPTkZJR19TQ1NJX0FJQzdYWFggaXMgbm90IHNldAojIENPTkZJR19T
Q1NJX0FJQzc5WFggaXMgbm90IHNldAojIENPTkZJR19TQ1NJX0FJQzk0WFggaXMgbm90IHNl
dAojIENPTkZJR19TQ1NJX01WU0FTIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9NVlVNSSBp
cyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfQURWQU5TWVMgaXMgbm90IHNldAojIENPTkZJR19T
Q1NJX0FSQ01TUiBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfRVNBUzJSIGlzIG5vdCBzZXQK
Q09ORklHX01FR0FSQUlEX05FV0dFTj15CiMgQ09ORklHX01FR0FSQUlEX01NIGlzIG5vdCBz
ZXQKIyBDT05GSUdfTUVHQVJBSURfTEVHQUNZIGlzIG5vdCBzZXQKIyBDT05GSUdfTUVHQVJB
SURfU0FTIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9NUFQzU0FTIGlzIG5vdCBzZXQKIyBD
T05GSUdfU0NTSV9NUFQyU0FTIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9NUEkzTVIgaXMg
bm90IHNldAojIENPTkZJR19TQ1NJX1NNQVJUUFFJIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NT
SV9IUFRJT1AgaXMgbm90IHNldAojIENPTkZJR19TQ1NJX0JVU0xPR0lDIGlzIG5vdCBzZXQK
IyBDT05GSUdfU0NTSV9NWVJCIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9NWVJTIGlzIG5v
dCBzZXQKIyBDT05GSUdfVk1XQVJFX1BWU0NTSSBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lf
U05JQyBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfRE1YMzE5MUQgaXMgbm90IHNldAojIENP
TkZJR19TQ1NJX0ZET01BSU5fUENJIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9JU0NJIGlz
IG5vdCBzZXQKIyBDT05GSUdfU0NTSV9JUFMgaXMgbm90IHNldAojIENPTkZJR19TQ1NJX0lO
SVRJTyBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfSU5JQTEwMCBpcyBub3Qgc2V0CiMgQ09O
RklHX1NDU0lfU1RFWCBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfU1lNNTNDOFhYXzIgaXMg
bm90IHNldAojIENPTkZJR19TQ1NJX0lQUiBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfUUxP
R0lDXzEyODAgaXMgbm90IHNldAojIENPTkZJR19TQ1NJX1FMQV9JU0NTSSBpcyBub3Qgc2V0
CiMgQ09ORklHX1NDU0lfREMzOTV4IGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9BTTUzQzk3
NCBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfV0Q3MTlYIGlzIG5vdCBzZXQKIyBDT05GSUdf
U0NTSV9ERUJVRyBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfUE1DUkFJRCBpcyBub3Qgc2V0
CiMgQ09ORklHX1NDU0lfUE04MDAxIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9WSVJUSU8g
aXMgbm90IHNldAojIENPTkZJR19TQ1NJX0xPV0xFVkVMX1BDTUNJQSBpcyBub3Qgc2V0CkNP
TkZJR19TQ1NJX0RIPXkKIyBDT05GSUdfU0NTSV9ESF9SREFDIGlzIG5vdCBzZXQKIyBDT05G
SUdfU0NTSV9ESF9IUF9TVyBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfREhfRU1DIGlzIG5v
dCBzZXQKIyBDT05GSUdfU0NTSV9ESF9BTFVBIGlzIG5vdCBzZXQKIyBlbmQgb2YgU0NTSSBk
ZXZpY2Ugc3VwcG9ydAoKIyBDT05GSUdfQVRBIGlzIG5vdCBzZXQKQ09ORklHX01EPXkKIyBD
T05GSUdfQkxLX0RFVl9NRCBpcyBub3Qgc2V0CiMgQ09ORklHX0JDQUNIRSBpcyBub3Qgc2V0
CkNPTkZJR19CTEtfREVWX0RNX0JVSUxUSU49eQpDT05GSUdfQkxLX0RFVl9ETT15CiMgQ09O
RklHX0RNX0RFQlVHIGlzIG5vdCBzZXQKQ09ORklHX0RNX0JVRklPPXkKQ09ORklHX0RNX0RF
QlVHX0JMT0NLX01BTkFHRVJfTE9DS0lORz15CiMgQ09ORklHX0RNX0RFQlVHX0JMT0NLX1NU
QUNLX1RSQUNJTkcgaXMgbm90IHNldApDT05GSUdfRE1fQklPX1BSSVNPTj1tCkNPTkZJR19E
TV9QRVJTSVNURU5UX0RBVEE9bQojIENPTkZJR19ETV9VTlNUUklQRUQgaXMgbm90IHNldApD
T05GSUdfRE1fQ1JZUFQ9bQpDT05GSUdfRE1fU05BUFNIT1Q9eQpDT05GSUdfRE1fVEhJTl9Q
Uk9WSVNJT05JTkc9bQojIENPTkZJR19ETV9DQUNIRSBpcyBub3Qgc2V0CiMgQ09ORklHX0RN
X1dSSVRFQ0FDSEUgaXMgbm90IHNldAojIENPTkZJR19ETV9FQlMgaXMgbm90IHNldAojIENP
TkZJR19ETV9FUkEgaXMgbm90IHNldAojIENPTkZJR19ETV9DTE9ORSBpcyBub3Qgc2V0CiMg
Q09ORklHX0RNX01JUlJPUiBpcyBub3Qgc2V0CiMgQ09ORklHX0RNX1JBSUQgaXMgbm90IHNl
dAojIENPTkZJR19ETV9aRVJPIGlzIG5vdCBzZXQKQ09ORklHX0RNX01VTFRJUEFUSD1tCiMg
Q09ORklHX0RNX01VTFRJUEFUSF9RTCBpcyBub3Qgc2V0CiMgQ09ORklHX0RNX01VTFRJUEFU
SF9TVCBpcyBub3Qgc2V0CiMgQ09ORklHX0RNX01VTFRJUEFUSF9IU1QgaXMgbm90IHNldAoj
IENPTkZJR19ETV9NVUxUSVBBVEhfSU9BIGlzIG5vdCBzZXQKIyBDT05GSUdfRE1fREVMQVkg
aXMgbm90IHNldAojIENPTkZJR19ETV9EVVNUIGlzIG5vdCBzZXQKQ09ORklHX0RNX0lOSVQ9
eQpDT05GSUdfRE1fVUVWRU5UPXkKIyBDT05GSUdfRE1fRkxBS0VZIGlzIG5vdCBzZXQKIyBD
T05GSUdfRE1fVkVSSVRZIGlzIG5vdCBzZXQKIyBDT05GSUdfRE1fU1dJVENIIGlzIG5vdCBz
ZXQKIyBDT05GSUdfRE1fTE9HX1dSSVRFUyBpcyBub3Qgc2V0CiMgQ09ORklHX0RNX0lOVEVH
UklUWSBpcyBub3Qgc2V0CiMgQ09ORklHX0RNX0FVRElUIGlzIG5vdCBzZXQKIyBDT05GSUdf
VEFSR0VUX0NPUkUgaXMgbm90IHNldAojIENPTkZJR19GVVNJT04gaXMgbm90IHNldAoKIwoj
IElFRUUgMTM5NCAoRmlyZVdpcmUpIHN1cHBvcnQKIwojIENPTkZJR19GSVJFV0lSRSBpcyBu
b3Qgc2V0CiMgQ09ORklHX0ZJUkVXSVJFX05PU1kgaXMgbm90IHNldAojIGVuZCBvZiBJRUVF
IDEzOTQgKEZpcmVXaXJlKSBzdXBwb3J0CgojIENPTkZJR19NQUNJTlRPU0hfRFJJVkVSUyBp
cyBub3Qgc2V0CkNPTkZJR19ORVRERVZJQ0VTPXkKQ09ORklHX01JST1tCkNPTkZJR19ORVRf
Q09SRT15CiMgQ09ORklHX0JPTkRJTkcgaXMgbm90IHNldApDT05GSUdfRFVNTVk9bQojIENP
TkZJR19XSVJFR1VBUkQgaXMgbm90IHNldAojIENPTkZJR19FUVVBTElaRVIgaXMgbm90IHNl
dAojIENPTkZJR19ORVRfRkMgaXMgbm90IHNldAojIENPTkZJR19ORVRfVEVBTSBpcyBub3Qg
c2V0CkNPTkZJR19NQUNWTEFOPW0KIyBDT05GSUdfTUFDVlRBUCBpcyBub3Qgc2V0CkNPTkZJ
R19JUFZMQU5fTDNTPXkKQ09ORklHX0lQVkxBTj1tCiMgQ09ORklHX0lQVlRBUCBpcyBub3Qg
c2V0CkNPTkZJR19WWExBTj1tCiMgQ09ORklHX0dFTkVWRSBpcyBub3Qgc2V0CiMgQ09ORklH
X0JBUkVVRFAgaXMgbm90IHNldAojIENPTkZJR19HVFAgaXMgbm90IHNldAojIENPTkZJR19B
TVQgaXMgbm90IHNldAojIENPTkZJR19NQUNTRUMgaXMgbm90IHNldAojIENPTkZJR19ORVRD
T05TT0xFIGlzIG5vdCBzZXQKQ09ORklHX1RVTj1tCiMgQ09ORklHX1RVTl9WTkVUX0NST1NT
X0xFIGlzIG5vdCBzZXQKQ09ORklHX1ZFVEg9bQpDT05GSUdfVklSVElPX05FVD1tCiMgQ09O
RklHX05MTU9OIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZSRiBpcyBub3Qgc2V0CiMgQ09O
RklHX01ISV9ORVQgaXMgbm90IHNldAojIENPTkZJR19BUkNORVQgaXMgbm90IHNldApDT05G
SUdfRVRIRVJORVQ9eQojIENPTkZJR19ORVRfVkVORE9SXzNDT00gaXMgbm90IHNldAojIENP
TkZJR19ORVRfVkVORE9SX0FEQVBURUMgaXMgbm90IHNldAojIENPTkZJR19ORVRfVkVORE9S
X0FHRVJFIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZFTkRPUl9BTEFDUklURUNIIGlzIG5v
dCBzZXQKIyBDT05GSUdfTkVUX1ZFTkRPUl9BTFRFT04gaXMgbm90IHNldAojIENPTkZJR19B
TFRFUkFfVFNFIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZFTkRPUl9BTUFaT04gaXMgbm90
IHNldAojIENPTkZJR19ORVRfVkVORE9SX0FNRCBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9W
RU5ET1JfQVFVQU5USUEgaXMgbm90IHNldAojIENPTkZJR19ORVRfVkVORE9SX0FSQyBpcyBu
b3Qgc2V0CiMgQ09ORklHX05FVF9WRU5ET1JfQVNJWCBpcyBub3Qgc2V0CiMgQ09ORklHX05F
VF9WRU5ET1JfQVRIRVJPUyBpcyBub3Qgc2V0CiMgQ09ORklHX0NYX0VDQVQgaXMgbm90IHNl
dAojIENPTkZJR19ORVRfVkVORE9SX0JST0FEQ09NIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVU
X1ZFTkRPUl9DQURFTkNFIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZFTkRPUl9DQVZJVU0g
aXMgbm90IHNldAojIENPTkZJR19ORVRfVkVORE9SX0NIRUxTSU8gaXMgbm90IHNldAojIENP
TkZJR19ORVRfVkVORE9SX0NJU0NPIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZFTkRPUl9D
T1JUSU5BIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZFTkRPUl9EQVZJQ09NIGlzIG5vdCBz
ZXQKIyBDT05GSUdfRE5FVCBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9WRU5ET1JfREVDIGlz
IG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZFTkRPUl9ETElOSyBpcyBub3Qgc2V0CiMgQ09ORklH
X05FVF9WRU5ET1JfRU1VTEVYIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZFTkRPUl9FTkdM
RURFUiBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9WRU5ET1JfRVpDSElQIGlzIG5vdCBzZXQK
IyBDT05GSUdfTkVUX1ZFTkRPUl9GVUpJVFNVIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZF
TkRPUl9GVU5HSUJMRSBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9WRU5ET1JfR09PR0xFIGlz
IG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZFTkRPUl9IVUFXRUkgaXMgbm90IHNldAojIENPTkZJ
R19ORVRfVkVORE9SX0lOVEVMIGlzIG5vdCBzZXQKIyBDT05GSUdfSk1FIGlzIG5vdCBzZXQK
IyBDT05GSUdfTkVUX1ZFTkRPUl9BREkgaXMgbm90IHNldAojIENPTkZJR19ORVRfVkVORE9S
X0xJVEVYIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZFTkRPUl9NQVJWRUxMIGlzIG5vdCBz
ZXQKIyBDT05GSUdfTkVUX1ZFTkRPUl9NRUxMQU5PWCBpcyBub3Qgc2V0CiMgQ09ORklHX05F
VF9WRU5ET1JfTUlDUkVMIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZFTkRPUl9NSUNST0NI
SVAgaXMgbm90IHNldAojIENPTkZJR19ORVRfVkVORE9SX01JQ1JPU0VNSSBpcyBub3Qgc2V0
CiMgQ09ORklHX05FVF9WRU5ET1JfTUlDUk9TT0ZUIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVU
X1ZFTkRPUl9NWVJJIGlzIG5vdCBzZXQKIyBDT05GSUdfRkVBTE5YIGlzIG5vdCBzZXQKIyBD
T05GSUdfTkVUX1ZFTkRPUl9OSSBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9WRU5ET1JfTkFU
U0VNSSBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9WRU5ET1JfTkVURVJJT04gaXMgbm90IHNl
dAojIENPTkZJR19ORVRfVkVORE9SX05FVFJPTk9NRSBpcyBub3Qgc2V0CiMgQ09ORklHX05F
VF9WRU5ET1JfTlZJRElBIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZFTkRPUl9PS0kgaXMg
bm90IHNldAojIENPTkZJR19FVEhPQyBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9WRU5ET1Jf
UEFDS0VUX0VOR0lORVMgaXMgbm90IHNldAojIENPTkZJR19ORVRfVkVORE9SX1BFTlNBTkRP
IGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZFTkRPUl9RTE9HSUMgaXMgbm90IHNldAojIENP
TkZJR19ORVRfVkVORE9SX0JST0NBREUgaXMgbm90IHNldAojIENPTkZJR19ORVRfVkVORE9S
X1FVQUxDT01NIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZFTkRPUl9SREMgaXMgbm90IHNl
dApDT05GSUdfTkVUX1ZFTkRPUl9SRUFMVEVLPXkKIyBDT05GSUdfODEzOUNQIGlzIG5vdCBz
ZXQKIyBDT05GSUdfODEzOVRPTyBpcyBub3Qgc2V0CkNPTkZJR19SODE2OT1tCiMgQ09ORklH
X05FVF9WRU5ET1JfUkVORVNBUyBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9WRU5ET1JfUk9D
S0VSIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZFTkRPUl9TQU1TVU5HIGlzIG5vdCBzZXQK
IyBDT05GSUdfTkVUX1ZFTkRPUl9TRUVRIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZFTkRP
Ul9TSUxBTiBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9WRU5ET1JfU0lTIGlzIG5vdCBzZXQK
IyBDT05GSUdfTkVUX1ZFTkRPUl9TT0xBUkZMQVJFIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVU
X1ZFTkRPUl9TTVNDIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZFTkRPUl9TT0NJT05FWFQg
aXMgbm90IHNldAojIENPTkZJR19ORVRfVkVORE9SX1NUTUlDUk8gaXMgbm90IHNldAojIENP
TkZJR19ORVRfVkVORE9SX1NVTiBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9WRU5ET1JfU1lO
T1BTWVMgaXMgbm90IHNldAojIENPTkZJR19ORVRfVkVORE9SX1RFSFVUSSBpcyBub3Qgc2V0
CiMgQ09ORklHX05FVF9WRU5ET1JfVEkgaXMgbm90IHNldAojIENPTkZJR19ORVRfVkVORE9S
X1ZFUlRFWENPTSBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9WRU5ET1JfVklBIGlzIG5vdCBz
ZXQKIyBDT05GSUdfTkVUX1ZFTkRPUl9XQU5HWFVOIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVU
X1ZFTkRPUl9XSVpORVQgaXMgbm90IHNldAojIENPTkZJR19ORVRfVkVORE9SX1hJTElOWCBp
cyBub3Qgc2V0CiMgQ09ORklHX05FVF9WRU5ET1JfWElSQ09NIGlzIG5vdCBzZXQKIyBDT05G
SUdfRkRESSBpcyBub3Qgc2V0CiMgQ09ORklHX0hJUFBJIGlzIG5vdCBzZXQKIyBDT05GSUdf
TkVUX1NCMTAwMCBpcyBub3Qgc2V0CkNPTkZJR19QSFlMSUI9eQpDT05GSUdfU1dQSFk9eQpD
T05GSUdfTEVEX1RSSUdHRVJfUEhZPXkKQ09ORklHX0ZJWEVEX1BIWT15CgojCiMgTUlJIFBI
WSBkZXZpY2UgZHJpdmVycwojCiMgQ09ORklHX0FNRF9QSFkgaXMgbm90IHNldAojIENPTkZJ
R19BRElOX1BIWSBpcyBub3Qgc2V0CiMgQ09ORklHX0FESU4xMTAwX1BIWSBpcyBub3Qgc2V0
CiMgQ09ORklHX0FRVUFOVElBX1BIWSBpcyBub3Qgc2V0CiMgQ09ORklHX0FYODg3OTZCX1BI
WSBpcyBub3Qgc2V0CiMgQ09ORklHX0JST0FEQ09NX1BIWSBpcyBub3Qgc2V0CiMgQ09ORklH
X0JDTTU0MTQwX1BIWSBpcyBub3Qgc2V0CiMgQ09ORklHX0JDTTdYWFhfUEhZIGlzIG5vdCBz
ZXQKIyBDT05GSUdfQkNNODQ4ODFfUEhZIGlzIG5vdCBzZXQKIyBDT05GSUdfQkNNODdYWF9Q
SFkgaXMgbm90IHNldAojIENPTkZJR19DSUNBREFfUEhZIGlzIG5vdCBzZXQKIyBDT05GSUdf
Q09SVElOQV9QSFkgaXMgbm90IHNldAojIENPTkZJR19EQVZJQ09NX1BIWSBpcyBub3Qgc2V0
CiMgQ09ORklHX0lDUExVU19QSFkgaXMgbm90IHNldAojIENPTkZJR19MWFRfUEhZIGlzIG5v
dCBzZXQKIyBDT05GSUdfSU5URUxfWFdBWV9QSFkgaXMgbm90IHNldAojIENPTkZJR19MU0lf
RVQxMDExQ19QSFkgaXMgbm90IHNldAojIENPTkZJR19NQVJWRUxMX1BIWSBpcyBub3Qgc2V0
CiMgQ09ORklHX01BUlZFTExfMTBHX1BIWSBpcyBub3Qgc2V0CiMgQ09ORklHX01BUlZFTExf
ODhYMjIyMl9QSFkgaXMgbm90IHNldAojIENPTkZJR19NQVhMSU5FQVJfR1BIWSBpcyBub3Qg
c2V0CiMgQ09ORklHX01FRElBVEVLX0dFX1BIWSBpcyBub3Qgc2V0CiMgQ09ORklHX01JQ1JF
TF9QSFkgaXMgbm90IHNldAojIENPTkZJR19NSUNST0NISVBfVDFTX1BIWSBpcyBub3Qgc2V0
CiMgQ09ORklHX01JQ1JPQ0hJUF9QSFkgaXMgbm90IHNldAojIENPTkZJR19NSUNST0NISVBf
VDFfUEhZIGlzIG5vdCBzZXQKIyBDT05GSUdfTUlDUk9TRU1JX1BIWSBpcyBub3Qgc2V0CiMg
Q09ORklHX01PVE9SQ09NTV9QSFkgaXMgbm90IHNldAojIENPTkZJR19OQVRJT05BTF9QSFkg
aXMgbm90IHNldAojIENPTkZJR19OWFBfQ0JUWF9QSFkgaXMgbm90IHNldAojIENPTkZJR19O
WFBfQzQ1X1RKQTExWFhfUEhZIGlzIG5vdCBzZXQKIyBDT05GSUdfTlhQX1RKQTExWFhfUEhZ
IGlzIG5vdCBzZXQKIyBDT05GSUdfTkNOMjYwMDBfUEhZIGlzIG5vdCBzZXQKIyBDT05GSUdf
QVQ4MDNYX1BIWSBpcyBub3Qgc2V0CiMgQ09ORklHX1FTRU1JX1BIWSBpcyBub3Qgc2V0CkNP
TkZJR19SRUFMVEVLX1BIWT15CiMgQ09ORklHX1JFTkVTQVNfUEhZIGlzIG5vdCBzZXQKIyBD
T05GSUdfUk9DS0NISVBfUEhZIGlzIG5vdCBzZXQKIyBDT05GSUdfU01TQ19QSFkgaXMgbm90
IHNldAojIENPTkZJR19TVEUxMFhQIGlzIG5vdCBzZXQKIyBDT05GSUdfVEVSQU5FVElDU19Q
SFkgaXMgbm90IHNldAojIENPTkZJR19EUDgzODIyX1BIWSBpcyBub3Qgc2V0CiMgQ09ORklH
X0RQODNUQzgxMV9QSFkgaXMgbm90IHNldAojIENPTkZJR19EUDgzODQ4X1BIWSBpcyBub3Qg
c2V0CiMgQ09ORklHX0RQODM4NjdfUEhZIGlzIG5vdCBzZXQKIyBDT05GSUdfRFA4Mzg2OV9Q
SFkgaXMgbm90IHNldAojIENPTkZJR19EUDgzVEQ1MTBfUEhZIGlzIG5vdCBzZXQKIyBDT05G
SUdfVklURVNTRV9QSFkgaXMgbm90IHNldAojIENPTkZJR19YSUxJTlhfR01JSTJSR01JSSBp
cyBub3Qgc2V0CiMgQ09ORklHX01JQ1JFTF9LUzg5OTVNQSBpcyBub3Qgc2V0CiMgQ09ORklH
X1BTRV9DT05UUk9MTEVSIGlzIG5vdCBzZXQKQ09ORklHX01ESU9fREVWSUNFPXkKQ09ORklH
X01ESU9fQlVTPXkKQ09ORklHX0ZXTk9ERV9NRElPPXkKQ09ORklHX0FDUElfTURJTz15CkNP
TkZJR19NRElPX0RFVlJFUz15CiMgQ09ORklHX01ESU9fQklUQkFORyBpcyBub3Qgc2V0CiMg
Q09ORklHX01ESU9fQkNNX1VOSU1BQyBpcyBub3Qgc2V0CiMgQ09ORklHX01ESU9fTVZVU0Ig
aXMgbm90IHNldAojIENPTkZJR19NRElPX01TQ0NfTUlJTSBpcyBub3Qgc2V0CiMgQ09ORklH
X01ESU9fVEhVTkRFUiBpcyBub3Qgc2V0CgojCiMgTURJTyBNdWx0aXBsZXhlcnMKIwoKIwoj
IFBDUyBkZXZpY2UgZHJpdmVycwojCiMgZW5kIG9mIFBDUyBkZXZpY2UgZHJpdmVycwoKIyBD
T05GSUdfUFBQIGlzIG5vdCBzZXQKIyBDT05GSUdfU0xJUCBpcyBub3Qgc2V0CkNPTkZJR19V
U0JfTkVUX0RSSVZFUlM9eQojIENPTkZJR19VU0JfQ0FUQyBpcyBub3Qgc2V0CiMgQ09ORklH
X1VTQl9LQVdFVEggaXMgbm90IHNldAojIENPTkZJR19VU0JfUEVHQVNVUyBpcyBub3Qgc2V0
CiMgQ09ORklHX1VTQl9SVEw4MTUwIGlzIG5vdCBzZXQKQ09ORklHX1VTQl9SVEw4MTUyPW0K
IyBDT05GSUdfVVNCX0xBTjc4WFggaXMgbm90IHNldApDT05GSUdfVVNCX1VTQk5FVD1tCiMg
Q09ORklHX1VTQl9ORVRfQVg4ODE3WCBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9ORVRfQVg4
ODE3OV8xNzhBIGlzIG5vdCBzZXQKQ09ORklHX1VTQl9ORVRfQ0RDRVRIRVI9bQojIENPTkZJ
R19VU0JfTkVUX0NEQ19FRU0gaXMgbm90IHNldAojIENPTkZJR19VU0JfTkVUX0NEQ19OQ00g
aXMgbm90IHNldAojIENPTkZJR19VU0JfTkVUX0hVQVdFSV9DRENfTkNNIGlzIG5vdCBzZXQK
IyBDT05GSUdfVVNCX05FVF9DRENfTUJJTSBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9ORVRf
RE05NjAxIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX05FVF9TUjk3MDAgaXMgbm90IHNldAoj
IENPTkZJR19VU0JfTkVUX1NSOTgwMCBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9ORVRfU01T
Qzc1WFggaXMgbm90IHNldAojIENPTkZJR19VU0JfTkVUX1NNU0M5NVhYIGlzIG5vdCBzZXQK
IyBDT05GSUdfVVNCX05FVF9HTDYyMEEgaXMgbm90IHNldAojIENPTkZJR19VU0JfTkVUX05F
VDEwODAgaXMgbm90IHNldAojIENPTkZJR19VU0JfTkVUX1BMVVNCIGlzIG5vdCBzZXQKIyBD
T05GSUdfVVNCX05FVF9NQ1M3ODMwIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX05FVF9STkRJ
U19IT1NUIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX05FVF9DRENfU1VCU0VUIGlzIG5vdCBz
ZXQKIyBDT05GSUdfVVNCX05FVF9aQVVSVVMgaXMgbm90IHNldAojIENPTkZJR19VU0JfTkVU
X0NYODIzMTBfRVRIIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX05FVF9LQUxNSUEgaXMgbm90
IHNldAojIENPTkZJR19VU0JfTkVUX1FNSV9XV0FOIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNC
X0hTTyBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9ORVRfSU5UNTFYMSBpcyBub3Qgc2V0CiMg
Q09ORklHX1VTQl9JUEhFVEggaXMgbm90IHNldAojIENPTkZJR19VU0JfU0lFUlJBX05FVCBp
cyBub3Qgc2V0CiMgQ09ORklHX1VTQl9WTDYwMCBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9O
RVRfQ0g5MjAwIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX05FVF9BUUMxMTEgaXMgbm90IHNl
dApDT05GSUdfVVNCX1JUTDgxNTNfRUNNPW0KQ09ORklHX1dMQU49eQojIENPTkZJR19XTEFO
X1ZFTkRPUl9BRE1URUsgaXMgbm90IHNldApDT05GSUdfQVRIX0NPTU1PTj1tCkNPTkZJR19X
TEFOX1ZFTkRPUl9BVEg9eQojIENPTkZJR19BVEhfREVCVUcgaXMgbm90IHNldAojIENPTkZJ
R19BVEg1SyBpcyBub3Qgc2V0CkNPTkZJR19BVEg1S19QQ0k9eQojIENPTkZJR19BVEg5SyBp
cyBub3Qgc2V0CiMgQ09ORklHX0FUSDlLX0hUQyBpcyBub3Qgc2V0CiMgQ09ORklHX0NBUkw5
MTcwIGlzIG5vdCBzZXQKIyBDT05GSUdfQVRINktMIGlzIG5vdCBzZXQKIyBDT05GSUdfQVI1
NTIzIGlzIG5vdCBzZXQKIyBDT05GSUdfV0lMNjIxMCBpcyBub3Qgc2V0CiMgQ09ORklHX0FU
SDEwSyBpcyBub3Qgc2V0CiMgQ09ORklHX1dDTjM2WFggaXMgbm90IHNldApDT05GSUdfQVRI
MTFLPW0KQ09ORklHX0FUSDExS19QQ0k9bQojIENPTkZJR19BVEgxMUtfREVCVUcgaXMgbm90
IHNldAojIENPTkZJR19BVEgxMUtfREVCVUdGUyBpcyBub3Qgc2V0CiMgQ09ORklHX0FUSDEy
SyBpcyBub3Qgc2V0CiMgQ09ORklHX1dMQU5fVkVORE9SX0FUTUVMIGlzIG5vdCBzZXQKIyBD
T05GSUdfV0xBTl9WRU5ET1JfQlJPQURDT00gaXMgbm90IHNldAojIENPTkZJR19XTEFOX1ZF
TkRPUl9DSVNDTyBpcyBub3Qgc2V0CiMgQ09ORklHX1dMQU5fVkVORE9SX0lOVEVMIGlzIG5v
dCBzZXQKIyBDT05GSUdfV0xBTl9WRU5ET1JfSU5URVJTSUwgaXMgbm90IHNldAojIENPTkZJ
R19XTEFOX1ZFTkRPUl9NQVJWRUxMIGlzIG5vdCBzZXQKIyBDT05GSUdfV0xBTl9WRU5ET1Jf
TUVESUFURUsgaXMgbm90IHNldAojIENPTkZJR19XTEFOX1ZFTkRPUl9NSUNST0NISVAgaXMg
bm90IHNldAojIENPTkZJR19XTEFOX1ZFTkRPUl9QVVJFTElGSSBpcyBub3Qgc2V0CiMgQ09O
RklHX1dMQU5fVkVORE9SX1JBTElOSyBpcyBub3Qgc2V0CiMgQ09ORklHX1dMQU5fVkVORE9S
X1JFQUxURUsgaXMgbm90IHNldAojIENPTkZJR19XTEFOX1ZFTkRPUl9SU0kgaXMgbm90IHNl
dAojIENPTkZJR19XTEFOX1ZFTkRPUl9TSUxBQlMgaXMgbm90IHNldAojIENPTkZJR19XTEFO
X1ZFTkRPUl9TVCBpcyBub3Qgc2V0CiMgQ09ORklHX1dMQU5fVkVORE9SX1RJIGlzIG5vdCBz
ZXQKIyBDT05GSUdfV0xBTl9WRU5ET1JfWllEQVMgaXMgbm90IHNldAojIENPTkZJR19XTEFO
X1ZFTkRPUl9RVUFOVEVOTkEgaXMgbm90IHNldAojIENPTkZJR19QQ01DSUFfUkFZQ1MgaXMg
bm90IHNldAojIENPTkZJR19QQ01DSUFfV0wzNTAxIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNC
X05FVF9STkRJU19XTEFOIGlzIG5vdCBzZXQKIyBDT05GSUdfTUFDODAyMTFfSFdTSU0gaXMg
bm90IHNldAojIENPTkZJR19WSVJUX1dJRkkgaXMgbm90IHNldAojIENPTkZJR19XQU4gaXMg
bm90IHNldAoKIwojIFdpcmVsZXNzIFdBTgojCkNPTkZJR19XV0FOPXkKQ09ORklHX1dXQU5f
REVCVUdGUz15CiMgQ09ORklHX1dXQU5fSFdTSU0gaXMgbm90IHNldAojIENPTkZJR19NSElf
V1dBTl9DVFJMIGlzIG5vdCBzZXQKIyBDT05GSUdfTUhJX1dXQU5fTUJJTSBpcyBub3Qgc2V0
CiMgQ09ORklHX0lPU00gaXMgbm90IHNldAojIENPTkZJR19NVEtfVDdYWCBpcyBub3Qgc2V0
CiMgZW5kIG9mIFdpcmVsZXNzIFdBTgoKIyBDT05GSUdfVk1YTkVUMyBpcyBub3Qgc2V0CiMg
Q09ORklHX0ZVSklUU1VfRVMgaXMgbm90IHNldAojIENPTkZJR19ORVRERVZTSU0gaXMgbm90
IHNldApDT05GSUdfTkVUX0ZBSUxPVkVSPW0KIyBDT05GSUdfSVNETiBpcyBub3Qgc2V0Cgoj
CiMgSW5wdXQgZGV2aWNlIHN1cHBvcnQKIwpDT05GSUdfSU5QVVQ9eQpDT05GSUdfSU5QVVRf
TEVEUz15CkNPTkZJR19JTlBVVF9GRl9NRU1MRVNTPW0KIyBDT05GSUdfSU5QVVRfU1BBUlNF
S01BUCBpcyBub3Qgc2V0CiMgQ09ORklHX0lOUFVUX01BVFJJWEtNQVAgaXMgbm90IHNldApD
T05GSUdfSU5QVVRfVklWQUxESUZNQVA9eQoKIwojIFVzZXJsYW5kIGludGVyZmFjZXMKIwpD
T05GSUdfSU5QVVRfTU9VU0VERVY9eQojIENPTkZJR19JTlBVVF9NT1VTRURFVl9QU0FVWCBp
cyBub3Qgc2V0CkNPTkZJR19JTlBVVF9NT1VTRURFVl9TQ1JFRU5fWD0xMDI0CkNPTkZJR19J
TlBVVF9NT1VTRURFVl9TQ1JFRU5fWT03NjgKIyBDT05GSUdfSU5QVVRfSk9ZREVWIGlzIG5v
dCBzZXQKQ09ORklHX0lOUFVUX0VWREVWPXkKIyBDT05GSUdfSU5QVVRfRVZCVUcgaXMgbm90
IHNldAoKIwojIElucHV0IERldmljZSBEcml2ZXJzCiMKQ09ORklHX0lOUFVUX0tFWUJPQVJE
PXkKIyBDT05GSUdfS0VZQk9BUkRfQURQNTU4OCBpcyBub3Qgc2V0CiMgQ09ORklHX0tFWUJP
QVJEX0FEUDU1ODkgaXMgbm90IHNldAojIENPTkZJR19LRVlCT0FSRF9BUFBMRVNQSSBpcyBu
b3Qgc2V0CkNPTkZJR19LRVlCT0FSRF9BVEtCRD15CiMgQ09ORklHX0tFWUJPQVJEX1FUMTA1
MCBpcyBub3Qgc2V0CiMgQ09ORklHX0tFWUJPQVJEX1FUMTA3MCBpcyBub3Qgc2V0CiMgQ09O
RklHX0tFWUJPQVJEX1FUMjE2MCBpcyBub3Qgc2V0CiMgQ09ORklHX0tFWUJPQVJEX0RMSU5L
X0RJUjY4NSBpcyBub3Qgc2V0CiMgQ09ORklHX0tFWUJPQVJEX0xLS0JEIGlzIG5vdCBzZXQK
IyBDT05GSUdfS0VZQk9BUkRfR1BJTyBpcyBub3Qgc2V0CiMgQ09ORklHX0tFWUJPQVJEX0dQ
SU9fUE9MTEVEIGlzIG5vdCBzZXQKIyBDT05GSUdfS0VZQk9BUkRfVENBNjQxNiBpcyBub3Qg
c2V0CiMgQ09ORklHX0tFWUJPQVJEX1RDQTg0MTggaXMgbm90IHNldAojIENPTkZJR19LRVlC
T0FSRF9NQVRSSVggaXMgbm90IHNldAojIENPTkZJR19LRVlCT0FSRF9MTTgzMjMgaXMgbm90
IHNldAojIENPTkZJR19LRVlCT0FSRF9MTTgzMzMgaXMgbm90IHNldAojIENPTkZJR19LRVlC
T0FSRF9NQVg3MzU5IGlzIG5vdCBzZXQKIyBDT05GSUdfS0VZQk9BUkRfTUNTIGlzIG5vdCBz
ZXQKIyBDT05GSUdfS0VZQk9BUkRfTVBSMTIxIGlzIG5vdCBzZXQKIyBDT05GSUdfS0VZQk9B
UkRfTkVXVE9OIGlzIG5vdCBzZXQKIyBDT05GSUdfS0VZQk9BUkRfT1BFTkNPUkVTIGlzIG5v
dCBzZXQKIyBDT05GSUdfS0VZQk9BUkRfUElORVBIT05FIGlzIG5vdCBzZXQKIyBDT05GSUdf
S0VZQk9BUkRfU0FNU1VORyBpcyBub3Qgc2V0CiMgQ09ORklHX0tFWUJPQVJEX1NUT1dBV0FZ
IGlzIG5vdCBzZXQKIyBDT05GSUdfS0VZQk9BUkRfU1VOS0JEIGlzIG5vdCBzZXQKIyBDT05G
SUdfS0VZQk9BUkRfVE0yX1RPVUNIS0VZIGlzIG5vdCBzZXQKIyBDT05GSUdfS0VZQk9BUkRf
WFRLQkQgaXMgbm90IHNldAojIENPTkZJR19LRVlCT0FSRF9DWVBSRVNTX1NGIGlzIG5vdCBz
ZXQKQ09ORklHX0lOUFVUX01PVVNFPXkKQ09ORklHX01PVVNFX1BTMj15CkNPTkZJR19NT1VT
RV9QUzJfQUxQUz15CkNPTkZJR19NT1VTRV9QUzJfQllEPXkKQ09ORklHX01PVVNFX1BTMl9M
T0dJUFMyUFA9eQpDT05GSUdfTU9VU0VfUFMyX1NZTkFQVElDUz15CkNPTkZJR19NT1VTRV9Q
UzJfU1lOQVBUSUNTX1NNQlVTPXkKQ09ORklHX01PVVNFX1BTMl9DWVBSRVNTPXkKQ09ORklH
X01PVVNFX1BTMl9MSUZFQk9PSz15CkNPTkZJR19NT1VTRV9QUzJfVFJBQ0tQT0lOVD15CkNP
TkZJR19NT1VTRV9QUzJfRUxBTlRFQ0g9eQpDT05GSUdfTU9VU0VfUFMyX0VMQU5URUNIX1NN
QlVTPXkKQ09ORklHX01PVVNFX1BTMl9TRU5URUxJQz15CiMgQ09ORklHX01PVVNFX1BTMl9U
T1VDSEtJVCBpcyBub3Qgc2V0CkNPTkZJR19NT1VTRV9QUzJfRk9DQUxURUNIPXkKQ09ORklH
X01PVVNFX1BTMl9WTU1PVVNFPXkKQ09ORklHX01PVVNFX1BTMl9TTUJVUz15CiMgQ09ORklH
X01PVVNFX1NFUklBTCBpcyBub3Qgc2V0CiMgQ09ORklHX01PVVNFX0FQUExFVE9VQ0ggaXMg
bm90IHNldAojIENPTkZJR19NT1VTRV9CQ001OTc0IGlzIG5vdCBzZXQKIyBDT05GSUdfTU9V
U0VfQ1lBUEEgaXMgbm90IHNldAojIENPTkZJR19NT1VTRV9FTEFOX0kyQyBpcyBub3Qgc2V0
CiMgQ09ORklHX01PVVNFX1ZTWFhYQUEgaXMgbm90IHNldAojIENPTkZJR19NT1VTRV9HUElP
IGlzIG5vdCBzZXQKIyBDT05GSUdfTU9VU0VfU1lOQVBUSUNTX0kyQyBpcyBub3Qgc2V0CiMg
Q09ORklHX01PVVNFX1NZTkFQVElDU19VU0IgaXMgbm90IHNldAojIENPTkZJR19JTlBVVF9K
T1lTVElDSyBpcyBub3Qgc2V0CiMgQ09ORklHX0lOUFVUX1RBQkxFVCBpcyBub3Qgc2V0CiMg
Q09ORklHX0lOUFVUX1RPVUNIU0NSRUVOIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5QVVRfTUlT
QyBpcyBub3Qgc2V0CiMgQ09ORklHX1JNSTRfQ09SRSBpcyBub3Qgc2V0CgojCiMgSGFyZHdh
cmUgSS9PIHBvcnRzCiMKQ09ORklHX1NFUklPPXkKQ09ORklHX0FSQ0hfTUlHSFRfSEFWRV9Q
Q19TRVJJTz15CkNPTkZJR19TRVJJT19JODA0Mj15CiMgQ09ORklHX1NFUklPX1NFUlBPUlQg
aXMgbm90IHNldAojIENPTkZJR19TRVJJT19DVDgyQzcxMCBpcyBub3Qgc2V0CiMgQ09ORklH
X1NFUklPX1BDSVBTMiBpcyBub3Qgc2V0CkNPTkZJR19TRVJJT19MSUJQUzI9eQpDT05GSUdf
U0VSSU9fUkFXPW0KIyBDT05GSUdfU0VSSU9fQUxURVJBX1BTMiBpcyBub3Qgc2V0CiMgQ09O
RklHX1NFUklPX1BTMk1VTFQgaXMgbm90IHNldAojIENPTkZJR19TRVJJT19BUkNfUFMyIGlz
IG5vdCBzZXQKIyBDT05GSUdfU0VSSU9fR1BJT19QUzIgaXMgbm90IHNldAojIENPTkZJR19V
U0VSSU8gaXMgbm90IHNldAojIENPTkZJR19HQU1FUE9SVCBpcyBub3Qgc2V0CiMgZW5kIG9m
IEhhcmR3YXJlIEkvTyBwb3J0cwojIGVuZCBvZiBJbnB1dCBkZXZpY2Ugc3VwcG9ydAoKIwoj
IENoYXJhY3RlciBkZXZpY2VzCiMKQ09ORklHX1RUWT15CkNPTkZJR19WVD15CkNPTkZJR19D
T05TT0xFX1RSQU5TTEFUSU9OUz15CkNPTkZJR19WVF9DT05TT0xFPXkKQ09ORklHX1ZUX0NP
TlNPTEVfU0xFRVA9eQpDT05GSUdfSFdfQ09OU09MRT15CkNPTkZJR19WVF9IV19DT05TT0xF
X0JJTkRJTkc9eQpDT05GSUdfVU5JWDk4X1BUWVM9eQojIENPTkZJR19MRUdBQ1lfUFRZUyBp
cyBub3Qgc2V0CkNPTkZJR19MRUdBQ1lfVElPQ1NUST15CkNPTkZJR19MRElTQ19BVVRPTE9B
RD15CgojCiMgU2VyaWFsIGRyaXZlcnMKIwpDT05GSUdfU0VSSUFMX0VBUkxZQ09OPXkKQ09O
RklHX1NFUklBTF84MjUwPXkKIyBDT05GSUdfU0VSSUFMXzgyNTBfREVQUkVDQVRFRF9PUFRJ
T05TIGlzIG5vdCBzZXQKQ09ORklHX1NFUklBTF84MjUwX1BOUD15CiMgQ09ORklHX1NFUklB
TF84MjUwXzE2NTUwQV9WQVJJQU5UUyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFUklBTF84MjUw
X0ZJTlRFSyBpcyBub3Qgc2V0CkNPTkZJR19TRVJJQUxfODI1MF9DT05TT0xFPXkKQ09ORklH
X1NFUklBTF84MjUwX0RNQT15CkNPTkZJR19TRVJJQUxfODI1MF9QQ0lMSUI9eQpDT05GSUdf
U0VSSUFMXzgyNTBfUENJPXkKIyBDT05GSUdfU0VSSUFMXzgyNTBfRVhBUiBpcyBub3Qgc2V0
CiMgQ09ORklHX1NFUklBTF84MjUwX0NTIGlzIG5vdCBzZXQKQ09ORklHX1NFUklBTF84MjUw
X05SX1VBUlRTPTMyCkNPTkZJR19TRVJJQUxfODI1MF9SVU5USU1FX1VBUlRTPTMyCkNPTkZJ
R19TRVJJQUxfODI1MF9FWFRFTkRFRD15CkNPTkZJR19TRVJJQUxfODI1MF9NQU5ZX1BPUlRT
PXkKIyBDT05GSUdfU0VSSUFMXzgyNTBfUENJMVhYWFggaXMgbm90IHNldApDT05GSUdfU0VS
SUFMXzgyNTBfU0hBUkVfSVJRPXkKIyBDT05GSUdfU0VSSUFMXzgyNTBfREVURUNUX0lSUSBp
cyBub3Qgc2V0CkNPTkZJR19TRVJJQUxfODI1MF9SU0E9eQpDT05GSUdfU0VSSUFMXzgyNTBf
RFdMSUI9eQpDT05GSUdfU0VSSUFMXzgyNTBfRFc9eQpDT05GSUdfU0VSSUFMXzgyNTBfUlQy
ODhYPXkKQ09ORklHX1NFUklBTF84MjUwX0xQU1M9eQpDT05GSUdfU0VSSUFMXzgyNTBfTUlE
PXkKQ09ORklHX1NFUklBTF84MjUwX1BFUklDT009eQoKIwojIE5vbi04MjUwIHNlcmlhbCBw
b3J0IHN1cHBvcnQKIwojIENPTkZJR19TRVJJQUxfTUFYMzEwMCBpcyBub3Qgc2V0CiMgQ09O
RklHX1NFUklBTF9NQVgzMTBYIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VSSUFMX1VBUlRMSVRF
IGlzIG5vdCBzZXQKQ09ORklHX1NFUklBTF9DT1JFPXkKQ09ORklHX1NFUklBTF9DT1JFX0NP
TlNPTEU9eQojIENPTkZJR19TRVJJQUxfSlNNIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VSSUFM
X0xBTlRJUSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFUklBTF9TQ0NOWFAgaXMgbm90IHNldAoj
IENPTkZJR19TRVJJQUxfU0MxNklTN1hYIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VSSUFMX0FM
VEVSQV9KVEFHVUFSVCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFUklBTF9BTFRFUkFfVUFSVCBp
cyBub3Qgc2V0CiMgQ09ORklHX1NFUklBTF9BUkMgaXMgbm90IHNldAojIENPTkZJR19TRVJJ
QUxfUlAyIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VSSUFMX0ZTTF9MUFVBUlQgaXMgbm90IHNl
dAojIENPTkZJR19TRVJJQUxfRlNMX0xJTkZMRVhVQVJUIGlzIG5vdCBzZXQKIyBDT05GSUdf
U0VSSUFMX1NQUkQgaXMgbm90IHNldAojIGVuZCBvZiBTZXJpYWwgZHJpdmVycwoKQ09ORklH
X1NFUklBTF9NQ1RSTF9HUElPPXkKQ09ORklHX1NFUklBTF9OT05TVEFOREFSRD15CiMgQ09O
RklHX01PWEFfSU5URUxMSU8gaXMgbm90IHNldAojIENPTkZJR19NT1hBX1NNQVJUSU8gaXMg
bm90IHNldAojIENPTkZJR19TWU5DTElOS19HVCBpcyBub3Qgc2V0CiMgQ09ORklHX05fSERM
QyBpcyBub3Qgc2V0CiMgQ09ORklHX0lQV0lSRUxFU1MgaXMgbm90IHNldAojIENPTkZJR19O
X0dTTSBpcyBub3Qgc2V0CiMgQ09ORklHX05PWk9NSSBpcyBub3Qgc2V0CiMgQ09ORklHX05V
TExfVFRZIGlzIG5vdCBzZXQKQ09ORklHX1NFUklBTF9ERVZfQlVTPXkKQ09ORklHX1NFUklB
TF9ERVZfQ1RSTF9UVFlQT1JUPXkKIyBDT05GSUdfVFRZX1BSSU5USyBpcyBub3Qgc2V0CiMg
Q09ORklHX1ZJUlRJT19DT05TT0xFIGlzIG5vdCBzZXQKIyBDT05GSUdfSVBNSV9IQU5ETEVS
IGlzIG5vdCBzZXQKIyBDT05GSUdfU1NJRl9JUE1JX0JNQyBpcyBub3Qgc2V0CiMgQ09ORklH
X0lQTUJfREVWSUNFX0lOVEVSRkFDRSBpcyBub3Qgc2V0CkNPTkZJR19IV19SQU5ET009eQoj
IENPTkZJR19IV19SQU5ET01fVElNRVJJT01FTSBpcyBub3Qgc2V0CiMgQ09ORklHX0hXX1JB
TkRPTV9JTlRFTCBpcyBub3Qgc2V0CkNPTkZJR19IV19SQU5ET01fQU1EPW0KIyBDT05GSUdf
SFdfUkFORE9NX0JBNDMxIGlzIG5vdCBzZXQKIyBDT05GSUdfSFdfUkFORE9NX1ZJQSBpcyBu
b3Qgc2V0CkNPTkZJR19IV19SQU5ET01fVklSVElPPW0KIyBDT05GSUdfSFdfUkFORE9NX1hJ
UEhFUkEgaXMgbm90IHNldAojIENPTkZJR19BUFBMSUNPTSBpcyBub3Qgc2V0CiMgQ09ORklH
X01XQVZFIGlzIG5vdCBzZXQKQ09ORklHX0RFVk1FTT15CkNPTkZJR19OVlJBTT15CkNPTkZJ
R19ERVZQT1JUPXkKQ09ORklHX0hQRVQ9eQojIENPTkZJR19IUEVUX01NQVAgaXMgbm90IHNl
dAojIENPTkZJR19IQU5HQ0hFQ0tfVElNRVIgaXMgbm90IHNldApDT05GSUdfVENHX1RQTT15
CkNPTkZJR19IV19SQU5ET01fVFBNPXkKQ09ORklHX1RDR19USVNfQ09SRT15CkNPTkZJR19U
Q0dfVElTPXkKIyBDT05GSUdfVENHX1RJU19TUEkgaXMgbm90IHNldAojIENPTkZJR19UQ0df
VElTX0kyQyBpcyBub3Qgc2V0CiMgQ09ORklHX1RDR19USVNfSTJDX0NSNTAgaXMgbm90IHNl
dAojIENPTkZJR19UQ0dfVElTX0kyQ19BVE1FTCBpcyBub3Qgc2V0CiMgQ09ORklHX1RDR19U
SVNfSTJDX0lORklORU9OIGlzIG5vdCBzZXQKIyBDT05GSUdfVENHX1RJU19JMkNfTlVWT1RP
TiBpcyBub3Qgc2V0CiMgQ09ORklHX1RDR19OU0MgaXMgbm90IHNldAojIENPTkZJR19UQ0df
QVRNRUwgaXMgbm90IHNldAojIENPTkZJR19UQ0dfSU5GSU5FT04gaXMgbm90IHNldApDT05G
SUdfVENHX0NSQj15CiMgQ09ORklHX1RDR19WVFBNX1BST1hZIGlzIG5vdCBzZXQKIyBDT05G
SUdfVENHX1RJU19TVDMzWlAyNF9JMkMgaXMgbm90IHNldAojIENPTkZJR19UQ0dfVElTX1NU
MzNaUDI0X1NQSSBpcyBub3Qgc2V0CiMgQ09ORklHX1RFTENMT0NLIGlzIG5vdCBzZXQKIyBD
T05GSUdfWElMTFlCVVMgaXMgbm90IHNldAojIENPTkZJR19YSUxMWVVTQiBpcyBub3Qgc2V0
CiMgZW5kIG9mIENoYXJhY3RlciBkZXZpY2VzCgojCiMgSTJDIHN1cHBvcnQKIwpDT05GSUdf
STJDPXkKQ09ORklHX0FDUElfSTJDX09QUkVHSU9OPXkKQ09ORklHX0kyQ19CT0FSRElORk89
eQpDT05GSUdfSTJDX0NPTVBBVD15CiMgQ09ORklHX0kyQ19DSEFSREVWIGlzIG5vdCBzZXQK
Q09ORklHX0kyQ19NVVg9bQoKIwojIE11bHRpcGxleGVyIEkyQyBDaGlwIHN1cHBvcnQKIwoj
IENPTkZJR19JMkNfTVVYX0dQSU8gaXMgbm90IHNldAojIENPTkZJR19JMkNfTVVYX0xUQzQz
MDYgaXMgbm90IHNldAojIENPTkZJR19JMkNfTVVYX1BDQTk1NDEgaXMgbm90IHNldAojIENP
TkZJR19JMkNfTVVYX1BDQTk1NHggaXMgbm90IHNldAojIENPTkZJR19JMkNfTVVYX1JFRyBp
cyBub3Qgc2V0CiMgQ09ORklHX0kyQ19NVVhfTUxYQ1BMRCBpcyBub3Qgc2V0CiMgZW5kIG9m
IE11bHRpcGxleGVyIEkyQyBDaGlwIHN1cHBvcnQKCkNPTkZJR19JMkNfSEVMUEVSX0FVVE89
eQpDT05GSUdfSTJDX0FMR09CSVQ9bQoKIwojIEkyQyBIYXJkd2FyZSBCdXMgc3VwcG9ydAoj
CgojCiMgUEMgU01CdXMgaG9zdCBjb250cm9sbGVyIGRyaXZlcnMKIwpDT05GSUdfSTJDX0ND
R1hfVUNTST15CiMgQ09ORklHX0kyQ19BTEkxNTM1IGlzIG5vdCBzZXQKIyBDT05GSUdfSTJD
X0FMSTE1NjMgaXMgbm90IHNldAojIENPTkZJR19JMkNfQUxJMTVYMyBpcyBub3Qgc2V0CiMg
Q09ORklHX0kyQ19BTUQ3NTYgaXMgbm90IHNldAojIENPTkZJR19JMkNfQU1EODExMSBpcyBu
b3Qgc2V0CiMgQ09ORklHX0kyQ19BTURfTVAyIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX0k4
MDEgaXMgbm90IHNldAojIENPTkZJR19JMkNfSVNDSCBpcyBub3Qgc2V0CiMgQ09ORklHX0ky
Q19JU01UIGlzIG5vdCBzZXQKQ09ORklHX0kyQ19QSUlYND1tCiMgQ09ORklHX0kyQ19DSFRf
V0MgaXMgbm90IHNldAojIENPTkZJR19JMkNfTkZPUkNFMiBpcyBub3Qgc2V0CiMgQ09ORklH
X0kyQ19OVklESUFfR1BVIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX1NJUzU1OTUgaXMgbm90
IHNldAojIENPTkZJR19JMkNfU0lTNjMwIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX1NJUzk2
WCBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19WSUEgaXMgbm90IHNldAojIENPTkZJR19JMkNf
VklBUFJPIGlzIG5vdCBzZXQKCiMKIyBBQ1BJIGRyaXZlcnMKIwojIENPTkZJR19JMkNfU0NN
SSBpcyBub3Qgc2V0CgojCiMgSTJDIHN5c3RlbSBidXMgZHJpdmVycyAobW9zdGx5IGVtYmVk
ZGVkIC8gc3lzdGVtLW9uLWNoaXApCiMKIyBDT05GSUdfSTJDX0NCVVNfR1BJTyBpcyBub3Qg
c2V0CkNPTkZJR19JMkNfREVTSUdOV0FSRV9DT1JFPXkKQ09ORklHX0kyQ19ERVNJR05XQVJF
X1NMQVZFPXkKQ09ORklHX0kyQ19ERVNJR05XQVJFX1BMQVRGT1JNPXkKQ09ORklHX0kyQ19E
RVNJR05XQVJFX0JBWVRSQUlMPXkKQ09ORklHX0kyQ19ERVNJR05XQVJFX1BDST15CiMgQ09O
RklHX0kyQ19FTUVWMiBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19HUElPIGlzIG5vdCBzZXQK
IyBDT05GSUdfSTJDX09DT1JFUyBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19QQ0FfUExBVEZP
Uk0gaXMgbm90IHNldAojIENPTkZJR19JMkNfU0lNVEVDIGlzIG5vdCBzZXQKIyBDT05GSUdf
STJDX1hJTElOWCBpcyBub3Qgc2V0CgojCiMgRXh0ZXJuYWwgSTJDL1NNQnVzIGFkYXB0ZXIg
ZHJpdmVycwojCiMgQ09ORklHX0kyQ19ESU9MQU5fVTJDIGlzIG5vdCBzZXQKIyBDT05GSUdf
STJDX0NQMjYxNSBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19QQ0kxWFhYWCBpcyBub3Qgc2V0
CiMgQ09ORklHX0kyQ19ST0JPVEZVWlpfT1NJRiBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19U
QU9TX0VWTSBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19USU5ZX1VTQiBpcyBub3Qgc2V0Cgoj
CiMgT3RoZXIgSTJDL1NNQnVzIGJ1cyBkcml2ZXJzCiMKIyBDT05GSUdfSTJDX01MWENQTEQg
aXMgbm90IHNldAojIENPTkZJR19JMkNfVklSVElPIGlzIG5vdCBzZXQKIyBlbmQgb2YgSTJD
IEhhcmR3YXJlIEJ1cyBzdXBwb3J0CgojIENPTkZJR19JMkNfU1RVQiBpcyBub3Qgc2V0CkNP
TkZJR19JMkNfU0xBVkU9eQojIENPTkZJR19JMkNfU0xBVkVfRUVQUk9NIGlzIG5vdCBzZXQK
IyBDT05GSUdfSTJDX1NMQVZFX1RFU1RVTklUIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX0RF
QlVHX0NPUkUgaXMgbm90IHNldAojIENPTkZJR19JMkNfREVCVUdfQUxHTyBpcyBub3Qgc2V0
CiMgQ09ORklHX0kyQ19ERUJVR19CVVMgaXMgbm90IHNldAojIGVuZCBvZiBJMkMgc3VwcG9y
dAoKIyBDT05GSUdfSTNDIGlzIG5vdCBzZXQKQ09ORklHX1NQST15CiMgQ09ORklHX1NQSV9E
RUJVRyBpcyBub3Qgc2V0CkNPTkZJR19TUElfTUFTVEVSPXkKIyBDT05GSUdfU1BJX01FTSBp
cyBub3Qgc2V0CgojCiMgU1BJIE1hc3RlciBDb250cm9sbGVyIERyaXZlcnMKIwojIENPTkZJ
R19TUElfQUxURVJBIGlzIG5vdCBzZXQKIyBDT05GSUdfU1BJX0FYSV9TUElfRU5HSU5FIGlz
IG5vdCBzZXQKIyBDT05GSUdfU1BJX0JJVEJBTkcgaXMgbm90IHNldAojIENPTkZJR19TUElf
Q0FERU5DRSBpcyBub3Qgc2V0CiMgQ09ORklHX1NQSV9ERVNJR05XQVJFIGlzIG5vdCBzZXQK
IyBDT05GSUdfU1BJX0dQSU8gaXMgbm90IHNldAojIENPTkZJR19TUElfTUlDUk9DSElQX0NP
UkUgaXMgbm90IHNldAojIENPTkZJR19TUElfTUlDUk9DSElQX0NPUkVfUVNQSSBpcyBub3Qg
c2V0CiMgQ09ORklHX1NQSV9MQU5USVFfU1NDIGlzIG5vdCBzZXQKIyBDT05GSUdfU1BJX09D
X1RJTlkgaXMgbm90IHNldAojIENPTkZJR19TUElfUENJMVhYWFggaXMgbm90IHNldAojIENP
TkZJR19TUElfUFhBMlhYIGlzIG5vdCBzZXQKIyBDT05GSUdfU1BJX1NDMThJUzYwMiBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NQSV9TSUZJVkUgaXMgbm90IHNldAojIENPTkZJR19TUElfTVhJ
QyBpcyBub3Qgc2V0CiMgQ09ORklHX1NQSV9YQ09NTSBpcyBub3Qgc2V0CiMgQ09ORklHX1NQ
SV9YSUxJTlggaXMgbm90IHNldAojIENPTkZJR19TUElfWllOUU1QX0dRU1BJIGlzIG5vdCBz
ZXQKQ09ORklHX1NQSV9BTUQ9eQoKIwojIFNQSSBNdWx0aXBsZXhlciBzdXBwb3J0CiMKIyBD
T05GSUdfU1BJX01VWCBpcyBub3Qgc2V0CgojCiMgU1BJIFByb3RvY29sIE1hc3RlcnMKIwoj
IENPTkZJR19TUElfU1BJREVWIGlzIG5vdCBzZXQKIyBDT05GSUdfU1BJX0xPT1BCQUNLX1RF
U1QgaXMgbm90IHNldAojIENPTkZJR19TUElfVExFNjJYMCBpcyBub3Qgc2V0CiMgQ09ORklH
X1NQSV9TTEFWRSBpcyBub3Qgc2V0CkNPTkZJR19TUElfRFlOQU1JQz15CiMgQ09ORklHX1NQ
TUkgaXMgbm90IHNldAojIENPTkZJR19IU0kgaXMgbm90IHNldApDT05GSUdfUFBTPXkKIyBD
T05GSUdfUFBTX0RFQlVHIGlzIG5vdCBzZXQKCiMKIyBQUFMgY2xpZW50cyBzdXBwb3J0CiMK
IyBDT05GSUdfUFBTX0NMSUVOVF9LVElNRVIgaXMgbm90IHNldAojIENPTkZJR19QUFNfQ0xJ
RU5UX0xESVNDIGlzIG5vdCBzZXQKIyBDT05GSUdfUFBTX0NMSUVOVF9HUElPIGlzIG5vdCBz
ZXQKCiMKIyBQUFMgZ2VuZXJhdG9ycyBzdXBwb3J0CiMKCiMKIyBQVFAgY2xvY2sgc3VwcG9y
dAojCkNPTkZJR19QVFBfMTU4OF9DTE9DSz15CkNPTkZJR19QVFBfMTU4OF9DTE9DS19PUFRJ
T05BTD15CiMgQ09ORklHX0RQODM2NDBfUEhZIGlzIG5vdCBzZXQKIyBDT05GSUdfUFRQXzE1
ODhfQ0xPQ0tfSU5FUyBpcyBub3Qgc2V0CiMgQ09ORklHX1BUUF8xNTg4X0NMT0NLX0tWTSBp
cyBub3Qgc2V0CiMgQ09ORklHX1BUUF8xNTg4X0NMT0NLX0lEVDgyUDMzIGlzIG5vdCBzZXQK
IyBDT05GSUdfUFRQXzE1ODhfQ0xPQ0tfSURUQ00gaXMgbm90IHNldAojIENPTkZJR19QVFBf
MTU4OF9DTE9DS19WTVcgaXMgbm90IHNldAojIGVuZCBvZiBQVFAgY2xvY2sgc3VwcG9ydAoK
Q09ORklHX1BJTkNUUkw9eQpDT05GSUdfUElOTVVYPXkKQ09ORklHX1BJTkNPTkY9eQpDT05G
SUdfR0VORVJJQ19QSU5DT05GPXkKIyBDT05GSUdfREVCVUdfUElOQ1RSTCBpcyBub3Qgc2V0
CkNPTkZJR19QSU5DVFJMX0FNRD15CiMgQ09ORklHX1BJTkNUUkxfQ1k4Qzk1WDAgaXMgbm90
IHNldAojIENPTkZJR19QSU5DVFJMX01DUDIzUzA4IGlzIG5vdCBzZXQKIyBDT05GSUdfUElO
Q1RSTF9TWDE1MFggaXMgbm90IHNldAoKIwojIEludGVsIHBpbmN0cmwgZHJpdmVycwojCkNP
TkZJR19QSU5DVFJMX0JBWVRSQUlMPXkKQ09ORklHX1BJTkNUUkxfQ0hFUlJZVklFVz15CiMg
Q09ORklHX1BJTkNUUkxfTFlOWFBPSU5UIGlzIG5vdCBzZXQKQ09ORklHX1BJTkNUUkxfSU5U
RUw9eQojIENPTkZJR19QSU5DVFJMX0FMREVSTEFLRSBpcyBub3Qgc2V0CiMgQ09ORklHX1BJ
TkNUUkxfQlJPWFRPTiBpcyBub3Qgc2V0CiMgQ09ORklHX1BJTkNUUkxfQ0FOTk9OTEFLRSBp
cyBub3Qgc2V0CiMgQ09ORklHX1BJTkNUUkxfQ0VEQVJGT1JLIGlzIG5vdCBzZXQKIyBDT05G
SUdfUElOQ1RSTF9ERU5WRVJUT04gaXMgbm90IHNldAojIENPTkZJR19QSU5DVFJMX0VMS0hB
UlRMQUtFIGlzIG5vdCBzZXQKIyBDT05GSUdfUElOQ1RSTF9FTU1JVFNCVVJHIGlzIG5vdCBz
ZXQKIyBDT05GSUdfUElOQ1RSTF9HRU1JTklMQUtFIGlzIG5vdCBzZXQKIyBDT05GSUdfUElO
Q1RSTF9JQ0VMQUtFIGlzIG5vdCBzZXQKIyBDT05GSUdfUElOQ1RSTF9KQVNQRVJMQUtFIGlz
IG5vdCBzZXQKIyBDT05GSUdfUElOQ1RSTF9MQUtFRklFTEQgaXMgbm90IHNldAojIENPTkZJ
R19QSU5DVFJMX0xFV0lTQlVSRyBpcyBub3Qgc2V0CiMgQ09ORklHX1BJTkNUUkxfTUVURU9S
TEFLRSBpcyBub3Qgc2V0CiMgQ09ORklHX1BJTkNUUkxfU1VOUklTRVBPSU5UIGlzIG5vdCBz
ZXQKIyBDT05GSUdfUElOQ1RSTF9USUdFUkxBS0UgaXMgbm90IHNldAojIGVuZCBvZiBJbnRl
bCBwaW5jdHJsIGRyaXZlcnMKCiMKIyBSZW5lc2FzIHBpbmN0cmwgZHJpdmVycwojCiMgZW5k
IG9mIFJlbmVzYXMgcGluY3RybCBkcml2ZXJzCgpDT05GSUdfR1BJT0xJQj15CkNPTkZJR19H
UElPTElCX0ZBU1RQQVRIX0xJTUlUPTUxMgpDT05GSUdfR1BJT19BQ1BJPXkKQ09ORklHX0dQ
SU9MSUJfSVJRQ0hJUD15CiMgQ09ORklHX0RFQlVHX0dQSU8gaXMgbm90IHNldAojIENPTkZJ
R19HUElPX1NZU0ZTIGlzIG5vdCBzZXQKQ09ORklHX0dQSU9fQ0RFVj15CkNPTkZJR19HUElP
X0NERVZfVjE9eQoKIwojIE1lbW9yeSBtYXBwZWQgR1BJTyBkcml2ZXJzCiMKIyBDT05GSUdf
R1BJT19BTURQVCBpcyBub3Qgc2V0CiMgQ09ORklHX0dQSU9fRFdBUEIgaXMgbm90IHNldAoj
IENPTkZJR19HUElPX0dFTkVSSUNfUExBVEZPUk0gaXMgbm90IHNldAojIENPTkZJR19HUElP
X01CODZTN1ggaXMgbm90IHNldAojIENPTkZJR19HUElPX0FNRF9GQ0ggaXMgbm90IHNldAoj
IGVuZCBvZiBNZW1vcnkgbWFwcGVkIEdQSU8gZHJpdmVycwoKIwojIFBvcnQtbWFwcGVkIEkv
TyBHUElPIGRyaXZlcnMKIwojIENPTkZJR19HUElPX1ZYODU1IGlzIG5vdCBzZXQKIyBDT05G
SUdfR1BJT19GNzE4OFggaXMgbm90IHNldAojIENPTkZJR19HUElPX0lUODcgaXMgbm90IHNl
dAojIENPTkZJR19HUElPX1NDSDMxMVggaXMgbm90IHNldAojIENPTkZJR19HUElPX1dJTkJP
TkQgaXMgbm90IHNldAojIENPTkZJR19HUElPX1dTMTZDNDggaXMgbm90IHNldAojIGVuZCBv
ZiBQb3J0LW1hcHBlZCBJL08gR1BJTyBkcml2ZXJzCgojCiMgSTJDIEdQSU8gZXhwYW5kZXJz
CiMKIyBDT05GSUdfR1BJT19GWEw2NDA4IGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJT19NQVg3
MzAwIGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJT19NQVg3MzJYIGlzIG5vdCBzZXQKIyBDT05G
SUdfR1BJT19QQ0E5NTNYIGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJT19QQ0E5NTcwIGlzIG5v
dCBzZXQKIyBDT05GSUdfR1BJT19QQ0Y4NTdYIGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJT19U
UElDMjgxMCBpcyBub3Qgc2V0CiMgZW5kIG9mIEkyQyBHUElPIGV4cGFuZGVycwoKIwojIE1G
RCBHUElPIGV4cGFuZGVycwojCkNPTkZJR19HUElPX0NSWVNUQUxfQ09WRT15CiMgQ09ORklH
X0dQSU9fRUxLSEFSVExBS0UgaXMgbm90IHNldAojIGVuZCBvZiBNRkQgR1BJTyBleHBhbmRl
cnMKCiMKIyBQQ0kgR1BJTyBleHBhbmRlcnMKIwojIENPTkZJR19HUElPX0FNRDgxMTEgaXMg
bm90IHNldAojIENPTkZJR19HUElPX0JUOFhYIGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJT19N
TF9JT0ggaXMgbm90IHNldAojIENPTkZJR19HUElPX1BDSV9JRElPXzE2IGlzIG5vdCBzZXQK
IyBDT05GSUdfR1BJT19QQ0lFX0lESU9fMjQgaXMgbm90IHNldAojIENPTkZJR19HUElPX1JE
QzMyMVggaXMgbm90IHNldAojIGVuZCBvZiBQQ0kgR1BJTyBleHBhbmRlcnMKCiMKIyBTUEkg
R1BJTyBleHBhbmRlcnMKIwojIENPTkZJR19HUElPX01BWDMxOTFYIGlzIG5vdCBzZXQKIyBD
T05GSUdfR1BJT19NQVg3MzAxIGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJT19NQzMzODgwIGlz
IG5vdCBzZXQKIyBDT05GSUdfR1BJT19QSVNPU1IgaXMgbm90IHNldAojIENPTkZJR19HUElP
X1hSQTE0MDMgaXMgbm90IHNldAojIGVuZCBvZiBTUEkgR1BJTyBleHBhbmRlcnMKCiMKIyBV
U0IgR1BJTyBleHBhbmRlcnMKIwojIGVuZCBvZiBVU0IgR1BJTyBleHBhbmRlcnMKCiMKIyBW
aXJ0dWFsIEdQSU8gZHJpdmVycwojCiMgQ09ORklHX0dQSU9fQUdHUkVHQVRPUiBpcyBub3Qg
c2V0CiMgQ09ORklHX0dQSU9fTEFUQ0ggaXMgbm90IHNldAojIENPTkZJR19HUElPX01PQ0tV
UCBpcyBub3Qgc2V0CiMgQ09ORklHX0dQSU9fVklSVElPIGlzIG5vdCBzZXQKIyBDT05GSUdf
R1BJT19TSU0gaXMgbm90IHNldAojIGVuZCBvZiBWaXJ0dWFsIEdQSU8gZHJpdmVycwoKIyBD
T05GSUdfVzEgaXMgbm90IHNldApDT05GSUdfUE9XRVJfUkVTRVQ9eQojIENPTkZJR19QT1dF
Ul9SRVNFVF9SRVNUQVJUIGlzIG5vdCBzZXQKQ09ORklHX1BPV0VSX1NVUFBMWT15CiMgQ09O
RklHX1BPV0VSX1NVUFBMWV9ERUJVRyBpcyBub3Qgc2V0CkNPTkZJR19QT1dFUl9TVVBQTFlf
SFdNT049eQojIENPTkZJR19JUDVYWFhfUE9XRVIgaXMgbm90IHNldAojIENPTkZJR19URVNU
X1BPV0VSIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0hBUkdFUl9BRFA1MDYxIGlzIG5vdCBzZXQK
IyBDT05GSUdfQkFUVEVSWV9DVzIwMTUgaXMgbm90IHNldAojIENPTkZJR19CQVRURVJZX0RT
Mjc4MCBpcyBub3Qgc2V0CiMgQ09ORklHX0JBVFRFUllfRFMyNzgxIGlzIG5vdCBzZXQKIyBD
T05GSUdfQkFUVEVSWV9EUzI3ODIgaXMgbm90IHNldAojIENPTkZJR19CQVRURVJZX1NBTVNV
TkdfU0RJIGlzIG5vdCBzZXQKIyBDT05GSUdfQkFUVEVSWV9TQlMgaXMgbm90IHNldAojIENP
TkZJR19DSEFSR0VSX1NCUyBpcyBub3Qgc2V0CiMgQ09ORklHX01BTkFHRVJfU0JTIGlzIG5v
dCBzZXQKIyBDT05GSUdfQkFUVEVSWV9CUTI3WFhYIGlzIG5vdCBzZXQKIyBDT05GSUdfQkFU
VEVSWV9NQVgxNzA0MCBpcyBub3Qgc2V0CiMgQ09ORklHX0JBVFRFUllfTUFYMTcwNDIgaXMg
bm90IHNldAojIENPTkZJR19DSEFSR0VSX01BWDg5MDMgaXMgbm90IHNldAojIENPTkZJR19D
SEFSR0VSX0xQODcyNyBpcyBub3Qgc2V0CiMgQ09ORklHX0NIQVJHRVJfR1BJTyBpcyBub3Qg
c2V0CiMgQ09ORklHX0NIQVJHRVJfTUFOQUdFUiBpcyBub3Qgc2V0CiMgQ09ORklHX0NIQVJH
RVJfTFQzNjUxIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0hBUkdFUl9MVEM0MTYyTCBpcyBub3Qg
c2V0CiMgQ09ORklHX0NIQVJHRVJfTUFYNzc5NzYgaXMgbm90IHNldAojIENPTkZJR19DSEFS
R0VSX0JRMjQxNVggaXMgbm90IHNldAojIENPTkZJR19DSEFSR0VSX0JRMjQxOTAgaXMgbm90
IHNldAojIENPTkZJR19DSEFSR0VSX0JRMjQyNTcgaXMgbm90IHNldAojIENPTkZJR19DSEFS
R0VSX0JRMjQ3MzUgaXMgbm90IHNldAojIENPTkZJR19DSEFSR0VSX0JRMjUxNVggaXMgbm90
IHNldAojIENPTkZJR19DSEFSR0VSX0JRMjU4OTAgaXMgbm90IHNldAojIENPTkZJR19DSEFS
R0VSX0JRMjU5ODAgaXMgbm90IHNldAojIENPTkZJR19DSEFSR0VSX0JRMjU2WFggaXMgbm90
IHNldAojIENPTkZJR19DSEFSR0VSX1NNQjM0NyBpcyBub3Qgc2V0CiMgQ09ORklHX0JBVFRF
UllfR0FVR0VfTFRDMjk0MSBpcyBub3Qgc2V0CiMgQ09ORklHX0JBVFRFUllfR09MREZJU0gg
aXMgbm90IHNldAojIENPTkZJR19CQVRURVJZX1JUNTAzMyBpcyBub3Qgc2V0CiMgQ09ORklH
X0NIQVJHRVJfUlQ5NDU1IGlzIG5vdCBzZXQKIyBDT05GSUdfQ0hBUkdFUl9SVDk0NjcgaXMg
bm90IHNldAojIENPTkZJR19DSEFSR0VSX1JUOTQ3MSBpcyBub3Qgc2V0CiMgQ09ORklHX0NI
QVJHRVJfQkQ5OTk1NCBpcyBub3Qgc2V0CiMgQ09ORklHX0JBVFRFUllfVUczMTA1IGlzIG5v
dCBzZXQKQ09ORklHX0hXTU9OPXkKIyBDT05GSUdfSFdNT05fREVCVUdfQ0hJUCBpcyBub3Qg
c2V0CgojCiMgTmF0aXZlIGRyaXZlcnMKIwojIENPTkZJR19TRU5TT1JTX0FCSVRVR1VSVSBp
cyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfQUJJVFVHVVJVMyBpcyBub3Qgc2V0CiMgQ09O
RklHX1NFTlNPUlNfQUQ3MzE0IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19BRDc0MTQg
aXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0FENzQxOCBpcyBub3Qgc2V0CiMgQ09ORklH
X1NFTlNPUlNfQURNMTAyMSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfQURNMTAyNSBp
cyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfQURNMTAyNiBpcyBub3Qgc2V0CiMgQ09ORklH
X1NFTlNPUlNfQURNMTAyOSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfQURNMTAzMSBp
cyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfQURNMTE3NyBpcyBub3Qgc2V0CiMgQ09ORklH
X1NFTlNPUlNfQURNOTI0MCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfQURUNzMxMCBp
cyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfQURUNzQxMCBpcyBub3Qgc2V0CiMgQ09ORklH
X1NFTlNPUlNfQURUNzQxMSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfQURUNzQ2MiBp
cyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfQURUNzQ3MCBpcyBub3Qgc2V0CiMgQ09ORklH
X1NFTlNPUlNfQURUNzQ3NSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfQUhUMTAgaXMg
bm90IHNldAojIENPTkZJR19TRU5TT1JTX0FRVUFDT01QVVRFUl9ENU5FWFQgaXMgbm90IHNl
dAojIENPTkZJR19TRU5TT1JTX0FTMzcwIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19B
U0M3NjIxIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19BWElfRkFOX0NPTlRST0wgaXMg
bm90IHNldAojIENPTkZJR19TRU5TT1JTX0s4VEVNUCBpcyBub3Qgc2V0CkNPTkZJR19TRU5T
T1JTX0sxMFRFTVA9bQojIENPTkZJR19TRU5TT1JTX0ZBTTE1SF9QT1dFUiBpcyBub3Qgc2V0
CiMgQ09ORklHX1NFTlNPUlNfQVBQTEVTTUMgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JT
X0FTQjEwMCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfQVRYUDEgaXMgbm90IHNldAoj
IENPTkZJR19TRU5TT1JTX0NPUlNBSVJfQ1BSTyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNP
UlNfQ09SU0FJUl9QU1UgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0RTNjIwIGlzIG5v
dCBzZXQKIyBDT05GSUdfU0VOU09SU19EUzE2MjEgaXMgbm90IHNldAojIENPTkZJR19TRU5T
T1JTX0RFTExfU01NIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19JNUtfQU1CIGlzIG5v
dCBzZXQKIyBDT05GSUdfU0VOU09SU19GNzE4MDVGIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VO
U09SU19GNzE4ODJGRyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfRjc1Mzc1UyBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfRlNDSE1EIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VO
U09SU19GVFNURVVUQVRFUyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfR0w1MThTTSBp
cyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfR0w1MjBTTSBpcyBub3Qgc2V0CiMgQ09ORklH
X1NFTlNPUlNfRzc2MEEgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0c3NjIgaXMgbm90
IHNldAojIENPTkZJR19TRU5TT1JTX0hJSDYxMzAgaXMgbm90IHNldAojIENPTkZJR19TRU5T
T1JTX0k1NTAwIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19DT1JFVEVNUCBpcyBub3Qg
c2V0CiMgQ09ORklHX1NFTlNPUlNfSVQ4NyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNf
SkM0MiBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfUE9XUjEyMjAgaXMgbm90IHNldAoj
IENPTkZJR19TRU5TT1JTX0xJTkVBR0UgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0xU
QzI5NDUgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0xUQzI5NDdfSTJDIGlzIG5vdCBz
ZXQKIyBDT05GSUdfU0VOU09SU19MVEMyOTQ3X1NQSSBpcyBub3Qgc2V0CiMgQ09ORklHX1NF
TlNPUlNfTFRDMjk5MCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfTFRDMjk5MiBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfTFRDNDE1MSBpcyBub3Qgc2V0CiMgQ09ORklHX1NF
TlNPUlNfTFRDNDIxNSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfTFRDNDIyMiBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfTFRDNDI0NSBpcyBub3Qgc2V0CiMgQ09ORklHX1NF
TlNPUlNfTFRDNDI2MCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfTFRDNDI2MSBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfTUFYMTExMSBpcyBub3Qgc2V0CiMgQ09ORklHX1NF
TlNPUlNfTUFYMTI3IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19NQVgxNjA2NSBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfTUFYMTYxOSBpcyBub3Qgc2V0CiMgQ09ORklHX1NF
TlNPUlNfTUFYMTY2OCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfTUFYMTk3IGlzIG5v
dCBzZXQKIyBDT05GSUdfU0VOU09SU19NQVgzMTcyMiBpcyBub3Qgc2V0CiMgQ09ORklHX1NF
TlNPUlNfTUFYMzE3MzAgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX01BWDMxNzYwIGlz
IG5vdCBzZXQKIyBDT05GSUdfTUFYMzE4MjcgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JT
X01BWDY2MjAgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX01BWDY2MjEgaXMgbm90IHNl
dAojIENPTkZJR19TRU5TT1JTX01BWDY2MzkgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JT
X01BWDY2NDIgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX01BWDY2NTAgaXMgbm90IHNl
dAojIENPTkZJR19TRU5TT1JTX01BWDY2OTcgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JT
X01BWDMxNzkwIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19NQzM0VlI1MDAgaXMgbm90
IHNldAojIENPTkZJR19TRU5TT1JTX01DUDMwMjEgaXMgbm90IHNldAojIENPTkZJR19TRU5T
T1JTX1RDNjU0IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19UUFMyMzg2MSBpcyBub3Qg
c2V0CiMgQ09ORklHX1NFTlNPUlNfTVI3NTIwMyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNP
UlNfQURDWFggaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0xNNjMgaXMgbm90IHNldAoj
IENPTkZJR19TRU5TT1JTX0xNNzAgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0xNNzMg
aXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0xNNzUgaXMgbm90IHNldAojIENPTkZJR19T
RU5TT1JTX0xNNzcgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0xNNzggaXMgbm90IHNl
dAojIENPTkZJR19TRU5TT1JTX0xNODAgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0xN
ODMgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0xNODUgaXMgbm90IHNldAojIENPTkZJ
R19TRU5TT1JTX0xNODcgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0xNOTAgaXMgbm90
IHNldAojIENPTkZJR19TRU5TT1JTX0xNOTIgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JT
X0xNOTMgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0xNOTUyMzQgaXMgbm90IHNldAoj
IENPTkZJR19TRU5TT1JTX0xNOTUyNDEgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0xN
OTUyNDUgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX1BDODczNjAgaXMgbm90IHNldAoj
IENPTkZJR19TRU5TT1JTX1BDODc0MjcgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX05D
VDY2ODMgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX05DVDY3NzUgaXMgbm90IHNldAoj
IENPTkZJR19TRU5TT1JTX05DVDY3NzVfSTJDIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09S
U19OQ1Q3ODAyIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19OQ1Q3OTA0IGlzIG5vdCBz
ZXQKIyBDT05GSUdfU0VOU09SU19OUENNN1hYIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09S
U19OWlhUX0tSQUtFTjIgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX05aWFRfU01BUlQy
IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19PQ0NfUDhfSTJDIGlzIG5vdCBzZXQKIyBD
T05GSUdfU0VOU09SU19PWFAgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX1BDRjg1OTEg
aXMgbm90IHNldAojIENPTkZJR19QTUJVUyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNf
U0JUU0kgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX1NCUk1JIGlzIG5vdCBzZXQKIyBD
T05GSUdfU0VOU09SU19TSFQxNSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfU0hUMjEg
aXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX1NIVDN4IGlzIG5vdCBzZXQKIyBDT05GSUdf
U0VOU09SU19TSFQ0eCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfU0hUQzEgaXMgbm90
IHNldAojIENPTkZJR19TRU5TT1JTX1NJUzU1OTUgaXMgbm90IHNldAojIENPTkZJR19TRU5T
T1JTX0RNRTE3MzcgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0VNQzE0MDMgaXMgbm90
IHNldAojIENPTkZJR19TRU5TT1JTX0VNQzIxMDMgaXMgbm90IHNldAojIENPTkZJR19TRU5T
T1JTX0VNQzIzMDUgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0VNQzZXMjAxIGlzIG5v
dCBzZXQKIyBDT05GSUdfU0VOU09SU19TTVNDNDdNMSBpcyBub3Qgc2V0CiMgQ09ORklHX1NF
TlNPUlNfU01TQzQ3TTE5MiBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfU01TQzQ3QjM5
NyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfU0NINTYyNyBpcyBub3Qgc2V0CiMgQ09O
RklHX1NFTlNPUlNfU0NINTYzNiBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfU1RUUzc1
MSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfU01NNjY1IGlzIG5vdCBzZXQKIyBDT05G
SUdfU0VOU09SU19BREMxMjhEODE4IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19BRFM3
ODI4IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19BRFM3ODcxIGlzIG5vdCBzZXQKIyBD
T05GSUdfU0VOU09SU19BTUM2ODIxIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19JTkEy
MDkgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0lOQTJYWCBpcyBub3Qgc2V0CiMgQ09O
RklHX1NFTlNPUlNfSU5BMjM4IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19JTkEzMjIx
IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19UQzc0IGlzIG5vdCBzZXQKIyBDT05GSUdf
U0VOU09SU19USE1DNTAgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX1RNUDEwMiBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfVE1QMTAzIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VO
U09SU19UTVAxMDggaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX1RNUDQwMSBpcyBub3Qg
c2V0CiMgQ09ORklHX1NFTlNPUlNfVE1QNDIxIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09S
U19UTVA0NjQgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX1RNUDUxMyBpcyBub3Qgc2V0
CiMgQ09ORklHX1NFTlNPUlNfVklBX0NQVVRFTVAgaXMgbm90IHNldAojIENPTkZJR19TRU5T
T1JTX1ZJQTY4NkEgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX1ZUMTIxMSBpcyBub3Qg
c2V0CiMgQ09ORklHX1NFTlNPUlNfVlQ4MjMxIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09S
U19XODM3NzNHIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19XODM3ODFEIGlzIG5vdCBz
ZXQKIyBDT05GSUdfU0VOU09SU19XODM3OTFEIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09S
U19XODM3OTJEIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19XODM3OTMgaXMgbm90IHNl
dAojIENPTkZJR19TRU5TT1JTX1c4Mzc5NSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNf
VzgzTDc4NVRTIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19XODNMNzg2TkcgaXMgbm90
IHNldAojIENPTkZJR19TRU5TT1JTX1c4MzYyN0hGIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VO
U09SU19XODM2MjdFSEYgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX1hHRU5FIGlzIG5v
dCBzZXQKCiMKIyBBQ1BJIGRyaXZlcnMKIwojIENPTkZJR19TRU5TT1JTX0FDUElfUE9XRVIg
aXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0FUSzAxMTAgaXMgbm90IHNldAojIENPTkZJ
R19TRU5TT1JTX0FTVVNfV01JIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19BU1VTX0VD
IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19IUF9XTUkgaXMgbm90IHNldApDT05GSUdf
VEhFUk1BTD15CkNPTkZJR19USEVSTUFMX05FVExJTks9eQpDT05GSUdfVEhFUk1BTF9TVEFU
SVNUSUNTPXkKQ09ORklHX1RIRVJNQUxfRU1FUkdFTkNZX1BPV0VST0ZGX0RFTEFZX01TPTAK
Q09ORklHX1RIRVJNQUxfSFdNT049eQpDT05GSUdfVEhFUk1BTF9XUklUQUJMRV9UUklQUz15
CkNPTkZJR19USEVSTUFMX0RFRkFVTFRfR09WX1NURVBfV0lTRT15CiMgQ09ORklHX1RIRVJN
QUxfREVGQVVMVF9HT1ZfRkFJUl9TSEFSRSBpcyBub3Qgc2V0CiMgQ09ORklHX1RIRVJNQUxf
REVGQVVMVF9HT1ZfVVNFUl9TUEFDRSBpcyBub3Qgc2V0CiMgQ09ORklHX1RIRVJNQUxfREVG
QVVMVF9HT1ZfQkFOR19CQU5HIGlzIG5vdCBzZXQKQ09ORklHX1RIRVJNQUxfR09WX0ZBSVJf
U0hBUkU9eQpDT05GSUdfVEhFUk1BTF9HT1ZfU1RFUF9XSVNFPXkKQ09ORklHX1RIRVJNQUxf
R09WX0JBTkdfQkFORz15CkNPTkZJR19USEVSTUFMX0dPVl9VU0VSX1NQQUNFPXkKIyBDT05G
SUdfVEhFUk1BTF9HT1ZfUE9XRVJfQUxMT0NBVE9SIGlzIG5vdCBzZXQKIyBDT05GSUdfVEhF
Uk1BTF9FTVVMQVRJT04gaXMgbm90IHNldAoKIwojIEludGVsIHRoZXJtYWwgZHJpdmVycwoj
CiMgQ09ORklHX0lOVEVMX1NPQ19EVFNfVEhFUk1BTCBpcyBub3Qgc2V0CgojCiMgQUNQSSBJ
TlQzNDBYIHRoZXJtYWwgZHJpdmVycwojCiMgQ09ORklHX0lOVDM0MFhfVEhFUk1BTCBpcyBu
b3Qgc2V0CiMgZW5kIG9mIEFDUEkgSU5UMzQwWCB0aGVybWFsIGRyaXZlcnMKCiMgQ09ORklH
X0lOVEVMX1BDSF9USEVSTUFMIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5URUxfVENDX0NPT0xJ
TkcgaXMgbm90IHNldAojIGVuZCBvZiBJbnRlbCB0aGVybWFsIGRyaXZlcnMKCkNPTkZJR19X
QVRDSERPRz15CkNPTkZJR19XQVRDSERPR19DT1JFPXkKIyBDT05GSUdfV0FUQ0hET0dfTk9X
QVlPVVQgaXMgbm90IHNldApDT05GSUdfV0FUQ0hET0dfSEFORExFX0JPT1RfRU5BQkxFRD15
CkNPTkZJR19XQVRDSERPR19PUEVOX1RJTUVPVVQ9MApDT05GSUdfV0FUQ0hET0dfU1lTRlM9
eQojIENPTkZJR19XQVRDSERPR19IUlRJTUVSX1BSRVRJTUVPVVQgaXMgbm90IHNldAoKIwoj
IFdhdGNoZG9nIFByZXRpbWVvdXQgR292ZXJub3JzCiMKIyBDT05GSUdfV0FUQ0hET0dfUFJF
VElNRU9VVF9HT1YgaXMgbm90IHNldAoKIwojIFdhdGNoZG9nIERldmljZSBEcml2ZXJzCiMK
IyBDT05GSUdfU09GVF9XQVRDSERPRyBpcyBub3Qgc2V0CiMgQ09ORklHX1dEQVRfV0RUIGlz
IG5vdCBzZXQKIyBDT05GSUdfWElMSU5YX1dBVENIRE9HIGlzIG5vdCBzZXQKIyBDT05GSUdf
WklJUkFWRV9XQVRDSERPRyBpcyBub3Qgc2V0CiMgQ09ORklHX0NBREVOQ0VfV0FUQ0hET0cg
aXMgbm90IHNldAojIENPTkZJR19EV19XQVRDSERPRyBpcyBub3Qgc2V0CiMgQ09ORklHX01B
WDYzWFhfV0FUQ0hET0cgaXMgbm90IHNldAojIENPTkZJR19BQ1FVSVJFX1dEVCBpcyBub3Qg
c2V0CiMgQ09ORklHX0FEVkFOVEVDSF9XRFQgaXMgbm90IHNldAojIENPTkZJR19BRFZBTlRF
Q0hfRUNfV0RUIGlzIG5vdCBzZXQKIyBDT05GSUdfQUxJTTE1MzVfV0RUIGlzIG5vdCBzZXQK
IyBDT05GSUdfQUxJTTcxMDFfV0RUIGlzIG5vdCBzZXQKIyBDT05GSUdfRUJDX0MzODRfV0RU
IGlzIG5vdCBzZXQKIyBDT05GSUdfRVhBUl9XRFQgaXMgbm90IHNldAojIENPTkZJR19GNzE4
MDhFX1dEVCBpcyBub3Qgc2V0CkNPTkZJR19TUDUxMDBfVENPPW0KIyBDT05GSUdfU0JDX0ZJ
VFBDMl9XQVRDSERPRyBpcyBub3Qgc2V0CiMgQ09ORklHX0VVUk9URUNIX1dEVCBpcyBub3Qg
c2V0CiMgQ09ORklHX0lCNzAwX1dEVCBpcyBub3Qgc2V0CiMgQ09ORklHX0lCTUFTUiBpcyBu
b3Qgc2V0CiMgQ09ORklHX1dBRkVSX1dEVCBpcyBub3Qgc2V0CiMgQ09ORklHX0k2MzAwRVNC
X1dEVCBpcyBub3Qgc2V0CiMgQ09ORklHX0lFNlhYX1dEVCBpcyBub3Qgc2V0CiMgQ09ORklH
X0lUQ09fV0RUIGlzIG5vdCBzZXQKIyBDT05GSUdfSVQ4NzEyRl9XRFQgaXMgbm90IHNldAoj
IENPTkZJR19JVDg3X1dEVCBpcyBub3Qgc2V0CiMgQ09ORklHX0hQX1dBVENIRE9HIGlzIG5v
dCBzZXQKIyBDT05GSUdfU0MxMjAwX1dEVCBpcyBub3Qgc2V0CiMgQ09ORklHX1BDODc0MTNf
V0RUIGlzIG5vdCBzZXQKIyBDT05GSUdfTlZfVENPIGlzIG5vdCBzZXQKIyBDT05GSUdfNjBY
WF9XRFQgaXMgbm90IHNldAojIENPTkZJR19DUFU1X1dEVCBpcyBub3Qgc2V0CiMgQ09ORklH
X1NNU0NfU0NIMzExWF9XRFQgaXMgbm90IHNldAojIENPTkZJR19TTVNDMzdCNzg3X1dEVCBp
cyBub3Qgc2V0CiMgQ09ORklHX1RRTVg4Nl9XRFQgaXMgbm90IHNldAojIENPTkZJR19WSUFf
V0RUIGlzIG5vdCBzZXQKIyBDT05GSUdfVzgzNjI3SEZfV0RUIGlzIG5vdCBzZXQKIyBDT05G
SUdfVzgzODc3Rl9XRFQgaXMgbm90IHNldAojIENPTkZJR19XODM5NzdGX1dEVCBpcyBub3Qg
c2V0CiMgQ09ORklHX01BQ0haX1dEVCBpcyBub3Qgc2V0CiMgQ09ORklHX1NCQ19FUFhfQzNf
V0FUQ0hET0cgaXMgbm90IHNldAojIENPTkZJR19OSTkwM1hfV0RUIGlzIG5vdCBzZXQKIyBD
T05GSUdfTklDNzAxOF9XRFQgaXMgbm90IHNldAojIENPTkZJR19NRU5fQTIxX1dEVCBpcyBu
b3Qgc2V0CgojCiMgUENJLWJhc2VkIFdhdGNoZG9nIENhcmRzCiMKIyBDT05GSUdfUENJUENX
QVRDSERPRyBpcyBub3Qgc2V0CiMgQ09ORklHX1dEVFBDSSBpcyBub3Qgc2V0CgojCiMgVVNC
LWJhc2VkIFdhdGNoZG9nIENhcmRzCiMKIyBDT05GSUdfVVNCUENXQVRDSERPRyBpcyBub3Qg
c2V0CkNPTkZJR19TU0JfUE9TU0lCTEU9eQojIENPTkZJR19TU0IgaXMgbm90IHNldApDT05G
SUdfQkNNQV9QT1NTSUJMRT15CiMgQ09ORklHX0JDTUEgaXMgbm90IHNldAoKIwojIE11bHRp
ZnVuY3Rpb24gZGV2aWNlIGRyaXZlcnMKIwpDT05GSUdfTUZEX0NPUkU9eQojIENPTkZJR19N
RkRfQVMzNzExIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1NNUFJPIGlzIG5vdCBzZXQKIyBD
T05GSUdfUE1JQ19BRFA1NTIwIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX0FBVDI4NzBfQ09S
RSBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9CQ001OTBYWCBpcyBub3Qgc2V0CiMgQ09ORklH
X01GRF9CRDk1NzFNV1YgaXMgbm90IHNldApDT05GSUdfTUZEX0FYUDIwWD15CkNPTkZJR19N
RkRfQVhQMjBYX0kyQz15CiMgQ09ORklHX01GRF9NQURFUkEgaXMgbm90IHNldAojIENPTkZJ
R19QTUlDX0RBOTAzWCBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9EQTkwNTJfU1BJIGlzIG5v
dCBzZXQKIyBDT05GSUdfTUZEX0RBOTA1Ml9JMkMgaXMgbm90IHNldAojIENPTkZJR19NRkRf
REE5MDU1IGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX0RBOTA2MiBpcyBub3Qgc2V0CiMgQ09O
RklHX01GRF9EQTkwNjMgaXMgbm90IHNldAojIENPTkZJR19NRkRfREE5MTUwIGlzIG5vdCBz
ZXQKIyBDT05GSUdfTUZEX0RMTjIgaXMgbm90IHNldAojIENPTkZJR19NRkRfTUMxM1hYWF9T
UEkgaXMgbm90IHNldAojIENPTkZJR19NRkRfTUMxM1hYWF9JMkMgaXMgbm90IHNldAojIENP
TkZJR19NRkRfTVAyNjI5IGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX0lOVEVMX1FVQVJLX0ky
Q19HUElPIGlzIG5vdCBzZXQKIyBDT05GSUdfTFBDX0lDSCBpcyBub3Qgc2V0CiMgQ09ORklH
X0xQQ19TQ0ggaXMgbm90IHNldApDT05GSUdfSU5URUxfU09DX1BNSUM9eQpDT05GSUdfSU5U
RUxfU09DX1BNSUNfQ0hUV0M9eQojIENPTkZJR19JTlRFTF9TT0NfUE1JQ19DSFREQ19USSBp
cyBub3Qgc2V0CiMgQ09ORklHX0lOVEVMX1NPQ19QTUlDX01SRkxEIGlzIG5vdCBzZXQKQ09O
RklHX01GRF9JTlRFTF9MUFNTPXkKQ09ORklHX01GRF9JTlRFTF9MUFNTX0FDUEk9eQpDT05G
SUdfTUZEX0lOVEVMX0xQU1NfUENJPXkKIyBDT05GSUdfTUZEX0lOVEVMX1BNQ19CWFQgaXMg
bm90IHNldAojIENPTkZJR19NRkRfSVFTNjJYIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX0pB
TlpfQ01PRElPIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX0tFTVBMRCBpcyBub3Qgc2V0CiMg
Q09ORklHX01GRF84OFBNODAwIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEXzg4UE04MDUgaXMg
bm90IHNldAojIENPTkZJR19NRkRfODhQTTg2MFggaXMgbm90IHNldAojIENPTkZJR19NRkRf
TUFYMTQ1NzcgaXMgbm90IHNldAojIENPTkZJR19NRkRfTUFYNzc1NDEgaXMgbm90IHNldAoj
IENPTkZJR19NRkRfTUFYNzc2OTMgaXMgbm90IHNldAojIENPTkZJR19NRkRfTUFYNzc4NDMg
aXMgbm90IHNldAojIENPTkZJR19NRkRfTUFYODkwNyBpcyBub3Qgc2V0CiMgQ09ORklHX01G
RF9NQVg4OTI1IGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX01BWDg5OTcgaXMgbm90IHNldAoj
IENPTkZJR19NRkRfTUFYODk5OCBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9NVDYzNjAgaXMg
bm90IHNldAojIENPTkZJR19NRkRfTVQ2MzcwIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX01U
NjM5NyBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9NRU5GMjFCTUMgaXMgbm90IHNldAojIENP
TkZJR19NRkRfT0NFTE9UIGlzIG5vdCBzZXQKIyBDT05GSUdfRVpYX1BDQVAgaXMgbm90IHNl
dAojIENPTkZJR19NRkRfVklQRVJCT0FSRCBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9SRVRV
IGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1BDRjUwNjMzIGlzIG5vdCBzZXQKIyBDT05GSUdf
TUZEX1NZNzYzNkEgaXMgbm90IHNldAojIENPTkZJR19NRkRfUkRDMzIxWCBpcyBub3Qgc2V0
CiMgQ09ORklHX01GRF9SVDQ4MzEgaXMgbm90IHNldAojIENPTkZJR19NRkRfUlQ1MDMzIGlz
IG5vdCBzZXQKIyBDT05GSUdfTUZEX1JUNTEyMCBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9S
QzVUNTgzIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1NJNDc2WF9DT1JFIGlzIG5vdCBzZXQK
IyBDT05GSUdfTUZEX1NNNTAxIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1NLWTgxNDUyIGlz
IG5vdCBzZXQKQ09ORklHX01GRF9TWVNDT049eQojIENPTkZJR19NRkRfVElfQU0zMzVYX1RT
Q0FEQyBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9MUDM5NDMgaXMgbm90IHNldAojIENPTkZJ
R19NRkRfTFA4Nzg4IGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1RJX0xNVSBpcyBub3Qgc2V0
CiMgQ09ORklHX01GRF9QQUxNQVMgaXMgbm90IHNldAojIENPTkZJR19UUFM2MTA1WCBpcyBu
b3Qgc2V0CiMgQ09ORklHX1RQUzY1MDEwIGlzIG5vdCBzZXQKIyBDT05GSUdfVFBTNjUwN1gg
aXMgbm90IHNldAojIENPTkZJR19NRkRfVFBTNjUwODYgaXMgbm90IHNldAojIENPTkZJR19N
RkRfVFBTNjUwOTAgaXMgbm90IHNldAojIENPTkZJR19NRkRfVElfTFA4NzNYIGlzIG5vdCBz
ZXQKIyBDT05GSUdfTUZEX1RQUzY1ODZYIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1RQUzY1
OTEwIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1RQUzY1OTEyX0kyQyBpcyBub3Qgc2V0CiMg
Q09ORklHX01GRF9UUFM2NTkxMl9TUEkgaXMgbm90IHNldAojIENPTkZJR19NRkRfVFBTNjU5
NF9JMkMgaXMgbm90IHNldAojIENPTkZJR19NRkRfVFBTNjU5NF9TUEkgaXMgbm90IHNldAoj
IENPTkZJR19UV0w0MDMwX0NPUkUgaXMgbm90IHNldAojIENPTkZJR19UV0w2MDQwX0NPUkUg
aXMgbm90IHNldAojIENPTkZJR19NRkRfV0wxMjczX0NPUkUgaXMgbm90IHNldAojIENPTkZJ
R19NRkRfTE0zNTMzIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1RRTVg4NiBpcyBub3Qgc2V0
CiMgQ09ORklHX01GRF9WWDg1NSBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9BUklaT05BX0ky
QyBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9BUklaT05BX1NQSSBpcyBub3Qgc2V0CiMgQ09O
RklHX01GRF9XTTg0MDAgaXMgbm90IHNldAojIENPTkZJR19NRkRfV004MzFYX0kyQyBpcyBu
b3Qgc2V0CiMgQ09ORklHX01GRF9XTTgzMVhfU1BJIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZE
X1dNODM1MF9JMkMgaXMgbm90IHNldAojIENPTkZJR19NRkRfV004OTk0IGlzIG5vdCBzZXQK
IyBDT05GSUdfTUZEX0FUQzI2MFhfSTJDIGlzIG5vdCBzZXQKIyBDT05GSUdfUkFWRV9TUF9D
T1JFIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX0lOVEVMX00xMF9CTUNfU1BJIGlzIG5vdCBz
ZXQKIyBlbmQgb2YgTXVsdGlmdW5jdGlvbiBkZXZpY2UgZHJpdmVycwoKQ09ORklHX1JFR1VM
QVRPUj15CiMgQ09ORklHX1JFR1VMQVRPUl9ERUJVRyBpcyBub3Qgc2V0CiMgQ09ORklHX1JF
R1VMQVRPUl9GSVhFRF9WT0xUQUdFIGlzIG5vdCBzZXQKIyBDT05GSUdfUkVHVUxBVE9SX1ZJ
UlRVQUxfQ09OU1VNRVIgaXMgbm90IHNldAojIENPTkZJR19SRUdVTEFUT1JfVVNFUlNQQUNF
X0NPTlNVTUVSIGlzIG5vdCBzZXQKIyBDT05GSUdfUkVHVUxBVE9SXzg4UEc4NlggaXMgbm90
IHNldAojIENPTkZJR19SRUdVTEFUT1JfQUNUODg2NSBpcyBub3Qgc2V0CiMgQ09ORklHX1JF
R1VMQVRPUl9BRDUzOTggaXMgbm90IHNldAojIENPTkZJR19SRUdVTEFUT1JfQVhQMjBYIGlz
IG5vdCBzZXQKIyBDT05GSUdfUkVHVUxBVE9SX0RBOTIxMCBpcyBub3Qgc2V0CiMgQ09ORklH
X1JFR1VMQVRPUl9EQTkyMTEgaXMgbm90IHNldAojIENPTkZJR19SRUdVTEFUT1JfRkFONTM1
NTUgaXMgbm90IHNldAojIENPTkZJR19SRUdVTEFUT1JfR1BJTyBpcyBub3Qgc2V0CiMgQ09O
RklHX1JFR1VMQVRPUl9JU0w5MzA1IGlzIG5vdCBzZXQKIyBDT05GSUdfUkVHVUxBVE9SX0lT
TDYyNzFBIGlzIG5vdCBzZXQKIyBDT05GSUdfUkVHVUxBVE9SX0xQMzk3MSBpcyBub3Qgc2V0
CiMgQ09ORklHX1JFR1VMQVRPUl9MUDM5NzIgaXMgbm90IHNldAojIENPTkZJR19SRUdVTEFU
T1JfTFA4NzJYIGlzIG5vdCBzZXQKIyBDT05GSUdfUkVHVUxBVE9SX0xQODc1NSBpcyBub3Qg
c2V0CiMgQ09ORklHX1JFR1VMQVRPUl9MVEMzNTg5IGlzIG5vdCBzZXQKIyBDT05GSUdfUkVH
VUxBVE9SX0xUQzM2NzYgaXMgbm90IHNldAojIENPTkZJR19SRUdVTEFUT1JfTUFYMTU4NiBp
cyBub3Qgc2V0CiMgQ09ORklHX1JFR1VMQVRPUl9NQVg4NjQ5IGlzIG5vdCBzZXQKIyBDT05G
SUdfUkVHVUxBVE9SX01BWDg2NjAgaXMgbm90IHNldAojIENPTkZJR19SRUdVTEFUT1JfTUFY
ODg5MyBpcyBub3Qgc2V0CiMgQ09ORklHX1JFR1VMQVRPUl9NQVg4OTUyIGlzIG5vdCBzZXQK
IyBDT05GSUdfUkVHVUxBVE9SX01BWDIwMDg2IGlzIG5vdCBzZXQKIyBDT05GSUdfUkVHVUxB
VE9SX01BWDIwNDExIGlzIG5vdCBzZXQKIyBDT05GSUdfUkVHVUxBVE9SX01BWDc3ODI2IGlz
IG5vdCBzZXQKIyBDT05GSUdfUkVHVUxBVE9SX01QODg1OSBpcyBub3Qgc2V0CiMgQ09ORklH
X1JFR1VMQVRPUl9NVDYzMTEgaXMgbm90IHNldAojIENPTkZJR19SRUdVTEFUT1JfUENBOTQ1
MCBpcyBub3Qgc2V0CiMgQ09ORklHX1JFR1VMQVRPUl9QVjg4MDYwIGlzIG5vdCBzZXQKIyBD
T05GSUdfUkVHVUxBVE9SX1BWODgwODAgaXMgbm90IHNldAojIENPTkZJR19SRUdVTEFUT1Jf
UFY4ODA5MCBpcyBub3Qgc2V0CiMgQ09ORklHX1JFR1VMQVRPUl9QV00gaXMgbm90IHNldAoj
IENPTkZJR19SRUdVTEFUT1JfUkFBMjE1MzAwIGlzIG5vdCBzZXQKIyBDT05GSUdfUkVHVUxB
VE9SX1JUNDgwMSBpcyBub3Qgc2V0CiMgQ09ORklHX1JFR1VMQVRPUl9SVDQ4MDMgaXMgbm90
IHNldAojIENPTkZJR19SRUdVTEFUT1JfUlQ1MTkwQSBpcyBub3Qgc2V0CiMgQ09ORklHX1JF
R1VMQVRPUl9SVDU3MzkgaXMgbm90IHNldAojIENPTkZJR19SRUdVTEFUT1JfUlQ1NzU5IGlz
IG5vdCBzZXQKIyBDT05GSUdfUkVHVUxBVE9SX1JUNjE2MCBpcyBub3Qgc2V0CiMgQ09ORklH
X1JFR1VMQVRPUl9SVDYxOTAgaXMgbm90IHNldAojIENPTkZJR19SRUdVTEFUT1JfUlQ2MjQ1
IGlzIG5vdCBzZXQKIyBDT05GSUdfUkVHVUxBVE9SX1JUUTIxMzQgaXMgbm90IHNldAojIENP
TkZJR19SRUdVTEFUT1JfUlRNVjIwIGlzIG5vdCBzZXQKIyBDT05GSUdfUkVHVUxBVE9SX1JU
UTY3NTIgaXMgbm90IHNldAojIENPTkZJR19SRUdVTEFUT1JfU0xHNTEwMDAgaXMgbm90IHNl
dAojIENPTkZJR19SRUdVTEFUT1JfVFBTNTE2MzIgaXMgbm90IHNldAojIENPTkZJR19SRUdV
TEFUT1JfVFBTNjIzNjAgaXMgbm90IHNldAojIENPTkZJR19SRUdVTEFUT1JfVFBTNjUwMjMg
aXMgbm90IHNldAojIENPTkZJR19SRUdVTEFUT1JfVFBTNjUwN1ggaXMgbm90IHNldAojIENP
TkZJR19SRUdVTEFUT1JfVFBTNjUxMzIgaXMgbm90IHNldAojIENPTkZJR19SRUdVTEFUT1Jf
VFBTNjUyNFggaXMgbm90IHNldAojIENPTkZJR19SQ19DT1JFIGlzIG5vdCBzZXQKQ09ORklH
X0NFQ19DT1JFPW0KCiMKIyBDRUMgc3VwcG9ydAojCkNPTkZJR19NRURJQV9DRUNfU1VQUE9S
VD15CiMgQ09ORklHX0NFQ19DSDczMjIgaXMgbm90IHNldAojIENPTkZJR19DRUNfU0VDTyBp
cyBub3Qgc2V0CiMgQ09ORklHX1VTQl9QVUxTRThfQ0VDIGlzIG5vdCBzZXQKIyBDT05GSUdf
VVNCX1JBSU5TSEFET1dfQ0VDIGlzIG5vdCBzZXQKIyBlbmQgb2YgQ0VDIHN1cHBvcnQKCkNP
TkZJR19NRURJQV9TVVBQT1JUPW0KQ09ORklHX01FRElBX1NVUFBPUlRfRklMVEVSPXkKQ09O
RklHX01FRElBX1NVQkRSVl9BVVRPU0VMRUNUPXkKCiMKIyBNZWRpYSBkZXZpY2UgdHlwZXMK
IwpDT05GSUdfTUVESUFfQ0FNRVJBX1NVUFBPUlQ9eQpDT05GSUdfTUVESUFfQU5BTE9HX1RW
X1NVUFBPUlQ9eQpDT05GSUdfTUVESUFfRElHSVRBTF9UVl9TVVBQT1JUPXkKQ09ORklHX01F
RElBX1JBRElPX1NVUFBPUlQ9eQojIENPTkZJR19NRURJQV9TRFJfU1VQUE9SVCBpcyBub3Qg
c2V0CkNPTkZJR19NRURJQV9QTEFURk9STV9TVVBQT1JUPXkKIyBDT05GSUdfTUVESUFfVEVT
VF9TVVBQT1JUIGlzIG5vdCBzZXQKIyBlbmQgb2YgTWVkaWEgZGV2aWNlIHR5cGVzCgpDT05G
SUdfVklERU9fREVWPW0KQ09ORklHX01FRElBX0NPTlRST0xMRVI9eQpDT05GSUdfRFZCX0NP
UkU9bQoKIwojIFZpZGVvNExpbnV4IG9wdGlvbnMKIwpDT05GSUdfVklERU9fVjRMMl9JMkM9
eQpDT05GSUdfVklERU9fVjRMMl9TVUJERVZfQVBJPXkKIyBDT05GSUdfVklERU9fQURWX0RF
QlVHIGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9fRklYRURfTUlOT1JfUkFOR0VTIGlzIG5v
dCBzZXQKQ09ORklHX1Y0TDJfRldOT0RFPW0KQ09ORklHX1Y0TDJfQVNZTkM9bQojIGVuZCBv
ZiBWaWRlbzRMaW51eCBvcHRpb25zCgojCiMgTWVkaWEgY29udHJvbGxlciBvcHRpb25zCiMK
Q09ORklHX01FRElBX0NPTlRST0xMRVJfRFZCPXkKIyBlbmQgb2YgTWVkaWEgY29udHJvbGxl
ciBvcHRpb25zCgojCiMgRGlnaXRhbCBUViBvcHRpb25zCiMKIyBDT05GSUdfRFZCX01NQVAg
aXMgbm90IHNldApDT05GSUdfRFZCX05FVD15CkNPTkZJR19EVkJfTUFYX0FEQVBURVJTPTE2
CkNPTkZJR19EVkJfRFlOQU1JQ19NSU5PUlM9eQojIENPTkZJR19EVkJfREVNVVhfU0VDVElP
Tl9MT1NTX0xPRyBpcyBub3Qgc2V0CiMgQ09ORklHX0RWQl9VTEVfREVCVUcgaXMgbm90IHNl
dAojIGVuZCBvZiBEaWdpdGFsIFRWIG9wdGlvbnMKCiMKIyBNZWRpYSBkcml2ZXJzCiMKCiMK
IyBEcml2ZXJzIGZpbHRlcmVkIGFzIHNlbGVjdGVkIGF0ICdGaWx0ZXIgbWVkaWEgZHJpdmVy
cycKIwoKIwojIE1lZGlhIGRyaXZlcnMKIwpDT05GSUdfTUVESUFfVVNCX1NVUFBPUlQ9eQoK
IwojIFdlYmNhbSBkZXZpY2VzCiMKIyBDT05GSUdfVVNCX0dTUENBIGlzIG5vdCBzZXQKIyBD
T05GSUdfVVNCX1BXQyBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9TMjI1NSBpcyBub3Qgc2V0
CiMgQ09ORklHX1ZJREVPX1VTQlRWIGlzIG5vdCBzZXQKQ09ORklHX1VTQl9WSURFT19DTEFT
Uz1tCkNPTkZJR19VU0JfVklERU9fQ0xBU1NfSU5QVVRfRVZERVY9eQoKIwojIEFuYWxvZyBU
ViBVU0IgZGV2aWNlcwojCiMgQ09ORklHX1ZJREVPX0dPNzAwNyBpcyBub3Qgc2V0CiMgQ09O
RklHX1ZJREVPX0hEUFZSIGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9fUFZSVVNCMiBpcyBu
b3Qgc2V0CiMgQ09ORklHX1ZJREVPX1NUSzExNjAgaXMgbm90IHNldAoKIwojIEFuYWxvZy9k
aWdpdGFsIFRWIFVTQiBkZXZpY2VzCiMKIyBDT05GSUdfVklERU9fQVUwODI4IGlzIG5vdCBz
ZXQKIyBDT05GSUdfVklERU9fQ1gyMzFYWCBpcyBub3Qgc2V0CgojCiMgRGlnaXRhbCBUViBV
U0IgZGV2aWNlcwojCiMgQ09ORklHX0RWQl9BUzEwMiBpcyBub3Qgc2V0CiMgQ09ORklHX0RW
Ql9CMkMyX0ZMRVhDT1BfVVNCIGlzIG5vdCBzZXQKIyBDT05GSUdfRFZCX1VTQl9WMiBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NNU19VU0JfRFJWIGlzIG5vdCBzZXQKIyBDT05GSUdfRFZCX1RU
VVNCX0JVREdFVCBpcyBub3Qgc2V0CiMgQ09ORklHX0RWQl9UVFVTQl9ERUMgaXMgbm90IHNl
dAoKIwojIFdlYmNhbSwgVFYgKGFuYWxvZy9kaWdpdGFsKSBVU0IgZGV2aWNlcwojCiMgQ09O
RklHX1ZJREVPX0VNMjhYWCBpcyBub3Qgc2V0CkNPTkZJR19NRURJQV9QQ0lfU1VQUE9SVD15
CgojCiMgTWVkaWEgY2FwdHVyZSBzdXBwb3J0CiMKIyBDT05GSUdfVklERU9fU09MTzZYMTAg
aXMgbm90IHNldAojIENPTkZJR19WSURFT19UVzU4NjQgaXMgbm90IHNldAojIENPTkZJR19W
SURFT19UVzY4IGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9fVFc2ODZYIGlzIG5vdCBzZXQK
IyBDT05GSUdfVklERU9fWk9SQU4gaXMgbm90IHNldAoKIwojIE1lZGlhIGNhcHR1cmUvYW5h
bG9nIFRWIHN1cHBvcnQKIwojIENPTkZJR19WSURFT19EVDMxNTUgaXMgbm90IHNldAojIENP
TkZJR19WSURFT19IRVhJVU1fR0VNSU5JIGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9fSEVY
SVVNX09SSU9OIGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9fTVhCIGlzIG5vdCBzZXQKCiMK
IyBNZWRpYSBjYXB0dXJlL2FuYWxvZy9oeWJyaWQgVFYgc3VwcG9ydAojCiMgQ09ORklHX1ZJ
REVPX0NYMjU4MjEgaXMgbm90IHNldAojIENPTkZJR19WSURFT19TQUE3MTM0IGlzIG5vdCBz
ZXQKIyBDT05GSUdfVklERU9fU0FBNzE2NCBpcyBub3Qgc2V0CgojCiMgTWVkaWEgZGlnaXRh
bCBUViBQQ0kgQWRhcHRlcnMKIwojIENPTkZJR19EVkJfQjJDMl9GTEVYQ09QX1BDSSBpcyBu
b3Qgc2V0CiMgQ09ORklHX0RWQl9EREJSSURHRSBpcyBub3Qgc2V0CiMgQ09ORklHX0RWQl9O
RVRVUF9VTklEVkIgaXMgbm90IHNldAojIENPTkZJR19EVkJfTkdFTkUgaXMgbm90IHNldAoj
IENPTkZJR19EVkJfUExVVE8yIGlzIG5vdCBzZXQKIyBDT05GSUdfRFZCX1BUMSBpcyBub3Qg
c2V0CiMgQ09ORklHX0RWQl9QVDMgaXMgbm90IHNldAojIENPTkZJR19EVkJfQlVER0VUX0NP
UkUgaXMgbm90IHNldAojIENPTkZJR19WSURFT19JUFUzX0NJTzIgaXMgbm90IHNldApDT05G
SUdfUkFESU9fQURBUFRFUlM9bQojIENPTkZJR19SQURJT19NQVhJUkFESU8gaXMgbm90IHNl
dAojIENPTkZJR19SQURJT19TQUE3NzA2SCBpcyBub3Qgc2V0CiMgQ09ORklHX1JBRElPX1NI
QVJLIGlzIG5vdCBzZXQKIyBDT05GSUdfUkFESU9fU0hBUksyIGlzIG5vdCBzZXQKIyBDT05G
SUdfUkFESU9fU0k0NzEzIGlzIG5vdCBzZXQKIyBDT05GSUdfUkFESU9fVEVBNTc2NCBpcyBu
b3Qgc2V0CiMgQ09ORklHX1JBRElPX1RFRjY4NjIgaXMgbm90IHNldAojIENPTkZJR19SQURJ
T19XTDEyNzMgaXMgbm90IHNldAojIENPTkZJR19VU0JfRFNCUiBpcyBub3Qgc2V0CiMgQ09O
RklHX1VTQl9LRUVORSBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9NQTkwMSBpcyBub3Qgc2V0
CiMgQ09ORklHX1VTQl9NUjgwMCBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9SQVJFTU9OTyBp
cyBub3Qgc2V0CiMgQ09ORklHX1JBRElPX1NJNDcwWCBpcyBub3Qgc2V0CkNPTkZJR19NRURJ
QV9QTEFURk9STV9EUklWRVJTPXkKIyBDT05GSUdfVjRMX1BMQVRGT1JNX0RSSVZFUlMgaXMg
bm90IHNldAojIENPTkZJR19EVkJfUExBVEZPUk1fRFJJVkVSUyBpcyBub3Qgc2V0CkNPTkZJ
R19WNExfTUVNMk1FTV9EUklWRVJTPXkKIyBDT05GSUdfVklERU9fTUVNMk1FTV9ERUlOVEVS
TEFDRSBpcyBub3Qgc2V0CgojCiMgQWxsZWdybyBEVlQgbWVkaWEgcGxhdGZvcm0gZHJpdmVy
cwojCgojCiMgQW1sb2dpYyBtZWRpYSBwbGF0Zm9ybSBkcml2ZXJzCiMKCiMKIyBBbXBoaW9u
IGRyaXZlcnMKIwoKIwojIEFzcGVlZCBtZWRpYSBwbGF0Zm9ybSBkcml2ZXJzCiMKCiMKIyBB
dG1lbCBtZWRpYSBwbGF0Zm9ybSBkcml2ZXJzCiMKCiMKIyBDYWRlbmNlIG1lZGlhIHBsYXRm
b3JtIGRyaXZlcnMKIwojIENPTkZJR19WSURFT19DQURFTkNFX0NTSTJSWCBpcyBub3Qgc2V0
CiMgQ09ORklHX1ZJREVPX0NBREVOQ0VfQ1NJMlRYIGlzIG5vdCBzZXQKCiMKIyBDaGlwcyZN
ZWRpYSBtZWRpYSBwbGF0Zm9ybSBkcml2ZXJzCiMKCiMKIyBJbnRlbCBtZWRpYSBwbGF0Zm9y
bSBkcml2ZXJzCiMKCiMKIyBNYXJ2ZWxsIG1lZGlhIHBsYXRmb3JtIGRyaXZlcnMKIwoKIwoj
IE1lZGlhdGVrIG1lZGlhIHBsYXRmb3JtIGRyaXZlcnMKIwoKIwojIE1pY3JvY2hpcCBUZWNo
bm9sb2d5LCBJbmMuIG1lZGlhIHBsYXRmb3JtIGRyaXZlcnMKIwoKIwojIE5WaWRpYSBtZWRp
YSBwbGF0Zm9ybSBkcml2ZXJzCiMKCiMKIyBOWFAgbWVkaWEgcGxhdGZvcm0gZHJpdmVycwoj
CgojCiMgUXVhbGNvbW0gbWVkaWEgcGxhdGZvcm0gZHJpdmVycwojCgojCiMgUmVuZXNhcyBt
ZWRpYSBwbGF0Zm9ybSBkcml2ZXJzCiMKCiMKIyBSb2NrY2hpcCBtZWRpYSBwbGF0Zm9ybSBk
cml2ZXJzCiMKCiMKIyBTYW1zdW5nIG1lZGlhIHBsYXRmb3JtIGRyaXZlcnMKIwoKIwojIFNU
TWljcm9lbGVjdHJvbmljcyBtZWRpYSBwbGF0Zm9ybSBkcml2ZXJzCiMKCiMKIyBTdW54aSBt
ZWRpYSBwbGF0Zm9ybSBkcml2ZXJzCiMKCiMKIyBUZXhhcyBJbnN0cnVtZW50cyBkcml2ZXJz
CiMKCiMKIyBWZXJpc2lsaWNvbiBtZWRpYSBwbGF0Zm9ybSBkcml2ZXJzCiMKCiMKIyBWSUEg
bWVkaWEgcGxhdGZvcm0gZHJpdmVycwojCgojCiMgWGlsaW54IG1lZGlhIHBsYXRmb3JtIGRy
aXZlcnMKIwpDT05GSUdfVVZDX0NPTU1PTj1tCkNPTkZJR19WSURFT0JVRjJfQ09SRT1tCkNP
TkZJR19WSURFT0JVRjJfVjRMMj1tCkNPTkZJR19WSURFT0JVRjJfTUVNT1BTPW0KQ09ORklH
X1ZJREVPQlVGMl9WTUFMTE9DPW0KIyBlbmQgb2YgTWVkaWEgZHJpdmVycwoKIwojIE1lZGlh
IGFuY2lsbGFyeSBkcml2ZXJzCiMKQ09ORklHX01FRElBX0FUVEFDSD15CkNPTkZJR19WSURF
T19DQU1FUkFfU0VOU09SPXkKIyBDT05GSUdfVklERU9fQVIwNTIxIGlzIG5vdCBzZXQKIyBD
T05GSUdfVklERU9fSEk1NTYgaXMgbm90IHNldAojIENPTkZJR19WSURFT19ISTg0NiBpcyBu
b3Qgc2V0CiMgQ09ORklHX1ZJREVPX0hJODQ3IGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9f
SU1YMjA4IGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9fSU1YMjE0IGlzIG5vdCBzZXQKIyBD
T05GSUdfVklERU9fSU1YMjE5IGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9fSU1YMjU4IGlz
IG5vdCBzZXQKIyBDT05GSUdfVklERU9fSU1YMjc0IGlzIG5vdCBzZXQKIyBDT05GSUdfVklE
RU9fSU1YMjkwIGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9fSU1YMjk2IGlzIG5vdCBzZXQK
IyBDT05GSUdfVklERU9fSU1YMzE5IGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9fSU1YMzU1
IGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9fTVQ5TTAwMSBpcyBub3Qgc2V0CiMgQ09ORklH
X1ZJREVPX01UOU0xMTEgaXMgbm90IHNldAojIENPTkZJR19WSURFT19NVDlQMDMxIGlzIG5v
dCBzZXQKIyBDT05GSUdfVklERU9fTVQ5VDExMiBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVP
X01UOVYwMTEgaXMgbm90IHNldAojIENPTkZJR19WSURFT19NVDlWMDMyIGlzIG5vdCBzZXQK
IyBDT05GSUdfVklERU9fTVQ5VjExMSBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX09HMDFB
MUIgaXMgbm90IHNldAojIENPTkZJR19WSURFT19PVjAxQTEwIGlzIG5vdCBzZXQKIyBDT05G
SUdfVklERU9fT1YwMkExMCBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX09WMDhEMTAgaXMg
bm90IHNldAojIENPTkZJR19WSURFT19PVjA4WDQwIGlzIG5vdCBzZXQKIyBDT05GSUdfVklE
RU9fT1YxMzg1OCBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX09WMTNCMTAgaXMgbm90IHNl
dAojIENPTkZJR19WSURFT19PVjI2NDAgaXMgbm90IHNldAojIENPTkZJR19WSURFT19PVjI2
NTkgaXMgbm90IHNldAojIENPTkZJR19WSURFT19PVjI2ODAgaXMgbm90IHNldAojIENPTkZJ
R19WSURFT19PVjI2ODUgaXMgbm90IHNldAojIENPTkZJR19WSURFT19PVjI3NDAgaXMgbm90
IHNldAojIENPTkZJR19WSURFT19PVjQ2ODkgaXMgbm90IHNldAojIENPTkZJR19WSURFT19P
VjU2NDcgaXMgbm90IHNldAojIENPTkZJR19WSURFT19PVjU2NDggaXMgbm90IHNldAojIENP
TkZJR19WSURFT19PVjU2NzAgaXMgbm90IHNldAojIENPTkZJR19WSURFT19PVjU2NzUgaXMg
bm90IHNldAojIENPTkZJR19WSURFT19PVjU2OTMgaXMgbm90IHNldAojIENPTkZJR19WSURF
T19PVjU2OTUgaXMgbm90IHNldAojIENPTkZJR19WSURFT19PVjY2NTAgaXMgbm90IHNldAoj
IENPTkZJR19WSURFT19PVjcyNTEgaXMgbm90IHNldAojIENPTkZJR19WSURFT19PVjc2NDAg
aXMgbm90IHNldAojIENPTkZJR19WSURFT19PVjc2NzAgaXMgbm90IHNldAojIENPTkZJR19W
SURFT19PVjc3MlggaXMgbm90IHNldAojIENPTkZJR19WSURFT19PVjc3NDAgaXMgbm90IHNl
dAojIENPTkZJR19WSURFT19PVjg4NTYgaXMgbm90IHNldAojIENPTkZJR19WSURFT19PVjg4
NTggaXMgbm90IHNldAojIENPTkZJR19WSURFT19PVjg4NjUgaXMgbm90IHNldAojIENPTkZJ
R19WSURFT19PVjk2NDAgaXMgbm90IHNldAojIENPTkZJR19WSURFT19PVjk2NTAgaXMgbm90
IHNldAojIENPTkZJR19WSURFT19PVjk3MzQgaXMgbm90IHNldAojIENPTkZJR19WSURFT19S
REFDTTIwIGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9fUkRBQ00yMSBpcyBub3Qgc2V0CiMg
Q09ORklHX1ZJREVPX1JKNTROMSBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX1M1QzczTTMg
aXMgbm90IHNldAojIENPTkZJR19WSURFT19TNUs1QkFGIGlzIG5vdCBzZXQKIyBDT05GSUdf
VklERU9fUzVLNkEzIGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9fQ0NTIGlzIG5vdCBzZXQK
IyBDT05GSUdfVklERU9fRVQ4RUs4IGlzIG5vdCBzZXQKCiMKIyBMZW5zIGRyaXZlcnMKIwoj
IENPTkZJR19WSURFT19BRDU4MjAgaXMgbm90IHNldAojIENPTkZJR19WSURFT19BSzczNzUg
aXMgbm90IHNldAojIENPTkZJR19WSURFT19EVzk3MTQgaXMgbm90IHNldAojIENPTkZJR19W
SURFT19EVzk3NjggaXMgbm90IHNldAojIENPTkZJR19WSURFT19EVzk4MDdfVkNNIGlzIG5v
dCBzZXQKIyBlbmQgb2YgTGVucyBkcml2ZXJzCgojCiMgRmxhc2ggZGV2aWNlcwojCiMgQ09O
RklHX1ZJREVPX0FEUDE2NTMgaXMgbm90IHNldAojIENPTkZJR19WSURFT19MTTM1NjAgaXMg
bm90IHNldAojIENPTkZJR19WSURFT19MTTM2NDYgaXMgbm90IHNldAojIGVuZCBvZiBGbGFz
aCBkZXZpY2VzCgojCiMgQXVkaW8gZGVjb2RlcnMsIHByb2Nlc3NvcnMgYW5kIG1peGVycwoj
CiMgQ09ORklHX1ZJREVPX0NTMzMwOCBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX0NTNTM0
NSBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX0NTNTNMMzJBIGlzIG5vdCBzZXQKIyBDT05G
SUdfVklERU9fTVNQMzQwMCBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX1NPTllfQlRGX01Q
WCBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX1REQTE5OTdYIGlzIG5vdCBzZXQKIyBDT05G
SUdfVklERU9fVERBNzQzMiBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX1REQTk4NDAgaXMg
bm90IHNldAojIENPTkZJR19WSURFT19URUE2NDE1QyBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJ
REVPX1RFQTY0MjAgaXMgbm90IHNldAojIENPTkZJR19WSURFT19UTFYzMjBBSUMyM0IgaXMg
bm90IHNldAojIENPTkZJR19WSURFT19UVkFVRElPIGlzIG5vdCBzZXQKIyBDT05GSUdfVklE
RU9fVURBMTM0MiBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX1ZQMjdTTVBYIGlzIG5vdCBz
ZXQKIyBDT05GSUdfVklERU9fV004NzM5IGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9fV004
Nzc1IGlzIG5vdCBzZXQKIyBlbmQgb2YgQXVkaW8gZGVjb2RlcnMsIHByb2Nlc3NvcnMgYW5k
IG1peGVycwoKIwojIFJEUyBkZWNvZGVycwojCiMgQ09ORklHX1ZJREVPX1NBQTY1ODggaXMg
bm90IHNldAojIGVuZCBvZiBSRFMgZGVjb2RlcnMKCiMKIyBWaWRlbyBkZWNvZGVycwojCiMg
Q09ORklHX1ZJREVPX0FEVjcxODAgaXMgbm90IHNldAojIENPTkZJR19WSURFT19BRFY3MTgz
IGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9fQURWNzYwNCBpcyBub3Qgc2V0CiMgQ09ORklH
X1ZJREVPX0FEVjc4NDIgaXMgbm90IHNldAojIENPTkZJR19WSURFT19CVDgxOSBpcyBub3Qg
c2V0CiMgQ09ORklHX1ZJREVPX0JUODU2IGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9fQlQ4
NjYgaXMgbm90IHNldAojIENPTkZJR19WSURFT19LUzAxMjcgaXMgbm90IHNldAojIENPTkZJ
R19WSURFT19NTDg2Vjc2NjcgaXMgbm90IHNldAojIENPTkZJR19WSURFT19TQUE3MTEwIGlz
IG5vdCBzZXQKIyBDT05GSUdfVklERU9fU0FBNzExWCBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJ
REVPX1RDMzU4NzQzIGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9fVEMzNTg3NDYgaXMgbm90
IHNldAojIENPTkZJR19WSURFT19UVlA1MTRYIGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9f
VFZQNTE1MCBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX1RWUDcwMDIgaXMgbm90IHNldAoj
IENPTkZJR19WSURFT19UVzI4MDQgaXMgbm90IHNldAojIENPTkZJR19WSURFT19UVzk5MDMg
aXMgbm90IHNldAojIENPTkZJR19WSURFT19UVzk5MDYgaXMgbm90IHNldAojIENPTkZJR19W
SURFT19UVzk5MTAgaXMgbm90IHNldAojIENPTkZJR19WSURFT19WUFgzMjIwIGlzIG5vdCBz
ZXQKCiMKIyBWaWRlbyBhbmQgYXVkaW8gZGVjb2RlcnMKIwojIENPTkZJR19WSURFT19TQUE3
MTdYIGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9fQ1gyNTg0MCBpcyBub3Qgc2V0CiMgZW5k
IG9mIFZpZGVvIGRlY29kZXJzCgojCiMgVmlkZW8gZW5jb2RlcnMKIwojIENPTkZJR19WSURF
T19BRFY3MTcwIGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9fQURWNzE3NSBpcyBub3Qgc2V0
CiMgQ09ORklHX1ZJREVPX0FEVjczNDMgaXMgbm90IHNldAojIENPTkZJR19WSURFT19BRFY3
MzkzIGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9fQURWNzUxMSBpcyBub3Qgc2V0CiMgQ09O
RklHX1ZJREVPX0FLODgxWCBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX1NBQTcxMjcgaXMg
bm90IHNldAojIENPTkZJR19WSURFT19TQUE3MTg1IGlzIG5vdCBzZXQKIyBDT05GSUdfVklE
RU9fVEhTODIwMCBpcyBub3Qgc2V0CiMgZW5kIG9mIFZpZGVvIGVuY29kZXJzCgojCiMgVmlk
ZW8gaW1wcm92ZW1lbnQgY2hpcHMKIwojIENPTkZJR19WSURFT19VUEQ2NDAzMUEgaXMgbm90
IHNldAojIENPTkZJR19WSURFT19VUEQ2NDA4MyBpcyBub3Qgc2V0CiMgZW5kIG9mIFZpZGVv
IGltcHJvdmVtZW50IGNoaXBzCgojCiMgQXVkaW8vVmlkZW8gY29tcHJlc3Npb24gY2hpcHMK
IwojIENPTkZJR19WSURFT19TQUE2NzUySFMgaXMgbm90IHNldAojIGVuZCBvZiBBdWRpby9W
aWRlbyBjb21wcmVzc2lvbiBjaGlwcwoKIwojIFNEUiB0dW5lciBjaGlwcwojCiMgZW5kIG9m
IFNEUiB0dW5lciBjaGlwcwoKIwojIE1pc2NlbGxhbmVvdXMgaGVscGVyIGNoaXBzCiMKIyBD
T05GSUdfVklERU9fSTJDIGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9fTTUyNzkwIGlzIG5v
dCBzZXQKIyBDT05GSUdfVklERU9fU1RfTUlQSUQwMiBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJ
REVPX1RIUzczMDMgaXMgbm90IHNldAojIGVuZCBvZiBNaXNjZWxsYW5lb3VzIGhlbHBlciBj
aGlwcwoKIwojIE1lZGlhIFNQSSBBZGFwdGVycwojCiMgQ09ORklHX0NYRDI4ODBfU1BJX0RS
ViBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX0dTMTY2MiBpcyBub3Qgc2V0CiMgZW5kIG9m
IE1lZGlhIFNQSSBBZGFwdGVycwoKQ09ORklHX01FRElBX1RVTkVSPW0KCiMKIyBDdXN0b21p
emUgVFYgdHVuZXJzCiMKIyBDT05GSUdfTUVESUFfVFVORVJfRTQwMDAgaXMgbm90IHNldAoj
IENPTkZJR19NRURJQV9UVU5FUl9GQzAwMTEgaXMgbm90IHNldAojIENPTkZJR19NRURJQV9U
VU5FUl9GQzAwMTIgaXMgbm90IHNldAojIENPTkZJR19NRURJQV9UVU5FUl9GQzAwMTMgaXMg
bm90IHNldAojIENPTkZJR19NRURJQV9UVU5FUl9GQzI1ODAgaXMgbm90IHNldAojIENPTkZJ
R19NRURJQV9UVU5FUl9JVDkxM1ggaXMgbm90IHNldAojIENPTkZJR19NRURJQV9UVU5FUl9N
ODhSUzYwMDBUIGlzIG5vdCBzZXQKIyBDT05GSUdfTUVESUFfVFVORVJfTUFYMjE2NSBpcyBu
b3Qgc2V0CkNPTkZJR19NRURJQV9UVU5FUl9NQzQ0UzgwMz1tCiMgQ09ORklHX01FRElBX1RV
TkVSX01TSTAwMSBpcyBub3Qgc2V0CiMgQ09ORklHX01FRElBX1RVTkVSX01UMjA2MCBpcyBu
b3Qgc2V0CiMgQ09ORklHX01FRElBX1RVTkVSX01UMjA2MyBpcyBub3Qgc2V0CkNPTkZJR19N
RURJQV9UVU5FUl9NVDIwWFg9bQojIENPTkZJR19NRURJQV9UVU5FUl9NVDIxMzEgaXMgbm90
IHNldAojIENPTkZJR19NRURJQV9UVU5FUl9NVDIyNjYgaXMgbm90IHNldAojIENPTkZJR19N
RURJQV9UVU5FUl9NWEwzMDFSRiBpcyBub3Qgc2V0CiMgQ09ORklHX01FRElBX1RVTkVSX01Y
TDUwMDVTIGlzIG5vdCBzZXQKIyBDT05GSUdfTUVESUFfVFVORVJfTVhMNTAwN1QgaXMgbm90
IHNldAojIENPTkZJR19NRURJQV9UVU5FUl9RTTFEMUIwMDA0IGlzIG5vdCBzZXQKIyBDT05G
SUdfTUVESUFfVFVORVJfUU0xRDFDMDA0MiBpcyBub3Qgc2V0CiMgQ09ORklHX01FRElBX1RV
TkVSX1FUMTAxMCBpcyBub3Qgc2V0CiMgQ09ORklHX01FRElBX1RVTkVSX1I4MjBUIGlzIG5v
dCBzZXQKIyBDT05GSUdfTUVESUFfVFVORVJfU0kyMTU3IGlzIG5vdCBzZXQKQ09ORklHX01F
RElBX1RVTkVSX1NJTVBMRT1tCiMgQ09ORklHX01FRElBX1RVTkVSX1REQTE4MjEyIGlzIG5v
dCBzZXQKIyBDT05GSUdfTUVESUFfVFVORVJfVERBMTgyMTggaXMgbm90IHNldAojIENPTkZJ
R19NRURJQV9UVU5FUl9UREExODI1MCBpcyBub3Qgc2V0CkNPTkZJR19NRURJQV9UVU5FUl9U
REExODI3MT1tCkNPTkZJR19NRURJQV9UVU5FUl9UREE4MjdYPW0KQ09ORklHX01FRElBX1RV
TkVSX1REQTgyOTA9bQpDT05GSUdfTUVESUFfVFVORVJfVERBOTg4Nz1tCkNPTkZJR19NRURJ
QV9UVU5FUl9URUE1NzYxPW0KQ09ORklHX01FRElBX1RVTkVSX1RFQTU3Njc9bQojIENPTkZJ
R19NRURJQV9UVU5FUl9UVUE5MDAxIGlzIG5vdCBzZXQKQ09ORklHX01FRElBX1RVTkVSX1hD
MjAyOD1tCkNPTkZJR19NRURJQV9UVU5FUl9YQzQwMDA9bQpDT05GSUdfTUVESUFfVFVORVJf
WEM1MDAwPW0KIyBlbmQgb2YgQ3VzdG9taXplIFRWIHR1bmVycwoKIwojIEN1c3RvbWlzZSBE
VkIgRnJvbnRlbmRzCiMKCiMKIyBNdWx0aXN0YW5kYXJkIChzYXRlbGxpdGUpIGZyb250ZW5k
cwojCiMgQ09ORklHX0RWQl9NODhEUzMxMDMgaXMgbm90IHNldAojIENPTkZJR19EVkJfTVhM
NVhYIGlzIG5vdCBzZXQKIyBDT05GSUdfRFZCX1NUQjA4OTkgaXMgbm90IHNldAojIENPTkZJ
R19EVkJfU1RCNjEwMCBpcyBub3Qgc2V0CiMgQ09ORklHX0RWQl9TVFYwOTB4IGlzIG5vdCBz
ZXQKIyBDT05GSUdfRFZCX1NUVjA5MTAgaXMgbm90IHNldAojIENPTkZJR19EVkJfU1RWNjEx
MHggaXMgbm90IHNldAojIENPTkZJR19EVkJfU1RWNjExMSBpcyBub3Qgc2V0CgojCiMgTXVs
dGlzdGFuZGFyZCAoY2FibGUgKyB0ZXJyZXN0cmlhbCkgZnJvbnRlbmRzCiMKIyBDT05GSUdf
RFZCX0RSWEsgaXMgbm90IHNldAojIENPTkZJR19EVkJfTU44ODQ3MiBpcyBub3Qgc2V0CiMg
Q09ORklHX0RWQl9NTjg4NDczIGlzIG5vdCBzZXQKIyBDT05GSUdfRFZCX1NJMjE2NSBpcyBu
b3Qgc2V0CiMgQ09ORklHX0RWQl9UREExODI3MUMyREQgaXMgbm90IHNldAoKIwojIERWQi1T
IChzYXRlbGxpdGUpIGZyb250ZW5kcwojCiMgQ09ORklHX0RWQl9DWDI0MTEwIGlzIG5vdCBz
ZXQKIyBDT05GSUdfRFZCX0NYMjQxMTYgaXMgbm90IHNldAojIENPTkZJR19EVkJfQ1gyNDEx
NyBpcyBub3Qgc2V0CiMgQ09ORklHX0RWQl9DWDI0MTIwIGlzIG5vdCBzZXQKIyBDT05GSUdf
RFZCX0NYMjQxMjMgaXMgbm90IHNldAojIENPTkZJR19EVkJfRFMzMDAwIGlzIG5vdCBzZXQK
IyBDT05GSUdfRFZCX01CODZBMTYgaXMgbm90IHNldAojIENPTkZJR19EVkJfTVQzMTIgaXMg
bm90IHNldAojIENPTkZJR19EVkJfUzVIMTQyMCBpcyBub3Qgc2V0CiMgQ09ORklHX0RWQl9T
STIxWFggaXMgbm90IHNldAojIENPTkZJR19EVkJfU1RCNjAwMCBpcyBub3Qgc2V0CiMgQ09O
RklHX0RWQl9TVFYwMjg4IGlzIG5vdCBzZXQKIyBDT05GSUdfRFZCX1NUVjAyOTkgaXMgbm90
IHNldAojIENPTkZJR19EVkJfU1RWMDkwMCBpcyBub3Qgc2V0CiMgQ09ORklHX0RWQl9TVFY2
MTEwIGlzIG5vdCBzZXQKIyBDT05GSUdfRFZCX1REQTEwMDcxIGlzIG5vdCBzZXQKIyBDT05G
SUdfRFZCX1REQTEwMDg2IGlzIG5vdCBzZXQKIyBDT05GSUdfRFZCX1REQTgwODMgaXMgbm90
IHNldAojIENPTkZJR19EVkJfVERBODI2MSBpcyBub3Qgc2V0CiMgQ09ORklHX0RWQl9UREE4
MjZYIGlzIG5vdCBzZXQKIyBDT05GSUdfRFZCX1RTMjAyMCBpcyBub3Qgc2V0CiMgQ09ORklH
X0RWQl9UVUE2MTAwIGlzIG5vdCBzZXQKIyBDT05GSUdfRFZCX1RVTkVSX0NYMjQxMTMgaXMg
bm90IHNldAojIENPTkZJR19EVkJfVFVORVJfSVREMTAwMCBpcyBub3Qgc2V0CiMgQ09ORklH
X0RWQl9WRVMxWDkzIGlzIG5vdCBzZXQKIyBDT05GSUdfRFZCX1pMMTAwMzYgaXMgbm90IHNl
dAojIENPTkZJR19EVkJfWkwxMDAzOSBpcyBub3Qgc2V0CgojCiMgRFZCLVQgKHRlcnJlc3Ry
aWFsKSBmcm9udGVuZHMKIwojIENPTkZJR19EVkJfQUY5MDEzIGlzIG5vdCBzZXQKIyBDT05G
SUdfRFZCX0NYMjI3MDAgaXMgbm90IHNldAojIENPTkZJR19EVkJfQ1gyMjcwMiBpcyBub3Qg
c2V0CiMgQ09ORklHX0RWQl9DWEQyODIwUiBpcyBub3Qgc2V0CiMgQ09ORklHX0RWQl9DWEQy
ODQxRVIgaXMgbm90IHNldAojIENPTkZJR19EVkJfRElCMzAwME1CIGlzIG5vdCBzZXQKIyBD
T05GSUdfRFZCX0RJQjMwMDBNQyBpcyBub3Qgc2V0CiMgQ09ORklHX0RWQl9ESUI3MDAwTSBp
cyBub3Qgc2V0CiMgQ09ORklHX0RWQl9ESUI3MDAwUCBpcyBub3Qgc2V0CiMgQ09ORklHX0RW
Ql9ESUI5MDAwIGlzIG5vdCBzZXQKIyBDT05GSUdfRFZCX0RSWEQgaXMgbm90IHNldAojIENP
TkZJR19EVkJfRUMxMDAgaXMgbm90IHNldAojIENPTkZJR19EVkJfTDY0NzgxIGlzIG5vdCBz
ZXQKIyBDT05GSUdfRFZCX01UMzUyIGlzIG5vdCBzZXQKIyBDT05GSUdfRFZCX05YVDYwMDAg
aXMgbm90IHNldAojIENPTkZJR19EVkJfUlRMMjgzMCBpcyBub3Qgc2V0CiMgQ09ORklHX0RW
Ql9SVEwyODMyIGlzIG5vdCBzZXQKIyBDT05GSUdfRFZCX1M1SDE0MzIgaXMgbm90IHNldAoj
IENPTkZJR19EVkJfU0kyMTY4IGlzIG5vdCBzZXQKIyBDT05GSUdfRFZCX1NQODg3WCBpcyBu
b3Qgc2V0CiMgQ09ORklHX0RWQl9TVFYwMzY3IGlzIG5vdCBzZXQKIyBDT05GSUdfRFZCX1RE
QTEwMDQ4IGlzIG5vdCBzZXQKIyBDT05GSUdfRFZCX1REQTEwMDRYIGlzIG5vdCBzZXQKIyBD
T05GSUdfRFZCX1pEMTMwMV9ERU1PRCBpcyBub3Qgc2V0CiMgQ09ORklHX0RWQl9aTDEwMzUz
IGlzIG5vdCBzZXQKIyBDT05GSUdfRFZCX0NYRDI4ODAgaXMgbm90IHNldAoKIwojIERWQi1D
IChjYWJsZSkgZnJvbnRlbmRzCiMKIyBDT05GSUdfRFZCX1NUVjAyOTcgaXMgbm90IHNldAoj
IENPTkZJR19EVkJfVERBMTAwMjEgaXMgbm90IHNldAojIENPTkZJR19EVkJfVERBMTAwMjMg
aXMgbm90IHNldAojIENPTkZJR19EVkJfVkVTMTgyMCBpcyBub3Qgc2V0CgojCiMgQVRTQyAo
Tm9ydGggQW1lcmljYW4vS29yZWFuIFRlcnJlc3RyaWFsL0NhYmxlIERUVikgZnJvbnRlbmRz
CiMKIyBDT05GSUdfRFZCX0FVODUyMl9EVFYgaXMgbm90IHNldAojIENPTkZJR19EVkJfQVU4
NTIyX1Y0TCBpcyBub3Qgc2V0CiMgQ09ORklHX0RWQl9CQ00zNTEwIGlzIG5vdCBzZXQKIyBD
T05GSUdfRFZCX0xHMjE2MCBpcyBub3Qgc2V0CiMgQ09ORklHX0RWQl9MR0RUMzMwNSBpcyBu
b3Qgc2V0CiMgQ09ORklHX0RWQl9MR0RUMzMwNkEgaXMgbm90IHNldAojIENPTkZJR19EVkJf
TEdEVDMzMFggaXMgbm90IHNldAojIENPTkZJR19EVkJfTVhMNjkyIGlzIG5vdCBzZXQKIyBD
T05GSUdfRFZCX05YVDIwMFggaXMgbm90IHNldAojIENPTkZJR19EVkJfT1I1MTEzMiBpcyBu
b3Qgc2V0CiMgQ09ORklHX0RWQl9PUjUxMjExIGlzIG5vdCBzZXQKIyBDT05GSUdfRFZCX1M1
SDE0MDkgaXMgbm90IHNldAojIENPTkZJR19EVkJfUzVIMTQxMSBpcyBub3Qgc2V0CgojCiMg
SVNEQi1UICh0ZXJyZXN0cmlhbCkgZnJvbnRlbmRzCiMKIyBDT05GSUdfRFZCX0RJQjgwMDAg
aXMgbm90IHNldAojIENPTkZJR19EVkJfTUI4NkEyMFMgaXMgbm90IHNldAojIENPTkZJR19E
VkJfUzkyMSBpcyBub3Qgc2V0CgojCiMgSVNEQi1TIChzYXRlbGxpdGUpICYgSVNEQi1UICh0
ZXJyZXN0cmlhbCkgZnJvbnRlbmRzCiMKIyBDT05GSUdfRFZCX01OODg0NDNYIGlzIG5vdCBz
ZXQKIyBDT05GSUdfRFZCX1RDOTA1MjIgaXMgbm90IHNldAoKIwojIERpZ2l0YWwgdGVycmVz
dHJpYWwgb25seSB0dW5lcnMvUExMCiMKIyBDT05GSUdfRFZCX1BMTCBpcyBub3Qgc2V0CiMg
Q09ORklHX0RWQl9UVU5FUl9ESUIwMDcwIGlzIG5vdCBzZXQKIyBDT05GSUdfRFZCX1RVTkVS
X0RJQjAwOTAgaXMgbm90IHNldAoKIwojIFNFQyBjb250cm9sIGRldmljZXMgZm9yIERWQi1T
CiMKIyBDT05GSUdfRFZCX0E4MjkzIGlzIG5vdCBzZXQKIyBDT05GSUdfRFZCX0FGOTAzMyBp
cyBub3Qgc2V0CiMgQ09ORklHX0RWQl9BU0NPVDJFIGlzIG5vdCBzZXQKIyBDT05GSUdfRFZC
X0FUQk04ODMwIGlzIG5vdCBzZXQKIyBDT05GSUdfRFZCX0hFTEVORSBpcyBub3Qgc2V0CiMg
Q09ORklHX0RWQl9IT1JVUzNBIGlzIG5vdCBzZXQKIyBDT05GSUdfRFZCX0lTTDY0MDUgaXMg
bm90IHNldAojIENPTkZJR19EVkJfSVNMNjQyMSBpcyBub3Qgc2V0CiMgQ09ORklHX0RWQl9J
U0w2NDIzIGlzIG5vdCBzZXQKIyBDT05GSUdfRFZCX0lYMjUwNVYgaXMgbm90IHNldAojIENP
TkZJR19EVkJfTEdTOEdMNSBpcyBub3Qgc2V0CiMgQ09ORklHX0RWQl9MR1M4R1hYIGlzIG5v
dCBzZXQKIyBDT05GSUdfRFZCX0xOQkgyNSBpcyBub3Qgc2V0CiMgQ09ORklHX0RWQl9MTkJI
MjkgaXMgbm90IHNldAojIENPTkZJR19EVkJfTE5CUDIxIGlzIG5vdCBzZXQKIyBDT05GSUdf
RFZCX0xOQlAyMiBpcyBub3Qgc2V0CiMgQ09ORklHX0RWQl9NODhSUzIwMDAgaXMgbm90IHNl
dAojIENPTkZJR19EVkJfVERBNjY1eCBpcyBub3Qgc2V0CiMgQ09ORklHX0RWQl9EUlgzOVhZ
SiBpcyBub3Qgc2V0CgojCiMgQ29tbW9uIEludGVyZmFjZSAoRU41MDIyMSkgY29udHJvbGxl
ciBkcml2ZXJzCiMKIyBDT05GSUdfRFZCX0NYRDIwOTkgaXMgbm90IHNldAojIENPTkZJR19E
VkJfU1AyIGlzIG5vdCBzZXQKIyBlbmQgb2YgQ3VzdG9taXNlIERWQiBGcm9udGVuZHMKIyBl
bmQgb2YgTWVkaWEgYW5jaWxsYXJ5IGRyaXZlcnMKCiMKIyBHcmFwaGljcyBzdXBwb3J0CiMK
Q09ORklHX0FQRVJUVVJFX0hFTFBFUlM9eQpDT05GSUdfVklERU9fQ01ETElORT15CkNPTkZJ
R19WSURFT19OT01PREVTRVQ9eQpDT05GSUdfQUdQPW0KIyBDT05GSUdfQUdQX0FNRDY0IGlz
IG5vdCBzZXQKIyBDT05GSUdfQUdQX0lOVEVMIGlzIG5vdCBzZXQKIyBDT05GSUdfQUdQX1NJ
UyBpcyBub3Qgc2V0CiMgQ09ORklHX0FHUF9WSUEgaXMgbm90IHNldAojIENPTkZJR19WR0Ff
U1dJVENIRVJPTyBpcyBub3Qgc2V0CkNPTkZJR19EUk09bQpDT05GSUdfRFJNX0tNU19IRUxQ
RVI9bQojIENPTkZJR19EUk1fREVCVUdfRFBfTVNUX1RPUE9MT0dZX1JFRlMgaXMgbm90IHNl
dAojIENPTkZJR19EUk1fREVCVUdfTU9ERVNFVF9MT0NLIGlzIG5vdCBzZXQKQ09ORklHX0RS
TV9GQkRFVl9FTVVMQVRJT049eQpDT05GSUdfRFJNX0ZCREVWX09WRVJBTExPQz0xMDAKIyBD
T05GSUdfRFJNX0ZCREVWX0xFQUtfUEhZU19TTUVNIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJN
X0xPQURfRURJRF9GSVJNV0FSRSBpcyBub3Qgc2V0CkNPTkZJR19EUk1fRElTUExBWV9IRUxQ
RVI9bQpDT05GSUdfRFJNX0RJU1BMQVlfRFBfSEVMUEVSPXkKQ09ORklHX0RSTV9ESVNQTEFZ
X0hEQ1BfSEVMUEVSPXkKQ09ORklHX0RSTV9ESVNQTEFZX0hETUlfSEVMUEVSPXkKQ09ORklH
X0RSTV9EUF9BVVhfQ0hBUkRFVj15CkNPTkZJR19EUk1fRFBfQ0VDPXkKQ09ORklHX0RSTV9U
VE09bQpDT05GSUdfRFJNX0JVRERZPW0KQ09ORklHX0RSTV9UVE1fSEVMUEVSPW0KQ09ORklH
X0RSTV9TVUJBTExPQ19IRUxQRVI9bQpDT05GSUdfRFJNX1NDSEVEPW0KCiMKIyBJMkMgZW5j
b2RlciBvciBoZWxwZXIgY2hpcHMKIwojIENPTkZJR19EUk1fSTJDX0NINzAwNiBpcyBub3Qg
c2V0CiMgQ09ORklHX0RSTV9JMkNfU0lMMTY0IGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX0ky
Q19OWFBfVERBOTk4WCBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9JMkNfTlhQX1REQTk5NTAg
aXMgbm90IHNldAojIGVuZCBvZiBJMkMgZW5jb2RlciBvciBoZWxwZXIgY2hpcHMKCiMKIyBB
Uk0gZGV2aWNlcwojCiMgZW5kIG9mIEFSTSBkZXZpY2VzCgojIENPTkZJR19EUk1fUkFERU9O
IGlzIG5vdCBzZXQKQ09ORklHX0RSTV9BTURHUFU9bQpDT05GSUdfRFJNX0FNREdQVV9TST15
CkNPTkZJR19EUk1fQU1ER1BVX0NJSz15CkNPTkZJR19EUk1fQU1ER1BVX1VTRVJQVFI9eQoj
IENPTkZJR19EUk1fQU1ER1BVX1dFUlJPUiBpcyBub3Qgc2V0CgojCiMgQUNQIChBdWRpbyBD
b1Byb2Nlc3NvcikgQ29uZmlndXJhdGlvbgojCkNPTkZJR19EUk1fQU1EX0FDUD15CiMgZW5k
IG9mIEFDUCAoQXVkaW8gQ29Qcm9jZXNzb3IpIENvbmZpZ3VyYXRpb24KCiMKIyBEaXNwbGF5
IEVuZ2luZSBDb25maWd1cmF0aW9uCiMKQ09ORklHX0RSTV9BTURfREM9eQpDT05GSUdfRFJN
X0FNRF9EQ19GUD15CkNPTkZJR19EUk1fQU1EX0RDX1NJPXkKQ09ORklHX0RSTV9BTURfU0VD
VVJFX0RJU1BMQVk9eQojIGVuZCBvZiBEaXNwbGF5IEVuZ2luZSBDb25maWd1cmF0aW9uCgpD
T05GSUdfSFNBX0FNRD15CiMgQ09ORklHX0RSTV9OT1VWRUFVIGlzIG5vdCBzZXQKIyBDT05G
SUdfRFJNX0k5MTUgaXMgbm90IHNldAojIENPTkZJR19EUk1fVkdFTSBpcyBub3Qgc2V0CiMg
Q09ORklHX0RSTV9WS01TIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX1ZNV0dGWCBpcyBub3Qg
c2V0CiMgQ09ORklHX0RSTV9HTUE1MDAgaXMgbm90IHNldAojIENPTkZJR19EUk1fVURMIGlz
IG5vdCBzZXQKIyBDT05GSUdfRFJNX0FTVCBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9NR0FH
MjAwIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX1FYTCBpcyBub3Qgc2V0CiMgQ09ORklHX0RS
TV9WSVJUSU9fR1BVIGlzIG5vdCBzZXQKQ09ORklHX0RSTV9QQU5FTD15CgojCiMgRGlzcGxh
eSBQYW5lbHMKIwojIENPTkZJR19EUk1fUEFORUxfQVVPX0EwMzBKVE4wMSBpcyBub3Qgc2V0
CiMgQ09ORklHX0RSTV9QQU5FTF9PUklTRVRFQ0hfT1RBNTYwMUEgaXMgbm90IHNldAojIENP
TkZJR19EUk1fUEFORUxfV0lERUNISVBTX1dTMjQwMSBpcyBub3Qgc2V0CiMgZW5kIG9mIERp
c3BsYXkgUGFuZWxzCgpDT05GSUdfRFJNX0JSSURHRT15CkNPTkZJR19EUk1fUEFORUxfQlJJ
REdFPXkKCiMKIyBEaXNwbGF5IEludGVyZmFjZSBCcmlkZ2VzCiMKIyBDT05GSUdfRFJNX0FO
QUxPR0lYX0FOWDc4WFggaXMgbm90IHNldAojIGVuZCBvZiBEaXNwbGF5IEludGVyZmFjZSBC
cmlkZ2VzCgojIENPTkZJR19EUk1fRVROQVZJViBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9C
T0NIUyBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9DSVJSVVNfUUVNVSBpcyBub3Qgc2V0CiMg
Q09ORklHX0RSTV9HTTEyVTMyMCBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9QQU5FTF9NSVBJ
X0RCSSBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9TSU1QTEVEUk0gaXMgbm90IHNldAojIENP
TkZJR19USU5ZRFJNX0hYODM1N0QgaXMgbm90IHNldAojIENPTkZJR19USU5ZRFJNX0lMSTkx
NjMgaXMgbm90IHNldAojIENPTkZJR19USU5ZRFJNX0lMSTkyMjUgaXMgbm90IHNldAojIENP
TkZJR19USU5ZRFJNX0lMSTkzNDEgaXMgbm90IHNldAojIENPTkZJR19USU5ZRFJNX0lMSTk0
ODYgaXMgbm90IHNldAojIENPTkZJR19USU5ZRFJNX01JMDI4M1FUIGlzIG5vdCBzZXQKIyBD
T05GSUdfVElOWURSTV9SRVBBUEVSIGlzIG5vdCBzZXQKIyBDT05GSUdfVElOWURSTV9TVDc1
ODYgaXMgbm90IHNldAojIENPTkZJR19USU5ZRFJNX1NUNzczNVIgaXMgbm90IHNldAojIENP
TkZJR19EUk1fVkJPWFZJREVPIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX0dVRCBpcyBub3Qg
c2V0CiMgQ09ORklHX0RSTV9TU0QxMzBYIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX0xFR0FD
WSBpcyBub3Qgc2V0CkNPTkZJR19EUk1fUEFORUxfT1JJRU5UQVRJT05fUVVJUktTPXkKQ09O
RklHX0RSTV9QUklWQUNZX1NDUkVFTj15CgojCiMgRnJhbWUgYnVmZmVyIERldmljZXMKIwpD
T05GSUdfRkJfTk9USUZZPXkKQ09ORklHX0ZCPXkKIyBDT05GSUdfRklSTVdBUkVfRURJRCBp
cyBub3Qgc2V0CkNPTkZJR19GQl9DRkJfRklMTFJFQ1Q9eQpDT05GSUdfRkJfQ0ZCX0NPUFlB
UkVBPXkKQ09ORklHX0ZCX0NGQl9JTUFHRUJMSVQ9eQpDT05GSUdfRkJfU1lTX0ZJTExSRUNU
PXkKQ09ORklHX0ZCX1NZU19DT1BZQVJFQT15CkNPTkZJR19GQl9TWVNfSU1BR0VCTElUPXkK
IyBDT05GSUdfRkJfRk9SRUlHTl9FTkRJQU4gaXMgbm90IHNldApDT05GSUdfRkJfU1lTX0ZP
UFM9eQpDT05GSUdfRkJfREVGRVJSRURfSU89eQpDT05GSUdfRkJfU1lTX0hFTFBFUlM9eQpD
T05GSUdfRkJfU1lTX0hFTFBFUlNfREVGRVJSRUQ9eQojIENPTkZJR19GQl9NT0RFX0hFTFBF
UlMgaXMgbm90IHNldAojIENPTkZJR19GQl9USUxFQkxJVFRJTkcgaXMgbm90IHNldAoKIwoj
IEZyYW1lIGJ1ZmZlciBoYXJkd2FyZSBkcml2ZXJzCiMKIyBDT05GSUdfRkJfQ0lSUlVTIGlz
IG5vdCBzZXQKIyBDT05GSUdfRkJfUE0yIGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfQ1lCRVIy
MDAwIGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfQVJDIGlzIG5vdCBzZXQKIyBDT05GSUdfRkJf
QVNJTElBTlQgaXMgbm90IHNldAojIENPTkZJR19GQl9JTVNUVCBpcyBub3Qgc2V0CiMgQ09O
RklHX0ZCX1ZHQTE2IGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfVVZFU0EgaXMgbm90IHNldAoj
IENPTkZJR19GQl9WRVNBIGlzIG5vdCBzZXQKQ09ORklHX0ZCX0VGST15CiMgQ09ORklHX0ZC
X040MTEgaXMgbm90IHNldAojIENPTkZJR19GQl9IR0EgaXMgbm90IHNldAojIENPTkZJR19G
Ql9PUEVOQ09SRVMgaXMgbm90IHNldAojIENPTkZJR19GQl9TMUQxM1hYWCBpcyBub3Qgc2V0
CiMgQ09ORklHX0ZCX05WSURJQSBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX1JJVkEgaXMgbm90
IHNldAojIENPTkZJR19GQl9JNzQwIGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfTEU4MDU3OCBp
cyBub3Qgc2V0CiMgQ09ORklHX0ZCX01BVFJPWCBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX1JB
REVPTiBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX0FUWTEyOCBpcyBub3Qgc2V0CiMgQ09ORklH
X0ZCX0FUWSBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX1MzIGlzIG5vdCBzZXQKIyBDT05GSUdf
RkJfU0FWQUdFIGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfU0lTIGlzIG5vdCBzZXQKIyBDT05G
SUdfRkJfVklBIGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfTkVPTUFHSUMgaXMgbm90IHNldAoj
IENPTkZJR19GQl9LWVJPIGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfM0RGWCBpcyBub3Qgc2V0
CiMgQ09ORklHX0ZCX1ZPT0RPTzEgaXMgbm90IHNldAojIENPTkZJR19GQl9WVDg2MjMgaXMg
bm90IHNldAojIENPTkZJR19GQl9UUklERU5UIGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfQVJL
IGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfUE0zIGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfQ0FS
TUlORSBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX1NNU0NVRlggaXMgbm90IHNldAojIENPTkZJ
R19GQl9VREwgaXMgbm90IHNldAojIENPTkZJR19GQl9JQk1fR1hUNDUwMCBpcyBub3Qgc2V0
CiMgQ09ORklHX0ZCX1ZJUlRVQUwgaXMgbm90IHNldAojIENPTkZJR19GQl9NRVRST05PTUUg
aXMgbm90IHNldAojIENPTkZJR19GQl9NQjg2MlhYIGlzIG5vdCBzZXQKIyBDT05GSUdfRkJf
U0lNUExFIGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfU1NEMTMwNyBpcyBub3Qgc2V0CiMgQ09O
RklHX0ZCX1NNNzEyIGlzIG5vdCBzZXQKIyBlbmQgb2YgRnJhbWUgYnVmZmVyIERldmljZXMK
CiMKIyBCYWNrbGlnaHQgJiBMQ0QgZGV2aWNlIHN1cHBvcnQKIwojIENPTkZJR19MQ0RfQ0xB
U1NfREVWSUNFIGlzIG5vdCBzZXQKQ09ORklHX0JBQ0tMSUdIVF9DTEFTU19ERVZJQ0U9eQoj
IENPTkZJR19CQUNLTElHSFRfS1REMjUzIGlzIG5vdCBzZXQKIyBDT05GSUdfQkFDS0xJR0hU
X0tUWjg4NjYgaXMgbm90IHNldAojIENPTkZJR19CQUNLTElHSFRfUFdNIGlzIG5vdCBzZXQK
IyBDT05GSUdfQkFDS0xJR0hUX0FQUExFIGlzIG5vdCBzZXQKIyBDT05GSUdfQkFDS0xJR0hU
X1FDT01fV0xFRCBpcyBub3Qgc2V0CiMgQ09ORklHX0JBQ0tMSUdIVF9TQUhBUkEgaXMgbm90
IHNldAojIENPTkZJR19CQUNLTElHSFRfQURQODg2MCBpcyBub3Qgc2V0CiMgQ09ORklHX0JB
Q0tMSUdIVF9BRFA4ODcwIGlzIG5vdCBzZXQKIyBDT05GSUdfQkFDS0xJR0hUX0xNMzYzMEEg
aXMgbm90IHNldAojIENPTkZJR19CQUNLTElHSFRfTE0zNjM5IGlzIG5vdCBzZXQKIyBDT05G
SUdfQkFDS0xJR0hUX0xQODU1WCBpcyBub3Qgc2V0CiMgQ09ORklHX0JBQ0tMSUdIVF9HUElP
IGlzIG5vdCBzZXQKIyBDT05GSUdfQkFDS0xJR0hUX0xWNTIwN0xQIGlzIG5vdCBzZXQKIyBD
T05GSUdfQkFDS0xJR0hUX0JENjEwNyBpcyBub3Qgc2V0CiMgQ09ORklHX0JBQ0tMSUdIVF9B
UkNYQ05OIGlzIG5vdCBzZXQKIyBlbmQgb2YgQmFja2xpZ2h0ICYgTENEIGRldmljZSBzdXBw
b3J0CgpDT05GSUdfSERNST15CgojCiMgQ29uc29sZSBkaXNwbGF5IGRyaXZlciBzdXBwb3J0
CiMKQ09ORklHX1ZHQV9DT05TT0xFPXkKQ09ORklHX0RVTU1ZX0NPTlNPTEU9eQpDT05GSUdf
RFVNTVlfQ09OU09MRV9DT0xVTU5TPTgwCkNPTkZJR19EVU1NWV9DT05TT0xFX1JPV1M9MjUK
Q09ORklHX0ZSQU1FQlVGRkVSX0NPTlNPTEU9eQojIENPTkZJR19GUkFNRUJVRkZFUl9DT05T
T0xFX0xFR0FDWV9BQ0NFTEVSQVRJT04gaXMgbm90IHNldApDT05GSUdfRlJBTUVCVUZGRVJf
Q09OU09MRV9ERVRFQ1RfUFJJTUFSWT15CkNPTkZJR19GUkFNRUJVRkZFUl9DT05TT0xFX1JP
VEFUSU9OPXkKQ09ORklHX0ZSQU1FQlVGRkVSX0NPTlNPTEVfREVGRVJSRURfVEFLRU9WRVI9
eQojIGVuZCBvZiBDb25zb2xlIGRpc3BsYXkgZHJpdmVyIHN1cHBvcnQKCiMgQ09ORklHX0xP
R08gaXMgbm90IHNldAojIGVuZCBvZiBHcmFwaGljcyBzdXBwb3J0CgojIENPTkZJR19EUk1f
QUNDRUwgaXMgbm90IHNldApDT05GSUdfU09VTkQ9bQpDT05GSUdfU09VTkRfT1NTX0NPUkU9
eQpDT05GSUdfU09VTkRfT1NTX0NPUkVfUFJFQ0xBSU09eQpDT05GSUdfU05EPW0KQ09ORklH
X1NORF9USU1FUj1tCkNPTkZJR19TTkRfUENNPW0KQ09ORklHX1NORF9IV0RFUD1tCkNPTkZJ
R19TTkRfUkFXTUlEST1tCkNPTkZJR19TTkRfSkFDSz15CkNPTkZJR19TTkRfSkFDS19JTlBV
VF9ERVY9eQpDT05GSUdfU05EX09TU0VNVUw9eQojIENPTkZJR19TTkRfTUlYRVJfT1NTIGlz
IG5vdCBzZXQKIyBDT05GSUdfU05EX1BDTV9PU1MgaXMgbm90IHNldApDT05GSUdfU05EX1BD
TV9USU1FUj15CiMgQ09ORklHX1NORF9IUlRJTUVSIGlzIG5vdCBzZXQKQ09ORklHX1NORF9E
WU5BTUlDX01JTk9SUz15CkNPTkZJR19TTkRfTUFYX0NBUkRTPTMyCiMgQ09ORklHX1NORF9T
VVBQT1JUX09MRF9BUEkgaXMgbm90IHNldApDT05GSUdfU05EX1BST0NfRlM9eQpDT05GSUdf
U05EX1ZFUkJPU0VfUFJPQ0ZTPXkKIyBDT05GSUdfU05EX1ZFUkJPU0VfUFJJTlRLIGlzIG5v
dCBzZXQKQ09ORklHX1NORF9DVExfRkFTVF9MT09LVVA9eQojIENPTkZJR19TTkRfREVCVUcg
aXMgbm90IHNldAojIENPTkZJR19TTkRfQ1RMX0lOUFVUX1ZBTElEQVRJT04gaXMgbm90IHNl
dApDT05GSUdfU05EX1ZNQVNURVI9eQpDT05GSUdfU05EX0RNQV9TR0JVRj15CkNPTkZJR19T
TkRfQ1RMX0xFRD1tCiMgQ09ORklHX1NORF9TRVFVRU5DRVIgaXMgbm90IHNldApDT05GSUdf
U05EX0RSSVZFUlM9eQojIENPTkZJR19TTkRfRFVNTVkgaXMgbm90IHNldAojIENPTkZJR19T
TkRfQUxPT1AgaXMgbm90IHNldAojIENPTkZJR19TTkRfUENNVEVTVCBpcyBub3Qgc2V0CiMg
Q09ORklHX1NORF9NVFBBViBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TRVJJQUxfVTE2NTUw
IGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX01QVTQwMSBpcyBub3Qgc2V0CkNPTkZJR19TTkRf
UENJPXkKIyBDT05GSUdfU05EX0FEMTg4OSBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9BTFMz
MDAgaXMgbm90IHNldAojIENPTkZJR19TTkRfQUxTNDAwMCBpcyBub3Qgc2V0CiMgQ09ORklH
X1NORF9BTEk1NDUxIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0FTSUhQSSBpcyBub3Qgc2V0
CiMgQ09ORklHX1NORF9BVElJWFAgaXMgbm90IHNldAojIENPTkZJR19TTkRfQVRJSVhQX01P
REVNIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0FVODgxMCBpcyBub3Qgc2V0CiMgQ09ORklH
X1NORF9BVTg4MjAgaXMgbm90IHNldAojIENPTkZJR19TTkRfQVU4ODMwIGlzIG5vdCBzZXQK
IyBDT05GSUdfU05EX0FXMiBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9BWlQzMzI4IGlzIG5v
dCBzZXQKIyBDT05GSUdfU05EX0JUODdYIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0NBMDEw
NiBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9DTUlQQ0kgaXMgbm90IHNldAojIENPTkZJR19T
TkRfT1hZR0VOIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0NTNDI4MSBpcyBub3Qgc2V0CiMg
Q09ORklHX1NORF9DUzQ2WFggaXMgbm90IHNldAojIENPTkZJR19TTkRfQ1RYRkkgaXMgbm90
IHNldAojIENPTkZJR19TTkRfREFSTEEyMCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9HSU5B
MjAgaXMgbm90IHNldAojIENPTkZJR19TTkRfTEFZTEEyMCBpcyBub3Qgc2V0CiMgQ09ORklH
X1NORF9EQVJMQTI0IGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0dJTkEyNCBpcyBub3Qgc2V0
CiMgQ09ORklHX1NORF9MQVlMQTI0IGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX01PTkEgaXMg
bm90IHNldAojIENPTkZJR19TTkRfTUlBIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0VDSE8z
RyBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9JTkRJR08gaXMgbm90IHNldAojIENPTkZJR19T
TkRfSU5ESUdPSU8gaXMgbm90IHNldAojIENPTkZJR19TTkRfSU5ESUdPREogaXMgbm90IHNl
dAojIENPTkZJR19TTkRfSU5ESUdPSU9YIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0lORElH
T0RKWCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9FTVUxMEsxIGlzIG5vdCBzZXQKIyBDT05G
SUdfU05EX0VNVTEwSzFYIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0VOUzEzNzAgaXMgbm90
IHNldAojIENPTkZJR19TTkRfRU5TMTM3MSBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9FUzE5
MzggaXMgbm90IHNldAojIENPTkZJR19TTkRfRVMxOTY4IGlzIG5vdCBzZXQKIyBDT05GSUdf
U05EX0ZNODAxIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0hEU1AgaXMgbm90IHNldAojIENP
TkZJR19TTkRfSERTUE0gaXMgbm90IHNldAojIENPTkZJR19TTkRfSUNFMTcxMiBpcyBub3Qg
c2V0CiMgQ09ORklHX1NORF9JQ0UxNzI0IGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0lOVEVM
OFgwIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0lOVEVMOFgwTSBpcyBub3Qgc2V0CiMgQ09O
RklHX1NORF9LT1JHMTIxMiBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9MT0xBIGlzIG5vdCBz
ZXQKIyBDT05GSUdfU05EX0xYNjQ2NEVTIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX01BRVNU
Uk8zIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX01JWEFSVCBpcyBub3Qgc2V0CiMgQ09ORklH
X1NORF9OTTI1NiBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9QQ1hIUiBpcyBub3Qgc2V0CiMg
Q09ORklHX1NORF9SSVBUSURFIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1JNRTMyIGlzIG5v
dCBzZXQKIyBDT05GSUdfU05EX1JNRTk2IGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1JNRTk2
NTIgaXMgbm90IHNldAojIENPTkZJR19TTkRfU0U2WCBpcyBub3Qgc2V0CiMgQ09ORklHX1NO
RF9TT05JQ1ZJQkVTIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1RSSURFTlQgaXMgbm90IHNl
dAojIENPTkZJR19TTkRfVklBODJYWCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9WSUE4MlhY
X01PREVNIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1ZJUlRVT1NPIGlzIG5vdCBzZXQKIyBD
T05GSUdfU05EX1ZYMjIyIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1lNRlBDSSBpcyBub3Qg
c2V0CgojCiMgSEQtQXVkaW8KIwpDT05GSUdfU05EX0hEQT1tCkNPTkZJR19TTkRfSERBX0dF
TkVSSUNfTEVEUz15CkNPTkZJR19TTkRfSERBX0lOVEVMPW0KQ09ORklHX1NORF9IREFfSFdE
RVA9eQpDT05GSUdfU05EX0hEQV9SRUNPTkZJRz15CkNPTkZJR19TTkRfSERBX0lOUFVUX0JF
RVA9eQpDT05GSUdfU05EX0hEQV9JTlBVVF9CRUVQX01PREU9MApDT05GSUdfU05EX0hEQV9Q
QVRDSF9MT0FERVI9eQojIENPTkZJR19TTkRfSERBX1NDT0RFQ19DUzM1TDQxX0kyQyBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NORF9IREFfU0NPREVDX0NTMzVMNDFfU1BJIGlzIG5vdCBzZXQK
Q09ORklHX1NORF9IREFfQ09ERUNfUkVBTFRFSz1tCiMgQ09ORklHX1NORF9IREFfQ09ERUNf
QU5BTE9HIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0hEQV9DT0RFQ19TSUdNQVRFTCBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NORF9IREFfQ09ERUNfVklBIGlzIG5vdCBzZXQKQ09ORklHX1NO
RF9IREFfQ09ERUNfSERNST1tCiMgQ09ORklHX1NORF9IREFfQ09ERUNfQ0lSUlVTIGlzIG5v
dCBzZXQKIyBDT05GSUdfU05EX0hEQV9DT0RFQ19DUzg0MDkgaXMgbm90IHNldAojIENPTkZJ
R19TTkRfSERBX0NPREVDX0NPTkVYQU5UIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0hEQV9D
T0RFQ19DQTAxMTAgaXMgbm90IHNldAojIENPTkZJR19TTkRfSERBX0NPREVDX0NBMDEzMiBp
cyBub3Qgc2V0CiMgQ09ORklHX1NORF9IREFfQ09ERUNfQ01FRElBIGlzIG5vdCBzZXQKIyBD
T05GSUdfU05EX0hEQV9DT0RFQ19TSTMwNTQgaXMgbm90IHNldApDT05GSUdfU05EX0hEQV9H
RU5FUklDPW0KQ09ORklHX1NORF9IREFfUE9XRVJfU0FWRV9ERUZBVUxUPTEKQ09ORklHX1NO
RF9IREFfSU5URUxfSERNSV9TSUxFTlRfU1RSRUFNPXkKIyBDT05GSUdfU05EX0hEQV9DVExf
REVWX0lEIGlzIG5vdCBzZXQKIyBlbmQgb2YgSEQtQXVkaW8KCkNPTkZJR19TTkRfSERBX0NP
UkU9bQpDT05GSUdfU05EX0hEQV9DT01QT05FTlQ9eQpDT05GSUdfU05EX0hEQV9QUkVBTExP
Q19TSVpFPTAKQ09ORklHX1NORF9JTlRFTF9OSExUPXkKQ09ORklHX1NORF9JTlRFTF9EU1Bf
Q09ORklHPW0KQ09ORklHX1NORF9JTlRFTF9TT1VORFdJUkVfQUNQST1tCiMgQ09ORklHX1NO
RF9TUEkgaXMgbm90IHNldApDT05GSUdfU05EX1VTQj15CkNPTkZJR19TTkRfVVNCX0FVRElP
PW0KIyBDT05GSUdfU05EX1VTQl9BVURJT19NSURJX1YyIGlzIG5vdCBzZXQKQ09ORklHX1NO
RF9VU0JfQVVESU9fVVNFX01FRElBX0NPTlRST0xMRVI9eQpDT05GSUdfU05EX1VTQl9VQTEw
MT1tCkNPTkZJR19TTkRfVVNCX1VTWDJZPW0KIyBDT05GSUdfU05EX1VTQl9DQUlBUSBpcyBu
b3Qgc2V0CkNPTkZJR19TTkRfVVNCX1VTMTIyTD1tCiMgQ09ORklHX1NORF9VU0JfNkZJUkUg
aXMgbm90IHNldAojIENPTkZJR19TTkRfVVNCX0hJRkFDRSBpcyBub3Qgc2V0CiMgQ09ORklH
X1NORF9CQ0QyMDAwIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1VTQl9QT0QgaXMgbm90IHNl
dAojIENPTkZJR19TTkRfVVNCX1BPREhEIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1VTQl9U
T05FUE9SVCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9VU0JfVkFSSUFYIGlzIG5vdCBzZXQK
IyBDT05GSUdfU05EX1BDTUNJQSBpcyBub3Qgc2V0CkNPTkZJR19TTkRfU09DPW0KQ09ORklH
X1NORF9TT0NfQUNQST1tCiMgQ09ORklHX1NORF9TT0NfQURJIGlzIG5vdCBzZXQKIyBDT05G
SUdfU05EX1NPQ19BTURfQUNQIGlzIG5vdCBzZXQKQ09ORklHX1NORF9TT0NfQU1EX0FDUDN4
PW0KQ09ORklHX1NORF9TT0NfQU1EX1JFTk9JUj1tCiMgQ09ORklHX1NORF9TT0NfQU1EX1JF
Tk9JUl9NQUNIIGlzIG5vdCBzZXQKQ09ORklHX1NORF9TT0NfQU1EX0FDUDV4PW0KIyBDT05G
SUdfU05EX1NPQ19BTURfVkFOR09HSF9NQUNIIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NP
Q19BTURfQUNQNnggaXMgbm90IHNldApDT05GSUdfU05EX0FNRF9BQ1BfQ09ORklHPW0KIyBD
T05GSUdfU05EX1NPQ19BTURfQUNQX0NPTU1PTiBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9T
T0NfQU1EX1JQTF9BQ1A2eCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfQU1EX1BTIGlz
IG5vdCBzZXQKIyBDT05GSUdfU05EX0FUTUVMX1NPQyBpcyBub3Qgc2V0CiMgQ09ORklHX1NO
RF9CQ002M1hYX0kyU19XSElTVExFUiBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9ERVNJR05X
QVJFX0kyUyBpcyBub3Qgc2V0CgojCiMgU29DIEF1ZGlvIGZvciBGcmVlc2NhbGUgQ1BVcwoj
CgojCiMgQ29tbW9uIFNvQyBBdWRpbyBvcHRpb25zIGZvciBGcmVlc2NhbGUgQ1BVczoKIwoj
IENPTkZJR19TTkRfU09DX0ZTTF9BU1JDIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19G
U0xfU0FJIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19GU0xfQVVETUlYIGlzIG5vdCBz
ZXQKIyBDT05GSUdfU05EX1NPQ19GU0xfU1NJIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NP
Q19GU0xfU1BESUYgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX0ZTTF9FU0FJIGlzIG5v
dCBzZXQKIyBDT05GSUdfU05EX1NPQ19GU0xfTUlDRklMIGlzIG5vdCBzZXQKIyBDT05GSUdf
U05EX1NPQ19GU0xfWENWUiBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfSU1YX0FVRE1V
WCBpcyBub3Qgc2V0CiMgZW5kIG9mIFNvQyBBdWRpbyBmb3IgRnJlZXNjYWxlIENQVXMKCiMg
Q09ORklHX1NORF9TT0NfQ0hWM19JMlMgaXMgbm90IHNldAojIENPTkZJR19TTkRfSTJTX0hJ
NjIxMF9JMlMgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX0lNRyBpcyBub3Qgc2V0CkNP
TkZJR19TTkRfU09DX0lOVEVMX1NTVF9UT1BMRVZFTD15CiMgQ09ORklHX1NORF9TT0NfSU5U
RUxfQ0FUUFQgaXMgbm90IHNldAojIENPTkZJR19TTkRfU1NUX0FUT01fSElGSTJfUExBVEZP
Uk1fUENJIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NTVF9BVE9NX0hJRkkyX1BMQVRGT1JN
X0FDUEkgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX0lOVEVMX1NLWUxBS0UgaXMgbm90
IHNldAojIENPTkZJR19TTkRfU09DX0lOVEVMX1NLTCBpcyBub3Qgc2V0CiMgQ09ORklHX1NO
RF9TT0NfSU5URUxfQVBMIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19JTlRFTF9LQkwg
aXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX0lOVEVMX0dMSyBpcyBub3Qgc2V0CiMgQ09O
RklHX1NORF9TT0NfSU5URUxfQ05MIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19JTlRF
TF9DRkwgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX0lOVEVMX0NNTF9IIGlzIG5vdCBz
ZXQKIyBDT05GSUdfU05EX1NPQ19JTlRFTF9DTUxfTFAgaXMgbm90IHNldAojIENPTkZJR19T
TkRfU09DX0lOVEVMX0FWUyBpcyBub3Qgc2V0CkNPTkZJR19TTkRfU09DX0lOVEVMX01BQ0g9
eQpDT05GSUdfU05EX1NPQ19JTlRFTF9VU0VSX0ZSSUVORExZX0xPTkdfTkFNRVM9eQojIENP
TkZJR19TTkRfU09DX01US19CVENWU0QgaXMgbm90IHNldApDT05GSUdfU05EX1NPQ19TT0Zf
VE9QTEVWRUw9eQojIENPTkZJR19TTkRfU09DX1NPRl9QQ0kgaXMgbm90IHNldAojIENPTkZJ
R19TTkRfU09DX1NPRl9BQ1BJIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19TT0ZfQU1E
X1RPUExFVkVMIGlzIG5vdCBzZXQKQ09ORklHX1NORF9TT0NfU09GX0lOVEVMX1RPUExFVkVM
PXkKCiMKIyBTVE1pY3JvZWxlY3Ryb25pY3MgU1RNMzIgU09DIGF1ZGlvIHN1cHBvcnQKIwoj
IGVuZCBvZiBTVE1pY3JvZWxlY3Ryb25pY3MgU1RNMzIgU09DIGF1ZGlvIHN1cHBvcnQKCiMg
Q09ORklHX1NORF9TT0NfWElMSU5YX0kyUyBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0Nf
WElMSU5YX0FVRElPX0ZPUk1BVFRFUiBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfWElM
SU5YX1NQRElGIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19YVEZQR0FfSTJTIGlzIG5v
dCBzZXQKQ09ORklHX1NORF9TT0NfSTJDX0FORF9TUEk9bQoKIwojIENPREVDIGRyaXZlcnMK
IwojIENPTkZJR19TTkRfU09DX0FDOTdfQ09ERUMgaXMgbm90IHNldAojIENPTkZJR19TTkRf
U09DX0FEQVUxMzcyX0kyQyBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfQURBVTEzNzJf
U1BJIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19BREFVMTcwMSBpcyBub3Qgc2V0CiMg
Q09ORklHX1NORF9TT0NfQURBVTE3NjFfSTJDIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NP
Q19BREFVMTc2MV9TUEkgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX0FEQVU3MDAyIGlz
IG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19BREFVNzExOF9IVyBpcyBub3Qgc2V0CiMgQ09O
RklHX1NORF9TT0NfQURBVTcxMThfSTJDIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19B
SzQxMDQgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX0FLNDExOCBpcyBub3Qgc2V0CiMg
Q09ORklHX1NORF9TT0NfQUs0Mzc1IGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19BSzQ0
NTggaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX0FLNDU1NCBpcyBub3Qgc2V0CiMgQ09O
RklHX1NORF9TT0NfQUs0NjEzIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19BSzQ2NDIg
aXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX0FLNTM4NiBpcyBub3Qgc2V0CiMgQ09ORklH
X1NORF9TT0NfQUs1NTU4IGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19BTEM1NjIzIGlz
IG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19BVzg3MzggaXMgbm90IHNldAojIENPTkZJR19T
TkRfU09DX0FXODgzOTUgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX0JEMjg2MjMgaXMg
bm90IHNldAojIENPTkZJR19TTkRfU09DX0JUX1NDTyBpcyBub3Qgc2V0CiMgQ09ORklHX1NO
RF9TT0NfQ0hWM19DT0RFQyBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfQ1MzNUwzMiBp
cyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfQ1MzNUwzMyBpcyBub3Qgc2V0CiMgQ09ORklH
X1NORF9TT0NfQ1MzNUwzNCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfQ1MzNUwzNSBp
cyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfQ1MzNUwzNiBpcyBub3Qgc2V0CiMgQ09ORklH
X1NORF9TT0NfQ1MzNUw0MV9TUEkgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX0NTMzVM
NDFfSTJDIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19DUzM1TDQ1X1NQSSBpcyBub3Qg
c2V0CiMgQ09ORklHX1NORF9TT0NfQ1MzNUw0NV9JMkMgaXMgbm90IHNldAojIENPTkZJR19T
TkRfU09DX0NTMzVMNTZfSTJDIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19DUzM1TDU2
X1NQSSBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfQ1M0Mkw0MiBpcyBub3Qgc2V0CiMg
Q09ORklHX1NORF9TT0NfQ1M0Mkw1MV9JMkMgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09D
X0NTNDJMNTIgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX0NTNDJMNTYgaXMgbm90IHNl
dAojIENPTkZJR19TTkRfU09DX0NTNDJMNzMgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09D
X0NTNDJMODMgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX0NTNDIzNCBpcyBub3Qgc2V0
CiMgQ09ORklHX1NORF9TT0NfQ1M0MjY1IGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19D
UzQyNzAgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX0NTNDI3MV9JMkMgaXMgbm90IHNl
dAojIENPTkZJR19TTkRfU09DX0NTNDI3MV9TUEkgaXMgbm90IHNldAojIENPTkZJR19TTkRf
U09DX0NTNDJYWDhfSTJDIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19DUzQzMTMwIGlz
IG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19DUzQzNDEgaXMgbm90IHNldAojIENPTkZJR19T
TkRfU09DX0NTNDM0OSBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfQ1M1M0wzMCBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfQ1gyMDcyWCBpcyBub3Qgc2V0CiMgQ09ORklHX1NO
RF9TT0NfREE3MjEzIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19ETUlDIGlzIG5vdCBz
ZXQKIyBDT05GSUdfU05EX1NPQ19FUzcxMzQgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09D
X0VTNzI0MSBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfRVM4MzE2IGlzIG5vdCBzZXQK
IyBDT05GSUdfU05EX1NPQ19FUzgzMjYgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX0VT
ODMyOF9JMkMgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX0VTODMyOF9TUEkgaXMgbm90
IHNldAojIENPTkZJR19TTkRfU09DX0dUTTYwMSBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9T
T0NfSERBIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19JQ1M0MzQzMiBpcyBub3Qgc2V0
CiMgQ09ORklHX1NORF9TT0NfSURUODIxMDM0IGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NP
Q19JTk5PX1JLMzAzNiBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfTUFYOTgwODggaXMg
bm90IHNldAojIENPTkZJR19TTkRfU09DX01BWDk4MDkwIGlzIG5vdCBzZXQKIyBDT05GSUdf
U05EX1NPQ19NQVg5ODM1N0EgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX01BWDk4NTA0
IGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19NQVg5ODY3IGlzIG5vdCBzZXQKIyBDT05G
SUdfU05EX1NPQ19NQVg5ODkyNyBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfTUFYOTg1
MjAgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX01BWDk4MzczX0kyQyBpcyBub3Qgc2V0
CiMgQ09ORklHX1NORF9TT0NfTUFYOTgzODggaXMgbm90IHNldAojIENPTkZJR19TTkRfU09D
X01BWDk4MzkwIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19NQVg5ODM5NiBpcyBub3Qg
c2V0CiMgQ09ORklHX1NORF9TT0NfTUFYOTg2MCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9T
T0NfTVNNODkxNl9XQ0RfRElHSVRBTCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfUENN
MTY4MSBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfUENNMTc4OV9JMkMgaXMgbm90IHNl
dAojIENPTkZJR19TTkRfU09DX1BDTTE3OVhfSTJDIGlzIG5vdCBzZXQKIyBDT05GSUdfU05E
X1NPQ19QQ00xNzlYX1NQSSBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfUENNMTg2WF9J
MkMgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX1BDTTE4NlhfU1BJIGlzIG5vdCBzZXQK
IyBDT05GSUdfU05EX1NPQ19QQ00zMDYwX0kyQyBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9T
T0NfUENNMzA2MF9TUEkgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX1BDTTMxNjhBX0ky
QyBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfUENNMzE2OEFfU1BJIGlzIG5vdCBzZXQK
IyBDT05GSUdfU05EX1NPQ19QQ001MTAyQSBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0Nf
UENNNTEyeF9JMkMgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX1BDTTUxMnhfU1BJIGlz
IG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19QRUIyNDY2IGlzIG5vdCBzZXQKIyBDT05GSUdf
U05EX1NPQ19SSzMzMjggaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX1JUNTYxNiBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfUlQ1NjMxIGlzIG5vdCBzZXQKIyBDT05GSUdfU05E
X1NPQ19SVDU2NDAgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX1JUNTY1OSBpcyBub3Qg
c2V0CiMgQ09ORklHX1NORF9TT0NfUlQ5MTIwIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NP
Q19TR1RMNTAwMCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfU0lNUExFX0FNUExJRklF
UiBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfU0lNUExFX01VWCBpcyBub3Qgc2V0CiMg
Q09ORklHX1NORF9TT0NfU01BMTMwMyBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfU1BE
SUYgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX1NSQzRYWFhfSTJDIGlzIG5vdCBzZXQK
IyBDT05GSUdfU05EX1NPQ19TU00yMzA1IGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19T
U00yNTE4IGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19TU00yNjAyX1NQSSBpcyBub3Qg
c2V0CiMgQ09ORklHX1NORF9TT0NfU1NNMjYwMl9JMkMgaXMgbm90IHNldAojIENPTkZJR19T
TkRfU09DX1NTTTQ1NjcgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX1NUQTMyWCBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfU1RBMzUwIGlzIG5vdCBzZXQKIyBDT05GSUdfU05E
X1NPQ19TVElfU0FTIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19UQVMyNTUyIGlzIG5v
dCBzZXQKIyBDT05GSUdfU05EX1NPQ19UQVMyNTYyIGlzIG5vdCBzZXQKIyBDT05GSUdfU05E
X1NPQ19UQVMyNzY0IGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19UQVMyNzcwIGlzIG5v
dCBzZXQKIyBDT05GSUdfU05EX1NPQ19UQVMyNzgwIGlzIG5vdCBzZXQKIyBDT05GSUdfU05E
X1NPQ19UQVMyNzgxX0kyQyBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfVEFTNTA4NiBp
cyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfVEFTNTcxWCBpcyBub3Qgc2V0CiMgQ09ORklH
X1NORF9TT0NfVEFTNTcyMCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfVEFTNTgwNU0g
aXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX1RBUzY0MjQgaXMgbm90IHNldAojIENPTkZJ
R19TTkRfU09DX1REQTc0MTkgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX1RGQTk4Nzkg
aXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX1RGQTk4OVggaXMgbm90IHNldAojIENPTkZJ
R19TTkRfU09DX1RMVjMyMEFEQzNYWFggaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX1RM
VjMyMEFJQzIzX0kyQyBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfVExWMzIwQUlDMjNf
U1BJIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19UTFYzMjBBSUMzMVhYIGlzIG5vdCBz
ZXQKIyBDT05GSUdfU05EX1NPQ19UTFYzMjBBSUMzMlg0X0kyQyBpcyBub3Qgc2V0CiMgQ09O
RklHX1NORF9TT0NfVExWMzIwQUlDMzJYNF9TUEkgaXMgbm90IHNldAojIENPTkZJR19TTkRf
U09DX1RMVjMyMEFJQzNYX0kyQyBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfVExWMzIw
QUlDM1hfU1BJIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19UTFYzMjBBRENYMTQwIGlz
IG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19UUzNBMjI3RSBpcyBub3Qgc2V0CiMgQ09ORklH
X1NORF9TT0NfVFNDUzQyWFggaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX1RTQ1M0NTQg
aXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX1VEQTEzMzQgaXMgbm90IHNldAojIENPTkZJ
R19TTkRfU09DX1dNODUxMCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfV004NTIzIGlz
IG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19XTTg1MjQgaXMgbm90IHNldAojIENPTkZJR19T
TkRfU09DX1dNODU4MCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfV004NzExIGlzIG5v
dCBzZXQKIyBDT05GSUdfU05EX1NPQ19XTTg3MjggaXMgbm90IHNldAojIENPTkZJR19TTkRf
U09DX1dNODczMV9JMkMgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX1dNODczMV9TUEkg
aXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX1dNODczNyBpcyBub3Qgc2V0CiMgQ09ORklH
X1NORF9TT0NfV004NzQxIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19XTTg3NTAgaXMg
bm90IHNldAojIENPTkZJR19TTkRfU09DX1dNODc1MyBpcyBub3Qgc2V0CiMgQ09ORklHX1NO
RF9TT0NfV004NzcwIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19XTTg3NzYgaXMgbm90
IHNldAojIENPTkZJR19TTkRfU09DX1dNODc4MiBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9T
T0NfV004ODA0X0kyQyBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfV004ODA0X1NQSSBp
cyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfV004OTAzIGlzIG5vdCBzZXQKIyBDT05GSUdf
U05EX1NPQ19XTTg5MDQgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX1dNODk0MCBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfV004OTYwIGlzIG5vdCBzZXQKIyBDT05GSUdfU05E
X1NPQ19XTTg5NjEgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX1dNODk2MiBpcyBub3Qg
c2V0CiMgQ09ORklHX1NORF9TT0NfV004OTc0IGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NP
Q19XTTg5NzggaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX1dNODk4NSBpcyBub3Qgc2V0
CiMgQ09ORklHX1NORF9TT0NfWkwzODA2MCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0Nf
TUFYOTc1OSBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfTVQ2MzUxIGlzIG5vdCBzZXQK
IyBDT05GSUdfU05EX1NPQ19NVDYzNTggaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX01U
NjY2MCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfTkFVODMxNSBpcyBub3Qgc2V0CiMg
Q09ORklHX1NORF9TT0NfTkFVODU0MCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfTkFV
ODgxMCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfTkFVODgyMSBpcyBub3Qgc2V0CiMg
Q09ORklHX1NORF9TT0NfTkFVODgyMiBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfTkFV
ODgyNCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfVFBBNjEzMEEyIGlzIG5vdCBzZXQK
IyBDT05GSUdfU05EX1NPQ19MUEFTU19XU0FfTUFDUk8gaXMgbm90IHNldAojIENPTkZJR19T
TkRfU09DX0xQQVNTX1ZBX01BQ1JPIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19MUEFT
U19SWF9NQUNSTyBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfTFBBU1NfVFhfTUFDUk8g
aXMgbm90IHNldAojIGVuZCBvZiBDT0RFQyBkcml2ZXJzCgojIENPTkZJR19TTkRfU0lNUExF
X0NBUkQgaXMgbm90IHNldApDT05GSUdfU05EX1g4Nj15CiMgQ09ORklHX1NORF9WSVJUSU8g
aXMgbm90IHNldApDT05GSUdfSElEX1NVUFBPUlQ9eQpDT05GSUdfSElEPXkKQ09ORklHX0hJ
RF9CQVRURVJZX1NUUkVOR1RIPXkKQ09ORklHX0hJRFJBVz15CkNPTkZJR19VSElEPW0KQ09O
RklHX0hJRF9HRU5FUklDPW0KCiMKIyBTcGVjaWFsIEhJRCBkcml2ZXJzCiMKIyBDT05GSUdf
SElEX0E0VEVDSCBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9BQ0NVVE9VQ0ggaXMgbm90IHNl
dAojIENPTkZJR19ISURfQUNSVVggaXMgbm90IHNldAojIENPTkZJR19ISURfQVBQTEUgaXMg
bm90IHNldAojIENPTkZJR19ISURfQVBQTEVJUiBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9B
U1VTIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX0FVUkVBTCBpcyBub3Qgc2V0CiMgQ09ORklH
X0hJRF9CRUxLSU4gaXMgbm90IHNldAojIENPTkZJR19ISURfQkVUT1BfRkYgaXMgbm90IHNl
dAojIENPTkZJR19ISURfQklHQkVOX0ZGIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX0NIRVJS
WSBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9DSElDT05ZIGlzIG5vdCBzZXQKIyBDT05GSUdf
SElEX0NPUlNBSVIgaXMgbm90IHNldAojIENPTkZJR19ISURfQ09VR0FSIGlzIG5vdCBzZXQK
IyBDT05GSUdfSElEX01BQ0FMTFkgaXMgbm90IHNldAojIENPTkZJR19ISURfUFJPRElLRVlT
IGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX0NNRURJQSBpcyBub3Qgc2V0CiMgQ09ORklHX0hJ
RF9DUDIxMTIgaXMgbm90IHNldAojIENPTkZJR19ISURfQ1JFQVRJVkVfU0IwNTQwIGlzIG5v
dCBzZXQKIyBDT05GSUdfSElEX0NZUFJFU1MgaXMgbm90IHNldAojIENPTkZJR19ISURfRFJB
R09OUklTRSBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9FTVNfRkYgaXMgbm90IHNldAojIENP
TkZJR19ISURfRUxBTiBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9FTEVDT00gaXMgbm90IHNl
dAojIENPTkZJR19ISURfRUxPIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX0VWSVNJT04gaXMg
bm90IHNldAojIENPTkZJR19ISURfRVpLRVkgaXMgbm90IHNldAojIENPTkZJR19ISURfRlQy
NjAgaXMgbm90IHNldAojIENPTkZJR19ISURfR0VNQklSRCBpcyBub3Qgc2V0CiMgQ09ORklH
X0hJRF9HRlJNIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX0dMT1JJT1VTIGlzIG5vdCBzZXQK
IyBDT05GSUdfSElEX0hPTFRFSyBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9WSVZBTERJIGlz
IG5vdCBzZXQKIyBDT05GSUdfSElEX0dUNjgzUiBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9L
RVlUT1VDSCBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9LWUUgaXMgbm90IHNldAojIENPTkZJ
R19ISURfVUNMT0dJQyBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9XQUxUT1AgaXMgbm90IHNl
dAojIENPTkZJR19ISURfVklFV1NPTklDIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX1ZSQzIg
aXMgbm90IHNldAojIENPTkZJR19ISURfWElBT01JIGlzIG5vdCBzZXQKIyBDT05GSUdfSElE
X0dZUkFUSU9OIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX0lDQURFIGlzIG5vdCBzZXQKIyBD
T05GSUdfSElEX0lURSBpcyBub3Qgc2V0CkNPTkZJR19ISURfSkFCUkE9bQojIENPTkZJR19I
SURfVFdJTkhBTiBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9LRU5TSU5HVE9OIGlzIG5vdCBz
ZXQKIyBDT05GSUdfSElEX0xDUE9XRVIgaXMgbm90IHNldAojIENPTkZJR19ISURfTEVEIGlz
IG5vdCBzZXQKIyBDT05GSUdfSElEX0xFTk9WTyBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9M
RVRTS0VUQ0ggaXMgbm90IHNldApDT05GSUdfSElEX0xPR0lURUNIPW0KQ09ORklHX0hJRF9M
T0dJVEVDSF9ESj1tCkNPTkZJR19ISURfTE9HSVRFQ0hfSElEUFA9bQpDT05GSUdfTE9HSVRF
Q0hfRkY9eQpDT05GSUdfTE9HSVJVTUJMRVBBRDJfRkY9eQpDT05GSUdfTE9HSUc5NDBfRkY9
eQpDT05GSUdfTE9HSVdIRUVMU19GRj15CkNPTkZJR19ISURfTUFHSUNNT1VTRT15CiMgQ09O
RklHX0hJRF9NQUxUUk9OIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX01BWUZMQVNIIGlzIG5v
dCBzZXQKIyBDT05GSUdfSElEX01FR0FXT1JMRF9GRiBpcyBub3Qgc2V0CiMgQ09ORklHX0hJ
RF9SRURSQUdPTiBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9NSUNST1NPRlQgaXMgbm90IHNl
dAojIENPTkZJR19ISURfTU9OVEVSRVkgaXMgbm90IHNldApDT05GSUdfSElEX01VTFRJVE9V
Q0g9bQojIENPTkZJR19ISURfTklOVEVORE8gaXMgbm90IHNldAojIENPTkZJR19ISURfTlRJ
IGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX05UUklHIGlzIG5vdCBzZXQKIyBDT05GSUdfSElE
X05WSURJQV9TSElFTEQgaXMgbm90IHNldAojIENPTkZJR19ISURfT1JURUsgaXMgbm90IHNl
dAojIENPTkZJR19ISURfUEFOVEhFUkxPUkQgaXMgbm90IHNldAojIENPTkZJR19ISURfUEVO
TU9VTlQgaXMgbm90IHNldAojIENPTkZJR19ISURfUEVUQUxZTlggaXMgbm90IHNldAojIENP
TkZJR19ISURfUElDT0xDRCBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9QTEFOVFJPTklDUyBp
cyBub3Qgc2V0CiMgQ09ORklHX0hJRF9QWFJDIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX1JB
WkVSIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX1BSSU1BWCBpcyBub3Qgc2V0CiMgQ09ORklH
X0hJRF9SRVRST0RFIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX1JPQ0NBVCBpcyBub3Qgc2V0
CiMgQ09ORklHX0hJRF9TQUlURUsgaXMgbm90IHNldAojIENPTkZJR19ISURfU0FNU1VORyBp
cyBub3Qgc2V0CiMgQ09ORklHX0hJRF9TRU1JVEVLIGlzIG5vdCBzZXQKIyBDT05GSUdfSElE
X1NJR01BTUlDUk8gaXMgbm90IHNldAojIENPTkZJR19ISURfU09OWSBpcyBub3Qgc2V0CiMg
Q09ORklHX0hJRF9TUEVFRExJTksgaXMgbm90IHNldAojIENPTkZJR19ISURfU1RFQU0gaXMg
bm90IHNldAojIENPTkZJR19ISURfU1RFRUxTRVJJRVMgaXMgbm90IHNldAojIENPTkZJR19I
SURfU1VOUExVUyBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9STUkgaXMgbm90IHNldAojIENP
TkZJR19ISURfR1JFRU5BU0lBIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX1NNQVJUSk9ZUExV
UyBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9USVZPIGlzIG5vdCBzZXQKIyBDT05GSUdfSElE
X1RPUFNFRUQgaXMgbm90IHNldAojIENPTkZJR19ISURfVE9QUkUgaXMgbm90IHNldAojIENP
TkZJR19ISURfVEhJTkdNIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX1RIUlVTVE1BU1RFUiBp
cyBub3Qgc2V0CiMgQ09ORklHX0hJRF9VRFJBV19QUzMgaXMgbm90IHNldAojIENPTkZJR19I
SURfVTJGWkVSTyBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9XQUNPTSBpcyBub3Qgc2V0CiMg
Q09ORklHX0hJRF9XSUlNT1RFIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX1hJTk1PIGlzIG5v
dCBzZXQKIyBDT05GSUdfSElEX1pFUk9QTFVTIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX1pZ
REFDUk9OIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX1NFTlNPUl9IVUIgaXMgbm90IHNldAoj
IENPTkZJR19ISURfQUxQUyBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9NQ1AyMjIxIGlzIG5v
dCBzZXQKIyBlbmQgb2YgU3BlY2lhbCBISUQgZHJpdmVycwoKIwojIEhJRC1CUEYgc3VwcG9y
dAojCiMgZW5kIG9mIEhJRC1CUEYgc3VwcG9ydAoKIwojIFVTQiBISUQgc3VwcG9ydAojCkNP
TkZJR19VU0JfSElEPXkKQ09ORklHX0hJRF9QSUQ9eQpDT05GSUdfVVNCX0hJRERFVj15CiMg
ZW5kIG9mIFVTQiBISUQgc3VwcG9ydAoKQ09ORklHX0kyQ19ISUQ9eQpDT05GSUdfSTJDX0hJ
RF9BQ1BJPW0KIyBDT05GSUdfSTJDX0hJRF9PRiBpcyBub3Qgc2V0CkNPTkZJR19JMkNfSElE
X0NPUkU9bQoKIwojIEludGVsIElTSCBISUQgc3VwcG9ydAojCiMgQ09ORklHX0lOVEVMX0lT
SF9ISUQgaXMgbm90IHNldAojIGVuZCBvZiBJbnRlbCBJU0ggSElEIHN1cHBvcnQKCiMKIyBB
TUQgU0ZIIEhJRCBTdXBwb3J0CiMKIyBDT05GSUdfQU1EX1NGSF9ISUQgaXMgbm90IHNldAoj
IGVuZCBvZiBBTUQgU0ZIIEhJRCBTdXBwb3J0CgpDT05GSUdfVVNCX09IQ0lfTElUVExFX0VO
RElBTj15CkNPTkZJR19VU0JfU1VQUE9SVD15CkNPTkZJR19VU0JfQ09NTU9OPXkKQ09ORklH
X1VTQl9MRURfVFJJRz15CiMgQ09ORklHX1VTQl9VTFBJX0JVUyBpcyBub3Qgc2V0CiMgQ09O
RklHX1VTQl9DT05OX0dQSU8gaXMgbm90IHNldApDT05GSUdfVVNCX0FSQ0hfSEFTX0hDRD15
CkNPTkZJR19VU0I9eQpDT05GSUdfVVNCX1BDST15CkNPTkZJR19VU0JfQU5OT1VOQ0VfTkVX
X0RFVklDRVM9eQoKIwojIE1pc2NlbGxhbmVvdXMgVVNCIG9wdGlvbnMKIwpDT05GSUdfVVNC
X0RFRkFVTFRfUEVSU0lTVD15CiMgQ09ORklHX1VTQl9GRVdfSU5JVF9SRVRSSUVTIGlzIG5v
dCBzZXQKIyBDT05GSUdfVVNCX0RZTkFNSUNfTUlOT1JTIGlzIG5vdCBzZXQKIyBDT05GSUdf
VVNCX09URyBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9PVEdfUFJPRFVDVExJU1QgaXMgbm90
IHNldAojIENPTkZJR19VU0JfT1RHX0RJU0FCTEVfRVhURVJOQUxfSFVCIGlzIG5vdCBzZXQK
IyBDT05GSUdfVVNCX0xFRFNfVFJJR0dFUl9VU0JQT1JUIGlzIG5vdCBzZXQKQ09ORklHX1VT
Ql9BVVRPU1VTUEVORF9ERUxBWT0yCkNPTkZJR19VU0JfTU9OPW0KCiMKIyBVU0IgSG9zdCBD
b250cm9sbGVyIERyaXZlcnMKIwojIENPTkZJR19VU0JfQzY3WDAwX0hDRCBpcyBub3Qgc2V0
CkNPTkZJR19VU0JfWEhDSV9IQ0Q9bQpDT05GSUdfVVNCX1hIQ0lfREJHQ0FQPXkKQ09ORklH
X1VTQl9YSENJX1BDST1tCkNPTkZJR19VU0JfWEhDSV9QQ0lfUkVORVNBUz1tCiMgQ09ORklH
X1VTQl9YSENJX1BMQVRGT1JNIGlzIG5vdCBzZXQKQ09ORklHX1VTQl9FSENJX0hDRD1tCkNP
TkZJR19VU0JfRUhDSV9ST09UX0hVQl9UVD15CkNPTkZJR19VU0JfRUhDSV9UVF9ORVdTQ0hF
RD15CkNPTkZJR19VU0JfRUhDSV9QQ0k9bQojIENPTkZJR19VU0JfRUhDSV9GU0wgaXMgbm90
IHNldAojIENPTkZJR19VU0JfRUhDSV9IQ0RfUExBVEZPUk0gaXMgbm90IHNldAojIENPTkZJ
R19VU0JfT1hVMjEwSFBfSENEIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX0lTUDExNlhfSENE
IGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX01BWDM0MjFfSENEIGlzIG5vdCBzZXQKQ09ORklH
X1VTQl9PSENJX0hDRD1tCkNPTkZJR19VU0JfT0hDSV9IQ0RfUENJPW0KIyBDT05GSUdfVVNC
X09IQ0lfSENEX1BMQVRGT1JNIGlzIG5vdCBzZXQKQ09ORklHX1VTQl9VSENJX0hDRD1tCiMg
Q09ORklHX1VTQl9TTDgxMV9IQ0QgaXMgbm90IHNldAojIENPTkZJR19VU0JfUjhBNjY1OTdf
SENEIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX0hDRF9URVNUX01PREUgaXMgbm90IHNldAoK
IwojIFVTQiBEZXZpY2UgQ2xhc3MgZHJpdmVycwojCiMgQ09ORklHX1VTQl9BQ00gaXMgbm90
IHNldAojIENPTkZJR19VU0JfUFJJTlRFUiBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9XRE0g
aXMgbm90IHNldAojIENPTkZJR19VU0JfVE1DIGlzIG5vdCBzZXQKCiMKIyBOT1RFOiBVU0Jf
U1RPUkFHRSBkZXBlbmRzIG9uIFNDU0kgYnV0IEJMS19ERVZfU0QgbWF5CiMKCiMKIyBhbHNv
IGJlIG5lZWRlZDsgc2VlIFVTQl9TVE9SQUdFIEhlbHAgZm9yIG1vcmUgaW5mbwojCkNPTkZJ
R19VU0JfU1RPUkFHRT1tCiMgQ09ORklHX1VTQl9TVE9SQUdFX0RFQlVHIGlzIG5vdCBzZXQK
IyBDT05GSUdfVVNCX1NUT1JBR0VfUkVBTFRFSyBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9T
VE9SQUdFX0RBVEFGQUIgaXMgbm90IHNldAojIENPTkZJR19VU0JfU1RPUkFHRV9GUkVFQ09N
IGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NUT1JBR0VfSVNEMjAwIGlzIG5vdCBzZXQKIyBD
T05GSUdfVVNCX1NUT1JBR0VfVVNCQVQgaXMgbm90IHNldAojIENPTkZJR19VU0JfU1RPUkFH
RV9TRERSMDkgaXMgbm90IHNldAojIENPTkZJR19VU0JfU1RPUkFHRV9TRERSNTUgaXMgbm90
IHNldAojIENPTkZJR19VU0JfU1RPUkFHRV9KVU1QU0hPVCBpcyBub3Qgc2V0CiMgQ09ORklH
X1VTQl9TVE9SQUdFX0FMQVVEQSBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9TVE9SQUdFX09O
RVRPVUNIIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NUT1JBR0VfS0FSTUEgaXMgbm90IHNl
dApDT05GSUdfVVNCX1NUT1JBR0VfQ1lQUkVTU19BVEFDQj1tCiMgQ09ORklHX1VTQl9TVE9S
QUdFX0VORV9VQjYyNTAgaXMgbm90IHNldApDT05GSUdfVVNCX1VBUz1tCgojCiMgVVNCIElt
YWdpbmcgZGV2aWNlcwojCiMgQ09ORklHX1VTQl9NREM4MDAgaXMgbm90IHNldAojIENPTkZJ
R19VU0JfTUlDUk9URUsgaXMgbm90IHNldAojIENPTkZJR19VU0JJUF9DT1JFIGlzIG5vdCBz
ZXQKCiMKIyBVU0IgZHVhbC1tb2RlIGNvbnRyb2xsZXIgZHJpdmVycwojCiMgQ09ORklHX1VT
Ql9DRE5TX1NVUFBPUlQgaXMgbm90IHNldAojIENPTkZJR19VU0JfTVVTQl9IRFJDIGlzIG5v
dCBzZXQKIyBDT05GSUdfVVNCX0RXQzMgaXMgbm90IHNldAojIENPTkZJR19VU0JfRFdDMiBp
cyBub3Qgc2V0CiMgQ09ORklHX1VTQl9DSElQSURFQSBpcyBub3Qgc2V0CiMgQ09ORklHX1VT
Ql9JU1AxNzYwIGlzIG5vdCBzZXQKCiMKIyBVU0IgcG9ydCBkcml2ZXJzCiMKQ09ORklHX1VT
Ql9TRVJJQUw9eQpDT05GSUdfVVNCX1NFUklBTF9DT05TT0xFPXkKQ09ORklHX1VTQl9TRVJJ
QUxfR0VORVJJQz15CiMgQ09ORklHX1VTQl9TRVJJQUxfU0lNUExFIGlzIG5vdCBzZXQKIyBD
T05GSUdfVVNCX1NFUklBTF9BSVJDQUJMRSBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9TRVJJ
QUxfQVJLMzExNiBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9TRVJJQUxfQkVMS0lOIGlzIG5v
dCBzZXQKIyBDT05GSUdfVVNCX1NFUklBTF9DSDM0MSBpcyBub3Qgc2V0CiMgQ09ORklHX1VT
Ql9TRVJJQUxfV0hJVEVIRUFUIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NFUklBTF9ESUdJ
X0FDQ0VMRVBPUlQgaXMgbm90IHNldAojIENPTkZJR19VU0JfU0VSSUFMX0NQMjEwWCBpcyBu
b3Qgc2V0CiMgQ09ORklHX1VTQl9TRVJJQUxfQ1lQUkVTU19NOCBpcyBub3Qgc2V0CiMgQ09O
RklHX1VTQl9TRVJJQUxfRU1QRUcgaXMgbm90IHNldAojIENPTkZJR19VU0JfU0VSSUFMX0ZU
RElfU0lPIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NFUklBTF9WSVNPUiBpcyBub3Qgc2V0
CiMgQ09ORklHX1VTQl9TRVJJQUxfSVBBUSBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9TRVJJ
QUxfSVIgaXMgbm90IHNldAojIENPTkZJR19VU0JfU0VSSUFMX0VER0VQT1JUIGlzIG5vdCBz
ZXQKIyBDT05GSUdfVVNCX1NFUklBTF9FREdFUE9SVF9USSBpcyBub3Qgc2V0CiMgQ09ORklH
X1VTQl9TRVJJQUxfRjgxMjMyIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NFUklBTF9GODE1
M1ggaXMgbm90IHNldAojIENPTkZJR19VU0JfU0VSSUFMX0dBUk1JTiBpcyBub3Qgc2V0CiMg
Q09ORklHX1VTQl9TRVJJQUxfSVBXIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NFUklBTF9J
VVUgaXMgbm90IHNldAojIENPTkZJR19VU0JfU0VSSUFMX0tFWVNQQU5fUERBIGlzIG5vdCBz
ZXQKIyBDT05GSUdfVVNCX1NFUklBTF9LRVlTUEFOIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNC
X1NFUklBTF9LTFNJIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NFUklBTF9LT0JJTF9TQ1Qg
aXMgbm90IHNldAojIENPTkZJR19VU0JfU0VSSUFMX01DVF9VMjMyIGlzIG5vdCBzZXQKIyBD
T05GSUdfVVNCX1NFUklBTF9NRVRSTyBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9TRVJJQUxf
TU9TNzcyMCBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9TRVJJQUxfTU9TNzg0MCBpcyBub3Qg
c2V0CiMgQ09ORklHX1VTQl9TRVJJQUxfTVhVUE9SVCBpcyBub3Qgc2V0CiMgQ09ORklHX1VT
Ql9TRVJJQUxfTkFWTUFOIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NFUklBTF9QTDIzMDMg
aXMgbm90IHNldAojIENPTkZJR19VU0JfU0VSSUFMX09USTY4NTggaXMgbm90IHNldAojIENP
TkZJR19VU0JfU0VSSUFMX1FDQVVYIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NFUklBTF9R
VUFMQ09NTSBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9TRVJJQUxfU1BDUDhYNSBpcyBub3Qg
c2V0CiMgQ09ORklHX1VTQl9TRVJJQUxfU0FGRSBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9T
RVJJQUxfU0lFUlJBV0lSRUxFU1MgaXMgbm90IHNldAojIENPTkZJR19VU0JfU0VSSUFMX1NZ
TUJPTCBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9TRVJJQUxfVEkgaXMgbm90IHNldAojIENP
TkZJR19VU0JfU0VSSUFMX0NZQkVSSkFDSyBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9TRVJJ
QUxfT1BUSU9OIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NFUklBTF9PTU5JTkVUIGlzIG5v
dCBzZXQKIyBDT05GSUdfVVNCX1NFUklBTF9PUFRJQ09OIGlzIG5vdCBzZXQKIyBDT05GSUdf
VVNCX1NFUklBTF9YU0VOU19NVCBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9TRVJJQUxfV0lT
SEJPTkUgaXMgbm90IHNldAojIENPTkZJR19VU0JfU0VSSUFMX1NTVTEwMCBpcyBub3Qgc2V0
CiMgQ09ORklHX1VTQl9TRVJJQUxfUVQyIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NFUklB
TF9VUEQ3OEYwNzMwIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NFUklBTF9YUiBpcyBub3Qg
c2V0CiMgQ09ORklHX1VTQl9TRVJJQUxfREVCVUcgaXMgbm90IHNldAoKIwojIFVTQiBNaXNj
ZWxsYW5lb3VzIGRyaXZlcnMKIwojIENPTkZJR19VU0JfRU1JNjIgaXMgbm90IHNldAojIENP
TkZJR19VU0JfRU1JMjYgaXMgbm90IHNldAojIENPTkZJR19VU0JfQURVVFVYIGlzIG5vdCBz
ZXQKIyBDT05GSUdfVVNCX1NFVlNFRyBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9MRUdPVE9X
RVIgaXMgbm90IHNldAojIENPTkZJR19VU0JfTENEIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNC
X0NZUFJFU1NfQ1k3QzYzIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX0NZVEhFUk0gaXMgbm90
IHNldAojIENPTkZJR19VU0JfSURNT1VTRSBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9BUFBM
RURJU1BMQVkgaXMgbm90IHNldAojIENPTkZJR19BUFBMRV9NRklfRkFTVENIQVJHRSBpcyBu
b3Qgc2V0CiMgQ09ORklHX1VTQl9TSVNVU0JWR0EgaXMgbm90IHNldAojIENPTkZJR19VU0Jf
TEQgaXMgbm90IHNldAojIENPTkZJR19VU0JfVFJBTkNFVklCUkFUT1IgaXMgbm90IHNldAoj
IENPTkZJR19VU0JfSU9XQVJSSU9SIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1RFU1QgaXMg
bm90IHNldAojIENPTkZJR19VU0JfRUhTRVRfVEVTVF9GSVhUVVJFIGlzIG5vdCBzZXQKIyBD
T05GSUdfVVNCX0lTSUdIVEZXIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1lVUkVYIGlzIG5v
dCBzZXQKIyBDT05GSUdfVVNCX0VaVVNCX0ZYMiBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9I
VUJfVVNCMjUxWEIgaXMgbm90IHNldAojIENPTkZJR19VU0JfSFNJQ19VU0IzNTAzIGlzIG5v
dCBzZXQKIyBDT05GSUdfVVNCX0hTSUNfVVNCNDYwNCBpcyBub3Qgc2V0CiMgQ09ORklHX1VT
Ql9MSU5LX0xBWUVSX1RFU1QgaXMgbm90IHNldAojIENPTkZJR19VU0JfQ0hBT1NLRVkgaXMg
bm90IHNldAoKIwojIFVTQiBQaHlzaWNhbCBMYXllciBkcml2ZXJzCiMKIyBDT05GSUdfTk9Q
X1VTQl9YQ0VJViBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9HUElPX1ZCVVMgaXMgbm90IHNl
dAojIENPTkZJR19VU0JfSVNQMTMwMSBpcyBub3Qgc2V0CiMgZW5kIG9mIFVTQiBQaHlzaWNh
bCBMYXllciBkcml2ZXJzCgojIENPTkZJR19VU0JfR0FER0VUIGlzIG5vdCBzZXQKQ09ORklH
X1RZUEVDPW0KIyBDT05GSUdfVFlQRUNfVENQTSBpcyBub3Qgc2V0CkNPTkZJR19UWVBFQ19V
Q1NJPW0KIyBDT05GSUdfVUNTSV9DQ0cgaXMgbm90IHNldApDT05GSUdfVUNTSV9BQ1BJPW0K
IyBDT05GSUdfVUNTSV9TVE0zMkcwIGlzIG5vdCBzZXQKIyBDT05GSUdfVFlQRUNfVFBTNjU5
OFggaXMgbm90IHNldAojIENPTkZJR19UWVBFQ19BTlg3NDExIGlzIG5vdCBzZXQKIyBDT05G
SUdfVFlQRUNfUlQxNzE5IGlzIG5vdCBzZXQKIyBDT05GSUdfVFlQRUNfSEQzU1MzMjIwIGlz
IG5vdCBzZXQKIyBDT05GSUdfVFlQRUNfU1RVU0IxNjBYIGlzIG5vdCBzZXQKIyBDT05GSUdf
VFlQRUNfV1VTQjM4MDEgaXMgbm90IHNldAoKIwojIFVTQiBUeXBlLUMgTXVsdGlwbGV4ZXIv
RGVNdWx0aXBsZXhlciBTd2l0Y2ggc3VwcG9ydAojCiMgQ09ORklHX1RZUEVDX01VWF9GU0E0
NDgwIGlzIG5vdCBzZXQKIyBDT05GSUdfVFlQRUNfTVVYX0dQSU9fU0JVIGlzIG5vdCBzZXQK
IyBDT05GSUdfVFlQRUNfTVVYX1BJM1VTQjMwNTMyIGlzIG5vdCBzZXQKIyBDT05GSUdfVFlQ
RUNfTVVYX0lOVEVMX1BNQyBpcyBub3Qgc2V0CiMgQ09ORklHX1RZUEVDX01VWF9OQjdWUFE5
MDRNIGlzIG5vdCBzZXQKIyBlbmQgb2YgVVNCIFR5cGUtQyBNdWx0aXBsZXhlci9EZU11bHRp
cGxleGVyIFN3aXRjaCBzdXBwb3J0CgojCiMgVVNCIFR5cGUtQyBBbHRlcm5hdGUgTW9kZSBk
cml2ZXJzCiMKIyBDT05GSUdfVFlQRUNfRFBfQUxUTU9ERSBpcyBub3Qgc2V0CiMgZW5kIG9m
IFVTQiBUeXBlLUMgQWx0ZXJuYXRlIE1vZGUgZHJpdmVycwoKQ09ORklHX1VTQl9ST0xFX1NX
SVRDSD1tCiMgQ09ORklHX1VTQl9ST0xFU19JTlRFTF9YSENJIGlzIG5vdCBzZXQKIyBDT05G
SUdfTU1DIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9VRlNIQ0QgaXMgbm90IHNldAojIENP
TkZJR19NRU1TVElDSyBpcyBub3Qgc2V0CkNPTkZJR19ORVdfTEVEUz15CkNPTkZJR19MRURT
X0NMQVNTPXkKIyBDT05GSUdfTEVEU19DTEFTU19GTEFTSCBpcyBub3Qgc2V0CiMgQ09ORklH
X0xFRFNfQ0xBU1NfTVVMVElDT0xPUiBpcyBub3Qgc2V0CkNPTkZJR19MRURTX0JSSUdIVE5F
U1NfSFdfQ0hBTkdFRD15CgojCiMgTEVEIGRyaXZlcnMKIwojIENPTkZJR19MRURTX0FQVSBp
cyBub3Qgc2V0CiMgQ09ORklHX0xFRFNfQVcyMDBYWCBpcyBub3Qgc2V0CiMgQ09ORklHX0xF
RFNfQ0hUX1dDT1ZFIGlzIG5vdCBzZXQKIyBDT05GSUdfTEVEU19MTTM1MzAgaXMgbm90IHNl
dAojIENPTkZJR19MRURTX0xNMzUzMiBpcyBub3Qgc2V0CiMgQ09ORklHX0xFRFNfTE0zNjQy
IGlzIG5vdCBzZXQKIyBDT05GSUdfTEVEU19QQ0E5NTMyIGlzIG5vdCBzZXQKIyBDT05GSUdf
TEVEU19HUElPIGlzIG5vdCBzZXQKIyBDT05GSUdfTEVEU19MUDM5NDQgaXMgbm90IHNldAoj
IENPTkZJR19MRURTX0xQMzk1MiBpcyBub3Qgc2V0CiMgQ09ORklHX0xFRFNfTFA1MFhYIGlz
IG5vdCBzZXQKIyBDT05GSUdfTEVEU19QQ0E5NTVYIGlzIG5vdCBzZXQKIyBDT05GSUdfTEVE
U19QQ0E5NjNYIGlzIG5vdCBzZXQKIyBDT05GSUdfTEVEU19EQUMxMjRTMDg1IGlzIG5vdCBz
ZXQKIyBDT05GSUdfTEVEU19QV00gaXMgbm90IHNldAojIENPTkZJR19MRURTX1JFR1VMQVRP
UiBpcyBub3Qgc2V0CiMgQ09ORklHX0xFRFNfQkQyNjA2TVZWIGlzIG5vdCBzZXQKIyBDT05G
SUdfTEVEU19CRDI4MDIgaXMgbm90IHNldAojIENPTkZJR19MRURTX0lOVEVMX1NTNDIwMCBp
cyBub3Qgc2V0CiMgQ09ORklHX0xFRFNfTFQzNTkzIGlzIG5vdCBzZXQKIyBDT05GSUdfTEVE
U19UQ0E2NTA3IGlzIG5vdCBzZXQKIyBDT05GSUdfTEVEU19UTEM1OTFYWCBpcyBub3Qgc2V0
CiMgQ09ORklHX0xFRFNfTE0zNTV4IGlzIG5vdCBzZXQKIyBDT05GSUdfTEVEU19JUzMxRkwz
MTlYIGlzIG5vdCBzZXQKCiMKIyBMRUQgZHJpdmVyIGZvciBibGluaygxKSBVU0IgUkdCIExF
RCBpcyB1bmRlciBTcGVjaWFsIEhJRCBkcml2ZXJzIChISURfVEhJTkdNKQojCiMgQ09ORklH
X0xFRFNfQkxJTktNIGlzIG5vdCBzZXQKIyBDT05GSUdfTEVEU19NTFhDUExEIGlzIG5vdCBz
ZXQKIyBDT05GSUdfTEVEU19NTFhSRUcgaXMgbm90IHNldAojIENPTkZJR19MRURTX1VTRVIg
aXMgbm90IHNldAojIENPTkZJR19MRURTX05JQzc4QlggaXMgbm90IHNldAoKIwojIEZsYXNo
IGFuZCBUb3JjaCBMRUQgZHJpdmVycwojCgojCiMgUkdCIExFRCBkcml2ZXJzCiMKCiMKIyBM
RUQgVHJpZ2dlcnMKIwpDT05GSUdfTEVEU19UUklHR0VSUz15CiMgQ09ORklHX0xFRFNfVFJJ
R0dFUl9USU1FUiBpcyBub3Qgc2V0CiMgQ09ORklHX0xFRFNfVFJJR0dFUl9PTkVTSE9UIGlz
IG5vdCBzZXQKIyBDT05GSUdfTEVEU19UUklHR0VSX0hFQVJUQkVBVCBpcyBub3Qgc2V0CiMg
Q09ORklHX0xFRFNfVFJJR0dFUl9CQUNLTElHSFQgaXMgbm90IHNldAojIENPTkZJR19MRURT
X1RSSUdHRVJfQ1BVIGlzIG5vdCBzZXQKIyBDT05GSUdfTEVEU19UUklHR0VSX0FDVElWSVRZ
IGlzIG5vdCBzZXQKIyBDT05GSUdfTEVEU19UUklHR0VSX0RFRkFVTFRfT04gaXMgbm90IHNl
dAoKIwojIGlwdGFibGVzIHRyaWdnZXIgaXMgdW5kZXIgTmV0ZmlsdGVyIGNvbmZpZyAoTEVE
IHRhcmdldCkKIwojIENPTkZJR19MRURTX1RSSUdHRVJfVFJBTlNJRU5UIGlzIG5vdCBzZXQK
IyBDT05GSUdfTEVEU19UUklHR0VSX0NBTUVSQSBpcyBub3Qgc2V0CkNPTkZJR19MRURTX1RS
SUdHRVJfUEFOSUM9eQojIENPTkZJR19MRURTX1RSSUdHRVJfTkVUREVWIGlzIG5vdCBzZXQK
IyBDT05GSUdfTEVEU19UUklHR0VSX1BBVFRFUk4gaXMgbm90IHNldApDT05GSUdfTEVEU19U
UklHR0VSX0FVRElPPW0KIyBDT05GSUdfTEVEU19UUklHR0VSX1RUWSBpcyBub3Qgc2V0Cgoj
CiMgU2ltcGxlIExFRCBkcml2ZXJzCiMKQ09ORklHX0FDQ0VTU0lCSUxJVFk9eQpDT05GSUdf
QTExWV9CUkFJTExFX0NPTlNPTEU9eQoKIwojIFNwZWFrdXAgY29uc29sZSBzcGVlY2gKIwoj
IENPTkZJR19TUEVBS1VQIGlzIG5vdCBzZXQKIyBlbmQgb2YgU3BlYWt1cCBjb25zb2xlIHNw
ZWVjaAoKIyBDT05GSUdfSU5GSU5JQkFORCBpcyBub3Qgc2V0CkNPTkZJR19FREFDX0FUT01J
Q19TQ1JVQj15CkNPTkZJR19FREFDX1NVUFBPUlQ9eQpDT05GSUdfRURBQz15CiMgQ09ORklH
X0VEQUNfTEVHQUNZX1NZU0ZTIGlzIG5vdCBzZXQKIyBDT05GSUdfRURBQ19ERUJVRyBpcyBu
b3Qgc2V0CkNPTkZJR19FREFDX0RFQ09ERV9NQ0U9bQpDT05GSUdfRURBQ19HSEVTPXkKQ09O
RklHX0VEQUNfQU1ENjQ9bQojIENPTkZJR19FREFDX0U3NTJYIGlzIG5vdCBzZXQKIyBDT05G
SUdfRURBQ19JODI5NzVYIGlzIG5vdCBzZXQKIyBDT05GSUdfRURBQ19JMzAwMCBpcyBub3Qg
c2V0CiMgQ09ORklHX0VEQUNfSTMyMDAgaXMgbm90IHNldAojIENPTkZJR19FREFDX0lFMzEy
MDAgaXMgbm90IHNldAojIENPTkZJR19FREFDX1gzOCBpcyBub3Qgc2V0CiMgQ09ORklHX0VE
QUNfSTU0MDAgaXMgbm90IHNldAojIENPTkZJR19FREFDX0k1MTAwIGlzIG5vdCBzZXQKIyBD
T05GSUdfRURBQ19JNzMwMCBpcyBub3Qgc2V0CkNPTkZJR19SVENfTElCPXkKQ09ORklHX1JU
Q19NQzE0NjgxOF9MSUI9eQpDT05GSUdfUlRDX0NMQVNTPXkKQ09ORklHX1JUQ19IQ1RPU1lT
PXkKQ09ORklHX1JUQ19IQ1RPU1lTX0RFVklDRT0icnRjMCIKQ09ORklHX1JUQ19TWVNUT0hD
PXkKQ09ORklHX1JUQ19TWVNUT0hDX0RFVklDRT0icnRjMCIKIyBDT05GSUdfUlRDX0RFQlVH
IGlzIG5vdCBzZXQKQ09ORklHX1JUQ19OVk1FTT15CgojCiMgUlRDIGludGVyZmFjZXMKIwpD
T05GSUdfUlRDX0lOVEZfU1lTRlM9eQpDT05GSUdfUlRDX0lOVEZfUFJPQz15CkNPTkZJR19S
VENfSU5URl9ERVY9eQojIENPTkZJR19SVENfSU5URl9ERVZfVUlFX0VNVUwgaXMgbm90IHNl
dAojIENPTkZJR19SVENfRFJWX1RFU1QgaXMgbm90IHNldAoKIwojIEkyQyBSVEMgZHJpdmVy
cwojCiMgQ09ORklHX1JUQ19EUlZfQUJCNVpFUzMgaXMgbm90IHNldAojIENPTkZJR19SVENf
RFJWX0FCRU9aOSBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfQUJYODBYIGlzIG5vdCBz
ZXQKIyBDT05GSUdfUlRDX0RSVl9EUzEzMDcgaXMgbm90IHNldAojIENPTkZJR19SVENfRFJW
X0RTMTM3NCBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfRFMxNjcyIGlzIG5vdCBzZXQK
IyBDT05GSUdfUlRDX0RSVl9NQVg2OTAwIGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9S
UzVDMzcyIGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9JU0wxMjA4IGlzIG5vdCBzZXQK
IyBDT05GSUdfUlRDX0RSVl9JU0wxMjAyMiBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZf
WDEyMDUgaXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX1BDRjg1MjMgaXMgbm90IHNldAoj
IENPTkZJR19SVENfRFJWX1BDRjg1MDYzIGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9Q
Q0Y4NTM2MyBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfUENGODU2MyBpcyBub3Qgc2V0
CiMgQ09ORklHX1JUQ19EUlZfUENGODU4MyBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZf
TTQxVDgwIGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9CUTMySyBpcyBub3Qgc2V0CiMg
Q09ORklHX1JUQ19EUlZfUzM1MzkwQSBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfRk0z
MTMwIGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9SWDgwMTAgaXMgbm90IHNldAojIENP
TkZJR19SVENfRFJWX1JYODU4MSBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfUlg4MDI1
IGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9FTTMwMjcgaXMgbm90IHNldAojIENPTkZJ
R19SVENfRFJWX1JWMzAyOCBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfUlYzMDMyIGlz
IG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9SVjg4MDMgaXMgbm90IHNldAojIENPTkZJR19S
VENfRFJWX1NEMzA3OCBpcyBub3Qgc2V0CgojCiMgU1BJIFJUQyBkcml2ZXJzCiMKIyBDT05G
SUdfUlRDX0RSVl9NNDFUOTMgaXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX000MVQ5NCBp
cyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfRFMxMzAyIGlzIG5vdCBzZXQKIyBDT05GSUdf
UlRDX0RSVl9EUzEzMDUgaXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX0RTMTM0MyBpcyBu
b3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfRFMxMzQ3IGlzIG5vdCBzZXQKIyBDT05GSUdfUlRD
X0RSVl9EUzEzOTAgaXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX01BWDY5MTYgaXMgbm90
IHNldAojIENPTkZJR19SVENfRFJWX1I5NzAxIGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RS
Vl9SWDQ1ODEgaXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX1JTNUMzNDggaXMgbm90IHNl
dAojIENPTkZJR19SVENfRFJWX01BWDY5MDIgaXMgbm90IHNldAojIENPTkZJR19SVENfRFJW
X1BDRjIxMjMgaXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX01DUDc5NSBpcyBub3Qgc2V0
CkNPTkZJR19SVENfSTJDX0FORF9TUEk9eQoKIwojIFNQSSBhbmQgSTJDIFJUQyBkcml2ZXJz
CiMKIyBDT05GSUdfUlRDX0RSVl9EUzMyMzIgaXMgbm90IHNldAojIENPTkZJR19SVENfRFJW
X1BDRjIxMjcgaXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX1JWMzAyOUMyIGlzIG5vdCBz
ZXQKIyBDT05GSUdfUlRDX0RSVl9SWDYxMTAgaXMgbm90IHNldAoKIwojIFBsYXRmb3JtIFJU
QyBkcml2ZXJzCiMKQ09ORklHX1JUQ19EUlZfQ01PUz15CiMgQ09ORklHX1JUQ19EUlZfRFMx
Mjg2IGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9EUzE1MTEgaXMgbm90IHNldAojIENP
TkZJR19SVENfRFJWX0RTMTU1MyBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfRFMxNjg1
X0ZBTUlMWSBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfRFMxNzQyIGlzIG5vdCBzZXQK
IyBDT05GSUdfUlRDX0RSVl9EUzI0MDQgaXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX1NU
SzE3VEE4IGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9NNDhUODYgaXMgbm90IHNldAoj
IENPTkZJR19SVENfRFJWX000OFQzNSBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfTTQ4
VDU5IGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9NU002MjQyIGlzIG5vdCBzZXQKIyBD
T05GSUdfUlRDX0RSVl9CUTQ4MDIgaXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX1JQNUMw
MSBpcyBub3Qgc2V0CgojCiMgb24tQ1BVIFJUQyBkcml2ZXJzCiMKIyBDT05GSUdfUlRDX0RS
Vl9GVFJUQzAxMCBpcyBub3Qgc2V0CgojCiMgSElEIFNlbnNvciBSVEMgZHJpdmVycwojCiMg
Q09ORklHX1JUQ19EUlZfR09MREZJU0ggaXMgbm90IHNldApDT05GSUdfRE1BREVWSUNFUz15
CiMgQ09ORklHX0RNQURFVklDRVNfREVCVUcgaXMgbm90IHNldAoKIwojIERNQSBEZXZpY2Vz
CiMKQ09ORklHX0RNQV9FTkdJTkU9eQpDT05GSUdfRE1BX1ZJUlRVQUxfQ0hBTk5FTFM9eQpD
T05GSUdfRE1BX0FDUEk9eQojIENPTkZJR19BTFRFUkFfTVNHRE1BIGlzIG5vdCBzZXQKIyBD
T05GSUdfSU5URUxfSURNQTY0IGlzIG5vdCBzZXQKIyBDT05GSUdfSU5URUxfSURYRCBpcyBu
b3Qgc2V0CiMgQ09ORklHX0lOVEVMX0lEWERfQ09NUEFUIGlzIG5vdCBzZXQKIyBDT05GSUdf
SU5URUxfSU9BVERNQSBpcyBub3Qgc2V0CiMgQ09ORklHX1BMWF9ETUEgaXMgbm90IHNldAoj
IENPTkZJR19YSUxJTlhfWERNQSBpcyBub3Qgc2V0CkNPTkZJR19BTURfUFRETUE9bQojIENP
TkZJR19RQ09NX0hJRE1BX01HTVQgaXMgbm90IHNldAojIENPTkZJR19RQ09NX0hJRE1BIGlz
IG5vdCBzZXQKQ09ORklHX0RXX0RNQUNfQ09SRT15CiMgQ09ORklHX0RXX0RNQUMgaXMgbm90
IHNldApDT05GSUdfRFdfRE1BQ19QQ0k9eQojIENPTkZJR19EV19FRE1BIGlzIG5vdCBzZXQK
Q09ORklHX0hTVV9ETUE9eQojIENPTkZJR19TRl9QRE1BIGlzIG5vdCBzZXQKIyBDT05GSUdf
SU5URUxfTERNQSBpcyBub3Qgc2V0CgojCiMgRE1BIENsaWVudHMKIwpDT05GSUdfQVNZTkNf
VFhfRE1BPXkKIyBDT05GSUdfRE1BVEVTVCBpcyBub3Qgc2V0CgojCiMgRE1BQlVGIG9wdGlv
bnMKIwpDT05GSUdfU1lOQ19GSUxFPXkKIyBDT05GSUdfU1dfU1lOQyBpcyBub3Qgc2V0CkNP
TkZJR19VRE1BQlVGPXkKIyBDT05GSUdfRE1BQlVGX01PVkVfTk9USUZZIGlzIG5vdCBzZXQK
IyBDT05GSUdfRE1BQlVGX0RFQlVHIGlzIG5vdCBzZXQKIyBDT05GSUdfRE1BQlVGX1NFTEZU
RVNUUyBpcyBub3Qgc2V0CkNPTkZJR19ETUFCVUZfSEVBUFM9eQpDT05GSUdfRE1BQlVGX1NZ
U0ZTX1NUQVRTPXkKQ09ORklHX0RNQUJVRl9IRUFQU19TWVNURU09eQojIGVuZCBvZiBETUFC
VUYgb3B0aW9ucwoKQ09ORklHX0FVWERJU1BMQVk9eQojIENPTkZJR19IRDQ0NzgwIGlzIG5v
dCBzZXQKIyBDT05GSUdfSU1HX0FTQ0lJX0xDRCBpcyBub3Qgc2V0CiMgQ09ORklHX0hUMTZL
MzMgaXMgbm90IHNldAojIENPTkZJR19MQ0QyUyBpcyBub3Qgc2V0CiMgQ09ORklHX0NIQVJM
Q0RfQkxfT0ZGIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0hBUkxDRF9CTF9PTiBpcyBub3Qgc2V0
CkNPTkZJR19DSEFSTENEX0JMX0ZMQVNIPXkKIyBDT05GSUdfVUlPIGlzIG5vdCBzZXQKIyBD
T05GSUdfVkZJTyBpcyBub3Qgc2V0CkNPTkZJR19JUlFfQllQQVNTX01BTkFHRVI9bQpDT05G
SUdfVklSVF9EUklWRVJTPXkKQ09ORklHX1ZNR0VOSUQ9bQojIENPTkZJR19WQk9YR1VFU1Qg
aXMgbm90IHNldAojIENPTkZJR19OSVRST19FTkNMQVZFUyBpcyBub3Qgc2V0CiMgQ09ORklH
X0VGSV9TRUNSRVQgaXMgbm90IHNldApDT05GSUdfU0VWX0dVRVNUPW0KQ09ORklHX1ZJUlRJ
T19BTkNIT1I9eQpDT05GSUdfVklSVElPPW0KQ09ORklHX1ZJUlRJT19QQ0lfTElCPW0KQ09O
RklHX1ZJUlRJT19QQ0lfTElCX0xFR0FDWT1tCkNPTkZJR19WSVJUSU9fTUVOVT15CkNPTkZJ
R19WSVJUSU9fUENJPW0KQ09ORklHX1ZJUlRJT19QQ0lfTEVHQUNZPXkKIyBDT05GSUdfVklS
VElPX1BNRU0gaXMgbm90IHNldAojIENPTkZJR19WSVJUSU9fQkFMTE9PTiBpcyBub3Qgc2V0
CiMgQ09ORklHX1ZJUlRJT19JTlBVVCBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJUlRJT19NTUlP
IGlzIG5vdCBzZXQKIyBDT05GSUdfVkRQQSBpcyBub3Qgc2V0CkNPTkZJR19WSE9TVF9JT1RM
Qj1tCkNPTkZJR19WSE9TVF9UQVNLPXkKQ09ORklHX1ZIT1NUPW0KQ09ORklHX1ZIT1NUX01F
TlU9eQpDT05GSUdfVkhPU1RfTkVUPW0KIyBDT05GSUdfVkhPU1RfQ1JPU1NfRU5ESUFOX0xF
R0FDWSBpcyBub3Qgc2V0CgojCiMgTWljcm9zb2Z0IEh5cGVyLVYgZ3Vlc3Qgc3VwcG9ydAoj
CiMgQ09ORklHX0hZUEVSViBpcyBub3Qgc2V0CiMgZW5kIG9mIE1pY3Jvc29mdCBIeXBlci1W
IGd1ZXN0IHN1cHBvcnQKCiMgQ09ORklHX0dSRVlCVVMgaXMgbm90IHNldAojIENPTkZJR19D
T01FREkgaXMgbm90IHNldAojIENPTkZJR19TVEFHSU5HIGlzIG5vdCBzZXQKIyBDT05GSUdf
Q0hST01FX1BMQVRGT1JNUyBpcyBub3Qgc2V0CiMgQ09ORklHX01FTExBTk9YX1BMQVRGT1JN
IGlzIG5vdCBzZXQKIyBDT05GSUdfU1VSRkFDRV9QTEFURk9STVMgaXMgbm90IHNldApDT05G
SUdfWDg2X1BMQVRGT1JNX0RFVklDRVM9eQpDT05GSUdfQUNQSV9XTUk9bQpDT05GSUdfV01J
X0JNT0Y9bQojIENPTkZJR19IVUFXRUlfV01JIGlzIG5vdCBzZXQKIyBDT05GSUdfTVhNX1dN
SSBpcyBub3Qgc2V0CiMgQ09ORklHX05WSURJQV9XTUlfRUNfQkFDS0xJR0hUIGlzIG5vdCBz
ZXQKIyBDT05GSUdfWElBT01JX1dNSSBpcyBub3Qgc2V0CiMgQ09ORklHX0dJR0FCWVRFX1dN
SSBpcyBub3Qgc2V0CiMgQ09ORklHX1lPR0FCT09LIGlzIG5vdCBzZXQKIyBDT05GSUdfQUNF
UkhERiBpcyBub3Qgc2V0CiMgQ09ORklHX0FDRVJfV0lSRUxFU1MgaXMgbm90IHNldAojIENP
TkZJR19BQ0VSX1dNSSBpcyBub3Qgc2V0CiMgQ09ORklHX0FNRF9QTUYgaXMgbm90IHNldApD
T05GSUdfQU1EX1BNQz1tCiMgQ09ORklHX0FNRF9IU01QIGlzIG5vdCBzZXQKIyBDT05GSUdf
QURWX1NXQlVUVE9OIGlzIG5vdCBzZXQKIyBDT05GSUdfQVBQTEVfR01VWCBpcyBub3Qgc2V0
CiMgQ09ORklHX0FTVVNfTEFQVE9QIGlzIG5vdCBzZXQKIyBDT05GSUdfQVNVU19XSVJFTEVT
UyBpcyBub3Qgc2V0CiMgQ09ORklHX0FTVVNfV01JIGlzIG5vdCBzZXQKIyBDT05GSUdfQVNV
U19URjEwM0NfRE9DSyBpcyBub3Qgc2V0CiMgQ09ORklHX0VFRVBDX0xBUFRPUCBpcyBub3Qg
c2V0CiMgQ09ORklHX1g4Nl9QTEFURk9STV9EUklWRVJTX0RFTEwgaXMgbm90IHNldAojIENP
TkZJR19BTUlMT19SRktJTEwgaXMgbm90IHNldAojIENPTkZJR19GVUpJVFNVX0xBUFRPUCBp
cyBub3Qgc2V0CiMgQ09ORklHX0ZVSklUU1VfVEFCTEVUIGlzIG5vdCBzZXQKIyBDT05GSUdf
R1BEX1BPQ0tFVF9GQU4gaXMgbm90IHNldAojIENPTkZJR19YODZfUExBVEZPUk1fRFJJVkVS
U19IUCBpcyBub3Qgc2V0CiMgQ09ORklHX1dJUkVMRVNTX0hPVEtFWSBpcyBub3Qgc2V0CiMg
Q09ORklHX0lCTV9SVEwgaXMgbm90IHNldAojIENPTkZJR19JREVBUEFEX0xBUFRPUCBpcyBu
b3Qgc2V0CiMgQ09ORklHX0xFTk9WT19ZTUMgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JT
X0hEQVBTIGlzIG5vdCBzZXQKQ09ORklHX1RISU5LUEFEX0FDUEk9bQpDT05GSUdfVEhJTktQ
QURfQUNQSV9BTFNBX1NVUFBPUlQ9eQojIENPTkZJR19USElOS1BBRF9BQ1BJX0RFQlVHRkFD
SUxJVElFUyBpcyBub3Qgc2V0CiMgQ09ORklHX1RISU5LUEFEX0FDUElfREVCVUcgaXMgbm90
IHNldAojIENPTkZJR19USElOS1BBRF9BQ1BJX1VOU0FGRV9MRURTIGlzIG5vdCBzZXQKQ09O
RklHX1RISU5LUEFEX0FDUElfVklERU89eQpDT05GSUdfVEhJTktQQURfQUNQSV9IT1RLRVlf
UE9MTD15CkNPTkZJR19USElOS1BBRF9MTUk9bQojIENPTkZJR19JTlRFTF9BVE9NSVNQMl9Q
TSBpcyBub3Qgc2V0CiMgQ09ORklHX0lOVEVMX1NBUl9JTlQxMDkyIGlzIG5vdCBzZXQKIyBD
T05GSUdfSU5URUxfU0tMX0lOVDM0NzIgaXMgbm90IHNldApDT05GSUdfSU5URUxfUE1DX0NP
UkU9eQoKIwojIEludGVsIFNwZWVkIFNlbGVjdCBUZWNobm9sb2d5IGludGVyZmFjZSBzdXBw
b3J0CiMKIyBDT05GSUdfSU5URUxfU1BFRURfU0VMRUNUX0lOVEVSRkFDRSBpcyBub3Qgc2V0
CiMgZW5kIG9mIEludGVsIFNwZWVkIFNlbGVjdCBUZWNobm9sb2d5IGludGVyZmFjZSBzdXBw
b3J0CgojIENPTkZJR19JTlRFTF9XTUlfU0JMX0ZXX1VQREFURSBpcyBub3Qgc2V0CiMgQ09O
RklHX0lOVEVMX1dNSV9USFVOREVSQk9MVCBpcyBub3Qgc2V0CgojCiMgSW50ZWwgVW5jb3Jl
IEZyZXF1ZW5jeSBDb250cm9sCiMKIyBDT05GSUdfSU5URUxfVU5DT1JFX0ZSRVFfQ09OVFJP
TCBpcyBub3Qgc2V0CiMgZW5kIG9mIEludGVsIFVuY29yZSBGcmVxdWVuY3kgQ29udHJvbAoK
IyBDT05GSUdfSU5URUxfSElEX0VWRU5UIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5URUxfVkJU
TiBpcyBub3Qgc2V0CiMgQ09ORklHX0lOVEVMX0lOVDAwMDJfVkdQSU8gaXMgbm90IHNldAoj
IENPTkZJR19JTlRFTF9PQUtUUkFJTCBpcyBub3Qgc2V0CiMgQ09ORklHX0lOVEVMX0JZVENS
Q19QV1JTUkMgaXMgbm90IHNldAojIENPTkZJR19JTlRFTF9QVU5JVF9JUEMgaXMgbm90IHNl
dAojIENPTkZJR19JTlRFTF9SU1QgaXMgbm90IHNldApDT05GSUdfSU5URUxfU01BUlRDT05O
RUNUPXkKIyBDT05GSUdfSU5URUxfVlNFQyBpcyBub3Qgc2V0CiMgQ09ORklHX01TSV9FQyBp
cyBub3Qgc2V0CiMgQ09ORklHX01TSV9MQVBUT1AgaXMgbm90IHNldAojIENPTkZJR19NU0lf
V01JIGlzIG5vdCBzZXQKIyBDT05GSUdfUENFTkdJTkVTX0FQVTIgaXMgbm90IHNldAojIENP
TkZJR19CQVJDT19QNTBfR1BJTyBpcyBub3Qgc2V0CiMgQ09ORklHX1NBTVNVTkdfTEFQVE9Q
IGlzIG5vdCBzZXQKIyBDT05GSUdfU0FNU1VOR19RMTAgaXMgbm90IHNldAojIENPTkZJR19U
T1NISUJBX0JUX1JGS0lMTCBpcyBub3Qgc2V0CiMgQ09ORklHX1RPU0hJQkFfSEFQUyBpcyBu
b3Qgc2V0CiMgQ09ORklHX1RPU0hJQkFfV01JIGlzIG5vdCBzZXQKIyBDT05GSUdfQUNQSV9D
TVBDIGlzIG5vdCBzZXQKIyBDT05GSUdfQ09NUEFMX0xBUFRPUCBpcyBub3Qgc2V0CiMgQ09O
RklHX0xHX0xBUFRPUCBpcyBub3Qgc2V0CiMgQ09ORklHX1BBTkFTT05JQ19MQVBUT1AgaXMg
bm90IHNldAojIENPTkZJR19TT05ZX0xBUFRPUCBpcyBub3Qgc2V0CiMgQ09ORklHX1NZU1RF
TTc2X0FDUEkgaXMgbm90IHNldAojIENPTkZJR19UT1BTVEFSX0xBUFRPUCBpcyBub3Qgc2V0
CiMgQ09ORklHX1NFUklBTF9NVUxUSV9JTlNUQU5USUFURSBpcyBub3Qgc2V0CiMgQ09ORklH
X01MWF9QTEFURk9STSBpcyBub3Qgc2V0CiMgQ09ORklHX1g4Nl9BTkRST0lEX1RBQkxFVFMg
aXMgbm90IHNldApDT05GSUdfRldfQVRUUl9DTEFTUz1tCiMgQ09ORklHX0lOVEVMX0lQUyBp
cyBub3Qgc2V0CkNPTkZJR19JTlRFTF9TQ1VfSVBDPXkKQ09ORklHX0lOVEVMX1NDVT15CkNP
TkZJR19JTlRFTF9TQ1VfUENJPXkKIyBDT05GSUdfSU5URUxfU0NVX1BMQVRGT1JNIGlzIG5v
dCBzZXQKIyBDT05GSUdfSU5URUxfU0NVX0lQQ19VVElMIGlzIG5vdCBzZXQKIyBDT05GSUdf
U0lFTUVOU19TSU1BVElDX0lQQyBpcyBub3Qgc2V0CiMgQ09ORklHX1dJTk1BVEVfRk0wN19L
RVlTIGlzIG5vdCBzZXQKIyBDT05GSUdfUDJTQiBpcyBub3Qgc2V0CkNPTkZJR19IQVZFX0NM
Sz15CkNPTkZJR19IQVZFX0NMS19QUkVQQVJFPXkKQ09ORklHX0NPTU1PTl9DTEs9eQojIENP
TkZJR19MTUswNDgzMiBpcyBub3Qgc2V0CiMgQ09ORklHX0NPTU1PTl9DTEtfTUFYOTQ4NSBp
cyBub3Qgc2V0CiMgQ09ORklHX0NPTU1PTl9DTEtfU0k1MzQxIGlzIG5vdCBzZXQKIyBDT05G
SUdfQ09NTU9OX0NMS19TSTUzNTEgaXMgbm90IHNldAojIENPTkZJR19DT01NT05fQ0xLX1NJ
NTQ0IGlzIG5vdCBzZXQKIyBDT05GSUdfQ09NTU9OX0NMS19DRENFNzA2IGlzIG5vdCBzZXQK
IyBDT05GSUdfQ09NTU9OX0NMS19DUzIwMDBfQ1AgaXMgbm90IHNldAojIENPTkZJR19DT01N
T05fQ0xLX1BXTSBpcyBub3Qgc2V0CiMgQ09ORklHX1hJTElOWF9WQ1UgaXMgbm90IHNldApD
T05GSUdfSFdTUElOTE9DSz15CgojCiMgQ2xvY2sgU291cmNlIGRyaXZlcnMKIwpDT05GSUdf
Q0xLRVZUX0k4MjUzPXkKQ09ORklHX0NMS0JMRF9JODI1Mz15CiMgZW5kIG9mIENsb2NrIFNv
dXJjZSBkcml2ZXJzCgpDT05GSUdfTUFJTEJPWD15CkNPTkZJR19QQ0M9eQojIENPTkZJR19B
TFRFUkFfTUJPWCBpcyBub3Qgc2V0CkNPTkZJR19JT01NVV9JT1ZBPXkKQ09ORklHX0lPTU1V
X0FQST15CkNPTkZJR19JT01NVV9TVVBQT1JUPXkKCiMKIyBHZW5lcmljIElPTU1VIFBhZ2V0
YWJsZSBTdXBwb3J0CiMKQ09ORklHX0lPTU1VX0lPX1BHVEFCTEU9eQojIGVuZCBvZiBHZW5l
cmljIElPTU1VIFBhZ2V0YWJsZSBTdXBwb3J0CgojIENPTkZJR19JT01NVV9ERUJVR0ZTIGlz
IG5vdCBzZXQKIyBDT05GSUdfSU9NTVVfREVGQVVMVF9ETUFfU1RSSUNUIGlzIG5vdCBzZXQK
Q09ORklHX0lPTU1VX0RFRkFVTFRfRE1BX0xBWlk9eQojIENPTkZJR19JT01NVV9ERUZBVUxU
X1BBU1NUSFJPVUdIIGlzIG5vdCBzZXQKQ09ORklHX0lPTU1VX0RNQT15CkNPTkZJR19JT01N
VV9TVkE9eQpDT05GSUdfQU1EX0lPTU1VPXkKQ09ORklHX0FNRF9JT01NVV9WMj1tCkNPTkZJ
R19ETUFSX1RBQkxFPXkKQ09ORklHX0lOVEVMX0lPTU1VPXkKQ09ORklHX0lOVEVMX0lPTU1V
X1NWTT15CiMgQ09ORklHX0lOVEVMX0lPTU1VX0RFRkFVTFRfT04gaXMgbm90IHNldApDT05G
SUdfSU5URUxfSU9NTVVfRkxPUFBZX1dBPXkKQ09ORklHX0lOVEVMX0lPTU1VX1NDQUxBQkxF
X01PREVfREVGQVVMVF9PTj15CkNPTkZJR19JTlRFTF9JT01NVV9QRVJGX0VWRU5UUz15CiMg
Q09ORklHX0lPTU1VRkQgaXMgbm90IHNldApDT05GSUdfSVJRX1JFTUFQPXkKIyBDT05GSUdf
VklSVElPX0lPTU1VIGlzIG5vdCBzZXQKCiMKIyBSZW1vdGVwcm9jIGRyaXZlcnMKIwojIENP
TkZJR19SRU1PVEVQUk9DIGlzIG5vdCBzZXQKIyBlbmQgb2YgUmVtb3RlcHJvYyBkcml2ZXJz
CgojCiMgUnBtc2cgZHJpdmVycwojCiMgQ09ORklHX1JQTVNHX1FDT01fR0xJTktfUlBNIGlz
IG5vdCBzZXQKIyBDT05GSUdfUlBNU0dfVklSVElPIGlzIG5vdCBzZXQKIyBlbmQgb2YgUnBt
c2cgZHJpdmVycwoKIyBDT05GSUdfU09VTkRXSVJFIGlzIG5vdCBzZXQKCiMKIyBTT0MgKFN5
c3RlbSBPbiBDaGlwKSBzcGVjaWZpYyBEcml2ZXJzCiMKCiMKIyBBbWxvZ2ljIFNvQyBkcml2
ZXJzCiMKIyBlbmQgb2YgQW1sb2dpYyBTb0MgZHJpdmVycwoKIwojIEJyb2FkY29tIFNvQyBk
cml2ZXJzCiMKIyBlbmQgb2YgQnJvYWRjb20gU29DIGRyaXZlcnMKCiMKIyBOWFAvRnJlZXNj
YWxlIFFvcklRIFNvQyBkcml2ZXJzCiMKIyBlbmQgb2YgTlhQL0ZyZWVzY2FsZSBRb3JJUSBT
b0MgZHJpdmVycwoKIwojIGZ1aml0c3UgU29DIGRyaXZlcnMKIwojIGVuZCBvZiBmdWppdHN1
IFNvQyBkcml2ZXJzCgojCiMgaS5NWCBTb0MgZHJpdmVycwojCiMgZW5kIG9mIGkuTVggU29D
IGRyaXZlcnMKCiMKIyBFbmFibGUgTGl0ZVggU29DIEJ1aWxkZXIgc3BlY2lmaWMgZHJpdmVy
cwojCiMgZW5kIG9mIEVuYWJsZSBMaXRlWCBTb0MgQnVpbGRlciBzcGVjaWZpYyBkcml2ZXJz
CgojIENPTkZJR19XUENNNDUwX1NPQyBpcyBub3Qgc2V0CgojCiMgUXVhbGNvbW0gU29DIGRy
aXZlcnMKIwpDT05GSUdfUUNPTV9RTUlfSEVMUEVSUz1tCiMgZW5kIG9mIFF1YWxjb21tIFNv
QyBkcml2ZXJzCgojIENPTkZJR19TT0NfVEkgaXMgbm90IHNldAoKIwojIFhpbGlueCBTb0Mg
ZHJpdmVycwojCiMgZW5kIG9mIFhpbGlueCBTb0MgZHJpdmVycwojIGVuZCBvZiBTT0MgKFN5
c3RlbSBPbiBDaGlwKSBzcGVjaWZpYyBEcml2ZXJzCgojIENPTkZJR19QTV9ERVZGUkVRIGlz
IG5vdCBzZXQKQ09ORklHX0VYVENPTj15CgojCiMgRXh0Y29uIERldmljZSBEcml2ZXJzCiMK
IyBDT05GSUdfRVhUQ09OX0FYUDI4OCBpcyBub3Qgc2V0CiMgQ09ORklHX0VYVENPTl9GU0E5
NDgwIGlzIG5vdCBzZXQKIyBDT05GSUdfRVhUQ09OX0dQSU8gaXMgbm90IHNldAojIENPTkZJ
R19FWFRDT05fSU5URUxfSU5UMzQ5NiBpcyBub3Qgc2V0CiMgQ09ORklHX0VYVENPTl9JTlRF
TF9DSFRfV0MgaXMgbm90IHNldAojIENPTkZJR19FWFRDT05fTUFYMzM1NSBpcyBub3Qgc2V0
CiMgQ09ORklHX0VYVENPTl9QVE41MTUwIGlzIG5vdCBzZXQKIyBDT05GSUdfRVhUQ09OX1JU
ODk3M0EgaXMgbm90IHNldAojIENPTkZJR19FWFRDT05fU001NTAyIGlzIG5vdCBzZXQKIyBD
T05GSUdfRVhUQ09OX1VTQl9HUElPIGlzIG5vdCBzZXQKIyBDT05GSUdfRVhUQ09OX1VTQkNf
VFVTQjMyMCBpcyBub3Qgc2V0CiMgQ09ORklHX01FTU9SWSBpcyBub3Qgc2V0CiMgQ09ORklH
X0lJTyBpcyBub3Qgc2V0CiMgQ09ORklHX05UQiBpcyBub3Qgc2V0CkNPTkZJR19QV009eQpD
T05GSUdfUFdNX1NZU0ZTPXkKIyBDT05GSUdfUFdNX0RFQlVHIGlzIG5vdCBzZXQKIyBDT05G
SUdfUFdNX0NMSyBpcyBub3Qgc2V0CkNPTkZJR19QV01fQ1JDPXkKIyBDT05GSUdfUFdNX0RX
QyBpcyBub3Qgc2V0CiMgQ09ORklHX1BXTV9MUFNTX1BDSSBpcyBub3Qgc2V0CiMgQ09ORklH
X1BXTV9MUFNTX1BMQVRGT1JNIGlzIG5vdCBzZXQKIyBDT05GSUdfUFdNX1BDQTk2ODUgaXMg
bm90IHNldAoKIwojIElSUSBjaGlwIHN1cHBvcnQKIwojIGVuZCBvZiBJUlEgY2hpcCBzdXBw
b3J0CgojIENPTkZJR19JUEFDS19CVVMgaXMgbm90IHNldApDT05GSUdfUkVTRVRfQ09OVFJP
TExFUj15CiMgQ09ORklHX1JFU0VUX1NJTVBMRSBpcyBub3Qgc2V0CiMgQ09ORklHX1JFU0VU
X1RJX1NZU0NPTiBpcyBub3Qgc2V0CiMgQ09ORklHX1JFU0VUX1RJX1RQUzM4MFggaXMgbm90
IHNldAoKIwojIFBIWSBTdWJzeXN0ZW0KIwpDT05GSUdfR0VORVJJQ19QSFk9eQojIENPTkZJ
R19VU0JfTEdNX1BIWSBpcyBub3Qgc2V0CiMgQ09ORklHX1BIWV9DQU5fVFJBTlNDRUlWRVIg
aXMgbm90IHNldAoKIwojIFBIWSBkcml2ZXJzIGZvciBCcm9hZGNvbSBwbGF0Zm9ybXMKIwoj
IENPTkZJR19CQ01fS09OQV9VU0IyX1BIWSBpcyBub3Qgc2V0CiMgZW5kIG9mIFBIWSBkcml2
ZXJzIGZvciBCcm9hZGNvbSBwbGF0Zm9ybXMKCiMgQ09ORklHX1BIWV9QWEFfMjhOTV9IU0lD
IGlzIG5vdCBzZXQKIyBDT05GSUdfUEhZX1BYQV8yOE5NX1VTQjIgaXMgbm90IHNldAojIENP
TkZJR19QSFlfSU5URUxfTEdNX0VNTUMgaXMgbm90IHNldAojIGVuZCBvZiBQSFkgU3Vic3lz
dGVtCgpDT05GSUdfUE9XRVJDQVA9eQpDT05GSUdfSU5URUxfUkFQTF9DT1JFPW0KQ09ORklH
X0lOVEVMX1JBUEw9bQojIENPTkZJR19JRExFX0lOSkVDVCBpcyBub3Qgc2V0CiMgQ09ORklH
X01DQiBpcyBub3Qgc2V0CgojCiMgUGVyZm9ybWFuY2UgbW9uaXRvciBzdXBwb3J0CiMKIyBl
bmQgb2YgUGVyZm9ybWFuY2UgbW9uaXRvciBzdXBwb3J0CgpDT05GSUdfUkFTPXkKQ09ORklH
X1JBU19DRUM9eQojIENPTkZJR19SQVNfQ0VDX0RFQlVHIGlzIG5vdCBzZXQKIyBDT05GSUdf
VVNCNCBpcyBub3Qgc2V0CgojCiMgQW5kcm9pZAojCiMgQ09ORklHX0FORFJPSURfQklOREVS
X0lQQyBpcyBub3Qgc2V0CiMgZW5kIG9mIEFuZHJvaWQKCkNPTkZJR19MSUJOVkRJTU09eQpD
T05GSUdfQkxLX0RFVl9QTUVNPXkKQ09ORklHX05EX0NMQUlNPXkKQ09ORklHX05EX0JUVD15
CkNPTkZJR19CVFQ9eQpDT05GSUdfTlZESU1NX0tFWVM9eQojIENPTkZJR19OVkRJTU1fU0VD
VVJJVFlfVEVTVCBpcyBub3Qgc2V0CkNPTkZJR19EQVg9eQojIENPTkZJR19ERVZfREFYIGlz
IG5vdCBzZXQKIyBDT05GSUdfREVWX0RBWF9ITUVNIGlzIG5vdCBzZXQKQ09ORklHX05WTUVN
PXkKQ09ORklHX05WTUVNX1NZU0ZTPXkKCiMKIyBMYXlvdXQgVHlwZXMKIwojIENPTkZJR19O
Vk1FTV9MQVlPVVRfU0wyOF9WUEQgaXMgbm90IHNldAojIENPTkZJR19OVk1FTV9MQVlPVVRf
T05JRV9UTFYgaXMgbm90IHNldAojIGVuZCBvZiBMYXlvdXQgVHlwZXMKCiMgQ09ORklHX05W
TUVNX1JNRU0gaXMgbm90IHNldAoKIwojIEhXIHRyYWNpbmcgc3VwcG9ydAojCiMgQ09ORklH
X1NUTSBpcyBub3Qgc2V0CiMgQ09ORklHX0lOVEVMX1RIIGlzIG5vdCBzZXQKIyBlbmQgb2Yg
SFcgdHJhY2luZyBzdXBwb3J0CgojIENPTkZJR19GUEdBIGlzIG5vdCBzZXQKIyBDT05GSUdf
VEVFIGlzIG5vdCBzZXQKIyBDT05GSUdfU0lPWCBpcyBub3Qgc2V0CiMgQ09ORklHX1NMSU1C
VVMgaXMgbm90IHNldApDT05GSUdfSU5URVJDT05ORUNUPXkKIyBDT05GSUdfQ09VTlRFUiBp
cyBub3Qgc2V0CiMgQ09ORklHX1BFQ0kgaXMgbm90IHNldAojIENPTkZJR19IVEUgaXMgbm90
IHNldAojIGVuZCBvZiBEZXZpY2UgRHJpdmVycwoKIwojIEZpbGUgc3lzdGVtcwojCkNPTkZJ
R19EQ0FDSEVfV09SRF9BQ0NFU1M9eQojIENPTkZJR19WQUxJREFURV9GU19QQVJTRVIgaXMg
bm90IHNldApDT05GSUdfRlNfSU9NQVA9eQpDT05GSUdfTEVHQUNZX0RJUkVDVF9JTz15CiMg
Q09ORklHX0VYVDJfRlMgaXMgbm90IHNldAojIENPTkZJR19FWFQzX0ZTIGlzIG5vdCBzZXQK
Q09ORklHX0VYVDRfRlM9eQpDT05GSUdfRVhUNF9VU0VfRk9SX0VYVDI9eQpDT05GSUdfRVhU
NF9GU19QT1NJWF9BQ0w9eQpDT05GSUdfRVhUNF9GU19TRUNVUklUWT15CiMgQ09ORklHX0VY
VDRfREVCVUcgaXMgbm90IHNldApDT05GSUdfSkJEMj15CiMgQ09ORklHX0pCRDJfREVCVUcg
aXMgbm90IHNldApDT05GSUdfRlNfTUJDQUNIRT15CiMgQ09ORklHX1JFSVNFUkZTX0ZTIGlz
IG5vdCBzZXQKIyBDT05GSUdfSkZTX0ZTIGlzIG5vdCBzZXQKIyBDT05GSUdfWEZTX0ZTIGlz
IG5vdCBzZXQKIyBDT05GSUdfR0ZTMl9GUyBpcyBub3Qgc2V0CiMgQ09ORklHX0JUUkZTX0ZT
IGlzIG5vdCBzZXQKIyBDT05GSUdfTklMRlMyX0ZTIGlzIG5vdCBzZXQKIyBDT05GSUdfRjJG
U19GUyBpcyBub3Qgc2V0CkNPTkZJR19GU19QT1NJWF9BQ0w9eQpDT05GSUdfRVhQT1JURlM9
eQpDT05GSUdfRVhQT1JURlNfQkxPQ0tfT1BTPXkKQ09ORklHX0ZJTEVfTE9DS0lORz15CkNP
TkZJR19GU19FTkNSWVBUSU9OPXkKQ09ORklHX0ZTX0VOQ1JZUFRJT05fQUxHUz15CkNPTkZJ
R19GU19FTkNSWVBUSU9OX0lOTElORV9DUllQVD15CkNPTkZJR19GU19WRVJJVFk9eQojIENP
TkZJR19GU19WRVJJVFlfQlVJTFRJTl9TSUdOQVRVUkVTIGlzIG5vdCBzZXQKQ09ORklHX0ZT
Tk9USUZZPXkKQ09ORklHX0ROT1RJRlk9eQpDT05GSUdfSU5PVElGWV9VU0VSPXkKQ09ORklH
X0ZBTk9USUZZPXkKQ09ORklHX0ZBTk9USUZZX0FDQ0VTU19QRVJNSVNTSU9OUz15CiMgQ09O
RklHX1FVT1RBIGlzIG5vdCBzZXQKQ09ORklHX0FVVE9GU19GUz15CkNPTkZJR19GVVNFX0ZT
PW0KQ09ORklHX0NVU0U9bQpDT05GSUdfVklSVElPX0ZTPW0KQ09ORklHX09WRVJMQVlfRlM9
bQojIENPTkZJR19PVkVSTEFZX0ZTX1JFRElSRUNUX0RJUiBpcyBub3Qgc2V0CkNPTkZJR19P
VkVSTEFZX0ZTX1JFRElSRUNUX0FMV0FZU19GT0xMT1c9eQojIENPTkZJR19PVkVSTEFZX0ZT
X0lOREVYIGlzIG5vdCBzZXQKIyBDT05GSUdfT1ZFUkxBWV9GU19YSU5PX0FVVE8gaXMgbm90
IHNldAojIENPTkZJR19PVkVSTEFZX0ZTX01FVEFDT1BZIGlzIG5vdCBzZXQKCiMKIyBDYWNo
ZXMKIwojIENPTkZJR19GU0NBQ0hFIGlzIG5vdCBzZXQKIyBlbmQgb2YgQ2FjaGVzCgojCiMg
Q0QtUk9NL0RWRCBGaWxlc3lzdGVtcwojCkNPTkZJR19JU085NjYwX0ZTPW0KQ09ORklHX0pP
TElFVD15CkNPTkZJR19aSVNPRlM9eQpDT05GSUdfVURGX0ZTPW0KIyBlbmQgb2YgQ0QtUk9N
L0RWRCBGaWxlc3lzdGVtcwoKIwojIERPUy9GQVQvRVhGQVQvTlQgRmlsZXN5c3RlbXMKIwpD
T05GSUdfRkFUX0ZTPXkKIyBDT05GSUdfTVNET1NfRlMgaXMgbm90IHNldApDT05GSUdfVkZB
VF9GUz15CkNPTkZJR19GQVRfREVGQVVMVF9DT0RFUEFHRT00MzcKQ09ORklHX0ZBVF9ERUZB
VUxUX0lPQ0hBUlNFVD0iYXNjaWkiCiMgQ09ORklHX0ZBVF9ERUZBVUxUX1VURjggaXMgbm90
IHNldAojIENPTkZJR19FWEZBVF9GUyBpcyBub3Qgc2V0CiMgQ09ORklHX05URlNfRlMgaXMg
bm90IHNldAojIENPTkZJR19OVEZTM19GUyBpcyBub3Qgc2V0CiMgZW5kIG9mIERPUy9GQVQv
RVhGQVQvTlQgRmlsZXN5c3RlbXMKCiMKIyBQc2V1ZG8gZmlsZXN5c3RlbXMKIwpDT05GSUdf
UFJPQ19GUz15CkNPTkZJR19QUk9DX0tDT1JFPXkKQ09ORklHX1BST0NfU1lTQ1RMPXkKQ09O
RklHX1BST0NfUEFHRV9NT05JVE9SPXkKQ09ORklHX1BST0NfQ0hJTERSRU49eQpDT05GSUdf
UFJPQ19QSURfQVJDSF9TVEFUVVM9eQpDT05GSUdfUFJPQ19DUFVfUkVTQ1RSTD15CkNPTkZJ
R19LRVJORlM9eQpDT05GSUdfU1lTRlM9eQpDT05GSUdfVE1QRlM9eQpDT05GSUdfVE1QRlNf
UE9TSVhfQUNMPXkKQ09ORklHX1RNUEZTX1hBVFRSPXkKQ09ORklHX1RNUEZTX0lOT0RFNjQ9
eQpDT05GSUdfSFVHRVRMQkZTPXkKQ09ORklHX0hVR0VUTEJfUEFHRT15CkNPTkZJR19IVUdF
VExCX1BBR0VfT1BUSU1JWkVfVk1FTU1BUD15CiMgQ09ORklHX0hVR0VUTEJfUEFHRV9PUFRJ
TUlaRV9WTUVNTUFQX0RFRkFVTFRfT04gaXMgbm90IHNldApDT05GSUdfTUVNRkRfQ1JFQVRF
PXkKQ09ORklHX0FSQ0hfSEFTX0dJR0FOVElDX1BBR0U9eQojIENPTkZJR19DT05GSUdGU19G
UyBpcyBub3Qgc2V0CkNPTkZJR19FRklWQVJfRlM9eQojIGVuZCBvZiBQc2V1ZG8gZmlsZXN5
c3RlbXMKCkNPTkZJR19NSVNDX0ZJTEVTWVNURU1TPXkKIyBDT05GSUdfT1JBTkdFRlNfRlMg
aXMgbm90IHNldAojIENPTkZJR19BREZTX0ZTIGlzIG5vdCBzZXQKIyBDT05GSUdfQUZGU19G
UyBpcyBub3Qgc2V0CiMgQ09ORklHX0VDUllQVF9GUyBpcyBub3Qgc2V0CiMgQ09ORklHX0hG
U19GUyBpcyBub3Qgc2V0CiMgQ09ORklHX0hGU1BMVVNfRlMgaXMgbm90IHNldAojIENPTkZJ
R19CRUZTX0ZTIGlzIG5vdCBzZXQKIyBDT05GSUdfQkZTX0ZTIGlzIG5vdCBzZXQKIyBDT05G
SUdfRUZTX0ZTIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JBTUZTIGlzIG5vdCBzZXQKIyBDT05G
SUdfU1FVQVNIRlMgaXMgbm90IHNldAojIENPTkZJR19WWEZTX0ZTIGlzIG5vdCBzZXQKIyBD
T05GSUdfTUlOSVhfRlMgaXMgbm90IHNldAojIENPTkZJR19PTUZTX0ZTIGlzIG5vdCBzZXQK
IyBDT05GSUdfSFBGU19GUyBpcyBub3Qgc2V0CiMgQ09ORklHX1FOWDRGU19GUyBpcyBub3Qg
c2V0CiMgQ09ORklHX1FOWDZGU19GUyBpcyBub3Qgc2V0CiMgQ09ORklHX1JPTUZTX0ZTIGlz
IG5vdCBzZXQKQ09ORklHX1BTVE9SRT15CkNPTkZJR19QU1RPUkVfREVGQVVMVF9LTVNHX0JZ
VEVTPTEwMjQwCkNPTkZJR19QU1RPUkVfREVGTEFURV9DT01QUkVTUz15CiMgQ09ORklHX1BT
VE9SRV9MWk9fQ09NUFJFU1MgaXMgbm90IHNldAojIENPTkZJR19QU1RPUkVfTFo0X0NPTVBS
RVNTIGlzIG5vdCBzZXQKIyBDT05GSUdfUFNUT1JFX0xaNEhDX0NPTVBSRVNTIGlzIG5vdCBz
ZXQKQ09ORklHX1BTVE9SRV84NDJfQ09NUFJFU1M9eQojIENPTkZJR19QU1RPUkVfWlNURF9D
T01QUkVTUyBpcyBub3Qgc2V0CkNPTkZJR19QU1RPUkVfQ09NUFJFU1M9eQpDT05GSUdfUFNU
T1JFX0RFRkxBVEVfQ09NUFJFU1NfREVGQVVMVD15CiMgQ09ORklHX1BTVE9SRV84NDJfQ09N
UFJFU1NfREVGQVVMVCBpcyBub3Qgc2V0CkNPTkZJR19QU1RPUkVfQ09NUFJFU1NfREVGQVVM
VD0iZGVmbGF0ZSIKIyBDT05GSUdfUFNUT1JFX0NPTlNPTEUgaXMgbm90IHNldAojIENPTkZJ
R19QU1RPUkVfUE1TRyBpcyBub3Qgc2V0CiMgQ09ORklHX1BTVE9SRV9SQU0gaXMgbm90IHNl
dAojIENPTkZJR19QU1RPUkVfQkxLIGlzIG5vdCBzZXQKIyBDT05GSUdfU1lTVl9GUyBpcyBu
b3Qgc2V0CiMgQ09ORklHX1VGU19GUyBpcyBub3Qgc2V0CiMgQ09ORklHX0VST0ZTX0ZTIGlz
IG5vdCBzZXQKIyBDT05GSUdfTkVUV09SS19GSUxFU1lTVEVNUyBpcyBub3Qgc2V0CkNPTkZJ
R19OTFM9eQpDT05GSUdfTkxTX0RFRkFVTFQ9InV0ZjgiCkNPTkZJR19OTFNfQ09ERVBBR0Vf
NDM3PW0KIyBDT05GSUdfTkxTX0NPREVQQUdFXzczNyBpcyBub3Qgc2V0CiMgQ09ORklHX05M
U19DT0RFUEFHRV83NzUgaXMgbm90IHNldAojIENPTkZJR19OTFNfQ09ERVBBR0VfODUwIGlz
IG5vdCBzZXQKIyBDT05GSUdfTkxTX0NPREVQQUdFXzg1MiBpcyBub3Qgc2V0CiMgQ09ORklH
X05MU19DT0RFUEFHRV84NTUgaXMgbm90IHNldAojIENPTkZJR19OTFNfQ09ERVBBR0VfODU3
IGlzIG5vdCBzZXQKIyBDT05GSUdfTkxTX0NPREVQQUdFXzg2MCBpcyBub3Qgc2V0CiMgQ09O
RklHX05MU19DT0RFUEFHRV84NjEgaXMgbm90IHNldAojIENPTkZJR19OTFNfQ09ERVBBR0Vf
ODYyIGlzIG5vdCBzZXQKIyBDT05GSUdfTkxTX0NPREVQQUdFXzg2MyBpcyBub3Qgc2V0CiMg
Q09ORklHX05MU19DT0RFUEFHRV84NjQgaXMgbm90IHNldAojIENPTkZJR19OTFNfQ09ERVBB
R0VfODY1IGlzIG5vdCBzZXQKIyBDT05GSUdfTkxTX0NPREVQQUdFXzg2NiBpcyBub3Qgc2V0
CiMgQ09ORklHX05MU19DT0RFUEFHRV84NjkgaXMgbm90IHNldAojIENPTkZJR19OTFNfQ09E
RVBBR0VfOTM2IGlzIG5vdCBzZXQKIyBDT05GSUdfTkxTX0NPREVQQUdFXzk1MCBpcyBub3Qg
c2V0CiMgQ09ORklHX05MU19DT0RFUEFHRV85MzIgaXMgbm90IHNldAojIENPTkZJR19OTFNf
Q09ERVBBR0VfOTQ5IGlzIG5vdCBzZXQKIyBDT05GSUdfTkxTX0NPREVQQUdFXzg3NCBpcyBu
b3Qgc2V0CiMgQ09ORklHX05MU19JU084ODU5XzggaXMgbm90IHNldAojIENPTkZJR19OTFNf
Q09ERVBBR0VfMTI1MCBpcyBub3Qgc2V0CiMgQ09ORklHX05MU19DT0RFUEFHRV8xMjUxIGlz
IG5vdCBzZXQKQ09ORklHX05MU19BU0NJST15CiMgQ09ORklHX05MU19JU084ODU5XzEgaXMg
bm90IHNldAojIENPTkZJR19OTFNfSVNPODg1OV8yIGlzIG5vdCBzZXQKIyBDT05GSUdfTkxT
X0lTTzg4NTlfMyBpcyBub3Qgc2V0CiMgQ09ORklHX05MU19JU084ODU5XzQgaXMgbm90IHNl
dAojIENPTkZJR19OTFNfSVNPODg1OV81IGlzIG5vdCBzZXQKIyBDT05GSUdfTkxTX0lTTzg4
NTlfNiBpcyBub3Qgc2V0CiMgQ09ORklHX05MU19JU084ODU5XzcgaXMgbm90IHNldAojIENP
TkZJR19OTFNfSVNPODg1OV85IGlzIG5vdCBzZXQKIyBDT05GSUdfTkxTX0lTTzg4NTlfMTMg
aXMgbm90IHNldAojIENPTkZJR19OTFNfSVNPODg1OV8xNCBpcyBub3Qgc2V0CiMgQ09ORklH
X05MU19JU084ODU5XzE1IGlzIG5vdCBzZXQKIyBDT05GSUdfTkxTX0tPSThfUiBpcyBub3Qg
c2V0CiMgQ09ORklHX05MU19LT0k4X1UgaXMgbm90IHNldAojIENPTkZJR19OTFNfTUFDX1JP
TUFOIGlzIG5vdCBzZXQKIyBDT05GSUdfTkxTX01BQ19DRUxUSUMgaXMgbm90IHNldAojIENP
TkZJR19OTFNfTUFDX0NFTlRFVVJPIGlzIG5vdCBzZXQKIyBDT05GSUdfTkxTX01BQ19DUk9B
VElBTiBpcyBub3Qgc2V0CiMgQ09ORklHX05MU19NQUNfQ1lSSUxMSUMgaXMgbm90IHNldAoj
IENPTkZJR19OTFNfTUFDX0dBRUxJQyBpcyBub3Qgc2V0CiMgQ09ORklHX05MU19NQUNfR1JF
RUsgaXMgbm90IHNldAojIENPTkZJR19OTFNfTUFDX0lDRUxBTkQgaXMgbm90IHNldAojIENP
TkZJR19OTFNfTUFDX0lOVUlUIGlzIG5vdCBzZXQKIyBDT05GSUdfTkxTX01BQ19ST01BTklB
TiBpcyBub3Qgc2V0CiMgQ09ORklHX05MU19NQUNfVFVSS0lTSCBpcyBub3Qgc2V0CiMgQ09O
RklHX05MU19VVEY4IGlzIG5vdCBzZXQKQ09ORklHX1VOSUNPREU9eQojIENPTkZJR19VTklD
T0RFX05PUk1BTElaQVRJT05fU0VMRlRFU1QgaXMgbm90IHNldApDT05GSUdfSU9fV1E9eQoj
IGVuZCBvZiBGaWxlIHN5c3RlbXMKCiMKIyBTZWN1cml0eSBvcHRpb25zCiMKQ09ORklHX0tF
WVM9eQpDT05GSUdfS0VZU19SRVFVRVNUX0NBQ0hFPXkKQ09ORklHX1BFUlNJU1RFTlRfS0VZ
UklOR1M9eQpDT05GSUdfQklHX0tFWVM9eQpDT05GSUdfVFJVU1RFRF9LRVlTPW0KQ09ORklH
X1RSVVNURURfS0VZU19UUE09eQpDT05GSUdfRU5DUllQVEVEX0tFWVM9eQojIENPTkZJR19V
U0VSX0RFQ1JZUFRFRF9EQVRBIGlzIG5vdCBzZXQKQ09ORklHX0tFWV9ESF9PUEVSQVRJT05T
PXkKQ09ORklHX0tFWV9OT1RJRklDQVRJT05TPXkKQ09ORklHX1NFQ1VSSVRZX0RNRVNHX1JF
U1RSSUNUPXkKQ09ORklHX1NFQ1VSSVRZPXkKQ09ORklHX1NFQ1VSSVRZRlM9eQpDT05GSUdf
U0VDVVJJVFlfTkVUV09SSz15CkNPTkZJR19TRUNVUklUWV9ORVRXT1JLX1hGUk09eQpDT05G
SUdfU0VDVVJJVFlfUEFUSD15CiMgQ09ORklHX0lOVEVMX1RYVCBpcyBub3Qgc2V0CkNPTkZJ
R19IQVJERU5FRF9VU0VSQ09QWT15CkNPTkZJR19GT1JUSUZZX1NPVVJDRT15CiMgQ09ORklH
X1NUQVRJQ19VU0VSTU9ERUhFTFBFUiBpcyBub3Qgc2V0CiMgQ09ORklHX1NFQ1VSSVRZX1NF
TElOVVggaXMgbm90IHNldAojIENPTkZJR19TRUNVUklUWV9TTUFDSyBpcyBub3Qgc2V0CiMg
Q09ORklHX1NFQ1VSSVRZX1RPTU9ZTyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFQ1VSSVRZX0FQ
UEFSTU9SIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VDVVJJVFlfTE9BRFBJTiBpcyBub3Qgc2V0
CkNPTkZJR19TRUNVUklUWV9ZQU1BPXkKIyBDT05GSUdfU0VDVVJJVFlfU0FGRVNFVElEIGlz
IG5vdCBzZXQKIyBDT05GSUdfU0VDVVJJVFlfTE9DS0RPV05fTFNNIGlzIG5vdCBzZXQKQ09O
RklHX1NFQ1VSSVRZX0xBTkRMT0NLPXkKQ09ORklHX0lOVEVHUklUWT15CiMgQ09ORklHX0lO
VEVHUklUWV9TSUdOQVRVUkUgaXMgbm90IHNldApDT05GSUdfSU5URUdSSVRZX0FVRElUPXkK
Q09ORklHX0lNQT15CkNPTkZJR19JTUFfTUVBU1VSRV9QQ1JfSURYPTEwCkNPTkZJR19JTUFf
TkdfVEVNUExBVEU9eQojIENPTkZJR19JTUFfU0lHX1RFTVBMQVRFIGlzIG5vdCBzZXQKQ09O
RklHX0lNQV9ERUZBVUxUX1RFTVBMQVRFPSJpbWEtbmciCiMgQ09ORklHX0lNQV9ERUZBVUxU
X0hBU0hfU0hBMSBpcyBub3Qgc2V0CkNPTkZJR19JTUFfREVGQVVMVF9IQVNIX1NIQTI1Nj15
CiMgQ09ORklHX0lNQV9ERUZBVUxUX0hBU0hfU0hBNTEyIGlzIG5vdCBzZXQKQ09ORklHX0lN
QV9ERUZBVUxUX0hBU0g9InNoYTI1NiIKQ09ORklHX0lNQV9XUklURV9QT0xJQ1k9eQpDT05G
SUdfSU1BX1JFQURfUE9MSUNZPXkKQ09ORklHX0lNQV9BUFBSQUlTRT15CkNPTkZJR19JTUFf
QVBQUkFJU0VfQk9PVFBBUkFNPXkKQ09ORklHX0lNQV9NRUFTVVJFX0FTWU1NRVRSSUNfS0VZ
Uz15CkNPTkZJR19JTUFfUVVFVUVfRUFSTFlfQk9PVF9LRVlTPXkKIyBDT05GSUdfSU1BX1NF
Q1VSRV9BTkRfT1JfVFJVU1RFRF9CT09UIGlzIG5vdCBzZXQKIyBDT05GSUdfSU1BX0RJU0FC
TEVfSFRBQkxFIGlzIG5vdCBzZXQKQ09ORklHX0VWTT15CkNPTkZJR19FVk1fQVRUUl9GU1VV
SUQ9eQojIENPTkZJR19FVk1fQUREX1hBVFRSUyBpcyBub3Qgc2V0CkNPTkZJR19ERUZBVUxU
X1NFQ1VSSVRZX0RBQz15CkNPTkZJR19MU009InlhbWEiCgojCiMgS2VybmVsIGhhcmRlbmlu
ZyBvcHRpb25zCiMKCiMKIyBNZW1vcnkgaW5pdGlhbGl6YXRpb24KIwpDT05GSUdfQ0NfSEFT
X0FVVE9fVkFSX0lOSVRfUEFUVEVSTj15CkNPTkZJR19DQ19IQVNfQVVUT19WQVJfSU5JVF9a
RVJPX0JBUkU9eQpDT05GSUdfQ0NfSEFTX0FVVE9fVkFSX0lOSVRfWkVSTz15CkNPTkZJR19J
TklUX1NUQUNLX05PTkU9eQojIENPTkZJR19JTklUX1NUQUNLX0FMTF9QQVRURVJOIGlzIG5v
dCBzZXQKIyBDT05GSUdfSU5JVF9TVEFDS19BTExfWkVSTyBpcyBub3Qgc2V0CkNPTkZJR19H
Q0NfUExVR0lOX1NUQUNLTEVBSz15CiMgQ09ORklHX0dDQ19QTFVHSU5fU1RBQ0tMRUFLX1ZF
UkJPU0UgaXMgbm90IHNldApDT05GSUdfU1RBQ0tMRUFLX1RSQUNLX01JTl9TSVpFPTEwMAoj
IENPTkZJR19TVEFDS0xFQUtfTUVUUklDUyBpcyBub3Qgc2V0CiMgQ09ORklHX1NUQUNLTEVB
S19SVU5USU1FX0RJU0FCTEUgaXMgbm90IHNldApDT05GSUdfSU5JVF9PTl9BTExPQ19ERUZB
VUxUX09OPXkKQ09ORklHX0lOSVRfT05fRlJFRV9ERUZBVUxUX09OPXkKQ09ORklHX0NDX0hB
U19aRVJPX0NBTExfVVNFRF9SRUdTPXkKQ09ORklHX1pFUk9fQ0FMTF9VU0VEX1JFR1M9eQoj
IGVuZCBvZiBNZW1vcnkgaW5pdGlhbGl6YXRpb24KCiMgQ09ORklHX1JBTkRTVFJVQ1RfTk9O
RSBpcyBub3Qgc2V0CiMgQ09ORklHX1JBTkRTVFJVQ1RfRlVMTCBpcyBub3Qgc2V0CkNPTkZJ
R19SQU5EU1RSVUNUX1BFUkZPUk1BTkNFPXkKQ09ORklHX1JBTkRTVFJVQ1Q9eQpDT05GSUdf
R0NDX1BMVUdJTl9SQU5EU1RSVUNUPXkKIyBlbmQgb2YgS2VybmVsIGhhcmRlbmluZyBvcHRp
b25zCiMgZW5kIG9mIFNlY3VyaXR5IG9wdGlvbnMKCkNPTkZJR19DUllQVE89eQoKIwojIENy
eXB0byBjb3JlIG9yIGhlbHBlcgojCkNPTkZJR19DUllQVE9fQUxHQVBJPXkKQ09ORklHX0NS
WVBUT19BTEdBUEkyPXkKQ09ORklHX0NSWVBUT19BRUFEPXkKQ09ORklHX0NSWVBUT19BRUFE
Mj15CkNPTkZJR19DUllQVE9fU0lHMj15CkNPTkZJR19DUllQVE9fU0tDSVBIRVI9eQpDT05G
SUdfQ1JZUFRPX1NLQ0lQSEVSMj15CkNPTkZJR19DUllQVE9fSEFTSD15CkNPTkZJR19DUllQ
VE9fSEFTSDI9eQpDT05GSUdfQ1JZUFRPX1JORz15CkNPTkZJR19DUllQVE9fUk5HMj15CkNP
TkZJR19DUllQVE9fUk5HX0RFRkFVTFQ9eQpDT05GSUdfQ1JZUFRPX0FLQ0lQSEVSMj15CkNP
TkZJR19DUllQVE9fQUtDSVBIRVI9eQpDT05GSUdfQ1JZUFRPX0tQUDI9eQpDT05GSUdfQ1JZ
UFRPX0tQUD15CkNPTkZJR19DUllQVE9fQUNPTVAyPXkKQ09ORklHX0NSWVBUT19NQU5BR0VS
PXkKQ09ORklHX0NSWVBUT19NQU5BR0VSMj15CkNPTkZJR19DUllQVE9fVVNFUj1tCkNPTkZJ
R19DUllQVE9fTUFOQUdFUl9ESVNBQkxFX1RFU1RTPXkKQ09ORklHX0NSWVBUT19OVUxMPXkK
Q09ORklHX0NSWVBUT19OVUxMMj15CiMgQ09ORklHX0NSWVBUT19QQ1JZUFQgaXMgbm90IHNl
dApDT05GSUdfQ1JZUFRPX0NSWVBURD15CkNPTkZJR19DUllQVE9fQVVUSEVOQz15CiMgQ09O
RklHX0NSWVBUT19URVNUIGlzIG5vdCBzZXQKQ09ORklHX0NSWVBUT19TSU1EPXkKIyBlbmQg
b2YgQ3J5cHRvIGNvcmUgb3IgaGVscGVyCgojCiMgUHVibGljLWtleSBjcnlwdG9ncmFwaHkK
IwpDT05GSUdfQ1JZUFRPX1JTQT15CkNPTkZJR19DUllQVE9fREg9eQojIENPTkZJR19DUllQ
VE9fREhfUkZDNzkxOV9HUk9VUFMgaXMgbm90IHNldApDT05GSUdfQ1JZUFRPX0VDQz15CkNP
TkZJR19DUllQVE9fRUNESD1tCkNPTkZJR19DUllQVE9fRUNEU0E9eQojIENPTkZJR19DUllQ
VE9fRUNSRFNBIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX1NNMiBpcyBub3Qgc2V0CiMg
Q09ORklHX0NSWVBUT19DVVJWRTI1NTE5IGlzIG5vdCBzZXQKIyBlbmQgb2YgUHVibGljLWtl
eSBjcnlwdG9ncmFwaHkKCiMKIyBCbG9jayBjaXBoZXJzCiMKQ09ORklHX0NSWVBUT19BRVM9
eQojIENPTkZJR19DUllQVE9fQUVTX1RJIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX0FS
SUEgaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fQkxPV0ZJU0ggaXMgbm90IHNldAojIENP
TkZJR19DUllQVE9fQ0FNRUxMSUEgaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fQ0FTVDUg
aXMgbm90IHNldAojIENPTkZJR19DUllQVE9fQ0FTVDYgaXMgbm90IHNldAojIENPTkZJR19D
UllQVE9fREVTIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX0ZDUllQVCBpcyBub3Qgc2V0
CiMgQ09ORklHX0NSWVBUT19TRVJQRU5UIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX1NN
NF9HRU5FUklDIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX1RXT0ZJU0ggaXMgbm90IHNl
dAojIGVuZCBvZiBCbG9jayBjaXBoZXJzCgojCiMgTGVuZ3RoLXByZXNlcnZpbmcgY2lwaGVy
cyBhbmQgbW9kZXMKIwojIENPTkZJR19DUllQVE9fQURJQU5UVU0gaXMgbm90IHNldAojIENP
TkZJR19DUllQVE9fQ0hBQ0hBMjAgaXMgbm90IHNldApDT05GSUdfQ1JZUFRPX0NCQz15CkNP
TkZJR19DUllQVE9fQ0ZCPXkKQ09ORklHX0NSWVBUT19DVFI9eQpDT05GSUdfQ1JZUFRPX0NU
Uz15CkNPTkZJR19DUllQVE9fRUNCPXkKIyBDT05GSUdfQ1JZUFRPX0hDVFIyIGlzIG5vdCBz
ZXQKIyBDT05GSUdfQ1JZUFRPX0tFWVdSQVAgaXMgbm90IHNldApDT05GSUdfQ1JZUFRPX0xS
Vz15CkNPTkZJR19DUllQVE9fT0ZCPXkKIyBDT05GSUdfQ1JZUFRPX1BDQkMgaXMgbm90IHNl
dApDT05GSUdfQ1JZUFRPX1hUUz15CiMgZW5kIG9mIExlbmd0aC1wcmVzZXJ2aW5nIGNpcGhl
cnMgYW5kIG1vZGVzCgojCiMgQUVBRCAoYXV0aGVudGljYXRlZCBlbmNyeXB0aW9uIHdpdGgg
YXNzb2NpYXRlZCBkYXRhKSBjaXBoZXJzCiMKIyBDT05GSUdfQ1JZUFRPX0FFR0lTMTI4IGlz
IG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX0NIQUNIQTIwUE9MWTEzMDUgaXMgbm90IHNldApD
T05GSUdfQ1JZUFRPX0NDTT15CkNPTkZJR19DUllQVE9fR0NNPXkKQ09ORklHX0NSWVBUT19H
RU5JVj15CkNPTkZJR19DUllQVE9fU0VRSVY9eQpDT05GSUdfQ1JZUFRPX0VDSEFJTklWPW0K
Q09ORklHX0NSWVBUT19FU1NJVj1tCiMgZW5kIG9mIEFFQUQgKGF1dGhlbnRpY2F0ZWQgZW5j
cnlwdGlvbiB3aXRoIGFzc29jaWF0ZWQgZGF0YSkgY2lwaGVycwoKIwojIEhhc2hlcywgZGln
ZXN0cywgYW5kIE1BQ3MKIwpDT05GSUdfQ1JZUFRPX0JMQUtFMkI9eQpDT05GSUdfQ1JZUFRP
X0NNQUM9eQpDT05GSUdfQ1JZUFRPX0dIQVNIPXkKQ09ORklHX0NSWVBUT19ITUFDPXkKIyBD
T05GSUdfQ1JZUFRPX01ENCBpcyBub3Qgc2V0CkNPTkZJR19DUllQVE9fTUQ1PXkKQ09ORklH
X0NSWVBUT19NSUNIQUVMX01JQz1tCiMgQ09ORklHX0NSWVBUT19QT0xZMTMwNSBpcyBub3Qg
c2V0CiMgQ09ORklHX0NSWVBUT19STUQxNjAgaXMgbm90IHNldApDT05GSUdfQ1JZUFRPX1NI
QTE9eQpDT05GSUdfQ1JZUFRPX1NIQTI1Nj15CkNPTkZJR19DUllQVE9fU0hBNTEyPXkKQ09O
RklHX0NSWVBUT19TSEEzPXkKIyBDT05GSUdfQ1JZUFRPX1NNM19HRU5FUklDIGlzIG5vdCBz
ZXQKIyBDT05GSUdfQ1JZUFRPX1NUUkVFQk9HIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRP
X1ZNQUMgaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fV1A1MTIgaXMgbm90IHNldAojIENP
TkZJR19DUllQVE9fWENCQyBpcyBub3Qgc2V0CkNPTkZJR19DUllQVE9fWFhIQVNIPXkKIyBl
bmQgb2YgSGFzaGVzLCBkaWdlc3RzLCBhbmQgTUFDcwoKIwojIENSQ3MgKGN5Y2xpYyByZWR1
bmRhbmN5IGNoZWNrcykKIwpDT05GSUdfQ1JZUFRPX0NSQzMyQz15CiMgQ09ORklHX0NSWVBU
T19DUkMzMiBpcyBub3Qgc2V0CkNPTkZJR19DUllQVE9fQ1JDVDEwRElGPXkKQ09ORklHX0NS
WVBUT19DUkM2NF9ST0NLU09GVD15CiMgZW5kIG9mIENSQ3MgKGN5Y2xpYyByZWR1bmRhbmN5
IGNoZWNrcykKCiMKIyBDb21wcmVzc2lvbgojCkNPTkZJR19DUllQVE9fREVGTEFURT15CkNP
TkZJR19DUllQVE9fTFpPPXkKQ09ORklHX0NSWVBUT184NDI9eQojIENPTkZJR19DUllQVE9f
TFo0IGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX0xaNEhDIGlzIG5vdCBzZXQKIyBDT05G
SUdfQ1JZUFRPX1pTVEQgaXMgbm90IHNldAojIGVuZCBvZiBDb21wcmVzc2lvbgoKIwojIFJh
bmRvbSBudW1iZXIgZ2VuZXJhdGlvbgojCiMgQ09ORklHX0NSWVBUT19BTlNJX0NQUk5HIGlz
IG5vdCBzZXQKQ09ORklHX0NSWVBUT19EUkJHX01FTlU9eQpDT05GSUdfQ1JZUFRPX0RSQkdf
SE1BQz15CkNPTkZJR19DUllQVE9fRFJCR19IQVNIPXkKQ09ORklHX0NSWVBUT19EUkJHX0NU
Uj15CkNPTkZJR19DUllQVE9fRFJCRz15CkNPTkZJR19DUllQVE9fSklUVEVSRU5UUk9QWT15
CiMgQ09ORklHX0NSWVBUT19KSVRURVJFTlRST1BZX1RFU1RJTlRFUkZBQ0UgaXMgbm90IHNl
dApDT05GSUdfQ1JZUFRPX0tERjgwMDEwOF9DVFI9eQojIGVuZCBvZiBSYW5kb20gbnVtYmVy
IGdlbmVyYXRpb24KCiMKIyBVc2Vyc3BhY2UgaW50ZXJmYWNlCiMKQ09ORklHX0NSWVBUT19V
U0VSX0FQST15CkNPTkZJR19DUllQVE9fVVNFUl9BUElfSEFTSD15CkNPTkZJR19DUllQVE9f
VVNFUl9BUElfU0tDSVBIRVI9eQpDT05GSUdfQ1JZUFRPX1VTRVJfQVBJX1JORz15CiMgQ09O
RklHX0NSWVBUT19VU0VSX0FQSV9STkdfQ0FWUCBpcyBub3Qgc2V0CkNPTkZJR19DUllQVE9f
VVNFUl9BUElfQUVBRD15CiMgQ09ORklHX0NSWVBUT19VU0VSX0FQSV9FTkFCTEVfT0JTT0xF
VEUgaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fU1RBVFMgaXMgbm90IHNldAojIGVuZCBv
ZiBVc2Vyc3BhY2UgaW50ZXJmYWNlCgpDT05GSUdfQ1JZUFRPX0hBU0hfSU5GTz15CgojCiMg
QWNjZWxlcmF0ZWQgQ3J5cHRvZ3JhcGhpYyBBbGdvcml0aG1zIGZvciBDUFUgKHg4NikKIwoj
IENPTkZJR19DUllQVE9fQ1VSVkUyNTUxOV9YODYgaXMgbm90IHNldApDT05GSUdfQ1JZUFRP
X0FFU19OSV9JTlRFTD15CiMgQ09ORklHX0NSWVBUT19CTE9XRklTSF9YODZfNjQgaXMgbm90
IHNldAojIENPTkZJR19DUllQVE9fQ0FNRUxMSUFfWDg2XzY0IGlzIG5vdCBzZXQKIyBDT05G
SUdfQ1JZUFRPX0NBTUVMTElBX0FFU05JX0FWWF9YODZfNjQgaXMgbm90IHNldAojIENPTkZJ
R19DUllQVE9fQ0FNRUxMSUFfQUVTTklfQVZYMl9YODZfNjQgaXMgbm90IHNldAojIENPTkZJ
R19DUllQVE9fQ0FTVDVfQVZYX1g4Nl82NCBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19D
QVNUNl9BVlhfWDg2XzY0IGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX0RFUzNfRURFX1g4
Nl82NCBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19TRVJQRU5UX1NTRTJfWDg2XzY0IGlz
IG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX1NFUlBFTlRfQVZYX1g4Nl82NCBpcyBub3Qgc2V0
CiMgQ09ORklHX0NSWVBUT19TRVJQRU5UX0FWWDJfWDg2XzY0IGlzIG5vdCBzZXQKIyBDT05G
SUdfQ1JZUFRPX1NNNF9BRVNOSV9BVlhfWDg2XzY0IGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZ
UFRPX1NNNF9BRVNOSV9BVlgyX1g4Nl82NCBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19U
V09GSVNIX1g4Nl82NCBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19UV09GSVNIX1g4Nl82
NF8zV0FZIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX1RXT0ZJU0hfQVZYX1g4Nl82NCBp
cyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19BUklBX0FFU05JX0FWWF9YODZfNjQgaXMgbm90
IHNldAojIENPTkZJR19DUllQVE9fQVJJQV9BRVNOSV9BVlgyX1g4Nl82NCBpcyBub3Qgc2V0
CiMgQ09ORklHX0NSWVBUT19BUklBX0dGTklfQVZYNTEyX1g4Nl82NCBpcyBub3Qgc2V0CkNP
TkZJR19DUllQVE9fQ0hBQ0hBMjBfWDg2XzY0PXkKIyBDT05GSUdfQ1JZUFRPX0FFR0lTMTI4
X0FFU05JX1NTRTIgaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fTkhQT0xZMTMwNV9TU0Uy
IGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX05IUE9MWTEzMDVfQVZYMiBpcyBub3Qgc2V0
CkNPTkZJR19DUllQVE9fQkxBS0UyU19YODY9eQojIENPTkZJR19DUllQVE9fUE9MWVZBTF9D
TE1VTF9OSSBpcyBub3Qgc2V0CkNPTkZJR19DUllQVE9fUE9MWTEzMDVfWDg2XzY0PXkKIyBD
T05GSUdfQ1JZUFRPX1NIQTFfU1NTRTMgaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fU0hB
MjU2X1NTU0UzIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX1NIQTUxMl9TU1NFMyBpcyBu
b3Qgc2V0CiMgQ09ORklHX0NSWVBUT19TTTNfQVZYX1g4Nl82NCBpcyBub3Qgc2V0CkNPTkZJ
R19DUllQVE9fR0hBU0hfQ0xNVUxfTklfSU5URUw9bQpDT05GSUdfQ1JZUFRPX0NSQzMyQ19J
TlRFTD1tCkNPTkZJR19DUllQVE9fQ1JDMzJfUENMTVVMPW0KQ09ORklHX0NSWVBUT19DUkNU
MTBESUZfUENMTVVMPW0KIyBlbmQgb2YgQWNjZWxlcmF0ZWQgQ3J5cHRvZ3JhcGhpYyBBbGdv
cml0aG1zIGZvciBDUFUgKHg4NikKCkNPTkZJR19DUllQVE9fSFc9eQojIENPTkZJR19DUllQ
VE9fREVWX1BBRExPQ0sgaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fREVWX0FUTUVMX0VD
QyBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19ERVZfQVRNRUxfU0hBMjA0QSBpcyBub3Qg
c2V0CkNPTkZJR19DUllQVE9fREVWX0NDUD15CkNPTkZJR19DUllQVE9fREVWX0NDUF9ERD1t
CkNPTkZJR19DUllQVE9fREVWX1NQX0NDUD15CkNPTkZJR19DUllQVE9fREVWX0NDUF9DUllQ
VE89bQpDT05GSUdfQ1JZUFRPX0RFVl9TUF9QU1A9eQojIENPTkZJR19DUllQVE9fREVWX0ND
UF9ERUJVR0ZTIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX0RFVl9OSVRST1hfQ05ONTVY
WCBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19ERVZfUUFUX0RIODk1eENDIGlzIG5vdCBz
ZXQKIyBDT05GSUdfQ1JZUFRPX0RFVl9RQVRfQzNYWFggaXMgbm90IHNldAojIENPTkZJR19D
UllQVE9fREVWX1FBVF9DNjJYIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX0RFVl9RQVRf
NFhYWCBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19ERVZfUUFUX0RIODk1eENDVkYgaXMg
bm90IHNldAojIENPTkZJR19DUllQVE9fREVWX1FBVF9DM1hYWFZGIGlzIG5vdCBzZXQKIyBD
T05GSUdfQ1JZUFRPX0RFVl9RQVRfQzYyWFZGIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRP
X0RFVl9WSVJUSU8gaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fREVWX1NBRkVYQ0VMIGlz
IG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX0RFVl9BTUxPR0lDX0dYTCBpcyBub3Qgc2V0CkNP
TkZJR19BU1lNTUVUUklDX0tFWV9UWVBFPXkKQ09ORklHX0FTWU1NRVRSSUNfUFVCTElDX0tF
WV9TVUJUWVBFPXkKQ09ORklHX1g1MDlfQ0VSVElGSUNBVEVfUEFSU0VSPXkKIyBDT05GSUdf
UEtDUzhfUFJJVkFURV9LRVlfUEFSU0VSIGlzIG5vdCBzZXQKQ09ORklHX1BLQ1M3X01FU1NB
R0VfUEFSU0VSPXkKIyBDT05GSUdfUEtDUzdfVEVTVF9LRVkgaXMgbm90IHNldApDT05GSUdf
U0lHTkVEX1BFX0ZJTEVfVkVSSUZJQ0FUSU9OPXkKIyBDT05GSUdfRklQU19TSUdOQVRVUkVf
U0VMRlRFU1QgaXMgbm90IHNldAoKIwojIENlcnRpZmljYXRlcyBmb3Igc2lnbmF0dXJlIGNo
ZWNraW5nCiMKQ09ORklHX1NZU1RFTV9UUlVTVEVEX0tFWVJJTkc9eQpDT05GSUdfU1lTVEVN
X1RSVVNURURfS0VZUz0iIgojIENPTkZJR19TWVNURU1fRVhUUkFfQ0VSVElGSUNBVEUgaXMg
bm90IHNldApDT05GSUdfU0VDT05EQVJZX1RSVVNURURfS0VZUklORz15CkNPTkZJR19TWVNU
RU1fQkxBQ0tMSVNUX0tFWVJJTkc9eQpDT05GSUdfU1lTVEVNX0JMQUNLTElTVF9IQVNIX0xJ
U1Q9IiIKIyBDT05GSUdfU1lTVEVNX1JFVk9DQVRJT05fTElTVCBpcyBub3Qgc2V0CiMgQ09O
RklHX1NZU1RFTV9CTEFDS0xJU1RfQVVUSF9VUERBVEUgaXMgbm90IHNldAojIGVuZCBvZiBD
ZXJ0aWZpY2F0ZXMgZm9yIHNpZ25hdHVyZSBjaGVja2luZwoKIwojIExpYnJhcnkgcm91dGlu
ZXMKIwpDT05GSUdfTElORUFSX1JBTkdFUz15CkNPTkZJR19QQUNLSU5HPXkKQ09ORklHX0JJ
VFJFVkVSU0U9eQpDT05GSUdfR0VORVJJQ19TVFJOQ1BZX0ZST01fVVNFUj15CkNPTkZJR19H
RU5FUklDX1NUUk5MRU5fVVNFUj15CkNPTkZJR19HRU5FUklDX05FVF9VVElMUz15CiMgQ09O
RklHX0NPUkRJQyBpcyBub3Qgc2V0CiMgQ09ORklHX1BSSU1FX05VTUJFUlMgaXMgbm90IHNl
dApDT05GSUdfUkFUSU9OQUw9eQpDT05GSUdfR0VORVJJQ19QQ0lfSU9NQVA9eQpDT05GSUdf
R0VORVJJQ19JT01BUD15CkNPTkZJR19BUkNIX1VTRV9DTVBYQ0hHX0xPQ0tSRUY9eQpDT05G
SUdfQVJDSF9IQVNfRkFTVF9NVUxUSVBMSUVSPXkKQ09ORklHX0FSQ0hfVVNFX1NZTV9BTk5P
VEFUSU9OUz15CgojCiMgQ3J5cHRvIGxpYnJhcnkgcm91dGluZXMKIwpDT05GSUdfQ1JZUFRP
X0xJQl9VVElMUz15CkNPTkZJR19DUllQVE9fTElCX0FFUz15CkNPTkZJR19DUllQVE9fTElC
X0FSQzQ9bQpDT05GSUdfQ1JZUFRPX0xJQl9HRjEyOE1VTD15CkNPTkZJR19DUllQVE9fQVJD
SF9IQVZFX0xJQl9CTEFLRTJTPXkKQ09ORklHX0NSWVBUT19MSUJfQkxBS0UyU19HRU5FUklD
PXkKQ09ORklHX0NSWVBUT19BUkNIX0hBVkVfTElCX0NIQUNIQT15CkNPTkZJR19DUllQVE9f
TElCX0NIQUNIQV9HRU5FUklDPXkKQ09ORklHX0NSWVBUT19MSUJfQ0hBQ0hBPXkKIyBDT05G
SUdfQ1JZUFRPX0xJQl9DVVJWRTI1NTE5IGlzIG5vdCBzZXQKQ09ORklHX0NSWVBUT19MSUJf
UE9MWTEzMDVfUlNJWkU9MTEKQ09ORklHX0NSWVBUT19BUkNIX0hBVkVfTElCX1BPTFkxMzA1
PXkKQ09ORklHX0NSWVBUT19MSUJfUE9MWTEzMDVfR0VORVJJQz15CkNPTkZJR19DUllQVE9f
TElCX1BPTFkxMzA1PXkKQ09ORklHX0NSWVBUT19MSUJfQ0hBQ0hBMjBQT0xZMTMwNT15CkNP
TkZJR19DUllQVE9fTElCX1NIQTE9eQpDT05GSUdfQ1JZUFRPX0xJQl9TSEEyNTY9eQojIGVu
ZCBvZiBDcnlwdG8gbGlicmFyeSByb3V0aW5lcwoKQ09ORklHX0NSQ19DQ0lUVD15CkNPTkZJ
R19DUkMxNj15CkNPTkZJR19DUkNfVDEwRElGPXkKQ09ORklHX0NSQzY0X1JPQ0tTT0ZUPXkK
Q09ORklHX0NSQ19JVFVfVD1tCkNPTkZJR19DUkMzMj15CiMgQ09ORklHX0NSQzMyX1NFTEZU
RVNUIGlzIG5vdCBzZXQKQ09ORklHX0NSQzMyX1NMSUNFQlk4PXkKIyBDT05GSUdfQ1JDMzJf
U0xJQ0VCWTQgaXMgbm90IHNldAojIENPTkZJR19DUkMzMl9TQVJXQVRFIGlzIG5vdCBzZXQK
IyBDT05GSUdfQ1JDMzJfQklUIGlzIG5vdCBzZXQKQ09ORklHX0NSQzY0PXkKIyBDT05GSUdf
Q1JDNCBpcyBub3Qgc2V0CiMgQ09ORklHX0NSQzcgaXMgbm90IHNldApDT05GSUdfTElCQ1JD
MzJDPXkKIyBDT05GSUdfQ1JDOCBpcyBub3Qgc2V0CkNPTkZJR19YWEhBU0g9eQojIENPTkZJ
R19SQU5ET00zMl9TRUxGVEVTVCBpcyBub3Qgc2V0CkNPTkZJR184NDJfQ09NUFJFU1M9eQpD
T05GSUdfODQyX0RFQ09NUFJFU1M9eQpDT05GSUdfWkxJQl9JTkZMQVRFPXkKQ09ORklHX1pM
SUJfREVGTEFURT15CkNPTkZJR19MWk9fQ09NUFJFU1M9eQpDT05GSUdfTFpPX0RFQ09NUFJF
U1M9eQpDT05GSUdfWlNURF9DT01NT049eQpDT05GSUdfWlNURF9ERUNPTVBSRVNTPXkKIyBD
T05GSUdfWFpfREVDIGlzIG5vdCBzZXQKQ09ORklHX0dFTkVSSUNfQUxMT0NBVE9SPXkKQ09O
RklHX0lOVEVSVkFMX1RSRUU9eQpDT05GSUdfWEFSUkFZX01VTFRJPXkKQ09ORklHX0FTU09D
SUFUSVZFX0FSUkFZPXkKQ09ORklHX0hBU19JT01FTT15CkNPTkZJR19IQVNfSU9QT1JUPXkK
Q09ORklHX0hBU19JT1BPUlRfTUFQPXkKQ09ORklHX0hBU19ETUE9eQpDT05GSUdfRE1BX09Q
Uz15CkNPTkZJR19ORUVEX1NHX0RNQV9GTEFHUz15CkNPTkZJR19ORUVEX1NHX0RNQV9MRU5H
VEg9eQpDT05GSUdfTkVFRF9ETUFfTUFQX1NUQVRFPXkKQ09ORklHX0FSQ0hfRE1BX0FERFJf
VF82NEJJVD15CkNPTkZJR19BUkNIX0hBU19GT1JDRV9ETUFfVU5FTkNSWVBURUQ9eQpDT05G
SUdfU1dJT1RMQj15CkNPTkZJR19ETUFfQ09IRVJFTlRfUE9PTD15CiMgQ09ORklHX0RNQV9D
TUEgaXMgbm90IHNldAojIENPTkZJR19ETUFfQVBJX0RFQlVHIGlzIG5vdCBzZXQKIyBDT05G
SUdfRE1BX01BUF9CRU5DSE1BUksgaXMgbm90IHNldApDT05GSUdfU0dMX0FMTE9DPXkKQ09O
RklHX0ZPUkNFX05SX0NQVVM9eQpDT05GSUdfQ1BVX1JNQVA9eQpDT05GSUdfRFFMPXkKQ09O
RklHX05MQVRUUj15CkNPTkZJR19DTFpfVEFCPXkKQ09ORklHX0lSUV9QT0xMPXkKQ09ORklH
X01QSUxJQj15CkNPTkZJR19PSURfUkVHSVNUUlk9eQpDT05GSUdfVUNTMl9TVFJJTkc9eQpD
T05GSUdfSEFWRV9HRU5FUklDX1ZEU089eQpDT05GSUdfR0VORVJJQ19HRVRUSU1FT0ZEQVk9
eQpDT05GSUdfR0VORVJJQ19WRFNPX1RJTUVfTlM9eQpDT05GSUdfRk9OVF9TVVBQT1JUPXkK
IyBDT05GSUdfRk9OVFMgaXMgbm90IHNldApDT05GSUdfRk9OVF84eDg9eQpDT05GSUdfRk9O
VF84eDE2PXkKQ09ORklHX1NHX1BPT0w9eQpDT05GSUdfQVJDSF9IQVNfUE1FTV9BUEk9eQpD
T05GSUdfTUVNUkVHSU9OPXkKQ09ORklHX0FSQ0hfSEFTX0NQVV9DQUNIRV9JTlZBTElEQVRF
X01FTVJFR0lPTj15CkNPTkZJR19BUkNIX0hBU19VQUNDRVNTX0ZMVVNIQ0FDSEU9eQpDT05G
SUdfQVJDSF9IQVNfQ09QWV9NQz15CkNPTkZJR19BUkNIX1NUQUNLV0FMSz15CkNPTkZJR19T
VEFDS0RFUE9UPXkKQ09ORklHX1NCSVRNQVA9eQojIGVuZCBvZiBMaWJyYXJ5IHJvdXRpbmVz
CgpDT05GSUdfQVNOMV9FTkNPREVSPW0KCiMKIyBLZXJuZWwgaGFja2luZwojCgojCiMgcHJp
bnRrIGFuZCBkbWVzZyBvcHRpb25zCiMKQ09ORklHX1BSSU5US19USU1FPXkKIyBDT05GSUdf
UFJJTlRLX0NBTExFUiBpcyBub3Qgc2V0CiMgQ09ORklHX1NUQUNLVFJBQ0VfQlVJTERfSUQg
aXMgbm90IHNldApDT05GSUdfQ09OU09MRV9MT0dMRVZFTF9ERUZBVUxUPTcKQ09ORklHX0NP
TlNPTEVfTE9HTEVWRUxfUVVJRVQ9MwpDT05GSUdfTUVTU0FHRV9MT0dMRVZFTF9ERUZBVUxU
PTQKIyBDT05GSUdfQk9PVF9QUklOVEtfREVMQVkgaXMgbm90IHNldApDT05GSUdfRFlOQU1J
Q19ERUJVRz15CkNPTkZJR19EWU5BTUlDX0RFQlVHX0NPUkU9eQpDT05GSUdfU1lNQk9MSUNf
RVJSTkFNRT15CkNPTkZJR19ERUJVR19CVUdWRVJCT1NFPXkKIyBlbmQgb2YgcHJpbnRrIGFu
ZCBkbWVzZyBvcHRpb25zCgpDT05GSUdfREVCVUdfS0VSTkVMPXkKIyBDT05GSUdfREVCVUdf
TUlTQyBpcyBub3Qgc2V0CgojCiMgQ29tcGlsZS10aW1lIGNoZWNrcyBhbmQgY29tcGlsZXIg
b3B0aW9ucwojCkNPTkZJR19BU19IQVNfTk9OX0NPTlNUX0xFQjEyOD15CkNPTkZJR19ERUJV
R19JTkZPX05PTkU9eQojIENPTkZJR19ERUJVR19JTkZPX0RXQVJGX1RPT0xDSEFJTl9ERUZB
VUxUIGlzIG5vdCBzZXQKIyBDT05GSUdfREVCVUdfSU5GT19EV0FSRjQgaXMgbm90IHNldAoj
IENPTkZJR19ERUJVR19JTkZPX0RXQVJGNSBpcyBub3Qgc2V0CkNPTkZJR19GUkFNRV9XQVJO
PTIwNDgKQ09ORklHX1NUUklQX0FTTV9TWU1TPXkKIyBDT05GSUdfUkVBREFCTEVfQVNNIGlz
IG5vdCBzZXQKIyBDT05GSUdfSEVBREVSU19JTlNUQUxMIGlzIG5vdCBzZXQKIyBDT05GSUdf
REVCVUdfU0VDVElPTl9NSVNNQVRDSCBpcyBub3Qgc2V0CkNPTkZJR19TRUNUSU9OX01JU01B
VENIX1dBUk5fT05MWT15CiMgQ09ORklHX0RFQlVHX0ZPUkNFX0ZVTkNUSU9OX0FMSUdOXzY0
QiBpcyBub3Qgc2V0CkNPTkZJR19PQkpUT09MPXkKIyBDT05GSUdfVk1MSU5VWF9NQVAgaXMg
bm90IHNldAojIENPTkZJR19ERUJVR19GT1JDRV9XRUFLX1BFUl9DUFUgaXMgbm90IHNldAoj
IGVuZCBvZiBDb21waWxlLXRpbWUgY2hlY2tzIGFuZCBjb21waWxlciBvcHRpb25zCgojCiMg
R2VuZXJpYyBLZXJuZWwgRGVidWdnaW5nIEluc3RydW1lbnRzCiMKQ09ORklHX01BR0lDX1NZ
U1JRPXkKQ09ORklHX01BR0lDX1NZU1JRX0RFRkFVTFRfRU5BQkxFPTB4MApDT05GSUdfTUFH
SUNfU1lTUlFfU0VSSUFMPXkKQ09ORklHX01BR0lDX1NZU1JRX1NFUklBTF9TRVFVRU5DRT0i
IgpDT05GSUdfREVCVUdfRlM9eQpDT05GSUdfREVCVUdfRlNfQUxMT1dfQUxMPXkKIyBDT05G
SUdfREVCVUdfRlNfRElTQUxMT1dfTU9VTlQgaXMgbm90IHNldAojIENPTkZJR19ERUJVR19G
U19BTExPV19OT05FIGlzIG5vdCBzZXQKQ09ORklHX0hBVkVfQVJDSF9LR0RCPXkKIyBDT05G
SUdfS0dEQiBpcyBub3Qgc2V0CkNPTkZJR19BUkNIX0hBU19VQlNBTl9TQU5JVElaRV9BTEw9
eQojIENPTkZJR19VQlNBTiBpcyBub3Qgc2V0CkNPTkZJR19IQVZFX0FSQ0hfS0NTQU49eQpD
T05GSUdfSEFWRV9LQ1NBTl9DT01QSUxFUj15CiMgQ09ORklHX0tDU0FOIGlzIG5vdCBzZXQK
IyBlbmQgb2YgR2VuZXJpYyBLZXJuZWwgRGVidWdnaW5nIEluc3RydW1lbnRzCgojCiMgTmV0
d29ya2luZyBEZWJ1Z2dpbmcKIwojIENPTkZJR19ORVRfREVWX1JFRkNOVF9UUkFDS0VSIGlz
IG5vdCBzZXQKIyBDT05GSUdfTkVUX05TX1JFRkNOVF9UUkFDS0VSIGlzIG5vdCBzZXQKIyBD
T05GSUdfREVCVUdfTkVUIGlzIG5vdCBzZXQKIyBlbmQgb2YgTmV0d29ya2luZyBEZWJ1Z2dp
bmcKCiMKIyBNZW1vcnkgRGVidWdnaW5nCiMKQ09ORklHX1BBR0VfRVhURU5TSU9OPXkKIyBD
T05GSUdfREVCVUdfUEFHRUFMTE9DIGlzIG5vdCBzZXQKQ09ORklHX1NMVUJfREVCVUc9eQoj
IENPTkZJR19TTFVCX0RFQlVHX09OIGlzIG5vdCBzZXQKIyBDT05GSUdfUEFHRV9PV05FUiBp
cyBub3Qgc2V0CiMgQ09ORklHX1BBR0VfVEFCTEVfQ0hFQ0sgaXMgbm90IHNldApDT05GSUdf
UEFHRV9QT0lTT05JTkc9eQojIENPTkZJR19ERUJVR19ST0RBVEFfVEVTVCBpcyBub3Qgc2V0
CkNPTkZJR19BUkNIX0hBU19ERUJVR19XWD15CkNPTkZJR19ERUJVR19XWD15CkNPTkZJR19H
RU5FUklDX1BURFVNUD15CkNPTkZJR19QVERVTVBfQ09SRT15CiMgQ09ORklHX1BURFVNUF9E
RUJVR0ZTIGlzIG5vdCBzZXQKQ09ORklHX0hBVkVfREVCVUdfS01FTUxFQUs9eQojIENPTkZJ
R19ERUJVR19LTUVNTEVBSyBpcyBub3Qgc2V0CiMgQ09ORklHX1BFUl9WTUFfTE9DS19TVEFU
UyBpcyBub3Qgc2V0CiMgQ09ORklHX0RFQlVHX09CSkVDVFMgaXMgbm90IHNldAojIENPTkZJ
R19TSFJJTktFUl9ERUJVRyBpcyBub3Qgc2V0CiMgQ09ORklHX0RFQlVHX1NUQUNLX1VTQUdF
IGlzIG5vdCBzZXQKIyBDT05GSUdfU0NIRURfU1RBQ0tfRU5EX0NIRUNLIGlzIG5vdCBzZXQK
Q09ORklHX0FSQ0hfSEFTX0RFQlVHX1ZNX1BHVEFCTEU9eQojIENPTkZJR19ERUJVR19WTSBp
cyBub3Qgc2V0CiMgQ09ORklHX0RFQlVHX1ZNX1BHVEFCTEUgaXMgbm90IHNldApDT05GSUdf
QVJDSF9IQVNfREVCVUdfVklSVFVBTD15CiMgQ09ORklHX0RFQlVHX1ZJUlRVQUwgaXMgbm90
IHNldAojIENPTkZJR19ERUJVR19NRU1PUllfSU5JVCBpcyBub3Qgc2V0CiMgQ09ORklHX0RF
QlVHX1BFUl9DUFVfTUFQUyBpcyBub3Qgc2V0CkNPTkZJR19BUkNIX1NVUFBPUlRTX0tNQVBf
TE9DQUxfRk9SQ0VfTUFQPXkKIyBDT05GSUdfREVCVUdfS01BUF9MT0NBTF9GT1JDRV9NQVAg
aXMgbm90IHNldApDT05GSUdfSEFWRV9BUkNIX0tBU0FOPXkKQ09ORklHX0hBVkVfQVJDSF9L
QVNBTl9WTUFMTE9DPXkKQ09ORklHX0NDX0hBU19LQVNBTl9HRU5FUklDPXkKQ09ORklHX0ND
X0hBU19XT1JLSU5HX05PU0FOSVRJWkVfQUREUkVTUz15CiMgQ09ORklHX0tBU0FOIGlzIG5v
dCBzZXQKQ09ORklHX0hBVkVfQVJDSF9LRkVOQ0U9eQpDT05GSUdfS0ZFTkNFPXkKQ09ORklH
X0tGRU5DRV9TQU1QTEVfSU5URVJWQUw9MApDT05GSUdfS0ZFTkNFX05VTV9PQkpFQ1RTPTI1
NQojIENPTkZJR19LRkVOQ0VfREVGRVJSQUJMRSBpcyBub3Qgc2V0CiMgQ09ORklHX0tGRU5D
RV9TVEFUSUNfS0VZUyBpcyBub3Qgc2V0CkNPTkZJR19LRkVOQ0VfU1RSRVNTX1RFU1RfRkFV
TFRTPTAKQ09ORklHX0hBVkVfQVJDSF9LTVNBTj15CiMgZW5kIG9mIE1lbW9yeSBEZWJ1Z2dp
bmcKCiMgQ09ORklHX0RFQlVHX1NISVJRIGlzIG5vdCBzZXQKCiMKIyBEZWJ1ZyBPb3BzLCBM
b2NrdXBzIGFuZCBIYW5ncwojCiMgQ09ORklHX1BBTklDX09OX09PUFMgaXMgbm90IHNldApD
T05GSUdfUEFOSUNfT05fT09QU19WQUxVRT0wCkNPTkZJR19QQU5JQ19USU1FT1VUPTAKQ09O
RklHX0xPQ0tVUF9ERVRFQ1RPUj15CkNPTkZJR19TT0ZUTE9DS1VQX0RFVEVDVE9SPXkKIyBD
T05GSUdfQk9PVFBBUkFNX1NPRlRMT0NLVVBfUEFOSUMgaXMgbm90IHNldApDT05GSUdfSEFW
RV9IQVJETE9DS1VQX0RFVEVDVE9SX0JVRERZPXkKQ09ORklHX0hBUkRMT0NLVVBfREVURUNU
T1I9eQojIENPTkZJR19IQVJETE9DS1VQX0RFVEVDVE9SX1BSRUZFUl9CVUREWSBpcyBub3Qg
c2V0CkNPTkZJR19IQVJETE9DS1VQX0RFVEVDVE9SX1BFUkY9eQojIENPTkZJR19IQVJETE9D
S1VQX0RFVEVDVE9SX0JVRERZIGlzIG5vdCBzZXQKIyBDT05GSUdfSEFSRExPQ0tVUF9ERVRF
Q1RPUl9BUkNIIGlzIG5vdCBzZXQKQ09ORklHX0hBUkRMT0NLVVBfREVURUNUT1JfQ09VTlRT
X0hSVElNRVI9eQpDT05GSUdfSEFSRExPQ0tVUF9DSEVDS19USU1FU1RBTVA9eQojIENPTkZJ
R19CT09UUEFSQU1fSEFSRExPQ0tVUF9QQU5JQyBpcyBub3Qgc2V0CkNPTkZJR19ERVRFQ1Rf
SFVOR19UQVNLPXkKQ09ORklHX0RFRkFVTFRfSFVOR19UQVNLX1RJTUVPVVQ9MTIwCiMgQ09O
RklHX0JPT1RQQVJBTV9IVU5HX1RBU0tfUEFOSUMgaXMgbm90IHNldApDT05GSUdfV1FfV0FU
Q0hET0c9eQojIENPTkZJR19XUV9DUFVfSU5URU5TSVZFX1JFUE9SVCBpcyBub3Qgc2V0CiMg
Q09ORklHX1RFU1RfTE9DS1VQIGlzIG5vdCBzZXQKIyBlbmQgb2YgRGVidWcgT29wcywgTG9j
a3VwcyBhbmQgSGFuZ3MKCiMKIyBTY2hlZHVsZXIgRGVidWdnaW5nCiMKQ09ORklHX1NDSEVE
X0RFQlVHPXkKQ09ORklHX1NDSEVEX0lORk89eQojIENPTkZJR19TQ0hFRFNUQVRTIGlzIG5v
dCBzZXQKIyBlbmQgb2YgU2NoZWR1bGVyIERlYnVnZ2luZwoKIyBDT05GSUdfREVCVUdfVElN
RUtFRVBJTkcgaXMgbm90IHNldAoKIwojIExvY2sgRGVidWdnaW5nIChzcGlubG9ja3MsIG11
dGV4ZXMsIGV0Yy4uLikKIwpDT05GSUdfTE9DS19ERUJVR0dJTkdfU1VQUE9SVD15CiMgQ09O
RklHX1BST1ZFX0xPQ0tJTkcgaXMgbm90IHNldAojIENPTkZJR19MT0NLX1NUQVQgaXMgbm90
IHNldAojIENPTkZJR19ERUJVR19SVF9NVVRFWEVTIGlzIG5vdCBzZXQKIyBDT05GSUdfREVC
VUdfU1BJTkxPQ0sgaXMgbm90IHNldAojIENPTkZJR19ERUJVR19NVVRFWEVTIGlzIG5vdCBz
ZXQKIyBDT05GSUdfREVCVUdfV1dfTVVURVhfU0xPV1BBVEggaXMgbm90IHNldAojIENPTkZJ
R19ERUJVR19SV1NFTVMgaXMgbm90IHNldAojIENPTkZJR19ERUJVR19MT0NLX0FMTE9DIGlz
IG5vdCBzZXQKIyBDT05GSUdfREVCVUdfQVRPTUlDX1NMRUVQIGlzIG5vdCBzZXQKIyBDT05G
SUdfREVCVUdfTE9DS0lOR19BUElfU0VMRlRFU1RTIGlzIG5vdCBzZXQKIyBDT05GSUdfTE9D
S19UT1JUVVJFX1RFU1QgaXMgbm90IHNldAojIENPTkZJR19XV19NVVRFWF9TRUxGVEVTVCBp
cyBub3Qgc2V0CiMgQ09ORklHX1NDRl9UT1JUVVJFX1RFU1QgaXMgbm90IHNldAojIENPTkZJ
R19DU0RfTE9DS19XQUlUX0RFQlVHIGlzIG5vdCBzZXQKIyBlbmQgb2YgTG9jayBEZWJ1Z2dp
bmcgKHNwaW5sb2NrcywgbXV0ZXhlcywgZXRjLi4uKQoKIyBDT05GSUdfTk1JX0NIRUNLX0NQ
VSBpcyBub3Qgc2V0CiMgQ09ORklHX0RFQlVHX0lSUUZMQUdTIGlzIG5vdCBzZXQKQ09ORklH
X1NUQUNLVFJBQ0U9eQojIENPTkZJR19XQVJOX0FMTF9VTlNFRURFRF9SQU5ET00gaXMgbm90
IHNldAojIENPTkZJR19ERUJVR19LT0JKRUNUIGlzIG5vdCBzZXQKCiMKIyBEZWJ1ZyBrZXJu
ZWwgZGF0YSBzdHJ1Y3R1cmVzCiMKIyBDT05GSUdfREVCVUdfTElTVCBpcyBub3Qgc2V0CiMg
Q09ORklHX0RFQlVHX1BMSVNUIGlzIG5vdCBzZXQKIyBDT05GSUdfREVCVUdfU0cgaXMgbm90
IHNldAojIENPTkZJR19ERUJVR19OT1RJRklFUlMgaXMgbm90IHNldAojIENPTkZJR19CVUdf
T05fREFUQV9DT1JSVVBUSU9OIGlzIG5vdCBzZXQKIyBDT05GSUdfREVCVUdfTUFQTEVfVFJF
RSBpcyBub3Qgc2V0CiMgZW5kIG9mIERlYnVnIGtlcm5lbCBkYXRhIHN0cnVjdHVyZXMKCiMg
Q09ORklHX0RFQlVHX0NSRURFTlRJQUxTIGlzIG5vdCBzZXQKCiMKIyBSQ1UgRGVidWdnaW5n
CiMKIyBDT05GSUdfUkNVX1NDQUxFX1RFU1QgaXMgbm90IHNldAojIENPTkZJR19SQ1VfVE9S
VFVSRV9URVNUIGlzIG5vdCBzZXQKIyBDT05GSUdfUkNVX1JFRl9TQ0FMRV9URVNUIGlzIG5v
dCBzZXQKQ09ORklHX1JDVV9DUFVfU1RBTExfVElNRU9VVD02MApDT05GSUdfUkNVX0VYUF9D
UFVfU1RBTExfVElNRU9VVD0wCiMgQ09ORklHX1JDVV9DUFVfU1RBTExfQ1BVVElNRSBpcyBu
b3Qgc2V0CkNPTkZJR19SQ1VfVFJBQ0U9eQojIENPTkZJR19SQ1VfRVFTX0RFQlVHIGlzIG5v
dCBzZXQKIyBlbmQgb2YgUkNVIERlYnVnZ2luZwoKIyBDT05GSUdfREVCVUdfV1FfRk9SQ0Vf
UlJfQ1BVIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1BVX0hPVFBMVUdfU1RBVEVfQ09OVFJPTCBp
cyBub3Qgc2V0CiMgQ09ORklHX0xBVEVOQ1lUT1AgaXMgbm90IHNldApDT05GSUdfVVNFUl9T
VEFDS1RSQUNFX1NVUFBPUlQ9eQpDT05GSUdfSEFWRV9SRVRIT09LPXkKQ09ORklHX0hBVkVf
RlVOQ1RJT05fVFJBQ0VSPXkKQ09ORklHX0hBVkVfRFlOQU1JQ19GVFJBQ0U9eQpDT05GSUdf
SEFWRV9EWU5BTUlDX0ZUUkFDRV9XSVRIX1JFR1M9eQpDT05GSUdfSEFWRV9EWU5BTUlDX0ZU
UkFDRV9XSVRIX0RJUkVDVF9DQUxMUz15CkNPTkZJR19IQVZFX0RZTkFNSUNfRlRSQUNFX1dJ
VEhfQVJHUz15CkNPTkZJR19IQVZFX0RZTkFNSUNfRlRSQUNFX05PX1BBVENIQUJMRT15CkNP
TkZJR19IQVZFX0ZUUkFDRV9NQ09VTlRfUkVDT1JEPXkKQ09ORklHX0hBVkVfU1lTQ0FMTF9U
UkFDRVBPSU5UUz15CkNPTkZJR19IQVZFX0ZFTlRSWT15CkNPTkZJR19IQVZFX09CSlRPT0xf
TUNPVU5UPXkKQ09ORklHX0hBVkVfT0JKVE9PTF9OT1BfTUNPVU5UPXkKQ09ORklHX0hBVkVf
Q19SRUNPUkRNQ09VTlQ9eQpDT05GSUdfSEFWRV9CVUlMRFRJTUVfTUNPVU5UX1NPUlQ9eQpD
T05GSUdfVFJBQ0VfQ0xPQ0s9eQpDT05GSUdfVFJBQ0lOR19TVVBQT1JUPXkKIyBDT05GSUdf
RlRSQUNFIGlzIG5vdCBzZXQKIyBDT05GSUdfUFJPVklERV9PSENJMTM5NF9ETUFfSU5JVCBp
cyBub3Qgc2V0CiMgQ09ORklHX1NBTVBMRVMgaXMgbm90IHNldApDT05GSUdfSEFWRV9TQU1Q
TEVfRlRSQUNFX0RJUkVDVD15CkNPTkZJR19IQVZFX1NBTVBMRV9GVFJBQ0VfRElSRUNUX01V
TFRJPXkKQ09ORklHX0FSQ0hfSEFTX0RFVk1FTV9JU19BTExPV0VEPXkKQ09ORklHX1NUUklD
VF9ERVZNRU09eQpDT05GSUdfSU9fU1RSSUNUX0RFVk1FTT15CgojCiMgeDg2IERlYnVnZ2lu
ZwojCkNPTkZJR19FQVJMWV9QUklOVEtfVVNCPXkKIyBDT05GSUdfWDg2X1ZFUkJPU0VfQk9P
VFVQIGlzIG5vdCBzZXQKQ09ORklHX0VBUkxZX1BSSU5USz15CkNPTkZJR19FQVJMWV9QUklO
VEtfREJHUD15CkNPTkZJR19FQVJMWV9QUklOVEtfVVNCX1hEQkM9eQojIENPTkZJR19FRklf
UEdUX0RVTVAgaXMgbm90IHNldAojIENPTkZJR19ERUJVR19UTEJGTFVTSCBpcyBub3Qgc2V0
CkNPTkZJR19IQVZFX01NSU9UUkFDRV9TVVBQT1JUPXkKIyBDT05GSUdfWDg2X0RFQ09ERVJf
U0VMRlRFU1QgaXMgbm90IHNldApDT05GSUdfSU9fREVMQVlfMFg4MD15CiMgQ09ORklHX0lP
X0RFTEFZXzBYRUQgaXMgbm90IHNldAojIENPTkZJR19JT19ERUxBWV9VREVMQVkgaXMgbm90
IHNldAojIENPTkZJR19JT19ERUxBWV9OT05FIGlzIG5vdCBzZXQKIyBDT05GSUdfREVCVUdf
Qk9PVF9QQVJBTVMgaXMgbm90IHNldAojIENPTkZJR19DUEFfREVCVUcgaXMgbm90IHNldAoj
IENPTkZJR19ERUJVR19FTlRSWSBpcyBub3Qgc2V0CiMgQ09ORklHX0RFQlVHX05NSV9TRUxG
VEVTVCBpcyBub3Qgc2V0CkNPTkZJR19YODZfREVCVUdfRlBVPXkKIyBDT05GSUdfUFVOSVRf
QVRPTV9ERUJVRyBpcyBub3Qgc2V0CkNPTkZJR19VTldJTkRFUl9PUkM9eQojIENPTkZJR19V
TldJTkRFUl9GUkFNRV9QT0lOVEVSIGlzIG5vdCBzZXQKIyBlbmQgb2YgeDg2IERlYnVnZ2lu
ZwoKIwojIEtlcm5lbCBUZXN0aW5nIGFuZCBDb3ZlcmFnZQojCiMgQ09ORklHX0tVTklUIGlz
IG5vdCBzZXQKIyBDT05GSUdfTk9USUZJRVJfRVJST1JfSU5KRUNUSU9OIGlzIG5vdCBzZXQK
IyBDT05GSUdfRkFVTFRfSU5KRUNUSU9OIGlzIG5vdCBzZXQKQ09ORklHX0FSQ0hfSEFTX0tD
T1Y9eQpDT05GSUdfQ0NfSEFTX1NBTkNPVl9UUkFDRV9QQz15CiMgQ09ORklHX0tDT1YgaXMg
bm90IHNldAojIENPTkZJR19SVU5USU1FX1RFU1RJTkdfTUVOVSBpcyBub3Qgc2V0CkNPTkZJ
R19BUkNIX1VTRV9NRU1URVNUPXkKIyBDT05GSUdfTUVNVEVTVCBpcyBub3Qgc2V0CiMgZW5k
IG9mIEtlcm5lbCBUZXN0aW5nIGFuZCBDb3ZlcmFnZQoKIwojIFJ1c3QgaGFja2luZwojCiMg
ZW5kIG9mIFJ1c3QgaGFja2luZwojIGVuZCBvZiBLZXJuZWwgaGFja2luZwo=

--------------tmAQGE30o8GoiMk0FJGzUKDW--
