Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5397C6C30D6
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 12:50:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EAC410E74C;
	Tue, 21 Mar 2023 11:50:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3666610E750
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 11:50:37 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id w9so58558282edc.3
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 04:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1679399435;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lPVYiXzT9dbLYK1oSztTxRZM3tyI2gYYtJcH+jETaDA=;
 b=hOlzn2u+CE80f3l6VrkaxBIGmOfn5MHAcB/2fN4MI9aUxvI3vglwPku9zgySZ+3eMI
 gl/7IGl7y6awGuFDRp4th+2aG9kEzuFm7QCUar9ayviTj46DqwGZ97blTt3gidHc+QHp
 h1T2f6OLtHF9C04wQvgN4jephp7LfKZuxVFng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679399435;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lPVYiXzT9dbLYK1oSztTxRZM3tyI2gYYtJcH+jETaDA=;
 b=xCh4meUwipACpx0oeUMqQWAR1Pwty9yHK2uD90I311TW9umbBpDl8UctBrk1VP/LMR
 3UUMzf2G/+LmI5hyIW8dnJBfQx/LwCENtpuxZaO26y1roCtli6RpaJblAhEkILEBOO12
 LJPzvX3SygFr975vYXU7gWx865OHvotXvO0/anm65dIUNkzJS7DSqjAAnHCQXjb6qjyQ
 wlkQ8fJBk5tk6zyWDklNSwWLmI37Y9n35lACcO/FxSbOeENWQ4qcsQBErgAwJAi0ykWx
 ooyRPkOcXJiZ3AaiUjkK+Kg277Aq6u3tutIQ/1WJTIQ5PNqzbXOXSw6oX1UZVyPRPaqP
 XXmQ==
X-Gm-Message-State: AO0yUKULAFIdUNKJ3xb1djrDrCNy5BUJTEnDz0KchGOZRmTT4CPE6Gzo
 OrmbwXklfKDHLZKtxTp+xLbSHaNrJkkI1vxMiMa6Iw==
X-Google-Smtp-Source: AK7set9cCby0Mo0NBNUDnFZ42Way5iQfxspBVrJSeOyxwJKI5+j2Iit/tMmDhBBsM/xsqOzuTOCGNJeXawQc3MkR+AM=
X-Received: by 2002:a50:9b4a:0:b0:4fc:fc86:5f76 with SMTP id
 a10-20020a509b4a000000b004fcfc865f76mr1473349edj.6.1679399435637; Tue, 21 Mar
 2023 04:50:35 -0700 (PDT)
MIME-Version: 1.0
References: <CAOf5uwkDb=pkEV_qSshA7PnSxCV82sEwrmivAZhth48ae0S++g@mail.gmail.com>
 <87ileu8jwh.fsf@intel.com>
 <CAOf5uw=g1mU1F=kD6M472LRaTWa2B=Sry4GDGXxDApoZknLfeA@mail.gmail.com>
 <87cz528hzk.fsf@intel.com>
 <CAPj87rPPA9oYkZyQ=Y3MRuyJUN71WHDWHpdaRUvuXAxFSLW5SA@mail.gmail.com>
In-Reply-To: <CAPj87rPPA9oYkZyQ=Y3MRuyJUN71WHDWHpdaRUvuXAxFSLW5SA@mail.gmail.com>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Tue, 21 Mar 2023 12:50:24 +0100
Message-ID: <CAOf5uw=wkvXGkjpGZe366OnwwqiHgYiNNrwQeb4pfQxdoKWNKw@mail.gmail.com>
Subject: Re: display band (display area vs real visible area)
To: Daniel Stone <daniel@fooishbar.org>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel

On Tue, Mar 21, 2023 at 12:49=E2=80=AFPM Daniel Stone <daniel@fooishbar.org=
> wrote:
>
> Hi,
>
> On Tue, 21 Mar 2023 at 11:24, Jani Nikula <jani.nikula@linux.intel.com> w=
rote:
> > On Tue, 21 Mar 2023, Michael Nazzareno Trimarchi <michael@amarulasoluti=
ons.com> wrote:
> > > On Tue, Mar 21, 2023 at 11:43=E2=80=AFAM Jani Nikula
> > > <jani.nikula@linux.intel.com> wrote:
> > >> On Tue, 21 Mar 2023, Michael Nazzareno Trimarchi <michael@amarulasol=
utions.com> wrote:
> > >> > I would like to know the best approach in the graphics subsystem h=
ow
> > >> > deal with panels where the display area is different from the visi=
ble
> > >> > area because the display has a band left and right. I have already
> > >> > done the drm driver for the panel but from userspace point of view
> > >> > it's a pain to deal in wayland for input device and output device.=
 Do
> > >> > you have any suggestions?
> > >>
> > >> Do you have the EDID for the panel?
> > >
> > > mipi->panel so should not have edid
> >
> > That's the kind of information you'd expect in the original question. ;=
)
> >
> > I've done that sort of thing in the past, but not sure if it would fly
> > upstream. Basically the kernel driver would lie about the resolution to
> > userspace, and handle the centering and the bands internally. In my
> > case, the DSI command mode panel in question had commands to set the
> > visible area, so the driver didn't have to do all that much extra to
> > make it happen.
>
> There have been some threads - mostly motivated by MacBooks and the
> Asahi team - about creating a KMS property to express invisible areas.
> This would be the same thing, and the userspace ecosystem will pick it
> up when the kernel exposes it.
>
> Cheers,
> Daniel

Any thread or patches?

Michael
