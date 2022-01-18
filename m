Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE099492E1E
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 20:06:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68B7A89D00;
	Tue, 18 Jan 2022 19:06:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44B7189D00
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 19:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642532783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ACOWplMtsTlxOywIoTgp+LHzU6or3si6W2xNoCd4PKY=;
 b=UQ1sVFA29w+17c8VuJTFHzNpBoUJupfqlwEzwJ9DBwZdTM7n7PhSWRDPUL9VTLfjjHmu2V
 cBk9283nk2j6DL129aWT7sVG7n5nm7BgWaor/4P0bqVMAhLPuKi3/HiIlwn/vMqZaLUmYW
 BJj2l9CUJ4VqaBPVtOs0Hf+pcQICuww=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-329-TXaXWJU1P9GqgoDf4MXCpQ-1; Tue, 18 Jan 2022 14:06:20 -0500
X-MC-Unique: TXaXWJU1P9GqgoDf4MXCpQ-1
Received: by mail-qt1-f199.google.com with SMTP id
 a26-20020ac8001a000000b002b6596897dcso15029655qtg.19
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 11:06:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=ACOWplMtsTlxOywIoTgp+LHzU6or3si6W2xNoCd4PKY=;
 b=zgcLYzZc72GKp8OFFy0Upyl0XBxPkzW3YnPDA30mhvdqNc2WTqmcY/A8Us3vrxKwES
 0oIVC17ssB8+5H+irR+1QXFIKY+Z4zrx37pCA+Bu8CJHcSUMKSVsZe5iLXzJE3Ia+ZbP
 EL4uqzjkzHaiAt6u5EZYOxyJirQuvyuRgLlGd1zLGYpf1goelGUqQtiwzldlWJljS4hC
 6y6oe2hFx661CUCjS0KuL+PYkUe60u7k68ZkRjWaOa6Hp2Avm6vsDS4JShT+3p35WLFf
 bbkwJG5fonrvJaBH4qiqK0LByDmukWZCwceIIa4V8Eg4j/Y+wiu8/ym5Y4S+8uCEUrVG
 JRbQ==
X-Gm-Message-State: AOAM532FLJyva1IXSAeEaItBH6WdRtp0GaJ6vtpB4tRAEWnE+QJWLIQz
 l/ej8PLvoT4X96tyb8FTrSP9t8/WqflaJnu4l5z1cIkJ8hpZzFWFiN43CQPUpnYDiuaB/+y8rXP
 4aNLqtpA7n9qNN3kb93dXuHxYaULL
X-Received: by 2002:a05:620a:29ce:: with SMTP id
 s14mr10064276qkp.617.1642532779596; 
 Tue, 18 Jan 2022 11:06:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxnT4KUH2COi0rygtiP93ze5ipCrubfB74ndFJPRlX/APhEPLFcl7OjG4Y1v2u4EJwv8eZDaw==
X-Received: by 2002:a05:620a:29ce:: with SMTP id
 s14mr10064254qkp.617.1642532779279; 
 Tue, 18 Jan 2022 11:06:19 -0800 (PST)
Received: from [192.168.8.138] (pool-98-118-105-43.bstnma.ftas.verizon.net.
 [98.118.105.43])
 by smtp.gmail.com with ESMTPSA id t30sm10635561qkj.125.2022.01.18.11.06.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jan 2022 11:06:18 -0800 (PST)
Message-ID: <8e2fed4af467f335def97232abbc22d86aff0617.camel@redhat.com>
Subject: Re: [PATCH] mgag200 fix memmapsl configuration in GCTL6 register
From: Lyude Paul <lyude@redhat.com>
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org
Date: Tue, 18 Jan 2022 14:06:17 -0500
In-Reply-To: <20220114094754.522401-2-jfalempe@redhat.com>
References: <20220114094754.522401-1-jfalempe@redhat.com>
 <20220114094754.522401-2-jfalempe@redhat.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.2 (3.42.2-1.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Cc: michel@daenzer.net, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We should probably  Cc: stable@vger.kernel.org this as well, see: 

https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html for
more info. As well, some useful tools for adding the appropriate Fixes: tags:

https://drm.pages.freedesktop.org/maintainer-tools/dim.html

At least on my end this is:

Acked-by: Lyude Paul <lyude@redhat.com>

I'd very much like Thomas Zimmerman to verify that this patch is OK though
with an R-b before we push anything upstream.

On Fri, 2022-01-14 at 10:47 +0100, Jocelyn Falempe wrote:
> On some server with MGA G200e (rev 42), booting with Legacy BIOS,
> The hardware hangs when using kdump and kexec into the kdump kernel.
> This happens when the uncompress code tries to write "Decompressing Linux"
> to the VGA Console.
> 
> It can be reproduced by writing to the VGA console (0xB8000) after
> booting to graphic mode, it generates the following error:
> 
> kernel:NMI: PCI system error (SERR) for reason a0 on CPU 0.
> kernel:Dazed and confused, but trying to continue
> 
> The root cause is a bad configuration of the MGA GCTL6 register
> 
> According to the GCTL6 register documentation:
> 
> bit 0 is gcgrmode:
>     0: Enables alpha mode, and the character generator addressing system is
> activated.
>     1: Enables graphics mode, and the character addressing system is not
> used.
> 
> bit 1 is chainodd even:
>     0: The A0 signal of the memory address bus is used during system memory
>     addressing.
>     1: Allows A0 to be replaced by either the A16 signal of the system
> address (if
>     memmapsl is ‘00’), or by the hpgoddev (MISC<5>, odd/even page select)
> field,
>     described on page 3-294).
> 
> bit 3-2 are memmapsl:
>     Memory map select bits 1 and 0. VGA.
>     These bits select where the video memory is mapped, as shown below:
>         00 => A0000h - BFFFFh
>         01 => A0000h - AFFFFh
>         10 => B0000h - B7FFFh
>         11 => B8000h - BFFFFh
> 
> bit 7-4 are reserved.
> 
> Current driver code set it to 0x05 => memmapsl to b01 => 0xA0000
> but on x86, the VGA console is at 0xB8000
> arch/x86/boot/compressed/misc.c define vidmem to 0xb8000 in extract_kernel()
> so it's better to configure it to b11
> Thus changing the value 0x05 to 0x0d
> 
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>  drivers/gpu/drm/mgag200/mgag200_mode.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c
> b/drivers/gpu/drm/mgag200/mgag200_mode.c
> index b983541a4c53..c7f63610b278 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
> @@ -529,7 +529,7 @@ static void mgag200_set_format_regs(struct mga_device
> *mdev,
>         WREG_GFX(3, 0x00);
>         WREG_GFX(4, 0x00);
>         WREG_GFX(5, 0x40);
> -       WREG_GFX(6, 0x05);
> +       WREG_GFX(6, 0x0d);
>         WREG_GFX(7, 0x0f);
>         WREG_GFX(8, 0x0f);
>  

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

