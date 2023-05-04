Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6286F7323
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 21:22:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A64010E184;
	Thu,  4 May 2023 19:22:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7428610E184
 for <dri-devel@lists.freedesktop.org>; Thu,  4 May 2023 19:22:01 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1a950b982d4so457925ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 04 May 2023 12:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1683228120; x=1685820120;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tVeOmg3xdSp7Uw5iyCm8zM5Dz5FyKSpYKnmTGjHt5Og=;
 b=VBFPVDSC0c4rxWO4idhpCMlzoMP104ludumoYHtf979EhJL0NYKQKPtZnZ4VoiNdg3
 mObKrynBwa2GYQ8x1CdpPjYY7yYtk7G0pehHkjaSqcIkoUfodu25o36Hd4qKdYY8OzCv
 wPyzO9c7X8dI8pcQo957XHnT4phWgBIckCmoTN3pK3zvpqNv10hiIS/gtbpm6vGoFfnX
 nZLTl4/NjJHR0CQxytaExT7uHd7TT52JURX9IgikJhf2kNg00H/Wot7oMeAECXVr69Wh
 SoGYAg+Eh7uw7a92eNmFk3wAGvz47GLKWN3Lt1HWhmPvghEK+w6gYH71cuK//Xb1Dqmi
 HDMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683228120; x=1685820120;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tVeOmg3xdSp7Uw5iyCm8zM5Dz5FyKSpYKnmTGjHt5Og=;
 b=b7tBqCnRhWVJRODZDEJ7+IGryVW2zYRdBnGVpYdINEC44j1VVgmgFetrOayg6IkIHM
 T5IvbmJ9zGK7WJG6hmOIkUs17p/zraVzUPXOOs8PRzuJMAYJc5X7L9hhIxosXDwlBMtb
 vHZi291soBx/f2EkPh5vXxF2xwiiG8XLQCNYyQD9VOO6AHj1bSJh9gz1Lcz+k30qywXP
 YcfWoukyybgR9RGKhgjZX6TemFUZefwc47AubWkfe5PP4QmSk64lpF9aVr1qWBQP5b8O
 XZxEUJ5PKgSGCqih4iSc++Li6CmJNoK0jYQitngKv14B7y0y2jZZVxx68hEtUT83jOyE
 rBkw==
X-Gm-Message-State: AC+VfDw4Ojb4o2PTW99BNwTynfFkcyA/wvq4i4i2uJLDVKczMEluXpsY
 VS08yz+peDl+C9f1YjGtXmkW1acpFdjnpv1x185/jg==
X-Google-Smtp-Source: ACHHUZ6uUxIDYifA/bh2RT8YQ5MNPwejTUWlOc93oIZLrxzI8RScUNDCnY1oAJur7+Djc/gO0llDoKdzJd/lv/zh45Q=
X-Received: by 2002:a17:902:d2cd:b0:1a9:3251:e3ae with SMTP id
 n13-20020a170902d2cd00b001a93251e3aemr27268plc.3.1683228120488; Thu, 04 May
 2023 12:22:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230310063910.2474472-1-saravanak@google.com>
 <4737cacc741c939ca1d980a4858d0748faad11f8.camel@puri.sm>
 <CAGETcx_0NaSTFFn34nvax2_pG+_5BJtOD0j0wrqU0NSCqwfKWA@mail.gmail.com>
 <CAGETcx-CF83Acp5CQ=RMJq9DD6f_Y70c37zSbLq2R6L5VyoKHg@mail.gmail.com>
 <nlycqgae2r3urwh536hyklyutmdzdoz3ssabcjqdfoxlqlbjln@5u5dr552albo>
In-Reply-To: <nlycqgae2r3urwh536hyklyutmdzdoz3ssabcjqdfoxlqlbjln@5u5dr552albo>
From: Saravana Kannan <saravanak@google.com>
Date: Thu, 4 May 2023 12:21:24 -0700
Message-ID: <CAGETcx9DnHUZa8986Mueu2O5s-Euvy5bJJSdRbLv0Og92PdKvA@mail.gmail.com>
Subject: Re: [PATCH v1] drm/mipi-dsi: Set the fwnode for mipi_dsi_device
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Martin Kepplinger <martin.kepplinger@puri.sm>, kernel-team@android.com,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Thierry Reding <treding@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 4, 2023 at 12:51=E2=80=AFAM Maxime Ripard <maxime@cerno.tech> w=
rote:
>
> Hi Saravana,
>
> On Wed, May 03, 2023 at 09:40:05PM -0700, Saravana Kannan wrote:
> > On Fri, Mar 17, 2023 at 3:36=E2=80=AFPM Saravana Kannan <saravanak@goog=
le.com> wrote:
> > >
> > > On Sun, Mar 12, 2023 at 7:45=E2=80=AFAM Martin Kepplinger
> > > <martin.kepplinger@puri.sm> wrote:
> > > >
> > > > Am Donnerstag, dem 09.03.2023 um 22:39 -0800 schrieb Saravana Kanna=
n:
> > > > > After commit 3fb16866b51d ("driver core: fw_devlink: Make cycle
> > > > > detection more robust"), fw_devlink prints an error when consumer
> > > > > devices don't have their fwnode set. This used to be ignored
> > > > > silently.
> > > > >
> > > > > Set the fwnode mipi_dsi_device so fw_devlink can find them and
> > > > > properly
> > > > > track their dependencies.
> > > > >
> > > > > This fixes errors like this:
> > > > > [    0.334054] nwl-dsi 30a00000.mipi-dsi: Failed to create device
> > > > > link with regulator-lcd-1v8
> > > > > [    0.346964] nwl-dsi 30a00000.mipi-dsi: Failed to create device
> > > > > link with backlight-dsi
> > > > >
> > > > > Reported-by: Martin Kepplinger <martin.kepplinger@puri.sm>
> > > >
> > > > Reported-and-tested-by: Martin Kepplinger <martin.kepplinger@puri.s=
m>
> > >
> > > Maintainers,
> > >
> > > Nudge nudge. Will this be picked up for 6.3-rcX?
> >
> > Greg,
> >
> > Can you pick this up please? It's a fix that hasn't been picked up for
> > a few months.
> >
> > Here's the link to the actual patch for your convenience:
> > https://lore.kernel.org/lkml/20230310063910.2474472-1-saravanak@google.=
com/#t
>
> Sorry, I'm not quite sure what happened. I've applied it to drm-misc-fixe=
s

No worries. Thanks Maxime!

-Saravana
