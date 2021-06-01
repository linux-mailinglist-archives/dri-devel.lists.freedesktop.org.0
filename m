Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 328A43979B0
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jun 2021 20:03:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7777D6EA5B;
	Tue,  1 Jun 2021 18:03:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E3BC6EA5B
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jun 2021 18:03:08 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 o2-20020a05600c4fc2b029019a0a8f959dso165838wmq.1
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Jun 2021 11:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=T7qM6+6uN0KwzP5H/fwdYqCGXwWL1e5qiBdG/escp3U=;
 b=g1nK7knMv+r/i40CVLxC0JvvkMwwiu3NL93ST4dE+K8cHfH+wWEL4ZapoSvNCh2qwC
 Y+cpvk53vR5mO1hNMJqvGvXGAgWpynJ1s3Lxl7jP71fSl5QBjoIMqdjBcsvY1n1aK6js
 FgmIvtwPmmOjoMseh5BaVkElJS7RuZTiKpyoU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=T7qM6+6uN0KwzP5H/fwdYqCGXwWL1e5qiBdG/escp3U=;
 b=PEj4sE0efvByAokqlO+VsV3ad2P3PcKM5HUXd0/dm6HjnmtCD4YjdPVRSv0Sv5uGKQ
 t9e9ntfnBwLUXPMs+iKYWfzgLeXAI05x2sARGyLpO6mPKvd+KSPHHZWtPGSvCa9iLsDe
 JAbj3KwO197uIG2HCntE0bUuJG27AuQ3bpfjWWJd5rkSM3GlTcFDDP+sNRuPS1oLg4Yt
 8KhEZ5SRwfnEHs/G5Og/mNJ6sMNLW5YMPy3/Y9BuByxyFMiu1185HaH2Vg5y3a0dQDpw
 I5vRJYEAUp1pMyyPJ7BKDDlYGuZe4hu5W5GeYYSwxPn25BXNtMUZXz0TPeYG6WhML0WS
 X9mQ==
X-Gm-Message-State: AOAM532qlwFB2sMUlTgAzCjQvtz9yUMESFLBmDmyrMdCQzrYdYqSg47D
 wZHwaL5n7WBNusU/TfN0iEoArA==
X-Google-Smtp-Source: ABdhPJy4vtj0YaDDv+N62BqSY1+sbUlLVxDIA5VDRfNXI6UCmawT2pPfkUXVK1oob9gm0zwV1OTU5w==
X-Received: by 2002:a1c:f219:: with SMTP id s25mr1120513wmc.31.1622570587323; 
 Tue, 01 Jun 2021 11:03:07 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z17sm4708962wrt.81.2021.06.01.11.03.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 11:03:06 -0700 (PDT)
Date: Tue, 1 Jun 2021 20:03:04 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] vgaarb: Call vga_arb_device_init() after PCI enumeration
Message-ID: <YLZ2WJlHu0EZT7H9@phenom.ffwll.local>
References: <20210528082607.2015145-1-chenhuacai@loongson.cn>
 <YLZYuM6SepbeLcI7@phenom.ffwll.local> <YLZqe14Lf2+5Lbf3@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YLZqe14Lf2+5Lbf3@kroah.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Bjorn Helgaas <bhelgaas@google.com>, Xuefeng Li <lixuefeng@loongson.cn>,
 Huacai Chen <chenhuacai@loongson.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 01, 2021 at 07:12:27PM +0200, Greg KH wrote:
> On Tue, Jun 01, 2021 at 05:56:40PM +0200, Daniel Vetter wrote:
> > On Fri, May 28, 2021 at 04:26:07PM +0800, Huacai Chen wrote:
> > > We should call vga_arb_device_init() after PCI enumeration, otherwise it
> > > may fail to select the default VGA device. Since vga_arb_device_init()
> > > and PCI enumeration function (i.e., pcibios_init() or acpi_init()) are
> > > both wrapped by subsys_initcall(), their sequence is not assured. So, we
> > > use subsys_initcall_sync() instead of subsys_initcall() to wrap vga_arb_
> > > device_init().
> 
> Trying to juggle levels like this always fails if you build the code as
> a module.
> 
> Why not fix it properly and handle the out-of-order loading by returning
> a "deferred" error if you do not have your resources yet?

It's not a driver, it's kinda a bolted-on-the-side subsytem of pci. So not
something you can -EPROBE_DEFER I think, without potentially upsetting the
drivers that need this.

Which might mean we should move this into pci subsystem proper perhaps?
Then adding the init call at the right time becomes trivial since we just
plug it in at the end of pci init.

Also maybe that's how distros avoid this pain, pci is built-in, vgaarb is
generally a module, problem solved.

Bjorn, would you take this entire vgaarb.c thing? From a quick look I
don't think it has a drm-ism in it (unlike vga_switcheroo, but that works
a bit differently and doesn't have this init order issue).

Thoughts on this?
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
