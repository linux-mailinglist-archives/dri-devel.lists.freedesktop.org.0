Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D79CB2AF26
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 19:18:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A967110E17A;
	Mon, 18 Aug 2025 17:18:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="aAwJkmxT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAF7C10E17A
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 17:18:25 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-32326e66dbaso3097172a91.3
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 10:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1755537505; x=1756142305;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hyJr9EYJ2Sa1z+J8ouFEJ9BjB/HNYDy3zdiSPWiqluI=;
 b=aAwJkmxTECzZFBrEvc3Xgg4b8Pa3rm4KmcKt0hwYV/1MHlNNFrj5eB2L17DENGt3fa
 4C9Lk9bYuc7I2oByPRuiZ4Uqy2gJT3AFFvZCjObILDBwabUIIFTJXHFGXA9AqGAbLSYu
 sPR4zjvvymGdY7cmscy1sGanVVqGj1QAlWPRZ9e844jfIP0xpYke90K0DzcELfNMb0Sv
 8JeJXWnvZDQbL4eRZoW6yMPFO/CiQPkOl+zPK2265oLzmXA+WLpycz04nq/1UajJ7oHB
 bsUrwnGD17SWnYOvebPX+MguFnapDLqXVD45XpvYN2qtVAraRUNuLaQPD8SyUPH+NeWt
 ZLyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755537505; x=1756142305;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hyJr9EYJ2Sa1z+J8ouFEJ9BjB/HNYDy3zdiSPWiqluI=;
 b=fDh43bjG0cQtKqN/EF56RNsis6RaH5WRt5+gt10kPJRBbimglLfnAJZ9+FB8eI7TOZ
 sOQvnKxuoarYCBuKSNTRNYzl+YKiFa9pC8VhDvSRJoR/dPecSm099vJJzelqWR22qor1
 zv0LQv/g/w+X1X6VB5281afd/qxShzgT03vvx9ema0VXdlgdqUzlXPpRDMVtRkLkdbJz
 RLrtbbcZwEwFsjqjQpzkShvT46NUR2dGpfOFpo6G2csQYh5KR+fRzwsAYsKzg+bTRz7a
 jUBfbp44MLn0KeSBitWFZUC4ipnxIP9AloK70bMgmaX8+A5nCQ/CJhnG8l1mvbtEYWun
 G9XA==
X-Gm-Message-State: AOJu0Yy0h3Gg9KR3N+RNfOUzIG1L7kG4Hfu4w4RkzfbxxzQyMygByI+T
 C9GBPZuCep6UIuiZobtPEu7bri6ljUzoFTzErGXbfQ5y63r7ve+mazzcOfb65RsQ3HTv6Kf+kxz
 jFmrH7U4xAfaHoPbMaKgF7yxCuHLZlqosS4U6h8E2BA==
X-Gm-Gg: ASbGncsRn96YGDJbV64k0WbxU58wBv8lo1gsKYTTQJ35gDlPeYAOol7R+EmlfqXLOm+
 L/iZfwfK5zXJuWZlNO7C6tv8N/mEznzIEYFcUdk2OX+B5gnepQ5Mr2NKh2cfM1AJec3wGM+tgGl
 4HU08bmYEpsWhEdGEGs90kGQttMFjkQCVP8GSBidMnrzo/DHYbqLWYbUCj00gYcpA6U+IlJDcEZ
 4+oxg==
X-Google-Smtp-Source: AGHT+IFw6tRloKxqNVvGTlmgcUV27Ip89yE4cyMzVOZ7X/Wee5R/hZPISP05cf7thO08gzUH1bvaTGatYuDbmkT2eRo=
X-Received: by 2002:a17:90b:2d85:b0:31f:ca:63cd with SMTP id
 98e67ed59e1d1-3237f510913mr125065a91.2.1755537505234; Mon, 18 Aug 2025
 10:18:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250813170542.331206-1-robert.mader@collabora.com>
 <20250813170542.331206-3-robert.mader@collabora.com>
 <CAPj87rP4_0Py3Ko1=MtwXm7o3T1Javj-h8Qv9Bov_9er3URgBg@mail.gmail.com>
 <5ef83037-ac37-4a3d-b6ef-fb26ea015290@collabora.com>
In-Reply-To: <5ef83037-ac37-4a3d-b6ef-fb26ea015290@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Mon, 18 Aug 2025 18:18:13 +0100
X-Gm-Features: Ac12FXx5VCsB8e3pwyNRHfYSTSyb2npi6Z3FHKBI1FkPp_tJxzEeHBp0XAUd_2w
Message-ID: <CAPj87rP5nfSdhDh27YhKhFffutvK3A8R9+w5mdiWiu4LWbz73w@mail.gmail.com>
Subject: Re: [PATCH v1 2/5] drm/vkms: Add RGB to YUV conversion matrices
To: Robert Mader <robert.mader@collabora.com>
Cc: dri-devel@lists.freedesktop.org, Louis Chauvet <louis.chauvet@bootlin.com>,
 Daniel Stone <daniels@collabora.com>, Melissa Wen <melissa.srw@gmail.com>, 
 Maira Canal <mairacanal@riseup.net>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rodrigo Siqueira <siqueira@igalia.com>, Simona Vetter <simona.vetter@ffwll.ch>
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

Hey there,

On Mon, 18 Aug 2025 at 16:03, Robert Mader <robert.mader@collabora.com> wrote:
> On 14.08.25 11:57, Daniel Stone wrote:
> > On Wed, 13 Aug 2025 at 18:06, Robert Mader <robert.mader@collabora.com> wrote:
> >> +       switch (format) {
> >> +       case DRM_FORMAT_YVU420:
> >> +       case DRM_FORMAT_YVU422:
> >> +       case DRM_FORMAT_YVU444:
> >> +       case DRM_FORMAT_NV21:
> >> +       case DRM_FORMAT_NV61:
> >> +       case DRM_FORMAT_NV42:
> > I wonder if this could use a drm_format_info field for chroma order,
> > instead of open-coding a list here?
>
> Generally agree, however note that this is directly copied from
> `get_conversion_matrix_to_argb_u16()`. So this is not a new pattern in
> this file - and there are several other drivers with comparable ones,
> see e.g. `has_uv_swapped()` in rockchip_drm_vop.c. So while a new field
> drm_format_info would make for a nice cleanup, I'd argue that would be
> better suited in a dedicated series.
>
> What IMO would make sense here is introduce a `has_uv_swapped()` helper,
> so we at least don't repeat ourselves. Will do that in v2 - does that
> work for you?

Yeah, that sounds good to me!

Cheers,
Daniel
