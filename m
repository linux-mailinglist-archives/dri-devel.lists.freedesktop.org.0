Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F79257A76C
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jul 2022 21:50:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EF1211344B;
	Tue, 19 Jul 2022 19:50:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2301113063;
 Tue, 19 Jul 2022 19:50:47 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id os14so29230558ejb.4;
 Tue, 19 Jul 2022 12:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=MP2mNoHV5UbwTy8FhxrYTOnqC74G4vp1u8y7Ih8i6Gk=;
 b=HXOii4OqRMngJ85erwxpuDjSbMYDxJE4qXyd0P9MRABSLjttvKm45KAun5SY4VCsS9
 K6C42blnp93B2q6MMIefScXhep5eIC8mYUjr74y6OqyIbz9jpyrahwzV9pQKGpDl5ZXI
 LF21HIlI+tl05fwyzoavG+zd5I4vZCiVi97GTM/8zqbX8PVtQN9o21tshr4q1XUk0itr
 AI1Fn7jaeYQTngHANbBxE+ByFuVmTXgKT25Me4aYipyD0AeDcr5yo2p5V0qcCcMWtsxw
 jUeGzE9acPC8dcwn5DxwBBIj+DcFc6jt0uW4FOqbflK/luDSDKdNf80NOlIn3vCEla7C
 ADbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MP2mNoHV5UbwTy8FhxrYTOnqC74G4vp1u8y7Ih8i6Gk=;
 b=WjxlqSFPBfVG5PNVKYOxkjWLTa8dQZ3R3TlMai+cipxuly9Q9hqunlTFowi0Sa/aP3
 u8X4McGxd6TZEvGlmULIo86qSj87JbGi9w5YdyaIz6EGOBXDQKeobLs40gk86eGb4EHz
 t0uui5OLk9h7m2xqCgvliQFugnENyU6pVyqQDEpXACVGZXoX2QFBKhXznBXvQwHqd292
 /yVWOKHugEw+L2uktUvlBwUcp8trjh/r+V4nm1RpNS2apaldG89XMqxOXjkZoy2Xt2w5
 JUoJuriCZMCVDvZIOGbR0UbD44ALB4PxPHtVC3r2su1U6aFmj8eNTBKODUJsCQvwgQcQ
 wouw==
X-Gm-Message-State: AJIora+hOfYvPzRIuBDO8P5lpV95hs2lV8e2cOe3tvrSQjoFlL3qneav
 f4jW7W4XQY6n4HakT8A4EvByQyTDW6MredfP9Y5U+U4d
X-Google-Smtp-Source: AGRyM1u6s0KwsJBJwcN1pS55Zw9h79wwsGyapUUrqQkHflO0aWasIqdqMC6rDczKC50rhDnaYsEeROk2BJOIpddn6Oc=
X-Received: by 2002:a17:907:1623:b0:72b:64e3:878a with SMTP id
 hb35-20020a170907162300b0072b64e3878amr33075752ejc.185.1658260246316; Tue, 19
 Jul 2022 12:50:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220716035732.30449-1-wangborong@cdjrlc.com>
 <ada7fc21-17e3-d3e0-5316-55ee6669ccd3@amd.com>
In-Reply-To: <ada7fc21-17e3-d3e0-5316-55ee6669ccd3@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 19 Jul 2022 15:50:34 -0400
Message-ID: <CADnq5_PtDTX0WBxW9e4SbzLnm15XTsir++26tp0YLnknAdNdYg@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: Fix comment typo
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: amd-gfx@lists.freedesktop.org, airlied@linux.ie, Xinhui.Pan@amd.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jason Wang <wangborong@cdjrlc.com>, alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Tue, Jul 19, 2022 at 8:33 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 16.07.22 um 05:57 schrieb Jason Wang:
> > The double `have' is duplicated in line 696, remove one.
> >
> > Signed-off-by: Jason Wang <wangborong@cdjrlc.com>
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> > ---
> >   drivers/gpu/drm/radeon/radeon_gem.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/rade=
on/radeon_gem.c
> > index 84843b3b3aef..261fcbae88d7 100644
> > --- a/drivers/gpu/drm/radeon/radeon_gem.c
> > +++ b/drivers/gpu/drm/radeon/radeon_gem.c
> > @@ -693,7 +693,7 @@ int radeon_gem_va_ioctl(struct drm_device *dev, voi=
d *data,
> >       }
> >
> >       /* !! DONT REMOVE !!
> > -      * We don't support vm_id yet, to be sure we don't have have brok=
en
> > +      * We don't support vm_id yet, to be sure we don't have broken
> >        * userspace, reject anyone trying to use non 0 value thus moving
> >        * forward we can use those fields without breaking existant user=
space
> >        */
>
