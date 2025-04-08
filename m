Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BDC1A7F9E8
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 11:40:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C2D610E24A;
	Tue,  8 Apr 2025 09:40:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="h4C/7Jk2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D05710E24A
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 09:40:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 753C75C3ED0
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 09:38:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 310FEC4CEEC
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 09:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744105249;
 bh=I2AgDzdoUMKOEk2CC5RFBtKqtj/m1qaQHe4ocmNticI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=h4C/7Jk2XZVRGZfTZ7nkRmlummdd90Aqq78zhpsiJ6CubwI0DulHna9vzklfGqPsF
 4Tn2PEeGDPzRPTmAYmLvrdZf6LNawykmb5umBacCjC84AMS8BHv9kM9g47goHJ/EQ0
 1BLfkGyzSYmbskOeTU689sYRnWusra8hGEVizBe75+OYRXej55dmuKUVxd/usLtfh2
 05VC+WfG8KVGeQbOw/dl3Lg9yz/u/KBpt+ZN7tQtfmHwvcacEb84ewhg/2uuq7Wn9r
 /wLMsRmqX8Iw84DWEsltqE4zEX2QRNBvnBVsV9ImeKgEuVeAGQa0NgVA0mSYkTooc5
 8A6yFBRjwyeiw==
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-54993c68ba0so6012260e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Apr 2025 02:40:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVCd8vKqK/TZ6O8KFoXVAIdoJmctktj5a9yAMi0Ux3JY/seTNqUgGqv7ppwt7D0eyhB2ZrAt6h9GwQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxcurCvh6e664Z6mO0O+syBzx/FdD3lgy76LIXu3UzP2Qq7EftO
 aYWK0/VobZWoWaJ9oHh2moHDLtzVlPJhRK05zMrBenOGfCW0KseBofLJoec/tO1x0xOGmj7AUzl
 yxHMEqHIwqHBvkVvZ2AbUwQyAXfc=
X-Google-Smtp-Source: AGHT+IEQs9yxbBq25xJiwoySQKzD+oDp5LFNKwVqxr7W8kzjdpSblaKERlwMWIne8n6fwxnS3iJrzfWTjXKy5zfC1Vs=
X-Received: by 2002:a05:6512:39c7:b0:548:de80:5354 with SMTP id
 2adb3069b0e04-54c22786570mr4393599e87.21.1744105247537; Tue, 08 Apr 2025
 02:40:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250408091837.407401-1-tzimmermann@suse.de>
 <20250408091837.407401-2-tzimmermann@suse.de>
In-Reply-To: <20250408091837.407401-2-tzimmermann@suse.de>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 8 Apr 2025 11:40:36 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFTrY=8njYkbY3_skK8oJOY7-Y4wEdAPV6vUvi7hT2F7A@mail.gmail.com>
X-Gm-Features: ATxdqUHu3RoMw86iA5sS1RLFCahhZKy6DnNRtRKM8sXcthFwWJ0osc6Jycy3HPI
Message-ID: <CAMj1kXFTrY=8njYkbY3_skK8oJOY7-Y4wEdAPV6vUvi7hT2F7A@mail.gmail.com>
Subject: Re: [PATCH 1/2] efi: Export symbol efi_mem_desc_lookup
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: javierm@redhat.com, linux-efi@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
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

On Tue, 8 Apr 2025 at 11:22, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Building efidrm as module requires efi_mem_desc_lookup(). Export
> the symbol.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/firmware/efi/efi.c | 1 +
>  1 file changed, 1 insertion(+)
>

Acked-by: Ard Biesheuvel <ardb@kernel.org>

Feel free to take this via a DRM tree.


> diff --git a/drivers/firmware/efi/efi.c b/drivers/firmware/efi/efi.c
> index 7309394b8fc98..e57bff702b5f4 100644
> --- a/drivers/firmware/efi/efi.c
> +++ b/drivers/firmware/efi/efi.c
> @@ -558,6 +558,7 @@ int __efi_mem_desc_lookup(u64 phys_addr, efi_memory_desc_t *out_md)
>
>  extern int efi_mem_desc_lookup(u64 phys_addr, efi_memory_desc_t *out_md)
>         __weak __alias(__efi_mem_desc_lookup);
> +EXPORT_SYMBOL_GPL(efi_mem_desc_lookup);
>
>  /*
>   * Calculate the highest address of an efi memory descriptor.
> --
> 2.49.0
>
