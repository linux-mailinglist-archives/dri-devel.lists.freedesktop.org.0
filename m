Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7516F1B2D
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 17:09:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65E6210E3C5;
	Fri, 28 Apr 2023 15:09:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AE4510E3C5
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 15:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682694551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CtuyV//oUjSwLm+8sbTRXQA1ElJkX8KhmdItyI9uBhU=;
 b=Jc73HwRHtAvxUGkS/O6wMrs4BtWg9l+mKLF+wIFJcu5u62HY2D57dN5DA/wx65AfrVvBPB
 +Du6XKui7VC5Lw1VTsZPQJZRVUZ6CKyEFwUBDhTM/4S/KqU5USLPtUZULmbMzU/OEc2eYh
 EH4WHHzJaHxuPXGDGsHDv2G+sSqs+IY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-265-bbosu54mPuuNHARFy947ZQ-1; Fri, 28 Apr 2023 11:08:46 -0400
X-MC-Unique: bbosu54mPuuNHARFy947ZQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-2f446161e5aso6059737f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 08:08:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682694516; x=1685286516;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CtuyV//oUjSwLm+8sbTRXQA1ElJkX8KhmdItyI9uBhU=;
 b=PlskVcLQ5Sx7KTurbEciZnzyPy/hXH8ENAmWWAcWUcANGzgbPg/MfsejA3k6yWjUD6
 TV/2rcS+zQpF/8NP+Kj+CQ3QI/fr5moqrfLZQtOIFHvrEbLVnZ9gWeOv5NDBR3XH8VsN
 JWBu8jupYE044k0uchrGBRgUx36qw9Up2apP2jEtWi/awf+cvZZEegq2NZ3OwA5V7iFT
 aA7WDD555FGHsJpnMKq4M2LZqHuSCMYpNPlPRG7Ww1uzhc8mWsYnRLhIQUvmN/saocPE
 8o3z6vCTnbPiknjW3MHIORpCnUONhKrMODg1smesXKy46svY+rJRGd8epge3y30Mphhx
 ZP8w==
X-Gm-Message-State: AC+VfDyAtZx5WkwW+nJgAjOoqnY0anH0u4vS56Z++mvsF0C2CntvUKcZ
 mFz65gimOVYTC5maBAvK3eHuWUoO6GMwDVADm2KmTOj0Y/0zeHHd1+L0Bftgdjcp8pGUPUGt/WR
 4A9NpyZBxotT32kfiqLA+rg3BIUvG
X-Received: by 2002:adf:f9cd:0:b0:300:cb8c:fd8f with SMTP id
 w13-20020adff9cd000000b00300cb8cfd8fmr4303856wrr.54.1682694516518; 
 Fri, 28 Apr 2023 08:08:36 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5FgJceQYz2SY41hmwVKRoPDdwpglz9z+P8bHRPnmCN2iLhJTTykty1Ty35JpjNffWOYwatQA==
X-Received: by 2002:adf:f9cd:0:b0:300:cb8c:fd8f with SMTP id
 w13-20020adff9cd000000b00300cb8cfd8fmr4303836wrr.54.1682694516221; 
 Fri, 28 Apr 2023 08:08:36 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 k5-20020adff5c5000000b002f103ca90cdsm21275148wrp.101.2023.04.28.08.08.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 08:08:35 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, deller@gmx.de, geert@linux-m68k.org,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com
Subject: Re: [PATCH v2 10/19] fbdev/smscufx: Use struct fb_info.screen_buffer
In-Reply-To: <20230428122452.4856-11-tzimmermann@suse.de>
References: <20230428122452.4856-1-tzimmermann@suse.de>
 <20230428122452.4856-11-tzimmermann@suse.de>
Date: Fri, 28 Apr 2023 17:08:34 +0200
Message-ID: <87r0s4f3il.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Use info->screen_buffer when reading and writing framebuffers in
> system memory. It's the correct pointer for this address space.
>
> The struct fb_info has a union to store the framebuffer memory. This can
> either be info->screen_base if the framebuffer is stored in I/O memory,
> or info->screen_buffer if the framebuffer is stored in system memory.
>
> As the driver operates on the latter address space, it is wrong to use
> .screen_base and .screen_buffer must be used instead.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

