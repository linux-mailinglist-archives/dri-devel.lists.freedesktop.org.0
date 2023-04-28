Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C186F18C6
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 15:05:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F53E10ED3B;
	Fri, 28 Apr 2023 13:05:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A347B10ED3B
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 13:05:25 +0000 (UTC)
Received: from eldfell (unknown [194.136.85.206])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested) (Authenticated sender: pq)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 3AB6F66032CC;
 Fri, 28 Apr 2023 14:05:22 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1682687122;
 bh=kpPHrHc6mugzBFrHgRxjt9vdZld2wZS4RH1/bAXvdBo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=TDxraK6xvr3virAEF3jx3hecaeHBbPIazjhwTCrolYaWU8YcmH8pA6OYSpqkv7U/l
 Nss3m66V3bgpsh/4dn9RK2h70xhTMKvHH/QvtDX75goW8Ien2fUF/zl/YRutyKp8xC
 RNd3HEMh8HzDGa1fggNWYzkcpwY8P+XipdNfOWXp9rTYca0mBHBkq1CGzYEPglYtLI
 g2vAdh9Srb+pJ2OHOjt/Ob48Kyd8FbR5X8WkF/m8mw3qWMJZbT082Haa3RooC7D7WX
 1emirvJC2+FQK0cJPH7ixrXR/O9s0V/WmyKRG99mqSe37rxGbt2ueucv7D51ulAXiP
 mMx6nXbGdJ50Q==
Date: Fri, 28 Apr 2023 16:05:18 +0300
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 1/3] drm: fix code style for embedded structs in
 hdr_metadata_infoframe
Message-ID: <20230428160518.038504d2.pekka.paalanen@collabora.com>
In-Reply-To: <20230428100115.9802-1-contact@emersion.fr>
References: <20230428100115.9802-1-contact@emersion.fr>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.24; x86_64-pc-linux-gnu)
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
Cc: Joshua Ashton <joshua@froggi.es>,
 Sebastian Wick <sebastian.wick@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 28 Apr 2023 10:01:24 +0000
Simon Ser <contact@emersion.fr> wrote:

> Only the stuff inside the brackets should be indented.
> 
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Sebastian Wick <sebastian.wick@redhat.com>
> Cc: Joshua Ashton <joshua@froggi.es>
> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> ---
>  include/uapi/drm/drm_mode.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index 46becedf5b2f..997d23fb2d68 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -878,7 +878,7 @@ struct hdr_metadata_infoframe {
>  	 */
>  	struct {
>  		__u16 x, y;
> -		} display_primaries[3];
> +	} display_primaries[3];
>  	/**
>  	 * @white_point: White Point of Colorspace Data.
>  	 * These are coded as unsigned 16-bit values in units of
> @@ -889,7 +889,7 @@ struct hdr_metadata_infoframe {
>  	 */
>  	struct {
>  		__u16 x, y;
> -		} white_point;
> +	} white_point;
>  	/**
>  	 * @max_display_mastering_luminance: Max Mastering Display Luminance.
>  	 * This value is coded as an unsigned 16-bit value in units of 1 cd/m2,

Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>


Thanks,
pq
