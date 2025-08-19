Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F391AB2C5F8
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 15:45:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6424D10E1B4;
	Tue, 19 Aug 2025 13:45:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CCCjzLwl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC80310E1B4;
 Tue, 19 Aug 2025 13:45:24 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-618aea78f23so5444257a12.3; 
 Tue, 19 Aug 2025 06:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755611123; x=1756215923; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SarDp3gPgO/YdgGtf3xtssRMRvDNPW1kKle/w7h6F4U=;
 b=CCCjzLwl5Sc04sXhQMOcYzH9wruM8IXpwrGlGxfw59KB/lK+z6e98AXPQBm6EeF5pP
 DjEbdxjGefGp0f/AYwpgS2/YuK9f41DuPaIJhR/Etb03UeOZYP/OHVxCoXIFkvyB3/T3
 /vE1Lh/ShBUDU9bAn0INjtp0dKEbeOqeWMtIGV7ofFzx2sSRAlA0P3GPosi+hG/vhghm
 /DnEhIen9v1NKca8FOyvwkhtEoabQzEastrvhEoXftg3hbBkSa2o8inf/UG/z08k/QE6
 Okp5M3YzBb9laKJ2A/ojYg351/+imKjZz3jUPZv92vdcJi4a2yuF5yfvdHMXzpjmn3Af
 Oc4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755611123; x=1756215923;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SarDp3gPgO/YdgGtf3xtssRMRvDNPW1kKle/w7h6F4U=;
 b=MvOh2QqvZSWjlWFB9+riCMFKPNbjofTIAEf0R0dTK3gbh7DeVLyi2zq8yZbTIzJh++
 hgb8Kigu72RAFellTzkCaqglUCeFQ/X7W/vAN9luksznNhaq+PFpJCBVcfVFXfQYnsUh
 /AuPp4pA/kkoQp5S8UsYRRH9IcFk93+P88wcDtgM75ytvEmNkcrWuPZ24TFiNTL6wg8T
 ELhLEcmU7qPtqTqngN7qoQklCALNQjoPJVcPseIYtD2ySHzUSHQj1rwX3Re7oh+FE/FM
 vzvLUrr/hn9V9kXVl56A/FQKmugaNz2J1PNZJ/+WbyYno3I/hcUR0OGQXf5Fm6Nddzrn
 cpLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVeFbf6hfMV9YKltsnK6pM8j0nMt6DNGYonAYFaK4OLIMlEUUy654LwAL4Je4P65U9p8MkD+KBApfg=@lists.freedesktop.org,
 AJvYcCWZzlfqxghwjrIl2GOvlg9d9t/9Zo22lTKRf+anR7Sf3danRRoHzTN3bmcvYijsqdMBBaE1sQ2qO7XT@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz7109OIEeAbVx4CvDdrXdu3DPEQcaYoWZUPfahFitxpDWUZLtp
 c9nnyyIPrn2Gf7Pf2afT6rd1cIJz4IBXeZ2IB9EDoXBP2BHSXj6miAESgj5/yEoPpF2RGvvsqNd
 zWnAERx3C3Vib0hCbM0RwxrKeVr0mv6Rt5ad+1pMF19C7
X-Gm-Gg: ASbGnctJhw3jUWrG5e/hx5NqWJIBjpWqdEI3ynQfPr484tA03vzOZlrkIZke9RLlNVx
 1ZPcofdL9ki/Ur2tlFvwhXLuFU13d1G0beA+3eiqwVoEpQmdtrdV9kbiVXPE2TCcWKX5NjJRniF
 49pEvBfTBPGWn/+2R/ZLf+ihUpfL9SCVNLaZrohXQMTM3rQfXnT+cH/XvWDLWSzyLmk2RZZ7D24
 N5yPk8=
X-Google-Smtp-Source: AGHT+IGuEnssLntoKTg06N8UVz0+UwKwOhj3+VWR97223SWuRF4IgMIPW9I5hYz5V+54tTv67rXumI/lXzSaP19IpJs=
X-Received: by 2002:a17:906:dc8b:b0:af9:1d21:65a1 with SMTP id
 a640c23a62f3a-afddc95a1dbmr279438766b.11.1755611122852; Tue, 19 Aug 2025
 06:45:22 -0700 (PDT)
