Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9B1AB1475
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 15:11:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F77710EA3B;
	Fri,  9 May 2025 13:11:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MNQpI3Zw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ECDB10EA37;
 Fri,  9 May 2025 13:11:30 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-22e696bbc85so3227805ad.2; 
 Fri, 09 May 2025 06:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746796290; x=1747401090; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oOHvQ6cWyFQE2/se2a72nWp+ZhWD1FFqJv3og2HCRio=;
 b=MNQpI3ZwnGs106AB0MZfqSLZZslq3ZhyBpUHoXZG00FbTgGf6ScVh50Kmj7Z1VPzG6
 jIHi6XxAh8ziUWZthj7jdEHiY23zOELoZZ9eFbpLcT/L19xRGouTn8vnfccUNB8mbhta
 qUpxB4OeQh1CgAyj/Q3PsXgbmEfxqP+pPE+GasMwCg+QosPm2YWgOg6bzKySpleWSv/l
 2tXC3GVZUpxqLgUXJ5iY/0zKitsvdv2Q8wnB5OnBcKi8zx4QSuZfSoXRMA7LRIbK0xpq
 zpfRCWhtSKuh6j/2dexz8lC4cyvM28XcrUaAmU2GLKu8eNp8A8AmVFgVhuJmJoLq96K5
 KmtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746796290; x=1747401090;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oOHvQ6cWyFQE2/se2a72nWp+ZhWD1FFqJv3og2HCRio=;
 b=BdT+sAp56s/SYxybsfu6B7+aTROI/xskzGQU82Y7x+vQ7WYecGzmKi286I6g2Gkxc7
 DPrv+7tYzaoKbEX09uy12ULsoBz+lZtht+WSd8gkvmzQUCR0V4ZtQu6rtPONR56MD5iB
 PXklGEM3JLahr8yUaBzIggNs3zV9D6I/JhEgI996S0rFQtFRDd3DBjXL6Gdx6ma/x3rw
 MXyKxcWc5EWEBFBffLU5w3r48MzcfQMLJEWjMpT3EzW1oft/uInX0DNYfd9NW6lPM6ER
 1MQa16F3We4F3+NIqsgHIN0u6iGfCfyDWsm/9ChZcMlgvqP6CtO5s0RAqFYSZRu1e8BF
 MnOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBfmyjeE0JIJZ23rTmwnYSEFTH8/N37/pNCNGBsV3Fw8/sx2C7lZKYr+VvVg6vvopgG4aULRnMgAw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx9SNKJJjW+PDCrTmYbwEoKUu2ypKEyJLvNpxwj0jrtO5vdr1i+
 pa8iSMP0NcWcrnqSdNh202iQDejsHHdcTqdU3nHmqRYlSWD90iS4jW7EnbDL1xe/Q17JekSr9XP
 eH0oXHNX5HxsVVZeBwzWldkzTI/2E9w==
X-Gm-Gg: ASbGncvbOEHp64bBEW6mfKUv2cxraXOty41BYXwoyQ3Mj7U5FDo+6X9Gsju98bfCC5m
 R62fb1bXEU0Qy2t2BhJS/rD+cIajZsLMKjoa0mX+5/xiWDHSMXzvHN3Ddn16qj2mZOi38PzHNqK
 jXqRMUzRbuRCsV/lL7Ri8Msg==
X-Google-Smtp-Source: AGHT+IEvLpyqHlQHMTuYhE3RoMY46qruwuie7TWzgOSHltu/l93zwoPj9WRZ43+/FbyGPezGrYof6DCAfd4RDwzTe7s=
X-Received: by 2002:a17:902:cec1:b0:223:28a8:610b with SMTP id
 d9443c01a7336-22fc91a8f96mr16170835ad.14.1746796289746; Fri, 09 May 2025
 06:11:29 -0700 (PDT)
MIME-Version: 1.0
References: <6DWYVS.BXJ4YUZ0KN5B3.ref@att.net> <6DWYVS.BXJ4YUZ0KN5B3@att.net>
In-Reply-To: <6DWYVS.BXJ4YUZ0KN5B3@att.net>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 9 May 2025 09:11:17 -0400
X-Gm-Features: ATxdqUHF3X-1By-N5_Wsr7y8XOsSl2PZxgOn1hywXhTvGjOyzR59PYf0aU91xuI
Message-ID: <CADnq5_Pk41iOvibFSjt7+Wjj=FXWR--XMt+OCqmkWWveLfU_ig@mail.gmail.com>
Subject: Re: Kernels >= 6.3 disable video output
To: Steven J Abner <pheonix.sja@att.net>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 9, 2025 at 3:43=E2=80=AFAM Steven J Abner <pheonix.sja@att.net>=
 wrote:
