Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F173ABE087
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 18:22:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 481AB10E551;
	Tue, 20 May 2025 16:22:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hJTTw54g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65A3110E4F5;
 Tue, 20 May 2025 16:22:51 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id
 46e09a7af769-72c3b863b8eso4222547a34.2; 
 Tue, 20 May 2025 09:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747758170; x=1748362970; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t0HWhoEGlvH4UanVLpaHgaFj5uaCvcRqQd2jUejSkZk=;
 b=hJTTw54gQMske2ld1YWRWpOfVoixJhH4+ajAUHUiDgbzFn+jCqggKc4C7ysdDnB9Rd
 bOlqOIVIkPBpKMNnk4o9FhzQkGQnczpUHKydKEeOFxaTGI2HbnzGC3zXfrPxVRLuJZP5
 LhpxcLkK1pLnl/vjmcegygh1Zm0X6s7Jag451xyGf2p/vSA801biK0M7SesENio9STv4
 KcdisbYczybybg4SYaldPgLLn002xBYEhYBk5AvHKkGDU3diEGMDF9YvWo0FrGOouiEN
 tsLUPqI1TOTU5DkWn88TKiiEacLTP9LZ5PYDUHaOjtIHvB8kKOoZbstqyZcj9f8MAXuL
 ONfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747758170; x=1748362970;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t0HWhoEGlvH4UanVLpaHgaFj5uaCvcRqQd2jUejSkZk=;
 b=CYj7pPkMVLUEu3Zg7+u6Xe+umpVacCPujchMW+c8JaKIiHR0VuqNoIRdpJm33ogQwz
 nyXcJECpizTF31kRX371ECwr33CNYdekxr3K1ZWOtNqLG/vAXyjMgzOKpjZgloT68cHp
 /hZCS424hmbIKawIjrhl/RdpZ6NMYVhbRN75lSWcOjcrBGgbpGytxbXS47Th6m99ivbv
 2wHU7KGQqzx8Ub71a6Qqref/ZvZbZJBkzD550xT3vykwDwj9PbCKLFp7D6+ELLecOP6D
 i0ucN7r7rK2i/jKYEQxi7vCYcc+8oIntow9kEhQR/oLwhSsDa1GXPbV+t611H/5h//PV
 R93Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVusUqvBLDi6aWu3SUQwXVCmhlvDfeJtcwSNCWpwlOUCl+6qIRAaS5iAAEzTnC4BySJqlPw5qHC@lists.freedesktop.org,
 AJvYcCXiL8/Jy5GAwMPyI7AGrslNeWcyad1ISNtcEPx96o4oooi9hvTHOLdj8OTzKXp8xJnkgtafZ4lo4iGR@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy/6t6FCfmEQuwgseveAMvS3xak/zLOCXTUNPr4+tE2f8vwuQ8z
 8WkKk2wmWFHvUWnTc3hNjC5N2mTJ4jGYaoEqTatSaZ8JyM5XDz/Nt5cP/tBatSHWhfk4yuCZDwP
 PtsfaSKxnf/9j4sTVAKs82As9hNBgt98=
X-Gm-Gg: ASbGncuJEjUKqjFjmgIaVfiEyyewWFTNIIxCxp+0oQWDvussD1FgBHyZBV85OQO9Z9O
 kvqyRii+DDbflcc+psnUhM7HiJmoMZJpAeP6D2lwTHtuSTITWV9antYa4f/5YHKafMIgxToHkO2
 Ghq3wuT0N69CYf5GLz3+7QVT5srxTSDpbVfJhNaugQIY6A
X-Google-Smtp-Source: AGHT+IEGazgYcFFYqSWpOSkIHhn1MURd+j+lfv1uzCtxT/F1GutSwFjiAZmJjWp90mPosd+z0UJD6Cc/+Hr809fy1vY=
X-Received: by 2002:a05:6830:4189:b0:731:cac7:3634 with SMTP id
 46e09a7af769-734f6ac4e55mr12071806a34.3.1747758170553; Tue, 20 May 2025
 09:22:50 -0700 (PDT)
MIME-Version: 1.0
References: <CABXGCsPLAs+rCktbM_ao3bP3VZuaLqXSMpXZt1m-B9nqf91EQw@mail.gmail.com>
 <CH0PR12MB52845B90BB3D7B94473B6FDA8B9FA@CH0PR12MB5284.namprd12.prod.outlook.com>
