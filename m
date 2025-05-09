Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 926FAAB0BC0
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 09:33:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07F0E10E3C3;
	Fri,  9 May 2025 07:33:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic311-28.consmr.mail.ne1.yahoo.com
 (sonic311-28.consmr.mail.ne1.yahoo.com [66.163.188.209])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E808910E226
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 00:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=att.net; s=s1024;
 t=1746749282; bh=yqGTZNCwtWPBMnUUHpjKlNio/QIaDBuQFC307z31YTc=;
 h=Date:From:Subject:To:Cc:References:From:Subject:Reply-To;
 b=yLZxiFqc7J8Aq2FENIlSVZrpHb7iwlmTog5nUOB8fOcndHgxyKejOyB8Ev30kgQZtveqA2Vu7iku+BSxZV1yrpQ1qFcTdd6MTKmvcn0oMWK/k+67SJyUBdtnCgAKtH2mz9Qz2G5AVT/RX8B27bqWXFwMkqOpU192JINErqVA2/4=
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1746749282; bh=wxRy/Qqm6CiCDK8KoM6XLf5Wz1n/a/82DD9obhVjgEM=;
 h=X-Sonic-MF:Date:From:Subject:To:From:Subject;
 b=PWWfw6SKoW7gEBEHLzaBkKhiUoynTSfbCvV2dXzatQKPjHFsuKBn9mp46xQW+acafbXlhAB5vL8+pVIVjtYlZyZNhEd3CNzZMyJSv9MDbsLTWC9Z11ivPmDPNvFUDHvrsMEcEPAoA0pFgJAedOw3NmXPxF2bdVl7XsOhOtAHRFz0cE5SpUzTUam1vP3clY75NehpfksQ5bQA8ERSS9zbPfagLGuyVBt9XFTzmvO6lq5sr5rgyckeO5xUY8aPsZgwOHA3FkEo7AaN8j/7e469j3PO7hLJdQab3JIuUtrA8w/XMXgP/QKBzT9FP1tcKKh8o+F2pOdcFBYcLHDb8ej1qQ==
