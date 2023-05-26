Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E84D711E52
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 05:10:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7171610E79A;
	Fri, 26 May 2023 03:09:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5926610E79A
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 03:09:54 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-64a9335a8e7so1256431b3a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 25 May 2023 20:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685070593; x=1687662593;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8+WI7Z+fFUvAEo5FkMRnZUO/pj1xsf6MM2SkfBdHuzY=;
 b=YQdlarf9r1DRtZZVDCUrH7oadI+z+IR3NfI8l2Hd5qSK8BvL4RWUTOklOKDoG5yuPv
 9sw46fzNFZpjgqOZWmiM9zntaenoGIhj7whgVfMS0ucSkOh9GtGFkjaScGK3hrpEKWl9
 sjItsbeFX3l2gVMjTkiR2p6pFIYJs/oHf7qmMQGwkZ0Kn2cUFFJDhzTG4ZAOW0X1NqF+
 Fl2QHNBRJAUK865k0c7wmpsU4FA9DF7srC+nXVwXIp/7cMsuFzvcVeTEl4Svxh+eTKlt
 CCn4/3g2ixlgl1Ylb+g9vBp1KFRSmDWKECS7/2JEWn0o+ywdhI8UeMu798GgmlUwCl+M
 52/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685070593; x=1687662593;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8+WI7Z+fFUvAEo5FkMRnZUO/pj1xsf6MM2SkfBdHuzY=;
 b=OpHLFc5oKQiV4WnSmh5SX6ivQgV+fyrQSbDrPixiibyeA/yoPHovRHrXSEyHL0qM49
 CqWfGrzCgEELpZc3ftKiml2cdRZZKrfqkiqEstHPzRQXRC4PK2BO9Bza4Wx0hXmkcKKX
 nrz5JqiBSgRUoaos4alCp+PCKYv71GBHFVvChkvyMPotDyMQmjkDKkBDd1ZFA+rAZild
 d0WqzDfAxIwsdoPVd81/19DL5FEz6N/dDxPdz9Om/06rzQ/Tkra3rqqp4zCiU/jgKjzA
 +0igM6NfWi3x4qSDDiIOtXx4QgqnN0aqW76sTfIF6vAeEpxHijdwQZ9UJ1q6uV25e8mr
 YEdw==
X-Gm-Message-State: AC+VfDwEzR53jzJhG83e3vDTcg+DpDyAbQPGKxJ6k920DB8CORaI0nIy
 YOQI7aBt94FMOUFzNwphli3w+O4Jo+omWEa8zE6HxKSv
X-Google-Smtp-Source: ACHHUZ4RH3fco+TNyTCnAnqPBsNEzHPi9vD/mqMDrzVwAxoIi3azNCxh0oQRlYGIbWnZr2qVAQnSKuBVjSZDfjg+KOU=
X-Received: by 2002:a17:903:2445:b0:1ae:ce9:f391 with SMTP id
 l5-20020a170903244500b001ae0ce9f391mr4739089pls.4.1685070593342; Thu, 25 May
 2023 20:09:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230518230626.404068-1-aford173@gmail.com>
 <CAOMZO5DBefFuLWi39txu2RiU5vdHVx-0T48Fua6M5Y6Fr9PGNg@mail.gmail.com>
 <CAHCN7xLqmMPtnHTVbApyYxY2tx97oRjsk_51abdDcZkOJmA=Tw@mail.gmail.com>
 <CAHCN7xJTWqf_qfaZge4GpKuuzPE_OC-Kx7hBd_hFLOchH=Ef0g@mail.gmail.com>
 <CAOMZO5Csjx17kfkxN1xMLuCg+-J0v6rjiuvaK-ZktXO50ZTuSw@mail.gmail.com>
 <CAHCN7xL2GWLTwMttCha=b9_W0nE5aimCQ08YJFrCF5vNZUOL7Q@mail.gmail.com>
 <8c65c5c3-0415-78c0-4585-df94a532a04e@linaro.org>
 <CAHCN7xJBf+8KyXbqxVSUUXbKqomX+i-13Ed23QFeF0SM8nQpzw@mail.gmail.com>
 <8f50dc2c-4d74-6c0f-87bc-b96bbf1373a9@linaro.org>
 <bef20993-b831-b692-237e-b1e89ac4f34b@linaro.org>
