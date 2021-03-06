Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C3832F981
	for <lists+dri-devel@lfdr.de>; Sat,  6 Mar 2021 11:57:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86F6689C29;
	Sat,  6 Mar 2021 10:57:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch
 [185.70.40.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 060368994A
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Mar 2021 10:57:09 +0000 (UTC)
Date: Sat, 06 Mar 2021 10:56:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1615028226;
 bh=32pnbQPfS2T/gUlnqiMvUc3dFkJelDxjmYoLnLrKBkY=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=GmQEpA8WTSj5SM+I4InupVP9YBdnAI2odf6AQFqq1uBRqkRreVZvQeRt6H0zcf9pM
 0MnoRBYq77dAqIOqmnJtVfDW1r4r0eciN1dr1T35E4G9oY4930ohK/6IHeGb4SO1OK
 vpQI7WyiR6/p7VQKrqXUCYHiXae2HEE9RKVy+G3UHuzcC5tzSvPaejy+rmeskYPoNN
 kv/tzF3+Qo8kW6QOT3b4LoywSWC/LFMDqMNNGUCh03VZGDGu9qPkwxJkxz6rpIODnN
 EjrD+pXrj0UWnTEu8p8AEf2tt4SijngvNWfxmigfLN2znanuVnjc6lWzDlc4x4haLb
 sn23FRW7gAK1g==
To: Pekka Paalanen <ppaalanen@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/uapi: document kernel capabilities
Message-ID: <zaAAWSkCocn-BDN-fR6Oi8EA0pCVhc3gwthb6JWi84iyYmdyCJ1sWiYgtw6POBH6TseYGQ9x-NWTPAJ-9gKfCFFWv9lyt6s0F7sRrEQW-yI=@emersion.fr>
In-Reply-To: <20210305102850.769bf34d@eldfell>
References: <20210304221057.657146-1-contact@emersion.fr>
 <20210305102850.769bf34d@eldfell>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Friday, March 5th, 2021 at 9:28 AM, Pekka Paalanen <ppaalanen@gmail.com> wrote:

> > +/**
> > + * DRM_CAP_DUMB_PREFERRED_DEPTH
> > + *
> > + * The preferred depth (in bits) for dumb buffers.
>
> this is literally depth, not bits per pixel, right?

"Depth" is pretty ambiguous [1]. Maybe we should be more explicit here and say
that it's the number of bits used to indicate the color of a single pixel? And
maybe add a note that it's different from bits per pixel?

[1]: https://en.wikipedia.org/wiki/Color_depth

> > + */
> >  #define DRM_CAP_DUMB_PREFERRED_DEPTH	0x3
> > +/**
> > + * DRM_CAP_DUMB_PREFER_SHADOW
> > + *
> > + * If set to 1, the driver prefers userspace to render to a shadow buffer
> > + * instead of directly rendering to a dumb buffer.
>
> Maybe add something like:
>
> For best speed, userspace should do streaming ordered memory copies
> into the dumb buffer and never read from it.
>
> Isn't that correct?

Good call, will add.

> > + */
> >  #define DRM_CAP_DUMB_PREFER_SHADOW	0x4
> > +/**
> > + * DRM_CAP_PRIME
> > + *
> > + * Bitfield of supported PRIME sharing capabilities. See &DRM_PRIME_CAP_IMPORT
> > + * and &DRM_PRIME_CAP_EXPORT.
> > + */
> >  #define DRM_CAP_PRIME			0x5
> > +/**
> > + * DRM_PRIME_CAP_IMPORT
> > + *
> > + * If this bit is set in &DRM_CAP_PRIME, the driver supports importing PRIME
> > + * buffers.
>
> What are PRIME buffers?

Will add something like:

    PRIME buffers are exposed as dma-buf file descriptors. See
    Documentation/gpu/drm-mm.rst, section "PRIME Buffer Sharing".

> > + */
> >  #define  DRM_PRIME_CAP_IMPORT		0x1
> > +/**
> > + * DRM_PRIME_CAP_EXPORT
> > + *
> > + * If this bit is set in &DRM_CAP_PRIME, the driver supports exporting PRIME
> > + * buffers.
>
> What's the export API? HandleToFD()?

Yes. Will add a note about it. Same for import.

> > + */
> >  #define  DRM_PRIME_CAP_EXPORT		0x2
> > +/**
> > + * DRM_CAP_TIMESTAMP_MONOTONIC
> > + *
> > + * If set to 0, the kernel will report timestamps with the realtime clock in
> > + * struct drm_event_vblank. If set to 1, the kernel will report timestamps with
> > + * the monotonic clock.
>
> I think it would be more explicit to say CLOCK_REALTIME and
> CLOCK_MONOTONIC, because there are things like CLOCK_MONOTONIC_RAW
> which is different. Mention clock_gettime()?

Ack, better be explicit here.

> > + */
> >  #define DRM_CAP_TIMESTAMP_MONOTONIC	0x6
> > +/**
> > + * DRM_CAP_ASYNC_PAGE_FLIP
> > + *
> > + * If set to 1, the driver supports &DRM_MODE_PAGE_FLIP_ASYNC.
>
> Does this apply equally to both legacy and atomic KMS API?

Yes (it's included in DRM_MODE_ATOMIC_FLAGS), but I heard that some drivers
get it wrong.

> > + */
> >  #define DRM_CAP_ASYNC_PAGE_FLIP		0x7
> > -/*
> > - * The CURSOR_WIDTH and CURSOR_HEIGHT capabilities return a valid widthxheight
> > - * combination for the hardware cursor. The intention is that a hardware
> > - * agnostic userspace can query a cursor plane size to use.
> > +/**
> > + * DRM_CAP_CURSOR_WIDTH
> > + *
> > + * The ``CURSOR_WIDTH`` and ``CURSOR_HEIGHT`` capabilities return a valid
> > + * width x height combination for the hardware cursor. The intention is that a
> > + * hardware agnostic userspace can query a cursor plane size to use.
> >   *
> >   * Note that the cross-driver contract is to merely return a valid size;
> >   * drivers are free to attach another meaning on top, eg. i915 returns the
> >   * maximum plane size.
> >   */
> >  #define DRM_CAP_CURSOR_WIDTH		0x8
> > +/**
> > + * DRM_CAP_CURSOR_HEIGHT
> > + *
> > + * See &DRM_CAP_CURSOR_WIDTH.
> > + */
> >  #define DRM_CAP_CURSOR_HEIGHT		0x9
> > +/**
> > + * DRM_CAP_ADDFB2_MODIFIERS
> > + *
> > + * If set to 1, the driver supports supplying modifiers in the
> > + * &DRM_IOCTL_MODE_ADDFB2 ioctl.
> > + */
> >  #define DRM_CAP_ADDFB2_MODIFIERS	0x10
> > +/**
> > + * DRM_CAP_PAGE_FLIP_TARGET
> > + *
> > + * If set to 1, the driver supports the &DRM_MODE_PAGE_FLIP_TARGET_ABSOLUTE and
> > + * &DRM_MODE_PAGE_FLIP_TARGET_RELATIVE flags in
> > + * &drm_mode_crtc_page_flip_target.flags for the &DRM_IOCTL_MODE_PAGE_FLIP
> > + * ioctl.
> > + */
> >  #define DRM_CAP_PAGE_FLIP_TARGET	0x11
> > +/**
> > + * DRM_CAP_CRTC_IN_VBLANK_EVENT
> > + *
> > + * If set to 1, the kernel supports reporting the CRTC ID in
> > + * &drm_event_vblank.crtc_id.
>
> Does this not apply also to the pageflip / atomic completion event?

Both DRM_EVENT_VBLANK and DRM_EVENT_FLIP_COMPLETE use the struct
drm_event_vblank, so yes. I'll mention these two events explicitly.

> > + */
> >  #define DRM_CAP_CRTC_IN_VBLANK_EVENT	0x12
> > +/**
> > + * DRM_CAP_SYNCOBJ
> > + *
> > + * If set to 1, the driver supports sync objects. See
> > + * Documentation/gpu/drm-mm.rst, section "DRM Sync Objects".
> > + */
> >  #define DRM_CAP_SYNCOBJ		0x13
> > +/**
> > + * DRM_CAP_SYNCOBJ_TIMELINE
> > + *
> > + * If set to 1, the driver supports timeline operations on sync objects. See
> > + * Documentation/gpu/drm-mm.rst, section "DRM Sync Objects".
> > + */
> >  #define DRM_CAP_SYNCOBJ_TIMELINE	0x14
> >
> >  /* DRM_IOCTL_GET_CAP ioctl argument type */
>
> I'm so happy seeing this doc appear! :-)
> Sorry for trolling you into it. ;-)

Np :)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
