Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F8F74F456
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 18:05:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DA0810E3CE;
	Tue, 11 Jul 2023 16:05:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com
 [209.85.160.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9660810E3CE;
 Tue, 11 Jul 2023 16:04:59 +0000 (UTC)
Received: by mail-oa1-f44.google.com with SMTP id
 586e51a60fabf-1a1fa977667so5348847fac.1; 
 Tue, 11 Jul 2023 09:04:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689091498; x=1691683498;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y7zt5pO69xVTkx3WPA+RT/byFcn7lDWoK0rY+7VhmSY=;
 b=JKYTzjmVDhDf9af6CkHhV2qNFLiluiNrNYWTW8jlRX1Wos6dE8mOAHYCIC5J1EvkyT
 DbO1mimhAnWkqdZeGFy8NsyKBxPApdHFRHdpWJQnUTmVQZLMUHA7D8vhiOwX63lGKRps
 DNGkhiFedljj4EQmc28dnPqdfPv65UfOTdaccr1UQaLCyvJ2QvPbaw8GROVd1bZDXHvk
 fjhzRhle8W/8jynG1JjQN+AcZqsLOC/CtVa4pa5EK5WxciQdcqcdMBBK2YzpNsjVokmO
 ebfF7JKstcjWVutzBmWWqnn77v1V6UGqDjGa0AQWKf/owFpESnYer3ddFgVLeqV+BJYV
 IjkQ==
X-Gm-Message-State: ABy/qLbRXMMPGvQP1N3xsw4zf7th6X2RdjXsnAT9S5Xj+FWlIFDGM0OG
 FDSaapsHQ3BOS0kY8yZxZqqd34cs7nvLNA==
X-Google-Smtp-Source: APBJJlGIfDreVfgVKDTzpJSsK8k+3Pnqeh5HYT7zY21RH55qvNza3Ek2RfbGOHIMzw+zMdorhmTq4Q==
X-Received: by 2002:a05:6870:5687:b0:1ad:3cfe:3ead with SMTP id
 p7-20020a056870568700b001ad3cfe3eadmr18404101oao.20.1689091497844; 
 Tue, 11 Jul 2023 09:04:57 -0700 (PDT)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com.
 [209.85.167.182]) by smtp.gmail.com with ESMTPSA id
 l6-20020a9d6a86000000b006b9742a7575sm1025093otq.63.2023.07.11.09.04.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jul 2023 09:04:56 -0700 (PDT)
Received: by mail-oi1-f182.google.com with SMTP id
 5614622812f47-3a3b7fafd61so4811031b6e.2; 
 Tue, 11 Jul 2023 09:04:56 -0700 (PDT)
X-Received: by 2002:a05:6358:4198:b0:132:7a2e:87bc with SMTP id
 w24-20020a056358419800b001327a2e87bcmr13654687rwc.5.1689091495810; Tue, 11
 Jul 2023 09:04:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230710130113.14563-1-tzimmermann@suse.de>
 <20230710171903.GA14712@ravnborg.org>
 <ab92f8d9-36ab-06bc-b85b-d52b7a1bfe9a@suse.de>
 <20230711144744.GA117276@ravnborg.org>
 <bf439387-6b13-0fd9-f61b-1a5cbf731187@gmx.de>
In-Reply-To: <bf439387-6b13-0fd9-f61b-1a5cbf731187@gmx.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Jul 2023 18:04:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXnTDK6uZNhNR=NFTiy4F+2nLJd1E47vDoXUV3zFSCGOA@mail.gmail.com>
Message-ID: <CAMuHMdXnTDK6uZNhNR=NFTiy4F+2nLJd1E47vDoXUV3zFSCGOA@mail.gmail.com>
Subject: Re: [PATCH 00/17] fbdev: Remove FBINFO_DEFAULT and
 FBINFO_FLAG_DEFAULT flags
To: Helge Deller <deller@gmx.de>
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
Cc: linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-hyperv@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 javierm@redhat.com, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-input@vger.kernel.org,
 linux-nvidia@lists.surfsouth.com, linux-omap@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, linux-geode@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Helge,

