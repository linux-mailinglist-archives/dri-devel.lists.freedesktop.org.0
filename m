Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA93C2F2F0
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 04:40:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68B8310E232;
	Tue,  4 Nov 2025 03:39:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Wgegs3F9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f193.google.com (mail-yw1-f193.google.com
 [209.85.128.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98F3410E232
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 03:39:57 +0000 (UTC)
Received: by mail-yw1-f193.google.com with SMTP id
 00721157ae682-78619d34979so45959267b3.2
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Nov 2025 19:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762227596; x=1762832396; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=xpuX+0gcTNHnSFJjEkqTDWSkgQkHG3tHbE3Hg1NdlzA=;
 b=Wgegs3F9hT3dPT+S8yU2MiKmAJo6srw32yI9IZ3feedML7IwlONRANW1vNF4FycVe5
 XtNq1NJoRYnPW5k5mQ7u9Cre14lOvXQ1vCaf98NJcFXChB/WbbKeRLcrATJ3bB6hfPHu
 wAR4GAKh2+HRCEWK+fmqQNzyrSLPy103XwQn9WZjIvXGjAC11iPN2+gueh4Yvipr705n
 ykSTYoW6FAEDBXHI2c5SCmoNXHp62IruGfqA5KMUjjrKnfEAD2eukJJrR4kG71BKUpAJ
 K3WG9wdQV6cUsjQPszco6kg+YBwb4mZKSd2F5iyXqTFK+bBhvY8CvZ9enakGKZndbhWK
 xyHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762227596; x=1762832396;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xpuX+0gcTNHnSFJjEkqTDWSkgQkHG3tHbE3Hg1NdlzA=;
 b=G0bZSahisP3ufB6idWNaTPVOyRw9rPMvt6G+XYUaCwT4kDe7De/8u8AMGE2Xzgf6B1
 dBHV8FsAHjXTZJSFCW2hRazPnJT5Edg1gSexxQ/UcAyLExeJpX+fzfjffkX5bDMmrm0e
 CzK7jilU+fjHCjLgdMAh7jIeRVPUMA6Z66+8xwt3wHDEVwEdAOC9XGCbyX6WbR8h0eHr
 d+iSZa5DmAYmFUgN4F5w3kvCWFXxjDyeYmOZwsuvbgbym3pYC1JWW5ep1uOgEx0tvTtE
 YfmK2fhXcapfWHH+8PSvtFLk7g4CZxE11OpqeKQvR+/YRNolR+DF/VRPly7pWQ+PaVZi
 PDSg==
X-Gm-Message-State: AOJu0Yy5oPajh2UcNfOMljGgmILktBBX+p+i2h5ExBots4IN5QgCxQes
 R35NYEgLHLRe9BLL3vZDUT5abwO5p4I/aIOWEjWXPQQxNyCxbI4xrnaXcPYkWM418nfN4r3lAMj
 OwQYD3T6CZbxasZvVtkc+JNATWcQEMJKNBzOfv6A0g88=
X-Gm-Gg: ASbGncve0xTWwyp3CFHxvNeof6QH8bEJ+CdQSul8u480msq+NxbkNoIaFUua0Tz7xcP
 I2BzSqZfquejJTmMOdXL0cxqnqnDz9FUwMBFNyBvYTTM9xyrHfTjMor0iLAXcND/n9dDgG3WFSV
 IMsrRfZH3MomMSCmEbAwV3HuQOizHWwBT3cIsWF4QrF7xlDgL3KpUIIgBa1FtyzMrsnxQu0ToFs
 jbhxzq/9NALAmJI4iwtgeBjFEn+CydXjDft9Z7viGwgDzOR11wwdobZzT+SUanJTphBj3Yp6EtU
 U80=
X-Google-Smtp-Source: AGHT+IHwH/ptJkI3P4cK5qaG8I+m0dbhJoif7rCWz5dLPdyJrNsCgDnRA1eGpfBSwxIno8YdpDLSoGqPKUyt4lwvQA8=
X-Received: by 2002:a05:690e:428a:10b0:63f:a4d7:b523 with SMTP id
 956f58d0204a3-63fa4d7bd1bmr7017196d50.28.1762227596116; Mon, 03 Nov 2025
 19:39:56 -0800 (PST)
MIME-Version: 1.0
From: Aditya <gtnq37@gmail.com>
Date: Tue, 4 Nov 2025 09:09:45 +0530
X-Gm-Features: AWmQ_blJRbHCZUhWFL8RsocLEokBbEbMioV6u3LwkKVggCYhEOcMvHJraNq4B90
Message-ID: <CABZLM817K1Q8Hp8YA3tB3M5NmbuuuTfBYUo_LgPr=DBsosTaZg@mail.gmail.com>
Subject: Stability of firmware prefixes for i915, xe, and amdgpu
To: dri-devel@lists.freedesktop.org
Cc: foxboron@archlinux.org
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

I'm working on a feature for Arch Linux's initramfs generator,
mkinitcpio, that'll make it more specific about the GPU firmware it
includes for i915, xe, amdgpu, and nouveau (also nvidia-open).

The idea is to detect the GPUs present using lspci ::0300, and include
only firmware required for those cards.

I noticed my coffelake based system (0x3e9b Intel UHD 630) always loads

    i915/kbl_dmc_ver1_04.bin

If all kernel versions that support this particular GPU load a file
with this prefix, we could use a glob pattern like

    i915/kbl_dmc*

and filter

    modinfo -F firmware -k $kver i915

output to be much more precise about the files included in the
initramfs for current and future kernels, shrinking it by several
megabytes without loss of functionality, provided the GPU isn't
swapped.

Another of my systems with a Ryzen 5625U loads firmware with the prefix

    amdgpu/green_sardine_

Including only files with that prefix resulted in the initramfs
shrinking by 25M.

And for nouveau, I'm thinking the structure of /lib/firmware/nvidia/,
which contains directories like ga102/ and gp104/ implies you just need
files in gp104/ if you have a GP104 based GPU. The corresponding chip
name for a given Nvidia device ID can be found using hwdata/pci.ids.

I'm hoping for clarity on the stability of these prefixes: can they be
relied upon? If yes, I could build a mapping of PCI device IDs to
firmware prefixes using the MODULE_DEVICE_TABLE entries in the module
sources or just parse dmesg output containing log entries about successful
firmware loads to extract the prefixes without having to hardcode
a table.

Stable prefixes would mean this table can be built once and used
by initramfs generators to shrink initrds which include GPU modules by
tens of megabytes, with little to no maintenance burden. We'd just have
to add entries for new GPUs as they're launched. This could also help
Fedora deal with space pressure on /boot due to the increasing size of
nouveau firmware which had them land an emergency change to double
/boot size to 2G for new installs.

Thanks,
Aditya
