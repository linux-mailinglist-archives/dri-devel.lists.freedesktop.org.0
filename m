Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDE19316E2
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 16:34:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CFD710E3E3;
	Mon, 15 Jul 2024 14:34:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="Tsqkrk/E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E28410E3E3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 14:34:27 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id
 d75a77b69052e-447f8aa87bfso604151cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 07:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1721054066; x=1721658866;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MB4rQjmug6N4wcn/SME+GV1BbTnQz1HQixJgvDFjtTc=;
 b=Tsqkrk/E2eTlHYjIDihoFzkTJbuPqkClT0ZiJfEoVWV3I1ga6zzzzl8Y2lMDP95alA
 ad3r9efE1/Qx9kKWamc8Och/bBCp7MuXqPGvfpxlwBgN+3OOFd7dAd7R2W+gLIhqiKKI
 97bCsQHuvgryNRTLbW2ciYl3BgslBCq1OSjR8Jx49iKyctsLWyRo8uMZr8gs1i6Kgndt
 mmGQNYHZvMfaaZLuMKcPsPwcQ6KPTTRMuM+AJ7Mi+RWerL9s5nePZVcb1Jh1XUsB8JTO
 tox5w0Zvv63c/3jvVR78Pd5rQnHk1qPsLxNF5/w28Js/4YlzIBZxLLSBV1ne/E7rsw3v
 4QMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721054066; x=1721658866;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MB4rQjmug6N4wcn/SME+GV1BbTnQz1HQixJgvDFjtTc=;
 b=vUDeuY/G+my9m5iMu3n66LFm+ZiE09WybJBpGzPq9kUvJIvrVl0H2ZRu7bxOz/xt49
 lTMKAl1u39iE2C5a1DCas7mnwP+bc5B6ReaOP4HPx9sN7ciNW/8ench0969vNfNkqwVU
 tc/ekwRKsxVshqKTpvXQmnQ45/h/z/WI9AnOnANcZCW57n2twDN6jKDzBlcRrfSvJjof
 +aDT6hnJP5aolNYOFXllRzFkVc9V/ECaLARN4AQykkIjoIM6PvADqhEzEcFtYJGbFJbs
 oOK9W8ZDGpB5TOa0Ye8411ck30r5pLm+5PoNAQlbdjV4tTm3SXUYyvyTwSlr1Sk/4LnZ
 8d/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZ8WTCONaBrJDt54oXZXpWHy8aFtBPFVepeGGAxz6k4zW0lGjIgJVSXIn+f9T7nr+Gnq8gbK7XBusC/roPFH9fs0yqoOggbqwKAxMYz74x
X-Gm-Message-State: AOJu0YzN6B1ylpI7YTWV+ap2zevuUrXxRL+5TibuUDwWoaAYYvSvFaFQ
 QJeNK3oYgU81AzyJ+xg7aIbNX3JpYXEddqxavIQdBqvv1JyDCIWXvXabbbxOUZhgxDW54L/szdo
 jJIa8hjA/3zJkNupXwJuyUrM6E5P4RvJ3uIdq
X-Google-Smtp-Source: AGHT+IHX3BUsteHRiWVEg9D4BeNaoIXbyh5/FHeFNn3GktcpmPw80Bqv38Kic6vZA9oZXwMEVS705n1HBIXsOi9XxDk=
X-Received: by 2002:a05:622a:2591:b0:447:f5de:bd18 with SMTP id
 d75a77b69052e-44f5ac8f6b7mr5296781cf.9.1721054066218; Mon, 15 Jul 2024
 07:34:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240715073159.25064-1-lvzhaoxiong@huaqin.corp-partner.google.com>
 <20240715073159.25064-2-lvzhaoxiong@huaqin.corp-partner.google.com>
 <CAD=FV=VHDksKiZXrauiipa3HjtK4sE5+dbmXmVfhFoM-RKQP6A@mail.gmail.com>
 <20240715-bunkhouse-freeness-c4367d3c298d@spud>
In-Reply-To: <20240715-bunkhouse-freeness-c4367d3c298d@spud>
From: Doug Anderson <dianders@google.com>
Date: Mon, 15 Jul 2024 07:34:14 -0700
Message-ID: <CAD=FV=UtBhbfAAx41WWpQspK6SpCh6W5w+ogqFxogPm3omMn_A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: HID: i2c-hid: elan: Introduce Elan
 ekth6a12nay
To: Conor Dooley <conor@kernel.org>
Cc: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>,
 dmitry.torokhov@gmail.com, 
 robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 jikos@kernel.org, linus.walleij@linaro.org, hsinyi@google.com, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Benjamin Tissoires <bentiss@kernel.org>
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

Hi,

On Mon, Jul 15, 2024 at 7:31=E2=80=AFAM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Mon, Jul 15, 2024 at 07:22:30AM -0700, Doug Anderson wrote:
> > Hi,
> >
> > On Mon, Jul 15, 2024 at 12:32=E2=80=AFAM Zhaoxiong Lv
> > <lvzhaoxiong@huaqin.corp-partner.google.com> wrote:
> > >
> > > The Elan ekth6a12nay touch screen chip same as Elan eKTH6915 controll=
er
> > > has a reset gpio. The difference is that they have different
> > > post_power_delay_ms.
> > >
> > > Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.c=
om>
> > > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> >
> > FWIW things have changed enough between V1 and V2 that you probably
> > should have removed Conor's "Acked-by" tag here and waited for him to
> > re-add it.
>
> Yeah, good spot. I wouldn't have acked this version would asking
> questions - in v1 it made sense not to have a fallback when "they have a
> different post power delay ms", but now there is a fallback. Is the
> fallback actually suitable here, or might it be a naive rebase? Does the
> ekth6a12nay work with the ekth6915's reset timing?

Oh, good point! Yeah, it should be changed so that "ekth6915" isn't a
fallback. ...so I will rescind my Reviewed-by until that's handled.
:-/

-Doug
