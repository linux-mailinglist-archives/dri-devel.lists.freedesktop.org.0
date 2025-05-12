Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8458AB436B
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 20:34:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FFFF10E48A;
	Mon, 12 May 2025 18:34:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="UTCp+RXB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1290010E48A;
 Mon, 12 May 2025 18:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jVzy0ZfKrbqlvuoPhzrT3nrWqzjdWG9wwcy3U555gRw=; b=UTCp+RXBOzqrW85GU1c4+eO6tv
 uQ2cjJpmU/WF6NPoNPn9qHOMbuWfGdNOWyUmqMfCpiN0YMJ8TKZX4oiU3vlbi/RLLqODbDpXtDyYC
 cGlxqaadF629/fItAllhjR4RGOZOnsCJ51a4TlMe3MPDbSO+C1Rk90Ujojuodok03n292fTmHKiUz
 AtQVbqdZapPRd8NS5DNm8sWQQjp8bz9GcITeq50CX9iX2d810CvoPKGc1KsjkojLf1+IUvCq5oZci
 JeGMd9ocFtcXxZdZ+4R1iZlpasKiKT3OT3uC2sxV7o7n/8aZkiVXrH0LMpKaUDlCTAa8eOpQjai5s
 74O99/2Q==;
Received: from [189.6.16.79] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uEXtE-007DIZ-Pe; Mon, 12 May 2025 20:34:00 +0200
Date: Mon, 12 May 2025 15:32:59 -0300
From: Melissa Wen <mwen@igalia.com>
To: Alex Hung <alex.hung@amd.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 wayland-devel@lists.freedesktop.org, harry.wentland@amd.com, leo.liu@amd.com, 
 ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com,
 contact@emersion.fr, 
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com, 
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org, 
 xaver.hugl@gmail.com, victoria@system76.com, daniel@ffwll.ch,
 uma.shankar@intel.com, 
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com, 
 marcan@marcan.st, Liviu.Dudau@arm.com, sashamcintosh@google.com, 
 chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com,
 Daniel Stone <daniels@collabora.com>
Subject: Re: [PATCH V9 22/43] drm/colorop: define a new macro
 for_each_new_colorop_in_state
Message-ID: <swezer3bl7lpxetlnjqpjrtlcobrxdqisgvsuzhdfxby3wmpzc@m42wnlgeo77f>
References: <20250430011115.223996-1-alex.hung@amd.com>
 <20250430011115.223996-23-alex.hung@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430011115.223996-23-alex.hung@amd.com>
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

On 04/29, Alex Hung wrote:
> Create a new macro for_each_new_colorop_in_state to access new
> drm_colorop_state updated from uapi.
> 
> Reviewed-by: Simon Ser <contact@emersion.fr>
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> Reviewed-by: Daniel Stone <daniels@collabora.com>
> ---
>  include/drm/drm_atomic.h | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
> index 4a30ed8ab1a8..4b3bd459a1eb 100644
> --- a/include/drm/drm_atomic.h
> +++ b/include/drm/drm_atomic.h
> @@ -1069,6 +1069,26 @@ void drm_state_dump(struct drm_device *dev, struct drm_printer *p);
>  			      (new_colorop_state) = (__state)->colorops[__i].new_state, 1))
>  
>  
> +/**
> + * for_each_new_colorop_in_state - iterate over all colorops in an atomic update
> + * @__state: &struct drm_atomic_state pointer
> + * @colorop: &struct drm_colorop iteration cursor
> + * @new_colorop_state: &struct drm_colorop_state iteration cursor for the new state
> + * @__i: int iteration cursor, for macro-internal use
> + *
> + * This iterates over all colorops in an atomic update, tracking new state. This is
> + * useful is useful in places where the state delta needs to be considered, for

nit: "is useful" duplication

> + * example in atomic check functions.
> + */
> +#define for_each_new_colorop_in_state(__state, colorop, new_colorop_state, __i) \
> +	for ((__i) = 0;							\
> +	     (__i) < (__state)->dev->mode_config.num_colorop;	\
> +	     (__i)++)							\
> +		for_each_if ((__state)->colorops[__i].ptr &&		\
> +			     ((colorop) = (__state)->colorops[__i].ptr,	\
> +			      (void)(colorop) /* Only to avoid unused-but-set-variable warning */, \
> +			      (new_colorop_state) = (__state)->colorops[__i].new_state, 1))
> +
>  /**
>   * for_each_oldnew_plane_in_state - iterate over all planes in an atomic update
>   * @__state: &struct drm_atomic_state pointer
> -- 
> 2.43.0
> 
