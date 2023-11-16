Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B567EE4EA
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 17:04:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A93C510E627;
	Thu, 16 Nov 2023 16:04:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com
 [209.85.128.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4165410E627
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 16:04:18 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-5b31c5143a0so10717147b3.3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 08:04:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700150657; x=1700755457;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Oqx3bXxdEF5eGmOFUaEEnJRV+EqOOyEh1+4SG0dDQpA=;
 b=Y9tGwj0uGn8Ju+EHxuwQayzWeD9UehyL12QKankegBCV2lmU3FTeV43z34IqvVJ851
 M/H0FDjixAndt1urFkEQucuAFprPbJRG0/rzn7ARHW3q9gkeOM3sUHPSVCujb50PQgKd
 F/qJSEF7gS4kZPH9JRK5Jlul/v/AXX73RmqSt1KjSob8i8Iw2f4z7ocacjRXMFdK72WS
 jTiTpITWVtpVgkQ30ZT1296osg3yY9luKT9NTto/iR5YPFt+msn6Ef65as+Vah0QQ3Iw
 /3w2v8VFFo+UJAiZmZsLaBBS+i7ALZ8m64m3nf7bZtl4uU8FyMejY/wu1bZBdsUZt+E2
 NSTg==
X-Gm-Message-State: AOJu0YxyfueGhQS52NOk7Q6fkMvWYKr6dO5LvYNLjYmOfYFWwnnKzWMR
 ODW+7CWAbS9moH9gpA1EM27EcrDur+Ty3Q==
X-Google-Smtp-Source: AGHT+IFCp7RdaZYCvO+cVWsXqqF7a249US7U05rlhamxpvHsFxaYfmPd7SSe+xxubrCrLyyqwB1VAg==
X-Received: by 2002:a0d:e3c1:0:b0:5a8:60ad:39a4 with SMTP id
 m184-20020a0de3c1000000b005a860ad39a4mr18339432ywe.3.1700150657139; 
 Thu, 16 Nov 2023 08:04:17 -0800 (PST)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com.
 [209.85.128.180]) by smtp.gmail.com with ESMTPSA id
 f66-20020a0dc345000000b00577269ba9e9sm1074289ywd.86.2023.11.16.08.04.15
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Nov 2023 08:04:15 -0800 (PST)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-5b499b18b28so10980367b3.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 08:04:15 -0800 (PST)
X-Received: by 2002:a25:4b02:0:b0:daf:bf52:62e4 with SMTP id
 y2-20020a254b02000000b00dafbf5262e4mr10831050yba.37.1700150655377; Thu, 16
 Nov 2023 08:04:15 -0800 (PST)
MIME-Version: 1.0
References: <20231116141608.252452-1-biju.das.jz@bp.renesas.com>
 <20231116141608.252452-5-biju.das.jz@bp.renesas.com>
 <eywaoaudaqtrv5ky46ahenapkjwk4tajxdrkuentehezw4ajid@aioncg5rahws>
In-Reply-To: <eywaoaudaqtrv5ky46ahenapkjwk4tajxdrkuentehezw4ajid@aioncg5rahws>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Nov 2023 17:04:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXZjft3AVEF7cPnhH4pz_2+9U51jnSg-tFJ-ppfi7GTZw@mail.gmail.com>
Message-ID: <CAMuHMdXZjft3AVEF7cPnhH4pz_2+9U51jnSg-tFJ-ppfi7GTZw@mail.gmail.com>
Subject: Re: [PATCH v14 4/4] MAINTAINERS: Create entry for Renesas RZ DRM
 drivers
To: Maxime Ripard <mripard@kernel.org>
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
Cc: Biju Das <biju.das.au@gmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 linux-renesas-soc@vger.kernel.org,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Biju Das <biju.das.jz@bp.renesas.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

On Thu, Nov 16, 2023 at 4:58=E2=80=AFPM Maxime Ripard <mripard@kernel.org> =
wrote:
> On Thu, Nov 16, 2023 at 02:16:08PM +0000, Biju Das wrote:
> > Create entry for Renesas RZ DRM drivers and add my self as a maintainer=
.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>
> > ---
> > v13->v14:
> >  * Now SHMOBILE has maintainer entries. So dropped updating
> >    DRM DRIVERS FOR RENESAS RCAR AND SHMOBILE.
> >  * Updated comment header and description.
> >  * The above changes are trivial, so kept the Rb tag from Laurent.

> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -7154,6 +7154,14 @@ F:     Documentation/devicetree/bindings/display=
/renesas,shmobile-lcdc.yaml
> >  F:   drivers/gpu/drm/renesas/shmobile/
> >  F:   include/linux/platform_data/shmob_drm.h
> >
> > +DRM DRIVERS FOR RENESAS RZ
> > +M:   Biju Das <biju.das.jz@bp.renesas.com>
> > +L:   dri-devel@lists.freedesktop.org
> > +L:   linux-renesas-soc@vger.kernel.org
> > +S:   Maintained
> > +F:   Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> > +F:   drivers/gpu/drm/renesas/rz-du/
>
> Any particular reason you want to opt-out of drm-misc?

IIRC, you opted all Renesas drivers out in commit 5a44d50f00725f31
("MAINTAINERS: Update drm-misc entry to match all drivers")?

Probably that should be restricted to drivers/gpu/drm/renesas/rcar-du/?

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