X-YMail-OSG: lufhLMsVM1mvbPkDduOzIotAp0ytWCcfHm5DfQJA3VFoPGykEnv_hSKQLiGI_Zt
 jxYLVVzynhu65CVFtWiDx1dZJMED4x.BbKQx7LmRGFwQl3e2_uabx9Nttd9AIdbkOQrO3KzXkHFO
 lFfOp9Z5toP03tKbrJISTzChoRsgllxu2TgUTPQyh8ThuhyUrllXeKkCDfprAbe_1CUpUi9xHcrh
 kROCoaslLUqqcDsZO24SRhNFieiWG8xWPevMMT7l6eh_8Py.Pr6PvXhSXtdZQQau536on8GCYiyt
 nQa2uSmPZwGLHlGXpVX651jzSGMHl6WsVAkRDrAJj9QzQIrVTd70GIL4_6MCVsa9vVMYZeHcdWPq
 df84ra690Tx_m1oqJ.hK7POj5D9Gtidx34COTHthWCPAsIahNoakpRHTGxWeluiTQatJ6yWCw5Jn
 iTR7lXYLK7WpA8vhN4NYiixG1PB99wYEU3MYkHCD.y9q01BnKXuSz2w40jRPqLxo0A0mRuNsxPjs
 r0skXp_LMMY6Xum3IaMfvnF6PH7FOtgdA3IDYUQ2LIa5hr3iyu1TS2f93VMfH8_nU0S4zWGS32NN
 5iwLKQh9HV8W4uiq8n8Kqx_FU1_6CbN9S2ydDOj1xRjOB3r4Zv3X8PbF8ywP0DtVABAqjWRGNciI
 BVtdVO55FPUwGBxZ9qPSvQjIe.DMiR5PvFNQ37UPawW9vJjJTCxwqCwUvqjzivuLQixKBZaIFsHX
 hJf530.IJcPM4j8iotH72azieo2cKJiBnKcDHtNNr_MI.U.CcIAaoYBmURHJO5.p5OxMP8bqBYT2
 HygYqJN8Bf6_.EGghU.pTgjNqCPUHJ_97RHsMm38Nv2gNVk3kNYYqAh4YIZTs.uNGOgBP5zWo8DK
 BAY0ZTv4x3YVZk5sxFvSE.z95eJt_bWtob2v4sxE88ttJ.4H7cIfu2874JZB4hKQEDnzg1BKf6bu
 .ZU7P_Lv6lo7u_nzQStXmJv.LpBiXRrz0VdLRnDEz9eQjl5m3eNHb65JHqc1LqjbfRrbs3vc7vvn
 PknMPTrYLB9XCw9bHDJh7rVnZc7Z6YOEg1Fv6s0JR.1.j4O1lz_T17lZ4EXdq4Nh1SoJW.uMknEQ
 .Rf8dWLedxND70Jt9wckjViaUeuXmn0RMNymlgLbzKB4M3QpqkZEsKf7fCjIn5itjPbeUaUugSLT
 QsJ_nu5Qech5zpOv3eCTFX6.oB6kt8dFSCyYhW4XI2faKH38JltwgAatJbu2wWQ.vgQUecmI4wx8
 Euq74al8q7LYBNHCzW3lxiCi_lYsbhmyWNgqJI_9JMJ1YXZ2N_g1KMLd_v0m8_4svoYmd0wC87yx
 8VFXc4lsnKi2djmw3Fe.SoKuGRrNnNG3ew4XYKs_njZcax2Iyedr7tYusIDkSsfGyFQXfB6ILNzL
 BYekcnMznelorA5UrlGQPX8PzJLj14rYPzA7Jp8KkUmPGlqOBY66yQ6VYP6knEyutWkHs1a2ukAA
 H527ZZVgjRD32z4N.a25b_UnEgtmOAs2iS6DWxD9NAOLR2cB3Vz2ZcUn42ob5RiSH0DGZQd3yEG0
 YH.48qqdyNI8S.Ul25LykzddnoASALs.jZrklWyg.S2_uYWNLG0ccUKxOlSbSh.dJZYdDB3OIQIH
 4etvqUajmNL18pRhAusccobOyXhkd7.upXqudq384n3gycxOSsB4L03B3MU6Kah.8ZoGmrWcEt6z
 TveCVitgDwF55NmpViB0Lg.WWyd.Uh3df0nRxK4LSZuPe3l7KaZfSmpTzVOIPq1be9GBWExELzo8
 J.XAC_oBZJuL8Kws3tBE5nQBk6CIa0JPJJVokEwjDxRdUF1ao2IDpybOOu86_jfAUvIbxCFlWcFA
 EcFakXbfFXkmExhavaoShIndu8Jgphq1jYGR7od8hCXxdHzYHG7JoxxmEwbpCZvITjCPma34NT7q
 SJzqdfszJ_k1YFf4yfGppuGf1dn8m86pob0P7ygVPn6RLcA1A.CJ_1OG1n1s2F0YdrpCptNF6g2.
 cJkXK3J4rodE.m4Xk4vHxZq5Ds0THQoWdC8GZ5rSa3gpkD6uWyA8jmp_QhQnYS_dMW.pScAxA2F5
 4WAUlmPrQVBwTtL4dJmF20Rq0GCEzGhMLUndf_KVMiOkVNumA3u9uJoaaO0u4eDmO2c_h2rko51E
 4PApO.RglPGUQoJ4ICZKUvkRmU1U3bZM0utpP2vxHQPT10dNGXWuVn6Mw._W85qajAtESihclC.S
 rzrnBCLDN6OFaJS_pps7m5DKnwXKg6EgYQRkjYLnEWkAZwlI-
X-Sonic-MF: <pheonix.sja@att.net>
X-Sonic-ID: a1e67f17-60d7-4e2f-b237-11c1cf5a15b1
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic311.consmr.mail.ne1.yahoo.com with HTTP; Fri, 9 May 2025 00:08:02 +0000
Received: by hermes--production-ne1-9495dc4d7-vqkqz (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 38c9ce085f9b2e8376020fe81c218b00; 
 Fri, 09 May 2025 00:08:00 +0000 (UTC)
Date: Thu, 08 May 2025 20:07:54 -0400
From: Steven J Abner <pheonix.sja@att.net>
Subject: Kernels >= 6.3 disable video output
To: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Message-Id: <6DWYVS.BXJ4YUZ0KN5B3@att.net>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
References: <6DWYVS.BXJ4YUZ0KN5B3.ref@att.net>
X-Mailman-Approved-At: Fri, 09 May 2025 07:33:29 +0000
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

 AMD 2400g, Zen1, 'Raven' firmware, igpu, no card.
Code that was added to 6.2.16 to create 6.3 and up, to last tested 
6.13.4, breaks the igpu for Ryzen. Kernels with firmware, same as that 
used on 6.3 and up, works 100% on 5.4 to 6.2.16. This bug is even in a 
Debian/Ubuntu based OS's Mainline download of 6.8 (only mainline 
tested). Without using firmware, allowing fbdev drivers to control 
output to monitor, 6.13.4 works.
 The bug is that about 70% of the time, with firmware, the output to 
