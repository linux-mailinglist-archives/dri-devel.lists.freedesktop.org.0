Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 472707200BC
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 13:49:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7014310E66C;
	Fri,  2 Jun 2023 11:49:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com
 [209.85.128.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E19710E66C
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jun 2023 11:49:39 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-561b7729a12so49026407b3.1
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Jun 2023 04:49:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685706578; x=1688298578;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+fxB1hQZUap5NVzPtf/N8icy9UCTybKAh05Yo1w+lsU=;
 b=QT/zMLtPgrPmDMYoTG7/bBO33rv1compFu3wXQNQOCTEZ1j+eqjhqHRfmpt14Por9L
 UCJ8V5HZrFUkELMIR6rauUe7UWTMEwiOINhItuDRDhVyINQqXSVbGFON+EGUc17VKMzT
 565+KJyFlehbe2F7B8mRuvnYKitRoWVby2kEfZBJVKFMlgwqI4lpRQnAcHyEGpxayUXq
 rpfIh20vs7wc/IbIAUga0+2kcQ5+9Lu5ho6RCCwFv8dldn4aU862YA1QGjKvQnJcR1wn
 cO/H7bLJehEc2upmaViUIx8CczAg4Ir66UJm65Y4Glekfwr99aWBkC8yBeXHqvlgApVW
 Cg8w==
X-Gm-Message-State: AC+VfDwwUPAPKNI3IDSR41bzGvhcq4fXvFeCShubZVp64eCKvzBfLX5h
 u811q+c8+ddb1Ou/eS0UL+DDuPccvFyCakiz
X-Google-Smtp-Source: ACHHUZ4ZQv2vY9m1EEtv67p01DNF9j2F7HPYLoEcnPl962YSFIuUg3S3VcDZKGDfB+r5jWP8bNq97w==
X-Received: by 2002:a81:494a:0:b0:564:eb9a:689d with SMTP id
 w71-20020a81494a000000b00564eb9a689dmr6421702ywa.13.1685706578013; 
 Fri, 02 Jun 2023 04:49:38 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com.
 [209.85.128.181]) by smtp.gmail.com with ESMTPSA id
 h11-20020a81b40b000000b0054bfc94a10dsm393460ywi.47.2023.06.02.04.49.36
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Jun 2023 04:49:37 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-569386b7861so20864647b3.0
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Jun 2023 04:49:36 -0700 (PDT)
X-Received: by 2002:a25:e613:0:b0:ba8:b425:6bf2 with SMTP id
 d19-20020a25e613000000b00ba8b4256bf2mr3528914ybh.20.1685706576471; Fri, 02
 Jun 2023 04:49:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1685696114.git.geert+renesas@glider.be>
 <14e091fc522aa63a3e33bda1016e5fa946d47d18.1685696114.git.geert+renesas@glider.be>
 <20230602110459.GC26944@pendragon.ideasonboard.com>
 <CAMuHMdXR79TTSAcKb=DA2mRVDgaxBERts5PQLMf+mXpZDQJu=Q@mail.gmail.com>
 <20230602113640.GG26944@pendragon.ideasonboard.com>
In-Reply-To: <20230602113640.GG26944@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 2 Jun 2023 13:49:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWWbMW1cspwr0G_NLV5LVHnjaUbqfusUH8-yuqPobCUUA@mail.gmail.com>
Message-ID: <CAMuHMdWWbMW1cspwr0G_NLV5LVHnjaUbqfusUH8-yuqPobCUUA@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm: Remove references to removed transitional helpers
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Tomi Valkeinen <tomba@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Jyri Sarha <jyri.sarha@iki.fi>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, linux-renesas-soc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Biju Das <biju.das.jz@bp.renesas.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Fri, Jun 2, 2023 at 1:36=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Fri, Jun 02, 2023 at 01:17:58PM +0200, Geert Uytterhoeven wrote:
> > On Fri, Jun 2, 2023 at 1:05=E2=80=AFPM Laurent Pinchart wrote:
> > > On Fri, Jun 02, 2023 at 11:11:35AM +0200, Geert Uytterhoeven wrote:
> > > > The transitional helpers were removed a long time ago, but some
> > > > references stuck.  Remove them.
> > > >
> > > > Fixes: 21ebe615c16994f3 ("drm: Remove transitional helpers")
> > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > > > --- a/drivers/gpu/drm/drm_plane_helper.c
> > > > +++ b/drivers/gpu/drm/drm_plane_helper.c
> > > > @@ -51,14 +51,6 @@
> > > >   * planes, and newly merged drivers must not rely upon these trans=
itional
> > > >   * helpers.
> > > >   *
> > >
> > > The first paragraph starts with "This helper library has two parts.".=
 As
> > > you're dropping the mention of the second part, I think you should
> > > rework the first paragraph too.
> >
> > That was my initial thought, too.
> > However, the code still has a second part, not related to the topic of
> > the first part (primary plane support).
>
> How about mentioning that in the comment then ?

Any suggestion about the wording?
The drm novice in me would write "The second part is not about
primary plane support" ;-)

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
