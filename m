Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE746DD858
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 12:53:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83B8510E2BA;
	Tue, 11 Apr 2023 10:53:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC5C010E2BA;
 Tue, 11 Apr 2023 10:53:41 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-54ee9ad5eb3so145666607b3.1; 
 Tue, 11 Apr 2023 03:53:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681210420;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zMZXbjYPoB8bF3eM0jBoFIas3yC6vYWDoi6gxtxj/GU=;
 b=kMF0U+C+LkxxFCiaNGCtMm8pAuSCrispI7/ubiHoL5i97fOcm6+YFHZcZcwREb4Jt3
 WLwEUWaFsrjMRqMYA7ZMXC4LUQwlh7g477ZdV/DYSpaOtzmCVWWnWc3VcxwIFDrUnF8I
 R9xF16log+nfn44E3WvsM1pb70lpMt2eQmhDRwY1hV7uoQIMQK87YrzzbUxCDEHbHLl5
 bWsh/BUMCw/UGwpFa3hZf7mi7fmVCMILvLDYk029N6S0YJPlJAV6OmWJoa+BEnxCWVOd
 osv/BD80wTH6EDLDd7rDBz+ItrXRgzFaPQfpz7/UeyjwINUv1nKs7bse8wSacRwuwXR5
 WXEw==
X-Gm-Message-State: AAQBX9dip+KSyE8V8HyVj+jQXM7O6U4+7MCdaX/0kl1xkB0GZuSubDAK
 iDfNYyjZY4jkh9m+hvHp3oz5O2q7hwhwgg==
X-Google-Smtp-Source: AKy350Z8SqIHt9QV3WaH5ue1eNycRmTp/xr7U5vRshyXrOXfSqjomCpumEShDT/Jy1OSJorIfxto2g==
X-Received: by 2002:a0d:cc0f:0:b0:54c:11e2:d32 with SMTP id
 o15-20020a0dcc0f000000b0054c11e20d32mr11011685ywd.27.1681210420341; 
 Tue, 11 Apr 2023 03:53:40 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com.
 [209.85.128.173]) by smtp.gmail.com with ESMTPSA id
 g135-20020a0ddd8d000000b0054f0349073esm1611816ywe.62.2023.04.11.03.53.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Apr 2023 03:53:39 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-54c061acbc9so290168427b3.11; 
 Tue, 11 Apr 2023 03:53:39 -0700 (PDT)
X-Received: by 2002:a81:e401:0:b0:54c:19a6:480 with SMTP id
 r1-20020a81e401000000b0054c19a60480mr7419834ywl.4.1681210418913; Tue, 11 Apr
 2023 03:53:38 -0700 (PDT)
MIME-Version: 1.0
References: <50439958420f91cc97ad929437334bfb19ca4d90.1681208396.git.geert+renesas@glider.be>
 <fd7c23298f2c62db85abc9114d12059ef5e5f330.1681208396.git.geert+renesas@glider.be>
 <CAB9dFds_C9hfwW+YBMbF8sakUwVXm4etVPSAXgXQpKMeTA9+yA@mail.gmail.com>
In-Reply-To: <CAB9dFds_C9hfwW+YBMbF8sakUwVXm4etVPSAXgXQpKMeTA9+yA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Apr 2023 12:53:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV14YpXgHf+a8RgJSFgBWh2QiwAVmOTJRs=_=4om83CuA@mail.gmail.com>
Message-ID: <CAMuHMdV14YpXgHf+a8RgJSFgBWh2QiwAVmOTJRs=_=4om83CuA@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm: Spelling s/randevouz/rendez-vouz/
To: Marc Dionne <marc.c.dionne@gmail.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Xinhui <Xinhui.Pan@amd.com>, Pan@rox.of.borg, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marc,

On Tue, Apr 11, 2023 at 12:49=E2=80=AFPM Marc Dionne <marc.c.dionne@gmail.c=
om> wrote:
> On Tue, Apr 11, 2023 at 7:44=E2=80=AFAM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
> >
> > Fix a misspelling of "rendez-vouz".
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> > --- a/include/drm/task_barrier.h
> > +++ b/include/drm/task_barrier.h
> > @@ -24,7 +24,7 @@
> >  #include <linux/atomic.h>
> >
> >  /*
> > - * Reusable 2 PHASE task barrier (randevouz point) implementation for =
N tasks.
> > + * Reusable 2 PHASE task barrier (rendez-vouz point) implementation fo=
r N tasks.
> >   * Based on the Little book of semaphores - https://greenteapress.com/=
wp/semaphores/
> >   */
> >
> > --
> > 2.34.1
>
> Sorry for the drive by comment, but shouldn't this be "rendez-vous"
> (with an 's' rather than a 'z')?

Yes it should. Thanks!

/me hides in a brown paper bag, under a rock...

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