In-Reply-To: <bef20993-b831-b692-237e-b1e89ac4f34b@linaro.org>
From: Adam Ford <aford173@gmail.com>
Date: Thu, 25 May 2023 22:09:40 -0500
Message-ID: <CAHCN7xLizrHuc-Lc=gP=2RpHtV6SwA+5YxeZG4nL6sWa+rywCA@mail.gmail.com>
Subject: Re: [PATCH V7 0/6] drm: bridge: samsung-dsim: Support variable
 clocking
To: neil.armstrong@linaro.org
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
Cc: Jagan Teki <jagan@amarulasolutions.com>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 aford@beaconembedded.com, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 25, 2023 at 11:19=E2=80=AFAM Neil Armstrong
<neil.armstrong@linaro.org> wrote:
>
> On 25/05/2023 18:15, neil.armstrong@linaro.org wrote:
> > On 25/05/2023 17:57, Adam Ford wrote:
> >> On Thu, May 25, 2023 at 10:39=E2=80=AFAM Neil Armstrong
> >> <neil.armstrong@linaro.org> wrote:
> >>>
> >>> On 24/05/2023 14:49, Adam Ford wrote:
> >>>> On Wed, May 24, 2023 at 7:45=E2=80=AFAM Fabio Estevam <festevam@gmai=
l.com> wrote:
> >>>>>
> >>>>> Hi Adam,
> >>>>>
> >>>>> On Tue, May 23, 2023 at 8:49=E2=80=AFPM Adam Ford <aford173@gmail.c=
om> wrote:
> >>>>>
> >>>>>> Inki,
> >>>>>>
> >>>>>> I haven't heard back from you on whether or not you want the bindi=
ngs
> >>>>>> patch to be included with me resending the series as V7 or if you'=
re
> >>>>>> OK with a single, stand-alone patch.
> >>>>>> Will you let me know?  I have the patch standing by waiting for
> >>>>>> instructions.  If you're not the right person to ask, please let m=
e
> >>>>>> know who the right person is.
> >>>>>
> >>>>> Neil has also been collecting samsung-dsim patches. Maybe he can cl=
arify.
> >>>>
> >>>> If it matters, my preference all along was to do the bindings as a
> >>>> separate thing once the driver updates were merged into the tree.
> >>>> Since the bindings can be done in different ways, I was hoping to ha=
ve
> >>>> a separate discussion on the right way to do the bindings. If they
> >>>> need to be part of the series, I can do that.
> >>>
> >>> If you don't introduce compatibles, no need to send bindings, it can
> >>> be send separately.
> >>
> >> This series doesn't change any compatibility.
> >>
> >>>
> >>> Can I apply this serie and 20230503163313.2640898-2-frieder@fris.de ?=
 seems all has been reviewed.
> >>
> >> Looking at the driver, it looks like linux-next has some newer
> >> features added into the driver since I started, so this series might
> >> need a re-base.  If that's the case, let me know, and I'll do the
> >> re-base.
> >
> > Ok I'll pull the other bits and let you know if this one needs a rebase=
.
>
> Indeed, starting at patch 3 it fails to apply, a rebase on drm-misc-next =
is welcome!

Neil,

I rebased and I added the dt-bindings as an additional patch to the
series.  If people are unhappy with the bindings, I am hoping you can
apply the first 6 since they don't seem to break any backwards
compatibility, and we can discuss the bindings separately if
necessary.

adam

>
> Neil
>
> >
> > Neil
> >
> >>
> >> adam
> >>
> >>>
> >>> Neil
> >>>
> >>>>
> >>>> adam
> >>>
> >
>