On Tue, Jul 11, 2023 at 5:26=E2=80=AFPM Helge Deller <deller@gmx.de> wrote:
> On 7/11/23 16:47, Sam Ravnborg wrote:
> > On Tue, Jul 11, 2023 at 08:24:40AM +0200, Thomas Zimmermann wrote:
> >> Am 10.07.23 um 19:19 schrieb Sam Ravnborg:
> >>> On Mon, Jul 10, 2023 at 02:50:04PM +0200, Thomas Zimmermann wrote:
> >>>> Remove the unused flags FBINFO_DEFAULT and FBINFO_FLAG_DEFAULT from
> >>>> fbdev and drivers, as briefly discussed at [1]. Both flags were mayb=
e
> >>>> useful when fbdev had special handling for driver modules. With
> >>>> commit 376b3ff54c9a ("fbdev: Nuke FBINFO_MODULE"), they are both 0
> >>>> and have no further effect.
> >>>>
> >>>> Patches 1 to 7 remove FBINFO_DEFAULT from drivers. Patches 2 to 5
> >>>> split this by the way the fb_info struct is being allocated. All fla=
gs
> >>>> are cleared to zero during the allocation.
> >>>>
> >>>> Patches 8 to 16 do the same for FBINFO_FLAG_DEFAULT. Patch 8 fixes
> >>>> an actual bug in how arch/sh uses the tokne for struct fb_videomode,
> >>>> which is unrelated.
> >>>>
> >>>> Patch 17 removes both flag constants from <linux/fb.h>
> >>>
> >>> We have a few more flags that are unused - should they be nuked too?
> >>> FBINFO_HWACCEL_FILLRECT
> >>> FBINFO_HWACCEL_ROTATE
> >>> FBINFO_HWACCEL_XPAN
> >>
> >> It seems those are there for completeness. Nothing sets _ROTATE,
>
> I think some fbdev drivers had hardware acceleration for ROTATE in the
> past. HWACCEL_XPAN is still in some drivers.
>
> >> the others are simply never checked. According to the comments,
> >> some are required, some are optional. I don't know what that
> >> means.
>
> I think it's OK if you remove those flags which aren't used anywhere,
> e.g. FBINFO_HWACCEL_ROTATE.

Indeed.

> >> IIRC there were complains about performance when Daniel tried to remov=
e
> >> fbcon acceleration, so not all _HWACCEL_ flags are unneeded.
>
> Correct. I think COPYAREA and FILLRECT are the bare minimum to accelerate
> fbcon, IMAGEBLIT is for showing the tux penguin (?),
> XPAN/YPAN and YWRAP for some hardware screen panning needed by some drive=
rs
> (not sure if this is still used as I don't have such hardware, Geert?).

Yes, they are used.  Anything that is handled in drivers/video/fbdev/core/
is used:

$ git grep  HWACCEL_ -- drivers/video/fbdev/core/
drivers/video/fbdev/core/fbcon.c:       if ((info->flags &
FBINFO_HWACCEL_COPYAREA) &&
drivers/video/fbdev/core/fbcon.c:           !(info->flags &
FBINFO_HWACCEL_DISABLED))
drivers/video/fbdev/core/fbcon.c:       int good_pan =3D (cap &
FBINFO_HWACCEL_YPAN) &&
drivers/video/fbdev/core/fbcon.c:       int good_wrap =3D (cap &
FBINFO_HWACCEL_YWRAP) &&
drivers/video/fbdev/core/fbcon.c:       int fast_copyarea =3D (cap &
FBINFO_HWACCEL_COPYAREA) &&
drivers/video/fbdev/core/fbcon.c:               !(cap &
FBINFO_HWACCEL_DISABLED);
drivers/video/fbdev/core/fbcon.c:       int fast_imageblit =3D (cap &
FBINFO_HWACCEL_IMAGEBLIT) &&
drivers/video/fbdev/core/fbcon.c:               !(cap &
FBINFO_HWACCEL_DISABLED);

BTW, I'm surprised FBINFO_HWACCEL_FILLRECT is not handled.
But looking at the full history, it never was...

> >> Leaving them in for reference/completeness might be an option; or not.=
 I
> >> have no strong feelings about those flags.
>
> I'd say drop FBINFO_HWACCEL_ROTATE at least ?

Agreed.

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
