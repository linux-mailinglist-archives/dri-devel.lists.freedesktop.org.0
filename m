Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1B27565AE
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 16:01:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C66310E25B;
	Mon, 17 Jul 2023 14:01:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B380810E25B
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 14:01:24 +0000 (UTC)
Received: from eldfell (unknown [194.136.85.206])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested) (Authenticated sender: pq)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id C22716606FC8;
 Mon, 17 Jul 2023 15:01:21 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1689602482;
 bh=0V9OdeoEJyck+Df3+pb1gm3FBtkfAW51RApfFZiLb2Y=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=V8vU5sw5stuApCHghYpopT0WooJBA0SpMTD/gJqui7WjGcJNBe+ISQX3qMg0VN1el
 yMv56/dGtipquISWYywEq4y/ITAhToPd9SfNnILXK/zbNAtJMnqHeLvEH0rcwelL8b
 +bM0nfvIKtpV//sdiCTpQ3ycGEfk24moYTLbE7sV0ocASijPwIFIx0D5TYqZ2+RYHX
 eOBqx8jY+DMKEtRfuNOcSqC3M4mGLK24lgPKHOoTQ39hsDi+6u6ThDrIGPWul0ecWO
 mEAjhfrhPBS4w02js+Dvyy1L+vaPVmXCjqP1IK0VVedRSlWZVw1iMPswT4XFSgLd/j
 X3L15rLrBJdyg==
Date: Mon, 17 Jul 2023 17:01:19 +0300
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/doc: add warning about connector_type_id stability
Message-ID: <20230717170119.4b04e681.pekka.paalanen@collabora.com>
In-Reply-To: <20230717131305.616855-1-contact@emersion.fr>
References: <20230717131305.616855-1-contact@emersion.fr>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 17 Jul 2023 13:13:09 +0000
Simon Ser <contact@emersion.fr> wrote:

> Mention that the connector_type_id is not stable: it depends on
> driver and device probe order.
> 
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> ---
>  include/uapi/drm/drm_mode.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index 92d96a2b6763..ea1b639bcb28 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -488,6 +488,9 @@ struct drm_mode_get_connector {
>  	 * This is not an object ID. This is a per-type connector number. Each
>  	 * (type, type_id) combination is unique across all connectors of a DRM
>  	 * device.
> +	 *
> +	 * The (type, type_id) combination is not a stable identifier: the
> +	 * type_id can change depending on the driver probe order.
>  	 */
>  	__u32 connector_type_id;
>  

Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>


Thanks,
pq
