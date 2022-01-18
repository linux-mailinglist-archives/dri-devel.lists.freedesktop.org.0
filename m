Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8265492B67
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 17:38:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA23510E851;
	Tue, 18 Jan 2022 16:38:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4564D10E851
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 16:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642523904;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8x4jiJLRLzOXptnR37jToyWvpyqaqN0hmddUBjj4FJ0=;
 b=JeaGyuu9ePidANZ284SHZfmRw/5m6fEQM6/aF8iBF7MMQHJsH6LvOi0J3M+a8C3B2Iymbq
 jCyVAwu9qJ+GabNzdn38EJdz3GoOOQGGVSlTgTyNN+K/a9NAibevNINVx32J7lurOOWcWK
 cbI/hpxzbnjlXqPd7ofRedv/zmDQvN4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-146-ViAkzSXlPwGebq4mKGJrwA-1; Tue, 18 Jan 2022 11:38:22 -0500
X-MC-Unique: ViAkzSXlPwGebq4mKGJrwA-1
Received: by mail-wm1-f71.google.com with SMTP id
 o193-20020a1ca5ca000000b0034d78423625so930766wme.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 08:38:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8x4jiJLRLzOXptnR37jToyWvpyqaqN0hmddUBjj4FJ0=;
 b=bWZLLdWmo8G5WCd2ZQ7R/zQYJXaJojldIQ6f5RmzTpHjxygG2CwgRdGKtciaciVSwM
 FaPGYCG6Jvc89Yb8kW/4jPgwoYQP9MsGUw2rTuOvR51HK7KZk8aAOZLbMvQrrG5mbNo8
 PZGXFdrdO2q1KBaZHrgP37TepdnxDXrIYksyk+zayCnTl/hod2R2ewmDZFZJTh9NGlsi
 qkixCtxOP/4dQ3QywFxIS++Q0QSlfytT8HfwbjJqM7+ll4Jtc8teZfschITrzb4Z6/4X
 viBAIvDJy6VtmZdNBU3MikrAw/wh8W32Agr1i3lDKJKY0t+E15uDM2i0eKNhlop69IVR
 vGDw==
X-Gm-Message-State: AOAM532k0DJmKuT1LEEZ9KTzIU5tnLjH9VNt4uoH1ncgH5cMUzVs/NN/
 vJGAbgh7dwJVVgcJZs+iycQ2+umpd4UrdBbeEntQMxGch4ykjuwSup9lZ1dQw4YQjzVFjSbJy9q
 wFTNL57IRddmjYBnNz9GWMBLaqFMH
X-Received: by 2002:a05:600c:4f0b:: with SMTP id
 l11mr9633105wmq.112.1642523901431; 
 Tue, 18 Jan 2022 08:38:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxV6dcnIH/1jLHwjDAz0s7z7lQxnm3nKgxZjncTV7++UR8hKk6MpwYbCYtAmc70miVAmLK8Xg==
X-Received: by 2002:a05:600c:4f0b:: with SMTP id
 l11mr9633087wmq.112.1642523901121; 
 Tue, 18 Jan 2022 08:38:21 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id e15sm6315946wrg.85.2022.01.18.08.38.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jan 2022 08:38:20 -0800 (PST)
Message-ID: <b6526036-fcfb-734a-b45f-9ceec8aa656f@redhat.com>
Date: Tue, 18 Jan 2022 17:38:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] mgag200 fix memmapsl configuration in GCTL6 register
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org
References: <20220114094754.522401-1-jfalempe@redhat.com>
 <20220114094754.522401-2-jfalempe@redhat.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220114094754.522401-2-jfalempe@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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

Hello Jocelyn,

On 1/14/22 10:47, Jocelyn Falempe wrote:
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
>     0: Enables alpha mode, and the character generator addressing system is activated.
>     1: Enables graphics mode, and the character addressing system is not used.
> 
> bit 1 is chainodd even:
>     0: The A0 signal of the memory address bus is used during system memory
>     addressing.
>     1: Allows A0 to be replaced by either the A16 signal of the system address (if
>     memmapsl is ‘00’), or by the hpgoddev (MISC<5>, odd/even page select) field,
>     described on page 3-294).
> 
> bit 3-2 are memmapsl:
>     Memory map select bits 1 and 0. VGA.
>     These bits select where the video memory is mapped, as shown below:
>         00 => A0000h - BFFFFh
>         01 => A0000h - AFFFFh
>         10 => B0000h - B7FFFh
>         11 => B8000h - BFFFFh
> 
> bit 7-4 are reserved.
> 
> Current driver code set it to 0x05 => memmapsl to b01 => 0xA0000
> but on x86, the VGA console is at 0xB8000

I think this need some rewording after imirkin's explanation that 0xA0000 is the
address of the VGA video memory and 0xB8000 the address of the VGA text buffer.

> arch/x86/boot/compressed/misc.c define vidmem to 0xb8000 in extract_kernel()
> so it's better to configure it to b11
> Thus changing the value 0x05 to 0x0d
> 
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>  drivers/gpu/drm/mgag200/mgag200_mode.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
> index b983541a4c53..c7f63610b278 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
> @@ -529,7 +529,7 @@ static void mgag200_set_format_regs(struct mga_device *mdev,
>  	WREG_GFX(3, 0x00);
>  	WREG_GFX(4, 0x00);
>  	WREG_GFX(5, 0x40);
> -	WREG_GFX(6, 0x05);
> +	WREG_GFX(6, 0x0d);

My worry is if this could cause other issues so I would only do this change
if (is_kdump_kernel()), to make it as non intrusive as possible. And also
add a verbose comment about why this is needed.

If you make those changes, feel free to add:

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

