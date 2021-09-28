Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5B241AA36
	for <lists+dri-devel@lfdr.de>; Tue, 28 Sep 2021 09:58:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E91536E0DC;
	Tue, 28 Sep 2021 07:58:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72E7D6E0DC
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 07:58:02 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id m3so89246750lfu.2
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 00:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=gy9mKM0azORkp6POsmIPhCDhcWyTMEDjZX/tq4OmNvo=;
 b=oJNaIZ0VUnSUOPva53QBlwdUmanMINGepTO3sTZ8UEZm+MKsG8GsFosjIS7+steVY1
 HaO2jSVEvi9g6HPbdEPqNUJ8Zj3ZIjHlqD5YargEFMpR9jPXSff5Oc11Hx48TC9LPKt9
 6i9tuElrvZIp04sadutYo27zNJPiRzS+jO6XzMS9Mg5u2gksUSQln6zVHFfM+rbP1i/K
 /zh0/nMmti0vDhHLB7JfqfWs0pJBur77y2VB1p8uaXfw7+ycK8lkQ4yqdDhmOMPmXrPU
 0QXagudEuEyDg7xEqODKWaH1q6ycHnkUAv94/gX9cDrN0AVnTlBkwxHy0t7uTNfh2/G7
 PwyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=gy9mKM0azORkp6POsmIPhCDhcWyTMEDjZX/tq4OmNvo=;
 b=ermWsQ1g1H01VyfPu3B5MvDlydl4++03Q5yK9jTc9hPHDzRKyljWojvPdK238vlUAq
 DN8i9l6DkPQssWzhw0HcjCEI+RgABOZkugTVItrQOUgVFmXQNmg3g7DNAs2psAyGc5B2
 wVg++6UJrmRvkTVs7huYbAU2QuHG/Oizsgyg1HGE5V2TQdf0Dy9v1AdphXDcMLB0Cc0V
 8lVkga76DGQSDtdAQEl1spCQDncAqlkXo+zDqaRu39hriT+MIC1l265QWVsS3FKwQ2Al
 8WvL1mZtxbIumCLp3Yna6XS5KiGsl2ScidNZ9PxKUZ3rbPSstS8fpfBdWa9hTzRvcAn/
 mmmw==
X-Gm-Message-State: AOAM533MzKs+z9nBuc9DJ8KN1o2S1ZVJnt4Ej0ua4iv48pwEIRvbtnTa
 5xdJSU3Uhi8nkAUNBKEDitw=
X-Google-Smtp-Source: ABdhPJxqc5qNYsVfhAn51diQTeao2B87L5JxiH41IVC2FeIsraw1CGuExY85dzQkC12kPdvsC0CaTg==
X-Received: by 2002:ac2:5583:: with SMTP id v3mr4301341lfg.142.1632815879316; 
 Tue, 28 Sep 2021 00:57:59 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id t26sm1839672lfp.173.2021.09.28.00.57.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 00:57:59 -0700 (PDT)
Date: Tue, 28 Sep 2021 10:57:46 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, "moderated list:DMA BUFFER
 SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>, Daniel Vetter
 <daniel@ffwll.ch>, Christian =?UTF-8?B?S8O2bmln?=
 <ckoenig.leichtzumerken@gmail.com>, Michel =?UTF-8?B?RMOkbnplcg==?=
 <michel@daenzer.net>, Rob Clark <robdclark@chromium.org>, Sumit Semwal
 <sumit.semwal@linaro.org>, Gustavo Padovan <gustavo@padovan.org>, Christian
 =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, "open list:SYNC FILE
 FRAMEWORK" <linux-media@vger.kernel.org>, open list
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 8/9] dma-buf/sync_file: Add SET_DEADLINE ioctl
Message-ID: <20210928105746.02304ece@eldfell>
In-Reply-To: <CAF6AEGudjfgN+x_KxyED+1XBod7yNqLN43or7vs8h7UKQmzK7Q@mail.gmail.com>
References: <20210903184806.1680887-1-robdclark@gmail.com>
 <20210903184806.1680887-9-robdclark@gmail.com>
 <20210927114201.1f8fdc17@eldfell>
 <CAF6AEGudjfgN+x_KxyED+1XBod7yNqLN43or7vs8h7UKQmzK7Q@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Rs768WPBICg6UtwLCHHF1rS";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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

