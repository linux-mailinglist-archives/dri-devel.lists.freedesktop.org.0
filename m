Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B767746B60
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 10:01:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D68210E2AD;
	Tue,  4 Jul 2023 08:01:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B63E10E2AD
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jul 2023 08:01:47 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-5703d12ab9aso64639407b3.2
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jul 2023 01:01:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688457706; x=1691049706;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3VFQbKQ0ZnXtJ93rzqEp4TN1FXtg0VMVDun5sAa3KpE=;
 b=GA2PB6sCsgL6A/OexsO0HlQZWXkIjc5qkJ0owchvRkp6AoeG9lm8NW39PY2tzkT6zb
 flRjwhG3BQdsQWhEFfwFDdqsoZzeLjWz0LiTSxsEdCUWz8lEKV4aJ5RSvtQDLhLcI3oF
 M0LYkIp21XqvvWeOXLQZCzMdL+JtMDdyUGzQkJa6QgFGoW+J7zXhbBe+xraMNOVsKwVc
 ORi/AaHRzxTm2WBf53a2SMLFZ9w3u70UidfYSRH/8BnHs1UbVpK93iaUqt+IR5koXBWI
 qT858IRj6pjJXnfj+EzmsY4zlM6UnOzB3DTeTUjHzicYLxxAKrAnC4zgvpT/1M9MXgHa
 wTQQ==
X-Gm-Message-State: ABy/qLa3X+JFTg/9ReQg9kBZYjq9Q5DFU352gvJ8VuXOY4ZNWo9VOUU/
 DVQY89RbFJ9159uToPaZdjOz5qenx3t8lQ==
X-Google-Smtp-Source: APBJJlHz4OwITx7d82p3ooAvF59vOpiuT5xd3NrceQkldU4FyeAIrgCw9XmrIAS7GM/QRmJt/IIV0g==
X-Received: by 2002:a81:a156:0:b0:579:efb4:7d08 with SMTP id
 y83-20020a81a156000000b00579efb47d08mr7144555ywg.27.1688457705809; 
 Tue, 04 Jul 2023 01:01:45 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com.
 [209.85.128.181]) by smtp.gmail.com with ESMTPSA id
 a2-20020a0dd802000000b0054f9e7fed7asm5547205ywe.137.2023.07.04.01.01.44
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jul 2023 01:01:44 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-5774098f16eso53263147b3.0
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jul 2023 01:01:44 -0700 (PDT)
X-Received: by 2002:a25:6cd4:0:b0:bac:1522:f870 with SMTP id
 h203-20020a256cd4000000b00bac1522f870mr12173244ybc.52.1688457704084; Tue, 04
 Jul 2023 01:01:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230703230534.997525-1-javierm@redhat.com>
 <20230703230534.997525-2-javierm@redhat.com>
 <CAMuHMdXRg1OUy6UHuH4H+qkK-qO+jTKdVoG_SRM3q_PkyD+Bbw@mail.gmail.com>
 <87h6qkyuv4.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <87h6qkyuv4.fsf@minerva.mail-host-address-is-not-set>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 4 Jul 2023 10:01:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVBkV30X32UWdV5k_PSJfeOF-a5=eCBo_3N2265w+n1hA@mail.gmail.com>
Message-ID: <CAMuHMdVBkV30X32UWdV5k_PSJfeOF-a5=eCBo_3N2265w+n1hA@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] video: Add auxiliary display drivers to Graphics
 support menu
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
Cc: linux-fbdev@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Nipun Gupta <nipun.gupta@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Oded Gabbay <ogabbay@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier,

On Tue, Jul 4, 2023 at 9:54=E2=80=AFAM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> Geert Uytterhoeven <geert@linux-m68k.org> writes:
> > On Tue, Jul 4, 2023 at 1:05=E2=80=AFAM Javier Martinez Canillas
> > <javierm@redhat.com> wrote:
> >> The drivers in this subsystem are for character-based LCD displays, wh=
ich
> >> can fall into the same category of the DRM/KMS and fbdev drivers that =
are
> >> located under the "Graphics support" menu. Add auxdisplay there as wel=
l.
> >>
> >> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
> >> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> >
> > Thanks for your patch!
> >
> >> --- a/drivers/video/Kconfig
> >> +++ b/drivers/video/Kconfig
> >> @@ -30,6 +30,8 @@ if HAS_IOMEM
> >>  config HAVE_FB_ATMEL
> >>         bool
> >>
> >> +source "drivers/auxdisplay/Kconfig"
> >
> > This is inside the "if HAS_IOMEM" section, while there was no
> > such limitation before.
> >
>
> Gah, I missed that. Thanks a lot for pointing it out.
>
> If I move the source outside of the if block, are you OK with this patch?
>
> I think Thomas is correct and would make sense to put the character-based
> drivers next to the DRM and fbdev drivers since all these are for display=
.

Yes, makes sense to me.

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
