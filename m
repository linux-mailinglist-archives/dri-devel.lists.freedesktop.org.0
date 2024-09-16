Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B3997A895
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2024 23:09:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CECA410E03B;
	Mon, 16 Sep 2024 21:09:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FK5sE+r2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A861F10E03B
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2024 21:09:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id BEC8CA43245;
 Mon, 16 Sep 2024 21:09:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8201C4CEC4;
 Mon, 16 Sep 2024 21:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726520986;
 bh=xLpYm/Rb1xCBeSImFbP0p3JrCkPA0Jclh/I1JB/dxSU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FK5sE+r2gySnnrXf/sfxIG7dM7wtHRpf3BxaoO6TzH9dLsdQS22yTy2b4bUTVjtLm
 5OZ1Aq6hvEuSLvrSW7wAA814u3+f0j0C5Tbu12N467kK1NRiZVx+P7L8muKZ/DEtbG
 OQ0guaEoX/Uk9hkQEqPH/cBsYVZXjY2Oy64oEtUU/g2a1rwCynranEXyonPwLeFMIG
 /q8l6HGmgHh8EB99NXeLzrWUB9UzKVDJUtuKxVXt15yxZla8lHtq1GIEF8lLUvuDJS
 I4leuN5wOCkttpKzODVh6HJvUsMJFvUd5JRbBr0p3DeBfMgKzZblZ+dcJikq41s3RS
 N5sPeK6ZO5qIg==
Date: Mon, 16 Sep 2024 23:09:41 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Philipp Stanner <pstanner@redhat.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Luben Tuikov <ltuikov89@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: Re: [PATCH] MAINTAINERS: drm/sched: Add new maintainers
Message-ID: <ZuielQSr-1zI-GhD@pollux>
References: <20240916185159.35727-3-pstanner@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240916185159.35727-3-pstanner@redhat.com>
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

On Mon, Sep 16, 2024 at 08:52:00PM +0200, Philipp Stanner wrote:
> DRM's GPU scheduler is arguably in need of more intensive maintenance.
> Danilo and Philipp volunteer to help with the maintainership.
> 
> Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Luben Tuikov <ltuikov89@gmail.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Acked-by: Danilo Krummrich <dakr@kernel.org>

> 
> ---
>  MAINTAINERS | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 10430778c998..fc2d8bf3ee74 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7710,6 +7710,8 @@ F:	drivers/gpu/drm/xlnx/
>  DRM GPU SCHEDULER
>  M:	Luben Tuikov <ltuikov89@gmail.com>
>  M:	Matthew Brost <matthew.brost@intel.com>
> +M:	Danilo Krummrich <dakr@kernel.org>
> +M:	Philipp Stanner <pstanner@redhat.com>
>  L:	dri-devel@lists.freedesktop.org
>  S:	Maintained
>  T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
> -- 
> 2.46.0
> 
