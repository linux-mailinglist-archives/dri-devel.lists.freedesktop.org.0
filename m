Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 904D42E7D83
	for <lists+dri-devel@lfdr.de>; Thu, 31 Dec 2020 01:40:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA2CC89AAE;
	Thu, 31 Dec 2020 00:40:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A69EF89AAD;
 Thu, 31 Dec 2020 00:40:32 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id o17so41185053lfg.4;
 Wed, 30 Dec 2020 16:40:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M67MbkYLxSdOa9oNcNplN7jJDJwLu2PsQUeqJdvpyic=;
 b=OF7Nm9YBgnrjTgTX1Mc2Wj1H5W17rZ9V82YydDt4k3Mrc6s4zc7lm1sKO+HuivVfbJ
 0U3G4/JXxT0rhzgwQERoXxp7ISbvGFb9HypkINnGAaP5mIkT9B3SaFj6WASZmmVj3kPk
 TmBCtqHTl7LAFi8DUwmz6333VYwv7pgy4hM2VMW/oehTBo472dGWRjibuBArVOpEFlCO
 884sDfXr+LpMcjruQtiBJauoY7ZwM+O/IVhgeydBF+esVt7Hc9bFaRv6Mv53atUawC0w
 LRLcZhcu9gZ9u5b99QhVwj+lqJePjDXKl4VQEkVFS2kVOQVa1xoVyj6MdFkUutVGPTSB
 N5Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M67MbkYLxSdOa9oNcNplN7jJDJwLu2PsQUeqJdvpyic=;
 b=oikHmPKQ16LDF/4KrIlCUvJrnIE9Sk4ETB8e0nCYVcld70CJFmqa5HJ8zkdXhI1lQr
 Rit+r3WrjRgqRZJgBYJoON/i4GSVYGHH8m15FO5EDHhWgmVmd0p+OHRbZLOyzRGb9fvI
 HxEaETgi4/d+9RWjJsscJdgY6wxn6l9ssWDBLujISiysEbuZfk82XswdYVuLs2fMrBEh
 3nRb21DlgVXPKnPr32dVJGhS1nPygjn2gfx7iWFcGnSKAOboktcUxQ8rTzF5Rjoi6El1
 VXL4q6ctS6dMZsVLudPUxBIGDA8083Q8KAM/0eJMhRO7rairbwWd6yozHvEXx8BfozRq
 A92w==
X-Gm-Message-State: AOAM531ZFslS2HmjjrgJdte2ydrCBEPAM6i+frxsPe6FN4ZQN6DDMC0m
 vDhWPbctBIlfV6K7+gatkMH/F7K6tXA0gWn9xlo=
X-Google-Smtp-Source: ABdhPJwDI3T5RePav+oBWL1/QTVV3ixeyBUrivDpTU4GoQEcaDTmAqZRfVWlkXVAe1i/zpNCvghrjMaQvZ4MO5kgDac=
X-Received: by 2002:a2e:9787:: with SMTP id y7mr26688745lji.420.1609375230908; 
 Wed, 30 Dec 2020 16:40:30 -0800 (PST)
MIME-Version: 1.0
References: <CABXGCsPsXSTh+WO2XESOU+Q1ocrWmS1c1YJFarzmA=woK_ke5Q@mail.gmail.com>
 <CABXGCsPBBDX3ozAgtT174nesiM+Gx4UkQi+PD27jB3i9OQ=G0g@mail.gmail.com>
 <MN2PR12MB4488AAA880BA8896EEA97491F7D80@MN2PR12MB4488.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB4488AAA880BA8896EEA97491F7D80@MN2PR12MB4488.namprd12.prod.outlook.com>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Thu, 31 Dec 2020 05:40:19 +0500
Message-ID: <CABXGCsO=6--KOALpNhj1439_wN65247A89dPwByR3e8w49Om1Q@mail.gmail.com>
Subject: Re: [bug] Radeon 3900XT not switch to graphic mode on kernel 5.10
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 29 Dec 2020 at 20:15, Deucher, Alexander
<Alexander.Deucher@amd.com> wrote:
>
> It looks like the driver is not able to access the firmware for some reason.  Please make sure it is available in your initrd or compiled into the kernel depending on your config.

