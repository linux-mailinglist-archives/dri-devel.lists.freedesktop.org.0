Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF427ED713
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 23:19:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBCCB10E27D;
	Wed, 15 Nov 2023 22:19:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com
 [IPv6:2607:f8b0:4864:20::c2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E17C10E15E;
 Wed, 15 Nov 2023 22:19:02 +0000 (UTC)
Received: by mail-oo1-xc2b.google.com with SMTP id
 006d021491bc7-586ae6edf77so91378eaf.1; 
 Wed, 15 Nov 2023 14:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700086741; x=1700691541; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oi5d2nfQsyWJ6Cl5654DEWfBpi+oqUq6KQecwyT1JVA=;
 b=idVe3YKx6Sr5QmwOFbw1JMTl5W63+BQfrmvWV4ebJQZs1mXGdjgqtHmG6hObBQUYm3
 SYHjJV7e5d0GxCsi5RghQtO2/PFjwjZJQ88XlE3aE3JXiczapQSlVURihgHDvKZuZHtE
 g731Ykf7OI9wcjzd/9rGYWVcG6hPPlQytqz/6G9RjzUhlk4vcOQp1yyDObBgQhcHnNJA
 8WJWr9SH/EgJCIE1wnTS3x0tHhnbjPlBAQYpwFEA/IgUatsnHXOy5yNgMVGifnqz6yl8
 yAdyqQ1uh5+g/LSk2m0HTLPorKJqVo7SfC60Fs7/anYwbIzVfelnLUAGaXaPHJFOPjYb
 k0ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700086741; x=1700691541;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oi5d2nfQsyWJ6Cl5654DEWfBpi+oqUq6KQecwyT1JVA=;
 b=Fcwx7k3letGa/HCGGRq4dk+jzfalp725mc/usqK7/6BeznKtG8iy4f7BqgasXaB6rJ
 eSDskZp8kQKH8NZ1rK1GaXjYcJ16O+uKTZJrWuFpyt2AA9xCevQIZ5f4/iJvkzizrhYZ
 0gZqn2lTB9lZVOhNxVz/RgYs3QDrpdYRqXtePyiqB6hKgioUmB8iTn/CFkZovn+x/vHO
 lZktbQmAxY84+0mQl+xcT6C90SAARjLucAVv9Sn3ttAmthbFYvZYK/yyRtyO2ReZ6P50
 GmWvvojwNGJnoAlrta0S7a7/f6citlDBMNpPGFN0QBr5t+EJMUz9ixh1xv0UtzP+vFLE
 zKVA==
X-Gm-Message-State: AOJu0YzFKXilZpx8JmDxwVbqHABPxwmB+EuH6+ajhC+TamzoHnmRtJjj
 2iyBTtu3SVw8mD3Jibn43y3J9+7KQelVh7oL8YY=
X-Google-Smtp-Source: AGHT+IFDHG7TFOj1M6G82jXF7/qMb+lq03AZmJ0wqThx1Gfl8ngW6icByI+INXqHMngodqtbyZC6aBvEqmmngv08fVQ=
X-Received: by 2002:a4a:6342:0:b0:581:f6b9:30d9 with SMTP id
 r2-20020a4a6342000000b00581f6b930d9mr10690905oof.8.1700086741532; Wed, 15 Nov
 2023 14:19:01 -0800 (PST)
MIME-Version: 1.0
References: <20231115143933.261287-1-airlied@gmail.com>
In-Reply-To: <20231115143933.261287-1-airlied@gmail.com>
From: Nicolas Chauvet <kwizart@gmail.com>
Date: Wed, 15 Nov 2023 23:18:50 +0100
Message-ID: <CABr+WTmq8v1yGkrvRhxSr4XFtm+54g1E0_8X1CS+NrZF2h+yYw@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH] nouveau: don't fail driver load if no display
 hw present.
To: airlied@gmail.com
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le mer. 15 nov. 2023 =C3=A0 15:40, <airlied@gmail.com> a =C3=A9crit :
>
> From: Dave Airlie <airlied@redhat.com>
>
> If we get back ENODEV don't fail load. There are nvidia devices
> that don't have display blocks and the driver should work on those.
>
> Fixes: 15740541e8f0 ("drm/nouveau/devinit/tu102-: prepare for GSP-RM")
> Link: https://gitlab.freedesktop.org/drm/nouveau/-/issues/270
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_display.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/=
nouveau/nouveau_display.c
> index d8c92521226d9..f28f9a8574586 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_display.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_display.c
> @@ -726,6 +726,11 @@ nouveau_display_create(struct drm_device *dev)
>
>         if (nouveau_modeset !=3D 2) {
>                 ret =3D nvif_disp_ctor(&drm->client.device, "kmsDisp", 0,=
 &disp->disp);
> +               /* no display hw */
> +               if (ret =3D=3D -ENODEV) {
> +                       ret =3D 0;
> +                       goto disp_create_err;
> +               }
>
>                 if (!ret && (disp->disp.outp_mask || drm->vbios.dcb.entri=
es)) {
>                         nouveau_display_create_properties(dev);
> --
> 2.41.0

I have tested this patch on top of 6.7-rc1+ and this doesn't change
the situation on jetson-tx1 (gm20b)
Could it be that something else similar is missing on arm64 ?

Thanks
