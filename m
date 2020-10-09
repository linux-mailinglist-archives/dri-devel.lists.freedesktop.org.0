Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E870F289B3D
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 23:54:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EEE56EE24;
	Fri,  9 Oct 2020 21:54:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5612A6EE23
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Oct 2020 21:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602280447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1DGRdcsDNGl9gVS7YYV990kOut6FXvc+T+EaiHpDxCk=;
 b=NRvvCQmP5wNU+1fHMLVpgfwDcDbdhgtSw7H5ww/jzE0fcdzek8TdJIcs1jQpedbJwpNHhu
 6Vw3Yd+j8ELsMjF+PsKodqZMMJQw58GQ1WiDgqtPHMEt6s7mVjWO7k7hwpOmmdKFV7h2xX
 cpzppo32Re7NwCuhkeAW35dw/iNiXyc=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-FeT9elpmNpeLfy8cYFT1BQ-1; Fri, 09 Oct 2020 17:54:05 -0400
X-MC-Unique: FeT9elpmNpeLfy8cYFT1BQ-1
Received: by mail-qt1-f197.google.com with SMTP id b41so4530744qtk.21
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Oct 2020 14:54:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1DGRdcsDNGl9gVS7YYV990kOut6FXvc+T+EaiHpDxCk=;
 b=WWqlpXN6syNOJ/jEUwaKcFknuM7J/N7DGqRzfYV67E14H1h2ZiA1euE4Van+CqJ1AC
 AgUU4RWoVtr+95MuupjzZw+6+CFlUSsC/m+nOHhi3u7Q9P/JcL2NeFo9n3lp1mMRvgUm
 1yRa0JIkCsFLEuvxbi6+P3xaug4NglXIF+5dwIMswsGLHHKZvXu1yw5+/h8IKGJyXt7a
 Or4YgAEJ8bVTPVNY9lg02+IzR3ZlgTtNkbpP1ZPmmXYe/YiIEVXTbW96NuxuOVPlCRRI
 +uZSgYRCehD53W29mu3p6hYY7x27JsEdSFIrjDH8G2MG4pwK++puMD+VFrxfnl2G6XsZ
 TmPA==
X-Gm-Message-State: AOAM5320xJ3gfcKKYp57VQOVgtf8y97yk/ygJWGc6T9nyyQ9Ejzi2XBb
 AUWPaXmlfYNdHmxTsO3FQ60dmYEsGvL6drPL8K5ncoCoUaBr+6bEtNnlPbzHo8rI3ECC4MEa0oV
 iSpbAx6sv0J8GZnQ90iOWJQ+QLlhed5KDucGmg4aqJzWx
X-Received: by 2002:a37:7805:: with SMTP id t5mr41074qkc.157.1602280444896;
 Fri, 09 Oct 2020 14:54:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyKFe0fZM+UI+kwnaS3rhTnXdP4Ft6MV/RhHjc26A66FZKTRWIGz5gj2waLbdahUrnRKpEWmENOBiFZvhqso3g=
X-Received: by 2002:a37:7805:: with SMTP id t5mr41003qkc.157.1602280443645;
 Fri, 09 Oct 2020 14:54:03 -0700 (PDT)
MIME-Version: 1.0
References: <202010092326.20482.linux@zary.sk>
In-Reply-To: <202010092326.20482.linux@zary.sk>
From: Karol Herbst <kherbst@redhat.com>
Date: Fri, 9 Oct 2020 23:53:52 +0200
Message-ID: <CACO55tuj_=PUYuBnJLZgCEize_8Po0VnuDVPtkHLEZxL3RgF7Q@mail.gmail.com>
Subject: Re: [Nouveau] nouveau broken on Riva TNT2 in 5.9.0-rc8: GPU not
 supported on big-endian
