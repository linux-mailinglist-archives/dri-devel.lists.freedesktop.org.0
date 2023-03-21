Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5746C30CA
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 12:49:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6082C10E736;
	Tue, 21 Mar 2023 11:49:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6615710E736
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 11:49:25 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id c10so6195604qtj.10
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 04:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20210112.gappssmtp.com; s=20210112; t=1679399364;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BDnUWDZInDFnYugeSsid3+FHARtx+dmCtEpJDk/FNs0=;
 b=4QKSDae7TWBJB+5I5HO6oMY4wZUQ5rZfjIwmBnAuv1gwmrlR+dHSWA+8QoJxTpRS0N
 v5bWVxc+AvgJFWUrLQtqtiCRKhbR6KF9umbwz5Fuq8Z7PjGsV4I6Pf6kDDNU+1Tt23Yl
 frj1GMMEwvHpIoKhiZRWGk1Yrhw87ULQt/jajLB7xMA8b5STVjqZXbl1WBmAgEJWqT7H
 /2E6UrUFHLAjxX0YVgaSVndxYzarJLtLiRm9ur7345G85Zg39oQR6MZ+6WVyjZPhQZgJ
 AL5EF9+izBn+fwpJ9zjWOYEquJirYUZ6bCbbCAd4ofaZw5+nxyQr6FUH5fIYf/Mahz8v
 xVFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679399364;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BDnUWDZInDFnYugeSsid3+FHARtx+dmCtEpJDk/FNs0=;
 b=LkYRnRVAYOMWv7FAc3h+pOnKcnnAPPrhTTgDFZBOOYQP34RQuaM5z6g/s2416DJuU2
 ceJYOmQdZR1VidnAxa6O/QljkSO8ekS4Cn+5fQUr/GpC0yKs/jKBmBw5s/QcZzUfxuYz
 7Kj97bqBiFPQ0QlZtHvLBBRUSn2l7RsswiQKurF0lp2Sn2dJ+whMs71GwQc2STSklkx4
 xuQGhfcZyUPVKGLer1KvsmLD2DPNKy7vaIjHSOYOKY1A1XJ31177fE7HUTV/xHm2L0NF
 c9J6xGKfrOldO+0XmdsZptMGqCsHLMVrL4lAcKdBIw5eNTd3jOpx1xHaAHKaskUtFUBo
 ML+g==
X-Gm-Message-State: AO0yUKWoX3YkyeSwc35lwYOOHA+9PZVCCCKftpptbqCbbvo3EMUr20d6
 MY/4/uaXoAHV/BvJ2cR79EFIKM4wPl6CHxRZPucTgA==
X-Google-Smtp-Source: AK7set/HoZHTTIIhyIdQUgdmNwwRv9m9mnJbtmkpGSYREW5+8EGKayIkDydSKNajPPm+QY0CwOh50KVjc+awMDabAhA=
X-Received: by 2002:a05:622a:7:b0:3bf:cdf8:61f4 with SMTP id
 x7-20020a05622a000700b003bfcdf861f4mr873031qtw.4.1679399364353; Tue, 21 Mar
 2023 04:49:24 -0700 (PDT)
MIME-Version: 1.0
References: <CAOf5uwkDb=pkEV_qSshA7PnSxCV82sEwrmivAZhth48ae0S++g@mail.gmail.com>
 <87ileu8jwh.fsf@intel.com>
 <CAOf5uw=g1mU1F=kD6M472LRaTWa2B=Sry4GDGXxDApoZknLfeA@mail.gmail.com>
 <87cz528hzk.fsf@intel.com>
In-Reply-To: <87cz528hzk.fsf@intel.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 21 Mar 2023 11:49:13 +0000
Message-ID: <CAPj87rPPA9oYkZyQ=Y3MRuyJUN71WHDWHpdaRUvuXAxFSLW5SA@mail.gmail.com>
Subject: Re: display band (display area vs real visible area)
To: Jani Nikula <jani.nikula@linux.intel.com>
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
Cc: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, 21 Mar 2023 at 11:24, Jani Nikula <jani.nikula@linux.intel.com> wro=
te:
> On Tue, 21 Mar 2023, Michael Nazzareno Trimarchi <michael@amarulasolution=
s.com> wrote:
> > On Tue, Mar 21, 2023 at 11:43=E2=80=AFAM Jani Nikula
> > <jani.nikula@linux.intel.com> wrote:
> >> On Tue, 21 Mar 2023, Michael Nazzareno Trimarchi <michael@amarulasolut=
ions.com> wrote:
> >> > I would like to know the best approach in the graphics subsystem how
> >> > deal with panels where the display area is different from the visibl=
e
> >> > area because the display has a band left and right. I have already
> >> > done the drm driver for the panel but from userspace point of view
> >> > it's a pain to deal in wayland for input device and output device. D=
o
> >> > you have any suggestions?
> >>
> >> Do you have the EDID for the panel?
> >
> > mipi->panel so should not have edid
>
> That's the kind of information you'd expect in the original question. ;)
>
> I've done that sort of thing in the past, but not sure if it would fly
> upstream. Basically the kernel driver would lie about the resolution to
> userspace, and handle the centering and the bands internally. In my
> case, the DSI command mode panel in question had commands to set the
> visible area, so the driver didn't have to do all that much extra to
> make it happen.

There have been some threads - mostly motivated by MacBooks and the
Asahi team - about creating a KMS property to express invisible areas.
This would be the same thing, and the userspace ecosystem will pick it
up when the kernel exposes it.

Cheers,
Daniel