the monitor is shut off. The monitor displays no input connection. With 
no monitor the Linux console works the same as monitor connected. Both 
blanked and displayed have:
 > [ 0.000000] Linux version 6.13.4 (root@steven-ryzen) (gcc (GCC) 
14.2.0, GNU ld (GNU Binutils) 2.44) #1 SMP PREEMPT_DYNAMIC Thu May 8 
13:55:46 EDT 2025
 > [ 0.310823] ACPI: bus type drm_connector registered
 > [ 0.310837] [drm] amdgpu kernel modesetting enabled.
 > [ 0.310975] [drm] initializing kernel modesetting (RAVEN 
0x1002:0x15DD 0x1002:0x15DD 0xC6).
 > [ 0.310989] [drm] register mmio base: 0xFC900000
 > [ 0.310994] [drm] register mmio size: 524288
 > [ 0.311024] [drm] add ip block number 0 <soc15_common>
 > [ 0.311029] [drm] add ip block number 1 <gmc_v9_0>
 > [ 0.311034] [drm] add ip block number 2 <vega10_ih>
 > [ 0.311039] [drm] add ip block number 3 <psp>
 > [ 0.311043] [drm] add ip block number 4 <powerplay>
 > [ 0.311047] [drm] add ip block number 5 <dm>
 > [ 0.311052] [drm] add ip block number 6 <gfx_v9_0>
 > [ 0.311057] [drm] add ip block number 7 <sdma_v4_0>
 > [ 0.311061] [drm] add ip block number 8 <vcn_v1_0>
 > [ 0.334228] [drm] BIOS signature incorrect 0 0
 > [ 0.334251] amdgpu 0000:0e:00.0: amdgpu: Fetched VBIOS from ROM BAR
 > [ 0.334258] amdgpu: ATOM BIOS: 113-RAVEN-113
 > [ 0.334554] amdgpu 0000:0e:00.0: vgaarb: deactivate vga console
 > [ 0.334560] amdgpu 0000:0e:00.0: amdgpu: Trusted Memory Zone (TMZ) 
feature enabled
 > [ 0.334585] [drm] vm size is 262144 GB, 4 levels, block size is 
9-bit, fragment size is 9-bit
 > [ 0.334596] amdgpu 0000:0e:00.0: amdgpu: VRAM: 2048M 
0x000000F400000000 - 0x000000F47FFFFFFF (2048M used)
 > [ 0.334604] amdgpu 0000:0e:00.0: amdgpu: GART: 1024M 
0x0000000000000000 - 0x000000003FFFFFFF
 > [ 0.334615] [drm] Detected VRAM RAM=2048M, BAR=2048M
 > [ 0.334619] [drm] RAM width 128bits DDR4
 > [ 0.334722] [drm] amdgpu: 2048M of VRAM memory ready
 > [ 0.334727] [drm] amdgpu: 2923M of GTT memory ready.
 > [ 0.334742] [drm] GART: num cpu pages 262144, num gpu pages 262144
 > [ 0.334877] [drm] PCIE GART of 1024M enabled.
 > [ 0.334881] [drm] PTB located at 0x000000F400A00000
 > [ 0.335145] amdgpu: hwmgr_sw_init smu backed is smu10_smu
 > [ 0.335578] [drm] Found VCN firmware Version ENC: 1.15 DEC: 3 VEP: 0 
Revision: 0
 > [ 0.356133] amdgpu 0000:0e:00.0: amdgpu: reserve 0x400000 from 
0xf47fc00000 for PSP TMR
 > [ 0.428083] amdgpu 0000:0e:00.0: amdgpu: RAS: optional ras ta ucode 
is not available
 > [ 0.434083] amdgpu 0000:0e:00.0: amdgpu: RAP: optional rap ta ucode 
is not available
 > [ 0.434090] amdgpu 0000:0e:00.0: amdgpu: SECUREDISPLAY: 