In-Reply-To: <CH0PR12MB52845B90BB3D7B94473B6FDA8B9FA@CH0PR12MB5284.namprd12.prod.outlook.com>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Tue, 20 May 2025 21:22:39 +0500
X-Gm-Features: AX0GCFuSeV0_iIfi2B7CrPBZxdbghCyFZ-5JMvI3TU0_KAOUPfiuj1Zu21ABgBM
Message-ID: <CABXGCsNmsQgvNZL0_pHxnHLKNZS=k_yzmMNoGgfGQqsimTWucQ@mail.gmail.com>
Subject: Re: 6.15-rc6/regression/bisected - after commit f1c6be3999d2 error
 appeared: *ERROR* dc_dmub_srv_log_diagnostic_data: DMCUB error
To: "Pillai, Aurabindo" <Aurabindo.Pillai@amd.com>
Cc: "Chung, ChiaHsuan (Tom)" <ChiaHsuan.Chung@amd.com>, "Wu,
 Ray" <Ray.Wu@amd.com>, 
 "Wheeler, Daniel" <Daniel.Wheeler@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, 
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, 
 Linux regressions mailing list <regressions@lists.linux.dev>
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

On Tue, May 20, 2025 at 8:06=E2=80=AFPM Pillai, Aurabindo
<Aurabindo.Pillai@amd.com> wrote:
>
> [AMD Official Use Only - AMD Internal Distribution Only]
>
>
> Hi Mike,
>
> Could you more details about your setup, and how you were able to repro i=
t ?
>

Hi!

Did the probe not include enough information?
https://linux-hardware.org/?probe=3D4635c5fcb1

Anyway, here's the output from inxi:

> inxi -GSC -xx
System:
  Host: secondary-ws Kernel: 6.15.0-rc7-a5806cd506af-revert-f1c6be3999d2+
    arch: x86_64 bits: 64 compiler: gcc v: 15.1.1
  Desktop: GNOME v: 48.1 tk: GTK v: 3.24.49 wm: gnome-shell dm: GDM
    Distro: Fedora Linux 43 (Workstation Edition Prerelease)
CPU:
  Info: 16-core model: AMD Ryzen 9 7950X bits: 64 type: MT MCP arch: Zen 4
    rev: 2 cache: L1: 1024 KiB L2: 16 MiB L3: 64 MiB
  Speed (MHz): avg: 5355 min/max: 425/5883 boost: enabled cores: 1: 5355
    2: 5355 3: 5355 4: 5355 5: 5355 6: 5355 7: 5355 8: 5355 9: 5355 10: 535=
5
    11: 5355 12: 5355 13: 5355 14: 5355 15: 5355 16: 5355 17: 5355 18: 5355
    19: 5355 20: 5355 21: 5355 22: 5355 23: 5355 24: 5355 25: 5355 26: 5355
    27: 5355 28: 5355 29: 5355 30: 5355 31: 5355 32: 5355 bogomips: 287444
  Flags: avx avx2 ht lm nx pae sse sse2 sse3 sse4_1 sse4_2 sse4a ssse3 svm
Graphics:
  Device-1: Advanced Micro Devices [AMD/ATI] Navi 21 [Radeon RX 6800/6800 X=
T
    / 6900 XT] driver: amdgpu v: kernel arch: RDNA-2 pcie: speed: 16 GT/s
    lanes: 16 ports: active: HDMI-A-1 empty: DP-1, DP-2, DP-3, Writeback-1
    bus-ID: 03:00.0 chip-ID: 1002:73bf
  Display: wayland server: X.org v: 1.21.1.16 with: Xwayland v: 24.1.6
    compositor: gnome-shell driver: X: loaded: amdgpu
    unloaded: fbdev,modesetting,radeon,vesa dri: radeonsi gpu: amdgpu
    display-ID: 0
  Monitor-1: HDMI-A-1 model: LG (GoldStar) TV SSCR2 res: 3840x2160 dpi: 61
    diag: 1836mm (72.3")
  API: OpenGL v: 4.6 vendor: amd mesa v: 25.2.0-devel glx-v: 1.4 es-v: 3.2
    direct-render: yes renderer: AMD Radeon RX 6900 XT (radeonsi navi21 LLV=
M
    20.1.3 DRM 3.63 6.15.0-rc7-a5806cd506af-revert-f1c6be3999d2+)
    device-ID: 1002:73bf display-ID: :0.0
  API: Vulkan v: 1.4.313 surfaces: N/A device: 0 type: discrete-gpu
    driver: mesa radv device-ID: 1002:73bf device: 1 type: cpu
    driver: mesa llvmpipe device-ID: 10005:0000
  API: EGL Message: EGL data requires eglinfo. Check --recommends.
  Info: Tools: api: glxinfo,vulkaninfo x11: xdriinfo, xdpyinfo, xprop,
    xrandr

I'm using an LG OLED42C3 TV as a monitor.

Let me know if you need any other details!


--
Best Regards,
Mike Gavrilov.
