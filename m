Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4680A729663
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 12:11:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3532610E679;
	Fri,  9 Jun 2023 10:11:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
 [209.85.210.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAB9810E678
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jun 2023 10:11:04 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id
 46e09a7af769-6b29f53137cso516692a34.0
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jun 2023 03:11:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686305463; x=1688897463;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8JNw6xq3QFRhZzqNc9XYPo1ExQ/ZW3vKLniJaHHIba4=;
 b=aoXwMRiuRTZQY9ettrMON8hUeqiyDL8sSvpgb1VqullFNkVMOfcersEQZ+Wtnz4Em0
 aqlReZo9+PDui1//JLw9LAYknhjNWhStTiQDBataIitAFq5xPlP5AGBTPzvmkrt5eqq/
 mMogLhhC17I4qOiEQoHQ9n312pEEhzarHfECnx8IRJHfGhmrfOtziAK+lnBQcLO809UA
 HhduAdyg46ovDRQKLD/Q0ed1t7UFiqYlDbRt3K7oieCbivjPzfIVR1YWbRiiqrZoBfIy
 x+bUV07iK45F/0SIBHDfisaeiRfmAlwVSoMPguaUV+H8k41hp8Z8xmcv0qmJkeaCQL3h
 LwOw==
X-Gm-Message-State: AC+VfDycvtwL098RoybMP4tdF3W0o9BN8D433enjWOi8P5+yKxlo6yTZ
 VUFn2DURn2clqjtj+k/E6VHA2twqY/dh9Q==
X-Google-Smtp-Source: ACHHUZ7Sstfr7plxvG7in37AFOaczmRMv5RCqNaS2wyK1+d7lFGgLhufGMvdvdbBcO24mCOjOdkChQ==
X-Received: by 2002:a05:6830:4a6:b0:6b1:5e8f:e50c with SMTP id
 l6-20020a05683004a600b006b15e8fe50cmr1001649otd.30.1686305463429; 
 Fri, 09 Jun 2023 03:11:03 -0700 (PDT)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com.
 [209.85.161.49]) by smtp.gmail.com with ESMTPSA id
 x20-20020a9d6294000000b006af904d9c37sm1288830otk.45.2023.06.09.03.11.01
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jun 2023 03:11:01 -0700 (PDT)
Received: by mail-oo1-f49.google.com with SMTP id
 006d021491bc7-55a35e2a430so1041425eaf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jun 2023 03:11:01 -0700 (PDT)
X-Received: by 2002:a05:6808:20aa:b0:39a:a92b:c546 with SMTP id
 s42-20020a05680820aa00b0039aa92bc546mr1301127oiw.19.1686305461101; Fri, 09
 Jun 2023 03:11:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-31-tzimmermann@suse.de>
 <CAMuHMdVP2hrgXaZvASnHJ4M+VXaTCtfbeVXrq2dsEJqcs3G6ZA@mail.gmail.com>
 <e5d88ca8-66fe-b5ee-cb6b-2dc8f3a3fb26@suse.de>
 <CAMuHMdWBUKTgfCD9VLDFh_Tm1J-NJQHpxODs-TuYM7V-dtmGjA@mail.gmail.com>
 <873532eurg.fsf@minerva.mail-host-address-is-not-set>
 <77252bc9-e08e-fcee-d140-2b78ab768b42@suse.de>
 <CAMuHMdWUkZDcYfndf1A+cgcN5Fz1hmst4LrpA7iYCFqWSRTNDA@mail.gmail.com>
 <4df23439-462f-47da-890d-2dd2092eea35@suse.de>
 <87h6rh552q.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <87h6rh552q.fsf@minerva.mail-host-address-is-not-set>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 9 Jun 2023 12:10:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU27OK1=B6Qgwd+tyda=MmN0EiC8taUpvAJJOYUFcm88A@mail.gmail.com>
Message-ID: <CAMuHMdU27OK1=B6Qgwd+tyda=MmN0EiC8taUpvAJJOYUFcm88A@mail.gmail.com>
Subject: Re: [PATCH 30/30] fbdev: Make support for userspace interfaces
 configurable
To: Javier Martinez Canillas <javierm@redhat.com>
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
Cc: daniel.thompson@linaro.org, lee@kernel.org, linux-sh@vger.kernel.org,
 jingoohan1@gmail.com, deller@gmx.de, linux-staging@lists.linux.dev,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-omap@vger.kernel.org,
 sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier,

On Fri, Jun 9, 2023 at 11:59=E2=80=AFAM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> Thomas Zimmermann <tzimmermann@suse.de> writes:
> >>> I'd also question the argument that there's even fbdev userspace out
> >>> there. It was never popular in it's heyday and definitely hasn't
> >>> improved since then. Even the 3 people who still ask for fbdev suppor=
t
> >>
> >> There's X.org, DirectFB, SDL, ...
> >
> > None of these examples has a dependency on fbdev. They can freely switc=
h
> > backends and have moved to DRM. Anything program utilizing these
> > examples has no dependency on fbdev either.
> >
> > When I say "userspace" in this context, it's the one old program that
> > supports nothing but fbdev. TBH I'm having problems to come up with
> > examples.
> >
>
> I personally have two real world examples that can give to you :)
>
> 1) I've a IoT device at home that has a bunch of sensors (temperatury,
>    humidity, etc) and a SSD1306 display panel to report that. It just
>    has small fbdev program to print that info. I could probably port
>    to KMS but didn't feel like it. Found a fbdev program that I could
>    modify and got the job done.
>
> 2) I built a portable retro console for my kids, that uses a ST7735R
>    LCD panel. The software I use is https://www.retroarch.com/ which
>    uses fbdev by default (I believe that supports a KMS mode but out
>    of the box it works with fbdev and that's better tested by them.
>
> So even when I'm not interested and don't want to enable any of the
> fbdev drivers, I want to use the ssd130x and st7735r DRM drivers and
> the DRM fbdev emulation layer.
>
> In other words, there's real use cases for supporting fbdev programs
> with DRM drivers. Now, I agree with this patch-set and probably will
> disable the user-space fbdev interface in Fedora, but on my embedded
> projects I will probably keep it enabled.
>
> That's why I think that we should support the following combinations:
>
> * fbdev drivers + DRM fbdev emulation + fbdev user-space

"fbdev drivers + fbdev user-space", I assume?

> * only DRM drivers without fbdev emulation nor fbdev user-space (your ser=
ies)

Thomas' series includes fbdev emulation here, for the text console.

> * only DRM fbdev emulation + fbdev user-space enabled (FB_CORE)

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