MIME-Version: 1.0
References: <CACTEcX6oXBot1VBApOyKVMVXsAN9BsvQMLa8J0iKpNeB-eLttQ@mail.gmail.com>
 <642d439ea1be8e48ee5c47fd3921a786452fb931@intel.com>
 <CACTEcX5Y3PNXNkhnK1dGFe+k3sigOZNpj66KKGAS9XeHqRu35w@mail.gmail.com>
 <0b15e33603a46f6cc7ad7d09a156044f11367169@intel.com>
 <CACTEcX47bUd2tp=LYkQnhK29Js=vLN0JfXL8Aq6mOFBVYumpzQ@mail.gmail.com>
 <CABgObfZKKeqMrAUyS8CB4ARkW_8Z9QREgpgYcq2jxoQ9ppS6MA@mail.gmail.com>
 <CACTEcX7oa+Shj=uYiRMoWpng+RZXDeQrOa-VTRmzVVtXJMCgLQ@mail.gmail.com>
 <CACTEcX7hsRkzYEBg4pQd5s36p_ZXJM=dtxSGmBjfkt5sWrXP8g@mail.gmail.com>
In-Reply-To: <CACTEcX7hsRkzYEBg4pQd5s36p_ZXJM=dtxSGmBjfkt5sWrXP8g@mail.gmail.com>
From: Andy Mindful <andy.mindful@gmail.com>
Date: Tue, 19 Aug 2025 16:45:11 +0300
X-Gm-Features: Ac12FXzUXiaf2APgZGDQHtK929W1yQQZJ8xoGGhTI90NnJ6i0iL0VZZKQ0T6JiQ
Message-ID: <CACTEcX4CBv9BTgvSrhJsFvPYLm_e5ms1PWzxsjv-hnudxiRTTw@mail.gmail.com>
Subject: Re: [REGRESSION] tty lockup and WWAN loss after hibernate/suspend in
 6.8+ on ThinkPad X1 Carbon Gen 10
To: regressions@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-acpi@vger.kernel.org, rafael@kernel.org, ville.syrjala@linux.intel.com, 
 tglx@linutronix.de, Christian Brauner <brauner@kernel.org>, 
 Jani Nikula <jani.nikula@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 regressions@leemhuis.info
Content-Type: text/plain; charset="UTF-8"
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

Hello,

I've tried to bisect this again on a branch 'linux-6.8.y' @ linux-stable.

I made a commit log via: git log --oneline > commits-linux-6.8.y.txt
And started manually searching bad and good commits, this is the log:
3a2bd2b150f4 - bad
35a4474b5c3d - bad
dc97f6344f20 - bad
b85ea95d0864 - bad
ffc253263a13 - good

Once I have good, I switched back to: git checkout linux-6.8.y and
started bisecting,
which lead to below log:

