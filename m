Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 838746D7FBC
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 16:39:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5562710E093;
	Wed,  5 Apr 2023 14:39:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com
 [IPv6:2607:f8b0:4864:20::1130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0CFE10E093
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 14:39:20 +0000 (UTC)
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-54bfce685c1so12000547b3.1
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Apr 2023 07:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1680705559;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aJ6RuEVwPam0737ApO2W3Sns6RK7LLBkjFfALrSZ1fE=;
 b=gXsbV+8xJahCOilBkTtclDJKiuwTzKvnFFfQYjc8X9STwsp5m6Pl3/6tJ/fS1QdeSF
 hfmxhvieMnpnLEQVvpyLJGR+K3B618UvmSiANJwhnyHB8zavr9bSN2OfqycRQcAoFekB
 R19uuxr1844D08TOIlA95KWek/w58Di4WTHKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680705559;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aJ6RuEVwPam0737ApO2W3Sns6RK7LLBkjFfALrSZ1fE=;
 b=fP3EsZNj+ihBAHcwU9p+gHtQZtXVAaL/VYUqc//Xdx+fzD07PyfCz0XBQ0eDbmeIKg
 j91AijWnHajRlG2x4IxTuE9PHhYDWnUaLG2gN6GPOmwkkiZErOs3uY7hgwp7y45ipvfN
 IlW8adGYVoZga5rTTli1OpmmO/EodNNZscuX4wzKri7GSps2GR6KEZXr4N36ZQkKEfww
 F7Oz1KwmOf5PxeYhjXdtXWCX/O4j+dQMw6CP6C1p563suWxVIWP62IR7mmzrQ1LNCI8N
 egFAy2hrKAI/8JBMlxljLTeJX33P9IfjKXS2JlGe28MVo7n778ZL2twGZgPdzxI3ki7G
 kB/w==
X-Gm-Message-State: AAQBX9e7iM23Z6IrlSvnqmZ9CRJL1XWjszYbsfk3s3CSmBeeT8vEYiJ/
 aiEiXVl1VtXMnWhfGKxe8yCiS7o8dNyG+XvBL4Xzm5xGKdIlanSyytkPRA==
X-Google-Smtp-Source: AKy350YDa1JT0zhzXuEGbBUoVaiqHYGDoTsJ8ujfmMmX1Ko/b+PBwIfbzswejkw1cqKJQSTbHyYb6Y6ZldD2mqZBj7A=
X-Received: by 2002:a81:b108:0:b0:545:f7cc:f30 with SMTP id
 p8-20020a81b108000000b00545f7cc0f30mr3548192ywh.0.1680705559181; Wed, 05 Apr
 2023 07:39:19 -0700 (PDT)
MIME-Version: 1.0
References: <2991779.e9J7NaK4W3@steina-w>
In-Reply-To: <2991779.e9J7NaK4W3@steina-w>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 5 Apr 2023 20:09:07 +0530
Message-ID: <CAMty3ZAQyADGLVcB13qJdEy_BiZEKpyDfCr9QrM-ucFLFPZLcw@mail.gmail.com>
Subject: Re: RFC: DSI/DRM multiplexer bridge
To: Alexander Stein <alexander.stein@ew.tq-group.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 5, 2023 at 7:39=E2=80=AFPM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Hi,
>
> my platform has a DIP switch controlled multiplexer for MIPI DSI output
> signals. One output has a TI SN65DSI84 (LVDS) and the other output has a =
TI
> SN65DSI86 (eDP) attached to it. The Multiplexer status can be read back f=
rom a
> GPIO. The GPIO is also IRQ capable, so it would be possible to support ho=
tplug
> additionally later on.

I have this requirement a year back [1] but my design has i.mx8mq DSI
outputs to SN65DSI84(LVDS) and ADV7533 (HDMI) and GPIO has muxed as
IRQ in order to find the bridge selection. (not confused with HDMI
HPD).

>
> My initial idea was to create a DRM multiplexer bridge driver which (depe=
nding
> on the input GPIO) allows only one output to be enabled. Unfortunately ti=
-
> sn65dsi86.c driver expects a DSI host on remote node 0 (see ti_sn_attach_=
host
> and ti_sn_bridge_parse_dsi_host), so it does not work. ti-sn65dsi83.c jus=
t
> requires a drm_bridge.

Yes, we need to have a finite amount of pipeline changes. assuming
that your mux bridge sits between DSI to Output interfaces the
proposed mux bridge selects which pipeline.

>
> What is the best approach for this? I currently see two approaches:
> * Create an explicit DSI/DRM multiplexer bridge driver which registers it=
self
> as DSI host
> * Create a DRM multiplexer bridge (only). But this needs to remove the DS=
I
> device registration from ti-sn65dsi86.c

Based on my experience, having a muxed bridge between in and out would
be proper in order to satisfy the pipeline as well as the design. That
mux bridge has to be a normal bridge doesn't aware of DSI or any other
interface like one of the submissions has done in the recent mailing
list. [2] Things would be complicated when we switch the outputs but
we still use normal static switching of outputs in a proper way.

>
> I am aware that DSI support is suboptimal, so I'm not sure which approach=
 on
> the TI bridge drivers is the correct one and needs to be considered as gi=
ven.
> Any ideas?

I did implement some complicated things of switching outputs at
runtime but the idea of the switching pipelines would be similar if
you want to implement it in a normal static way. Here are some details
and a demo of how those been worked. [3] [4]

[1] https://lore.kernel.org/all/CAMty3ZD7eFi4o7ZXNtjShoLd5yj3wn85Fm6ZNL89=
=3DQpWj44KPw@mail.gmail.com/T/
[2] https://patchwork.kernel.org/project/dri-devel/patch/20230218111712.238=
0225-6-treapking@chromium.org/
[3] https://indico.freedesktop.org/event/2/contributions/76/
[4] https://www.youtube.com/watch?v=3DPoYdP9fPn-4&t=3D624s

Thanks,
Jagan.
