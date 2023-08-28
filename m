Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB4B78AEBC
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 13:26:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A40C210E293;
	Mon, 28 Aug 2023 11:25:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E107710E293;
 Mon, 28 Aug 2023 11:25:56 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id D3976660719F;
 Mon, 28 Aug 2023 12:25:54 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693221955;
 bh=RPjfw9HqealX5DZpX/bM7DGUcoOG8DQm+051SCCjpKc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hR9oJhxywQSxll2yFJc+l3Uy7TNxMBW9dO4qtzD5F2nd8/tWleHj8vGo8nChRsbK4
 SSESKXTUFcINkzWlIMVCRL9U2KmTYD/AVSl3WfQB/juYYzYidM0/REKlikcHyQ+eay
 mhgKsO6z7MqV4haZaFq6Cli1z0m037LBZzShcsfhNz+pFHJv7LF33aKQ+rS8NeD4WD
 94aXhJTBncs39k9L0zqCD9JMh/3EfKxuro+KftKFg3RAKECjrBntmCtXIsDyxNbzpo
 M3cNmfq3aX8I4TQPQT0ijrGhmQK5CsilwosVFoNPg9Ae5HJuh/tzM8zn9lW0k4tVl4
 iB3citcNYF+pw==
Date: Mon, 28 Aug 2023 13:25:52 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v15 04/23] drm/gem: Add _locked postfix to functions
 that have unlocked counterpart
Message-ID: <20230828132552.793020d8@collabora.com>
In-Reply-To: <20230827175449.1766701-5-dmitry.osipenko@collabora.com>
References: <20230827175449.1766701-1-dmitry.osipenko@collabora.com>
 <20230827175449.1766701-5-dmitry.osipenko@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Mark Rutland <mark.rutland@arm.com>, Emma Anholt <emma@anholt.net>,
 Peter Zijlstra <peterz@infradead.org>, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, kernel@collabora.com,
 Will Deacon <will@kernel.org>, Steven Price <steven.price@arm.com>,
 intel-gfx@lists.freedesktop.org, Boqun Feng <boqun.feng@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Melissa Wen <mwen@igalia.com>,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 Qiang Yu <yuq825@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 27 Aug 2023 20:54:30 +0300
Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:

> Add _locked postfix to drm_gem functions that have unlocked counterpart
> functions to make GEM functions naming more consistent and intuitive in
> regards to the locking requirements.
> 
> Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/drm_gem.c | 6 +++---
>  include/drm/drm_gem.h     | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index fae5832bb0bd..8c0268944199 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -1488,10 +1488,10 @@ drm_gem_lru_scan(struct drm_gem_lru *lru,
>  EXPORT_SYMBOL(drm_gem_lru_scan);
>  
>  /**
> - * drm_gem_evict - helper to evict backing pages for a GEM object
> + * drm_gem_evict_locked - helper to evict backing pages for a GEM object
>   * @obj: obj in question
>   */
> -int drm_gem_evict(struct drm_gem_object *obj)
> +int drm_gem_evict_locked(struct drm_gem_object *obj)
>  {
>  	dma_resv_assert_held(obj->resv);
>  
> @@ -1503,4 +1503,4 @@ int drm_gem_evict(struct drm_gem_object *obj)
>  
>  	return 0;
>  }
> -EXPORT_SYMBOL(drm_gem_evict);
> +EXPORT_SYMBOL(drm_gem_evict_locked);
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index f338f8cfacf7..e78e6d817451 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -542,7 +542,7 @@ unsigned long drm_gem_lru_scan(struct drm_gem_lru *lru,
>  			       unsigned long *remaining,
>  			       bool (*shrink)(struct drm_gem_object *obj));
>  
> -int drm_gem_evict(struct drm_gem_object *obj);
> +int drm_gem_evict_locked(struct drm_gem_object *obj);
>  
>  #ifdef CONFIG_LOCKDEP
>  /**

