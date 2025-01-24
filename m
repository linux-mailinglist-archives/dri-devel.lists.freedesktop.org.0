Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 550D4A1BEBE
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 23:58:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A72F10E0C3;
	Fri, 24 Jan 2025 22:58:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TwmXLTJb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com
 [209.85.219.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A13D210E0C3
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 22:58:46 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id
 3f1490d57ef6-e53a91756e5so4769686276.1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 14:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737759525; x=1738364325; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=01g7VfIvMNEOaWq6cCJdpppjwXYnS+hFYnb/xI342vU=;
 b=TwmXLTJbWQ+2SwwWmlLAqQjxrTmc2K6Rn1FFKQ4kxO6SnllYyxkU9EKUhxeCy+azRy
 lW3cJMEEtkEVAbZwirxS2AHim8N/JIsJv4RiaYAtqpGJUdv3DOS0d0Qm4t37hba4L5fP
 Gum+gVHybF3CzZVfTvhevm2+96KSk8wMJ8i9BzhVawccUTfUf7IClXCPMnUeno4H4Thf
 D6nwRVHohGC9BaA3fWoT6AHMfHGvabI9R7UnlIRAALBfxbh9JM2Msk5YIJIX3T/ztCG9
 qxg+lGlSNZKe/2mgpflIfnRlvknZ7B3SXO7BMNF9+2ZswXX49eMmJG4lAVbR3wF6MKpz
 iI1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737759525; x=1738364325;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=01g7VfIvMNEOaWq6cCJdpppjwXYnS+hFYnb/xI342vU=;
 b=j8aLUTPkRBSw32/WMGJURlPrUd432Oa09ssanJq51hOHgaEaKdHrpRFx7uAyFYcODN
 w2n1GRoGJJbbj6zLIzMmCOuIm1CpqLyjKMn3EDvUqQA1dPhTWPVSoZQ6KWKROPRHMiF3
 U7d2twD5EhWcgKRbvAPpHtOEVa/Vj/FFcNcgXjWnilKEvkg5Yju/2kYI+Leh1rSjBOz8
 w8dZ8wgrVQk0758LVftIIiR2CD5zOK6HA9UmWblrJmMvUk971ra5xNmGyqOtt6l05yKe
 I7nyCXXwS5Xr8FvbZT1fndTIeeCE/rn3RHQb+L3DfbNnFtXPw4aUVh30vf0IHjZIY1UV
 b/1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrCxZCVI+8a6ODioTKTpfBdZ8eENOzgZa97v75OoGEpwbPtW4PTs7ychWN8jhoF4Slyij+BkBzjso=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzXebPIALDibFfdKbud9X/zf+eMaeavu6bliRohY+k1t1Y6lqGm
 L24wiz/R+Ow00x+GL/7IdeyoWHcEzQ1iI14zLkiZtB2hh1TamwffHWu2LtLgDTHSSLTn5gSqTO6
 3ieJCGlmstViND+T7z+J/LAxC9eM=
X-Gm-Gg: ASbGnctmWQq01+lgUgc3nHepMqMwVzo3CiLVstn8RB+QJUOBKKLP6Krme5dbahH+y0h
 Ggf+Wd7ayGDJW0SEtShpzAEypnnsovdKPsIkd2rdytSEMVsCrOJlLD4L0WEYzOPI=
X-Google-Smtp-Source: AGHT+IEVBcD+CmGBESa7IU5MYg0rbfDjOSFuoXmzKfBgSK9QGJJWFRFyXFg6HVZ0R9P6cura5tbEBPVueLzrh4uh67A=
X-Received: by 2002:a05:6902:709:b0:e58:33d2:6a24 with SMTP id
 3f1490d57ef6-e5833d26bebmr7334673276.21.1737759525734; Fri, 24 Jan 2025
 14:58:45 -0800 (PST)
MIME-Version: 1.0
References: <20250124-virtgpu-mixed-page-size-v1-1-480403790bac@gmail.com>
 <a55eecdc-76cc-432e-a4b3-90e8753088ac@collabora.com>
In-Reply-To: <a55eecdc-76cc-432e-a4b3-90e8753088ac@collabora.com>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Fri, 24 Jan 2025 23:58:34 +0100
X-Gm-Features: AWEUYZloMhoMIJiSQa9eMVpuRbfncotGHx1micWWVWVbtUX-Bb2DTmadzJhTzP0
Message-ID: <CAMT+MTSHi26NduO4+2hc-CPwRXQ6qJ0=DwZq=4Tt1vNd7RKyvQ@mail.gmail.com>
Subject: Re: [PATCH RESEND] drm/virtio: Align host mapping request to maximum
 platform page size
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 Sergio Lopez <slp@redhat.com>, 
 Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org, 
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

On Fri, 24 Jan 2025 at 23:52, Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
> > -     ret = drm_mm_insert_node(&vgdev->host_visible_mm, &vram->vram_node,
> > -                              bo->base.base.size);
> > +     ret = drm_mm_insert_node_generic(&vgdev->host_visible_mm, &vram->vram_node,
> > +                                      bo->base.base.size, MAX_PAGE_SIZE, 0, 0);
>
> This change only reserves extra space in the memory allocator, but
> doesn't change actual size of allocated BO. Instead, you likely need to
> replace all ALIGN(size, PAGE_SIZE) occurrences in the driver code with
> ALIGN(args->size, MAX_PAGE_SIZE)

This approach is good enough for my usecase, where the vmm can
cope with sub-page gpu allocations (by rounding up to full page),
but can't deal with non page aligned ones.
