Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE62A4E50EA
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 12:02:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFC5A10E6A2;
	Wed, 23 Mar 2022 11:01:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1590D10E17E
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Mar 2022 18:43:23 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id h23so24089312wrb.8
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Mar 2022 11:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=PTw1Ngb/5IGZJfySo52s6yL6EQYSBf4xK9vWZzdHvqA=;
 b=OpP1yr+zy1OjfHROi7aD3NDxRfVNU5xYU5sKI6GfLagMM2/XUgbjQyj+ubE8Ph92IB
 7qarV5iq5TMCXv9UJsTaZavEFNsCReJsVV7g8oEUUYvLaLpIcY1PNEN/N3Kv6lSnUjur
 aVungH7taEPjAY6OZNBJQCkyc3DQai5kSEK8U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PTw1Ngb/5IGZJfySo52s6yL6EQYSBf4xK9vWZzdHvqA=;
 b=cvuYIwzwRi3TsaHDMZSJj0EHE12TOCz/vGizgi/mIeQ3HM9j24wn8XR1GuTSoL7CZv
 OGWw58ZoSvUzoePXkiKH/zaxDogkyEzb96cyp0BAibaAnx/hgq7gdbNeIW1em/crdO51
 b4Bv+dLNye1Uud2yjeREbiWQfGWl645wKgtK3IYpZ8vr1YCMdUTrjvn/GCx4o0lag5KE
 xJLY1WWGdcWpmmIoBlIugujqfcMcj8UHAy7RRfukW+ej3ykOSMal0kYSLm/XxJ5I5Oam
 yx+Qvo00X2kgldRWX9vf83WRYLuqbpdbYqiTgs7WZnbbuXADmmmKbBESskSS8/M3xG7f
 ZzOQ==
X-Gm-Message-State: AOAM532YNcVAd1Cu/NJjuTXMdOtFiFPjHRBxIBJeC7HGPdBZyFByJwRb
 kl1iaDzvPUSeacEntPPDMOX/GQ==
X-Google-Smtp-Source: ABdhPJxWJhc/mrUfLmxDPc/wDdSNZS4bI61hMpAh3233GY9QkpMhRpVU8f/XIxdk6ptlwsw1crMHLA==
X-Received: by 2002:adf:fccc:0:b0:203:fe14:e316 with SMTP id
 f12-20020adffccc000000b00203fe14e316mr15173047wrs.42.1647974601600; 
 Tue, 22 Mar 2022 11:43:21 -0700 (PDT)
Received: from tom-ThinkPad-T14s-Gen-2i
 (net-188-217-56-61.cust.vodafonedsl.it. [188.217.56.61])
 by smtp.gmail.com with ESMTPSA id
 f7-20020a5d64c7000000b0020415e54576sm5136826wri.69.2022.03.22.11.43.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 11:43:21 -0700 (PDT)
Date: Tue, 22 Mar 2022 19:43:19 +0100
From: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2] drm/nouveau/bios: Rename prom_init() and friends
 functions
