Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D4A73BE25
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 19:55:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E6C610E025;
	Fri, 23 Jun 2023 17:55:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAAD710E025
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 17:55:37 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-570808d8ddeso8453737b3.0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 10:55:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687542936; x=1690134936;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GFXAla+djoi2aCew92bu3sbYORcetmmfg6s1u4vqHgw=;
 b=N6AkQoG3TRWIgKvkUEYmqkNNN+ccNuYvrBJfMi2Y8QQyKmIe/Ckc2abGtUbgKpRvLh
 rIPYUcygrLulHldrX6zcLS9Mii8MlMx4B9UPE8GGhOinV74oepfBXpGscHOosRqxpCOc
 REa8Onww/3DgfdfAKRigP7+l/WJNgIDrWBszlQx76lk0aWgs6aMaqLo3mFBhfdlo0dWl
 58uaej7rWwK80MruES1OveolQhCX8Sx614Ixc/iycrrx/MWkla/janLujvW+HI0+LaX8
 sIsrxq3QfzcEsgcmp9MLJqa88tUk3F/9qIwptD5kzeNSRSTG0zwnIGfr+BQYhLS+vIWI
 G6zA==
X-Gm-Message-State: AC+VfDzMI60HFxXV9cHhmjc+xCWC9+qy6zb11SWWP9xVAcbCtXCBDFVm
 h/YznSDQr5+H2DbGemFuWoqs6TqsmG6T5A==
X-Google-Smtp-Source: ACHHUZ4Wus/6gB0jcPb+4nJCBToW0vX+1b/IbsRGqna+qi7+wBDe2v/lQCeREQrOshPKy+vLoQSsGw==
X-Received: by 2002:a81:7dd7:0:b0:56d:c97:39f4 with SMTP id
 y206-20020a817dd7000000b0056d0c9739f4mr22632427ywc.8.1687542936012; 
 Fri, 23 Jun 2023 10:55:36 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com.
 [209.85.219.172]) by smtp.gmail.com with ESMTPSA id
 w142-20020a0dd494000000b00568a207aaedsm2538949ywd.68.2023.06.23.10.55.34
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Jun 2023 10:55:34 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id
 3f1490d57ef6-bacf685150cso738921276.3
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 10:55:34 -0700 (PDT)
X-Received: by 2002:a05:6902:18b:b0:bc6:c22f:581a with SMTP id
 t11-20020a056902018b00b00bc6c22f581amr17144067ybh.38.1687542933934; Fri, 23
 Jun 2023 10:55:33 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1687423204.git.geert+renesas@glider.be>
 <95c2af42a89c65ca603126e56c0423407dfc873f.1687423204.git.geert+renesas@glider.be>
 <20230623165038.GB2112@pendragon.ideasonboard.com>
In-Reply-To: <20230623165038.GB2112@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 Jun 2023 19:55:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWsDHMn4P1g_EYKzXyisUOnhJ0Q1Nd5Wq9H_CwPvaSaWw@mail.gmail.com>
Message-ID: <CAMuHMdWsDHMn4P1g_EYKzXyisUOnhJ0Q1Nd5Wq9H_CwPvaSaWw@mail.gmail.com>
Subject: Re: [PATCH 24/39] drm: renesas: shmobile: Unify plane allocation
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Fri, Jun 23, 2023 at 6:50=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Thu, Jun 22, 2023 at 11:21:36AM +0200, Geert Uytterhoeven wrote:
> > Unify primary and overlay plane allocation:
> >   - Enhance shmob_drm_plane_create() so it can be used to create the
> >     primary plane, too,
> >   - Move overlay plane creation next to primary plane creation.
> >
> > As overlay plane index zero now means the primary plane, this requires
> > shifting all overlay plane indices by one.
>
> Do you use index zero to identify the primary plane just for
> shmob_drm_plane_create(), or somewhere else too ? If it's just to create
> the plane, you could instead pass the plane type to the function.

Index zero is just used for the creation.
I guess this sort of goes together with my question below...

> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > Perhaps it would be better to not use dynamic allocation, but store
> > "struct drm_plane primary" and "struct shmob_drm_plane planes[5]" in
> > struct drm_shmob_device instead, like is done for the crtc and encoder?

... as embedding separate primary and planes[] would also get rid of
the need to adjust the plane indices when converting from logical to physic=
al
overlay plane indices.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
