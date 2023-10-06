Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB227BB1D0
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 08:58:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95C5B10E200;
	Fri,  6 Oct 2023 06:58:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FA4D10E200
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Oct 2023 06:57:58 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-5a21ea6baccso22057227b3.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Oct 2023 23:57:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696575477; x=1697180277;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gwH34nAKT/9gJP0Nz0nWG6ojc2t+JiQa+bhA5w8EoOU=;
 b=Gx1bmJCe+v+pD4uslqBODfPudsQXyzfLxZARaXclQTWnKTuNAoaeRzY2QqmmcdKqiM
 8bu1r/gxgzsjpWS7fjBhvHrAEu2zrd6Rly9Zlt0bb7hcPAd16fXHDh2m8488o+qei7D/
 XuiObKdvejhUjh2eREs+hLLcBzY96u6eHd1E58359d6QvRcHOnyEab7hiu4Wulz3RcqO
 HBJlR3WjuoGvLPGFaatuXt+xSK3uFBIAmuQIf2KetQtvT/8RuVSWYg3EVcWcI9f+CkAz
 P+4YWUNHKNjII7liUm6/NykyIECNwnDJEjGXuxc7Zjol/2x1Lv0KGyvB4EEAaACnFLSs
 4PEg==
X-Gm-Message-State: AOJu0YydaVmhH0/QkTA6Wdelk1MiWWABFeCS4Kg6h/3vaM5CyeKy4GIO
 M1OLU4pM5+lu/Hn2PSzKbtC6Hu2k8JDKkQ==
X-Google-Smtp-Source: AGHT+IGePEUbZl8F5jmjwFbJJkAFzKrxZRI937M4P2SjrX3vmyMshdDr9N24x9saYlybsdNSIuRUcA==
X-Received: by 2002:a81:c24a:0:b0:589:f995:eb9f with SMTP id
 t10-20020a81c24a000000b00589f995eb9fmr7890070ywg.45.1696575477064; 
 Thu, 05 Oct 2023 23:57:57 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com.
 [209.85.128.172]) by smtp.gmail.com with ESMTPSA id
 m73-20020a0dca4c000000b00570253fc3e5sm1070525ywd.105.2023.10.05.23.57.56
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Oct 2023 23:57:56 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-59f1dff5298so21848147b3.3
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Oct 2023 23:57:56 -0700 (PDT)
X-Received: by 2002:a0d:dfc6:0:b0:57a:2e83:4daf with SMTP id
 i189-20020a0ddfc6000000b0057a2e834dafmr7696369ywe.32.1696575475803; Thu, 05
 Oct 2023 23:57:55 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1694767208.git.geert+renesas@glider.be>
 <CAMuHMdWfBTKdXvZutg4LvWqBjuz-X=ZjzX0LKPqD=JxYuLoPRw@mail.gmail.com>
 <20230919152428.GB18426@pendragon.ideasonboard.com>
 <CAMuHMdUwBXQ2X6hOm+kcZOteDLMau8x5xUcRJr2zy9dXyVf9Xw@mail.gmail.com>
In-Reply-To: <CAMuHMdUwBXQ2X6hOm+kcZOteDLMau8x5xUcRJr2zy9dXyVf9Xw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 6 Oct 2023 08:57:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUnQx82bzJ7XyzCo6MuDHNhDviZigJOyuYvtUOCkogxqQ@mail.gmail.com>
Message-ID: <CAMuHMdUnQx82bzJ7XyzCo6MuDHNhDviZigJOyuYvtUOCkogxqQ@mail.gmail.com>
Subject: Re: [GIT PULL] drm: renesas: shmobile: Atomic conversion + DT support
 (was: Re: [PATCH v4 00/41] drm: renesas: shmobile: Atomic conversion
 + DT support)
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
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
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Linux-sh list <linux-sh@vger.kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

On Tue, Sep 26, 2023 at 4:51=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
> On Tue, Sep 19, 2023 at 5:24=E2=80=AFPM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> > On Tue, Sep 19, 2023 at 04:28:40PM +0200, Geert Uytterhoeven wrote:
> > > The following changes since commit 0663e1da5ba8e6459e3555ac12c6274166=
8c0d30:
> > >
> > >   drm/dp_mst: Tune down error message during payload addition
> > > (2023-09-18 16:38:21 +0300)
> > >
> > > are available in the Git repository at:
> > >
> > >   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers=
.git
> > > tags/shmob-drm-atomic-dt-tag1
> > >
> > > for you to fetch changes up to bfea0fa9052aa8d235b24957eb84d9ff20cb87=
b7:
> > >
> > >   drm: renesas: shmobile: Add DT support (2023-09-19 15:58:04 +0200)
> > >
> > > ----------------------------------------------------------------
> > > drm: renesas: shmobile: Atomic conversion + DT support
> > >
> > > Currently, there are two drivers for the LCD controller on Renesas
> > > SuperH-based and ARM-based SH-Mobile and R-Mobile SoCs:
> > >   1. sh_mobile_lcdcfb, using the fbdev framework,
> > >   2. shmob_drm, using the DRM framework.
> > > However, only the former driver is used, as all platform support
> > > integrates the former.  None of these drivers support DT-based system=
s.
> > >
> > > Convert the SH-Mobile DRM driver to atomic modesetting, and add DT
> > > support, complemented by the customary set of fixes and improvements.
> > >
> > > Link: https://lore.kernel.org/r/cover.1694767208.git.geert+renesas@gl=
ider.be/
> > >
> > > This PR is based on today's drm-misc/for-linux-next, to avoid a
> > > conflict with commit 775b0669e19f2e4a ("drm/shmobile: Convert to
> > > platform remove callback returning void") in drm-misc/for-linux-next
>
> Now drm-misc/for-linux-next (which is still at v6.5-rc2) has been
> merged into drm/drm-next (which is at v6.6-rc2), do you want me to
> rebase my branch to current drm/drm-next, or any other commit?

Please advise me what needs to be done to move this forward.
Thanks!

> > > Thanks for pulling!
> > > ----------------------------------------------------------------
> > > Geert Uytterhoeven (36):
> > >       MAINTAINER: Create entry for Renesas SH-Mobile DRM drivers
> >
> > I'm technically listed as the maintainer for this driver until Geert
> > takes over, so for this pull request,
> >
> > Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >
> > And after that, shmobile won't need my ack to merge further changes :-)
> >
> > This is very nice work Geert. I'm looking forward to dropping the
> > sh_mobile_lcdcfb driver.

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
