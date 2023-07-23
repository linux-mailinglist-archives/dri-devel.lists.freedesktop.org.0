Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E366575E3EA
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jul 2023 18:45:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 515AD10E1B3;
	Sun, 23 Jul 2023 16:45:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98A4E10E1B3
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jul 2023 16:45:33 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id
 3f1490d57ef6-ca9804dc6e4so5385480276.0
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jul 2023 09:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690130732; x=1690735532;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3Z4Q/5i212yOfDJHSZ237NJV5w/BOsCv0oJZlIG69OI=;
 b=FNsDYxJQhN4UYlo+NaIAuZ4TSaC1B2tgqtuVqVH3IoE2onNMulPmKxMTcCXNWLO6mV
 O5jSPzamZfi45jV+9vI2ygWXyo1O4wOko8kVYYuXY7HeXuvoscW1iCrKxS6wrT7iTGsv
 J+UxYDIM6aPcGKvps3u0qCPY7+BBssLn5Wk6wMk7M9mrXZyM/7GEhpitJHi4oD0G2TqI
 aeGfLDQ66q11u+wvgjruyRbpAt84zp7O+HhNwRjpAI0gN7mkQzNbzyOezHHQhr1w8dD1
 QuU98M1BjjfDwT2Oqig+C1MbetYUISgzbh4r4KvQ7xLni5Kw35f5QfPIqCP/DTxhDmSP
 GCqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690130732; x=1690735532;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3Z4Q/5i212yOfDJHSZ237NJV5w/BOsCv0oJZlIG69OI=;
 b=JjgRZ+7n/WDkEi1Otylw9ssH2l2aCtOeNzm7LcrYNKBffcvVvt9R8Aw44/qNw0+Pz2
 QhI1+DbkEtdARHJ5RQiFAKu/bnHUVXUanQfQjiLyC3xxImVpSC5x8c/EDvEiehiiRi86
 VzuusVQ9YifNdFyP6PBzGLRboWAQXD9BD8VLer0QYGHq4g5IVdNZhPbln/c8OBU7bLvf
 wVAXeyHzh8nTyem3dOMzqC7g8wVQaVGibZ6Cg9ZCrseXDQ0g0o7KuMEsrX7WAGrkJM63
 NkwLCVWObWpdx961EEr5wmBXb3QTIsaUru180F/a4O55RI5hCGP4lyUTZYIaVqZ2AEgf
 UiYg==
X-Gm-Message-State: ABy/qLYmOObFmXlh+ke0TNguRJM5QKuI39/uTlu4rj9cDMIL5ni6/Sll
 szaVwDQ3O3qs5hK6tN+5J+R8QuLjUJHuP1r1YJWxXw==
X-Google-Smtp-Source: APBJJlHvhLN9VFNppA3TR3b1CrYYc4K0cwFupMPvPmsFSAY7uxPuqkSik5JiuIYuW7MEFv3Fwa4OHPTSm6EZd+QBRhs=
X-Received: by 2002:a25:2642:0:b0:d09:b2b1:9771 with SMTP id
 m63-20020a252642000000b00d09b2b19771mr2708738ybm.14.1690130732609; Sun, 23
 Jul 2023 09:45:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230719152007.197710-1-arnaud.ferraris@collabora.com>
 <20230719152007.197710-3-arnaud.ferraris@collabora.com>
In-Reply-To: <20230719152007.197710-3-arnaud.ferraris@collabora.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 23 Jul 2023 18:45:21 +0200
Message-ID: <CACRpkdZ2Fu8jyyyDd4e1yq8g4bDoj2gCd4KnntST8uYvDNKUZw@mail.gmail.com>
Subject: Re: [PATCH v5 2/2 RESEND] drm: panel: Add novatek nt35596s panel
 driver
To: Arnaud Ferraris <arnaud.ferraris@collabora.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Molly Sophia <mollysophia379@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Arnaud & Molly,

overall the driver looks very good!

On Wed, Jul 19, 2023 at 5:20=E2=80=AFPM Arnaud Ferraris
<arnaud.ferraris@collabora.com> wrote:

> From: Molly Sophia <mollysophia379@gmail.com>
>
> Novatek NT35596s is a generic DSI IC that drives command and video mode
> panels. Add the driver for it. Currently add support for the LCD panel
> from JDI connected with this IC, as found on Xiaomi Mi Mix2s phones.
>
> Signed-off-by: Molly Sophia <mollysophia379@gmail.com>
> Signed-off-by: Arnaud Ferraris <arnaud.ferraris@collabora.com>
(...)

>  .../gpu/drm/panel/panel-novatek-nt36672a.c    | 251 ++++++++++++++++--

So are you sure the nt35596s panel driver is so similar to nt36672a that
they should share the same driver?

With all the magic number sequences I'm not so sure, do they really share
any of the magic numbers?

If not, consider creating a new driver, and then base it on the
nt35510 instead.

> +static const struct nt36672a_panel_cmd jdi_nt35596s_video_on_cmds[] =3D =
{
> +       { .data =3D { 0xff, 0x24 } },
> +       { .data =3D { 0x9d, 0x34 } },
(...)

These are never nice. Do you have a datasheet so you can provide
defines for the magic hex values?

The construction with these .data seqence array
should be replaces with some open coded sequences
I feel, bit this pattern is already in the driver so I guess it's OK.

Yours,
Linus Walleij
