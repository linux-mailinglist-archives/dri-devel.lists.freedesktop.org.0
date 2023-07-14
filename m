Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A76E3753760
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 12:04:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06AA110E852;
	Fri, 14 Jul 2023 10:04:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com
 [209.85.160.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACB4510E852;
 Fri, 14 Jul 2023 10:04:20 +0000 (UTC)
Received: by mail-oa1-f48.google.com with SMTP id
 586e51a60fabf-1b3c503af99so1356077fac.0; 
 Fri, 14 Jul 2023 03:04:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689329059; x=1691921059;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cbFWyufa2I/dKrp5bYUBMB1ESShCcC04UZ0ziSB/4oc=;
 b=hKbnxzGdJObd50DkJBBchmjGNTVzmfFnJgu35PLS0Fgu2/dxb9yU+bOGXsh/auqch1
 9JFvm+rCQLOI3U5sO9kNnPuKskOe37GtrzYZtiKlDdsQygRxryZMPhFCfpGbqWFRqIx/
 h5mVyb/CKEuxnpjCZLOQJrx1bGa2TQgKMcx6vksu/3ipy84vAzYJ1uUnk5BnTo20sbux
 RJRYPNC4Wts1S0M7RwvXlHZts0fTtiehTi5/hEr2kpLBz/y0eY78rNBOYb//beFaQzCm
 IA4Sv9eW6rbPcEhy/IALXbWzGju2dXxS4e/AIVfZM7V+5tKBhSFtqNiEwNtebJAUWpTc
 3tYA==
X-Gm-Message-State: ABy/qLZmQR67uHVFa6XLU02S73GxyXF1mK08kBfvsM5/Iqq7EKT+g7Sg
 ATroBAJiwpYHdQ/hkLfzfC+YZyM/EFRFPA==
X-Google-Smtp-Source: APBJJlHF7Q7bUOWyzUiE+yZ8LEvZy8rXLRCdQUaj/8Xrd69NWvokzje7pPuW8z3iSEarQ+wQPJs+9g==
X-Received: by 2002:aca:f1d6:0:b0:3a3:6f96:f15f with SMTP id
 p205-20020acaf1d6000000b003a36f96f15fmr3827307oih.15.1689329059192; 
 Fri, 14 Jul 2023 03:04:19 -0700 (PDT)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com.
 [209.85.210.52]) by smtp.gmail.com with ESMTPSA id
 k2-20020a544702000000b003a422b6ff4csm2840587oik.49.2023.07.14.03.04.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jul 2023 03:04:18 -0700 (PDT)
Received: by mail-ot1-f52.google.com with SMTP id
 46e09a7af769-6b9b89627c3so529055a34.1; 
 Fri, 14 Jul 2023 03:04:18 -0700 (PDT)
X-Received: by 2002:a05:6358:591d:b0:135:43da:b16d with SMTP id
 g29-20020a056358591d00b0013543dab16dmr4868202rwf.11.1689329058168; Fri, 14
 Jul 2023 03:04:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230714075155.5686-1-tzimmermann@suse.de>
In-Reply-To: <20230714075155.5686-1-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Jul 2023 12:04:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWoeyJPAgPgFi545SJFcaVCgZi1-zW2N5cBeU9BnHgo1w@mail.gmail.com>
Message-ID: <CAMuHMdWoeyJPAgPgFi545SJFcaVCgZi1-zW2N5cBeU9BnHgo1w@mail.gmail.com>
Subject: Re: [PATCH v3 00/18] fbdev: Remove FBINFO_DEFAULT and
 FBINFO_FLAG_DEFAULT flags
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
Cc: linux-fbdev@vger.kernel.org, kvm@vger.kernel.org,
 linux-hyperv@vger.kernel.org, linux-sh@vger.kernel.org, deller@gmx.de,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
 linux-nvidia@lists.surfsouth.com, linux-omap@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-geode@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Fri, Jul 14, 2023 at 9:53=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
> Remove the unused flags FBINFO_DEFAULT and FBINFO_FLAG_DEFAULT from
> fbdev and drivers, as briefly discussed at [1]. Both flags were maybe
> useful when fbdev had special handling for driver modules. With
> commit 376b3ff54c9a ("fbdev: Nuke FBINFO_MODULE"), they are both 0
> and have no further effect.
>
> Patches 1 to 7 remove FBINFO_DEFAULT from drivers. Patches 2 to 5
> split this by the way the fb_info struct is being allocated. All flags
> are cleared to zero during the allocation.
>
> Patches 8 to 16 do the same for FBINFO_FLAG_DEFAULT. Patch 8 fixes
> an actual bug in how arch/sh uses the token for struct fb_videomode,
> which is unrelated.
>
> Patch 17 removes both flag constants from <linux/fb.h> and patch 18
> documents the zero'ed memory returned by framebuffer_alloc().
>
> v3:
>         * sh: include board name in commit message (Adrian)
>         * docs: reword text (Miguel)

Thanks for the update!

>   fbdev: Remove flag FBINFO_DEFAULT from fbdev drivers
>   fbdev: Remove flag FBINFO_DEFAULT from fbdev drivers
>   fbdev: Remove flag FBINFO_DEFAULT from fbdev drivers
>   fbdev: Remove flag FBINFO_DEFAULT from fbdev drivers

Four patches with the exact same one-line summary. Please make them
unique.

>   fbdev: Remove flag FBINFO_FLAG_DEFAULT from fbdev drivers
>   fbdev: Remove flag FBINFO_FLAG_DEFAULT from fbdev drivers

Two patches with the exact same one-line summary. Please make them
unique.

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
