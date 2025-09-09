Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9B7B4A1D3
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 08:13:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DA7D10E61A;
	Tue,  9 Sep 2025 06:13:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ffwc3j5V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com
 [209.85.160.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BF5810E61A
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 06:13:33 +0000 (UTC)
Received: by mail-oa1-f49.google.com with SMTP id
 586e51a60fabf-30cceb749d7so2393023fac.2
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 23:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757398412; x=1758003212; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DXrI7PvCxHkgf8fm11dhQ1A5D6jcjkNuuD5QqQGHEhU=;
 b=ffwc3j5V/sdZACA4dhr6i8V7/tGECqa1nhH+0IB8FSP4/b0MF34+iNPw/Y2L3uVHDH
 hR+geRS47QJEBOMfVWDd+KpuEIhVQO+yjHJmnPIBnti4eTYNFr7Jfn7BAKqscBKD7fl8
 aG8Y01HGnVo9wMseDxtx2nJ3yVST8szHslADaz7HXgYxHdWdw/nqQEdf7sr+dd2C0fvQ
 6AYE4whvB2ow73R/slUwAMQ9KRz8r5FcFB0Rqp+ttpifd0Ia7u4R5169hxQSganrirc0
 Bgot8AqDGAUBEPZv8zhi03o6ST/bwuqaLXvE1Klp4q+p6A5Iv+uj9ryZFXoFBIpYKj2Q
 VxhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757398412; x=1758003212;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DXrI7PvCxHkgf8fm11dhQ1A5D6jcjkNuuD5QqQGHEhU=;
 b=oqsTQGxpji/24p3f7WD/CcycR1E74TSCGOvAicBj85H1GLIA2iVrn6uEj0YpYYKaFa
 zcLJv23A8zxsFBg+OppvbzTMa10YvDR5FIiZH+iRhqYCjzgxZ5rnBNiEX7JBnMNsUWoD
 9aLVAddoWrn1nX2BD2SZvdRp8T9Xh9XJo/fNtrFWtcqqXmlT7e6dGkzojylDOonOLrwF
 rxZURMUIjgFwOib6ZTsWfyEVa1bDKP6d/8J+nTl0CJoVl/4ep3hrWwD/ZR8+uSk8w8Eu
 ql52N+qlmBO021ZZ9R2ogpODCEcFwwfEcz3up8WOiw8BiJncIyr5tAnGlFlWyFCDhHGs
 ajvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXerRXAYIVBbNnXQYiXaMQHDrh9kUBsD4pr3JeRbmCUk5ZVCnTC9NjMvEpdbNr6qRp3h2/yWL2Yg1w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyte9Scxph09BvOZeWvRPxqEq5RZcAgHVeZkcPSMH9ytyvDUrBd
 WB6uMrn94qqRdLTuO1QWya1rIYJNMwfUC1Jz0m2JV5eeYxmKwSNpt4m/EDNlDME0Z//Pic0j0Lv
 ZAZJ829Z8CNSffErFsTLAR78hTF1BINQ=
X-Gm-Gg: ASbGncvBFm6sXZv2/Hx+oqVrtpT5KAqLwz6U2e8Fg20lAGOYXqND0oi6Fr3IJPsPAbG
 IXGaiT3L9hYlLVzyqmcboRXMelV1ZypFNTIF9HZF1JmpMSnugYRKwicPBePUU8tLrl5Aj7h/Fzw
 XCwa10x7OWch9UyiBDmkjd6boPkprCV4iqsSd3EbO9Ne6k2I/PRU8kHUGvt564Ywcca4yb04T1a
 Up6EmXYY++KURxC
X-Google-Smtp-Source: AGHT+IHLoM0ZHzdeZ9/+Lrh3NPZ3lfnlNkLLjJ0yH2NqVB0tjM1FQ/XmAZgCJy8lsmtymkBrDxmM9HYw8grb//kBLF8=
X-Received: by 2002:a05:6870:972c:b0:315:9da9:ec7e with SMTP id
 586e51a60fabf-32264e29024mr3609942fac.42.1757398412369; Mon, 08 Sep 2025
 23:13:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250904121157.395128-1-tzimmermann@suse.de>
In-Reply-To: <20250904121157.395128-1-tzimmermann@suse.de>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Tue, 9 Sep 2025 08:13:20 +0200
X-Gm-Features: Ac12FXxrz5x_tlRFxgiMqLgS4y-_CqU9mqrpv-ViyEO7Y3yY-DKQnRFpo9QVQoc
Message-ID: <CAMeQTsZKfvpjTb9TyYomU2ySe_h5c35NCNDOoVfyvHq6Kp_ASQ@mail.gmail.com>
Subject: Re: [PATCH] drm/gma500: Do not clear framebuffer GEM objects during
 cleanup
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com, 
 simona@ffwll.ch, dri-devel@lists.freedesktop.org
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

On Thu, Sep 4, 2025 at 2:14=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:
>
> Gma500 unnecessarily clears the framebuffer's GEM-object pointer
> before calling drm_framebuffer_cleanup(). Remove this code to make
> gma500 consistent with the rest of the drivers.
>
> The change is cosmetic, as drm_framebuffer_cleanup() does not
> touch the object pointer on gma500.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Hi Thomas, looks good.
Acked-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>


> ---
> This change was first tested and submitted as part of the patch at
> https://lore.kernel.org/dri-devel/20250704085541.28165-1-tzimmermann@suse=
.de/ .
> It didn't get merged because it wasn't strictly required for that fix.
> ---
>  drivers/gpu/drm/gma500/fbdev.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/gma500/fbdev.c b/drivers/gpu/drm/gma500/fbde=
v.c
> index 4a37136f90f4..32d31e5f5f1a 100644
> --- a/drivers/gpu/drm/gma500/fbdev.c
> +++ b/drivers/gpu/drm/gma500/fbdev.c
> @@ -120,7 +120,6 @@ static void psb_fbdev_fb_destroy(struct fb_info *info=
)
>         drm_fb_helper_fini(fb_helper);
>
>         drm_framebuffer_unregister_private(fb);
> -       fb->obj[0] =3D NULL;
>         drm_framebuffer_cleanup(fb);
>         kfree(fb);
>
> @@ -245,7 +244,6 @@ int psb_fbdev_driver_fbdev_probe(struct drm_fb_helper=
 *fb_helper,
>
>  err_drm_framebuffer_unregister_private:
>         drm_framebuffer_unregister_private(fb);
> -       fb->obj[0] =3D NULL;
>         drm_framebuffer_cleanup(fb);
>         kfree(fb);
>  err_drm_gem_object_put:
> --
> 2.50.1
>
