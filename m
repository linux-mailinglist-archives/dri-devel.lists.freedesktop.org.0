Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B5E78FCEB
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 14:08:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FFCD10E7A9;
	Fri,  1 Sep 2023 12:08:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
 [209.85.167.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FC3C10E7A3
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 12:08:24 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id
 5614622812f47-3a99eeb95aaso1154586b6e.2
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Sep 2023 05:08:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693570103; x=1694174903;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j0eLku2x7Gqxfah9HHr3k8QumPRfxLwdATDwnW94z94=;
 b=HTXdh1f+mWOj6xyBYZOvis4rj7onZrywJWfykbaSuhvH9FGW2iIRAR+jjPFm91HATW
 Ubu2Kwi2yYj9kuGfwH+4oANGCzTM4QNaMetRip6OzOydSnd/mekJdWo7d/y4Bt1wks7q
 sETa8dguW7IgRbT8JM7Ic2uZzSbl7qv4+1oDLxmZIqMGu7jh4v0xiQKqrJpkGPq3/2pL
 9oQwm7OZHPSIqufqYUW71FAZMorVVv5M2n3mGLi9qz0tlXe9+qvad4pq6WaKsodxNUIT
 kpZ6fatpO6qnWUi07Xh5IrTaWKwQDOYOgSirAW7b00XO2iqsXI81GFBqb6Sqo3q6/m7b
 pHwg==
X-Gm-Message-State: AOJu0YyANFN1BgabI+2mqCfNhC1JF8z7BSJVuvlt9jDj9sah+vnoaCf3
 htBOaCV77IFLz9IhBXxpvdQFU7UxkUTfkA==
X-Google-Smtp-Source: AGHT+IG7DmbgAVY6SgJfLEjRPxqhciHM/u3GydTHZ0x58U+1H/IMD9GzbLCU+sCCBWp/dvlet8bBKg==
X-Received: by 2002:a05:6808:2201:b0:3a7:5d7a:1bdd with SMTP id
 bd1-20020a056808220100b003a75d7a1bddmr3170717oib.19.1693570103515; 
 Fri, 01 Sep 2023 05:08:23 -0700 (PDT)
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com.
 [209.85.161.53]) by smtp.gmail.com with ESMTPSA id
 s8-20020a05680810c800b003a1d29f0549sm1862202ois.15.2023.09.01.05.08.22
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Sep 2023 05:08:23 -0700 (PDT)
Received: by mail-oo1-f53.google.com with SMTP id
 006d021491bc7-573675e6b43so1185515eaf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Sep 2023 05:08:22 -0700 (PDT)
X-Received: by 2002:a05:6358:7e53:b0:139:b4c0:93c with SMTP id
 p19-20020a0563587e5300b00139b4c0093cmr2780839rwm.5.1693570102753; Fri, 01 Sep
 2023 05:08:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230830062546.720679-1-javierm@redhat.com>
 <zitno3p7tbnld5auedkx5g4wey2csng4ncmtdhzinbuhblunyk@chnwsnsgq36v>
 <CAMuHMdWv_QSatDgihr8=2SXHhvp=icNxumZcZOPwT9Q_QiogNQ@mail.gmail.com>
 <4zfgmvfstyjfo5slggfmfuvnirrhrq773el52gkav2r6jxliub@7qjbyy7rkj3g>
In-Reply-To: <4zfgmvfstyjfo5slggfmfuvnirrhrq773el52gkav2r6jxliub@7qjbyy7rkj3g>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 1 Sep 2023 14:08:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV_775mPbTgWmzCo4mKCd3kqL=vfVFrt2W=bR3uveNW_Q@mail.gmail.com>
Message-ID: <CAMuHMdV_775mPbTgWmzCo4mKCd3kqL=vfVFrt2W=bR3uveNW_Q@mail.gmail.com>
Subject: Re: [RFC PATCH] drm/ssd130x: Allocate buffer in the CRTC's
 .atomic_check() callback
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

On Fri, Sep 1, 2023 at 2:00=E2=80=AFPM Maxime Ripard <mripard@kernel.org> w=
rote:
> On Fri, Sep 01, 2023 at 10:36:17AM +0200, Geert Uytterhoeven wrote:
> > On Fri, Sep 1, 2023 at 10:22=E2=80=AFAM Maxime Ripard <mripard@kernel.o=
rg> wrote:
> > > On Wed, Aug 30, 2023 at 08:25:08AM +0200, Javier Martinez Canillas wr=
ote:
> > > > The commit 45b58669e532 ("drm/ssd130x: Allocate buffer in the plane=
's
> > > > .atomic_check() callback") moved the allocation of the intermediate=
 and
> > > > HW buffers from the encoder's .atomic_enable callback to primary pl=
ane's
> > > > .atomic_check callback.
> > > >
> > > > This was suggested by Maxime Ripard because drivers aren't allowed =
to fail
> > > > after drm_atomic_helper_swap_state() has been called, and the encod=
er's
> > > > .atomic_enable happens after the new atomic state has been swapped.
> > > >
> > > > But that change caused a performance regression in very slow platfo=
rms,
> > > > since now the allocation happens for every plane's atomic state com=
mit.
> > > > For example, Geert Uytterhoeven reports that is the case on a VexRi=
scV
> > > > softcore (RISC-V CPU implementation on an FPGA).
> > >
> > > I'd like to have numbers on that. It's a bit surprising to me that,
> > > given how many objects we already allocate during a commit, two small
> > > additional allocations affect performances so dramatically, even on a
> > > slow platform.
> >
> > To be fair, I didn't benchmark that.  Perhaps it's just too slow due to
> > all these other allocations (and whatever else happens).
> >
> > I just find it extremely silly to allocate a buffer over and over again=
,
> > while we know that buffer is needed for each and every display update.
>
> Maybe it's silly, but I guess it depends on what you want to optimize
> for. You won't know the size of that buffer before you're in
> atomic_check. So it's a different trade-off than you would like, but I
> wouldn't call it extremely silly.

The size of ssd130x_plane_state.data_array[] is fixed, and depends
on the actual display connected.
The size of ssd130x_plane_state.buffer[]  is also fixed, and depends
on the plane's size (which is currently fixed to the display size).

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