securedisplay ta ucode is not available
 > [ 0.434559] [drm] DM_PPLIB: values for F clock
 > [ 0.434564] [drm] DM_PPLIB: 1633000 in kHz, 4399 in mV
 > [ 0.434570] [drm] DM_PPLIB: values for DCF clock
 > [ 0.434574] [drm] DM_PPLIB: 300000 in kHz, 3649 in mV
 > [ 0.434578] [drm] DM_PPLIB: 600000 in kHz, 4074 in mV
 > [ 0.434583] [drm] DM_PPLIB: 626000 in kHz, 4250 in mV
 > [ 0.434587] [drm] DM_PPLIB: 654000 in kHz, 4399 in mV
 > [ 0.435247] [drm] Display Core v3.2.310 initialized on DCN 1.0
 > [ 0.504716] [drm] kiq ring mec 2 pipe 1 q 0
 > [ 0.518487] amdgpu 0000:0e:00.0: amdgpu: SE 1, SH per SE 1, CU per 
SH 11, active_cu_number 11
 > [ 0.518497] amdgpu 0000:0e:00.0: amdgpu: ring gfx uses VM inv eng 0 
on hub 0
 > [ 0.518503] amdgpu 0000:0e:00.0: amdgpu: ring comp_1.0.0 uses VM inv 
eng 1 on hub 0
 > [ 0.518510] amdgpu 0000:0e:00.0: amdgpu: ring comp_1.1.0 uses VM inv 
eng 4 on hub 0
 > [ 0.518516] amdgpu 0000:0e:00.0: amdgpu: ring comp_1.2.0 uses VM inv 
eng 5 on hub 0
 > [ 0.518523] amdgpu 0000:0e:00.0: amdgpu: ring comp_1.3.0 uses VM inv 
eng 6 on hub 0
 > [ 0.518530] amdgpu 0000:0e:00.0: amdgpu: ring comp_1.0.1 uses VM inv 
eng 7 on hub 0
 > [ 0.518536] amdgpu 0000:0e:00.0: amdgpu: ring comp_1.1.1 uses VM inv 
eng 8 on hub 0
 > [ 0.518543] amdgpu 0000:0e:00.0: amdgpu: ring comp_1.2.1 uses VM inv 
eng 9 on hub 0
 > [ 0.518549] amdgpu 0000:0e:00.0: amdgpu: ring comp_1.3.1 uses VM inv 
eng 10 on hub 0
 > [ 0.518556] amdgpu 0000:0e:00.0: amdgpu: ring kiq_0.2.1.0 uses VM 
inv eng 11 on hub 0
 > [ 0.518562] amdgpu 0000:0e:00.0: amdgpu: ring sdma0 uses VM inv eng 
0 on hub 8
 > [ 0.518569] amdgpu 0000:0e:00.0: amdgpu: ring vcn_dec uses VM inv 
eng 1 on hub 8
 > [ 0.518575] amdgpu 0000:0e:00.0: amdgpu: ring vcn_enc0 uses VM inv 
eng 4 on hub 8
 > [ 0.518581] amdgpu 0000:0e:00.0: amdgpu: ring vcn_enc1 uses VM inv 
eng 5 on hub 8
 > [ 0.518588] amdgpu 0000:0e:00.0: amdgpu: ring jpeg_dec uses VM inv 
eng 6 on hub 8
 > [ 0.521453] amdgpu: pp_dpm_get_sclk_od was not implemented.
 > [ 0.521460] amdgpu: pp_dpm_get_mclk_od was not implemented.
 > [ 0.521565] amdgpu 0000:0e:00.0: amdgpu: Runtime PM not available
 > [ 0.521868] [drm] Initialized amdgpu 3.60.0 for 0000:0e:00.0 on 
minor 0
 > [ 0.526617] fbcon: amdgpudrmfb (fb0) is primary device
 > [ 0.595813] Console: switching to colour frame buffer device 240x67
 > [ 0.628478] amdgpu 0000:0e:00.0: [drm] fb0: amdgpudrmfb frame buffer 
device

 I have no idea which code to regress to get back to 6.2.16 to make 
work again. From a quick look, that is the kernels where code was 
adopting new naming conventions for drivers, among tons of other 
changes. Think was also the start of PState default of 3, which setting 
to 1 made no difference, maybe lessened blackout closer to 50%?
Please help, I luv my 2400g! 6.1.137 is great and 5.15 is fine too. I 
still use 5.4 for testing my code too.
Steve
PS. please cc me, I'm not on the list referred by fb-dev.






