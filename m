Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB0CA162DA
	for <lists+dri-devel@lfdr.de>; Sun, 19 Jan 2025 17:18:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD3A410E11B;
	Sun, 19 Jan 2025 16:18:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="byPIbbRN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18A5C10E11B
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jan 2025 16:18:21 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id
 3f1490d57ef6-e53aa843a24so6269057276.0
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jan 2025 08:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737303500; x=1737908300; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1sCj+Wpz58VXqoPHcsWC/oHPWAfJKC+x/UNR2bGR9uk=;
 b=byPIbbRND4DaJIjWHrcF+o9mre27sx1YZT3PE61ZaG5rN4DOXvOXwz4D0R1+0cIP0T
 9m7AXbf2opG57O9O4TUYhsGLRtfFNa6eWTLnRQjZuvyRtGi2goYKAECWSMjf4ExTFkI2
 vfKmGIoD8siFe2GZXtSAC9Cv2YVUSkRnN8+cD/JOUDJYEIw4+/1HSUDA9paGB7IMBxte
 C2hCLbPQVAu3Hvt0S5ZqmdEh/PkduM8mfFC3Ibv3yYmS+RJmW/dvIr2qF2HosyegCJvY
 LhXBdNYW93f0CwbMirhN9+gk9na8Gol6PJwiNBoEZ/U6G2W2iOg66OARHdaMEEZN5iMs
 acyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737303500; x=1737908300;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1sCj+Wpz58VXqoPHcsWC/oHPWAfJKC+x/UNR2bGR9uk=;
 b=uSMeE9mEckyoHUbkiNFsFSEH+9KhK0zDmbhZH16XkREl0s6nDEn9YRgdrvXZEFOPGC
 c4ymSWuKsvWtwn8erp0eBVsrX1QgmmECbiG/MJ1Ea9sq/cWSZrm2+lTxGCeaxVP9vLNU
 HqweoBULmnQekZv27o1UNNyAPQ8oKz5J6baEKeNczAZgm2uwfnLGVftEGbQlrXsyMMXJ
 jqFmZ6OlWBs+yNwpqD1NucYIb6ogVhk1py5HZ8xuSV2ylBJss+Vg9K6en6uQ3b5TfZ+1
 777CJIVVMpkahqnoV/A03gNduKNzrTSecScnfjf0amveN7kFMDlzIMVrVYGEC5SmSskJ
 vmIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjeN2Y+8S3ba08VmacvSQQ1cBBFELJa0YN+iLRrWcSOjQt54tMnOTm2Rm6hhdNVNrL0K+bCJuVkt0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxdSZsPI34SdWXGy9Q5lKDvnpBus9pv2qwYj2S/KfnYxZE/pseq
 wajp3TS6iiK5QobG/RZ1aoyuWtcL68El1orsZ/Mez410WbzALI1udSrnC1b42G+KDks6oylqUMh
 q0HctqiCe/WhY7mLMmNFqdm+Vx5k=
X-Gm-Gg: ASbGnctRFemBmBwcBsijESsl7pjex7Y0YHVsfuyOAn5b1Nq8vhlwgCm7sI2jNdDV8T+
 gAzHte3j5T+t236SNWRpmvXEPWlJC/HBKEBmm9rfBhmshqbOZjM6D
X-Google-Smtp-Source: AGHT+IE3CgHFn2hIrsTZPvTj0bIi1h7yRhFooguMB6B3KtYJttaNGjo7EYiOR9ob4BBPgMCOTedrzRZrca/qC5r4WoQ=
X-Received: by 2002:a25:a187:0:b0:e57:167f:65ee with SMTP id
 3f1490d57ef6-e57a3c20f59mr10007404276.17.1737303500121; Sun, 19 Jan 2025
 08:18:20 -0800 (PST)
MIME-Version: 1.0
References: <20250109-virtgpu-gem-partial-map-v1-1-a914b48776bd@gmail.com>
 <2f51584c-0590-432b-a4db-7a2af99cde15@collabora.com>
In-Reply-To: <2f51584c-0590-432b-a4db-7a2af99cde15@collabora.com>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Sun, 19 Jan 2025 17:18:09 +0100
X-Gm-Features: AbW1kvakcvtitImS5grWZ5T9Zu8aGtCBBjHwTPnICAN4Pw5_vi91Hx-_1Z63IHs
Message-ID: <CAMT+MTT11xg-14KrcqUTx3DxF=1NnYZAMY8RoZFoTesc0zEiVA@mail.gmail.com>
Subject: Re: [PATCH] drm/virtio: Support partial maps of GEM objects
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 virtualization@lists.linux.dev, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev
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

On Sun, 19 Jan 2025 at 12:50, Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
> >       ret = io_remap_pfn_range(vma, vma->vm_start,
> > -                              vram->vram_node.start >> PAGE_SHIFT,
> > +                              (vram->vram_node.start >> PAGE_SHIFT) + vma->vm_pgoff,
> >                                vm_size, vma->vm_page_prot);
> >       return ret;
> >  }
>
> The vma->vm_pgoff is fake in DRM, it's used for looking up DRM GEM
> object based on the vma->vm_pgoff value when mmap is invoked.

If my understanding is correct, vm_pgoff gets "unfaked" by
https://elixir.bootlin.com/linux/v6.12.6/source/drivers/gpu/drm/virtio/virtgpu_vram.c#L48

> vma->vm_pgoff should be treated as zero here. Hence we can map a part of
> GEM, but only from its start. See drm_gem_mmap().

I've had a "v0" (not on ml) of this patch that always treated vma->vm_pgoff as
zero. This broke when anything tried to mmap with a non-zero offset. Adding
vm_pgoff made it work correctly.

> Please correct vma->vm_pgoff in v2.

I need apps to be able to mmap with a non-zero offset for my usecase.
While the correct value may be something else other than what is in
the current patch, 0 is definitely incorrect for at least some workloads.
