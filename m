Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D4A85F2E9
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 09:29:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65C0510E8B8;
	Thu, 22 Feb 2024 08:29:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com
 [209.85.128.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE5D410E8B7;
 Thu, 22 Feb 2024 08:29:18 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-6085b652fc8so32585947b3.2; 
 Thu, 22 Feb 2024 00:29:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708590557; x=1709195357;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3E80Fr+PQHplyVIuytgLvVqlKEcgK1zfDCm4lydbgb8=;
 b=jC1XTpD3//6QjjGfGQn79e5wCagHveipz8VYIv1m/Ep3f2HrpasIhLt59bvL/YKJP+
 KiOM7T6Lh0GAMGBe3hnyMJUxeSPgFEdSKSSbrgyiMIhHynTPv0NRTYIfXrIUNkQzRuyi
 prZgBSwftxCwP8Cs1EKT8BSTJ7MrWhrAcWGXdnsqQydnuKTjYg9skvZI48guvi5uZNFm
 /b3v+XtX1QGILRjOT1poLS+wdlKYP7aam5sL1W3qb0AIBgyS6CQut1fjNmryaTkg0W9H
 F724VMcxzX+AxfmDB1Lef66sYIdb3ORvwfXE41TW6FgoUayb83r0vu1/Aq8UNq0eeNss
 57CQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpEZAfGCQCPo9SjJbMvJlU+kNuxvZgxSCYnogXIXmsprq9CssR/hdlOmL4RnsSstJiUy0DtHFJCkQ4ULTracUE8NLEH85FoBX9JNukdnGifC/6gJNqRraHRBWxmpmjU2q1glYLq6djkkFjukqNjOhG
X-Gm-Message-State: AOJu0YyfMwu0ENhEC0DvC8p/RcusP26EAQJrsRIkh1IWhNL3i4Ft7xh7
 Avt4zQzU1jGasjJ3qOo/MhwEkJKaOCY3Xuwl5YI4lc1Au4WQ2ez4nU9eO1019TI=
X-Google-Smtp-Source: AGHT+IHhDoepMcBMNevmdfVJQrdyrqVJ5I5NG0l0kEhdjvGNnmFRtv6ZkkLwzvhMDoHtPrvsW862lw==
X-Received: by 2002:a81:ff17:0:b0:607:f4fc:cb00 with SMTP id
 k23-20020a81ff17000000b00607f4fccb00mr14393068ywn.52.1708590557470; 
 Thu, 22 Feb 2024 00:29:17 -0800 (PST)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com.
 [209.85.128.177]) by smtp.gmail.com with ESMTPSA id
 e65-20020a816944000000b006077cd5fc5csm2979011ywc.11.2024.02.22.00.29.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Feb 2024 00:29:16 -0800 (PST)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-607e60d01b2so34295277b3.1; 
 Thu, 22 Feb 2024 00:29:16 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUMVpYkhR6aoh/1SnrlRjOY04kjATAcSCtfow9gIxtGNeV5guoZmDR3ft60RU3X07zrA+rOD1Qf9NBDDdBvNT96jZYI7IOM8IGDZGTW4gW1MvxfIUawWL6+gBOxsUqWGS6nRtazBwzEVJ4OUz+NZFW2
X-Received: by 2002:a05:690c:714:b0:608:98d:6f77 with SMTP id
 bs20-20020a05690c071400b00608098d6f77mr12592435ywb.0.1708590556168; Thu, 22
 Feb 2024 00:29:16 -0800 (PST)
MIME-Version: 1.0
References: <20240222124610.383e1ce3@canb.auug.org.au>
 <TYCPR01MB11269B83A59650E230F4DD97F86562@TYCPR01MB11269.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB11269B83A59650E230F4DD97F86562@TYCPR01MB11269.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 22 Feb 2024 09:29:04 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV0nftTZ6WuEkcS9h0d1bx_haR==roB1gwbaS2fzooO_A@mail.gmail.com>
Message-ID: <CAMuHMdV0nftTZ6WuEkcS9h0d1bx_haR==roB1gwbaS2fzooO_A@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, 
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>, 
 Maxime Ripard <mripard@kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux Next Mailing List <linux-next@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Biju,

