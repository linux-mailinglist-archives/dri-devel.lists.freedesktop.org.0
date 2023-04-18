Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B8E6E5B1D
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 10:00:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7BC610E6B8;
	Tue, 18 Apr 2023 08:00:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com
 [209.85.219.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4C4910E6B8
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 08:00:49 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id n17so1336143ybq.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 01:00:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681804848; x=1684396848;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ae3jQh811jW+bT69kCowskcbhNDlXoH7aTMA8yYfQxs=;
 b=KvVc0AM+KIk8T7HHs+lcAd3HdaF3ezepaI7ogwz5g485gjjquHUHVsUAMUg6iTG7CM
 HLEkglhdH8V+iJQVCY3Lles5v3rplytuPtg6tbajaXm1xPJ5AmjuC4YO2HCIoN319IBY
 7KXBEnEItAoOtWtc9IZF8wd4Hm/BQybrmfbZyTnFb+kA/um/0L/SGVQ4Hu9hepuXm382
 28DBiCJC9DEWBGWUszS53d2Vnuoet8PxyhF+FwS9HmWdFvCVdL2bxMWZMKzso6z4ccGz
 2aFLxQF/GQ55o9d1KarMijNHUMB4GH1x1Glxq8ghrLevzQZsvvheibtidg+cMcxQ2hkl
 CNJQ==
X-Gm-Message-State: AAQBX9dkISGnfd2ih/SDADum2pcO7PkKJv1o5UHn0MqdZs/s65WhPgMF
 rSjD7dl9IEvuDQ7ckpahNMvIHh/LwDXkLQ==
X-Google-Smtp-Source: AKy350bT21MYGc6De0XKrmGAB2h5NjitYHpNMO6C3EfiRusg5x8fyXct7q2OGa8876pPKCnkP8NXjg==
X-Received: by 2002:a25:220a:0:b0:b92:2dcf:9f66 with SMTP id
 i10-20020a25220a000000b00b922dcf9f66mr9747745ybi.65.1681804848312; 
 Tue, 18 Apr 2023 01:00:48 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com.
 [209.85.128.178]) by smtp.gmail.com with ESMTPSA id
 66-20020a810645000000b0054f6f65f258sm3669097ywg.16.2023.04.18.01.00.47
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Apr 2023 01:00:47 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-54c12009c30so554247577b3.9
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 01:00:47 -0700 (PDT)
X-Received: by 2002:a0d:d8c1:0:b0:54f:8c00:58e7 with SMTP id
 a184-20020a0dd8c1000000b0054f8c0058e7mr15979059ywe.48.1681804846803; Tue, 18
 Apr 2023 01:00:46 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1681734821.git.geert+renesas@glider.be>
 <20230418075000.GF4703@pendragon.ideasonboard.com>
In-Reply-To: <20230418075000.GF4703@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Apr 2023 10:00:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUqKCokNc-phYFoGKa0vFwCMDdy7RZ-kn6F8yqkvtfkfA@mail.gmail.com>
Message-ID: <CAMuHMdUqKCokNc-phYFoGKa0vFwCMDdy7RZ-kn6F8yqkvtfkfA@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] drm: shmobile: Fixes and enhancements
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Tue, Apr 18, 2023 at 9:49=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Mon, Apr 17, 2023 at 03:40:20PM +0200, Geert Uytterhoeven wrote:
> > Currently, there are two drivers for the LCD controller on Renesas
> > SuperH-based and ARM-based SH-Mobile and R-Mobile SoCs:
> >   1. sh_mobile_lcdcfb, using the fbdev framework,
> >   2. shmob_drm, using the DRM framework.
> > However, only the former driver can be used, as all platform support
> > integrates the former.  None of these drivers support DT-based systems.
> >
> > This patch series is a first step to enable the SH-Mobile DRM driver fo=
r
> > Renesas ARM-based SH-Mobile and R-Mobile SoCs.  The next step planned i=
s
> > to add DT support.
> >
> > Changes compared to v1:
> >   - Add Reviewed-by,
> >   - Drop dependency on ARM.
> >
> > This has been tested on the R-Mobile A1-based Atmark Techno
> > Armadillo-800-EVA development board, using a temporary
> > platform-enablement patch[1].
> >
> > Thanks for applying to drm-misc!
>
> Would you like to request drm-misc committer rights ? :-)

Don't the listed maintainers for drivers/gpu/drm/shmobile/ don't
have such access already?

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
