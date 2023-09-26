Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E33757AEE8B
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 16:52:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0F2610E111;
	Tue, 26 Sep 2023 14:52:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com
 [209.85.128.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8099910E111
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 14:52:01 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-59bebd5bdadso110229967b3.0
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 07:52:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695739920; x=1696344720;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GeJt2kDkJDREmJCiOFGlfnsT2tn2qZEwAJk2/hTfX/A=;
 b=fS3pKpqFcL1s5mUbWT3aySBVPvzLRHr7z/9BTYQ+9JEFDFzRhH/tl1v7uctRnirWoj
 GjfhwEpMP9KYrzzhjUHNZawrcbzTWQo58TO/msnr3PXG29d55Wl07b6+XY1rfqc1iWMP
 M4IIK5PkydaztNXpCFOU5VQVLRmwge6IbO3AWLbHZwSBc64sPl0pb2+gY8eyKcKVy6au
 YhCxouqwOn512AL3VoHj2I3yOVE3cv3CEvWpd6rObTuO58ExPl+rfYFtafBFdd8zQi7J
 yxtH+g09BSKEICy1R/tWY0/mQ85OjHQblzXqrw1yLHoDVX9r0b/ie0kkxFSKr/UyLeQ5
 /Q1w==
X-Gm-Message-State: AOJu0YznggjvgqIzUlaCbQfSqJwkCx7CNgAKHGO8nYaRzFmp/h4No53e
 EXlhZAIp17uprJO3jvs1t4KofjjPN3DdwQ==
X-Google-Smtp-Source: AGHT+IGT/pwo/DRF6whXojMhu4SPHzQmQyLtAI/+v3+6DXuKEv+gC+ckKsS0ex72+Tgn7b17feDhEA==
X-Received: by 2002:a0d:d481:0:b0:59b:d899:f171 with SMTP id
 w123-20020a0dd481000000b0059bd899f171mr9820950ywd.1.1695739920098; 
 Tue, 26 Sep 2023 07:52:00 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com.
 [209.85.219.176]) by smtp.gmail.com with ESMTPSA id
 a184-20020a0df1c1000000b00577269ba9e9sm3014275ywf.86.2023.09.26.07.51.58
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Sep 2023 07:51:58 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-d867d4cf835so6421041276.1
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 07:51:58 -0700 (PDT)
X-Received: by 2002:a25:f211:0:b0:d86:b9d5:124d with SMTP id
 i17-20020a25f211000000b00d86b9d5124dmr5899090ybe.16.1695739918497; Tue, 26
 Sep 2023 07:51:58 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1694767208.git.geert+renesas@glider.be>
 <CAMuHMdWfBTKdXvZutg4LvWqBjuz-X=ZjzX0LKPqD=JxYuLoPRw@mail.gmail.com>
 <20230919152428.GB18426@pendragon.ideasonboard.com>
In-Reply-To: <20230919152428.GB18426@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 26 Sep 2023 16:51:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUwBXQ2X6hOm+kcZOteDLMau8x5xUcRJr2zy9dXyVf9Xw@mail.gmail.com>
Message-ID: <CAMuHMdUwBXQ2X6hOm+kcZOteDLMau8x5xUcRJr2zy9dXyVf9Xw@mail.gmail.com>
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
 Geert Uytterhoeven <geert+renesas@glider.be>,
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

Hi Laurent, David, Daniel,

On Tue, Sep 19, 2023 at 5:24=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Tue, Sep 19, 2023 at 04:28:40PM +0200, Geert Uytterhoeven wrote:
> > The following changes since commit 0663e1da5ba8e6459e3555ac12c62741668c=
0d30:
> >
> >   drm/dp_mst: Tune down error message during payload addition
> > (2023-09-18 16:38:21 +0300)
> >
> > are available in the Git repository at:
> >
> >   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.g=
it
> > tags/shmob-drm-atomic-dt-tag1
> >
> > for you to fetch changes up to bfea0fa9052aa8d235b24957eb84d9ff20cb87b7=
:
> >
> >   drm: renesas: shmobile: Add DT support (2023-09-19 15:58:04 +0200)
> >
> > ----------------------------------------------------------------
> > drm: renesas: shmobile: Atomic conversion + DT support
> >
> > Currently, there are two drivers for the LCD controller on Renesas
> > SuperH-based and ARM-based SH-Mobile and R-Mobile SoCs:
> >   1. sh_mobile_lcdcfb, using the fbdev framework,
> >   2. shmob_drm, using the DRM framework.
> > However, only the former driver is used, as all platform support
> > integrates the former.  None of these drivers support DT-based systems.
> >
> > Convert the SH-Mobile DRM driver to atomic modesetting, and add DT
> > support, complemented by the customary set of fixes and improvements.
> >
> > Link: https://lore.kernel.org/r/cover.1694767208.git.geert+renesas@glid=
er.be/
> >
> > This PR is based on today's drm-misc/for-linux-next, to avoid a
> > conflict with commit 775b0669e19f2e4a ("drm/shmobile: Convert to
> > platform remove callback returning void") in drm-misc/for-linux-next

Now drm-misc/for-linux-next (which is still at v6.5-rc2) has been
merged into drm/drm-next (which is at v6.6-rc2), do you want me to
rebase my branch to current drm/drm-next, or any other commit?

Thanks!

> > Thanks for pulling!
> > ----------------------------------------------------------------
> > Geert Uytterhoeven (36):
> >       MAINTAINER: Create entry for Renesas SH-Mobile DRM drivers
>
> I'm technically listed as the maintainer for this driver until Geert
> takes over, so for this pull request,
>
> Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> And after that, shmobile won't need my ack to merge further changes :-)
>
> This is very nice work Geert. I'm looking forward to dropping the
> sh_mobile_lcdcfb driver.

Thank you!

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
