Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD52A991B7
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 17:34:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A56DE10E6E6;
	Wed, 23 Apr 2025 15:34:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EIGVB5dw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EF8510E215;
 Wed, 23 Apr 2025 15:34:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 09681A4BBAC;
 Wed, 23 Apr 2025 15:29:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2ED6C4CEE3;
 Wed, 23 Apr 2025 15:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745422476;
 bh=exBE5kRoxBHfsybraWEptUQZRKthYMhF21X5DHd+Qgk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EIGVB5dwShH891883K5hglERVmByjaFPOGlNwPVgISFyG6CrDZgvs9bnOzTi10utH
 Qgq+x14iXC4A9i81GODsbkrDvNdVhIyMXTp6Q3Pwm24VyHILBMt/OQZ7QrrJvq+hp1
 UCtQubl8CR+PWWvZdXHTwEVckXKSXJLFvvrTxZfSfwL8n58CeN8cTZVpIWaKsi45xy
 sK4pg5HyhKf8lMzTNOXC+uv+k81blW5tFqTzLilseyNoUjxOU1mncUeeIofAwqAcUf
 hK6jtQBZv6VTl83D/SAStD0/6k7bfwv+SsS9soUCRAgRWf5oFmHDYlcghMUT7rtnJw
 zaVE5yKhbEhlg==
Date: Wed, 23 Apr 2025 17:34:32 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, Kees Cook <kees@kernel.org>
Subject: Re: [PATCH v2][next] drm/nouveau: chan: Avoid
 -Wflex-array-member-not-at-end warnings
Message-ID: <aAkIiKbPaYEYUtv_@pollux>
References: <Z__wSgHK5_lHw8x9@kspp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z__wSgHK5_lHw8x9@kspp>
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

On Wed, Apr 16, 2025 at 12:00:42PM -0600, Gustavo A. R. Silva wrote:
> -Wflex-array-member-not-at-end was introduced in GCC-14, and we are
> getting ready to enable it, globally.
> 
> Use the `DEFINE_RAW_FLEX()` helper for a few on-stack definitions
> of a flexible structure where the size of the flexible-array member
> is known at compile-time, and refactor the rest of the code,
> accordingly.
> 
> So, with these changes, fix the following warnings:
> 
> drivers/gpu/drm/nouveau/nouveau_chan.c:274:37: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> drivers/gpu/drm/nouveau/nouveau_chan.c:371:46: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> drivers/gpu/drm/nouveau/nouveau_chan.c:524:42: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> 
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Applied to drm-misc-next, thanks!
