Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C3AB44F0D
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 09:19:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63AD310EB2D;
	Fri,  5 Sep 2025 07:19:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="Lg5sDZtI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com
 [209.85.128.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2CE210EB2D
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 07:19:36 +0000 (UTC)
Received: by mail-wm1-f74.google.com with SMTP id
 5b1f17b1804b1-45dd9a66cfbso2069265e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Sep 2025 00:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1757056775; x=1757661575;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=nzDQDuZjxVC6oySC+SReVx9M1aCW1txUI5kRYOyeNM8=;
 b=Lg5sDZtItKTz/09mio8+zEEoUziPmhyy7aD5OCktKYcQXDVqx7hLzSWg8PtR4hRoPn
 bOTOH3jGaBPAvmzeoOuNoYt3dg5Mfobs7cdSO2TjzB5HL6lCnoDtqDXv1OHEbTf0Oh9y
 bK2CT2hPtfxSKobqUK56yw815qj6BC3C4qrQqVappKOTLpWdal57LcOCvzGu8VHZUCiz
 C8ztFr/UigjIq26PanalLyDhp1XBiewX3YYMulsZ9gQrgLesYXAtQH5hAxbmIGz7Z0Ej
 X2q6d2WMaogvcG1EeuVoOrCDZXrkKozanYsnCJxB8bd0TvP9BGoDSVyu+Bv4UMRBYeFq
 QOZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757056775; x=1757661575;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nzDQDuZjxVC6oySC+SReVx9M1aCW1txUI5kRYOyeNM8=;
 b=WVef7vj91bHuGx8qpYGAwz7QgkIHD/HuHvuQkxit5PM8Cx2Zi9KeGidK92BcD20Tk0
 0SZpyyPl/lPSetVMLYqV7Dwp2TGChQsbvq/7796F1zlTrQqI9hQJ2ZHwBmsYxZHJup93
 ORkh33ctqheZ4O/GbYs/9yhjgqx7I5kIXs+bZ9GrV++VbwcAne55XDodeMqPIUynemmm
 IKLed2qLSCgWiPJY/0YChMYibqcNWwtRk/4UAutVytB7t/B24kVDErqYOXjokXltbRRJ
 o/GXWgELR2FxW4Mf5Kt7mxpN1FjwxsTUDxZ3hIfMMjub9CZAn+fV3DzRSw3cSfFVUoLC
 0m9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgqXfN8VjSA0UdyHRfkxLnZ30XsS6gfjo0A5DZ26SeA0bySS7DlSbq7mn5JXU8JVp/FOdzz9HFs/w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwXg48d0IQ9pTBwd8yNgnopV5Karc3nZigooeYFYDXu9Ksd4ymB
 3j8zVsruRFHzdF6aA31svbcy+xFzjPn/bb8NpDGUtChqEt/N1ui0Fr8eFr3D/K0WjgUFuG7jQz7
 lsTPfXGCh8+Emy4Koeg==
X-Google-Smtp-Source: AGHT+IHMbd1cgOBQqeIHZBAcbJF/pQ0YegzqkDP/pVp9v6OrwLpQzRk9eV1m5hUFWBGmD9QF/W3bgJQ5m0Nq3FM=
X-Received: from wmqd22.prod.google.com ([2002:a05:600c:34d6:b0:45b:4777:8063])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c4aa:b0:45b:47e1:ef69 with SMTP id
 5b1f17b1804b1-45b855beda0mr160151915e9.36.1757056775334; 
 Fri, 05 Sep 2025 00:19:35 -0700 (PDT)
Date: Fri, 5 Sep 2025 07:19:34 +0000
In-Reply-To: <20250901202850.208116-1-dakr@kernel.org>
Mime-Version: 1.0
References: <20250901202850.208116-1-dakr@kernel.org>
Message-ID: <aLqPBqXZX7lERvoU@google.com>
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

Applied to drm-rust-fixes. Thanks!

