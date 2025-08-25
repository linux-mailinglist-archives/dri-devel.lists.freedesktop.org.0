Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0F1B34A94
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 20:45:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89E1E10E27D;
	Mon, 25 Aug 2025 18:45:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JXr9lANP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A978E10E27D;
 Mon, 25 Aug 2025 18:45:40 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-afcb7acfde3so701012666b.3; 
 Mon, 25 Aug 2025 11:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756147539; x=1756752339; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Q2zMojxEaqSXvN7rZ89UIzDP+AqmDlozbvrUX8uFGJo=;
 b=JXr9lANP/YSn4UtIxbGOgZoMvIr3IXDW1TAiDo5yY9oqefaGvglCXBXTqXUIadewQm
 rEUSWkKQfGPD/QncUFBbSF07o8JFR2bJ70aBI1TAXZzYeLWK7XFG9VOWQ2ZQfoU+H6dL
 mYcmr4FDhmBFuRj/VV15PGQS9MUVLL+aWdokc4VHYj5i/k/cseF1ptjrzbaENOxjIyTV
 o2xyfQVF8cTkeKoPb00/mEBphZYi5/k+JGF5enVCbFtT2wEmtWRIqWsgpqYW1vRlx79G
 zDWMWX8ZZKktNN8LXCPbjpE+UnK807t59qiqKXwwuYFzeVgueauYZRHTqVq6pir28WCp
 XCQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756147539; x=1756752339;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Q2zMojxEaqSXvN7rZ89UIzDP+AqmDlozbvrUX8uFGJo=;
 b=ADresJ980gaRec18PT+B1gzV7thjO0GFMtyd3ZmjjNTQk0mLnmrCTTqalXmaMuEM4m
 IbyPByHUqhJZO83ELVQhkpKuUlGMoMAFShps40o/NmSNs6sEdsLIdOdnoAj47CAlz6Yv
 eWLFohMkP5D9DUIg2GHTzmwNgLuMTRdfa4ld5Q/RVXK4tsQciXt2JH4R7y7MENcOJ99u
 TgSdBhxsUX2r+1sUF4ICMFNCLDRr0lLGHrc9mD6BahnYqyJ+gFspqJOaFYjWNKqjjNPk
 qsG5EcI+DHZjEWwtuGHVzJzMLOqLOF1ozCyogJGcsGN3UKMz2T3PuWZ0RELufNWtmEex
 bYxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVp+cH0+BWBjlMyQdHjriIUBlj1HxDofz2stNBLnFhc8wSUf1YlC+5cn90/TgHFYUFIsRB1C9d6clzL8+RV8w==@lists.freedesktop.org,
 AJvYcCXJ733TJ+g9bNZTlywrg82doWBBnubpoAjOl+YUVV74JrPaUvh3qYwAxuz7fY1thG0ihQ1i61nCbqA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwnxLk4PSxb1HOfQOf3F47SHv6NrGSlhKtqhA9ZzP2So30MWMC2
 EPrgpEd9AtBd2vnf6G5evOb/B1DwYC3Hioq98cqJ2L+ONtePJ/XCeQ28UqsT8/k0+WU+RqDa8j5
 Zb+5uKt9T7lsibGNlvwtgX7IgQfsb/DM=
X-Gm-Gg: ASbGnctaNgvEW2UeJlCj/KEb08fjvlNFpxrUieAcILP0SRC+fQUn4NxddseunICyC2x
 CavzOYkJbclx0518KHXa1iQ5jdPcGzfZ9B0er2OP5LyAMtuGpu61lSSAPSB3QDRlouhpiw/5TiX
 D+k6D9KjHN9tnvpxXf9vxm2NMP3G8f5XP4tURPDWo89ztP1v8TXWpUPU1ITfcv14yp8qZeyLgBW
 fgoDx2DbHeADI862UN/xwiOb6+urIj2fSAVO3ZW
