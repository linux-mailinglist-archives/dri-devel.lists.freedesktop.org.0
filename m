Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F0D571566
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 11:10:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2EEE93ABF;
	Tue, 12 Jul 2022 09:10:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3733D93ABE
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 09:10:56 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id a21so7713813qtw.10
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 02:10:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ogZIuR/DNUWYAnvjSDu9n0AhaTeKYHQRl89eLWPlDEo=;
 b=ApYZtl96a/4hAbLcyimi5IU5388pI6uJhx9ds+XTpd/34GAOHwzytw9zNBbJS4+lM9
 dP5FX84a3xRoH8RxWChLtg/AGgKtqq57wzjYvZS5/655esmHzpjqPJjmtyQH3MoSt4Tc
 HJX4Le0m7rIGvrar6F71/G0n7NYAvDBjw7aLRSQ8S8rsHp2TIQ3Tvl3RgV2/qm0jq+sT
 9LN3EZ8BdNf5/FSPU42x1BUztQTw47om/l3vMEKm0wT1AgxDhZ23fv8z9XOayDmMyS49
 Fl9a3KYOYXGf8lsaCA/ImHBPoxyh/Ti81CFO9ZTdemveBqV06OlLBbmaD3do75P+iLHa
 MgSw==
X-Gm-Message-State: AJIora8TJ1QS1NuSEdooC1pN8+eK/qsMUrDfp+kxSdDrl2W6JEw/3kGs
 XVaMe7y+HENZWPE3PuLNpCjEW0NQk5mgLw==
X-Google-Smtp-Source: AGRyM1vcYv7YvFK2JRrG+3MhfW6PnMuIJtN2Bxkqd0CFV+sMTxV2d6ZC2lfs1RuOFpM68oxR/S1vJA==
X-Received: by 2002:a05:622a:11c2:b0:31e:b9ec:30f3 with SMTP id
 n2-20020a05622a11c200b0031eb9ec30f3mr4253642qtk.195.1657617055134; 
 Tue, 12 Jul 2022 02:10:55 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com.
 [209.85.219.177]) by smtp.gmail.com with ESMTPSA id
 d21-20020a05620a159500b006af4f9b77fdsm7951610qkk.44.2022.07.12.02.10.54
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jul 2022 02:10:54 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id r3so12890260ybr.6
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 02:10:54 -0700 (PDT)
X-Received: by 2002:a05:6902:701:b0:66e:a06d:53d7 with SMTP id
 k1-20020a056902070100b0066ea06d53d7mr20639488ybt.604.1657617053347; Tue, 12
 Jul 2022 02:10:53 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1657300532.git.geert@linux-m68k.org>
 <0744671ac096a12f0d538906bd324efa71b11400.1657300532.git.geert@linux-m68k.org>
 <96a87833-d878-dde9-e335-9ea51a4ba406@mailbox.org>
 <CAMuHMdUgdbZeoFLFL8+Hm-6fG9cg5Wzq++JED3KR5P9YZtRQ4A@mail.gmail.com>
 <20220712074715.kopstlvz4q6npaye@sirius.home.kraxel.org>
 <CAMuHMdVrf7fgzumcSnZJ3OMGqA34YExXcF3O15YXYpA1ykgKyQ@mail.gmail.com>
 <20220712083907.3ic7bltstaskz72n@sirius.home.kraxel.org>
 <CAMuHMdVhxE9aayG8qRMwUuBryiR_ng08m63_+GY8htFCSmUiWg@mail.gmail.com>
 <20220712090305.44jq3olwhwypisoc@sirius.home.kraxel.org>
 <69a6aac7-0d48-7361-9750-8f242d374d60@mailbox.org>
In-Reply-To: <69a6aac7-0d48-7361-9750-8f242d374d60@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 12 Jul 2022 11:10:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWxbF6OsP0+c5hqxDTfHu+Wetcitk1yFiOPECoLtD6zyg@mail.gmail.com>
Message-ID: <CAMuHMdWxbF6OsP0+c5hqxDTfHu+Wetcitk1yFiOPECoLtD6zyg@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/fourcc: Add missing big-endian XRGB1555 and
 RGB565 formats
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
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
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Michel,

On Tue, Jul 12, 2022 at 11:09 AM Michel D=C3=A4nzer
<michel.daenzer@mailbox.org> wrote:
> On 2022-07-12 11:03, Gerd Hoffmann wrote:
> >>> As described above DRM_FORMAT_HOST_RGB565 means bigendian on bigendia=
n
> >>> hosts and little endian on little endian hosts.  Which is not correct
> >>> when your hardware does big endian no matter what.
> >>
> >> But (a) drm_driver_legacy_fb_format() uses DRM_FORMAT_HOST_RGB565
> >> if quirk_addfb_prefer_host_byte_order is set,
> >
> > Ah, right.  Missed that in 'git grep' output.  Given that traditional
> > fbdev behavior is to expect native byte order using
> > DRM_FORMAT_HOST_RGB565 there makes sense indeed.
> >
> > Scratch my comment about it being unused then ;)
>
> DRM_FORMAT_RGB565 | DRM_FORMAT_BIG_ENDIAN is still what the driver should=
 use conceptually, and should match DRM_FORMAT_HOST_RGB565 in drm_driver_le=
gacy_fb_format on a big endian host (which is presumably always the case fo=
r the atari driver).

Sure, I'll update the patch accordingly.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
