Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB556D463E
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 15:52:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1045C10E475;
	Mon,  3 Apr 2023 13:52:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 741C810E48F
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Apr 2023 13:52:37 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-5491fa028adso56400797b3.10
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Apr 2023 06:52:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680529956;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a3dsuy9SysKm463aIidfzRiqsaM6ZWpxf2+nNV1AuG4=;
 b=7VaPX1To8VIWlw/ldJ/+iQr7+cS64MbuQITCM0FIXhqS2ms28SMnCvaHTXhoBnB10g
 djt7tGi0PHi7oX5KG0X4+cIujJZBfd/rxNnVLKrdXQP7jmBuY4EB2VXec53GzZniBtYQ
 vqgNGSziYDDseRbv/RcsYZU1Ut6HW0a0sFQEH9kIB/BZOHj8HfTbPCTn8/L33K4fj/4Y
 XQKJzBlbKXsRk/pjm8KB/qZydodipcOaZmj19HnG8tbTAI/kZDmrXVGt1ply1MP91Jjz
 oQ5XYgKKdnpmRABXImZUldJXf8bQr1WdOr5Q7FRXjqm4jIsOHqK/k9KINJMOwsqFZh0j
 g+5Q==
X-Gm-Message-State: AAQBX9fM/9N9NXP6HkLpgJ4aDDm2RzLJJPdimGbMYZvrz9KAcxrQSwzI
 +P8Jb28fKhh0HaHZhbQmpymwQQ57klGAC0CR
X-Google-Smtp-Source: AKy350Y+LtuAhaPM6IzqsfPawQrHu9gmTJ/xznyEWn+Ajnwvgd+fzM7lR3JiTlxCndQ7o4l8FplFQQ==
X-Received: by 2002:a81:524f:0:b0:541:6d92:a22f with SMTP id
 g76-20020a81524f000000b005416d92a22fmr32135780ywb.20.1680529955938; 
 Mon, 03 Apr 2023 06:52:35 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com.
 [209.85.219.175]) by smtp.gmail.com with ESMTPSA id
 h65-20020a816c44000000b00545a081847esm2516472ywc.14.2023.04.03.06.52.35
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Apr 2023 06:52:35 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id i6so34847340ybu.8
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Apr 2023 06:52:35 -0700 (PDT)
X-Received: by 2002:a25:bb85:0:b0:b7c:1144:a708 with SMTP id
 y5-20020a25bb85000000b00b7c1144a708mr16700229ybg.12.1680529955037; Mon, 03
 Apr 2023 06:52:35 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1680273039.git.geert+renesas@glider.be>
 <01484ce3-2366-5000-3aa6-727448145f36@suse.de>
In-Reply-To: <01484ce3-2366-5000-3aa6-727448145f36@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 3 Apr 2023 15:52:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXYnbxLsJp3bnH74yfZAHG=8Da360C4AjKQg-Ynv6hiMw@mail.gmail.com>
Message-ID: <CAMuHMdXYnbxLsJp3bnH74yfZAHG=8Da360C4AjKQg-Ynv6hiMw@mail.gmail.com>
Subject: Re: [PATCH 0/5] drm: shmobile: Fixes and enhancements
To: Thomas Zimmermann <tzimmermann@suse.de>
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
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Mon, Apr 3, 2023 at 3:14=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:
> Am 31.03.23 um 16:48 schrieb Geert Uytterhoeven:
> > Currently, there are two drivers for the LCD controller on Renesas
> > SuperH-based and ARM-based SH-Mobile and R-Mobile SoCs:
> >    1. sh_mobile_lcdcfb, using the fbdev framework,
> >    2. shmob_drm, using the DRM framework.
> > However, only the former driver can be used, as all platform support
> > integrates the former.  None of these drivers support DT-based systems.
> >
> > This patch series is a first step to enable the SH-Mobile DRM driver fo=
r
> > Renesas ARM-based SH-Mobile and R-Mobile SoCs.  The next step planned i=
s
> > to add DT support.
> >
> > This has been tested on the R-Mobile A1-based Atmark Techno
> > Armadillo-800-EVA development board, using a temporary
> > platform-enablement patch[1].
>
> Since you have the hardware for shmobile, would you be able to test
> patches occasionally?

Sure!

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