On Thu, Feb 22, 2024 at 9:14=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> > -----Original Message-----
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Sent: Thursday, February 22, 2024 1:46 AM
> > Subject: linux-next: build failure after merge of the drm-misc tree
> >
> > After merging the drm-misc tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> >
> > drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c:47:6: error: redefinition =
of
> > 'rzg2l_du_vsp_enable'
> >    47 | void rzg2l_du_vsp_enable(struct rzg2l_du_crtc *crtc)
> >       |      ^~~~~~~~~~~~~~~~~~~
> > In file included from drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h:18,
> >                  from drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c:30:
> > drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h:72:20: note: previous
> > definition of 'rzg2l_du_vsp_enable' with type 'void(struct rzg2l_du_crt=
c
> > *)'
> >    72 | static inline void rzg2l_du_vsp_enable(struct rzg2l_du_crtc *cr=
tc)
> > { };
> >       |                    ^~~~~~~~~~~~~~~~~~~
> > drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c:61:6: error: redefinition =
of
> > 'rzg2l_du_vsp_disable'
> >    61 | void rzg2l_du_vsp_disable(struct rzg2l_du_crtc *crtc)
> >       |      ^~~~~~~~~~~~~~~~~~~~
> > drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h:73:20: note: previous
> > definition of 'rzg2l_du_vsp_disable' with type 'void(struct rzg2l_du_cr=
tc
> > *)'
> >    73 | static inline void rzg2l_du_vsp_disable(struct rzg2l_du_crtc
> > *crtc) { };
> >       |                    ^~~~~~~~~~~~~~~~~~~~
> > drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c:66:6: error: redefinition =
of
> > 'rzg2l_du_vsp_atomic_flush'
> >    66 | void rzg2l_du_vsp_atomic_flush(struct rzg2l_du_crtc *crtc)
> >       |      ^~~~~~~~~~~~~~~~~~~~~~~~~
> > drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h:74:20: note: previous
> > definition of 'rzg2l_du_vsp_atomic_flush' with type 'void(struct
> > rzg2l_du_crtc *)'
> >    74 | static inline void rzg2l_du_vsp_atomic_flush(struct rzg2l_du_cr=
tc
> > *crtc) { };
> >       |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
> > drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c:76:19: error: redefinition=
 of
> > 'rzg2l_du_vsp_get_drm_plane'
> >    76 | struct drm_plane *rzg2l_du_vsp_get_drm_plane(struct rzg2l_du_cr=
tc
> > *crtc,
> >       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
> > drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h:75:33: note: previous
> > definition of 'rzg2l_du_vsp_get_drm_plane' with type 'struct drm_plane
> > *(struct rzg2l_du_crtc *, unsigned int)'
> >    75 | static inline struct drm_plane *rzg2l_du_vsp_get_drm_plane(stru=
ct
> > rzg2l_du_crtc *crtc,
> >       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
> > drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c:302:5: error: redefinition=
 of
> > 'rzg2l_du_vsp_init'
> >   302 | int rzg2l_du_vsp_init(struct rzg2l_du_vsp *vsp, struct device_n=
ode
> > *np,
> >       |     ^~~~~~~~~~~~~~~~~
> > drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h:66:19: note: previous
> > definition of 'rzg2l_du_vsp_init' with type 'int(struct rzg2l_du_vsp *,
> > struct device_node *, unsigned int)'
> >    66 | static inline int rzg2l_du_vsp_init(struct rzg2l_du_vsp *vsp,
> > struct device_node *np,
> >       |                   ^~~~~~~~~~~~~~~~~
> >
> > Caused by commit
> >
> >   768e9e61b3b9 ("drm: renesas: Add RZ/G2L DU Support")
> >
> > I have used the drm-misc tree from next-20240221 for today.
>
> I will send an incremental patch to fix this build error with x86 on drm-=
next.
>
> I need to use the macro #if IS_ENABLED(CONFIG_VIDEO_RENESAS_VSP1)
> in drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h to fix this error.

Looks like you're also missing an EXPORT_SYMBOL_GPL(rzg2l_du_vsp_enable)?

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
