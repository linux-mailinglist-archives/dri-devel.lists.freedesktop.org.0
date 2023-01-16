Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D20866C9B1
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 17:55:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C55F10E468;
	Mon, 16 Jan 2023 16:55:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AA2C10E468;
 Mon, 16 Jan 2023 16:55:21 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id s124so7052128oif.1;
 Mon, 16 Jan 2023 08:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=y0O74+UeA2cZ/ibulGY4megxEzD1ddBBq/HJy5G2D6I=;
 b=lIKbtkzJNII7ozfex6uzbS7O0xYtmCwLrWEPTZyBFgac82aO2taYqsjS5Tc3XHI/Z7
 hooYavPelZ/DThKvazCTkd18NxILlKjaGKCCaBbo7YvHS1QT6px3bowpiAKhxAMAAL4H
 hWvhLfCZ0BiYJQS3PVY28aaZO4ciEpCub1Hph14lLcWcFdc8bY8CRytxkCEr0zEf3nSF
 KC0nIiLwdTbcO2CHUpW1U4nc4R2a/Yx7e/l+p2gLPzXuxNQ9oAblXW+tCOdLmq7bFe8i
 noZV/cls/19DUdmgYxFC/ekMCyKiGqdb0sqSVFYXvI/NEyNDR5n3iyK58WgarFGAtFDo
 ZtMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=y0O74+UeA2cZ/ibulGY4megxEzD1ddBBq/HJy5G2D6I=;
 b=HRzQAx36A+4+bVTMUG+cvw3s+0w+BXutrbug5w/v522+pSI91sW9W759+cqzgMoYMX
 LnJMuxcLfPRVF614RWDi80/qoO0Dm3RzPc2QLPt39gmJ1wqMtYw0GOimo92XJTcvBlqE
 bDmjAdPJQHDiL/UnoS62twgAYFETCipKXbu/faZUV7bAjysSH6MtmVNSLTV+flH75/pt
 KfiKZnxuuA1ynI8VNvV+6Ca72bXbI9uNyy3rG+p9i+BTEE9IAHZDx5yDQuWa8iqj+aOO
 KmezAcjBpYBSE0KCkES/zZTgHEyyv2Kd63E7OoUEAvot1f8mcj70ViHqB5y3oK1Lzok7
 jD2A==
X-Gm-Message-State: AFqh2ko2skKIi3QMNIa6FAOXHP2thy0Lx5dJrfs4azTdr+ecWA7o6siY
 JLbsorD5QKvSg1ywZGEBCgTIdA58odv4ZIigvbk=
X-Google-Smtp-Source: AMrXdXuTnJ7x7DrIPXzxliD3T3AyoQo6XafEzt4UKcXpC+LEqtjn8wHIiMMhnQ0t5noVRMcovw8k4Cc2S1F90fvB7ok=
X-Received: by 2002:aca:2807:0:b0:35b:f5f7:3ed0 with SMTP id
 7-20020aca2807000000b0035bf5f73ed0mr811oix.46.1673888120292; Mon, 16 Jan 2023
 08:55:20 -0800 (PST)
MIME-Version: 1.0
References: <Y8QkZZiV78SskCIT@camel3.lan>
In-Reply-To: <Y8QkZZiV78SskCIT@camel3.lan>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 16 Jan 2023 11:55:08 -0500
Message-ID: <CADnq5_OQ=i8GSwqEDTYrbaC1uYLw9kJepdACUTqmd24ci3Yg0g@mail.gmail.com>
Subject: Re: Barco MXRT-5600 branded W5100 with PCI ID 664d
To: Matthias Reichl <hias@horus.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, amd-gfx@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jan 15, 2023 at 11:49 AM Matthias Reichl <hias@horus.com> wrote:
>
> I noticed some of the used HP Z240 workstations I recently bought had a
> Barco MXRT-5600 branded FirePro W5100 card installed - some others came with
> an unbranded W5100 (with the standard 6449 PCI ID).
>
> Except for a large Barco sticker on the top and Barco being mentioned on
> the barcode label on the back they look completely identical.
>
> lspci knows about the 644d PCI ID but neither the radeon nor amdgpu kernel
> drivers do nor does drm/mesa/xorg userspace.
>
> I had a go at it, added the pci id to kernel drivers, libdrm, mesa, xf86-video-ati
> and xserver and got the card working fine on Debian Bullseye with kernel 6.2-rc3.
> I also gave it a quick try with LibreELEC (where we build bleeding edge versions
> from scratch) and that worked fine, too.
>
> Do you happen to know more about that card and why the PCI ID is missing in
> linux drivers/userspace?

I don't see that DID in either the Linux driver or our windows driver.
Presumably it was a special card supported with a special driver for a
specific customer.  I'm not really sure off hand whether it needs some
special handling.

Alex


>
> I'm just attaching my current kernel and userspace patches as a reference
> for now but I'm very unsure in which sequence they should be applied without
> risking breakage - I already found out the hard way that patched xorg server
> and driver with old libdrm is a bad idea as that results in "Failed to initialize
> surface manager" instead of starting with framebuffer driver.
>
> If you prefer I can send proper patches or I can just you let handle it.
>
> For reference here's the lspci outout (with patched kernel and cik support
> enabled in amdgpu):
>
> root@camel3:~# lspci -vn -s 01:00.0
> 01:00.0 0300: 1002:664d (prog-if 00 [VGA controller])
>         Subsystem: 13cc:3d2a
>         Flags: bus master, fast devsel, latency 0, IRQ 137
>         Memory at 1c00000000 (64-bit, prefetchable) [size=4G]
>         Memory at 1d00000000 (64-bit, prefetchable) [size=8M]
>         I/O ports at 3000 [size=256]
>         Memory at d0f00000 (32-bit, non-prefetchable) [size=256K]
>         Expansion ROM at d0f40000 [disabled] [size=128K]
>         Capabilities: [48] Vendor Specific Information: Len=08 <?>
>         Capabilities: [50] Power Management version 3
>         Capabilities: [58] Express Legacy Endpoint, MSI 00
>         Capabilities: [a0] MSI: Enable+ Count=1/1 Maskable- 64bit+
>         Capabilities: [100] Vendor Specific Information: ID=0001 Rev=1 Len=010 <?>
>         Capabilities: [150] Advanced Error Reporting
>         Capabilities: [200] Physical Resizable BAR
>         Capabilities: [270] Secondary PCI Express
>         Capabilities: [2b0] Address Translation Service (ATS)
>         Capabilities: [2c0] Page Request Interface (PRI)
>         Capabilities: [2d0] Process Address Space ID (PASID)
>         Kernel driver in use: amdgpu
>         Kernel modules: radeon, amdgpu
>
> so long,
>
> Hias
