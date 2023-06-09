Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BB3729A4D
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 14:48:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE47110E693;
	Fri,  9 Jun 2023 12:48:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7151910E693
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jun 2023 12:48:15 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-565f1145dc8so15622177b3.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jun 2023 05:48:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686314893; x=1688906893;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oUnX0UM+Igwa0fUtgyLnX5bA3wv9FfoFnuZ0mnmyxD8=;
 b=RBDveGhT5MAuSV4czWPpOTOrVMumVYqapV63DdjV/2vxRe9sSm7AyXkzzR0kGF/wns
 BuevM/igAOiNjrBH7pbqlVXOLNFhOaiQ+hg02JTOPsinowU8WnT0+obEZa2VHx3i8NXS
 hVJ9IQSumHXCXfIbWYQUwyNt0htHzd9h/FVj2kqYxZ/rLbNe2mI3Gn/g2P0j2nVvReq5
 RIQYn9jyE6H7+Ey8Q6w+heW6hHZz4Cis9i9KJ4nN8nIOD2JFF2qTixxX4E3bxXXraAFM
 +Ny54mMJc4OrSwSxxziCaT/LCY+aSwvAbcGRZzrUK7UFRIBYl2zdk/KAM5xO0IKK73JI
 Tz1Q==
X-Gm-Message-State: AC+VfDxTgOwK0do9edtYGCKU76StfjmX+P99D8qWGPQW/2oG7ETF9jjy
 cnl/BpAvE/XJ19aSZZdon6zqSMukuCt+Tw==
X-Google-Smtp-Source: ACHHUZ5xWlXtRMyxU0V2GL5Z4C/3y3LkdLjMpt7mWMmL54ZZmTy6SpryruQKp5dx1TzVcNfMCtnq9g==
X-Received: by 2002:a0d:dd10:0:b0:564:a549:babc with SMTP id
 g16-20020a0ddd10000000b00564a549babcmr1080166ywe.32.1686314893481; 
 Fri, 09 Jun 2023 05:48:13 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com.
 [209.85.128.175]) by smtp.gmail.com with ESMTPSA id
 t202-20020a8183d3000000b005619cfb1b88sm586928ywf.52.2023.06.09.05.48.10
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jun 2023 05:48:11 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-565eaf83853so15678497b3.3
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jun 2023 05:48:10 -0700 (PDT)
X-Received: by 2002:a81:8841:0:b0:569:1ff9:58d3 with SMTP id
 y62-20020a818841000000b005691ff958d3mr1254652ywf.1.1686314890673; Fri, 09 Jun
 2023 05:48:10 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1685696114.git.geert+renesas@glider.be>
 <14e091fc522aa63a3e33bda1016e5fa946d47d18.1685696114.git.geert+renesas@glider.be>
 <20230602110459.GC26944@pendragon.ideasonboard.com>
 <CAMuHMdXR79TTSAcKb=DA2mRVDgaxBERts5PQLMf+mXpZDQJu=Q@mail.gmail.com>
In-Reply-To: <CAMuHMdXR79TTSAcKb=DA2mRVDgaxBERts5PQLMf+mXpZDQJu=Q@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 9 Jun 2023 14:47:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWcrLme4qHnhXymJZmbYk2Bwr3sBymf5W=t8pdj_g8YXA@mail.gmail.com>
Message-ID: <CAMuHMdWcrLme4qHnhXymJZmbYk2Bwr3sBymf5W=t8pdj_g8YXA@mail.gmail.com>
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

On Fri, Jun 2, 2023 at 1:17=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
> On Fri, Jun 2, 2023 at 1:05=E2=80=AFPM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> > On Fri, Jun 02, 2023 at 11:11:35AM +0200, Geert Uytterhoeven wrote:
> > > The transitional helpers were removed a long time ago, but some
> > > references stuck.  Remove them.
> > >
> > > Fixes: 21ebe615c16994f3 ("drm: Remove transitional helpers")
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> > > --- a/drivers/gpu/drm/drm_plane_helper.c
> > > +++ b/drivers/gpu/drm/drm_plane_helper.c
> > > @@ -51,14 +51,6 @@
> > >   * planes, and newly merged drivers must not rely upon these transit=
ional
> > >   * helpers.
> > >   *
> >
> > The first paragraph starts with "This helper library has two parts.". A=
s
> > you're dropping the mention of the second part, I think you should
> > rework the first paragraph too.
>
> That was my initial thought, too.
> However, the code still has a second part, not related to the topic of
> the first part (primary plane support).

Upon deeper investigation, all of this is related to primary plane
support. Will update...

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
