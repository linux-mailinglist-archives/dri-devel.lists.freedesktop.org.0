Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9220890697A
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 11:58:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 867CF10E9EF;
	Thu, 13 Jun 2024 09:57:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="cLZfRIzu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1685A10E9EE
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 09:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718272674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DFPOJ2hSIaSgoYB7lOp5T4CRdabG9WpRLVhiydu9eE4=;
 b=cLZfRIzuhTIeHKlm3bTGTdRAYH4SW609ZyrgbeWH+F3rLR8ylJMMmN01GWSkU+F6vZbQ6V
 9oHoRNmEveR3Qt7W5rZbylc3fstXyw2uTH35n3xYwOqgZEXC1D1UDRsrwfXwYTeGM1bUFm
 NXfrIpjatd1FLxaybv9vM+z9tR5ufLI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-660-sBZuMcHNPUK9Ga3zxYe0xA-1; Thu, 13 Jun 2024 05:57:52 -0400
X-MC-Unique: sBZuMcHNPUK9Ga3zxYe0xA-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-421811b92bcso5226245e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 02:57:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718272671; x=1718877471;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DFPOJ2hSIaSgoYB7lOp5T4CRdabG9WpRLVhiydu9eE4=;
 b=UPxzWkaaVc/yvYGOrVKc2hz1yBfIr/wANCqC/hiDy59+DIgpQT/D9FspzIpHFUI0l4
 fmur0nttUOpmqZyGpviJ1ZdnrTyc+OZjy4nuVRADvmU82nKyxCx6k4EWiyWI05CHUVRk
 iJqo2gXB1y/GoAgkLzAdXjS6Nn7h3/9kpneGpT9PVvd2D4xIxIvvr6AqsUBsHKLF7/oR
 erbtbQ1SUgahOm68Iw6upsxWkYJr6puhiPZPdxdzqVEVk7oZ387i4k1DaX/E4Ur3kBXm
 NqYYzjOh8dxwBxpf+tXUvvKpX8PEUk6kNacmWrSM5gcjFEd6zOHasy7O9xWImPRjgDaH
 lxAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzFaSiW6yQIDMw2CLH9DPbSxPOApmCFgPGxr94RwtCwGwWksSxZDgLvmh2NJAPvce/0FLVitbrJqULWzcYoD7mUXAUOVcjC48DL+lhRuf5
X-Gm-Message-State: AOJu0YzV8ygtHsh8M3r8O0mc4f/AqDAs2D16Tl4RcUA3BE+MX7/iFDd/
 Fcj75w6BNNA5AipwEmXzrSaGN8mDav7iqvTAC+4r+O0+NdVDNcuNGJzaPa33rz1t7nGXzgty3am
 jdbit7wOPm2CJKZiuxLPPVGXvqv/k3ZKblcY5V526OdB0DSRcc1K0AXrVJ1+jZco7UQ==
X-Received: by 2002:a05:600c:310f:b0:41e:db33:9a4e with SMTP id
 5b1f17b1804b1-422866bc34amr32585685e9.39.1718272671167; 
 Thu, 13 Jun 2024 02:57:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGKxVqO3gRC4n1Hu5nh47Iqq6X484SlcFsPRKwYBuNanSOIuIw53eNqx/vh1p3V4X7kDpg3Sw==
X-Received: by 2002:a05:600c:310f:b0:41e:db33:9a4e with SMTP id
 5b1f17b1804b1-422866bc34amr32585495e9.39.1718272670623; 
 Thu, 13 Jun 2024 02:57:50 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-360750935ecsm1229362f8f.3.2024.06.13.02.57.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jun 2024 02:57:50 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de,
 sam@ravnborg.org, hpa@zytor.com
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org
Subject: Re: [PATCH] fbdev: vesafb: Detect VGA compatibility from screen
 info's VESA attributes
In-Reply-To: <eea40059-2692-4b1e-a92e-006908220f34@suse.de>
References: <20240613090240.7107-1-tzimmermann@suse.de>
 <87zfrpqj5y.fsf@minerva.mail-host-address-is-not-set>
 <eea40059-2692-4b1e-a92e-006908220f34@suse.de>
Date: Thu, 13 Jun 2024 11:57:49 +0200
Message-ID: <87wmmtqi5e.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Hi Javier
>
> Am 13.06.24 um 11:35 schrieb Javier Martinez Canillas:
>> Thomas Zimmermann <tzimmermann@suse.de> writes:
>>
>> Hello Thomas,
>>
>>> Test the vesa_attributes field in struct screen_info for compatibility
>>> with VGA hardware. Vesafb currently tests bit 1 in screen_info's
>>> capabilities field, It sets the framebuffer address size and is
>>> unrelated to VGA.
>>>
>>> Section 4.4 of the Vesa VBE 2.0 specifications defines that bit 5 in
>>> the mode's attributes field signals VGA compatibility. The mode is
>>> compatible with VGA hardware if the bit is clear. In that case, the
>>> driver can access VGA state of the VBE's underlying hardware. The
>>> vesafb driver uses this feature to program the color LUT in palette
>>> modes. Without, colors might be incorrect.
>>>
>>> The problem got introduced in commit 89ec4c238e7a ("[PATCH] vesafb: Fix
>>> incorrect logo colors in x86_64"). It incorrectly stores the mode
>>> attributes in the screen_info's capabilities field and updates vesafb
>>> accordingly. Later, commit 5e8ddcbe8692 ("Video mode probing support for
>>> the new x86 setup code") fixed the screen_info, but did not update vesafb.
>>> Color output still tends to work, because bit 1 in capabilities is
>>> usually 0.
>>>
>> How did you find this ?
>
> I was reading through vesafb and found that [1] and [2] look 
> surprisingly similar, which makes no sense. So I started looking where 
> bit 1 came from. The flag signals a 64-bit framebuffer address for EFI 
> (see VIDEO_CAPABILITY_64BIT_BASE 
> <https://elixir.bootlin.com/linux/latest/C/ident/VIDEO_CAPABILITY_64BIT_BASE>). 
> But old VESA framebuffers are usually located within the first 32-bit 
> range. So the bit is mostly 0 and vesafb works as expected.
>
> [1] 
> https://elixir.bootlin.com/linux/latest/source/drivers/video/fbdev/vesafb.c#L274
> [2] 
> https://elixir.bootlin.com/linux/latest/source/include/linux/screen_info.h#L26
>

I see. Thanks a lot for the explanation and references.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

