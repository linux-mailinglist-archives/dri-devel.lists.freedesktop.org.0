Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DDD8C723D
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 09:46:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2587D10E03F;
	Thu, 16 May 2024 07:46:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Vs8L2eS/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE55C10E023
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 05:33:17 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-574ea5184abso3024086a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 22:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715837596; x=1716442396; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lVwBNJZZh6BDoZ4VXH0w+zn8Iy9IjG44nl4ChcxqQzw=;
 b=Vs8L2eS/JxxFZx9VHqM9k6oZmnNr973wPqYNd/z3/rh3e5zhvJOpANJZWERcOl/3zK
 VkMjjY/dbj7Urh+wGoW3NhBRqytOOpkxAktWgrEiQH8PBl3nCYvrKbug38iDNoToJayy
 d/rRRc3PUvwxigJMrpW5CcoUneBOUbjNNDXq26ZgxrEgQFfClc7PF9UGOHy8YngTqR5u
 +uYRLA8WU5eO/ubw0UaeBQeRaBs/zcgwtNLRYgTHcLYiBM7XuQ7LnffmAiBTW43AeiD7
 l9Nvgk2+6wzEzvqJwypnpoBbYHe7n25FoTfP3+1AabI7b4pZl877wwuOHC3A35VKbxmO
 zpgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715837596; x=1716442396;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lVwBNJZZh6BDoZ4VXH0w+zn8Iy9IjG44nl4ChcxqQzw=;
 b=czrCaiovrVESztaeJ/W9UDhx3xmU5iytBJAlf7b+X8CdRwITB4gLc5q+npVQvSzPSp
 SBHQSMEp9aFpW1BCBatRGoerGqxVm8876H222c4Mm19Moam5yR5MmAg7izLMFArsgQoR
 b5QzsyK+eRjETFZcuvJIaZyHCS9AcCWjLnDjPfqHbuppDnkZPDRkRWeLFOoyrHgkP19J
 G9zNhbR8ihj3YDfa7S6q4Wqd69+3jHUsIyDLFBnqgtzyiVwjPGZSgZrxRSJoaDHkmxCX
 OOu6PbKFQUv5uxvwpot83TNpzWFjQzIwbVzh3IGK4VKhYh6gOFey+XYlwO/1FSCqTLum
 hDug==
X-Gm-Message-State: AOJu0Yx4gwrKmsbgJbjbxRWxvqbZlrP2HWx++fejoh60WO6Q/LfoZUqS
 4KC0vwqctFHHoq+MMvbwzxy3il/BoWNewOwb9IvOEEL3TaLJgrnD9N1L96HnNRUxpZ5XjsBPap1
 PdSWyVOAeAMmpvy+F7twE8lnMhwF9ibK3HLU=
X-Google-Smtp-Source: AGHT+IFbhTW50KRgVyat6DSLm8WcKP5SGRVOuEXvkK7aKlBpUY4fNIDuT0QBWgITYTjIocGx7/JLfrTIGLbnIGFLR8Y=
X-Received: by 2002:a50:d610:0:b0:56d:b687:5a45 with SMTP id
 4fb4d7f45d1cf-5734d597287mr12215509a12.1.1715837593315; Wed, 15 May 2024
 22:33:13 -0700 (PDT)
MIME-Version: 1.0
References: <CABQX2QMVfsZZrHLktZ=MhJ5gG1ATRuSGa+E-CKfXATgU5BwMwQ@mail.gmail.com>
In-Reply-To: <CABQX2QMVfsZZrHLktZ=MhJ5gG1ATRuSGa+E-CKfXATgU5BwMwQ@mail.gmail.com>
From: Gregory Carter <gjcarter2@gmail.com>
Date: Wed, 15 May 2024 22:33:01 -0700
Message-ID: <CAE4jU7geruhw=+e8yg4_CFZ=-OssDnt=kHdJvhPUDB=-q660wg@mail.gmail.com>
Subject: Issues with mid-command buffer preemption
To: dri-devel@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="0000000000003df26d06188b9203"
X-Mailman-Approved-At: Thu, 16 May 2024 07:46:36 +0000
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

--0000000000003df26d06188b9203
Content-Type: text/plain; charset="UTF-8"

This problem on this particular machine can be avoided by using the kernel
command line option amdgpu.mcbp=0

Hardware Description:

12System:
  12Kernel 6.9.0-RX7600XT 12arch x86_64 12bits 64 12compiler gcc 12v
2.41-37.fc40
  12Desktop KDE Plasma 12v 6.0.4 12tk Qt 12v N/A 12wm kwin_wayland 12dm
SDDM 12Distro Fedora Linux 40 (Forty)
12CPU:
  12Info 12-core 12model AMD Ryzen 9 7845HX with Radeon Graphics 12bits 64
12type MT MCP 12arch Zen 4 12rev 2
    12cache 12L1 768 KiB 12L2 12 MiB 12L3 64 MiB
  12Speed (MHz) 12avg 2344 12high 5240 12min/max 400/5298 12cores 121 5200
122 5240 123 4881 124 4676 125 5033 126
400
    127 3478 128 400 129 400 1210 400 1211 3521 1212 400 1213 3475 1214 400
1215 3872 1216 400 1217 400 1218 400 12
19 4124
    1220 400 1221 3970 1222 400 1223 4006 1224 400 12bogomips 143733
  12Flags avx avx2 ht lm nx pae sse sse2 sse3 sse4_1 sse4_2 sse4a ssse3 svm
12Graphics:
  12Device-1 AMD Navi 33 [Radeon RX 7700S/7600/7600S/7600M XT/PRO W7600]
12vendor
Dell 12driver amdgpu
    12v kernel 12arch RDNA-3 12pcie 12speed 16 GT/s 12lanes 8 12ports
12active DP-1,HDMI-A-1,eDP-1
    12empty DP-2,DP-3,Writeback-1 12bus-ID 03:00.0 12chip-ID 1002:7480
  12Device-2 DisplayLink Dell Universal Hybrid Video Dock 12driver
cdc_ncm,snd-usb-audio 12type USB
    12rev 3.2 12speed 5 Gb/s 12lanes 1 12bus-ID 2-1.4.1:5 12chip-ID
17e9:6013
  12Device-3 Realtek Integrated_Webcam_FHD 12driver uvcvideo 12type USB
12rev 2.0 12speed 480 Mb/s 12lanes 1
    12bus-ID 7-1:2 12chip-ID 0bda:555a
  12Display wayland 12server X.org 12v 1.20.14 12with Xwayland 12v 23.2.6
12compositor kwin_wayland 12driver 12X
    12loaded amdgpu 12unloaded fbdev,modesetting,radeon,vesa 12dri radeonsi
12gpu amdgpu 12d-rect 6400x1600
    12display-ID 0
  12Monitor-1 DP-1 12pos center 12res 1920x1080 12size N/A
  12Monitor-2 HDMI-A-1 12pos right 12res 1920x1080 12size N/A
  12Monitor-3 eDP-1 12pos primary,left 12res 2560x1600 12size N/A
  12API EGL 12v 1.5 12platforms 12device 0 12drv radeonsi 12device 1 12drv
swrast 12surfaceless 12drv radeonsi
    12wayland 12drv radeonsi 12x11 12drv radeonsi 12inactive gbm
  12API OpenGL 12v 4.6 12compat-v 4.5 12vendor amd mesa 12v 24.0.7 12glx-v
1.4 12direct-render yes 12renderer AMD
    Radeon RX 7600M XT (radeonsi navi33 LLVM 18.1.1 DRM 3.57
6.9.0-RX7600XT) 12device-ID 1002:7480
    12display-ID :0.0
  12API Vulkan 12v 1.3.280 12surfaces xcb,xlib,wayland 12device 0 12type
discrete-gpu 12driver N/A
    12device-ID 1002:7480 12device 1 12type cpu 12driver N/A 12device-ID
10005:0000

dmesg:

[    0.000000] Linux version 6.9.0-RX7600XT (root@watchman) (gcc (GCC)
14.1.1 20240507 (Red Hat 14.1.1-1), GNU ld v
ersion 2.41-37.fc40) #1 SMP PREEMPT_DYNAMIC Mon May 13 13:51:28 MST 2024
[    0.000000] Command line: BOOT_IMAGE=(hd1,gpt2)/vmlinuz-6.9.0-RX7600XT
root=UUID=ac66d86f-a430-4aef-8f35-53cc5f7
61de5 ro selinux=0 mitigations=off
[    0.000000] BIOS-provided physical RAM map:
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009efff]
usable
[    0.000000] BIOS-e820: [mem 0x000000000009f000-0x00000000000bffff]
reserved
[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x0000000009afffff]
usable
[    0.000000] BIOS-e820: [mem 0x0000000009b00000-0x0000000009dfffff]
reserved
[    0.000000] BIOS-e820: [mem 0x0000000009e00000-0x0000000009efffff]
usable
[    0.000000] BIOS-e820: [mem 0x0000000009f00000-0x0000000009f11fff] ACPI
NVS
[    0.000000] BIOS-e820: [mem 0x0000000009f12000-0x00000000a235bfff]
usable
[    0.000000] BIOS-e820: [mem 0x00000000a235c000-0x00000000a455bfff]
reserved
[    0.000000] BIOS-e820: [mem 0x00000000a455c000-0x00000000a456afff]
usable
[    0.000000] BIOS-e820: [mem 0x00000000a456b000-0x00000000a456ffff]
reserved
[    0.000000] BIOS-e820: [mem 0x00000000a4570000-0x00000000b077efff]
usable
[    0.000000] BIOS-e820: [mem 0x00000000b077f000-0x00000000b2f7efff]
reserved
[    0.000000] BIOS-e820: [mem 0x00000000b2f7f000-0x00000000baf7efff] ACPI
NVS
[    0.000000] BIOS-e820: [mem 0x00000000baf7f000-0x00000000baffefff] ACPI
data
[    0.000000] BIOS-e820: [mem 0x00000000bafff000-0x00000000baffffff]
usable
[    0.000000] BIOS-e820: [mem 0x00000000bb000000-0x00000000bbffffff]
reserved
[    0.000000] BIOS-e820: [mem 0x00000000bd7f3000-0x00000000bfffffff]
reserved
[    0.000000] BIOS-e820: [mem 0x00000000e0200000-0x00000000e02fffff]
reserved
[    0.000000] BIOS-e820: [mem 0x00000000fed80000-0x00000000fed80fff]
reserved
[    0.000000] BIOS-e820: [mem 0x00000000ff000000-0x00000000ffffffff]
reserved
[    0.000000] BIOS-e820: [mem 0x0000000100000000-0x000000103de7ffff]
usable
[    0.000000] BIOS-e820: [mem 0x000000103eec0000-0x000000103fffffff]
reserved
[    0.000000] BIOS-e820: [mem 0x0000010000000000-0x00000100201fffff]
reserved
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] APIC: Static calls initialized
[    0.000000] e820: update [mem 0xa0297018-0xa02b2857] usable ==> usable
[    0.000000] extended physical RAM map:
[    0.000000] reserve setup_data: [mem
0x0000000000000000-0x000000000009efff] usable
[    0.000000] reserve setup_data: [mem
0x000000000009f000-0x00000000000bffff] reserved
[    0.000000] reserve setup_data: [mem
0x0000000000100000-0x0000000009afffff] usable
[    0.000000] reserve setup_data: [mem
0x0000000009b00000-0x0000000009dfffff] reserved
[    0.000000] reserve setup_data: [mem
0x0000000009e00000-0x0000000009efffff] usable
[    0.000000] reserve setup_data: [mem
0x0000000009f00000-0x0000000009f11fff] ACPI NVS
[    0.000000] reserve setup_data: [mem
0x0000000009f12000-0x00000000a0297017] usable
[    0.000000] reserve setup_data: [mem
0x00000000a0297018-0x00000000a02b2857] usable
[    0.000000] reserve setup_data: [mem
0x00000000a02b2858-0x00000000a235bfff] usable
[    0.000000] reserve setup_data: [mem
0x00000000a235c000-0x00000000a455bfff] reserved
[    0.000000] reserve setup_data: [mem
0x00000000a455c000-0x00000000a456afff] usable
[    0.000000] reserve setup_data: [mem
0x00000000a456b000-0x00000000a456ffff] reserved
[    0.000000] reserve setup_data: [mem
0x00000000a4570000-0x00000000b077efff] usable
[    0.000000] reserve setup_data: [mem
0x00000000b077f000-0x00000000b2f7efff] reserved
[    0.000000] reserve setup_data: [mem
0x00000000b2f7f000-0x00000000baf7efff] ACPI NVS
[    0.000000] reserve setup_data: [mem
0x00000000baf7f000-0x00000000baffefff] ACPI data
[    0.000000] reserve setup_data: [mem
0x00000000bafff000-0x00000000baffffff] usable
[    0.000000] reserve setup_data: [mem
0x00000000bb000000-0x00000000bbffffff] reserved
[    0.000000] reserve setup_data: [mem
0x00000000bd7f3000-0x00000000bfffffff] reserved
[    0.000000] reserve setup_data: [mem
0x00000000e0200000-0x00000000e02fffff] reserved
[    0.000000] reserve setup_data: [mem
0x00000000fed80000-0x00000000fed80fff] reserved
[    0.000000] reserve setup_data: [mem
0x00000000ff000000-0x00000000ffffffff] reserved
[    0.000000] reserve setup_data: [mem
0x0000000100000000-0x000000103de7ffff] usable
[    0.000000] reserve setup_data: [mem
0x000000103eec0000-0x000000103fffffff] reserved
[    0.000000] reserve setup_data: [mem
0x0000010000000000-0x00000100201fffff] reserved
[    0.000000] efi: EFI v2.8 by Dell Inc.
[    0.000000] efi: ACPI=0xbaffe000 ACPI 2.0=0xbaffe014
TPMFinalLog=0xbaf2c000 SMBIOS=0xb168b000 SMBIOS 3.0=0xb1688
000 MEMATTR=0xa6db7018 ESRT=0xad5e4b98 MOKvar=0xb1895000 RNG=0xbaf8d018
TPMEventLog=0xa4572018
[    0.000000] random: crng init done
[    0.000000] efi: Remove mem61: MMIO range=[0xe0200000-0xe02fffff] (1MB)
from e820 map
[    0.000000] e820: remove [mem 0xe0200000-0xe02fffff] reserved
[    0.000000] efi: Not removing mem62: MMIO range=[0xfed80000-0xfed80fff]
(4KB) from e820 map
[    0.000000] efi: Remove mem63: MMIO range=[0xff000000-0xffffffff] (16MB)
from e820 map
[    0.000000] e820: remove [mem 0xff000000-0xffffffff] reserved
[    0.000000] efi: Remove mem65: MMIO range=[0x10000000000-0x100201fffff]
(514MB) from e820 map
[    0.000000] e820: remove [mem 0x10000000000-0x100201fffff] reserved
[    0.000000] SMBIOS 3.4.0 present.
[    0.000000] DMI: Alienware Alienware m18 R1 AMD/0XY1HF, BIOS 1.13.1
04/23/2024
[    0.000000] tsc: Fast TSC calibration using PIT
[    0.000000] tsc: Detected 2994.441 MHz processor
[    0.000349] e820: update [mem 0x00000000-0x00000fff] usable ==> reserved
[    0.000350] e820: remove [mem 0x000a0000-0x000fffff] usable
[    0.000355] last_pfn = 0x103de80 max_arch_pfn = 0x400000000
[    0.000360] MTRR map: 7 entries (3 fixed + 4 variable; max 20), built
from 9 variable MTRRs
[    0.000361] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT

[    0.000875] last_pfn = 0xbb000 max_arch_pfn = 0x400000000
[    0.003318] esrt: Reserving ESRT space from 0x00000000ad5e4b98 to
0x00000000ad5e4c20.
[    0.003324] e820: update [mem 0xad5e4000-0xad5e4fff] usable ==> reserved
[    0.003336] Using GB pages for direct mapping
[    0.003637] Secure boot disabled
[    0.003637] RAMDISK: [mem 0x82f25000-0x9437efff]
[    0.003641] ACPI: Early table checksum verification disabled
[    0.003643] ACPI: RSDP 0x00000000BAFFE014 000024 (v02 ALWARE)
[    0.003646] ACPI: XSDT 0x00000000BAF93228 000184 (v01 ALWARE WN09
    00000002      01000013)
[    0.003650] ACPI: FACP 0x00000000BAFED000 00010C (v05 ALWARE WN09
    00000002 ASL  00040000)
[    0.003653] ACPI: DSDT 0x00000000BAFD9000 00D44D (v02 ALWARE WN09
    00000002 ASL  00040000)
[    0.003655] ACPI: FACS 0x00000000BAE61000 000040
[    0.003656] ACPI: UEFI 0x00000000BAF7E000 000236 (v01 ALWARE WN09
    00000001 ASL  00040000)
[    0.003657] ACPI: IVRS 0x00000000BAFFC000 0001A4 (v02 ALWARE WN09
    00000001 ASL  00040000)
[    0.003659] ACPI: SSDT 0x00000000BAFF4000 007F51 (v02 ALWARE WN09
    00000002 ACPI 00040000)
[    0.003660] ACPI: SSDT 0x00000000BAFF3000 000573 (v02 ALWARE WN09
    00000001 ACPI 00040000)
[    0.003661] ACPI: SSDT 0x00000000BAFF2000 00044B (v01 ALWARE WN09
    00001000 ACPI 00040000)
[    0.003663] ACPI: TPM2 0x00000000BAFF1000 000034 (v04 ALWARE WN09
    00000002 ASL  00040000)
[    0.003664] ACPI: MSDM 0x00000000BAFF0000 000055 (v03 ALWARE WN09
    00000001 ASL  00040000)
[    0.003665] ACPI: ASF! 0x00000000BAFEF000 0000A5 (v32 ALWARE WN09
    00000002 ASL  00040000)
[    0.003666] ACPI: BOOT 0x00000000BAFEE000 000028 (v01 ALWARE WN09
    00000002 ASL  00040000)
[    0.003668] ACPI: HPET 0x00000000BAFEC000 000038 (v01 ALWARE WN09
    00000002 ASL  00040000)
[    0.003669] ACPI: APIC 0x00000000BAFEB000 000222 (v03 ALWARE WN09
    00000002 ASL  00040000)
[    0.003670] ACPI: MCFG 0x00000000BAFEA000 00003C (v01 ALWARE WN09
    00000002 ASL  00040000)
[    0.003671] ACPI: SLIC 0x00000000BAFE9000 000176 (v01 ALWARE WN09
    00000002 ASL  00040000)
[    0.003673] ACPI: VFCT 0x00000000BAFCA000 00E284 (v01 ALWARE WN09
    00000001 ASL  00040000)
[    0.003674] ACPI: SSDT 0x00000000BAFC9000 0000F8 (v01 ALWARE WN09
    00001000 ACPI 00040000)
[    0.003675] ACPI: SSDT 0x00000000BAFC1000 0074CE (v02 ALWARE WN09
    00000001 ACPI 00040000)
[    0.003676] ACPI: CRAT 0x00000000BAFBF000 001650 (v01 ALWARE WN09
    00000001 ASL  00040000)
[    0.003678] ACPI: CDIT 0x00000000BAFFD000 000029 (v01 ALWARE WN09
    00000001 ASL  00040000)
[    0.003679] ACPI: SSDT 0x00000000BAFBD000 0008A2 (v02 ALWARE WN09
    00000001 ACPI 00040000)
[    0.003680] ACPI: SSDT 0x00000000BAFBB000 001C37 (v02 ALWARE WN09
    00000001 ACPI 00040000)
[    0.003681] ACPI: SSDT 0x00000000BAFBA000 000788 (v02 ALWARE WN09
    00000001 ACPI 00040000)
[    0.003683] ACPI: SSDT 0x00000000BAFB9000 00076A (v02 ALWARE WN09
    00000001 ACPI 00040000)
[    0.003684] ACPI: SSDT 0x00000000BAFAE000 00ABA7 (v02 ALWARE WN09
    00000002 ACPI 00040000)
[    0.003685] ACPI: SSDT 0x00000000BAFA4000 00963D (v02 ALWARE WN09
    00000001 ACPI 00040000)
[    0.003687] ACPI: FPDT 0x00000000BAFA3000 000044 (v01 ALWARE WN09
    00000002 ASL  00040000)
[    0.003688] ACPI: SSDT 0x00000000BAF9F000 0022AD (v02 ALWARE WN09
    00000001 ACPI 00040000)
[    0.003689] ACPI: SSDT 0x00000000BAFE8000 000FE1 (v02 ALWARE WN09
    00000001 ACPI 00040000)
[    0.003691] ACPI: SSDT 0x00000000BAFE7000 000FE1 (v02 ALWARE WN09
    00000001 ACPI 00040000)
[    0.003692] ACPI: SSDT 0x00000000BAF9D000 001BAF (v02 ALWARE WN09
    00000001 ACPI 00040000)
[    0.003693] ACPI: SSDT 0x00000000BAF9C000 0006DA (v02 ALWARE WN09
    00000001 ACPI 00040000)
[    0.003695] ACPI: SSDT 0x00000000BAF9B000 000946 (v02 ALWARE WN09
    00000001 ACPI 00040000)
[    0.003696] ACPI: SSDT 0x00000000BAF9A000 00008D (v02 ALWARE WN09
    00000001 ACPI 00040000)
[    0.003697] ACPI: SSDT 0x00000000BAF99000 00066F (v02 ALWARE WN09
    00000001 ACPI 00040000)
[    0.003698] ACPI: SSDT 0x00000000BAF98000 000730 (v02 ALWARE WN09
    00000001 ACPI 00040000)
[    0.003700] ACPI: SSDT 0x00000000BAF97000 000BEB (v02 ALWARE WN09
    00000001 ACPI 00040000)
[    0.003701] ACPI: SSDT 0x00000000BAF96000 0005E6 (v02 ALWARE WN09
    00000001 ACPI 00040000)
[    0.003702] ACPI: SSDT 0x00000000BAF95000 00047A (v02 ALWARE WN09
    00000001 ACPI 00040000)
[    0.003704] ACPI: SSDT 0x00000000BAF94000 000877 (v02 ALWARE WN09
    00000001 ACPI 00040000)
[    0.003705] ACPI: SSDT 0x00000000BAF91000 00102E (v02 ALWARE WN09
    00000001 ACPI 00040000)
[    0.003706] ACPI: SSDT 0x00000000BAF8F000 0011AA (v01 ALWARE WN09
    00000001 ACPI 00040000)
[    0.003707] ACPI: SSDT 0x00000000BAFBE000 000087 (v01 ALWARE WN09
    00000001 ACPI 00040000)
[    0.003709] ACPI: SSDT 0x00000000BAF8E000 0000E5 (v01 ALWARE WN09
    00000001 ACPI 00040000)
[    0.003710] ACPI: BGRT 0x00000000BAFA2000 000038 (v01 ALWARE WN09
    00000002 ASL  00040000)
[    0.003711] ACPI: Reserving FACP table memory at [mem
0xbafed000-0xbafed10b]
[    0.003712] ACPI: Reserving DSDT table memory at [mem
0xbafd9000-0xbafe644c]
[    0.003712] ACPI: Reserving FACS table memory at [mem
0xbae61000-0xbae6103f]
[    0.003713] ACPI: Reserving UEFI table memory at [mem
0xbaf7e000-0xbaf7e235]
[    0.003713] ACPI: Reserving IVRS table memory at [mem
0xbaffc000-0xbaffc1a3]
[    0.003714] ACPI: Reserving SSDT table memory at [mem
0xbaff4000-0xbaffbf50]
[    0.003714] ACPI: Reserving SSDT table memory at [mem
0xbaff3000-0xbaff3572]
[    0.003714] ACPI: Reserving SSDT table memory at [mem
0xbaff2000-0xbaff244a]
[    0.003715] ACPI: Reserving TPM2 table memory at [mem
0xbaff1000-0xbaff1033]
[    0.003715] ACPI: Reserving MSDM table memory at [mem
0xbaff0000-0xbaff0054]
[    0.003715] ACPI: Reserving ASF! table memory at [mem
0xbafef000-0xbafef0a4]
[    0.003716] ACPI: Reserving BOOT table memory at [mem
0xbafee000-0xbafee027]
[    0.003716] ACPI: Reserving HPET table memory at [mem
0xbafec000-0xbafec037]
[    0.003717] ACPI: Reserving APIC table memory at [mem
0xbafeb000-0xbafeb221]
[    0.003717] ACPI: Reserving MCFG table memory at [mem
0xbafea000-0xbafea03b]
[    0.003717] ACPI: Reserving SLIC table memory at [mem
0xbafe9000-0xbafe9175]
[    0.003718] ACPI: Reserving VFCT table memory at [mem
0xbafca000-0xbafd8283]
[    0.003718] ACPI: Reserving SSDT table memory at [mem
0xbafc9000-0xbafc90f7]
[    0.003719] ACPI: Reserving SSDT table memory at [mem
0xbafc1000-0xbafc84cd]
[    0.003719] ACPI: Reserving CRAT table memory at [mem
0xbafbf000-0xbafc064f]
[    0.003719] ACPI: Reserving CDIT table memory at [mem
0xbaffd000-0xbaffd028]
[    0.003720] ACPI: Reserving SSDT table memory at [mem
0xbafbd000-0xbafbd8a1]
[    0.003720] ACPI: Reserving SSDT table memory at [mem
0xbafbb000-0xbafbcc36]
[    0.003721] ACPI: Reserving SSDT table memory at [mem
0xbafba000-0xbafba787]
[    0.003721] ACPI: Reserving SSDT table memory at [mem
0xbafb9000-0xbafb9769]
[    0.003721] ACPI: Reserving SSDT table memory at [mem
0xbafae000-0xbafb8ba6]
[    0.003722] ACPI: Reserving SSDT table memory at [mem
0xbafa4000-0xbafad63c]
[    0.003722] ACPI: Reserving FPDT table memory at [mem
0xbafa3000-0xbafa3043]
[    0.003723] ACPI: Reserving SSDT table memory at [mem
0xbaf9f000-0xbafa12ac]
[    0.003723] ACPI: Reserving SSDT table memory at [mem
0xbafe8000-0xbafe8fe0]
[    0.003723] ACPI: Reserving SSDT table memory at [mem
0xbafe7000-0xbafe7fe0]
[    0.003724] ACPI: Reserving SSDT table memory at [mem
0xbaf9d000-0xbaf9ebae]
[    0.003724] ACPI: Reserving SSDT table memory at [mem
0xbaf9c000-0xbaf9c6d9]
[    0.003725] ACPI: Reserving SSDT table memory at [mem
0xbaf9b000-0xbaf9b945]
[    0.003725] ACPI: Reserving SSDT table memory at [mem
0xbaf9a000-0xbaf9a08c]
[    0.003725] ACPI: Reserving SSDT table memory at [mem
0xbaf99000-0xbaf9966e]
[    0.003726] ACPI: Reserving SSDT table memory at [mem
0xbaf98000-0xbaf9872f]
[    0.003726] ACPI: Reserving SSDT table memory at [mem
0xbaf97000-0xbaf97bea]
[    0.003727] ACPI: Reserving SSDT table memory at [mem
0xbaf96000-0xbaf965e5]
[    0.003727] ACPI: Reserving SSDT table memory at [mem
0xbaf95000-0xbaf95479]
[    0.003727] ACPI: Reserving SSDT table memory at [mem
0xbaf94000-0xbaf94876]
[    0.003728] ACPI: Reserving SSDT table memory at [mem
0xbaf91000-0xbaf9202d]
[    0.003728] ACPI: Reserving SSDT table memory at [mem
0xbaf8f000-0xbaf901a9]
[    0.003729] ACPI: Reserving SSDT table memory at [mem
0xbafbe000-0xbafbe086]
[    0.003729] ACPI: Reserving SSDT table memory at [mem
0xbaf8e000-0xbaf8e0e4]
[    0.003729] ACPI: Reserving BGRT table memory at [mem
0xbafa2000-0xbafa2037]
[    0.003784] No NUMA configuration found
[    0.003784] Faking a node at [mem 0x0000000000000000-0x000000103de7ffff]
[    0.003788] NODE_DATA(0) allocated [mem 0x103de55000-0x103de7ffff]
[    0.003941] Zone ranges:
[    0.003942]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.003943]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
[    0.003943]   Normal   [mem 0x0000000100000000-0x000000103de7ffff]
[    0.003944]   Device   empty
[    0.003945] Movable zone start for each node
[    0.003946] Early memory node ranges
[    0.003946]   node   0: [mem 0x0000000000001000-0x000000000009efff]
[    0.003947]   node   0: [mem 0x0000000000100000-0x0000000009afffff]
[    0.003947]   node   0: [mem 0x0000000009e00000-0x0000000009efffff]
[    0.003948]   node   0: [mem 0x0000000009f12000-0x00000000a235bfff]
[    0.003948]   node   0: [mem 0x00000000a455c000-0x00000000a456afff]
[    0.003949]   node   0: [mem 0x00000000a4570000-0x00000000b077efff]
[    0.003949]   node   0: [mem 0x00000000bafff000-0x00000000baffffff]
[    0.003949]   node   0: [mem 0x0000000100000000-0x000000103de7ffff]
[    0.003953] Initmem setup node 0 [mem
0x0000000000001000-0x000000103de7ffff]
[    0.003957] On node 0, zone DMA: 1 pages in unavailable ranges
[    0.003970] On node 0, zone DMA: 97 pages in unavailable ranges
[    0.004082] On node 0, zone DMA32: 768 pages in unavailable ranges
[    0.006011] On node 0, zone DMA32: 18 pages in unavailable ranges
[    0.006061] On node 0, zone DMA32: 8704 pages in unavailable ranges
[    0.006229] On node 0, zone DMA32: 5 pages in unavailable ranges
[    0.006477] On node 0, zone DMA32: 43136 pages in unavailable ranges
[    0.058266] On node 0, zone Normal: 20480 pages in unavailable ranges
[    0.058317] On node 0, zone Normal: 8576 pages in unavailable ranges
[    0.059186] ACPI: PM-Timer IO Port: 0x408
[    0.059192] CPU topo: Ignoring hot-pluggable APIC ID 0 in present
package.
[    0.059195] ACPI: LAPIC_NMI (acpi_id[0x00] high edge lint[0x1])
[    0.059196] ACPI: LAPIC_NMI (acpi_id[0x01] high edge lint[0x1])
[    0.059196] ACPI: LAPIC_NMI (acpi_id[0x02] high edge lint[0x1])
[    0.059197] ACPI: LAPIC_NMI (acpi_id[0x03] high edge lint[0x1])
[    0.059197] ACPI: LAPIC_NMI (acpi_id[0x04] high edge lint[0x1])
[    0.059197] ACPI: LAPIC_NMI (acpi_id[0x05] high edge lint[0x1])
[    0.059198] ACPI: LAPIC_NMI (acpi_id[0x06] high edge lint[0x1])
[    0.059198] ACPI: LAPIC_NMI (acpi_id[0x07] high edge lint[0x1])
[    0.059199] ACPI: LAPIC_NMI (acpi_id[0x08] high edge lint[0x1])
[    0.059199] ACPI: LAPIC_NMI (acpi_id[0x09] high edge lint[0x1])
[    0.059200] ACPI: LAPIC_NMI (acpi_id[0x0a] high edge lint[0x1])
[    0.059200] ACPI: LAPIC_NMI (acpi_id[0x0b] high edge lint[0x1])
[    0.059200] ACPI: LAPIC_NMI (acpi_id[0x0c] high edge lint[0x1])
[    0.059201] ACPI: LAPIC_NMI (acpi_id[0x0d] high edge lint[0x1])
[    0.059201] ACPI: LAPIC_NMI (acpi_id[0x0e] high edge lint[0x1])
[    0.059201] ACPI: LAPIC_NMI (acpi_id[0x0f] high edge lint[0x1])
[    0.059202] ACPI: LAPIC_NMI (acpi_id[0x10] high edge lint[0x1])
[    0.059202] ACPI: LAPIC_NMI (acpi_id[0x11] high edge lint[0x1])
[    0.059203] ACPI: LAPIC_NMI (acpi_id[0x12] high edge lint[0x1])
[    0.059203] ACPI: LAPIC_NMI (acpi_id[0x13] high edge lint[0x1])
[    0.059203] ACPI: LAPIC_NMI (acpi_id[0x14] high edge lint[0x1])
[    0.059204] ACPI: LAPIC_NMI (acpi_id[0x15] high edge lint[0x1])
[    0.059204] ACPI: LAPIC_NMI (acpi_id[0x16] high edge lint[0x1])
[    0.059204] ACPI: LAPIC_NMI (acpi_id[0x17] high edge lint[0x1])
[    0.059205] ACPI: LAPIC_NMI (acpi_id[0x18] high edge lint[0x1])
[    0.059205] ACPI: LAPIC_NMI (acpi_id[0x19] high edge lint[0x1])
[    0.059206] ACPI: LAPIC_NMI (acpi_id[0x1a] high edge lint[0x1])
[    0.059206] ACPI: LAPIC_NMI (acpi_id[0x1b] high edge lint[0x1])
[    0.059206] ACPI: LAPIC_NMI (acpi_id[0x1c] high edge lint[0x1])
[    0.059207] ACPI: LAPIC_NMI (acpi_id[0x1d] high edge lint[0x1])
[    0.059207] ACPI: LAPIC_NMI (acpi_id[0x1e] high edge lint[0x1])
[    0.059207] ACPI: LAPIC_NMI (acpi_id[0x1f] high edge lint[0x1])
[    0.059218] IOAPIC[0]: apic_id 32, version 33, address 0xfec00000, GSI
0-23
[    0.059221] IOAPIC[1]: apic_id 33, version 33, address 0xfec01000, GSI
24-55
[    0.059222] ACPI: INT_SRC_OVR (bus 0 bus_irq 1 global_irq 1 low edge)
[    0.059224] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.059224] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 low level)
[    0.059227] ACPI: Using ACPI (MADT) for SMP configuration information
[    0.059227] ACPI: HPET id: 0x10228210 base: 0xfed00000
[    0.059234] e820: update [mem 0xa6e4f000-0xa70d4fff] usable ==> reserved
[    0.059245] CPU topo: Max. logical packages:   1
[    0.059246] CPU topo: Max. logical dies:       1
[    0.059246] CPU topo: Max. dies per package:   1
[    0.059248] CPU topo: Max. threads per core:   2
[    0.059249] CPU topo: Num. cores per package:    12
[    0.059249] CPU topo: Num. threads per package:  24
[    0.059249] CPU topo: Allowing 24 present CPUs plus 0 hotplug CPUs
[    0.059250] CPU topo: Rejected CPUs 8
[    0.059264] PM: hibernation: Registered nosave memory: [mem
0x00000000-0x00000fff]
[    0.059265] PM: hibernation: Registered nosave memory: [mem
0x0009f000-0x000bffff]
[    0.059266] PM: hibernation: Registered nosave memory: [mem
0x000c0000-0x000fffff]
[    0.059267] PM: hibernation: Registered nosave memory: [mem
0x09b00000-0x09dfffff]
[    0.059268] PM: hibernation: Registered nosave memory: [mem
0x09f00000-0x09f11fff]
[    0.059268] PM: hibernation: Registered nosave memory: [mem
0xa0297000-0xa0297fff]
[    0.059269] PM: hibernation: Registered nosave memory: [mem
0xa02b2000-0xa02b2fff]
[    0.059270] PM: hibernation: Registered nosave memory: [mem
0xa235c000-0xa455bfff]
[    0.059271] PM: hibernation: Registered nosave memory: [mem
0xa456b000-0xa456ffff]
[    0.059272] PM: hibernation: Registered nosave memory: [mem
0xa6e4f000-0xa70d4fff]
[    0.059273] PM: hibernation: Registered nosave memory: [mem
0xad5e4000-0xad5e4fff]
[    0.059274] PM: hibernation: Registered nosave memory: [mem
0xb077f000-0xb2f7efff]
[    0.059274] PM: hibernation: Registered nosave memory: [mem
0xb2f7f000-0xbaf7efff]
[    0.059275] PM: hibernation: Registered nosave memory: [mem
0xbaf7f000-0xbaffefff]
[    0.059276] PM: hibernation: Registered nosave memory: [mem
0xbb000000-0xbbffffff]
[    0.059276] PM: hibernation: Registered nosave memory: [mem
0xbc000000-0xbd7f2fff]
[    0.059276] PM: hibernation: Registered nosave memory: [mem
0xbd7f3000-0xbfffffff]
[    0.059277] PM: hibernation: Registered nosave memory: [mem
0xc0000000-0xfed7ffff]
[    0.059277] PM: hibernation: Registered nosave memory: [mem
0xfed80000-0xfed80fff]
[    0.059277] PM: hibernation: Registered nosave memory: [mem
0xfed81000-0xffffffff]
[    0.059278] [mem 0xc0000000-0xfed7ffff] available for PCI devices
[    0.059279] Booting paravirtualized kernel on bare hardware
[    0.059281] clocksource: refined-jiffies: mask: 0xffffffff max_cycles:
0xffffffff, max_idle_ns: 1910969940391419
ns
[    0.062760] setup_percpu: NR_CPUS:8192 nr_cpumask_bits:24 nr_cpu_ids:24
nr_node_ids:1
[    0.063401] percpu: Embedded 66 pages/cpu s233472 r8192 d28672 u524288
[    0.063405] pcpu-alloc: s233472 r8192 d28672 u524288 alloc=1*2097152
[    0.063407] pcpu-alloc: [0] 00 01 02 03 [0] 04 05 06 07
[    0.063409] pcpu-alloc: [0] 08 09 10 11 [0] 12 13 14 15
[    0.063412] pcpu-alloc: [0] 16 17 18 19 [0] 20 21 22 23
[    0.063427] Kernel command line:
BOOT_IMAGE=(hd1,gpt2)/vmlinuz-6.9.0-RX7600XT
root=UUID=ac66d86f-a430-4aef-8f35-
53cc5f761de5 ro selinux=0 mitigations=off
[    0.063472] Unknown kernel command line parameters
"BOOT_IMAGE=(hd1,gpt2)/vmlinuz-6.9.0-RX7600XT", will be passe
d to user space.
[    0.066143] Dentry cache hash table entries: 8388608 (order: 14,
67108864 bytes, linear)
[    0.067378] Inode-cache hash table entries: 4194304 (order: 13, 33554432
bytes, linear)
[    0.067481] Fallback order for Node 0: 0
[    0.067486] Built 1 zonelists, mobility grouping on.  Total pages:
16434405
[    0.067487] Policy zone: Normal
[    0.067579] mem auto-init: stack:all(zero), heap alloc:off, heap
free:off
[    0.067614] software IO TLB: area num 32.
[    0.122263] Memory: 65150360K/66781724K available (20480K kernel code,
3317K rwdata, 15092K rodata, 4580K init,
4732K bss, 1631104K reserved, 0K cma-reserved)
[    0.122380] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=24, Nodes=1
[    0.122405] ftrace: allocating 55275 entries in 216 pages
[    0.129909] ftrace: allocated 216 pages with 4 groups
[    0.130500] Dynamic Preempt: voluntary
[    0.130551] rcu: Preemptible hierarchical RCU implementation.
[    0.130551] rcu:     RCU restricting CPUs from NR_CPUS=8192 to
nr_cpu_ids=24.
[    0.130552]  Trampoline variant of Tasks RCU enabled.
[    0.130553]  Rude variant of Tasks RCU enabled.
[    0.130553]  Tracing variant of Tasks RCU enabled.
[    0.130554] rcu: RCU calculated value of scheduler-enlistment delay is
100 jiffies.
[    0.130554] rcu: Adjusting geometry for rcu_fanout_leaf=16,
nr_cpu_ids=24
[    0.130561] RCU Tasks: Setting shift to 5 and lim to 1
rcu_task_cb_adjust=1.
[    0.130562] RCU Tasks Rude: Setting shift to 5 and lim to 1
rcu_task_cb_adjust=1.
[    0.130564] RCU Tasks Trace: Setting shift to 5 and lim to 1
rcu_task_cb_adjust=1.
[    0.132885] NR_IRQS: 524544, nr_irqs: 1160, preallocated irqs: 16
[    0.133061] rcu: srcu_init: Setting srcu_struct sizes based on
contention.
[    0.133198] kfence: initialized - using 2097152 bytes for 255 objects at
0x(____ptrval____)-0x(____ptrval____)
[    0.133221] Console: colour dummy device 80x25
[    0.133222] printk: legacy console [tty0] enabled
[    0.133498] ACPI: Core revision 20230628
[    0.133678] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff,
max_idle_ns: 133484873504 ns
[    0.133691] APIC: Switch to symmetric I/O mode setup
[    0.134267] AMD-Vi: ivrs, add hid:AMDI0020, uid:\_SB.FUR0, rdevid:160
[    0.134269] AMD-Vi: ivrs, add hid:AMDI0020, uid:\_SB.FUR1, rdevid:160
[    0.134270] AMD-Vi: ivrs, add hid:AMDI0020, uid:\_SB.FUR2, rdevid:160
[    0.134271] AMD-Vi: ivrs, add hid:AMDI0020, uid:\_SB.FUR3, rdevid:160
[    0.134272] AMD-Vi: Using global IVHD EFR:0x246577efa2254afa, EFR2:0x0
[    0.134498] x2apic: IRQ remapping doesn't support X2APIC mode
[    0.134504] APIC: Switched APIC routing to: physical flat
[    0.135217] ..TIMER: vector=0x30 apic1=0 pin1=2 apic2=-1 pin2=-1
[    0.139697] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles:
0x2b29c2378fd, max_idle_ns: 44079529291
3 ns
[    0.139700] Calibrating delay loop (skipped), value calculated using
timer frequency.. 5988.88 BogoMIPS (lpj=299
4441)
[    0.139712] x86/cpu: User Mode Instruction Prevention (UMIP) activated
[    0.139752] LVT offset 1 assigned for vector 0xf9
[    0.139877] LVT offset 2 assigned for vector 0xf4
[    0.139915] Last level iTLB entries: 4KB 512, 2MB 512, 4MB 256
[    0.139916] Last level dTLB entries: 4KB 3072, 2MB 3072, 4MB 1536, 1GB 0
[    0.139918] process: using mwait in idle threads
[    0.139921] Spectre V2 : User space: Vulnerable
[    0.139922] Speculative Store Bypass: Vulnerable
[    0.139926] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point
registers'
[    0.139928] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
[    0.139929] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
[    0.139930] x86/fpu: Supporting XSAVE feature 0x020: 'AVX-512 opmask'
[    0.139931] x86/fpu: Supporting XSAVE feature 0x040: 'AVX-512 Hi256'
[    0.139932] x86/fpu: Supporting XSAVE feature 0x080: 'AVX-512 ZMM_Hi256'
[    0.139933] x86/fpu: Supporting XSAVE feature 0x200: 'Protection Keys
User registers'
[    0.139934] x86/fpu: Supporting XSAVE feature 0x800: 'Control-flow User
registers'
[    0.139936] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
[    0.139937] x86/fpu: xstate_offset[5]:  832, xstate_sizes[5]:   64
[    0.139938] x86/fpu: xstate_offset[6]:  896, xstate_sizes[6]:  512
[    0.139939] x86/fpu: xstate_offset[7]: 1408, xstate_sizes[7]: 1024
[    0.139940] x86/fpu: xstate_offset[9]: 2432, xstate_sizes[9]:    8
[    0.139941] x86/fpu: xstate_offset[11]: 2440, xstate_sizes[11]:   16
[    0.139942] x86/fpu: Enabled xstate features 0xae7, context size is 2456
bytes, using 'compacted' format.
[    0.152488] Freeing SMP alternatives memory: 48K
[    0.152490] pid_max: default: 32768 minimum: 301
[    0.153717] LSM: initializing
lsm=lockdown,capability,yama,bpf,landlock,ima,evm
[    0.153731] Yama: becoming mindful.
[    0.153734] LSM support for eBPF active
[    0.153735] landlock: Up and running.
[    0.153801] Mount-cache hash table entries: 131072 (order: 8, 1048576
bytes, linear)
[    0.153859] Mountpoint-cache hash table entries: 131072 (order: 8,
1048576 bytes, linear)
[    0.258511] smpboot: CPU0: AMD Ryzen 9 7845HX with Radeon Graphics
(family: 0x19, model: 0x61, stepping: 0x2)
[    0.258603] Performance Events: Fam17h+ 16-deep LBR, core perfctr, AMD
PMU driver.
[    0.258615] ... version:                2
[    0.258616] ... bit width:              48
[    0.258616] ... generic registers:      6
[    0.258617] ... value mask:             0000ffffffffffff
[    0.258618] ... max period:             00007fffffffffff
[    0.258619] ... fixed-purpose events:   0
[    0.258619] ... event mask:             000000000000003f
[    0.258660] signal: max sigframe size: 3376
[    0.258672] rcu: Hierarchical SRCU implementation.
[    0.258673] rcu:     Max phase no-delay instances is 400.
[    0.258699] NMI watchdog: Enabled. Permanently consumes one hw-PMU
counter.
[    0.258699] smp: Bringing up secondary CPUs ...
[    0.258699] smpboot: x86: Booting SMP configuration:
[    0.258699] .... node  #0, CPUs:        #2  #4  #6  #8 #10 #12 #14 #16
#18 #20 #22  #1  #3  #5  #7  #9 #11 #13 #
15 #17 #19 #21 #23
[    0.284722] smp: Brought up 1 node, 24 CPUs
[    0.284722] smpboot: Total of 24 processors activated (143733.16
BogoMIPS)
[    0.285983] devtmpfs: initialized
[    0.286723] x86/mm: Memory block size: 2048MB
[    0.287113] ACPI: PM: Registering ACPI NVS region [mem
0x09f00000-0x09f11fff] (73728 bytes)
[    0.287113] ACPI: PM: Registering ACPI NVS region [mem
0xb2f7f000-0xbaf7efff] (134217728 bytes)
[    0.287221] clocksource: jiffies: mask: 0xffffffff max_cycles:
0xffffffff, max_idle_ns: 1911260446275000 ns
[    0.287225] futex hash table entries: 8192 (order: 7, 524288 bytes,
linear)
[    0.287274] pinctrl core: initialized pinctrl subsystem
[    0.287747] PM: RTC time: 18:01:30, date: 2024-05-15
[    0.287917] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.287967] DMA: preallocated 4096 KiB GFP_KERNEL pool for atomic
allocations
[    0.287970] DMA: preallocated 4096 KiB GFP_KERNEL|GFP_DMA pool for
atomic allocations
[    0.287973] DMA: preallocated 4096 KiB GFP_KERNEL|GFP_DMA32 pool for
atomic allocations
[    0.287980] audit: initializing netlink subsys (disabled)
[    0.287983] audit: type=2000 audit(1715796090.153:1): state=initialized
audit_enabled=0 res=1
[    0.287983] thermal_sys: Registered thermal governor 'fair_share'
[    0.287983] thermal_sys: Registered thermal governor 'bang_bang'
[    0.287983] thermal_sys: Registered thermal governor 'step_wise'
[    0.287983] thermal_sys: Registered thermal governor 'user_space'
[    0.287983] cpuidle: using governor menu
[    0.287983] Simple Boot Flag at 0x44 set to 0x80
[    0.287983] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
[    0.287983] PCI: ECAM [mem 0xf0000000-0xf7ffffff] (base 0xf0000000) for
domain 0000 [bus 00-7f]
[    0.287983] PCI: not using ECAM ([mem 0xf0000000-0xf7ffffff] not
reserved)
[    0.287983] PCI: Using configuration type 1 for base access
[    0.287983] PCI: Using configuration type 1 for extended access
[    0.287983] kprobes: kprobe jump-optimization is enabled. All kprobes
are optimized if possible.
[    0.287983] HugeTLB: registered 1.00 GiB page size, pre-allocated 0
pages
[    0.287983] HugeTLB: 16380 KiB vmemmap can be freed for a 1.00 GiB page
[    0.287983] HugeTLB: registered 2.00 MiB page size, pre-allocated 0
pages
[    0.287983] HugeTLB: 28 KiB vmemmap can be freed for a 2.00 MiB page
[    0.287983] Demotion targets for Node 0: null
[    0.287983] cryptd: max_cpu_qlen set to 1000
[    0.287983] raid6: skipped pq benchmark and selected avx512x4
[    0.287983] raid6: using avx512x2 recovery algorithm
[    0.287983] fbcon: Taking over console
[    0.287983] ACPI: Added _OSI(Module Device)
[    0.287983] ACPI: Added _OSI(Processor Device)
[    0.287983] ACPI: Added _OSI(3.0 _SCP Extensions)
[    0.287983] ACPI: Added _OSI(Processor Aggregator Device)
[    0.291401] ACPI BIOS Error (bug): Could not resolve symbol
[\_SB.PCI0.LPC0.EC0], AE_NOT_FOUND (20230628/dswload
2-162)
[    0.291405] ACPI Error: AE_NOT_FOUND, During name lookup/catalog
(20230628/psobject-220)
[    0.291407] ACPI: Skipping parse of AML opcode: OpcodeName unavailable
(0x0010)
[    0.293053] ACPI BIOS Error (bug): Failure creating named object
[\_SB.PCI0.GPP0._PRW], AE_ALREADY_EXISTS (20230
628/dswload2-326)
[    0.293056] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog
(20230628/psobject-220)
[    0.293503] ACPI: 29 ACPI AML tables successfully acquired and loaded
[    0.293607] ACPI Error: AE_NOT_FOUND, While resolving a named reference
package element - \_SB_.PCI0.GPP2.UP00.D
P00.U4UP.U4P3.UHI0 (20230628/dspkginit-438)
[    0.293616] ACPI Error: AE_NOT_FOUND, While resolving a named reference
package element - \_SB_.PCI0.GPP2.UP00.D
P00.U4UP.U4P3.UHI0 (20230628/dspkginit-438)
[    0.293624] ACPI Error: AE_NOT_FOUND, While resolving a named reference
package element - \_SB_.PCI0.GPP2.UP00.D
P00.U4UP.U4P3.UHI0 (20230628/dspkginit-438)
[    0.293634] ACPI Error: AE_NOT_FOUND, While resolving a named reference
package element - \_SB_.PCI0.GPP2.UP00.D
P00.U4UP.U4P3.UHI0 (20230628/dspkginit-438)
[    0.293638] ACPI Error: AE_NOT_FOUND, While resolving a named reference
package element - \_SB_.PCI0.GPP2.UP00.D
P00.U4UP.U4P3.UHI0 (20230628/dspkginit-438)
[    0.296820] ACPI: [Firmware Bug]: BIOS _OSI(Linux) query ignored
[    0.432406] ACPI: _OSC evaluation for CPUs failed, trying _PDC
[    0.432607] ACPI: EC: EC started
[    0.432608] ACPI: EC: interrupt blocked
[    0.435765] ACPI: EC: EC_CMD/EC_SC=0x66, EC_DATA=0x62
[    0.435767] ACPI: \_SB_.PCI0.LPC0.EC__: Boot DSDT EC used to handle
transactions
[    0.435769] ACPI: Interpreter enabled
[    0.435782] ACPI: PM: (supports S0 S4 S5)
[    0.435784] ACPI: Using IOAPIC for interrupt routing
[    0.436152] PCI: ECAM [mem 0xf0000000-0xf7ffffff] (base 0xf0000000) for
domain 0000 [bus 00-7f]
[    0.437055] PCI: [Firmware Info]: ECAM [mem 0xf0000000-0xf7ffffff] not
reserved in ACPI motherboard resources
[    0.437057] PCI: not using ECAM ([mem 0xf0000000-0xf7ffffff] not
reserved)
[    0.437060] PCI: Using host bridge windows from ACPI; if necessary, use
"pci=nocrs" and report a bug
[    0.437062] PCI: Ignoring E820 reservations for host bridge windows
[    0.437196] ACPI: Enabled 6 GPEs in block 00 to 1F
[    0.438111] ACPI: \_SB_.PCI0.GPP0.M237: New power resource
[    0.438153] ACPI: \_SB_.PCI0.GPP0.SWUS.M237: New power resource
[    0.438175] ACPI: \_SB_.PCI0.GPP0.SWUS.SWDS.M237: New power resource
[    0.438307] ACPI: \_SB_.PCI0.GPP1.P0NV: New power resource
[    0.438666] ACPI: \_SB_.PCI0.GPP2.PWRS: New power resource
[    0.620667] ACPI: \_SB_.PCI0.GPP2.U4UP.PWRS: New power resource
[    0.627380] ACPI: \_SB_.PCI0.GPP2.U4UP.U4P0.PWRS: New power resource
[    0.627709] ACPI: \_SB_.PCI0.GPP2.U4UP.U4P0.UP0D.PWRS: New power
resource
[    0.627848] ACPI: \_SB_.PCI0.GPP2.U4UP.U4P1.PWRS: New power resource
[    0.628168] ACPI: \_SB_.PCI0.GPP2.U4UP.U4P1.UP1D.PWRS: New power
resource
[    0.628303] ACPI: \_SB_.PCI0.GPP2.U4UP.U4P2.PWRS: New power resource
[    0.634005] ACPI: \_SB_.PCI0.GPP2.U4UP.U4P2.UXHC.PWRS: New power
resource
[    0.637087] ACPI: \_SB_.PCI0.GPP2.U4UP.U4P3.PWRS: New power resource
[    0.637406] ACPI: \_SB_.PCI0.GPP2.U4UP.U4P3.UHI0.PWRS: New power
resource
[    0.637460] ACPI: \_SB_.PCI0.GPP3.PWR1: New power resource
[    0.637502] ACPI: \_SB_.PCI0.GPP3.WLAN.WRST: New power resource
[    0.637513] ACPI: \_SB_.PCI0.GPP4.PWR1: New power resource
[    0.637555] ACPI: \_SB_.PCI0.GPP5.PWR1: New power resource
[    0.637677] ACPI: \_SB_.PCI0.GPP7.P0NV: New power resource
[    0.638075] ACPI: \_SB_.PCI0.GP17.XHC0.P0U0: New power resource
[    0.638393] ACPI: \_SB_.PCI0.GP17.XHC1.P0U1: New power resource
[    0.638558] ACPI: \_SB_.PCI0.GP17.XHC1.RHUB.PRT1.HB01.BRST: New power
resource
[    0.638825] ACPI: \_SB_.PCI0.GP19.XHC2.P0U2: New power resource
[    0.646056] ACPI: PCI: Interrupt link LNKA configured for IRQ 0
[    0.646058] ACPI: PCI: Interrupt link LNKA disabled
[    0.646116] ACPI: PCI: Interrupt link LNKB configured for IRQ 0
[    0.646117] ACPI: PCI: Interrupt link LNKB disabled
[    0.646175] ACPI: PCI: Interrupt link LNKC configured for IRQ 0
[    0.646175] ACPI: PCI: Interrupt link LNKC disabled
[    0.646233] ACPI: PCI: Interrupt link LNKD configured for IRQ 0
[    0.646234] ACPI: PCI: Interrupt link LNKD disabled
[    0.646295] ACPI: PCI: Interrupt link LNKE configured for IRQ 0
[    0.646296] ACPI: PCI: Interrupt link LNKE disabled
[    0.646353] ACPI: PCI: Interrupt link LNKF configured for IRQ 0
[    0.646354] ACPI: PCI: Interrupt link LNKF disabled
[    0.646410] ACPI: PCI: Interrupt link LNKG configured for IRQ 0
[    0.646411] ACPI: PCI: Interrupt link LNKG disabled
[    0.646468] ACPI: PCI: Interrupt link LNKH configured for IRQ 0
[    0.646469] ACPI: PCI: Interrupt link LNKH disabled
[    0.646530] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
[    0.646534] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM
ClockPM Segments MSI EDR HPX-Type3]
[    0.646549] acpi PNP0A08:00: _OSC: platform does not support
[SHPCHotplug AER]
[    0.646571] acpi PNP0A08:00: _OSC: OS now controls [PCIeHotplug PME
PCIeCapability LTR DPC]
[    0.646681] PCI host bridge to bus 0000:00
[    0.646682] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7
window]
[    0.646685] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff
window]
[    0.646686] pci_bus 0000:00: root bus resource [mem
0x000a0000-0x000bffff window]
[    0.646687] pci_bus 0000:00: root bus resource [mem
0x000c0000-0x000cffff window]
[    0.646688] pci_bus 0000:00: root bus resource [mem
0x000d0000-0x000effff window]
[    0.646689] pci_bus 0000:00: root bus resource [mem
0xc0000000-0xc11fffff window]
[    0.646690] pci_bus 0000:00: root bus resource [mem
0xf8000000-0xfe000000 window]
[    0.646691] pci_bus 0000:00: root bus resource [mem
0xfed45000-0xfed814ff window]
[    0.646692] pci_bus 0000:00: root bus resource [mem
0xfed81900-0xfed81fff window]
[    0.646693] pci_bus 0000:00: root bus resource [mem
0xfedc0000-0xfedc0fff window]
[    0.646694] pci_bus 0000:00: root bus resource [mem
0xfedc6000-0xfedc6fff window]
[    0.646695] pci_bus 0000:00: root bus resource [mem
0x10020200000-0xfffffffffff window]
[    0.646696] pci_bus 0000:00: root bus resource [bus 00-ff]
[    0.646743] pci 0000:00:00.0: [1022:14d8] type 00 class 0x060000
conventional PCI endpoint
[    0.646793] pci 0000:00:00.2: [1022:14d9] type 00 class 0x080600
conventional PCI endpoint
[    0.646853] pci 0000:00:01.0: [1022:14da] type 00 class 0x060000
conventional PCI endpoint
[    0.646893] pci 0000:00:01.1: [1022:14db] type 01 class 0x060400 PCIe
Root Port
[    0.646909] pci 0000:00:01.1: PCI bridge to [bus 01-03]
[    0.646912] pci 0000:00:01.1:   bridge window [io  0x2000-0x2fff]
[    0.646915] pci 0000:00:01.1:   bridge window [mem
0xc0e00000-0xc10fffff]
[    0.646920] pci 0000:00:01.1:   bridge window [mem
0xffc00000000-0xffe0fffffff 64bit pref]
[    0.646971] pci 0000:00:01.1: PME# supported from D0 D3hot D3cold
[    0.647017] pci 0000:00:01.2: [1022:14db] type 01 class 0x060400 PCIe
Root Port
[    0.647032] pci 0000:00:01.2: PCI bridge to [bus 04]
[    0.647037] pci 0000:00:01.2:   bridge window [mem
0xc0d00000-0xc0dfffff]
[    0.647086] pci 0000:00:01.2: PME# supported from D0 D3hot D3cold
[    0.647126] pci 0000:00:01.3: [1022:14db] type 01 class 0x060400 PCIe
Root Port
[    0.647141] pci 0000:00:01.3: PCI bridge to [bus 05]
[    0.647145] pci 0000:00:01.3:   bridge window [mem
0xc0c00000-0xc0cfffff]
[    0.647194] pci 0000:00:01.3: PME# supported from D0 D3hot D3cold
[    0.647237] pci 0000:00:02.0: [1022:14da] type 00 class 0x060000
conventional PCI endpoint
[    0.647279] pci 0000:00:02.1: [1022:14db] type 01 class 0x060400 PCIe
Root Port
[    0.647294] pci 0000:00:02.1: PCI bridge to [bus 06-08]
[    0.647299] pci 0000:00:02.1:   bridge window [mem
0xc0800000-0xc0bfffff]
[    0.647390] pci 0000:00:02.1: PME# supported from D0 D3hot D3cold
[    0.647435] pci 0000:00:02.2: [1022:14db] type 01 class 0x060400 PCIe
Root Port
[    0.647450] pci 0000:00:02.2: PCI bridge to [bus 09]
[    0.647455] pci 0000:00:02.2:   bridge window [mem
0xc0700000-0xc07fffff]
[    0.647503] pci 0000:00:02.2: PME# supported from D0 D3hot D3cold
[    0.647550] pci 0000:00:03.0: [1022:14da] type 00 class 0x060000
conventional PCI endpoint
[    0.647590] pci 0000:00:03.1: [1022:14db] type 01 class 0x060400 PCIe
Root Port
[    0.647605] pci 0000:00:03.1: PCI bridge to [bus 0a]
[    0.647610] pci 0000:00:03.1:   bridge window [mem
0xc0600000-0xc06fffff]
[    0.647658] pci 0000:00:03.1: PME# supported from D0 D3hot D3cold
[    0.647699] pci 0000:00:03.2: [1022:14db] type 01 class 0x060400 PCIe
Root Port
[    0.647715] pci 0000:00:03.2: PCI bridge to [bus 0b]
[    0.647718] pci 0000:00:03.2:   bridge window [io  0x1000-0x1fff]
[    0.647720] pci 0000:00:03.2:   bridge window [mem
0xc0500000-0xc05fffff]
[    0.647768] pci 0000:00:03.2: PME# supported from D0 D3hot D3cold
[    0.647814] pci 0000:00:04.0: [1022:14da] type 00 class 0x060000
conventional PCI endpoint
[    0.647865] pci 0000:00:08.0: [1022:14da] type 00 class 0x060000
conventional PCI endpoint
[    0.647908] pci 0000:00:08.1: [1022:14dd] type 01 class 0x060400 PCIe
Root Port
[    0.647921] pci 0000:00:08.1: PCI bridge to [bus 0c]
[    0.647925] pci 0000:00:08.1:   bridge window [mem
0xc0100000-0xc04fffff]
[    0.647934] pci 0000:00:08.1: enabling Extended Tags
[    0.647953] pci 0000:00:08.1: PME# supported from D0 D3hot D3cold
[    0.647998] pci 0000:00:08.3: [1022:14dd] type 01 class 0x060400 PCIe
Root Port
[    0.648011] pci 0000:00:08.3: PCI bridge to [bus 0d]
[    0.648015] pci 0000:00:08.3:   bridge window [mem
0xc0000000-0xc00fffff]
[    0.648024] pci 0000:00:08.3: enabling Extended Tags
[    0.648043] pci 0000:00:08.3: PME# supported from D0 D3hot D3cold
[    0.648094] pci 0000:00:14.0: [1022:790b] type 00 class 0x0c0500
conventional PCI endpoint
[    0.648184] pci 0000:00:14.3: [1022:790e] type 00 class 0x060100
conventional PCI endpoint
[    0.648282] pci 0000:00:18.0: [1022:14e0] type 00 class 0x060000
conventional PCI endpoint
[    0.648302] pci 0000:00:18.1: [1022:14e1] type 00 class 0x060000
conventional PCI endpoint
[    0.648320] pci 0000:00:18.2: [1022:14e2] type 00 class 0x060000
conventional PCI endpoint
[    0.648338] pci 0000:00:18.3: [1022:14e3] type 00 class 0x060000
conventional PCI endpoint
[    0.648357] pci 0000:00:18.4: [1022:14e4] type 00 class 0x060000
conventional PCI endpoint
[    0.648375] pci 0000:00:18.5: [1022:14e5] type 00 class 0x060000
conventional PCI endpoint
[    0.648394] pci 0000:00:18.6: [1022:14e6] type 00 class 0x060000
conventional PCI endpoint
[    0.648413] pci 0000:00:18.7: [1022:14e7] type 00 class 0x060000
conventional PCI endpoint
[    0.648507] pci 0000:01:00.0: [1002:1478] type 01 class 0x060400 PCIe
Switch Upstream Port
[    0.648520] pci 0000:01:00.0: BAR 0 [mem 0xc1000000-0xc1003fff]
[    0.648535] pci 0000:01:00.0: PCI bridge to [bus 02-03]
[    0.648540] pci 0000:01:00.0:   bridge window [io  0x2000-0x2fff]
[    0.648543] pci 0000:01:00.0:   bridge window [mem
0xc0e00000-0xc0ffffff]
[    0.648552] pci 0000:01:00.0:   bridge window [mem
0xffc00000000-0xffe0fffffff 64bit pref]
[    0.648600] pci 0000:01:00.0: PME# supported from D0 D3hot D3cold
[    0.648650] pci 0000:00:01.1: PCI bridge to [bus 01-03]
[    0.648709] pci 0000:02:00.0: [1002:1479] type 01 class 0x060400 PCIe
Switch Downstream Port
[    0.648735] pci 0000:02:00.0: PCI bridge to [bus 03]
[    0.648740] pci 0000:02:00.0:   bridge window [io  0x2000-0x2fff]
[    0.648743] pci 0000:02:00.0:   bridge window [mem
0xc0e00000-0xc0ffffff]
[    0.648752] pci 0000:02:00.0:   bridge window [mem
0xffc00000000-0xffe0fffffff 64bit pref]
[    0.648801] pci 0000:02:00.0: PME# supported from D0 D3hot D3cold
[    0.648935] pci 0000:01:00.0: PCI bridge to [bus 02-03]
[    0.648999] pci 0000:03:00.0: [1002:7480] type 00 class 0x030000 PCIe
Legacy Endpoint
[    0.649015] pci 0000:03:00.0: BAR 0 [mem 0xffc00000000-0xffdffffffff
64bit pref]
[    0.649027] pci 0000:03:00.0: BAR 2 [mem 0xffe00000000-0xffe0fffffff
64bit pref]
[    0.649034] pci 0000:03:00.0: BAR 4 [io  0x2000-0x20ff]
[    0.649041] pci 0000:03:00.0: BAR 5 [mem 0xc0e00000-0xc0efffff]
[    0.649049] pci 0000:03:00.0: ROM [mem 0xfffe0000-0xffffffff pref]
[    0.649094] pci 0000:03:00.0: PME# supported from D1 D2 D3hot D3cold
[    0.649154] pci 0000:03:00.1: [1002:ab30] type 00 class 0x040300 PCIe
Legacy Endpoint
[    0.649167] pci 0000:03:00.1: BAR 0 [mem 0xc0f00000-0xc0f03fff]
[    0.649250] pci 0000:03:00.1: PME# supported from D1 D2 D3hot D3cold
[    0.649307] pci 0000:02:00.0: PCI bridge to [bus 03]
[    0.649609] pci 0000:04:00.0: [144d:a80a] type 00 class 0x010802 PCIe
Endpoint
[    0.649624] pci 0000:04:00.0: BAR 0 [mem 0xc0d00000-0xc0d03fff 64bit]
[    0.649727] pci 0000:00:01.2: PCI bridge to [bus 04]
[    0.649945] pci 0000:05:00.0: [144d:a808] type 00 class 0x010802 PCIe
Endpoint
[    0.649962] pci 0000:05:00.0: BAR 0 [mem 0xc0c00000-0xc0c03fff 64bit]
[    0.650070] pci 0000:00:01.3: PCI bridge to [bus 05]
[    0.650167] pci 0000:06:00.0: [1b21:242a] type 01 class 0x060400 PCIe
Switch Upstream Port
[    0.650193] pci 0000:06:00.0: PCI bridge to [bus 07-08]
[    0.650200] pci 0000:06:00.0:   bridge window [mem
0xc0800000-0xc0bfffff]
[    0.650254] pci 0000:06:00.0: PME# supported from D0 D3hot D3cold
[    0.650268] pci 0000:06:00.0: 31.504 Gb/s available PCIe bandwidth,
limited by 8.0 GT/s PCIe x4 link at 0000:00:
02.1 (capable of 63.012 Gb/s with 16.0 GT/s PCIe x4 link)
[    0.650305] pci 0000:00:02.1: PCI bridge to [bus 06-08]
[    0.650412] pci 0000:07:02.0: [1b21:242b] type 01 class 0x060400 PCIe
Switch Downstream Port
[    0.650438] pci 0000:07:02.0: PCI bridge to [bus 08]
[    0.650443] pci 0000:07:02.0:   bridge window [mem
0xc0800000-0xc0bfffff]
[    0.650497] pci 0000:07:02.0: PME# supported from D0 D3hot D3cold
[    0.650556] pci 0000:06:00.0: PCI bridge to [bus 07-08]
[    0.650628] pci 0000:08:00.0: [1b21:242c] type 00 class 0x0c0330 PCIe
Legacy Endpoint
[    0.650644] pci 0000:08:00.0: BAR 0 [mem 0xc0800000-0xc0807fff 64bit]
[    0.650716] pci 0000:08:00.0: PME# supported from D0 D3hot D3cold
[    0.650766] pci 0000:07:02.0: PCI bridge to [bus 08]
[    0.650977] pci 0000:09:00.0: [8086:2725] type 00 class 0x028000 PCIe
Endpoint
[    0.651138] pci 0000:09:00.0: BAR 0 [mem 0xc0700000-0xc0703fff 64bit]
[    0.651513] pci 0000:09:00.0: PME# supported from D0 D3hot D3cold
[    0.652167] pci 0000:00:02.2: PCI bridge to [bus 09]
[    0.652252] pci 0000:0a:00.0: [10ec:525a] type 00 class 0xff0000 PCIe
Endpoint
[    0.652273] pci 0000:0a:00.0: BAR 1 [mem 0xc0600000-0xc0600fff]
[    0.652350] pci 0000:0a:00.0: supports D1 D2
[    0.652351] pci 0000:0a:00.0: PME# supported from D1 D2 D3hot D3cold
[    0.652392] pci 0000:00:03.1: PCI bridge to [bus 0a]
[    0.652482] pci 0000:0b:00.0: [10ec:8125] type 00 class 0x020000 PCIe
Endpoint
[    0.652498] pci 0000:0b:00.0: BAR 0 [io  0x1000-0x10ff]
[    0.652518] pci 0000:0b:00.0: BAR 2 [mem 0xc0500000-0xc050ffff 64bit]
[    0.652530] pci 0000:0b:00.0: BAR 4 [mem 0xc0510000-0xc0513fff 64bit]
[    0.652716] pci 0000:0b:00.0: supports D1 D2
[    0.652717] pci 0000:0b:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.652769] pci 0000:00:03.2: PCI bridge to [bus 0b]
[    0.652839] pci 0000:0c:00.0: [1022:14de] type 00 class 0x130000 PCIe
Legacy Endpoint
[    0.652875] pci 0000:0c:00.0: enabling Extended Tags
[    0.652935] pci 0000:0c:00.2: [1022:1649] type 00 class 0x108000 PCIe
Endpoint
[    0.653157] pci 0000:0c:00.2: BAR 2 [mem 0xc0300000-0xc03fffff]
[    0.653306] pci 0000:0c:00.2: BAR 5 [mem 0xc0448000-0xc0449fff]
[    0.653362] pci 0000:0c:00.2: enabling Extended Tags
[    0.653426] pci 0000:0c:00.3: [1022:15b6] type 00 class 0x0c0330 PCIe
Endpoint
[    0.653437] pci 0000:0c:00.3: BAR 0 [mem 0xc0100000-0xc01fffff 64bit]
[    0.653461] pci 0000:0c:00.3: enabling Extended Tags
[    0.653488] pci 0000:0c:00.3: PME# supported from D0 D3hot D3cold
[    0.653529] pci 0000:0c:00.4: [1022:15b7] type 00 class 0x0c0330 PCIe
Endpoint
[    0.653540] pci 0000:0c:00.4: BAR 0 [mem 0xc0200000-0xc02fffff 64bit]
[    0.653564] pci 0000:0c:00.4: enabling Extended Tags
[    0.653591] pci 0000:0c:00.4: PME# supported from D0 D3hot D3cold
[    0.653634] pci 0000:0c:00.5: [1022:15e2] type 00 class 0x048000 PCIe
Endpoint
[    0.653642] pci 0000:0c:00.5: BAR 0 [mem 0xc0400000-0xc043ffff]
[    0.653671] pci 0000:0c:00.5: enabling Extended Tags
[    0.653695] pci 0000:0c:00.5: PME# supported from D0 D3hot D3cold
[    0.653738] pci 0000:0c:00.6: [1022:15e3] type 00 class 0x040300 PCIe
Endpoint
[    0.653746] pci 0000:0c:00.6: BAR 0 [mem 0xc0440000-0xc0447fff]
[    0.653775] pci 0000:0c:00.6: enabling Extended Tags
[    0.653800] pci 0000:0c:00.6: PME# supported from D0 D3hot D3cold
[    0.653853] pci 0000:00:08.1: PCI bridge to [bus 0c]
[    0.653891] pci 0000:0d:00.0: [1022:15b8] type 00 class 0x0c0330 PCIe
Endpoint
[    0.653905] pci 0000:0d:00.0: BAR 0 [mem 0xc0000000-0xc00fffff 64bit]
[    0.653934] pci 0000:0d:00.0: enabling Extended Tags
[    0.653961] pci 0000:0d:00.0: PME# supported from D0 D3hot D3cold
[    0.654000] pci 0000:00:08.3: PCI bridge to [bus 0d]
[    0.658129] Low-power S0 idle used by default for system suspend
[    0.870783] ACPI: EC: interrupt unblocked
[    0.870785] ACPI: EC: event unblocked
[    0.870797] ACPI: EC: EC_CMD/EC_SC=0x66, EC_DATA=0x62
[    0.870798] ACPI: EC: GPE=0x9
[    0.870800] ACPI: \_SB_.PCI0.LPC0.EC__: Boot DSDT EC initialization
complete
[    0.870801] ACPI: \_SB_.PCI0.LPC0.EC__: EC: Used to handle transactions
and events
[    0.870843] iommu: Default domain type: Translated
[    0.870843] iommu: DMA domain TLB invalidation policy: lazy mode
[    0.870843] SCSI subsystem initialized
[    0.870843] libata version 3.00 loaded.
[    0.870843] ACPI: bus type USB registered
[    0.870843] usbcore: registered new interface driver usbfs
[    0.870843] usbcore: registered new interface driver hub
[    0.870843] usbcore: registered new device driver usb
[    1.095217] pps_core: LinuxPPS API ver. 1 registered
[    1.095219] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo
Giometti <giometti@linux.it>
[    1.095222] PTP clock support registered
[    1.095232] EDAC MC: Ver: 3.0.0
[    1.095843] efivars: Registered efivars operations
[    1.095843] NetLabel: Initializing
[    1.095843] NetLabel:  domain hash size = 128
[    1.095843] NetLabel:  protocols = UNLABELED CIPSOv4 CALIPSO
[    1.095843] NetLabel:  unlabeled traffic allowed by default
[    1.095843] mctp: management component transport protocol core
[    1.095843] NET: Registered PF_MCTP protocol family
[    1.095843] PCI: Using ACPI for IRQ routing
[    1.095843] PCI: pci_cache_line_size set to 64 bytes
[    1.096973] e820: reserve RAM buffer [mem 0x0009f000-0x0009ffff]
[    1.096974] e820: reserve RAM buffer [mem 0x09b00000-0x0bffffff]
[    1.096974] e820: reserve RAM buffer [mem 0x09f00000-0x0bffffff]
[    1.096975] e820: reserve RAM buffer [mem 0xa0297018-0xa3ffffff]
[    1.096975] e820: reserve RAM buffer [mem 0xa235c000-0xa3ffffff]
[    1.096976] e820: reserve RAM buffer [mem 0xa456b000-0xa7ffffff]
[    1.096976] e820: reserve RAM buffer [mem 0xa6e4f000-0xa7ffffff]
[    1.096976] e820: reserve RAM buffer [mem 0xad5e4000-0xafffffff]
[    1.096977] e820: reserve RAM buffer [mem 0xb077f000-0xb3ffffff]
[    1.096977] e820: reserve RAM buffer [mem 0xbb000000-0xbbffffff]
[    1.096977] e820: reserve RAM buffer [mem 0x103de80000-0x103fffffff]
[    1.096991] pci 0000:03:00.0: vgaarb: setting as boot VGA device
[    1.096991] pci 0000:03:00.0: vgaarb: bridge control possible
[    1.096991] pci 0000:03:00.0: vgaarb: VGA device added:
decodes=io+mem,owns=none,locks=none
[    1.096991] vgaarb: loaded
[    1.096991] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0
[    1.096991] hpet0: 3 comparators, 32-bit 14.318180 MHz counter
[    1.098731] clocksource: Switched to clocksource tsc-early
[    1.098794] VFS: Disk quotas dquot_6.6.0
[    1.098799] VFS: Dquot-cache hash table entries: 512 (order 0, 4096
bytes)
[    1.098829] pnp: PnP ACPI init
[    1.098861] system 00:00: [mem 0xf0000000-0xffffffff] could not be
reserved
[    1.099022] system 00:01: [mem 0xfec00000-0xfec01fff] could not be
reserved
[    1.099024] system 00:01: [mem 0xfee00000-0xfee00fff] has been reserved
[    1.099025] system 00:01: [mem 0xe0200000-0xe02fffff] has been reserved
[    1.099289] system 00:03: [io  0x0400-0x04cf] has been reserved
[    1.099291] system 00:03: [io  0x04d0-0x04d1] has been reserved
[    1.099292] system 00:03: [io  0x04d6] has been reserved
[    1.099293] system 00:03: [io  0x0c00-0x0c01] has been reserved
[    1.099294] system 00:03: [io  0x0c14] has been reserved
[    1.099295] system 00:03: [io  0x0c50-0x0c52] has been reserved
[    1.099296] system 00:03: [io  0x0c6c] has been reserved
[    1.099296] system 00:03: [io  0x0c6f] has been reserved
[    1.099297] system 00:03: [io  0x0cd0-0x0cdb] has been reserved
[    1.099307] system 00:04: [mem 0xff000000-0xffffffff] has been reserved
[    1.099316] ACPI: IRQ 1 override to edge, low(!)
[    1.207658] pnp: PnP ACPI: found 6 devices
[    1.213317] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff,
max_idle_ns: 2085701024 ns
[    1.213353] NET: Registered PF_INET protocol family
[    1.213503] IP idents hash table entries: 262144 (order: 9, 2097152
bytes, linear)
[    1.220695] tcp_listen_portaddr_hash hash table entries: 32768 (order:
7, 524288 bytes, linear)
[    1.220719] Table-perturb hash table entries: 65536 (order: 6, 262144
bytes, linear)
[    1.220724] TCP established hash table entries: 524288 (order: 10,
4194304 bytes, linear)
[    1.220949] TCP bind hash table entries: 65536 (order: 9, 2097152 bytes,
linear)
[    1.221044] TCP: Hash tables configured (established 524288 bind 65536)
[    1.221160] MPTCP token hash table entries: 65536 (order: 8, 1572864
bytes, linear)
[    1.221198] UDP hash table entries: 32768 (order: 8, 1048576 bytes,
linear)
[    1.221244] UDP-Lite hash table entries: 32768 (order: 8, 1048576 bytes,
linear)
[    1.221317] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    1.221322] NET: Registered PF_XDP protocol family
[    1.221325] pci 0000:03:00.0: ROM [mem 0xfffe0000-0xffffffff pref]:
can't claim; no compatible bridge window
[    1.221329] pci 0000:00:02.1: bridge window [io  0x1000-0x0fff] to [bus
06-08] add_size 1000
[    1.221330] pci 0000:00:02.1: bridge window [mem 0x00100000-0x000fffff
64bit pref] to [bus 06-08] add_size 20000
0 add_align 100000
[    1.221337] pci 0000:00:02.1: bridge window [mem
0x10020200000-0x100203fffff 64bit pref]: assigned
[    1.221339] pci 0000:00:02.1: bridge window [io  0x3000-0x3fff]:
assigned
[    1.221341] pci 0000:03:00.0: ROM [mem 0xc0f20000-0xc0f3ffff pref]:
assigned
[    1.221342] pci 0000:02:00.0: PCI bridge to [bus 03]
[    1.221348] pci 0000:02:00.0:   bridge window [io  0x2000-0x2fff]
[    1.221352] pci 0000:02:00.0:   bridge window [mem
0xc0e00000-0xc0ffffff]
[    1.221355] pci 0000:02:00.0:   bridge window [mem
0xffc00000000-0xffe0fffffff 64bit pref]
[    1.221360] pci 0000:01:00.0: PCI bridge to [bus 02-03]
[    1.221362] pci 0000:01:00.0:   bridge window [io  0x2000-0x2fff]
[    1.221365] pci 0000:01:00.0:   bridge window [mem
0xc0e00000-0xc0ffffff]
[    1.221368] pci 0000:01:00.0:   bridge window [mem
0xffc00000000-0xffe0fffffff 64bit pref]
[    1.221373] pci 0000:00:01.1: PCI bridge to [bus 01-03]
[    1.221374] pci 0000:00:01.1:   bridge window [io  0x2000-0x2fff]
[    1.221377] pci 0000:00:01.1:   bridge window [mem
0xc0e00000-0xc10fffff]
[    1.221379] pci 0000:00:01.1:   bridge window [mem
0xffc00000000-0xffe0fffffff 64bit pref]
[    1.221396] pci 0000:00:01.2: PCI bridge to [bus 04]
[    1.221398] pci 0000:00:01.2:   bridge window [mem
0xc0d00000-0xc0dfffff]
[    1.221417] pci 0000:00:01.3: PCI bridge to [bus 05]
[    1.221419] pci 0000:00:01.3:   bridge window [mem
0xc0c00000-0xc0cfffff]
[    1.221438] pci 0000:07:02.0: PCI bridge to [bus 08]
[    1.221446] pci 0000:07:02.0:   bridge window [mem
0xc0800000-0xc0bfffff]
[    1.221452] pci 0000:06:00.0: PCI bridge to [bus 07-08]
[    1.221455] pci 0000:06:00.0:   bridge window [mem
0xc0800000-0xc0bfffff]
[    1.221462] pci 0000:00:02.1: PCI bridge to [bus 06-08]
[    1.221463] pci 0000:00:02.1:   bridge window [io  0x3000-0x3fff]
[    1.221465] pci 0000:00:02.1:   bridge window [mem
0xc0800000-0xc0bfffff]
[    1.221467] pci 0000:00:02.1:   bridge window [mem
0x10020200000-0x100203fffff 64bit pref]
[    1.221485] pci 0000:00:02.2: PCI bridge to [bus 09]
[    1.221487] pci 0000:00:02.2:   bridge window [mem
0xc0700000-0xc07fffff]
[    1.221505] pci 0000:00:03.1: PCI bridge to [bus 0a]
[    1.221507] pci 0000:00:03.1:   bridge window [mem
0xc0600000-0xc06fffff]
[    1.221526] pci 0000:00:03.2: PCI bridge to [bus 0b]
[    1.221527] pci 0000:00:03.2:   bridge window [io  0x1000-0x1fff]
[    1.221529] pci 0000:00:03.2:   bridge window [mem
0xc0500000-0xc05fffff]
[    1.221548] pci 0000:00:08.1: PCI bridge to [bus 0c]
[    1.221554] pci 0000:00:08.1:   bridge window [mem
0xc0100000-0xc04fffff]
[    1.221558] pci 0000:00:08.3: PCI bridge to [bus 0d]
[    1.221560] pci 0000:00:08.3:   bridge window [mem
0xc0000000-0xc00fffff]
[    1.221564] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
[    1.221565] pci_bus 0000:00: resource 5 [io  0x0d00-0xffff window]
[    1.221566] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff
window]
[    1.221567] pci_bus 0000:00: resource 7 [mem 0x000c0000-0x000cffff
window]
[    1.221568] pci_bus 0000:00: resource 8 [mem 0x000d0000-0x000effff
window]
[    1.221569] pci_bus 0000:00: resource 9 [mem 0xc0000000-0xc11fffff
window]
[    1.221570] pci_bus 0000:00: resource 10 [mem 0xf8000000-0xfe000000
window]
[    1.221571] pci_bus 0000:00: resource 11 [mem 0xfed45000-0xfed814ff
window]
[    1.221572] pci_bus 0000:00: resource 12 [mem 0xfed81900-0xfed81fff
window]
[    1.221573] pci_bus 0000:00: resource 13 [mem 0xfedc0000-0xfedc0fff
window]
[    1.221573] pci_bus 0000:00: resource 14 [mem 0xfedc6000-0xfedc6fff
window]
[    1.221574] pci_bus 0000:00: resource 15 [mem
0x10020200000-0xfffffffffff window]
[    1.221576] pci_bus 0000:01: resource 0 [io  0x2000-0x2fff]
[    1.221576] pci_bus 0000:01: resource 1 [mem 0xc0e00000-0xc10fffff]
[    1.221577] pci_bus 0000:01: resource 2 [mem 0xffc00000000-0xffe0fffffff
64bit pref]
[    1.221579] pci_bus 0000:02: resource 0 [io  0x2000-0x2fff]
[    1.221579] pci_bus 0000:02: resource 1 [mem 0xc0e00000-0xc0ffffff]
[    1.221580] pci_bus 0000:02: resource 2 [mem 0xffc00000000-0xffe0fffffff
64bit pref]
[    1.221581] pci_bus 0000:03: resource 0 [io  0x2000-0x2fff]
[    1.221582] pci_bus 0000:03: resource 1 [mem 0xc0e00000-0xc0ffffff]
[    1.221583] pci_bus 0000:03: resource 2 [mem 0xffc00000000-0xffe0fffffff
64bit pref]
[    1.221584] pci_bus 0000:04: resource 1 [mem 0xc0d00000-0xc0dfffff]
[    1.221585] pci_bus 0000:05: resource 1 [mem 0xc0c00000-0xc0cfffff]
[    1.221586] pci_bus 0000:06: resource 0 [io  0x3000-0x3fff]
[    1.221587] pci_bus 0000:06: resource 1 [mem 0xc0800000-0xc0bfffff]
[    1.221588] pci_bus 0000:06: resource 2 [mem 0x10020200000-0x100203fffff
64bit pref]
[    1.221589] pci_bus 0000:07: resource 1 [mem 0xc0800000-0xc0bfffff]
[    1.221590] pci_bus 0000:08: resource 1 [mem 0xc0800000-0xc0bfffff]
[    1.221591] pci_bus 0000:09: resource 1 [mem 0xc0700000-0xc07fffff]
[    1.221591] pci_bus 0000:0a: resource 1 [mem 0xc0600000-0xc06fffff]
[    1.221592] pci_bus 0000:0b: resource 0 [io  0x1000-0x1fff]
[    1.221593] pci_bus 0000:0b: resource 1 [mem 0xc0500000-0xc05fffff]
[    1.221594] pci_bus 0000:0c: resource 1 [mem 0xc0100000-0xc04fffff]
[    1.221595] pci_bus 0000:0d: resource 1 [mem 0xc0000000-0xc00fffff]
[    1.221651] pci 0000:03:00.1: D0 power state depends on 0000:03:00.0
[    1.222332] PCI: CLS 64 bytes, default 64
[    1.222339] pci 0000:00:00.2: AMD-Vi: IOMMU performance counters
supported
[    1.222356] Trying to unpack rootfs image as initramfs...
[    1.222361] pci 0000:00:01.0: Adding to iommu group 0
[    1.222365] pci 0000:00:01.1: Adding to iommu group 0
[    1.222368] pci 0000:00:01.2: Adding to iommu group 0
[    1.222372] pci 0000:00:01.3: Adding to iommu group 0
[    1.222381] pci 0000:00:02.0: Adding to iommu group 1
[    1.222385] pci 0000:00:02.1: Adding to iommu group 1
[    1.222389] pci 0000:00:02.2: Adding to iommu group 1
[    1.222397] pci 0000:00:03.0: Adding to iommu group 2
[    1.222401] pci 0000:00:03.1: Adding to iommu group 2
[    1.222405] pci 0000:00:03.2: Adding to iommu group 2
[    1.222410] pci 0000:00:04.0: Adding to iommu group 3
[    1.222419] pci 0000:00:08.0: Adding to iommu group 4
[    1.222423] pci 0000:00:08.1: Adding to iommu group 4
[    1.222427] pci 0000:00:08.3: Adding to iommu group 4
[    1.222434] pci 0000:00:14.0: Adding to iommu group 5
[    1.222438] pci 0000:00:14.3: Adding to iommu group 5
[    1.222454] pci 0000:00:18.0: Adding to iommu group 6
[    1.222458] pci 0000:00:18.1: Adding to iommu group 6
[    1.222462] pci 0000:00:18.2: Adding to iommu group 6
[    1.222466] pci 0000:00:18.3: Adding to iommu group 6
[    1.222470] pci 0000:00:18.4: Adding to iommu group 6
[    1.222474] pci 0000:00:18.5: Adding to iommu group 6
[    1.222478] pci 0000:00:18.6: Adding to iommu group 6
[    1.222483] pci 0000:00:18.7: Adding to iommu group 6
[    1.222486] pci 0000:01:00.0: Adding to iommu group 0
[    1.222488] pci 0000:02:00.0: Adding to iommu group 0
[    1.222491] pci 0000:03:00.0: Adding to iommu group 0
[    1.222493] pci 0000:03:00.1: Adding to iommu group 0
[    1.222495] pci 0000:04:00.0: Adding to iommu group 0
[    1.222498] pci 0000:05:00.0: Adding to iommu group 0
[    1.222500] pci 0000:06:00.0: Adding to iommu group 1
[    1.222503] pci 0000:07:02.0: Adding to iommu group 1
[    1.222506] pci 0000:08:00.0: Adding to iommu group 1
[    1.222509] pci 0000:09:00.0: Adding to iommu group 1
[    1.222511] pci 0000:0a:00.0: Adding to iommu group 2
[    1.222514] pci 0000:0b:00.0: Adding to iommu group 2
[    1.222517] pci 0000:0c:00.0: Adding to iommu group 4
[    1.222519] pci 0000:0c:00.2: Adding to iommu group 4
[    1.222522] pci 0000:0c:00.3: Adding to iommu group 4
[    1.222523] pci 0000:0c:00.4: Adding to iommu group 4
[    1.222526] pci 0000:0c:00.5: Adding to iommu group 4
[    1.222528] pci 0000:0c:00.6: Adding to iommu group 4
[    1.222532] pci 0000:0d:00.0: Adding to iommu group 4
[    1.223051] AMD-Vi: Extended features (0x246577efa2254afa, 0x0): PPR NX
GT [5] IA GA PC GA_vAPIC
[    1.223056] AMD-Vi: Interrupt remapping enabled
[    1.647647] AMD-Vi: Virtual APIC enabled
[    1.647653] PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
[    1.647654] software IO TLB: mapped [mem
0x00000000a95e4000-0x00000000ad5e4000] (64MB)
[    1.647681] LVT offset 0 assigned for vector 0x400
[    1.649712] perf: AMD IBS detected (0x00000bff)
[    1.649905] amd_uncore: 16 amd_df counters detected
[    1.649912] amd_uncore: 6 amd_l3 counters detected
[    1.649917] amd_uncore: 4 amd_umc_0 counters detected
[    1.649919] amd_uncore: 4 amd_umc_1 counters detected
[    1.650079] perf/amd_iommu: Detected AMD IOMMU #0 (2 banks, 4
counters/bank).
[    1.651314] Initialise system trusted keyrings
[    1.651321] Key type blacklist registered
[    1.651336] workingset: timestamp_bits=36 max_order=24 bucket_order=0
[    1.651347] zbud: loaded
[    1.651490] integrity: Platform Keyring initialized
[    1.651492] integrity: Machine keyring initialized
[    1.656314] NET: Registered PF_ALG protocol family
[    1.656316] xor: automatically using best checksumming function   avx

[    1.656318] Key type asymmetric registered
[    1.656319] Asymmetric key parser 'x509' registered
[    2.663629] tsc: Refined TSC clocksource calibration: 2994.361 MHz
[    2.663637] clocksource: tsc: mask: 0xffffffffffffffff max_cycles:
0x2b29764272c, max_idle_ns: 440795213275 ns
[    2.663737] clocksource: Switched to clocksource tsc
[    2.952105] Freeing initrd memory: 282984K
[    2.953955] Block layer SCSI generic (bsg) driver version 0.4 loaded
(major 245)
[    2.953984] io scheduler mq-deadline registered
[    2.953986] io scheduler kyber registered
[    2.953991] io scheduler bfq registered
[    2.954857] atomic64_test: passed for x86-64 platform with CX8 and with
SSE
[    2.955869] pcieport 0000:00:01.1: PME: Signaling with IRQ 35
[    2.955880] pcieport 0000:00:01.1: pciehp: Slot #0 AttnBtn- PwrCtrl-
MRL- AttnInd- PwrInd- HotPlug+ Surprise+ In
terlock- NoCompl+ IbPresDis- LLActRep+
[    2.955992] pcieport 0000:00:01.2: PME: Signaling with IRQ 36
[    2.956062] pcieport 0000:00:01.3: PME: Signaling with IRQ 37
[    2.956126] pcieport 0000:00:02.1: PME: Signaling with IRQ 38
[    2.956134] pcieport 0000:00:02.1: pciehp: Slot #0 AttnBtn- PwrCtrl-
MRL- AttnInd- PwrInd- HotPlug+ Surprise+ In
terlock- NoCompl+ IbPresDis- LLActRep+
[    2.956296] pcieport 0000:00:02.2: PME: Signaling with IRQ 39
[    2.956359] pcieport 0000:00:03.1: PME: Signaling with IRQ 40
[    2.956429] pcieport 0000:00:03.2: PME: Signaling with IRQ 41
[    2.956492] pcieport 0000:00:08.1: PME: Signaling with IRQ 42
[    2.956554] pcieport 0000:00:08.3: PME: Signaling with IRQ 43
[    2.956760] shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
[    2.960877] ACPI: AC: AC Adapter [AC] (on-line)
[    2.960905] input: Power Button as
/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input0
[    2.960917] ACPI: button: Power Button [PWRB]
[    2.960935] input: Lid Switch as
/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0D:00/input/input1
[    2.960957] ACPI: button: Lid Switch [LID]
[    2.960975] input: Sleep Button as
/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0E:00/input/input2
[    2.960987] ACPI: button: Sleep Button [SBTN]
[    2.961039] Estimated ratio of average max frequency by base frequency
(times 1024): 1416
[    2.961049] Monitor-Mwait will be used to enter C-1 state
[    2.961052] ACPI: \_SB_.PLTF.C000: Found 3 idle states
[    2.961115] ACPI: \_SB_.PLTF.C001: Found 3 idle states
[    2.961167] ACPI: \_SB_.PLTF.C002: Found 3 idle states
[    2.961216] ACPI: \_SB_.PLTF.C003: Found 3 idle states
[    2.961265] ACPI: \_SB_.PLTF.C004: Found 3 idle states
[    2.961316] ACPI: \_SB_.PLTF.C005: Found 3 idle states
[    2.961366] ACPI: \_SB_.PLTF.C006: Found 3 idle states
[    2.961416] ACPI: \_SB_.PLTF.C007: Found 3 idle states
[    2.961463] ACPI: \_SB_.PLTF.C008: Found 3 idle states
[    2.961512] ACPI: \_SB_.PLTF.C009: Found 3 idle states
[    2.961560] ACPI: \_SB_.PLTF.C00A: Found 3 idle states
[    2.961607] ACPI: \_SB_.PLTF.C00B: Found 3 idle states
[    2.961662] ACPI: \_SB_.PLTF.C00C: Found 3 idle states
[    2.961715] ACPI: \_SB_.PLTF.C00D: Found 3 idle states
[    2.961764] ACPI: \_SB_.PLTF.C00E: Found 3 idle states
[    2.961807] ACPI: \_SB_.PLTF.C00F: Found 3 idle states
[    2.961854] ACPI: \_SB_.PLTF.C010: Found 3 idle states
[    2.961897] ACPI: \_SB_.PLTF.C011: Found 3 idle states
[    2.961942] ACPI: \_SB_.PLTF.C012: Found 3 idle states
[    2.961982] ACPI: \_SB_.PLTF.C013: Found 3 idle states
[    2.962022] ACPI: \_SB_.PLTF.C014: Found 3 idle states
[    2.962062] ACPI: \_SB_.PLTF.C015: Found 3 idle states
[    2.962105] ACPI: \_SB_.PLTF.C016: Found 3 idle states
[    2.962145] ACPI: \_SB_.PLTF.C017: Found 3 idle states
[    2.989733] thermal LNXTHERM:00: registered as thermal_zone0
[    2.989737] ACPI: thermal: Thermal Zone [THM] (56 C)
[    2.989821] Serial: 8250/16550 driver, 32 ports, IRQ sharing enabled
[    2.990860] Non-volatile memory driver v1.3
[    2.990864] Linux agpgart interface v0.103
[    3.004851] ACPI: battery: Slot [BAT0] (battery present)
[    3.011626] tpm_crb MSFT0101:00: Disabling hwrng
[    3.011737] ACPI: bus type drm_connector registered
[    3.012739] xhci_hcd 0000:08:00.0: xHCI Host Controller
[    3.012759] xhci_hcd 0000:08:00.0: new USB bus registered, assigned bus
number 1
[    3.015374] xhci_hcd 0000:08:00.0: hcc params 0x0200ef81 hci version
0x120 quirks 0x0000000200000010
[    3.015587] xhci_hcd 0000:08:00.0: xHCI Host Controller
[    3.015602] xhci_hcd 0000:08:00.0: new USB bus registered, assigned bus
number 2
[    3.015603] xhci_hcd 0000:08:00.0: Host supports USB 3.2 Enhanced
SuperSpeed
[    3.015638] usb usb1: New USB device found, idVendor=1d6b,
idProduct=0002, bcdDevice= 6.09
[    3.015640] usb usb1: New USB device strings: Mfr=3, Product=2,
SerialNumber=1
[    3.015641] usb usb1: Product: xHCI Host Controller
[    3.015642] usb usb1: Manufacturer: Linux 6.9.0-RX7600XT xhci-hcd
[    3.015643] usb usb1: SerialNumber: 0000:08:00.0
[    3.015685] hub 1-0:1.0: USB hub found
[    3.015689] hub 1-0:1.0: 2 ports detected
[    3.015775] usb usb2: We don't know the algorithms for LPM for this
host, disabling LPM.
[    3.015782] usb usb2: New USB device found, idVendor=1d6b,
idProduct=0003, bcdDevice= 6.09
[    3.015784] usb usb2: New USB device strings: Mfr=3, Product=2,
SerialNumber=1
[    3.015785] usb usb2: Product: xHCI Host Controller
[    3.015786] usb usb2: Manufacturer: Linux 6.9.0-RX7600XT xhci-hcd
[    3.015787] usb usb2: SerialNumber: 0000:08:00.0
[    3.015815] hub 2-0:1.0: USB hub found
[    3.015823] hub 2-0:1.0: 2 ports detected
[    3.015954] xhci_hcd 0000:0c:00.3: xHCI Host Controller
[    3.015969] xhci_hcd 0000:0c:00.3: new USB bus registered, assigned bus
number 3
[    3.016305] xhci_hcd 0000:0c:00.3: hcc params 0x0120ffc5 hci version
0x120 quirks 0x0000000200000410
[    3.016553] xhci_hcd 0000:0c:00.3: xHCI Host Controller
[    3.016566] xhci_hcd 0000:0c:00.3: new USB bus registered, assigned bus
number 4
[    3.016568] xhci_hcd 0000:0c:00.3: Host supports USB 3.1 Enhanced
SuperSpeed
[    3.016580] usb usb3: New USB device found, idVendor=1d6b,
idProduct=0002, bcdDevice= 6.09
[    3.016582] usb usb3: New USB device strings: Mfr=3, Product=2,
SerialNumber=1
[    3.016583] usb usb3: Product: xHCI Host Controller
[    3.016584] usb usb3: Manufacturer: Linux 6.9.0-RX7600XT xhci-hcd
[    3.016585] usb usb3: SerialNumber: 0000:0c:00.3
[    3.016615] hub 3-0:1.0: USB hub found
[    3.016625] hub 3-0:1.0: 2 ports detected
[    3.016741] usb usb4: We don't know the algorithms for LPM for this
host, disabling LPM.
[    3.016748] usb usb4: New USB device found, idVendor=1d6b,
idProduct=0003, bcdDevice= 6.09
[    3.016750] usb usb4: New USB device strings: Mfr=3, Product=2,
SerialNumber=1
[    3.016751] usb usb4: Product: xHCI Host Controller
[    3.016751] usb usb4: Manufacturer: Linux 6.9.0-RX7600XT xhci-hcd
[    3.016752] usb usb4: SerialNumber: 0000:0c:00.3
[    3.016779] hub 4-0:1.0: USB hub found
[    3.016786] hub 4-0:1.0: 2 ports detected
[    3.016965] xhci_hcd 0000:0c:00.4: xHCI Host Controller
[    3.016980] xhci_hcd 0000:0c:00.4: new USB bus registered, assigned bus
number 5
[    3.017328] xhci_hcd 0000:0c:00.4: hcc params 0x0120ffc5 hci version
0x120 quirks 0x0000000200000410
[    3.017545] xhci_hcd 0000:0c:00.4: xHCI Host Controller
[    3.017557] xhci_hcd 0000:0c:00.4: new USB bus registered, assigned bus
number 6
[    3.017559] xhci_hcd 0000:0c:00.4: Host supports USB 3.1 Enhanced
SuperSpeed
[    3.017570] usb usb5: New USB device found, idVendor=1d6b,
idProduct=0002, bcdDevice= 6.09
[    3.017572] usb usb5: New USB device strings: Mfr=3, Product=2,
SerialNumber=1
[    3.017573] usb usb5: Product: xHCI Host Controller
[    3.017573] usb usb5: Manufacturer: Linux 6.9.0-RX7600XT xhci-hcd
[    3.017574] usb usb5: SerialNumber: 0000:0c:00.4
[    3.017605] hub 5-0:1.0: USB hub found
[    3.017612] hub 5-0:1.0: 2 ports detected
[    3.017674] usb usb6: We don't know the algorithms for LPM for this
host, disabling LPM.
[    3.017680] usb usb6: New USB device found, idVendor=1d6b,
idProduct=0003, bcdDevice= 6.09
[    3.017681] usb usb6: New USB device strings: Mfr=3, Product=2,
SerialNumber=1
[    3.017683] usb usb6: Product: xHCI Host Controller
[    3.017683] usb usb6: Manufacturer: Linux 6.9.0-RX7600XT xhci-hcd
[    3.017684] usb usb6: SerialNumber: 0000:0c:00.4
[    3.017709] hub 6-0:1.0: USB hub found
[    3.017717] hub 6-0:1.0: 2 ports detected
[    3.017855] xhci_hcd 0000:0d:00.0: xHCI Host Controller
[    3.017872] xhci_hcd 0000:0d:00.0: new USB bus registered, assigned bus
number 7
[    3.019141] xhci_hcd 0000:0d:00.0: USB3 root hub has no ports
[    3.019144] xhci_hcd 0000:0d:00.0: hcc params 0x0110ffc5 hci version
0x120 quirks 0x0000000200000410
[    3.019369] xhci_hcd 0000:0d:00.0: xHCI Host Controller
[    3.019385] xhci_hcd 0000:0d:00.0: new USB bus registered, assigned bus
number 8
[    3.019387] xhci_hcd 0000:0d:00.0: Host supports USB 3.0 SuperSpeed
[    3.019402] usb usb7: New USB device found, idVendor=1d6b,
idProduct=0002, bcdDevice= 6.09
[    3.019404] usb usb7: New USB device strings: Mfr=3, Product=2,
SerialNumber=1
[    3.019405] usb usb7: Product: xHCI Host Controller
[    3.019406] usb usb7: Manufacturer: Linux 6.9.0-RX7600XT xhci-hcd
[    3.019407] usb usb7: SerialNumber: 0000:0d:00.0
[    3.019436] hub 7-0:1.0: USB hub found
[    3.019439] hub 7-0:1.0: 1 port detected
[    3.019473] usb usb8: We don't know the algorithms for LPM for this
host, disabling LPM.
[    3.019480] usb usb8: New USB device found, idVendor=1d6b,
idProduct=0003, bcdDevice= 6.09
[    3.019481] usb usb8: New USB device strings: Mfr=3, Product=2,
SerialNumber=1
[    3.019482] usb usb8: Product: xHCI Host Controller
[    3.019483] usb usb8: Manufacturer: Linux 6.9.0-RX7600XT xhci-hcd
[    3.019484] usb usb8: SerialNumber: 0000:0d:00.0
[    3.019509] hub 8-0:1.0: USB hub found
[    3.019511] hub 8-0:1.0: config failed, hub doesn't have any ports! (err
-19)
[    3.019588] usbcore: registered new interface driver usbserial_generic
[    3.019591] usbserial: USB Serial support registered for generic
[    3.019603] i8042: PNP: PS/2 Controller [PNP0303:PS2K] at 0x60,0x64 irq
1
[    3.019605] i8042: PNP: PS/2 appears to have AUX port disabled, if this
is incorrect please boot with i8042.nopn
p
[    3.022376] serio: i8042 KBD port at 0x60,0x64 irq 1
[    3.022407] mousedev: PS/2 mouse device common for all mice
[    3.023403] rtc_cmos 00:02: RTC can wake from S4
[    3.023565] rtc_cmos 00:02: registered as rtc0
[    3.023595] rtc_cmos 00:02: setting system clock to 2024-05-15T18:01:33
UTC (1715796093)
[    3.023611] rtc_cmos 00:02: alarms up to one month, 114 bytes nvram
[    3.023618] device-mapper: core: CONFIG_IMA_DISABLE_HTABLE is disabled.
Duplicate IMA measurements will not be r
ecorded in the IMA log.
[    3.023622] device-mapper: uevent: version 1.0.3
[    3.023659] device-mapper: ioctl: 4.48.0-ioctl (2023-03-01) initialised:
dm-devel@lists.linux.dev
[    3.025513] [drm] Initialized simpledrm 1.0.0 20200625 for
simple-framebuffer.0 on minor 0
[    3.029153] Console: switching to colour frame buffer device 320x100
[    3.031731] simple-framebuffer simple-framebuffer.0: [drm] fb0:
simpledrmdrmfb frame buffer device
[    3.031817] hid: raw HID events driver (C) Jiri Kosina
[    3.031861] usbcore: registered new interface driver usbhid
[    3.031872] usbhid: USB HID core driver
[    3.032031] drop_monitor: Initializing network drop monitor service
[    3.032102] Initializing XFRM netlink socket
[    3.032126] NET: Registered PF_INET6 protocol family
[    3.034626] Segment Routing with IPv6
[    3.034632] RPL Segment Routing with IPv6
[    3.034641] In-situ OAM (IOAM) with IPv6
[    3.034656] mip6: Mobile IPv6
[    3.034660] NET: Registered PF_PACKET protocol family
[    3.035557] microcode: Current revision: 0x0a601206
[    3.035916] resctrl: L3 allocation detected
[    3.035921] resctrl: MB allocation detected
[    3.035924] resctrl: SMBA allocation detected
[    3.035929] resctrl: L3 monitoring detected
[    3.035949] IPI shorthand broadcast: enabled
[    3.035957] AVX2 version of gcm_enc/dec engaged.
[    3.036140] AES CTR mode by8 optimization enabled
[    3.036830] sched_clock: Marking stable (3035023337,
1617963)->(3072096241, -35454941)
[    3.036919] Timer migration: 2 hierarchy levels; 8 children per group; 2
crossnode level
[    3.037030] registered taskstats version 1
[    3.037285] Loading compiled-in X.509 certificates
[    3.041637] Loaded X.509 cert 'Build time autogenerated kernel key:
ec3f0af369e59acf168b705afdf50840939a67ed'
[    3.042451] page_owner is disabled
[    3.042524] Key type .fscrypt registered
[    3.042528] Key type fscrypt-provisioning registered
[    3.042694] Btrfs loaded, zoned=yes, fsverity=yes
[    3.042705] Key type big_key registered
[    3.042712] Key type trusted registered
[    3.047823] input: AT Translated Set 2 keyboard as
/devices/platform/i8042/serio0/input/input3
[    3.049438] Key type encrypted registered
[    3.050310] integrity: Loading X.509 certificate: UEFI:db
[    3.050326] integrity: Loaded X.509 cert 'Microsoft Windows Production
PCA 2011: a92902398e16c49778cd90f99e4f9ae
17c55af53'
[    3.050334] integrity: Loading X.509 certificate: UEFI:db
[    3.050347] integrity: Loaded X.509 cert 'Microsoft Corporation UEFI CA
2011: 13adbf4309bd82709c8cd54f316ed52298
8a1bd4'
[    3.050355] integrity: Loading X.509 certificate: UEFI:db
[    3.054134] integrity: Loaded X.509 cert ':
9b398b58bae7d28e4449e715084144d8'
[    3.056203] Loading compiled-in module X.509 certificates
[    3.056575] Loaded X.509 cert 'Build time autogenerated kernel key:
ec3f0af369e59acf168b705afdf50840939a67ed'
[    3.056585] ima: Allocated hash algorithm: sha256
[    3.067633] ima: No architecture policies found
[    3.067642] evm: Initialising EVM extended attributes:
[    3.067647] evm: security.selinux
[    3.067650] evm: security.SMACK64 (disabled)
[    3.067655] evm: security.SMACK64EXEC (disabled)
[    3.067659] evm: security.SMACK64TRANSMUTE (disabled)
[    3.067663] evm: security.SMACK64MMAP (disabled)
[    3.067667] evm: security.apparmor (disabled)
[    3.067671] evm: security.ima
[    3.067674] evm: security.capability
[    3.067677] evm: HMAC attrs: 0x1
[    3.084895] alg: No test for 842 (842-scomp)
[    3.084935] alg: No test for 842 (842-generic)
[    3.139553] PM:   Magic number: 8:990:38
[    3.141124] RAS: Correctable Errors collector initialized.
[    3.152986] clk: Disabling unused clocks
[    3.152995] PM: genpd: Disabling unused power domains
[    3.153418] Freeing unused decrypted memory: 2028K
[    3.153724] Freeing unused kernel image (initmem) memory: 4580K
[    3.153731] Write protecting the kernel read-only data: 36864k
[    3.153926] Freeing unused kernel image (rodata/data gap) memory: 1292K
[    3.158731] x86/mm: Checked W+X mappings: passed, no W+X pages found.
[    3.158807] Run /init as init process
[    3.158812]   with arguments:
[    3.158813]     /init
[    3.158814]   with environment:
[    3.158814]     HOME=/
[    3.158814]     TERM=linux
[    3.158815]     BOOT_IMAGE=(hd1,gpt2)/vmlinuz-6.9.0-RX7600XT
[    3.169366] systemd[1]: systemd 255.6-1.fc40 running in system mode
(+PAM +AUDIT +SELINUX -APPARMOR +IMA +SMACK
+SECCOMP -GCRYPT +GNUTLS +OPENSSL +ACL +BLKID +CURL +ELFUTILS +FIDO2 +IDN2
-IDN -IPTC +KMOD +LIBCRYPTSETUP +LIBFDIS
K +PCRE2 +PWQUALITY +P11KIT +QRENCODE +TPM2 +BZIP2 +LZ4 +XZ +ZLIB +ZSTD
+BPF_FRAMEWORK +XKBCOMMON +UTMP +SYSVINIT d
efault-hierarchy=unified)
[    3.169387] systemd[1]: Detected architecture x86-64.
[    3.169392] systemd[1]: Running in initrd.
[    3.169468] systemd[1]: Hostname set to <watchman>.
[    3.257984] usb 5-1: new high-speed USB device number 2 using xhci_hcd
[    3.258023] usb 7-1: new high-speed USB device number 2 using xhci_hcd
[    3.319987] usb 1-1: new high-speed USB device number 2 using xhci_hcd
[    3.390798] usb 5-1: New USB device found, idVendor=2109,
idProduct=2817, bcdDevice= 7.c3
[    3.391214] usb 5-1: New USB device strings: Mfr=1, Product=2,
SerialNumber=0
[    3.391493] usb 5-1: Product: USB2.0 Hub
[    3.391761] usb 5-1: Manufacturer: VIA Labs, Inc.
[    3.395560] usb 7-1: New USB device found, idVendor=0bda,
idProduct=555a, bcdDevice=24.71
[    3.395959] usb 7-1: New USB device strings: Mfr=3, Product=1,
SerialNumber=2
[    3.396235] usb 7-1: Product: Integrated_Webcam_FHD
[    3.396497] usb 7-1: Manufacturer: C7FME20T08142000B280
[    3.396756] usb 7-1: SerialNumber: 200901010001
[    3.434766] hub 5-1:1.0: USB hub found
[    3.437596] hub 5-1:1.0: 4 ports detected
[    3.483704] systemd[1]: bpf-lsm: LSM BPF program attached
[    3.508098] systemd[1]: Queued start job for default target
initrd.target.
[    3.516178] usb 1-1: New USB device found, idVendor=2109,
idProduct=2822, bcdDevice=37.64
[    3.516528] usb 1-1: New USB device strings: Mfr=1, Product=2,
SerialNumber=3
[    3.516806] usb 1-1: Product: USB2.0 Hub
[    3.517065] usb 1-1: Manufacturer: VIA Labs, Inc.
[    3.517318] usb 1-1: SerialNumber: 000000001
[    3.524412] hub 1-1:1.0: USB hub found
[    3.526391] systemd[1]: Expecting device
dev-disk-by\x2duuid-ac66d86f\x2da430\x2d4aef\x2d8f35\x2d53cc5f761de5.de
vice - /dev/disk/by-uuid/ac66d86f-a430-4aef-8f35-53cc5f761de5...
[    3.526490] hub 1-1:1.0: 5 ports detected
[    3.527345] systemd[1]: Reached target initrd-usr-fs.target - Initrd
/usr File System.
[    3.528894] systemd[1]: Reached target slices.target - Slice Units.
[    3.529791] systemd[1]: Reached target swap.target - Swaps.
[    3.530846] systemd[1]: Reached target timers.target - Timer Units.
[    3.532070] systemd[1]: Listening on dbus.socket - D-Bus System Message
Bus Socket.
[    3.532662] usb 6-1: new SuperSpeed USB device number 2 using xhci_hcd
[    3.534060] systemd[1]: Listening on systemd-journald-dev-log.socket -
Journal Socket (/dev/log).
[    3.535247] systemd[1]: Listening on systemd-journald.socket - Journal
Socket.
[    3.536537] systemd[1]: Listening on systemd-udevd-control.socket - udev
Control Socket.
[    3.538164] systemd[1]: Listening on systemd-udevd-kernel.socket - udev
Kernel Socket.
[    3.539490] systemd[1]: Reached target sockets.target - Socket Units.
[    3.541740] systemd[1]: Starting kmod-static-nodes.service - Create List
of Static Device Nodes...
[    3.543155] systemd[1]: memstrack.service - Memstrack Anylazing Service
was skipped because no trigger condition
checks were met.
[    3.545432] systemd[1]: Starting systemd-journald.service - Journal
Service...
[    3.548084] systemd[1]: Starting systemd-modules-load.service - Load
Kernel Modules...
[    3.550229] systemd[1]: Starting systemd-vconsole-setup.service -
Virtual Console Setup...
[    3.552096] systemd[1]: Finished kmod-static-nodes.service - Create List
of Static Device Nodes.
[    3.552378] systemd-journald[417]: Collecting audit messages is
disabled.
[    3.555086] i2c_dev: i2c /dev entries driver
[    3.559267] systemd[1]: Starting
systemd-tmpfiles-setup-dev-early.service - Create Static Device Nodes in
/dev g
racefully...
[    3.566433] systemd[1]: Finished
systemd-tmpfiles-setup-dev-early.service - Create Static Device Nodes in
/dev g
racefully.
[    3.569189] systemd[1]: Starting systemd-sysusers.service - Create
System Users...
[    3.571186] systemd[1]: Started systemd-journald.service - Journal
Service.
[    3.573290] fuse: init (API version 7.40)
[    3.578724] alua: device handler registered
[    3.580378] emc: device handler registered
[    3.584777] rdac: device handler registered
[    3.632774] usb 2-1: new SuperSpeed Plus Gen 2x1 USB device number 2
using xhci_hcd
[    3.650204] usb 6-1: New USB device found, idVendor=2109,
idProduct=0817, bcdDevice= 7.c3
[    3.650592] usb 6-1: New USB device strings: Mfr=1, Product=2,
SerialNumber=0
[    3.650965] usb 6-1: Product: USB3.0 Hub
[    3.651324] usb 6-1: Manufacturer: VIA Labs, Inc.
[    3.673645] hub 6-1:1.0: USB hub found
[    3.675942] hub 6-1:1.0: 4 ports detected
[    3.692638] usb 2-1: New USB device found, idVendor=2109,
idProduct=0822, bcdDevice=37.64
[    3.693049] usb 2-1: New USB device strings: Mfr=1, Product=2,
SerialNumber=3
[    3.693424] usb 2-1: Product: USB3.1 Hub
[    3.693425] usb 2-1: Manufacturer: VIA Labs, Inc.
[    3.693425] usb 2-1: SerialNumber: 000000001
[    3.702219] hub 2-1:1.0: USB hub found
[    3.704796] hub 2-1:1.0: 4 ports detected
[    3.705494] wmi_bus wmi_bus-PNP0C14:00: [Firmware Bug]: WQBC data block
query control method not found
[    3.707497] wmi_bus wmi_bus-PNP0C14:00: [Firmware Bug]: WMBD method
block execution control method not found
[    3.711356] sp5100_tco: SP5100/SB800 TCO WatchDog Timer Driver
[    3.711441] sp5100-tco sp5100-tco: Using 0xfeb00000 for watchdog MMIO
address
[    3.711520] sp5100-tco sp5100-tco: initialized. heartbeat=60 sec
(nowayout=0)
[    3.792401] ccp 0000:0c:00.2: tee enabled
[    3.792872] ccp 0000:0c:00.2: psp enabled
[    3.793672] input: DELL0C4C:00 04F3:328A Mouse as
/devices/platform/AMDI0010:00/i2c-0/i2c-DELL0C4C:00/0018:04F3:
328A.0001/input/input4
[    3.794385] input: DELL0C4C:00 04F3:328A Touchpad as
/devices/platform/AMDI0010:00/i2c-0/i2c-DELL0C4C:00/0018:04
F3:328A.0001/input/input5
[    3.794844] hid-generic 0018:04F3:328A.0001: input,hidraw0: I2C HID
v1.00 Mouse [DELL0C4C:00 04F3:328A] on i2c-D
ELL0C4C:00
[    3.839989] nvme 0000:04:00.0: platform quirk: setting simple suspend
[    3.839989] nvme 0000:05:00.0: platform quirk: setting simple suspend
[    3.840023] r8169 0000:0b:00.0 eth0: RTL8125B, ac:1a:3d:cc:f8:2b, XID
641, IRQ 86
[    3.840027] r8169 0000:0b:00.0 eth0: jumbo features [frames: 9194 bytes,
tx checksumming: ko]
[    3.840074] nvme nvme0: pci function 0000:04:00.0
[    3.840074] nvme nvme1: pci function 0000:05:00.0
[    3.855747] nvme nvme1: missing or invalid SUBNQN field.
[    3.856421] nvme nvme1: D3 entry latency set to 8 seconds
[    3.857039] nvme nvme0: D3 entry latency set to 10 seconds
[    3.889103] nvme nvme0: 24/0/0 default/read/poll queues
[    3.892839]  nvme0n1: p1 p2 p3 p4
[    3.973600] input: DELL0C4C:00 04F3:328A Mouse as
/devices/platform/AMDI0010:00/i2c-0/i2c-DELL0C4C:00/0018:04F3:
328A.0001/input/input7
[    3.974469] input: DELL0C4C:00 04F3:328A Touchpad as
/devices/platform/AMDI0010:00/i2c-0/i2c-DELL0C4C:00/0018:04
F3:328A.0001/input/input8
[    3.974841] hid-multitouch 0018:04F3:328A.0001: input,hidraw0: I2C HID
v1.00 Mouse [DELL0C4C:00 04F3:328A] on i2
c-DELL0C4C:00
[    4.011150] nvme nvme1: 24/0/0 default/read/poll queues
[    4.036653]  nvme1n1: p1 p2 p3
[    4.038947] r8169 0000:0b:00.0 enp11s0: renamed from eth0
[    4.080154] ucsi_acpi USBC000:00: UCSI_GET_PDOS failed (-95)
[    4.141779] ucsi_acpi USBC000:00: UCSI_GET_PDOS failed (-95)
[    4.205622] usb 5-1.2: new full-speed USB device number 3 using xhci_hcd
[    4.220057] ACPI: video: Video Device [VGA] (multi-head: yes  rom: no
 post: no)
[    4.220208] input: Video Bus as
/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:1e/LNXVIDEO:00/input/input10

[    4.269641] usb 1-1.1: new low-speed USB device number 3 using xhci_hcd
[    4.367192] usb 5-1.2: New USB device found, idVendor=8087,
idProduct=0032, bcdDevice= 0.00
[    4.367200] usb 5-1.2: New USB device strings: Mfr=0, Product=0,
SerialNumber=0
[    4.397742] ucsi_acpi USBC000:00: UCSI_GET_PDOS failed (-95)
[    4.504643] usb 5-1.3: new full-speed USB device number 4 using xhci_hcd
[    4.516045] usb 1-1.1: New USB device found, idVendor=045e,
idProduct=0040, bcdDevice= 3.00
[    4.516054] usb 1-1.1: New USB device strings: Mfr=1, Product=3,
SerialNumber=0
[    4.516056] usb 1-1.1: Product: Microsoft 3-Button Mouse with
IntelliEye(TM)
[    4.516057] usb 1-1.1: Manufacturer: Microsoft
[    4.528180] input: Microsoft Microsoft 3-Button Mouse with
IntelliEye(TM) as /devices/pci0000:00/0000:00:02.1/00
00:06:00.0/0000:07:02.0/0000:08:00.0/usb1/1-1/1-1.1/1-1.1:1.0/0003:045E:0040.0002/input/input11

[    4.528271] hid-generic 0003:045E:0040.0002: input,hidraw1: USB HID
v1.10 Mouse [Microsoft Microsoft 3-Button Mo
use with IntelliEye(TM)] on usb-0000:08:00.0-1.1/input0
[    4.601651] usb 2-1.3: new SuperSpeed Plus Gen 2x1 USB device number 3
using xhci_hcd
[    4.622760] usb 5-1.3: New USB device found, idVendor=0d62,
idProduct=bab0, bcdDevice=33.09
[    4.622770] usb 5-1.3: New USB device strings: Mfr=1, Product=2,
SerialNumber=0
[    4.622772] usb 5-1.3: Product: Keyboard
[    4.622773] usb 5-1.3: Manufacturer: DELL Technologies
[    4.652374] usb 2-1.3: New USB device found, idVendor=2109,
idProduct=0822, bcdDevice=38.23
[    4.652377] usb 2-1.3: New USB device strings: Mfr=1, Product=2,
SerialNumber=3
[    4.652378] usb 2-1.3: Product: USB3.1 Hub
[    4.652378] usb 2-1.3: Manufacturer: VIA Labs, Inc.
[    4.652379] usb 2-1.3: SerialNumber: 000000001
[    4.662035] hub 2-1.3:1.0: USB hub found
[    4.663487] hub 2-1.3:1.0: 4 ports detected
[    4.689210] input: DELL Technologies Keyboard as
/devices/pci0000:00/0000:00:08.1/0000:0c:00.4/usb5/5-1/5-1.3/5-
1.3:1.0/0003:0D62:BAB0.0003/input/input12
[    4.741825] hid-generic 0003:0D62:BAB0.0003: input,hiddev96,hidraw2: USB
HID v1.10 Keyboard [DELL Technologies K
eyboard] on usb-0000:0c:00.4-1.3/input0
[    4.777482] usb 1-1.3: new high-speed USB device number 4 using xhci_hcd
[    4.893632] usb 5-1.4: new full-speed USB device number 5 using xhci_hcd
[    4.907483] ucsi_acpi USBC000:00: UCSI_GET_PDOS failed (-95)
[    4.959740] usb 1-1.3: New USB device found, idVendor=2109,
idProduct=2822, bcdDevice=38.23
[    4.965730] usb 1-1.3: New USB device strings: Mfr=1, Product=2,
SerialNumber=3
[    4.980949] usb 1-1.3: Product: USB2.0 Hub
[    4.981576] usb 1-1.3: Manufacturer: VIA Labs, Inc.
[    4.981577] usb 1-1.3: SerialNumber: 000000001
[    5.021591] hub 1-1.3:1.0: USB hub found
[    5.036480] hub 1-1.3:1.0: 5 ports detected
[    5.046587] usb 2-1.4: new SuperSpeed USB device number 4 using xhci_hcd
[    5.093414] ucsi_acpi USBC000:00: UCSI_GET_PDOS failed (-95)
[    5.106131] usb 2-1.4: New USB device found, idVendor=2109,
idProduct=0817, bcdDevice=37.23
[    5.106870] usb 2-1.4: New USB device strings: Mfr=1, Product=2,
SerialNumber=3
[    5.107324] usb 2-1.4: Product: USB3.0 Hub
[    5.107741] usb 2-1.4: Manufacturer: VIA Labs, Inc.
[    5.108617] usb 2-1.4: SerialNumber: 000000000
[    5.120896] usb 5-1.4: New USB device found, idVendor=187c,
idProduct=0551, bcdDevice= 2.00
[    5.120898] usb 5-1.4: New USB device strings: Mfr=1, Product=2,
SerialNumber=3
[    5.120899] usb 5-1.4: Product: AW-ELC
[    5.120899] usb 5-1.4: Manufacturer: Alienware
[    5.120900] usb 5-1.4: SerialNumber: 00.01
[    5.131911] hub 2-1.4:1.0: USB hub found
[    5.152640] hub 2-1.4:1.0: 4 ports detected
[    5.217190] hid-generic 0003:187C:0551.0004: hiddev97,hidraw3: USB HID
v1.11 Device [Alienware AW-ELC] on usb-00
00:0c:00.4-1.4/input0
[    5.217192] ucsi_acpi USBC000:00: UCSI_GET_PDOS failed (-95)
[    5.369500] usb 1-1.4: new high-speed USB device number 5 using xhci_hcd
[    5.528035] ucsi_acpi USBC000:00: UCSI_GET_PDOS failed (-95)
[    5.563473] usb 1-1.4: New USB device found, idVendor=2109,
idProduct=2817, bcdDevice=37.23
[    5.574682] usb 1-1.4: New USB device strings: Mfr=1, Product=2,
SerialNumber=3
[    5.575285] usb 1-1.4: Product: USB2.0 Hub
[    5.575826] usb 1-1.4: Manufacturer: VIA Labs, Inc.
[    5.576354] usb 1-1.4: SerialNumber: 000000000
[    5.590013] ucsi_acpi USBC000:00: UCSI_GET_PDOS failed (-95)
[    5.602216] hub 1-1.4:1.0: USB hub found
[    5.607330] hub 1-1.4:1.0: 5 ports detected
[    6.699087] [drm] amdgpu kernel modesetting enabled.
[    6.700923] amdgpu: Virtual CRAT table created for CPU
[    6.700933] amdgpu: Topology: Add CPU node
[    6.701390] [drm] initializing kernel modesetting (IP DISCOVERY
0x1002:0x7480 0x1028:0x0C4C 0xC7).
[    6.707710] [drm] register mmio base: 0xC0E00000
[    6.708560] [drm] register mmio size: 1048576
[    6.715018] [drm] add ip block number 0 <soc21_common>
[    6.715819] [drm] add ip block number 1 <gmc_v11_0>
[    6.716235] [drm] add ip block number 2 <ih_v6_0>
[    6.716593] [drm] add ip block number 3 <psp>
[    6.716934] [drm] add ip block number 4 <smu>
[    6.717260] [drm] add ip block number 5 <dm>
[    6.717261] [drm] add ip block number 6 <gfx_v11_0>
[    6.717262] [drm] add ip block number 7 <sdma_v6_0>
[    6.717263] [drm] add ip block number 8 <vcn_v4_0>
[    6.717263] [drm] add ip block number 9 <jpeg_v4_0>
[    6.717263] [drm] add ip block number 10 <mes_v11_0>
[    6.717702] amdgpu 0000:03:00.0: amdgpu: Fetched VBIOS from VFCT
[    6.726781] amdgpu: ATOM BIOS: 113-BRT115767-001
[    6.748170] amdgpu 0000:03:00.0: amdgpu: CP RS64 enable
[    6.759147] [drm] VCN(0) encode/decode are enabled in VM mode
[    6.771265] amdgpu 0000:03:00.0: [drm:jpeg_v4_0_early_init [amdgpu]]
JPEG decode is enabled in VM mode
[    6.780654] Console: switching to colour dummy device 80x25
[    6.790951] amdgpu 0000:03:00.0: vgaarb: deactivate vga console
[    6.790954] amdgpu 0000:03:00.0: amdgpu: Trusted Memory Zone (TMZ)
feature not supported
[    6.791049] [drm] vm size is 262144 GB, 4 levels, block size is 9-bit,
fragment size is 9-bit
[    6.791052] [drm] System can't access extended configuration
space,please check!!
[    6.791054] amdgpu 0000:03:00.0: amdgpu: VRAM: 8176M 0x0000008000000000
- 0x00000081FEFFFFFF (8176M used)
[    6.791056] amdgpu 0000:03:00.0: amdgpu: GART: 512M 0x00007FFF00000000 -
0x00007FFF1FFFFFFF
[    6.791062] [drm] Detected VRAM RAM=8176M, BAR=8192M
[    6.791063] [drm] RAM width 128bits GDDR6
[    6.791144] [drm] amdgpu: 8176M of VRAM memory ready
[    6.791147] [drm] amdgpu: 31986M of GTT memory ready.
[    6.791160] [drm] GART: num cpu pages 131072, num gpu pages 131072
[    6.791217] [drm] PCIE GART of 512M enabled (table at
0x00000081FEB00000).
[    6.791437] [drm] Loading DMUB firmware via PSP: version=0x07002800
[    6.791537] [drm] Found VCN firmware Version ENC: 1.19 DEC: 7 VEP: 0
Revision: 0
[    6.791541] amdgpu 0000:03:00.0: amdgpu: Will use PSP to load VCN
firmware
[    6.811637] usb 1-1.3.1: new full-speed USB device number 6 using
xhci_hcd
[    6.848150] amdgpu 0000:03:00.0: amdgpu: reserve 0x1300000 from
0x81fc000000 for PSP TMR
[    6.942454] amdgpu 0000:03:00.0: amdgpu: RAS: optional ras ta ucode is
not available
[    6.949944] amdgpu 0000:03:00.0: amdgpu: RAP: optional rap ta ucode is
not available
[    6.949947] amdgpu 0000:03:00.0: amdgpu: SECUREDISPLAY: securedisplay ta
ucode is not available
[    6.949975] amdgpu 0000:03:00.0: amdgpu: smu driver if version =
0x00000035, smu fw if version = 0x00000040, smu
fw program = 0, smu fw version = 0x00525800 (82.88.0)
[    6.949977] amdgpu 0000:03:00.0: amdgpu: SMU driver if version not
matched
[    6.996477] amdgpu 0000:03:00.0: amdgpu: SMU is initialized
successfully!
[    6.996633] amdgpu 0000:03:00.0: [drm] Unsupported pwrseq engine id: 4!
[    6.996646] ------------[ cut here ]------------
[    6.996646] WARNING: CPU: 1 PID: 568 at
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_panel_cntl.c:172 dc
n31_panel_cntl_construct.cold+0x1c/0x28 [amdgpu]
[    6.996930] Modules linked in: amdgpu(+) typec_displayport video amdxcp
i2c_algo_bit drm_ttm_helper ttm crct10di
f_pclmul drm_exec crc32_pclmul gpu_sched crc32c_intel nvme
drm_suballoc_helper rtsx_pci_sdmmc polyval_clmulni drm_b
uddy polyval_generic mmc_core nvme_core drm_display_helper r8169
ghash_clmulni_intel sha512_ssse3 ucsi_acpi hid_mul
titouch ccp typec_ucsi sha256_ssse3 rtsx_pci sha1_ssse3 cec realtek
sp5100_tco typec nvme_auth i2c_hid_acpi wmi i2c
_hid serio_raw scsi_dh_rdac scsi_dh_emc scsi_dh_alua ip6_tables ip_tables
fuse i2c_dev
[    6.996952] CPU: 1 PID: 568 Comm: (udev-worker) Not tainted
6.9.0-RX7600XT #1
[    6.996954] Hardware name: Alienware Alienware m18 R1 AMD/0XY1HF, BIOS
1.13.1 04/23/2024
[    6.996955] RIP: 0010:dcn31_panel_cntl_construct.cold+0x1c/0x28 [amdgpu]
[    6.997120] Code: b0 e4 25 c1 e8 0d 6b 33 ec e9 49 9b f5 ff 48 8b 40 10
48 8b 38 48 85 ff 74 04 48 8b 7f 08 48 c
7 c6 00 e5 25 c1 e8 ec 6a 33 ec <0f> 0b ba 0f 00 00 00 e9 01 a0 f5 ff 48 8b
43 08 48 8b 40 10 48 8b
[    6.997122] RSP: 0018:ffffbc628082b370 EFLAGS: 00010246
[    6.997124] RAX: 0000000000000000 RBX: ffff9ac24e58a100 RCX:
0000000000000000
[    6.997125] RDX: 0000000000000000 RSI: ffff9ad13d2a18c0 RDI:
ffff9ad13d2a18c0
[    6.997126] RBP: ffffbc628082b3a8 R08: 0000000000000000 R09:
ffffbc628082b0e0
[    6.997127] R10: ffffffffae53e8c8 R11: 0000000000000003 R12:
ffff9ac27e658400
[    6.997127] R13: ffffffffc1101900 R14: ffff9ac286ae3000 R15:
0000000000000000
[    6.997129] FS:  00007f9e00232980(0000) GS:ffff9ad13d280000(0000)
knlGS:0000000000000000
[    6.997130] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    6.997131] CR2: 000055e6dd025298 CR3: 00000001111c6000 CR4:
0000000000f50ef0
[    6.997132] PKRU: 55555554
[    6.997133] Call Trace:
[    6.997134]  <TASK>
[    6.997135]  ? dcn31_panel_cntl_construct.cold+0x1c/0x28 [amdgpu]
[    6.997284]  ? __warn.cold+0x8e/0xe8
[    6.997287]  ? dcn31_panel_cntl_construct.cold+0x1c/0x28 [amdgpu]
[    6.997429]  ? report_bug+0xff/0x140
[    6.997431]  ? handle_bug+0x3c/0x80
[    6.997433]  ? exc_invalid_op+0x17/0x70
[    6.997434]  ? asm_exc_invalid_op+0x1a/0x20
[    6.997437]  ? dcn31_panel_cntl_construct.cold+0x1c/0x28 [amdgpu]
[    6.997600]  dcn32_panel_cntl_create+0x37/0x50 [amdgpu]
[    6.997806]  construct_phy+0x8ef/0xbb0 [amdgpu]
[    6.998001]  link_create+0x1ba/0x200 [amdgpu]
[    6.998177]  create_links+0x13b/0x430 [amdgpu]
[    6.998348]  dc_create+0x316/0x650 [amdgpu]
[    6.998509]  amdgpu_dm_init.isra.0+0x32b/0x1da0 [amdgpu]
[    6.998694]  ? vprintk_emit+0x176/0x2a0
[    6.998696]  ? asm_sysvec_apic_timer_interrupt+0x1a/0x20
[    6.998699]  dm_hw_init+0x12/0x30 [amdgpu]
[    6.998865]  amdgpu_device_init.cold+0x1ad4/0x20f0 [amdgpu]
[    6.999044]  amdgpu_driver_load_kms+0x19/0x110 [amdgpu]
[    6.999173]  amdgpu_pci_probe+0x187/0x400 [amdgpu]
[    6.999297]  local_pci_probe+0x42/0x90
[    6.999299]  pci_device_probe+0xc1/0x280
[    6.999301]  really_probe+0xdb/0x340
[    6.999303]  ? pm_runtime_barrier+0x54/0x90
[    6.999305]  ? __pfx___driver_attach+0x10/0x10
[    6.999306]  __driver_probe_device+0x78/0x110
[    6.999308]  driver_probe_device+0x1f/0xa0
[    6.999309]  __driver_attach+0xba/0x1c0
[    6.999310]  bus_for_each_dev+0x8c/0xe0
[    6.999312]  bus_add_driver+0x116/0x1f0
[    6.999314]  driver_register+0x72/0xd0
[    6.999316]  ? __pfx_amdgpu_init+0x10/0x10 [amdgpu]
[    6.999438]  do_one_initcall+0x58/0x2f0
[    6.999441]  do_init_module+0x60/0x220
[    6.999442]  init_module_from_file+0x86/0xc0
[    6.999444]  idempotent_init_module+0x121/0x2b0
[    6.999445]  __x64_sys_finit_module+0x5e/0xb0
[    6.999446]  do_syscall_64+0x82/0x170
[    6.999448]  ? syscall_exit_to_user_mode+0x75/0x230
[    6.999449]  ? do_syscall_64+0x8f/0x170
[    6.999450]  ? do_syscall_64+0x8f/0x170
[    6.999451]  ? __irq_exit_rcu+0x4b/0xc0
[    6.999453]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[    6.999454] RIP: 0033:0x7f9e00c0218d
[    6.999464] Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48
89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c
2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 5b cc
0c 00 f7 d8 64 89 01 48
[    6.999466] RSP: 002b:00007ffe4d977b98 EFLAGS: 00000246 ORIG_RAX:
0000000000000139
[    6.999467] RAX: ffffffffffffffda RBX: 000055e6dd012750 RCX:
00007f9e00c0218d
[    6.999468] RDX: 0000000000000000 RSI: 00007f9e00d1d07d RDI:
000000000000002f
[    6.999469] RBP: 00007ffe4d977c50 R08: 0000000000000001 R09:
00007ffe4d977be0
[    6.999470] R10: 0000000000000050 R11: 0000000000000246 R12:
00007f9e00d1d07d
[    6.999471] R13: 0000000000020000 R14: 000055e6dd00e1e0 R15:
000055e6dd025810
[    6.999472]  </TASK>
[    6.999473] ---[ end trace 0000000000000000 ]---
[    6.999901] [drm] Display Core v3.2.273 initialized on DCN 3.2.1
[    6.999905] [drm] DP-HDMI FRL PCON supported
[    7.001573] [drm] DMUB hardware initialized: version=0x07002800
[    7.041261] usb 1-1.3.1: New USB device found, idVendor=04d9,
idProduct=a1dd, bcdDevice= 2.01
[    7.041266] usb 1-1.3.1: New USB device strings: Mfr=1, Product=2,
SerialNumber=0
[    7.041267] usb 1-1.3.1: Product: USB-HID Keyboard
[    7.041269] usb 1-1.3.1: Manufacturer: HOLTEK
[    7.088412] input: HOLTEK USB-HID Keyboard as
/devices/pci0000:00/0000:00:02.1/0000:06:00.0/0000:07:02.0/0000:08
:00.0/usb1/1-1/1-1.3/1-1.3.1/1-1.3.1:1.0/0003:04D9:A1DD.0005/input/input13
[    7.106523] usb 2-1.4.1: new SuperSpeed USB device number 5 using
xhci_hcd
[    7.121414] usb 2-1.4.1: New USB device found, idVendor=17e9,
idProduct=6013, bcdDevice=30.09
[    7.121421] usb 2-1.4.1: New USB device strings: Mfr=1, Product=2,
SerialNumber=3
[    7.121422] usb 2-1.4.1: Product: Dell Universal Hybrid Video Dock
[    7.121424] usb 2-1.4.1: Manufacturer: DisplayLink
[    7.121424] usb 2-1.4.1: SerialNumber: 2207120766
[    7.139725] hid-generic 0003:04D9:A1DD.0005: input,hidraw4: USB HID
v1.11 Keyboard [HOLTEK USB-HID Keyboard] on
usb-0000:08:00.0-1.3.1/input0
[    7.151798] input: HOLTEK USB-HID Keyboard Mouse as
/devices/pci0000:00/0000:00:02.1/0000:06:00.0/0000:07:02.0/0
000:08:00.0/usb1/1-1/1-1.3/1-1.3.1/1-1.3.1:1.2/0003:04D9:A1DD.0006/input/input14

[    7.151839] input: HOLTEK USB-HID Keyboard System Control as
/devices/pci0000:00/0000:00:02.1/0000:06:00.0/0000:
07:02.0/0000:08:00.0/usb1/1-1/1-1.3/1-1.3.1/1-1.3.1:1.2/0003:04D9:A1DD.0006/input/input15

[    7.182468] [drm] PSR support 1, DC PSR ver 0, sink PSR ver 1 DPCD caps
0x2a su_y_granularity 0
[    7.183636] usb 1-1.5: new high-speed USB device number 7 using xhci_hcd
[    7.203702] input: HOLTEK USB-HID Keyboard Consumer Control as
/devices/pci0000:00/0000:00:02.1/0000:06:00.0/000
0:07:02.0/0000:08:00.0/usb1/1-1/1-1.3/1-1.3.1/1-1.3.1:1.2/0003:04D9:A1DD.0006/input/input16

[    7.203733] input: HOLTEK USB-HID Keyboard as
/devices/pci0000:00/0000:00:02.1/0000:06:00.0/0000:07:02.0/0000:08
:00.0/usb1/1-1/1-1.3/1-1.3.1/1-1.3.1:1.2/0003:04D9:A1DD.0006/input/input17
[    7.203758] input: HOLTEK USB-HID Keyboard as
/devices/pci0000:00/0000:00:02.1/0000:06:00.0/0000:07:02.0/0000:08
:00.0/usb1/1-1/1-1.3/1-1.3.1/1-1.3.1:1.2/0003:04D9:A1DD.0006/input/input18
[    7.203800] hid-generic 0003:04D9:A1DD.0006: input,hiddev98,hidraw5: USB
HID v1.11 Mouse [HOLTEK USB-HID Keyboar
d] on usb-0000:08:00.0-1.3.1/input2
[    7.204424] hid-generic 0003:04D9:A1DD.0007: hiddev99,hidraw6: USB HID
v1.11 Device [HOLTEK USB-HID Keyboard] on
usb-0000:08:00.0-1.3.1/input3
[    7.205034] hid-generic 0003:04D9:A1DD.0008: hiddev100,hidraw7: USB HID
v1.11 Device [HOLTEK USB-HID Keyboard] o
n usb-0000:08:00.0-1.3.1/input1
[    7.262648] usb 1-1.5: New USB device found, idVendor=2109,
idProduct=8884, bcdDevice= 0.01
[    7.262653] usb 1-1.5: New USB device strings: Mfr=1, Product=2,
SerialNumber=3
[    7.262655] usb 1-1.5: Product: USB Billboard Device
[    7.262656] usb 1-1.5: Manufacturer: VIA Labs, Inc.
[    7.262657] usb 1-1.5: SerialNumber: 0000000000000001
[    7.368230] [drm] kiq ring mec 3 pipe 1 q 0
[    7.373668] [drm] VCN decode and encode initialized successfully(under
DPG Mode).
[    7.374432] amdgpu 0000:03:00.0: [drm:jpeg_v4_0_hw_init [amdgpu]] JPEG
decode initialized successfully.
[    7.392165] amdgpu: HMM registered 8176MB device memory
[    7.393001] kfd kfd: amdgpu: Allocated 3969056 bytes on gart
[    7.393015] kfd kfd: amdgpu: Total number of KFD nodes to be created: 1
[    7.393032] amdgpu: Virtual CRAT table created for GPU
[    7.393083] amdgpu: Topology: Add dGPU node [0x7480:0x1002]
[    7.393085] kfd kfd: amdgpu: added device 1002:7480
[    7.393096] amdgpu 0000:03:00.0: amdgpu: SE 2, SH per SE 2, CU per SH 8,
active_cu_number 32
[    7.393099] amdgpu 0000:03:00.0: amdgpu: ring gfx_0.0.0 uses VM inv eng
0 on hub 0
[    7.393101] amdgpu 0000:03:00.0: amdgpu: ring comp_1.0.0 uses VM inv eng
1 on hub 0
[    7.393102] amdgpu 0000:03:00.0: amdgpu: ring comp_1.1.0 uses VM inv eng
4 on hub 0
[    7.393103] amdgpu 0000:03:00.0: amdgpu: ring comp_1.2.0 uses VM inv eng
6 on hub 0
[    7.393104] amdgpu 0000:03:00.0: amdgpu: ring comp_1.3.0 uses VM inv eng
7 on hub 0
[    7.393105] amdgpu 0000:03:00.0: amdgpu: ring comp_1.0.1 uses VM inv eng
8 on hub 0
[    7.393106] amdgpu 0000:03:00.0: amdgpu: ring comp_1.1.1 uses VM inv eng
9 on hub 0
[    7.393107] amdgpu 0000:03:00.0: amdgpu: ring comp_1.2.1 uses VM inv eng
10 on hub 0
[    7.393109] amdgpu 0000:03:00.0: amdgpu: ring comp_1.3.1 uses VM inv eng
11 on hub 0
[    7.393110] amdgpu 0000:03:00.0: amdgpu: ring sdma0 uses VM inv eng 12
on hub 0
[    7.393111] amdgpu 0000:03:00.0: amdgpu: ring sdma1 uses VM inv eng 13
on hub 0
[    7.393112] amdgpu 0000:03:00.0: amdgpu: ring vcn_unified_0 uses VM inv
eng 0 on hub 8
[    7.393113] amdgpu 0000:03:00.0: amdgpu: ring jpeg_dec uses VM inv eng 1
on hub 8
[    7.393114] amdgpu 0000:03:00.0: amdgpu: ring mes_kiq_3.1.0 uses VM inv
eng 14 on hub 0
[    7.398638] usb 1-1.4.3: new full-speed USB device number 8 using
xhci_hcd
[    7.400071] [drm] ring gfx_32768.1.1 was added
[    7.400413] [drm] ring compute_32768.2.2 was added
[    7.400692] [drm] ring sdma_32768.3.3 was added
[    7.400743] [drm] ring gfx_32768.1.1 ib test pass
[    7.400817] [drm] ring compute_32768.2.2 ib test pass
[    7.400856] [drm] ring sdma_32768.3.3 ib test pass
[    7.402200] amdgpu 0000:03:00.0: amdgpu: Using BOCO for runtime pm
[    7.402513] [drm] Initialized amdgpu 3.57.0 20150101 for 0000:03:00.0 on
minor 1
[    7.414495] fbcon: amdgpudrmfb (fb0) is primary device
[    7.415011] [drm] DSC precompute is not needed.
[    7.694009] usb 1-1.3.5: new high-speed USB device number 9 using
xhci_hcd
[    7.712524] usb 1-1.4.3: New USB device found, idVendor=413c,
idProduct=b06e, bcdDevice=d0.34
[    7.712531] usb 1-1.4.3: New USB device strings: Mfr=1, Product=2,
SerialNumber=6
[    7.712532] usb 1-1.4.3: Product: Fischer Cos-2 Controller
[    7.712533] usb 1-1.4.3: Manufacturer: BizLink
[    7.712534] usb 1-1.4.3: SerialNumber: VMM_6.05.000
[    7.751234] hid-generic 0003:413C:B06E.0009: hiddev101,hidraw8: USB HID
v1.11 Device [BizLink Fischer Cos-2 Cont
roller] on usb-0000:08:00.0-1.4.3/input0
[    7.751581] hid-generic 0003:413C:B06E.000A: hiddev102,hidraw9: USB HID
v1.11 Device [BizLink Fischer Cos-2 Cont
roller] on usb-0000:08:00.0-1.4.3/input1
[    7.794365] usb 1-1.3.5: New USB device found, idVendor=2109,
idProduct=8822, bcdDevice= 0.01
[    7.794370] usb 1-1.3.5: New USB device strings: Mfr=1, Product=2,
SerialNumber=3
[    7.794371] usb 1-1.3.5: Product: USB Billboard Device
[    7.794372] usb 1-1.3.5: Manufacturer: VIA Labs, Inc.
[    7.794372] usb 1-1.3.5: SerialNumber: 0000000000000001
[    7.858055] usb 1-1.4.5: new high-speed USB device number 10 using
xhci_hcd
[    7.939203] usb 1-1.4.5: New USB device found, idVendor=2109,
idProduct=8817, bcdDevice= 0.01
[    7.939210] usb 1-1.4.5: New USB device strings: Mfr=1, Product=2,
SerialNumber=3
[    7.939212] usb 1-1.4.5: Product: USB Billboard Device
[    7.939213] usb 1-1.4.5: Manufacturer: VIA Labs, Inc.
[    7.939213] usb 1-1.4.5: SerialNumber: 0000000000000001
[    8.329474] Console: switching to colour frame buffer device 240x67
[    8.347314] amdgpu 0000:03:00.0: [drm] fb0: amdgpudrmfb frame buffer
device
[    8.458935] EXT4-fs (nvme1n1p3): orphan cleanup on readonly fs
[    8.459683] EXT4-fs (nvme1n1p3): mounted filesystem
ac66d86f-a430-4aef-8f35-53cc5f761de5 ro with ordered data mo
de. Quota mode: none.
[    8.611316] systemd-journald[417]: Received SIGTERM from PID 1
(systemd).
[    8.657579] systemd[1]: RTC configured in localtime, applying delta of
-420 minutes to system time.
[    8.660964] systemd[1]: systemd 255.6-1.fc40 running in system mode
(+PAM +AUDIT +SELINUX -APPARMOR +IMA +SMACK
+SECCOMP -GCRYPT +GNUTLS +OPENSSL +ACL +BLKID +CURL +ELFUTILS +FIDO2 +IDN2
-IDN -IPTC +KMOD +LIBCRYPTSETUP +LIBFDIS
K +PCRE2 +PWQUALITY +P11KIT +QRENCODE +TPM2 +BZIP2 +LZ4 +XZ +ZLIB +ZSTD
+BPF_FRAMEWORK +XKBCOMMON +UTMP +SYSVINIT d
efault-hierarchy=unified)
[    8.661466] systemd[1]: Detected architecture x86-64.
[    9.091700] systemd[1]: bpf-lsm: LSM BPF program attached
[    9.160496] zram: Added device: zram0
[    9.279648] systemd[1]: initrd-switch-root.service: Deactivated
successfully.
[    9.280193] systemd[1]: Stopped initrd-switch-root.service - Switch
Root.
[    9.280897] systemd[1]: systemd-journald.service: Scheduled restart job,
restart counter is at 1.
[    9.281039] systemd[1]: Created slice machine.slice - Virtual Machine
and Container Slice.
[    9.282469] systemd[1]: Created slice system-getty.slice - Slice
/system/getty.
[    9.282917] systemd[1]: Created slice system-sshd\x2dkeygen.slice -
Slice /system/sshd-keygen.
[    9.283367] systemd[1]: Created slice system-systemd\x2dfsck.slice -
Slice /system/systemd-fsck.
[    9.283824] systemd[1]: Created slice
system-systemd\x2dzram\x2dsetup.slice - Slice /system/systemd-zram-setup.
[    9.284214] systemd[1]: Created slice user.slice - User and Session
Slice.
[    9.284605] systemd[1]: systemd-ask-password-console.path - Dispatch
Password Requests to Console Directory Watc
h was skipped because of an unmet condition check
(ConditionPathExists=!/run/plymouth/pid).
[    9.284628] systemd[1]: Started systemd-ask-password-wall.path - Forward
Password Requests to Wall Directory Wat
ch.
[    9.285414] systemd[1]: Set up automount
proc-sys-fs-binfmt_misc.automount - Arbitrary Executable File Formats F
ile System Automount Point.
[    9.285877] systemd[1]: Expecting device
dev-disk-by\x2duuid-9BB2\x2dA2C4.device - /dev/disk/by-uuid/9BB2-A2C4..
.
[    9.286402] systemd[1]: Expecting device
dev-disk-by\x2duuid-fcb3c64a\x2d465d\x2d4cb4\x2d8aed\x2d9053ab657adf.de
vice - /dev/disk/by-uuid/fcb3c64a-465d-4cb4-8aed-9053ab657adf...
[    9.286949] systemd[1]: Expecting device dev-zram0.device -
/dev/zram0...
[    9.287230] systemd[1]: Reached target cryptsetup.target - Local
Encrypted Volumes.
[    9.287785] systemd[1]: Stopped target initrd-switch-root.target -
Switch Root.
[    9.288344] systemd[1]: Stopped target initrd-fs.target - Initrd File
Systems.
[    9.288912] systemd[1]: Stopped target initrd-root-fs.target - Initrd
Root File System.
[    9.289195] systemd[1]: Reached target integritysetup.target - Local
Integrity Protected Volumes.
[    9.289778] systemd[1]: Reached target slices.target - Slice Units.
[    9.290341] systemd[1]: Reached target veritysetup.target - Local Verity
Protected Volumes.
[    9.290936] systemd[1]: Listening on dm-event.socket - Device-mapper
event daemon FIFOs.
[    9.291526] systemd[1]: Listening on lvm2-lvmpolld.socket - LVM2 poll
daemon socket.
[    9.293686] systemd[1]: Listening on systemd-coredump.socket - Process
Core Dump Socket.
[    9.294116] systemd[1]: Listening on systemd-initctl.socket - initctl
Compatibility Named Pipe.
[    9.294755] systemd[1]: Listening on systemd-journald-audit.socket -
Journal Audit Socket.
[    9.295284] systemd[1]: Listening on systemd-oomd.socket - Userspace
Out-Of-Memory (OOM) Killer Socket.
[    9.295796] systemd[1]: systemd-pcrextend.socket - TPM2 PCR Extension
(Varlink) was skipped because of an unmet
condition check (ConditionSecurity=measured-uki).
[    9.295939] systemd[1]: Listening on systemd-udevd-control.socket - udev
Control Socket.
[    9.297188] systemd[1]: Listening on systemd-udevd-kernel.socket - udev
Kernel Socket.
[    9.297847] systemd[1]: Listening on systemd-userdbd.socket - User
Database Manager Socket.
[    9.321650] systemd[1]: Mounting dev-hugepages.mount - Huge Pages File
System...
[    9.322189] systemd[1]: Mounting dev-mqueue.mount - POSIX Message Queue
File System...
[    9.322744] systemd[1]: Mounting sys-kernel-debug.mount - Kernel Debug
File System...
[    9.323350] systemd[1]: Mounting sys-kernel-tracing.mount - Kernel Trace
File System...
[    9.323853] systemd[1]: auth-rpcgss-module.service - Kernel Module
supporting RPCSEC_GSS was skipped because of
an unmet condition check (ConditionPathExists=/etc/krb5.keytab).
[    9.324090] systemd[1]: iscsi-starter.service was skipped because of an
unmet condition check (ConditionDirector
yNotEmpty=/var/lib/iscsi/nodes).
[    9.325356] systemd[1]: Starting kmod-static-nodes.service - Create List
of Static Device Nodes...
[    9.326237] systemd[1]: Starting lvm2-monitor.service - Monitoring of
LVM2 mirrors, snapshots etc. using dmevent
d or progress polling...
[    9.327103] systemd[1]: Starting modprobe@configfs.service - Load Kernel
Module configfs...
[    9.327919] systemd[1]: Starting modprobe@dm_mod.service - Load Kernel
Module dm_mod...
[    9.328728] systemd[1]: Starting modprobe@dm_multipath.service - Load
Kernel Module dm_multipath...
[    9.329514] systemd[1]: Starting modprobe@drm.service - Load Kernel
Module drm...
[    9.330866] systemd[1]: Starting modprobe@efi_pstore.service - Load
Kernel Module efi_pstore...
[    9.331520] systemd[1]: Starting modprobe@fuse.service - Load Kernel
Module fuse...
[    9.332337] systemd[1]: Starting modprobe@loop.service - Load Kernel
Module loop...
[    9.332882] systemd[1]: plymouth-switch-root.service: Deactivated
successfully.
[    9.332899] systemd[1]: Stopped plymouth-switch-root.service - Plymouth
switch root service.
[    9.334469] systemd[1]: Starting systemd-journald.service - Journal
Service...
[    9.335342] systemd[1]: Starting systemd-modules-load.service - Load
Kernel Modules...
[    9.336015] systemd[1]: Starting systemd-network-generator.service -
Generate network units from Kernel command
line...
[    9.336474] systemd[1]: systemd-pcrmachine.service - TPM2 PCR Machine ID
Measurement was skipped because of an u
nmet condition check (ConditionSecurity=measured-uki).
[    9.336677] loop: module loaded
[    9.336934] systemd[1]: Starting systemd-remount-fs.service - Remount
Root and Kernel File Systems...
[    9.337602] systemd[1]: systemd-tpm2-setup-early.service - TPM2 SRK
Setup (Early) was skipped because of an unme
t condition check (ConditionSecurity=measured-uki).
[    9.337915] systemd[1]: Starting systemd-udev-trigger.service - Coldplug
All udev Devices...
[    9.338943] systemd[1]: Mounted dev-hugepages.mount - Huge Pages File
System.
[    9.339496] systemd[1]: Mounted dev-mqueue.mount - POSIX Message Queue
File System.
[    9.340036] systemd[1]: Mounted sys-kernel-debug.mount - Kernel Debug
File System.
[    9.340565] systemd[1]: Mounted sys-kernel-tracing.mount - Kernel Trace
File System.
[    9.341152] systemd[1]: Finished kmod-static-nodes.service - Create List
of Static Device Nodes.
[    9.341689] systemd[1]: modprobe@configfs.service: Deactivated
successfully.
[    9.341737] systemd[1]: Finished modprobe@configfs.service - Load Kernel
Module configfs.
[    9.342329] systemd-journald[835]: Collecting audit messages is enabled.
[    9.342889] systemd[1]: modprobe@dm_mod.service: Deactivated
successfully.
[    9.342929] systemd[1]: Finished modprobe@dm_mod.service - Load Kernel
Module dm_mod.
[    9.343610] audit: type=1130 audit(1715821299.818:2): pid=1 uid=0
auid=4294967295 ses=4294967295 msg='unit=modpr
obe@dm_mod comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=?
terminal=? res=success'
[    9.343614] audit: type=1131 audit(1715821299.818:3): pid=1 uid=0
auid=4294967295 ses=4294967295 msg='unit=modpr
obe@dm_mod comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=?
terminal=? res=success'
[    9.343781] systemd[1]: modprobe@dm_multipath.service: Deactivated
successfully.
[    9.343848] systemd[1]: Finished modprobe@dm_multipath.service - Load
Kernel Module dm_multipath.
[    9.344923] audit: type=1130 audit(1715821299.820:4): pid=1 uid=0
auid=4294967295 ses=4294967295 msg='unit=modpr
obe@dm_multipath comm="systemd" exe="/usr/lib/systemd/systemd" hostname=?
addr=? terminal=? res=success'
[    9.344926] audit: type=1131 audit(1715821299.820:5): pid=1 uid=0
auid=4294967295 ses=4294967295 msg='unit=modpr
obe@dm_multipath comm="systemd" exe="/usr/lib/systemd/systemd" hostname=?
addr=? terminal=? res=success'
[    9.344956] systemd[1]: Started systemd-journald.service - Journal
Service.
[    9.345971] audit: type=1130 audit(1715821299.821:6): pid=1 uid=0
auid=4294967295 ses=4294967295 msg='unit=syste
md-journald comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=?
terminal=? res=success'
[    9.347022] audit: type=1130 audit(1715821299.822:7): pid=1 uid=0
auid=4294967295 ses=4294967295 msg='unit=modpr
obe@drm comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=?
terminal=? res=success'
[    9.347023] audit: type=1131 audit(1715821299.822:8): pid=1 uid=0
auid=4294967295 ses=4294967295 msg='unit=modpr
obe@drm comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=?
terminal=? res=success'
[    9.347996] audit: type=1130 audit(1715821299.823:9): pid=1 uid=0
auid=4294967295 ses=4294967295 msg='unit=modpr
obe@efi_pstore comm="systemd" exe="/usr/lib/systemd/systemd" hostname=?
addr=? terminal=? res=success'
[    9.347997] audit: type=1131 audit(1715821299.823:10): pid=1 uid=0
auid=4294967295 ses=4294967295 msg='unit=modp
robe@efi_pstore comm="systemd" exe="/usr/lib/systemd/systemd" hostname=?
addr=? terminal=? res=success'
[    9.349155] audit: type=1130 audit(1715821299.824:11): pid=1 uid=0
auid=4294967295 ses=4294967295 msg='unit=modp
robe@fuse comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=?
terminal=? res=success'
[    9.354876] EXT4-fs (nvme1n1p3): re-mounted
ac66d86f-a430-4aef-8f35-53cc5f761de5 r/w. Quota mode: none.
[    9.361692] systemd-journald[835]: Received client request to flush
runtime journal.
[    9.375140] systemd-journald[835]:
/var/log/journal/214fcfb5b9274988845afbe1b019c79e/system.journal: Realtime
cl
ock jumped backwards relative to last journal entry, rotating.
[    9.375487] systemd-journald[835]: Rotating system journal.
[    9.451133] zram0: detected capacity change from 0 to 16777216
[    9.469048] acpi-tad ACPI000E:00: Missing _PRW
[    9.474318] Adding 8388604k swap on /dev/zram0.  Priority:100 extents:1
across:8388604k SSDsc
[    9.492888] piix4_smbus 0000:00:14.0: SMBus Host Controller at 0xb00,
revision 0
[    9.493443] piix4_smbus 0000:00:14.0: Using register 0x02 for SMBus port
selection
[    9.494576] piix4_smbus 0000:00:14.0: Auxiliary SMBus Host Controller at
0xb20
[    9.508490] mc: Linux media interface: v0.10
[    9.509071] input: PC Speaker as /devices/platform/pcspkr/input/input19
[    9.600483] EXT4-fs (nvme1n1p2): mounted filesystem
fcb3c64a-465d-4cb4-8aed-9053ab657adf r/w with ordered data m
ode. Quota mode: none.
[    9.629362] dcdbas dcdbas: Dell Systems Management Base Driver (version
5.6.0-3.4)
[    9.630478] usbcore: registered new interface driver cdc_ether
[    9.634317] dell_smbios: Unable to run on non-Dell system
[    9.637048] RAPL PMU: API unit is 2^-32 Joules, 1 fixed counters, 163840
ms ovfl timer
[    9.637446] RAPL PMU: hw unit of domain package 2^-16 Joules
[    9.651937] Bluetooth: Core ver 2.22
[    9.652919] NET: Registered PF_BLUETOOTH protocol family
[    9.653399] Bluetooth: HCI device and connection manager initialized
[    9.653402] Bluetooth: HCI socket layer initialized
[    9.653403] Bluetooth: L2CAP socket layer initialized
[    9.653407] Bluetooth: SCO socket layer initialized
[    9.656392] videodev: Linux video capture interface: v2.00
[    9.697105] cfg80211: Loading compiled-in X.509 certificates for
regulatory database
[    9.697230] Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[    9.697307] Loaded X.509 cert 'wens:
61c038651aabdcf94bd0ac7ff06c7248db18c600'
[    9.699673] cdc_ncm 2-1.4.1:1.5: MAC-Address: 0c:37:96:8e:22:a8
[    9.699676] cdc_ncm 2-1.4.1:1.5: setting rx_max = 16384
[    9.699897] cdc_ncm 2-1.4.1:1.5: setting tx_max = 16384
[    9.699985] cdc_ncm 2-1.4.1:1.5 eth0: register 'cdc_ncm' at
usb-0000:08:00.0-1.4.1, CDC NCM (SEND ZLP), 0c:37:96
:8e:22:a8
[    9.700006] usbcore: registered new interface driver cdc_ncm
[    9.742702] usbcore: registered new interface driver cdc_wdm
[    9.768748] usbcore: registered new interface driver cdc_mbim
[    9.771438] cdc_ncm 2-1.4.1:1.5 enp8s0u1u4u1i5: renamed from eth0
[    9.777114] Intel(R) Wireless WiFi driver for Linux
[    9.777191] usbcore: registered new interface driver btusb
[    9.779916] Bluetooth: hci0: Device revision is 0
[    9.782453] Bluetooth: hci0: Secure boot is enabled
[    9.782454] Bluetooth: hci0: OTP lock is enabled
[    9.782455] Bluetooth: hci0: API lock is enabled
[    9.782455] Bluetooth: hci0: Debug lock is disabled
[    9.782455] Bluetooth: hci0: Minimum firmware build 1 week 10 2014
[    9.782456] Bluetooth: hci0: Bootloader timestamp 2019.40 buildtype 1
build 38
[    9.782465] Bluetooth: hci0: No dsm support to set reset delay
[    9.784373] iwlwifi 0000:09:00.0: Detected crf-id 0x400410, cnv-id
0x400410 wfpm id 0x80000000
[    9.784519] iwlwifi 0000:09:00.0: PCI dev 2725/0020, rev=0x420,
rfid=0x10d000
[    9.785125] iwlwifi 0000:09:00.0: Direct firmware load for
iwlwifi-ty-a0-gf-a0-89.ucode failed with error -2
[    9.785142] iwlwifi 0000:09:00.0: Direct firmware load for
iwlwifi-ty-a0-gf-a0-88.ucode failed with error -2
[    9.785515] iwlwifi 0000:09:00.0: Direct firmware load for
iwlwifi-ty-a0-gf-a0-87.ucode failed with error -2
[    9.794890] kvm_amd: TSC scaling supported
[    9.795465] kvm_amd: Nested Virtualization enabled
[    9.795788] kvm_amd: Nested Paging enabled
[    9.796075] kvm_amd: Virtual VMLOAD VMSAVE supported
[    9.796076] kvm_amd: Virtual GIF supported
[    9.796077] kvm_amd: Virtual NMI enabled
[    9.796077] kvm_amd: LBR virtualization supported
[    9.803216] usb 7-1: Found UVC 1.10 device Integrated_Webcam_FHD
(0bda:555a)
[    9.804962] Bluetooth: hci0: Found device firmware:
intel/ibt-0041-0041.sfi
[    9.804969] Bluetooth: hci0: Boot Address: 0x100800
[    9.804970] Bluetooth: hci0: Firmware Version: 123-8.24
[    9.805517] RPC: Registered named UNIX socket transport module.
[    9.806537] RPC: Registered udp transport module.
[    9.806537] RPC: Registered tcp transport module.
[    9.806538] RPC: Registered tcp-with-tls transport module.
[    9.806538] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    9.811120] iwlwifi 0000:09:00.0: TLV_FW_FSEQ_VERSION: FSEQ Version:
0.0.2.41
[    9.811337] usb 7-1: Found UVC 1.50 device Integrated_Webcam_FHD
(0bda:555a)
[    9.811766] iwlwifi 0000:09:00.0: loaded firmware version 86.fb5c9aeb.0
ty-a0-gf-a0-86.ucode op_mode iwlmvm
[    9.813556] usbcore: registered new interface driver uvcvideo
[    9.813726] MCE: In-kernel MCE decoding enabled.
[    9.821264] snd_hda_intel 0000:03:00.1: Force to non-snoop mode
[    9.821707] snd_hda_intel 0000:0c:00.6: enabling device (0001 -> 0003)
[    9.837156] usb 2-1.4.1: Warning! Unlikely big volume range (=767),
cval->res is probably wrong.
[    9.837325] usb 2-1.4.1: [4] FU [Mic Capture Volume] ch = 2, val =
-4592/7680/16
[    9.839586] snd_hda_intel 0000:03:00.1: bound 0000:03:00.0 (ops
amdgpu_dm_audio_component_bind_ops [amdgpu])
[    9.840446] snd_hda_codec_hdmi hdaudioC1D0: HDMI: Unknown ELD version 0
[    9.842413] usb 2-1.4.1: Warning! Unlikely big volume range (=672),
cval->res is probably wrong.
[    9.842662] usb 2-1.4.1: [7] FU [Dell USB Audio Playback Volume] ch = 6,
val = -10752/0/16
[    9.842974] usbcore: registered new interface driver snd-usb-audio
[    9.843252] input: HDA ATI HDMI HDMI/DP,pcm=3 as
/devices/pci0000:00/0000:00:01.1/0000:01:00.0/0000:02:00.0/0000
:03:00.1/sound/card1/input20
[    9.843546] input: HDA ATI HDMI HDMI/DP,pcm=7 as
/devices/pci0000:00/0000:00:01.1/0000:01:00.0/0000:02:00.0/0000
:03:00.1/sound/card1/input21
[    9.843839] input: HDA ATI HDMI HDMI/DP,pcm=8 as
/devices/pci0000:00/0000:00:01.1/0000:01:00.0/0000:02:00.0/0000
:03:00.1/sound/card1/input22
[    9.843858] input: HDA ATI HDMI HDMI/DP,pcm=9 as
/devices/pci0000:00/0000:00:01.1/0000:01:00.0/0000:02:00.0/0000
:03:00.1/sound/card1/input23
[    9.846956] intel_rapl_common: Found RAPL domain package
[    9.847525] intel_rapl_common: Found RAPL domain core
[    9.848657] AMD Address Translation Library initialized
[    9.850663] snd_hda_codec_realtek hdaudioC2D0: autoconfig for ALC3254:
line_outs=1 (0x14/0x0/0x0/0x0/0x0) type:s
peaker
[    9.851200] snd_hda_codec_realtek hdaudioC2D0:    speaker_outs=0
(0x0/0x0/0x0/0x0/0x0)
[    9.851440] snd_hda_codec_realtek hdaudioC2D0:    hp_outs=1
(0x21/0x0/0x0/0x0/0x0)
[    9.851673] snd_hda_codec_realtek hdaudioC2D0:    mono: mono_out=0x0
[    9.851897] snd_hda_codec_realtek hdaudioC2D0:    inputs:
[    9.851903] snd_hda_codec_realtek hdaudioC2D0:      Headset Mic=0x19
[    9.852344] snd_hda_codec_realtek hdaudioC2D0:      Headphone Mic=0x1b
[    9.969483] iwlwifi 0000:09:00.0: Detected Intel(R) Wi-Fi 6 AX210
160MHz, REV=0x420
[    9.969825] thermal thermal_zone1: failed to read out thermal zone (-61)
[    9.977778] iwlwifi 0000:09:00.0: WRT: Invalid buffer destination
[    9.995463] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
[    9.995465] Bluetooth: BNEP filters: protocol multicast
[    9.995467] Bluetooth: BNEP socket layer initialized
[   10.159967] iwlwifi 0000:09:00.0: WFPM_UMAC_PD_NOTIFICATION: 0x20
[   10.160446] iwlwifi 0000:09:00.0: WFPM_LMAC2_PD_NOTIFICATION: 0x1f
[   10.160799] iwlwifi 0000:09:00.0: WFPM_AUTH_KEY_0: 0x90
[   10.160958] iwlwifi 0000:09:00.0: CNVI_SCU_SEQ_DATA_DW9: 0x0
[   10.161921] iwlwifi 0000:09:00.0: loaded PNVM version e28bb9d7
[   10.179392] iwlwifi 0000:09:00.0: Detected RF GF, rfid=0x10d000
[   10.254031] iwlwifi 0000:09:00.0: base HW address: 3c:e9:f7:76:8a:31
[   10.272636] iwlwifi 0000:09:00.0 wlp9s0: renamed from wlan0
[   10.322639] RTL8226B_RTL8221B 2.5Gbps PHY r8169-0-b00:00: attached PHY
driver (mii_bus:phy_addr=r8169-0-b00:00,
irq=MAC)
[   10.338147] NET: Registered PF_QIPCRTR protocol family
[   10.475717] ACPI: button: The lid device is not compliant to SW_LID.
[   10.477680] r8169 0000:0b:00.0 enp11s0: No native access to PCI extended
config space, falling back to CSI
[   10.500821] r8169 0000:0b:00.0 enp11s0: Link is Down
[   10.514558] input: HD-Audio Generic Headphone Mic as
/devices/pci0000:00/0000:00:08.1/0000:0c:00.6/sound/card2/i
nput24
[   10.523495] iwlwifi 0000:09:00.0: WRT: Invalid buffer destination
[   10.701002] iwlwifi 0000:09:00.0: WFPM_UMAC_PD_NOTIFICATION: 0x20
[   10.701165] iwlwifi 0000:09:00.0: WFPM_LMAC2_PD_NOTIFICATION: 0x1f
[   10.701319] iwlwifi 0000:09:00.0: WFPM_AUTH_KEY_0: 0x90
[   10.701472] iwlwifi 0000:09:00.0: CNVI_SCU_SEQ_DATA_DW9: 0x0
[   10.805456] iwlwifi 0000:09:00.0: Registered PHC clock: iwlwifi-PTP,
with index: 0
[   10.851430] iwlwifi 0000:09:00.0: WRT: Invalid buffer destination
[   10.989031] Bluetooth: hci0: Waiting for firmware download to complete
[   10.989962] Bluetooth: hci0: Firmware loaded in 1157230 usecs
[   10.990656] Bluetooth: hci0: Waiting for device to boot
[   11.017902] Bluetooth: hci0: Device booted in 26792 usecs
[   11.017904] Bluetooth: hci0: Malformed MSFT vendor event: 0x02
[   11.018324] Bluetooth: hci0: Found Intel DDC parameters:
intel/ibt-0041-0041.ddc
[   11.023855] Bluetooth: hci0: Applying Intel DDC parameters completed
[   11.030508] iwlwifi 0000:09:00.0: WFPM_UMAC_PD_NOTIFICATION: 0x20
[   11.030891] Bluetooth: hci0: Firmware timestamp 2024.8 buildtype 1 build
79483
[   11.031134] iwlwifi 0000:09:00.0: WFPM_LMAC2_PD_NOTIFICATION: 0x1f
[   11.031249] Bluetooth: hci0: Firmware SHA1: 0x7c7b67b9
[   11.031469] iwlwifi 0000:09:00.0: WFPM_AUTH_KEY_0: 0x90
[   11.031950] iwlwifi 0000:09:00.0: CNVI_SCU_SEQ_DATA_DW9: 0x0
[   11.040871] Bluetooth: hci0: Fseq status: Success (0x00)
[   11.041154] Bluetooth: hci0: Fseq executed: 00.00.02.41
[   11.041350] Bluetooth: hci0: Fseq BT Top: 00.00.02.41
[   11.215035] Bluetooth: MGMT ver 1.22
[   13.921396] wlp9s0: authenticate with 60:38:e0:b4:65:d9 (local
address=e2:60:6e:a9:c6:8b)
[   13.923601] wlp9s0: send auth to 60:38:e0:b4:65:d9 (try 1/3)
[   13.968543] wlp9s0: authenticated
[   13.969656] wlp9s0: associate with 60:38:e0:b4:65:d9 (try 1/3)
[   14.001468] wlp9s0: RX AssocResp from 60:38:e0:b4:65:d9 (capab=0x431
status=0 aid=1)
[   14.026019] wlp9s0: associated
[   64.826512] systemd-journald[835]:
/var/log/journal/214fcfb5b9274988845afbe1b019c79e/user-1000.journal:
Journal
file uses a different sequence number ID, rotating.
[   68.860979] Bluetooth: RFCOMM TTY layer initialized
[   68.860985] Bluetooth: RFCOMM socket layer initialized
[   68.860987] Bluetooth: RFCOMM ver 1.11
[   69.102940] warning: `QSampleCache::L' uses wireless extensions which
will stop working for Wi-Fi 7 hardware; us
e nl80211
[   69.604620] block nvme0n1: No UUID available providing old NGUID
[  319.706441] wlp9s0: disconnect from AP 60:38:e0:b4:65:d9 for new auth to
60:38:e0:b4:65:da
[  319.758285] wlp9s0: authenticate with 60:38:e0:b4:65:da (local
address=e2:60:6e:a9:c6:8b)
[  319.761043] wlp9s0: send auth to 60:38:e0:b4:65:da (try 1/3)
[  319.796414] wlp9s0: authenticated
[  319.797691] wlp9s0: associate with 60:38:e0:b4:65:da (try 1/3)
[  319.817370] wlp9s0: RX ReassocResp from 60:38:e0:b4:65:da (capab=0x11
status=0 aid=4)
[  319.837484] wlp9s0: associated
[11017.090328] gmc_v11_0_process_interrupt: 45 callbacks suppressed
[11017.090332] amdgpu 0000:03:00.0: amdgpu: [mmhub] page fault (src_id:0
ring:40 vmid:1 pasid:32813)
[11017.090337] amdgpu 0000:03:00.0: amdgpu:  in process RDD Process pid
3989 thread firefox:cs0 pid 6856)
[11017.090338] amdgpu 0000:03:00.0: amdgpu:   in page starting at address
0x0000000000005000 from client 18
[11017.090340] amdgpu 0000:03:00.0: amdgpu:
MMVM_L2_PROTECTION_FAULT_STATUS:0x00142851
[11017.090341] amdgpu 0000:03:00.0: amdgpu:      Faulty UTCL2 client ID:
VCN0 (0x14)
[11017.090342] amdgpu 0000:03:00.0: amdgpu:      MORE_FAULTS: 0x1
[11017.090343] amdgpu 0000:03:00.0: amdgpu:      WALKER_ERROR: 0x0
[11017.090343] amdgpu 0000:03:00.0: amdgpu:      PERMISSION_FAULTS: 0x5
[11017.090344] amdgpu 0000:03:00.0: amdgpu:      MAPPING_ERROR: 0x0
[11017.090344] amdgpu 0000:03:00.0: amdgpu:      RW: 0x1
[11017.090347] amdgpu 0000:03:00.0: amdgpu: [mmhub] page fault (src_id:0
ring:40 vmid:1 pasid:32813)
[11017.090348] amdgpu 0000:03:00.0: amdgpu:  in process RDD Process pid
3989 thread firefox:cs0 pid 6856)
[11017.090349] amdgpu 0000:03:00.0: amdgpu:   in page starting at address
0x0000000000009000 from client 18
[11017.090349] amdgpu 0000:03:00.0: amdgpu:
MMVM_L2_PROTECTION_FAULT_STATUS:0x00000000
[11017.090350] amdgpu 0000:03:00.0: amdgpu:      Faulty UTCL2 client ID:
VMC (0x0)
[11017.090351] amdgpu 0000:03:00.0: amdgpu:      MORE_FAULTS: 0x0
[11017.090351] amdgpu 0000:03:00.0: amdgpu:      WALKER_ERROR: 0x0
[11017.090352] amdgpu 0000:03:00.0: amdgpu:      PERMISSION_FAULTS: 0x0
[11017.090353] amdgpu 0000:03:00.0: amdgpu:      MAPPING_ERROR: 0x0
[11017.090353] amdgpu 0000:03:00.0: amdgpu:      RW: 0x0
[11017.090355] amdgpu 0000:03:00.0: amdgpu: [mmhub] page fault (src_id:0
ring:40 vmid:1 pasid:32813)
[11017.090356] amdgpu 0000:03:00.0: amdgpu:  in process RDD Process pid
3989 thread firefox:cs0 pid 6856)
[11017.090357] amdgpu 0000:03:00.0: amdgpu:   in page starting at address
0x000000000000d000 from client 18
[11017.090358] amdgpu 0000:03:00.0: amdgpu:
MMVM_L2_PROTECTION_FAULT_STATUS:0x00000000
[11017.090358] amdgpu 0000:03:00.0: amdgpu:      Faulty UTCL2 client ID:
VMC (0x0)
[11017.090359] amdgpu 0000:03:00.0: amdgpu:      MORE_FAULTS: 0x0
[11017.090359] amdgpu 0000:03:00.0: amdgpu:      WALKER_ERROR: 0x0
[11017.090360] amdgpu 0000:03:00.0: amdgpu:      PERMISSION_FAULTS: 0x0
[11017.090360] amdgpu 0000:03:00.0: amdgpu:      MAPPING_ERROR: 0x0
[11017.090361] amdgpu 0000:03:00.0: amdgpu:      RW: 0x0
[11017.090363] amdgpu 0000:03:00.0: amdgpu: [mmhub] page fault (src_id:0
ring:40 vmid:1 pasid:32813)
[11017.090364] amdgpu 0000:03:00.0: amdgpu:  in process RDD Process pid
3989 thread firefox:cs0 pid 6856)
[11017.090365] amdgpu 0000:03:00.0: amdgpu:   in page starting at address
0x0000000000011000 from client 18
[11017.090365] amdgpu 0000:03:00.0: amdgpu:
MMVM_L2_PROTECTION_FAULT_STATUS:0x00000000
[11017.090366] amdgpu 0000:03:00.0: amdgpu:      Faulty UTCL2 client ID:
VMC (0x0)
[11017.090367] amdgpu 0000:03:00.0: amdgpu:      MORE_FAULTS: 0x0
[11017.090367] amdgpu 0000:03:00.0: amdgpu:      WALKER_ERROR: 0x0
[11017.090368] amdgpu 0000:03:00.0: amdgpu:      PERMISSION_FAULTS: 0x0
[11017.090368] amdgpu 0000:03:00.0: amdgpu:      MAPPING_ERROR: 0x0
[11017.090369] amdgpu 0000:03:00.0: amdgpu:      RW: 0x0
[11017.090371] amdgpu 0000:03:00.0: amdgpu: [mmhub] page fault (src_id:0
ring:40 vmid:1 pasid:32813)
[11017.090371] amdgpu 0000:03:00.0: amdgpu:  in process RDD Process pid
3989 thread firefox:cs0 pid 6856)
[11017.090372] amdgpu 0000:03:00.0: amdgpu:   in page starting at address
0x0000000000015000 from client 18
[11017.090373] amdgpu 0000:03:00.0: amdgpu:
MMVM_L2_PROTECTION_FAULT_STATUS:0x00000000
[11017.090373] amdgpu 0000:03:00.0: amdgpu:      Faulty UTCL2 client ID:
VMC (0x0)
[11017.090374] amdgpu 0000:03:00.0: amdgpu:      MORE_FAULTS: 0x0
[11017.090374] amdgpu 0000:03:00.0: amdgpu:      WALKER_ERROR: 0x0
[11017.090375] amdgpu 0000:03:00.0: amdgpu:      PERMISSION_FAULTS: 0x0
[11017.090376] amdgpu 0000:03:00.0: amdgpu:      MAPPING_ERROR: 0x0
[11017.090376] amdgpu 0000:03:00.0: amdgpu:      RW: 0x0
[11017.090378] amdgpu 0000:03:00.0: amdgpu: [mmhub] page fault (src_id:0
ring:40 vmid:1 pasid:32813)
[11017.090379] amdgpu 0000:03:00.0: amdgpu:  in process RDD Process pid
3989 thread firefox:cs0 pid 6856)
[11017.090380] amdgpu 0000:03:00.0: amdgpu:   in page starting at address
0x0000000000019000 from client 18
[11017.090380] amdgpu 0000:03:00.0: amdgpu:
MMVM_L2_PROTECTION_FAULT_STATUS:0x00000000
[11017.090381] amdgpu 0000:03:00.0: amdgpu:      Faulty UTCL2 client ID:
VMC (0x0)
[11017.090381] amdgpu 0000:03:00.0: amdgpu:      MORE_FAULTS: 0x0
[11017.090382] amdgpu 0000:03:00.0: amdgpu:      WALKER_ERROR: 0x0
[11017.090382] amdgpu 0000:03:00.0: amdgpu:      PERMISSION_FAULTS: 0x0
[11017.090383] amdgpu 0000:03:00.0: amdgpu:      MAPPING_ERROR: 0x0
[11017.090383] amdgpu 0000:03:00.0: amdgpu:      RW: 0x0
[11017.090385] amdgpu 0000:03:00.0: amdgpu: [mmhub] page fault (src_id:0
ring:40 vmid:1 pasid:32813)
[11017.090386] amdgpu 0000:03:00.0: amdgpu:  in process RDD Process pid
3989 thread firefox:cs0 pid 6856)
[11017.090387] amdgpu 0000:03:00.0: amdgpu:   in page starting at address
0x000000000001d000 from client 18
[11017.090388] amdgpu 0000:03:00.0: amdgpu:
MMVM_L2_PROTECTION_FAULT_STATUS:0x00000000
[11017.090388] amdgpu 0000:03:00.0: amdgpu:      Faulty UTCL2 client ID:
VMC (0x0)
[11017.090389] amdgpu 0000:03:00.0: amdgpu:      MORE_FAULTS: 0x0
[11017.090389] amdgpu 0000:03:00.0: amdgpu:      WALKER_ERROR: 0x0
[11017.090390] amdgpu 0000:03:00.0: amdgpu:      PERMISSION_FAULTS: 0x0
[11017.090390] amdgpu 0000:03:00.0: amdgpu:      MAPPING_ERROR: 0x0
[11017.090391] amdgpu 0000:03:00.0: amdgpu:      RW: 0x0
[11017.090393] amdgpu 0000:03:00.0: amdgpu: [mmhub] page fault (src_id:0
ring:40 vmid:1 pasid:32813)
[11017.090394] amdgpu 0000:03:00.0: amdgpu:  in process RDD Process pid
3989 thread firefox:cs0 pid 6856)
[11017.090394] amdgpu 0000:03:00.0: amdgpu:   in page starting at address
0x0000000000021000 from client 18
[11017.090395] amdgpu 0000:03:00.0: amdgpu:
MMVM_L2_PROTECTION_FAULT_STATUS:0x00000000
[11017.090396] amdgpu 0000:03:00.0: amdgpu:      Faulty UTCL2 client ID:
VMC (0x0)
[11017.090396] amdgpu 0000:03:00.0: amdgpu:      MORE_FAULTS: 0x0
[11017.090397] amdgpu 0000:03:00.0: amdgpu:      WALKER_ERROR: 0x0
[11017.090397] amdgpu 0000:03:00.0: amdgpu:      PERMISSION_FAULTS: 0x0
[11017.090398] amdgpu 0000:03:00.0: amdgpu:      MAPPING_ERROR: 0x0
[11017.090398] amdgpu 0000:03:00.0: amdgpu:      RW: 0x0
[11017.090400] amdgpu 0000:03:00.0: amdgpu: [mmhub] page fault (src_id:0
ring:40 vmid:1 pasid:32813)
[11017.090401] amdgpu 0000:03:00.0: amdgpu:  in process RDD Process pid
3989 thread firefox:cs0 pid 6856)
[11017.090402] amdgpu 0000:03:00.0: amdgpu:   in page starting at address
0x0000000000025000 from client 18
[11017.090402] amdgpu 0000:03:00.0: amdgpu:
MMVM_L2_PROTECTION_FAULT_STATUS:0x00000000
[11017.090403] amdgpu 0000:03:00.0: amdgpu:      Faulty UTCL2 client ID:
VMC (0x0)
[11017.090404] amdgpu 0000:03:00.0: amdgpu:      MORE_FAULTS: 0x0
[11017.090404] amdgpu 0000:03:00.0: amdgpu:      WALKER_ERROR: 0x0
[11017.090405] amdgpu 0000:03:00.0: amdgpu:      PERMISSION_FAULTS: 0x0
[11017.090405] amdgpu 0000:03:00.0: amdgpu:      MAPPING_ERROR: 0x0
[11017.090406] amdgpu 0000:03:00.0: amdgpu:      RW: 0x0
[11017.090408] amdgpu 0000:03:00.0: amdgpu: [mmhub] page fault (src_id:0
ring:40 vmid:1 pasid:32813)
[11017.090408] amdgpu 0000:03:00.0: amdgpu:  in process RDD Process pid
3989 thread firefox:cs0 pid 6856)
[11017.090409] amdgpu 0000:03:00.0: amdgpu:   in page starting at address
0x0000000000029000 from client 18
[11017.090410] amdgpu 0000:03:00.0: amdgpu:
MMVM_L2_PROTECTION_FAULT_STATUS:0x00000000
[11017.090410] amdgpu 0000:03:00.0: amdgpu:      Faulty UTCL2 client ID:
VMC (0x0)
[11017.090411] amdgpu 0000:03:00.0: amdgpu:      MORE_FAULTS: 0x0
[11017.090411] amdgpu 0000:03:00.0: amdgpu:      WALKER_ERROR: 0x0
[11017.090412] amdgpu 0000:03:00.0: amdgpu:      PERMISSION_FAULTS: 0x0
[11017.090412] amdgpu 0000:03:00.0: amdgpu:      MAPPING_ERROR: 0x0
[11017.090413] amdgpu 0000:03:00.0: amdgpu:      RW: 0x0
[11022.107770] gmc_v11_0_process_interrupt: 209702 callbacks suppressed
[11022.107772] amdgpu 0000:03:00.0: amdgpu: [mmhub] page fault (src_id:0
ring:40 vmid:1 pasid:32813)
[11022.107776] amdgpu 0000:03:00.0: amdgpu:  in process RDD Process pid
3989 thread firefox:cs0 pid 6856)
[11022.107778] amdgpu 0000:03:00.0: amdgpu:   in page starting at address
0x0000000000009000 from client 18
[11022.107779] amdgpu 0000:03:00.0: amdgpu:
MMVM_L2_PROTECTION_FAULT_STATUS:0x00142851
[11022.107780] amdgpu 0000:03:00.0: amdgpu:      Faulty UTCL2 client ID:
VCN0 (0x14)
[11022.107781] amdgpu 0000:03:00.0: amdgpu:      MORE_FAULTS: 0x1
[11022.107781] amdgpu 0000:03:00.0: amdgpu:      WALKER_ERROR: 0x0
[11022.107782] amdgpu 0000:03:00.0: amdgpu:      PERMISSION_FAULTS: 0x5
[11022.107782] amdgpu 0000:03:00.0: amdgpu:      MAPPING_ERROR: 0x0
[11022.107783] amdgpu 0000:03:00.0: amdgpu:      RW: 0x1
[11022.107785] amdgpu 0000:03:00.0: amdgpu: [mmhub] page fault (src_id:0
ring:40 vmid:1 pasid:32813)
[11022.107786] amdgpu 0000:03:00.0: amdgpu:  in process RDD Process pid
3989 thread firefox:cs0 pid 6856)
[11022.107786] amdgpu 0000:03:00.0: amdgpu:   in page starting at address
0x000000000000d000 from client 18
[11022.107787] amdgpu 0000:03:00.0: amdgpu:
MMVM_L2_PROTECTION_FAULT_STATUS:0x00000000
[11022.107788] amdgpu 0000:03:00.0: amdgpu:      Faulty UTCL2 client ID:
VMC (0x0)
[11022.107788] amdgpu 0000:03:00.0: amdgpu:      MORE_FAULTS: 0x0
[11022.107789] amdgpu 0000:03:00.0: amdgpu:      WALKER_ERROR: 0x0
[11022.107789] amdgpu 0000:03:00.0: amdgpu:      PERMISSION_FAULTS: 0x0
[11022.107790] amdgpu 0000:03:00.0: amdgpu:      MAPPING_ERROR: 0x0
[11022.107790] amdgpu 0000:03:00.0: amdgpu:      RW: 0x0
[11022.107792] amdgpu 0000:03:00.0: amdgpu: [mmhub] page fault (src_id:0
ring:40 vmid:1 pasid:32813)
[11022.107793] amdgpu 0000:03:00.0: amdgpu:  in process RDD Process pid
3989 thread firefox:cs0 pid 6856)
[11022.107793] amdgpu 0000:03:00.0: amdgpu:   in page starting at address
0x0000000000011000 from client 18
[11022.107794] amdgpu 0000:03:00.0: amdgpu:
MMVM_L2_PROTECTION_FAULT_STATUS:0x00000000
[11022.107794] amdgpu 0000:03:00.0: amdgpu:      Faulty UTCL2 client ID:
VMC (0x0)
[11022.107795] amdgpu 0000:03:00.0: amdgpu:      MORE_FAULTS: 0x0
[11022.107795] amdgpu 0000:03:00.0: amdgpu:      WALKER_ERROR: 0x0
[11022.107795] amdgpu 0000:03:00.0: amdgpu:      PERMISSION_FAULTS: 0x0
[11022.107796] amdgpu 0000:03:00.0: amdgpu:      MAPPING_ERROR: 0x0
[11022.107796] amdgpu 0000:03:00.0: amdgpu:      RW: 0x0
[11022.107801] amdgpu 0000:03:00.0: amdgpu: [mmhub] page fault (src_id:0
ring:40 vmid:1 pasid:32813)
[11022.107801] amdgpu 0000:03:00.0: amdgpu:  in process RDD Process pid
3989 thread firefox:cs0 pid 6856)
[11022.107802] amdgpu 0000:03:00.0: amdgpu:   in page starting at address
0x0000000000015000 from client 18
[11022.107802] amdgpu 0000:03:00.0: amdgpu:
MMVM_L2_PROTECTION_FAULT_STATUS:0x00000000
[11022.107803] amdgpu 0000:03:00.0: amdgpu:      Faulty UTCL2 client ID:
VMC (0x0)
[11022.107803] amdgpu 0000:03:00.0: amdgpu:      MORE_FAULTS: 0x0
[11022.107804] amdgpu 0000:03:00.0: amdgpu:      WALKER_ERROR: 0x0
[11022.107804] amdgpu 0000:03:00.0: amdgpu:      PERMISSION_FAULTS: 0x0
[11022.107804] amdgpu 0000:03:00.0: amdgpu:      MAPPING_ERROR: 0x0
[11022.107805] amdgpu 0000:03:00.0: amdgpu:      RW: 0x0
[11022.107807] amdgpu 0000:03:00.0: amdgpu: [mmhub] page fault (src_id:0
ring:40 vmid:1 pasid:32813)
[11022.107807] amdgpu 0000:03:00.0: amdgpu:  in process RDD Process pid
3989 thread firefox:cs0 pid 6856)
[11022.107808] amdgpu 0000:03:00.0: amdgpu:   in page starting at address
0x0000000000019000 from client 18
[11022.107808] amdgpu 0000:03:00.0: amdgpu:
MMVM_L2_PROTECTION_FAULT_STATUS:0x00000000
[11022.107809] amdgpu 0000:03:00.0: amdgpu:      Faulty UTCL2 client ID:
VMC (0x0)
[11022.107809] amdgpu 0000:03:00.0: amdgpu:      MORE_FAULTS: 0x0
[11022.107810] amdgpu 0000:03:00.0: amdgpu:      WALKER_ERROR: 0x0
[11022.107810] amdgpu 0000:03:00.0: amdgpu:      PERMISSION_FAULTS: 0x0
[11022.107810] amdgpu 0000:03:00.0: amdgpu:      MAPPING_ERROR: 0x0
[11022.107811] amdgpu 0000:03:00.0: amdgpu:      RW: 0x0
[11022.107813] amdgpu 0000:03:00.0: amdgpu: [mmhub] page fault (src_id:0
ring:40 vmid:1 pasid:32813)
[11022.107813] amdgpu 0000:03:00.0: amdgpu:  in process RDD Process pid
3989 thread firefox:cs0 pid 6856)
[11022.107814] amdgpu 0000:03:00.0: amdgpu:   in page starting at address
0x000000000001d000 from client 18
[11022.107814] amdgpu 0000:03:00.0: amdgpu:
MMVM_L2_PROTECTION_FAULT_STATUS:0x00000000
[11022.107815] amdgpu 0000:03:00.0: amdgpu:      Faulty UTCL2 client ID:
VMC (0x0)
[11022.107815] amdgpu 0000:03:00.0: amdgpu:      MORE_FAULTS: 0x0
[11022.107816] amdgpu 0000:03:00.0: amdgpu:      WALKER_ERROR: 0x0
[11022.107816] amdgpu 0000:03:00.0: amdgpu:      PERMISSION_FAULTS: 0x0
[11022.107816] amdgpu 0000:03:00.0: amdgpu:      MAPPING_ERROR: 0x0
[11022.107817] amdgpu 0000:03:00.0: amdgpu:      RW: 0x0
[11022.107819] amdgpu 0000:03:00.0: amdgpu: [mmhub] page fault (src_id:0
ring:40 vmid:1 pasid:32813)
[11022.107820] amdgpu 0000:03:00.0: amdgpu:  in process RDD Process pid
3989 thread firefox:cs0 pid 6856)
[11022.107820] amdgpu 0000:03:00.0: amdgpu:   in page starting at address
0x0000000000021000 from client 18
[11022.107820] amdgpu 0000:03:00.0: amdgpu:
MMVM_L2_PROTECTION_FAULT_STATUS:0x00000000
[11022.107821] amdgpu 0000:03:00.0: amdgpu:      Faulty UTCL2 client ID:
VMC (0x0)
[11022.107821] amdgpu 0000:03:00.0: amdgpu:      MORE_FAULTS: 0x0
[11022.107822] amdgpu 0000:03:00.0: amdgpu:      WALKER_ERROR: 0x0
[11022.107822] amdgpu 0000:03:00.0: amdgpu:      PERMISSION_FAULTS: 0x0
[11022.107823] amdgpu 0000:03:00.0: amdgpu:      MAPPING_ERROR: 0x0
[11022.107823] amdgpu 0000:03:00.0: amdgpu:      RW: 0x0
[11022.107825] amdgpu 0000:03:00.0: amdgpu: [mmhub] page fault (src_id:0
ring:40 vmid:1 pasid:32813)
[11022.107825] amdgpu 0000:03:00.0: amdgpu:  in process RDD Process pid
3989 thread firefox:cs0 pid 6856)
[11022.107826] amdgpu 0000:03:00.0: amdgpu:   in page starting at address
0x0000000000025000 from client 18
[11022.107826] amdgpu 0000:03:00.0: amdgpu:
MMVM_L2_PROTECTION_FAULT_STATUS:0x00000000
[11022.107827] amdgpu 0000:03:00.0: amdgpu:      Faulty UTCL2 client ID:
VMC (0x0)
[11022.107827] amdgpu 0000:03:00.0: amdgpu:      MORE_FAULTS: 0x0
[11022.107828] amdgpu 0000:03:00.0: amdgpu:      WALKER_ERROR: 0x0
[11022.107828] amdgpu 0000:03:00.0: amdgpu:      PERMISSION_FAULTS: 0x0
[11022.107828] amdgpu 0000:03:00.0: amdgpu:      MAPPING_ERROR: 0x0
[11022.107829] amdgpu 0000:03:00.0: amdgpu:      RW: 0x0
[11022.107831] amdgpu 0000:03:00.0: amdgpu: [mmhub] page fault (src_id:0
ring:40 vmid:1 pasid:32813)
[11022.107831] amdgpu 0000:03:00.0: amdgpu:  in process RDD Process pid
3989 thread firefox:cs0 pid 6856)
[11022.107832] amdgpu 0000:03:00.0: amdgpu:   in page starting at address
0x0000000000029000 from client 18
[11022.107832] amdgpu 0000:03:00.0: amdgpu:
MMVM_L2_PROTECTION_FAULT_STATUS:0x00000000
[11022.107833] amdgpu 0000:03:00.0: amdgpu:      Faulty UTCL2 client ID:
VMC (0x0)
[11022.107833] amdgpu 0000:03:00.0: amdgpu:      MORE_FAULTS: 0x0
[11022.107833] amdgpu 0000:03:00.0: amdgpu:      WALKER_ERROR: 0x0
[11022.107834] amdgpu 0000:03:00.0: amdgpu:      PERMISSION_FAULTS: 0x0
[11022.107834] amdgpu 0000:03:00.0: amdgpu:      MAPPING_ERROR: 0x0
[11022.107835] amdgpu 0000:03:00.0: amdgpu:      RW: 0x0
[11022.107838] amdgpu 0000:03:00.0: amdgpu: [mmhub] page fault (src_id:0
ring:40 vmid:1 pasid:32813)
[11022.107839] amdgpu 0000:03:00.0: amdgpu:  in process RDD Process pid
3989 thread firefox:cs0 pid 6856)
[11022.107839] amdgpu 0000:03:00.0: amdgpu:   in page starting at address
0x000000000002d000 from client 18
[11022.107840] amdgpu 0000:03:00.0: amdgpu:
MMVM_L2_PROTECTION_FAULT_STATUS:0x00000000
[11022.107840] amdgpu 0000:03:00.0: amdgpu:      Faulty UTCL2 client ID:
VMC (0x0)
[11022.107841] amdgpu 0000:03:00.0: amdgpu:      MORE_FAULTS: 0x0
[11022.107841] amdgpu 0000:03:00.0: amdgpu:      WALKER_ERROR: 0x0
[11022.107841] amdgpu 0000:03:00.0: amdgpu:      PERMISSION_FAULTS: 0x0
[11022.107842] amdgpu 0000:03:00.0: amdgpu:      MAPPING_ERROR: 0x0
[11022.107842] amdgpu 0000:03:00.0: amdgpu:      RW: 0x0
[11027.108647] gmc_v11_0_process_interrupt: 202142 callbacks suppressed
[11027.108650] amdgpu 0000:03:00.0: amdgpu: [mmhub] page fault (src_id:0
ring:40 vmid:1 pasid:32813)
[11027.108655] amdgpu 0000:03:00.0: amdgpu:  in process RDD Process pid
3989 thread firefox:cs0 pid 6856)
[11027.108657] amdgpu 0000:03:00.0: amdgpu:   in page starting at address
0x0000000000009000 from client 18
[11027.108658] amdgpu 0000:03:00.0: amdgpu:
MMVM_L2_PROTECTION_FAULT_STATUS:0x00142851
[11027.108659] amdgpu 0000:03:00.0: amdgpu:      Faulty UTCL2 client ID:
VCN0 (0x14)
[11027.108660] amdgpu 0000:03:00.0: amdgpu:      MORE_FAULTS: 0x1
[11027.108661] amdgpu 0000:03:00.0: amdgpu:      WALKER_ERROR: 0x0
[11027.108662] amdgpu 0000:03:00.0: amdgpu:      PERMISSION_FAULTS: 0x5
[11027.108663] amdgpu 0000:03:00.0: amdgpu:      MAPPING_ERROR: 0x0
[11027.108663] amdgpu 0000:03:00.0: amdgpu:      RW: 0x1
[11027.108665] amdgpu 0000:03:00.0: amdgpu: [mmhub] page fault (src_id:0
ring:40 vmid:1 pasid:32813)
[11027.108667] amdgpu 0000:03:00.0: amdgpu:  in process RDD Process pid
3989 thread firefox:cs0 pid 6856)
[11027.108667] amdgpu 0000:03:00.0: amdgpu:   in page starting at address
0x000000000000d000 from client 18
[11027.108668] amdgpu 0000:03:00.0: amdgpu:
MMVM_L2_PROTECTION_FAULT_STATUS:0x00000000
[11027.108669] amdgpu 0000:03:00.0: amdgpu:      Faulty UTCL2 client ID:
VMC (0x0)
[11027.108670] amdgpu 0000:03:00.0: amdgpu:      MORE_FAULTS: 0x0
[11027.108670] amdgpu 0000:03:00.0: amdgpu:      WALKER_ERROR: 0x0
[11027.108671] amdgpu 0000:03:00.0: amdgpu:      PERMISSION_FAULTS: 0x0
[11027.108671] amdgpu 0000:03:00.0: amdgpu:      MAPPING_ERROR: 0x0
[11027.108672] amdgpu 0000:03:00.0: amdgpu:      RW: 0x0
[11027.108674] amdgpu 0000:03:00.0: amdgpu: [mmhub] page fault (src_id:0
ring:40 vmid:1 pasid:32813)
[11027.108675] amdgpu 0000:03:00.0: amdgpu:  in process RDD Process pid
3989 thread firefox:cs0 pid 6856)
[11027.108676] amdgpu 0000:03:00.0: amdgpu:   in page starting at address
0x0000000000011000 from client 18
[11027.108676] amdgpu 0000:03:00.0: amdgpu:
MMVM_L2_PROTECTION_FAULT_STATUS:0x00000000
[11027.108677] amdgpu 0000:03:00.0: amdgpu:      Faulty UTCL2 client ID:
VMC (0x0)
[11027.108678] amdgpu 0000:03:00.0: amdgpu:      MORE_FAULTS: 0x0
[11027.108678] amdgpu 0000:03:00.0: amdgpu:      WALKER_ERROR: 0x0
[11027.108679] amdgpu 0000:03:00.0: amdgpu:      PERMISSION_FAULTS: 0x0
[11027.108679] amdgpu 0000:03:00.0: amdgpu:      MAPPING_ERROR: 0x0
[11027.108680] amdgpu 0000:03:00.0: amdgpu:      RW: 0x0
[11027.108682] amdgpu 0000:03:00.0: amdgpu: [mmhub] page fault (src_id:0
ring:40 vmid:1 pasid:32813)
[11027.108683] amdgpu 0000:03:00.0: amdgpu:  in process RDD Process pid
3989 thread firefox:cs0 pid 6856)
[11027.108683] amdgpu 0000:03:00.0: amdgpu:   in page starting at address
0x0000000000015000 from client 18
[11027.108684] amdgpu 0000:03:00.0: amdgpu:
MMVM_L2_PROTECTION_FAULT_STATUS:0x00000000
[11027.108685] amdgpu 0000:03:00.0: amdgpu:      Faulty UTCL2 client ID:
VMC (0x0)
[11027.108685] amdgpu 0000:03:00.0: amdgpu:      MORE_FAULTS: 0x0
[11027.108686] amdgpu 0000:03:00.0: amdgpu:      WALKER_ERROR: 0x0
[11027.108686] amdgpu 0000:03:00.0: amdgpu:      PERMISSION_FAULTS: 0x0
[11027.108687] amdgpu 0000:03:00.0: amdgpu:      MAPPING_ERROR: 0x0
[11027.108687] amdgpu 0000:03:00.0: amdgpu:      RW: 0x0
[11027.108689] amdgpu 0000:03:00.0: amdgpu: [mmhub] page fault (src_id:0
ring:40 vmid:1 pasid:32813)
[11027.108690] amdgpu 0000:03:00.0: amdgpu:  in process RDD Process pid
3989 thread firefox:cs0 pid 6856)
[11027.108691] amdgpu 0000:03:00.0: amdgpu:   in page starting at address
0x0000000000019000 from client 18
[11027.108691] amdgpu 0000:03:00.0: amdgpu:
MMVM_L2_PROTECTION_FAULT_STATUS:0x00000000
[11027.108692] amdgpu 0000:03:00.0: amdgpu:      Faulty UTCL2 client ID:
VMC (0x0)
[11027.108693] amdgpu 0000:03:00.0: amdgpu:      MORE_FAULTS: 0x0
[11027.108693] amdgpu 0000:03:00.0: amdgpu:      WALKER_ERROR: 0x0
[11027.108694] amdgpu 0000:03:00.0: amdgpu:      PERMISSION_FAULTS: 0x0
[11027.108694] amdgpu 0000:03:00.0: amdgpu:      MAPPING_ERROR: 0x0
[11027.108695] amdgpu 0000:03:00.0: amdgpu:      RW: 0x0
[11027.108697] amdgpu 0000:03:00.0: amdgpu: [mmhub] page fault (src_id:0
ring:40 vmid:1 pasid:32813)
[11027.108697] amdgpu 0000:03:00.0: amdgpu:  in process RDD Process pid
3989 thread firefox:cs0 pid 6856)
[11027.108698] amdgpu 0000:03:00.0: amdgpu:   in page starting at address
0x000000000001d000 from client 18
[11027.108699] amdgpu 0000:03:00.0: amdgpu:
MMVM_L2_PROTECTION_FAULT_STATUS:0x00000000
[11027.108699] amdgpu 0000:03:00.0: amdgpu:      Faulty UTCL2 client ID:
VMC (0x0)
[11027.108700] amdgpu 0000:03:00.0: amdgpu:      MORE_FAULTS: 0x0
[11027.108700] amdgpu 0000:03:00.0: amdgpu:      WALKER_ERROR: 0x0
[11027.108701] amdgpu 0000:03:00.0: amdgpu:      PERMISSION_FAULTS: 0x0
[11027.108701] amdgpu 0000:03:00.0: amdgpu:      MAPPING_ERROR: 0x0
[11027.108702] amdgpu 0000:03:00.0: amdgpu:      RW: 0x0
[11027.108704] amdgpu 0000:03:00.0: amdgpu: [mmhub] page fault (src_id:0
ring:40 vmid:1 pasid:32813)
[11027.108705] amdgpu 0000:03:00.0: amdgpu:  in process RDD Process pid
3989 thread firefox:cs0 pid 6856)
[11027.108705] amdgpu 0000:03:00.0: amdgpu:   in page starting at address
0x0000000000021000 from client 18
[11027.108706] amdgpu 0000:03:00.0: amdgpu:
MMVM_L2_PROTECTION_FAULT_STATUS:0x00000000
[11027.108706] amdgpu 0000:03:00.0: amdgpu:      Faulty UTCL2 client ID:
VMC (0x0)
[11027.108707] amdgpu 0000:03:00.0: amdgpu:      MORE_FAULTS: 0x0
[11027.108708] amdgpu 0000:03:00.0: amdgpu:      WALKER_ERROR: 0x0
[11027.108708] amdgpu 0000:03:00.0: amdgpu:      PERMISSION_FAULTS: 0x0
[11027.108709] amdgpu 0000:03:00.0: amdgpu:      MAPPING_ERROR: 0x0
[11027.108709] amdgpu 0000:03:00.0: amdgpu:      RW: 0x0
[11027.108711] amdgpu 0000:03:00.0: amdgpu: [mmhub] page fault (src_id:0
ring:40 vmid:1 pasid:32813)
[11027.108712] amdgpu 0000:03:00.0: amdgpu:  in process RDD Process pid
3989 thread firefox:cs0 pid 6856)
[11027.108712] amdgpu 0000:03:00.0: amdgpu:   in page starting at address
0x0000000000025000 from client 18
[11027.108713] amdgpu 0000:03:00.0: amdgpu:
MMVM_L2_PROTECTION_FAULT_STATUS:0x00000000
[11027.108714] amdgpu 0000:03:00.0: amdgpu:      Faulty UTCL2 client ID:
VMC (0x0)
[11027.108714] amdgpu 0000:03:00.0: amdgpu:      MORE_FAULTS: 0x0
[11027.108715] amdgpu 0000:03:00.0: amdgpu:      WALKER_ERROR: 0x0
[11027.108715] amdgpu 0000:03:00.0: amdgpu:      PERMISSION_FAULTS: 0x0
[11027.108716] amdgpu 0000:03:00.0: amdgpu:      MAPPING_ERROR: 0x0
[11027.108716] amdgpu 0000:03:00.0: amdgpu:      RW: 0x0
[11027.108718] amdgpu 0000:03:00.0: amdgpu: [mmhub] page fault (src_id:0
ring:40 vmid:1 pasid:32813)
[11027.108719] amdgpu 0000:03:00.0: amdgpu:  in process RDD Process pid
3989 thread firefox:cs0 pid 6856)
[11027.108720] amdgpu 0000:03:00.0: amdgpu:   in page starting at address
0x0000000000029000 from client 18
[11027.108720] amdgpu 0000:03:00.0: amdgpu:
MMVM_L2_PROTECTION_FAULT_STATUS:0x00000000
[11027.108721] amdgpu 0000:03:00.0: amdgpu:      Faulty UTCL2 client ID:
VMC (0x0)
[11027.108721] amdgpu 0000:03:00.0: amdgpu:      MORE_FAULTS: 0x0
[11027.108722] amdgpu 0000:03:00.0: amdgpu:      WALKER_ERROR: 0x0
[11027.108722] amdgpu 0000:03:00.0: amdgpu:      PERMISSION_FAULTS: 0x0
[11027.108723] amdgpu 0000:03:00.0: amdgpu:      MAPPING_ERROR: 0x0
[11027.108723] amdgpu 0000:03:00.0: amdgpu:      RW: 0x0
[11027.108725] amdgpu 0000:03:00.0: amdgpu: [mmhub] page fault (src_id:0
ring:40 vmid:1 pasid:32813)
[11027.108726] amdgpu 0000:03:00.0: amdgpu:  in process RDD Process pid
3989 thread firefox:cs0 pid 6856)
[11027.108727] amdgpu 0000:03:00.0: amdgpu:   in page starting at address
0x000000000002d000 from client 18
[11027.108727] amdgpu 0000:03:00.0: amdgpu:
MMVM_L2_PROTECTION_FAULT_STATUS:0x00000000
[11027.108728] amdgpu 0000:03:00.0: amdgpu:      Faulty UTCL2 client ID:
VMC (0x0)
[11027.108729] amdgpu 0000:03:00.0: amdgpu:      MORE_FAULTS: 0x0
[11027.108729] amdgpu 0000:03:00.0: amdgpu:      WALKER_ERROR: 0x0
[11027.108730] amdgpu 0000:03:00.0: amdgpu:      PERMISSION_FAULTS: 0x0
[11027.108730] amdgpu 0000:03:00.0: amdgpu:      MAPPING_ERROR: 0x0
[11027.108731] amdgpu 0000:03:00.0: amdgpu:      RW: 0x0
[11028.620576] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring
vcn_unified_0 timeout, signaled seq=6080, emitted se
q=6082
[11028.620881] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process
information: process RDD Process pid 3989 thread
firefox:cs0 pid 6856
[11028.621149] amdgpu 0000:03:00.0: amdgpu: GPU reset begin!
[11032.118514] gmc_v11_0_process_interrupt: 197606 callbacks suppressed
[11032.118518] amdgpu 0000:03:00.0: amdgpu: [mmhub] page fault (src_id:0
ring:40 vmid:1 pasid:32813)
[11032.118524] amdgpu 0000:03:00.0: amdgpu:  in process RDD Process pid
3989 thread firefox:cs0 pid 6856)
[11032.118526] amdgpu 0000:03:00.0: amdgpu:   in page starting at address
0x0000000000009000 from client 18
[11032.118527] amdgpu 0000:03:00.0: amdgpu:
MMVM_L2_PROTECTION_FAULT_STATUS:0x00142851
[11032.118529] amdgpu 0000:03:00.0: amdgpu:      Faulty UTCL2 client ID:
VCN0 (0x14)
[11032.118529] amdgpu 0000:03:00.0: amdgpu:      MORE_FAULTS: 0x1
[11032.118530] amdgpu 0000:03:00.0: amdgpu:      WALKER_ERROR: 0x0
[11032.118531] amdgpu 0000:03:00.0: amdgpu:      PERMISSION_FAULTS: 0x5
[11032.118532] amdgpu 0000:03:00.0: amdgpu:      MAPPING_ERROR: 0x0
[11032.118532] amdgpu 0000:03:00.0: amdgpu:      RW: 0x1
[11032.118535] amdgpu 0000:03:00.0: amdgpu: [mmhub] page fault (src_id:0
ring:40 vmid:1 pasid:32813)
[11032.118536] amdgpu 0000:03:00.0: amdgpu:  in process RDD Process pid
3989 thread firefox:cs0 pid 6856)
[11032.118537] amdgpu 0000:03:00.0: amdgpu:   in page starting at address
0x000000000000d000 from client 18
[11032.118538] amdgpu 0000:03:00.0: amdgpu:
MMVM_L2_PROTECTION_FAULT_STATUS:0x00000000
[11032.118539] amdgpu 0000:03:00.0: amdgpu:      Faulty UTCL2 client ID:
VMC (0x0)
[11032.118540] amdgpu 0000:03:00.0: amdgpu:      MORE_FAULTS: 0x0
[11032.118540] amdgpu 0000:03:00.0: amdgpu:      WALKER_ERROR: 0x0
[11032.118541] amdgpu 0000:03:00.0: amdgpu:      PERMISSION_FAULTS: 0x0
[11032.118541] amdgpu 0000:03:00.0: amdgpu:      MAPPING_ERROR: 0x0
[11032.118542] amdgpu 0000:03:00.0: amdgpu:      RW: 0x0
[11032.118544] amdgpu 0000:03:00.0: amdgpu: [mmhub] page fault (src_id:0
ring:40 vmid:1 pasid:32813)
[11032.118545] amdgpu 0000:03:00.0: amdgpu:  in process RDD Process pid
3989 thread firefox:cs0 pid 6856)
[11032.118546] amdgpu 0000:03:00.0: amdgpu:   in page starting at address
0x0000000000011000 from client 18
[11032.118547] amdgpu 0000:03:00.0: amdgpu:
MMVM_L2_PROTECTION_FAULT_STATUS:0x00000000
[11032.118547] amdgpu 0000:03:00.0: amdgpu:      Faulty UTCL2 client ID:
VMC (0x0)
[11032.118548] amdgpu 0000:03:00.0: amdgpu:      MORE_FAULTS: 0x0
[11032.118549] amdgpu 0000:03:00.0: amdgpu:      WALKER_ERROR: 0x0
[11032.118549] amdgpu 0000:03:00.0: amdgpu:      PERMISSION_FAULTS: 0x0
[11032.118550] amdgpu 0000:03:00.0: amdgpu:      MAPPING_ERROR: 0x0
[11032.118550] amdgpu 0000:03:00.0: amdgpu:      RW: 0x0
[11032.118554] amdgpu 0000:03:00.0: amdgpu: [mmhub] page fault (src_id:0
ring:40 vmid:1 pasid:32813)
[11032.118554] amdgpu 0000:03:00.0: amdgpu:  in process RDD Process pid
3989 thread firefox:cs0 pid 6856)
[11032.118555] amdgpu 0000:03:00.0: amdgpu:   in page starting at address
0x0000000000015000 from client 18
[11032.118556] amdgpu 0000:03:00.0: amdgpu:
MMVM_L2_PROTECTION_FAULT_STATUS:0x00000000
[11032.118557] amdgpu 0000:03:00.0: amdgpu:      Faulty UTCL2 client ID:
VMC (0x0)
[11032.118557] amdgpu 0000:03:00.0: amdgpu:      MORE_FAULTS: 0x0
[11032.118558] amdgpu 0000:03:00.0: amdgpu:      WALKER_ERROR: 0x0
[11032.118558] amdgpu 0000:03:00.0: amdgpu:      PERMISSION_FAULTS: 0x0
[11032.118559] amdgpu 0000:03:00.0: amdgpu:      MAPPING_ERROR: 0x0
[11032.118559] amdgpu 0000:03:00.0: amdgpu:      RW: 0x0
[11032.118562] amdgpu 0000:03:00.0: amdgpu: [mmhub] page fault (src_id:0
ring:40 vmid:1 pasid:32813)
[11032.118563] amdgpu 0000:03:00.0: amdgpu:  in process RDD Process pid
3989 thread firefox:cs0 pid 6856)
[11032.118564] amdgpu 0000:03:00.0: amdgpu:   in page starting at address
0x0000000000019000 from client 18
[11032.118565] amdgpu 0000:03:00.0: amdgpu:
MMVM_L2_PROTECTION_FAULT_STATUS:0x00000000
[11032.118565] amdgpu 0000:03:00.0: amdgpu:      Faulty UTCL2 client ID:
VMC (0x0)
[11032.118566] amdgpu 0000:03:00.0: amdgpu:      MORE_FAULTS: 0x0
[11032.118567] amdgpu 0000:03:00.0: amdgpu:      WALKER_ERROR: 0x0
[11032.118567] amdgpu 0000:03:00.0: amdgpu:      PERMISSION_FAULTS: 0x0
[11032.118568] amdgpu 0000:03:00.0: amdgpu:      MAPPING_ERROR: 0x0
[11032.118568] amdgpu 0000:03:00.0: amdgpu:      RW: 0x0
[11032.118571] amdgpu 0000:03:00.0: amdgpu: [mmhub] page fault (src_id:0
ring:40 vmid:1 pasid:32813)
[11032.118572] amdgpu 0000:03:00.0: amdgpu:  in process RDD Process pid
3989 thread firefox:cs0 pid 6856)
[11032.118574] amdgpu 0000:03:00.0: amdgpu:   in page starting at address
0x000000000001d000 from client 18
[11032.118575] amdgpu 0000:03:00.0: amdgpu:
MMVM_L2_PROTECTION_FAULT_STATUS:0x00000000
[11032.118576] amdgpu 0000:03:00.0: amdgpu:      Faulty UTCL2 client ID:
VMC (0x0)
[11032.118577] amdgpu 0000:03:00.0: amdgpu:      MORE_FAULTS: 0x0
[11032.118578] amdgpu 0000:03:00.0: amdgpu:      WALKER_ERROR: 0x0
[11032.118579] amdgpu 0000:03:00.0: amdgpu:      PERMISSION_FAULTS: 0x0
[11032.118580] amdgpu 0000:03:00.0: amdgpu:      MAPPING_ERROR: 0x0
[11032.118581] amdgpu 0000:03:00.0: amdgpu:      RW: 0x0
[11032.118583] amdgpu 0000:03:00.0: amdgpu: [mmhub] page fault (src_id:0
ring:40 vmid:1 pasid:32813)
[11032.118585] amdgpu 0000:03:00.0: amdgpu:  in process RDD Process pid
3989 thread firefox:cs0 pid 6856)
[11032.118586] amdgpu 0000:03:00.0: amdgpu:   in page starting at address
0x0000000000021000 from client 18
[11032.118587] amdgpu 0000:03:00.0: amdgpu:
MMVM_L2_PROTECTION_FAULT_STATUS:0x00000000
[11032.118589] amdgpu 0000:03:00.0: amdgpu:      Faulty UTCL2 client ID:
VMC (0x0)
[11032.118590] amdgpu 0000:03:00.0: amdgpu:      MORE_FAULTS: 0x0
[11032.118591] amdgpu 0000:03:00.0: amdgpu:      WALKER_ERROR: 0x0
[11032.118592] amdgpu 0000:03:00.0: amdgpu:      PERMISSION_FAULTS: 0x0
[11032.118592] amdgpu 0000:03:00.0: amdgpu:      MAPPING_ERROR: 0x0
[11032.118593] amdgpu 0000:03:00.0: amdgpu:      RW: 0x0
[11032.118595] amdgpu 0000:03:00.0: amdgpu: [mmhub] page fault (src_id:0
ring:40 vmid:1 pasid:32813)
[11032.118596] amdgpu 0000:03:00.0: amdgpu:  in process RDD Process pid
3989 thread firefox:cs0 pid 6856)
[11032.118597] amdgpu 0000:03:00.0: amdgpu:   in page starting at address
0x0000000000025000 from client 18
[11032.118597] amdgpu 0000:03:00.0: amdgpu:
MMVM_L2_PROTECTION_FAULT_STATUS:0x00000000
[11032.118598] amdgpu 0000:03:00.0: amdgpu:      Faulty UTCL2 client ID:
VMC (0x0)
[11032.118599] amdgpu 0000:03:00.0: amdgpu:      MORE_FAULTS: 0x0
[11032.118599] amdgpu 0000:03:00.0: amdgpu:      WALKER_ERROR: 0x0
[11032.118600] amdgpu 0000:03:00.0: amdgpu:      PERMISSION_FAULTS: 0x0
[11032.118600] amdgpu 0000:03:00.0: amdgpu:      MAPPING_ERROR: 0x0
[11032.118601] amdgpu 0000:03:00.0: amdgpu:      RW: 0x0
[11032.118603] amdgpu 0000:03:00.0: amdgpu: [mmhub] page fault (src_id:0
ring:40 vmid:1 pasid:32813)
[11032.118604] amdgpu 0000:03:00.0: amdgpu:  in process RDD Process pid
3989 thread firefox:cs0 pid 6856)
[11032.118605] amdgpu 0000:03:00.0: amdgpu:   in page starting at address
0x0000000000029000 from client 18
[11032.118605] amdgpu 0000:03:00.0: amdgpu:
MMVM_L2_PROTECTION_FAULT_STATUS:0x00000000
[11032.118606] amdgpu 0000:03:00.0: amdgpu:      Faulty UTCL2 client ID:
VMC (0x0)
[11032.118607] amdgpu 0000:03:00.0: amdgpu:      MORE_FAULTS: 0x0
[11032.118607] amdgpu 0000:03:00.0: amdgpu:      WALKER_ERROR: 0x0
[11032.118608] amdgpu 0000:03:00.0: amdgpu:      PERMISSION_FAULTS: 0x0
[11032.118608] amdgpu 0000:03:00.0: amdgpu:      MAPPING_ERROR: 0x0
[11032.118609] amdgpu 0000:03:00.0: amdgpu:      RW: 0x0
[11032.118611] amdgpu 0000:03:00.0: amdgpu: [mmhub] page fault (src_id:0
ring:40 vmid:1 pasid:32813)
[11032.118612] amdgpu 0000:03:00.0: amdgpu:  in process RDD Process pid
3989 thread firefox:cs0 pid 6856)
[11032.118612] amdgpu 0000:03:00.0: amdgpu:   in page starting at address
0x000000000002d000 from client 18
[11032.118613] amdgpu 0000:03:00.0: amdgpu:
MMVM_L2_PROTECTION_FAULT_STATUS:0x00000000
[11032.118614] amdgpu 0000:03:00.0: amdgpu:      Faulty UTCL2 client ID:
VMC (0x0)
[11032.118614] amdgpu 0000:03:00.0: amdgpu:      MORE_FAULTS: 0x0
[11032.118615] amdgpu 0000:03:00.0: amdgpu:      WALKER_ERROR: 0x0
[11032.118616] amdgpu 0000:03:00.0: amdgpu:      PERMISSION_FAULTS: 0x0
[11032.118616] amdgpu 0000:03:00.0: amdgpu:      MAPPING_ERROR: 0x0
[11032.118617] amdgpu 0000:03:00.0: amdgpu:      RW: 0x0
[11032.621135] amdgpu 0000:03:00.0: amdgpu: failed to suspend display audio
[11033.133194] [drm] Register(0) [regUVD_POWER_STATUS] failed to reach
value 0x00000001 != 0x00000002n
[11033.334777] [drm] Register(0) [regUVD_RB_RPTR] failed to reach value
0x00000280 != 0x00000200n
[11033.541362] [drm] Register(0) [regUVD_POWER_STATUS] failed to reach
value 0x00000001 != 0x00000002n
[11033.599964] amdgpu 0000:03:00.0: amdgpu: MODE1 reset
[11033.599970] amdgpu 0000:03:00.0: amdgpu: GPU mode1 reset
[11033.600010] amdgpu 0000:03:00.0: amdgpu: GPU smu mode1 reset
[11034.108909] amdgpu 0000:03:00.0: amdgpu: GPU reset succeeded, trying to
resume
[11034.109175] [drm] PCIE GART of 512M enabled (table at
0x00000081FEB00000).
[11034.109252] [drm] VRAM is lost due to GPU reset!
[11034.109253] amdgpu 0000:03:00.0: amdgpu: PSP is resuming...
[11034.165967] amdgpu 0000:03:00.0: amdgpu: reserve 0x1300000 from
0x81fc000000 for PSP TMR
[11034.261067] amdgpu 0000:03:00.0: amdgpu: RAS: optional ras ta ucode is
not available
[11034.268659] amdgpu 0000:03:00.0: amdgpu: RAP: optional rap ta ucode is
not available
[11034.268660] amdgpu 0000:03:00.0: amdgpu: SECUREDISPLAY: securedisplay ta
ucode is not available
[11034.268662] amdgpu 0000:03:00.0: amdgpu: SMU is resuming...
[11034.268666] amdgpu 0000:03:00.0: amdgpu: smu driver if version =
0x00000035, smu fw if version = 0x00000040, smu
fw program = 0, smu fw version = 0x00525800 (82.88.0)
[11034.268668] amdgpu 0000:03:00.0: amdgpu: SMU driver if version not
matched
[11034.311505] amdgpu 0000:03:00.0: amdgpu: SMU is resumed successfully!
[11034.313280] [drm] DMUB hardware initialized: version=0x07002800
[11034.629584] snd_hda_intel 0000:03:00.1: azx_get_response timeout,
switching to polling mode: last cmd=0x00272400
[11034.629868] snd_hda_intel 0000:03:00.1: spurious response 0x233:0x0,
last cmd=0x272400
[11034.629871] snd_hda_intel 0000:03:00.1: spurious response 0x0:0x0, last
cmd=0x272400
[11034.629872] snd_hda_intel 0000:03:00.1: spurious response 0x0:0x0, last
cmd=0x272400
[11034.629873] snd_hda_intel 0000:03:00.1: spurious response 0x0:0x0, last
cmd=0x272400
[11034.629874] snd_hda_intel 0000:03:00.1: spurious response 0x0:0x0, last
cmd=0x272400
[11034.629874] snd_hda_intel 0000:03:00.1: spurious response 0x0:0x0, last
cmd=0x272400
[11034.629875] snd_hda_intel 0000:03:00.1: spurious response 0x0:0x0, last
cmd=0x272400
[11034.629876] snd_hda_intel 0000:03:00.1: spurious response 0x0:0x0, last
cmd=0x272400
[11034.629876] snd_hda_intel 0000:03:00.1: spurious response 0x0:0x0, last
cmd=0x272400
[11034.629877] snd_hda_intel 0000:03:00.1: spurious response 0x0:0x0, last
cmd=0x272400
[11035.273684] [drm] kiq ring mec 3 pipe 1 q 0
[11035.275790] [drm] VCN decode and encode initialized successfully(under
DPG Mode).
[11035.276255] amdgpu 0000:03:00.0: [drm:jpeg_v4_0_hw_init [amdgpu]] JPEG
decode initialized successfully.
[11035.276566] amdgpu 0000:03:00.0: amdgpu: ring gfx_0.0.0 uses VM inv eng
0 on hub 0
[11035.276568] amdgpu 0000:03:00.0: amdgpu: ring comp_1.0.0 uses VM inv eng
1 on hub 0
[11035.276569] amdgpu 0000:03:00.0: amdgpu: ring comp_1.1.0 uses VM inv eng
4 on hub 0
[11035.276570] amdgpu 0000:03:00.0: amdgpu: ring comp_1.2.0 uses VM inv eng
6 on hub 0
[11035.276570] amdgpu 0000:03:00.0: amdgpu: ring comp_1.3.0 uses VM inv eng
7 on hub 0
[11035.276571] amdgpu 0000:03:00.0: amdgpu: ring comp_1.0.1 uses VM inv eng
8 on hub 0
[11035.276572] amdgpu 0000:03:00.0: amdgpu: ring comp_1.1.1 uses VM inv eng
9 on hub 0
[11035.276572] amdgpu 0000:03:00.0: amdgpu: ring comp_1.2.1 uses VM inv eng
10 on hub 0
[11035.276573] amdgpu 0000:03:00.0: amdgpu: ring comp_1.3.1 uses VM inv eng
11 on hub 0
[11035.276574] amdgpu 0000:03:00.0: amdgpu: ring sdma0 uses VM inv eng 12
on hub 0
[11035.276575] amdgpu 0000:03:00.0: amdgpu: ring sdma1 uses VM inv eng 13
on hub 0
[11035.276575] amdgpu 0000:03:00.0: amdgpu: ring vcn_unified_0 uses VM inv
eng 0 on hub 8
[11035.276576] amdgpu 0000:03:00.0: amdgpu: ring jpeg_dec uses VM inv eng 1
on hub 8
[11035.276577] amdgpu 0000:03:00.0: amdgpu: ring mes_kiq_3.1.0 uses VM inv
eng 14 on hub 0
[11035.283794] amdgpu 0000:03:00.0: amdgpu: recover vram bo from shadow
start
[11035.289399] amdgpu 0000:03:00.0: amdgpu: recover vram bo from shadow
done
[11035.289410] amdgpu 0000:03:00.0: amdgpu: GPU reset(1) succeeded!
[11035.289655] [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize
parser -125!
[11035.632839] snd_hda_intel 0000:03:00.1: No response from codec,
disabling MSI: last cmd=0x002f2d00
[11036.636808] snd_hda_intel 0000:03:00.1: azx_get_response timeout,
switching to single_cmd mode: last cmd=0x002f2
d00
[11042.900905] azx_single_wait_for_response: 59592 callbacks suppressed
[11045.526488] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx_0.0.0
timeout, signaled seq=7424070, emitted seq
=7424072
[11045.526707] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process
information: process kwin_wayland pid 1806 thread
kwin_wayla:cs0 pid 1877
[11045.526884] amdgpu 0000:03:00.0: amdgpu: GPU reset begin!
[11045.980512] [drm:mes_v11_0_submit_pkt_and_poll_completion.constprop.0
[amdgpu]] *ERROR* MES failed to response m
sg=3
[11045.980697] [drm:amdgpu_mes_unmap_legacy_queue [amdgpu]] *ERROR* failed
to unmap legacy queue
[11046.099519] [drm:mes_v11_0_submit_pkt_and_poll_completion.constprop.0
[amdgpu]] *ERROR* MES failed to response m
sg=3
[11046.099677] [drm:amdgpu_mes_unmap_legacy_queue [amdgpu]] *ERROR* failed
to unmap legacy queue
[11046.218507] [drm:mes_v11_0_submit_pkt_and_poll_completion.constprop.0
[amdgpu]] *ERROR* MES failed to response m
sg=3
[11046.218664] [drm:amdgpu_mes_unmap_legacy_queue [amdgpu]] *ERROR* failed
to unmap legacy queue
[11046.337480] [drm:mes_v11_0_submit_pkt_and_poll_completion.constprop.0
[amdgpu]] *ERROR* MES failed to response m
sg=3
[11046.337636] [drm:amdgpu_mes_unmap_legacy_queue [amdgpu]] *ERROR* failed
to unmap legacy queue
[11046.456410] [drm:mes_v11_0_submit_pkt_and_poll_completion.constprop.0
[amdgpu]] *ERROR* MES failed to response m
sg=3
[11046.456571] [drm:amdgpu_mes_unmap_legacy_queue [amdgpu]] *ERROR* failed
to unmap legacy queue
[11046.575381] [drm:mes_v11_0_submit_pkt_and_poll_completion.constprop.0
[amdgpu]] *ERROR* MES failed to response m
sg=3
[11046.575553] [drm:amdgpu_mes_unmap_legacy_queue [amdgpu]] *ERROR* failed
to unmap legacy queue
[11046.694411] [drm:mes_v11_0_submit_pkt_and_poll_completion.constprop.0
[amdgpu]] *ERROR* MES failed to response m
sg=3
[11046.694569] [drm:amdgpu_mes_unmap_legacy_queue [amdgpu]] *ERROR* failed
to unmap legacy queue
[11046.813443] [drm:mes_v11_0_submit_pkt_and_poll_completion.constprop.0
[amdgpu]] *ERROR* MES failed to response m
sg=3
[11046.813611] [drm:amdgpu_mes_unmap_legacy_queue [amdgpu]] *ERROR* failed
to unmap legacy queue
[11046.932487] [drm:mes_v11_0_submit_pkt_and_poll_completion.constprop.0
[amdgpu]] *ERROR* MES failed to response m
sg=3
[11046.932643] [drm:amdgpu_mes_unmap_legacy_queue [amdgpu]] *ERROR* failed
to unmap legacy queue
[11047.142627] [drm:gfx_v11_0_hw_fini [amdgpu]] *ERROR* failed to halt cp
gfx
[11047.181644] amdgpu 0000:03:00.0: amdgpu: MODE1 reset
[11047.181647] amdgpu 0000:03:00.0: amdgpu: GPU mode1 reset
[11047.181677] amdgpu 0000:03:00.0: amdgpu: GPU smu mode1 reset
[11047.684804] amdgpu 0000:03:00.0: amdgpu: GPU reset succeeded, trying to
resume
[11047.685054] [drm] PCIE GART of 512M enabled (table at
0x00000081FEB00000).
[11047.685101] [drm] VRAM is lost due to GPU reset!
[11047.685103] amdgpu 0000:03:00.0: amdgpu: PSP is resuming...
[11047.741780] amdgpu 0000:03:00.0: amdgpu: reserve 0x1300000 from
0x81fc000000 for PSP TMR
[11047.836879] amdgpu 0000:03:00.0: amdgpu: RAS: optional ras ta ucode is
not available
[11047.844470] amdgpu 0000:03:00.0: amdgpu: RAP: optional rap ta ucode is
not available
[11047.844471] amdgpu 0000:03:00.0: amdgpu: SECUREDISPLAY: securedisplay ta
ucode is not available
[11047.844473] amdgpu 0000:03:00.0: amdgpu: SMU is resuming...
[11047.844476] amdgpu 0000:03:00.0: amdgpu: smu driver if version =
0x00000035, smu fw if version = 0x00000040, smu
fw program = 0, smu fw version = 0x00525800 (82.88.0)
[11047.844478] amdgpu 0000:03:00.0: amdgpu: SMU driver if version not
matched
[11047.888339] amdgpu 0000:03:00.0: amdgpu: SMU is resumed successfully!
[11047.890114] [drm] DMUB hardware initialized: version=0x07002800
[11048.858846] [drm] kiq ring mec 3 pipe 1 q 0
[11048.861029] [drm] VCN decode and encode initialized successfully(under
DPG Mode).
[11048.861494] amdgpu 0000:03:00.0: [drm:jpeg_v4_0_hw_init [amdgpu]] JPEG
decode initialized successfully.
[11048.861784] amdgpu 0000:03:00.0: amdgpu: ring gfx_0.0.0 uses VM inv eng
0 on hub 0
[11048.861786] amdgpu 0000:03:00.0: amdgpu: ring comp_1.0.0 uses VM inv eng
1 on hub 0
[11048.861787] amdgpu 0000:03:00.0: amdgpu: ring comp_1.1.0 uses VM inv eng
4 on hub 0
[11048.861788] amdgpu 0000:03:00.0: amdgpu: ring comp_1.2.0 uses VM inv eng
6 on hub 0
[11048.861788] amdgpu 0000:03:00.0: amdgpu: ring comp_1.3.0 uses VM inv eng
7 on hub 0
[11048.861789] amdgpu 0000:03:00.0: amdgpu: ring comp_1.0.1 uses VM inv eng
8 on hub 0
[11048.861790] amdgpu 0000:03:00.0: amdgpu: ring comp_1.1.1 uses VM inv eng
9 on hub 0
[11048.861790] amdgpu 0000:03:00.0: amdgpu: ring comp_1.2.1 uses VM inv eng
10 on hub 0
[11048.861791] amdgpu 0000:03:00.0: amdgpu: ring comp_1.3.1 uses VM inv eng
11 on hub 0
[11048.861792] amdgpu 0000:03:00.0: amdgpu: ring sdma0 uses VM inv eng 12
on hub 0
[11048.861792] amdgpu 0000:03:00.0: amdgpu: ring sdma1 uses VM inv eng 13
on hub 0
[11048.861793] amdgpu 0000:03:00.0: amdgpu: ring vcn_unified_0 uses VM inv
eng 0 on hub 8
[11048.861794] amdgpu 0000:03:00.0: amdgpu: ring jpeg_dec uses VM inv eng 1
on hub 8
[11048.861795] amdgpu 0000:03:00.0: amdgpu: ring mes_kiq_3.1.0 uses VM inv
eng 14 on hub 0
[11048.868724] amdgpu 0000:03:00.0: amdgpu: recover vram bo from shadow
start
[11048.873889] amdgpu 0000:03:00.0: amdgpu: recover vram bo from shadow
done
[11048.873899] amdgpu 0000:03:00.0: amdgpu: GPU reset(3) succeeded!
[11048.876015] [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize
parser -125!
[11050.115333] show_signal: 12 callbacks suppressed
[11050.115335] traps: gmain[19425] trap int3 ip:7fd6fc448a07
sp:7fd6ccbfe600 error:0 in libglib-2.0.so.0.8000.2[7fd
6fc401000+a3000]
[11059.340745] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx_0.0.0
timeout, but soft recovered
[11069.590675] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx_0.0.0
timeout, signaled seq=7424108, emitted seq
=7424110
[11069.590893] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process
information: process plasmashell pid 19358 thread
plasmashel:cs0 pid 19379
[11069.591075] amdgpu 0000:03:00.0: amdgpu: GPU reset begin!
[11070.067953] [drm:mes_v11_0_submit_pkt_and_poll_completion.constprop.0
[amdgpu]] *ERROR* MES failed to response m
sg=3
[11070.068149] [drm:amdgpu_mes_unmap_legacy_queue [amdgpu]] *ERROR* failed
to unmap legacy queue
[11070.187027] [drm:mes_v11_0_submit_pkt_and_poll_completion.constprop.0
[amdgpu]] *ERROR* MES failed to response m
sg=3
[11070.187181] [drm:amdgpu_mes_unmap_legacy_queue [amdgpu]] *ERROR* failed
to unmap legacy queue
[11070.306123] [drm:mes_v11_0_submit_pkt_and_poll_completion.constprop.0
[amdgpu]] *ERROR* MES failed to response m
sg=3
[11070.306275] [drm:amdgpu_mes_unmap_legacy_queue [amdgpu]] *ERROR* failed
to unmap legacy queue
[11070.425201] [drm:mes_v11_0_submit_pkt_and_poll_completion.constprop.0
[amdgpu]] *ERROR* MES failed to response m
sg=3
[11070.425358] [drm:amdgpu_mes_unmap_legacy_queue [amdgpu]] *ERROR* failed
to unmap legacy queue
[11070.544273] [drm:mes_v11_0_submit_pkt_and_poll_completion.constprop.0
[amdgpu]] *ERROR* MES failed to response m
sg=3
[11070.544435] [drm:amdgpu_mes_unmap_legacy_queue [amdgpu]] *ERROR* failed
to unmap legacy queue
[11070.663360] [drm:mes_v11_0_submit_pkt_and_poll_completion.constprop.0
[amdgpu]] *ERROR* MES failed to response m
sg=3
[11070.663517] [drm:amdgpu_mes_unmap_legacy_queue [amdgpu]] *ERROR* failed
to unmap legacy queue
[11070.782435] [drm:mes_v11_0_submit_pkt_and_poll_completion.constprop.0
[amdgpu]] *ERROR* MES failed to response m
sg=3
[11070.782589] [drm:amdgpu_mes_unmap_legacy_queue [amdgpu]] *ERROR* failed
to unmap legacy queue
[11070.901454] [drm:mes_v11_0_submit_pkt_and_poll_completion.constprop.0
[amdgpu]] *ERROR* MES failed to response m
sg=3
[11070.901625] [drm:amdgpu_mes_unmap_legacy_queue [amdgpu]] *ERROR* failed
to unmap legacy queue
[11071.020594] [drm:mes_v11_0_submit_pkt_and_poll_completion.constprop.0
[amdgpu]] *ERROR* MES failed to response m
sg=3
[11071.020751] [drm:amdgpu_mes_unmap_legacy_queue [amdgpu]] *ERROR* failed
to unmap legacy queue
[11071.230709] [drm:gfx_v11_0_hw_fini [amdgpu]] *ERROR* failed to halt cp
gfx
[11071.269872] amdgpu 0000:03:00.0: amdgpu: MODE1 reset
[11071.269875] amdgpu 0000:03:00.0: amdgpu: GPU mode1 reset
[11071.269915] amdgpu 0000:03:00.0: amdgpu: GPU smu mode1 reset
[11071.772675] amdgpu 0000:03:00.0: amdgpu: GPU reset succeeded, trying to
resume
[11071.772955] [drm] PCIE GART of 512M enabled (table at
0x00000081FEB00000).
[11071.772999] [drm] VRAM is lost due to GPU reset!
[11071.773000] amdgpu 0000:03:00.0: amdgpu: PSP is resuming...
[11071.829626] amdgpu 0000:03:00.0: amdgpu: reserve 0x1300000 from
0x81fc000000 for PSP TMR
[11071.924929] amdgpu 0000:03:00.0: amdgpu: RAS: optional ras ta ucode is
not available
[11071.932521] amdgpu 0000:03:00.0: amdgpu: RAP: optional rap ta ucode is
not available
[11071.932523] amdgpu 0000:03:00.0: amdgpu: SECUREDISPLAY: securedisplay ta
ucode is not available
[11071.932525] amdgpu 0000:03:00.0: amdgpu: SMU is resuming...
[11071.932528] amdgpu 0000:03:00.0: amdgpu: smu driver if version =
0x00000035, smu fw if version = 0x00000040, smu
fw program = 0, smu fw version = 0x00525800 (82.88.0)
[11071.932530] amdgpu 0000:03:00.0: amdgpu: SMU driver if version not
matched
[11071.975910] amdgpu 0000:03:00.0: amdgpu: SMU is resumed successfully!
[11071.977679] [drm] DMUB hardware initialized: version=0x07002800
[11072.922122] [drm] kiq ring mec 3 pipe 1 q 0
[11072.924738] [drm] VCN decode and encode initialized successfully(under
DPG Mode).
[11072.925173] amdgpu 0000:03:00.0: [drm:jpeg_v4_0_hw_init [amdgpu]] JPEG
decode initialized successfully.
[11072.925478] amdgpu 0000:03:00.0: amdgpu: ring gfx_0.0.0 uses VM inv eng
0 on hub 0
[11072.925480] amdgpu 0000:03:00.0: amdgpu: ring comp_1.0.0 uses VM inv eng
1 on hub 0
[11072.925481] amdgpu 0000:03:00.0: amdgpu: ring comp_1.1.0 uses VM inv eng
4 on hub 0
[11072.925481] amdgpu 0000:03:00.0: amdgpu: ring comp_1.2.0 uses VM inv eng
6 on hub 0
[11072.925482] amdgpu 0000:03:00.0: amdgpu: ring comp_1.3.0 uses VM inv eng
7 on hub 0
[11072.925483] amdgpu 0000:03:00.0: amdgpu: ring comp_1.0.1 uses VM inv eng
8 on hub 0
[11072.925483] amdgpu 0000:03:00.0: amdgpu: ring comp_1.1.1 uses VM inv eng
9 on hub 0
[11072.925484] amdgpu 0000:03:00.0: amdgpu: ring comp_1.2.1 uses VM inv eng
10 on hub 0
[11072.925485] amdgpu 0000:03:00.0: amdgpu: ring comp_1.3.1 uses VM inv eng
11 on hub 0
[11072.925486] amdgpu 0000:03:00.0: amdgpu: ring sdma0 uses VM inv eng 12
on hub 0
[11072.925486] amdgpu 0000:03:00.0: amdgpu: ring sdma1 uses VM inv eng 13
on hub 0
[11072.925487] amdgpu 0000:03:00.0: amdgpu: ring vcn_unified_0 uses VM inv
eng 0 on hub 8
[11072.925488] amdgpu 0000:03:00.0: amdgpu: ring jpeg_dec uses VM inv eng 1
on hub 8
[11072.925489] amdgpu 0000:03:00.0: amdgpu: ring mes_kiq_3.1.0 uses VM inv
eng 14 on hub 0
[11072.933072] amdgpu 0000:03:00.0: amdgpu: recover vram bo from shadow
start
[11072.938630] amdgpu 0000:03:00.0: amdgpu: recover vram bo from shadow
done
[11072.938642] amdgpu 0000:03:00.0: amdgpu: GPU reset(6) succeeded!
[11072.967911] firefox:cs0[19618]: segfault at 0 ip 0000559c177fbe33 sp
00007f9aacdff9a0 error 6 in firefox[559c177
e8000+5a000] likely on CPU 13 (core 8, socket 0)
[11072.967928] Code: 48 8b 2d c0 f1 05 00 48 8b 75 00 e8 57 cf fe ff 48 8b
75 00 bf 0a 00 00 00 e8 d9 cf fe ff 48 8
d 05 92 f4 05 00 48 89 18 31 d2 <89> 14 25 00 00 00 00 0f 0b f3 0f 1e fa 50
58 48 8d 3d 0f 91 04 00
[11074.076807] snd_hdac_bus_update_rirb: 184 callbacks suppressed
[11074.076811] snd_hda_intel 0000:03:00.1: spurious response 0x0:0x0, last
cmd=0x570740
[11074.076817] snd_hda_intel 0000:03:00.1: spurious response 0x600:0x0,
last cmd=0x770740
[11074.076821] snd_hda_intel 0000:03:00.1: spurious response 0x0:0x0, last
cmd=0x970740
[11074.076822] snd_hda_intel 0000:03:00.1: spurious response 0x0:0x0, last
cmd=0x377200
[11074.076823] snd_hda_intel 0000:03:00.1: spurious response 0x0:0x0, last
cmd=0x377200
[11074.076827] snd_hda_intel 0000:03:00.1: spurious response 0x0:0x0, last
cmd=0x378901
[11074.076827] snd_hda_intel 0000:03:00.1: spurious response 0x0:0x0, last
cmd=0x378901
[11074.076835] snd_hda_intel 0000:03:00.1: spurious response 0x0:0x0, last
cmd=0x578901
[11074.076836] snd_hda_intel 0000:03:00.1: spurious response 0x0:0x0, last
cmd=0x578901
[11074.076841] snd_hda_intel 0000:03:00.1: spurious response 0x0:0x0, last
cmd=0x777200
[11083.404491] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx_0.0.0
timeout, but soft recovered
[11093.644242] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx_0.0.0
timeout, but soft recovered
[11095.885288] systemd-coredump[20024]: Failed to get EXE, ignoring: No
such process
[11103.884167] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx_0.0.0
timeout, but soft recovered
[11243.387807] snd_hdac_bus_update_rirb: 49 callbacks suppressed
[11243.387812] snd_hda_intel 0000:03:00.1: spurious response 0x0:0x0, last
cmd=0x220000
[11243.387818] snd_hda_intel 0000:03:00.1: spurious response 0x0:0x0, last
cmd=0x220000
[12426.413313] SGI XFS with ACLs, security attributes, realtime, scrub,
quota, no debug enabled
[12426.430616] JFS: nTxBlock = 8192, nTxLock = 65536

--0000000000003df26d06188b9203
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>This problem on this particular machine can be a=
voided by using the kernel command line option=C2=A0<span style=3D"font-fam=
ily:monospace"><span style=3D"color:rgb(0,0,0);background-color:rgb(255,255=
,255)">amdgpu.mcbp=3D0</span><br></span> </div><div><br></div><div></div><d=
iv>Hardware Description:<br></div><div></div><div><br></div><div>12System:<=
/div>=C2=A0 12Kernel 6.9.0-RX7600XT 12arch x86_64 12bits 64 12compiler gcc =
12v 2.41-37.fc40<br>=C2=A0 12Desktop KDE Plasma 12v 6.0.4 12tk Qt 12v N/A 1=
2wm kwin_wayland 12dm SDDM 12Distro Fedora Linux 40 (Forty)<br>12CPU:<br>=
=C2=A0 12Info 12-core 12model AMD Ryzen 9 7845HX with Radeon Graphics 12bit=
s 64 12type MT MCP 12arch Zen 4 12rev 2<br>=C2=A0 =C2=A0 12cache 12L1 768 K=
iB 12L2 12 MiB 12L3 64 MiB<br>=C2=A0 12Speed (MHz) 12avg 2344 12high 5240 1=
2min/max 400/5298 12cores 121 5200 122 5240 123 4881 124 4676 125 5033 126 =
<br>400<br>=C2=A0 =C2=A0 127 3478 128 400 129 400 1210 400 1211 3521 1212 4=
00 1213 3475 1214 400 1215 3872 1216 400 1217 400 1218 400 12<br>19 4124<br=
>=C2=A0 =C2=A0 1220 400 1221 3970 1222 400 1223 4006 1224 400 12bogomips 14=
3733<br>=C2=A0 12Flags avx avx2 ht lm nx pae sse sse2 sse3 sse4_1 sse4_2 ss=
e4a ssse3 svm<br>12Graphics:<br><div>=C2=A0 12Device-1 AMD Navi 33 [Radeon =
RX 7700S/7600/7600S/7600M XT/PRO W7600] 12vendor <br></div><div>Dell 12driv=
er amdgpu</div>=C2=A0 =C2=A0 12v kernel 12arch RDNA-3 12pcie 12speed 16 GT/=
s 12lanes 8 12ports 12active DP-1,HDMI-A-1,eDP-1<br>=C2=A0 =C2=A0 12empty D=
P-2,DP-3,Writeback-1 12bus-ID 03:00.0 12chip-ID 1002:7480<br>=C2=A0 12Devic=
e-2 DisplayLink Dell Universal Hybrid Video Dock 12driver cdc_ncm,snd-usb-a=
udio 12type USB<br>=C2=A0 =C2=A0 12rev 3.2 12speed 5 Gb/s 12lanes 1 12bus-I=
D 2-1.4.1:5 12chip-ID 17e9:6013<br>=C2=A0 12Device-3 Realtek Integrated_Web=
cam_FHD 12driver uvcvideo 12type USB 12rev 2.0 12speed 480 Mb/s 12lanes 1<b=
r>=C2=A0 =C2=A0 12bus-ID 7-1:2 12chip-ID 0bda:555a<br>=C2=A0 12Display wayl=
and 12server X.org 12v 1.20.14 12with Xwayland 12v 23.2.6 12compositor kwin=
_wayland 12driver 12X<br>=C2=A0 =C2=A0 12loaded amdgpu 12unloaded fbdev,mod=
esetting,radeon,vesa 12dri radeonsi 12gpu amdgpu 12d-rect 6400x1600<br>=C2=
=A0 =C2=A0 12display-ID 0<br>=C2=A0 12Monitor-1 DP-1 12pos center 12res 192=
0x1080 12size N/A<br>=C2=A0 12Monitor-2 HDMI-A-1 12pos right 12res 1920x108=
0 12size N/A<br>=C2=A0 12Monitor-3 eDP-1 12pos primary,left 12res 2560x1600=
 12size N/A<br>=C2=A0 12API EGL 12v 1.5 12platforms 12device 0 12drv radeon=
si 12device 1 12drv swrast 12surfaceless 12drv radeonsi<br>=C2=A0 =C2=A0 12=
wayland 12drv radeonsi 12x11 12drv radeonsi 12inactive gbm<br>=C2=A0 12API =
OpenGL 12v 4.6 12compat-v 4.5 12vendor amd mesa 12v 24.0.7 12glx-v 1.4 12di=
rect-render yes 12renderer AMD<br>=C2=A0 =C2=A0 Radeon RX 7600M XT (radeons=
i navi33 LLVM 18.1.1 DRM 3.57 6.9.0-RX7600XT) 12device-ID 1002:7480<br>=C2=
=A0 =C2=A0 12display-ID :0.0<br>=C2=A0 12API Vulkan 12v 1.3.280 12surfaces =
xcb,xlib,wayland 12device 0 12type discrete-gpu 12driver N/A<br>=C2=A0 =C2=
=A0 12device-ID 1002:7480 12device 1 12type cpu 12driver N/A 12device-ID 10=
005:0000<br><br></div><div>dmesg:</div><div><br></div><div><span style=3D"f=
ont-family:monospace"><span style=3D"color:rgb(0,0,0);background-color:rgb(=
255,255,255)">[ =C2=A0=C2=A0=C2=A00.000000] Linux version 6.9.0-RX7600XT (r=
oot@watchman) (gcc (GCC) 14.1.1 20240507 (Red Hat 14.1.1-1), GNU ld v
</span><br>ersion 2.41-37.fc40) #1 SMP PREEMPT_DYNAMIC Mon May 13 13:51:28 =
MST 2024
<br>[ =C2=A0=C2=A0=C2=A00.000000] Command line: BOOT_IMAGE=3D(hd1,gpt2)/vml=
inuz-6.9.0-RX7600XT root=3DUUID=3Dac66d86f-a430-4aef-8f35-53cc5f7
<br>61de5 ro selinux=3D0 mitigations=3Doff
<br>[ =C2=A0=C2=A0=C2=A00.000000] BIOS-provided physical RAM map:
<br>[ =C2=A0=C2=A0=C2=A00.000000] BIOS-e820: [mem 0x0000000000000000-0x0000=
00000009efff] usable
<br>[ =C2=A0=C2=A0=C2=A00.000000] BIOS-e820: [mem 0x000000000009f000-0x0000=
0000000bffff] reserved
<br>[ =C2=A0=C2=A0=C2=A00.000000] BIOS-e820: [mem 0x0000000000100000-0x0000=
000009afffff] usable
<br>[ =C2=A0=C2=A0=C2=A00.000000] BIOS-e820: [mem 0x0000000009b00000-0x0000=
000009dfffff] reserved
<br>[ =C2=A0=C2=A0=C2=A00.000000] BIOS-e820: [mem 0x0000000009e00000-0x0000=
000009efffff] usable
<br>[ =C2=A0=C2=A0=C2=A00.000000] BIOS-e820: [mem 0x0000000009f00000-0x0000=
000009f11fff] ACPI NVS
<br>[ =C2=A0=C2=A0=C2=A00.000000] BIOS-e820: [mem 0x0000000009f12000-0x0000=
0000a235bfff] usable
<br>[ =C2=A0=C2=A0=C2=A00.000000] BIOS-e820: [mem 0x00000000a235c000-0x0000=
0000a455bfff] reserved
<br>[ =C2=A0=C2=A0=C2=A00.000000] BIOS-e820: [mem 0x00000000a455c000-0x0000=
0000a456afff] usable
<br>[ =C2=A0=C2=A0=C2=A00.000000] BIOS-e820: [mem 0x00000000a456b000-0x0000=
0000a456ffff] reserved
<br>[ =C2=A0=C2=A0=C2=A00.000000] BIOS-e820: [mem 0x00000000a4570000-0x0000=
0000b077efff] usable
<br>[ =C2=A0=C2=A0=C2=A00.000000] BIOS-e820: [mem 0x00000000b077f000-0x0000=
0000b2f7efff] reserved
<br>[ =C2=A0=C2=A0=C2=A00.000000] BIOS-e820: [mem 0x00000000b2f7f000-0x0000=
0000baf7efff] ACPI NVS
<br>[ =C2=A0=C2=A0=C2=A00.000000] BIOS-e820: [mem 0x00000000baf7f000-0x0000=
0000baffefff] ACPI data
<br>[ =C2=A0=C2=A0=C2=A00.000000] BIOS-e820: [mem 0x00000000bafff000-0x0000=
0000baffffff] usable
<br>[ =C2=A0=C2=A0=C2=A00.000000] BIOS-e820: [mem 0x00000000bb000000-0x0000=
0000bbffffff] reserved
<br>[ =C2=A0=C2=A0=C2=A00.000000] BIOS-e820: [mem 0x00000000bd7f3000-0x0000=
0000bfffffff] reserved
<br>[ =C2=A0=C2=A0=C2=A00.000000] BIOS-e820: [mem 0x00000000e0200000-0x0000=
0000e02fffff] reserved
<br>[ =C2=A0=C2=A0=C2=A00.000000] BIOS-e820: [mem 0x00000000fed80000-0x0000=
0000fed80fff] reserved
<br>[ =C2=A0=C2=A0=C2=A00.000000] BIOS-e820: [mem 0x00000000ff000000-0x0000=
0000ffffffff] reserved
<br>[ =C2=A0=C2=A0=C2=A00.000000] BIOS-e820: [mem 0x0000000100000000-0x0000=
00103de7ffff] usable
<br>[ =C2=A0=C2=A0=C2=A00.000000] BIOS-e820: [mem 0x000000103eec0000-0x0000=
00103fffffff] reserved
<br>[ =C2=A0=C2=A0=C2=A00.000000] BIOS-e820: [mem 0x0000010000000000-0x0000=
0100201fffff] reserved
<br>[ =C2=A0=C2=A0=C2=A00.000000] NX (Execute Disable) protection: active
<br>[ =C2=A0=C2=A0=C2=A00.000000] APIC: Static calls initialized
<br>[ =C2=A0=C2=A0=C2=A00.000000] e820: update [mem 0xa0297018-0xa02b2857] =
usable =3D=3D&gt; usable
<br>[ =C2=A0=C2=A0=C2=A00.000000] extended physical RAM map:
<br>[ =C2=A0=C2=A0=C2=A00.000000] reserve setup_data: [mem 0x00000000000000=
00-0x000000000009efff] usable
<br>[ =C2=A0=C2=A0=C2=A00.000000] reserve setup_data: [mem 0x000000000009f0=
00-0x00000000000bffff] reserved
<br>[ =C2=A0=C2=A0=C2=A00.000000] reserve setup_data: [mem 0x00000000001000=
00-0x0000000009afffff] usable
<br>[ =C2=A0=C2=A0=C2=A00.000000] reserve setup_data: [mem 0x0000000009b000=
00-0x0000000009dfffff] reserved
<br>[ =C2=A0=C2=A0=C2=A00.000000] reserve setup_data: [mem 0x0000000009e000=
00-0x0000000009efffff] usable
<br>[ =C2=A0=C2=A0=C2=A00.000000] reserve setup_data: [mem 0x0000000009f000=
00-0x0000000009f11fff] ACPI NVS
<br>[ =C2=A0=C2=A0=C2=A00.000000] reserve setup_data: [mem 0x0000000009f120=
00-0x00000000a0297017] usable
<br>[ =C2=A0=C2=A0=C2=A00.000000] reserve setup_data: [mem 0x00000000a02970=
18-0x00000000a02b2857] usable
<br>[ =C2=A0=C2=A0=C2=A00.000000] reserve setup_data: [mem 0x00000000a02b28=
58-0x00000000a235bfff] usable
<br>[ =C2=A0=C2=A0=C2=A00.000000] reserve setup_data: [mem 0x00000000a235c0=
00-0x00000000a455bfff] reserved
<br>[ =C2=A0=C2=A0=C2=A00.000000] reserve setup_data: [mem 0x00000000a455c0=
00-0x00000000a456afff] usable
<br>[ =C2=A0=C2=A0=C2=A00.000000] reserve setup_data: [mem 0x00000000a456b0=
00-0x00000000a456ffff] reserved
<br>[ =C2=A0=C2=A0=C2=A00.000000] reserve setup_data: [mem 0x00000000a45700=
00-0x00000000b077efff] usable
<br>[ =C2=A0=C2=A0=C2=A00.000000] reserve setup_data: [mem 0x00000000b077f0=
00-0x00000000b2f7efff] reserved
<br>[ =C2=A0=C2=A0=C2=A00.000000] reserve setup_data: [mem 0x00000000b2f7f0=
00-0x00000000baf7efff] ACPI NVS
<br>[ =C2=A0=C2=A0=C2=A00.000000] reserve setup_data: [mem 0x00000000baf7f0=
00-0x00000000baffefff] ACPI data
<br>[ =C2=A0=C2=A0=C2=A00.000000] reserve setup_data: [mem 0x00000000bafff0=
00-0x00000000baffffff] usable
<br>[ =C2=A0=C2=A0=C2=A00.000000] reserve setup_data: [mem 0x00000000bb0000=
00-0x00000000bbffffff] reserved
<br>[ =C2=A0=C2=A0=C2=A00.000000] reserve setup_data: [mem 0x00000000bd7f30=
00-0x00000000bfffffff] reserved
<br>[ =C2=A0=C2=A0=C2=A00.000000] reserve setup_data: [mem 0x00000000e02000=
00-0x00000000e02fffff] reserved
<br>[ =C2=A0=C2=A0=C2=A00.000000] reserve setup_data: [mem 0x00000000fed800=
00-0x00000000fed80fff] reserved
<br>[ =C2=A0=C2=A0=C2=A00.000000] reserve setup_data: [mem 0x00000000ff0000=
00-0x00000000ffffffff] reserved
<br>[ =C2=A0=C2=A0=C2=A00.000000] reserve setup_data: [mem 0x00000001000000=
00-0x000000103de7ffff] usable
<br>[ =C2=A0=C2=A0=C2=A00.000000] reserve setup_data: [mem 0x000000103eec00=
00-0x000000103fffffff] reserved
<br>[ =C2=A0=C2=A0=C2=A00.000000] reserve setup_data: [mem 0x00000100000000=
00-0x00000100201fffff] reserved
<br>[ =C2=A0=C2=A0=C2=A00.000000] efi: EFI v2.8 by Dell Inc.
<br>[ =C2=A0=C2=A0=C2=A00.000000] efi: ACPI=3D0xbaffe000 ACPI 2.0=3D0xbaffe=
014 TPMFinalLog=3D0xbaf2c000 SMBIOS=3D0xb168b000 SMBIOS 3.0=3D0xb1688
<br>000 MEMATTR=3D0xa6db7018 ESRT=3D0xad5e4b98 MOKvar=3D0xb1895000 RNG=3D0x=
baf8d018 TPMEventLog=3D0xa4572018 =C2=A0<br>[ =C2=A0=C2=A0=C2=A00.000000] r=
andom: crng init done
<br>[ =C2=A0=C2=A0=C2=A00.000000] efi: Remove mem61: MMIO range=3D[0xe02000=
00-0xe02fffff] (1MB) from e820 map
<br>[ =C2=A0=C2=A0=C2=A00.000000] e820: remove [mem 0xe0200000-0xe02fffff] =
reserved
<br>[ =C2=A0=C2=A0=C2=A00.000000] efi: Not removing mem62: MMIO range=3D[0x=
fed80000-0xfed80fff] (4KB) from e820 map
<br>[ =C2=A0=C2=A0=C2=A00.000000] efi: Remove mem63: MMIO range=3D[0xff0000=
00-0xffffffff] (16MB) from e820 map
<br>[ =C2=A0=C2=A0=C2=A00.000000] e820: remove [mem 0xff000000-0xffffffff] =
reserved
<br>[ =C2=A0=C2=A0=C2=A00.000000] efi: Remove mem65: MMIO range=3D[0x100000=
00000-0x100201fffff] (514MB) from e820 map
<br>[ =C2=A0=C2=A0=C2=A00.000000] e820: remove [mem 0x10000000000-0x100201f=
ffff] reserved
<br>[ =C2=A0=C2=A0=C2=A00.000000] SMBIOS 3.4.0 present.
<br>[ =C2=A0=C2=A0=C2=A00.000000] DMI: Alienware Alienware m18 R1 AMD/0XY1H=
F, BIOS 1.13.1 04/23/2024
<br>[ =C2=A0=C2=A0=C2=A00.000000] tsc: Fast TSC calibration using PIT
<br>[ =C2=A0=C2=A0=C2=A00.000000] tsc: Detected 2994.441 MHz processor
<br>[ =C2=A0=C2=A0=C2=A00.000349] e820: update [mem 0x00000000-0x00000fff] =
usable =3D=3D&gt; reserved
<br>[ =C2=A0=C2=A0=C2=A00.000350] e820: remove [mem 0x000a0000-0x000fffff] =
usable
<br>[ =C2=A0=C2=A0=C2=A00.000355] last_pfn =3D 0x103de80 max_arch_pfn =3D 0=
x400000000
<br>[ =C2=A0=C2=A0=C2=A00.000360] MTRR map: 7 entries (3 fixed + 4 variable=
; max 20), built from 9 variable MTRRs
<br>[ =C2=A0=C2=A0=C2=A00.000361] x86/PAT: Configuration [0-7]: WB =C2=A0WC=
 =C2=A0UC- UC =C2=A0WB =C2=A0WP =C2=A0UC- WT =C2=A0=C2=A0<br>[ =C2=A0=C2=A0=
=C2=A00.000875] last_pfn =3D 0xbb000 max_arch_pfn =3D 0x400000000
<br>[ =C2=A0=C2=A0=C2=A00.003318] esrt: Reserving ESRT space from 0x0000000=
0ad5e4b98 to 0x00000000ad5e4c20.
<br>[ =C2=A0=C2=A0=C2=A00.003324] e820: update [mem 0xad5e4000-0xad5e4fff] =
usable =3D=3D&gt; reserved
<br>[ =C2=A0=C2=A0=C2=A00.003336] Using GB pages for direct mapping
<br>[ =C2=A0=C2=A0=C2=A00.003637] Secure boot disabled
<br>[ =C2=A0=C2=A0=C2=A00.003637] RAMDISK: [mem 0x82f25000-0x9437efff]
<br>[ =C2=A0=C2=A0=C2=A00.003641] ACPI: Early table checksum verification d=
isabled
<br>[ =C2=A0=C2=A0=C2=A00.003643] ACPI: RSDP 0x00000000BAFFE014 000024 (v02=
 ALWARE)
<br>[ =C2=A0=C2=A0=C2=A00.003646] ACPI: XSDT 0x00000000BAF93228 000184 (v01=
 ALWARE WN09 =C2=A0=C2=A0=C2=A0=C2=A000000002 =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A001000013)
<br>[ =C2=A0=C2=A0=C2=A00.003650] ACPI: FACP 0x00000000BAFED000 00010C (v05=
 ALWARE WN09 =C2=A0=C2=A0=C2=A0=C2=A000000002 ASL =C2=A000040000)
<br>[ =C2=A0=C2=A0=C2=A00.003653] ACPI: DSDT 0x00000000BAFD9000 00D44D (v02=
 ALWARE WN09 =C2=A0=C2=A0=C2=A0=C2=A000000002 ASL =C2=A000040000)
<br>[ =C2=A0=C2=A0=C2=A00.003655] ACPI: FACS 0x00000000BAE61000 000040
<br>[ =C2=A0=C2=A0=C2=A00.003656] ACPI: UEFI 0x00000000BAF7E000 000236 (v01=
 ALWARE WN09 =C2=A0=C2=A0=C2=A0=C2=A000000001 ASL =C2=A000040000)
<br>[ =C2=A0=C2=A0=C2=A00.003657] ACPI: IVRS 0x00000000BAFFC000 0001A4 (v02=
 ALWARE WN09 =C2=A0=C2=A0=C2=A0=C2=A000000001 ASL =C2=A000040000)
<br>[ =C2=A0=C2=A0=C2=A00.003659] ACPI: SSDT 0x00000000BAFF4000 007F51 (v02=
 ALWARE WN09 =C2=A0=C2=A0=C2=A0=C2=A000000002 ACPI 00040000)
<br>[ =C2=A0=C2=A0=C2=A00.003660] ACPI: SSDT 0x00000000BAFF3000 000573 (v02=
 ALWARE WN09 =C2=A0=C2=A0=C2=A0=C2=A000000001 ACPI 00040000)
<br>[ =C2=A0=C2=A0=C2=A00.003661] ACPI: SSDT 0x00000000BAFF2000 00044B (v01=
 ALWARE WN09 =C2=A0=C2=A0=C2=A0=C2=A000001000 ACPI 00040000)
<br>[ =C2=A0=C2=A0=C2=A00.003663] ACPI: TPM2 0x00000000BAFF1000 000034 (v04=
 ALWARE WN09 =C2=A0=C2=A0=C2=A0=C2=A000000002 ASL =C2=A000040000)
<br>[ =C2=A0=C2=A0=C2=A00.003664] ACPI: MSDM 0x00000000BAFF0000 000055 (v03=
 ALWARE WN09 =C2=A0=C2=A0=C2=A0=C2=A000000001 ASL =C2=A000040000)
<br>[ =C2=A0=C2=A0=C2=A00.003665] ACPI: ASF! 0x00000000BAFEF000 0000A5 (v32=
 ALWARE WN09 =C2=A0=C2=A0=C2=A0=C2=A000000002 ASL =C2=A000040000)
<br>[ =C2=A0=C2=A0=C2=A00.003666] ACPI: BOOT 0x00000000BAFEE000 000028 (v01=
 ALWARE WN09 =C2=A0=C2=A0=C2=A0=C2=A000000002 ASL =C2=A000040000)
<br>[ =C2=A0=C2=A0=C2=A00.003668] ACPI: HPET 0x00000000BAFEC000 000038 (v01=
 ALWARE WN09 =C2=A0=C2=A0=C2=A0=C2=A000000002 ASL =C2=A000040000)
<br>[ =C2=A0=C2=A0=C2=A00.003669] ACPI: APIC 0x00000000BAFEB000 000222 (v03=
 ALWARE WN09 =C2=A0=C2=A0=C2=A0=C2=A000000002 ASL =C2=A000040000)
<br>[ =C2=A0=C2=A0=C2=A00.003670] ACPI: MCFG 0x00000000BAFEA000 00003C (v01=
 ALWARE WN09 =C2=A0=C2=A0=C2=A0=C2=A000000002 ASL =C2=A000040000)
<br>[ =C2=A0=C2=A0=C2=A00.003671] ACPI: SLIC 0x00000000BAFE9000 000176 (v01=
 ALWARE WN09 =C2=A0=C2=A0=C2=A0=C2=A000000002 ASL =C2=A000040000)
<br>[ =C2=A0=C2=A0=C2=A00.003673] ACPI: VFCT 0x00000000BAFCA000 00E284 (v01=
 ALWARE WN09 =C2=A0=C2=A0=C2=A0=C2=A000000001 ASL =C2=A000040000)
<br>[ =C2=A0=C2=A0=C2=A00.003674] ACPI: SSDT 0x00000000BAFC9000 0000F8 (v01=
 ALWARE WN09 =C2=A0=C2=A0=C2=A0=C2=A000001000 ACPI 00040000)
<br>[ =C2=A0=C2=A0=C2=A00.003675] ACPI: SSDT 0x00000000BAFC1000 0074CE (v02=
 ALWARE WN09 =C2=A0=C2=A0=C2=A0=C2=A000000001 ACPI 00040000)
<br>[ =C2=A0=C2=A0=C2=A00.003676] ACPI: CRAT 0x00000000BAFBF000 001650 (v01=
 ALWARE WN09 =C2=A0=C2=A0=C2=A0=C2=A000000001 ASL =C2=A000040000)
<br>[ =C2=A0=C2=A0=C2=A00.003678] ACPI: CDIT 0x00000000BAFFD000 000029 (v01=
 ALWARE WN09 =C2=A0=C2=A0=C2=A0=C2=A000000001 ASL =C2=A000040000)
<br>[ =C2=A0=C2=A0=C2=A00.003679] ACPI: SSDT 0x00000000BAFBD000 0008A2 (v02=
 ALWARE WN09 =C2=A0=C2=A0=C2=A0=C2=A000000001 ACPI 00040000)
<br>[ =C2=A0=C2=A0=C2=A00.003680] ACPI: SSDT 0x00000000BAFBB000 001C37 (v02=
 ALWARE WN09 =C2=A0=C2=A0=C2=A0=C2=A000000001 ACPI 00040000)
<br>[ =C2=A0=C2=A0=C2=A00.003681] ACPI: SSDT 0x00000000BAFBA000 000788 (v02=
 ALWARE WN09 =C2=A0=C2=A0=C2=A0=C2=A000000001 ACPI 00040000)
<br>[ =C2=A0=C2=A0=C2=A00.003683] ACPI: SSDT 0x00000000BAFB9000 00076A (v02=
 ALWARE WN09 =C2=A0=C2=A0=C2=A0=C2=A000000001 ACPI 00040000)
<br>[ =C2=A0=C2=A0=C2=A00.003684] ACPI: SSDT 0x00000000BAFAE000 00ABA7 (v02=
 ALWARE WN09 =C2=A0=C2=A0=C2=A0=C2=A000000002 ACPI 00040000)
<br>[ =C2=A0=C2=A0=C2=A00.003685] ACPI: SSDT 0x00000000BAFA4000 00963D (v02=
 ALWARE WN09 =C2=A0=C2=A0=C2=A0=C2=A000000001 ACPI 00040000)
<br>[ =C2=A0=C2=A0=C2=A00.003687] ACPI: FPDT 0x00000000BAFA3000 000044 (v01=
 ALWARE WN09 =C2=A0=C2=A0=C2=A0=C2=A000000002 ASL =C2=A000040000)
<br>[ =C2=A0=C2=A0=C2=A00.003688] ACPI: SSDT 0x00000000BAF9F000 0022AD (v02=
 ALWARE WN09 =C2=A0=C2=A0=C2=A0=C2=A000000001 ACPI 00040000)
<br>[ =C2=A0=C2=A0=C2=A00.003689] ACPI: SSDT 0x00000000BAFE8000 000FE1 (v02=
 ALWARE WN09 =C2=A0=C2=A0=C2=A0=C2=A000000001 ACPI 00040000)
<br>[ =C2=A0=C2=A0=C2=A00.003691] ACPI: SSDT 0x00000000BAFE7000 000FE1 (v02=
 ALWARE WN09 =C2=A0=C2=A0=C2=A0=C2=A000000001 ACPI 00040000)
<br>[ =C2=A0=C2=A0=C2=A00.003692] ACPI: SSDT 0x00000000BAF9D000 001BAF (v02=
 ALWARE WN09 =C2=A0=C2=A0=C2=A0=C2=A000000001 ACPI 00040000)
<br>[ =C2=A0=C2=A0=C2=A00.003693] ACPI: SSDT 0x00000000BAF9C000 0006DA (v02=
 ALWARE WN09 =C2=A0=C2=A0=C2=A0=C2=A000000001 ACPI 00040000)
<br>[ =C2=A0=C2=A0=C2=A00.003695] ACPI: SSDT 0x00000000BAF9B000 000946 (v02=
 ALWARE WN09 =C2=A0=C2=A0=C2=A0=C2=A000000001 ACPI 00040000)
<br>[ =C2=A0=C2=A0=C2=A00.003696] ACPI: SSDT 0x00000000BAF9A000 00008D (v02=
 ALWARE WN09 =C2=A0=C2=A0=C2=A0=C2=A000000001 ACPI 00040000)
<br>[ =C2=A0=C2=A0=C2=A00.003697] ACPI: SSDT 0x00000000BAF99000 00066F (v02=
 ALWARE WN09 =C2=A0=C2=A0=C2=A0=C2=A000000001 ACPI 00040000)
<br>[ =C2=A0=C2=A0=C2=A00.003698] ACPI: SSDT 0x00000000BAF98000 000730 (v02=
 ALWARE WN09 =C2=A0=C2=A0=C2=A0=C2=A000000001 ACPI 00040000)
<br>[ =C2=A0=C2=A0=C2=A00.003700] ACPI: SSDT 0x00000000BAF97000 000BEB (v02=
 ALWARE WN09 =C2=A0=C2=A0=C2=A0=C2=A000000001 ACPI 00040000)
<br>[ =C2=A0=C2=A0=C2=A00.003701] ACPI: SSDT 0x00000000BAF96000 0005E6 (v02=
 ALWARE WN09 =C2=A0=C2=A0=C2=A0=C2=A000000001 ACPI 00040000)
<br>[ =C2=A0=C2=A0=C2=A00.003702] ACPI: SSDT 0x00000000BAF95000 00047A (v02=
 ALWARE WN09 =C2=A0=C2=A0=C2=A0=C2=A000000001 ACPI 00040000)
<br>[ =C2=A0=C2=A0=C2=A00.003704] ACPI: SSDT 0x00000000BAF94000 000877 (v02=
 ALWARE WN09 =C2=A0=C2=A0=C2=A0=C2=A000000001 ACPI 00040000)
<br>[ =C2=A0=C2=A0=C2=A00.003705] ACPI: SSDT 0x00000000BAF91000 00102E (v02=
 ALWARE WN09 =C2=A0=C2=A0=C2=A0=C2=A000000001 ACPI 00040000)
<br>[ =C2=A0=C2=A0=C2=A00.003706] ACPI: SSDT 0x00000000BAF8F000 0011AA (v01=
 ALWARE WN09 =C2=A0=C2=A0=C2=A0=C2=A000000001 ACPI 00040000)
<br>[ =C2=A0=C2=A0=C2=A00.003707] ACPI: SSDT 0x00000000BAFBE000 000087 (v01=
 ALWARE WN09 =C2=A0=C2=A0=C2=A0=C2=A000000001 ACPI 00040000)
<br>[ =C2=A0=C2=A0=C2=A00.003709] ACPI: SSDT 0x00000000BAF8E000 0000E5 (v01=
 ALWARE WN09 =C2=A0=C2=A0=C2=A0=C2=A000000001 ACPI 00040000)
<br>[ =C2=A0=C2=A0=C2=A00.003710] ACPI: BGRT 0x00000000BAFA2000 000038 (v01=
 ALWARE WN09 =C2=A0=C2=A0=C2=A0=C2=A000000002 ASL =C2=A000040000)
<br>[ =C2=A0=C2=A0=C2=A00.003711] ACPI: Reserving FACP table memory at [mem=
 0xbafed000-0xbafed10b]
<br>[ =C2=A0=C2=A0=C2=A00.003712] ACPI: Reserving DSDT table memory at [mem=
 0xbafd9000-0xbafe644c]
<br>[ =C2=A0=C2=A0=C2=A00.003712] ACPI: Reserving FACS table memory at [mem=
 0xbae61000-0xbae6103f]
<br>[ =C2=A0=C2=A0=C2=A00.003713] ACPI: Reserving UEFI table memory at [mem=
 0xbaf7e000-0xbaf7e235]
<br>[ =C2=A0=C2=A0=C2=A00.003713] ACPI: Reserving IVRS table memory at [mem=
 0xbaffc000-0xbaffc1a3]
<br>[ =C2=A0=C2=A0=C2=A00.003714] ACPI: Reserving SSDT table memory at [mem=
 0xbaff4000-0xbaffbf50]
<br>[ =C2=A0=C2=A0=C2=A00.003714] ACPI: Reserving SSDT table memory at [mem=
 0xbaff3000-0xbaff3572]
<br>[ =C2=A0=C2=A0=C2=A00.003714] ACPI: Reserving SSDT table memory at [mem=
 0xbaff2000-0xbaff244a]
<br>[ =C2=A0=C2=A0=C2=A00.003715] ACPI: Reserving TPM2 table memory at [mem=
 0xbaff1000-0xbaff1033]
<br>[ =C2=A0=C2=A0=C2=A00.003715] ACPI: Reserving MSDM table memory at [mem=
 0xbaff0000-0xbaff0054]
<br>[ =C2=A0=C2=A0=C2=A00.003715] ACPI: Reserving ASF! table memory at [mem=
 0xbafef000-0xbafef0a4]
<br>[ =C2=A0=C2=A0=C2=A00.003716] ACPI: Reserving BOOT table memory at [mem=
 0xbafee000-0xbafee027]
<br>[ =C2=A0=C2=A0=C2=A00.003716] ACPI: Reserving HPET table memory at [mem=
 0xbafec000-0xbafec037]
<br>[ =C2=A0=C2=A0=C2=A00.003717] ACPI: Reserving APIC table memory at [mem=
 0xbafeb000-0xbafeb221]
<br>[ =C2=A0=C2=A0=C2=A00.003717] ACPI: Reserving MCFG table memory at [mem=
 0xbafea000-0xbafea03b]
<br>[ =C2=A0=C2=A0=C2=A00.003717] ACPI: Reserving SLIC table memory at [mem=
 0xbafe9000-0xbafe9175]
<br>[ =C2=A0=C2=A0=C2=A00.003718] ACPI: Reserving VFCT table memory at [mem=
 0xbafca000-0xbafd8283]
<br>[ =C2=A0=C2=A0=C2=A00.003718] ACPI: Reserving SSDT table memory at [mem=
 0xbafc9000-0xbafc90f7]
<br>[ =C2=A0=C2=A0=C2=A00.003719] ACPI: Reserving SSDT table memory at [mem=
 0xbafc1000-0xbafc84cd]
<br>[ =C2=A0=C2=A0=C2=A00.003719] ACPI: Reserving CRAT table memory at [mem=
 0xbafbf000-0xbafc064f]
<br>[ =C2=A0=C2=A0=C2=A00.003719] ACPI: Reserving CDIT table memory at [mem=
 0xbaffd000-0xbaffd028]
<br>[ =C2=A0=C2=A0=C2=A00.003720] ACPI: Reserving SSDT table memory at [mem=
 0xbafbd000-0xbafbd8a1]
<br>[ =C2=A0=C2=A0=C2=A00.003720] ACPI: Reserving SSDT table memory at [mem=
 0xbafbb000-0xbafbcc36]
<br>[ =C2=A0=C2=A0=C2=A00.003721] ACPI: Reserving SSDT table memory at [mem=
 0xbafba000-0xbafba787]
<br>[ =C2=A0=C2=A0=C2=A00.003721] ACPI: Reserving SSDT table memory at [mem=
 0xbafb9000-0xbafb9769]
<br>[ =C2=A0=C2=A0=C2=A00.003721] ACPI: Reserving SSDT table memory at [mem=
 0xbafae000-0xbafb8ba6]
<br>[ =C2=A0=C2=A0=C2=A00.003722] ACPI: Reserving SSDT table memory at [mem=
 0xbafa4000-0xbafad63c]
<br>[ =C2=A0=C2=A0=C2=A00.003722] ACPI: Reserving FPDT table memory at [mem=
 0xbafa3000-0xbafa3043]
<br>[ =C2=A0=C2=A0=C2=A00.003723] ACPI: Reserving SSDT table memory at [mem=
 0xbaf9f000-0xbafa12ac]
<br>[ =C2=A0=C2=A0=C2=A00.003723] ACPI: Reserving SSDT table memory at [mem=
 0xbafe8000-0xbafe8fe0]
<br>[ =C2=A0=C2=A0=C2=A00.003723] ACPI: Reserving SSDT table memory at [mem=
 0xbafe7000-0xbafe7fe0]
<br>[ =C2=A0=C2=A0=C2=A00.003724] ACPI: Reserving SSDT table memory at [mem=
 0xbaf9d000-0xbaf9ebae]
<br>[ =C2=A0=C2=A0=C2=A00.003724] ACPI: Reserving SSDT table memory at [mem=
 0xbaf9c000-0xbaf9c6d9]
<br>[ =C2=A0=C2=A0=C2=A00.003725] ACPI: Reserving SSDT table memory at [mem=
 0xbaf9b000-0xbaf9b945]
<br>[ =C2=A0=C2=A0=C2=A00.003725] ACPI: Reserving SSDT table memory at [mem=
 0xbaf9a000-0xbaf9a08c]
<br>[ =C2=A0=C2=A0=C2=A00.003725] ACPI: Reserving SSDT table memory at [mem=
 0xbaf99000-0xbaf9966e]
<br>[ =C2=A0=C2=A0=C2=A00.003726] ACPI: Reserving SSDT table memory at [mem=
 0xbaf98000-0xbaf9872f]
<br>[ =C2=A0=C2=A0=C2=A00.003726] ACPI: Reserving SSDT table memory at [mem=
 0xbaf97000-0xbaf97bea]
<br>[ =C2=A0=C2=A0=C2=A00.003727] ACPI: Reserving SSDT table memory at [mem=
 0xbaf96000-0xbaf965e5]
<br>[ =C2=A0=C2=A0=C2=A00.003727] ACPI: Reserving SSDT table memory at [mem=
 0xbaf95000-0xbaf95479]
<br>[ =C2=A0=C2=A0=C2=A00.003727] ACPI: Reserving SSDT table memory at [mem=
 0xbaf94000-0xbaf94876]
<br>[ =C2=A0=C2=A0=C2=A00.003728] ACPI: Reserving SSDT table memory at [mem=
 0xbaf91000-0xbaf9202d]
<br>[ =C2=A0=C2=A0=C2=A00.003728] ACPI: Reserving SSDT table memory at [mem=
 0xbaf8f000-0xbaf901a9]
<br>[ =C2=A0=C2=A0=C2=A00.003729] ACPI: Reserving SSDT table memory at [mem=
 0xbafbe000-0xbafbe086]
<br>[ =C2=A0=C2=A0=C2=A00.003729] ACPI: Reserving SSDT table memory at [mem=
 0xbaf8e000-0xbaf8e0e4]
<br>[ =C2=A0=C2=A0=C2=A00.003729] ACPI: Reserving BGRT table memory at [mem=
 0xbafa2000-0xbafa2037]
<br>[ =C2=A0=C2=A0=C2=A00.003784] No NUMA configuration found
<br>[ =C2=A0=C2=A0=C2=A00.003784] Faking a node at [mem 0x0000000000000000-=
0x000000103de7ffff]
<br>[ =C2=A0=C2=A0=C2=A00.003788] NODE_DATA(0) allocated [mem 0x103de55000-=
0x103de7ffff]
<br>[ =C2=A0=C2=A0=C2=A00.003941] Zone ranges:
<br>[ =C2=A0=C2=A0=C2=A00.003942] =C2=A0=C2=A0DMA =C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0[mem 0x0000000000001000-0x0000000000ffffff]
<br>[ =C2=A0=C2=A0=C2=A00.003943] =C2=A0=C2=A0DMA32 =C2=A0=C2=A0=C2=A0[mem =
0x0000000001000000-0x00000000ffffffff]
<br>[ =C2=A0=C2=A0=C2=A00.003943] =C2=A0=C2=A0Normal =C2=A0=C2=A0[mem 0x000=
0000100000000-0x000000103de7ffff]
<br>[ =C2=A0=C2=A0=C2=A00.003944] =C2=A0=C2=A0Device =C2=A0=C2=A0empty
<br>[ =C2=A0=C2=A0=C2=A00.003945] Movable zone start for each node
<br>[ =C2=A0=C2=A0=C2=A00.003946] Early memory node ranges
<br>[ =C2=A0=C2=A0=C2=A00.003946] =C2=A0=C2=A0node =C2=A0=C2=A00: [mem 0x00=
00000000001000-0x000000000009efff]
<br>[ =C2=A0=C2=A0=C2=A00.003947] =C2=A0=C2=A0node =C2=A0=C2=A00: [mem 0x00=
00000000100000-0x0000000009afffff]
<br>[ =C2=A0=C2=A0=C2=A00.003947] =C2=A0=C2=A0node =C2=A0=C2=A00: [mem 0x00=
00000009e00000-0x0000000009efffff]
<br>[ =C2=A0=C2=A0=C2=A00.003948] =C2=A0=C2=A0node =C2=A0=C2=A00: [mem 0x00=
00000009f12000-0x00000000a235bfff]
<br>[ =C2=A0=C2=A0=C2=A00.003948] =C2=A0=C2=A0node =C2=A0=C2=A00: [mem 0x00=
000000a455c000-0x00000000a456afff]
<br>[ =C2=A0=C2=A0=C2=A00.003949] =C2=A0=C2=A0node =C2=A0=C2=A00: [mem 0x00=
000000a4570000-0x00000000b077efff]
<br>[ =C2=A0=C2=A0=C2=A00.003949] =C2=A0=C2=A0node =C2=A0=C2=A00: [mem 0x00=
000000bafff000-0x00000000baffffff]
<br>[ =C2=A0=C2=A0=C2=A00.003949] =C2=A0=C2=A0node =C2=A0=C2=A00: [mem 0x00=
00000100000000-0x000000103de7ffff]
<br>[ =C2=A0=C2=A0=C2=A00.003953] Initmem setup node 0 [mem 0x0000000000001=
000-0x000000103de7ffff]
<br>[ =C2=A0=C2=A0=C2=A00.003957] On node 0, zone DMA: 1 pages in unavailab=
le ranges
<br>[ =C2=A0=C2=A0=C2=A00.003970] On node 0, zone DMA: 97 pages in unavaila=
ble ranges
<br>[ =C2=A0=C2=A0=C2=A00.004082] On node 0, zone DMA32: 768 pages in unava=
ilable ranges
<br>[ =C2=A0=C2=A0=C2=A00.006011] On node 0, zone DMA32: 18 pages in unavai=
lable ranges
<br>[ =C2=A0=C2=A0=C2=A00.006061] On node 0, zone DMA32: 8704 pages in unav=
ailable ranges
<br>[ =C2=A0=C2=A0=C2=A00.006229] On node 0, zone DMA32: 5 pages in unavail=
able ranges
<br>[ =C2=A0=C2=A0=C2=A00.006477] On node 0, zone DMA32: 43136 pages in una=
vailable ranges
<br>[ =C2=A0=C2=A0=C2=A00.058266] On node 0, zone Normal: 20480 pages in un=
available ranges
<br>[ =C2=A0=C2=A0=C2=A00.058317] On node 0, zone Normal: 8576 pages in una=
vailable ranges
<br>[ =C2=A0=C2=A0=C2=A00.059186] ACPI: PM-Timer IO Port: 0x408
<br>[ =C2=A0=C2=A0=C2=A00.059192] CPU topo: Ignoring hot-pluggable APIC ID =
0 in present package.
<br>[ =C2=A0=C2=A0=C2=A00.059195] ACPI: LAPIC_NMI (acpi_id[0x00] high edge =
lint[0x1])
<br>[ =C2=A0=C2=A0=C2=A00.059196] ACPI: LAPIC_NMI (acpi_id[0x01] high edge =
lint[0x1])
<br>[ =C2=A0=C2=A0=C2=A00.059196] ACPI: LAPIC_NMI (acpi_id[0x02] high edge =
lint[0x1])
<br>[ =C2=A0=C2=A0=C2=A00.059197] ACPI: LAPIC_NMI (acpi_id[0x03] high edge =
lint[0x1])
<br>[ =C2=A0=C2=A0=C2=A00.059197] ACPI: LAPIC_NMI (acpi_id[0x04] high edge =
lint[0x1])
<br>[ =C2=A0=C2=A0=C2=A00.059197] ACPI: LAPIC_NMI (acpi_id[0x05] high edge =
lint[0x1])
<br>[ =C2=A0=C2=A0=C2=A00.059198] ACPI: LAPIC_NMI (acpi_id[0x06] high edge =
lint[0x1])
<br>[ =C2=A0=C2=A0=C2=A00.059198] ACPI: LAPIC_NMI (acpi_id[0x07] high edge =
lint[0x1])
<br>[ =C2=A0=C2=A0=C2=A00.059199] ACPI: LAPIC_NMI (acpi_id[0x08] high edge =
lint[0x1])
<br>[ =C2=A0=C2=A0=C2=A00.059199] ACPI: LAPIC_NMI (acpi_id[0x09] high edge =
lint[0x1])
<br>[ =C2=A0=C2=A0=C2=A00.059200] ACPI: LAPIC_NMI (acpi_id[0x0a] high edge =
lint[0x1])
<br>[ =C2=A0=C2=A0=C2=A00.059200] ACPI: LAPIC_NMI (acpi_id[0x0b] high edge =
lint[0x1])
<br>[ =C2=A0=C2=A0=C2=A00.059200] ACPI: LAPIC_NMI (acpi_id[0x0c] high edge =
lint[0x1])
<br>[ =C2=A0=C2=A0=C2=A00.059201] ACPI: LAPIC_NMI (acpi_id[0x0d] high edge =
lint[0x1])
<br>[ =C2=A0=C2=A0=C2=A00.059201] ACPI: LAPIC_NMI (acpi_id[0x0e] high edge =
lint[0x1])
<br>[ =C2=A0=C2=A0=C2=A00.059201] ACPI: LAPIC_NMI (acpi_id[0x0f] high edge =
lint[0x1])
<br>[ =C2=A0=C2=A0=C2=A00.059202] ACPI: LAPIC_NMI (acpi_id[0x10] high edge =
lint[0x1])
<br>[ =C2=A0=C2=A0=C2=A00.059202] ACPI: LAPIC_NMI (acpi_id[0x11] high edge =
lint[0x1])
<br>[ =C2=A0=C2=A0=C2=A00.059203] ACPI: LAPIC_NMI (acpi_id[0x12] high edge =
lint[0x1])
<br>[ =C2=A0=C2=A0=C2=A00.059203] ACPI: LAPIC_NMI (acpi_id[0x13] high edge =
lint[0x1])
<br>[ =C2=A0=C2=A0=C2=A00.059203] ACPI: LAPIC_NMI (acpi_id[0x14] high edge =
lint[0x1])
<br>[ =C2=A0=C2=A0=C2=A00.059204] ACPI: LAPIC_NMI (acpi_id[0x15] high edge =
lint[0x1])
<br>[ =C2=A0=C2=A0=C2=A00.059204] ACPI: LAPIC_NMI (acpi_id[0x16] high edge =
lint[0x1])
<br>[ =C2=A0=C2=A0=C2=A00.059204] ACPI: LAPIC_NMI (acpi_id[0x17] high edge =
lint[0x1])
<br>[ =C2=A0=C2=A0=C2=A00.059205] ACPI: LAPIC_NMI (acpi_id[0x18] high edge =
lint[0x1])
<br>[ =C2=A0=C2=A0=C2=A00.059205] ACPI: LAPIC_NMI (acpi_id[0x19] high edge =
lint[0x1])
<br>[ =C2=A0=C2=A0=C2=A00.059206] ACPI: LAPIC_NMI (acpi_id[0x1a] high edge =
lint[0x1])
<br>[ =C2=A0=C2=A0=C2=A00.059206] ACPI: LAPIC_NMI (acpi_id[0x1b] high edge =
lint[0x1])
<br>[ =C2=A0=C2=A0=C2=A00.059206] ACPI: LAPIC_NMI (acpi_id[0x1c] high edge =
lint[0x1])
<br>[ =C2=A0=C2=A0=C2=A00.059207] ACPI: LAPIC_NMI (acpi_id[0x1d] high edge =
lint[0x1])
<br>[ =C2=A0=C2=A0=C2=A00.059207] ACPI: LAPIC_NMI (acpi_id[0x1e] high edge =
lint[0x1])
<br>[ =C2=A0=C2=A0=C2=A00.059207] ACPI: LAPIC_NMI (acpi_id[0x1f] high edge =
lint[0x1])
<br>[ =C2=A0=C2=A0=C2=A00.059218] IOAPIC[0]: apic_id 32, version 33, addres=
s 0xfec00000, GSI 0-23
<br>[ =C2=A0=C2=A0=C2=A00.059221] IOAPIC[1]: apic_id 33, version 33, addres=
s 0xfec01000, GSI 24-55
<br>[ =C2=A0=C2=A0=C2=A00.059222] ACPI: INT_SRC_OVR (bus 0 bus_irq 1 global=
_irq 1 low edge)
<br>[ =C2=A0=C2=A0=C2=A00.059224] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global=
_irq 2 dfl dfl)
<br>[ =C2=A0=C2=A0=C2=A00.059224] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global=
_irq 9 low level)
<br>[ =C2=A0=C2=A0=C2=A00.059227] ACPI: Using ACPI (MADT) for SMP configura=
tion information
<br>[ =C2=A0=C2=A0=C2=A00.059227] ACPI: HPET id: 0x10228210 base: 0xfed0000=
0
<br>[ =C2=A0=C2=A0=C2=A00.059234] e820: update [mem 0xa6e4f000-0xa70d4fff] =
usable =3D=3D&gt; reserved
<br>[ =C2=A0=C2=A0=C2=A00.059245] CPU topo: Max. logical packages: =C2=A0=
=C2=A01
<br>[ =C2=A0=C2=A0=C2=A00.059246] CPU topo: Max. logical dies: =C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A01
<br>[ =C2=A0=C2=A0=C2=A00.059246] CPU topo: Max. dies per package: =C2=A0=
=C2=A01
<br>[ =C2=A0=C2=A0=C2=A00.059248] CPU topo: Max. threads per core: =C2=A0=
=C2=A02
<br>[ =C2=A0=C2=A0=C2=A00.059249] CPU topo: Num. cores per package: =C2=A0=
=C2=A0=C2=A012
<br>[ =C2=A0=C2=A0=C2=A00.059249] CPU topo: Num. threads per package: =C2=
=A024
<br>[ =C2=A0=C2=A0=C2=A00.059249] CPU topo: Allowing 24 present CPUs plus 0=
 hotplug CPUs
<br>[ =C2=A0=C2=A0=C2=A00.059250] CPU topo: Rejected CPUs 8
<br>[ =C2=A0=C2=A0=C2=A00.059264] PM: hibernation: Registered nosave memory=
: [mem 0x00000000-0x00000fff]
<br>[ =C2=A0=C2=A0=C2=A00.059265] PM: hibernation: Registered nosave memory=
: [mem 0x0009f000-0x000bffff]
<br>[ =C2=A0=C2=A0=C2=A00.059266] PM: hibernation: Registered nosave memory=
: [mem 0x000c0000-0x000fffff]
<br>[ =C2=A0=C2=A0=C2=A00.059267] PM: hibernation: Registered nosave memory=
: [mem 0x09b00000-0x09dfffff]
<br>[ =C2=A0=C2=A0=C2=A00.059268] PM: hibernation: Registered nosave memory=
: [mem 0x09f00000-0x09f11fff]
<br>[ =C2=A0=C2=A0=C2=A00.059268] PM: hibernation: Registered nosave memory=
: [mem 0xa0297000-0xa0297fff]
<br>[ =C2=A0=C2=A0=C2=A00.059269] PM: hibernation: Registered nosave memory=
: [mem 0xa02b2000-0xa02b2fff]
<br>[ =C2=A0=C2=A0=C2=A00.059270] PM: hibernation: Registered nosave memory=
: [mem 0xa235c000-0xa455bfff]
<br>[ =C2=A0=C2=A0=C2=A00.059271] PM: hibernation: Registered nosave memory=
: [mem 0xa456b000-0xa456ffff]
<br>[ =C2=A0=C2=A0=C2=A00.059272] PM: hibernation: Registered nosave memory=
: [mem 0xa6e4f000-0xa70d4fff]
<br>[ =C2=A0=C2=A0=C2=A00.059273] PM: hibernation: Registered nosave memory=
: [mem 0xad5e4000-0xad5e4fff]
<br>[ =C2=A0=C2=A0=C2=A00.059274] PM: hibernation: Registered nosave memory=
: [mem 0xb077f000-0xb2f7efff]
<br>[ =C2=A0=C2=A0=C2=A00.059274] PM: hibernation: Registered nosave memory=
: [mem 0xb2f7f000-0xbaf7efff]
<br>[ =C2=A0=C2=A0=C2=A00.059275] PM: hibernation: Registered nosave memory=
: [mem 0xbaf7f000-0xbaffefff]
<br>[ =C2=A0=C2=A0=C2=A00.059276] PM: hibernation: Registered nosave memory=
: [mem 0xbb000000-0xbbffffff]
<br>[ =C2=A0=C2=A0=C2=A00.059276] PM: hibernation: Registered nosave memory=
: [mem 0xbc000000-0xbd7f2fff]
<br>[ =C2=A0=C2=A0=C2=A00.059276] PM: hibernation: Registered nosave memory=
: [mem 0xbd7f3000-0xbfffffff]
<br>[ =C2=A0=C2=A0=C2=A00.059277] PM: hibernation: Registered nosave memory=
: [mem 0xc0000000-0xfed7ffff]
<br>[ =C2=A0=C2=A0=C2=A00.059277] PM: hibernation: Registered nosave memory=
: [mem 0xfed80000-0xfed80fff]
<br>[ =C2=A0=C2=A0=C2=A00.059277] PM: hibernation: Registered nosave memory=
: [mem 0xfed81000-0xffffffff]
<br>[ =C2=A0=C2=A0=C2=A00.059278] [mem 0xc0000000-0xfed7ffff] available for=
 PCI devices
<br>[ =C2=A0=C2=A0=C2=A00.059279] Booting paravirtualized kernel on bare ha=
rdware
<br>[ =C2=A0=C2=A0=C2=A00.059281] clocksource: refined-jiffies: mask: 0xfff=
fffff max_cycles: 0xffffffff, max_idle_ns: 1910969940391419
<br> ns
<br>[ =C2=A0=C2=A0=C2=A00.062760] setup_percpu: NR_CPUS:8192 nr_cpumask_bit=
s:24 nr_cpu_ids:24 nr_node_ids:1
<br>[ =C2=A0=C2=A0=C2=A00.063401] percpu: Embedded 66 pages/cpu s233472 r81=
92 d28672 u524288
<br>[ =C2=A0=C2=A0=C2=A00.063405] pcpu-alloc: s233472 r8192 d28672 u524288 =
alloc=3D1*2097152
<br>[ =C2=A0=C2=A0=C2=A00.063407] pcpu-alloc: [0] 00 01 02 03 [0] 04 05 06 =
07 =C2=A0<br>[ =C2=A0=C2=A0=C2=A00.063409] pcpu-alloc: [0] 08 09 10 11 [0] =
12 13 14 15 =C2=A0<br>[ =C2=A0=C2=A0=C2=A00.063412] pcpu-alloc: [0] 16 17 1=
8 19 [0] 20 21 22 23 =C2=A0<br>[ =C2=A0=C2=A0=C2=A00.063427] Kernel command=
 line: BOOT_IMAGE=3D(hd1,gpt2)/vmlinuz-6.9.0-RX7600XT root=3DUUID=3Dac66d86=
f-a430-4aef-8f35-
<br>53cc5f761de5 ro selinux=3D0 mitigations=3Doff
<br>[ =C2=A0=C2=A0=C2=A00.063472] Unknown kernel command line parameters &q=
uot;BOOT_IMAGE=3D(hd1,gpt2)/vmlinuz-6.9.0-RX7600XT&quot;, will be passe
<br>d to user space.
<br>[ =C2=A0=C2=A0=C2=A00.066143] Dentry cache hash table entries: 8388608 =
(order: 14, 67108864 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A00.067378] Inode-cache hash table entries: 4194304 (=
order: 13, 33554432 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A00.067481] Fallback order for Node 0: 0 =C2=A0<br>[ =
=C2=A0=C2=A0=C2=A00.067486] Built 1 zonelists, mobility grouping on.=C2=A0 =
Total pages: 16434405
<br>[ =C2=A0=C2=A0=C2=A00.067487] Policy zone: Normal
<br>[ =C2=A0=C2=A0=C2=A00.067579] mem auto-init: stack:all(zero), heap allo=
c:off, heap free:off
<br>[ =C2=A0=C2=A0=C2=A00.067614] software IO TLB: area num 32.
<br>[ =C2=A0=C2=A0=C2=A00.122263] Memory: 65150360K/66781724K available (20=
480K kernel code, 3317K rwdata, 15092K rodata, 4580K init, =C2=A0<br>4732K =
bss, 1631104K reserved, 0K cma-reserved)
<br>[ =C2=A0=C2=A0=C2=A00.122380] SLUB: HWalign=3D64, Order=3D0-3, MinObjec=
ts=3D0, CPUs=3D24, Nodes=3D1
<br>[ =C2=A0=C2=A0=C2=A00.122405] ftrace: allocating 55275 entries in 216 p=
ages
<br>[ =C2=A0=C2=A0=C2=A00.129909] ftrace: allocated 216 pages with 4 groups
<br>[ =C2=A0=C2=A0=C2=A00.130500] Dynamic Preempt: voluntary
<br>[ =C2=A0=C2=A0=C2=A00.130551] rcu: Preemptible hierarchical RCU impleme=
ntation.
<br>[ =C2=A0=C2=A0=C2=A00.130551] rcu: =C2=A0=C2=A0=C2=A0=C2=A0RCU restrict=
ing CPUs from NR_CPUS=3D8192 to nr_cpu_ids=3D24.
<br>[ =C2=A0=C2=A0=C2=A00.130552] =C2=A0Trampoline variant of Tasks RCU ena=
bled.
<br>[ =C2=A0=C2=A0=C2=A00.130553] =C2=A0Rude variant of Tasks RCU enabled.
<br>[ =C2=A0=C2=A0=C2=A00.130553] =C2=A0Tracing variant of Tasks RCU enable=
d.
<br>[ =C2=A0=C2=A0=C2=A00.130554] rcu: RCU calculated value of scheduler-en=
listment delay is 100 jiffies.
<br>[ =C2=A0=C2=A0=C2=A00.130554] rcu: Adjusting geometry for rcu_fanout_le=
af=3D16, nr_cpu_ids=3D24
<br>[ =C2=A0=C2=A0=C2=A00.130561] RCU Tasks: Setting shift to 5 and lim to =
1 rcu_task_cb_adjust=3D1.
<br>[ =C2=A0=C2=A0=C2=A00.130562] RCU Tasks Rude: Setting shift to 5 and li=
m to 1 rcu_task_cb_adjust=3D1.
<br>[ =C2=A0=C2=A0=C2=A00.130564] RCU Tasks Trace: Setting shift to 5 and l=
im to 1 rcu_task_cb_adjust=3D1.
<br>[ =C2=A0=C2=A0=C2=A00.132885] NR_IRQS: 524544, nr_irqs: 1160, prealloca=
ted irqs: 16
<br>[ =C2=A0=C2=A0=C2=A00.133061] rcu: srcu_init: Setting srcu_struct sizes=
 based on contention.
<br>[ =C2=A0=C2=A0=C2=A00.133198] kfence: initialized - using 2097152 bytes=
 for 255 objects at 0x(____ptrval____)-0x(____ptrval____)
<br>[ =C2=A0=C2=A0=C2=A00.133221] Console: colour dummy device 80x25
<br>[ =C2=A0=C2=A0=C2=A00.133222] printk: legacy console [tty0] enabled
<br>[ =C2=A0=C2=A0=C2=A00.133498] ACPI: Core revision 20230628
<br>[ =C2=A0=C2=A0=C2=A00.133678] clocksource: hpet: mask: 0xffffffff max_c=
ycles: 0xffffffff, max_idle_ns: 133484873504 ns
<br>[ =C2=A0=C2=A0=C2=A00.133691] APIC: Switch to symmetric I/O mode setup
<br>[ =C2=A0=C2=A0=C2=A00.134267] AMD-Vi: ivrs, add hid:AMDI0020, uid:\_SB.=
FUR0, rdevid:160
<br>[ =C2=A0=C2=A0=C2=A00.134269] AMD-Vi: ivrs, add hid:AMDI0020, uid:\_SB.=
FUR1, rdevid:160
<br>[ =C2=A0=C2=A0=C2=A00.134270] AMD-Vi: ivrs, add hid:AMDI0020, uid:\_SB.=
FUR2, rdevid:160
<br>[ =C2=A0=C2=A0=C2=A00.134271] AMD-Vi: ivrs, add hid:AMDI0020, uid:\_SB.=
FUR3, rdevid:160
<br>[ =C2=A0=C2=A0=C2=A00.134272] AMD-Vi: Using global IVHD EFR:0x246577efa=
2254afa, EFR2:0x0
<br>[ =C2=A0=C2=A0=C2=A00.134498] x2apic: IRQ remapping doesn&#39;t support=
 X2APIC mode
<br>[ =C2=A0=C2=A0=C2=A00.134504] APIC: Switched APIC routing to: physical =
flat
<br>[ =C2=A0=C2=A0=C2=A00.135217] ..TIMER: vector=3D0x30 apic1=3D0 pin1=3D2=
 apic2=3D-1 pin2=3D-1
<br>[ =C2=A0=C2=A0=C2=A00.139697] clocksource: tsc-early: mask: 0xfffffffff=
fffffff max_cycles: 0x2b29c2378fd, max_idle_ns: 44079529291
<br>3 ns
<br>[ =C2=A0=C2=A0=C2=A00.139700] Calibrating delay loop (skipped), value c=
alculated using timer frequency.. 5988.88 BogoMIPS (lpj=3D299
<br>4441)
<br>[ =C2=A0=C2=A0=C2=A00.139712] x86/cpu: User Mode Instruction Prevention=
 (UMIP) activated
<br>[ =C2=A0=C2=A0=C2=A00.139752] LVT offset 1 assigned for vector 0xf9
<br>[ =C2=A0=C2=A0=C2=A00.139877] LVT offset 2 assigned for vector 0xf4
<br>[ =C2=A0=C2=A0=C2=A00.139915] Last level iTLB entries: 4KB 512, 2MB 512=
, 4MB 256
<br>[ =C2=A0=C2=A0=C2=A00.139916] Last level dTLB entries: 4KB 3072, 2MB 30=
72, 4MB 1536, 1GB 0
<br>[ =C2=A0=C2=A0=C2=A00.139918] process: using mwait in idle threads
<br>[ =C2=A0=C2=A0=C2=A00.139921] Spectre V2 : User space: Vulnerable
<br>[ =C2=A0=C2=A0=C2=A00.139922] Speculative Store Bypass: Vulnerable
<br>[ =C2=A0=C2=A0=C2=A00.139926] x86/fpu: Supporting XSAVE feature 0x001: =
&#39;x87 floating point registers&#39;
<br>[ =C2=A0=C2=A0=C2=A00.139928] x86/fpu: Supporting XSAVE feature 0x002: =
&#39;SSE registers&#39;
<br>[ =C2=A0=C2=A0=C2=A00.139929] x86/fpu: Supporting XSAVE feature 0x004: =
&#39;AVX registers&#39;
<br>[ =C2=A0=C2=A0=C2=A00.139930] x86/fpu: Supporting XSAVE feature 0x020: =
&#39;AVX-512 opmask&#39;
<br>[ =C2=A0=C2=A0=C2=A00.139931] x86/fpu: Supporting XSAVE feature 0x040: =
&#39;AVX-512 Hi256&#39;
<br>[ =C2=A0=C2=A0=C2=A00.139932] x86/fpu: Supporting XSAVE feature 0x080: =
&#39;AVX-512 ZMM_Hi256&#39;
<br>[ =C2=A0=C2=A0=C2=A00.139933] x86/fpu: Supporting XSAVE feature 0x200: =
&#39;Protection Keys User registers&#39;
<br>[ =C2=A0=C2=A0=C2=A00.139934] x86/fpu: Supporting XSAVE feature 0x800: =
&#39;Control-flow User registers&#39;
<br>[ =C2=A0=C2=A0=C2=A00.139936] x86/fpu: xstate_offset[2]: =C2=A0576, xst=
ate_sizes[2]: =C2=A0256
<br>[ =C2=A0=C2=A0=C2=A00.139937] x86/fpu: xstate_offset[5]: =C2=A0832, xst=
ate_sizes[5]: =C2=A0=C2=A064
<br>[ =C2=A0=C2=A0=C2=A00.139938] x86/fpu: xstate_offset[6]: =C2=A0896, xst=
ate_sizes[6]: =C2=A0512
<br>[ =C2=A0=C2=A0=C2=A00.139939] x86/fpu: xstate_offset[7]: 1408, xstate_s=
izes[7]: 1024
<br>[ =C2=A0=C2=A0=C2=A00.139940] x86/fpu: xstate_offset[9]: 2432, xstate_s=
izes[9]: =C2=A0=C2=A0=C2=A08
<br>[ =C2=A0=C2=A0=C2=A00.139941] x86/fpu: xstate_offset[11]: 2440, xstate_=
sizes[11]: =C2=A0=C2=A016
<br>[ =C2=A0=C2=A0=C2=A00.139942] x86/fpu: Enabled xstate features 0xae7, c=
ontext size is 2456 bytes, using &#39;compacted&#39; format.
<br>[ =C2=A0=C2=A0=C2=A00.152488] Freeing SMP alternatives memory: 48K
<br>[ =C2=A0=C2=A0=C2=A00.152490] pid_max: default: 32768 minimum: 301
<br>[ =C2=A0=C2=A0=C2=A00.153717] LSM: initializing lsm=3Dlockdown,capabili=
ty,yama,bpf,landlock,ima,evm
<br>[ =C2=A0=C2=A0=C2=A00.153731] Yama: becoming mindful.
<br>[ =C2=A0=C2=A0=C2=A00.153734] LSM support for eBPF active
<br>[ =C2=A0=C2=A0=C2=A00.153735] landlock: Up and running.
<br>[ =C2=A0=C2=A0=C2=A00.153801] Mount-cache hash table entries: 131072 (o=
rder: 8, 1048576 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A00.153859] Mountpoint-cache hash table entries: 1310=
72 (order: 8, 1048576 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A00.258511] smpboot: CPU0: AMD Ryzen 9 7845HX with Ra=
deon Graphics (family: 0x19, model: 0x61, stepping: 0x2)
<br>[ =C2=A0=C2=A0=C2=A00.258603] Performance Events: Fam17h+ 16-deep LBR, =
core perfctr, AMD PMU driver.
<br>[ =C2=A0=C2=A0=C2=A00.258615] ... version: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A02
<br>[ =C2=A0=C2=A0=C2=A00.258616] ... bit width: =C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A048
<br>[ =C2=A0=C2=A0=C2=A00.258616] ... generic registers: =C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A06
<br>[ =C2=A0=C2=A0=C2=A00.258617] ... value mask: =C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00000ffffffffffff
<br>[ =C2=A0=C2=A0=C2=A00.258618] ... max period: =C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A000007fffffffffff
<br>[ =C2=A0=C2=A0=C2=A00.258619] ... fixed-purpose events: =C2=A0=C2=A00
<br>[ =C2=A0=C2=A0=C2=A00.258619] ... event mask: =C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0000000000000003f
<br>[ =C2=A0=C2=A0=C2=A00.258660] signal: max sigframe size: 3376
<br>[ =C2=A0=C2=A0=C2=A00.258672] rcu: Hierarchical SRCU implementation.
<br>[ =C2=A0=C2=A0=C2=A00.258673] rcu: =C2=A0=C2=A0=C2=A0=C2=A0Max phase no=
-delay instances is 400.
<br>[ =C2=A0=C2=A0=C2=A00.258699] NMI watchdog: Enabled. Permanently consum=
es one hw-PMU counter.
<br>[ =C2=A0=C2=A0=C2=A00.258699] smp: Bringing up secondary CPUs ...
<br>[ =C2=A0=C2=A0=C2=A00.258699] smpboot: x86: Booting SMP configuration:
<br>[ =C2=A0=C2=A0=C2=A00.258699] .... node =C2=A0#0, CPUs: =C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0#2 =C2=A0#4 =C2=A0#6 =C2=A0#8 #10 #12 #14 #16 #1=
8 #20 #22 =C2=A0#1 =C2=A0#3 =C2=A0#5 =C2=A0#7 =C2=A0#9 #11 #13 #
<br>15 #17 #19 #21 #23
<br>[ =C2=A0=C2=A0=C2=A00.284722] smp: Brought up 1 node, 24 CPUs
<br>[ =C2=A0=C2=A0=C2=A00.284722] smpboot: Total of 24 processors activated=
 (143733.16 BogoMIPS)
<br>[ =C2=A0=C2=A0=C2=A00.285983] devtmpfs: initialized
<br>[ =C2=A0=C2=A0=C2=A00.286723] x86/mm: Memory block size: 2048MB
<br>[ =C2=A0=C2=A0=C2=A00.287113] ACPI: PM: Registering ACPI NVS region [me=
m 0x09f00000-0x09f11fff] (73728 bytes)
<br>[ =C2=A0=C2=A0=C2=A00.287113] ACPI: PM: Registering ACPI NVS region [me=
m 0xb2f7f000-0xbaf7efff] (134217728 bytes)
<br>[ =C2=A0=C2=A0=C2=A00.287221] clocksource: jiffies: mask: 0xffffffff ma=
x_cycles: 0xffffffff, max_idle_ns: 1911260446275000 ns
<br>[ =C2=A0=C2=A0=C2=A00.287225] futex hash table entries: 8192 (order: 7,=
 524288 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A00.287274] pinctrl core: initialized pinctrl subsyst=
em
<br>[ =C2=A0=C2=A0=C2=A00.287747] PM: RTC time: 18:01:30, date: 2024-05-15
<br>[ =C2=A0=C2=A0=C2=A00.287917] NET: Registered PF_NETLINK/PF_ROUTE proto=
col family
<br>[ =C2=A0=C2=A0=C2=A00.287967] DMA: preallocated 4096 KiB GFP_KERNEL poo=
l for atomic allocations
<br>[ =C2=A0=C2=A0=C2=A00.287970] DMA: preallocated 4096 KiB GFP_KERNEL|GFP=
_DMA pool for atomic allocations
<br>[ =C2=A0=C2=A0=C2=A00.287973] DMA: preallocated 4096 KiB GFP_KERNEL|GFP=
_DMA32 pool for atomic allocations
<br>[ =C2=A0=C2=A0=C2=A00.287980] audit: initializing netlink subsys (disab=
led)
<br>[ =C2=A0=C2=A0=C2=A00.287983] audit: type=3D2000 audit(1715796090.153:1=
): state=3Dinitialized audit_enabled=3D0 res=3D1
<br>[ =C2=A0=C2=A0=C2=A00.287983] thermal_sys: Registered thermal governor =
&#39;fair_share&#39;
<br>[ =C2=A0=C2=A0=C2=A00.287983] thermal_sys: Registered thermal governor =
&#39;bang_bang&#39;
<br>[ =C2=A0=C2=A0=C2=A00.287983] thermal_sys: Registered thermal governor =
&#39;step_wise&#39;
<br>[ =C2=A0=C2=A0=C2=A00.287983] thermal_sys: Registered thermal governor =
&#39;user_space&#39;
<br>[ =C2=A0=C2=A0=C2=A00.287983] cpuidle: using governor menu
<br>[ =C2=A0=C2=A0=C2=A00.287983] Simple Boot Flag at 0x44 set to 0x80
<br>[ =C2=A0=C2=A0=C2=A00.287983] acpiphp: ACPI Hot Plug PCI Controller Dri=
ver version: 0.5
<br>[ =C2=A0=C2=A0=C2=A00.287983] PCI: ECAM [mem 0xf0000000-0xf7ffffff] (ba=
se 0xf0000000) for domain 0000 [bus 00-7f]
<br>[ =C2=A0=C2=A0=C2=A00.287983] PCI: not using ECAM ([mem 0xf0000000-0xf7=
ffffff] not reserved)
<br>[ =C2=A0=C2=A0=C2=A00.287983] PCI: Using configuration type 1 for base =
access
<br>[ =C2=A0=C2=A0=C2=A00.287983] PCI: Using configuration type 1 for exten=
ded access
<br>[ =C2=A0=C2=A0=C2=A00.287983] kprobes: kprobe jump-optimization is enab=
led. All kprobes are optimized if possible.
<br>[ =C2=A0=C2=A0=C2=A00.287983] HugeTLB: registered 1.00 GiB page size, p=
re-allocated 0 pages
<br>[ =C2=A0=C2=A0=C2=A00.287983] HugeTLB: 16380 KiB vmemmap can be freed f=
or a 1.00 GiB page
<br>[ =C2=A0=C2=A0=C2=A00.287983] HugeTLB: registered 2.00 MiB page size, p=
re-allocated 0 pages
<br>[ =C2=A0=C2=A0=C2=A00.287983] HugeTLB: 28 KiB vmemmap can be freed for =
a 2.00 MiB page
<br>[ =C2=A0=C2=A0=C2=A00.287983] Demotion targets for Node 0: null
<br>[ =C2=A0=C2=A0=C2=A00.287983] cryptd: max_cpu_qlen set to 1000
<br>[ =C2=A0=C2=A0=C2=A00.287983] raid6: skipped pq benchmark and selected =
avx512x4
<br>[ =C2=A0=C2=A0=C2=A00.287983] raid6: using avx512x2 recovery algorithm
<br>[ =C2=A0=C2=A0=C2=A00.287983] fbcon: Taking over console
<br>[ =C2=A0=C2=A0=C2=A00.287983] ACPI: Added _OSI(Module Device)
<br>[ =C2=A0=C2=A0=C2=A00.287983] ACPI: Added _OSI(Processor Device)
<br>[ =C2=A0=C2=A0=C2=A00.287983] ACPI: Added _OSI(3.0 _SCP Extensions)
<br>[ =C2=A0=C2=A0=C2=A00.287983] ACPI: Added _OSI(Processor Aggregator Dev=
ice)
<br>[ =C2=A0=C2=A0=C2=A00.291401] ACPI BIOS Error (bug): Could not resolve =
symbol [\_SB.PCI0.LPC0.EC0], AE_NOT_FOUND (20230628/dswload
<br>2-162)
<br>[ =C2=A0=C2=A0=C2=A00.291405] ACPI Error: AE_NOT_FOUND, During name loo=
kup/catalog (20230628/psobject-220)
<br>[ =C2=A0=C2=A0=C2=A00.291407] ACPI: Skipping parse of AML opcode: Opcod=
eName unavailable (0x0010)
<br>[ =C2=A0=C2=A0=C2=A00.293053] ACPI BIOS Error (bug): Failure creating n=
amed object [\_SB.PCI0.GPP0._PRW], AE_ALREADY_EXISTS (20230
<br>628/dswload2-326)
<br>[ =C2=A0=C2=A0=C2=A00.293056] ACPI Error: AE_ALREADY_EXISTS, During nam=
e lookup/catalog (20230628/psobject-220)
<br>[ =C2=A0=C2=A0=C2=A00.293503] ACPI: 29 ACPI AML tables successfully acq=
uired and loaded
<br>[ =C2=A0=C2=A0=C2=A00.293607] ACPI Error: AE_NOT_FOUND, While resolving=
 a named reference package element - \_SB_.PCI0.GPP2.UP00.D
<br>P00.U4UP.U4P3.UHI0 (20230628/dspkginit-438)
<br>[ =C2=A0=C2=A0=C2=A00.293616] ACPI Error: AE_NOT_FOUND, While resolving=
 a named reference package element - \_SB_.PCI0.GPP2.UP00.D
<br>P00.U4UP.U4P3.UHI0 (20230628/dspkginit-438)
<br>[ =C2=A0=C2=A0=C2=A00.293624] ACPI Error: AE_NOT_FOUND, While resolving=
 a named reference package element - \_SB_.PCI0.GPP2.UP00.D
<br>P00.U4UP.U4P3.UHI0 (20230628/dspkginit-438)
<br>[ =C2=A0=C2=A0=C2=A00.293634] ACPI Error: AE_NOT_FOUND, While resolving=
 a named reference package element - \_SB_.PCI0.GPP2.UP00.D
<br>P00.U4UP.U4P3.UHI0 (20230628/dspkginit-438)
<br>[ =C2=A0=C2=A0=C2=A00.293638] ACPI Error: AE_NOT_FOUND, While resolving=
 a named reference package element - \_SB_.PCI0.GPP2.UP00.D
<br>P00.U4UP.U4P3.UHI0 (20230628/dspkginit-438)
<br>[ =C2=A0=C2=A0=C2=A00.296820] ACPI: [Firmware Bug]: BIOS _OSI(Linux) qu=
ery ignored
<br>[ =C2=A0=C2=A0=C2=A00.432406] ACPI: _OSC evaluation for CPUs failed, tr=
ying _PDC
<br>[ =C2=A0=C2=A0=C2=A00.432607] ACPI: EC: EC started
<br>[ =C2=A0=C2=A0=C2=A00.432608] ACPI: EC: interrupt blocked
<br>[ =C2=A0=C2=A0=C2=A00.435765] ACPI: EC: EC_CMD/EC_SC=3D0x66, EC_DATA=3D=
0x62
<br>[ =C2=A0=C2=A0=C2=A00.435767] ACPI: \_SB_.PCI0.LPC0.EC__: Boot DSDT EC =
used to handle transactions
<br>[ =C2=A0=C2=A0=C2=A00.435769] ACPI: Interpreter enabled
<br>[ =C2=A0=C2=A0=C2=A00.435782] ACPI: PM: (supports S0 S4 S5)
<br>[ =C2=A0=C2=A0=C2=A00.435784] ACPI: Using IOAPIC for interrupt routing
<br>[ =C2=A0=C2=A0=C2=A00.436152] PCI: ECAM [mem 0xf0000000-0xf7ffffff] (ba=
se 0xf0000000) for domain 0000 [bus 00-7f]
<br>[ =C2=A0=C2=A0=C2=A00.437055] PCI: [Firmware Info]: ECAM [mem 0xf000000=
0-0xf7ffffff] not reserved in ACPI motherboard resources
<br>[ =C2=A0=C2=A0=C2=A00.437057] PCI: not using ECAM ([mem 0xf0000000-0xf7=
ffffff] not reserved)
<br>[ =C2=A0=C2=A0=C2=A00.437060] PCI: Using host bridge windows from ACPI;=
 if necessary, use &quot;pci=3Dnocrs&quot; and report a bug
<br>[ =C2=A0=C2=A0=C2=A00.437062] PCI: Ignoring E820 reservations for host =
bridge windows
<br>[ =C2=A0=C2=A0=C2=A00.437196] ACPI: Enabled 6 GPEs in block 00 to 1F
<br>[ =C2=A0=C2=A0=C2=A00.438111] ACPI: \_SB_.PCI0.GPP0.M237: New power res=
ource
<br>[ =C2=A0=C2=A0=C2=A00.438153] ACPI: \_SB_.PCI0.GPP0.SWUS.M237: New powe=
r resource
<br>[ =C2=A0=C2=A0=C2=A00.438175] ACPI: \_SB_.PCI0.GPP0.SWUS.SWDS.M237: New=
 power resource
<br>[ =C2=A0=C2=A0=C2=A00.438307] ACPI: \_SB_.PCI0.GPP1.P0NV: New power res=
ource
<br>[ =C2=A0=C2=A0=C2=A00.438666] ACPI: \_SB_.PCI0.GPP2.PWRS: New power res=
ource
<br>[ =C2=A0=C2=A0=C2=A00.620667] ACPI: \_SB_.PCI0.GPP2.U4UP.PWRS: New powe=
r resource
<br>[ =C2=A0=C2=A0=C2=A00.627380] ACPI: \_SB_.PCI0.GPP2.U4UP.U4P0.PWRS: New=
 power resource
<br>[ =C2=A0=C2=A0=C2=A00.627709] ACPI: \_SB_.PCI0.GPP2.U4UP.U4P0.UP0D.PWRS=
: New power resource
<br>[ =C2=A0=C2=A0=C2=A00.627848] ACPI: \_SB_.PCI0.GPP2.U4UP.U4P1.PWRS: New=
 power resource
<br>[ =C2=A0=C2=A0=C2=A00.628168] ACPI: \_SB_.PCI0.GPP2.U4UP.U4P1.UP1D.PWRS=
: New power resource
<br>[ =C2=A0=C2=A0=C2=A00.628303] ACPI: \_SB_.PCI0.GPP2.U4UP.U4P2.PWRS: New=
 power resource
<br>[ =C2=A0=C2=A0=C2=A00.634005] ACPI: \_SB_.PCI0.GPP2.U4UP.U4P2.UXHC.PWRS=
: New power resource
<br>[ =C2=A0=C2=A0=C2=A00.637087] ACPI: \_SB_.PCI0.GPP2.U4UP.U4P3.PWRS: New=
 power resource
<br>[ =C2=A0=C2=A0=C2=A00.637406] ACPI: \_SB_.PCI0.GPP2.U4UP.U4P3.UHI0.PWRS=
: New power resource
<br>[ =C2=A0=C2=A0=C2=A00.637460] ACPI: \_SB_.PCI0.GPP3.PWR1: New power res=
ource
<br>[ =C2=A0=C2=A0=C2=A00.637502] ACPI: \_SB_.PCI0.GPP3.WLAN.WRST: New powe=
r resource
<br>[ =C2=A0=C2=A0=C2=A00.637513] ACPI: \_SB_.PCI0.GPP4.PWR1: New power res=
ource
<br>[ =C2=A0=C2=A0=C2=A00.637555] ACPI: \_SB_.PCI0.GPP5.PWR1: New power res=
ource
<br>[ =C2=A0=C2=A0=C2=A00.637677] ACPI: \_SB_.PCI0.GPP7.P0NV: New power res=
ource
<br>[ =C2=A0=C2=A0=C2=A00.638075] ACPI: \_SB_.PCI0.GP17.XHC0.P0U0: New powe=
r resource
<br>[ =C2=A0=C2=A0=C2=A00.638393] ACPI: \_SB_.PCI0.GP17.XHC1.P0U1: New powe=
r resource
<br>[ =C2=A0=C2=A0=C2=A00.638558] ACPI: \_SB_.PCI0.GP17.XHC1.RHUB.PRT1.HB01=
.BRST: New power resource
<br>[ =C2=A0=C2=A0=C2=A00.638825] ACPI: \_SB_.PCI0.GP19.XHC2.P0U2: New powe=
r resource
<br>[ =C2=A0=C2=A0=C2=A00.646056] ACPI: PCI: Interrupt link LNKA configured=
 for IRQ 0
<br>[ =C2=A0=C2=A0=C2=A00.646058] ACPI: PCI: Interrupt link LNKA disabled
<br>[ =C2=A0=C2=A0=C2=A00.646116] ACPI: PCI: Interrupt link LNKB configured=
 for IRQ 0
<br>[ =C2=A0=C2=A0=C2=A00.646117] ACPI: PCI: Interrupt link LNKB disabled
<br>[ =C2=A0=C2=A0=C2=A00.646175] ACPI: PCI: Interrupt link LNKC configured=
 for IRQ 0
<br>[ =C2=A0=C2=A0=C2=A00.646175] ACPI: PCI: Interrupt link LNKC disabled
<br>[ =C2=A0=C2=A0=C2=A00.646233] ACPI: PCI: Interrupt link LNKD configured=
 for IRQ 0
<br>[ =C2=A0=C2=A0=C2=A00.646234] ACPI: PCI: Interrupt link LNKD disabled
<br>[ =C2=A0=C2=A0=C2=A00.646295] ACPI: PCI: Interrupt link LNKE configured=
 for IRQ 0
<br>[ =C2=A0=C2=A0=C2=A00.646296] ACPI: PCI: Interrupt link LNKE disabled
<br>[ =C2=A0=C2=A0=C2=A00.646353] ACPI: PCI: Interrupt link LNKF configured=
 for IRQ 0
<br>[ =C2=A0=C2=A0=C2=A00.646354] ACPI: PCI: Interrupt link LNKF disabled
<br>[ =C2=A0=C2=A0=C2=A00.646410] ACPI: PCI: Interrupt link LNKG configured=
 for IRQ 0
<br>[ =C2=A0=C2=A0=C2=A00.646411] ACPI: PCI: Interrupt link LNKG disabled
<br>[ =C2=A0=C2=A0=C2=A00.646468] ACPI: PCI: Interrupt link LNKH configured=
 for IRQ 0
<br>[ =C2=A0=C2=A0=C2=A00.646469] ACPI: PCI: Interrupt link LNKH disabled
<br>[ =C2=A0=C2=A0=C2=A00.646530] ACPI: PCI Root Bridge [PCI0] (domain 0000=
 [bus 00-ff])
<br>[ =C2=A0=C2=A0=C2=A00.646534] acpi PNP0A08:00: _OSC: OS supports [Exten=
dedConfig ASPM ClockPM Segments MSI EDR HPX-Type3]
<br>[ =C2=A0=C2=A0=C2=A00.646549] acpi PNP0A08:00: _OSC: platform does not =
support [SHPCHotplug AER]
<br>[ =C2=A0=C2=A0=C2=A00.646571] acpi PNP0A08:00: _OSC: OS now controls [P=
CIeHotplug PME PCIeCapability LTR DPC]
<br>[ =C2=A0=C2=A0=C2=A00.646681] PCI host bridge to bus 0000:00
<br>[ =C2=A0=C2=A0=C2=A00.646682] pci_bus 0000:00: root bus resource [io =
=C2=A00x0000-0x0cf7 window]
<br>[ =C2=A0=C2=A0=C2=A00.646685] pci_bus 0000:00: root bus resource [io =
=C2=A00x0d00-0xffff window]
<br>[ =C2=A0=C2=A0=C2=A00.646686] pci_bus 0000:00: root bus resource [mem 0=
x000a0000-0x000bffff window]
<br>[ =C2=A0=C2=A0=C2=A00.646687] pci_bus 0000:00: root bus resource [mem 0=
x000c0000-0x000cffff window]
<br>[ =C2=A0=C2=A0=C2=A00.646688] pci_bus 0000:00: root bus resource [mem 0=
x000d0000-0x000effff window]
<br>[ =C2=A0=C2=A0=C2=A00.646689] pci_bus 0000:00: root bus resource [mem 0=
xc0000000-0xc11fffff window]
<br>[ =C2=A0=C2=A0=C2=A00.646690] pci_bus 0000:00: root bus resource [mem 0=
xf8000000-0xfe000000 window]
<br>[ =C2=A0=C2=A0=C2=A00.646691] pci_bus 0000:00: root bus resource [mem 0=
xfed45000-0xfed814ff window]
<br>[ =C2=A0=C2=A0=C2=A00.646692] pci_bus 0000:00: root bus resource [mem 0=
xfed81900-0xfed81fff window]
<br>[ =C2=A0=C2=A0=C2=A00.646693] pci_bus 0000:00: root bus resource [mem 0=
xfedc0000-0xfedc0fff window]
<br>[ =C2=A0=C2=A0=C2=A00.646694] pci_bus 0000:00: root bus resource [mem 0=
xfedc6000-0xfedc6fff window]
<br>[ =C2=A0=C2=A0=C2=A00.646695] pci_bus 0000:00: root bus resource [mem 0=
x10020200000-0xfffffffffff window]
<br>[ =C2=A0=C2=A0=C2=A00.646696] pci_bus 0000:00: root bus resource [bus 0=
0-ff]
<br>[ =C2=A0=C2=A0=C2=A00.646743] pci 0000:00:00.0: [1022:14d8] type 00 cla=
ss 0x060000 conventional PCI endpoint
<br>[ =C2=A0=C2=A0=C2=A00.646793] pci 0000:00:00.2: [1022:14d9] type 00 cla=
ss 0x080600 conventional PCI endpoint
<br>[ =C2=A0=C2=A0=C2=A00.646853] pci 0000:00:01.0: [1022:14da] type 00 cla=
ss 0x060000 conventional PCI endpoint
<br>[ =C2=A0=C2=A0=C2=A00.646893] pci 0000:00:01.1: [1022:14db] type 01 cla=
ss 0x060400 PCIe Root Port
<br>[ =C2=A0=C2=A0=C2=A00.646909] pci 0000:00:01.1: PCI bridge to [bus 01-0=
3]
<br>[ =C2=A0=C2=A0=C2=A00.646912] pci 0000:00:01.1: =C2=A0=C2=A0bridge wind=
ow [io =C2=A00x2000-0x2fff]
<br>[ =C2=A0=C2=A0=C2=A00.646915] pci 0000:00:01.1: =C2=A0=C2=A0bridge wind=
ow [mem 0xc0e00000-0xc10fffff]
<br>[ =C2=A0=C2=A0=C2=A00.646920] pci 0000:00:01.1: =C2=A0=C2=A0bridge wind=
ow [mem 0xffc00000000-0xffe0fffffff 64bit pref]
<br>[ =C2=A0=C2=A0=C2=A00.646971] pci 0000:00:01.1: PME# supported from D0 =
D3hot D3cold
<br>[ =C2=A0=C2=A0=C2=A00.647017] pci 0000:00:01.2: [1022:14db] type 01 cla=
ss 0x060400 PCIe Root Port
<br>[ =C2=A0=C2=A0=C2=A00.647032] pci 0000:00:01.2: PCI bridge to [bus 04]
<br>[ =C2=A0=C2=A0=C2=A00.647037] pci 0000:00:01.2: =C2=A0=C2=A0bridge wind=
ow [mem 0xc0d00000-0xc0dfffff]
<br>[ =C2=A0=C2=A0=C2=A00.647086] pci 0000:00:01.2: PME# supported from D0 =
D3hot D3cold
<br>[ =C2=A0=C2=A0=C2=A00.647126] pci 0000:00:01.3: [1022:14db] type 01 cla=
ss 0x060400 PCIe Root Port
<br>[ =C2=A0=C2=A0=C2=A00.647141] pci 0000:00:01.3: PCI bridge to [bus 05]
<br>[ =C2=A0=C2=A0=C2=A00.647145] pci 0000:00:01.3: =C2=A0=C2=A0bridge wind=
ow [mem 0xc0c00000-0xc0cfffff]
<br>[ =C2=A0=C2=A0=C2=A00.647194] pci 0000:00:01.3: PME# supported from D0 =
D3hot D3cold
<br>[ =C2=A0=C2=A0=C2=A00.647237] pci 0000:00:02.0: [1022:14da] type 00 cla=
ss 0x060000 conventional PCI endpoint
<br>[ =C2=A0=C2=A0=C2=A00.647279] pci 0000:00:02.1: [1022:14db] type 01 cla=
ss 0x060400 PCIe Root Port
<br>[ =C2=A0=C2=A0=C2=A00.647294] pci 0000:00:02.1: PCI bridge to [bus 06-0=
8]
<br>[ =C2=A0=C2=A0=C2=A00.647299] pci 0000:00:02.1: =C2=A0=C2=A0bridge wind=
ow [mem 0xc0800000-0xc0bfffff]
<br>[ =C2=A0=C2=A0=C2=A00.647390] pci 0000:00:02.1: PME# supported from D0 =
D3hot D3cold
<br>[ =C2=A0=C2=A0=C2=A00.647435] pci 0000:00:02.2: [1022:14db] type 01 cla=
ss 0x060400 PCIe Root Port
<br>[ =C2=A0=C2=A0=C2=A00.647450] pci 0000:00:02.2: PCI bridge to [bus 09]
<br>[ =C2=A0=C2=A0=C2=A00.647455] pci 0000:00:02.2: =C2=A0=C2=A0bridge wind=
ow [mem 0xc0700000-0xc07fffff]
<br>[ =C2=A0=C2=A0=C2=A00.647503] pci 0000:00:02.2: PME# supported from D0 =
D3hot D3cold
<br>[ =C2=A0=C2=A0=C2=A00.647550] pci 0000:00:03.0: [1022:14da] type 00 cla=
ss 0x060000 conventional PCI endpoint
<br>[ =C2=A0=C2=A0=C2=A00.647590] pci 0000:00:03.1: [1022:14db] type 01 cla=
ss 0x060400 PCIe Root Port
<br>[ =C2=A0=C2=A0=C2=A00.647605] pci 0000:00:03.1: PCI bridge to [bus 0a]
<br>[ =C2=A0=C2=A0=C2=A00.647610] pci 0000:00:03.1: =C2=A0=C2=A0bridge wind=
ow [mem 0xc0600000-0xc06fffff]
<br>[ =C2=A0=C2=A0=C2=A00.647658] pci 0000:00:03.1: PME# supported from D0 =
D3hot D3cold
<br>[ =C2=A0=C2=A0=C2=A00.647699] pci 0000:00:03.2: [1022:14db] type 01 cla=
ss 0x060400 PCIe Root Port
<br>[ =C2=A0=C2=A0=C2=A00.647715] pci 0000:00:03.2: PCI bridge to [bus 0b]
<br>[ =C2=A0=C2=A0=C2=A00.647718] pci 0000:00:03.2: =C2=A0=C2=A0bridge wind=
ow [io =C2=A00x1000-0x1fff]
<br>[ =C2=A0=C2=A0=C2=A00.647720] pci 0000:00:03.2: =C2=A0=C2=A0bridge wind=
ow [mem 0xc0500000-0xc05fffff]
<br>[ =C2=A0=C2=A0=C2=A00.647768] pci 0000:00:03.2: PME# supported from D0 =
D3hot D3cold
<br>[ =C2=A0=C2=A0=C2=A00.647814] pci 0000:00:04.0: [1022:14da] type 00 cla=
ss 0x060000 conventional PCI endpoint
<br>[ =C2=A0=C2=A0=C2=A00.647865] pci 0000:00:08.0: [1022:14da] type 00 cla=
ss 0x060000 conventional PCI endpoint
<br>[ =C2=A0=C2=A0=C2=A00.647908] pci 0000:00:08.1: [1022:14dd] type 01 cla=
ss 0x060400 PCIe Root Port
<br>[ =C2=A0=C2=A0=C2=A00.647921] pci 0000:00:08.1: PCI bridge to [bus 0c]
<br>[ =C2=A0=C2=A0=C2=A00.647925] pci 0000:00:08.1: =C2=A0=C2=A0bridge wind=
ow [mem 0xc0100000-0xc04fffff]
<br>[ =C2=A0=C2=A0=C2=A00.647934] pci 0000:00:08.1: enabling Extended Tags
<br>[ =C2=A0=C2=A0=C2=A00.647953] pci 0000:00:08.1: PME# supported from D0 =
D3hot D3cold
<br>[ =C2=A0=C2=A0=C2=A00.647998] pci 0000:00:08.3: [1022:14dd] type 01 cla=
ss 0x060400 PCIe Root Port
<br>[ =C2=A0=C2=A0=C2=A00.648011] pci 0000:00:08.3: PCI bridge to [bus 0d]
<br>[ =C2=A0=C2=A0=C2=A00.648015] pci 0000:00:08.3: =C2=A0=C2=A0bridge wind=
ow [mem 0xc0000000-0xc00fffff]
<br>[ =C2=A0=C2=A0=C2=A00.648024] pci 0000:00:08.3: enabling Extended Tags
<br>[ =C2=A0=C2=A0=C2=A00.648043] pci 0000:00:08.3: PME# supported from D0 =
D3hot D3cold
<br>[ =C2=A0=C2=A0=C2=A00.648094] pci 0000:00:14.0: [1022:790b] type 00 cla=
ss 0x0c0500 conventional PCI endpoint
<br>[ =C2=A0=C2=A0=C2=A00.648184] pci 0000:00:14.3: [1022:790e] type 00 cla=
ss 0x060100 conventional PCI endpoint
<br>[ =C2=A0=C2=A0=C2=A00.648282] pci 0000:00:18.0: [1022:14e0] type 00 cla=
ss 0x060000 conventional PCI endpoint
<br>[ =C2=A0=C2=A0=C2=A00.648302] pci 0000:00:18.1: [1022:14e1] type 00 cla=
ss 0x060000 conventional PCI endpoint
<br>[ =C2=A0=C2=A0=C2=A00.648320] pci 0000:00:18.2: [1022:14e2] type 00 cla=
ss 0x060000 conventional PCI endpoint
<br>[ =C2=A0=C2=A0=C2=A00.648338] pci 0000:00:18.3: [1022:14e3] type 00 cla=
ss 0x060000 conventional PCI endpoint
<br>[ =C2=A0=C2=A0=C2=A00.648357] pci 0000:00:18.4: [1022:14e4] type 00 cla=
ss 0x060000 conventional PCI endpoint
<br>[ =C2=A0=C2=A0=C2=A00.648375] pci 0000:00:18.5: [1022:14e5] type 00 cla=
ss 0x060000 conventional PCI endpoint
<br>[ =C2=A0=C2=A0=C2=A00.648394] pci 0000:00:18.6: [1022:14e6] type 00 cla=
ss 0x060000 conventional PCI endpoint
<br>[ =C2=A0=C2=A0=C2=A00.648413] pci 0000:00:18.7: [1022:14e7] type 00 cla=
ss 0x060000 conventional PCI endpoint
<br>[ =C2=A0=C2=A0=C2=A00.648507] pci 0000:01:00.0: [1002:1478] type 01 cla=
ss 0x060400 PCIe Switch Upstream Port
<br>[ =C2=A0=C2=A0=C2=A00.648520] pci 0000:01:00.0: BAR 0 [mem 0xc1000000-0=
xc1003fff]
<br>[ =C2=A0=C2=A0=C2=A00.648535] pci 0000:01:00.0: PCI bridge to [bus 02-0=
3]
<br>[ =C2=A0=C2=A0=C2=A00.648540] pci 0000:01:00.0: =C2=A0=C2=A0bridge wind=
ow [io =C2=A00x2000-0x2fff]
<br>[ =C2=A0=C2=A0=C2=A00.648543] pci 0000:01:00.0: =C2=A0=C2=A0bridge wind=
ow [mem 0xc0e00000-0xc0ffffff]
<br>[ =C2=A0=C2=A0=C2=A00.648552] pci 0000:01:00.0: =C2=A0=C2=A0bridge wind=
ow [mem 0xffc00000000-0xffe0fffffff 64bit pref]
<br>[ =C2=A0=C2=A0=C2=A00.648600] pci 0000:01:00.0: PME# supported from D0 =
D3hot D3cold
<br>[ =C2=A0=C2=A0=C2=A00.648650] pci 0000:00:01.1: PCI bridge to [bus 01-0=
3]
<br>[ =C2=A0=C2=A0=C2=A00.648709] pci 0000:02:00.0: [1002:1479] type 01 cla=
ss 0x060400 PCIe Switch Downstream Port
<br>[ =C2=A0=C2=A0=C2=A00.648735] pci 0000:02:00.0: PCI bridge to [bus 03]
<br>[ =C2=A0=C2=A0=C2=A00.648740] pci 0000:02:00.0: =C2=A0=C2=A0bridge wind=
ow [io =C2=A00x2000-0x2fff]
<br>[ =C2=A0=C2=A0=C2=A00.648743] pci 0000:02:00.0: =C2=A0=C2=A0bridge wind=
ow [mem 0xc0e00000-0xc0ffffff]
<br>[ =C2=A0=C2=A0=C2=A00.648752] pci 0000:02:00.0: =C2=A0=C2=A0bridge wind=
ow [mem 0xffc00000000-0xffe0fffffff 64bit pref]
<br>[ =C2=A0=C2=A0=C2=A00.648801] pci 0000:02:00.0: PME# supported from D0 =
D3hot D3cold
<br>[ =C2=A0=C2=A0=C2=A00.648935] pci 0000:01:00.0: PCI bridge to [bus 02-0=
3]
<br>[ =C2=A0=C2=A0=C2=A00.648999] pci 0000:03:00.0: [1002:7480] type 00 cla=
ss 0x030000 PCIe Legacy Endpoint
<br>[ =C2=A0=C2=A0=C2=A00.649015] pci 0000:03:00.0: BAR 0 [mem 0xffc0000000=
0-0xffdffffffff 64bit pref]
<br>[ =C2=A0=C2=A0=C2=A00.649027] pci 0000:03:00.0: BAR 2 [mem 0xffe0000000=
0-0xffe0fffffff 64bit pref]
<br>[ =C2=A0=C2=A0=C2=A00.649034] pci 0000:03:00.0: BAR 4 [io =C2=A00x2000-=
0x20ff]
<br>[ =C2=A0=C2=A0=C2=A00.649041] pci 0000:03:00.0: BAR 5 [mem 0xc0e00000-0=
xc0efffff]
<br>[ =C2=A0=C2=A0=C2=A00.649049] pci 0000:03:00.0: ROM [mem 0xfffe0000-0xf=
fffffff pref]
<br>[ =C2=A0=C2=A0=C2=A00.649094] pci 0000:03:00.0: PME# supported from D1 =
D2 D3hot D3cold
<br>[ =C2=A0=C2=A0=C2=A00.649154] pci 0000:03:00.1: [1002:ab30] type 00 cla=
ss 0x040300 PCIe Legacy Endpoint
<br>[ =C2=A0=C2=A0=C2=A00.649167] pci 0000:03:00.1: BAR 0 [mem 0xc0f00000-0=
xc0f03fff]
<br>[ =C2=A0=C2=A0=C2=A00.649250] pci 0000:03:00.1: PME# supported from D1 =
D2 D3hot D3cold
<br>[ =C2=A0=C2=A0=C2=A00.649307] pci 0000:02:00.0: PCI bridge to [bus 03]
<br>[ =C2=A0=C2=A0=C2=A00.649609] pci 0000:04:00.0: [144d:a80a] type 00 cla=
ss 0x010802 PCIe Endpoint
<br>[ =C2=A0=C2=A0=C2=A00.649624] pci 0000:04:00.0: BAR 0 [mem 0xc0d00000-0=
xc0d03fff 64bit]
<br>[ =C2=A0=C2=A0=C2=A00.649727] pci 0000:00:01.2: PCI bridge to [bus 04]
<br>[ =C2=A0=C2=A0=C2=A00.649945] pci 0000:05:00.0: [144d:a808] type 00 cla=
ss 0x010802 PCIe Endpoint
<br>[ =C2=A0=C2=A0=C2=A00.649962] pci 0000:05:00.0: BAR 0 [mem 0xc0c00000-0=
xc0c03fff 64bit]
<br>[ =C2=A0=C2=A0=C2=A00.650070] pci 0000:00:01.3: PCI bridge to [bus 05]
<br>[ =C2=A0=C2=A0=C2=A00.650167] pci 0000:06:00.0: [1b21:242a] type 01 cla=
ss 0x060400 PCIe Switch Upstream Port
<br>[ =C2=A0=C2=A0=C2=A00.650193] pci 0000:06:00.0: PCI bridge to [bus 07-0=
8]
<br>[ =C2=A0=C2=A0=C2=A00.650200] pci 0000:06:00.0: =C2=A0=C2=A0bridge wind=
ow [mem 0xc0800000-0xc0bfffff]
<br>[ =C2=A0=C2=A0=C2=A00.650254] pci 0000:06:00.0: PME# supported from D0 =
D3hot D3cold
<br>[ =C2=A0=C2=A0=C2=A00.650268] pci 0000:06:00.0: 31.504 Gb/s available P=
CIe bandwidth, limited by 8.0 GT/s PCIe x4 link at 0000:00:
<br>02.1 (capable of 63.012 Gb/s with 16.0 GT/s PCIe x4 link)
<br>[ =C2=A0=C2=A0=C2=A00.650305] pci 0000:00:02.1: PCI bridge to [bus 06-0=
8]
<br>[ =C2=A0=C2=A0=C2=A00.650412] pci 0000:07:02.0: [1b21:242b] type 01 cla=
ss 0x060400 PCIe Switch Downstream Port
<br>[ =C2=A0=C2=A0=C2=A00.650438] pci 0000:07:02.0: PCI bridge to [bus 08]
<br>[ =C2=A0=C2=A0=C2=A00.650443] pci 0000:07:02.0: =C2=A0=C2=A0bridge wind=
ow [mem 0xc0800000-0xc0bfffff]
<br>[ =C2=A0=C2=A0=C2=A00.650497] pci 0000:07:02.0: PME# supported from D0 =
D3hot D3cold
<br>[ =C2=A0=C2=A0=C2=A00.650556] pci 0000:06:00.0: PCI bridge to [bus 07-0=
8]
<br>[ =C2=A0=C2=A0=C2=A00.650628] pci 0000:08:00.0: [1b21:242c] type 00 cla=
ss 0x0c0330 PCIe Legacy Endpoint
<br>[ =C2=A0=C2=A0=C2=A00.650644] pci 0000:08:00.0: BAR 0 [mem 0xc0800000-0=
xc0807fff 64bit]
<br>[ =C2=A0=C2=A0=C2=A00.650716] pci 0000:08:00.0: PME# supported from D0 =
D3hot D3cold
<br>[ =C2=A0=C2=A0=C2=A00.650766] pci 0000:07:02.0: PCI bridge to [bus 08]
<br>[ =C2=A0=C2=A0=C2=A00.650977] pci 0000:09:00.0: [8086:2725] type 00 cla=
ss 0x028000 PCIe Endpoint
<br>[ =C2=A0=C2=A0=C2=A00.651138] pci 0000:09:00.0: BAR 0 [mem 0xc0700000-0=
xc0703fff 64bit]
<br>[ =C2=A0=C2=A0=C2=A00.651513] pci 0000:09:00.0: PME# supported from D0 =
D3hot D3cold
<br>[ =C2=A0=C2=A0=C2=A00.652167] pci 0000:00:02.2: PCI bridge to [bus 09]
<br>[ =C2=A0=C2=A0=C2=A00.652252] pci 0000:0a:00.0: [10ec:525a] type 00 cla=
ss 0xff0000 PCIe Endpoint
<br>[ =C2=A0=C2=A0=C2=A00.652273] pci 0000:0a:00.0: BAR 1 [mem 0xc0600000-0=
xc0600fff]
<br>[ =C2=A0=C2=A0=C2=A00.652350] pci 0000:0a:00.0: supports D1 D2
<br>[ =C2=A0=C2=A0=C2=A00.652351] pci 0000:0a:00.0: PME# supported from D1 =
D2 D3hot D3cold
<br>[ =C2=A0=C2=A0=C2=A00.652392] pci 0000:00:03.1: PCI bridge to [bus 0a]
<br>[ =C2=A0=C2=A0=C2=A00.652482] pci 0000:0b:00.0: [10ec:8125] type 00 cla=
ss 0x020000 PCIe Endpoint
<br>[ =C2=A0=C2=A0=C2=A00.652498] pci 0000:0b:00.0: BAR 0 [io =C2=A00x1000-=
0x10ff]
<br>[ =C2=A0=C2=A0=C2=A00.652518] pci 0000:0b:00.0: BAR 2 [mem 0xc0500000-0=
xc050ffff 64bit]
<br>[ =C2=A0=C2=A0=C2=A00.652530] pci 0000:0b:00.0: BAR 4 [mem 0xc0510000-0=
xc0513fff 64bit]
<br>[ =C2=A0=C2=A0=C2=A00.652716] pci 0000:0b:00.0: supports D1 D2
<br>[ =C2=A0=C2=A0=C2=A00.652717] pci 0000:0b:00.0: PME# supported from D0 =
D1 D2 D3hot D3cold
<br>[ =C2=A0=C2=A0=C2=A00.652769] pci 0000:00:03.2: PCI bridge to [bus 0b]
<br>[ =C2=A0=C2=A0=C2=A00.652839] pci 0000:0c:00.0: [1022:14de] type 00 cla=
ss 0x130000 PCIe Legacy Endpoint
<br>[ =C2=A0=C2=A0=C2=A00.652875] pci 0000:0c:00.0: enabling Extended Tags
<br>[ =C2=A0=C2=A0=C2=A00.652935] pci 0000:0c:00.2: [1022:1649] type 00 cla=
ss 0x108000 PCIe Endpoint
<br>[ =C2=A0=C2=A0=C2=A00.653157] pci 0000:0c:00.2: BAR 2 [mem 0xc0300000-0=
xc03fffff]
<br>[ =C2=A0=C2=A0=C2=A00.653306] pci 0000:0c:00.2: BAR 5 [mem 0xc0448000-0=
xc0449fff]
<br>[ =C2=A0=C2=A0=C2=A00.653362] pci 0000:0c:00.2: enabling Extended Tags
<br>[ =C2=A0=C2=A0=C2=A00.653426] pci 0000:0c:00.3: [1022:15b6] type 00 cla=
ss 0x0c0330 PCIe Endpoint
<br>[ =C2=A0=C2=A0=C2=A00.653437] pci 0000:0c:00.3: BAR 0 [mem 0xc0100000-0=
xc01fffff 64bit]
<br>[ =C2=A0=C2=A0=C2=A00.653461] pci 0000:0c:00.3: enabling Extended Tags
<br>[ =C2=A0=C2=A0=C2=A00.653488] pci 0000:0c:00.3: PME# supported from D0 =
D3hot D3cold
<br>[ =C2=A0=C2=A0=C2=A00.653529] pci 0000:0c:00.4: [1022:15b7] type 00 cla=
ss 0x0c0330 PCIe Endpoint
<br>[ =C2=A0=C2=A0=C2=A00.653540] pci 0000:0c:00.4: BAR 0 [mem 0xc0200000-0=
xc02fffff 64bit]
<br>[ =C2=A0=C2=A0=C2=A00.653564] pci 0000:0c:00.4: enabling Extended Tags
<br>[ =C2=A0=C2=A0=C2=A00.653591] pci 0000:0c:00.4: PME# supported from D0 =
D3hot D3cold
<br>[ =C2=A0=C2=A0=C2=A00.653634] pci 0000:0c:00.5: [1022:15e2] type 00 cla=
ss 0x048000 PCIe Endpoint
<br>[ =C2=A0=C2=A0=C2=A00.653642] pci 0000:0c:00.5: BAR 0 [mem 0xc0400000-0=
xc043ffff]
<br>[ =C2=A0=C2=A0=C2=A00.653671] pci 0000:0c:00.5: enabling Extended Tags
<br>[ =C2=A0=C2=A0=C2=A00.653695] pci 0000:0c:00.5: PME# supported from D0 =
D3hot D3cold
<br>[ =C2=A0=C2=A0=C2=A00.653738] pci 0000:0c:00.6: [1022:15e3] type 00 cla=
ss 0x040300 PCIe Endpoint
<br>[ =C2=A0=C2=A0=C2=A00.653746] pci 0000:0c:00.6: BAR 0 [mem 0xc0440000-0=
xc0447fff]
<br>[ =C2=A0=C2=A0=C2=A00.653775] pci 0000:0c:00.6: enabling Extended Tags
<br>[ =C2=A0=C2=A0=C2=A00.653800] pci 0000:0c:00.6: PME# supported from D0 =
D3hot D3cold
<br>[ =C2=A0=C2=A0=C2=A00.653853] pci 0000:00:08.1: PCI bridge to [bus 0c]
<br>[ =C2=A0=C2=A0=C2=A00.653891] pci 0000:0d:00.0: [1022:15b8] type 00 cla=
ss 0x0c0330 PCIe Endpoint
<br>[ =C2=A0=C2=A0=C2=A00.653905] pci 0000:0d:00.0: BAR 0 [mem 0xc0000000-0=
xc00fffff 64bit]
<br>[ =C2=A0=C2=A0=C2=A00.653934] pci 0000:0d:00.0: enabling Extended Tags
<br>[ =C2=A0=C2=A0=C2=A00.653961] pci 0000:0d:00.0: PME# supported from D0 =
D3hot D3cold
<br>[ =C2=A0=C2=A0=C2=A00.654000] pci 0000:00:08.3: PCI bridge to [bus 0d]
<br>[ =C2=A0=C2=A0=C2=A00.658129] Low-power S0 idle used by default for sys=
tem suspend
<br>[ =C2=A0=C2=A0=C2=A00.870783] ACPI: EC: interrupt unblocked
<br>[ =C2=A0=C2=A0=C2=A00.870785] ACPI: EC: event unblocked
<br>[ =C2=A0=C2=A0=C2=A00.870797] ACPI: EC: EC_CMD/EC_SC=3D0x66, EC_DATA=3D=
0x62
<br>[ =C2=A0=C2=A0=C2=A00.870798] ACPI: EC: GPE=3D0x9
<br>[ =C2=A0=C2=A0=C2=A00.870800] ACPI: \_SB_.PCI0.LPC0.EC__: Boot DSDT EC =
initialization complete
<br>[ =C2=A0=C2=A0=C2=A00.870801] ACPI: \_SB_.PCI0.LPC0.EC__: EC: Used to h=
andle transactions and events
<br>[ =C2=A0=C2=A0=C2=A00.870843] iommu: Default domain type: Translated
<br>[ =C2=A0=C2=A0=C2=A00.870843] iommu: DMA domain TLB invalidation policy=
: lazy mode
<br>[ =C2=A0=C2=A0=C2=A00.870843] SCSI subsystem initialized
<br>[ =C2=A0=C2=A0=C2=A00.870843] libata version 3.00 loaded.
<br>[ =C2=A0=C2=A0=C2=A00.870843] ACPI: bus type USB registered
<br>[ =C2=A0=C2=A0=C2=A00.870843] usbcore: registered new interface driver =
usbfs
<br>[ =C2=A0=C2=A0=C2=A00.870843] usbcore: registered new interface driver =
hub
<br>[ =C2=A0=C2=A0=C2=A00.870843] usbcore: registered new device driver usb
<br>[ =C2=A0=C2=A0=C2=A01.095217] pps_core: LinuxPPS API ver. 1 registered
<br>[ =C2=A0=C2=A0=C2=A01.095219] pps_core: Software ver. 5.3.6 - Copyright=
 2005-2007 Rodolfo Giometti &lt;<a href=3D"mailto:giometti@linux.it">giomet=
ti@linux.it</a>&gt;
<br>[ =C2=A0=C2=A0=C2=A01.095222] PTP clock support registered
<br>[ =C2=A0=C2=A0=C2=A01.095232] EDAC MC: Ver: 3.0.0
<br>[ =C2=A0=C2=A0=C2=A01.095843] efivars: Registered efivars operations
<br>[ =C2=A0=C2=A0=C2=A01.095843] NetLabel: Initializing
<br>[ =C2=A0=C2=A0=C2=A01.095843] NetLabel: =C2=A0domain hash size =3D 128
<br>[ =C2=A0=C2=A0=C2=A01.095843] NetLabel: =C2=A0protocols =3D UNLABELED C=
IPSOv4 CALIPSO
<br>[ =C2=A0=C2=A0=C2=A01.095843] NetLabel: =C2=A0unlabeled traffic allowed=
 by default
<br>[ =C2=A0=C2=A0=C2=A01.095843] mctp: management component transport prot=
ocol core
<br>[ =C2=A0=C2=A0=C2=A01.095843] NET: Registered PF_MCTP protocol family
<br>[ =C2=A0=C2=A0=C2=A01.095843] PCI: Using ACPI for IRQ routing
<br>[ =C2=A0=C2=A0=C2=A01.095843] PCI: pci_cache_line_size set to 64 bytes
<br>[ =C2=A0=C2=A0=C2=A01.096973] e820: reserve RAM buffer [mem 0x0009f000-=
0x0009ffff]
<br>[ =C2=A0=C2=A0=C2=A01.096974] e820: reserve RAM buffer [mem 0x09b00000-=
0x0bffffff]
<br>[ =C2=A0=C2=A0=C2=A01.096974] e820: reserve RAM buffer [mem 0x09f00000-=
0x0bffffff]
<br>[ =C2=A0=C2=A0=C2=A01.096975] e820: reserve RAM buffer [mem 0xa0297018-=
0xa3ffffff]
<br>[ =C2=A0=C2=A0=C2=A01.096975] e820: reserve RAM buffer [mem 0xa235c000-=
0xa3ffffff]
<br>[ =C2=A0=C2=A0=C2=A01.096976] e820: reserve RAM buffer [mem 0xa456b000-=
0xa7ffffff]
<br>[ =C2=A0=C2=A0=C2=A01.096976] e820: reserve RAM buffer [mem 0xa6e4f000-=
0xa7ffffff]
<br>[ =C2=A0=C2=A0=C2=A01.096976] e820: reserve RAM buffer [mem 0xad5e4000-=
0xafffffff]
<br>[ =C2=A0=C2=A0=C2=A01.096977] e820: reserve RAM buffer [mem 0xb077f000-=
0xb3ffffff]
<br>[ =C2=A0=C2=A0=C2=A01.096977] e820: reserve RAM buffer [mem 0xbb000000-=
0xbbffffff]
<br>[ =C2=A0=C2=A0=C2=A01.096977] e820: reserve RAM buffer [mem 0x103de8000=
0-0x103fffffff]
<br>[ =C2=A0=C2=A0=C2=A01.096991] pci 0000:03:00.0: vgaarb: setting as boot=
 VGA device
<br>[ =C2=A0=C2=A0=C2=A01.096991] pci 0000:03:00.0: vgaarb: bridge control =
possible
<br>[ =C2=A0=C2=A0=C2=A01.096991] pci 0000:03:00.0: vgaarb: VGA device adde=
d: decodes=3Dio+mem,owns=3Dnone,locks=3Dnone
<br>[ =C2=A0=C2=A0=C2=A01.096991] vgaarb: loaded
<br>[ =C2=A0=C2=A0=C2=A01.096991] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0
<br>[ =C2=A0=C2=A0=C2=A01.096991] hpet0: 3 comparators, 32-bit 14.318180 MH=
z counter
<br>[ =C2=A0=C2=A0=C2=A01.098731] clocksource: Switched to clocksource tsc-=
early
<br>[ =C2=A0=C2=A0=C2=A01.098794] VFS: Disk quotas dquot_6.6.0
<br>[ =C2=A0=C2=A0=C2=A01.098799] VFS: Dquot-cache hash table entries: 512 =
(order 0, 4096 bytes)
<br>[ =C2=A0=C2=A0=C2=A01.098829] pnp: PnP ACPI init
<br>[ =C2=A0=C2=A0=C2=A01.098861] system 00:00: [mem 0xf0000000-0xffffffff]=
 could not be reserved
<br>[ =C2=A0=C2=A0=C2=A01.099022] system 00:01: [mem 0xfec00000-0xfec01fff]=
 could not be reserved
<br>[ =C2=A0=C2=A0=C2=A01.099024] system 00:01: [mem 0xfee00000-0xfee00fff]=
 has been reserved
<br>[ =C2=A0=C2=A0=C2=A01.099025] system 00:01: [mem 0xe0200000-0xe02fffff]=
 has been reserved
<br>[ =C2=A0=C2=A0=C2=A01.099289] system 00:03: [io =C2=A00x0400-0x04cf] ha=
s been reserved
<br>[ =C2=A0=C2=A0=C2=A01.099291] system 00:03: [io =C2=A00x04d0-0x04d1] ha=
s been reserved
<br>[ =C2=A0=C2=A0=C2=A01.099292] system 00:03: [io =C2=A00x04d6] has been =
reserved
<br>[ =C2=A0=C2=A0=C2=A01.099293] system 00:03: [io =C2=A00x0c00-0x0c01] ha=
s been reserved
<br>[ =C2=A0=C2=A0=C2=A01.099294] system 00:03: [io =C2=A00x0c14] has been =
reserved
<br>[ =C2=A0=C2=A0=C2=A01.099295] system 00:03: [io =C2=A00x0c50-0x0c52] ha=
s been reserved
<br>[ =C2=A0=C2=A0=C2=A01.099296] system 00:03: [io =C2=A00x0c6c] has been =
reserved
<br>[ =C2=A0=C2=A0=C2=A01.099296] system 00:03: [io =C2=A00x0c6f] has been =
reserved
<br>[ =C2=A0=C2=A0=C2=A01.099297] system 00:03: [io =C2=A00x0cd0-0x0cdb] ha=
s been reserved
<br>[ =C2=A0=C2=A0=C2=A01.099307] system 00:04: [mem 0xff000000-0xffffffff]=
 has been reserved
<br>[ =C2=A0=C2=A0=C2=A01.099316] ACPI: IRQ 1 override to edge, low(!)
<br>[ =C2=A0=C2=A0=C2=A01.207658] pnp: PnP ACPI: found 6 devices
<br>[ =C2=A0=C2=A0=C2=A01.213317] clocksource: acpi_pm: mask: 0xffffff max_=
cycles: 0xffffff, max_idle_ns: 2085701024 ns
<br>[ =C2=A0=C2=A0=C2=A01.213353] NET: Registered PF_INET protocol family
<br>[ =C2=A0=C2=A0=C2=A01.213503] IP idents hash table entries: 262144 (ord=
er: 9, 2097152 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A01.220695] tcp_listen_portaddr_hash hash table entri=
es: 32768 (order: 7, 524288 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A01.220719] Table-perturb hash table entries: 65536 (=
order: 6, 262144 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A01.220724] TCP established hash table entries: 52428=
8 (order: 10, 4194304 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A01.220949] TCP bind hash table entries: 65536 (order=
: 9, 2097152 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A01.221044] TCP: Hash tables configured (established =
524288 bind 65536)
<br>[ =C2=A0=C2=A0=C2=A01.221160] MPTCP token hash table entries: 65536 (or=
der: 8, 1572864 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A01.221198] UDP hash table entries: 32768 (order: 8, =
1048576 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A01.221244] UDP-Lite hash table entries: 32768 (order=
: 8, 1048576 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A01.221317] NET: Registered PF_UNIX/PF_LOCAL protocol=
 family
<br>[ =C2=A0=C2=A0=C2=A01.221322] NET: Registered PF_XDP protocol family
<br>[ =C2=A0=C2=A0=C2=A01.221325] pci 0000:03:00.0: ROM [mem 0xfffe0000-0xf=
fffffff pref]: can&#39;t claim; no compatible bridge window
<br>[ =C2=A0=C2=A0=C2=A01.221329] pci 0000:00:02.1: bridge window [io =C2=
=A00x1000-0x0fff] to [bus 06-08] add_size 1000
<br>[ =C2=A0=C2=A0=C2=A01.221330] pci 0000:00:02.1: bridge window [mem 0x00=
100000-0x000fffff 64bit pref] to [bus 06-08] add_size 20000
<br>0 add_align 100000
<br>[ =C2=A0=C2=A0=C2=A01.221337] pci 0000:00:02.1: bridge window [mem 0x10=
020200000-0x100203fffff 64bit pref]: assigned
<br>[ =C2=A0=C2=A0=C2=A01.221339] pci 0000:00:02.1: bridge window [io =C2=
=A00x3000-0x3fff]: assigned
<br>[ =C2=A0=C2=A0=C2=A01.221341] pci 0000:03:00.0: ROM [mem 0xc0f20000-0xc=
0f3ffff pref]: assigned
<br>[ =C2=A0=C2=A0=C2=A01.221342] pci 0000:02:00.0: PCI bridge to [bus 03]
<br>[ =C2=A0=C2=A0=C2=A01.221348] pci 0000:02:00.0: =C2=A0=C2=A0bridge wind=
ow [io =C2=A00x2000-0x2fff]
<br>[ =C2=A0=C2=A0=C2=A01.221352] pci 0000:02:00.0: =C2=A0=C2=A0bridge wind=
ow [mem 0xc0e00000-0xc0ffffff]
<br>[ =C2=A0=C2=A0=C2=A01.221355] pci 0000:02:00.0: =C2=A0=C2=A0bridge wind=
ow [mem 0xffc00000000-0xffe0fffffff 64bit pref]
<br>[ =C2=A0=C2=A0=C2=A01.221360] pci 0000:01:00.0: PCI bridge to [bus 02-0=
3]
<br>[ =C2=A0=C2=A0=C2=A01.221362] pci 0000:01:00.0: =C2=A0=C2=A0bridge wind=
ow [io =C2=A00x2000-0x2fff]
<br>[ =C2=A0=C2=A0=C2=A01.221365] pci 0000:01:00.0: =C2=A0=C2=A0bridge wind=
ow [mem 0xc0e00000-0xc0ffffff]
<br>[ =C2=A0=C2=A0=C2=A01.221368] pci 0000:01:00.0: =C2=A0=C2=A0bridge wind=
ow [mem 0xffc00000000-0xffe0fffffff 64bit pref]
<br>[ =C2=A0=C2=A0=C2=A01.221373] pci 0000:00:01.1: PCI bridge to [bus 01-0=
3]
<br>[ =C2=A0=C2=A0=C2=A01.221374] pci 0000:00:01.1: =C2=A0=C2=A0bridge wind=
ow [io =C2=A00x2000-0x2fff]
<br>[ =C2=A0=C2=A0=C2=A01.221377] pci 0000:00:01.1: =C2=A0=C2=A0bridge wind=
ow [mem 0xc0e00000-0xc10fffff]
<br>[ =C2=A0=C2=A0=C2=A01.221379] pci 0000:00:01.1: =C2=A0=C2=A0bridge wind=
ow [mem 0xffc00000000-0xffe0fffffff 64bit pref]
<br>[ =C2=A0=C2=A0=C2=A01.221396] pci 0000:00:01.2: PCI bridge to [bus 04]
<br>[ =C2=A0=C2=A0=C2=A01.221398] pci 0000:00:01.2: =C2=A0=C2=A0bridge wind=
ow [mem 0xc0d00000-0xc0dfffff]
<br>[ =C2=A0=C2=A0=C2=A01.221417] pci 0000:00:01.3: PCI bridge to [bus 05]
<br>[ =C2=A0=C2=A0=C2=A01.221419] pci 0000:00:01.3: =C2=A0=C2=A0bridge wind=
ow [mem 0xc0c00000-0xc0cfffff]
<br>[ =C2=A0=C2=A0=C2=A01.221438] pci 0000:07:02.0: PCI bridge to [bus 08]
<br>[ =C2=A0=C2=A0=C2=A01.221446] pci 0000:07:02.0: =C2=A0=C2=A0bridge wind=
ow [mem 0xc0800000-0xc0bfffff]
<br>[ =C2=A0=C2=A0=C2=A01.221452] pci 0000:06:00.0: PCI bridge to [bus 07-0=
8]
<br>[ =C2=A0=C2=A0=C2=A01.221455] pci 0000:06:00.0: =C2=A0=C2=A0bridge wind=
ow [mem 0xc0800000-0xc0bfffff]
<br>[ =C2=A0=C2=A0=C2=A01.221462] pci 0000:00:02.1: PCI bridge to [bus 06-0=
8]
<br>[ =C2=A0=C2=A0=C2=A01.221463] pci 0000:00:02.1: =C2=A0=C2=A0bridge wind=
ow [io =C2=A00x3000-0x3fff]
<br>[ =C2=A0=C2=A0=C2=A01.221465] pci 0000:00:02.1: =C2=A0=C2=A0bridge wind=
ow [mem 0xc0800000-0xc0bfffff]
<br>[ =C2=A0=C2=A0=C2=A01.221467] pci 0000:00:02.1: =C2=A0=C2=A0bridge wind=
ow [mem 0x10020200000-0x100203fffff 64bit pref]
<br>[ =C2=A0=C2=A0=C2=A01.221485] pci 0000:00:02.2: PCI bridge to [bus 09]
<br>[ =C2=A0=C2=A0=C2=A01.221487] pci 0000:00:02.2: =C2=A0=C2=A0bridge wind=
ow [mem 0xc0700000-0xc07fffff]
<br>[ =C2=A0=C2=A0=C2=A01.221505] pci 0000:00:03.1: PCI bridge to [bus 0a]
<br>[ =C2=A0=C2=A0=C2=A01.221507] pci 0000:00:03.1: =C2=A0=C2=A0bridge wind=
ow [mem 0xc0600000-0xc06fffff]
<br>[ =C2=A0=C2=A0=C2=A01.221526] pci 0000:00:03.2: PCI bridge to [bus 0b]
<br>[ =C2=A0=C2=A0=C2=A01.221527] pci 0000:00:03.2: =C2=A0=C2=A0bridge wind=
ow [io =C2=A00x1000-0x1fff]
<br>[ =C2=A0=C2=A0=C2=A01.221529] pci 0000:00:03.2: =C2=A0=C2=A0bridge wind=
ow [mem 0xc0500000-0xc05fffff]
<br>[ =C2=A0=C2=A0=C2=A01.221548] pci 0000:00:08.1: PCI bridge to [bus 0c]
<br>[ =C2=A0=C2=A0=C2=A01.221554] pci 0000:00:08.1: =C2=A0=C2=A0bridge wind=
ow [mem 0xc0100000-0xc04fffff]
<br>[ =C2=A0=C2=A0=C2=A01.221558] pci 0000:00:08.3: PCI bridge to [bus 0d]
<br>[ =C2=A0=C2=A0=C2=A01.221560] pci 0000:00:08.3: =C2=A0=C2=A0bridge wind=
ow [mem 0xc0000000-0xc00fffff]
<br>[ =C2=A0=C2=A0=C2=A01.221564] pci_bus 0000:00: resource 4 [io =C2=A00x0=
000-0x0cf7 window]
<br>[ =C2=A0=C2=A0=C2=A01.221565] pci_bus 0000:00: resource 5 [io =C2=A00x0=
d00-0xffff window]
<br>[ =C2=A0=C2=A0=C2=A01.221566] pci_bus 0000:00: resource 6 [mem 0x000a00=
00-0x000bffff window]
<br>[ =C2=A0=C2=A0=C2=A01.221567] pci_bus 0000:00: resource 7 [mem 0x000c00=
00-0x000cffff window]
<br>[ =C2=A0=C2=A0=C2=A01.221568] pci_bus 0000:00: resource 8 [mem 0x000d00=
00-0x000effff window]
<br>[ =C2=A0=C2=A0=C2=A01.221569] pci_bus 0000:00: resource 9 [mem 0xc00000=
00-0xc11fffff window]
<br>[ =C2=A0=C2=A0=C2=A01.221570] pci_bus 0000:00: resource 10 [mem 0xf8000=
000-0xfe000000 window]
<br>[ =C2=A0=C2=A0=C2=A01.221571] pci_bus 0000:00: resource 11 [mem 0xfed45=
000-0xfed814ff window]
<br>[ =C2=A0=C2=A0=C2=A01.221572] pci_bus 0000:00: resource 12 [mem 0xfed81=
900-0xfed81fff window]
<br>[ =C2=A0=C2=A0=C2=A01.221573] pci_bus 0000:00: resource 13 [mem 0xfedc0=
000-0xfedc0fff window]
<br>[ =C2=A0=C2=A0=C2=A01.221573] pci_bus 0000:00: resource 14 [mem 0xfedc6=
000-0xfedc6fff window]
<br>[ =C2=A0=C2=A0=C2=A01.221574] pci_bus 0000:00: resource 15 [mem 0x10020=
200000-0xfffffffffff window]
<br>[ =C2=A0=C2=A0=C2=A01.221576] pci_bus 0000:01: resource 0 [io =C2=A00x2=
000-0x2fff]
<br>[ =C2=A0=C2=A0=C2=A01.221576] pci_bus 0000:01: resource 1 [mem 0xc0e000=
00-0xc10fffff]
<br>[ =C2=A0=C2=A0=C2=A01.221577] pci_bus 0000:01: resource 2 [mem 0xffc000=
00000-0xffe0fffffff 64bit pref]
<br>[ =C2=A0=C2=A0=C2=A01.221579] pci_bus 0000:02: resource 0 [io =C2=A00x2=
000-0x2fff]
<br>[ =C2=A0=C2=A0=C2=A01.221579] pci_bus 0000:02: resource 1 [mem 0xc0e000=
00-0xc0ffffff]
<br>[ =C2=A0=C2=A0=C2=A01.221580] pci_bus 0000:02: resource 2 [mem 0xffc000=
00000-0xffe0fffffff 64bit pref]
<br>[ =C2=A0=C2=A0=C2=A01.221581] pci_bus 0000:03: resource 0 [io =C2=A00x2=
000-0x2fff]
<br>[ =C2=A0=C2=A0=C2=A01.221582] pci_bus 0000:03: resource 1 [mem 0xc0e000=
00-0xc0ffffff]
<br>[ =C2=A0=C2=A0=C2=A01.221583] pci_bus 0000:03: resource 2 [mem 0xffc000=
00000-0xffe0fffffff 64bit pref]
<br>[ =C2=A0=C2=A0=C2=A01.221584] pci_bus 0000:04: resource 1 [mem 0xc0d000=
00-0xc0dfffff]
<br>[ =C2=A0=C2=A0=C2=A01.221585] pci_bus 0000:05: resource 1 [mem 0xc0c000=
00-0xc0cfffff]
<br>[ =C2=A0=C2=A0=C2=A01.221586] pci_bus 0000:06: resource 0 [io =C2=A00x3=
000-0x3fff]
<br>[ =C2=A0=C2=A0=C2=A01.221587] pci_bus 0000:06: resource 1 [mem 0xc08000=
00-0xc0bfffff]
<br>[ =C2=A0=C2=A0=C2=A01.221588] pci_bus 0000:06: resource 2 [mem 0x100202=
00000-0x100203fffff 64bit pref]
<br>[ =C2=A0=C2=A0=C2=A01.221589] pci_bus 0000:07: resource 1 [mem 0xc08000=
00-0xc0bfffff]
<br>[ =C2=A0=C2=A0=C2=A01.221590] pci_bus 0000:08: resource 1 [mem 0xc08000=
00-0xc0bfffff]
<br>[ =C2=A0=C2=A0=C2=A01.221591] pci_bus 0000:09: resource 1 [mem 0xc07000=
00-0xc07fffff]
<br>[ =C2=A0=C2=A0=C2=A01.221591] pci_bus 0000:0a: resource 1 [mem 0xc06000=
00-0xc06fffff]
<br>[ =C2=A0=C2=A0=C2=A01.221592] pci_bus 0000:0b: resource 0 [io =C2=A00x1=
000-0x1fff]
<br>[ =C2=A0=C2=A0=C2=A01.221593] pci_bus 0000:0b: resource 1 [mem 0xc05000=
00-0xc05fffff]
<br>[ =C2=A0=C2=A0=C2=A01.221594] pci_bus 0000:0c: resource 1 [mem 0xc01000=
00-0xc04fffff]
<br>[ =C2=A0=C2=A0=C2=A01.221595] pci_bus 0000:0d: resource 1 [mem 0xc00000=
00-0xc00fffff]
<br>[ =C2=A0=C2=A0=C2=A01.221651] pci 0000:03:00.1: D0 power state depends =
on 0000:03:00.0
<br>[ =C2=A0=C2=A0=C2=A01.222332] PCI: CLS 64 bytes, default 64
<br>[ =C2=A0=C2=A0=C2=A01.222339] pci 0000:00:00.2: AMD-Vi: IOMMU performan=
ce counters supported
<br>[ =C2=A0=C2=A0=C2=A01.222356] Trying to unpack rootfs image as initramf=
s...
<br>[ =C2=A0=C2=A0=C2=A01.222361] pci 0000:00:01.0: Adding to iommu group 0
<br>[ =C2=A0=C2=A0=C2=A01.222365] pci 0000:00:01.1: Adding to iommu group 0
<br>[ =C2=A0=C2=A0=C2=A01.222368] pci 0000:00:01.2: Adding to iommu group 0
<br>[ =C2=A0=C2=A0=C2=A01.222372] pci 0000:00:01.3: Adding to iommu group 0
<br>[ =C2=A0=C2=A0=C2=A01.222381] pci 0000:00:02.0: Adding to iommu group 1
<br>[ =C2=A0=C2=A0=C2=A01.222385] pci 0000:00:02.1: Adding to iommu group 1
<br>[ =C2=A0=C2=A0=C2=A01.222389] pci 0000:00:02.2: Adding to iommu group 1
<br>[ =C2=A0=C2=A0=C2=A01.222397] pci 0000:00:03.0: Adding to iommu group 2
<br>[ =C2=A0=C2=A0=C2=A01.222401] pci 0000:00:03.1: Adding to iommu group 2
<br>[ =C2=A0=C2=A0=C2=A01.222405] pci 0000:00:03.2: Adding to iommu group 2
<br>[ =C2=A0=C2=A0=C2=A01.222410] pci 0000:00:04.0: Adding to iommu group 3
<br>[ =C2=A0=C2=A0=C2=A01.222419] pci 0000:00:08.0: Adding to iommu group 4
<br>[ =C2=A0=C2=A0=C2=A01.222423] pci 0000:00:08.1: Adding to iommu group 4
<br>[ =C2=A0=C2=A0=C2=A01.222427] pci 0000:00:08.3: Adding to iommu group 4
<br>[ =C2=A0=C2=A0=C2=A01.222434] pci 0000:00:14.0: Adding to iommu group 5
<br>[ =C2=A0=C2=A0=C2=A01.222438] pci 0000:00:14.3: Adding to iommu group 5
<br>[ =C2=A0=C2=A0=C2=A01.222454] pci 0000:00:18.0: Adding to iommu group 6
<br>[ =C2=A0=C2=A0=C2=A01.222458] pci 0000:00:18.1: Adding to iommu group 6
<br>[ =C2=A0=C2=A0=C2=A01.222462] pci 0000:00:18.2: Adding to iommu group 6
<br>[ =C2=A0=C2=A0=C2=A01.222466] pci 0000:00:18.3: Adding to iommu group 6
<br>[ =C2=A0=C2=A0=C2=A01.222470] pci 0000:00:18.4: Adding to iommu group 6
<br>[ =C2=A0=C2=A0=C2=A01.222474] pci 0000:00:18.5: Adding to iommu group 6
<br>[ =C2=A0=C2=A0=C2=A01.222478] pci 0000:00:18.6: Adding to iommu group 6
<br>[ =C2=A0=C2=A0=C2=A01.222483] pci 0000:00:18.7: Adding to iommu group 6
<br>[ =C2=A0=C2=A0=C2=A01.222486] pci 0000:01:00.0: Adding to iommu group 0
<br>[ =C2=A0=C2=A0=C2=A01.222488] pci 0000:02:00.0: Adding to iommu group 0
<br>[ =C2=A0=C2=A0=C2=A01.222491] pci 0000:03:00.0: Adding to iommu group 0
<br>[ =C2=A0=C2=A0=C2=A01.222493] pci 0000:03:00.1: Adding to iommu group 0
<br>[ =C2=A0=C2=A0=C2=A01.222495] pci 0000:04:00.0: Adding to iommu group 0
<br>[ =C2=A0=C2=A0=C2=A01.222498] pci 0000:05:00.0: Adding to iommu group 0
<br>[ =C2=A0=C2=A0=C2=A01.222500] pci 0000:06:00.0: Adding to iommu group 1
<br>[ =C2=A0=C2=A0=C2=A01.222503] pci 0000:07:02.0: Adding to iommu group 1
<br>[ =C2=A0=C2=A0=C2=A01.222506] pci 0000:08:00.0: Adding to iommu group 1
<br>[ =C2=A0=C2=A0=C2=A01.222509] pci 0000:09:00.0: Adding to iommu group 1
<br>[ =C2=A0=C2=A0=C2=A01.222511] pci 0000:0a:00.0: Adding to iommu group 2
<br>[ =C2=A0=C2=A0=C2=A01.222514] pci 0000:0b:00.0: Adding to iommu group 2
<br>[ =C2=A0=C2=A0=C2=A01.222517] pci 0000:0c:00.0: Adding to iommu group 4
<br>[ =C2=A0=C2=A0=C2=A01.222519] pci 0000:0c:00.2: Adding to iommu group 4
<br>[ =C2=A0=C2=A0=C2=A01.222522] pci 0000:0c:00.3: Adding to iommu group 4
<br>[ =C2=A0=C2=A0=C2=A01.222523] pci 0000:0c:00.4: Adding to iommu group 4
<br>[ =C2=A0=C2=A0=C2=A01.222526] pci 0000:0c:00.5: Adding to iommu group 4
<br>[ =C2=A0=C2=A0=C2=A01.222528] pci 0000:0c:00.6: Adding to iommu group 4
<br>[ =C2=A0=C2=A0=C2=A01.222532] pci 0000:0d:00.0: Adding to iommu group 4
<br>[ =C2=A0=C2=A0=C2=A01.223051] AMD-Vi: Extended features (0x246577efa225=
4afa, 0x0): PPR NX GT [5] IA GA PC GA_vAPIC
<br>[ =C2=A0=C2=A0=C2=A01.223056] AMD-Vi: Interrupt remapping enabled
<br>[ =C2=A0=C2=A0=C2=A01.647647] AMD-Vi: Virtual APIC enabled
<br>[ =C2=A0=C2=A0=C2=A01.647653] PCI-DMA: Using software bounce buffering =
for IO (SWIOTLB)
<br>[ =C2=A0=C2=A0=C2=A01.647654] software IO TLB: mapped [mem 0x00000000a9=
5e4000-0x00000000ad5e4000] (64MB)
<br>[ =C2=A0=C2=A0=C2=A01.647681] LVT offset 0 assigned for vector 0x400
<br>[ =C2=A0=C2=A0=C2=A01.649712] perf: AMD IBS detected (0x00000bff)
<br>[ =C2=A0=C2=A0=C2=A01.649905] amd_uncore: 16 amd_df counters detected
<br>[ =C2=A0=C2=A0=C2=A01.649912] amd_uncore: 6 amd_l3 counters detected
<br>[ =C2=A0=C2=A0=C2=A01.649917] amd_uncore: 4 amd_umc_0 counters detected
<br>[ =C2=A0=C2=A0=C2=A01.649919] amd_uncore: 4 amd_umc_1 counters detected
<br>[ =C2=A0=C2=A0=C2=A01.650079] perf/amd_iommu: Detected AMD IOMMU #0 (2 =
banks, 4 counters/bank).
<br>[ =C2=A0=C2=A0=C2=A01.651314] Initialise system trusted keyrings
<br>[ =C2=A0=C2=A0=C2=A01.651321] Key type blacklist registered
<br>[ =C2=A0=C2=A0=C2=A01.651336] workingset: timestamp_bits=3D36 max_order=
=3D24 bucket_order=3D0
<br>[ =C2=A0=C2=A0=C2=A01.651347] zbud: loaded
<br>[ =C2=A0=C2=A0=C2=A01.651490] integrity: Platform Keyring initialized
<br>[ =C2=A0=C2=A0=C2=A01.651492] integrity: Machine keyring initialized
<br>[ =C2=A0=C2=A0=C2=A01.656314] NET: Registered PF_ALG protocol family
<br>[ =C2=A0=C2=A0=C2=A01.656316] xor: automatically using best checksummin=
g function =C2=A0=C2=A0avx =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<br>[ =
=C2=A0=C2=A0=C2=A01.656318] Key type asymmetric registered
<br>[ =C2=A0=C2=A0=C2=A01.656319] Asymmetric key parser &#39;x509&#39; regi=
stered
<br>[ =C2=A0=C2=A0=C2=A02.663629] tsc: Refined TSC clocksource calibration:=
 2994.361 MHz
<br>[ =C2=A0=C2=A0=C2=A02.663637] clocksource: tsc: mask: 0xfffffffffffffff=
f max_cycles: 0x2b29764272c, max_idle_ns: 440795213275 ns
<br>[ =C2=A0=C2=A0=C2=A02.663737] clocksource: Switched to clocksource tsc
<br>[ =C2=A0=C2=A0=C2=A02.952105] Freeing initrd memory: 282984K
<br>[ =C2=A0=C2=A0=C2=A02.953955] Block layer SCSI generic (bsg) driver ver=
sion 0.4 loaded (major 245)
<br>[ =C2=A0=C2=A0=C2=A02.953984] io scheduler mq-deadline registered
<br>[ =C2=A0=C2=A0=C2=A02.953986] io scheduler kyber registered
<br>[ =C2=A0=C2=A0=C2=A02.953991] io scheduler bfq registered
<br>[ =C2=A0=C2=A0=C2=A02.954857] atomic64_test: passed for x86-64 platform=
 with CX8 and with SSE
<br>[ =C2=A0=C2=A0=C2=A02.955869] pcieport 0000:00:01.1: PME: Signaling wit=
h IRQ 35
<br>[ =C2=A0=C2=A0=C2=A02.955880] pcieport 0000:00:01.1: pciehp: Slot #0 At=
tnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ In
<br>terlock- NoCompl+ IbPresDis- LLActRep+
<br>[ =C2=A0=C2=A0=C2=A02.955992] pcieport 0000:00:01.2: PME: Signaling wit=
h IRQ 36
<br>[ =C2=A0=C2=A0=C2=A02.956062] pcieport 0000:00:01.3: PME: Signaling wit=
h IRQ 37
<br>[ =C2=A0=C2=A0=C2=A02.956126] pcieport 0000:00:02.1: PME: Signaling wit=
h IRQ 38
<br>[ =C2=A0=C2=A0=C2=A02.956134] pcieport 0000:00:02.1: pciehp: Slot #0 At=
tnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ In
<br>terlock- NoCompl+ IbPresDis- LLActRep+
<br>[ =C2=A0=C2=A0=C2=A02.956296] pcieport 0000:00:02.2: PME: Signaling wit=
h IRQ 39
<br>[ =C2=A0=C2=A0=C2=A02.956359] pcieport 0000:00:03.1: PME: Signaling wit=
h IRQ 40
<br>[ =C2=A0=C2=A0=C2=A02.956429] pcieport 0000:00:03.2: PME: Signaling wit=
h IRQ 41
<br>[ =C2=A0=C2=A0=C2=A02.956492] pcieport 0000:00:08.1: PME: Signaling wit=
h IRQ 42
<br>[ =C2=A0=C2=A0=C2=A02.956554] pcieport 0000:00:08.3: PME: Signaling wit=
h IRQ 43
<br>[ =C2=A0=C2=A0=C2=A02.956760] shpchp: Standard Hot Plug PCI Controller =
Driver version: 0.4
<br>[ =C2=A0=C2=A0=C2=A02.960877] ACPI: AC: AC Adapter [AC] (on-line)
<br>[ =C2=A0=C2=A0=C2=A02.960905] input: Power Button as /devices/LNXSYSTM:=
00/LNXSYBUS:00/PNP0C0C:00/input/input0
<br>[ =C2=A0=C2=A0=C2=A02.960917] ACPI: button: Power Button [PWRB]
<br>[ =C2=A0=C2=A0=C2=A02.960935] input: Lid Switch as /devices/LNXSYSTM:00=
/LNXSYBUS:00/PNP0C0D:00/input/input1
<br>[ =C2=A0=C2=A0=C2=A02.960957] ACPI: button: Lid Switch [LID]
<br>[ =C2=A0=C2=A0=C2=A02.960975] input: Sleep Button as /devices/LNXSYSTM:=
00/LNXSYBUS:00/PNP0C0E:00/input/input2
<br>[ =C2=A0=C2=A0=C2=A02.960987] ACPI: button: Sleep Button [SBTN]
<br>[ =C2=A0=C2=A0=C2=A02.961039] Estimated ratio of average max frequency =
by base frequency (times 1024): 1416
<br>[ =C2=A0=C2=A0=C2=A02.961049] Monitor-Mwait will be used to enter C-1 s=
tate
<br>[ =C2=A0=C2=A0=C2=A02.961052] ACPI: \_SB_.PLTF.C000: Found 3 idle state=
s
<br>[ =C2=A0=C2=A0=C2=A02.961115] ACPI: \_SB_.PLTF.C001: Found 3 idle state=
s
<br>[ =C2=A0=C2=A0=C2=A02.961167] ACPI: \_SB_.PLTF.C002: Found 3 idle state=
s
<br>[ =C2=A0=C2=A0=C2=A02.961216] ACPI: \_SB_.PLTF.C003: Found 3 idle state=
s
<br>[ =C2=A0=C2=A0=C2=A02.961265] ACPI: \_SB_.PLTF.C004: Found 3 idle state=
s
<br>[ =C2=A0=C2=A0=C2=A02.961316] ACPI: \_SB_.PLTF.C005: Found 3 idle state=
s
<br>[ =C2=A0=C2=A0=C2=A02.961366] ACPI: \_SB_.PLTF.C006: Found 3 idle state=
s
<br>[ =C2=A0=C2=A0=C2=A02.961416] ACPI: \_SB_.PLTF.C007: Found 3 idle state=
s
<br>[ =C2=A0=C2=A0=C2=A02.961463] ACPI: \_SB_.PLTF.C008: Found 3 idle state=
s
<br>[ =C2=A0=C2=A0=C2=A02.961512] ACPI: \_SB_.PLTF.C009: Found 3 idle state=
s
<br>[ =C2=A0=C2=A0=C2=A02.961560] ACPI: \_SB_.PLTF.C00A: Found 3 idle state=
s
<br>[ =C2=A0=C2=A0=C2=A02.961607] ACPI: \_SB_.PLTF.C00B: Found 3 idle state=
s
<br>[ =C2=A0=C2=A0=C2=A02.961662] ACPI: \_SB_.PLTF.C00C: Found 3 idle state=
s
<br>[ =C2=A0=C2=A0=C2=A02.961715] ACPI: \_SB_.PLTF.C00D: Found 3 idle state=
s
<br>[ =C2=A0=C2=A0=C2=A02.961764] ACPI: \_SB_.PLTF.C00E: Found 3 idle state=
s
<br>[ =C2=A0=C2=A0=C2=A02.961807] ACPI: \_SB_.PLTF.C00F: Found 3 idle state=
s
<br>[ =C2=A0=C2=A0=C2=A02.961854] ACPI: \_SB_.PLTF.C010: Found 3 idle state=
s
<br>[ =C2=A0=C2=A0=C2=A02.961897] ACPI: \_SB_.PLTF.C011: Found 3 idle state=
s
<br>[ =C2=A0=C2=A0=C2=A02.961942] ACPI: \_SB_.PLTF.C012: Found 3 idle state=
s
<br>[ =C2=A0=C2=A0=C2=A02.961982] ACPI: \_SB_.PLTF.C013: Found 3 idle state=
s
<br>[ =C2=A0=C2=A0=C2=A02.962022] ACPI: \_SB_.PLTF.C014: Found 3 idle state=
s
<br>[ =C2=A0=C2=A0=C2=A02.962062] ACPI: \_SB_.PLTF.C015: Found 3 idle state=
s
<br>[ =C2=A0=C2=A0=C2=A02.962105] ACPI: \_SB_.PLTF.C016: Found 3 idle state=
s
<br>[ =C2=A0=C2=A0=C2=A02.962145] ACPI: \_SB_.PLTF.C017: Found 3 idle state=
s
<br>[ =C2=A0=C2=A0=C2=A02.989733] thermal LNXTHERM:00: registered as therma=
l_zone0
<br>[ =C2=A0=C2=A0=C2=A02.989737] ACPI: thermal: Thermal Zone [THM] (56 C)
<br>[ =C2=A0=C2=A0=C2=A02.989821] Serial: 8250/16550 driver, 32 ports, IRQ =
sharing enabled
<br>[ =C2=A0=C2=A0=C2=A02.990860] Non-volatile memory driver v1.3
<br>[ =C2=A0=C2=A0=C2=A02.990864] Linux agpgart interface v0.103
<br>[ =C2=A0=C2=A0=C2=A03.004851] ACPI: battery: Slot [BAT0] (battery prese=
nt)
<br>[ =C2=A0=C2=A0=C2=A03.011626] tpm_crb MSFT0101:00: Disabling hwrng
<br>[ =C2=A0=C2=A0=C2=A03.011737] ACPI: bus type drm_connector registered
<br>[ =C2=A0=C2=A0=C2=A03.012739] xhci_hcd 0000:08:00.0: xHCI Host Controll=
er
<br>[ =C2=A0=C2=A0=C2=A03.012759] xhci_hcd 0000:08:00.0: new USB bus regist=
ered, assigned bus number 1
<br>[ =C2=A0=C2=A0=C2=A03.015374] xhci_hcd 0000:08:00.0: hcc params 0x0200e=
f81 hci version 0x120 quirks 0x0000000200000010
<br>[ =C2=A0=C2=A0=C2=A03.015587] xhci_hcd 0000:08:00.0: xHCI Host Controll=
er
<br>[ =C2=A0=C2=A0=C2=A03.015602] xhci_hcd 0000:08:00.0: new USB bus regist=
ered, assigned bus number 2
<br>[ =C2=A0=C2=A0=C2=A03.015603] xhci_hcd 0000:08:00.0: Host supports USB =
3.2 Enhanced SuperSpeed
<br>[ =C2=A0=C2=A0=C2=A03.015638] usb usb1: New USB device found, idVendor=
=3D1d6b, idProduct=3D0002, bcdDevice=3D 6.09
<br>[ =C2=A0=C2=A0=C2=A03.015640] usb usb1: New USB device strings: Mfr=3D3=
, Product=3D2, SerialNumber=3D1
<br>[ =C2=A0=C2=A0=C2=A03.015641] usb usb1: Product: xHCI Host Controller
<br>[ =C2=A0=C2=A0=C2=A03.015642] usb usb1: Manufacturer: Linux 6.9.0-RX760=
0XT xhci-hcd
<br>[ =C2=A0=C2=A0=C2=A03.015643] usb usb1: SerialNumber: 0000:08:00.0
<br>[ =C2=A0=C2=A0=C2=A03.015685] hub 1-0:1.0: USB hub found
<br>[ =C2=A0=C2=A0=C2=A03.015689] hub 1-0:1.0: 2 ports detected
<br>[ =C2=A0=C2=A0=C2=A03.015775] usb usb2: We don&#39;t know the algorithm=
s for LPM for this host, disabling LPM.
<br>[ =C2=A0=C2=A0=C2=A03.015782] usb usb2: New USB device found, idVendor=
=3D1d6b, idProduct=3D0003, bcdDevice=3D 6.09
<br>[ =C2=A0=C2=A0=C2=A03.015784] usb usb2: New USB device strings: Mfr=3D3=
, Product=3D2, SerialNumber=3D1
<br>[ =C2=A0=C2=A0=C2=A03.015785] usb usb2: Product: xHCI Host Controller
<br>[ =C2=A0=C2=A0=C2=A03.015786] usb usb2: Manufacturer: Linux 6.9.0-RX760=
0XT xhci-hcd
<br>[ =C2=A0=C2=A0=C2=A03.015787] usb usb2: SerialNumber: 0000:08:00.0
<br>[ =C2=A0=C2=A0=C2=A03.015815] hub 2-0:1.0: USB hub found
<br>[ =C2=A0=C2=A0=C2=A03.015823] hub 2-0:1.0: 2 ports detected
<br>[ =C2=A0=C2=A0=C2=A03.015954] xhci_hcd 0000:0c:00.3: xHCI Host Controll=
er
<br>[ =C2=A0=C2=A0=C2=A03.015969] xhci_hcd 0000:0c:00.3: new USB bus regist=
ered, assigned bus number 3
<br>[ =C2=A0=C2=A0=C2=A03.016305] xhci_hcd 0000:0c:00.3: hcc params 0x0120f=
fc5 hci version 0x120 quirks 0x0000000200000410
<br>[ =C2=A0=C2=A0=C2=A03.016553] xhci_hcd 0000:0c:00.3: xHCI Host Controll=
er
<br>[ =C2=A0=C2=A0=C2=A03.016566] xhci_hcd 0000:0c:00.3: new USB bus regist=
ered, assigned bus number 4
<br>[ =C2=A0=C2=A0=C2=A03.016568] xhci_hcd 0000:0c:00.3: Host supports USB =
3.1 Enhanced SuperSpeed
<br>[ =C2=A0=C2=A0=C2=A03.016580] usb usb3: New USB device found, idVendor=
=3D1d6b, idProduct=3D0002, bcdDevice=3D 6.09
<br>[ =C2=A0=C2=A0=C2=A03.016582] usb usb3: New USB device strings: Mfr=3D3=
, Product=3D2, SerialNumber=3D1
<br>[ =C2=A0=C2=A0=C2=A03.016583] usb usb3: Product: xHCI Host Controller
<br>[ =C2=A0=C2=A0=C2=A03.016584] usb usb3: Manufacturer: Linux 6.9.0-RX760=
0XT xhci-hcd
<br>[ =C2=A0=C2=A0=C2=A03.016585] usb usb3: SerialNumber: 0000:0c:00.3
<br>[ =C2=A0=C2=A0=C2=A03.016615] hub 3-0:1.0: USB hub found
<br>[ =C2=A0=C2=A0=C2=A03.016625] hub 3-0:1.0: 2 ports detected
<br>[ =C2=A0=C2=A0=C2=A03.016741] usb usb4: We don&#39;t know the algorithm=
s for LPM for this host, disabling LPM.
<br>[ =C2=A0=C2=A0=C2=A03.016748] usb usb4: New USB device found, idVendor=
=3D1d6b, idProduct=3D0003, bcdDevice=3D 6.09
<br>[ =C2=A0=C2=A0=C2=A03.016750] usb usb4: New USB device strings: Mfr=3D3=
, Product=3D2, SerialNumber=3D1
<br>[ =C2=A0=C2=A0=C2=A03.016751] usb usb4: Product: xHCI Host Controller
<br>[ =C2=A0=C2=A0=C2=A03.016751] usb usb4: Manufacturer: Linux 6.9.0-RX760=
0XT xhci-hcd
<br>[ =C2=A0=C2=A0=C2=A03.016752] usb usb4: SerialNumber: 0000:0c:00.3
<br>[ =C2=A0=C2=A0=C2=A03.016779] hub 4-0:1.0: USB hub found
<br>[ =C2=A0=C2=A0=C2=A03.016786] hub 4-0:1.0: 2 ports detected
<br>[ =C2=A0=C2=A0=C2=A03.016965] xhci_hcd 0000:0c:00.4: xHCI Host Controll=
er
<br>[ =C2=A0=C2=A0=C2=A03.016980] xhci_hcd 0000:0c:00.4: new USB bus regist=
ered, assigned bus number 5
<br>[ =C2=A0=C2=A0=C2=A03.017328] xhci_hcd 0000:0c:00.4: hcc params 0x0120f=
fc5 hci version 0x120 quirks 0x0000000200000410
<br>[ =C2=A0=C2=A0=C2=A03.017545] xhci_hcd 0000:0c:00.4: xHCI Host Controll=
er
<br>[ =C2=A0=C2=A0=C2=A03.017557] xhci_hcd 0000:0c:00.4: new USB bus regist=
ered, assigned bus number 6
<br>[ =C2=A0=C2=A0=C2=A03.017559] xhci_hcd 0000:0c:00.4: Host supports USB =
3.1 Enhanced SuperSpeed
<br>[ =C2=A0=C2=A0=C2=A03.017570] usb usb5: New USB device found, idVendor=
=3D1d6b, idProduct=3D0002, bcdDevice=3D 6.09
<br>[ =C2=A0=C2=A0=C2=A03.017572] usb usb5: New USB device strings: Mfr=3D3=
, Product=3D2, SerialNumber=3D1
<br>[ =C2=A0=C2=A0=C2=A03.017573] usb usb5: Product: xHCI Host Controller
<br>[ =C2=A0=C2=A0=C2=A03.017573] usb usb5: Manufacturer: Linux 6.9.0-RX760=
0XT xhci-hcd
<br>[ =C2=A0=C2=A0=C2=A03.017574] usb usb5: SerialNumber: 0000:0c:00.4
<br>[ =C2=A0=C2=A0=C2=A03.017605] hub 5-0:1.0: USB hub found
<br>[ =C2=A0=C2=A0=C2=A03.017612] hub 5-0:1.0: 2 ports detected
<br>[ =C2=A0=C2=A0=C2=A03.017674] usb usb6: We don&#39;t know the algorithm=
s for LPM for this host, disabling LPM.
<br>[ =C2=A0=C2=A0=C2=A03.017680] usb usb6: New USB device found, idVendor=
=3D1d6b, idProduct=3D0003, bcdDevice=3D 6.09
<br>[ =C2=A0=C2=A0=C2=A03.017681] usb usb6: New USB device strings: Mfr=3D3=
, Product=3D2, SerialNumber=3D1
<br>[ =C2=A0=C2=A0=C2=A03.017683] usb usb6: Product: xHCI Host Controller
<br>[ =C2=A0=C2=A0=C2=A03.017683] usb usb6: Manufacturer: Linux 6.9.0-RX760=
0XT xhci-hcd
<br>[ =C2=A0=C2=A0=C2=A03.017684] usb usb6: SerialNumber: 0000:0c:00.4
<br>[ =C2=A0=C2=A0=C2=A03.017709] hub 6-0:1.0: USB hub found
<br>[ =C2=A0=C2=A0=C2=A03.017717] hub 6-0:1.0: 2 ports detected
<br>[ =C2=A0=C2=A0=C2=A03.017855] xhci_hcd 0000:0d:00.0: xHCI Host Controll=
er
<br>[ =C2=A0=C2=A0=C2=A03.017872] xhci_hcd 0000:0d:00.0: new USB bus regist=
ered, assigned bus number 7
<br>[ =C2=A0=C2=A0=C2=A03.019141] xhci_hcd 0000:0d:00.0: USB3 root hub has =
no ports
<br>[ =C2=A0=C2=A0=C2=A03.019144] xhci_hcd 0000:0d:00.0: hcc params 0x0110f=
fc5 hci version 0x120 quirks 0x0000000200000410
<br>[ =C2=A0=C2=A0=C2=A03.019369] xhci_hcd 0000:0d:00.0: xHCI Host Controll=
er
<br>[ =C2=A0=C2=A0=C2=A03.019385] xhci_hcd 0000:0d:00.0: new USB bus regist=
ered, assigned bus number 8
<br>[ =C2=A0=C2=A0=C2=A03.019387] xhci_hcd 0000:0d:00.0: Host supports USB =
3.0 SuperSpeed
<br>[ =C2=A0=C2=A0=C2=A03.019402] usb usb7: New USB device found, idVendor=
=3D1d6b, idProduct=3D0002, bcdDevice=3D 6.09
<br>[ =C2=A0=C2=A0=C2=A03.019404] usb usb7: New USB device strings: Mfr=3D3=
, Product=3D2, SerialNumber=3D1
<br>[ =C2=A0=C2=A0=C2=A03.019405] usb usb7: Product: xHCI Host Controller
<br>[ =C2=A0=C2=A0=C2=A03.019406] usb usb7: Manufacturer: Linux 6.9.0-RX760=
0XT xhci-hcd
<br>[ =C2=A0=C2=A0=C2=A03.019407] usb usb7: SerialNumber: 0000:0d:00.0
<br>[ =C2=A0=C2=A0=C2=A03.019436] hub 7-0:1.0: USB hub found
<br>[ =C2=A0=C2=A0=C2=A03.019439] hub 7-0:1.0: 1 port detected
<br>[ =C2=A0=C2=A0=C2=A03.019473] usb usb8: We don&#39;t know the algorithm=
s for LPM for this host, disabling LPM.
<br>[ =C2=A0=C2=A0=C2=A03.019480] usb usb8: New USB device found, idVendor=
=3D1d6b, idProduct=3D0003, bcdDevice=3D 6.09
<br>[ =C2=A0=C2=A0=C2=A03.019481] usb usb8: New USB device strings: Mfr=3D3=
, Product=3D2, SerialNumber=3D1
<br>[ =C2=A0=C2=A0=C2=A03.019482] usb usb8: Product: xHCI Host Controller
<br>[ =C2=A0=C2=A0=C2=A03.019483] usb usb8: Manufacturer: Linux 6.9.0-RX760=
0XT xhci-hcd
<br>[ =C2=A0=C2=A0=C2=A03.019484] usb usb8: SerialNumber: 0000:0d:00.0
<br>[ =C2=A0=C2=A0=C2=A03.019509] hub 8-0:1.0: USB hub found
<br>[ =C2=A0=C2=A0=C2=A03.019511] hub 8-0:1.0: config failed, hub doesn&#39=
;t have any ports! (err -19)
<br>[ =C2=A0=C2=A0=C2=A03.019588] usbcore: registered new interface driver =
usbserial_generic
<br>[ =C2=A0=C2=A0=C2=A03.019591] usbserial: USB Serial support registered =
for generic
<br>[ =C2=A0=C2=A0=C2=A03.019603] i8042: PNP: PS/2 Controller [PNP0303:PS2K=
] at 0x60,0x64 irq 1
<br>[ =C2=A0=C2=A0=C2=A03.019605] i8042: PNP: PS/2 appears to have AUX port=
 disabled, if this is incorrect please boot with i8042.nopn
<br>p
<br>[ =C2=A0=C2=A0=C2=A03.022376] serio: i8042 KBD port at 0x60,0x64 irq 1
<br>[ =C2=A0=C2=A0=C2=A03.022407] mousedev: PS/2 mouse device common for al=
l mice
<br>[ =C2=A0=C2=A0=C2=A03.023403] rtc_cmos 00:02: RTC can wake from S4
<br>[ =C2=A0=C2=A0=C2=A03.023565] rtc_cmos 00:02: registered as rtc0
<br>[ =C2=A0=C2=A0=C2=A03.023595] rtc_cmos 00:02: setting system clock to 2=
024-05-15T18:01:33 UTC (1715796093)
<br>[ =C2=A0=C2=A0=C2=A03.023611] rtc_cmos 00:02: alarms up to one month, 1=
14 bytes nvram
<br>[ =C2=A0=C2=A0=C2=A03.023618] device-mapper: core: CONFIG_IMA_DISABLE_H=
TABLE is disabled. Duplicate IMA measurements will not be r
<br>ecorded in the IMA log.
<br>[ =C2=A0=C2=A0=C2=A03.023622] device-mapper: uevent: version 1.0.3
<br>[ =C2=A0=C2=A0=C2=A03.023659] device-mapper: ioctl: 4.48.0-ioctl (2023-=
03-01) initialised: <a href=3D"mailto:dm-devel@lists.linux.dev">dm-devel@li=
sts.linux.dev</a>
<br>[ =C2=A0=C2=A0=C2=A03.025513] [drm] Initialized simpledrm 1.0.0 2020062=
5 for simple-framebuffer.0 on minor 0
<br>[ =C2=A0=C2=A0=C2=A03.029153] Console: switching to colour frame buffer=
 device 320x100
<br>[ =C2=A0=C2=A0=C2=A03.031731] simple-framebuffer simple-framebuffer.0: =
[drm] fb0: simpledrmdrmfb frame buffer device
<br>[ =C2=A0=C2=A0=C2=A03.031817] hid: raw HID events driver (C) Jiri Kosin=
a
<br>[ =C2=A0=C2=A0=C2=A03.031861] usbcore: registered new interface driver =
usbhid
<br>[ =C2=A0=C2=A0=C2=A03.031872] usbhid: USB HID core driver
<br>[ =C2=A0=C2=A0=C2=A03.032031] drop_monitor: Initializing network drop m=
onitor service
<br>[ =C2=A0=C2=A0=C2=A03.032102] Initializing XFRM netlink socket
<br>[ =C2=A0=C2=A0=C2=A03.032126] NET: Registered PF_INET6 protocol family
<br>[ =C2=A0=C2=A0=C2=A03.034626] Segment Routing with IPv6
<br>[ =C2=A0=C2=A0=C2=A03.034632] RPL Segment Routing with IPv6
<br>[ =C2=A0=C2=A0=C2=A03.034641] In-situ OAM (IOAM) with IPv6
<br>[ =C2=A0=C2=A0=C2=A03.034656] mip6: Mobile IPv6
<br>[ =C2=A0=C2=A0=C2=A03.034660] NET: Registered PF_PACKET protocol family
<br>[ =C2=A0=C2=A0=C2=A03.035557] microcode: Current revision: 0x0a601206
<br>[ =C2=A0=C2=A0=C2=A03.035916] resctrl: L3 allocation detected
<br>[ =C2=A0=C2=A0=C2=A03.035921] resctrl: MB allocation detected
<br>[ =C2=A0=C2=A0=C2=A03.035924] resctrl: SMBA allocation detected
<br>[ =C2=A0=C2=A0=C2=A03.035929] resctrl: L3 monitoring detected
<br>[ =C2=A0=C2=A0=C2=A03.035949] IPI shorthand broadcast: enabled
<br>[ =C2=A0=C2=A0=C2=A03.035957] AVX2 version of gcm_enc/dec engaged.
<br>[ =C2=A0=C2=A0=C2=A03.036140] AES CTR mode by8 optimization enabled
<br>[ =C2=A0=C2=A0=C2=A03.036830] sched_clock: Marking stable (3035023337, =
1617963)-&gt;(3072096241, -35454941)
<br>[ =C2=A0=C2=A0=C2=A03.036919] Timer migration: 2 hierarchy levels; 8 ch=
ildren per group; 2 crossnode level
<br>[ =C2=A0=C2=A0=C2=A03.037030] registered taskstats version 1
<br>[ =C2=A0=C2=A0=C2=A03.037285] Loading compiled-in X.509 certificates
<br>[ =C2=A0=C2=A0=C2=A03.041637] Loaded X.509 cert &#39;Build time autogen=
erated kernel key: ec3f0af369e59acf168b705afdf50840939a67ed&#39;
<br>[ =C2=A0=C2=A0=C2=A03.042451] page_owner is disabled
<br>[ =C2=A0=C2=A0=C2=A03.042524] Key type .fscrypt registered
<br>[ =C2=A0=C2=A0=C2=A03.042528] Key type fscrypt-provisioning registered
<br>[ =C2=A0=C2=A0=C2=A03.042694] Btrfs loaded, zoned=3Dyes, fsverity=3Dyes
<br>[ =C2=A0=C2=A0=C2=A03.042705] Key type big_key registered
<br>[ =C2=A0=C2=A0=C2=A03.042712] Key type trusted registered
<br>[ =C2=A0=C2=A0=C2=A03.047823] input: AT Translated Set 2 keyboard as /d=
evices/platform/i8042/serio0/input/input3
<br>[ =C2=A0=C2=A0=C2=A03.049438] Key type encrypted registered
<br>[ =C2=A0=C2=A0=C2=A03.050310] integrity: Loading X.509 certificate: UEF=
I:db
<br>[ =C2=A0=C2=A0=C2=A03.050326] integrity: Loaded X.509 cert &#39;Microso=
ft Windows Production PCA 2011: a92902398e16c49778cd90f99e4f9ae
<br>17c55af53&#39;
<br>[ =C2=A0=C2=A0=C2=A03.050334] integrity: Loading X.509 certificate: UEF=
I:db
<br>[ =C2=A0=C2=A0=C2=A03.050347] integrity: Loaded X.509 cert &#39;Microso=
ft Corporation UEFI CA 2011: 13adbf4309bd82709c8cd54f316ed52298
<br>8a1bd4&#39;
<br>[ =C2=A0=C2=A0=C2=A03.050355] integrity: Loading X.509 certificate: UEF=
I:db
<br>[ =C2=A0=C2=A0=C2=A03.054134] integrity: Loaded X.509 cert &#39;: 9b398=
b58bae7d28e4449e715084144d8&#39;
<br>[ =C2=A0=C2=A0=C2=A03.056203] Loading compiled-in module X.509 certific=
ates
<br>[ =C2=A0=C2=A0=C2=A03.056575] Loaded X.509 cert &#39;Build time autogen=
erated kernel key: ec3f0af369e59acf168b705afdf50840939a67ed&#39;
<br>[ =C2=A0=C2=A0=C2=A03.056585] ima: Allocated hash algorithm: sha256
<br>[ =C2=A0=C2=A0=C2=A03.067633] ima: No architecture policies found
<br>[ =C2=A0=C2=A0=C2=A03.067642] evm: Initialising EVM extended attributes=
:
<br>[ =C2=A0=C2=A0=C2=A03.067647] evm: security.selinux
<br>[ =C2=A0=C2=A0=C2=A03.067650] evm: security.SMACK64 (disabled)
<br>[ =C2=A0=C2=A0=C2=A03.067655] evm: security.SMACK64EXEC (disabled)
<br>[ =C2=A0=C2=A0=C2=A03.067659] evm: security.SMACK64TRANSMUTE (disabled)
<br>[ =C2=A0=C2=A0=C2=A03.067663] evm: security.SMACK64MMAP (disabled)
<br>[ =C2=A0=C2=A0=C2=A03.067667] evm: security.apparmor (disabled)
<br>[ =C2=A0=C2=A0=C2=A03.067671] evm: security.ima
<br>[ =C2=A0=C2=A0=C2=A03.067674] evm: security.capability
<br>[ =C2=A0=C2=A0=C2=A03.067677] evm: HMAC attrs: 0x1
<br>[ =C2=A0=C2=A0=C2=A03.084895] alg: No test for 842 (842-scomp)
<br>[ =C2=A0=C2=A0=C2=A03.084935] alg: No test for 842 (842-generic)
<br>[ =C2=A0=C2=A0=C2=A03.139553] PM: =C2=A0=C2=A0Magic number: 8:990:38
<br>[ =C2=A0=C2=A0=C2=A03.141124] RAS: Correctable Errors collector initial=
ized.
<br>[ =C2=A0=C2=A0=C2=A03.152986] clk: Disabling unused clocks
<br>[ =C2=A0=C2=A0=C2=A03.152995] PM: genpd: Disabling unused power domains
<br>[ =C2=A0=C2=A0=C2=A03.153418] Freeing unused decrypted memory: 2028K
<br>[ =C2=A0=C2=A0=C2=A03.153724] Freeing unused kernel image (initmem) mem=
ory: 4580K
<br>[ =C2=A0=C2=A0=C2=A03.153731] Write protecting the kernel read-only dat=
a: 36864k
<br>[ =C2=A0=C2=A0=C2=A03.153926] Freeing unused kernel image (rodata/data =
gap) memory: 1292K
<br>[ =C2=A0=C2=A0=C2=A03.158731] x86/mm: Checked W+X mappings: passed, no =
W+X pages found.
<br>[ =C2=A0=C2=A0=C2=A03.158807] Run /init as init process
<br>[ =C2=A0=C2=A0=C2=A03.158812] =C2=A0=C2=A0with arguments:
<br>[ =C2=A0=C2=A0=C2=A03.158813] =C2=A0=C2=A0=C2=A0=C2=A0/init
<br>[ =C2=A0=C2=A0=C2=A03.158814] =C2=A0=C2=A0with environment:
<br>[ =C2=A0=C2=A0=C2=A03.158814] =C2=A0=C2=A0=C2=A0=C2=A0HOME=3D/
<br>[ =C2=A0=C2=A0=C2=A03.158814] =C2=A0=C2=A0=C2=A0=C2=A0TERM=3Dlinux
<br>[ =C2=A0=C2=A0=C2=A03.158815] =C2=A0=C2=A0=C2=A0=C2=A0BOOT_IMAGE=3D(hd1=
,gpt2)/vmlinuz-6.9.0-RX7600XT
<br>[ =C2=A0=C2=A0=C2=A03.169366] systemd[1]: systemd 255.6-1.fc40 running =
in system mode (+PAM +AUDIT +SELINUX -APPARMOR +IMA +SMACK =C2=A0<br>+SECCO=
MP -GCRYPT +GNUTLS +OPENSSL +ACL +BLKID +CURL +ELFUTILS +FIDO2 +IDN2 -IDN -=
IPTC +KMOD +LIBCRYPTSETUP +LIBFDIS
<br>K +PCRE2 +PWQUALITY +P11KIT +QRENCODE +TPM2 +BZIP2 +LZ4 +XZ +ZLIB +ZSTD=
 +BPF_FRAMEWORK +XKBCOMMON +UTMP +SYSVINIT d
<br>efault-hierarchy=3Dunified)
<br>[ =C2=A0=C2=A0=C2=A03.169387] systemd[1]: Detected architecture x86-64.
<br>[ =C2=A0=C2=A0=C2=A03.169392] systemd[1]: Running in initrd.
<br>[ =C2=A0=C2=A0=C2=A03.169468] systemd[1]: Hostname set to &lt;watchman&=
gt;.
<br>[ =C2=A0=C2=A0=C2=A03.257984] usb 5-1: new high-speed USB device number=
 2 using xhci_hcd
<br>[ =C2=A0=C2=A0=C2=A03.258023] usb 7-1: new high-speed USB device number=
 2 using xhci_hcd
<br>[ =C2=A0=C2=A0=C2=A03.319987] usb 1-1: new high-speed USB device number=
 2 using xhci_hcd
<br>[ =C2=A0=C2=A0=C2=A03.390798] usb 5-1: New USB device found, idVendor=
=3D2109, idProduct=3D2817, bcdDevice=3D 7.c3
<br>[ =C2=A0=C2=A0=C2=A03.391214] usb 5-1: New USB device strings: Mfr=3D1,=
 Product=3D2, SerialNumber=3D0
<br>[ =C2=A0=C2=A0=C2=A03.391493] usb 5-1: Product: USB2.0 Hub =C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<br>[ =C2=
=A0=C2=A0=C2=A03.391761] usb 5-1: Manufacturer: VIA Labs, Inc. =C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<br>[ =C2=A0=C2=A0=C2=A03.395560]=
 usb 7-1: New USB device found, idVendor=3D0bda, idProduct=3D555a, bcdDevic=
e=3D24.71
<br>[ =C2=A0=C2=A0=C2=A03.395959] usb 7-1: New USB device strings: Mfr=3D3,=
 Product=3D1, SerialNumber=3D2
<br>[ =C2=A0=C2=A0=C2=A03.396235] usb 7-1: Product: Integrated_Webcam_FHD
<br>[ =C2=A0=C2=A0=C2=A03.396497] usb 7-1: Manufacturer: C7FME20T08142000B2=
80
<br>[ =C2=A0=C2=A0=C2=A03.396756] usb 7-1: SerialNumber: 200901010001
<br>[ =C2=A0=C2=A0=C2=A03.434766] hub 5-1:1.0: USB hub found
<br>[ =C2=A0=C2=A0=C2=A03.437596] hub 5-1:1.0: 4 ports detected
<br>[ =C2=A0=C2=A0=C2=A03.483704] systemd[1]: bpf-lsm: LSM BPF program atta=
ched
<br>[ =C2=A0=C2=A0=C2=A03.508098] systemd[1]: Queued start job for default =
target initrd.target.
<br>[ =C2=A0=C2=A0=C2=A03.516178] usb 1-1: New USB device found, idVendor=
=3D2109, idProduct=3D2822, bcdDevice=3D37.64
<br>[ =C2=A0=C2=A0=C2=A03.516528] usb 1-1: New USB device strings: Mfr=3D1,=
 Product=3D2, SerialNumber=3D3
<br>[ =C2=A0=C2=A0=C2=A03.516806] usb 1-1: Product: USB2.0 Hub =C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<br>[ =C2=
=A0=C2=A0=C2=A03.517065] usb 1-1: Manufacturer: VIA Labs, Inc. =C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<br>[ =C2=A0=C2=A0=C2=A03.517318]=
 usb 1-1: SerialNumber: 000000001
<br>[ =C2=A0=C2=A0=C2=A03.524412] hub 1-1:1.0: USB hub found
<br>[ =C2=A0=C2=A0=C2=A03.526391] systemd[1]: Expecting device dev-disk-by\=
x2duuid-ac66d86f\x2da430\x2d4aef\x2d8f35\<a href=3D"http://x2d53cc5f761de5.=
de">x2d53cc5f761de5.de</a>
<br>vice - /dev/disk/by-uuid/ac66d86f-a430-4aef-8f35-53cc5f761de5...
<br>[ =C2=A0=C2=A0=C2=A03.526490] hub 1-1:1.0: 5 ports detected
<br>[ =C2=A0=C2=A0=C2=A03.527345] systemd[1]: Reached target initrd-usr-fs.=
target - Initrd /usr File System.
<br>[ =C2=A0=C2=A0=C2=A03.528894] systemd[1]: Reached target slices.target =
- Slice Units.
<br>[ =C2=A0=C2=A0=C2=A03.529791] systemd[1]: Reached target swap.target - =
Swaps.
<br>[ =C2=A0=C2=A0=C2=A03.530846] systemd[1]: Reached target timers.target =
- Timer Units.
<br>[ =C2=A0=C2=A0=C2=A03.532070] systemd[1]: Listening on dbus.socket - D-=
Bus System Message Bus Socket.
<br>[ =C2=A0=C2=A0=C2=A03.532662] usb 6-1: new SuperSpeed USB device number=
 2 using xhci_hcd
<br>[ =C2=A0=C2=A0=C2=A03.534060] systemd[1]: Listening on systemd-journald=
-dev-log.socket - Journal Socket (/dev/log).
<br>[ =C2=A0=C2=A0=C2=A03.535247] systemd[1]: Listening on systemd-journald=
.socket - Journal Socket.
<br>[ =C2=A0=C2=A0=C2=A03.536537] systemd[1]: Listening on systemd-udevd-co=
ntrol.socket - udev Control Socket.
<br>[ =C2=A0=C2=A0=C2=A03.538164] systemd[1]: Listening on systemd-udevd-ke=
rnel.socket - udev Kernel Socket.
<br>[ =C2=A0=C2=A0=C2=A03.539490] systemd[1]: Reached target sockets.target=
 - Socket Units.
<br>[ =C2=A0=C2=A0=C2=A03.541740] systemd[1]: Starting kmod-static-nodes.se=
rvice - Create List of Static Device Nodes...
<br>[ =C2=A0=C2=A0=C2=A03.543155] systemd[1]: memstrack.service - Memstrack=
 Anylazing Service was skipped because no trigger condition
<br> checks were met.
<br>[ =C2=A0=C2=A0=C2=A03.545432] systemd[1]: Starting systemd-journald.ser=
vice - Journal Service...
<br>[ =C2=A0=C2=A0=C2=A03.548084] systemd[1]: Starting systemd-modules-load=
.service - Load Kernel Modules...
<br>[ =C2=A0=C2=A0=C2=A03.550229] systemd[1]: Starting systemd-vconsole-set=
up.service - Virtual Console Setup...
<br>[ =C2=A0=C2=A0=C2=A03.552096] systemd[1]: Finished kmod-static-nodes.se=
rvice - Create List of Static Device Nodes.
<br>[ =C2=A0=C2=A0=C2=A03.552378] systemd-journald[417]: Collecting audit m=
essages is disabled.
<br>[ =C2=A0=C2=A0=C2=A03.555086] i2c_dev: i2c /dev entries driver
<br>[ =C2=A0=C2=A0=C2=A03.559267] systemd[1]: Starting systemd-tmpfiles-set=
up-dev-early.service - Create Static Device Nodes in /dev g
<br>racefully...
<br>[ =C2=A0=C2=A0=C2=A03.566433] systemd[1]: Finished systemd-tmpfiles-set=
up-dev-early.service - Create Static Device Nodes in /dev g
<br>racefully.
<br>[ =C2=A0=C2=A0=C2=A03.569189] systemd[1]: Starting systemd-sysusers.ser=
vice - Create System Users...
<br>[ =C2=A0=C2=A0=C2=A03.571186] systemd[1]: Started systemd-journald.serv=
ice - Journal Service.
<br>[ =C2=A0=C2=A0=C2=A03.573290] fuse: init (API version 7.40)
<br>[ =C2=A0=C2=A0=C2=A03.578724] alua: device handler registered
<br>[ =C2=A0=C2=A0=C2=A03.580378] emc: device handler registered
<br>[ =C2=A0=C2=A0=C2=A03.584777] rdac: device handler registered
<br>[ =C2=A0=C2=A0=C2=A03.632774] usb 2-1: new SuperSpeed Plus Gen 2x1 USB =
device number 2 using xhci_hcd
<br>[ =C2=A0=C2=A0=C2=A03.650204] usb 6-1: New USB device found, idVendor=
=3D2109, idProduct=3D0817, bcdDevice=3D 7.c3
<br>[ =C2=A0=C2=A0=C2=A03.650592] usb 6-1: New USB device strings: Mfr=3D1,=
 Product=3D2, SerialNumber=3D0
<br>[ =C2=A0=C2=A0=C2=A03.650965] usb 6-1: Product: USB3.0 Hub =C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<br>[ =C2=
=A0=C2=A0=C2=A03.651324] usb 6-1: Manufacturer: VIA Labs, Inc. =C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<br>[ =C2=A0=C2=A0=C2=A03.673645]=
 hub 6-1:1.0: USB hub found
<br>[ =C2=A0=C2=A0=C2=A03.675942] hub 6-1:1.0: 4 ports detected
<br>[ =C2=A0=C2=A0=C2=A03.692638] usb 2-1: New USB device found, idVendor=
=3D2109, idProduct=3D0822, bcdDevice=3D37.64
<br>[ =C2=A0=C2=A0=C2=A03.693049] usb 2-1: New USB device strings: Mfr=3D1,=
 Product=3D2, SerialNumber=3D3
<br>[ =C2=A0=C2=A0=C2=A03.693424] usb 2-1: Product: USB3.1 Hub =C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<br>[ =C2=
=A0=C2=A0=C2=A03.693425] usb 2-1: Manufacturer: VIA Labs, Inc. =C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<br>[ =C2=A0=C2=A0=C2=A03.693425]=
 usb 2-1: SerialNumber: 000000001
<br>[ =C2=A0=C2=A0=C2=A03.702219] hub 2-1:1.0: USB hub found
<br>[ =C2=A0=C2=A0=C2=A03.704796] hub 2-1:1.0: 4 ports detected
<br>[ =C2=A0=C2=A0=C2=A03.705494] wmi_bus wmi_bus-PNP0C14:00: [Firmware Bug=
]: WQBC data block query control method not found
<br>[ =C2=A0=C2=A0=C2=A03.707497] wmi_bus wmi_bus-PNP0C14:00: [Firmware Bug=
]: WMBD method block execution control method not found
<br>[ =C2=A0=C2=A0=C2=A03.711356] sp5100_tco: SP5100/SB800 TCO WatchDog Tim=
er Driver
<br>[ =C2=A0=C2=A0=C2=A03.711441] sp5100-tco sp5100-tco: Using 0xfeb00000 f=
or watchdog MMIO address
<br>[ =C2=A0=C2=A0=C2=A03.711520] sp5100-tco sp5100-tco: initialized. heart=
beat=3D60 sec (nowayout=3D0)
<br>[ =C2=A0=C2=A0=C2=A03.792401] ccp 0000:0c:00.2: tee enabled
<br>[ =C2=A0=C2=A0=C2=A03.792872] ccp 0000:0c:00.2: psp enabled
<br>[ =C2=A0=C2=A0=C2=A03.793672] input: DELL0C4C:00 04F3:328A Mouse as /de=
vices/platform/AMDI0010:00/i2c-0/i2c-DELL0C4C:00/0018:04F3:
<br>328A.0001/input/input4
<br>[ =C2=A0=C2=A0=C2=A03.794385] input: DELL0C4C:00 04F3:328A Touchpad as =
/devices/platform/AMDI0010:00/i2c-0/i2c-DELL0C4C:00/0018:04
<br>F3:328A.0001/input/input5
<br>[ =C2=A0=C2=A0=C2=A03.794844] hid-generic 0018:04F3:328A.0001: input,hi=
draw0: I2C HID v1.00 Mouse [DELL0C4C:00 04F3:328A] on i2c-D
<br>ELL0C4C:00
<br>[ =C2=A0=C2=A0=C2=A03.839989] nvme 0000:04:00.0: platform quirk: settin=
g simple suspend
<br>[ =C2=A0=C2=A0=C2=A03.839989] nvme 0000:05:00.0: platform quirk: settin=
g simple suspend
<br>[ =C2=A0=C2=A0=C2=A03.840023] r8169 0000:0b:00.0 eth0: RTL8125B, ac:1a:=
3d:cc:f8:2b, XID 641, IRQ 86
<br>[ =C2=A0=C2=A0=C2=A03.840027] r8169 0000:0b:00.0 eth0: jumbo features [=
frames: 9194 bytes, tx checksumming: ko]
<br>[ =C2=A0=C2=A0=C2=A03.840074] nvme nvme0: pci function 0000:04:00.0
<br>[ =C2=A0=C2=A0=C2=A03.840074] nvme nvme1: pci function 0000:05:00.0
<br>[ =C2=A0=C2=A0=C2=A03.855747] nvme nvme1: missing or invalid SUBNQN fie=
ld.
<br>[ =C2=A0=C2=A0=C2=A03.856421] nvme nvme1: D3 entry latency set to 8 sec=
onds
<br>[ =C2=A0=C2=A0=C2=A03.857039] nvme nvme0: D3 entry latency set to 10 se=
conds
<br>[ =C2=A0=C2=A0=C2=A03.889103] nvme nvme0: 24/0/0 default/read/poll queu=
es
<br>[ =C2=A0=C2=A0=C2=A03.892839] =C2=A0nvme0n1: p1 p2 p3 p4
<br>[ =C2=A0=C2=A0=C2=A03.973600] input: DELL0C4C:00 04F3:328A Mouse as /de=
vices/platform/AMDI0010:00/i2c-0/i2c-DELL0C4C:00/0018:04F3:
<br>328A.0001/input/input7
<br>[ =C2=A0=C2=A0=C2=A03.974469] input: DELL0C4C:00 04F3:328A Touchpad as =
/devices/platform/AMDI0010:00/i2c-0/i2c-DELL0C4C:00/0018:04
<br>F3:328A.0001/input/input8
<br>[ =C2=A0=C2=A0=C2=A03.974841] hid-multitouch 0018:04F3:328A.0001: input=
,hidraw0: I2C HID v1.00 Mouse [DELL0C4C:00 04F3:328A] on i2
<br>c-DELL0C4C:00
<br>[ =C2=A0=C2=A0=C2=A04.011150] nvme nvme1: 24/0/0 default/read/poll queu=
es
<br>[ =C2=A0=C2=A0=C2=A04.036653] =C2=A0nvme1n1: p1 p2 p3
<br>[ =C2=A0=C2=A0=C2=A04.038947] r8169 0000:0b:00.0 enp11s0: renamed from =
eth0
<br>[ =C2=A0=C2=A0=C2=A04.080154] ucsi_acpi USBC000:00: UCSI_GET_PDOS faile=
d (-95)
<br>[ =C2=A0=C2=A0=C2=A04.141779] ucsi_acpi USBC000:00: UCSI_GET_PDOS faile=
d (-95)
<br>[ =C2=A0=C2=A0=C2=A04.205622] usb 5-1.2: new full-speed USB device numb=
er 3 using xhci_hcd
<br>[ =C2=A0=C2=A0=C2=A04.220057] ACPI: video: Video Device [VGA] (multi-he=
ad: yes =C2=A0rom: no =C2=A0post: no)
<br>[ =C2=A0=C2=A0=C2=A04.220208] input: Video Bus as /devices/LNXSYSTM:00/=
LNXSYBUS:00/PNP0A08:00/device:1e/LNXVIDEO:00/input/input10
<br>[ =C2=A0=C2=A0=C2=A04.269641] usb 1-1.1: new low-speed USB device numbe=
r 3 using xhci_hcd
<br>[ =C2=A0=C2=A0=C2=A04.367192] usb 5-1.2: New USB device found, idVendor=
=3D8087, idProduct=3D0032, bcdDevice=3D 0.00
<br>[ =C2=A0=C2=A0=C2=A04.367200] usb 5-1.2: New USB device strings: Mfr=3D=
0, Product=3D0, SerialNumber=3D0
<br>[ =C2=A0=C2=A0=C2=A04.397742] ucsi_acpi USBC000:00: UCSI_GET_PDOS faile=
d (-95)
<br>[ =C2=A0=C2=A0=C2=A04.504643] usb 5-1.3: new full-speed USB device numb=
er 4 using xhci_hcd
<br>[ =C2=A0=C2=A0=C2=A04.516045] usb 1-1.1: New USB device found, idVendor=
=3D045e, idProduct=3D0040, bcdDevice=3D 3.00
<br>[ =C2=A0=C2=A0=C2=A04.516054] usb 1-1.1: New USB device strings: Mfr=3D=
1, Product=3D3, SerialNumber=3D0
<br>[ =C2=A0=C2=A0=C2=A04.516056] usb 1-1.1: Product: Microsoft 3-Button Mo=
use with IntelliEye(TM)
<br>[ =C2=A0=C2=A0=C2=A04.516057] usb 1-1.1: Manufacturer: Microsoft
<br>[ =C2=A0=C2=A0=C2=A04.528180] input: Microsoft Microsoft 3-Button Mouse=
 with IntelliEye(TM) as /devices/pci0000:00/0000:00:02.1/00
<br>00:06:00.0/0000:07:02.0/0000:08:00.0/usb1/1-1/1-1.1/1-1.1:1.0/0003:045E=
:0040.0002/input/input11
<br>[ =C2=A0=C2=A0=C2=A04.528271] hid-generic 0003:045E:0040.0002: input,hi=
draw1: USB HID v1.10 Mouse [Microsoft Microsoft 3-Button Mo
<br>use with IntelliEye(TM)] on usb-0000:08:00.0-1.1/input0
<br>[ =C2=A0=C2=A0=C2=A04.601651] usb 2-1.3: new SuperSpeed Plus Gen 2x1 US=
B device number 3 using xhci_hcd
<br>[ =C2=A0=C2=A0=C2=A04.622760] usb 5-1.3: New USB device found, idVendor=
=3D0d62, idProduct=3Dbab0, bcdDevice=3D33.09
<br>[ =C2=A0=C2=A0=C2=A04.622770] usb 5-1.3: New USB device strings: Mfr=3D=
1, Product=3D2, SerialNumber=3D0
<br>[ =C2=A0=C2=A0=C2=A04.622772] usb 5-1.3: Product: Keyboard
<br>[ =C2=A0=C2=A0=C2=A04.622773] usb 5-1.3: Manufacturer: DELL Technologie=
s
<br>[ =C2=A0=C2=A0=C2=A04.652374] usb 2-1.3: New USB device found, idVendor=
=3D2109, idProduct=3D0822, bcdDevice=3D38.23
<br>[ =C2=A0=C2=A0=C2=A04.652377] usb 2-1.3: New USB device strings: Mfr=3D=
1, Product=3D2, SerialNumber=3D3
<br>[ =C2=A0=C2=A0=C2=A04.652378] usb 2-1.3: Product: USB3.1 Hub =C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<br>[ =
=C2=A0=C2=A0=C2=A04.652378] usb 2-1.3: Manufacturer: VIA Labs, Inc. =C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<br>[ =C2=A0=C2=A0=C2=A04.6=
52379] usb 2-1.3: SerialNumber: 000000001
<br>[ =C2=A0=C2=A0=C2=A04.662035] hub 2-1.3:1.0: USB hub found
<br>[ =C2=A0=C2=A0=C2=A04.663487] hub 2-1.3:1.0: 4 ports detected
<br>[ =C2=A0=C2=A0=C2=A04.689210] input: DELL Technologies Keyboard as /dev=
ices/pci0000:00/0000:00:08.1/0000:0c:00.4/usb5/5-1/5-1.3/5-
<br>1.3:1.0/0003:0D62:BAB0.0003/input/input12
<br>[ =C2=A0=C2=A0=C2=A04.741825] hid-generic 0003:0D62:BAB0.0003: input,hi=
ddev96,hidraw2: USB HID v1.10 Keyboard [DELL Technologies K
<br>eyboard] on usb-0000:0c:00.4-1.3/input0
<br>[ =C2=A0=C2=A0=C2=A04.777482] usb 1-1.3: new high-speed USB device numb=
er 4 using xhci_hcd
<br>[ =C2=A0=C2=A0=C2=A04.893632] usb 5-1.4: new full-speed USB device numb=
er 5 using xhci_hcd
<br>[ =C2=A0=C2=A0=C2=A04.907483] ucsi_acpi USBC000:00: UCSI_GET_PDOS faile=
d (-95)
<br>[ =C2=A0=C2=A0=C2=A04.959740] usb 1-1.3: New USB device found, idVendor=
=3D2109, idProduct=3D2822, bcdDevice=3D38.23
<br>[ =C2=A0=C2=A0=C2=A04.965730] usb 1-1.3: New USB device strings: Mfr=3D=
1, Product=3D2, SerialNumber=3D3
<br>[ =C2=A0=C2=A0=C2=A04.980949] usb 1-1.3: Product: USB2.0 Hub =C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<br>[ =
=C2=A0=C2=A0=C2=A04.981576] usb 1-1.3: Manufacturer: VIA Labs, Inc. =C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<br>[ =C2=A0=C2=A0=C2=A04.9=
81577] usb 1-1.3: SerialNumber: 000000001
<br>[ =C2=A0=C2=A0=C2=A05.021591] hub 1-1.3:1.0: USB hub found
<br>[ =C2=A0=C2=A0=C2=A05.036480] hub 1-1.3:1.0: 5 ports detected
<br>[ =C2=A0=C2=A0=C2=A05.046587] usb 2-1.4: new SuperSpeed USB device numb=
er 4 using xhci_hcd
<br>[ =C2=A0=C2=A0=C2=A05.093414] ucsi_acpi USBC000:00: UCSI_GET_PDOS faile=
d (-95)
<br>[ =C2=A0=C2=A0=C2=A05.106131] usb 2-1.4: New USB device found, idVendor=
=3D2109, idProduct=3D0817, bcdDevice=3D37.23
<br>[ =C2=A0=C2=A0=C2=A05.106870] usb 2-1.4: New USB device strings: Mfr=3D=
1, Product=3D2, SerialNumber=3D3
<br>[ =C2=A0=C2=A0=C2=A05.107324] usb 2-1.4: Product: USB3.0 Hub =C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<br>[ =
=C2=A0=C2=A0=C2=A05.107741] usb 2-1.4: Manufacturer: VIA Labs, Inc. =C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<br>[ =C2=A0=C2=A0=C2=A05.1=
08617] usb 2-1.4: SerialNumber: 000000000
<br>[ =C2=A0=C2=A0=C2=A05.120896] usb 5-1.4: New USB device found, idVendor=
=3D187c, idProduct=3D0551, bcdDevice=3D 2.00
<br>[ =C2=A0=C2=A0=C2=A05.120898] usb 5-1.4: New USB device strings: Mfr=3D=
1, Product=3D2, SerialNumber=3D3
<br>[ =C2=A0=C2=A0=C2=A05.120899] usb 5-1.4: Product: AW-ELC
<br>[ =C2=A0=C2=A0=C2=A05.120899] usb 5-1.4: Manufacturer: Alienware
<br>[ =C2=A0=C2=A0=C2=A05.120900] usb 5-1.4: SerialNumber: 00.01
<br>[ =C2=A0=C2=A0=C2=A05.131911] hub 2-1.4:1.0: USB hub found
<br>[ =C2=A0=C2=A0=C2=A05.152640] hub 2-1.4:1.0: 4 ports detected
<br>[ =C2=A0=C2=A0=C2=A05.217190] hid-generic 0003:187C:0551.0004: hiddev97=
,hidraw3: USB HID v1.11 Device [Alienware AW-ELC] on usb-00
<br>00:0c:00.4-1.4/input0
<br>[ =C2=A0=C2=A0=C2=A05.217192] ucsi_acpi USBC000:00: UCSI_GET_PDOS faile=
d (-95)
<br>[ =C2=A0=C2=A0=C2=A05.369500] usb 1-1.4: new high-speed USB device numb=
er 5 using xhci_hcd
<br>[ =C2=A0=C2=A0=C2=A05.528035] ucsi_acpi USBC000:00: UCSI_GET_PDOS faile=
d (-95)
<br>[ =C2=A0=C2=A0=C2=A05.563473] usb 1-1.4: New USB device found, idVendor=
=3D2109, idProduct=3D2817, bcdDevice=3D37.23
<br>[ =C2=A0=C2=A0=C2=A05.574682] usb 1-1.4: New USB device strings: Mfr=3D=
1, Product=3D2, SerialNumber=3D3
<br>[ =C2=A0=C2=A0=C2=A05.575285] usb 1-1.4: Product: USB2.0 Hub =C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<br>[ =
=C2=A0=C2=A0=C2=A05.575826] usb 1-1.4: Manufacturer: VIA Labs, Inc. =C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<br>[ =C2=A0=C2=A0=C2=A05.5=
76354] usb 1-1.4: SerialNumber: 000000000
<br>[ =C2=A0=C2=A0=C2=A05.590013] ucsi_acpi USBC000:00: UCSI_GET_PDOS faile=
d (-95)
<br>[ =C2=A0=C2=A0=C2=A05.602216] hub 1-1.4:1.0: USB hub found
<br>[ =C2=A0=C2=A0=C2=A05.607330] hub 1-1.4:1.0: 5 ports detected
<br>[ =C2=A0=C2=A0=C2=A06.699087] [drm] amdgpu kernel modesetting enabled.
<br>[ =C2=A0=C2=A0=C2=A06.700923] amdgpu: Virtual CRAT table created for CP=
U
<br>[ =C2=A0=C2=A0=C2=A06.700933] amdgpu: Topology: Add CPU node
<br>[ =C2=A0=C2=A0=C2=A06.701390] [drm] initializing kernel modesetting (IP=
 DISCOVERY 0x1002:0x7480 0x1028:0x0C4C 0xC7).
<br>[ =C2=A0=C2=A0=C2=A06.707710] [drm] register mmio base: 0xC0E00000
<br>[ =C2=A0=C2=A0=C2=A06.708560] [drm] register mmio size: 1048576
<br>[ =C2=A0=C2=A0=C2=A06.715018] [drm] add ip block number 0 &lt;soc21_com=
mon&gt;
<br>[ =C2=A0=C2=A0=C2=A06.715819] [drm] add ip block number 1 &lt;gmc_v11_0=
&gt;
<br>[ =C2=A0=C2=A0=C2=A06.716235] [drm] add ip block number 2 &lt;ih_v6_0&g=
t;
<br>[ =C2=A0=C2=A0=C2=A06.716593] [drm] add ip block number 3 &lt;psp&gt;
<br>[ =C2=A0=C2=A0=C2=A06.716934] [drm] add ip block number 4 &lt;smu&gt;
<br>[ =C2=A0=C2=A0=C2=A06.717260] [drm] add ip block number 5 &lt;dm&gt;
<br>[ =C2=A0=C2=A0=C2=A06.717261] [drm] add ip block number 6 &lt;gfx_v11_0=
&gt;
<br>[ =C2=A0=C2=A0=C2=A06.717262] [drm] add ip block number 7 &lt;sdma_v6_0=
&gt;
<br>[ =C2=A0=C2=A0=C2=A06.717263] [drm] add ip block number 8 &lt;vcn_v4_0&=
gt;
<br>[ =C2=A0=C2=A0=C2=A06.717263] [drm] add ip block number 9 &lt;jpeg_v4_0=
&gt;
<br>[ =C2=A0=C2=A0=C2=A06.717263] [drm] add ip block number 10 &lt;mes_v11_=
0&gt;
<br>[ =C2=A0=C2=A0=C2=A06.717702] amdgpu 0000:03:00.0: amdgpu: Fetched VBIO=
S from VFCT
<br>[ =C2=A0=C2=A0=C2=A06.726781] amdgpu: ATOM BIOS: 113-BRT115767-001
<br>[ =C2=A0=C2=A0=C2=A06.748170] amdgpu 0000:03:00.0: amdgpu: CP RS64 enab=
le
<br>[ =C2=A0=C2=A0=C2=A06.759147] [drm] VCN(0) encode/decode are enabled in=
 VM mode
<br>[ =C2=A0=C2=A0=C2=A06.771265] amdgpu 0000:03:00.0: [drm:jpeg_v4_0_early=
_init [amdgpu]] JPEG decode is enabled in VM mode
<br>[ =C2=A0=C2=A0=C2=A06.780654] Console: switching to colour dummy device=
 80x25
<br>[ =C2=A0=C2=A0=C2=A06.790951] amdgpu 0000:03:00.0: vgaarb: deactivate v=
ga console
<br>[ =C2=A0=C2=A0=C2=A06.790954] amdgpu 0000:03:00.0: amdgpu: Trusted Memo=
ry Zone (TMZ) feature not supported
<br>[ =C2=A0=C2=A0=C2=A06.791049] [drm] vm size is 262144 GB, 4 levels, blo=
ck size is 9-bit, fragment size is 9-bit
<br>[ =C2=A0=C2=A0=C2=A06.791052] [drm] System can&#39;t access extended co=
nfiguration space,please check!!
<br>[ =C2=A0=C2=A0=C2=A06.791054] amdgpu 0000:03:00.0: amdgpu: VRAM: 8176M =
0x0000008000000000 - 0x00000081FEFFFFFF (8176M used)
<br>[ =C2=A0=C2=A0=C2=A06.791056] amdgpu 0000:03:00.0: amdgpu: GART: 512M 0=
x00007FFF00000000 - 0x00007FFF1FFFFFFF
<br>[ =C2=A0=C2=A0=C2=A06.791062] [drm] Detected VRAM RAM=3D8176M, BAR=3D81=
92M
<br>[ =C2=A0=C2=A0=C2=A06.791063] [drm] RAM width 128bits GDDR6
<br>[ =C2=A0=C2=A0=C2=A06.791144] [drm] amdgpu: 8176M of VRAM memory ready
<br>[ =C2=A0=C2=A0=C2=A06.791147] [drm] amdgpu: 31986M of GTT memory ready.
<br>[ =C2=A0=C2=A0=C2=A06.791160] [drm] GART: num cpu pages 131072, num gpu=
 pages 131072
<br>[ =C2=A0=C2=A0=C2=A06.791217] [drm] PCIE GART of 512M enabled (table at=
 0x00000081FEB00000).
<br>[ =C2=A0=C2=A0=C2=A06.791437] [drm] Loading DMUB firmware via PSP: vers=
ion=3D0x07002800
<br>[ =C2=A0=C2=A0=C2=A06.791537] [drm] Found VCN firmware Version ENC: 1.1=
9 DEC: 7 VEP: 0 Revision: 0
<br>[ =C2=A0=C2=A0=C2=A06.791541] amdgpu 0000:03:00.0: amdgpu: Will use PSP=
 to load VCN firmware
<br>[ =C2=A0=C2=A0=C2=A06.811637] usb 1-1.3.1: new full-speed USB device nu=
mber 6 using xhci_hcd
<br>[ =C2=A0=C2=A0=C2=A06.848150] amdgpu 0000:03:00.0: amdgpu: reserve 0x13=
00000 from 0x81fc000000 for PSP TMR
<br>[ =C2=A0=C2=A0=C2=A06.942454] amdgpu 0000:03:00.0: amdgpu: RAS: optiona=
l ras ta ucode is not available
<br>[ =C2=A0=C2=A0=C2=A06.949944] amdgpu 0000:03:00.0: amdgpu: RAP: optiona=
l rap ta ucode is not available
<br>[ =C2=A0=C2=A0=C2=A06.949947] amdgpu 0000:03:00.0: amdgpu: SECUREDISPLA=
Y: securedisplay ta ucode is not available
<br>[ =C2=A0=C2=A0=C2=A06.949975] amdgpu 0000:03:00.0: amdgpu: smu driver i=
f version =3D 0x00000035, smu fw if version =3D 0x00000040, smu
<br> fw program =3D 0, smu fw version =3D 0x00525800 (82.88.0)
<br>[ =C2=A0=C2=A0=C2=A06.949977] amdgpu 0000:03:00.0: amdgpu: SMU driver i=
f version not matched
<br>[ =C2=A0=C2=A0=C2=A06.996477] amdgpu 0000:03:00.0: amdgpu: SMU is initi=
alized successfully!
<br>[ =C2=A0=C2=A0=C2=A06.996633] amdgpu 0000:03:00.0: [drm] Unsupported pw=
rseq engine id: 4!
<br>[ =C2=A0=C2=A0=C2=A06.996646] ------------[ cut here ]------------
<br>[ =C2=A0=C2=A0=C2=A06.996646] WARNING: CPU: 1 PID: 568 at drivers/gpu/d=
rm/amd/amdgpu/../display/dc/dcn31/dcn31_panel_cntl.c:172 dc
<br>n31_panel_cntl_construct.cold+0x1c/0x28 [amdgpu]
<br>[ =C2=A0=C2=A0=C2=A06.996930] Modules linked in: amdgpu(+) typec_displa=
yport video amdxcp i2c_algo_bit drm_ttm_helper ttm crct10di
<br>f_pclmul drm_exec crc32_pclmul gpu_sched crc32c_intel nvme drm_suballoc=
_helper rtsx_pci_sdmmc polyval_clmulni drm_b
<br>uddy polyval_generic mmc_core nvme_core drm_display_helper r8169 ghash_=
clmulni_intel sha512_ssse3 ucsi_acpi hid_mul
<br>titouch ccp typec_ucsi sha256_ssse3 rtsx_pci sha1_ssse3 cec realtek sp5=
100_tco typec nvme_auth i2c_hid_acpi wmi i2c
<br>_hid serio_raw scsi_dh_rdac scsi_dh_emc scsi_dh_alua ip6_tables ip_tabl=
es fuse i2c_dev
<br>[ =C2=A0=C2=A0=C2=A06.996952] CPU: 1 PID: 568 Comm: (udev-worker) Not t=
ainted 6.9.0-RX7600XT #1
<br>[ =C2=A0=C2=A0=C2=A06.996954] Hardware name: Alienware Alienware m18 R1=
 AMD/0XY1HF, BIOS 1.13.1 04/23/2024
<br>[ =C2=A0=C2=A0=C2=A06.996955] RIP: 0010:dcn31_panel_cntl_construct.cold=
+0x1c/0x28 [amdgpu]
<br>[ =C2=A0=C2=A0=C2=A06.997120] Code: b0 e4 25 c1 e8 0d 6b 33 ec e9 49 9b=
 f5 ff 48 8b 40 10 48 8b 38 48 85 ff 74 04 48 8b 7f 08 48 c
<br>7 c6 00 e5 25 c1 e8 ec 6a 33 ec &lt;0f&gt; 0b ba 0f 00 00 00 e9 01 a0 f=
5 ff 48 8b 43 08 48 8b 40 10 48 8b
<br>[ =C2=A0=C2=A0=C2=A06.997122] RSP: 0018:ffffbc628082b370 EFLAGS: 000102=
46
<br>[ =C2=A0=C2=A0=C2=A06.997124] RAX: 0000000000000000 RBX: ffff9ac24e58a1=
00 RCX: 0000000000000000
<br>[ =C2=A0=C2=A0=C2=A06.997125] RDX: 0000000000000000 RSI: ffff9ad13d2a18=
c0 RDI: ffff9ad13d2a18c0
<br>[ =C2=A0=C2=A0=C2=A06.997126] RBP: ffffbc628082b3a8 R08: 00000000000000=
00 R09: ffffbc628082b0e0
<br>[ =C2=A0=C2=A0=C2=A06.997127] R10: ffffffffae53e8c8 R11: 00000000000000=
03 R12: ffff9ac27e658400
<br>[ =C2=A0=C2=A0=C2=A06.997127] R13: ffffffffc1101900 R14: ffff9ac286ae30=
00 R15: 0000000000000000
<br>[ =C2=A0=C2=A0=C2=A06.997129] FS: =C2=A000007f9e00232980(0000) GS:ffff9=
ad13d280000(0000) knlGS:0000000000000000
<br>[ =C2=A0=C2=A0=C2=A06.997130] CS: =C2=A00010 DS: 0000 ES: 0000 CR0: 000=
0000080050033
<br>[ =C2=A0=C2=A0=C2=A06.997131] CR2: 000055e6dd025298 CR3: 00000001111c60=
00 CR4: 0000000000f50ef0
<br>[ =C2=A0=C2=A0=C2=A06.997132] PKRU: 55555554
<br>[ =C2=A0=C2=A0=C2=A06.997133] Call Trace:
<br>[ =C2=A0=C2=A0=C2=A06.997134] =C2=A0&lt;TASK&gt;
<br>[ =C2=A0=C2=A0=C2=A06.997135] =C2=A0? dcn31_panel_cntl_construct.cold+0=
x1c/0x28 [amdgpu]
<br>[ =C2=A0=C2=A0=C2=A06.997284] =C2=A0? __warn.cold+0x8e/0xe8
<br>[ =C2=A0=C2=A0=C2=A06.997287] =C2=A0? dcn31_panel_cntl_construct.cold+0=
x1c/0x28 [amdgpu]
<br>[ =C2=A0=C2=A0=C2=A06.997429] =C2=A0? report_bug+0xff/0x140
<br>[ =C2=A0=C2=A0=C2=A06.997431] =C2=A0? handle_bug+0x3c/0x80
<br>[ =C2=A0=C2=A0=C2=A06.997433] =C2=A0? exc_invalid_op+0x17/0x70
<br>[ =C2=A0=C2=A0=C2=A06.997434] =C2=A0? asm_exc_invalid_op+0x1a/0x20
<br>[ =C2=A0=C2=A0=C2=A06.997437] =C2=A0? dcn31_panel_cntl_construct.cold+0=
x1c/0x28 [amdgpu]
<br>[ =C2=A0=C2=A0=C2=A06.997600] =C2=A0dcn32_panel_cntl_create+0x37/0x50 [=
amdgpu]
<br>[ =C2=A0=C2=A0=C2=A06.997806] =C2=A0construct_phy+0x8ef/0xbb0 [amdgpu]
<br>[ =C2=A0=C2=A0=C2=A06.998001] =C2=A0link_create+0x1ba/0x200 [amdgpu]
<br>[ =C2=A0=C2=A0=C2=A06.998177] =C2=A0create_links+0x13b/0x430 [amdgpu]
<br>[ =C2=A0=C2=A0=C2=A06.998348] =C2=A0dc_create+0x316/0x650 [amdgpu]
<br>[ =C2=A0=C2=A0=C2=A06.998509] =C2=A0amdgpu_dm_init.isra.0+0x32b/0x1da0 =
[amdgpu]
<br>[ =C2=A0=C2=A0=C2=A06.998694] =C2=A0? vprintk_emit+0x176/0x2a0
<br>[ =C2=A0=C2=A0=C2=A06.998696] =C2=A0? asm_sysvec_apic_timer_interrupt+0=
x1a/0x20
<br>[ =C2=A0=C2=A0=C2=A06.998699] =C2=A0dm_hw_init+0x12/0x30 [amdgpu]
<br>[ =C2=A0=C2=A0=C2=A06.998865] =C2=A0amdgpu_device_init.cold+0x1ad4/0x20=
f0 [amdgpu]
<br>[ =C2=A0=C2=A0=C2=A06.999044] =C2=A0amdgpu_driver_load_kms+0x19/0x110 [=
amdgpu]
<br>[ =C2=A0=C2=A0=C2=A06.999173] =C2=A0amdgpu_pci_probe+0x187/0x400 [amdgp=
u]
<br>[ =C2=A0=C2=A0=C2=A06.999297] =C2=A0local_pci_probe+0x42/0x90
<br>[ =C2=A0=C2=A0=C2=A06.999299] =C2=A0pci_device_probe+0xc1/0x280
<br>[ =C2=A0=C2=A0=C2=A06.999301] =C2=A0really_probe+0xdb/0x340
<br>[ =C2=A0=C2=A0=C2=A06.999303] =C2=A0? pm_runtime_barrier+0x54/0x90
<br>[ =C2=A0=C2=A0=C2=A06.999305] =C2=A0? __pfx___driver_attach+0x10/0x10
<br>[ =C2=A0=C2=A0=C2=A06.999306] =C2=A0__driver_probe_device+0x78/0x110
<br>[ =C2=A0=C2=A0=C2=A06.999308] =C2=A0driver_probe_device+0x1f/0xa0
<br>[ =C2=A0=C2=A0=C2=A06.999309] =C2=A0__driver_attach+0xba/0x1c0
<br>[ =C2=A0=C2=A0=C2=A06.999310] =C2=A0bus_for_each_dev+0x8c/0xe0
<br>[ =C2=A0=C2=A0=C2=A06.999312] =C2=A0bus_add_driver+0x116/0x1f0
<br>[ =C2=A0=C2=A0=C2=A06.999314] =C2=A0driver_register+0x72/0xd0
<br>[ =C2=A0=C2=A0=C2=A06.999316] =C2=A0? __pfx_amdgpu_init+0x10/0x10 [amdg=
pu]
<br>[ =C2=A0=C2=A0=C2=A06.999438] =C2=A0do_one_initcall+0x58/0x2f0
<br>[ =C2=A0=C2=A0=C2=A06.999441] =C2=A0do_init_module+0x60/0x220
<br>[ =C2=A0=C2=A0=C2=A06.999442] =C2=A0init_module_from_file+0x86/0xc0
<br>[ =C2=A0=C2=A0=C2=A06.999444] =C2=A0idempotent_init_module+0x121/0x2b0
<br>[ =C2=A0=C2=A0=C2=A06.999445] =C2=A0__x64_sys_finit_module+0x5e/0xb0
<br>[ =C2=A0=C2=A0=C2=A06.999446] =C2=A0do_syscall_64+0x82/0x170
<br>[ =C2=A0=C2=A0=C2=A06.999448] =C2=A0? syscall_exit_to_user_mode+0x75/0x=
230
<br>[ =C2=A0=C2=A0=C2=A06.999449] =C2=A0? do_syscall_64+0x8f/0x170
<br>[ =C2=A0=C2=A0=C2=A06.999450] =C2=A0? do_syscall_64+0x8f/0x170
<br>[ =C2=A0=C2=A0=C2=A06.999451] =C2=A0? __irq_exit_rcu+0x4b/0xc0
<br>[ =C2=A0=C2=A0=C2=A06.999453] =C2=A0entry_SYSCALL_64_after_hwframe+0x76=
/0x7e
<br>[ =C2=A0=C2=A0=C2=A06.999454] RIP: 0033:0x7f9e00c0218d
<br>[ =C2=A0=C2=A0=C2=A06.999464] Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00=
 90 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c
<br>2 4d 89 c8 4c 8b 4c 24 08 0f 05 &lt;48&gt; 3d 01 f0 ff ff 73 01 c3 48 8=
b 0d 5b cc 0c 00 f7 d8 64 89 01 48
<br>[ =C2=A0=C2=A0=C2=A06.999466] RSP: 002b:00007ffe4d977b98 EFLAGS: 000002=
46 ORIG_RAX: 0000000000000139
<br>[ =C2=A0=C2=A0=C2=A06.999467] RAX: ffffffffffffffda RBX: 000055e6dd0127=
50 RCX: 00007f9e00c0218d
<br>[ =C2=A0=C2=A0=C2=A06.999468] RDX: 0000000000000000 RSI: 00007f9e00d1d0=
7d RDI: 000000000000002f
<br>[ =C2=A0=C2=A0=C2=A06.999469] RBP: 00007ffe4d977c50 R08: 00000000000000=
01 R09: 00007ffe4d977be0
<br>[ =C2=A0=C2=A0=C2=A06.999470] R10: 0000000000000050 R11: 00000000000002=
46 R12: 00007f9e00d1d07d
<br>[ =C2=A0=C2=A0=C2=A06.999471] R13: 0000000000020000 R14: 000055e6dd00e1=
e0 R15: 000055e6dd025810
<br>[ =C2=A0=C2=A0=C2=A06.999472] =C2=A0&lt;/TASK&gt;
<br>[ =C2=A0=C2=A0=C2=A06.999473] ---[ end trace 0000000000000000 ]---
<br>[ =C2=A0=C2=A0=C2=A06.999901] [drm] Display Core v3.2.273 initialized o=
n DCN 3.2.1
<br>[ =C2=A0=C2=A0=C2=A06.999905] [drm] DP-HDMI FRL PCON supported
<br>[ =C2=A0=C2=A0=C2=A07.001573] [drm] DMUB hardware initialized: version=
=3D0x07002800
<br>[ =C2=A0=C2=A0=C2=A07.041261] usb 1-1.3.1: New USB device found, idVend=
or=3D04d9, idProduct=3Da1dd, bcdDevice=3D 2.01
<br>[ =C2=A0=C2=A0=C2=A07.041266] usb 1-1.3.1: New USB device strings: Mfr=
=3D1, Product=3D2, SerialNumber=3D0
<br>[ =C2=A0=C2=A0=C2=A07.041267] usb 1-1.3.1: Product: USB-HID Keyboard
<br>[ =C2=A0=C2=A0=C2=A07.041269] usb 1-1.3.1: Manufacturer: HOLTEK
<br>[ =C2=A0=C2=A0=C2=A07.088412] input: HOLTEK USB-HID Keyboard as /device=
s/pci0000:00/0000:00:02.1/0000:06:00.0/0000:07:02.0/0000:08
<br>:00.0/usb1/1-1/1-1.3/1-1.3.1/1-1.3.1:1.0/0003:04D9:A1DD.0005/input/inpu=
t13
<br>[ =C2=A0=C2=A0=C2=A07.106523] usb 2-1.4.1: new SuperSpeed USB device nu=
mber 5 using xhci_hcd
<br>[ =C2=A0=C2=A0=C2=A07.121414] usb 2-1.4.1: New USB device found, idVend=
or=3D17e9, idProduct=3D6013, bcdDevice=3D30.09
<br>[ =C2=A0=C2=A0=C2=A07.121421] usb 2-1.4.1: New USB device strings: Mfr=
=3D1, Product=3D2, SerialNumber=3D3
<br>[ =C2=A0=C2=A0=C2=A07.121422] usb 2-1.4.1: Product: Dell Universal Hybr=
id Video Dock
<br>[ =C2=A0=C2=A0=C2=A07.121424] usb 2-1.4.1: Manufacturer: DisplayLink
<br>[ =C2=A0=C2=A0=C2=A07.121424] usb 2-1.4.1: SerialNumber: 2207120766
<br>[ =C2=A0=C2=A0=C2=A07.139725] hid-generic 0003:04D9:A1DD.0005: input,hi=
draw4: USB HID v1.11 Keyboard [HOLTEK USB-HID Keyboard] on =C2=A0<br>usb-00=
00:08:00.0-1.3.1/input0
<br>[ =C2=A0=C2=A0=C2=A07.151798] input: HOLTEK USB-HID Keyboard Mouse as /=
devices/pci0000:00/0000:00:02.1/0000:06:00.0/0000:07:02.0/0
<br>000:08:00.0/usb1/1-1/1-1.3/1-1.3.1/1-1.3.1:1.2/0003:04D9:A1DD.0006/inpu=
t/input14
<br>[ =C2=A0=C2=A0=C2=A07.151839] input: HOLTEK USB-HID Keyboard System Con=
trol as /devices/pci0000:00/0000:00:02.1/0000:06:00.0/0000:
<br>07:02.0/0000:08:00.0/usb1/1-1/1-1.3/1-1.3.1/1-1.3.1:1.2/0003:04D9:A1DD.=
0006/input/input15
<br>[ =C2=A0=C2=A0=C2=A07.182468] [drm] PSR support 1, DC PSR ver 0, sink P=
SR ver 1 DPCD caps 0x2a su_y_granularity 0
<br>[ =C2=A0=C2=A0=C2=A07.183636] usb 1-1.5: new high-speed USB device numb=
er 7 using xhci_hcd
<br>[ =C2=A0=C2=A0=C2=A07.203702] input: HOLTEK USB-HID Keyboard Consumer C=
ontrol as /devices/pci0000:00/0000:00:02.1/0000:06:00.0/000
<br>0:07:02.0/0000:08:00.0/usb1/1-1/1-1.3/1-1.3.1/1-1.3.1:1.2/0003:04D9:A1D=
D.0006/input/input16
<br>[ =C2=A0=C2=A0=C2=A07.203733] input: HOLTEK USB-HID Keyboard as /device=
s/pci0000:00/0000:00:02.1/0000:06:00.0/0000:07:02.0/0000:08
<br>:00.0/usb1/1-1/1-1.3/1-1.3.1/1-1.3.1:1.2/0003:04D9:A1DD.0006/input/inpu=
t17
<br>[ =C2=A0=C2=A0=C2=A07.203758] input: HOLTEK USB-HID Keyboard as /device=
s/pci0000:00/0000:00:02.1/0000:06:00.0/0000:07:02.0/0000:08
<br>:00.0/usb1/1-1/1-1.3/1-1.3.1/1-1.3.1:1.2/0003:04D9:A1DD.0006/input/inpu=
t18
<br>[ =C2=A0=C2=A0=C2=A07.203800] hid-generic 0003:04D9:A1DD.0006: input,hi=
ddev98,hidraw5: USB HID v1.11 Mouse [HOLTEK USB-HID Keyboar
<br>d] on usb-0000:08:00.0-1.3.1/input2
<br>[ =C2=A0=C2=A0=C2=A07.204424] hid-generic 0003:04D9:A1DD.0007: hiddev99=
,hidraw6: USB HID v1.11 Device [HOLTEK USB-HID Keyboard] on
<br> usb-0000:08:00.0-1.3.1/input3
<br>[ =C2=A0=C2=A0=C2=A07.205034] hid-generic 0003:04D9:A1DD.0008: hiddev10=
0,hidraw7: USB HID v1.11 Device [HOLTEK USB-HID Keyboard] o
<br>n usb-0000:08:00.0-1.3.1/input1
<br>[ =C2=A0=C2=A0=C2=A07.262648] usb 1-1.5: New USB device found, idVendor=
=3D2109, idProduct=3D8884, bcdDevice=3D 0.01
<br>[ =C2=A0=C2=A0=C2=A07.262653] usb 1-1.5: New USB device strings: Mfr=3D=
1, Product=3D2, SerialNumber=3D3
<br>[ =C2=A0=C2=A0=C2=A07.262655] usb 1-1.5: Product: USB Billboard Device =
=C2=A0=C2=A0=C2=A0<br>[ =C2=A0=C2=A0=C2=A07.262656] usb 1-1.5: Manufacturer=
: VIA Labs, Inc. =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<br>=
[ =C2=A0=C2=A0=C2=A07.262657] usb 1-1.5: SerialNumber: 0000000000000001
<br>[ =C2=A0=C2=A0=C2=A07.368230] [drm] kiq ring mec 3 pipe 1 q 0
<br>[ =C2=A0=C2=A0=C2=A07.373668] [drm] VCN decode and encode initialized s=
uccessfully(under DPG Mode).
<br>[ =C2=A0=C2=A0=C2=A07.374432] amdgpu 0000:03:00.0: [drm:jpeg_v4_0_hw_in=
it [amdgpu]] JPEG decode initialized successfully.
<br>[ =C2=A0=C2=A0=C2=A07.392165] amdgpu: HMM registered 8176MB device memo=
ry
<br>[ =C2=A0=C2=A0=C2=A07.393001] kfd kfd: amdgpu: Allocated 3969056 bytes =
on gart
<br>[ =C2=A0=C2=A0=C2=A07.393015] kfd kfd: amdgpu: Total number of KFD node=
s to be created: 1
<br>[ =C2=A0=C2=A0=C2=A07.393032] amdgpu: Virtual CRAT table created for GP=
U
<br>[ =C2=A0=C2=A0=C2=A07.393083] amdgpu: Topology: Add dGPU node [0x7480:0=
x1002]
<br>[ =C2=A0=C2=A0=C2=A07.393085] kfd kfd: amdgpu: added device 1002:7480
<br>[ =C2=A0=C2=A0=C2=A07.393096] amdgpu 0000:03:00.0: amdgpu: SE 2, SH per=
 SE 2, CU per SH 8, active_cu_number 32
<br>[ =C2=A0=C2=A0=C2=A07.393099] amdgpu 0000:03:00.0: amdgpu: ring gfx_0.0=
.0 uses VM inv eng 0 on hub 0
<br>[ =C2=A0=C2=A0=C2=A07.393101] amdgpu 0000:03:00.0: amdgpu: ring comp_1.=
0.0 uses VM inv eng 1 on hub 0
<br>[ =C2=A0=C2=A0=C2=A07.393102] amdgpu 0000:03:00.0: amdgpu: ring comp_1.=
1.0 uses VM inv eng 4 on hub 0
<br>[ =C2=A0=C2=A0=C2=A07.393103] amdgpu 0000:03:00.0: amdgpu: ring comp_1.=
2.0 uses VM inv eng 6 on hub 0
<br>[ =C2=A0=C2=A0=C2=A07.393104] amdgpu 0000:03:00.0: amdgpu: ring comp_1.=
3.0 uses VM inv eng 7 on hub 0
<br>[ =C2=A0=C2=A0=C2=A07.393105] amdgpu 0000:03:00.0: amdgpu: ring comp_1.=
0.1 uses VM inv eng 8 on hub 0
<br>[ =C2=A0=C2=A0=C2=A07.393106] amdgpu 0000:03:00.0: amdgpu: ring comp_1.=
1.1 uses VM inv eng 9 on hub 0
<br>[ =C2=A0=C2=A0=C2=A07.393107] amdgpu 0000:03:00.0: amdgpu: ring comp_1.=
2.1 uses VM inv eng 10 on hub 0
<br>[ =C2=A0=C2=A0=C2=A07.393109] amdgpu 0000:03:00.0: amdgpu: ring comp_1.=
3.1 uses VM inv eng 11 on hub 0
<br>[ =C2=A0=C2=A0=C2=A07.393110] amdgpu 0000:03:00.0: amdgpu: ring sdma0 u=
ses VM inv eng 12 on hub 0
<br>[ =C2=A0=C2=A0=C2=A07.393111] amdgpu 0000:03:00.0: amdgpu: ring sdma1 u=
ses VM inv eng 13 on hub 0
<br>[ =C2=A0=C2=A0=C2=A07.393112] amdgpu 0000:03:00.0: amdgpu: ring vcn_uni=
fied_0 uses VM inv eng 0 on hub 8
<br>[ =C2=A0=C2=A0=C2=A07.393113] amdgpu 0000:03:00.0: amdgpu: ring jpeg_de=
c uses VM inv eng 1 on hub 8
<br>[ =C2=A0=C2=A0=C2=A07.393114] amdgpu 0000:03:00.0: amdgpu: ring mes_kiq=
_3.1.0 uses VM inv eng 14 on hub 0
<br>[ =C2=A0=C2=A0=C2=A07.398638] usb 1-1.4.3: new full-speed USB device nu=
mber 8 using xhci_hcd
<br>[ =C2=A0=C2=A0=C2=A07.400071] [drm] ring gfx_32768.1.1 was added
<br>[ =C2=A0=C2=A0=C2=A07.400413] [drm] ring compute_32768.2.2 was added
<br>[ =C2=A0=C2=A0=C2=A07.400692] [drm] ring sdma_32768.3.3 was added
<br>[ =C2=A0=C2=A0=C2=A07.400743] [drm] ring gfx_32768.1.1 ib test pass
<br>[ =C2=A0=C2=A0=C2=A07.400817] [drm] ring compute_32768.2.2 ib test pass
<br>[ =C2=A0=C2=A0=C2=A07.400856] [drm] ring sdma_32768.3.3 ib test pass
<br>[ =C2=A0=C2=A0=C2=A07.402200] amdgpu 0000:03:00.0: amdgpu: Using BOCO f=
or runtime pm
<br>[ =C2=A0=C2=A0=C2=A07.402513] [drm] Initialized amdgpu 3.57.0 20150101 =
for 0000:03:00.0 on minor 1
<br>[ =C2=A0=C2=A0=C2=A07.414495] fbcon: amdgpudrmfb (fb0) is primary devic=
e
<br>[ =C2=A0=C2=A0=C2=A07.415011] [drm] DSC precompute is not needed.
<br>[ =C2=A0=C2=A0=C2=A07.694009] usb 1-1.3.5: new high-speed USB device nu=
mber 9 using xhci_hcd
<br>[ =C2=A0=C2=A0=C2=A07.712524] usb 1-1.4.3: New USB device found, idVend=
or=3D413c, idProduct=3Db06e, bcdDevice=3Dd0.34
<br>[ =C2=A0=C2=A0=C2=A07.712531] usb 1-1.4.3: New USB device strings: Mfr=
=3D1, Product=3D2, SerialNumber=3D6
<br>[ =C2=A0=C2=A0=C2=A07.712532] usb 1-1.4.3: Product: Fischer Cos-2 Contr=
oller
<br>[ =C2=A0=C2=A0=C2=A07.712533] usb 1-1.4.3: Manufacturer: BizLink
<br>[ =C2=A0=C2=A0=C2=A07.712534] usb 1-1.4.3: SerialNumber: VMM_6.05.000
<br>[ =C2=A0=C2=A0=C2=A07.751234] hid-generic 0003:413C:B06E.0009: hiddev10=
1,hidraw8: USB HID v1.11 Device [BizLink Fischer Cos-2 Cont
<br>roller] on usb-0000:08:00.0-1.4.3/input0
<br>[ =C2=A0=C2=A0=C2=A07.751581] hid-generic 0003:413C:B06E.000A: hiddev10=
2,hidraw9: USB HID v1.11 Device [BizLink Fischer Cos-2 Cont
<br>roller] on usb-0000:08:00.0-1.4.3/input1
<br>[ =C2=A0=C2=A0=C2=A07.794365] usb 1-1.3.5: New USB device found, idVend=
or=3D2109, idProduct=3D8822, bcdDevice=3D 0.01
<br>[ =C2=A0=C2=A0=C2=A07.794370] usb 1-1.3.5: New USB device strings: Mfr=
=3D1, Product=3D2, SerialNumber=3D3
<br>[ =C2=A0=C2=A0=C2=A07.794371] usb 1-1.3.5: Product: USB Billboard Devic=
e =C2=A0=C2=A0=C2=A0<br>[ =C2=A0=C2=A0=C2=A07.794372] usb 1-1.3.5: Manufact=
urer: VIA Labs, Inc. =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
<br>[ =C2=A0=C2=A0=C2=A07.794372] usb 1-1.3.5: SerialNumber: 00000000000000=
01
<br>[ =C2=A0=C2=A0=C2=A07.858055] usb 1-1.4.5: new high-speed USB device nu=
mber 10 using xhci_hcd
<br>[ =C2=A0=C2=A0=C2=A07.939203] usb 1-1.4.5: New USB device found, idVend=
or=3D2109, idProduct=3D8817, bcdDevice=3D 0.01
<br>[ =C2=A0=C2=A0=C2=A07.939210] usb 1-1.4.5: New USB device strings: Mfr=
=3D1, Product=3D2, SerialNumber=3D3
<br>[ =C2=A0=C2=A0=C2=A07.939212] usb 1-1.4.5: Product: USB Billboard Devic=
e =C2=A0=C2=A0=C2=A0<br>[ =C2=A0=C2=A0=C2=A07.939213] usb 1-1.4.5: Manufact=
urer: VIA Labs, Inc. =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
<br>[ =C2=A0=C2=A0=C2=A07.939213] usb 1-1.4.5: SerialNumber: 00000000000000=
01
<br>[ =C2=A0=C2=A0=C2=A08.329474] Console: switching to colour frame buffer=
 device 240x67
<br>[ =C2=A0=C2=A0=C2=A08.347314] amdgpu 0000:03:00.0: [drm] fb0: amdgpudrm=
fb frame buffer device
<br>[ =C2=A0=C2=A0=C2=A08.458935] EXT4-fs (nvme1n1p3): orphan cleanup on re=
adonly fs
<br>[ =C2=A0=C2=A0=C2=A08.459683] EXT4-fs (nvme1n1p3): mounted filesystem a=
c66d86f-a430-4aef-8f35-53cc5f761de5 ro with ordered data mo
<br>de. Quota mode: none.
<br>[ =C2=A0=C2=A0=C2=A08.611316] systemd-journald[417]: Received SIGTERM f=
rom PID 1 (systemd).
<br>[ =C2=A0=C2=A0=C2=A08.657579] systemd[1]: RTC configured in localtime, =
applying delta of -420 minutes to system time.
<br>[ =C2=A0=C2=A0=C2=A08.660964] systemd[1]: systemd 255.6-1.fc40 running =
in system mode (+PAM +AUDIT +SELINUX -APPARMOR +IMA +SMACK =C2=A0<br>+SECCO=
MP -GCRYPT +GNUTLS +OPENSSL +ACL +BLKID +CURL +ELFUTILS +FIDO2 +IDN2 -IDN -=
IPTC +KMOD +LIBCRYPTSETUP +LIBFDIS
<br>K +PCRE2 +PWQUALITY +P11KIT +QRENCODE +TPM2 +BZIP2 +LZ4 +XZ +ZLIB +ZSTD=
 +BPF_FRAMEWORK +XKBCOMMON +UTMP +SYSVINIT d
<br>efault-hierarchy=3Dunified)
<br>[ =C2=A0=C2=A0=C2=A08.661466] systemd[1]: Detected architecture x86-64.
<br>[ =C2=A0=C2=A0=C2=A09.091700] systemd[1]: bpf-lsm: LSM BPF program atta=
ched
<br>[ =C2=A0=C2=A0=C2=A09.160496] zram: Added device: zram0
<br>[ =C2=A0=C2=A0=C2=A09.279648] systemd[1]: initrd-switch-root.service: D=
eactivated successfully.
<br>[ =C2=A0=C2=A0=C2=A09.280193] systemd[1]: Stopped initrd-switch-root.se=
rvice - Switch Root.
<br>[ =C2=A0=C2=A0=C2=A09.280897] systemd[1]: systemd-journald.service: Sch=
eduled restart job, restart counter is at 1.
<br>[ =C2=A0=C2=A0=C2=A09.281039] systemd[1]: Created slice machine.slice -=
 Virtual Machine and Container Slice.
<br>[ =C2=A0=C2=A0=C2=A09.282469] systemd[1]: Created slice system-getty.sl=
ice - Slice /system/getty.
<br>[ =C2=A0=C2=A0=C2=A09.282917] systemd[1]: Created slice system-sshd\x2d=
keygen.slice - Slice /system/sshd-keygen.
<br>[ =C2=A0=C2=A0=C2=A09.283367] systemd[1]: Created slice system-systemd\=
x2dfsck.slice - Slice /system/systemd-fsck.
<br>[ =C2=A0=C2=A0=C2=A09.283824] systemd[1]: Created slice system-systemd\=
x2dzram\x2dsetup.slice - Slice /system/systemd-zram-setup.
<br>[ =C2=A0=C2=A0=C2=A09.284214] systemd[1]: Created slice user.slice - Us=
er and Session Slice.
<br>[ =C2=A0=C2=A0=C2=A09.284605] systemd[1]: systemd-ask-password-console.=
path - Dispatch Password Requests to Console Directory Watc
<br>h was skipped because of an unmet condition check (ConditionPathExists=
=3D!/run/plymouth/pid).
<br>[ =C2=A0=C2=A0=C2=A09.284628] systemd[1]: Started systemd-ask-password-=
wall.path - Forward Password Requests to Wall Directory Wat
<br>ch.
<br>[ =C2=A0=C2=A0=C2=A09.285414] systemd[1]: Set up automount proc-sys-fs-=
binfmt_misc.automount - Arbitrary Executable File Formats F
<br>ile System Automount Point.
<br>[ =C2=A0=C2=A0=C2=A09.285877] systemd[1]: Expecting device dev-disk-by\=
x2duuid-9BB2\x2dA2C4.device - /dev/disk/by-uuid/9BB2-A2C4..
<br>.
<br>[ =C2=A0=C2=A0=C2=A09.286402] systemd[1]: Expecting device dev-disk-by\=
x2duuid-fcb3c64a\x2d465d\x2d4cb4\x2d8aed\<a href=3D"http://x2d9053ab657adf.=
de">x2d9053ab657adf.de</a>
<br>vice - /dev/disk/by-uuid/fcb3c64a-465d-4cb4-8aed-9053ab657adf...
<br>[ =C2=A0=C2=A0=C2=A09.286949] systemd[1]: Expecting device dev-zram0.de=
vice - /dev/zram0...
<br>[ =C2=A0=C2=A0=C2=A09.287230] systemd[1]: Reached target cryptsetup.tar=
get - Local Encrypted Volumes.
<br>[ =C2=A0=C2=A0=C2=A09.287785] systemd[1]: Stopped target initrd-switch-=
root.target - Switch Root.
<br>[ =C2=A0=C2=A0=C2=A09.288344] systemd[1]: Stopped target initrd-fs.targ=
et - Initrd File Systems.
<br>[ =C2=A0=C2=A0=C2=A09.288912] systemd[1]: Stopped target initrd-root-fs=
.target - Initrd Root File System.
<br>[ =C2=A0=C2=A0=C2=A09.289195] systemd[1]: Reached target integritysetup=
.target - Local Integrity Protected Volumes.
<br>[ =C2=A0=C2=A0=C2=A09.289778] systemd[1]: Reached target slices.target =
- Slice Units.
<br>[ =C2=A0=C2=A0=C2=A09.290341] systemd[1]: Reached target veritysetup.ta=
rget - Local Verity Protected Volumes.
<br>[ =C2=A0=C2=A0=C2=A09.290936] systemd[1]: Listening on dm-event.socket =
- Device-mapper event daemon FIFOs.
<br>[ =C2=A0=C2=A0=C2=A09.291526] systemd[1]: Listening on lvm2-lvmpolld.so=
cket - LVM2 poll daemon socket.
<br>[ =C2=A0=C2=A0=C2=A09.293686] systemd[1]: Listening on systemd-coredump=
.socket - Process Core Dump Socket.
<br>[ =C2=A0=C2=A0=C2=A09.294116] systemd[1]: Listening on systemd-initctl.=
socket - initctl Compatibility Named Pipe.
<br>[ =C2=A0=C2=A0=C2=A09.294755] systemd[1]: Listening on systemd-journald=
-audit.socket - Journal Audit Socket.
<br>[ =C2=A0=C2=A0=C2=A09.295284] systemd[1]: Listening on systemd-oomd.soc=
ket - Userspace Out-Of-Memory (OOM) Killer Socket.
<br>[ =C2=A0=C2=A0=C2=A09.295796] systemd[1]: systemd-pcrextend.socket - TP=
M2 PCR Extension (Varlink) was skipped because of an unmet =C2=A0<br>condit=
ion check (ConditionSecurity=3Dmeasured-uki).
<br>[ =C2=A0=C2=A0=C2=A09.295939] systemd[1]: Listening on systemd-udevd-co=
ntrol.socket - udev Control Socket.
<br>[ =C2=A0=C2=A0=C2=A09.297188] systemd[1]: Listening on systemd-udevd-ke=
rnel.socket - udev Kernel Socket.
<br>[ =C2=A0=C2=A0=C2=A09.297847] systemd[1]: Listening on systemd-userdbd.=
socket - User Database Manager Socket.
<br>[ =C2=A0=C2=A0=C2=A09.321650] systemd[1]: Mounting dev-hugepages.mount =
- Huge Pages File System...
<br>[ =C2=A0=C2=A0=C2=A09.322189] systemd[1]: Mounting dev-mqueue.mount - P=
OSIX Message Queue File System...
<br>[ =C2=A0=C2=A0=C2=A09.322744] systemd[1]: Mounting sys-kernel-debug.mou=
nt - Kernel Debug File System...
<br>[ =C2=A0=C2=A0=C2=A09.323350] systemd[1]: Mounting sys-kernel-tracing.m=
ount - Kernel Trace File System...
<br>[ =C2=A0=C2=A0=C2=A09.323853] systemd[1]: auth-rpcgss-module.service - =
Kernel Module supporting RPCSEC_GSS was skipped because of =C2=A0<br>an unm=
et condition check (ConditionPathExists=3D/etc/krb5.keytab).
<br>[ =C2=A0=C2=A0=C2=A09.324090] systemd[1]: iscsi-starter.service was ski=
pped because of an unmet condition check (ConditionDirector
<br>yNotEmpty=3D/var/lib/iscsi/nodes).
<br>[ =C2=A0=C2=A0=C2=A09.325356] systemd[1]: Starting kmod-static-nodes.se=
rvice - Create List of Static Device Nodes...
<br>[ =C2=A0=C2=A0=C2=A09.326237] systemd[1]: Starting lvm2-monitor.service=
 - Monitoring of LVM2 mirrors, snapshots etc. using dmevent
<br>d or progress polling...
<br>[ =C2=A0=C2=A0=C2=A09.327103] systemd[1]: Starting modprobe@configfs.se=
rvice - Load Kernel Module configfs...
<br>[ =C2=A0=C2=A0=C2=A09.327919] systemd[1]: Starting modprobe@dm_mod.serv=
ice - Load Kernel Module dm_mod...
<br>[ =C2=A0=C2=A0=C2=A09.328728] systemd[1]: Starting modprobe@dm_multipat=
h.service - Load Kernel Module dm_multipath...
<br>[ =C2=A0=C2=A0=C2=A09.329514] systemd[1]: Starting modprobe@drm.service=
 - Load Kernel Module drm...
<br>[ =C2=A0=C2=A0=C2=A09.330866] systemd[1]: Starting modprobe@efi_pstore.=
service - Load Kernel Module efi_pstore...
<br>[ =C2=A0=C2=A0=C2=A09.331520] systemd[1]: Starting modprobe@fuse.servic=
e - Load Kernel Module fuse...
<br>[ =C2=A0=C2=A0=C2=A09.332337] systemd[1]: Starting modprobe@loop.servic=
e - Load Kernel Module loop...
<br>[ =C2=A0=C2=A0=C2=A09.332882] systemd[1]: plymouth-switch-root.service:=
 Deactivated successfully.
<br>[ =C2=A0=C2=A0=C2=A09.332899] systemd[1]: Stopped plymouth-switch-root.=
service - Plymouth switch root service.
<br>[ =C2=A0=C2=A0=C2=A09.334469] systemd[1]: Starting systemd-journald.ser=
vice - Journal Service...
<br>[ =C2=A0=C2=A0=C2=A09.335342] systemd[1]: Starting systemd-modules-load=
.service - Load Kernel Modules...
<br>[ =C2=A0=C2=A0=C2=A09.336015] systemd[1]: Starting systemd-network-gene=
rator.service - Generate network units from Kernel command =C2=A0<br>line..=
.
<br>[ =C2=A0=C2=A0=C2=A09.336474] systemd[1]: systemd-pcrmachine.service - =
TPM2 PCR Machine ID Measurement was skipped because of an u
<br>nmet condition check (ConditionSecurity=3Dmeasured-uki).
<br>[ =C2=A0=C2=A0=C2=A09.336677] loop: module loaded
<br>[ =C2=A0=C2=A0=C2=A09.336934] systemd[1]: Starting systemd-remount-fs.s=
ervice - Remount Root and Kernel File Systems...
<br>[ =C2=A0=C2=A0=C2=A09.337602] systemd[1]: systemd-tpm2-setup-early.serv=
ice - TPM2 SRK Setup (Early) was skipped because of an unme
<br>t condition check (ConditionSecurity=3Dmeasured-uki).
<br>[ =C2=A0=C2=A0=C2=A09.337915] systemd[1]: Starting systemd-udev-trigger=
.service - Coldplug All udev Devices...
<br>[ =C2=A0=C2=A0=C2=A09.338943] systemd[1]: Mounted dev-hugepages.mount -=
 Huge Pages File System.
<br>[ =C2=A0=C2=A0=C2=A09.339496] systemd[1]: Mounted dev-mqueue.mount - PO=
SIX Message Queue File System.
<br>[ =C2=A0=C2=A0=C2=A09.340036] systemd[1]: Mounted sys-kernel-debug.moun=
t - Kernel Debug File System.
<br>[ =C2=A0=C2=A0=C2=A09.340565] systemd[1]: Mounted sys-kernel-tracing.mo=
unt - Kernel Trace File System.
<br>[ =C2=A0=C2=A0=C2=A09.341152] systemd[1]: Finished kmod-static-nodes.se=
rvice - Create List of Static Device Nodes.
<br>[ =C2=A0=C2=A0=C2=A09.341689] systemd[1]: modprobe@configfs.service: De=
activated successfully.
<br>[ =C2=A0=C2=A0=C2=A09.341737] systemd[1]: Finished modprobe@configfs.se=
rvice - Load Kernel Module configfs.
<br>[ =C2=A0=C2=A0=C2=A09.342329] systemd-journald[835]: Collecting audit m=
essages is enabled.
<br>[ =C2=A0=C2=A0=C2=A09.342889] systemd[1]: modprobe@dm_mod.service: Deac=
tivated successfully.
<br>[ =C2=A0=C2=A0=C2=A09.342929] systemd[1]: Finished modprobe@dm_mod.serv=
ice - Load Kernel Module dm_mod.
<br>[ =C2=A0=C2=A0=C2=A09.343610] audit: type=3D1130 audit(1715821299.818:2=
): pid=3D1 uid=3D0 auid=3D4294967295 ses=3D4294967295 msg=3D&#39;unit=3Dmod=
pr
<br>obe@dm_mod comm=3D&quot;systemd&quot; exe=3D&quot;/usr/lib/systemd/syst=
emd&quot; hostname=3D? addr=3D? terminal=3D? res=3Dsuccess&#39;
<br>[ =C2=A0=C2=A0=C2=A09.343614] audit: type=3D1131 audit(1715821299.818:3=
): pid=3D1 uid=3D0 auid=3D4294967295 ses=3D4294967295 msg=3D&#39;unit=3Dmod=
pr
<br>obe@dm_mod comm=3D&quot;systemd&quot; exe=3D&quot;/usr/lib/systemd/syst=
emd&quot; hostname=3D? addr=3D? terminal=3D? res=3Dsuccess&#39;
<br>[ =C2=A0=C2=A0=C2=A09.343781] systemd[1]: modprobe@dm_multipath.service=
: Deactivated successfully.
<br>[ =C2=A0=C2=A0=C2=A09.343848] systemd[1]: Finished modprobe@dm_multipat=
h.service - Load Kernel Module dm_multipath.
<br>[ =C2=A0=C2=A0=C2=A09.344923] audit: type=3D1130 audit(1715821299.820:4=
): pid=3D1 uid=3D0 auid=3D4294967295 ses=3D4294967295 msg=3D&#39;unit=3Dmod=
pr
<br>obe@dm_multipath comm=3D&quot;systemd&quot; exe=3D&quot;/usr/lib/system=
d/systemd&quot; hostname=3D? addr=3D? terminal=3D? res=3Dsuccess&#39;
<br>[ =C2=A0=C2=A0=C2=A09.344926] audit: type=3D1131 audit(1715821299.820:5=
): pid=3D1 uid=3D0 auid=3D4294967295 ses=3D4294967295 msg=3D&#39;unit=3Dmod=
pr
<br>obe@dm_multipath comm=3D&quot;systemd&quot; exe=3D&quot;/usr/lib/system=
d/systemd&quot; hostname=3D? addr=3D? terminal=3D? res=3Dsuccess&#39;
<br>[ =C2=A0=C2=A0=C2=A09.344956] systemd[1]: Started systemd-journald.serv=
ice - Journal Service.
<br>[ =C2=A0=C2=A0=C2=A09.345971] audit: type=3D1130 audit(1715821299.821:6=
): pid=3D1 uid=3D0 auid=3D4294967295 ses=3D4294967295 msg=3D&#39;unit=3Dsys=
te
<br>md-journald comm=3D&quot;systemd&quot; exe=3D&quot;/usr/lib/systemd/sys=
temd&quot; hostname=3D? addr=3D? terminal=3D? res=3Dsuccess&#39;
<br>[ =C2=A0=C2=A0=C2=A09.347022] audit: type=3D1130 audit(1715821299.822:7=
): pid=3D1 uid=3D0 auid=3D4294967295 ses=3D4294967295 msg=3D&#39;unit=3Dmod=
pr
<br>obe@drm comm=3D&quot;systemd&quot; exe=3D&quot;/usr/lib/systemd/systemd=
&quot; hostname=3D? addr=3D? terminal=3D? res=3Dsuccess&#39;
<br>[ =C2=A0=C2=A0=C2=A09.347023] audit: type=3D1131 audit(1715821299.822:8=
): pid=3D1 uid=3D0 auid=3D4294967295 ses=3D4294967295 msg=3D&#39;unit=3Dmod=
pr
<br>obe@drm comm=3D&quot;systemd&quot; exe=3D&quot;/usr/lib/systemd/systemd=
&quot; hostname=3D? addr=3D? terminal=3D? res=3Dsuccess&#39;
<br>[ =C2=A0=C2=A0=C2=A09.347996] audit: type=3D1130 audit(1715821299.823:9=
): pid=3D1 uid=3D0 auid=3D4294967295 ses=3D4294967295 msg=3D&#39;unit=3Dmod=
pr
<br>obe@efi_pstore comm=3D&quot;systemd&quot; exe=3D&quot;/usr/lib/systemd/=
systemd&quot; hostname=3D? addr=3D? terminal=3D? res=3Dsuccess&#39;
<br>[ =C2=A0=C2=A0=C2=A09.347997] audit: type=3D1131 audit(1715821299.823:1=
0): pid=3D1 uid=3D0 auid=3D4294967295 ses=3D4294967295 msg=3D&#39;unit=3Dmo=
dp
<br>robe@efi_pstore comm=3D&quot;systemd&quot; exe=3D&quot;/usr/lib/systemd=
/systemd&quot; hostname=3D? addr=3D? terminal=3D? res=3Dsuccess&#39;
<br>[ =C2=A0=C2=A0=C2=A09.349155] audit: type=3D1130 audit(1715821299.824:1=
1): pid=3D1 uid=3D0 auid=3D4294967295 ses=3D4294967295 msg=3D&#39;unit=3Dmo=
dp
<br>robe@fuse comm=3D&quot;systemd&quot; exe=3D&quot;/usr/lib/systemd/syste=
md&quot; hostname=3D? addr=3D? terminal=3D? res=3Dsuccess&#39;
<br>[ =C2=A0=C2=A0=C2=A09.354876] EXT4-fs (nvme1n1p3): re-mounted ac66d86f-=
a430-4aef-8f35-53cc5f761de5 r/w. Quota mode: none.
<br>[ =C2=A0=C2=A0=C2=A09.361692] systemd-journald[835]: Received client re=
quest to flush runtime journal.
<br>[ =C2=A0=C2=A0=C2=A09.375140] systemd-journald[835]: /var/log/journal/2=
14fcfb5b9274988845afbe1b019c79e/system.journal: Realtime cl
<br>ock jumped backwards relative to last journal entry, rotating.
<br>[ =C2=A0=C2=A0=C2=A09.375487] systemd-journald[835]: Rotating system jo=
urnal.
<br>[ =C2=A0=C2=A0=C2=A09.451133] zram0: detected capacity change from 0 to=
 16777216
<br>[ =C2=A0=C2=A0=C2=A09.469048] acpi-tad ACPI000E:00: Missing _PRW
<br>[ =C2=A0=C2=A0=C2=A09.474318] Adding 8388604k swap on /dev/zram0.=C2=A0=
 Priority:100 extents:1 across:8388604k SSDsc
<br>[ =C2=A0=C2=A0=C2=A09.492888] piix4_smbus 0000:00:14.0: SMBus Host Cont=
roller at 0xb00, revision 0
<br>[ =C2=A0=C2=A0=C2=A09.493443] piix4_smbus 0000:00:14.0: Using register =
0x02 for SMBus port selection
<br>[ =C2=A0=C2=A0=C2=A09.494576] piix4_smbus 0000:00:14.0: Auxiliary SMBus=
 Host Controller at 0xb20
<br>[ =C2=A0=C2=A0=C2=A09.508490] mc: Linux media interface: v0.10
<br>[ =C2=A0=C2=A0=C2=A09.509071] input: PC Speaker as /devices/platform/pc=
spkr/input/input19
<br>[ =C2=A0=C2=A0=C2=A09.600483] EXT4-fs (nvme1n1p2): mounted filesystem f=
cb3c64a-465d-4cb4-8aed-9053ab657adf r/w with ordered data m
<br>ode. Quota mode: none.
<br>[ =C2=A0=C2=A0=C2=A09.629362] dcdbas dcdbas: Dell Systems Management Ba=
se Driver (version 5.6.0-3.4)
<br>[ =C2=A0=C2=A0=C2=A09.630478] usbcore: registered new interface driver =
cdc_ether
<br>[ =C2=A0=C2=A0=C2=A09.634317] dell_smbios: Unable to run on non-Dell sy=
stem
<br>[ =C2=A0=C2=A0=C2=A09.637048] RAPL PMU: API unit is 2^-32 Joules, 1 fix=
ed counters, 163840 ms ovfl timer
<br>[ =C2=A0=C2=A0=C2=A09.637446] RAPL PMU: hw unit of domain package 2^-16=
 Joules
<br>[ =C2=A0=C2=A0=C2=A09.651937] Bluetooth: Core ver 2.22
<br>[ =C2=A0=C2=A0=C2=A09.652919] NET: Registered PF_BLUETOOTH protocol fam=
ily
<br>[ =C2=A0=C2=A0=C2=A09.653399] Bluetooth: HCI device and connection mana=
ger initialized
<br>[ =C2=A0=C2=A0=C2=A09.653402] Bluetooth: HCI socket layer initialized
<br>[ =C2=A0=C2=A0=C2=A09.653403] Bluetooth: L2CAP socket layer initialized
<br>[ =C2=A0=C2=A0=C2=A09.653407] Bluetooth: SCO socket layer initialized
<br>[ =C2=A0=C2=A0=C2=A09.656392] videodev: Linux video capture interface: =
v2.00
<br>[ =C2=A0=C2=A0=C2=A09.697105] cfg80211: Loading compiled-in X.509 certi=
ficates for regulatory database
<br>[ =C2=A0=C2=A0=C2=A09.697230] Loaded X.509 cert &#39;sforshee: 00b28ddf=
47aef9cea7&#39;
<br>[ =C2=A0=C2=A0=C2=A09.697307] Loaded X.509 cert &#39;wens: 61c038651aab=
dcf94bd0ac7ff06c7248db18c600&#39;
<br>[ =C2=A0=C2=A0=C2=A09.699673] cdc_ncm 2-1.4.1:1.5: MAC-Address: 0c:37:9=
6:8e:22:a8
<br>[ =C2=A0=C2=A0=C2=A09.699676] cdc_ncm 2-1.4.1:1.5: setting rx_max =3D 1=
6384
<br>[ =C2=A0=C2=A0=C2=A09.699897] cdc_ncm 2-1.4.1:1.5: setting tx_max =3D 1=
6384
<br>[ =C2=A0=C2=A0=C2=A09.699985] cdc_ncm 2-1.4.1:1.5 eth0: register &#39;c=
dc_ncm&#39; at usb-0000:08:00.0-1.4.1, CDC NCM (SEND ZLP), 0c:37:96
<br>:8e:22:a8
<br>[ =C2=A0=C2=A0=C2=A09.700006] usbcore: registered new interface driver =
cdc_ncm
<br>[ =C2=A0=C2=A0=C2=A09.742702] usbcore: registered new interface driver =
cdc_wdm
<br>[ =C2=A0=C2=A0=C2=A09.768748] usbcore: registered new interface driver =
cdc_mbim
<br>[ =C2=A0=C2=A0=C2=A09.771438] cdc_ncm 2-1.4.1:1.5 enp8s0u1u4u1i5: renam=
ed from eth0
<br>[ =C2=A0=C2=A0=C2=A09.777114] Intel(R) Wireless WiFi driver for Linux
<br>[ =C2=A0=C2=A0=C2=A09.777191] usbcore: registered new interface driver =
btusb
<br>[ =C2=A0=C2=A0=C2=A09.779916] Bluetooth: hci0: Device revision is 0
<br>[ =C2=A0=C2=A0=C2=A09.782453] Bluetooth: hci0: Secure boot is enabled
<br>[ =C2=A0=C2=A0=C2=A09.782454] Bluetooth: hci0: OTP lock is enabled
<br>[ =C2=A0=C2=A0=C2=A09.782455] Bluetooth: hci0: API lock is enabled
<br>[ =C2=A0=C2=A0=C2=A09.782455] Bluetooth: hci0: Debug lock is disabled
<br>[ =C2=A0=C2=A0=C2=A09.782455] Bluetooth: hci0: Minimum firmware build 1=
 week 10 2014
<br>[ =C2=A0=C2=A0=C2=A09.782456] Bluetooth: hci0: Bootloader timestamp 201=
9.40 buildtype 1 build 38
<br>[ =C2=A0=C2=A0=C2=A09.782465] Bluetooth: hci0: No dsm support to set re=
set delay
<br>[ =C2=A0=C2=A0=C2=A09.784373] iwlwifi 0000:09:00.0: Detected crf-id 0x4=
00410, cnv-id 0x400410 wfpm id 0x80000000
<br>[ =C2=A0=C2=A0=C2=A09.784519] iwlwifi 0000:09:00.0: PCI dev 2725/0020, =
rev=3D0x420, rfid=3D0x10d000
<br>[ =C2=A0=C2=A0=C2=A09.785125] iwlwifi 0000:09:00.0: Direct firmware loa=
d for iwlwifi-ty-a0-gf-a0-89.ucode failed with error -2
<br>[ =C2=A0=C2=A0=C2=A09.785142] iwlwifi 0000:09:00.0: Direct firmware loa=
d for iwlwifi-ty-a0-gf-a0-88.ucode failed with error -2
<br>[ =C2=A0=C2=A0=C2=A09.785515] iwlwifi 0000:09:00.0: Direct firmware loa=
d for iwlwifi-ty-a0-gf-a0-87.ucode failed with error -2
<br>[ =C2=A0=C2=A0=C2=A09.794890] kvm_amd: TSC scaling supported
<br>[ =C2=A0=C2=A0=C2=A09.795465] kvm_amd: Nested Virtualization enabled
<br>[ =C2=A0=C2=A0=C2=A09.795788] kvm_amd: Nested Paging enabled
<br>[ =C2=A0=C2=A0=C2=A09.796075] kvm_amd: Virtual VMLOAD VMSAVE supported
<br>[ =C2=A0=C2=A0=C2=A09.796076] kvm_amd: Virtual GIF supported
<br>[ =C2=A0=C2=A0=C2=A09.796077] kvm_amd: Virtual NMI enabled
<br>[ =C2=A0=C2=A0=C2=A09.796077] kvm_amd: LBR virtualization supported
<br>[ =C2=A0=C2=A0=C2=A09.803216] usb 7-1: Found UVC 1.10 device Integrated=
_Webcam_FHD (0bda:555a)
<br>[ =C2=A0=C2=A0=C2=A09.804962] Bluetooth: hci0: Found device firmware: i=
ntel/ibt-0041-0041.sfi
<br>[ =C2=A0=C2=A0=C2=A09.804969] Bluetooth: hci0: Boot Address: 0x100800
<br>[ =C2=A0=C2=A0=C2=A09.804970] Bluetooth: hci0: Firmware Version: 123-8.=
24
<br>[ =C2=A0=C2=A0=C2=A09.805517] RPC: Registered named UNIX socket transpo=
rt module.
<br>[ =C2=A0=C2=A0=C2=A09.806537] RPC: Registered udp transport module.
<br>[ =C2=A0=C2=A0=C2=A09.806537] RPC: Registered tcp transport module.
<br>[ =C2=A0=C2=A0=C2=A09.806538] RPC: Registered tcp-with-tls transport mo=
dule.
<br>[ =C2=A0=C2=A0=C2=A09.806538] RPC: Registered tcp NFSv4.1 backchannel t=
ransport module.
<br>[ =C2=A0=C2=A0=C2=A09.811120] iwlwifi 0000:09:00.0: TLV_FW_FSEQ_VERSION=
: FSEQ Version: 0.0.2.41
<br>[ =C2=A0=C2=A0=C2=A09.811337] usb 7-1: Found UVC 1.50 device Integrated=
_Webcam_FHD (0bda:555a)
<br>[ =C2=A0=C2=A0=C2=A09.811766] iwlwifi 0000:09:00.0: loaded firmware ver=
sion 86.fb5c9aeb.0 ty-a0-gf-a0-86.ucode op_mode iwlmvm
<br>[ =C2=A0=C2=A0=C2=A09.813556] usbcore: registered new interface driver =
uvcvideo
<br>[ =C2=A0=C2=A0=C2=A09.813726] MCE: In-kernel MCE decoding enabled.
<br>[ =C2=A0=C2=A0=C2=A09.821264] snd_hda_intel 0000:03:00.1: Force to non-=
snoop mode
<br>[ =C2=A0=C2=A0=C2=A09.821707] snd_hda_intel 0000:0c:00.6: enabling devi=
ce (0001 -&gt; 0003)
<br>[ =C2=A0=C2=A0=C2=A09.837156] usb 2-1.4.1: Warning! Unlikely big volume=
 range (=3D767), cval-&gt;res is probably wrong.
<br>[ =C2=A0=C2=A0=C2=A09.837325] usb 2-1.4.1: [4] FU [Mic Capture Volume] =
ch =3D 2, val =3D -4592/7680/16
<br>[ =C2=A0=C2=A0=C2=A09.839586] snd_hda_intel 0000:03:00.1: bound 0000:03=
:00.0 (ops amdgpu_dm_audio_component_bind_ops [amdgpu])
<br>[ =C2=A0=C2=A0=C2=A09.840446] snd_hda_codec_hdmi hdaudioC1D0: HDMI: Unk=
nown ELD version 0
<br>[ =C2=A0=C2=A0=C2=A09.842413] usb 2-1.4.1: Warning! Unlikely big volume=
 range (=3D672), cval-&gt;res is probably wrong.
<br>[ =C2=A0=C2=A0=C2=A09.842662] usb 2-1.4.1: [7] FU [Dell USB Audio Playb=
ack Volume] ch =3D 6, val =3D -10752/0/16
<br>[ =C2=A0=C2=A0=C2=A09.842974] usbcore: registered new interface driver =
snd-usb-audio
<br>[ =C2=A0=C2=A0=C2=A09.843252] input: HDA ATI HDMI HDMI/DP,pcm=3D3 as /d=
evices/pci0000:00/0000:00:01.1/0000:01:00.0/0000:02:00.0/0000
<br>:03:00.1/sound/card1/input20
<br>[ =C2=A0=C2=A0=C2=A09.843546] input: HDA ATI HDMI HDMI/DP,pcm=3D7 as /d=
evices/pci0000:00/0000:00:01.1/0000:01:00.0/0000:02:00.0/0000
<br>:03:00.1/sound/card1/input21
<br>[ =C2=A0=C2=A0=C2=A09.843839] input: HDA ATI HDMI HDMI/DP,pcm=3D8 as /d=
evices/pci0000:00/0000:00:01.1/0000:01:00.0/0000:02:00.0/0000
<br>:03:00.1/sound/card1/input22
<br>[ =C2=A0=C2=A0=C2=A09.843858] input: HDA ATI HDMI HDMI/DP,pcm=3D9 as /d=
evices/pci0000:00/0000:00:01.1/0000:01:00.0/0000:02:00.0/0000
<br>:03:00.1/sound/card1/input23
<br>[ =C2=A0=C2=A0=C2=A09.846956] intel_rapl_common: Found RAPL domain pack=
age
<br>[ =C2=A0=C2=A0=C2=A09.847525] intel_rapl_common: Found RAPL domain core
<br>[ =C2=A0=C2=A0=C2=A09.848657] AMD Address Translation Library initializ=
ed
<br>[ =C2=A0=C2=A0=C2=A09.850663] snd_hda_codec_realtek hdaudioC2D0: autoco=
nfig for ALC3254: line_outs=3D1 (0x14/0x0/0x0/0x0/0x0) type:s
<br>peaker
<br>[ =C2=A0=C2=A0=C2=A09.851200] snd_hda_codec_realtek hdaudioC2D0: =C2=A0=
=C2=A0=C2=A0speaker_outs=3D0 (0x0/0x0/0x0/0x0/0x0)
<br>[ =C2=A0=C2=A0=C2=A09.851440] snd_hda_codec_realtek hdaudioC2D0: =C2=A0=
=C2=A0=C2=A0hp_outs=3D1 (0x21/0x0/0x0/0x0/0x0)
<br>[ =C2=A0=C2=A0=C2=A09.851673] snd_hda_codec_realtek hdaudioC2D0: =C2=A0=
=C2=A0=C2=A0mono: mono_out=3D0x0
<br>[ =C2=A0=C2=A0=C2=A09.851897] snd_hda_codec_realtek hdaudioC2D0: =C2=A0=
=C2=A0=C2=A0inputs:
<br>[ =C2=A0=C2=A0=C2=A09.851903] snd_hda_codec_realtek hdaudioC2D0: =C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0Headset Mic=3D0x19
<br>[ =C2=A0=C2=A0=C2=A09.852344] snd_hda_codec_realtek hdaudioC2D0: =C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0Headphone Mic=3D0x1b
<br>[ =C2=A0=C2=A0=C2=A09.969483] iwlwifi 0000:09:00.0: Detected Intel(R) W=
i-Fi 6 AX210 160MHz, REV=3D0x420
<br>[ =C2=A0=C2=A0=C2=A09.969825] thermal thermal_zone1: failed to read out=
 thermal zone (-61)
<br>[ =C2=A0=C2=A0=C2=A09.977778] iwlwifi 0000:09:00.0: WRT: Invalid buffer=
 destination
<br>[ =C2=A0=C2=A0=C2=A09.995463] Bluetooth: BNEP (Ethernet Emulation) ver =
1.3
<br>[ =C2=A0=C2=A0=C2=A09.995465] Bluetooth: BNEP filters: protocol multica=
st
<br>[ =C2=A0=C2=A0=C2=A09.995467] Bluetooth: BNEP socket layer initialized
<br>[ =C2=A0=C2=A010.159967] iwlwifi 0000:09:00.0: WFPM_UMAC_PD_NOTIFICATIO=
N: 0x20
<br>[ =C2=A0=C2=A010.160446] iwlwifi 0000:09:00.0: WFPM_LMAC2_PD_NOTIFICATI=
ON: 0x1f
<br>[ =C2=A0=C2=A010.160799] iwlwifi 0000:09:00.0: WFPM_AUTH_KEY_0: 0x90
<br>[ =C2=A0=C2=A010.160958] iwlwifi 0000:09:00.0: CNVI_SCU_SEQ_DATA_DW9: 0=
x0
<br>[ =C2=A0=C2=A010.161921] iwlwifi 0000:09:00.0: loaded PNVM version e28b=
b9d7
<br>[ =C2=A0=C2=A010.179392] iwlwifi 0000:09:00.0: Detected RF GF, rfid=3D0=
x10d000
<br>[ =C2=A0=C2=A010.254031] iwlwifi 0000:09:00.0: base HW address: 3c:e9:f=
7:76:8a:31
<br>[ =C2=A0=C2=A010.272636] iwlwifi 0000:09:00.0 wlp9s0: renamed from wlan=
0
<br>[ =C2=A0=C2=A010.322639] RTL8226B_RTL8221B 2.5Gbps PHY r8169-0-b00:00: =
attached PHY driver (mii_bus:phy_addr=3Dr8169-0-b00:00, =C2=A0<br>irq=3DMAC=
)
<br>[ =C2=A0=C2=A010.338147] NET: Registered PF_QIPCRTR protocol family
<br>[ =C2=A0=C2=A010.475717] ACPI: button: The lid device is not compliant =
to SW_LID.
<br>[ =C2=A0=C2=A010.477680] r8169 0000:0b:00.0 enp11s0: No native access t=
o PCI extended config space, falling back to CSI
<br>[ =C2=A0=C2=A010.500821] r8169 0000:0b:00.0 enp11s0: Link is Down
<br>[ =C2=A0=C2=A010.514558] input: HD-Audio Generic Headphone Mic as /devi=
ces/pci0000:00/0000:00:08.1/0000:0c:00.6/sound/card2/i
<br>nput24
<br>[ =C2=A0=C2=A010.523495] iwlwifi 0000:09:00.0: WRT: Invalid buffer dest=
ination
<br>[ =C2=A0=C2=A010.701002] iwlwifi 0000:09:00.0: WFPM_UMAC_PD_NOTIFICATIO=
N: 0x20
<br>[ =C2=A0=C2=A010.701165] iwlwifi 0000:09:00.0: WFPM_LMAC2_PD_NOTIFICATI=
ON: 0x1f
<br>[ =C2=A0=C2=A010.701319] iwlwifi 0000:09:00.0: WFPM_AUTH_KEY_0: 0x90
<br>[ =C2=A0=C2=A010.701472] iwlwifi 0000:09:00.0: CNVI_SCU_SEQ_DATA_DW9: 0=
x0
<br>[ =C2=A0=C2=A010.805456] iwlwifi 0000:09:00.0: Registered PHC clock: iw=
lwifi-PTP, with index: 0
<br>[ =C2=A0=C2=A010.851430] iwlwifi 0000:09:00.0: WRT: Invalid buffer dest=
ination
<br>[ =C2=A0=C2=A010.989031] Bluetooth: hci0: Waiting for firmware download=
 to complete
<br>[ =C2=A0=C2=A010.989962] Bluetooth: hci0: Firmware loaded in 1157230 us=
ecs
<br>[ =C2=A0=C2=A010.990656] Bluetooth: hci0: Waiting for device to boot
<br>[ =C2=A0=C2=A011.017902] Bluetooth: hci0: Device booted in 26792 usecs
<br>[ =C2=A0=C2=A011.017904] Bluetooth: hci0: Malformed MSFT vendor event: =
0x02
<br>[ =C2=A0=C2=A011.018324] Bluetooth: hci0: Found Intel DDC parameters: i=
ntel/ibt-0041-0041.ddc
<br>[ =C2=A0=C2=A011.023855] Bluetooth: hci0: Applying Intel DDC parameters=
 completed
<br>[ =C2=A0=C2=A011.030508] iwlwifi 0000:09:00.0: WFPM_UMAC_PD_NOTIFICATIO=
N: 0x20
<br>[ =C2=A0=C2=A011.030891] Bluetooth: hci0: Firmware timestamp 2024.8 bui=
ldtype 1 build 79483
<br>[ =C2=A0=C2=A011.031134] iwlwifi 0000:09:00.0: WFPM_LMAC2_PD_NOTIFICATI=
ON: 0x1f
<br>[ =C2=A0=C2=A011.031249] Bluetooth: hci0: Firmware SHA1: 0x7c7b67b9
<br>[ =C2=A0=C2=A011.031469] iwlwifi 0000:09:00.0: WFPM_AUTH_KEY_0: 0x90
<br>[ =C2=A0=C2=A011.031950] iwlwifi 0000:09:00.0: CNVI_SCU_SEQ_DATA_DW9: 0=
x0
<br>[ =C2=A0=C2=A011.040871] Bluetooth: hci0: Fseq status: Success (0x00)
<br>[ =C2=A0=C2=A011.041154] Bluetooth: hci0: Fseq executed: 00.00.02.41
<br>[ =C2=A0=C2=A011.041350] Bluetooth: hci0: Fseq BT Top: 00.00.02.41
<br>[ =C2=A0=C2=A011.215035] Bluetooth: MGMT ver 1.22
<br>[ =C2=A0=C2=A013.921396] wlp9s0: authenticate with 60:38:e0:b4:65:d9 (l=
ocal address=3De2:60:6e:a9:c6:8b)
<br>[ =C2=A0=C2=A013.923601] wlp9s0: send auth to 60:38:e0:b4:65:d9 (try 1/=
3)
<br>[ =C2=A0=C2=A013.968543] wlp9s0: authenticated
<br>[ =C2=A0=C2=A013.969656] wlp9s0: associate with 60:38:e0:b4:65:d9 (try =
1/3)
<br>[ =C2=A0=C2=A014.001468] wlp9s0: RX AssocResp from 60:38:e0:b4:65:d9 (c=
apab=3D0x431 status=3D0 aid=3D1)
<br>[ =C2=A0=C2=A014.026019] wlp9s0: associated
<br>[ =C2=A0=C2=A064.826512] systemd-journald[835]: /var/log/journal/214fcf=
b5b9274988845afbe1b019c79e/user-1000.journal: Journal =C2=A0<br>file uses a=
 different sequence number ID, rotating.
<br>[ =C2=A0=C2=A068.860979] Bluetooth: RFCOMM TTY layer initialized
<br>[ =C2=A0=C2=A068.860985] Bluetooth: RFCOMM socket layer initialized
<br>[ =C2=A0=C2=A068.860987] Bluetooth: RFCOMM ver 1.11
<br>[ =C2=A0=C2=A069.102940] warning: `QSampleCache::L&#39; uses wireless e=
xtensions which will stop working for Wi-Fi 7 hardware; us
<br>e nl80211
<br>[ =C2=A0=C2=A069.604620] block nvme0n1: No UUID available providing old=
 NGUID
<br>[ =C2=A0319.706441] wlp9s0: disconnect from AP 60:38:e0:b4:65:d9 for ne=
w auth to 60:38:e0:b4:65:da
<br>[ =C2=A0319.758285] wlp9s0: authenticate with 60:38:e0:b4:65:da (local =
address=3De2:60:6e:a9:c6:8b)
<br>[ =C2=A0319.761043] wlp9s0: send auth to 60:38:e0:b4:65:da (try 1/3)
<br>[ =C2=A0319.796414] wlp9s0: authenticated
<br>[ =C2=A0319.797691] wlp9s0: associate with 60:38:e0:b4:65:da (try 1/3)
<br>[ =C2=A0319.817370] wlp9s0: RX ReassocResp from 60:38:e0:b4:65:da (capa=
b=3D0x11 status=3D0 aid=3D4)
<br>[ =C2=A0319.837484] wlp9s0: associated
<br>[11017.090328] gmc_v11_0_process_interrupt: 45 callbacks suppressed
<br>[11017.090332] amdgpu 0000:03:00.0: amdgpu: [mmhub] page fault (src_id:=
0 ring:40 vmid:1 pasid:32813)
<br>[11017.090337] amdgpu 0000:03:00.0: amdgpu: =C2=A0in process RDD Proces=
s pid 3989 thread firefox:cs0 pid 6856)
<br>[11017.090338] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0in page startin=
g at address 0x0000000000005000 from client 18
<br>[11017.090340] amdgpu 0000:03:00.0: amdgpu: MMVM_L2_PROTECTION_FAULT_ST=
ATUS:0x00142851
<br>[11017.090341] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0Faulty UTCL2 client ID: VCN0 (0x14)
<br>[11017.090342] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0MORE_FAULTS: 0x1
<br>[11017.090343] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0WALKER_ERROR: 0x0
<br>[11017.090343] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0PERMISSION_FAULTS: 0x5
<br>[11017.090344] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0MAPPING_ERROR: 0x0
<br>[11017.090344] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0RW: 0x1
<br>[11017.090347] amdgpu 0000:03:00.0: amdgpu: [mmhub] page fault (src_id:=
0 ring:40 vmid:1 pasid:32813)
<br>[11017.090348] amdgpu 0000:03:00.0: amdgpu: =C2=A0in process RDD Proces=
s pid 3989 thread firefox:cs0 pid 6856)
<br>[11017.090349] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0in page startin=
g at address 0x0000000000009000 from client 18
<br>[11017.090349] amdgpu 0000:03:00.0: amdgpu: MMVM_L2_PROTECTION_FAULT_ST=
ATUS:0x00000000
<br>[11017.090350] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0Faulty UTCL2 client ID: VMC (0x0)
<br>[11017.090351] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0MORE_FAULTS: 0x0
<br>[11017.090351] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0WALKER_ERROR: 0x0
<br>[11017.090352] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0PERMISSION_FAULTS: 0x0
<br>[11017.090353] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0MAPPING_ERROR: 0x0
<br>[11017.090353] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0RW: 0x0
<br>[11017.090355] amdgpu 0000:03:00.0: amdgpu: [mmhub] page fault (src_id:=
0 ring:40 vmid:1 pasid:32813)
<br>[11017.090356] amdgpu 0000:03:00.0: amdgpu: =C2=A0in process RDD Proces=
s pid 3989 thread firefox:cs0 pid 6856)
<br>[11017.090357] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0in page startin=
g at address 0x000000000000d000 from client 18
<br>[11017.090358] amdgpu 0000:03:00.0: amdgpu: MMVM_L2_PROTECTION_FAULT_ST=
ATUS:0x00000000
<br>[11017.090358] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0Faulty UTCL2 client ID: VMC (0x0)
<br>[11017.090359] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0MORE_FAULTS: 0x0
<br>[11017.090359] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0WALKER_ERROR: 0x0
<br>[11017.090360] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0PERMISSION_FAULTS: 0x0
<br>[11017.090360] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0MAPPING_ERROR: 0x0
<br>[11017.090361] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0RW: 0x0
<br>[11017.090363] amdgpu 0000:03:00.0: amdgpu: [mmhub] page fault (src_id:=
0 ring:40 vmid:1 pasid:32813)
<br>[11017.090364] amdgpu 0000:03:00.0: amdgpu: =C2=A0in process RDD Proces=
s pid 3989 thread firefox:cs0 pid 6856)
<br>[11017.090365] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0in page startin=
g at address 0x0000000000011000 from client 18
<br>[11017.090365] amdgpu 0000:03:00.0: amdgpu: MMVM_L2_PROTECTION_FAULT_ST=
ATUS:0x00000000
<br>[11017.090366] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0Faulty UTCL2 client ID: VMC (0x0)
<br>[11017.090367] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0MORE_FAULTS: 0x0
<br>[11017.090367] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0WALKER_ERROR: 0x0
<br>[11017.090368] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0PERMISSION_FAULTS: 0x0
<br>[11017.090368] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0MAPPING_ERROR: 0x0
<br>[11017.090369] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0RW: 0x0
<br>[11017.090371] amdgpu 0000:03:00.0: amdgpu: [mmhub] page fault (src_id:=
0 ring:40 vmid:1 pasid:32813)
<br>[11017.090371] amdgpu 0000:03:00.0: amdgpu: =C2=A0in process RDD Proces=
s pid 3989 thread firefox:cs0 pid 6856)
<br>[11017.090372] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0in page startin=
g at address 0x0000000000015000 from client 18
<br>[11017.090373] amdgpu 0000:03:00.0: amdgpu: MMVM_L2_PROTECTION_FAULT_ST=
ATUS:0x00000000
<br>[11017.090373] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0Faulty UTCL2 client ID: VMC (0x0)
<br>[11017.090374] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0MORE_FAULTS: 0x0
<br>[11017.090374] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0WALKER_ERROR: 0x0
<br>[11017.090375] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0PERMISSION_FAULTS: 0x0
<br>[11017.090376] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0MAPPING_ERROR: 0x0
<br>[11017.090376] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0RW: 0x0
<br>[11017.090378] amdgpu 0000:03:00.0: amdgpu: [mmhub] page fault (src_id:=
0 ring:40 vmid:1 pasid:32813)
<br>[11017.090379] amdgpu 0000:03:00.0: amdgpu: =C2=A0in process RDD Proces=
s pid 3989 thread firefox:cs0 pid 6856)
<br>[11017.090380] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0in page startin=
g at address 0x0000000000019000 from client 18
<br>[11017.090380] amdgpu 0000:03:00.0: amdgpu: MMVM_L2_PROTECTION_FAULT_ST=
ATUS:0x00000000
<br>[11017.090381] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0Faulty UTCL2 client ID: VMC (0x0)
<br>[11017.090381] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0MORE_FAULTS: 0x0
<br>[11017.090382] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0WALKER_ERROR: 0x0
<br>[11017.090382] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0PERMISSION_FAULTS: 0x0
<br>[11017.090383] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0MAPPING_ERROR: 0x0
<br>[11017.090383] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0RW: 0x0
<br>[11017.090385] amdgpu 0000:03:00.0: amdgpu: [mmhub] page fault (src_id:=
0 ring:40 vmid:1 pasid:32813)
<br>[11017.090386] amdgpu 0000:03:00.0: amdgpu: =C2=A0in process RDD Proces=
s pid 3989 thread firefox:cs0 pid 6856)
<br>[11017.090387] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0in page startin=
g at address 0x000000000001d000 from client 18
<br>[11017.090388] amdgpu 0000:03:00.0: amdgpu: MMVM_L2_PROTECTION_FAULT_ST=
ATUS:0x00000000
<br>[11017.090388] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0Faulty UTCL2 client ID: VMC (0x0)
<br>[11017.090389] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0MORE_FAULTS: 0x0
<br>[11017.090389] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0WALKER_ERROR: 0x0
<br>[11017.090390] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0PERMISSION_FAULTS: 0x0
<br>[11017.090390] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0MAPPING_ERROR: 0x0
<br>[11017.090391] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0RW: 0x0
<br>[11017.090393] amdgpu 0000:03:00.0: amdgpu: [mmhub] page fault (src_id:=
0 ring:40 vmid:1 pasid:32813)
<br>[11017.090394] amdgpu 0000:03:00.0: amdgpu: =C2=A0in process RDD Proces=
s pid 3989 thread firefox:cs0 pid 6856)
<br>[11017.090394] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0in page startin=
g at address 0x0000000000021000 from client 18
<br>[11017.090395] amdgpu 0000:03:00.0: amdgpu: MMVM_L2_PROTECTION_FAULT_ST=
ATUS:0x00000000
<br>[11017.090396] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0Faulty UTCL2 client ID: VMC (0x0)
<br>[11017.090396] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0MORE_FAULTS: 0x0
<br>[11017.090397] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0WALKER_ERROR: 0x0
<br>[11017.090397] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0PERMISSION_FAULTS: 0x0
<br>[11017.090398] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0MAPPING_ERROR: 0x0
<br>[11017.090398] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0RW: 0x0
<br>[11017.090400] amdgpu 0000:03:00.0: amdgpu: [mmhub] page fault (src_id:=
0 ring:40 vmid:1 pasid:32813)
<br>[11017.090401] amdgpu 0000:03:00.0: amdgpu: =C2=A0in process RDD Proces=
s pid 3989 thread firefox:cs0 pid 6856)
<br>[11017.090402] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0in page startin=
g at address 0x0000000000025000 from client 18
<br>[11017.090402] amdgpu 0000:03:00.0: amdgpu: MMVM_L2_PROTECTION_FAULT_ST=
ATUS:0x00000000
<br>[11017.090403] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0Faulty UTCL2 client ID: VMC (0x0)
<br>[11017.090404] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0MORE_FAULTS: 0x0
<br>[11017.090404] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0WALKER_ERROR: 0x0
<br>[11017.090405] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0PERMISSION_FAULTS: 0x0
<br>[11017.090405] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0MAPPING_ERROR: 0x0
<br>[11017.090406] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0RW: 0x0
<br>[11017.090408] amdgpu 0000:03:00.0: amdgpu: [mmhub] page fault (src_id:=
0 ring:40 vmid:1 pasid:32813)
<br>[11017.090408] amdgpu 0000:03:00.0: amdgpu: =C2=A0in process RDD Proces=
s pid 3989 thread firefox:cs0 pid 6856)
<br>[11017.090409] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0in page startin=
g at address 0x0000000000029000 from client 18
<br>[11017.090410] amdgpu 0000:03:00.0: amdgpu: MMVM_L2_PROTECTION_FAULT_ST=
ATUS:0x00000000
<br>[11017.090410] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0Faulty UTCL2 client ID: VMC (0x0)
<br>[11017.090411] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0MORE_FAULTS: 0x0
<br>[11017.090411] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0WALKER_ERROR: 0x0
<br>[11017.090412] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0PERMISSION_FAULTS: 0x0
<br>[11017.090412] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0MAPPING_ERROR: 0x0
<br>[11017.090413] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0RW: 0x0
<br>[11022.107770] gmc_v11_0_process_interrupt: 209702 callbacks suppressed
<br>[11022.107772] amdgpu 0000:03:00.0: amdgpu: [mmhub] page fault (src_id:=
0 ring:40 vmid:1 pasid:32813)
<br>[11022.107776] amdgpu 0000:03:00.0: amdgpu: =C2=A0in process RDD Proces=
s pid 3989 thread firefox:cs0 pid 6856)
<br>[11022.107778] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0in page startin=
g at address 0x0000000000009000 from client 18
<br>[11022.107779] amdgpu 0000:03:00.0: amdgpu: MMVM_L2_PROTECTION_FAULT_ST=
ATUS:0x00142851
<br>[11022.107780] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0Faulty UTCL2 client ID: VCN0 (0x14)
<br>[11022.107781] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0MORE_FAULTS: 0x1
<br>[11022.107781] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0WALKER_ERROR: 0x0
<br>[11022.107782] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0PERMISSION_FAULTS: 0x5
<br>[11022.107782] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0MAPPING_ERROR: 0x0
<br>[11022.107783] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0RW: 0x1
<br>[11022.107785] amdgpu 0000:03:00.0: amdgpu: [mmhub] page fault (src_id:=
0 ring:40 vmid:1 pasid:32813)
<br>[11022.107786] amdgpu 0000:03:00.0: amdgpu: =C2=A0in process RDD Proces=
s pid 3989 thread firefox:cs0 pid 6856)
<br>[11022.107786] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0in page startin=
g at address 0x000000000000d000 from client 18
<br>[11022.107787] amdgpu 0000:03:00.0: amdgpu: MMVM_L2_PROTECTION_FAULT_ST=
ATUS:0x00000000
<br>[11022.107788] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0Faulty UTCL2 client ID: VMC (0x0)
<br>[11022.107788] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0MORE_FAULTS: 0x0
<br>[11022.107789] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0WALKER_ERROR: 0x0
<br>[11022.107789] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0PERMISSION_FAULTS: 0x0
<br>[11022.107790] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0MAPPING_ERROR: 0x0
<br>[11022.107790] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0RW: 0x0
<br>[11022.107792] amdgpu 0000:03:00.0: amdgpu: [mmhub] page fault (src_id:=
0 ring:40 vmid:1 pasid:32813)
<br>[11022.107793] amdgpu 0000:03:00.0: amdgpu: =C2=A0in process RDD Proces=
s pid 3989 thread firefox:cs0 pid 6856)
<br>[11022.107793] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0in page startin=
g at address 0x0000000000011000 from client 18
<br>[11022.107794] amdgpu 0000:03:00.0: amdgpu: MMVM_L2_PROTECTION_FAULT_ST=
ATUS:0x00000000
<br>[11022.107794] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0Faulty UTCL2 client ID: VMC (0x0)
<br>[11022.107795] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0MORE_FAULTS: 0x0
<br>[11022.107795] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0WALKER_ERROR: 0x0
<br>[11022.107795] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0PERMISSION_FAULTS: 0x0
<br>[11022.107796] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0MAPPING_ERROR: 0x0
<br>[11022.107796] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0RW: 0x0
<br>[11022.107801] amdgpu 0000:03:00.0: amdgpu: [mmhub] page fault (src_id:=
0 ring:40 vmid:1 pasid:32813)
<br>[11022.107801] amdgpu 0000:03:00.0: amdgpu: =C2=A0in process RDD Proces=
s pid 3989 thread firefox:cs0 pid 6856)
<br>[11022.107802] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0in page startin=
g at address 0x0000000000015000 from client 18
<br>[11022.107802] amdgpu 0000:03:00.0: amdgpu: MMVM_L2_PROTECTION_FAULT_ST=
ATUS:0x00000000
<br>[11022.107803] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0Faulty UTCL2 client ID: VMC (0x0)
<br>[11022.107803] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0MORE_FAULTS: 0x0
<br>[11022.107804] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0WALKER_ERROR: 0x0
<br>[11022.107804] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0PERMISSION_FAULTS: 0x0
<br>[11022.107804] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0MAPPING_ERROR: 0x0
<br>[11022.107805] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0RW: 0x0
<br>[11022.107807] amdgpu 0000:03:00.0: amdgpu: [mmhub] page fault (src_id:=
0 ring:40 vmid:1 pasid:32813)
<br>[11022.107807] amdgpu 0000:03:00.0: amdgpu: =C2=A0in process RDD Proces=
s pid 3989 thread firefox:cs0 pid 6856)
<br>[11022.107808] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0in page startin=
g at address 0x0000000000019000 from client 18
<br>[11022.107808] amdgpu 0000:03:00.0: amdgpu: MMVM_L2_PROTECTION_FAULT_ST=
ATUS:0x00000000
<br>[11022.107809] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0Faulty UTCL2 client ID: VMC (0x0)
<br>[11022.107809] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0MORE_FAULTS: 0x0
<br>[11022.107810] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0WALKER_ERROR: 0x0
<br>[11022.107810] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0PERMISSION_FAULTS: 0x0
<br>[11022.107810] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0MAPPING_ERROR: 0x0
<br>[11022.107811] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0RW: 0x0
<br>[11022.107813] amdgpu 0000:03:00.0: amdgpu: [mmhub] page fault (src_id:=
0 ring:40 vmid:1 pasid:32813)
<br>[11022.107813] amdgpu 0000:03:00.0: amdgpu: =C2=A0in process RDD Proces=
s pid 3989 thread firefox:cs0 pid 6856)
<br>[11022.107814] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0in page startin=
g at address 0x000000000001d000 from client 18
<br>[11022.107814] amdgpu 0000:03:00.0: amdgpu: MMVM_L2_PROTECTION_FAULT_ST=
ATUS:0x00000000
<br>[11022.107815] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0Faulty UTCL2 client ID: VMC (0x0)
<br>[11022.107815] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0MORE_FAULTS: 0x0
<br>[11022.107816] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0WALKER_ERROR: 0x0
<br>[11022.107816] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0PERMISSION_FAULTS: 0x0
<br>[11022.107816] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0MAPPING_ERROR: 0x0
<br>[11022.107817] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0RW: 0x0
<br>[11022.107819] amdgpu 0000:03:00.0: amdgpu: [mmhub] page fault (src_id:=
0 ring:40 vmid:1 pasid:32813)
<br>[11022.107820] amdgpu 0000:03:00.0: amdgpu: =C2=A0in process RDD Proces=
s pid 3989 thread firefox:cs0 pid 6856)
<br>[11022.107820] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0in page startin=
g at address 0x0000000000021000 from client 18
<br>[11022.107820] amdgpu 0000:03:00.0: amdgpu: MMVM_L2_PROTECTION_FAULT_ST=
ATUS:0x00000000
<br>[11022.107821] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0Faulty UTCL2 client ID: VMC (0x0)
<br>[11022.107821] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0MORE_FAULTS: 0x0
<br>[11022.107822] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0WALKER_ERROR: 0x0
<br>[11022.107822] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0PERMISSION_FAULTS: 0x0
<br>[11022.107823] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0MAPPING_ERROR: 0x0
<br>[11022.107823] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0RW: 0x0
<br>[11022.107825] amdgpu 0000:03:00.0: amdgpu: [mmhub] page fault (src_id:=
0 ring:40 vmid:1 pasid:32813)
<br>[11022.107825] amdgpu 0000:03:00.0: amdgpu: =C2=A0in process RDD Proces=
s pid 3989 thread firefox:cs0 pid 6856)
<br>[11022.107826] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0in page startin=
g at address 0x0000000000025000 from client 18
<br>[11022.107826] amdgpu 0000:03:00.0: amdgpu: MMVM_L2_PROTECTION_FAULT_ST=
ATUS:0x00000000
<br>[11022.107827] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0Faulty UTCL2 client ID: VMC (0x0)
<br>[11022.107827] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0MORE_FAULTS: 0x0
<br>[11022.107828] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0WALKER_ERROR: 0x0
<br>[11022.107828] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0PERMISSION_FAULTS: 0x0
<br>[11022.107828] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0MAPPING_ERROR: 0x0
<br>[11022.107829] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0RW: 0x0
<br>[11022.107831] amdgpu 0000:03:00.0: amdgpu: [mmhub] page fault (src_id:=
0 ring:40 vmid:1 pasid:32813)
<br>[11022.107831] amdgpu 0000:03:00.0: amdgpu: =C2=A0in process RDD Proces=
s pid 3989 thread firefox:cs0 pid 6856)
<br>[11022.107832] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0in page startin=
g at address 0x0000000000029000 from client 18
<br>[11022.107832] amdgpu 0000:03:00.0: amdgpu: MMVM_L2_PROTECTION_FAULT_ST=
ATUS:0x00000000
<br>[11022.107833] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0Faulty UTCL2 client ID: VMC (0x0)
<br>[11022.107833] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0MORE_FAULTS: 0x0
<br>[11022.107833] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0WALKER_ERROR: 0x0
<br>[11022.107834] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0PERMISSION_FAULTS: 0x0
<br>[11022.107834] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0MAPPING_ERROR: 0x0
<br>[11022.107835] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0RW: 0x0
<br>[11022.107838] amdgpu 0000:03:00.0: amdgpu: [mmhub] page fault (src_id:=
0 ring:40 vmid:1 pasid:32813)
<br>[11022.107839] amdgpu 0000:03:00.0: amdgpu: =C2=A0in process RDD Proces=
s pid 3989 thread firefox:cs0 pid 6856)
<br>[11022.107839] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0in page startin=
g at address 0x000000000002d000 from client 18
<br>[11022.107840] amdgpu 0000:03:00.0: amdgpu: MMVM_L2_PROTECTION_FAULT_ST=
ATUS:0x00000000
<br>[11022.107840] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0Faulty UTCL2 client ID: VMC (0x0)
<br>[11022.107841] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0MORE_FAULTS: 0x0
<br>[11022.107841] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0WALKER_ERROR: 0x0
<br>[11022.107841] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0PERMISSION_FAULTS: 0x0
<br>[11022.107842] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0MAPPING_ERROR: 0x0
<br>[11022.107842] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0RW: 0x0
<br>[11027.108647] gmc_v11_0_process_interrupt: 202142 callbacks suppressed
<br>[11027.108650] amdgpu 0000:03:00.0: amdgpu: [mmhub] page fault (src_id:=
0 ring:40 vmid:1 pasid:32813)
<br>[11027.108655] amdgpu 0000:03:00.0: amdgpu: =C2=A0in process RDD Proces=
s pid 3989 thread firefox:cs0 pid 6856)
<br>[11027.108657] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0in page startin=
g at address 0x0000000000009000 from client 18
<br>[11027.108658] amdgpu 0000:03:00.0: amdgpu: MMVM_L2_PROTECTION_FAULT_ST=
ATUS:0x00142851
<br>[11027.108659] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0Faulty UTCL2 client ID: VCN0 (0x14)
<br>[11027.108660] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0MORE_FAULTS: 0x1
<br>[11027.108661] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0WALKER_ERROR: 0x0
<br>[11027.108662] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0PERMISSION_FAULTS: 0x5
<br>[11027.108663] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0MAPPING_ERROR: 0x0
<br>[11027.108663] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0RW: 0x1
<br>[11027.108665] amdgpu 0000:03:00.0: amdgpu: [mmhub] page fault (src_id:=
0 ring:40 vmid:1 pasid:32813)
<br>[11027.108667] amdgpu 0000:03:00.0: amdgpu: =C2=A0in process RDD Proces=
s pid 3989 thread firefox:cs0 pid 6856)
<br>[11027.108667] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0in page startin=
g at address 0x000000000000d000 from client 18
<br>[11027.108668] amdgpu 0000:03:00.0: amdgpu: MMVM_L2_PROTECTION_FAULT_ST=
ATUS:0x00000000
<br>[11027.108669] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0Faulty UTCL2 client ID: VMC (0x0)
<br>[11027.108670] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0MORE_FAULTS: 0x0
<br>[11027.108670] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0WALKER_ERROR: 0x0
<br>[11027.108671] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0PERMISSION_FAULTS: 0x0
<br>[11027.108671] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0MAPPING_ERROR: 0x0
<br>[11027.108672] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0RW: 0x0
<br>[11027.108674] amdgpu 0000:03:00.0: amdgpu: [mmhub] page fault (src_id:=
0 ring:40 vmid:1 pasid:32813)
<br>[11027.108675] amdgpu 0000:03:00.0: amdgpu: =C2=A0in process RDD Proces=
s pid 3989 thread firefox:cs0 pid 6856)
<br>[11027.108676] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0in page startin=
g at address 0x0000000000011000 from client 18
<br>[11027.108676] amdgpu 0000:03:00.0: amdgpu: MMVM_L2_PROTECTION_FAULT_ST=
ATUS:0x00000000
<br>[11027.108677] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0Faulty UTCL2 client ID: VMC (0x0)
<br>[11027.108678] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0MORE_FAULTS: 0x0
<br>[11027.108678] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0WALKER_ERROR: 0x0
<br>[11027.108679] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0PERMISSION_FAULTS: 0x0
<br>[11027.108679] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0MAPPING_ERROR: 0x0
<br>[11027.108680] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0RW: 0x0
<br>[11027.108682] amdgpu 0000:03:00.0: amdgpu: [mmhub] page fault (src_id:=
0 ring:40 vmid:1 pasid:32813)
<br>[11027.108683] amdgpu 0000:03:00.0: amdgpu: =C2=A0in process RDD Proces=
s pid 3989 thread firefox:cs0 pid 6856)
<br>[11027.108683] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0in page startin=
g at address 0x0000000000015000 from client 18
<br>[11027.108684] amdgpu 0000:03:00.0: amdgpu: MMVM_L2_PROTECTION_FAULT_ST=
ATUS:0x00000000
<br>[11027.108685] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0Faulty UTCL2 client ID: VMC (0x0)
<br>[11027.108685] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0MORE_FAULTS: 0x0
<br>[11027.108686] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0WALKER_ERROR: 0x0
<br>[11027.108686] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0PERMISSION_FAULTS: 0x0
<br>[11027.108687] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0MAPPING_ERROR: 0x0
<br>[11027.108687] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0RW: 0x0
<br>[11027.108689] amdgpu 0000:03:00.0: amdgpu: [mmhub] page fault (src_id:=
0 ring:40 vmid:1 pasid:32813)
<br>[11027.108690] amdgpu 0000:03:00.0: amdgpu: =C2=A0in process RDD Proces=
s pid 3989 thread firefox:cs0 pid 6856)
<br>[11027.108691] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0in page startin=
g at address 0x0000000000019000 from client 18
<br>[11027.108691] amdgpu 0000:03:00.0: amdgpu: MMVM_L2_PROTECTION_FAULT_ST=
ATUS:0x00000000
<br>[11027.108692] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0Faulty UTCL2 client ID: VMC (0x0)
<br>[11027.108693] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0MORE_FAULTS: 0x0
<br>[11027.108693] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0WALKER_ERROR: 0x0
<br>[11027.108694] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0PERMISSION_FAULTS: 0x0
<br>[11027.108694] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0MAPPING_ERROR: 0x0
<br>[11027.108695] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0RW: 0x0
<br>[11027.108697] amdgpu 0000:03:00.0: amdgpu: [mmhub] page fault (src_id:=
0 ring:40 vmid:1 pasid:32813)
<br>[11027.108697] amdgpu 0000:03:00.0: amdgpu: =C2=A0in process RDD Proces=
s pid 3989 thread firefox:cs0 pid 6856)
<br>[11027.108698] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0in page startin=
g at address 0x000000000001d000 from client 18
<br>[11027.108699] amdgpu 0000:03:00.0: amdgpu: MMVM_L2_PROTECTION_FAULT_ST=
ATUS:0x00000000
<br>[11027.108699] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0Faulty UTCL2 client ID: VMC (0x0)
<br>[11027.108700] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0MORE_FAULTS: 0x0
<br>[11027.108700] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0WALKER_ERROR: 0x0
<br>[11027.108701] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0PERMISSION_FAULTS: 0x0
<br>[11027.108701] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0MAPPING_ERROR: 0x0
<br>[11027.108702] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0RW: 0x0
<br>[11027.108704] amdgpu 0000:03:00.0: amdgpu: [mmhub] page fault (src_id:=
0 ring:40 vmid:1 pasid:32813)
<br>[11027.108705] amdgpu 0000:03:00.0: amdgpu: =C2=A0in process RDD Proces=
s pid 3989 thread firefox:cs0 pid 6856)
<br>[11027.108705] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0in page startin=
g at address 0x0000000000021000 from client 18
<br>[11027.108706] amdgpu 0000:03:00.0: amdgpu: MMVM_L2_PROTECTION_FAULT_ST=
ATUS:0x00000000
<br>[11027.108706] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0Faulty UTCL2 client ID: VMC (0x0)
<br>[11027.108707] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0MORE_FAULTS: 0x0
<br>[11027.108708] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0WALKER_ERROR: 0x0
<br>[11027.108708] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0PERMISSION_FAULTS: 0x0
<br>[11027.108709] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0MAPPING_ERROR: 0x0
<br>[11027.108709] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0RW: 0x0
<br>[11027.108711] amdgpu 0000:03:00.0: amdgpu: [mmhub] page fault (src_id:=
0 ring:40 vmid:1 pasid:32813)
<br>[11027.108712] amdgpu 0000:03:00.0: amdgpu: =C2=A0in process RDD Proces=
s pid 3989 thread firefox:cs0 pid 6856)
<br>[11027.108712] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0in page startin=
g at address 0x0000000000025000 from client 18
<br>[11027.108713] amdgpu 0000:03:00.0: amdgpu: MMVM_L2_PROTECTION_FAULT_ST=
ATUS:0x00000000
<br>[11027.108714] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0Faulty UTCL2 client ID: VMC (0x0)
<br>[11027.108714] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0MORE_FAULTS: 0x0
<br>[11027.108715] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0WALKER_ERROR: 0x0
<br>[11027.108715] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0PERMISSION_FAULTS: 0x0
<br>[11027.108716] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0MAPPING_ERROR: 0x0
<br>[11027.108716] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0RW: 0x0
<br>[11027.108718] amdgpu 0000:03:00.0: amdgpu: [mmhub] page fault (src_id:=
0 ring:40 vmid:1 pasid:32813)
<br>[11027.108719] amdgpu 0000:03:00.0: amdgpu: =C2=A0in process RDD Proces=
s pid 3989 thread firefox:cs0 pid 6856)
<br>[11027.108720] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0in page startin=
g at address 0x0000000000029000 from client 18
<br>[11027.108720] amdgpu 0000:03:00.0: amdgpu: MMVM_L2_PROTECTION_FAULT_ST=
ATUS:0x00000000
<br>[11027.108721] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0Faulty UTCL2 client ID: VMC (0x0)
<br>[11027.108721] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0MORE_FAULTS: 0x0
<br>[11027.108722] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0WALKER_ERROR: 0x0
<br>[11027.108722] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0PERMISSION_FAULTS: 0x0
<br>[11027.108723] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0MAPPING_ERROR: 0x0
<br>[11027.108723] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0RW: 0x0
<br>[11027.108725] amdgpu 0000:03:00.0: amdgpu: [mmhub] page fault (src_id:=
0 ring:40 vmid:1 pasid:32813)
<br>[11027.108726] amdgpu 0000:03:00.0: amdgpu: =C2=A0in process RDD Proces=
s pid 3989 thread firefox:cs0 pid 6856)
<br>[11027.108727] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0in page startin=
g at address 0x000000000002d000 from client 18
<br>[11027.108727] amdgpu 0000:03:00.0: amdgpu: MMVM_L2_PROTECTION_FAULT_ST=
ATUS:0x00000000
<br>[11027.108728] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0Faulty UTCL2 client ID: VMC (0x0)
<br>[11027.108729] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0MORE_FAULTS: 0x0
<br>[11027.108729] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0WALKER_ERROR: 0x0
<br>[11027.108730] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0PERMISSION_FAULTS: 0x0
<br>[11027.108730] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0MAPPING_ERROR: 0x0
<br>[11027.108731] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0RW: 0x0
<br>[11028.620576] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring vcn_unif=
ied_0 timeout, signaled seq=3D6080, emitted se
<br>q=3D6082
<br>[11028.620881] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process infor=
mation: process RDD Process pid 3989 thread =C2=A0<br>firefox:cs0 pid 6856
<br>[11028.621149] amdgpu 0000:03:00.0: amdgpu: GPU reset begin!
<br>[11032.118514] gmc_v11_0_process_interrupt: 197606 callbacks suppressed
<br>[11032.118518] amdgpu 0000:03:00.0: amdgpu: [mmhub] page fault (src_id:=
0 ring:40 vmid:1 pasid:32813)
<br>[11032.118524] amdgpu 0000:03:00.0: amdgpu: =C2=A0in process RDD Proces=
s pid 3989 thread firefox:cs0 pid 6856)
<br>[11032.118526] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0in page startin=
g at address 0x0000000000009000 from client 18
<br>[11032.118527] amdgpu 0000:03:00.0: amdgpu: MMVM_L2_PROTECTION_FAULT_ST=
ATUS:0x00142851
<br>[11032.118529] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0Faulty UTCL2 client ID: VCN0 (0x14)
<br>[11032.118529] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0MORE_FAULTS: 0x1
<br>[11032.118530] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0WALKER_ERROR: 0x0
<br>[11032.118531] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0PERMISSION_FAULTS: 0x5
<br>[11032.118532] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0MAPPING_ERROR: 0x0
<br>[11032.118532] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0RW: 0x1
<br>[11032.118535] amdgpu 0000:03:00.0: amdgpu: [mmhub] page fault (src_id:=
0 ring:40 vmid:1 pasid:32813)
<br>[11032.118536] amdgpu 0000:03:00.0: amdgpu: =C2=A0in process RDD Proces=
s pid 3989 thread firefox:cs0 pid 6856)
<br>[11032.118537] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0in page startin=
g at address 0x000000000000d000 from client 18
<br>[11032.118538] amdgpu 0000:03:00.0: amdgpu: MMVM_L2_PROTECTION_FAULT_ST=
ATUS:0x00000000
<br>[11032.118539] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0Faulty UTCL2 client ID: VMC (0x0)
<br>[11032.118540] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0MORE_FAULTS: 0x0
<br>[11032.118540] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0WALKER_ERROR: 0x0
<br>[11032.118541] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0PERMISSION_FAULTS: 0x0
<br>[11032.118541] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0MAPPING_ERROR: 0x0
<br>[11032.118542] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0RW: 0x0
<br>[11032.118544] amdgpu 0000:03:00.0: amdgpu: [mmhub] page fault (src_id:=
0 ring:40 vmid:1 pasid:32813)
<br>[11032.118545] amdgpu 0000:03:00.0: amdgpu: =C2=A0in process RDD Proces=
s pid 3989 thread firefox:cs0 pid 6856)
<br>[11032.118546] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0in page startin=
g at address 0x0000000000011000 from client 18
<br>[11032.118547] amdgpu 0000:03:00.0: amdgpu: MMVM_L2_PROTECTION_FAULT_ST=
ATUS:0x00000000
<br>[11032.118547] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0Faulty UTCL2 client ID: VMC (0x0)
<br>[11032.118548] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0MORE_FAULTS: 0x0
<br>[11032.118549] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0WALKER_ERROR: 0x0
<br>[11032.118549] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0PERMISSION_FAULTS: 0x0
<br>[11032.118550] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0MAPPING_ERROR: 0x0
<br>[11032.118550] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0RW: 0x0
<br>[11032.118554] amdgpu 0000:03:00.0: amdgpu: [mmhub] page fault (src_id:=
0 ring:40 vmid:1 pasid:32813)
<br>[11032.118554] amdgpu 0000:03:00.0: amdgpu: =C2=A0in process RDD Proces=
s pid 3989 thread firefox:cs0 pid 6856)
<br>[11032.118555] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0in page startin=
g at address 0x0000000000015000 from client 18
<br>[11032.118556] amdgpu 0000:03:00.0: amdgpu: MMVM_L2_PROTECTION_FAULT_ST=
ATUS:0x00000000
<br>[11032.118557] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0Faulty UTCL2 client ID: VMC (0x0)
<br>[11032.118557] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0MORE_FAULTS: 0x0
<br>[11032.118558] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0WALKER_ERROR: 0x0
<br>[11032.118558] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0PERMISSION_FAULTS: 0x0
<br>[11032.118559] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0MAPPING_ERROR: 0x0
<br>[11032.118559] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0RW: 0x0
<br>[11032.118562] amdgpu 0000:03:00.0: amdgpu: [mmhub] page fault (src_id:=
0 ring:40 vmid:1 pasid:32813)
<br>[11032.118563] amdgpu 0000:03:00.0: amdgpu: =C2=A0in process RDD Proces=
s pid 3989 thread firefox:cs0 pid 6856)
<br>[11032.118564] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0in page startin=
g at address 0x0000000000019000 from client 18
<br>[11032.118565] amdgpu 0000:03:00.0: amdgpu: MMVM_L2_PROTECTION_FAULT_ST=
ATUS:0x00000000
<br>[11032.118565] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0Faulty UTCL2 client ID: VMC (0x0)
<br>[11032.118566] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0MORE_FAULTS: 0x0
<br>[11032.118567] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0WALKER_ERROR: 0x0
<br>[11032.118567] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0PERMISSION_FAULTS: 0x0
<br>[11032.118568] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0MAPPING_ERROR: 0x0
<br>[11032.118568] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0RW: 0x0
<br>[11032.118571] amdgpu 0000:03:00.0: amdgpu: [mmhub] page fault (src_id:=
0 ring:40 vmid:1 pasid:32813)
<br>[11032.118572] amdgpu 0000:03:00.0: amdgpu: =C2=A0in process RDD Proces=
s pid 3989 thread firefox:cs0 pid 6856)
<br>[11032.118574] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0in page startin=
g at address 0x000000000001d000 from client 18
<br>[11032.118575] amdgpu 0000:03:00.0: amdgpu: MMVM_L2_PROTECTION_FAULT_ST=
ATUS:0x00000000
<br>[11032.118576] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0Faulty UTCL2 client ID: VMC (0x0)
<br>[11032.118577] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0MORE_FAULTS: 0x0
<br>[11032.118578] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0WALKER_ERROR: 0x0
<br>[11032.118579] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0PERMISSION_FAULTS: 0x0
<br>[11032.118580] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0MAPPING_ERROR: 0x0
<br>[11032.118581] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0RW: 0x0
<br>[11032.118583] amdgpu 0000:03:00.0: amdgpu: [mmhub] page fault (src_id:=
0 ring:40 vmid:1 pasid:32813)
<br>[11032.118585] amdgpu 0000:03:00.0: amdgpu: =C2=A0in process RDD Proces=
s pid 3989 thread firefox:cs0 pid 6856)
<br>[11032.118586] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0in page startin=
g at address 0x0000000000021000 from client 18
<br>[11032.118587] amdgpu 0000:03:00.0: amdgpu: MMVM_L2_PROTECTION_FAULT_ST=
ATUS:0x00000000
<br>[11032.118589] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0Faulty UTCL2 client ID: VMC (0x0)
<br>[11032.118590] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0MORE_FAULTS: 0x0
<br>[11032.118591] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0WALKER_ERROR: 0x0
<br>[11032.118592] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0PERMISSION_FAULTS: 0x0
<br>[11032.118592] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0MAPPING_ERROR: 0x0
<br>[11032.118593] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0RW: 0x0
<br>[11032.118595] amdgpu 0000:03:00.0: amdgpu: [mmhub] page fault (src_id:=
0 ring:40 vmid:1 pasid:32813)
<br>[11032.118596] amdgpu 0000:03:00.0: amdgpu: =C2=A0in process RDD Proces=
s pid 3989 thread firefox:cs0 pid 6856)
<br>[11032.118597] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0in page startin=
g at address 0x0000000000025000 from client 18
<br>[11032.118597] amdgpu 0000:03:00.0: amdgpu: MMVM_L2_PROTECTION_FAULT_ST=
ATUS:0x00000000
<br>[11032.118598] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0Faulty UTCL2 client ID: VMC (0x0)
<br>[11032.118599] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0MORE_FAULTS: 0x0
<br>[11032.118599] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0WALKER_ERROR: 0x0
<br>[11032.118600] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0PERMISSION_FAULTS: 0x0
<br>[11032.118600] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0MAPPING_ERROR: 0x0
<br>[11032.118601] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0RW: 0x0
<br>[11032.118603] amdgpu 0000:03:00.0: amdgpu: [mmhub] page fault (src_id:=
0 ring:40 vmid:1 pasid:32813)
<br>[11032.118604] amdgpu 0000:03:00.0: amdgpu: =C2=A0in process RDD Proces=
s pid 3989 thread firefox:cs0 pid 6856)
<br>[11032.118605] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0in page startin=
g at address 0x0000000000029000 from client 18
<br>[11032.118605] amdgpu 0000:03:00.0: amdgpu: MMVM_L2_PROTECTION_FAULT_ST=
ATUS:0x00000000
<br>[11032.118606] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0Faulty UTCL2 client ID: VMC (0x0)
<br>[11032.118607] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0MORE_FAULTS: 0x0
<br>[11032.118607] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0WALKER_ERROR: 0x0
<br>[11032.118608] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0PERMISSION_FAULTS: 0x0
<br>[11032.118608] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0MAPPING_ERROR: 0x0
<br>[11032.118609] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0RW: 0x0
<br>[11032.118611] amdgpu 0000:03:00.0: amdgpu: [mmhub] page fault (src_id:=
0 ring:40 vmid:1 pasid:32813)
<br>[11032.118612] amdgpu 0000:03:00.0: amdgpu: =C2=A0in process RDD Proces=
s pid 3989 thread firefox:cs0 pid 6856)
<br>[11032.118612] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0in page startin=
g at address 0x000000000002d000 from client 18
<br>[11032.118613] amdgpu 0000:03:00.0: amdgpu: MMVM_L2_PROTECTION_FAULT_ST=
ATUS:0x00000000
<br>[11032.118614] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0Faulty UTCL2 client ID: VMC (0x0)
<br>[11032.118614] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0MORE_FAULTS: 0x0
<br>[11032.118615] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0WALKER_ERROR: 0x0
<br>[11032.118616] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0PERMISSION_FAULTS: 0x0
<br>[11032.118616] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0MAPPING_ERROR: 0x0
<br>[11032.118617] amdgpu 0000:03:00.0: amdgpu: =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0RW: 0x0
<br>[11032.621135] amdgpu 0000:03:00.0: amdgpu: failed to suspend display a=
udio
<br>[11033.133194] [drm] Register(0) [regUVD_POWER_STATUS] failed to reach =
value 0x00000001 !=3D 0x00000002n
<br>[11033.334777] [drm] Register(0) [regUVD_RB_RPTR] failed to reach value=
 0x00000280 !=3D 0x00000200n
<br>[11033.541362] [drm] Register(0) [regUVD_POWER_STATUS] failed to reach =
value 0x00000001 !=3D 0x00000002n
<br>[11033.599964] amdgpu 0000:03:00.0: amdgpu: MODE1 reset
<br>[11033.599970] amdgpu 0000:03:00.0: amdgpu: GPU mode1 reset
<br>[11033.600010] amdgpu 0000:03:00.0: amdgpu: GPU smu mode1 reset
<br>[11034.108909] amdgpu 0000:03:00.0: amdgpu: GPU reset succeeded, trying=
 to resume
<br>[11034.109175] [drm] PCIE GART of 512M enabled (table at 0x00000081FEB0=
0000).
<br>[11034.109252] [drm] VRAM is lost due to GPU reset!
<br>[11034.109253] amdgpu 0000:03:00.0: amdgpu: PSP is resuming...
<br>[11034.165967] amdgpu 0000:03:00.0: amdgpu: reserve 0x1300000 from 0x81=
fc000000 for PSP TMR
<br>[11034.261067] amdgpu 0000:03:00.0: amdgpu: RAS: optional ras ta ucode =
is not available
<br>[11034.268659] amdgpu 0000:03:00.0: amdgpu: RAP: optional rap ta ucode =
is not available
<br>[11034.268660] amdgpu 0000:03:00.0: amdgpu: SECUREDISPLAY: securedispla=
y ta ucode is not available
<br>[11034.268662] amdgpu 0000:03:00.0: amdgpu: SMU is resuming...
<br>[11034.268666] amdgpu 0000:03:00.0: amdgpu: smu driver if version =3D 0=
x00000035, smu fw if version =3D 0x00000040, smu
<br> fw program =3D 0, smu fw version =3D 0x00525800 (82.88.0)
<br>[11034.268668] amdgpu 0000:03:00.0: amdgpu: SMU driver if version not m=
atched
<br>[11034.311505] amdgpu 0000:03:00.0: amdgpu: SMU is resumed successfully=
!
<br>[11034.313280] [drm] DMUB hardware initialized: version=3D0x07002800
<br>[11034.629584] snd_hda_intel 0000:03:00.1: azx_get_response timeout, sw=
itching to polling mode: last cmd=3D0x00272400
<br>[11034.629868] snd_hda_intel 0000:03:00.1: spurious response 0x233:0x0,=
 last cmd=3D0x272400
<br>[11034.629871] snd_hda_intel 0000:03:00.1: spurious response 0x0:0x0, l=
ast cmd=3D0x272400
<br>[11034.629872] snd_hda_intel 0000:03:00.1: spurious response 0x0:0x0, l=
ast cmd=3D0x272400
<br>[11034.629873] snd_hda_intel 0000:03:00.1: spurious response 0x0:0x0, l=
ast cmd=3D0x272400
<br>[11034.629874] snd_hda_intel 0000:03:00.1: spurious response 0x0:0x0, l=
ast cmd=3D0x272400
<br>[11034.629874] snd_hda_intel 0000:03:00.1: spurious response 0x0:0x0, l=
ast cmd=3D0x272400
<br>[11034.629875] snd_hda_intel 0000:03:00.1: spurious response 0x0:0x0, l=
ast cmd=3D0x272400
<br>[11034.629876] snd_hda_intel 0000:03:00.1: spurious response 0x0:0x0, l=
ast cmd=3D0x272400
<br>[11034.629876] snd_hda_intel 0000:03:00.1: spurious response 0x0:0x0, l=
ast cmd=3D0x272400
<br>[11034.629877] snd_hda_intel 0000:03:00.1: spurious response 0x0:0x0, l=
ast cmd=3D0x272400
<br>[11035.273684] [drm] kiq ring mec 3 pipe 1 q 0
<br>[11035.275790] [drm] VCN decode and encode initialized successfully(und=
er DPG Mode).
<br>[11035.276255] amdgpu 0000:03:00.0: [drm:jpeg_v4_0_hw_init [amdgpu]] JP=
EG decode initialized successfully.
<br>[11035.276566] amdgpu 0000:03:00.0: amdgpu: ring gfx_0.0.0 uses VM inv =
eng 0 on hub 0
<br>[11035.276568] amdgpu 0000:03:00.0: amdgpu: ring comp_1.0.0 uses VM inv=
 eng 1 on hub 0
<br>[11035.276569] amdgpu 0000:03:00.0: amdgpu: ring comp_1.1.0 uses VM inv=
 eng 4 on hub 0
<br>[11035.276570] amdgpu 0000:03:00.0: amdgpu: ring comp_1.2.0 uses VM inv=
 eng 6 on hub 0
<br>[11035.276570] amdgpu 0000:03:00.0: amdgpu: ring comp_1.3.0 uses VM inv=
 eng 7 on hub 0
<br>[11035.276571] amdgpu 0000:03:00.0: amdgpu: ring comp_1.0.1 uses VM inv=
 eng 8 on hub 0
<br>[11035.276572] amdgpu 0000:03:00.0: amdgpu: ring comp_1.1.1 uses VM inv=
 eng 9 on hub 0
<br>[11035.276572] amdgpu 0000:03:00.0: amdgpu: ring comp_1.2.1 uses VM inv=
 eng 10 on hub 0
<br>[11035.276573] amdgpu 0000:03:00.0: amdgpu: ring comp_1.3.1 uses VM inv=
 eng 11 on hub 0
<br>[11035.276574] amdgpu 0000:03:00.0: amdgpu: ring sdma0 uses VM inv eng =
12 on hub 0
<br>[11035.276575] amdgpu 0000:03:00.0: amdgpu: ring sdma1 uses VM inv eng =
13 on hub 0
<br>[11035.276575] amdgpu 0000:03:00.0: amdgpu: ring vcn_unified_0 uses VM =
inv eng 0 on hub 8
<br>[11035.276576] amdgpu 0000:03:00.0: amdgpu: ring jpeg_dec uses VM inv e=
ng 1 on hub 8
<br>[11035.276577] amdgpu 0000:03:00.0: amdgpu: ring mes_kiq_3.1.0 uses VM =
inv eng 14 on hub 0
<br>[11035.283794] amdgpu 0000:03:00.0: amdgpu: recover vram bo from shadow=
 start
<br>[11035.289399] amdgpu 0000:03:00.0: amdgpu: recover vram bo from shadow=
 done
<br>[11035.289410] amdgpu 0000:03:00.0: amdgpu: GPU reset(1) succeeded!
<br>[11035.289655] [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initial=
ize parser -125!
<br>[11035.632839] snd_hda_intel 0000:03:00.1: No response from codec, disa=
bling MSI: last cmd=3D0x002f2d00
<br>[11036.636808] snd_hda_intel 0000:03:00.1: azx_get_response timeout, sw=
itching to single_cmd mode: last cmd=3D0x002f2
<br>d00
<br>[11042.900905] azx_single_wait_for_response: 59592 callbacks suppressed
<br>[11045.526488] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx_0.0.=
0 timeout, signaled seq=3D7424070, emitted seq
<br>=3D7424072
<br>[11045.526707] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process infor=
mation: process kwin_wayland pid 1806 thread
<br> kwin_wayla:cs0 pid 1877
<br>[11045.526884] amdgpu 0000:03:00.0: amdgpu: GPU reset begin!
<br>[11045.980512] [drm:mes_v11_0_submit_pkt_and_poll_completion.constprop.=
0 [amdgpu]] *ERROR* MES failed to response m
<br>sg=3D3
<br>[11045.980697] [drm:amdgpu_mes_unmap_legacy_queue [amdgpu]] *ERROR* fai=
led to unmap legacy queue
<br>[11046.099519] [drm:mes_v11_0_submit_pkt_and_poll_completion.constprop.=
0 [amdgpu]] *ERROR* MES failed to response m
<br>sg=3D3
<br>[11046.099677] [drm:amdgpu_mes_unmap_legacy_queue [amdgpu]] *ERROR* fai=
led to unmap legacy queue
<br>[11046.218507] [drm:mes_v11_0_submit_pkt_and_poll_completion.constprop.=
0 [amdgpu]] *ERROR* MES failed to response m
<br>sg=3D3
<br>[11046.218664] [drm:amdgpu_mes_unmap_legacy_queue [amdgpu]] *ERROR* fai=
led to unmap legacy queue
<br>[11046.337480] [drm:mes_v11_0_submit_pkt_and_poll_completion.constprop.=
0 [amdgpu]] *ERROR* MES failed to response m
<br>sg=3D3
<br>[11046.337636] [drm:amdgpu_mes_unmap_legacy_queue [amdgpu]] *ERROR* fai=
led to unmap legacy queue
<br>[11046.456410] [drm:mes_v11_0_submit_pkt_and_poll_completion.constprop.=
0 [amdgpu]] *ERROR* MES failed to response m
<br>sg=3D3
<br>[11046.456571] [drm:amdgpu_mes_unmap_legacy_queue [amdgpu]] *ERROR* fai=
led to unmap legacy queue
<br>[11046.575381] [drm:mes_v11_0_submit_pkt_and_poll_completion.constprop.=
0 [amdgpu]] *ERROR* MES failed to response m
<br>sg=3D3
<br>[11046.575553] [drm:amdgpu_mes_unmap_legacy_queue [amdgpu]] *ERROR* fai=
led to unmap legacy queue
<br>[11046.694411] [drm:mes_v11_0_submit_pkt_and_poll_completion.constprop.=
0 [amdgpu]] *ERROR* MES failed to response m
<br>sg=3D3
<br>[11046.694569] [drm:amdgpu_mes_unmap_legacy_queue [amdgpu]] *ERROR* fai=
led to unmap legacy queue
<br>[11046.813443] [drm:mes_v11_0_submit_pkt_and_poll_completion.constprop.=
0 [amdgpu]] *ERROR* MES failed to response m
<br>sg=3D3
<br>[11046.813611] [drm:amdgpu_mes_unmap_legacy_queue [amdgpu]] *ERROR* fai=
led to unmap legacy queue
<br>[11046.932487] [drm:mes_v11_0_submit_pkt_and_poll_completion.constprop.=
0 [amdgpu]] *ERROR* MES failed to response m
<br>sg=3D3
<br>[11046.932643] [drm:amdgpu_mes_unmap_legacy_queue [amdgpu]] *ERROR* fai=
led to unmap legacy queue
<br>[11047.142627] [drm:gfx_v11_0_hw_fini [amdgpu]] *ERROR* failed to halt =
cp gfx
<br>[11047.181644] amdgpu 0000:03:00.0: amdgpu: MODE1 reset
<br>[11047.181647] amdgpu 0000:03:00.0: amdgpu: GPU mode1 reset
<br>[11047.181677] amdgpu 0000:03:00.0: amdgpu: GPU smu mode1 reset
<br>[11047.684804] amdgpu 0000:03:00.0: amdgpu: GPU reset succeeded, trying=
 to resume
<br>[11047.685054] [drm] PCIE GART of 512M enabled (table at 0x00000081FEB0=
0000).
<br>[11047.685101] [drm] VRAM is lost due to GPU reset!
<br>[11047.685103] amdgpu 0000:03:00.0: amdgpu: PSP is resuming...
<br>[11047.741780] amdgpu 0000:03:00.0: amdgpu: reserve 0x1300000 from 0x81=
fc000000 for PSP TMR
<br>[11047.836879] amdgpu 0000:03:00.0: amdgpu: RAS: optional ras ta ucode =
is not available
<br>[11047.844470] amdgpu 0000:03:00.0: amdgpu: RAP: optional rap ta ucode =
is not available
<br>[11047.844471] amdgpu 0000:03:00.0: amdgpu: SECUREDISPLAY: securedispla=
y ta ucode is not available
<br>[11047.844473] amdgpu 0000:03:00.0: amdgpu: SMU is resuming...
<br>[11047.844476] amdgpu 0000:03:00.0: amdgpu: smu driver if version =3D 0=
x00000035, smu fw if version =3D 0x00000040, smu
<br> fw program =3D 0, smu fw version =3D 0x00525800 (82.88.0)
<br>[11047.844478] amdgpu 0000:03:00.0: amdgpu: SMU driver if version not m=
atched
<br>[11047.888339] amdgpu 0000:03:00.0: amdgpu: SMU is resumed successfully=
!
<br>[11047.890114] [drm] DMUB hardware initialized: version=3D0x07002800
<br>[11048.858846] [drm] kiq ring mec 3 pipe 1 q 0
<br>[11048.861029] [drm] VCN decode and encode initialized successfully(und=
er DPG Mode).
<br>[11048.861494] amdgpu 0000:03:00.0: [drm:jpeg_v4_0_hw_init [amdgpu]] JP=
EG decode initialized successfully.
<br>[11048.861784] amdgpu 0000:03:00.0: amdgpu: ring gfx_0.0.0 uses VM inv =
eng 0 on hub 0
<br>[11048.861786] amdgpu 0000:03:00.0: amdgpu: ring comp_1.0.0 uses VM inv=
 eng 1 on hub 0
<br>[11048.861787] amdgpu 0000:03:00.0: amdgpu: ring comp_1.1.0 uses VM inv=
 eng 4 on hub 0
<br>[11048.861788] amdgpu 0000:03:00.0: amdgpu: ring comp_1.2.0 uses VM inv=
 eng 6 on hub 0
<br>[11048.861788] amdgpu 0000:03:00.0: amdgpu: ring comp_1.3.0 uses VM inv=
 eng 7 on hub 0
<br>[11048.861789] amdgpu 0000:03:00.0: amdgpu: ring comp_1.0.1 uses VM inv=
 eng 8 on hub 0
<br>[11048.861790] amdgpu 0000:03:00.0: amdgpu: ring comp_1.1.1 uses VM inv=
 eng 9 on hub 0
<br>[11048.861790] amdgpu 0000:03:00.0: amdgpu: ring comp_1.2.1 uses VM inv=
 eng 10 on hub 0
<br>[11048.861791] amdgpu 0000:03:00.0: amdgpu: ring comp_1.3.1 uses VM inv=
 eng 11 on hub 0
<br>[11048.861792] amdgpu 0000:03:00.0: amdgpu: ring sdma0 uses VM inv eng =
12 on hub 0
<br>[11048.861792] amdgpu 0000:03:00.0: amdgpu: ring sdma1 uses VM inv eng =
13 on hub 0
<br>[11048.861793] amdgpu 0000:03:00.0: amdgpu: ring vcn_unified_0 uses VM =
inv eng 0 on hub 8
<br>[11048.861794] amdgpu 0000:03:00.0: amdgpu: ring jpeg_dec uses VM inv e=
ng 1 on hub 8
<br>[11048.861795] amdgpu 0000:03:00.0: amdgpu: ring mes_kiq_3.1.0 uses VM =
inv eng 14 on hub 0
<br>[11048.868724] amdgpu 0000:03:00.0: amdgpu: recover vram bo from shadow=
 start
<br>[11048.873889] amdgpu 0000:03:00.0: amdgpu: recover vram bo from shadow=
 done
<br>[11048.873899] amdgpu 0000:03:00.0: amdgpu: GPU reset(3) succeeded!
<br>[11048.876015] [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initial=
ize parser -125!
<br>[11050.115333] show_signal: 12 callbacks suppressed
<br>[11050.115335] traps: gmain[19425] trap int3 ip:7fd6fc448a07 sp:7fd6ccb=
fe600 error:0 in libglib-2.0.so.0.8000.2[7fd
<br>6fc401000+a3000]
<br>[11059.340745] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx_0.0.=
0 timeout, but soft recovered
<br>[11069.590675] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx_0.0.=
0 timeout, signaled seq=3D7424108, emitted seq
<br>=3D7424110
<br>[11069.590893] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process infor=
mation: process plasmashell pid 19358 thread
<br> plasmashel:cs0 pid 19379
<br>[11069.591075] amdgpu 0000:03:00.0: amdgpu: GPU reset begin!
<br>[11070.067953] [drm:mes_v11_0_submit_pkt_and_poll_completion.constprop.=
0 [amdgpu]] *ERROR* MES failed to response m
<br>sg=3D3
<br>[11070.068149] [drm:amdgpu_mes_unmap_legacy_queue [amdgpu]] *ERROR* fai=
led to unmap legacy queue
<br>[11070.187027] [drm:mes_v11_0_submit_pkt_and_poll_completion.constprop.=
0 [amdgpu]] *ERROR* MES failed to response m
<br>sg=3D3
<br>[11070.187181] [drm:amdgpu_mes_unmap_legacy_queue [amdgpu]] *ERROR* fai=
led to unmap legacy queue
<br>[11070.306123] [drm:mes_v11_0_submit_pkt_and_poll_completion.constprop.=
0 [amdgpu]] *ERROR* MES failed to response m
<br>sg=3D3
<br>[11070.306275] [drm:amdgpu_mes_unmap_legacy_queue [amdgpu]] *ERROR* fai=
led to unmap legacy queue
<br>[11070.425201] [drm:mes_v11_0_submit_pkt_and_poll_completion.constprop.=
0 [amdgpu]] *ERROR* MES failed to response m
<br>sg=3D3
<br>[11070.425358] [drm:amdgpu_mes_unmap_legacy_queue [amdgpu]] *ERROR* fai=
led to unmap legacy queue
<br>[11070.544273] [drm:mes_v11_0_submit_pkt_and_poll_completion.constprop.=
0 [amdgpu]] *ERROR* MES failed to response m
<br>sg=3D3
<br>[11070.544435] [drm:amdgpu_mes_unmap_legacy_queue [amdgpu]] *ERROR* fai=
led to unmap legacy queue
<br>[11070.663360] [drm:mes_v11_0_submit_pkt_and_poll_completion.constprop.=
0 [amdgpu]] *ERROR* MES failed to response m
<br>sg=3D3
<br>[11070.663517] [drm:amdgpu_mes_unmap_legacy_queue [amdgpu]] *ERROR* fai=
led to unmap legacy queue
<br>[11070.782435] [drm:mes_v11_0_submit_pkt_and_poll_completion.constprop.=
0 [amdgpu]] *ERROR* MES failed to response m
<br>sg=3D3
<br>[11070.782589] [drm:amdgpu_mes_unmap_legacy_queue [amdgpu]] *ERROR* fai=
led to unmap legacy queue
<br>[11070.901454] [drm:mes_v11_0_submit_pkt_and_poll_completion.constprop.=
0 [amdgpu]] *ERROR* MES failed to response m
<br>sg=3D3
<br>[11070.901625] [drm:amdgpu_mes_unmap_legacy_queue [amdgpu]] *ERROR* fai=
led to unmap legacy queue
<br>[11071.020594] [drm:mes_v11_0_submit_pkt_and_poll_completion.constprop.=
0 [amdgpu]] *ERROR* MES failed to response m
<br>sg=3D3
<br>[11071.020751] [drm:amdgpu_mes_unmap_legacy_queue [amdgpu]] *ERROR* fai=
led to unmap legacy queue
<br>[11071.230709] [drm:gfx_v11_0_hw_fini [amdgpu]] *ERROR* failed to halt =
cp gfx
<br>[11071.269872] amdgpu 0000:03:00.0: amdgpu: MODE1 reset
<br>[11071.269875] amdgpu 0000:03:00.0: amdgpu: GPU mode1 reset
<br>[11071.269915] amdgpu 0000:03:00.0: amdgpu: GPU smu mode1 reset
<br>[11071.772675] amdgpu 0000:03:00.0: amdgpu: GPU reset succeeded, trying=
 to resume
<br>[11071.772955] [drm] PCIE GART of 512M enabled (table at 0x00000081FEB0=
0000).
<br>[11071.772999] [drm] VRAM is lost due to GPU reset!
<br>[11071.773000] amdgpu 0000:03:00.0: amdgpu: PSP is resuming...
<br>[11071.829626] amdgpu 0000:03:00.0: amdgpu: reserve 0x1300000 from 0x81=
fc000000 for PSP TMR
<br>[11071.924929] amdgpu 0000:03:00.0: amdgpu: RAS: optional ras ta ucode =
is not available
<br>[11071.932521] amdgpu 0000:03:00.0: amdgpu: RAP: optional rap ta ucode =
is not available
<br>[11071.932523] amdgpu 0000:03:00.0: amdgpu: SECUREDISPLAY: securedispla=
y ta ucode is not available
<br>[11071.932525] amdgpu 0000:03:00.0: amdgpu: SMU is resuming...
<br>[11071.932528] amdgpu 0000:03:00.0: amdgpu: smu driver if version =3D 0=
x00000035, smu fw if version =3D 0x00000040, smu
<br> fw program =3D 0, smu fw version =3D 0x00525800 (82.88.0)
<br>[11071.932530] amdgpu 0000:03:00.0: amdgpu: SMU driver if version not m=
atched
<br>[11071.975910] amdgpu 0000:03:00.0: amdgpu: SMU is resumed successfully=
!
<br>[11071.977679] [drm] DMUB hardware initialized: version=3D0x07002800
<br>[11072.922122] [drm] kiq ring mec 3 pipe 1 q 0
<br>[11072.924738] [drm] VCN decode and encode initialized successfully(und=
er DPG Mode).
<br>[11072.925173] amdgpu 0000:03:00.0: [drm:jpeg_v4_0_hw_init [amdgpu]] JP=
EG decode initialized successfully.
<br>[11072.925478] amdgpu 0000:03:00.0: amdgpu: ring gfx_0.0.0 uses VM inv =
eng 0 on hub 0
<br>[11072.925480] amdgpu 0000:03:00.0: amdgpu: ring comp_1.0.0 uses VM inv=
 eng 1 on hub 0
<br>[11072.925481] amdgpu 0000:03:00.0: amdgpu: ring comp_1.1.0 uses VM inv=
 eng 4 on hub 0
<br>[11072.925481] amdgpu 0000:03:00.0: amdgpu: ring comp_1.2.0 uses VM inv=
 eng 6 on hub 0
<br>[11072.925482] amdgpu 0000:03:00.0: amdgpu: ring comp_1.3.0 uses VM inv=
 eng 7 on hub 0
<br>[11072.925483] amdgpu 0000:03:00.0: amdgpu: ring comp_1.0.1 uses VM inv=
 eng 8 on hub 0
<br>[11072.925483] amdgpu 0000:03:00.0: amdgpu: ring comp_1.1.1 uses VM inv=
 eng 9 on hub 0
<br>[11072.925484] amdgpu 0000:03:00.0: amdgpu: ring comp_1.2.1 uses VM inv=
 eng 10 on hub 0
<br>[11072.925485] amdgpu 0000:03:00.0: amdgpu: ring comp_1.3.1 uses VM inv=
 eng 11 on hub 0
<br>[11072.925486] amdgpu 0000:03:00.0: amdgpu: ring sdma0 uses VM inv eng =
12 on hub 0
<br>[11072.925486] amdgpu 0000:03:00.0: amdgpu: ring sdma1 uses VM inv eng =
13 on hub 0
<br>[11072.925487] amdgpu 0000:03:00.0: amdgpu: ring vcn_unified_0 uses VM =
inv eng 0 on hub 8
<br>[11072.925488] amdgpu 0000:03:00.0: amdgpu: ring jpeg_dec uses VM inv e=
ng 1 on hub 8
<br>[11072.925489] amdgpu 0000:03:00.0: amdgpu: ring mes_kiq_3.1.0 uses VM =
inv eng 14 on hub 0
<br>[11072.933072] amdgpu 0000:03:00.0: amdgpu: recover vram bo from shadow=
 start
<br>[11072.938630] amdgpu 0000:03:00.0: amdgpu: recover vram bo from shadow=
 done
<br>[11072.938642] amdgpu 0000:03:00.0: amdgpu: GPU reset(6) succeeded!
<br>[11072.967911] firefox:cs0[19618]: segfault at 0 ip 0000559c177fbe33 sp=
 00007f9aacdff9a0 error 6 in firefox[559c177
<br>e8000+5a000] likely on CPU 13 (core 8, socket 0)
<br>[11072.967928] Code: 48 8b 2d c0 f1 05 00 48 8b 75 00 e8 57 cf fe ff 48=
 8b 75 00 bf 0a 00 00 00 e8 d9 cf fe ff 48 8
<br>d 05 92 f4 05 00 48 89 18 31 d2 &lt;89&gt; 14 25 00 00 00 00 0f 0b f3 0=
f 1e fa 50 58 48 8d 3d 0f 91 04 00
<br>[11074.076807] snd_hdac_bus_update_rirb: 184 callbacks suppressed
<br>[11074.076811] snd_hda_intel 0000:03:00.1: spurious response 0x0:0x0, l=
ast cmd=3D0x570740
<br>[11074.076817] snd_hda_intel 0000:03:00.1: spurious response 0x600:0x0,=
 last cmd=3D0x770740
<br>[11074.076821] snd_hda_intel 0000:03:00.1: spurious response 0x0:0x0, l=
ast cmd=3D0x970740
<br>[11074.076822] snd_hda_intel 0000:03:00.1: spurious response 0x0:0x0, l=
ast cmd=3D0x377200
<br>[11074.076823] snd_hda_intel 0000:03:00.1: spurious response 0x0:0x0, l=
ast cmd=3D0x377200
<br>[11074.076827] snd_hda_intel 0000:03:00.1: spurious response 0x0:0x0, l=
ast cmd=3D0x378901
<br>[11074.076827] snd_hda_intel 0000:03:00.1: spurious response 0x0:0x0, l=
ast cmd=3D0x378901
<br>[11074.076835] snd_hda_intel 0000:03:00.1: spurious response 0x0:0x0, l=
ast cmd=3D0x578901
<br>[11074.076836] snd_hda_intel 0000:03:00.1: spurious response 0x0:0x0, l=
ast cmd=3D0x578901
<br>[11074.076841] snd_hda_intel 0000:03:00.1: spurious response 0x0:0x0, l=
ast cmd=3D0x777200
<br>[11083.404491] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx_0.0.=
0 timeout, but soft recovered
<br>[11093.644242] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx_0.0.=
0 timeout, but soft recovered
<br>[11095.885288] systemd-coredump[20024]: Failed to get EXE, ignoring: No=
 such process
<br>[11103.884167] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx_0.0.=
0 timeout, but soft recovered
<br>[11243.387807] snd_hdac_bus_update_rirb: 49 callbacks suppressed
<br>[11243.387812] snd_hda_intel 0000:03:00.1: spurious response 0x0:0x0, l=
ast cmd=3D0x220000
<br>[11243.387818] snd_hda_intel 0000:03:00.1: spurious response 0x0:0x0, l=
ast cmd=3D0x220000
<br>[12426.413313] SGI XFS with ACLs, security attributes, realtime, scrub,=
 quota, no debug enabled
<br>[12426.430616] JFS: nTxBlock =3D 8192, nTxLock =3D 65536<br>
<br><br></span></div></div>

--0000000000003df26d06188b9203--
