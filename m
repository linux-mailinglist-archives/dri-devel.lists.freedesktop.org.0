Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACAE661F436
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 14:23:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC98710E30D;
	Mon,  7 Nov 2022 13:22:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A474D10E30D
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 13:22:56 +0000 (UTC)
Received: from maud (unknown [184.175.40.153])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: alyssa)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id D5DA7660283A;
 Mon,  7 Nov 2022 13:22:53 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1667827375;
 bh=ZnFOZyXL8uJEDuix8RxOgFRb6se3qayxtK1aRcf42S8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QboKrarDISQxl9/snAAVdfm/ScDLKgrDQlRmxy10aNYWW+ElLweUCVKFFQc8UY+ki
 6r4GEgBYcaGiPYH3dn1GNnEMwuXG5RktG5Qyde+oRm315jvdEcqTe2h6agyfGzlV3x
 F6LRU8Ou+9cwQcPHUvbqanNWVD+QVvK/SAXe2iMXkrwQjLu7syKzOgWsln/L2Q/vpO
 JP7KeGA/TzD5dradJexgYYAuAEE8QbKAYtgruhrf7E8hsMynqo93TCBMylj7skKlQ5
 Ea2fPwpfaU1pMtnyJaa4FNul71WfPbf4wXxgjZPg0DnZ9KL8zp+yjRNshzWCSwPGj4
 9AYyAoM0ma8Jg==
Date: Mon, 7 Nov 2022 08:22:48 -0500
From: Alyssa Rosenzweig <alyssa@collabora.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH] drm/panfrost: Remove type name from internal struct again
Message-ID: <Y2kGqIAE7WPYUTKx@maud>
References: <20221103114036.1581854-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221103114036.1581854-1-steven.price@arm.com>
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
Cc: dri-devel@lists.freedesktop.org,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Alyssa Rosenzweig <alyssa@collabora.com>

On Thu, Nov 03, 2022 at 11:40:36AM +0000, Steven Price wrote:
> Commit 72655fb942c1 ("drm/panfrost: replace endian-specific types with
> native ones") accidentally reverted part of the parent commit
> 7228d9d79248 ("drm/panfrost: Remove type name from internal structs")
> leading to the situation that the Panfrost UAPI header still doesn't
> compile correctly in C++.
> 
> Revert the accidental revert and pass me a brown paper bag.
> 
> Reported-by: Alyssa Rosenzweig <alyssa@collabora.com>
> Fixes: 72655fb942c1 ("drm/panfrost: replace endian-specific types with native ones")
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
>  include/uapi/drm/panfrost_drm.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/uapi/drm/panfrost_drm.h b/include/uapi/drm/panfrost_drm.h
> index 6f93c915cc88..9f231d40a146 100644
> --- a/include/uapi/drm/panfrost_drm.h
> +++ b/include/uapi/drm/panfrost_drm.h
> @@ -254,7 +254,7 @@ struct panfrost_dump_object_header {
>  			__u64 nbos;
>  		} reghdr;
>  
> -		struct pan_bomap_hdr {
> +		struct {
>  			__u32 valid;
>  			__u64 iova;
>  			__u32 data[2];
> -- 
> 2.34.1
> 
