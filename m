Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE8ED033E9
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 15:12:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75D4910E1F0;
	Thu,  8 Jan 2026 14:12:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UD723IH2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78F5E10E1F0
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 14:12:37 +0000 (UTC)
Received: by mail-dl1-f52.google.com with SMTP id
 a92af1059eb24-11bba84006dso291003c88.2
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jan 2026 06:12:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767881557; x=1768486357; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gAPdOgiMKps+mzi2xMFL0dF9Mm3WPRg5zvXoMytzWsU=;
 b=UD723IH2kEyD8lKpTtxm1KNCIoIZDG4o3pywzWCxEoVaDY4oZT3s0D7B4Lw7mrlzPj
 B00WMap06o/WVGIAbkeQU6Ao0mmDJNoc50QHia8XZQRrE8F6qaCfhU2YIek54b4KUDWA
 ZHm3ZZ7oK/nLpHuew8Oz+d47JeGfjWcThp9npMVTdEnF9u/YCgEZFsO9hGC86+kk95if
 8JBGI6bKVtAF3vQHnmvsXH5NQL5hqdLWUP/3Yl2dJt6LWRT2pQVRvz60cs6IEy8m50oR
 pNCAeXXnFq2IoskiSJYxtRaVIyEd7uqUL+iQmC/TynK8L/LZkgn3vXPG7KTu/gIHL/ay
 p8Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767881557; x=1768486357;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=gAPdOgiMKps+mzi2xMFL0dF9Mm3WPRg5zvXoMytzWsU=;
 b=sdlJzseDLdh/i1ieaNxEQRw10IOil2kGRFq/8RdDCk+STq6dPQNBJc+0S3W6aNQBGL
 3GGsHNvXZUXyrWvgP5yqWUCSZoS8CLLLyCHcxpixrI6JoFYPSWkBLXa8mbZfe7n1G6fu
 pWXQVPV4KXmjAudDsLgikkLvtInfk5uaZxLTCZCUs3wj4JmW1v7vL72YkwKw6TLUTvx8
 9X9sBVSHSFomioF3uoFxE/4mI5WwPMgGjfSXzeRFEDSDUowvGOigGJ5YNZSIElk6vwmJ
 DxYmkqkb51S773prhqgPe8FDA4nFh91pOLIUUhMu8JQ7n3owcm/kb0/Y52glIHaf9gSB
 BjXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMw3J5IrAxKIv4IJ1ZOO1E6oCK9ItXpNnTAJDnbfCcPCXzn7E2q+XzcqrkKIm+F/MXWNtL0vIaCWc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxj8P8iSItDxLTZABNXw2I4MHFALx2S6TePIWyFb78OOnTsKvnX
 E9K9fCFOaBM+cRuA3oAXFT/tCHe5DkA5sW50tDMV8ZcsUBRETcr45/9ETce0o8dF7EwaNLK8rNH
 xFs5V+Qktq/WQZ2LRGqeTGIYl2DA/Zhs=
X-Gm-Gg: AY/fxX5o+7EqRCFGLwhiRWVY+Sz54Ma4t+izdHu39FOoSlykJBkeGxDsyrQ48r9k5MU
 az9/E4mpm9UCDBaZi+YKPOH5dAR65OKnlYdb/PBEwft9Dl3xnUGRP8Nvg1XqV4uebcJs7hgdLqS
 HODlR57Hjnr3flBBgKnkEydhDZ6wn2d45a3R601nze3iHjCYcgf2DzehkgXT6iDIQdsVFT/uNCe
 WPbF13AeB7VEdVKoBpkWPvFMZNfD1sohDQnpYO8mjzR3SACGui4b61WbkqOftFrb6zvgF86
