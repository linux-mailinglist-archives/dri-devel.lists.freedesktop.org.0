Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 121C2790464
	for <lists+dri-devel@lfdr.de>; Sat,  2 Sep 2023 02:02:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32FA610E844;
	Sat,  2 Sep 2023 00:02:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4782010E844
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Sep 2023 00:02:06 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1c1e128135aso20454055ad.3
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Sep 2023 17:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693612926; x=1694217726; darn=lists.freedesktop.org;
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BBHir4fqlkZjATOANvJTnaRzDFazZQGgXDcHwsUpUF8=;
 b=H9Re5vOuiQO+eE2BsN5sOayV1IbTtgzej2+4v0QHLMEtFhd5gVtkpj9Gz549ajpGUC
 AKrLSabGUyD4AbO+f0Ven2TojYABPhY4SOc6PKUls9T5+po57pdEibEcizLAuRHeqdg/
 /FSoYUMC2xWhpSkxDssZ7h9dUgbaTuWwUUwXujTCKNz68hRj1O1M62wfnEkKWOScIiYu
 YkvTqhhOLZZVqGfVOywi8r/bd+TIpF5zaOKUnkzGmsht6MiabR2JGwr5JMnRQasE8wLN
 u+X28c1qRAQWtxav4zl2L2kgXv91Rt7RP9yhy/9o4qTXekxZXFP+rlXoA9BHSsBPBII5
 QNWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693612926; x=1694217726;
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=BBHir4fqlkZjATOANvJTnaRzDFazZQGgXDcHwsUpUF8=;
 b=X9BrQIbXTTGM1mQuR9H39Anyu0B57tLsmrQhY+MIM3itTNR/tWdUhjk3AtFeoQ8VsW
 9SU9JN3QgiJ8pOmFueoQsHmsqrgTX4+9jGSNYjwyLVN+qWP6BSwa9O5+nldJWPQQ2JTy
 yRpYSJTct0AHHbJMf/QgKGBdCuTjTyGLkO/aCzdkL6lYKRh50KXoUjc9Ky4qBZE2zJk+
 L6/ChqFA2MvZnhgFLR7y4zkA/iMbIoawE8uONFjyFRTQF18cgmz/JwiG7AwY47XFdNyX
 1ionqqucQGw22kPfeuBjceRe+XyzFOJK75OABSNZ2AjaqQ9IJqd3PEuLYKn02STDZGJL
 EtZg==
X-Gm-Message-State: AOJu0YzVj6+nqkC9uGx3KpFvL2vx9tVy1Gz0y+YJpfACkBqEOMtU+6jX
 g+298kRrcw2vx6q6sw8Yun/UBGKTrYo=
X-Google-Smtp-Source: AGHT+IEh7+4d8XZvbhk9lepBKYK0sM8SMFxCscjK63UUSC17NWVSSaJIEv72x/SN81Qx1AJi+qUaGA==
X-Received: by 2002:a17:903:2288:b0:1c0:8bf3:eb15 with SMTP id
 b8-20020a170903228800b001c08bf3eb15mr5119172plh.30.1693612925681; 
 Fri, 01 Sep 2023 17:02:05 -0700 (PDT)
Received: from [192.168.0.106] ([103.124.138.83])
 by smtp.gmail.com with ESMTPSA id
 4-20020a170902e9c400b001b86dd825e7sm3512634plk.108.2023.09.01.17.02.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Sep 2023 17:02:05 -0700 (PDT)
Message-ID: <f8c26878-aabc-7cc9-59a1-3f68bf1d43c1@gmail.com>
Date: Sat, 2 Sep 2023 07:01:59 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Content-Language: en-US
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Helge Deller <deller@gmx.de>, Alexei Gradinari <alex2grad@gmail.com>
From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Fwd: Kernel version 6.1.50 regression: radeonfb deactivate vga console
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Linux Framebuffer <linux-fbdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Regressions <regressions@lists.linux.dev>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

I notice a regression report on Bugzilla [1]. Quoting from it:

> Since kernel version 6.1.50 the VGA console stopped working on all HP ProLiant (G6 and G7) servers with [AMD/ATI] ES1000 VGA controller.
> 
> No issue with all kernel version 6.1.X before 6.1.50.
> No issue with the kernel 6.1.50 with the reversed next commit:
> 
> commit 6db53af15444e7022640d7b8d5e7531d94e27a43
> Author: Daniel Vetter <daniel.vetter@ffwll.ch>
> Date:   Wed Jan 11 16:41:08 2023 +0100
>     fbdev/radeon: use pci aperture helpers
> 
> With the commit 6db53af15444e7022640d7b8d5e7531d94e27a43 there is kernel log "radeonfb 0000:01:03.0: vgaarb: deactivate vga console" and VGA console not working. Without this commit no such log and VGA console working.
> 
> Equipment:
> HP ProLiant DL360 G7
> 01:03.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] ES1000 (rev 02) (prog-if 00 [VGA controller])
>         Subsystem: Hewlett-Packard Company ProLiant DL360 G5
>         Control: I/O+ Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping+ SERR+ FastB2B- DisINTx-
>         Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
>         Interrupt: pin A routed to IRQ 23
>         Region 0: Memory at e8000000 (32-bit, prefetchable) [size=128M]
>         Region 1: I/O ports at 2000 [size=256]
>         Region 2: Memory at f1cf0000 (32-bit, non-prefetchable) [size=64K]
>         Expansion ROM at 000c0000 [virtual] [disabled] [size=128K]
>         Capabilities: [50] Power Management version 2
>                 Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
>                 Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
>         Kernel driver in use: radeonfb
> 
> HP ProLiant ML330 G6
> 01:03.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] ES1000 (rev 02) (prog-if 00 [VGA controller])
>         Subsystem: Hewlett-Packard Company ProLiant DL360 G5
>         Control: I/O+ Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping+ SERR+ FastB2B- DisINTx-
>         Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
>         Interrupt: pin A routed to IRQ 23
>         Region 0: Memory at f0000000 (32-bit, prefetchable) [size=128M]
>         Region 1: I/O ports at 3000 [size=256]
>         Region 2: Memory at fbef0000 (32-bit, non-prefetchable) [size=64K]
>         Expansion ROM at 000c0000 [virtual] [disabled] [size=128K]
>         Capabilities: [50] Power Management version 2
>                 Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
>                 Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
>         Kernel driver in use: radeonfb

See Bugzilla for the full thread.

Anyway, I'm adding it to regzbot:

#regzbot introduced: 9b539c4d1b921b https://bugzilla.kernel.org/show_bug.cgi?id=217861
#regzbot title: using pci aperture helpers deactivates AMD ES1000 VGA controller

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=217861

-- 
An old man doll... just what I always wanted! - Clara
