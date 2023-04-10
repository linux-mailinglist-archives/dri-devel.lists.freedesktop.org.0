Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 472F26DC550
	for <lists+dri-devel@lfdr.de>; Mon, 10 Apr 2023 11:46:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B0C110E2C2;
	Mon, 10 Apr 2023 09:46:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39FF310E2C2
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Apr 2023 09:46:01 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-54ef6ca60ceso77621687b3.3
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Apr 2023 02:46:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681119959;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aW3geLGISJ5Wl59n77OgvFtQOg4LkNPXguyTMjOYNek=;
 b=fMqQNQ1Sbfs9I5tKhVOQk3Qh+grA2PHWQ+amKvFLx7PIuy24krmkxPzeWgtJzFVP/M
 DXEPDhIW5Kgx4MiBzfDMlgfyJFvxdaH+hLjj5RbEpOTbqawZ8PMLbnoj87t4eEonfubq
 4sYK23trkBSmjnIppDlSmTQnNZewiH9UsfhdkNxUwkgXYVMvLRcaohkDqQmEuhZJX58j
 QFp8HNrjGVHLGtT0hfmfcwERJC1bT3YHFKF/OQ6wU2AVZRNJBrKKBlPlDLQ+R6h2HWQq
 SHKc/c+85phMRE4MokUWVi5qRDCfHZo2aZCBO3ecE78961qWgW6qZa+x/U7A6KHhY8oL
 fpOA==
X-Gm-Message-State: AAQBX9cmlpXsXLOmCOtFHSXk6FSYHkQP/hIUIRjomtx9+XLfd/vmeZ2N
 vhefiI3pIle4XbPib8HGS1MxiZlhRsQniQ==
X-Google-Smtp-Source: AKy350Zn4mH1UXhUMf5yrKBJpZRIXgfaBhY8j1M4NnsQEh0chrx1k0W5w821/lm20tuQtXCxYujLoA==
X-Received: by 2002:a81:4f42:0:b0:54e:fa90:5b9a with SMTP id
 d63-20020a814f42000000b0054efa905b9amr4156145ywb.45.1681119959519; 
 Mon, 10 Apr 2023 02:45:59 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com.
 [209.85.219.174]) by smtp.gmail.com with ESMTPSA id
 p145-20020a819897000000b0054ee8426468sm1341787ywg.21.2023.04.10.02.45.58
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Apr 2023 02:45:59 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id e127so3987818ybf.8
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Apr 2023 02:45:58 -0700 (PDT)
X-Received: by 2002:a25:cb52:0:b0:a02:a3a6:78fa with SMTP id
 b79-20020a25cb52000000b00a02a3a678famr4936366ybg.12.1681119958795; Mon, 10
 Apr 2023 02:45:58 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1680273039.git.geert+renesas@glider.be>
 <972e66cd36e9173ea6817d41565f708cb84bc2f4.1680273039.git.geert+renesas@glider.be>
 <20230405040211.GK9915@pendragon.ideasonboard.com>
In-Reply-To: <20230405040211.GK9915@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Apr 2023 11:45:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXjry9-owh6nrtdXXi9wtvgJRROd+P6=zRq0se8PJ4jMQ@mail.gmail.com>
Message-ID: <CAMuHMdXjry9-owh6nrtdXXi9wtvgJRROd+P6=zRq0se8PJ4jMQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] drm: shmobile: Make DRM_SHMOBILE visible on Renesas
 SoC platforms
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Wed, Apr 5, 2023 at 6:02=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Fri, Mar 31, 2023 at 04:48:11PM +0200, Geert Uytterhoeven wrote:
> > The LCD Controller supported by the drm-shmob driver is not only presen=
t
> > on SuperH SH-Mobile SoCs, but also on Renesas ARM SH/R-Mobile SoCs.
> > Make its option visible, so the user can enable support for it.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> >  drivers/gpu/drm/shmobile/Kconfig | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/shmobile/Kconfig b/drivers/gpu/drm/shmobil=
e/Kconfig
> > index 4ec5dc74a6b0b880..719d4e7a5cd75aad 100644
> > --- a/drivers/gpu/drm/shmobile/Kconfig
> > +++ b/drivers/gpu/drm/shmobile/Kconfig
> > @@ -2,7 +2,7 @@
> >  config DRM_SHMOBILE
> >       tristate "DRM Support for SH Mobile"
> >       depends on DRM && ARM
>
> There shouldn't be anything ARM-dependent, could you drop "&& ARM" while
> at it ?

Oops, that was added back in 2014, when the driver stopped building on SH.
The build issue seems to be fixed, so I'll drop the dependency on ARM.

> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks!

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