X-Google-Smtp-Source: AGHT+IHSoLDTkq5deXOI5kOXvOEJGs7/045c3SFr+zmXA7JcB8nnmgDCdO7Qbzl8FAm2rty6nUd0qaQ2gfQlRQ8Uk8I=
X-Received: by 2002:a17:907:d10:b0:af9:1be8:c2aa with SMTP id
 a640c23a62f3a-afe295e56d1mr1138094366b.45.1756147538797; Mon, 25 Aug 2025
 11:45:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250822-mtk-post-blend-color-pipeline-v1-0-a9446d4aca82@collabora.com>
 <20250822-mtk-post-blend-color-pipeline-v1-1-a9446d4aca82@collabora.com>
 <CAPj87rPAoD2D99zTdsvJ=9K8+G17mTS2jDYHMPYmXNtUyp2L_Q@mail.gmail.com>
In-Reply-To: <CAPj87rPAoD2D99zTdsvJ=9K8+G17mTS2jDYHMPYmXNtUyp2L_Q@mail.gmail.com>
From: Xaver Hugl <xaver.hugl@gmail.com>
Date: Mon, 25 Aug 2025 20:45:27 +0200
X-Gm-Features: Ac12FXwIBvZYaDx3nXuRC59YLfGWHPRaFpCScdKvQ4nArJPhSi57cSubMBYyjfo
Message-ID: <CAFZQkGwotQ6cxVCSgp-BhUi5DaZ7MyVvbnrDJW11Z7ztzqy58g@mail.gmail.com>
Subject: Re: [PATCH RFC 1/5] drm: Support post-blend color pipeline API
To: Daniel Stone <daniel@fooishbar.org>
Cc: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alex Hung <alex.hung@amd.com>, 
 wayland-devel@lists.freedesktop.org, harry.wentland@amd.com, leo.liu@amd.com, 
 ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com, 
 contact@emersion.fr, mwen@igalia.com, jadahl@redhat.com, 
 sebastian.wick@redhat.com, shashank.sharma@amd.com, agoins@nvidia.com, 
 joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org, 
 victoria@system76.com, uma.shankar@intel.com, quic_naseer@quicinc.com, 
 quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com, marcan@marcan.st, 
 Liviu.Dudau@arm.com, sashamcintosh@google.com, 
 chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com, mcanal@igalia.com, 
 kernel@collabora.com, daniels@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, Simona Vetter <simona.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
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

> > @@ -416,6 +417,24 @@ int drm_mode_object_get_properties(struct drm_mode_object *obj, bool atomic,
> >                                 continue;
> >                 }
> >
> > +               if (post_blend_color_pipeline && obj->type == DRM_MODE_OBJECT_CRTC) {
> > +                       struct drm_crtc *crtc = obj_to_crtc(obj);
> > +                       struct drm_mode_config mode_config = crtc->dev->mode_config;
> > +
> > +                       if (prop == mode_config.gamma_lut_property ||
> > +                           prop == mode_config.degamma_lut_property ||
> > +                           prop == mode_config.gamma_lut_size_property ||
> > +                           prop == mode_config.ctm_property)
> > +                               continue;
> > +               }
> > +
> > +               if (!post_blend_color_pipeline && obj->type == DRM_MODE_OBJECT_CRTC) {
> > +                       struct drm_crtc *crtc = obj_to_crtc(obj);
> > +
> > +                       if (prop == crtc->color_pipeline_property)
> > +                               continue;
> > +               }
>
> Hmmm. One issue with this is that it makes things like drm_info
> harder: if drm_info opted into the client cap, it would no longer be
> able to see any GAMMA_LUT/etc programmed by the prior userspace. So I
> think allowing at least read-only access would be reasonable here.
FWIW the cap for per-plane pipelines also hides COLOR_RANGE and
COLOR_ENCODING properties from the client.

From a compositor POV, I slightly prefer hiding the properties
entirely, but ignoring them on the compositor side when a color
pipeline is available would also be trivial.

> Having a client cap without a driver cap also puts userspace in a
> difficult position. If the driver doesn't support post-blend colorops,
> then enabling the client cap strictly removes support without a
> replacement. And without a driver cap, the client doesn't have a way
> to know which is better.
>
> Cheers,
> Daniel
