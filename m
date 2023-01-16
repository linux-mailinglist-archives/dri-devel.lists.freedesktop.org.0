Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F1666CF07
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 19:42:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4EA710E492;
	Mon, 16 Jan 2023 18:42:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02FFC10E48E;
 Mon, 16 Jan 2023 18:42:26 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id d127so24036199oif.12;
 Mon, 16 Jan 2023 10:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4HdlXGaKgJ7j3Xx3N+QqSsZE3LQQQ06IoocMmKLVF5k=;
 b=C/Jp3Kxs7eBYGGLL7eqwB7dae9Ek8mOcqeygy78ZwBSm8qfU2gOyBwnI0JqOPpOxVq
 5Jt5bJMH6+vDNrqHTJrsqtelcsSvIDe4neE0moHgYnbH/tuZkkKA6pd0Q0Z4alSy1bmu
 rjCOY53+BJJF7liaWZSyBlU//sfjukHmR8fFlcN/BDfet/rChQv5LaxXTUJqgrO2WLTU
 rGgVdCLkYDzbq2ArrqQiQ2H/AG9ioYsMXyd48Pp/p6m1iByxrEJ27xgJfgNmQJDCARZn
 dGYy72pRcMHVWAVIIJxehUptJg2TWQ17G4w3J4yoK+zFehWSxEQSNrCwm9viIvF+9Q9t
 jHxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4HdlXGaKgJ7j3Xx3N+QqSsZE3LQQQ06IoocMmKLVF5k=;
 b=MSC7LJ8FasbN2rBOBZGUZeuOKgcKUe7H6l2PYzQ4zZPOENXvgYV2vhQEO8cNbiYPjH
 LwjcoC6Eqr8HLYYg1sok2caujYMns9Q4li3Yg8Sq3p4HHM9ae8uBoQYubKZHkkp+fLc8
 jJX5AWuzAaWi1QJSmKhcX0xivYC0X5R1CB6vgzijJfqZ7M733RcTs5D8ydJXLKke0CBT
 3UNxTiLaiQZUVVVNIaw7BK/0PPmYA6mTEmnopmm3+CvwwMf1OE4SQEz2GaGilGUSTEuV
 BIYYOHSbk1Ok7dZMf5PGoQtKdxakLU25E45WOBCHR5tfnCwKkFkfTKG6ESsOiCtRsZSG
 f4Fg==
X-Gm-Message-State: AFqh2krliKRJjeXYUJHLT25Bf+4XFhJD4j8/nw+2InehSpZU1lF31Hhd
 lOgXWdr0hD1L6ujt4BltIF8mRxsgKWI4MHK+sv2vgeMm
X-Google-Smtp-Source: AMrXdXu3arOjb6R68nisAAbP3AK9lobx1BaSsMafITAiYZi7BEUIVcf2Tr/wIcsRgvuFXf8PpjH+Q8/yp5yBXdFCa00=
X-Received: by 2002:aca:2807:0:b0:35b:f5f7:3ed0 with SMTP id
 7-20020aca2807000000b0035bf5f73ed0mr18782oix.46.1673894546170; Mon, 16 Jan
 2023 10:42:26 -0800 (PST)
MIME-Version: 1.0
References: <20230116115425.13484-1-tzimmermann@suse.de>
In-Reply-To: <20230116115425.13484-1-tzimmermann@suse.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 16 Jan 2023 13:42:15 -0500
Message-ID: <CADnq5_NvhCq0oo2hbTmeTTiusubLGc7d-6zxnw_G_bMQg587Ew@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] drm/{amdgpu, i915, nouveau,
 radeon}: Fix fbdev and vga-switcheroo
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: tvrtko.ursulin@linux.intel.com, dri-devel@lists.freedesktop.org,
 kherbst@redhat.com, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Xinhui.Pan@amd.com, jose.souza@intel.com, rodrigo.vivi@intel.com,
 alexander.deucher@amd.com, evan.quan@amd.com, christian.koenig@amd.com,
 bskeggs@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 16, 2023 at 6:54 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> (was: drm: Generic fbdev and vga-switcheroo)
>
> This patchset fixes how fbdev helpers interact with vga-switcheroo. The
> first two patches are bug fixes for the existing code. The third patch
> cleans up the drivers.
>
> Patch 1 fixes i915 to do the correct thing if the device has not been
> initialized yet. Switching to the device is only possible after the
> initialization, but switching away is always possible.
>
> Patch 2 is the original patch without the amdgpu changes. Installs
> the fbdev framebuffer in vga-switcheroo for the PCI device. Does
> nothing for drivers without vga-switcheroo.
>
> Patch 3 cleans up vga_switcheroo_process_delayed_switch() in amdgpu
> and the other related drivers (i.e., i915, nouveau and radeon). The
> call is now located at the end of drm_lastclose() and drivers do not
> need their own lastclose helpers any longer.
>
> I kept the r-bs from v1, but patch 1 is entirely new and patch 3 has
> significantly grown in size.

Series is:
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

>
> v3:
>         * include drm_fb_helper.h in radeon_drv.c
> v2:
>         * expand to patch series
>         * fix i915, nouveau and radeon
>
> Thomas Zimmermann (3):
>   drm/i915: Allow switching away via vga-switcheroo if uninitialized
>   drm/fb-helper: Set framebuffer for vga-switcheroo clients
>   drm: Call vga_switcheroo_process_delayed_switch() in drm_lastclose
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h     |  1 -
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c |  2 --
>  drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c | 13 -------------
>  drivers/gpu/drm/drm_fb_helper.c         |  8 ++++++++
>  drivers/gpu/drm/drm_file.c              |  3 +++
>  drivers/gpu/drm/i915/i915_driver.c      | 26 ++-----------------------
>  drivers/gpu/drm/i915/i915_switcheroo.c  |  6 +++++-
>  drivers/gpu/drm/nouveau/nouveau_drm.c   |  1 -
>  drivers/gpu/drm/nouveau/nouveau_vga.c   |  7 -------
>  drivers/gpu/drm/nouveau/nouveau_vga.h   |  1 -
>  drivers/gpu/drm/radeon/radeon_drv.c     |  3 ++-
>  drivers/gpu/drm/radeon/radeon_drv.h     |  1 -
>  drivers/gpu/drm/radeon/radeon_kms.c     | 18 -----------------
>  drivers/gpu/vga/vga_switcheroo.c        |  4 ++--
>  14 files changed, 22 insertions(+), 72 deletions(-)
>
>
> base-commit: 68d139b609a97a83e7c231189d4864aba4e1679b
> prerequisite-patch-id: 0aa359f6144c4015c140c8a6750be19099c676fb
> prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24
> prerequisite-patch-id: 3f204510fcbf9530d6540bd8e6128cce598988b6
> --
> 2.39.0
>
