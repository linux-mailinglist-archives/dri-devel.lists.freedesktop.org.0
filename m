Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D9DB3FD5B
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 13:08:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4043910E664;
	Tue,  2 Sep 2025 11:08:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="Jpy9ZxG/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77B4C10E661;
 Tue,  2 Sep 2025 11:08:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1756811312; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Se8ItQAN4rTFPA19Sa3Z3WgLPE47FJxmhzKn0fQ6L5arBdYhhTwkNsop4bFCLwk/2JdO1UH3l9rjCvyt2AF6kfPQskvARPG0VCp7qoCLsGLZTLk9QoGBNZWNH+au2D9wqjc7Pphplm3AP5daQTwWoFOlR+4oogQB9HItMNWQWL0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1756811312;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=fyV7NDGLYSsliT36MHgG1STZUGAA9uCiDcwTd3VYfL0=; 
 b=Nb7Vfl8nUMq/kXaxrik7YJz1o7TZ7PKBJdy1KeHowufvYVvN6qUkqlXn9AF15bkmsyFXoZI2u9/llEzXu02PLdAG+pPkwhGhScQ/hBpQdPzLjB052roELyVeuWophB0boJISauX1m2a0x3eLpeEI7vgNG32Q9BHML2XmasMZaDU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1756811312; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=fyV7NDGLYSsliT36MHgG1STZUGAA9uCiDcwTd3VYfL0=;
 b=Jpy9ZxG/hyXmIzUqijUxcGIYSwWqc/YAvJwSQiMfHqcbsvdn4n4Zsd2vKgFKdMDY
 IFV/TrXo+9rxNKyRXHsb4Z5aV9TziCpy3bZ0tnorve2jqLB/AvkGeymZhZfhwBEo/Hy
 fRfUrGL3crJQzcXuK1xWgIdMdR+5T5ZYkzZlsZfU=
Received: by mx.zohomail.com with SMTPS id 1756811310399544.1992849832612;
 Tue, 2 Sep 2025 04:08:30 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH] MAINTAINERS: Add drm-rust tree for Rust DRM drivers and
 infrastructure
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20250901202850.208116-1-dakr@kernel.org>
Date: Tue, 2 Sep 2025 08:08:15 -0300
Cc: aliceryhl@google.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 acourbot@nvidia.com, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <AD4523BA-5D13-4743-8C35-2FE72B5E834D@collabora.com>
References: <20250901202850.208116-1-dakr@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External
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



> On 1 Sep 2025, at 17:26, Danilo Krummrich <dakr@kernel.org> wrote:
> 
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
> MAINTAINERS | 11 ++++++++++-
> 1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fe168477caa4..1cd6597c7f1d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8079,7 +8079,6 @@ F: Documentation/devicetree/bindings/gpu/
> F: Documentation/gpu/
> F: drivers/gpu/drm/
> F: drivers/gpu/vga/
> -F: rust/kernel/drm/
> F: include/drm/drm
> F: include/linux/vga*
> F: include/uapi/drm/
> @@ -8096,6 +8095,16 @@ X: drivers/gpu/drm/radeon/
> X: drivers/gpu/drm/tegra/
> X: drivers/gpu/drm/xe/
> 
> +DRM DRIVERS AND COMMON INFRASTRUCTURE [RUST]
> +M: Danilo Krummrich <dakr@kernel.org>
> +M: Alice Ryhl <aliceryhl@google.com>
> +S: Supported
> +W: https://drm.pages.freedesktop.org/maintainer-tools/drm-rust.html
> +T: git https://gitlab.freedesktop.org/drm/rust/kernel.git
> +F: drivers/gpu/drm/nova/
> +F: drivers/gpu/nova-core/
> +F: rust/kernel/drm/
> +
> DRM DRIVERS FOR ALLWINNER A10
> M: Maxime Ripard <mripard@kernel.org>
> M: Chen-Yu Tsai <wens@csie.org>
> 
> base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
> -- 
> 2.51.0
> 


Acked-by: Daniel Almeida <daniel.almeida@collabora.com>
