Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A62B43900
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 12:40:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5354310E9A7;
	Thu,  4 Sep 2025 10:40:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="hjGLJSjZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com
 [209.85.221.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92F3310E9DB
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 10:40:26 +0000 (UTC)
Received: by mail-wr1-f74.google.com with SMTP id
 ffacd0b85a97d-3df3e935ec8so507347f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Sep 2025 03:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1756982425; x=1757587225;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=o6y2QOBZu14x36SZiIQblNfOse9Z30SqsU6mw32en+A=;
 b=hjGLJSjZt/qdFQzKrl+iLCHnvBaLr/Ru7F+mYeajPQqOVlQx9Esp+OOeqnS5FjbWCh
 XnP6Rsni1CKvhLS9N+rKo+8f4nRo4weqzJcn+RjLaqWvCDc+h8E72tqOt7VvjbeaFNMO
 6XYeaEoD1RQFh+Xstr3jINuAvbjFtMvFRkkhzOIA04JjoEnPKgrjjaSIeSYPTkzCROfn
 awws5I9QL6Gh2i2OEZpT29NcDw6L0FK4Pj9S52A80fy2r+sL84rYQCW0qxgtTY5SoIhe
 OsKzpRw+iHQ1Kko8A7+1DRLSzxp93obkYDPgJ7WbfmsPKzJEQKRwSuXQlLOnpmRlOXqs
 kTDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756982425; x=1757587225;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=o6y2QOBZu14x36SZiIQblNfOse9Z30SqsU6mw32en+A=;
 b=tefck+QHRWwFsZSvASJ48m4X2yI2K1jA8k5jBZrffHQGRLRRqK2Z1ktrJPra3ZViX8
 RzwFEUDj0pifmM+2WtPE1eQva7qT2C4+zevPxsoleaz9bRxYa5ox/4sL7z7zGm5FyjUb
 1u9G0j4MSjF7fNsvequloXeJb/NmZjsr72U4bzien/1pDOXZ8EtqdBxjbOPrQamPyPa0
 5YLxYkA0cG4HI/AImPLzKjIwwKrekupCIRsVRHlRYtwLq8e3AkVKTKUSr7B8H/EHgdIX
 w1uBxHWeGoJhaWfLLPkJ3J9cfIQpEkb5vlh8OMfIoZufXFszYBvQFZO0bgL9X2n134EE
 14iQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWISaFQHQaw1ltLURSwnMBwW6p0o25xSp3UWMNL8vPpwkxF1rxwDSJvNr0HYFk5kkWROYm5WR2E0+0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzx67ga2VK0+dt/Of4ZsyjPKnOaRpT1N5M+Xpxlm+xGxsJP2xEV
 e7/Y3LWakagtKsTeNvKqo0mqyodJFVPf7FGSX4P2INuUy4136SBoTmgpqfikfhyKbYULoC+e30v
 clZcMTrFdw9/84jp6cg==
X-Google-Smtp-Source: AGHT+IF9yvAHvKVOXXpEFHka86WFsWc+ojWObCx+xIgC+kdLnrHsvwSPcYjH86gfddOM2J9YtQ9wDriAn1Gd+jI=
X-Received: from wrbfu17.prod.google.com
 ([2002:a05:6000:25f1:b0:3e1:aeb6:bd24])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:420c:b0:3d6:212b:9ae2 with SMTP id
 ffacd0b85a97d-3d6212b9f09mr13611267f8f.63.1756982425153; 
 Thu, 04 Sep 2025 03:40:25 -0700 (PDT)
Date: Thu, 4 Sep 2025 10:40:24 +0000
In-Reply-To: <20250901202850.208116-1-dakr@kernel.org>
Mime-Version: 1.0
References: <20250901202850.208116-1-dakr@kernel.org>
Message-ID: <aLlsmNzp_KardLUt@google.com>
Subject: Re: [PATCH] MAINTAINERS: Add drm-rust tree for Rust DRM drivers and
 infrastructure
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, acourbot@nvidia.com, 
 daniel.almeida@collabora.com, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
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

On Mon, Sep 01, 2025 at 10:26:39PM +0200, Danilo Krummrich wrote:
> Multiple DRM Rust drivers (e.g. nova-core, nova-drm, Tyr, rvkms) are in
> development, with at least Nova and (soon) Tyr already upstream. Having a
> shared tree will ease and accelerate development, since all drivers can
> consume new infrastructure in the same release cycle.
> 
> This includes infrastructure shared with other subsystem trees (e.g. Rust
> or driver-core). By consolidating in drm-rust, we avoid adding extra
> burden to drm-misc maintainers, e.g. dealing with cross-tree topic
> branches.
> 
> The drm-misc tree is not a good fit for this stage of development, since
> its documented scope is small drivers with occasional large series.
> 
> Rust drivers in development upstream, however, regularly involve large
> patch series, new infrastructure, and shared topic branches, which may
> not align well with drm-misc at this stage.
> 
> The drm-rust tree may not be a permanent solution. Once the core Rust,
> DRM, and KMS infrastructure have stabilized, drivers and infrastructure
> changes are expected to transition into drm-misc or standalone driver
> trees respectively. Until then, drm-rust provides a dedicated place to
> coordinate development without disrupting existing workflows too much.
> 
> Cc: Alice Ryhl <aliceryhl@google.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Alexandre Courbot <acourbot@nvidia.com>
> Cc: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  MAINTAINERS | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fe168477caa4..1cd6597c7f1d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8079,7 +8079,6 @@ F:	Documentation/devicetree/bindings/gpu/
>  F:	Documentation/gpu/
>  F:	drivers/gpu/drm/
>  F:	drivers/gpu/vga/
> -F:	rust/kernel/drm/
>  F:	include/drm/drm
>  F:	include/linux/vga*
>  F:	include/uapi/drm/
> @@ -8096,6 +8095,16 @@ X:	drivers/gpu/drm/radeon/
>  X:	drivers/gpu/drm/tegra/
>  X:	drivers/gpu/drm/xe/
>  
> +DRM DRIVERS AND COMMON INFRASTRUCTURE [RUST]
> +M:	Danilo Krummrich <dakr@kernel.org>
> +M:	Alice Ryhl <aliceryhl@google.com>
> +S:	Supported
> +W:	https://drm.pages.freedesktop.org/maintainer-tools/drm-rust.html

It looks like the right path is:
https://drm.pages.freedesktop.org/maintainer-tools/repositories/drm-rust.html

Alice