Message-ID: <20220322184319.GA2353627@tom-ThinkPad-T14s-Gen-2i>
References: <7e0612b61511ec8030e3b2dcbfaa7751781c8b91.1647684507.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7e0612b61511ec8030e3b2dcbfaa7751781c8b91.1647684507.git.christophe.leroy@csgroup.eu>
X-Mailman-Approved-At: Wed, 23 Mar 2022 11:01:42 +0000
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
Cc: Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Mar 19, 2022 at 11:27:51AM +0100, Christophe Leroy wrote:
> While working at fixing powerpc headers, I ended up with the
> following error.
> 
> 	drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowrom.c:48:1: error: conflicting types for 'prom_init'; have 'void *(struct nvkm_bios *, const char *)'
> 	make[5]: *** [scripts/Makefile.build:288: drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowrom.o] Error 1
> 
> powerpc and a few other architectures have a prom_init() global function.
> One day or another it will conflict with the one in shadowrom.c
> 
> Those being static, they can easily be renamed. Do it.
> 
> While at it, also rename the ops structure as 'nvbios_prom' instead of
> 'nvbios_rom' in order to make it clear that it refers to the
> NV_PROM device.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
> v2: using nvbios_prom prefix instead of nvbios_rom. Changed structure name to keep things consistant.
> 
>  drivers/gpu/drm/nouveau/nvkm/subdev/bios/priv.h    |  2 +-
>  drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadow.c  |  2 +-
>  .../gpu/drm/nouveau/nvkm/subdev/bios/shadowrom.c   | 14 +++++++-------
>  3 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/priv.h b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/priv.h
> index fac1bff1311b..cfa8a0c356dd 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/priv.h
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/priv.h
> @@ -19,7 +19,7 @@ struct nvbios_source {
>  int nvbios_extend(struct nvkm_bios *, u32 length);
>  int nvbios_shadow(struct nvkm_bios *);
>  
> -extern const struct nvbios_source nvbios_rom;
> +extern const struct nvbios_source nvbios_prom;
>  extern const struct nvbios_source nvbios_ramin;
>  extern const struct nvbios_source nvbios_acpi_fast;
>  extern const struct nvbios_source nvbios_acpi_slow;
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadow.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadow.c
> index 4b571cc6bc70..19188683c8fc 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadow.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadow.c
> @@ -171,7 +171,7 @@ nvbios_shadow(struct nvkm_bios *bios)
>  	struct shadow mthds[] = {
>  		{ 0, &nvbios_of },
>  		{ 0, &nvbios_ramin },
> -		{ 0, &nvbios_rom },
> +		{ 0, &nvbios_prom },
>  		{ 0, &nvbios_acpi_fast },
>  		{ 4, &nvbios_acpi_slow },
>  		{ 1, &nvbios_pcirom },
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowrom.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowrom.c
> index ffa4b395220a..39144ceb117b 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowrom.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowrom.c
> @@ -25,7 +25,7 @@
>  #include <subdev/pci.h>
>  
>  static u32
> -prom_read(void *data, u32 offset, u32 length, struct nvkm_bios *bios)
> +nvbios_prom_read(void *data, u32 offset, u32 length, struct nvkm_bios *bios)
>  {
>  	struct nvkm_device *device = data;
>  	u32 i;
> @@ -38,14 +38,14 @@ prom_read(void *data, u32 offset, u32 length, struct nvkm_bios *bios)
>  }
>  
>  static void
> -prom_fini(void *data)
> +nvbios_prom_fini(void *data)
>  {
>  	struct nvkm_device *device = data;
>  	nvkm_pci_rom_shadow(device->pci, true);
>  }
>  
>  static void *
> -prom_init(struct nvkm_bios *bios, const char *name)
> +nvbios_prom_init(struct nvkm_bios *bios, const char *name)
>  {
>  	struct nvkm_device *device = bios->subdev.device;
>  	if (device->card_type == NV_40 && device->chipset >= 0x4c)
> @@ -55,10 +55,10 @@ prom_init(struct nvkm_bios *bios, const char *name)
>  }
>  
>  const struct nvbios_source
> -nvbios_rom = {
> +nvbios_prom = {
>  	.name = "PROM",
> -	.init = prom_init,
> -	.fini = prom_fini,
> -	.read = prom_read,
> +	.init = nvbios_prom_init,
> +	.fini = nvbios_prom_fini,
> +	.read = nvbios_prom_read,
>  	.rw = false,
>  };
> -- 
> 2.35.1
> 

Look's good.

Tommaso
-- 
Tommaso Merciai
Embedded Linux Engineer
tommaso.merciai@amarulasolutions.com
__________________________________

Amarula Solutions SRL
Via Le Canevare 30, 31100 Treviso, Veneto, IT
T. +39 042 243 5310
info@amarulasolutions.com
www.amarulasolutions.com
