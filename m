Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 671118A98BF
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 13:38:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B880F10E358;
	Thu, 18 Apr 2024 11:38:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="ZeSQ8WA+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22F3210EAA8
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 11:38:12 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-617ddc988f5so7396227b3.2
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 04:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1713440291; x=1714045091;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yPdetuRBjXUV0x/T5+LWombu6Cj3dX6RWAGOI9ScLmc=;
 b=ZeSQ8WA+B4bRFXGVMkBN3RwpP+Z5d4aFkTWpl2BOYexZkMl3vwSwj8iELACpb54bPk
 PTKFJYddyjLMrv7HspQWX+KH/fxP9yncYxqr8iQrWxAvljsg24+dOjRPB1FKOHftq6hx
 iPEMG1zh218ilUzuBd/Is+LHH18bf3CCt4g+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713440291; x=1714045091;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yPdetuRBjXUV0x/T5+LWombu6Cj3dX6RWAGOI9ScLmc=;
 b=D6PLmO+zaSnEYGTBj2EjVBCCNTmMOnu9Srz4VpLQMqBuf4vbaSaJnZtB+HP+ORPOCO
 8UN775Up9WW3/rAH2QzTuWWWC+1vFd81cZ/2bPc29xmtlMl6LatjLSfMyWvszRGFZzdw
 id/S3G/zqabqR4PNM53lB8MZ63x9ulfVMQG3eY0UmByol/u08ToeKl616tdKTHiU8uar
 4aYYTbQIhXCE4QiqhNVPdqkJMD9hSMPBrKeZf8UbYKqrBD6g9d0CXsA8gvToNpwNJsq6
 GEHYrz8yueoPhvJXKlfjBrX3LFrUtgki5Kl/gvdEzPLFKFm6LB2pIOVQVo6GGFJvHRdY
 bVzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzfUotiXZjxrAt/TrQCiBEcYWx0uykcna7KWzuueznSsGk4KYdDReF8OmgaO7KdgHLqbCbw/fBMvodRF/dyUsoKqMcdZm32ymr+tKrVtSz
X-Gm-Message-State: AOJu0Yycrd3yqWICdnAnTC+yNoqlsHiCh9AFJtI8vUedXwbQlEeGKhK8
 tKhRKt+Ic0gYj/0H2t6PqqfSZct3X1NUfsC2fqCPaKpQDhpAytwRmofppOzUDcQP6j4+2O7LSI6
 3ThDoVPXF0GYxLRiZVKWETbPbAQHQZpjdsqv/
X-Google-Smtp-Source: AGHT+IHTuymQ0vgyDlw5dewCasXVGfKomv0l6oG6Wss9goffKnGy27+0iGN2IAupwVsZY/T8ZT6sq+P7rk7bBO337k0=
X-Received: by 2002:a05:690c:700a:b0:61a:b0bc:934c with SMTP id
 jf10-20020a05690c700a00b0061ab0bc934cmr2704594ywb.3.1713440290952; Thu, 18
 Apr 2024 04:38:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240408155605.1398631-1-zack.rusin@broadcom.com>
 <843fdfa2-348b-410e-8ff1-84ab86cac17d@amd.com>
 <CABQX2QMtTB9iiQuce36dnk6eO1Xcsm+Xt3vc1Nk93TGD+TtV9w@mail.gmail.com>
 <5ca415e9-fb3e-4d81-b385-71e8780a1399@amd.com>
 <CABQX2QMaF6e6o4Ewg6sExfaEZMXRaUrNHNYUCAYG3+44P=7epQ@mail.gmail.com>
In-Reply-To: <CABQX2QMaF6e6o4Ewg6sExfaEZMXRaUrNHNYUCAYG3+44P=7epQ@mail.gmail.com>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Thu, 18 Apr 2024 07:38:00 -0400
Message-ID: <CABQX2QNbbM-frtkVwYWZytUAqP0t0gyyd_tZc_s0bDxu+MaFUg@mail.gmail.com>
Subject: Re: [PATCH] drm/ttm: Print the memory decryption status just once
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 dri-devel@lists.freedesktop.org
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, 
 Ian Forbes <ian.forbes@broadcom.com>,
 Martin Krastev <martin.krastev@broadcom.com>, 
 Maaz Mombasawala <maaz.mombasawala@broadcom.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
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

Ping on this one. If we don't want the "_once" then I can quickly
prepare a patch that just removes the logging altogether, because
while useful it's polluting up the kernel logs too much right now so
getting a fix in for 6.9 for this would be great.

z

On Mon, Apr 8, 2024 at 1:46=E2=80=AFPM Zack Rusin <zack.rusin@broadcom.com>=
 wrote:
>
> Sorry, apologies to everyone. By accident I replied off the list.
> Redoing it now on the list. More below.
>
> On Mon, Apr 8, 2024 at 12:10=E2=80=AFPM Christian K=C3=B6nig
> <christian.koenig@amd.com> wrote:
> >
> > Am 08.04.24 um 18:04 schrieb Zack Rusin:
> > > On Mon, Apr 8, 2024 at 11:59=E2=80=AFAM Christian K=C3=B6nig
> > > <christian.koenig@amd.com> wrote:
> > >> Am 08.04.24 um 17:56 schrieb Zack Rusin:
> > >>> Stop printing the TT memory decryption status info each time tt is =
created
> > >>> and instead print it just once.
> > >>>
> > >>> Reduces the spam in the system logs when running guests with SEV en=
abled.
> > >> Do we then really need this in the first place?
> > > Thomas asked for it just to have an indication when those paths are
> > > being used because they could potentially break things pretty bad. I
> > > think it is useful knowing that those paths are hit (but only once).
> > > It makes it pretty easy for me to tell whether bug reports with peopl=
e
> > > who report black screen can be answered with "the kernel needs to be
> > > upgraded" ;)
> >
> > Sounds reasonable, but my expectation was rather that we would print
> > something on the device level.
> >
> > If that's not feasible for whatever reason than printing it once works
> > as well of course.
>
> TBH, I think it's pretty convenient to have the drm_info in the TT
> just to make sure that when drivers request use_dma_alloc on SEV
> systems TT turns decryption on correctly, i.e. it's a nice sanity
> check when reading the logs. But if you'd prefer it in the driver I
> can move this logic there as well.
>
> z
