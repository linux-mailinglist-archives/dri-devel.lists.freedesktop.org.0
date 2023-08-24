Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC905786A52
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 10:42:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98C0E10E4EE;
	Thu, 24 Aug 2023 08:42:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC58110E4EE
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 08:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1692866528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YKYRtl5Yx0hEY4pWR4M/Uy6QWBRCM4DzVDpLi45xd5M=;
 b=QTuAbSaXmMUsFMQ4n2JrIqeIuhkJX1zl1Q30OFUOjzvJDMGBh0Yv6tsa5sfAZL0gzbp5yc
 UP6CGUGYIHjqr+Pw4WANPS7AIIaV0xfoprs/2PbKaOMIzRc0BHJlmbLVQjMBUqUl+SX6yT
 jvycW1UezZv4K7Vu5Pd1ey4ZksxCYOs=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-304-XbRotc_eO5GTWEhTQJqr-A-1; Thu, 24 Aug 2023 04:42:06 -0400
X-MC-Unique: XbRotc_eO5GTWEhTQJqr-A-1
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-2b9cca3c395so18862951fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 01:42:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692866525; x=1693471325;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YKYRtl5Yx0hEY4pWR4M/Uy6QWBRCM4DzVDpLi45xd5M=;
 b=AfDXoAJ2PJNAZtVw0gip/5qY0KXasljjzvbT7Emuzl2hi4j/QgyEiJj8RC+0HqkelM
 pYHT33d8Xx4GV27s5IK/PZTG8WzDy8gon4mZW5Tu4NtJB49n6fJaElEZNow1IeoRPdYG
 D3BAwbdZ9NdfBkP+10SITq5BtZFlFgAX+DBEHNRRgqM7rQIRyCpu/CPL+EXczkqPFOPB
 emKgXVnCnlSSaM4M7Gr660lVp8JjGnfpyW8jj+mtUjFfkAsR8JLYvl6spfKFf9blrBla
 VfD/Cn2ldQxyiO6te4rq+roau8Hqi/jlFRBkYiYUGYLWqVGuwq35HrDGntUuMnC+UTah
 zKGQ==
X-Gm-Message-State: AOJu0YzgqcDxsKReX5FegFcfMS4So1S/GJRtDvX6K2a3RtXiU86StP9a
 E/a4Z1ylar5wiNjJ/w636a46svClb+9gOL+8ETeK7ERdD5eYxjqhiO4fstZEHVbuBunvVPdNKnB
 xYBoFlqkj/kq9AGagSnnW98UKySmoHUHQG7fEQCYpdvRQ
X-Received: by 2002:a05:651c:1506:b0:2bb:8d47:9d95 with SMTP id
 e6-20020a05651c150600b002bb8d479d95mr12650903ljf.2.1692866525167; 
 Thu, 24 Aug 2023 01:42:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnemdgzgB9fzCa20Hz7riOR9wmLV3H2dIzPUxCYkPMXh0k1lqvvJuOT31QecoQlOKl2ZqKX8XN+RV2GKh0lM4=
X-Received: by 2002:a05:651c:1506:b0:2bb:8d47:9d95 with SMTP id
 e6-20020a05651c150600b002bb8d479d95mr12650891ljf.2.1692866525008; Thu, 24 Aug
 2023 01:42:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230824073710.2677348-1-lee@kernel.org>
 <20230824073710.2677348-6-lee@kernel.org>
In-Reply-To: <20230824073710.2677348-6-lee@kernel.org>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 24 Aug 2023 10:41:53 +0200
Message-ID: <CACO55tv6tqSH-xaM_5iyjJSsaKgeksGD8NXdU6AWi8iVhjhEEg@mail.gmail.com>
Subject: Re: [PATCH 05/20] drm/nouveau/nvkm/engine/gr/gf100: Demote kerneldoc
 abuse
To: Lee Jones <lee@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 24, 2023 at 9:37=E2=80=AFAM Lee Jones <lee@kernel.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c:1044: warning: This comme=
nt starts with '/**', but isn't a kernel-doc comment. Refer Documentation/d=
oc-guide/kernel-doc.rst
>
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> ---
>  drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c b/drivers/gpu=
/drm/nouveau/nvkm/engine/gr/gf100.c
> index 3648868bb9fc5..788b1773c46a7 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
> @@ -1040,7 +1040,7 @@ gf100_gr_zbc_init(struct gf100_gr *gr)
>         }
>  }
>
> -/**
> +/*
>   * Wait until GR goes idle. GR is considered idle if it is disabled by t=
he
>   * MC (0x200) register, or GR is not busy and a context switch is not in
>   * progress.
> --
> 2.42.0.rc1.204.g551eb34607-goog
>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