--Sig_/Rs768WPBICg6UtwLCHHF1rS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 27 Sep 2021 07:36:05 -0700
Rob Clark <robdclark@gmail.com> wrote:

> On Mon, Sep 27, 2021 at 1:42 AM Pekka Paalanen <ppaalanen@gmail.com> wrot=
e:
> >
> > On Fri,  3 Sep 2021 11:47:59 -0700
> > Rob Clark <robdclark@gmail.com> wrote:
> > =20
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > The initial purpose is for igt tests, but this would also be useful f=
or
> > > compositors that wait until close to vblank deadline to make decisions
> > > about which frame to show.
> > >
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > ---
> > >  drivers/dma-buf/sync_file.c    | 19 +++++++++++++++++++
> > >  include/uapi/linux/sync_file.h | 20 ++++++++++++++++++++
> > >  2 files changed, 39 insertions(+)

...

> > > diff --git a/include/uapi/linux/sync_file.h b/include/uapi/linux/sync=
_file.h
> > > index ee2dcfb3d660..f67d4ffe7566 100644
> > > --- a/include/uapi/linux/sync_file.h
> > > +++ b/include/uapi/linux/sync_file.h
> > > @@ -67,6 +67,18 @@ struct sync_file_info {
> > >       __u64   sync_fence_info;
> > >  };
> > >
> > > +/**
> > > + * struct sync_set_deadline - set a deadline on a fence
> > > + * @tv_sec:  seconds elapsed since epoch
> > > + * @tv_nsec: nanoseconds elapsed since the time given by the tv_sec
> > > + * @pad:     must be zero =20
> >
> > Hi Rob,
> >
> > I think you need to specify which clock this timestamp must be in.
> >
> > Which epoch? Sounds a bit like CLOCK_REALTIME to me which would not
> > make sense. =20
>=20
> It should be monotonic.. same clock as is used for vblank timestamps,
> which I assume that would be the most straightforward thing for
> compositors to use

Yes, it would. Just need to document that. :-)


Thanks,
pq

--Sig_/Rs768WPBICg6UtwLCHHF1rS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmFSyvoACgkQI1/ltBGq
qqeyDg//TgGFseKo6XsdPl96lErZgm+vJZuY8rYpdTY7P6E0EsQ9Vtq3/++8mAIT
7t6mRK8jHVBS/bGQdEtBVnhMW2A63qSZTCPTjNmaAyhFfc0L866fU+QV7MJViv3U
h6G9sbm3dDiMo76ZdWjSTTLSmNcEiH1gk9mUSbRUZjDBC+uRcnyKy3scGAgrfV1H
9vllcGoKzjIiDnN1sAh9iNOj43bVOkMa4tyIUm26AQn72PJ3OH8EZDJrPmUdkt6P
gJl4Xp5p48igf7J4uJG1zUEKGfP9zEw7q8RBJluKTRKqh/dW9k+GXaeJbpmfwzS9
1mVm0NXvvXGSM8jrhZudaBzxY2QBrdQGk96OCzqO3sl92HD2H6FnYfNZekKrsY0t
ILXLeDGHTTEwzgtMHUTjdQS9lgSJvR6M0fC8oPytuxcObdBZFAxjXLoFNslyd6SH
WhP10nfpzFc3Rt4LOocO9XBJxGGuH6ZktfCKyrSkjN99dcAvHNnCTaNcPSjYcVqp
ViWPGJnsY5ggoItTL3aQBuTDA7AVtz/q7CJDMS5/cOzjg2Ro7JJSjs/q8ViUlIQ+
XUDYGHsJXrhrXQCp0EiySoAtWgcZuNO+K4wC6cPz9Umm/Lq6WD/C75XNYohrgE2c
pAT2Sit3CbAfa5Y4P3p1OObimLtUJo29BVLbT/D2CZ+gpKjZw5Q=
=g9NP
-----END PGP SIGNATURE-----

--Sig_/Rs768WPBICg6UtwLCHHF1rS--
