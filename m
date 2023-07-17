Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E737560FD
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 13:00:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD91310E22E;
	Mon, 17 Jul 2023 11:00:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76D6410E230
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 10:59:58 +0000 (UTC)
Received: from eldfell (unknown [194.136.85.206])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested) (Authenticated sender: pq)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 9548D6602242;
 Mon, 17 Jul 2023 11:59:54 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1689591594;
 bh=xCPk4+iphSKONhnf5a1q6vhnBVZsFDXs+DkIF+EpjPE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WqdehERPX9HREug9moMyed9O8m1iLKmHuD5VRaOsLRfxi8zCFsF4utu8s6+hn64pE
 qKpvs+f9CXlnrjREI+cjLtKYMF/Buuhe6gRH3dOkqWBtJw7GLVC64BNooDaaiFk2c8
 FEtejXbJEdBAc8M+BueKXTvgE0pgrNeWTAGEEe/eWqshGnlbAgoRLoOFgNCtia/cJB
 2ntxJ5YWdZGb85ksRAgDEKHVycG0Z+EZJkuesryJSBNxrQb8ctv7VXa+upvw+PfpoV
 Btl/lpIlwE6J1efRzrKrh7T2Gz610oTBxltGZaJocIMI3KYIT27U143fh4dBP0YU12
 /k3gNbIpHaVrQ==
Date: Mon, 17 Jul 2023 13:59:50 +0300
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/doc: document drm_event and its types
Message-ID: <20230717135950.664e9a7a.pekka.paalanen@collabora.com>
In-Reply-To: <20230717093032.600773-1-contact@emersion.fr>
References: <20230717093032.600773-1-contact@emersion.fr>
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

On Mon, 17 Jul 2023 09:30:39 +0000
Simon Ser <contact@emersion.fr> wrote:

> Convert struct drm_event to a kernel doc comment. Link to the
> generic DRM event types. Add a basic description of each event
> type.
> 
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> ---
>  include/uapi/drm/drm.h | 45 ++++++++++++++++++++++++++++++++----------
>  1 file changed, 35 insertions(+), 10 deletions(-)
> 
> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> index a87bbbbca2d4..7cc6bf9bec43 100644
> --- a/include/uapi/drm/drm.h
> +++ b/include/uapi/drm/drm.h
> @@ -1180,25 +1180,50 @@ extern "C" {
>  #define DRM_COMMAND_BASE                0x40
>  #define DRM_COMMAND_END			0xA0
>  
> -/*
> - * Header for events written back to userspace on the drm fd.  The
> - * type defines the type of event, the length specifies the total
> - * length of the event (including the header), and user_data is
> - * typically a 64 bit value passed with the ioctl that triggered the
> - * event.  A read on the drm fd will always only return complete

The user_data doc there seems lost. It would be more at home with the
payload structs, anyway.

> - * events, that is, if for example the read buffer is 100 bytes, and
> - * there are two 64 byte events pending, only one will be returned.
> +/**
> + * struct drm_event - Header for DRM events
> + * @type: event type.
> + * @length: total number of payload bytes (including header).
>   *
> - * Event types 0 - 0x7fffffff are generic drm events, 0x80000000 and
> - * up are chipset specific.
> + * This struct is a header for events written back to user-space on the DRM FD.
> + * A read on the DRM FD will always only return complete events: e.g. if the
> + * read buffer is 100 bytes large and there are two 64 byte events pending,
> + * only one will be returned.
> + *
> + * Event types 0 - 0x7fffffff are generic DRM events, 0x80000000 and
> + * up are chipset specific. Generic DRM events include &DRM_EVENT_VBLANK,
> + * &DRM_EVENT_FLIP_COMPLETE and &DRM_EVENT_CRTC_SEQUENCE.
>   */
>  struct drm_event {
>  	__u32 type;
>  	__u32 length;
>  };
>  
> +/**
> + * DRM_EVENT_VBLANK - vertical blanking event
> + *
> + * This event is sent in response to &DRM_IOCTL_WAIT_VBLANK with the
> + * &_DRM_VBLANK_EVENT flag set.
> + *
> + * The event payload is a struct drm_event_vblank.
> + */
>  #define DRM_EVENT_VBLANK 0x01
> +/**
> + * DRM_EVENT_FLIP_COMPLETE - page-flip completion event
> + *
> + * This event is sent in response to an atomic commit or legacy page-flip with
> + * the &DRM_MODE_PAGE_FLIP_EVENT flag set.
> + *
> + * The event payload is a struct drm_event_vblank.
> + */
>  #define DRM_EVENT_FLIP_COMPLETE 0x02
> +/**
> + * DRM_EVENT_CRTC_SEQUENCE - CRTC sequence event
> + *
> + * This event is sent in response to &DRM_IOCTL_CRTC_QUEUE_SEQUENCE.
> + *
> + * The event payload is a struct drm_event_crtc_sequence.
> + */
>  #define DRM_EVENT_CRTC_SEQUENCE	0x03
>  
>  struct drm_event_vblank {

Looks good.

Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>


Thanks,
pq
