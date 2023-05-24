Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C490470F6E3
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 14:49:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5F3010E0F5;
	Wed, 24 May 2023 12:49:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6683A10E090
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 12:49:25 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-5343c3daff0so205554a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 05:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684932564; x=1687524564;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B5bYhjesjBsxjaSysPkMJO99V3Ea7SCjBnlff9eYvbY=;
 b=onTMlDek1lsDHY/2PJKI0VAWe+DU8HN6eSloXlvlqwTOous0g0QLPwn3hDQQI13yAD
 HIM1jV0JJBftM+cgQnxKAQzOEODn3sFJAKAISIqWccqw2aglhzDolTqJ6pTo6j5vgl19
 FpcndoobY7T6vaOan8xI23GbfLlgv0yr/3Dt4B9w0vPH1ARv8fgpSDNjoMj43KFrj3u/
 sqodjWtr8pmA3VPhx9aXCCeh5+0B9yQ2PLUmsBCaE1pYym3g+G4YpAbeLlTJicHKQDIm
 XZX8e2AEQeEvsZFGb+7nabvZ0s0YF/krrDZQ0KzhrIZkBgd8dZit16/ib9GnHKn03IrR
 pn+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684932564; x=1687524564;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B5bYhjesjBsxjaSysPkMJO99V3Ea7SCjBnlff9eYvbY=;
 b=Wg2DkgMR9XlBzC3ZCfLZdV19cVSHg2gwDhuP/UhDBpK4XCDBB6GwOegAcK0a8gx4i1
 8OyHnQJW0IbBEsI6i4iL9vlT7wJdQUu1UDoTtKpmbJGQAbnG3bszfG1sWYFE4Y/Xygl2
 y+RIsBLnO/TRseFiJEZl1sozhgfUhq9IRJdNf4Jw1DyMO3MKVhNe3MYzlp/CFtHZBoVi
 vd/z/wZT4XWqojn4NqBp+EimI/Ar2lYXF8WpJpY3Bo7AQCeSqIO0H8ysUDYmJLaPuLwv
 pxPQYuoKE5tQJQ8wf31/Qi1ex2eHxhiKYzAu9UIkbm3qLY+WHNSEHdGoJZ5rtGhO/FwH
 E+IQ==
X-Gm-Message-State: AC+VfDyjAE0nupaHvO+apOUrb68/Gw01ERlugd9Ne9NcpHEOI7yOR5x4
 sQrjbMQmFaIjX3rhvZF+q2ZfrUMrju6hMc0UEw4=
X-Google-Smtp-Source: ACHHUZ5ItBNeHc1mocu63gt5yO5aEXFbBG2651LJcmnhZbL0sPpUsAqGOTVsQB5ww5tjO15bfmfDwMX/ev2ULfHLdSM=
X-Received: by 2002:a17:902:7008:b0:1ad:edbd:8547 with SMTP id
 y8-20020a170902700800b001adedbd8547mr15325761plk.15.1684932564214; Wed, 24
 May 2023 05:49:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230518230626.404068-1-aford173@gmail.com>
 <CAOMZO5DBefFuLWi39txu2RiU5vdHVx-0T48Fua6M5Y6Fr9PGNg@mail.gmail.com>
 <CAHCN7xLqmMPtnHTVbApyYxY2tx97oRjsk_51abdDcZkOJmA=Tw@mail.gmail.com>
 <CAHCN7xJTWqf_qfaZge4GpKuuzPE_OC-Kx7hBd_hFLOchH=Ef0g@mail.gmail.com>
 <CAOMZO5Csjx17kfkxN1xMLuCg+-J0v6rjiuvaK-ZktXO50ZTuSw@mail.gmail.com>
In-Reply-To: <CAOMZO5Csjx17kfkxN1xMLuCg+-J0v6rjiuvaK-ZktXO50ZTuSw@mail.gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Wed, 24 May 2023 07:49:12 -0500
Message-ID: <CAHCN7xL2GWLTwMttCha=b9_W0nE5aimCQ08YJFrCF5vNZUOL7Q@mail.gmail.com>
Subject: Re: [PATCH V7 0/6] drm: bridge: samsung-dsim: Support variable
 clocking
To: Fabio Estevam <festevam@gmail.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 aford@beaconembedded.com, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Jagan Teki <jagan@amarulasolutions.com>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 24, 2023 at 7:45=E2=80=AFAM Fabio Estevam <festevam@gmail.com> =
wrote:
>
> Hi Adam,
>
> On Tue, May 23, 2023 at 8:49=E2=80=AFPM Adam Ford <aford173@gmail.com> wr=
ote:
>
> > Inki,
> >
> > I haven't heard back from you on whether or not you want the bindings
> > patch to be included with me resending the series as V7 or if you're
> > OK with a single, stand-alone patch.
> > Will you let me know?  I have the patch standing by waiting for
> > instructions.  If you're not the right person to ask, please let me
> > know who the right person is.
>
> Neil has also been collecting samsung-dsim patches. Maybe he can clarify.

If it matters, my preference all along was to do the bindings as a
separate thing once the driver updates were merged into the tree.
Since the bindings can be done in different ways, I was hoping to have
a separate discussion on the right way to do the bindings. If they
need to be part of the series, I can do that.

adam
