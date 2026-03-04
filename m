Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aCifAp9QqGmztAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 16:32:47 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C28202C37
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 16:32:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BC5510EA44;
	Wed,  4 Mar 2026 15:32:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DgejnDls";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com
 [74.125.82.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C86910EA30
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 15:32:41 +0000 (UTC)
Received: by mail-dy1-f182.google.com with SMTP id
 5a478bee46e88-2be0f64a05bso158874eec.3
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2026 07:32:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772638360; cv=none;
 d=google.com; s=arc-20240605;
 b=IAUa/SwmS2SHC1kGeyGTvn4gZVWBs4Tqgf054LABu5LaWaHwnBfNSghzQRP4U/s4oF
 Y1YYM/u4DmOE9bmB+d76zEoiQCk6Md2Cw0fNSqJV0bmfF2PW8Sy+OxPPPP8rw6nMlIZY
 0RGk63HGNtQ9RYBeYEMR8Ylui4v4XnNK2i3xPuGswGqjwHRo5uYuzN+s0AwigD4iffnc
 Js4EzelvWkP/DCRoRPghXA3XbFMsq7I3SOsHlUALj74yK0xYt3Ou2Bc+3z1Fqm/8e2+H
 B8vSmrsl4Hlgw+VSp0c02G9iOKMPFbkzWdqJ7aUe9dSROKQk6zi4QUo2Jzr1YinWTOzU
 eqKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=KYv4PP2uEvL51Fzv0RGNmZxfT3KZdCrW4OS259XvvQI=;
 fh=sgqpdrVJs6oQXZD+4wYLbOdwNhO7CVjTbVDg1TPQYNs=;
 b=WvjVSrNKl/FGWHqfVb4CxKkeBcPvrzgotiI/jFyvp1M/rv5JZho/Uu3YKE7oWR6vmo
 YklHS8BeCf6Rn4lkyuDcH92t4o2lW1T5M5zxonNu740BitQ0gfL7y2BRLZNok5LwEhho
 fTfPEBtdY/Qa3t1wuP2jc7HWo7BZo6mGeepgKtdvZxjMqvhISwBA1Xs3a5TbqJfCcLqp
 +ZtwMFOC6Cyn3UQIlmqVUygAMJjIVMn6/EqUXw1B+cSwSCTD0jAx7F34nx9C0ZPLZIDa
 sGo4QSQQ8GgPETrxC3vO3Pv3QRlHq9nZAo61ZbLrCcRZmD9CS6G4RD3aMLDw2t93CZJ7
 5LVw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772638360; x=1773243160; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KYv4PP2uEvL51Fzv0RGNmZxfT3KZdCrW4OS259XvvQI=;
 b=DgejnDls/Y/offzyNKarHbrED2jwW2YCrpb0qVgzTP2u2I1GnTYAKQqhth7NZ2SI7u
 1dUU6Q64cFkM6m3kcGinE5B1kCVEs/nkloa+NAYHFnKSWubD6V2sMAXcXJxnAtH5hTLq
 u5Lrv739orWqX4GMy16s0qGC7TPaG55kXZzPdMASvbCmdxEqeZcZgA2qbyh63zZB7YK8
 147r00oNIbPjELZqL5eJGPx1bYOL/1o1jg24tZNti6gF8ydAqdgilBQQ6oRRBjPuVy39
 DGNRwEAggfLpcTRdHx/MGN94YhkXupI3fwC13n2H1Y5Vf5w+SVpk50lEEWEGMG3bl+8Z
 Xv+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772638360; x=1773243160;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=KYv4PP2uEvL51Fzv0RGNmZxfT3KZdCrW4OS259XvvQI=;
 b=FOOhUsdKvrsLX7/PLedRIxM8we2X0UrzIGz6qg7FUf91nOTE4EL2H50kUCfNrkLjU0
 MW7261aWhsgIMrTVLX5/M6Lk9AYR3q+eI4Gjk2vp3Pm+D6dhQO+itBpiz/J7ACwH3fW5
 8VPa6tp5I8gOWU96WHxspgTe/VTmX7HrQ5y3kSyw3ZzOQaVyDU1yLBQ5R5YVJQsizYMm
 ligpTc2HxII85HBc94W1gWvJquxbbIxYGV7MiDMGLlVx3KLMQ9rLoCenMwJ6KGtJeWcP
 bbHoPZF60yj2s+i3wITySOHZDa4InwqXg9J9RoWtwXLxFwFkvApSO95JDJeitfUG55K9
 VTBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwyq7uBdb1bJj1V5X2ezUA04L59qZwCpJLWVErlDrNtmQf+e/+E1tO9fcTOYcZey+vviozJDeM+n4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxZvDg51A9lIIYuzYPt+fKPJITax95tAxjf6Gn6/ml5MJdvRART
 iF6W87bMVdHJHpRkTsxyFEnjMujaYAlYoaBkRnOZGPcXzeMjLNS6bHQUlQ0XAcujTqIV5KXd+S4
 WOSMdCVQQ/DxWAIE4dSZgbbPLhx4GX3o=
X-Gm-Gg: ATEYQzyvabBkPYbOI8L/pHvaVOsNXoPuvRrVKDDekbggreY9mcfc0UyFXfViAlgXDIx
 2tYN0Ab4u99HeshtcS5B0iHiOHl2+Ft30wMnmtyjPHJKDl1G0UDI07KfPQnugOaXe/TqbPF+hbo
 U3oOzCpTHPzQL55kjNC8b+RaIWeflyJ92v4jGZuvGeTY0Haxf9CXcT3i170+9z4Fqwx9y7u6Ktj
 ggoujpJCtkoUNF3MDbwU5HdTQ+x7F37oMm+5tm/GAYx78uv46V5mhPyAROenAYONKRQJvhmz44k
 EzS1578r7WMHwzLcXfkxNfd87neoZRKKrYhdKicpcrMvvM1PB8qkTc8dpQITNus/K1L8lw==
X-Received: by 2002:a05:7022:44:b0:127:1186:812f with SMTP id
 a92af1059eb24-128b70d3621mr513183c88.7.1772638360316; Wed, 04 Mar 2026
 07:32:40 -0800 (PST)
MIME-Version: 1.0
References: <20260304130250.59008-1-tzimmermann@suse.de>
 <20260304130250.59008-3-tzimmermann@suse.de>
In-Reply-To: <20260304130250.59008-3-tzimmermann@suse.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 4 Mar 2026 10:32:28 -0500
X-Gm-Features: AaiRm534esRrXZBHpNNKTIK1pnZprllOmefgM8hv06GL0SY8C4uPIjHNf-makYY
Message-ID: <CADnq5_NyHuvQfggvZ2aUJ4uv_3HAwKTA5fYWxQej1=QtF7PJBQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/radeon: Test for fbdev GEM object with generic
 helper
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com, 
 simona@ffwll.ch, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-Rspamd-Queue-Id: A3C28202C37
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tzimmermann@suse.de,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:amd-gfx@lists.freedesktop.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[alexdeucher@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexdeucher@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,amd.com:email,suse.de:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Wed, Mar 4, 2026 at 8:03=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:
>
> Replace radeon's test for the fbdev GEM object with a call to the
> generic helper.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Series is:
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

Did you want me to pick these up or did you want to land them in drm-misc?

Alex

> ---
>  drivers/gpu/drm/radeon/radeon_device.c |  7 ++++---
>  drivers/gpu/drm/radeon/radeon_fbdev.c  | 17 -----------------
>  drivers/gpu/drm/radeon/radeon_mode.h   |  5 -----
>  3 files changed, 4 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_device.c b/drivers/gpu/drm/rad=
eon/radeon_device.c
> index 5d523d5dae88..705c012fcf9e 100644
> --- a/drivers/gpu/drm/radeon/radeon_device.c
> +++ b/drivers/gpu/drm/radeon/radeon_device.c
> @@ -37,6 +37,7 @@
>  #include <drm/drm_client_event.h>
>  #include <drm/drm_crtc_helper.h>
>  #include <drm/drm_device.h>
> +#include <drm/drm_fb_helper.h>
>  #include <drm/drm_file.h>
>  #include <drm/drm_framebuffer.h>
>  #include <drm/drm_probe_helper.h>
> @@ -1574,7 +1575,6 @@ int radeon_suspend_kms(struct drm_device *dev, bool=
 suspend,
>         list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
>                 struct radeon_crtc *radeon_crtc =3D to_radeon_crtc(crtc);
>                 struct drm_framebuffer *fb =3D crtc->primary->fb;
> -               struct radeon_bo *robj;
>
>                 if (radeon_crtc->cursor_bo) {
>                         struct radeon_bo *robj =3D gem_to_radeon_bo(radeo=
n_crtc->cursor_bo);
> @@ -1588,9 +1588,10 @@ int radeon_suspend_kms(struct drm_device *dev, boo=
l suspend,
>                 if (fb =3D=3D NULL || fb->obj[0] =3D=3D NULL) {
>                         continue;
>                 }
> -               robj =3D gem_to_radeon_bo(fb->obj[0]);
>                 /* don't unpin kernel fb objects */
> -               if (!radeon_fbdev_robj_is_fb(rdev, robj)) {
> +               if (!drm_fb_helper_gem_is_fb(dev->fb_helper, fb->obj[0]))=
 {
> +                       struct radeon_bo *robj =3D gem_to_radeon_bo(fb->o=
bj[0]);
> +
>                         r =3D radeon_bo_reserve(robj, false);
>                         if (r =3D=3D 0) {
>                                 radeon_bo_unpin(robj);
> diff --git a/drivers/gpu/drm/radeon/radeon_fbdev.c b/drivers/gpu/drm/rade=
on/radeon_fbdev.c
> index 18d61f3f7344..3e243f5e2f44 100644
> --- a/drivers/gpu/drm/radeon/radeon_fbdev.c
> +++ b/drivers/gpu/drm/radeon/radeon_fbdev.c
> @@ -274,20 +274,3 @@ int radeon_fbdev_driver_fbdev_probe(struct drm_fb_he=
lper *fb_helper,
>         radeon_fbdev_destroy_pinned_object(gobj);
>         return ret;
>  }
> -
> -bool radeon_fbdev_robj_is_fb(struct radeon_device *rdev, struct radeon_b=
o *robj)
> -{
> -       struct drm_fb_helper *fb_helper =3D rdev_to_drm(rdev)->fb_helper;
> -       struct drm_gem_object *gobj;
> -
> -       if (!fb_helper)
> -               return false;
> -
> -       gobj =3D drm_gem_fb_get_obj(fb_helper->fb, 0);
> -       if (!gobj)
> -               return false;
> -       if (gobj !=3D &robj->tbo.base)
> -               return false;
> -
> -       return true;
> -}
> diff --git a/drivers/gpu/drm/radeon/radeon_mode.h b/drivers/gpu/drm/radeo=
n/radeon_mode.h
> index 088af85902f7..ae1ecdc2e189 100644
> --- a/drivers/gpu/drm/radeon/radeon_mode.h
> +++ b/drivers/gpu/drm/radeon/radeon_mode.h
> @@ -936,14 +936,9 @@ int radeon_fbdev_driver_fbdev_probe(struct drm_fb_he=
lper *fb_helper,
>                                     struct drm_fb_helper_surface_size *si=
zes);
>  #define RADEON_FBDEV_DRIVER_OPS \
>         .fbdev_probe =3D radeon_fbdev_driver_fbdev_probe
> -bool radeon_fbdev_robj_is_fb(struct radeon_device *rdev, struct radeon_b=
o *robj);
>  #else
>  #define RADEON_FBDEV_DRIVER_OPS \
>         .fbdev_probe =3D NULL
> -static inline bool radeon_fbdev_robj_is_fb(struct radeon_device *rdev, s=
truct radeon_bo *robj)
> -{
> -       return false;
> -}
>  #endif
>
>  void radeon_crtc_handle_vblank(struct radeon_device *rdev, int crtc_id);
> --
> 2.53.0
>