>
>  AMD 2400g, Zen1, 'Raven' firmware, igpu, no card.
> Code that was added to 6.2.16 to create 6.3 and up, to last tested
> 6.13.4, breaks the igpu for Ryzen. Kernels with firmware, same as that
> used on 6.3 and up, works 100% on 5.4 to 6.2.16. This bug is even in a
> Debian/Ubuntu based OS's Mainline download of 6.8 (only mainline
> tested). Without using firmware, allowing fbdev drivers to control
> output to monitor, 6.13.4 works.
>  The bug is that about 70% of the time, with firmware, the output to
> the monitor is shut off. The monitor displays no input connection. With
> no monitor the Linux console works the same as monitor connected. Both
> blanked and displayed have:
>  > [ 0.000000] Linux version 6.13.4 (root@steven-ryzen) (gcc (GCC)
> 14.2.0, GNU ld (GNU Binutils) 2.44) #1 SMP PREEMPT_DYNAMIC Thu May 8
> 13:55:46 EDT 2025
>  > [ 0.310823] ACPI: bus type drm_connector registered
>  > [ 0.310837] [drm] amdgpu kernel modesetting enabled.
>  > [ 0.310975] [drm] initializing kernel modesetting (RAVEN
> 0x1002:0x15DD 0x1002:0x15DD 0xC6).
>  > [ 0.310989] [drm] register mmio base: 0xFC900000
>  > [ 0.310994] [drm] register mmio size: 524288
>  > [ 0.311024] [drm] add ip block number 0 <soc15_common>
>  > [ 0.311029] [drm] add ip block number 1 <gmc_v9_0>
>  > [ 0.311034] [drm] add ip block number 2 <vega10_ih>
>  > [ 0.311039] [drm] add ip block number 3 <psp>
>  > [ 0.311043] [drm] add ip block number 4 <powerplay>
>  > [ 0.311047] [drm] add ip block number 5 <dm>
>  > [ 0.311052] [drm] add ip block number 6 <gfx_v9_0>
>  > [ 0.311057] [drm] add ip block number 7 <sdma_v4_0>
>  > [ 0.311061] [drm] add ip block number 8 <vcn_v1_0>
>  > [ 0.334228] [drm] BIOS signature incorrect 0 0
>  > [ 0.334251] amdgpu 0000:0e:00.0: amdgpu: Fetched VBIOS from ROM BAR
>  > [ 0.334258] amdgpu: ATOM BIOS: 113-RAVEN-113
>  > [ 0.334554] amdgpu 0000:0e:00.0: vgaarb: deactivate vga console
>  > [ 0.334560] amdgpu 0000:0e:00.0: amdgpu: Trusted Memory Zone (TMZ)
> feature enabled
>  > [ 0.334585] [drm] vm size is 262144 GB, 4 levels, block size is
> 9-bit, fragment size is 9-bit
>  > [ 0.334596] amdgpu 0000:0e:00.0: amdgpu: VRAM: 2048M
> 0x000000F400000000 - 0x000000F47FFFFFFF (2048M used)
>  > [ 0.334604] amdgpu 0000:0e:00.0: amdgpu: GART: 1024M
> 0x0000000000000000 - 0x000000003FFFFFFF
>  > [ 0.334615] [drm] Detected VRAM RAM=3D2048M, BAR=3D2048M
>  > [ 0.334619] [drm] RAM width 128bits DDR4
>  > [ 0.334722] [drm] amdgpu: 2048M of VRAM memory ready
>  > [ 0.334727] [drm] amdgpu: 2923M of GTT memory ready.
>  > [ 0.334742] [drm] GART: num cpu pages 262144, num gpu pages 262144
>  > [ 0.334877] [drm] PCIE GART of 1024M enabled.
>  > [ 0.334881] [drm] PTB located at 0x000000F400A00000
>  > [ 0.335145] amdgpu: hwmgr_sw_init smu backed is smu10_smu
>  > [ 0.335578] [drm] Found VCN firmware Version ENC: 1.15 DEC: 3 VEP: 0
> Revision: 0
>  > [ 0.356133] amdgpu 0000:0e:00.0: amdgpu: reserve 0x400000 from
> 0xf47fc00000 for PSP TMR
>  > [ 0.428083] amdgpu 0000:0e:00.0: amdgpu: RAS: optional ras ta ucode
> is not available
>  > [ 0.434083] amdgpu 0000:0e:00.0: amdgpu: RAP: optional rap ta ucode
> is not available
>  > [ 0.434090] amdgpu 0000:0e:00.0: amdgpu: SECUREDISPLAY:
> securedisplay ta ucode is not available
>  > [ 0.434559] [drm] DM_PPLIB: values for F clock
>  > [ 0.434564] [drm] DM_PPLIB: 1633000 in kHz, 4399 in mV
>  > [ 0.434570] [drm] DM_PPLIB: values for DCF clock
>  > [ 0.434574] [drm] DM_PPLIB: 300000 in kHz, 3649 in mV
>  > [ 0.434578] [drm] DM_PPLIB: 600000 in kHz, 4074 in mV
>  > [ 0.434583] [drm] DM_PPLIB: 626000 in kHz, 4250 in mV
>  > [ 0.434587] [drm] DM_PPLIB: 654000 in kHz, 4399 in mV
>  > [ 0.435247] [drm] Display Core v3.2.310 initialized on DCN 1.0
>  > [ 0.504716] [drm] kiq ring mec 2 pipe 1 q 0
>  > [ 0.518487] amdgpu 0000:0e:00.0: amdgpu: SE 1, SH per SE 1, CU per
> SH 11, active_cu_number 11
>  > [ 0.518497] amdgpu 0000:0e:00.0: amdgpu: ring gfx uses VM inv eng 0
> on hub 0
>  > [ 0.518503] amdgpu 0000:0e:00.0: amdgpu: ring comp_1.0.0 uses VM inv
> eng 1 on hub 0
>  > [ 0.518510] amdgpu 0000:0e:00.0: amdgpu: ring comp_1.1.0 uses VM inv
> eng 4 on hub 0
>  > [ 0.518516] amdgpu 0000:0e:00.0: amdgpu: ring comp_1.2.0 uses VM inv
> eng 5 on hub 0
>  > [ 0.518523] amdgpu 0000:0e:00.0: amdgpu: ring comp_1.3.0 uses VM inv
> eng 6 on hub 0
>  > [ 0.518530] amdgpu 0000:0e:00.0: amdgpu: ring comp_1.0.1 uses VM inv
> eng 7 on hub 0
>  > [ 0.518536] amdgpu 0000:0e:00.0: amdgpu: ring comp_1.1.1 uses VM inv
> eng 8 on hub 0
>  > [ 0.518543] amdgpu 0000:0e:00.0: amdgpu: ring comp_1.2.1 uses VM inv
> eng 9 on hub 0
>  > [ 0.518549] amdgpu 0000:0e:00.0: amdgpu: ring comp_1.3.1 uses VM inv
> eng 10 on hub 0
>  > [ 0.518556] amdgpu 0000:0e:00.0: amdgpu: ring kiq_0.2.1.0 uses VM
> inv eng 11 on hub 0
>  > [ 0.518562] amdgpu 0000:0e:00.0: amdgpu: ring sdma0 uses VM inv eng
> 0 on hub 8
>  > [ 0.518569] amdgpu 0000:0e:00.0: amdgpu: ring vcn_dec uses VM inv
> eng 1 on hub 8
>  > [ 0.518575] amdgpu 0000:0e:00.0: amdgpu: ring vcn_enc0 uses VM inv
> eng 4 on hub 8
>  > [ 0.518581] amdgpu 0000:0e:00.0: amdgpu: ring vcn_enc1 uses VM inv
> eng 5 on hub 8
>  > [ 0.518588] amdgpu 0000:0e:00.0: amdgpu: ring jpeg_dec uses VM inv
> eng 6 on hub 8
>  > [ 0.521453] amdgpu: pp_dpm_get_sclk_od was not implemented.
>  > [ 0.521460] amdgpu: pp_dpm_get_mclk_od was not implemented.
>  > [ 0.521565] amdgpu 0000:0e:00.0: amdgpu: Runtime PM not available
>  > [ 0.521868] [drm] Initialized amdgpu 3.60.0 for 0000:0e:00.0 on
> minor 0
>  > [ 0.526617] fbcon: amdgpudrmfb (fb0) is primary device
>  > [ 0.595813] Console: switching to colour frame buffer device 240x67
>  > [ 0.628478] amdgpu 0000:0e:00.0: [drm] fb0: amdgpudrmfb frame buffer
> device
>
>  I have no idea which code to regress to get back to 6.2.16 to make
> work again. From a quick look, that is the kernels where code was
> adopting new naming conventions for drivers, among tons of other
> changes. Think was also the start of PState default of 3, which setting
> to 1 made no difference, maybe lessened blackout closer to 50%?
> Please help, I luv my 2400g! 6.1.137 is great and 5.15 is fine too. I
> still use 5.4 for testing my code too.

What display(s) are you using and how are they connected?  Can you bisect?

Alex