X-Google-Smtp-Source: AGHT+IEYF3N5gDbUx6eM+IyHAgGyjfs6K0EGuGf+bi3hLG+958IuHrXhA/ahtFrJiVoJJjjSG48aTvCU4uLtvT881Tk=
X-Received: by 2002:a05:7022:250c:b0:11e:332:1e01 with SMTP id
 a92af1059eb24-121f8b4530emr2766105c88.3.1767881555146; Thu, 08 Jan 2026
 06:12:35 -0800 (PST)
MIME-Version: 1.0
References: <20251220184755.1803625-1-mukeshogare871@gmail.com>
 <49971777-ffd5-4a85-b08c-f0a417f26777@amd.com>
In-Reply-To: <49971777-ffd5-4a85-b08c-f0a417f26777@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 8 Jan 2026 09:12:22 -0500
X-Gm-Features: AQt7F2ro8U5wd6zXt4bKdJH8SxZ183hWHTph-m7pUgZNbtt7IMszkgr0eBbiKG0
Message-ID: <CADnq5_MB1n6eugFXEOFttk-SKuo0FSvpw2Yr1r6E+ovTheGqug@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: convert UVD v1.0 logging to drm_* helpers
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Mukesh Ogare <mukeshogare871@gmail.com>, alexander.deucher@amd.com,
 airlied@gmail.com, simona@ffwll.ch, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

Applied.  Thanks!

On Wed, Jan 7, 2026 at 7:37=E2=80=AFAM Christian K=C3=B6nig <christian.koen=
ig@amd.com> wrote:
>
> On 12/20/25 19:47, Mukesh Ogare wrote:
> > Replace legacy DRM_ERROR()/DRM_INFO() logging in the UVD v1.0 code
> > with drm_err() and drm_info() helpers that take a struct drm_device.
> >
> > Using drm_* logging provides proper device context in dmesg, which is
> > important for systems with multiple DRM devices, and aligns the radeon
> > driver with current DRM logging practices.
> >
> > No functional change intended.
> >
> > Signed-off-by: Mukesh Ogare <mukeshogare871@gmail.com>
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> >
> > diff --git a/drivers/gpu/drm/radeon/uvd_v1_0.c b/drivers/gpu/drm/radeon=
/uvd_v1_0.c
> > index 5684639d20a6..5e6607e16244 100644
> > --- a/drivers/gpu/drm/radeon/uvd_v1_0.c
> > +++ b/drivers/gpu/drm/radeon/uvd_v1_0.c
> > @@ -179,7 +179,7 @@ int uvd_v1_0_init(struct radeon_device *rdev)
> >
> >       r =3D radeon_ring_lock(rdev, ring, 10);
> >       if (r) {
> > -             DRM_ERROR("radeon: ring failed to lock UVD ring (%d).\n",=
 r);
> > +             drm_err(&rdev->ddev, "radeon: ring failed to lock UVD rin=
g (%d).\n", r);
> >               goto done;
> >       }
> >
> > @@ -232,7 +232,7 @@ int uvd_v1_0_init(struct radeon_device *rdev)
> >                       break;
> >               }
> >
> > -             DRM_INFO("UVD initialized successfully.\n");
> > +             drm_info(&rdev->ddev, "UVD initialized successfully.\n");
> >       }
> >
> >       return r;
> > @@ -338,7 +338,7 @@ int uvd_v1_0_start(struct radeon_device *rdev)
> >               if (status & 2)
> >                       break;
> >
> > -             DRM_ERROR("UVD not responding, trying to reset the VCPU!!=
!\n");
> > +             drm_err(&rdev->ddev, "UVD not responding, trying to reset=
 the VCPU!!!\n");
> >               WREG32_P(UVD_SOFT_RESET, VCPU_SOFT_RESET, ~VCPU_SOFT_RESE=
T);
> >               mdelay(10);
> >               WREG32_P(UVD_SOFT_RESET, 0, ~VCPU_SOFT_RESET);
> > @@ -347,7 +347,7 @@ int uvd_v1_0_start(struct radeon_device *rdev)
> >       }
> >
> >       if (r) {
> > -             DRM_ERROR("UVD not responding, giving up!!!\n");
> > +             drm_err(&rdev->ddev, "UVD not responding, giving up!!!\n"=
);
> >               return r;
> >       }
> >
> > @@ -427,7 +427,7 @@ int uvd_v1_0_ring_test(struct radeon_device *rdev, =
struct radeon_ring *ring)
> >       WREG32(UVD_CONTEXT_ID, 0xCAFEDEAD);
> >       r =3D radeon_ring_lock(rdev, ring, 3);
> >       if (r) {
> > -             DRM_ERROR("radeon: cp failed to lock ring %d (%d).\n",
> > +             drm_err(&rdev->ddev, "radeon: cp failed to lock ring %d (=
%d).\n",
> >                         ring->idx, r);
> >               return r;
> >       }
> > @@ -442,10 +442,10 @@ int uvd_v1_0_ring_test(struct radeon_device *rdev=
, struct radeon_ring *ring)
> >       }
> >
> >       if (i < rdev->usec_timeout) {
> > -             DRM_INFO("ring test on %d succeeded in %d usecs\n",
> > +             drm_info(&rdev->ddev, "ring test on %d succeeded in %d us=
ecs\n",
> >                        ring->idx, i);
> >       } else {
> > -             DRM_ERROR("radeon: ring %d test failed (0x%08X)\n",
> > +             drm_err(&rdev->ddev, "radeon: ring %d test failed (0x%08X=
)\n",
> >                         ring->idx, tmp);
> >               r =3D -EINVAL;
> >       }
> > @@ -507,34 +507,34 @@ int uvd_v1_0_ib_test(struct radeon_device *rdev, =
struct radeon_ring *ring)
> >       else
> >               r =3D radeon_set_uvd_clocks(rdev, 53300, 40000);
> >       if (r) {
> > -             DRM_ERROR("radeon: failed to raise UVD clocks (%d).\n", r=
);
> > +             drm_err(&rdev->ddev, "radeon: failed to raise UVD clocks =
(%d).\n", r);
> >               return r;
> >       }
> >
> >       r =3D radeon_uvd_get_create_msg(rdev, ring->idx, 1, NULL);
> >       if (r) {
> > -             DRM_ERROR("radeon: failed to get create msg (%d).\n", r);
> > +             drm_err(&rdev->ddev, "radeon: failed to get create msg (%=
d).\n", r);
> >               goto error;
> >       }
> >
> >       r =3D radeon_uvd_get_destroy_msg(rdev, ring->idx, 1, &fence);
> >       if (r) {
> > -             DRM_ERROR("radeon: failed to get destroy ib (%d).\n", r);
> > +             drm_err(&rdev->ddev, "radeon: failed to get destroy ib (%=
d).\n", r);
> >               goto error;
> >       }
> >
> >       r =3D radeon_fence_wait_timeout(fence, false, usecs_to_jiffies(
> >               RADEON_USEC_IB_TEST_TIMEOUT));
> >       if (r < 0) {
> > -             DRM_ERROR("radeon: fence wait failed (%d).\n", r);
> > +             drm_err(&rdev->ddev, "radeon: fence wait failed (%d).\n",=
 r);
> >               goto error;
> >       } else if (r =3D=3D 0) {
> > -             DRM_ERROR("radeon: fence wait timed out.\n");
> > +             drm_err(&rdev->ddev, "radeon: fence wait timed out.\n");
> >               r =3D -ETIMEDOUT;
> >               goto error;
> >       }
> >       r =3D 0;
> > -     DRM_INFO("ib test on ring %d succeeded\n",  ring->idx);
> > +     drm_info(&rdev->ddev, "ib test on ring %d succeeded\n",  ring->id=
x);
> >  error:
> >       radeon_fence_unref(&fence);
> >       radeon_set_uvd_clocks(rdev, 0, 0);
>