git bisect start
# status: waiting for both good and bad commits
# bad: [3a2bd2b150f45844d99267696256716e4f23bf53] printk: Use
prb_first_seq() as base for 32bit seq macros
git bisect bad 3a2bd2b150f45844d99267696256716e4f23bf53
# status: waiting for good commit(s), bad commit known
# bad: [35a4474b5c3dd4315f72bd53e87b97f128d9bb3d] Merge tag
'bcachefs-2024-01-21' of https://evilpiepirate.org/git/bcachefs
git bisect bad 35a4474b5c3dd4315f72bd53e87b97f128d9bb3d
# status: waiting for good commit(s), bad commit known
# bad: [dc97f6344f205b0dfa144e1b3e16d6dc05383d57] cxl/pci: Register
for and process CPER events
git bisect bad dc97f6344f205b0dfa144e1b3e16d6dc05383d57
# status: waiting for good commit(s), bad commit known
# bad: [b85ea95d086471afb4ad062012a4d73cd328fa86] Linux 6.7-rc1
git bisect bad b85ea95d086471afb4ad062012a4d73cd328fa86
# status: waiting for good commit(s), bad commit known
# good: [ffc253263a1375a65fa6c9f62a893e9767fbebfa] Linux 6.6
git bisect good ffc253263a1375a65fa6c9f62a893e9767fbebfa
# good: [7d461b291e65938f15f56fe58da2303b07578a76] Merge tag
'drm-next-2023-10-31-1' of git://anongit.freedesktop.org/drm/drm
git bisect good 7d461b291e65938f15f56fe58da2303b07578a76
# good: [2a80532c0745e140852e6b579bbe8371332bb45d] Merge tag
'printk-for-6.7' of
git://git.kernel.org/pub/scm/linux/kernel/git/printk/linux
git bisect good 2a80532c0745e140852e6b579bbe8371332bb45d
# good: [2a80532c0745e140852e6b579bbe8371332bb45d] Merge tag
'printk-for-6.7' of
git://git.kernel.org/pub/scm/linux/kernel/git/printk/linux
git bisect good 2a80532c0745e140852e6b579bbe8371332bb45d
# bad: [e70703890b2586bc3567365d391c260d23fb7a94] Merge tag
'topic/nvidia-gsp-2023-11-03' of git://anongit.freedesktop.org/drm/drm
git bisect bad e70703890b2586bc3567365d391c260d23fb7a94
# good: [b06f58ad8e8c4154bc88d83b4fd70f74ede50193] Merge tag
'driver-core-6.7-rc1' of
git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core
git bisect good b06f58ad8e8c4154bc88d83b4fd70f74ede50193
# good: [1f24458a1071f006e3f7449c08ae0f12af493923] Merge tag
'tty-6.7-rc1' of
git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty
git bisect good 1f24458a1071f006e3f7449c08ae0f12af493923
# bad: [bfafa2c19d706ab1db0b581f9d3886469fab8627] Merge tag
'phy-for-6.7' of
git://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy
git bisect bad bfafa2c19d706ab1db0b581f9d3886469fab8627
# bad: [9b6db9a3a675fc2f33b587a9909dcef20c4b3794] Merge tag
'thunderbolt-for-v6.7-rc1' of
git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt into
usb-next
git bisect bad 9b6db9a3a675fc2f33b587a9909dcef20c4b3794
# good: [efa33cd89c8acc510ed0e4dbf98fc1cf3220b9dc] USB: typec:
tps6598x: Add status trace for tps25750
git bisect good efa33cd89c8acc510ed0e4dbf98fc1cf3220b9dc
# bad: [ff8e4630fa3c1f8775f162ceaf52ba8b656927de] usb: gadget:
lpc32xx-udc: Convert to use module_platform_driver()
git bisect bad ff8e4630fa3c1f8775f162ceaf52ba8b656927de
# bad: [c087fada0a6180ab5b88b11c1776eef02f8d556f] xhci: Clean up stale
comment on ERST_SIZE macro
git bisect bad c087fada0a6180ab5b88b11c1776eef02f8d556f
# bad: [5220d8b04a840fa09434072c866d032b163419e3] dt-bindings: usb:
gpio-sbu-mux: Make 'mode-switch' not required
git bisect bad 5220d8b04a840fa09434072c866d032b163419e3
# bad: [1034cc423f1b4a7a9a56d310ca980fcd2753e11d] gpio: update Intel
LJCA USB GPIO driver
git bisect bad 1034cc423f1b4a7a9a56d310ca980fcd2753e11d
# bad: [bfd3824c88081f9b2101d68376f14779ce26691f] i2c: Add support for
Intel LJCA USB I2C driver
git bisect bad bfd3824c88081f9b2101d68376f14779ce26691f
# good: [acd6199f195d6de814ac4090ce0864a613b1580e] usb: Add support
for Intel LJCA device
git bisect good acd6199f195d6de814ac4090ce0864a613b1580e
# first bad commit: [bfd3824c88081f9b2101d68376f14779ce26691f] i2c:
Add support for Intel LJCA USB I2C driver

Can you please advise, if it makes sense and results are accurate?

Best regards!
Andriy