Exactly! Thanks!

# lsinitrd /boot/initramfs-5.10.0-0.rc6.20201204git34816d20f173.92.fc34.x86_64.img
| grep sienna_cichlid

# ls /usr/lib/firmware/amdgpu | grep sienna_cichlid
sienna_cichlid_ce.bin
sienna_cichlid_dmcub.bin
sienna_cichlid_me.bin
sienna_cichlid_mec2.bin
sienna_cichlid_mec.bin
sienna_cichlid_pfp.bin
sienna_cichlid_rlc.bin
sienna_cichlid_sdma.bin
sienna_cichlid_smc.bin
sienna_cichlid_sos.bin
sienna_cichlid_ta.bin
sienna_cichlid_vcn.bin

# dracut -f --regenerate-all

# lsinitrd /boot/initramfs-5.10.0-0.rc6.20201204git34816d20f173.92.fc34.x86_64.img
| grep sienna_cichlid
-rw-r--r--   1 root     root       263296 Dec 15 14:00
usr/lib/firmware/amdgpu/sienna_cichlid_ce.bin
-rw-r--r--   1 root     root        80244 Dec 15 14:00
usr/lib/firmware/amdgpu/sienna_cichlid_dmcub.bin
-rw-r--r--   1 root     root       263424 Dec 15 14:00
usr/lib/firmware/amdgpu/sienna_cichlid_me.bin
-rw-r--r--   2 root     root       268592 Dec 15 14:00
usr/lib/firmware/amdgpu/sienna_cichlid_mec2.bin
-rw-r--r--   2 root     root            0 Dec 15 14:00
usr/lib/firmware/amdgpu/sienna_cichlid_mec.bin
-rw-r--r--   1 root     root       263424 Dec 15 14:00
usr/lib/firmware/amdgpu/sienna_cichlid_pfp.bin
-rw-r--r--   1 root     root       128592 Dec 15 14:00
usr/lib/firmware/amdgpu/sienna_cichlid_rlc.bin
-rw-r--r--   1 root     root        34048 Dec 15 14:00
usr/lib/firmware/amdgpu/sienna_cichlid_sdma.bin
-rw-r--r--   1 root     root       247396 Dec 15 14:00
usr/lib/firmware/amdgpu/sienna_cichlid_smc.bin
-rw-r--r--   1 root     root       215152 Dec 15 14:00
usr/lib/firmware/amdgpu/sienna_cichlid_sos.bin
-rw-r--r--   1 root     root       333568 Dec 15 14:00
usr/lib/firmware/amdgpu/sienna_cichlid_ta.bin
-rw-r--r--   1 root     root       504224 Dec 15 14:00
usr/lib/firmware/amdgpu/sienna_cichlid_vcn.bin

# grep '20201204git34816d20f173\|linux-firmware-20201218-116'
/var/log/dnf.rpm.log
2020-12-06T12:40:44+0500 SUBDEBUG Installed:
kernel-core-5.10.0-0.rc6.20201204git34816d20f173.92.fc34.x86_64
2020-12-06T12:40:46+0500 SUBDEBUG Installed:
kernel-modules-5.10.0-0.rc6.20201204git34816d20f173.92.fc34.x86_64
2020-12-06T12:41:03+0500 SUBDEBUG Installed:
kernel-5.10.0-0.rc6.20201204git34816d20f173.92.fc34.x86_64
2020-12-06T12:41:03+0500 SUBDEBUG Installed:
kernel-modules-extra-5.10.0-0.rc6.20201204git34816d20f173.92.fc34.x86_64
2020-12-21T10:52:43+0500 SUBDEBUG Upgrade:
linux-firmware-20201218-116.fc34.noarch

I think every update of linux-firmware should regenerate initramfs.
But my downstream report was closed:
https://bugzilla.redhat.com/show_bug.cgi?id=1911745

--
Best Regards,
Mike Gavrilov.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
