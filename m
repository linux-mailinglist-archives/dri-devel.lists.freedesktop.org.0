Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E22D3C756B
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 18:59:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6A936E0FD;
	Tue, 13 Jul 2021 16:59:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DCAA6E0FD
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jul 2021 16:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626195596;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XTHdlYNv/a9BuVPGjnPy+dQ/mQjufPe+yKG6ndLoXU8=;
 b=eX0vNDQetw4M4XvuzdRcpzZcTe4FtS5+xgrR+G5VXPhCmc0t0q/NkkDd+By1EFfppUZwyA
 j+0h4jpvRagFIp8303DxtzUj1YkYvw13WZsOOQGn4Jl4jrLAfIy0ZKR3eZwWWbnZr4HAVg
 wN0h7kqIAlJJ8TlEVQGTw3NU2rn9dCk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-Wmvbdje2NfOVqe3LAyq5Ng-1; Tue, 13 Jul 2021 12:59:55 -0400
X-MC-Unique: Wmvbdje2NfOVqe3LAyq5Ng-1
Received: by mail-wr1-f69.google.com with SMTP id
 z6-20020a5d4c860000b029013a10564614so8759255wrs.15
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jul 2021 09:59:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XTHdlYNv/a9BuVPGjnPy+dQ/mQjufPe+yKG6ndLoXU8=;
 b=tpqsKE7F8B1i5K5OiYEIcTD7K3eztlzjPSzACm965Vo+BFMzgqM0r7t0OXf1+nXfTn
 9ThS7XCEPb3PKj8Ypf9YsBrV2M2ZeEdNLs3zJvd0kWzrvk6DMI5K1tvrSlGcky1L/Cov
 Z2ollq52VLfX8EfLcU3t3JFo/tpbgv1ghSICF2TrIqAUwZ0j4Mmie9fQBUAeKWnaT8PK
 9u2/NdVivXt8UwGYVvSHOFf/wJg1WbXNXLNCmLAgAYxVu/kDyfiAL4aO6xzYERbo+HqK
 J0PV0H+E/ZTiSBNy1MHNCE6iv9NhFy452pyySWLUDRZxTaFW7qzWTcRaGcNBkFB4S+3c
 BjZQ==
X-Gm-Message-State: AOAM532iWCqCzWqZJconsvmElC6bWUzuietsYGsk7qx+lvDbSPsiT7nu
 hnGA5JsYipSWct4dart/MdC9mC6x01Xgl6sR5LpjgbWaOQFj2N6YjIHIa1unMnTFgUTQ9iYplxi
 vKOeDNej/VByFWoN92Axzet7AtTQz
X-Received: by 2002:a05:600c:2105:: with SMTP id
 u5mr1986026wml.18.1626195593924; 
 Tue, 13 Jul 2021 09:59:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxumMUPdgM1d9aW8ug3rd8W69QVL7ebCKDjq/l4syiEd2xfO/CLyenHYKdqhxzMxt12Uge4rQ==
X-Received: by 2002:a05:600c:2105:: with SMTP id
 u5mr1986010wml.18.1626195593743; 
 Tue, 13 Jul 2021 09:59:53 -0700 (PDT)
Received: from [192.168.1.101] ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id o28sm19766410wra.71.2021.07.13.09.59.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jul 2021 09:59:53 -0700 (PDT)
Subject: Re: [PATCH v3 0/2] allow simple{fb, drm} drivers to be used on non-x86
 EFI platforms
To: linux-kernel@vger.kernel.org
References: <20210625130947.1803678-1-javierm@redhat.com>
From: Javier Martinez Canillas <javierm@redhat.com>
Message-ID: <e61cf77c-6bff-dfcc-d3df-2fb6b48e5897@redhat.com>
Date: Tue, 13 Jul 2021 18:59:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210625130947.1803678-1-javierm@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: linux-efi@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Catalin Marinas <catalin.marinas@arm.com>, dri-devel@lists.freedesktop.org,
 Atish Patra <atish.patra@wdc.com>, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 Ingo Molnar <mingo@redhat.com>, Peter Robinson <pbrobinson@gmail.com>,
 Borislav Petkov <bp@suse.de>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Zimmermann <tzimmermann@suse.de>, Hans de Goede <hdegoede@redhat.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/25/21 3:09 PM, Javier Martinez Canillas wrote:
> The simplefb and simpledrm drivers match against a "simple-framebuffer"
> device, but for aarch64 this is only registered when using Device Trees
> and there's a node with a "simple-framebuffer" compatible string.
> 
> There is no code to register a "simple-framebuffer" platform device when
> using EFI instead. In fact, the only platform device that's registered in
> this case is an "efi-framebuffer", which means that the efifb driver is
> the only driver supported to have an early console with EFI on aarch64.
> 
> The x86 architecture platform has a Generic System Framebuffers (sysfb)
> support, that register a system frambuffer platform device. It either
> registers a "simple-framebuffer" for the simple{fb,drm} drivers or legacy
> VGA/EFI FB devices for the vgafb/efifb drivers.
> 
> The sysfb is generic enough to be reused by other architectures and can be
> moved out of the arch/x86 directory to drivers/firmware, allowing the EFI
> logic used by non-x86 architectures to be folded into sysfb as well.
> 

Any more comments on this series? It would be nice for this to land so the
simpledrm driver could be used on aarch64 EFI systems as well.

The patches have already been acked by x86 and DRM folks.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering

