Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DEDB9737E3
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 14:49:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3DDD10E7B9;
	Tue, 10 Sep 2024 12:49:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ZUEi1fxA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8925610E121
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2024 12:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725972577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6nd62AWkPIK5gIXPiUm1JLX0Wy6uPdrxO6zecHjvld0=;
 b=ZUEi1fxAStn1fwPuDmBH6pWhIqphxwJZbSMylVl025zK5/UxkVAksNzElR/Ef7NX44ld3Q
 JHYJN9hVaYIhwId5TJZXS9CH68yvmyvgzLO9UTS2Loqlzm65v13nmcenVmdUOOjtLaSFEm
 neaCZYg/rvDpxtYVIHHW/zIHK7m5RPE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-108-bD1Ew4XuMyeQu-wfY4lsaA-1; Tue, 10 Sep 2024 08:49:36 -0400
X-MC-Unique: bD1Ew4XuMyeQu-wfY4lsaA-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-374c79bf194so517439f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2024 05:49:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725972575; x=1726577375;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6nd62AWkPIK5gIXPiUm1JLX0Wy6uPdrxO6zecHjvld0=;
 b=QVFu+b5GFTkdoniCHFLBJq8ixkuM/QDt3tZ1h6Bzc0XmqoKesVbZgzZeudz/b+VO2Q
 C5vsf5VJ3mcZITq1VmLbwfDh2J8Xv5/TvEcHGaY7eLTCKcLNFBr66yrUpZNtYFURuv5v
 DNXnR/aRAiX7sdrbyVtU1E5eAm6wFwlZemF1Cias6V6sLzolmbOGrzIeLiWb8tTp1NaE
 1X5A+xc5VmXwGNz3XIFpXeV6PA3s3lUKzZAIiJpmp51HnOz1jlVZsJwft6sj4yl9pqww
 vdKJWf1Cy37GLW0vNHFJvB/YLRdwJ1Ow8kveKDso6dQLswuCnhrGDTbDh5Z4QJVVbnLF
 bdwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEieJGs1tTUQTzbzPpON/2lbq0xNQrhA8ENsYpIXifk8kQWoEBt/XWzptp4vjVzA7nu+tE1zBxnwc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxLd8+9JgZ7KJ8wCEzqBMj5uWSkpx2l3DlCwnjKLoW9OQqrcYhP
 HLcZEfgs1TjLj6DiPfIAaVFtTyDKaCw7gaqoeaS4ao8kthY6YKR7YDa1yo6GDDvsgZav8PvYsh6
 P8ZfYmwxkMEVtmrlJq2kfIFl8yWTBL1C759x4dNVSlys3iokTgbSlt/KjL7ZP/yuIGA==
X-Received: by 2002:adf:f744:0:b0:366:eade:bfbb with SMTP id
 ffacd0b85a97d-37889682e0fmr9248511f8f.46.1725972575096; 
 Tue, 10 Sep 2024 05:49:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFn1VOKKhA4WLT+ujhN0UWmvu2oY3V+R+ECDiuNE+P04fsSNUprDeK4EvgDC0oQ+l+wSJkUiA==
X-Received: by 2002:adf:f744:0:b0:366:eade:bfbb with SMTP id
 ffacd0b85a97d-37889682e0fmr9248486f8f.46.1725972574606; 
 Tue, 10 Sep 2024 05:49:34 -0700 (PDT)
Received: from fedora (g2.ign.cz. [91.219.240.8])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42caeb8afc9sm112219705e9.44.2024.09.10.05.49.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2024 05:49:34 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: pbonzini@redhat.com, seanjc@google.com, kvm@vger.kernel.org, Yan Zhao
 <yan.y.zhao@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 kraxel@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 virtualization@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/bochs: use devm_ioremap_wc() to map framebuffer
In-Reply-To: <20240909131643.28915-1-yan.y.zhao@intel.com>
References: <20240909131643.28915-1-yan.y.zhao@intel.com>
Date: Tue, 10 Sep 2024 14:49:33 +0200
Message-ID: <87a5gf4qsi.fsf@redhat.com>
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

Yan Zhao <yan.y.zhao@intel.com> writes:

> Opt for devm_ioremap_wc() over devm_ioremap() when mapping the framebuffer.
>
> Using devm_ioremap() results in the VA being mapped with PAT=UC-, which
> considerably slows down drm_fb_memcpy(). In contrast, devm_ioremap_wc()
> maps the VA with PAT set to WC, leading to better performance on platforms
> where access to UC memory is much slower than WC memory.
>
> Here's the performance data measured in a guest on the physical machine
> "Sapphire Rapids XCC".
> With host KVM honors guest PAT memory types, the effective memory type
> for this framebuffer range is
> - WC when devm_ioremap_wc() is used
> - UC- when devm_ioremap() is used.
>
> The data presented is an average from 10 execution runs.
>
> Cycles: Avg cycles of executed bochs_primary_plane_helper_atomic_update()
>         from VM boot to GDM show up
> Cnt:    Avg cnt of executed bochs_primary_plane_helper_atomic_update()
>         from VM boot to GDM show up
> T:      Avg time of each bochs_primary_plane_helper_atomic_update().
>
>  -------------------------------------------------
> |            | devm_ioremap() | devm_ioremap_wc() |
> |------------|----------------|-------------------|
> |  Cycles    |    211.545M    |   0.157M          |
> |------------|----------------|-------------------|
> |  Cnt       |     142        |   1917            |
> |------------|----------------|-------------------|
> |  T         |    0.1748s     |   0.0004s         |
>  -------------------------------------------------
>
> Note:
> Following the rebase to [3], the previously reported GDM failure on the
> VGA device [1] can no longer be reproduced, thanks to the memory management
> improvements made in [2]. Despite this, I have proceeded to submit this
> patch because of the noticeable performance improvements it provides.
>
> Reported-by: Vitaly Kuznetsov <vkuznets@redhat.com>

FWIW, this patch (alone) resolves the observed issue, thanks!

Tested-by: Vitaly Kuznetsov <vkuznets@redhat.com>

I, however, share Paolo's concern around existing VMs which KVM's change
is effectively breaking.

> Closes: https://lore.kernel.org/all/87jzfutmfc.fsf@redhat.com/#t
> Cc: Sean Christopherson <seanjc@google.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Kevin Tian <kevin.tian@intel.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
> Link: https://lore.kernel.org/all/87jzfutmfc.fsf@redhat.com/#t [1]
> Link: https://patchwork.freedesktop.org/series/138086 [2]
> Link: https://gitlab.freedesktop.org/drm/misc/kernel/-/tree/drm-misc-next [3]
> ---
> v2:
> - Rebased to the latest drm-misc-next branch. [2]
> - Updated patch log to match the base code.
>
> v1: https://lore.kernel.org/all/20240909051529.26776-1-yan.y.zhao@intel.com
> ---
>  drivers/gpu/drm/tiny/bochs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
> index 69c5f65e9853..9055b1dd66df 100644
> --- a/drivers/gpu/drm/tiny/bochs.c
> +++ b/drivers/gpu/drm/tiny/bochs.c
> @@ -268,7 +268,7 @@ static int bochs_hw_init(struct bochs_device *bochs)
>  	if (!devm_request_mem_region(&pdev->dev, addr, size, "bochs-drm"))
>  		DRM_WARN("Cannot request framebuffer, boot fb still active?\n");
>  
> -	bochs->fb_map = devm_ioremap(&pdev->dev, addr, size);
> +	bochs->fb_map = devm_ioremap_wc(&pdev->dev, addr, size);
>  	if (bochs->fb_map == NULL) {
>  		DRM_ERROR("Cannot map framebuffer\n");
>  		return -ENOMEM;

-- 
Vitaly

