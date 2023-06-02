Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC42572004D
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 13:23:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7444210E663;
	Fri,  2 Jun 2023 11:23:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DEE810E663
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jun 2023 11:23:41 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-568ba7abc11so20041817b3.3
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Jun 2023 04:23:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685705020; x=1688297020;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xQJ/6UDujFLjt/u17sCfKwDJo4mclYFIu5oHUs16qZw=;
 b=ju6K2e3gY8k4vL2DyO6q6NztkqQ8+IoMdGmEP+sFYb3N6Vz1xDVthtIiUq90PlrfGK
 3fB0FDS7KzO0jrt56qrro9Ojbng6XtxBXcfqMPzbLSyUwYiZJlStzLGFF+rqUeh4zBlA
 gBKUb1nCYPRDxCjOtMdNEvdKos5zoaeKM4Ok6NJfhwlpWGgaFpSI19AYReZv/vmxwlZa
 Yonr8pqGUjjunWdaTdWfXOEdTOfEWIuKqer7oYFFVUnYczXMgEN0Yq7gnojEgfI6KaXQ
 2na7VX4pI2M/sbvAOtOuWvRNOabMNQZ2EcxPmnsHYmajrMLAvr6OtOvnJmIt4qQgVulr
 mqaw==
X-Gm-Message-State: AC+VfDzofzgckSS83avd/t0A2mhPoK1BLo4r9RaxYvqgbnXXiEVX01CA
 nbRKbxGwmNMyOtW2LeEU803/b/MPTJM5NJKx
X-Google-Smtp-Source: ACHHUZ6t2/npiNsMdZxjMiSz9PyJfoyB9ZlaB66KWtWnPE+Zuwz2yRNyffTzqxxmoesaJXXbGTzGjQ==
X-Received: by 2002:a0d:d594:0:b0:561:e321:c893 with SMTP id
 x142-20020a0dd594000000b00561e321c893mr12575869ywd.24.1685705019703; 
 Fri, 02 Jun 2023 04:23:39 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com.
 [209.85.219.182]) by smtp.gmail.com with ESMTPSA id
 y141-20020a0dd693000000b00562b8c7edf0sm380830ywd.51.2023.06.02.04.23.38
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Jun 2023 04:23:39 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id
 3f1490d57ef6-bacf685150cso2106610276.3
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Jun 2023 04:23:38 -0700 (PDT)
X-Received: by 2002:a81:d250:0:b0:565:bf0d:e27a with SMTP id
 m16-20020a81d250000000b00565bf0de27amr14382323ywl.15.1685705018386; Fri, 02
 Jun 2023 04:23:38 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1685696114.git.geert+renesas@glider.be>
 <7cea42cd09540657875a210cd16421125497d690.1685696114.git.geert+renesas@glider.be>
 <878rd2cfme.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <878rd2cfme.fsf@minerva.mail-host-address-is-not-set>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 2 Jun 2023 13:23:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUDUT6GbLvsrZjkZj+LKPD=-yYY2vnbP-K+i+yMAeHy7w@mail.gmail.com>
Message-ID: <CAMuHMdUDUT6GbLvsrZjkZj+LKPD=-yYY2vnbP-K+i+yMAeHy7w@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/todo: Add atomic modesetting references
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
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Tomi Valkeinen <tomba@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Jyri Sarha <jyri.sarha@iki.fi>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, linux-renesas-soc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Biju Das <biju.das.jz@bp.renesas.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier,

On Fri, Jun 2, 2023 at 12:39=E2=80=AFPM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> Geert Uytterhoeven <geert+renesas@glider.be> writes:
> > The section about converting existing KMS drivers to atomic modesetting
> > mentions the existence of a conversion guide, but does not reference it=
.
> > While the guide is old and rusty, it still contains useful information,
> > so add a link to it.  Also link to the LWN.net articles that give an
> > overview about the atomic mode setting design.

> > --- a/Documentation/gpu/todo.rst
> > +++ b/Documentation/gpu/todo.rst
> > @@ -49,14 +49,19 @@ converted over. Modern compositors like Wayland or =
Surfaceflinger on Android
> >  really want an atomic modeset interface, so this is all about the brig=
ht
> >  future.
> >
> > -There is a conversion guide for atomic and all you need is a GPU for a
> > +There is a conversion guide for atomic[1] and all you need is a GPU fo=
r a
> >  non-converted driver (again virtual HW drivers for KVM are still all
> > -suitable).
>
> Are any of the virtual drivers not yet ported to atomic? This sentence
> seems to be outdated and maybe you could remove it on a following patch?

Good question.  I'm not sure which driver(s) this refers to.
drivers/gpu/drm/vkms/ was introduced much later, and always had
DRIVER_ATOMIC. Perhaps just the boochs driver, which was converted?

> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Thanks!

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
