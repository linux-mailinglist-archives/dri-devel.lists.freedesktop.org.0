Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9BA996D90
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 16:23:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ABF110E739;
	Wed,  9 Oct 2024 14:23:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="Al9EjrM1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ADE910E739
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 14:23:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1728483827; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=e+hOwddAKFGnmPrgPo819UBTAGkFjoIdH6PZlChqEnnlcpVv45+ttrjuG7nRT5/8zW2/nnBunk2Gc0YzgAbUwGctaaAxluQbscmcHma1u+1fFgTjOG44f6ioveF4+3I9xxkNXcOwZttFPSzXZ4lE8bJ0zp67kGg1K2oxBwqc+pc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1728483827;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=oAwKnacll8ReIOKyWDAi9XHq2rNqk7T8JWcRKuNfQvU=; 
 b=VXF15Y3wjElzziUphqYzgOIgA3tkqwIkW5bEgEtrPep7F6g7I9qFfvHoBsvl/EyA35rWkmFVcGbdrMl9Uh3RPti/2RbHrOh3f7pbSjBFCbxPqkkTxbUu/5XVvL/UxKYCtVG4K+9UDy94au5R8yOg2Xgx0Y4ZVifGsEwJwwswLBQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728483827; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=oAwKnacll8ReIOKyWDAi9XHq2rNqk7T8JWcRKuNfQvU=;
 b=Al9EjrM1rr5snheTAFe57i5R/GTTQ72UuzPL0bktIAtwrKZO1mU7JyI1GnXIrMNs
 b4prssw/aTZLONgHKzqzn5Aga18u5sfc6zPD6FrbB8lN12kR7hgICs63rTWf/Sw1pb5
 5VSt0GVyBZPSHiz3qzXZ86UdS2/H7XGeoCXTEplY=
Received: by mx.zohomail.com with SMTPS id 172848382621031.86788103142669;
 Wed, 9 Oct 2024 07:23:46 -0700 (PDT)
Message-ID: <117f49cb-0dfd-4f36-8b19-3142aaf6740c@collabora.com>
Date: Wed, 9 Oct 2024 17:23:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/file: fix client_name_lock kernel-doc warning
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <20241009140300.1980746-1-jani.nikula@intel.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20241009140300.1980746-1-jani.nikula@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 10/9/24 17:03, Jani Nikula wrote:
> It's client_name_lock, not name_lock. Also unify style while at it.
> 
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/r/20241009172650.29169e6f@canb.auug.org.au
> Fixes: 56c594d8df64 ("drm: add DRM_SET_CLIENT_NAME ioctl")
> Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> Cc: Christian König <christian.koenig@amd.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  include/drm/drm_file.h | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> index d4f1c115ea0f..f0ef32e9fa5e 100644
> --- a/include/drm/drm_file.h
> +++ b/include/drm/drm_file.h
> @@ -395,7 +395,10 @@ struct drm_file {
>  	 * Userspace-provided name; useful for accounting and debugging.
>  	 */
>  	const char *client_name;
> -	/** @name_lock: Protects @client_name. */
> +
> +	/**
> +	 * @client_name_lock: Protects @client_name.
> +	 */
>  	struct mutex client_name_lock;
>  };

Thanks for the quick fix! Please apply to misc-next

Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry

