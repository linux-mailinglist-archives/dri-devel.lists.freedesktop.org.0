Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB504C6B10
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 12:45:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82C6410E4FE;
	Mon, 28 Feb 2022 11:45:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa31.google.com (mail-vk1-xa31.google.com
 [IPv6:2607:f8b0:4864:20::a31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B24D710E1D8;
 Sat, 26 Feb 2022 15:17:19 +0000 (UTC)
Received: by mail-vk1-xa31.google.com with SMTP id f12so3049387vkl.2;
 Sat, 26 Feb 2022 07:17:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=qgrCf+cGaVt8js2qcg3VtifEUnd2BTvcQSI2avBElxQ=;
 b=YinRP1/MQDDfGvxMSq1aa3si46mJlzcoAeYHYqPGC2GOkqXNRGaPtycb0QMZjyrPkO
 TIE9qW3d+NBONsMeFLLDFNjgYc3Dah00a8YMt8UrsfLY1DkW40Y/4BAcg8RLG0roa2Y/
 kb1bmea3kP8Sffl9A7oZIWvOEIXOXhGJZxK/xNz/+TyLeXVRNAHk9w9uIUBJqCvqeFBA
 6b6Ruspw4W0cIJyLx4SW0u8YoeL/1fkRhwx54hTgNWkhunsT/PB2lrQPG1vTEjxI57kE
 7dqWDLIcTzPdDlBlphjYOn1A+qrr7l0D/CIkGX+LNMKvVn+Ugh/YiJWRFX67ttTJvnCp
 flgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=qgrCf+cGaVt8js2qcg3VtifEUnd2BTvcQSI2avBElxQ=;
 b=ZHNM527Zh3wTSBy4IDnF8urm6onUPn461jV9dd6k7+Jp7BjAZna9hxMx4759kuGG8x
 35b4xVofKlalTpuOhP8IUksMDm3UplCPn+8smuN8VuLqi7YUZuw1IiCUlQ/hL+P15I73
 uztJM1di4hIa8jLSSDv9S4qIw60nhY0KXYXIL0EROp0WLbS0c5c8e0ZNM5/dicRghjrW
 HZ51DKW1dQaLwa50E4FOGZt7RxsnfcKS9qxVmwQ8hXHqRlgTOSB03/++kKKzC+ybHTug
 1ZqgKY5ltlN4TEjFjbpkdYh2adyzuyqYje5CXcvi+9XI54DgZCQOyg7SYwdzfy9TBQQj
 sBXg==
X-Gm-Message-State: AOAM5320zzTeNCfziRgueWOnHA7JbX8n76ylZyV7DuIEbO6urfi7VGWN
 /yyRyBr0/gzuZO7DemdM/gOVMZDPLibOfMS6GM+TlMrnrwMZ+ol2
X-Google-Smtp-Source: ABdhPJzLxkiqY0r1DSEgOMgrNJ8xMmuAfGc/SM0T/gmawYZr9zceznpJuNzdyR33/iusKI4BOaZdGPu94BMiOWGAfxg=
X-Received: by 2002:a05:6122:d11:b0:331:2101:1238 with SMTP id
 az17-20020a0561220d1100b0033121011238mr5640973vkb.22.1645888638205; Sat, 26
 Feb 2022 07:17:18 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?B?RMSBdmlzIE1vc8SBbnM=?= <davispuh@gmail.com>
Date: Sat, 26 Feb 2022 17:17:07 +0200
Message-ID: <CAOE4rSxqaB6HBqG-nbsi9SWS1yhK10zuHfime_jejrrHMKdKwg@mail.gmail.com>
Subject: amdgpu: sometimes black screen
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 28 Feb 2022 11:45:00 +0000
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

Hi,

I've Gigabyte Radeon RX Vega 64 and sometimes when booting it doesn't
give any signal to monitor over DisplayPort. Rebooting usually helps
and it works fine after. Not sure if it's hardware or software issue.

In dmesg only suspicious thing I see is many

[drm] perform_link_training_with_retries: Link training attempt 3 of 4 fail=
ed

Any ideas? Also is there some way to force reload/turn on signal so I
don't need to reboot?

[    0.640199] ACPI: bus type drm_connector registered
[    0.654114] efifb: probing for efifb
[    0.654180] efifb: No BGRT, not showing boot graphics
[    0.654181] efifb: framebuffer at 0x80000000, using 3072k, total 3072k
[    0.654183] efifb: mode is 1024x768x32, linelength=3D4096, pages=3D1
[    0.654184] efifb: scrolling: redraw
[    0.654185] efifb: Truecolor: size=3D8:8:8:8, shift=3D24:16:8:0
[    0.654400] fbcon: Deferring console take-over
[    0.654407] fb0: EFI VGA frame buffer device
[    3.413771] fbcon: Taking over console
[    3.721845] [drm] amdgpu kernel modesetting enabled.
[    3.722127] amdgpu: Ignoring ACPI CRAT on non-APU system
[    3.722132] amdgpu: Virtual CRAT table created for CPU
[    3.722294] amdgpu: Topology: Add CPU node
[    3.722558] amdgpu 0000:44:00.0: runtime IRQ mapping not provided by arc=
h
[    3.722589] fb0: switching to amdgpu from EFI VGA
[    3.724054] amdgpu 0000:44:00.0: vgaarb: deactivate vga console
[    3.724419] [drm] initializing kernel modesetting (VEGA10
0x1002:0x687F 0x1002:0x6B76 0xC1).
[    3.724432] amdgpu 0000:44:00.0: amdgpu: Trusted Memory Zone (TMZ)
feature not supported
[    3.724453] [drm] register mmio base: 0x9F000000
[    3.724455] [drm] register mmio size: 524288
[    3.724483] [drm] add ip block number 0 <soc15_common>
[    3.724486] [drm] add ip block number 1 <gmc_v9_0>
[    3.724488] [drm] add ip block number 2 <vega10_ih>
[    3.724489] [drm] add ip block number 3 <psp>
[    3.724490] [drm] add ip block number 4 <powerplay>
[    3.724492] [drm] add ip block number 5 <dm>
[    3.724493] [drm] add ip block number 6 <gfx_v9_0>
[    3.724494] [drm] add ip block number 7 <sdma_v4_0>
[    3.724495] [drm] add ip block number 8 <uvd_v7_0>
[    3.724497] [drm] add ip block number 9 <vce_v4_0>
[    3.726255] amdgpu 0000:44:00.0: No more image in the PCI ROM
[    3.726277] amdgpu 0000:44:00.0: amdgpu: Fetched VBIOS from ROM BAR
[    3.726280] amdgpu: ATOM BIOS: 113-D0501400-101
[    3.730100] [drm] UVD(0) is enabled in VM mode
[    3.730105] [drm] UVD(0) ENC is enabled in VM mode
[    3.730107] [drm] VCE enabled in VM mode
[    3.730460] amdgpu 0000:44:00.0: amdgpu: MEM ECC is not presented.
[    3.730462] amdgpu 0000:44:00.0: amdgpu: SRAM ECC is not presented.
[    3.730470] [drm] vm size is 262144 GB, 4 levels, block size is
9-bit, fragment size is 9-bit
[    3.730487] amdgpu 0000:44:00.0: BAR 2: releasing [mem
0x90000000-0x901fffff 64bit pref]
[    3.730491] amdgpu 0000:44:00.0: BAR 0: releasing [mem
0x80000000-0x8fffffff 64bit pref]
[    3.730568] amdgpu 0000:44:00.0: BAR 0: assigned [mem
0x48000000000-0x481ffffffff 64bit pref]
[    3.730583] amdgpu 0000:44:00.0: BAR 2: assigned [mem
0x47f00000000-0x47f001fffff 64bit pref]
[    3.730648] amdgpu 0000:44:00.0: amdgpu: VRAM: 8176M
0x000000F400000000 - 0x000000F5FEFFFFFF (8176M used)
[    3.730651] amdgpu 0000:44:00.0: amdgpu: GART: 512M
0x0000000000000000 - 0x000000001FFFFFFF
[    3.730653] amdgpu 0000:44:00.0: amdgpu: AGP: 267419648M
0x000000F800000000 - 0x0000FFFFFFFFFFFF
[    3.730661] [drm] Detected VRAM RAM=3D8176M, BAR=3D8192M
[    3.730662] [drm] RAM width 2048bits HBM
[    3.731219] [drm] amdgpu: 8176M of VRAM memory ready
[    3.731223] [drm] amdgpu: 8176M of GTT memory ready.
[    3.731237] [drm] GART: num cpu pages 131072, num gpu pages 131072
[    3.731521] [drm] PCIE GART of 512M enabled.
[    3.731523] [drm] PTB located at 0x000000F400900000
[    3.737412] amdgpu 0000:44:00.0: amdgpu: PSP runtime database doesn't ex=
ist
[    3.737422] amdgpu: hwmgr_sw_init smu backed is vega10_smu
[    3.782923] [drm] Found UVD firmware Version: 66.43 Family ID: 17
[    3.782983] [drm] PSP loading UVD firmware
[    3.794121] [drm] Found VCE firmware Version: 57.6 Binary ID: 4
[    3.794181] [drm] PSP loading VCE firmware
[    3.983603] [drm] reserve 0x400000 from 0xf5fec00000 for PSP TMR
[    4.043970] [drm] Display Core initialized with v3.2.167!
[    4.236220] [drm] kiq ring mec 2 pipe 1 q 0
[    4.258101] [drm] UVD and UVD ENC initialized successfully.
[    4.358563] [drm] VCE initialized successfully.
[    4.360719] kfd kfd: amdgpu: Allocated 3969056 bytes on gart
[    4.399639] amdgpu: HMM registered 8176MB device memory
[    4.402935] amdgpu: SRAT table not found
[    4.402936] amdgpu: Virtual CRAT table created for GPU
[    4.403647] amdgpu: Topology: Add dGPU node [0x687f:0x1002]
[    4.403658] kfd kfd: amdgpu: added device 1002:687f
[    4.403689] amdgpu 0000:44:00.0: amdgpu: SE 4, SH per SE 1, CU per
SH 16, active_cu_number 64
[    4.403989] amdgpu 0000:44:00.0: amdgpu: ring gfx uses VM inv eng 0 on h=
ub 0
[    4.403992] amdgpu 0000:44:00.0: amdgpu: ring comp_1.0.0 uses VM
inv eng 1 on hub 0
[    4.403994] amdgpu 0000:44:00.0: amdgpu: ring comp_1.1.0 uses VM
inv eng 4 on hub 0
[    4.403995] amdgpu 0000:44:00.0: amdgpu: ring comp_1.2.0 uses VM
inv eng 5 on hub 0
[    4.403996] amdgpu 0000:44:00.0: amdgpu: ring comp_1.3.0 uses VM
inv eng 6 on hub 0
[    4.403998] amdgpu 0000:44:00.0: amdgpu: ring comp_1.0.1 uses VM
inv eng 7 on hub 0
[    4.403999] amdgpu 0000:44:00.0: amdgpu: ring comp_1.1.1 uses VM
inv eng 8 on hub 0
[    4.404000] amdgpu 0000:44:00.0: amdgpu: ring comp_1.2.1 uses VM
inv eng 9 on hub 0
[    4.404001] amdgpu 0000:44:00.0: amdgpu: ring comp_1.3.1 uses VM
inv eng 10 on hub 0
[    4.404003] amdgpu 0000:44:00.0: amdgpu: ring kiq_2.1.0 uses VM inv
eng 11 on hub 0
[    4.404004] amdgpu 0000:44:00.0: amdgpu: ring sdma0 uses VM inv eng
0 on hub 1
[    4.404005] amdgpu 0000:44:00.0: amdgpu: ring page0 uses VM inv eng
1 on hub 1
[    4.404007] amdgpu 0000:44:00.0: amdgpu: ring sdma1 uses VM inv eng
4 on hub 1
[    4.404008] amdgpu 0000:44:00.0: amdgpu: ring page1 uses VM inv eng
5 on hub 1
[    4.404010] amdgpu 0000:44:00.0: amdgpu: ring uvd_0 uses VM inv eng
6 on hub 1
[    4.404011] amdgpu 0000:44:00.0: amdgpu: ring uvd_enc_0.0 uses VM
inv eng 7 on hub 1
[    4.404013] amdgpu 0000:44:00.0: amdgpu: ring uvd_enc_0.1 uses VM
inv eng 8 on hub 1
[    4.404014] amdgpu 0000:44:00.0: amdgpu: ring vce0 uses VM inv eng 9 on =
hub 1
[    4.404015] amdgpu 0000:44:00.0: amdgpu: ring vce1 uses VM inv eng
10 on hub 1
[    4.404016] amdgpu 0000:44:00.0: amdgpu: ring vce2 uses VM inv eng
11 on hub 1
[    4.404727] amdgpu 0000:44:00.0: saving config space at offset 0x0
(reading 0x687f1002)
[    4.404730] amdgpu 0000:44:00.0: saving config space at offset 0x4
(reading 0x100407)
[    4.404732] amdgpu 0000:44:00.0: saving config space at offset 0x8
(reading 0x30000c1)
[    4.404734] amdgpu 0000:44:00.0: saving config space at offset 0xc
(reading 0x800010)
[    4.404736] amdgpu 0000:44:00.0: saving config space at offset 0x10
(reading 0xc)
[    4.404738] amdgpu 0000:44:00.0: saving config space at offset 0x14
(reading 0x480)
[    4.404741] amdgpu 0000:44:00.0: saving config space at offset 0x18
(reading 0xc)
[    4.404743] amdgpu 0000:44:00.0: saving config space at offset 0x1c
(reading 0x47f)
[    4.404745] amdgpu 0000:44:00.0: saving config space at offset 0x20
(reading 0x4001)
[    4.404747] amdgpu 0000:44:00.0: saving config space at offset 0x24
(reading 0x9f000000)
[    4.404749] amdgpu 0000:44:00.0: saving config space at offset 0x28
(reading 0x0)
[    4.404751] amdgpu 0000:44:00.0: saving config space at offset 0x2c
(reading 0x6b761002)
[    4.404753] amdgpu 0000:44:00.0: saving config space at offset 0x30
(reading 0x9f080000)
[    4.404755] amdgpu 0000:44:00.0: saving config space at offset 0x34
(reading 0x48)
[    4.404757] amdgpu 0000:44:00.0: saving config space at offset 0x38
(reading 0x0)
[    4.404759] amdgpu 0000:44:00.0: saving config space at offset 0x3c
(reading 0x10a)
[    4.404868] amdgpu 0000:44:00.0: restoring config space at offset
0x1c (was 0x0, writing 0x47f)
[    4.404873] amdgpu 0000:44:00.0: restoring config space at offset
0x14 (was 0x0, writing 0x480)
[    4.407571] [drm] Initialized amdgpu 3.44.0 20150101 for
0000:44:00.0 on minor 0
[    4.414034] fbcon: amdgpudrmfb (fb0) is primary device
[    4.580097] amdgpu 0000:44:00.0: [drm] fb0: amdgpudrmfb frame buffer dev=
ice
[    7.055674] [drm] perform_link_training_with_retries: Link training
attempt 1 of 4 failed
[    7.189006] [drm] perform_link_training_with_retries: Link training
attempt 2 of 4 failed
[    7.372339] [drm] perform_link_training_with_retries: Link training
attempt 3 of 4 failed
[    7.605672] [drm] enabling link 0 failed: 15
[    7.762340] [drm] perform_link_training_with_retries: Link training
attempt 1 of 4 failed
[    7.895672] [drm] perform_link_training_with_retries: Link training
attempt 2 of 4 failed
[    8.078980] [drm] perform_link_training_with_retries: Link training
attempt 3 of 4 failed
[    8.629006] [drm] perform_link_training_with_retries: Link training
attempt 1 of 4 failed
[    8.762327] [drm] perform_link_training_with_retries: Link training
attempt 2 of 4 failed
[    8.945665] [drm] perform_link_training_with_retries: Link training
attempt 3 of 4 failed
[    9.179005] [drm] enabling link 0 failed: 15
[    9.332339] [drm] perform_link_training_with_retries: Link training
attempt 1 of 4 failed
[    9.465655] [drm] perform_link_training_with_retries: Link training
attempt 2 of 4 failed
[    9.648988] [drm] perform_link_training_with_retries: Link training
attempt 3 of 4 failed
[    9.882339] [drm] enabling link 0 failed: 15
[   10.035670] [drm] perform_link_training_with_retries: Link training
attempt 1 of 4 failed
[   10.168989] [drm] perform_link_training_with_retries: Link training
attempt 2 of 4 failed
[   10.352324] [drm] perform_link_training_with_retries: Link training
attempt 3 of 4 failed
[   10.585671] [drm] enabling link 0 failed: 15
[   10.742338] [drm] perform_link_training_with_retries: Link training
attempt 1 of 4 failed
[   10.879005] [drm] perform_link_training_with_retries: Link training
attempt 2 of 4 failed
[   11.062339] [drm] perform_link_training_with_retries: Link training
attempt 3 of 4 failed
[   11.295672] [drm] enabling link 0 failed: 15
[   11.452338] [drm] perform_link_training_with_retries: Link training
attempt 1 of 4 failed
[   11.585656] [drm] perform_link_training_with_retries: Link training
attempt 2 of 4 failed
[   11.768996] [drm] perform_link_training_with_retries: Link training
attempt 3 of 4 failed
[   12.002339] [drm] enabling link 0 failed: 15
[   12.155672] [drm] perform_link_training_with_retries: Link training
attempt 1 of 4 failed
[   12.288993] [drm] perform_link_training_with_retries: Link training
attempt 2 of 4 failed
[   12.472325] [drm] perform_link_training_with_retries: Link training
attempt 3 of 4 failed
[   64.884452] systemd[1]: Starting Load Kernel Module drm...
[  103.465636] [drm] perform_link_training_with_retries: Link training
attempt 1 of 4 failed
[  103.598976] [drm] perform_link_training_with_retries: Link training
attempt 2 of 4 failed
[  103.782293] [drm] perform_link_training_with_retries: Link training
attempt 3 of 4 failed
[  104.015631] [drm] enabling link 0 failed: 15
[  104.172276] [drm] perform_link_training_with_retries: Link training
attempt 1 of 4 failed
[  104.305830] [drm] perform_link_training_with_retries: Link training
attempt 2 of 4 failed
[  104.488964] [drm] perform_link_training_with_retries: Link training
attempt 3 of 4 failed
[  104.725642] [drm] enabling link 0 failed: 15
[  104.882326] [drm] perform_link_training_with_retries: Link training
attempt 1 of 4 failed
[  105.015640] [drm] perform_link_training_with_retries: Link training
attempt 2 of 4 failed
[  105.205781] [drm] perform_link_training_with_retries: Link training
attempt 3 of 4 failed
[  105.438997] [drm] enabling link 0 failed: 15
[  105.595654] [drm] perform_link_training_with_retries: Link training
attempt 1 of 4 failed
[  105.729193] [drm] perform_link_training_with_retries: Link training
attempt 2 of 4 failed
[  105.912312] [drm] perform_link_training_with_retries: Link training
attempt 3 of 4 failed
[  106.148975] [drm] enabling link 0 failed: 15
[  106.305657] [drm] perform_link_training_with_retries: Link training
attempt 1 of 4 failed
[  106.438990] [drm] perform_link_training_with_retries: Link training
attempt 2 of 4 failed
[  106.622306] [drm] perform_link_training_with_retries: Link training
attempt 3 of 4 failed
[  106.865660] [drm] enabling link 0 failed: 15
[  107.022297] [drm] perform_link_training_with_retries: Link training
attempt 1 of 4 failed
[  107.155643] [drm] perform_link_training_with_retries: Link training
attempt 2 of 4 failed
[  149.988227] [drm] perform_link_training_with_retries: Link training
attempt 1 of 4 failed
[  150.121542] [drm] perform_link_training_with_retries: Link training
attempt 2 of 4 failed
[  150.304872] [drm] perform_link_training_with_retries: Link training
attempt 3 of 4 failed
[  150.538039] [drm] enabling link 0 failed: 15
[  150.694694] [drm] perform_link_training_with_retries: Link training
attempt 1 of 4 failed
[  150.828034] [drm] perform_link_training_with_retries: Link training
attempt 2 of 4 failed
[  151.011341] [drm] perform_link_training_with_retries: Link training
attempt 3 of 4 failed
[  151.244684] [drm] enabling link 0 failed: 15
[  151.401333] [drm] perform_link_training_with_retries: Link training
attempt 1 of 4 failed
[  151.534668] [drm] perform_link_training_with_retries: Link training
attempt 2 of 4 failed
[  151.718002] [drm] perform_link_training_with_retries: Link training
attempt 3 of 4 failed
[  151.951311] [drm] enabling link 0 failed: 15
[  152.107978] [drm] perform_link_training_with_retries: Link training
attempt 1 of 4 failed
[  152.241450] [drm] perform_link_training_with_retries: Link training
attempt 2 of 4 failed
[  152.424628] [drm] perform_link_training_with_retries: Link training
attempt 3 of 4 failed
[  152.657944] [drm] enabling link 0 failed: 15
[  152.811301] [drm] perform_link_training_with_retries: Link training
attempt 1 of 4 failed
[  152.947928] [drm] perform_link_training_with_retries: Link training
attempt 2 of 4 failed
[  153.131275] [drm] perform_link_training_with_retries: Link training
attempt 3 of 4 failed
[  153.364589] [drm] enabling link 0 failed: 15
[  153.521261] [drm] perform_link_training_with_retries: Link training
attempt 1 of 4 failed
[  153.654599] [drm] perform_link_training_with_retries: Link training
attempt 2 of 4 failed
[  273.063427] [drm] perform_link_training_with_retries: Link training
attempt 1 of 4 failed
[  273.196758] [drm] perform_link_training_with_retries: Link training
attempt 2 of 4 failed
[  273.380256] [drm] perform_link_training_with_retries: Link training
attempt 3 of 4 failed
[  273.616734] [drm] enabling link 0 failed: 15
[  287.793094] [drm] perform_link_training_with_retries: Link training
attempt 1 of 4 failed
[  287.926437] [drm] perform_link_training_with_retries: Link training
attempt 2 of 4 failed
[  288.109752] [drm] perform_link_training_with_retries: Link training
attempt 3 of 4 failed
[  288.343381] [drm] enabling link 0 failed: 15
[  288.499939] [drm] perform_link_training_with_retries: Link training
attempt 1 of 4 failed
[  288.633079] [drm] perform_link_training_with_retries: Link training
attempt 2 of 4 failed
[  288.816410] [drm] perform_link_training_with_retries: Link training
attempt 3 of 4 failed
[  289.049736] [drm] enabling link 0 failed: 15
[  289.203280] [drm] perform_link_training_with_retries: Link training
attempt 1 of 4 failed
[  289.336396] [drm] perform_link_training_with_retries: Link training
attempt 2 of 4 failed
[  289.519911] [drm] perform_link_training_with_retries: Link training
attempt 3 of 4 failed
[  289.753056] [drm] enabling link 0 failed: 15
[  289.906376] [drm] perform_link_training_with_retries: Link training
attempt 1 of 4 failed
[  290.039722] [drm] perform_link_training_with_retries: Link training
attempt 2 of 4 failed
[  290.223035] [drm] perform_link_training_with_retries: Link training
attempt 3 of 4 failed
[  290.456379] [drm] enabling link 0 failed: 15
[  290.609709] [drm] perform_link_training_with_retries: Link training
attempt 1 of 4 failed
[  290.743045] [drm] perform_link_training_with_retries: Link training
attempt 2 of 4 failed
[  290.926350] [drm] perform_link_training_with_retries: Link training
attempt 3 of 4 failed
[  291.159839] [drm] enabling link 0 failed: 15
[  291.316337] [drm] perform_link_training_with_retries: Link training
attempt 1 of 4 failed
[  291.449673] [drm] perform_link_training_with_retries: Link training
attempt 2 of 4 failed
[  431.479081] [drm] perform_link_training_with_retries: Link training
attempt 1 of 4 failed
[  431.612400] [drm] perform_link_training_with_retries: Link training
attempt 2 of 4 failed
[  431.795718] [drm] perform_link_training_with_retries: Link training
attempt 3 of 4 failed
[  432.029062] [drm] enabling link 0 failed: 15
[  432.182386] [drm] perform_link_training_with_retries: Link training
attempt 1 of 4 failed
[  432.315714] [drm] perform_link_training_with_retries: Link training
attempt 2 of 4 failed
[  432.499024] [drm] perform_link_training_with_retries: Link training
attempt 3 of 4 failed
[  432.732368] [drm] enabling link 0 failed: 15
[  432.885693] [drm] perform_link_training_with_retries: Link training
attempt 1 of 4 failed
[  433.019001] [drm] perform_link_training_with_retries: Link training
attempt 2 of 4 failed
[  433.202322] [drm] perform_link_training_with_retries: Link training
attempt 3 of 4 failed
[  433.435672] [drm] enabling link 0 failed: 15
[  433.592315] [drm] perform_link_training_with_retries: Link training
attempt 1 of 4 failed
[  433.725656] [drm] perform_link_training_with_retries: Link training
attempt 2 of 4 failed
[  433.908974] [drm] perform_link_training_with_retries: Link training
attempt 3 of 4 failed
[  434.142313] [drm] enabling link 0 failed: 15
[  434.295624] [drm] perform_link_training_with_retries: Link training
attempt 1 of 4 failed
[  434.428955] [drm] perform_link_training_with_retries: Link training
attempt 2 of 4 failed
[  434.612288] [drm] perform_link_training_with_retries: Link training
attempt 3 of 4 failed
[  434.845598] [drm] enabling link 0 failed: 15
[  434.998948] [drm] perform_link_training_with_retries: Link training
attempt 1 of 4 failed
[  435.132258] [drm] perform_link_training_with_retries: Link training
attempt 2 of 4 failed

Best regards,
D=C4=81vis