To: Ondrej Zary <linux@zary.sk>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: nouveau <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 9, 2020 at 11:35 PM Ondrej Zary <linux@zary.sk> wrote:
>
> Hello,
> I'm testing 5.9.0-rc8 and found that Riva TNT2 stopped working:
> [    0.000000] Linux version 5.9.0-rc8+ (zary@gsql) (gcc (Debian 8.3.0-6) 8.3.0, GNU ld (GNU Binutils for Debian) 2.31.1) #326 SMP Fri Oct 9 22:31:40 CEST 2020
> ...
> [   14.771464] nouveau 0000:01:00.0: GPU not supported on big-endian
> [   14.771782] nouveau: probe of 0000:01:00.0 failed with error -38
>
> big-endian? WTF? The machine is x86.
>

mhh, we reworked the endianess checks a bit and apparently that broke
something... I will give it some thoughts, but could you be so kind
and create an mmiotrace under 5.9 with nouveau? You won't need to
start X or anything while doing it. Just enable the trace and modprobe
nouveau and collect the trace.

> It works fine with Debian 5.7 kernel (5.7.10-1~bpo10+1):
> [    0.000000] Linux version 5.7.0-0.bpo.2-686 (debian-kernel@lists.debian.org) (gcc version 8.3.0 (Debian 8.3.0-6), GNU ld (GNU Binutils for Debian) 2.31.1) #1 SMP Debian 5.7.10-1~bpo10+1 (2020-07-30)
> ...
> [   23.266196] nouveau 0000:01:00.0: NVIDIA NV05 (20154000)
> [   23.288582] nouveau 0000:01:00.0: bios: version 02.05.20.02.00
> [   23.288869] nouveau 0000:01:00.0: bios: DCB table not found
> [   23.289595] nouveau 0000:01:00.0: bios: DCB table not found
> [   23.289956] nouveau 0000:01:00.0: bios: DCB table not found
> [   23.290015] nouveau 0000:01:00.0: bios: DCB table not found
> [   23.290215] agpgart-intel 0000:00:00.0: AGP 3.0 bridge
> [   23.290287] agpgart-intel 0000:00:00.0: bridge is in legacy mode, falling back to 2.x
> [   23.290351] agpgart-intel 0000:00:00.0: putting AGP V2 device into 4x mode
> [   23.290430] nouveau 0000:01:00.0: putting AGP V2 device into 4x mode
> [   23.290565] agpgart-intel 0000:00:00.0: AGP 3.0 bridge
> [   23.290627] agpgart-intel 0000:00:00.0: bridge is in legacy mode, falling back to 2.x
> [   23.290690] agpgart-intel 0000:00:00.0: putting AGP V2 device into 4x mode
> [   23.290768] nouveau 0000:01:00.0: putting AGP V2 device into 4x mode
> [   23.290830] nouveau 0000:01:00.0: tmr: unknown input clock freq
> [   23.293026] nouveau 0000:01:00.0: fb: 32 MiB SDRAM
> [   23.301269] [TTM] Zone  kernel: Available graphics memory: 382728 KiB
> [   23.301327] [TTM] Initializing pool allocator
> [   23.301414] nouveau 0000:01:00.0: DRM: VRAM: 31 MiB
> [   23.301465] nouveau 0000:01:00.0: DRM: GART: 128 MiB
> [   23.301518] nouveau 0000:01:00.0: DRM: BMP version 5.6
> [   23.301570] nouveau 0000:01:00.0: DRM: No DCB data found in VBIOS
> [   23.303594] nouveau 0000:01:00.0: DRM: MM: using M2MF for buffer copies
> [   23.303719] nouveau 0000:01:00.0: bios: DCB table not found
> [   23.304904] nouveau 0000:01:00.0: DRM: Saving VGA fonts
> [   23.349089] nouveau 0000:01:00.0: DRM: No DCB data found in VBIOS
> [   23.349681] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
> [   23.383066] nouveau 0000:01:00.0: DRM: allocated 1280x1024 fb: 0x4000, bo b10d2f17
> [   23.413903] fbcon: nouveaudrmfb (fb0) is primary device
> [   23.569851] Console: switching to colour frame buffer device 160x64
> [   23.571050] nouveau 0000:01:00.0: fb0: nouveaudrmfb frame buffer device
>
>
> --
> Ondrej Zary
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
